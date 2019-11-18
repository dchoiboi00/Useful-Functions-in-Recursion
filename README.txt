
CSC173 
Project 3: Functional Programming
Yoo Choi, ychoi42@u.rochester.edu
Due November 4, 2019
I did not work with any other members on this project.

All of the methods are defined in project3.lisp

My 'print-function' takes five parameters: function, input1, input2, input3, and num because my functions take 1 to 3 parameters. The num value determines how many inputs to insert into 'funcall'. 

To run the program on lisp, run: (load "project3")
Make sure project3.lisp is in the same directory as abcl.jar.

Other instructions are informatively printed in the output.

My REPL loop is function-specific, so the user can choose which function he/she wants to test. The user is not required to go through ALL the functions in the REPL. There are instructions in the output.

Examples of how the user should input the list of arguments is printed informatively in the output. Not following the instructions will result in an error.

**************************************
Implemented functions: (All functions except powerset)

List Functions:
append
reverse
map
nub
fold
filter
merge
addtoend
indexof
remove-all

Set Functions:
member
insert
intersection
union
difference
symdiff
subsetp
supersetp
cardinality

Math Functions:
abs
factorial
right-tri
gcd
lcm
nth-fibo
primep
nth-prime

Required Functions:
perfectp
abundantp
deficientp