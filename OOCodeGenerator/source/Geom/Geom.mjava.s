	.686
	.MMX
	.XMM
	.model flat

	EXTERN _printf:near
	EXTERN _scanf:near
	EXTERN _abort:near


_data	SEGMENT PARA 'DATA'
	ALIGN	8
$CPI1_0:					; double
	dq	4841369599423283200	; double value: 4.503600e+15
$CPI1_1:					; double
	dq	4614256656206192380	; double value: 3.141592e+00
_data	ends

_text	SEGMENT PARA 'CODE'
	public _main
	ALIGN	16
_main	proc near
	push	EBP
$label1:
	mov	EBP, ESP
$label2:
	and	ESP, -16
	push	ESI
$label3:
	sub	ESP, 44
	mov	DWORD PTR [ESP + 32], 4294967295
	lea	ESI, DWORD PTR [ESP + 32]
	ALIGN	16
$BB1_1:	; label_4
	cmp	DWORD PTR [ESP + 32], 0
	js	$BB1_4	; label_5
$BB1_2:	; label_6
	movsd	XMM0, QWORD PTR [[$CPI1_0]]
	movd	XMM1, DWORD PTR [ESP + 32]
	orps	XMM1, XMM0
	subsd	XMM1, XMM0
	mulsd	XMM1, QWORD PTR [[$CPI1_1]]
	addsd	XMM1, XMM1
	movsd	QWORD PTR [ESP + 16], XMM1
	mov	EAX, DWORD PTR [ESP + 32]
	movsd	QWORD PTR [ESP + 8], XMM1
	mov	DWORD PTR [ESP + 4], EAX
	mov	DWORD PTR [ESP], OFFSET __2E_str2
	call	_printf
$BB1_3:	; return
	add	ESP, 44
	pop	ESI
	mov	ESP, EBP
	pop	EBP
	ret
$BB1_4:	; label_5
	mov	DWORD PTR [ESP], OFFSET __2E_str0
	call	_printf
	mov	DWORD PTR [ESP + 4], ESI
	mov	DWORD PTR [ESP], OFFSET __2E_str1
	call	_scanf
	jmp	$BB1_1	; label_4
_main	endp
_text	ends

_data	SEGMENT PARA 'DATA'
	ALIGN	16
__2E_str2:				; .str2
	db 'circumference of radius(%d) = %f',10,0
	ALIGN	16
__2E_str0:				; .str0
	db 'Enter a positive integer: ',0
__2E_str1:				; .str1
	db '%d',0
_data	ends

	end
