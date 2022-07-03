	.686
	.MMX
	.XMM
	.model flat

	EXTERN _printf:near
	EXTERN _scanf:near
	EXTERN _abort:near


_text	SEGMENT PARA 'CODE'
	public _main
	ALIGN	16
_main	proc near
	sub	ESP, 12
$label1:
	mov	DWORD PTR [ESP], OFFSET __2E_str0
	call	_printf
	lea	EAX, DWORD PTR [ESP + 8]
	mov	DWORD PTR [ESP + 4], EAX
	mov	DWORD PTR [ESP], OFFSET __2E_str1
	call	_scanf
	mov	EAX, DWORD PTR [ESP + 8]
	mov	DWORD PTR [ESP + 4], EAX
	mov	DWORD PTR [ESP], OFFSET __2E_str2
	call	_printf
$BB1_1:	; return
	add	ESP, 12
	ret
_main	endp
_text	ends

_data	SEGMENT PARA 'DATA'
	ALIGN	16
__2E_str2:				; .str2
	db 'You entered: %d',10,0
__2E_str1:				; .str1
	db '%d',0
	ALIGN	16
__2E_str0:				; .str0
	db 'Enter an integer: ',0
_data	ends

	end
