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
	?debug	S "E:\SRC\X86_LIBRARIES\stk\cpu\stk_cpu.cpp"
	?debug	T "E:\SRC\X86_LIBRARIES\stk\cpu\stk_cpu.cpp"
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
	?debug L 53
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-32
	mov       dword ptr [ebp-8],offset @1
	?debug L 83
@2:
	rdtsc	
	?debug L 84
	mov	 [dword ptr [ebp-28]], eax
	?debug L 85
	mov	 [dword ptr [ebp-36]], edx
	?debug L 102
	mov       eax,dword ptr [ebp-36]
	xor       edx,edx
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 103
	mov       edx,dword ptr [ebp-20]
	xor       eax,eax
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 104
	mov       eax,dword ptr [ebp-28]
	xor       edx,edx
	or        eax,dword ptr [ebp-20]
	or        edx,dword ptr [ebp-16]
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 105
	mov       eax,dword ptr [ebp-20]
	mov       edx,dword ptr [ebp-16]
	?debug L 106
@4:
@3:
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
?patch1	equ	@4-@@stk@cpu@rdtsc$qv+57
?patch2	equ	0
?patch3	equ	@4-@@stk@cpu@rdtsc$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$akfofcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@rdtscex$qv	segment virtual
	align	2
@@stk@cpu@rdtscex$qv	proc	near
?live16386@0:
	?debug L 109
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-44
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @5
	mov       edi,offset $akfofcia
@6:
	jmp       short @8
	?debug L 235
?live16386@16: ; EDI = &$akfofcia
@7:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@8:
	push      8
	push      edi
	call      _CG_D_EP
	cmp       dword ptr [edi+4],0
	jne       short @7
	cmp       dword ptr [edi],0
@9:
	jne       short @7
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-48],eax
	mov       dword ptr [ebp-44],edx
	push      8
	push      edi
	call      _CG_D_EP
	mov       eax,dword ptr [ebp-48]
	mov       dword ptr [edi],eax
	mov       eax,dword ptr [ebp-44]
	mov       dword ptr [edi+4],eax
	jmp       short @11
@10:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@11:
	push      8
	push      edi
	call      _CG_D_EP
	cmp       dword ptr [edi+4],0
	jne       short @14
	cmp       dword ptr [edi],0
@14:
	je        short @12
	push      8
	push      edi
	call      _CG_D_EP
	mov       eax,dword ptr [edi]
	mov       edx,dword ptr [edi+4]
	cmp       edx,dword ptr [ebp-44]
	jne       short @15
	cmp       eax,dword ptr [ebp-48]
@15:
	setne     cl
	and       ecx,1
	jmp       short @13
@12:
	xor       ecx,ecx
@13:
	test      cl,cl
	jne       short @10
	?debug L 237
?live16386@32: ; 
	pushfd	
	?debug L 238
	push	 eax
	?debug L 239
	push	 ebx
	?debug L 240
	push	 ecx
	?debug L 241
	push	 edx
	?debug L 242
	push	 esi
	?debug L 243
	mov	 eax,000000001H
	?debug L 244
	xor	 ecx,ecx
	?debug L 245
	cpuid	
	?debug L 246
	mov	 ecx,000000001H
	?debug L 247
	shl	 ecx,27
	?debug L 248
	and	 ecx,edx
	?debug L 249
	xor	 eax,eax
	?debug L 250
	xor	 edx,edx
	?debug L 252
	test	 ecx,ecx
	?debug L 253
?live16386@272: ; EDI = &$akfofcia
	je        @16
	?debug L 254
?live16386@288: ; 
	mov	 eax,1
	?debug L 255
	cpuid	
	?debug L 256
?live16386@320: ; EDI = &$akfofcia
	jmp       @17
	?debug L 261
?live16386@336: ; 
	rdtsc	
	?debug L 263
@17:
tsc_intel_measure:
	?debug L 267
	rdtsc	
	?debug L 269
@16:
tsc_exit:
	?debug L 270
	mov	 [dword ptr [ebp-28]],eax
	?debug L 271
	mov	 [dword ptr [ebp-36]],edx
	?debug L 272
	pop	 esi
	?debug L 273
	pop	 edx
	?debug L 274
	pop	 ecx
	?debug L 275
	pop	 ebx
	?debug L 276
	pop	 eax
	?debug L 277
	popfd	
	?debug L 279
?live16386@528: ; EDI = &$akfofcia
	mov       eax,dword ptr [ebp-36]
	xor       edx,edx
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 280
	mov       edx,dword ptr [ebp-20]
	xor       eax,eax
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 281
	mov       eax,dword ptr [ebp-28]
	xor       edx,edx
	or        eax,dword ptr [ebp-20]
	or        edx,dword ptr [ebp-16]
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 282
	push      8
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],0
	mov       dword ptr [edi+4],0
	?debug L 283
?live16386@592: ; 
	mov       eax,dword ptr [ebp-20]
	mov       edx,dword ptr [ebp-16]
	?debug L 295
@19:
@18:
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@5:
	db        67,71,83,0
	dd        @@stk@cpu@rdtscex$qv+0
	dd        @5+0
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
	df	$akfofcia
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
?patch4	equ	@19-@@stk@cpu@rdtscex$qv+68
?patch5	equ	0
?patch6	equ	@19-@@stk@cpu@rdtscex$qv
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
$aegofcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_init$qv	segment virtual
	align	2
@@stk@cpu@tsc_init$qv	proc	near
?live16387@0:
	?debug L 298
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-52
	push      ebx
	mov       dword ptr [ebp-8],offset @20
@21:
	mov       ebx,offset $aegofcia
	jmp       short @23
	?debug L 301
?live16387@16: ; EBX = &$aegofcia
@22:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@23:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @22
	cmp       dword ptr [ebx],0
	jne       short @22
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
	jmp       short @26
@25:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@26:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @29
	cmp       dword ptr [ebx],0
@29:
	je        short @27
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @30
	cmp       eax,dword ptr [ebp-20]
@30:
	setne     cl
	and       ecx,1
	jmp       short @28
@27:
	xor       ecx,ecx
@28:
	test      cl,cl
	jne       short @25
	?debug L 303
	mov       dword ptr [_tsc_ADJ],0
	mov       dword ptr [_tsc_ADJ+4],0
	?debug L 304
	call      @@stk@cpu@tsc_start$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 305
	call      @@stk@cpu@tsc_checkpoint$qv
	mov       dword ptr [ebp-44],eax
	mov       dword ptr [ebp-40],edx
	?debug L 306
	mov       eax,dword ptr [ebp-44]
	mov       edx,dword ptr [ebp-40]
	cmp       edx,dword ptr [ebp-28]
	jne       short @32
	cmp       eax,dword ptr [ebp-32]
@32:
	jbe       short @31
	?debug L 307
	mov       eax,dword ptr [ebp-44]
	mov       edx,dword ptr [ebp-40]
	sub       eax,dword ptr [ebp-32]
	sbb       edx,dword ptr [ebp-28]
	mov       dword ptr [_tsc_ADJ],eax
	mov       dword ptr [_tsc_ADJ+4],edx
	?debug L 308
@31:
	mov       eax,dword ptr [_tsc_ADJ]
	mov       dword ptr [ebp-56],eax
	mov       eax,dword ptr [_tsc_ADJ+4]
	mov       dword ptr [ebp-52],eax
	?debug L 309
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 310
?live16387@144: ; 
	mov       eax,dword ptr [ebp-56]
	mov       edx,dword ptr [ebp-52]
	?debug L 311
@34:
@33:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@20:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_init$qv+0
	dd        @20+0
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
	df	$aegofcia
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
?patch7	equ	@34-@@stk@cpu@tsc_init$qv+64
?patch8	equ	0
?patch9	equ	@34-@@stk@cpu@tsc_init$qv
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
$ihgofcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_start$qv	segment virtual
	align	2
@@stk@cpu@tsc_start$qv	proc	near
?live16388@0:
	?debug L 314
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-28
	push      ebx
	mov       dword ptr [ebp-8],offset @35
@36:
	mov       ebx,offset $ihgofcia
	jmp       short @38
	?debug L 317
?live16388@16: ; EBX = &$ihgofcia
@37:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@38:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @37
	cmp       dword ptr [ebx],0
	jne       short @37
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
	jmp       short @41
@40:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@41:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @44
	cmp       dword ptr [ebx],0
@44:
	je        short @42
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @45
	cmp       eax,dword ptr [ebp-20]
@45:
	setne     cl
	and       ecx,1
	jmp       short @43
@42:
	xor       ecx,ecx
@43:
	test      cl,cl
	jne       short @40
	?debug L 318
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 319
	mov       eax,dword ptr [ebp-32]
	mov       dword ptr [_tsc_STARTED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_STARTED+4],eax
	?debug L 320
	mov       edx,dword ptr [ebp-32]
	mov       dword ptr [_tsc_LAST_MEASURED],edx
	mov       edx,dword ptr [ebp-28]
	mov       dword ptr [_tsc_LAST_MEASURED+4],edx
	?debug L 321
	mov       dword ptr [_tsc_PAUSED],0
	mov       dword ptr [_tsc_PAUSED+4],0
	mov       dword ptr [_tsc_ELAPSED],0
	mov       dword ptr [_tsc_ELAPSED+4],0
	?debug L 322
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 323
?live16388@112: ; 
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	?debug L 324
@47:
@46:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@35:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_start$qv+0
	dd        @35+0
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
	df	$ihgofcia
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
?patch10	equ	@47-@@stk@cpu@tsc_start$qv+49
?patch11	equ	0
?patch12	equ	@47-@@stk@cpu@tsc_start$qv
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
$algofcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_checkpoint$qv	segment virtual
	align	2
@@stk@cpu@tsc_checkpoint$qv	proc	near
?live16389@0:
	?debug L 327
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-52
	push      ebx
	mov       dword ptr [ebp-8],offset @48
@49:
	mov       ebx,offset $algofcia
	jmp       short @51
	?debug L 330
?live16389@16: ; EBX = &$algofcia
@50:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@51:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @50
	cmp       dword ptr [ebx],0
	jne       short @50
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
	jmp       short @54
@53:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@54:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @57
	cmp       dword ptr [ebx],0
@57:
	je        short @55
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @58
	cmp       eax,dword ptr [ebp-20]
@58:
	setne     cl
	and       ecx,1
	jmp       short @56
@55:
	xor       ecx,ecx
@56:
	test      cl,cl
	jne       short @53
	?debug L 331
	mov       eax,dword ptr [_tsc_PAUSED]
	mov       dword ptr [ebp-32],eax
	mov       eax,dword ptr [_tsc_PAUSED+4]
	mov       dword ptr [ebp-28],eax
	?debug L 334
	cmp       dword ptr [ebp-28],0
	jne       short @59
	cmp       dword ptr [ebp-32],0
	jne       short @59
	?debug L 335
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 337
@59:
	mov       eax,dword ptr [_tsc_STARTED]
	mov       edx,dword ptr [_tsc_STARTED+4]
	sub       eax,dword ptr [_tsc_ADJ]
	sbb       edx,dword ptr [_tsc_ADJ+4]
	mov       dword ptr [ebp-44],eax
	mov       dword ptr [ebp-40],edx
	?debug L 338
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	cmp       edx,dword ptr [ebp-40]
	jne       short @62
	cmp       eax,dword ptr [ebp-44]
@62:
	jbe       short @61
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	sub       eax,dword ptr [ebp-44]
	sbb       edx,dword ptr [ebp-40]
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	jmp       short @63
	?debug L 340
@61:
	mov       dword ptr [ebp-56],0
	mov       dword ptr [ebp-52],0
	?debug L 342
@63:
	mov       eax,dword ptr [ebp-32]
	mov       dword ptr [_tsc_LAST_MEASURED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_LAST_MEASURED+4],eax
	?debug L 343
	mov       edx,dword ptr [ebp-56]
	mov       dword ptr [_tsc_ELAPSED],edx
	mov       edx,dword ptr [ebp-52]
	mov       dword ptr [_tsc_ELAPSED+4],edx
	?debug L 344
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 345
?live16389@176: ; 
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	?debug L 346
@65:
@64:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@48:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_checkpoint$qv+0
	dd        @48+0
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
	df	$algofcia
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
?patch13	equ	@65-@@stk@cpu@tsc_checkpoint$qv+67
?patch14	equ	0
?patch15	equ	@65-@@stk@cpu@tsc_checkpoint$qv
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
	?debug L 349
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @66
	?debug L 351
@67:
	mov       eax,dword ptr [_tsc_ELAPSED]
	mov       edx,dword ptr [_tsc_ELAPSED+4]
	?debug L 352
@69:
@68:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@66:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_elapsed$qv+0
	dd        @66+0
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
?patch16	equ	@69-@@stk@cpu@tsc_elapsed$qv+32
?patch17	equ	0
?patch18	equ	@69-@@stk@cpu@tsc_elapsed$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iogofcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_pause$qv	segment virtual
	align	2
@@stk@cpu@tsc_pause$qv	proc	near
?live16391@0:
	?debug L 355
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-28
	push      ebx
	mov       dword ptr [ebp-8],offset @70
@71:
	mov       ebx,offset $iogofcia
	jmp       short @73
	?debug L 358
?live16391@16: ; EBX = &$iogofcia
@72:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@73:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @72
	cmp       dword ptr [ebx],0
	jne       short @72
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
	jmp       short @76
@75:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@76:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @79
	cmp       dword ptr [ebx],0
@79:
	je        short @77
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @80
	cmp       eax,dword ptr [ebp-20]
@80:
	setne     cl
	and       ecx,1
	jmp       short @78
@77:
	xor       ecx,ecx
@78:
	test      cl,cl
	jne       short @75
	?debug L 359
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 360
	mov       eax,dword ptr [ebp-32]
	mov       dword ptr [_tsc_PAUSED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_PAUSED+4],eax
	?debug L 361
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 362
?live16391@80: ; 
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	?debug L 363
@82:
@81:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@70:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_pause$qv+0
	dd        @70+0
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
	df	$iogofcia
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
?patch19	equ	@82-@@stk@cpu@tsc_pause$qv+51
?patch20	equ	0
?patch21	equ	@82-@@stk@cpu@tsc_pause$qv
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
$achofcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_resume$qv	segment virtual
	align	2
@@stk@cpu@tsc_resume$qv	proc	near
?live16392@0:
	?debug L 366
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-64
	push      ebx
	mov       dword ptr [ebp-8],offset @83
@84:
	mov       ebx,offset $achofcia
	jmp       short @86
	?debug L 369
?live16392@16: ; EBX = &$achofcia
@85:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@86:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @85
	cmp       dword ptr [ebx],0
	jne       short @85
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
	jmp       short @89
@88:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@89:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @92
	cmp       dword ptr [ebx],0
@92:
	je        short @90
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @93
	cmp       eax,dword ptr [ebp-20]
@93:
	setne     cl
	and       ecx,1
	jmp       short @91
@90:
	xor       ecx,ecx
@91:
	test      cl,cl
	jne       short @88
	?debug L 370
	mov       eax,dword ptr [_tsc_STARTED]
	mov       dword ptr [ebp-32],eax
	mov       eax,dword ptr [_tsc_STARTED+4]
	mov       dword ptr [ebp-28],eax
	?debug L 371
	mov       edx,dword ptr [_tsc_PAUSED]
	mov       dword ptr [ebp-44],edx
	mov       edx,dword ptr [_tsc_PAUSED+4]
	mov       dword ptr [ebp-40],edx
	?debug L 372
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	?debug L 373
	mov       eax,dword ptr [ebp-56]
	mov       edx,dword ptr [ebp-52]
	sub       eax,dword ptr [ebp-44]
	sbb       edx,dword ptr [ebp-40]
	add       eax,dword ptr [ebp-32]
	adc       edx,dword ptr [ebp-28]
	mov       dword ptr [ebp-68],eax
	mov       dword ptr [ebp-64],edx
	?debug L 374
	mov       eax,dword ptr [ebp-68]
	mov       dword ptr [_tsc_STARTED],eax
	mov       eax,dword ptr [ebp-64]
	mov       dword ptr [_tsc_STARTED+4],eax
	mov       dword ptr [_tsc_PAUSED],0
	mov       dword ptr [_tsc_PAUSED+4],0
	?debug L 375
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 376
?live16392@128: ; 
	mov       eax,dword ptr [ebp-56]
	mov       edx,dword ptr [ebp-52]
	?debug L 377
@95:
@94:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@83:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_resume$qv+0
	dd        @83+0
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
	df	$achofcia
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
?patch22	equ	@95-@@stk@cpu@tsc_resume$qv+75
?patch23	equ	0
?patch24	equ	@95-@@stk@cpu@tsc_resume$qv
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
$ifhofcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_start_paused$qv	segment virtual
	align	2
@@stk@cpu@tsc_start_paused$qv	proc	near
?live16393@0:
	?debug L 380
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-28
	push      ebx
	mov       dword ptr [ebp-8],offset @96
@97:
	mov       ebx,offset $ifhofcia
	jmp       short @99
	?debug L 383
?live16393@16: ; EBX = &$ifhofcia
@98:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@99:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @98
	cmp       dword ptr [ebx],0
	jne       short @98
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
	jmp       short @102
@101:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@102:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @105
	cmp       dword ptr [ebx],0
@105:
	je        short @103
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @106
	cmp       eax,dword ptr [ebp-20]
@106:
	setne     cl
	and       ecx,1
	jmp       short @104
@103:
	xor       ecx,ecx
@104:
	test      cl,cl
	jne       short @101
	?debug L 384
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 385
	mov       eax,dword ptr [ebp-32]
	mov       dword ptr [_tsc_LAST_MEASURED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_LAST_MEASURED+4],eax
	?debug L 386
	mov       edx,dword ptr [ebp-32]
	mov       dword ptr [_tsc_STARTED],edx
	mov       edx,dword ptr [ebp-28]
	mov       dword ptr [_tsc_STARTED+4],edx
	?debug L 387
	mov       dword ptr [_tsc_ELAPSED],0
	mov       dword ptr [_tsc_ELAPSED+4],0
	mov       eax,dword ptr [ebp-32]
	mov       dword ptr [_tsc_PAUSED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_PAUSED+4],eax
	?debug L 388
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 389
?live16393@112: ; 
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	?debug L 390
@108:
@107:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@96:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_start_paused$qv+0
	dd        @96+0
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
	df	$ifhofcia
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
?patch25	equ	@108-@@stk@cpu@tsc_start_paused$qv+51
?patch26	equ	0
?patch27	equ	@108-@@stk@cpu@tsc_start_paused$qv
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
	?debug L 393
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @109
	?debug L 419
@110:
	mov	 eax,dword ptr [ebp+24]
	?debug L 420
	mov	 ecx,dword ptr [ebp+28]
	?debug L 421
	and	 eax,080000000H
	?debug L 422
	cpuid	
	?debug L 423
	mov	 ESI,dword ptr [ebp+8]
	?debug L 424
	mov	 [ESI],eax
	?debug L 425
	mov	 ESI,dword ptr [ebp+12]
	?debug L 426
	mov	 [ESI],ebx
	?debug L 427
	mov	 ESI,dword ptr [ebp+16]
	?debug L 428
	mov	 [ESI],ecx
	?debug L 429
	mov	 ESI,dword ptr [ebp+20]
	?debug L 430
	mov	 [ESI],edx
	?debug L 440
	mov       eax,dword ptr [ebp+8]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [eax]
	?debug L 442
@112:
@111:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@109:
	db        67,71,83,0
	dd        @@stk@cpu@cpuid$qpuit1t1t1uiui+0
	dd        @109+0
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
?patch28	equ	@112-@@stk@cpu@cpuid$qpuit1t1t1uiui+83
?patch29	equ	0
?patch30	equ	@112-@@stk@cpu@cpuid$qpuit1t1t1uiui
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
$iphofcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$adiofcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$igiofcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$akiofcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$iniofcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$abjofcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$iejofcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpuidex$qpuit1t1t1uiui	segment virtual
	align	2
@@stk@cpu@cpuidex$qpuit1t1t1uiui	proc	near
?live16395@0:
	?debug L 445
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-16
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @113
@114:
	jmp       short @116
	?debug L 455
@115:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@116:
	cmp       dword ptr [$iejofcia+4],0
	jne       short @115
	cmp       dword ptr [$iejofcia],0
@117:
	jne       short @115
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [$iejofcia],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [$iejofcia+4],eax
	jmp       short @119
@118:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@119:
	cmp       dword ptr [$iejofcia+4],0
	jne       short @122
	cmp       dword ptr [$iejofcia],0
@122:
	je        short @120
	mov       eax,dword ptr [$iejofcia]
	mov       edx,dword ptr [$iejofcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @123
	cmp       eax,dword ptr [ebp-20]
@123:
	setne     cl
	and       ecx,1
	jmp       short @121
@120:
	xor       ecx,ecx
@121:
	test      cl,cl
	jne       short @118
	?debug L 456
	mov       eax,dword ptr [ebp+24]
	cmp       eax,dword ptr [$iniofcia]
	jne       short @124
	mov       edx,dword ptr [ebp+28]
	cmp       edx,dword ptr [$abjofcia]
	jne       short @124
	?debug L 457
	mov       eax,dword ptr [ebp+8]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$iphofcia]
	mov       dword ptr [eax],edx
	?debug L 458
	mov       ecx,dword ptr [ebp+12]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [$adiofcia]
	mov       dword ptr [ecx],eax
	?debug L 459
	mov       edx,dword ptr [ebp+16]
	push      4
	push      edx
	push      0
	call      _CG_DA_EPY
	mov       ecx,dword ptr [$igiofcia]
	mov       dword ptr [edx],ecx
	?debug L 460
	mov       eax,dword ptr [ebp+20]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$akiofcia]
	mov       dword ptr [eax],edx
	?debug L 461
@125:
	mov       eax,dword ptr [$iphofcia]
	?debug L 462
?live16395@128: ; EAX = ret
	mov       dword ptr [$iejofcia],0
	mov       dword ptr [$iejofcia+4],0
	?debug L 463
	jmp       @126
	?debug L 464
?live16395@160: ; 
@127:
	jmp       short @128
	?debug L 466
@124:
	mov       edx,dword ptr [ebp+24]
	?debug L 467
	mov       ecx,dword ptr [ebp+28]
	?debug L 466
	mov       dword ptr [$iniofcia],edx
	?debug L 467
	mov       dword ptr [$abjofcia],ecx
	?debug L 612
