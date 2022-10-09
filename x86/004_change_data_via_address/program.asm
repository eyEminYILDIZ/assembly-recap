section .bss
   buffer      	resb 	3

section .data
   buf_size		equ		3

section .text
global _start

_start:
	mov		byte [buffer], 50		; write '2' to first character of buffer
	mov		byte [buffer+1], 51		; write '3' to second character of buffer
	mov		byte [buffer+2], 0x0A	; write '\n' to last character of buffer

	mov  	edx, buf_size			; write length
	mov  	ecx, buffer				; buffer
	mov  	ebx, 1					; stdout
	mov  	eax, 4					; sys_write
	int  	0x80

	mov		eax, 1
	mov		ebx, 0
	int		0x80
