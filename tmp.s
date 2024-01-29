IO:
	.string "%lld"
	.text
	.globl main
main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	pushq $1
	movq %rbp, %rax
	leaq -16(%rax), %rax
	popq (%rax)
	subq $16, %rsp
	pushq $0
	movq %rbp, %rax
	leaq -8(%rax), %rax
	popq (%rax)
L2:
	movq %rbp, %rax
	leaq -8(%rax), %rax
	movq (%rax), %rax
	pushq %rax
	pushq $3
	popq %rax
	popq %rbx
	cmpq %rax, %rbx
	jge L1
	subq $16, %rsp
	movq %rbp, %rax
	leaq -16(%rax), %rax
	movq (%rax), %rax
	pushq %rax
	pushq $3
	popq %rax
	imulq (%rsp), %rax
	movq %rax, (%rsp)
	movq %rbp, %rax
	leaq -16(%rax), %rax
	popq (%rax)
	movq %rbp, %rax
	leaq -8(%rax), %rax
	movq (%rax), %rax
	pushq %rax
	pushq $1
	popq %rax
	addq %rax, (%rsp)
	movq %rbp, %rax
	leaq -8(%rax), %rax
	popq (%rax)
	jmp L2
L1:
	.data
L3:	.string "\n"
	.text
	leaq L3(%rip), %rdi
	movq $0, %rax
	callq printf
	leaveq
	retq
