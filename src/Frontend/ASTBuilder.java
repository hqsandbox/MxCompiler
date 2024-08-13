package Frontend;

import AST.*;
import AST.Def.ClassTypeDef;
import AST.Def.Definition;
import AST.Def.*;
import AST.Expr.*;
import AST.Stmt.*;
import parser.MxBaseVisitor;
import parser.MxParser;
import Util.Type;
import Util.Scope;
import Util.position;

public class ASTBuilder extends MxBaseVisitor<ASTNode> {

    private Scope gScope;

    public ASTBuilder(Scope gScope) {
        this.gScope = gScope;
    }

    @Override
    public ASTNode visitProgram(MxParser.ProgramContext ctx) {
        Program root = new Program(new position(ctx));
        ctx.definition().forEach(cd -> root.defList.add((Definition) visit(cd)));
        return root;
    }

    @Override
    public ASTNode visitDefinition(MxParser.DefinitionContext ctx) {
        if (ctx == null) return null;
        Definition definition = new Definition(new position(ctx));
        if (ctx.classTypeDef() != null) {
            definition.classDef = (ClassTypeDef) visit(ctx.classTypeDef());
        } else if (ctx.functionDef() != null) {
            definition.funcDef = (FunctionDef) visit(ctx.functionDef());
        } else if (ctx.variableDef() != null) {
            definition.variDef = (VariableDef) visit(ctx.variableDef());
        }
        return definition;
    }

    @Override
    public ASTNode visitClassTypeDef(MxParser.ClassTypeDefContext ctx) {
        if (ctx == null) return null;
        ClassTypeDef classDef = new ClassTypeDef(ctx.Identifier().toString(), new position(ctx));
        classDef.name = ctx.Identifier().toString();
        ctx.variableDef().forEach(vd -> classDef.varList.add((VariableDef) visit(vd)));
        ctx.functionDef().forEach(fd -> classDef.funcList.add((FunctionDef) visit(fd)));
        return classDef;
    }

    @Override
    public ASTNode visitFunctionDef(MxParser.FunctionDefContext ctx) {
        if (ctx == null) return null;
        FunctionDef funcDef = new FunctionDef(new position(ctx));
        funcDef.name = ctx.Identifier(0).getText();
        funcDef.returnType = visitType(ctx.typeName(0));
        funcDef.body = (Suite) visit(ctx.suite());
        ctx.typeName().stream().skip(1).forEach(tn -> funcDef.parameters.add(visitType(tn)));
        ctx.Identifier().stream().skip(1).forEach(id -> funcDef.parameterNames.add(id.getText()));
        return funcDef;
    }

    @Override
    public ASTNode visitVariableDef(MxParser.VariableDefContext ctx) {
        if (ctx == null) return null;
        VariableDef varDef = new VariableDef(new position(ctx));
        varDef.type = visitType(ctx.typeName());
        if(varDef.type.isVoid) {
            throw new RuntimeException("Variable cannot be void");
        }
        ctx.initVariable().forEach(iv -> varDef.initVariablelist.add((InitVariable) visit(iv)));
        varDef.initVariablelist.forEach(iv -> iv.type = varDef.type);
        return varDef;
    }

    @Override
    public ASTNode visitInitVariable(MxParser.InitVariableContext ctx) {
        if (ctx == null) return null;
        InitVariable initVar = new InitVariable(new position(ctx));
        initVar.name = ctx.Identifier().getText();
        if (ctx.expr() != null) {
            initVar.init = (Expression) visit(ctx.expr());
        }
        return initVar;
    }

    @Override
    public ASTNode visitSuite(MxParser.SuiteContext ctx) {
        if (ctx == null) return null;
        Suite suite = new Suite(new position(ctx));
        ctx.statement().forEach(stmt -> suite.stmt.add((StmtNode) visit(stmt)));
        return suite;
    }

    @Override
    public ASTNode visitArrayExpr(MxParser.ArrayExprContext ctx) {
        if (ctx == null) return null;
        ArrayExpr arrayExpr = new ArrayExpr(new position(ctx));
        arrayExpr.baseType = (Expression) visit(ctx.expr(0));
        arrayExpr.size = (Expression) visit(ctx.expr(1));
        arrayExpr.isAssignable = true;
        // 错误：这里要更新 type
        arrayExpr.type = new Type(arrayExpr.baseType.type);
        arrayExpr.type.dim = arrayExpr.baseType.type.dim + 1;
        return arrayExpr;
    }

