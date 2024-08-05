	.text
	.globl	f19
	.type	f19, @function
f19:
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
	subq $16, %rax
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
.LFE0:
	.size f19, .-f19
	.globl	f
	.type	f, @function
f:
.LFB1:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	pushq $1200
	popq %rax
	pushq %rax
	pushq $1100
	popq %rax
	pushq %rax
	pushq $1000
	popq %rax
	pushq %rax
	pushq $900
	popq %rax
	pushq %rax
	pushq $800
	popq %rax
	pushq %rax
	pushq $700
	popq %rax
	pushq %rax
	pushq $600
	popq %rax
	movq %rax, %r9
	pushq $500
	popq %rax
	movq %rax, %r8
	pushq $400
	popq %rax
	movq %rax, %rcx
	pushq $300
	popq %rax
	movq %rax, %rdx
	pushq $200
	popq %rax
	movq %rax, %rsi
	pushq $100
	popq %rax
	movq %rax, %rdi
	call f19
	addq $48, %rsp
	pushq %rax
	pushq $10
	popq %rdi
	popq %rax
	addq %rdi, %rax
	pushq %rax
	popq %rax
	movq %rbp, %rsp
	popq	%rbp
	ret
	movq %rbp, %rsp
	popq	%rbp
	ret
