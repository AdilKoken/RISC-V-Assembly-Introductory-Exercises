.globl _start

.org 0x400
.data

binary_array: .byte 1, 0, 0, 1, 0, 1, 2  ; Example binary array

.org 0x200
.text

_start:
    la a0, binary_array  ; Pointer to the start
    jal ra, binary_to_decimal ; a0 = 0x25 
    ebreak

# Function binary_to_decimal
# Input: a0 - Pointer to the binary array
# Output: a0 - The decimal representation of the binary number

binary_to_decimal:

    add t0, zero, zero         ; Initialize the decimal number
    addi t2, zero, 2           ; Initialize for comparison with '2'

process_string:
    lb t1, 0(a0)
    beq t1, t2, end  ; End if the end of the string is reached ('2')

    slli t0, t0, 1     ; Shift the existing number by 1 to the left
    or t0, t0, t1      ; Add the converted byte to the number with or (using add would be problematic at the 32nd bit if the number t0 is interpreted as negative)

    addi a0, a0, 1     ; Move to the next byte of the string
    j process_string

end:
    add a0, zero, t0   ; Set a0 to the calculated decimal number (or also works)
    ret
