package AST.Def;

import AST.ASTVisitor;
import AST.ASTNode;
import Util.position;

public class Definition extends ASTNode {
    public ClassTypeDef classDef = null;
    public FunctionDef funcDef = null;
    public VariableDef variDef = null;

    public Definition(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}
