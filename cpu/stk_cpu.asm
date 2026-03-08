	.586p
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
	?debug	S "C:\Src\LIB\stk\cpu\stk_cpu.cpp"
	?debug	T "C:\Src\LIB\stk\cpu\stk_cpu.cpp"
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
	?debug L 78
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-32
	mov       dword ptr [ebp-8],offset @1
	?debug L 111
@2:
	db        15
	db        49
	?debug L 115
@3:
	mov	 [dword ptr [ebp-28]], eax
	?debug L 116
	mov	 [dword ptr [ebp-36]], edx
	?debug L 138
	mov       eax,dword ptr [ebp-36]
	xor       edx,edx
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 139
	mov       edx,dword ptr [ebp-20]
	xor       eax,eax
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 140
	mov       eax,dword ptr [ebp-28]
	xor       edx,edx
	or        eax,dword ptr [ebp-20]
	or        edx,dword ptr [ebp-16]
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 141
	mov       eax,dword ptr [ebp-20]
	mov       edx,dword ptr [ebp-16]
	?debug L 142
@5:
@4:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1:
	db        67,71,83,0
	dd        @@stk@cpu@rdtsc$qv+0
	dd        @1+0
	db        220,255,255,255,8,0,0,0,3,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0
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
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	2
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	3
	dw	0
	dw	0
	dw	0
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
?patch1	equ	@5-@@stk@cpu@rdtsc$qv+55
?patch2	equ	0
?patch3	equ	@5-@@stk@cpu@rdtsc$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$icklfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@rdtscex$qv	segment virtual
	align	2
@@stk@cpu@rdtscex$qv	proc	near
?live16386@0:
	?debug L 145
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-44
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @6
@7:
	jmp       short @9
	?debug L 272
@8:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@9:
	cmp       dword ptr [$icklfcia+4],0
	jne       short @8
	cmp       dword ptr [$icklfcia],0
@10:
	jne       short @8
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-48],eax
	mov       dword ptr [ebp-44],edx
	mov       eax,dword ptr [ebp-48]
	mov       dword ptr [$icklfcia],eax
	mov       eax,dword ptr [ebp-44]
	mov       dword ptr [$icklfcia+4],eax
	jmp       short @12
@11:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@12:
	cmp       dword ptr [$icklfcia+4],0
	jne       short @15
	cmp       dword ptr [$icklfcia],0
@15:
	je        short @13
	mov       eax,dword ptr [$icklfcia]
	mov       edx,dword ptr [$icklfcia+4]
	cmp       edx,dword ptr [ebp-44]
	jne       short @16
	cmp       eax,dword ptr [ebp-48]
@16:
	setne     cl
	and       ecx,1
	jmp       short @14
@13:
	xor       ecx,ecx
@14:
	test      cl,cl
	jne       short @11
	?debug L 274
	pushfd	
	?debug L 275
	push	 eax
	?debug L 276
	push	 ebx
	?debug L 277
	push	 ecx
	?debug L 278
	push	 edx
	?debug L 279
	push	 esi
	?debug L 280
	mov	 eax,000000001H
	?debug L 281
	xor	 ecx,ecx
	?debug L 282
	cpuid	
	?debug L 283
	mov	 ecx,000000001H
	?debug L 284
	shl	 ecx,27
	?debug L 285
	and	 ecx,edx
	?debug L 286
	xor	 eax,eax
	?debug L 287
	xor	 edx,edx
	?debug L 289
	test	 ecx,ecx
	?debug L 290
	je        @17
	?debug L 291
	mov	 eax,1
	?debug L 292
	cpuid	
	?debug L 293
	jmp       @18
	?debug L 306
	__emit__	( 00FH, 031H )
	?debug L 321
@18:
tsc_intel_serialize_measure:
	?debug L 332
	__emit__	( 00FH, 031H )
	?debug L 345
@17:
tsc_exit:
	?debug L 346
	mov	 [dword ptr [ebp-28]],eax
	?debug L 347
	mov	 [dword ptr [ebp-36]],edx
	?debug L 348
	pop	 esi
	?debug L 349
	pop	 edx
	?debug L 350
	pop	 ecx
	?debug L 351
	pop	 ebx
	?debug L 352
	pop	 eax
	?debug L 353
	popfd	
	?debug L 355
	mov       eax,dword ptr [ebp-36]
	xor       edx,edx
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 356
	mov       edx,dword ptr [ebp-20]
	xor       eax,eax
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 357
	mov       eax,dword ptr [ebp-28]
	xor       edx,edx
	or        eax,dword ptr [ebp-20]
	or        edx,dword ptr [ebp-16]
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 358
	mov       dword ptr [$icklfcia],0
	mov       dword ptr [$icklfcia+4],0
	?debug L 359
	mov       eax,dword ptr [ebp-20]
	mov       edx,dword ptr [ebp-16]
	jmp       short @19
	?debug L 368
	xor       eax,eax
	xor       edx,edx
	?debug L 369
@20:
@19:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@6:
	db        67,71,83,0
	dd        @@stk@cpu@rdtscex$qv+0
	dd        @6+0
	db        208,255,255,255,8,0,0,0,4,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,208,255,255,255,8,0,0,0
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
	dd	?patch4
	dd	?patch5
	dd	?patch6
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
	dw	22
	dw	513
	df	$icklfcia
	dw	0
	dw	4100
	dw	0
	dw	6
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65488
	dw	65535
	dw	118
	dw	0
	dw	7
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	8
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	9
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	119
	dw	0
	dw	10
	dw	0
	dw	0
	dw	0
?patch4	equ	@20-@@stk@cpu@rdtscex$qv+65
?patch5	equ	0
?patch6	equ	@20-@@stk@cpu@rdtscex$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	5
	dw	65480
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$agklfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_init$qv	segment virtual
	align	2
@@stk@cpu@tsc_init$qv	proc	near
?live16387@0:
	?debug L 372
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-52
	mov       dword ptr [ebp-8],offset @21
@22:
	jmp       short @24
	?debug L 375
@23:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@24:
	cmp       dword ptr [$agklfcia+4],0
	jne       short @23
	cmp       dword ptr [$agklfcia],0
	jne       short @23
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [$agklfcia],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [$agklfcia+4],eax
	jmp       short @27
@26:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@27:
	cmp       dword ptr [$agklfcia+4],0
	jne       short @30
	cmp       dword ptr [$agklfcia],0
