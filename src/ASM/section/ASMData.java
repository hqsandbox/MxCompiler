package ASM.section;

public class ASMData extends ASMSection {

    public int value = 0;

    public ASMData(String label, int value) {
        super(label);
        this.value = value;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("   ").append(".section .data");
        sb.append("\n");
        sb.append("   ").append(".globl ").append(label);
        sb.append("\n");
        sb.append(label).append(":");
        sb.append("\n");
        sb.append("   ").append(".word ").append(value);
        sb.append("\n");
        sb.append("\n");
        return sb.toString();
    }
}