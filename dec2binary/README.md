# Conversion from Binary to Decimal

## Objective
Develop an assembly function that converts a decimal number (4 byte unsigned) into its binary representation (as an array of chars).
Hint: Make sure to store the binary digits in the right order.

## Details

### Input
- `a0`: 4 byte unsigned decimal value to convert
- `a1`: Pointer to 32 bytes of reserved memory, write the result in here

### Output
- `a0`: Pointer to the binary string (each byte is either 1 or 0, end indicated by 2, maximum 32 bytes)
