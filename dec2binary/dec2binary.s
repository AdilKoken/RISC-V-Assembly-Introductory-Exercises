.globl _start

.org 0x400

.bss   
    binary_array:
        .byte 32

.org 0x200
.text

_start:
    li a0, 98452
    la a1, binary_array
    jal ra, decimal_to_binary
    ebreak

# Function decimal_to_binary
# Input:    a0 - 4 byte unsigned decimal value to convert
#           a1 - Pointer to reserved memory for binary string
# Output:   a0 - Pointer to the binary string

decimal_to_binary:
