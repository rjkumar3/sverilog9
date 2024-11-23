`timescale 1ns/1 ps

module Adder #(parameter WIDTH = 16) (
    input wire [WIDTH-1:0] a,
    input wire [WIDTH-1:0] b,
    output wire [WIDTH:0] sum
);
    assign sum = a + b;
endmodule

