package IROptimize.Mem2reg;

import IR.IRBlock;
import IR.IRProgram;
import IR.definition.IRFuncDef;
import IR.instruction.Instruction;
import IR.instruction.LoadInstr;
import IR.instruction.StoreInstr;

import java.util.ArrayList;
import java.util.Comparator;

public class DomTreeBuilder {

    public IRProgram program = null;

    public DomTreeBuilder(IRProgram program) {
        this.program = program;
    }

    public void work() {
        getIDom();
        getDomFrontier();
    }

    public void getIDom() {
        program.funcDefMap.forEach((_, func) -> getIDomFunc(func));
    }

    public void getIDomFunc(IRFuncDef funcDef) {
        for (IRBlock block : funcDef.blockList) {
            if (block.dominators.size() > 1) {
                ArrayList<IRBlock> newDomList = new ArrayList<>(block.dominators);
                newDomList.sort(Comparator.comparingInt(dom -> dom.dominators.size()));
                for (int i = 0; i < newDomList.size(); i++) {
                    if(i == newDomList.size() - 1) {
                        block.idom = newDomList.get(i);
                    } else {
                        newDomList.get(i + 1).idom = newDomList.get(i);
                    }
                }
            }
        }
    }

    public void getDomFrontier() {
        program.funcDefMap.forEach((_, func) -> domFrontierFunc(func));
    }

    public void domFrontierFunc(IRFuncDef funcDef) {
        for (IRBlock block : funcDef.blockList) {
            if(block.idom != null) {
                block.idom.domChildren.add(block);
            }
            for (IRBlock pred : block.preds) {
                IRBlock runner = pred;
                while (runner != block.idom) {
                    runner.domFrontier.add(block);
                    runner = runner.idom;
                }
            }
        }
    }


//    public void getDefUse(IRBlock block) {
//        for(Instruction instruction : block.instructions) {
//            if (instruction instanceof LoadInstr ld) {
//                String var = ld.ptr;
//                if (!useBl.containsKey(var)) {
//                    useBl.put(var, new ArrayList<>());
//                }
//                useBl.get(var).add(block.label);
//                if (!useVar.containsKey(block.label)) {
//                    useVar.put(block.label, new ArrayList<>());
//                }
//                useVar.get(block.label).add(var);
//            } else if (instruction instanceof StoreInstr st) {
//                String var = st.ptr;
//                if (!def.containsKey(var)) {
//                    def.put(var, new ArrayList<>());
//                }
//                def.get(var).add(block.label);
//            }
//        }
//    }

}
