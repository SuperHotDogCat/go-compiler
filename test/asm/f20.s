	.text
	.globl	f
	.type	f, @function
f:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	subq $8, %rsp
	movq %rsi, -16(%rbp)
	subq $8, %rsp
	movq %rdx, -24(%rbp)
	subq $8, %rsp
	movq %rcx, -32(%rbp)
	subq $8, %rsp
	movq %r8, -40(%rbp)
	subq $8, %rsp
	movq %r9, -48(%rbp)
	subq $8, %rsp
	movq 16(%rbp), %rax
	movq %rax, -56(%rbp)
	subq $8, %rsp
	movq 24(%rbp), %rax
	movq %rax, -64(%rbp)
	subq $8, %rsp
	movq 32(%rbp), %rax
	movq %rax, -72(%rbp)
	subq $8, %rsp
	movq 40(%rbp), %rax
	movq %rax, -80(%rbp)
	subq $8, %rsp
	movq 48(%rbp), %rax
	movq %rax, -88(%rbp)
	subq $8, %rsp
	movq 56(%rbp), %rax
	movq %rax, -96(%rbp)
	movq %rbp, %rax
	subq $24, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	popq %rax
	movq %rbp, %rsp
	popq	%rbp
	ret
	movq %rbp, %rsp
	popq	%rbp
	ret
