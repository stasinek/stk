	.686p
	ifdef ??version
	if    ??version GT 500H
	.mmx
	endif
	endif
	model flat
	ifndef	??version
	?debug	macro
	endm
	endif
	?debug	S "D:\stasiek\My SugarSync\My Projects\X86_LIBRARIES\STK\cipher\stk_cipher_API.cpp"
	?debug	T "D:\stasiek\My SugarSync\My Projects\X86_LIBRARIES\STK\cipher\stk_cipher_API.cpp"
_TEXT	segment dword public use32 'CODE'
_TEXT	ends
_DATA	segment dword public use32 'DATA'
_DATA	ends
_BSS	segment dword public use32 'BSS'
_BSS	ends
$$BSYMS	segment byte public use32 'DEBSYM'
$$BSYMS	ends
$$BTYPES	segment byte public use32 'DEBTYP'
$$BTYPES	ends
$$BNAMES	segment byte public use32 'DEBNAM'
$$BNAMES	ends
$$BROWSE	segment byte public use32 'DEBSYM'
$$BROWSE	ends
$$BROWFILE	segment byte public use32 'DEBSYM'
$$BROWFILE	ends
DGROUP	group	_BSS,_DATA
_DATA	segment dword public use32 'DATA'
	align	4
$ecbhlcja	label	dword
	dd	14
	align	4
$mfbhlcja	label	qword
	db	8	dup(?)
$iabplcja	label	byte
	db	0
	align	4
$ejbhlcja	label	dword
	dd	1
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$DCR$@stk@cipher@cript_MTF$qqspvxui	segment virtual
	align	2
@@_$DCR$@stk@cipher@cript_MTF$qqspvxui	label	dword
	dd	@@$xt$p23stk@cipher@__mtf_cipher
	dd	8199
	dd	-4
	dd	0
@_$DCR$@stk@cipher@cript_MTF$qqspvxui	ends
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTS$@stk@cipher@cript_MTF$qqspvxui	segment virtual
	align	2
@@_$ECTS$@stk@cipher@cript_MTF$qqspvxui	label	dword
	dd	0
	dd	-40
	dw	0
	dw	5
	dd	0
	dd	0
	dw	8
	dw	5
	dd	0
	dd	@@_$DCR$@stk@cipher@cript_MTF$qqspvxui
@_$ECTS$@stk@cipher@cript_MTF$qqspvxui	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cipher@cript_MTF$qqspvxui	segment virtual
	align	2
@@stk@cipher@cript_MTF$qqspvxui	proc	near
?live16385@0:
	?debug L 11
@1:
	push      ebp
	mov       ebp,esp
	add       esp,-48
	mov       eax,offset __ExceptionHandler
	xor       edx,edx
	push      ebx
	push      esi
	push      edi
	mov       edi,dword ptr [ebp+8]
	mov       dword ptr [ebp-32],offset @@_$ECTS$@stk@cipher@cript_MTF$qqspvxui
	mov       dword ptr [ebp-28],esp
	mov       dword ptr [ebp-36],eax
	mov       word ptr [ebp-24],0
	mov       dword ptr [ebp-12],edx
	mov       ecx,dword ptr fs:[0]
	mov       dword ptr [ebp-40],ecx
	lea       eax,dword ptr [ebp-40]
	mov       dword ptr fs:[0],eax
	?debug L 14
?live16385@16: ; EDI = a_dst_ptr
	cmp       byte ptr [$iabplcja],0
	jne       short @2
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-48],eax
	mov       dword ptr [ebp-44],edx
	fild      qword ptr [ebp-48]
	fstp      qword ptr [$mfbhlcja]
	add       byte ptr [$iabplcja],1
	jno       $+2+5
	call      @@intover
@2:
	mov       ebx,offset s@
	push      47
	push      ebx
	call      @@std@strrchr$qpci
	add       esp,8
	add       eax,1
	cmp       eax,1
	jne       short @3
	push      92
	push      ebx
	call      @@std@strrchr$qpci
	add       esp,8
	add       eax,1
@3:
	cmp       eax,1
	jne       short @4
	mov       eax,ebx
@4:
	add       dword ptr [$ejbhlcja],1
	jno       $+2+5
	call      @@intover
	mov       edx,dword ptr [$ejbhlcja]
	push      edx
	push      14
	push      offset s@+79
	push      eax
	push      offset s@+80
	call      @@stk@con@prints$qpxce
	add       esp,20
	?debug L 16
	push      4
	call      @@$bnew$qui
	pop       ecx
	mov       dword ptr [ebp-4],eax
	test      eax,eax
	je        short @5
	mov       word ptr [ebp-24],20
	mov       edx,dword ptr [ebp-4]
	push      edx
	call      @@stk@cipher@__mtf_cipher@$bctr$qv
	pop       ecx
	mov       word ptr [ebp-24],8
	mov       esi,dword ptr [ebp-4]
	jmp       short @6
@5:
	mov       esi,dword ptr [ebp-4]
	?debug L 17
?live16385@48: ; ESI = mtf, EDI = a_dst_ptr
@6:
	mov       ebx,edi
	?debug L 18
?live16385@64: ; EBX = ptrd, ESI = mtf, EDI = a_dst_ptr
	add       edi,dword ptr [ebp+12]
	?debug L 20
?live16385@80: ; EBX = ptrd, ESI = mtf, EDI = ptrd_end
	cmp       edi,ebx
	jbe       short @8
	?debug L 22
@7:
	mov       al,byte ptr [ebx]
	push      eax
	push      esi
	call      @@stk@cipher@__mtf_cipher@encode$qqsxc
	mov       byte ptr [ebx],al
	?debug L 20
	add       ebx,1
	cmp       edi,ebx
	ja        short @7
	?debug L 26
?live16385@128: ; ESI = mtf
@8:
	push      3
	push      esi
	call      @@stk@cipher@__mtf_cipher@$bdtr$qv
	add       esp,8
	?debug L 27
?live16385@144: ; 
	mov       edx,dword ptr [ebp-40]
	mov       dword ptr fs:[0],edx
	?debug L 27
@10:
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret       8
	?debug L 0
@@stk@cipher@cript_MTF$qqspvxui	endp
@stk@cipher@cript_MTF$qqspvxui	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	db	2
	db	0
	db	0
	db	0
	dw	77
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch1
	dd	?patch2
	dd	?patch3
	df	@@stk@cipher@cript_MTF$qqspvxui
	dw	0
	dw	4096
	dw	0
	dw	1
	dw	0
	dw	0
	dw	0
	db	30
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	105
	db	112
	db	104
	db	101
	db	114
	db	64
	db	99
	db	114
	db	105
	db	112
	db	116
	db	95
	db	77
	db	84
	db	70
	db	36
	db	113
	db	113
	db	115
	db	112
	db	118
	db	120
	db	117
	db	105
	dw	18
	dw	512
	dw	8
	dw	0
	dw	1027
	dw	0
	dw	2
	dw	0
	dw	0
	dw	0
	dw	?patch4
	dw	529
	dw	?patch5
	dd	?live16385@16-@@stk@cipher@cript_MTF$qqspvxui
	dd	?live16385@80-?live16385@16
	dw	24
?patch5	equ	1
?patch4	equ	14
	dw	18
	dw	512
	dw	12
	dw	0
	dw	4097
	dw	0
	dw	3
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	1136
	dw	0
	dw	24
	dw	4
	dw	0
	dw	0
	dw	0
	dw	?patch6
	dw	529
	dw	?patch7
	dd	?live16385@80-@@stk@cipher@cript_MTF$qqspvxui
	dd	?live16385@128-?live16385@80
	dw	24
?patch7	equ	1
?patch6	equ	14
	dw	16
	dw	2
	dw	1136
	dw	0
	dw	20
	dw	5
	dw	0
	dw	0
	dw	0
	dw	?patch8
	dw	529
	dw	?patch9
	dd	?live16385@64-@@stk@cipher@cript_MTF$qqspvxui
	dd	?live16385@128-?live16385@64
	dw	20
?patch9	equ	1
?patch8	equ	14
	dw	16
	dw	2
	dw	65535
	dw	65535
	dw	23
	dw	6
	dw	0
	dw	0
	dw	0
	dw	?patch10
	dw	529
	dw	?patch11
	dd	?live16385@48-@@stk@cipher@cript_MTF$qqspvxui
	dd	?live16385@144-?live16385@48
	dw	23
?patch11	equ	1
?patch10	equ	14
	dw	16
	dw	2
	dw	1136
	dw	0
	dw	17
	dw	7
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	1136
	dw	0
	dw	20
	dw	8
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ejbhlcja
	dw	0
	dw	116
	dw	0
	dw	9
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mfbhlcja
	dw	0
	dw	65
	dw	0
	dw	10
	dw	0
	dw	0
	dw	0
	dw	?patch12
	dw	3
	dw	4099
	dw	0
	dw	11
	dw	0
	dw	0
	dw	0
	dw	14
?patch12	equ	16
?patch1	equ	@10-@@stk@cipher@cript_MTF$qqspvxui+9
?patch2	equ	0
?patch3	equ	@10-@@stk@cipher@cript_MTF$qqspvxui
	dw	2
	dw	6
	dw	8
	dw	531
	dw	7
	dw	65476
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eachlcja	label	dword
	dd	33
	align	4
$mdchlcja	label	qword
	db	8	dup(?)
$afcplcja	label	byte
	db	0
	align	4
$ehchlcja	label	dword
	dd	1
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$DCT$@stk@cipher@uncript_MTF$qqspvxui	segment virtual
	align	2
@@_$DCT$@stk@cipher@uncript_MTF$qqspvxui	label	dword
	dd	@@$xt$p23stk@cipher@__mtf_cipher
	dd	8199
	dd	-4
	dd	0
@_$DCT$@stk@cipher@uncript_MTF$qqspvxui	ends
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTU$@stk@cipher@uncript_MTF$qqspvxui	segment virtual
	align	2
@@_$ECTU$@stk@cipher@uncript_MTF$qqspvxui	label	dword
	dd	0
	dd	-40
	dw	0
	dw	5
	dd	0
	dd	0
	dw	8
	dw	5
	dd	0
	dd	@@_$DCT$@stk@cipher@uncript_MTF$qqspvxui
@_$ECTU$@stk@cipher@uncript_MTF$qqspvxui	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cipher@uncript_MTF$qqspvxui	segment virtual
	align	2
@@stk@cipher@uncript_MTF$qqspvxui	proc	near
?live16390@0:
	?debug L 30