    @Override
    public ASTNode visitAssignExpr(MxParser.AssignExprContext ctx) {
        if (ctx == null) return null;
        AssignExpr assignExpr = new AssignExpr(new position(ctx));
        assignExpr.lhs = (Expression) visit(ctx.expr(0));
        assignExpr.rhs = (Expression) visit(ctx.expr(1));
        return assignExpr;
    }

    @Override
    public ASTNode visitBinaryExpr(MxParser.BinaryExprContext ctx) {
        if (ctx == null) return null;
        BinaryExpr binaryExpr = new BinaryExpr(new position(ctx));
        binaryExpr.op = ctx.op.getText();
        binaryExpr.lhs = (Expression) visit(ctx.expr(0));
        binaryExpr.rhs = (Expression) visit(ctx.expr(1));
        return binaryExpr;
    }

    @Override
    public ASTNode visitConditionalExpr(MxParser.ConditionalExprContext ctx) {
        if (ctx == null) return null;
        ConditionalExpr conditionalExpr = new ConditionalExpr(new position(ctx));
        conditionalExpr.condition = (Expression) visit(ctx.expr(0));
        conditionalExpr.trueBranch = (Expression) visit(ctx.expr(1));
        conditionalExpr.falseBranch = (Expression) visit(ctx.expr(2));
        return conditionalExpr;
    }

    @Override
    public ASTNode visitFuncCallExpr(MxParser.FuncCallExprContext ctx) {
        if (ctx == null) return null;
        FuncCallExpr functionCallExpr = new FuncCallExpr(new position(ctx));
        functionCallExpr.funcName = ctx.Identifier().getText();
        // 错误：要考虑参数为空的情况
        if(ctx.parallelExp() != null){
            functionCallExpr.callExpList = (ParallelExp) visit(ctx.parallelExp());
        }
        if(functionCallExpr.callExpList == null){
            functionCallExpr.callExpList = new ParallelExp(new position(ctx));
        }
        return functionCallExpr;
    }

    @Override
    public ASTNode visitMemberExpr(MxParser.MemberExprContext ctx) {
        if (ctx == null) return null;
        MemberExpr memberExpr = new MemberExpr(new position(ctx));
        memberExpr.base = (Expression) visit(ctx.expr());
        memberExpr.memberName = ctx.Identifier().getText();
        memberExpr.type = new Type(memberExpr.base.type);
        memberExpr.isAssignable = true;
        return memberExpr;
    }

    @Override
    public ASTNode visitMethodCallExpr(MxParser.MethodCallExprContext ctx) {
        if (ctx == null) return null;
        MethodCallExpr methodCallExpr = new MethodCallExpr(new position(ctx));
        methodCallExpr.base = (Expression) visit(ctx.expr());
        methodCallExpr.methodName = ctx.Identifier().getText();
        if(ctx.parallelExp() != null){
            methodCallExpr.callExpList = (ParallelExp) visit(ctx.parallelExp());
        }
//        methodCallExpr.type = new Type(methodCallExpr.base.type);
        return methodCallExpr;
    }

    @Override
    public ASTNode visitNewArrayExpr(MxParser.NewArrayExprContext ctx) {
        if (ctx == null) return null;
        NewArrayExpr newArrayExpr = new NewArrayExpr(new position(ctx));
        newArrayExpr.baseType = visitAtomType(ctx.typeAtom());
        if(ctx.expr() != null) {
            ctx.expr().forEach(e -> newArrayExpr.size.add((Expression) visit(e)));
        }
        newArrayExpr.type = new Type(newArrayExpr.baseType);
        newArrayExpr.type.dim = ctx.count.size();
        // TODO
        return newArrayExpr;
    }

    @Override
    public ASTNode visitNewVarExpr(MxParser.NewVarExprContext ctx) {
        if (ctx == null) return null;
        NewVarExpr newVarExpr = new NewVarExpr(new position(ctx));
        newVarExpr.varName = ctx.typeAtom().getText();
        newVarExpr.type = visitAtomType(ctx.typeAtom());
        return newVarExpr;
    }

