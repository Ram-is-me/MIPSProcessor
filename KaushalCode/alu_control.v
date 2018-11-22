module alu_control(func, alu_op, alu_ctrl);

    input [5:0]func;
    input [1:0]alu_op;
    output reg [3:0]alu_ctrl;


always @(func or alu_op)

begin
    case(alu_op)

        2'b00: assign alu_ctrl = 4'b0010; // lw/sw instruction

        2'b01: assign alu_ctrl = 4'b0011; // BEQ

        2'b10: begin // R format look for func
            case(func)
                6'b100100: assign alu_ctrl = 4'b0000; // AND instuction
                6'b100101: assign alu_ctrl = 4'b0001; // OR instruction
                6'b100000: assign alu_ctrl = 4'b0010; // ADD instruction
                6'b011000: assign alu_ctrl = 4'b0100; // MUL instruction
                6'b100010: assign alu_ctrl = 4'b0011; // SUB instruction
            endcase
        end
    
    endcase
end

endmodule // alu_control