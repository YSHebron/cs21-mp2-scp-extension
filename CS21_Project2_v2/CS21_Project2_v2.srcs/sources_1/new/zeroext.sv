`timescale 1ns / 1ps

module zeroext (input logic  [15:0] imm,
               output logic  [31:0] zeroimm
               );
               
    assign zeroimm = {32'b0, imm};               

endmodule
