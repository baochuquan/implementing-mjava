	.686
	.MMX
	.XMM
	.model flat

	EXTERN _printf:near
	EXTERN _scanf:near
	EXTERN _abort:near


_text	SEGMENT PARA 'CODE'
	public _Number
	ALIGN	16
_Number	proc near
	sub	ESP, 12
$label1:
	movsd	XMM0, QWORD PTR [ESP + 20]
	movsd	QWORD PTR [ESP], XMM0
	mov	EAX, DWORD PTR [ESP + 16]
	movsd	QWORD PTR [EAX], XMM0
$BB1_1:	; return
	add	ESP, 12
	ret
_Number	endp


	public _Int
	ALIGN	16
_Int	proc near
	push	ESI
$label2:
	sub	ESP, 16
$label3:
	mov	EAX, DWORD PTR [ESP + 28]
	mov	DWORD PTR [ESP + 12], EAX
	mov	ESI, DWORD PTR [ESP + 24]
	mov	DWORD PTR [ESP], ESI
	mov	DWORD PTR [ESP + 8], 1074528256
	mov	DWORD PTR [ESP + 4], 0
	call	_Number
	mov	EAX, DWORD PTR [ESP + 12]
	mov	DWORD PTR [ESI + 12], EAX
$BB2_1:	; return
	add	ESP, 16
	pop	ESI
	ret
_Int	endp


	public _Fact
	ALIGN	16
_Fact	proc near
	push	ESI
$label4:
	sub	ESP, 16
$label5:
	mov	EAX, DWORD PTR [ESP + 28]
	mov	DWORD PTR [ESP + 12], EAX
	mov	DWORD PTR [ESP + 4], EAX
	mov	ESI, DWORD PTR [ESP + 24]
	mov	DWORD PTR [ESP], ESI
	call	_Int
	mov	DWORD PTR [ESI + 16], 2
$BB3_1:	; return
	add	ESP, 16
	pop	ESI
	ret
_Fact	endp


	public _Fact_f
	ALIGN	16
_Fact_f	proc near
	push	ESI
$label6:
	sub	ESP, 16
$label7:
	mov	ESI, DWORD PTR [ESP + 24]
	mov	EAX, DWORD PTR [ESI + 12]
	mov	DWORD PTR [ESP + 4], EAX
	mov	DWORD PTR [ESP], ESI
	call	_Fact_fact
	add	EAX, DWORD PTR [ESI + 16]
	mov	DWORD PTR [ESP + 8], EAX
	mov	DWORD PTR [ESP + 12], EAX
$BB4_1:	; return
	mov	EAX, DWORD PTR [ESP + 12]
	add	ESP, 16
	pop	ESI
	ret
_Fact_f	endp


	public _Fact_fact
	ALIGN	16
_Fact_fact	proc near
	sub	ESP, 20
$label8:
	mov	EAX, DWORD PTR [ESP + 28]
	mov	DWORD PTR [ESP + 16], EAX
	cmp	EAX, 3
	jge	$BB5_4	; label_17
$BB5_1:	; label_18
	mov	EAX, DWORD PTR [ESP + 16]
$BB5_2:	; label_19
	mov	DWORD PTR [ESP + 8], EAX
	mov	DWORD PTR [ESP + 12], EAX
$BB5_3:	; return
	mov	EAX, DWORD PTR [ESP + 12]
	add	ESP, 20
	ret
$BB5_4:	; label_17
	mov	EAX, DWORD PTR [ESP + 24]
	mov	ECX, DWORD PTR [ESP + 16]
	dec	ECX
	mov	DWORD PTR [ESP + 4], ECX
	mov	DWORD PTR [ESP], EAX
	call	_Fact_fact
	imul	EAX, DWORD PTR [ESP + 16]
	jmp	$BB5_2	; label_19
_Fact_fact	endp


	public _main
	ALIGN	16
_main	proc near
	push	ESI
$label9:
	sub	ESP, 24
$label10:
	mov	DWORD PTR [ESP + 20], 0
	lea	ESI, DWORD PTR [ESP + 20]
	ALIGN	16
$BB6_1:	; label_24
	cmp	DWORD PTR [ESP + 20], 0
	jle	$BB6_5	; label_25
$BB6_2:	; label_26
	cmp	DWORD PTR [ESP + 20], 17
	jge	$BB6_5	; label_25
$BB6_3:	; label_28
	mov	DWORD PTR [ESP], 20
	call	_malloc
	mov	ESI, EAX
	mov	EAX, DWORD PTR [ESP + 20]
	mov	DWORD PTR [ESP + 4], EAX
	mov	DWORD PTR [ESP], ESI
	call	_Fact
	mov	DWORD PTR [ESP + 12], ESI
	mov	DWORD PTR [ESP], ESI
	call	_Fact_f
	mov	DWORD PTR [ESP + 16], EAX
	mov	ECX, DWORD PTR [ESP + 20]
	mov	DWORD PTR [ESP + 8], EAX
	mov	DWORD PTR [ESP + 4], ECX
	mov	DWORD PTR [ESP], OFFSET __2E_str2
	call	_printf
$BB6_4:	; return
	add	ESP, 24
	pop	ESI
	ret
$BB6_5:	; label_25
	mov	DWORD PTR [ESP], OFFSET __2E_str0
	call	_printf
	mov	DWORD PTR [ESP + 4], ESI
	mov	DWORD PTR [ESP], OFFSET __2E_str1
	call	_scanf
	jmp	$BB6_1	; label_24
_main	endp
_text	ends

_data	SEGMENT PARA 'DATA'
__2E_str1:				; .str1
	db '%d',0
	ALIGN	16
__2E_str2:				; .str2
	db '2 + factorial(%d)= %d',10,0
	ALIGN	16
__2E_str0:				; .str0
	db 'Enter an integer greater than 0 and less than 17: ',0
_data	ends

	end
