package AST.Stmt;

import AST.ASTNode;
import AST.ASTVisitor;
import Util.position;
import AST.Def.VariableDef;
import AST.Expr.Expression;
import AST.Expr.ParallelExp;
import AST.Stmt.StmtNode;

public class ForStmt extends StmtNode {

    public ParallelExp parallelExp;
    public VariableDef variableDef;
    public Expression conditionExp;
    public Expression stepExp;
    public StmtNode stmt;

    public ForStmt(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
