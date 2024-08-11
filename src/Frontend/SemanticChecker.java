package Frontend;

import AST.*;
import AST.Def.*;
import AST.Expr.*;
import AST.Stmt.*;
import Util.Scope;
import Util.Type;
import Util.error.semanticError;
import Util.infor.ClassInfor;
import Util.infor.FuncInfor;

public class SemanticChecker implements ASTVisitor {

    private Scope gScope;
    private Scope currentScope;

    public SemanticChecker(Scope gScope) {
        currentScope = this.gScope = gScope;
    }

    @Override public void visit(Program it) {
        boolean mainExist = false;
        for(var def : it.defList) {
            if(def.funcDef != null) {
                // 错误：不能用 instanceof
                if(def.funcDef.name.equals("main") && !mainExist) {
                    mainExist = true;
                    continue;
                }
                if(def.funcDef.name.equals("main") && mainExist) {
                    throw new semanticError("multiple definition of main function", def.pos);
                }
            }
        }
        if(!mainExist) {
            throw new semanticError("no main function", it.pos);
        }

        for(var def : it.defList) {
            def.accept(this);
        }
    }

    @Override public void visit(Definition it) {
        // 错误：不能用 instanceof
        // 错误：it后面要加上.funcDef
        if(it.funcDef != null) {
            it.funcDef.accept(this);
        } else if(it.classDef != null) {
            it.classDef.accept(this);
        } else if(it.variDef != null) {
            it.variDef.accept(this);
        }
    }

    @Override public void visit(ClassTypeDef it) {
        currentScope = new Scope(currentScope);
        ClassInfor struct = new ClassInfor(it);
        currentScope.addClassInfo(it.name, struct, it.pos);

        it.varList.forEach(vd -> vd.accept(this));
        it.funcList.forEach(fd -> fd.accept(this));
        // TODO: not sure，构造函数没写

        currentScope.parentScope();
    }

    @Override public void visit(FunctionDef it) {
        currentScope = new Scope(currentScope);
        FuncInfor func = new FuncInfor(it);
        currentScope.addFuncInfo(it.name, func, it.pos);

        if(it.returnType.isClass && !gScope.containsClass(it.returnType.typeName)) {
            throw new semanticError("return type " + it.returnType.typeName + " not defined", it.pos);
        }
        if(it.name.equals("main") && !it.parameters.isEmpty()) {
            throw new semanticError("main function should not have parameters", it.pos);
        }
        for(int i = 0; i < it.parameters.size(); i++) {
            if(it.parameters.get(i).isClass && !gScope.containsClass(it.parameters.get(i).typeName)) {
                throw new semanticError("parameter type " + it.parameters.get(i).typeName + " not defined", it.pos);
            }
            for(int j = i + 1; j < it.parameters.size(); j++) {
                if(it.parameterNames.get(i).equals(it.parameterNames.get(j))) {
                    throw new semanticError("redefinition of parameter " + it.parameterNames.get(i), it.pos);
                }
            }
        }

        // TODO: check return type same?
        if(it.body.stmt.getLast() instanceof ReturnStmt) {
            if(it.returnType.isVoid) {
                throw new semanticError("return type of void function should not have return statement", it.pos);
            }
        } else {
            if(!it.returnType.isVoid && !it.name.equals("main")) {
                throw new semanticError("return type of non-void function should have return statement", it.pos);
            }
        }
        it.body.stmt.forEach(stmt -> stmt.accept(this));

        currentScope.parentScope();
    }

    @Override public void visit(VariableDef it) {
        if(it.type.isClass && !gScope.containsClass(it.type.typeName)) {
            throw new semanticError("class " + it.type.typeName + " not defined", it.pos);
        }
        for(var iv : it.initVariablelist) {
            iv.accept(this);
            if(!it.type.canAssign(iv.init.type)) {
                throw new semanticError("type not match", it.pos);
            }
        }
    }

