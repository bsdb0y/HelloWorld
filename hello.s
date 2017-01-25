#Linux ASM Programming

.data                             							#Data section(ALL INITIALIZED DATA)

	str:                        							#Label
		.ascii "Hello world\n" 
		len = . - str                                                          #length of string  
.text 				      							#Text section
.globl _start                       							#Must be declared for linker (ld)
_start:				      							#Tell linker the entry point
	



                                # write our string to stdout

	  movl    $4,%eax             # system call number (sys_write)
	  movl    $1,%ebx             # first argument: file handle (stdout)
	  movl    $str,%ecx           # second argument: pointer to string to write
	  movl    $len,%edx           # third argument;string length
	  int     $0x80               # call kernel

                                # and exit

	movl    $1,%eax             # system call number (sys_exit)
	movl    $0,%ebx             # first argument: exit code  
	int     $0x80               # call kernel
