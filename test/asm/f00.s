	.text
	.globl	f
	.type	f, @function
f:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	pushq $123
	popq %rax
	movq %rbp, %rsp
	popq	%rbp
	ret
	movq %rbp, %rsp
	popq	%rbp
	ret
