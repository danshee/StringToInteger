# Code Kata: String To Integer

Code kata to convert text to integer.

This is my reaction to the video tutorial entitled ["Loops and Hash Maps Job Preparation Interview Question"](https://youtu.be/2QRZqMM7ef0) which *in my opinion* is a poor example of how to convert a string into an integer.  The file named [Convert.swift](StringToIntegerFramework/Convert.swift) contains this implementation.

The file [MyConvert.swift](StringToIntegerFramework/MyConvert.swift) contains my implementation.



## My Issues With The Tutorial.

1. It doesn't work correctly if the integer strings are signed (i.e. begin with "+" or "-").
2. It doesn't handle empty strings correctly.
3. It makes an unnecessary call to `pow()` to calculate a power of 10 (my code uses [Horner's method](https://en.wikipedia.org/wiki/Horner%27s_method)) to reduce the number of multiplications.
4. It makes an unnecessary conversion from an `Int` to a `Decimal` in order to use `pow()`.
5. It makes an unnecessary conversion from `Decimal` to `NSDecimalNumber` in order to convert that `Decimal` back to an `Int`.



## Project Structure

### StringToIntegerFramework

Framework bundle that contains the actual string-to-integer code (i.e. the code I consider to be poor and my code).

### StringToIntegerFrameworkTests

Unit test cases for both implementations.
