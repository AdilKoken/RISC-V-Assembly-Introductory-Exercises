.globl _start

.org 0x400
.data

binary_array: .byte 1, 0, 0, 1, 0, 1, 2  ; Example binary array

.org 0x200
.text

_start:
    la a0, binary_array  ; Pointer to the start
    jal ra, binary_to_decimal ; a0 = 0x25 
    ebreak

# Function binary_to_decimal
# Input: a0 - Pointer to the binary array
# Output: a0 - The decimal representation of the binary number

binary_to_decimal:
