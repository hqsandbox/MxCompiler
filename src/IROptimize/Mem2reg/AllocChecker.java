package IROptimize.Mem2reg;

import IR.IRProgram;
import IR.instruction.AllocInstr;

public class AllocChecker {

    public IRProgram program;

    public AllocChecker(IRProgram program) {
        this.program = program;
    }

    public void work() {
        program.funcDefMap.forEach((key, func) -> {
            func.blockList.forEach(block -> {
                block.instructions.forEach(inst -> {
                    if (inst instanceof AllocInstr) {
                        assert false;
                    }
                });
            });
        });
    }
}
