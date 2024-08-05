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
	movq $0, -16(%rbp)
	movq %rbp, %rax
	subq $16, %rax
	pushq %rax
	pushq $2
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
	subq $16, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	popq %rdi
	popq %rax
	imulq %rdi, %rax
	pushq %rax
	movq %rbp, %rax
	subq $8, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	popq %rdi
	popq %rax
	cmpq %rdi, %rax
	setle %al
	movzb %al, %rax
	pushq %rax
	popq %rax
	cmpq $0, %rax
	je .Lend1
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
	cqo
	idivq %rdi
	movq %rdx, %rax
	pushq %rax
	pushq $0
	popq %rdi
	popq %rax
	cmpq %rdi, %rax
	sete %al
	movzb %al, %rax
	pushq %rax
	popq %rax
	cmpq $0, %rax
	je  .Lelse2
	pushq $0
	popq %rax
	movq %rbp, %rsp
	popq	%rbp
	ret
	jmp  .Lend2
.Lelse2:
.Lend2:
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
	pushq $1
	popq %rax
	movq %rbp, %rsp
	popq	%rbp
	ret
	movq %rbp, %rsp
	popq	%rbp
	ret
