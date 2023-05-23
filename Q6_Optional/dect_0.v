// Verilog code to Design a finite state machine in Verilog  that will detect more than 1 number of 0’s in the sequence of 3 samples with proper testbench and state diagram.

module dect_0 (clk, rst, inp, outp);

// Inputs
input clk;
input rst;
input[2:0] inp;

// Outputs
output reg[1:0] outp = 0;

// Internal signals
reg[1:0] state, next_state;

// local parameters
parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;

// State register
always @(posedge clk, posedge rst)
begin
    if(rst) begin
        state <= S0;
        outp <= 2'b00;
    end
    else
        state <= next_state;
end

// Next state logic
always @(*) begin

    case(state)
        S0: begin
            next_state = S1;
            outp = 2'b00;

            if(inp[0] == 1'b0) 
                outp = outp + 1'b1;
        end
        
        S1: begin
            next_state = S2;
            
            if(inp[1] == 1'b0) 
                outp = outp + 1'b1;
        end
        
        S2: begin
            next_state = S0;
            outp = outp + 1'b1 & ~inp[2];
        end
        
        default: next_state = S0;
    endcase
        
end

endmodule
