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
	?debug	S "C:\SRC\X86_LIBRARIES\stk\cpu\stk_cpu.cpp"
	?debug	T "C:\SRC\X86_LIBRARIES\stk\cpu\stk_cpu.cpp"
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
_tsc_STARTED	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
	align	4
_tsc_PAUSED	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
	align	4
_tsc_LAST_MEASURED	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
	align	4
_tsc_ADJ	label	qword
	db	8	dup(?)
	db	1	dup(?)
	align	4
_tsc_ELAPSED	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@rdtsc$qv	segment virtual
	align	2
@@stk@cpu@rdtsc$qv	proc	near
?live16385@0:
	?debug L 61
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-16
	push      ebx
	mov       dword ptr [ebp-8],offset @1
	?debug L 108
?live16385@16: ; ECX = ret_lo, EBX = ret_hi
@2:
	mov       eax,ebx
	xor       edx,edx
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 109
?live16385@32: ; ECX = ret_lo
	mov       edx,dword ptr [ebp-20]
	xor       eax,eax
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 110
	mov       eax,ecx
	xor       edx,edx
	or        eax,dword ptr [ebp-20]
	or        edx,dword ptr [ebp-16]
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 111
?live16385@64: ; 
	mov       eax,dword ptr [ebp-20]
	mov       edx,dword ptr [ebp-16]
	?debug L 112
@4:
@3:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1:
	db        67,71,83,0
	dd        @@stk@cpu@rdtsc$qv+0
	dd        @1+0
	db        236,255,255,255,8,0,0,0,1,0,0,0,236,255,255,255
	db        8,0,0,0
	?debug L 0
@@stk@cpu@rdtsc$qv	endp
@stk@cpu@rdtsc$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	db	2
	db	0
	db	0
	db	0
	dw	64
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
	df	@@stk@cpu@rdtsc$qv
	dw	0
	dw	4096
	dw	0
	dw	1
	dw	0
	dw	0
	dw	0
	db	17
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	114
	db	100
	db	116
	db	115
	db	99
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	117
	dw	0
	dw	20
	dw	2
	dw	0
	dw	0
	dw	0
	dw	?patch4
	dw	529
	dw	?patch5
	dd	?live16385@16-@@stk@cpu@rdtsc$qv
	dd	?live16385@32-?live16385@16
	dw	20
?patch5	equ	1
?patch4	equ	14
	dw	16
	dw	2
	dw	117
	dw	0
	dw	18
	dw	3
	dw	0
	dw	0
	dw	0
	dw	?patch6
	dw	529
	dw	?patch7
	dd	?live16385@16-@@stk@cpu@rdtsc$qv
	dd	?live16385@64-?live16385@16
	dw	18
?patch7	equ	1
?patch6	equ	14
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	119
	dw	0
	dw	4
	dw	0
	dw	0
	dw	0
?patch1	equ	@4-@@stk@cpu@rdtsc$qv+42
?patch2	equ	0
?patch3	equ	@4-@@stk@cpu@rdtsc$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65512
	dw	65535
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@rdtscex$qv	segment virtual
	align	2
@@stk@cpu@rdtscex$qv	proc	near
?live16386@0:
	?debug L 115
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @5
	?debug L 311
@6:
	xor       eax,eax
	xor       edx,edx
	?debug L 312
@8:
@7:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@5:
	db        67,71,83,0
	dd        @@stk@cpu@rdtscex$qv+0
	dd        @5+0
	db        248,255,255,255,8,0,0,0,0,0,0,0
	?debug L 0
@@stk@cpu@rdtscex$qv	endp
@stk@cpu@rdtscex$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	66
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch8
	dd	?patch9
	dd	?patch10
	df	@@stk@cpu@rdtscex$qv
	dw	0
	dw	4098
	dw	0
	dw	5
	dw	0
	dw	0
	dw	0
	db	19
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	114
	db	100
	db	116
	db	115
	db	99
	db	101
	db	120
	db	36
	db	113
	db	118
	dw	18
	dw	512
	dw	0
	dw	0
	dw	117
	dw	0
	dw	6
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	0
	dw	0
	dw	117
	dw	0
	dw	7
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	0
	dw	0
	dw	119
	dw	0
	dw	8
	dw	0
	dw	0
	dw	0
?patch8	equ	@8-@@stk@cpu@rdtscex$qv+32
?patch9	equ	0
?patch10	equ	@8-@@stk@cpu@rdtscex$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ijdlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_init$qv	segment virtual
	align	2
@@stk@cpu@tsc_init$qv	proc	near
?live16387@0:
	?debug L 315
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-52
	push      ebx
	mov       dword ptr [ebp-8],offset @9
@10:
	mov       ebx,offset $ijdlfcia
	jmp       short @12
	?debug L 318
?live16387@16: ; EBX = &$ijdlfcia
@11:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@12:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @11
	cmp       dword ptr [ebx],0
	jne       short @11
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [ebx],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],eax
	jmp       short @15
@14:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@15:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @18
	cmp       dword ptr [ebx],0
@18:
	je        short @16
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @19
	cmp       eax,dword ptr [ebp-20]
@19:
	setne     cl
	and       ecx,1
	jmp       short @17
@16:
	xor       ecx,ecx
@17:
	test      cl,cl
	jne       short @14
	?debug L 320
	mov       dword ptr [_tsc_ADJ],0
	mov       dword ptr [_tsc_ADJ+4],0
	?debug L 321
	call      @@stk@cpu@tsc_start$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 322
	call      @@stk@cpu@tsc_checkpoint$qv
	mov       dword ptr [ebp-44],eax
	mov       dword ptr [ebp-40],edx
	?debug L 323
	mov       eax,dword ptr [ebp-44]
	mov       edx,dword ptr [ebp-40]
	cmp       edx,dword ptr [ebp-28]
	jne       short @21
	cmp       eax,dword ptr [ebp-32]
@21:
	jbe       short @20
	?debug L 324
	mov       eax,dword ptr [ebp-44]
	mov       edx,dword ptr [ebp-40]
	sub       eax,dword ptr [ebp-32]
	sbb       edx,dword ptr [ebp-28]
	mov       dword ptr [_tsc_ADJ],eax
	mov       dword ptr [_tsc_ADJ+4],edx
	?debug L 325
@20:
	mov       eax,dword ptr [_tsc_ADJ]
	mov       dword ptr [ebp-56],eax
	mov       eax,dword ptr [_tsc_ADJ+4]
	mov       dword ptr [ebp-52],eax
	?debug L 326
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 327
?live16387@144: ; 
	mov       eax,dword ptr [ebp-56]
	mov       edx,dword ptr [ebp-52]
	?debug L 328
@23:
@22:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@9:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_init$qv+0
	dd        @9+0
	db        200,255,255,255,8,0,0,0,4,0,0,0,236,255,255,255
	db        8,0,0,0,224,255,255,255,8,0,0,0,212,255,255,255
	db        8,0,0,0,200,255,255,255,8,0,0,0
	?debug L 0
@@stk@cpu@tsc_init$qv	endp
@stk@cpu@tsc_init$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	67
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch11
	dd	?patch12
	dd	?patch13
	df	@@stk@cpu@tsc_init$qv
	dw	0
	dw	4100
	dw	0
	dw	9
	dw	0
	dw	0
	dw	0
	db	20
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	116
	db	115
	db	99
	db	95
	db	105
	db	110
	db	105
	db	116
	db	36
	db	113
	db	118
	dw	18
	dw	512
	dw	65480
	dw	65535
	dw	119
	dw	0
	dw	10
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	119
	dw	0
	dw	11
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65504
	dw	65535
	dw	119
	dw	0
	dw	12
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ijdlfcia
	dw	0
	dw	4102
	dw	0
	dw	13
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	14
	dw	0
	dw	0
	dw	0
?patch11	equ	@23-@@stk@cpu@tsc_init$qv+64
?patch12	equ	0
?patch13	equ	@23-@@stk@cpu@tsc_init$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65476
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$idelfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_start$qv	segment virtual
	align	2
@@stk@cpu@tsc_start$qv	proc	near
?live16388@0:
	?debug L 331
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-28
	push      ebx
	mov       dword ptr [ebp-8],offset @24
@25:
	mov       ebx,offset $idelfcia
	jmp       short @27
	?debug L 334
?live16388@16: ; EBX = &$idelfcia
@26:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@27:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @26
	cmp       dword ptr [ebx],0
	jne       short @26
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [ebx],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],eax
	jmp       short @30
@29:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@30:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @33
	cmp       dword ptr [ebx],0
@33:
	je        short @31
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @34
	cmp       eax,dword ptr [ebp-20]
@34:
	setne     cl
	and       ecx,1
	jmp       short @32
@31:
	xor       ecx,ecx
@32:
	test      cl,cl
	jne       short @29
	?debug L 335
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 336
	mov       eax,dword ptr [ebp-32]
	mov       dword ptr [_tsc_STARTED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_STARTED+4],eax
	?debug L 337
	mov       edx,dword ptr [ebp-32]
	mov       dword ptr [_tsc_LAST_MEASURED],edx
	mov       edx,dword ptr [ebp-28]
	mov       dword ptr [_tsc_LAST_MEASURED+4],edx
	?debug L 338
	mov       dword ptr [_tsc_PAUSED],0
	mov       dword ptr [_tsc_PAUSED+4],0
	mov       dword ptr [_tsc_ELAPSED],0
	mov       dword ptr [_tsc_ELAPSED+4],0
	?debug L 339
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 340
?live16388@112: ; 
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	?debug L 341
@36:
@35:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@24:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_start$qv+0
	dd        @24+0
	db        224,255,255,255,8,0,0,0,2,0,0,0,236,255,255,255
	db        8,0,0,0,224,255,255,255,8,0,0,0
	?debug L 0
@@stk@cpu@tsc_start$qv	endp
@stk@cpu@tsc_start$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	68
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch14
	dd	?patch15
	dd	?patch16
	df	@@stk@cpu@tsc_start$qv
	dw	0
	dw	4103
	dw	0
	dw	15
	dw	0
	dw	0
	dw	0
	db	21
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	116
	db	115
	db	99
	db	95
	db	115
	db	116
	db	97
	db	114
	db	116
	db	36
	db	113
	db	118
	dw	18
	dw	512
	dw	65504
	dw	65535
	dw	119
	dw	0
	dw	16
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$idelfcia
	dw	0
	dw	4102
	dw	0
	dw	17
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	18
	dw	0
	dw	0
	dw	0
?patch14	equ	@36-@@stk@cpu@tsc_start$qv+49
?patch15	equ	0
?patch16	equ	@36-@@stk@cpu@tsc_start$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65500
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ahelfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_checkpoint$qv	segment virtual
	align	2
@@stk@cpu@tsc_checkpoint$qv	proc	near
?live16389@0:
	?debug L 344
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-52
	push      ebx
	mov       dword ptr [ebp-8],offset @37
@38:
	mov       ebx,offset $ahelfcia
	jmp       short @40
	?debug L 347
?live16389@16: ; EBX = &$ahelfcia
@39:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@40:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @39
	cmp       dword ptr [ebx],0
	jne       short @39
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [ebx],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],eax
	jmp       short @43
@42:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@43:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @46
	cmp       dword ptr [ebx],0
@46:
	je        short @44
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @47
	cmp       eax,dword ptr [ebp-20]
@47:
	setne     cl
	and       ecx,1
	jmp       short @45
@44:
	xor       ecx,ecx
@45:
	test      cl,cl
	jne       short @42
	?debug L 348
	mov       eax,dword ptr [_tsc_PAUSED]
	mov       dword ptr [ebp-32],eax
	mov       eax,dword ptr [_tsc_PAUSED+4]
	mov       dword ptr [ebp-28],eax
	?debug L 351
	cmp       dword ptr [ebp-28],0
	jne       short @48
	cmp       dword ptr [ebp-32],0
	jne       short @48
	?debug L 352
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 354
@48:
	mov       eax,dword ptr [_tsc_STARTED]
	mov       edx,dword ptr [_tsc_STARTED+4]
	sub       eax,dword ptr [_tsc_ADJ]
	sbb       edx,dword ptr [_tsc_ADJ+4]
	mov       dword ptr [ebp-44],eax
	mov       dword ptr [ebp-40],edx
	?debug L 355
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	cmp       edx,dword ptr [ebp-40]
	jne       short @51
	cmp       eax,dword ptr [ebp-44]
@51:
	jbe       short @50
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	sub       eax,dword ptr [ebp-44]
	sbb       edx,dword ptr [ebp-40]
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	jmp       short @52
	?debug L 357
@50:
	mov       dword ptr [ebp-56],0
	mov       dword ptr [ebp-52],0
	?debug L 359
@52:
	mov       eax,dword ptr [ebp-32]
	mov       dword ptr [_tsc_LAST_MEASURED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_LAST_MEASURED+4],eax
	?debug L 360
	mov       edx,dword ptr [ebp-56]
	mov       dword ptr [_tsc_ELAPSED],edx
	mov       edx,dword ptr [ebp-52]
	mov       dword ptr [_tsc_ELAPSED+4],edx
	?debug L 361
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 362
?live16389@176: ; 
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	?debug L 363
@54:
@53:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@37:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_checkpoint$qv+0
	dd        @37+0
	db        200,255,255,255,8,0,0,0,4,0,0,0,236,255,255,255
	db        8,0,0,0,224,255,255,255,8,0,0,0,212,255,255,255
	db        8,0,0,0,200,255,255,255,8,0,0,0
	?debug L 0
@@stk@cpu@tsc_checkpoint$qv	endp
@stk@cpu@tsc_checkpoint$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	73
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch17
	dd	?patch18
	dd	?patch19
	df	@@stk@cpu@tsc_checkpoint$qv
	dw	0
	dw	4105
	dw	0
	dw	19
	dw	0
	dw	0
	dw	0
	db	26
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	116
	db	115
	db	99
	db	95
	db	99
	db	104
	db	101
	db	99
	db	107
	db	112
	db	111
	db	105
	db	110
	db	116
	db	36
	db	113
	db	118
	dw	18
	dw	512
	dw	65480
	dw	65535
	dw	119
	dw	0
	dw	20
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	119
	dw	0
	dw	21
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65504
	dw	65535
	dw	119
	dw	0
	dw	22
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ahelfcia
	dw	0
	dw	4102
	dw	0
	dw	23
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	24
	dw	0
	dw	0
	dw	0
?patch17	equ	@54-@@stk@cpu@tsc_checkpoint$qv+67
?patch18	equ	0
?patch19	equ	@54-@@stk@cpu@tsc_checkpoint$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65476
	dw	65535
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_elapsed$qv	segment virtual
	align	2
@@stk@cpu@tsc_elapsed$qv	proc	near
?live16390@0:
	?debug L 366
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @55
	?debug L 368
@56:
	mov       eax,dword ptr [_tsc_ELAPSED]
	mov       edx,dword ptr [_tsc_ELAPSED+4]
	?debug L 369
@58:
@57:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@55:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_elapsed$qv+0
	dd        @55+0
	db        248,255,255,255,8,0,0,0,0,0,0,0
	?debug L 0
@@stk@cpu@tsc_elapsed$qv	endp
@stk@cpu@tsc_elapsed$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	70
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch20
	dd	?patch21
	dd	?patch22
	df	@@stk@cpu@tsc_elapsed$qv
	dw	0
	dw	4107
	dw	0
	dw	25
	dw	0
	dw	0
	dw	0
	db	23
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	116
	db	115
	db	99
	db	95
	db	101
	db	108
	db	97
	db	112
	db	115
	db	101
	db	100
	db	36
	db	113
	db	118
?patch20	equ	@58-@@stk@cpu@tsc_elapsed$qv+32
?patch21	equ	0
?patch22	equ	@58-@@stk@cpu@tsc_elapsed$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ikelfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_pause$qv	segment virtual
	align	2
@@stk@cpu@tsc_pause$qv	proc	near
?live16391@0:
	?debug L 372
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-28
	push      ebx
	mov       dword ptr [ebp-8],offset @59
@60:
	mov       ebx,offset $ikelfcia
	jmp       short @62
	?debug L 375
?live16391@16: ; EBX = &$ikelfcia
@61:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@62:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @61
	cmp       dword ptr [ebx],0
	jne       short @61
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [ebx],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],eax
	jmp       short @65
@64:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@65:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @68
	cmp       dword ptr [ebx],0
@68:
	je        short @66
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @69
	cmp       eax,dword ptr [ebp-20]
@69:
	setne     cl
	and       ecx,1
	jmp       short @67
@66:
	xor       ecx,ecx
@67:
	test      cl,cl
	jne       short @64
	?debug L 376
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 377
	mov       eax,dword ptr [ebp-32]
	mov       dword ptr [_tsc_PAUSED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_PAUSED+4],eax
	?debug L 378
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 379
?live16391@80: ; 
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	?debug L 380
@71:
@70:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@59:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_pause$qv+0
	dd        @59+0
	db        224,255,255,255,8,0,0,0,2,0,0,0,236,255,255,255
	db        8,0,0,0,224,255,255,255,8,0,0,0
	?debug L 0
@@stk@cpu@tsc_pause$qv	endp
@stk@cpu@tsc_pause$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	68
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch23
	dd	?patch24
	dd	?patch25
	df	@@stk@cpu@tsc_pause$qv
	dw	0
	dw	4109
	dw	0
	dw	26
	dw	0
	dw	0
	dw	0
	db	21
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	116
	db	115
	db	99
	db	95
	db	112
	db	97
	db	117
	db	115
	db	101
	db	36
	db	113
	db	118
	dw	18
	dw	512
	dw	65504
	dw	65535
	dw	119
	dw	0
	dw	27
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ikelfcia
	dw	0
	dw	4102
	dw	0
	dw	28
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	29
	dw	0
	dw	0
	dw	0
?patch23	equ	@71-@@stk@cpu@tsc_pause$qv+51
?patch24	equ	0
?patch25	equ	@71-@@stk@cpu@tsc_pause$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65500
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$aoelfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_resume$qv	segment virtual
	align	2
@@stk@cpu@tsc_resume$qv	proc	near
?live16392@0:
	?debug L 383
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-64
	push      ebx
	mov       dword ptr [ebp-8],offset @72
@73:
	mov       ebx,offset $aoelfcia
	jmp       short @75
	?debug L 386
?live16392@16: ; EBX = &$aoelfcia
@74:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@75:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @74
	cmp       dword ptr [ebx],0
	jne       short @74
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [ebx],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],eax
	jmp       short @78
@77:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@78:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @81
	cmp       dword ptr [ebx],0
@81:
	je        short @79
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @82
	cmp       eax,dword ptr [ebp-20]
@82:
	setne     cl
	and       ecx,1
	jmp       short @80
@79:
	xor       ecx,ecx
@80:
	test      cl,cl
	jne       short @77
	?debug L 387
	mov       eax,dword ptr [_tsc_STARTED]
	mov       dword ptr [ebp-32],eax
	mov       eax,dword ptr [_tsc_STARTED+4]
	mov       dword ptr [ebp-28],eax
	?debug L 388
	mov       edx,dword ptr [_tsc_PAUSED]
	mov       dword ptr [ebp-44],edx
	mov       edx,dword ptr [_tsc_PAUSED+4]
	mov       dword ptr [ebp-40],edx
	?debug L 389
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	?debug L 390
	mov       eax,dword ptr [ebp-56]
	mov       edx,dword ptr [ebp-52]
	sub       eax,dword ptr [ebp-44]
	sbb       edx,dword ptr [ebp-40]
	add       eax,dword ptr [ebp-32]
	adc       edx,dword ptr [ebp-28]
	mov       dword ptr [ebp-68],eax
	mov       dword ptr [ebp-64],edx
	?debug L 391
	mov       eax,dword ptr [ebp-68]
	mov       dword ptr [_tsc_STARTED],eax
	mov       eax,dword ptr [ebp-64]
	mov       dword ptr [_tsc_STARTED+4],eax
	mov       dword ptr [_tsc_PAUSED],0
	mov       dword ptr [_tsc_PAUSED+4],0
	?debug L 392
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 393
?live16392@128: ; 
	mov       eax,dword ptr [ebp-56]
	mov       edx,dword ptr [ebp-52]
	?debug L 394
@84:
@83:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@72:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_resume$qv+0
	dd        @72+0
	db        188,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,224,255,255,255,8,0,0,0,212,255,255,255
	db        8,0,0,0,200,255,255,255,8,0,0,0,188,255,255,255
	db        8,0,0,0
	?debug L 0
@@stk@cpu@tsc_resume$qv	endp
@stk@cpu@tsc_resume$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	69
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch26
	dd	?patch27
	dd	?patch28
	df	@@stk@cpu@tsc_resume$qv
	dw	0
	dw	4111
	dw	0
	dw	30
	dw	0
	dw	0
	dw	0
	db	22
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	116
	db	115
	db	99
	db	95
	db	114
	db	101
	db	115
	db	117
	db	109
	db	101
	db	36
	db	113
	db	118
	dw	18
	dw	512
	dw	65468
	dw	65535
	dw	119
	dw	0
	dw	31
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65480
	dw	65535
	dw	119
	dw	0
	dw	32
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	119
	dw	0
	dw	33
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65504
	dw	65535
	dw	119
	dw	0
	dw	34
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aoelfcia
	dw	0
	dw	4102
	dw	0
	dw	35
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	36
	dw	0
	dw	0
	dw	0
?patch26	equ	@84-@@stk@cpu@tsc_resume$qv+75
?patch27	equ	0
?patch28	equ	@84-@@stk@cpu@tsc_resume$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65464
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ibflfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_start_paused$qv	segment virtual
	align	2
@@stk@cpu@tsc_start_paused$qv	proc	near
?live16393@0:
	?debug L 397
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-28
	push      ebx
	mov       dword ptr [ebp-8],offset @85
@86:
	mov       ebx,offset $ibflfcia
	jmp       short @88
	?debug L 400
?live16393@16: ; EBX = &$ibflfcia
@87:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@88:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @87
	cmp       dword ptr [ebx],0
	jne       short @87
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [ebx],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],eax
	jmp       short @91
@90:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@91:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @94
	cmp       dword ptr [ebx],0
@94:
	je        short @92
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @95
	cmp       eax,dword ptr [ebp-20]
@95:
	setne     cl
	and       ecx,1
	jmp       short @93
@92:
	xor       ecx,ecx
@93:
	test      cl,cl
	jne       short @90
	?debug L 401
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 402
	mov       eax,dword ptr [ebp-32]
	mov       dword ptr [_tsc_LAST_MEASURED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_LAST_MEASURED+4],eax
	?debug L 403
	mov       edx,dword ptr [ebp-32]
	mov       dword ptr [_tsc_STARTED],edx
	mov       edx,dword ptr [ebp-28]
	mov       dword ptr [_tsc_STARTED+4],edx
	?debug L 404
	mov       dword ptr [_tsc_ELAPSED],0
	mov       dword ptr [_tsc_ELAPSED+4],0
	mov       eax,dword ptr [ebp-32]
	mov       dword ptr [_tsc_PAUSED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_PAUSED+4],eax
	?debug L 405
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 406
?live16393@112: ; 
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	?debug L 407
@97:
@96:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@85:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_start_paused$qv+0
	dd        @85+0
	db        224,255,255,255,8,0,0,0,2,0,0,0,236,255,255,255
	db        8,0,0,0,224,255,255,255,8,0,0,0
	?debug L 0
@@stk@cpu@tsc_start_paused$qv	endp
@stk@cpu@tsc_start_paused$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	75
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
	df	@@stk@cpu@tsc_start_paused$qv
	dw	0
	dw	4113
	dw	0
	dw	37
	dw	0
	dw	0
	dw	0
	db	28
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	116
	db	115
	db	99
	db	95
	db	115
	db	116
	db	97
	db	114
	db	116
	db	95
	db	112
	db	97
	db	117
	db	115
	db	101
	db	100
	db	36
	db	113
	db	118
	dw	18
	dw	512
	dw	65504
	dw	65535
	dw	119
	dw	0
	dw	38
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ibflfcia
	dw	0
	dw	4102
	dw	0
	dw	39
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	40
	dw	0
	dw	0
	dw	0
?patch29	equ	@97-@@stk@cpu@tsc_start_paused$qv+51
?patch30	equ	0
?patch31	equ	@97-@@stk@cpu@tsc_start_paused$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65500
	dw	65535
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpuid$qpuit1t1t1uiui	segment virtual
	align	2
@@stk@cpu@cpuid$qpuit1t1t1uiui	proc	near
?live16394@0:
	?debug L 410
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @98
	?debug L 455
@99:
	xor       eax,eax
	?debug L 458
@101:
@100:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@98:
	db        67,71,83,0
	dd        @@stk@cpu@cpuid$qpuit1t1t1uiui+0
	dd        @98+0
	db        248,255,255,255,32,0,0,0,6,0,0,0,28,0,0,0
	db        4,0,0,0,24,0,0,0,4,0,0,0,20,0,0,0
	db        4,0,0,0,16,0,0,0,4,0,0,0,12,0,0,0
	db        4,0,0,0,8,0,0,0,4,0,0,0
	?debug L 0
@@stk@cpu@cpuid$qpuit1t1t1uiui	endp
@stk@cpu@cpuid$qpuit1t1t1uiui	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	76
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch32
	dd	?patch33
	dd	?patch34
	df	@@stk@cpu@cpuid$qpuit1t1t1uiui
	dw	0
	dw	4115
	dw	0
	dw	41
	dw	0
	dw	0
	dw	0
	db	29
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	105
	db	100
	db	36
	db	113
	db	112
	db	117
	db	105
	db	116
	db	49
	db	116
	db	49
	db	116
	db	49
	db	117
	db	105
	db	117
	db	105
	dw	18
	dw	512
	dw	8
	dw	0
	dw	1141
	dw	0
	dw	42
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	12
	dw	0
	dw	1141
	dw	0
	dw	43
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	16
	dw	0
	dw	1141
	dw	0
	dw	44
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	20
	dw	0
	dw	1141
	dw	0
	dw	45
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	24
	dw	0
	dw	117
	dw	0
	dw	46
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	28
	dw	0
	dw	117
	dw	0
	dw	47
	dw	0
	dw	0
	dw	0
?patch32	equ	@101-@@stk@cpu@cpuid$qpuit1t1t1uiui+82
?patch33	equ	0
?patch34	equ	@101-@@stk@cpu@cpuid$qpuit1t1t1uiui
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$afflfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$iiflfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$amflfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$ipflfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$adglfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$igglfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$akglfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpuidex$qpuit1t1t1uiui	segment virtual
	align	2
@@stk@cpu@cpuidex$qpuit1t1t1uiui	proc	near
?live16395@0:
	?debug L 461
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-16
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @102
@103:
	jmp       short @105
	?debug L 471
@104:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@105:
	cmp       dword ptr [$akglfcia+4],0
	jne       short @104
	cmp       dword ptr [$akglfcia],0
@106:
	jne       short @104
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [$akglfcia],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [$akglfcia+4],eax
	jmp       short @108
@107:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@108:
	cmp       dword ptr [$akglfcia+4],0
	jne       short @111
	cmp       dword ptr [$akglfcia],0
@111:
	je        short @109
	mov       eax,dword ptr [$akglfcia]
	mov       edx,dword ptr [$akglfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @112
	cmp       eax,dword ptr [ebp-20]
@112:
	setne     cl
	and       ecx,1
	jmp       short @110
@109:
	xor       ecx,ecx
@110:
	test      cl,cl
	jne       short @107
	?debug L 472
	mov       eax,dword ptr [ebp+24]
	cmp       eax,dword ptr [$adglfcia]
	jne       short @113
	mov       edx,dword ptr [ebp+28]
	cmp       edx,dword ptr [$igglfcia]
	jne       short @113
	?debug L 473
	mov       eax,dword ptr [ebp+8]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$afflfcia]
	mov       dword ptr [eax],edx
	?debug L 474
	mov       ecx,dword ptr [ebp+12]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [$iiflfcia]
	mov       dword ptr [ecx],eax
	?debug L 475
	mov       edx,dword ptr [ebp+16]
	push      4
	push      edx
	push      0
	call      _CG_DA_EPY
	mov       ecx,dword ptr [$amflfcia]
	mov       dword ptr [edx],ecx
	?debug L 476
	mov       eax,dword ptr [ebp+20]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$ipflfcia]
	mov       dword ptr [eax],edx
	?debug L 477
@114:
	mov       eax,dword ptr [$afflfcia]
	?debug L 478
?live16395@128: ; EAX = ret
	mov       dword ptr [$akglfcia],0
	mov       dword ptr [$akglfcia+4],0
	?debug L 479
	jmp       @115
	?debug L 480
?live16395@160: ; 
@116:
	jmp       short @117
	?debug L 482
@113:
	mov       edx,dword ptr [ebp+24]
	?debug L 483
	mov       ecx,dword ptr [ebp+28]
	?debug L 482
	mov       dword ptr [$adglfcia],edx
	?debug L 483
	mov       dword ptr [$igglfcia],ecx
	?debug L 627
@117:
	pushfd	
	?debug L 628
	push	 eax
	?debug L 629
	push	 ebx
	?debug L 630
	push	 ecx
	?debug L 631
	push	 edx
	?debug L 632
	push	 esi
	?debug L 633
	push	 edi
	?debug L 634
	mov	 edi,dword ptr [ebp+24]
	?debug L 635
	mov	 eax,edi
	?debug L 636
	and	 eax,080000000H
	?debug L 637
	cpuid	
	?debug L 638
	mov	        esi,eax
	?debug L 639
	xor	        eax,eax
	?debug L 640
	xor	        ebx,ebx
	?debug L 641
	xor	        ecx,ecx
	?debug L 642
	xor	        edx,edx
	?debug L 643
	cmp	        esi,edi
	?debug L 644
	jb        short @118
	?debug L 645
	mov	        eax,edi
	?debug L 646
	mov	        edi,dword ptr [ebp+28]
	?debug L 647
	mov	        ecx,edi
	?debug L 648
	cpuid	
	?debug L 649
@118:
cpuid_save_result:
	?debug L 650
	mov	 dword ptr $afflfcia,eax
	?debug L 651
	mov	 dword ptr $iiflfcia,ebx
	?debug L 652
	mov	 dword ptr $amflfcia,ecx
	?debug L 653
	mov	 dword ptr $ipflfcia,edx
	?debug L 654
	pop	 edi
	?debug L 655
	pop	 esi
	?debug L 656
	pop	 edx
	?debug L 657
	pop	 ecx
	?debug L 658
	pop	 ebx
	?debug L 659
	pop	 eax
	?debug L 660
	popfd	
	?debug L 666
	mov       eax,dword ptr [ebp+8]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$afflfcia]
	mov       dword ptr [eax],edx
	?debug L 667
	mov       ecx,dword ptr [ebp+12]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [$iiflfcia]
	mov       dword ptr [ecx],eax
	?debug L 668
	mov       edx,dword ptr [ebp+16]
	push      4
	push      edx
	push      0
	call      _CG_DA_EPY
	mov       ecx,dword ptr [$amflfcia]
	mov       dword ptr [edx],ecx
	?debug L 669
	mov       eax,dword ptr [ebp+20]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$ipflfcia]
	mov       dword ptr [eax],edx
	?debug L 684
	mov       ecx,dword ptr [ebp+8]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [ecx]
	?debug L 685
?live16395@864: ; EAX = ret
	mov       dword ptr [$akglfcia],0
	mov       dword ptr [$akglfcia+4],0
	?debug L 687
?live16395@880: ; 
@119:
@115:
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@102:
	db        67,71,83,0
	dd        @@stk@cpu@cpuidex$qpuit1t1t1uiui+0
	dd        @102+0
	db        236,255,255,255,32,0,0,0,7,0,0,0,28,0,0,0
	db        4,0,0,0,24,0,0,0,4,0,0,0,20,0,0,0
	db        4,0,0,0,16,0,0,0,4,0,0,0,12,0,0,0
	db        4,0,0,0,8,0,0,0,4,0,0,0,236,255,255,255
	db        8,0,0,0
	?debug L 0
@@stk@cpu@cpuidex$qpuit1t1t1uiui	endp
@stk@cpu@cpuidex$qpuit1t1t1uiui	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	78
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch35
	dd	?patch36
	dd	?patch37
	df	@@stk@cpu@cpuidex$qpuit1t1t1uiui
	dw	0
	dw	4117
	dw	0
	dw	48
	dw	0
	dw	0
	dw	0
	db	31
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	105
	db	100
	db	101
	db	120
	db	36
	db	113
	db	112
	db	117
	db	105
	db	116
	db	49
	db	116
	db	49
	db	116
	db	49
	db	117
	db	105
	db	117
	db	105
	dw	18
	dw	512
	dw	8
	dw	0
	dw	1141
	dw	0
	dw	49
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	12
	dw	0
	dw	1141
	dw	0
	dw	50
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	16
	dw	0
	dw	1141
	dw	0
	dw	51
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	20
	dw	0
	dw	1141
	dw	0
	dw	52
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	24
	dw	0
	dw	117
	dw	0
	dw	53
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	28
	dw	0
	dw	117
	dw	0
	dw	54
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	55
	dw	0
	dw	0
	dw	0
	dw	?patch38
	dw	529
	dw	?patch39
	dd	?live16395@864-@@stk@cpu@cpuidex$qpuit1t1t1uiui
	dd	?live16395@880-?live16395@864
	dw	17
?patch39	equ	1
?patch38	equ	14
	dw	22
	dw	513
	df	$akglfcia
	dw	0
	dw	4102
	dw	0
	dw	56
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	57
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$igglfcia
	dw	0
	dw	117
	dw	0
	dw	58
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$adglfcia
	dw	0
	dw	117
	dw	0
	dw	59
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ipflfcia
	dw	0
	dw	117
	dw	0
	dw	60
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$amflfcia
	dw	0
	dw	117
	dw	0
	dw	61
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iiflfcia
	dw	0
	dw	117
	dw	0
	dw	62
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$afflfcia
	dw	0
	dw	117
	dw	0
	dw	63
	dw	0
	dw	0
	dw	0
	dw	24
	dw	519
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch40
	df	@114
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	64
	dw	0
	dw	0
	dw	0
	dw	?patch41
	dw	529
	dw	?patch42
	dd	?live16395@128-@@stk@cpu@cpuidex$qpuit1t1t1uiui
	dd	?live16395@160-?live16395@128
	dw	17
?patch42	equ	1
?patch41	equ	14
?patch40	equ	@116-@114
	dw	2
	dw	6
?patch35	equ	@119-@@stk@cpu@cpuidex$qpuit1t1t1uiui+91
?patch36	equ	0
?patch37	equ	@119-@@stk@cpu@cpuidex$qpuit1t1t1uiui
	dw	2
	dw	6
	dw	8
	dw	531
	dw	7
	dw	65504
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$aehlfcia	label	dword
	dd	0
	dd	0
	dd	0
	dd	0
	db	1	dup(?)
	align	4
$ihhlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_vendor$qv	segment virtual
	align	2
@@stk@cpu@cpu_vendor$qv	proc	near
?live16396@0:
	?debug L 690
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-16
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @120
@121:
	mov       ebx,offset $ihhlfcia
	mov       esi,offset $aehlfcia
	jmp       short @123
	?debug L 697
?live16396@16: ; EBX = &$ihhlfcia, ESI = &$aehlfcia
@122:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@123:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @122
	cmp       dword ptr [ebx],0
	jne       short @122
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [ebx],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],eax
	jmp       short @126
@125:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@126:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @129
	cmp       dword ptr [ebx],0
@129:
	je        short @127
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @130
	cmp       eax,dword ptr [ebp-20]
@130:
	setne     cl
	and       ecx,1
	jmp       short @128
@127:
	xor       ecx,ecx
@128:
	test      cl,cl
	jne       short @125
	?debug L 698
	push      0
	push      0
	push      esi
	push      4
	call      _CG_A_PY
	lea       eax,dword ptr [esi+4]
	push      eax
	push      esi
	push      8
	call      _CG_A_PY
	lea       edx,dword ptr [esi+8]
	push      edx
	push      esi
	push      esi
	push      12
	call      _CG_A_PY
	lea       eax,dword ptr [esi+12]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 699
	push      4
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi],0
	je        short @131
	?debug L 700
	push      4
	push      esi
	push      12
	call      _CG_DA_EPY
	xor       edx,edx
	mov       dword ptr [esi+12],edx
	?debug L 702
