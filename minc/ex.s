	.text
	.globl	f
	.type	f, @function
f:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	pushq %rdi
	pushq %rsi
	pushq %rdx
	pushq %rcx
	pushq %r8
	pushq %r9
	pushq 16(%rbp)
	pushq 24(%rbp)
	leaq -8(%rbp), %rax
	pushq %rax
	leaq -16(%rbp), %rax
	pushq %rax
	leaq -24(%rbp), %rax
	movq (%rax), %rax
	pushq %rax
	leaq -32(%rbp), %rax
	movq (%rax), %rax
	pushq %rax
	leaq -40(%rbp), %rax
	movq (%rax), %rax
	movq %rax, %rdi
	popq %rax
	imulq %rdi, %rax
	movq %rax, %rdi
	popq %rax
	addq %rdi, %rax
	pushq %rax
	leaq -48(%rbp), %rax
	movq (%rax), %rax
	pushq %rax
	leaq -56(%rbp), %rax
	movq (%rax), %rax
	pushq %rax
	leaq -64(%rbp), %rax
	movq (%rax), %rax
	movq %rax, %rdi
	popq %rax
	imulq %rdi, %rax
	movq %rax, %rdi
	popq %rax
	addq %rdi, %rax
	movq %rax, %rdi
	popq %rax
	cmpq %rdi, %rax
	setl %al
	movzb %al, %rax
	movq %rax, %rdi
	popq %rax
	movq %rdi, (%rax)
	popq %rax
	movq %rdi, (%rax)
	movq %rdi, %rax
	movq %rbp, %rsp
	popq	%rbp
	ret
	movq %rbp, %rsp
	popq	%rbp
	ret
