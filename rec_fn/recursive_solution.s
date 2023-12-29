.globl _start


.org 0x200
.text


_start:
    li a0, 4 ;test with n = 4, return value should be in a0
    jal ra, calc_Fn
    ebreak


# Recursive Function for Calculating F_n
# Definition: F_0 = 3, F_1 = 5, F_n = n + F_n-2 * 5 for n > 1
# Arguments:
# a0: n (the index of the sequence)
# Return:
# a0: The value of F_n 


calc_Fn:
    addi sp, sp, -16    ; Reserve space on the stack
    sw ra, 4(sp)       ; Save return address
    sw a0, 0(sp)       ; Save argument

    li t0, 2
    blt a0, t0, base_case  ; Check if n < 2 (base cases)

    addi a0, a0, -2    ; n = n - 2 for recursive call
    jal ra, calc_Fn    ; Recursive call with n - 2
    
    li t0, 5
    mul a0, a0, t0     ; Multiply the result by 5
    lw t0, 0(sp)
    add a0, a0, t0     ; Add n to F_n-2 * 5
    j end              ; Jump to the end of the function

base_case:
    li a0, 3           ; F_0 = 3
    beq a1, zero, end  ; If n = 0, F_n = 3
    li a0, 5           ; F_1 = 5

end:
    lw ra, 4(sp)       ; Restore return address
    addi sp, sp, 16    ; Free up stack space
    ret                ; Return to calling function

