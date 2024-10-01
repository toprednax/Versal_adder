`timescale 1ns / 1ps

module adder_hweval(

    input wire clk,
    input wire resetn,
    
    input wire [127:0] inA,
    input wire [127:0] inB,
    
    output wire [100:0] out
    );
    
    reg  [1023:0] in0, in1;
    wire [1023:0] outAdd;
    wire cout;
    
    always @(posedge clk) begin
        in0 <= {inA, inB, inA, inB, inB, inB, inB, inA};
        in1 <= {inA, inB, inB, inB, inA, inA, inB, inB};
    end
    
    assign out = {outAdd[1023:924],cout};
    
    adder #(
        .ADDER_SIZE(1024),
        .NB_LOOKAHEAD(128)
    )
    inst_adder(
        .clk(clk),
        .resetn(resetn),
        
        .A(in0),
        .B(in1),
        .cin(1'b0),
        
        .out(outAdd),
        .cout(cout)
    );
    
//    reg [383:0] outAddreg;
//    reg coutreg;
//    always @(posedge clk) begin
//        {coutreg, outAddreg} <= in0 + in1; 
//    end
    
//    assign outAdd = outAddreg;
//    assign cout = coutreg;
 
endmodule