@128:
	pushfd	
	?debug L 613
	push	 eax
	?debug L 614
	push	 ebx
	?debug L 615
	push	 ecx
	?debug L 616
	push	 edx
	?debug L 617
	push	 esi
	?debug L 618
	push	 edi
	?debug L 619
	mov	 edi,dword ptr [ebp+24]
	?debug L 620
	mov	 eax,edi
	?debug L 621
	and	 eax,080000000H
	?debug L 622
	cpuid	
	?debug L 623
	mov	        esi,eax
	?debug L 624
	xor	        eax,eax
	?debug L 625
	xor	        ebx,ebx
	?debug L 626
	xor	        ecx,ecx
	?debug L 627
	xor	        edx,edx
	?debug L 628
	cmp	        esi,edi
	?debug L 629
	jb        short @129
	?debug L 630
	mov	        eax,edi
	?debug L 631
	mov	        edi,dword ptr [ebp+28]
	?debug L 632
	mov	        ecx,edi
	?debug L 633
	cpuid	
	?debug L 634
@129:
cpuid_save_result:
	?debug L 635
	mov	 dword ptr $iphofcia,eax
	?debug L 636
	mov	 dword ptr $adiofcia,ebx
	?debug L 637
	mov	 dword ptr $igiofcia,ecx
	?debug L 638
	mov	 dword ptr $akiofcia,edx
	?debug L 639
	pop	 edi
	?debug L 640
	pop	 esi
	?debug L 641
	pop	 edx
	?debug L 642
	pop	 ecx
	?debug L 643
	pop	 ebx
	?debug L 644
	pop	 eax
	?debug L 645
	popfd	
	?debug L 652
	mov       eax,dword ptr [ebp+8]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$iphofcia]
	mov       dword ptr [eax],edx
	?debug L 653
	mov       ecx,dword ptr [ebp+12]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [$adiofcia]
	mov       dword ptr [ecx],eax
	?debug L 654
	mov       edx,dword ptr [ebp+16]
	push      4
	push      edx
	push      0
	call      _CG_DA_EPY
	mov       ecx,dword ptr [$igiofcia]
	mov       dword ptr [edx],ecx
	?debug L 655
	mov       eax,dword ptr [ebp+20]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$akiofcia]
	mov       dword ptr [eax],edx
	?debug L 673
	mov       ecx,dword ptr [ebp+8]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [ecx]
	?debug L 674
?live16395@864: ; EAX = ret
	mov       dword ptr [$iejofcia],0
	mov       dword ptr [$iejofcia+4],0
	?debug L 676
?live16395@880: ; 
@130:
@126:
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@113:
	db        67,71,83,0
	dd        @@stk@cpu@cpuidex$qpuit1t1t1uiui+0
	dd        @113+0
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
	df	$iejofcia
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
	df	$abjofcia
	dw	0
	dw	117
	dw	0
	dw	61
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iniofcia
	dw	0
	dw	117
	dw	0
	dw	62
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$akiofcia
	dw	0
	dw	117
	dw	0
	dw	63
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$igiofcia
	dw	0
	dw	117
	dw	0
	dw	64
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$adiofcia
	dw	0
	dw	117
	dw	0
	dw	65
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iphofcia
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
	df	@125
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
?patch36	equ	@127-@125
	dw	2
	dw	6
?patch31	equ	@130-@@stk@cpu@cpuidex$qpuit1t1t1uiui+91
?patch32	equ	0
?patch33	equ	@130-@@stk@cpu@cpuidex$qpuit1t1t1uiui
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
$aijofcia	label	dword
	dd	0
	dd	0
	dd	0
	dd	0
	db	1	dup(?)
	align	4
$iljofcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_vendor$qv	segment virtual
	align	2
@@stk@cpu@cpu_vendor$qv	proc	near
?live16396@0:
	?debug L 679
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-16
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @131
@132:
	mov       ebx,offset $iljofcia
	mov       esi,offset $aijofcia
	jmp       short @134
	?debug L 686
?live16396@16: ; EBX = &$iljofcia, ESI = &$aijofcia
@133:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@134:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @133
	cmp       dword ptr [ebx],0
	jne       short @133
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
	jmp       short @137
@136:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@137:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @140
	cmp       dword ptr [ebx],0
@140:
	je        short @138
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @141
	cmp       eax,dword ptr [ebp-20]
@141:
	setne     cl
	and       ecx,1
	jmp       short @139
@138:
	xor       ecx,ecx
@139:
	test      cl,cl
	jne       short @136
	?debug L 687
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
	?debug L 688
	push      4
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi],0
	je        short @142
	?debug L 689
	push      4
	push      esi
	push      12
	call      _CG_DA_EPY
	xor       edx,edx
	mov       dword ptr [esi+12],edx
	?debug L 691
@142:
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 692
?live16396@96: ; ESI = &$aijofcia
	mov       eax,esi
	?debug L 691
?live16396@112: ; EBX = &$iljofcia, ESI = &$aijofcia
	mov       dword ptr [ebx+4],0
	?debug L 693
?live16396@128: ; 
@144:
@143:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@131:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_vendor$qv+0
	dd        @131+0
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
	df	$iljofcia
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
	df	$aijofcia
	dw	0
	dw	4121
	dw	0
	dw	71
	dw	0
	dw	0
	dw	0
?patch39	equ	@144-@@stk@cpu@cpu_vendor$qv+41
?patch40	equ	0
?patch41	equ	@144-@@stk@cpu@cpu_vendor$qv
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
$ifkofcia	label	dword
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
$ajkofcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_name$qv	segment virtual
	align	2
@@stk@cpu@cpu_name$qv	proc	near
?live16397@0:
	?debug L 696
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @145
@146:
	mov       edi,offset $ifkofcia
	?debug L 702
?live16397@16: ; EDI = &$ifkofcia
	push      4
	push      edi
	call      _CG_D_EP
	cmp       dword ptr [edi],0
	je        short @150
	?debug L 703
	mov       eax,edi
	jmp       @148
	?debug L 705
@149:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@150:
	cmp       dword ptr [$ajkofcia+4],0
	jne       short @149
	cmp       dword ptr [$ajkofcia],0
	jne       short @149
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$ajkofcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$ajkofcia+4],edx
	jmp       short @153
@152:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@153:
	cmp       dword ptr [$ajkofcia+4],0
	jne       short @156
	cmp       dword ptr [$ajkofcia],0
@156:
	je        short @154
	mov       eax,dword ptr [$ajkofcia]
	mov       edx,dword ptr [$ajkofcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @157
	cmp       eax,dword ptr [ebp-20]
@157:
	setne     cl
	and       ecx,1
	jmp       short @155
@154:
	xor       ecx,ecx
@155:
	test      cl,cl
	jne       short @152
	?debug L 708
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
	jae       short @158
	?debug L 709
	mov       dword ptr [$ajkofcia],0
	mov       dword ptr [$ajkofcia+4],0
	?debug L 710
	push      12
	push      offset s@
	push      edi
	call      @@stk@mem@mov$qpvpxvxui
	jmp       @148
	?debug L 712
@158:
	mov       esi,-2147483646
	xor       ebx,ebx
	?debug L 714
?live16397@128: ; EBX = i, ESI = f, EDI = &$ifkofcia
@159:
	lea       eax,dword ptr [ebx+3]
	push      0
	shl       eax,2
	push      esi
	add       eax,edi
	push      offset $ifkofcia
	push      eax
	call      _CG_A_BP
	push      eax
	lea       edx,dword ptr [ebx+2]
	shl       edx,2
	add       edx,edi
	push      offset $ifkofcia
	push      edx
	call      _CG_A_BP
	push      edx
	lea       ecx,dword ptr [ebx+1]
	shl       ecx,2
	add       ecx,edi
	push      offset $ifkofcia
	push      ecx
	call      _CG_A_BP
	push      ecx
	mov       eax,ebx
	shl       eax,2
	add       eax,edi
	push      offset $ifkofcia
	push      eax
	call      _CG_A_BP
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 712
	inc       esi
	add       ebx,4
	cmp       ebx,12
	jb        short @159
	?debug L 716
?live16397@160: ; EDI = &$ifkofcia
	push      32
	push      edi
	call      @@stk@cstr@trim$qpcc
	?debug L 717
	mov       dword ptr [$ajkofcia],0
	mov       dword ptr [$ajkofcia+4],0
	?debug L 718
	mov       eax,edi
	?debug L 719
?live16397@208: ; 
@162:
@148:
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@145:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_name$qv+0
	dd        @145+0
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
	df	$ajkofcia
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
	df	$ifkofcia
	dw	0
	dw	4124
	dw	0
	dw	81
	dw	0
	dw	0
	dw	0
?patch42	equ	@162-@@stk@cpu@cpu_name$qv+75
?patch43	equ	0
?patch44	equ	@162-@@stk@cpu@cpu_name$qv
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
$adlofcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$iglofcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_threads$qv	segment virtual
	align	2
@@stk@cpu@cpu_num_threads$qv	proc	near
?live16398@0:
	?debug L 722
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @163
@164:
	mov       ebx,offset $iglofcia
	?debug L 728
?live16398@16: ; EBX = &$iglofcia
	mov       eax,dword ptr [$adlofcia]
	cmp       eax,-1
	jne       @166
	?debug L 729
?live16398@32: ; EAX = @temp4
	jmp       short @168
	?debug L 731
?live16398@48: ; EBX = &$iglofcia
@167:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@168:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @167
	cmp       dword ptr [ebx],0
	jne       short @167
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
	jmp       short @171
@170:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@171:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @174
	cmp       dword ptr [ebx],0
@174:
	je        short @172
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @175
	cmp       eax,dword ptr [ebp-20]
@175:
	setne     cl
	and       ecx,1
	jmp       short @173
@172:
	xor       ecx,ecx
@173:
	test      cl,cl
	jne       short @170
	?debug L 734
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
	?debug L 736
	mov       eax,dword ptr [ebp-44]
	?debug L 734
	add       esp,24
	?debug L 736
	shr       eax,16
	and       eax,255
	?debug L 738
?live16398@128: ; EBX = &$iglofcia, EAX = @temp3
	push      8
	?debug L 736
?live16398@144: ; EBX = &$iglofcia
	inc       eax
	?debug L 738
?live16398@160: ; EBX = &$iglofcia, EAX = @temp3
	push      ebx
	?debug L 736
?live16398@176: ; EBX = &$iglofcia
	mov       dword ptr [$adlofcia],eax
	?debug L 738
?live16398@192: ; EBX = &$iglofcia, EAX = @temp3
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 740
?live16398@208: ; 
@176:
@166:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@163:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_num_threads$qv+0
	dd        @163+0
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
	df	$iglofcia
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
	df	$adlofcia
	dw	0
	dw	117
	dw	0
	dw	90
	dw	0
	dw	0
	dw	0
?patch49	equ	@176-@@stk@cpu@cpu_num_threads$qv+75
?patch50	equ	0
?patch51	equ	@176-@@stk@cpu@cpu_num_threads$qv
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
$aklofcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$inlofcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_cores$qv	segment virtual
	align	2
@@stk@cpu@cpu_num_cores$qv	proc	near
?live16399@0:
	?debug L 743
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @177
@178:
	mov       ebx,offset $inlofcia
	?debug L 749
?live16399@16: ; EBX = &$inlofcia
	mov       eax,dword ptr [$aklofcia]
	cmp       eax,-1
	jne       @180
	?debug L 750
?live16399@32: ; EAX = @temp3
	jmp       short @182
	?debug L 752
?live16399@48: ; EBX = &$inlofcia
@181:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@182:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @181
	cmp       dword ptr [ebx],0
	jne       short @181
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
	jmp       short @185
@184:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@185:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @188
	cmp       dword ptr [ebx],0
@188:
	je        short @186
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @189
	cmp       eax,dword ptr [ebp-20]
@189:
	setne     cl
	and       ecx,1
	jmp       short @187
@186:
	xor       ecx,ecx
@187:
	test      cl,cl
	jne       short @184
	?debug L 755
	push      12
	push      offset s@+13
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       short @190
	cmp       eax,0
	jne       short @190
	?debug L 757
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
	?debug L 758
	mov       ecx,dword ptr [ebp-52]
	shr       ecx,26
	and       ecx,63
	inc       ecx
	mov       dword ptr [$aklofcia],ecx
	?debug L 760
	jmp       short @192
	?debug L 762
@190:
	push      12
	push      offset s@+26
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       short @193
	cmp       eax,0
	jne       short @193
	?debug L 764
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
	?debug L 765
	mov       edx,dword ptr [ebp-36]
	and       edx,255
	inc       edx
	mov       dword ptr [$aklofcia],edx
	?debug L 767
	jmp       short @192
	?debug L 768
@193:
	call      @@stk@cpu@cpu_num_threads$qv
	mov       dword ptr [$aklofcia],eax
	?debug L 769
@192:
	mov       eax,dword ptr [$aklofcia]
	?debug L 770
?live16399@224: ; EBX = &$inlofcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 773
?live16399@240: ; 
@195:
@180:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@177:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_num_cores$qv+0
	dd        @177+0
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
	df	$inlofcia
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
	df	$aklofcia
	dw	0
	dw	117
	dw	0
	dw	99
	dw	0
	dw	0
	dw	0
?patch52	equ	@195-@@stk@cpu@cpu_num_cores$qv+74
?patch53	equ	0
?patch54	equ	@195-@@stk@cpu@cpu_num_cores$qv
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
$abmofcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$iemofcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_cache_size$quc	segment virtual
	align	2
@@stk@cpu@cpu_cache_size$quc	proc	near
?live16400@0:
	?debug L 774
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @196
@197:
	mov       ebx,dword ptr [ebp+8]
	mov       esi,offset $iemofcia
	mov       edi,offset $abmofcia
	?debug L 780
?live16400@16: ; EBX = a_level, ESI = &$iemofcia, EDI = &$abmofcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       eax,dword ptr [edi]
	cmp       eax,-1
	jne       @199
	?debug L 781
?live16400@32: ; EAX = @temp5, EDI = &$abmofcia
	jmp       short @201
	?debug L 783
?live16400@48: ; EBX = a_level, ESI = &$iemofcia, EDI = &$abmofcia
@200:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@201:
	push      8
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi+4],0
	jne       short @200
	cmp       dword ptr [esi],0
	jne       short @200
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
	jmp       short @204
@203:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@204:
	push      8
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi+4],0
	jne       short @207
	cmp       dword ptr [esi],0
@207:
	je        short @205
	push      8
	push      esi
	call      _CG_D_EP
	mov       eax,dword ptr [esi]
	mov       edx,dword ptr [esi+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @208
	cmp       eax,dword ptr [ebp-20]
@208:
	setne     cl
	and       ecx,1
	jmp       short @206
@205:
	xor       ecx,ecx
@206:
	test      cl,cl
	jne       short @203
	?debug L 786
	push      12
	push      offset s@+13
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       @209
	cmp       eax,0
	jne       @209
	?debug L 787
	cmp       bl,2
	jne       @211
	?debug L 788
?live16400@96: ; ESI = &$iemofcia, EDI = &$abmofcia
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
	?debug L 789
	mov       eax,dword ptr [ebp-28]
	and       eax,255
	cmp       eax,64
	jne       short @212
	?debug L 790
	push      4
	push      edi
	call      _CG_D_EP
	xor       edx,edx
	mov       dword ptr [edi],edx
	jmp       @213
	?debug L 792
?live16400@144: ; ESI = &$iemofcia, EAX = @temp4, EDI = &$abmofcia
@212:
	cmp       eax,65
	jne       short @214
	?debug L 793
?live16400@160: ; ESI = &$iemofcia, EDI = &$abmofcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],128
	jmp       @213
	?debug L 795
?live16400@176: ; ESI = &$iemofcia, EAX = @temp4, EDI = &$abmofcia
@214:
	cmp       eax,66
	jne       short @215
	?debug L 796
?live16400@192: ; ESI = &$iemofcia, EDI = &$abmofcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],256
	jmp       @213
	?debug L 798
?live16400@208: ; ESI = &$iemofcia, EAX = @temp4, EDI = &$abmofcia
@215:
	cmp       eax,67
	jne       short @216
	?debug L 799
?live16400@224: ; ESI = &$iemofcia, EDI = &$abmofcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],512
	jmp       @213
	?debug L 801
?live16400@240: ; ESI = &$iemofcia, EAX = @temp4, EDI = &$abmofcia
@216:
	cmp       eax,68
	jne       short @217
	?debug L 802
?live16400@256: ; ESI = &$iemofcia, EDI = &$abmofcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],1024
	jmp       @213
	?debug L 804
?live16400@272: ; ESI = &$iemofcia, EAX = @temp4, EDI = &$abmofcia
@217:
	cmp       eax,69
	jne       short @218
	?debug L 805
?live16400@288: ; ESI = &$iemofcia, EDI = &$abmofcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],2048
	jmp       @213
	?debug L 809
@218:
	push      4
	push      edi
	call      _CG_D_EP
	xor       ecx,ecx
	mov       dword ptr [edi],ecx
	?debug L 811
	jmp       @213
	?debug L 812
@211:
	push      4
	push      edi
	call      _CG_D_EP
	xor       eax,eax
	mov       dword ptr [edi],eax
	?debug L 813
	jmp       @213
	?debug L 815
?live16400@368: ; EBX = a_level, ESI = &$iemofcia, EDI = &$abmofcia
@209:
	push      12
	push      offset s@+26
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       short @220
	cmp       eax,0
@220:
	jne       @221
	?debug L 816
	test      bl,bl
	jne       short @222
	?debug L 817
?live16400@400: ; ESI = &$iemofcia, EDI = &$abmofcia
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
	?debug L 818
	mov       ecx,dword ptr [ebp-28]
	shr       ecx,24
	and       ecx,255
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],ecx
	?debug L 819
	jmp       @223
	?debug L 821
?live16400@448: ; EBX = a_level, ESI = &$iemofcia, EDI = &$abmofcia
@222:
	cmp       bl,1
	jne       short @224
	?debug L 822
?live16400@464: ; ESI = &$iemofcia, EDI = &$abmofcia
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
	?debug L 823
	mov       edx,dword ptr [ebp-36]
	shr       edx,24
	and       edx,255
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],edx
	?debug L 824
	jmp       short @223
	?debug L 826
?live16400@512: ; EBX = a_level, ESI = &$iemofcia, EDI = &$abmofcia
@224:
	cmp       bl,2
	jne       short @225
	?debug L 827
?live16400@528: ; ESI = &$iemofcia, EDI = &$abmofcia
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
	?debug L 828
	mov       eax,dword ptr [ebp-36]
	shr       eax,16
	and       eax,65535
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],eax
	?debug L 829
	jmp       short @223
	?debug L 831
?live16400@576: ; EBX = a_level, ESI = &$iemofcia, EDI = &$abmofcia
@225:
	cmp       bl,3
	jne       short @226
	?debug L 832
?live16400@592: ; ESI = &$iemofcia, EDI = &$abmofcia
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
	?debug L 833
	mov       ecx,dword ptr [ebp-28]
	shr       ecx,18
	and       ecx,16383
	shl       ecx,9
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],ecx
	?debug L 836
@226:
@223:
@221:
@213:
	push      4
	push      edi
	call      _CG_D_EP
	mov       eax,dword ptr [edi]
	?debug L 837
?live16400@640: ; ESI = &$iemofcia, EAX = ret
	push      8
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],0
	mov       dword ptr [esi+4],0
	?debug L 839
?live16400@656: ; 
@227:
@199:
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@196:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_cache_size$quc+0
	dd        @196+0
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
	df	$iemofcia
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
	df	$abmofcia
	dw	0
	dw	117
	dw	0
	dw	109
	dw	0
	dw	0
	dw	0
?patch57	equ	@227-@@stk@cpu@cpu_cache_size$quc+76
?patch58	equ	0
?patch59	equ	@227-@@stk@cpu@cpu_cache_size$quc
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
$aimofcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ilmofcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_cache_line_size$quc	segment virtual
	align	2
@@stk@cpu@cpu_cache_line_size$quc	proc	near
?live16401@0:
	?debug L 842
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @228
@229:
	mov       ebx,dword ptr [ebp+8]
	mov       esi,offset $ilmofcia
	?debug L 848
?live16401@16: ; ESI = &$ilmofcia, EBX = a_level
	mov       eax,dword ptr [$aimofcia]
	cmp       eax,-1
	jne       @231
	?debug L 849
?live16401@32: ; EAX = @temp4
	jmp       short @233
	?debug L 851
?live16401@48: ; ESI = &$ilmofcia, EBX = a_level
@232:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@233:
	push      8
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi+4],0
	jne       short @232
	cmp       dword ptr [esi],0
	jne       short @232
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
	jmp       short @236
@235:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@236:
	push      8
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi+4],0
	jne       short @239
	cmp       dword ptr [esi],0
@239:
	je        short @237
	push      8
	push      esi
	call      _CG_D_EP
	mov       eax,dword ptr [esi]
	mov       edx,dword ptr [esi+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @240
	cmp       eax,dword ptr [ebp-20]
@240:
	setne     cl
	and       ecx,1
	jmp       short @238
@237:
	xor       ecx,ecx
@238:
	test      cl,cl
	jne       short @235
	?debug L 854
	push      12
	push      offset s@+13
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       short @241
	cmp       eax,0
	jne       short @241
	?debug L 855
?live16401@80: ; ESI = &$ilmofcia
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
	?debug L 856
	mov       ecx,dword ptr [ebp-44]
	and       ecx,4095
	inc       ecx
	mov       dword ptr [$aimofcia],ecx
	?debug L 857
	jmp       @243
	?debug L 859
?live16401@128: ; ESI = &$ilmofcia, EBX = a_level
@241:
	push      12
	push      offset s@+26
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       @244
	cmp       eax,0
	jne       @244
	?debug L 860
	test      bl,bl
	jne       short @246
	?debug L 861
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
	?debug L 862
	mov       edx,dword ptr [ebp-28]
	and       edx,255
	mov       dword ptr [$aimofcia],edx
	?debug L 864
@246:
	cmp       bl,1
	jne       short @247
	?debug L 865
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
	?debug L 866
	mov       eax,dword ptr [ebp-36]
	and       eax,255
	mov       dword ptr [$aimofcia],eax
	?debug L 868
@247:
	cmp       bl,2
	jne       short @248
	?debug L 869
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
	?debug L 870
	mov       ecx,dword ptr [ebp-36]
	and       ecx,255
	mov       dword ptr [$aimofcia],ecx
	?debug L 872
@248:
	cmp       bl,3
	jne       short @249
	?debug L 873
?live16401@304: ; ESI = &$ilmofcia
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
	?debug L 874
	mov       edx,dword ptr [ebp-28]
	and       edx,255
	mov       dword ptr [$aimofcia],edx
	?debug L 877
@249:
@244:
@243:
	mov       eax,dword ptr [$aimofcia]
	?debug L 878
?live16401@352: ; ESI = &$ilmofcia, EAX = ret
	push      8
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],0
	mov       dword ptr [esi+4],0
	?debug L 881
