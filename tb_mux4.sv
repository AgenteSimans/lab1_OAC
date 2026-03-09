`timescale 1ns/1ps

module tb_mux4;
  logic [31:0] counta, countb, countc, countd; //vetores de 32 para entrar nos mux4
  logic [1:0] sel; // seletor dos mux
  logic [31:0] muxOut; // saída dos mux
/*
  genvar i; // variável de geração para o loop

  generate // Gerar 32 instâncias do mux4 usando um loop
    for(i=0; i<32; i++) begin : mux_vector 
      mux4 dut(.f(muxOut[i]), .a(counta[i]), .b(countb[i]), .c(countc[i]), .d(countd[i]), .sel(sel));
    end  
  endgenerate
*/
  // Instanciando 32 mux4 usando um vetor de modulos
  mux4 duts[31:0](.f(muxOut), .a(counta), .b(countb), .c(countc), .d(countd), .sel(sel));

   initial begin
     $monitor($time,"a = %b | b = %b | c = %b | d = %b | sel = %b | muxOut = %b", counta, countb, countc, countd, sel, muxOut);
      
      
      counta = 32'b00000000000000000000000000000000;
      countb = 32'b11111111100111111111111111111111;
      countc = 32'b11111101111111111111111111110000;
      countd = 32'b11111111111111111111111111000000;

      sel = 2'b00; #10;
      sel = 2'b01; #10;
      sel = 2'b10; #10;
      sel = 2'b11; #10;

      countd = 32'b11111111111111111111111111111111; #10;
      
      sel = 2'b00; #10;

      counta = 32'b11111111111111111111111111111111; #10;
      
     //for(count = 0; count != 4'b1111; count++) #10;     
     #10 $stop;
   end

endmodule;
