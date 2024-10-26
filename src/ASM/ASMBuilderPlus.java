package ASM;

import ASM.instr.ASMArithImmInstr;
import ASM.instr.ASMLiInstr;
import ASM.instr.ASMSwInstr;
import ASM.section.ASMData;
import ASM.section.ASMRodata;
import ASM.section.ASMText;
import ASM.instr.*;
import IR.IRBlock;
import IR.IRProgram;
import IR.IRVisitor;
import IR.definition.IRClassDef;
import IR.definition.IRFuncDef;
import IR.definition.IRGlobalVariDef;
import IR.definition.IRStatement;
import IR.entity.*;
import IR.instruction.*;
import IROptimize.RegAlloca.Utils.Node;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

public class ASMBuilderPlus implements IRVisitor {

    // 优化1：去掉 mv a a
    // 优化2：call之前不存储临时寄存器
    // 优化3：stackSize中 reg只统计用到的
    // 优化4：将 add等指令改成 addi
    // 优化5：去掉函数调用时保存的t0-t2
    // 优化6：getElementPtr指令：只有两种情况，改成

    public IRProgram irProgram = null;
    public ASMProgram asmProgram = new ASMProgram();
    public ASMText currentText = null;

    public IRFuncDef currentFunc;
    public HashMap<IRBlock, HashMap<Node, ArrayList<Node>>> graphs = new HashMap<>();
    private final HashSet<ArrayList<Node>> allCycles = new HashSet<>();

    public ASMBuilderPlus(IRProgram irProgram) {
        this.irProgram = irProgram;
    }

    public void phi_eliminator(IRBlock block){
        graphs.clear();
        buildGraph(block.phiInsts);
        for(var entry : graphs.entrySet()){
            allCycles.clear();
            findCycles(entry.getKey(), entry.getValue());
            cycle_transfer_node(entry.getKey());
        }
    }

    public Node getNode(IREntity entity){
        Node node = new Node();
        if(isInt(entity)){
            node.setNum(getInt(entity));
        } else if(isReg(entity)){
            node.setReg(getVarReg(entity.toString()));
        } else if(inStack(entity)){
            int place = currentFunc.getPlace(entity.toString());
            node.setSp(place);
        } else if(isGlobal(entity)){
            node.setGlobal(entity.toString());
        } else if(entity.toString().equals("null")){
            node.setNum(0);
//            throw new RuntimeException("getNode: entity is not reg or stack");
        } else {
            throw new RuntimeException("getNode: entity is not reg or stack");
        }
        return node;
    }

    public boolean graphContainsKey(HashMap<Node, ArrayList<Node>> graph, Node node){
        for(Node key : graph.keySet()){
            if(key.judgeEqual(node)) return true;
        }
        return false;
    }

    public ArrayList<Node> takeOut(HashMap<Node, ArrayList<Node>> graph, Node node){
        for(Node key : graph.keySet()){
            if(key.judgeEqual(node)) return graph.get(key);
        }
        return null;
    }

    public boolean graphContainsValue(HashMap<Node, ArrayList<Node>> graph, Node key, Node value){
        for(Node tmp : graph.get(key)){
            if(tmp.judgeEqual(value)) return true;
        }
        return false;
    }

    public void graphValueRemove(HashMap<Node, ArrayList<Node>> graph, Node key, Node value){
        // 入边肯定只有一条，所以删掉直接 return
        ArrayList<Node> list = takeOut(graph, key);
        for(Node tmp : list){
            if(tmp.judgeEqual(value)){
                list.remove(tmp);
                return;
            }
        }
    }

    public void graphKeyRemove(HashMap<Node, ArrayList<Node>> graph, Node key){
        for(Node tmp : graph.keySet()){
            if(tmp.judgeEqual(key)){
                graph.remove(tmp);
                return;
            }
        }
    }

    public void buildGraph(HashMap<String, PhiInstr> phiInsts){
        for (String tmp : phiInsts.keySet()) {
            PhiInstr phiInstr = phiInsts.get(tmp);
            Node key = getNode(phiInstr.result);
            for(int i = 0; i < phiInstr.blocks.size(); ++i){
                IRBlock block = phiInstr.blocks.get(i);
                Node value = getNode(phiInstr.values.get(i));
                if(!graphs.containsKey(block)){
                    graphs.put(block, new HashMap<>());
                }
                HashMap<Node, ArrayList<Node>> graph = graphs.get(block);
                if(!graphContainsKey(graph, key)){
                    graph.put(key, new ArrayList<>());
                }
//                if(value.toString().equals("null")){
//                    System.out.println("debug");
//                }
                if(!graphContainsKey(graph, value)){
                    graph.put(value, new ArrayList<>());
                }
                if(!key.judgeEqual(value)){
                    takeOut(graph, value).add(key);
                }
            }
        }
    }

    public void findCycles(IRBlock targetBlock, HashMap<Node, ArrayList<Node>> graph){
        // 先对出度为0的点消除，然后剩下的图就全是环了
        while(true){
            ArrayList<Node> removeList = findEmpty(graph);
            if(removeList.isEmpty()) break;
            // 在删掉这个节点以及边之前，先对该指令进行asm的翻译
            // 然后将指向key的边删掉（指向指的是result为key）
            for(Node key : removeList){
                for(Node src : graph.keySet()){
                    if(graphContainsValue(graph, src, key)){
                        transferNode(targetBlock, src, key);
                        graphValueRemove(graph, src, key);
                    }
                }
            }
            // 将key这个节点删掉，这个节点出度为0
            for(Node key : removeList){
                graph.remove(key);
            }
        }
        // 现在整个graph里面全是环
        allCycles.clear();
        while(!graph.isEmpty()){
            Map.Entry<Node, ArrayList<Node>> firstEntry = graph.entrySet().iterator().next();
            ArrayList<Node> path = new ArrayList<>();
            Node currentNode = firstEntry.getKey();
            Node nextNode;
            path.add(firstEntry.getKey());
            while(true){
                nextNode = takeOut(graph, currentNode).getFirst();
                if(firstEntry.getKey().judgeEqual(nextNode)) break;
                path.add(nextNode);
                currentNode = nextNode;
            }
            for(Node key : path) graphKeyRemove(graph, key);
            allCycles.add(path);
        }
    }

