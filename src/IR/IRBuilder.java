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

import java.util.ArrayList;
import java.util.Objects;

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
        IRFuncDef irFuncDef = new IRFuncDef(new IRType("void"), "__init", new ArrayList<>(), new ArrayList<>());
        irFuncDef.addBlock(new IRBlock(irFuncDef, "entry"));
        irProgram.funcDefMap.put("__init", irFuncDef);
        for(var def : it.defList) {
            def.accept(this);
        }
        currentBlock = irFuncDef.blockList.getFirst();
        currentBlock.instructions.add(new RetInstr(currentBlock, null, new IRType("void")));
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
        currentReNamer = new ReNamer(currentReNamer);

        IRClassDef irClassDef = new IRClassDef(it.name);
        irProgram.classDefMap.put(it.name, irClassDef);
        it.varList.forEach(vd -> {
            vd.initVariablelist.forEach(iv -> {
                irClassDef.variableTypeList.add(Type_To_IRType(iv.type));
                irClassDef.memberNameList.add(iv.name);
            });
        });
        irClassDef.classSize = irClassDef.variableTypeList.size() * 4;
        it.funcList.forEach(fd -> fd.accept(this));
        if(it.constructor != null) {
            it.constructor.accept(this);
        }

        currentReNamer = currentReNamer.getParent();
        currentClassName = null;
    }

    @Override public void visit(Constructor it){
        currentReNamer = new ReNamer(currentReNamer);
        IRFuncDef irFuncDef = new IRFuncDef(Type_To_IRType(new Type("void", 0)));
        irFuncDef.functionName = currentClassName + ".." + currentClassName;
        irFuncDef.parameterTypeList.add(new IRType("ptr"));
        irFuncDef.parameterNameList.add("%_this");
        currentBlock = irFuncDef.addBlock(new IRBlock(irFuncDef, "entry"));

        currentReNamer.addVar("_this");
        int num = currentReNamer.getTotalVarNum("_this");
        String nameAddr = "%_this." + num;
        String name = "%_this";
        IRVariable addr = new IRVariable(nameAddr, new IRType("ptr"));
        IRVariable variable = new IRVariable(name, new IRType("ptr"));
        currentBlock.instructions.add(new AllocInstr(currentBlock, new IRType("ptr"), addr));
        currentBlock.instructions.add(new StoreInstr(currentBlock, addr, new IRType("ptr"), variable));

        it.suite.stmt.forEach(stmt -> stmt.accept(this));
        currentBlock.instructions.add(new RetInstr(currentBlock, null, new IRType("void")));

        irProgram.funcDefMap.put(irFuncDef.functionName, irFuncDef);
        currentReNamer = currentReNamer.getParent();
        currentBlock = null;
    }

    @Override public void visit(FunctionDef it) {
        FuncInfor func = new FuncInfor(it);
        IRFuncDef irFuncDef = new IRFuncDef(Type_To_IRType(it.returnType));
        if(currentClassName != null) {
            irFuncDef.functionName = currentClassName + ".." + it.name;
            irFuncDef.parameterTypeList.add(new IRType("ptr"));
            irFuncDef.parameterNameList.add("%_this");
        } else {
            irFuncDef.functionName = it.name;
        }
        currentBlock = irFuncDef.addBlock(new IRBlock(irFuncDef, "entry"));
        currentReNamer = new ReNamer(currentReNamer);
        if(it.name.equals("main")) {
            currentBlock.instructions.add(new CallInstr(currentBlock, "__init", new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("void"))));
        }
        it.parameters.forEach(p -> irFuncDef.parameterTypeList.add(Type_To_IRType(p)));
        // 错误：如果传入i32类型的x，那么在函数体的开头应该包含：
        // %x.addr = alloca i32
        // store i32 %x, ptr %x.addr
        if(currentClassName != null){
            currentReNamer.addVar("_this");
            int num = currentReNamer.getTotalVarNum("_this");
            String nameAddr = "%_this." + num;
            String name = "%_this";
            IRVariable addr = new IRVariable(nameAddr, new IRType("ptr"));
            IRVariable variable = new IRVariable(name, new IRType("ptr"));
            currentBlock.instructions.add(new AllocInstr(currentBlock, new IRType("ptr"), addr));
            currentBlock.instructions.add(new StoreInstr(currentBlock, addr, new IRType("ptr"), variable));
        }
        for(int i = 0; i < it.parameterNames.size(); ++i){
            String pn = it.parameterNames.get(i);
            currentReNamer.addVar(pn);
            int num = currentReNamer.getTotalVarNum(pn);
            String nameAddr = "%" + pn + "." + num;
            String name = "%" + pn;
            irFuncDef.parameterNameList.add(name);
            IRVariable addr = new IRVariable(nameAddr, new IRType("ptr"));
            IRVariable variable = new IRVariable(name, Type_To_IRType(it.parameters.get(i)));
            currentBlock.instructions.add(new AllocInstr(currentBlock, Type_To_IRType(it.parameters.get(i)), addr));
            currentBlock.instructions.add(new StoreInstr(currentBlock, addr, Type_To_IRType(it.parameters.get(i)), variable));
        }
        it.body.stmt.forEach(stmt -> stmt.accept(this));
        boolean hasReturn = false;
        for(int i = 0; i < it.body.stmt.size(); i++) {
            if(it.body.stmt.get(i) instanceof ReturnStmt) {
                hasReturn = true;
                break;
            }
        }
        if(!hasReturn){
            if(it.returnType.isVoid){
                currentBlock.instructions.add(new RetInstr(currentBlock, null, new IRType("void")));
            } else {
                if(it.name.equals("main")) {
                    currentBlock.instructions.add(new RetInstr(currentBlock, new IRIntLiteral(0), new IRType("i32")));
                }
            }
        }
        irProgram.funcDefMap.put(irFuncDef.functionName, irFuncDef);
        currentReNamer = currentReNamer.getParent();
        currentBlock = null;
    }

    @Override public void visit(VariableDef it) {
        it.initVariablelist.forEach(iv -> iv.accept(this));
    }

    @Override public void visit(InitVariable it) {
        if(it.type.isString) {
            // 全局 String变量
            if(currentClassName == null && currentBlock == null) {
                IRGlobalVariDef irGlobalVariDef = new IRGlobalVariDef("@" + it.name);
                irGlobalVariDef.irType = new IRType("ptr");
                irGlobalVariDef.result = new IROtherLiteral("", new IRType("ptr"));
                irProgram.globalVarDefMap.put(it.name, irGlobalVariDef);
                if(it.init == null) {
                    return;
                }
                if(it.init instanceof FmtString fmtString) {
                    it.init.accept(this);
                    return;
                } else {
//                    if(it.init instanceof PrimaryExpr primaryExpr){
                        IRFuncDef irFuncDef = irProgram.getFuncDef("__init");
                        currentBlock = irFuncDef.blockList.getFirst();
                        it.init.accept(this);
//                        int count = counter.strCounter - 1;
//                        IRVariable irVariable = new IRVariable("@.str.." + String.valueOf(count), new IRType("ptr"));
                        StoreInstr storeInstr = new StoreInstr(currentBlock, new IRVariable("@" + it.name), new IRType("ptr"), currentEntity);
                        currentBlock.instructions.add(storeInstr);
                        currentBlock = null;
//                    } else {
//                        IRFuncDef irFuncDef = irProgram.getFuncDef("__init");
//                        currentBlock = irFuncDef.blockList.getFirst();
//                        it.init.accept(this);
//                        StoreInstr storeInstr = new StoreInstr(currentBlock, new IRVariable("@" + it.name), new IRType("ptr"), currentEntity);
//                        currentBlock.instructions.add(storeInstr);
//                    }
                    return;
                }
            }
            // 局部 String变量
            else {
                currentReNamer.addVar(it.name);
                int num = currentReNamer.getTotalVarNum(it.name);
                if(it.init == null) {
                    IRVariable irVariable = new IRVariable("%" + it.name + "." + num, new IRType("ptr"));
                    currentBlock.instructions.add(new IR.instruction.AllocInstr(currentBlock, new IRType("ptr"), irVariable));
                    return;
                } else {
                    if(it.init instanceof FmtString fmtString) {
                        it.init.accept(this);
                        return;
                    } else if(it.init instanceof PrimaryExpr primaryExpr) {
                        IRVariable irVariable = new IRVariable("%" + it.name + "." + num, new IRType("ptr"));
                        currentBlock.instructions.add(new IR.instruction.AllocInstr(currentBlock, new IRType("ptr"), irVariable));
                        it.init.accept(this);
                        StoreInstr storeInstr = new StoreInstr(currentBlock, irVariable, new IRType("ptr"), currentPtr);
                        currentBlock.instructions.add(storeInstr);
                        return;
                    } else {
                        // 例子：string s = s1 + s2
                        IRVariable irVariable = new IRVariable("%" + it.name + "." + num, new IRType("ptr"));
                        currentBlock.instructions.add(new IR.instruction.AllocInstr(currentBlock, new IRType("ptr"), irVariable));
                        it.init.accept(this);
                        StoreInstr storeInstr = new StoreInstr(currentBlock, irVariable, new IRType("ptr"), currentPtr);
                        currentBlock.instructions.add(storeInstr);
                        return;
                    }
                }
            }
        }
        // 全局变量
        if(currentClassName == null && currentBlock == null) {
            IRGlobalVariDef irGlobalVariDef = new IRGlobalVariDef("@" + it.name);
            irGlobalVariDef.irType = Type_To_IRType(it.type);
            irProgram.globalVarDefMap.put(it.name, irGlobalVariDef);
            if(it.init == null){
                if(it.type.isInt) irGlobalVariDef.result = new IRIntLiteral(0);
                if(it.type.isBool) irGlobalVariDef.result = new IRBoolLiteral(false);
                if(irGlobalVariDef.irType.isPtr()) irGlobalVariDef.result = new IROtherLiteral("null", new IRType("ptr"));
                return;
            }
            if(it.init instanceof PrimaryExpr primaryExpr) {
                it.init.accept(this);
                irGlobalVariDef.result = currentEntity;
            } else {
                IRType irType = Type_To_IRType(it.type);
                if(irType.isI1()) {
                    irGlobalVariDef.result = new IRBoolLiteral(false);
                } else if(irType.isI32()) {
                    irGlobalVariDef.result = new IRIntLiteral(0);
                } else if(irType.isPtr()) {
                    irGlobalVariDef.result = new IROtherLiteral("null", new IRType("ptr"));
                }
                currentEntity = currentPtr = new IRVariable("@" + it.name);
                IRFuncDef irFuncDef;
                if(irProgram.funcDefMap.containsKey("__init")) {
                    irFuncDef = irProgram.funcDefMap.get("__init");
                } else {
                    irFuncDef = new IRFuncDef(new IRType("void"), "__init", new ArrayList<>(), new ArrayList<>());
                    irFuncDef.addBlock(new IRBlock(irFuncDef, "entry"));
                    irProgram.funcDefMap.put("__init", irFuncDef);
                }
                currentBlock = irFuncDef.blockList.getFirst();
                it.init.accept(this);
                currentBlock.instructions.add(new IR.instruction.StoreInstr(currentBlock, new IRVariable("@" + it.name), irGlobalVariDef.irType, currentEntity));
                currentBlock = null;
            }
        }
        // 局部变量
        else {
            currentReNamer.addVar(it.name);
            int num = currentReNamer.getTotalVarNum(it.name);
            IRVariable irVariable = new IRVariable("%" + it.name + "." + num, new IRType("ptr"));
            currentBlock.instructions.add(new IR.instruction.AllocInstr(currentBlock, Type_To_IRType(it.type), irVariable));
            if(it.init != null) {
                it.init.accept(this);
                currentBlock.instructions.add(new IR.instruction.StoreInstr(currentBlock, irVariable, Type_To_IRType(it.type), currentEntity));
                currentPtr = irVariable;
            } else {
                if(it.type.isInt) {
                    currentBlock.instructions.add(new IR.instruction.StoreInstr(currentBlock, irVariable, new IRType("i32"), new IRIntLiteral(0)));
                    currentEntity = new IRIntLiteral(0);
                    currentPtr = irVariable;
                } else if(it.type.isBool) {
                    currentBlock.instructions.add(new IR.instruction.StoreInstr(currentBlock, irVariable, new IRType("bool"), new IRBoolLiteral(false)));
                    currentEntity = new IRBoolLiteral(false);
                    currentPtr = irVariable;
                }
            }
        }
    }

    @Override public void visit(ArrayExpr it) {

        it.baseType.accept(this);
        IREntity lhsValue = currentEntity;
        it.size.accept(this);
        IREntity size = currentEntity;

//        IRVariable result = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("ptr"));
//        String actualName = it.baseType.type.typeName;
//        LoadInstr loadInstr = new LoadInstr(currentBlock, new IRVariable(actualName), result, Type_To_IRType(it.baseType.type));
//        currentBlock.instructions.add(loadInstr);
//        currentEntity = result;
//        currentPtr = new IRVariable(actualName);

        String actualName = it.baseType.type.typeName;
        IRVariable retValue = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("ptr"));
        GeteleptrInstr geteleptrInstr = new GeteleptrInstr(currentBlock, retValue, actualName, lhsValue, Type_To_IRType(it.type));
        geteleptrInstr.idxList.add(size);
        currentBlock.instructions.add(geteleptrInstr);
        currentEntity = currentPtr = retValue;

        IRVariable result1 = new IRVariable("%var" + String.valueOf(counter.varCounter++), Type_To_IRType(it.type));
        LoadInstr loadInstr1 = new LoadInstr(currentBlock, retValue, result1, Type_To_IRType(it.type));
        currentBlock.instructions.add(loadInstr1);
        currentEntity = loadInstr1.result;
        currentPtr = retValue;
    }

    @Override public void visit(AssignExpr it) {
        it.lhs.accept(this);
        var lhsValue = currentPtr;
        if(it.lhs.type.isString){
            it.rhs.accept(this);
            IRVariable retValue = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("ptr"));
            CallInstr callInstr = new CallInstr(currentBlock, "string.copy", retValue);
            callInstr.argTypes.add(new IRType("ptr"));
            callInstr.args.add(currentEntity);
            currentBlock.instructions.add(callInstr);
            StoreInstr storeInstr = new StoreInstr(currentBlock, lhsValue, new IRType("ptr"), retValue);
            currentBlock.instructions.add(storeInstr);
            currentEntity = retValue;
            currentPtr = lhsValue;
            return;
        }
        it.rhs.accept(this);
        var rhsValue = currentEntity;
        StoreInstr storeInstr = new StoreInstr(currentBlock, lhsValue, Type_To_IRType(it.lhs.type), rhsValue);
        currentBlock.instructions.add(storeInstr);
        currentPtr = null;
    }

    @Override public void visit(BinaryExpr it) {
        it.lhs.accept(this);
        var lhsValue = currentEntity;

        if(it.op.equals("&&") || it.op.equals("||")){
//            IRVariable retVariable = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("ptr"));
//            currentBlock.instructions.add(new AllocInstr(currentBlock, new IRType("i1"), retVariable));
//
//            int num = counter.ifCounter++;
//            IRBlock thenBlock = new IRBlock(currentBlock.parent, "if.then.." + num);
//            IRBlock elseBlock = new IRBlock(currentBlock.parent, "if.else.." + num);
//            IRBlock endBlock = new IRBlock(currentBlock.parent, "if.end.." + num);
//            currentBlock.instructions.add(new IR.instruction.BrInstr(currentBlock, lhsValue, thenBlock, elseBlock));
//
//            currentBlock.parent.addBlock(thenBlock);
//            currentBlock = thenBlock;
//            if(it.op.equals("&&")){
//                it.rhs.accept(this);
//                currentBlock.instructions.add(new IR.instruction.StoreInstr(currentBlock, retVariable, currentEntity.type, currentEntity));
//            } else {
//                currentBlock.instructions.add(new IR.instruction.StoreInstr(currentBlock, retVariable, lhsValue.type, lhsValue));
//            }
//            currentBlock.instructions.add(new JumpInstr(currentBlock, endBlock));
//
//            currentBlock.parent.addBlock(elseBlock);
//            currentBlock = elseBlock;
//            if(it.op.equals("||")){
//                it.rhs.accept(this);
//                currentBlock.instructions.add(new IR.instruction.StoreInstr(currentBlock, retVariable, currentEntity.type, currentEntity));
//            } else {
//                currentBlock.instructions.add(new IR.instruction.StoreInstr(currentBlock, retVariable, lhsValue.type, lhsValue));
//            }
//            currentBlock.instructions.add(new JumpInstr(currentBlock, endBlock));
//
//            currentBlock.parent.addBlock(endBlock);
//
//            IRVariable retValue = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("i1"));
//            currentBlock = endBlock;
//            currentBlock.instructions.add(new LoadInstr(currentBlock, retVariable, retValue, new IRType("i1")));
//            currentEntity = retValue;
//            return;


            int num = counter.landCounter++;
            IRBlock nextBlock = new IRBlock(currentBlock.parent, "land.next.." + num);
            IRBlock endBlock = new IRBlock(currentBlock.parent, "land.end.." + num);
            IRVariable retVariable = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("ptr"));
            var lhs = new IRVariable(lhsValue.toString(), new IRType("i1"));
            currentBlock.instructions.add(new AllocInstr(currentBlock, new IRType("i1"), retVariable));
            currentBlock.instructions.add(new IR.instruction.StoreInstr(currentBlock, retVariable, currentEntity.type, currentEntity));
            if(it.op.equals("&&")){
                currentBlock.instructions.add(new IR.instruction.BrInstr(currentBlock, lhs, nextBlock, endBlock));
            } else {
                currentBlock.instructions.add(new IR.instruction.BrInstr(currentBlock, lhs, endBlock, nextBlock));
            }

            currentBlock.parent.addBlock(nextBlock);
            currentBlock = nextBlock;
            it.rhs.accept(this);
            var rhsValue = currentEntity;
            IRVariable rhs = new IRVariable(rhsValue.toString(), new IRType("i1"));
            currentBlock.instructions.add(new IR.instruction.StoreInstr(currentBlock, retVariable, rhs.type, rhs));
            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, endBlock));

            currentBlock.parent.addBlock(endBlock);
            currentBlock = endBlock;
            IRVariable retValue = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("i1"));
            currentBlock.instructions.add(new LoadInstr(currentBlock, retVariable, retValue, new IRType("i1")));

            currentEntity = retValue;
            return;


