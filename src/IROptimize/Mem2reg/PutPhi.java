package IROptimize.Mem2reg;

import IR.IRBlock;
import IR.IRProgram;
import IR.definition.IRFuncDef;
import IR.entity.IREntity;
import IR.entity.IRIntLiteral;
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
    public ArrayList<String> getEleName = new ArrayList<>(); // 不能删除的 alloca 指令
    public HashMap<String, String> reNameMap = new HashMap<>(); // 需要重命名的变量以及其当前值，load导致的

    public PutPhi(IRProgram program) {
        this.program = program;
    }

    public void work() {
        program.funcDefMap.forEach((tmp, func) -> collectDataFunc(func));
        varType.forEach(this::insertPhi);
        program.funcDefMap.forEach((tmp, func) -> reNameFunc(func));
    }

    public void collectDataFunc(IRFuncDef funcDef) {
        // 统计有用的变量
        collectUsefulVar(funcDef);
        // 初始化变量的定义和使用,去除 alloca
        collectVar(funcDef);
        // 获取每个变量的 def 和 use
        getDefUse(funcDef);
    }

    public void collectUsefulVar(IRFuncDef funcDef) {
        for(IRBlock block : funcDef.blockList) {
            for(Instruction instruction : block.instructions) {
                if(instruction instanceof GeteleptrInstr geteleptrInstr) {
                    getEleName.add(geteleptrInstr.result.toString());
                } else if(instruction instanceof CallInstr callInstr) {
                    if(callInstr.funcName.equals("string.copy")) {
                        getEleName.add(callInstr.args.getFirst().toString());
                    }
                }
            }
        }
    }

    public void collectVar(IRFuncDef irFuncDef){
        for(int i = 0; i < irFuncDef.blockList.size(); ++i){
            IRBlock block = irFuncDef.blockList.get(i);
            ArrayList<Integer> eraseList = new ArrayList<>();
            for(int j = 0; j < block.instructions.size(); ++j){
                Instruction instruction = block.instructions.get(j);
                if(instruction instanceof AllocInstr allocInstr){
                    if(!getEleName.contains(allocInstr.varName)){
                        String var = allocInstr.varName;
                        varType.put(var, allocInstr.irType);
                        defBlocks.put(var, new ArrayList<>());
                        useBlocks.put(var, new ArrayList<>());
                        varRename.put(var, new Stack<>());
                        eraseList.add(j);
                    }
                }
            }
            for(int j = eraseList.size() - 1; j >= 0; --j){
                block.instructions.remove((int)eraseList.get(j));
            }
        }
    }

    public void getDefUse(IRFuncDef funcDef) {
        for (IRBlock block : funcDef.blockList) {
            for (Instruction instruction : block.instructions) {
                if (instruction instanceof StoreInstr storeInstr) {
                    String var = storeInstr.ptr.toString();
                    if(defBlocks.containsKey(var)) {
                        defBlocks.get(var).add(block);
                    }
                } else if (instruction instanceof LoadInstr loadInstr) {
                    String var = loadInstr.ptr.toString();
                    if(useBlocks.containsKey(var)) {
                        useBlocks.get(var).add(block);
                    }
                }
            }
        }
    }

    public void insertPhi(String var, IRType type) {
        // varName -> defBlock -> insertPhi -> frontiers(insertPhi)
        ArrayList<IRBlock> defBlockList = defBlocks.get(var);
        ArrayList<IRBlock> workList = new ArrayList<>(defBlockList);
        for(int i = 0; i < workList.size(); ++i){
            IRBlock block = workList.get(i);
            for(IRBlock frontier : block.domFrontier) {
                if(!workList.contains(frontier)) {
                    workList.add(frontier);
                }
                PhiInstr phiInstr = new PhiInstr(frontier, new IRVariable(var, varType.get(var)), varType.get(var));
                frontier.phiInsts.put(var, phiInstr);
            }
        }
    }

    public void reNameFunc(IRFuncDef funcDef) {
        funcDef.blockList.forEach(this::reNameBlock);
    }

    public void reNameBlock(IRBlock block) {
        if(block.alreadyRenamed) return;
        block.alreadyRenamed = true;

        for (Stack<String> stack : varRename.values()) {
            if (!stack.isEmpty()) stack.add(stack.getLast());
            else stack.add("fuck");
        }

        // 重命名 phi 指令
        block.phiInsts.forEach((var, phiInstr) -> {
            phiInstr.result = new IRVariable(phiInstr.result.toString() + "_" + block.name, phiInstr.result.type);
            varRename.get(var).pop();
            varRename.get(var).add(phiInstr.result.toString());
        });

        // 重命名 instruction
        ArrayList<Integer> eraseList = new ArrayList<>();
        for(int i = 0; i < block.instructions.size(); ++i) {
            Instruction instruction = block.instructions.get(i);
            reNameInst(instruction, i, eraseList);
        }

        // 删除已经重命名的 load 指令
        for(int i = eraseList.size() - 1; i >= 0; --i) {
            block.instructions.remove((int)eraseList.get(i));
        }

        // 重命名后继节点
        block.succs.forEach(IRBlock -> {
            IRBlock.phiInsts.forEach((var, phiInstr) -> {
                Stack<String> stack = varRename.get(var);
                if(!stack.isEmpty() && !stack.peek().equals("fuck")){
                    phiInstr.addBranch(new IRVariable(stack.peek(), varType.get(var)), block);
                } else {
                    IRType type = phiInstr.result.type;
                    if(type.isI1() || type.isI32()){
                        phiInstr.addBranch(new IRVariable("0", type), block);
                    } else if(type.isPtr()){
                        phiInstr.addBranch(new IRVariable("null", type), block);
                    } else {
                        throw new RuntimeException("Mem2Reg: rename: phiInstr type is not i1 or i32 or ptr");
                    }
                }
            });
            reNameBlock(IRBlock);
        });

        // 当前名字出栈
        varRename.forEach((var, stack) -> stack.pop());
    }

    public void reNameInst(Instruction instruction, int index, ArrayList<Integer> eraseList) {
        if(instruction instanceof StoreInstr storeInstr) {
            // 先重命名 storeInstr的 value
            if (storeInstr.value instanceof IRVariable var) {
                var.name = reNameMap.getOrDefault(var.name, var.name);
            }
            if(varRename.containsKey(storeInstr.ptr.toString())){
                if (storeInstr.value instanceof IRVariable var && reNameMap.containsKey(storeInstr.value.toString())) {
                    var.name = reNameMap.get(storeInstr.value.toString());
                }
                Stack<String> stack = varRename.get(storeInstr.ptr.toString());
                stack.pop();
                stack.add(storeInstr.value.toString());
                eraseList.add(index);
            }
        } else if(instruction instanceof LoadInstr loadInstr) {
            if(varRename.containsKey(loadInstr.ptr.toString())) {
//                loadInstr.ptr = new IRVariable(varRename.get(loadInstr.ptr.toString()).peek(), loadInstr.ptr.type);
                reNameMap.put(loadInstr.result.toString(), varRename.get(loadInstr.ptr.toString()).peek());
                eraseList.add(index);
            }
        } else if(instruction instanceof AllocInstr){
            // do nothing
        } else if(instruction instanceof BinaryInstr binaryInstr) {
            if(binaryInstr.lhs instanceof IRVariable var) {
                var.name = reNameMap.getOrDefault(var.name, var.name);
            }
            if(binaryInstr.rhs instanceof IRVariable var) {
                var.name = reNameMap.getOrDefault(var.name, var.name);
            }
        } else if(instruction instanceof BrInstr brInstr) {
            if(brInstr.op instanceof IRVariable var) {
                var.name = reNameMap.getOrDefault(var.name, var.name);
            }
        } else if(instruction instanceof CallInstr callInstr) {
            for(int i = 0; i < callInstr.args.size(); i++) {
                if(callInstr.args.get(i) instanceof IRVariable var) {
                    var.name = reNameMap.getOrDefault(var.name, var.name);
                }
            }
        } else if(instruction instanceof GeteleptrInstr geteleptrInstr){
            if(geteleptrInstr.ptrValue instanceof IRVariable var) {
                var.name = reNameMap.getOrDefault(var.name, var.name);
            }
            for (int i = 0; i < geteleptrInstr.idxList.size(); ++i) {
                IREntity idx = geteleptrInstr.idxList.get(i);
                if(idx instanceof IRVariable var) {
                    var.name = reNameMap.getOrDefault(var.name, var.name);
                }
            }
        } else if(instruction instanceof IcmpInstr icmpInstr) {
            if(icmpInstr.lhs instanceof IRVariable var) {
                var.name = reNameMap.getOrDefault(var.name, var.name);
            }
            if(icmpInstr.rhs instanceof IRVariable var) {
                var.name = reNameMap.getOrDefault(var.name, var.name);
            }
        } else if(instruction instanceof JumpInstr jumpInstr) {
            // do nothing
        } else if(instruction instanceof PhiInstr phiInstr) {
            // do nothing
        } else if(instruction instanceof RetInstr retInstr) {
            // TODO
            if(retInstr.retValue instanceof IRVariable var) {
                var.name = reNameMap.getOrDefault(var.name, var.name);
            }
        }
    }

    public void eraseInstr(AllocInstr allocInstr) {
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
        } else if(!getEleName.contains(allocInstr.varName)){
            allocInstr.parent.instructions.remove(allocInstr);
        }
    }

}