@30:
	je        short @28
	mov       eax,dword ptr [$agklfcia]
	mov       edx,dword ptr [$agklfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @31
	cmp       eax,dword ptr [ebp-20]
@31:
	setne     cl
	and       ecx,1
	jmp       short @29
@28:
	xor       ecx,ecx
@29:
	test      cl,cl
	jne       short @26
	?debug L 377
	mov       dword ptr [_tsc_ADJ],0
	mov       dword ptr [_tsc_ADJ+4],0
	?debug L 378
	call      @@stk@cpu@tsc_start$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 379
	call      @@stk@cpu@tsc_checkpoint$qv
	mov       dword ptr [ebp-44],eax
	mov       dword ptr [ebp-40],edx
	?debug L 380
	mov       eax,dword ptr [ebp-44]
	mov       edx,dword ptr [ebp-40]
	cmp       edx,dword ptr [ebp-28]
	jne       short @33
	cmp       eax,dword ptr [ebp-32]
@33:
	jbe       short @32
	?debug L 381
	mov       eax,dword ptr [ebp-44]
	mov       edx,dword ptr [ebp-40]
	sub       eax,dword ptr [ebp-32]
	sbb       edx,dword ptr [ebp-28]
	mov       dword ptr [_tsc_ADJ],eax
	mov       dword ptr [_tsc_ADJ+4],edx
	?debug L 382
@32:
	mov       eax,dword ptr [_tsc_ADJ]
	mov       dword ptr [ebp-56],eax
	mov       eax,dword ptr [_tsc_ADJ+4]
	mov       dword ptr [ebp-52],eax
	?debug L 383
	mov       dword ptr [$agklfcia],0
	mov       dword ptr [$agklfcia+4],0
	?debug L 384
	mov       eax,dword ptr [ebp-56]
	mov       edx,dword ptr [ebp-52]
	?debug L 385
@35:
@34:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@21:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_init$qv+0
	dd        @21+0
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
	dd	?patch7
	dd	?patch8
	dd	?patch9
	df	@@stk@cpu@tsc_init$qv
	dw	0
	dw	4101
	dw	0
	dw	11
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
	dw	12
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	119
	dw	0
	dw	13
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65504
	dw	65535
	dw	119
	dw	0
	dw	14
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$agklfcia
	dw	0
	dw	4100
	dw	0
	dw	15
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	16
	dw	0
	dw	0
	dw	0
?patch7	equ	@35-@@stk@cpu@tsc_init$qv+63
?patch8	equ	0
?patch9	equ	@35-@@stk@cpu@tsc_init$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ijklfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_start$qv	segment virtual
	align	2
@@stk@cpu@tsc_start$qv	proc	near
?live16388@0:
	?debug L 388
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-28
	mov       dword ptr [ebp-8],offset @36
@37:
	jmp       short @39
	?debug L 391
@38:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@39:
	cmp       dword ptr [$ijklfcia+4],0
	jne       short @38
	cmp       dword ptr [$ijklfcia],0
	jne       short @38
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [$ijklfcia],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [$ijklfcia+4],eax
	jmp       short @42
@41:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@42:
	cmp       dword ptr [$ijklfcia+4],0
	jne       short @45
	cmp       dword ptr [$ijklfcia],0
@45:
	je        short @43
	mov       eax,dword ptr [$ijklfcia]
	mov       edx,dword ptr [$ijklfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @46
	cmp       eax,dword ptr [ebp-20]
@46:
	setne     cl
	and       ecx,1
	jmp       short @44
@43:
	xor       ecx,ecx
@44:
	test      cl,cl
	jne       short @41
	?debug L 392
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 393
	mov       eax,dword ptr [ebp-32]
	?debug L 394
	mov       edx,dword ptr [ebp-32]
	?debug L 393
	mov       dword ptr [_tsc_STARTED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_STARTED+4],eax
	?debug L 394
	mov       dword ptr [_tsc_LAST_MEASURED],edx
	mov       edx,dword ptr [ebp-28]
	?debug L 397
	mov       eax,dword ptr [ebp-32]
	?debug L 394
	mov       dword ptr [_tsc_LAST_MEASURED+4],edx
	?debug L 395
	mov       dword ptr [_tsc_PAUSED],0
	mov       dword ptr [_tsc_PAUSED+4],0
	mov       dword ptr [_tsc_ELAPSED],0
	mov       dword ptr [_tsc_ELAPSED+4],0
	?debug L 396
	mov       dword ptr [$ijklfcia],0
	mov       dword ptr [$ijklfcia+4],0
	?debug L 397
	mov       edx,dword ptr [ebp-28]
	?debug L 398
@48:
@47:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@36:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_start$qv+0
	dd        @36+0
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
	dd	?patch10
	dd	?patch11
	dd	?patch12
	df	@@stk@cpu@tsc_start$qv
	dw	0
	dw	4103
	dw	0
	dw	17
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
	dw	18
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ijklfcia
	dw	0
	dw	4100
	dw	0
	dw	19
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	20
	dw	0
	dw	0
	dw	0
?patch10	equ	@48-@@stk@cpu@tsc_start$qv+48
?patch11	equ	0
?patch12	equ	@48-@@stk@cpu@tsc_start$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$anklfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_checkpoint$qv	segment virtual
	align	2
@@stk@cpu@tsc_checkpoint$qv	proc	near
?live16389@0:
	?debug L 401
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-52
	mov       dword ptr [ebp-8],offset @49
@50:
	jmp       short @52
	?debug L 404
@51:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@52:
	cmp       dword ptr [$anklfcia+4],0
	jne       short @51
	cmp       dword ptr [$anklfcia],0
	jne       short @51
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [$anklfcia],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [$anklfcia+4],eax
	jmp       short @55
@54:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@55:
	cmp       dword ptr [$anklfcia+4],0
	jne       short @58
	cmp       dword ptr [$anklfcia],0
@58:
	je        short @56
	mov       eax,dword ptr [$anklfcia]
	mov       edx,dword ptr [$anklfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @59
	cmp       eax,dword ptr [ebp-20]
@59:
	setne     cl
	and       ecx,1
	jmp       short @57
@56:
	xor       ecx,ecx
@57:
	test      cl,cl
	jne       short @54
	?debug L 405
	mov       eax,dword ptr [_tsc_PAUSED]
	mov       dword ptr [ebp-32],eax
	mov       eax,dword ptr [_tsc_PAUSED+4]
	mov       dword ptr [ebp-28],eax
	?debug L 408
	cmp       dword ptr [ebp-28],0
	jne       short @60
	cmp       dword ptr [ebp-32],0
	jne       short @60
	?debug L 409
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 411
@60:
	mov       eax,dword ptr [_tsc_STARTED]
	mov       edx,dword ptr [_tsc_STARTED+4]
	sub       eax,dword ptr [_tsc_ADJ]
	sbb       edx,dword ptr [_tsc_ADJ+4]
	mov       dword ptr [ebp-44],eax
	mov       dword ptr [ebp-40],edx
	?debug L 412
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	cmp       edx,dword ptr [ebp-40]
	jne       short @63
	cmp       eax,dword ptr [ebp-44]
@63:
	jbe       short @62
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	sub       eax,dword ptr [ebp-44]
	sbb       edx,dword ptr [ebp-40]
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	jmp       short @64
	?debug L 414
@62:
	mov       dword ptr [ebp-56],0
	mov       dword ptr [ebp-52],0
	?debug L 416
@64:
	mov       eax,dword ptr [ebp-32]
	?debug L 417
	mov       edx,dword ptr [ebp-56]
	?debug L 416
	mov       dword ptr [_tsc_LAST_MEASURED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_LAST_MEASURED+4],eax
	?debug L 417
	mov       dword ptr [_tsc_ELAPSED],edx
	mov       edx,dword ptr [ebp-52]
	?debug L 419
	mov       eax,dword ptr [ebp-32]
	?debug L 417
	mov       dword ptr [_tsc_ELAPSED+4],edx
	?debug L 418
	mov       dword ptr [$anklfcia],0
	mov       dword ptr [$anklfcia+4],0
	?debug L 419
	mov       edx,dword ptr [ebp-28]
	?debug L 420
@66:
@65:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@49:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_checkpoint$qv+0
	dd        @49+0
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
	dd	?patch13
	dd	?patch14
	dd	?patch15
	df	@@stk@cpu@tsc_checkpoint$qv
	dw	0
	dw	4105
	dw	0
	dw	21
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
	dw	22
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	119
	dw	0
	dw	23
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65504
	dw	65535
	dw	119
	dw	0
	dw	24
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$anklfcia
	dw	0
	dw	4100
	dw	0
	dw	25
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	26
	dw	0
	dw	0
	dw	0
?patch13	equ	@66-@@stk@cpu@tsc_checkpoint$qv+66
?patch14	equ	0
?patch15	equ	@66-@@stk@cpu@tsc_checkpoint$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_elapsed$qv	segment virtual
	align	2
@@stk@cpu@tsc_elapsed$qv	proc	near
?live16390@0:
	?debug L 423
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @67
	?debug L 425
@68:
	mov       eax,dword ptr [_tsc_ELAPSED]
	mov       edx,dword ptr [_tsc_ELAPSED+4]
	?debug L 426
@70:
@69:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@67:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_elapsed$qv+0
	dd        @67+0
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
	dd	?patch16
	dd	?patch17
	dd	?patch18
	df	@@stk@cpu@tsc_elapsed$qv
	dw	0
	dw	4107
	dw	0
	dw	27
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
?patch16	equ	@70-@@stk@cpu@tsc_elapsed$qv+32
?patch17	equ	0
?patch18	equ	@70-@@stk@cpu@tsc_elapsed$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iallfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_pause$qv	segment virtual
	align	2
@@stk@cpu@tsc_pause$qv	proc	near
?live16391@0:
	?debug L 429
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-28
	mov       dword ptr [ebp-8],offset @71
@72:
	jmp       short @74
	?debug L 432
@73:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@74:
	cmp       dword ptr [$iallfcia+4],0
	jne       short @73
	cmp       dword ptr [$iallfcia],0
	jne       short @73
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [$iallfcia],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [$iallfcia+4],eax
	jmp       short @77
@76:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@77:
	cmp       dword ptr [$iallfcia+4],0
	jne       short @80
	cmp       dword ptr [$iallfcia],0
@80:
	je        short @78
	mov       eax,dword ptr [$iallfcia]
	mov       edx,dword ptr [$iallfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @81
	cmp       eax,dword ptr [ebp-20]
@81:
	setne     cl
	and       ecx,1
	jmp       short @79
@78:
	xor       ecx,ecx
@79:
	test      cl,cl
	jne       short @76
	?debug L 433
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 434
	mov       eax,dword ptr [ebp-32]
	?debug L 436
	mov       edx,dword ptr [ebp-28]
	?debug L 434
	mov       dword ptr [_tsc_PAUSED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_PAUSED+4],eax
	?debug L 435
	mov       dword ptr [$iallfcia],0
	mov       dword ptr [$iallfcia+4],0
	?debug L 436
	mov       eax,dword ptr [ebp-32]
	?debug L 437
@83:
@82:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@71:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_pause$qv+0
	dd        @71+0
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
	dd	?patch19
	dd	?patch20
	dd	?patch21
	df	@@stk@cpu@tsc_pause$qv
	dw	0
	dw	4109
	dw	0
	dw	28
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
	dw	29
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iallfcia
	dw	0
	dw	4100
	dw	0
	dw	30
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	31
	dw	0
	dw	0
	dw	0
?patch19	equ	@83-@@stk@cpu@tsc_pause$qv+50
?patch20	equ	0
?patch21	equ	@83-@@stk@cpu@tsc_pause$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$aellfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_resume$qv	segment virtual
	align	2
@@stk@cpu@tsc_resume$qv	proc	near
?live16392@0:
	?debug L 440
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-64
	mov       dword ptr [ebp-8],offset @84
@85:
	jmp       short @87
	?debug L 443
@86:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@87:
	cmp       dword ptr [$aellfcia+4],0
	jne       short @86
	cmp       dword ptr [$aellfcia],0
	jne       short @86
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [$aellfcia],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [$aellfcia+4],eax
	jmp       short @90
@89:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@90:
	cmp       dword ptr [$aellfcia+4],0
	jne       short @93
	cmp       dword ptr [$aellfcia],0
@93:
	je        short @91
	mov       eax,dword ptr [$aellfcia]
	mov       edx,dword ptr [$aellfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @94
	cmp       eax,dword ptr [ebp-20]
@94:
	setne     cl
	and       ecx,1
	jmp       short @92
@91:
	xor       ecx,ecx
@92:
	test      cl,cl
	jne       short @89
	?debug L 444
	mov       eax,dword ptr [_tsc_STARTED]
	mov       dword ptr [ebp-32],eax
	mov       eax,dword ptr [_tsc_STARTED+4]
	mov       dword ptr [ebp-28],eax
	?debug L 445
	mov       edx,dword ptr [_tsc_PAUSED]
	mov       dword ptr [ebp-44],edx
	mov       edx,dword ptr [_tsc_PAUSED+4]
	mov       dword ptr [ebp-40],edx
	?debug L 446
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	?debug L 447
	mov       eax,dword ptr [ebp-56]
	mov       edx,dword ptr [ebp-52]
	sub       eax,dword ptr [ebp-44]
	sbb       edx,dword ptr [ebp-40]
	add       eax,dword ptr [ebp-32]
	adc       edx,dword ptr [ebp-28]
	mov       dword ptr [ebp-68],eax
	mov       dword ptr [ebp-64],edx
	?debug L 448
	mov       eax,dword ptr [ebp-68]
	?debug L 450
	mov       edx,dword ptr [ebp-52]
	?debug L 448
	mov       dword ptr [_tsc_STARTED],eax
	mov       eax,dword ptr [ebp-64]
	mov       dword ptr [_tsc_STARTED+4],eax
	mov       dword ptr [_tsc_PAUSED],0
	mov       dword ptr [_tsc_PAUSED+4],0
	?debug L 449
	mov       dword ptr [$aellfcia],0
	mov       dword ptr [$aellfcia+4],0
	?debug L 450
	mov       eax,dword ptr [ebp-56]
	?debug L 451
@96:
@95:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@84:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_resume$qv+0
	dd        @84+0
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
	dd	?patch22
	dd	?patch23
	dd	?patch24
	df	@@stk@cpu@tsc_resume$qv
	dw	0
	dw	4111
	dw	0
	dw	32
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
	dw	33
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65480
	dw	65535
	dw	119
	dw	0
	dw	34
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	119
	dw	0
	dw	35
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65504
	dw	65535
	dw	119
	dw	0
	dw	36
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aellfcia
	dw	0
	dw	4100
	dw	0
	dw	37
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	38
	dw	0
	dw	0
	dw	0
?patch22	equ	@96-@@stk@cpu@tsc_resume$qv+74
?patch23	equ	0
?patch24	equ	@96-@@stk@cpu@tsc_resume$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ihllfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_start_paused$qv	segment virtual
	align	2
@@stk@cpu@tsc_start_paused$qv	proc	near
?live16393@0:
	?debug L 454
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-28
	mov       dword ptr [ebp-8],offset @97
@98:
	jmp       short @100
	?debug L 457
@99:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@100:
	cmp       dword ptr [$ihllfcia+4],0
	jne       short @99
	cmp       dword ptr [$ihllfcia],0
	jne       short @99
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [$ihllfcia],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [$ihllfcia+4],eax
	jmp       short @103
@102:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@103:
	cmp       dword ptr [$ihllfcia+4],0
	jne       short @106
	cmp       dword ptr [$ihllfcia],0
@106:
	je        short @104
	mov       eax,dword ptr [$ihllfcia]
	mov       edx,dword ptr [$ihllfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @107
	cmp       eax,dword ptr [ebp-20]
@107:
	setne     cl
	and       ecx,1
	jmp       short @105
@104:
	xor       ecx,ecx
@105:
	test      cl,cl
	jne       short @102
	?debug L 458
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 459
	mov       eax,dword ptr [ebp-32]
	?debug L 460
	mov       edx,dword ptr [ebp-32]
	?debug L 459
	mov       dword ptr [_tsc_LAST_MEASURED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_LAST_MEASURED+4],eax
	?debug L 460
	mov       dword ptr [_tsc_STARTED],edx
	mov       edx,dword ptr [ebp-28]
	?debug L 461
	mov       eax,dword ptr [ebp-32]
	?debug L 460
	mov       dword ptr [_tsc_STARTED+4],edx
	?debug L 461
	mov       dword ptr [_tsc_ELAPSED],0
	mov       dword ptr [_tsc_ELAPSED+4],0
	mov       dword ptr [_tsc_PAUSED],eax
	mov       eax,dword ptr [ebp-28]
	?debug L 463
	mov       edx,dword ptr [ebp-28]
	?debug L 461
	mov       dword ptr [_tsc_PAUSED+4],eax
	?debug L 462
	mov       dword ptr [$ihllfcia],0
	mov       dword ptr [$ihllfcia+4],0
	?debug L 463
	mov       eax,dword ptr [ebp-32]
	?debug L 464
@109:
@108:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@97:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_start_paused$qv+0
	dd        @97+0
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
	dd	?patch25
	dd	?patch26
	dd	?patch27
	df	@@stk@cpu@tsc_start_paused$qv
	dw	0
	dw	4113
	dw	0
	dw	39
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
	dw	40
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ihllfcia
	dw	0
	dw	4100
	dw	0
	dw	41
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	42
	dw	0
	dw	0
	dw	0
?patch25	equ	@109-@@stk@cpu@tsc_start_paused$qv+50
?patch26	equ	0
?patch27	equ	@109-@@stk@cpu@tsc_start_paused$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpuid$qpuit1t1t1uiui	segment virtual
	align	2
@@stk@cpu@cpuid$qpuit1t1t1uiui	proc	near
?live16394@0:
	?debug L 467
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @110
	?debug L 493
@111:
	mov	 eax,dword ptr [ebp+24]
	?debug L 494
	mov	 ecx,dword ptr [ebp+28]
	?debug L 495
	and	 eax,080000000H
	?debug L 496
	cpuid	
	?debug L 497
	mov	 ESI,dword ptr [ebp+8]
	?debug L 498
	mov	 [ESI],eax
	?debug L 499
	mov	 ESI,dword ptr [ebp+12]
	?debug L 500
	mov	 [ESI],ebx
	?debug L 501
	mov	 ESI,dword ptr [ebp+16]
	?debug L 502
	mov	 [ESI],ecx
	?debug L 503
	mov	 ESI,dword ptr [ebp+20]
	?debug L 504
	mov	 [ESI],edx
	?debug L 506
	mov       eax,dword ptr [ebp+8]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [eax]
	?debug L 515
@113:
@112:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@110:
	db        67,71,83,0
	dd        @@stk@cpu@cpuid$qpuit1t1t1uiui+0
	dd        @110+0
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
	dd	?patch28
	dd	?patch29
	dd	?patch30
	df	@@stk@cpu@cpuid$qpuit1t1t1uiui
	dw	0
	dw	4115
	dw	0
	dw	43
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
	dw	44
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	12
	dw	0
	dw	1141
	dw	0
	dw	45
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	16
	dw	0
	dw	1141
	dw	0
	dw	46
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	20
	dw	0
	dw	1141
	dw	0
	dw	47
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	24
	dw	0
	dw	117
	dw	0
	dw	48
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	28
	dw	0
	dw	117
	dw	0
	dw	49
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	50
	dw	0
	dw	0
	dw	0
?patch28	equ	@113-@@stk@cpu@cpuid$qpuit1t1t1uiui+83
?patch29	equ	0
?patch30	equ	@113-@@stk@cpu@cpuid$qpuit1t1t1uiui
	dw	2
	dw	6
	dw	8
	dw	531
	dw	5
	dw	65520
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ibmlfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$afmlfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$iimlfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$ammlfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$ipmlfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$adnlfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ignlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpuidex$qpuit1t1t1uiui	segment virtual
	align	2
@@stk@cpu@cpuidex$qpuit1t1t1uiui	proc	near
?live16395@0:
	?debug L 518
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-16
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @114
@115:
	jmp       short @117
	?debug L 528
@116:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@117:
	cmp       dword ptr [$ignlfcia+4],0
	jne       short @116
	cmp       dword ptr [$ignlfcia],0
@118:
	jne       short @116
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [$ignlfcia],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [$ignlfcia+4],eax
	jmp       short @120
@119:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@120:
	cmp       dword ptr [$ignlfcia+4],0
	jne       short @123
	cmp       dword ptr [$ignlfcia],0
@123:
	je        short @121
	mov       eax,dword ptr [$ignlfcia]
	mov       edx,dword ptr [$ignlfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @124
	cmp       eax,dword ptr [ebp-20]
@124:
	setne     cl
	and       ecx,1
	jmp       short @122
@121:
	xor       ecx,ecx
@122:
	test      cl,cl
	jne       short @119
	?debug L 529
	mov       eax,dword ptr [ebp+24]
	mov       edx,dword ptr [$ipmlfcia]
	cmp       eax,edx
	jne       short @125
	mov       eax,dword ptr [ebp+28]
	mov       edx,dword ptr [$adnlfcia]
	cmp       eax,edx
	jne       short @125
	?debug L 530
	mov       ecx,dword ptr [ebp+8]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [$ibmlfcia]
	mov       dword ptr [ecx],eax
	?debug L 531
	mov       edx,dword ptr [ebp+12]
	push      4
	push      edx
	push      0
	call      _CG_DA_EPY
	mov       ecx,dword ptr [$afmlfcia]
	mov       dword ptr [edx],ecx
	?debug L 532
	mov       eax,dword ptr [ebp+16]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$iimlfcia]
	mov       dword ptr [eax],edx
	?debug L 533
	mov       ecx,dword ptr [ebp+20]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [$ammlfcia]
	mov       dword ptr [ecx],eax
	?debug L 534
@126:
	mov       eax,dword ptr [$ibmlfcia]
	?debug L 535
?live16395@128: ; EAX = ret
	mov       dword ptr [$ignlfcia],0
	mov       dword ptr [$ignlfcia+4],0
	?debug L 536
	jmp       @127
	?debug L 537
?live16395@160: ; 
@128:
	jmp       short @129
	?debug L 539
@125:
	mov       edx,dword ptr [ebp+24]
	?debug L 540
	mov       ecx,dword ptr [ebp+28]
	?debug L 539
	mov       dword ptr [$ipmlfcia],edx
	?debug L 540
	mov       dword ptr [$adnlfcia],ecx
	?debug L 684
@129:
	pushfd	
	?debug L 685
	push	 eax
	?debug L 686
	push	 ebx
	?debug L 687
	push	 ecx
	?debug L 688
	push	 edx
	?debug L 689
	push	 esi
	?debug L 690
	push	 edi
	?debug L 691
	mov	 edi,dword ptr [ebp+24]
	?debug L 692
	mov	 eax,edi
	?debug L 693
	and	 eax,080000000H
	?debug L 694
	cpuid	
	?debug L 695
	mov	        esi,eax
	?debug L 696
	xor	        eax,eax
	?debug L 697
	xor	        ebx,ebx
	?debug L 698
	xor	        ecx,ecx
	?debug L 699
	xor	        edx,edx
	?debug L 700
	cmp	        esi,edi
	?debug L 701
	jb        short @130
	?debug L 702
	mov	        eax,edi
	?debug L 703
	mov	        edi,dword ptr [ebp+28]
	?debug L 704
	mov	        ecx,edi
	?debug L 705
	cpuid	
	?debug L 706
@130:
cpuid_save_result:
	?debug L 707
	mov	 dword ptr $ibmlfcia,eax
	?debug L 708
	mov	 dword ptr $afmlfcia,ebx
	?debug L 709
	mov	 dword ptr $iimlfcia,ecx
	?debug L 710
	mov	 dword ptr $ammlfcia,edx
	?debug L 711
	pop	 edi
	?debug L 712
	pop	 esi
	?debug L 713
	pop	 edx
	?debug L 714
	pop	 ecx
	?debug L 715
	pop	 ebx
	?debug L 716
	pop	 eax
	?debug L 717
	popfd	
	?debug L 723
	mov       eax,dword ptr [ebp+8]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$ibmlfcia]
	mov       dword ptr [eax],edx
	?debug L 724
	mov       ecx,dword ptr [ebp+12]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [$afmlfcia]
	mov       dword ptr [ecx],eax
	?debug L 725
	mov       edx,dword ptr [ebp+16]
	push      4
	push      edx
	push      0
	call      _CG_DA_EPY
	mov       ecx,dword ptr [$iimlfcia]
	mov       dword ptr [edx],ecx
	?debug L 726
	mov       eax,dword ptr [ebp+20]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$ammlfcia]
	mov       dword ptr [eax],edx
	?debug L 743
	mov       ecx,dword ptr [ebp+8]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [ecx]
	?debug L 744
?live16395@864: ; EAX = ret
	mov       dword ptr [$ignlfcia],0
	mov       dword ptr [$ignlfcia+4],0
	?debug L 746
?live16395@880: ; 
@131:
@127:
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@114:
	db        67,71,83,0
	dd        @@stk@cpu@cpuidex$qpuit1t1t1uiui+0
	dd        @114+0
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
	dd	?patch31
	dd	?patch32
	dd	?patch33
	df	@@stk@cpu@cpuidex$qpuit1t1t1uiui
	dw	0
	dw	4117
	dw	0
	dw	51
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
	dw	52
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	12
	dw	0
	dw	1141
	dw	0
	dw	53
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	16
	dw	0
	dw	1141
	dw	0
	dw	54
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	20
	dw	0
	dw	1141
	dw	0
	dw	55
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	24
	dw	0
	dw	117
	dw	0
	dw	56
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	28
	dw	0
	dw	117
	dw	0
	dw	57
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	58
	dw	0
	dw	0
	dw	0
	dw	?patch34
	dw	529
	dw	?patch35
	dd	?live16395@864-@@stk@cpu@cpuidex$qpuit1t1t1uiui
	dd	?live16395@880-?live16395@864
	dw	17
?patch35	equ	1
?patch34	equ	14
	dw	22
	dw	513
	df	$ignlfcia
	dw	0
	dw	4100
	dw	0
	dw	59
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	60
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$adnlfcia
	dw	0
	dw	117
	dw	0
	dw	61
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ipmlfcia
	dw	0
	dw	117
	dw	0
	dw	62
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ammlfcia
	dw	0
	dw	117
	dw	0
	dw	63
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iimlfcia
	dw	0
	dw	117
	dw	0
	dw	64
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$afmlfcia
	dw	0
	dw	117
	dw	0
	dw	65
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ibmlfcia
	dw	0
	dw	117
	dw	0
	dw	66
	dw	0
	dw	0
	dw	0
	dw	24
	dw	519
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch36
	df	@126
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	67
	dw	0
	dw	0
	dw	0
	dw	?patch37
	dw	529
	dw	?patch38
	dd	?live16395@128-@@stk@cpu@cpuidex$qpuit1t1t1uiui
	dd	?live16395@160-?live16395@128
	dw	17
?patch38	equ	1
?patch37	equ	14
?patch36	equ	@128-@126
	dw	2
	dw	6
?patch31	equ	@131-@@stk@cpu@cpuidex$qpuit1t1t1uiui+92
?patch32	equ	0
?patch33	equ	@131-@@stk@cpu@cpuidex$qpuit1t1t1uiui
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
$aknlfcia	label	dword
	dd	0
	dd	0
	dd	0
	dd	0
	db	1	dup(?)
	align	4
$innlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_vendor$qv	segment virtual
	align	2
@@stk@cpu@cpu_vendor$qv	proc	near
?live16396@0:
	?debug L 749
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-16
	mov       dword ptr [ebp-8],offset @132
@133:
	jmp       short @135
	?debug L 756
@134:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@135:
	cmp       dword ptr [$innlfcia+4],0
	jne       short @134
	cmp       dword ptr [$innlfcia],0
	jne       short @134
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [$innlfcia],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [$innlfcia+4],eax
	jmp       short @138
@137:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@138:
	cmp       dword ptr [$innlfcia+4],0
	jne       short @141
	cmp       dword ptr [$innlfcia],0
@141:
	je        short @139
	mov       eax,dword ptr [$innlfcia]
	mov       edx,dword ptr [$innlfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @142
	cmp       eax,dword ptr [ebp-20]
@142:
	setne     cl
	and       ecx,1
	jmp       short @140
@139:
	xor       ecx,ecx
@140:
	test      cl,cl
	jne       short @137
	?debug L 757
	push      0
	push      0
	push      offset $aknlfcia+4
	push      offset $aknlfcia+8
	push      offset $aknlfcia
	push      offset $aknlfcia+12
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 758
	mov       eax,dword ptr [$aknlfcia]
	test      eax,eax
	je        short @143
	?debug L 759
	xor       edx,edx
	mov       dword ptr [$aknlfcia+12],edx
	?debug L 761
@143:
	mov       dword ptr [$innlfcia],0
	mov       dword ptr [$innlfcia+4],0
	?debug L 762
	push      4
	push      offset $aknlfcia
	push      0
	call      _CG_GDA_EGY
	mov       eax,offset $aknlfcia
	?debug L 763
@145:
@144:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@132:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_vendor$qv+0
	dd        @132+0
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
	dd	?patch39
	dd	?patch40
	dd	?patch41
	df	@@stk@cpu@cpu_vendor$qv
	dw	0
	dw	4119
	dw	0
	dw	68
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
	df	$innlfcia
	dw	0
	dw	4100
	dw	0
	dw	69
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	70
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aknlfcia
	dw	0
	dw	4121
	dw	0
	dw	71
	dw	0
	dw	0
	dw	0
?patch39	equ	@145-@@stk@cpu@cpu_vendor$qv+41
?patch40	equ	0
?patch41	equ	@145-@@stk@cpu@cpu_vendor$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iholfcia	label	dword
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
$alolfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_name$qv	segment virtual
	align	2
@@stk@cpu@cpu_name$qv	proc	near
?live16397@0:
	?debug L 766
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @146
	?debug L 772
@147:
	mov       eax,dword ptr [$iholfcia]
	test      eax,eax
	je        short @151
	?debug L 773
	push      4
	push      offset $iholfcia
	push      0
	call      _CG_GDA_EGY
	mov       eax,offset $iholfcia
	jmp       @149
	?debug L 775
@150:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@151:
	cmp       dword ptr [$alolfcia+4],0
	jne       short @150
	cmp       dword ptr [$alolfcia],0
	jne       short @150
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$alolfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$alolfcia+4],edx
	jmp       short @154
@153:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@154:
	cmp       dword ptr [$alolfcia+4],0
	jne       short @157
	cmp       dword ptr [$alolfcia],0
@157:
	je        short @155
	mov       eax,dword ptr [$alolfcia]
	mov       edx,dword ptr [$alolfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @158
	cmp       eax,dword ptr [ebp-20]
@158:
	setne     cl
	and       ecx,1
	jmp       short @156
@155:
	xor       ecx,ecx
@156:
	test      cl,cl
	jne       short @153
	?debug L 778
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
	jae       short @159
	?debug L 779
	mov       dword ptr [$alolfcia],0
	mov       dword ptr [$alolfcia+4],0
	?debug L 780
	push      12
	push      4
	push      offset s@
	push      0
	call      _CG_GDA_EGY
	push      offset s@
	push      4
	push      offset $iholfcia
	push      0
	call      _CG_GDA_EGY
	push      offset $iholfcia
	call      @@stk@mem@mov$qpvpxvxui
	jmp       @149
	?debug L 782
@159:
	mov       esi,-2147483646
	xor       ebx,ebx
	?debug L 784
?live16397@128: ; EBX = i, ESI = f
@160:
	lea       eax,dword ptr [ebx+3]
	push      0
	shl       eax,2
	push      esi
	add       eax,offset $iholfcia
	push      offset $iholfcia
	push      eax
	call      _CG_A_BP
	push      eax
	lea       edx,dword ptr [ebx+2]
	shl       edx,2
	add       edx,offset $iholfcia
	push      offset $iholfcia
	push      edx
	call      _CG_A_BP
	push      edx
	lea       ecx,dword ptr [ebx+1]
	shl       ecx,2
	add       ecx,offset $iholfcia
	push      offset $iholfcia
	push      ecx
	call      _CG_A_BP
	push      ecx
	mov       eax,ebx
	shl       eax,2
	add       eax,offset $iholfcia
	push      offset $iholfcia
	push      eax
	call      _CG_A_BP
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 782
	inc       esi
	add       ebx,4
	cmp       ebx,12
	jb        short @160
	?debug L 786
?live16397@160: ; 
	push      32
	push      4
	push      offset $iholfcia
	push      0
	call      _CG_GDA_EGY
	push      offset $iholfcia
	call      @@stk@cstr@trim$qpcc
	?debug L 787
	mov       dword ptr [$alolfcia],0
	mov       dword ptr [$alolfcia+4],0
	?debug L 788
	push      4
	push      offset $iholfcia
	push      0
	call      _CG_GDA_EGY
	mov       eax,offset $iholfcia
	?debug L 789
@163:
@149:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@146:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_name$qv+0
	dd        @146+0
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
	dd	?patch42
	dd	?patch43
	dd	?patch44
	df	@@stk@cpu@cpu_name$qv
	dw	0
	dw	4122
	dw	0
	dw	72
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
	dw	73
	dw	0
	dw	0
	dw	0
	dw	?patch45
	dw	529
	dw	?patch46
	dd	?live16397@128-@@stk@cpu@cpu_name$qv
	dd	?live16397@160-?live16397@128
	dw	20
?patch46	equ	1
?patch45	equ	14
	dw	16
	dw	2
	dw	117
	dw	0
	dw	23
	dw	74
	dw	0
	dw	0
	dw	0
	dw	?patch47
	dw	529
	dw	?patch48
	dd	?live16397@128-@@stk@cpu@cpu_name$qv
	dd	?live16397@160-?live16397@128
	dw	23
?patch48	equ	1
?patch47	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	75
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	76
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	77
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	78
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$alolfcia
	dw	0
	dw	4100
	dw	0
	dw	79
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	80
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iholfcia
	dw	0
	dw	4124
	dw	0
	dw	81
	dw	0
	dw	0
	dw	0
?patch42	equ	@163-@@stk@cpu@cpu_name$qv+73
?patch43	equ	0
?patch44	equ	@163-@@stk@cpu@cpu_name$qv
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
$afplfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$iiplfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_threads$qv	segment virtual
	align	2
@@stk@cpu@cpu_num_threads$qv	proc	near
?live16398@0:
	?debug L 792
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @164
	?debug L 798
@165:
	mov       eax,dword ptr [$afplfcia]
	cmp       eax,-1
	jne       @167
	?debug L 799
?live16398@32: ; EAX = @temp4
	jmp       short @169
	?debug L 801
?live16398@48: ; 
@168:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@169:
	cmp       dword ptr [$iiplfcia+4],0
	jne       short @168
	cmp       dword ptr [$iiplfcia],0
	jne       short @168
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$iiplfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$iiplfcia+4],edx
	jmp       short @172
@171:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@172:
	cmp       dword ptr [$iiplfcia+4],0
	jne       short @175
	cmp       dword ptr [$iiplfcia],0
@175:
	je        short @173
	mov       eax,dword ptr [$iiplfcia]
	mov       edx,dword ptr [$iiplfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @176
	cmp       eax,dword ptr [ebp-20]
@176:
	setne     cl
	and       ecx,1
	jmp       short @174
@173:
	xor       ecx,ecx
@174:
	test      cl,cl
	jne       short @171
	?debug L 804
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
	?debug L 806
	mov       eax,dword ptr [ebp-44]
	shr       eax,16
	and       eax,255
	inc       eax
	mov       dword ptr [$afplfcia],eax
	?debug L 808
?live16398@96: ; EAX = @temp3
	mov       dword ptr [$iiplfcia],0
	mov       dword ptr [$iiplfcia+4],0
	?debug L 810
?live16398@112: ; 
@177:
@167:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@164:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_num_threads$qv+0
	dd        @164+0
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
	dd	?patch49
	dd	?patch50
	dd	?patch51
	df	@@stk@cpu@cpu_num_threads$qv
	dw	0
	dw	4125
	dw	0
	dw	82
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
	dw	83
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	84
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	85
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	86
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	87
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iiplfcia
	dw	0
	dw	4100
	dw	0
	dw	88
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	89
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$afplfcia
	dw	0
	dw	117
	dw	0
	dw	90
	dw	0
	dw	0
	dw	0
?patch49	equ	@177-@@stk@cpu@cpu_num_threads$qv+74
?patch50	equ	0
?patch51	equ	@177-@@stk@cpu@cpu_num_threads$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$amplfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ipplfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_cores$qv	segment virtual
	align	2
@@stk@cpu@cpu_num_cores$qv	proc	near
?live16399@0:
	?debug L 813
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @178
	?debug L 819
@179:
	mov       eax,dword ptr [$amplfcia]
	cmp       eax,-1
	jne       @181
	?debug L 820
?live16399@32: ; EAX = @temp3
	jmp       short @183
	?debug L 822
?live16399@48: ; 
@182:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@183:
	cmp       dword ptr [$ipplfcia+4],0
	jne       short @182
	cmp       dword ptr [$ipplfcia],0
	jne       short @182
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$ipplfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$ipplfcia+4],edx
	jmp       short @186
@185:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@186:
	cmp       dword ptr [$ipplfcia+4],0
	jne       short @189
	cmp       dword ptr [$ipplfcia],0
@189:
	je        short @187
	mov       eax,dword ptr [$ipplfcia]
	mov       edx,dword ptr [$ipplfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @190
	cmp       eax,dword ptr [ebp-20]
@190:
	setne     cl
	and       ecx,1
	jmp       short @188
@187:
	xor       ecx,ecx
@188:
	test      cl,cl
	jne       short @185
	?debug L 825
	push      12
	push      4
	push      offset s@
	push      13
	call      _CG_GDA_EGY
	push      offset s@+13
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       short @191
	cmp       eax,0
	jne       short @191
	?debug L 827
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
	?debug L 828
	mov       ecx,dword ptr [ebp-52]
	shr       ecx,26
	and       ecx,63
	inc       ecx
	mov       dword ptr [$amplfcia],ecx
	?debug L 830
	jmp       short @193
	?debug L 832
@191:
	push      12
	push      4
	push      offset s@
	push      26
	call      _CG_GDA_EGY
	push      offset s@+26
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       short @194
	cmp       eax,0
	jne       short @194
	?debug L 834
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
	?debug L 835
	mov       edx,dword ptr [ebp-36]
	and       edx,255
	inc       edx
	mov       dword ptr [$amplfcia],edx
	?debug L 837
	jmp       short @193
	?debug L 838
@194:
	call      @@stk@cpu@cpu_num_threads$qv
	mov       dword ptr [$amplfcia],eax
	?debug L 839
@193:
	mov       eax,dword ptr [$amplfcia]
	?debug L 840
?live16399@224: ; EAX = ret
	mov       dword ptr [$ipplfcia],0
	mov       dword ptr [$ipplfcia+4],0
	?debug L 843
?live16399@240: ; 
@196:
@181:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@178:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_num_cores$qv+0
	dd        @178+0
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
	dd	?patch52
	dd	?patch53
	dd	?patch54
	df	@@stk@cpu@cpu_num_cores$qv
	dw	0
	dw	4127
	dw	0
	dw	91
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
	dw	92
	dw	0
	dw	0
	dw	0
	dw	?patch55
	dw	529
	dw	?patch56
	dd	?live16399@224-@@stk@cpu@cpu_num_cores$qv
	dd	?live16399@240-?live16399@224
	dw	17
?patch56	equ	1
?patch55	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	93
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	94
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	95
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	96
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ipplfcia
	dw	0
	dw	4100
	dw	0
	dw	97
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	98
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$amplfcia
	dw	0
	dw	117
	dw	0
	dw	99
	dw	0
	dw	0
	dw	0
?patch52	equ	@196-@@stk@cpu@cpu_num_cores$qv+73
?patch53	equ	0
?patch54	equ	@196-@@stk@cpu@cpu_num_cores$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$adamfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$igamfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_cache_size$quc	segment virtual
	align	2
@@stk@cpu@cpu_cache_size$quc	proc	near
?live16400@0:
	?debug L 844
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @197
@198:
	mov       ebx,dword ptr [ebp+8]
	?debug L 850
?live16400@16: ; EBX = a_level
	mov       eax,dword ptr [$adamfcia]
	cmp       eax,-1
	jne       @200
	?debug L 851
?live16400@32: ; EAX = @temp5
	jmp       short @202
	?debug L 853
?live16400@48: ; EBX = a_level
@201:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@202:
	cmp       dword ptr [$igamfcia+4],0
	jne       short @201
	cmp       dword ptr [$igamfcia],0
	jne       short @201
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$igamfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$igamfcia+4],edx
	jmp       short @205
@204:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@205:
	cmp       dword ptr [$igamfcia+4],0
	jne       short @208
	cmp       dword ptr [$igamfcia],0
@208:
	je        short @206
	mov       eax,dword ptr [$igamfcia]
	mov       edx,dword ptr [$igamfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @209
	cmp       eax,dword ptr [ebp-20]
@209:
	setne     cl
	and       ecx,1
	jmp       short @207
@206:
	xor       ecx,ecx
@207:
	test      cl,cl
	jne       short @204
	?debug L 856
	push      12
	push      4
	push      offset s@
	push      13
	call      _CG_GDA_EGY
	push      offset s@+13
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       @210
	cmp       eax,0
	jne       @210
	?debug L 857
	cmp       bl,2
	jne       @212
	?debug L 858
?live16400@96: ; 
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
	?debug L 859
	mov       eax,dword ptr [ebp-28]
	and       eax,255
	cmp       eax,64
	jne       short @213
	?debug L 860
	xor       edx,edx
	mov       dword ptr [$adamfcia],edx
	jmp       @214
	?debug L 862
?live16400@144: ; EAX = @temp4
@213:
	cmp       eax,65
	jne       short @215
	?debug L 863
?live16400@160: ; 
	mov       dword ptr [$adamfcia],128
	jmp       @214
	?debug L 865
?live16400@176: ; EAX = @temp4
@215:
	cmp       eax,66
	jne       short @216
	?debug L 866
?live16400@192: ; 
	mov       dword ptr [$adamfcia],256
	jmp       @214
	?debug L 868
?live16400@208: ; EAX = @temp4
@216:
	cmp       eax,67
	jne       short @217
	?debug L 869
?live16400@224: ; 
	mov       dword ptr [$adamfcia],512
	jmp       @214
	?debug L 871
?live16400@240: ; EAX = @temp4
@217:
	cmp       eax,68
	jne       short @218
	?debug L 872
?live16400@256: ; 
	mov       dword ptr [$adamfcia],1024
	jmp       @214
	?debug L 874
?live16400@272: ; EAX = @temp4
@218:
	cmp       eax,69
	jne       short @219
	?debug L 875
?live16400@288: ; 
	mov       dword ptr [$adamfcia],2048
	jmp       @214
	?debug L 879
@219:
	xor       ecx,ecx
	mov       dword ptr [$adamfcia],ecx
	?debug L 881
	jmp       @214
	?debug L 882
@212:
	xor       eax,eax
	mov       dword ptr [$adamfcia],eax
	?debug L 883
	jmp       @214
	?debug L 885
?live16400@368: ; EBX = a_level
@210:
	push      12
	push      4
	push      offset s@
	push      26
	call      _CG_GDA_EGY
	push      offset s@+26
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       short @221
	cmp       eax,0
@221:
	jne       @222
	?debug L 886
	test      bl,bl
	jne       short @223
	?debug L 887
?live16400@400: ; 
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
	?debug L 888
	mov       ecx,dword ptr [ebp-28]
	shr       ecx,24
	and       ecx,255
	mov       dword ptr [$adamfcia],ecx
	?debug L 889
	jmp       @224
	?debug L 891
?live16400@448: ; EBX = a_level
@223:
	cmp       bl,1
	jne       short @225
	?debug L 892
?live16400@464: ; 
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
	?debug L 893
	mov       edx,dword ptr [ebp-36]
	shr       edx,24
	and       edx,255
	mov       dword ptr [$adamfcia],edx
	?debug L 894
	jmp       short @224
	?debug L 896
?live16400@512: ; EBX = a_level
@225:
	cmp       bl,2
	jne       short @226
	?debug L 897
?live16400@528: ; 
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
	?debug L 898
	mov       eax,dword ptr [ebp-36]
	shr       eax,16
	and       eax,65535
	mov       dword ptr [$adamfcia],eax
	?debug L 899
	jmp       short @224
	?debug L 901
?live16400@576: ; EBX = a_level
@226:
	cmp       bl,3
	jne       short @227
	?debug L 902
?live16400@592: ; 
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
	?debug L 903
	mov       ecx,dword ptr [ebp-28]
	shr       ecx,18
	and       ecx,16383
	shl       ecx,9
	mov       dword ptr [$adamfcia],ecx
	?debug L 906
@227:
@224:
@222:
@214:
	mov       eax,dword ptr [$adamfcia]
	?debug L 907
?live16400@640: ; EAX = ret
	mov       dword ptr [$igamfcia],0
	mov       dword ptr [$igamfcia+4],0
	?debug L 909
?live16400@656: ; 
@228:
@200:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@197:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_cache_size$quc+0
	dd        @197+0
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
	dd	?patch57
	dd	?patch58
	dd	?patch59
	df	@@stk@cpu@cpu_cache_size$quc
	dw	0
	dw	4129
	dw	0
	dw	100
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
	dw	101
	dw	0
	dw	0
	dw	0
	dw	?patch60
	dw	529
	dw	?patch61
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
?patch61	equ	6
?patch60	equ	64
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	102
	dw	0
	dw	0
	dw	0
	dw	?patch62
	dw	529
	dw	?patch63
	dd	?live16400@640-@@stk@cpu@cpu_cache_size$quc
	dd	?live16400@656-?live16400@640
	dw	17
?patch63	equ	1
?patch62	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	103
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	104
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	105
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	106
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$igamfcia
	dw	0
	dw	4100
	dw	0
	dw	107
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	108
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$adamfcia
	dw	0
	dw	117
	dw	0
	dw	109
	dw	0
	dw	0
	dw	0
?patch57	equ	@228-@@stk@cpu@cpu_cache_size$quc+73
?patch58	equ	0
?patch59	equ	@228-@@stk@cpu@cpu_cache_size$quc
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
$akamfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$inamfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_cache_line_size$quc	segment virtual
	align	2
@@stk@cpu@cpu_cache_line_size$quc	proc	near
?live16401@0:
	?debug L 912
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @229
@230:
	mov       ebx,dword ptr [ebp+8]
	?debug L 918
?live16401@16: ; EBX = a_level
	mov       eax,dword ptr [$akamfcia]
	cmp       eax,-1
	jne       @232
	?debug L 919
?live16401@32: ; EAX = @temp4
	jmp       short @234
	?debug L 921
?live16401@48: ; EBX = a_level
@233:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@234:
	cmp       dword ptr [$inamfcia+4],0
	jne       short @233
	cmp       dword ptr [$inamfcia],0
	jne       short @233
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$inamfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$inamfcia+4],edx
	jmp       short @237
@236:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@237:
	cmp       dword ptr [$inamfcia+4],0
	jne       short @240
	cmp       dword ptr [$inamfcia],0
@240:
	je        short @238
	mov       eax,dword ptr [$inamfcia]
	mov       edx,dword ptr [$inamfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @241
	cmp       eax,dword ptr [ebp-20]
@241:
	setne     cl
	and       ecx,1
	jmp       short @239
@238:
	xor       ecx,ecx
@239:
	test      cl,cl
	jne       short @236
	?debug L 924
	push      12
	push      4
	push      offset s@
	push      13
	call      _CG_GDA_EGY
	push      offset s@+13
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       short @242
	cmp       eax,0
	jne       short @242
	?debug L 925
?live16401@80: ; 
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
	?debug L 926
	mov       ecx,dword ptr [ebp-44]
	and       ecx,4095
	inc       ecx
	mov       dword ptr [$akamfcia],ecx
	?debug L 927
	jmp       @244
	?debug L 929
?live16401@128: ; EBX = a_level
@242:
	push      12
	push      4
	push      offset s@
	push      26
	call      _CG_GDA_EGY
	push      offset s@+26
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       @245
	cmp       eax,0
	jne       @245
	?debug L 930
	test      bl,bl
	jne       short @247
	?debug L 931
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
	?debug L 932
	mov       edx,dword ptr [ebp-28]
	and       edx,255
	mov       dword ptr [$akamfcia],edx
	?debug L 934
@247:
	cmp       bl,1
	jne       short @248
	?debug L 935
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
	?debug L 936
	mov       eax,dword ptr [ebp-36]
	and       eax,255
	mov       dword ptr [$akamfcia],eax
	?debug L 938
@248:
	cmp       bl,2
	jne       short @249
	?debug L 939
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
	?debug L 940
	mov       ecx,dword ptr [ebp-36]
	and       ecx,255
	mov       dword ptr [$akamfcia],ecx
	?debug L 942
@249:
	cmp       bl,3
	jne       short @250
	?debug L 943
?live16401@304: ; 
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
	?debug L 944
	mov       edx,dword ptr [ebp-28]
	and       edx,255
	mov       dword ptr [$akamfcia],edx
	?debug L 947
@250:
@245:
@244:
	mov       eax,dword ptr [$akamfcia]
	?debug L 948
?live16401@352: ; EAX = ret
	mov       dword ptr [$inamfcia],0
	mov       dword ptr [$inamfcia+4],0
	?debug L 951
?live16401@368: ; 
@251:
@232:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@229:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_cache_line_size$quc+0
	dd        @229+0
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
	dd	?patch64
	dd	?patch65
	dd	?patch66
	df	@@stk@cpu@cpu_cache_line_size$quc
	dw	0
	dw	4131
	dw	0
	dw	110
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
	dw	111
	dw	0
	dw	0
	dw	0
	dw	?patch67
	dw	529
	dw	?patch68
	dd	?live16401@16-@@stk@cpu@cpu_cache_line_size$quc
	dd	?live16401@32-?live16401@16
	dw	4
	dd	?live16401@48-@@stk@cpu@cpu_cache_line_size$quc
	dd	?live16401@80-?live16401@48
	dw	4
	dd	?live16401@128-@@stk@cpu@cpu_cache_line_size$quc
	dd	?live16401@304-?live16401@128
	dw	4
?patch68	equ	3
?patch67	equ	34
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	112
	dw	0
	dw	0
	dw	0
	dw	?patch69
	dw	529
	dw	?patch70
	dd	?live16401@352-@@stk@cpu@cpu_cache_line_size$quc
	dd	?live16401@368-?live16401@352
	dw	17
?patch70	equ	1
?patch69	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	113
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	114
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	115
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	116
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$inamfcia
	dw	0
	dw	4100
	dw	0
	dw	117
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	118
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$akamfcia
	dw	0
	dw	117
	dw	0
	dw	119
	dw	0
	dw	0
	dw	0
?patch64	equ	@251-@@stk@cpu@cpu_cache_line_size$quc+72
?patch65	equ	0
?patch66	equ	@251-@@stk@cpu@cpu_cache_line_size$quc
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
$abbmfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$iebmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_mhz$qo	segment virtual
	align	2
@@stk@cpu@cpu_num_mhz$qo	proc	near
?live16402@0:
	?debug L 954
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-168
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @252
	?debug L 960
@253:
	mov       eax,dword ptr [$abbmfcia]
	test      eax,eax
	je        short @257
	mov       dl,byte ptr [ebp+8]
	test      dl,dl
	je        @255
	?debug L 961
?live16402@32: ; EAX = @temp18
	jmp       short @257
	?debug L 963
?live16402@48: ; 
@256:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@257:
	cmp       dword ptr [$iebmfcia+4],0
	jne       short @256
	cmp       dword ptr [$iebmfcia],0
	jne       short @256
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$iebmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$iebmfcia+4],ecx
	jmp       short @260
@259:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@260:
	cmp       dword ptr [$iebmfcia+4],0
	jne       short @263
	cmp       dword ptr [$iebmfcia],0
@263:
	je        short @261
	mov       eax,dword ptr [$iebmfcia]
	mov       edx,dword ptr [$iebmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @264
	cmp       eax,dword ptr [ebp-20]
@264:
	setne     al
	and       eax,1
	jmp       short @262
@261:
	xor       eax,eax
@262:
	test      al,al
	jne       short @259
	?debug L 976
	xor       ebx,ebx
	?debug L 977
?live16402@80: ; EBX = i
@265:
	call      @@stk@cpu@tsc_init$qv
	?debug L 978
	call      @@stk@cpu@tsc_start$qv
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-68],eax
	mov       dword ptr [ebp-64],edx
	call      @@stk@cpu@tsc_checkpoint$qv
	?debug L 979
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-128],eax
	mov       dword ptr [ebp-124],edx
	?debug L 980
@267:
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-80],eax
	mov       dword ptr [ebp-76],edx
	?debug L 981
	mov       eax,dword ptr [ebp-80]
	mov       edx,dword ptr [ebp-76]
	cmp       edx,dword ptr [ebp-64]
	jne       short @269
	cmp       eax,dword ptr [ebp-68]
@269:
	jbe       short @267
	?debug L 982
	call      @@stk@cpu@tsc_start$qv
	?debug L 983
@270:
	mov       edx,21
	?debug L 984
?live16402@192: ; EBX = i, EDX = trash1
@271:
	xor       eax,eax
@273:
	inc       eax
	cmp       eax,1000000
	jb        short @273
	?debug L 983
	dec       edx
	test      edx,edx
	ja        short @271
	?debug L 987
?live16402@224: ; EBX = i
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-92],eax
	mov       dword ptr [ebp-88],edx
	?debug L 988
@277:
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-104],eax
	mov       dword ptr [ebp-100],edx
	?debug L 989
	mov       eax,dword ptr [ebp-104]
	mov       edx,dword ptr [ebp-100]
	cmp       edx,dword ptr [ebp-88]
	jne       short @279
	cmp       eax,dword ptr [ebp-92]