@11:
	push      ebp
	mov       ebp,esp
	add       esp,-48
	mov       eax,offset __ExceptionHandler
	xor       edx,edx
	push      ebx
	push      esi
	push      edi
	mov       edi,dword ptr [ebp+8]
	mov       dword ptr [ebp-32],offset @@_$ECTU$@stk@cipher@uncript_MTF$qqspvxui
	mov       dword ptr [ebp-28],esp
	mov       dword ptr [ebp-36],eax
	mov       word ptr [ebp-24],0
	mov       dword ptr [ebp-12],edx
	mov       ecx,dword ptr fs:[0]
	mov       dword ptr [ebp-40],ecx
	lea       eax,dword ptr [ebp-40]
	mov       dword ptr fs:[0],eax
	?debug L 33
?live16390@16: ; EDI = a_dst_ptr
	cmp       byte ptr [$afcplcja],0
	jne       short @12
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-48],eax
	mov       dword ptr [ebp-44],edx
	fild      qword ptr [ebp-48]
	fstp      qword ptr [$mdchlcja]
	add       byte ptr [$afcplcja],1
	jno       $+2+5
	call      @@intover
@12:
	mov       ebx,offset s@
	push      47
	push      ebx
	call      @@std@strrchr$qpci
	add       esp,8
	add       eax,1
	cmp       eax,1
	jne       short @13
	push      92
	push      ebx
	call      @@std@strrchr$qpci
	add       esp,8
	add       eax,1
@13:
	cmp       eax,1
	jne       short @14
	mov       eax,ebx
@14:
	add       dword ptr [$ehchlcja],1
	jno       $+2+5
	call      @@intover
	mov       edx,dword ptr [$ehchlcja]
	push      edx
	push      33
	push      offset s@+79
	push      eax
	push      offset s@+80
	call      @@stk@con@prints$qpxce
	add       esp,20
	?debug L 35
	push      4
	call      @@$bnew$qui
	pop       ecx
	mov       dword ptr [ebp-4],eax
	test      eax,eax
	je        short @15
	mov       word ptr [ebp-24],20
	mov       edx,dword ptr [ebp-4]
	push      edx
	call      @@stk@cipher@__mtf_cipher@$bctr$qv
	pop       ecx
	mov       word ptr [ebp-24],8
	mov       esi,dword ptr [ebp-4]
	jmp       short @16
@15:
	mov       esi,dword ptr [ebp-4]
	?debug L 36
?live16390@48: ; ESI = mtf, EDI = a_dst_ptr
@16:
	mov       ebx,edi
	?debug L 37
?live16390@64: ; EBX = ptrd, ESI = mtf, EDI = a_dst_ptr
	add       edi,dword ptr [ebp+12]
	?debug L 39
?live16390@80: ; EBX = ptrd, ESI = mtf, EDI = ptrd_end
	cmp       edi,ebx
	jbe       short @18
	?debug L 41
@17:
	mov       al,byte ptr [ebx]
	push      eax
	push      esi
	call      @@stk@cipher@__mtf_cipher@decode$qqsxc
	mov       byte ptr [ebx],al
	?debug L 39
	add       ebx,1
	cmp       edi,ebx
	ja        short @17
	?debug L 45
?live16390@128: ; ESI = mtf
@18:
	push      3
	push      esi
	call      @@stk@cipher@__mtf_cipher@$bdtr$qv
	add       esp,8
	?debug L 46
?live16390@144: ; 
	mov       edx,dword ptr [ebp-40]
	mov       dword ptr fs:[0],edx
	?debug L 46
@20:
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret       8
	?debug L 0
@@stk@cipher@uncript_MTF$qqspvxui	endp
@stk@cipher@uncript_MTF$qqspvxui	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	79
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch13
	dd	?patch14
	dd	?patch15
	df	@@stk@cipher@uncript_MTF$qqspvxui
	dw	0
	dw	4100
	dw	0
	dw	12
	dw	0
	dw	0
	dw	0
	db	32
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	105
	db	112
	db	104
	db	101
	db	114
	db	64
	db	117
	db	110
	db	99
	db	114
	db	105
	db	112
	db	116
	db	95
	db	77
	db	84
	db	70
	db	36
	db	113
	db	113
	db	115
	db	112
	db	118
	db	120
	db	117
	db	105
	dw	18
	dw	512
	dw	8
	dw	0
	dw	1027
	dw	0
	dw	13
	dw	0
	dw	0
	dw	0
	dw	?patch16
	dw	529
	dw	?patch17
	dd	?live16390@16-@@stk@cipher@uncript_MTF$qqspvxui
	dd	?live16390@80-?live16390@16
	dw	24
?patch17	equ	1
?patch16	equ	14
	dw	18
	dw	512
	dw	12
	dw	0
	dw	4097
	dw	0
	dw	14
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	1136
	dw	0
	dw	24
	dw	15
	dw	0
	dw	0
	dw	0
	dw	?patch18
	dw	529
	dw	?patch19
	dd	?live16390@80-@@stk@cipher@uncript_MTF$qqspvxui
	dd	?live16390@128-?live16390@80
	dw	24
?patch19	equ	1
?patch18	equ	14
	dw	16
	dw	2
	dw	1136
	dw	0
	dw	20
	dw	16
	dw	0
	dw	0
	dw	0
	dw	?patch20
	dw	529
	dw	?patch21
	dd	?live16390@64-@@stk@cipher@uncript_MTF$qqspvxui
	dd	?live16390@128-?live16390@64
	dw	20
?patch21	equ	1
?patch20	equ	14
	dw	16
	dw	2
	dw	65535
	dw	65535
	dw	23
	dw	17
	dw	0
	dw	0
	dw	0
	dw	?patch22
	dw	529
	dw	?patch23
	dd	?live16390@48-@@stk@cipher@uncript_MTF$qqspvxui
	dd	?live16390@144-?live16390@48
	dw	23
?patch23	equ	1
?patch22	equ	14
	dw	16
	dw	2
	dw	1136
	dw	0
	dw	17
	dw	18
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	1136
	dw	0
	dw	20
	dw	19
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ehchlcja
	dw	0
	dw	116
	dw	0
	dw	20
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mdchlcja
	dw	0
	dw	65
	dw	0
	dw	21
	dw	0
	dw	0
	dw	0
	dw	?patch24
	dw	3
	dw	4099
	dw	0
	dw	22
	dw	0
	dw	0
	dw	0
	dw	33
?patch24	equ	16
?patch13	equ	@20-@@stk@cipher@uncript_MTF$qqspvxui+9
?patch14	equ	0
?patch15	equ	@20-@@stk@cipher@uncript_MTF$qqspvxui
	dw	2
	dw	6
	dw	8
	dw	531
	dw	7
	dw	65476
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eochlcja	label	dword
	dd	52
	align	4
$mbdhlcja	label	qword
	db	8	dup(?)
$ipcplcja	label	byte
	db	0
	align	4
$efdhlcja	label	dword
	dd	1
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cipher@cript_XOR$qqspvxuipxcxui	segment virtual
	align	2
@@stk@cipher@cript_XOR$qqspvxuipxcxui	proc	near
?live16393@0:
	?debug L 49
	push      ebp
	mov       ebp,esp
	add       esp,-8
	push      ebx
	push      esi
	push      edi
	?debug L 52
@21:
	cmp       byte ptr [$ipcplcja],0
	jne       short @22
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	fild      qword ptr [ebp-8]
	fstp      qword ptr [$mbdhlcja]
	add       byte ptr [$ipcplcja],1
	jno       $+2+5
	call      @@intover
@22:
	mov       ebx,offset s@
	push      47
	push      ebx
	call      @@std@strrchr$qpci
	add       esp,8
	add       eax,1
	cmp       eax,1
	jne       short @23
	push      92
	push      ebx
	call      @@std@strrchr$qpci
	add       esp,8
	add       eax,1
@23:
	cmp       eax,1
	jne       short @24
	mov       eax,ebx
@24:
	add       dword ptr [$efdhlcja],1
	jno       $+2+5
	call      @@intover
	mov       edx,dword ptr [$efdhlcja]
	push      edx
	push      52
	push      offset s@+79
	push      eax
	push      offset s@+80
	call      @@stk@con@prints$qpxce
	add       esp,20
	?debug L 56
	mov	 EDI,dword ptr [ebp+8]
	?debug L 57
	mov	 EDX,EDI
	?debug L 58
	add	 EDX,dword ptr [ebp+12]
	?debug L 59
	cmp	 EDI,EDX
	?debug L 60
	jge       @25
	?debug L 61
	mov	 ESI,dword ptr [ebp+16]
	?debug L 62
	mov	 ECX,dword ptr [ebp+20]
	?debug L 63
	add	 ECX,ESI
	?debug L 64
	cmp	 ESI,ECX
	?debug L 65
	jge       @25
	?debug L 66
	mov	 EBX,ESI
	?debug L 67
@26:
cript_XOR_LOOP:
	?debug L 68
	mov	 AL,[ESI]
	?debug L 69
	xor	 [EDI],AL
	?debug L 70
	inc	 ESI
	?debug L 71
	cmp	 ESI,ECX
	?debug L 72
	jl        short @27
	?debug L 73
	mov	 ESI,EBX
	?debug L 74
@27:
cript_XOR_PLAIN:
	?debug L 75
	inc	 EDI
	?debug L 76
	cmp	 EDI,EDX
	?debug L 77
	jl        @26
	?debug L 78
	mov	 ESI,EBX
	?debug L 79
@25:
cript_XOR_EXIT:
	?debug L 83
@28:
	pop       edi
	pop       esi
	pop       ebx
	pop       ecx
	pop       ecx
	pop       ebp
	ret       16
	?debug L 0
@@stk@cipher@cript_XOR$qqspvxuipxcxui	endp
@stk@cipher@cript_XOR$qqspvxuipxcxui	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	83
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch25
	dd	?patch26
	dd	?patch27
	df	@@stk@cipher@cript_XOR$qqspvxuipxcxui
	dw	0
	dw	4102
	dw	0
	dw	23
	dw	0
	dw	0
	dw	0
	db	36
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	105
	db	112
	db	104
	db	101
	db	114
	db	64
	db	99
	db	114
	db	105
	db	112
	db	116
	db	95
	db	88
	db	79
	db	82
	db	36
	db	113
	db	113
	db	115
	db	112
	db	118
	db	120
	db	117
	db	105
	db	112
	db	120
	db	99
	db	120
	db	117
	db	105
	dw	18
	dw	512
	dw	8
	dw	0
	dw	1027
	dw	0
	dw	24
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	12
	dw	0
	dw	4097
	dw	0
	dw	25
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	16
	dw	0
	dw	4103
	dw	0
	dw	26
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	20
	dw	0
	dw	4097
	dw	0
	dw	27
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	1136
	dw	0
	dw	17
	dw	28
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	1136
	dw	0
	dw	20
	dw	29
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$efdhlcja
	dw	0
	dw	116
	dw	0
	dw	30
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mbdhlcja
	dw	0
	dw	65
	dw	0
	dw	31
	dw	0
	dw	0
	dw	0
	dw	?patch28
	dw	3
	dw	4099
	dw	0
	dw	32
	dw	0
	dw	0
	dw	0
	dw	52
