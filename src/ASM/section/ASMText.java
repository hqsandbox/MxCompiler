package ASM.section;

import ASM.instr.ASMInstr;
import java.util.ArrayList;

public class ASMText extends ASMSection {

    public ArrayList<ASMInstr> instrList = new ArrayList<>();

    public ASMText(String label) {
        super(label);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("   ").append(".section .text");
        sb.append("\n");
        sb.append("   ").append(".globl ").append(label);
        sb.append("\n");
        sb.append(label).append(":\n");
        for (ASMInstr instr : instrList) {
            sb.append("   ").append(instr.toString()).append("\n");
        }
        sb.append("\n");
        return sb.toString();
    }
}
