.globl _start

.org 0x400
.data
    array: .word -100, 0, 100, 2100, 3800

.org 0x200
.text

_start:
    li a0, 3800
    la a1, array
    addi a2, a1, 20  ; array consists of 5 elements, each one being 4 bytes big
    jal ra, binary_search
    ebreak

# Function decimal_to_binary
# Input:    a0 - Value to find
#           a1 - Start address of search interval
#           a2 - End address of search interval
# Output:   a0 - Address of the found element in the original array, or -1 if not found

binary_search:
    addi sp, sp, -16
    sw ra, 0(sp)

    ; base case: start >= end
    blt a1, a2, cont
        ; if value at start index (= end index) is not the one we searched for, return -1
        lw t1, 0(a1)
        bne t1, a0, not_found
        add a0, zero, a1    ; found value at start index (= end index, = mid point)
        j return_base_case

        not_found:
        li a0, -1           ; did not find search value

        return_base_case:
        lw ra, 0(sp)        ; could be omitted, since we have not made any recursive calls
        addi sp, sp, 16
        jalr zero, 0(ra)     

    ; continue if not in base case
    cont:
        ; calculate midpoint
        sub t0, a2, a1      ; end - start
        srli t0, t0, 2      ; divide by 4 to convert 4 byte address distance to element distance
        srli t0, t0, 1      ; divide by 2
        slli t0, t0, 2      ; scale to 4 byte address again
        add t0, a1, t0      ; t0 now contains address of midpoint

        ; compare search value to midpoint
        lw t1, 0(t0)

        ; value == mid
        bne a0, t1, continue_checks     ; if not equal, check if < or >
        ; else set a0 (index of found value) to midpoint
        add a0, zero, t0
        j end

        continue_checks:
        blt t1, a0, bigger
        ; value < mid, recursive call
        add a2, zero, t0    ; end := mid
        addi a2, a2, -4     ; exclude midpoint
        jal binary_search   ; puts return value in a0
        j end

        bigger:
        ; value > mid, recursive call
        add a1, zero, t0    ; start := mid
        addi a1, a1, 4      ; exclude midpoint
        jal binary_search   ; puts return value in a0

        

    end:
    # return value is already in a0
    lw ra, 0(sp)
    addi sp, sp, 16
    jalr zero, 0(ra)
