package IR;

import AST.ASTVisitor;
import AST.Def.*;
import AST.Expr.*;
import AST.Program;
import AST.Stmt.*;
import IR.Util.Counter;
import IR.Util.LoopScope;
import IR.Util.ReNamer;
import IR.definition.IRClassDef;
import IR.definition.IRFuncDef;
import IR.definition.IRGlobalVariDef;
import IR.entity.*;
import IR.instruction.*;
import Util.Scope;
import Util.error.semanticError;
import Util.infor.ClassInfor;
import Util.infor.FuncInfor;
import Util.type.IRType;
import Util.type.Type;

public class IRBuilder implements ASTVisitor {

    public IRProgram irProgram = new IRProgram();
    public Scope gScope;
    public LoopScope currentScope;
    public ReNamer currentReNamer;
    public IRBlock currentBlock;
    public String currentClassName = null;
    public IREntity currentEntity = null;
    public IRVariable currentPtr = null;
    public IRFuncDef currentFunc = null;
    public Counter counter; // 记录各种变量的数量以免重名

    // 凡是dim > 0的类型，都是ptr类型
    public IRType Type_To_IRType(Type type){
        IRType irType = new IRType();
        if(type.dim > 0 || type.isString || type.isNull || type.isClass){
            irType.setPtr();
        }else if(type.isVoid){
            irType.setVoid();
        }else if(type.isInt){
            irType.setI32();
        }else if(type.isBool){
            irType.setI1();
        }
        return irType;
    }

    public IRBuilder(IRProgram irProgram, Scope gScope) {
        this.irProgram = irProgram;
        this.gScope = gScope;
        currentScope = new LoopScope(null);
        currentReNamer = new ReNamer(null);
        counter = new Counter();
    }

    @Override public void visit(Program it) {
        for(var def : it.defList) {
            def.accept(this);
        }
    }

    @Override public void visit(Definition it) {
        if(it == null) return;
        if(it.funcDef != null) {
            it.funcDef.accept(this);
        } else if(it.classDef != null) {
            it.classDef.accept(this);
        } else if(it.variDef != null) {
            it.variDef.accept(this);
        }
    }

    @Override public void visit(ClassTypeDef it) {
        currentClassName = it.name;
        ClassInfor struct = new ClassInfor(it);

        IRClassDef irClassDef = new IRClassDef(it.name);
        irProgram.classDefMap.put(it.name, irClassDef);
        it.varList.forEach(vd -> {
            vd.accept(this);
            irClassDef.variableDefList.add(vd);
        });
        it.funcList.forEach(fd -> fd.accept(this));
        if(it.constructor != null) {
            it.constructor.accept(this);
        }

        currentClassName = null;
    }

    @Override public void visit(Constructor it){
        IRFuncDef irFuncDef = new IRFuncDef(Type_To_IRType(new Type("void", 0)));
        irFuncDef.functionName = "@" + currentClassName + ".." + currentClassName;
        currentBlock = irFuncDef.addBlock(new IRBlock(irFuncDef, "entry"));

        it.suite.stmt.forEach(stmt -> stmt.accept(this));

        irProgram.funcDefMap.put(irFuncDef.functionName, irFuncDef);
        currentBlock = null;
    }

    @Override public void visit(FunctionDef it) {
        FuncInfor func = new FuncInfor(it);
        IRFuncDef irFuncDef = new IRFuncDef(Type_To_IRType(it.returnType));
        if(currentClassName != null) {
            irFuncDef.functionName = currentClassName + ".." + it.name;
        } else {
            irFuncDef.functionName = it.name;
        }
        currentBlock = irFuncDef.addBlock(new IRBlock(irFuncDef, "entry"));
        it.body.stmt.forEach(stmt -> stmt.accept(this));

        irProgram.funcDefMap.put(irFuncDef.functionName, irFuncDef);
        currentBlock = null;
    }

    @Override public void visit(VariableDef it) {
        it.initVariablelist.forEach(iv -> iv.accept(this));
    }

