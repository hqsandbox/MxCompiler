package IROptimize.Mem2reg;

import IR.IRBlock;
import IR.IRProgram;
import IR.definition.IRFuncDef;
import IR.instruction.Instruction;

public class CFGBuilder {

    public IRProgram program = null;

    public CFGBuilder(IRProgram program) {
        this.program = program;
    }

    public void work() {
        program.funcDefMap.forEach((tmp, funcDef) -> {
            funcDef.blockList.forEach(this::workOnBlock);
            removeDeadBlocks(funcDef);
        });
    }

    public void workOnBlock(IR.IRBlock block) {
        for(int i = 0; i < block.instructions.size(); ++i){
            Instruction instruction = block.instructions.get(i);
            if(instruction instanceof IR.instruction.RetInstr) {
                block.succs.clear();
                block.instructions.removeIf(tmp -> block.instructions.indexOf(tmp) > block.instructions.indexOf(instruction));
            } else if(instruction instanceof IR.instruction.BrInstr brInstr) {
                IR.IRBlock lhsBlock = brInstr.lhs;
                lhsBlock.preds.add(block);
                block.succs.add(lhsBlock);
                IR.IRBlock rhsBlock = brInstr.rhs;
                rhsBlock.preds.add(block);
                block.succs.add(rhsBlock);
                block.instructions.removeIf(tmp -> block.instructions.indexOf(tmp) > block.instructions.indexOf(instruction));
            } else if(instruction instanceof IR.instruction.JumpInstr jumpInstr) {
                IR.IRBlock targetBlock = jumpInstr.target;
                targetBlock.preds.add(block);
                block.succs.add(targetBlock);
                block.instructions.removeIf(tmp -> block.instructions.indexOf(tmp) > block.instructions.indexOf(instruction));
            }
        }
    }

    public void removeDeadBlocks(IRFuncDef funcDef) {
        funcDef.blockList.forEach(block -> {
            if(block.preds.isEmpty() && !block.name.equals("entry")) {
                block.succs.forEach(succ -> succ.preds.remove(block));
            }
        });
        funcDef.blockList.removeIf(block -> block.preds.isEmpty() && !block.name.equals("entry"));
    }
}
