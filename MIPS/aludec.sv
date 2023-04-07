////////////
`timescale 1ns / 1ps
module aludec(input  logic [5:0] funct,
              input  logic [1:0] aluop,
              output logic [2:0] alucontrol,
              output logic       shift, // added
              output logic       zfr    // added
              );
    
    logic [4:0] controls;   // note the added bits
    assign {alucontrol, shift, zfr} = controls;     // added shift and zfr signals

    always_comb begin
        case(aluop)
            2'b00: controls <= 5'b010_00;  // add (for lw/sw/addi/sb)
            2'b01: controls <= 5'b110_00;  // sub (for beq/ble)
            default:
            case(funct)          // R-type instructions
                6'b100000: controls <= 5'b010_00; // add
                6'b100010: controls <= 5'b110_00; // sub
                6'b100100: controls <= 5'b000_00; // and
                6'b100101: controls <= 5'b001_00; // or
                6'b101010: controls <= 5'b111_00; // slt
                6'b000000: controls <= 5'b011_10; // sll
                6'b110011: controls <= 5'b000_01; // zfr
                default:   controls <= 5'bxxx_xx; // ???
            endcase
        endcase
    end
endmodule
