// Byte extraction using +: (base = bottom of byte)
// data = 32'hFACE_CAFE
// Expected: fa, ce, ca, fe

module byte_extraction;
  reg [31:0] data;
  integer i;

  initial begin
    data = 32'hFACE_CAFE;

    // +: operator — base is LSB, goes up
    for (i = 3; i >= 0; i = i-1) 
      $display("data[8*%0d +: 8] = 0x%0h", i, data[8*i +: 8]);

    // -: operator — base is MSB, goes down
    for (i = 3; i >= 0; i = i-1)
      $display("data[8*%0d+7 -: 8] = 0x%0h", i, data[8*i+7 -: 8]);

    $display ("data[7:0] = 0x%0h", data[7:0]);
    $display ("data[15:8] = 0x%0h", data[15:8]);
    $display ("data[23:16] = 0x%0h", data[23:16]);
    $display ("data[31:24] = 0x%0h", data[31:24]);    
  end

endmodule