    public void transferNode(IRBlock targetBlock, Node src, Node dest){
        // src: reg sp num global
        // dest: reg sp
        ASMText asmText = irProgram.blockTextMap.get(targetBlock);
        if(src.isNumNode()){
            int value = src.getNodeNum();
            if(dest.isRegNode()){
                asmText.addBeforeEnd(new ASMLiInstr(asmText, dest.getNodeReg(), value));
            } else if (dest.isSpNode()){
                asmText.addBeforeEnd(new ASMLiInstr(asmText, "t2", value));
                asmText.addBeforeEnd(new ASMSwInstr(currentText,"t2", "sp", dest.getNodeSp()));
            } else {
                throw new RuntimeException("transferNode: dest is not reg or stack");
            }
        } else if(src.isRegNode()){
            String srcReg = src.getNodeReg();
            if(dest.isRegNode()){
                asmText.addBeforeEnd(new ASMMvInstr(asmText, dest.getNodeReg(), srcReg));
            } else if (dest.isSpNode()){
                asmText.addBeforeEnd(new ASMMvInstr(asmText, "t2", srcReg));
                asmText.addBeforeEnd(new ASMSwInstr(currentText,"t2", "sp", dest.getNodeSp()));
            } else {
                throw new RuntimeException("transferNode: dest is not reg or stack");
            }
        } else if(src.isSpNode()){
            int srcPlace = src.getNodeSp();
            asmText.addBeforeEnd(new ASMLwInstr(asmText, "t0", "sp", srcPlace));
            if(dest.isRegNode()){
                asmText.addBeforeEnd(new ASMMvInstr(asmText, dest.getNodeReg(), "t0"));
            } else if (dest.isSpNode()){
                asmText.addBeforeEnd(new ASMSwInstr(currentText,"t0", "sp", dest.getNodeSp()));
            } else {
                throw new RuntimeException("transferNode: dest is not reg or stack");
            }
        } else if(src.isGlobalNode()){
            if(dest.isRegNode()){
                asmText.addBeforeEnd(new ASMLaInstr(asmText, dest.getNodeReg(), src.getNodeGlobal()));
            } else if (dest.isSpNode()){
                int resultPlace = currentFunc.getPlace(dest.getNodeGlobal());
                asmText.addBeforeEnd(new ASMLaInstr(asmText, "t0", src.getNodeGlobal()));
                asmText.addBeforeEnd(new ASMSwInstr(currentText,"t0", "sp", resultPlace));
            } else {
                throw new RuntimeException("transferNode: dest is not reg or stack");
            }
        } else {
            throw new RuntimeException("transferNode: src is not reg or stack");
        }
    }

    public void cycle_transfer_node(IRBlock targetBlock){
        // src: reg sp num global
        // key: reg
        ASMText asmText = irProgram.blockTextMap.get(targetBlock);
        for(ArrayList<Node> cycle : allCycles){
            Node headNode = cycle.getFirst();
            Node lastNode = cycle.getLast();
            Node secondNode = cycle.get(1);
            // head -> t6
            // last -> head
            Node t6Node = new Node().setReg("t6");
            transferNode(targetBlock, headNode, t6Node);
            transferNode(targetBlock, lastNode, headNode);
            for(int i = cycle.size() - 1; i >= 2; --i){
                transferNode(targetBlock, cycle.get(i - 1), cycle.get(i));
            }
            // t6 -> second
            transferNode(targetBlock, t6Node, secondNode);
        }
    }

    public ArrayList<Node> findEmpty(HashMap<Node, ArrayList<Node>> graph){
        ArrayList<Node> res = new ArrayList<>();
        for(Node key : graph.keySet()){
            if(graph.get(key).isEmpty()){
                res.add(key);
            }
        }
        return res;
    }

    @Override public void visit(IRProgram irProgram){
        for(IRGlobalVariDef irGlobal : irProgram.globalVarDefMap.values()) {
            irGlobal.accept(this);
        }
        for(IRClassDef irClass : irProgram.classDefMap.values()) {
            irClass.accept(this);
        }
        for(IRFuncDef irFunction : irProgram.funcDefMap.values()) {
            currentFunc = irFunction;
            irFunction.accept(this);
        }
    }

    @Override public void visit(IRClassDef irClassDef){}

    @Override public void visit(IRFuncDef irFuncDef){
        int stackSize = getStackSize(irFuncDef);

        irFuncDef.stackSize = stackSize;
        int paraSize = irFuncDef.parameterNameList.size();
//        for(int i = 0; i < paraSize; ++i) {
//            if(i >= 8){
//                irFuncDef.offsetMap.put(irFuncDef.parameterNameList.get(i), stackSize + 4 * (i - 8));
//            } else {
//                irFuncDef.paraMap.put(irFuncDef.parameterNameList.get(i), "a" + i);
//            }
//        }
        ASMText startText = new ASMText(irFuncDef.functionName);
        asmProgram.TextList.add(startText);

        // 错误：这里统计一定要在block之前，因为可能先扫到后面的block，然后phi指令会出错
        for(IRBlock irBlock : irFuncDef.blockList){
            ASMText newText = new ASMText(irBlock.parent.functionName + "_" + irBlock.name);
            asmProgram.TextList.add(newText);
            irProgram.blockTextMap.put(irBlock, newText);
        }

        irFuncDef.blockList.forEach(block -> block.accept(this));

        // addi越界的问题
        if(stackSize <= 2000){
            startText.instrList.add(new ASMArithImmInstr(currentText, "sp", "sp", "+", -stackSize - 12));
        } else {
            startText.instrList.add(new ASMLiInstr(currentText, "t0", -stackSize - 12));
            startText.instrList.add(new ASMArithInstr(currentText, "t0", "sp", "sp", "+"));
        }
//        startText.instrList.add(new ASMSwInstr(currentText, "t0", "sp", stackSize));
//        startText.instrList.add(new ASMSwInstr(currentText, "t1", "sp", stackSize + 4));
//        startText.instrList.add(new ASMSwInstr(currentText, "t2", "sp", stackSize + 8));

//        if(irFuncDef.functionName.equals("vector..init")){
//                System.out.println("debug");
//        }
        // 函数参数的载入
        // a0-a7 -> var(reg、stack)
        // 假设var全是局部变量（猜测）
        if(paraSize > 8) paraSize = 8;
        for(int i = 0; i < paraSize; ++i){
            String var = irFuncDef.parameterNameList.get(i);
            String register = "a" + i;
            if(irFuncDef.regMap.containsKey(var)){
                startText.instrList.add(new ASMMvInstr(currentText, getVarReg(var), register));
            } else if(irFuncDef.nameMap.containsKey(var)){
                int place = irFuncDef.getPlace(var);
                startText.instrList.add(new ASMSwInstr(currentText, register, "sp", place));
            } else {
                // doNothing
                // 函数参数在函数中没有被用到
            }
        }

//        if(stackSize % 16 != 0){
//            stackSize = (stackSize / 16 + 1) * 16;
//        }
    }

