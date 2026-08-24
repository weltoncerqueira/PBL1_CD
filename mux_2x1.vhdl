// Multiplexador 2x1 com Seletor de numero negativo ou positivo

module mux_2x1 (
    input  wire in,
    input  wire notIn,
    input  wire sel,
    output wire out
);
    wire not_sel;
    wire sel_and_in, sel_and_notIn;

    // Inverte o sel para a primeira porta AND
    not (not_sel, sel);

    // y = (sel' . in) + (sel . notIn)
    and (sel_and_in, not_sel, in);
    and (sel_and_notIn, sel, notIn);
    
    or  (out, sel_and_in, sel_and_notIn);    

endmodule
