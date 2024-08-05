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
	movq $0, -32(%rbp)
	movq %rbp, %rax
	subq $32, %rax
	pushq %rax
	pushq $100
	popq %rdi
	popq %rax
	movq %rdi, (%rax)
	movq %rbp, %rax
	subq $8, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	pushq $0
	popq %rdi
	popq %rax
	cmpq %rax, %rdi
	setl %al
	movzb %al, %rax
	pushq %rax
	popq %rax
	cmpq $0, %rax
	je  .Lelse1
	movq %rbp, %rax
	subq $16, %rax
	pushq %rax
	popq %rax
	movq (%rax), %rax
	pushq %rax
	pushq $0
	popq %rdi
	popq %rax
	cmpq %rax, %rdi
	setl %al
	movzb %al, %rax
	pushq %rax
	popq %rax
	cmpq $0, %rax
	je  .Lelse2
	movq %rbp, %rax
	subq $32, %rax
	pushq %rax
	pushq $200
	popq %rdi
	popq %rax
	movq %rdi, (%rax)
	jmp  .Lend2
.Lelse2:
	movq %rbp, %rax
	subq $32, %rax
	pushq %rax
	pushq $300
	popq %rdi
	popq %rax
	movq %rdi, (%rax)
.Lend2:
	jmp  .Lend1
.Lelse1:
.Lend1:
	movq %rbp, %rax
	subq $32, %rax
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
