`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2024 23:25:11
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(input logic [31:0] AluResult,
                    input logic [1:0] ResultSrc,
                    //input logic [31:0] address,
                    input [4:0]writetf,readfrom,
                   input logic clk,
                   input logic MemWrite,DmWrite,
                   input logic [31:0]WriteData,WriteData_dm,
                   output logic [31:0]Result, 
                   output logic [31:0] ReadData,
                   input logic [4:0]meminp

    );
 //logic [31:0] ReadData;
logic [31:0] memory [1023:0]; // size 2^31, with each element being 32bits in size

    always_ff @(posedge clk ) begin
    //memory[AluResult]=33;
        if (MemWrite) begin
            memory[AluResult] <= WriteData;
            //ReadData <= memory[AluResult];
        end
        //address= readfrom;
        
    end
 
    always_ff @(posedge clk) begin
        //memory[0][0]=1;
        if (DmWrite) begin
            memory[meminp] <= WriteData_dm; // you need to write something to memory to be able to read from it later that swhy write in it using meminp
            //address=memory[meminp]+AluResut;
        end
end
always_comb begin
    
        ReadData = memory[AluResult];  // Otherwise, read from memory
//        readport= memory[AluResult];
    
end    

 
endmodule