package IROptimize.RegAlloca;

import IR.IRProgram;

public class RegAllocation {

    public IRProgram program = null;

    public RegAllocation(IRProgram program) {
        this.program = program;
    }

    public void work() {
        new DCE(program).work();
        new LiveAnalysis(program).work();
        new Spill(program).work();
        new Color(program).work();
    }
}
