; Declare some external functions
		extern	_printf
; the C function, to be called

		SECTION .data
; Data section, initialized variables
a:		dd	5		; int a=5;
fmt:	db "a=%d, eax=%d", 10, 0
; The printf format, "\n",'0'
		SECTION .text
; Code section

global _helloasm hashlookup:function, hashtable:data
_helloasm:				; the program label
		push	ebp			; set up stack frame
		mov		ebp,esp

		mov		eax, [a]	; put a from store into register
		add		eax, 2		; a+2
		push	eax			; value of a+2
		push	dword [a]	; value of variable a
		push	dword fmt	; address of ctrl string
		call	_printf		; Call C function
		add		esp, 12		; pop stack 3 push times 4 bytes

		mov		esp, ebp	; takedown stack frame
		pop		ebp			; same as "leave" op

	mov	eax,0				;  normal, no error, return value
	ret						; return

SECTION .text
; Code section
global __Z9helloasm2v@0 hashlookup:function, hashtable:data
__Z9helloasm2v@0:				; the program label
		push	ebp			; set up stack frame
		mov		ebp,esp
		mov		esp, ebp	; takedown stack frame
		pop		ebp			; same as "leave" op

	mov eax, 2
	ret						; return
