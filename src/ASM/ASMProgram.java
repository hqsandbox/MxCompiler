package ASM;

import ASM.section.ASMRodata;
import ASM.section.ASMText;
import ASM.section.ASMData;

import java.util.ArrayList;

public class ASMProgram {

    public ArrayList<ASMText> TextList = new ArrayList<>();
    public ArrayList<ASMData> DataList = new ArrayList<>();
    public ArrayList<ASMRodata> RodataList = new ArrayList<>();

}
