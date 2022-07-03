	.686
	.MMX
	.XMM
	.model flat

	EXTERN _printf:near
	EXTERN _scanf:near
	EXTERN _abort:near


_text	SEGMENT PARA 'CODE'
	public _Int
	ALIGN	16
_Int	proc near
	sub	ESP, 4
$label1:
	mov	EAX, DWORD PTR [ESP + 12]
	mov	DWORD PTR [ESP], EAX
	mov	ECX, DWORD PTR [ESP + 8]
	mov	DWORD PTR [ECX], EAX
$BB1_1:	; return
	add	ESP, 4
	ret
_Int	endp


	public _Int_getInt
	ALIGN	16
_Int_getInt	proc near
	sub	ESP, 8
$label2:
	mov	EAX, DWORD PTR [ESP + 12]
	mov	EAX, DWORD PTR [EAX]
	mov	DWORD PTR [ESP], EAX
	mov	DWORD PTR [ESP + 4], EAX
$BB2_1:	; return
	mov	EAX, DWORD PTR [ESP + 4]
	add	ESP, 8
	ret
_Int_getInt	endp


	public _Array_max
	ALIGN	16
_Array_max	proc near
	sub	ESP, 36
$label3:
	mov	EAX, DWORD PTR [ESP + 44]
	mov	DWORD PTR [ESP + 32], EAX
	mov	EAX, DWORD PTR [ESP + 48]
	mov	DWORD PTR [ESP + 28], EAX
	mov	DWORD PTR [ESP + 16], 0
	mov	DWORD PTR [ESP + 12], 4294957296
	jmp	$BB3_4	; label_16
	ALIGN	16
$BB3_1:	; label_17
	mov	EAX, DWORD PTR [ESP + 16]
	mov	ECX, DWORD PTR [ESP + 32]
	mov	EAX, DWORD PTR [ECX + 4*EAX]
	mov	DWORD PTR [ESP], EAX
	call	_Int_getInt
	mov	DWORD PTR [ESP + 8], EAX
	cmp	EAX, DWORD PTR [ESP + 12]
	jle	$BB3_3	; label_26
$BB3_2:	; label_25
	mov	EAX, DWORD PTR [ESP + 8]
	mov	DWORD PTR [ESP + 12], EAX
$BB3_3:	; label_26
	inc	DWORD PTR [ESP + 16]
$BB3_4:	; label_16
	mov	EAX, DWORD PTR [ESP + 28]
	cmp	DWORD PTR [ESP + 16], EAX
	jl	$BB3_1	; label_17
$BB3_5:	; label_18
	mov	EAX, DWORD PTR [ESP + 12]
	mov	DWORD PTR [ESP + 20], EAX
	mov	DWORD PTR [ESP + 24], EAX
$BB3_6:	; return
	mov	EAX, DWORD PTR [ESP + 24]
	add	ESP, 36
	ret
_Array_max	endp


	public _main
	ALIGN	16
_main	proc near
	push	EBP
	push	EBX
	push	EDI
	push	ESI
$label4:
	sub	ESP, 20
$label5:
	mov	DWORD PTR [ESP], 20
	call	_malloc
	mov	DWORD PTR [ESP + 16], 0
	mov	ESI, EAX
	lea	EDI, DWORD PTR [ESP + 12]
	ALIGN	16
$BB4_1:	; label_48
	cmp	DWORD PTR [ESP + 16], 4
	jle	$BB4_4	; label_49
$BB4_2:	; label_50
	mov	DWORD PTR [ESP + 4], ESI
	mov	DWORD PTR [ESP + 8], 5
	mov	DWORD PTR [ESP], 0
	call	_Array_max
	mov	DWORD PTR [ESP + 4], EAX
	mov	DWORD PTR [ESP], OFFSET __2E_str2
	call	_printf
$BB4_3:	; return
	add	ESP, 20
	pop	ESI
	pop	EDI
	pop	EBX
	pop	EBP
	ret
$BB4_4:	; label_49
	mov	DWORD PTR [ESP], OFFSET __2E_str0
	call	_printf
	mov	DWORD PTR [ESP + 4], EDI
	mov	DWORD PTR [ESP], OFFSET __2E_str1
	call	_scanf
	mov	EBX, DWORD PTR [ESP + 16]
	mov	DWORD PTR [ESP], 4
	call	_malloc
	mov	EBP, EAX
	mov	EAX, DWORD PTR [ESP + 12]
	mov	DWORD PTR [ESP + 4], EAX
	mov	DWORD PTR [ESP], EBP
	call	_Int
	mov	DWORD PTR [ESI + 4*EBX], EBP
	inc	DWORD PTR [ESP + 16]
	jmp	$BB4_1	; label_48
_main	endp
_text	ends

_data	SEGMENT PARA 'DATA'
__2E_str2:				; .str2
	db 'max:  %d',10,0
__2E_str1:				; .str1
	db '%d',0
	ALIGN	16
__2E_str0:				; .str0
	db 'Enter an integer value: ',0
_data	ends

	end
