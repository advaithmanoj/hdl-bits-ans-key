module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    
    reg [7:0]q;
    wire [7:0]posedgew,negedgew,anyedgew ;
    
    //dff
    always@(posedge clk)begin
        q<=in;
        anyedge<=anyedgew ;
    end
    
    assign posedgew = in & ~q; // posedge detection when current input is 1 and prev value is 0
    assign negedgew = ~in & q;
    assign anyedgew = posedgew | negedgew;
    
endmodule
