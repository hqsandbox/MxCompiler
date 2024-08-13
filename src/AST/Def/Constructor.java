package AST.Def;

import AST.ASTVisitor;
import Util.position;
import Util.Scope;
import AST.ASTNode;
import AST.Stmt.Suite;

public class Constructor extends ASTNode {
    public String className;
    public Suite suite;

    public Constructor(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
