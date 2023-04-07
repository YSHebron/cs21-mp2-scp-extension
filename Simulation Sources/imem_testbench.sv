`timescale 1ns / 1ps

module imem_testbench();

    // a is a 6-bit value used to access the 64-words in RAM
    logic [5:0] a;
    logic [31:0] rd;
    
    imem instantiated_imem(a, rd);
    
    initial begin
        // a zero extended to 6 bits.
        a = 'b000000; #2;    
        a = 'b000001; #2;  
        a = 'b000010; #2;
        a = 'b000011; #2;
        
    end


endmodule