    @Override
    public ASTNode visitParallelExp(MxParser.ParallelExpContext ctx) {
        if (ctx == null) return null;
        ParallelExp parallelExp = new ParallelExp(new position(ctx));
        ctx.expr().forEach(e -> parallelExp.expList.add((Expression) visit(e)));
        return parallelExp;
    }

    @Override
    public ASTNode visitParenExpr(MxParser.ParenExprContext ctx) {
        if (ctx == null) return null;
        ParenExpr parenExpr = new ParenExpr(new position(ctx));
        parenExpr.expr = (Expression) visit(ctx.expr());
        parenExpr.type = new Type(parenExpr.expr.type);
        return parenExpr;
    }

    @Override
    public ASTNode visitPostfixExpr(MxParser.PostfixExprContext ctx) {
        if (ctx == null) return null;
        PostfixExpr postfixExpr = new PostfixExpr(new position(ctx));
        postfixExpr.op = ctx.op.getText();
        postfixExpr.expr = (Expression) visit(ctx.expr());
        postfixExpr.type = new Type();
        postfixExpr.type.setInt();
        return postfixExpr;
    }

    @Override
    public ASTNode visitPrefixExpr(MxParser.PrefixExprContext ctx) {
        if (ctx == null) return null;
        PrefixExpr prefixExpr = new PrefixExpr(new position(ctx));
        prefixExpr.op = ctx.op.getText();
        prefixExpr.expr = (Expression) visit(ctx.expr());
        prefixExpr.type = new Type();
        prefixExpr.type.setInt();
        return prefixExpr;
    }

    @Override
    public ASTNode visitPrimaryExpr(MxParser.PrimaryExprContext ctx) {
        if (ctx == null) return null;
        PrimaryExpr primaryExpr = new PrimaryExpr(new position(ctx));
        primaryExpr.type = new Type();
        if (ctx.primary().Identifier() != null) {
            primaryExpr.isIdentifier = true;
            primaryExpr.identifier = ctx.primary().Identifier().getText();
            primaryExpr.type.setClass(primaryExpr.identifier);
            // TODO
            primaryExpr.isAssignable = true;
        } else if (ctx.primary().This() != null) {
            primaryExpr.isThis = true;
            primaryExpr.type.setClass("this");
        } else if (ctx.primary().Null() != null) {
            primaryExpr.isNull = true;
            primaryExpr.type.setNull();
        } else if (ctx.primary().True() != null) {
            primaryExpr.isTrue = true;
            primaryExpr.type.setBool();
        } else if (ctx.primary().False() != null) {
            primaryExpr.isFalse = true;
            primaryExpr.type.setBool();
        } else if (ctx.primary().IntLiteral() != null) {
            primaryExpr.isIntLiteral = true;
            primaryExpr.intLiteral = ctx.primary().IntLiteral().getText();
            primaryExpr.type.setInt();
        } else if (ctx.primary().StringLiteral() != null) {
            primaryExpr.isStringLiteral = true;
            primaryExpr.stringLiteral = ctx.primary().StringLiteral().getText();
            primaryExpr.type.setString();
        } else if (ctx.primary().fmtString() != null) {
            primaryExpr.isFmtString = true;
            primaryExpr.fmtString = ctx.primary().fmtString().getText();
            primaryExpr.type.setString();
        } else {
            throw new RuntimeException("Unknown primary expression");
        }
        return primaryExpr;
    }

    @Override
    public ASTNode visitUnaryExpr(MxParser.UnaryExprContext ctx) {
        if (ctx == null) return null;
        UnaryExpr unaryExpr = new UnaryExpr(new position(ctx));
        unaryExpr.op = ctx.op.getText();
        unaryExpr.expr = (Expression) visit(ctx.expr());
        return unaryExpr;
    }

    @Override
    public ASTNode visitBreakStmt(MxParser.BreakStmtContext ctx) {
        if (ctx == null) return null;
        BreakStmt breakStmt = new BreakStmt(new position(ctx));
        return breakStmt;
    }

    @Override
    public ASTNode visitContinueStmt(MxParser.ContinueStmtContext ctx) {
        if (ctx == null) return null;
        ContinueStmt continueStmt = new ContinueStmt(new position(ctx));
        return continueStmt;
    }

