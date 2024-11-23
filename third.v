`timescale 1ns/1 ps

module Third_Level #(parameter DATA_WIDTH = 8, COEFF_WIDTH = 8) (
    input wire clk,
    input wire reset,
    input wire [DATA_WIDTH-1:0] data1,
    input wire [DATA_WIDTH-1:0] data2,
    input wire [COEFF_WIDTH-1:0] coeff1,
    input wire [COEFF_WIDTH-1:0] coeff2,
    output wire [DATA_WIDTH+COEFF_WIDTH+1:0] final_result
);
    wire [DATA_WIDTH+COEFF_WIDTH:0] level2_out1, level2_out2;
    
    Second_Level #(DATA_WIDTH, COEFF_WIDTH) level2a(
        clk, reset, data1, coeff1, data2, coeff2, level2_out1
    );
    Second_Level #(DATA_WIDTH, COEFF_WIDTH) level2b(
        clk, reset, data1, coeff1, data2, coeff2, level2_out2
    );
    Adder #(DATA_WIDTH+COEFF_WIDTH+1) final_adder(level2_out1, level2_out2, final_result);
endmodule

