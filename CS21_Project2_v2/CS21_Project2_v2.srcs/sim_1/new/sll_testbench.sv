`timescale 1ns / 1ps
module sll_testbench();

  logic        clk;
  logic        reset;

  logic [31:0] writedata, dataadr;
  logic        memwrite;
  // NOTE, watching shift from mips to top
  logic        shift;

  // instantiate device to be tested
  top dut(clk, reset, writedata, dataadr, memwrite, shift);
  
  // initialize test
  initial
    begin
      reset <= 1; #1; 
      reset <= 0;
      #99 $finish;
    end

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end

  // check results
  always @(negedge clk)
    begin
      if(memwrite) begin
        if(dataadr === 84 & writedata === 'h0C00000C) begin
          $display("Simulation succeeded");
          $stop;
        end else begin
          $display("Simulation failed");
          $stop;
        end
      end
    end
endmodule