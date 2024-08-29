package ASM;

import ASM.instr.ASMArithImmInstr;
import ASM.instr.ASMLiInstr;
import ASM.instr.ASMSwInstr;
import ASM.section.ASMData;
import ASM.section.ASMRodata;
import ASM.section.ASMText;
import ASM.instr.*;
import IR.IRBlock;
import IR.IRProgram;
import IR.IRVisitor;
import IR.definition.IRClassDef;
import IR.definition.IRFuncDef;
import IR.definition.IRGlobalVariDef;
import IR.definition.IRStatement;
import IR.entity.*;
import IR.instruction.*;

public class ASMBuilder implements IRVisitor {

    // 参考了 indigolxy

    public IRProgram irProgram = null;
    public ASMProgram asmProgram = new ASMProgram();
    public ASMText currentText = null;

    public ASMBuilder(IRProgram irProgram) {
        this.irProgram = irProgram;
    }

    @Override public void visit(IRProgram irProgram){
        for(IRGlobalVariDef irGlobal : irProgram.globalVarDefMap.values()) {
            irGlobal.accept(this);
        }
        for(IRClassDef irClass : irProgram.classDefMap.values()) {
            irClass.accept(this);
        }
        for(IRFuncDef irFunction : irProgram.funcDefMap.values()) {
            irFunction.accept(this);
        }
    }

    @Override public void visit(IRClassDef irClassDef){}

    @Override public void visit(IRFuncDef irFuncDef){
        int stackSize = getStackSize(irFuncDef);

        irFuncDef.stackSize = stackSize;
        int paraSize = irFuncDef.parameterNameList.size();
        for(int i = 0; i < paraSize; ++i) {
            if(i >= 8){
                irFuncDef.offsetMap.put(irFuncDef.parameterNameList.get(i), stackSize + 4 * (i - 8));
            } else {
                irFuncDef.paraMap.put(irFuncDef.parameterNameList.get(i), "a" + i);
            }
        }
        ASMText startText = new ASMText(irFuncDef.functionName);
        asmProgram.TextList.add(startText);

        irFuncDef.blockList.forEach(block -> block.accept(this));

        // addi越界的问题
        if(stackSize <= 2000){
            startText.instrList.add(new ASMArithImmInstr(currentText, "sp", "sp", "+", -stackSize - 12));
        } else {
            startText.instrList.add(new ASMLiInstr(currentText, "t0", -stackSize - 12));
            startText.instrList.add(new ASMArithInstr(currentText, "t0", "sp", "sp", "+"));
        }
        startText.instrList.add(new ASMSwInstr(currentText, "t0", "sp", stackSize));
        startText.instrList.add(new ASMSwInstr(currentText, "t1", "sp", stackSize + 4));
        startText.instrList.add(new ASMSwInstr(currentText, "t2", "sp", stackSize + 8));

    }

    @Override public void visit(IRBlock irBlock) {
        currentText = new ASMText(irBlock.parent.functionName + "_" + irBlock.name);
        asmProgram.TextList.add(currentText);
        irBlock.instructions.forEach(instruction -> instruction.accept(this));
    }

    @Override public void visit(IRGlobalVariDef irGlobalVariDef){
        if(irGlobalVariDef.varName.startsWith("@.str")){
            String myString = irGlobalVariDef.result.toString();
            ASMRodata rodata = new ASMRodata(irGlobalVariDef.varName, myString);
            asmProgram.RodataList.add(rodata);
        } else if(irGlobalVariDef.irType.isPtr() && irGlobalVariDef.result.toString().equals("")){
            ASMData data = new ASMData(irGlobalVariDef.varName, 0);
            asmProgram.DataList.add(data);
        } else {
            String result = irGlobalVariDef.result.toString();
            if(result.equals("null")) asmProgram.DataList.add(new ASMData(irGlobalVariDef.varName, 0));
            if(result.equals("false") || result.equals("true") || result.equals("null")){
                System.exit(0);
            }
            else asmProgram.DataList.add(new ASMData(irGlobalVariDef.varName, Integer.parseInt(result)));
        }
    }

    @Override public void visit(IRStatement irStatement){
        irStatement.accept(this);
    }

