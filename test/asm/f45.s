	.text
	.globl	f03
	.type	f03, @function
f03:
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
	popq %rax
	movq %rbp, %rsp
	popq	%rbp
	ret
	movq %rbp, %rsp
	popq	%rbp
	ret
.LFE0:
	.size f03, .-f03
	.globl	f
	.type	f, @function
f:
.LFB1:
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
	popq %rax
	movq %rax, %rdi
	call f03
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
