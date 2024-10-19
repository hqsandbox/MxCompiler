package IROptimize.RegAlloca;

import IR.IRBlock;
import IR.IRProgram;
import IR.definition.IRFuncDef;
import IR.instruction.Instruction;
import org.antlr.v4.runtime.misc.Pair;

public class CriticalEdge {

    public IRProgram program;

    public CriticalEdge(IRProgram program) {
        this.program = program;
    }

    public void work() {
        criticalEdgeFinder();
        splitCriticalEdge();
    }

    public void criticalEdgeFinder(){
        for(IRFuncDef func : program.funcDefMap.values()){
            for(IRBlock block : func.blockList){
                if(block.succs.size() > 1){
                    for(IRBlock succ : block.succs){
                        if(succ.preds.size() > 1){
                            program.criticalEdge.add(new Pair<>(block, succ));
                        }
                    }
                }
            }
        }
    }

    public void splitCriticalEdge() {
        for(var edge : program.criticalEdge) {
            IRBlock first = edge.a;
            IRBlock second = edge.b;
            IRBlock newBlock = new IRBlock(first.parent, first.name + "_and_" + second.name);
            if(newBlock.name.equals("for.body.0_and_land.end..0")) {
//                System.out.println("debug");
            }
            first.parent.blockList.add(newBlock);

            Instruction instruction = first.getTerminator();
            if(instruction instanceof IR.instruction.JumpInstr jumpInstr){
                jumpInstr.replaceTarget(second, newBlock);
            } else if(instruction instanceof IR.instruction.BrInstr brInstr){
                brInstr.replaceTarget(second, newBlock);
            } else {
                throw new RuntimeException("splitCriticalEdge: instruction not JumpInst or BranchInst");
            }

            newBlock.instructions.add(new IR.instruction.JumpInstr(newBlock, second));
            newBlock.preds.add(first);
            newBlock.succs.add(second);

            first.succs.remove(second);
            first.succs.add(newBlock);
            second.preds.remove(first);
            second.preds.add(newBlock);
            second.phiInsts.forEach((key, value) -> {
                value.replaceTarget(first, newBlock);
            });
        }
    }

}
