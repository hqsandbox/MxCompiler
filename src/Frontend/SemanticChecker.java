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

import java.util.concurrent.atomic.AtomicBoolean;

public class SemanticChecker implements ASTVisitor {

    private Scope gScope;
    private Scope currentScope;

    public String currentClassName = null;

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
        currentClassName = it.name;

        it.varList.forEach(vd -> vd.accept(this));
        it.funcList.forEach(fd -> fd.accept(this));
        // TODO: not sure，构造函数没写

        // 错误：要将当前的scope改为 parentScope
        currentScope = currentScope.parentScope();
        currentClassName = null;
    }

    @Override public void visit(FunctionDef it) {
        currentScope = new Scope(currentScope);
        FuncInfor func = new FuncInfor(it);
        currentScope.addFuncInfo(it.name, func, it.pos);

        if(it.returnType.isClass && !gScope.containsClass(it.returnType.typeName, true)) {
            throw new semanticError("return type " + it.returnType.typeName + " not defined", it.pos);
        }
        if(it.name.equals("main") && !it.parameters.isEmpty()) {
            throw new semanticError("main function should not have parameters", it.pos);
        }
        if(it.name.equals("main") && !it.returnType.isInt) {
            throw new semanticError("main function should return int", it.pos);
        }
        for(int i = 0; i < it.parameters.size(); i++) {
            if(it.parameters.get(i).isClass && !gScope.containsClass(it.parameters.get(i).typeName, true)) {
                throw new semanticError("parameter type " + it.parameters.get(i).typeName + " not defined", it.pos);
            }
            for(int j = i + 1; j < it.parameters.size(); j++) {
                if(it.parameterNames.get(i).equals(it.parameterNames.get(j))) {
                    throw new semanticError("redefinition of parameter " + it.parameterNames.get(i), it.pos);
                }
            }
            // 错误：要将参数加入到当前的scope中
//            if(currentScope.variInfor.containsKey(it.parameterNames.get(i))) {
//                throw new semanticError("redefinition of variable " + it.parameterNames.get(i), it.pos);
//            }
//            if(currentScope.funcInfor.containsKey(it.parameterNames.get(i))) {
//                throw new semanticError("redefinition of function " + it.parameterNames.get(i), it.pos);
//            }
            currentScope.defineVariable(it.parameterNames.get(i), it.parameters.get(i), it.pos, false);
        }

        if(it.body.stmt.isEmpty()) {
            if(!it.returnType.isVoid && !it.name.equals("main")) {
                throw new semanticError("return type of non-void function should have return statement", it.pos);
            }
            currentScope = currentScope.parentScope();
            return;
        }

        AtomicBoolean hasReturn = new AtomicBoolean(false);
        it.body.stmt.forEach(stmt -> {
            stmt.accept(this);
            if (stmt instanceof ReturnStmt) {
                // 错误：要考虑到 return的情况
                if(((ReturnStmt) stmt).expr == null) {
                    if(!it.returnType.isVoid) {
                        throw new semanticError("return type not match", it.pos);
                    }
                }
                if(((ReturnStmt) stmt).expr != null) {
                    if(it.returnType.isVoid) {
                        throw new semanticError("return type of void function should not have return statement", it.pos);
                    }
                    if(!it.returnType.canAssign(((ReturnStmt) stmt).expr.type)) {
                        throw new semanticError("return type not match", it.pos);
                    }
                }
                hasReturn.set(true);
            }
        });
        if(!hasReturn.get() && !it.returnType.isVoid && !it.name.equals("main")) {
            throw new semanticError("return type of non-void function should have return statement", it.pos);
        }

        currentScope = currentScope.parentScope();
    }

    @Override public void visit(VariableDef it) {
        if(it.type.isClass && !gScope.containsClass(it.type.typeName, true)) {
            throw new semanticError("class " + it.type.typeName + " not defined", it.pos);
        }
        for(var iv : it.initVariablelist) {
            iv.accept(this);
            if(iv.init == null) continue;
            if(!it.type.canAssign(iv.init.type)) {
                throw new semanticError("type not match", it.pos);
            }
        }
    }

    @Override public void visit(InitVariable it) {
        if(currentScope.variInfor.containsKey(it.name))
            throw new semanticError("redefinition of variable " + it.name, it.pos);
        if(it.init != null) {
            it.init.accept(this);
            if(!it.type.canAssign(it.init.type)) {
                throw new semanticError("type not match", it.pos);
            }
        }
        if(currentScope.variInfor.containsKey(it.name)) {
            throw new semanticError("redefinition of variable " + it.name, it.pos);
        }
        if(currentScope.funcInfor.containsKey(it.name)) {
            throw new semanticError("redefinition of function " + it.name, it.pos);
        }
        currentScope.defineVariable(it.name, it.type, it.pos, false);
    }

    @Override public void visit(ArrayExpr it) {
        it.baseType.accept(this);
        it.size.accept(this);
        if(!it.size.type.isInt || it.size.type.dim > 0) {
            throw new semanticError("type not match", it.pos);
        }
        // 错误：处理 new int[1][][1]的情况，这里 new int [1][]被解释为 NewArrayExpr
        if(it.baseType instanceof NewArrayExpr) {
            throw new semanticError("type not match", it.pos);
        }
        it.type = new Type(it.baseType.type);
        it.type.dim = it.baseType.type.dim - 1;
    }
    @Override public void visit(AssignExpr it) {
        it.lhs.accept(this);
        if(!it.lhs.isAssignable) {
            throw new semanticError("left value is not assignable", it.pos);
        }
        it.rhs.accept(this);
        if(!it.lhs.type.canAssign(it.rhs.type)) {
            throw new semanticError("type not match", it.pos);
        }

    }
    @Override public void visit(BinaryExpr it) {
        it.lhs.accept(this);
        it.rhs.accept(this);
        switch (it.op){
            case "<", ">", "<=", ">=" -> {
                if(it.lhs.type.isString && it.rhs.type.isString) {
                    it.type = new Type();
                    it.type.setBool();
                } else if(it.lhs.type.isInt && it.rhs.type.isInt
                        && it.lhs.type.dim == 0 && it.rhs.type.dim == 0) {
                    it.type = new Type();
                    it.type.setBool();
                } else {
                    throw new semanticError("type not match", it.pos);
                }
            }
            case "+" -> {
                if(it.lhs.type.isInt && it.rhs.type.isInt
                        && it.lhs.type.dim == 0 && it.rhs.type.dim == 0) {
                    it.type = new Type();
                    it.type.setInt();
                } else if(it.lhs.type.isString && it.rhs.type.isString) {
                    it.type = new Type();
                    it.type.setString();
                } else {
                    throw new semanticError("type not match", it.pos);
                }
            }
            case "&&", "||" -> {
                if(!it.lhs.type.isBool || !it.rhs.type.isBool) {
                    throw new semanticError("type not match", it.pos);
                }
                it.type = new Type();
                it.type.setBool();
            }
            case "==", "!=" -> {
                // TODO
                if(!it.lhs.type.equalType(it.rhs.type)) {
                    throw new semanticError("type not match", it.pos);
                }
                it.type = new Type();
                it.type.setBool();
            }
            case "*", "/", "%", "-", ">>", "<<", "&", "|", "^" -> {
                if(!it.lhs.type.isInt || !it.rhs.type.isInt) {
                    throw new semanticError("type not match", it.pos);
                }
                if(it.lhs.type.dim > 0 || it.rhs.type.dim > 0) {
                    throw new semanticError("type not match", it.pos);
                }
                it.type = new Type();
                it.type.setInt();
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
        if(!gScope.containsFunc(it.funcName, true)) {
            throw new semanticError("function " + it.funcName + " not defined", it.pos);
        }
        FuncInfor func = gScope.getFuncInfo(it.funcName);
        if(it.callExpList.expList.size() != func.paraTypeList.size()) {
            throw new semanticError("parameter number not match", it.pos);
        }
        for(int i = 0; i < it.callExpList.expList.size(); i++) {
            it.callExpList.expList.get(i).accept(this);
            if(!it.callExpList.expList.get(i).type.equalType(func.paraTypeList.get(i))) {
                throw new semanticError("type not match", it.pos);
            }
        }
        it.type = new Type(func.returnType);
    }
    @Override public void visit(MemberExpr it) {
        it.base.accept(this);
        if(!it.base.type.isClass) {
            throw new semanticError("invalid caller type", it.pos);
        }
        if(!gScope.containsClass(it.base.type.typeName, true)) {
            throw new semanticError("class " + it.base.type.typeName + " not defined", it.pos);
        }
        ClassInfor struct = gScope.getClassInfo(it.base.type.typeName);
        if(struct.variList.get(it.memberName) == null) {
            throw new semanticError("variable " + it.memberName + " not defined", it.pos);
        }
        it.type = new Type(struct.variList.get(it.memberName));
        it.isAssignable = true;
    }
    @Override public void visit(MethodCallExpr it) {
        // 错误：这里 base一定要 visit一下
        it.base.accept(this);
        // 错误：要判断 it.callExpList != null
        if(it.callExpList != null){
            it.callExpList.accept(this);
        }
        if(it.base.type.dim > 0) {
            if(!it.methodName.equals("size")) {
                throw new semanticError("invalid caller type", it.pos);
            }
            it.type = new Type();
            it.type.setInt();
            it.isAssignable = false;
            return;
        }
        if(it.base.type.isClass && !gScope.containsClass(it.base.type.typeName, true)) {
            throw new semanticError("class " + it.base.type.typeName + " not defined", it.pos);
        }
        if(!it.base.type.isString && !it.base.type.isClass) {
            throw new semanticError("invalid caller type", it.pos);
        }
        ClassInfor struct = gScope.getClassInfo(it.base.type.typeName);
        if(struct.funcList.get(it.methodName) == null) {
            throw new semanticError("function " + it.methodName + " not defined", it.pos);
        }
        FuncInfor func = struct.funcList.get(it.methodName);
        if(it.callExpList != null){
            if(it.callExpList.expList.size() != func.paraTypeList.size()) {
                throw new semanticError("parameter number not match", it.pos);
            }
            for(int i = 0; i < it.callExpList.expList.size(); i++) {
                if(!it.callExpList.expList.get(i).type.equalType(func.paraTypeList.get(i))) {
                    throw new semanticError("type not match", it.pos);
                }
            }
        }
        it.type = new Type(func.returnType);
    }
    @Override public void visit(NewArrayExpr it) {
        if(it.baseType.isVoid || it.baseType.isNull || it.baseType.dim > 0) {
            throw new semanticError("invalid array type", it.pos);
        }
        if(it.baseType.isClass && !gScope.containsClass(it.baseType.typeName, true)) {
            throw new semanticError("class " + it.baseType.typeName + " not defined", it.pos);
        }
        // TODO
        if(!it.size.isEmpty()) {
            it.size.forEach(e -> e.accept(this));
            for(var e : it.size) {
                if(!e.type.isInt || e.type.dim > 0) {
                    throw new semanticError("type not match", it.pos);
                }
            }
        }
    }
    @Override public void visit(NewVarExpr it) {
        if(it.type.isVoid || it.type.isNull || it.type.dim > 0) {
            throw new semanticError("invalid type", it.pos);
        }
        if(it.type.isClass && !gScope.containsClass(it.type.typeName, true)) {
            throw new semanticError("class " + it.type.typeName + " not defined", it.pos);
        }
        if(currentScope.variInfor.containsKey(it.varName)) {
            throw new semanticError("redefinition of variable " + it.varName, it.pos);
        }
        if(currentScope.funcInfor.containsKey(it.varName)) {
            throw new semanticError("redefinition of function " + it.varName, it.pos);
        }
        currentScope.defineVariable(it.varName, it.type, it.pos, false);
    }
    @Override public void visit(ParallelExp it) {
        // 错误：这里不能为空，要visit一下，比如 println(s2.substring(0, getInt()));中的 getInt()
        it.expList.forEach(e -> e.accept(this));
    }
    @Override public void visit(ParenExpr it) {
        it.expr.accept(this);
        it.type = new Type(it.expr.type);
    }
    @Override public void visit(PostfixExpr it) {
        it.expr.accept(this);
        if(!it.expr.type.isInt || it.expr.type.dim > 0) {
            throw new semanticError("type not match", it.pos);
        }
    }
    @Override public void visit(PrefixExpr it) {
        it.expr.accept(this);
        if(!it.expr.type.isInt || it.expr.type.dim > 0) {
            throw new semanticError("type not match", it.pos);
        }
    }
    @Override public void visit(PrimaryExpr it) {
        if(it.isIdentifier){
            if(currentScope.containsVariable(it.identifier, true)) {
                it.type = currentScope.getType(it.identifier, true);
            } else if(gScope.containsClass(it.identifier, true)) {
                it.type = gScope.getType(it.identifier, true);
            } else {
                throw new semanticError(it.identifier + " not defined", it.pos);
            }
            it.isAssignable = true;
        } else if(it.isThis) {
            if(currentClassName == null) {
                throw new semanticError("this should be in class", it.pos);
            }
            it.type = new Type();
            it.type.setClass(currentClassName);
            it.isAssignable = true;
        } else if(it.isIntLiteral) {
            it.type = new Type();
            it.type.setInt();
        } else if(it.isTrue || it.isFalse) {
            it.type = new Type();
            it.type.setBool();
        } else if(it.isNull) {
            it.type = new Type();
            it.type.setNull();
        } else if(it.isStringLiteral) {
            it.type = new Type();
            it.type.setString();
        } else if(it.isFmtString) {
            it.type = new Type();
            it.type.setString();
        }
    }
    @Override public void visit(UnaryExpr it) {
        switch (it.op) {
            case "+", "-", "~" -> {
                it.expr.accept(this);
                if(!it.expr.type.isInt || it.expr.type.dim > 0) {
                    throw new semanticError("type not match", it.pos);
                }
                it.type = new Type();
                it.type.setInt();
            }
            case "!" -> {
                it.expr.accept(this);
                if(!it.expr.type.isBool) {
                    throw new semanticError("type not match", it.pos);
                }
                it.type = new Type();
                it.type.setBool();
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

