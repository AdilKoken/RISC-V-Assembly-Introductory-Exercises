# Triangular numbers

## Objective
Implement a recursive algorithm to compute the element $s_i$ of the sequence
of [triangular numbers](https://en.wikipedia.org/wiki/Triangular_number).
You may assume that 0 ≤ n ≤ 8.

## Definition of the sequence of triangular numbers
- $s_0 = 0$
- $s_1 = 1$
- $s_2 = 3$
- For $n \ge 3$: $s_n = 3s_{n-1} - 3s_{n-2} + s_{n-3}$

## Details
The first 9 elements in the sequence are 0, 1, 3, 6, 10, 15, 21, 28, 36.
Note that 

### Input
- `i`: Index of the element in the sequence.

### Output
- The value of the specified element
