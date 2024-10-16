package IROptimize.RegAlloca;

import IR.IRBlock;
import IR.IRProgram;
import IR.definition.IRFuncDef;
import IR.instruction.Instruction;
import IR.instruction.PhiInstr;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

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
            preOrder(func.blockList.getFirst());
        }
        program.regMap = tempMap;
    }

    public void preOrder(IRBlock block) {
        inUse.clear();// TODO: clear inUse?
        block.phiLiveIn.forEach(var -> {
            if(!tempMap.containsKey(var)){
                tempMap.put(var, getNewReg());
            }
            inUse.add(tempMap.get(var));
        });
        for(PhiInstr phiInstr : block.phiInsts.values()) {
            allocate(phiInstr);
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
                inUse.remove(tempMap.get(var));
            }
            if(defVar != null) tempMap.put(defVar, getNewReg());
        }
    }

    public Integer getNewReg(){
        for(int i = 0; i < regNum; i++) {
            if(!inUse.contains(i)){
                inUse.add((Integer) i);
                return i;
            }
        }
        return -1;
    }

}
