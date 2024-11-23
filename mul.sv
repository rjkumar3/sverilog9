`timescale 1ns/1 ps

module Multiplier #(parameter WIDTH = 8) (
    input wire [WIDTH-1:0] a,
    input wire [WIDTH-1:0] b,
    output wire [2*WIDTH-1:0] product
);
    assign product = a * b;
endmodule


