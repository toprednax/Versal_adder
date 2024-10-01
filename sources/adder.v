`timescale 1ns / 1ps

module adder #(
    parameter integer  ADDER_SIZE   = 1024, // multiple of 8
    parameter integer  NB_LOOKAHEAD = 128   // ADDER_SIZE / 8
)(
    input wire                  clk,
    input wire                  resetn,
    
    input wire [ADDER_SIZE-1:0]   A,
    input wire [ADDER_SIZE-1:0]   B,
    input wire                    cin,

    output wire [ADDER_SIZE-1:0]  out,
    output wire                   cout
    );
    
    reg  [ADDER_SIZE-1:0] outreg;
    reg                   coutreg;
    wire [NB_LOOKAHEAD:0] carryint;
    wire [ADDER_SIZE-1:0] outint;
    
    assign carryint[0] = cin;
    always @(posedge clk) begin
        if (~resetn) begin 
            outreg <= 'b0;
            coutreg <= 'b0; 
        end else begin 
            outreg <= outint;
            coutreg <= carryint[NB_LOOKAHEAD]; 
        end
    end
    
    generate genvar i;
    for (i = 0; i < NB_LOOKAHEAD; i=i+1) begin: adder8_loop
        adder8 adder8(
            .A(A[i*8+7:i*8]), 
            .B(B[i*8+7:i*8]), 
            .cin(carryint[i]),
            .sum(outint[i*8+7:i*8]), 
            .cout(carryint[i+1])
        );
    end
    endgenerate 
    
    assign out = outreg;  
    assign cout = coutreg;
    
endmodule