`timescale 1ns / 1ps

module shiftleft#(parameter WIDTH = 8)
             (input  logic [WIDTH-1:0] A,
              input  logic [4:0]       shamt,
              output logic [WIDTH-1:0] Y
              );
              
    assign Y = A << shamt;
              
endmodule
