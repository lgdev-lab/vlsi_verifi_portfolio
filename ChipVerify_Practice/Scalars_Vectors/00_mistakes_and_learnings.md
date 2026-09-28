# Scalars and Vectors — Mistakes & Learnings

## Quiz Mistakes

### Q1 — Declarations
- ❌ Used `int valid` — int is 32-bit, not scalar. Correct: `reg valid` or `logic valid`
- ❌ Wrong keyword order for signed: wrote `signed reg` — correct is `reg signed [15:0]`
- ❌ Memory array index `[3:0]` — industry convention is `[0:3]` for address 0 at index 0

### Q2 — Part Select
- ❌ Forgot the simplest answer: fixed part select `packet[23:8]`
- ✅ Got +: correct: `packet[8 +: 16]`
- ✅ Got -: correct: `packet[23 -: 16]`

### Q3 — Bit Ordering
- ✅ Got values right: `[0:7]` means bit 0 is MSB
- 📖 Learning: `[0:MSB]` is little-endian — causes silent wrong-direction 
  extraction when mixed with standard `[MSB:0]`. Industry rule: always 
  use descending `[MSB:0]`

### Q4 — Concatenation
- ✅ result = 24'hAABBCC
- ✅ Extract b: `result[8 +: 8]`

### Q5 — Array vs Wide Bus
- ❌ Said case 2 was 1-bit — it's actually 256-bit wide single register
- 📖 Learning:
  - `reg [7:0] data [0:255]` = memory array, access with `data[5]`
  - `reg [255:0] data` = wide bus, access byte with `data[8*5+7 -: 8]`

## Key Learnings

### +: vs -: operators
- `+:` base = bottom (LSB) of field, goes up
- `-:` base = top (MSB) of field, goes down
- For clean byte extraction:
  - `+:` use `data[8*i +: 8]` — base is `8*i`
  - `-:` use `data[8*i+7 -: 8]` — base is `8*i+7`
- `data[8*i -: 8]` with `-:` crosses byte boundaries — common bug!

### Display format
- `%h` = hex with leading zeros
- `%0h` = hex without leading zeros
- `0x%0h` = prints literal "0x" then hex value

### Loop pitfalls
- Double decrement (inside body + for statement) skips iterations
- `-:` starting at i=4 on 32-bit data → out of range → X output
- Always guard loop bounds against signal width

## Anki Cards Created
- [ ] +: vs -: anchor point difference
- [ ] Why [0:7] is dangerous in industry
- [ ] reg signed keyword order
- [ ] Array vs wide bus access pattern
- [ ] %0h vs %h difference
