.globl _start

.org 0x600
.data

; Example tree, don`t mind this part
binary_tree: 
    .word 3, 1548, 1560  ;3
    .word 2, 1572, 0     ;2
    .word 8, 1584, 1596  ;8 
    .word 4, 0, 0        ;4
    .word 5, 0, 0        ;5
    .word -6, 0, 0        ;-6

.org 0x200
.text

_start:
    la a0, binary_tree  ; Pointer to the start
    jal ra, binary_tree_max ; a0 should be returned as 8
    ebreak

# Assume a0 contains the address of the current node
# The binary tree node is assumed to have the following structure:
# 0 bytes: value (integer)
# 4 bytes: left child (pointer)
# 8 bytes: right child (pointer)

binary_tree_max:

;get value of current node
lw t1, 0(a0)
mv t0, a0
mv a0, t1

;search in left sub tree

;pointer to left sub tree
lw t1, 4(t0)
beq t1, zero, no_left

addi sp, sp, -16
sw a0, 0(sp)
sw ra, 4(sp)
sw t0, 8(sp)

mv a0, t1 ;move left pointer to a0: argument for the next recursive call
jal ra, binary_tree_max

;compare values from the recursive call and current node
lw a1, 0(sp)
bgt a0, a1, no_change_left ;when a0 (recursive value) is greater than a1 (current node`s value, restored from stack) do not make any changes

mv a0, a1 ;else change the values

no_change_left:

lw ra, 4(sp)
lw t0, 8(sp)
addi sp, sp, 16

no_left:

;search in right sub tree

;pointer to right sub tree -> offset 8 bytes
lw t1, 8(t0)
beq t1, zero, no_right

addi sp, sp, -16
sw a0, 0(sp)
sw ra, 4(sp)

mv a0, t1
jal ra, binary_tree_max

;compare values from the recursive call and current node
lw a1, 0(sp)
bgt a0, a1, no_change_right ;when a0 (recursive value) is greater than a1 (current node`s value, restored from stack) do not make any changes

mv a0, a1 ;else change the values

no_change_right:
lw ra, 4(sp)
addi sp, sp, 16

no_right:
ret