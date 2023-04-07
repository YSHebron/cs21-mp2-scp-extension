// 5.1: adder
`timescale 1ns / 1ps

module adder #(parameter N = 8)
              (input  logic [N-1:0] a, b,
               input  logic         cin,
               output logic [N-1:0] s,
               output logic         cout);
    
    //recall: Concatencation operator {,}
    //assume N = 8,
    //below, we ess. produce a 9-bit 0bcout_s at the LHS
    //with cout receiving the MSB [8] of the 9-bit RHS
    // (MSB serves as the carry bit)
    //while s receives [7:0] of the 9-bit RHS
    assign {cout, s} = a + b + cin;
    
endmodule