//            it.lhs.accept(this);
//            String lhsName = currentTmpValName;
//            String nextlabel = renamer.rename("shortcircuit.next");
//            String endlabel = renamer.rename("shortcircuit.end");
//            IRVar dest = new IRVar("ptr", "%" + renamer.rename("shortcircuit.ptr"), false);
//            currentBlock.push(new allocaInstNode(it, currentBlock, dest, new IRType(IRType.IRTypeEnum.i1)));
//            //lhs:
//            IRVar lhs = new IRVar("i1", lhsName, false);
//            storeInstNode store = new storeInstNode(it, currentBlock, lhs, dest);
//            currentBlock.push(store);
//            if (it.opCode == binaryExprNode.binaryOpType.andLg) {
//                currentBlock.push(new brInstNode(it, currentBlock, lhs, nextlabel, endlabel));
//            } else {
//                currentBlock.push(new brInstNode(it, currentBlock, lhs, endlabel, nextlabel));
//            }
//            //next(rhs):
//            currentBlock = new IRBlockNode(currentBlock, currentFunDef, nextlabel);
//            currentFunDef.push(currentBlock);
//            it.rhs.accept(this);
//            String rhsName = currentTmpValName;
//            IRVar rhs = new IRVar("i1", rhsName, false);
//            storeInstNode store2 = new storeInstNode(it, currentBlock, rhs, dest);
//            currentBlock.push(store2);
//            currentBlock.push(new brInstNode(it, currentBlock, endlabel));
//            //end:
//            currentBlock = new IRBlockNode(currentBlock, currentFunDef, endlabel);
//            currentFunDef.push(currentBlock);
//            loadInstNode load = new loadInstNode(it, currentBlock, renamer.getAnonymousName(), dest.name, new IRType(IRType.IRTypeEnum.i1));
//            currentBlock.push(load);
//            currentTmpValName = load.dest;
//            currentLeftVarAddr = null;
//            return;

        }

        it.rhs.accept(this);
        var rhsValue = currentEntity;

        IRVariable retValue = new IRVariable("%var" + String.valueOf(counter.varCounter++));
        switch (it.op){
            case "<", ">", "<=", ">=", "==", "!=" -> {
                if(it.lhs.type.isString && it.rhs.type.isString) {
                    ArrayList<IRType> stringTypes = new ArrayList<>();
                    stringTypes.add(new IRType("ptr"));
                    stringTypes.add(new IRType("ptr"));
                    ArrayList<IREntity> stringArgs = new ArrayList<>();
                    stringArgs.add(lhsValue);
                    stringArgs.add(rhsValue);
                    switch (it.op) {
                        case "<" -> {
                            retValue.type = new IRType("i1");
                            CallInstr callInstr = new CallInstr(currentBlock, "string.less", retValue);
                            callInstr.argTypes.addAll(stringTypes);
                            callInstr.args.addAll(stringArgs);
                            currentBlock.instructions.add(callInstr);
                        }
                        case ">" -> {
                            retValue.type = new IRType("i1");
                            CallInstr callInstr = new CallInstr(currentBlock, "string.greater", retValue);
                            callInstr.argTypes.addAll(stringTypes);
                            callInstr.args.addAll(stringArgs);
                            currentBlock.instructions.add(callInstr);
                        }
                        case "<=" -> {
                            retValue.type = new IRType("i1");
                            CallInstr callInstr = new CallInstr(currentBlock, "string.lessOrEqual", retValue);
                            callInstr.argTypes.addAll(stringTypes);
                            callInstr.args.addAll(stringArgs);
                            currentBlock.instructions.add(callInstr);
                        }
                        case ">=" -> {
                            retValue.type = new IRType("i1");
                            CallInstr callInstr = new CallInstr(currentBlock, "string.greaterOrEqual", retValue);
                            callInstr.argTypes.addAll(stringTypes);
                            callInstr.args.addAll(stringArgs);
                            currentBlock.instructions.add(callInstr);
                        }
                        case "==" -> {
                            retValue.type = new IRType("i1");
                            CallInstr callInstr = new CallInstr(currentBlock, "string.equal", retValue);
                            callInstr.argTypes.addAll(stringTypes);
                            callInstr.args.addAll(stringArgs);
                            currentBlock.instructions.add(callInstr);
                        }
                        case "!=" -> {
                            retValue.type = new IRType("i1");
                            CallInstr callInstr = new CallInstr(currentBlock, "string.notEqual", retValue);
                            callInstr.argTypes.addAll(stringTypes);
                            callInstr.args.addAll(stringArgs);
                            currentBlock.instructions.add(callInstr);
                        }
                    }
                } else {
                    retValue.type = new IRType("i1");
                    currentBlock.instructions.add(new IR.instruction.IcmpInstr(currentBlock, retValue, lhsValue, it.op, rhsValue));
                }
            }
            case "+" -> {
                if(it.lhs.type.isString && it.rhs.type.isString) {
                    retValue.type = new IRType("ptr");
                    CallInstr callInstr = new CallInstr(currentBlock, "string.add", retValue);
                    callInstr.argTypes.add(new IRType("ptr"));
                    callInstr.argTypes.add(new IRType("ptr"));
                    callInstr.args.add(lhsValue);
                    callInstr.args.add(rhsValue);
                    currentBlock.instructions.add(callInstr);
                } else {
                    retValue.type = new IRType("i32");
                    currentBlock.instructions.add(new IR.instruction.BinaryInstr(currentBlock, retValue, it.op, lhsValue, rhsValue));
                }
            }
            case "*", "/", "%", "-", ">>", "<<", "&", "|", "^" -> {
                retValue.type = new IRType("i32");
                currentBlock.instructions.add(new IR.instruction.BinaryInstr(currentBlock, retValue, it.op, lhsValue, rhsValue));
            }
        }
        currentEntity = currentPtr = retValue;
    }

    @Override public void visit(ConditionalExpr it) {
        it.condition.accept(this);
        IRVariable retVariable = null;
        if(!it.type.isVoid) {
            retVariable = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("ptr"));
            currentBlock.instructions.add(new AllocInstr(currentBlock, Type_To_IRType(it.type), retVariable));
        }
        if(currentEntity instanceof IRBoolLiteral literal) {
            if(literal.value) {
                it.trueBranch.accept(this);
            } else {
                it.falseBranch.accept(this);
            }
        } else {
            int num = counter.condCounter++;
            IRBlock thenBlock = new IRBlock(currentBlock.parent, "cond.then." + num);
            IRBlock elseBlock = new IRBlock(currentBlock.parent, "cond.else." + num);
            IRBlock backBlock = new IRBlock(currentBlock.parent, "cond.back." + num);

            currentBlock.instructions.add(new IR.instruction.BrInstr(currentBlock, currentEntity, thenBlock, elseBlock));

            currentBlock.parent.addBlock(thenBlock);
            currentBlock = thenBlock;
            it.trueBranch.accept(this);
//            var thenValue = (!it.type.isVoid) ? currentEntity : null;
//            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, backBlock));
//            IRBlock block1 = currentBlock;
            if(!it.type.isVoid) currentBlock.instructions.add(new StoreInstr(currentBlock, retVariable, currentEntity.type, currentEntity));
            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, backBlock));

            currentBlock.parent.addBlock(elseBlock);
            currentBlock = elseBlock;
            it.falseBranch.accept(this);