    @Override public void visit(InitVariable it) {
        if(currentScope.variInfor.containsKey(it.name))
            throw new semanticError("redefinition of variable " + it.name, it.pos);
        if(!it.type.equalType(it.init.type)) {
            throw new semanticError("type not match", it.pos);
        }
    }

    @Override public void visit(ArrayExpr it) {
        it.baseType.accept(this);
        if(it.baseType.type.dim == 0) {
            throw new semanticError("type not match", it.pos);
        }
        it.size.accept(this);
        if(!it.size.type.isInt) {
            throw new semanticError("type not match", it.pos);
        }
        it.type = new Type(it.baseType.type);
        it.type.dim--;
    }
    @Override public void visit(AssignExpr it) {
        it.lhs.accept(this);
        if(!it.lhs.isAssignable) {
            throw new semanticError("left value is not assignable", it.pos);
        }
        it.rhs.accept(this);
        if(it.lhs.type.canAssign(it.rhs.type)) {
            throw new semanticError("type not match", it.pos);
        }

    }
    @Override public void visit(BinaryExpr it) {
        it.lhs.accept(this);
        it.rhs.accept(this);
        switch (it.op){
            case "+", "<", ">", "<=", ">=" -> {
                // TODO
                if(!it.lhs.type.isInt || !it.rhs.type.isInt) {
                    throw new semanticError("type not match", it.pos);
                }
            }
            case "&&", "||" -> {
                if(!it.lhs.type.isBool || !it.rhs.type.isBool) {
                    throw new semanticError("type not match", it.pos);
                }
            }
            case "==", "!=" -> {
                if(!it.lhs.type.equalType(it.rhs.type)) {
                    throw new semanticError("type not match", it.pos);
                }
            }
            case "*", "/", "%", "-", ">>", "<<", "&", "|", "^" -> {
                if(!it.lhs.type.isInt || !it.rhs.type.isInt) {
                    throw new semanticError("type not match", it.pos);
                }
            }
        }
    }
    @Override public void visit(ConditionalExpr it) {
        if(!it.condition.type.isBool) {
            throw new semanticError("type not match", it.pos);
        }
        it.condition.accept(this);
        if(!it.trueBranch.type.equalType(it.falseBranch.type)) {
            throw new semanticError("type not match", it.pos);
        }
        it.trueBranch.accept(this);
        it.falseBranch.accept(this);
    }
    @Override public void visit(Expression it) {
        it.accept(this);
    }
    @Override public void visit(FuncCallExpr it) {
        if(!gScope.containsFunc(it.funcName)) {
            throw new semanticError("function " + it.funcName + " not defined", it.pos);
        }
        FuncInfor func = gScope.getFuncInfo(it.funcName);
        if(it.callExpList.expList.size() != func.paraTypeList.size()) {
            throw new semanticError("parameter number not match", it.pos);
        }
        for(int i = 0; i < it.callExpList.expList.size(); i++) {
            if(!it.callExpList.expList.get(i).type.equalType(func.paraTypeList.get(i))) {
                throw new semanticError("type not match", it.pos);
            }
        }
    }
    @Override public void visit(MemberExpr it) {}
    @Override public void visit(MethodCallExpr it) {
        it.callExpList.accept(this);
        if(it.base.type.isVoid || it.base.type.isNull) {
            throw new semanticError("invalid caller type", it.pos);
        }
        if(it.base.type.dim > 0) {
            throw new semanticError("invalid caller type", it.pos);
        }
        if(it.base.type.isClass && !gScope.containsClass(it.base.type.typeName)) {
            throw new semanticError("class " + it.base.type.typeName + " not defined", it.pos);
        }
        if(!gScope.containsFunc(it.methodName)) {
            throw new semanticError("function " + it.methodName + " not defined", it.pos);
        }
        FuncInfor func = gScope.getFuncInfo(it.methodName);
        if(it.callExpList.expList.size() != func.paraTypeList.size()) {
            throw new semanticError("parameter number not match", it.pos);
        }
        for(int i = 0; i < it.callExpList.expList.size(); i++) {
            if(!it.callExpList.expList.get(i).type.equalType(func.paraTypeList.get(i))) {
                throw new semanticError("type not match", it.pos);
            }
        }
    }
    @Override public void visit(NewArrayExpr it) {
        if(it.baseType.isVoid || it.baseType.isNull || it.baseType.dim > 0) {
            throw new semanticError("invalid array type", it.pos);
        }
        if(it.baseType.isClass && !gScope.containsClass(it.baseType.typeName)) {
            throw new semanticError("class " + it.baseType.typeName + " not defined", it.pos);
        }
        // TODO
    }
    @Override public void visit(NewVarExpr it) {
        if(it.type.isVoid || it.type.isNull || it.type.dim > 0) {
            throw new semanticError("invalid type", it.pos);
        }
        if(it.type.isClass && !gScope.containsClass(it.type.typeName)) {
            throw new semanticError("class " + it.type.typeName + " not defined", it.pos);
        }
        currentScope.defineVariable(it.varName, it.type, it.pos);
    }
    @Override public void visit(ParallelExp it) {}
    @Override public void visit(ParenExpr it) {}
    @Override public void visit(PostfixExpr it) {
        it.expr.accept(this);
        if(!it.expr.type.isInt) {
            throw new semanticError("type not match", it.pos);
        }
    }
    @Override public void visit(PrefixExpr it) {
        it.expr.accept(this);
        if(!it.expr.type.isInt) {
            throw new semanticError("type not match", it.pos);
        }
    }
    @Override public void visit(PrimaryExpr it) {}
    @Override public void visit(UnaryExpr it) {
        switch (it.op) {
            case "+", "-", "~", "!" -> {
                it.expr.accept(this);
                if(!it.expr.type.isInt && !it.expr.type.isBool) {
                    throw new semanticError("type not match", it.pos);
                }
            }
        }
    }

