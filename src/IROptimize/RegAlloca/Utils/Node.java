package IROptimize.RegAlloca.Utils;

public class Node {

    public enum nodeType {
        num, reg, sp, global
    }
    public nodeType type;
    public int num_value = 0;
    public String reg_value = "";
    public int sp_value = 0;
    public String global_value = "";

    public Node setNum(int num){
        this.type = nodeType.num;
        this.num_value = num;
        return this;
    }
    public Node setReg(String reg){
        this.type = nodeType.reg;
        this.reg_value = reg;
        return this;
    }
    public Node setSp(int sp){
        this.type = nodeType.sp;
        this.sp_value = sp;
        return this;
    }
    public Node setGlobal(String global){
        this.type = nodeType.global;
        this.global_value = global;
        return this;
    }

    public boolean isNumNode(){
        return this.type == nodeType.num;
    }
    public boolean isRegNode(){
        return this.type == nodeType.reg;
    }
    public boolean isSpNode(){
        return this.type == nodeType.sp;
    }
    public boolean isGlobalNode(){
        return this.type == nodeType.global;
    }

    public int getNodeNum(){
        return this.num_value;
    }
    public String getNodeReg(){
        return this.reg_value;
    }
    public int getNodeSp(){
        return this.sp_value;
    }
    public String getNodeGlobal(){
        return this.global_value;
    }

    public boolean judgeEqual(Node other){
        if(this.type != other.type){
            return false;
        }
        switch (this.type){
            case num:
                return this.num_value == other.num_value;
            case reg:
                return this.reg_value.equals(other.reg_value);
            case sp:
                return this.sp_value == other.sp_value;
            case global:
                return this.global_value.equals(other.global_value);
        }
        return false;
    }
}
