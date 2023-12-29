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
    li t0, 0          ; Initialize sum counter

loop:
    beq a1, zero, end_loop  ; End loop if all elements processed
    lw t1, 0(a0)       ; Load the current element

    andi t2, t1, 1     ; Check if the element is even
    bne t2, zero, next      ; Go to the next element if odd

    add t0, t0, t1     ; Add the even element to the sum

next:
    addi a0, a0, 4     ; Move pointer to the next element
    addi a1, a1, -1    ; Decrement the length
    j loop

end_loop:
    add a0, zero, t0   ; Set a0 to the calculated sum

    ret
