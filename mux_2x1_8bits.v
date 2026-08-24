//Chamada do mux 2x1 para formar um Mux de 8 bits

module mux_2x1_8bits (
    input  wire [7:0] in,
    input  wire [7:0] notIn,
    input  wire       sel, // passar o bit de maior valor in[7] para ser o seletor
    output wire [7:0] out
);
    
    mux_2x1 u0 (.in(in[0]), .notIn(notIn[0]), .sel(sel), .out(out[0]));
    mux_2x1 u1 (.in(in[1]), .notIn(notIn[1]), .sel(sel), .out(out[1]));
    mux_2x1 u2 (.in(in[2]), .notIn(notIn[2]), .sel(sel), .out(out[2]));
    mux_2x1 u3 (.in(in[3]), .notIn(notIn[3]), .sel(sel), .out(out[3]));
    mux_2x1 u4 (.in(in[4]), .notIn(notIn[4]), .sel(sel), .out(out[4]));
    mux_2x1 u5 (.in(in[5]), .notIn(notIn[5]), .sel(sel), .out(out[5]));
    mux_2x1 u6 (.in(in[6]), .notIn(notIn[6]), .sel(sel), .out(out[6]));
    mux_2x1 u7 (.in(in[7]), .notIn(notIn[7]), .sel(sel), .out(out[7]));
    
endmodule
