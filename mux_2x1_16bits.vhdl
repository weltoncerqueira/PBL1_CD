module mux_2x1_16bits (
    input  wire [15:0] in,
    input  wire [15:0] notIn,
    input  wire       sel, // passar o bit de maior valor in[7] para ser o seletor
    output wire [15:0] out
);

	 mux_2x1 u0  (.in(in[0]),  .notIn(notIn[0]),  .sel(sel), .out(out[0]));
    mux_2x1 u1  (.in(in[1]),  .notIn(notIn[1]),  .sel(sel), .out(out[1]));
    mux_2x1 u2  (.in(in[2]),  .notIn(notIn[2]),  .sel(sel), .out(out[2]));
    mux_2x1 u3  (.in(in[3]),  .notIn(notIn[3]),  .sel(sel), .out(out[3]));
    mux_2x1 u4  (.in(in[4]),  .notIn(notIn[4]),  .sel(sel), .out(out[4]));
    mux_2x1 u5  (.in(in[5]),  .notIn(notIn[5]),  .sel(sel), .out(out[5]));
    mux_2x1 u6  (.in(in[6]),  .notIn(notIn[6]),  .sel(sel), .out(out[6]));
    mux_2x1 u7  (.in(in[7]),  .notIn(notIn[7]),  .sel(sel), .out(out[7]));
	 mux_2x1 u8  (.in(in[8]),  .notIn(notIn[8]),  .sel(sel), .out(out[8]));
	 mux_2x1 u9  (.in(in[9]),  .notIn(notIn[9]),  .sel(sel), .out(out[9]));
	 mux_2x1 u10 (.in(in[10]), .notIn(notIn[10]), .sel(sel), .out(out[10]));
	 mux_2x1 u11 (.in(in[11]), .notIn(notIn[11]), .sel(sel), .out(out[11]));
	 mux_2x1 u12 (.in(in[12]), .notIn(notIn[12]), .sel(sel), .out(out[12]));
	 mux_2x1 u13 (.in(in[13]), .notIn(notIn[13]), .sel(sel), .out(out[13]));
	 mux_2x1 u14 (.in(in[14]), .notIn(notIn[14]), .sel(sel), .out(out[14]));
	 mux_2x1 u15 (.in(in[15]), .notIn(notIn[15]), .sel(sel), .out(out[15]));

endmodule