    @Override public void visit(InitVariable it) {
        if(it.init != null) {
            it.init.accept(this);
        }
        // 全局变量
        if(currentClassName == null && currentBlock.parent == null) {
            IRGlobalVariDef irGlobalVariDef = new IRGlobalVariDef(it.name);
            irGlobalVariDef.irType = Type_To_IRType(it.type);
            irGlobalVariDef.varName = "@" + it.name;
            if(it.init instanceof PrimaryExpr primaryExpr) {
                irProgram.globalVarDefMap.put(it.name, irGlobalVariDef);
            } else {
                irGlobalVariDef.funcDef = new IRFuncDef(Type_To_IRType(it.type));
                irGlobalVariDef.funcDef.functionName = "@.init_" + it.name;
                if(irProgram.funcDefMap.containsKey(irGlobalVariDef.funcDef.functionName)) {
                    irGlobalVariDef.funcDef = irProgram.funcDefMap.get(irGlobalVariDef.funcDef.functionName);
                }
                irGlobalVariDef.funcDef.returnType = new IRType("void");
                currentBlock = irGlobalVariDef.funcDef.addBlock(new IRBlock(irGlobalVariDef.funcDef, "entry"));
                it.init.accept(this);
                IRVariable addr = new IRVariable(it.name + ".addr", irGlobalVariDef.irType);
                currentBlock.instructions.add(new IR.instruction.StoreInstr(currentBlock, addr, irGlobalVariDef.irType, currentEntity));
                irProgram.funcDefMap.put(irGlobalVariDef.funcDef.functionName, irGlobalVariDef.funcDef);
                irProgram.globalVarDefMap.put(it.name, irGlobalVariDef);
                currentBlock = null;
            }
        } else {   // 局部变量
            int num = currentReNamer.getVarNum(it.name);
            if(num == 0) {
                currentReNamer.addVar(it.name);
            }
            IRVariable irVariable = new IRVariable(it.name, Type_To_IRType(it.type));
            IRVariable ptr = new IRVariable(it.name + ".ptr");
            ptr.type = new IRType("ptr");
            currentBlock.instructions.add(new IR.instruction.AllocInstr(currentBlock, irVariable.type, irVariable));
            if(it.init != null) {
                currentBlock.instructions.add(new IR.instruction.StoreInstr(currentBlock, irVariable, irVariable.type, currentEntity));
            }
        }
    }

    @Override public void visit(ArrayExpr it) {
        it.baseType.accept(this);
        it.size.accept(this);

        GeteleptrInstr geteleptrInstr = new GeteleptrInstr(currentBlock);
        geteleptrInstr.type = Type_To_IRType(it.baseType.type);
        geteleptrInstr.idxList.add(currentEntity);
        currentBlock.instructions.add(geteleptrInstr);

        IRVariable ptr = new IRVariable("var" + String.valueOf(counter.varCounter++), new IRType("ptr"));
        LoadInstr loadInstr = new LoadInstr(currentBlock, geteleptrInstr.result, ptr, Type_To_IRType(it.baseType.type));
        currentBlock.instructions.add(loadInstr);

        currentEntity = loadInstr.result;
        currentPtr = loadInstr.ptr;
    }

    @Override public void visit(AssignExpr it) {
        it.lhs.accept(this);
        var lhsValue = currentEntity;
        it.rhs.accept(this);
        var rhsValue = currentEntity;

        StoreInstr storeInstr = new StoreInstr(currentBlock, lhsValue, Type_To_IRType(it.lhs.type), rhsValue);
        currentBlock.instructions.add(storeInstr);
        currentPtr = null;
    }

    @Override public void visit(BinaryExpr it) {
        it.lhs.accept(this);
        var lhsValue = currentEntity;
        it.rhs.accept(this);
        var rhsValue = currentEntity;

        // TODO
        if(false){
            IRBlock thenBlock = new IRBlock(currentBlock.parent, "then");
            IRBlock elseBlock = new IRBlock(currentBlock.parent, "else");
            IRBlock backBlock = new IRBlock(currentBlock.parent, "back");
            currentBlock.parent.addBlock(thenBlock);
            currentBlock.parent.addBlock(elseBlock);
            currentBlock.parent.addBlock(backBlock);
        }

        if(lhsValue instanceof IRIntLiteral lhsLiteral && rhsValue instanceof IRIntLiteral rhsLiteral){
            int ans = 0;
            int lhs = lhsLiteral.value;
            int rhs = rhsLiteral.value;
            switch (it.op) {
                case "&&" -> {ans = (lhs != 0 && rhs != 0) ? 1 : 0;}
                case "||" -> {ans = (lhs != 0 || rhs != 0) ? 1 : 0;}
                case "<" -> {ans = (lhs < rhs) ? 1 : 0;}
                case ">" -> {ans = (lhs > rhs) ? 1 : 0;}
                case "<=" -> {ans = (lhs <= rhs) ? 1 : 0;}
                case ">=" -> {ans = (lhs >= rhs) ? 1 : 0;}
                case "==" -> {ans = (lhs == rhs) ? 1 : 0;}
                case "!=" -> {ans = (lhs != rhs) ? 1 : 0;}
                case "+" -> {ans = lhs + rhs;}
                case "-" -> {ans = lhs - rhs;}
                case "*" -> {ans = lhs * rhs;}
                case "/" -> {ans = lhs / rhs;}
                case "%" -> {ans = lhs % rhs;}
                case "<<" -> {ans = lhs << rhs;}
                case ">>" -> {ans = lhs >> rhs;}
                case "&" -> {ans = lhs & rhs;}
                case "|" -> {ans = lhs | rhs;}
                case "^" -> {ans = lhs ^ rhs;}
            }
            currentEntity = new IRIntLiteral(ans);
        }
    }

