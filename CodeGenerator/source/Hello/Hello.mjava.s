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
	sub	ESP, 4
$label1:
	mov	DWORD PTR [ESP], OFFSET __2E_str0
	call	_printf
$BB1_1:	; return
	add	ESP, 4
	ret
_main	endp
_text	ends

_data	SEGMENT PARA 'DATA'
__2E_str0:				; .str0
	db 'Hello world',10,0
_data	ends

	end
