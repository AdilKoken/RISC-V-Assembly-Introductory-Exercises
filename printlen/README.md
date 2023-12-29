# printlen - printing a null-terminated string

## Objective
Write an assembly function that prints a null-terminated string and then adds a line-break. The function should also return the length of the string. 
## Details
```
int print_len(char* a0);
```
### Input
- `a0`: Pointer to the beginning of the string
### Output
- `a0`: Length of the printes string (excluding the null terminating byte and the line break)
### Special Feature
The string ends with a null byte (`0x00`), and an ASCII line break (`0x0A`) should occur at the end of the output.
### Helper Function:
```void print_char (char c)```
Function to print a single character




