module mux4_1(s,i,y);
input [1:0]s;
input [3:0]i;
output y;
// DATA FLOW
`ifdef DATA_FLOW
assign y=(~s[0]&(~s[1])&i[0]) | (~s[0]&(s[1])&i[1]) | (s[0]&(~s[1])&i[2]) | (s[0]&(s[1])&i[3]);
// gate level
`elsif GATE
wire [5:0]w;
not g1(w[0],s[0]);
not g2(w[1],s[1]);
and g3(w[2],w[0],w[1],i[0]);
and g4(w[3],w[0],s[1],i[1]);
and g5(w[4],s[0],w[1],i[2]);
and g6(w[5],s[0],s[1],i[3]);
or  g7(y,w[5],w[4],w[2],w[3]);
// behavioural
`else
reg y;
always@ (s,i,y) begin
if (s[0]==0&&s[1]==0) begin 
	y=i[0];
end
else if (s[0]==0&&s[1]==1) begin 
	y=i[1];
end
else if (s[0]==1&&s[1]==0) begin 
	y=i[2];
end
else begin
	y=i[3];
end
end
//always@ (s,i,y) begin;
//y= s[0]?(s[1]?i[3]:i[2]):(s[1]?i[1]:i[0]);
//end
`endif
endmodule