    @Override public void visit(ConditionalExpr it) {
        it.condition.accept(this);
        if(currentEntity instanceof IRBoolLiteral literal) {
            if(literal.value) {
                it.trueBranch.accept(this);
            } else {
                it.falseBranch.accept(this);
            }
            return;
        } else {
            IRBlock thenBlock = new IRBlock(currentBlock.parent, "then");
            IRBlock elseBlock = new IRBlock(currentBlock.parent, "else");
            IRBlock backBlock = new IRBlock(currentBlock.parent, "back");
            currentBlock.parent.addBlock(thenBlock);
            currentBlock = thenBlock;
            it.trueBranch.accept(this);
            thenBlock.instructions.add(new IR.instruction.JumpInstr(thenBlock, backBlock));
            currentBlock = backBlock;
            currentBlock.parent.addBlock(elseBlock);
            currentBlock = elseBlock;
            it.falseBranch.accept(this);
            elseBlock.instructions.add(new IR.instruction.JumpInstr(elseBlock, backBlock));
            currentBlock = backBlock;
            currentBlock.parent.addBlock(backBlock);
        }
    }

    @Override public void visit(Expression it) {
        it.accept(this);
    }

    @Override public void visit(FuncCallExpr it) {
        String actualFuncName = it.funcName;
        CallInstr callInstr = new CallInstr(currentBlock, actualFuncName);
        for(int i = 0; i < it.callExpList.expList.size(); i++) {
            it.callExpList.expList.get(i).accept(this);
            // TODO
            // callInstr.args.add(currentFunc);
        }
        currentBlock.instructions.add(callInstr);
        currentEntity = callInstr.result;
    }

    @Override public void visit(MemberExpr it) {
        it.base.accept(this);
        ClassInfor struct = gScope.getClassInfo(it.base.type.typeName);
        if(currentEntity instanceof IRVariable variable) {
            currentEntity = new IRVariable(it.memberName, variable.type);
        } else {
            // TODO
        }
    }
    @Override public void visit(MethodCallExpr it) {
        // TODO
    }
    @Override public void visit(NewArrayExpr it) {
        // TODO
    }

    @Override public void visit(Arrayconst it) {

    }

    @Override public void visit(Literal it) {

    }

    @Override public void visit(NewVarExpr it) {
        // TODO
    }
    @Override public void visit(ParallelExp it) {
        it.expList.forEach(e -> e.accept(this));
    }
    @Override public void visit(ParenExpr it) {
        it.expr.accept(this);
    }
    @Override public void visit(PostfixExpr it) {
        it.expr.accept(this);
        currentBlock.instructions.add(new IR.instruction.BinaryInstr(currentBlock, it.op, currentEntity, null));
        // TODO: not sure
        currentBlock.instructions.add(new IR.instruction.StoreInstr(currentBlock, currentPtr, currentPtr.type, currentEntity));
        currentEntity = ((BinaryInstr)currentBlock.instructions.getLast()).lhs;
    }

    @Override public void visit(PrefixExpr it) {
        it.expr.accept(this);
        currentBlock.instructions.add(new IR.instruction.BinaryInstr(currentBlock, it.op, currentEntity, null));
        currentBlock.instructions.add(new IR.instruction.StoreInstr(currentBlock, currentPtr, currentPtr.type, currentEntity));
        currentEntity = ((BinaryInstr)currentBlock.instructions.getLast()).lhs;
    }

    @Override public void visit(PrimaryExpr it) {
        if(it.isIdentifier){
            // then表示这个值是一个类，else表示这个值是一个变量
            if(gScope.containsClass(it.identifier, true)){
                currentEntity = new IROtherLiteral(it.identifier);
            } else {
                IRVariable ptr = new IRVariable("var" + String.valueOf(counter.varCounter++), new IRType("ptr"));
                currentBlock.instructions.add(new IR.instruction.LoadInstr(currentBlock, new IRVariable(it.identifier), ptr, Type_To_IRType(it.type)));
                currentEntity = new IRVariable(it.identifier);
            }
        } else if(it.isTrue) {
            currentEntity = new IRBoolLiteral(true);
        } else if(it.isFalse) {
            currentEntity = new IRBoolLiteral(false);
        } else if(it.isIntLiteral) {
            currentEntity = new IRIntLiteral(Integer.parseInt(it.intLiteral));
        } else {
            currentEntity = new IROtherLiteral(it.identifier);
        }
    }

    @Override public void visit(FmtString it) {

    }

    @Override public void visit(UnaryExpr it) {

    }

