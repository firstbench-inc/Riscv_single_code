`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2024 14:25:49
// Design Name: 
// Module Name: test_tb
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


module test_tb();
    
logic [31:0] instruction;
logic [31:0]AluResult;
logic clk;
logic [2:0] AluCtrl;
logic [1:0] ALUOp;
logic [1:0] ImmSrc;
logic [31:0] RD1;
logic [31:0] RD2,ReadData;
logic [31:0] WriteData;
logic regwrite, MemWrite,DmWrite;
logic [1:0] ResultSrc;
logic [31:0] ImmExt,WriteData_dm;
logic  AluSrc;
logic [31:0] SrcB;
logic [31:0] Result,meminp;
logic [4:0]WriteLoc, writetf,readfrom;
logic [10:0] controls;
test test(
    .instruction(instruction),
    .clk(clk),
    .AluResult(AluResult),
    .regwrite(regwrite),
    .WriteData(WriteData),
    .WriteData_dm(WriteData_dm),
    .AluCtrl(AluCtrl),
    .AluSrc(AluSrc),
    .WriteLoc(WriteLoc),
    .controls(controls),
    .ALUOp(ALUOp),
    .ImmSrc(ImmSrc),
    .ImmExt(ImmExt),
    .RD1(RD1),
    .RD2(RD2),
    .SrcB(SrcB),
    .writetf(writetf),
    .readfrom(readfrom),
    .MemWrite(MemWrite),
    .DmWrite(DmWrite),
    .ResultSrc(ResultSrc),
//    .wd3(wd3),
    .Result(Result),
    .meminp(meminp),
//    .readport(readport),
    .ReadData(ReadData)
    //.check(check)
    );


// always clk = ~clk;
initial begin
        clk = 1;
        forever #5 clk = ~clk; // Clock period of 10 time units
    end
    




initial begin
        clk = 1;
        regwrite = 1;
        WriteData = 1;
        WriteLoc = 1;  

        #40;
        regwrite = 1;//rs1 v=2, at x0
        
        WriteLoc = 5'b00011;
        WriteData = 1;
        #40;
        regwrite = 1;//rs2=3 at x1
        
        WriteLoc = 5'b00010;
         WriteData = 1;

        #40;
        regwrite = 0;
        WriteData = 0;
        instruction = 32'b0100000_00011_00010_000_00001_0110011;// 2-3=-1,120ns
        
        #40;
          regwrite = 0;
                WriteData = 0;

          instruction = 32'b00000000000100010000000000110011; 
        
        #80;

    //load word inst
    //assign writetf=AluResult;
   /* regwrite=1;
    WriteData=9;
     WriteLoc=9;*/
   // so manually you will have to write it in
   regwrite = 1;//rs1 v=2, at x0
   WriteData = 9;
   WriteLoc = 9;
   #20;
  // so manually 
    //meminp = 5'b10001;
    //DmWrite = 1;
    ////WriteData_dm = 3;
    #40
    instruction= 32'hFFC4A303;
    
    
    //DmWrite=0;
//    regwrite = 1;//rs1 v=2, at x0
//    WriteData = 10;
//    WriteLoc = 6;
//    #50;
//    instruction= 32'h0064A423; 
//    //MemWrite=1;
  

       

 end
    


endmodule