@131:
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 703
?live16396@96: ; ESI = &$aehlfcia
	mov       eax,esi
	?debug L 702
?live16396@112: ; EBX = &$ihhlfcia, ESI = &$aehlfcia
	mov       dword ptr [ebx+4],0
	?debug L 704
?live16396@128: ; 
@133:
@132:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@120:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_vendor$qv+0
	dd        @120+0
	db        236,255,255,255,8,0,0,0,1,0,0,0,236,255,255,255
	db        8,0,0,0
	?debug L 0
@@stk@cpu@cpu_vendor$qv	endp
@stk@cpu@cpu_vendor$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	69
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch43
	dd	?patch44
	dd	?patch45
	df	@@stk@cpu@cpu_vendor$qv
	dw	0
	dw	4119
	dw	0
	dw	65
	dw	0
	dw	0
	dw	0
	db	22
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	118
	db	101
	db	110
	db	100
	db	111
	db	114
	db	36
	db	113
	db	118
	dw	22
	dw	513
	df	$ihhlfcia
	dw	0
	dw	4102
	dw	0
	dw	66
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	67
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aehlfcia
	dw	0
	dw	4121
	dw	0
	dw	68
	dw	0
	dw	0
	dw	0
?patch43	equ	@133-@@stk@cpu@cpu_vendor$qv+41
?patch44	equ	0
?patch45	equ	@133-@@stk@cpu@cpu_vendor$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	5
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ibilfcia	label	dword
	dd	0
	dd	0
	dd	0
	dd	0
	dd	0
	dd	0
	dd	0
	dd	0
	dd	0
	dd	0
	dd	0
	dd	0
	db	4	dup(?)
	db	1	dup(?)
	align	4
$afilfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_name$qv	segment virtual
	align	2
@@stk@cpu@cpu_name$qv	proc	near
?live16397@0:
	?debug L 707
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @134
@135:
	mov       edi,offset $ibilfcia
	?debug L 713
?live16397@16: ; EDI = &$ibilfcia
	push      4
	push      edi
	call      _CG_D_EP
	cmp       dword ptr [edi],0
	je        short @139
	?debug L 714
	mov       eax,edi
	jmp       @137
	?debug L 716
@138:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@139:
	cmp       dword ptr [$afilfcia+4],0
	jne       short @138
	cmp       dword ptr [$afilfcia],0
	jne       short @138
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$afilfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$afilfcia+4],edx
	jmp       short @142
@141:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@142:
	cmp       dword ptr [$afilfcia+4],0
	jne       short @145
	cmp       dword ptr [$afilfcia],0
@145:
	je        short @143
	mov       eax,dword ptr [$afilfcia]
	mov       edx,dword ptr [$afilfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @146
	cmp       eax,dword ptr [ebp-20]
@146:
	setne     cl
	and       ecx,1
	jmp       short @144
@143:
	xor       ecx,ecx
@144:
	test      cl,cl
	jne       short @141
	?debug L 719
	push      0
	push      -2147483648
	lea       eax,dword ptr [ebp-28]
	push      eax
	lea       edx,dword ptr [ebp-36]
	push      edx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	cmp       eax,-2147483644
	jae       short @147
	?debug L 720
	mov       dword ptr [$afilfcia],0
	mov       dword ptr [$afilfcia+4],0
	?debug L 721
	push      12
	push      offset s@
	push      edi
	call      @@stk@mem@mov$qpvpxvxui
	jmp       @137
	?debug L 723
@147:
	mov       esi,-2147483646
	xor       ebx,ebx
	?debug L 725
?live16397@128: ; EBX = i, ESI = f, EDI = &$ibilfcia
@148:
	lea       eax,dword ptr [ebx+3]
	push      0
	shl       eax,2
	push      esi
	add       eax,edi
	push      offset $ibilfcia
	push      eax
	call      _CG_A_BP
	push      eax
	lea       edx,dword ptr [ebx+2]
	shl       edx,2
	add       edx,edi
	push      offset $ibilfcia
	push      edx
	call      _CG_A_BP
	push      edx
	lea       ecx,dword ptr [ebx+1]
	shl       ecx,2
	add       ecx,edi
	push      offset $ibilfcia
	push      ecx
	call      _CG_A_BP
	push      ecx
	mov       eax,ebx
	shl       eax,2
	add       eax,edi
	push      offset $ibilfcia
	push      eax
	call      _CG_A_BP
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 723
	inc       esi
	add       ebx,4
	cmp       ebx,12
	jb        short @148
	?debug L 727
?live16397@160: ; EDI = &$ibilfcia
	push      32
	push      edi
	call      @@stk@cstr@trim$qpcc
	?debug L 728
	mov       dword ptr [$afilfcia],0
	mov       dword ptr [$afilfcia+4],0
	?debug L 729
	mov       eax,edi
	?debug L 730
?live16397@208: ; 
@151:
@137:
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@134:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_name$qv+0
	dd        @134+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_name$qv	endp
@stk@cpu@cpu_name$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	67
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch46
	dd	?patch47
	dd	?patch48
	df	@@stk@cpu@cpu_name$qv
	dw	0
	dw	4122
	dw	0
	dw	69
	dw	0
	dw	0
	dw	0
	db	20
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	110
	db	97
	db	109
	db	101
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	117
	dw	0
	dw	20
	dw	70
	dw	0
	dw	0
	dw	0
	dw	?patch49
	dw	529
	dw	?patch50
	dd	?live16397@128-@@stk@cpu@cpu_name$qv
	dd	?live16397@160-?live16397@128
	dw	20
?patch50	equ	1
?patch49	equ	14
	dw	16
	dw	2
	dw	117
	dw	0
	dw	23
	dw	71
	dw	0
	dw	0
	dw	0
	dw	?patch51
	dw	529
	dw	?patch52
	dd	?live16397@128-@@stk@cpu@cpu_name$qv
	dd	?live16397@160-?live16397@128
	dw	23
?patch52	equ	1
?patch51	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	72
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	73
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	74
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	75
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$afilfcia
	dw	0
	dw	4102
	dw	0
	dw	76
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	77
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ibilfcia
	dw	0
	dw	4124
	dw	0
	dw	78
	dw	0
	dw	0
	dw	0
?patch46	equ	@151-@@stk@cpu@cpu_name$qv+75
?patch47	equ	0
?patch48	equ	@151-@@stk@cpu@cpu_name$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	7
	dw	65472
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$apilfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$icjlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_threads$qv	segment virtual
	align	2
@@stk@cpu@cpu_num_threads$qv	proc	near
?live16398@0:
	?debug L 733
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @152
@153:
	mov       ebx,offset $icjlfcia
	?debug L 739
?live16398@16: ; EBX = &$icjlfcia
	mov       eax,dword ptr [$apilfcia]
	cmp       eax,-1
	jne       @155
	?debug L 740
?live16398@32: ; EAX = @temp4
	jmp       short @157
	?debug L 742
?live16398@48: ; EBX = &$icjlfcia
@156:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@157:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @156
	cmp       dword ptr [ebx],0
	jne       short @156
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],edx
	jmp       short @160
@159:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@160:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @163
	cmp       dword ptr [ebx],0
@163:
	je        short @161
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @164
	cmp       eax,dword ptr [ebp-20]
@164:
	setne     cl
	and       ecx,1
	jmp       short @162
@161:
	xor       ecx,ecx
@162:
	test      cl,cl
	jne       short @159
	?debug L 745
	push      0
	push      1
	lea       eax,dword ptr [ebp-28]
	push      eax
	lea       edx,dword ptr [ebp-36]
	push      edx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 747
	mov       eax,dword ptr [ebp-44]
	?debug L 745
	add       esp,24
	?debug L 747
	shr       eax,16
	and       eax,255
	?debug L 749
?live16398@128: ; EBX = &$icjlfcia, EAX = @temp3
	push      8
	?debug L 747
?live16398@144: ; EBX = &$icjlfcia
	inc       eax
	?debug L 749
?live16398@160: ; EBX = &$icjlfcia, EAX = @temp3
	push      ebx
	?debug L 747
?live16398@176: ; EBX = &$icjlfcia
	mov       dword ptr [$apilfcia],eax
	?debug L 749
?live16398@192: ; EBX = &$icjlfcia, EAX = @temp3
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 751
?live16398@208: ; 
@165:
@155:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@152:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_num_threads$qv+0
	dd        @152+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_num_threads$qv	endp
@stk@cpu@cpu_num_threads$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	74
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch53
	dd	?patch54
	dd	?patch55
	df	@@stk@cpu@cpu_num_threads$qv
	dw	0
	dw	4125
	dw	0
	dw	79
	dw	0
	dw	0
	dw	0
	db	27
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	110
	db	117
	db	109
	db	95
	db	116
	db	104
	db	114
	db	101
	db	97
	db	100
	db	115
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	80
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	81
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	82
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	83
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	84
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$icjlfcia
	dw	0
	dw	4102
	dw	0
	dw	85
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	86
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$apilfcia
	dw	0
	dw	117
	dw	0
	dw	87
	dw	0
	dw	0
	dw	0
?patch53	equ	@165-@@stk@cpu@cpu_num_threads$qv+75
?patch54	equ	0
?patch55	equ	@165-@@stk@cpu@cpu_num_threads$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$agjlfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ijjlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_cores$qv	segment virtual
	align	2
@@stk@cpu@cpu_num_cores$qv	proc	near
?live16399@0:
	?debug L 754
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @166
@167:
	mov       ebx,offset $ijjlfcia
	?debug L 760
?live16399@16: ; EBX = &$ijjlfcia
	mov       eax,dword ptr [$agjlfcia]
	cmp       eax,-1
	jne       @169
	?debug L 761
?live16399@32: ; EAX = @temp3
	jmp       short @171
	?debug L 763
?live16399@48: ; EBX = &$ijjlfcia
@170:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@171:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @170
	cmp       dword ptr [ebx],0
	jne       short @170
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],edx
	jmp       short @174
@173:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@174:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @177
	cmp       dword ptr [ebx],0
@177:
	je        short @175
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @178
	cmp       eax,dword ptr [ebp-20]
@178:
	setne     cl
	and       ecx,1
	jmp       short @176
@175:
	xor       ecx,ecx
@176:
	test      cl,cl
	jne       short @173
	?debug L 766
	push      12
	push      offset s@+13
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       short @179
	cmp       eax,0
	jne       short @179
	?debug L 768
	push      0
	push      4
	lea       eax,dword ptr [ebp-28]
	push      eax
	lea       edx,dword ptr [ebp-36]
	push      edx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 769
	mov       ecx,dword ptr [ebp-52]
	shr       ecx,26
	and       ecx,63
	inc       ecx
	mov       dword ptr [$agjlfcia],ecx
	?debug L 771
	jmp       short @181
	?debug L 773
@179:
	push      12
	push      offset s@+26
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       short @182
	cmp       eax,0
	jne       short @182
	?debug L 775
	push      0
	push      -2147483647
	lea       eax,dword ptr [ebp-28]
	push      eax
	lea       edx,dword ptr [ebp-36]
	push      edx
	lea       ecx,dword ptr [ebp-44]
	push      ecx
	lea       eax,dword ptr [ebp-52]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 776
	mov       edx,dword ptr [ebp-36]
	and       edx,255
	inc       edx
	mov       dword ptr [$agjlfcia],edx
	?debug L 778
	jmp       short @181
	?debug L 779
@182:
	call      @@stk@cpu@cpu_num_threads$qv
	mov       dword ptr [$agjlfcia],eax
	?debug L 780
@181:
	mov       eax,dword ptr [$agjlfcia]
	?debug L 781
?live16399@224: ; EBX = &$ijjlfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 784
?live16399@240: ; 
@184:
@169:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@166:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_num_cores$qv+0
	dd        @166+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_num_cores$qv	endp
@stk@cpu@cpu_num_cores$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	72
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch56
	dd	?patch57
	dd	?patch58
	df	@@stk@cpu@cpu_num_cores$qv
	dw	0
	dw	4127
	dw	0
	dw	88
	dw	0
	dw	0
	dw	0
	db	25
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	110
	db	117
	db	109
	db	95
	db	99
	db	111
	db	114
	db	101
	db	115
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	89
	dw	0
	dw	0
	dw	0
	dw	?patch59
	dw	529
	dw	?patch60
	dd	?live16399@224-@@stk@cpu@cpu_num_cores$qv
	dd	?live16399@240-?live16399@224
	dw	17
?patch60	equ	1
?patch59	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	90
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	91
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	92
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	93
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ijjlfcia
	dw	0
	dw	4102
	dw	0
	dw	94
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	95
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$agjlfcia
	dw	0
	dw	117
	dw	0
	dw	96
	dw	0
	dw	0
	dw	0
?patch56	equ	@184-@@stk@cpu@cpu_num_cores$qv+74
?patch57	equ	0
?patch58	equ	@184-@@stk@cpu@cpu_num_cores$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$anjlfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$iaklfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_cache_size$quc	segment virtual
	align	2
@@stk@cpu@cpu_cache_size$quc	proc	near
?live16400@0:
	?debug L 785
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @185
@186:
	mov       ebx,dword ptr [ebp+8]
	mov       esi,offset $iaklfcia
	mov       edi,offset $anjlfcia
	?debug L 791
?live16400@16: ; EBX = a_level, ESI = &$iaklfcia, EDI = &$anjlfcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       eax,dword ptr [edi]
	cmp       eax,-1
	jne       @188
	?debug L 792
?live16400@32: ; EAX = @temp5, EDI = &$anjlfcia
	jmp       short @190
	?debug L 794
?live16400@48: ; EBX = a_level, ESI = &$iaklfcia, EDI = &$anjlfcia
@189:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@190:
	push      8
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi+4],0
	jne       short @189
	cmp       dword ptr [esi],0
	jne       short @189
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      esi
	call      _CG_D_EP
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [esi],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [esi+4],edx
	jmp       short @193
@192:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@193:
	push      8
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi+4],0
	jne       short @196
	cmp       dword ptr [esi],0
@196:
	je        short @194
	push      8
	push      esi
	call      _CG_D_EP
	mov       eax,dword ptr [esi]
	mov       edx,dword ptr [esi+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @197
	cmp       eax,dword ptr [ebp-20]
@197:
	setne     cl
	and       ecx,1
	jmp       short @195
@194:
	xor       ecx,ecx
@195:
	test      cl,cl
	jne       short @192
	?debug L 797
	push      12
	push      offset s@+13
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       @198
	cmp       eax,0
	jne       @198
	?debug L 798
	cmp       bl,2
	jne       @200
	?debug L 799
?live16400@96: ; ESI = &$iaklfcia, EDI = &$anjlfcia
	push      0
	push      2
	lea       eax,dword ptr [ebp-28]
	push      eax
	lea       edx,dword ptr [ebp-36]
	push      edx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 800
	mov       eax,dword ptr [ebp-28]
	and       eax,255
	cmp       eax,64
	jne       short @201
	?debug L 801
	push      4
	push      edi
	call      _CG_D_EP
	xor       edx,edx
	mov       dword ptr [edi],edx
	jmp       @202
	?debug L 803
?live16400@144: ; ESI = &$iaklfcia, EAX = @temp4, EDI = &$anjlfcia
@201:
	cmp       eax,65
	jne       short @203
	?debug L 804
?live16400@160: ; ESI = &$iaklfcia, EDI = &$anjlfcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],128
	jmp       @202
	?debug L 806
?live16400@176: ; ESI = &$iaklfcia, EAX = @temp4, EDI = &$anjlfcia
@203:
	cmp       eax,66
	jne       short @204
	?debug L 807
?live16400@192: ; ESI = &$iaklfcia, EDI = &$anjlfcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],256
	jmp       @202
	?debug L 809
?live16400@208: ; ESI = &$iaklfcia, EAX = @temp4, EDI = &$anjlfcia
@204:
	cmp       eax,67
	jne       short @205
	?debug L 810
?live16400@224: ; ESI = &$iaklfcia, EDI = &$anjlfcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],512
	jmp       @202
	?debug L 812
?live16400@240: ; ESI = &$iaklfcia, EAX = @temp4, EDI = &$anjlfcia
@205:
	cmp       eax,68
	jne       short @206
	?debug L 813
?live16400@256: ; ESI = &$iaklfcia, EDI = &$anjlfcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],1024
	jmp       @202
	?debug L 815
?live16400@272: ; ESI = &$iaklfcia, EAX = @temp4, EDI = &$anjlfcia
@206:
	cmp       eax,69
	jne       short @207
	?debug L 816
?live16400@288: ; ESI = &$iaklfcia, EDI = &$anjlfcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],2048
	jmp       @202
	?debug L 820
@207:
	push      4
	push      edi
	call      _CG_D_EP
	xor       ecx,ecx
	mov       dword ptr [edi],ecx
	?debug L 822
	jmp       @202
	?debug L 823
@200:
	push      4
	push      edi
	call      _CG_D_EP
	xor       eax,eax
	mov       dword ptr [edi],eax
	?debug L 824
	jmp       @202
	?debug L 826
?live16400@368: ; EBX = a_level, ESI = &$iaklfcia, EDI = &$anjlfcia
@198:
	push      12
	push      offset s@+26
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       short @209
	cmp       eax,0
@209:
	jne       @210
	?debug L 827
	test      bl,bl
	jne       short @211
	?debug L 828
?live16400@400: ; ESI = &$iaklfcia, EDI = &$anjlfcia
	push      0
	push      -2147483643
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 829
	mov       ecx,dword ptr [ebp-28]
	shr       ecx,24
	and       ecx,255
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],ecx
	?debug L 830
	jmp       @212
	?debug L 832
?live16400@448: ; EBX = a_level, ESI = &$iaklfcia, EDI = &$anjlfcia
@211:
	cmp       bl,1
	jne       short @213
	?debug L 833
?live16400@464: ; ESI = &$iaklfcia, EDI = &$anjlfcia
	push      0
	push      -2147483643
	lea       eax,dword ptr [ebp-28]
	push      eax
	lea       edx,dword ptr [ebp-36]
	push      edx
	lea       ecx,dword ptr [ebp-44]
	push      ecx
	lea       eax,dword ptr [ebp-52]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 834
	mov       edx,dword ptr [ebp-36]
	shr       edx,24
	and       edx,255
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],edx
	?debug L 835
	jmp       short @212
	?debug L 837
?live16400@512: ; EBX = a_level, ESI = &$iaklfcia, EDI = &$anjlfcia
@213:
	cmp       bl,2
	jne       short @214
	?debug L 838
?live16400@528: ; ESI = &$iaklfcia, EDI = &$anjlfcia
	push      0
	push      -2147483642
	lea       ecx,dword ptr [ebp-28]
	push      ecx
	lea       eax,dword ptr [ebp-36]
	push      eax
	lea       edx,dword ptr [ebp-44]
	push      edx
	lea       ecx,dword ptr [ebp-52]
	push      ecx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 839
	mov       eax,dword ptr [ebp-36]
	shr       eax,16
	and       eax,65535
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],eax
	?debug L 840
	jmp       short @212
	?debug L 842
?live16400@576: ; EBX = a_level, ESI = &$iaklfcia, EDI = &$anjlfcia
@214:
	cmp       bl,3
	jne       short @215
	?debug L 843
?live16400@592: ; ESI = &$iaklfcia, EDI = &$anjlfcia
	push      0
	push      -2147483642
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 844
	mov       ecx,dword ptr [ebp-28]
	shr       ecx,18
	and       ecx,16383
	shl       ecx,9
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],ecx
	?debug L 847
@215:
@212:
@210:
@202:
	push      4
	push      edi
	call      _CG_D_EP
	mov       eax,dword ptr [edi]
	?debug L 848
?live16400@640: ; ESI = &$iaklfcia, EAX = ret
	push      8
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],0
	mov       dword ptr [esi+4],0
	?debug L 850
?live16400@656: ; 
@216:
@188:
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@185:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_cache_size$quc+0
	dd        @185+0
	db        204,255,255,255,12,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_cache_size$quc	endp
@stk@cpu@cpu_cache_size$quc	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	74
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch61
	dd	?patch62
	dd	?patch63
	df	@@stk@cpu@cpu_cache_size$quc
	dw	0
	dw	4129
	dw	0
	dw	97
	dw	0
	dw	0
	dw	0
	db	27
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	99
	db	97
	db	99
	db	104
	db	101
	db	95
	db	115
	db	105
	db	122
	db	101
	db	36
	db	113
	db	117
	db	99
	dw	18
	dw	512
	dw	8
	dw	0
	dw	32
	dw	0
	dw	98
	dw	0
	dw	0
	dw	0
	dw	?patch64
	dw	529
	dw	?patch65
	dd	?live16400@16-@@stk@cpu@cpu_cache_size$quc
	dd	?live16400@32-?live16400@16
	dw	4
	dd	?live16400@48-@@stk@cpu@cpu_cache_size$quc
	dd	?live16400@96-?live16400@48
	dw	4
	dd	?live16400@368-@@stk@cpu@cpu_cache_size$quc
	dd	?live16400@400-?live16400@368
	dw	4
	dd	?live16400@448-@@stk@cpu@cpu_cache_size$quc
	dd	?live16400@464-?live16400@448
	dw	4
	dd	?live16400@512-@@stk@cpu@cpu_cache_size$quc
	dd	?live16400@528-?live16400@512
	dw	4
	dd	?live16400@576-@@stk@cpu@cpu_cache_size$quc
	dd	?live16400@592-?live16400@576
	dw	4
?patch65	equ	6
?patch64	equ	64
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	99
	dw	0
	dw	0
	dw	0
	dw	?patch66
	dw	529
	dw	?patch67
	dd	?live16400@640-@@stk@cpu@cpu_cache_size$quc
	dd	?live16400@656-?live16400@640
	dw	17
?patch67	equ	1
?patch66	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	100
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	101
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	102
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	103
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iaklfcia
	dw	0
	dw	4102
	dw	0
	dw	104
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	105
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$anjlfcia
	dw	0
	dw	117
	dw	0
	dw	106
	dw	0
	dw	0
	dw	0
?patch61	equ	@216-@@stk@cpu@cpu_cache_size$quc+76
?patch62	equ	0
?patch63	equ	@216-@@stk@cpu@cpu_cache_size$quc
	dw	2
	dw	6
	dw	8
	dw	531
	dw	7
	dw	65472
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$aeklfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ihklfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_cache_line_size$quc	segment virtual
	align	2
@@stk@cpu@cpu_cache_line_size$quc	proc	near
?live16401@0:
	?debug L 853
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @217
@218:
	mov       ebx,dword ptr [ebp+8]
	mov       esi,offset $ihklfcia
	?debug L 859
?live16401@16: ; ESI = &$ihklfcia, EBX = a_level
	mov       eax,dword ptr [$aeklfcia]
	cmp       eax,-1
	jne       @220
	?debug L 860
?live16401@32: ; EAX = @temp4
	jmp       short @222
	?debug L 862
?live16401@48: ; ESI = &$ihklfcia, EBX = a_level
@221:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@222:
	push      8
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi+4],0
	jne       short @221
	cmp       dword ptr [esi],0
	jne       short @221
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      esi
	call      _CG_D_EP
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [esi],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [esi+4],edx
	jmp       short @225
@224:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@225:
	push      8
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi+4],0
	jne       short @228
	cmp       dword ptr [esi],0
@228:
	je        short @226
	push      8
	push      esi
	call      _CG_D_EP
	mov       eax,dword ptr [esi]
	mov       edx,dword ptr [esi+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @229
	cmp       eax,dword ptr [ebp-20]
@229:
	setne     cl
	and       ecx,1
	jmp       short @227
@226:
	xor       ecx,ecx
@227:
	test      cl,cl
	jne       short @224
	?debug L 865
	push      12
	push      offset s@+13
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       short @230
	cmp       eax,0
	jne       short @230
	?debug L 866
?live16401@80: ; ESI = &$ihklfcia
	push      0
	push      4
	lea       eax,dword ptr [ebp-28]
	push      eax
	lea       edx,dword ptr [ebp-36]
	push      edx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 867
	mov       ecx,dword ptr [ebp-44]
	and       ecx,4095
	inc       ecx
	mov       dword ptr [$aeklfcia],ecx
	?debug L 868
	jmp       @232
	?debug L 870
?live16401@128: ; ESI = &$ihklfcia, EBX = a_level
@230:
	push      12
	push      offset s@+26
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       @233
	cmp       eax,0
	jne       @233
	?debug L 871
	test      bl,bl
	jne       short @235
	?debug L 872
	push      0
	push      -2147483643
	lea       eax,dword ptr [ebp-28]
	push      eax
	lea       edx,dword ptr [ebp-36]
	push      edx
	lea       ecx,dword ptr [ebp-44]
	push      ecx
	lea       eax,dword ptr [ebp-52]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 873
	mov       edx,dword ptr [ebp-28]
	and       edx,255
	mov       dword ptr [$aeklfcia],edx
	?debug L 875
@235:
	cmp       bl,1
	jne       short @236
	?debug L 876
	push      0
	push      -2147483643
	lea       ecx,dword ptr [ebp-28]
	push      ecx
	lea       eax,dword ptr [ebp-36]
	push      eax
	lea       edx,dword ptr [ebp-44]
	push      edx
	lea       ecx,dword ptr [ebp-52]
	push      ecx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 877
	mov       eax,dword ptr [ebp-36]
	and       eax,255
	mov       dword ptr [$aeklfcia],eax
	?debug L 879
@236:
	cmp       bl,2
	jne       short @237
	?debug L 880
	push      0
	push      -2147483642
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 881
	mov       ecx,dword ptr [ebp-36]
	and       ecx,255
	mov       dword ptr [$aeklfcia],ecx
	?debug L 883
@237:
	cmp       bl,3
	jne       short @238
	?debug L 884
?live16401@304: ; ESI = &$ihklfcia
	push      0
	push      -2147483642
	lea       eax,dword ptr [ebp-28]
	push      eax
	lea       edx,dword ptr [ebp-36]
	push      edx
	lea       ecx,dword ptr [ebp-44]
	push      ecx
	lea       eax,dword ptr [ebp-52]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 885
	mov       edx,dword ptr [ebp-28]
	and       edx,255
	mov       dword ptr [$aeklfcia],edx
	?debug L 888
@238:
@233:
@232:
	mov       eax,dword ptr [$aeklfcia]
	?debug L 889
?live16401@352: ; ESI = &$ihklfcia, EAX = ret
	push      8
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],0
	mov       dword ptr [esi+4],0
	?debug L 892
?live16401@368: ; 
@239:
@220:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@217:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_cache_line_size$quc+0
	dd        @217+0
	db        204,255,255,255,12,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_cache_line_size$quc	endp
@stk@cpu@cpu_cache_line_size$quc	ends
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
	dd	?patch68
	dd	?patch69
	dd	?patch70
	df	@@stk@cpu@cpu_cache_line_size$quc
	dw	0
	dw	4131
	dw	0
	dw	107
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
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	99
	db	97
	db	99
	db	104
	db	101
	db	95
	db	108
	db	105
	db	110
	db	101
	db	95
	db	115
	db	105
	db	122
	db	101
	db	36
	db	113
	db	117
	db	99
	dw	18
	dw	512
	dw	8
	dw	0
	dw	32
	dw	0
	dw	108
	dw	0
	dw	0
	dw	0
	dw	?patch71
	dw	529
	dw	?patch72
	dd	?live16401@16-@@stk@cpu@cpu_cache_line_size$quc
	dd	?live16401@32-?live16401@16
	dw	4
	dd	?live16401@48-@@stk@cpu@cpu_cache_line_size$quc
	dd	?live16401@80-?live16401@48
	dw	4
	dd	?live16401@128-@@stk@cpu@cpu_cache_line_size$quc
	dd	?live16401@304-?live16401@128
	dw	4
?patch72	equ	3
?patch71	equ	34
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	109
	dw	0
	dw	0
	dw	0
	dw	?patch73
	dw	529
	dw	?patch74
	dd	?live16401@352-@@stk@cpu@cpu_cache_line_size$quc
	dd	?live16401@368-?live16401@352
	dw	17
?patch74	equ	1
?patch73	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	110
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	111
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	112
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	113
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ihklfcia
	dw	0
	dw	4102
	dw	0
	dw	114
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	115
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aeklfcia
	dw	0
	dw	117
	dw	0
	dw	116
	dw	0
	dw	0
	dw	0
?patch68	equ	@239-@@stk@cpu@cpu_cache_line_size$quc+73
?patch69	equ	0
?patch70	equ	@239-@@stk@cpu@cpu_cache_line_size$quc
	dw	2
	dw	6
	dw	8
	dw	531
	dw	5
	dw	65476
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$alklfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$ioklfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_mhz$qo	segment virtual
	align	2
@@stk@cpu@cpu_num_mhz$qo	proc	near
?live16402@0:
	?debug L 895
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-168
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @240
	?debug L 901
@241:
	mov       eax,dword ptr [$alklfcia]
	test      eax,eax
	je        short @245
	cmp       byte ptr [ebp+8],0
	je        @243
	?debug L 902
?live16402@32: ; EAX = @temp18
	jmp       short @245
	?debug L 904
?live16402@48: ; 
@244:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@245:
	cmp       dword ptr [$ioklfcia+4],0
	jne       short @244
	cmp       dword ptr [$ioklfcia],0
	jne       short @244
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$ioklfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$ioklfcia+4],edx
	jmp       short @248
@247:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@248:
	cmp       dword ptr [$ioklfcia+4],0
	jne       short @251
	cmp       dword ptr [$ioklfcia],0
@251:
	je        short @249
	mov       eax,dword ptr [$ioklfcia]
	mov       edx,dword ptr [$ioklfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @252
	cmp       eax,dword ptr [ebp-20]
@252:
	setne     cl
	and       ecx,1
	jmp       short @250
@249:
	xor       ecx,ecx
@250:
	test      cl,cl
	jne       short @247
	?debug L 917
	xor       ebx,ebx
	?debug L 918
?live16402@80: ; EBX = i
@253:
	call      @@stk@cpu@tsc_init$qv
	?debug L 919
	call      @@stk@cpu@tsc_start$qv
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-68],eax
	mov       dword ptr [ebp-64],edx
	call      @@stk@cpu@tsc_checkpoint$qv
	?debug L 920
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-128],eax
	mov       dword ptr [ebp-124],edx
	?debug L 921
@255:
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-80],eax
	mov       dword ptr [ebp-76],edx
	?debug L 922
	mov       eax,dword ptr [ebp-80]
	mov       edx,dword ptr [ebp-76]
	cmp       edx,dword ptr [ebp-64]
	jne       short @257
	cmp       eax,dword ptr [ebp-68]
@257:
	jbe       short @255
	?debug L 923
	call      @@stk@cpu@tsc_start$qv
	?debug L 924
@258:
	mov       edx,21
	?debug L 925
?live16402@192: ; EBX = i, EDX = trash1
@259:
	xor       eax,eax
@261:
	inc       eax
	cmp       eax,1000000
	jb        short @261
	?debug L 924
	dec       edx
	test      edx,edx
	ja        short @259
	?debug L 928
?live16402@224: ; EBX = i
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-92],eax
	mov       dword ptr [ebp-88],edx
	?debug L 929
@265:
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-104],eax
	mov       dword ptr [ebp-100],edx
	?debug L 930
	mov       eax,dword ptr [ebp-104]
	mov       edx,dword ptr [ebp-100]
	cmp       edx,dword ptr [ebp-88]
	jne       short @267
	cmp       eax,dword ptr [ebp-92]
@267:
	jbe       short @265
	?debug L 931
	call      @@stk@cpu@tsc_checkpoint$qv
	?debug L 932
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	?debug L 933
	mov       eax,dword ptr [ebp-104]
	mov       edx,dword ptr [ebp-100]
	sub       eax,dword ptr [ebp-80]
	sbb       edx,dword ptr [ebp-76]
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	?debug L 934
	mov       eax,dword ptr [ebp-116]
	mov       edx,dword ptr [ebp-112]
	sub       eax,dword ptr [ebp-128]
	sbb       edx,dword ptr [ebp-124]
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	?debug L 935
	push      0
	push      1000
	mov       eax,dword ptr [ebp-116]
	mov       edx,dword ptr [ebp-112]
	call      __llmul
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	?debug L 936
	cmp       dword ptr [ebp-52],0
	jne       short @269
	cmp       dword ptr [ebp-56],0
@269:
	je        short @268
	push      dword ptr [ebp-52]
	push      dword ptr [ebp-56]
	mov       eax,dword ptr [ebp-116]
	mov       edx,dword ptr [ebp-112]
	call      __lludiv
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	jmp       short @270
	?debug L 937
@268:
	mov       dword ptr [ebp-116],0
	mov       dword ptr [ebp-112],0
	?debug L 938
@270:
	push      8
	push      -172
	push      ebx
	push      3
	push      0
	call      _CG_LDA_EOXSY
	mov       eax,dword ptr [ebp-116]
	mov       dword ptr [ebp+8*ebx-172],eax
	mov       eax,dword ptr [ebp-112]
	mov       dword ptr [ebp+8*ebx-168],eax
@271:
	inc       ebx
	cmp       ebx,5
	jb        @253
	?debug L 940
?live16402@400: ; 
	mov       edx,dword ptr [ebp-172]
	xor       esi,esi
	mov       dword ptr [ebp-32],edx
	mov       edx,dword ptr [ebp-168]
	mov       dword ptr [ebp-28],edx
	mov       ecx,dword ptr [ebp-172]
	mov       dword ptr [ebp-44],ecx
	mov       ecx,dword ptr [ebp-168]
	mov       dword ptr [ebp-40],ecx
	xor       ecx,ecx
	xor       ebx,ebx
	?debug L 941
?live16402@416: ; EBX = i, ECX = imax, ESI = imin
@273:
	push      8
	push      -172
	push      ebx
	push      3
	push      0
	call      _CG_LDA_EOXSY
	mov       eax,dword ptr [ebp+8*ebx-172]
	mov       edx,dword ptr [ebp+8*ebx-168]
	cmp       edx,dword ptr [ebp-28]
	jne       short @276
	cmp       eax,dword ptr [ebp-32]
@276:
	jbe       short @275
	push      8
	push      -172
	push      ebx
	push      3
	push      0
	call      _CG_LDA_EOXSY
	mov       ecx,dword ptr [ebp+8*ebx-172]
	mov       dword ptr [ebp-32],ecx
	mov       ecx,dword ptr [ebp+8*ebx-168]
	mov       dword ptr [ebp-28],ecx
	mov       ecx,ebx
	?debug L 942
@275:
	push      8
	push      -172
	push      ebx
	push      3
	push      0
	call      _CG_LDA_EOXSY
	mov       eax,dword ptr [ebp+8*ebx-172]
	mov       edx,dword ptr [ebp+8*ebx-168]
	cmp       edx,dword ptr [ebp-40]
	jne       short @278
	cmp       eax,dword ptr [ebp-44]
@278:
	jae       short @277
	push      8
	push      -172
	push      ebx
	push      3
	push      0
	call      _CG_LDA_EOXSY
	mov       eax,dword ptr [ebp+8*ebx-172]
	mov       esi,ebx
	mov       dword ptr [ebp-44],eax
	mov       eax,dword ptr [ebp+8*ebx-168]
	mov       dword ptr [ebp-40],eax
@277:
	inc       ebx
	cmp       ebx,5
	jb        @273
	?debug L 944
?live16402@448: ; ECX = imax, ESI = imin
	mov       dword ptr [ebp-116],0
	mov       dword ptr [ebp-112],0
	xor       ebx,ebx
@280:
	cmp       esi,ebx
	je        short @282
	cmp       ecx,ebx
	je        short @282
	push      8
	push      -172
	push      ebx
	push      3
	push      0
	call      _CG_LDA_EOXSY
	mov       eax,dword ptr [ebp+8*ebx-172]
	mov       edx,dword ptr [ebp+8*ebx-168]
	add       eax,dword ptr [ebp-116]
	adc       edx,dword ptr [ebp-112]
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
@282:
	inc       ebx
	cmp       ebx,5
	jb        short @280
	?debug L 946
