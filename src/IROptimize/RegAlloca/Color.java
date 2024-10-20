package IROptimize.RegAlloca;

import IR.IRBlock;
import IR.IRProgram;
import IR.definition.IRFuncDef;
import IR.instruction.Instruction;
import IR.instruction.PhiInstr;

import java.util.*;

public class Color {

    public IRProgram program;
    public HashSet<Integer> inUse = new HashSet<>();
    public HashMap<String, Integer> tempMap = new HashMap<>();
    public int regNum = 20;

    public Color(IRProgram program) {
        this.program = program;
    }

    public void work() {
        for(IRFuncDef func : program.funcDefMap.values()) {
//            if(func.functionName.equals("jud")){
//                System.out.println("debug");
//            }
            // 错误：这里要加上这个，因为考虑到函数参数
            for(String var : func.blockList.getFirst().phiLiveOut_) {
                tempMap.put(var, getNewReg());
            }
            preOrder(func.blockList.getFirst());
        }
        program.regMap = tempMap;
    }

    public void preOrder(IRBlock block) {
        // inuse = phiLiveOut - phiDef
        inUse.clear();
        HashSet<String> Block_liveIn = new HashSet<>();
        HashSet<String> phiDefs = block.getPhiDef();
        block.phiLiveOut_.removeAll(program.spilledVars);
        for(String var : block.phiLiveOut_) {
            if(!phiDefs.contains(var)){
                if(!tempMap.containsKey(var)){
                    throw new RuntimeException("var not found in tempMap");
                }
                Block_liveIn.add(var);
//                inUse.add(tempMap.get(var));
            }
        }
        if(block.phiLiveOut_.isEmpty()){
            block.instructions.getFirst().liveOut_.removeAll(program.spilledVars);
            Block_liveIn = new HashSet<>(block.instructions.getFirst().liveOut_);
            Block_liveIn.remove(block.instructions.getFirst().getDef());
            var tmp = block.instructions.getFirst().getUse();
            if(tmp != null) {
                tmp.removeAll(program.spilledVars);
                Block_liveIn.addAll(tmp);
            }
        }
        for(String var : Block_liveIn) {
            inUse.add(tempMap.get(var));
        }
        for(String var : phiDefs) {
            // 错误：phiLiveOut中的元素才可以被染色
            if(!block.phiLiveOut_.contains(var)){
                continue;
            }
//            if(var.equals("%d.1_for.cond.0")){
//                System.out.println("debug");
//            }
            tempMap.put(var, getNewReg());
        }
        for(Instruction instruction : block.instructions) {
            allocate(instruction);
        }
        for(IRBlock succ : block.domChildren) {
            preOrder(succ);
        }
    }

    public void allocate(Instruction instruction) {
        ArrayList<String> useList = instruction.getUse();
        String defVar = instruction.getDef();
        for(String var : useList) {
            if(!instruction.liveOut_.contains(var)){
                Integer tmp = tempMap.get(var);
                inUse.remove(tmp);
            }
        }
//        if(defVar != null){
//            if(defVar.equals("%var6")){
//                System.out.println("debug");
//            }
//        }

        // 错误：这里判断要加上元素属于liveOut_
        if(defVar != null && instruction.liveOut_.contains(defVar)) {
            tempMap.put(defVar, getNewReg());
        }
    }

    public Integer getNewReg(){
        for(int i = 0; i < regNum; i++) {
            if(!inUse.contains(i)){
                inUse.add((Integer) i);
                return i;
            }
        }
        if(true){
            throw new RuntimeException("No available register");
        }
        return -1;
    }

}
