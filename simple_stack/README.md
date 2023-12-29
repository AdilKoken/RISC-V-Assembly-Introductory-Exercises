# Simple Stack

## Objective
Implement a stack data structure in assembly with basic operations like Push and Pop.

- **Push**: adds an element to the stack.
- **Pop**: removes the last element and returns it.
- Assume that the stack only supports 32-bit values and the memory space will not cause an overflow.
- `sp` points to the last element in the stack.

## Details

### Input
- `a0`: 0 for Push, 1 for Pop.
- `a1`: The value for Push, if applicable.

### Output
- `a0`: The value for Pop, if applicable.
