// adder_16bits.v
// Função: Soma dois números de 16 bits

module somador_16bits (
    input  wire [15:0] a,      // Primeiro número (16 bits)
    input  wire [15:0] b,      // Segundo número (16 bits)
    input  wire        cin,    // Carry de entrada (geralmente 0)
    output wire [15:0] sum,    // Resultado da soma (16 bits)
    output wire        cout,   // ← VÍRGULA AQUI!
    output wire        overflow // Overflow detectado
);
    // Fios internos para propagar o carry
    wire [15:0] carry;
    
    // Instancia 16 full adders em cascata
    somador_completo fa0 (.A(a[0]), .B(b[0]), .cin(cin),       .cout(carry[0]), .S(sum[0]));
    somador_completo fa1 (.A(a[1]), .B(b[1]), .cin(carry[0]),  .cout(carry[1]), .S(sum[1]));
    somador_completo fa2 (.A(a[2]), .B(b[2]), .cin(carry[1]),  .cout(carry[2]), .S(sum[2]));
    somador_completo fa3 (.A(a[3]), .B(b[3]), .cin(carry[2]),  .cout(carry[3]), .S(sum[3]));
    somador_completo fa4 (.A(a[4]), .B(b[4]), .cin(carry[3]),  .cout(carry[4]), .S(sum[4]));
    somador_completo fa5 (.A(a[5]), .B(b[5]), .cin(carry[4]),  .cout(carry[5]), .S(sum[5]));
    somador_completo fa6 (.A(a[6]), .B(b[6]), .cin(carry[5]),  .cout(carry[6]), .S(sum[6]));
    somador_completo fa7 (.A(a[7]), .B(b[7]), .cin(carry[6]),  .cout(carry[7]), .S(sum[7]));
    somador_completo fa8 (.A(a[8]), .B(b[8]), .cin(carry[7]),  .cout(carry[8]), .S(sum[8]));
    somador_completo fa9 (.A(a[9]), .B(b[9]), .cin(carry[8]),  .cout(carry[9]), .S(sum[9]));
    somador_completo fa10(.A(a[10]),.B(b[10]),.cin(carry[9]),  .cout(carry[10]),.S(sum[10]));
    somador_completo fa11(.A(a[11]),.B(b[11]),.cin(carry[10]), .cout(carry[11]),.S(sum[11]));
    somador_completo fa12(.A(a[12]),.B(b[12]),.cin(carry[11]), .cout(carry[12]),.S(sum[12]));
    somador_completo fa13(.A(a[13]),.B(b[13]),.cin(carry[12]), .cout(carry[13]),.S(sum[13]));
    somador_completo fa14(.A(a[14]),.B(b[14]),.cin(carry[13]), .cout(carry[14]),.S(sum[14]));
    somador_completo fa15(.A(a[15]),.B(b[15]),.cin(carry[14]), .cout(carry[15]),.S(sum[15]));
    
    // Carry de saída (vai-um do bit mais significativo)
    assign cout = carry[15];
    
    // OVERFLOW: detecta quando o carry que entra no MSB é diferente do carry que sai
    // Isso indica que o resultado tem sinal incorreto
    assign overflow = carry[14] ^ carry[15];
    
    // Método alternativo (usando sinais dos operandos):
    // overflow = (a[15] == b[15]) && (sum[15] != a[15]);
    // Este método é mais intuitivo, mas o de cima é mais usado em hardware
    
endmodule 
