.globl _start

.org 0x400
.data
    array: .word -100, 0, 100, 2100, 3800

.org 0x200
.text

_start:
    li a0, 3800
    la a1, array
    addi a2, a1, 20  ; array consists of 5 elements, each one being 4 bytes big
    jal ra, binary_search
    ebreak

# Function decimal_to_binary
# Input:    a0 - Value to find
#           a1 - Start address of search interval
#           a2 - End address of search interval
# Output:   a0 - Address of the found element in the original array, or -1 if not found

binary_search:
