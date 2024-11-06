`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2024 22:21:30
// Design Name: 
// Module Name: mux_3
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux_3(input logic [31:0] a,input logic [31:0] b, input logic [1:0]c, input logic [31:0]d,input logic [31:0] wd3 ,output logic [31:0] o);
always_comb begin
case(c)
2'b00:o=a;
2'b01:o=b;  
2'b10:o=d;
endcase
//o =(!c) ? a : (c[0]? b:d);
end
endmodule
