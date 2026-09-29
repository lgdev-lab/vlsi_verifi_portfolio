// -: Indexed Part Select
// Base = variable (MSB), Width = constant, goes DOWN
// Syntax: signal[base -: width]

module part_select_minus;
  reg [31:0] data = 32'hFACE_CAFE;
  integer i;

  initial begin
    // Extract each byte — base is TOP of byte (8*i+7)
    for (i = 3; i >= 0; i = i-1)
      $display("data[8*%0d+7 -: 8] = 0x%0h", i, data[8*i+7 -: 8]);
    // Output: fa, ce, ca, fe

    // Common mistake — base is 8*i not 8*i+7
    // This crosses byte boundaries — wrong output!
    $display("--- WRONG way ---");
    for (i = 3; i >= 1; i = i-1)
      $display("data[8*%0d -: 8] = 0x%0h (WRONG)", i, data[8*i -: 8]);

    // Extract middle 16 bits
    $display("data[23 -: 16]  = 0x%0h", data[23 -: 16]); // CECA
  end
endmodule