?patch28	equ	16
?patch25	equ	@28-@@stk@cipher@cript_XOR$qqspvxuipxcxui+9
?patch26	equ	0
?patch27	equ	@28-@@stk@cipher@cript_XOR$qqspvxuipxcxui
	dw	2
	dw	6
	dw	8
	dw	531
	dw	7
	dw	65516
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$emdhlcja	label	dword
	dd	89
	align	4
$mpdhlcja	label	qword
	db	8	dup(?)
$addplcja	label	byte
	db	0
	align	4
$edehlcja	label	dword
	dd	1
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cipher@uncript_XOR$qqspvxuipxcxui	segment virtual
	align	2
@@stk@cipher@uncript_XOR$qqspvxuipxcxui	proc	near
?live16394@0:
	?debug L 86
@29:
	push      ebp
	mov       ebp,esp
	add       esp,-8
	?debug L 89
	cmp       byte ptr [$addplcja],0
	?debug L 86
	push      ebx
	?debug L 89
	jne       short @30
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	fild      qword ptr [ebp-8]
	fstp      qword ptr [$mpdhlcja]
	add       byte ptr [$addplcja],1
	jno       $+2+5
	call      @@intover
@30:
	mov       ebx,offset s@
	push      47
	push      ebx
	call      @@std@strrchr$qpci
	add       esp,8
	add       eax,1
	cmp       eax,1
	jne       short @31
	push      92
	push      ebx
	call      @@std@strrchr$qpci
	add       esp,8
	add       eax,1
@31:
	cmp       eax,1
	jne       short @32
	mov       eax,ebx
@32:
	add       dword ptr [$edehlcja],1
	jno       $+2+5
	call      @@intover
	mov       edx,dword ptr [$edehlcja]
	push      edx
	push      89
	push      offset s@+79
	push      eax
	push      offset s@+80
	call      @@stk@con@prints$qpxce
	add       esp,20
	?debug L 91
	mov       ecx,dword ptr [ebp+20]
	push      ecx
	mov       eax,dword ptr [ebp+16]
	push      eax
	mov       edx,dword ptr [ebp+12]
	push      edx
	mov       ecx,dword ptr [ebp+8]
	push      ecx
	call      @@stk@cipher@cript_XOR$qqspvxuipxcxui
	?debug L 92
@33:
	pop       ebx
	pop       ecx
	pop       ecx
	pop       ebp
	ret       16
	?debug L 0
@@stk@cipher@uncript_XOR$qqspvxuipxcxui	endp
@stk@cipher@uncript_XOR$qqspvxuipxcxui	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	85
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch29
	dd	?patch30
	dd	?patch31
	df	@@stk@cipher@uncript_XOR$qqspvxuipxcxui
	dw	0
	dw	4106
	dw	0
	dw	33
	dw	0
	dw	0
	dw	0
	db	38
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	105
	db	112
	db	104
	db	101
	db	114
	db	64
	db	117
	db	110
	db	99
	db	114
	db	105
	db	112
	db	116
	db	95
	db	88
	db	79
	db	82
	db	36
	db	113
	db	113
	db	115
	db	112
	db	118
	db	120
	db	117
	db	105
	db	112
	db	120
	db	99
	db	120
	db	117
	db	105
	dw	18
	dw	512
	dw	8
	dw	0
	dw	1027
	dw	0
	dw	34
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	12
	dw	0
	dw	4097
	dw	0
	dw	35
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	16
	dw	0
	dw	4103
	dw	0
	dw	36
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	20
	dw	0
	dw	4097
	dw	0
	dw	37
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	1136
	dw	0
	dw	17
	dw	38
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	1136
	dw	0
	dw	20
	dw	39
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$edehlcja
	dw	0
	dw	116
	dw	0
	dw	40
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mpdhlcja
	dw	0
	dw	65
	dw	0
	dw	41
	dw	0
	dw	0
	dw	0
	dw	?patch32
	dw	3
	dw	4099
	dw	0
	dw	42
	dw	0
	dw	0
	dw	0
	dw	89
?patch32	equ	16
?patch29	equ	@33-@@stk@cipher@uncript_XOR$qqspvxuipxcxui+7
?patch30	equ	0
?patch31	equ	@33-@@stk@cipher@uncript_XOR$qqspvxuipxcxui
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65524
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ekehlcja	label	dword
	dd	98
	align	4
$mnehlcja	label	qword
	db	8	dup(?)
$igdplcja	label	byte
	db	0
	align	4
$ebfhlcja	label	dword
	dd	1
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cipher@cript_ROT$qqspvxuixui	segment virtual
	align	2
@@stk@cipher@cript_ROT$qqspvxuixui	proc	near
?live16395@0:
	?debug L 95
	push      ebp
	mov       ebp,esp
	add       esp,-24
	push      ebx
	push      esi
	push      edi
	mov       edi,dword ptr [ebp+16]
	mov       esi,dword ptr [ebp+8]
	?debug L 98
?live16395@16: ; ESI = a_dst_ptr, EDI = a_haslo_count
@34:
	cmp       byte ptr [$igdplcja],0
	jne       short @35
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-24],eax
	mov       dword ptr [ebp-20],edx
	fild      qword ptr [ebp-24]
	fstp      qword ptr [$mnehlcja]
	add       byte ptr [$igdplcja],1
	jno       $+2+5
	call      @@intover
@35:
	mov       ebx,offset s@
	push      47
	push      ebx
	call      @@std@strrchr$qpci
	add       esp,8
	add       eax,1
	cmp       eax,1
	jne       short @36
	push      92
	push      ebx
	call      @@std@strrchr$qpci
	add       esp,8
	add       eax,1
@36:
	cmp       eax,1
	jne       short @37
	mov       eax,ebx
@37:
	add       dword ptr [$ebfhlcja],1
	jno       $+2+5
	call      @@intover
	mov       edx,dword ptr [$ebfhlcja]
	push      edx
	push      98
	push      offset s@+79
	push      eax
	push      offset s@+80
	call      @@stk@con@prints$qpxce
	add       esp,20
	?debug L 100
	cmp       edi,1
	jbe       @39
	?debug L 103
?live16395@48: ; 
@38:
	mov       word ptr [ebp-2],di
	?debug L 104
?live16395@64: ; ESI = a_dst_ptr
	movsx     ebx,word ptr [ebp-2]
	mov       eax,ebx
	imul      ebx
	jno       $+2+5
	call      @@intover
	mov       word ptr [ebp-4],ax
	?debug L 105
?live16395@80: ; EBX = @temp2, ESI = a_dst_ptr
	add       ebx,1
	jno       $+2+5
	call      @@intover
	push      ebx
	call      @@stk@cstr@alloc$qqsui
	mov       dword ptr [ebp-8],eax
	?debug L 106
?live16395@96: ; ESI = a_dst_ptr
	mov       dword ptr [ebp-12],esi
	?debug L 107
	add       esi,dword ptr [ebp+12]
	movsx     edx,word ptr [ebp-2]
	sub       esi,edx
	mov       dword ptr [ebp-16],esi
	?debug L 110
?live16395@128: ; 
	movzx	 EAX,word ptr [ebp-2]
	?debug L 111
	movzx	 EBX,word ptr [ebp-4]
	?debug L 112
	mov	 EDI,dword ptr [ebp-12]
	?debug L 113
	mov	 EDX,dword ptr [ebp-16]
	?debug L 114
	cmp	 EDI,EDX
	?debug L 115
	ja        @40
	?debug L 116
	nop	
	?debug L 117
@41:
cript_ROT_main_LOOP:
	?debug L 118
	xor	 ECX,ECX
	?debug L 119
	mov	 ESI,dword ptr [ebp-8]
	?debug L 120
	push	 EDX
	?debug L 121
	xor	 EDX,EDX
	?debug L 122
@42:
cript_ROT_buff_count:
	?debug L 123
@43:
cript_ROT_sq:
	?debug L 124
	push	 EAX
	?debug L 125
	mov	  AL,[EDI+ECX]
	?debug L 126
	mov	 [ESI],AL
	?debug L 127
	pop	 EAX
	?debug L 128
	inc	 ESI
	?debug L 129
	add	  CX,AX
	?debug L 130
	cmp	  CX,BX
	?debug L 131
	jl        @43
	?debug L 132
	sub	  CX,BX
	?debug L 133
	inc	  DX
	?debug L 134
	inc	  CX
	?debug L 135
	cmp	  DX,AX
	?debug L 136
	jb        @42
	?debug L 137
	pop	 EDX
	?debug L 138
	mov	 ESI,dword ptr [ebp-8]
	?debug L 139
	cld	
	?debug L 140
	movzx	 ECX,BX
	?debug L 141
	shr	 ECX,2
	?debug L 142
	rep MOVSD	
	?debug L 143
	movzx	 ECX,BX
	?debug L 144
	and	 ECX,3
	?debug L 145
	rep MOVSB	
	?debug L 146
	cmp	 EDI,EDX
	?debug L 147
	jbe       @41
	?debug L 148
	nop	
	?debug L 149
@40:
cript_ROT_BREAK:
	?debug L 153
	mov       ecx,dword ptr [ebp-8]
	push      ecx
	call      @@stk@cstr@free$qqspc
	?debug L 154
@44:
@39:
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret       12
	?debug L 0
@@stk@cipher@cript_ROT$qqspvxuixui	endp
@stk@cipher@cript_ROT$qqspvxuixui	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	80
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch33
	dd	?patch34
	dd	?patch35
	df	@@stk@cipher@cript_ROT$qqspvxuixui
	dw	0
	dw	4108
	dw	0
	dw	43
	dw	0
	dw	0
	dw	0
	db	33
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	105
	db	112
	db	104
	db	101
	db	114
	db	64
	db	99
	db	114
	db	105
	db	112
	db	116
	db	95
	db	82
	db	79
	db	84
	db	36
	db	113
	db	113
	db	115
	db	112
	db	118
	db	120
	db	117
	db	105
	db	120
	db	117
	db	105
	dw	18
	dw	512
	dw	8
	dw	0
	dw	1027
	dw	0
	dw	44
	dw	0
	dw	0
	dw	0
	dw	?patch36
	dw	529
	dw	?patch37
	dd	?live16395@16-@@stk@cipher@cript_ROT$qqspvxuixui
	dd	?live16395@48-?live16395@16
	dw	23
	dd	?live16395@64-@@stk@cipher@cript_ROT$qqspvxuixui
	dd	?live16395@128-?live16395@64
	dw	23