    @Override public void visit(IRBlock irBlock) {
        currentText = irProgram.blockTextMap.get(irBlock);

//        if(irBlock.name.equals("land.end..0")){
//            System.out.println("debug");
//        }
        phi_eliminator(irBlock);

        irBlock.instructions.forEach(instruction -> instruction.accept(this));
    }

    @Override public void visit(IRGlobalVariDef irGlobalVariDef){
        if(irGlobalVariDef.varName.startsWith("@.str")){
            String myString = irGlobalVariDef.result.toString();
            ASMRodata rodata = new ASMRodata(irGlobalVariDef.varName, myString);
            asmProgram.RodataList.add(rodata);
        } else if(irGlobalVariDef.irType.isPtr() && irGlobalVariDef.result.toString().equals("")){
            ASMData data = new ASMData(irGlobalVariDef.varName, 0);
            asmProgram.DataList.add(data);
        } else {
            String result = irGlobalVariDef.result.toString();
            if(result.equals("null")){
                asmProgram.DataList.add(new ASMData(irGlobalVariDef.varName, 0));
            } else if(result.equals("false")){
                asmProgram.DataList.add(new ASMData(irGlobalVariDef.varName, 0));
            } else if(result.equals("true")){
                asmProgram.DataList.add(new ASMData(irGlobalVariDef.varName, 1));
            } else {
                asmProgram.DataList.add(new ASMData(irGlobalVariDef.varName, Integer.parseInt(result)));
            }
        }
    }

    @Override public void visit(IRStatement irStatement){
        irStatement.accept(this);
    }

    @Override public void visit(AllocInstr allocInstr){
        throw new RuntimeException("AllocInstr should not appear in IRFuncDef");
    }

    @Override public void visit(BinaryInstr binaryInstr){
        currentText.instrList.add(new ASMComment(currentText, binaryInstr));
        String r2 = getVarReg(binaryInstr.result.toString());
        boolean lhsIsInt = isInt(binaryInstr.lhs);
        boolean rhsIsInt = isInt(binaryInstr.rhs);
        String op = binaryInstr.op;
        if(!lhsIsInt && rhsIsInt){
            if(op.equals("+") || op.equals("&") || op.equals("|") || op.equals("^") || op.equals("<<") || op.equals(">>")){
                int imm = getInt(binaryInstr.rhs);
                if(imm < 2040 && imm > -2040){
                    String r0 = loadIREntity(binaryInstr.lhs, "t0", binaryInstr.parent.parent);
                    if(r2 == null){
                        int resultPlace = binaryInstr.parent.parent.getPlace(binaryInstr.result.toString());
                        currentText.instrList.add(new ASMArithImmInstr(currentText, "t2", r0, binaryInstr.op, imm));
                        currentText.instrList.add(new ASMSwInstr(currentText,"t2", "sp", resultPlace));
                    } else {
                        currentText.instrList.add(new ASMArithImmInstr(currentText, r2, r0, binaryInstr.op, imm));
                    }
                    return;
                }
            }
            if(op.equals("-")){
                int imm = getInt(binaryInstr.rhs);
                if(imm > -2040 && imm < 2040){
                    String r0 = loadIREntity(binaryInstr.lhs, "t0", binaryInstr.parent.parent);
                    if(r2 == null){
                        int resultPlace = binaryInstr.parent.parent.getPlace(binaryInstr.result.toString());
                        currentText.instrList.add(new ASMArithImmInstr(currentText, "t2", r0, "+", -imm));
                        currentText.instrList.add(new ASMSwInstr(currentText,"t2", "sp", resultPlace));
                    } else {
                        currentText.instrList.add(new ASMArithImmInstr(currentText, r2, r0, "+", -imm));
                    }
                    return;
                }
            }
        } else if (lhsIsInt && !rhsIsInt){
            if(op.equals("+") || op.equals("&") || op.equals("|") || op.equals("^")){
                int imm = getInt(binaryInstr.lhs);
                if(imm < 2040 && imm > -2040){
                    String r1 = loadIREntity(binaryInstr.rhs, "t1", binaryInstr.parent.parent);
                    if(r2 == null){
                        int resultPlace = binaryInstr.parent.parent.getPlace(binaryInstr.result.toString());
                        currentText.instrList.add(new ASMArithImmInstr(currentText, "t2", r1, binaryInstr.op, imm));
                        currentText.instrList.add(new ASMSwInstr(currentText,"t2", "sp", resultPlace));
                    } else {
                        currentText.instrList.add(new ASMArithImmInstr(currentText, r2, r1, binaryInstr.op, imm));
                    }
                    return;
                }
            }
        } else if(lhsIsInt && rhsIsInt){
            int imm0 = getInt(binaryInstr.lhs);
            int imm1 = getInt(binaryInstr.rhs);
            int result;
            switch (binaryInstr.op){
                case "+" -> result = imm0 + imm1;
                case "-" -> result = imm0 - imm1;
                case "*" -> result = imm0 * imm1;
                case "/" -> {
                    if(imm1 == 0) result = 0; // 这段代码肯定到不了
                    else result = imm0 / imm1;
                }
                case "%" -> result = imm0 % imm1;
                case "<<" -> result = imm0 << imm1;
                case ">>" -> result = imm0 >> imm1;
                case "&" -> result = imm0 & imm1;
                case "|" -> result = imm0 | imm1;
                case "^" -> result = imm0 ^ imm1;
                default -> throw new RuntimeException("BinaryInstr: op is not valid");
            }
            if(r2 == null){
                int resultPlace = binaryInstr.parent.parent.getPlace(binaryInstr.result.toString());
                currentText.instrList.add(new ASMLiInstr(currentText, "t2", result));
                currentText.instrList.add(new ASMSwInstr(currentText,"t2", "sp", resultPlace));
            } else {
                currentText.instrList.add(new ASMLiInstr(currentText, r2, result));
            }
            return;
        }
        String r0 = loadIREntity(binaryInstr.lhs, "t0", binaryInstr.parent.parent);
        String r1 = loadIREntity(binaryInstr.rhs, "t1", binaryInstr.parent.parent);
        if(r2 == null) {
            int resultPlace = binaryInstr.parent.parent.getPlace(binaryInstr.result.toString());
            currentText.instrList.add(new ASMArithInstr(currentText, r0, r1, "t2", binaryInstr.op));
            currentText.instrList.add(new ASMSwInstr(currentText,"t2", "sp", resultPlace));
        } else {
            currentText.instrList.add(new ASMArithInstr(currentText, r0, r1, r2, binaryInstr.op));
        }
    }

