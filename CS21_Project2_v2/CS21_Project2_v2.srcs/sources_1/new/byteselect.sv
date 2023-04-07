`timescale 1ns / 1ps

module byteselect#(parameter BITE = 1, WIDTH = 32)
             (input  logic [WIDTH-1:0] A,
              output logic [7:0] Y
              );
              
    assign Y = A[BITE*8-1:BITE*8-8];
              
endmodule