?live16402@464: ; 
	push      0
	push      1000000
	push      0
	push      3
	mov       eax,dword ptr [ebp-116]
	mov       edx,dword ptr [ebp-112]
	call      __lludiv
	call      __lludiv
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	?debug L 947
	mov       eax,dword ptr [ebp-116]
	mov       ecx,eax
	mov       dword ptr [$alklfcia],ecx
	?debug L 949
?live16402@496: ; ECX = @temp17
	mov       dword ptr [$ioklfcia],0
	mov       dword ptr [$ioklfcia+4],0
	?debug L 950
	mov       eax,ecx
	?debug L 951
?live16402@528: ; 
@284:
@243:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@240:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_num_mhz$qo+0
	dd        @240+0
	db        84,255,255,255,12,0,0,0,12,0,0,0,8,0,0,0
	db        1,0,0,0,236,255,255,255,8,0,0,0,224,255,255,255
	db        8,0,0,0,212,255,255,255,8,0,0,0,200,255,255,255
	db        8,0,0,0,188,255,255,255,8,0,0,0,176,255,255,255
	db        8,0,0,0,164,255,255,255,8,0,0,0,152,255,255,255
	db        8,0,0,0,140,255,255,255,8,0,0,0,128,255,255,255
	db        8,0,0,0,84,255,255,255,40,0,0,0
	?debug L 0
@@stk@cpu@cpu_num_mhz$qo	endp
@stk@cpu@cpu_num_mhz$qo	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	70
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch75
	dd	?patch76
	dd	?patch77
	df	@@stk@cpu@cpu_num_mhz$qo
	dw	0
	dw	4133
	dw	0
	dw	117
	dw	0
	dw	0
	dw	0
	db	23
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	110
	db	117
	db	109
	db	95
	db	109
	db	104
	db	122
	db	36
	db	113
	db	111
	dw	18
	dw	512
	dw	8
	dw	0
	dw	48
	dw	0
	dw	118
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65408
	dw	65535
	dw	119
	dw	0
	dw	119
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65420
	dw	65535
	dw	119
	dw	0
	dw	120
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65432
	dw	65535
	dw	119
	dw	0
	dw	121
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65444
	dw	65535
	dw	119
	dw	0
	dw	122
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65456
	dw	65535
	dw	119
	dw	0
	dw	123
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65468
	dw	65535
	dw	119
	dw	0
	dw	124
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65480
	dw	65535
	dw	119
	dw	0
	dw	125
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	20
	dw	126
	dw	0
	dw	0
	dw	0
	dw	?patch78
	dw	529
	dw	?patch79
	dd	?live16402@80-@@stk@cpu@cpu_num_mhz$qo
	dd	?live16402@400-?live16402@80
	dw	20
	dd	?live16402@416-@@stk@cpu@cpu_num_mhz$qo
	dd	?live16402@448-?live16402@416
	dw	20
?patch79	equ	2
?patch78	equ	24
	dw	16
	dw	2
	dw	117
	dw	0
	dw	23
	dw	127
	dw	0
	dw	0
	dw	0
	dw	?patch80
	dw	529
	dw	?patch81
	dd	?live16402@416-@@stk@cpu@cpu_num_mhz$qo
	dd	?live16402@464-?live16402@416
	dw	23
?patch81	equ	1
?patch80	equ	14
	dw	16
	dw	2
	dw	117
	dw	0
	dw	18
	dw	128
	dw	0
	dw	0
	dw	0
	dw	?patch82
	dw	529
	dw	?patch83
	dd	?live16402@416-@@stk@cpu@cpu_num_mhz$qo
	dd	?live16402@464-?live16402@416
	dw	18
?patch83	equ	1
?patch82	equ	14
	dw	18
	dw	512
	dw	65364
	dw	65535
	dw	4135
	dw	0
	dw	129
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	119
	dw	0
	dw	130
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65504
	dw	65535
	dw	119
	dw	0
	dw	131
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ioklfcia
	dw	0
	dw	4102
	dw	0
	dw	132
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	133
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$alklfcia
	dw	0
	dw	117
	dw	0
	dw	134
	dw	0
	dw	0
	dw	0
	dw	24
	dw	519
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch84
	df	@258
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	135
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	19
	dw	136
	dw	0
	dw	0
	dw	0
	dw	?patch85
	dw	529
	dw	?patch86
	dd	?live16402@192-@@stk@cpu@cpu_num_mhz$qo
	dd	?live16402@224-?live16402@192
	dw	19
?patch86	equ	1
?patch85	equ	14
?patch84	equ	@271-@258
	dw	2
	dw	6
?patch75	equ	@284-@@stk@cpu@cpu_num_mhz$qo+131
?patch76	equ	0
?patch77	equ	@284-@@stk@cpu@cpu_num_mhz$qo
	dw	2
	dw	6
	dw	8
	dw	531
	dw	5
	dw	65356
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iillfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$amllfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_x87$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_x87$qv	proc	near
?live16403@0:
	?debug L 956
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @285
@286:
	mov       ebx,offset $amllfcia
	?debug L 962
?live16403@16: ; EBX = &$amllfcia
	mov       eax,dword ptr [$iillfcia]
	cmp       eax,-1
	je        short @290
	?debug L 963
?live16403@32: ; EAX = @temp2
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @288
	?debug L 965
?live16403@48: ; EBX = &$amllfcia
@289:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@290:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @289
	cmp       dword ptr [ebx],0
	jne       short @289
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @293
@292:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@293:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @296
	cmp       dword ptr [ebx],0
@296:
	je        short @294
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @297
	cmp       eax,dword ptr [ebp-20]
@297:
	setne     al
	and       eax,1
	jmp       short @295
@294:
	xor       eax,eax
@295:
	test      al,al
	jne       short @292
	?debug L 968
	push      0
	push      1
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 970
	test      byte ptr [ebp-28],1
	je        short @298
	?debug L 971
	mov       dword ptr [$iillfcia],1
	?debug L 972
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 973
?live16403@128: ; 
	mov       al,1
	jmp       short @288
	?debug L 977
?live16403@144: ; EBX = &$amllfcia
@298:
	push      0
	push      -2147483647
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 979
	test      byte ptr [ebp-28],1
	je        short @299
	?debug L 980
	mov       dword ptr [$iillfcia],1
	?debug L 981
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 982
?live16403@208: ; 
	mov       al,1
	jmp       short @288
	?debug L 984
?live16403@224: ; EBX = &$amllfcia
@299:
	xor       edx,edx
	mov       dword ptr [$iillfcia],edx
	?debug L 985
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 986
?live16403@256: ; 
	xor       eax,eax
	?debug L 985
?live16403@272: ; EBX = &$amllfcia
	mov       dword ptr [ebx+4],0
	?debug L 987
?live16403@288: ; 
@300:
@288:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@285:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_x87$qv+0
	dd        @285+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_x87$qv	endp
@stk@cpu@cpu_has_x87$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	70
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch87
	dd	?patch88
	dd	?patch89
	df	@@stk@cpu@cpu_has_x87$qv
	dw	0
	dw	4136
	dw	0
	dw	137
	dw	0
	dw	0
	dw	0
	db	23
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	120
	db	56
	db	55
	db	36
	db	113
	db	118
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	138
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	139
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	140
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	141
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$amllfcia
	dw	0
	dw	4102
	dw	0
	dw	142
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	143
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iillfcia
	dw	0
	dw	117
	dw	0
	dw	144
	dw	0
	dw	0
	dw	0
?patch87	equ	@300-@@stk@cpu@cpu_has_x87$qv+72
?patch88	equ	0
?patch89	equ	@300-@@stk@cpu@cpu_has_x87$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ipllfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$admlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_mmx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mmx$qv	proc	near
?live16404@0:
	?debug L 990
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @301
@302:
	mov       ebx,offset $admlfcia
	?debug L 996
?live16404@16: ; EBX = &$admlfcia
	mov       eax,dword ptr [$ipllfcia]
	cmp       eax,-1
	je        short @306
	?debug L 997
?live16404@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @304
	?debug L 999
?live16404@48: ; EBX = &$admlfcia
@305:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@306:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @305
	cmp       dword ptr [ebx],0
	jne       short @305
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @309
@308:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@309:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @312
	cmp       dword ptr [ebx],0
@312:
	je        short @310
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @313
	cmp       eax,dword ptr [ebp-20]
@313:
	setne     al
	and       eax,1
	jmp       short @311
@310:
	xor       eax,eax
@311:
	test      al,al
	jne       short @308
	?debug L 1002
	push      0
	push      1
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1004
	mov       eax,dword ptr [ebp-28]
	and       eax,8388608
	mov       dword ptr [$ipllfcia],eax
	?debug L 1005
?live16404@96: ; EBX = &$admlfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1006
?live16404@112: ; EBX = &$admlfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1008
?live16404@128: ; 
@314:
@304:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@301:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_mmx$qv+0
	dd        @301+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_mmx$qv	endp
@stk@cpu@cpu_has_mmx$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	70
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch90
	dd	?patch91
	dd	?patch92
	df	@@stk@cpu@cpu_has_mmx$qv
	dw	0
	dw	4138
	dw	0
	dw	145
	dw	0
	dw	0
	dw	0
	db	23
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	109
	db	109
	db	120
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	146
	dw	0
	dw	0
	dw	0
	dw	?patch93
	dw	529
	dw	?patch94
	dd	?live16404@112-@@stk@cpu@cpu_has_mmx$qv
	dd	?live16404@128-?live16404@112
	dw	1
?patch94	equ	1
?patch93	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	147
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	148
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	149
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	150
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$admlfcia
	dw	0
	dw	4102
	dw	0
	dw	151
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	152
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ipllfcia
	dw	0
	dw	117
	dw	0
	dw	153
	dw	0
	dw	0
	dw	0
?patch90	equ	@314-@@stk@cpu@cpu_has_mmx$qv+72
?patch91	equ	0
?patch92	equ	@314-@@stk@cpu@cpu_has_mmx$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$igmlfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$akmlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_mmxext$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mmxext$qv	proc	near
?live16405@0:
	?debug L 1011
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @315
@316:
	mov       ebx,offset $akmlfcia
	?debug L 1017
?live16405@16: ; EBX = &$akmlfcia
	mov       eax,dword ptr [$igmlfcia]
	cmp       eax,-1
	je        short @320
	?debug L 1018
?live16405@32: ; EAX = @temp5
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @318
	?debug L 1020
?live16405@48: ; EBX = &$akmlfcia
@319:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@320:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @319
	cmp       dword ptr [ebx],0
	jne       short @319
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @323
@322:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@323:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @326
	cmp       dword ptr [ebx],0
@326:
	je        short @324
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @327
	cmp       eax,dword ptr [ebp-20]
@327:
	setne     al
	and       eax,1
	jmp       short @325
@324:
	xor       eax,eax
@325:
	test      al,al
	jne       short @322
	?debug L 1023
	push      0
	push      -2147483647
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1025
	mov       eax,dword ptr [ebp-28]
	and       eax,4194304
	mov       dword ptr [$igmlfcia],eax
	?debug L 1026
?live16405@96: ; EBX = &$akmlfcia, EAX = @temp3
	test      eax,eax
	je        short @328
	?debug L 1027
?live16405@112: ; 
	mov       al,1
	jmp       short @318
	?debug L 1029
?live16405@128: ; EBX = &$akmlfcia
@328:
	push      0
	push      1
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1031
	mov       eax,dword ptr [ebp-28]
	and       eax,33554432
	mov       dword ptr [$igmlfcia],eax
	?debug L 1032
?live16405@160: ; EBX = &$akmlfcia, EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1033
?live16405@176: ; EBX = &$akmlfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1035
?live16405@192: ; 
@329:
@318:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@315:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_mmxext$qv+0
	dd        @315+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_mmxext$qv	endp
@stk@cpu@cpu_has_mmxext$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	73
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch95
	dd	?patch96
	dd	?patch97
	df	@@stk@cpu@cpu_has_mmxext$qv
	dw	0
	dw	4140
	dw	0
	dw	154
	dw	0
	dw	0
	dw	0
	db	26
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	109
	db	109
	db	120
	db	101
	db	120
	db	116
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	155
	dw	0
	dw	0
	dw	0
	dw	?patch98
	dw	529
	dw	?patch99
	dd	?live16405@176-@@stk@cpu@cpu_has_mmxext$qv
	dd	?live16405@192-?live16405@176
	dw	1
?patch99	equ	1
?patch98	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	156
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	157
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	158
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	159
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$akmlfcia
	dw	0
	dw	4102
	dw	0
	dw	160
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	161
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$igmlfcia
	dw	0
	dw	117
	dw	0
	dw	162
	dw	0
	dw	0
	dw	0
?patch95	equ	@329-@@stk@cpu@cpu_has_mmxext$qv+72
?patch96	equ	0
?patch97	equ	@329-@@stk@cpu@cpu_has_mmxext$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$inmlfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$abnlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_amd64$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_amd64$qv	proc	near
?live16406@0:
	?debug L 1038
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @330
@331:
	mov       ebx,offset $abnlfcia
	?debug L 1044
?live16406@16: ; EBX = &$abnlfcia
	mov       eax,dword ptr [$inmlfcia]
	cmp       eax,-1
	je        short @335
	?debug L 1045
?live16406@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @333
	?debug L 1047
?live16406@48: ; EBX = &$abnlfcia
@334:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@335:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @334
	cmp       dword ptr [ebx],0
	jne       short @334
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @338
@337:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@338:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @341
	cmp       dword ptr [ebx],0
@341:
	je        short @339
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @342
	cmp       eax,dword ptr [ebp-20]
@342:
	setne     al
	and       eax,1
	jmp       short @340
@339:
	xor       eax,eax
@340:
	test      al,al
	jne       short @337
	?debug L 1050
	push      0
	push      -2147483647
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1052
	mov       eax,dword ptr [ebp-28]
	and       eax,536870912
	mov       dword ptr [$inmlfcia],eax
	?debug L 1053
?live16406@96: ; EBX = &$abnlfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1054
?live16406@112: ; EBX = &$abnlfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1056
?live16406@128: ; 
@343:
@333:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@330:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_amd64$qv+0
	dd        @330+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_amd64$qv	endp
@stk@cpu@cpu_has_amd64$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	72
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch100
	dd	?patch101
	dd	?patch102
	df	@@stk@cpu@cpu_has_amd64$qv
	dw	0
	dw	4142
	dw	0
	dw	163
	dw	0
	dw	0
	dw	0
	db	25
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	97
	db	109
	db	100
	db	54
	db	52
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	164
	dw	0
	dw	0
	dw	0
	dw	?patch103
	dw	529
	dw	?patch104
	dd	?live16406@112-@@stk@cpu@cpu_has_amd64$qv
	dd	?live16406@128-?live16406@112
	dw	1
?patch104	equ	1
?patch103	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	165
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	166
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	167
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	168
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$abnlfcia
	dw	0
	dw	4102
	dw	0
	dw	169
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	170
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$inmlfcia
	dw	0
	dw	117
	dw	0
	dw	171
	dw	0
	dw	0
	dw	0
?patch100	equ	@343-@@stk@cpu@cpu_has_amd64$qv+73
?patch101	equ	0
?patch102	equ	@343-@@stk@cpu@cpu_has_amd64$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ienlfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ainlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_ht$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_ht$qv	proc	near
?live16407@0:
	?debug L 1059
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @344
@345:
	mov       ebx,offset $ainlfcia
	?debug L 1065
?live16407@16: ; EBX = &$ainlfcia
	mov       eax,dword ptr [$ienlfcia]
	cmp       eax,-1
	je        short @349
	?debug L 1066
?live16407@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @347
	?debug L 1068
?live16407@48: ; EBX = &$ainlfcia
@348:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@349:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @348
	cmp       dword ptr [ebx],0
	jne       short @348
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @352
@351:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@352:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @355
	cmp       dword ptr [ebx],0
@355:
	je        short @353
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @356
	cmp       eax,dword ptr [ebp-20]
@356:
	setne     al
	and       eax,1
	jmp       short @354
@353:
	xor       eax,eax
@354:
	test      al,al
	jne       short @351
	?debug L 1071
	push      0
	push      1
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1073
	mov       eax,dword ptr [ebp-28]
	and       eax,268435456
	mov       dword ptr [$ienlfcia],eax
	?debug L 1074
?live16407@96: ; EBX = &$ainlfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1075
?live16407@112: ; EBX = &$ainlfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1077
?live16407@128: ; 
@357:
@347:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@344:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_ht$qv+0
	dd        @344+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_ht$qv	endp
@stk@cpu@cpu_has_ht$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	69
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch105
	dd	?patch106
	dd	?patch107
	df	@@stk@cpu@cpu_has_ht$qv
	dw	0
	dw	4144
	dw	0
	dw	172
	dw	0
	dw	0
	dw	0
	db	22
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	104
	db	116
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	173
	dw	0
	dw	0
	dw	0
	dw	?patch108
	dw	529
	dw	?patch109
	dd	?live16407@112-@@stk@cpu@cpu_has_ht$qv
	dd	?live16407@128-?live16407@112
	dw	1
?patch109	equ	1
?patch108	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	174
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	175
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	176
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	177
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ainlfcia
	dw	0
	dw	4102
	dw	0
	dw	178
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	179
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ienlfcia
	dw	0
	dw	117
	dw	0
	dw	180
	dw	0
	dw	0
	dw	0
?patch105	equ	@357-@@stk@cpu@cpu_has_ht$qv+72
?patch106	equ	0
?patch107	equ	@357-@@stk@cpu@cpu_has_ht$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ilnlfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$apnlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sse$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sse$qv	proc	near
?live16408@0:
	?debug L 1080
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @358
@359:
	mov       ebx,offset $apnlfcia
	mov       esi,offset $ilnlfcia
	?debug L 1086
?live16408@16: ; EBX = &$apnlfcia, ESI = &$ilnlfcia
	push      4
	push      esi
	call      _CG_D_EP
	mov       eax,dword ptr [esi]
	cmp       eax,-1
	jne       @361
	?debug L 1087
?live16408@32: ; EAX = @temp3, ESI = &$ilnlfcia
	jmp       short @363
	?debug L 1089
?live16408@48: ; EBX = &$apnlfcia, ESI = &$ilnlfcia
@362:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@363:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @362
	cmp       dword ptr [ebx],0
	jne       short @362
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],edx
	jmp       short @366
@365:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@366:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @369
	cmp       dword ptr [ebx],0
@369:
	je        short @367
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @370
	cmp       eax,dword ptr [ebp-20]
@370:
	setne     cl
	and       ecx,1
	jmp       short @368
@367:
	xor       ecx,ecx
@368:
	test      cl,cl
	jne       short @365
	?debug L 1092
	push      0
	push      1
	lea       eax,dword ptr [ebp-28]
	push      eax
	lea       edx,dword ptr [ebp-36]
	push      edx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1094
	test      byte ptr [ebp-34],16
	je        short @371
	?debug L 1095
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],42
	jmp       short @372
	?debug L 1097
@371:
	test      byte ptr [ebp-34],8
	je        short @373
	?debug L 1098
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],41
	jmp       short @372
	?debug L 1100
@373:
	test      byte ptr [ebp-35],2
	je        short @374
	?debug L 1101
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],31
	jmp       short @372
	?debug L 1103
@374:
	test      byte ptr [ebp-36],1
	je        short @375
	?debug L 1104
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],30
	jmp       short @372
	?debug L 1106
@375:
	test      byte ptr [ebp-25],4
	je        short @376
	?debug L 1107
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],20
	jmp       short @372
	?debug L 1109
@376:
	test      byte ptr [ebp-25],2
	je        short @377
	?debug L 1110
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],10
	jmp       short @372
	?debug L 1112
@377:
	push      4
	push      esi
	call      _CG_D_EP
	xor       ecx,ecx
	mov       dword ptr [esi],ecx
	?debug L 1113
@372:
	push      4
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi],0
	setne     al
	and       eax,1
	?debug L 1114
?live16408@304: ; EBX = &$apnlfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1115
?live16408@320: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	?debug L 1114
?live16408@336: ; EBX = &$apnlfcia, EAX = ret
	mov       dword ptr [ebx+4],0
	?debug L 1115
?live16408@352: ; EAX = ret
	mov       eax,edx
	?debug L 1116
?live16408@368: ; 
@378:
@361:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@358:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_sse$qv+0
	dd        @358+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_sse$qv	endp
@stk@cpu@cpu_has_sse$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	70
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch110
	dd	?patch111
	dd	?patch112
	df	@@stk@cpu@cpu_has_sse$qv
	dw	0
	dw	4146
	dw	0
	dw	181
	dw	0
	dw	0
	dw	0
	db	23
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	115
	db	115
	db	101
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	182
	dw	0
	dw	0
	dw	0
	dw	?patch113
	dw	529
	dw	?patch114
	dd	?live16408@304-@@stk@cpu@cpu_has_sse$qv
	dd	?live16408@368-?live16408@304
	dw	1
?patch114	equ	1
?patch113	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	183
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	184
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	185
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	186
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$apnlfcia
	dw	0
	dw	4102
	dw	0
	dw	187
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	188
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ilnlfcia
	dw	0
	dw	117
	dw	0
	dw	189
	dw	0
	dw	0
	dw	0
?patch110	equ	@378-@@stk@cpu@cpu_has_sse$qv+74
?patch111	equ	0
?patch112	equ	@378-@@stk@cpu@cpu_has_sse$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	5
	dw	65476
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$icolfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$agolfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sse4a$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sse4a$qv	proc	near
?live16409@0:
	?debug L 1119
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @379
@380:
	mov       ebx,offset $agolfcia
	?debug L 1125
?live16409@16: ; EBX = &$agolfcia
	mov       eax,dword ptr [$icolfcia]
	cmp       eax,-1
	je        short @384
	?debug L 1126
?live16409@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @382
	?debug L 1128
?live16409@48: ; EBX = &$agolfcia
@383:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@384:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @383
	cmp       dword ptr [ebx],0
	jne       short @383
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @387
@386:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@387:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @390
	cmp       dword ptr [ebx],0
@390:
	je        short @388
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @391
	cmp       eax,dword ptr [ebp-20]
@391:
	setne     al
	and       eax,1
	jmp       short @389
@388:
	xor       eax,eax
@389:
	test      al,al
	jne       short @386
	?debug L 1131
	push      0
	push      -2147483647
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1133
	mov       eax,dword ptr [ebp-36]
	and       eax,64
	mov       dword ptr [$icolfcia],eax
	?debug L 1134
?live16409@96: ; EBX = &$agolfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1135
?live16409@112: ; EBX = &$agolfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1137
?live16409@128: ; 
@392:
@382:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@379:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_sse4a$qv+0
	dd        @379+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_sse4a$qv	endp
@stk@cpu@cpu_has_sse4a$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	72
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch115
	dd	?patch116
	dd	?patch117
	df	@@stk@cpu@cpu_has_sse4a$qv
	dw	0
	dw	4148
	dw	0
	dw	190
	dw	0
	dw	0
	dw	0
	db	25
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	115
	db	115
	db	101
	db	52
	db	97
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	191
	dw	0
	dw	0
	dw	0
	dw	?patch118
	dw	529
	dw	?patch119
	dd	?live16409@112-@@stk@cpu@cpu_has_sse4a$qv
	dd	?live16409@128-?live16409@112
	dw	1
?patch119	equ	1
?patch118	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	192
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	193
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	194
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	195
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$agolfcia
	dw	0
	dw	4102
	dw	0
	dw	196
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	197
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$icolfcia
	dw	0
	dw	117
	dw	0
	dw	198
	dw	0
	dw	0
	dw	0
?patch115	equ	@392-@@stk@cpu@cpu_has_sse4a$qv+75
?patch116	equ	0
?patch117	equ	@392-@@stk@cpu@cpu_has_sse4a$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ijolfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$anolfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx$qv	proc	near
?live16410@0:
	?debug L 1140
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @393
@394:
	mov       ebx,offset $anolfcia
	?debug L 1146
?live16410@16: ; EBX = &$anolfcia
	mov       eax,dword ptr [$ijolfcia]
	cmp       eax,-1
	jne       @396
	?debug L 1147
?live16410@32: ; EAX = @temp3
	jmp       short @398
	?debug L 1149
?live16410@48: ; EBX = &$anolfcia
@397:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@398:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @397
	cmp       dword ptr [ebx],0
	jne       short @397
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],edx
	jmp       short @401
@400:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@401:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @404
	cmp       dword ptr [ebx],0
@404:
	je        short @402
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @405
	cmp       eax,dword ptr [ebp-20]
@405:
	setne     cl
	and       ecx,1
	jmp       short @403
@402:
	xor       ecx,ecx
@403:
	test      cl,cl
	jne       short @400
	?debug L 1152
	push      0
	push      1
	lea       eax,dword ptr [ebp-28]
	push      eax
	lea       edx,dword ptr [ebp-36]
	push      edx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1154
	test      byte ptr [ebp-33],16
	je        short @406
	?debug L 1155
	push      0
	push      7
	lea       ecx,dword ptr [ebp-28]
	push      ecx
	lea       eax,dword ptr [ebp-36]
	push      eax
	lea       edx,dword ptr [ebp-44]
	push      edx
	lea       ecx,dword ptr [ebp-52]
	push      ecx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1156
	test      byte ptr [ebp-44],32
	je        short @407
	?debug L 1157
	mov       dword ptr [$ijolfcia],2
	jmp       short @408
	?debug L 1159
@407:
	mov       dword ptr [$ijolfcia],1
	?debug L 1160
	jmp       short @408
	?debug L 1162
@406:
	xor       eax,eax
	mov       dword ptr [$ijolfcia],eax
	?debug L 1164
@408:
	cmp       dword ptr [$ijolfcia],0
	setne     al
	and       eax,1
	?debug L 1165
?live16410@208: ; EBX = &$anolfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1166
?live16410@224: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	?debug L 1165
?live16410@240: ; EBX = &$anolfcia, EAX = ret
	mov       dword ptr [ebx+4],0
	?debug L 1166
?live16410@256: ; EAX = ret
	mov       eax,edx
	?debug L 1167
?live16410@272: ; 
@409:
@396:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@393:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx$qv+0
	dd        @393+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_avx$qv	endp
@stk@cpu@cpu_has_avx$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	70
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch120
	dd	?patch121
	dd	?patch122
	df	@@stk@cpu@cpu_has_avx$qv
	dw	0
	dw	4150
	dw	0
	dw	199
	dw	0
	dw	0
	dw	0
	db	23
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	97
	db	118
	db	120
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	200
	dw	0
	dw	0
	dw	0
	dw	?patch123
	dw	529
	dw	?patch124
	dd	?live16410@208-@@stk@cpu@cpu_has_avx$qv
	dd	?live16410@272-?live16410@208
	dw	1
?patch124	equ	1
?patch123	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	201
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	202
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	203
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	204
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$anolfcia
	dw	0
	dw	4102
	dw	0
	dw	205
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	206
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ijolfcia
	dw	0
	dw	117
	dw	0
	dw	207
	dw	0
	dw	0
	dw	0
?patch120	equ	@409-@@stk@cpu@cpu_has_avx$qv+74
?patch121	equ	0
?patch122	equ	@409-@@stk@cpu@cpu_has_avx$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iaplfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aeplfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_popcnt$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_popcnt$qv	proc	near
?live16411@0:
	?debug L 1170
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @410
@411:
	mov       ebx,offset $aeplfcia
	?debug L 1176
?live16411@16: ; EBX = &$aeplfcia
	mov       eax,dword ptr [$iaplfcia]
	cmp       eax,-1
	je        short @415
	?debug L 1177
?live16411@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @413
	?debug L 1179
?live16411@48: ; EBX = &$aeplfcia
@414:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@415:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @414
	cmp       dword ptr [ebx],0
	jne       short @414
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @418
@417:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@418:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @421
	cmp       dword ptr [ebx],0
@421:
	je        short @419
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @422
	cmp       eax,dword ptr [ebp-20]
@422:
	setne     al
	and       eax,1
	jmp       short @420
@419:
	xor       eax,eax
@420:
	test      al,al
	jne       short @417
	?debug L 1182
	push      0
	push      1
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1184
	mov       eax,dword ptr [ebp-36]
	and       eax,8388608
	mov       dword ptr [$iaplfcia],eax
	?debug L 1185
?live16411@96: ; EBX = &$aeplfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1186
?live16411@112: ; EBX = &$aeplfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1188
?live16411@128: ; 
@423:
@413:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@410:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_popcnt$qv+0
	dd        @410+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_popcnt$qv	endp
@stk@cpu@cpu_has_popcnt$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	73
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch125
	dd	?patch126
	dd	?patch127
	df	@@stk@cpu@cpu_has_popcnt$qv
	dw	0
	dw	4152
	dw	0
	dw	208
	dw	0
	dw	0
	dw	0
	db	26
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	112
	db	111
	db	112
	db	99
	db	110
	db	116
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	209
	dw	0
	dw	0
	dw	0
	dw	?patch128
	dw	529
	dw	?patch129
	dd	?live16411@112-@@stk@cpu@cpu_has_popcnt$qv
	dd	?live16411@128-?live16411@112
	dw	1
?patch129	equ	1
?patch128	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	210
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	211
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	212
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	213
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aeplfcia
	dw	0
	dw	4102
	dw	0
	dw	214
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	215
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iaplfcia
	dw	0
	dw	117
	dw	0
	dw	216
	dw	0
	dw	0
	dw	0
?patch125	equ	@423-@@stk@cpu@cpu_has_popcnt$qv+72
?patch126	equ	0
?patch127	equ	@423-@@stk@cpu@cpu_has_popcnt$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ihplfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$alplfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_f16c$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_f16c$qv	proc	near
?live16412@0:
	?debug L 1191
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @424
@425:
	mov       ebx,offset $alplfcia
	?debug L 1197
?live16412@16: ; EBX = &$alplfcia
	mov       eax,dword ptr [$ihplfcia]
	cmp       eax,-1
	je        short @429
	?debug L 1198
?live16412@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @427
	?debug L 1200
?live16412@48: ; EBX = &$alplfcia
@428:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@429:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @428
	cmp       dword ptr [ebx],0
	jne       short @428
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @432
@431:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@432:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @435
	cmp       dword ptr [ebx],0
@435:
	je        short @433
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @436
	cmp       eax,dword ptr [ebp-20]
@436:
	setne     al
	and       eax,1
	jmp       short @434
@433:
	xor       eax,eax
@434:
	test      al,al
	jne       short @431
	?debug L 1203
	push      0
	push      1
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1205
	mov       eax,dword ptr [ebp-36]
	and       eax,536870912
	mov       dword ptr [$ihplfcia],eax
	?debug L 1206
?live16412@96: ; EBX = &$alplfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1207
?live16412@112: ; EBX = &$alplfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1209
?live16412@128: ; 
@437:
@427:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@424:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_f16c$qv+0
	dd        @424+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_f16c$qv	endp
@stk@cpu@cpu_has_f16c$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	71
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch130
	dd	?patch131
	dd	?patch132
	df	@@stk@cpu@cpu_has_f16c$qv
	dw	0
	dw	4154
	dw	0
	dw	217
	dw	0
	dw	0
	dw	0
	db	24
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	102
	db	49
	db	54
	db	99
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	218
	dw	0
	dw	0
	dw	0
	dw	?patch133
	dw	529
	dw	?patch134
	dd	?live16412@112-@@stk@cpu@cpu_has_f16c$qv
	dd	?live16412@128-?live16412@112
	dw	1
?patch134	equ	1
?patch133	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	219
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	220
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	221
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	222
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$alplfcia
	dw	0
	dw	4102
	dw	0
	dw	223
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	224
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ihplfcia
	dw	0
	dw	117
	dw	0
	dw	225
	dw	0
	dw	0
	dw	0
?patch130	equ	@437-@@stk@cpu@cpu_has_f16c$qv+72
?patch131	equ	0
?patch132	equ	@437-@@stk@cpu@cpu_has_f16c$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ioplfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$acamfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_cmpxchg$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_cmpxchg$qv	proc	near
?live16413@0:
	?debug L 1212
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @438
@439:
	mov       ebx,offset $acamfcia
	?debug L 1218
?live16413@16: ; EBX = &$acamfcia
	mov       eax,dword ptr [$ioplfcia]
	cmp       eax,-1
	jne       @441
	?debug L 1219
?live16413@32: ; EAX = @temp2
	jmp       short @443
	?debug L 1221
?live16413@48: ; EBX = &$acamfcia
@442:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@443:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @442
	cmp       dword ptr [ebx],0
	jne       short @442
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],edx
	jmp       short @446
@445:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@446:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @449
	cmp       dword ptr [ebx],0
@449:
	je        short @447
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @450
	cmp       eax,dword ptr [ebp-20]
@450:
	setne     cl
	and       ecx,1
	jmp       short @448
@447:
	xor       ecx,ecx
@448:
	test      cl,cl
	jne       short @445
	?debug L 1224
	push      0
	push      1
	lea       eax,dword ptr [ebp-28]
	push      eax
	lea       edx,dword ptr [ebp-36]
	push      edx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1226
	test      byte ptr [ebp-35],32
	je        short @451
	?debug L 1227
	mov       dword ptr [$ioplfcia],16
	?debug L 1228
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1229
?live16413@128: ; 
	mov       eax,16
	jmp       @441
	?debug L 1231
?live16413@144: ; EBX = &$acamfcia
@451:
	test      byte ptr [ebp-27],1
	je        short @452
	?debug L 1232
	mov       dword ptr [$ioplfcia],8
	?debug L 1233
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1234
?live16413@192: ; 
	mov       eax,8
	jmp       short @441
	?debug L 1238
?live16413@208: ; EBX = &$acamfcia
@452:
	push      0
	push      -2147483647
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1240
	test      byte ptr [ebp-27],1
	je        short @453
	?debug L 1241
	mov       dword ptr [$ioplfcia],8
	?debug L 1242
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1243
?live16413@272: ; 
	mov       eax,8
	jmp       short @441
	?debug L 1245
?live16413@288: ; EBX = &$acamfcia
@453:
	mov       dword ptr [$ioplfcia],1
	?debug L 1246
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1247
?live16413@320: ; 
	mov       eax,1
	?debug L 1246
?live16413@336: ; EBX = &$acamfcia
	mov       dword ptr [ebx+4],0
	?debug L 1248
?live16413@352: ; 
@454:
@441:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@438:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_cmpxchg$qv+0
	dd        @438+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_cmpxchg$qv	endp
@stk@cpu@cpu_has_cmpxchg$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	74
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch135
	dd	?patch136
	dd	?patch137
	df	@@stk@cpu@cpu_has_cmpxchg$qv
	dw	0
	dw	4156
	dw	0
	dw	226
	dw	0
	dw	0
	dw	0
	db	27
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	99
	db	109
	db	112
	db	120
	db	99
	db	104
	db	103
	db	36
	db	113
	db	118
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	227
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	228
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	229
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	230
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$acamfcia
	dw	0
	dw	4102
	dw	0
	dw	231
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	232
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ioplfcia
	dw	0
	dw	117
	dw	0
	dw	233
	dw	0
	dw	0
	dw	0
?patch135	equ	@454-@@stk@cpu@cpu_has_cmpxchg$qv+75
?patch136	equ	0
?patch137	equ	@454-@@stk@cpu@cpu_has_cmpxchg$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ifamfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ajamfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_vmx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_vmx$qv	proc	near
?live16414@0:
	?debug L 1251
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @455
@456:
	mov       ebx,offset $ajamfcia
	?debug L 1257
?live16414@16: ; EBX = &$ajamfcia
	mov       eax,dword ptr [$ifamfcia]
	cmp       eax,-1
	je        short @460
	?debug L 1258
?live16414@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @458
	?debug L 1260
?live16414@48: ; EBX = &$ajamfcia
@459:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@460:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @459
	cmp       dword ptr [ebx],0
	jne       short @459
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @463
@462:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@463:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @466
	cmp       dword ptr [ebx],0
