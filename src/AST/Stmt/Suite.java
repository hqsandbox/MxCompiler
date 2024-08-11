package AST.Stmt;

import AST.ASTVisitor;
import java.util.ArrayList;
import Util.position;

public class Suite extends StmtNode {

    public ArrayList<StmtNode> stmt = new ArrayList<>();

    public Suite(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
