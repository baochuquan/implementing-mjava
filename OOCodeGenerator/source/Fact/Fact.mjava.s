	.686
	.MMX
	.XMM
	.model flat

	EXTERN _printf:near
	EXTERN _scanf:near
	EXTERN _abort:near


_text	SEGMENT PARA 'CODE'
	public _EntInt_fact
	ALIGN	16
_EntInt_fact	proc near
	sub	ESP, 20
$label1:
	mov	EAX, DWORD PTR [ESP + 28]
	mov	DWORD PTR [ESP + 16], EAX
	cmp	EAX, 3
	jge	$BB1_4	; label_1
$BB1_1:	; label_2
	mov	EAX, DWORD PTR [ESP + 16]
$BB1_2:	; label_3
	mov	DWORD PTR [ESP + 8], EAX
	mov	DWORD PTR [ESP + 12], EAX
$BB1_3:	; return
	mov	EAX, DWORD PTR [ESP + 12]
	add	ESP, 20
	ret
$BB1_4:	; label_1
	mov	EAX, DWORD PTR [ESP + 24]
	mov	ECX, DWORD PTR [ESP + 16]
	dec	ECX
	mov	DWORD PTR [ESP + 4], ECX
	mov	DWORD PTR [ESP], EAX
	call	_EntInt_fact
	imul	EAX, DWORD PTR [ESP + 16]
	jmp	$BB1_2	; label_3
_EntInt_fact	endp


	public _main
	ALIGN	16
_main	proc near
	push	ESI
$label2:
	sub	ESP, 24
$label3:
	mov	DWORD PTR [ESP + 20], 0
	lea	ESI, DWORD PTR [ESP + 20]
	ALIGN	16
$BB2_1:	; label_8
	cmp	DWORD PTR [ESP + 20], 0
	jle	$BB2_5	; label_9
$BB2_2:	; label_10
	cmp	DWORD PTR [ESP + 20], 17
	jge	$BB2_5	; label_9
$BB2_3:	; label_12
	mov	EAX, DWORD PTR [ESP + 20]
	mov	DWORD PTR [ESP + 4], EAX
	mov	DWORD PTR [ESP], 0
	call	_EntInt_fact
	mov	DWORD PTR [ESP + 16], EAX
	mov	ECX, DWORD PTR [ESP + 20]
	mov	DWORD PTR [ESP + 8], EAX
	mov	DWORD PTR [ESP + 4], ECX
	mov	DWORD PTR [ESP], OFFSET __2E_str2
	call	_printf
$BB2_4:	; return
	add	ESP, 24
	pop	ESI
	ret
$BB2_5:	; label_9
	mov	DWORD PTR [ESP], OFFSET __2E_str0
	call	_printf
	mov	DWORD PTR [ESP + 4], ESI
	mov	DWORD PTR [ESP], OFFSET __2E_str1
	call	_scanf
	jmp	$BB2_1	; label_8
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
