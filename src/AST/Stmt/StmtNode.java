package AST.Stmt;

import AST.ASTNode;
import AST.ASTVisitor;
import Util.position;

public abstract class StmtNode extends ASTNode {

    public StmtNode(position pos) {
        super(pos);
    }

    @Override
    public abstract void accept(ASTVisitor visitor);
}
