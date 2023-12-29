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
   