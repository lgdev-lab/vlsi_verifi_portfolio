// Vector and Scalar Declarations
// Learning: reg vs logic, signed, arrays, bit ordering

module vector_declarations;

  // Scalar — single bit
  reg valid;                    // 1-bit
  logic enable;                 // 1-bit SV style (preferred)

  // Vectors
  reg [7:0]  status;            // 8-bit unsigned
  reg [15:0] data_bus;          // 16-bit unsigned
  reg signed [15:0] data_in;    // 16-bit signed
  reg [31:0] word;              // 32-bit

  // Memory array — 256 locations x 8-bit
  reg [7:0] mem [0:255];        // access: mem[5]

  // Wide bus — NOT a memory
  reg [255:0] wide_data;        // access byte 5: wide_data[8*5+7 -: 8]

  // DANGEROUS — little endian ordering, avoid in industry
  reg [0:7] bad_convention;     // bit 0 is MSB here!

  initial begin
    valid      = 1'b1;
    status     = 8'hFF;
    data_in    = -16'd1;        // signed negative
    word       = 32'hFACE_CAFE;
    mem[0]     = 8'hAA;
    mem[255]   = 8'hBB;

    $display("valid     = %b",   valid);
    $display("status    = 0x%0h", status);
    $display("data_in   = %0d",  data_in);   // prints -1
    $display("word      = 0x%0h", word);
    $display("mem[0]    = 0x%0h", mem[0]);
    $display("mem[255]  = 0x%0h", mem[255]);
    $display("byte 5 from wide_data = 0x%0h", wide_data[8*5+7 -: 8]);


    $display ("data[7:0] = 0x%0h", data[7:0]);
    $display ("data[15:8] = 0x%0h", data[15:8]);
    $display ("data[23:16] = 0x%0h", data[23:16]);
    $display ("data[31:24] = 0x%0h", data[31:24]);

  end

endmodule
