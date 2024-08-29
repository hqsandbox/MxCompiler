package ASM.instr;

import ASM.section.ASMText;

public class ASMSetInstr extends ASMInstr {

    public String rd, rs, op;

    public ASMSetInstr(ASMText parent, String op, String rd, String rs) {
        super(parent);
        this.op = op;
        this.rd = rd;
        this.rs = rs;
    }

    @Override
    public String toString() {
        String tmp = switch (op) {
            case "==" -> "seqz";
            case "!=" -> "snez";
            case "<" -> "sltz";
            case ">" -> "sgtz";
            default -> throw new IllegalStateException("Unexpected value: " + op);
        };
        return String.format("%-8s", tmp) + rd + ", " + rs;
    }
}
