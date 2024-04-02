# Jumptables

## Objective
Develop an assembly function that translates numerical values stored in a struct to human
readable textual descriptions. You are given the following struct:
```C
    struct car {
        int color;
        int type;
        char *idString;
    };
```
- The color variable takes on one of five values: 0 (Black), 1 (Blue), 2 (Green), 3 (Red), 4 (White)
- The type variable takes on one of four values: 0 (Convertible), 1 (Supercar), 2 (SUV), 3 (Minivan)
- The idString variable is a pointer to a special string which serves to identify the car. You may ignore it for the final assembly task.

The exercise consists of three parts:
1. Determine the size of the passed struct in bytes
2. Determine in which register which part of the struct is passed. Start with the topmost variable.
3. Implement the function `num_to_string` which uses two jumptables to construct a string of the following form: `A [color] [type]!`. Afterwards, print the string using the provided subroutine.

## Details

### Input
- See task 1

### Output
- No outputs
