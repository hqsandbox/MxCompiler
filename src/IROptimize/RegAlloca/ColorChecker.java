package IROptimize.RegAlloca;

import IR.IRProgram;

import java.util.HashSet;

public class ColorChecker {

    public IRProgram program;
    public HashSet<String> vars = new HashSet<>();

    public ColorChecker(IRProgram program) {
        this.program = program;
    }

    public void work() {
        collectVar();
        if(!checkColor()) {
            for(var var : vars) {
                if(!program.regMap.containsKey(var) && !program.spilledVars.contains(var)) {
                    System.out.println(var);
                }
            }
            throw new RuntimeException("ColorChecker failed");
        }
    }

    public void collectVar() {
        program.funcDefMap.forEach((key, func) -> {
            func.blockList.forEach(block -> {
                for(var inst : block.instructions) {
                    vars.add(inst.getDef());
                    vars.addAll(inst.getUse());
                }
                for(var phi : block.phiInsts.values()) {
                    vars.add(phi.getDef());
                    vars.addAll(phi.getUse());
                }
            });
        });
        vars.remove(null);
        HashSet<String> removeList = new HashSet<>();
        for(var var : vars) {
            if(var.startsWith("@")) {
                removeList.add(var);
            }
        }
        vars.removeAll(removeList);
    }

    public boolean checkColor() {
        if(vars.size() != program.regMap.size() + program.spilledVars.size()) {
            return false;
        }
        return true;
    }

}
