package AST;

import Util.position;

abstract public class ASTNode {
    public position pos;

    public ASTNode(position pos) {
        this.pos = pos;
    }

    public abstract void accept(ASTVisitor visitor);
}
