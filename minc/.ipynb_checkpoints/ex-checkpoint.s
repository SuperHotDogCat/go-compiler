	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	push $123
	pop %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
