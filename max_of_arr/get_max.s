.globl _start

.org 0x400
.data

arr1: .word 123, -11, 10, 431, 200

.org 0x200
.text

_start:
la a0, arr1
addi a1, zero, 5
jal ra, get_max

ebreak

# arguments:
#   a0: pointer to array
#   a1: length of arr
# returns:
#   a0: maximum 

get_max:
