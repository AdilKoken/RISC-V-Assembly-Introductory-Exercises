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


lw t0, 0(a0) ;load first value of array


loop:
beq a1, zero, end_loop
lw t1, 0(a0)

;change max if new value (t1) greater or equal than current max (t0)
bge t0, t1, no_change
add t0, t1, zero

no_change:
addi a1, a1, -1 ; decrease length by 1
addi a0, a0, 4 ; increase pointer by 4 (32 Bits, 4 Bytes) for a new value 
j loop

end_loop:
add a0, t0, zero
ret