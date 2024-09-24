package IROptimize.Mem2reg;

import IR.IRBlock;
import IR.IRProgram;
import IR.definition.IRFuncDef;
import IR.entity.IREntity;
import IR.entity.IRVariable;
import IR.instruction.*;
import Util.type.IRType;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Stack;

public class PutPhi {

    public IRProgram program;

    public HashMap<String, IRType> varType = new HashMap<>();// var -> IRType
    public HashMap<String, ArrayList<IRBlock>> defBlocks = new HashMap<>();// var -> defBlocks
    public HashMap<String, ArrayList<IRBlock>> useBlocks = new HashMap<>();// var -> useBlocks
    public HashMap<String, Stack<String>> varRename = new HashMap<>(); // var -> rename

    public PutPhi(IRProgram program) {
        this.program = program;
    }

    public void work() {
        program.funcDefMap.forEach((_, func) -> collectDataFunc(func));
        varType.forEach(this::insertPhi);
        program.funcDefMap.forEach((_, func) -> reNameFunc(func));
    }

    public void collectDataFunc(IRFuncDef funcDef) {
        funcDef.blockList.forEach(this::collectDataBlock);
    }

    public void collectDataBlock(IRBlock block) {
        for (Instruction instruction : block.instructions) {
            if (instruction instanceof AllocInstr allocInstr) {
                String var = allocInstr.varName;
                varType.put(var, allocInstr.irType);
                defBlocks.put(var, new ArrayList<>());
                useBlocks.put(var, new ArrayList<>());
            } else if (instruction instanceof StoreInstr storeInstr) {
                // TODO
                String var = storeInstr.ptr.toString();
                if(varType.containsKey(var)) {
                    defBlocks.get(var).add(block);
                }
            } else if (instruction instanceof LoadInstr loadInstr) {
                // TODO
                String var = loadInstr.ptr.toString();
                if(varType.containsKey(var)) {
                    useBlocks.get(var).add(block);
                }
            }
        }
    }

    public void insertPhi(String var, IRType type) {
        // varName -> defBlock -> insertPhi -> frontiers(insertPhi)
        ArrayList<IRBlock> defBlockList = defBlocks.get(var);
        ArrayList<IRBlock> workList = new ArrayList<>(defBlockList);
        for(IRBlock block : workList){
            PhiInstr phiInstr = new PhiInstr(block, new IRVariable(var, varType.get(var)), varType.get(var));
            for(var pred : block.preds) {
                phiInstr.addBranch(null, pred);
            }
            block.phiInsts.put(var, phiInstr);
            for(IRBlock frontier : block.domFrontier) {
                if(!workList.contains(frontier)) {
                    workList.add(frontier);
                }
            }
        }
    }

    public void reNameFunc(IRFuncDef funcDef) {
        funcDef.blockList.forEach(this::reNameBlock);
    }

    public void reNameBlock(IRBlock block) {
        if(block.alreadyRenamed) return;
        block.alreadyRenamed = true;
        block.phiInsts.forEach((var, phiInstr) -> {
            phiInstr.result = new IRVariable(phiInstr.result.toString() + "_" + block.name, phiInstr.result.type);
            varRename.get(var).add(phiInstr.result.toString());
            for(Instruction instruction : block.instructions) {
                if(instruction instanceof StoreInstr storeInstr) {
                    if(storeInstr.value.toString().equals(var)){
                        storeInstr.value = new IRVariable(phiInstr.result.toString(), storeInstr.value.type);
                        varRename.get(var).pop();
                        varRename.get(var).add(storeInstr.ptr.toString());
                    }
                } else if(instruction instanceof AllocInstr allocInstr) {
                    eraseAlloc(allocInstr);
                }
                reNameInst(instruction, var, phiInstr.result.toString());
            }
        });
        block.phiInsts.forEach((name, _) -> {
            block.succs.forEach(IRBlock -> {
                IRBlock.phiInsts.forEach((var, phiInstr) -> {
                    if(var.equals(name)) {
                        if(phiInstr.blocks.contains(block)) {
                            phiInstr.values.set(phiInstr.blocks.indexOf(block), new IRVariable(varRename.get(var).peek(), varType.get(var)));
                        } else {
                            phiInstr.addBranch(new IRVariable(varRename.get(var).peek(), varType.get(var)), block);
                        }
                    }
                });
                reNameBlock(IRBlock);
            });
        });
        block.phiInsts.forEach((var, _) -> varRename.get(var).pop());
    }

