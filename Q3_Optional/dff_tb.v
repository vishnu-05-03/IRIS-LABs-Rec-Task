//Verilog test bench for a D flipflop with asynchronous active low reset.
// Name : M N Vishnu
// Reg No : 211EC229

/**********************************************************************
**********************************************************************/

`timescale 1ns/1ns
`include "dff.v"

//testbench  module for a D flipflop with asynchronous active low reset.
module dff_tb;

reg d,clk,rst;
wire q;

dff dut(q,d,clk,rst);

initial begin
    $dumpfile("dff_tb.vcd");
    $dumpvars();
end

// clock generation
initial clk=0;
always #5 clk=~clk;

// input and reset generation
initial begin
    rst = 0;
    d = 0;
    #20;
    d = 1;
    rst = 1;
    #20;

    d = 1; #10;
    d = 0; #10;
    d = 1; #10;
    d = 1; #10;
    d = 0; #10;
    d = 1; #10;
    d = 0; #10;
    d = 1; #10;
    d = 0; #10;
    d = 1; #10;
    d = 1; #10;
    d = 0; #10;
    d = 1; #10;
    d = 0; #10;
    d = 1; #10;
    d = 0; #10;
    d = 1; #10;
    d = 0; #10;
    d = 1; #10;
    $finish;
end

endmodule

/**********************************************************************
**********************************************************************/