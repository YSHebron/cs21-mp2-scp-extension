`timescale 1ns / 1ps
module maindec(input  logic [5:0] op,
               output logic       memtoreg, memwrite,
               output logic       beq, alusrc,
               output logic       regdst, regwrite,
               output logic       jump,
               output logic [1:0] aluop,
               output logic       sb,
               output logic       ble,
               output logic       li
               );
               
  // branch to beq
  logic [11:0] controls; // added bits for sb, ble, and li

  assign {regwrite, regdst, alusrc, beq, memwrite,
          memtoreg, jump, aluop, sb, ble, li} = controls; // added sb

    // added a bit (sb) to controls
    // we may compress the added signals to an "added" to lessen the bits
    // but we stick with this for now for clarity 
  always_comb
    case(op)
      6'b000000: controls <= 12'b110000010_000; // RTYPE
      6'b100011: controls <= 12'b101001000_000; // LW
      6'b101011: controls <= 12'b001010000_000; // SW
      6'b000100: controls <= 12'b000100001_000; // BEQ (beq=1, ble=0)
      6'b001000: controls <= 12'b101000000_000; // ADDI
      6'b000010: controls <= 12'b000000100_000; // J (regwrite=memwrite=1, jump=1)
      6'b101000: controls <= 12'b001010000_100; // SB (sb = 1)
      6'b011111: controls <= 12'b000000001_010; // BLE (beq=0, ble=1)
      6'b010001: controls <= 12'b100000000_001; // LI (regwrite=1, li=1)
      default:   controls <= 12'bxxxxxxxxx_xxx; // illegal op
    endcase
endmodule