?patch37	equ	2
?patch36	equ	24
	dw	18
	dw	512
	dw	12
	dw	0
	dw	4097
	dw	0
	dw	45
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	16
	dw	0
	dw	4097
	dw	0
	dw	46
	dw	0
	dw	0
	dw	0
	dw	?patch38
	dw	529
	dw	?patch39
	dd	?live16395@16-@@stk@cipher@cript_ROT$qqspvxuixui
	dd	?live16395@48-?live16395@16
	dw	24
?patch39	equ	1
?patch38	equ	14
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	1136
	dw	0
	dw	47
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	1136
	dw	0
	dw	48
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	1136
	dw	0
	dw	49
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65532
	dw	65535
	dw	17
	dw	0
	dw	50
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65534
	dw	65535
	dw	17
	dw	0
	dw	51
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	1136
	dw	0
	dw	17
	dw	52
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	1136
	dw	0
	dw	20
	dw	53
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ebfhlcja
	dw	0
	dw	116
	dw	0
	dw	54
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mnehlcja
	dw	0
	dw	65
	dw	0
	dw	55
	dw	0
	dw	0
	dw	0
	dw	?patch40
	dw	3
	dw	4099
	dw	0
	dw	56
	dw	0
	dw	0
	dw	0
	dw	98
?patch40	equ	16
?patch33	equ	@44-@@stk@cipher@cript_ROT$qqspvxuixui+9
?patch34	equ	0
?patch35	equ	@44-@@stk@cipher@cript_ROT$qqspvxuixui
	dw	2
	dw	6
	dw	8
	dw	531
	dw	7
	dw	65500
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eifhlcja	label	dword
	dd	160
	align	4
$mlfhlcja	label	qword
	db	8	dup(?)
$akdplcja	label	byte
	db	0
	align	4
$epfhlcja	label	dword
	dd	1
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cipher@uncript_ROT$qqspvxuixui	segment virtual
	align	2
@@stk@cipher@uncript_ROT$qqspvxuixui	proc	near
?live16396@0:
	?debug L 157
@45:
	push      ebp
	mov       ebp,esp
	add       esp,-8
	?debug L 160
	cmp       byte ptr [$akdplcja],0
	?debug L 157
	push      ebx
	?debug L 160
	jne       short @46
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	fild      qword ptr [ebp-8]
	fstp      qword ptr [$mlfhlcja]
	add       byte ptr [$akdplcja],1
	jno       $+2+5
	call      @@intover
@46:
	mov       ebx,offset s@
	push      47
	push      ebx
	call      @@std@strrchr$qpci
	add       esp,8
	add       eax,1
	cmp       eax,1
	jne       short @47
	push      92
	push      ebx
	call      @@std@strrchr$qpci
	add       esp,8
	add       eax,1
@47:
	cmp       eax,1
	jne       short @48
	mov       eax,ebx
@48:
	add       dword ptr [$epfhlcja],1
	jno       $+2+5
	call      @@intover
	mov       edx,dword ptr [$epfhlcja]
	push      edx
	push      160
	push      offset s@+79
	push      eax
	push      offset s@+80
	call      @@stk@con@prints$qpxce
	add       esp,20
	?debug L 162
	mov       ecx,dword ptr [ebp+16]
	push      ecx
	mov       eax,dword ptr [ebp+12]
	push      eax
	mov       edx,dword ptr [ebp+8]
	push      edx
	call      @@stk@cipher@cript_ROT$qqspvxuixui
	?debug L 163
@49:
	pop       ebx
	pop       ecx
	pop       ecx
	pop       ebp
	ret       12
	?debug L 0
@@stk@cipher@uncript_ROT$qqspvxuixui	endp
@stk@cipher@uncript_ROT$qqspvxuixui	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	82
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch41
	dd	?patch42
	dd	?patch43
	df	@@stk@cipher@uncript_ROT$qqspvxuixui
	dw	0
	dw	4110
	dw	0
	dw	57
	dw	0
	dw	0
	dw	0
	db	35
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	105
	db	112
	db	104
	db	101
	db	114
	db	64
	db	117
	db	110
	db	99
	db	114
	db	105
	db	112
	db	116
	db	95
	db	82
	db	79
	db	84
	db	36
	db	113
	db	113
	db	115
	db	112
	db	118
	db	120
	db	117
	db	105
	db	120
	db	117
	db	105
	dw	18
	dw	512
	dw	8
	dw	0
	dw	1027
	dw	0
	dw	58
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	12
	dw	0
	dw	4097
	dw	0
	dw	59
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	16
	dw	0
	dw	4097
	dw	0
	dw	60
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	1136
	dw	0
	dw	17
	dw	61
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	1136
	dw	0
	dw	20
	dw	62
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$epfhlcja
	dw	0
	dw	116
	dw	0
	dw	63
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mlfhlcja
	dw	0
	dw	65
	dw	0
	dw	64
	dw	0
	dw	0
	dw	0
	dw	?patch44
	dw	3
	dw	4099
	dw	0
	dw	65
	dw	0
	dw	0
	dw	0
	dw	160
?patch44	equ	16
?patch41	equ	@49-@@stk@cipher@uncript_ROT$qqspvxuixui+7
?patch42	equ	0
?patch43	equ	@49-@@stk@cipher@uncript_ROT$qqspvxuixui
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65524
	dw	65535
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
@$bnew$qui	segment virtual
	align	2
@@$bnew$qui	proc	near
?live16386@0:
	?debug	T "D:\stasiek\My SugarSync\My Projects\X86_LIBRARIES\STK\cipher\.\..\TEXT\./../mem/stk_mem.h"
	?debug L 91
@50:
	push      ebp
	mov       ebp,esp
	?debug L 92
	mov       eax,dword ptr [ebp+8]
	push      eax
	call      @@stk@mem@alloc$qqsxui
	?debug L 92
@52:
@51:
	pop       ebp
	ret 
	?debug L 0
@@$bnew$qui	endp
@$bnew$qui	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	57
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch45
	dd	?patch46
	dd	?patch47
	df	@@$bnew$qui
	dw	0
	dw	4112
	dw	0
	dw	66
	dw	0
	dw	0
	dw	0
	db	10
	db	64
	db	36
	db	98
	db	110
	db	101
	db	119
	db	36
	db	113
	db	117
	db	105
	dw	18
	dw	512
	dw	8
	dw	0
	dw	117
	dw	0
	dw	67
	dw	0
	dw	0
	dw	0
?patch45	equ	@52-@@$bnew$qui+2
?patch46	equ	0
?patch47	equ	@52-@@$bnew$qui
	dw	2
	dw	6
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
@$xt$p23stk@cipher@__mtf_cipher	segment virtual
	align	2
@@$xt$p23stk@cipher@__mtf_cipher	label	dword
	dd	4
	dw	16
	dw	12
	dd	@@$xt$23stk@cipher@__mtf_cipher
	db	115
	db	116
	db	107
	db	58
	db	58
	db	99
	db	105
	db	112
	db	104
	db	101
	db	114
	db	58
	db	58
	db	95
	db	95
	db	109
	db	116
	db	102
	db	95
	db	99
	db	105
	db	112
	db	104
	db	101
	db	114
	db	32
	db	42
	db	0
@$xt$p23stk@cipher@__mtf_cipher	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@$xt$23stk@cipher@__mtf_cipher	segment virtual
	align	2
@@$xt$23stk@cipher@__mtf_cipher	label	byte
	dd	4
	dw	3
	dw	48
	dd	-1
	dd	3
	dw	76
	dw	80
	dd	0
	dw	0
	dw	0
	dd	0
	dd	1
	dd	1
	dd	@@stk@cipher@__mtf_cipher@$bdtr$qv
	dw	1
	dw	84
	db	115
	db	116
	db	107
	db	58
	db	58
	db	99
	db	105
	db	112
	db	104
	db	101
	db	114
	db	58
	db	58
	db	95
	db	95
	db	109
	db	116
	db	102
	db	95
	db	99
	db	105
	db	112
	db	104
	db	101
	db	114
	db	0
	db	0
	db	0
	dd	0
	dd	0
	dd	0
@$xt$23stk@cipher@__mtf_cipher	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
s@	label	byte
	;	s@+0:
	db	"D:\stasiek\My SugarSync\My Projects\X86_LIBRARIES\STK\ciphe"
	;	s@+59:
	db	"r\stk_cipher_API.cpp",0
	;	s@+80:
	db	"DEBUG: %s: Enter function: %s@%d line, for %d time",10,0
	db	0
	align	4
_DATA	ends
_TEXT	segment dword public use32 'CODE'
_TEXT	ends
@@stk@time@time_ms$qqsv equ @stk@time@time_ms$qqsv
 extrn   @stk@time@time_ms$qqsv:near
@@std@strrchr$qpci equ @std@strrchr$qpci
 extrn   @std@strrchr$qpci:near
@@stk@con@prints$qpxce equ @stk@con@prints$qpxce
 extrn   @stk@con@prints$qpxce:near
@@stk@cipher@__mtf_cipher@$bctr$qv equ @stk@cipher@__mtf_cipher@$bctr$qv
 extrn   @stk@cipher@__mtf_cipher@$bctr$qv:near
@@stk@cipher@__mtf_cipher@encode$qqsxc equ @stk@cipher@__mtf_cipher@encode$qqsxc
 extrn   @stk@cipher@__mtf_cipher@encode$qqsxc:near
@@stk@cipher@__mtf_cipher@$bdtr$qv equ @stk@cipher@__mtf_cipher@$bdtr$qv
 extrn   @stk@cipher@__mtf_cipher@$bdtr$qv:near
 extrn   __Exception_list:dword
 extrn   __ExceptionHandler:near
 extrn   @@intover:near
@@stk@cipher@__mtf_cipher@decode$qqsxc equ @stk@cipher@__mtf_cipher@decode$qqsxc
 extrn   @stk@cipher@__mtf_cipher@decode$qqsxc:near
@@stk@cstr@alloc$qqsui equ @stk@cstr@alloc$qqsui
 extrn   @stk@cstr@alloc$qqsui:near
@@stk@cstr@free$qqspc equ @stk@cstr@free$qqspc
 extrn   @stk@cstr@free$qqspc:near
@@stk@mem@alloc$qqsxui equ @stk@mem@alloc$qqsxui
 extrn   @stk@mem@alloc$qqsxui:near
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	?patch48
	dw	37
	dw	68
	dw	0
	dw	0
	dw	0
	dw	0
?patch48	equ	12
	dw	?patch49
	dw	37
	dw	69
	dw	0
	dw	0
	dw	0
	dw	0
?patch49	equ	12
	dw	?patch50
	dw	37
	dw	70
	dw	0
	dw	0
	dw	0
	dw	0
