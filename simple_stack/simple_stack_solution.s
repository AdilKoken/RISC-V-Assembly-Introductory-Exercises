.globl _start

.org 0x200
.text

_start:
    # Testing the stack: Push and Pop
    li a0, 0        ; Push operation
    li a1, 42       ; Value to push
    jal ra, stack_operation

    li a0, 1        ; Pop operation
    jal ra, stack_operation
    ebreak

# Function for stack operations (Push or Pop)
# Input: a0 - Operation (0 for Push, 1 for Pop), a1 - Value for Push
# Output: a0 - Value on Pop
stack_operation:
    beq a0, zero, push

pop:
    lw a0, 0(sp)         ; Load the value from the stack
    addi sp, sp, 4       ; Add 4 to the stack pointer to reach the last element
    ret

push:
    addi sp, sp, -4       ; Decrease the stack pointer
    sw a1, 0(sp)         ; Store the value on the stack
    ret
