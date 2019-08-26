Project Description:

This project reads in a data file and compares/sorts book titles based on 
the publication year. In addition, should the book titles have similiar 
publication years, the titles are sorted in alphabetical order.
************************************************************************
0. Files:
************************************************************************

Readme.txt		- This file
proj5.c			- C source code that implements sorting operation
bookcmp.asm		- Assembly code that performs comparison operation
test.sh			- Test shell script to test output of program
driver.c		- C source code that reads in data
book.h			- Header file that implements the array of structure
Makefile		- Used to build and compile project

List expected inputs/outputs

************************************************************************
1. Expected inputs/outputs
************************************************************************
"Program output matches expected"


************************************************************************
2. How to compile and use this project
************************************************************************

Compilation

Use the following commands to build the project

$ make
 
Usage

$ make test

************************************************************************
3. Functionality (describe your contributions here)
************************************************************************

Based on the provided files, I applied modifications to the proj5.c and
bookcmp.asm files. Within proj5.c, I've figuered out how to invoke the qsort 
function call by supplying the appropriate parameters and constructed a 
small looping algorithm to output the sorted titles. In the bookcmp.asm,
I created several implemenations to compare and sort two book titles
by publication year. In an event where the book had the same year, 
there's a function that sorts the book's titles in alphabetical order. 

************************************************************************
4. Limitations (if any)
************************************************************************

There are no limitations since the program successfully executes the 
aforementioned output (See Expected Inputs/Outputs section)

************************************************************************
5. Applications (your thoughts) of this project
************************************************************************

This program can be used to sort data by a specified attribute
(e.g. by year, by name, etc.) within a database system. In addition,
the project iteself can help serve as a learning tool to teach Computer
Science students how assembly code and a high level langauge (e.g. like C,
C++, Java, etc.) interact with each other.

