package IR;

import ASM.instr.ASMSetInstr;
import IR.definition.IRClassDef;
import IR.definition.IRFuncDef;
import IR.definition.IRGlobalVariDef;
import IR.definition.IRStatement;
import IR.entity.IRBoolLiteral;
import IR.instruction.*;

public interface IRVisitor {
    public void visit(IRProgram irProgram);
    public void visit(IRClassDef irClassDef);
    public void visit(IRFuncDef irFuncDef);
    public void visit(IRGlobalVariDef irGlobalVariDef);
    public void visit(IRStatement irStatement);

    public void visit(AllocInstr allocInstr);
    public void visit(BinaryInstr binaryInstr);
    public void visit(BrInstr brInstr);
    public void visit(CallInstr callInstr);
    public void visit(GeteleptrInstr geteleptrInstr);
    public void visit(IcmpInstr icmpInstr);
    public void visit(JumpInstr jumpInstr);
    public void visit(LoadInstr loadInstr);
    public void visit(PhiInstr phiInstr);
    public void visit(RetInstr retInstr);
    public void visit(StoreInstr storeInstr);
    public void visit(IRBlock irBlock);
}