?patch50	equ	12
	dw	?patch51
	dw	37
	dw	71
	dw	0
	dw	0
	dw	0
	dw	0
?patch51	equ	12
	dw	?patch52
	dw	37
	dw	72
	dw	0
	dw	0
	dw	0
	dw	0
?patch52	equ	12
	dw	?patch53
	dw	37
	dw	73
	dw	0
	dw	0
	dw	0
	dw	0
?patch53	equ	12
	dw	?patch54
	dw	37
	dw	74
	dw	0
	dw	0
	dw	0
	dw	0
?patch54	equ	12
	dw	?patch55
	dw	37
	dw	75
	dw	0
	dw	0
	dw	0
	dw	0
?patch55	equ	12
	dw	?patch56
	dw	38
	dw	514
	dw	76
	dw	0
	dw	77
	dw	0
	dw	78
	dw	0
	dw	79
	dw	0
	dw	80
	dw	0
	dw	81
	dw	0
	dw	82
	dw	0
	dw	83
	dw	0
	dw	84
	dw	0
	dw	85
	dw	0
	dw	86
	dw	0
	dw	87
	dw	0
	dw	88
	dw	0
	dw	89
	dw	0
	dw	90
	dw	0
	dw	91
	dw	0
	dw	92
	dw	0
	dw	93
	dw	0
	dw	94
	dw	0
	dw	95
	dw	0
	dw	96
	dw	0
	dw	97
	dw	0
	dw	98
	dw	0
	dw	99
	dw	0
	dw	100
	dw	0
	dw	101
	dw	0
	dw	102
	dw	0
	dw	103
	dw	0
	dw	104
	dw	0
	dw	105
	dw	0
	dw	106
	dw	0
	dw	107
	dw	0
	dw	108
	dw	0
	dw	109
	dw	0
	dw	110
	dw	0
	dw	111
	dw	0
	dw	112
	dw	0
	dw	113
	dw	0
	dw	114
	dw	0
	dw	115
	dw	0
	dw	116
	dw	0
	dw	117
	dw	0
	dw	118
	dw	0
	dw	119
	dw	0
	dw	120
	dw	0
	dw	121
	dw	0
	dw	122
	dw	0
	dw	123
	dw	0
	dw	124
	dw	0
	dw	125
	dw	0
	dw	126
	dw	0
	dw	127
	dw	0
	dw	128
	dw	0
	dw	129
	dw	0
	dw	130
	dw	0
	dw	131
	dw	0
	dw	132
	dw	0
	dw	133
	dw	0
	dw	134
	dw	0
	dw	135
	dw	0
	dw	136
	dw	0
	dw	137
	dw	0
	dw	138
	dw	0
	dw	139
	dw	0
	dw	140
	dw	0
	dw	141
	dw	0
	dw	142
	dw	0
	dw	143
	dw	0
	dw	144
	dw	0
	dw	145
	dw	0
	dw	146
	dw	0
	dw	147
	dw	0
	dw	148
	dw	0
	dw	149
	dw	0
	dw	150
	dw	0
	dw	151
	dw	0
	dw	152
	dw	0
	dw	153
	dw	0
	dw	154
	dw	0
	dw	155
	dw	0
	dw	156
	dw	0
	dw	157
	dw	0
	dw	158
	dw	0
	dw	159
	dw	0
	dw	160
	dw	0
	dw	161
	dw	0
	dw	162
	dw	0
	dw	163
	dw	0
	dw	164
	dw	0
	dw	165
	dw	0
	dw	166
	dw	0
	dw	167
	dw	0
	dw	168
	dw	0
	dw	169
	dw	0
	dw	170
	dw	0
	dw	171
	dw	0
	dw	172
	dw	0
	dw	173
	dw	0
	dw	174
	dw	0
	dw	175
	dw	0
	dw	176
	dw	0
	dw	177
	dw	0
	dw	178
	dw	0
	dw	179
	dw	0
	dw	180
	dw	0
	dw	181
	dw	0
	dw	182
	dw	0
	dw	183
	dw	0
	dw	184
	dw	0
	dw	185
	dw	0
	dw	186
	dw	0
	dw	187
	dw	0
	dw	188
	dw	0
	dw	189
	dw	0
	dw	190
	dw	0
	dw	191
	dw	0
	dw	192
	dw	0
	dw	193
	dw	0
	dw	194
	dw	0
	dw	195
	dw	0
	dw	196
	dw	0
	dw	197
	dw	0
	dw	198
	dw	0
	dw	199
	dw	0
	dw	200
	dw	0
	dw	201
	dw	0
	dw	202
	dw	0
	dw	203
	dw	0
	dw	204
	dw	0
	dw	205
	dw	0
	dw	206
	dw	0
	dw	207
	dw	0
	dw	208
	dw	0
	dw	209
	dw	0
	dw	210
	dw	0
	dw	211
	dw	0
	dw	212
	dw	0
	dw	213
	dw	0
	dw	214
	dw	0
	dw	215
	dw	0
	dw	216
	dw	0
	dw	217
	dw	0
	dw	218
	dw	0
	dw	219
	dw	0
	dw	220
	dw	0
	dw	221
	dw	0
	dw	222
	dw	0
	dw	223
	dw	0
	dw	224
	dw	0
	dw	225
	dw	0
	dw	226
	dw	0
	dw	227
	dw	0
	dw	228
	dw	0
	dw	229
	dw	0
	dw	230
	dw	0
	dw	231
	dw	0
	dw	232
	dw	0
	dw	233
	dw	0
	dw	234
	dw	0
	dw	235
	dw	0
	dw	236
	dw	0
	dw	237
	dw	0
	dw	238
	dw	0
	dw	239
	dw	0
	dw	240
	dw	0
	dw	241
	dw	0
	dw	242
	dw	0
	dw	243
	dw	0
	dw	244
	dw	0
	dw	245
	dw	0
	dw	246
	dw	0
	dw	247
	dw	0
	dw	248
	dw	0
	dw	249
	dw	0
	dw	250
	dw	0
	dw	251
	dw	0
	dw	252
	dw	0
	dw	253
	dw	0
	dw	254
	dw	0
	dw	255
	dw	0
	dw	256
	dw	0
	dw	257
	dw	0
	dw	258
	dw	0
	dw	259
	dw	0
	dw	260
	dw	0
	dw	261
	dw	0
	dw	262
	dw	0
	dw	263
	dw	0
	dw	264
	dw	0
	dw	265
	dw	0
	dw	266
	dw	0
	dw	267
	dw	0
	dw	268
	dw	0
	dw	269
	dw	0
	dw	270
	dw	0
	dw	271
	dw	0
	dw	272
	dw	0
	dw	273
	dw	0
	dw	274
	dw	0
	dw	275
	dw	0
	dw	276
	dw	0
	dw	277
	dw	0
	dw	278
	dw	0
	dw	279
	dw	0
	dw	280
	dw	0
	dw	281
	dw	0
	dw	282
	dw	0
	dw	283
	dw	0
	dw	284
	dw	0
	dw	285
	dw	0
	dw	286
	dw	0
	dw	287
	dw	0
	dw	288
	dw	0
	dw	289
	dw	0
	dw	290
	dw	0
	dw	291
	dw	0
	dw	292
	dw	0
	dw	293
	dw	0
	dw	294
	dw	0
	dw	295
	dw	0
	dw	296
	dw	0
	dw	297
	dw	0
	dw	298
	dw	0
	dw	299
	dw	0
	dw	300
	dw	0
	dw	301
	dw	0
	dw	302
	dw	0
	dw	303
	dw	0
	dw	304
	dw	0
	dw	305
	dw	0
	dw	306
	dw	0
	dw	307
	dw	0
	dw	308
	dw	0
	dw	309
	dw	0
	dw	310
	dw	0
	dw	311
	dw	0
	dw	312
	dw	0
	dw	313
	dw	0
	dw	314
	dw	0
	dw	315
	dw	0
	dw	316
	dw	0
	dw	317
	dw	0
	dw	318
	dw	0
	dw	319
	dw	0
	dw	320
	dw	0
	dw	321
	dw	0
	dw	322
	dw	0
	dw	323
	dw	0
	dw	324
	dw	0
	dw	325
	dw	0
	dw	326
	dw	0
	dw	327
	dw	0
	dw	328
	dw	0
	dw	329
	dw	0
	dw	330
	dw	0
	dw	331
	dw	0
	dw	332
	dw	0
	dw	333
	dw	0
	dw	334
	dw	0
	dw	335
	dw	0
	dw	336
	dw	0
	dw	337
	dw	0
	dw	338
	dw	0
	dw	339
	dw	0
	dw	340
	dw	0
	dw	341
	dw	0
	dw	342
	dw	0
	dw	343
	dw	0
	dw	344
	dw	0
	dw	345
	dw	0
	dw	346
	dw	0
	dw	347
	dw	0
	dw	348
	dw	0
	dw	349
	dw	0
	dw	350
	dw	0
	dw	351
	dw	0
	dw	352
	dw	0
	dw	353
	dw	0
	dw	354
	dw	0
	dw	355
	dw	0
	dw	356
	dw	0
	dw	357
	dw	0
	dw	358
	dw	0
	dw	359
	dw	0
	dw	360
	dw	0
	dw	361
	dw	0
	dw	362
	dw	0
	dw	363
	dw	0
	dw	364
	dw	0
	dw	365
	dw	0
	dw	366
	dw	0
	dw	367
	dw	0
	dw	368
	dw	0
	dw	369
	dw	0
	dw	370
	dw	0
	dw	371
	dw	0
	dw	372
	dw	0
	dw	373
	dw	0
	dw	374
	dw	0
	dw	375
	dw	0
	dw	376
	dw	0
	dw	377
	dw	0
	dw	378
	dw	0
	dw	379
	dw	0
	dw	380
	dw	0
	dw	381
	dw	0
	dw	382
	dw	0
	dw	383
	dw	0
	dw	384
	dw	0
	dw	385
	dw	0
	dw	386
	dw	0
	dw	387
	dw	0
	dw	388
	dw	0
	dw	389
	dw	0
	dw	390
	dw	0
	dw	391
	dw	0
	dw	392
	dw	0
	dw	393
	dw	0
	dw	394
	dw	0
	dw	395
	dw	0
	dw	396
	dw	0
	dw	397
	dw	0
	dw	398
	dw	0
	dw	399
	dw	0
	dw	400
	dw	0
	dw	401
	dw	0
	dw	402
	dw	0
	dw	403
	dw	0
	dw	404
	dw	0
	dw	405
	dw	0
	dw	406
	dw	0
	dw	407
	dw	0
	dw	408
	dw	0
	dw	409
	dw	0
	dw	410
	dw	0
	dw	411
	dw	0
	dw	412
	dw	0
	dw	413
	dw	0
	dw	414
	dw	0
	dw	415
	dw	0
	dw	416
	dw	0
	dw	417
	dw	0
	dw	418
	dw	0
	dw	419
	dw	0
	dw	420
	dw	0
	dw	421
	dw	0
	dw	422
	dw	0
	dw	423
	dw	0
	dw	424
	dw	0
	dw	425
	dw	0
	dw	426
	dw	0
	dw	427
	dw	0
	dw	428
	dw	0
	dw	429
	dw	0
	dw	430
	dw	0
	dw	431
	dw	0
	dw	432
	dw	0
	dw	433
	dw	0
	dw	434
	dw	0
	dw	435
	dw	0
	dw	436
	dw	0
	dw	437
	dw	0
	dw	438
	dw	0
	dw	439
	dw	0
	dw	440
	dw	0
	dw	441
	dw	0
	dw	442
	dw	0
	dw	443
	dw	0
	dw	444
	dw	0
	dw	445
	dw	0
	dw	446
	dw	0
	dw	447
	dw	0
	dw	448
	dw	0
	dw	449
	dw	0
	dw	450
	dw	0
	dw	451
	dw	0
	dw	452
	dw	0
	dw	453
	dw	0
	dw	454
	dw	0
	dw	455
	dw	0
	dw	456
	dw	0
	dw	457
	dw	0
	dw	458
	dw	0
	dw	459
	dw	0
	dw	460
	dw	0
	dw	461
	dw	0
	dw	462
	dw	0
	dw	463
	dw	0
	dw	464
	dw	0
	dw	465
	dw	0
	dw	466
	dw	0
	dw	467
	dw	0
	dw	468
	dw	0
	dw	469
	dw	0
	dw	470
	dw	0
	dw	471
	dw	0
	dw	472
	dw	0
	dw	473
	dw	0
	dw	474
	dw	0
	dw	475
	dw	0
	dw	476
	dw	0
	dw	477
	dw	0
	dw	478
	dw	0
	dw	479
	dw	0
	dw	480
	dw	0
	dw	481
	dw	0
	dw	482
	dw	0
	dw	483
	dw	0
	dw	484
	dw	0
	dw	485
	dw	0
	dw	486
	dw	0
	dw	487
	dw	0
	dw	488
	dw	0
	dw	489
	dw	0
	dw	490
	dw	0
	dw	491
	dw	0
	dw	492
	dw	0
	dw	493
	dw	0
	dw	494
	dw	0
	dw	495
	dw	0
	dw	496
	dw	0
	dw	497
	dw	0
	dw	498
	dw	0
	dw	499
	dw	0
	dw	500
	dw	0
	dw	501
	dw	0
	dw	502
	dw	0
	dw	503
	dw	0
	dw	504
	dw	0
	dw	505
	dw	0
	dw	506
	dw	0
	dw	507
	dw	0
	dw	508
	dw	0
	dw	509
	dw	0
	dw	510
	dw	0
	dw	511
	dw	0
	dw	512
	dw	0
	dw	513
	dw	0
	dw	514
	dw	0
	dw	515
	dw	0
	dw	516
	dw	0
	dw	517
	dw	0
	dw	518
	dw	0
	dw	519
	dw	0
	dw	520
	dw	0
	dw	521
	dw	0
	dw	522
	dw	0
	dw	523
	dw	0
	dw	524
	dw	0
	dw	525
	dw	0
	dw	526
	dw	0
	dw	527
	dw	0
	dw	528
	dw	0
	dw	529
	dw	0
	dw	530
	dw	0
	dw	531
	dw	0
	dw	532
	dw	0
	dw	533
	dw	0
	dw	534
	dw	0
	dw	535
	dw	0
	dw	536
	dw	0
	dw	537
	dw	0
	dw	538
	dw	0
	dw	539
	dw	0
	dw	540
	dw	0
	dw	541
	dw	0
	dw	542
	dw	0
	dw	543
	dw	0
	dw	544
	dw	0
	dw	545
	dw	0
	dw	546
	dw	0
	dw	547
	dw	0
	dw	548
	dw	0
	dw	549
	dw	0
	dw	550
	dw	0
	dw	551
	dw	0
	dw	552
	dw	0
	dw	553
	dw	0
	dw	554
	dw	0
	dw	555
	dw	0
	dw	556
	dw	0
	dw	557
	dw	0
	dw	558
	dw	0
	dw	559
	dw	0
	dw	560
	dw	0
	dw	561
	dw	0
	dw	562
	dw	0
	dw	563
	dw	0
	dw	564
	dw	0
	dw	565
	dw	0
	dw	566
	dw	0
	dw	567
	dw	0
	dw	568
	dw	0
	dw	569
	dw	0
	dw	570
	dw	0
	dw	571
	dw	0
	dw	572
	dw	0
	dw	573
	dw	0
	dw	574
	dw	0
	dw	575
	dw	0
	dw	576
	dw	0
	dw	577
	dw	0
	dw	578
	dw	0
	dw	579
	dw	0
	dw	580
	dw	0
	dw	581
	dw	0
	dw	582
	dw	0
	dw	583
	dw	0
	dw	584
	dw	0
	dw	585
	dw	0
	dw	586
	dw	0
	dw	587
	dw	0
	dw	588
	dw	0
	dw	589
	dw	0
