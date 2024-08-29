package ASM.section;

import java.util.ArrayList;

abstract public class ASMSection {

    public String label = null;

    public ASMSection(String label) {
        this.label = label;
    }

    abstract public String toString();
}
