`timescale 1ns / 1ps

module Third_Level_tb;

// Parameters
parameter DATA_WIDTH = 8;
parameter COEFF_WIDTH = 8;

// Inputs
reg clk;
reg reset;
reg [DATA_WIDTH-1:0] data1;
reg [DATA_WIDTH-1:0] data2;
reg [COEFF_WIDTH-1:0] coeff1;
reg [COEFF_WIDTH-1:0] coeff2;

// Output
wire [DATA_WIDTH+COEFF_WIDTH+1:0] final_result;

// Instantiate the Unit Under Test (UUT)
Third_Level #(
    .DATA_WIDTH(DATA_WIDTH), 
    .COEFF_WIDTH(COEFF_WIDTH)
) uut (
    .clk(clk), 
    .reset(reset), 
    .data1(data1), 
    .data2(data2), 
    .coeff1(coeff1), 
    .coeff2(coeff2), 
    .final_result(final_result)
);

// Clock generation
initial begin
    clk = 0;
    forever #10 clk = ~clk;  // Clock period of 20 ns
end

// Stimulus here
initial begin
    // Initialize Inputs
    reset = 1; data1 = 0; data2 = 0; coeff1 = 0; coeff2 = 0;

    // Wait for global reset
    #100;
    reset = 0;
    
    // Test vector 1: Basic Operation
    data1 = 8'd15; coeff1 = 8'd2;  // 15 * 2 = 30
    data2 = 8'd10; coeff2 = 8'd3;  // 10 * 3 = 30
    #20;  // Wait one clock cycle

    // Test vector 2: Boundary Conditions
    data1 = 8'd255; coeff1 = 8'd1; // 255 * 1 = 255
    data2 = 8'd255; coeff2 = 8'd1; // 255 * 1 = 255
    #20;

    // Test vector 3: Carry and saturation test
    data1 = 8'd100; coeff1 = 8'd2;  // 100 * 2 = 200
    data2 = 8'd150; coeff2 = 8'd2;  // 150 * 2 = 300 (saturation expected if applicable)
    #20;

    // Reset and observe default output
    reset = 1; #30; reset = 0;

    // End of test
    #100; 
    $finish;
end

// Display results
initial begin
	$vcdpluson;	
    $monitor("At time %t, output = %d (expected: %d)",
             $time, final_result, expected_output(data1, data2, coeff1, coeff2));
end

// Function to calculate expected output
function [DATA_WIDTH+COEFF_WIDTH+1:0] expected_output(
    input [DATA_WIDTH-1:0] data1,
    input [DATA_WIDTH-1:0] data2,
    input [COEFF_WIDTH-1:0] coeff1,
    input [COEFF_WIDTH-1:0] coeff2
);
    reg [DATA_WIDTH+COEFF_WIDTH-1:0] mul1_out, mul2_out;
    begin
        mul1_out = data1 * coeff1;
        mul2_out = data2 * coeff2;
        expected_output = mul1_out + mul2_out;
    end
endfunction

endmodule


