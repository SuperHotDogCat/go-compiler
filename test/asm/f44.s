	.text
	.globl	f01
	.type	f01, @function
f01:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	pushq $0
	pushq $10
	popq %rdi
	popq %rax
	subq %rdi, %rax
	pushq %rax
	popq %rax
	movq %rbp, %rsp
	popq	%rbp
	ret
	movq %rbp, %rsp
	popq	%rbp
	ret
.LFE0:
	.size f01, .-f01
	.globl	f
	.type	f, @function
f:
.LFB1:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	call f01
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
