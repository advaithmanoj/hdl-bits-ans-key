//same like the eariler lfsr

module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
wire tap;
    always@(posedge KEY[0])begin
        if (KEY[1]) 
            LEDR <= SW;
        else
            LEDR <= {tap,LEDR[0],LEDR[2]};
    end
    assign tap = LEDR[2]^LEDR[1];
endmodule

