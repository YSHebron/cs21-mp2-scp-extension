`timescale 1ns / 1ps
module dmem(input  logic        clk, we,
            input  logic [31:0] a, wd,
            output logic [31:0] rd);

    // compared to 6 address bits of imem.sv,
    // dmem.sv has the full 32 address bits (but still only partial memory)
  logic [31:0] RAM[63:0];

    // read combinationally
  assign rd = RAM[a[31:2]]; // word aligned (a[1:0] always 00, byte addressable memory)

    // write-to sequentially
  always_ff @(posedge clk)
    if (we) RAM[a[31:2]] <= wd;
endmodule