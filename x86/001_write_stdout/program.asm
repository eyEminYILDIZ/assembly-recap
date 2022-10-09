global _start

section .text:
_start:
	mov eax, 0x04
	mov ebx, 0x01
	mov ecx, message
	mov edx, message_length
	int 0x80

	mov eax, 0x01
	mov ebx, 0x00
	int 0x80 

section .data:
	message 		db 		"Hello World!", 0x0A
	message_length 	equ 	$-message
