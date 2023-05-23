# Module Description:
This module implements a shift-and-add multiplier. The multiplier takes two input data words, A and B, and produces a product word P by concatinating two registers A and Q. The multiplication is performed by shifting the multiplicand (A) by one bit for each bit of the multiplier (B). The shifted multiplicand is then added to the partial product, and the carry bit is propagated to the next bit position. The process is repeated until all bits of the multiplier have been processed.

## Module Parameters:

- ```N```: The number of bits in the data words.

## Module Inputs:

* ```i_DataA```: The first data word.
* ```i_DataB```: The second data word.
* ```i_start```: The start signal. This signal is asserted to start the multiplication.
* ```i_clk```: The clock signal.
* ```i_rstn```: The reset signal. This signal is asserted to reset the module.

## Module Outputs:

* ```o_product```: The product word.
* ```o_stop```: The stop signal. This signal is asserted when the multiplication is complete.

## Module Internal Signals:

* ```state```: The current state of the multiplier.
* ```next_state```: The next state of the multiplier.
* ```a```: The partial product.
* ```q```: The shifted multiplicand.
* ```carry```: The carry bit.
* ```sum```: The sum of the partial product and the shifted multiplicand.
* ```i```: The counter. This counter is used to keep track of the number of bits that have been processed.

## Module Operation:

- The module starts in the s0 state. When the i_start signal is asserted, the module enters the s1 state. In the s1 state, the LSB of the shifted multiplicand i.e., ```Q``` is checked. If it is 1, the module enters the s2 state. If it is 0, the module enters the s3 state if it is 1.
- In the s2 state, the multiplier is added to the register ```A``` and A_Q is shifted by 1 bit. The carry bit is propagated to the next bit position. The module then enters the s1 state to recheck the condition and the loop continues until the counter value is 0.
- In the s3 state, the shifted multiplicand is shifted to the right by one bit. The carry bit is cleared. The module then enters the s1 state. The process is repeated until the counter reaches 0. When the counter reaches 0, the module enters the s0 state and the o_stop signal is asserted.


## Future work that can be done on the above module:

The following are some possible future work items for the shift_add module:

* Support for multiplying data words of different sizes.
* Support for signed multiplication.
* Support for multiple precision multiplication.
