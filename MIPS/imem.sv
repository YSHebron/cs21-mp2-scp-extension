`timescale 1ns / 1ps
module imem(input  logic [5:0]  a,
            output logic [31:0] rd);
    
    // RAM contains 64 32-bit logic-type variables.
    logic [31:0] RAM[63:0];
    
    initial
        $readmemh("memfile.mem", RAM);
    
    assign rd = RAM[a]; // word aligned accesses

endmodule
