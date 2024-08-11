package AST.Stmt;

import AST.*;
import AST.Def.VariableDef;
import Util.position;

public class VariableDefStmt extends StmtNode {
    public VariableDef variableDef;

    public VariableDefStmt(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