@279:
	jbe       short @277
	?debug L 990
	call      @@stk@cpu@tsc_checkpoint$qv
	?debug L 991
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	?debug L 992
	mov       eax,dword ptr [ebp-104]
	mov       edx,dword ptr [ebp-100]
	sub       eax,dword ptr [ebp-80]
	sbb       edx,dword ptr [ebp-76]
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	?debug L 993
	mov       eax,dword ptr [ebp-116]
	mov       edx,dword ptr [ebp-112]
	sub       eax,dword ptr [ebp-128]
	sbb       edx,dword ptr [ebp-124]
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	?debug L 994
	push      0
	push      1000
	mov       eax,dword ptr [ebp-116]
	mov       edx,dword ptr [ebp-112]
	call      __llmul
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	?debug L 995
	cmp       dword ptr [ebp-52],0
	jne       short @281
	cmp       dword ptr [ebp-56],0
@281:
	je        short @280
	push      dword ptr [ebp-52]
	push      dword ptr [ebp-56]
	mov       eax,dword ptr [ebp-116]
	mov       edx,dword ptr [ebp-112]
	call      __lludiv
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	jmp       short @282
	?debug L 996
@280:
	mov       dword ptr [ebp-116],0
	mov       dword ptr [ebp-112],0
	?debug L 997
@282:
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
@283:
	inc       ebx
	cmp       ebx,5
	jb        @265
	?debug L 999
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
	?debug L 1000
?live16402@416: ; EBX = i, ECX = imax, ESI = imin
@285:
	push      8
	push      -172
	push      ebx
	push      3
	push      0
	call      _CG_LDA_EOXSY
	mov       eax,dword ptr [ebp+8*ebx-172]
	mov       edx,dword ptr [ebp+8*ebx-168]
	cmp       edx,dword ptr [ebp-28]
	jne       short @288
	cmp       eax,dword ptr [ebp-32]
@288:
	jbe       short @287
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
	?debug L 1001
@287:
	push      8
	push      -172
	push      ebx
	push      3
	push      0
	call      _CG_LDA_EOXSY
	mov       eax,dword ptr [ebp+8*ebx-172]
	mov       edx,dword ptr [ebp+8*ebx-168]
	cmp       edx,dword ptr [ebp-40]
	jne       short @290
	cmp       eax,dword ptr [ebp-44]
@290:
	jae       short @289
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
@289:
	inc       ebx
	cmp       ebx,5
	jb        @285
	?debug L 1003
?live16402@448: ; ECX = imax, ESI = imin
	mov       dword ptr [ebp-116],0
	mov       dword ptr [ebp-112],0
	xor       ebx,ebx
@292:
	cmp       esi,ebx
	je        short @294
	cmp       ecx,ebx
	je        short @294
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
@294:
	inc       ebx
	cmp       ebx,5
	jb        short @292
	?debug L 1005
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
	?debug L 1006
	mov       eax,dword ptr [ebp-116]
	mov       ecx,eax
	mov       dword ptr [$abbmfcia],ecx
	?debug L 1008
?live16402@496: ; ECX = @temp17
	mov       dword ptr [$iebmfcia],0
	mov       dword ptr [$iebmfcia+4],0
	?debug L 1009
	mov       eax,ecx
	?debug L 1010
?live16402@528: ; 
@296:
@255:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@252:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_num_mhz$qo+0
	dd        @252+0
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
	dd	?patch71
	dd	?patch72
	dd	?patch73
	df	@@stk@cpu@cpu_num_mhz$qo
	dw	0
	dw	4133
	dw	0
	dw	120
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
	dw	121
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65408
	dw	65535
	dw	119
	dw	0
	dw	122
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65420
	dw	65535
	dw	119
	dw	0
	dw	123
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65432
	dw	65535
	dw	119
	dw	0
	dw	124
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65444
	dw	65535
	dw	119
	dw	0
	dw	125
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65456
	dw	65535
	dw	119
	dw	0
	dw	126
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65468
	dw	65535
	dw	119
	dw	0
	dw	127
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65480
	dw	65535
	dw	119
	dw	0
	dw	128
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	20
	dw	129
	dw	0
	dw	0
	dw	0
	dw	?patch74
	dw	529
	dw	?patch75
	dd	?live16402@80-@@stk@cpu@cpu_num_mhz$qo
	dd	?live16402@400-?live16402@80
	dw	20
	dd	?live16402@416-@@stk@cpu@cpu_num_mhz$qo
	dd	?live16402@448-?live16402@416
	dw	20
?patch75	equ	2
?patch74	equ	24
	dw	16
	dw	2
	dw	117
	dw	0
	dw	23
	dw	130
	dw	0
	dw	0
	dw	0
	dw	?patch76
	dw	529
	dw	?patch77
	dd	?live16402@416-@@stk@cpu@cpu_num_mhz$qo
	dd	?live16402@464-?live16402@416
	dw	23
?patch77	equ	1
?patch76	equ	14
	dw	16
	dw	2
	dw	117
	dw	0
	dw	18
	dw	131
	dw	0
	dw	0
	dw	0
	dw	?patch78
	dw	529
	dw	?patch79
	dd	?live16402@416-@@stk@cpu@cpu_num_mhz$qo
	dd	?live16402@464-?live16402@416
	dw	18
?patch79	equ	1
?patch78	equ	14
	dw	18
	dw	512
	dw	65364
	dw	65535
	dw	4135
	dw	0
	dw	132
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	119
	dw	0
	dw	133
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65504
	dw	65535
	dw	119
	dw	0
	dw	134
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iebmfcia
	dw	0
	dw	4100
	dw	0
	dw	135
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	136
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$abbmfcia
	dw	0
	dw	117
	dw	0
	dw	137
	dw	0
	dw	0
	dw	0
	dw	24
	dw	519
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch80
	df	@270
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	138
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	19
	dw	139
	dw	0
	dw	0
	dw	0
	dw	?patch81
	dw	529
	dw	?patch82
	dd	?live16402@192-@@stk@cpu@cpu_num_mhz$qo
	dd	?live16402@224-?live16402@192
	dw	19
?patch82	equ	1
?patch81	equ	14
?patch80	equ	@283-@270
	dw	2
	dw	6
?patch71	equ	@296-@@stk@cpu@cpu_num_mhz$qo+130
?patch72	equ	0
?patch73	equ	@296-@@stk@cpu@cpu_num_mhz$qo
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
$iobmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$accmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_x87$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_x87$qv	proc	near
?live16403@0:
	?debug L 1015
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @297
	?debug L 1021
@298:
	mov       eax,dword ptr [$iobmfcia]
	cmp       eax,-1
	je        short @302
	?debug L 1022
?live16403@32: ; EAX = @temp2
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @300
	?debug L 1024
?live16403@48: ; 
@301:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@302:
	cmp       dword ptr [$accmfcia+4],0
	jne       short @301
	cmp       dword ptr [$accmfcia],0
	jne       short @301
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$accmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$accmfcia+4],ecx
	jmp       short @305
@304:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@305:
	cmp       dword ptr [$accmfcia+4],0
	jne       short @308
	cmp       dword ptr [$accmfcia],0
@308:
	je        short @306
	mov       eax,dword ptr [$accmfcia]
	mov       edx,dword ptr [$accmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @309
	cmp       eax,dword ptr [ebp-20]
@309:
	setne     al
	and       eax,1
	jmp       short @307
@306:
	xor       eax,eax
@307:
	test      al,al
	jne       short @304
	?debug L 1027
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
	?debug L 1029
	test      byte ptr [ebp-28],1
	je        short @310
	?debug L 1030
	mov       dword ptr [$iobmfcia],1
	?debug L 1031
	mov       dword ptr [$accmfcia],0
	mov       dword ptr [$accmfcia+4],0
	?debug L 1032
	mov       al,1
	jmp       short @300
	?debug L 1036
@310:
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
	?debug L 1038
	test      byte ptr [ebp-28],1
	je        short @311
	?debug L 1039
	mov       dword ptr [$iobmfcia],1
	?debug L 1040
	mov       dword ptr [$accmfcia],0
	mov       dword ptr [$accmfcia+4],0
	?debug L 1041
	mov       al,1
	jmp       short @300
	?debug L 1043
@311:
	xor       edx,edx
	?debug L 1045
	xor       eax,eax
	?debug L 1043
	mov       dword ptr [$iobmfcia],edx
	?debug L 1044
	mov       dword ptr [$accmfcia],0
	mov       dword ptr [$accmfcia+4],0
	?debug L 1046
@312:
@300:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@297:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_x87$qv+0
	dd        @297+0
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
	dd	?patch83
	dd	?patch84
	dd	?patch85
	df	@@stk@cpu@cpu_has_x87$qv
	dw	0
	dw	4136
	dw	0
	dw	140
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
	dw	141
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	142
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	143
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	144
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$accmfcia
	dw	0
	dw	4100
	dw	0
	dw	145
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	146
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iobmfcia
	dw	0
	dw	117
	dw	0
	dw	147
	dw	0
	dw	0
	dw	0
?patch83	equ	@312-@@stk@cpu@cpu_has_x87$qv+73
?patch84	equ	0
?patch85	equ	@312-@@stk@cpu@cpu_has_x87$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ifcmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ajcmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_mmx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mmx$qv	proc	near
?live16404@0:
	?debug L 1049
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @313
	?debug L 1055
@314:
	mov       eax,dword ptr [$ifcmfcia]
	cmp       eax,-1
	je        short @318
	?debug L 1056
?live16404@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @316
	?debug L 1058
?live16404@48: ; 
@317:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@318:
	cmp       dword ptr [$ajcmfcia+4],0
	jne       short @317
	cmp       dword ptr [$ajcmfcia],0
	jne       short @317
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$ajcmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$ajcmfcia+4],ecx
	jmp       short @321
@320:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@321:
	cmp       dword ptr [$ajcmfcia+4],0
	jne       short @324
	cmp       dword ptr [$ajcmfcia],0
@324:
	je        short @322
	mov       eax,dword ptr [$ajcmfcia]
	mov       edx,dword ptr [$ajcmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @325
	cmp       eax,dword ptr [ebp-20]
@325:
	setne     al
	and       eax,1
	jmp       short @323
@322:
	xor       eax,eax
@323:
	test      al,al
	jne       short @320
	?debug L 1061
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
	?debug L 1063
	mov       eax,dword ptr [ebp-28]
	?debug L 1061
	add       esp,24
	?debug L 1063
	and       eax,8388608
	?debug L 1064
?live16404@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1063
?live16404@144: ; 
	mov       dword ptr [$ifcmfcia],eax
	?debug L 1064
?live16404@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1065
?live16404@176: ; EAX = ret
	mov       dword ptr [$ajcmfcia],0
	mov       dword ptr [$ajcmfcia+4],0
	?debug L 1064
?live16404@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1067
?live16404@208: ; 
@326:
@316:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@313:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_mmx$qv+0
	dd        @313+0
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
	dd	?patch86
	dd	?patch87
	dd	?patch88
	df	@@stk@cpu@cpu_has_mmx$qv
	dw	0
	dw	4138
	dw	0
	dw	148
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
	dw	149
	dw	0
	dw	0
	dw	0
	dw	?patch89
	dw	529
	dw	?patch90
	dd	?live16404@176-@@stk@cpu@cpu_has_mmx$qv
	dd	?live16404@192-?live16404@176
	dw	1
?patch90	equ	1
?patch89	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	150
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	151
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	152
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	153
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ajcmfcia
	dw	0
	dw	4100
	dw	0
	dw	154
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	155
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ifcmfcia
	dw	0
	dw	117
	dw	0
	dw	156
	dw	0
	dw	0
	dw	0
?patch86	equ	@326-@@stk@cpu@cpu_has_mmx$qv+71
?patch87	equ	0
?patch88	equ	@326-@@stk@cpu@cpu_has_mmx$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$imcmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aadmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_mmxext$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mmxext$qv	proc	near
?live16405@0:
	?debug L 1070
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @327
	?debug L 1076
@328:
	mov       eax,dword ptr [$imcmfcia]
	cmp       eax,-1
	je        short @332
	?debug L 1077
?live16405@32: ; EAX = @temp5
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @330
	?debug L 1079
?live16405@48: ; 
@331:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@332:
	cmp       dword ptr [$aadmfcia+4],0
	jne       short @331
	cmp       dword ptr [$aadmfcia],0
	jne       short @331
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$aadmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$aadmfcia+4],ecx
	jmp       short @335
@334:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@335:
	cmp       dword ptr [$aadmfcia+4],0
	jne       short @338
	cmp       dword ptr [$aadmfcia],0
@338:
	je        short @336
	mov       eax,dword ptr [$aadmfcia]
	mov       edx,dword ptr [$aadmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @339
	cmp       eax,dword ptr [ebp-20]
@339:
	setne     al
	and       eax,1
	jmp       short @337
@336:
	xor       eax,eax
@337:
	test      al,al
	jne       short @334
	?debug L 1082
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
	?debug L 1084
	mov       eax,dword ptr [ebp-28]
	and       eax,4194304
	mov       dword ptr [$imcmfcia],eax
	?debug L 1085
?live16405@96: ; EAX = @temp3
	test      eax,eax
	je        short @340
	?debug L 1086
?live16405@112: ; 
	mov       al,1
	jmp       short @330
	?debug L 1088
@340:
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
	?debug L 1090
	mov       eax,dword ptr [ebp-28]
	?debug L 1088
	add       esp,24
	?debug L 1090
	and       eax,33554432
	?debug L 1091
?live16405@192: ; EAX = @temp4
	test      eax,eax
	?debug L 1090
?live16405@208: ; 
	mov       dword ptr [$imcmfcia],eax
	?debug L 1091
?live16405@224: ; EAX = @temp4
	setne     dl
	and       edx,1
	?debug L 1092
?live16405@240: ; EAX = ret
	mov       dword ptr [$aadmfcia],0
	mov       dword ptr [$aadmfcia+4],0
	?debug L 1091
?live16405@256: ; EAX = @temp4
	mov       eax,edx
	?debug L 1094
?live16405@272: ; 
@341:
@330:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@327:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_mmxext$qv+0
	dd        @327+0
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
	dd	?patch91
	dd	?patch92
	dd	?patch93
	df	@@stk@cpu@cpu_has_mmxext$qv
	dw	0
	dw	4140
	dw	0
	dw	157
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
	dw	158
	dw	0
	dw	0
	dw	0
	dw	?patch94
	dw	529
	dw	?patch95
	dd	?live16405@240-@@stk@cpu@cpu_has_mmxext$qv
	dd	?live16405@256-?live16405@240
	dw	1
?patch95	equ	1
?patch94	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	159
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	160
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	161
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	162
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aadmfcia
	dw	0
	dw	4100
	dw	0
	dw	163
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	164
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$imcmfcia
	dw	0
	dw	117
	dw	0
	dw	165
	dw	0
	dw	0
	dw	0
?patch91	equ	@341-@@stk@cpu@cpu_has_mmxext$qv+71
?patch92	equ	0
?patch93	equ	@341-@@stk@cpu@cpu_has_mmxext$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iddmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ahdmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_amd64$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_amd64$qv	proc	near
?live16406@0:
	?debug L 1097
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @342
	?debug L 1103
@343:
	mov       eax,dword ptr [$iddmfcia]
	cmp       eax,-1
	je        short @347
	?debug L 1104
?live16406@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @345
	?debug L 1106
?live16406@48: ; 
@346:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@347:
	cmp       dword ptr [$ahdmfcia+4],0
	jne       short @346
	cmp       dword ptr [$ahdmfcia],0
	jne       short @346
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$ahdmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$ahdmfcia+4],ecx
	jmp       short @350
@349:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@350:
	cmp       dword ptr [$ahdmfcia+4],0
	jne       short @353
	cmp       dword ptr [$ahdmfcia],0
@353:
	je        short @351
	mov       eax,dword ptr [$ahdmfcia]
	mov       edx,dword ptr [$ahdmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @354
	cmp       eax,dword ptr [ebp-20]
@354:
	setne     al
	and       eax,1
	jmp       short @352
@351:
	xor       eax,eax
@352:
	test      al,al
	jne       short @349
	?debug L 1109
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
	?debug L 1111
	mov       eax,dword ptr [ebp-28]
	?debug L 1109
	add       esp,24
	?debug L 1111
	and       eax,536870912
	?debug L 1112
?live16406@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1111
?live16406@144: ; 
	mov       dword ptr [$iddmfcia],eax
	?debug L 1112
?live16406@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1113
?live16406@176: ; EAX = ret
	mov       dword ptr [$ahdmfcia],0
	mov       dword ptr [$ahdmfcia+4],0
	?debug L 1112
?live16406@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1115
?live16406@208: ; 
@355:
@345:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@342:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_amd64$qv+0
	dd        @342+0
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
	dd	?patch96
	dd	?patch97
	dd	?patch98
	df	@@stk@cpu@cpu_has_amd64$qv
	dw	0
	dw	4142
	dw	0
	dw	166
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
	dw	167
	dw	0
	dw	0
	dw	0
	dw	?patch99
	dw	529
	dw	?patch100
	dd	?live16406@176-@@stk@cpu@cpu_has_amd64$qv
	dd	?live16406@192-?live16406@176
	dw	1
?patch100	equ	1
?patch99	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	168
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	169
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	170
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	171
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ahdmfcia
	dw	0
	dw	4100
	dw	0
	dw	172
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	173
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iddmfcia
	dw	0
	dw	117
	dw	0
	dw	174
	dw	0
	dw	0
	dw	0
?patch96	equ	@355-@@stk@cpu@cpu_has_amd64$qv+72
?patch97	equ	0
?patch98	equ	@355-@@stk@cpu@cpu_has_amd64$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ikdmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aodmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_ht$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_ht$qv	proc	near
?live16407@0:
	?debug L 1118
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @356
	?debug L 1124
@357:
	mov       eax,dword ptr [$ikdmfcia]
	cmp       eax,-1
	je        short @361
	?debug L 1125
?live16407@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @359
	?debug L 1127
?live16407@48: ; 
@360:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@361:
	cmp       dword ptr [$aodmfcia+4],0
	jne       short @360
	cmp       dword ptr [$aodmfcia],0
	jne       short @360
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$aodmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$aodmfcia+4],ecx
	jmp       short @364
@363:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@364:
	cmp       dword ptr [$aodmfcia+4],0
	jne       short @367
	cmp       dword ptr [$aodmfcia],0
@367:
	je        short @365
	mov       eax,dword ptr [$aodmfcia]
	mov       edx,dword ptr [$aodmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @368
	cmp       eax,dword ptr [ebp-20]
@368:
	setne     al
	and       eax,1
	jmp       short @366
@365:
	xor       eax,eax
@366:
	test      al,al
	jne       short @363
	?debug L 1130
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
	?debug L 1132
	mov       eax,dword ptr [ebp-28]
	?debug L 1130
	add       esp,24
	?debug L 1132
	and       eax,268435456
	?debug L 1133
?live16407@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1132
?live16407@144: ; 
	mov       dword ptr [$ikdmfcia],eax
	?debug L 1133
?live16407@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1134
?live16407@176: ; EAX = ret
	mov       dword ptr [$aodmfcia],0
	mov       dword ptr [$aodmfcia+4],0
	?debug L 1133
?live16407@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1136
?live16407@208: ; 
@369:
@359:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@356:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_ht$qv+0
	dd        @356+0
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
	dd	?patch101
	dd	?patch102
	dd	?patch103
	df	@@stk@cpu@cpu_has_ht$qv
	dw	0
	dw	4144
	dw	0
	dw	175
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
	dw	176
	dw	0
	dw	0
	dw	0
	dw	?patch104
	dw	529
	dw	?patch105
	dd	?live16407@176-@@stk@cpu@cpu_has_ht$qv
	dd	?live16407@192-?live16407@176
	dw	1
?patch105	equ	1
?patch104	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	177
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	178
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	179
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	180
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aodmfcia
	dw	0
	dw	4100
	dw	0
	dw	181
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	182
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ikdmfcia
	dw	0
	dw	117
	dw	0
	dw	183
	dw	0
	dw	0
	dw	0
?patch101	equ	@369-@@stk@cpu@cpu_has_ht$qv+71
?patch102	equ	0
?patch103	equ	@369-@@stk@cpu@cpu_has_ht$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ibemfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$afemfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sse$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sse$qv	proc	near
?live16408@0:
	?debug L 1139
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @370
	?debug L 1145
@371:
	mov       eax,dword ptr [$ibemfcia]
	cmp       eax,-1
	jne       @373
	?debug L 1146
?live16408@32: ; EAX = @temp3
	jmp       short @375
	?debug L 1148
?live16408@48: ; 
@374:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@375:
	cmp       dword ptr [$afemfcia+4],0
	jne       short @374
	cmp       dword ptr [$afemfcia],0
	jne       short @374
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$afemfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$afemfcia+4],edx
	jmp       short @378
@377:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@378:
	cmp       dword ptr [$afemfcia+4],0
	jne       short @381
	cmp       dword ptr [$afemfcia],0
@381:
	je        short @379
	mov       eax,dword ptr [$afemfcia]
	mov       edx,dword ptr [$afemfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @382
	cmp       eax,dword ptr [ebp-20]
@382:
	setne     cl
	and       ecx,1
	jmp       short @380
@379:
	xor       ecx,ecx
@380:
	test      cl,cl
	jne       short @377
	?debug L 1151
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
	?debug L 1153
	test      byte ptr [ebp-34],16
	je        short @383
	?debug L 1154
	mov       dword ptr [$ibemfcia],42
	jmp       short @384
	?debug L 1156
@383:
	test      byte ptr [ebp-34],8
	je        short @385
	?debug L 1157
	mov       dword ptr [$ibemfcia],41
	jmp       short @384
	?debug L 1159
@385:
	test      byte ptr [ebp-35],2
	je        short @386
	?debug L 1160
	mov       dword ptr [$ibemfcia],31
	jmp       short @384
	?debug L 1162
@386:
	test      byte ptr [ebp-36],1
	je        short @387
	?debug L 1163
	mov       dword ptr [$ibemfcia],30
	jmp       short @384
	?debug L 1165
@387:
	test      byte ptr [ebp-25],4
	je        short @388
	?debug L 1166
	mov       dword ptr [$ibemfcia],20
	jmp       short @384
	?debug L 1168
@388:
	test      byte ptr [ebp-25],2
	je        short @389
	?debug L 1169
	mov       dword ptr [$ibemfcia],10
	jmp       short @384
	?debug L 1171
@389:
	xor       ecx,ecx
	mov       dword ptr [$ibemfcia],ecx
	?debug L 1172
@384:
	mov       eax,dword ptr [$ibemfcia]
	?debug L 1173
?live16408@304: ; EAX = ret
	mov       dword ptr [$afemfcia],0
	?debug L 1172
?live16408@320: ; 
	test      eax,eax
	?debug L 1173
?live16408@336: ; EAX = ret
	mov       dword ptr [$afemfcia+4],0
	?debug L 1172
?live16408@352: ; 
	setne     al
	and       eax,1
	?debug L 1174
?live16408@368: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	mov       eax,edx
	?debug L 1175
?live16408@384: ; 
@390:
@373:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@370:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_sse$qv+0
	dd        @370+0
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
	dd	?patch106
	dd	?patch107
	dd	?patch108
	df	@@stk@cpu@cpu_has_sse$qv
	dw	0
	dw	4146
	dw	0
	dw	184
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
	dw	185
	dw	0
	dw	0
	dw	0
	dw	?patch109
	dw	529
	dw	?patch110
	dd	?live16408@304-@@stk@cpu@cpu_has_sse$qv
	dd	?live16408@320-?live16408@304
	dw	1
	dd	?live16408@336-@@stk@cpu@cpu_has_sse$qv
	dd	?live16408@352-?live16408@336
	dw	1
	dd	?live16408@368-@@stk@cpu@cpu_has_sse$qv
	dd	?live16408@384-?live16408@368
	dw	1
?patch110	equ	3
?patch109	equ	34
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	186
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	187
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	188
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	189
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$afemfcia
	dw	0
	dw	4100
	dw	0
	dw	190
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	191
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ibemfcia
	dw	0
	dw	117
	dw	0
	dw	192
	dw	0
	dw	0
	dw	0
?patch106	equ	@390-@@stk@cpu@cpu_has_sse$qv+72
?patch107	equ	0
?patch108	equ	@390-@@stk@cpu@cpu_has_sse$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iiemfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$amemfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sse4a$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sse4a$qv	proc	near
?live16409@0:
	?debug L 1178
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @391
	?debug L 1184
@392:
	mov       eax,dword ptr [$iiemfcia]
	cmp       eax,-1
	je        short @396
	?debug L 1185
?live16409@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @394
	?debug L 1187
?live16409@48: ; 
@395:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@396:
	cmp       dword ptr [$amemfcia+4],0
	jne       short @395
	cmp       dword ptr [$amemfcia],0
	jne       short @395
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$amemfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$amemfcia+4],ecx
	jmp       short @399
@398:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@399:
	cmp       dword ptr [$amemfcia+4],0
	jne       short @402
	cmp       dword ptr [$amemfcia],0
@402:
	je        short @400
	mov       eax,dword ptr [$amemfcia]
	mov       edx,dword ptr [$amemfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @403
	cmp       eax,dword ptr [ebp-20]
@403:
	setne     al
	and       eax,1
	jmp       short @401
@400:
	xor       eax,eax
@401:
	test      al,al
	jne       short @398
	?debug L 1190
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
	?debug L 1192
	mov       eax,dword ptr [ebp-36]
	?debug L 1190
	add       esp,24
	?debug L 1192
	and       eax,64
	?debug L 1193
?live16409@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1192
?live16409@144: ; 
	mov       dword ptr [$iiemfcia],eax
	?debug L 1193
?live16409@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1194
?live16409@176: ; EAX = ret
	mov       dword ptr [$amemfcia],0
	mov       dword ptr [$amemfcia+4],0
	?debug L 1193
?live16409@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1196
?live16409@208: ; 
@404:
@394:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@391:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_sse4a$qv+0
	dd        @391+0
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
	dd	?patch111
	dd	?patch112
	dd	?patch113
	df	@@stk@cpu@cpu_has_sse4a$qv
	dw	0
	dw	4148
	dw	0
	dw	193
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
	dw	194
	dw	0
	dw	0
	dw	0
	dw	?patch114
	dw	529
	dw	?patch115
	dd	?live16409@176-@@stk@cpu@cpu_has_sse4a$qv
	dd	?live16409@192-?live16409@176
	dw	1
?patch115	equ	1
?patch114	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	195
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	196
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	197
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	198
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$amemfcia
	dw	0
	dw	4100
	dw	0
	dw	199
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	200
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iiemfcia
	dw	0
	dw	117
	dw	0
	dw	201
	dw	0
	dw	0
	dw	0
?patch111	equ	@404-@@stk@cpu@cpu_has_sse4a$qv+74
?patch112	equ	0
?patch113	equ	@404-@@stk@cpu@cpu_has_sse4a$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ipemfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$adfmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx$qv	proc	near
?live16410@0:
	?debug L 1199
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @405
	?debug L 1205
@406:
	mov       eax,dword ptr [$ipemfcia]
	cmp       eax,-1
	jne       @408
	?debug L 1206
?live16410@32: ; EAX = @temp3
	jmp       short @410
	?debug L 1208
?live16410@48: ; 
@409:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@410:
	cmp       dword ptr [$adfmfcia+4],0
	jne       short @409
	cmp       dword ptr [$adfmfcia],0
	jne       short @409
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$adfmfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$adfmfcia+4],edx
	jmp       short @413
@412:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@413:
	cmp       dword ptr [$adfmfcia+4],0
	jne       short @416
	cmp       dword ptr [$adfmfcia],0
@416:
	je        short @414
	mov       eax,dword ptr [$adfmfcia]
	mov       edx,dword ptr [$adfmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @417
	cmp       eax,dword ptr [ebp-20]
@417:
	setne     cl
	and       ecx,1
	jmp       short @415
@414:
	xor       ecx,ecx
@415:
	test      cl,cl
	jne       short @412
	?debug L 1211
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
	?debug L 1213
	test      byte ptr [ebp-33],16
	je        short @418
	?debug L 1214
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
	?debug L 1215
	test      byte ptr [ebp-44],32
	je        short @419
	?debug L 1216
	mov       dword ptr [$ipemfcia],2
	jmp       short @420
	?debug L 1218
@419:
	mov       dword ptr [$ipemfcia],1
	?debug L 1219
	jmp       short @420
	?debug L 1221
@418:
	xor       eax,eax
	mov       dword ptr [$ipemfcia],eax
	?debug L 1223
@420:
	mov       edx,dword ptr [$ipemfcia]
	?debug L 1224
?live16410@208: ; EAX = ret
	mov       dword ptr [$adfmfcia],0
	?debug L 1223
?live16410@224: ; 
	test      edx,edx
	?debug L 1224
?live16410@240: ; EAX = ret
	mov       dword ptr [$adfmfcia+4],0
	?debug L 1223
?live16410@256: ; 
	setne     al
	and       eax,1
	?debug L 1225
?live16410@272: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	mov       eax,edx
	?debug L 1226
?live16410@288: ; 
@421:
@408:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@405:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx$qv+0
	dd        @405+0
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
	dd	?patch116
	dd	?patch117
	dd	?patch118
	df	@@stk@cpu@cpu_has_avx$qv
	dw	0
	dw	4150
	dw	0
	dw	202
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
	dw	203
	dw	0
	dw	0
	dw	0
	dw	?patch119
	dw	529
	dw	?patch120
	dd	?live16410@208-@@stk@cpu@cpu_has_avx$qv
	dd	?live16410@224-?live16410@208
	dw	1
	dd	?live16410@240-@@stk@cpu@cpu_has_avx$qv
	dd	?live16410@256-?live16410@240
	dw	1
	dd	?live16410@272-@@stk@cpu@cpu_has_avx$qv
	dd	?live16410@288-?live16410@272
	dw	1
?patch120	equ	3
?patch119	equ	34
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	204
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	205
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	206
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	207
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$adfmfcia
	dw	0
	dw	4100
	dw	0
	dw	208
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	209
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ipemfcia
	dw	0
	dw	117
	dw	0
	dw	210
	dw	0
	dw	0
	dw	0
?patch116	equ	@421-@@stk@cpu@cpu_has_avx$qv+72
?patch117	equ	0
?patch118	equ	@421-@@stk@cpu@cpu_has_avx$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$igfmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$akfmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_popcnt$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_popcnt$qv	proc	near
?live16411@0:
	?debug L 1229
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @422
	?debug L 1235
@423:
	mov       eax,dword ptr [$igfmfcia]
	cmp       eax,-1
	je        short @427
	?debug L 1236
?live16411@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @425
	?debug L 1238
?live16411@48: ; 
@426:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@427:
	cmp       dword ptr [$akfmfcia+4],0
	jne       short @426
	cmp       dword ptr [$akfmfcia],0
	jne       short @426
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$akfmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$akfmfcia+4],ecx
	jmp       short @430
