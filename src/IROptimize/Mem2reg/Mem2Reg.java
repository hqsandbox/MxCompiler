package IROptimize.Mem2reg;

import IR.IRBlock;
import IR.IRProgram;
import IR.definition.IRFuncDef;
import Util.type.IRType;

import java.util.ArrayList;
import java.util.HashMap;

public class Mem2Reg {

    public IRProgram program;

    public Mem2Reg(IRProgram program) {
        this.program = program;
    }

    public void work() {
        new CFGBuilder(program).work();
        new DomBuilder(program).work();
        new PutPhi(program).work();
//        new AllocChecker(program).work();
    }

}
