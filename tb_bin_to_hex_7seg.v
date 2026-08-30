`timescale 1ns / 1ps

module tb_bin_to_hex_7seg;

    // Sinais de teste
    reg  [3:0] bin;
    wire [6:0] seg;

    // Instanciação com a interface correta de 7 bits em seg
    bin_to_hex_7seg dut (
        .bin(bin),
        .seg(seg)
    );

    integer i;

    // Tabela de referência para verificação (Ânodo Comum: 0 = Aceso, 1 = Apagado)
    // Mapeamento: seg[6:0] = {a, b, c, d, e, f, g}
    reg [6:0] esperado [0:15];

    initial begin
        // Padrões esperados para cada dígito Hexadecimal (0-F)
        esperado[4'h0] = 7'b0000001; // '0'
        esperado[4'h1] = 7'b1001111; // '1'
        esperado[4'h2] = 7'b0010010; // '2'
        esperado[4'h3] = 7'b0000110; // '3'
        esperado[4'h4] = 7'b1001100; // '4'
        esperado[4'h5] = 7'b0100100; // '5'
        esperado[4'h6] = 7'b0100000; // '6'
        esperado[4'h7] = 7'b0001111; // '7'
        esperado[4'h8] = 7'b0000000; // '8'
        esperado[4'h9] = 7'b0000100; // '9'
        esperado[4'hA] = 7'b0001000; // 'A'
        esperado[4'hB] = 7'b1100000; // 'b'
        esperado[4'hC] = 7'b0110001; // 'C'
        esperado[4'hD] = 7'b1000010; // 'd'
        esperado[4'hE] = 7'b0110000; // 'E'
        esperado[4'hF] = 7'b0111000; // 'F'

        $display("--------------------------------------------------");
        $display(" INICIANDO TESTE: bin_to_hex_7seg (0 a F)");
        $display(" Mapeamento: seg[6:0] = {a, b, c, d, e, f, g}");
        $display("--------------------------------------------------");

        for (i = 0; i < 16; i = i + 1) begin
            bin = i[3:0];
            #10; // Tempo de propagação combinatorial

            if (seg === esperado[bin]) begin
                $display("[OK]   HEX: %X | BIN: %b | Saida seg: %b (Correto)", bin, bin, seg);
            end else begin
                $display("[ERRO] HEX: %X | BIN: %b | Obtido: %b | Esperado: %b", bin, bin, seg, esperado[bin]);
            end
        end

        $display("--------------------------------------------------");
        $display(" FIM DOS TESTES");
        $display("--------------------------------------------------");
        $finish;
    end

endmodule