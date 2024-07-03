module LED(
  input wire CLK,
  input wire RESETn,
  input wire iIntBtn,
  output reg oLEDneg
);
reg [23:0] cnt;
reg state;
reg oLED;
always @(posedge CLK or negedge RESETn)begin
  if(RESETn == 0) oLEDneg <= 0;
else oLEDneg = ~oLED;
end
always @(posedge CLK or negedge RESETn) begin
  if(RESETn == 0) begin
    oLED <= 0;
    cnt <= 0;
  end
  else if(cnt == 13.5*10**6) begin
    oLED <= 0;
    cnt <= 0;
  end
  else if(iIntBtn == 1 && cnt == 0) begin
    oLED <= 1;
  end
  else if(oLED == 1) begin
    cnt <= cnt+1;
  end
  

end
endmodule