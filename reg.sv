`timescale 1ns/1 ps
module Register #(parameter DATA_WIDTH = 8) (
    input wire clk,
    input wire reset,
    input wire [DATA_WIDTH-1:0] data_in,
    output reg [DATA_WIDTH-1:0] data_out
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            data_out <= 0;
        else
            data_out <= data_in;
    end
endmodule