    @Override public void visit(BrInstr brInstr){
        currentText.instrList.add(new ASMComment(currentText, brInstr));
        String r0 = getVarReg(brInstr.op.toString());
        if(r0 == null){
            int place = brInstr.parent.parent.getPlace(brInstr.op.toString());
            currentText.instrList.add(new ASMLwInstr(currentText, "t0", "sp", place));
            currentText.instrList.add(new ASMBranchInstr(currentText, "!=", "t0", "x0", ".+8"));
        } else {
            currentText.instrList.add(new ASMBranchInstr(currentText, "!=", r0, "x0", ".+8"));
        }
        currentText.instrList.add(new ASMJInstr(currentText, brInstr.parent.parent.functionName + "_" + brInstr.rhs.name));
        currentText.instrList.add(new ASMJInstr(currentText, brInstr.parent.parent.functionName + "_" + brInstr.lhs.name));
    }

    public void callRegStore(CallInstr callInstr, int num, HashSet<String> regList){
        if(num > 8) num = 8;
        IRBlock block = callInstr.parent;
//        for(int i = 0; i < num; ++i){
//            int place = block.parent.getPlace("a" + i);
//            currentText.instrList.add(new ASMSwInstr(currentText, "a" + i, "sp", place));
//        }
//        currentText.instrList.add(new ASMSwInstr(currentText, "t0", "sp", block.parent.getPlace("t0")));
//        currentText.instrList.add(new ASMSwInstr(currentText, "t1", "sp", block.parent.getPlace("t1")));
//        currentText.instrList.add(new ASMSwInstr(currentText, "t2", "sp", block.parent.getPlace("t2")));
//        currentText.instrList.add(new ASMSwInstr(currentText, "t3", "sp", block.parent.getPlace("t3")));
//        currentText.instrList.add(new ASMSwInstr(currentText, "t6", "sp", block.parent.getPlace("t6")));
        for(String reg : regList){
            currentText.instrList.add(new ASMSwInstr(currentText, reg, "sp", block.parent.getPlace(reg)));
        }
    }

    public void callRegLoad(CallInstr callInstr, int num, HashSet<String> regList){
        if(num > 8) num = 8;
        IRBlock block = callInstr.parent;
//        for(int i = 0; i < num; ++i){
//            int place = block.parent.getPlace("a" + i);
//            currentText.instrList.add(new ASMLwInstr(currentText, "a" + i, "sp", place));
//        }
//        currentText.instrList.add(new ASMLwInstr(currentText, "t0", "sp", block.parent.getPlace("t0")));
//        currentText.instrList.add(new ASMLwInstr(currentText, "t1", "sp", block.parent.getPlace("t1")));
//        currentText.instrList.add(new ASMLwInstr(currentText, "t2", "sp", block.parent.getPlace("t2")));
//        currentText.instrList.add(new ASMLwInstr(currentText, "t3", "sp", block.parent.getPlace("t3")));
//        currentText.instrList.add(new ASMLwInstr(currentText, "t6", "sp", block.parent.getPlace("t6")));
        for(String reg : regList){
            currentText.instrList.add(new ASMLwInstr(currentText, reg, "sp", block.parent.getPlace(reg)));
        }
    }

    public void callRegAlloc(CallInstr callInstr){
        HashMap<Node, ArrayList<Node>> graph = buildCallGraph(callInstr);
        allCycles.clear();
        findCallCycles(callInstr, graph);
        cycle_elimination();
    }

    public HashMap<Node, ArrayList<Node>> buildCallGraph(CallInstr callInstr){

//        if(callInstr.funcName.equals("print") && callInstr.args.getFirst().toString().equals("@.str..0")){
//            System.out.println("debug");
//        }

        HashMap<Node, ArrayList<Node>> graph = new HashMap<>();
        int num = callInstr.args.size();
        if(num > 8) num = 8;
        // arg: reg sp num global
        // dest: a0-a7
        // arg -> register
        for(int i = 0; i < num; ++i){
            Node arg = getNode(callInstr.args.get(i));
            Node register = new Node().setReg("a" + i);
            if(!graphContainsKey(graph, register)){
                graph.put(register, new ArrayList<>());
            }
            if(!graphContainsKey(graph, arg)){
                graph.put(arg, new ArrayList<>());
            }
            if(!arg.judgeEqual(register)){
                takeOut(graph, arg).add(register);
            }
        }
        return graph;
    }

    // 已知register是一个寄存器，判断graph、List里面有没有
    // 错误：不能用contain来判断是否在里面，因为只有同一个对象才能判定相等，而这里只是名字相同而已

    public void findCallCycles(CallInstr callInstr, HashMap<Node, ArrayList<Node>> graph){
        // 先对出度为0的点消除，然后剩下的图就全是环了
        if(callInstr.funcName.equals("print") && callInstr.args.getFirst().toString().equals("@.str..0")){
//            System.out.println("debug");
        }
        while(true){
            ArrayList<Node> removeList = findEmpty(graph);
            if(removeList.isEmpty()) break;
            // 在删掉这个节点以及边之前，先对该指令进行asm的翻译
            // 然后将指向key的边删掉（指向指的是result为key）
            for(Node key : removeList){
                for(Node src : graph.keySet()){
                    if(graphContainsValue(graph, src, key)){
                        naive_elimination(src, key);
                        graphValueRemove(graph, src, key);
                    }
                }
            }
            // 将key这个节点删掉，这个节点出度为0
            for(Node key : removeList){
                graph.remove(key);
            }
        }
        // 现在整个graph里面全是环
        allCycles.clear();
        while(!graph.isEmpty()){
            Map.Entry<Node, ArrayList<Node>> firstEntry = graph.entrySet().iterator().next();
            ArrayList<Node> path = new ArrayList<>();
            Node currentNode = firstEntry.getKey();
            Node nextNode;
            path.add(firstEntry.getKey());
            while(true){
                nextNode = takeOut(graph, currentNode).getFirst();
                if(firstEntry.getKey().judgeEqual(nextNode)) break;
                path.add(nextNode);
                currentNode = nextNode;
            }
            for(Node key : path) graphKeyRemove(graph, key);
            allCycles.add(path);
        }
    }