?patch56	equ	2060
	dw	?patch57
	dw	1
	db	6
	db	1
	db	0
	db	24
	db	11
	db	66
	db	67
	db	67
	db	51
	db	50
	db	32
	db	53
	db	46
	db	53
	db	46
	db	49
?patch57	equ	18
$$BSYMS	ends
$$BTYPES	segment byte public use32 'DEBTYP'
	db        2,0,0,0,14,0,8,0,3,0,0,0,7,0,2,0
	db        2,16,0,0,8,0,1,0,1,0,117,0,0,0,12,0
	db        1,2,2,0,3,4,0,0,1,16,0,0,8,0,1,0
	db        1,0,116,0,0,0,14,0,8,0,3,0,0,0,7,0
	db        2,0,5,16,0,0,12,0,1,2,2,0,3,4,0,0
	db        1,16,0,0,14,0,8,0,3,0,0,0,7,0,4,0
	db        9,16,0,0,8,0,2,0,10,0,8,16,0,0,8,0
	db        1,0,1,0,112,0,0,0,20,0,1,2,4,0,3,4
	db        0,0,1,16,0,0,7,16,0,0,1,16,0,0,14,0
	db        8,0,3,0,0,0,7,0,4,0,11,16,0,0,20,0
	db        1,2,4,0,3,4,0,0,1,16,0,0,7,16,0,0
	db        1,16,0,0,14,0,8,0,3,0,0,0,7,0,3,0
	db        13,16,0,0,16,0,1,2,3,0,3,4,0,0,1,16
	db        0,0,1,16,0,0,14,0,8,0,3,0,0,0,7,0
	db        3,0,15,16,0,0,16,0,1,2,3,0,3,4,0,0
	db        1,16,0,0,1,16,0,0,14,0,8,0,3,4,0,0
	db        0,0,1,0,17,16,0,0,8,0,1,2,1,0,117,0
	db        0,0,14,0,8,0,118,0,0,0,7,0,0,0,19,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,112,4,0,0
	db        0,0,2,0,21,16,0,0,12,0,1,2,2,0,112,4
	db        0,0,116,0,0,0,14,0,8,0,3,0,0,0,64,0
	db        2,0,23,16,0,0,12,0,1,2,2,0,7,16,0,0
	db        0,0,0,0,14,0,8,0,255,255,255,255,0,0,1,0
	db        26,16,0,0,8,0,2,0,10,4,254,255,255,255,8,0
	db        1,2,1,0,25,16,0,0,14,0,8,0,112,0,0,0
	db        7,0,2,0,28,16,0,0,12,0,1,2,2,0,25,16
	db        0,0,8,16,0,0,14,0,8,0,3,0,0,0,0,0
	db        2,0,30,16,0,0,12,0,1,2,2,0,25,16,0,0
	db        116,0,0,0,8,0,2,0,10,2,3,0,0,0,14,0
	db        8,0,116,0,0,0,0,0,4,0,33,16,0,0,20,0
	db        1,2,4,0,3,4,0,0,3,4,0,0,3,4,0,0
	db        3,4,0,0,14,0,8,0,116,0,0,0,4,0,0,0
	db        35,16,0,0,4,0,1,2,0,0,14,0,8,0,112,0
	db        0,0,7,0,2,0,37,16,0,0,12,0,1,2,2,0
	db        25,16,0,0,8,16,0,0,14,0,8,0,112,4,0,0
	db        7,0,1,0,39,16,0,0,8,0,1,2,1,0,117,0
	db        0,0,14,0,8,0,3,0,0,0,7,0,1,0,41,16
	db        0,0,8,0,1,2,1,0,112,4,0,0,14,0,8,0
	db        3,4,0,0,7,0,1,0,43,16,0,0,8,0,1,2
	db        1,0,1,16,0,0
