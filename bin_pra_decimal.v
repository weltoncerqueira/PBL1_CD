module bin_pra_decimal(
    input  wire [15:0] valor_bin,
    output reg  [3:0]  dez_milhar,
    output reg  [3:0]  milhar,
    output reg  [3:0]  centena,
    output reg  [3:0]  dezena,
    output reg  [3:0]  unidade
);

    integer i;
    reg [3:0] bcd0, bcd1, bcd2, bcd3, bcd4; // 5 dígitos BCD
    reg [3:0] next_bcd0, next_bcd1, next_bcd2, next_bcd3, next_bcd4;
    
    always @(*) begin
        // Inicializa todos os dígitos BCD com 0
        bcd0 = 4'b0;
        bcd1 = 4'b0;
        bcd2 = 4'b0;
        bcd3 = 4'b0;
        bcd4 = 4'b0;
        
        // Algoritmo Double Dabble
        for (i = 15; i >= 0; i = i - 1) begin
            // 1. Verifica e corrige cada dígito BCD (se >= 5, adiciona 3)
            if (bcd0 >= 4'd5) bcd0 = bcd0 + 4'd3;
            if (bcd1 >= 4'd5) bcd1 = bcd1 + 4'd3;
            if (bcd2 >= 4'd5) bcd2 = bcd2 + 4'd3;
            if (bcd3 >= 4'd5) bcd3 = bcd3 + 4'd3;
            if (bcd4 >= 4'd5) bcd4 = bcd4 + 4'd3;
            
            // 2. Shift Left: cada dígito recebe o bit superior do dígito anterior
            next_bcd4 = {bcd4[2:0], bcd3[3]};
            next_bcd3 = {bcd3[2:0], bcd2[3]};
            next_bcd2 = {bcd2[2:0], bcd1[3]};
            next_bcd1 = {bcd1[2:0], bcd0[3]};
            next_bcd0 = {bcd0[2:0], valor_bin[i]};
            
            // 3. Atualiza os registradores para a próxima iteração
            bcd4 = next_bcd4;
            bcd3 = next_bcd3;
            bcd2 = next_bcd2;
            bcd1 = next_bcd1;
            bcd0 = next_bcd0;
        end
        
        // Atribuição das saídas (bcd4 = mais significativo, bcd0 = menos)
        unidade     = bcd0;
        dezena      = bcd1;
        centena     = bcd2;
        milhar      = bcd3;
        dez_milhar  = bcd4;
    end

endmodule