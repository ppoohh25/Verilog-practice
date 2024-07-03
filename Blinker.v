module Blinker(
  input wire CLK,
  input wire RESETn,
  output reg oLED
);

reg [23:0] cnt;
always @(posedge CLK or negedge RESETn) begin
  if(~RESETn) begin
    cnt <= 0;
    oLED <= 0;
  end
  else if(cnt == 13.5*10**6) begin
    cnt <= 0;
    oLED <= ~oLED;
  end
  else cnt <= cnt+1;
end

endmodule

// 27 MHz