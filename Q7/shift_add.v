// Creator : M N Vishnu
// Roll No : 211EC229
// github  : vishnu-05-03

/********************************************************************************************************
********************************************************************************************************/

// verilog modified shift and add multiplier.
// module for shift and add multiplier.
module shift_add (i_DataA, i_DataB, i_start, i_clk, i_rstn, o_product, o_stop);
    // declare the parameter
    parameter N = 8;
    localparam s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;

    // declare the input and output
    input[N-1:0] i_DataA, i_DataB;
    input i_start;
    output[N*2-1:0] o_product;
    input i_clk, i_rstn;
    output reg o_stop;

    // declare the internal signal
    reg [1:0] state, next_state;
    reg [N-1:0] a, q;
    reg carry;
    reg [N:0] sum;
    
    // assign the output
    assign o_product = {a, q};

    // assigning the counter varialble with N
    integer i = N;

    // state register
    always @(posedge i_clk or negedge i_rstn) begin
        if (!i_rstn) begin
            state <= s0;
            a <= 0;
            q <= i_DataA;
            o_stop <= 0;
            i <= N;
        end
        else begin
            state <= next_state;
            a <= a;
            q <= q;
            o_stop <= o_stop;
        end
    end

    // state transition
    always @(*) begin
        case (state)
            s0: begin
                if (i_start) begin      // start if the i_start is 1 by assigning next state to s1
                    o_stop = 0;
                    next_state = s1;
                end
                else begin              // else assign the next state to s0
                    next_state = s0;
                end
            end
            s1: begin
                if (q[0]) begin         // check if the LSB of q is 1
                    next_state = s2;    // add the multiplicand to the register A and shift the register A_Q to the right by 1 bit
                end
                else begin
                    next_state = s3;    // shift the register A_Q to the right by 1 bit
                end

                if (i == 0) begin       // check if the counter is zero i.e., the multiplication is done
                    o_stop = 1;         // stop the multiplication
                end
                else begin
                    o_stop = 0;         // continue the multiplication
                end
            end
            s2: begin                   // add the multiplicand to the register A and shift the register A_Q to the right by 1 bit
                if(!o_stop)
                next_state = s1;
            end
            s3: begin                   // shift the register A_Q to the right by 1 bit
                if(!o_stop)
                next_state = s1;
            end
            default: begin
                next_state = s0;        // default state is s0
            end
        endcase
    end

    // state output

    always @(*) begin
        case (state)
            s0: begin
                a = 0;          // intilize the register A to 0 during the start of the multiplication
                q = i_DataA;    // initilize the register Q with dataA during the start of the multiplication
                carry = 0;      // initilize the carry to 0 during the start of the multiplication
            end
            s1: begin           // no change in the register A and Q in this state as the condition is checked in the state transition
                a <= a;
                q <= q;
                carry <= carry;
            end
            s2: begin if(!o_stop) begin
                sum = a + i_DataB;  // add the multiplicand to the register A and store the sum in the register sum
                a = sum[N-1:0];     // assign the lower N bits of the sum to the register A
                q = q >> 1;         // shift the register Q to the right by 1 bit
                q[N-1] = a[0];      // assign the LSB of the register A to the MSB of the register Q
                a = a >> 1;         // shift the register A to the right by 1 bit
                a[N-1] = carry;     // assign the carry to the MSB of the register A
                carry = sum[N];     // update the carry with the MSB of the sum
                i = i - 1;          // decrement the counter
                end
            end
            s3: begin if (!o_stop) begin
                q = q >> 1;         // shift the register Q to the right by 1 bit
                q[N-1] = a[0];      // assign the LSB of the register A to the MSB of the register Q
                a = a >> 1;         // shift the register A to the right by 1 bit
                a[N-1] = carry;     // assign the carry to the MSB of the register A
                carry = 0;          // assign the carry to 0 since no carry is generated in this state
                i = i - 1;          // decrement the counter
                end
            end
            
        endcase
    end

endmodule

/********************************************************************************************************
********************************************************************************************************/