@466:
	je        short @464
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @467
	cmp       eax,dword ptr [ebp-20]
@467:
	setne     al
	and       eax,1
	jmp       short @465
@464:
	xor       eax,eax
@465:
	test      al,al
	jne       short @462
	?debug L 1263
	push      0
	push      1
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1265
	mov       eax,dword ptr [ebp-36]
	and       eax,32
	mov       dword ptr [$ifamfcia],eax
	?debug L 1266
?live16414@96: ; EBX = &$ajamfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1267
?live16414@112: ; EBX = &$ajamfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1269
?live16414@128: ; 
@468:
@458:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@455:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_vmx$qv+0
	dd        @455+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_vmx$qv	endp
@stk@cpu@cpu_has_vmx$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	70
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch138
	dd	?patch139
	dd	?patch140
	df	@@stk@cpu@cpu_has_vmx$qv
	dw	0
	dw	4158
	dw	0
	dw	234
	dw	0
	dw	0
	dw	0
	db	23
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	118
	db	109
	db	120
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	235
	dw	0
	dw	0
	dw	0
	dw	?patch141
	dw	529
	dw	?patch142
	dd	?live16414@112-@@stk@cpu@cpu_has_vmx$qv
	dd	?live16414@128-?live16414@112
	dw	1
?patch142	equ	1
?patch141	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	236
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	237
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	238
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	239
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ajamfcia
	dw	0
	dw	4102
	dw	0
	dw	240
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	241
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ifamfcia
	dw	0
	dw	117
	dw	0
	dw	242
	dw	0
	dw	0
	dw	0
?patch138	equ	@468-@@stk@cpu@cpu_has_vmx$qv+74
?patch139	equ	0
?patch140	equ	@468-@@stk@cpu@cpu_has_vmx$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$imamfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aabmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_smx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_smx$qv	proc	near
?live16415@0:
	?debug L 1272
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @469
@470:
	mov       ebx,offset $aabmfcia
	?debug L 1278
?live16415@16: ; EBX = &$aabmfcia
	mov       eax,dword ptr [$imamfcia]
	cmp       eax,-1
	je        short @474
	?debug L 1279
?live16415@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @472
	?debug L 1281
?live16415@48: ; EBX = &$aabmfcia
@473:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@474:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @473
	cmp       dword ptr [ebx],0
	jne       short @473
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @477
@476:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@477:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @480
	cmp       dword ptr [ebx],0
@480:
	je        short @478
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @481
	cmp       eax,dword ptr [ebp-20]
@481:
	setne     al
	and       eax,1
	jmp       short @479
@478:
	xor       eax,eax
@479:
	test      al,al
	jne       short @476
	?debug L 1284
	push      0
	push      1
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1286
	mov       eax,dword ptr [ebp-36]
	and       eax,64
	mov       dword ptr [$imamfcia],eax
	?debug L 1287
?live16415@96: ; EBX = &$aabmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1288
?live16415@112: ; EBX = &$aabmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1290
?live16415@128: ; 
@482:
@472:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@469:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_smx$qv+0
	dd        @469+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_smx$qv	endp
@stk@cpu@cpu_has_smx$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	70
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch143
	dd	?patch144
	dd	?patch145
	df	@@stk@cpu@cpu_has_smx$qv
	dw	0
	dw	4160
	dw	0
	dw	243
	dw	0
	dw	0
	dw	0
	db	23
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	115
	db	109
	db	120
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	244
	dw	0
	dw	0
	dw	0
	dw	?patch146
	dw	529
	dw	?patch147
	dd	?live16415@112-@@stk@cpu@cpu_has_smx$qv
	dd	?live16415@128-?live16415@112
	dw	1
?patch147	equ	1
?patch146	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	245
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	246
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	247
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	248
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aabmfcia
	dw	0
	dw	4102
	dw	0
	dw	249
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	250
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$imamfcia
	dw	0
	dw	117
	dw	0
	dw	251
	dw	0
	dw	0
	dw	0
?patch143	equ	@482-@@stk@cpu@cpu_has_smx$qv+74
?patch144	equ	0
?patch145	equ	@482-@@stk@cpu@cpu_has_smx$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$idbmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ahbmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_cmov$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_cmov$qv	proc	near
?live16416@0:
	?debug L 1293
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @483
@484:
	mov       ebx,offset $ahbmfcia
	?debug L 1299
?live16416@16: ; EBX = &$ahbmfcia
	mov       eax,dword ptr [$idbmfcia]
	cmp       eax,-1
	je        short @488
	?debug L 1300
?live16416@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @486
	?debug L 1302
?live16416@48: ; EBX = &$ahbmfcia
@487:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@488:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @487
	cmp       dword ptr [ebx],0
	jne       short @487
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @491
@490:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@491:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @494
	cmp       dword ptr [ebx],0
@494:
	je        short @492
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @495
	cmp       eax,dword ptr [ebp-20]
@495:
	setne     al
	and       eax,1
	jmp       short @493
@492:
	xor       eax,eax
@493:
	test      al,al
	jne       short @490
	?debug L 1305
	push      0
	push      1
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1307
	mov       eax,dword ptr [ebp-28]
	and       eax,32768
	mov       dword ptr [$idbmfcia],eax
	?debug L 1308
?live16416@96: ; EBX = &$ahbmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1309
?live16416@112: ; EBX = &$ahbmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1311
?live16416@128: ; 
@496:
@486:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@483:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_cmov$qv+0
	dd        @483+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_cmov$qv	endp
@stk@cpu@cpu_has_cmov$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	71
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch148
	dd	?patch149
	dd	?patch150
	df	@@stk@cpu@cpu_has_cmov$qv
	dw	0
	dw	4162
	dw	0
	dw	252
	dw	0
	dw	0
	dw	0
	db	24
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	99
	db	109
	db	111
	db	118
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	253
	dw	0
	dw	0
	dw	0
	dw	?patch151
	dw	529
	dw	?patch152
	dd	?live16416@112-@@stk@cpu@cpu_has_cmov$qv
	dd	?live16416@128-?live16416@112
	dw	1
?patch152	equ	1
?patch151	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	254
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	255
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	256
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	257
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ahbmfcia
	dw	0
	dw	4102
	dw	0
	dw	258
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	259
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$idbmfcia
	dw	0
	dw	117
	dw	0
	dw	260
	dw	0
	dw	0
	dw	0
?patch148	equ	@496-@@stk@cpu@cpu_has_cmov$qv+72
?patch149	equ	0
?patch150	equ	@496-@@stk@cpu@cpu_has_cmov$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ikbmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aobmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_movbe$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_movbe$qv	proc	near
?live16417@0:
	?debug L 1314
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @497
@498:
	mov       ebx,offset $aobmfcia
	?debug L 1320
?live16417@16: ; EBX = &$aobmfcia
	mov       eax,dword ptr [$ikbmfcia]
	cmp       eax,-1
	je        short @502
	?debug L 1321
?live16417@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @500
	?debug L 1323
?live16417@48: ; EBX = &$aobmfcia
@501:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@502:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @501
	cmp       dword ptr [ebx],0
	jne       short @501
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @505
@504:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@505:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @508
	cmp       dword ptr [ebx],0
@508:
	je        short @506
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @509
	cmp       eax,dword ptr [ebp-20]
@509:
	setne     al
	and       eax,1
	jmp       short @507
@506:
	xor       eax,eax
@507:
	test      al,al
	jne       short @504
	?debug L 1326
	push      0
	push      1
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1328
	mov       eax,dword ptr [ebp-36]
	and       eax,4194304
	mov       dword ptr [$ikbmfcia],eax
	?debug L 1329
?live16417@96: ; EBX = &$aobmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1330
?live16417@112: ; EBX = &$aobmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1332
?live16417@128: ; 
@510:
@500:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@497:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_movbe$qv+0
	dd        @497+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_movbe$qv	endp
@stk@cpu@cpu_has_movbe$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	72
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch153
	dd	?patch154
	dd	?patch155
	df	@@stk@cpu@cpu_has_movbe$qv
	dw	0
	dw	4164
	dw	0
	dw	261
	dw	0
	dw	0
	dw	0
	db	25
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	109
	db	111
	db	118
	db	98
	db	101
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	262
	dw	0
	dw	0
	dw	0
	dw	?patch156
	dw	529
	dw	?patch157
	dd	?live16417@112-@@stk@cpu@cpu_has_movbe$qv
	dd	?live16417@128-?live16417@112
	dw	1
?patch157	equ	1
?patch156	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	263
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	264
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	265
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	266
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aobmfcia
	dw	0
	dw	4102
	dw	0
	dw	267
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	268
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ikbmfcia
	dw	0
	dw	117
	dw	0
	dw	269
	dw	0
	dw	0
	dw	0
?patch153	equ	@510-@@stk@cpu@cpu_has_movbe$qv+72
?patch154	equ	0
?patch155	equ	@510-@@stk@cpu@cpu_has_movbe$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ibcmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$afcmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_bmi$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_bmi$qv	proc	near
?live16418@0:
	?debug L 1335
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @511
@512:
	mov       ebx,offset $afcmfcia
	?debug L 1341
?live16418@16: ; EBX = &$afcmfcia
	mov       eax,dword ptr [$ibcmfcia]
	cmp       eax,-1
	jne       @514
	?debug L 1342
?live16418@32: ; EAX = @temp3
	jmp       short @516
	?debug L 1344
?live16418@48: ; EBX = &$afcmfcia
@515:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@516:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @515
	cmp       dword ptr [ebx],0
	jne       short @515
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],edx
	jmp       short @519
@518:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@519:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @522
	cmp       dword ptr [ebx],0
@522:
	je        short @520
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @523
	cmp       eax,dword ptr [ebp-20]
@523:
	setne     cl
	and       ecx,1
	jmp       short @521
@520:
	xor       ecx,ecx
@521:
	test      cl,cl
	jne       short @518
	?debug L 1347
	push      0
	push      7
	lea       eax,dword ptr [ebp-28]
	push      eax
	lea       edx,dword ptr [ebp-36]
	push      edx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1349
	test      byte ptr [ebp-43],1
	je        short @524
	?debug L 1350
	mov       dword ptr [$ibcmfcia],2
	jmp       short @525
	?debug L 1352
@524:
	test      byte ptr [ebp-44],8
	je        short @526
	?debug L 1353
	mov       dword ptr [$ibcmfcia],1
	jmp       short @525
	?debug L 1355
@526:
	xor       ecx,ecx
	mov       dword ptr [$ibcmfcia],ecx
	?debug L 1356
@525:
	cmp       dword ptr [$ibcmfcia],0
	setne     al
	and       eax,1
	?debug L 1357
?live16418@176: ; EBX = &$afcmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1358
?live16418@192: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	?debug L 1357
?live16418@208: ; EBX = &$afcmfcia, EAX = ret
	mov       dword ptr [ebx+4],0
	?debug L 1358
?live16418@224: ; EAX = ret
	mov       eax,edx
	?debug L 1359
?live16418@240: ; 
@527:
@514:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@511:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_bmi$qv+0
	dd        @511+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_bmi$qv	endp
@stk@cpu@cpu_has_bmi$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	70
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch158
	dd	?patch159
	dd	?patch160
	df	@@stk@cpu@cpu_has_bmi$qv
	dw	0
	dw	4166
	dw	0
	dw	270
	dw	0
	dw	0
	dw	0
	db	23
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	98
	db	109
	db	105
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	271
	dw	0
	dw	0
	dw	0
	dw	?patch161
	dw	529
	dw	?patch162
	dd	?live16418@176-@@stk@cpu@cpu_has_bmi$qv
	dd	?live16418@240-?live16418@176
	dw	1
?patch162	equ	1
?patch161	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	272
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	273
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	274
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	275
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$afcmfcia
	dw	0
	dw	4102
	dw	0
	dw	276
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	277
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ibcmfcia
	dw	0
	dw	117
	dw	0
	dw	278
	dw	0
	dw	0
	dw	0
?patch158	equ	@527-@@stk@cpu@cpu_has_bmi$qv+73
?patch159	equ	0
?patch160	equ	@527-@@stk@cpu@cpu_has_bmi$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iicmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$amcmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_erms$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_erms$qv	proc	near
?live16419@0:
	?debug L 1362
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @528
@529:
	mov       ebx,offset $amcmfcia
	?debug L 1368
?live16419@16: ; EBX = &$amcmfcia
	mov       eax,dword ptr [$iicmfcia]
	cmp       eax,-1
	je        short @533
	?debug L 1369
?live16419@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @531
	?debug L 1371
?live16419@48: ; EBX = &$amcmfcia
@532:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@533:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @532
	cmp       dword ptr [ebx],0
	jne       short @532
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @536
@535:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@536:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @539
	cmp       dword ptr [ebx],0
@539:
	je        short @537
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @540
	cmp       eax,dword ptr [ebp-20]
@540:
	setne     al
	and       eax,1
	jmp       short @538
@537:
	xor       eax,eax
@538:
	test      al,al
	jne       short @535
	?debug L 1374
	push      0
	push      7
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1376
	mov       eax,dword ptr [ebp-44]
	and       eax,512
	mov       dword ptr [$iicmfcia],eax
	?debug L 1377
?live16419@96: ; EBX = &$amcmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1378
?live16419@112: ; EBX = &$amcmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1380
?live16419@128: ; 
@541:
@531:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@528:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_erms$qv+0
	dd        @528+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_erms$qv	endp
@stk@cpu@cpu_has_erms$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	71
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch163
	dd	?patch164
	dd	?patch165
	df	@@stk@cpu@cpu_has_erms$qv
	dw	0
	dw	4168
	dw	0
	dw	279
	dw	0
	dw	0
	dw	0
	db	24
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	101
	db	114
	db	109
	db	115
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	280
	dw	0
	dw	0
	dw	0
	dw	?patch166
	dw	529
	dw	?patch167
	dd	?live16419@112-@@stk@cpu@cpu_has_erms$qv
	dd	?live16419@128-?live16419@112
	dw	1
?patch167	equ	1
?patch166	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	281
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	282
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	283
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	284
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$amcmfcia
	dw	0
	dw	4102
	dw	0
	dw	285
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	286
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iicmfcia
	dw	0
	dw	117
	dw	0
	dw	287
	dw	0
	dw	0
	dw	0
?patch163	equ	@541-@@stk@cpu@cpu_has_erms$qv+72
?patch164	equ	0
?patch165	equ	@541-@@stk@cpu@cpu_has_erms$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ipcmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$addmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_3dnow$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_3dnow$qv	proc	near
?live16420@0:
	?debug L 1383
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @542
@543:
	mov       ebx,offset $addmfcia
	?debug L 1389
?live16420@16: ; EBX = &$addmfcia
	mov       eax,dword ptr [$ipcmfcia]
	cmp       eax,-1
	jne       @545
	?debug L 1390
?live16420@32: ; EAX = @temp3
	jmp       short @547
	?debug L 1392
?live16420@48: ; EBX = &$addmfcia
@546:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@547:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @546
	cmp       dword ptr [ebx],0
	jne       short @546
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],edx
	jmp       short @550
@549:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@550:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @553
	cmp       dword ptr [ebx],0
@553:
	je        short @551
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @554
	cmp       eax,dword ptr [ebp-20]
@554:
	setne     cl
	and       ecx,1
	jmp       short @552
@551:
	xor       ecx,ecx
@552:
	test      cl,cl
	jne       short @549
	?debug L 1395
	push      0
	push      -2147483647
	lea       eax,dword ptr [ebp-28]
	push      eax
	lea       edx,dword ptr [ebp-36]
	push      edx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1397
	test      byte ptr [ebp-25],64
	je        short @555
	?debug L 1398
	mov       dword ptr [$ipcmfcia],2
	jmp       short @556
	?debug L 1400
@555:
	test      byte ptr [ebp-25],-128
	je        short @557
	?debug L 1401
	mov       dword ptr [$ipcmfcia],1
	jmp       short @556
	?debug L 1403
@557:
	xor       ecx,ecx
	mov       dword ptr [$ipcmfcia],ecx
	?debug L 1404
@556:
	cmp       dword ptr [$ipcmfcia],0
	setne     al
	and       eax,1
	?debug L 1405
?live16420@176: ; EBX = &$addmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1406
?live16420@192: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	?debug L 1405
?live16420@208: ; EBX = &$addmfcia, EAX = ret
	mov       dword ptr [ebx+4],0
	?debug L 1406
?live16420@224: ; EAX = ret
	mov       eax,edx
	?debug L 1407
?live16420@240: ; 
@558:
@545:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@542:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_3dnow$qv+0
	dd        @542+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_3dnow$qv	endp
@stk@cpu@cpu_has_3dnow$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	72
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch168
	dd	?patch169
	dd	?patch170
	df	@@stk@cpu@cpu_has_3dnow$qv
	dw	0
	dw	4170
	dw	0
	dw	288
	dw	0
	dw	0
	dw	0
	db	25
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	51
	db	100
	db	110
	db	111
	db	119
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	289
	dw	0
	dw	0
	dw	0
	dw	?patch171
	dw	529
	dw	?patch172
	dd	?live16420@176-@@stk@cpu@cpu_has_3dnow$qv
	dd	?live16420@240-?live16420@176
	dw	1
?patch172	equ	1
?patch171	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	290
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	291
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	292
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	293
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$addmfcia
	dw	0
	dw	4102
	dw	0
	dw	294
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	295
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ipcmfcia
	dw	0
	dw	117
	dw	0
	dw	296
	dw	0
	dw	0
	dw	0
?patch168	equ	@558-@@stk@cpu@cpu_has_3dnow$qv+74
?patch169	equ	0
?patch170	equ	@558-@@stk@cpu@cpu_has_3dnow$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$igdmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$akdmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_3dnowprefetch$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_3dnowprefetch$qv	proc	near
?live16421@0:
	?debug L 1410
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @559
@560:
	mov       ebx,offset $akdmfcia
	?debug L 1416
?live16421@16: ; EBX = &$akdmfcia
	mov       eax,dword ptr [$igdmfcia]
	cmp       eax,-1
	je        short @564
	?debug L 1417
?live16421@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @562
	?debug L 1419
?live16421@48: ; EBX = &$akdmfcia
@563:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@564:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @563
	cmp       dword ptr [ebx],0
	jne       short @563
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @567
@566:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@567:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @570
	cmp       dword ptr [ebx],0
@570:
	je        short @568
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @571
	cmp       eax,dword ptr [ebp-20]
@571:
	setne     al
	and       eax,1
	jmp       short @569
@568:
	xor       eax,eax
@569:
	test      al,al
	jne       short @566
	?debug L 1422
	push      0
	push      -2147483647
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1424
	mov       eax,dword ptr [ebp-36]
	and       eax,256
	mov       dword ptr [$igdmfcia],eax
	?debug L 1425
?live16421@96: ; EBX = &$akdmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1426
?live16421@112: ; EBX = &$akdmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1428
?live16421@128: ; 
@572:
@562:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@559:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_3dnowprefetch$qv+0
	dd        @559+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_3dnowprefetch$qv	endp
@stk@cpu@cpu_has_3dnowprefetch$qv	ends
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
	dd	?patch173
	dd	?patch174
	dd	?patch175
	df	@@stk@cpu@cpu_has_3dnowprefetch$qv
	dw	0
	dw	4172
	dw	0
	dw	297
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
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	51
	db	100
	db	110
	db	111
	db	119
	db	112
	db	114
	db	101
	db	102
	db	101
	db	116
	db	99
	db	104
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	298
	dw	0
	dw	0
	dw	0
	dw	?patch176
	dw	529
	dw	?patch177
	dd	?live16421@112-@@stk@cpu@cpu_has_3dnowprefetch$qv
	dd	?live16421@128-?live16421@112
	dw	1
?patch177	equ	1
?patch176	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	299
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	300
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	301
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	302
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$akdmfcia
	dw	0
	dw	4102
	dw	0
	dw	303
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	304
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$igdmfcia
	dw	0
	dw	117
	dw	0
	dw	305
	dw	0
	dw	0
	dw	0
?patch173	equ	@572-@@stk@cpu@cpu_has_3dnowprefetch$qv+73
?patch174	equ	0
?patch175	equ	@572-@@stk@cpu@cpu_has_3dnowprefetch$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$indmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$abemfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_perftsc$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_perftsc$qv	proc	near
?live16422@0:
	?debug L 1431
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @573
@574:
	mov       ebx,offset $abemfcia
	?debug L 1437
?live16422@16: ; EBX = &$abemfcia
	mov       eax,dword ptr [$indmfcia]
	cmp       eax,-1
	je        short @578
	?debug L 1438
?live16422@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @576
	?debug L 1440
?live16422@48: ; EBX = &$abemfcia
@577:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@578:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @577
	cmp       dword ptr [ebx],0
	jne       short @577
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @581
@580:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@581:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @584
	cmp       dword ptr [ebx],0
@584:
	je        short @582
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @585
	cmp       eax,dword ptr [ebp-20]
@585:
	setne     al
	and       eax,1
	jmp       short @583
@582:
	xor       eax,eax
@583:
	test      al,al
	jne       short @580
	?debug L 1443
	push      0
	push      -2147483647
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1445
	mov       eax,dword ptr [ebp-28]
	and       eax,134217728
	mov       dword ptr [$indmfcia],eax
	?debug L 1446
?live16422@96: ; EBX = &$abemfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1447
?live16422@112: ; EBX = &$abemfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1449
?live16422@128: ; 
@586:
@576:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@573:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_perftsc$qv+0
	dd        @573+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_perftsc$qv	endp
@stk@cpu@cpu_has_perftsc$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	74
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch178
	dd	?patch179
	dd	?patch180
	df	@@stk@cpu@cpu_has_perftsc$qv
	dw	0
	dw	4174
	dw	0
	dw	306
	dw	0
	dw	0
	dw	0
	db	27
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	112
	db	101
	db	114
	db	102
	db	116
	db	115
	db	99
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	307
	dw	0
	dw	0
	dw	0
	dw	?patch181
	dw	529
	dw	?patch182
	dd	?live16422@112-@@stk@cpu@cpu_has_perftsc$qv
	dd	?live16422@128-?live16422@112
	dw	1
?patch182	equ	1
?patch181	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	308
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	309
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	310
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	311
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$abemfcia
	dw	0
	dw	4102
	dw	0
	dw	312
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	313
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$indmfcia
	dw	0
	dw	117
	dw	0
	dw	314
	dw	0
	dw	0
	dw	0
?patch178	equ	@586-@@stk@cpu@cpu_has_perftsc$qv+73
?patch179	equ	0
?patch180	equ	@586-@@stk@cpu@cpu_has_perftsc$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ieemfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aiemfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sha$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sha$qv	proc	near
?live16423@0:
	?debug L 1452
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @587
@588:
	mov       ebx,offset $aiemfcia
	?debug L 1458
?live16423@16: ; EBX = &$aiemfcia
	mov       eax,dword ptr [$ieemfcia]
	cmp       eax,-1
	je        short @592
	?debug L 1459
?live16423@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @590
	?debug L 1461
?live16423@48: ; EBX = &$aiemfcia
@591:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@592:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @591
	cmp       dword ptr [ebx],0
	jne       short @591
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @595
@594:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@595:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @598
	cmp       dword ptr [ebx],0
@598:
	je        short @596
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @599
	cmp       eax,dword ptr [ebp-20]
@599:
	setne     al
	and       eax,1
	jmp       short @597
@596:
	xor       eax,eax
@597:
	test      al,al
	jne       short @594
	?debug L 1464
	push      0
	push      7
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1466
	mov       eax,dword ptr [ebp-44]
	and       eax,536870912
	mov       dword ptr [$ieemfcia],eax
	?debug L 1467
?live16423@96: ; EBX = &$aiemfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1468
?live16423@112: ; EBX = &$aiemfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1470
?live16423@128: ; 
@600:
@590:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@587:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_sha$qv+0
	dd        @587+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_sha$qv	endp
@stk@cpu@cpu_has_sha$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	70
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch183
	dd	?patch184
	dd	?patch185
	df	@@stk@cpu@cpu_has_sha$qv
	dw	0
	dw	4176
	dw	0
	dw	315
	dw	0
	dw	0
	dw	0
	db	23
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	115
	db	104
	db	97
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	316
	dw	0
	dw	0
	dw	0
	dw	?patch186
	dw	529
	dw	?patch187
	dd	?live16423@112-@@stk@cpu@cpu_has_sha$qv
	dd	?live16423@128-?live16423@112
	dw	1
?patch187	equ	1
?patch186	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	317
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	318
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	319
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	320
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aiemfcia
	dw	0
	dw	4102
	dw	0
	dw	321
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	322
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ieemfcia
	dw	0
	dw	117
	dw	0
	dw	323
	dw	0
	dw	0
	dw	0
?patch183	equ	@600-@@stk@cpu@cpu_has_sha$qv+72
?patch184	equ	0
?patch185	equ	@600-@@stk@cpu@cpu_has_sha$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ilemfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$apemfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_xop$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_xop$qv	proc	near
?live16424@0:
	?debug L 1473
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @601
@602:
	mov       ebx,offset $apemfcia
	?debug L 1479
?live16424@16: ; EBX = &$apemfcia
	mov       eax,dword ptr [$ilemfcia]
	cmp       eax,-1
	je        short @606
	?debug L 1480
?live16424@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @604
	?debug L 1482
?live16424@48: ; EBX = &$apemfcia
@605:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@606:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @605
	cmp       dword ptr [ebx],0
	jne       short @605
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @609
@608:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@609:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @612
	cmp       dword ptr [ebx],0
@612:
	je        short @610
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @613
	cmp       eax,dword ptr [ebp-20]
@613:
	setne     al
	and       eax,1
	jmp       short @611
@610:
	xor       eax,eax
@611:
	test      al,al
	jne       short @608
	?debug L 1485
	push      0
	push      -2147483647
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1487
	mov       eax,dword ptr [ebp-36]
	and       eax,2048
	mov       dword ptr [$ilemfcia],eax
	?debug L 1488
?live16424@96: ; EBX = &$apemfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1489
?live16424@112: ; EBX = &$apemfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1491
?live16424@128: ; 
@614:
@604:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@601:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_xop$qv+0
	dd        @601+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_xop$qv	endp
@stk@cpu@cpu_has_xop$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	70
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch188
	dd	?patch189
	dd	?patch190
	df	@@stk@cpu@cpu_has_xop$qv
	dw	0
	dw	4178
	dw	0
	dw	324
	dw	0
	dw	0
	dw	0
	db	23
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	120
	db	111
	db	112
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	325
	dw	0
	dw	0
	dw	0
	dw	?patch191
	dw	529
	dw	?patch192
	dd	?live16424@112-@@stk@cpu@cpu_has_xop$qv
	dd	?live16424@128-?live16424@112
	dw	1
?patch192	equ	1
?patch191	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	326
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	327
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	328
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	329
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$apemfcia
	dw	0
	dw	4102
	dw	0
	dw	330
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	331
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ilemfcia
	dw	0
	dw	117
	dw	0
	dw	332
	dw	0
	dw	0
	dw	0
?patch188	equ	@614-@@stk@cpu@cpu_has_xop$qv+73
?patch189	equ	0
?patch190	equ	@614-@@stk@cpu@cpu_has_xop$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$icfmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$agfmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512f$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512f$qv	proc	near
?live16425@0:
	?debug L 1494
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @615
@616:
	mov       ebx,offset $agfmfcia
	?debug L 1500
?live16425@16: ; EBX = &$agfmfcia
	mov       eax,dword ptr [$icfmfcia]
	cmp       eax,-1
	je        short @620
	?debug L 1501
?live16425@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @618
	?debug L 1503
?live16425@48: ; EBX = &$agfmfcia
@619:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@620:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @619
	cmp       dword ptr [ebx],0
	jne       short @619
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @623
@622:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@623:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @626
	cmp       dword ptr [ebx],0
@626:
	je        short @624
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @627
	cmp       eax,dword ptr [ebp-20]
@627:
	setne     al
	and       eax,1
	jmp       short @625
@624:
	xor       eax,eax
@625:
	test      al,al
	jne       short @622
	?debug L 1506
	push      0
	push      7
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1508
	mov       eax,dword ptr [ebp-44]
	and       eax,65536
	mov       dword ptr [$icfmfcia],eax
	?debug L 1509
?live16425@96: ; EBX = &$agfmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1510
?live16425@112: ; EBX = &$agfmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1512
?live16425@128: ; 
@628:
@618:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@615:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512f$qv+0
	dd        @615+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_avx512f$qv	endp
@stk@cpu@cpu_has_avx512f$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	74
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch193
	dd	?patch194
	dd	?patch195
	df	@@stk@cpu@cpu_has_avx512f$qv
	dw	0
	dw	4180
	dw	0
	dw	333
	dw	0
	dw	0
	dw	0
	db	27
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	97
	db	118
	db	120
	db	53
	db	49
	db	50
	db	102
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	334
	dw	0
	dw	0
	dw	0
	dw	?patch196
	dw	529
	dw	?patch197
	dd	?live16425@112-@@stk@cpu@cpu_has_avx512f$qv
	dd	?live16425@128-?live16425@112
	dw	1
?patch197	equ	1
?patch196	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	335
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	336
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	337
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	338
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$agfmfcia
	dw	0
	dw	4102
	dw	0
	dw	339
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	340
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$icfmfcia
	dw	0
	dw	117
	dw	0
	dw	341
	dw	0
	dw	0
	dw	0
?patch193	equ	@628-@@stk@cpu@cpu_has_avx512f$qv+72
?patch194	equ	0
?patch195	equ	@628-@@stk@cpu@cpu_has_avx512f$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ijfmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$anfmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512bw$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512bw$qv	proc	near
?live16426@0:
	?debug L 1515
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @629
@630:
	mov       ebx,offset $anfmfcia
	?debug L 1521
?live16426@16: ; EBX = &$anfmfcia
	mov       eax,dword ptr [$ijfmfcia]
	cmp       eax,-1
	je        short @634
	?debug L 1522
?live16426@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @632
	?debug L 1524
?live16426@48: ; EBX = &$anfmfcia
@633:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@634:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @633
	cmp       dword ptr [ebx],0
	jne       short @633
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @637
@636:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@637:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @640
	cmp       dword ptr [ebx],0
@640:
	je        short @638
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @641
	cmp       eax,dword ptr [ebp-20]
@641:
	setne     al
	and       eax,1
	jmp       short @639
@638:
	xor       eax,eax
@639:
	test      al,al
	jne       short @636
	?debug L 1527
	push      0
	push      7
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1529
	mov       eax,dword ptr [ebp-44]
	and       eax,1073741824
	mov       dword ptr [$ijfmfcia],eax
	?debug L 1530
?live16426@96: ; EBX = &$anfmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1531
?live16426@112: ; EBX = &$anfmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1533
?live16426@128: ; 
@642:
@632:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@629:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512bw$qv+0
	dd        @629+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_avx512bw$qv	endp
@stk@cpu@cpu_has_avx512bw$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	75
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch198
	dd	?patch199
	dd	?patch200
	df	@@stk@cpu@cpu_has_avx512bw$qv
	dw	0
	dw	4182
	dw	0
	dw	342
	dw	0
	dw	0
	dw	0
	db	28
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	97
	db	118
	db	120
	db	53
	db	49
	db	50
	db	98
	db	119
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	343
	dw	0
	dw	0
	dw	0
	dw	?patch201
	dw	529
	dw	?patch202
	dd	?live16426@112-@@stk@cpu@cpu_has_avx512bw$qv
	dd	?live16426@128-?live16426@112
	dw	1
?patch202	equ	1
?patch201	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	344
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	345
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	346
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	347
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$anfmfcia
	dw	0
	dw	4102
	dw	0
	dw	348
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	349
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ijfmfcia
	dw	0
	dw	117
	dw	0
	dw	350
	dw	0
	dw	0
	dw	0
?patch198	equ	@642-@@stk@cpu@cpu_has_avx512bw$qv+72
?patch199	equ	0
?patch200	equ	@642-@@stk@cpu@cpu_has_avx512bw$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iagmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aegmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512er$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512er$qv	proc	near
?live16427@0:
	?debug L 1536
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @643
@644:
	mov       ebx,offset $aegmfcia
	?debug L 1542
?live16427@16: ; EBX = &$aegmfcia
	mov       eax,dword ptr [$iagmfcia]
	cmp       eax,-1
	je        short @648
	?debug L 1543
?live16427@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @646
	?debug L 1545
?live16427@48: ; EBX = &$aegmfcia
@647:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@648:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @647
	cmp       dword ptr [ebx],0
	jne       short @647
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @651
@650:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@651:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @654
	cmp       dword ptr [ebx],0
@654:
	je        short @652
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @655
	cmp       eax,dword ptr [ebp-20]
@655:
	setne     al
	and       eax,1
	jmp       short @653
@652:
	xor       eax,eax
@653:
	test      al,al
	jne       short @650
	?debug L 1548
	push      0
	push      7
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1550
	mov       eax,dword ptr [ebp-44]
	and       eax,134217728
	mov       dword ptr [$iagmfcia],eax
	?debug L 1551
?live16427@96: ; EBX = &$aegmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1552
?live16427@112: ; EBX = &$aegmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1554
?live16427@128: ; 
@656:
@646:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@643:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512er$qv+0
	dd        @643+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_avx512er$qv	endp
@stk@cpu@cpu_has_avx512er$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	75
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch203
	dd	?patch204
	dd	?patch205
	df	@@stk@cpu@cpu_has_avx512er$qv
	dw	0
	dw	4184
	dw	0
	dw	351
	dw	0
	dw	0
	dw	0
	db	28
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	97
	db	118
	db	120
	db	53
	db	49
	db	50
	db	101
	db	114
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	352
	dw	0
	dw	0
	dw	0
	dw	?patch206
	dw	529
	dw	?patch207
	dd	?live16427@112-@@stk@cpu@cpu_has_avx512er$qv
	dd	?live16427@128-?live16427@112
	dw	1
?patch207	equ	1
?patch206	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	353
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	354
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	355
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	356
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aegmfcia
	dw	0
	dw	4102
	dw	0
	dw	357
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	358
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iagmfcia
	dw	0
	dw	117
	dw	0
	dw	359
	dw	0
	dw	0
	dw	0
?patch203	equ	@656-@@stk@cpu@cpu_has_avx512er$qv+72
?patch204	equ	0
?patch205	equ	@656-@@stk@cpu@cpu_has_avx512er$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ihgmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$algmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512cd$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512cd$qv	proc	near
?live16428@0:
	?debug L 1557
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @657
@658:
	mov       ebx,offset $algmfcia
	?debug L 1563
?live16428@16: ; EBX = &$algmfcia
	mov       eax,dword ptr [$ihgmfcia]
	cmp       eax,-1
	je        short @662
	?debug L 1564
?live16428@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @660
	?debug L 1566
?live16428@48: ; EBX = &$algmfcia
@661:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@662:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @661
	cmp       dword ptr [ebx],0
	jne       short @661
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @665
@664:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@665:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @668
	cmp       dword ptr [ebx],0
@668:
	je        short @666
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @669
	cmp       eax,dword ptr [ebp-20]
@669:
	setne     al
	and       eax,1
	jmp       short @667
@666:
	xor       eax,eax
@667:
	test      al,al
	jne       short @664
	?debug L 1569
	push      0
	push      7
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1571
	mov       eax,dword ptr [ebp-44]
	and       eax,268435456
	mov       dword ptr [$ihgmfcia],eax
	?debug L 1572
?live16428@96: ; EBX = &$algmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1573
?live16428@112: ; EBX = &$algmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1575
?live16428@128: ; 
@670:
@660:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@657:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512cd$qv+0
	dd        @657+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_avx512cd$qv	endp
@stk@cpu@cpu_has_avx512cd$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	75
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch208
	dd	?patch209
	dd	?patch210
	df	@@stk@cpu@cpu_has_avx512cd$qv
	dw	0
	dw	4186
	dw	0
	dw	360
	dw	0
	dw	0
	dw	0
	db	28
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	97
	db	118
	db	120
	db	53
	db	49
	db	50
	db	99
	db	100
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	361
	dw	0
	dw	0
	dw	0
	dw	?patch211
	dw	529
	dw	?patch212
	dd	?live16428@112-@@stk@cpu@cpu_has_avx512cd$qv
	dd	?live16428@128-?live16428@112
	dw	1
