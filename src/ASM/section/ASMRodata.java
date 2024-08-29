package ASM.section;

public class ASMRodata extends ASMSection {

    String value = null; // without \"\"

    public ASMRodata(String label, String value) {
        super(label);
        this.value = value;
    }

    @Override
    public String toString() {
        String ans = "";
        ans += "   " + ".section .rodata" + "\n";
        ans += label + ":" + "\n";
        ans += "   " + ".asciz " + "\"";

//        StringBuilder sb = new StringBuilder();
//        sb.append("   ").append(".section .rodata");
//        sb.append("\n");
//        sb.append(label).append(":");
//        sb.append("\n");
//        sb.append("   ").append(".asciz ").append("\"");

        String myString = value;
        if(myString.startsWith("\"") && myString.endsWith("\"")){
            myString = myString.substring(1, myString.length() - 1);
        }

//        myString = myString.replace("\\", "\\\\")
//                .replace("\n", "\\n")
//                .replace("\0", "")
//                .replace("\t", "\\t")
//                .replace("\"", "\\\"");

//        String tmp = myString.replace("\\\"", "\042");
//        tmp = tmp.replace("\\n", "\012");
////        tmp = tmp.replace("\\", "\\\\");
//        myString = myString.replace("\"", "\\\"");
//        myString = myString.replace("\n", "\\n");
//        int size = tmp.length();

        ans += myString + "\"\n";
        ans += "\n";

        return ans;

//        sb.append(myString).append("\"");
//        sb.append("\n");
//
////        sb.append("   ").append(".size").append(" ").append(label).append(", ").append(size);
////        sb.append("\n");
//        sb.append("\n");
//
//        return sb.toString();
    }
}