$$BTYPES	ends
$$BNAMES	segment byte public use32 'DEBNAM'
	db	30,'@stk@cipher@cript_MTF$qqspvxui'
	db	9,'a_dst_ptr'
	db	7,'a_count'
	db	8,'ptrd_end'
	db	4,'ptrd'
	db	3,'mtf'
	db	13,'__file_name__'
	db	8,'__file__'
	db	14,'__entered_time'
	db	8,'__time_1'
	db	14,'__entered_line'
	db	32,'@stk@cipher@uncript_MTF$qqspvxui'
	db	9,'a_dst_ptr'
	db	7,'a_count'
	db	8,'ptrd_end'
	db	4,'ptrd'
	db	3,'mtf'
	db	13,'__file_name__'
	db	8,'__file__'
	db	14,'__entered_time'
	db	8,'__time_1'
	db	14,'__entered_line'
	db	36,'@stk@cipher@cript_XOR$qqspvxuipxcxui'
	db	9,'a_dst_ptr'
	db	7,'a_count'
	db	8,'alpHaslo'
	db	13,'a_haslo_count'
	db	13,'__file_name__'
	db	8,'__file__'
	db	14,'__entered_time'
	db	8,'__time_1'
	db	14,'__entered_line'
	db	38,'@stk@cipher@uncript_XOR$qqspvxuipxcxui'
	db	9,'a_dst_ptr'
	db	7,'a_count'
	db	8,'alpHaslo'
	db	13,'a_haslo_count'
	db	13,'__file_name__'
	db	8,'__file__'
	db	14,'__entered_time'
	db	8,'__time_1'
	db	14,'__entered_line'
	db	33,'@stk@cipher@cript_ROT$qqspvxuixui'
	db	9,'a_dst_ptr'
	db	7,'a_count'
	db	13,'a_haslo_count'
	db	8,'ptrd_end'
	db	4,'ptrd'
	db	8,'buff_ptr'
	db	7,'buff_sq'
	db	10,'buff_count'
	db	13,'__file_name__'
	db	8,'__file__'
	db	14,'__entered_time'
	db	8,'__time_1'
	db	14,'__entered_line'
	db	35,'@stk@cipher@uncript_ROT$qqspvxuixui'
	db	9,'a_dst_ptr'
	db	7,'a_count'
	db	13,'a_haslo_count'
	db	13,'__file_name__'
	db	8,'__file__'
	db	14,'__entered_time'
	db	8,'__time_1'
	db	14,'__entered_line'
	db	10,'@$bnew$qui'
	db	7,'a_count'
	db	3,'std'
	db	3,'stk'
	db	9,'@stk@time'
	db	16,'@stk@file_header'
	db	11,'@stk@cipher'
	db	8,'@stk@mem'
	db	9,'@stk@cstr'
	db	8,'@stk@con'
	db	5,'_pipe'
	db	7,'tempnam'
	db	5,'rmtmp'
	db	4,'putw'
	db	4,'getw'
	db	8,'fputchar'
	db	8,'flushall'
	db	6,'fileno'
	db	8,'fgetchar'
	db	6,'fdopen'
	db	9,'fcloseall'
	db	11,'_vsnwprintf'
	db	10,'_vsnprintf'
	db	10,'_snwprintf'
	db	9,'_snprintf'
	db	6,'wscanf'
	db	7,'wprintf'
	db	7,'vwscanf'
	db	8,'vwprintf'
	db	8,'vswscanf'
	db	9,'vswprintf'
	db	7,'vsscanf'
	db	8,'vsprintf'
	db	10,'vsnwprintf'
	db	9,'vsnprintf'
	db	6,'vscanf'
	db	7,'vprintf'
	db	8,'vfwscanf'
	db	9,'vfwprintf'
	db	7,'vfscanf'
	db	8,'vfprintf'
	db	7,'ungetwc'
	db	6,'ungetc'
	db	6,'tmpnam'
	db	7,'tmpfile'
	db	7,'swscanf'
	db	8,'swprintf'
	db	6,'sscanf'
	db	7,'sprintf'
	db	9,'snwprintf'
	db	8,'snprintf'
	db	7,'setvbuf'
	db	6,'setbuf'
	db	5,'scanf'
	db	6,'rewind'
	db	6,'rename'
	db	6,'remove'
	db	8,'putwchar'
	db	5,'putwc'
	db	4,'puts'
	db	7,'putchar'
	db	4,'putc'
	db	6,'printf'
	db	8,'getwchar'
	db	5,'getwc'
	db	4,'gets'
	db	7,'getchar'
	db	4,'getc'
	db	7,'fwscanf'
	db	6,'fwrite'
	db	8,'fwprintf'
	db	5,'ftell'
	db	7,'fsetpos'
	db	5,'fseek'
	db	6,'fscanf'
	db	7,'freopen'
	db	5,'fread'
	db	6,'fputws'
	db	6,'fputwc'
	db	5,'fputs'
	db	5,'fputc'
	db	7,'fprintf'
	db	5,'fopen'
	db	6,'fgetws'
	db	6,'fgetwc'
	db	5,'fgets'
	db	7,'fgetpos'
	db	5,'fgetc'
	db	6,'fflush'
	db	6,'ferror'
	db	4,'feof'
	db	6,'fclose'
	db	8,'clearerr'
	db	8,'_wtmpnam'
	db	9,'_wtempnam'
	db	7,'_wpopen'
	db	8,'_wfsopen'
	db	9,'_wfreopen'
	db	7,'_wfopen'
	db	8,'_wfdopen'
	db	7,'_unlink'
	db	8,'_tempnam'
	db	6,'_rmtmp'
	db	6,'_putws'
	db	5,'_putw'
	db	6,'_popen'
	db	7,'_pclose'
	db	6,'_getws'
	db	5,'_getw'
	db	7,'_fsopen'
	db	10,'_fputwchar'
	db	7,'_fputwc'
	db	9,'_fputchar'
	db	6,'_fputc'
	db	9,'_flushall'
	db	7,'_fileno'
	db	10,'_fgetwchar'
	db	7,'_fgetwc'
	db	9,'_fgetchar'
	db	6,'_fgetc'
	db	7,'_fdopen'
	db	10,'_fcloseall'
	db	11,'__getStream'
	db	11,'_setsystime'
	db	11,'_getsystime'
	db	5,'tzset'
	db	8,'_strtime'
	db	8,'_strdate'
	db	6,'_tzset'
	db	5,'stime'
	db	7,'_wtzset'
	db	8,'wcsftime'
	db	9,'_wstrtime'
	db	9,'_wstrdate'
	db	7,'_wctime'
	db	9,'_wasctime'
	db	9,'_lstrftim'
	db	8,'strftime'
	db	5,'clock'
	db	6,'mktime'
	db	9,'localtime'
	db	6,'gmtime'
	db	8,'difftime'
	db	5,'ctime'
	db	7,'asctime'
	db	12,'__assertfail'
	db	7,'_assert'
	db	5,'_rotr'
	db	5,'_rotl'
	db	6,'_crotr'
	db	6,'_lrotr'
	db	6,'_lrotl'
	db	6,'_crotl'
	db	3,'abs'
	db	6,'wctomb'
	db	7,'wcstoul'
	db	8,'wcstombs'
	db	6,'wcstol'
	db	6,'wcstod'
	db	5,'ultoa'
	db	4,'time'
	db	6,'system'
	db	4,'swab'
	db	7,'strtoul'
	db	6,'strtol'
	db	6,'strtod'
	db	5,'srand'
	db	7,'realloc'
	db	4,'rand'
	db	6,'putenv'
	db	6,'perror'
	db	6,'mbtowc'
	db	8,'mbstowcs'
	db	5,'mblen'
	db	13,'_seterrormode'
	db	14,'@std@max$qulul'
	db	26,'@std@%max$T1%$qrxT1t1$rxT1'
	db	14,'@std@min$qulul'
	db	26,'@std@%min$T1%$qrxT1t1$rxT1'
	db	17,'@std@randomize$qv'
	db	14,'@std@random$qi'
	db	4,'ltoa'
	db	4,'gcvt'
	db	4,'fcvt'
	db	4,'ecvt'
	db	6,'malloc'
	db	4,'ldiv'
	db	4,'labs'
	db	4,'itoa'
	db	6,'getenv'
	db	4,'free'
	db	4,'exit'
	db	3,'div'
	db	6,'calloc'
	db	4,'atol'
	db	4,'atoi'
	db	4,'atof'
	db	6,'atexit'
	db	5,'abort'
	db	6,'_wtold'
	db	5,'_wtol'
	db	5,'_wtoi'
	db	5,'_wtof'
	db	8,'_wsystem'
	db	11,'_wsplitpath'
	db	11,'_wsearchstr'
	db	11,'_wsearchenv'
	db	8,'_wputenv'
	db	8,'_wperror'
	db	10,'_wmakepath'
	db	8,'_wgetenv'
	db	10,'_wfullpath'
	db	8,'_wcstold'
	db	8,'_strtold'
	db	10,'_splitpath'
	db	10,'_searchstr'
	db	10,'_searchenv'
	db	9,'_makepath'
	db	7,'_wtoi64'
	db	8,'_ui64tow'
	db	8,'_ui64toa'
	db	7,'_i64tow'
	db	7,'_i64toa'
	db	7,'_atoi64'
	db	5,'_ltow'
	db	5,'_ltoa'
	db	6,'_lrand'
	db	5,'_itow'
	db	6,'_ultow'
	db	17,'@std@_swab$qpct1i'
	db	17,'@std@_putenv$qpxc'
	db	18,'@std@_ultoa$qulpci'
	db	16,'@std@_itoa$qipci'
	db	5,'_gcvt'
	db	5,'_fcvt'
	db	9,'_fullpath'
	db	5,'_exit'
	db	6,'_atold'
	db	5,'_ecvt'
	db	7,'__errno'
	db	10,'__doserrno'
	db	5,'qsort'
	db	7,'lsearch'
	db	5,'lfind'
	db	7,'bsearch'
	db	11,'_wgetcurdir'
	db	8,'_wgetcwd'
	db	9,'_wfnmerge'
	db	9,'_wfnsplit'
	db	11,'_wfindclose'
	db	10,'_wfindnext'
	db	11,'_wfindfirst'
	db	11,'wsearchpath'
	db	7,'_wrmdir'
	db	7,'_wmkdir'
	db	7,'_wchdir'
	db	5,'rmdir'
	db	5,'mkdir'
	db	7,'setdisk'
	db	10,'searchpath'
	db	6,'_rmdir'
	db	6,'_mkdir'
	db	7,'getdisk'
	db	6,'getcwd'
	db	9,'getcurdir'
	db	7,'fnsplit'
	db	7,'fnmerge'
	db	9,'findclose'
	db	8,'findnext'
	db	9,'findfirst'
	db	5,'chdir'
	db	10,'_findclose'
	db	9,'_findnext'
	db	10,'_findfirst'
	db	11,'__wfindnext'
	db	12,'__wfindfirst'
	db	12,'_findnexti64'
	db	13,'_findfirsti64'
	db	13,'_wfindnexti64'
	db	14,'_wfindfirsti64'
	db	5,'sopen'
	db	6,'mktemp'
	db	5,'write'
	db	6,'_write'
	db	10,'_rtl_write'
	db	7,'_commit'
	db	6,'unlock'
	db	6,'unlink'
	db	5,'umask'
	db	4,'tell'
	db	7,'_wsopen'
	db	6,'_sopen'
	db	7,'setmode'
	db	8,'setftime'
	db	5,'_read'
	db	9,'_rtl_read'
	db	4,'read'
	db	5,'_open'
	db	9,'_rtl_open'
	db	6,'_wopen'
	db	4,'open'
	db	7,'_mktemp'
	db	5,'lseek'
	db	7,'locking'
	db	4,'lock'
	db	6,'isatty'
	db	5,'ioctl'
	db	15,'_open_osfhandle'
	db	14,'_get_osfhandle'
	db	8,'_wmktemp'
	db	10,'_wrtl_open'
	db	8,'_wrename'
	db	8,'_wremove'
	db	8,'_wunlink'
	db	11,'_wrtl_creat'
	db	7,'_wcreat'
	db	11,'_wrtl_chmod'
	db	7,'_wchmod'
	db	8,'_waccess'
	db	8,'getftime'
	db	10,'filelength'
	db	3,'eof'
	db	4,'dup2'
	db	3,'dup'
	db	9,'creattemp'
	db	8,'creatnew'
	db	5,'creat'
	db	6,'_creat'
	db	10,'_rtl_creat'
	db	5,'close'
	db	6,'_close'
	db	10,'_rtl_close'
	db	6,'chsize'
	db	5,'chmod'
	db	6,'_chmod'
	db	10,'_rtl_chmod'
	db	6,'access'
	db	7,'wcsxfrm'
	db	6,'wcstok'
	db	6,'wcsstr'
	db	6,'wcsspn'
	db	7,'wcsrchr'
	db	7,'wcspcpy'
	db	7,'wcspbrk'
	db	7,'wcsncpy'
	db	7,'wcsncmp'
	db	7,'wcsncat'
	db	6,'wcslen'
	db	7,'wcscspn'
	db	6,'wcscpy'
	db	7,'wcscoll'
	db	6,'wcscmp'
	db	6,'wcschr'
	db	6,'wcscat'
	db	6,'strtok'
	db	18,'@std@strstr$qpxct1'
	db	18,'@std@strstr$qpcpxc'
	db	6,'strspn'
	db	19,'@std@strpbrk$qpxct1'
	db	19,'@std@strpbrk$qpcpxc'
	db	8,'strerror'
	db	7,'strcspn'
	db	18,'@std@strrchr$qpxci'
	db	17,'@std@strrchr$qpci'
	db	7,'strncpy'
	db	7,'strncmp'
	db	7,'strncat'
	db	6,'strlen'
	db	17,'@std@strchr$qpxci'
	db	16,'@std@strchr$qpci'
	db	6,'strcat'
	db	6,'strset'
	db	6,'stpcpy'
	db	7,'strnset'
	db	7,'_wcsset'
	db	7,'_wcsrev'
	db	8,'_wcspcpy'
	db	8,'_wcsnset'
	db	10,'_wcsnicoll'
	db	9,'_wcsnicmp'
	db	9,'_wcsncoll'
	db	9,'_wcsicoll'
	db	8,'_wcsicmp'
	db	7,'_wcsdup'
	db	10,'_strnicoll'
	db	9,'_strncoll'
	db	9,'_stricoll'
	db	9,'_strerror'
	db	9,'_lwcsxfrm'
	db	8,'_lwcsupr'
	db	11,'_lwcsnicoll'
	db	10,'_lwcsncoll'
	db	8,'_lwcslwr'
	db	10,'_lwcsicoll'
	db	9,'_lwcscoll'
	db	9,'_lstrxfrm'
	db	11,'_lstrnicoll'
	db	10,'_lstrncoll'
	db	10,'_lstricoll'
	db	9,'_lstrcoll'
	db	9,'_strnicmp'
	db	7,'_strcmp'
	db	8,'_stricmp'
	db	8,'_strcmpi'
	db	7,'_strlwr'
	db	7,'_strdup'
	db	7,'_strupr'
	db	8,'_strnset'
	db	7,'_strset'
	db	7,'_strrev'
	db	6,'strrev'
	db	8,'strnicmp'
	db	7,'stricmp'
	db	6,'strdup'
	db	7,'_stpcpy'
	db	8,'_lstrupr'
	db	8,'_lstrlwr'
	db	12,'_lwsetlocale'
	db	11,'_wsetlocale'
	db	12,'_llocaleconv'
	db	10,'localeconv'
	db	11,'_lsetlocale'
	db	10,'_ltowlower'
	db	10,'_ltowupper'
	db	8,'towupper'
	db	8,'towlower'
	db	9,'_ltoupper'
	db	7,'toupper'
	db	9,'_ltolower'
	db	7,'tolower'
	db	8,'iswascii'
	db	9,'iswxdigit'
	db	8,'iswupper'
	db	8,'iswspace'
	db	8,'iswpunct'
	db	8,'iswprint'
	db	8,'iswlower'
	db	8,'iswgraph'
	db	8,'iswdigit'
	db	8,'iswcntrl'
	db	8,'iswalpha'
	db	8,'iswalnum'
	db	7,'isascii'
	db	8,'isxdigit'
	db	7,'isupper'
	db	7,'isspace'
	db	7,'ispunct'
	db	7,'isprint'
	db	7,'islower'
	db	7,'isgraph'
	db	7,'isdigit'
	db	7,'iscntrl'
	db	7,'isalpha'
	db	7,'isalnum'
	db	6,'memset'
	db	6,'memcpy'
	db	6,'memcmp'
	db	19,'@std@memchr$qpxviui'
	db	18,'@std@memchr$qpviui'
	db	7,'memmove'
	db	7,'memicmp'
	db	7,'memccpy'
	db	8,'_wmemset'
	db	8,'_wmemcpy'
	db	21,'@std@_wmemchr$qpxviui'
	db	20,'@std@_wmemchr$qpviui'
	db	10,'__threadid'
	db	14,'@std@ptrdiff_t'
	db	11,'@std@size_t'
	db	11,'@std@wint_t'
	db	13,'@std@wctype_t'
	db	12,'@std@va_list'
	db	9,'_chartype'
	db	6,'_lower'
	db	6,'_upper'
	db	5,'lconv'
	db	6,'_nfile'
	db	20,'@std@_wfinddatai64_t'
	db	19,'@std@_finddatai64_t'
	db	10,'@std@ftime'
	db	17,'@std@_wfinddata_t'
	db	16,'@std@_finddata_t'
	db	6,'_TCHAR'
	db	7,'_TSCHAR'
	db	7,'_TUCHAR'
	db	7,'_TXCHAR'
	db	5,'_TINT'
	db	10,'@std@ffblk'
	db	12,'@std@_wffblk'
	db	5,'_argc'
	db	5,'_argv'
	db	12,'__mb_cur_max'
	db	16,'_cmdline_escapes'
	db	8,'_environ'
	db	9,'_fileinfo'
	db	6,'_fmode'
	db	8,'_osmajor'
	db	8,'_osminor'
	db	7,'_osmode'
	db	10,'_osversion'
	db	12,'_sys_errlist'
	db	9,'_sys_nerr'
	db	9,'_wenviron'
	db	13,'@std@atexit_t'
	db	10,'@std@div_t'
	db	11,'@std@ldiv_t'
	db	11,'@std@time_t'
	db	12,'@std@clock_t'
	db	7,'@std@tm'
	db	9,'_daylight'
	db	9,'_timezone'
	db	7,'_tzname'
	db	8,'_wtzname'
	db	9,'@std@FILE'
	db	18,'@std@_floatconvert'
	db	8,'_streams'
	db	11,'@std@fpos_t'
	db	10,'@std@dev_t'
	db	10,'@std@ino_t'
	db	11,'@std@mode_t'
	db	12,'@std@nlink_t'
	db	10,'@std@uid_t'
	db	10,'@std@gid_t'
	db	10,'@std@off_t'
