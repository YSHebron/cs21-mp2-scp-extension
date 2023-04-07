module alu(input  logic [31:0] a, b,
           input  logic [2:0]  alucontrol,
           output logic [31:0] result,
           output logic        zero,
           output logic        sign // added
           );
  
    logic [31:0] condinvb, sum;
    
    // notes from reviewing HARRIS ALU Decoder
    
    // if alucontrol[2] = 0, we assume addition
    // elif alucontrol[2] = 1, we assume subtraction or slt
    assign condinvb = alucontrol[2] ? ~b : b;
    // if alucontrol[2] = 0, condinvb + alucontrol[2] = b
    // elif alucontrol[2] = 1, condinvb + alucontrol[2] = -b (in 2C, recall -b = ~b + 1)
    // 2C addition of a + (-b) is then essentially a subtraction,
    // so sum will instead contain a difference (a - b).
    assign sum = a + condinvb + alucontrol[2];
    
    // subctract for beq and ble, add for most others
    
    always_comb begin
        if (alucontrol == 3'b011) result = b << a; // sll
        else
            case (alucontrol[1:0])
            2'b00: result = a & b;  // for and and zfr
            2'b01: result = a | b;
            // below case gives either a true sum or a difference depending on alucontrol[2]
            2'b10: result = sum;
            // below case gives result of slt (taking below case implies alucontrol[2] = 1)
            // sum here is actually a - b, take the sign bit of the diffrence
            // sign bit = 0 : >=, sign bit = 1 : <
            2'b11: result = sum[31];
            endcase
    end
    
    assign zero = (result == 32'b0);
    assign sign = result[31]; // take sign bit of difference (alucontrol 110)
    // realization: actually, with the HDL in front of us, we can already
    // do zero = (a == b) and sign = (a < b), but we want to be as simple
    // as possible, so we don't do that.
endmodule
