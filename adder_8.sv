`timescale 1ns / 1ps

module adder_8
    
    (input logic [7:0] a, b,
     output logic [7:0] y);


assign y = a + b;

endmodule