//            var elseValue = (!it.type.isVoid) ? currentEntity : null;
//            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, backBlock));
//            IRBlock block2 = currentBlock;
            if(!it.type.isVoid) currentBlock.instructions.add(new StoreInstr(currentBlock, retVariable, currentEntity.type, currentEntity));
            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, backBlock));

            currentBlock.parent.addBlock(backBlock);
            currentBlock = backBlock;

            if(it.type.isVoid) {
                currentEntity = null;
            } else {
                IRVariable retValue = new IRVariable("%var" + String.valueOf(counter.varCounter++), Type_To_IRType(it.type));
//                PhiInstr phiInstr = new PhiInstr(currentBlock, retValue, Type_To_IRType(it.type));
//                currentBlock.instructions.add(phiInstr);
//
//                phiInstr.addBranch(thenValue, block1);
//                phiInstr.addBranch(elseValue, block2);
                currentBlock.instructions.add(new LoadInstr(currentBlock, retVariable, retValue, Type_To_IRType(it.type)));
                currentEntity = retValue;
                currentPtr = retVariable;
            }

        }
    }

    @Override public void visit(Expression it) {
        it.accept(this);
    }

    @Override public void visit(FuncCallExpr it) {
        String actualFuncName;
        if(currentClassName != null){
            ClassInfor struct = gScope.getClassInfo(currentClassName);
            if(struct.funcList.containsKey(it.funcName)){
                actualFuncName = currentClassName + ".." + it.funcName;
                IRVariable result = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("ptr"));
                String thisName = "%_this." + currentReNamer.getTotalVarNum("_this");
                LoadInstr loadInstr = new LoadInstr(currentBlock, new IRVariable(thisName), result, new IRType("ptr"));
                currentBlock.instructions.add(loadInstr);
            } else {
                actualFuncName = it.funcName;
            }
        } else {
            actualFuncName = it.funcName;
        }
        IRVariable result = new IRVariable("%var" + String.valueOf(counter.varCounter++), Type_To_IRType(it.type));
        CallInstr callInstr = new CallInstr(currentBlock, actualFuncName, result);
        if(currentClassName != null){
            if(actualFuncName.startsWith(currentClassName)){
                int num = counter.varCounter - 2;
                IRVariable thisPtr = new IRVariable("%var" + num, new IRType("ptr"));
                callInstr.args.add(thisPtr);
                callInstr.argTypes.add(new IRType("ptr"));
            }
        }
        // 错误：不能去找函数声明，因为可能在后面
        for(int i = 0; i < it.callExpList.expList.size(); i++) {
            it.callExpList.expList.get(i).accept(this);
            callInstr.args.add(currentEntity);
            callInstr.argTypes.add(currentEntity.type);
        }
        currentBlock.instructions.add(callInstr);
        currentEntity = callInstr.result;
    }

    @Override public void visit(MemberExpr it) {
        // 指令示例：
        // %z = getelementptr %class.C2, ptr %obj, i32 0, i32 2
        // load i32 40, ptr %z
        // result = getelementptr classname, ptr currentptr, i32 0, i32 2
        // load i32 retvalue, ptr result
        it.base.accept(this);
        // 错误：不是currentPtr
        IREntity ptr = currentEntity;
        ClassInfor struct = gScope.getClassInfo(it.base.type.typeName);
        IRVariable result = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("ptr"));
        String className = "%class.." + it.base.type.typeName;
        GeteleptrInstr geteleptrInstr = new GeteleptrInstr(currentBlock, result, className, ptr, Type_To_IRType(it.type));
        geteleptrInstr.idxList.add(new IRIntLiteral(0));
        struct.varNames.forEach(varName -> {
            if(varName.equals(it.memberName)){
                geteleptrInstr.idxList.add(new IRIntLiteral(struct.varNames.indexOf(varName)));
            }
        });
        currentBlock.instructions.add(geteleptrInstr);
        IRVariable retValue = new IRVariable("%var" + String.valueOf(counter.varCounter++), Type_To_IRType(it.type));
        LoadInstr loadInstr = new LoadInstr(currentBlock, result, retValue, Type_To_IRType(it.type));
        currentBlock.instructions.add(loadInstr);
        currentEntity = retValue;
        currentPtr = result;
    }

    @Override public void visit(MethodCallExpr it) {
        it.base.accept(this);
        IREntity irEntity = currentEntity;
        String className = it.base.type.typeName;
        String funcName = "";
        if(it.base.type.isString) {
            funcName = "string." + it.methodName;
        } else if(it.base.type.dim > 0){
            // 错误：这里dim要放在class前面，因为可能元素是class类型
            funcName = "array.size";
        } else if(it.base.type.isClass) {
            funcName = className + ".." + it.methodName;
        }  else {
            System.out.println("maybe a bug");
        }
        IRFuncDef funcDef = irProgram.getFuncDef(funcName);
        CallInstr callInstr = new CallInstr(currentBlock, funcName, null);
        callInstr.args.add(irEntity);
        callInstr.argTypes.add(new IRType("ptr"));
        if(it.callExpList != null){
            it.callExpList.expList.forEach(e -> {
                e.accept(this);
                // 错误：分情况加入参数
                callInstr.args.add(currentEntity);
                callInstr.argTypes.add(Type_To_IRType(e.type));
            });
        }
        if(it.type.isVoid){
            callInstr.result = new IRVariable("", new IRType("void"));
            currentBlock.instructions.add(callInstr);
        } else {
            IRVariable retValue = new IRVariable("%var" + String.valueOf(counter.varCounter++), Type_To_IRType(it.type));
            callInstr.result = retValue;
            currentBlock.instructions.add(callInstr);
            currentEntity = retValue;
        }
    }

    @Override public void visit(NewArrayExpr it) {
        if(it.arrayconst != null){
            it.arrayconst.accept(this);
            return;
        }
        IRVariable retValue = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("ptr"));
        CallInstr callInstr = new CallInstr(currentBlock, "__array.alloca", retValue);
        ArrayList<IREntity> sizeList = new ArrayList<>();
        callInstr.argTypes.add(new IRType("i32"));
        callInstr.args.add(new IRIntLiteral(4));
        callInstr.argTypes.add(new IRType("i32"));
        callInstr.args.add(new IRIntLiteral(it.type.dim));
        callInstr.argTypes.add(new IRType("i32"));
        callInstr.args.add(new IRIntLiteral(it.size.size()));
        it.size.forEach(e -> {
            e.accept(this);
            callInstr.args.add(currentEntity);
            callInstr.argTypes.add(new IRType("i32"));
        });
        currentBlock.instructions.add(callInstr);
        currentEntity = currentPtr = retValue;
    }

    @Override public void visit(Arrayconst it) {
        IRVariable retValue = new IRVariable("%var" + String.valueOf(counter.varCounter), new IRType("ptr"));
        CallInstr callInstr = new CallInstr(currentBlock, "__array.alloca", retValue);
        callInstr.argTypes.add(new IRType("i32"));
        callInstr.args.add(new IRIntLiteral(4));
        callInstr.argTypes.add(new IRType("i32"));
        callInstr.args.add(new IRIntLiteral(it.type.dim));
        callInstr.argTypes.add(new IRType("i32"));
        callInstr.args.add(new IRIntLiteral(it.type.dim));
        callInstr.argTypes.add(new IRType("i32"));
        callInstr.args.add(new IRIntLiteral(it.literal.size()));
        currentBlock.instructions.add(callInstr);

        for(int i = 0; i < it.literal.size(); i++) {
            it.literal.get(i).accept(this);
            IREntity entity = currentEntity;
            IRVariable retValue1 = new IRVariable("%var" + String.valueOf(counter.varCounter++), currentEntity.type);
            GeteleptrInstr geteleptrInstr = new GeteleptrInstr(currentBlock, retValue1, String.valueOf(i), retValue, new IRType("ptr"));
            currentBlock.instructions.add(geteleptrInstr);
            geteleptrInstr.idxList.add(new IRIntLiteral(i));
            currentBlock.instructions.add(new StoreInstr(currentBlock, retValue1, currentEntity.type, entity));
        }
        currentEntity = currentPtr = retValue;
    }

    @Override public void visit(Literal it) {
        if(it.arrayconst == null) {
            IRVariable retValue = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("ptr"));
            if(it.isInt){
                currentEntity = new IRIntLiteral(it.intValue);
            } else if(it.isTrue || it.isFalse){
                currentEntity = new IRBoolLiteral(it.isTrue);
            } else if(it.isString){
                currentEntity = new IROtherLiteral(it.stringValue, new IRType("ptr"));
            } else if(it.isNull){
                currentEntity = new IROtherLiteral("null", new IRType("ptr"));
            }
            return;
        }
        IRVariable irVariable = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("ptr"));
        CallInstr callInstr = new CallInstr(currentBlock, "_malloc", irVariable);
        callInstr.argTypes.add(new IRType("ptr"));
        callInstr.args.add(new IRIntLiteral(it.arrayconst.literal.size() * 4));
        if(currentBlock == null){
            System.exit(0);
        }
        currentBlock.instructions.add(callInstr);
        for(int i = 0; i < it.arrayconst.literal.size(); i++) {
            it.arrayconst.literal.get(i).accept(this);
            IREntity entity = currentEntity;
            IRVariable retValue = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("ptr"));
            GeteleptrInstr geteleptrInstr = new GeteleptrInstr(currentBlock, retValue, String.valueOf(i), entity, new IRType("ptr"));
            currentBlock.instructions.add(geteleptrInstr);
            geteleptrInstr.idxList.add(new IRIntLiteral(i));
            currentBlock.instructions.add(new StoreInstr(currentBlock, irVariable, new IRType("ptr"), retValue));
        }
    }

    @Override public void visit(NewVarExpr it) {
        IRVariable retValue = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("ptr"));
        CallInstr callInstr = new CallInstr(currentBlock, "_malloc", retValue);
        int size = 0;
        if(it.type.isClass){
            if(irProgram.getClassDef(it.type.typeName) == null){
                System.exit(0);
            }
            size = irProgram.getClassDef(it.type.typeName).classSize;
        } else if(it.type.isInt || it.type.isBool){
            size = 4;
        }
        callInstr.argTypes.add(new IRType("i32"));
        callInstr.args.add(new IRIntLiteral(size));
        currentBlock.instructions.add(callInstr);
        if(it.type.isClass){
            ClassInfor classInfor = gScope.getClassInfo(it.type.typeName);
            if(classInfor.hasConstructor){
                String constructorName = it.type.typeName + ".." + it.type.typeName;
                IRVariable retValue1 = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("void"));
                CallInstr callInstr1 = new CallInstr(currentBlock, constructorName, retValue1);
                callInstr1.argTypes.add(new IRType("ptr"));
                callInstr1.args.add(retValue);
                currentBlock.instructions.add(callInstr1);
            }
        }
        currentEntity = currentPtr = retValue;
    }

    @Override public void visit(ParallelExp it) {
        it.expList.forEach(e -> e.accept(this));
    }
    @Override public void visit(ParenExpr it) {
        it.expr.accept(this);
    }
    @Override public void visit(PostfixExpr it) {
        it.expr.accept(this);
        String option = "";
        if(it.op.equals("++")) option = "+";
        if(it.op.equals("--")) option = "-";
        IRVariable retValue1 = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("i32"));
        currentBlock.instructions.add(new IR.instruction.BinaryInstr(currentBlock, retValue1, option, currentEntity, new IRIntLiteral(1)));
        currentBlock.instructions.add(new IR.instruction.StoreInstr(currentBlock, currentPtr, new IRType("i32"), retValue1));
        // 错误：这里不能更新currentEntity
    }

    @Override public void visit(PrefixExpr it) {
        it.expr.accept(this);
        String option = "";
        if(it.op.equals("++")) option = "+";
        if(it.op.equals("--")) option = "-";
        IRVariable retValue1 = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("i32"));
        currentBlock.instructions.add(new IR.instruction.BinaryInstr(currentBlock, retValue1, option, currentEntity, new IRIntLiteral(1)));
        currentBlock.instructions.add(new IR.instruction.StoreInstr(currentBlock, currentPtr, new IRType("i32"), retValue1));
        currentEntity = retValue1;
    }

    @Override public void visit(PrimaryExpr it) {
        if(it.isIdentifier){
            // then表示这个值是一个类，else表示这个值是一个变量
            if(gScope.containsClass(it.identifier, true)){
                currentEntity = new IROtherLiteral(it.identifier, new IRType("ptr"));
            } else {
                int num = currentReNamer.getCurrentVarNum(it.identifier, false);
                if(num > 0) { // 局部变量
                    String actualName = "%" + it.identifier + "." + num;
                    IRVariable ptr = new IRVariable(actualName);
                    IRVariable result = new IRVariable("%var" + String.valueOf(counter.varCounter++), Type_To_IRType(it.type));
                    currentBlock.instructions.add(new IR.instruction.LoadInstr(currentBlock, ptr, result, Type_To_IRType(it.type)));
                    currentEntity = result;
                    currentPtr = ptr;
                } else { // 全局变量 & 类变量
                    if(currentClassName != null) {
                        IRVariable result1 = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("ptr"));
                        String actualName = "%_this." + currentReNamer.getTotalVarNum("_this");
                        LoadInstr loadInstr = new LoadInstr(currentBlock, new IRVariable(actualName), result1, new IRType("ptr"));
                        currentBlock.instructions.add(loadInstr);
                        ClassInfor struct = gScope.getClassInfo(currentClassName);
                        IRVariable result2 = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("ptr"));
                        String className = "%class.." + currentClassName;
                        GeteleptrInstr geteleptrInstr = new GeteleptrInstr(currentBlock, result2, className, result1, Type_To_IRType(it.type));
                        geteleptrInstr.idxList.add(new IRIntLiteral(0));
                        struct.varNames.forEach(varName -> {
                            if(varName.equals(it.identifier)){
                                geteleptrInstr.idxList.add(new IRIntLiteral(struct.varNames.indexOf(varName)));
                            }
                        });
                        currentBlock.instructions.add(geteleptrInstr);
                        IRVariable result3 = new IRVariable("%var" + String.valueOf(counter.varCounter++), Type_To_IRType(it.type));
                        LoadInstr loadInstr1 = new LoadInstr(currentBlock, result2, result3, Type_To_IRType(it.type));
                        currentBlock.instructions.add(loadInstr1);
                        currentEntity = result3;
                        currentPtr = result2;
                    } else {
                        IRVariable loadValue = new IRVariable("%var" + String.valueOf(counter.varCounter++), Type_To_IRType(it.type));
                        if(it.type.isString){
                            int count = currentReNamer.getCurrentVarNum(it.identifier, false);
                            String actualName1;
                            if(count != -1) actualName1 = "%" + it.identifier + "." + count;
                            else actualName1 = "@" + it.identifier;
                            LoadInstr loadInstr1 = new LoadInstr(currentBlock, new IRVariable(actualName1), loadValue, new IRType("ptr"));
                            currentBlock.instructions.add(loadInstr1);
                            currentEntity = loadValue;
                            currentPtr = new IRVariable(actualName1);
                            return;
                        }
                        // 错误：全局变量都是指针，需要 load出来
                        String actualName = "@" + it.identifier;
                        IRVariable ptr = new IRVariable(actualName);
//                        IRGlobalVariDef irGlobalVariDef = new IRGlobalVariDef(actualName);
                        LoadInstr loadInstr = new LoadInstr(currentBlock, ptr, loadValue, Type_To_IRType(it.type));
                        currentBlock.instructions.add(loadInstr);
                        currentEntity = loadValue;
                        currentPtr = ptr;
//                        if (it.type.isBool) {
//                            irGlobalVariDef.irType = new IRType("i1");
//                            irGlobalVariDef.result = new IRBoolLiteral(false);
//                            irProgram.globalVarDefMap.put(it.identifier, irGlobalVariDef);
//                        } else if(it.type.isInt){
//                            irGlobalVariDef.irType = new IRType("i32");
//                            irGlobalVariDef.result = new IRIntLiteral(0);
//                            irProgram.globalVarDefMap.put(it.identifier, irGlobalVariDef);
//                        } else if(it.type.dim > 0){
//                            irGlobalVariDef.irType = new IRType("ptr");
//                            irGlobalVariDef.result = new IROtherLiteral("null", new IRType("ptr"));
//                            irProgram.globalVarDefMap.put(it.identifier, irGlobalVariDef);
//                        }
                    }
                }
            }
        } else if(it.isTrue) {
            currentEntity = new IRBoolLiteral(true);
            currentEntity.type = new IRType("i1");
        } else if(it.isFalse) {
            currentEntity = new IRBoolLiteral(false);
            currentEntity.type = new IRType("i1");
        } else if(it.isIntLiteral) {
            currentEntity = new IRIntLiteral(Integer.parseInt(it.intLiteral));
            currentEntity.type = new IRType("i32");
        } else if(it.isStringLiteral){
            int num = counter.strCounter++;
            String actualName = "@.str.." + num;
            IRGlobalVariDef irGlobalVariDef = new IRGlobalVariDef(actualName);
            irGlobalVariDef.irType = new IRType("ptr");
            irGlobalVariDef.result = new IROtherLiteral(it.stringLiteral, new IRType("ptr"));
            irProgram.globalVarDefMap.put(actualName, irGlobalVariDef);
            currentEntity = currentPtr = new IRVariable(actualName);
        } else if(it.isFmtString){
            it.fmtString.accept(this);
        } else if(it.isLiteral){
            it.literal.accept(this);
        } else if(it.isNull){
            currentEntity = new IROtherLiteral("null", new IRType("ptr"));
            currentEntity.type = new IRType("ptr");
        } else if(it.isThis){
            String actualName = "%_this." + currentReNamer.getTotalVarNum("_this");
            IRVariable retValue = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("ptr"));
            LoadInstr loadInstr = new LoadInstr(currentBlock, new IRVariable(actualName), retValue, new IRType("ptr"));
            currentBlock.instructions.add(loadInstr);
            currentPtr = new IRVariable(actualName);
            currentEntity = retValue;
        }
    }

    @Override public void visit(FmtString it) {
        if(it.stringList != null){
            int num = counter.strCounter++;
            String actualName = "@.str.." + num;
            IRGlobalVariDef irGlobalVariDef = new IRGlobalVariDef(actualName);
            irGlobalVariDef.irType = new IRType("ptr");
            irGlobalVariDef.result = new IROtherLiteral(it.stringList.getFirst(), new IRType("ptr"));
            irProgram.globalVarDefMap.put(actualName, irGlobalVariDef);
            currentEntity = new IRVariable(actualName);
        }
        for(int i = 0; i < it.exprList.size(); i++) {
            IREntity irEntity1 = currentEntity;
            it.exprList.get(i).accept(this);
            IREntity irEntity2 = currentEntity;

            // irEntity2存放 expr
            if(it.exprList.get(i).type.isString){

            } else if(it.exprList.get(i).type.isInt){
                IRVariable retValue = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("ptr"));
                CallInstr callInstr = new CallInstr(currentBlock, "Int_toString", retValue);
                callInstr.argTypes.add(new IRType("i32"));
                callInstr.args.add(irEntity2);
                currentBlock.instructions.add(callInstr);
                currentEntity = retValue;
            } else if(it.exprList.get(i).type.isBool){
                IRVariable retValue = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("ptr"));
                CallInstr callInstr = new CallInstr(currentBlock, "Bool_toString", retValue);
                callInstr.argTypes.add(new IRType("i1"));
                callInstr.args.add(irEntity2);
                currentBlock.instructions.add(callInstr);
                currentEntity = retValue;
            }

            IRVariable retValue = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("ptr"));
            CallInstr callInstr = new CallInstr(currentBlock, "string.add", retValue);
            callInstr.argTypes.add(new IRType("ptr"));
            callInstr.argTypes.add(new IRType("ptr"));
            callInstr.args.add(irEntity1);
            callInstr.args.add(currentEntity);
            currentBlock.instructions.add(callInstr);

            int count = counter.strCounter++;
            String actualName1 = "@.str.." + count;
            IRGlobalVariDef irGlobalVariDef1 = new IRGlobalVariDef(actualName1);
            irGlobalVariDef1.irType = new IRType("ptr");
            irGlobalVariDef1.result = new IROtherLiteral(it.stringList.get(i+1), new IRType("ptr"));
            irProgram.globalVarDefMap.put(it.stringList.get(i+1), irGlobalVariDef1);

            IRVariable retValue1 = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("ptr"));
            CallInstr callInstr1 = new CallInstr(currentBlock, "string.add", retValue1);
            callInstr1.argTypes.add(new IRType("ptr"));
            callInstr1.argTypes.add(new IRType("ptr"));
            callInstr1.args.add(retValue);
            callInstr1.args.add(new IRVariable(actualName1));
            currentBlock.instructions.add(callInstr1);

            currentEntity = retValue1;
            currentPtr = retValue1;
        }
    }

    @Override public void visit(UnaryExpr it) {
        it.expr.accept(this);
        IRVariable retValue = new IRVariable("%var" + String.valueOf(counter.varCounter++), new IRType("i32"));
        switch (it.op){
            case "+", "-" -> {
                currentBlock.instructions.add(new IR.instruction.BinaryInstr(currentBlock, retValue, it.op, new IRIntLiteral(0), currentEntity));
            }
            case "~" -> {
                currentBlock.instructions.add(new IR.instruction.BinaryInstr(currentBlock, retValue, "^", currentEntity, new IRIntLiteral(-1)));
            }
            case "!" -> {
                currentBlock.instructions.add(new IR.instruction.BinaryInstr(currentBlock, retValue, "^", currentEntity, new IRBoolLiteral(true)));
            }
        }
        currentEntity = retValue;
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
        currentReNamer = new ReNamer(currentReNamer);
        if(it.parallelExp != null) it.parallelExp.accept(this);
        if(it.variableDef != null) it.variableDef.accept(this);

        int currentNum = counter.forCounter++;
        IRBlock backBlock = new IRBlock(currentBlock.parent, "for.back." + currentNum);
        IRBlock condBlock = new IRBlock(currentBlock.parent, "for.cond." + currentNum);
        IRBlock bodyBlock = new IRBlock(currentBlock.parent, "for.body." + currentNum);
        IRBlock stepBlock = new IRBlock(currentBlock.parent, "for.step." + currentNum);
        currentScope.loopNext = stepBlock;
        currentScope.loopEnd = backBlock;
        currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, condBlock));

        if(it.conditionExp != null){
            currentBlock.parent.addBlock(condBlock);
            currentBlock = condBlock;
            it.conditionExp.accept(this);
            currentBlock.instructions.add(new IR.instruction.BrInstr(currentBlock, (IRVariable)currentEntity, bodyBlock, backBlock));
        } else {
            currentBlock.parent.addBlock(condBlock);
            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, condBlock));
            currentBlock = condBlock;
            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, bodyBlock));
        }

        if(it.stmt != null){
            currentBlock.parent.addBlock(bodyBlock);
            currentBlock = bodyBlock;
            it.stmt.accept(this);
            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, stepBlock));
        } else {
            currentBlock.parent.addBlock(bodyBlock);
            currentBlock = bodyBlock;
            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, stepBlock));
        }

        if(it.stepExp != null){
            currentBlock.parent.addBlock(stepBlock);
            currentBlock = stepBlock;
            it.stepExp.accept(this);
            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, condBlock));
        } else {
            currentBlock.parent.addBlock(stepBlock);
            currentBlock = stepBlock;
            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, condBlock));
        }

        currentBlock.parent.addBlock(backBlock);
        currentBlock = backBlock;
        currentScope = currentScope.parentScope();
        currentReNamer = currentReNamer.getParent();
    }
    @Override public void visit(IfStmt it) {
        it.condition.accept(this);

        int num = counter.ifCounter++;
        IRBlock thenBlock = new IRBlock(currentBlock.parent, "if.then." + num);
        IRBlock elseBlock = new IRBlock(currentBlock.parent, "if.else." + num);
        IRBlock backBlock = new IRBlock(currentBlock.parent, "if.back." + num);

        // 两种情况，一种是直接的bool值，一种是变量
        if(currentEntity instanceof IRBoolLiteral literal) {
            if(literal.value) {
                currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, thenBlock));
            } else {
                currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, elseBlock));
            }
        } else {
            currentBlock.instructions.add(new IR.instruction.BrInstr(currentBlock, currentEntity, thenBlock, elseBlock));
        }

        // 错误：这里必须是currentBlock,比如处理if的嵌套
        if(it.thenStmt != null) {
            currentBlock.parent.addBlock(thenBlock);
            currentBlock = thenBlock;
            currentReNamer = new ReNamer(currentReNamer);
            it.thenStmt.accept(this);
            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, backBlock));
            currentReNamer = currentReNamer.getParent();
            currentBlock = backBlock;
        } else {
            currentBlock.parent.addBlock(thenBlock);
            currentBlock = thenBlock;
            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, backBlock));
            currentBlock = backBlock;
        }

        if(it.elseStmt != null) {
            currentBlock.parent.addBlock(elseBlock);
            currentBlock = elseBlock;
            currentReNamer = new ReNamer(currentReNamer);
            it.elseStmt.accept(this);
            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, backBlock));
            currentReNamer = currentReNamer.getParent();
            currentBlock = backBlock;
        } else{
            currentBlock.parent.addBlock(elseBlock);
            currentBlock = elseBlock;
            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, backBlock));
            currentBlock = backBlock;
        }
        currentBlock.parent.addBlock(backBlock);
        currentBlock = backBlock;
    }
    @Override public void visit(ReturnStmt it) {
        if(it.expr != null) {
            it.expr.accept(this);
            currentBlock.instructions.add(new IR.instruction.RetInstr(currentBlock, currentEntity, Type_To_IRType(it.expr.type)));
        } else {
            currentBlock.instructions.add(new IR.instruction.RetInstr(currentBlock, null, new IRType("void")));
        }
    }
    @Override public void visit(Suite it) {
        currentReNamer = new ReNamer(currentReNamer);
        it.stmt.forEach(stmt -> stmt.accept(this));
        currentReNamer = currentReNamer.getParent();
    }
    @Override public void visit(VariableDefStmt it) {
        it.variableDef.accept(this);
    }
    @Override public void visit(WhileStmt it) {
        it.condition.accept(this);
        currentScope = new LoopScope(currentScope);

        int num = counter.whileCounter++;
        IRBlock backBlock = new IRBlock(currentBlock.parent, "while.back." + num);
        IRBlock condBlock = new IRBlock(currentBlock.parent, "while.cond." + num);
        IRBlock bodyBlock = new IRBlock(currentBlock.parent, "while.body." + num);
        currentScope.loopNext = condBlock;
        currentScope.loopEnd = backBlock;
        currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, condBlock));

        if(it.condition != null){
            currentBlock.parent.addBlock(condBlock);
            currentBlock = condBlock;
            it.condition.accept(this);
            currentBlock.instructions.add(new IR.instruction.BrInstr(currentBlock, currentEntity, bodyBlock, backBlock));
        }

        if(it.body != null){
            currentBlock.parent.addBlock(bodyBlock);
            currentBlock = bodyBlock;
            currentReNamer = new ReNamer(currentReNamer);
            it.body.accept(this);
            currentReNamer = currentReNamer.getParent();
            currentBlock.instructions.add(new IR.instruction.JumpInstr(currentBlock, condBlock));
        }

        currentBlock.parent.addBlock(backBlock);
        currentBlock = backBlock;
        currentScope = currentScope.parentScope();
    }
    @Override public void visit(EmptyStmt it) {}

}
