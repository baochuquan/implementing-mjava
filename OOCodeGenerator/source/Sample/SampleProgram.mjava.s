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


	public _Int_f
	ALIGN	16
_Int_f	proc near
	sub	ESP, 20
$label2:
	mov	EAX, DWORD PTR [ESP + 24]
	mov	ECX, DWORD PTR [EAX]
	mov	DWORD PTR [ESP + 4], ECX
	mov	DWORD PTR [ESP], EAX
	call	_Int_fact
	mov	DWORD PTR [ESP + 12], EAX
	mov	DWORD PTR [ESP + 16], EAX
$BB2_1:	; return
	mov	EAX, DWORD PTR [ESP + 16]
	add	ESP, 20
	ret
_Int_f	endp


	public _Int_fact
	ALIGN	16
_Int_fact	proc near
	sub	ESP, 20
$label3:
	mov	EAX, DWORD PTR [ESP + 28]
	mov	DWORD PTR [ESP + 16], EAX
	cmp	EAX, 3
	jge	$BB3_4	; label_9
$BB3_1:	; label_10
	mov	EAX, DWORD PTR [ESP + 16]
$BB3_2:	; label_11
	mov	DWORD PTR [ESP + 8], EAX
	mov	DWORD PTR [ESP + 12], EAX
$BB3_3:	; return
	mov	EAX, DWORD PTR [ESP + 12]
	add	ESP, 20
	ret
$BB3_4:	; label_9
	mov	EAX, DWORD PTR [ESP + 24]
	mov	ECX, DWORD PTR [ESP + 16]
	dec	ECX
	mov	DWORD PTR [ESP + 4], ECX
	mov	DWORD PTR [ESP], EAX
	call	_Int_fact
	imul	EAX, DWORD PTR [ESP + 16]
	jmp	$BB3_2	; label_11
_Int_fact	endp


	public _main
	ALIGN	16
_main	proc near
	push	ESI
$label4:
	sub	ESP, 24
$label5:
	mov	DWORD PTR [ESP + 20], 0
	lea	ESI, DWORD PTR [ESP + 20]
	ALIGN	16
$BB4_1:	; label_16
	cmp	DWORD PTR [ESP + 20], 0
	jle	$BB4_5	; label_17
$BB4_2:	; label_18
	cmp	DWORD PTR [ESP + 20], 17
	jge	$BB4_5	; label_17
$BB4_3:	; label_20
	mov	DWORD PTR [ESP], 4
	call	_malloc
	mov	ESI, EAX
	mov	EAX, DWORD PTR [ESP + 20]
	mov	DWORD PTR [ESP + 4], EAX
	mov	DWORD PTR [ESP], ESI
	call	_Int
	mov	DWORD PTR [ESP + 12], ESI
	mov	DWORD PTR [ESP], ESI
	call	_Int_f
	mov	DWORD PTR [ESP + 16], EAX
	mov	ECX, DWORD PTR [ESP + 20]
	mov	DWORD PTR [ESP + 8], EAX
	mov	DWORD PTR [ESP + 4], ECX
	mov	DWORD PTR [ESP], OFFSET __2E_str2
	call	_printf
$BB4_4:	; return
	add	ESP, 24
	pop	ESI
	ret
$BB4_5:	; label_17
	mov	DWORD PTR [ESP], OFFSET __2E_str0
	call	_printf
	mov	DWORD PTR [ESP + 4], ESI
	mov	DWORD PTR [ESP], OFFSET __2E_str1
	call	_scanf
	jmp	$BB4_1	; label_16
_main	endp
_text	ends

_data	SEGMENT PARA 'DATA'
	ALIGN	16
__2E_str2:				; .str2
	db 'factorial(%d)= %d',10,0
__2E_str1:				; .str1
	db '%d',0
	ALIGN	16
__2E_str0:				; .str0
	db 'Enter an integer greater than 0 and less than 17: ',0
_data	ends

	end