    public void naive_elimination(Node src, Node dest){
        // src: reg sp num global
        // dest: reg sp
        if(src.isNumNode()){
            int value = src.getNodeNum();
            if(dest.isRegNode()){
                currentText.instrList.add(new ASMLiInstr(currentText, dest.getNodeReg(), value));
            } else if (dest.isSpNode()){
                currentText.instrList.add(new ASMLiInstr(currentText, "t2", value));
                currentText.instrList.add(new ASMSwInstr(currentText,"t2", "sp", dest.getNodeSp()));
            } else {
                throw new RuntimeException("transferNode: dest is not reg or stack");
            }
        } else if(src.isRegNode()){
            String srcReg = src.getNodeReg();
            if(dest.isRegNode()){
                currentText.instrList.add(new ASMMvInstr(currentText, dest.getNodeReg(), srcReg));
            } else if (dest.isSpNode()){
                currentText.instrList.add(new ASMMvInstr(currentText, "t2", srcReg));
                currentText.instrList.add(new ASMSwInstr(currentText,"t2", "sp", dest.getNodeSp()));
            } else {
                throw new RuntimeException("transferNode: dest is not reg or stack");
            }
        } else if(src.isSpNode()){
            int srcPlace = src.getNodeSp();
            currentText.instrList.add(new ASMLwInstr(currentText, "t0", "sp", srcPlace));
            if(dest.isRegNode()){
                currentText.instrList.add(new ASMMvInstr(currentText, dest.getNodeReg(), "t0"));
            } else if (dest.isSpNode()){
                currentText.instrList.add(new ASMSwInstr(currentText,"t0", "sp", dest.getNodeSp()));
            } else {
                throw new RuntimeException("transferNode: dest is not reg or stack");
            }
        } else if(src.isGlobalNode()){
            if(dest.isRegNode()){
                currentText.instrList.add(new ASMLaInstr(currentText, dest.getNodeReg(), src.getNodeGlobal()));
            } else if (dest.isSpNode()){
                int resultPlace = currentFunc.getPlace(dest.getNodeGlobal());
                currentText.instrList.add(new ASMLaInstr(currentText, "t0", src.getNodeGlobal()));
                currentText.instrList.add(new ASMSwInstr(currentText,"t0", "sp", resultPlace));
            } else {
                throw new RuntimeException("transferNode: dest is not reg or stack");
            }
        } else {
            throw new RuntimeException("transferNode: src is not reg or stack");
        }
    }

    public void cycle_elimination(){
        // src: reg sp num global
        // key: reg
        for(ArrayList<Node> cycle : allCycles){
            Node headNode = cycle.getFirst();
            Node lastNode = cycle.getLast();
            Node secondNode = cycle.get(1);
            // head -> t6
            // last -> head
            Node t6Node = new Node().setReg("t6");
            naive_elimination(headNode, t6Node);
            naive_elimination(lastNode, headNode);
            for(int i = cycle.size() - 1; i >= 2; --i){
                naive_elimination(cycle.get(i - 1), cycle.get(i));
            }
            // t6 -> second
            naive_elimination(t6Node, secondNode);
        }
    }

    @Override public void visit(CallInstr callInstr){
        currentText.instrList.add(new ASMComment(currentText, callInstr));

        currentText.instrList.add(new ASMSwInstr(currentText, "ra", "sp", callInstr.parent.parent.stackSize - 4));

        // 将function的 liveOut-def中用到的寄存器存下来
        HashSet<String> varList = callInstr.liveOut_;
        HashSet<String> regList = new HashSet<>();
        HashSet<String> removeList = new HashSet<>();
        if(callInstr.getDef() != null){
            String def = callInstr.getDef().toString();
            for(String var : varList){
                if(var.equals(def)){
                    removeList.add(var);
                }
            }
        }
        varList.removeAll(removeList);
        for(String var : varList){
            String reg = getVarReg(var);
            if(reg != null){
                regList.add(reg);
            }
        }

        // 错误：不能存储 a0-a7！
        // 存储 t0-t3, t6, 以及用到的变量
        callRegStore(callInstr, callInstr.args.size(), regList);

        // 寄存器重分配
        // 将前面的8个变量赋给a0-a7，可能有覆盖问题，必须同时赋值，所以处理与phiInstr一样
        callRegAlloc(callInstr);

        if(callInstr.args.size() > 8){
            int size = (callInstr.args.size() - 8) * 4;
            for(int i = 8; i < callInstr.args.size(); ++i){
                int offSet = -size + 4 * (i - 8);
                String r0 = loadIREntity(callInstr.args.get(i), "t0", callInstr.parent.parent);
                currentText.instrList.add(new ASMSwInstr(currentText, r0, "sp", offSet));
            }
            currentText.instrList.add(new ASMArithImmInstr(currentText, "sp", "sp", "+", -size));
            currentText.instrList.add(new ASMCallInstr(currentText, callInstr.funcName));
            currentText.instrList.add(new ASMArithImmInstr(currentText, "sp", "sp", "+", size));
        } else {
            currentText.instrList.add(new ASMCallInstr(currentText, callInstr.funcName));
        }

        currentText.instrList.add(new ASMLwInstr(currentText, "ra", "sp", callInstr.parent.parent.stackSize - 4));
        // a0 -> result
        if(isReg(callInstr.result)){
            currentText.instrList.add(new ASMMvInstr(currentText, getVarReg(callInstr.result.toString()), "a0"));
        } else {
            currentText.instrList.add(new ASMSwInstr(currentText, "a0", "sp", callInstr.parent.parent.getPlace(callInstr.result.toString())));
        }

        // 恢复 a0-a7, t0-t3, t6, 以及用到的变量
        callRegLoad(callInstr, callInstr.args.size(), regList);
    }

