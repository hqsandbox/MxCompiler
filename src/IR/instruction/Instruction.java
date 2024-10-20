package IR.instruction;

import IR.IRBlock;
import IR.IRVisitor;

import java.util.ArrayList;
import java.util.HashSet;

public abstract class Instruction {

    public IRBlock parent;
    public HashSet<String> liveIn = new HashSet<>();
    public HashSet<String> liveOut = new HashSet<>();
    public HashSet<String> liveOut_ = new HashSet<>(); // 溢出后的 liveOut

    public Instruction(IRBlock parent) {
        this.parent = parent;
    }
    public boolean isInt(String s) {
        if(s.charAt(0) == '@' || s.charAt(0) == '%'){
            return false;
        }
        return true;
    }

    public abstract String toString();
    public abstract ArrayList<String> getUse();
    public abstract String getDef();
    public abstract void accept(IRVisitor visitor);
}
