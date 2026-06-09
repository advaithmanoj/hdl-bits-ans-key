

//64 bit arithmetic shift reg
//sync load , both L,R
/*amount: Chooses which direction and how much to shift.
2'b00: shift left by 1 bit.
2'b01: shift left by 8 bits.
2'b10: shift right by 1 bit.
2'b11: shift right by 8 bits.*/

module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 

  always@(posedge clk)begin
    if(load) 
      q <= data;
    else begin
    if (ena)begin
    if (amount==2'b00)
      q <= q<<1;
    else if (amount==2'b01)
      q <= q<<8;
    else if (amount==2'b10)
        q <= {q[63],q[63:1]};
    else if (amount==2'b11)
      q <= {{8{q[63]}},q[63:8]};    ///q<<<8 didnt work beacuse the tool thought q was a unsigned no arithmetic Rshift works only on signed values
    end
    else 
      q <= q;
    end
  end
endmodule