    @Override public void visit(BreakStmt it) {
        currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, currentScope.loopEnd));
    }
    @Override public void visit(ContinueStmt it) {
        currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, currentScope.loopNext));
    }
    @Override public void visit(ExprStmt it) {
        it.expr.accept(this);
    }
    @Override public void visit(ForStmt it) {
        currentScope = new LoopScope(currentScope);
        if(it.parallelExp != null) it.parallelExp.accept(this);
        if(it.variableDef != null) it.variableDef.accept(this);

        IRBlock backBlock = new IRBlock(currentBlock.parent, "for.back");
        IRBlock condBlock = new IRBlock(currentBlock.parent, "for.cond");
        IRBlock bodyBlock = new IRBlock(currentBlock.parent, "for.body");
        IRBlock stepBlock = new IRBlock(currentBlock.parent, "for.step");
        currentScope.loopNext = bodyBlock;
        currentScope.loopEnd = backBlock;

        if(it.conditionExp != null){
            currentBlock.parent.addBlock(condBlock);
            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, condBlock));
            currentBlock = condBlock;
            it.conditionExp.accept(this);
            condBlock.instructions.add(new IR.instruction.BrInstr(condBlock, (IRVariable)currentEntity, bodyBlock, stepBlock));
        }

        // 错误：考虑到循环体为空的情况
        if(it.stmt != null){
            currentBlock.parent.addBlock(bodyBlock);
            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, bodyBlock));
            currentBlock = bodyBlock;
            it.stmt.accept(this);
            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, stepBlock));
        }

        if(it.stepExp != null){
            currentBlock.parent.addBlock(stepBlock);
            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, stepBlock));
            currentBlock = stepBlock;
            it.stepExp.accept(this);
            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, condBlock));
        }
        currentBlock.parent.addBlock(backBlock);
        currentScope = currentScope.parentScope();
    }
    @Override public void visit(IfStmt it) {
        it.condition.accept(this);

        IRBlock thenBlock = new IRBlock(currentBlock.parent, "if.then");
        IRBlock elseBlock = new IRBlock(currentBlock.parent, "if.else");
        IRBlock backBlock = new IRBlock(currentBlock.parent, "if.back");

        // 两种情况，一种是直接的bool值，一种是变量
        if(currentEntity instanceof IRBoolLiteral literal) {
            if(literal.value) {
                currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, thenBlock));
            } else {
                currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, elseBlock));
            }
        } else {
            currentBlock.instructions.add(new IR.instruction.BrInstr(currentBlock, (IRVariable)currentEntity, thenBlock, elseBlock));
        }

        if(it.thenStmt != null) {
            currentBlock.parent.addBlock(thenBlock);
            currentBlock = thenBlock;
            it.thenStmt.accept(this);
            thenBlock.instructions.add(new IR.instruction.JumpInstr(thenBlock, backBlock));
            currentBlock = backBlock;
        }
        if(it.elseStmt != null) {
            currentBlock.parent.addBlock(elseBlock);
            currentBlock = elseBlock;
            it.elseStmt.accept(this);
            elseBlock.instructions.add(new IR.instruction.JumpInstr(elseBlock, backBlock));
            currentBlock = backBlock;
        }
        currentBlock.parent.addBlock(backBlock);
    }
    @Override public void visit(ReturnStmt it) {
        if(it.expr != null) {
            it.expr.accept(this);
            currentBlock.instructions.add(new IR.instruction.RetInstr(currentBlock, currentEntity));
        } else {
            currentBlock.instructions.add(new IR.instruction.RetInstr(currentBlock, null));
        }
    }
    @Override public void visit(Suite it) {
        it.stmt.forEach(stmt -> stmt.accept(this));
    }
    @Override public void visit(VariableDefStmt it) {
        it.variableDef.accept(this);
    }
    @Override public void visit(WhileStmt it) {
        it.condition.accept(this);
        currentScope = new LoopScope(currentScope);

        IRBlock backBlock = new IRBlock(currentBlock.parent, "for.back");
        IRBlock condBlock = new IRBlock(currentBlock.parent, "for.cond");
        IRBlock bodyBlock = new IRBlock(currentBlock.parent, "for.body");
        currentScope.loopNext = bodyBlock;
        currentScope.loopEnd = backBlock;

        if(it.condition != null){
            currentBlock.parent.addBlock(condBlock);
            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, condBlock));
            currentBlock = condBlock;
            it.condition.accept(this);
            condBlock.instructions.add(new IR.instruction.BrInstr(condBlock, (IRVariable)currentEntity, bodyBlock, backBlock));
        }

        if(it.body != null){
            currentBlock.parent.addBlock(bodyBlock);
            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, bodyBlock));
            currentBlock = bodyBlock;
            it.body.accept(this);
            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, condBlock));
        }

        currentBlock.parent.addBlock(backBlock);
        currentScope = currentScope.parentScope();
    }
    @Override public void visit(EmptyStmt it) {}

}
