	.686
	.MMX
	.XMM
	.model flat

	EXTERN _printf:near
	EXTERN _scanf:near
	EXTERN _abort:near


_text	SEGMENT PARA 'CODE'
	public _Array_max
	ALIGN	16
_Array_max	proc near
	sub	ESP, 24
$label1:
	mov	EAX, DWORD PTR [ESP + 32]
	mov	DWORD PTR [ESP + 20], EAX
	mov	EAX, DWORD PTR [ESP + 36]
	mov	DWORD PTR [ESP + 16], EAX
	mov	DWORD PTR [ESP + 4], 0
	mov	DWORD PTR [ESP], 4294957296
	jmp	$BB1_4	; label_8
	ALIGN	16
$BB1_1:	; label_9
	mov	EAX, DWORD PTR [ESP]
	mov	ECX, DWORD PTR [ESP + 4]
	mov	EDX, DWORD PTR [ESP + 20]
	cmp	DWORD PTR [EDX + 4*ECX], EAX
	jle	$BB1_3	; label_14
$BB1_2:	; label_13
	mov	EAX, DWORD PTR [ESP + 4]
	mov	EAX, DWORD PTR [EDX + 4*EAX]
	mov	DWORD PTR [ESP], EAX
$BB1_3:	; label_14
	inc	DWORD PTR [ESP + 4]
$BB1_4:	; label_8
	mov	EAX, DWORD PTR [ESP + 16]
	cmp	DWORD PTR [ESP + 4], EAX
	jl	$BB1_1	; label_9
$BB1_5:	; label_10
	mov	EAX, DWORD PTR [ESP]
	mov	DWORD PTR [ESP + 8], EAX
	mov	DWORD PTR [ESP + 12], EAX
$BB1_6:	; return
	mov	EAX, DWORD PTR [ESP + 12]
	add	ESP, 24
	ret
_Array_max	endp


	public _main
	ALIGN	16
_main	proc near
	push	EDI
	push	ESI
$label2:
	sub	ESP, 20
$label3:
	mov	DWORD PTR [ESP], 20
	call	_malloc
	mov	DWORD PTR [ESP + 16], 0
	mov	ESI, EAX
	lea	EDI, DWORD PTR [ESP + 12]
	ALIGN	16
$BB2_1:	; label_36
	cmp	DWORD PTR [ESP + 16], 4
	jle	$BB2_4	; label_37
$BB2_2:	; label_38
	mov	DWORD PTR [ESP + 4], ESI
	mov	DWORD PTR [ESP + 8], 5
	mov	DWORD PTR [ESP], 0
	call	_Array_max
	mov	DWORD PTR [ESP + 4], EAX
	mov	DWORD PTR [ESP], OFFSET __2E_str2
	call	_printf
$BB2_3:	; return
	add	ESP, 20
	pop	ESI
	pop	EDI
	ret
$BB2_4:	; label_37
	mov	DWORD PTR [ESP], OFFSET __2E_str0
	call	_printf
	mov	DWORD PTR [ESP + 4], EDI
	mov	DWORD PTR [ESP], OFFSET __2E_str1
	call	_scanf
	mov	EAX, DWORD PTR [ESP + 12]
	mov	ECX, DWORD PTR [ESP + 16]
	mov	DWORD PTR [ESI + 4*ECX], EAX
	inc	DWORD PTR [ESP + 16]
	jmp	$BB2_1	; label_36
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
