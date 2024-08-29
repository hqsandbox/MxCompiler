import ASM.ASMBuilder;
import ASM.ASMPrinter;
import ASM.ASMProgram;
import AST.Program;
import IR.IRPrinter;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.*;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintStream;
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

        InputStream input = System.in;
//
//        PrintStream output =new PrintStream(new FileOutputStream("test.s"));
//        System.setOut(output);

//        String name = "C:\\Users\\31447\\IdeaProjects\\untitled\\testcases\\codegen\\t20.mx";

//        String name = "C:\\Users\\31447\\IdeaProjects\\untitled\\src\\test.mx";
//        InputStream input = new FileInputStream(name);
//        PrintStream output =new PrintStream(new FileOutputStream("src/test.s"));
//        System.setOut(output);

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
            var irBuilder = new IRBuilder(irProgram, gScope);
            irBuilder.irProgram.visitInfunc();
            irBuilder.irProgram.visitInClass();
            irBuilder.visit(ASTRoot);
//            IRPrinter irPrinter = new IRPrinter(irProgram);
//            irPrinter.print();

            var asmBuilder = new ASMBuilder(irProgram);
            asmBuilder.visit(irProgram);
            ASMPrinter asmPrinter = new ASMPrinter(asmBuilder.asmProgram);
            asmPrinter.print();
            System.out.println("\t.text\n" +
                    "\t.attribute\t4, 16\n" +
                    "\t.attribute\t5, \"rv32i2p0\"\n" +
                    "\t.file\t\"builtin.c\"\n" +
                    "\t.globl\tprint                           # -- Begin function print\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\tprint,@function\n" +
                    "print:                                  # @print\n" +
                    "# %bb.0:\n" +
                    "\tlui\ta1, %hi(.L.str)\n" +
                    "\taddi\ta1, a1, %lo(.L.str)\n" +
                    "\tmv\ta2, a0\n" +
                    "\tmv\ta0, a1\n" +
                    "\tmv\ta1, a2\n" +
                    "\ttail\tprintf\n" +
                    ".Lfunc_end0:\n" +
                    "\t.size\tprint, .Lfunc_end0-print\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\tprintln                         # -- Begin function println\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\tprintln,@function\n" +
                    "println:                                # @println\n" +
                    "# %bb.0:\n" +
                    "\tlui\ta1, %hi(.L.str.1)\n" +
                    "\taddi\ta1, a1, %lo(.L.str.1)\n" +
                    "\tmv\ta2, a0\n" +
                    "\tmv\ta0, a1\n" +
                    "\tmv\ta1, a2\n" +
                    "\ttail\tprintf\n" +
                    ".Lfunc_end1:\n" +
                    "\t.size\tprintln, .Lfunc_end1-println\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\tprintInt                        # -- Begin function printInt\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\tprintInt,@function\n" +
                    "printInt:                               # @printInt\n" +
                    "# %bb.0:\n" +
                    "\tlui\ta1, %hi(.L.str.2)\n" +
                    "\taddi\ta1, a1, %lo(.L.str.2)\n" +
                    "\tmv\ta2, a0\n" +
                    "\tmv\ta0, a1\n" +
                    "\tmv\ta1, a2\n" +
                    "\ttail\tprintf\n" +
                    ".Lfunc_end2:\n" +
                    "\t.size\tprintInt, .Lfunc_end2-printInt\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\tprintlnInt                      # -- Begin function printlnInt\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\tprintlnInt,@function\n" +
                    "printlnInt:                             # @printlnInt\n" +
                    "# %bb.0:\n" +
                    "\tlui\ta1, %hi(.L.str.3)\n" +
                    "\taddi\ta1, a1, %lo(.L.str.3)\n" +
                    "\tmv\ta2, a0\n" +
                    "\tmv\ta0, a1\n" +
                    "\tmv\ta1, a2\n" +
                    "\ttail\tprintf\n" +
                    ".Lfunc_end3:\n" +
                    "\t.size\tprintlnInt, .Lfunc_end3-printlnInt\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\tgetInt                          # -- Begin function getInt\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\tgetInt,@function\n" +
                    "getInt:                                 # @getInt\n" +
                    "# %bb.0:\n" +
                    "\taddi\tsp, sp, -16\n" +
                    "\tsw\tra, 12(sp)                      # 4-byte Folded Spill\n" +
                    "\tlui\ta0, %hi(.L.str.2)\n" +
                    "\taddi\ta0, a0, %lo(.L.str.2)\n" +
                    "\taddi\ta1, sp, 8\n" +
                    "\tcall\tscanf\n" +
                    "\tlw\ta0, 8(sp)\n" +
                    "\tlw\tra, 12(sp)                      # 4-byte Folded Reload\n" +
                    "\taddi\tsp, sp, 16\n" +
                    "\tret\n" +
                    ".Lfunc_end4:\n" +
                    "\t.size\tgetInt, .Lfunc_end4-getInt\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\tgetString                       # -- Begin function getString\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\tgetString,@function\n" +
                    "getString:                              # @getString\n" +
                    "# %bb.0:\n" +
                    "\taddi\tsp, sp, -16\n" +
                    "\tsw\tra, 12(sp)                      # 4-byte Folded Spill\n" +
                    "\tsw\ts0, 8(sp)                       # 4-byte Folded Spill\n" +
                    "\tli\ta0, 256\n" +
                    "\tcall\tmalloc\n" +
                    "\tmv\ts0, a0\n" +
                    "\tlui\ta0, %hi(.L.str)\n" +
                    "\taddi\ta0, a0, %lo(.L.str)\n" +
                    "\tmv\ta1, s0\n" +
                    "\tcall\tscanf\n" +
                    "\tmv\ta0, s0\n" +
                    "\tlw\tra, 12(sp)                      # 4-byte Folded Reload\n" +
                    "\tlw\ts0, 8(sp)                       # 4-byte Folded Reload\n" +
                    "\taddi\tsp, sp, 16\n" +
                    "\tret\n" +
                    ".Lfunc_end5:\n" +
                    "\t.size\tgetString, .Lfunc_end5-getString\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\ttoString                        # -- Begin function toString\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\ttoString,@function\n" +
                    "toString:                               # @toString\n" +
                    "# %bb.0:\n" +
                    "\taddi\tsp, sp, -16\n" +
                    "\tsw\tra, 12(sp)                      # 4-byte Folded Spill\n" +
                    "\tsw\ts0, 8(sp)                       # 4-byte Folded Spill\n" +
                    "\tsw\ts1, 4(sp)                       # 4-byte Folded Spill\n" +
                    "\tmv\ts0, a0\n" +
                    "\tli\ta0, 16\n" +
                    "\tcall\tmalloc\n" +
                    "\tmv\ts1, a0\n" +
                    "\tlui\ta0, %hi(.L.str.2)\n" +
                    "\taddi\ta1, a0, %lo(.L.str.2)\n" +
                    "\tmv\ta0, s1\n" +
                    "\tmv\ta2, s0\n" +
                    "\tcall\tsprintf\n" +
                    "\tmv\ta0, s1\n" +
                    "\tlw\tra, 12(sp)                      # 4-byte Folded Reload\n" +
                    "\tlw\ts0, 8(sp)                       # 4-byte Folded Reload\n" +
                    "\tlw\ts1, 4(sp)                       # 4-byte Folded Reload\n" +
                    "\taddi\tsp, sp, 16\n" +
                    "\tret\n" +
                    ".Lfunc_end6:\n" +
                    "\t.size\ttoString, .Lfunc_end6-toString\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\tstring.copy                     # -- Begin function string.copy\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\tstring.copy,@function\n" +
                    "string.copy:                            # @string.copy\n" +
                    "# %bb.0:\n" +
                    "\taddi\tsp, sp, -16\n" +
                    "\tsw\tra, 12(sp)                      # 4-byte Folded Spill\n" +
                    "\tsw\ts0, 8(sp)                       # 4-byte Folded Spill\n" +
                    "\tsw\ts1, 4(sp)                       # 4-byte Folded Spill\n" +
                    "\tsw\ts2, 0(sp)                       # 4-byte Folded Spill\n" +
                    "\tmv\ts2, a0\n" +
                    "\tcall\tstrlen\n" +
                    "\tmv\ts1, a0\n" +
                    "\taddi\ta0, a0, 1\n" +
                    "\tcall\tmalloc\n" +
                    "\tmv\ts0, a0\n" +
                    "\tmv\ta1, s2\n" +
                    "\tmv\ta2, s1\n" +
                    "\tcall\tmemcpy\n" +
                    "\tadd\ta0, s0, s1\n" +
                    "\tsb\tzero, 0(a0)\n" +
                    "\tmv\ta0, s0\n" +
                    "\tlw\tra, 12(sp)                      # 4-byte Folded Reload\n" +
                    "\tlw\ts0, 8(sp)                       # 4-byte Folded Reload\n" +
                    "\tlw\ts1, 4(sp)                       # 4-byte Folded Reload\n" +
                    "\tlw\ts2, 0(sp)                       # 4-byte Folded Reload\n" +
                    "\taddi\tsp, sp, 16\n" +
                    "\tret\n" +
                    ".Lfunc_end7:\n" +
                    "\t.size\tstring.copy, .Lfunc_end7-string.copy\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\tstring.length                   # -- Begin function string.length\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\tstring.length,@function\n" +
                    "string.length:                          # @string.length\n" +
                    "# %bb.0:\n" +
                    "\ttail\tstrlen\n" +
                    ".Lfunc_end8:\n" +
                    "\t.size\tstring.length, .Lfunc_end8-string.length\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\tstring.substring                # -- Begin function string.substring\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\tstring.substring,@function\n" +
                    "string.substring:                       # @string.substring\n" +
                    "# %bb.0:\n" +
                    "\taddi\tsp, sp, -16\n" +
                    "\tsw\tra, 12(sp)                      # 4-byte Folded Spill\n" +
                    "\tsw\ts0, 8(sp)                       # 4-byte Folded Spill\n" +
                    "\tsw\ts1, 4(sp)                       # 4-byte Folded Spill\n" +
                    "\tsw\ts2, 0(sp)                       # 4-byte Folded Spill\n" +
                    "\tmv\ts0, a1\n" +
                    "\tmv\ts2, a0\n" +
                    "\tsub\ts1, a2, a1\n" +
                    "\taddi\ta0, s1, 1\n" +
                    "\tcall\tmalloc\n" +
                    "\tblez\ts1, .LBB9_3\n" +
                    "# %bb.1:                                # %.preheader\n" +
                    "\tadd\ta1, s2, s0\n" +
                    "\tmv\ta2, a0\n" +
                    "\tmv\ta3, s1\n" +
                    ".LBB9_2:                                # =>This Inner Loop Header: Depth=1\n" +
                    "\tlb\ta4, 0(a1)\n" +
                    "\tsb\ta4, 0(a2)\n" +
                    "\taddi\ta3, a3, -1\n" +
                    "\taddi\ta2, a2, 1\n" +
                    "\taddi\ta1, a1, 1\n" +
                    "\tbnez\ta3, .LBB9_2\n" +
                    ".LBB9_3:\n" +
                    "\tadd\ta1, a0, s1\n" +
                    "\tsb\tzero, 0(a1)\n" +
                    "\tlw\tra, 12(sp)                      # 4-byte Folded Reload\n" +
                    "\tlw\ts0, 8(sp)                       # 4-byte Folded Reload\n" +
                    "\tlw\ts1, 4(sp)                       # 4-byte Folded Reload\n" +
                    "\tlw\ts2, 0(sp)                       # 4-byte Folded Reload\n" +
                    "\taddi\tsp, sp, 16\n" +
                    "\tret\n" +
                    ".Lfunc_end9:\n" +
                    "\t.size\tstring.substring, .Lfunc_end9-string.substring\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\tstring.parseInt                 # -- Begin function string.parseInt\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\tstring.parseInt,@function\n" +
                    "string.parseInt:                        # @string.parseInt\n" +
                    "# %bb.0:\n" +
                    "\taddi\tsp, sp, -16\n" +
                    "\tsw\tra, 12(sp)                      # 4-byte Folded Spill\n" +
                    "\tlui\ta1, %hi(.L.str.2)\n" +
                    "\taddi\ta1, a1, %lo(.L.str.2)\n" +
                    "\taddi\ta2, sp, 8\n" +
                    "\tcall\tsscanf\n" +
                    "\tlw\ta0, 8(sp)\n" +
                    "\tlw\tra, 12(sp)                      # 4-byte Folded Reload\n" +
                    "\taddi\tsp, sp, 16\n" +
                    "\tret\n" +
                    ".Lfunc_end10:\n" +
                    "\t.size\tstring.parseInt, .Lfunc_end10-string.parseInt\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\tstring.ord                      # -- Begin function string.ord\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\tstring.ord,@function\n" +
                    "string.ord:                             # @string.ord\n" +
                    "# %bb.0:\n" +
                    "\tadd\ta0, a0, a1\n" +
                    "\tlbu\ta0, 0(a0)\n" +
                    "\tret\n" +
                    ".Lfunc_end11:\n" +
                    "\t.size\tstring.ord, .Lfunc_end11-string.ord\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\tstring.add                      # -- Begin function string.add\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\tstring.add,@function\n" +
                    "string.add:                             # @string.add\n" +
                    "# %bb.0:\n" +
                    "\taddi\tsp, sp, -32\n" +
                    "\tsw\tra, 28(sp)                      # 4-byte Folded Spill\n" +
                    "\tsw\ts0, 24(sp)                      # 4-byte Folded Spill\n" +
                    "\tsw\ts1, 20(sp)                      # 4-byte Folded Spill\n" +
                    "\tsw\ts2, 16(sp)                      # 4-byte Folded Spill\n" +
                    "\tsw\ts3, 12(sp)                      # 4-byte Folded Spill\n" +
                    "\tsw\ts4, 8(sp)                       # 4-byte Folded Spill\n" +
                    "\tsw\ts5, 4(sp)                       # 4-byte Folded Spill\n" +
                    "\tmv\ts2, a1\n" +
                    "\tmv\ts3, a0\n" +
                    "\tcall\tstrlen\n" +
                    "\tmv\ts0, a0\n" +
                    "\tmv\ta0, s2\n" +
                    "\tcall\tstrlen\n" +
                    "\tmv\ts4, a0\n" +
                    "\tadd\ts5, a0, s0\n" +
                    "\taddi\ta0, s5, 1\n" +
                    "\tcall\tmalloc\n" +
                    "\tmv\ts1, a0\n" +
                    "\tmv\ta1, s3\n" +
                    "\tmv\ta2, s0\n" +
                    "\tcall\tmemcpy\n" +
                    "\tadd\ta0, s1, s0\n" +
                    "\tmv\ta1, s2\n" +
                    "\tmv\ta2, s4\n" +
                    "\tcall\tmemcpy\n" +
                    "\tadd\ta0, s1, s5\n" +
                    "\tsb\tzero, 0(a0)\n" +
                    "\tmv\ta0, s1\n" +
                    "\tlw\tra, 28(sp)                      # 4-byte Folded Reload\n" +
                    "\tlw\ts0, 24(sp)                      # 4-byte Folded Reload\n" +
                    "\tlw\ts1, 20(sp)                      # 4-byte Folded Reload\n" +
                    "\tlw\ts2, 16(sp)                      # 4-byte Folded Reload\n" +
                    "\tlw\ts3, 12(sp)                      # 4-byte Folded Reload\n" +
                    "\tlw\ts4, 8(sp)                       # 4-byte Folded Reload\n" +
                    "\tlw\ts5, 4(sp)                       # 4-byte Folded Reload\n" +
                    "\taddi\tsp, sp, 32\n" +
                    "\tret\n" +
                    ".Lfunc_end12:\n" +
                    "\t.size\tstring.add, .Lfunc_end12-string.add\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\tstring.equal                    # -- Begin function string.equal\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\tstring.equal,@function\n" +
                    "string.equal:                           # @string.equal\n" +
                    "# %bb.0:\n" +
                    "\taddi\tsp, sp, -16\n" +
                    "\tsw\tra, 12(sp)                      # 4-byte Folded Spill\n" +
                    "\tcall\tstrcmp\n" +
                    "\tseqz\ta0, a0\n" +
                    "\tlw\tra, 12(sp)                      # 4-byte Folded Reload\n" +
                    "\taddi\tsp, sp, 16\n" +
                    "\tret\n" +
                    ".Lfunc_end13:\n" +
                    "\t.size\tstring.equal, .Lfunc_end13-string.equal\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\tstring.notEqual                 # -- Begin function string.notEqual\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\tstring.notEqual,@function\n" +
                    "string.notEqual:                        # @string.notEqual\n" +
                    "# %bb.0:\n" +
                    "\taddi\tsp, sp, -16\n" +
                    "\tsw\tra, 12(sp)                      # 4-byte Folded Spill\n" +
                    "\tcall\tstrcmp\n" +
                    "\tsnez\ta0, a0\n" +
                    "\tlw\tra, 12(sp)                      # 4-byte Folded Reload\n" +
                    "\taddi\tsp, sp, 16\n" +
                    "\tret\n" +
                    ".Lfunc_end14:\n" +
                    "\t.size\tstring.notEqual, .Lfunc_end14-string.notEqual\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\tstring.less                     # -- Begin function string.less\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\tstring.less,@function\n" +
                    "string.less:                            # @string.less\n" +
                    "# %bb.0:\n" +
                    "\taddi\tsp, sp, -16\n" +
                    "\tsw\tra, 12(sp)                      # 4-byte Folded Spill\n" +
                    "\tcall\tstrcmp\n" +
                    "\tsrli\ta0, a0, 31\n" +
                    "\tlw\tra, 12(sp)                      # 4-byte Folded Reload\n" +
                    "\taddi\tsp, sp, 16\n" +
                    "\tret\n" +
                    ".Lfunc_end15:\n" +
                    "\t.size\tstring.less, .Lfunc_end15-string.less\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\tstring.lessOrEqual              # -- Begin function string.lessOrEqual\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\tstring.lessOrEqual,@function\n" +
                    "string.lessOrEqual:                     # @string.lessOrEqual\n" +
                    "# %bb.0:\n" +
                    "\taddi\tsp, sp, -16\n" +
                    "\tsw\tra, 12(sp)                      # 4-byte Folded Spill\n" +
                    "\tcall\tstrcmp\n" +
                    "\tslti\ta0, a0, 1\n" +
                    "\tlw\tra, 12(sp)                      # 4-byte Folded Reload\n" +
                    "\taddi\tsp, sp, 16\n" +
                    "\tret\n" +
                    ".Lfunc_end16:\n" +
                    "\t.size\tstring.lessOrEqual, .Lfunc_end16-string.lessOrEqual\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\tstring.greater                  # -- Begin function string.greater\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\tstring.greater,@function\n" +
                    "string.greater:                         # @string.greater\n" +
                    "# %bb.0:\n" +
                    "\taddi\tsp, sp, -16\n" +
                    "\tsw\tra, 12(sp)                      # 4-byte Folded Spill\n" +
                    "\tcall\tstrcmp\n" +
                    "\tsgtz\ta0, a0\n" +
                    "\tlw\tra, 12(sp)                      # 4-byte Folded Reload\n" +
                    "\taddi\tsp, sp, 16\n" +
                    "\tret\n" +
                    ".Lfunc_end17:\n" +
                    "\t.size\tstring.greater, .Lfunc_end17-string.greater\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\tstring.greaterOrEqual           # -- Begin function string.greaterOrEqual\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\tstring.greaterOrEqual,@function\n" +
                    "string.greaterOrEqual:                  # @string.greaterOrEqual\n" +
                    "# %bb.0:\n" +
                    "\taddi\tsp, sp, -16\n" +
                    "\tsw\tra, 12(sp)                      # 4-byte Folded Spill\n" +
                    "\tcall\tstrcmp\n" +
                    "\tnot\ta0, a0\n" +
                    "\tsrli\ta0, a0, 31\n" +
                    "\tlw\tra, 12(sp)                      # 4-byte Folded Reload\n" +
                    "\taddi\tsp, sp, 16\n" +
                    "\tret\n" +
                    ".Lfunc_end18:\n" +
                    "\t.size\tstring.greaterOrEqual, .Lfunc_end18-string.greaterOrEqual\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\tarray.size                      # -- Begin function array.size\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\tarray.size,@function\n" +
                    "array.size:                             # @array.size\n" +
                    "# %bb.0:\n" +
                    "\tlw\ta0, -4(a0)\n" +
                    "\tret\n" +
                    ".Lfunc_end19:\n" +
                    "\t.size\tarray.size, .Lfunc_end19-array.size\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\t_malloc                         # -- Begin function _malloc\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\t_malloc,@function\n" +
                    "_malloc:                                # @_malloc\n" +
                    "# %bb.0:\n" +
                    "\ttail\tmalloc\n" +
                    ".Lfunc_end20:\n" +
                    "\t.size\t_malloc, .Lfunc_end20-_malloc\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\t__alloca_helper                 # -- Begin function __alloca_helper\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\t__alloca_helper,@function\n" +
                    "__alloca_helper:                        # @__alloca_helper\n" +
                    "# %bb.0:\n" +
                    "\taddi\tsp, sp, -16\n" +
                    "\tsw\tra, 12(sp)                      # 4-byte Folded Spill\n" +
                    "\tsw\ts0, 8(sp)                       # 4-byte Folded Spill\n" +
                    "\tmv\ts0, a1\n" +
                    "\tmul\ta0, a1, a0\n" +
                    "\taddi\ta0, a0, 4\n" +
                    "\tcall\tmalloc\n" +
                    "\taddi\ta1, a0, 4\n" +
                    "\tsw\ts0, 0(a0)\n" +
                    "\tmv\ta0, a1\n" +
                    "\tlw\tra, 12(sp)                      # 4-byte Folded Reload\n" +
                    "\tlw\ts0, 8(sp)                       # 4-byte Folded Reload\n" +
                    "\taddi\tsp, sp, 16\n" +
                    "\tret\n" +
                    ".Lfunc_end21:\n" +
                    "\t.size\t__alloca_helper, .Lfunc_end21-__alloca_helper\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\t__array.alloca_inside           # -- Begin function __array.alloca_inside\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\t__array.alloca_inside,@function\n" +
                    "__array.alloca_inside:                  # @__array.alloca_inside\n" +
                    "# %bb.0:\n" +
                    "\taddi\tsp, sp, -48\n" +
                    "\tsw\tra, 44(sp)                      # 4-byte Folded Spill\n" +
                    "\tsw\ts0, 40(sp)                      # 4-byte Folded Spill\n" +
                    "\tsw\ts1, 36(sp)                      # 4-byte Folded Spill\n" +
                    "\tsw\ts2, 32(sp)                      # 4-byte Folded Spill\n" +
                    "\tsw\ts3, 28(sp)                      # 4-byte Folded Spill\n" +
                    "\tsw\ts4, 24(sp)                      # 4-byte Folded Spill\n" +
                    "\tsw\ts5, 20(sp)                      # 4-byte Folded Spill\n" +
                    "\tsw\ts6, 16(sp)                      # 4-byte Folded Spill\n" +
                    "\tsw\ts7, 12(sp)                      # 4-byte Folded Spill\n" +
                    "\tli\ta4, 1\n" +
                    "\tmv\ts6, a2\n" +
                    "\tmv\ts2, a0\n" +
                    "\tbne\ta1, a4, .LBB22_2\n" +
                    "# %bb.1:\n" +
                    "\tlw\ts0, 0(s6)\n" +
                    "\tmul\ta0, s0, s2\n" +
                    "\taddi\ta0, a0, 4\n" +
                    "\tcall\tmalloc\n" +
                    "\tsw\ts0, 0(a0)\n" +
                    "\taddi\ts3, a0, 4\n" +
                    "\tj\t.LBB22_5\n" +
                    ".LBB22_2:\n" +
                    "\tmv\ts4, a1\n" +
                    "\tlw\ts0, 0(s6)\n" +
                    "\taddi\ts5, a3, -1\n" +
                    "\tsnez\ts1, s5\n" +
                    "\tslli\ta0, s0, 2\n" +
                    "\taddi\ta0, a0, 4\n" +
                    "\tcall\tmalloc\n" +
                    "\tsw\ts0, 0(a0)\n" +
                    "\tsgtz\ta1, s0\n" +
                    "\tand\ta1, a1, s1\n" +
                    "\taddi\ts3, a0, 4\n" +
                    "\tbeqz\ta1, .LBB22_5\n" +
                    "# %bb.3:\n" +
                    "\tli\ts0, 0\n" +
                    "\taddi\ts4, s4, -1\n" +
                    "\taddi\ts7, s6, 4\n" +
                    "\tmv\ts1, s3\n" +
                    ".LBB22_4:                               # =>This Inner Loop Header: Depth=1\n" +
                    "\tmv\ta0, s2\n" +
                    "\tmv\ta1, s4\n" +
                    "\tmv\ta2, s7\n" +
                    "\tmv\ta3, s5\n" +
                    "\tcall\t__array.alloca_inside\n" +
                    "\tsw\ta0, 0(s1)\n" +
                    "\tlw\ta0, 0(s6)\n" +
                    "\taddi\ts0, s0, 1\n" +
                    "\taddi\ts1, s1, 4\n" +
                    "\tblt\ts0, a0, .LBB22_4\n" +
                    ".LBB22_5:\n" +
                    "\tmv\ta0, s3\n" +
                    "\tlw\tra, 44(sp)                      # 4-byte Folded Reload\n" +
                    "\tlw\ts0, 40(sp)                      # 4-byte Folded Reload\n" +
                    "\tlw\ts1, 36(sp)                      # 4-byte Folded Reload\n" +
                    "\tlw\ts2, 32(sp)                      # 4-byte Folded Reload\n" +
                    "\tlw\ts3, 28(sp)                      # 4-byte Folded Reload\n" +
                    "\tlw\ts4, 24(sp)                      # 4-byte Folded Reload\n" +
                    "\tlw\ts5, 20(sp)                      # 4-byte Folded Reload\n" +
                    "\tlw\ts6, 16(sp)                      # 4-byte Folded Reload\n" +
                    "\tlw\ts7, 12(sp)                      # 4-byte Folded Reload\n" +
                    "\taddi\tsp, sp, 48\n" +
                    "\tret\n" +
                    ".Lfunc_end22:\n" +
                    "\t.size\t__array.alloca_inside, .Lfunc_end22-__array.alloca_inside\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\t__array.alloca                  # -- Begin function __array.alloca\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\t__array.alloca,@function\n" +
                    "__array.alloca:                         # @__array.alloca\n" +
                    "# %bb.0:\n" +
                    "\taddi\tsp, sp, -48\n" +
                    "\tsw\tra, 20(sp)                      # 4-byte Folded Spill\n" +
                    "\tsw\ts0, 16(sp)                      # 4-byte Folded Spill\n" +
                    "\tsw\ts1, 12(sp)                      # 4-byte Folded Spill\n" +
                    "\tsw\ts2, 8(sp)                       # 4-byte Folded Spill\n" +
                    "\tmv\ts0, a2\n" +
                    "\tmv\ts2, a1\n" +
                    "\tmv\ts1, a0\n" +
                    "\tsw\ta7, 44(sp)\n" +
                    "\tsw\ta6, 40(sp)\n" +
                    "\tsw\ta5, 36(sp)\n" +
                    "\tsw\ta4, 32(sp)\n" +
                    "\tsw\ta3, 28(sp)\n" +
                    "\tslli\ta0, a2, 2\n" +
                    "\tcall\tmalloc\n" +
                    "\tmv\ta2, a0\n" +
                    "\taddi\ta0, sp, 28\n" +
                    "\tsw\ta0, 4(sp)\n" +
                    "\tblez\ts0, .LBB23_3\n" +
                    "# %bb.1:\n" +
                    "\tlw\ta0, 4(sp)\n" +
                    "\taddi\ta0, a0, 4\n" +
                    "\tmv\ta1, a2\n" +
                    "\tmv\ta3, s0\n" +
                    ".LBB23_2:                               # =>This Inner Loop Header: Depth=1\n" +
                    "\tsw\ta0, 4(sp)\n" +
                    "\tlw\ta4, -4(a0)\n" +
                    "\tsw\ta4, 0(a1)\n" +
                    "\taddi\ta0, a0, 4\n" +
                    "\taddi\ta3, a3, -1\n" +
                    "\taddi\ta1, a1, 4\n" +
                    "\tbnez\ta3, .LBB23_2\n" +
                    ".LBB23_3:\n" +
                    "\tmv\ta0, s1\n" +
                    "\tmv\ta1, s2\n" +
                    "\tmv\ta3, s0\n" +
                    "\tcall\t__array.alloca_inside\n" +
                    "\tlw\tra, 20(sp)                      # 4-byte Folded Reload\n" +
                    "\tlw\ts0, 16(sp)                      # 4-byte Folded Reload\n" +
                    "\tlw\ts1, 12(sp)                      # 4-byte Folded Reload\n" +
                    "\tlw\ts2, 8(sp)                       # 4-byte Folded Reload\n" +
                    "\taddi\tsp, sp, 48\n" +
                    "\tret\n" +
                    ".Lfunc_end23:\n" +
                    "\t.size\t__array.alloca, .Lfunc_end23-__array.alloca\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\tInt_toString                    # -- Begin function Int_toString\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\tInt_toString,@function\n" +
                    "Int_toString:                           # @Int_toString\n" +
                    "# %bb.0:\n" +
                    "\taddi\tsp, sp, -16\n" +
                    "\tsw\tra, 12(sp)                      # 4-byte Folded Spill\n" +
                    "\tsw\ts0, 8(sp)                       # 4-byte Folded Spill\n" +
                    "\tsw\ts1, 4(sp)                       # 4-byte Folded Spill\n" +
                    "\tmv\ts0, a0\n" +
                    "\tli\ta0, 10\n" +
                    "\tcall\tmalloc\n" +
                    "\tmv\ts1, a0\n" +
                    "\tlui\ta0, %hi(.L.str.2)\n" +
                    "\taddi\ta1, a0, %lo(.L.str.2)\n" +
                    "\tmv\ta0, s1\n" +
                    "\tmv\ta2, s0\n" +
                    "\tcall\tsprintf\n" +
                    "\tmv\ta0, s1\n" +
                    "\tlw\tra, 12(sp)                      # 4-byte Folded Reload\n" +
                    "\tlw\ts0, 8(sp)                       # 4-byte Folded Reload\n" +
                    "\tlw\ts1, 4(sp)                       # 4-byte Folded Reload\n" +
                    "\taddi\tsp, sp, 16\n" +
                    "\tret\n" +
                    ".Lfunc_end24:\n" +
                    "\t.size\tInt_toString, .Lfunc_end24-Int_toString\n" +
                    "                                        # -- End function\n" +
                    "\t.globl\tBool_toString                   # -- Begin function Bool_toString\n" +
                    "\t.p2align\t1\n" +
                    "\t.type\tBool_toString,@function\n" +
                    "Bool_toString:                          # @Bool_toString\n" +
                    "# %bb.0:\n" +
                    "\tbnez\ta0, .LBB25_2\n" +
                    "# %bb.1:\n" +
                    "\tlui\ta0, %hi(.L.str.5)\n" +
                    "\taddi\ta0, a0, %lo(.L.str.5)\n" +
                    "\tret\n" +
                    ".LBB25_2:\n" +
                    "\tlui\ta0, %hi(.L.str.4)\n" +
                    "\taddi\ta0, a0, %lo(.L.str.4)\n" +
                    "\tret\n" +
                    ".Lfunc_end25:\n" +
                    "\t.size\tBool_toString, .Lfunc_end25-Bool_toString\n" +
                    "                                        # -- End function\n" +
                    "\t.type\t.L.str,@object                  # @.str\n" +
                    "\t.section\t.rodata.str1.1,\"aMS\",@progbits,1\n" +
                    ".L.str:\n" +
                    "\t.asciz\t\"%s\"\n" +
                    "\t.size\t.L.str, 3\n" +
                    "\n" +
                    "\t.type\t.L.str.1,@object                # @.str.1\n" +
                    ".L.str.1:\n" +
                    "\t.asciz\t\"%s\\n\"\n" +
                    "\t.size\t.L.str.1, 4\n" +
                    "\n" +
                    "\t.type\t.L.str.2,@object                # @.str.2\n" +
                    ".L.str.2:\n" +
                    "\t.asciz\t\"%d\"\n" +
                    "\t.size\t.L.str.2, 3\n" +
                    "\n" +
                    "\t.type\t.L.str.3,@object                # @.str.3\n" +
                    ".L.str.3:\n" +
                    "\t.asciz\t\"%d\\n\"\n" +
                    "\t.size\t.L.str.3, 4\n" +
                    "\n" +
                    "\t.type\t.L.str.4,@object                # @.str.4\n" +
                    ".L.str.4:\n" +
                    "\t.asciz\t\"true\"\n" +
                    "\t.size\t.L.str.4, 5\n" +
                    "\n" +
                    "\t.type\t.L.str.5,@object                # @.str.5\n" +
                    ".L.str.5:\n" +
                    "\t.asciz\t\"false\"\n" +
                    "\t.size\t.L.str.5, 6\n" +
                    "\n" +
                    "\t.ident\t\"Ubuntu clang version 15.0.7\"\n" +
                    "\t.section\t\".note.GNU-stack\",\"\",@progbits\n");


//            mainFn f = new mainFn();
//            new IRBuilder(f, gScope).visit(ASTRoot);
//            // new IRPrinter(System.out).visitFn(f);
//
//            AsmFn asmF = new AsmFn();
//            new InstSelector(asmF).visitFn(f);
//            new RegAlloc(asmF).work();
//            new AsmPrinter(asmF, System.out).print();
        } catch (error er) {
            System.exit(1);
            System.err.println(er.toString());
            throw new RuntimeException();
        }
    }
}