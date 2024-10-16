//package IROptimize.RegAlloca.Utils;
//
//import ASM.instr.ASMLiInstr;
//import ASM.instr.ASMMvInstr;
//import ASM.section.ASMText;
//import IR.IRBlock;
//import IR.IRProgram;
//import IR.definition.IRFuncDef;
//import IR.entity.IRBoolLiteral;
//import IR.entity.IREntity;
//import IR.entity.IRIntLiteral;
//import IR.instruction.PhiInstr;
//
//import java.util.*;
//
//public class CycleHelper {
//
//    public IRProgram program;
//    public IRFuncDef currentFunc;
//    public HashMap<String, PhiInstr> phiInsts;
//    public HashMap<IRBlock, HashMap<IREntity, ArrayList<IREntity>>> graphs;
//    private final HashSet<ArrayList<IREntity>> allCycles = new HashSet<>();
//
//    public CycleHelper(IRProgram program, IRFuncDef irFuncDef, HashMap<String, PhiInstr> phiInsts) {
//        this.program = program;
//        currentFunc = irFuncDef;
//        this.phiInsts = phiInsts;
//    }
//
//    public void work() {
////        buildGraph();
//        findCycles();
//        cycle_phi_elimination();
//    }
//
//    public void buildGraph(HashMap<String, PhiInstr> phiInsts){
//        for (String tmp : phiInsts.keySet()) {
//            PhiInstr phiInstr = phiInsts.get(tmp);
//            IREntity key = phiInstr.result;
//            for(int i = 0; i < phiInstr.blocks.size(); ++i){
//                IRBlock block = phiInstr.blocks.get(i);
//                IREntity value = phiInstr.values.get(i);
//                if(!graphs.containsKey(block)){
//                    graphs.put(block, new HashMap<>());
//                }
//                HashMap<IREntity, ArrayList<IREntity>> graph = graphs.get(block);
//                if(!graph.containsKey(key)){
//                    graph.put(key, new ArrayList<>());
//                }
//                graph.get(key).add(value);
//            }
//        }
//    }
//
//    public void findCycles(IRBlock targetBlock, HashMap<IREntity, ArrayList<IREntity>> graph){
//        // 先对出度为0的点消除，然后剩下的图就全是环了
//        while(true){
//            ArrayList<IREntity> removeList = findEmpty(graph);
//            if(removeList.isEmpty()) break;
//            // 在删掉这个节点以及边之前，先对该指令进行asm的翻译
//            // 然后将指向key的边删掉（指向指的是result为key）
//            for(IREntity key : removeList){
//                for(IREntity src : graph.keySet()){
//                    if(graph.get(src).contains(key)){
//                        naive_phi_elimination(targetBlock, src, key);
//                        graph.get(src).remove(key);
//                    }
//                }
//            }
//            // 将key这个节点删掉，这个节点出度为0
//            for(IREntity key : removeList){
//                graph.remove(key);
//            }
//        }
//        // 现在整个graph里面全是环
//        while(!graph.isEmpty()){
//            Map.Entry<IREntity, ArrayList<IREntity>> firstEntry = graph.entrySet().iterator().next();
//            ArrayList<IREntity> path = new ArrayList<>();
//            IREntity currentNode = firstEntry.getKey();
//            IREntity nextNode;
//            path.add(firstEntry.getKey());
//            while(true){
//                nextNode = graph.get(currentNode).getFirst();
//                if(firstEntry.getKey().equals(nextNode)) break;
//                path.add(nextNode);
//                currentNode = nextNode;
//            }
//            for(IREntity key : path) graph.remove(key);
//            allCycles.add(path);
//        }
//    }
//
//    // 找到出度为 0的节点
//    public ArrayList<IREntity> findEmpty(HashMap<IREntity, ArrayList<IREntity>> graph){
//        ArrayList<IREntity> res = new ArrayList<>();
//        for(IREntity key : graph.keySet()){
//            if(graph.get(key).isEmpty()){
//                res.add(key);
//            }
//        }
//        return res;
//    }
//
//    // 指的是这个PhiInstr的result不会在PhiInst里面再被用到，不会成环，就正常写赋值语句就行
////    public void naive_phi_elimination(IRBlock targetBlock, PhiInstr phiInstr){
////        for(int i = 0; i < phiInstr.blocks.size(); ++i){
////            ASMText asmText = program.blockTextMap.get(targetBlock);
////            IREntity value = phiInstr.values.get(i);
////            if(isInteger(value.toString())){
////                asmText.addBeforeEnd(new ASMLiInstr(asmText, phiInstr.result.toString(), Integer.parseInt(value.toString())));
////            } else {
////                if(phiInstr.visited.get(i)) continue;
////                asmText.addBeforeEnd(new ASMMvInstr(asmText, phiInstr.result.toString(), value.toString()));
////            }
////        }
////    }
//
//    // src: reg sp num global
//    // key: reg sp
//    public void naive_phi_elimination(IRBlock targetBlock, IREntity src, IREntity key){
//        ASMText asmText = program.blockTextMap.get(targetBlock);
//        if(src instanceof IRIntLiteral){
//            if(isReg(key)){
//                asmText.addBeforeEnd(new ASMLiInstr(asmText, getVarReg(key.toString()), ((IRIntLiteral) src).value));
//            } else if (inStack(key)){
//                asmText.addBeforeEnd(new ASMLiInstr(asmText, key.toString(), ((IRIntLiteral) src).value));
//            } else {
//                throw new RuntimeException("naive_phi_elimination: key is not reg or stack");
//            }
//        } else if(src instanceof IRBoolLiteral){
//            if(isReg(key)){
//                asmText.addBeforeEnd(new ASMLiInstr(asmText, key.toString(), ((IRBoolLiteral) src).value ? 1 : 0));
//            } else if (inStack(key)){
//
//            } else {
//                throw new RuntimeException("naive_phi_elimination: key is not reg or stack");
//            }
//        } else if(isReg(src)){
//            if(isReg(key)){
//                asmText.addBeforeEnd(new ASMLiInstr(asmText, key.toString(), ((IRBoolLiteral) src).value ? 1 : 0));
//            } else if (inStack(key)){
//
//            } else {
//                throw new RuntimeException("naive_phi_elimination: key is not reg or stack");
//            }
//        } else {
//            asmText.addBeforeEnd(new ASMMvInstr(asmText, key.toString(), src.toString()));
//        }
//    }
//
//    public void cycle_phi_elimination(){
//        Map.Entry<String, PhiInstr> firstEntry = phiInsts.entrySet().iterator().next();
//        IRBlock block = firstEntry.getValue().parent;
//        ASMText asmText = program.blockTextMap.get(block);
//        for(ArrayList<IREntity> cycle : allCycles){
//            // TODO
//            asmText.addBeforeEnd(new ASMMvInstr(asmText, "", cycle.getFirst()));
//            for(int i = 1; i < cycle.size(); ++i){
//                asmText.addBeforeEnd(new ASMMvInstr(asmText, cycle.get(i - 1), cycle.get(i)));
//            }
//            asmText.addBeforeEnd(new ASMMvInstr(asmText, cycle.getLast(), ""));
//        }
//    }
//
//    public static boolean isInteger(String str) {
//        if (str == null) {
//            return false;
//        }
//        try {
//            Integer.parseInt(str);
//        } catch (NumberFormatException e) {
//            return false;
//        }
//        return true;
//    }
//
//    public boolean isReg(IREntity entity){
//        return program.regMap.containsKey(entity.toString());
//    }
//
//    public boolean inStack(IREntity entity){
//        return currentFunc.nameMap.containsKey(entity.toString());
//    }
//
//    public String getReg(Integer idx) {
//        // x0-x2, x5-x7, x28-x31 没有使用
//        String[] strings = {"x3", "x4", "x8", "x9", "x10", "x11", "x12", "x13", "x14", "x15", "x16", "x17", "x18", "x19", "x20", "x21", "x22", "x23", "x24", "x25", "x26", "x27"};
//        return strings[idx];
//    }
//
//    public String getVarReg(String var) {
//        if(program.regMap.containsKey(var)) return getReg(program.regMap.get(var));
//        return null;
//    }
//
//}
