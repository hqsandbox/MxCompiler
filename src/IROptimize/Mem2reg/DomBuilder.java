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
    }

    public void getDominators() {
        program.funcDefMap.forEach((_, func) -> getDominatorsFunc(func));
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

}
