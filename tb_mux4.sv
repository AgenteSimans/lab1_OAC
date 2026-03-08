`timescale 1ns/1ps

module tb_mux4(count, muxOut);
  logic [31:0] counta, countb, countc, countd;
  logic [1:0] sel;
  logic [31:0] muxOut;
  
  genvar i;

  generate
    for(i=0; i<32; i++) begin
      mux dut(.f(muxOut[i]), .a(counta[i]), .b(countb[i]), .c(countc[i]), .d(countd[i]), .sel(sel));
    end  
  endgenerate
  //mux4 duts[31:0](.f(muxOut), .a(counta), .b(countb), .c(countc), .d(countd), .sel(sel));

   initial begin
     $monitor($time,"a = %b | b = %b | c = %b | d = %b | sel = %b | muxOut = %b", counta, countb, countc, countd, sel, muxOut);
      
      
      counta = 32'b000000000000000000000000000000000000;
      countb = 32'b111111111111111111111111111111110000;
      countc = 32'b111111111111111111111111111100000000;
      countd = 32'b111111111111111111111111110000000000;

      sel = 2'b00; #10;
      sel = 2'b01; #10;
      sel = 2'b10; #10;
      sel = 2'b11; #10;

      countd = 32'b111111111111111111111111111111110000; #10;
      
      sel = 2'b00; #10;

      counta = 32'b111111111111111111111111111111110000; #10;
      
     //for(count = 0; count != 4'b1111; count++) #10;     
     #10 $stop;
   end

endmodule;
