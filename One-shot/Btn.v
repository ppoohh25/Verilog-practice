module Btn(
  input wire CLK,
  input wire RESETn,
  input wire iExtBtn,
  output reg oExtBtn
);
reg [2:0] rIntBtn;
assign oExtBtn_buffer = (rIntBtn[2] == 1 && rIntBtn[1] == 0) ? 1:0;

always @(posedge CLK or negedge RESETn) begin
  if(RESETn == 0) begin
    rIntBtn <= 1;
  end
  else rIntBtn <= {rIntBtn[1],rIntBtn[0],iExtBtn};
end


always @ (posedge CLK or negedge RESETn) begin 
    if(RESETn == 0) oExtBtn <=0;
else oExtBtn <= oExtBtn_buffer;
end

endmodule
