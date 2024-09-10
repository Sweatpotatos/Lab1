`timescale 1ns / 1ps
//Group 20, Yaolei Bian, Mohammed Alrkhayes, Allen Leinberger
module Top(
    input wire Clk,          // System clock
    input wire Reset,        // System reset
    output wire [6:0] out7,  // 7-segment display outputs
    output wire [7:0] en_out // 7-segment enable outputs
);

    // Intermediate signals
    wire [31:0] Instruction; // 32-bit instruction from the InstructionFetchUnit
    wire [31:0] PCResult;    // 32-bit PCResult from the InstructionFetchUnit
    wire ClkDivOut;          // Output of the clock divider


    ClkDiv clk_div(
        .Clk(Clk),
        .Rst(1'b0),      
        .ClkOut(ClkDivOut)
    );

  
    InstructionFetchUnit ifu(
        .Instruction(Instruction), 
        .PCResult(PCResult), 
        .Reset(Reset), 
        .Clk(ClkDivOut)
    );

    // Instantiate Two4DigitDisplay
    Two4DigitDisplay display(
        .Clk(Clk),                
        .NumberA(Instruction[15:0]), 
        .NumberB(PCResult[15:0]),    
        .out7(out7),               
        .en_out(en_out)    
    );

endmodule