?live16401@368: ; 
@250:
@231:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@228:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_cache_line_size$quc+0
	dd        @228+0
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
	df	$ilmofcia
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
	df	$aimofcia
	dw	0
	dw	117
	dw	0
	dw	119
	dw	0
	dw	0
	dw	0
?patch64	equ	@250-@@stk@cpu@cpu_cache_line_size$quc+73
?patch65	equ	0
?patch66	equ	@250-@@stk@cpu@cpu_cache_line_size$quc
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
$apmofcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$icnofcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_mhz$qo	segment virtual
	align	2
@@stk@cpu@cpu_num_mhz$qo	proc	near
?live16402@0:
	?debug L 884
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-168
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @251
	?debug L 890
@252:
	mov       eax,dword ptr [$apmofcia]
	test      eax,eax
	je        short @256
	cmp       byte ptr [ebp+8],0
	je        @254
	?debug L 891
?live16402@32: ; EAX = @temp18
	jmp       short @256
	?debug L 893
?live16402@48: ; 
@255:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@256:
	cmp       dword ptr [$icnofcia+4],0
	jne       short @255
	cmp       dword ptr [$icnofcia],0
	jne       short @255
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$icnofcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$icnofcia+4],edx
	jmp       short @259
@258:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@259:
	cmp       dword ptr [$icnofcia+4],0
	jne       short @262
	cmp       dword ptr [$icnofcia],0
@262:
	je        short @260
	mov       eax,dword ptr [$icnofcia]
	mov       edx,dword ptr [$icnofcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @263
	cmp       eax,dword ptr [ebp-20]
@263:
	setne     cl
	and       ecx,1
	jmp       short @261
@260:
	xor       ecx,ecx
@261:
	test      cl,cl
	jne       short @258
	?debug L 906
	xor       ebx,ebx
	?debug L 907
?live16402@80: ; EBX = i
@264:
	call      @@stk@cpu@tsc_init$qv
	?debug L 908
	call      @@stk@cpu@tsc_start$qv
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-68],eax
	mov       dword ptr [ebp-64],edx
	call      @@stk@cpu@tsc_checkpoint$qv
	?debug L 909
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-128],eax
	mov       dword ptr [ebp-124],edx
	?debug L 910
@266:
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-80],eax
	mov       dword ptr [ebp-76],edx
	?debug L 911
	mov       eax,dword ptr [ebp-80]
	mov       edx,dword ptr [ebp-76]
	cmp       edx,dword ptr [ebp-64]
	jne       short @268
	cmp       eax,dword ptr [ebp-68]
@268:
	jbe       short @266
	?debug L 912
	call      @@stk@cpu@tsc_start$qv
	?debug L 913
@269:
	mov       edx,21
	?debug L 914
?live16402@192: ; EBX = i, EDX = trash1
@270:
	xor       eax,eax
@272:
	inc       eax
	cmp       eax,1000000
	jb        short @272
	?debug L 913
	dec       edx
	test      edx,edx
	ja        short @270
	?debug L 917
?live16402@224: ; EBX = i
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-92],eax
	mov       dword ptr [ebp-88],edx
	?debug L 918
@276:
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-104],eax
	mov       dword ptr [ebp-100],edx
	?debug L 919
	mov       eax,dword ptr [ebp-104]
	mov       edx,dword ptr [ebp-100]
	cmp       edx,dword ptr [ebp-88]
	jne       short @278
	cmp       eax,dword ptr [ebp-92]
@278:
	jbe       short @276
	?debug L 920
	call      @@stk@cpu@tsc_checkpoint$qv
	?debug L 921
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	?debug L 922
	mov       eax,dword ptr [ebp-104]
	mov       edx,dword ptr [ebp-100]
	sub       eax,dword ptr [ebp-80]
	sbb       edx,dword ptr [ebp-76]
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	?debug L 923
	mov       eax,dword ptr [ebp-116]
	mov       edx,dword ptr [ebp-112]
	sub       eax,dword ptr [ebp-128]
	sbb       edx,dword ptr [ebp-124]
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	?debug L 924
	push      0
	push      1000
	mov       eax,dword ptr [ebp-116]
	mov       edx,dword ptr [ebp-112]
	call      __llmul
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	?debug L 925
	cmp       dword ptr [ebp-52],0
	jne       short @280
	cmp       dword ptr [ebp-56],0
@280:
	je        short @279
	push      dword ptr [ebp-52]
	push      dword ptr [ebp-56]
	mov       eax,dword ptr [ebp-116]
	mov       edx,dword ptr [ebp-112]
	call      __lludiv
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	jmp       short @281
	?debug L 926
@279:
	mov       dword ptr [ebp-116],0
	mov       dword ptr [ebp-112],0
	?debug L 927
@281:
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
@282:
	inc       ebx
	cmp       ebx,5
	jb        @264
	?debug L 929
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
	?debug L 930
?live16402@416: ; EBX = i, ECX = imax, ESI = imin
@284:
	push      8
	push      -172
	push      ebx
	push      3
	push      0
	call      _CG_LDA_EOXSY
	mov       eax,dword ptr [ebp+8*ebx-172]
	mov       edx,dword ptr [ebp+8*ebx-168]
	cmp       edx,dword ptr [ebp-28]
	jne       short @287
	cmp       eax,dword ptr [ebp-32]
@287:
	jbe       short @286
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
	?debug L 931
@286:
	push      8
	push      -172
	push      ebx
	push      3
	push      0
	call      _CG_LDA_EOXSY
	mov       eax,dword ptr [ebp+8*ebx-172]
	mov       edx,dword ptr [ebp+8*ebx-168]
	cmp       edx,dword ptr [ebp-40]
	jne       short @289
	cmp       eax,dword ptr [ebp-44]
@289:
	jae       short @288
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
@288:
	inc       ebx
	cmp       ebx,5
	jb        @284
	?debug L 933
?live16402@448: ; ECX = imax, ESI = imin
	mov       dword ptr [ebp-116],0
	mov       dword ptr [ebp-112],0
	xor       ebx,ebx
@291:
	cmp       esi,ebx
	je        short @293
	cmp       ecx,ebx
	je        short @293
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
@293:
	inc       ebx
	cmp       ebx,5
	jb        short @291
	?debug L 935
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
	?debug L 936
	mov       eax,dword ptr [ebp-116]
	mov       ecx,eax
	mov       dword ptr [$apmofcia],ecx
	?debug L 938
?live16402@496: ; ECX = @temp17
	mov       dword ptr [$icnofcia],0
	mov       dword ptr [$icnofcia+4],0
	?debug L 939
	mov       eax,ecx
	?debug L 940
?live16402@528: ; 
@295:
@254:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@251:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_num_mhz$qo+0
	dd        @251+0
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
	df	$icnofcia
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
	df	$apmofcia
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
	df	@269
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
?patch80	equ	@282-@269
	dw	2
	dw	6
?patch71	equ	@295-@@stk@cpu@cpu_num_mhz$qo+131
?patch72	equ	0
?patch73	equ	@295-@@stk@cpu@cpu_num_mhz$qo
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
$imnofcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aaoofcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_x87$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_x87$qv	proc	near
?live16403@0:
	?debug L 945
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @296
@297:
	mov       ebx,offset $aaoofcia
	?debug L 951
?live16403@16: ; EBX = &$aaoofcia
	mov       eax,dword ptr [$imnofcia]
	cmp       eax,-1
	je        short @301
	?debug L 952
?live16403@32: ; EAX = @temp2
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @299
	?debug L 954
?live16403@48: ; EBX = &$aaoofcia
@300:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@301:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @300
	cmp       dword ptr [ebx],0
	jne       short @300
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
	jmp       short @304
@303:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@304:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @307
	cmp       dword ptr [ebx],0
@307:
	je        short @305
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @308
	cmp       eax,dword ptr [ebp-20]
@308:
	setne     al
	and       eax,1
	jmp       short @306
@305:
	xor       eax,eax
@306:
	test      al,al
	jne       short @303
	?debug L 957
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
	?debug L 959
	test      byte ptr [ebp-28],1
	je        short @309
	?debug L 960
	mov       dword ptr [$imnofcia],1
	?debug L 961
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 962
?live16403@128: ; 
	mov       al,1
	jmp       short @299
	?debug L 966
?live16403@144: ; EBX = &$aaoofcia
@309:
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
	?debug L 968
	test      byte ptr [ebp-28],1
	je        short @310
	?debug L 969
	mov       dword ptr [$imnofcia],1
	?debug L 970
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 971
?live16403@208: ; 
	mov       al,1
	jmp       short @299
	?debug L 973
?live16403@224: ; EBX = &$aaoofcia
@310:
	xor       edx,edx
	mov       dword ptr [$imnofcia],edx
	?debug L 974
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 975
?live16403@256: ; 
	xor       eax,eax
	?debug L 974
?live16403@272: ; EBX = &$aaoofcia
	mov       dword ptr [ebx+4],0
	?debug L 976
?live16403@288: ; 
@311:
@299:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@296:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_x87$qv+0
	dd        @296+0
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
	df	$aaoofcia
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
	df	$imnofcia
	dw	0
	dw	117
	dw	0
	dw	147
	dw	0
	dw	0
	dw	0
?patch83	equ	@311-@@stk@cpu@cpu_has_x87$qv+72
?patch84	equ	0
?patch85	equ	@311-@@stk@cpu@cpu_has_x87$qv
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
$idoofcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ahoofcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_mmx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mmx$qv	proc	near
?live16404@0:
	?debug L 979
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @312
@313:
	mov       ebx,offset $ahoofcia
	?debug L 985
?live16404@16: ; EBX = &$ahoofcia
	mov       eax,dword ptr [$idoofcia]
	cmp       eax,-1
	je        short @317
	?debug L 986
?live16404@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @315
	?debug L 988
?live16404@48: ; EBX = &$ahoofcia
@316:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@317:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @316
	cmp       dword ptr [ebx],0
	jne       short @316
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
	jmp       short @320
@319:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@320:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @323
	cmp       dword ptr [ebx],0
@323:
	je        short @321
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @324
	cmp       eax,dword ptr [ebp-20]
@324:
	setne     al
	and       eax,1
	jmp       short @322
@321:
	xor       eax,eax
@322:
	test      al,al
	jne       short @319
	?debug L 991
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
	?debug L 993
	mov       eax,dword ptr [ebp-28]
	and       eax,8388608
	mov       dword ptr [$idoofcia],eax
	?debug L 994
?live16404@96: ; EBX = &$ahoofcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 995
?live16404@112: ; EBX = &$ahoofcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 997
?live16404@128: ; 
@325:
@315:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@312:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_mmx$qv+0
	dd        @312+0
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
	dd	?live16404@112-@@stk@cpu@cpu_has_mmx$qv
	dd	?live16404@128-?live16404@112
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
	df	$ahoofcia
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
	df	$idoofcia
	dw	0
	dw	117
	dw	0
	dw	156
	dw	0
	dw	0
	dw	0
?patch86	equ	@325-@@stk@cpu@cpu_has_mmx$qv+72
?patch87	equ	0
?patch88	equ	@325-@@stk@cpu@cpu_has_mmx$qv
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
$ikoofcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aooofcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_mmxext$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mmxext$qv	proc	near
?live16405@0:
	?debug L 1000
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @326
@327:
	mov       ebx,offset $aooofcia
	?debug L 1006
?live16405@16: ; EBX = &$aooofcia
	mov       eax,dword ptr [$ikoofcia]
	cmp       eax,-1
	je        short @331
	?debug L 1007
?live16405@32: ; EAX = @temp5
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @329
	?debug L 1009
?live16405@48: ; EBX = &$aooofcia
@330:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@331:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @330
	cmp       dword ptr [ebx],0
	jne       short @330
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
	jmp       short @334
@333:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@334:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @337
	cmp       dword ptr [ebx],0
@337:
	je        short @335
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @338
	cmp       eax,dword ptr [ebp-20]
@338:
	setne     al
	and       eax,1
	jmp       short @336
@335:
	xor       eax,eax
@336:
	test      al,al
	jne       short @333
	?debug L 1012
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
	?debug L 1014
	mov       eax,dword ptr [ebp-28]
	and       eax,4194304
	mov       dword ptr [$ikoofcia],eax
	?debug L 1015
?live16405@96: ; EBX = &$aooofcia, EAX = @temp3
	test      eax,eax
	je        short @339
	?debug L 1016
?live16405@112: ; 
	mov       al,1
	jmp       short @329
	?debug L 1018
?live16405@128: ; EBX = &$aooofcia
@339:
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
	?debug L 1020
	mov       eax,dword ptr [ebp-28]
	and       eax,33554432
	mov       dword ptr [$ikoofcia],eax
	?debug L 1021
?live16405@160: ; EBX = &$aooofcia, EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1022
?live16405@176: ; EBX = &$aooofcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1024
?live16405@192: ; 
@340:
@329:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@326:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_mmxext$qv+0
	dd        @326+0
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
	dd	?live16405@176-@@stk@cpu@cpu_has_mmxext$qv
	dd	?live16405@192-?live16405@176
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
	df	$aooofcia
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
	df	$ikoofcia
	dw	0
	dw	117
	dw	0
	dw	165
	dw	0
	dw	0
	dw	0
?patch91	equ	@340-@@stk@cpu@cpu_has_mmxext$qv+72
?patch92	equ	0
?patch93	equ	@340-@@stk@cpu@cpu_has_mmxext$qv
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
$ibpofcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$afpofcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_amd64$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_amd64$qv	proc	near
?live16406@0:
	?debug L 1027
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @341
@342:
	mov       ebx,offset $afpofcia
	?debug L 1033
?live16406@16: ; EBX = &$afpofcia
	mov       eax,dword ptr [$ibpofcia]
	cmp       eax,-1
	je        short @346
	?debug L 1034
?live16406@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @344
	?debug L 1036
?live16406@48: ; EBX = &$afpofcia
@345:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@346:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @345
	cmp       dword ptr [ebx],0
	jne       short @345
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
	jmp       short @349
@348:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@349:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @352
	cmp       dword ptr [ebx],0
@352:
	je        short @350
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @353
	cmp       eax,dword ptr [ebp-20]
@353:
	setne     al
	and       eax,1
	jmp       short @351
@350:
	xor       eax,eax
@351:
	test      al,al
	jne       short @348
	?debug L 1039
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
	?debug L 1041
	mov       eax,dword ptr [ebp-28]
	and       eax,536870912
	mov       dword ptr [$ibpofcia],eax
	?debug L 1042
?live16406@96: ; EBX = &$afpofcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1043
?live16406@112: ; EBX = &$afpofcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1045
?live16406@128: ; 
@354:
@344:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@341:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_amd64$qv+0
	dd        @341+0
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
	dd	?live16406@112-@@stk@cpu@cpu_has_amd64$qv
	dd	?live16406@128-?live16406@112
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
	df	$afpofcia
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
	df	$ibpofcia
	dw	0
	dw	117
	dw	0
	dw	174
	dw	0
	dw	0
	dw	0
?patch96	equ	@354-@@stk@cpu@cpu_has_amd64$qv+73
?patch97	equ	0
?patch98	equ	@354-@@stk@cpu@cpu_has_amd64$qv
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
$iipofcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ampofcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_ht$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_ht$qv	proc	near
?live16407@0:
	?debug L 1048
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @355
@356:
	mov       ebx,offset $ampofcia
	?debug L 1054
?live16407@16: ; EBX = &$ampofcia
	mov       eax,dword ptr [$iipofcia]
	cmp       eax,-1
	je        short @360
	?debug L 1055
?live16407@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @358
	?debug L 1057
?live16407@48: ; EBX = &$ampofcia
@359:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@360:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @359
	cmp       dword ptr [ebx],0
	jne       short @359
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
	jmp       short @363
@362:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@363:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @366
	cmp       dword ptr [ebx],0
@366:
	je        short @364
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @367
	cmp       eax,dword ptr [ebp-20]
@367:
	setne     al
	and       eax,1
	jmp       short @365
@364:
	xor       eax,eax
@365:
	test      al,al
	jne       short @362
	?debug L 1060
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
	?debug L 1062
	mov       eax,dword ptr [ebp-28]
	and       eax,268435456
	mov       dword ptr [$iipofcia],eax
	?debug L 1063
?live16407@96: ; EBX = &$ampofcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1064
?live16407@112: ; EBX = &$ampofcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1066
?live16407@128: ; 
@368:
@358:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@355:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_ht$qv+0
	dd        @355+0
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
	dd	?live16407@112-@@stk@cpu@cpu_has_ht$qv
	dd	?live16407@128-?live16407@112
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
	df	$ampofcia
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
	df	$iipofcia
	dw	0
	dw	117
	dw	0
	dw	183
	dw	0
	dw	0
	dw	0
?patch101	equ	@368-@@stk@cpu@cpu_has_ht$qv+72
?patch102	equ	0
?patch103	equ	@368-@@stk@cpu@cpu_has_ht$qv
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
$ippofcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$adapfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sse$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sse$qv	proc	near
?live16408@0:
	?debug L 1069
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @369
@370:
	mov       ebx,offset $adapfcia
	mov       esi,offset $ippofcia
	?debug L 1075
?live16408@16: ; EBX = &$adapfcia, ESI = &$ippofcia
	push      4
	push      esi
	call      _CG_D_EP
	mov       eax,dword ptr [esi]
	cmp       eax,-1
	jne       @372
	?debug L 1076
?live16408@32: ; EAX = @temp3, ESI = &$ippofcia
	jmp       short @374
	?debug L 1078
?live16408@48: ; EBX = &$adapfcia, ESI = &$ippofcia
@373:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@374:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @373
	cmp       dword ptr [ebx],0
	jne       short @373
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
	jmp       short @377
@376:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@377:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @380
	cmp       dword ptr [ebx],0
@380:
	je        short @378
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @381
	cmp       eax,dword ptr [ebp-20]
@381:
	setne     cl
	and       ecx,1
	jmp       short @379
@378:
	xor       ecx,ecx
@379:
	test      cl,cl
	jne       short @376
	?debug L 1081
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
	?debug L 1083
	test      byte ptr [ebp-34],16
	je        short @382
	?debug L 1084
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],42
	jmp       short @383
	?debug L 1086
@382:
	test      byte ptr [ebp-34],8
	je        short @384
	?debug L 1087
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],41
	jmp       short @383
	?debug L 1089
@384:
	test      byte ptr [ebp-35],2
	je        short @385
	?debug L 1090
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],31
	jmp       short @383
	?debug L 1092
@385:
	test      byte ptr [ebp-36],1
	je        short @386
	?debug L 1093
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],30
	jmp       short @383
	?debug L 1095
@386:
	test      byte ptr [ebp-25],4
	je        short @387
	?debug L 1096
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],20
	jmp       short @383
	?debug L 1098
@387:
	test      byte ptr [ebp-25],2
	je        short @388
	?debug L 1099
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],10
	jmp       short @383
	?debug L 1101
@388:
	push      4
	push      esi
	call      _CG_D_EP
	xor       ecx,ecx
	mov       dword ptr [esi],ecx
	?debug L 1102
@383:
	push      4
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi],0
	setne     al
	and       eax,1
	?debug L 1103
?live16408@304: ; EBX = &$adapfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1104
?live16408@320: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	?debug L 1103
?live16408@336: ; EBX = &$adapfcia, EAX = ret
	mov       dword ptr [ebx+4],0
	?debug L 1104
?live16408@352: ; EAX = ret
	mov       eax,edx
	?debug L 1105
?live16408@368: ; 
@389:
@372:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@369:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_sse$qv+0
	dd        @369+0
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
	dd	?live16408@368-?live16408@304
	dw	1
?patch110	equ	1
?patch109	equ	14
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
	df	$adapfcia
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
	df	$ippofcia
	dw	0
	dw	117
	dw	0
	dw	192
	dw	0
	dw	0
	dw	0
?patch106	equ	@389-@@stk@cpu@cpu_has_sse$qv+74
?patch107	equ	0
?patch108	equ	@389-@@stk@cpu@cpu_has_sse$qv
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
$igapfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$akapfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sse4a$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sse4a$qv	proc	near
?live16409@0:
	?debug L 1108
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @390
@391:
	mov       ebx,offset $akapfcia
	?debug L 1114
?live16409@16: ; EBX = &$akapfcia
	mov       eax,dword ptr [$igapfcia]
	cmp       eax,-1
	je        short @395
	?debug L 1115
?live16409@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @393
	?debug L 1117
?live16409@48: ; EBX = &$akapfcia
@394:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@395:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @394
	cmp       dword ptr [ebx],0
	jne       short @394
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
	jmp       short @398
@397:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@398:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @401
	cmp       dword ptr [ebx],0
@401:
	je        short @399
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @402
	cmp       eax,dword ptr [ebp-20]
@402:
	setne     al
	and       eax,1
	jmp       short @400
@399:
	xor       eax,eax
@400:
	test      al,al
	jne       short @397
	?debug L 1120
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
	?debug L 1122
	mov       eax,dword ptr [ebp-36]
	and       eax,64
	mov       dword ptr [$igapfcia],eax
	?debug L 1123
?live16409@96: ; EBX = &$akapfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1124
?live16409@112: ; EBX = &$akapfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1126
?live16409@128: ; 
@403:
@393:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@390:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_sse4a$qv+0
	dd        @390+0
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
	dd	?live16409@112-@@stk@cpu@cpu_has_sse4a$qv
	dd	?live16409@128-?live16409@112
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
	df	$akapfcia
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
	df	$igapfcia
	dw	0
	dw	117
	dw	0
	dw	201
	dw	0
	dw	0
	dw	0
?patch111	equ	@403-@@stk@cpu@cpu_has_sse4a$qv+75
?patch112	equ	0
?patch113	equ	@403-@@stk@cpu@cpu_has_sse4a$qv
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
$inapfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$abbpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx$qv	proc	near
?live16410@0:
	?debug L 1129
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @404
@405:
	mov       ebx,offset $abbpfcia
	?debug L 1135
?live16410@16: ; EBX = &$abbpfcia
	mov       eax,dword ptr [$inapfcia]
	cmp       eax,-1
	jne       @407
	?debug L 1136
?live16410@32: ; EAX = @temp3
	jmp       short @409
	?debug L 1138
?live16410@48: ; EBX = &$abbpfcia
@408:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@409:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @408
	cmp       dword ptr [ebx],0
	jne       short @408
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
	jmp       short @412
@411:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@412:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @415
	cmp       dword ptr [ebx],0