@429:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@430:
	cmp       dword ptr [$akfmfcia+4],0
	jne       short @433
	cmp       dword ptr [$akfmfcia],0
@433:
	je        short @431
	mov       eax,dword ptr [$akfmfcia]
	mov       edx,dword ptr [$akfmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @434
	cmp       eax,dword ptr [ebp-20]
@434:
	setne     al
	and       eax,1
	jmp       short @432
@431:
	xor       eax,eax
@432:
	test      al,al
	jne       short @429
	?debug L 1241
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
	?debug L 1243
	mov       eax,dword ptr [ebp-36]
	?debug L 1241
	add       esp,24
	?debug L 1243
	and       eax,8388608
	?debug L 1244
?live16411@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1243
?live16411@144: ; 
	mov       dword ptr [$igfmfcia],eax
	?debug L 1244
?live16411@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1245
?live16411@176: ; EAX = ret
	mov       dword ptr [$akfmfcia],0
	mov       dword ptr [$akfmfcia+4],0
	?debug L 1244
?live16411@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1247
?live16411@208: ; 
@435:
@425:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@422:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_popcnt$qv+0
	dd        @422+0
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
	dd	?patch121
	dd	?patch122
	dd	?patch123
	df	@@stk@cpu@cpu_has_popcnt$qv
	dw	0
	dw	4152
	dw	0
	dw	211
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
	dw	212
	dw	0
	dw	0
	dw	0
	dw	?patch124
	dw	529
	dw	?patch125
	dd	?live16411@176-@@stk@cpu@cpu_has_popcnt$qv
	dd	?live16411@192-?live16411@176
	dw	1
?patch125	equ	1
?patch124	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	213
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	214
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	215
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	216
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$akfmfcia
	dw	0
	dw	4100
	dw	0
	dw	217
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	218
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$igfmfcia
	dw	0
	dw	117
	dw	0
	dw	219
	dw	0
	dw	0
	dw	0
?patch121	equ	@435-@@stk@cpu@cpu_has_popcnt$qv+71
?patch122	equ	0
?patch123	equ	@435-@@stk@cpu@cpu_has_popcnt$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$infmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$abgmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_f16c$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_f16c$qv	proc	near
?live16412@0:
	?debug L 1250
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @436
	?debug L 1256
@437:
	mov       eax,dword ptr [$infmfcia]
	cmp       eax,-1
	je        short @441
	?debug L 1257
?live16412@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @439
	?debug L 1259
?live16412@48: ; 
@440:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@441:
	cmp       dword ptr [$abgmfcia+4],0
	jne       short @440
	cmp       dword ptr [$abgmfcia],0
	jne       short @440
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$abgmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$abgmfcia+4],ecx
	jmp       short @444
@443:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@444:
	cmp       dword ptr [$abgmfcia+4],0
	jne       short @447
	cmp       dword ptr [$abgmfcia],0
@447:
	je        short @445
	mov       eax,dword ptr [$abgmfcia]
	mov       edx,dword ptr [$abgmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @448
	cmp       eax,dword ptr [ebp-20]
@448:
	setne     al
	and       eax,1
	jmp       short @446
@445:
	xor       eax,eax
@446:
	test      al,al
	jne       short @443
	?debug L 1262
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
	?debug L 1264
	mov       eax,dword ptr [ebp-36]
	?debug L 1262
	add       esp,24
	?debug L 1264
	and       eax,536870912
	?debug L 1265
?live16412@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1264
?live16412@144: ; 
	mov       dword ptr [$infmfcia],eax
	?debug L 1265
?live16412@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1266
?live16412@176: ; EAX = ret
	mov       dword ptr [$abgmfcia],0
	mov       dword ptr [$abgmfcia+4],0
	?debug L 1265
?live16412@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1268
?live16412@208: ; 
@449:
@439:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@436:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_f16c$qv+0
	dd        @436+0
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
	dd	?patch126
	dd	?patch127
	dd	?patch128
	df	@@stk@cpu@cpu_has_f16c$qv
	dw	0
	dw	4154
	dw	0
	dw	220
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
	dw	221
	dw	0
	dw	0
	dw	0
	dw	?patch129
	dw	529
	dw	?patch130
	dd	?live16412@176-@@stk@cpu@cpu_has_f16c$qv
	dd	?live16412@192-?live16412@176
	dw	1
?patch130	equ	1
?patch129	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	222
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	223
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	224
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	225
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$abgmfcia
	dw	0
	dw	4100
	dw	0
	dw	226
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	227
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$infmfcia
	dw	0
	dw	117
	dw	0
	dw	228
	dw	0
	dw	0
	dw	0
?patch126	equ	@449-@@stk@cpu@cpu_has_f16c$qv+71
?patch127	equ	0
?patch128	equ	@449-@@stk@cpu@cpu_has_f16c$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iegmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aigmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_cmpxchg$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_cmpxchg$qv	proc	near
?live16413@0:
	?debug L 1271
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @450
	?debug L 1277
@451:
	mov       eax,dword ptr [$iegmfcia]
	cmp       eax,-1
	jne       @453
	?debug L 1278
?live16413@32: ; EAX = @temp2
	jmp       short @455
	?debug L 1280
?live16413@48: ; 
@454:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@455:
	cmp       dword ptr [$aigmfcia+4],0
	jne       short @454
	cmp       dword ptr [$aigmfcia],0
	jne       short @454
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$aigmfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$aigmfcia+4],edx
	jmp       short @458
@457:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@458:
	cmp       dword ptr [$aigmfcia+4],0
	jne       short @461
	cmp       dword ptr [$aigmfcia],0
@461:
	je        short @459
	mov       eax,dword ptr [$aigmfcia]
	mov       edx,dword ptr [$aigmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @462
	cmp       eax,dword ptr [ebp-20]
@462:
	setne     cl
	and       ecx,1
	jmp       short @460
@459:
	xor       ecx,ecx
@460:
	test      cl,cl
	jne       short @457
	?debug L 1283
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
	?debug L 1285
	test      byte ptr [ebp-35],32
	je        short @463
	?debug L 1286
	mov       dword ptr [$iegmfcia],16
	?debug L 1287
	mov       dword ptr [$aigmfcia],0
	mov       dword ptr [$aigmfcia+4],0
	?debug L 1288
	mov       eax,16
	jmp       @453
	?debug L 1290
@463:
	test      byte ptr [ebp-27],1
	je        short @464
	?debug L 1291
	mov       dword ptr [$iegmfcia],8
	?debug L 1292
	mov       dword ptr [$aigmfcia],0
	mov       dword ptr [$aigmfcia+4],0
	?debug L 1293
	mov       eax,8
	jmp       short @453
	?debug L 1297
@464:
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
	?debug L 1299
	test      byte ptr [ebp-27],1
	je        short @465
	?debug L 1300
	mov       dword ptr [$iegmfcia],8
	?debug L 1301
	mov       dword ptr [$aigmfcia],0
	mov       dword ptr [$aigmfcia+4],0
	?debug L 1302
	mov       eax,8
	jmp       short @453
	?debug L 1304
@465:
	mov       dword ptr [$iegmfcia],1
	?debug L 1305
	mov       dword ptr [$aigmfcia],0
	mov       dword ptr [$aigmfcia+4],0
	?debug L 1306
	mov       eax,1
	?debug L 1307
@466:
@453:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@450:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_cmpxchg$qv+0
	dd        @450+0
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
	dd	?patch131
	dd	?patch132
	dd	?patch133
	df	@@stk@cpu@cpu_has_cmpxchg$qv
	dw	0
	dw	4156
	dw	0
	dw	229
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
	dw	230
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	231
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	232
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	233
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aigmfcia
	dw	0
	dw	4100
	dw	0
	dw	234
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	235
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iegmfcia
	dw	0
	dw	117
	dw	0
	dw	236
	dw	0
	dw	0
	dw	0
?patch131	equ	@466-@@stk@cpu@cpu_has_cmpxchg$qv+73
?patch132	equ	0
?patch133	equ	@466-@@stk@cpu@cpu_has_cmpxchg$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ilgmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$apgmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_vmx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_vmx$qv	proc	near
?live16414@0:
	?debug L 1310
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @467
	?debug L 1316
@468:
	mov       eax,dword ptr [$ilgmfcia]
	cmp       eax,-1
	je        short @472
	?debug L 1317
?live16414@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @470
	?debug L 1319
?live16414@48: ; 
@471:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@472:
	cmp       dword ptr [$apgmfcia+4],0
	jne       short @471
	cmp       dword ptr [$apgmfcia],0
	jne       short @471
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$apgmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$apgmfcia+4],ecx
	jmp       short @475
@474:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@475:
	cmp       dword ptr [$apgmfcia+4],0
	jne       short @478
	cmp       dword ptr [$apgmfcia],0
@478:
	je        short @476
	mov       eax,dword ptr [$apgmfcia]
	mov       edx,dword ptr [$apgmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @479
	cmp       eax,dword ptr [ebp-20]
@479:
	setne     al
	and       eax,1
	jmp       short @477
@476:
	xor       eax,eax
@477:
	test      al,al
	jne       short @474
	?debug L 1322
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
	?debug L 1324
	mov       eax,dword ptr [ebp-36]
	?debug L 1322
	add       esp,24
	?debug L 1324
	and       eax,32
	?debug L 1325
?live16414@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1324
?live16414@144: ; 
	mov       dword ptr [$ilgmfcia],eax
	?debug L 1325
?live16414@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1326
?live16414@176: ; EAX = ret
	mov       dword ptr [$apgmfcia],0
	mov       dword ptr [$apgmfcia+4],0
	?debug L 1325
?live16414@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1328
?live16414@208: ; 
@480:
@470:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@467:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_vmx$qv+0
	dd        @467+0
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
	dd	?patch134
	dd	?patch135
	dd	?patch136
	df	@@stk@cpu@cpu_has_vmx$qv
	dw	0
	dw	4158
	dw	0
	dw	237
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
	dw	238
	dw	0
	dw	0
	dw	0
	dw	?patch137
	dw	529
	dw	?patch138
	dd	?live16414@176-@@stk@cpu@cpu_has_vmx$qv
	dd	?live16414@192-?live16414@176
	dw	1
?patch138	equ	1
?patch137	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	239
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	240
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	241
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	242
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$apgmfcia
	dw	0
	dw	4100
	dw	0
	dw	243
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	244
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ilgmfcia
	dw	0
	dw	117
	dw	0
	dw	245
	dw	0
	dw	0
	dw	0
?patch134	equ	@480-@@stk@cpu@cpu_has_vmx$qv+73
?patch135	equ	0
?patch136	equ	@480-@@stk@cpu@cpu_has_vmx$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ichmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aghmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_smx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_smx$qv	proc	near
?live16415@0:
	?debug L 1331
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @481
	?debug L 1337
@482:
	mov       eax,dword ptr [$ichmfcia]
	cmp       eax,-1
	je        short @486
	?debug L 1338
?live16415@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @484
	?debug L 1340
?live16415@48: ; 
@485:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@486:
	cmp       dword ptr [$aghmfcia+4],0
	jne       short @485
	cmp       dword ptr [$aghmfcia],0
	jne       short @485
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$aghmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$aghmfcia+4],ecx
	jmp       short @489
@488:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@489:
	cmp       dword ptr [$aghmfcia+4],0
	jne       short @492
	cmp       dword ptr [$aghmfcia],0
@492:
	je        short @490
	mov       eax,dword ptr [$aghmfcia]
	mov       edx,dword ptr [$aghmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @493
	cmp       eax,dword ptr [ebp-20]
@493:
	setne     al
	and       eax,1
	jmp       short @491
@490:
	xor       eax,eax
@491:
	test      al,al
	jne       short @488
	?debug L 1343
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
	?debug L 1345
	mov       eax,dword ptr [ebp-36]
	?debug L 1343
	add       esp,24
	?debug L 1345
	and       eax,64
	?debug L 1346
?live16415@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1345
?live16415@144: ; 
	mov       dword ptr [$ichmfcia],eax
	?debug L 1346
?live16415@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1347
?live16415@176: ; EAX = ret
	mov       dword ptr [$aghmfcia],0
	mov       dword ptr [$aghmfcia+4],0
	?debug L 1346
?live16415@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1349
?live16415@208: ; 
@494:
@484:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@481:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_smx$qv+0
	dd        @481+0
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
	dd	?patch139
	dd	?patch140
	dd	?patch141
	df	@@stk@cpu@cpu_has_smx$qv
	dw	0
	dw	4160
	dw	0
	dw	246
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
	dw	247
	dw	0
	dw	0
	dw	0
	dw	?patch142
	dw	529
	dw	?patch143
	dd	?live16415@176-@@stk@cpu@cpu_has_smx$qv
	dd	?live16415@192-?live16415@176
	dw	1
?patch143	equ	1
?patch142	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	248
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	249
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	250
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	251
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aghmfcia
	dw	0
	dw	4100
	dw	0
	dw	252
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	253
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ichmfcia
	dw	0
	dw	117
	dw	0
	dw	254
	dw	0
	dw	0
	dw	0
?patch139	equ	@494-@@stk@cpu@cpu_has_smx$qv+73
?patch140	equ	0
?patch141	equ	@494-@@stk@cpu@cpu_has_smx$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ijhmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$anhmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_cmov$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_cmov$qv	proc	near
?live16416@0:
	?debug L 1352
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @495
	?debug L 1358
@496:
	mov       eax,dword ptr [$ijhmfcia]
	cmp       eax,-1
	je        short @500
	?debug L 1359
?live16416@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @498
	?debug L 1361
?live16416@48: ; 
@499:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@500:
	cmp       dword ptr [$anhmfcia+4],0
	jne       short @499
	cmp       dword ptr [$anhmfcia],0
	jne       short @499
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$anhmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$anhmfcia+4],ecx
	jmp       short @503
@502:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@503:
	cmp       dword ptr [$anhmfcia+4],0
	jne       short @506
	cmp       dword ptr [$anhmfcia],0
@506:
	je        short @504
	mov       eax,dword ptr [$anhmfcia]
	mov       edx,dword ptr [$anhmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @507
	cmp       eax,dword ptr [ebp-20]
@507:
	setne     al
	and       eax,1
	jmp       short @505
@504:
	xor       eax,eax
@505:
	test      al,al
	jne       short @502
	?debug L 1364
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
	?debug L 1366
	mov       eax,dword ptr [ebp-28]
	?debug L 1364
	add       esp,24
	?debug L 1366
	and       eax,32768
	?debug L 1367
?live16416@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1366
?live16416@144: ; 
	mov       dword ptr [$ijhmfcia],eax
	?debug L 1367
?live16416@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1368
?live16416@176: ; EAX = ret
	mov       dword ptr [$anhmfcia],0
	mov       dword ptr [$anhmfcia+4],0
	?debug L 1367
?live16416@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1370
?live16416@208: ; 
@508:
@498:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@495:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_cmov$qv+0
	dd        @495+0
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
	dd	?patch144
	dd	?patch145
	dd	?patch146
	df	@@stk@cpu@cpu_has_cmov$qv
	dw	0
	dw	4162
	dw	0
	dw	255
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
	dw	256
	dw	0
	dw	0
	dw	0
	dw	?patch147
	dw	529
	dw	?patch148
	dd	?live16416@176-@@stk@cpu@cpu_has_cmov$qv
	dd	?live16416@192-?live16416@176
	dw	1
?patch148	equ	1
?patch147	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	257
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	258
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	259
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	260
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$anhmfcia
	dw	0
	dw	4100
	dw	0
	dw	261
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	262
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ijhmfcia
	dw	0
	dw	117
	dw	0
	dw	263
	dw	0
	dw	0
	dw	0
?patch144	equ	@508-@@stk@cpu@cpu_has_cmov$qv+71
?patch145	equ	0
?patch146	equ	@508-@@stk@cpu@cpu_has_cmov$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iaimfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aeimfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_movbe$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_movbe$qv	proc	near
?live16417@0:
	?debug L 1373
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @509
	?debug L 1379
@510:
	mov       eax,dword ptr [$iaimfcia]
	cmp       eax,-1
	je        short @514
	?debug L 1380
?live16417@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @512
	?debug L 1382
?live16417@48: ; 
@513:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@514:
	cmp       dword ptr [$aeimfcia+4],0
	jne       short @513
	cmp       dword ptr [$aeimfcia],0
	jne       short @513
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$aeimfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$aeimfcia+4],ecx
	jmp       short @517
@516:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@517:
	cmp       dword ptr [$aeimfcia+4],0
	jne       short @520
	cmp       dword ptr [$aeimfcia],0
@520:
	je        short @518
	mov       eax,dword ptr [$aeimfcia]
	mov       edx,dword ptr [$aeimfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @521
	cmp       eax,dword ptr [ebp-20]
@521:
	setne     al
	and       eax,1
	jmp       short @519
@518:
	xor       eax,eax
@519:
	test      al,al
	jne       short @516
	?debug L 1385
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
	?debug L 1387
	mov       eax,dword ptr [ebp-36]
	?debug L 1385
	add       esp,24
	?debug L 1387
	and       eax,4194304
	?debug L 1388
?live16417@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1387
?live16417@144: ; 
	mov       dword ptr [$iaimfcia],eax
	?debug L 1388
?live16417@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1389
?live16417@176: ; EAX = ret
	mov       dword ptr [$aeimfcia],0
	mov       dword ptr [$aeimfcia+4],0
	?debug L 1388
?live16417@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1391
?live16417@208: ; 
@522:
@512:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@509:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_movbe$qv+0
	dd        @509+0
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
	dd	?patch149
	dd	?patch150
	dd	?patch151
	df	@@stk@cpu@cpu_has_movbe$qv
	dw	0
	dw	4164
	dw	0
	dw	264
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
	dw	265
	dw	0
	dw	0
	dw	0
	dw	?patch152
	dw	529
	dw	?patch153
	dd	?live16417@176-@@stk@cpu@cpu_has_movbe$qv
	dd	?live16417@192-?live16417@176
	dw	1
?patch153	equ	1
?patch152	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	266
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	267
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	268
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	269
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aeimfcia
	dw	0
	dw	4100
	dw	0
	dw	270
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	271
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iaimfcia
	dw	0
	dw	117
	dw	0
	dw	272
	dw	0
	dw	0
	dw	0
?patch149	equ	@522-@@stk@cpu@cpu_has_movbe$qv+71
?patch150	equ	0
?patch151	equ	@522-@@stk@cpu@cpu_has_movbe$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ihimfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$alimfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_bmi$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_bmi$qv	proc	near
?live16418@0:
	?debug L 1394
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @523
	?debug L 1400
@524:
	mov       eax,dword ptr [$ihimfcia]
	cmp       eax,-1
	jne       @526
	?debug L 1401
?live16418@32: ; EAX = @temp3
	jmp       short @528
	?debug L 1403
?live16418@48: ; 
@527:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@528:
	cmp       dword ptr [$alimfcia+4],0
	jne       short @527
	cmp       dword ptr [$alimfcia],0
	jne       short @527
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$alimfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$alimfcia+4],edx
	jmp       short @531
@530:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@531:
	cmp       dword ptr [$alimfcia+4],0
	jne       short @534
	cmp       dword ptr [$alimfcia],0
@534:
	je        short @532
	mov       eax,dword ptr [$alimfcia]
	mov       edx,dword ptr [$alimfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @535
	cmp       eax,dword ptr [ebp-20]
@535:
	setne     cl
	and       ecx,1
	jmp       short @533
@532:
	xor       ecx,ecx
@533:
	test      cl,cl
	jne       short @530
	?debug L 1406
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
	?debug L 1408
	test      byte ptr [ebp-43],1
	je        short @536
	?debug L 1409
	mov       dword ptr [$ihimfcia],2
	jmp       short @537
	?debug L 1411
@536:
	test      byte ptr [ebp-44],8
	je        short @538
	?debug L 1412
	mov       dword ptr [$ihimfcia],1
	jmp       short @537
	?debug L 1414
@538:
	xor       ecx,ecx
	mov       dword ptr [$ihimfcia],ecx
	?debug L 1415
@537:
	mov       eax,dword ptr [$ihimfcia]
	?debug L 1416
?live16418@176: ; EAX = ret
	mov       dword ptr [$alimfcia],0
	?debug L 1415
?live16418@192: ; 
	test      eax,eax
	?debug L 1416
?live16418@208: ; EAX = ret
	mov       dword ptr [$alimfcia+4],0
	?debug L 1415
?live16418@224: ; 
	setne     al
	and       eax,1
	?debug L 1417
?live16418@240: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	mov       eax,edx
	?debug L 1418
?live16418@256: ; 
@539:
@526:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@523:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_bmi$qv+0
	dd        @523+0
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
	dd	?patch154
	dd	?patch155
	dd	?patch156
	df	@@stk@cpu@cpu_has_bmi$qv
	dw	0
	dw	4166
	dw	0
	dw	273
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
	dw	274
	dw	0
	dw	0
	dw	0
	dw	?patch157
	dw	529
	dw	?patch158
	dd	?live16418@176-@@stk@cpu@cpu_has_bmi$qv
	dd	?live16418@192-?live16418@176
	dw	1
	dd	?live16418@208-@@stk@cpu@cpu_has_bmi$qv
	dd	?live16418@224-?live16418@208
	dw	1
	dd	?live16418@240-@@stk@cpu@cpu_has_bmi$qv
	dd	?live16418@256-?live16418@240
	dw	1
?patch158	equ	3
?patch157	equ	34
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	275
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	276
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	277
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	278
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$alimfcia
	dw	0
	dw	4100
	dw	0
	dw	279
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	280
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ihimfcia
	dw	0
	dw	117
	dw	0
	dw	281
	dw	0
	dw	0
	dw	0
?patch154	equ	@539-@@stk@cpu@cpu_has_bmi$qv+72
?patch155	equ	0
?patch156	equ	@539-@@stk@cpu@cpu_has_bmi$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ioimfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$acjmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_erms$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_erms$qv	proc	near
?live16419@0:
	?debug L 1421
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @540
	?debug L 1427
@541:
	mov       eax,dword ptr [$ioimfcia]
	cmp       eax,-1
	je        short @545
	?debug L 1428
?live16419@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @543
	?debug L 1430
?live16419@48: ; 
@544:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@545:
	cmp       dword ptr [$acjmfcia+4],0
	jne       short @544
	cmp       dword ptr [$acjmfcia],0
	jne       short @544
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$acjmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$acjmfcia+4],ecx
	jmp       short @548
@547:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@548:
	cmp       dword ptr [$acjmfcia+4],0
	jne       short @551
	cmp       dword ptr [$acjmfcia],0
@551:
	je        short @549
	mov       eax,dword ptr [$acjmfcia]
	mov       edx,dword ptr [$acjmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @552
	cmp       eax,dword ptr [ebp-20]
@552:
	setne     al
	and       eax,1
	jmp       short @550
@549:
	xor       eax,eax
@550:
	test      al,al
	jne       short @547
	?debug L 1433
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
	?debug L 1435
	mov       eax,dword ptr [ebp-44]
	?debug L 1433
	add       esp,24
	?debug L 1435
	and       eax,512
	?debug L 1436
?live16419@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1435
?live16419@144: ; 
	mov       dword ptr [$ioimfcia],eax
	?debug L 1436
?live16419@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1437
?live16419@176: ; EAX = ret
	mov       dword ptr [$acjmfcia],0
	mov       dword ptr [$acjmfcia+4],0
	?debug L 1436
?live16419@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1439
?live16419@208: ; 
@553:
@543:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@540:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_erms$qv+0
	dd        @540+0
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
	dd	?patch159
	dd	?patch160
	dd	?patch161
	df	@@stk@cpu@cpu_has_erms$qv
	dw	0
	dw	4168
	dw	0
	dw	282
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
	dw	283
	dw	0
	dw	0
	dw	0
	dw	?patch162
	dw	529
	dw	?patch163
	dd	?live16419@176-@@stk@cpu@cpu_has_erms$qv
	dd	?live16419@192-?live16419@176
	dw	1
?patch163	equ	1
?patch162	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	284
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	285
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	286
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	287
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$acjmfcia
	dw	0
	dw	4100
	dw	0
	dw	288
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	289
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ioimfcia
	dw	0
	dw	117
	dw	0
	dw	290
	dw	0
	dw	0
	dw	0
?patch159	equ	@553-@@stk@cpu@cpu_has_erms$qv+71
?patch160	equ	0
?patch161	equ	@553-@@stk@cpu@cpu_has_erms$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ifjmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ajjmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_3dnow$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_3dnow$qv	proc	near
?live16420@0:
	?debug L 1442
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @554
	?debug L 1448
@555:
	mov       eax,dword ptr [$ifjmfcia]
	cmp       eax,-1
	jne       @557
	?debug L 1449
?live16420@32: ; EAX = @temp3
	jmp       short @559
	?debug L 1451
?live16420@48: ; 
@558:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@559:
	cmp       dword ptr [$ajjmfcia+4],0
	jne       short @558
	cmp       dword ptr [$ajjmfcia],0
	jne       short @558
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$ajjmfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$ajjmfcia+4],edx
	jmp       short @562
@561:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@562:
	cmp       dword ptr [$ajjmfcia+4],0
	jne       short @565
	cmp       dword ptr [$ajjmfcia],0
@565:
	je        short @563
	mov       eax,dword ptr [$ajjmfcia]
	mov       edx,dword ptr [$ajjmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @566
	cmp       eax,dword ptr [ebp-20]
@566:
	setne     cl
	and       ecx,1
	jmp       short @564
@563:
	xor       ecx,ecx
@564:
	test      cl,cl
	jne       short @561
	?debug L 1454
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
	?debug L 1456
	test      byte ptr [ebp-25],64
	je        short @567
	?debug L 1457
	mov       dword ptr [$ifjmfcia],2
	jmp       short @568
	?debug L 1459
@567:
	test      byte ptr [ebp-25],-128
	je        short @569
	?debug L 1460
	mov       dword ptr [$ifjmfcia],1
	jmp       short @568
	?debug L 1462
@569:
	xor       ecx,ecx
	mov       dword ptr [$ifjmfcia],ecx
	?debug L 1463
@568:
	mov       eax,dword ptr [$ifjmfcia]
	?debug L 1464
?live16420@176: ; EAX = ret
	mov       dword ptr [$ajjmfcia],0
	?debug L 1463
?live16420@192: ; 
	test      eax,eax
	?debug L 1464
?live16420@208: ; EAX = ret
	mov       dword ptr [$ajjmfcia+4],0
	?debug L 1463
?live16420@224: ; 
	setne     al
	and       eax,1
	?debug L 1465
?live16420@240: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	mov       eax,edx
	?debug L 1466
?live16420@256: ; 
@570:
@557:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@554:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_3dnow$qv+0
	dd        @554+0
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
	dd	?patch164
	dd	?patch165
	dd	?patch166
	df	@@stk@cpu@cpu_has_3dnow$qv
	dw	0
	dw	4170
	dw	0
	dw	291
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
	dw	292
	dw	0
	dw	0
	dw	0
	dw	?patch167
	dw	529
	dw	?patch168
	dd	?live16420@176-@@stk@cpu@cpu_has_3dnow$qv
	dd	?live16420@192-?live16420@176
	dw	1
	dd	?live16420@208-@@stk@cpu@cpu_has_3dnow$qv
	dd	?live16420@224-?live16420@208
	dw	1
	dd	?live16420@240-@@stk@cpu@cpu_has_3dnow$qv
	dd	?live16420@256-?live16420@240
	dw	1
?patch168	equ	3
?patch167	equ	34
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	293
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	294
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	295
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	296
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ajjmfcia
	dw	0
	dw	4100
	dw	0
	dw	297
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	298
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ifjmfcia
	dw	0
	dw	117
	dw	0
	dw	299
	dw	0
	dw	0
	dw	0
?patch164	equ	@570-@@stk@cpu@cpu_has_3dnow$qv+73
?patch165	equ	0
?patch166	equ	@570-@@stk@cpu@cpu_has_3dnow$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$imjmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aakmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_3dnowprefetch$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_3dnowprefetch$qv	proc	near
?live16421@0:
	?debug L 1469
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @571
	?debug L 1475
@572:
	mov       eax,dword ptr [$imjmfcia]
	cmp       eax,-1
	je        short @576
	?debug L 1476
?live16421@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @574
	?debug L 1478
?live16421@48: ; 
@575:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@576:
	cmp       dword ptr [$aakmfcia+4],0
	jne       short @575
	cmp       dword ptr [$aakmfcia],0
	jne       short @575
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$aakmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$aakmfcia+4],ecx
	jmp       short @579
@578:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@579:
	cmp       dword ptr [$aakmfcia+4],0
	jne       short @582
	cmp       dword ptr [$aakmfcia],0
