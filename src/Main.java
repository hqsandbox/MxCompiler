import AST.Program;
import IR.IRPrinter;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.FileInputStream;
import java.io.InputStream;

import parser.MxLexer;
import parser.MxParser;
import Util.MxErrorListener;
import Util.error.error;
import Frontend.ASTBuilder;
import Frontend.SymbolCollector;
import Frontend.SemanticChecker;
import Util.Scope;
import IR.IRProgram;
import IR.IRBuilder;

public class Main {
    // string 相等用 equals，不能 == ！！！这样会引用传递
    // 错误：在 build expr时要确定一部分 expr的 type，另一部分在 check expr时确定
    // 错误：注意 expr的左值问题
    // 错误：要添加内建函数
    public static void main(String[] args) throws Exception{
//        String name = "C:\\Users\\31447\\IdeaProjects\\Compiler-Design-Implementation-master\\testcases\\sema\\array-package\\array-1.mx";
//        InputStream input = System.in;

        String name = "C:\\Users\\31447\\IdeaProjects\\untitled\\src\\test.mx";
        InputStream input = new FileInputStream(name);

        try {
            Program ASTRoot;
            Scope gScope = new Scope(null);

            MxLexer lexer = new MxLexer(CharStreams.fromStream(input));
            lexer.removeErrorListeners();
            lexer.addErrorListener(new MxErrorListener());
            MxParser parser = new MxParser(new CommonTokenStream(lexer));
            parser.removeErrorListeners();
            parser.addErrorListener(new MxErrorListener());
            ParseTree parseTreeRoot = null;
            try{
                parseTreeRoot = parser.program();
            } catch (Exception e) {
                System.out.println("Invalid Identifier");
                System.exit(1);
            }


            ASTBuilder astBuilder = new ASTBuilder(gScope);
            ASTRoot = (Program)astBuilder.visit(parseTreeRoot);
            new SymbolCollector(gScope).visit(ASTRoot);
            gScope.visitInfunc();
            gScope.visitInclass();
            new SemanticChecker(gScope).visit(ASTRoot);

            IRProgram irProgram = new IRProgram();
            new IRBuilder(irProgram, gScope).visit(ASTRoot);
            IRPrinter irPrinter = new IRPrinter(irProgram);
            irPrinter.print();

//            mainFn f = new mainFn();
//            new IRBuilder(f, gScope).visit(ASTRoot);
//            // new IRPrinter(System.out).visitFn(f);
//
//            AsmFn asmF = new AsmFn();
//            new InstSelector(asmF).visitFn(f);
//            new RegAlloc(asmF).work();
//            new AsmPrinter(asmF, System.out).print();
        } catch (error er) {
//            System.exit(1);
            System.err.println(er.toString());
            throw new RuntimeException();
        }
    }
}