.intel_syntax noprefix
							#; Declare some external functions
.extern	_printf
.text
a:		.int	5			#; int a=5;
fmt:	.string "a=%d, eax=%d"
							#; The printf format, "\n",'0'
							#; Code section
.global _helloasm3
_helloasm3:					#; the program label
		push	ebp			#; set up stack frame
		mov		ebp,esp

		call _calceax
		call __Z9helloasm4v@0

		add		eax, a		#; a+2
		push	eax			#; value of a+2
		push	a			#; value of variable a
		push	fmt			#; address of ctrl string
		call	_printf		#; Call C function
		add		esp, 12		#; pop stack 3 push times 4 bytes


		mov		esp, ebp	#; takedown stack frame
		pop		ebp			#; same as "leave" op

	mov	eax,0				#;  normal, no error, return value
	ret						#; return

.global __Z9helloasm4v@0
__Z9helloasm4v@0:			#; the program label
		push	ebp			#; set up stack frame
		mov		ebp,esp
		mov		esp, ebp	#; takedown stack frame
		pop		ebp			#; same as "leave" op

		call _calceax
	ret						#; return

.global _calceax
_calceax:
		push	ebp			#; set up stack frame
		mov		ebp,esp

		mov eax, 54
		mov ebx, 34
		imul eax, ebx

		mov		esp, ebp	#; takedown stack frame
		pop		ebp			#; same as "leave" op

	ret						#; return

