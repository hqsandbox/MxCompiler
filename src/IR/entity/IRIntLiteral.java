package IR.entity;

import Util.type.IRType;

public class IRIntLiteral extends IRLiteral{
    public int value;
    public IRIntLiteral(int value) {
        this.value = value;
        this.type = new IRType("i32");
    }
    @Override
    public boolean equals(Object obj) {
        return obj instanceof IRIntLiteral && ((IRIntLiteral) obj).value == value;
    }
    @Override
    public String toString() {
        return Integer.toString(value);
    }
    @Override
    public int hashCode() {
        return Integer.hashCode(value);
    }
}
