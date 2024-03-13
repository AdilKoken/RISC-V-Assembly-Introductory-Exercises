.globl _start

.org 0x400
.data

binary_array: .byte -5, 0, 1, 9, 4, 1, 8  ; Example binary array

.org 0x200
.text

_start:
    la a0, binary_array  ; Pointer to array
    li a1, 7             ; Length of array
    jal ra, bubblesort ; a0 = 0x25 
    ebreak

# Function bubblesort
# Input: a0 - Pointer to the binary array
#        a1 - Length of the passed array
# Output:

bubblesort:
    
