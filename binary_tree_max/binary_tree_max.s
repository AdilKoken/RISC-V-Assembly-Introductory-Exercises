.globl _start

.org 0x600
.data

; Example tree, don`t mind this part
binary_tree: 
    .word 2048, 1548, 1560  ;3
    .word 2052, 1572, 0     ;2
    .word 2056, 1584, 1596  ;8 
    .word 2060, 0, 0        ;4
    .word 2064, 0, 0        ;5
    .word 2068, 0, 0        ;-6

.org 0x800
.data
values:
    .word 3, 2, 8, 4, 5, -6

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
