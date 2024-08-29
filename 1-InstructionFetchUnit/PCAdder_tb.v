`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 1 
// Module - PCAdder_tb.v
// Description - Test the 'PCAdder.v' module.
////////////////////////////////////////////////////////////////////////////////

module PCAdder_tb();

    reg [31:0] PCResult;       // 32-bit register to hold the input PC value

    wire [31:0] PCAddResult;   // 32-bit wire to hold the output of PCAdder

    // Instantiate the PCAdder module
    PCAdder u0(
        .PCResult(PCResult), 
        .PCAddResult(PCAddResult)
    );

    initial begin
        // Test Case 1: Initial value of PCResult is 0
        PCResult = 32'd0;
        #10; // Wait 10 time units
        $display("PCResult: %h, PCAddResult: %h", PCResult, PCAddResult);
        
        // Test Case 2: PCResult is 4
        PCResult = 32'd4;
        #10; // Wait 10 time units
        $display("PCResult: %h, PCAddResult: %h", PCResult, PCAddResult);
        
        // Test Case 3: PCResult is 1024 (decimal)
        PCResult = 32'd1024;
        #10; // Wait 10 time units
        $display("PCResult: %h, PCAddResult: %h", PCResult, PCAddResult);
        
        // Test Case 4: PCResult is a large value
        PCResult = 32'hFFFFFFFC;
        #10; // Wait 10 time units
        $display("PCResult: %h, PCAddResult: %h", PCResult, PCAddResult);

        // End simulation
        $stop;
    end

endmodule


