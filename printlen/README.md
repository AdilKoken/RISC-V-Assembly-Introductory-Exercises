# printlen - Printing a Null-Terminated String

## Objective: 

Write an assembly function that prints a null-terminated string and then adds a line break. The function should also return the length of the string.

## Details:
• Input: a0 - Pointer to the beginning of the string.
• Output: a0 - Length of the printed string (excluding the null terminator and the line break).

Special Feature: The string ends with a null byte (0x00), and an ASCII line break (0x0A) should occur at the end of the output.

• Helper Function: print_char, which prints a single character.

print_char
• Arguments:
• a0: Character value in ASCII