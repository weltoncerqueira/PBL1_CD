// complementoDe2_16bits.v
// Função: Aplica complemento de 2 em um número de 16 bits se necessário

module complementoDe2_16bits (
    input  wire [15:0] A,
    input  wire        bs,   // 1 = aplicar complemento, 0 = passar direto
    output wire [15:0] out
);
    wire [15:0] notA, carry;
    
	 assign notA = A ^ {8{bs}};
	 
    // Soma 1 ao inverso
    somador_completo fa0 (.A(notA[0]),  .B(1'b0), .cin(bs),        .cout(carry[0]),  .S(out[0]));
    somador_completo fa1 (.A(notA[1]),  .B(1'b0), .cin(carry[0]),  .cout(carry[1]),  .S(out[1]));
    somador_completo fa2 (.A(notA[2]),  .B(1'b0), .cin(carry[1]),  .cout(carry[2]),  .S(out[2]));
    somador_completo fa3 (.A(notA[3]),  .B(1'b0), .cin(carry[2]),  .cout(carry[3]),  .S(out[3]));
    somador_completo fa4 (.A(notA[4]),  .B(1'b0), .cin(carry[3]),  .cout(carry[4]),  .S(out[4]));
    somador_completo fa5 (.A(notA[5]),  .B(1'b0), .cin(carry[4]),  .cout(carry[5]),  .S(out[5]));
    somador_completo fa6 (.A(notA[6]),  .B(1'b0), .cin(carry[5]),  .cout(carry[6]),  .S(out[6]));
    somador_completo fa7 (.A(notA[7]),  .B(1'b0), .cin(carry[6]),  .cout(carry[7]),  .S(out[7]));
    somador_completo fa8 (.A(notA[8]),  .B(1'b0), .cin(carry[7]),  .cout(carry[8]),  .S(out[8]));
    somador_completo fa9 (.A(notA[9]),  .B(1'b0), .cin(carry[8]),  .cout(carry[9]),  .S(out[9]));
    somador_completo fa10(.A(notA[10]), .B(1'b0), .cin(carry[9]),  .cout(carry[10]), .S(out[10]));
    somador_completo fa11(.A(notA[11]), .B(1'b0), .cin(carry[10]), .cout(carry[11]), .S(out[11]));
    somador_completo fa12(.A(notA[12]), .B(1'b0), .cin(carry[11]), .cout(carry[12]), .S(out[12]));
    somador_completo fa13(.A(notA[13]), .B(1'b0), .cin(carry[12]), .cout(carry[13]), .S(out[13]));
    somador_completo fa14(.A(notA[14]), .B(1'b0), .cin(carry[13]), .cout(carry[14]), .S(out[14]));
    somador_completo fa15(.A(notA[15]), .B(1'b0), .cin(carry[14]), .cout(carry[15]), .S(out[15]));
	 
endmodule


