package IR.entity;

public class IRBoolLiteral extends IRLiteral {
    public boolean value;

    public IRBoolLiteral(boolean value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return Boolean.toString(value);
    }

}
