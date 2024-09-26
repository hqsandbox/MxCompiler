package IR;

import IR.definition.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import IR.instruction.*;

public class IRBlock {

    public IRFuncDef parent;
    public String name;
    public ArrayList<Instruction> instructions = new ArrayList<>();

    public HashSet<IRBlock> preds = new HashSet<>(); // 所有前驱块
    public HashSet<IRBlock> succs = new HashSet<>(); // 所有后继块
    public IRBlock idom = null; // 最近必经节点
    public HashSet<IRBlock> dominators = new HashSet<>(); // 支配集
    public ArrayList<IRBlock> domChildren = new ArrayList<>(); // 当前基本块直接支配的所有基本块，子节点
    public HashSet<IRBlock> domFrontier = new HashSet<>(); // 支配边界
    public HashMap<String, PhiInstr> phiInsts = new HashMap<>();
    public boolean alreadyRenamed = false;

    public IRBlock(IRFuncDef parent, String name) {
        this.parent = parent;
        this.name = name;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(name).append(":\n");
        for (PhiInstr phiInstr : phiInsts.values()) {
            stringBuilder.append(phiInstr.toString());
        }
        for (Instruction instruction : instructions) {
            stringBuilder.append(instruction.toString());
        }
        return stringBuilder.toString();
    }
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
