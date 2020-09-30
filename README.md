# TwinsArrayonRuby

Two strings, a and b, are said to be twins only if they can be made equivalent by performing some number of operations on one or both strings. There are two possible operations:

SwapEven: Swap a character at an even-numbered index with a character at another even-numbered index.
SwapOdd: Swap a character at an odd-numbered index with a character at another odd-numbered index.
For example, a = "abcd" and b = "cdab" are twins because we can make them equivalent by performing operations.
Alternatively, a = "abcd" and b = "bcda" are not twins (operations do not move characters between odd and even indices), and neither are a = "abc" and b = "ab" (no amount of operations will insert a 'c' into string b).

Complete the twins function. It has two parameters:

An array of n strings named a.
An array of n strings named b.
The function must return an array of strings where each index i (0 ≤ i < n) contains the string "Yes" if ai and bi are twins or the string "No" if they are not.
