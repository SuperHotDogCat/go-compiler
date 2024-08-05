	.text
	.globl	fact
	.type	fact, @function
fact:
.LFB0:
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
	pushq $0
	popq %rdi
	popq %rax
	cmpq %rdi, %rax
	setle %al
	movzb %al, %rax
	pushq %rax
	popq %rax
	cmpq $0, %rax
	je  .Lelse1
	pushq $1
	popq %rax
	movq %rbp, %rsp
	popq	%rbp
	ret
	jmp  .Lend1
.Lelse1:
	subq $8, %rsp
	movq $0, -16(%rbp)
	movq %rbp, %rax
	subq $16, %rax
	pushq %rax
	movq %rbp, %rax
	subq $8, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	pushq $1
	popq %rdi
	popq %rax
	subq %rdi, %rax
	pushq %rax
	popq %rax
	movq %rax, %rdi
	call fact
	pushq %rax
	popq %rdi
	popq %rax
	movq %rdi, (%rax)
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
	popq %rdi
	popq %rax
	imulq %rdi, %rax
	pushq %rax
	popq %rax
	movq %rbp, %rsp
	popq	%rbp
	ret
.Lend1:
	movq %rbp, %rsp
	popq	%rbp
	ret
.LFE1:
	.size fact, .-fact
	.globl	f
	.type	f, @function
f:
.LFB2:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	subq $8, %rsp
	movq $0, -16(%rbp)
	movq %rbp, %rax
	subq $16, %rax
	pushq %rax
	pushq $10
	movq %rbp, %rax
	subq $8, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	pushq $990
	popq %rdi
	popq %rax
	cqo
	idivq %rdi
	movq %rdx, %rax
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
	popq %rax
	movq (%rax), %rax
	pushq %rax
	popq %rax
	movq %rax, %rdi
	call fact
	pushq %rax
	popq %rax
	movq %rbp, %rsp
	popq	%rbp
	ret
	movq %rbp, %rsp
	popq	%rbp
	ret
