`timescale 1ns / 1ps

module TopDesign(
    input wire Clk,          // System clock
    input wire Reset,        // System reset
    output wire [6:0] out7,  // 7-segment display outputs
    output wire [7:0] en_out // 7-segment enable outputs
);

    // Intermediate signals
    wire [31:0] Instruction; // 32-bit instruction from the InstructionFetchUnit
    wire [31:0] PCResult;    // 32-bit PCResult from the InstructionFetchUnit
    wire ClkDivOut;          // Output of the clock divider

    // Instantiate Clock Divider
    ClkDiv clk_div(
        .Clk(Clk),
        .Reset(1'b0),       // Reset of ClkDiv must be inactive if using synchronous Reset
        .ClkOut(ClkDivOut)
    );

    // Instantiate Instruction Fetch Unit
    InstructionFetchUnit ifu(
        .Instruction(Instruction), 
        .PCResult(PCResult), 
        .Reset(Reset), 
        .Clk(ClkDivOut)
    );

    // Instantiate Two4DigitDisplay
    Two4DigitDisplay display(
        .Clk(Clk),                   // Use the original clock for display multiplexing
        .NumberA(Instruction[15:0]), // Lower 16 bits of the Instruction
        .NumberB(PCResult[15:0]),    // Lower 16 bits of the PCResult
        .out7(out7),                 // Connect to the 7-segment display outputs
        .en_out(en_out)              // Connect to the 7-segment enable outputs
    );

endmodule
