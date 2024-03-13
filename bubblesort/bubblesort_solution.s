.globl _start

.org 0x400
.data

binary_array: .byte -5, 0, 1, 9, 4, 1, 8  ; Example binary array

.org 0x200
.text

_start:
    la a0, binary_array  ; Pointer to array
    li a1, 7             ; Length of array
    jal ra, bubblesort ; a0 = 0x25 
    ebreak

# Function bubblesort
# Input: a0 - Pointer to the binary array
#        a1 - Length of the passed array
# Output:

bubblesort:
    add t0, a0, zero    ; address of current element
    add t1, a0, a1      ; address of last element
    addi t1, t1, -1     ; array is zero-indexed

    outer_loop:         ; go over all entries that have not yet been sorted
        beq t0, t1, end ; branch if only one entry is left to sort 

        inner_loop:
            beq t0, t1, end_inner_loop ; branch if last element is reached

            lb t2, 0(t0)
            lb t3, 1(t0)

            bge t3, t2, do_nothing  ; if t3 ≥ t2, do nothing 

            sb t3, 0(t0)            ; else swap both elements
            sb t2, 1(t0)

            do_nothing:

            addi t0, t0, 1
            j inner_loop

        end_inner_loop:
            addi t1, t1, -1     ; set new last element (after this element everything is already sorted)
            add t0, a0, zero    ; reset address of current element to first element
        j outer_loop

    end:
    jalr zero, 0(ra)

    