?patch212	equ	1
?patch211	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	362
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	363
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	364
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	365
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$algmfcia
	dw	0
	dw	4102
	dw	0
	dw	366
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	367
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ihgmfcia
	dw	0
	dw	117
	dw	0
	dw	368
	dw	0
	dw	0
	dw	0
?patch208	equ	@670-@@stk@cpu@cpu_has_avx512cd$qv+72
?patch209	equ	0
?patch210	equ	@670-@@stk@cpu@cpu_has_avx512cd$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iogmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$achmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512pf$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512pf$qv	proc	near
?live16429@0:
	?debug L 1578
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @671
@672:
	mov       ebx,offset $achmfcia
	?debug L 1584
?live16429@16: ; EBX = &$achmfcia
	mov       eax,dword ptr [$iogmfcia]
	cmp       eax,-1
	je        short @676
	?debug L 1585
?live16429@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @674
	?debug L 1587
?live16429@48: ; EBX = &$achmfcia
@675:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@676:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @675
	cmp       dword ptr [ebx],0
	jne       short @675
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @679
@678:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@679:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @682
	cmp       dword ptr [ebx],0
@682:
	je        short @680
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @683
	cmp       eax,dword ptr [ebp-20]
@683:
	setne     al
	and       eax,1
	jmp       short @681
@680:
	xor       eax,eax
@681:
	test      al,al
	jne       short @678
	?debug L 1590
	push      0
	push      7
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1592
	mov       eax,dword ptr [ebp-44]
	and       eax,67108864
	mov       dword ptr [$iogmfcia],eax
	?debug L 1593
?live16429@96: ; EBX = &$achmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1594
?live16429@112: ; EBX = &$achmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1596
?live16429@128: ; 
@684:
@674:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@671:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512pf$qv+0
	dd        @671+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_avx512pf$qv	endp
@stk@cpu@cpu_has_avx512pf$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	75
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch213
	dd	?patch214
	dd	?patch215
	df	@@stk@cpu@cpu_has_avx512pf$qv
	dw	0
	dw	4188
	dw	0
	dw	369
	dw	0
	dw	0
	dw	0
	db	28
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	97
	db	118
	db	120
	db	53
	db	49
	db	50
	db	112
	db	102
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	370
	dw	0
	dw	0
	dw	0
	dw	?patch216
	dw	529
	dw	?patch217
	dd	?live16429@112-@@stk@cpu@cpu_has_avx512pf$qv
	dd	?live16429@128-?live16429@112
	dw	1
?patch217	equ	1
?patch216	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	371
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	372
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	373
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	374
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$achmfcia
	dw	0
	dw	4102
	dw	0
	dw	375
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	376
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iogmfcia
	dw	0
	dw	117
	dw	0
	dw	377
	dw	0
	dw	0
	dw	0
?patch213	equ	@684-@@stk@cpu@cpu_has_avx512pf$qv+72
?patch214	equ	0
?patch215	equ	@684-@@stk@cpu@cpu_has_avx512pf$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ifhmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ajhmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512dq$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512dq$qv	proc	near
?live16430@0:
	?debug L 1599
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @685
@686:
	mov       ebx,offset $ajhmfcia
	?debug L 1605
?live16430@16: ; EBX = &$ajhmfcia
	mov       eax,dword ptr [$ifhmfcia]
	cmp       eax,-1
	je        short @690
	?debug L 1606
?live16430@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @688
	?debug L 1608
?live16430@48: ; EBX = &$ajhmfcia
@689:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@690:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @689
	cmp       dword ptr [ebx],0
	jne       short @689
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @693
@692:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@693:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @696
	cmp       dword ptr [ebx],0
@696:
	je        short @694
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @697
	cmp       eax,dword ptr [ebp-20]
@697:
	setne     al
	and       eax,1
	jmp       short @695
@694:
	xor       eax,eax
@695:
	test      al,al
	jne       short @692
	?debug L 1611
	push      0
	push      7
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1613
	mov       eax,dword ptr [ebp-44]
	and       eax,131072
	mov       dword ptr [$ifhmfcia],eax
	?debug L 1614
?live16430@96: ; EBX = &$ajhmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1615
?live16430@112: ; EBX = &$ajhmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1617
?live16430@128: ; 
@698:
@688:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@685:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512dq$qv+0
	dd        @685+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_avx512dq$qv	endp
@stk@cpu@cpu_has_avx512dq$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	75
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch218
	dd	?patch219
	dd	?patch220
	df	@@stk@cpu@cpu_has_avx512dq$qv
	dw	0
	dw	4190
	dw	0
	dw	378
	dw	0
	dw	0
	dw	0
	db	28
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	97
	db	118
	db	120
	db	53
	db	49
	db	50
	db	100
	db	113
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	379
	dw	0
	dw	0
	dw	0
	dw	?patch221
	dw	529
	dw	?patch222
	dd	?live16430@112-@@stk@cpu@cpu_has_avx512dq$qv
	dd	?live16430@128-?live16430@112
	dw	1
?patch222	equ	1
?patch221	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	380
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	381
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	382
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	383
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ajhmfcia
	dw	0
	dw	4102
	dw	0
	dw	384
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	385
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ifhmfcia
	dw	0
	dw	117
	dw	0
	dw	386
	dw	0
	dw	0
	dw	0
?patch218	equ	@698-@@stk@cpu@cpu_has_avx512dq$qv+72
?patch219	equ	0
?patch220	equ	@698-@@stk@cpu@cpu_has_avx512dq$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$imhmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aaimfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512vl$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512vl$qv	proc	near
?live16431@0:
	?debug L 1620
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @699
@700:
	mov       ebx,offset $aaimfcia
	?debug L 1626
?live16431@16: ; EBX = &$aaimfcia
	mov       eax,dword ptr [$imhmfcia]
	cmp       eax,-1
	je        short @704
	?debug L 1627
?live16431@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @702
	?debug L 1629
?live16431@48: ; EBX = &$aaimfcia
@703:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@704:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @703
	cmp       dword ptr [ebx],0
	jne       short @703
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @707
@706:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@707:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @710
	cmp       dword ptr [ebx],0
@710:
	je        short @708
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @711
	cmp       eax,dword ptr [ebp-20]
@711:
	setne     al
	and       eax,1
	jmp       short @709
@708:
	xor       eax,eax
@709:
	test      al,al
	jne       short @706
	?debug L 1632
	push      0
	push      7
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1634
	mov       eax,dword ptr [ebp-44]
	and       eax,-2147483648
	mov       dword ptr [$imhmfcia],eax
	?debug L 1635
?live16431@96: ; EBX = &$aaimfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1636
?live16431@112: ; EBX = &$aaimfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1638
?live16431@128: ; 
@712:
@702:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@699:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512vl$qv+0
	dd        @699+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_avx512vl$qv	endp
@stk@cpu@cpu_has_avx512vl$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	75
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch223
	dd	?patch224
	dd	?patch225
	df	@@stk@cpu@cpu_has_avx512vl$qv
	dw	0
	dw	4192
	dw	0
	dw	387
	dw	0
	dw	0
	dw	0
	db	28
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	97
	db	118
	db	120
	db	53
	db	49
	db	50
	db	118
	db	108
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	388
	dw	0
	dw	0
	dw	0
	dw	?patch226
	dw	529
	dw	?patch227
	dd	?live16431@112-@@stk@cpu@cpu_has_avx512vl$qv
	dd	?live16431@128-?live16431@112
	dw	1
?patch227	equ	1
?patch226	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	389
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	390
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	391
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	392
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aaimfcia
	dw	0
	dw	4102
	dw	0
	dw	393
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	394
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$imhmfcia
	dw	0
	dw	117
	dw	0
	dw	395
	dw	0
	dw	0
	dw	0
?patch223	equ	@712-@@stk@cpu@cpu_has_avx512vl$qv+72
?patch224	equ	0
?patch225	equ	@712-@@stk@cpu@cpu_has_avx512vl$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$idimfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ahimfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512ifma$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512ifma$qv	proc	near
?live16432@0:
	?debug L 1641
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @713
@714:
	mov       ebx,offset $ahimfcia
	?debug L 1647
?live16432@16: ; EBX = &$ahimfcia
	mov       eax,dword ptr [$idimfcia]
	cmp       eax,-1
	je        short @718
	?debug L 1648
?live16432@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @716
	?debug L 1650
?live16432@48: ; EBX = &$ahimfcia
@717:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@718:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @717
	cmp       dword ptr [ebx],0
	jne       short @717
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @721
@720:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@721:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @724
	cmp       dword ptr [ebx],0
@724:
	je        short @722
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @725
	cmp       eax,dword ptr [ebp-20]
@725:
	setne     al
	and       eax,1
	jmp       short @723
@722:
	xor       eax,eax
@723:
	test      al,al
	jne       short @720
	?debug L 1653
	push      0
	push      7
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1655
	mov       eax,dword ptr [ebp-44]
	and       eax,2097152
	mov       dword ptr [$idimfcia],eax
	?debug L 1656
?live16432@96: ; EBX = &$ahimfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1657
?live16432@112: ; EBX = &$ahimfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1659
?live16432@128: ; 
@726:
@716:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@713:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512ifma$qv+0
	dd        @713+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_avx512ifma$qv	endp
@stk@cpu@cpu_has_avx512ifma$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	77
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch228
	dd	?patch229
	dd	?patch230
	df	@@stk@cpu@cpu_has_avx512ifma$qv
	dw	0
	dw	4194
	dw	0
	dw	396
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
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	97
	db	118
	db	120
	db	53
	db	49
	db	50
	db	105
	db	102
	db	109
	db	97
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	397
	dw	0
	dw	0
	dw	0
	dw	?patch231
	dw	529
	dw	?patch232
	dd	?live16432@112-@@stk@cpu@cpu_has_avx512ifma$qv
	dd	?live16432@128-?live16432@112
	dw	1
?patch232	equ	1
?patch231	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	398
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	399
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	400
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	401
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ahimfcia
	dw	0
	dw	4102
	dw	0
	dw	402
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	403
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$idimfcia
	dw	0
	dw	117
	dw	0
	dw	404
	dw	0
	dw	0
	dw	0
?patch228	equ	@726-@@stk@cpu@cpu_has_avx512ifma$qv+72
?patch229	equ	0
?patch230	equ	@726-@@stk@cpu@cpu_has_avx512ifma$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ikimfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aoimfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512vbmi$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512vbmi$qv	proc	near
?live16433@0:
	?debug L 1662
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @727
@728:
	mov       ebx,offset $aoimfcia
	?debug L 1668
?live16433@16: ; EBX = &$aoimfcia
	mov       eax,dword ptr [$ikimfcia]
	cmp       eax,-1
	je        short @732
	?debug L 1669
?live16433@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @730
	?debug L 1671
?live16433@48: ; EBX = &$aoimfcia
@731:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@732:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @731
	cmp       dword ptr [ebx],0
	jne       short @731
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @735
@734:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@735:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @738
	cmp       dword ptr [ebx],0
@738:
	je        short @736
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @739
	cmp       eax,dword ptr [ebp-20]
@739:
	setne     al
	and       eax,1
	jmp       short @737
@736:
	xor       eax,eax
@737:
	test      al,al
	jne       short @734
	?debug L 1674
	push      0
	push      7
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1676
	mov       eax,dword ptr [ebp-36]
	and       eax,2
	mov       dword ptr [$ikimfcia],eax
	?debug L 1677
?live16433@96: ; EBX = &$aoimfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1678
?live16433@112: ; EBX = &$aoimfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1680
?live16433@128: ; 
@740:
@730:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@727:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512vbmi$qv+0
	dd        @727+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_avx512vbmi$qv	endp
@stk@cpu@cpu_has_avx512vbmi$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	77
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch233
	dd	?patch234
	dd	?patch235
	df	@@stk@cpu@cpu_has_avx512vbmi$qv
	dw	0
	dw	4196
	dw	0
	dw	405
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
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	97
	db	118
	db	120
	db	53
	db	49
	db	50
	db	118
	db	98
	db	109
	db	105
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	406
	dw	0
	dw	0
	dw	0
	dw	?patch236
	dw	529
	dw	?patch237
	dd	?live16433@112-@@stk@cpu@cpu_has_avx512vbmi$qv
	dd	?live16433@128-?live16433@112
	dw	1
?patch237	equ	1
?patch236	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	407
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	408
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	409
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	410
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aoimfcia
	dw	0
	dw	4102
	dw	0
	dw	411
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	412
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ikimfcia
	dw	0
	dw	117
	dw	0
	dw	413
	dw	0
	dw	0
	dw	0
?patch233	equ	@740-@@stk@cpu@cpu_has_avx512vbmi$qv+74
?patch234	equ	0
?patch235	equ	@740-@@stk@cpu@cpu_has_avx512vbmi$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ibjmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$afjmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_adx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_adx$qv	proc	near
?live16434@0:
	?debug L 1683
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @741
@742:
	mov       ebx,offset $afjmfcia
	?debug L 1689
?live16434@16: ; EBX = &$afjmfcia
	mov       eax,dword ptr [$ibjmfcia]
	cmp       eax,-1
	je        short @746
	?debug L 1690
?live16434@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @744
	?debug L 1692
?live16434@48: ; EBX = &$afjmfcia
@745:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@746:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @745
	cmp       dword ptr [ebx],0
	jne       short @745
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @749
@748:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@749:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @752
	cmp       dword ptr [ebx],0
@752:
	je        short @750
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @753
	cmp       eax,dword ptr [ebp-20]
@753:
	setne     al
	and       eax,1
	jmp       short @751
@750:
	xor       eax,eax
@751:
	test      al,al
	jne       short @748
	?debug L 1695
	push      0
	push      7
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1697
	mov       eax,dword ptr [ebp-44]
	and       eax,524288
	mov       dword ptr [$ibjmfcia],eax
	?debug L 1698
?live16434@96: ; EBX = &$afjmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1699
?live16434@112: ; EBX = &$afjmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1701
?live16434@128: ; 
@754:
@744:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@741:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_adx$qv+0
	dd        @741+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_adx$qv	endp
@stk@cpu@cpu_has_adx$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	70
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch238
	dd	?patch239
	dd	?patch240
	df	@@stk@cpu@cpu_has_adx$qv
	dw	0
	dw	4198
	dw	0
	dw	414
	dw	0
	dw	0
	dw	0
	db	23
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	97
	db	100
	db	120
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	415
	dw	0
	dw	0
	dw	0
	dw	?patch241
	dw	529
	dw	?patch242
	dd	?live16434@112-@@stk@cpu@cpu_has_adx$qv
	dd	?live16434@128-?live16434@112
	dw	1
?patch242	equ	1
?patch241	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	416
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	417
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	418
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	419
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$afjmfcia
	dw	0
	dw	4102
	dw	0
	dw	420
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	421
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ibjmfcia
	dw	0
	dw	117
	dw	0
	dw	422
	dw	0
	dw	0
	dw	0
?patch238	equ	@754-@@stk@cpu@cpu_has_adx$qv+72
?patch239	equ	0
?patch240	equ	@754-@@stk@cpu@cpu_has_adx$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iijmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$amjmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_lzcnt$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_lzcnt$qv	proc	near
?live16435@0:
	?debug L 1704
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @755
@756:
	mov       ebx,offset $amjmfcia
	?debug L 1710
?live16435@16: ; EBX = &$amjmfcia
	mov       eax,dword ptr [$iijmfcia]
	cmp       eax,-1
	je        short @760
	?debug L 1711
?live16435@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @758
	?debug L 1713
?live16435@48: ; EBX = &$amjmfcia
@759:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@760:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @759
	cmp       dword ptr [ebx],0
	jne       short @759
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @763
@762:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@763:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @766
	cmp       dword ptr [ebx],0
@766:
	je        short @764
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @767
	cmp       eax,dword ptr [ebp-20]
@767:
	setne     al
	and       eax,1
	jmp       short @765
@764:
	xor       eax,eax
@765:
	test      al,al
	jne       short @762
	?debug L 1716
	push      0
	push      -2147483647
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1718
	mov       eax,dword ptr [ebp-36]
	and       eax,32
	mov       dword ptr [$iijmfcia],eax
	?debug L 1719
?live16435@96: ; EBX = &$amjmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1720
?live16435@112: ; EBX = &$amjmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1722
?live16435@128: ; 
@768:
@758:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@755:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_lzcnt$qv+0
	dd        @755+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_lzcnt$qv	endp
@stk@cpu@cpu_has_lzcnt$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	72
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch243
	dd	?patch244
	dd	?patch245
	df	@@stk@cpu@cpu_has_lzcnt$qv
	dw	0
	dw	4200
	dw	0
	dw	423
	dw	0
	dw	0
	dw	0
	db	25
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	108
	db	122
	db	99
	db	110
	db	116
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	424
	dw	0
	dw	0
	dw	0
	dw	?patch246
	dw	529
	dw	?patch247
	dd	?live16435@112-@@stk@cpu@cpu_has_lzcnt$qv
	dd	?live16435@128-?live16435@112
	dw	1
?patch247	equ	1
?patch246	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	425
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	426
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	427
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	428
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$amjmfcia
	dw	0
	dw	4102
	dw	0
	dw	429
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	430
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iijmfcia
	dw	0
	dw	117
	dw	0
	dw	431
	dw	0
	dw	0
	dw	0
?patch243	equ	@768-@@stk@cpu@cpu_has_lzcnt$qv+75
?patch244	equ	0
?patch245	equ	@768-@@stk@cpu@cpu_has_lzcnt$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ipjmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$adkmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_tbm$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_tbm$qv	proc	near
?live16436@0:
	?debug L 1725
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @769
@770:
	mov       ebx,offset $adkmfcia
	?debug L 1731
?live16436@16: ; EBX = &$adkmfcia
	mov       eax,dword ptr [$ipjmfcia]
	cmp       eax,-1
	je        short @774
	?debug L 1732
?live16436@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @772
	?debug L 1734
?live16436@48: ; EBX = &$adkmfcia
@773:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@774:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @773
	cmp       dword ptr [ebx],0
	jne       short @773
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @777
@776:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@777:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @780
	cmp       dword ptr [ebx],0
@780:
	je        short @778
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @781
	cmp       eax,dword ptr [ebp-20]
@781:
	setne     al
	and       eax,1
	jmp       short @779
@778:
	xor       eax,eax
@779:
	test      al,al
	jne       short @776
	?debug L 1737
	push      0
	push      -2147483647
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1739
	mov       eax,dword ptr [ebp-36]
	and       eax,2097152
	mov       dword ptr [$ipjmfcia],eax
	?debug L 1740
?live16436@96: ; EBX = &$adkmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1741
?live16436@112: ; EBX = &$adkmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1743
?live16436@128: ; 
@782:
@772:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@769:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_tbm$qv+0
	dd        @769+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_tbm$qv	endp
@stk@cpu@cpu_has_tbm$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	70
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch248
	dd	?patch249
	dd	?patch250
	df	@@stk@cpu@cpu_has_tbm$qv
	dw	0
	dw	4202
	dw	0
	dw	432
	dw	0
	dw	0
	dw	0
	db	23
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	116
	db	98
	db	109
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	433
	dw	0
	dw	0
	dw	0
	dw	?patch251
	dw	529
	dw	?patch252
	dd	?live16436@112-@@stk@cpu@cpu_has_tbm$qv
	dd	?live16436@128-?live16436@112
	dw	1
?patch252	equ	1
?patch251	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	434
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	435
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	436
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	437
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$adkmfcia
	dw	0
	dw	4102
	dw	0
	dw	438
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	439
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ipjmfcia
	dw	0
	dw	117
	dw	0
	dw	440
	dw	0
	dw	0
	dw	0
?patch248	equ	@782-@@stk@cpu@cpu_has_tbm$qv+73
?patch249	equ	0
?patch250	equ	@782-@@stk@cpu@cpu_has_tbm$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$igkmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$akkmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_clfsh$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_clfsh$qv	proc	near
?live16437@0:
	?debug L 1746
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @783
@784:
	mov       ebx,offset $akkmfcia
	?debug L 1752
?live16437@16: ; EBX = &$akkmfcia
	mov       eax,dword ptr [$igkmfcia]
	cmp       eax,-1
	je        short @788
	?debug L 1753
?live16437@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @786
	?debug L 1755
?live16437@48: ; EBX = &$akkmfcia
@787:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@788:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @787
	cmp       dword ptr [ebx],0
	jne       short @787
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @791
@790:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@791:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @794
	cmp       dword ptr [ebx],0
@794:
	je        short @792
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @795
	cmp       eax,dword ptr [ebp-20]
@795:
	setne     al
	and       eax,1
	jmp       short @793
@792:
	xor       eax,eax
@793:
	test      al,al
	jne       short @790
	?debug L 1758
	push      0
	push      1
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1760
	mov       eax,dword ptr [ebp-36]
	and       eax,524288
	mov       dword ptr [$igkmfcia],eax
	?debug L 1761
?live16437@96: ; EBX = &$akkmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1762
?live16437@112: ; EBX = &$akkmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1764
?live16437@128: ; 
@796:
@786:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@783:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_clfsh$qv+0
	dd        @783+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_clfsh$qv	endp
@stk@cpu@cpu_has_clfsh$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	72
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch253
	dd	?patch254
	dd	?patch255
	df	@@stk@cpu@cpu_has_clfsh$qv
	dw	0
	dw	4204
	dw	0
	dw	441
	dw	0
	dw	0
	dw	0
	db	25
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	99
	db	108
	db	102
	db	115
	db	104
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	442
	dw	0
	dw	0
	dw	0
	dw	?patch256
	dw	529
	dw	?patch257
	dd	?live16437@112-@@stk@cpu@cpu_has_clfsh$qv
	dd	?live16437@128-?live16437@112
	dw	1
?patch257	equ	1
?patch256	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	443
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	444
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	445
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	446
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$akkmfcia
	dw	0
	dw	4102
	dw	0
	dw	447
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	448
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$igkmfcia
	dw	0
	dw	117
	dw	0
	dw	449
	dw	0
	dw	0
	dw	0
?patch253	equ	@796-@@stk@cpu@cpu_has_clfsh$qv+72
?patch254	equ	0
?patch255	equ	@796-@@stk@cpu@cpu_has_clfsh$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$inkmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ablmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_pclmulqdq$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_pclmulqdq$qv	proc	near
?live16438@0:
	?debug L 1767
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @797
@798:
	mov       ebx,offset $ablmfcia
	?debug L 1773
?live16438@16: ; EBX = &$ablmfcia
	mov       eax,dword ptr [$inkmfcia]
	cmp       eax,-1
	je        short @802
	?debug L 1774
?live16438@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @800
	?debug L 1776
?live16438@48: ; EBX = &$ablmfcia
@801:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@802:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @801
	cmp       dword ptr [ebx],0
	jne       short @801
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @805
@804:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@805:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @808
	cmp       dword ptr [ebx],0
@808:
	je        short @806
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @809
	cmp       eax,dword ptr [ebp-20]
@809:
	setne     al
	and       eax,1
	jmp       short @807
@806:
	xor       eax,eax
@807:
	test      al,al
	jne       short @804
	?debug L 1779
	push      0
	push      1
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1781
	mov       eax,dword ptr [ebp-36]
	and       eax,32
	mov       dword ptr [$inkmfcia],eax
	?debug L 1782
?live16438@96: ; EBX = &$ablmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1783
?live16438@112: ; EBX = &$ablmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1785
?live16438@128: ; 
@810:
@800:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@797:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_pclmulqdq$qv+0
	dd        @797+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_pclmulqdq$qv	endp
@stk@cpu@cpu_has_pclmulqdq$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	76
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch258
	dd	?patch259
	dd	?patch260
	df	@@stk@cpu@cpu_has_pclmulqdq$qv
	dw	0
	dw	4206
	dw	0
	dw	450
	dw	0
	dw	0
	dw	0
	db	29
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	112
	db	99
	db	108
	db	109
	db	117
	db	108
	db	113
	db	100
	db	113
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	451
	dw	0
	dw	0
	dw	0
	dw	?patch261
	dw	529
	dw	?patch262
	dd	?live16438@112-@@stk@cpu@cpu_has_pclmulqdq$qv
	dd	?live16438@128-?live16438@112
	dw	1
?patch262	equ	1
?patch261	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	452
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	453
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	454
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	455
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ablmfcia
	dw	0
	dw	4102
	dw	0
	dw	456
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	457
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$inkmfcia
	dw	0
	dw	117
	dw	0
	dw	458
	dw	0
	dw	0
	dw	0
?patch258	equ	@810-@@stk@cpu@cpu_has_pclmulqdq$qv+74
?patch259	equ	0
?patch260	equ	@810-@@stk@cpu@cpu_has_pclmulqdq$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ielmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ailmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_fxsr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_fxsr$qv	proc	near
?live16439@0:
	?debug L 1788
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @811
@812:
	mov       ebx,offset $ailmfcia
	?debug L 1794
?live16439@16: ; EBX = &$ailmfcia
	mov       eax,dword ptr [$ielmfcia]
	cmp       eax,-1
	je        short @816
	?debug L 1795
?live16439@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @814
	?debug L 1797
?live16439@48: ; EBX = &$ailmfcia
@815:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@816:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @815
	cmp       dword ptr [ebx],0
	jne       short @815
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @819
@818:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@819:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @822
	cmp       dword ptr [ebx],0
@822:
	je        short @820
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @823
	cmp       eax,dword ptr [ebp-20]
@823:
	setne     al
	and       eax,1
	jmp       short @821
@820:
	xor       eax,eax
@821:
	test      al,al
	jne       short @818
	?debug L 1800
	push      0
	push      1
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1802
	mov       eax,dword ptr [ebp-36]
	and       eax,16777216
	mov       dword ptr [$ielmfcia],eax
	?debug L 1803
?live16439@96: ; EBX = &$ailmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1804
?live16439@112: ; EBX = &$ailmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1806
?live16439@128: ; 
@824:
@814:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@811:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_fxsr$qv+0
	dd        @811+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_fxsr$qv	endp
@stk@cpu@cpu_has_fxsr$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	71
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch263
	dd	?patch264
	dd	?patch265
	df	@@stk@cpu@cpu_has_fxsr$qv
	dw	0
	dw	4208
	dw	0
	dw	459
	dw	0
	dw	0
	dw	0
	db	24
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	102
	db	120
	db	115
	db	114
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	460
	dw	0
	dw	0
	dw	0
	dw	?patch266
	dw	529
	dw	?patch267
	dd	?live16439@112-@@stk@cpu@cpu_has_fxsr$qv
	dd	?live16439@128-?live16439@112
	dw	1
?patch267	equ	1
?patch266	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	461
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	462
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	463
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	464
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ailmfcia
	dw	0
	dw	4102
	dw	0
	dw	465
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	466
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ielmfcia
	dw	0
	dw	117
	dw	0
	dw	467
	dw	0
	dw	0
	dw	0
?patch263	equ	@824-@@stk@cpu@cpu_has_fxsr$qv+72
?patch264	equ	0
?patch265	equ	@824-@@stk@cpu@cpu_has_fxsr$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$illmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aplmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_ss$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_ss$qv	proc	near
?live16440@0:
	?debug L 1809
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @825
@826:
	mov       ebx,offset $aplmfcia
	?debug L 1815
?live16440@16: ; EBX = &$aplmfcia
	mov       eax,dword ptr [$illmfcia]
	cmp       eax,-1
	je        short @830
	?debug L 1816
?live16440@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @828
	?debug L 1818
?live16440@48: ; EBX = &$aplmfcia
@829:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@830:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @829
	cmp       dword ptr [ebx],0
	jne       short @829
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @833
@832:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@833:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @836
	cmp       dword ptr [ebx],0
@836:
	je        short @834
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @837
	cmp       eax,dword ptr [ebp-20]
@837:
	setne     al
	and       eax,1
	jmp       short @835
@834:
	xor       eax,eax
@835:
	test      al,al
	jne       short @832
	?debug L 1821
	push      0
	push      1
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1823
	mov       eax,dword ptr [ebp-36]
	and       eax,134217728
	mov       dword ptr [$illmfcia],eax
	?debug L 1824
?live16440@96: ; EBX = &$aplmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1825
?live16440@112: ; EBX = &$aplmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1827
?live16440@128: ; 
@838:
@828:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@825:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_ss$qv+0
	dd        @825+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_ss$qv	endp
@stk@cpu@cpu_has_ss$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	69
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch268
	dd	?patch269
	dd	?patch270
	df	@@stk@cpu@cpu_has_ss$qv
	dw	0
	dw	4210
	dw	0
	dw	468
	dw	0
	dw	0
	dw	0
	db	22
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	115
	db	115
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	469
	dw	0
	dw	0
	dw	0
	dw	?patch271
	dw	529
	dw	?patch272
	dd	?live16440@112-@@stk@cpu@cpu_has_ss$qv
	dd	?live16440@128-?live16440@112
	dw	1
?patch272	equ	1
?patch271	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	470
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	471
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	472
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	473
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aplmfcia
	dw	0
	dw	4102
	dw	0
	dw	474
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	475
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$illmfcia
	dw	0
	dw	117
	dw	0
	dw	476
	dw	0
	dw	0
	dw	0
?patch268	equ	@838-@@stk@cpu@cpu_has_ss$qv+72
?patch269	equ	0
?patch270	equ	@838-@@stk@cpu@cpu_has_ss$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$icmmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$agmmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_mtrr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mtrr$qv	proc	near
?live16441@0:
	?debug L 1830
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @839
@840:
	mov       ebx,offset $agmmfcia
	?debug L 1836
?live16441@16: ; EBX = &$agmmfcia
	mov       eax,dword ptr [$icmmfcia]
	cmp       eax,-1
	je        short @844
	?debug L 1837
?live16441@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @842
	?debug L 1839
?live16441@48: ; EBX = &$agmmfcia
@843:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@844:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @843
	cmp       dword ptr [ebx],0
	jne       short @843
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @847
@846:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@847:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @850
	cmp       dword ptr [ebx],0
@850:
	je        short @848
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @851
	cmp       eax,dword ptr [ebp-20]
@851:
	setne     al
	and       eax,1
	jmp       short @849
@848:
	xor       eax,eax
@849:
	test      al,al
	jne       short @846
	?debug L 1842
	push      0
	push      1
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1844
	mov       eax,dword ptr [ebp-36]
	and       eax,4096
	mov       dword ptr [$icmmfcia],eax
	?debug L 1845
?live16441@96: ; EBX = &$agmmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1846
?live16441@112: ; EBX = &$agmmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1848
?live16441@128: ; 
@852:
@842:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@839:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_mtrr$qv+0
	dd        @839+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_mtrr$qv	endp
@stk@cpu@cpu_has_mtrr$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	71
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch273
	dd	?patch274
	dd	?patch275
	df	@@stk@cpu@cpu_has_mtrr$qv
	dw	0
	dw	4212
	dw	0
	dw	477
	dw	0
	dw	0
	dw	0
	db	24
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	109
	db	116
	db	114
	db	114
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	478
	dw	0
	dw	0
	dw	0
	dw	?patch276
	dw	529
	dw	?patch277
	dd	?live16441@112-@@stk@cpu@cpu_has_mtrr$qv
	dd	?live16441@128-?live16441@112
	dw	1
?patch277	equ	1
?patch276	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	479
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	480
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	481
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	482
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$agmmfcia
	dw	0
	dw	4102
	dw	0
	dw	483
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	484
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$icmmfcia
	dw	0
	dw	117
	dw	0
	dw	485
	dw	0
	dw	0
	dw	0
?patch273	equ	@852-@@stk@cpu@cpu_has_mtrr$qv+72
?patch274	equ	0
?patch275	equ	@852-@@stk@cpu@cpu_has_mtrr$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ijmmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$anmmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_msr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_msr$qv	proc	near
?live16442@0:
	?debug L 1851
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @853
@854:
	mov       ebx,offset $anmmfcia
	?debug L 1857
?live16442@16: ; EBX = &$anmmfcia
	mov       eax,dword ptr [$ijmmfcia]
	cmp       eax,-1
	je        short @858
	?debug L 1858
?live16442@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @856
	?debug L 1860
?live16442@48: ; EBX = &$anmmfcia
@857:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@858:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @857
	cmp       dword ptr [ebx],0
	jne       short @857
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @861
@860:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@861:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @864
	cmp       dword ptr [ebx],0
@864:
	je        short @862
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @865
	cmp       eax,dword ptr [ebp-20]
@865:
	setne     al
	and       eax,1
	jmp       short @863
@862:
	xor       eax,eax
@863:
	test      al,al
	jne       short @860
	?debug L 1863
	push      0
	push      1
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1865
	mov       eax,dword ptr [ebp-36]
	and       eax,4096
	mov       dword ptr [$ijmmfcia],eax
	?debug L 1866
?live16442@96: ; EBX = &$anmmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1867
?live16442@112: ; EBX = &$anmmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1869
?live16442@128: ; 
@866:
@856:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@853:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_msr$qv+0
	dd        @853+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_msr$qv	endp
@stk@cpu@cpu_has_msr$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	70
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch278
	dd	?patch279
	dd	?patch280
	df	@@stk@cpu@cpu_has_msr$qv
	dw	0
	dw	4214
	dw	0
	dw	486
	dw	0
	dw	0
	dw	0
	db	23
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	109
	db	115
	db	114
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	487
	dw	0
	dw	0
	dw	0
	dw	?patch281
	dw	529
	dw	?patch282
	dd	?live16442@112-@@stk@cpu@cpu_has_msr$qv
	dd	?live16442@128-?live16442@112
	dw	1
?patch282	equ	1
?patch281	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	488
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	489
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	490
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	491
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$anmmfcia
	dw	0
	dw	4102
	dw	0
	dw	492
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	493
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ijmmfcia
	dw	0
	dw	117
	dw	0
	dw	494
	dw	0
	dw	0
	dw	0
?patch278	equ	@866-@@stk@cpu@cpu_has_msr$qv+72
?patch279	equ	0
?patch280	equ	@866-@@stk@cpu@cpu_has_msr$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ianmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aenmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_tsc$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_tsc$qv	proc	near
?live16443@0:
	?debug L 1872
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @867
@868:
	mov       ebx,offset $aenmfcia
	?debug L 1878
?live16443@16: ; EBX = &$aenmfcia
	mov       eax,dword ptr [$ianmfcia]
	cmp       eax,-1
	je        short @872
	?debug L 1879
?live16443@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @870
	?debug L 1881
?live16443@48: ; EBX = &$aenmfcia
@871:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@872:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @871
	cmp       dword ptr [ebx],0
	jne       short @871
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @875
@874:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@875:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @878
	cmp       dword ptr [ebx],0
@878:
	je        short @876
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @879
	cmp       eax,dword ptr [ebp-20]
@879:
	setne     al
	and       eax,1
	jmp       short @877
@876:
	xor       eax,eax
@877:
	test      al,al
	jne       short @874
	?debug L 1884
	push      0
	push      1
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1886
	mov       eax,dword ptr [ebp-28]
	and       eax,16
	mov       dword ptr [$ianmfcia],eax
	?debug L 1887
?live16443@96: ; EBX = &$aenmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1888
?live16443@112: ; EBX = &$aenmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1890
?live16443@128: ; 
@880:
@870:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@867:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_tsc$qv+0
	dd        @867+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_tsc$qv	endp
@stk@cpu@cpu_has_tsc$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	70
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch283
	dd	?patch284
	dd	?patch285
	df	@@stk@cpu@cpu_has_tsc$qv
	dw	0
	dw	4216
	dw	0
	dw	495
	dw	0
	dw	0
	dw	0
	db	23
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	116
	db	115
	db	99
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	496
	dw	0
	dw	0
	dw	0
	dw	?patch286
	dw	529
	dw	?patch287
	dd	?live16443@112-@@stk@cpu@cpu_has_tsc$qv
	dd	?live16443@128-?live16443@112
	dw	1
