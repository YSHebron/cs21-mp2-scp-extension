`timescale 1ns / 1ps

module signext(input  logic [15:0] a,
               output logic [31:0] y);
              
  // recall bit concatenation and replication operators {,} and {N{}} respectively.
  // we call this a sign extender because we don't just pad with zeros by default,
  // we consider our input to be signed values and we take their MSB (i.e. their sign bit SB)
  // and use that SB to pad the result.
  
  // take MSB of a, replicate to 16 bits, then concatenate back at MSB of a.
  assign y = {{16{a[15]}}, a};
endmodule