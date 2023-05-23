# Module dect_0
This module implements a finite state machine (FSM) that detects number of 0’s in the sequence of 3 samples. The FSM has three states: S0, S1, and S2. The initial state is S0. The FSM transitions to S1 if the input is 0, and to S2 if the input is 1. The FSM transitions back to S0 if the input is 0 and the previous input was 1. The FSM outputs 0 if the current state is S0, 1 if the current state is S1, and 2 if the current state is S2.

## Inputs
- ```clk```: The clock signal.
- ```rst```: The reset signal.
- ```inp```: The input signal.

## Outputs
- ```outp```: The output signal.

## Internal signals
- ```state```: The current state of the FSM.
- ```next_state```: The next state of the FSM.

## Simulation waveform
- At each state if there is a zero then the ```outp``` is incremented by one.
- After conting total zeros in first sample it starts counting from beginning.
- Then the second sample is given.

![waveform](https://github.com/vishnu-05-03/IRIS-LABs-Rec-Task/blob/main/Q6_Optional/6th%20output%20waveform.png)