    @Override
    public ASTNode visitExprStmt(MxParser.ExprStmtContext ctx) {
        if (ctx == null) return null;
        ExprStmt exprStmt = new ExprStmt(new position(ctx));
        exprStmt.expr = (Expression) visit(ctx.expr());
        return exprStmt;
    }

    @Override
    public ASTNode visitForStmt(MxParser.ForStmtContext ctx) {
        if (ctx == null) return null;
        ForStmt forStmt = new ForStmt(new position(ctx));
        if (ctx.parallelExp() != null) {
            forStmt.parallelExp = (ParallelExp) visit(ctx.parallelExp());
        } else if (ctx.variableDef() != null) {
            forStmt.variableDef = (VariableDef) visit(ctx.variableDef());
        } else if (ctx.expr() != null) {
            forStmt.conditionExp = (Expression) visit(ctx.expr(0));
            forStmt.stepExp = (Expression) visit(ctx.expr(1));
        }
        forStmt.stmt = (StmtNode) visit(ctx.statement());
        return forStmt;
    }

    @Override
    public ASTNode visitIfStmt(MxParser.IfStmtContext ctx) {
        if (ctx == null) return null;
        IfStmt ifStmt = new IfStmt(new position(ctx));
        ifStmt.condition = (Expression) visit(ctx.expr());
        // 错误：不能写成 (Suite)
        ifStmt.thenStmt = (StmtNode) visit(ctx.statement(0));
        if (ctx.statement().size() == 2) {
            ifStmt.elseStmt = (StmtNode) visit(ctx.statement(1));
        }
        return ifStmt;
    }

    @Override
    public ASTNode visitReturnStmt(MxParser.ReturnStmtContext ctx) {
        if (ctx == null) return null;
        ReturnStmt returnStmt = new ReturnStmt(new position(ctx));
        if (ctx.expr() != null) {
            returnStmt.expr = (Expression) visit(ctx.expr());
        }
        return returnStmt;
    }

    @Override
    public ASTNode visitSuiteStmt(MxParser.SuiteStmtContext ctx) {
        if (ctx == null) return null;
        Suite suiteStmt = new Suite(new position(ctx));
        ctx.suite().statement().forEach(stmt -> suiteStmt.stmt.add((StmtNode) visit(stmt)));
        return suiteStmt;
    }

    @Override
    public ASTNode visitVariableDefStmt(MxParser.VariableDefStmtContext ctx) {
        if (ctx == null) return null;
        VariableDefStmt varDefStmt = new VariableDefStmt(new position(ctx));
        varDefStmt.variableDef = (VariableDef) visit(ctx.variableDef());
        return varDefStmt;
    }

    @Override
    public ASTNode visitWhileStmt(MxParser.WhileStmtContext ctx) {
        if (ctx == null) return null;
        WhileStmt whileStmt = new WhileStmt(new position(ctx));
        whileStmt.condition = (Expression) visit(ctx.expr());
        whileStmt.body = (Suite) visit(ctx.statement());
        return whileStmt;
    }

    public Type visitType(MxParser.TypeNameContext ctx) {
        if (ctx == null) return null;
        Type type = new Type();
        if(ctx.dim() != null) {
            type.dim = ctx.dim().size();
        }
        if (ctx.Bool() != null) {
            type.setBool();
        } else if (ctx.Int() != null) {
            type.setInt();
        } else if (ctx.String() != null) {
            type.setString();
        } else if (ctx.Void() != null) {
            type.setVoid();
        } else if (ctx.Identifier() != null) {
            type.setClass(ctx.Identifier().getText());
        } else if (ctx.typeAtom() != null) {
            type.setArray(visitAtomType(ctx.typeAtom()));
        } else {
            throw new RuntimeException("Unknown type");
        }
        return type;
    }

    public Type visitAtomType(MxParser.TypeAtomContext ctx) {
        if (ctx == null) return null;
        Type type = new Type();
        if (ctx.Bool() != null) {
            type.setBool();
        } else if (ctx.Int() != null) {
            type.setInt();
        } else if (ctx.String() != null) {
            type.setString();
        } else if (ctx.Void() != null) {
            type.setVoid();
        } else if (ctx.Identifier() != null) {
            type.setClass(ctx.Identifier().getText());
        } else {
            throw new RuntimeException("Unknown type");
        }
        return type;
    }
}
