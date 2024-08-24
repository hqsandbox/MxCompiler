package IR.entity;

import Util.type.IRType;

public class IROtherLiteral extends IRLiteral {
    public String value;

    public IROtherLiteral(String value, IRType type) {
        this.value = value;
        this.type = type;
    }

    @Override
    public String toString() {
        return value;
    }
}
