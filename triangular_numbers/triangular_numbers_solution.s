.globl _start


.org 0x200
.text


_start:
    li a0, 4
    jal ra, calc_triangular
    ebreak


# Function calc_triangular
# s_0 = 0
# s_1 = 1
# s_2 = 3
# For n ≥ 3: s_n = 3s_{n-1} - 3s_{n-2} + s_{n-3}
# Input:    a0 - Index of the element in the sequence to return
# Output:   a0 - Value of s_i


calc_triangular:
    addi sp, sp, -16
    sw ra, 0(sp)
    sw a0, 4(sp)

    ; base cases
    addi t0, zero, 1
    bgeu a0, t0, check_2
    addi a0, zero, 0
    j end

    check_2:
    addi t0, zero, 2
    bgeu a0, t0, check_3
    addi a0, zero, 1
    j end

    check_3:
    addi t0, zero, 3
    bgeu a0, t0, rec
    addi a0, zero, 3
    j end

    ; recursive calls
    rec:
    ; recursive call for s_{n-1}
    addi a0, a0, -1 ; set a0 to n-1
    jal calc_triangular
    sw a0, 8(sp)    ; save return value
    lw a0, 4(sp)    ; restore n

    ; recursive call for s_{n-2}
    addi a0, a0, -2 ; set a0 to n-2
    jal calc_triangular
    sw a0, 12(sp)   ; save return value
    lw a0, 4(sp)    ; restore n


    ; recursive call for s_{n-3}
    addi a0, a0, -3 ; set a0 to n-3
    jal calc_triangular

    ; multiply and add everything together (a0 already contains s_{n-3})
    addi t0, zero, 3
    lw t1, 8(sp)
    lw t2, 12(sp)
    mul t1, t1, t0
    mul t2, t2, t0

    add a0, a0, t1
    sub a0, a0, t2

    end:
    lw ra, 0(sp)
    addi sp, sp, 16
    jalr zero, 0(ra)