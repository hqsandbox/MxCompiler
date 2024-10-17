package IROptimize.RegAlloca;

import IR.IRBlock;
import IR.IRProgram;
import IR.definition.IRFuncDef;
import IR.instruction.Instruction;
import IR.instruction.PhiInstr;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;

public class Spill {

    public IRProgram program;
    public HashSet<String> spilledVars = new HashSet<>();
    public int regNum = 20;

    public Spill(IRProgram program) {
        this.program = program;
    }

    public void work(){
        program.funcDefMap.forEach((key, func) -> workOnFunc(func));
        program.spilledVars = spilledVars;
    }

    public void workOnFunc(IRFuncDef func) {
        for(IRBlock block : func.blockList){
            block.phiLiveOut_.removeAll(spilledVars);
            if(block.phiLiveOut_.size() > regNum){
                Iterator<Map.Entry<String, PhiInstr>> iterator = block.phiInsts.entrySet().iterator();
                doSpill(iterator.next().getValue(), block.phiLiveOut_.size() - regNum);
            }
            for(Instruction instruction : block.instructions){
                instruction.liveOut_.removeAll(spilledVars);
                if(instruction.liveOut_.size() > regNum){
                    doSpill(instruction, instruction.liveOut_.size() - regNum);
                }
            }
        }
        for(IRBlock block : func.blockList){
            block.phiLiveOut_.removeAll(spilledVars);
            for(Instruction instruction : block.instructions){
                instruction.liveOut_.removeAll(spilledVars);
            }
        }
        printSpillNum();
    }

    public void doSpill(Instruction instruction, int num){
        Iterator<String> iterator = instruction.liveOut_.iterator();
        // 错误：注意要存起来一起删除，不然iterator指向的东西会被删除，iterator失效
        HashSet<String> spillList = new HashSet<>();
        for(int i = 0; i < num; ++i){
            String var = iterator.next();
            spillList.add(var);
        }
        spilledVars.addAll(spillList);
        instruction.liveOut_.removeAll(spillList);
    }

    public void printSpillNum(){
        System.out.print(spilledVars.size());
        System.out.print(" ");
    }
}
