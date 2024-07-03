`timescale 1ps/1ps
module Blinker_tb();
  // ------input --------------
  reg CLK_i = 0;
  reg RESETn_i = 0;


//-------output ------------
wire oLED_o;


Blinker jame(
  .CLK(CLK_i),
  .RESETn(RESETn_i),
  .oLED(oLED_o)
);

always #(370377/2) CLK_i = ~CLK_i;
 

initial begin
  repeat(10)@(posedge CLK_i);
   RESETn_i <= 1;
   repeat(100_000_000)@(posedge CLK_i);

  $stop;
end

initial begin 
  $dumpfile("Blinker_tb.vcd");
  $dumpvars(0,Blinker_tb);
end

endmodule