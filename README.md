# Useful-Functions-in-Recursion
I defined many functions that are most likely already implemented in most languages using recursion. This program was written in Lisp, one of the oldest functional programming languages.

Download Lisp at https://abcl.org/. Make sure to get one of the binary packages. You will need to run this program using the terminal by changing your working directory to 'abcl-bin-versionnumber'

When you are in the right directory, run abcl.jar to start using the Lisp compiler/interpreter.  
java -jar abcl.jar

To run the program on lisp, run: (load "project3")
Make sure project3.lisp is in the same directory as abcl.jar.

Additional instructions are informatively printed in the output.

My REPL loop is function-specific, so the user can choose which function he/she wants to test. The user is not required to go through ALL the functions in the REPL. There are instructions in the output.

Examples of how the user should input the list of arguments is printed informatively in the output. Not following the instructions will result in an error.

**************************************
Implemented functions:

List Functions:
append,
reverse,
map,
nub,
fold,
filter,
merge,
addtoend,
indexof,
remove-all

Set Functions:
member,
insert,
intersection,
union,
difference,
symdiff,
subsetp,
supersetp,
cardinality

Math Functions:
abs,
factorial,
right-tri,
gcd,
lcm,
nth-fibo,
primep,
nth-prime,
perfectp,
abundantp,
deficientp
