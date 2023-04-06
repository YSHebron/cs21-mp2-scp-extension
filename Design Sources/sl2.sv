`timescale 1ns / 1ps

module sl2(input  logic [31:0] a,
           output logic [31:0] y);

  // shift left by 2
  // by taking a[29:0] (leaving out MSB and MSB-1)
  // then concatenating it with 00)
  assign y = {a[29:0], 2'b00};
  // similar to a << 2;
endmodule