    @Override public void visit(BreakStmt it) {}
    @Override public void visit(ContinueStmt it) {}
    @Override public void visit(ExprStmt it) {
        it.expr.accept(this);
    }
    @Override public void visit(ForStmt it) {
        currentScope = new Scope(currentScope);
        if(it.parallelExp != null) it.parallelExp.accept(this);
        if(it.variableDef != null) it.variableDef.accept(this);
        if(it.conditionExp != null){
            it.conditionExp.accept(this);
            if (!it.conditionExp.type.isBool) {
                throw new semanticError("type not match", it.pos);
            }
        }
        if(it.stepExp != null) it.stepExp.accept(this);
        it.stmt.accept(this);
        currentScope = currentScope.parentScope();
    }
    @Override public void visit(IfStmt it) {
        it.condition.accept(this);
        if(!it.condition.type.isBool) {
            throw new semanticError("type not match", it.pos);
        }
        if(it.thenStmt != null) {
            currentScope = new Scope(currentScope);
            it.thenStmt.accept(this);
            currentScope = currentScope.parentScope();
        }
        if(it.elseStmt != null) {
            currentScope = new Scope(currentScope);
            it.elseStmt.accept(this);
            currentScope = currentScope.parentScope();
        }
    }
    @Override public void visit(ReturnStmt it) {
        if(it.expr != null) {
            it.expr.accept(this);
            if(!it.expr.type.equalType(currentScope.getType("return", false))) {
                throw new semanticError("type not match", it.pos);
            }
        }
    }
    @Override public void visit(Suite it) {
        currentScope = new Scope(currentScope);
        it.stmt.forEach(stmt -> stmt.accept(this));
        currentScope = currentScope.parentScope();
    }
    @Override public void visit(VariableDefStmt it) {
        it.variableDef.accept(this);
    }
    @Override public void visit(WhileStmt it) {
        it.condition.accept(this);
        if(!it.condition.type.isBool) {
            throw new semanticError("type not match", it.pos);
        }
        currentScope = new Scope(currentScope);
        it.body.accept(this);
        currentScope = currentScope.parentScope();
    }
}

