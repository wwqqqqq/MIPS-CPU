`timescale 1ns / 1ps

module SignExtend(
input [31:0] Instr,
output [31:0] SignImm
    );
assign SignImm=(Instr[15]==1'b1)?(32'hffff0000|Instr):(32'h0000ffff&Instr);

endmodule
