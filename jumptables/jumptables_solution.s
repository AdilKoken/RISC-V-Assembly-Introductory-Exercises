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
    addi sp, sp, -16
    sw ra, 0(sp)
    sw a0, 4(sp)
    sw a1, 8(sp)

    # print the starting "A "
    la a0, a
    jal print_string

    # calculate offset in color jump table
    lw a0, 4(sp)
    slli a0, a0, 2  # multiply by 4 (spacing)
    la t0, color_jump
    add t0, t0, a0
    jalr zero, 0(t0)

    # jump table for color
    color_jump:
    j c0
    j c1
    j c2
    j c3
    j c4


    c0:
        la a0, black
        jal print_string
        j end_color
    c1:
        la a0, blue
        jal print_string
        j end_color
    c2:
        la a0, green
        jal print_string
        j end_color
    c3:
        la a0, red
        jal print_string
        j end_color
    c4:
        la a0, white
        jal print_string

    end_color:

    # calculate offset in type jump table
    lw a1, 8(sp)
    slli a1, a1, 2  # multiply by 4 (spacing)
    la t0, type_jump
    add t0, t0, a1
    jalr zero, 0(t0)

    type_jump:
    j y0
    j y1
    j y2
    j y3

    y0:
        la a0, convertible
        jal print_string
        j end_type
    y1:
        la a0, supercar
        jal print_string
        j end_type
    y2:
        la a0, suv
        jal print_string
        j end_type
    y3:
        la a0, minivan
        jal print_string

    end_type:
    # print final exclamation mark
    la a0, exclamationmark
    jal print_string

    lw ra, 0(sp)
    addi sp, sp, 16
    jalr zero, 0(ra)

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
