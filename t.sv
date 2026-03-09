timescale 1ns/1ps
module mux4
  (
    output logic f,
    input  logic a, b, c, d,
    input  logic [1:0] sel //seletor
  ); 
    
    wire [1:0] n_sel;
    wire f0, f1, f2, f3;

    not n1(n_sel[1],sel[1]);
    not n0(n_sel[0],sel[0]);

    /// nao tinha certeza se era necessario usar delays #2 para o teste ja que nao foi usado no exemplo dado para a atividade
    and #2 a1(f1,b,n_sel[1],sel[0]);
    and #2 a0(f0,a,n_sel[1],n_sel[0]);  
    and #2 a2(f2,c,sel[1],n_sel[0]);
    and #2 a3(f3,d,sel[1],sel[0]);
    or  #2 g(f, f0, f1, f2, f3);

endmodule