    @Override public void visit(GeteleptrInstr geteleptrInstr){
        currentText.instrList.add(new ASMComment(currentText, geteleptrInstr));
        String r2 = getVarReg(geteleptrInstr.result.toString());
        if(isInt(geteleptrInstr.idxList.getLast())){
            int imm = getInt(geteleptrInstr.idxList.getLast());
            imm = imm << 2;
            // result = ptr + imm
            if(r2 == null){
                int resultPlace = geteleptrInstr.parent.parent.getPlace(geteleptrInstr.result.toString());
                String r0 = loadIREntity(geteleptrInstr.ptrValue, "t0", geteleptrInstr.parent.parent);
                if(imm < 2040 && imm > -2040){
                    currentText.instrList.add(new ASMArithImmInstr(currentText, "t2", r0, "+", imm));
                    currentText.instrList.add(new ASMSwInstr(currentText,"t2", "sp", resultPlace));
                } else {
                    currentText.instrList.add(new ASMLiInstr(currentText, "t2", imm));
                    currentText.instrList.add(new ASMArithInstr(currentText, "t2", r0, "+", "t2"));
                    currentText.instrList.add(new ASMSwInstr(currentText,"t2", "sp", resultPlace));
                }
            } else {
                String r0 = loadIREntity(geteleptrInstr.ptrValue, "t0", geteleptrInstr.parent.parent);
                currentText.instrList.add(new ASMArithImmInstr(currentText, r2, r0, "+", imm));
            }
            return;
        }

        // 数组：只传一个参数
        // 类：肯定传两个参数，且第一个参数是0
        if(r2 != null){
            if(geteleptrInstr.idxList.size() == 1 || geteleptrInstr.idxList.size() == 2){
                String r0 = loadIREntity(geteleptrInstr.ptrValue, "t0", geteleptrInstr.parent.parent);
                String r1 = loadIREntity(geteleptrInstr.idxList.getLast(), "t1", geteleptrInstr.parent.parent);
                currentText.instrList.add(new ASMArithImmInstr(currentText, "t1", r1, "<<", 2));
                currentText.instrList.add(new ASMArithInstr(currentText, "t1", r0, r2, "+"));
            } else {
                throw new RuntimeException("geteleptrInstr: idxList.size() != 1 or 2");
            }
        } else {
            if(geteleptrInstr.idxList.size() == 1 || geteleptrInstr.idxList.size() == 2){
                String r0 = loadIREntity(geteleptrInstr.ptrValue, "t0", geteleptrInstr.parent.parent);
                String r1 = loadIREntity(geteleptrInstr.idxList.getLast(), "t1", geteleptrInstr.parent.parent);
                currentText.instrList.add(new ASMArithImmInstr(currentText, "t1", r1, "<<", 2));
                currentText.instrList.add(new ASMArithInstr(currentText, "t1", r0, "t0", "+"));
                currentText.instrList.add(new ASMSwInstr(currentText, "t0", "sp", geteleptrInstr.parent.parent.getPlace(geteleptrInstr.result.toString())));
            } else {
                throw new RuntimeException("geteleptrInstr: idxList.size() != 1 or 2");
            }
        }

//        String r0 = loadIREntity(geteleptrInstr.ptrValue, "t0", geteleptrInstr.parent.parent);
//        actual_load_entity(geteleptrInstr.ptrValue, "t0", geteleptrInstr.parent.parent);
//        actual_load_entity(geteleptrInstr.idxList.getLast(), "t1", geteleptrInstr.parent.parent);
//
//        currentText.instrList.add(new ASMLiInstr(currentText, "t2", 4));
//        currentText.instrList.add(new ASMArithInstr(currentText, "t1", "t2", "t1", "*"));
//        currentText.instrList.add(new ASMArithInstr(currentText, "t1", "t0", "t0", "+"));

        // result: reg or stack
//        if(isReg(geteleptrInstr.result)){
//            currentText.instrList.add(new ASMMvInstr(currentText, getVarReg(geteleptrInstr.result.toString()), "t0"));
//        } else {
//            currentText.instrList.add(new ASMSwInstr(currentText, "t0", "sp", geteleptrInstr.parent.parent.getPlace(geteleptrInstr.result.toString())));
//        }
    }

    @Override public void visit(IcmpInstr icmpInstr){
        currentText.instrList.add(new ASMComment(currentText, icmpInstr));
        boolean isReg = isReg(icmpInstr.result);
        String rt = isReg ? getVarReg(icmpInstr.result.toString()) : "t0";
        int resultPlace = 0;
        if(!isReg) resultPlace = icmpInstr.parent.parent.getPlace(icmpInstr.result.toString());

        if(isInt(icmpInstr.lhs) && isInt(icmpInstr.rhs)){
            int lhs = getInt(icmpInstr.lhs);
            int rhs = getInt(icmpInstr.rhs);
            boolean result;
            switch (icmpInstr.op) {
                case ">" -> result = lhs > rhs;
                case ">=" -> result = lhs >= rhs;
                case "<" -> result = lhs < rhs;
                case "<=" -> result = lhs <= rhs;
                case "==" -> result = lhs == rhs;
                case "!=" -> result = lhs != rhs;
                default -> throw new RuntimeException("invalid icmp op");
            }
            if(result){
                if(isReg) currentText.instrList.add(new ASMLiInstr(currentText, rt, 1));
                else currentText.instrList.add(new ASMLiInstr(currentText, "t0", 1));
            } else {
                if(isReg) currentText.instrList.add(new ASMLiInstr(currentText, rt, 0));
                else currentText.instrList.add(new ASMLiInstr(currentText, "t0", 0));
            }
            if(!isReg) currentText.instrList.add(new ASMSwInstr(currentText,"t0", "sp", resultPlace));
            return;
        }

        String r0 = loadIREntity(icmpInstr.lhs, "t0", icmpInstr.parent.parent);
        String r1 = loadIREntity(icmpInstr.rhs, "t1", icmpInstr.parent.parent);

        // t2 = t0 - t1, 然后t2传到 set指令里面
        // set指令：t0 <- t2
        currentText.instrList.add(new ASMArithInstr(currentText, r0, r1, "t2", "-"));
        switch (icmpInstr.op) {
            case ">", "==", "<", "!=" -> {
                currentText.instrList.add(new ASMSetInstr(currentText, icmpInstr.op, rt, "t2"));
            }
            case ">=" -> {
                currentText.instrList.add(new ASMSetInstr(currentText, ">", rt, "t2"));
                currentText.instrList.add(new ASMSetInstr(currentText, "==", "t1", "t2"));
                currentText.instrList.add(new ASMArithInstr(currentText, rt, "t1", rt, "|"));
            }
            case "<=" -> {
                currentText.instrList.add(new ASMSetInstr(currentText, "<", rt, "t2"));
                currentText.instrList.add(new ASMSetInstr(currentText, "==", "t1", "t2"));
                currentText.instrList.add(new ASMArithInstr(currentText, rt, "t1", rt, "|"));
            }
            default -> {
                throw new RuntimeException("invalid icmp op");
            }
        }
        if(!isReg) currentText.instrList.add(new ASMSwInstr(currentText,"t0", "sp", resultPlace));
    }

