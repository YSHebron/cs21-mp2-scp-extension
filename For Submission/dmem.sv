`timescale 1ns / 1ps
module dmem(input  logic        clk, we,
            input  logic [31:0] a, wd,
            output logic [31:0] rd,
            input  logic        sb
            );

    // compared to 6 address bits of imem.sv,
    // dmem.sv has the full 32 address bits (but still only partial memory)
  logic [31:0] RAM[63:0];

    // read combinationally
  assign rd = RAM[a[31:2]]; // word aligned
  // a[31:2] gives the word address
  // a[1:0] gives the byte offset for that word address
  // this is important to implement sb

    // write-to sequentially
    // for byte write, use BIG ENDIAN
  always_ff @(posedge clk)
    if (we) begin
        case (sb)
            1'b0: RAM[a[31:2]] <= wd;
            1'b1: case(a[1:0])
                2'b00: RAM[a[31:2]][31:24] <= wd[7:0];
                2'b01: RAM[a[31:2]][23:16] <= wd[7:0];
                2'b10: RAM[a[31:2]][15:8]  <= wd[7:0];
                2'b11: RAM[a[31:2]][7:0]   <= wd[7:0];
            endcase
        endcase
    end
endmodule