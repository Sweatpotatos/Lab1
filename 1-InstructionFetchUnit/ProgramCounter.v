`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 1
// Module - pc_register.v
// Description - 32-Bit program counter (PC) register.
//
// INPUTS:-
// Address: 32-Bit address input port.
// Reset: 1-Bit input control signal.
// Clk: 1-Bit input clock signal.
//
// OUTPUTS:-
// PCResult: 32-Bit registered output port.
//
// FUNCTIONALITY:-
// Design a program counter register that holds the current address of the 
// instruction memory.  This module should be updated at the positive edge of 
// the clock. The contents of a register default to unknown values or 'X' upon 
// instantiation in your module.  
// You nso preed to enable global reset of your datapath to point 
// to the first instruction in your instruction memory (i.e., the first address 
// location, 0x00000000H).
////////////////////////////////////////////////////////////////////////////////
module ProgramCounter(Address, PCResult, Reset, Clk);

    input [31:0] Address;      // 32-bit input address, the next PC value
    input Reset, Clk;          // 1-bit Reset signal and 1-bit Clock signal

    output reg [31:0] PCResult; // 32-bit output representing the current PC value

    // Always block triggered on the rising edge of the clock or when Reset is high
    always @(posedge Clk or posedge Reset) begin
        if (Reset) begin
            PCResult <= 32'b0; // Reset the PC to 0x00000000
        end
        else begin
            PCResult <= Address; // Update the PC with the new address
        end
    end

endmodule


