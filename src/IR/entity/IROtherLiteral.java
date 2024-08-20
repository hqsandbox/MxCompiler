package IR.entity;

public class IROtherLiteral extends IRLiteral {
    public String value;

    public IROtherLiteral(String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return value;
    }
}