@582:
	je        short @580
	mov       eax,dword ptr [$aakmfcia]
	mov       edx,dword ptr [$aakmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @583
	cmp       eax,dword ptr [ebp-20]
@583:
	setne     al
	and       eax,1
	jmp       short @581
@580:
	xor       eax,eax
@581:
	test      al,al
	jne       short @578
	?debug L 1481
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
	?debug L 1483
	mov       eax,dword ptr [ebp-36]
	?debug L 1481
	add       esp,24
	?debug L 1483
	and       eax,256
	?debug L 1484
?live16421@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1483
?live16421@144: ; 
	mov       dword ptr [$imjmfcia],eax
	?debug L 1484
?live16421@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1485
?live16421@176: ; EAX = ret
	mov       dword ptr [$aakmfcia],0
	mov       dword ptr [$aakmfcia+4],0
	?debug L 1484
?live16421@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1487
?live16421@208: ; 
@584:
@574:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@571:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_3dnowprefetch$qv+0
	dd        @571+0
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
	dd	?patch169
	dd	?patch170
	dd	?patch171
	df	@@stk@cpu@cpu_has_3dnowprefetch$qv
	dw	0
	dw	4172
	dw	0
	dw	300
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
	dw	301
	dw	0
	dw	0
	dw	0
	dw	?patch172
	dw	529
	dw	?patch173
	dd	?live16421@176-@@stk@cpu@cpu_has_3dnowprefetch$qv
	dd	?live16421@192-?live16421@176
	dw	1
?patch173	equ	1
?patch172	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	302
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	303
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	304
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	305
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aakmfcia
	dw	0
	dw	4100
	dw	0
	dw	306
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	307
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$imjmfcia
	dw	0
	dw	117
	dw	0
	dw	308
	dw	0
	dw	0
	dw	0
?patch169	equ	@584-@@stk@cpu@cpu_has_3dnowprefetch$qv+72
?patch170	equ	0
?patch171	equ	@584-@@stk@cpu@cpu_has_3dnowprefetch$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$idkmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ahkmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_perftsc$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_perftsc$qv	proc	near
?live16422@0:
	?debug L 1490
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @585
	?debug L 1496
@586:
	mov       eax,dword ptr [$idkmfcia]
	cmp       eax,-1
	je        short @590
	?debug L 1497
?live16422@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @588
	?debug L 1499
?live16422@48: ; 
@589:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@590:
	cmp       dword ptr [$ahkmfcia+4],0
	jne       short @589
	cmp       dword ptr [$ahkmfcia],0
	jne       short @589
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$ahkmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$ahkmfcia+4],ecx
	jmp       short @593
@592:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@593:
	cmp       dword ptr [$ahkmfcia+4],0
	jne       short @596
	cmp       dword ptr [$ahkmfcia],0
@596:
	je        short @594
	mov       eax,dword ptr [$ahkmfcia]
	mov       edx,dword ptr [$ahkmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @597
	cmp       eax,dword ptr [ebp-20]
@597:
	setne     al
	and       eax,1
	jmp       short @595
@594:
	xor       eax,eax
@595:
	test      al,al
	jne       short @592
	?debug L 1502
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
	?debug L 1504
	mov       eax,dword ptr [ebp-28]
	?debug L 1502
	add       esp,24
	?debug L 1504
	and       eax,134217728
	?debug L 1505
?live16422@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1504
?live16422@144: ; 
	mov       dword ptr [$idkmfcia],eax
	?debug L 1505
?live16422@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1506
?live16422@176: ; EAX = ret
	mov       dword ptr [$ahkmfcia],0
	mov       dword ptr [$ahkmfcia+4],0
	?debug L 1505
?live16422@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1508
?live16422@208: ; 
@598:
@588:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@585:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_perftsc$qv+0
	dd        @585+0
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
	dd	?patch174
	dd	?patch175
	dd	?patch176
	df	@@stk@cpu@cpu_has_perftsc$qv
	dw	0
	dw	4174
	dw	0
	dw	309
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
	dw	310
	dw	0
	dw	0
	dw	0
	dw	?patch177
	dw	529
	dw	?patch178
	dd	?live16422@176-@@stk@cpu@cpu_has_perftsc$qv
	dd	?live16422@192-?live16422@176
	dw	1
?patch178	equ	1
?patch177	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	311
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	312
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	313
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	314
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ahkmfcia
	dw	0
	dw	4100
	dw	0
	dw	315
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	316
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$idkmfcia
	dw	0
	dw	117
	dw	0
	dw	317
	dw	0
	dw	0
	dw	0
?patch174	equ	@598-@@stk@cpu@cpu_has_perftsc$qv+72
?patch175	equ	0
?patch176	equ	@598-@@stk@cpu@cpu_has_perftsc$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ikkmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aokmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sha$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sha$qv	proc	near
?live16423@0:
	?debug L 1511
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @599
	?debug L 1517
@600:
	mov       eax,dword ptr [$ikkmfcia]
	cmp       eax,-1
	je        short @604
	?debug L 1518
?live16423@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @602
	?debug L 1520
?live16423@48: ; 
@603:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@604:
	cmp       dword ptr [$aokmfcia+4],0
	jne       short @603
	cmp       dword ptr [$aokmfcia],0
	jne       short @603
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$aokmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$aokmfcia+4],ecx
	jmp       short @607
@606:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@607:
	cmp       dword ptr [$aokmfcia+4],0
	jne       short @610
	cmp       dword ptr [$aokmfcia],0
@610:
	je        short @608
	mov       eax,dword ptr [$aokmfcia]
	mov       edx,dword ptr [$aokmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @611
	cmp       eax,dword ptr [ebp-20]
@611:
	setne     al
	and       eax,1
	jmp       short @609
@608:
	xor       eax,eax
@609:
	test      al,al
	jne       short @606
	?debug L 1523
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
	?debug L 1525
	mov       eax,dword ptr [ebp-44]
	?debug L 1523
	add       esp,24
	?debug L 1525
	and       eax,536870912
	?debug L 1526
?live16423@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1525
?live16423@144: ; 
	mov       dword ptr [$ikkmfcia],eax
	?debug L 1526
?live16423@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1527
?live16423@176: ; EAX = ret
	mov       dword ptr [$aokmfcia],0
	mov       dword ptr [$aokmfcia+4],0
	?debug L 1526
?live16423@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1529
?live16423@208: ; 
@612:
@602:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@599:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_sha$qv+0
	dd        @599+0
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
	dd	?patch179
	dd	?patch180
	dd	?patch181
	df	@@stk@cpu@cpu_has_sha$qv
	dw	0
	dw	4176
	dw	0
	dw	318
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
	dw	319
	dw	0
	dw	0
	dw	0
	dw	?patch182
	dw	529
	dw	?patch183
	dd	?live16423@176-@@stk@cpu@cpu_has_sha$qv
	dd	?live16423@192-?live16423@176
	dw	1
?patch183	equ	1
?patch182	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	320
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	321
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	322
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	323
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aokmfcia
	dw	0
	dw	4100
	dw	0
	dw	324
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	325
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ikkmfcia
	dw	0
	dw	117
	dw	0
	dw	326
	dw	0
	dw	0
	dw	0
?patch179	equ	@612-@@stk@cpu@cpu_has_sha$qv+71
?patch180	equ	0
?patch181	equ	@612-@@stk@cpu@cpu_has_sha$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iblmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aflmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_xop$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_xop$qv	proc	near
?live16424@0:
	?debug L 1532
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @613
	?debug L 1538
@614:
	mov       eax,dword ptr [$iblmfcia]
	cmp       eax,-1
	je        short @618
	?debug L 1539
?live16424@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @616
	?debug L 1541
?live16424@48: ; 
@617:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@618:
	cmp       dword ptr [$aflmfcia+4],0
	jne       short @617
	cmp       dword ptr [$aflmfcia],0
	jne       short @617
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$aflmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$aflmfcia+4],ecx
	jmp       short @621
@620:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@621:
	cmp       dword ptr [$aflmfcia+4],0
	jne       short @624
	cmp       dword ptr [$aflmfcia],0
@624:
	je        short @622
	mov       eax,dword ptr [$aflmfcia]
	mov       edx,dword ptr [$aflmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @625
	cmp       eax,dword ptr [ebp-20]
@625:
	setne     al
	and       eax,1
	jmp       short @623
@622:
	xor       eax,eax
@623:
	test      al,al
	jne       short @620
	?debug L 1544
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
	?debug L 1546
	mov       eax,dword ptr [ebp-36]
	?debug L 1544
	add       esp,24
	?debug L 1546
	and       eax,2048
	?debug L 1547
?live16424@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1546
?live16424@144: ; 
	mov       dword ptr [$iblmfcia],eax
	?debug L 1547
?live16424@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1548
?live16424@176: ; EAX = ret
	mov       dword ptr [$aflmfcia],0
	mov       dword ptr [$aflmfcia+4],0
	?debug L 1547
?live16424@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1550
?live16424@208: ; 
@626:
@616:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@613:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_xop$qv+0
	dd        @613+0
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
	dd	?patch184
	dd	?patch185
	dd	?patch186
	df	@@stk@cpu@cpu_has_xop$qv
	dw	0
	dw	4178
	dw	0
	dw	327
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
	dw	328
	dw	0
	dw	0
	dw	0
	dw	?patch187
	dw	529
	dw	?patch188
	dd	?live16424@176-@@stk@cpu@cpu_has_xop$qv
	dd	?live16424@192-?live16424@176
	dw	1
?patch188	equ	1
?patch187	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	329
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	330
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	331
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	332
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aflmfcia
	dw	0
	dw	4100
	dw	0
	dw	333
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	334
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iblmfcia
	dw	0
	dw	117
	dw	0
	dw	335
	dw	0
	dw	0
	dw	0
?patch184	equ	@626-@@stk@cpu@cpu_has_xop$qv+72
?patch185	equ	0
?patch186	equ	@626-@@stk@cpu@cpu_has_xop$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iilmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$amlmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512f$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512f$qv	proc	near
?live16425@0:
	?debug L 1553
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @627
	?debug L 1559
@628:
	mov       eax,dword ptr [$iilmfcia]
	cmp       eax,-1
	je        short @632
	?debug L 1560
?live16425@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @630
	?debug L 1562
?live16425@48: ; 
@631:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@632:
	cmp       dword ptr [$amlmfcia+4],0
	jne       short @631
	cmp       dword ptr [$amlmfcia],0
	jne       short @631
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$amlmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$amlmfcia+4],ecx
	jmp       short @635
@634:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@635:
	cmp       dword ptr [$amlmfcia+4],0
	jne       short @638
	cmp       dword ptr [$amlmfcia],0
@638:
	je        short @636
	mov       eax,dword ptr [$amlmfcia]
	mov       edx,dword ptr [$amlmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @639
	cmp       eax,dword ptr [ebp-20]
@639:
	setne     al
	and       eax,1
	jmp       short @637
@636:
	xor       eax,eax
@637:
	test      al,al
	jne       short @634
	?debug L 1565
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
	?debug L 1567
	mov       eax,dword ptr [ebp-44]
	?debug L 1565
	add       esp,24
	?debug L 1567
	and       eax,65536
	?debug L 1568
?live16425@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1567
?live16425@144: ; 
	mov       dword ptr [$iilmfcia],eax
	?debug L 1568
?live16425@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1569
?live16425@176: ; EAX = ret
	mov       dword ptr [$amlmfcia],0
	mov       dword ptr [$amlmfcia+4],0
	?debug L 1568
?live16425@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1571
?live16425@208: ; 
@640:
@630:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@627:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512f$qv+0
	dd        @627+0
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
	dd	?patch189
	dd	?patch190
	dd	?patch191
	df	@@stk@cpu@cpu_has_avx512f$qv
	dw	0
	dw	4180
	dw	0
	dw	336
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
	dw	337
	dw	0
	dw	0
	dw	0
	dw	?patch192
	dw	529
	dw	?patch193
	dd	?live16425@176-@@stk@cpu@cpu_has_avx512f$qv
	dd	?live16425@192-?live16425@176
	dw	1
?patch193	equ	1
?patch192	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	338
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	339
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	340
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	341
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$amlmfcia
	dw	0
	dw	4100
	dw	0
	dw	342
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	343
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iilmfcia
	dw	0
	dw	117
	dw	0
	dw	344
	dw	0
	dw	0
	dw	0
?patch189	equ	@640-@@stk@cpu@cpu_has_avx512f$qv+71
?patch190	equ	0
?patch191	equ	@640-@@stk@cpu@cpu_has_avx512f$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iplmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$admmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512bw$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512bw$qv	proc	near
?live16426@0:
	?debug L 1574
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @641
	?debug L 1580
@642:
	mov       eax,dword ptr [$iplmfcia]
	cmp       eax,-1
	je        short @646
	?debug L 1581
?live16426@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @644
	?debug L 1583
?live16426@48: ; 
@645:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@646:
	cmp       dword ptr [$admmfcia+4],0
	jne       short @645
	cmp       dword ptr [$admmfcia],0
	jne       short @645
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$admmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$admmfcia+4],ecx
	jmp       short @649
@648:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@649:
	cmp       dword ptr [$admmfcia+4],0
	jne       short @652
	cmp       dword ptr [$admmfcia],0
@652:
	je        short @650
	mov       eax,dword ptr [$admmfcia]
	mov       edx,dword ptr [$admmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @653
	cmp       eax,dword ptr [ebp-20]
@653:
	setne     al
	and       eax,1
	jmp       short @651
@650:
	xor       eax,eax
@651:
	test      al,al
	jne       short @648
	?debug L 1586
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
	?debug L 1588
	mov       eax,dword ptr [ebp-44]
	?debug L 1586
	add       esp,24
	?debug L 1588
	and       eax,1073741824
	?debug L 1589
?live16426@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1588
?live16426@144: ; 
	mov       dword ptr [$iplmfcia],eax
	?debug L 1589
?live16426@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1590
?live16426@176: ; EAX = ret
	mov       dword ptr [$admmfcia],0
	mov       dword ptr [$admmfcia+4],0
	?debug L 1589
?live16426@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1592
?live16426@208: ; 
@654:
@644:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@641:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512bw$qv+0
	dd        @641+0
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
	dd	?patch194
	dd	?patch195
	dd	?patch196
	df	@@stk@cpu@cpu_has_avx512bw$qv
	dw	0
	dw	4182
	dw	0
	dw	345
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
	dw	346
	dw	0
	dw	0
	dw	0
	dw	?patch197
	dw	529
	dw	?patch198
	dd	?live16426@176-@@stk@cpu@cpu_has_avx512bw$qv
	dd	?live16426@192-?live16426@176
	dw	1
?patch198	equ	1
?patch197	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	347
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	348
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	349
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	350
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$admmfcia
	dw	0
	dw	4100
	dw	0
	dw	351
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	352
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iplmfcia
	dw	0
	dw	117
	dw	0
	dw	353
	dw	0
	dw	0
	dw	0
?patch194	equ	@654-@@stk@cpu@cpu_has_avx512bw$qv+71
?patch195	equ	0
?patch196	equ	@654-@@stk@cpu@cpu_has_avx512bw$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$igmmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$akmmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512er$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512er$qv	proc	near
?live16427@0:
	?debug L 1595
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @655
	?debug L 1601
@656:
	mov       eax,dword ptr [$igmmfcia]
	cmp       eax,-1
	je        short @660
	?debug L 1602
?live16427@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @658
	?debug L 1604
?live16427@48: ; 
@659:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@660:
	cmp       dword ptr [$akmmfcia+4],0
	jne       short @659
	cmp       dword ptr [$akmmfcia],0
	jne       short @659
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$akmmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$akmmfcia+4],ecx
	jmp       short @663
@662:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@663:
	cmp       dword ptr [$akmmfcia+4],0
	jne       short @666
	cmp       dword ptr [$akmmfcia],0
@666:
	je        short @664
	mov       eax,dword ptr [$akmmfcia]
	mov       edx,dword ptr [$akmmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @667
	cmp       eax,dword ptr [ebp-20]
@667:
	setne     al
	and       eax,1
	jmp       short @665
@664:
	xor       eax,eax
@665:
	test      al,al
	jne       short @662
	?debug L 1607
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
	?debug L 1609
	mov       eax,dword ptr [ebp-44]
	?debug L 1607
	add       esp,24
	?debug L 1609
	and       eax,134217728
	?debug L 1610
?live16427@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1609
?live16427@144: ; 
	mov       dword ptr [$igmmfcia],eax
	?debug L 1610
?live16427@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1611
?live16427@176: ; EAX = ret
	mov       dword ptr [$akmmfcia],0
	mov       dword ptr [$akmmfcia+4],0
	?debug L 1610
?live16427@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1613
?live16427@208: ; 
@668:
@658:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@655:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512er$qv+0
	dd        @655+0
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
	dd	?patch199
	dd	?patch200
	dd	?patch201
	df	@@stk@cpu@cpu_has_avx512er$qv
	dw	0
	dw	4184
	dw	0
	dw	354
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
	dw	355
	dw	0
	dw	0
	dw	0
	dw	?patch202
	dw	529
	dw	?patch203
	dd	?live16427@176-@@stk@cpu@cpu_has_avx512er$qv
	dd	?live16427@192-?live16427@176
	dw	1
?patch203	equ	1
?patch202	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	356
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	357
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	358
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	359
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$akmmfcia
	dw	0
	dw	4100
	dw	0
	dw	360
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	361
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$igmmfcia
	dw	0
	dw	117
	dw	0
	dw	362
	dw	0
	dw	0
	dw	0
?patch199	equ	@668-@@stk@cpu@cpu_has_avx512er$qv+71
?patch200	equ	0
?patch201	equ	@668-@@stk@cpu@cpu_has_avx512er$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$inmmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$abnmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512cd$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512cd$qv	proc	near
?live16428@0:
	?debug L 1616
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @669
	?debug L 1622
@670:
	mov       eax,dword ptr [$inmmfcia]
	cmp       eax,-1
	je        short @674
	?debug L 1623
?live16428@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @672
	?debug L 1625
?live16428@48: ; 
@673:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@674:
	cmp       dword ptr [$abnmfcia+4],0
	jne       short @673
	cmp       dword ptr [$abnmfcia],0
	jne       short @673
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$abnmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$abnmfcia+4],ecx
	jmp       short @677
@676:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@677:
	cmp       dword ptr [$abnmfcia+4],0
	jne       short @680
	cmp       dword ptr [$abnmfcia],0
@680:
	je        short @678
	mov       eax,dword ptr [$abnmfcia]
	mov       edx,dword ptr [$abnmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @681
	cmp       eax,dword ptr [ebp-20]
@681:
	setne     al
	and       eax,1
	jmp       short @679
@678:
	xor       eax,eax
@679:
	test      al,al
	jne       short @676
	?debug L 1628
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
	?debug L 1630
	mov       eax,dword ptr [ebp-44]
	?debug L 1628
	add       esp,24
	?debug L 1630
	and       eax,268435456
	?debug L 1631
?live16428@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1630
?live16428@144: ; 
	mov       dword ptr [$inmmfcia],eax
	?debug L 1631
?live16428@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1632
?live16428@176: ; EAX = ret
	mov       dword ptr [$abnmfcia],0
	mov       dword ptr [$abnmfcia+4],0
	?debug L 1631
?live16428@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1634
?live16428@208: ; 
@682:
@672:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@669:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512cd$qv+0
	dd        @669+0
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
	dd	?patch204
	dd	?patch205
	dd	?patch206
	df	@@stk@cpu@cpu_has_avx512cd$qv
	dw	0
	dw	4186
	dw	0
	dw	363
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
	dw	364
	dw	0
	dw	0
	dw	0
	dw	?patch207
	dw	529
	dw	?patch208
	dd	?live16428@176-@@stk@cpu@cpu_has_avx512cd$qv
	dd	?live16428@192-?live16428@176
	dw	1
?patch208	equ	1
?patch207	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	365
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	366
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	367
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	368
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$abnmfcia
	dw	0
	dw	4100
	dw	0
	dw	369
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	370
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$inmmfcia
	dw	0
	dw	117
	dw	0
	dw	371
	dw	0
	dw	0
	dw	0
?patch204	equ	@682-@@stk@cpu@cpu_has_avx512cd$qv+71
?patch205	equ	0
?patch206	equ	@682-@@stk@cpu@cpu_has_avx512cd$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ienmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ainmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512pf$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512pf$qv	proc	near
?live16429@0:
	?debug L 1637
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @683
	?debug L 1643
@684:
	mov       eax,dword ptr [$ienmfcia]
	cmp       eax,-1
	je        short @688
	?debug L 1644
?live16429@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @686
	?debug L 1646
?live16429@48: ; 
@687:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@688:
	cmp       dword ptr [$ainmfcia+4],0
	jne       short @687
	cmp       dword ptr [$ainmfcia],0
	jne       short @687
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$ainmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$ainmfcia+4],ecx
	jmp       short @691
@690:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@691:
	cmp       dword ptr [$ainmfcia+4],0
	jne       short @694
	cmp       dword ptr [$ainmfcia],0
@694:
	je        short @692
	mov       eax,dword ptr [$ainmfcia]
	mov       edx,dword ptr [$ainmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @695
	cmp       eax,dword ptr [ebp-20]
@695:
	setne     al
	and       eax,1
	jmp       short @693
@692:
	xor       eax,eax
@693:
	test      al,al
	jne       short @690
	?debug L 1649
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
	?debug L 1651
	mov       eax,dword ptr [ebp-44]
	?debug L 1649
	add       esp,24
	?debug L 1651
	and       eax,67108864
	?debug L 1652
?live16429@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1651
?live16429@144: ; 
	mov       dword ptr [$ienmfcia],eax
	?debug L 1652
?live16429@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1653
?live16429@176: ; EAX = ret
	mov       dword ptr [$ainmfcia],0
	mov       dword ptr [$ainmfcia+4],0
	?debug L 1652
?live16429@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1655
?live16429@208: ; 
@696:
@686:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@683:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512pf$qv+0
	dd        @683+0
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
	dd	?patch209
	dd	?patch210
	dd	?patch211
	df	@@stk@cpu@cpu_has_avx512pf$qv
	dw	0
	dw	4188
	dw	0
	dw	372
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
	dw	373
	dw	0
	dw	0
	dw	0
	dw	?patch212
	dw	529
	dw	?patch213
	dd	?live16429@176-@@stk@cpu@cpu_has_avx512pf$qv
	dd	?live16429@192-?live16429@176
	dw	1
?patch213	equ	1
?patch212	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	374
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	375
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	376
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	377
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ainmfcia
	dw	0
	dw	4100
	dw	0
	dw	378
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	379
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ienmfcia
	dw	0
	dw	117
	dw	0
	dw	380
	dw	0
	dw	0
	dw	0
?patch209	equ	@696-@@stk@cpu@cpu_has_avx512pf$qv+71
?patch210	equ	0
?patch211	equ	@696-@@stk@cpu@cpu_has_avx512pf$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ilnmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$apnmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512dq$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512dq$qv	proc	near
?live16430@0:
	?debug L 1658
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @697
	?debug L 1664
@698:
	mov       eax,dword ptr [$ilnmfcia]
	cmp       eax,-1
	je        short @702
	?debug L 1665
?live16430@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @700
	?debug L 1667
?live16430@48: ; 
@701:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@702:
	cmp       dword ptr [$apnmfcia+4],0
	jne       short @701
	cmp       dword ptr [$apnmfcia],0
	jne       short @701
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$apnmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$apnmfcia+4],ecx
	jmp       short @705
@704:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@705:
	cmp       dword ptr [$apnmfcia+4],0
	jne       short @708
	cmp       dword ptr [$apnmfcia],0
@708:
	je        short @706
	mov       eax,dword ptr [$apnmfcia]
	mov       edx,dword ptr [$apnmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @709
	cmp       eax,dword ptr [ebp-20]
@709:
	setne     al
	and       eax,1
	jmp       short @707
@706:
	xor       eax,eax
@707:
	test      al,al
	jne       short @704
	?debug L 1670
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
	?debug L 1672
	mov       eax,dword ptr [ebp-44]
	?debug L 1670
	add       esp,24
	?debug L 1672
	and       eax,131072
	?debug L 1673
?live16430@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1672
?live16430@144: ; 
	mov       dword ptr [$ilnmfcia],eax
	?debug L 1673
?live16430@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1674
?live16430@176: ; EAX = ret
	mov       dword ptr [$apnmfcia],0
	mov       dword ptr [$apnmfcia+4],0
	?debug L 1673
?live16430@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1676
?live16430@208: ; 
@710:
@700:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@697:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512dq$qv+0
	dd        @697+0
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
	dd	?patch214
	dd	?patch215
	dd	?patch216
	df	@@stk@cpu@cpu_has_avx512dq$qv
	dw	0
	dw	4190
	dw	0
	dw	381
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
	dw	382
	dw	0
	dw	0
	dw	0
	dw	?patch217
	dw	529
	dw	?patch218
	dd	?live16430@176-@@stk@cpu@cpu_has_avx512dq$qv
	dd	?live16430@192-?live16430@176
	dw	1
?patch218	equ	1
?patch217	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	383
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	384
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	385
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	386
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$apnmfcia
	dw	0
	dw	4100
	dw	0
	dw	387
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	388
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ilnmfcia
	dw	0
	dw	117
	dw	0
	dw	389
	dw	0
	dw	0
	dw	0
?patch214	equ	@710-@@stk@cpu@cpu_has_avx512dq$qv+71
?patch215	equ	0
?patch216	equ	@710-@@stk@cpu@cpu_has_avx512dq$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$icomfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$agomfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512vl$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512vl$qv	proc	near
?live16431@0:
	?debug L 1679
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @711
	?debug L 1685
@712:
	mov       eax,dword ptr [$icomfcia]
	cmp       eax,-1
	je        short @716
	?debug L 1686
?live16431@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @714
	?debug L 1688
?live16431@48: ; 
@715:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@716:
	cmp       dword ptr [$agomfcia+4],0
	jne       short @715
	cmp       dword ptr [$agomfcia],0
	jne       short @715
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$agomfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$agomfcia+4],ecx
	jmp       short @719
@718:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@719:
	cmp       dword ptr [$agomfcia+4],0
	jne       short @722
	cmp       dword ptr [$agomfcia],0
@722:
	je        short @720
	mov       eax,dword ptr [$agomfcia]
	mov       edx,dword ptr [$agomfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @723
	cmp       eax,dword ptr [ebp-20]
@723:
	setne     al
	and       eax,1
	jmp       short @721
@720:
	xor       eax,eax
@721:
	test      al,al
	jne       short @718
	?debug L 1691
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
	?debug L 1693
	mov       eax,dword ptr [ebp-44]
	?debug L 1691
	add       esp,24
	?debug L 1693
	and       eax,-2147483648
	?debug L 1694
?live16431@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1693
?live16431@144: ; 
	mov       dword ptr [$icomfcia],eax
	?debug L 1694
?live16431@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1695
?live16431@176: ; EAX = ret
	mov       dword ptr [$agomfcia],0
	mov       dword ptr [$agomfcia+4],0
	?debug L 1694
?live16431@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1697
?live16431@208: ; 
@724:
@714:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@711:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512vl$qv+0
	dd        @711+0
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
	dd	?patch219
	dd	?patch220
	dd	?patch221
	df	@@stk@cpu@cpu_has_avx512vl$qv
	dw	0
	dw	4192
	dw	0
	dw	390
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
	dw	391
	dw	0
	dw	0
	dw	0
	dw	?patch222
	dw	529
	dw	?patch223
	dd	?live16431@176-@@stk@cpu@cpu_has_avx512vl$qv
	dd	?live16431@192-?live16431@176
	dw	1
?patch223	equ	1
?patch222	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	392
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	393
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	394
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	395
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$agomfcia
	dw	0
	dw	4100
	dw	0
	dw	396
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	397
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$icomfcia
	dw	0
	dw	117
	dw	0
	dw	398
	dw	0
	dw	0
	dw	0
?patch219	equ	@724-@@stk@cpu@cpu_has_avx512vl$qv+71
?patch220	equ	0
?patch221	equ	@724-@@stk@cpu@cpu_has_avx512vl$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ijomfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$anomfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512ifma$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512ifma$qv	proc	near
?live16432@0:
	?debug L 1700
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @725
	?debug L 1706
@726:
	mov       eax,dword ptr [$ijomfcia]
	cmp       eax,-1
	je        short @730
	?debug L 1707
?live16432@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @728
	?debug L 1709
?live16432@48: ; 
@729:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@730:
	cmp       dword ptr [$anomfcia+4],0
	jne       short @729
	cmp       dword ptr [$anomfcia],0
	jne       short @729
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$anomfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$anomfcia+4],ecx
	jmp       short @733
@732:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@733:
	cmp       dword ptr [$anomfcia+4],0
	jne       short @736
	cmp       dword ptr [$anomfcia],0
@736:
	je        short @734
	mov       eax,dword ptr [$anomfcia]
	mov       edx,dword ptr [$anomfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @737
	cmp       eax,dword ptr [ebp-20]
@737:
	setne     al
	and       eax,1
	jmp       short @735
@734:
	xor       eax,eax
@735:
	test      al,al
	jne       short @732
	?debug L 1712
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
	?debug L 1714
	mov       eax,dword ptr [ebp-44]
	?debug L 1712
	add       esp,24
	?debug L 1714
	and       eax,2097152
	?debug L 1715
?live16432@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1714
?live16432@144: ; 
	mov       dword ptr [$ijomfcia],eax
	?debug L 1715
?live16432@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1716
?live16432@176: ; EAX = ret
	mov       dword ptr [$anomfcia],0
	mov       dword ptr [$anomfcia+4],0
	?debug L 1715
?live16432@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1718
?live16432@208: ; 
@738:
@728:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@725:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512ifma$qv+0
	dd        @725+0
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
	dd	?patch224
	dd	?patch225
	dd	?patch226
	df	@@stk@cpu@cpu_has_avx512ifma$qv
	dw	0
	dw	4194
	dw	0
	dw	399
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
	dw	400
	dw	0
	dw	0
	dw	0
	dw	?patch227
	dw	529
	dw	?patch228
	dd	?live16432@176-@@stk@cpu@cpu_has_avx512ifma$qv
	dd	?live16432@192-?live16432@176
	dw	1
?patch228	equ	1
?patch227	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	401
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	402
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	403
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	404
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$anomfcia
	dw	0
	dw	4100
	dw	0
	dw	405
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	406
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ijomfcia
	dw	0
	dw	117
	dw	0
	dw	407
	dw	0
	dw	0
	dw	0
?patch224	equ	@738-@@stk@cpu@cpu_has_avx512ifma$qv+71
?patch225	equ	0
?patch226	equ	@738-@@stk@cpu@cpu_has_avx512ifma$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iapmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aepmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512vbmi$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512vbmi$qv	proc	near
?live16433@0:
	?debug L 1721
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @739
	?debug L 1727
@740:
	mov       eax,dword ptr [$iapmfcia]
	cmp       eax,-1
	je        short @744
	?debug L 1728
?live16433@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @742
	?debug L 1730
?live16433@48: ; 
@743:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@744:
	cmp       dword ptr [$aepmfcia+4],0
	jne       short @743
	cmp       dword ptr [$aepmfcia],0
	jne       short @743
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$aepmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$aepmfcia+4],ecx
	jmp       short @747
