package IR.entity;

public class IRRegister extends IREntity {

    public String name;

    public IRRegister(String name) {
        this.name = name;
    }
    public String toString() {
        return name;
    }

}
