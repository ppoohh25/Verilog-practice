module One_shot_Blink(
  input wire CLK,
  input wire RESETn,
  input wire iExtBtn,
  output wire debug,
  output wire oLED
);
assign debug = iExtBtn;
  wire wIntWire;
  Btn m_btn_if(
    .CLK (CLK),
    .RESETn (RESETn),
    .iExtBtn (iExtBtn),
    .oExtBtn (wIntWire)
  );
  LED m_LED_if(
    .CLK (CLK),
    .RESETn (RESETn),
    .iIntBtn (wIntWire),
    .oLEDneg (oLED)
  );

endmodule