@746:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@747:
	cmp       dword ptr [$aepmfcia+4],0
	jne       short @750
	cmp       dword ptr [$aepmfcia],0
@750:
	je        short @748
	mov       eax,dword ptr [$aepmfcia]
	mov       edx,dword ptr [$aepmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @751
	cmp       eax,dword ptr [ebp-20]
@751:
	setne     al
	and       eax,1
	jmp       short @749
@748:
	xor       eax,eax
@749:
	test      al,al
	jne       short @746
	?debug L 1733
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
	?debug L 1735
	mov       eax,dword ptr [ebp-36]
	?debug L 1733
	add       esp,24
	?debug L 1735
	and       eax,2
	?debug L 1736
?live16433@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1735
?live16433@144: ; 
	mov       dword ptr [$iapmfcia],eax
	?debug L 1736
?live16433@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1737
?live16433@176: ; EAX = ret
	mov       dword ptr [$aepmfcia],0
	mov       dword ptr [$aepmfcia+4],0
	?debug L 1736
?live16433@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1739
?live16433@208: ; 
@752:
@742:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@739:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512vbmi$qv+0
	dd        @739+0
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
	dd	?patch229
	dd	?patch230
	dd	?patch231
	df	@@stk@cpu@cpu_has_avx512vbmi$qv
	dw	0
	dw	4196
	dw	0
	dw	408
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
	dw	409
	dw	0
	dw	0
	dw	0
	dw	?patch232
	dw	529
	dw	?patch233
	dd	?live16433@176-@@stk@cpu@cpu_has_avx512vbmi$qv
	dd	?live16433@192-?live16433@176
	dw	1
?patch233	equ	1
?patch232	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	410
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	411
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	412
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	413
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aepmfcia
	dw	0
	dw	4100
	dw	0
	dw	414
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	415
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iapmfcia
	dw	0
	dw	117
	dw	0
	dw	416
	dw	0
	dw	0
	dw	0
?patch229	equ	@752-@@stk@cpu@cpu_has_avx512vbmi$qv+73
?patch230	equ	0
?patch231	equ	@752-@@stk@cpu@cpu_has_avx512vbmi$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ihpmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$alpmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_adx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_adx$qv	proc	near
?live16434@0:
	?debug L 1742
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @753
	?debug L 1748
@754:
	mov       eax,dword ptr [$ihpmfcia]
	cmp       eax,-1
	je        short @758
	?debug L 1749
?live16434@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @756
	?debug L 1751
?live16434@48: ; 
@757:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@758:
	cmp       dword ptr [$alpmfcia+4],0
	jne       short @757
	cmp       dword ptr [$alpmfcia],0
	jne       short @757
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$alpmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$alpmfcia+4],ecx
	jmp       short @761
@760:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@761:
	cmp       dword ptr [$alpmfcia+4],0
	jne       short @764
	cmp       dword ptr [$alpmfcia],0
@764:
	je        short @762
	mov       eax,dword ptr [$alpmfcia]
	mov       edx,dword ptr [$alpmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @765
	cmp       eax,dword ptr [ebp-20]
@765:
	setne     al
	and       eax,1
	jmp       short @763
@762:
	xor       eax,eax
@763:
	test      al,al
	jne       short @760
	?debug L 1754
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
	?debug L 1756
	mov       eax,dword ptr [ebp-44]
	?debug L 1754
	add       esp,24
	?debug L 1756
	and       eax,524288
	?debug L 1757
?live16434@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1756
?live16434@144: ; 
	mov       dword ptr [$ihpmfcia],eax
	?debug L 1757
?live16434@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1758
?live16434@176: ; EAX = ret
	mov       dword ptr [$alpmfcia],0
	mov       dword ptr [$alpmfcia+4],0
	?debug L 1757
?live16434@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1760
?live16434@208: ; 
@766:
@756:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@753:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_adx$qv+0
	dd        @753+0
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
	dd	?patch234
	dd	?patch235
	dd	?patch236
	df	@@stk@cpu@cpu_has_adx$qv
	dw	0
	dw	4198
	dw	0
	dw	417
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
	dw	418
	dw	0
	dw	0
	dw	0
	dw	?patch237
	dw	529
	dw	?patch238
	dd	?live16434@176-@@stk@cpu@cpu_has_adx$qv
	dd	?live16434@192-?live16434@176
	dw	1
?patch238	equ	1
?patch237	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	419
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	420
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	421
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	422
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$alpmfcia
	dw	0
	dw	4100
	dw	0
	dw	423
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	424
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ihpmfcia
	dw	0
	dw	117
	dw	0
	dw	425
	dw	0
	dw	0
	dw	0
?patch234	equ	@766-@@stk@cpu@cpu_has_adx$qv+71
?patch235	equ	0
?patch236	equ	@766-@@stk@cpu@cpu_has_adx$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iopmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$acanfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_lzcnt$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_lzcnt$qv	proc	near
?live16435@0:
	?debug L 1763
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @767
	?debug L 1769
@768:
	mov       eax,dword ptr [$iopmfcia]
	cmp       eax,-1
	je        short @772
	?debug L 1770
?live16435@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @770
	?debug L 1772
?live16435@48: ; 
@771:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@772:
	cmp       dword ptr [$acanfcia+4],0
	jne       short @771
	cmp       dword ptr [$acanfcia],0
	jne       short @771
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$acanfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$acanfcia+4],ecx
	jmp       short @775
@774:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@775:
	cmp       dword ptr [$acanfcia+4],0
	jne       short @778
	cmp       dword ptr [$acanfcia],0
@778:
	je        short @776
	mov       eax,dword ptr [$acanfcia]
	mov       edx,dword ptr [$acanfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @779
	cmp       eax,dword ptr [ebp-20]
@779:
	setne     al
	and       eax,1
	jmp       short @777
@776:
	xor       eax,eax
@777:
	test      al,al
	jne       short @774
	?debug L 1775
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
	?debug L 1777
	mov       eax,dword ptr [ebp-36]
	?debug L 1775
	add       esp,24
	?debug L 1777
	and       eax,32
	?debug L 1778
?live16435@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1777
?live16435@144: ; 
	mov       dword ptr [$iopmfcia],eax
	?debug L 1778
?live16435@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1779
?live16435@176: ; EAX = ret
	mov       dword ptr [$acanfcia],0
	mov       dword ptr [$acanfcia+4],0
	?debug L 1778
?live16435@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1781
?live16435@208: ; 
@780:
@770:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@767:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_lzcnt$qv+0
	dd        @767+0
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
	dd	?patch239
	dd	?patch240
	dd	?patch241
	df	@@stk@cpu@cpu_has_lzcnt$qv
	dw	0
	dw	4200
	dw	0
	dw	426
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
	dw	427
	dw	0
	dw	0
	dw	0
	dw	?patch242
	dw	529
	dw	?patch243
	dd	?live16435@176-@@stk@cpu@cpu_has_lzcnt$qv
	dd	?live16435@192-?live16435@176
	dw	1
?patch243	equ	1
?patch242	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	428
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	429
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	430
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	431
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$acanfcia
	dw	0
	dw	4100
	dw	0
	dw	432
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	433
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iopmfcia
	dw	0
	dw	117
	dw	0
	dw	434
	dw	0
	dw	0
	dw	0
?patch239	equ	@780-@@stk@cpu@cpu_has_lzcnt$qv+74
?patch240	equ	0
?patch241	equ	@780-@@stk@cpu@cpu_has_lzcnt$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ifanfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ajanfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_tbm$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_tbm$qv	proc	near
?live16436@0:
	?debug L 1784
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @781
	?debug L 1790
@782:
	mov       eax,dword ptr [$ifanfcia]
	cmp       eax,-1
	je        short @786
	?debug L 1791
?live16436@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @784
	?debug L 1793
?live16436@48: ; 
@785:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@786:
	cmp       dword ptr [$ajanfcia+4],0
	jne       short @785
	cmp       dword ptr [$ajanfcia],0
	jne       short @785
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$ajanfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$ajanfcia+4],ecx
	jmp       short @789
@788:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@789:
	cmp       dword ptr [$ajanfcia+4],0
	jne       short @792
	cmp       dword ptr [$ajanfcia],0
@792:
	je        short @790
	mov       eax,dword ptr [$ajanfcia]
	mov       edx,dword ptr [$ajanfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @793
	cmp       eax,dword ptr [ebp-20]
@793:
	setne     al
	and       eax,1
	jmp       short @791
@790:
	xor       eax,eax
@791:
	test      al,al
	jne       short @788
	?debug L 1796
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
	?debug L 1798
	mov       eax,dword ptr [ebp-36]
	?debug L 1796
	add       esp,24
	?debug L 1798
	and       eax,2097152
	?debug L 1799
?live16436@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1798
?live16436@144: ; 
	mov       dword ptr [$ifanfcia],eax
	?debug L 1799
?live16436@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1800
?live16436@176: ; EAX = ret
	mov       dword ptr [$ajanfcia],0
	mov       dword ptr [$ajanfcia+4],0
	?debug L 1799
?live16436@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1802
?live16436@208: ; 
@794:
@784:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@781:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_tbm$qv+0
	dd        @781+0
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
	dd	?patch244
	dd	?patch245
	dd	?patch246
	df	@@stk@cpu@cpu_has_tbm$qv
	dw	0
	dw	4202
	dw	0
	dw	435
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
	dw	436
	dw	0
	dw	0
	dw	0
	dw	?patch247
	dw	529
	dw	?patch248
	dd	?live16436@176-@@stk@cpu@cpu_has_tbm$qv
	dd	?live16436@192-?live16436@176
	dw	1
?patch248	equ	1
?patch247	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	437
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	438
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	439
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	440
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ajanfcia
	dw	0
	dw	4100
	dw	0
	dw	441
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	442
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ifanfcia
	dw	0
	dw	117
	dw	0
	dw	443
	dw	0
	dw	0
	dw	0
?patch244	equ	@794-@@stk@cpu@cpu_has_tbm$qv+72
?patch245	equ	0
?patch246	equ	@794-@@stk@cpu@cpu_has_tbm$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$imanfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aabnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_clfsh$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_clfsh$qv	proc	near
?live16437@0:
	?debug L 1805
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @795
	?debug L 1811
@796:
	mov       eax,dword ptr [$imanfcia]
	cmp       eax,-1
	je        short @800
	?debug L 1812
?live16437@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @798
	?debug L 1814
?live16437@48: ; 
@799:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@800:
	cmp       dword ptr [$aabnfcia+4],0
	jne       short @799
	cmp       dword ptr [$aabnfcia],0
	jne       short @799
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$aabnfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$aabnfcia+4],ecx
	jmp       short @803
@802:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@803:
	cmp       dword ptr [$aabnfcia+4],0
	jne       short @806
	cmp       dword ptr [$aabnfcia],0
@806:
	je        short @804
	mov       eax,dword ptr [$aabnfcia]
	mov       edx,dword ptr [$aabnfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @807
	cmp       eax,dword ptr [ebp-20]
@807:
	setne     al
	and       eax,1
	jmp       short @805
@804:
	xor       eax,eax
@805:
	test      al,al
	jne       short @802
	?debug L 1817
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
	?debug L 1819
	mov       eax,dword ptr [ebp-36]
	?debug L 1817
	add       esp,24
	?debug L 1819
	and       eax,524288
	?debug L 1820
?live16437@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1819
?live16437@144: ; 
	mov       dword ptr [$imanfcia],eax
	?debug L 1820
?live16437@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1821
?live16437@176: ; EAX = ret
	mov       dword ptr [$aabnfcia],0
	mov       dword ptr [$aabnfcia+4],0
	?debug L 1820
?live16437@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1823
?live16437@208: ; 
@808:
@798:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@795:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_clfsh$qv+0
	dd        @795+0
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
	dd	?patch249
	dd	?patch250
	dd	?patch251
	df	@@stk@cpu@cpu_has_clfsh$qv
	dw	0
	dw	4204
	dw	0
	dw	444
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
	dw	445
	dw	0
	dw	0
	dw	0
	dw	?patch252
	dw	529
	dw	?patch253
	dd	?live16437@176-@@stk@cpu@cpu_has_clfsh$qv
	dd	?live16437@192-?live16437@176
	dw	1
?patch253	equ	1
?patch252	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	446
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	447
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	448
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	449
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aabnfcia
	dw	0
	dw	4100
	dw	0
	dw	450
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	451
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$imanfcia
	dw	0
	dw	117
	dw	0
	dw	452
	dw	0
	dw	0
	dw	0
?patch249	equ	@808-@@stk@cpu@cpu_has_clfsh$qv+71
?patch250	equ	0
?patch251	equ	@808-@@stk@cpu@cpu_has_clfsh$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$idbnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ahbnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_pclmulqdq$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_pclmulqdq$qv	proc	near
?live16438@0:
	?debug L 1826
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @809
	?debug L 1832
@810:
	mov       eax,dword ptr [$idbnfcia]
	cmp       eax,-1
	je        short @814
	?debug L 1833
?live16438@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @812
	?debug L 1835
?live16438@48: ; 
@813:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@814:
	cmp       dword ptr [$ahbnfcia+4],0
	jne       short @813
	cmp       dword ptr [$ahbnfcia],0
	jne       short @813
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$ahbnfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$ahbnfcia+4],ecx
	jmp       short @817
@816:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@817:
	cmp       dword ptr [$ahbnfcia+4],0
	jne       short @820
	cmp       dword ptr [$ahbnfcia],0
@820:
	je        short @818
	mov       eax,dword ptr [$ahbnfcia]
	mov       edx,dword ptr [$ahbnfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @821
	cmp       eax,dword ptr [ebp-20]
@821:
	setne     al
	and       eax,1
	jmp       short @819
@818:
	xor       eax,eax
@819:
	test      al,al
	jne       short @816
	?debug L 1838
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
	?debug L 1840
	mov       eax,dword ptr [ebp-36]
	?debug L 1838
	add       esp,24
	?debug L 1840
	and       eax,32
	?debug L 1841
?live16438@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1840
?live16438@144: ; 
	mov       dword ptr [$idbnfcia],eax
	?debug L 1841
?live16438@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1842
?live16438@176: ; EAX = ret
	mov       dword ptr [$ahbnfcia],0
	mov       dword ptr [$ahbnfcia+4],0
	?debug L 1841
?live16438@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1844
?live16438@208: ; 
@822:
@812:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@809:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_pclmulqdq$qv+0
	dd        @809+0
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
	dd	?patch254
	dd	?patch255
	dd	?patch256
	df	@@stk@cpu@cpu_has_pclmulqdq$qv
	dw	0
	dw	4206
	dw	0
	dw	453
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
	dw	454
	dw	0
	dw	0
	dw	0
	dw	?patch257
	dw	529
	dw	?patch258
	dd	?live16438@176-@@stk@cpu@cpu_has_pclmulqdq$qv
	dd	?live16438@192-?live16438@176
	dw	1
?patch258	equ	1
?patch257	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	455
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	456
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	457
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	458
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ahbnfcia
	dw	0
	dw	4100
	dw	0
	dw	459
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	460
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$idbnfcia
	dw	0
	dw	117
	dw	0
	dw	461
	dw	0
	dw	0
	dw	0
?patch254	equ	@822-@@stk@cpu@cpu_has_pclmulqdq$qv+73
?patch255	equ	0
?patch256	equ	@822-@@stk@cpu@cpu_has_pclmulqdq$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ikbnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aobnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_fxsr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_fxsr$qv	proc	near
?live16439@0:
	?debug L 1847
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @823
	?debug L 1853
@824:
	mov       eax,dword ptr [$ikbnfcia]
	cmp       eax,-1
	je        short @828
	?debug L 1854
?live16439@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @826
	?debug L 1856
?live16439@48: ; 
@827:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@828:
	cmp       dword ptr [$aobnfcia+4],0
	jne       short @827
	cmp       dword ptr [$aobnfcia],0
	jne       short @827
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$aobnfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$aobnfcia+4],ecx
	jmp       short @831
@830:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@831:
	cmp       dword ptr [$aobnfcia+4],0
	jne       short @834
	cmp       dword ptr [$aobnfcia],0
@834:
	je        short @832
	mov       eax,dword ptr [$aobnfcia]
	mov       edx,dword ptr [$aobnfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @835
	cmp       eax,dword ptr [ebp-20]
@835:
	setne     al
	and       eax,1
	jmp       short @833
@832:
	xor       eax,eax
@833:
	test      al,al
	jne       short @830
	?debug L 1859
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
	?debug L 1861
	mov       eax,dword ptr [ebp-36]
	?debug L 1859
	add       esp,24
	?debug L 1861
	and       eax,16777216
	?debug L 1862
?live16439@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1861
?live16439@144: ; 
	mov       dword ptr [$ikbnfcia],eax
	?debug L 1862
?live16439@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1863
?live16439@176: ; EAX = ret
	mov       dword ptr [$aobnfcia],0
	mov       dword ptr [$aobnfcia+4],0
	?debug L 1862
?live16439@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1865
?live16439@208: ; 
@836:
@826:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@823:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_fxsr$qv+0
	dd        @823+0
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
	dd	?patch259
	dd	?patch260
	dd	?patch261
	df	@@stk@cpu@cpu_has_fxsr$qv
	dw	0
	dw	4208
	dw	0
	dw	462
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
	dw	463
	dw	0
	dw	0
	dw	0
	dw	?patch262
	dw	529
	dw	?patch263
	dd	?live16439@176-@@stk@cpu@cpu_has_fxsr$qv
	dd	?live16439@192-?live16439@176
	dw	1
?patch263	equ	1
?patch262	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	464
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	465
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	466
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	467
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aobnfcia
	dw	0
	dw	4100
	dw	0
	dw	468
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	469
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ikbnfcia
	dw	0
	dw	117
	dw	0
	dw	470
	dw	0
	dw	0
	dw	0
?patch259	equ	@836-@@stk@cpu@cpu_has_fxsr$qv+71
?patch260	equ	0
?patch261	equ	@836-@@stk@cpu@cpu_has_fxsr$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ibcnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$afcnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_ss$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_ss$qv	proc	near
?live16440@0:
	?debug L 1868
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @837
	?debug L 1874
@838:
	mov       eax,dword ptr [$ibcnfcia]
	cmp       eax,-1
	je        short @842
	?debug L 1875
?live16440@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @840
	?debug L 1877
?live16440@48: ; 
@841:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@842:
	cmp       dword ptr [$afcnfcia+4],0
	jne       short @841
	cmp       dword ptr [$afcnfcia],0
	jne       short @841
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$afcnfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$afcnfcia+4],ecx
	jmp       short @845
@844:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@845:
	cmp       dword ptr [$afcnfcia+4],0
	jne       short @848
	cmp       dword ptr [$afcnfcia],0
@848:
	je        short @846
	mov       eax,dword ptr [$afcnfcia]
	mov       edx,dword ptr [$afcnfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @849
	cmp       eax,dword ptr [ebp-20]
@849:
	setne     al
	and       eax,1
	jmp       short @847
@846:
	xor       eax,eax
@847:
	test      al,al
	jne       short @844
	?debug L 1880
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
	?debug L 1882
	mov       eax,dword ptr [ebp-36]
	?debug L 1880
	add       esp,24
	?debug L 1882
	and       eax,134217728
	?debug L 1883
?live16440@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1882
?live16440@144: ; 
	mov       dword ptr [$ibcnfcia],eax
	?debug L 1883
?live16440@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1884
?live16440@176: ; EAX = ret
	mov       dword ptr [$afcnfcia],0
	mov       dword ptr [$afcnfcia+4],0
	?debug L 1883
?live16440@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1886
?live16440@208: ; 
@850:
@840:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@837:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_ss$qv+0
	dd        @837+0
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
	dd	?patch264
	dd	?patch265
	dd	?patch266
	df	@@stk@cpu@cpu_has_ss$qv
	dw	0
	dw	4210
	dw	0
	dw	471
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
	dw	472
	dw	0
	dw	0
	dw	0
	dw	?patch267
	dw	529
	dw	?patch268
	dd	?live16440@176-@@stk@cpu@cpu_has_ss$qv
	dd	?live16440@192-?live16440@176
	dw	1
?patch268	equ	1
?patch267	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	473
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	474
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	475
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	476
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$afcnfcia
	dw	0
	dw	4100
	dw	0
	dw	477
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	478
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ibcnfcia
	dw	0
	dw	117
	dw	0
	dw	479
	dw	0
	dw	0
	dw	0
?patch264	equ	@850-@@stk@cpu@cpu_has_ss$qv+71
?patch265	equ	0
?patch266	equ	@850-@@stk@cpu@cpu_has_ss$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iicnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$amcnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_mtrr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mtrr$qv	proc	near
?live16441@0:
	?debug L 1889
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @851
	?debug L 1895
@852:
	mov       eax,dword ptr [$iicnfcia]
	cmp       eax,-1
	je        short @856
	?debug L 1896
?live16441@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @854
	?debug L 1898
?live16441@48: ; 
@855:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@856:
	cmp       dword ptr [$amcnfcia+4],0
	jne       short @855
	cmp       dword ptr [$amcnfcia],0
	jne       short @855
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$amcnfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$amcnfcia+4],ecx
	jmp       short @859
@858:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@859:
	cmp       dword ptr [$amcnfcia+4],0
	jne       short @862
	cmp       dword ptr [$amcnfcia],0
@862:
	je        short @860
	mov       eax,dword ptr [$amcnfcia]
	mov       edx,dword ptr [$amcnfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @863
	cmp       eax,dword ptr [ebp-20]
@863:
	setne     al
	and       eax,1
	jmp       short @861
@860:
	xor       eax,eax
@861:
	test      al,al
	jne       short @858
	?debug L 1901
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
	?debug L 1903
	mov       eax,dword ptr [ebp-36]
	?debug L 1901
	add       esp,24
	?debug L 1903
	and       eax,4096
	?debug L 1904
?live16441@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1903
?live16441@144: ; 
	mov       dword ptr [$iicnfcia],eax
	?debug L 1904
?live16441@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1905
?live16441@176: ; EAX = ret
	mov       dword ptr [$amcnfcia],0
	mov       dword ptr [$amcnfcia+4],0
	?debug L 1904
?live16441@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1907
?live16441@208: ; 
@864:
@854:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@851:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_mtrr$qv+0
	dd        @851+0
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
	dd	?patch269
	dd	?patch270
	dd	?patch271
	df	@@stk@cpu@cpu_has_mtrr$qv
	dw	0
	dw	4212
	dw	0
	dw	480
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
	dw	481
	dw	0
	dw	0
	dw	0
	dw	?patch272
	dw	529
	dw	?patch273
	dd	?live16441@176-@@stk@cpu@cpu_has_mtrr$qv
	dd	?live16441@192-?live16441@176
	dw	1
?patch273	equ	1
?patch272	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	482
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	483
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	484
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	485
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$amcnfcia
	dw	0
	dw	4100
	dw	0
	dw	486
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	487
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iicnfcia
	dw	0
	dw	117
	dw	0
	dw	488
	dw	0
	dw	0
	dw	0
?patch269	equ	@864-@@stk@cpu@cpu_has_mtrr$qv+71
?patch270	equ	0
?patch271	equ	@864-@@stk@cpu@cpu_has_mtrr$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ipcnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$addnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_msr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_msr$qv	proc	near
?live16442@0:
	?debug L 1910
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @865
	?debug L 1916
@866:
	mov       eax,dword ptr [$ipcnfcia]
	cmp       eax,-1
	je        short @870
	?debug L 1917
?live16442@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @868
	?debug L 1919
?live16442@48: ; 
@869:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@870:
	cmp       dword ptr [$addnfcia+4],0
	jne       short @869
	cmp       dword ptr [$addnfcia],0
	jne       short @869
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$addnfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$addnfcia+4],ecx
	jmp       short @873
@872:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@873:
	cmp       dword ptr [$addnfcia+4],0
	jne       short @876
	cmp       dword ptr [$addnfcia],0
@876:
	je        short @874
	mov       eax,dword ptr [$addnfcia]
	mov       edx,dword ptr [$addnfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @877
	cmp       eax,dword ptr [ebp-20]
@877:
	setne     al
	and       eax,1
	jmp       short @875
@874:
	xor       eax,eax
@875:
	test      al,al
	jne       short @872
	?debug L 1922
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
	?debug L 1924
	mov       eax,dword ptr [ebp-36]
	?debug L 1922
	add       esp,24
	?debug L 1924
	and       eax,4096
	?debug L 1925
?live16442@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1924
?live16442@144: ; 
	mov       dword ptr [$ipcnfcia],eax
	?debug L 1925
?live16442@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1926
?live16442@176: ; EAX = ret
	mov       dword ptr [$addnfcia],0
	mov       dword ptr [$addnfcia+4],0
	?debug L 1925
?live16442@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1928
?live16442@208: ; 
@878:
@868:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@865:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_msr$qv+0
	dd        @865+0
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
	dd	?patch274
	dd	?patch275
	dd	?patch276
	df	@@stk@cpu@cpu_has_msr$qv
	dw	0
	dw	4214
	dw	0
	dw	489
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
	dw	490
	dw	0
	dw	0
	dw	0
	dw	?patch277
	dw	529
	dw	?patch278
	dd	?live16442@176-@@stk@cpu@cpu_has_msr$qv
	dd	?live16442@192-?live16442@176
	dw	1
?patch278	equ	1
?patch277	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	491
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	492
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	493
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	494
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$addnfcia
	dw	0
	dw	4100
	dw	0
	dw	495
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	496
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ipcnfcia
	dw	0
	dw	117
	dw	0
	dw	497
	dw	0
	dw	0
	dw	0
?patch274	equ	@878-@@stk@cpu@cpu_has_msr$qv+71
?patch275	equ	0
?patch276	equ	@878-@@stk@cpu@cpu_has_msr$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$igdnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$akdnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_tsc$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_tsc$qv	proc	near
?live16443@0:
	?debug L 1931
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @879
	?debug L 1937
@880:
	mov       eax,dword ptr [$igdnfcia]
	cmp       eax,-1
	je        short @884
	?debug L 1938
?live16443@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @882
	?debug L 1940
?live16443@48: ; 
@883:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@884:
	cmp       dword ptr [$akdnfcia+4],0
	jne       short @883
	cmp       dword ptr [$akdnfcia],0
	jne       short @883
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$akdnfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$akdnfcia+4],ecx
	jmp       short @887
@886:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@887:
	cmp       dword ptr [$akdnfcia+4],0
	jne       short @890
	cmp       dword ptr [$akdnfcia],0
@890:
	je        short @888
	mov       eax,dword ptr [$akdnfcia]
	mov       edx,dword ptr [$akdnfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @891
	cmp       eax,dword ptr [ebp-20]
@891:
	setne     al
	and       eax,1
	jmp       short @889
@888:
	xor       eax,eax
@889:
	test      al,al
	jne       short @886
	?debug L 1943
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
	?debug L 1945
	mov       eax,dword ptr [ebp-28]
	?debug L 1943
	add       esp,24
	?debug L 1945
	and       eax,16
	?debug L 1946
?live16443@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1945
?live16443@144: ; 
	mov       dword ptr [$igdnfcia],eax
	?debug L 1946
?live16443@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1947
?live16443@176: ; EAX = ret
	mov       dword ptr [$akdnfcia],0
	mov       dword ptr [$akdnfcia+4],0
	?debug L 1946
?live16443@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1949
?live16443@208: ; 
@892:
@882:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@879:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_tsc$qv+0
	dd        @879+0
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
	dd	?patch279
	dd	?patch280
	dd	?patch281
	df	@@stk@cpu@cpu_has_tsc$qv
	dw	0
	dw	4216
	dw	0
	dw	498
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
	dw	499
	dw	0
	dw	0
	dw	0
	dw	?patch282
	dw	529
	dw	?patch283
	dd	?live16443@176-@@stk@cpu@cpu_has_tsc$qv
	dd	?live16443@192-?live16443@176
	dw	1
?patch283	equ	1
?patch282	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	500
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	501
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	502
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	503
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$akdnfcia
	dw	0
	dw	4100
	dw	0
	dw	504
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	505
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$igdnfcia
	dw	0
	dw	117
	dw	0
	dw	506
	dw	0
	dw	0
	dw	0
?patch279	equ	@892-@@stk@cpu@cpu_has_tsc$qv+73
?patch280	equ	0
?patch281	equ	@892-@@stk@cpu@cpu_has_tsc$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$indnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$abenfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_psn$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_psn$qv	proc	near
?live16444@0:
	?debug L 1952
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @893
	?debug L 1958
@894:
	mov       eax,dword ptr [$indnfcia]
	cmp       eax,-1
	je        short @898
	?debug L 1959
?live16444@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @896
	?debug L 1961
?live16444@48: ; 
@897:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@898:
	cmp       dword ptr [$abenfcia+4],0
	jne       short @897
	cmp       dword ptr [$abenfcia],0
	jne       short @897
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$abenfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$abenfcia+4],ecx
	jmp       short @901
@900:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@901:
	cmp       dword ptr [$abenfcia+4],0
	jne       short @904
	cmp       dword ptr [$abenfcia],0
