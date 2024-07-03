`timescale 1ps/1ps
module One_shot_tb();
  // ------input --------------
  reg CLK_i = 0;
  reg RESETn_i = 0;
  reg Btn_i = 1;


//-------output ------------
wire oLED_o;


One_shot_Blink dut(
  .CLK(CLK_i),
  .RESETn(RESETn_i),
  .iExtBtn(Btn_i),
  .oLED(oLED_o)
);

always #(370377/2) CLK_i = ~CLK_i;
 

initial begin
  repeat(10)@(posedge CLK_i);
   RESETn_i <= 1;
   repeat(100)@(posedge CLK_i);
   Btn_i <= 0;
   repeat(100)@(posedge CLK_i);
   Btn_i <= 1;
   repeat(200)@(posedge CLK_i);
   Btn_i <= 0;
   repeat(100)@(posedge CLK_i);
   Btn_i <= 1;
   repeat(1000)@(posedge CLK_i);

  $stop;
end

initial begin 
  $dumpfile("One_shot_tb.vcd");
  $dumpvars(0,One_shot_tb);
end

endmodule
