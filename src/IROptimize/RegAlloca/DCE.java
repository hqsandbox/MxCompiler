package IROptimize.RegAlloca;

import IR.IRBlock;
import IR.IRProgram;
import IR.definition.IRFuncDef;
import IR.instruction.CallInstr;
import IR.instruction.Instruction;
import IR.instruction.PhiInstr;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class DCE {

    IRProgram program;

    public DCE(IRProgram program) {
        this.program = program;
    }

    public void work() {
        for(var func : program.funcDefMap.values()) {
            workOnFunc(func);
        }
    }

    public void workOnFunc(IRFuncDef irFuncDef) {
        HashMap<String, Instruction> defInst = new HashMap<>(); // var -> defInstr
        HashMap<String, Integer> useCnt = new HashMap<>(); // var -> useCnt
        init(irFuncDef, defInst, useCnt); // 计算初始的 defInst和 useCnt
        while (useCnt.containsValue(0)) {
            cleanDefInst(irFuncDef, defInst, useCnt);
        }
    }

    public void init(IRFuncDef irFuncDef, HashMap<String, Instruction> defInst, HashMap<String, Integer> useCnt){
        irFuncDef.parameterNameList.forEach(var -> {
            defInst.put(var, null);
            useCnt.put(var, 1);
        });
        for(IRBlock block : irFuncDef.blockList){
            for(Instruction instruction : block.instructions){
                String def = instruction.getDef();
                if(def != null) {
                    defInst.put(def, instruction);
                    useCnt.put(def, 0);
                }
            }
            for(PhiInstr phiInstr : block.phiInsts.values()){
                String def = phiInstr.getDef();
                if(def != null) {
                    defInst.put(def, phiInstr);
                    useCnt.put(def, 0);
                }
            }
        }
        for(IRBlock block : irFuncDef.blockList){
            for(Instruction instruction : block.instructions){
                ArrayList<String> uses = instruction.getUse();
                for(String use : uses){
                    if(useCnt.containsKey(use)){ // 局部变量
                        useCnt.put(use, useCnt.get(use) + 1);
                    }
                }
            }
            for(PhiInstr phiInstr : block.phiInsts.values()){
                ArrayList<String> uses = phiInstr.getUse();
                for(String use : uses){
                    if(useCnt.containsKey(use)){ // 局部变量
                        useCnt.put(use, useCnt.get(use) + 1);
                    }
                }
            }
        }
    }

    public void cleanDefInst(IRFuncDef irFuncDef, HashMap<String, Instruction> defInst, HashMap<String, Integer> useCnt){
        ArrayList<String> removeList = new ArrayList<>();
        useCnt.forEach((var, cnt) -> {
            if(cnt == 0 && !irFuncDef.parameterNameList.contains(var)){
                removeList.add(var);
            }
        });
        removeList.forEach(useCnt::remove);
        for(String var : removeList){
            Instruction instruction = defInst.get(var);
            if(instruction == null){
                throw new RuntimeException("defInst not contains key: " + var);
            } else if(instruction instanceof CallInstr callInstr){
                callInstr.result.type.setVoid();
            } else {
                ArrayList<String> useList = instruction.getUse();
                instruction.parent.instructions.remove(instruction);
                if(instruction instanceof PhiInstr phiInstr){
                    phiInstr.parent.phiInsts.entrySet().removeIf(entry -> entry.getValue().equals(instruction));
                }
                for(String use : useList){
                    if(useCnt.containsKey(use)){ // 局部变量
                        useCnt.put(use, useCnt.get(use) - 1);
                    }
                }
            }
        }
    }
}