?patch287	equ	1
?patch286	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	497
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	498
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	499
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	500
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aenmfcia
	dw	0
	dw	4102
	dw	0
	dw	501
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	502
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ianmfcia
	dw	0
	dw	117
	dw	0
	dw	503
	dw	0
	dw	0
	dw	0
?patch283	equ	@880-@@stk@cpu@cpu_has_tsc$qv+74
?patch284	equ	0
?patch285	equ	@880-@@stk@cpu@cpu_has_tsc$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ihnmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$alnmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_psn$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_psn$qv	proc	near
?live16444@0:
	?debug L 1893
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @881
@882:
	mov       ebx,offset $alnmfcia
	?debug L 1899
?live16444@16: ; EBX = &$alnmfcia
	mov       eax,dword ptr [$ihnmfcia]
	cmp       eax,-1
	je        short @886
	?debug L 1900
?live16444@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @884
	?debug L 1902
?live16444@48: ; EBX = &$alnmfcia
@885:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@886:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @885
	cmp       dword ptr [ebx],0
	jne       short @885
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @889
@888:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@889:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @892
	cmp       dword ptr [ebx],0
@892:
	je        short @890
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @893
	cmp       eax,dword ptr [ebp-20]
@893:
	setne     al
	and       eax,1
	jmp       short @891
@890:
	xor       eax,eax
@891:
	test      al,al
	jne       short @888
	?debug L 1905
	push      0
	push      1
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1907
	mov       eax,dword ptr [ebp-28]
	and       eax,262144
	mov       dword ptr [$ihnmfcia],eax
	?debug L 1908
?live16444@96: ; EBX = &$alnmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1909
?live16444@112: ; EBX = &$alnmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1911
?live16444@128: ; 
@894:
@884:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@881:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_psn$qv+0
	dd        @881+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_psn$qv	endp
@stk@cpu@cpu_has_psn$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	70
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch288
	dd	?patch289
	dd	?patch290
	df	@@stk@cpu@cpu_has_psn$qv
	dw	0
	dw	4218
	dw	0
	dw	504
	dw	0
	dw	0
	dw	0
	db	23
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	112
	db	115
	db	110
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	505
	dw	0
	dw	0
	dw	0
	dw	?patch291
	dw	529
	dw	?patch292
	dd	?live16444@112-@@stk@cpu@cpu_has_psn$qv
	dd	?live16444@128-?live16444@112
	dw	1
?patch292	equ	1
?patch291	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	506
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	507
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	508
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	509
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$alnmfcia
	dw	0
	dw	4102
	dw	0
	dw	510
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	511
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ihnmfcia
	dw	0
	dw	117
	dw	0
	dw	512
	dw	0
	dw	0
	dw	0
?patch288	equ	@894-@@stk@cpu@cpu_has_psn$qv+72
?patch289	equ	0
?patch290	equ	@894-@@stk@cpu@cpu_has_psn$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ionmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$acomfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_xsave$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_xsave$qv	proc	near
?live16445@0:
	?debug L 1914
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @895
@896:
	mov       ebx,offset $acomfcia
	?debug L 1920
?live16445@16: ; EBX = &$acomfcia
	mov       eax,dword ptr [$ionmfcia]
	cmp       eax,-1
	je        short @900
	?debug L 1921
?live16445@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @898
	?debug L 1923
?live16445@48: ; EBX = &$acomfcia
@899:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@900:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @899
	cmp       dword ptr [ebx],0
	jne       short @899
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @903
@902:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@903:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @906
	cmp       dword ptr [ebx],0
@906:
	je        short @904
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @907
	cmp       eax,dword ptr [ebp-20]
@907:
	setne     al
	and       eax,1
	jmp       short @905
@904:
	xor       eax,eax
@905:
	test      al,al
	jne       short @902
	?debug L 1926
	push      0
	push      1
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1928
	mov       eax,dword ptr [ebp-36]
	mov       edx,dword ptr [ebp-36]
	and       edx,134217728
	and       eax,67108864
	shr       edx,27
	?debug L 1926
	add       esp,24
	?debug L 1928
	shr       eax,26
	and       eax,edx
	?debug L 1930
?live16445@128: ; EBX = &$acomfcia, EAX = ret
	push      8
	?debug L 1929
?live16445@144: ; EBX = &$acomfcia, EAX = @temp3
	test      eax,eax
	?debug L 1928
?live16445@160: ; EBX = &$acomfcia
	mov       dword ptr [$ionmfcia],eax
	?debug L 1929
?live16445@176: ; EBX = &$acomfcia, EAX = @temp3
	setne     cl
	and       ecx,1
	?debug L 1930
?live16445@192: ; EBX = &$acomfcia, EAX = ret
	push      ebx
	?debug L 1929
?live16445@208: ; EBX = &$acomfcia, EAX = @temp3
	mov       eax,ecx
	?debug L 1930
?live16445@224: ; EBX = &$acomfcia, EAX = ret
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1932
?live16445@240: ; 
@908:
@898:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@895:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_xsave$qv+0
	dd        @895+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_xsave$qv	endp
@stk@cpu@cpu_has_xsave$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	72
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch293
	dd	?patch294
	dd	?patch295
	df	@@stk@cpu@cpu_has_xsave$qv
	dw	0
	dw	4220
	dw	0
	dw	513
	dw	0
	dw	0
	dw	0
	db	25
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	120
	db	115
	db	97
	db	118
	db	101
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	514
	dw	0
	dw	0
	dw	0
	dw	?patch296
	dw	529
	dw	?patch297
	dd	?live16445@128-@@stk@cpu@cpu_has_xsave$qv
	dd	?live16445@144-?live16445@128
	dw	1
	dd	?live16445@192-@@stk@cpu@cpu_has_xsave$qv
	dd	?live16445@208-?live16445@192
	dw	1
	dd	?live16445@224-@@stk@cpu@cpu_has_xsave$qv
	dd	?live16445@240-?live16445@224
	dw	1
?patch297	equ	3
?patch296	equ	34
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	515
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	516
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	517
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	518
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$acomfcia
	dw	0
	dw	4102
	dw	0
	dw	519
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	520
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ionmfcia
	dw	0
	dw	117
	dw	0
	dw	521
	dw	0
	dw	0
	dw	0
?patch293	equ	@908-@@stk@cpu@cpu_has_xsave$qv+75
?patch294	equ	0
?patch295	equ	@908-@@stk@cpu@cpu_has_xsave$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ifomfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ajomfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_clmul$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_clmul$qv	proc	near
?live16446@0:
	?debug L 1935
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @909
@910:
	mov       ebx,offset $ajomfcia
	?debug L 1941
?live16446@16: ; EBX = &$ajomfcia
	mov       eax,dword ptr [$ifomfcia]
	cmp       eax,-1
	je        short @914
	?debug L 1942
?live16446@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @912
	?debug L 1944
?live16446@48: ; EBX = &$ajomfcia
@913:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@914:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @913
	cmp       dword ptr [ebx],0
	jne       short @913
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @917
@916:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@917:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @920
	cmp       dword ptr [ebx],0
@920:
	je        short @918
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @921
	cmp       eax,dword ptr [ebp-20]
@921:
	setne     al
	and       eax,1
	jmp       short @919
@918:
	xor       eax,eax
@919:
	test      al,al
	jne       short @916
	?debug L 1947
	push      0
	push      1
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1949
	mov       eax,dword ptr [ebp-36]
	and       eax,4
	mov       dword ptr [$ifomfcia],eax
	?debug L 1950
?live16446@96: ; EBX = &$ajomfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1951
?live16446@112: ; EBX = &$ajomfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1953
?live16446@128: ; 
@922:
@912:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@909:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_clmul$qv+0
	dd        @909+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_clmul$qv	endp
@stk@cpu@cpu_has_clmul$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	72
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch298
	dd	?patch299
	dd	?patch300
	df	@@stk@cpu@cpu_has_clmul$qv
	dw	0
	dw	4222
	dw	0
	dw	522
	dw	0
	dw	0
	dw	0
	db	25
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	99
	db	108
	db	109
	db	117
	db	108
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	523
	dw	0
	dw	0
	dw	0
	dw	?patch301
	dw	529
	dw	?patch302
	dd	?live16446@112-@@stk@cpu@cpu_has_clmul$qv
	dd	?live16446@128-?live16446@112
	dw	1
?patch302	equ	1
?patch301	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	524
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	525
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	526
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	527
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ajomfcia
	dw	0
	dw	4102
	dw	0
	dw	528
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	529
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ifomfcia
	dw	0
	dw	117
	dw	0
	dw	530
	dw	0
	dw	0
	dw	0
?patch298	equ	@922-@@stk@cpu@cpu_has_clmul$qv+74
?patch299	equ	0
?patch300	equ	@922-@@stk@cpu@cpu_has_clmul$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$imomfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aapmfcia	label	dword
	dd	0
	dd	0
	dd	0
	db	1	dup(?)
	align	4
$idpmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_psn$qv	segment virtual
	align	2
@@stk@cpu@cpu_psn$qv	proc	near
?live16447@0:
	?debug L 1956
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @923
@924:
	mov       ebx,offset $idpmfcia
	mov       esi,offset $aapmfcia
	?debug L 1963
?live16447@16: ; EBX = &$idpmfcia, ESI = &$aapmfcia
	cmp       dword ptr [$imomfcia],-1
	je        short @928
	?debug L 1964
?live16447@32: ; ESI = &$aapmfcia
	mov       eax,esi
	jmp       @926
	?debug L 1966
?live16447@48: ; EBX = &$idpmfcia, ESI = &$aapmfcia
@927:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@928:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @927
	cmp       dword ptr [ebx],0
	jne       short @927
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],edx
	jmp       short @931
@930:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@931:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @934
	cmp       dword ptr [ebx],0
@934:
	je        short @932
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @935
	cmp       eax,dword ptr [ebp-20]
@935:
	setne     cl
	and       ecx,1
	jmp       short @933
@932:
	xor       ecx,ecx
@933:
	test      cl,cl
	jne       short @930
	?debug L 1968
	push      4
	push      esi
	call      _CG_D_EP
	xor       eax,eax
	mov       dword ptr [esi],eax
	?debug L 1969
	push      4
	push      esi
	push      4
	call      _CG_DA_EPY
	xor       edx,edx
	mov       dword ptr [esi+4],edx
	?debug L 1970
	push      4
	push      esi
	push      8
	call      _CG_DA_EPY
	xor       eax,eax
	mov       dword ptr [esi+8],eax
	?debug L 1971
	call      @@stk@cpu@cpu_has_psn$qv
	test      al,al
	jne       short @936
	?debug L 1972
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1973
?live16447@144: ; ESI = &$aapmfcia
	mov       eax,esi
	jmp       short @926
	?debug L 1977
?live16447@160: ; EBX = &$idpmfcia, ESI = &$aapmfcia
@936:
	push      0
	push      3
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1979
	mov       ecx,dword ptr [ebp-52]
	push      4
	push      esi
	push      8
	call      _CG_DA_EPY
	mov       dword ptr [esi+8],ecx
	?debug L 1980
	mov       eax,dword ptr [ebp-28]
	push      4
	push      esi
	push      4
	call      _CG_DA_EPY
	mov       dword ptr [esi+4],eax
	?debug L 1981
	mov       edx,dword ptr [ebp-36]
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],edx
	?debug L 1982
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1983
?live16447@240: ; ESI = &$aapmfcia
	mov       eax,esi
	?debug L 1982
?live16447@256: ; EBX = &$idpmfcia, ESI = &$aapmfcia
	mov       dword ptr [ebx+4],0
	?debug L 1984
?live16447@272: ; 
@937:
@926:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@923:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_psn$qv+0
	dd        @923+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_psn$qv	endp
@stk@cpu@cpu_psn$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	66
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch303
	dd	?patch304
	dd	?patch305
	df	@@stk@cpu@cpu_psn$qv
	dw	0
	dw	4224
	dw	0
	dw	531
	dw	0
	dw	0
	dw	0
	db	19
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	112
	db	115
	db	110
	db	36
	db	113
	db	118
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	532
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	533
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	534
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	535
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$idpmfcia
	dw	0
	dw	4102
	dw	0
	dw	536
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	537
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aapmfcia
	dw	0
	dw	4226
	dw	0
	dw	538
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$imomfcia
	dw	0
	dw	117
	dw	0
	dw	539
	dw	0
	dw	0
	dw	0
?patch303	equ	@937-@@stk@cpu@cpu_psn$qv+75
?patch304	equ	0
?patch305	equ	@937-@@stk@cpu@cpu_psn$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	5
	dw	65476
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ahpmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ikpmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_fma$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_fma$qv	proc	near
?live16448@0:
	?debug L 1987
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @938
@939:
	mov       ebx,offset $ikpmfcia
	?debug L 1993
?live16448@16: ; EBX = &$ikpmfcia
	mov       eax,dword ptr [$ahpmfcia]
	cmp       eax,-1
	jne       @941
	?debug L 1994
?live16448@32: ; EAX = @temp3
	jmp       short @943
	?debug L 1996
?live16448@48: ; EBX = &$ikpmfcia
@942:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@943:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @942
	cmp       dword ptr [ebx],0
	jne       short @942
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],edx
	jmp       short @946
@945:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@946:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @949
	cmp       dword ptr [ebx],0
@949:
	je        short @947
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @950
	cmp       eax,dword ptr [ebp-20]
@950:
	setne     cl
	and       ecx,1
	jmp       short @948
@947:
	xor       ecx,ecx
@948:
	test      cl,cl
	jne       short @945
	?debug L 1999
	push      0
	push      1
	lea       eax,dword ptr [ebp-28]
	push      eax
	lea       edx,dword ptr [ebp-36]
	push      edx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 2001
	test      byte ptr [ebp-35],16
	je        short @951
	?debug L 2002
	push      0
	push      -2147483647
	lea       ecx,dword ptr [ebp-28]
	push      ecx
	lea       eax,dword ptr [ebp-36]
	push      eax
	lea       edx,dword ptr [ebp-44]
	push      edx
	lea       ecx,dword ptr [ebp-52]
	push      ecx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 2003
	test      byte ptr [ebp-34],1
	je        short @952
	?debug L 2004
	mov       dword ptr [$ahpmfcia],4
	jmp       short @953
	?debug L 2006
@952:
	mov       dword ptr [$ahpmfcia],3
	?debug L 2007
	jmp       short @953
	?debug L 2009
@951:
	xor       eax,eax
	mov       dword ptr [$ahpmfcia],eax
	?debug L 2011
@953:
	cmp       dword ptr [$ahpmfcia],0
	setne     al
	and       eax,1
	?debug L 2012
?live16448@208: ; EBX = &$ikpmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 2013
?live16448@224: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	?debug L 2012
?live16448@240: ; EBX = &$ikpmfcia, EAX = ret
	mov       dword ptr [ebx+4],0
	?debug L 2013
?live16448@256: ; EAX = ret
	mov       eax,edx
	?debug L 2014
?live16448@272: ; 
@954:
@941:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@938:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_fma$qv+0
	dd        @938+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_fma$qv	endp
@stk@cpu@cpu_has_fma$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	70
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch306
	dd	?patch307
	dd	?patch308
	df	@@stk@cpu@cpu_has_fma$qv
	dw	0
	dw	4227
	dw	0
	dw	540
	dw	0
	dw	0
	dw	0
	db	23
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	102
	db	109
	db	97
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	541
	dw	0
	dw	0
	dw	0
	dw	?patch309
	dw	529
	dw	?patch310
	dd	?live16448@208-@@stk@cpu@cpu_has_fma$qv
	dd	?live16448@272-?live16448@208
	dw	1
?patch310	equ	1
?patch309	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	542
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	543
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	544
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	545
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ikpmfcia
	dw	0
	dw	4102
	dw	0
	dw	546
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	547
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ahpmfcia
	dw	0
	dw	117
	dw	0
	dw	548
	dw	0
	dw	0
	dw	0
?patch306	equ	@954-@@stk@cpu@cpu_has_fma$qv+75
?patch307	equ	0
?patch308	equ	@954-@@stk@cpu@cpu_has_fma$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$aopmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ibanfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_aes$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_aes$qv	proc	near
?live16449@0:
	?debug L 2017
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @955
@956:
	mov       ebx,offset $ibanfcia
	?debug L 2023
?live16449@16: ; EBX = &$ibanfcia
	mov       eax,dword ptr [$aopmfcia]
	cmp       eax,-1
	je        short @960
	?debug L 2024
?live16449@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @958
	?debug L 2026
?live16449@48: ; EBX = &$ibanfcia
@959:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@960:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @959
	cmp       dword ptr [ebx],0
	jne       short @959
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @963
@962:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@963:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @966
	cmp       dword ptr [ebx],0
@966:
	je        short @964
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @967
	cmp       eax,dword ptr [ebp-20]
@967:
	setne     al
	and       eax,1
	jmp       short @965
@964:
	xor       eax,eax
@965:
	test      al,al
	jne       short @962
	?debug L 2029
	push      0
	push      1
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 2031
	mov       eax,dword ptr [ebp-36]
	and       eax,33554432
	mov       dword ptr [$aopmfcia],eax
	?debug L 2032
?live16449@96: ; EBX = &$ibanfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2033
?live16449@112: ; EBX = &$ibanfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2035
?live16449@128: ; 
@968:
@958:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@955:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_aes$qv+0
	dd        @955+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_aes$qv	endp
@stk@cpu@cpu_has_aes$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	70
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch311
	dd	?patch312
	dd	?patch313
	df	@@stk@cpu@cpu_has_aes$qv
	dw	0
	dw	4229
	dw	0
	dw	549
	dw	0
	dw	0
	dw	0
	db	23
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	97
	db	101
	db	115
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	550
	dw	0
	dw	0
	dw	0
	dw	?patch314
	dw	529
	dw	?patch315
	dd	?live16449@112-@@stk@cpu@cpu_has_aes$qv
	dd	?live16449@128-?live16449@112
	dw	1
?patch315	equ	1
?patch314	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	551
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	552
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	553
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	554
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ibanfcia
	dw	0
	dw	4102
	dw	0
	dw	555
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	556
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aopmfcia
	dw	0
	dw	117
	dw	0
	dw	557
	dw	0
	dw	0
	dw	0
?patch311	equ	@968-@@stk@cpu@cpu_has_aes$qv+72
?patch312	equ	0
?patch313	equ	@968-@@stk@cpu@cpu_has_aes$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$afanfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$iianfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viaaes$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viaaes$qv	proc	near
?live16450@0:
	?debug L 2038
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @969
@970:
	mov       ebx,offset $iianfcia
	?debug L 2044
?live16450@16: ; EBX = &$iianfcia
	mov       eax,dword ptr [$afanfcia]
	cmp       eax,-1
	je        short @974
	?debug L 2045
?live16450@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @972
	?debug L 2047
?live16450@48: ; EBX = &$iianfcia
@973:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@974:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @973
	cmp       dword ptr [ebx],0
	jne       short @973
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @977
@976:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@977:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @980
	cmp       dword ptr [ebx],0
@980:
	je        short @978
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @981
	cmp       eax,dword ptr [ebp-20]
@981:
	setne     al
	and       eax,1
	jmp       short @979
@978:
	xor       eax,eax
@979:
	test      al,al
	jne       short @976
	?debug L 2050
	push      0
	push      -1073741823
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 2052
	mov       eax,dword ptr [ebp-28]
	and       eax,128
	mov       dword ptr [$afanfcia],eax
	?debug L 2053
?live16450@96: ; EBX = &$iianfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2054
?live16450@112: ; EBX = &$iianfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2056
?live16450@128: ; 
@982:
@972:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@969:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_viaaes$qv+0
	dd        @969+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_viaaes$qv	endp
@stk@cpu@cpu_has_viaaes$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	73
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch316
	dd	?patch317
	dd	?patch318
	df	@@stk@cpu@cpu_has_viaaes$qv
	dw	0
	dw	4231
	dw	0
	dw	558
	dw	0
	dw	0
	dw	0
	db	26
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	118
	db	105
	db	97
	db	97
	db	101
	db	115
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	559
	dw	0
	dw	0
	dw	0
	dw	?patch319
	dw	529
	dw	?patch320
	dd	?live16450@112-@@stk@cpu@cpu_has_viaaes$qv
	dd	?live16450@128-?live16450@112
	dw	1
?patch320	equ	1
?patch319	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	560
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	561
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	562
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	563
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iianfcia
	dw	0
	dw	4102
	dw	0
	dw	564
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	565
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$afanfcia
	dw	0
	dw	117
	dw	0
	dw	566
	dw	0
	dw	0
	dw	0
?patch316	equ	@982-@@stk@cpu@cpu_has_viaaes$qv+73
?patch317	equ	0
?patch318	equ	@982-@@stk@cpu@cpu_has_viaaes$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$amanfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ipanfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viarng$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viarng$qv	proc	near
?live16451@0:
	?debug L 2059
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @983
@984:
	mov       ebx,offset $ipanfcia
	?debug L 2065
?live16451@16: ; EBX = &$ipanfcia
	mov       eax,dword ptr [$amanfcia]
	cmp       eax,-1
	je        short @988
	?debug L 2066
?live16451@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @986
	?debug L 2068
?live16451@48: ; EBX = &$ipanfcia
@987:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@988:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @987
	cmp       dword ptr [ebx],0
	jne       short @987
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @991
@990:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@991:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @994
	cmp       dword ptr [ebx],0
@994:
	je        short @992
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @995
	cmp       eax,dword ptr [ebp-20]
@995:
	setne     al
	and       eax,1
	jmp       short @993
@992:
	xor       eax,eax
@993:
	test      al,al
	jne       short @990
	?debug L 2071
	push      0
	push      -1073741823
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 2073
	mov       eax,dword ptr [ebp-28]
	and       eax,8
	mov       dword ptr [$amanfcia],eax
	?debug L 2074
?live16451@96: ; EBX = &$ipanfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2075
?live16451@112: ; EBX = &$ipanfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2077
?live16451@128: ; 
@996:
@986:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@983:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_viarng$qv+0
	dd        @983+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_viarng$qv	endp
@stk@cpu@cpu_has_viarng$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	73
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch321
	dd	?patch322
	dd	?patch323
	df	@@stk@cpu@cpu_has_viarng$qv
	dw	0
	dw	4233
	dw	0
	dw	567
	dw	0
	dw	0
	dw	0
	db	26
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	118
	db	105
	db	97
	db	114
	db	110
	db	103
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	568
	dw	0
	dw	0
	dw	0
	dw	?patch324
	dw	529
	dw	?patch325
	dd	?live16451@112-@@stk@cpu@cpu_has_viarng$qv
	dd	?live16451@128-?live16451@112
	dw	1
?patch325	equ	1
?patch324	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	569
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	570
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	571
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	572
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ipanfcia
	dw	0
	dw	4102
	dw	0
	dw	573
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	574
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$amanfcia
	dw	0
	dw	117
	dw	0
	dw	575
	dw	0
	dw	0
	dw	0
?patch321	equ	@996-@@stk@cpu@cpu_has_viarng$qv+75
?patch322	equ	0
?patch323	equ	@996-@@stk@cpu@cpu_has_viarng$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$adbnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$igbnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viahash$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viahash$qv	proc	near
?live16452@0:
	?debug L 2080
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @997
@998:
	mov       ebx,offset $igbnfcia
	?debug L 2086
?live16452@16: ; EBX = &$igbnfcia
	mov       eax,dword ptr [$adbnfcia]
	cmp       eax,-1
	je        short @1002
	?debug L 2087
?live16452@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @1000
	?debug L 2089
?live16452@48: ; EBX = &$igbnfcia
@1001:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1002:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1001
	cmp       dword ptr [ebx],0
	jne       short @1001
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @1005
@1004:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1005:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1008
	cmp       dword ptr [ebx],0
@1008:
	je        short @1006
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @1009
	cmp       eax,dword ptr [ebp-20]
@1009:
	setne     al
	and       eax,1
	jmp       short @1007
@1006:
	xor       eax,eax
@1007:
	test      al,al
	jne       short @1004
	?debug L 2092
	push      0
	push      -1073741823
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 2094
	mov       eax,dword ptr [ebp-28]
	and       eax,2048
	mov       dword ptr [$adbnfcia],eax
	?debug L 2095
?live16452@96: ; EBX = &$igbnfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2096
?live16452@112: ; EBX = &$igbnfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2098
?live16452@128: ; 
@1010:
@1000:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@997:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_viahash$qv+0
	dd        @997+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_viahash$qv	endp
@stk@cpu@cpu_has_viahash$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	74
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch326
	dd	?patch327
	dd	?patch328
	df	@@stk@cpu@cpu_has_viahash$qv
	dw	0
	dw	4235
	dw	0
	dw	576
	dw	0
	dw	0
	dw	0
	db	27
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	118
	db	105
	db	97
	db	104
	db	97
	db	115
	db	104
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	577
	dw	0
	dw	0
	dw	0
	dw	?patch329
	dw	529
	dw	?patch330
	dd	?live16452@112-@@stk@cpu@cpu_has_viahash$qv
	dd	?live16452@128-?live16452@112
	dw	1
?patch330	equ	1
?patch329	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	578
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	579
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	580
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	581
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$igbnfcia
	dw	0
	dw	4102
	dw	0
	dw	582
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	583
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$adbnfcia
	dw	0
	dw	117
	dw	0
	dw	584
	dw	0
	dw	0
	dw	0
?patch326	equ	@1010-@@stk@cpu@cpu_has_viahash$qv+73
?patch327	equ	0
?patch328	equ	@1010-@@stk@cpu@cpu_has_viahash$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$akbnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$inbnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_rdseed$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_rdseed$qv	proc	near
?live16453@0:
	?debug L 2101
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @1011
@1012:
	mov       ebx,offset $inbnfcia
	?debug L 2107
?live16453@16: ; EBX = &$inbnfcia
	mov       eax,dword ptr [$akbnfcia]
	cmp       eax,-1
	je        short @1016
	?debug L 2108
?live16453@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @1014
	?debug L 2110
?live16453@48: ; EBX = &$inbnfcia
@1015:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1016:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1015
	cmp       dword ptr [ebx],0
	jne       short @1015
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @1019
@1018:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1019:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1022
	cmp       dword ptr [ebx],0
@1022:
	je        short @1020
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @1023
	cmp       eax,dword ptr [ebp-20]
@1023:
	setne     al
	and       eax,1
	jmp       short @1021
@1020:
	xor       eax,eax
@1021:
	test      al,al
	jne       short @1018
	?debug L 2113
	push      0
	push      7
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 2115
	mov       eax,dword ptr [ebp-44]
	and       eax,262144
	mov       dword ptr [$akbnfcia],eax
	?debug L 2116
?live16453@96: ; EBX = &$inbnfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2117
?live16453@112: ; EBX = &$inbnfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2119
?live16453@128: ; 
@1024:
@1014:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1011:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_rdseed$qv+0
	dd        @1011+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_rdseed$qv	endp
@stk@cpu@cpu_has_rdseed$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	73
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch331
	dd	?patch332
	dd	?patch333
	df	@@stk@cpu@cpu_has_rdseed$qv
	dw	0
	dw	4237
	dw	0
	dw	585
	dw	0
	dw	0
	dw	0
	db	26
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	114
	db	100
	db	115
	db	101
	db	101
	db	100
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	586
	dw	0
	dw	0
	dw	0
	dw	?patch334
	dw	529
	dw	?patch335
	dd	?live16453@112-@@stk@cpu@cpu_has_rdseed$qv
	dd	?live16453@128-?live16453@112
	dw	1
?patch335	equ	1
?patch334	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	587
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	588
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	589
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	590
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$inbnfcia
	dw	0
	dw	4102
	dw	0
	dw	591
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	592
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$akbnfcia
	dw	0
	dw	117
	dw	0
	dw	593
	dw	0
	dw	0
	dw	0
?patch331	equ	@1024-@@stk@cpu@cpu_has_rdseed$qv+72
?patch332	equ	0
?patch333	equ	@1024-@@stk@cpu@cpu_has_rdseed$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$abcnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$iecnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_rdrand$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_rdrand$qv	proc	near
?live16454@0:
	?debug L 2122
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @1025
@1026:
	mov       ebx,offset $iecnfcia
	?debug L 2128
?live16454@16: ; EBX = &$iecnfcia
	mov       eax,dword ptr [$abcnfcia]
	cmp       eax,-1
	je        short @1030
	?debug L 2129
?live16454@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @1028
	?debug L 2131
?live16454@48: ; EBX = &$iecnfcia
@1029:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1030:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1029
	cmp       dword ptr [ebx],0
	jne       short @1029
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],ecx
	jmp       short @1033
@1032:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1033:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1036
	cmp       dword ptr [ebx],0
@1036:
	je        short @1034
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @1037
	cmp       eax,dword ptr [ebp-20]
@1037:
	setne     al
	and       eax,1
	jmp       short @1035
@1034:
	xor       eax,eax
@1035:
	test      al,al
	jne       short @1032
	?debug L 2134
	push      0
	push      1
	lea       edx,dword ptr [ebp-28]
	push      edx
	lea       ecx,dword ptr [ebp-36]
	push      ecx
	lea       eax,dword ptr [ebp-44]
	push      eax
	lea       edx,dword ptr [ebp-52]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 2136
	mov       eax,dword ptr [ebp-36]
	and       eax,1073741824
	mov       dword ptr [$abcnfcia],eax
	?debug L 2137
?live16454@96: ; EBX = &$iecnfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2138
?live16454@112: ; EBX = &$iecnfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2140
?live16454@128: ; 
@1038:
@1028:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1025:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_rdrand$qv+0
	dd        @1025+0
	db        204,255,255,255,8,0,0,0,5,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0,204,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@cpu_has_rdrand$qv	endp
@stk@cpu@cpu_has_rdrand$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	73
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch336
	dd	?patch337
	dd	?patch338
	df	@@stk@cpu@cpu_has_rdrand$qv
	dw	0
	dw	4239
	dw	0
	dw	594
	dw	0
	dw	0
	dw	0
	db	26
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	104
	db	97
	db	115
	db	95
	db	114
	db	100
	db	114
	db	97
	db	110
	db	100
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	48
	dw	0
	dw	1
	dw	595
	dw	0
	dw	0
	dw	0
	dw	?patch339
	dw	529
	dw	?patch340
	dd	?live16454@112-@@stk@cpu@cpu_has_rdrand$qv
	dd	?live16454@128-?live16454@112
	dw	1
?patch340	equ	1
?patch339	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	596
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	597
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	598
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	599
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iecnfcia
	dw	0
	dw	4102
	dw	0
	dw	600
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	601
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$abcnfcia
	dw	0
	dw	117
	dw	0
	dw	602
	dw	0
	dw	0
	dw	0
?patch336	equ	@1038-@@stk@cpu@cpu_has_rdrand$qv+72
?patch337	equ	0
?patch338	equ	@1038-@@stk@cpu@cpu_has_rdrand$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65480
	dw	65535
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_print_info$qv	segment virtual
	align	2
@@stk@cpu@cpu_print_info$qv	proc	near
?live16455@0:
	?debug L 2149
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	push      ebx
	mov       dword ptr [ebp-8],offset @1039
@1040:
	mov       ebx,offset s@
	?debug L 2155
?live16455@16: ; EBX = &s@
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	push      ebx
	push      39
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+39]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,8
	?debug L 2156
	call      @@stk@cpu@cpu_name$qv
	push      eax
	push      ebx
	push      52
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+52]
	push      edx
	call      @@stk@con@prints$qpxce
	add       esp,8
	?debug L 2157
	push      1
	call      @@stk@cpu@cpu_num_mhz$qo
	pop       ecx
	push      eax
	push      ebx
	push      73
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+73]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,8
	?debug L 2158
	push      0
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1041
	push      ebx
	push      125
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+125]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1042
@1041:
	push      ebx
	push      125
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+125]
	push      eax
	push      ebx
	push      123
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+123]
	push      edx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+153]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2159
@1042:
	push      0
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1043
	push      ebx
	push      164
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+164]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1044
@1043:
	push      ebx
	push      164
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+164]
	push      eax
	push      ebx
	push      123
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+123]
	push      edx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+153]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2160
