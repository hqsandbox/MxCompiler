package IR.instruction;

import IR.IRBlock;
import IR.IRVisitor;
import IR.entity.IREntity;
import IR.entity.IRVariable;

public class BinaryInstr extends Instruction {
    public String op;
    public IREntity lhs, rhs;
    public IRVariable result;

    public BinaryInstr(IRBlock parent, IRVariable result, String op, IREntity lhs, IREntity rhs) {
        super(parent);
        this.op = op;
        this.lhs = lhs;
        this.rhs = rhs;
        this.result = result;
    }

    @Override
    public String toString() {
        StringBuilder ret = new StringBuilder();
        ret.append(result.toString()).append(" = ");
        switch (op) {
            case "+" -> ret.append("add");
            case "-" -> ret.append("sub");
            case "*" -> ret.append("mul");
            case "/" -> ret.append("sdiv");
            case "%" -> ret.append("srem");
            case "<<" -> ret.append("shl");
            case ">>" -> ret.append("ashr");
            case "&" -> ret.append("and");
            case "|" -> ret.append("or");
            case "^" -> ret.append("xor");
        }
        ret.append(" ").append(lhs.type.toString()).append(" ").append(lhs.toString()).append(", ").append(rhs.toString()).append("\n");
        return ret.toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

}
