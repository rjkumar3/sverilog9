`timescale 1ns / 1ps

// Testbench to simulate the ALU and generate a VCD file
module ALU_tb();
    reg [7:0] a, b;
    reg [3:0] opcode;
    reg enable;
    wire [7:0] result;
    wire zero_flag, carry_flag, overflow_flag;

    // Instantiate the ALU
    ALU alu_instance(
        .a(a),
        .b(b),
        .opcode(opcode),
        .enable(enable),
        .result(result),
        .zero_flag(zero_flag),
        .carry_flag(carry_flag),
        .overflow_flag(overflow_flag)
    );

    initial begin
       $vcdpluson;

        // Test sequence
        a = 8'd100; b = 8'd50; opcode = 4'b0000; enable = 1;  // ADD
        #10;
        a = 8'd100; b = 8'd50; opcode = 4'b0001; enable = 1;  // SUBTRACT
        #10;
        a = 8'd100; b = 8'd50; opcode = 4'b0010; enable = 1;  // AND
        #10;
        a = 8'd100; b = 8'd50; opcode = 4'b0011; enable = 1;  // OR
        #10;
        a = 8'd100; b = 8'd50; opcode = 4'b0100; enable = 1;  // XOR
        #10;
        a = 8'd100; opcode = 4'b0101; enable = 1;             // NOT
        #10;

        enable = 0;  // Disable the ALU output
        #10;

        $finish;  // End the simulation
    end
endmodule