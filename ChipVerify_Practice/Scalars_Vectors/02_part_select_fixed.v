// Fixed Part Select — [high:low]
// Range must be constant — cannot use variables

module part_select_fixed;
  reg [31:0] data = 32'hFACE_CAFE;
  reg [15:0] middle;

  initial begin
    // Direct fixed extraction
    $display("data[31:24] = 0x%0h", data[31:24]); // FA
    $display("data[23:16] = 0x%0h", data[23:16]); // CE
    $display("data[15:8]  = 0x%0h", data[15:8]);  // CA
    $display("data[7:0]   = 0x%0h", data[7:0]);   // FE

    // Middle 16 bits
    middle = data[23:8];
    $display("data[23:8]  = 0x%0h", middle);       // CECA

    // Single bit extraction
    $display("data[0]     = %b", data[0]);          // LSB
    $display("data[31]    = %b", data[31]);         // MSB
  end
endmodule
