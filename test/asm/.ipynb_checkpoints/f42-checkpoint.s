	.text
	.globl	sum2
	.type	sum2, @function
sum2:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq $24, %rsp
	movq %rdi, -8(%rbp)
	movq $0, -16(%rbp)
	movq $0, -24(%rbp)
	movq %rbp, %rax
	subq $16, %rax
	pushq %rax
	pushq $0
	popq %rdi
	popq %rax
	movq %rdi, (%rax)
	push %rdi
	movq %rbp, %rax
	subq $24, %rax
	pushq %rax
	pushq $0
	popq %rdi
	popq %rax
	movq %rdi, (%rax)
	push %rdi
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
	push %rdi
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
	push %rdi
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
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size sum2, .-sum2
	.globl	f
	.type	f, @function
f:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
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
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
