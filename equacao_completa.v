
module equacao_completa (
    input  wire [7:0]  x,
    output wire [15:0] y,
	 
	 output wire [6:0] dig_centena,	
	 output wire [6:0] dig_dezena,
	 output wire [6:0] dig_unidade,
	 output wire		  sinal_negativo,
    output wire        overflow,
    output wire        zero,
    output wire        cout,
    output wire        erro
	 				
 
);
    // --- Sinais internos ---
    wire [15:0] x_quadrado;
    wire [15:0] cinco_x;
    wire [15:0] menos_cinco_x;
    wire [15:0] soma1;
    wire [15:0] soma2;
	 
    wire        cout1, cout2;
    wire        ov1, ov2;
    
    // Multiplicação x²
    multiplicador_sinalizado_8x8 multp1 (
        .a(x),
        .b(x),
        .saida_final(x_quadrado)  
    );

    // Multiplicação 5x
    multiplicador_sinalizado_8x8 multp2 (
        .a(x),
        .b(8'd5),
        .saida_final(cinco_x)  
    );
    
    // Calcula -5x = complemento de 2 de 5x
    complementoDe2_16bits neg_5x (
        .A(cinco_x),
        .bs(1'b1),         // SEMPRE negativo (força complemento)
        .out(menos_cinco_x)
    );
    
    // Soma x² + (-5x)
    somador_16bits somador1 (
        .a(x_quadrado),
        .b(menos_cinco_x),
        .cin(1'b0),
        .sum(soma1),
        .cout(cout1),
        .overflow(ov1) // Overflow da primeira soma
    );
    
    // Soma +6
    somador_16bits somador2 (
        .a(soma1),
        .b(16'd6),
        .cin(1'b0),
        .sum(soma2),
        .cout(cout2),
        .overflow(ov2) // Overflow da segunda soma
    );
    
	 
	 //--- Tratamento do resultado soma2 para o display de 7 segmentos
	 wire [15:0] v_absoluto;
	 wire [3:0] unidade, dezena, centena;
	 
	 //Pega o sinal do número negativo para representar no display
	 assign sinal_negativo = soma2[15];
	 
	 //Verifica se o número é negativo, e se for, converte de volta 
	 valor_absoluto_16bits  abs_inst16bit ( .entrada(soma2), .valor_absoluto(v_absoluto));
	 
	 //Converte o valor binário em casas decimais
	 bin_pra_decimal bin_dec_1(
		.valor_bin(v_absoluto),
		.centena(centena),
		.dezena(dezena),
		.unidade(unidade)
		);
		
	  //Representa os valores no display de 7 segmentos		
	  bcd_to_7seg bcd1 ( .bcd(centena),  .seg(dig_centena));
	  bcd_to_7seg bcd2 ( .bcd(dezena),  .seg(dig_dezena));
	  bcd_to_7seg bcd3 ( .bcd(unidade), .seg(dig_unidade));
	  
		
	  // --- Saídas dos leds
	  
     assign cout = cout2;                  // LEDR[2] - Carry da última soma
     assign zero = (soma2 == 16'b0);       // LEDR[1] - Resultado é ZERO?
     assign overflow = ov1 | ov2;          // LEDR[0] - Overflow em qualquer soma
     assign erro = 1'b0;                   // LEDR[3] - Sem erro nesta implementação

endmodule 
