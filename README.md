#First Program "Hello World" in Linux ASM Programming.



Syscalls:-

This section will outline the use of linux syscalls in assembly language. Syscalls consist of all the functions in the second section of the manual pages located in /usr/man/man2. They are also listed in: /usr/include/sys/syscall.h. A great list is at http://www.linuxassembly.org/syscall.html. These functions can be executed via the linux interrupt service: int $0x80.

##Syscalls with < 6 args.

For all syscalls, the syscall number goes in %eax. For syscalls that have less than six args, the args go in %ebx,%ecx,%edx,%esi,%edi in order. The return value of the syscall is stored in %eax.

The syscall number can be found in /usr/include/sys/syscall.h. The macros are defined as SYS_<syscall name> i.e. SYS_exit, SYS_close, etc. 


##Syscalls with > 5 args.

Syscalls whos number of args is greater than five still expect the syscall number to be in %eax, but the args are arranged in memory and the pointer to the first arg is stored in %ebx.

If you are using the stack, args must be pushed onto it backwards, i.e. from the last arg to the first arg. Then the stack pointer should be copied to %ebx. Otherwise copy args to an allocated area of memory and store the address of the first arg in %ebx.

For better Understanding - http://asm.sourceforge.net/articles/linasm.html

##################################################################

Compilation:

as -gstabs -o filename.o filename.s

Linking:

ld -o filename filename.o

Execution:

./filename

##################################################################

**NOTE: ALL EXAMPLES FROM HERE WILL BE IN AT&T SYNTAX**
