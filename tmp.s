IO:
	.string "%lld"
	.text
	.globl main
main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	pushq $2
	movq %rbp, %rax
	leaq -8(%rax), %rax
	popq (%rax)
	movq %rbp, %rax
	leaq -8(%rax), %rax
	movq (%rax), %rbx
	movq $1, %rdx
	subq %rdx, %rbx
	movq %rbx, (%rax)
	pushq %rbx
	movq %rbp, %rax
	leaq -8(%rax), %rax
	movq (%rax), %rbx
	pushq %rbx
	movq $1, %rdx
	subq %rdx, %rbx
	movq %rbx, (%rax)
	popq %rax
	pushq %rax
	popq %rax
	addq %rax, (%rsp)
	popq  %rsi
	leaq IO(%rip), %rdi
	movq $0, %rax
	callq printf
	.data
L1:	.string "\n"
	.text
	leaq L1(%rip), %rdi
	movq $0, %rax
	callq printf
	movq %rbp, %rax
	leaq -8(%rax), %rax
	movq (%rax), %rbx
	pushq %rbx
	movq $1, %rdx
	subq %rdx, %rbx
	movq %rbx, (%rax)
	popq %rax
	pushq %rax
	popq  %rsi
	leaq IO(%rip), %rdi
	movq $0, %rax
	callq printf
	.data
L2:	.string "\n"
	.text
	leaq L2(%rip), %rdi
	movq $0, %rax
	callq printf
	movq %rbp, %rax
	leaq -8(%rax), %rax
	movq (%rax), %rax
	pushq %rax
	popq  %rsi
	leaq IO(%rip), %rdi
	movq $0, %rax
	callq printf
	.data
L3:	.string "\n"
	.text
	leaq L3(%rip), %rdi
	movq $0, %rax
	callq printf
	leaveq
	retq
