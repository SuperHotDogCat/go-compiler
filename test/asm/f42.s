	.text
	.globl	sum2
	.type	sum2, @function
sum2:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	subq $8, %rsp
	movq $0, -16(%rbp)
	subq $8, %rsp
	movq $0, -24(%rbp)
	movq %rbp, %rax
	subq $16, %rax
	pushq %rax
	pushq $0
	popq %rdi
	popq %rax
	movq %rdi, (%rax)
	movq %rbp, %rax
	subq $24, %rax
	pushq %rax
	pushq $0
	popq %rdi
	popq %rax
	movq %rdi, (%rax)
.Lbegin1:
	movq %rbp, %rax
	subq $16, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	movq %rbp, %rax
	subq $8, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	movq %rbp, %rax
	subq $8, %rax
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
	cmpq %rdi, %rax
	setl %al
	movzb %al, %rax
	pushq %rax
	popq %rax
	cmpq $0, %rax
	je .Lend1
	movq %rbp, %rax
	subq $24, %rax
	pushq %rax
	movq %rbp, %rax
	subq $24, %rax
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
	popq %rdi
	popq %rax
	addq %rdi, %rax
	pushq %rax
	popq %rdi
	popq %rax
	movq %rdi, (%rax)
	movq %rbp, %rax
	subq $16, %rax
	pushq %rax
	movq %rbp, %rax
	subq $16, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	pushq $1
	popq %rdi
	popq %rax
	addq %rdi, %rax
	pushq %rax
	popq %rdi
	popq %rax
	movq %rdi, (%rax)
	jmp .Lbegin1
.Lend1:
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
.LFE1:
	.size sum2, .-sum2
	.globl	f
	.type	f, @function
f:
.LFB2:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	movq %rbp, %rax
	subq $8, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	pushq $10000
	popq %rdi
	popq %rax
	cqo
	idivq %rdi
	movq %rdx, %rax
	pushq %rax
	popq %rax
	movq %rax, %rdi
	call sum2
	pushq %rax
	popq %rax
	movq %rbp, %rsp
	popq	%rbp
	ret
	movq %rbp, %rsp
	popq	%rbp
	ret
