package IROptimize.RegAlloca;

import IR.IRBlock;
import IR.IRProgram;
import IR.definition.IRFuncDef;
import IR.instruction.Instruction;
import IR.instruction.PhiInstr;

import java.util.ArrayList;
import java.util.HashMap;

// 参考：《寄存器分配引论》 P.98

public class LiveAnalysis {

    // liveIn：在 def和 use之间，之后不再 use了，那么这个变量就不再活跃

    public IRProgram program;
    public HashMap<String, ArrayList<Instruction>> varUse = new HashMap<>(); // var -> useInstr
    public HashMap<Instruction, Instruction> prevInstr = new HashMap<>(); // instr -> prevInstr

    public LiveAnalysis(IRProgram program){
        this.program = program;
    }

    public void work(){
        collectData();
        ssa_liveness();
    }

    public void collectData() {
        for(IRFuncDef func : program.funcDefMap.values()){
            for(IRBlock block : func.blockList){
                for(int i = 0; i < block.instructions.size(); ++i){
                    Instruction instruction = block.instructions.get(i);
                    getVarUse(instruction);
                    if(i > 0){
                        prevInstr.put(instruction, block.instructions.get(i - 1));
                    }
                }
                for(PhiInstr phiInstr : block.phiInsts.values()){
                    phiInstr.liveIn = block.phiLiveIn;
                    phiInstr.liveOut = block.phiLiveOut;
                    phiInstr.liveOut_ = block.phiLiveOut_;
                    getVarUse(phiInstr);
                }
            }
        }
    }

    public void getVarUse(Instruction instruction) {
        instruction.getUse().forEach(var -> {
            if (!varUse.containsKey(var)) {
                varUse.put(var, new ArrayList<>());
            }
            varUse.get(var).add(instruction);
        });
    }

    public void ssa_liveness() {
        for(String var : varUse.keySet()){
            ArrayList<Instruction> useList = varUse.get(var);
            for (Instruction instruction : useList) {
                if (instruction instanceof PhiInstr phiInstr) {
                    for (int j = 0; j < phiInstr.values.size(); j++) {
                        if (var.equals(phiInstr.values.get(j).toString())) {
                            IRBlock block = phiInstr.blocks.get(j);
                            scan_block(block, var);
                        }
                    }
                } else {
                    scan_liveIn(instruction, var);
                }
            }
        }
    }

    public void scan_block(IRBlock block, String var){
        if(block.liveVisited) return;
        block.liveVisited = true;
        scan_liveOut(block.getTerminator(), var);
    }

    public void scan_liveIn(Instruction instruction, String var){
        instruction.liveIn.add(var);
        Instruction prev = prevInstr.get(instruction);
        if(prev != null){
            scan_liveOut(prev, var);
        } else {
            boolean hasPhiDef = instruction.parent.hasPhiDef(var);
            if(!instruction.parent.phiInsts.isEmpty()){
                instruction.parent.addPhiOut(var);
            }
            if(!hasPhiDef){
                if(!instruction.parent.phiInsts.isEmpty()){
                    instruction.parent.addPhiIn(var);
                }
                for(IRBlock pre : instruction.parent.preds) {
                    scan_block(pre, var);
                }
            }
        }
    }

    public void scan_liveOut(Instruction instruction, String var){
        instruction.liveOut.add(var);
        instruction.liveOut_.add(var);
        String def = instruction.getDef();
        if(def == null || !def.equals(var)){
            scan_liveIn(instruction, var);
        }
    }

}
