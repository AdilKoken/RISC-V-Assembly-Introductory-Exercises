#pragma qtrvsim show registers
#pragma qtrvsim show program
#pragma qtrvsim show memory

.globl _start
.option norelax

.org 0x800
.data

.word 6     # string length
black:
    .ascii "black "
.word 5
blue:
    .ascii "blue "
.word 6
green:
    .ascii "green "
    .word 4
red:
    .ascii "red "
    .word 6
white:
    .ascii "white "
.word 11
convertible:
    .ascii "convertible"
.word 8
supercar:
    .ascii "supercar"
.word 3
suv:
    .ascii "SUV"
.word 7
minivan:
    .ascii "minivan"
.word 2
a:
    .ascii "A "
.word 1
exclamationmark:
    .ascii "!"

.org 0x200
.text

__start:
_start:

li a0, 1 # color
li a1, 0 # type
jal num_to_string
ebreak

# arguments:
#   see task description
# returns:
#   nothing

; -------- SOLUTION  ----------

num_to_string:


; -------- SOLUTION  ----------

# arguments:
#   a0: pointer to string struct
print_string:
    # reserve space on stack
    addi sp, sp, -16
    # store return address
    sw ra, 0(sp)
    # load length
    lw a2, -4(a0)
    add a1, a0, zero

    # load syscall number
    addi  a7, zero, 64
    # load file descriptor
    addi  a0, zero, 1
    # print the text
    ecall

    # load return address
    lw ra, 0(sp)
    # free stack space
    addi sp, sp, 16
    # return
    jalr zero, 0(ra)
