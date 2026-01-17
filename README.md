# MxCompiler

A compiler for the Mx* programming language, implemented in Java, targeting RISC-V 32-bit assembly. See [Compiler-Design-Implementation](https://github.com/ACMClassCourses/Compiler-Design-Implementation)

## Overview

MxCompiler is a complete compiler implementation that compiles Mx* (a C/Java-like programming language) to RISC-V assembly code. The compiler implements the full compilation pipeline including lexical analysis, parsing, semantic analysis, intermediate code generation, optimization, and target code generation.

## Project Architecture

```
src/
├── Main.java                    # Compiler entry point
├── parser/                      # Lexical & Syntax Analysis
│   ├── Mx.g4                    # ANTLR4 grammar definition
│   ├── MxLexer.java            # Lexer (ANTLR4 generated)
│   ├── MxParser.java           # Parser (ANTLR4 generated)
│   └── MxVisitor.java          # Visitor interface
├── AST/                         # Abstract Syntax Tree
│   ├── ASTNode.java            # AST node base class
│   ├── Program.java            # Program node
│   ├── Def/                    # Definition nodes (class, function, variable)
│   ├── Expr/                   # Expression nodes
│   └── Stmt/                   # Statement nodes
├── Frontend/                    # Frontend Processing
│   ├── ASTBuilder.java         # Parse Tree → AST builder
│   ├── SymbolCollector.java    # Symbol collector
│   └── SemanticChecker.java    # Semantic checker
├── IR/                          # Intermediate Representation (LLVM IR style)
│   ├── IRProgram.java          # IR program
│   ├── IRBuilder.java          # AST → IR builder
│   ├── IRPrinter.java          # IR printer
│   ├── IRBlock.java            # Basic block
│   ├── definition/             # IR definitions (function, class, global variable)
│   ├── entity/                 # IR entities (variable, literal)
│   ├── instruction/            # IR instruction set
│   └── Util/                   # IR utilities
├── IROptimize/                  # IR Optimization
│   ├── IROptimizer.java        # Optimizer entry
│   ├── Mem2reg/                # Mem2Reg optimization
│   │   ├── CFGBuilder.java     # Control Flow Graph builder
│   │   ├── DomBuilder.java     # Dominator Tree builder
│   │   ├── PutPhi.java         # Phi instruction insertion
│   │   └── AllocChecker.java   # Alloca checker
│   └── RegAlloca/              # Register Allocation
│       ├── LiveAnalysis.java   # Live variable analysis
│       ├── Spill.java          # Spill handling
│       ├── Color.java          # Graph coloring register allocation
│       ├── DCE.java            # Dead Code Elimination
│       ├── CriticalEdge.java   # Critical edge handling
│       └── ColorChecker.java   # Coloring checker
├── ASM/                         # Assembly Code Generation
│   ├── ASMProgram.java         # Assembly program
│   ├── ASMBuilder.java         # Basic assembly builder
│   ├── ASMBuilderPlus.java     # Optimized assembly builder
│   ├── ASMPrinter.java         # Assembly printer
│   ├── instr/                  # RISC-V instructions
│   └── section/                # Assembly sections (.text, .data, .rodata)
└── Util/                        # Utilities
    ├── Scope.java              # Scope management
    ├── type/                   # Type system
    ├── infor/                  # Symbol information
    └── error/                  # Error handling
```

## Compilation Pipeline

### 1. Frontend

#### 1.1 Lexical Analysis & Parsing
- Uses **ANTLR4** to generate lexer and parser
- Grammar definition file: [`parser/Mx.g4`](src/parser/Mx.g4)
- Supported syntax: class definitions, function definitions, variable definitions, control flow statements, expressions, etc.

#### 1.2 AST Construction
- [`ASTBuilder`](src/Frontend/ASTBuilder.java): Converts Parse Tree to Abstract Syntax Tree
- AST node types:
  - Definition nodes: class, function, variable, constructor
  - Statement nodes: if, for, while, return, break, continue, etc.
  - Expression nodes: binary operations, unary operations, function calls, member access, etc.

#### 1.3 Semantic Analysis
- [`SymbolCollector`](src/Frontend/SymbolCollector.java): Collects symbol information for classes and functions
- [`SemanticChecker`](src/Frontend/SemanticChecker.java): Performs semantic checks
  - Type checking
  - Scope checking
  - Function call validation
  - Class member access validation

### 2. Intermediate Code Generation

#### 2.1 LLVM IR Style Intermediate Representation
- [`IRBuilder`](src/IR/IRBuilder.java): Converts AST to IR
- Supported IR instructions:
  - Memory operations: `alloca`, `load`, `store`
  - Arithmetic operations: `add`, `sub`, `mul`, `sdiv`, `srem`
  - Bitwise operations: `and`, `or`, `xor`, `shl`, `ashr`
  - Comparison operations: `icmp`
  - Control flow: `br`, `jump`, `ret`
  - Function call: `call`
  - Others: `phi`, `getelementptr`

### 3. Optimization

#### 3.1 Mem2Reg Optimization
- **CFGBuilder**: Builds control flow graph between basic blocks
- **DomBuilder**: Computes dominance relationships and dominance frontiers
- **PutPhi**: Inserts Phi instructions at dominance frontiers
- Converts memory operations to SSA form

#### 3.2 Register Allocation
- **LiveAnalysis**: Computes live intervals for variables
- **Color**: Graph coloring register allocation algorithm
- **Spill**: Handles register spilling to stack
- **DCE**: Dead Code Elimination
- **CriticalEdge**: Critical edge splitting

### 4. Code Generation

#### 4.1 RISC-V 32-bit Assembly Generation
- [`ASMBuilderPlus`](src/ASM/ASMBuilderPlus.java): Optimized assembly builder
- Supported RISC-V instructions:
  - Arithmetic: `add`, `sub`, `mul`, `div`, `rem`
  - Immediate: `addi`, `andi`, `ori`, `xori`
  - Branch: `beq`, `bne`, `blt`, `bge`
  - Jump: `j`, `jal`, `jalr`
  - Memory: `lw`, `sw`
  - Pseudo: `li`, `la`, `mv`

#### 4.2 Phi Instruction Elimination
- Implements parallel copy decomposition algorithm for Phi elimination
- Handles cyclic copy sequences correctly

## Mx* Language Features

- **Primitive types**: `int`, `bool`, `string`, `void`
- **Arrays**: Multi-dimensional array support
- **Classes**: Class definitions, member variables, member functions, constructors
- **Control flow**: `if-else`, `for`, `while`, `break`, `continue`, `return`
- **Operators**: Arithmetic, comparison, logical, bitwise operators
- **Format strings**: `f"..."` syntax
- **Built-in functions**: `print`, `println`, `getInt`, `getString`, `toString`, etc.

## Build & Run

### Prerequisites
- Java 17+
- ANTLR 4.13.2

### Build
```bash
# Compile the project
make build

# Or using local ANTLR
make compile
```

### Run
```bash
# Run compiler (reads from stdin, outputs RISC-V assembly)
make run
```

### Test
```bash
# Run all tests in src directory
cd src && python3 test.py

# Run single test
cd src && python3 test_single.py
```

## Directory Structure

| Directory/File | Description |
|----------------|-------------|
| `parser/` | ANTLR4 generated lexer/parser |
| `AST/` | Abstract Syntax Tree node definitions |
| `Frontend/` | Frontend processing (AST building, semantic analysis) |
| `IR/` | LLVM IR style intermediate representation |
| `IROptimize/` | IR level optimizations |
| `ASM/` | RISC-V assembly generation |
| `Util/` | Common utility classes |

## Technical Highlights

1. **Complete Compilation Pipeline**: Full implementation from source code to target code
2. **SSA Form**: Implements Static Single Assignment form via Mem2Reg optimization
3. **Graph Coloring Register Allocation**: Efficient register allocation algorithm
4. **Phi Instruction Elimination**: Correctly handles parallel copies and cyclic dependencies
5. **Multiple Optimizations**: Dead code elimination, critical edge splitting, etc.

## Built-in Functions

The compiler provides the following built-in functions (implemented via `builtin.s`):

| Function | Description |
|----------|-------------|
| `void print(string str)` | Print string |
| `void println(string str)` | Print string with newline |
| `void printInt(int n)` | Print integer |
| `void printlnInt(int n)` | Print integer with newline |
| `int getInt()` | Read integer |
| `string getString()` | Read string |
| `string toString(int i)` | Convert integer to string |
| `int string.length()` | Get string length |
| `string string.substring(int l, int r)` | Get substring |
| `int string.parseInt()` | Parse string to integer |
| `int string.ord(int pos)` | Get ASCII code at position |