    @Override public void visit(AllocInstr allocInstr){
        currentText.instrList.add(new ASMComment(currentText, allocInstr));
        int usedSize = allocInstr.parent.parent.getPlace(allocInstr.irVariable.name);
        if(usedSize + 4 <= 2000){
            currentText.instrList.add(new ASMArithImmInstr(currentText, "t0", "sp", "+", usedSize + 4));
        } else {
            currentText.instrList.add(new ASMLiInstr(currentText, "t0", usedSize + 4));
            currentText.instrList.add(new ASMArithInstr(currentText, "t0", "sp", "t0", "+"));
        }
        currentText.instrList.add(new ASMSwInstr(currentText, "t0", "sp", usedSize));
    }

    @Override public void visit(BinaryInstr binaryInstr){
        currentText.instrList.add(new ASMComment(currentText, binaryInstr));
        int resultPlace = binaryInstr.parent.parent.getPlace(binaryInstr.result.toString());
        loadIREntity(binaryInstr.lhs, "t0", binaryInstr.parent.parent);
        loadIREntity(binaryInstr.rhs, "t1", binaryInstr.parent.parent);
        currentText.instrList.add(new ASMArithInstr(currentText, "t0", "t1", "t2", binaryInstr.op));
        currentText.instrList.add(new ASMSwInstr(currentText,"t2", "sp", resultPlace));
    }

    @Override public void visit(BrInstr brInstr){
        currentText.instrList.add(new ASMComment(currentText, brInstr));
        int place = brInstr.parent.parent.getPlace(brInstr.op.toString());
        currentText.instrList.add(new ASMLwInstr(currentText, "t0", "sp", place));
        currentText.instrList.add(new ASMBranchInstr(currentText, "!=", "t0", "x0", ".+8"));
        currentText.instrList.add(new ASMJInstr(currentText, brInstr.parent.parent.functionName + "_" + brInstr.rhs.name));
        currentText.instrList.add(new ASMJInstr(currentText, brInstr.parent.parent.functionName + "_" + brInstr.lhs.name));
    }

    @Override public void visit(CallInstr callInstr){
        currentText.instrList.add(new ASMComment(currentText, callInstr));

        currentText.instrList.add(new ASMSwInstr(currentText, "ra", "sp", callInstr.parent.parent.stackSize - 4));
        for(int i = 0; i < callInstr.args.size(); ++i){
            if(i < 8){
                loadIREntity(callInstr.args.get(i), "a" + i, callInstr.parent.parent);
            } else {
                int size = (callInstr.args.size() - 8) * 4;
                int offSet = -size + 4 * (i - 8);
                loadIREntity(callInstr.args.get(i), "t0", callInstr.parent.parent);
                currentText.instrList.add(new ASMSwInstr(currentText, "t0", "sp", offSet));
            }
        }
        if(callInstr.args.size() > 8){
            int size = (callInstr.args.size() - 8) * 4;
            currentText.instrList.add(new ASMArithImmInstr(currentText, "sp", "sp", "+", -size));
            currentText.instrList.add(new ASMCallInstr(currentText, callInstr.funcName));
            currentText.instrList.add(new ASMArithImmInstr(currentText, "sp", "sp", "+", size));
        } else {
            currentText.instrList.add(new ASMCallInstr(currentText, callInstr.funcName));
        }

        currentText.instrList.add(new ASMLwInstr(currentText, "ra", "sp", callInstr.parent.parent.stackSize - 4));
        currentText.instrList.add(new ASMSwInstr(currentText, "a0", "sp", callInstr.parent.parent.getPlace(callInstr.result.toString())));
    }

    @Override public void visit(GeteleptrInstr geteleptrInstr){
        currentText.instrList.add(new ASMComment(currentText, geteleptrInstr));

        loadIREntity(geteleptrInstr.ptrValue, "t0", geteleptrInstr.parent.parent);
        loadIREntity(geteleptrInstr.idxList.getLast(), "t1", geteleptrInstr.parent.parent);

        currentText.instrList.add(new ASMLiInstr(currentText, "t2", 4));
        currentText.instrList.add(new ASMArithInstr(currentText, "t1", "t2", "t1", "*"));
        currentText.instrList.add(new ASMArithInstr(currentText, "t1", "t0", "t0", "+"));

        currentText.instrList.add(new ASMSwInstr(currentText, "t0", "sp", geteleptrInstr.parent.parent.getPlace(geteleptrInstr.result.toString())));
    }

