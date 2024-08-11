package AST;

import AST.Def.Definition;
import java.util.ArrayList;
import Util.position;

public class Program extends ASTNode {
    public ArrayList<Definition> defList = new ArrayList<>();

    public Program(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
