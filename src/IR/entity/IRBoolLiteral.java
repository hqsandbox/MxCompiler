package IR.entity;

import Util.type.IRType;

public class IRBoolLiteral extends IRLiteral {
    public boolean value;

    public IRBoolLiteral(boolean value) {
        this.value = value;
        this.type = new IRType("i1");
    }

    @Override
    public String toString() {
        return Boolean.toString(value);
    }

}
