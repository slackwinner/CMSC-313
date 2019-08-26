/*
Author: Dane Magbuhos
Date: 4/26/19
Project 6 CMSC 313 Spring 2019
Description: This is the function implementation for the 
             frac_heap.h file
 */


#include "frac_heap.h"
#include <stdlib.h>
#include <stdio.h>

#define MALLOC 10

union fraction_block_u{
  union fraction_block_u *next;
  fraction frac;
};

typedef union fraction_block_u fraction_block;

static fraction_block *head;

// dump_head 
// dumps heap 
void dump_heap(){

  char header[] = "**** BEGIN HEAP DUMP ****";
  char footer[] = "**** END HEAP DUMP ****";

  printf("%s\n\n", header);

  fraction_block *ptr = head;

  // Prints out addresses 
  while(ptr != NULL){
    printf("%p\n", ptr);
    ptr = ptr->next;
  }

  printf("%s\n\n", footer);
  
}

// init_heap 
// creates the block structure 
void init_heap(){

  // Points to null
  head = NULL;
}

// new_frac 
// creates a new fraction and inserts it into the list 
fraction *new_frac(){

  int index = 0;
  int mallocIndex = MALLOC - 1;
  fraction_block *temp;

  // Checks to see if pointer is at the beginning of list
  if(head == NULL){

    // Calculates if there is more memory
    head = malloc(sizeof(fraction_block) * MALLOC);
	   
    // Checks to see if pointer is at the end of list
      if(head == NULL){

	// Outputs overflow allocation error
	printf("Error: No more memory to be allocated!\n");
	exit(1);
      }

     printf("called malloc(%d): return %p\n\n", sizeof(fraction_block) * MALLOC, head);

     // Traverses through the list
     while(index < MALLOC){

	if(index == mallocIndex)
	  head[index].next = NULL;
	
	else
	  head[index].next = &head[index + 1];
	
      index++;
     }	  		   
  }
  
       	   
  temp = head;
  head = head->next;
  return &(temp->frac);
  
}
		  

// del_frac 
// deletes a fraction from the list 
void del_frac(fraction *frac){

  // Checks to see if fraction is null in list
  if(frac == NULL)
    printf("Error: del_frac() called on NULL Pointer.\n");

  // Performs deletion operation
  else{
    fraction_block *temp;
    temp = (fraction_block *) frac;

    temp->next = head;
    head = temp;
  }

}


