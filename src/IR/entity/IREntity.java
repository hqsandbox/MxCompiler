package IR.entity;

import Util.type.IRType;

public abstract class IREntity {
    public IRType type = new IRType();
    public abstract String toString();
}