    @Override public void visit(JumpInstr jumpInstr){
        currentText.instrList.add(new ASMComment(currentText, jumpInstr));
        currentText.instrList.add(new ASMJInstr(currentText, jumpInstr.parent.parent.functionName + "_" + jumpInstr.target.name));
    }

    @Override public void visit(LoadInstr loadInstr){
        currentText.instrList.add(new ASMComment(currentText, loadInstr));
        String r0 = loadIREntity(loadInstr.ptr, "t0", loadInstr.parent.parent);
        if(isReg(loadInstr.result)){
            String reg = getVarReg(loadInstr.result.toString());
            currentText.instrList.add(new ASMLwInstr(currentText, reg, r0, 0));
        } else {
            int resultPlace = loadInstr.parent.parent.getPlace(loadInstr.result.toString());
            currentText.instrList.add(new ASMLwInstr(currentText, "t1", r0, 0));
            currentText.instrList.add(new ASMSwInstr(currentText, "t1", "sp", resultPlace));
        }
    }

    @Override public void visit(PhiInstr phiInstr){
        throw new RuntimeException("PhiInstr should not appear in IRFuncDef");
    }

    @Override public void visit(RetInstr retInstr){
        currentText.instrList.add(new ASMComment(currentText, retInstr));
        if(!retInstr.retType.isVoid()){
            actual_load_entity(retInstr.retValue, "a0", retInstr.parent.parent);
        }
        if(retInstr.parent.parent.stackSize < 2000){
            currentText.instrList.add(new ASMArithImmInstr(currentText, "sp", "sp", "+", retInstr.parent.parent.stackSize + 12));
        } else {
            currentText.instrList.add(new ASMLiInstr(currentText, "t3", retInstr.parent.parent.stackSize + 12));
            currentText.instrList.add(new ASMArithInstr(currentText, "t3", "sp", "sp", "+"));
        }
//        currentText.instrList.add(new ASMLwInstr(currentText, "t0", "sp", -12));
//        currentText.instrList.add(new ASMLwInstr(currentText, "t1", "sp", -8));
//        currentText.instrList.add(new ASMLwInstr(currentText, "t2", "sp", -4));
        currentText.instrList.add(new ASMRetInstr(currentText));
    }

    @Override public void visit(StoreInstr storeInstr){
        currentText.instrList.add(new ASMComment(currentText, storeInstr));

        if(storeInstr.value == null){
            System.exit(0);
        }
        String r0 = loadIREntity(storeInstr.value, "t0", storeInstr.parent.parent);
        String r1 = loadIREntity(storeInstr.ptr, "t1", storeInstr.parent.parent);
        currentText.instrList.add(new ASMSwInstr(currentText, r0, r1, 0));
    }

    // 将entity存到 rd中
    // 这个有两个目的：一个就是为了存入变量，还有一个是为了将变量读到寄存器里面
    private String loadIREntity(IREntity entity, String rd, IRFuncDef irFuncDef) {
        if(isInt(entity)){
            currentText.instrList.add(new ASMLiInstr(currentText, rd, getInt(entity)));
            return rd;
        } else if(entity instanceof IRIntLiteral){
            currentText.instrList.add(new ASMLiInstr(currentText, rd, ((IRIntLiteral) entity).value));
        } else if(entity instanceof IRBoolLiteral){
            currentText.instrList.add(new ASMLiInstr(currentText, rd, ((IRBoolLiteral) entity).value ? 1 : 0));
        } else if(isGlobalVar(entity.toString())){
            currentText.instrList.add(new ASMLaInstr(currentText, rd, entity.toString()));
        } else if(entity instanceof IROtherLiteral){
            // 只在globalvariableMap里面出现，或者literal里面出现
            if(entity.toString().equals("null")){
                currentText.instrList.add(new ASMLiInstr(currentText, rd, 0));
            } else {
                System.exit(0);
            }
        } else if(entity instanceof IRVariable){
            if(irFuncDef.regMap.containsKey(entity.toString())){
                return getReg(irFuncDef.regMap.get(entity.toString()));
            }
            int place = irFuncDef.getPlace(entity.toString());
            currentText.instrList.add(new ASMLwInstr(currentText, rd, "sp", place));
        } else {
            throw new RuntimeException("invalid entity");
        }
        return rd;
    }

    public void actual_load_entity(IREntity entity, String rd, IRFuncDef irFuncDef){
        if(entity instanceof IRVariable){
            if(isInt(entity)){
                currentText.instrList.add(new ASMLiInstr(currentText, rd, getInt(entity)));
            } else if(nameIsReg(entity)){
                currentText.instrList.add(new ASMMvInstr(currentText, rd, entity.toString()));
            } else if(isReg(entity)){
                currentText.instrList.add(new ASMMvInstr(currentText, rd, getVarReg(entity.toString())));
            } else if(inStack(entity)){
                int place = irFuncDef.getPlace(entity.toString());
                currentText.instrList.add(new ASMLwInstr(currentText, rd, "sp", place));
            } else if(isGlobal(entity)){
                currentText.instrList.add(new ASMLaInstr(currentText, rd, entity.toString()));
            } else {
                throw new RuntimeException("actual_load_entity: entity is not reg or stack");
            }
        } else {
            loadIREntity(entity, rd, irFuncDef);
        }
    }

    private boolean isGlobalVar(String name) {
        for(IRGlobalVariDef irGlobal : irProgram.globalVarDefMap.values()) {
            if(irGlobal.varName.equals(name)) return true;
        }
        return false;
    }

    private int isParaVar(String name, IRFuncDef irFuncDef) {
        for(int i = 0; i < irFuncDef.parameterNameList.size(); ++i) {
            if(irFuncDef.parameterNameList.get(i).equals(name)) return i;
        }
        return -1;
    }