    @Override public void visit(IcmpInstr icmpInstr){
        currentText.instrList.add(new ASMComment(currentText, icmpInstr));

        loadIREntity(icmpInstr.lhs, "t0", icmpInstr.parent.parent);
        loadIREntity(icmpInstr.rhs, "t1", icmpInstr.parent.parent);
        int resultPlace = icmpInstr.parent.parent.getPlace(icmpInstr.result.toString());

        // t2 = t0 - t1, 然后t2传到 set指令里面
        // set指令：t0 <- t2
        currentText.instrList.add(new ASMArithInstr(currentText, "t0", "t1", "t2", "-"));
        switch (icmpInstr.op) {
            case ">", "==", "<", "!=" -> {
                currentText.instrList.add(new ASMSetInstr(currentText, icmpInstr.op, "t0", "t2"));
            }
            case ">=" -> {
                currentText.instrList.add(new ASMSetInstr(currentText, ">", "t0", "t2"));
                currentText.instrList.add(new ASMSetInstr(currentText, "==", "t1", "t2"));
                currentText.instrList.add(new ASMArithInstr(currentText, "t0", "t1", "t0", "|"));
            }
            case "<=" -> {
                currentText.instrList.add(new ASMSetInstr(currentText, "<", "t0", "t2"));
                currentText.instrList.add(new ASMSetInstr(currentText, "==", "t1", "t2"));
                currentText.instrList.add(new ASMArithInstr(currentText, "t0", "t1", "t0", "|"));
            }
            default -> {
                throw new RuntimeException("invalid icmp op");
            }
        }
        currentText.instrList.add(new ASMSwInstr(currentText,"t0", "sp", resultPlace));
    }

    @Override public void visit(JumpInstr jumpInstr){
        currentText.instrList.add(new ASMComment(currentText, jumpInstr));
        currentText.instrList.add(new ASMJInstr(currentText, jumpInstr.parent.parent.functionName + "_" + jumpInstr.target.name));
    }

    @Override public void visit(LoadInstr loadInstr){
        currentText.instrList.add(new ASMComment(currentText, loadInstr));
        int resultPlace = loadInstr.parent.parent.getPlace(loadInstr.result.toString());
        loadIREntity(loadInstr.ptr, "t0", loadInstr.parent.parent);
        currentText.instrList.add(new ASMLwInstr(currentText, "t1", "t0", 0));
        currentText.instrList.add(new ASMSwInstr(currentText, "t1", "sp", resultPlace));
    }

    @Override public void visit(PhiInstr phiInstr){}

    @Override public void visit(RetInstr retInstr){
        currentText.instrList.add(new ASMComment(currentText, retInstr));
        if(!retInstr.retType.isVoid()){
            loadIREntity(retInstr.retValue, "a0", retInstr.parent.parent);
        }
        if(retInstr.parent.parent.stackSize < 2000){
            currentText.instrList.add(new ASMArithImmInstr(currentText, "sp", "sp", "+", retInstr.parent.parent.stackSize + 12));
        } else {
            currentText.instrList.add(new ASMLiInstr(currentText, "t3", retInstr.parent.parent.stackSize + 12));
            currentText.instrList.add(new ASMArithInstr(currentText, "t3", "sp", "sp", "+"));
        }
        currentText.instrList.add(new ASMLwInstr(currentText, "t0", "sp", -12));
        currentText.instrList.add(new ASMLwInstr(currentText, "t1", "sp", -8));
        currentText.instrList.add(new ASMLwInstr(currentText, "t2", "sp", -4));
        currentText.instrList.add(new ASMRetInstr(currentText));
    }

