	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 4
	.intel_syntax noprefix
	.globl	_max                            ## -- Begin function max
	.p2align	4, 0x90
_max:                                   ## @max
	.cfi_startproc
## %bb.0:                               ## %entry
	mov	qword ptr [rsp - 16], rdi
	mov	dword ptr [rsp - 20], esi
	mov	dword ptr [rsp - 32], 0
	mov	dword ptr [rsp - 28], -10000
	jmp	LBB0_1
	.p2align	4, 0x90
LBB0_4:                                 ## %label_14
                                        ##   in Loop: Header=BB0_1 Depth=1
	inc	dword ptr [rsp - 32]
LBB0_1:                                 ## %label_8
                                        ## =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rsp - 32]
	cmp	eax, dword ptr [rsp - 20]
	jge	LBB0_5
## %bb.2:                               ## %label_9
                                        ##   in Loop: Header=BB0_1 Depth=1
	mov	rax, qword ptr [rsp - 16]
	movsxd	rcx, dword ptr [rsp - 32]
	mov	ecx, dword ptr [rax + 4*rcx]
	cmp	ecx, dword ptr [rsp - 28]
	jle	LBB0_4
## %bb.3:                               ## %label_13
                                        ##   in Loop: Header=BB0_1 Depth=1
	movsxd	rcx, dword ptr [rsp - 32]
	mov	eax, dword ptr [rax + 4*rcx]
	mov	dword ptr [rsp - 28], eax
	jmp	LBB0_4
LBB0_5:                                 ## %label_10
	mov	eax, dword ptr [rsp - 28]
	mov	dword ptr [rsp - 4], eax
	mov	dword ptr [rsp - 24], eax
	mov	eax, dword ptr [rsp - 24]
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %entry
	push	r15
	.cfi_def_cfa_offset 16
	push	r14
	.cfi_def_cfa_offset 24
	push	r12
	.cfi_def_cfa_offset 32
	push	rbx
	.cfi_def_cfa_offset 40
	push	rax
	.cfi_def_cfa_offset 48
	.cfi_offset rbx, -40
	.cfi_offset r12, -32
	.cfi_offset r14, -24
	.cfi_offset r15, -16
	mov	edi, 5
	call	_malloc
	mov	rbx, rax
	mov	dword ptr [rsp], 0
	lea	r14, [rip + _.str0]
	lea	r15, [rip + _.str1]
	lea	r12, [rsp + 4]
	cmp	dword ptr [rsp], 4
	jg	LBB1_3
	.p2align	4, 0x90
LBB1_2:                                 ## %label_37
                                        ## =>This Inner Loop Header: Depth=1
	mov	rdi, r14
	xor	eax, eax
	call	_printf
	mov	rdi, r15
	mov	rsi, r12
	xor	eax, eax
	call	_scanf
	movsxd	rax, dword ptr [rsp]
	mov	ecx, dword ptr [rsp + 4]
	mov	dword ptr [rbx + 4*rax], ecx
	inc	dword ptr [rsp]
	cmp	dword ptr [rsp], 4
	jle	LBB1_2
LBB1_3:                                 ## %label_38
	mov	rdi, rbx
	mov	esi, 5
	call	_max
	lea	rdi, [rip + _.str2]
	mov	esi, eax
	xor	eax, eax
	call	_printf
	add	rsp, 8
	pop	rbx
	pop	r12
	pop	r14
	pop	r15
	ret
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__const
_.str2:                                 ## @.str2
	.asciz	"max:  %d\n"

	.p2align	4                               ## @.str0
_.str0:
	.asciz	"Enter an integer value: "

_.str1:                                 ## @.str1
	.asciz	"%d"

.subsections_via_symbols
