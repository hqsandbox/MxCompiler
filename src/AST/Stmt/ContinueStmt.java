package AST.Stmt;

import Util.position;
import AST.ASTNode;
import AST.ASTVisitor;

public class ContinueStmt extends StmtNode {

    public ContinueStmt(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

}
