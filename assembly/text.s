	.text
	.globl main

main:
	pushq %rbp
	movq %rsp, %rbp
	movq $5, %rax
	movq $2, %rbx
	

	.data
L1:	.string "Hello World\n"
