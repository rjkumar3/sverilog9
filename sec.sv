`timescale 1ns/1 ps

module Second_Level #(parameter DATA_WIDTH = 8, COEFF_WIDTH = 8) (
    input wire clk,
    input wire reset,
    input wire [DATA_WIDTH-1:0] data1,
    input wire [COEFF_WIDTH-1:0] coeff1,
    input wire [DATA_WIDTH-1:0] data2,
    input wire [COEFF_WIDTH-1:0] coeff2,
    output wire [DATA_WIDTH+COEFF_WIDTH:0] result
);
    wire [DATA_WIDTH+COEFF_WIDTH-1:0] mul1_out, mul2_out;
    
    Multiplier #(DATA_WIDTH) mul1(data1, coeff1, mul1_out);
    Multiplier #(DATA_WIDTH) mul2(data2, coeff2, mul2_out);
    Adder #(DATA_WIDTH+COEFF_WIDTH) add(mul1_out, mul2_out, result);
endmodule


