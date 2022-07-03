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
	dq	4614256656206192380	; double value: 3.141592e+00
_data	ends

_text	SEGMENT PARA 'CODE'
	public _main
	ALIGN	16
_main	proc near
	push	ESI
$label1:
	sub	ESP, 32
$label2:
	mov	DWORD PTR [ESP + 28], 4294967295
	lea	ESI, DWORD PTR [ESP + 28]
	ALIGN	16
$BB1_1:	; label_4
	cmp	DWORD PTR [ESP + 28], 0
	js	$BB1_4	; label_5
$BB1_2:	; label_6
	cvtsi2sd	XMM0, DWORD PTR [ESP + 28]
	mulsd	XMM0, QWORD PTR [[$CPI1_0]]
	addsd	XMM0, XMM0
	movsd	QWORD PTR [ESP + 16], XMM0
	mov	EAX, DWORD PTR [ESP + 28]
	movsd	QWORD PTR [ESP + 8], XMM0
	mov	DWORD PTR [ESP + 4], EAX
	mov	DWORD PTR [ESP], OFFSET __2E_str2
	call	_printf
$BB1_3:	; return
	add	ESP, 32
	pop	ESI
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