@415:
	je        short @413
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @416
	cmp       eax,dword ptr [ebp-20]
@416:
	setne     cl
	and       ecx,1
	jmp       short @414
@413:
	xor       ecx,ecx
@414:
	test      cl,cl
	jne       short @411
	?debug L 1141
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
	?debug L 1143
	test      byte ptr [ebp-33],16
	je        short @417
	?debug L 1144
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
	?debug L 1145
	test      byte ptr [ebp-44],32
	je        short @418
	?debug L 1146
	mov       dword ptr [$inapfcia],2
	jmp       short @419
	?debug L 1148
@418:
	mov       dword ptr [$inapfcia],1
	?debug L 1149
	jmp       short @419
	?debug L 1151
@417:
	xor       eax,eax
	mov       dword ptr [$inapfcia],eax
	?debug L 1153
@419:
	cmp       dword ptr [$inapfcia],0
	setne     al
	and       eax,1
	?debug L 1154
?live16410@208: ; EBX = &$abbpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1155
?live16410@224: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	?debug L 1154
?live16410@240: ; EBX = &$abbpfcia, EAX = ret
	mov       dword ptr [ebx+4],0
	?debug L 1155
?live16410@256: ; EAX = ret
	mov       eax,edx
	?debug L 1156
?live16410@272: ; 
@420:
@407:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@404:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx$qv+0
	dd        @404+0
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
	dd	?live16410@272-?live16410@208
	dw	1
?patch120	equ	1
?patch119	equ	14
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
	df	$abbpfcia
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
	df	$inapfcia
	dw	0
	dw	117
	dw	0
	dw	210
	dw	0
	dw	0
	dw	0
?patch116	equ	@420-@@stk@cpu@cpu_has_avx$qv+74
?patch117	equ	0
?patch118	equ	@420-@@stk@cpu@cpu_has_avx$qv
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
$iebpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aibpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_popcnt$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_popcnt$qv	proc	near
?live16411@0:
	?debug L 1159
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @421
@422:
	mov       ebx,offset $aibpfcia
	?debug L 1165
?live16411@16: ; EBX = &$aibpfcia
	mov       eax,dword ptr [$iebpfcia]
	cmp       eax,-1
	je        short @426
	?debug L 1166
?live16411@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @424
	?debug L 1168
?live16411@48: ; EBX = &$aibpfcia
@425:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@426:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @425
	cmp       dword ptr [ebx],0
	jne       short @425
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
	jmp       short @429
@428:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@429:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @432
	cmp       dword ptr [ebx],0
@432:
	je        short @430
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @433
	cmp       eax,dword ptr [ebp-20]
@433:
	setne     al
	and       eax,1
	jmp       short @431
@430:
	xor       eax,eax
@431:
	test      al,al
	jne       short @428
	?debug L 1171
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
	?debug L 1173
	mov       eax,dword ptr [ebp-36]
	and       eax,8388608
	mov       dword ptr [$iebpfcia],eax
	?debug L 1174
?live16411@96: ; EBX = &$aibpfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1175
?live16411@112: ; EBX = &$aibpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1177
?live16411@128: ; 
@434:
@424:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@421:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_popcnt$qv+0
	dd        @421+0
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
	dd	?live16411@112-@@stk@cpu@cpu_has_popcnt$qv
	dd	?live16411@128-?live16411@112
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
	df	$aibpfcia
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
	df	$iebpfcia
	dw	0
	dw	117
	dw	0
	dw	219
	dw	0
	dw	0
	dw	0
?patch121	equ	@434-@@stk@cpu@cpu_has_popcnt$qv+72
?patch122	equ	0
?patch123	equ	@434-@@stk@cpu@cpu_has_popcnt$qv
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
$ilbpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$apbpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_f16c$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_f16c$qv	proc	near
?live16412@0:
	?debug L 1180
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @435
@436:
	mov       ebx,offset $apbpfcia
	?debug L 1186
?live16412@16: ; EBX = &$apbpfcia
	mov       eax,dword ptr [$ilbpfcia]
	cmp       eax,-1
	je        short @440
	?debug L 1187
?live16412@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @438
	?debug L 1189
?live16412@48: ; EBX = &$apbpfcia
@439:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@440:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @439
	cmp       dword ptr [ebx],0
	jne       short @439
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
	jmp       short @443
@442:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@443:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @446
	cmp       dword ptr [ebx],0
@446:
	je        short @444
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @447
	cmp       eax,dword ptr [ebp-20]
@447:
	setne     al
	and       eax,1
	jmp       short @445
@444:
	xor       eax,eax
@445:
	test      al,al
	jne       short @442
	?debug L 1192
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
	?debug L 1194
	mov       eax,dword ptr [ebp-36]
	and       eax,536870912
	mov       dword ptr [$ilbpfcia],eax
	?debug L 1195
?live16412@96: ; EBX = &$apbpfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1196
?live16412@112: ; EBX = &$apbpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1198
?live16412@128: ; 
@448:
@438:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@435:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_f16c$qv+0
	dd        @435+0
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
	dd	?live16412@112-@@stk@cpu@cpu_has_f16c$qv
	dd	?live16412@128-?live16412@112
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
	df	$apbpfcia
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
	df	$ilbpfcia
	dw	0
	dw	117
	dw	0
	dw	228
	dw	0
	dw	0
	dw	0
?patch126	equ	@448-@@stk@cpu@cpu_has_f16c$qv+72
?patch127	equ	0
?patch128	equ	@448-@@stk@cpu@cpu_has_f16c$qv
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
$iccpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$agcpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_cmpxchg$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_cmpxchg$qv	proc	near
?live16413@0:
	?debug L 1201
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @449
@450:
	mov       ebx,offset $agcpfcia
	?debug L 1207
?live16413@16: ; EBX = &$agcpfcia
	mov       eax,dword ptr [$iccpfcia]
	cmp       eax,-1
	jne       @452
	?debug L 1208
?live16413@32: ; EAX = @temp2
	jmp       short @454
	?debug L 1210
?live16413@48: ; EBX = &$agcpfcia
@453:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@454:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @453
	cmp       dword ptr [ebx],0
	jne       short @453
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
	jmp       short @457
@456:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@457:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @460
	cmp       dword ptr [ebx],0
@460:
	je        short @458
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @461
	cmp       eax,dword ptr [ebp-20]
@461:
	setne     cl
	and       ecx,1
	jmp       short @459
@458:
	xor       ecx,ecx
@459:
	test      cl,cl
	jne       short @456
	?debug L 1213
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
	?debug L 1215
	test      byte ptr [ebp-35],32
	je        short @462
	?debug L 1216
	mov       dword ptr [$iccpfcia],16
	?debug L 1217
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1218
?live16413@128: ; 
	mov       eax,16
	jmp       @452
	?debug L 1220
?live16413@144: ; EBX = &$agcpfcia
@462:
	test      byte ptr [ebp-27],1
	je        short @463
	?debug L 1221
	mov       dword ptr [$iccpfcia],8
	?debug L 1222
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1223
?live16413@192: ; 
	mov       eax,8
	jmp       short @452
	?debug L 1227
?live16413@208: ; EBX = &$agcpfcia
@463:
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
	?debug L 1229
	test      byte ptr [ebp-27],1
	je        short @464
	?debug L 1230
	mov       dword ptr [$iccpfcia],8
	?debug L 1231
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1232
?live16413@272: ; 
	mov       eax,8
	jmp       short @452
	?debug L 1234
?live16413@288: ; EBX = &$agcpfcia
@464:
	mov       dword ptr [$iccpfcia],1
	?debug L 1235
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1236
?live16413@320: ; 
	mov       eax,1
	?debug L 1235
?live16413@336: ; EBX = &$agcpfcia
	mov       dword ptr [ebx+4],0
	?debug L 1237
?live16413@352: ; 
@465:
@452:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@449:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_cmpxchg$qv+0
	dd        @449+0
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
	df	$agcpfcia
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
	df	$iccpfcia
	dw	0
	dw	117
	dw	0
	dw	236
	dw	0
	dw	0
	dw	0
?patch131	equ	@465-@@stk@cpu@cpu_has_cmpxchg$qv+75
?patch132	equ	0
?patch133	equ	@465-@@stk@cpu@cpu_has_cmpxchg$qv
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
$ijcpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ancpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_vmx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_vmx$qv	proc	near
?live16414@0:
	?debug L 1240
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @466
@467:
	mov       ebx,offset $ancpfcia
	?debug L 1246
?live16414@16: ; EBX = &$ancpfcia
	mov       eax,dword ptr [$ijcpfcia]
	cmp       eax,-1
	je        short @471
	?debug L 1247
?live16414@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @469
	?debug L 1249
?live16414@48: ; EBX = &$ancpfcia
@470:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@471:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @470
	cmp       dword ptr [ebx],0
	jne       short @470
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
	jmp       short @474
@473:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@474:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @477
	cmp       dword ptr [ebx],0
@477:
	je        short @475
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @478
	cmp       eax,dword ptr [ebp-20]
@478:
	setne     al
	and       eax,1
	jmp       short @476
@475:
	xor       eax,eax
@476:
	test      al,al
	jne       short @473
	?debug L 1252
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
	?debug L 1254
	mov       eax,dword ptr [ebp-36]
	and       eax,32
	mov       dword ptr [$ijcpfcia],eax
	?debug L 1255
?live16414@96: ; EBX = &$ancpfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1256
?live16414@112: ; EBX = &$ancpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1258
?live16414@128: ; 
@479:
@469:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@466:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_vmx$qv+0
	dd        @466+0
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
	dd	?live16414@112-@@stk@cpu@cpu_has_vmx$qv
	dd	?live16414@128-?live16414@112
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
	df	$ancpfcia
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
	df	$ijcpfcia
	dw	0
	dw	117
	dw	0
	dw	245
	dw	0
	dw	0
	dw	0
?patch134	equ	@479-@@stk@cpu@cpu_has_vmx$qv+74
?patch135	equ	0
?patch136	equ	@479-@@stk@cpu@cpu_has_vmx$qv
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
$iadpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aedpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_smx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_smx$qv	proc	near
?live16415@0:
	?debug L 1261
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @480
@481:
	mov       ebx,offset $aedpfcia
	?debug L 1267
?live16415@16: ; EBX = &$aedpfcia
	mov       eax,dword ptr [$iadpfcia]
	cmp       eax,-1
	je        short @485
	?debug L 1268
?live16415@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @483
	?debug L 1270
?live16415@48: ; EBX = &$aedpfcia
@484:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@485:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @484
	cmp       dword ptr [ebx],0
	jne       short @484
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
	jmp       short @488
@487:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@488:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @491
	cmp       dword ptr [ebx],0
@491:
	je        short @489
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @492
	cmp       eax,dword ptr [ebp-20]
@492:
	setne     al
	and       eax,1
	jmp       short @490
@489:
	xor       eax,eax
@490:
	test      al,al
	jne       short @487
	?debug L 1273
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
	?debug L 1275
	mov       eax,dword ptr [ebp-36]
	and       eax,64
	mov       dword ptr [$iadpfcia],eax
	?debug L 1276
?live16415@96: ; EBX = &$aedpfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1277
?live16415@112: ; EBX = &$aedpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1279
?live16415@128: ; 
@493:
@483:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@480:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_smx$qv+0
	dd        @480+0
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
	dd	?live16415@112-@@stk@cpu@cpu_has_smx$qv
	dd	?live16415@128-?live16415@112
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
	df	$aedpfcia
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
	df	$iadpfcia
	dw	0
	dw	117
	dw	0
	dw	254
	dw	0
	dw	0
	dw	0
?patch139	equ	@493-@@stk@cpu@cpu_has_smx$qv+74
?patch140	equ	0
?patch141	equ	@493-@@stk@cpu@cpu_has_smx$qv
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
$ihdpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aldpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_cmov$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_cmov$qv	proc	near
?live16416@0:
	?debug L 1282
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @494
@495:
	mov       ebx,offset $aldpfcia
	?debug L 1288
?live16416@16: ; EBX = &$aldpfcia
	mov       eax,dword ptr [$ihdpfcia]
	cmp       eax,-1
	je        short @499
	?debug L 1289
?live16416@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @497
	?debug L 1291
?live16416@48: ; EBX = &$aldpfcia
@498:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@499:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @498
	cmp       dword ptr [ebx],0
	jne       short @498
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
	jmp       short @502
@501:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@502:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @505
	cmp       dword ptr [ebx],0
@505:
	je        short @503
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @506
	cmp       eax,dword ptr [ebp-20]
@506:
	setne     al
	and       eax,1
	jmp       short @504
@503:
	xor       eax,eax
@504:
	test      al,al
	jne       short @501
	?debug L 1294
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
	?debug L 1296
	mov       eax,dword ptr [ebp-28]
	and       eax,32768
	mov       dword ptr [$ihdpfcia],eax
	?debug L 1297
?live16416@96: ; EBX = &$aldpfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1298
?live16416@112: ; EBX = &$aldpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1300
?live16416@128: ; 
@507:
@497:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@494:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_cmov$qv+0
	dd        @494+0
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
	dd	?live16416@112-@@stk@cpu@cpu_has_cmov$qv
	dd	?live16416@128-?live16416@112
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
	df	$aldpfcia
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
	df	$ihdpfcia
	dw	0
	dw	117
	dw	0
	dw	263
	dw	0
	dw	0
	dw	0
?patch144	equ	@507-@@stk@cpu@cpu_has_cmov$qv+72
?patch145	equ	0
?patch146	equ	@507-@@stk@cpu@cpu_has_cmov$qv
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
$iodpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$acepfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_movbe$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_movbe$qv	proc	near
?live16417@0:
	?debug L 1303
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @508
@509:
	mov       ebx,offset $acepfcia
	?debug L 1309
?live16417@16: ; EBX = &$acepfcia
	mov       eax,dword ptr [$iodpfcia]
	cmp       eax,-1
	je        short @513
	?debug L 1310
?live16417@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @511
	?debug L 1312
?live16417@48: ; EBX = &$acepfcia
@512:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@513:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @512
	cmp       dword ptr [ebx],0
	jne       short @512
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
	jmp       short @516
@515:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@516:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @519
	cmp       dword ptr [ebx],0
@519:
	je        short @517
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @520
	cmp       eax,dword ptr [ebp-20]
@520:
	setne     al
	and       eax,1
	jmp       short @518
@517:
	xor       eax,eax
@518:
	test      al,al
	jne       short @515
	?debug L 1315
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
	?debug L 1317
	mov       eax,dword ptr [ebp-36]
	and       eax,4194304
	mov       dword ptr [$iodpfcia],eax
	?debug L 1318
?live16417@96: ; EBX = &$acepfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1319
?live16417@112: ; EBX = &$acepfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1321
?live16417@128: ; 
@521:
@511:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@508:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_movbe$qv+0
	dd        @508+0
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
	dd	?live16417@112-@@stk@cpu@cpu_has_movbe$qv
	dd	?live16417@128-?live16417@112
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
	df	$acepfcia
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
	df	$iodpfcia
	dw	0
	dw	117
	dw	0
	dw	272
	dw	0
	dw	0
	dw	0
?patch149	equ	@521-@@stk@cpu@cpu_has_movbe$qv+72
?patch150	equ	0
?patch151	equ	@521-@@stk@cpu@cpu_has_movbe$qv
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
$ifepfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ajepfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_bmi$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_bmi$qv	proc	near
?live16418@0:
	?debug L 1324
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @522
@523:
	mov       ebx,offset $ajepfcia
	?debug L 1330
?live16418@16: ; EBX = &$ajepfcia
	mov       eax,dword ptr [$ifepfcia]
	cmp       eax,-1
	jne       @525
	?debug L 1331
?live16418@32: ; EAX = @temp3
	jmp       short @527
	?debug L 1333
?live16418@48: ; EBX = &$ajepfcia
@526:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@527:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @526
	cmp       dword ptr [ebx],0
	jne       short @526
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
	jmp       short @530
@529:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@530:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @533
	cmp       dword ptr [ebx],0
@533:
	je        short @531
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @534
	cmp       eax,dword ptr [ebp-20]
@534:
	setne     cl
	and       ecx,1
	jmp       short @532
@531:
	xor       ecx,ecx
@532:
	test      cl,cl
	jne       short @529
	?debug L 1336
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
	?debug L 1338
	test      byte ptr [ebp-43],1
	je        short @535
	?debug L 1339
	mov       dword ptr [$ifepfcia],2
	jmp       short @536
	?debug L 1341
@535:
	test      byte ptr [ebp-44],8
	je        short @537
	?debug L 1342
	mov       dword ptr [$ifepfcia],1
	jmp       short @536
	?debug L 1344
@537:
	xor       ecx,ecx
	mov       dword ptr [$ifepfcia],ecx
	?debug L 1345
@536:
	cmp       dword ptr [$ifepfcia],0
	setne     al
	and       eax,1
	?debug L 1346
?live16418@176: ; EBX = &$ajepfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1347
?live16418@192: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	?debug L 1346
?live16418@208: ; EBX = &$ajepfcia, EAX = ret
	mov       dword ptr [ebx+4],0
	?debug L 1347
?live16418@224: ; EAX = ret
	mov       eax,edx
	?debug L 1348
?live16418@240: ; 
@538:
@525:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@522:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_bmi$qv+0
	dd        @522+0
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
	dd	?live16418@240-?live16418@176
	dw	1
?patch158	equ	1
?patch157	equ	14
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
	df	$ajepfcia
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
	df	$ifepfcia
	dw	0
	dw	117
	dw	0
	dw	281
	dw	0
	dw	0
	dw	0
?patch154	equ	@538-@@stk@cpu@cpu_has_bmi$qv+73
?patch155	equ	0
?patch156	equ	@538-@@stk@cpu@cpu_has_bmi$qv
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
$imepfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aafpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_erms$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_erms$qv	proc	near
?live16419@0:
	?debug L 1351
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @539
@540:
	mov       ebx,offset $aafpfcia
	?debug L 1357
?live16419@16: ; EBX = &$aafpfcia
	mov       eax,dword ptr [$imepfcia]
	cmp       eax,-1
	je        short @544
	?debug L 1358
?live16419@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @542
	?debug L 1360
?live16419@48: ; EBX = &$aafpfcia
@543:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@544:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @543
	cmp       dword ptr [ebx],0
	jne       short @543
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
	jmp       short @547
@546:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@547:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @550
	cmp       dword ptr [ebx],0
@550:
	je        short @548
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @551
	cmp       eax,dword ptr [ebp-20]
@551:
	setne     al
	and       eax,1
	jmp       short @549
@548:
	xor       eax,eax
@549:
	test      al,al
	jne       short @546
	?debug L 1363
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
	?debug L 1365
	mov       eax,dword ptr [ebp-44]
	and       eax,512
	mov       dword ptr [$imepfcia],eax
	?debug L 1366
?live16419@96: ; EBX = &$aafpfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1367
?live16419@112: ; EBX = &$aafpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1369
?live16419@128: ; 
@552:
@542:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@539:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_erms$qv+0
	dd        @539+0
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
	dd	?live16419@112-@@stk@cpu@cpu_has_erms$qv
	dd	?live16419@128-?live16419@112
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
	df	$aafpfcia
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
	df	$imepfcia
	dw	0
	dw	117
	dw	0
	dw	290
	dw	0
	dw	0
	dw	0
?patch159	equ	@552-@@stk@cpu@cpu_has_erms$qv+72
?patch160	equ	0
?patch161	equ	@552-@@stk@cpu@cpu_has_erms$qv
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
$idfpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ahfpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_3dnow$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_3dnow$qv	proc	near
?live16420@0:
	?debug L 1372
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @553
@554:
	mov       ebx,offset $ahfpfcia
	?debug L 1378
?live16420@16: ; EBX = &$ahfpfcia
	mov       eax,dword ptr [$idfpfcia]
	cmp       eax,-1
	jne       @556
	?debug L 1379
?live16420@32: ; EAX = @temp3
	jmp       short @558
	?debug L 1381
?live16420@48: ; EBX = &$ahfpfcia
@557:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@558:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @557
	cmp       dword ptr [ebx],0
	jne       short @557
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
	jmp       short @561
@560:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@561:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @564
	cmp       dword ptr [ebx],0
@564:
	je        short @562
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @565
	cmp       eax,dword ptr [ebp-20]
@565:
	setne     cl
	and       ecx,1
	jmp       short @563
@562:
	xor       ecx,ecx
@563:
	test      cl,cl
	jne       short @560
	?debug L 1384
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
	?debug L 1386
	test      byte ptr [ebp-25],64
	je        short @566
	?debug L 1387
	mov       dword ptr [$idfpfcia],2
	jmp       short @567
	?debug L 1389
@566:
	test      byte ptr [ebp-25],-128
	je        short @568
	?debug L 1390
	mov       dword ptr [$idfpfcia],1
	jmp       short @567
	?debug L 1392
@568:
	xor       ecx,ecx
	mov       dword ptr [$idfpfcia],ecx
	?debug L 1393
@567:
	cmp       dword ptr [$idfpfcia],0
	setne     al
	and       eax,1
	?debug L 1394
?live16420@176: ; EBX = &$ahfpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1395
?live16420@192: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	?debug L 1394
?live16420@208: ; EBX = &$ahfpfcia, EAX = ret
	mov       dword ptr [ebx+4],0
	?debug L 1395
?live16420@224: ; EAX = ret
	mov       eax,edx
	?debug L 1396
?live16420@240: ; 
@569:
@556:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@553:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_3dnow$qv+0
	dd        @553+0
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
	dd	?live16420@240-?live16420@176
	dw	1
?patch168	equ	1
?patch167	equ	14
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
	df	$ahfpfcia
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
	df	$idfpfcia
	dw	0
	dw	117
	dw	0
	dw	299
	dw	0
	dw	0
	dw	0
?patch164	equ	@569-@@stk@cpu@cpu_has_3dnow$qv+74
?patch165	equ	0
?patch166	equ	@569-@@stk@cpu@cpu_has_3dnow$qv
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
$ikfpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aofpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_3dnowprefetch$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_3dnowprefetch$qv	proc	near
?live16421@0:
	?debug L 1399
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @570
@571:
	mov       ebx,offset $aofpfcia
	?debug L 1405
?live16421@16: ; EBX = &$aofpfcia
	mov       eax,dword ptr [$ikfpfcia]
	cmp       eax,-1
	je        short @575
	?debug L 1406
?live16421@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @573
	?debug L 1408
?live16421@48: ; EBX = &$aofpfcia
@574:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@575:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @574
	cmp       dword ptr [ebx],0
	jne       short @574
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
	jmp       short @578
