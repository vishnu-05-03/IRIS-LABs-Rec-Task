### Question:
Write Verilog Code for a D flipflop with asynchronous active low reset with proper testbench.

## Module Description:
This module implements a D flip-flop with asynchronous active low reset. The D flip-flop is a sequential circuit that has a data input (d), a clock input (clk), and a reset input (rst). The data input is used to set the output (q) on the next clock edge. The reset input is used to clear the output to 0.

## Module Parameters:

- None

## Module Inputs:

- ```d```: The data input to the flip-flop.
- ```clk```: The clock input to the flip-flop.
- ```rst```: The reset input to the flip-flop.

## Module Outputs:

- ```q```: The output of the flip-flop.

## Module Internal Signals:

- ```q```: The internal state of the flip-flop.

## Module Operation:

- On the rising edge of the clock, the output (q) is set to the value of the data input (d).
- If the reset input (rst) is asserted, the output (q) is cleared to 0.

## Simulation Output Waveforms
- In the below waveform we can see that the reset given here is active low.
- Output of the D flip flop follows the input in the next clock cycle. That can be observed here
- and all the transitions take place at positive clock edge
![waveform](https://github.com/vishnu-05-03/IRIS-LABs-Rec-Task/blob/main/Q3_Optional/2nd%20output%20waveform.png)

### Module Future Work:

The following are some possible future work items for the dff module:

- Support for synchronous reset.
- Support for negative edge-triggered clocks.
- Support for multiple data inputs.
- Support for multiple clock inputs.