    public void reNameInst(Instruction instruction, String origin, String rename) {
        if(instruction instanceof BinaryInstr binaryInstr) {
            if(binaryInstr.lhs.toString().equals(origin)) {
                binaryInstr.lhs = new IRVariable(rename, binaryInstr.lhs.type);
            }
            if(binaryInstr.rhs.toString().equals(origin)) {
                binaryInstr.rhs = new IRVariable(rename, binaryInstr.rhs.type);
            }
            if(binaryInstr.result.toString().equals(origin)) {
                binaryInstr.result = new IRVariable(rename, binaryInstr.result.type);
            }
        } else if(instruction instanceof BrInstr brInstr) {
            if(brInstr.op.toString().equals(origin)) {
                brInstr.op = new IRVariable(rename, brInstr.op.type);
            }
        } else if(instruction instanceof CallInstr callInstr) {
            if(callInstr.result.toString().equals(origin)) {
                callInstr.result = new IRVariable(rename, callInstr.result.type);
            }
            for(int i = 0; i < callInstr.args.size(); i++) {
                if(callInstr.args.get(i).toString().equals(origin)) {
                    callInstr.args.set(i, new IRVariable(rename, callInstr.args.get(i).type));
                }
            }
        } else if(instruction instanceof GeteleptrInstr geteleptrInstr){
            if(geteleptrInstr.result.toString().equals(origin)) {
                geteleptrInstr.result = new IRVariable(rename, geteleptrInstr.result.type);
            }
            for (int i = 0; i < geteleptrInstr.idxList.size(); ++i) {
                IREntity idx = geteleptrInstr.idxList.get(i);
                if(idx.toString().equals(origin)) {
                    geteleptrInstr.idxList.set(i, new IRVariable(rename, idx.type));
                }
            }
        } else if(instruction instanceof IcmpInstr icmpInstr) {
            if(icmpInstr.lhs.toString().equals(origin)) {
                icmpInstr.lhs = new IRVariable(rename, icmpInstr.lhs.type);
            }
            if(icmpInstr.rhs.toString().equals(origin)) {
                icmpInstr.rhs = new IRVariable(rename, icmpInstr.rhs.type);
            }
            if(icmpInstr.result.toString().equals(origin)) {
                icmpInstr.result = new IRVariable(rename, icmpInstr.result.type);
            }
        } else if(instruction instanceof LoadInstr loadInstr) {
            if(loadInstr.result.toString().equals(origin)) {
                loadInstr.result = new IRVariable(rename, loadInstr.result.type);
            }
            if(loadInstr.ptr.toString().equals(origin)) {
                loadInstr.ptr = new IRVariable(rename, loadInstr.ptr.type);
            }
        } else if(instruction instanceof PhiInstr phiInstr) {
            if(phiInstr.result.toString().equals(origin)) {
                phiInstr.result = new IRVariable(rename, phiInstr.result.type);
            }
            for(int i = 0; i < phiInstr.values.size(); i++) {
                if(phiInstr.values.get(i).toString().equals(origin)) {
                    phiInstr.values.set(i, new IRVariable(rename, phiInstr.values.get(i).type));
                }
            }
        } else if(instruction instanceof RetInstr retInstr) {
            if(retInstr.retValue.toString().equals(origin)) {
                retInstr.retValue = new IRVariable(rename, retInstr.retValue.type);
            }
        } else if(instruction instanceof StoreInstr storeInstr) {
            if(storeInstr.ptr.toString().equals(origin)) {
                storeInstr.ptr = new IRVariable(rename, storeInstr.ptr.type);
            }
            if(storeInstr.value.toString().equals(origin)) {
                storeInstr.value = new IRVariable(rename, storeInstr.value.type);
            }
        }
    }

    public void eraseAlloc(AllocInstr allocInstr) {
        if(allocInstr.isChecked) return;
        allocInstr.isChecked = true;
        ArrayList<IRBlock> defList = defBlocks.get(allocInstr.varName);
        ArrayList<IRBlock> useList = useBlocks.get(allocInstr.varName);

        // 1. 没有被使用的 alloca 可以直接去掉；
        // 2. 如果只被定义了一次，那么所有的使用都可以用定义的值代替；
        // 3. 如果一个 alloca 的定义使用只出现在一个块中，那么每个 use 可以被最近的 def 替换；

        if(useList.isEmpty()){
            allocInstr.parent.instructions.remove(allocInstr);
        } else if(defList.size() == 1){
            if(useBlocks.size() == 1 && defList.getFirst().equals(useList.getFirst())){
                String currentName = allocInstr.varName;
                String originName = allocInstr.varName;
                int index = allocInstr.parent.instructions.indexOf(allocInstr);
                for(int i = index + 1; i < allocInstr.parent.instructions.size(); ++i){
                    Instruction instruction = allocInstr.parent.instructions.get(i);
                    if(instruction instanceof StoreInstr storeInstr){
                        if(storeInstr.ptr.toString().equals(originName)){
                            currentName = storeInstr.value.toString();
                        }
                    } else if(instruction instanceof LoadInstr loadInstr){
                        if(loadInstr.ptr.toString().equals(originName)){
                            loadInstr.ptr = new IRVariable(currentName, loadInstr.ptr.type);
                        }
                    }
                }
                allocInstr.parent.instructions.remove(allocInstr);
            } else {
                int defNum = 0;
                String defName = "";
                for(Instruction instruction : allocInstr.parent.instructions){
                    if(instruction instanceof StoreInstr storeInstr){
                        if(storeInstr.ptr.toString().equals(allocInstr.varName)){
                            defNum++;
                            defName = storeInstr.value.toString();
                            if(defNum > 1) break;
                        }
                    }
                }
                if(defNum > 1) return;
                for(IRBlock block : useList) {
                    for(Instruction instruction : block.instructions) {
                        if(instruction instanceof LoadInstr loadInstr){
                            if(loadInstr.ptr.toString().equals(allocInstr.varName)){
                                loadInstr.ptr = new IRVariable(defName, loadInstr.ptr.type);
                            }
                        }
                    }
                }
                allocInstr.parent.instructions.remove(allocInstr);
            }
        }


    }

}
