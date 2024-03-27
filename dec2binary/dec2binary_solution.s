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
    add t0, zero, a0    ; save a0
    add t2, zero, a1    ; moving pointer in string
    add a0, zero, a1    ; move pointer to output variable

    div_loop:
        beq t0, zero, end_div   ; break if the number has been converted

        andi t1, t0, 1      ; get value of last bit
        sw t1, 0(t2)        ; store value of bit

        addi t2, t2, 1      ; move forward in the binary string
        srli t0, t0, 1      ; divide temporary value by 2 
        j div_loop

    end_div:
    li t0, 2
    sw t0, 0(t2)        ; store string terminal

    ; with the division method we get the bits in opposite order,
    ; we therefore have to reverse the whole array

    add t1, zero, a0    ; forwards moving pointer
    addi t2, t2, -1     ; backwards moving pointer

    swap_loop:
        beq t1, t2, end ; break if forward ptr == back ptr, i.e. we have reached the middle of the array

        ; swap
        lb t3, 0(t1)
        lb t4, 0(t2)
        sb t3, 0(t2)
        sb t4, 0(t1)

        ; advance pointers
        addi t1, t1, 1
        addi t2, t2, -1
        j swap_loop

    end:
    jalr zero, 0(ra)