@904:
	je        short @902
	mov       eax,dword ptr [$abenfcia]
	mov       edx,dword ptr [$abenfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @905
	cmp       eax,dword ptr [ebp-20]
@905:
	setne     al
	and       eax,1
	jmp       short @903
@902:
	xor       eax,eax
@903:
	test      al,al
	jne       short @900
	?debug L 1964
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
	?debug L 1966
	mov       eax,dword ptr [ebp-28]
	?debug L 1964
	add       esp,24
	?debug L 1966
	and       eax,262144
	?debug L 1967
?live16444@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1966
?live16444@144: ; 
	mov       dword ptr [$indnfcia],eax
	?debug L 1967
?live16444@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1968
?live16444@176: ; EAX = ret
	mov       dword ptr [$abenfcia],0
	mov       dword ptr [$abenfcia+4],0
	?debug L 1967
?live16444@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1970
?live16444@208: ; 
@906:
@896:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@893:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_psn$qv+0
	dd        @893+0
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
	dd	?patch284
	dd	?patch285
	dd	?patch286
	df	@@stk@cpu@cpu_has_psn$qv
	dw	0
	dw	4218
	dw	0
	dw	507
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
	dw	508
	dw	0
	dw	0
	dw	0
	dw	?patch287
	dw	529
	dw	?patch288
	dd	?live16444@176-@@stk@cpu@cpu_has_psn$qv
	dd	?live16444@192-?live16444@176
	dw	1
?patch288	equ	1
?patch287	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	509
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	510
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	511
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	512
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$abenfcia
	dw	0
	dw	4100
	dw	0
	dw	513
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	514
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$indnfcia
	dw	0
	dw	117
	dw	0
	dw	515
	dw	0
	dw	0
	dw	0
?patch284	equ	@906-@@stk@cpu@cpu_has_psn$qv+71
?patch285	equ	0
?patch286	equ	@906-@@stk@cpu@cpu_has_psn$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ieenfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aienfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_xsave$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_xsave$qv	proc	near
?live16445@0:
	?debug L 1973
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @907
	?debug L 1979
@908:
	mov       eax,dword ptr [$ieenfcia]
	cmp       eax,-1
	je        short @912
	?debug L 1980
?live16445@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @910
	?debug L 1982
?live16445@48: ; 
@911:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@912:
	cmp       dword ptr [$aienfcia+4],0
	jne       short @911
	cmp       dword ptr [$aienfcia],0
	jne       short @911
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$aienfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$aienfcia+4],ecx
	jmp       short @915
@914:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@915:
	cmp       dword ptr [$aienfcia+4],0
	jne       short @918
	cmp       dword ptr [$aienfcia],0
@918:
	je        short @916
	mov       eax,dword ptr [$aienfcia]
	mov       edx,dword ptr [$aienfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @919
	cmp       eax,dword ptr [ebp-20]
@919:
	setne     al
	and       eax,1
	jmp       short @917
@916:
	xor       eax,eax
@917:
	test      al,al
	jne       short @914
	?debug L 1985
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
	?debug L 1987
	mov       eax,dword ptr [ebp-36]
	mov       edx,dword ptr [ebp-36]
	and       edx,134217728
	and       eax,67108864
	shr       edx,27
	?debug L 1985
	add       esp,24
	?debug L 1987
	shr       eax,26
	and       eax,edx
	?debug L 1988
?live16445@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1987
?live16445@144: ; 
	mov       dword ptr [$ieenfcia],eax
	?debug L 1988
?live16445@160: ; EAX = @temp3
	setne     cl
	and       ecx,1
	?debug L 1989
?live16445@176: ; EAX = ret
	mov       dword ptr [$aienfcia],0
	mov       dword ptr [$aienfcia+4],0
	?debug L 1988
?live16445@192: ; EAX = @temp3
	mov       eax,ecx
	?debug L 1991
?live16445@208: ; 
@920:
@910:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@907:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_xsave$qv+0
	dd        @907+0
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
	dd	?patch289
	dd	?patch290
	dd	?patch291
	df	@@stk@cpu@cpu_has_xsave$qv
	dw	0
	dw	4220
	dw	0
	dw	516
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
	dw	517
	dw	0
	dw	0
	dw	0
	dw	?patch292
	dw	529
	dw	?patch293
	dd	?live16445@176-@@stk@cpu@cpu_has_xsave$qv
	dd	?live16445@192-?live16445@176
	dw	1
?patch293	equ	1
?patch292	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	518
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	519
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	520
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	521
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aienfcia
	dw	0
	dw	4100
	dw	0
	dw	522
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	523
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ieenfcia
	dw	0
	dw	117
	dw	0
	dw	524
	dw	0
	dw	0
	dw	0
?patch289	equ	@920-@@stk@cpu@cpu_has_xsave$qv+74
?patch290	equ	0
?patch291	equ	@920-@@stk@cpu@cpu_has_xsave$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ilenfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$apenfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_clmul$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_clmul$qv	proc	near
?live16446@0:
	?debug L 1994
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @921
	?debug L 2000
@922:
	mov       eax,dword ptr [$ilenfcia]
	cmp       eax,-1
	je        short @926
	?debug L 2001
?live16446@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @924
	?debug L 2003
?live16446@48: ; 
@925:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@926:
	cmp       dword ptr [$apenfcia+4],0
	jne       short @925
	cmp       dword ptr [$apenfcia],0
	jne       short @925
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$apenfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$apenfcia+4],ecx
	jmp       short @929
@928:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@929:
	cmp       dword ptr [$apenfcia+4],0
	jne       short @932
	cmp       dword ptr [$apenfcia],0
@932:
	je        short @930
	mov       eax,dword ptr [$apenfcia]
	mov       edx,dword ptr [$apenfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @933
	cmp       eax,dword ptr [ebp-20]
@933:
	setne     al
	and       eax,1
	jmp       short @931
@930:
	xor       eax,eax
@931:
	test      al,al
	jne       short @928
	?debug L 2006
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
	?debug L 2008
	mov       eax,dword ptr [ebp-36]
	?debug L 2006
	add       esp,24
	?debug L 2008
	and       eax,4
	?debug L 2009
?live16446@128: ; EAX = @temp3
	test      eax,eax
	?debug L 2008
?live16446@144: ; 
	mov       dword ptr [$ilenfcia],eax
	?debug L 2009
?live16446@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 2010
?live16446@176: ; EAX = ret
	mov       dword ptr [$apenfcia],0
	mov       dword ptr [$apenfcia+4],0
	?debug L 2009
?live16446@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 2012
?live16446@208: ; 
@934:
@924:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@921:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_clmul$qv+0
	dd        @921+0
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
	dd	?patch294
	dd	?patch295
	dd	?patch296
	df	@@stk@cpu@cpu_has_clmul$qv
	dw	0
	dw	4222
	dw	0
	dw	525
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
	dw	526
	dw	0
	dw	0
	dw	0
	dw	?patch297
	dw	529
	dw	?patch298
	dd	?live16446@176-@@stk@cpu@cpu_has_clmul$qv
	dd	?live16446@192-?live16446@176
	dw	1
?patch298	equ	1
?patch297	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	527
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	528
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	529
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	530
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$apenfcia
	dw	0
	dw	4100
	dw	0
	dw	531
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	532
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ilenfcia
	dw	0
	dw	117
	dw	0
	dw	533
	dw	0
	dw	0
	dw	0
?patch294	equ	@934-@@stk@cpu@cpu_has_clmul$qv+73
?patch295	equ	0
?patch296	equ	@934-@@stk@cpu@cpu_has_clmul$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$icfnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$agfnfcia	label	dword
	dd	0
	dd	0
	dd	0
	db	1	dup(?)
	align	4
$ijfnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_psn$qv	segment virtual
	align	2
@@stk@cpu@cpu_psn$qv	proc	near
?live16447@0:
	?debug L 2015
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @935
	?debug L 2022
@936:
	mov       eax,dword ptr [$icfnfcia]
	cmp       eax,-1
	je        short @940
	?debug L 2023
	mov       eax,offset $agfnfcia
	jmp       @938
	?debug L 2025
@939:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@940:
	cmp       dword ptr [$ijfnfcia+4],0
	jne       short @939
	cmp       dword ptr [$ijfnfcia],0
	jne       short @939
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$ijfnfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$ijfnfcia+4],edx
	jmp       short @943
@942:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@943:
	cmp       dword ptr [$ijfnfcia+4],0
	jne       short @946
	cmp       dword ptr [$ijfnfcia],0
@946:
	je        short @944
	mov       eax,dword ptr [$ijfnfcia]
	mov       edx,dword ptr [$ijfnfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @947
	cmp       eax,dword ptr [ebp-20]
@947:
	setne     cl
	and       ecx,1
	jmp       short @945
@944:
	xor       ecx,ecx
@945:
	test      cl,cl
	jne       short @942
	?debug L 2027
	xor       eax,eax
	mov       dword ptr [$agfnfcia],eax
	?debug L 2028
	xor       edx,edx
	mov       dword ptr [$agfnfcia+4],edx
	?debug L 2029
	xor       eax,eax
	mov       dword ptr [$agfnfcia+8],eax
	?debug L 2030
	call      @@stk@cpu@cpu_has_psn$qv
	test      al,al
	jne       short @948
	?debug L 2031
	mov       dword ptr [$ijfnfcia],0
	mov       dword ptr [$ijfnfcia+4],0
	?debug L 2032
	mov       eax,offset $agfnfcia
	jmp       short @938
	?debug L 2036
@948:
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
	?debug L 2038
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [$agfnfcia+8],ecx
	?debug L 2039
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [$agfnfcia+4],eax
	?debug L 2040
	mov       edx,dword ptr [ebp-36]
	mov       dword ptr [$agfnfcia],edx
	?debug L 2041
	mov       dword ptr [$ijfnfcia],0
	mov       dword ptr [$ijfnfcia+4],0
	?debug L 2042
	mov       eax,offset $agfnfcia
	?debug L 2043
@949:
@938:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@935:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_psn$qv+0
	dd        @935+0
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
	dd	?patch299
	dd	?patch300
	dd	?patch301
	df	@@stk@cpu@cpu_psn$qv
	dw	0
	dw	4224
	dw	0
	dw	534
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
	dw	535
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	536
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	537
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	538
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ijfnfcia
	dw	0
	dw	4100
	dw	0
	dw	539
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	540
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$agfnfcia
	dw	0
	dw	4226
	dw	0
	dw	541
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$icfnfcia
	dw	0
	dw	117
	dw	0
	dw	542
	dw	0
	dw	0
	dw	0
?patch299	equ	@949-@@stk@cpu@cpu_psn$qv+74
?patch300	equ	0
?patch301	equ	@949-@@stk@cpu@cpu_psn$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$anfnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$iagnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_fma$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_fma$qv	proc	near
?live16448@0:
	?debug L 2046
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @950
	?debug L 2052
@951:
	mov       eax,dword ptr [$anfnfcia]
	cmp       eax,-1
	jne       @953
	?debug L 2053
?live16448@32: ; EAX = @temp3
	jmp       short @955
	?debug L 2055
?live16448@48: ; 
@954:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@955:
	cmp       dword ptr [$iagnfcia+4],0
	jne       short @954
	cmp       dword ptr [$iagnfcia],0
	jne       short @954
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$iagnfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$iagnfcia+4],edx
	jmp       short @958
@957:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@958:
	cmp       dword ptr [$iagnfcia+4],0
	jne       short @961
	cmp       dword ptr [$iagnfcia],0
@961:
	je        short @959
	mov       eax,dword ptr [$iagnfcia]
	mov       edx,dword ptr [$iagnfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @962
	cmp       eax,dword ptr [ebp-20]
@962:
	setne     cl
	and       ecx,1
	jmp       short @960
@959:
	xor       ecx,ecx
@960:
	test      cl,cl
	jne       short @957
	?debug L 2058
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
	?debug L 2060
	test      byte ptr [ebp-35],16
	je        short @963
	?debug L 2061
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
	?debug L 2062
	test      byte ptr [ebp-34],1
	je        short @964
	?debug L 2063
	mov       dword ptr [$anfnfcia],4
	jmp       short @965
	?debug L 2065
@964:
	mov       dword ptr [$anfnfcia],3
	?debug L 2066
	jmp       short @965
	?debug L 2068
@963:
	xor       eax,eax
	mov       dword ptr [$anfnfcia],eax
	?debug L 2070
@965:
	mov       edx,dword ptr [$anfnfcia]
	?debug L 2071
?live16448@208: ; EAX = ret
	mov       dword ptr [$iagnfcia],0
	?debug L 2070
?live16448@224: ; 
	test      edx,edx
	?debug L 2071
?live16448@240: ; EAX = ret
	mov       dword ptr [$iagnfcia+4],0
	?debug L 2070
?live16448@256: ; 
	setne     al
	and       eax,1
	?debug L 2072
?live16448@272: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	mov       eax,edx
	?debug L 2073
?live16448@288: ; 
@966:
@953:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@950:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_fma$qv+0
	dd        @950+0
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
	dd	?patch302
	dd	?patch303
	dd	?patch304
	df	@@stk@cpu@cpu_has_fma$qv
	dw	0
	dw	4227
	dw	0
	dw	543
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
	dw	544
	dw	0
	dw	0
	dw	0
	dw	?patch305
	dw	529
	dw	?patch306
	dd	?live16448@208-@@stk@cpu@cpu_has_fma$qv
	dd	?live16448@224-?live16448@208
	dw	1
	dd	?live16448@240-@@stk@cpu@cpu_has_fma$qv
	dd	?live16448@256-?live16448@240
	dw	1
	dd	?live16448@272-@@stk@cpu@cpu_has_fma$qv
	dd	?live16448@288-?live16448@272
	dw	1
?patch306	equ	3
?patch305	equ	34
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	545
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	546
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	547
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	548
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iagnfcia
	dw	0
	dw	4100
	dw	0
	dw	549
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	550
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$anfnfcia
	dw	0
	dw	117
	dw	0
	dw	551
	dw	0
	dw	0
	dw	0
?patch302	equ	@966-@@stk@cpu@cpu_has_fma$qv+73
?patch303	equ	0
?patch304	equ	@966-@@stk@cpu@cpu_has_fma$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$aegnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ihgnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_aes$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_aes$qv	proc	near
?live16449@0:
	?debug L 2076
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @967
	?debug L 2082
@968:
	mov       eax,dword ptr [$aegnfcia]
	cmp       eax,-1
	je        short @972
	?debug L 2083
?live16449@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @970
	?debug L 2085
?live16449@48: ; 
@971:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@972:
	cmp       dword ptr [$ihgnfcia+4],0
	jne       short @971
	cmp       dword ptr [$ihgnfcia],0
	jne       short @971
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$ihgnfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$ihgnfcia+4],ecx
	jmp       short @975
@974:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@975:
	cmp       dword ptr [$ihgnfcia+4],0
	jne       short @978
	cmp       dword ptr [$ihgnfcia],0
@978:
	je        short @976
	mov       eax,dword ptr [$ihgnfcia]
	mov       edx,dword ptr [$ihgnfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @979
	cmp       eax,dword ptr [ebp-20]
@979:
	setne     al
	and       eax,1
	jmp       short @977
@976:
	xor       eax,eax
@977:
	test      al,al
	jne       short @974
	?debug L 2088
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
	?debug L 2090
	mov       eax,dword ptr [ebp-36]
	?debug L 2088
	add       esp,24
	?debug L 2090
	and       eax,33554432
	?debug L 2091
?live16449@128: ; EAX = @temp3
	test      eax,eax
	?debug L 2090
?live16449@144: ; 
	mov       dword ptr [$aegnfcia],eax
	?debug L 2091
?live16449@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 2092
?live16449@176: ; EAX = ret
	mov       dword ptr [$ihgnfcia],0
	mov       dword ptr [$ihgnfcia+4],0
	?debug L 2091
?live16449@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 2094
?live16449@208: ; 
@980:
@970:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@967:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_aes$qv+0
	dd        @967+0
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
	dd	?patch307
	dd	?patch308
	dd	?patch309
	df	@@stk@cpu@cpu_has_aes$qv
	dw	0
	dw	4229
	dw	0
	dw	552
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
	dw	553
	dw	0
	dw	0
	dw	0
	dw	?patch310
	dw	529
	dw	?patch311
	dd	?live16449@176-@@stk@cpu@cpu_has_aes$qv
	dd	?live16449@192-?live16449@176
	dw	1
?patch311	equ	1
?patch310	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	554
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	555
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	556
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	557
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ihgnfcia
	dw	0
	dw	4100
	dw	0
	dw	558
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	559
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aegnfcia
	dw	0
	dw	117
	dw	0
	dw	560
	dw	0
	dw	0
	dw	0
?patch307	equ	@980-@@stk@cpu@cpu_has_aes$qv+71
?patch308	equ	0
?patch309	equ	@980-@@stk@cpu@cpu_has_aes$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$algnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$iognfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viaaes$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viaaes$qv	proc	near
?live16450@0:
	?debug L 2097
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @981
	?debug L 2103
@982:
	mov       eax,dword ptr [$algnfcia]
	cmp       eax,-1
	je        short @986
	?debug L 2104
?live16450@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @984
	?debug L 2106
?live16450@48: ; 
@985:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@986:
	cmp       dword ptr [$iognfcia+4],0
	jne       short @985
	cmp       dword ptr [$iognfcia],0
	jne       short @985
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$iognfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$iognfcia+4],ecx
	jmp       short @989
@988:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@989:
	cmp       dword ptr [$iognfcia+4],0
	jne       short @992
	cmp       dword ptr [$iognfcia],0
@992:
	je        short @990
	mov       eax,dword ptr [$iognfcia]
	mov       edx,dword ptr [$iognfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @993
	cmp       eax,dword ptr [ebp-20]
@993:
	setne     al
	and       eax,1
	jmp       short @991
@990:
	xor       eax,eax
@991:
	test      al,al
	jne       short @988
	?debug L 2109
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
	?debug L 2111
	mov       eax,dword ptr [ebp-28]
	?debug L 2109
	add       esp,24
	?debug L 2111
	and       eax,128
	?debug L 2112
?live16450@128: ; EAX = @temp3
	test      eax,eax
	?debug L 2111
?live16450@144: ; 
	mov       dword ptr [$algnfcia],eax
	?debug L 2112
?live16450@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 2113
?live16450@176: ; EAX = ret
	mov       dword ptr [$iognfcia],0
	mov       dword ptr [$iognfcia+4],0
	?debug L 2112
?live16450@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 2115
?live16450@208: ; 
@994:
@984:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@981:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_viaaes$qv+0
	dd        @981+0
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
	dd	?patch312
	dd	?patch313
	dd	?patch314
	df	@@stk@cpu@cpu_has_viaaes$qv
	dw	0
	dw	4231
	dw	0
	dw	561
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
	dw	562
	dw	0
	dw	0
	dw	0
	dw	?patch315
	dw	529
	dw	?patch316
	dd	?live16450@176-@@stk@cpu@cpu_has_viaaes$qv
	dd	?live16450@192-?live16450@176
	dw	1
?patch316	equ	1
?patch315	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	563
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	564
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	565
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	566
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iognfcia
	dw	0
	dw	4100
	dw	0
	dw	567
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	568
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$algnfcia
	dw	0
	dw	117
	dw	0
	dw	569
	dw	0
	dw	0
	dw	0
?patch312	equ	@994-@@stk@cpu@cpu_has_viaaes$qv+72
?patch313	equ	0
?patch314	equ	@994-@@stk@cpu@cpu_has_viaaes$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$achnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ifhnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viarng$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viarng$qv	proc	near
?live16451@0:
	?debug L 2118
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @995
	?debug L 2124
@996:
	mov       eax,dword ptr [$achnfcia]
	cmp       eax,-1
	je        short @1000
	?debug L 2125
?live16451@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @998
	?debug L 2127
?live16451@48: ; 
@999:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1000:
	cmp       dword ptr [$ifhnfcia+4],0
	jne       short @999
	cmp       dword ptr [$ifhnfcia],0
	jne       short @999
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$ifhnfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$ifhnfcia+4],ecx
	jmp       short @1003
@1002:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1003:
	cmp       dword ptr [$ifhnfcia+4],0
	jne       short @1006
	cmp       dword ptr [$ifhnfcia],0
@1006:
	je        short @1004
	mov       eax,dword ptr [$ifhnfcia]
	mov       edx,dword ptr [$ifhnfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @1007
	cmp       eax,dword ptr [ebp-20]
@1007:
	setne     al
	and       eax,1
	jmp       short @1005
@1004:
	xor       eax,eax
@1005:
	test      al,al
	jne       short @1002
	?debug L 2130
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
	?debug L 2132
	mov       eax,dword ptr [ebp-28]
	?debug L 2130
	add       esp,24
	?debug L 2132
	and       eax,8
	?debug L 2133
?live16451@128: ; EAX = @temp3
	test      eax,eax
	?debug L 2132
?live16451@144: ; 
	mov       dword ptr [$achnfcia],eax
	?debug L 2133
?live16451@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 2134
?live16451@176: ; EAX = ret
	mov       dword ptr [$ifhnfcia],0
	mov       dword ptr [$ifhnfcia+4],0
	?debug L 2133
?live16451@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 2136
?live16451@208: ; 
@1008:
@998:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@995:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_viarng$qv+0
	dd        @995+0
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
	dd	?patch317
	dd	?patch318
	dd	?patch319
	df	@@stk@cpu@cpu_has_viarng$qv
	dw	0
	dw	4233
	dw	0
	dw	570
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
	dw	571
	dw	0
	dw	0
	dw	0
	dw	?patch320
	dw	529
	dw	?patch321
	dd	?live16451@176-@@stk@cpu@cpu_has_viarng$qv
	dd	?live16451@192-?live16451@176
	dw	1
?patch321	equ	1
?patch320	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	572
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	573
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	574
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	575
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ifhnfcia
	dw	0
	dw	4100
	dw	0
	dw	576
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	577
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$achnfcia
	dw	0
	dw	117
	dw	0
	dw	578
	dw	0
	dw	0
	dw	0
?patch317	equ	@1008-@@stk@cpu@cpu_has_viarng$qv+74
?patch318	equ	0
?patch319	equ	@1008-@@stk@cpu@cpu_has_viarng$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ajhnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$imhnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viahash$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viahash$qv	proc	near
?live16452@0:
	?debug L 2139
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @1009
	?debug L 2145
@1010:
	mov       eax,dword ptr [$ajhnfcia]
	cmp       eax,-1
	je        short @1014
	?debug L 2146
?live16452@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @1012
	?debug L 2148
?live16452@48: ; 
@1013:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1014:
	cmp       dword ptr [$imhnfcia+4],0
	jne       short @1013
	cmp       dword ptr [$imhnfcia],0
	jne       short @1013
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$imhnfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$imhnfcia+4],ecx
	jmp       short @1017
@1016:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1017:
	cmp       dword ptr [$imhnfcia+4],0
	jne       short @1020
	cmp       dword ptr [$imhnfcia],0
@1020:
	je        short @1018
	mov       eax,dword ptr [$imhnfcia]
	mov       edx,dword ptr [$imhnfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @1021
	cmp       eax,dword ptr [ebp-20]
@1021:
	setne     al
	and       eax,1
	jmp       short @1019
@1018:
	xor       eax,eax
@1019:
	test      al,al
	jne       short @1016
	?debug L 2151
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
	?debug L 2153
	mov       eax,dword ptr [ebp-28]
	?debug L 2151
	add       esp,24
	?debug L 2153
	and       eax,2048
	?debug L 2154
?live16452@128: ; EAX = @temp3
	test      eax,eax
	?debug L 2153
?live16452@144: ; 
	mov       dword ptr [$ajhnfcia],eax
	?debug L 2154
?live16452@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 2155
?live16452@176: ; EAX = ret
	mov       dword ptr [$imhnfcia],0
	mov       dword ptr [$imhnfcia+4],0
	?debug L 2154
?live16452@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 2157
?live16452@208: ; 
@1022:
@1012:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1009:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_viahash$qv+0
	dd        @1009+0
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
	dd	?patch322
	dd	?patch323
	dd	?patch324
	df	@@stk@cpu@cpu_has_viahash$qv
	dw	0
	dw	4235
	dw	0
	dw	579
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
	dw	580
	dw	0
	dw	0
	dw	0
	dw	?patch325
	dw	529
	dw	?patch326
	dd	?live16452@176-@@stk@cpu@cpu_has_viahash$qv
	dd	?live16452@192-?live16452@176
	dw	1
?patch326	equ	1
?patch325	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	581
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	582
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	583
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	584
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$imhnfcia
	dw	0
	dw	4100
	dw	0
	dw	585
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	586
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ajhnfcia
	dw	0
	dw	117
	dw	0
	dw	587
	dw	0
	dw	0
	dw	0
?patch322	equ	@1022-@@stk@cpu@cpu_has_viahash$qv+72
?patch323	equ	0
?patch324	equ	@1022-@@stk@cpu@cpu_has_viahash$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$aainfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$idinfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_rdseed$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_rdseed$qv	proc	near
?live16453@0:
	?debug L 2160
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @1023
	?debug L 2166
@1024:
	mov       eax,dword ptr [$aainfcia]
	cmp       eax,-1
	je        short @1028
	?debug L 2167
?live16453@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @1026
	?debug L 2169
?live16453@48: ; 
@1027:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1028:
	cmp       dword ptr [$idinfcia+4],0
	jne       short @1027
	cmp       dword ptr [$idinfcia],0
	jne       short @1027
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$idinfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$idinfcia+4],ecx
	jmp       short @1031
@1030:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1031:
	cmp       dword ptr [$idinfcia+4],0
	jne       short @1034
	cmp       dword ptr [$idinfcia],0
@1034:
	je        short @1032
	mov       eax,dword ptr [$idinfcia]
	mov       edx,dword ptr [$idinfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @1035
	cmp       eax,dword ptr [ebp-20]
@1035:
	setne     al
	and       eax,1
	jmp       short @1033
@1032:
	xor       eax,eax
@1033:
	test      al,al
	jne       short @1030
	?debug L 2172
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
	?debug L 2174
	mov       eax,dword ptr [ebp-44]
	?debug L 2172
	add       esp,24
	?debug L 2174
	and       eax,262144
	?debug L 2175
?live16453@128: ; EAX = @temp3
	test      eax,eax
	?debug L 2174
?live16453@144: ; 
	mov       dword ptr [$aainfcia],eax
	?debug L 2175
?live16453@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 2176
?live16453@176: ; EAX = ret
	mov       dword ptr [$idinfcia],0
	mov       dword ptr [$idinfcia+4],0
	?debug L 2175
?live16453@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 2178
?live16453@208: ; 
@1036:
@1026:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1023:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_rdseed$qv+0
	dd        @1023+0
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
	dd	?patch327
	dd	?patch328
	dd	?patch329
	df	@@stk@cpu@cpu_has_rdseed$qv
	dw	0
	dw	4237
	dw	0
	dw	588
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
	dw	589
	dw	0
	dw	0
	dw	0
	dw	?patch330
	dw	529
	dw	?patch331
	dd	?live16453@176-@@stk@cpu@cpu_has_rdseed$qv
	dd	?live16453@192-?live16453@176
	dw	1
?patch331	equ	1
?patch330	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	590
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	591
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	592
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	593
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$idinfcia
	dw	0
	dw	4100
	dw	0
	dw	594
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	595
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aainfcia
	dw	0
	dw	117
	dw	0
	dw	596
	dw	0
	dw	0
	dw	0
?patch327	equ	@1036-@@stk@cpu@cpu_has_rdseed$qv+71
?patch328	equ	0
?patch329	equ	@1036-@@stk@cpu@cpu_has_rdseed$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ahinfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ikinfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_rdrand$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_rdrand$qv	proc	near
?live16454@0:
	?debug L 2181
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @1037
	?debug L 2187
@1038:
	mov       eax,dword ptr [$ahinfcia]
	cmp       eax,-1
	je        short @1042
	?debug L 2188
?live16454@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @1040
	?debug L 2190
?live16454@48: ; 
@1041:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1042:
	cmp       dword ptr [$ikinfcia+4],0
	jne       short @1041
	cmp       dword ptr [$ikinfcia],0
	jne       short @1041
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$ikinfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$ikinfcia+4],ecx
	jmp       short @1045
@1044:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1045:
	cmp       dword ptr [$ikinfcia+4],0
	jne       short @1048
	cmp       dword ptr [$ikinfcia],0
