// detector_sinal.v
// Função: Identifica se um número em complemento de 2 é negativo

module detector_sinal (
    input  wire [7:0] numero,
    output wire       bs  // 1 se negativo, 0 se positivo - bs = bit de sinal
);
    // Em complemento de 2, o MSB (bit 7) indica o sinal
    assign bs = numero[7];
endmodule