    @Override public void visit(StoreInstr storeInstr){
        currentText.instrList.add(new ASMComment(currentText, storeInstr));

        int paraPlace = isParaVar(storeInstr.value.toString(), storeInstr.parent.parent);
        if(paraPlace == -1){
            loadIREntity(storeInstr.value, "t0", storeInstr.parent.parent);
        } else {
            if(paraPlace < 8){
                currentText.instrList.add(new ASMMvInstr(currentText, "t0", "a" + paraPlace));
            } else {
                currentText.instrList.add(new ASMSwInstr(currentText, "t0", "sp", storeInstr.parent.parent.offsetMap.get(storeInstr.value.toString())));
            }
        }
        loadIREntity(storeInstr.ptr, "t1", storeInstr.parent.parent);
        currentText.instrList.add(new ASMSwInstr(currentText, "t0", "t1", 0));
    }

    private void loadIREntity(IREntity entity, String rd, IRFuncDef irFuncDef) {
        if(entity instanceof IRIntLiteral){
            currentText.instrList.add(new ASMLiInstr(currentText, rd, ((IRIntLiteral) entity).value));
        } else if(entity instanceof IRBoolLiteral){
            currentText.instrList.add(new ASMLiInstr(currentText, rd, ((IRBoolLiteral) entity).value ? 1 : 0));
        } else if(isGlobalVar(entity.toString())){
            currentText.instrList.add(new ASMLaInstr(currentText, rd, entity.toString()));
        } else if(entity instanceof IROtherLiteral){
            // 只在globalvariableMap里面出现，或者literal里面出现
            if(entity.toString().equals("null")){
                currentText.instrList.add(new ASMLiInstr(currentText, rd, 0));
            } else {
                System.exit(0);
            }
        } else if(entity instanceof IRVariable){
            int place = irFuncDef.getPlace(entity.toString());
            currentText.instrList.add(new ASMLwInstr(currentText, rd, "sp", place));
        } else {
            throw new RuntimeException("invalid entity");
        }
    }

    private boolean isGlobalVar(String name) {
        for(IRGlobalVariDef irGlobal : irProgram.globalVarDefMap.values()) {
            if(irGlobal.varName.equals(name)) return true;
        }
        return false;
    }

    private int isParaVar(String name, IRFuncDef irFuncDef) {
        for(int i = 0; i < irFuncDef.parameterNameList.size(); ++i) {
            if(irFuncDef.parameterNameList.get(i).equals(name)) return i;
        }
        return -1;
    }

    private int getStackSize(IRFuncDef irFuncDef){
        int stackSize = 0;
        for(int i = 0; i < irFuncDef.blockList.size(); ++i){
            for(int j = 0; j < irFuncDef.blockList.get(i).instructions.size(); ++j){
                Instruction instruction = irFuncDef.blockList.get(i).instructions.get(j);
                if(instruction instanceof AllocInstr allocInstr){
                    // 错误：这里是allocInstr.irVariable.name，而不是allocInstr.varName
                    irFuncDef.nameMap.put(allocInstr.irVariable.name, stackSize);
                    stackSize += 8;
                } else if(instruction instanceof BinaryInstr binaryInstr){
                    irFuncDef.nameMap.put(binaryInstr.result.toString(), stackSize);
                    stackSize += 4;
                } else if(instruction instanceof BrInstr){
                } else if(instruction instanceof CallInstr){
                    irFuncDef.nameMap.put(((CallInstr) instruction).result.toString(), stackSize);
                    stackSize += 4;
                } else if(instruction instanceof GeteleptrInstr){
                    irFuncDef.nameMap.put(((GeteleptrInstr) instruction).result.toString(), stackSize);
                    stackSize += 4;
                } else if(instruction instanceof IcmpInstr){
                    irFuncDef.nameMap.put(((IcmpInstr) instruction).result.toString(), stackSize);
                    stackSize += 4;
                } else if(instruction instanceof JumpInstr){
                } else if(instruction instanceof LoadInstr){
                    irFuncDef.nameMap.put(((LoadInstr) instruction).result.toString(), stackSize);
                    stackSize += 4;
                } else if(instruction instanceof PhiInstr){
                    throw new RuntimeException("PhiInstr should not appear in IRFuncDef");
                } else if(instruction instanceof RetInstr){
                } else if(instruction instanceof StoreInstr){
                }
            }
        }
        stackSize += 4;
        return stackSize;
    }
}
