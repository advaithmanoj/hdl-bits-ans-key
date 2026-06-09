//lfsr with taps at 32,22,2,1
//should do this again messed a lil up with the bits catenations
module top_module(
    input clk,
    input reset,
    output reg [31:0] q
);

    wire tap31, tap21, tap1, tap0;

    assign tap31 = q[0];
    assign tap21 = q[22] ^ q[0];
    assign tap1  = q[2]  ^ q[0];
    assign tap0  = q[1]  ^ q[0];

    always @(posedge clk) begin
        if (reset)
            q <= 32'h1;
        else
            q <= {tap31, q[31:23], tap21, q[21:3], tap1, tap0};
    end

endmodule
