section .bss
   buf      	resb 	2

section .data
   buf_size		equ		2

section .text
global _start

_start:
	; read from 
	mov  	edx, buf_size		; read length
	mov  	ecx, buf			; buffer
	mov  	ebx, 0x00 			; stdin
	mov  	eax, 0x03			; sys_read
	int  	0x80

	mov		byte [buf], 50
	mov		byte [buf+1], 51

	mov  	edx, buf_size		; write length
	mov  	ecx, buf			; buffer
	mov  	ebx, 1				; stdout
	mov  	eax, 4				; sys_write
	int  	0x80

	mov		eax, 1
	mov		ebx, 0
	int		0x80
