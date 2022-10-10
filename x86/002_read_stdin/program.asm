section .bss
   buf      	resb 	1

section .data
   buf_size		equ		1

section .text
global _start

_start:
	; read from stdin 
	mov  	edx, buf_size		; read length
	mov  	ecx, buf			; buffer
	mov  	ebx, 0x00 			; stdin
	mov  	eax, 0x03			; sys_read
	int  	0x80

	; write to stdout
	mov  	edx, buf_size		; write length
	mov  	ecx, buf			; buffer
	mov  	ebx, 1				; stdout
	mov  	eax, 4				; sys_write
	int  	0x80

	; exit program
	mov		eax, 1
	mov		ebx, 0
	int		0x80