@577:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@578:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @581
	cmp       dword ptr [ebx],0
@581:
	je        short @579
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @582
	cmp       eax,dword ptr [ebp-20]
@582:
	setne     al
	and       eax,1
	jmp       short @580
@579:
	xor       eax,eax
@580:
	test      al,al
	jne       short @577
	?debug L 1411
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
	?debug L 1413
	mov       eax,dword ptr [ebp-36]
	and       eax,256
	mov       dword ptr [$ikfpfcia],eax
	?debug L 1414
?live16421@96: ; EBX = &$aofpfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1415
?live16421@112: ; EBX = &$aofpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1417
?live16421@128: ; 
@583:
@573:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@570:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_3dnowprefetch$qv+0
	dd        @570+0
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
	dd	?live16421@112-@@stk@cpu@cpu_has_3dnowprefetch$qv
	dd	?live16421@128-?live16421@112
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
	df	$aofpfcia
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
	df	$ikfpfcia
	dw	0
	dw	117
	dw	0
	dw	308
	dw	0
	dw	0
	dw	0
?patch169	equ	@583-@@stk@cpu@cpu_has_3dnowprefetch$qv+73
?patch170	equ	0
?patch171	equ	@583-@@stk@cpu@cpu_has_3dnowprefetch$qv
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
$ibgpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$afgpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_perftsc$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_perftsc$qv	proc	near
?live16422@0:
	?debug L 1420
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @584
@585:
	mov       ebx,offset $afgpfcia
	?debug L 1426
?live16422@16: ; EBX = &$afgpfcia
	mov       eax,dword ptr [$ibgpfcia]
	cmp       eax,-1
	je        short @589
	?debug L 1427
?live16422@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @587
	?debug L 1429
?live16422@48: ; EBX = &$afgpfcia
@588:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@589:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @588
	cmp       dword ptr [ebx],0
	jne       short @588
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
	jmp       short @592
@591:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@592:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @595
	cmp       dword ptr [ebx],0
@595:
	je        short @593
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @596
	cmp       eax,dword ptr [ebp-20]
@596:
	setne     al
	and       eax,1
	jmp       short @594
@593:
	xor       eax,eax
@594:
	test      al,al
	jne       short @591
	?debug L 1432
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
	?debug L 1434
	mov       eax,dword ptr [ebp-28]
	and       eax,134217728
	mov       dword ptr [$ibgpfcia],eax
	?debug L 1435
?live16422@96: ; EBX = &$afgpfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1436
?live16422@112: ; EBX = &$afgpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1438
?live16422@128: ; 
@597:
@587:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@584:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_perftsc$qv+0
	dd        @584+0
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
	dd	?live16422@112-@@stk@cpu@cpu_has_perftsc$qv
	dd	?live16422@128-?live16422@112
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
	df	$afgpfcia
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
	df	$ibgpfcia
	dw	0
	dw	117
	dw	0
	dw	317
	dw	0
	dw	0
	dw	0
?patch174	equ	@597-@@stk@cpu@cpu_has_perftsc$qv+73
?patch175	equ	0
?patch176	equ	@597-@@stk@cpu@cpu_has_perftsc$qv
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
$iigpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$amgpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sha$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sha$qv	proc	near
?live16423@0:
	?debug L 1441
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @598
@599:
	mov       ebx,offset $amgpfcia
	?debug L 1447
?live16423@16: ; EBX = &$amgpfcia
	mov       eax,dword ptr [$iigpfcia]
	cmp       eax,-1
	je        short @603
	?debug L 1448
?live16423@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @601
	?debug L 1450
?live16423@48: ; EBX = &$amgpfcia
@602:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@603:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @602
	cmp       dword ptr [ebx],0
	jne       short @602
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
	jmp       short @606
@605:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@606:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @609
	cmp       dword ptr [ebx],0
@609:
	je        short @607
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @610
	cmp       eax,dword ptr [ebp-20]
@610:
	setne     al
	and       eax,1
	jmp       short @608
@607:
	xor       eax,eax
@608:
	test      al,al
	jne       short @605
	?debug L 1453
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
	?debug L 1455
	mov       eax,dword ptr [ebp-44]
	and       eax,536870912
	mov       dword ptr [$iigpfcia],eax
	?debug L 1456
?live16423@96: ; EBX = &$amgpfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1457
?live16423@112: ; EBX = &$amgpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1459
?live16423@128: ; 
@611:
@601:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@598:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_sha$qv+0
	dd        @598+0
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
	dd	?live16423@112-@@stk@cpu@cpu_has_sha$qv
	dd	?live16423@128-?live16423@112
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
	df	$amgpfcia
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
	df	$iigpfcia
	dw	0
	dw	117
	dw	0
	dw	326
	dw	0
	dw	0
	dw	0
?patch179	equ	@611-@@stk@cpu@cpu_has_sha$qv+72
?patch180	equ	0
?patch181	equ	@611-@@stk@cpu@cpu_has_sha$qv
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
$ipgpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$adhpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_xop$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_xop$qv	proc	near
?live16424@0:
	?debug L 1462
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @612
@613:
	mov       ebx,offset $adhpfcia
	?debug L 1468
?live16424@16: ; EBX = &$adhpfcia
	mov       eax,dword ptr [$ipgpfcia]
	cmp       eax,-1
	je        short @617
	?debug L 1469
?live16424@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @615
	?debug L 1471
?live16424@48: ; EBX = &$adhpfcia
@616:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@617:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @616
	cmp       dword ptr [ebx],0
	jne       short @616
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
	jmp       short @620
@619:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@620:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @623
	cmp       dword ptr [ebx],0
@623:
	je        short @621
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @624
	cmp       eax,dword ptr [ebp-20]
@624:
	setne     al
	and       eax,1
	jmp       short @622
@621:
	xor       eax,eax
@622:
	test      al,al
	jne       short @619
	?debug L 1474
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
	?debug L 1476
	mov       eax,dword ptr [ebp-36]
	and       eax,2048
	mov       dword ptr [$ipgpfcia],eax
	?debug L 1477
?live16424@96: ; EBX = &$adhpfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1478
?live16424@112: ; EBX = &$adhpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1480
?live16424@128: ; 
@625:
@615:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@612:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_xop$qv+0
	dd        @612+0
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
	dd	?live16424@112-@@stk@cpu@cpu_has_xop$qv
	dd	?live16424@128-?live16424@112
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
	df	$adhpfcia
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
	df	$ipgpfcia
	dw	0
	dw	117
	dw	0
	dw	335
	dw	0
	dw	0
	dw	0
?patch184	equ	@625-@@stk@cpu@cpu_has_xop$qv+73
?patch185	equ	0
?patch186	equ	@625-@@stk@cpu@cpu_has_xop$qv
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
$ighpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$akhpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512f$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512f$qv	proc	near
?live16425@0:
	?debug L 1483
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @626
@627:
	mov       ebx,offset $akhpfcia
	?debug L 1489
?live16425@16: ; EBX = &$akhpfcia
	mov       eax,dword ptr [$ighpfcia]
	cmp       eax,-1
	je        short @631
	?debug L 1490
?live16425@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @629
	?debug L 1492
?live16425@48: ; EBX = &$akhpfcia
@630:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@631:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @630
	cmp       dword ptr [ebx],0
	jne       short @630
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
	jmp       short @634
@633:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@634:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @637
	cmp       dword ptr [ebx],0
@637:
	je        short @635
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @638
	cmp       eax,dword ptr [ebp-20]
@638:
	setne     al
	and       eax,1
	jmp       short @636
@635:
	xor       eax,eax
@636:
	test      al,al
	jne       short @633
	?debug L 1495
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
	?debug L 1497
	mov       eax,dword ptr [ebp-44]
	and       eax,65536
	mov       dword ptr [$ighpfcia],eax
	?debug L 1498
?live16425@96: ; EBX = &$akhpfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1499
?live16425@112: ; EBX = &$akhpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1501
?live16425@128: ; 
@639:
@629:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@626:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512f$qv+0
	dd        @626+0
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
	dd	?live16425@112-@@stk@cpu@cpu_has_avx512f$qv
	dd	?live16425@128-?live16425@112
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
	df	$akhpfcia
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
	df	$ighpfcia
	dw	0
	dw	117
	dw	0
	dw	344
	dw	0
	dw	0
	dw	0
?patch189	equ	@639-@@stk@cpu@cpu_has_avx512f$qv+72
?patch190	equ	0
?patch191	equ	@639-@@stk@cpu@cpu_has_avx512f$qv
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
$inhpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$abipfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512bw$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512bw$qv	proc	near
?live16426@0:
	?debug L 1504
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @640
@641:
	mov       ebx,offset $abipfcia
	?debug L 1510
?live16426@16: ; EBX = &$abipfcia
	mov       eax,dword ptr [$inhpfcia]
	cmp       eax,-1
	je        short @645
	?debug L 1511
?live16426@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @643
	?debug L 1513
?live16426@48: ; EBX = &$abipfcia
@644:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@645:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @644
	cmp       dword ptr [ebx],0
	jne       short @644
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
	jmp       short @648
@647:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@648:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @651
	cmp       dword ptr [ebx],0
@651:
	je        short @649
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @652
	cmp       eax,dword ptr [ebp-20]
@652:
	setne     al
	and       eax,1
	jmp       short @650
@649:
	xor       eax,eax
@650:
	test      al,al
	jne       short @647
	?debug L 1516
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
	?debug L 1518
	mov       eax,dword ptr [ebp-44]
	and       eax,1073741824
	mov       dword ptr [$inhpfcia],eax
	?debug L 1519
?live16426@96: ; EBX = &$abipfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1520
?live16426@112: ; EBX = &$abipfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1522
?live16426@128: ; 
@653:
@643:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@640:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512bw$qv+0
	dd        @640+0
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
	dd	?live16426@112-@@stk@cpu@cpu_has_avx512bw$qv
	dd	?live16426@128-?live16426@112
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
	df	$abipfcia
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
	df	$inhpfcia
	dw	0
	dw	117
	dw	0
	dw	353
	dw	0
	dw	0
	dw	0
?patch194	equ	@653-@@stk@cpu@cpu_has_avx512bw$qv+72
?patch195	equ	0
?patch196	equ	@653-@@stk@cpu@cpu_has_avx512bw$qv
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
$ieipfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aiipfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512er$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512er$qv	proc	near
?live16427@0:
	?debug L 1525
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @654
@655:
	mov       ebx,offset $aiipfcia
	?debug L 1531
?live16427@16: ; EBX = &$aiipfcia
	mov       eax,dword ptr [$ieipfcia]
	cmp       eax,-1
	je        short @659
	?debug L 1532
?live16427@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @657
	?debug L 1534
?live16427@48: ; EBX = &$aiipfcia
@658:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@659:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @658
	cmp       dword ptr [ebx],0
	jne       short @658
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
	jmp       short @662
@661:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@662:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @665
	cmp       dword ptr [ebx],0
@665:
	je        short @663
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @666
	cmp       eax,dword ptr [ebp-20]
@666:
	setne     al
	and       eax,1
	jmp       short @664
@663:
	xor       eax,eax
@664:
	test      al,al
	jne       short @661
	?debug L 1537
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
	?debug L 1539
	mov       eax,dword ptr [ebp-44]
	and       eax,134217728
	mov       dword ptr [$ieipfcia],eax
	?debug L 1540
?live16427@96: ; EBX = &$aiipfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1541
?live16427@112: ; EBX = &$aiipfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1543
?live16427@128: ; 
@667:
@657:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@654:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512er$qv+0
	dd        @654+0
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
	dd	?live16427@112-@@stk@cpu@cpu_has_avx512er$qv
	dd	?live16427@128-?live16427@112
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
	df	$aiipfcia
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
	df	$ieipfcia
	dw	0
	dw	117
	dw	0
	dw	362
	dw	0
	dw	0
	dw	0
?patch199	equ	@667-@@stk@cpu@cpu_has_avx512er$qv+72
?patch200	equ	0
?patch201	equ	@667-@@stk@cpu@cpu_has_avx512er$qv
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
$ilipfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$apipfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512cd$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512cd$qv	proc	near
?live16428@0:
	?debug L 1546
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @668
@669:
	mov       ebx,offset $apipfcia
	?debug L 1552
?live16428@16: ; EBX = &$apipfcia
	mov       eax,dword ptr [$ilipfcia]
	cmp       eax,-1
	je        short @673
	?debug L 1553
?live16428@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @671
	?debug L 1555
?live16428@48: ; EBX = &$apipfcia
@672:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@673:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @672
	cmp       dword ptr [ebx],0
	jne       short @672
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
	jmp       short @676
@675:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@676:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @679
	cmp       dword ptr [ebx],0
@679:
	je        short @677
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @680
	cmp       eax,dword ptr [ebp-20]
@680:
	setne     al
	and       eax,1
	jmp       short @678
@677:
	xor       eax,eax
@678:
	test      al,al
	jne       short @675
	?debug L 1558
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
	?debug L 1560
	mov       eax,dword ptr [ebp-44]
	and       eax,268435456
	mov       dword ptr [$ilipfcia],eax
	?debug L 1561
?live16428@96: ; EBX = &$apipfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1562
?live16428@112: ; EBX = &$apipfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1564
?live16428@128: ; 
@681:
@671:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@668:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512cd$qv+0
	dd        @668+0
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
	dd	?live16428@112-@@stk@cpu@cpu_has_avx512cd$qv
	dd	?live16428@128-?live16428@112
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
	df	$apipfcia
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
	df	$ilipfcia
	dw	0
	dw	117
	dw	0
	dw	371
	dw	0
	dw	0
	dw	0
?patch204	equ	@681-@@stk@cpu@cpu_has_avx512cd$qv+72
?patch205	equ	0
?patch206	equ	@681-@@stk@cpu@cpu_has_avx512cd$qv
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
$icjpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$agjpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512pf$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512pf$qv	proc	near
?live16429@0:
	?debug L 1567
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @682
@683:
	mov       ebx,offset $agjpfcia
	?debug L 1573
?live16429@16: ; EBX = &$agjpfcia
	mov       eax,dword ptr [$icjpfcia]
	cmp       eax,-1
	je        short @687
	?debug L 1574
?live16429@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @685
	?debug L 1576
?live16429@48: ; EBX = &$agjpfcia
@686:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@687:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @686
	cmp       dword ptr [ebx],0
	jne       short @686
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
	jmp       short @690
@689:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@690:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @693
	cmp       dword ptr [ebx],0
@693:
	je        short @691
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @694
	cmp       eax,dword ptr [ebp-20]
@694:
	setne     al
	and       eax,1
	jmp       short @692
@691:
	xor       eax,eax
@692:
	test      al,al
	jne       short @689
	?debug L 1579
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
	?debug L 1581
	mov       eax,dword ptr [ebp-44]
	and       eax,67108864
	mov       dword ptr [$icjpfcia],eax
	?debug L 1582
?live16429@96: ; EBX = &$agjpfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1583
?live16429@112: ; EBX = &$agjpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1585
?live16429@128: ; 
@695:
@685:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@682:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512pf$qv+0
	dd        @682+0
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
	dd	?live16429@112-@@stk@cpu@cpu_has_avx512pf$qv
	dd	?live16429@128-?live16429@112
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
	df	$agjpfcia
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
	df	$icjpfcia
	dw	0
	dw	117
	dw	0
	dw	380
	dw	0
	dw	0
	dw	0
?patch209	equ	@695-@@stk@cpu@cpu_has_avx512pf$qv+72
?patch210	equ	0
?patch211	equ	@695-@@stk@cpu@cpu_has_avx512pf$qv
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
$ijjpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$anjpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512dq$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512dq$qv	proc	near
?live16430@0:
	?debug L 1588
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @696
@697:
	mov       ebx,offset $anjpfcia
	?debug L 1594
?live16430@16: ; EBX = &$anjpfcia
	mov       eax,dword ptr [$ijjpfcia]
	cmp       eax,-1
	je        short @701
	?debug L 1595
?live16430@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @699
	?debug L 1597
?live16430@48: ; EBX = &$anjpfcia
@700:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@701:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @700
	cmp       dword ptr [ebx],0
	jne       short @700
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
	jmp       short @704
@703:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@704:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @707
	cmp       dword ptr [ebx],0
@707:
	je        short @705
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @708
	cmp       eax,dword ptr [ebp-20]
@708:
	setne     al
	and       eax,1
	jmp       short @706
@705:
	xor       eax,eax
@706:
	test      al,al
	jne       short @703
	?debug L 1600
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
	?debug L 1602
	mov       eax,dword ptr [ebp-44]
	and       eax,131072
	mov       dword ptr [$ijjpfcia],eax
	?debug L 1603
?live16430@96: ; EBX = &$anjpfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1604
?live16430@112: ; EBX = &$anjpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1606
?live16430@128: ; 
@709:
@699:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@696:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512dq$qv+0
	dd        @696+0
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
	dd	?live16430@112-@@stk@cpu@cpu_has_avx512dq$qv
	dd	?live16430@128-?live16430@112
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
	df	$anjpfcia
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
	df	$ijjpfcia
	dw	0
	dw	117
	dw	0
	dw	389
	dw	0
	dw	0
	dw	0
?patch214	equ	@709-@@stk@cpu@cpu_has_avx512dq$qv+72
?patch215	equ	0
?patch216	equ	@709-@@stk@cpu@cpu_has_avx512dq$qv
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
$iakpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aekpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512vl$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512vl$qv	proc	near
?live16431@0:
	?debug L 1609
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @710
@711:
	mov       ebx,offset $aekpfcia
	?debug L 1615
?live16431@16: ; EBX = &$aekpfcia
	mov       eax,dword ptr [$iakpfcia]
	cmp       eax,-1
	je        short @715
	?debug L 1616
?live16431@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @713
	?debug L 1618
?live16431@48: ; EBX = &$aekpfcia
@714:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@715:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @714
	cmp       dword ptr [ebx],0
	jne       short @714
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
	jmp       short @718
@717:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@718:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @721
	cmp       dword ptr [ebx],0
@721:
	je        short @719
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @722
	cmp       eax,dword ptr [ebp-20]
@722:
	setne     al
	and       eax,1
	jmp       short @720
@719:
	xor       eax,eax
@720:
	test      al,al
	jne       short @717
	?debug L 1621
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
	?debug L 1623
	mov       eax,dword ptr [ebp-44]
	and       eax,-2147483648
	mov       dword ptr [$iakpfcia],eax
	?debug L 1624
?live16431@96: ; EBX = &$aekpfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1625
?live16431@112: ; EBX = &$aekpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1627
?live16431@128: ; 
@723:
@713:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@710:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512vl$qv+0
	dd        @710+0
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
	dd	?live16431@112-@@stk@cpu@cpu_has_avx512vl$qv
	dd	?live16431@128-?live16431@112
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
	df	$aekpfcia
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
	df	$iakpfcia
	dw	0
	dw	117
	dw	0
	dw	398
	dw	0
	dw	0
	dw	0
?patch219	equ	@723-@@stk@cpu@cpu_has_avx512vl$qv+72
?patch220	equ	0
?patch221	equ	@723-@@stk@cpu@cpu_has_avx512vl$qv
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
$ihkpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$alkpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512ifma$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512ifma$qv	proc	near
?live16432@0:
	?debug L 1630
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @724
@725:
	mov       ebx,offset $alkpfcia
	?debug L 1636
?live16432@16: ; EBX = &$alkpfcia
	mov       eax,dword ptr [$ihkpfcia]
	cmp       eax,-1
	je        short @729
	?debug L 1637
?live16432@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @727
	?debug L 1639
?live16432@48: ; EBX = &$alkpfcia
@728:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@729:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @728
	cmp       dword ptr [ebx],0
	jne       short @728
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
	jmp       short @732
@731:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@732:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @735
	cmp       dword ptr [ebx],0
@735:
	je        short @733
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @736
	cmp       eax,dword ptr [ebp-20]
@736:
	setne     al
	and       eax,1
	jmp       short @734
@733:
	xor       eax,eax
@734:
	test      al,al
	jne       short @731
	?debug L 1642
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
	?debug L 1644
	mov       eax,dword ptr [ebp-44]
	and       eax,2097152
	mov       dword ptr [$ihkpfcia],eax
	?debug L 1645
?live16432@96: ; EBX = &$alkpfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1646
?live16432@112: ; EBX = &$alkpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1648
?live16432@128: ; 
@737:
@727:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@724:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512ifma$qv+0
	dd        @724+0
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
	dd	?live16432@112-@@stk@cpu@cpu_has_avx512ifma$qv
	dd	?live16432@128-?live16432@112
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
	df	$alkpfcia
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
	df	$ihkpfcia
	dw	0
	dw	117
	dw	0
	dw	407
	dw	0
	dw	0
	dw	0
?patch224	equ	@737-@@stk@cpu@cpu_has_avx512ifma$qv+72
?patch225	equ	0
?patch226	equ	@737-@@stk@cpu@cpu_has_avx512ifma$qv
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
$iokpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aclpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512vbmi$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512vbmi$qv	proc	near
?live16433@0:
	?debug L 1651
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @738
@739:
	mov       ebx,offset $aclpfcia
	?debug L 1657
?live16433@16: ; EBX = &$aclpfcia
	mov       eax,dword ptr [$iokpfcia]
	cmp       eax,-1
	je        short @743
	?debug L 1658
?live16433@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @741
	?debug L 1660
?live16433@48: ; EBX = &$aclpfcia
@742:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@743:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @742
	cmp       dword ptr [ebx],0
	jne       short @742
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
	jmp       short @746
@745:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@746:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @749
	cmp       dword ptr [ebx],0
@749:
	je        short @747
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @750
	cmp       eax,dword ptr [ebp-20]
@750:
	setne     al
	and       eax,1
	jmp       short @748
@747:
	xor       eax,eax
@748:
	test      al,al
	jne       short @745
	?debug L 1663
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
	?debug L 1665
	mov       eax,dword ptr [ebp-36]
	and       eax,2
	mov       dword ptr [$iokpfcia],eax
	?debug L 1666
?live16433@96: ; EBX = &$aclpfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1667
?live16433@112: ; EBX = &$aclpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1669
?live16433@128: ; 
@751:
@741:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@738:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512vbmi$qv+0
	dd        @738+0
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
	dd	?live16433@112-@@stk@cpu@cpu_has_avx512vbmi$qv
	dd	?live16433@128-?live16433@112
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
	df	$aclpfcia
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
	df	$iokpfcia
	dw	0
	dw	117
	dw	0
	dw	416
	dw	0
	dw	0
	dw	0
