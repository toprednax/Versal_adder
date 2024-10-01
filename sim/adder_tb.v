`timescale 1ns / 1ps
`define CLK_PERIOD  10
`define CLK_HALF     5

module adder_tb();

    reg clk;
    // Generate Clock
    initial begin
        clk = 0;
        forever #`CLK_HALF clk = ~clk;
    end
    
    reg [1023:0] A,B;
    reg resetn;
    wire [1024:0] sum;
    
    adder adder(
        .inc(A),
        .prop(B),
        .clk(clk),
        .resetn(resetn),    
        
        .out(sum)
    );
    
    
    initial begin
    A <= 1024'b0;
    B <= 1024'b0;
    resetn <= 1'b0;
    #`CLK_HALF
    #`CLK_PERIOD
    resetn <= 1'b1;
    #`CLK_PERIOD
    A <= 1024'd255;
    B <= 1024'd0;
    #`CLK_PERIOD
    #`CLK_PERIOD
    A <= 1024'd255;
    B <= 1024'd1;
    #`CLK_PERIOD
    #`CLK_PERIOD
    A <= 1024'd179769313486231590772930519078902473361797697894230657273430081157732675805500963132708477322407536021120113879871393357658789768814416622492847430639474124377767893424865485276302219601246094119453082952085005768838150682342462881473913110540827237163350510684586298239947245938479716304835356329624224137215;
    B <= 1024'd179769313486231590772930519078902473361797697894230657273430081157732675805500963132708477322407536021120113879871393357658789768814416622492847430639474124377767893424865485276302219601246094119453082952085005768838150682342462881473913110540827237163350510684586298239947245938479716304835356329624224137215;
    end
endmodule
