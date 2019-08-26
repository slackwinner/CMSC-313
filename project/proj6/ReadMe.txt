
Project Description:

this project utilizes real dynamic memory allocation system that 
manages a heap of fraction-sized blocks. The system implements a hybrid
memory management scheme to make freeing and reallocating blocks more 
efficient.
************************************************************************
0. Files:
************************************************************************

Readme.txt		- This file
frac_heap.h		- Function Headers
frac_heap.c		- Function implementations of frac_heap.h
test1-6.c		- Test Cases
typescript		- Output of Test Cases
Makefile		- Used to build and compile project

List expected inputs/outputs

************************************************************************
1. Expected inputs/outputs
************************************************************************
// Note: Below is proj6.c's output. Output from other test cases should
	 look similar to output below

Called malloc(160): Returned 0x214a260

-2/3 plus 1/4 = -5/12


**** BEGIN HEAP DUMP ****

    0x214a290
    0x214a2a0
    0x214a2b0
    0x214a2c0
    0x214a2d0
    0x214a2e0
    0x214a2f0

**** END HEAP DUMP ****


**** BEGIN HEAP DUMP ****

    0x214a270
    0x214a290
    0x214a2a0
    0x214a2b0
    0x214a2c0
    0x214a2d0
    0x214a2e0
    0x214a2f0

**** END HEAP DUMP ****


**** BEGIN HEAP DUMP ****

    0x214a2b0
    0x214a2c0
    0x214a2d0
    0x214a2e0
    0x214a2f0

**** END HEAP DUMP ****


************************************************************************
2. How to compile and use this project
************************************************************************

Compilation

Use the following commands to build the project

$ make proj6
$ make test1.out
$ make test2.out
$ make test3.out
$ make test3.out
$ make test4.out
$ make test6.out
 
Usage

$ ./proj6
$ ./test1.out
$ ./test2.out
$ ./test3.out
$ ./test4.out
$ ./test5.out
$ ./test6.out

************************************************************************
3. Functionality (describe your contributions here)
************************************************************************

Based on the provided files, the program utilizes a block structure
named frac_heap. I provided the function implementations of the frac_heap
in order to implement a hybrid memory allocation scheme. In addition, I 
used the test cases to test the efficiency of my functions and to see
how the program behaves in different scenarios.  

************************************************************************
4. Limitations (if any)
************************************************************************

There are no limitations since the program successfully executes the 
aforementioned output (See Expected Inputs/Outputs section and typescript)

************************************************************************
5. Applications (your thoughts) of this project
************************************************************************

It was interesting working on a C based project. This project served
as a way for me to review some basic C concepts such as dynamic memory
allocation. In terms of practical usage, perhaps the concepts of 
memory allocation can be applied to databases and making programs
utilize the computer's resources more efficiently and effectively. 

