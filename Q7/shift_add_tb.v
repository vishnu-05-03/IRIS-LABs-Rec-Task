// Creator : M N Vishnu
// Roll No : 211EC229
// github  : vishnu-05-03

/********************************************************************************************************
********************************************************************************************************/

`timescale 1ns/1ns
`include "shift_add.v"
`default_nettype none

// testbench for shift and add multiplier.
module testbench;

// declare the parameter
parameter N = 8;

// declare the input and output
reg i_clk, i_rstn, i_start;
reg [N-1:0] i_A, i_B;
wire [N*2-1:0] o_product;
wire o_stop;

// instantiate the module
shift_add dut(i_A, i_B, i_start, i_clk, i_rstn, o_product, o_stop);

// dump the output in vcd file for waveform generation
initial begin
    $dumpfile("s_add.vcd");
    $dumpvars();
end

// clock generation block with 5ns period
initial i_clk=0;
always #5 i_clk=~i_clk;

// test cases
initial begin
    i_rstn = 0;
    i_start = 0;
    i_A = 8'b00100000;
    i_B = 8'b00010010;
    #20;
    i_rstn = 1;
    i_start = 1;
    #200 i_rstn = 0;
    i_start = 0;
    #10 i_rstn = 1;
    i_start = 1;

    i_A = 8'b00110001;
    i_B = 8'b00010010;

    #200 $finish;
end

endmodule

/********************************************************************************************************
********************************************************************************************************/