$$BNAMES	ends
	?debug	D "D:\stasiek\My SugarSync\My Projects\X86_LIBRARIES\STK\cipher\.\..\IO\./../stk_main.h" 19511 40554
	?debug	D "D:\stasiek\My SugarSync\My Projects\X86_LIBRARIES\STK\cipher\.\..\IO\STK_CONSOLE.H" 19502 32048
	?debug	D "D:\stasiek\My SugarSync\My Projects\X86_LIBRARIES\STK\cipher\.\..\TEXT\./../mem/./../stk_main.h" 19511 40554
	?debug	D "D:\stasiek\My SugarSync\My Projects\X86_LIBRARIES\STK\cipher\.\..\TEXT\./../mem/stk_mem.h" 19502 30146
	?debug	D "D:\stasiek\My SugarSync\My Projects\X86_LIBRARIES\STK\cipher\.\..\TEXT\./../stk_main.h" 19511 40554
	?debug	D "D:\stasiek\My SugarSync\My Projects\X86_LIBRARIES\STK\cipher\.\..\TEXT\STK_CSTR_UTILS.H" 19054 45782
	?debug	D "D:\stasiek\My SugarSync\My Projects\X86_LIBRARIES\STK\cipher\STK_CIPHER_MTF.H" 19500 42257
	?debug	D "D:\stasiek\My SugarSync\My Projects\X86_LIBRARIES\STK\cipher\./../file/eno/./../../stk_main.h" 19511 40554
	?debug	D "D:\stasiek\My SugarSync\My Projects\X86_LIBRARIES\STK\cipher\./../file/eno/stk_file_lzst_header.h" 19510 29128
	?debug	D "D:\stasiek\My SugarSync\My Projects\X86_LIBRARIES\STK\cipher\./.././stasm/../stk_MAIN.h" 19511 40554
	?debug	D "D:\stasiek\My SugarSync\My Projects\X86_LIBRARIES\STK\cipher\./.././stasm/stk_stasm.h" 19511 40599
	?debug	D "D:\stasiek\My SugarSync\My Projects\X86_LIBRARIES\STK\cipher\./.././time/./../stk_main.h" 19511 40554
	?debug	D "D:\stasiek\My SugarSync\My Projects\X86_LIBRARIES\STK\cipher\./.././time/stk_time.h" 19511 40402
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\sys/stat.h" 10503 10272
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\sys/types.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\fcntl.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\stdio.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\time.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\assert.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\search.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\stdlib.h" 10503 10272
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\tchar.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\dir.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\direct.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\_nfile.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\io.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\conio.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\qos.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\imm.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\mcx.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winsvc.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winnetwk.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winreg.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winver.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\wincon.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winnls.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\tvout.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winuser.h" 18052 43723
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\pshpack1.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\wingdi.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winerror.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winbase.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\pshpack8.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\pshpack2.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\poppack.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\_loc.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\locale.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\_str.h" 10503 10272
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\string.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\guiddef.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\basetsd.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\mbctype.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\ctype.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winnt.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\windef.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\stdarg.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\excpt.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\_null.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\_defs.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\_stddef.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\mem.h" 10503 10272
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\windows.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\pshpack4.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winsock2.h" 10305 10240
	?debug	D "D:\stasiek\My SugarSync\My Projects\X86_LIBRARIES\STK\cipher\./../stk_main.h" 19511 40554
	?debug	D "D:\stasiek\My SugarSync\My Projects\X86_LIBRARIES\STK\cipher\STK_CIPHER_API.H" 19500 42249
	?debug	D "D:\stasiek\My SugarSync\My Projects\X86_LIBRARIES\STK\cipher\stk_cipher_API.cpp" 19502 1828
 ?debug  C FB062A633A5C50524F4752417E315C626F726C616E645C434255494C447E315C6C69625C76636C35302E23305090D30500CA9E374C
 ?debug  C FB050E232A5F5F6D74665F636970686572
 ?debug  C FB050D235F5F6D74665F636970686572
	end
