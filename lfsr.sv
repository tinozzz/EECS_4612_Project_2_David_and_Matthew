//---------------------------------------------------------
//--------------------------------------------------------

module testbench();
    logic [3:0]seed;
    logic rst;
    logic clk;
    logic load;
    logic q;
    logic [3:0]out;
    // The device under test
    lfsr dut(q, clk, rst, seed, load, out);

	`include "testfixture.verilog"
    
endmodule

module lfsr(q, clk, rst, seed, load,out);
output q;
input [3:0] seed;
input load;
input rst;
output [3:0]out; 
wire [3:0] outS;
wire [3:0] inS;
input clk;

flipflop FlipF[3:0] (outS, clk, rst, inS);
mux MUXS[3:0] (inS, load, seed, {outS[2],outS[1],outS[0],feed_back});

xor XORG(feed_back, outS[2], outS[3]);

assign q = feed_back;
assign out = outS;

endmodule

module mux(q, control, a, b);
output q;
reg q;
input control, a, b;
wire notcontrol;


always @(control or notcontrol or a or b)
q = (control & a)|(notcontrol & b);

not(notcontrol, control);

 
endmodule 

module flipflop(q, clk, rst, d);
input clk;
input rst;
input d;
output q;
reg q;
always @(posedge clk or posedge rst)
begin
if (rst)
q = 0;
else
q = d;
end
endmodule

