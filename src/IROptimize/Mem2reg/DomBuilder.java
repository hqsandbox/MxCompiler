package IROptimize.Mem2reg;

import IR.IRBlock;
import IR.IRProgram;
import IR.definition.IRFuncDef;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashSet;

public class DomBuilder {

    public IRProgram program = null;

    public DomBuilder(IRProgram program) {
        this.program = program;
    }

    public void work() {
        getDominators();  //得到支配集
        getIDom();
        getDomFrontier();
    }

    public void getDominators() {
        program.funcDefMap.forEach((tmp, func) -> getDominatorsFunc(func));
    }

    public void getDominatorsFunc(IRFuncDef funcDef) {
        HashSet<IRBlock> allBlocks = new HashSet<>(funcDef.blockList);

        for (IRBlock block : funcDef.blockList) {
            block.dominators = new HashSet<>(allBlocks);
        }
        if (!funcDef.blockList.isEmpty()) {
            IRBlock entryBlock = funcDef.blockList.getFirst();
            entryBlock.dominators.clear();
            entryBlock.dominators.add(entryBlock);
        }

        //一个节点的支配集等于其所有前驱节点（ctg）支配集的交集再并上自身。

        boolean changed = true;
        while (changed) {
            changed = false;
            for (IRBlock block : funcDef.blockList) {
                if (block == funcDef.blockList.getFirst()) continue;

                HashSet<IRBlock> newDoms = new HashSet<>(allBlocks);
                for (IRBlock pred : block.preds) {
                    newDoms.retainAll(pred.dominators);
                }
                newDoms.add(block);

                if (!newDoms.equals(block.dominators)) {
                    block.dominators = newDoms;
                    changed = true;
                }
            }
        }
    }
    public void getIDom() {
        program.funcDefMap.forEach((tmp, func) -> getIDomFunc(func));
    }

    public void getIDomFunc(IRFuncDef funcDef) {
        funcDef.blockList.getFirst().idom = funcDef.blockList.getFirst();
        for (IRBlock block : funcDef.blockList) {
            if (block.dominators.size() > 1) {
                ArrayList<IRBlock> newDomList = new ArrayList<>(block.dominators);
                newDomList.sort(Comparator.comparingInt(dom -> dom.dominators.size()));
                for (int i = 0; i < newDomList.size(); i++) {
                    if(i == 0) {
                        newDomList.get(i).idom = null;
                    } else {
                        newDomList.get(i).idom = newDomList.get(i - 1);
                    }
                }
            }
        }
        funcDef.blockList.getFirst().idom = null;
    }

    public void getDomFrontier() {
        program.funcDefMap.forEach((tmp, func) -> domFrontierFunc(func));
    }

    public void domFrontierFunc(IRFuncDef funcDef) {
        for (IRBlock block : funcDef.blockList) {
            if(block.idom != null) {
                block.idom.domChildren.add(block);
            }
            for (IRBlock pred : block.preds) {
                IRBlock runner = pred;
                while (runner != block.idom) {
                    if(runner == null){
                        System.exit(0);
                    }
                    runner.domFrontier.add(block);
                    runner = runner.idom;
                }
            }
        }
    }

}
