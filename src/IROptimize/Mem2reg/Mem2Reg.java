package IROptimize.Mem2reg;

import IR.IRProgram;

public class Mem2Reg {

    public IRProgram program;

    public Mem2Reg(IRProgram program) {
        this.program = program;
    }

    public void work() {
        new CFGBuilder(program).work();
        new DomBuilder(program).work();
        new DomTreeBuilder(program).work();

    }


}
