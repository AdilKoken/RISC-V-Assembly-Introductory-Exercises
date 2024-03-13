# Task: Find Maximum Value in a Binary Tree

## Objective
Implement a recursive function to find the maximum integer value within a binary tree. The tree is not necessarily ordered, meaning neither the left nor the right subtree is guaranteed to contain values greater or less than the parent node. The value of each node is a 4-byte integer, and each node contains pointers to its left and right children.

## Structure Definition
The binary tree node is defined as follows:
```c
typedef struct TreeNode {
    int value;
    struct TreeNode *left;
    struct TreeNode *right;
} TreeNode;

```
## Function Prototype
```c
int findMaxValue(TreeNode *node);
```

Assume a0 contains the address of the current node
The binary tree node is assumed to have the following structure:
0 bytes: value (integer)
4 bytes: left child (pointer)
8 bytes: right child (pointer)

### Input
- `node`: Pointer to the current node of the binary tree.

### Output
- Returns the maximum value found in the tree.

## Task Requirements
1. **Recursion**: Implement the solution recursively. The base case occurs if the current node is `NULL`. You may assume that the first node is not NULL. 

## Example
Consider a binary tree structured as follows:

```plaintext
    3
   / \
  2   8
 /   / \
4   5  -6
```


Calling `findMaxValue` on this tree should return `8`, as it is the maximum value in the tree.
