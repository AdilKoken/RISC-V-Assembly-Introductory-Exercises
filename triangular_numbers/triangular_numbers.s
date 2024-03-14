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
# Arguments:
# a0: i (the index of the element in the sequence to return)
# Output:
# a0: The value of s_i

calc_triangular:
    