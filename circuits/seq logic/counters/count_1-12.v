module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //   //in the question a 1-12 counter with reset and enable to be designed, and a count4 to be instantiated to check the working?
    
    always@(posedge clk)begin
        if (reset | (enable & (Q==12)))
            Q <= 1;
        else
            if (enable)
                Q <= Q + 1;
    end

  assign c_enable = enable;
    assign c_load = (reset | ((Q == 12) & enable));
  assign c_d = 1;
    count4 the_counter (clk, c_enable, c_load, c_d /*, ... */ );

endmodule
