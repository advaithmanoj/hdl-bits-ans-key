//LFSR is shift reg with xor gates to produce the next state of shift reg
//diff state means diff behaviour?
//the bit that u shift in is generally generated from other 2 bits xor
//taps just means bit
//if n bits are present this lfsr max can have (2^n -1)
module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
); 
    wire tap5,tap3;
    always@(posedge clk)begin
        if(reset)
            q <= 5'h1; //11111
        else
            q <= {tap5,q[4],tap3,q[2:1]};
    end
    
    assign tap3 = q[3]^q[0];
    assign tap5 = q[0];
endmodule
