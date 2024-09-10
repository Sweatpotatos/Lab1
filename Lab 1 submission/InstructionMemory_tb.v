`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 
// Module - InstructionMemory_tb.v
// Description - Test the 'InstructionMemory.v' module.
////////////////////////////////////////////////////////////////////////////////

module InstructionMemory_tb(); 

    wire [31:0] Instruction;  // Output wire to hold the instruction read from memory
    reg [31:0] Address;       // Register to hold the address input to the InstructionMemory

    // Instantiate the InstructionMemory module
	InstructionMemory u0(
		.Address(Address),
        .Instruction(Instruction)
	);
    initial begin
        // Test Case 1: Address 0x00000000
        Address = 32'h00000000;
        #10; // Wait for 10 time units
        $display("Address: %h, Instruction: %h", Address, Instruction);

        // Test Case 2: Address 0x00000004
        Address = 32'h00000004;
        #10; // Wait for 10 time units
        $display("Address: %h, Instruction: %h", Address, Instruction);

        // Test Case 3: Address 0x00000008
        Address = 32'h00000008;
        #10; // Wait for 10 time units
        $display("Address: %h, Instruction: %h", Address, Instruction);

        // Test Case 4: Address 0x0000000C
        Address = 32'h0000000C;
        #10; // Wait for 10 time units
        $display("Address: %h, Instruction: %h", Address, Instruction);

        // Test Case 5: Address 0x00000010
        Address = 32'h00000010;
        #10; // Wait for 10 time units
        $display("Address: %h, Instruction: %h", Address, Instruction);

        // Test Case 6: Address 0x00000020 (Out of first few range)
        Address = 32'h00000014;
        #10; // Wait for 10 time units
        $display("Address: %h, Instruction: %h", Address, Instruction);

        // Test Case 7: Address 0x0000007C (Last index)
        Address = 32'h00000018;
        #10; // Wait for 10 time units
        $display("Address: %h, Instruction: %h", Address, Instruction);

        // End simulation
        $stop;
    end

endmodule
