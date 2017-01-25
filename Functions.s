.data 
	HelloWorld:
		.asciz "Hello World\n"
		len1 = . - HelloWorld
	HelloFunction:
		.asciz "Hello Function\n"
		len2 = . - HelloFunction
.text
	.globl _start
	
	.type MyFunction,@function
	
	MyFunction:
			movl $4,%eax
			movl $1,%ebx
			int $0x80
			ret
	
	_start:
		nop 
		#Print Hello World string
	
		leal HelloWorld,%ecx
		movl $len1,%edx
		call MyFunction

		#Print Hello Function
		
		leal HelloFunction,%ecx
		mov $len2,%edx
		call MyFunction
		
		#Exit Routine
	ExitCall:
		movl $1,%eax
		movl $0,%ebx
		int $0x80
