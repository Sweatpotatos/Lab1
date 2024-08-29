`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 1
// Module - ProgramCounter_tb.v
// Description - Test the 'ProgramCounter.v' module.
////////////////////////////////////////////////////////////////////////////////

module ProgramCounter_tb(); 

    reg [31:0] Address;       // 32-bit register to provide input address
    reg Reset, Clk;           // 1-bit Reset and Clock signals

    wire [31:0] PCResult;     // 32-bit wire to hold the current PC value

    // Instantiate the ProgramCounter module
    ProgramCounter u0(
        .Address(Address), 
        .PCResult(PCResult), 
        .Reset(Reset), 
        .Clk(Clk)
    );

    // Clock generation
    initial begin
        Clk <= 1'b0;
        forever #10 Clk <= ~Clk;  // Toggle the clock every 10 time units
    end

    // Test scenarios
    initial begin
        // Test Case 1: Reset the Program Counter
        Reset = 1'b1;
        Address = 32'h00000000;
        #20;  // Wait for 20 time units
        Reset = 1'b0;
        $display("After Reset: PCResult = %h", PCResult);

        // Test Case 2: Update PC with a new address
        Address = 32'h00000004;
        #20;  // Wait for 20 time units
        $display("PCResult after update: %h", PCResult);

        // Test Case 3: Update PC with another address
        Address = 32'h00001000;
        #20;  // Wait for 20 time units
        $display("PCResult after update: %h", PCResult);

        // Test Case 4: Reset the Program Counter again
        Reset = 1'b1;
        #20;  // Wait for 20 time units
        Reset = 1'b0;
        $display("After Reset: PCResult = %h", PCResult);

        // End simulation
        $stop;
    end

endmodule