@1044:
	push      ebx
	push      197
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+197]
	push      eax
	call      @@stk@con@prints$qpxce
	pop       ecx
	?debug L 2161
	push      1
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1045
	push      ebx
	push      239
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+239]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1046
@1045:
	push      ebx
	push      239
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+239]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2162
@1046:
	push      1
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1047
	push      ebx
	push      267
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+267]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1048
@1047:
	push      ebx
	push      267
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+267]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2163
@1048:
	push      2
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1049
	push      ebx
	push      300
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+300]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1050
@1049:
	push      ebx
	push      300
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+300]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2164
@1050:
	push      2
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1051
	push      ebx
	push      328
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+328]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1052
@1051:
	push      ebx
	push      328
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+328]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2165
@1052:
	push      3
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1053
	push      ebx
	push      361
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+361]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1054
@1053:
	push      ebx
	push      361
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+361]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2166
@1054:
	push      3
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1055
	push      ebx
	push      389
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+389]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1056
@1055:
	push      ebx
	push      389
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+389]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2167
@1056:
	call      @@stk@cpu@cpu_num_cores$qv
	test      eax,eax
	je        short @1057
	push      ebx
	push      422
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+422]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1058
@1057:
	push      ebx
	push      422
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+422]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2168
@1058:
	call      @@stk@cpu@cpu_num_threads$qv
	test      eax,eax
	je        short @1059
	push      ebx
	push      448
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+448]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1060
@1059:
	push      ebx
	push      448
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+448]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2170
@1060:
	call      @@stk@cpu@cpu_has_amd64$qv
	and       eax,255
	test      eax,eax
	je        short @1061
	push      ebx
	push      476
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+476]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1062
@1061:
	push      ebx
	push      476
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+476]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2171
@1062:
	call      @@stk@cpu@cpu_has_ht$qv
	and       eax,255
	test      eax,eax
	je        short @1063
	push      ebx
	push      502
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+502]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1064
@1063:
	push      ebx
	push      502
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+502]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2172
@1064:
	call      @@stk@cpu@cpu_has_mmx$qv
	and       eax,255
	test      eax,eax
	je        short @1065
	push      ebx
	push      525
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+525]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1066
@1065:
	push      ebx
	push      525
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+525]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2173
@1066:
	call      @@stk@cpu@cpu_has_mmxext$qv
	and       eax,255
	test      eax,eax
	je        short @1067
	push      ebx
	push      549
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+549]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1068
@1067:
	push      ebx
	push      549
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+549]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2174
@1068:
	call      @@stk@cpu@cpu_has_3dnow$qv
	test      eax,eax
	je        short @1069
	push      ebx
	push      576
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+576]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1070
@1069:
	push      ebx
	push      576
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+576]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2175
@1070:
	call      @@stk@cpu@cpu_has_3dnowprefetch$qv
	and       eax,255
	test      eax,eax
	je        short @1071
	push      ebx
	push      602
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+602]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1072
@1071:
	push      ebx
	push      602
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+602]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2176
@1072:
	call      @@stk@cpu@cpu_has_fxsr$qv
	and       eax,255
	test      eax,eax
	je        short @1073
	push      ebx
	push      636
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+636]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1074
@1073:
	push      ebx
	push      636
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+636]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2177
@1074:
	call      @@stk@cpu@cpu_has_sse$qv
	test      eax,eax
	je        short @1075
	push      ebx
	push      661
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+661]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1076
@1075:
	push      ebx
	push      661
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+661]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2178
@1076:
	call      @@stk@cpu@cpu_has_xsave$qv
	and       eax,255
	test      eax,eax
	je        short @1077
	push      ebx
	push      685
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+685]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1078
@1077:
	push      ebx
	push      685
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+685]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2179
@1078:
	call      @@stk@cpu@cpu_has_pclmulqdq$qv
	and       eax,255
	test      eax,eax
	je        short @1079
	push      ebx
	push      711
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+711]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1080
@1079:
	push      ebx
	push      711
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+711]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2180
@1080:
	call      @@stk@cpu@cpu_has_movbe$qv
	and       eax,255
	test      eax,eax
	je        short @1081
	push      ebx
	push      741
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+741]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1082
@1081:
	push      ebx
	push      741
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+741]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2181
@1082:
	call      @@stk@cpu@cpu_has_fma$qv
	test      eax,eax
	je        short @1083
	push      ebx
	push      767
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+767]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1084
@1083:
	push      ebx
	push      767
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+767]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2182
@1084:
	call      @@stk@cpu@cpu_has_popcnt$qv
	and       eax,255
	test      eax,eax
	je        short @1085
	push      ebx
	push      791
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+791]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1086
@1085:
	push      ebx
	push      791
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+791]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2183
@1086:
	call      @@stk@cpu@cpu_has_xop$qv
	and       eax,255
	test      eax,eax
	je        short @1087
	push      ebx
	push      818
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+818]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1088
@1087:
	push      ebx
	push      818
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+818]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2184
@1088:
	call      @@stk@cpu@cpu_has_lzcnt$qv
	and       eax,255
	test      eax,eax
	je        short @1089
	push      ebx
	push      842
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+842]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1090
@1089:
	push      ebx
	push      842
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+842]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2185
@1090:
	call      @@stk@cpu@cpu_has_f16c$qv
	and       eax,255
	test      eax,eax
	je        short @1091
	push      ebx
	push      868
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+868]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1092
@1091:
	push      ebx
	push      868
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+868]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2186
@1092:
	call      @@stk@cpu@cpu_has_avx$qv
	test      eax,eax
	je        short @1093
	push      ebx
	push      893
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+893]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1094
@1093:
	push      ebx
	push      893
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+893]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2187
@1094:
	call      @@stk@cpu@cpu_has_avx512f$qv
	and       eax,255
	test      eax,eax
	je        short @1095
	push      ebx
	push      917
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+917]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1096
@1095:
	push      ebx
	push      917
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+917]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2188
@1096:
	call      @@stk@cpu@cpu_has_avx512bw$qv
	and       eax,255
	test      eax,eax
	je        short @1097
	push      ebx
	push      945
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+945]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1098
@1097:
	push      ebx
	push      945
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+945]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2189
@1098:
	call      @@stk@cpu@cpu_has_avx512cd$qv
	and       eax,255
	test      eax,eax
	je        short @1099
	push      ebx
	push      974
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+974]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1100
@1099:
	push      ebx
	push      974
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+974]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2190
@1100:
	call      @@stk@cpu@cpu_has_avx512dq$qv
	and       eax,255
	test      eax,eax
	je        short @1101
	push      ebx
	push      1003
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1003]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1102
@1101:
	push      ebx
	push      1003
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1003]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2191
@1102:
	call      @@stk@cpu@cpu_has_avx512er$qv
	and       eax,255
	test      eax,eax
	je        short @1103
	push      ebx
	push      1032
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1032]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1104
@1103:
	push      ebx
	push      1032
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1032]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2192
@1104:
	call      @@stk@cpu@cpu_has_avx512pf$qv
	and       eax,255
	test      eax,eax
	je        short @1105
	push      ebx
	push      1061
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1061]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1106
@1105:
	push      ebx
	push      1061
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1061]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2193
@1106:
	call      @@stk@cpu@cpu_has_avx512vl$qv
	and       eax,255
	test      eax,eax
	je        short @1107
	push      ebx
	push      1090
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1090]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1108
@1107:
	push      ebx
	push      1090
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1090]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2194
@1108:
	call      @@stk@cpu@cpu_has_avx512ifma$qv
	and       eax,255
	test      eax,eax
	je        short @1109
	push      ebx
	push      1119
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1119]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1110
@1109:
	push      ebx
	push      1119
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1119]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2195
@1110:
	call      @@stk@cpu@cpu_has_bmi$qv
	test      eax,eax
	je        short @1111
	push      ebx
	push      1150
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1150]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1112
@1111:
	push      ebx
	push      1150
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1150]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2196
@1112:
	call      @@stk@cpu@cpu_has_avx512vbmi$qv
	and       eax,255
	test      eax,eax
	je        short @1113
	push      ebx
	push      1174
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1174]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1114
@1113:
	push      ebx
	push      1174
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1174]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2197
@1114:
	call      @@stk@cpu@cpu_has_cmov$qv
	and       eax,255
	test      eax,eax
	je        short @1115
	push      ebx
	push      1205
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1205]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1116
@1115:
	push      ebx
	push      1205
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1205]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2198
@1116:
	call      @@stk@cpu@cpu_has_cmpxchg$qv
	test      eax,eax
	je        short @1117
	push      ebx
	push      1230
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1230]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1118
@1117:
	push      ebx
	push      1230
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1230]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2199
@1118:
	call      @@stk@cpu@cpu_has_clmul$qv
	and       eax,255
	test      eax,eax
	je        short @1119
	push      ebx
	push      1258
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1258]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1120
@1119:
	push      ebx
	push      1258
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1258]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2200
@1120:
	call      @@stk@cpu@cpu_has_aes$qv
	and       eax,255
	test      eax,eax
	je        short @1121
	push      ebx
	push      1284
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1284]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1122
@1121:
	push      ebx
	push      1284
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1284]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2201
@1122:
	call      @@stk@cpu@cpu_has_sha$qv
	and       eax,255
	test      eax,eax
	je        short @1123
	push      ebx
	push      1308
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1308]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1124
@1123:
	push      ebx
	push      1308
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1308]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2202
@1124:
	call      @@stk@cpu@cpu_has_rdrand$qv
	and       eax,255
	test      eax,eax
	je        short @1125
	push      ebx
	push      1332
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1332]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1126
@1125:
	push      ebx
	push      1332
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1332]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2203
@1126:
	call      @@stk@cpu@cpu_has_rdseed$qv
	and       eax,255
	test      eax,eax
	je        short @1127
	push      ebx
	push      1359
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1359]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1128
@1127:
	push      ebx
	push      1359
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1359]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2204
@1128:
	call      @@stk@cpu@cpu_has_tsc$qv
	and       eax,255
	test      eax,eax
	je        short @1129
	push      ebx
	push      1386
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1386]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1130
@1129:
	push      ebx
	push      1386
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1386]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2205
@1130:
	call      @@stk@cpu@cpu_has_perftsc$qv
	and       eax,255
	test      eax,eax
	je        short @1131
	push      ebx
	push      1410
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1410]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1132
@1131:
	push      ebx
	push      1410
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1410]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2206
@1132:
	call      @@stk@cpu@cpu_has_erms$qv
	and       eax,255
	test      eax,eax
	je        short @1133
	push      ebx
	push      1438
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1438]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1134
@1133:
	push      ebx
	push      1438
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1438]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2207
@1134:
	call      @@stk@cpu@cpu_has_msr$qv
	and       eax,255
	test      eax,eax
	je        short @1135
	push      ebx
	push      1463
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1463]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1136
@1135:
	push      ebx
	push      1463
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1463]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2208
@1136:
	call      @@stk@cpu@cpu_has_mtrr$qv
	and       eax,255
	test      eax,eax
	je        short @1137
	push      ebx
	push      1487
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1487]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1138
@1137:
	push      ebx
	push      1487
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1487]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2209
@1138:
	call      @@stk@cpu@cpu_has_vmx$qv
	and       eax,255
	test      eax,eax
	je        short @1139
	push      ebx
	push      1512
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1512]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      eax
	push      ebx
	push      98
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1140
@1139:
	push      ebx
	push      1512
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1512]
	push      edx
	push      ebx
	push      123
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	push      ebx
	push      153
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2211
?live16455@880: ; 
@1140:
@1141:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@1039:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_print_info$qv+0
	dd        @1039+0
	db        248,255,255,255,8,0,0,0,0,0,0,0
	?debug L 0
@@stk@cpu@cpu_print_info$qv	endp
@stk@cpu@cpu_print_info$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	73
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch341
	dd	?patch342
	dd	?patch343
	df	@@stk@cpu@cpu_print_info$qv
	dw	0
	dw	4241
	dw	0
	dw	603
	dw	0
	dw	0
	dw	0
	db	26
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	112
	db	114
	db	105
	db	110
	db	116
	db	95
	db	105
	db	110
	db	102
	db	111
	db	36
	db	113
	db	118
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	604
	dw	0
	dw	0
	dw	0
?patch341	equ	@1141-@@stk@cpu@cpu_print_info$qv+35
?patch342	equ	0
?patch343	equ	@1141-@@stk@cpu@cpu_print_info$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65524
	dw	65535
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_test$qv	segment virtual
	align	2
@@stk@cpu@cpu_test$qv	proc	near
?live16456@0:
	?debug L 2214
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @1142
	?debug L 2219
@1143:
	call      @@stk@cpu@cpu_print_info$qv
	?debug L 2220
@1144:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@1142:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_test$qv+0
	dd        @1142+0
	db        248,255,255,255,8,0,0,0,0,0,0,0
	?debug L 0
@@stk@cpu@cpu_test$qv	endp
@stk@cpu@cpu_test$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	67
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch344
	dd	?patch345
	dd	?patch346
	df	@@stk@cpu@cpu_test$qv
	dw	0
	dw	4243
	dw	0
	dw	605
	dw	0
	dw	0
	dw	0
	db	20
	db	64
	db	115
	db	116
	db	107
	db	64
	db	99
	db	112
	db	117
	db	64
	db	99
	db	112
	db	117
	db	95
	db	116
	db	101
	db	115
	db	116
	db	36
	db	113
	db	118
?patch344	equ	@1144-@@stk@cpu@cpu_test$qv+31
?patch345	equ	0
?patch346	equ	@1144-@@stk@cpu@cpu_test$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
_INIT_	segment word public use32 'INITDATA'
_INIT_	ends
$$BSYMS	ends
_INIT_	segment word public use32 'INITDATA'
	db	0
	db	32
	dd	@_STCON0_$qv
_INIT_	ends
$$BSYMS	segment byte public use32 'DEBSYM'
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
	align	4
@_STCON0_$qv	proc	near
@@_STCON0_$qv equ @_STCON0_$qv
?live1@0:
	?debug L 0
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @1145
@1146:
	call      @@stk@cpu@tsc_init$qv
	mov       dword ptr [_tsc_ADJ],eax
	mov       dword ptr [_tsc_ADJ+4],edx
	?debug L 0
@1147:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@1145:
	db        67,71,83,0
	dd        @_STCON0_$qv+0
	dd        @1145+0
	db        248,255,255,255,8,0,0,0,0,0,0,0
	?debug L 0
@_STCON0_$qv	endp
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	46
	dw	516
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch347
	dd	?patch348
	dd	?patch349
	df	@_STCON0_$qv
	dw	0
	dw	4245
	dw	0
	dw	606
	dw	0
	dw	0
	dw	0
?patch347	equ	@1147-@_STCON0_$qv+31
?patch348	equ	0
?patch349	equ	@1147-@_STCON0_$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
s@	label	byte
	;	s@+0:
	db	"Unsupported",0,0
	;	s@+13:
	db	"GenuineIntel",0
	;	s@+26:
	db	"AuthenticAMD",0
	;	s@+39:
	db	"Vendor ",34
	;	s@+47:
	db	"%s",34,10,0
	;	s@+52:
	db	"Processor name ",34
	;	s@+68:
	db	"%s",34,10,0
	;	s@+73:
	db	"CPU Core Clock is %dMhz",10,0
	;	s@+98:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+123:
	db	" ",0
	;	s@+125:
	db	"stk::cpu::cpu_cache_size(0)",0
	;	s@+153:
	db	"NOT%21s%s",10,0
	;	s@+164:
	db	"stk::cpu::cpu_cache_line_size(0)",0
	;	s@+197:
	db	"Cache L1i, uOPS cache etc. = cache L0 :)",10,0
	;	s@+239:
	db	"stk::cpu::cpu_cache_size(1)",0
	;	s@+267:
	db	"stk::cpu::cpu_cache_line_size(1)",0
	;	s@+300:
	db	"stk::cpu::cpu_cache_size(2)",0
	;	s@+328:
	db	"stk::cpu::cpu_cache_line_size(2)",0
	;	s@+361:
	db	"stk::cpu::cpu_cache_size(3)",0
	;	s@+389:
	db	"stk::cpu::cpu_cache_line_size(3)",0
	;	s@+422:
	db	"stk::cpu::cpu_num_cores()",0
	;	s@+448:
	db	"stk::cpu::cpu_num_threads()",0
	;	s@+476:
	db	"stk::cpu::cpu_has_amd64()",0
	;	s@+502:
	db	"stk::cpu::cpu_has_ht()",0
	;	s@+525:
	db	"stk::cpu::cpu_has_mmx()",0
	;	s@+549:
	db	"stk::cpu::cpu_has_mmxext()",0
	;	s@+576:
	db	"stk::cpu::cpu_has_3dnow()",0
	;	s@+602:
	db	"stk::cpu::cpu_has_3dnowprefetch()",0
	;	s@+636:
	db	"stk::cpu::cpu_has_fxsr()",0
	;	s@+661:
	db	"stk::cpu::cpu_has_sse()",0
	;	s@+685:
	db	"stk::cpu::cpu_has_xsave()",0
	;	s@+711:
	db	"stk::cpu::cpu_has_pclmulqdq()",0
	;	s@+741:
	db	"stk::cpu::cpu_has_movbe()",0
	;	s@+767:
	db	"stk::cpu::cpu_has_fma()",0
	;	s@+791:
	db	"stk::cpu::cpu_has_popcnt()",0
	;	s@+818:
	db	"stk::cpu::cpu_has_xop()",0
	;	s@+842:
	db	"stk::cpu::cpu_has_lzcnt()",0
	;	s@+868:
	db	"stk::cpu::cpu_has_f16c()",0
	;	s@+893:
	db	"stk::cpu::cpu_has_avx()",0
	;	s@+917:
	db	"stk::cpu::cpu_has_avx512f()",0
	;	s@+945:
	db	"stk::cpu::cpu_has_avx512bw()",0
	;	s@+974:
	db	"stk::cpu::cpu_has_avx512cd()",0
	;	s@+1003:
	db	"stk::cpu::cpu_has_avx512dq()",0
	;	s@+1032:
	db	"stk::cpu::cpu_has_avx512er()",0
	;	s@+1061:
	db	"stk::cpu::cpu_has_avx512pf()",0
	;	s@+1090:
	db	"stk::cpu::cpu_has_avx512vl()",0
	;	s@+1119:
	db	"stk::cpu::cpu_has_avx512ifma()",0
	;	s@+1150:
	db	"stk::cpu::cpu_has_bmi()",0
	;	s@+1174:
	db	"stk::cpu::cpu_has_avx512vbmi()",0
	;	s@+1205:
	db	"stk::cpu::cpu_has_cmov()",0
	;	s@+1230:
	db	"stk::cpu::cpu_has_cmpxchg()",0
	;	s@+1258:
	db	"stk::cpu::cpu_has_clmul()",0
	;	s@+1284:
	db	"stk::cpu::cpu_has_aes()",0
	;	s@+1308:
	db	"stk::cpu::cpu_has_sha()",0
	;	s@+1332:
	db	"stk::cpu::cpu_has_rdrand()",0
	;	s@+1359:
	db	"stk::cpu::cpu_has_rdseed()",0
	;	s@+1386:
	db	"stk::cpu::cpu_has_tsc()",0
	;	s@+1410:
	db	"stk::cpu::cpu_has_perftsc()",0
	;	s@+1438:
	db	"stk::cpu::cpu_has_erms()",0
	;	s@+1463:
	db	"stk::cpu::cpu_has_msr()",0
	;	s@+1487:
	db	"stk::cpu::cpu_has_mtrr()",0
	;	s@+1512:
	db	"stk::cpu::cpu_has_vmx()",0
	db	1	dup(?)
	align	4
_DATA	ends
_TEXT	segment dword public use32 'CODE'
	align	4
_?cg_init	proc	near
	push      offset _?cg_init+12
	call      _CG_DESC
	ret 
	nop
	dd	_tsc_STARTED
	dd	8
	dd	4
	dd	_tsc_PAUSED
	dd	8
	dd	4
	dd	_tsc_LAST_MEASURED
	dd	8
	dd	4
	dd	_tsc_ADJ
	dd	8
	dd	4
	dd	_tsc_ELAPSED
	dd	8
	dd	4
	dd	$ijdlfcia
	dd	8
	dd	4
	dd	$idelfcia
	dd	8
	dd	4
	dd	$ahelfcia
	dd	8
	dd	4
	dd	$ikelfcia
	dd	8
	dd	4
	dd	$aoelfcia
	dd	8
	dd	4
	dd	$ibflfcia
	dd	8
	dd	4
	dd	$afflfcia
	dd	4
	dd	4
	dd	$iiflfcia
	dd	4
	dd	4
	dd	$amflfcia
	dd	4
	dd	4
	dd	$ipflfcia
	dd	4
	dd	4
	dd	$adglfcia
	dd	4
	dd	4
	dd	$igglfcia
	dd	4
	dd	4
	dd	$akglfcia
	dd	8
	dd	4
	dd	$aehlfcia
	dd	16
	dd	4
	dd	$ihhlfcia
	dd	8
	dd	4
	dd	$ibilfcia
	dd	52
	dd	4
	dd	$afilfcia
	dd	8
	dd	4
	dd	$apilfcia
	dd	4
	dd	4
	dd	$icjlfcia
	dd	8
	dd	4
	dd	$agjlfcia
	dd	4
	dd	4
	dd	$ijjlfcia
	dd	8
	dd	4
	dd	$anjlfcia
	dd	4
	dd	4
	dd	$iaklfcia
	dd	8
	dd	4
	dd	$aeklfcia
	dd	4
	dd	4
	dd	$ihklfcia
	dd	8
	dd	4
	dd	$alklfcia
	dd	4
	dd	4
	dd	$ioklfcia
	dd	8
	dd	4
	dd	$iillfcia
	dd	4
	dd	4
	dd	$amllfcia
	dd	8
	dd	4
	dd	$ipllfcia
	dd	4
	dd	4
	dd	$admlfcia
	dd	8
	dd	4
	dd	$igmlfcia
	dd	4
	dd	4
	dd	$akmlfcia
	dd	8
	dd	4
	dd	$inmlfcia
	dd	4
	dd	4
	dd	$abnlfcia
	dd	8
	dd	4
	dd	$ienlfcia
	dd	4
	dd	4
	dd	$ainlfcia
	dd	8
	dd	4
	dd	$ilnlfcia
	dd	4
	dd	4
	dd	$apnlfcia
	dd	8
	dd	4
	dd	$icolfcia
	dd	4
	dd	4
	dd	$agolfcia
	dd	8
	dd	4
	dd	$ijolfcia
	dd	4
	dd	4
	dd	$anolfcia
	dd	8
	dd	4
	dd	$iaplfcia
	dd	4
	dd	4
	dd	$aeplfcia
	dd	8
	dd	4
	dd	$ihplfcia
	dd	4
	dd	4
	dd	$alplfcia
	dd	8
	dd	4
	dd	$ioplfcia
	dd	4
	dd	4
	dd	$acamfcia
	dd	8
	dd	4
	dd	$ifamfcia
	dd	4
	dd	4
	dd	$ajamfcia
	dd	8
	dd	4
	dd	$imamfcia
	dd	4
	dd	4
	dd	$aabmfcia
	dd	8
	dd	4
	dd	$idbmfcia
	dd	4
	dd	4
	dd	$ahbmfcia
	dd	8
	dd	4
	dd	$ikbmfcia
	dd	4
	dd	4
	dd	$aobmfcia
	dd	8
	dd	4
	dd	$ibcmfcia
	dd	4
	dd	4
	dd	$afcmfcia
	dd	8
	dd	4
	dd	$iicmfcia
	dd	4
	dd	4
	dd	$amcmfcia
	dd	8
	dd	4
	dd	$ipcmfcia
	dd	4
	dd	4
	dd	$addmfcia
	dd	8
	dd	4
	dd	$igdmfcia
	dd	4
	dd	4
	dd	$akdmfcia
	dd	8
	dd	4
	dd	$indmfcia
	dd	4
	dd	4
	dd	$abemfcia
	dd	8
	dd	4
	dd	$ieemfcia
	dd	4
	dd	4
	dd	$aiemfcia
	dd	8
	dd	4
	dd	$ilemfcia
	dd	4
	dd	4
	dd	$apemfcia
	dd	8
	dd	4
	dd	$icfmfcia
	dd	4
	dd	4
	dd	$agfmfcia
	dd	8
	dd	4
	dd	$ijfmfcia
	dd	4
	dd	4
	dd	$anfmfcia
	dd	8
	dd	4
	dd	$iagmfcia
	dd	4
	dd	4
	dd	$aegmfcia
	dd	8
	dd	4
	dd	$ihgmfcia
	dd	4
	dd	4
	dd	$algmfcia
	dd	8
	dd	4
	dd	$iogmfcia
	dd	4
	dd	4
	dd	$achmfcia
	dd	8
	dd	4
	dd	$ifhmfcia
	dd	4
	dd	4
	dd	$ajhmfcia
	dd	8
	dd	4
	dd	$imhmfcia
	dd	4
	dd	4
	dd	$aaimfcia
	dd	8
	dd	4
	dd	$idimfcia
	dd	4
	dd	4
	dd	$ahimfcia
	dd	8
	dd	4
	dd	$ikimfcia
	dd	4
	dd	4
	dd	$aoimfcia
	dd	8
	dd	4
	dd	$ibjmfcia
	dd	4
	dd	4
	dd	$afjmfcia
	dd	8
	dd	4
	dd	$iijmfcia
	dd	4
	dd	4
	dd	$amjmfcia
	dd	8
	dd	4
	dd	$ipjmfcia
	dd	4
	dd	4
	dd	$adkmfcia
	dd	8
	dd	4
	dd	$igkmfcia
	dd	4
	dd	4
	dd	$akkmfcia
	dd	8
	dd	4
	dd	$inkmfcia
	dd	4
	dd	4
	dd	$ablmfcia
	dd	8
	dd	4
	dd	$ielmfcia
	dd	4
	dd	4
	dd	$ailmfcia
	dd	8
	dd	4
	dd	$illmfcia
	dd	4
	dd	4
	dd	$aplmfcia
	dd	8
	dd	4
	dd	$icmmfcia
	dd	4
	dd	4
	dd	$agmmfcia
	dd	8
	dd	4
	dd	$ijmmfcia
	dd	4
	dd	4
	dd	$anmmfcia
	dd	8
	dd	4
	dd	$ianmfcia
	dd	4
	dd	4
	dd	$aenmfcia
	dd	8
	dd	4
	dd	$ihnmfcia
	dd	4
	dd	4
	dd	$alnmfcia
	dd	8
	dd	4
	dd	$ionmfcia
	dd	4
	dd	4
	dd	$acomfcia
	dd	8
	dd	4
	dd	$ifomfcia
	dd	4
	dd	4
	dd	$ajomfcia
	dd	8
	dd	4
	dd	$imomfcia
	dd	4
	dd	4
	dd	$aapmfcia
	dd	12
	dd	4
	dd	$idpmfcia
	dd	8
	dd	4
	dd	$ahpmfcia
	dd	4
	dd	4
	dd	$ikpmfcia
	dd	8
	dd	4
	dd	$aopmfcia
	dd	4
	dd	4
	dd	$ibanfcia
	dd	8
	dd	4
	dd	$afanfcia
	dd	4
	dd	4
	dd	$iianfcia
	dd	8
	dd	4
	dd	$amanfcia
	dd	4
	dd	4
	dd	$ipanfcia
	dd	8
	dd	4
	dd	$adbnfcia
	dd	4
	dd	4
	dd	$igbnfcia
	dd	8
	dd	4
	dd	$akbnfcia
	dd	4
	dd	4
	dd	$inbnfcia
	dd	8
	dd	4
	dd	$abcnfcia
	dd	4
	dd	4
	dd	$iecnfcia
	dd	8
	dd	1
	dd	s@
	dd	1536
	dd	3
	dd	0
_?cg_init	endp
_TEXT	ends
_INIT_	segment word public use32 'INITDATA'
	db	0
	db	0
	dd	_?cg_init
_INIT_	ends
_TEXT	segment dword public use32 'CODE'
_TEXT	ends
@@stk@time@wait_us$qxuj equ @stk@time@wait_us$qxuj
 extrn   @stk@time@wait_us$qxuj:near
 extrn   _CG_D_EP:near
 extrn   _CG_DA_EPY:near
 extrn   _CG_A_PY:near
@@stk@cstr@trim$qpcc equ @stk@cstr@trim$qpcc
 extrn   @stk@cstr@trim$qpcc:near
@@stk@mem@mov$qpvpxvxui equ @stk@mem@mov$qpvpxvxui
 extrn   @stk@mem@mov$qpvpxvxui:near
 extrn   _CG_A_BP:near
@@stk@mem@cmp$qpxvt1xui equ @stk@mem@cmp$qpxvt1xui
 extrn   @stk@mem@cmp$qpxvt1xui:near
@@stk@time@time_ms$qv equ @stk@time@time_ms$qv
 extrn   @stk@time@time_ms$qv:near
 extrn   __llmul:near
 extrn   __lludiv:near
 extrn   _CG_LDA_EOXSY:near
@@stk@con@prints$qpxce equ @stk@con@prints$qpxce
 extrn   @stk@con@prints$qpxce:near
 extrn   _CG_DESC:near
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	?patch350
	dw	37
	dw	607
	dw	0
	dw	0
	dw	0
	dw	0
?patch350	equ	12
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	608
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	609
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	113
	dw	0
	dw	0
	dw	610
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	113
	dw	0
	dw	0
	dw	611
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	612
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	613
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	614
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	615
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1136
	dw	0
	dw	0
	dw	616
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	617
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	618
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	619
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	620
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	64
	dw	0
	dw	0
	dw	621
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	622
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	4255
	dw	0
	dw	0
	dw	623
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	624
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	625
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1141
	dw	0
	dw	0
	dw	626
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	627
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	628
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	629
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	630
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1141
	dw	0
	dw	0
	dw	631
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	632
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1141
	dw	0
	dw	0
	dw	633
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	634
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1141
	dw	0
	dw	0
	dw	635
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	636
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	637
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1141
	dw	0
	dw	0
	dw	638
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	639
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	640
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	641
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	17
	dw	0
	dw	0
	dw	642
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	643
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	644
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	645
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	646
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	118
	dw	0
	dw	0
	dw	647
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	118
	dw	0
	dw	0
	dw	648
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
	dw	0
	dw	0
	dw	649
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
	dw	0
	dw	0
	dw	650
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
	dw	0
	dw	0
	dw	651
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	652
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	653
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	112
	dw	0
	dw	0
	dw	654
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	17
	dw	0
	dw	0
	dw	655
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	656
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	113
	dw	0
	dw	0
	dw	657
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1136
	dw	0
	dw	0
	dw	658
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1136
	dw	0
	dw	0
	dw	659
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1136
	dw	0
	dw	0
	dw	660
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	4264
	dw	0
	dw	0
	dw	661
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	4264
	dw	0
	dw	0
	dw	662
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1136
	dw	0
	dw	0
	dw	663
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1136
	dw	0
	dw	0
	dw	664
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1136
	dw	0
	dw	0
	dw	665
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	4264
	dw	0
	dw	0
	dw	666
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	4264
	dw	0
	dw	0
	dw	667
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	113
	dw	0
	dw	0
	dw	668
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	113
	dw	0
	dw	0
	dw	669
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	670
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	671
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	672
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	673
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	674
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	112
	dw	0
	dw	0
	dw	675
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	676
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	677
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	118
	dw	0
	dw	0
	dw	678
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
	dw	0
	dw	0
	dw	679
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	118
	dw	0
	dw	0
	dw	680
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
	dw	0
	dw	0
	dw	681
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	682
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	683
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	684
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	685
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	686
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	687
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	688
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	689
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	690
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	691
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	692
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	693
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	694
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	695
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	696
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	697
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	698
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	699
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	700
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	701
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	702
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	703
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	704
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	705
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	706
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	707
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	708
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	709
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	710
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	711
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	712
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	713
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	714
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	715
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	716
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	717
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	718
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	719
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	720
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	721
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	722
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	723
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	724
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	725
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	726
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	727
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	728
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	729
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	730
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	731
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	732
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	733
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	734
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	113
	dw	0
	dw	0
	dw	735
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	736
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	737
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	3
	dw	0
	dw	0
	dw	738
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	3
	dw	0
	dw	0
	dw	739
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	3
	dw	0
	dw	0
	dw	740
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	741
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	742
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	743
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	744
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	745
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	746
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	747
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	748
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	749
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	750
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	751
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	752
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	753
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	754
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	755
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1141
	dw	0
	dw	0
	dw	756
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	757
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	758
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	759
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	760
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	761
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	762
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	763
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	764
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	112
	dw	0
	dw	0
	dw	765
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	16
	dw	0
	dw	0
	dw	766
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	767
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	112
	dw	0
	dw	0
	dw	768
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	769
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	112
	dw	0
	dw	0
	dw	770
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	771
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	17
	dw	0
	dw	0
	dw	772
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	773
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	774
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	775
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	118
	dw	0
	dw	0
	dw	776
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
	dw	0
	dw	0
	dw	777
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	118
	dw	0
	dw	0
	dw	778
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
	dw	0
	dw	0
	dw	779
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	780
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	781
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	17
	dw	0
	dw	0
	dw	782
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	17
	dw	0
	dw	0
	dw	783
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	17
	dw	0
	dw	0
	dw	784
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	17
	dw	0
	dw	0
	dw	785
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	786
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	787
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	788
	dw	0
	dw	0
	dw	0
	dw	?patch351
	dw	37
	dw	789
	dw	0
	dw	0
	dw	0
	dw	0
?patch351	equ	12
	dw	?patch352
	dw	37
	dw	790
	dw	0
	dw	0
	dw	0
	dw	0
?patch352	equ	12
	dw	?patch353
	dw	37
	dw	791
	dw	0
	dw	0
	dw	0
	dw	0
?patch353	equ	12
	dw	?patch354
	dw	37
	dw	792
	dw	0
	dw	0
	dw	0
	dw	0
?patch354	equ	12
	dw	?patch355
	dw	37
	dw	793
	dw	0
	dw	0
	dw	0
	dw	0
?patch355	equ	12
	dw	?patch356
	dw	37
	dw	794
	dw	0
	dw	0
	dw	0
	dw	0
?patch356	equ	12
	dw	?patch357
	dw	37
	dw	795
	dw	0
	dw	0
	dw	0
	dw	0
