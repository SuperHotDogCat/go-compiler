	.text
	.globl	f
	.type	f, @function
f:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	pushq $0
	pushq $10
	popq %rdi
	popq %rax
	subq %rdi, %rax
	pushq %rax
	popq %rax
	movq %rbp, %rsp
	popq	%rbp
	ret
	movq %rbp, %rsp
	popq	%rbp
	ret
