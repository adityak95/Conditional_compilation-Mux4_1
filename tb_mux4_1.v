`include "mux4_1.v"
module tb;
reg [1:0]s;
reg [3:0]i;
wire y;
mux4_1 dut(s,i,y);
initial begin
repeat(10) begin 
{s,i}=$random;
#5;
$display("s=%b i=%b y=%b",s,i,y);
end
$finish();
end
endmodule 