?patch357	equ	12
	dw	22
	dw	513
	df	_tsc_STARTED
	dw	0
	dw	119
	dw	0
	dw	796
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_PAUSED
	dw	0
	dw	119
	dw	0
	dw	797
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_LAST_MEASURED
	dw	0
	dw	119
	dw	0
	dw	798
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_ADJ
	dw	0
	dw	119
	dw	0
	dw	799
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_ELAPSED
	dw	0
	dw	119
	dw	0
	dw	800
	dw	0
	dw	0
	dw	0
	dw	?patch358
	dw	38
	dw	514
	dw	801
	dw	0
	dw	802
	dw	0
	dw	803
	dw	0
	dw	804
	dw	0
	dw	805
	dw	0
	dw	806
	dw	0
	dw	807
	dw	0
	dw	808
	dw	0
	dw	809
	dw	0
	dw	810
	dw	0
	dw	811
	dw	0
	dw	812
	dw	0
	dw	813
	dw	0
	dw	814
	dw	0
	dw	815
	dw	0
	dw	816
	dw	0
	dw	817
	dw	0
	dw	818
	dw	0
	dw	819
	dw	0
	dw	820
	dw	0
	dw	821
	dw	0
	dw	822
	dw	0
	dw	823
	dw	0
	dw	824
	dw	0
	dw	825
	dw	0
	dw	826
	dw	0
	dw	827
	dw	0
	dw	828
	dw	0
	dw	829
	dw	0
	dw	830
	dw	0
	dw	831
	dw	0
	dw	832
	dw	0
	dw	833
	dw	0
	dw	834
	dw	0
	dw	835
	dw	0
	dw	836
	dw	0
	dw	837
	dw	0
	dw	838
	dw	0
	dw	839
	dw	0
	dw	840
	dw	0
	dw	841
	dw	0
	dw	842
	dw	0
	dw	843
	dw	0
	dw	844
	dw	0
	dw	845
	dw	0
	dw	846
	dw	0
	dw	847
	dw	0
	dw	848
	dw	0
	dw	849
	dw	0
	dw	850
	dw	0
	dw	851
	dw	0
	dw	852
	dw	0
	dw	853
	dw	0
	dw	854
	dw	0
	dw	855
	dw	0
	dw	856
	dw	0
	dw	857
	dw	0
	dw	858
	dw	0
	dw	859
	dw	0
	dw	860
	dw	0
	dw	861
	dw	0
	dw	862
	dw	0
	dw	863
	dw	0
	dw	864
	dw	0
	dw	865
	dw	0
	dw	866
	dw	0
	dw	867
	dw	0
	dw	868
	dw	0
	dw	869
	dw	0
	dw	870
	dw	0
	dw	871
	dw	0
	dw	872
	dw	0
	dw	873
	dw	0
	dw	874
	dw	0
	dw	875
	dw	0
	dw	876
	dw	0
	dw	877
	dw	0
	dw	878
	dw	0
	dw	879
	dw	0
	dw	880
	dw	0
	dw	881
	dw	0
	dw	882
	dw	0
	dw	883
	dw	0
	dw	884
	dw	0
	dw	885
	dw	0
	dw	886
	dw	0
	dw	887
	dw	0
	dw	888
	dw	0
	dw	889
	dw	0
	dw	890
	dw	0
	dw	891
	dw	0
	dw	892
	dw	0
	dw	893
	dw	0
	dw	894
	dw	0
	dw	895
	dw	0
	dw	896
	dw	0
	dw	897
	dw	0
	dw	898
	dw	0
	dw	899
	dw	0
	dw	900
	dw	0
	dw	901
	dw	0
	dw	902
	dw	0
	dw	903
	dw	0
	dw	904
	dw	0
	dw	905
	dw	0
	dw	906
	dw	0
	dw	907
	dw	0
	dw	908
	dw	0
	dw	909
	dw	0
	dw	910
	dw	0
	dw	911
	dw	0
	dw	912
	dw	0
	dw	913
	dw	0
	dw	914
	dw	0
	dw	915
	dw	0
	dw	916
	dw	0
	dw	917
	dw	0
	dw	918
	dw	0
	dw	919
	dw	0
	dw	920
	dw	0
	dw	921
	dw	0
	dw	922
	dw	0
	dw	923
	dw	0
	dw	924
	dw	0
	dw	925
	dw	0
	dw	926
	dw	0
	dw	927
	dw	0
	dw	928
	dw	0
	dw	929
	dw	0
	dw	930
	dw	0
	dw	931
	dw	0
	dw	932
	dw	0
	dw	933
	dw	0
	dw	934
	dw	0
	dw	935
	dw	0
	dw	936
	dw	0
	dw	937
	dw	0
	dw	938
	dw	0
	dw	939
	dw	0
	dw	940
	dw	0
	dw	941
	dw	0
	dw	942
	dw	0
	dw	943
	dw	0
	dw	944
	dw	0
	dw	945
	dw	0
	dw	946
	dw	0
	dw	947
	dw	0
	dw	948
	dw	0
	dw	949
	dw	0
	dw	950
	dw	0
	dw	951
	dw	0
	dw	952
	dw	0
	dw	953
	dw	0
	dw	954
	dw	0
	dw	955
	dw	0
	dw	956
	dw	0
	dw	957
	dw	0
	dw	958
	dw	0
	dw	959
	dw	0
	dw	960
	dw	0
	dw	961
	dw	0
	dw	962
	dw	0
	dw	963
	dw	0
	dw	964
	dw	0
	dw	965
	dw	0
	dw	966
	dw	0
	dw	967
	dw	0
	dw	968
	dw	0
	dw	969
	dw	0
	dw	970
	dw	0
	dw	971
	dw	0
	dw	972
	dw	0
	dw	973
	dw	0
	dw	974
	dw	0
	dw	975
	dw	0
	dw	976
	dw	0
	dw	977
	dw	0
	dw	978
	dw	0
	dw	979
	dw	0
	dw	980
	dw	0
	dw	981
	dw	0
	dw	982
	dw	0
	dw	983
	dw	0
	dw	984
	dw	0
	dw	985
	dw	0
	dw	986
	dw	0
	dw	987
	dw	0
	dw	988
	dw	0
	dw	989
	dw	0
	dw	990
	dw	0
	dw	991
	dw	0
	dw	992
	dw	0
	dw	993
	dw	0
	dw	994
	dw	0
	dw	995
	dw	0
	dw	996
	dw	0
	dw	997
	dw	0
	dw	998
	dw	0
	dw	999
	dw	0
	dw	1000
	dw	0
	dw	1001
	dw	0
	dw	1002
	dw	0
	dw	1003
	dw	0
	dw	1004
	dw	0
	dw	1005
	dw	0
	dw	1006
	dw	0
	dw	1007
	dw	0
	dw	1008
	dw	0
	dw	1009
	dw	0
	dw	1010
	dw	0
	dw	1011
	dw	0
	dw	1012
	dw	0
	dw	1013
	dw	0
	dw	1014
	dw	0
	dw	1015
	dw	0
	dw	1016
	dw	0
	dw	1017
	dw	0
	dw	1018
	dw	0
	dw	1019
	dw	0
	dw	1020
	dw	0
	dw	1021
	dw	0
	dw	1022
	dw	0
	dw	1023
	dw	0
	dw	1024
	dw	0
	dw	1025
	dw	0
	dw	1026
	dw	0
	dw	1027
	dw	0
	dw	1028
	dw	0
	dw	1029
	dw	0
	dw	1030
	dw	0
	dw	1031
	dw	0
	dw	1032
	dw	0
	dw	1033
	dw	0
	dw	1034
	dw	0
	dw	1035
	dw	0
	dw	1036
	dw	0
	dw	1037
	dw	0
	dw	1038
	dw	0
	dw	1039
	dw	0
	dw	1040
	dw	0
	dw	1041
	dw	0
	dw	1042
	dw	0
	dw	1043
	dw	0
	dw	1044
	dw	0
	dw	1045
	dw	0
	dw	1046
	dw	0
	dw	1047
	dw	0
	dw	1048
	dw	0
	dw	1049
	dw	0
	dw	1050
	dw	0
	dw	1051
	dw	0
	dw	1052
	dw	0
	dw	1053
	dw	0
	dw	1054
	dw	0
	dw	1055
	dw	0
	dw	1056
	dw	0
	dw	1057
	dw	0
	dw	1058
	dw	0
	dw	1059
	dw	0
	dw	1060
	dw	0
	dw	1061
	dw	0
	dw	1062
	dw	0
	dw	1063
	dw	0
	dw	1064
	dw	0
	dw	1065
	dw	0
	dw	1066
	dw	0
	dw	1067
	dw	0
	dw	1068
	dw	0
	dw	1069
	dw	0
	dw	1070
	dw	0
	dw	1071
	dw	0
	dw	1072
	dw	0
	dw	1073
	dw	0
	dw	1074
	dw	0
	dw	1075
	dw	0
	dw	1076
	dw	0
	dw	1077
	dw	0
	dw	1078
	dw	0
	dw	1079
	dw	0
	dw	1080
	dw	0
	dw	1081
	dw	0
	dw	1082
	dw	0
	dw	1083
	dw	0
	dw	1084
	dw	0
	dw	1085
	dw	0
	dw	1086
	dw	0
	dw	1087
	dw	0
	dw	1088
	dw	0
	dw	1089
	dw	0
	dw	1090
	dw	0
	dw	1091
	dw	0
	dw	1092
	dw	0
	dw	1093
	dw	0
	dw	1094
	dw	0
	dw	1095
	dw	0
	dw	1096
	dw	0
	dw	1097
	dw	0
	dw	1098
	dw	0
	dw	1099
	dw	0
	dw	1100
	dw	0
	dw	1101
	dw	0
	dw	1102
	dw	0
	dw	1103
	dw	0
	dw	1104
	dw	0
	dw	1105
	dw	0
	dw	1106
	dw	0
	dw	1107
	dw	0
	dw	1108
	dw	0
	dw	1109
	dw	0
	dw	1110
	dw	0
	dw	1111
	dw	0
	dw	1112
	dw	0
	dw	1113
	dw	0
	dw	1114
	dw	0
	dw	1115
	dw	0
	dw	1116
	dw	0
	dw	1117
	dw	0
	dw	1118
	dw	0
	dw	1119
	dw	0
	dw	1120
	dw	0
	dw	1121
	dw	0
	dw	1122
	dw	0
	dw	1123
	dw	0
	dw	1124
	dw	0
	dw	1125
	dw	0
	dw	1126
	dw	0
	dw	1127
	dw	0
	dw	1128
	dw	0
	dw	1129
	dw	0
	dw	1130
	dw	0
	dw	1131
	dw	0
	dw	1132
	dw	0
	dw	1133
	dw	0
	dw	1134
	dw	0
	dw	1135
	dw	0
	dw	1136
	dw	0
	dw	1137
	dw	0
	dw	1138
	dw	0
	dw	1139
	dw	0
	dw	1140
	dw	0
	dw	1141
	dw	0
	dw	1142
	dw	0
	dw	1143
	dw	0
	dw	1144
	dw	0
	dw	1145
	dw	0
	dw	1146
	dw	0
	dw	1147
	dw	0
	dw	1148
	dw	0
	dw	1149
	dw	0
	dw	1150
	dw	0
	dw	1151
	dw	0
	dw	1152
	dw	0
	dw	1153
	dw	0
	dw	1154
	dw	0
	dw	1155
	dw	0
	dw	1156
	dw	0
	dw	1157
	dw	0
	dw	1158
	dw	0
	dw	1159
	dw	0
	dw	1160
	dw	0
	dw	1161
	dw	0
	dw	1162
	dw	0
	dw	1163
	dw	0
	dw	1164
	dw	0
	dw	1165
	dw	0
	dw	1166
	dw	0
	dw	1167
	dw	0
	dw	1168
	dw	0
	dw	1169
	dw	0
	dw	1170
	dw	0
	dw	1171
	dw	0
	dw	1172
	dw	0
	dw	1173
	dw	0
	dw	1174
	dw	0
	dw	1175
	dw	0
	dw	1176
	dw	0
	dw	1177
	dw	0
	dw	1178
	dw	0
	dw	1179
	dw	0
	dw	1180
	dw	0
	dw	1181
	dw	0
	dw	1182
	dw	0
	dw	1183
	dw	0
	dw	1184
	dw	0
	dw	1185
	dw	0
	dw	1186
	dw	0
	dw	1187
	dw	0
	dw	1188
	dw	0
	dw	1189
	dw	0
	dw	1190
	dw	0
	dw	1191
	dw	0
	dw	1192
	dw	0
	dw	1193
	dw	0
	dw	1194
	dw	0
	dw	1195
	dw	0
	dw	1196
	dw	0
	dw	1197
	dw	0
	dw	1198
	dw	0
	dw	1199
	dw	0
	dw	1200
	dw	0
	dw	1201
	dw	0
	dw	1202
	dw	0
	dw	1203
	dw	0
	dw	1204
	dw	0
	dw	1205
	dw	0
	dw	1206
	dw	0
	dw	1207
	dw	0
	dw	1208
	dw	0
	dw	1209
	dw	0
	dw	1210
	dw	0
	dw	1211
	dw	0
	dw	1212
	dw	0
	dw	1213
	dw	0
	dw	1214
	dw	0
	dw	1215
	dw	0
	dw	1216
	dw	0
	dw	1217
	dw	0
	dw	1218
	dw	0
	dw	1219
	dw	0
	dw	1220
	dw	0
	dw	1221
	dw	0
	dw	1222
	dw	0
	dw	1223
	dw	0
	dw	1224
	dw	0
	dw	1225
	dw	0
	dw	1226
	dw	0
	dw	1227
	dw	0
	dw	1228
	dw	0
	dw	1229
	dw	0
	dw	1230
	dw	0
	dw	1231
	dw	0
	dw	1232
	dw	0
	dw	1233
	dw	0
	dw	1234
	dw	0
	dw	1235
	dw	0
	dw	1236
	dw	0
	dw	1237
	dw	0
	dw	1238
	dw	0
	dw	1239
	dw	0
	dw	1240
	dw	0
	dw	1241
	dw	0
	dw	1242
	dw	0
	dw	1243
	dw	0
	dw	1244
	dw	0
	dw	1245
	dw	0
	dw	1246
	dw	0
	dw	1247
	dw	0
	dw	1248
	dw	0
	dw	1249
	dw	0
	dw	1250
	dw	0
	dw	1251
	dw	0
	dw	1252
	dw	0
	dw	1253
	dw	0
	dw	1254
	dw	0
	dw	1255
	dw	0
	dw	1256
	dw	0
	dw	1257
	dw	0
	dw	1258
	dw	0
	dw	1259
	dw	0
	dw	1260
	dw	0
	dw	1261
	dw	0
	dw	1262
	dw	0
	dw	1263
	dw	0
	dw	1264
	dw	0
	dw	1265
	dw	0
	dw	1266
	dw	0
	dw	1267
	dw	0
	dw	1268
	dw	0
	dw	1269
	dw	0
	dw	1270
	dw	0
	dw	1271
	dw	0
	dw	1272
	dw	0
	dw	1273
	dw	0
	dw	1274
	dw	0
	dw	1275
	dw	0
	dw	1276
	dw	0
	dw	1277
	dw	0
	dw	1278
	dw	0
	dw	1279
	dw	0
	dw	1280
	dw	0
	dw	1281
	dw	0
	dw	1282
	dw	0
	dw	1283
	dw	0
	dw	1284
	dw	0
	dw	1285
	dw	0
	dw	1286
	dw	0
	dw	1287
	dw	0
	dw	1288
	dw	0
	dw	1289
	dw	0
	dw	1290
	dw	0
	dw	1291
	dw	0
	dw	1292
	dw	0
	dw	1293
	dw	0
	dw	1294
	dw	0
	dw	1295
	dw	0
	dw	1296
	dw	0
	dw	1297
	dw	0
	dw	1298
	dw	0
	dw	1299
	dw	0
	dw	1300
	dw	0
	dw	1301
	dw	0
	dw	1302
	dw	0
	dw	1303
	dw	0
	dw	1304
	dw	0
	dw	1305
	dw	0
	dw	1306
	dw	0
	dw	1307
	dw	0
	dw	1308
	dw	0
	dw	1309
	dw	0
	dw	1310
	dw	0
	dw	1311
	dw	0
	dw	1312
	dw	0
	dw	1313
	dw	0
	dw	1314
	dw	0
?patch358	equ	2060
	dw	?patch359
	dw	1
	db	6
	db	1
	db	0
	db	24
	db	9
	db	66
	db	67
	db	67
	db	51
	db	50
	db	32
	db	53
	db	46
	db	53
?patch359	equ	16
$$BSYMS	ends
$$BTYPES	segment byte public use32 'DEBTYP'
	db        2,0,0,0,14,0,8,0,119,0,0,0,0,0,0,0
	db        1,16,0,0,4,0,1,2,0,0,14,0,8,0,119,0
	db        0,0,0,0,0,0,3,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,119,0,0,0,0,0,0,0,5,16,0,0
	db        4,0,1,2,0,0,8,0,1,0,2,0,118,0,0,0
	db        14,0,8,0,119,0,0,0,0,0,0,0,8,16,0,0
	db        4,0,1,2,0,0,14,0,8,0,119,0,0,0,0,0
	db        0,0,10,16,0,0,4,0,1,2,0,0,14,0,8,0
	db        119,0,0,0,0,0,0,0,12,16,0,0,4,0,1,2
	db        0,0,14,0,8,0,119,0,0,0,0,0,0,0,14,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,119,0,0,0
	db        0,0,0,0,16,16,0,0,4,0,1,2,0,0,14,0
	db        8,0,119,0,0,0,0,0,0,0,18,16,0,0,4,0
	db        1,2,0,0,14,0,8,0,117,0,0,0,0,0,6,0
	db        20,16,0,0,28,0,1,2,6,0,117,4,0,0,117,4
	db        0,0,117,4,0,0,117,4,0,0,117,0,0,0,117,0
	db        0,0,14,0,8,0,117,0,0,0,0,0,6,0,22,16
	db        0,0,28,0,1,2,6,0,117,4,0,0,117,4,0,0
	db        117,4,0,0,117,4,0,0,117,0,0,0,117,0,0,0
	db        14,0,8,0,112,4,0,0,0,0,0,0,24,16,0,0
	db        4,0,1,2,0,0,18,0,3,0,117,0,0,0,17,0
	db        0,0,0,0,0,0,16,0,4,0,14,0,8,0,112,4
	db        0,0,0,0,0,0,27,16,0,0,4,0,1,2,0,0
	db        18,0,3,0,117,0,0,0,17,0,0,0,0,0,0,0
	db        52,0,13,0,14,0,8,0,117,0,0,0,0,0,0,0
	db        30,16,0,0,4,0,1,2,0,0,14,0,8,0,117,0
	db        0,0,0,0,0,0,32,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,117,0,0,0,0,0,1,0,34,16,0,0
	db        8,0,1,2,1,0,32,0,0,0,14,0,8,0,117,0
	db        0,0,0,0,1,0,36,16,0,0,8,0,1,2,1,0
	db        32,0,0,0,14,0,8,0,117,0,0,0,0,0,1,0
	db        38,16,0,0,8,0,1,2,1,0,48,0,0,0,18,0
	db        3,0,119,0,0,0,17,0,0,0,0,0,0,0,40,0
	db        5,0,14,0,8,0,48,0,0,0,0,0,0,0,41,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,48,0,0,0
	db        0,0,0,0,43,16,0,0,4,0,1,2,0,0,14,0
	db        8,0,48,0,0,0,0,0,0,0,45,16,0,0,4,0
	db        1,2,0,0,14,0,8,0,48,0,0,0,0,0,0,0
	db        47,16,0,0,4,0,1,2,0,0,14,0,8,0,48,0
	db        0,0,0,0,0,0,49,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,117,0,0,0,0,0,0,0,51,16,0,0
	db        4,0,1,2,0,0,14,0,8,0,48,0,0,0,0,0
	db        0,0,53,16,0,0,4,0,1,2,0,0,14,0,8,0
	db        117,0,0,0,0,0,0,0,55,16,0,0,4,0,1,2
	db        0,0,14,0,8,0,48,0,0,0,0,0,0,0,57,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,48,0,0,0
	db        0,0,0,0,59,16,0,0,4,0,1,2,0,0,14,0
	db        8,0,117,0,0,0,0,0,0,0,61,16,0,0,4,0
	db        1,2,0,0,14,0,8,0,48,0,0,0,0,0,0,0
	db        63,16,0,0,4,0,1,2,0,0,14,0,8,0,48,0
	db        0,0,0,0,0,0,65,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,48,0,0,0,0,0,0,0,67,16,0,0
	db        4,0,1,2,0,0,14,0,8,0,48,0,0,0,0,0
	db        0,0,69,16,0,0,4,0,1,2,0,0,14,0,8,0
	db        117,0,0,0,0,0,0,0,71,16,0,0,4,0,1,2
	db        0,0,14,0,8,0,48,0,0,0,0,0,0,0,73,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,117,0,0,0
	db        0,0,0,0,75,16,0,0,4,0,1,2,0,0,14,0
	db        8,0,48,0,0,0,0,0,0,0,77,16,0,0,4,0
	db        1,2,0,0,14,0,8,0,48,0,0,0,0,0,0,0
	db        79,16,0,0,4,0,1,2,0,0,14,0,8,0,48,0
	db        0,0,0,0,0,0,81,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,48,0,0,0,0,0,0,0,83,16,0,0
	db        4,0,1,2,0,0,14,0,8,0,48,0,0,0,0,0
	db        0,0,85,16,0,0,4,0,1,2,0,0,14,0,8,0
	db        48,0,0,0,0,0,0,0,87,16,0,0,4,0,1,2
	db        0,0,14,0,8,0,48,0,0,0,0,0,0,0,89,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,48,0,0,0
	db        0,0,0,0,91,16,0,0,4,0,1,2,0,0,14,0
	db        8,0,48,0,0,0,0,0,0,0,93,16,0,0,4,0
	db        1,2,0,0,14,0,8,0,48,0,0,0,0,0,0,0
	db        95,16,0,0,4,0,1,2,0,0,14,0,8,0,48,0
	db        0,0,0,0,0,0,97,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,48,0,0,0,0,0,0,0,99,16,0,0
	db        4,0,1,2,0,0,14,0,8,0,48,0,0,0,0,0
	db        0,0,101,16,0,0,4,0,1,2,0,0,14,0,8,0
	db        48,0,0,0,0,0,0,0,103,16,0,0,4,0,1,2
	db        0,0,14,0,8,0,48,0,0,0,0,0,0,0,105,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,48,0,0,0
	db        0,0,0,0,107,16,0,0,4,0,1,2,0,0,14,0
	db        8,0,48,0,0,0,0,0,0,0,109,16,0,0,4,0
	db        1,2,0,0,14,0,8,0,48,0,0,0,0,0,0,0
	db        111,16,0,0,4,0,1,2,0,0,14,0,8,0,48,0
	db        0,0,0,0,0,0,113,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,48,0,0,0,0,0,0,0,115,16,0,0
	db        4,0,1,2,0,0,14,0,8,0,48,0,0,0,0,0
	db        0,0,117,16,0,0,4,0,1,2,0,0,14,0,8,0
	db        48,0,0,0,0,0,0,0,119,16,0,0,4,0,1,2
	db        0,0,14,0,8,0,48,0,0,0,0,0,0,0,121,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,48,0,0,0
	db        0,0,0,0,123,16,0,0,4,0,1,2,0,0,14,0
	db        8,0,48,0,0,0,0,0,0,0,125,16,0,0,4,0
	db        1,2,0,0,14,0,8,0,48,0,0,0,0,0,0,0
	db        127,16,0,0,4,0,1,2,0,0,14,0,8,0,117,4
	db        0,0,0,0,0,0,129,16,0,0,4,0,1,2,0,0
	db        18,0,3,0,117,0,0,0,17,0,0,0,0,0,0,0
	db        12,0,3,0,14,0,8,0,117,0,0,0,0,0,0,0
	db        132,16,0,0,4,0,1,2,0,0,14,0,8,0,48,0
	db        0,0,0,0,0,0,134,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,48,0,0,0,0,0,0,0,136,16,0,0
	db        4,0,1,2,0,0,14,0,8,0,48,0,0,0,0,0
	db        0,0,138,16,0,0,4,0,1,2,0,0,14,0,8,0
	db        48,0,0,0,0,0,0,0,140,16,0,0,4,0,1,2
	db        0,0,14,0,8,0,48,0,0,0,0,0,0,0,142,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,48,0,0,0
	db        0,0,0,0,144,16,0,0,4,0,1,2,0,0,14,0
	db        8,0,3,0,0,0,0,0,0,0,146,16,0,0,4,0
	db        1,2,0,0,14,0,8,0,3,0,0,0,0,0,0,0
	db        148,16,0,0,4,0,1,2,0,0,14,0,8,0,3,0
	db        0,0,7,0,0,0,150,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,3,0,0,0,7,0,1,0,153,16,0,0
	db        8,0,1,0,1,0,119,0,0,0,8,0,1,2,1,0
	db        152,16,0,0,14,0,8,0,116,0,0,0,2,0,0,0
	db        155,16,0,0,4,0,1,2,0,0,14,0,8,0,112,4
	db        0,0,7,0,2,0,157,16,0,0,12,0,1,2,2,0
	db        112,4,0,0,112,0,0,0,14,0,8,0,3,4,0,0
	db        7,0,3,0,162,16,0,0,8,0,2,0,10,0,160,16
	db        0,0,8,0,1,0,1,0,3,0,0,0,8,0,1,0
	db        1,0,117,0,0,0,16,0,1,2,3,0,3,4,0,0
	db        159,16,0,0,161,16,0,0,14,0,8,0,118,0,0,0
	db        7,0,3,0,164,16,0,0,16,0,1,2,3,0,159,16
	db        0,0,159,16,0,0,161,16,0,0,14,0,8,0,119,0
	db        0,0,7,0,0,0,166,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,3,0,0,0,64,0,2,0,170,16,0,0
	db        8,0,2,0,10,0,169,16,0,0,8,0,1,0,1,0
	db        112,0,0,0,12,0,1,2,2,0,168,16,0,0,0,0
	db        0,0
$$BTYPES	ends
$$BNAMES	segment byte public use32 'DEBNAM'
	db	17,'@stk@cpu@rdtsc$qv'
	db	6,'ret_hi'
	db	6,'ret_lo'
	db	3,'ret'
	db	19,'@stk@cpu@rdtscex$qv'
	db	6,'ret_hi'
	db	6,'ret_lo'
	db	3,'ret'
	db	20,'@stk@cpu@tsc_init$qv'
	db	3,'ret'
	db	2,'m1'
	db	2,'m0'
	db	9,'__shared1'
	db	9,'__unique1'
	db	21,'@stk@cpu@tsc_start$qv'
	db	3,'ret'
	db	9,'__shared1'
	db	9,'__unique1'
	db	26,'@stk@cpu@tsc_checkpoint$qv'
	db	1,'e'
	db	1,'x'
	db	1,'n'
	db	9,'__shared1'
	db	9,'__unique1'
	db	23,'@stk@cpu@tsc_elapsed$qv'
	db	21,'@stk@cpu@tsc_pause$qv'
	db	1,'n'
	db	9,'__shared1'
	db	9,'__unique1'
	db	22,'@stk@cpu@tsc_resume$qv'
	db	1,'x'
	db	1,'n'
	db	1,'p'
	db	1,'s'
	db	9,'__shared1'
	db	9,'__unique1'
	db	28,'@stk@cpu@tsc_start_paused$qv'
	db	1,'n'
	db	9,'__shared1'
	db	9,'__unique1'
	db	29,'@stk@cpu@cpuid$qpuit1t1t1uiui'
	db	5,'a_eax'
	db	5,'a_ebx'
	db	5,'a_ecx'
	db	5,'a_edx'
	db	9,'a_feature'
	db	13,'a_feature_ecx'
	db	31,'@stk@cpu@cpuidex$qpuit1t1t1uiui'
	db	5,'a_eax'
	db	5,'a_ebx'
	db	5,'a_ecx'
	db	5,'a_edx'
	db	9,'a_feature'
	db	13,'a_feature_ecx'
	db	3,'ret'
	db	9,'__shared1'
	db	9,'__unique1'
	db	20,'previous_feature_ecx'
	db	16,'previous_feature'
	db	10,'cached_edx'
	db	10,'cached_ecx'
	db	10,'cached_ebx'
	db	10,'cached_eax'
	db	3,'ret'
	db	22,'@stk@cpu@cpu_vendor$qv'
	db	9,'__shared1'
	db	9,'__unique1'
	db	1,'v'
	db	20,'@stk@cpu@cpu_name$qv'
	db	1,'i'
	db	1,'f'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	1,'n'
	db	27,'@stk@cpu@cpu_num_threads$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_num_cores$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	27,'@stk@cpu@cpu_cache_size$quc'
	db	7,'a_level'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	32,'@stk@cpu@cpu_cache_line_size$quc'
	db	7,'a_level'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_num_mhz$qo'
	db	17,'a_constant_update'
	db	4,'rcor'
	db	3,'ret'
	db	2,'t4'
	db	2,'t3'
	db	2,'t2'
	db	2,'t1'
	db	1,'t'
	db	1,'i'
	db	4,'imin'
	db	4,'imax'
	db	1,'x'
	db	4,'xmin'
	db	4,'xmax'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	6,'trash2'
	db	6,'trash1'
	db	23,'@stk@cpu@cpu_has_x87$qv'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_mmx$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	26,'@stk@cpu@cpu_has_mmxext$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_amd64$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	22,'@stk@cpu@cpu_has_ht$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_sse$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_sse4a$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_avx$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	26,'@stk@cpu@cpu_has_popcnt$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	24,'@stk@cpu@cpu_has_f16c$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	27,'@stk@cpu@cpu_has_cmpxchg$qv'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_vmx$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_smx$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	24,'@stk@cpu@cpu_has_cmov$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_movbe$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_bmi$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	24,'@stk@cpu@cpu_has_erms$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_3dnow$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	33,'@stk@cpu@cpu_has_3dnowprefetch$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	27,'@stk@cpu@cpu_has_perftsc$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_sha$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_xop$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	27,'@stk@cpu@cpu_has_avx512f$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	28,'@stk@cpu@cpu_has_avx512bw$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	28,'@stk@cpu@cpu_has_avx512er$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	28,'@stk@cpu@cpu_has_avx512cd$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	28,'@stk@cpu@cpu_has_avx512pf$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	28,'@stk@cpu@cpu_has_avx512dq$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	28,'@stk@cpu@cpu_has_avx512vl$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	30,'@stk@cpu@cpu_has_avx512ifma$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	30,'@stk@cpu@cpu_has_avx512vbmi$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_adx$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_lzcnt$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_tbm$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_clfsh$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	29,'@stk@cpu@cpu_has_pclmulqdq$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	24,'@stk@cpu@cpu_has_fxsr$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	22,'@stk@cpu@cpu_has_ss$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	24,'@stk@cpu@cpu_has_mtrr$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_msr$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_tsc$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_psn$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_xsave$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_clmul$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	19,'@stk@cpu@cpu_psn$qv'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	2,'sn'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_fma$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_aes$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	26,'@stk@cpu@cpu_has_viaaes$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	26,'@stk@cpu@cpu_has_viarng$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	27,'@stk@cpu@cpu_has_viahash$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	26,'@stk@cpu@cpu_has_rdseed$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	26,'@stk@cpu@cpu_has_rdrand$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	26,'@stk@cpu@cpu_print_info$qv'
	db	3,'ret'
	db	20,'@stk@cpu@cpu_test$qv'
	db	8,'_STCON0_'
	db	3,'std'
	db	11,'@std@size_t'
	db	14,'@std@ptrdiff_t'
	db	11,'@std@wint_t'
	db	13,'@std@wctype_t'
	db	12,'@std@va_list'
	db	5,'ULONG'
	db	6,'USHORT'
	db	5,'UCHAR'
	db	3,'PSZ'
	db	5,'DWORD'
	db	4,'BOOL'
	db	4,'BYTE'
	db	4,'WORD'
	db	5,'FLOAT'
	db	6,'LPVOID'
	db	7,'LPCVOID'
	db	3,'INT'
	db	4,'UINT'
	db	5,'PUINT'
	db	14,'POINTER_64_INT'
	db	6,'LONG32'
	db	5,'INT32'
	db	7,'ULONG32'
	db	8,'PULONG32'
	db	7,'DWORD32'
	db	8,'PDWORD32'
	db	6,'UINT32'
	db	7,'PUINT32'
	db	7,'INT_PTR'
	db	8,'UINT_PTR'
	db	9,'PUINT_PTR'
	db	8,'LONG_PTR'
	db	9,'ULONG_PTR'
	db	9,'UHALF_PTR'
	db	8,'HALF_PTR'
	db	10,'HANDLE_PTR'
	db	6,'SIZE_T'
	db	7,'SSIZE_T'
	db	9,'DWORD_PTR'
	db	6,'LONG64'
	db	5,'INT64'
	db	7,'ULONG64'
	db	7,'DWORD64'
	db	6,'UINT64'
	db	5,'PVOID'
	db	7,'PVOID64'
	db	4,'CHAR'
	db	5,'SHORT'
	db	4,'LONG'
	db	5,'WCHAR'
	db	5,'PCHAR'
	db	4,'LPCH'
	db	3,'PCH'
	db	5,'LPCCH'
	db	4,'PCCH'
	db	5,'NPSTR'
	db	5,'LPSTR'
	db	4,'PSTR'
	db	6,'LPCSTR'
	db	5,'PCSTR'
	db	5,'TCHAR'
	db	5,'TBYTE'
	db	6,'HANDLE'
	db	5,'FCHAR'
	db	6,'FSHORT'
	db	5,'FLONG'
	db	7,'HRESULT'
	db	5,'CCHAR'
	db	4,'LCID'
	db	6,'LANGID'
	db	8,'LONGLONG'
	db	9,'ULONGLONG'
	db	3,'USN'
	db	9,'DWORDLONG'
	db	7,'BOOLEAN'
	db	10,'KSPIN_LOCK'
	db	13,'PACCESS_TOKEN'
	db	20,'PSECURITY_DESCRIPTOR'
	db	4,'PSID'
	db	11,'ACCESS_MASK'
	db	27,'SECURITY_DESCRIPTOR_CONTROL'
	db	30,'SECURITY_CONTEXT_TRACKING_MODE'
	db	20,'SECURITY_INFORMATION'
	db	15,'EXECUTION_STATE'
	db	6,'WPARAM'
	db	6,'LPARAM'
	db	7,'LRESULT'
	db	4,'HWND'
	db	5,'HHOOK'
	db	4,'ATOM'
	db	7,'HGLOBAL'
	db	6,'HLOCAL'
	db	12,'GLOBALHANDLE'
	db	11,'LOCALHANDLE'
	db	7,'HGDIOBJ'
	db	4,'HKEY'
	db	6,'HACCEL'
	db	7,'HBITMAP'
	db	6,'HBRUSH'
	db	11,'HCOLORSPACE'
	db	3,'HDC'
	db	5,'HGLRC'
	db	5,'HDESK'
	db	12,'HENHMETAFILE'
	db	5,'HFONT'
	db	5,'HICON'
	db	5,'HMENU'
	db	9,'HMETAFILE'
	db	9,'HINSTANCE'
	db	7,'HMODULE'
	db	8,'HPALETTE'
	db	4,'HPEN'
	db	4,'HRGN'
	db	5,'HRSRC'
	db	4,'HSTR'
	db	5,'HTASK'
	db	7,'HWINSTA'
	db	3,'HKL'
	db	8,'HMONITOR'
	db	13,'HWINEVENTHOOK'
	db	5,'HFILE'
	db	7,'HCURSOR'
	db	8,'COLORREF'
	db	9,'LCSCSTYPE'
	db	13,'LCSGAMUTMATCH'
	db	11,'FXPT16DOT16'
	db	10,'FXPT2DOT30'
	db	5,'BCHAR'
	db	7,'COLOR16'
	db	4,'HDWP'
	db	13,'MENUTEMPLATEA'
	db	13,'MENUTEMPLATEW'
	db	12,'MENUTEMPLATE'
	db	15,'LPMENUTEMPLATEA'
	db	15,'LPMENUTEMPLATEW'
	db	14,'LPMENUTEMPLATE'
	db	10,'HDEVNOTIFY'
	db	8,'HELPPOLY'
	db	6,'LGRPID'
	db	6,'LCTYPE'
	db	7,'CALTYPE'
	db	5,'CALID'
	db	6,'REGSAM'
	db	9,'SC_HANDLE'
	db	21,'SERVICE_STATUS_HANDLE'
	db	7,'SC_LOCK'
	db	4,'HIMC'
	db	5,'HIMCC'
	db	6,'LPUINT'
	db	6,'u_char'
	db	7,'u_short'
	db	5,'u_int'
	db	6,'u_long'
	db	6,'SOCKET'
	db	11,'SERVICETYPE'
	db	5,'GROUP'
	db	11,'@std@time_t'
	db	6,'_TCHAR'
	db	7,'_TSCHAR'
	db	7,'_TUCHAR'
	db	7,'_TXCHAR'
	db	5,'_TINT'
	db	6,'int8_t'
	db	7,'uint8_t'
	db	7,'int16_t'
	db	8,'uint16_t'
	db	7,'int32_t'
	db	8,'uint32_t'
	db	7,'int64_t'
	db	8,'uint64_t'
	db	8,'intmax_t'
	db	9,'uintmax_t'
	db	12,'@std@clock_t'
	db	11,'@std@fpos_t'
	db	10,'@std@dev_t'
	db	10,'@std@ino_t'
	db	11,'@std@mode_t'
	db	12,'@std@nlink_t'
	db	10,'@std@uid_t'
	db	10,'@std@gid_t'
	db	10,'@std@off_t'
	db	3,'stk'
	db	9,'@stk@time'
	db	9,'@stk@cstr'
	db	8,'@stk@mem'
	db	8,'@stk@cpu'
	db	11,'@stk@thread'
	db	8,'@stk@con'
	db	11,'tsc_STARTED'
	db	10,'tsc_PAUSED'
	db	17,'tsc_LAST_MEASURED'
	db	7,'tsc_ADJ'
	db	11,'tsc_ELAPSED'
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
	?debug	D "C:\SRC\X86_LIBRARIES\stk\cpu\stk_cpu.h" 22358 31046
	?debug	D "C:\SRC\X86_LIBRARIES\stk\cpu\./../io/./../stk_main.h" 22356 36905
	?debug	D "C:\SRC\X86_LIBRARIES\stk\cpu\./../io/stk_console.h" 22172 32832
	?debug	D "C:\SRC\X86_LIBRARIES\stk\cpu\./../time/stk_time.h" 20752 24369
	?debug	D "C:\SRC\X86_LIBRARIES\stk\cpu\./../stasm/stk_stasm.h" 22356 36876
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\_lim.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\limits.h" 10305 10240
	?debug	D "C:\SRC\X86_LIBRARIES\stk\cpu\./../threads/./../cpu/./../stk_main.h" 22356 36905
	?debug	D "C:\SRC\X86_LIBRARIES\stk\cpu\./../threads/./../cpu/stk_cpu.h" 22358 31046
	?debug	D "C:\SRC\X86_LIBRARIES\stk\cpu\./../threads/./../time/stk_time.h" 20752 24369
	?debug	D "C:\SRC\X86_LIBRARIES\stk\cpu\./../threads/./../stk_main.h" 22356 36905
	?debug	D "C:\SRC\X86_LIBRARIES\stk\cpu\./../threads/stk_threads.h" 22172 32834
	?debug	D "C:\SRC\X86_LIBRARIES\stk\cpu\./../text/stk_cstr_utils.h" 22195 23737
	?debug	D "C:\SRC\X86_LIBRARIES\stk\cpu\./../mem/./.././stasm/./../stk_main.h" 22356 36905
	?debug	D "C:\SRC\X86_LIBRARIES\stk\cpu\./../mem/./.././stasm/stk_stasm.h" 22356 36876
	?debug	D "C:\SRC\X86_LIBRARIES\stk\cpu\./../mem/./.././text/./../mem/stk_mem.h" 20752 24368
	?debug	D "C:\SRC\X86_LIBRARIES\stk\cpu\./../mem/./.././text/./../stk_main.h" 22356 36905
	?debug	D "C:\SRC\X86_LIBRARIES\stk\cpu\./../mem/./.././text/stk_cstr_utils.h" 22195 23737
	?debug	D "C:\SRC\X86_LIBRARIES\stk\cpu\./../mem/./.././time/./../stk_main.h" 22356 36905
	?debug	D "C:\SRC\X86_LIBRARIES\stk\cpu\./../mem/./.././time/stk_time.h" 20752 24369
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\sys/stat.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\sys/types.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\fcntl.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\stdio.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\time.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\assert.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\search.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\stdlib.h" 10305 10240
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
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winuser.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\pshpack1.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\wingdi.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winerror.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winbase.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\pshpack8.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\pshpack2.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\poppack.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\_loc.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\locale.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\_str.h" 10305 10240
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
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\mem.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\windows.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\pshpack4.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winsock2.h" 10305 10240
	?debug	D "C:\SRC\X86_LIBRARIES\stk\cpu\./../mem/./../stk_main.h" 22356 36905
	?debug	D "C:\SRC\X86_LIBRARIES\stk\cpu\./../mem/stk_mem.h" 20752 24368
	?debug	D "C:\SRC\X86_LIBRARIES\stk\cpu\stk_cpu.cpp" 22358 31745
	end
