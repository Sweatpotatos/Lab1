`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members:
// Overall percent effort of each team meber: Group 20, Yaolei Bian 33.3%, Mohammed Alrkhayes 33.3%, Allen Leinberger 33.3%
// 
// ECE369A - Computer Architecture
// Laboratory 3 (PostLab)
// Module - InstructionFetchUnit.v
// Description - Fetches the instruction from the instruction memory based on 
//               the program counter (PC) value.
// INPUTS:-
// Reset: 1-Bit input signal. 
// Clk: Input clock signal.
//
// OUTPUTS:-
// Instruction: 32-Bit output instruction from the instruction memory. 
//              Decimal value diplayed 
// PCResult: 32-Bit output PCResult from the program counter. 
//              Decimal value diplayed 
// FUNCTIONALITY:-
// Please connect up the following implemented modules to create this
// 'InstructionFetchUnit':-
//   (a) ProgramCounter.v
//   (b) PCAdder.v
//   (c) InstructionMemory.v
// Connect the modules together in a testbench so that the instruction memory
// outputs the contents of the next instruction indicated by the memory location
// in the PC at every clock cycle. Please initialize the instruction memory with
// some preliminary values for debugging purposes.
//
// @@ The 'Reset' input control signal is connected to the program counter (PC) 
// register which initializes the unit to output the first instruction in 
// instruction memory.
// @@ The 'Instruction' output port holds the output value from the instruction
// memory module.
// @@ The 'Clk' input signal is connected to the program counter (PC) register 
// which generates a continuous clock pulse into the module.
////////////////////////////////////////////////////////////////////////////////
module InstructionFetchUnit(
    output [31:0] Instruction,  // 32-bit output instruction from the instruction memory
    output [31:0] PCResult,     // 32-bit output PCResult from the program counter
    input Reset,                // 1-bit input reset signal
    input Clk                   // Input clock signal
);

    wire [31:0] PCNext;        

  
    ProgramCounter PC(
        .Address(PCNext), 
        .PCResult(PCResult), 
        .Reset(Reset), 
        .Clk(Clk)
    );


    PCAdder Adder(
        .PCResult(PCResult), 
        .PCAddResult(PCNext)
    );

 
    InstructionMemory IM(
        .Address(PCResult), 
        .Instruction(Instruction)
    );

endmodule
