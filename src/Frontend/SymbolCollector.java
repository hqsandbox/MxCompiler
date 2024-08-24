package Frontend;

import AST.*;
import Util.Scope;
import AST.Def.*;
import Util.infor.*;
import AST.Expr.*;
import AST.Stmt.*;

public class SymbolCollector implements ASTVisitor {
    private Scope gScope;
    public SymbolCollector(Scope gScope) {
        this.gScope = gScope;
    }
    @Override
    public void visit(Program it) {
        it.defList.forEach(sd -> sd.accept(this));
    }

    @Override public void visit(Definition it) {
        if(it.classDef != null) it.classDef.accept(this);
        if(it.funcDef != null) it.funcDef.accept(this);
    }

    @Override public void visit(ClassTypeDef it) {
        ClassInfor struct = new ClassInfor(it);
        it.varList.forEach(vd ->{
            vd.initVariablelist.forEach(iv -> {
                struct.varNames.add(iv.name);
            });
        });
        if(gScope.funcInfor.containsKey(it.name))
            throw new Util.error.semanticError("class name conflict with function name", it.pos);
        gScope.addClassInfo(it.name, struct, it.pos);
    }

    @Override public void visit(FunctionDef it) {
        FuncInfor func = new FuncInfor(it);
        if(gScope.classInfor.containsKey(it.name)){
            System.out.println("Multiple Definitions");
            throw new Util.error.semanticError("function name conflict with class name", it.pos);
        }
        gScope.addFuncInfo(it.name, func, it.pos);
    }

    @Override public void visit(VariableDef it) {}
    @Override public void visit(InitVariable it) {}
    @Override public void visit(Constructor it) {}

    @Override public void visit(Arrayconst it) {}
    @Override public void visit(ArrayExpr it) {}
    @Override public void visit(AssignExpr it) {}
    @Override public void visit(BinaryExpr it) {}
    @Override public void visit(ConditionalExpr it) {}
    @Override public void visit(Expression it) {}
    @Override public void visit(FuncCallExpr it) {}
    @Override public void visit(MemberExpr it) {}
    @Override public void visit(MethodCallExpr it) {}
    @Override public void visit(NewArrayExpr it) {}
    @Override public void visit(NewVarExpr it) {}
    @Override public void visit(ParallelExp it) {}
    @Override public void visit(ParenExpr it) {}
    @Override public void visit(PostfixExpr it) {}
    @Override public void visit(PrefixExpr it) {}
    @Override public void visit(PrimaryExpr it) {}
    @Override public void visit(UnaryExpr it) {}
    @Override public void visit(Literal it) {}
    @Override public void visit(FmtString it) {}

    @Override public void visit(BreakStmt it) {}
    @Override public void visit(ContinueStmt it) {}
    @Override public void visit(ExprStmt it) {}
    @Override public void visit(ForStmt it) {}
    @Override public void visit(IfStmt it) {}
    @Override public void visit(ReturnStmt it) {}
    @Override public void visit(Suite it) {}
    @Override public void visit(VariableDefStmt it) {}
    @Override public void visit(WhileStmt it) {}
    @Override public void visit(EmptyStmt it) {}
}

