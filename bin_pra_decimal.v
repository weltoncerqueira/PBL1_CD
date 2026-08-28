module bin_pra_decimal (
    input  wire [15:0] valor_bin,      // 16 bits, bit 15 é o sinal (Complemento de 2)
    output wire [3:0]  centena, // 0 a 9 (limitado a 9 pois ignoramos milhares)
    output wire [3:0]  dezena,  // 0 a 9
    output wire [3:0]  unidade  // 0 a 9
);

    // 1. Lógica para extrair a CENTENA
    // Dividimos por 100. Como o valor pode ser até 32767, 
    // a centena pode ir até 9 (ex: 999/100 = 9, 1000/100 = 10 - mas ignoramos o 10).
    assign centena = (valor_bin / 16'd100) % 4'd10;

    // 2. Lógica para extrair a DEZENA e a UNIDADE
    // Pegamos o resto da divisão por 100.
    wire [15:0] resto_centena;
    assign resto_centena = valor_bin % 16'd100;

    // Agora dividimos esse resto por 10 para achar a dezena.
    assign dezena = resto_centena / 16'd10;

    // E pegamos o resto da divisão por 10 para achar a unidade.
    assign unidade = resto_centena % 16'd10;

endmodule
