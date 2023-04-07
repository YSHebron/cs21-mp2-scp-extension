`timescale 1ns / 1ps
module controller(input  logic [5:0] op, funct,
                  input  logic       zero,
                  output logic       memtoreg, memwrite,
                  output logic       pcsrc, alusrc,
                  output logic       regdst, regwrite,
                  output logic       jump,
                  output logic [2:0] alucontrol,
                  output logic       shift, // added
                  output logic       sb,    // added
                  input  logic       sign,  // added
                  output logic       li,    // added
                  output logic       zfr    // added
                  );

  logic [1:0] aluop;
  logic       beq; // changed branch to beq
  logic       ble; // added

  maindec md(op, memtoreg, memwrite, beq, // added sb, ble signals (replace branch signal with beq)
             alusrc, regdst, regwrite, jump, aluop,
             sb, ble, li);

  aludec  ad(funct, aluop, alucontrol, shift, zfr);  // added shift and zfr signals

  //assign pcsrc = branch & zero;
  assign pcsrc = (beq & zero) | (ble & (sign | zero));
endmodule