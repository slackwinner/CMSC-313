Project Description
This assembly code takes in a user's input, searches for the 
substring within a record text, and outputs the location of the first instance 
of the substring.

************************************************************************
0. Files:
************************************************************************

Readme.txt	- This file
textSearch.asm	- The file you will be modifying and handing in
typescript      - The file showcasing the output

List expected inputs/outputs

************************************************************************
1. Expected inputs/outputs
************************************************************************
Test 1

Enter search string: K

Text you search appears at  0 characters after the first.

Test 2

Enter search string: Rider

Text you search appears at  7 characters after the first.

Test 3

Enter search string: er,

Text you searched for, appears at  253 characters after the first.

Test 4

Enter search string: ht.

Text you searched for, appears at  287 characters after the first.

Test 5

Enter search string: anger

Text you searched for, appears at  39 characters after the first.

Test 6

Enter search string: criminals who operate above the law

Text you searched for,  appears at  206 characters after the first.

Test 7 

Enter search string: cent

Text you searched for,  appears at  159 characters after the first.

Test 8

Enter search string: Knight Rider,

Text you searched for,  appears at  243 characters after the first.

Test 9

Enter search string: rider

String not found!

Test 10

Enter search string: random@3456

String not found!


************************************************************************
2. How to compile and use this project
************************************************************************

Compilation

Use the following commands to build the project

 $ nasm -f elf64 -g -F dwarf textSearch.asm
 $ ld -o textExe textSearch.o
 
Usage

$ ./textExe

************************************************************************
3. Functionality (describe your contributions here)
************************************************************************

The original state of file textSearch.asm had no function to find the 
location of user's substring. Changes were implemented to incorporate
a counter to find the location of the substring.

************************************************************************
4. Limitations (if any)
************************************************************************

There are no limitations since the program successfully executes the 
aforementioned output (See Expected Inputs/Outputs section and typescript).

************************************************************************
5. Applications (your thoughts) of this project
************************************************************************

This project could be used to search for a specific item within a imported 
text file or source code. In addition, the algorithm used in this project can
be used in a search engine that pulls up relevant data based on the given 
user's substring.