?patch229	equ	@751-@@stk@cpu@cpu_has_avx512vbmi$qv+74
?patch230	equ	0
?patch231	equ	@751-@@stk@cpu@cpu_has_avx512vbmi$qv
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
$iflpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ajlpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_adx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_adx$qv	proc	near
?live16434@0:
	?debug L 1672
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @752
@753:
	mov       ebx,offset $ajlpfcia
	?debug L 1678
?live16434@16: ; EBX = &$ajlpfcia
	mov       eax,dword ptr [$iflpfcia]
	cmp       eax,-1
	je        short @757
	?debug L 1679
?live16434@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @755
	?debug L 1681
?live16434@48: ; EBX = &$ajlpfcia
@756:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@757:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @756
	cmp       dword ptr [ebx],0
	jne       short @756
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
	jmp       short @760
@759:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@760:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @763
	cmp       dword ptr [ebx],0
@763:
	je        short @761
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @764
	cmp       eax,dword ptr [ebp-20]
@764:
	setne     al
	and       eax,1
	jmp       short @762
@761:
	xor       eax,eax
@762:
	test      al,al
	jne       short @759
	?debug L 1684
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
	?debug L 1686
	mov       eax,dword ptr [ebp-44]
	and       eax,524288
	mov       dword ptr [$iflpfcia],eax
	?debug L 1687
?live16434@96: ; EBX = &$ajlpfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1688
?live16434@112: ; EBX = &$ajlpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1690
?live16434@128: ; 
@765:
@755:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@752:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_adx$qv+0
	dd        @752+0
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
	dd	?live16434@112-@@stk@cpu@cpu_has_adx$qv
	dd	?live16434@128-?live16434@112
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
	df	$ajlpfcia
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
	df	$iflpfcia
	dw	0
	dw	117
	dw	0
	dw	425
	dw	0
	dw	0
	dw	0
?patch234	equ	@765-@@stk@cpu@cpu_has_adx$qv+72
?patch235	equ	0
?patch236	equ	@765-@@stk@cpu@cpu_has_adx$qv
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
$imlpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aampfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_lzcnt$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_lzcnt$qv	proc	near
?live16435@0:
	?debug L 1693
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @766
@767:
	mov       ebx,offset $aampfcia
	?debug L 1699
?live16435@16: ; EBX = &$aampfcia
	mov       eax,dword ptr [$imlpfcia]
	cmp       eax,-1
	je        short @771
	?debug L 1700
?live16435@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @769
	?debug L 1702
?live16435@48: ; EBX = &$aampfcia
@770:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@771:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @770
	cmp       dword ptr [ebx],0
	jne       short @770
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
	jmp       short @774
@773:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@774:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @777
	cmp       dword ptr [ebx],0
@777:
	je        short @775
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @778
	cmp       eax,dword ptr [ebp-20]
@778:
	setne     al
	and       eax,1
	jmp       short @776
@775:
	xor       eax,eax
@776:
	test      al,al
	jne       short @773
	?debug L 1705
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
	?debug L 1707
	mov       eax,dword ptr [ebp-36]
	and       eax,32
	mov       dword ptr [$imlpfcia],eax
	?debug L 1708
?live16435@96: ; EBX = &$aampfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1709
?live16435@112: ; EBX = &$aampfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1711
?live16435@128: ; 
@779:
@769:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@766:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_lzcnt$qv+0
	dd        @766+0
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
	dd	?live16435@112-@@stk@cpu@cpu_has_lzcnt$qv
	dd	?live16435@128-?live16435@112
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
	df	$aampfcia
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
	df	$imlpfcia
	dw	0
	dw	117
	dw	0
	dw	434
	dw	0
	dw	0
	dw	0
?patch239	equ	@779-@@stk@cpu@cpu_has_lzcnt$qv+75
?patch240	equ	0
?patch241	equ	@779-@@stk@cpu@cpu_has_lzcnt$qv
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
$idmpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ahmpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_tbm$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_tbm$qv	proc	near
?live16436@0:
	?debug L 1714
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @780
@781:
	mov       ebx,offset $ahmpfcia
	?debug L 1720
?live16436@16: ; EBX = &$ahmpfcia
	mov       eax,dword ptr [$idmpfcia]
	cmp       eax,-1
	je        short @785
	?debug L 1721
?live16436@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @783
	?debug L 1723
?live16436@48: ; EBX = &$ahmpfcia
@784:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@785:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @784
	cmp       dword ptr [ebx],0
	jne       short @784
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
	jmp       short @788
@787:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@788:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @791
	cmp       dword ptr [ebx],0
@791:
	je        short @789
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @792
	cmp       eax,dword ptr [ebp-20]
@792:
	setne     al
	and       eax,1
	jmp       short @790
@789:
	xor       eax,eax
@790:
	test      al,al
	jne       short @787
	?debug L 1726
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
	?debug L 1728
	mov       eax,dword ptr [ebp-36]
	and       eax,2097152
	mov       dword ptr [$idmpfcia],eax
	?debug L 1729
?live16436@96: ; EBX = &$ahmpfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1730
?live16436@112: ; EBX = &$ahmpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1732
?live16436@128: ; 
@793:
@783:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@780:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_tbm$qv+0
	dd        @780+0
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
	dd	?live16436@112-@@stk@cpu@cpu_has_tbm$qv
	dd	?live16436@128-?live16436@112
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
	df	$ahmpfcia
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
	df	$idmpfcia
	dw	0
	dw	117
	dw	0
	dw	443
	dw	0
	dw	0
	dw	0
?patch244	equ	@793-@@stk@cpu@cpu_has_tbm$qv+73
?patch245	equ	0
?patch246	equ	@793-@@stk@cpu@cpu_has_tbm$qv
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
$ikmpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aompfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_clfsh$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_clfsh$qv	proc	near
?live16437@0:
	?debug L 1735
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @794
@795:
	mov       ebx,offset $aompfcia
	?debug L 1741
?live16437@16: ; EBX = &$aompfcia
	mov       eax,dword ptr [$ikmpfcia]
	cmp       eax,-1
	je        short @799
	?debug L 1742
?live16437@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @797
	?debug L 1744
?live16437@48: ; EBX = &$aompfcia
@798:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@799:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @798
	cmp       dword ptr [ebx],0
	jne       short @798
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
	jmp       short @802
@801:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@802:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @805
	cmp       dword ptr [ebx],0
@805:
	je        short @803
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @806
	cmp       eax,dword ptr [ebp-20]
@806:
	setne     al
	and       eax,1
	jmp       short @804
@803:
	xor       eax,eax
@804:
	test      al,al
	jne       short @801
	?debug L 1747
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
	?debug L 1749
	mov       eax,dword ptr [ebp-36]
	and       eax,524288
	mov       dword ptr [$ikmpfcia],eax
	?debug L 1750
?live16437@96: ; EBX = &$aompfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1751
?live16437@112: ; EBX = &$aompfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1753
?live16437@128: ; 
@807:
@797:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@794:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_clfsh$qv+0
	dd        @794+0
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
	dd	?live16437@112-@@stk@cpu@cpu_has_clfsh$qv
	dd	?live16437@128-?live16437@112
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
	df	$aompfcia
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
	df	$ikmpfcia
	dw	0
	dw	117
	dw	0
	dw	452
	dw	0
	dw	0
	dw	0
?patch249	equ	@807-@@stk@cpu@cpu_has_clfsh$qv+72
?patch250	equ	0
?patch251	equ	@807-@@stk@cpu@cpu_has_clfsh$qv
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
$ibnpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$afnpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_pclmulqdq$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_pclmulqdq$qv	proc	near
?live16438@0:
	?debug L 1756
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @808
@809:
	mov       ebx,offset $afnpfcia
	?debug L 1762
?live16438@16: ; EBX = &$afnpfcia
	mov       eax,dword ptr [$ibnpfcia]
	cmp       eax,-1
	je        short @813
	?debug L 1763
?live16438@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @811
	?debug L 1765
?live16438@48: ; EBX = &$afnpfcia
@812:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@813:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @812
	cmp       dword ptr [ebx],0
	jne       short @812
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
	jmp       short @816
@815:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@816:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @819
	cmp       dword ptr [ebx],0
@819:
	je        short @817
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @820
	cmp       eax,dword ptr [ebp-20]
@820:
	setne     al
	and       eax,1
	jmp       short @818
@817:
	xor       eax,eax
@818:
	test      al,al
	jne       short @815
	?debug L 1768
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
	?debug L 1770
	mov       eax,dword ptr [ebp-36]
	and       eax,32
	mov       dword ptr [$ibnpfcia],eax
	?debug L 1771
?live16438@96: ; EBX = &$afnpfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1772
?live16438@112: ; EBX = &$afnpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1774
?live16438@128: ; 
@821:
@811:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@808:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_pclmulqdq$qv+0
	dd        @808+0
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
	dd	?live16438@112-@@stk@cpu@cpu_has_pclmulqdq$qv
	dd	?live16438@128-?live16438@112
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
	df	$afnpfcia
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
	df	$ibnpfcia
	dw	0
	dw	117
	dw	0
	dw	461
	dw	0
	dw	0
	dw	0
?patch254	equ	@821-@@stk@cpu@cpu_has_pclmulqdq$qv+74
?patch255	equ	0
?patch256	equ	@821-@@stk@cpu@cpu_has_pclmulqdq$qv
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
$iinpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$amnpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_fxsr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_fxsr$qv	proc	near
?live16439@0:
	?debug L 1777
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @822
@823:
	mov       ebx,offset $amnpfcia
	?debug L 1783
?live16439@16: ; EBX = &$amnpfcia
	mov       eax,dword ptr [$iinpfcia]
	cmp       eax,-1
	je        short @827
	?debug L 1784
?live16439@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @825
	?debug L 1786
?live16439@48: ; EBX = &$amnpfcia
@826:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@827:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @826
	cmp       dword ptr [ebx],0
	jne       short @826
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
	jmp       short @830
@829:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@830:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @833
	cmp       dword ptr [ebx],0
@833:
	je        short @831
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @834
	cmp       eax,dword ptr [ebp-20]
@834:
	setne     al
	and       eax,1
	jmp       short @832
@831:
	xor       eax,eax
@832:
	test      al,al
	jne       short @829
	?debug L 1789
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
	?debug L 1791
	mov       eax,dword ptr [ebp-36]
	and       eax,16777216
	mov       dword ptr [$iinpfcia],eax
	?debug L 1792
?live16439@96: ; EBX = &$amnpfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1793
?live16439@112: ; EBX = &$amnpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1795
?live16439@128: ; 
@835:
@825:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@822:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_fxsr$qv+0
	dd        @822+0
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
	dd	?live16439@112-@@stk@cpu@cpu_has_fxsr$qv
	dd	?live16439@128-?live16439@112
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
	df	$amnpfcia
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
	df	$iinpfcia
	dw	0
	dw	117
	dw	0
	dw	470
	dw	0
	dw	0
	dw	0
?patch259	equ	@835-@@stk@cpu@cpu_has_fxsr$qv+72
?patch260	equ	0
?patch261	equ	@835-@@stk@cpu@cpu_has_fxsr$qv
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
$ipnpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$adopfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_ss$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_ss$qv	proc	near
?live16440@0:
	?debug L 1798
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @836
@837:
	mov       ebx,offset $adopfcia
	?debug L 1804
?live16440@16: ; EBX = &$adopfcia
	mov       eax,dword ptr [$ipnpfcia]
	cmp       eax,-1
	je        short @841
	?debug L 1805
?live16440@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @839
	?debug L 1807
?live16440@48: ; EBX = &$adopfcia
@840:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@841:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @840
	cmp       dword ptr [ebx],0
	jne       short @840
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
	jmp       short @844
@843:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@844:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @847
	cmp       dword ptr [ebx],0
@847:
	je        short @845
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @848
	cmp       eax,dword ptr [ebp-20]
@848:
	setne     al
	and       eax,1
	jmp       short @846
@845:
	xor       eax,eax
@846:
	test      al,al
	jne       short @843
	?debug L 1810
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
	?debug L 1812
	mov       eax,dword ptr [ebp-36]
	and       eax,134217728
	mov       dword ptr [$ipnpfcia],eax
	?debug L 1813
?live16440@96: ; EBX = &$adopfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1814
?live16440@112: ; EBX = &$adopfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1816
?live16440@128: ; 
@849:
@839:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@836:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_ss$qv+0
	dd        @836+0
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
	dd	?live16440@112-@@stk@cpu@cpu_has_ss$qv
	dd	?live16440@128-?live16440@112
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
	df	$adopfcia
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
	df	$ipnpfcia
	dw	0
	dw	117
	dw	0
	dw	479
	dw	0
	dw	0
	dw	0
?patch264	equ	@849-@@stk@cpu@cpu_has_ss$qv+72
?patch265	equ	0
?patch266	equ	@849-@@stk@cpu@cpu_has_ss$qv
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
$igopfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$akopfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_mtrr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mtrr$qv	proc	near
?live16441@0:
	?debug L 1819
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @850
@851:
	mov       ebx,offset $akopfcia
	?debug L 1825
?live16441@16: ; EBX = &$akopfcia
	mov       eax,dword ptr [$igopfcia]
	cmp       eax,-1
	je        short @855
	?debug L 1826
?live16441@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @853
	?debug L 1828
?live16441@48: ; EBX = &$akopfcia
@854:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@855:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @854
	cmp       dword ptr [ebx],0
	jne       short @854
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
	jmp       short @858
@857:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@858:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @861
	cmp       dword ptr [ebx],0
@861:
	je        short @859
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @862
	cmp       eax,dword ptr [ebp-20]
@862:
	setne     al
	and       eax,1
	jmp       short @860
@859:
	xor       eax,eax
@860:
	test      al,al
	jne       short @857
	?debug L 1831
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
	?debug L 1833
	mov       eax,dword ptr [ebp-36]
	and       eax,4096
	mov       dword ptr [$igopfcia],eax
	?debug L 1834
?live16441@96: ; EBX = &$akopfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1835
?live16441@112: ; EBX = &$akopfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1837
?live16441@128: ; 
@863:
@853:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@850:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_mtrr$qv+0
	dd        @850+0
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
	dd	?live16441@112-@@stk@cpu@cpu_has_mtrr$qv
	dd	?live16441@128-?live16441@112
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
	df	$akopfcia
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
	df	$igopfcia
	dw	0
	dw	117
	dw	0
	dw	488
	dw	0
	dw	0
	dw	0
?patch269	equ	@863-@@stk@cpu@cpu_has_mtrr$qv+72
?patch270	equ	0
?patch271	equ	@863-@@stk@cpu@cpu_has_mtrr$qv
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
$inopfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$abppfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_msr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_msr$qv	proc	near
?live16442@0:
	?debug L 1840
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @864
@865:
	mov       ebx,offset $abppfcia
	?debug L 1846
?live16442@16: ; EBX = &$abppfcia
	mov       eax,dword ptr [$inopfcia]
	cmp       eax,-1
	je        short @869
	?debug L 1847
?live16442@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @867
	?debug L 1849
?live16442@48: ; EBX = &$abppfcia
@868:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@869:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @868
	cmp       dword ptr [ebx],0
	jne       short @868
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
	jmp       short @872
@871:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@872:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @875
	cmp       dword ptr [ebx],0
@875:
	je        short @873
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @876
	cmp       eax,dword ptr [ebp-20]
@876:
	setne     al
	and       eax,1
	jmp       short @874
@873:
	xor       eax,eax
@874:
	test      al,al
	jne       short @871
	?debug L 1852
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
	?debug L 1854
	mov       eax,dword ptr [ebp-36]
	and       eax,4096
	mov       dword ptr [$inopfcia],eax
	?debug L 1855
?live16442@96: ; EBX = &$abppfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1856
?live16442@112: ; EBX = &$abppfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1858
?live16442@128: ; 
@877:
@867:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@864:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_msr$qv+0
	dd        @864+0
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
	dd	?live16442@112-@@stk@cpu@cpu_has_msr$qv
	dd	?live16442@128-?live16442@112
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
	df	$abppfcia
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
	df	$inopfcia
	dw	0
	dw	117
	dw	0
	dw	497
	dw	0
	dw	0
	dw	0
?patch274	equ	@877-@@stk@cpu@cpu_has_msr$qv+72
?patch275	equ	0
?patch276	equ	@877-@@stk@cpu@cpu_has_msr$qv
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
$ieppfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aippfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_tsc$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_tsc$qv	proc	near
?live16443@0:
	?debug L 1861
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @878
@879:
	mov       ebx,offset $aippfcia
	?debug L 1867
?live16443@16: ; EBX = &$aippfcia
	mov       eax,dword ptr [$ieppfcia]
	cmp       eax,-1
	je        short @883
	?debug L 1868
?live16443@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @881
	?debug L 1870
?live16443@48: ; EBX = &$aippfcia
@882:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@883:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @882
	cmp       dword ptr [ebx],0
	jne       short @882
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
	jmp       short @886
@885:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@886:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @889
	cmp       dword ptr [ebx],0
@889:
	je        short @887
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @890
	cmp       eax,dword ptr [ebp-20]
@890:
	setne     al
	and       eax,1
	jmp       short @888
@887:
	xor       eax,eax
@888:
	test      al,al
	jne       short @885
	?debug L 1873
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
	?debug L 1875
	mov       eax,dword ptr [ebp-28]
	and       eax,16
	mov       dword ptr [$ieppfcia],eax
	?debug L 1876
?live16443@96: ; EBX = &$aippfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1877
?live16443@112: ; EBX = &$aippfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1879
?live16443@128: ; 
@891:
@881:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@878:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_tsc$qv+0
	dd        @878+0
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
	dd	?live16443@112-@@stk@cpu@cpu_has_tsc$qv
	dd	?live16443@128-?live16443@112
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
	df	$aippfcia
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
	df	$ieppfcia
	dw	0
	dw	117
	dw	0
	dw	506
	dw	0
	dw	0
	dw	0
?patch279	equ	@891-@@stk@cpu@cpu_has_tsc$qv+74
?patch280	equ	0
?patch281	equ	@891-@@stk@cpu@cpu_has_tsc$qv
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
$ilppfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$apppfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_psn$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_psn$qv	proc	near
?live16444@0:
	?debug L 1882
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @892
@893:
	mov       ebx,offset $apppfcia
	?debug L 1888
?live16444@16: ; EBX = &$apppfcia
	mov       eax,dword ptr [$ilppfcia]
	cmp       eax,-1
	je        short @897
	?debug L 1889
?live16444@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @895
	?debug L 1891
?live16444@48: ; EBX = &$apppfcia
@896:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@897:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @896
	cmp       dword ptr [ebx],0
	jne       short @896
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
	jmp       short @900
@899:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@900:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @903
	cmp       dword ptr [ebx],0
@903:
	je        short @901
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @904
	cmp       eax,dword ptr [ebp-20]
@904:
	setne     al
	and       eax,1
	jmp       short @902
@901:
	xor       eax,eax
@902:
	test      al,al
	jne       short @899
	?debug L 1894
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
	?debug L 1896
	mov       eax,dword ptr [ebp-28]
	and       eax,262144
	mov       dword ptr [$ilppfcia],eax
	?debug L 1897
?live16444@96: ; EBX = &$apppfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1898
?live16444@112: ; EBX = &$apppfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1900
?live16444@128: ; 
@905:
@895:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@892:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_psn$qv+0
	dd        @892+0
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
	dd	?live16444@112-@@stk@cpu@cpu_has_psn$qv
	dd	?live16444@128-?live16444@112
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
	df	$apppfcia
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
	df	$ilppfcia
	dw	0
	dw	117
	dw	0
	dw	515
	dw	0
	dw	0
	dw	0
?patch284	equ	@905-@@stk@cpu@cpu_has_psn$qv+72
?patch285	equ	0
?patch286	equ	@905-@@stk@cpu@cpu_has_psn$qv
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
$icaagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$agaagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_xsave$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_xsave$qv	proc	near
?live16445@0:
	?debug L 1903
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @906
@907:
	mov       ebx,offset $agaagcia
	?debug L 1909
?live16445@16: ; EBX = &$agaagcia
	mov       eax,dword ptr [$icaagcia]
	cmp       eax,-1
	je        short @911
	?debug L 1910
?live16445@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @909
	?debug L 1912
?live16445@48: ; EBX = &$agaagcia
@910:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@911:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @910
	cmp       dword ptr [ebx],0
	jne       short @910
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
	jmp       short @914
@913:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@914:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @917
	cmp       dword ptr [ebx],0
@917:
	je        short @915
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @918
	cmp       eax,dword ptr [ebp-20]
@918:
	setne     al
	and       eax,1
	jmp       short @916
@915:
	xor       eax,eax
@916:
	test      al,al
	jne       short @913
	?debug L 1915
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
	?debug L 1917
	mov       eax,dword ptr [ebp-36]
	mov       edx,dword ptr [ebp-36]
	and       edx,134217728
	and       eax,67108864
	shr       edx,27
	?debug L 1915
	add       esp,24
	?debug L 1917
	shr       eax,26
	and       eax,edx
	?debug L 1919
?live16445@128: ; EBX = &$agaagcia, EAX = ret
	push      8
	?debug L 1918
?live16445@144: ; EBX = &$agaagcia, EAX = @temp3
	test      eax,eax
	?debug L 1917
?live16445@160: ; EBX = &$agaagcia
	mov       dword ptr [$icaagcia],eax
	?debug L 1918
?live16445@176: ; EBX = &$agaagcia, EAX = @temp3
	setne     cl
	and       ecx,1
	?debug L 1919
?live16445@192: ; EBX = &$agaagcia, EAX = ret
	push      ebx
	?debug L 1918
?live16445@208: ; EBX = &$agaagcia, EAX = @temp3
	mov       eax,ecx
	?debug L 1919
?live16445@224: ; EBX = &$agaagcia, EAX = ret
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1921
?live16445@240: ; 
@919:
@909:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@906:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_xsave$qv+0
	dd        @906+0
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
	dd	?live16445@128-@@stk@cpu@cpu_has_xsave$qv
	dd	?live16445@144-?live16445@128
	dw	1
	dd	?live16445@192-@@stk@cpu@cpu_has_xsave$qv
	dd	?live16445@208-?live16445@192
	dw	1
	dd	?live16445@224-@@stk@cpu@cpu_has_xsave$qv
	dd	?live16445@240-?live16445@224
	dw	1
?patch293	equ	3
?patch292	equ	34
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
	df	$agaagcia
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
	df	$icaagcia
	dw	0
	dw	117
	dw	0
	dw	524
	dw	0
	dw	0
	dw	0
