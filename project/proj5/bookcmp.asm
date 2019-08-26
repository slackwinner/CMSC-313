; File: bookcmp.asm
;
; Description: Defines the bookcmp subroutine for use by the sort algorithm in sort_book.c 
    
%define TITLE_OFFSET 0
%define AUTHOR_OFFSET 41
%define YEAR_OFFSET 64

	SECTION .text                  ; Code section.
        global  bookcmp                ; let loader see entry point

bookcmp:
    push   rbp                         ; push the base pointer
    mov    rbp, rsp                    ; move stack pointer onto rbp (Prologue)

    push   rdi                         ; push registers we want to use
    push   rsi
         
    mov    rdi, [rbp - 8]              ; move first book into rdi
    mov    rsi, [rbp - 16]             ; move second book into rsi
                                       ; fetch the year field
                                       ; and compare the year field to book1's
                                       ; If they're different, do not sort, treat the titles as lexicographically equivalent

    push rbx			       ; push to preserve rbx
    push rcx         		       ; push to preserve rcx

    mov ebx, dword [rdi + YEAR_OFFSET] ; loads book1's year into ebx
    mov ecx, dword [rsi + YEAR_OFFSET] ; loads book2's year into ecx

    cmp ebx, ecx		       ; Compare the book publication years  	
    jne cmpDone			       ; Exits out of code if the years are different
	
cmpTitles:                             ; Fall through to here if years same
                                       ; Compare the book title strings

	xor rdx, rdx		       ; Zero out register
	mov rdx, 0		       ; incremental counter 


traverse:	

	
	xor rbx, rbx		       ;  Zero out register
	xor rcx, rcx		       ;  Zero out register

	mov ebx, dword [rdi + rdx + TITLE_OFFSET] ; grabs char of book1's title
	mov ecx, dword [rsi + rdx + TITLE_OFFSET] ; grabs char of book2's title

	cmp bl, cl		       ; compare chars
	jg L_gt			       ; if book1 char is greater jump to L_gt
	jl L_lt   		       ; if book2 char is less jump to L_lt

	inc rdx			       ; grabs next char
	jmp traverse	               ; loops back to traverse loop 


	
cmpDone:                               ; Things to do after titles are compared

     mov eax, -1	               ; book1's year is different from book2's year   
     jmp end

L_lt:
    mov    rax, -1                     ; book1 is strictly less than book2
    jmp    end
    
L_eq:    
    mov    rax, 0                      ; book1 equals book2
    jmp    end
    
L_gt:    
    mov    rax, 1                      ; book1 is strictly greater than book2

    ;; Clean up and finish
end:
    pop rcx
    pop rbx
    pop rsi                       ; clean up
    pop rdi				
    leave                         ; Sets RSP to RBP and pops off RBP (Epilogue)
    ret
