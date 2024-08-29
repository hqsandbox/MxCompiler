package ASM;

public class ASMPrinter {

    public ASMProgram asmProgram;

    public ASMPrinter(ASMProgram asmProgram) {
        this.asmProgram = asmProgram;
    }

    public String printString() {
        StringBuilder sb = new StringBuilder();
        for(int i = 0; i < asmProgram.TextList.size(); i++) {
            sb.append(asmProgram.TextList.get(i).toString());
        }
        for(int i = 0; i < asmProgram.DataList.size(); i++) {
            sb.append(asmProgram.DataList.get(i).toString());
        }
        for(int i = 0; i < asmProgram.RodataList.size(); i++) {
            sb.append(asmProgram.RodataList.get(i).toString());
        }
        return sb.toString();
    }

    public void print() {
        System.out.print(printString());
    }

}
