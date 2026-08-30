`timescale 1ns / 1ps

module tb_seletor_hexa_dec_to7seg;

    // Sinais de estímulo (Entradas)
    reg [15:0] somaFinal;
    reg [1:0]  sel;

    // Sinais de monitoramento (Saídas)
    wire [6:0] display0;
    wire [6:0] display1;
    wire [6:0] display2;
    wire [6:0] display3;
    wire [6:0] display4;
    wire       erro;

    // Instanciação do Módulo Sob Teste (DUT)
    seletor_hexa_dec_to7seg dut (
        .somaFinal(somaFinal),
        .sel(sel),
        .display0(display0),
        .display1(display1),
        .display2(display2),
        .display3(display3),
        .display4(display4),
        .erro(erro)
    );

    // Procedimento de Teste
    initial begin
        $display("==========================================================================");
        $display(" INICIANDO TESTE: seletor_hexa_dec_to7seg");
        $display(" Modo sel: 00 = Apagado | 01 = Hexadecimal | 10 = Decimal | 11 = Erro");
        $display("==========================================================================");

        // ---------------------------------------------------------------------
        // CASO 1: Teste com o valor 16'hA539 (Decimal: 42297)
        // ---------------------------------------------------------------------
        somaFinal = 16'hA539; // Entrada de teste 1

        // 1.1 Modo 00: Displays Apagados (esperado 7'b1111111 em Ânodo Comum)
        sel = 2'b00; #10;
        $display("[MODO 00 - DESLIGADO] Entrada: %d (0x%X)", somaFinal, somaFinal);
        $display(" Displays (D4..D0): %b | %b | %b | %b | %b | Erro: %b", 
                  display4, display3, display2, display1, display0, erro);

        // 1.2 Modo 01: Hexadecimal (esperado exibições de A, 5, 3, 9)
        sel = 2'b01; #10;
        $display("[MODO 01 - HEXADECIMAL] Entrada: 0x%X", somaFinal);
        $display(" Displays (D4..D0): %b | %b | %b | %b | %b | Erro: %b", 
                  display4, display3, display2, display1, display0, erro);

        // 1.3 Modo 10: Decimal BCD (esperado exibições de 4, 2, 2, 9, 7)
        sel = 2'b10; #10;
        $display("[MODO 10 - DECIMAL]     Entrada: %d", somaFinal);
        $display(" Displays (D4..D0): %b | %b | %b | %b | %b | Erro: %b", 
                  display4, display3, display2, display1, display0, erro);

        // 1.4 Modo 11: Flag de Erro (erro deve ir para 1)
        sel = 2'b11; #10;
        $display("[MODO 11 - ERRO]        Entrada: %d", somaFinal);
        $display(" Displays (D4..D0): %b | %b | %b | %b | %b | Erro: %b", 
                  display4, display3, display2, display1, display0, erro);

        $display("--------------------------------------------------------------------------");

        // ---------------------------------------------------------------------
        // CASO 2: Teste com o valor 16'h10FE (Decimal: 04350)
        // ---------------------------------------------------------------------
        somaFinal = 16'h10FE; // Entrada de teste 2

        // 2.1 Modo 01: Hexadecimal (esperado 1, 0, F, E)
        sel = 2'b01; #10;
        $display("[MODO 01 - HEXADECIMAL] Entrada: 0x%X", somaFinal);
        $display(" Displays (D4..D0): %b | %b | %b | %b | %b | Erro: %b", 
                  display4, display3, display2, display1, display0, erro);

        // 2.2 Modo 10: Decimal BCD (esperado 0, 4, 3, 5, 0)
        sel = 2'b10; #10;
        $display("[MODO 10 - DECIMAL]     Entrada: %d", somaFinal);
        $display(" Displays (D4..D0): %b | %b | %b | %b | %b | Erro: %b", 
                  display4, display3, display2, display1, display0, erro);

        $display("==========================================================================");
        $display(" FIM DA SIMULACAO");
        $display("==========================================================================");
        $finish;
    end

endmodule