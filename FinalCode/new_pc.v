module new_pc(in_pc,jump_pc,branch_pc,jump,branch,new_pc);

  // This module is the final module which decides between taking a branch, jumping or simply adding by 4
  // new_pc is the address of the next instruction to be fetched
  // in_pc is pc simply added by 4
  
  input [31:0]in_pc,jump_pc,branch_pc;
  input jump,branch;

  reg [31:0]temp_pc;

  output reg[31:0] new_pc=0;

  always@(in_pc,jump_pc,branch_pc)
  begin
    case(branch)
      0: temp_pc = in_pc;
      1: temp_pc = branch_pc;
    endcase

    case(jump)
      0: new_pc = temp_pc;
      1: new_pc = jump_pc;
    endcase
  end

endmodule