package IROptimize.RegAlloca;

import IR.IRBlock;
import IR.IRProgram;
import IR.definition.IRFuncDef;
import IR.entity.IRVariable;
import IR.instruction.Instruction;
import IR.instruction.PhiInstr;
import org.antlr.v4.runtime.misc.Pair;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

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
        ArrayList<String> useList = instruction.getUse();
        for(String var : useList){
            if(var.startsWith("@")){
                continue;
            }
            if(var.equals("1")){
                throw new RuntimeException("getUse: " + instruction);
            }
            if(!varUse.containsKey(var)){
                varUse.put(var, new ArrayList<>());
            }
            varUse.get(var).add(instruction);
        }
    }

    // 错误：scanned_block针对每一个变量，所以不能写成一个boolean放在IRBlock里面
    HashSet<IRBlock> scanned_block = new HashSet<>();

    public void ssa_liveness() {
        for(String var : varUse.keySet()){
//            if(var.equals("%var175_for.cond.0")){
//                System.out.println();
//            }
            scanned_block.clear();
            if(var.equals("%var6")){
                System.out.println("debug");
            }
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
        if(scanned_block.contains(block)) return;
        scanned_block.add(block);
        scan_liveOut(block.getTerminator(), var);
    }

    public void scan_liveIn(Instruction instruction, String var){
        instruction.liveIn.add(var);
        Instruction prev = prevInstr.get(instruction);
        if(prev != null){
            scan_liveOut(prev, var);
        } else {
            boolean hasPhiDef = instruction.parent.hasPhiDef(var);
            // 如果是第一个block，那么将变量加入phiLiveOut
            if(!instruction.parent.phiInsts.isEmpty() || instruction.parent.equals(instruction.parent.parent.blockList.getFirst())){
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
