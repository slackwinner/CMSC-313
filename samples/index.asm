	;;  File: index2.asm
	;;
	;;  This program demonstrates the use of an indexed addressing mode
	;;  to access 2 dimensional array elements.
	;;
	;;  This program has no I/O. Use the debugger to examine its effects.
	;;


%define STDIN         0
%define STDOUT        1
%define SYSCALL_EXIT  60
%define SYSCALL_READ  0
%define SYSCALL_WRITE 1
%define BUFLEN        256


	        SECTION .data	; initialized data section

msg1:	      db "Enter string: " ; user prompt
len1:	      equ $-msg1	  ; length of first message

msg2:	      db "Original:  "	; original string label
len2:	      equ $-msg2	; length of second message

msg3:	      db "Converted: "	; converted string label
len3:	      equ $-msg3

msg4:	      db 10, "Read error", 10 ; error message
len4:	      equ $-msg4
	

       SECTION .bss            	; uninitialized data section
buf:	    resb BUFLEN		; buffer for read
newstr:	 resb BUFLEN		; converted string
count:	  resb 4		; reserve storage for user input bytes  
	
	;;  simulates a 2-dim array
twodim:
row1:		dd 00, 01, 02, 03, 04, 05, 06, 07, 08, 09
row2:		dd 10, 11, 12, 13, 14, 15, 16, 17, 18, 19
		dd 20, 21, 22, 23, 24, 25, 26, 27, 28, 29
		dd 30, 31, 32, 33, 34, 35, 36, 37, 38, 39
		dd 40, 41, 42, 43, 44, 45, 46, 47, 48, 49
		dd 50, 51, 52, 53, 54, 55, 56, 57, 58, 59
		dd 60, 61, 62, 63, 64, 65, 66, 67, 68, 69
		dd 70, 71, 72, 73, 74, 75, 76, 77, 78, 79
		dd 80, 81, 82, 83, 84, 85, 86, 87, 88, 89
		dd 90, 91, 92, 93, 94, 95, 96, 97, 98, 99

rowlen:	 equ row2 - row1

	SECTION .text		; Code section.
	global _start
_start:	 nop			; Entry point.

;;;   prompt user for input
;;;
	                mov rax, SYSCALL_WRITE ; write function
	                mov rdi, STDOUT        ; Arg1: file descriptor
	                mov rsi, msg1          ; Arg2: addr of message
	                mov rdx, len1          ; Arg3: length of message
	                syscall                ; 64-bit system call

;;;   read user input
;;;
	                mov rax, SYSCALL_READ ; read function
	                mov rdi, STDIN        ; Arg1: file descriptor
	                mov rsi, buf          ; Arg2: addr of message
	                mov rdx, BUFLEN       ; Arg3: length of message
	                syscall               ; 64-bit system call

;;;   error check
;;;
	                mov [count], rax ; save length of string read
	                cmp rax, 0	 ; check if any chars read
	                jg  read_OK	 ; >0 chars read = OK
	                mov rax, SYSCALL_WRITE ; Or Print Error Message
	                mov rdi, STDOUT        ; Arg1: file descriptor
	                mov rsi, msg4          ; Arg2: addr of message
	                mov rdx, len4          ; Arg3: length of message
	                syscall                ; 64-bit system call
	                jmp     exit           ; skip over rest    

init1:		mov	rcx, 0	; rcx simulates i
		mov	rax, rowlen ; compute offset of twodim[7][0]
		mov	rdx, 7
		mul	rdx	; rax := rax * rdx
		jc	alldone	; 128-bit value product is bad

loop1:		cmp	rcx, 10	; i < 10 ?
		jge	done1
		add	[rax+4*rcx+twodim], dword 5
		inc	rcx	; i++
		jmp	loop1
done1:

;;;   print out user input for feedback
;;;
	                mov rax, SYSCALL_WRITE ; Print Message
	                mov rdi, STDOUT        ; Arg1: file descriptor
	                mov rsi, msg2          ; Arg2: addr of message
	                mov rdx, len2          ; Arg3: length of message
	                syscall                ; 64-bit system call

	                mov rax, SYSCALL_WRITE ; Write user input
	                mov rdi, STDOUT        ; Arg1: file descriptor
	                mov rsi, buf           ; Arg2: addr of message
	                mov rdx, [count]       ; Arg3: length of message
	                syscall                ; 64-bit system call

;;;   print out converted string
;;;
	                mov rax, SYSCALL_WRITE ; Print Message
	                mov rdi, STDOUT        ; Arg1: file descriptor
	                mov rsi, msg3          ; Arg2: addr of message
	                mov rdx, len3          ; Arg3: length of message
	                syscall                ; 64-bit system call


	                mov rax, SYSCALL_WRITE ; Write out string
	                mov rdi, STDOUT        ; Arg1: file descriptor
	                mov rsi, newstr        ; Arg2: addr of message
	                mov rdx, [count]       ; Arg3: length of message
	                syscall                ; 64-bit system call                                                                                                                                          

alldone:
		mov	rdi, 0	; exit code, 0=normal
		mov	rax, 60	; Exit.
		syscall		; Call kernel.