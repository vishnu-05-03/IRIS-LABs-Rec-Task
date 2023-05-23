//Verilog Code for a D flipflop with asynchronous active low reset.
// Name : M N Vishnu
// Reg No : 211EC229

/**********************************************************************
**********************************************************************/

// module for a D flipflop with asynchronous active low reset.
module dff(q,d,clk,rst);

// declare the input and output ports
output q;
input d,clk,rst;

// declare the internal signal
reg q;

// flipflop
always @(posedge clk or negedge rst)
begin
    if(rst==0)
        q<=0;
    else
        q<=d;
end

endmodule

/**********************************************************************
**********************************************************************/