    // 计算栈大小，即用了多少变量
    private int getStackSize(IRFuncDef irFuncDef){
        int stackSize = 0;
        stackSize = regStackSize(irFuncDef);
        for(int i = 0; i < irFuncDef.parameterNameList.size(); ++i){
            String var = irFuncDef.parameterNameList.get(i);
            if(i >= 8){
                irFuncDef.nameMap.put(var, stackSize);
                stackSize += 4;
            } else {
//                irFuncDef.paraMap.put(var, "a" + i);
                if(irProgram.spilledVars.contains(var)){
                    irFuncDef.nameMap.put(var, stackSize);
                    stackSize += 4;
                }
            }
        }
        for(int i = 0; i < irFuncDef.blockList.size(); ++i){
            for(PhiInstr phiInstr : irFuncDef.blockList.get(i).phiInsts.values()){
                if(!isReg(phiInstr.result) && !irFuncDef.nameMap.containsKey(phiInstr.result.toString())){
                    irFuncDef.nameMap.put(phiInstr.result.toString(), stackSize);
                    stackSize += 4;
                }
            }
            for(int j = 0; j < irFuncDef.blockList.get(i).instructions.size(); ++j){
                Instruction instruction = irFuncDef.blockList.get(i).instructions.get(j);
                if(instruction instanceof AllocInstr allocInstr){
                    // 错误：这里是allocInstr.irVariable.name，而不是allocInstr.varName
                    throw new RuntimeException("AllocInstr should not appear in IRFuncDef");
                } else if(instruction instanceof BinaryInstr binaryInstr){
                    if(!isReg(binaryInstr.result) && !irFuncDef.nameMap.containsKey(binaryInstr.result.toString())){
                        irFuncDef.nameMap.put(binaryInstr.result.toString(), stackSize);
                        stackSize += 4;
                    }
                } else if(instruction instanceof BrInstr){
                } else if(instruction instanceof CallInstr callInstr){
                    if(!isReg(callInstr.result) && !irFuncDef.nameMap.containsKey(callInstr.result.toString())){
                        irFuncDef.nameMap.put(callInstr.result.toString(), stackSize);
                        stackSize += 4;
                    }
                } else if(instruction instanceof GeteleptrInstr){
                    if(!isReg(((GeteleptrInstr) instruction).result) && !irFuncDef.nameMap.containsKey(((GeteleptrInstr) instruction).result.toString())){
                        irFuncDef.nameMap.put(((GeteleptrInstr) instruction).result.toString(), stackSize);
                        stackSize += 4;
                    }
                } else if(instruction instanceof IcmpInstr){
                    if(!isReg(((IcmpInstr) instruction).result) && !irFuncDef.nameMap.containsKey(((IcmpInstr) instruction).result.toString())){
                        irFuncDef.nameMap.put(((IcmpInstr) instruction).result.toString(), stackSize);
                        stackSize += 4;
                    }
                } else if(instruction instanceof JumpInstr){
                } else if(instruction instanceof LoadInstr){
                    if(!isReg(((LoadInstr) instruction).result) && !irFuncDef.nameMap.containsKey(((LoadInstr) instruction).result.toString())){
                        irFuncDef.nameMap.put(((LoadInstr) instruction).result.toString(), stackSize);
                        stackSize += 4;
                    }
                } else if(instruction instanceof PhiInstr){
                    throw new RuntimeException("PhiInstr should not appear in IRFuncDef");
                } else if(instruction instanceof RetInstr){
                } else if(instruction instanceof StoreInstr){
                }
            }
        }
        stackSize += 4;
        return stackSize;
    }

    // 只存被color的寄存器
    private int regStackSize(IRFuncDef irFuncDef){
        int stackSize = 0;
        HashSet<Integer> regSet = new HashSet<>(irFuncDef.regMap.values());
        for(int i = 0; i < regSet.size(); ++i){
            irFuncDef.nameMap.put(getReg(i), stackSize);
            stackSize += 4;
        }
        return stackSize;
    }

    public String allReg(Integer idx) {
        String[] strings = {"x0", "x1", "x2", "x3", "x4", "t0", "t1", "t2", "x8", "x9", "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7", "x18", "x19", "x20", "x21", "x22", "x23", "x24", "x25", "x26", "x27", "t3", "t4", "t5", "t6"};
        return strings[idx];
    }

    public String getReg(Integer idx) {
        // x0-x2, x5-x7, x28-x31 没有使用
        String[] strings = {"x3", "x4", "x8", "x9", "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7", "x18", "x19", "x20", "x21", "x22", "x23", "x24", "x25", "x26", "x27"};
        return strings[idx];
    }

    public boolean isReg(IREntity entity) {
        return entity instanceof IRVariable && currentFunc.regMap.containsKey(entity.toString());
    }

    public boolean nameIsReg(IREntity entity) {
        String[] strings = {"x0", "x1", "x2", "x3", "x4", "t0", "t1", "t2", "x8", "x9", "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7", "x18", "x19", "x20", "x21", "x22", "x23", "x24", "x25", "x26", "x27", "t3", "t4", "t5", "t6"};
        for(String string : strings){
            if(entity.toString().equals(string)) return true;
        }
        return false;
    }

    public String getVarReg(String var) {
        if(currentFunc.regMap.containsKey(var)) return getReg(currentFunc.regMap.get(var));
        return null;
    }

    public boolean inStack(IREntity entity) {
        return entity instanceof IRVariable && currentFunc.nameMap.containsKey(entity.toString());
    }

    public boolean isGlobal(IREntity entity){
        return (entity.toString().charAt(0) == '@');
    }

    public boolean isInt(IREntity entity){
        if(entity instanceof IRIntLiteral) return true;
        if(entity instanceof IRBoolLiteral) return true;
        if(entity.toString().equals("null")) return true;
        if(entity instanceof IRVariable){
            char first = entity.toString().charAt(0);
            if(first != '@' && first != '%') return true;
        }
        return false;
    }

    public Integer getInt(IREntity entity) {
        if(entity instanceof IRIntLiteral intLiteral) return intLiteral.value;
        if(entity instanceof IRBoolLiteral boolLiteral) return (boolLiteral.value ? 1 : 0);
        if(entity.toString().equals("null")) return 0;
        if(entity instanceof IRVariable irVariable) {
            if(irVariable.toString().equals("false")) return 0;
            if(irVariable.toString().equals("true")) return 1;
            if(irVariable.toString().equals("null")) return 0;
            try {
                return Integer.parseInt(irVariable.toString());
            } catch (Throwable t) {
                System.exit(0);
            }
            return Integer.parseInt(irVariable.toString());
        }
        throw new RuntimeException("getInt: entity is not int");
    }

    public boolean varIsInt(String var){
        if(var.equals("false")) return true;
        if(var.equals("true")) return true;
        if(var.equals("null")) return true;
        if(var.charAt(0) == '%') return false;
        if(var.charAt(0) == '@') return false;
        try {
            Integer.parseInt(var);
        } catch (Throwable t) {
            return false;
        }
        return true;
    }

    public int varGetInt(String var){
        if(var.equals("false")) return 0;
        if(var.equals("true")) return 1;
        if(var.equals("null")) return 0;
        return Integer.parseInt(var);
    }

}