@1048:
	je        short @1046
	mov       eax,dword ptr [$ikinfcia]
	mov       edx,dword ptr [$ikinfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @1049
	cmp       eax,dword ptr [ebp-20]
@1049:
	setne     al
	and       eax,1
	jmp       short @1047
@1046:
	xor       eax,eax
@1047:
	test      al,al
	jne       short @1044
	?debug L 2193
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
	?debug L 2195
	mov       eax,dword ptr [ebp-36]
	?debug L 2193
	add       esp,24
	?debug L 2195
	and       eax,1073741824
	?debug L 2196
?live16454@128: ; EAX = @temp3
	test      eax,eax
	?debug L 2195
?live16454@144: ; 
	mov       dword ptr [$ahinfcia],eax
	?debug L 2196
?live16454@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 2197
?live16454@176: ; EAX = ret
	mov       dword ptr [$ikinfcia],0
	mov       dword ptr [$ikinfcia+4],0
	?debug L 2196
?live16454@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 2199
?live16454@208: ; 
@1050:
@1040:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1037:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_rdrand$qv+0
	dd        @1037+0
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
	dd	?patch332
	dd	?patch333
	dd	?patch334
	df	@@stk@cpu@cpu_has_rdrand$qv
	dw	0
	dw	4239
	dw	0
	dw	597
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
	dw	598
	dw	0
	dw	0
	dw	0
	dw	?patch335
	dw	529
	dw	?patch336
	dd	?live16454@176-@@stk@cpu@cpu_has_rdrand$qv
	dd	?live16454@192-?live16454@176
	dw	1
?patch336	equ	1
?patch335	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	599
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	600
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	601
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	602
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ikinfcia
	dw	0
	dw	4100
	dw	0
	dw	603
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	604
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ahinfcia
	dw	0
	dw	117
	dw	0
	dw	605
	dw	0
	dw	0
	dw	0
?patch332	equ	@1050-@@stk@cpu@cpu_has_rdrand$qv+71
?patch333	equ	0
?patch334	equ	@1050-@@stk@cpu@cpu_has_rdrand$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_print_info$qv	segment virtual
	align	2
@@stk@cpu@cpu_print_info$qv	proc	near
?live16455@0:
	?debug L 2208
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @1051
	?debug L 2214
@1052:
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	push      offset s@+39
	call      @@stk@con@prints$qpxce
	add       esp,8
	?debug L 2215
	call      @@stk@cpu@cpu_name$qv
	push      eax
	push      offset s@+52
	call      @@stk@con@prints$qpxce
	add       esp,8
	?debug L 2216
	push      1
	call      @@stk@cpu@cpu_num_mhz$qo
	pop       ecx
	push      eax
	push      offset s@+73
	call      @@stk@con@prints$qpxce
	add       esp,8
	?debug L 2217
	push      0
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1053
	push      offset s@+125
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1054
@1053:
	push      offset s@+125
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2218
@1054:
	push      0
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1055
	push      offset s@+164
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1056
@1055:
	push      offset s@+164
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2219
@1056:
	push      offset s@+197
	call      @@stk@con@prints$qpxce
	pop       ecx
	?debug L 2220
	push      1
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1057
	push      offset s@+239
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1058
@1057:
	push      offset s@+239
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2221
@1058:
	push      1
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1059
	push      offset s@+267
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1060
@1059:
	push      offset s@+267
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2222
@1060:
	push      2
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1061
	push      offset s@+300
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1062
@1061:
	push      offset s@+300
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2223
@1062:
	push      2
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1063
	push      offset s@+328
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1064
@1063:
	push      offset s@+328
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2224
@1064:
	push      3
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1065
	push      offset s@+361
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1066
@1065:
	push      offset s@+361
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2225
@1066:
	push      3
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1067
	push      offset s@+389
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1068
@1067:
	push      offset s@+389
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2226
@1068:
	call      @@stk@cpu@cpu_num_cores$qv
	test      eax,eax
	je        short @1069
	push      offset s@+422
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1070
@1069:
	push      offset s@+422
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2227
@1070:
	call      @@stk@cpu@cpu_num_threads$qv
	test      eax,eax
	je        short @1071
	push      offset s@+448
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1072
@1071:
	push      offset s@+448
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2229
@1072:
	call      @@stk@cpu@cpu_has_amd64$qv
	and       eax,255
	test      eax,eax
	je        short @1073
	push      offset s@+476
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1074
@1073:
	push      offset s@+476
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2230
@1074:
	call      @@stk@cpu@cpu_has_ht$qv
	and       eax,255
	test      eax,eax
	je        short @1075
	push      offset s@+502
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1076
@1075:
	push      offset s@+502
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2231
@1076:
	call      @@stk@cpu@cpu_has_mmx$qv
	and       eax,255
	test      eax,eax
	je        short @1077
	push      offset s@+525
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1078
@1077:
	push      offset s@+525
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2232
@1078:
	call      @@stk@cpu@cpu_has_mmxext$qv
	and       eax,255
	test      eax,eax
	je        short @1079
	push      offset s@+549
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1080
@1079:
	push      offset s@+549
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2233
@1080:
	call      @@stk@cpu@cpu_has_3dnow$qv
	test      eax,eax
	je        short @1081
	push      offset s@+576
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1082
@1081:
	push      offset s@+576
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2234
@1082:
	call      @@stk@cpu@cpu_has_3dnowprefetch$qv
	and       eax,255
	test      eax,eax
	je        short @1083
	push      offset s@+602
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1084
@1083:
	push      offset s@+602
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2235
@1084:
	call      @@stk@cpu@cpu_has_fxsr$qv
	and       eax,255
	test      eax,eax
	je        short @1085
	push      offset s@+636
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1086
@1085:
	push      offset s@+636
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2236
@1086:
	call      @@stk@cpu@cpu_has_sse$qv
	test      eax,eax
	je        short @1087
	push      offset s@+661
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1088
@1087:
	push      offset s@+661
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2237
@1088:
	call      @@stk@cpu@cpu_has_xsave$qv
	and       eax,255
	test      eax,eax
	je        short @1089
	push      offset s@+685
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1090
@1089:
	push      offset s@+685
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2238
@1090:
	call      @@stk@cpu@cpu_has_pclmulqdq$qv
	and       eax,255
	test      eax,eax
	je        short @1091
	push      offset s@+711
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1092
@1091:
	push      offset s@+711
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2239
@1092:
	call      @@stk@cpu@cpu_has_movbe$qv
	and       eax,255
	test      eax,eax
	je        short @1093
	push      offset s@+741
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1094
@1093:
	push      offset s@+741
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2240
@1094:
	call      @@stk@cpu@cpu_has_fma$qv
	test      eax,eax
	je        short @1095
	push      offset s@+767
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1096
@1095:
	push      offset s@+767
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2241
@1096:
	call      @@stk@cpu@cpu_has_popcnt$qv
	and       eax,255
	test      eax,eax
	je        short @1097
	push      offset s@+791
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1098
@1097:
	push      offset s@+791
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2242
@1098:
	call      @@stk@cpu@cpu_has_xop$qv
	and       eax,255
	test      eax,eax
	je        short @1099
	push      offset s@+818
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1100
@1099:
	push      offset s@+818
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2243
@1100:
	call      @@stk@cpu@cpu_has_lzcnt$qv
	and       eax,255
	test      eax,eax
	je        short @1101
	push      offset s@+842
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1102
@1101:
	push      offset s@+842
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2244
@1102:
	call      @@stk@cpu@cpu_has_f16c$qv
	and       eax,255
	test      eax,eax
	je        short @1103
	push      offset s@+868
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1104
@1103:
	push      offset s@+868
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2245
@1104:
	call      @@stk@cpu@cpu_has_avx$qv
	test      eax,eax
	je        short @1105
	push      offset s@+893
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1106
@1105:
	push      offset s@+893
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2246
@1106:
	call      @@stk@cpu@cpu_has_avx512f$qv
	and       eax,255
	test      eax,eax
	je        short @1107
	push      offset s@+917
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1108
@1107:
	push      offset s@+917
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2247
@1108:
	call      @@stk@cpu@cpu_has_avx512bw$qv
	and       eax,255
	test      eax,eax
	je        short @1109
	push      offset s@+945
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1110
@1109:
	push      offset s@+945
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2248
@1110:
	call      @@stk@cpu@cpu_has_avx512cd$qv
	and       eax,255
	test      eax,eax
	je        short @1111
	push      offset s@+974
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1112
@1111:
	push      offset s@+974
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2249
@1112:
	call      @@stk@cpu@cpu_has_avx512dq$qv
	and       eax,255
	test      eax,eax
	je        short @1113
	push      offset s@+1003
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1114
@1113:
	push      offset s@+1003
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2250
@1114:
	call      @@stk@cpu@cpu_has_avx512er$qv
	and       eax,255
	test      eax,eax
	je        short @1115
	push      offset s@+1032
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1116
@1115:
	push      offset s@+1032
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2251
@1116:
	call      @@stk@cpu@cpu_has_avx512pf$qv
	and       eax,255
	test      eax,eax
	je        short @1117
	push      offset s@+1061
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1118
@1117:
	push      offset s@+1061
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2252
@1118:
	call      @@stk@cpu@cpu_has_avx512vl$qv
	and       eax,255
	test      eax,eax
	je        short @1119
	push      offset s@+1090
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1120
@1119:
	push      offset s@+1090
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2253
@1120:
	call      @@stk@cpu@cpu_has_avx512ifma$qv
	and       eax,255
	test      eax,eax
	je        short @1121
	push      offset s@+1119
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1122
@1121:
	push      offset s@+1119
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2254
@1122:
	call      @@stk@cpu@cpu_has_bmi$qv
	test      eax,eax
	je        short @1123
	push      offset s@+1150
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1124
@1123:
	push      offset s@+1150
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2255
@1124:
	call      @@stk@cpu@cpu_has_avx512vbmi$qv
	and       eax,255
	test      eax,eax
	je        short @1125
	push      offset s@+1174
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1126
@1125:
	push      offset s@+1174
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2256
@1126:
	call      @@stk@cpu@cpu_has_cmov$qv
	and       eax,255
	test      eax,eax
	je        short @1127
	push      offset s@+1205
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1128
@1127:
	push      offset s@+1205
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2257
@1128:
	call      @@stk@cpu@cpu_has_cmpxchg$qv
	test      eax,eax
	je        short @1129
	push      offset s@+1230
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1130
@1129:
	push      offset s@+1230
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2258
@1130:
	call      @@stk@cpu@cpu_has_clmul$qv
	and       eax,255
	test      eax,eax
	je        short @1131
	push      offset s@+1258
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1132
@1131:
	push      offset s@+1258
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2259
@1132:
	call      @@stk@cpu@cpu_has_aes$qv
	and       eax,255
	test      eax,eax
	je        short @1133
	push      offset s@+1284
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1134
@1133:
	push      offset s@+1284
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2260
@1134:
	call      @@stk@cpu@cpu_has_sha$qv
	and       eax,255
	test      eax,eax
	je        short @1135
	push      offset s@+1308
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1136
@1135:
	push      offset s@+1308
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2261
@1136:
	call      @@stk@cpu@cpu_has_rdrand$qv
	and       eax,255
	test      eax,eax
	je        short @1137
	push      offset s@+1332
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1138
@1137:
	push      offset s@+1332
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2262
@1138:
	call      @@stk@cpu@cpu_has_rdseed$qv
	and       eax,255
	test      eax,eax
	je        short @1139
	push      offset s@+1359
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1140
@1139:
	push      offset s@+1359
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2263
@1140:
	call      @@stk@cpu@cpu_has_tsc$qv
	and       eax,255
	test      eax,eax
	je        short @1141
	push      offset s@+1386
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1142
@1141:
	push      offset s@+1386
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2264
@1142:
	call      @@stk@cpu@cpu_has_perftsc$qv
	and       eax,255
	test      eax,eax
	je        short @1143
	push      offset s@+1410
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1144
@1143:
	push      offset s@+1410
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2265
@1144:
	call      @@stk@cpu@cpu_has_erms$qv
	and       eax,255
	test      eax,eax
	je        short @1145
	push      offset s@+1438
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1146
@1145:
	push      offset s@+1438
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2266
@1146:
	call      @@stk@cpu@cpu_has_msr$qv
	and       eax,255
	test      eax,eax
	je        short @1147
	push      offset s@+1463
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1148
@1147:
	push      offset s@+1463
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2267
@1148:
	call      @@stk@cpu@cpu_has_mtrr$qv
	and       eax,255
	test      eax,eax
	je        short @1149
	push      offset s@+1487
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1150
@1149:
	push      offset s@+1487
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2268
@1150:
	call      @@stk@cpu@cpu_has_vmx$qv
	and       eax,255
	test      eax,eax
	je        short @1151
	push      offset s@+1512
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1152
@1151:
	push      offset s@+1512
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2270
@1152:
@1153:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@1051:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_print_info$qv+0
	dd        @1051+0
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
	dd	?patch337
	dd	?patch338
	dd	?patch339
	df	@@stk@cpu@cpu_print_info$qv
	dw	0
	dw	4241
	dw	0
	dw	606
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
	dw	607
	dw	0
	dw	0
	dw	0
?patch337	equ	@1153-@@stk@cpu@cpu_print_info$qv+31
?patch338	equ	0
?patch339	equ	@1153-@@stk@cpu@cpu_print_info$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_test$qv	segment virtual
	align	2
@@stk@cpu@cpu_test$qv	proc	near
?live16456@0:
	?debug L 2273
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @1154
	?debug L 2278
@1155:
	call      @@stk@cpu@cpu_print_info$qv
	?debug L 2279
@1156:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@1154:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_test$qv+0
	dd        @1154+0
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
	dd	?patch340
	dd	?patch341
	dd	?patch342
	df	@@stk@cpu@cpu_test$qv
	dw	0
	dw	4243
	dw	0
	dw	608
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
?patch340	equ	@1156-@@stk@cpu@cpu_test$qv+31
?patch341	equ	0
?patch342	equ	@1156-@@stk@cpu@cpu_test$qv
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
	mov       dword ptr [ebp-8],offset @1157
@1158:
	call      @@stk@cpu@tsc_init$qv
	mov       dword ptr [_tsc_ADJ],eax
	mov       dword ptr [_tsc_ADJ+4],edx
	?debug L 0
@1159:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@1157:
	db        67,71,83,0
	dd        @_STCON0_$qv+0
	dd        @1157+0
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
	dd	?patch343
	dd	?patch344
	dd	?patch345
	df	@_STCON0_$qv
	dw	0
	dw	4245
	dw	0
	dw	609
	dw	0
	dw	0
	dw	0
?patch343	equ	@1159-@_STCON0_$qv+31
?patch344	equ	0
?patch345	equ	@1159-@_STCON0_$qv
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
	dd	$icklfcia
	dd	8
	dd	4
	dd	$agklfcia
	dd	8
	dd	4
	dd	$ijklfcia
	dd	8
	dd	4
	dd	$anklfcia
	dd	8
	dd	4
	dd	$iallfcia
	dd	8
	dd	4
	dd	$aellfcia
	dd	8
	dd	4
	dd	$ihllfcia
	dd	8
	dd	4
	dd	$ibmlfcia
	dd	4
	dd	4
	dd	$afmlfcia
	dd	4
	dd	4
	dd	$iimlfcia
	dd	4
	dd	4
	dd	$ammlfcia
	dd	4
	dd	4
	dd	$ipmlfcia
	dd	4
	dd	4
	dd	$adnlfcia
	dd	4
	dd	4
	dd	$ignlfcia
	dd	8
	dd	4
	dd	$aknlfcia
	dd	16
	dd	4
	dd	$innlfcia
	dd	8
	dd	4
	dd	$iholfcia
	dd	52
	dd	4
	dd	$alolfcia
	dd	8
	dd	4
	dd	$afplfcia
	dd	4
	dd	4
	dd	$iiplfcia
	dd	8
	dd	4
	dd	$amplfcia
	dd	4
	dd	4
	dd	$ipplfcia
	dd	8
	dd	4
	dd	$adamfcia
	dd	4
	dd	4
	dd	$igamfcia
	dd	8
	dd	4
	dd	$akamfcia
	dd	4
	dd	4
	dd	$inamfcia
	dd	8
	dd	4
	dd	$abbmfcia
	dd	4
	dd	4
	dd	$iebmfcia
	dd	8
	dd	4
	dd	$iobmfcia
	dd	4
	dd	4
	dd	$accmfcia
	dd	8
	dd	4
	dd	$ifcmfcia
	dd	4
	dd	4
	dd	$ajcmfcia
	dd	8
	dd	4
	dd	$imcmfcia
	dd	4
	dd	4
	dd	$aadmfcia
	dd	8
	dd	4
	dd	$iddmfcia
	dd	4
	dd	4
	dd	$ahdmfcia
	dd	8
	dd	4
	dd	$ikdmfcia
	dd	4
	dd	4
	dd	$aodmfcia
	dd	8
	dd	4
	dd	$ibemfcia
	dd	4
	dd	4
	dd	$afemfcia
	dd	8
	dd	4
	dd	$iiemfcia
	dd	4
	dd	4
	dd	$amemfcia
	dd	8
	dd	4
	dd	$ipemfcia
	dd	4
	dd	4
	dd	$adfmfcia
	dd	8
	dd	4
	dd	$igfmfcia
	dd	4
	dd	4
	dd	$akfmfcia
	dd	8
	dd	4
	dd	$infmfcia
	dd	4
	dd	4
	dd	$abgmfcia
	dd	8
	dd	4
	dd	$iegmfcia
	dd	4
	dd	4
	dd	$aigmfcia
	dd	8
	dd	4
	dd	$ilgmfcia
	dd	4
	dd	4
	dd	$apgmfcia
	dd	8
	dd	4
	dd	$ichmfcia
	dd	4
	dd	4
	dd	$aghmfcia
	dd	8
	dd	4
	dd	$ijhmfcia
	dd	4
	dd	4
	dd	$anhmfcia
	dd	8
	dd	4
	dd	$iaimfcia
	dd	4
	dd	4
	dd	$aeimfcia
	dd	8
	dd	4
	dd	$ihimfcia
	dd	4
	dd	4
	dd	$alimfcia
	dd	8
	dd	4
	dd	$ioimfcia
	dd	4
	dd	4
	dd	$acjmfcia
	dd	8
	dd	4
	dd	$ifjmfcia
	dd	4
	dd	4
	dd	$ajjmfcia
	dd	8
	dd	4
	dd	$imjmfcia
	dd	4
	dd	4
	dd	$aakmfcia
	dd	8
	dd	4
	dd	$idkmfcia
	dd	4
	dd	4
	dd	$ahkmfcia
	dd	8
	dd	4
	dd	$ikkmfcia
	dd	4
	dd	4
	dd	$aokmfcia
	dd	8
	dd	4
	dd	$iblmfcia
	dd	4
	dd	4
	dd	$aflmfcia
	dd	8
	dd	4
	dd	$iilmfcia
	dd	4
	dd	4
	dd	$amlmfcia
	dd	8
	dd	4
	dd	$iplmfcia
	dd	4
	dd	4
	dd	$admmfcia
	dd	8
	dd	4
	dd	$igmmfcia
	dd	4
	dd	4
	dd	$akmmfcia
	dd	8
	dd	4
	dd	$inmmfcia
	dd	4
	dd	4
	dd	$abnmfcia
	dd	8
	dd	4
	dd	$ienmfcia
	dd	4
	dd	4
	dd	$ainmfcia
	dd	8
	dd	4
	dd	$ilnmfcia
	dd	4
	dd	4
	dd	$apnmfcia
	dd	8
	dd	4
	dd	$icomfcia
	dd	4
	dd	4
	dd	$agomfcia
	dd	8
	dd	4
	dd	$ijomfcia
	dd	4
	dd	4
	dd	$anomfcia
	dd	8
	dd	4
	dd	$iapmfcia
	dd	4
	dd	4
	dd	$aepmfcia
	dd	8
	dd	4
	dd	$ihpmfcia
	dd	4
	dd	4
	dd	$alpmfcia
	dd	8
	dd	4
	dd	$iopmfcia
	dd	4
	dd	4
	dd	$acanfcia
	dd	8
	dd	4
	dd	$ifanfcia
	dd	4
	dd	4
	dd	$ajanfcia
	dd	8
	dd	4
	dd	$imanfcia
	dd	4
	dd	4
	dd	$aabnfcia
	dd	8
	dd	4
	dd	$idbnfcia
	dd	4
	dd	4
	dd	$ahbnfcia
	dd	8
	dd	4
	dd	$ikbnfcia
	dd	4
	dd	4
	dd	$aobnfcia
	dd	8
	dd	4
	dd	$ibcnfcia
	dd	4
	dd	4
	dd	$afcnfcia
	dd	8
	dd	4
	dd	$iicnfcia
	dd	4
	dd	4
	dd	$amcnfcia
	dd	8
	dd	4
	dd	$ipcnfcia
	dd	4
	dd	4
	dd	$addnfcia
	dd	8
	dd	4
	dd	$igdnfcia
	dd	4
	dd	4
	dd	$akdnfcia
	dd	8
	dd	4
	dd	$indnfcia
	dd	4
	dd	4
	dd	$abenfcia
	dd	8
	dd	4
	dd	$ieenfcia
	dd	4
	dd	4
	dd	$aienfcia
	dd	8
	dd	4
	dd	$ilenfcia
	dd	4
	dd	4
	dd	$apenfcia
	dd	8
	dd	4
	dd	$icfnfcia
	dd	4
	dd	4
	dd	$agfnfcia
	dd	12
	dd	4
	dd	$ijfnfcia
	dd	8
	dd	4
	dd	$anfnfcia
	dd	4
	dd	4
	dd	$iagnfcia
	dd	8
	dd	4
	dd	$aegnfcia
	dd	4
	dd	4
	dd	$ihgnfcia
	dd	8
	dd	4
	dd	$algnfcia
	dd	4
	dd	4
	dd	$iognfcia
	dd	8
	dd	4
	dd	$achnfcia
	dd	4
	dd	4
	dd	$ifhnfcia
	dd	8
	dd	4
	dd	$ajhnfcia
	dd	4
	dd	4
	dd	$imhnfcia
	dd	8
	dd	4
	dd	$aainfcia
	dd	4
	dd	4
	dd	$idinfcia
	dd	8
	dd	4
	dd	$ahinfcia
	dd	4
	dd	4
	dd	$ikinfcia
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
 extrn   _CG_DA_EPY:near
 extrn   _CG_GDA_EGY:near
@@stk@mem@mov$qpvpxvxui equ @stk@mem@mov$qpvpxvxui
 extrn   @stk@mem@mov$qpvpxvxui:near
@@stk@cstr@trim$qpcc equ @stk@cstr@trim$qpcc
 extrn   @stk@cstr@trim$qpcc:near
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
	dw	?patch346
	dw	37
	dw	610
	dw	0
	dw	0
	dw	0
	dw	0
?patch346	equ	12
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	611
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	612
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	113
	dw	0
	dw	0
	dw	613
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	113
	dw	0
	dw	0
	dw	614
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	615
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	616
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	617
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	618
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1136
	dw	0
	dw	0
	dw	619
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	620
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	621
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	622
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	623
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	64
	dw	0
	dw	0
	dw	624
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	625
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	4253
	dw	0
	dw	0
	dw	626
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	627
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	628
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1141
	dw	0
	dw	0
	dw	629
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	630
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	631
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	632
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	633
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1141
	dw	0
	dw	0
	dw	634
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	635
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1141
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
	dw	116
	dw	0
	dw	0
	dw	639
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	640
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1141
	dw	0
	dw	0
	dw	641
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
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
	dw	33
	dw	0
	dw	0
	dw	644
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	17
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
	dw	34
	dw	0
	dw	0
	dw	647
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	648
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	649
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	118
	dw	0
	dw	0
	dw	650
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	118
	dw	0
	dw	0
	dw	651
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
	dw	0
	dw	0
	dw	652
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
	dw	0
	dw	0
	dw	653
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
	dw	0
	dw	0
	dw	654
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	655
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	656
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	112
	dw	0
	dw	0
	dw	657
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	17
	dw	0
	dw	0
	dw	658
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	659
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	113
	dw	0
	dw	0
	dw	660
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1136
	dw	0
	dw	0
	dw	661
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1136
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
	dw	4264
	dw	0
	dw	0
	dw	664
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	4264
	dw	0
	dw	0
	dw	665
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1136
	dw	0
	dw	0
	dw	666
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1136
	dw	0
	dw	0
	dw	667
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1136
	dw	0
	dw	0
	dw	668
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	4264
	dw	0
	dw	0
	dw	669
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	4264
	dw	0
	dw	0
	dw	670
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	113
	dw	0
	dw	0
	dw	671
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	113
	dw	0
	dw	0
	dw	672
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	673
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	674
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
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
	dw	18
	dw	0
	dw	0
	dw	677
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	112
	dw	0
	dw	0
	dw	678
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	679
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	680
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	118
	dw	0
	dw	0
	dw	681
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
	dw	0
	dw	0
	dw	682
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	118
	dw	0
	dw	0
	dw	683
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
	dw	0
	dw	0
	dw	684
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	685
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	686
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	687
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	688
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
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
	dw	33
	dw	0
	dw	0
	dw	691
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	692
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	693
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	694
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	695
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	696
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
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
	dw	33
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
	dw	1027
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
	dw	1027
	dw	0
	dw	0
	dw	730
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	731
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	732
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
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
	dw	18
	dw	0
	dw	0
	dw	735
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	736
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	737
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	113
	dw	0
	dw	0
	dw	738
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	739
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	740
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	3
	dw	0
	dw	0
	dw	741
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	3
	dw	0
	dw	0
	dw	742
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	3
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
	dw	1027
	dw	0
	dw	0
	dw	745
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	746
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
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
	dw	34
	dw	0
	dw	0
	dw	751
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	752
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
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
	dw	1027
	dw	0
	dw	0
	dw	756
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	757
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	758
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1141
	dw	0
	dw	0
	dw	759
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	760
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	761
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	762
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	763
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	764
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	765
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	766
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
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
	dw	16
	dw	0
	dw	0
	dw	769
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	770
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	112
	dw	0
	dw	0
	dw	771
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	772
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	112
	dw	0
	dw	0
	dw	773
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	774
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	17
	dw	0
	dw	0
	dw	775
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	776
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	777
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	778
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	118
	dw	0
	dw	0
	dw	779
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
	dw	0
	dw	0
	dw	780
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	118
	dw	0
	dw	0
	dw	781
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
	dw	0
	dw	0
	dw	782
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	783
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
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
	dw	17
	dw	0
	dw	0
	dw	786
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	17
	dw	0
	dw	0
	dw	787
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	17
	dw	0
	dw	0
	dw	788
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	789
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	790
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	791
	dw	0
	dw	0
	dw	0
	dw	?patch347
	dw	37
	dw	792
	dw	0
	dw	0
	dw	0
	dw	0
?patch347	equ	12
	dw	?patch348
	dw	37
	dw	793
	dw	0
	dw	0
	dw	0
	dw	0
?patch348	equ	12
	dw	?patch349
	dw	37
	dw	794
	dw	0
	dw	0
	dw	0
	dw	0
?patch349	equ	12
	dw	?patch350
	dw	37
	dw	795
	dw	0
	dw	0
	dw	0
	dw	0
?patch350	equ	12
	dw	?patch351
	dw	37
	dw	796
	dw	0
	dw	0
	dw	0
	dw	0
?patch351	equ	12
	dw	?patch352
	dw	37
	dw	797
	dw	0
	dw	0
	dw	0
	dw	0
?patch352	equ	12
	dw	?patch353
	dw	37
	dw	798
	dw	0
	dw	0
	dw	0
	dw	0
?patch353	equ	12
	dw	22
	dw	513
	df	_tsc_STARTED
	dw	0
	dw	119
	dw	0
	dw	799
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_PAUSED
	dw	0
	dw	119
	dw	0
	dw	800
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_LAST_MEASURED
	dw	0
	dw	119
	dw	0
	dw	801
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_ADJ
	dw	0
	dw	119
	dw	0
	dw	802
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_ELAPSED
	dw	0
	dw	119
	dw	0
	dw	803
	dw	0
	dw	0
	dw	0
	dw	?patch354
	dw	38
	dw	514
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
	dw	1315
	dw	0
	dw	1316
	dw	0
	dw	1317
	dw	0
?patch354	equ	2060
	dw	?patch355
	dw	1
	db	5
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
?patch355	equ	18
$$BSYMS	ends
$$BTYPES	segment byte public use32 'DEBTYP'
	db        2,0,0,0,14,0,8,0,119,0,0,0,0,0,0,0
	db        1,16,0,0,4,0,1,2,0,0,14,0,8,0,119,0
	db        0,0,0,0,0,0,3,16,0,0,4,0,1,2,0,0
	db        8,0,1,0,2,0,118,0,0,0,14,0,8,0,119,0
	db        0,0,0,0,0,0,6,16,0,0,4,0,1,2,0,0
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
	db        155,16,0,0,4,0,1,2,0,0,14,0,8,0,3,4
	db        0,0,7,0,3,0,160,16,0,0,8,0,2,0,10,0
	db        158,16,0,0,8,0,1,0,1,0,3,0,0,0,8,0
	db        1,0,1,0,117,0,0,0,16,0,1,2,3,0,3,4
	db        0,0,157,16,0,0,159,16,0,0,14,0,8,0,112,4
	db        0,0,7,0,2,0,162,16,0,0,12,0,1,2,2,0
	db        112,4,0,0,112,0,0,0,14,0,8,0,118,0,0,0
	db        7,0,3,0,164,16,0,0,16,0,1,2,3,0,157,16
	db        0,0,157,16,0,0,159,16,0,0,14,0,8,0,119,0
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
	db	9,'__shared1'
	db	9,'__unique1'
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
	db	3,'ret'
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
	?debug	D "C:\Src\LIB\stk\cpu\stk_cpu.h" 23631 26774
	?debug	D "C:\Src\LIB\stk\cpu\./../io/./../stk_main.h" 23625 33624
	?debug	D "C:\Src\LIB\stk\cpu\./../io/stk_console.h" 23626 45852
	?debug	D "C:\Src\LIB\stk\cpu\./../time/stk_time.h" 23625 39992
	?debug	D "C:\Src\LIB\stk\cpu\./../stasm/stk_stasm.h" 22356 34828
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\_lim.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\limits.h" 10305 10240
	?debug	D "C:\Src\LIB\stk\cpu\./../threads/./../cpu/./../stk_main.h" 23625 33624
	?debug	D "C:\Src\LIB\stk\cpu\./../threads/./../cpu/stk_cpu.h" 23631 26774
	?debug	D "C:\Src\LIB\stk\cpu\./../threads/./../time/stk_time.h" 23625 39992
	?debug	D "C:\Src\LIB\stk\cpu\./../threads/./../stk_main.h" 23625 33624
	?debug	D "C:\Src\LIB\stk\cpu\./../threads/stk_threads.h" 23625 39992
	?debug	D "C:\Src\LIB\stk\cpu\./../text/stk_cstr_utils.h" 22373 26066
	?debug	D "C:\Src\LIB\stk\cpu\./../mem/./.././stasm/./../stk_main.h" 23625 33624
	?debug	D "C:\Src\LIB\stk\cpu\./../mem/./.././stasm/stk_stasm.h" 22356 34828
	?debug	D "C:\Src\LIB\stk\cpu\./../mem/./.././text/./../stk_main.h" 23625 33624
	?debug	D "C:\Src\LIB\stk\cpu\./../mem/./.././text/stk_cstr_utils.h" 22373 26066
	?debug	D "C:\Src\LIB\stk\cpu\./../mem/./.././time/./../stk_main.h" 23625 33624
	?debug	D "C:\Src\LIB\stk\cpu\./../mem/./.././time/stk_time.h" 23625 39992
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\sys/stat.h" 10503 10272
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\sys/types.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\fcntl.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\stdio.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\time.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\assert.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\search.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\stdlib.h" 10503 10272
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\tchar.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\dir.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\direct.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\_nfile.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\io.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\conio.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\qos.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\imm.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\mcx.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\winsvc.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\winnetwk.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\winreg.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\winver.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\wincon.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\winnls.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\tvout.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\winuser.h" 18052 43723
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\pshpack1.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\wingdi.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\winerror.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\winbase.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\pshpack8.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\pshpack2.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\poppack.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\_loc.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\locale.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\_str.h" 10503 10272
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\string.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\guiddef.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\basetsd.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\mbctype.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\ctype.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\winnt.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\windef.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\stdarg.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\excpt.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\_null.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\_defs.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\_stddef.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\mem.h" 10503 10272
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\windows.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\pshpack4.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\winsock2.h" 10305 10240
	?debug	D "C:\Src\LIB\stk\cpu\./../mem/./../stk_main.h" 23625 33624
	?debug	D "C:\Src\LIB\stk\cpu\./../mem/stk_mem.h" 22373 26066
	?debug	D "C:\Src\LIB\stk\cpu\stk_cpu.cpp" 23631 45443
	end
