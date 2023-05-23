// testbench for dect_0.v
`timescale 1ns / 1ns
`include "dect_0.v"

module dect_0_tb;

reg clk, rst;
reg[2:0] inp;
wire[1:0] outp;

dect_0 dut(clk, rst, inp, outp);

initial begin
    $dumpfile("dect_0.vcd");
    $dumpvars();
end

// clock generation
initial clk = 0;
always #5 clk = ~clk;

// input and reset generation
initial begin
    rst = 0;
    inp = 0;
    #40;
    inp = 1;
    rst = 1;
    #10 rst = 0;
    #20;
    $finish;
end

endmodule