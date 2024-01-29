	.text
	.globl main

main:
	pushq %rbp
	movq %rsp, %rbp
	movq $5, %rax
	movq $3, %rbx
	movq $1, %rcx
L1:
	cmpq $0, %rbx
	je L2
	imulq %rax, %rcx
	subq $1, %rbx
	jmp L1
L2:
	leaq L3(%rip), %rdi
	movq %rcx, %rsi
	callq printf
	movq $0, %rax
	leaveq
	retq

	.data
L3:
	.string "Value: %d\n"
