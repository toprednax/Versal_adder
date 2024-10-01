`timescale 1ns / 1ps
`define CLK_PERIOD  10
`define CLK_HALF     5

module adder8_tb();

    reg clk;
    // Generate Clock
    initial begin
        clk = 0;
        forever #`CLK_HALF clk = ~clk;
    end
    
    reg [7:0] A,B;
    reg cin;
    wire [7:0] sum;
    wire cout;
    
    adder8 adder8(
        .A(A),
        .B(B),
        .cin(cin),
        
        .sum(sum),
        .cout(cout)
    );
    
    
    initial begin
    A <= 8'b0;
    B <= 8'b0;
    cin <= 1'b0;
    
    #`CLK_HALF
    #`CLK_PERIOD
    A <= 8'd255;
    B <= 8'd0;
    #`CLK_PERIOD
    A <= 8'd0;
    B <= 8'd255;
    #`CLK_PERIOD
    A <= 8'd255;
    B <= 8'd0;
    cin <= 1'b1;
    #`CLK_PERIOD
    A <= 8'd0;
    B <= 8'd0;
    cin <= 1'b1;
    #`CLK_PERIOD
    A <= 8'd0;
    B <= 8'd255;
    #`CLK_PERIOD
    A <= 8'd255;
    B <= 8'd1;
    #`CLK_PERIOD
    cin <= 1'b0;
    A <= 8'd255;
    B <= 8'd255;
    end
endmodule
