.globl _start

.org 0x400
.data

array_data: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  ; Example array

.org 0x200
.text

_start:
    la a0, array_data  ; Pointer to the start of the array
    li a1, 10          ; Length of the array
    jal ra, sum_even_numbers ; Result in a0 -> 30 = 0x1e
    ebreak

# Function sum_even_numbers
# Input: 
#   a0: Pointer to the array
#   a1: Length of the array
# Output:
#   a0: Sum of the even numbers in the array

sum_even_numbers: