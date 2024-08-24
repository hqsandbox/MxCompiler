package IR.entity;

import Util.type.IRType;

public class IRVariable extends IREntity {
    public String name;

    public IRVariable(String name) {
        this.name = name;
    }
    public IRVariable(String name, IRType type) {
        this.name = name;
        this.type = type;
    }
    public String toString() {
        return name;
    }
}
