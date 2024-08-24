package IR.instruction;

import IR.IRBlock;
import IR.entity.IREntity;
import IR.entity.IRVariable;

public class IcmpInstr extends Instruction {

    public String op;
    public IREntity lhs, rhs;
    public IRVariable result;

    public IcmpInstr(IRBlock parent, IRVariable result, IREntity lhs, String op, IREntity rhs) {
        super(parent);
        this.result = result;
        this.lhs = lhs;
        this.op = op;
        this.rhs = rhs;
    }

    @Override
    public String toString(){
        StringBuilder ret = new StringBuilder();
        ret.append(result.toString()).append(" = icmp ");
        switch (op) {
            case "==" -> ret.append("eq");
            case "!=" -> ret.append("ne");
            case "<" -> ret.append("slt");
            case ">" -> ret.append("sgt");
            case "<=" -> ret.append("sle");
            case ">=" -> ret.append("sge");
        }
        ret.append(" ").append(lhs.type.toString()).append(" ");
        ret.append(lhs.toString()).append(", ").append(rhs.toString()).append("\n");
        return ret.toString();
    }
}
