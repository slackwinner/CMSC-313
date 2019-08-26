Project Description
This assembly code compares input prices with book's prices and outputs 
the author's names that have book prices greater than input prices.
************************************************************************
0. Files:
************************************************************************

Readme.txt		- This file
proj4.asm		- The file that compares price values and outputs
			  authors' names
driver.asm		- The file that passes input prices
library.o		- The file that holds the book's database info
Makefile		- Used to build and compile program


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

Based on the provided files, I've modified the proj4.asm file to include
a comparison functionality. This modification traverses through the linked 
list nodes, compares the input price and databases' price, and outputs specific 
author's names that meet the greater than condition (See Description above). 
Floating point registers were used in this implementation. 

************************************************************************
4. Limitations (if any)
************************************************************************

There are no limitations since the program successfully executes the 
aforementioned output (See Expected Inputs/Outputs section)

************************************************************************
5. Applications (your thoughts) of this project
************************************************************************

This project can be used to access certain information within the book
database with a specified condition (e.g. prices, authors, title, etc.).
In addition, this project can be used to teach people how offsets and indexing
work in the Assembly language.

