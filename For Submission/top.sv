`timescale 1ns / 1ps
module top(input  logic        clk, reset, 
           output logic [31:0] writedata, dataadr, 
           output logic        memwrite,
           output logic        shift // watching shift
           );

  logic [31:0] pc, instr, readdata;
  logic        sb;
  
  // instantiate processor and memories
  mips mips(clk, reset, pc, instr, memwrite, dataadr, 
            writedata, readdata,
            shift, sb);
  imem imem(pc[7:2], instr);
  dmem dmem(clk, memwrite, dataadr, writedata, readdata,
            sb);
endmodule