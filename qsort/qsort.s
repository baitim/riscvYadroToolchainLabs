	.file	"qsort.c"
	.intel_syntax noprefix
	.text
	.globl	swap
	.type	swap, @function
swap:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR -4[rbp], eax
	mov	rax, QWORD PTR -32[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR -32[rbp]
	mov	edx, DWORD PTR -4[rbp]
	mov	DWORD PTR [rax], edx
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	swap, .-swap
	.globl	partition
	.type	partition, @function
partition:
.LFB7:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	DWORD PTR -32[rbp], edx
	mov	eax, DWORD PTR -32[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -28[rbp]
	sub	eax, 1
	mov	DWORD PTR -12[rbp], eax
	mov	eax, DWORD PTR -28[rbp]
	mov	DWORD PTR -8[rbp], eax
	jmp	.L3
.L5:
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	cmp	DWORD PTR -4[rbp], eax
	jle	.L4
	add	DWORD PTR -12[rbp], 1
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rdx, rax
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	lea	rcx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rcx
	mov	rsi, rdx
	mov	rdi, rax
	call	swap
.L4:
	add	DWORD PTR -8[rbp], 1
.L3:
	mov	eax, DWORD PTR -32[rbp]
	cmp	eax, DWORD PTR -8[rbp]
	jg	.L5
	mov	eax, DWORD PTR -32[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rdx, rax
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	add	rax, 1
	lea	rcx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rcx
	mov	rsi, rdx
	mov	rdi, rax
	call	swap
	mov	eax, DWORD PTR -12[rbp]
	add	eax, 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	partition, .-partition
	.globl	quick_sort
	.type	quick_sort, @function
quick_sort:
.LFB8:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	DWORD PTR -32[rbp], edx
	mov	eax, DWORD PTR -28[rbp]
	cmp	eax, DWORD PTR -32[rbp]
	jge	.L9
	mov	edx, DWORD PTR -32[rbp]
	mov	ecx, DWORD PTR -28[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	partition
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -4[rbp]
	lea	edx, -1[rax]
	mov	ecx, DWORD PTR -28[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	quick_sort
	mov	eax, DWORD PTR -4[rbp]
	lea	ecx, 1[rax]
	mov	edx, DWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	quick_sort
.L9:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	quick_sort, .-quick_sort
	.section	.rodata
.LC0:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, -28[rbp]
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	DWORD PTR -20[rbp], eax
	mov	eax, DWORD PTR -28[rbp]
	cdqe
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -16[rbp], rax
	cmp	QWORD PTR -16[rbp], 0
	jne	.L11
	mov	eax, 1
	jmp	.L15
.L11:
	mov	DWORD PTR -24[rbp], 0
	jmp	.L13
.L14:
	mov	eax, DWORD PTR -24[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	DWORD PTR -20[rbp], eax
	add	DWORD PTR -24[rbp], 1
.L13:
	mov	eax, DWORD PTR -28[rbp]
	cmp	DWORD PTR -24[rbp], eax
	jl	.L14
	mov	eax, DWORD PTR -28[rbp]
	lea	edx, -1[rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	esi, 0
	mov	rdi, rax
	call	quick_sort
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	eax, 0
.L15:
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.2.0-4ubuntu3) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