?patch289	equ	@919-@@stk@cpu@cpu_has_xsave$qv+75
?patch290	equ	0
?patch291	equ	@919-@@stk@cpu@cpu_has_xsave$qv
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
$ijaagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$anaagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_clmul$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_clmul$qv	proc	near
?live16446@0:
	?debug L 1924
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @920
@921:
	mov       ebx,offset $anaagcia
	?debug L 1930
?live16446@16: ; EBX = &$anaagcia
	mov       eax,dword ptr [$ijaagcia]
	cmp       eax,-1
	je        short @925
	?debug L 1931
?live16446@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @923
	?debug L 1933
?live16446@48: ; EBX = &$anaagcia
@924:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@925:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @924
	cmp       dword ptr [ebx],0
	jne       short @924
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
	jmp       short @928
@927:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@928:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @931
	cmp       dword ptr [ebx],0
@931:
	je        short @929
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @932
	cmp       eax,dword ptr [ebp-20]
@932:
	setne     al
	and       eax,1
	jmp       short @930
@929:
	xor       eax,eax
@930:
	test      al,al
	jne       short @927
	?debug L 1936
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
	?debug L 1938
	mov       eax,dword ptr [ebp-36]
	and       eax,4
	mov       dword ptr [$ijaagcia],eax
	?debug L 1939
?live16446@96: ; EBX = &$anaagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1940
?live16446@112: ; EBX = &$anaagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1942
?live16446@128: ; 
@933:
@923:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@920:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_clmul$qv+0
	dd        @920+0
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
	dd	?live16446@112-@@stk@cpu@cpu_has_clmul$qv
	dd	?live16446@128-?live16446@112
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
	df	$anaagcia
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
	df	$ijaagcia
	dw	0
	dw	117
	dw	0
	dw	533
	dw	0
	dw	0
	dw	0
?patch294	equ	@933-@@stk@cpu@cpu_has_clmul$qv+74
?patch295	equ	0
?patch296	equ	@933-@@stk@cpu@cpu_has_clmul$qv
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
$iabagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aebagcia	label	dword
	dd	0
	dd	0
	dd	0
	db	1	dup(?)
	align	4
$ihbagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_psn$qv	segment virtual
	align	2
@@stk@cpu@cpu_psn$qv	proc	near
?live16447@0:
	?debug L 1945
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @934
@935:
	mov       ebx,offset $ihbagcia
	mov       esi,offset $aebagcia
	?debug L 1952
?live16447@16: ; EBX = &$ihbagcia, ESI = &$aebagcia
	cmp       dword ptr [$iabagcia],-1
	je        short @939
	?debug L 1953
?live16447@32: ; ESI = &$aebagcia
	mov       eax,esi
	jmp       @937
	?debug L 1955
?live16447@48: ; EBX = &$ihbagcia, ESI = &$aebagcia
@938:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@939:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @938
	cmp       dword ptr [ebx],0
	jne       short @938
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
	jmp       short @942
@941:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@942:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @945
	cmp       dword ptr [ebx],0
@945:
	je        short @943
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @946
	cmp       eax,dword ptr [ebp-20]
@946:
	setne     cl
	and       ecx,1
	jmp       short @944
@943:
	xor       ecx,ecx
@944:
	test      cl,cl
	jne       short @941
	?debug L 1957
	push      4
	push      esi
	call      _CG_D_EP
	xor       eax,eax
	mov       dword ptr [esi],eax
	?debug L 1958
	push      4
	push      esi
	push      4
	call      _CG_DA_EPY
	xor       edx,edx
	mov       dword ptr [esi+4],edx
	?debug L 1959
	push      4
	push      esi
	push      8
	call      _CG_DA_EPY
	xor       eax,eax
	mov       dword ptr [esi+8],eax
	?debug L 1960
	call      @@stk@cpu@cpu_has_psn$qv
	test      al,al
	jne       short @947
	?debug L 1961
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1962
?live16447@144: ; ESI = &$aebagcia
	mov       eax,esi
	jmp       short @937
	?debug L 1966
?live16447@160: ; EBX = &$ihbagcia, ESI = &$aebagcia
@947:
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
	?debug L 1968
	mov       ecx,dword ptr [ebp-52]
	push      4
	push      esi
	push      8
	call      _CG_DA_EPY
	mov       dword ptr [esi+8],ecx
	?debug L 1969
	mov       eax,dword ptr [ebp-28]
	push      4
	push      esi
	push      4
	call      _CG_DA_EPY
	mov       dword ptr [esi+4],eax
	?debug L 1970
	mov       edx,dword ptr [ebp-36]
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],edx
	?debug L 1971
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1972
?live16447@240: ; ESI = &$aebagcia
	mov       eax,esi
	?debug L 1971
?live16447@256: ; EBX = &$ihbagcia, ESI = &$aebagcia
	mov       dword ptr [ebx+4],0
	?debug L 1973
?live16447@272: ; 
@948:
@937:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@934:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_psn$qv+0
	dd        @934+0
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
	df	$ihbagcia
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
	df	$aebagcia
	dw	0
	dw	4226
	dw	0
	dw	541
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iabagcia
	dw	0
	dw	117
	dw	0
	dw	542
	dw	0
	dw	0
	dw	0
?patch299	equ	@948-@@stk@cpu@cpu_psn$qv+75
?patch300	equ	0
?patch301	equ	@948-@@stk@cpu@cpu_psn$qv
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
$albagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$iobagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_fma$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_fma$qv	proc	near
?live16448@0:
	?debug L 1976
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @949
@950:
	mov       ebx,offset $iobagcia
	?debug L 1982
?live16448@16: ; EBX = &$iobagcia
	mov       eax,dword ptr [$albagcia]
	cmp       eax,-1
	jne       @952
	?debug L 1983
?live16448@32: ; EAX = @temp3
	jmp       short @954
	?debug L 1985
?live16448@48: ; EBX = &$iobagcia
@953:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@954:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @953
	cmp       dword ptr [ebx],0
	jne       short @953
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
	jmp       short @957
@956:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@957:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @960
	cmp       dword ptr [ebx],0
@960:
	je        short @958
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @961
	cmp       eax,dword ptr [ebp-20]
@961:
	setne     cl
	and       ecx,1
	jmp       short @959
@958:
	xor       ecx,ecx
@959:
	test      cl,cl
	jne       short @956
	?debug L 1988
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
	?debug L 1990
	test      byte ptr [ebp-35],16
	je        short @962
	?debug L 1991
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
	?debug L 1992
	test      byte ptr [ebp-34],1
	je        short @963
	?debug L 1993
	mov       dword ptr [$albagcia],4
	jmp       short @964
	?debug L 1995
@963:
	mov       dword ptr [$albagcia],3
	?debug L 1996
	jmp       short @964
	?debug L 1998
@962:
	xor       eax,eax
	mov       dword ptr [$albagcia],eax
	?debug L 2000
@964:
	cmp       dword ptr [$albagcia],0
	setne     al
	and       eax,1
	?debug L 2001
?live16448@208: ; EBX = &$iobagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 2002
?live16448@224: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	?debug L 2001
?live16448@240: ; EBX = &$iobagcia, EAX = ret
	mov       dword ptr [ebx+4],0
	?debug L 2002
?live16448@256: ; EAX = ret
	mov       eax,edx
	?debug L 2003
?live16448@272: ; 
@965:
@952:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@949:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_fma$qv+0
	dd        @949+0
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
	dd	?live16448@272-?live16448@208
	dw	1
?patch306	equ	1
?patch305	equ	14
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
	df	$iobagcia
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
	df	$albagcia
	dw	0
	dw	117
	dw	0
	dw	551
	dw	0
	dw	0
	dw	0
?patch302	equ	@965-@@stk@cpu@cpu_has_fma$qv+75
?patch303	equ	0
?patch304	equ	@965-@@stk@cpu@cpu_has_fma$qv
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
$accagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ifcagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_aes$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_aes$qv	proc	near
?live16449@0:
	?debug L 2006
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @966
@967:
	mov       ebx,offset $ifcagcia
	?debug L 2012
?live16449@16: ; EBX = &$ifcagcia
	mov       eax,dword ptr [$accagcia]
	cmp       eax,-1
	je        short @971
	?debug L 2013
?live16449@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @969
	?debug L 2015
?live16449@48: ; EBX = &$ifcagcia
@970:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@971:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @970
	cmp       dword ptr [ebx],0
	jne       short @970
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
	jmp       short @974
@973:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@974:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @977
	cmp       dword ptr [ebx],0
@977:
	je        short @975
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @978
	cmp       eax,dword ptr [ebp-20]
@978:
	setne     al
	and       eax,1
	jmp       short @976
@975:
	xor       eax,eax
@976:
	test      al,al
	jne       short @973
	?debug L 2018
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
	?debug L 2020
	mov       eax,dword ptr [ebp-36]
	and       eax,33554432
	mov       dword ptr [$accagcia],eax
	?debug L 2021
?live16449@96: ; EBX = &$ifcagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2022
?live16449@112: ; EBX = &$ifcagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2024
?live16449@128: ; 
@979:
@969:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@966:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_aes$qv+0
	dd        @966+0
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
	dd	?live16449@112-@@stk@cpu@cpu_has_aes$qv
	dd	?live16449@128-?live16449@112
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
	df	$ifcagcia
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
	df	$accagcia
	dw	0
	dw	117
	dw	0
	dw	560
	dw	0
	dw	0
	dw	0
?patch307	equ	@979-@@stk@cpu@cpu_has_aes$qv+72
?patch308	equ	0
?patch309	equ	@979-@@stk@cpu@cpu_has_aes$qv
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
$ajcagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$imcagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viaaes$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viaaes$qv	proc	near
?live16450@0:
	?debug L 2027
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @980
@981:
	mov       ebx,offset $imcagcia
	?debug L 2033
?live16450@16: ; EBX = &$imcagcia
	mov       eax,dword ptr [$ajcagcia]
	cmp       eax,-1
	je        short @985
	?debug L 2034
?live16450@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @983
	?debug L 2036
?live16450@48: ; EBX = &$imcagcia
@984:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@985:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @984
	cmp       dword ptr [ebx],0
	jne       short @984
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
	jmp       short @988
@987:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@988:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @991
	cmp       dword ptr [ebx],0
@991:
	je        short @989
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @992
	cmp       eax,dword ptr [ebp-20]
@992:
	setne     al
	and       eax,1
	jmp       short @990
@989:
	xor       eax,eax
@990:
	test      al,al
	jne       short @987
	?debug L 2039
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
	?debug L 2041
	mov       eax,dword ptr [ebp-28]
	and       eax,128
	mov       dword ptr [$ajcagcia],eax
	?debug L 2042
?live16450@96: ; EBX = &$imcagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2043
?live16450@112: ; EBX = &$imcagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2045
?live16450@128: ; 
@993:
@983:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@980:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_viaaes$qv+0
	dd        @980+0
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
	dd	?live16450@112-@@stk@cpu@cpu_has_viaaes$qv
	dd	?live16450@128-?live16450@112
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
	df	$imcagcia
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
	df	$ajcagcia
	dw	0
	dw	117
	dw	0
	dw	569
	dw	0
	dw	0
	dw	0
?patch312	equ	@993-@@stk@cpu@cpu_has_viaaes$qv+73
?patch313	equ	0
?patch314	equ	@993-@@stk@cpu@cpu_has_viaaes$qv
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
$aadagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$iddagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viarng$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viarng$qv	proc	near
?live16451@0:
	?debug L 2048
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @994
@995:
	mov       ebx,offset $iddagcia
	?debug L 2054
?live16451@16: ; EBX = &$iddagcia
	mov       eax,dword ptr [$aadagcia]
	cmp       eax,-1
	je        short @999
	?debug L 2055
?live16451@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @997
	?debug L 2057
?live16451@48: ; EBX = &$iddagcia
@998:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@999:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @998
	cmp       dword ptr [ebx],0
	jne       short @998
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
	jmp       short @1002
@1001:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1002:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1005
	cmp       dword ptr [ebx],0
@1005:
	je        short @1003
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @1006
	cmp       eax,dword ptr [ebp-20]
@1006:
	setne     al
	and       eax,1
	jmp       short @1004
@1003:
	xor       eax,eax
@1004:
	test      al,al
	jne       short @1001
	?debug L 2060
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
	?debug L 2062
	mov       eax,dword ptr [ebp-28]
	and       eax,8
	mov       dword ptr [$aadagcia],eax
	?debug L 2063
?live16451@96: ; EBX = &$iddagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2064
?live16451@112: ; EBX = &$iddagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2066
?live16451@128: ; 
@1007:
@997:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@994:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_viarng$qv+0
	dd        @994+0
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
	dd	?live16451@112-@@stk@cpu@cpu_has_viarng$qv
	dd	?live16451@128-?live16451@112
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
	df	$iddagcia
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
	df	$aadagcia
	dw	0
	dw	117
	dw	0
	dw	578
	dw	0
	dw	0
	dw	0
?patch317	equ	@1007-@@stk@cpu@cpu_has_viarng$qv+75
?patch318	equ	0
?patch319	equ	@1007-@@stk@cpu@cpu_has_viarng$qv
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
$ahdagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ikdagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viahash$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viahash$qv	proc	near
?live16452@0:
	?debug L 2069
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @1008
@1009:
	mov       ebx,offset $ikdagcia
	?debug L 2075
?live16452@16: ; EBX = &$ikdagcia
	mov       eax,dword ptr [$ahdagcia]
	cmp       eax,-1
	je        short @1013
	?debug L 2076
?live16452@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @1011
	?debug L 2078
?live16452@48: ; EBX = &$ikdagcia
@1012:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1013:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1012
	cmp       dword ptr [ebx],0
	jne       short @1012
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
	jmp       short @1016
@1015:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1016:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1019
	cmp       dword ptr [ebx],0
@1019:
	je        short @1017
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @1020
	cmp       eax,dword ptr [ebp-20]
@1020:
	setne     al
	and       eax,1
	jmp       short @1018
@1017:
	xor       eax,eax
@1018:
	test      al,al
	jne       short @1015
	?debug L 2081
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
	?debug L 2083
	mov       eax,dword ptr [ebp-28]
	and       eax,2048
	mov       dword ptr [$ahdagcia],eax
	?debug L 2084
?live16452@96: ; EBX = &$ikdagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2085
?live16452@112: ; EBX = &$ikdagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2087
?live16452@128: ; 
@1021:
@1011:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1008:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_viahash$qv+0
	dd        @1008+0
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
	dd	?live16452@112-@@stk@cpu@cpu_has_viahash$qv
	dd	?live16452@128-?live16452@112
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
	df	$ikdagcia
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
	df	$ahdagcia
	dw	0
	dw	117
	dw	0
	dw	587
	dw	0
	dw	0
	dw	0
?patch322	equ	@1021-@@stk@cpu@cpu_has_viahash$qv+73
?patch323	equ	0
?patch324	equ	@1021-@@stk@cpu@cpu_has_viahash$qv
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
$aodagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ibeagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_rdseed$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_rdseed$qv	proc	near
?live16453@0:
	?debug L 2090
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @1022
@1023:
	mov       ebx,offset $ibeagcia
	?debug L 2096
?live16453@16: ; EBX = &$ibeagcia
	mov       eax,dword ptr [$aodagcia]
	cmp       eax,-1
	je        short @1027
	?debug L 2097
?live16453@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @1025
	?debug L 2099
?live16453@48: ; EBX = &$ibeagcia
@1026:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1027:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1026
	cmp       dword ptr [ebx],0
	jne       short @1026
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
	jmp       short @1030
@1029:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1030:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1033
	cmp       dword ptr [ebx],0
@1033:
	je        short @1031
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @1034
	cmp       eax,dword ptr [ebp-20]
@1034:
	setne     al
	and       eax,1
	jmp       short @1032
@1031:
	xor       eax,eax
@1032:
	test      al,al
	jne       short @1029
	?debug L 2102
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
	?debug L 2104
	mov       eax,dword ptr [ebp-44]
	and       eax,262144
	mov       dword ptr [$aodagcia],eax
	?debug L 2105
?live16453@96: ; EBX = &$ibeagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2106
?live16453@112: ; EBX = &$ibeagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2108
?live16453@128: ; 
@1035:
@1025:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1022:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_rdseed$qv+0
	dd        @1022+0
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
	dd	?live16453@112-@@stk@cpu@cpu_has_rdseed$qv
	dd	?live16453@128-?live16453@112
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
	df	$ibeagcia
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
	df	$aodagcia
	dw	0
	dw	117
	dw	0
	dw	596
	dw	0
	dw	0
	dw	0
?patch327	equ	@1035-@@stk@cpu@cpu_has_rdseed$qv+72
?patch328	equ	0
?patch329	equ	@1035-@@stk@cpu@cpu_has_rdseed$qv
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
$afeagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$iieagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_rdrand$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_rdrand$qv	proc	near
?live16454@0:
	?debug L 2111
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @1036
@1037:
	mov       ebx,offset $iieagcia
	?debug L 2117
?live16454@16: ; EBX = &$iieagcia
	mov       eax,dword ptr [$afeagcia]
	cmp       eax,-1
	je        short @1041
	?debug L 2118
?live16454@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @1039
	?debug L 2120
?live16454@48: ; EBX = &$iieagcia
@1040:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1041:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1040
	cmp       dword ptr [ebx],0
	jne       short @1040
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
	jmp       short @1044
@1043:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1044:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1047
	cmp       dword ptr [ebx],0
@1047:
	je        short @1045
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @1048
	cmp       eax,dword ptr [ebp-20]
@1048:
	setne     al
	and       eax,1
	jmp       short @1046
@1045:
	xor       eax,eax
@1046:
	test      al,al
	jne       short @1043
	?debug L 2123
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
	?debug L 2125
	mov       eax,dword ptr [ebp-36]
	and       eax,1073741824
	mov       dword ptr [$afeagcia],eax
	?debug L 2126
?live16454@96: ; EBX = &$iieagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2127
?live16454@112: ; EBX = &$iieagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2129
?live16454@128: ; 
@1049:
@1039:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1036:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_rdrand$qv+0
	dd        @1036+0
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
	dd	?live16454@112-@@stk@cpu@cpu_has_rdrand$qv
	dd	?live16454@128-?live16454@112
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
	df	$iieagcia
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
	df	$afeagcia
	dw	0
	dw	117
	dw	0
	dw	605
	dw	0
	dw	0
	dw	0
?patch332	equ	@1049-@@stk@cpu@cpu_has_rdrand$qv+72
?patch333	equ	0
?patch334	equ	@1049-@@stk@cpu@cpu_has_rdrand$qv
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
	?debug L 2138
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	push      ebx
	mov       dword ptr [ebp-8],offset @1050
@1051:
	mov       ebx,offset s@
	?debug L 2144
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
	?debug L 2145
	call      @@stk@cpu@cpu_name$qv
	push      eax
	push      ebx
	push      52
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+52]
	push      edx
	call      @@stk@con@prints$qpxce
	add       esp,8
	?debug L 2146
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
	?debug L 2147
	push      0
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1052
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
	jmp       short @1053
@1052:
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
	?debug L 2148
@1053:
	push      0
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1054
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
	jmp       short @1055
@1054:
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
	?debug L 2149
@1055:
	push      ebx
	push      197
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+197]
	push      eax
	call      @@stk@con@prints$qpxce
	pop       ecx
	?debug L 2150
	push      1
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1056
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
	jmp       short @1057
@1056:
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
	?debug L 2151
@1057:
	push      1
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1058
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
	jmp       short @1059
@1058:
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
	?debug L 2152
@1059:
	push      2
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1060
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
	jmp       short @1061
@1060:
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
	?debug L 2153
@1061:
	push      2
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1062
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
	jmp       short @1063
@1062:
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
	?debug L 2154
@1063:
	push      3
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1064
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
	jmp       short @1065
@1064:
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
	?debug L 2155
@1065:
	push      3
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1066
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
	jmp       short @1067
@1066:
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
	?debug L 2156
@1067:
	call      @@stk@cpu@cpu_num_cores$qv
	test      eax,eax
	je        short @1068
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
	jmp       short @1069
@1068:
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
	?debug L 2157
@1069:
	call      @@stk@cpu@cpu_num_threads$qv
	test      eax,eax
	je        short @1070
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
	jmp       short @1071
@1070:
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
	?debug L 2159
@1071:
	call      @@stk@cpu@cpu_has_amd64$qv
	and       eax,255
	test      eax,eax
	je        short @1072
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
	jmp       short @1073
@1072:
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
	?debug L 2160
@1073:
	call      @@stk@cpu@cpu_has_ht$qv
	and       eax,255
	test      eax,eax
	je        short @1074
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
	jmp       short @1075
@1074:
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
	?debug L 2161
@1075:
	call      @@stk@cpu@cpu_has_mmx$qv
	and       eax,255
	test      eax,eax
	je        short @1076
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
	jmp       short @1077
@1076:
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
	?debug L 2162
@1077:
	call      @@stk@cpu@cpu_has_mmxext$qv
	and       eax,255
	test      eax,eax
	je        short @1078
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
	jmp       short @1079
@1078:
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
	?debug L 2163
@1079:
	call      @@stk@cpu@cpu_has_3dnow$qv
	test      eax,eax
	je        short @1080
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
	jmp       short @1081
@1080:
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
	?debug L 2164
@1081:
	call      @@stk@cpu@cpu_has_3dnowprefetch$qv
	and       eax,255
	test      eax,eax
	je        short @1082
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
	jmp       short @1083
@1082:
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
	?debug L 2165
@1083:
	call      @@stk@cpu@cpu_has_fxsr$qv
	and       eax,255
	test      eax,eax
	je        short @1084
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
	jmp       short @1085
@1084:
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
	?debug L 2166
@1085:
	call      @@stk@cpu@cpu_has_sse$qv
	test      eax,eax
	je        short @1086
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
	jmp       short @1087
@1086:
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
	?debug L 2167
@1087:
	call      @@stk@cpu@cpu_has_xsave$qv
	and       eax,255
	test      eax,eax
	je        short @1088
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
	jmp       short @1089
@1088:
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
	?debug L 2168
@1089:
	call      @@stk@cpu@cpu_has_pclmulqdq$qv
	and       eax,255
	test      eax,eax
	je        short @1090
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
	jmp       short @1091
@1090:
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
	?debug L 2169
@1091:
	call      @@stk@cpu@cpu_has_movbe$qv
	and       eax,255
	test      eax,eax
	je        short @1092
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
	jmp       short @1093
@1092:
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
	?debug L 2170
@1093:
	call      @@stk@cpu@cpu_has_fma$qv
	test      eax,eax
	je        short @1094
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
	jmp       short @1095
@1094:
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
	?debug L 2171
@1095:
	call      @@stk@cpu@cpu_has_popcnt$qv
	and       eax,255
	test      eax,eax
	je        short @1096
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
	jmp       short @1097
