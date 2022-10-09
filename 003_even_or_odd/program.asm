global _start

;______________________________________________________________________________________
section .bss:
   number      		resb 	1                  ; 1-byte buffer

;______________________________________________________________________________________
section .data:
	message1 		db 		"odd ", 0x0A, 0
	message2 		db 		"even", 0x0A, 0
	message_length 	equ 	6

;______________________________________________________________________________________
section .text:

_start:
	; read from stdin
	mov  edx, 1					; max length
	mov  ecx, number			; buffer
	mov  ebx, 0x00				; stdin
	mov  eax, 0x03				; sys_read
	int  80h

	; make division
	xor 	edx,edx
	mov 	eax, [number]
	mov		ecx, 2
	div 	ecx					; edx = remained, eax = divide result as int

	; evaluate division result
	cmp 	edx, 1
	je		print_odd
	jmp 	print_even

; print odd message and exit
print_odd:
	mov edi, message1
	call print
	call exit

; print event message and exit
print_even:
	mov edi, message2
	call print
	call exit

; print function
; -- inputs:
;	edi = buffer address
; -- returns:
;	void
print:
	mov ecx, edi

	mov eax, 0x04
	mov ebx, 0x01
	; mov ecx, message
	mov edx, message_length
	int 0x80
	ret

; exit function
; --- inputs:
; 		void
; --- returns:
; 		void
exit:
	mov eax, 0x01
	mov ebx, 0x00
	int 0x80 
	ret

