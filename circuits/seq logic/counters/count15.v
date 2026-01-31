module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);

    reg [3:0]count;
    
    always@(posedge clk)begin
        if(reset) 
            count<=4'b0000;
        else
            count <= count + 1;
    end
   assign q=count;
endmodule