@1096:
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
	?debug L 2172
@1097:
	call      @@stk@cpu@cpu_has_xop$qv
	and       eax,255
	test      eax,eax
	je        short @1098
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
	jmp       short @1099
@1098:
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
	?debug L 2173
@1099:
	call      @@stk@cpu@cpu_has_lzcnt$qv
	and       eax,255
	test      eax,eax
	je        short @1100
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
	jmp       short @1101
@1100:
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
	?debug L 2174
@1101:
	call      @@stk@cpu@cpu_has_f16c$qv
	and       eax,255
	test      eax,eax
	je        short @1102
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
	jmp       short @1103
@1102:
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
	?debug L 2175
@1103:
	call      @@stk@cpu@cpu_has_avx$qv
	test      eax,eax
	je        short @1104
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
	jmp       short @1105
@1104:
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
	?debug L 2176
@1105:
	call      @@stk@cpu@cpu_has_avx512f$qv
	and       eax,255
	test      eax,eax
	je        short @1106
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
	jmp       short @1107
@1106:
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
	?debug L 2177
@1107:
	call      @@stk@cpu@cpu_has_avx512bw$qv
	and       eax,255
	test      eax,eax
	je        short @1108
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
	jmp       short @1109
@1108:
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
	?debug L 2178
@1109:
	call      @@stk@cpu@cpu_has_avx512cd$qv
	and       eax,255
	test      eax,eax
	je        short @1110
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
	jmp       short @1111
@1110:
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
	?debug L 2179
@1111:
	call      @@stk@cpu@cpu_has_avx512dq$qv
	and       eax,255
	test      eax,eax
	je        short @1112
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
	jmp       short @1113
@1112:
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
	?debug L 2180
@1113:
	call      @@stk@cpu@cpu_has_avx512er$qv
	and       eax,255
	test      eax,eax
	je        short @1114
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
	jmp       short @1115
@1114:
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
	?debug L 2181
@1115:
	call      @@stk@cpu@cpu_has_avx512pf$qv
	and       eax,255
	test      eax,eax
	je        short @1116
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
	jmp       short @1117
@1116:
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
	?debug L 2182
@1117:
	call      @@stk@cpu@cpu_has_avx512vl$qv
	and       eax,255
	test      eax,eax
	je        short @1118
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
	jmp       short @1119
@1118:
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
	?debug L 2183
@1119:
	call      @@stk@cpu@cpu_has_avx512ifma$qv
	and       eax,255
	test      eax,eax
	je        short @1120
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
	jmp       short @1121
@1120:
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
	?debug L 2184
@1121:
	call      @@stk@cpu@cpu_has_bmi$qv
	test      eax,eax
	je        short @1122
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
	jmp       short @1123
@1122:
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
	?debug L 2185
@1123:
	call      @@stk@cpu@cpu_has_avx512vbmi$qv
	and       eax,255
	test      eax,eax
	je        short @1124
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
	jmp       short @1125
@1124:
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
	?debug L 2186
@1125:
	call      @@stk@cpu@cpu_has_cmov$qv
	and       eax,255
	test      eax,eax
	je        short @1126
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
	jmp       short @1127
@1126:
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
	?debug L 2187
@1127:
	call      @@stk@cpu@cpu_has_cmpxchg$qv
	test      eax,eax
	je        short @1128
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
	jmp       short @1129
@1128:
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
	?debug L 2188
@1129:
	call      @@stk@cpu@cpu_has_clmul$qv
	and       eax,255
	test      eax,eax
	je        short @1130
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
	jmp       short @1131
@1130:
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
	?debug L 2189
@1131:
	call      @@stk@cpu@cpu_has_aes$qv
	and       eax,255
	test      eax,eax
	je        short @1132
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
	jmp       short @1133
@1132:
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
	?debug L 2190
@1133:
	call      @@stk@cpu@cpu_has_sha$qv
	and       eax,255
	test      eax,eax
	je        short @1134
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
	jmp       short @1135
@1134:
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
	?debug L 2191
@1135:
	call      @@stk@cpu@cpu_has_rdrand$qv
	and       eax,255
	test      eax,eax
	je        short @1136
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
	jmp       short @1137
@1136:
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
	?debug L 2192
@1137:
	call      @@stk@cpu@cpu_has_rdseed$qv
	and       eax,255
	test      eax,eax
	je        short @1138
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
	jmp       short @1139
@1138:
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
	?debug L 2193
@1139:
	call      @@stk@cpu@cpu_has_tsc$qv
	and       eax,255
	test      eax,eax
	je        short @1140
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
	jmp       short @1141
@1140:
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
	?debug L 2194
@1141:
	call      @@stk@cpu@cpu_has_perftsc$qv
	and       eax,255
	test      eax,eax
	je        short @1142
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
	jmp       short @1143
@1142:
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
	?debug L 2195
@1143:
	call      @@stk@cpu@cpu_has_erms$qv
	and       eax,255
	test      eax,eax
	je        short @1144
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
	jmp       short @1145
@1144:
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
	?debug L 2196
@1145:
	call      @@stk@cpu@cpu_has_msr$qv
	and       eax,255
	test      eax,eax
	je        short @1146
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
	jmp       short @1147
@1146:
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
	?debug L 2197
@1147:
	call      @@stk@cpu@cpu_has_mtrr$qv
	and       eax,255
	test      eax,eax
	je        short @1148
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
	jmp       short @1149
@1148:
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
	?debug L 2198
@1149:
	call      @@stk@cpu@cpu_has_vmx$qv
	and       eax,255
	test      eax,eax
	je        short @1150
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
	jmp       short @1151
@1150:
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
	?debug L 2200
?live16455@880: ; 
@1151:
@1152:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@1050:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_print_info$qv+0
	dd        @1050+0
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
?patch337	equ	@1152-@@stk@cpu@cpu_print_info$qv+35
?patch338	equ	0
?patch339	equ	@1152-@@stk@cpu@cpu_print_info$qv
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
	?debug L 2203
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @1153
	?debug L 2208
@1154:
	call      @@stk@cpu@cpu_print_info$qv
	?debug L 2209
@1155:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@1153:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_test$qv+0
	dd        @1153+0
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
?patch340	equ	@1155-@@stk@cpu@cpu_test$qv+31
?patch341	equ	0
?patch342	equ	@1155-@@stk@cpu@cpu_test$qv
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
	mov       dword ptr [ebp-8],offset @1156
@1157:
	call      @@stk@cpu@tsc_init$qv
	mov       dword ptr [_tsc_ADJ],eax
	mov       dword ptr [_tsc_ADJ+4],edx
	?debug L 0
@1158:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@1156:
	db        67,71,83,0
	dd        @_STCON0_$qv+0
	dd        @1156+0
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
?patch343	equ	@1158-@_STCON0_$qv+31
?patch344	equ	0
?patch345	equ	@1158-@_STCON0_$qv
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
	dd	$akfofcia
	dd	8
	dd	4
	dd	$aegofcia
	dd	8
	dd	4
	dd	$ihgofcia
	dd	8
	dd	4
	dd	$algofcia
	dd	8
	dd	4
	dd	$iogofcia
	dd	8
	dd	4
	dd	$achofcia
	dd	8
	dd	4
	dd	$ifhofcia
	dd	8
	dd	4
	dd	$iphofcia
	dd	4
	dd	4
	dd	$adiofcia
	dd	4
	dd	4
	dd	$igiofcia
	dd	4
	dd	4
	dd	$akiofcia
	dd	4
	dd	4
	dd	$iniofcia
	dd	4
	dd	4
	dd	$abjofcia
	dd	4
	dd	4
	dd	$iejofcia
	dd	8
	dd	4
	dd	$aijofcia
	dd	16
	dd	4
	dd	$iljofcia
	dd	8
	dd	4
	dd	$ifkofcia
	dd	52
	dd	4
	dd	$ajkofcia
	dd	8
	dd	4
	dd	$adlofcia
	dd	4
	dd	4
	dd	$iglofcia
	dd	8
	dd	4
	dd	$aklofcia
	dd	4
	dd	4
	dd	$inlofcia
	dd	8
	dd	4
	dd	$abmofcia
	dd	4
	dd	4
	dd	$iemofcia
	dd	8
	dd	4
	dd	$aimofcia
	dd	4
	dd	4
	dd	$ilmofcia
	dd	8
	dd	4
	dd	$apmofcia
	dd	4
	dd	4
	dd	$icnofcia
	dd	8
	dd	4
	dd	$imnofcia
	dd	4
	dd	4
	dd	$aaoofcia
	dd	8
	dd	4
	dd	$idoofcia
	dd	4
	dd	4
	dd	$ahoofcia
	dd	8
	dd	4
	dd	$ikoofcia
	dd	4
	dd	4
	dd	$aooofcia
	dd	8
	dd	4
	dd	$ibpofcia
	dd	4
	dd	4
	dd	$afpofcia
	dd	8
	dd	4
	dd	$iipofcia
	dd	4
	dd	4
	dd	$ampofcia
	dd	8
	dd	4
	dd	$ippofcia
	dd	4
	dd	4
	dd	$adapfcia
	dd	8
	dd	4
	dd	$igapfcia
	dd	4
	dd	4
	dd	$akapfcia
	dd	8
	dd	4
	dd	$inapfcia
	dd	4
	dd	4
	dd	$abbpfcia
	dd	8
	dd	4
	dd	$iebpfcia
	dd	4
	dd	4
	dd	$aibpfcia
	dd	8
	dd	4
	dd	$ilbpfcia
	dd	4
	dd	4
	dd	$apbpfcia
	dd	8
	dd	4
	dd	$iccpfcia
	dd	4
	dd	4
	dd	$agcpfcia
	dd	8
	dd	4
	dd	$ijcpfcia
	dd	4
	dd	4
	dd	$ancpfcia
	dd	8
	dd	4
	dd	$iadpfcia
	dd	4
	dd	4
	dd	$aedpfcia
	dd	8
	dd	4
	dd	$ihdpfcia
	dd	4
	dd	4
	dd	$aldpfcia
	dd	8
	dd	4
	dd	$iodpfcia
	dd	4
	dd	4
	dd	$acepfcia
	dd	8
	dd	4
	dd	$ifepfcia
	dd	4
	dd	4
	dd	$ajepfcia
	dd	8
	dd	4
	dd	$imepfcia
	dd	4
	dd	4
	dd	$aafpfcia
	dd	8
	dd	4
	dd	$idfpfcia
	dd	4
	dd	4
	dd	$ahfpfcia
	dd	8
	dd	4
	dd	$ikfpfcia
	dd	4
	dd	4
	dd	$aofpfcia
	dd	8
	dd	4
	dd	$ibgpfcia
	dd	4
	dd	4
	dd	$afgpfcia
	dd	8
	dd	4
	dd	$iigpfcia
	dd	4
	dd	4
	dd	$amgpfcia
	dd	8
	dd	4
	dd	$ipgpfcia
	dd	4
	dd	4
	dd	$adhpfcia
	dd	8
	dd	4
	dd	$ighpfcia
	dd	4
	dd	4
	dd	$akhpfcia
	dd	8
	dd	4
	dd	$inhpfcia
	dd	4
	dd	4
	dd	$abipfcia
	dd	8
	dd	4
	dd	$ieipfcia
	dd	4
	dd	4
	dd	$aiipfcia
	dd	8
	dd	4
	dd	$ilipfcia
	dd	4
	dd	4
	dd	$apipfcia
	dd	8
	dd	4
	dd	$icjpfcia
	dd	4
	dd	4
	dd	$agjpfcia
	dd	8
	dd	4
	dd	$ijjpfcia
	dd	4
	dd	4
	dd	$anjpfcia
	dd	8
	dd	4
	dd	$iakpfcia
	dd	4
	dd	4
	dd	$aekpfcia
	dd	8
	dd	4
	dd	$ihkpfcia
	dd	4
	dd	4
	dd	$alkpfcia
	dd	8
	dd	4
	dd	$iokpfcia
	dd	4
	dd	4
	dd	$aclpfcia
	dd	8
	dd	4
	dd	$iflpfcia
	dd	4
	dd	4
	dd	$ajlpfcia
	dd	8
	dd	4
	dd	$imlpfcia
	dd	4
	dd	4
	dd	$aampfcia
	dd	8
	dd	4
	dd	$idmpfcia
	dd	4
	dd	4
	dd	$ahmpfcia
	dd	8
	dd	4
	dd	$ikmpfcia
	dd	4
	dd	4
	dd	$aompfcia
	dd	8
	dd	4
	dd	$ibnpfcia
	dd	4
	dd	4
	dd	$afnpfcia
	dd	8
	dd	4
	dd	$iinpfcia
	dd	4
	dd	4
	dd	$amnpfcia
	dd	8
	dd	4
	dd	$ipnpfcia
	dd	4
	dd	4
	dd	$adopfcia
	dd	8
	dd	4
	dd	$igopfcia
	dd	4
	dd	4
	dd	$akopfcia
	dd	8
	dd	4
	dd	$inopfcia
	dd	4
	dd	4
	dd	$abppfcia
	dd	8
	dd	4
	dd	$ieppfcia
	dd	4
	dd	4
	dd	$aippfcia
	dd	8
	dd	4
	dd	$ilppfcia
	dd	4
	dd	4
	dd	$apppfcia
	dd	8
	dd	4
	dd	$icaagcia
	dd	4
	dd	4
	dd	$agaagcia
	dd	8
	dd	4
	dd	$ijaagcia
	dd	4
	dd	4
	dd	$anaagcia
	dd	8
	dd	4
	dd	$iabagcia
	dd	4
	dd	4
	dd	$aebagcia
	dd	12
	dd	4
	dd	$ihbagcia
	dd	8
	dd	4
	dd	$albagcia
	dd	4
	dd	4
	dd	$iobagcia
	dd	8
	dd	4
	dd	$accagcia
	dd	4
	dd	4
	dd	$ifcagcia
	dd	8
	dd	4
	dd	$ajcagcia
	dd	4
	dd	4
	dd	$imcagcia
	dd	8
	dd	4
	dd	$aadagcia
	dd	4
	dd	4
	dd	$iddagcia
	dd	8
	dd	4
	dd	$ahdagcia
	dd	4
	dd	4
	dd	$ikdagcia
	dd	8
	dd	4
	dd	$aodagcia
	dd	4
	dd	4
	dd	$ibeagcia
	dd	8
	dd	4
	dd	$afeagcia
	dd	4
	dd	4
	dd	$iieagcia
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
	dw	?patch346
	dw	37
	dw	610
	dw	0
	dw	0
	dw	0
	dw	0
?patch346	equ	12
	dw	?patch347
	dw	37
	dw	611
	dw	0
	dw	0
	dw	0
	dw	0
?patch347	equ	12
	dw	?patch348
	dw	37
	dw	612
	dw	0
	dw	0
	dw	0
	dw	0
?patch348	equ	12
	dw	?patch349
	dw	37
	dw	613
	dw	0
	dw	0
	dw	0
	dw	0
?patch349	equ	12
	dw	?patch350
	dw	37
	dw	614
	dw	0
	dw	0
	dw	0
	dw	0
?patch350	equ	12
	dw	?patch351
	dw	37
	dw	615
	dw	0
	dw	0
	dw	0
	dw	0
?patch351	equ	12
	dw	?patch352
	dw	37
	dw	616
	dw	0
	dw	0
	dw	0
	dw	0
?patch352	equ	12
	dw	?patch353
	dw	37
	dw	617
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
	dw	618
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_PAUSED
	dw	0
	dw	119
	dw	0
	dw	619
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_LAST_MEASURED
	dw	0
	dw	119
	dw	0
	dw	620
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_ADJ
	dw	0
	dw	119
	dw	0
	dw	621
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_ELAPSED
	dw	0
	dw	119
	dw	0
	dw	622
	dw	0
	dw	0
	dw	0
	dw	?patch354
	dw	38
	dw	514
	dw	623
	dw	0
	dw	624
	dw	0
	dw	625
	dw	0
	dw	626
	dw	0
	dw	627
	dw	0
	dw	628
	dw	0
	dw	629
	dw	0
	dw	630
	dw	0
	dw	631
	dw	0
	dw	632
	dw	0
	dw	633
	dw	0
	dw	634
	dw	0
	dw	635
	dw	0
	dw	636
	dw	0
	dw	637
	dw	0
	dw	638
	dw	0
	dw	639
	dw	0
	dw	640
	dw	0
	dw	641
	dw	0
	dw	642
	dw	0
	dw	643
	dw	0
	dw	644
	dw	0
	dw	645
	dw	0
	dw	646
	dw	0
	dw	647
	dw	0
	dw	648
	dw	0
	dw	649
	dw	0
	dw	650
	dw	0
	dw	651
	dw	0
	dw	652
	dw	0
	dw	653
	dw	0
	dw	654
	dw	0
	dw	655
	dw	0
	dw	656
	dw	0
	dw	657
	dw	0
	dw	658
	dw	0
	dw	659
	dw	0
	dw	660
	dw	0
	dw	661
	dw	0
	dw	662
	dw	0
	dw	663
	dw	0
	dw	664
	dw	0
	dw	665
	dw	0
	dw	666
	dw	0
	dw	667
	dw	0
	dw	668
	dw	0
	dw	669
	dw	0
	dw	670
	dw	0
	dw	671
	dw	0
	dw	672
	dw	0
	dw	673
	dw	0
	dw	674
	dw	0
	dw	675
	dw	0
	dw	676
	dw	0
	dw	677
	dw	0
	dw	678
	dw	0
	dw	679
	dw	0
	dw	680
	dw	0
	dw	681
	dw	0
	dw	682
	dw	0
	dw	683
	dw	0
	dw	684
	dw	0
	dw	685
	dw	0
	dw	686
	dw	0
	dw	687
	dw	0
	dw	688
	dw	0
	dw	689
	dw	0
	dw	690
	dw	0
	dw	691
	dw	0
	dw	692
	dw	0
	dw	693
	dw	0
	dw	694
	dw	0
	dw	695
	dw	0
	dw	696
	dw	0
	dw	697
	dw	0
	dw	698
	dw	0
	dw	699
	dw	0
	dw	700
	dw	0
	dw	701
	dw	0
	dw	702
	dw	0
	dw	703
	dw	0
	dw	704
	dw	0
	dw	705
	dw	0
	dw	706
	dw	0
	dw	707
	dw	0
	dw	708
	dw	0
	dw	709
	dw	0
	dw	710
	dw	0
	dw	711
	dw	0
	dw	712
	dw	0
	dw	713
	dw	0
	dw	714
	dw	0
	dw	715
	dw	0
	dw	716
	dw	0
	dw	717
	dw	0
	dw	718
	dw	0
	dw	719
	dw	0
	dw	720
	dw	0
	dw	721
	dw	0
	dw	722
	dw	0
	dw	723
	dw	0
	dw	724
	dw	0
	dw	725
	dw	0
	dw	726
	dw	0
	dw	727
	dw	0
	dw	728
	dw	0
	dw	729
	dw	0
	dw	730
	dw	0
	dw	731
	dw	0
	dw	732
	dw	0
	dw	733
	dw	0
	dw	734
	dw	0
	dw	735
	dw	0
	dw	736
	dw	0
	dw	737
	dw	0
	dw	738
	dw	0
	dw	739
	dw	0
	dw	740
	dw	0
	dw	741
	dw	0
	dw	742
	dw	0
	dw	743
	dw	0
	dw	744
	dw	0
	dw	745
	dw	0
	dw	746
	dw	0
	dw	747
	dw	0
	dw	748
	dw	0
	dw	749
	dw	0
	dw	750
	dw	0
	dw	751
	dw	0
	dw	752
	dw	0
	dw	753
	dw	0
	dw	754
	dw	0
	dw	755
	dw	0
	dw	756
	dw	0
	dw	757
	dw	0
	dw	758
	dw	0
	dw	759
	dw	0
	dw	760
	dw	0
	dw	761
	dw	0
	dw	762
	dw	0
	dw	763
	dw	0
	dw	764
	dw	0
	dw	765
	dw	0
	dw	766
	dw	0
	dw	767
	dw	0
	dw	768
	dw	0
	dw	769
	dw	0
	dw	770
	dw	0
	dw	771
	dw	0
	dw	772
	dw	0
	dw	773
	dw	0
	dw	774
	dw	0
	dw	775
	dw	0
	dw	776
	dw	0
	dw	777
	dw	0
	dw	778
	dw	0
	dw	779
	dw	0
	dw	780
	dw	0
	dw	781
	dw	0
	dw	782
	dw	0
	dw	783
	dw	0
	dw	784
	dw	0
	dw	785
	dw	0
	dw	786
	dw	0
	dw	787
	dw	0
	dw	788
	dw	0
	dw	789
	dw	0
	dw	790
	dw	0
	dw	791
	dw	0
	dw	792
	dw	0
	dw	793
	dw	0
	dw	794
	dw	0
	dw	795
	dw	0
	dw	796
	dw	0
	dw	797
	dw	0
	dw	798
	dw	0
	dw	799
	dw	0
	dw	800
	dw	0
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
?patch354	equ	2060
	dw	?patch355
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
?patch355	equ	16
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
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\STK_CPU.H" 22195 36112
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\IO\./../stk_main.h" 22189 28075
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\IO\STK_CONSOLE.H" 22172 32832
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\TIME\STK_TIME.H" 20752 24369
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\STASM\STK_STASM.H" 22142 40733
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\_lim.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\limits.h" 10305 10240
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\THREADS\./../cpu/./../stk_main.h" 22189 28075
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\THREADS\./../cpu/stk_cpu.h" 22195 36112
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\THREADS\./../time/stk_time.h" 20752 24369
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\THREADS\./../stk_main.h" 22189 28075
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\THREADS\STK_THREADS.H" 22172 32835
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\TEXT\STK_CSTR_UTILS.H" 22195 23737
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\MEM\./.././stasm/./../stk_main.h" 22189 28075
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\MEM\./.././stasm/stk_stasm.h" 22142 40733
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\MEM\./.././text/./../mem/stk_mem.h" 20752 24368
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\MEM\./.././text/./../stk_main.h" 22189 28075
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\MEM\./.././text/stk_cstr_utils.h" 22195 23737
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\MEM\./.././time/./../stk_main.h" 22189 28075
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\MEM\./.././time/stk_time.h" 20752 24369
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
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\_stddef.h" 22173 45872
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\mem.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\windows.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\pshpack4.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winsock2.h" 10305 10240
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\MEM\./../stk_main.h" 22189 28075
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\MEM\STK_MEM.H" 20752 24368
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\stk_cpu.cpp" 22200 30743
	end
