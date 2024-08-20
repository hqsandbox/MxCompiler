package IR.Util;

import IR.IRBlock;

public class LoopScope {
    public LoopScope parent;
    public IRBlock loopEnd;
    public IRBlock loopNext;

    public LoopScope(LoopScope parent) {
        this.parent = parent;
        if (parent != null) {
            this.loopEnd = parent.loopEnd;
            this.loopNext = parent.loopNext;
        }
    }
    public LoopScope parentScope() {
        return parent;
    }
}
