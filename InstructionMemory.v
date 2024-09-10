`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 1
// Module - InstructionMemory.v
// Description - 32-Bit wide instruction memory.
////////////////////////////////////////////////////////////////////////////////

module InstructionMemory(Address, Instruction);

    input [31:0] Address;        // Input 32-bit address

    output reg [31:0] Instruction;  // 32-bit output instruction at memory location Address

    reg [31:0] memory [0:127];   // 128 words of 32-bit memory

    integer i;
    initial begin
        for (i = 0; i < 128; i = i + 1) begin
            memory[i] = i * 32'b11;
        end
    end


    always @(Address) begin
        
        Instruction <= memory[Address[8:2]];
    end

endmodule
