package ASM.section;

import ASM.instr.ASMInstr;
import java.util.ArrayList;

public class ASMText extends ASMSection {

    public ArrayList<ASMInstr> instrList = new ArrayList<>();
    public ArrayList<ASMInstr> instrListBeforeEnd = new ArrayList<>();

    public ASMText(String label) {
        super(label);
    }

    // 错误：要单独创建一个ArrayList，因为一开始ASMText是空的
    public void addBeforeEnd(ASMInstr instr) {
        instrListBeforeEnd.add(instr);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("   ").append(".section .text");
        sb.append("\n");
        sb.append("   ").append(".globl ").append(label);
        sb.append("\n");
        sb.append(label).append(":\n");
        for(int i = 0; i < instrList.size() - 1; ++i){
            ASMInstr instr = instrList.get(i);
            sb.append("   ").append(instr.toString()).append("\n");
        }
        for(ASMInstr instr : instrListBeforeEnd){
            sb.append("   ").append(instr.toString()).append("\n");
        }
        sb.append("   ").append(instrList.getLast().toString()).append("\n");
//        for (ASMInstr instr : instrList) {
//            sb.append("   ").append(instr.toString()).append("\n");
//        }
        sb.append("\n");
        return sb.toString();
    }
}
