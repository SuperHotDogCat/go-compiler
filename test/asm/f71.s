	.text
	.globl	f37
	.type	f37, @function
f37:
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
	movq %rbp, %rax
	subq $8, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	movq %rbp, %rax
	subq $16, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	movq %rbp, %rax
	subq $24, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	popq %rdi
	popq %rax
	imulq %rdi, %rax
	pushq %rax
	popq %rdi
	popq %rax
	addq %rdi, %rax
	pushq %rax
	movq %rbp, %rax
	subq $32, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	movq %rbp, %rax
	subq $40, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	movq %rbp, %rax
	subq $48, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	popq %rdi
	popq %rax
	imulq %rdi, %rax
	pushq %rax
	popq %rdi
	popq %rax
	addq %rdi, %rax
	pushq %rax
	movq %rbp, %rax
	subq $56, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	movq %rbp, %rax
	subq $64, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	movq %rbp, %rax
	subq $72, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	popq %rdi
	popq %rax
	imulq %rdi, %rax
	pushq %rax
	popq %rdi
	popq %rax
	addq %rdi, %rax
	pushq %rax
	popq %rdi
	popq %rax
	cmpq %rdi, %rax
	setl %al
	movzb %al, %rax
	pushq %rax
	popq %rdi
	popq %rax
	cmpq %rdi, %rax
	sete %al
	movzb %al, %rax
	pushq %rax
	popq %rax
	movq %rbp, %rsp
	popq	%rbp
	ret
	movq %rbp, %rsp
	popq	%rbp
	ret
.LFE0:
	.size f37, .-f37
	.globl	f
	.type	f, @function
f:
.LFB1:
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
	movq %rbp, %rax
	subq $8, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	popq %rax
	pushq %rax
	movq %rbp, %rax
	subq $72, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	popq %rax
	pushq %rax
	movq %rbp, %rax
	subq $64, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	popq %rax
	pushq %rax
	movq %rbp, %rax
	subq $56, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	popq %rax
	movq %rax, %r9
	movq %rbp, %rax
	subq $48, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	popq %rax
	movq %rax, %r8
	movq %rbp, %rax
	subq $40, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	popq %rax
	movq %rax, %rcx
	movq %rbp, %rax
	subq $32, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	popq %rax
	movq %rax, %rdx
	movq %rbp, %rax
	subq $24, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	popq %rax
	movq %rax, %rsi
	movq %rbp, %rax
	subq $16, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	popq %rax
	movq %rax, %rdi
	call f37
	addq $24, %rsp
	pushq %rax
	pushq $1
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
