	.686
	.MMX
	.XMM
	.model flat

	EXTERN _printf:near
	EXTERN _scanf:near
	EXTERN _abort:near


_text	SEGMENT PARA 'CODE'
	public _Fac
	ALIGN	16
_Fac	proc near
$BB1_1:	; return
	ret
_Fac	endp


	public _Fac_ComputeFac
	ALIGN	16
_Fac_ComputeFac	proc near
	sub	ESP, 16
$label1:
	mov	EAX, DWORD PTR [ESP + 24]
	mov	DWORD PTR [ESP + 12], EAX
	mov	DWORD PTR [ESP], 1
	ALIGN	16
$BB2_1:	; label_4
	cmp	DWORD PTR [ESP + 12], 2
	jge	$BB2_4	; label_5
$BB2_2:	; label_6
	mov	EAX, DWORD PTR [ESP]
	mov	DWORD PTR [ESP + 4], EAX
	mov	DWORD PTR [ESP + 8], EAX
$BB2_3:	; return
	mov	EAX, DWORD PTR [ESP + 8]
	add	ESP, 16
	ret
$BB2_4:	; label_5
	mov	EAX, DWORD PTR [ESP + 12]
	imul	EAX, DWORD PTR [ESP]
	mov	DWORD PTR [ESP], EAX
	dec	DWORD PTR [ESP + 12]
	jmp	$BB2_1	; label_4
_Fac_ComputeFac	endp


	public _main
	ALIGN	16
_main	proc near
	push	ESI
$label2:
	sub	ESP, 40
$label3:
	mov	DWORD PTR [ESP + 36], OFFSET __2E_str0
	mov	DWORD PTR [ESP + 32], OFFSET __2E_str1
	mov	DWORD PTR [ESP + 28], OFFSET __2E_str2
	mov	EAX, DWORD PTR [ESP + 36]
	mov	DWORD PTR [ESP], EAX
	call	_printf
	mov	EAX, DWORD PTR [ESP + 32]
	lea	ECX, DWORD PTR [ESP + 24]
	mov	DWORD PTR [ESP + 4], ECX
	mov	DWORD PTR [ESP], EAX
	call	_scanf
	mov	DWORD PTR [ESP], 0
	call	_malloc
	mov	ESI, EAX
	mov	DWORD PTR [ESP], ESI
	call	_Fac
	mov	DWORD PTR [ESP + 16], ESI
	mov	EAX, DWORD PTR [ESP + 24]
	mov	DWORD PTR [ESP + 4], EAX
	mov	DWORD PTR [ESP], ESI
	call	_Fac_ComputeFac
	mov	DWORD PTR [ESP + 20], EAX
	mov	ECX, DWORD PTR [ESP + 28]
	mov	EDX, DWORD PTR [ESP + 24]
	mov	DWORD PTR [ESP + 8], EAX
	mov	DWORD PTR [ESP + 4], EDX
	mov	DWORD PTR [ESP], ECX
	call	_printf
$BB3_1:	; return
	add	ESP, 40
	pop	ESI
	ret
_main	endp
_text	ends

_data	SEGMENT PARA 'DATA'
__2E_str2:				; .str2
	db ' Fact(%d)= %d',10,0
__2E_str1:				; .str1
	db '%d',0
	ALIGN	16
__2E_str0:				; .str0
	db 'Enter an integer value: ',0
_data	ends

	end
