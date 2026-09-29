// +: Indexed Part Select
// Base = variable (LSB), Width = constant, goes UP
// Syntax: signal[base +: width]

module part_select_plus;
  reg [31:0] data = 32'hFACE_CAFE;
  integer i;

  initial begin
    // Extract each byte — base is bottom of byte
    for (i = 3; i >= 0; i = i-1)
      $display("data[8*%0d +: 8] = 0x%0h", i, data[8*i +: 8]);
    // Output: fa, ce, ca, fe

    // Extract middle 16 bits
    $display("data[8 +: 16]   = 0x%0h", data[8 +: 16]); // CECA

    // Extract nibbles
    for (i = 7; i >= 0; i = i-1)
      $display("nibble[%0d] = 0x%0h", i, data[4*i +: 4]);
  end
endmodule
