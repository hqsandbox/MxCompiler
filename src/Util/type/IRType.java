package Util.type;

public class IRType {

    public irTypeEnum type;
    public int size;
    public String className; // 假如是struct类型，那么这个就是struct的名字

    public enum irTypeEnum{
        i1, i32, ptr, void_
    }
    public IRType(){
        this.type = irTypeEnum.ptr;
        this.size = -1;
        this.className = "";
    }
    public IRType(String className){
        switch (className){
            case "i1", "bool":
                setI1();
                break;
            case "i32", "int":
                setI32();
                break;
            case "ptr", "string":
                setPtr();
                break;
            case "void":
                setVoid();
                break;
            default:
                this.type = irTypeEnum.ptr;
                this.size = 32;
                this.className = className;
        }
    }
    public void setI1(){
        this.type = irTypeEnum.i1;
        this.size = 1;
    }
    public void setI32(){
        this.type = irTypeEnum.i32;
        this.size = 32;
    }
    public void setPtr(){
        this.type = irTypeEnum.ptr;
        this.size = 32;
    }
    public void setVoid(){
        this.type = irTypeEnum.void_;
        this.size = 0;
    }
    public boolean equals(IRType other){
        return this.type == other.type && this.size == other.size && this.className.equals(other.className);
    }
    public boolean isVoid(){
        return this.type == irTypeEnum.void_;
    }
    public String toString(){
        return switch (type) {
            case i1 -> "i1";
            case i32 -> "i32";
            case ptr -> "ptr";
            case void_ -> "void";
        };
    }
}
