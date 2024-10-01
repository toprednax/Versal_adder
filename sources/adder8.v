`timescale 1ns / 1ps

module adder8(

    input wire [7:0] A,
    input wire [7:0] B,
    input wire       cin,
    
    output wire [7:0] sum,
    output wire cout
    );
    
    wire [7:0] prop;
    wire [7:0] coutint;
    wire COUTB, COUTD, COUTF;
    
    LUT6CY #(
    .INIT(64'b0000000000001110000000000000100000000000000010010000000000000110)  // Logic function
    )
    LUT6CY_inst0 (
       .O51(sum[0]),         // 1-bit output: LUT
       .O52(coutint[0]),     // 1-bit output: LUT
       .PROP(prop[0]),       // 1-bit output: LUT
       .I0(A[0]),     // 1-bit input: LUT
       .I1(B[0]),     // 1-bit input: LUT
       .I2(1'b0),     // 1-bit input: LUT
       .I3(1'b0),     // 1-bit input: LUT
       .I4(cin)      // 1-bit input: LUT
    );
    
    LUT6CY #(
    .INIT(64'b0000000000001000000000000000100000000000000010010000000000000110)  // Logic function
    )
    LUT6CY_inst1 (
       .O51(sum[1]),   // 1-bit output: LUT
       .O52(coutint[1]),   // 1-bit output: LUT
       .PROP(prop[1]), // 1-bit output: LUT
       .I0(A[1]),     // 1-bit input: LUT
       .I1(B[1]),     // 1-bit input: LUT
       .I2(1'b0),     // 1-bit input: LUT
       .I3(1'b0),     // 1-bit input: LUT
       .I4(coutint[0])      // 1-bit input: LUT
    );
   
    LUT6CY #(
    .INIT(64'b0000000000001110000000000000100000000000000010010000000000000110)  // Logic function
    )
    LUT6CY_inst2 (
       .O51(sum[2]),   // 1-bit output: LUT
       .O52(coutint[2]),   // 1-bit output: LUT
       .PROP(prop[2]), // 1-bit output: LUT
       .I0(A[2]),     // 1-bit input: LUT
       .I1(B[2]),     // 1-bit input: LUT
       .I2(1'b0),     // 1-bit input: LUT
       .I3(1'b0),     // 1-bit input: LUT
       .I4(COUTB)      // 1-bit input: LUT
    );
    
    LUT6CY #(
    .INIT(64'b0000000000001000000000000000100000000000000010010000000000000110)  // Logic function
    )
    LUT6CY_inst3 (
       .O51(sum[3]),   // 1-bit output: LUT
       .O52(coutint[3]),   // 1-bit output: LUT
       .PROP(prop[3]), // 1-bit output: LUT
       .I0(A[3]),     // 1-bit input: LUT
       .I1(B[3]),     // 1-bit input: LUT
       .I2(1'b0),     // 1-bit input: LUT
       .I3(1'b0),     // 1-bit input: LUT
       .I4(coutint[2])      // 1-bit input: LUT
    );
    
    LUT6CY #(
    .INIT(64'b0000000000001110000000000000100000000000000010010000000000000110)  // Logic function
    )
    LUT6CY_inst4 (
       .O51(sum[4]),   // 1-bit output: LUT
       .O52(coutint[4]),   // 1-bit output: LUT
       .PROP(prop[4]), // 1-bit output: LUT
       .I0(A[4]),     // 1-bit input: LUT
       .I1(B[4]),     // 1-bit input: LUT
       .I2(1'b0),     // 1-bit input: LUT
       .I3(1'b0),     // 1-bit input: LUT
       .I4(COUTD)      // 1-bit input: LUT
    );
    
    LUT6CY #(
    .INIT(64'b0000000000001000000000000000100000000000000010010000000000000110)  // Logic function
    )
    LUT6CY_inst5 (
       .O51(sum[5]),   // 1-bit output: LUT
       .O52(coutint[5]),   // 1-bit output: LUT
       .PROP(prop[5]), // 1-bit output: LUT
       .I0(A[5]),     // 1-bit input: LUT
       .I1(B[5]),     // 1-bit input: LUT
       .I2(1'b0),     // 1-bit input: LUT
       .I3(1'b0),     // 1-bit input: LUT
       .I4(coutint[4])      // 1-bit input: LUT
    );
    
    LUT6CY #(
    .INIT(64'b0000000000001110000000000000100000000000000010010000000000000110)  // Logic function
    )
    LUT6CY_inst6 (
       .O51(sum[6]),   // 1-bit output: LUT
       .O52(coutint[6]),   // 1-bit output: LUT
       .PROP(prop[6]), // 1-bit output: LUT
       .I0(A[6]),     // 1-bit input: LUT
       .I1(B[6]),     // 1-bit input: LUT
       .I2(1'b0),     // 1-bit input: LUT
       .I3(1'b0),     // 1-bit input: LUT
       .I4(COUTF)      // 1-bit input: LUT
    );
    
   LUT6CY #(
    .INIT(64'b0000000000001000000000000000100000000000000010010000000000000110)  // Logic function
    )
    LUT6CY_inst7 (
       .O51(sum[7]),   // 1-bit output: LUT
       .O52(coutint[7]),   // 1-bit output: LUT
       .PROP(prop[7]), // 1-bit output: LUT
       .I0(A[7]),     // 1-bit input: LUT
       .I1(B[7]),     // 1-bit input: LUT
       .I2(1'b0),     // 1-bit input: LUT
       .I3(1'b0),     // 1-bit input: LUT
       .I4(coutint[6])      // 1-bit input: LUT
    );
    
    LOOKAHEAD8 #(
   .LOOKB("TRUE"), // (FALSE, TRUE)
   .LOOKD("TRUE"), // (FALSE, TRUE)
   .LOOKF("TRUE"), // (FALSE, TRUE)
   .LOOKH("TRUE")  // (FALSE, TRUE)
    )
    LOOKAHEAD8_inst (
       .COUTB(COUTB), // 1-bit output: Output of Carry Look-Ahead mux
       .COUTD(COUTD), // 1-bit output: Output of Carry Look-Ahead mux
       .COUTF(COUTF), // 1-bit output: Output of Carry Look-Ahead mux
       .COUTH(cout), // 1-bit output: Output of Carry Look-Ahead mux
       .CIN(cin),     // 1-bit input: Input of Carry Look-Ahead mux
       .CYA(coutint[0]),     // 1-bit input: Input of Carry Look-Ahead mux
       .CYB(coutint[1]),     // 1-bit input: Input of Carry Look-Ahead mux
       .CYC(coutint[2]),     // 1-bit input: Input of Carry Look-Ahead mux
       .CYD(coutint[3]),     // 1-bit input: Input of Carry Look-Ahead mux
       .CYE(coutint[4]),     // 1-bit input: Input of Carry Look-Ahead mux
       .CYF(coutint[5]),     // 1-bit input: Input of Carry Look-Ahead mux
       .CYG(coutint[6]),     // 1-bit input: Input of Carry Look-Ahead mux
       .CYH(coutint[7]),     // 1-bit input: Input of Carry Look-Ahead mux
       .PROPA(prop[0]), // 1-bit input: Input of Carry Look-Ahead mux
       .PROPB(prop[1]), // 1-bit input: Input of Carry Look-Ahead mux
       .PROPC(prop[2]), // 1-bit input: Input of Carry Look-Ahead mux
       .PROPD(prop[3]), // 1-bit input: Input of Carry Look-Ahead mux
       .PROPE(prop[4]), // 1-bit input: Input of Carry Look-Ahead mux
       .PROPF(prop[5]), // 1-bit input: Input of Carry Look-Ahead mux
       .PROPG(prop[6]), // 1-bit input: Input of Carry Look-Ahead mux
       .PROPH(prop[7])  // 1-bit input: Input of Carry Look-Ahead mux
    );

endmodule
