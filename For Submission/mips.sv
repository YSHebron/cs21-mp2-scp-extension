`timescale 1ns / 1ps
module mips(input  logic        clk, reset,
            output logic [31:0] pc,
            input  logic [31:0] instr,
            output logic        memwrite,
            output logic [31:0] aluout, writedata,
            input  logic [31:0] readdata,
            output logic        shift, // watching sll as waveform checkpoint
            output logic        sb     // goes to dmem
            );

  logic       memtoreg, alusrc, regdst, 
              regwrite, jump, pcsrc, zero;
  logic [2:0] alucontrol;
  //logic     shift;    //shift
  logic       sign;     //added
  logic       li;       //added
  logic       zfr;      //added

  // new signals: shift, sb, sign (flag), li, zfr
  controller c(instr[31:26], instr[5:0], zero,
               memtoreg, memwrite, pcsrc,
               alusrc, regdst, regwrite, jump,
               alucontrol,
               shift, sb,
               sign, li, zfr
               );
               
  // added shift, li, zfr signals and sign flag, sb goes to dmem
  datapath dp(clk, reset, memtoreg, pcsrc,  
              alusrc, regdst, regwrite, jump,
              alucontrol,
              zero, pc, instr,
              aluout, writedata, readdata,
              shift,
              sign, li, zfr
              );
endmodule