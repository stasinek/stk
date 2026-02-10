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
	?debug	S "C:\SRC\LIB\stk\cpu\stk_cpu.cpp"
	?debug	T "C:\SRC\LIB\stk\cpu\stk_cpu.cpp"
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
	?debug L 70
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-32
	mov       dword ptr [ebp-8],offset @1
	?debug L 104
@2:
	db        15
	?debug L 105
@3:
	db        49
	?debug L 109
@4:
	mov	 [dword ptr [ebp-28]], eax
	?debug L 110
	mov	 [dword ptr [ebp-36]], edx
	?debug L 119
	mov       eax,dword ptr [ebp-36]
	xor       edx,edx
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 120
	mov       edx,dword ptr [ebp-20]
	xor       eax,eax
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 121
	mov       eax,dword ptr [ebp-28]
	xor       edx,edx
	or        eax,dword ptr [ebp-20]
	or        edx,dword ptr [ebp-16]
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 122
	mov       eax,dword ptr [ebp-20]
	mov       edx,dword ptr [ebp-16]
	?debug L 123
@6:
@5:
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
?patch1	equ	@6-@@stk@cpu@rdtsc$qv+55
?patch2	equ	0
?patch3	equ	@6-@@stk@cpu@rdtsc$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$addpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@rdtscex$qv	segment virtual
	align	2
@@stk@cpu@rdtscex$qv	proc	near
?live16386@0:
	?debug L 126
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-44
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @7
	mov       edi,offset $addpfcia
@8:
	jmp       short @10
	?debug L 253
?live16386@16: ; EDI = &$addpfcia
@9:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@10:
	push      8
	push      edi
	call      _CG_D_EP
	cmp       dword ptr [edi+4],0
	jne       short @9
	cmp       dword ptr [edi],0
@11:
	jne       short @9
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
	jmp       short @13
@12:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@13:
	push      8
	push      edi
	call      _CG_D_EP
	cmp       dword ptr [edi+4],0
	jne       short @16
	cmp       dword ptr [edi],0
@16:
	je        short @14
	push      8
	push      edi
	call      _CG_D_EP
	mov       eax,dword ptr [edi]
	mov       edx,dword ptr [edi+4]
	cmp       edx,dword ptr [ebp-44]
	jne       short @17
	cmp       eax,dword ptr [ebp-48]
@17:
	setne     cl
	and       ecx,1
	jmp       short @15
@14:
	xor       ecx,ecx
@15:
	test      cl,cl
	jne       short @12
	?debug L 255
?live16386@32: ; 
	pushfd	
	?debug L 256
	push	 eax
	?debug L 257
	push	 ebx
	?debug L 258
	push	 ecx
	?debug L 259
	push	 edx
	?debug L 260
	push	 esi
	?debug L 261
	mov	 eax,000000001H
	?debug L 262
	xor	 ecx,ecx
	?debug L 263
	cpuid	
	?debug L 264
	mov	 ecx,000000001H
	?debug L 265
	shl	 ecx,27
	?debug L 266
	and	 ecx,edx
	?debug L 267
	xor	 eax,eax
	?debug L 268
	xor	 edx,edx
	?debug L 270
	test	 ecx,ecx
	?debug L 271
?live16386@272: ; EDI = &$addpfcia
	je        @18
	?debug L 272
?live16386@288: ; 
	mov	 eax,1
	?debug L 273
	cpuid	
	?debug L 274
?live16386@320: ; EDI = &$addpfcia
	jmp       @19
	?debug L 277
?live16386@336: ; 
tsc_amd_serialize_measure:
	?debug L 285
	__emit__	( 00fH )
	?debug L 286
	__emit__	( 031H )
	?debug L 290
@19:
tsc_intel_serialize_measure:
	?debug L 298
	__emit__	( 00fH )
	?debug L 299
	__emit__	( 031H )
	?debug L 302
@18:
tsc_exit:
	?debug L 303
	mov	 [dword ptr [ebp-28]],eax
	?debug L 304
	mov	 [dword ptr [ebp-36]],edx
	?debug L 305
	pop	 esi
	?debug L 306
	pop	 edx
	?debug L 307
	pop	 ecx
	?debug L 308
	pop	 ebx
	?debug L 309
	pop	 eax
	?debug L 310
	popfd	
	?debug L 312
?live16386@576: ; EDI = &$addpfcia
	mov       eax,dword ptr [ebp-36]
	xor       edx,edx
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 313
	mov       edx,dword ptr [ebp-20]
	xor       eax,eax
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 314
	mov       eax,dword ptr [ebp-28]
	xor       edx,edx
	or        eax,dword ptr [ebp-20]
	or        edx,dword ptr [ebp-16]
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 315
	push      8
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],0
	mov       dword ptr [edi+4],0
	?debug L 316
?live16386@640: ; 
	mov       eax,dword ptr [ebp-20]
	mov       edx,dword ptr [ebp-16]
	jmp       short @20
	?debug L 325
	xor       eax,eax
	xor       edx,edx
	?debug L 326
@21:
@20:
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@7:
	db        67,71,83,0
	dd        @@stk@cpu@rdtscex$qv+0
	dd        @7+0
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
	df	$addpfcia
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
?patch4	equ	@21-@@stk@cpu@rdtscex$qv+66
?patch5	equ	0
?patch6	equ	@21-@@stk@cpu@rdtscex$qv
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
$andpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_init$qv	segment virtual
	align	2
@@stk@cpu@tsc_init$qv	proc	near
?live16387@0:
	?debug L 329
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-52
	push      ebx
	mov       dword ptr [ebp-8],offset @22
@23:
	mov       ebx,offset $andpfcia
	jmp       short @25
	?debug L 332
?live16387@16: ; EBX = &$andpfcia
@24:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@25:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @24
	cmp       dword ptr [ebx],0
	jne       short @24
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
	jmp       short @28
@27:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@28:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @31
	cmp       dword ptr [ebx],0
@31:
	je        short @29
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @32
	cmp       eax,dword ptr [ebp-20]
@32:
	setne     cl
	and       ecx,1
	jmp       short @30
@29:
	xor       ecx,ecx
@30:
	test      cl,cl
	jne       short @27
	?debug L 334
	mov       dword ptr [_tsc_ADJ],0
	mov       dword ptr [_tsc_ADJ+4],0
	?debug L 335
	call      @@stk@cpu@tsc_start$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 336
	call      @@stk@cpu@tsc_checkpoint$qv
	mov       dword ptr [ebp-44],eax
	mov       dword ptr [ebp-40],edx
	?debug L 337
	mov       eax,dword ptr [ebp-44]
	mov       edx,dword ptr [ebp-40]
	cmp       edx,dword ptr [ebp-28]
	jne       short @34
	cmp       eax,dword ptr [ebp-32]
@34:
	jbe       short @33
	?debug L 338
	mov       eax,dword ptr [ebp-44]
	mov       edx,dword ptr [ebp-40]
	sub       eax,dword ptr [ebp-32]
	sbb       edx,dword ptr [ebp-28]
	mov       dword ptr [_tsc_ADJ],eax
	mov       dword ptr [_tsc_ADJ+4],edx
	?debug L 339
@33:
	mov       eax,dword ptr [_tsc_ADJ]
	mov       dword ptr [ebp-56],eax
	mov       eax,dword ptr [_tsc_ADJ+4]
	mov       dword ptr [ebp-52],eax
	?debug L 340
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 341
?live16387@144: ; 
	mov       eax,dword ptr [ebp-56]
	mov       edx,dword ptr [ebp-52]
	?debug L 342
@36:
@35:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@22:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_init$qv+0
	dd        @22+0
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
	df	$andpfcia
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
?patch7	equ	@36-@@stk@cpu@tsc_init$qv+64
?patch8	equ	0
?patch9	equ	@36-@@stk@cpu@tsc_init$qv
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
$iaepfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_start$qv	segment virtual
	align	2
@@stk@cpu@tsc_start$qv	proc	near
?live16388@0:
	?debug L 345
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-28
	push      ebx
	mov       dword ptr [ebp-8],offset @37
@38:
	mov       ebx,offset $iaepfcia
	jmp       short @40
	?debug L 348
?live16388@16: ; EBX = &$iaepfcia
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
	?debug L 349
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 350
	mov       eax,dword ptr [ebp-32]
	mov       dword ptr [_tsc_STARTED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_STARTED+4],eax
	?debug L 351
	mov       edx,dword ptr [ebp-32]
	mov       dword ptr [_tsc_LAST_MEASURED],edx
	mov       edx,dword ptr [ebp-28]
	mov       dword ptr [_tsc_LAST_MEASURED+4],edx
	?debug L 352
	mov       dword ptr [_tsc_PAUSED],0
	mov       dword ptr [_tsc_PAUSED+4],0
	mov       dword ptr [_tsc_ELAPSED],0
	mov       dword ptr [_tsc_ELAPSED+4],0
	?debug L 353
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 354
?live16388@112: ; 
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	?debug L 355
@49:
@48:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@37:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_start$qv+0
	dd        @37+0
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
	df	$iaepfcia
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
?patch10	equ	@49-@@stk@cpu@tsc_start$qv+49
?patch11	equ	0
?patch12	equ	@49-@@stk@cpu@tsc_start$qv
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
$aeepfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_checkpoint$qv	segment virtual
	align	2
@@stk@cpu@tsc_checkpoint$qv	proc	near
?live16389@0:
	?debug L 358
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-52
	push      ebx
	mov       dword ptr [ebp-8],offset @50
@51:
	mov       ebx,offset $aeepfcia
	jmp       short @53
	?debug L 361
?live16389@16: ; EBX = &$aeepfcia
@52:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@53:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @52
	cmp       dword ptr [ebx],0
	jne       short @52
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
	jmp       short @56
@55:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@56:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @59
	cmp       dword ptr [ebx],0
@59:
	je        short @57
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @60
	cmp       eax,dword ptr [ebp-20]
@60:
	setne     cl
	and       ecx,1
	jmp       short @58
@57:
	xor       ecx,ecx
@58:
	test      cl,cl
	jne       short @55
	?debug L 362
	mov       eax,dword ptr [_tsc_PAUSED]
	mov       dword ptr [ebp-32],eax
	mov       eax,dword ptr [_tsc_PAUSED+4]
	mov       dword ptr [ebp-28],eax
	?debug L 365
	cmp       dword ptr [ebp-28],0
	jne       short @61
	cmp       dword ptr [ebp-32],0
	jne       short @61
	?debug L 366
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 368
@61:
	mov       eax,dword ptr [_tsc_STARTED]
	mov       edx,dword ptr [_tsc_STARTED+4]
	sub       eax,dword ptr [_tsc_ADJ]
	sbb       edx,dword ptr [_tsc_ADJ+4]
	mov       dword ptr [ebp-44],eax
	mov       dword ptr [ebp-40],edx
	?debug L 369
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	cmp       edx,dword ptr [ebp-40]
	jne       short @64
	cmp       eax,dword ptr [ebp-44]
@64:
	jbe       short @63
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	sub       eax,dword ptr [ebp-44]
	sbb       edx,dword ptr [ebp-40]
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	jmp       short @65
	?debug L 371
@63:
	mov       dword ptr [ebp-56],0
	mov       dword ptr [ebp-52],0
	?debug L 373
@65:
	mov       eax,dword ptr [ebp-32]
	mov       dword ptr [_tsc_LAST_MEASURED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_LAST_MEASURED+4],eax
	?debug L 374
	mov       edx,dword ptr [ebp-56]
	mov       dword ptr [_tsc_ELAPSED],edx
	mov       edx,dword ptr [ebp-52]
	mov       dword ptr [_tsc_ELAPSED+4],edx
	?debug L 375
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 376
?live16389@176: ; 
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	?debug L 377
@67:
@66:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@50:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_checkpoint$qv+0
	dd        @50+0
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
	df	$aeepfcia
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
?patch13	equ	@67-@@stk@cpu@tsc_checkpoint$qv+67
?patch14	equ	0
?patch15	equ	@67-@@stk@cpu@tsc_checkpoint$qv
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
	?debug L 380
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @68
	?debug L 382
@69:
	mov       eax,dword ptr [_tsc_ELAPSED]
	mov       edx,dword ptr [_tsc_ELAPSED+4]
	?debug L 383
@71:
@70:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@68:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_elapsed$qv+0
	dd        @68+0
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
?patch16	equ	@71-@@stk@cpu@tsc_elapsed$qv+32
?patch17	equ	0
?patch18	equ	@71-@@stk@cpu@tsc_elapsed$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ihepfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_pause$qv	segment virtual
	align	2
@@stk@cpu@tsc_pause$qv	proc	near
?live16391@0:
	?debug L 386
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-28
	push      ebx
	mov       dword ptr [ebp-8],offset @72
@73:
	mov       ebx,offset $ihepfcia
	jmp       short @75
	?debug L 389
?live16391@16: ; EBX = &$ihepfcia
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
	?debug L 390
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 391
	mov       eax,dword ptr [ebp-32]
	mov       dword ptr [_tsc_PAUSED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_PAUSED+4],eax
	?debug L 392
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 393
?live16391@80: ; 
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
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
	dd        @@stk@cpu@tsc_pause$qv+0
	dd        @72+0
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
	df	$ihepfcia
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
?patch19	equ	@84-@@stk@cpu@tsc_pause$qv+51
?patch20	equ	0
?patch21	equ	@84-@@stk@cpu@tsc_pause$qv
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
$alepfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_resume$qv	segment virtual
	align	2
@@stk@cpu@tsc_resume$qv	proc	near
?live16392@0:
	?debug L 397
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-64
	push      ebx
	mov       dword ptr [ebp-8],offset @85
@86:
	mov       ebx,offset $alepfcia
	jmp       short @88
	?debug L 400
?live16392@16: ; EBX = &$alepfcia
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
	mov       eax,dword ptr [_tsc_STARTED]
	mov       dword ptr [ebp-32],eax
	mov       eax,dword ptr [_tsc_STARTED+4]
	mov       dword ptr [ebp-28],eax
	?debug L 402
	mov       edx,dword ptr [_tsc_PAUSED]
	mov       dword ptr [ebp-44],edx
	mov       edx,dword ptr [_tsc_PAUSED+4]
	mov       dword ptr [ebp-40],edx
	?debug L 403
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	?debug L 404
	mov       eax,dword ptr [ebp-56]
	mov       edx,dword ptr [ebp-52]
	sub       eax,dword ptr [ebp-44]
	sbb       edx,dword ptr [ebp-40]
	add       eax,dword ptr [ebp-32]
	adc       edx,dword ptr [ebp-28]
	mov       dword ptr [ebp-68],eax
	mov       dword ptr [ebp-64],edx
	?debug L 405
	mov       eax,dword ptr [ebp-68]
	mov       dword ptr [_tsc_STARTED],eax
	mov       eax,dword ptr [ebp-64]
	mov       dword ptr [_tsc_STARTED+4],eax
	mov       dword ptr [_tsc_PAUSED],0
	mov       dword ptr [_tsc_PAUSED+4],0
	?debug L 406
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 407
?live16392@128: ; 
	mov       eax,dword ptr [ebp-56]
	mov       edx,dword ptr [ebp-52]
	?debug L 408
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
	dd        @@stk@cpu@tsc_resume$qv+0
	dd        @85+0
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
	df	$alepfcia
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
?patch22	equ	@97-@@stk@cpu@tsc_resume$qv+75
?patch23	equ	0
?patch24	equ	@97-@@stk@cpu@tsc_resume$qv
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
$ioepfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_start_paused$qv	segment virtual
	align	2
@@stk@cpu@tsc_start_paused$qv	proc	near
?live16393@0:
	?debug L 411
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-28
	push      ebx
	mov       dword ptr [ebp-8],offset @98
@99:
	mov       ebx,offset $ioepfcia
	jmp       short @101
	?debug L 414
?live16393@16: ; EBX = &$ioepfcia
@100:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@101:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @100
	cmp       dword ptr [ebx],0
	jne       short @100
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
	jmp       short @104
@103:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@104:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @107
	cmp       dword ptr [ebx],0
@107:
	je        short @105
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @108
	cmp       eax,dword ptr [ebp-20]
@108:
	setne     cl
	and       ecx,1
	jmp       short @106
@105:
	xor       ecx,ecx
@106:
	test      cl,cl
	jne       short @103
	?debug L 415
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 416
	mov       eax,dword ptr [ebp-32]
	mov       dword ptr [_tsc_LAST_MEASURED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_LAST_MEASURED+4],eax
	?debug L 417
	mov       edx,dword ptr [ebp-32]
	mov       dword ptr [_tsc_STARTED],edx
	mov       edx,dword ptr [ebp-28]
	mov       dword ptr [_tsc_STARTED+4],edx
	?debug L 418
	mov       dword ptr [_tsc_ELAPSED],0
	mov       dword ptr [_tsc_ELAPSED+4],0
	mov       eax,dword ptr [ebp-32]
	mov       dword ptr [_tsc_PAUSED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_PAUSED+4],eax
	?debug L 419
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 420
?live16393@112: ; 
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	?debug L 421
@110:
@109:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@98:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_start_paused$qv+0
	dd        @98+0
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
	df	$ioepfcia
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
?patch25	equ	@110-@@stk@cpu@tsc_start_paused$qv+51
?patch26	equ	0
?patch27	equ	@110-@@stk@cpu@tsc_start_paused$qv
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
	?debug L 424
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @111
	?debug L 469
@112:
	xor       eax,eax
	?debug L 472
@114:
@113:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@111:
	db        67,71,83,0
	dd        @@stk@cpu@cpuid$qpuit1t1t1uiui+0
	dd        @111+0
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
?patch28	equ	@114-@@stk@cpu@cpuid$qpuit1t1t1uiui+82
?patch29	equ	0
?patch30	equ	@114-@@stk@cpu@cpuid$qpuit1t1t1uiui
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$acfpfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$iffpfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$ajfpfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$imfpfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$aagpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$idgpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ahgpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpuidex$qpuit1t1t1uiui	segment virtual
	align	2
@@stk@cpu@cpuidex$qpuit1t1t1uiui	proc	near
?live16395@0:
	?debug L 475
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-16
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @115
@116:
	mov       edi,dword ptr [ebp+28]
	mov       esi,dword ptr [ebp+24]
	mov       ebx,offset $ahgpfcia
	jmp       short @118
	?debug L 485
?live16395@16: ; EBX = &$ahgpfcia, ESI = a_feature, EDI = a_feature_ecx
@117:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@118:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @117
	cmp       dword ptr [ebx],0
	jne       short @117
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
	jmp       short @121
@120:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@121:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @124
	cmp       dword ptr [ebx],0
@124:
	je        short @122
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @125
	cmp       eax,dword ptr [ebp-20]
@125:
	setne     cl
	and       ecx,1
	jmp       short @123
@122:
	xor       ecx,ecx
@123:
	test      cl,cl
	jne       short @120
	?debug L 486
	cmp       esi,dword ptr [$aagpfcia]
	jne       short @126
	cmp       edi,dword ptr [$idgpfcia]
	jne       short @126
	?debug L 487
?live16395@48: ; EBX = &$ahgpfcia
	mov       eax,dword ptr [ebp+8]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$acfpfcia]
	mov       dword ptr [eax],edx
	?debug L 488
	mov       eax,dword ptr [ebp+12]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$iffpfcia]
	mov       dword ptr [eax],edx
	?debug L 489
	mov       ecx,dword ptr [ebp+16]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [$ajfpfcia]
	mov       dword ptr [ecx],eax
	?debug L 490
	mov       edx,dword ptr [ebp+20]
	push      4
	push      edx
	push      0
	call      _CG_DA_EPY
	mov       ecx,dword ptr [$imfpfcia]
	mov       dword ptr [edx],ecx
	?debug L 491
@127:
	mov       eax,dword ptr [$acfpfcia]
	?debug L 492
?live16395@128: ; EBX = &$ahgpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 493
?live16395@144: ; EAX = ret
	jmp       short @128
	?debug L 494
?live16395@160: ; EBX = &$ahgpfcia
@129:
	jmp       short @130
	?debug L 496
?live16395@176: ; EBX = &$ahgpfcia, ESI = a_feature, EDI = a_feature_ecx
@126:
	mov       dword ptr [$aagpfcia],esi
	?debug L 497
?live16395@192: ; EBX = &$ahgpfcia, EDI = a_feature_ecx
	mov       dword ptr [$idgpfcia],edi
	?debug L 700
?live16395@208: ; EBX = &$ahgpfcia
@130:
	mov       edx,dword ptr [ebp+8]
	push      4
	push      edx
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [edx]
	?debug L 701
?live16395@224: ; EBX = &$ahgpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 703
?live16395@240: ; 
@131:
@128:
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@115:
	db        67,71,83,0
	dd        @@stk@cpu@cpuidex$qpuit1t1t1uiui+0
	dd        @115+0
	db        236,255,255,255,32,0,0,0,5,0,0,0,20,0,0,0
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
	dw	50
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
	dw	51
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	12
	dw	0
	dw	1141
	dw	0
	dw	52
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	16
	dw	0
	dw	1141
	dw	0
	dw	53
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	20
	dw	0
	dw	1141
	dw	0
	dw	54
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	24
	dw	0
	dw	117
	dw	0
	dw	55
	dw	0
	dw	0
	dw	0
	dw	?patch34
	dw	529
	dw	?patch35
	dd	?live16395@16-@@stk@cpu@cpuidex$qpuit1t1t1uiui
	dd	?live16395@48-?live16395@16
	dw	23
	dd	?live16395@176-@@stk@cpu@cpuidex$qpuit1t1t1uiui
	dd	?live16395@192-?live16395@176
	dw	23
?patch35	equ	2
?patch34	equ	24
	dw	18
	dw	512
	dw	28
	dw	0
	dw	117
	dw	0
	dw	56
	dw	0
	dw	0
	dw	0
	dw	?patch36
	dw	529
	dw	?patch37
	dd	?live16395@16-@@stk@cpu@cpuidex$qpuit1t1t1uiui
	dd	?live16395@48-?live16395@16
	dw	24
	dd	?live16395@176-@@stk@cpu@cpuidex$qpuit1t1t1uiui
	dd	?live16395@208-?live16395@176
	dw	24
?patch37	equ	2
?patch36	equ	24
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	57
	dw	0
	dw	0
	dw	0
	dw	?patch38
	dw	529
	dw	?patch39
	dd	?live16395@224-@@stk@cpu@cpuidex$qpuit1t1t1uiui
	dd	?live16395@240-?live16395@224
	dw	17
?patch39	equ	1
?patch38	equ	14
	dw	22
	dw	513
	df	$ahgpfcia
	dw	0
	dw	4100
	dw	0
	dw	58
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	59
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$idgpfcia
	dw	0
	dw	117
	dw	0
	dw	60
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aagpfcia
	dw	0
	dw	117
	dw	0
	dw	61
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$imfpfcia
	dw	0
	dw	117
	dw	0
	dw	62
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ajfpfcia
	dw	0
	dw	117
	dw	0
	dw	63
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iffpfcia
	dw	0
	dw	117
	dw	0
	dw	64
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$acfpfcia
	dw	0
	dw	117
	dw	0
	dw	65
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
	df	@127
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	66
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
?patch40	equ	@129-@127
	dw	2
	dw	6
?patch31	equ	@131-@@stk@cpu@cpuidex$qpuit1t1t1uiui+74
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
$abhpfcia	label	dword
	dd	0
	dd	0
	dd	0
	dd	0
	db	1	dup(?)
	align	4
$iehpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_vendor$qv	segment virtual
	align	2
@@stk@cpu@cpu_vendor$qv	proc	near
?live16396@0:
	?debug L 706
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-16
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @132
@133:
	mov       ebx,offset $iehpfcia
	mov       esi,offset $abhpfcia
	jmp       short @135
	?debug L 713
?live16396@16: ; EBX = &$iehpfcia, ESI = &$abhpfcia
@134:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@135:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @134
	cmp       dword ptr [ebx],0
	jne       short @134
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
	jmp       short @138
@137:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@138:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @141
	cmp       dword ptr [ebx],0
@141:
	je        short @139
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 714
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
	?debug L 715
	push      4
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi],0
	je        short @143
	?debug L 716
	push      4
	push      esi
	push      12
	call      _CG_DA_EPY
	xor       edx,edx
	mov       dword ptr [esi+12],edx
	?debug L 718
@143:
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 719
?live16396@96: ; ESI = &$abhpfcia
	mov       eax,esi
	?debug L 718
?live16396@112: ; EBX = &$iehpfcia, ESI = &$abhpfcia
	mov       dword ptr [ebx+4],0
	?debug L 720
?live16396@128: ; 
@145:
@144:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
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
	dd	?patch43
	dd	?patch44
	dd	?patch45
	df	@@stk@cpu@cpu_vendor$qv
	dw	0
	dw	4119
	dw	0
	dw	67
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
	df	$iehpfcia
	dw	0
	dw	4100
	dw	0
	dw	68
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	69
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$abhpfcia
	dw	0
	dw	4121
	dw	0
	dw	70
	dw	0
	dw	0
	dw	0
?patch43	equ	@145-@@stk@cpu@cpu_vendor$qv+41
?patch44	equ	0
?patch45	equ	@145-@@stk@cpu@cpu_vendor$qv
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
$iohpfcia	label	dword
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
$acipfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_name$qv	segment virtual
	align	2
@@stk@cpu@cpu_name$qv	proc	near
?live16397@0:
	?debug L 723
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @146
@147:
	mov       edi,offset $iohpfcia
	?debug L 729
?live16397@16: ; EDI = &$iohpfcia
	push      4
	push      edi
	call      _CG_D_EP
	cmp       dword ptr [edi],0
	je        short @151
	?debug L 730
	mov       eax,edi
	jmp       @149
	?debug L 732
@150:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@151:
	cmp       dword ptr [$acipfcia+4],0
	jne       short @150
	cmp       dword ptr [$acipfcia],0
	jne       short @150
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$acipfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$acipfcia+4],edx
	jmp       short @154
@153:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@154:
	cmp       dword ptr [$acipfcia+4],0
	jne       short @157
	cmp       dword ptr [$acipfcia],0
@157:
	je        short @155
	mov       eax,dword ptr [$acipfcia]
	mov       edx,dword ptr [$acipfcia+4]
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
	?debug L 735
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
	?debug L 736
	mov       dword ptr [$acipfcia],0
	mov       dword ptr [$acipfcia+4],0
	?debug L 737
	push      12
	push      offset s@
	push      edi
	call      @@stk@mem@mov$qpvpxvxui
	jmp       @149
	?debug L 739
@159:
	mov       esi,-2147483646
	xor       ebx,ebx
	?debug L 741
?live16397@128: ; EBX = i, ESI = f, EDI = &$iohpfcia
@160:
	lea       eax,dword ptr [ebx+3]
	push      0
	shl       eax,2
	push      esi
	add       eax,edi
	push      offset $iohpfcia
	push      eax
	call      _CG_A_BP
	push      eax
	lea       edx,dword ptr [ebx+2]
	shl       edx,2
	add       edx,edi
	push      offset $iohpfcia
	push      edx
	call      _CG_A_BP
	push      edx
	lea       ecx,dword ptr [ebx+1]
	shl       ecx,2
	add       ecx,edi
	push      offset $iohpfcia
	push      ecx
	call      _CG_A_BP
	push      ecx
	mov       eax,ebx
	shl       eax,2
	add       eax,edi
	push      offset $iohpfcia
	push      eax
	call      _CG_A_BP
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 739
	inc       esi
	add       ebx,4
	cmp       ebx,12
	jb        short @160
	?debug L 743
?live16397@160: ; EDI = &$iohpfcia
	push      32
	push      edi
	call      @@stk@cstr@trim$qpcc
	?debug L 744
	mov       dword ptr [$acipfcia],0
	mov       dword ptr [$acipfcia+4],0
	?debug L 745
	mov       eax,edi
	?debug L 746
?live16397@208: ; 
@163:
@149:
	mov       dword ptr [ebp-4],ebp
	pop       edi
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
	dd	?patch46
	dd	?patch47
	dd	?patch48
	df	@@stk@cpu@cpu_name$qv
	dw	0
	dw	4122
	dw	0
	dw	71
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
	dw	72
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
	dw	73
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
	dw	74
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	75
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	76
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	77
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$acipfcia
	dw	0
	dw	4100
	dw	0
	dw	78
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	79
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iohpfcia
	dw	0
	dw	4124
	dw	0
	dw	80
	dw	0
	dw	0
	dw	0
?patch46	equ	@163-@@stk@cpu@cpu_name$qv+75
?patch47	equ	0
?patch48	equ	@163-@@stk@cpu@cpu_name$qv
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
$amipfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ipipfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_threads$qv	segment virtual
	align	2
@@stk@cpu@cpu_num_threads$qv	proc	near
?live16398@0:
	?debug L 749
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @164
@165:
	mov       ebx,offset $ipipfcia
	?debug L 755
?live16398@16: ; EBX = &$ipipfcia
	mov       eax,dword ptr [$amipfcia]
	cmp       eax,-1
	jne       @167
	?debug L 756
?live16398@32: ; EAX = @temp4
	jmp       short @169
	?debug L 758
?live16398@48: ; EBX = &$ipipfcia
@168:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@169:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @168
	cmp       dword ptr [ebx],0
	jne       short @168
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
	jmp       short @172
@171:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@172:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @175
	cmp       dword ptr [ebx],0
@175:
	je        short @173
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 761
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
	?debug L 763
	mov       eax,dword ptr [ebp-44]
	?debug L 761
	add       esp,24
	?debug L 763
	shr       eax,16
	and       eax,255
	?debug L 765
?live16398@128: ; EBX = &$ipipfcia, EAX = @temp3
	push      8
	?debug L 763
?live16398@144: ; EBX = &$ipipfcia
	inc       eax
	?debug L 765
?live16398@160: ; EBX = &$ipipfcia, EAX = @temp3
	push      ebx
	?debug L 763
?live16398@176: ; EBX = &$ipipfcia
	mov       dword ptr [$amipfcia],eax
	?debug L 765
?live16398@192: ; EBX = &$ipipfcia, EAX = @temp3
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 767
?live16398@208: ; 
@177:
@167:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch53
	dd	?patch54
	dd	?patch55
	df	@@stk@cpu@cpu_num_threads$qv
	dw	0
	dw	4125
	dw	0
	dw	81
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
	dw	82
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	83
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	84
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	85
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	86
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ipipfcia
	dw	0
	dw	4100
	dw	0
	dw	87
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	88
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$amipfcia
	dw	0
	dw	117
	dw	0
	dw	89
	dw	0
	dw	0
	dw	0
?patch53	equ	@177-@@stk@cpu@cpu_num_threads$qv+75
?patch54	equ	0
?patch55	equ	@177-@@stk@cpu@cpu_num_threads$qv
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
$adjpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$igjpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_cores$qv	segment virtual
	align	2
@@stk@cpu@cpu_num_cores$qv	proc	near
?live16399@0:
	?debug L 770
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @178
@179:
	mov       ebx,offset $igjpfcia
	?debug L 776
?live16399@16: ; EBX = &$igjpfcia
	mov       eax,dword ptr [$adjpfcia]
	cmp       eax,-1
	jne       @181
	?debug L 777
?live16399@32: ; EAX = @temp3
	jmp       short @183
	?debug L 779
?live16399@48: ; EBX = &$igjpfcia
@182:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@183:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @182
	cmp       dword ptr [ebx],0
	jne       short @182
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
	jmp       short @186
@185:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@186:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @189
	cmp       dword ptr [ebx],0
@189:
	je        short @187
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 782
	push      12
	push      offset s@+13
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       short @191
	cmp       eax,0
	jne       short @191
	?debug L 784
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
	?debug L 785
	mov       ecx,dword ptr [ebp-52]
	shr       ecx,26
	and       ecx,63
	inc       ecx
	mov       dword ptr [$adjpfcia],ecx
	?debug L 787
	jmp       short @193
	?debug L 789
@191:
	push      12
	push      offset s@+26
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       short @194
	cmp       eax,0
	jne       short @194
	?debug L 791
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
	?debug L 792
	mov       edx,dword ptr [ebp-36]
	and       edx,255
	inc       edx
	mov       dword ptr [$adjpfcia],edx
	?debug L 794
	jmp       short @193
	?debug L 795
@194:
	call      @@stk@cpu@cpu_num_threads$qv
	mov       dword ptr [$adjpfcia],eax
	?debug L 796
@193:
	mov       eax,dword ptr [$adjpfcia]
	?debug L 797
?live16399@224: ; EBX = &$igjpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 800
?live16399@240: ; 
@196:
@181:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch56
	dd	?patch57
	dd	?patch58
	df	@@stk@cpu@cpu_num_cores$qv
	dw	0
	dw	4127
	dw	0
	dw	90
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
	dw	91
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
	dw	92
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	93
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	94
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	95
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$igjpfcia
	dw	0
	dw	4100
	dw	0
	dw	96
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	97
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$adjpfcia
	dw	0
	dw	117
	dw	0
	dw	98
	dw	0
	dw	0
	dw	0
?patch56	equ	@196-@@stk@cpu@cpu_num_cores$qv+74
?patch57	equ	0
?patch58	equ	@196-@@stk@cpu@cpu_num_cores$qv
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
$akjpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$injpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_cache_size$quc	segment virtual
	align	2
@@stk@cpu@cpu_cache_size$quc	proc	near
?live16400@0:
	?debug L 801
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @197
@198:
	mov       ebx,dword ptr [ebp+8]
	mov       esi,offset $injpfcia
	mov       edi,offset $akjpfcia
	?debug L 807
?live16400@16: ; EBX = a_level, ESI = &$injpfcia, EDI = &$akjpfcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       eax,dword ptr [edi]
	cmp       eax,-1
	jne       @200
	?debug L 808
?live16400@32: ; EAX = @temp5, EDI = &$akjpfcia
	jmp       short @202
	?debug L 810
?live16400@48: ; EBX = a_level, ESI = &$injpfcia, EDI = &$akjpfcia
@201:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@202:
	push      8
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi+4],0
	jne       short @201
	cmp       dword ptr [esi],0
	jne       short @201
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
	jmp       short @205
@204:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@205:
	push      8
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi+4],0
	jne       short @208
	cmp       dword ptr [esi],0
@208:
	je        short @206
	push      8
	push      esi
	call      _CG_D_EP
	mov       eax,dword ptr [esi]
	mov       edx,dword ptr [esi+4]
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
	?debug L 813
	push      12
	push      offset s@+13
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       @210
	cmp       eax,0
	jne       @210
	?debug L 814
	cmp       bl,2
	jne       @212
	?debug L 815
?live16400@96: ; ESI = &$injpfcia, EDI = &$akjpfcia
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
	?debug L 816
	mov       eax,dword ptr [ebp-28]
	and       eax,255
	cmp       eax,64
	jne       short @213
	?debug L 817
	push      4
	push      edi
	call      _CG_D_EP
	xor       edx,edx
	mov       dword ptr [edi],edx
	jmp       @214
	?debug L 819
?live16400@144: ; ESI = &$injpfcia, EAX = @temp4, EDI = &$akjpfcia
@213:
	cmp       eax,65
	jne       short @215
	?debug L 820
?live16400@160: ; ESI = &$injpfcia, EDI = &$akjpfcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],128
	jmp       @214
	?debug L 822
?live16400@176: ; ESI = &$injpfcia, EAX = @temp4, EDI = &$akjpfcia
@215:
	cmp       eax,66
	jne       short @216
	?debug L 823
?live16400@192: ; ESI = &$injpfcia, EDI = &$akjpfcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],256
	jmp       @214
	?debug L 825
?live16400@208: ; ESI = &$injpfcia, EAX = @temp4, EDI = &$akjpfcia
@216:
	cmp       eax,67
	jne       short @217
	?debug L 826
?live16400@224: ; ESI = &$injpfcia, EDI = &$akjpfcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],512
	jmp       @214
	?debug L 828
?live16400@240: ; ESI = &$injpfcia, EAX = @temp4, EDI = &$akjpfcia
@217:
	cmp       eax,68
	jne       short @218
	?debug L 829
?live16400@256: ; ESI = &$injpfcia, EDI = &$akjpfcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],1024
	jmp       @214
	?debug L 831
?live16400@272: ; ESI = &$injpfcia, EAX = @temp4, EDI = &$akjpfcia
@218:
	cmp       eax,69
	jne       short @219
	?debug L 832
?live16400@288: ; ESI = &$injpfcia, EDI = &$akjpfcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],2048
	jmp       @214
	?debug L 836
@219:
	push      4
	push      edi
	call      _CG_D_EP
	xor       ecx,ecx
	mov       dword ptr [edi],ecx
	?debug L 838
	jmp       @214
	?debug L 839
@212:
	push      4
	push      edi
	call      _CG_D_EP
	xor       eax,eax
	mov       dword ptr [edi],eax
	?debug L 840
	jmp       @214
	?debug L 842
?live16400@368: ; EBX = a_level, ESI = &$injpfcia, EDI = &$akjpfcia
@210:
	push      12
	push      offset s@+26
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       short @221
	cmp       eax,0
@221:
	jne       @222
	?debug L 843
	test      bl,bl
	jne       short @223
	?debug L 844
?live16400@400: ; ESI = &$injpfcia, EDI = &$akjpfcia
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
	?debug L 845
	mov       ecx,dword ptr [ebp-28]
	shr       ecx,24
	and       ecx,255
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],ecx
	?debug L 846
	jmp       @224
	?debug L 848
?live16400@448: ; EBX = a_level, ESI = &$injpfcia, EDI = &$akjpfcia
@223:
	cmp       bl,1
	jne       short @225
	?debug L 849
?live16400@464: ; ESI = &$injpfcia, EDI = &$akjpfcia
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
	?debug L 850
	mov       edx,dword ptr [ebp-36]
	shr       edx,24
	and       edx,255
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],edx
	?debug L 851
	jmp       short @224
	?debug L 853
?live16400@512: ; EBX = a_level, ESI = &$injpfcia, EDI = &$akjpfcia
@225:
	cmp       bl,2
	jne       short @226
	?debug L 854
?live16400@528: ; ESI = &$injpfcia, EDI = &$akjpfcia
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
	?debug L 855
	mov       eax,dword ptr [ebp-36]
	shr       eax,16
	and       eax,65535
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],eax
	?debug L 856
	jmp       short @224
	?debug L 858
?live16400@576: ; EBX = a_level, ESI = &$injpfcia, EDI = &$akjpfcia
@226:
	cmp       bl,3
	jne       short @227
	?debug L 859
?live16400@592: ; ESI = &$injpfcia, EDI = &$akjpfcia
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
	?debug L 860
	mov       ecx,dword ptr [ebp-28]
	shr       ecx,18
	and       ecx,16383
	shl       ecx,9
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],ecx
	?debug L 863
@227:
@224:
@222:
@214:
	push      4
	push      edi
	call      _CG_D_EP
	mov       eax,dword ptr [edi]
	?debug L 864
?live16400@640: ; ESI = &$injpfcia, EAX = ret
	push      8
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],0
	mov       dword ptr [esi+4],0
	?debug L 866
?live16400@656: ; 
@228:
@200:
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
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
	dd	?patch61
	dd	?patch62
	dd	?patch63
	df	@@stk@cpu@cpu_cache_size$quc
	dw	0
	dw	4129
	dw	0
	dw	99
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
	dw	100
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
	dw	101
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
	dw	102
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	103
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	104
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	105
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$injpfcia
	dw	0
	dw	4100
	dw	0
	dw	106
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	107
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$akjpfcia
	dw	0
	dw	117
	dw	0
	dw	108
	dw	0
	dw	0
	dw	0
?patch61	equ	@228-@@stk@cpu@cpu_cache_size$quc+76
?patch62	equ	0
?patch63	equ	@228-@@stk@cpu@cpu_cache_size$quc
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
$abkpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$iekpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_cache_line_size$quc	segment virtual
	align	2
@@stk@cpu@cpu_cache_line_size$quc	proc	near
?live16401@0:
	?debug L 869
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @229
@230:
	mov       ebx,dword ptr [ebp+8]
	mov       esi,offset $iekpfcia
	?debug L 875
?live16401@16: ; ESI = &$iekpfcia, EBX = a_level
	mov       eax,dword ptr [$abkpfcia]
	cmp       eax,-1
	jne       @232
	?debug L 876
?live16401@32: ; EAX = @temp4
	jmp       short @234
	?debug L 878
?live16401@48: ; ESI = &$iekpfcia, EBX = a_level
@233:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@234:
	push      8
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi+4],0
	jne       short @233
	cmp       dword ptr [esi],0
	jne       short @233
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
	jmp       short @237
@236:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@237:
	push      8
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi+4],0
	jne       short @240
	cmp       dword ptr [esi],0
@240:
	je        short @238
	push      8
	push      esi
	call      _CG_D_EP
	mov       eax,dword ptr [esi]
	mov       edx,dword ptr [esi+4]
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
	?debug L 881
	push      12
	push      offset s@+13
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       short @242
	cmp       eax,0
	jne       short @242
	?debug L 882
?live16401@80: ; ESI = &$iekpfcia
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
	?debug L 883
	mov       ecx,dword ptr [ebp-44]
	and       ecx,4095
	inc       ecx
	mov       dword ptr [$abkpfcia],ecx
	?debug L 884
	jmp       @244
	?debug L 886
?live16401@128: ; ESI = &$iekpfcia, EBX = a_level
@242:
	push      12
	push      offset s@+26
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       @245
	cmp       eax,0
	jne       @245
	?debug L 887
	test      bl,bl
	jne       short @247
	?debug L 888
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
	?debug L 889
	mov       edx,dword ptr [ebp-28]
	and       edx,255
	mov       dword ptr [$abkpfcia],edx
	?debug L 891
@247:
	cmp       bl,1
	jne       short @248
	?debug L 892
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
	?debug L 893
	mov       eax,dword ptr [ebp-36]
	and       eax,255
	mov       dword ptr [$abkpfcia],eax
	?debug L 895
@248:
	cmp       bl,2
	jne       short @249
	?debug L 896
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
	?debug L 897
	mov       ecx,dword ptr [ebp-36]
	and       ecx,255
	mov       dword ptr [$abkpfcia],ecx
	?debug L 899
@249:
	cmp       bl,3
	jne       short @250
	?debug L 900
?live16401@304: ; ESI = &$iekpfcia
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
	?debug L 901
	mov       edx,dword ptr [ebp-28]
	and       edx,255
	mov       dword ptr [$abkpfcia],edx
	?debug L 904
@250:
@245:
@244:
	mov       eax,dword ptr [$abkpfcia]
	?debug L 905
?live16401@352: ; ESI = &$iekpfcia, EAX = ret
	push      8
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],0
	mov       dword ptr [esi+4],0
	?debug L 908
?live16401@368: ; 
@251:
@232:
	mov       dword ptr [ebp-4],ebp
	pop       esi
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
	dd	?patch68
	dd	?patch69
	dd	?patch70
	df	@@stk@cpu@cpu_cache_line_size$quc
	dw	0
	dw	4131
	dw	0
	dw	109
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
	dw	110
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
	dw	111
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
	dw	112
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	113
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	114
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	115
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iekpfcia
	dw	0
	dw	4100
	dw	0
	dw	116
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	117
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$abkpfcia
	dw	0
	dw	117
	dw	0
	dw	118
	dw	0
	dw	0
	dw	0
?patch68	equ	@251-@@stk@cpu@cpu_cache_line_size$quc+73
?patch69	equ	0
?patch70	equ	@251-@@stk@cpu@cpu_cache_line_size$quc
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
$aikpfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$ilkpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_mhz$qo	segment virtual
	align	2
@@stk@cpu@cpu_num_mhz$qo	proc	near
?live16402@0:
	?debug L 911
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-168
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @252
	?debug L 917
@253:
	mov       eax,dword ptr [$aikpfcia]
	test      eax,eax
	je        short @257
	cmp       byte ptr [ebp+8],0
	je        @255
	?debug L 918
?live16402@32: ; EAX = @temp18
	jmp       short @257
	?debug L 920
?live16402@48: ; 
@256:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@257:
	cmp       dword ptr [$ilkpfcia+4],0
	jne       short @256
	cmp       dword ptr [$ilkpfcia],0
	jne       short @256
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$ilkpfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$ilkpfcia+4],edx
	jmp       short @260
@259:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@260:
	cmp       dword ptr [$ilkpfcia+4],0
	jne       short @263
	cmp       dword ptr [$ilkpfcia],0
@263:
	je        short @261
	mov       eax,dword ptr [$ilkpfcia]
	mov       edx,dword ptr [$ilkpfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @264
	cmp       eax,dword ptr [ebp-20]
@264:
	setne     cl
	and       ecx,1
	jmp       short @262
@261:
	xor       ecx,ecx
@262:
	test      cl,cl
	jne       short @259
	?debug L 933
	xor       ebx,ebx
	?debug L 934
?live16402@80: ; EBX = i
@265:
	call      @@stk@cpu@tsc_init$qv
	?debug L 935
	call      @@stk@cpu@tsc_start$qv
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-68],eax
	mov       dword ptr [ebp-64],edx
	call      @@stk@cpu@tsc_checkpoint$qv
	?debug L 936
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-128],eax
	mov       dword ptr [ebp-124],edx
	?debug L 937
@267:
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-80],eax
	mov       dword ptr [ebp-76],edx
	?debug L 938
	mov       eax,dword ptr [ebp-80]
	mov       edx,dword ptr [ebp-76]
	cmp       edx,dword ptr [ebp-64]
	jne       short @269
	cmp       eax,dword ptr [ebp-68]
@269:
	jbe       short @267
	?debug L 939
	call      @@stk@cpu@tsc_start$qv
	?debug L 940
@270:
	mov       edx,21
	?debug L 941
?live16402@192: ; EBX = i, EDX = trash1
@271:
	xor       eax,eax
@273:
	inc       eax
	cmp       eax,1000000
	jb        short @273
	?debug L 940
	dec       edx
	test      edx,edx
	ja        short @271
	?debug L 944
?live16402@224: ; EBX = i
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-92],eax
	mov       dword ptr [ebp-88],edx
	?debug L 945
@277:
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-104],eax
	mov       dword ptr [ebp-100],edx
	?debug L 946
	mov       eax,dword ptr [ebp-104]
	mov       edx,dword ptr [ebp-100]
	cmp       edx,dword ptr [ebp-88]
	jne       short @279
	cmp       eax,dword ptr [ebp-92]
@279:
	jbe       short @277
	?debug L 947
	call      @@stk@cpu@tsc_checkpoint$qv
	?debug L 948
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	?debug L 949
	mov       eax,dword ptr [ebp-104]
	mov       edx,dword ptr [ebp-100]
	sub       eax,dword ptr [ebp-80]
	sbb       edx,dword ptr [ebp-76]
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	?debug L 950
	mov       eax,dword ptr [ebp-116]
	mov       edx,dword ptr [ebp-112]
	sub       eax,dword ptr [ebp-128]
	sbb       edx,dword ptr [ebp-124]
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	?debug L 951
	push      0
	push      1000
	mov       eax,dword ptr [ebp-116]
	mov       edx,dword ptr [ebp-112]
	call      __llmul
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	?debug L 952
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
	?debug L 953
@280:
	mov       dword ptr [ebp-116],0
	mov       dword ptr [ebp-112],0
	?debug L 954
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
	?debug L 956
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
	?debug L 957
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
	?debug L 958
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
	?debug L 960
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
	?debug L 962
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
	?debug L 963
	mov       eax,dword ptr [ebp-116]
	mov       ecx,eax
	mov       dword ptr [$aikpfcia],ecx
	?debug L 965
?live16402@496: ; ECX = @temp17
	mov       dword ptr [$ilkpfcia],0
	mov       dword ptr [$ilkpfcia+4],0
	?debug L 966
	mov       eax,ecx
	?debug L 967
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
	dd	?patch75
	dd	?patch76
	dd	?patch77
	df	@@stk@cpu@cpu_num_mhz$qo
	dw	0
	dw	4133
	dw	0
	dw	119
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
	dw	120
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65408
	dw	65535
	dw	119
	dw	0
	dw	121
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65420
	dw	65535
	dw	119
	dw	0
	dw	122
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65432
	dw	65535
	dw	119
	dw	0
	dw	123
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65444
	dw	65535
	dw	119
	dw	0
	dw	124
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65456
	dw	65535
	dw	119
	dw	0
	dw	125
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65468
	dw	65535
	dw	119
	dw	0
	dw	126
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65480
	dw	65535
	dw	119
	dw	0
	dw	127
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	20
	dw	128
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
	dw	129
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
	dw	130
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
	dw	131
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	119
	dw	0
	dw	132
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65504
	dw	65535
	dw	119
	dw	0
	dw	133
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ilkpfcia
	dw	0
	dw	4100
	dw	0
	dw	134
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	135
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aikpfcia
	dw	0
	dw	117
	dw	0
	dw	136
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
	df	@270
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	137
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	19
	dw	138
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
?patch84	equ	@283-@270
	dw	2
	dw	6
?patch75	equ	@296-@@stk@cpu@cpu_num_mhz$qo+131
?patch76	equ	0
?patch77	equ	@296-@@stk@cpu@cpu_num_mhz$qo
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
$iflpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ajlpfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_x87$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_x87$qv	proc	near
?live16403@0:
	?debug L 972
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @297
@298:
	mov       ebx,offset $ajlpfcia
	?debug L 978
?live16403@16: ; EBX = &$ajlpfcia
	mov       eax,dword ptr [$iflpfcia]
	cmp       eax,-1
	je        short @302
	?debug L 979
?live16403@32: ; EAX = @temp2
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @300
	?debug L 981
?live16403@48: ; EBX = &$ajlpfcia
@301:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@302:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @301
	cmp       dword ptr [ebx],0
	jne       short @301
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
	jmp       short @305
@304:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@305:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @308
	cmp       dword ptr [ebx],0
@308:
	je        short @306
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 984
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
	?debug L 986
	test      byte ptr [ebp-28],1
	je        short @310
	?debug L 987
	mov       dword ptr [$iflpfcia],1
	?debug L 988
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 989
?live16403@128: ; 
	mov       al,1
	jmp       short @300
	?debug L 993
?live16403@144: ; EBX = &$ajlpfcia
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
	?debug L 995
	test      byte ptr [ebp-28],1
	je        short @311
	?debug L 996
	mov       dword ptr [$iflpfcia],1
	?debug L 997
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 998
?live16403@208: ; 
	mov       al,1
	jmp       short @300
	?debug L 1000
?live16403@224: ; EBX = &$ajlpfcia
@311:
	xor       edx,edx
	mov       dword ptr [$iflpfcia],edx
	?debug L 1001
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1002
?live16403@256: ; 
	xor       eax,eax
	?debug L 1001
?live16403@272: ; EBX = &$ajlpfcia
	mov       dword ptr [ebx+4],0
	?debug L 1003
?live16403@288: ; 
@312:
@300:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch87
	dd	?patch88
	dd	?patch89
	df	@@stk@cpu@cpu_has_x87$qv
	dw	0
	dw	4136
	dw	0
	dw	139
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
	dw	140
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	141
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	142
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	143
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ajlpfcia
	dw	0
	dw	4100
	dw	0
	dw	144
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	145
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iflpfcia
	dw	0
	dw	117
	dw	0
	dw	146
	dw	0
	dw	0
	dw	0
?patch87	equ	@312-@@stk@cpu@cpu_has_x87$qv+72
?patch88	equ	0
?patch89	equ	@312-@@stk@cpu@cpu_has_x87$qv
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
@stk@cpu@cpu_has_mmx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mmx$qv	proc	near
?live16404@0:
	?debug L 1006
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @313
@314:
	mov       ebx,offset $aampfcia
	?debug L 1012
?live16404@16: ; EBX = &$aampfcia
	mov       eax,dword ptr [$imlpfcia]
	cmp       eax,-1
	je        short @318
	?debug L 1013
?live16404@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @316
	?debug L 1015
?live16404@48: ; EBX = &$aampfcia
@317:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@318:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @317
	cmp       dword ptr [ebx],0
	jne       short @317
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
	jmp       short @321
@320:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@321:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @324
	cmp       dword ptr [ebx],0
@324:
	je        short @322
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1018
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
	and       eax,8388608
	mov       dword ptr [$imlpfcia],eax
	?debug L 1021
?live16404@96: ; EBX = &$aampfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1022
?live16404@112: ; EBX = &$aampfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1024
?live16404@128: ; 
@326:
@316:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch90
	dd	?patch91
	dd	?patch92
	df	@@stk@cpu@cpu_has_mmx$qv
	dw	0
	dw	4138
	dw	0
	dw	147
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
	dw	148
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
	dw	149
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	150
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	151
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	152
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aampfcia
	dw	0
	dw	4100
	dw	0
	dw	153
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	154
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$imlpfcia
	dw	0
	dw	117
	dw	0
	dw	155
	dw	0
	dw	0
	dw	0
?patch90	equ	@326-@@stk@cpu@cpu_has_mmx$qv+72
?patch91	equ	0
?patch92	equ	@326-@@stk@cpu@cpu_has_mmx$qv
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
@stk@cpu@cpu_has_mmxext$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mmxext$qv	proc	near
?live16405@0:
	?debug L 1027
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @327
@328:
	mov       ebx,offset $ahmpfcia
	?debug L 1033
?live16405@16: ; EBX = &$ahmpfcia
	mov       eax,dword ptr [$idmpfcia]
	cmp       eax,-1
	je        short @332
	?debug L 1034
?live16405@32: ; EAX = @temp5
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @330
	?debug L 1036
?live16405@48: ; EBX = &$ahmpfcia
@331:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@332:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @331
	cmp       dword ptr [ebx],0
	jne       short @331
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
	jmp       short @335
@334:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@335:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @338
	cmp       dword ptr [ebx],0
@338:
	je        short @336
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	and       eax,4194304
	mov       dword ptr [$idmpfcia],eax
	?debug L 1042
?live16405@96: ; EBX = &$ahmpfcia, EAX = @temp3
	test      eax,eax
	je        short @340
	?debug L 1043
?live16405@112: ; 
	mov       al,1
	jmp       short @330
	?debug L 1045
?live16405@128: ; EBX = &$ahmpfcia
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
	add       esp,24
	?debug L 1047
	mov       eax,dword ptr [ebp-28]
	and       eax,33554432
	mov       dword ptr [$idmpfcia],eax
	?debug L 1048
?live16405@160: ; EBX = &$ahmpfcia, EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1049
?live16405@176: ; EBX = &$ahmpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1051
?live16405@192: ; 
@341:
@330:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch95
	dd	?patch96
	dd	?patch97
	df	@@stk@cpu@cpu_has_mmxext$qv
	dw	0
	dw	4140
	dw	0
	dw	156
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
	dw	157
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
	dw	158
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	159
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	160
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	161
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ahmpfcia
	dw	0
	dw	4100
	dw	0
	dw	162
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	163
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$idmpfcia
	dw	0
	dw	117
	dw	0
	dw	164
	dw	0
	dw	0
	dw	0
?patch95	equ	@341-@@stk@cpu@cpu_has_mmxext$qv+72
?patch96	equ	0
?patch97	equ	@341-@@stk@cpu@cpu_has_mmxext$qv
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
@stk@cpu@cpu_has_amd64$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_amd64$qv	proc	near
?live16406@0:
	?debug L 1054
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @342
@343:
	mov       ebx,offset $aompfcia
	?debug L 1060
?live16406@16: ; EBX = &$aompfcia
	mov       eax,dword ptr [$ikmpfcia]
	cmp       eax,-1
	je        short @347
	?debug L 1061
?live16406@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @345
	?debug L 1063
?live16406@48: ; EBX = &$aompfcia
@346:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@347:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @346
	cmp       dword ptr [ebx],0
	jne       short @346
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
	jmp       short @350
@349:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@350:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @353
	cmp       dword ptr [ebx],0
@353:
	je        short @351
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1066
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
	?debug L 1068
	mov       eax,dword ptr [ebp-28]
	and       eax,536870912
	mov       dword ptr [$ikmpfcia],eax
	?debug L 1069
?live16406@96: ; EBX = &$aompfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1070
?live16406@112: ; EBX = &$aompfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1072
?live16406@128: ; 
@355:
@345:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch100
	dd	?patch101
	dd	?patch102
	df	@@stk@cpu@cpu_has_amd64$qv
	dw	0
	dw	4142
	dw	0
	dw	165
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
	dw	166
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
	dw	167
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	168
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	169
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	170
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aompfcia
	dw	0
	dw	4100
	dw	0
	dw	171
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	172
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ikmpfcia
	dw	0
	dw	117
	dw	0
	dw	173
	dw	0
	dw	0
	dw	0
?patch100	equ	@355-@@stk@cpu@cpu_has_amd64$qv+73
?patch101	equ	0
?patch102	equ	@355-@@stk@cpu@cpu_has_amd64$qv
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
@stk@cpu@cpu_has_ht$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_ht$qv	proc	near
?live16407@0:
	?debug L 1075
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @356
@357:
	mov       ebx,offset $afnpfcia
	?debug L 1081
?live16407@16: ; EBX = &$afnpfcia
	mov       eax,dword ptr [$ibnpfcia]
	cmp       eax,-1
	je        short @361
	?debug L 1082
?live16407@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @359
	?debug L 1084
?live16407@48: ; EBX = &$afnpfcia
@360:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@361:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @360
	cmp       dword ptr [ebx],0
	jne       short @360
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
	jmp       short @364
@363:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@364:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @367
	cmp       dword ptr [ebx],0
@367:
	je        short @365
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1087
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
	?debug L 1089
	mov       eax,dword ptr [ebp-28]
	and       eax,268435456
	mov       dword ptr [$ibnpfcia],eax
	?debug L 1090
?live16407@96: ; EBX = &$afnpfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1091
?live16407@112: ; EBX = &$afnpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1093
?live16407@128: ; 
@369:
@359:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch105
	dd	?patch106
	dd	?patch107
	df	@@stk@cpu@cpu_has_ht$qv
	dw	0
	dw	4144
	dw	0
	dw	174
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
	dw	175
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
	dw	176
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	177
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	178
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	179
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$afnpfcia
	dw	0
	dw	4100
	dw	0
	dw	180
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	181
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ibnpfcia
	dw	0
	dw	117
	dw	0
	dw	182
	dw	0
	dw	0
	dw	0
?patch105	equ	@369-@@stk@cpu@cpu_has_ht$qv+72
?patch106	equ	0
?patch107	equ	@369-@@stk@cpu@cpu_has_ht$qv
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
@stk@cpu@cpu_has_sse$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sse$qv	proc	near
?live16408@0:
	?debug L 1096
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @370
@371:
	mov       ebx,offset $amnpfcia
	mov       esi,offset $iinpfcia
	?debug L 1102
?live16408@16: ; EBX = &$amnpfcia, ESI = &$iinpfcia
	push      4
	push      esi
	call      _CG_D_EP
	mov       eax,dword ptr [esi]
	cmp       eax,-1
	jne       @373
	?debug L 1103
?live16408@32: ; EAX = @temp3, ESI = &$iinpfcia
	jmp       short @375
	?debug L 1105
?live16408@48: ; EBX = &$amnpfcia, ESI = &$iinpfcia
@374:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@375:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @374
	cmp       dword ptr [ebx],0
	jne       short @374
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
	jmp       short @378
@377:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@378:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @381
	cmp       dword ptr [ebx],0
@381:
	je        short @379
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1108
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
	?debug L 1110
	test      byte ptr [ebp-34],16
	je        short @383
	?debug L 1111
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],42
	jmp       short @384
	?debug L 1113
@383:
	test      byte ptr [ebp-34],8
	je        short @385
	?debug L 1114
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],41
	jmp       short @384
	?debug L 1116
@385:
	test      byte ptr [ebp-35],2
	je        short @386
	?debug L 1117
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],31
	jmp       short @384
	?debug L 1119
@386:
	test      byte ptr [ebp-36],1
	je        short @387
	?debug L 1120
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],30
	jmp       short @384
	?debug L 1122
@387:
	test      byte ptr [ebp-25],4
	je        short @388
	?debug L 1123
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],20
	jmp       short @384
	?debug L 1125
@388:
	test      byte ptr [ebp-25],2
	je        short @389
	?debug L 1126
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],10
	jmp       short @384
	?debug L 1128
@389:
	push      4
	push      esi
	call      _CG_D_EP
	xor       ecx,ecx
	mov       dword ptr [esi],ecx
	?debug L 1129
@384:
	push      4
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi],0
	setne     al
	and       eax,1
	?debug L 1130
?live16408@304: ; EBX = &$amnpfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1131
?live16408@320: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	?debug L 1130
?live16408@336: ; EBX = &$amnpfcia, EAX = ret
	mov       dword ptr [ebx+4],0
	?debug L 1131
?live16408@352: ; EAX = ret
	mov       eax,edx
	?debug L 1132
?live16408@368: ; 
@390:
@373:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
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
	dd	?patch110
	dd	?patch111
	dd	?patch112
	df	@@stk@cpu@cpu_has_sse$qv
	dw	0
	dw	4146
	dw	0
	dw	183
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
	dw	184
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
	dw	185
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	186
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	187
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	188
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$amnpfcia
	dw	0
	dw	4100
	dw	0
	dw	189
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	190
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iinpfcia
	dw	0
	dw	117
	dw	0
	dw	191
	dw	0
	dw	0
	dw	0
?patch110	equ	@390-@@stk@cpu@cpu_has_sse$qv+74
?patch111	equ	0
?patch112	equ	@390-@@stk@cpu@cpu_has_sse$qv
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
$ipnpfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$adopfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sse4a$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sse4a$qv	proc	near
?live16409@0:
	?debug L 1135
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @391
@392:
	mov       ebx,offset $adopfcia
	?debug L 1141
?live16409@16: ; EBX = &$adopfcia
	mov       eax,dword ptr [$ipnpfcia]
	cmp       eax,-1
	je        short @396
	?debug L 1142
?live16409@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @394
	?debug L 1144
?live16409@48: ; EBX = &$adopfcia
@395:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@396:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @395
	cmp       dword ptr [ebx],0
	jne       short @395
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
	jmp       short @399
@398:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@399:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @402
	cmp       dword ptr [ebx],0
@402:
	je        short @400
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1147
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
	?debug L 1149
	mov       eax,dword ptr [ebp-36]
	and       eax,64
	mov       dword ptr [$ipnpfcia],eax
	?debug L 1150
?live16409@96: ; EBX = &$adopfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1151
?live16409@112: ; EBX = &$adopfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1153
?live16409@128: ; 
@404:
@394:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch115
	dd	?patch116
	dd	?patch117
	df	@@stk@cpu@cpu_has_sse4a$qv
	dw	0
	dw	4148
	dw	0
	dw	192
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
	dw	193
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
	dw	194
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	195
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	196
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	197
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$adopfcia
	dw	0
	dw	4100
	dw	0
	dw	198
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	199
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ipnpfcia
	dw	0
	dw	117
	dw	0
	dw	200
	dw	0
	dw	0
	dw	0
?patch115	equ	@404-@@stk@cpu@cpu_has_sse4a$qv+75
?patch116	equ	0
?patch117	equ	@404-@@stk@cpu@cpu_has_sse4a$qv
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
@stk@cpu@cpu_has_avx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx$qv	proc	near
?live16410@0:
	?debug L 1156
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @405
@406:
	mov       ebx,offset $akopfcia
	?debug L 1162
?live16410@16: ; EBX = &$akopfcia
	mov       eax,dword ptr [$igopfcia]
	cmp       eax,-1
	jne       @408
	?debug L 1163
?live16410@32: ; EAX = @temp3
	jmp       short @410
	?debug L 1165
?live16410@48: ; EBX = &$akopfcia
@409:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@410:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @409
	cmp       dword ptr [ebx],0
	jne       short @409
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
	jmp       short @413
@412:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@413:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @416
	cmp       dword ptr [ebx],0
@416:
	je        short @414
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1168
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
	?debug L 1170
	test      byte ptr [ebp-33],16
	je        short @418
	?debug L 1171
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
	?debug L 1172
	test      byte ptr [ebp-44],32
	je        short @419
	?debug L 1173
	mov       dword ptr [$igopfcia],2
	jmp       short @420
	?debug L 1175
@419:
	mov       dword ptr [$igopfcia],1
	?debug L 1176
	jmp       short @420
	?debug L 1178
@418:
	xor       eax,eax
	mov       dword ptr [$igopfcia],eax
	?debug L 1180
@420:
	cmp       dword ptr [$igopfcia],0
	setne     al
	and       eax,1
	?debug L 1181
?live16410@208: ; EBX = &$akopfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1182
?live16410@224: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	?debug L 1181
?live16410@240: ; EBX = &$akopfcia, EAX = ret
	mov       dword ptr [ebx+4],0
	?debug L 1182
?live16410@256: ; EAX = ret
	mov       eax,edx
	?debug L 1183
?live16410@272: ; 
@421:
@408:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch120
	dd	?patch121
	dd	?patch122
	df	@@stk@cpu@cpu_has_avx$qv
	dw	0
	dw	4150
	dw	0
	dw	201
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
	dw	202
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
	dw	203
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	204
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	205
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	206
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$akopfcia
	dw	0
	dw	4100
	dw	0
	dw	207
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	208
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$igopfcia
	dw	0
	dw	117
	dw	0
	dw	209
	dw	0
	dw	0
	dw	0
?patch120	equ	@421-@@stk@cpu@cpu_has_avx$qv+74
?patch121	equ	0
?patch122	equ	@421-@@stk@cpu@cpu_has_avx$qv
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
@stk@cpu@cpu_has_popcnt$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_popcnt$qv	proc	near
?live16411@0:
	?debug L 1186
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @422
@423:
	mov       ebx,offset $abppfcia
	?debug L 1192
?live16411@16: ; EBX = &$abppfcia
	mov       eax,dword ptr [$inopfcia]
	cmp       eax,-1
	je        short @427
	?debug L 1193
?live16411@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @425
	?debug L 1195
?live16411@48: ; EBX = &$abppfcia
@426:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@427:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @426
	cmp       dword ptr [ebx],0
	jne       short @426
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
	jmp       short @430
@429:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@430:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @433
	cmp       dword ptr [ebx],0
@433:
	je        short @431
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1198
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
	?debug L 1200
	mov       eax,dword ptr [ebp-36]
	and       eax,8388608
	mov       dword ptr [$inopfcia],eax
	?debug L 1201
?live16411@96: ; EBX = &$abppfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1202
?live16411@112: ; EBX = &$abppfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1204
?live16411@128: ; 
@435:
@425:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch125
	dd	?patch126
	dd	?patch127
	df	@@stk@cpu@cpu_has_popcnt$qv
	dw	0
	dw	4152
	dw	0
	dw	210
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
	dw	211
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
	dw	212
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	213
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	214
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	215
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$abppfcia
	dw	0
	dw	4100
	dw	0
	dw	216
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	217
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$inopfcia
	dw	0
	dw	117
	dw	0
	dw	218
	dw	0
	dw	0
	dw	0
?patch125	equ	@435-@@stk@cpu@cpu_has_popcnt$qv+72
?patch126	equ	0
?patch127	equ	@435-@@stk@cpu@cpu_has_popcnt$qv
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
@stk@cpu@cpu_has_f16c$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_f16c$qv	proc	near
?live16412@0:
	?debug L 1207
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @436
@437:
	mov       ebx,offset $aippfcia
	?debug L 1213
?live16412@16: ; EBX = &$aippfcia
	mov       eax,dword ptr [$ieppfcia]
	cmp       eax,-1
	je        short @441
	?debug L 1214
?live16412@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @439
	?debug L 1216
?live16412@48: ; EBX = &$aippfcia
@440:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@441:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @440
	cmp       dword ptr [ebx],0
	jne       short @440
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
	jmp       short @444
@443:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@444:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @447
	cmp       dword ptr [ebx],0
@447:
	je        short @445
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1219
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
	?debug L 1221
	mov       eax,dword ptr [ebp-36]
	and       eax,536870912
	mov       dword ptr [$ieppfcia],eax
	?debug L 1222
?live16412@96: ; EBX = &$aippfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1223
?live16412@112: ; EBX = &$aippfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1225
?live16412@128: ; 
@449:
@439:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch130
	dd	?patch131
	dd	?patch132
	df	@@stk@cpu@cpu_has_f16c$qv
	dw	0
	dw	4154
	dw	0
	dw	219
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
	dw	220
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
	dw	221
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	222
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	223
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	224
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aippfcia
	dw	0
	dw	4100
	dw	0
	dw	225
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	226
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ieppfcia
	dw	0
	dw	117
	dw	0
	dw	227
	dw	0
	dw	0
	dw	0
?patch130	equ	@449-@@stk@cpu@cpu_has_f16c$qv+72
?patch131	equ	0
?patch132	equ	@449-@@stk@cpu@cpu_has_f16c$qv
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
@stk@cpu@cpu_has_cmpxchg$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_cmpxchg$qv	proc	near
?live16413@0:
	?debug L 1228
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @450
@451:
	mov       ebx,offset $apppfcia
	?debug L 1234
?live16413@16: ; EBX = &$apppfcia
	mov       eax,dword ptr [$ilppfcia]
	cmp       eax,-1
	jne       @453
	?debug L 1235
?live16413@32: ; EAX = @temp2
	jmp       short @455
	?debug L 1237
?live16413@48: ; EBX = &$apppfcia
@454:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@455:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @454
	cmp       dword ptr [ebx],0
	jne       short @454
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
	jmp       short @458
@457:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@458:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @461
	cmp       dword ptr [ebx],0
@461:
	je        short @459
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1240
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
	?debug L 1242
	test      byte ptr [ebp-35],32
	je        short @463
	?debug L 1243
	mov       dword ptr [$ilppfcia],16
	?debug L 1244
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1245
?live16413@128: ; 
	mov       eax,16
	jmp       @453
	?debug L 1247
?live16413@144: ; EBX = &$apppfcia
@463:
	test      byte ptr [ebp-27],1
	je        short @464
	?debug L 1248
	mov       dword ptr [$ilppfcia],8
	?debug L 1249
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1250
?live16413@192: ; 
	mov       eax,8
	jmp       short @453
	?debug L 1254
?live16413@208: ; EBX = &$apppfcia
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
	?debug L 1256
	test      byte ptr [ebp-27],1
	je        short @465
	?debug L 1257
	mov       dword ptr [$ilppfcia],8
	?debug L 1258
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1259
?live16413@272: ; 
	mov       eax,8
	jmp       short @453
	?debug L 1261
?live16413@288: ; EBX = &$apppfcia
@465:
	mov       dword ptr [$ilppfcia],1
	?debug L 1262
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1263
?live16413@320: ; 
	mov       eax,1
	?debug L 1262
?live16413@336: ; EBX = &$apppfcia
	mov       dword ptr [ebx+4],0
	?debug L 1264
?live16413@352: ; 
@466:
@453:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch135
	dd	?patch136
	dd	?patch137
	df	@@stk@cpu@cpu_has_cmpxchg$qv
	dw	0
	dw	4156
	dw	0
	dw	228
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
	dw	229
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	230
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	231
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	232
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$apppfcia
	dw	0
	dw	4100
	dw	0
	dw	233
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	234
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ilppfcia
	dw	0
	dw	117
	dw	0
	dw	235
	dw	0
	dw	0
	dw	0
?patch135	equ	@466-@@stk@cpu@cpu_has_cmpxchg$qv+75
?patch136	equ	0
?patch137	equ	@466-@@stk@cpu@cpu_has_cmpxchg$qv
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
@stk@cpu@cpu_has_vmx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_vmx$qv	proc	near
?live16414@0:
	?debug L 1267
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @467
@468:
	mov       ebx,offset $agaagcia
	?debug L 1273
?live16414@16: ; EBX = &$agaagcia
	mov       eax,dword ptr [$icaagcia]
	cmp       eax,-1
	je        short @472
	?debug L 1274
?live16414@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @470
	?debug L 1276
?live16414@48: ; EBX = &$agaagcia
@471:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@472:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @471
	cmp       dword ptr [ebx],0
	jne       short @471
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
	jmp       short @475
@474:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@475:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @478
	cmp       dword ptr [ebx],0
@478:
	je        short @476
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1279
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
	?debug L 1281
	mov       eax,dword ptr [ebp-36]
	and       eax,32
	mov       dword ptr [$icaagcia],eax
	?debug L 1282
?live16414@96: ; EBX = &$agaagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1283
?live16414@112: ; EBX = &$agaagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1285
?live16414@128: ; 
@480:
@470:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch138
	dd	?patch139
	dd	?patch140
	df	@@stk@cpu@cpu_has_vmx$qv
	dw	0
	dw	4158
	dw	0
	dw	236
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
	dw	237
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
	dw	238
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	239
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	240
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	241
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$agaagcia
	dw	0
	dw	4100
	dw	0
	dw	242
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	243
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$icaagcia
	dw	0
	dw	117
	dw	0
	dw	244
	dw	0
	dw	0
	dw	0
?patch138	equ	@480-@@stk@cpu@cpu_has_vmx$qv+74
?patch139	equ	0
?patch140	equ	@480-@@stk@cpu@cpu_has_vmx$qv
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
@stk@cpu@cpu_has_smx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_smx$qv	proc	near
?live16415@0:
	?debug L 1288
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @481
@482:
	mov       ebx,offset $anaagcia
	?debug L 1294
?live16415@16: ; EBX = &$anaagcia
	mov       eax,dword ptr [$ijaagcia]
	cmp       eax,-1
	je        short @486
	?debug L 1295
?live16415@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @484
	?debug L 1297
?live16415@48: ; EBX = &$anaagcia
@485:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@486:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @485
	cmp       dword ptr [ebx],0
	jne       short @485
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
	jmp       short @489
@488:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@489:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @492
	cmp       dword ptr [ebx],0
@492:
	je        short @490
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1300
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
	?debug L 1302
	mov       eax,dword ptr [ebp-36]
	and       eax,64
	mov       dword ptr [$ijaagcia],eax
	?debug L 1303
?live16415@96: ; EBX = &$anaagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1304
?live16415@112: ; EBX = &$anaagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1306
?live16415@128: ; 
@494:
@484:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch143
	dd	?patch144
	dd	?patch145
	df	@@stk@cpu@cpu_has_smx$qv
	dw	0
	dw	4160
	dw	0
	dw	245
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
	dw	246
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
	dw	247
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	248
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	249
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	250
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$anaagcia
	dw	0
	dw	4100
	dw	0
	dw	251
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	252
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ijaagcia
	dw	0
	dw	117
	dw	0
	dw	253
	dw	0
	dw	0
	dw	0
?patch143	equ	@494-@@stk@cpu@cpu_has_smx$qv+74
?patch144	equ	0
?patch145	equ	@494-@@stk@cpu@cpu_has_smx$qv
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
$aebagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_cmov$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_cmov$qv	proc	near
?live16416@0:
	?debug L 1309
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @495
@496:
	mov       ebx,offset $aebagcia
	?debug L 1315
?live16416@16: ; EBX = &$aebagcia
	mov       eax,dword ptr [$iabagcia]
	cmp       eax,-1
	je        short @500
	?debug L 1316
?live16416@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @498
	?debug L 1318
?live16416@48: ; EBX = &$aebagcia
@499:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@500:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @499
	cmp       dword ptr [ebx],0
	jne       short @499
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
	jmp       short @503
@502:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@503:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @506
	cmp       dword ptr [ebx],0
@506:
	je        short @504
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1321
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
	?debug L 1323
	mov       eax,dword ptr [ebp-28]
	and       eax,32768
	mov       dword ptr [$iabagcia],eax
	?debug L 1324
?live16416@96: ; EBX = &$aebagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1325
?live16416@112: ; EBX = &$aebagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1327
?live16416@128: ; 
@508:
@498:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch148
	dd	?patch149
	dd	?patch150
	df	@@stk@cpu@cpu_has_cmov$qv
	dw	0
	dw	4162
	dw	0
	dw	254
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
	dw	255
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
	dw	256
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	257
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	258
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	259
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aebagcia
	dw	0
	dw	4100
	dw	0
	dw	260
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	261
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iabagcia
	dw	0
	dw	117
	dw	0
	dw	262
	dw	0
	dw	0
	dw	0
?patch148	equ	@508-@@stk@cpu@cpu_has_cmov$qv+72
?patch149	equ	0
?patch150	equ	@508-@@stk@cpu@cpu_has_cmov$qv
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
$ihbagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$albagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_movbe$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_movbe$qv	proc	near
?live16417@0:
	?debug L 1330
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @509
@510:
	mov       ebx,offset $albagcia
	?debug L 1336
?live16417@16: ; EBX = &$albagcia
	mov       eax,dword ptr [$ihbagcia]
	cmp       eax,-1
	je        short @514
	?debug L 1337
?live16417@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @512
	?debug L 1339
?live16417@48: ; EBX = &$albagcia
@513:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@514:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @513
	cmp       dword ptr [ebx],0
	jne       short @513
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
	jmp       short @517
@516:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@517:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @520
	cmp       dword ptr [ebx],0
@520:
	je        short @518
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1342
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
	?debug L 1344
	mov       eax,dword ptr [ebp-36]
	and       eax,4194304
	mov       dword ptr [$ihbagcia],eax
	?debug L 1345
?live16417@96: ; EBX = &$albagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1346
?live16417@112: ; EBX = &$albagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1348
?live16417@128: ; 
@522:
@512:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch153
	dd	?patch154
	dd	?patch155
	df	@@stk@cpu@cpu_has_movbe$qv
	dw	0
	dw	4164
	dw	0
	dw	263
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
	dw	264
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
	dw	265
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	266
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	267
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	268
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$albagcia
	dw	0
	dw	4100
	dw	0
	dw	269
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	270
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ihbagcia
	dw	0
	dw	117
	dw	0
	dw	271
	dw	0
	dw	0
	dw	0
?patch153	equ	@522-@@stk@cpu@cpu_has_movbe$qv+72
?patch154	equ	0
?patch155	equ	@522-@@stk@cpu@cpu_has_movbe$qv
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
$iobagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$accagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_bmi$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_bmi$qv	proc	near
?live16418@0:
	?debug L 1351
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @523
@524:
	mov       ebx,offset $accagcia
	?debug L 1357
?live16418@16: ; EBX = &$accagcia
	mov       eax,dword ptr [$iobagcia]
	cmp       eax,-1
	jne       @526
	?debug L 1358
?live16418@32: ; EAX = @temp3
	jmp       short @528
	?debug L 1360
?live16418@48: ; EBX = &$accagcia
@527:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@528:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @527
	cmp       dword ptr [ebx],0
	jne       short @527
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
	jmp       short @531
@530:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@531:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @534
	cmp       dword ptr [ebx],0
@534:
	je        short @532
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1363
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
	?debug L 1365
	test      byte ptr [ebp-43],1
	je        short @536
	?debug L 1366
	mov       dword ptr [$iobagcia],2
	jmp       short @537
	?debug L 1368
@536:
	test      byte ptr [ebp-44],8
	je        short @538
	?debug L 1369
	mov       dword ptr [$iobagcia],1
	jmp       short @537
	?debug L 1371
@538:
	xor       ecx,ecx
	mov       dword ptr [$iobagcia],ecx
	?debug L 1372
@537:
	cmp       dword ptr [$iobagcia],0
	setne     al
	and       eax,1
	?debug L 1373
?live16418@176: ; EBX = &$accagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1374
?live16418@192: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	?debug L 1373
?live16418@208: ; EBX = &$accagcia, EAX = ret
	mov       dword ptr [ebx+4],0
	?debug L 1374
?live16418@224: ; EAX = ret
	mov       eax,edx
	?debug L 1375
?live16418@240: ; 
@539:
@526:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch158
	dd	?patch159
	dd	?patch160
	df	@@stk@cpu@cpu_has_bmi$qv
	dw	0
	dw	4166
	dw	0
	dw	272
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
	dw	273
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
	dw	274
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	275
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	276
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	277
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$accagcia
	dw	0
	dw	4100
	dw	0
	dw	278
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	279
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iobagcia
	dw	0
	dw	117
	dw	0
	dw	280
	dw	0
	dw	0
	dw	0
?patch158	equ	@539-@@stk@cpu@cpu_has_bmi$qv+73
?patch159	equ	0
?patch160	equ	@539-@@stk@cpu@cpu_has_bmi$qv
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
$ifcagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ajcagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_erms$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_erms$qv	proc	near
?live16419@0:
	?debug L 1378
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @540
@541:
	mov       ebx,offset $ajcagcia
	?debug L 1384
?live16419@16: ; EBX = &$ajcagcia
	mov       eax,dword ptr [$ifcagcia]
	cmp       eax,-1
	je        short @545
	?debug L 1385
?live16419@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @543
	?debug L 1387
?live16419@48: ; EBX = &$ajcagcia
@544:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@545:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @544
	cmp       dword ptr [ebx],0
	jne       short @544
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
	jmp       short @548
@547:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@548:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @551
	cmp       dword ptr [ebx],0
@551:
	je        short @549
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1390
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
	?debug L 1392
	mov       eax,dword ptr [ebp-44]
	and       eax,512
	mov       dword ptr [$ifcagcia],eax
	?debug L 1393
?live16419@96: ; EBX = &$ajcagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1394
?live16419@112: ; EBX = &$ajcagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1396
?live16419@128: ; 
@553:
@543:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch163
	dd	?patch164
	dd	?patch165
	df	@@stk@cpu@cpu_has_erms$qv
	dw	0
	dw	4168
	dw	0
	dw	281
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
	dw	282
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
	dw	283
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	284
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	285
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	286
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ajcagcia
	dw	0
	dw	4100
	dw	0
	dw	287
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	288
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ifcagcia
	dw	0
	dw	117
	dw	0
	dw	289
	dw	0
	dw	0
	dw	0
?patch163	equ	@553-@@stk@cpu@cpu_has_erms$qv+72
?patch164	equ	0
?patch165	equ	@553-@@stk@cpu@cpu_has_erms$qv
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
$imcagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aadagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_3dnow$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_3dnow$qv	proc	near
?live16420@0:
	?debug L 1399
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @554
@555:
	mov       ebx,offset $aadagcia
	?debug L 1405
?live16420@16: ; EBX = &$aadagcia
	mov       eax,dword ptr [$imcagcia]
	cmp       eax,-1
	jne       @557
	?debug L 1406
?live16420@32: ; EAX = @temp3
	jmp       short @559
	?debug L 1408
?live16420@48: ; EBX = &$aadagcia
@558:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@559:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @558
	cmp       dword ptr [ebx],0
	jne       short @558
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
	jmp       short @562
@561:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@562:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @565
	cmp       dword ptr [ebx],0
@565:
	je        short @563
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1411
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
	?debug L 1413
	test      byte ptr [ebp-25],64
	je        short @567
	?debug L 1414
	mov       dword ptr [$imcagcia],2
	jmp       short @568
	?debug L 1416
@567:
	test      byte ptr [ebp-25],-128
	je        short @569
	?debug L 1417
	mov       dword ptr [$imcagcia],1
	jmp       short @568
	?debug L 1419
@569:
	xor       ecx,ecx
	mov       dword ptr [$imcagcia],ecx
	?debug L 1420
@568:
	cmp       dword ptr [$imcagcia],0
	setne     al
	and       eax,1
	?debug L 1421
?live16420@176: ; EBX = &$aadagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1422
?live16420@192: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	?debug L 1421
?live16420@208: ; EBX = &$aadagcia, EAX = ret
	mov       dword ptr [ebx+4],0
	?debug L 1422
?live16420@224: ; EAX = ret
	mov       eax,edx
	?debug L 1423
?live16420@240: ; 
@570:
@557:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch168
	dd	?patch169
	dd	?patch170
	df	@@stk@cpu@cpu_has_3dnow$qv
	dw	0
	dw	4170
	dw	0
	dw	290
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
	dw	291
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
	dw	292
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	293
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	294
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	295
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aadagcia
	dw	0
	dw	4100
	dw	0
	dw	296
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	297
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$imcagcia
	dw	0
	dw	117
	dw	0
	dw	298
	dw	0
	dw	0
	dw	0
?patch168	equ	@570-@@stk@cpu@cpu_has_3dnow$qv+74
?patch169	equ	0
?patch170	equ	@570-@@stk@cpu@cpu_has_3dnow$qv
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
$iddagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ahdagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_3dnowprefetch$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_3dnowprefetch$qv	proc	near
?live16421@0:
	?debug L 1426
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @571
@572:
	mov       ebx,offset $ahdagcia
	?debug L 1432
?live16421@16: ; EBX = &$ahdagcia
	mov       eax,dword ptr [$iddagcia]
	cmp       eax,-1
	je        short @576
	?debug L 1433
?live16421@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @574
	?debug L 1435
?live16421@48: ; EBX = &$ahdagcia
@575:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@576:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @575
	cmp       dword ptr [ebx],0
	jne       short @575
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
	jmp       short @579
@578:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@579:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @582
	cmp       dword ptr [ebx],0
@582:
	je        short @580
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1438
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
	?debug L 1440
	mov       eax,dword ptr [ebp-36]
	and       eax,256
	mov       dword ptr [$iddagcia],eax
	?debug L 1441
?live16421@96: ; EBX = &$ahdagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1442
?live16421@112: ; EBX = &$ahdagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1444
?live16421@128: ; 
@584:
@574:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch173
	dd	?patch174
	dd	?patch175
	df	@@stk@cpu@cpu_has_3dnowprefetch$qv
	dw	0
	dw	4172
	dw	0
	dw	299
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
	dw	300
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
	dw	301
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	302
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	303
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	304
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ahdagcia
	dw	0
	dw	4100
	dw	0
	dw	305
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	306
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iddagcia
	dw	0
	dw	117
	dw	0
	dw	307
	dw	0
	dw	0
	dw	0
?patch173	equ	@584-@@stk@cpu@cpu_has_3dnowprefetch$qv+73
?patch174	equ	0
?patch175	equ	@584-@@stk@cpu@cpu_has_3dnowprefetch$qv
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
$ikdagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aodagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_perftsc$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_perftsc$qv	proc	near
?live16422@0:
	?debug L 1447
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @585
@586:
	mov       ebx,offset $aodagcia
	?debug L 1453
?live16422@16: ; EBX = &$aodagcia
	mov       eax,dword ptr [$ikdagcia]
	cmp       eax,-1
	je        short @590
	?debug L 1454
?live16422@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @588
	?debug L 1456
?live16422@48: ; EBX = &$aodagcia
@589:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@590:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @589
	cmp       dword ptr [ebx],0
	jne       short @589
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
	jmp       short @593
@592:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@593:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @596
	cmp       dword ptr [ebx],0
@596:
	je        short @594
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1459
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
	?debug L 1461
	mov       eax,dword ptr [ebp-28]
	and       eax,134217728
	mov       dword ptr [$ikdagcia],eax
	?debug L 1462
?live16422@96: ; EBX = &$aodagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1463
?live16422@112: ; EBX = &$aodagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1465
?live16422@128: ; 
@598:
@588:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch178
	dd	?patch179
	dd	?patch180
	df	@@stk@cpu@cpu_has_perftsc$qv
	dw	0
	dw	4174
	dw	0
	dw	308
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
	dw	309
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
	dw	310
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	311
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	312
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	313
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aodagcia
	dw	0
	dw	4100
	dw	0
	dw	314
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	315
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ikdagcia
	dw	0
	dw	117
	dw	0
	dw	316
	dw	0
	dw	0
	dw	0
?patch178	equ	@598-@@stk@cpu@cpu_has_perftsc$qv+73
?patch179	equ	0
?patch180	equ	@598-@@stk@cpu@cpu_has_perftsc$qv
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
$ibeagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$afeagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sha$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sha$qv	proc	near
?live16423@0:
	?debug L 1468
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @599
@600:
	mov       ebx,offset $afeagcia
	?debug L 1474
?live16423@16: ; EBX = &$afeagcia
	mov       eax,dword ptr [$ibeagcia]
	cmp       eax,-1
	je        short @604
	?debug L 1475
?live16423@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @602
	?debug L 1477
?live16423@48: ; EBX = &$afeagcia
@603:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@604:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @603
	cmp       dword ptr [ebx],0
	jne       short @603
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
	jmp       short @607
@606:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@607:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @610
	cmp       dword ptr [ebx],0
@610:
	je        short @608
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1480
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
	?debug L 1482
	mov       eax,dword ptr [ebp-44]
	and       eax,536870912
	mov       dword ptr [$ibeagcia],eax
	?debug L 1483
?live16423@96: ; EBX = &$afeagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1484
?live16423@112: ; EBX = &$afeagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1486
?live16423@128: ; 
@612:
@602:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch183
	dd	?patch184
	dd	?patch185
	df	@@stk@cpu@cpu_has_sha$qv
	dw	0
	dw	4176
	dw	0
	dw	317
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
	dw	318
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
	dw	319
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	320
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	321
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	322
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$afeagcia
	dw	0
	dw	4100
	dw	0
	dw	323
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	324
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ibeagcia
	dw	0
	dw	117
	dw	0
	dw	325
	dw	0
	dw	0
	dw	0
?patch183	equ	@612-@@stk@cpu@cpu_has_sha$qv+72
?patch184	equ	0
?patch185	equ	@612-@@stk@cpu@cpu_has_sha$qv
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
$iieagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ameagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_xop$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_xop$qv	proc	near
?live16424@0:
	?debug L 1489
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @613
@614:
	mov       ebx,offset $ameagcia
	?debug L 1495
?live16424@16: ; EBX = &$ameagcia
	mov       eax,dword ptr [$iieagcia]
	cmp       eax,-1
	je        short @618
	?debug L 1496
?live16424@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @616
	?debug L 1498
?live16424@48: ; EBX = &$ameagcia
@617:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@618:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @617
	cmp       dword ptr [ebx],0
	jne       short @617
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
	jmp       short @621
@620:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@621:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @624
	cmp       dword ptr [ebx],0
@624:
	je        short @622
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1501
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
	?debug L 1503
	mov       eax,dword ptr [ebp-36]
	and       eax,2048
	mov       dword ptr [$iieagcia],eax
	?debug L 1504
?live16424@96: ; EBX = &$ameagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1505
?live16424@112: ; EBX = &$ameagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1507
?live16424@128: ; 
@626:
@616:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch188
	dd	?patch189
	dd	?patch190
	df	@@stk@cpu@cpu_has_xop$qv
	dw	0
	dw	4178
	dw	0
	dw	326
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
	dw	327
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
	dw	328
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	329
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	330
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	331
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ameagcia
	dw	0
	dw	4100
	dw	0
	dw	332
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	333
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iieagcia
	dw	0
	dw	117
	dw	0
	dw	334
	dw	0
	dw	0
	dw	0
?patch188	equ	@626-@@stk@cpu@cpu_has_xop$qv+73
?patch189	equ	0
?patch190	equ	@626-@@stk@cpu@cpu_has_xop$qv
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
$ipeagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$adfagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512f$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512f$qv	proc	near
?live16425@0:
	?debug L 1510
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @627
@628:
	mov       ebx,offset $adfagcia
	?debug L 1516
?live16425@16: ; EBX = &$adfagcia
	mov       eax,dword ptr [$ipeagcia]
	cmp       eax,-1
	je        short @632
	?debug L 1517
?live16425@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @630
	?debug L 1519
?live16425@48: ; EBX = &$adfagcia
@631:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@632:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @631
	cmp       dword ptr [ebx],0
	jne       short @631
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
	jmp       short @635
@634:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@635:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @638
	cmp       dword ptr [ebx],0
@638:
	je        short @636
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1522
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
	?debug L 1524
	mov       eax,dword ptr [ebp-44]
	and       eax,65536
	mov       dword ptr [$ipeagcia],eax
	?debug L 1525
?live16425@96: ; EBX = &$adfagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1526
?live16425@112: ; EBX = &$adfagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1528
?live16425@128: ; 
@640:
@630:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch193
	dd	?patch194
	dd	?patch195
	df	@@stk@cpu@cpu_has_avx512f$qv
	dw	0
	dw	4180
	dw	0
	dw	335
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
	dw	336
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
	dw	337
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	338
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	339
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	340
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$adfagcia
	dw	0
	dw	4100
	dw	0
	dw	341
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	342
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ipeagcia
	dw	0
	dw	117
	dw	0
	dw	343
	dw	0
	dw	0
	dw	0
?patch193	equ	@640-@@stk@cpu@cpu_has_avx512f$qv+72
?patch194	equ	0
?patch195	equ	@640-@@stk@cpu@cpu_has_avx512f$qv
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
$igfagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$akfagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512bw$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512bw$qv	proc	near
?live16426@0:
	?debug L 1531
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @641
@642:
	mov       ebx,offset $akfagcia
	?debug L 1537
?live16426@16: ; EBX = &$akfagcia
	mov       eax,dword ptr [$igfagcia]
	cmp       eax,-1
	je        short @646
	?debug L 1538
?live16426@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @644
	?debug L 1540
?live16426@48: ; EBX = &$akfagcia
@645:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@646:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @645
	cmp       dword ptr [ebx],0
	jne       short @645
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
	jmp       short @649
@648:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@649:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @652
	cmp       dword ptr [ebx],0
@652:
	je        short @650
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1543
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
	?debug L 1545
	mov       eax,dword ptr [ebp-44]
	and       eax,1073741824
	mov       dword ptr [$igfagcia],eax
	?debug L 1546
?live16426@96: ; EBX = &$akfagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1547
?live16426@112: ; EBX = &$akfagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1549
?live16426@128: ; 
@654:
@644:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch198
	dd	?patch199
	dd	?patch200
	df	@@stk@cpu@cpu_has_avx512bw$qv
	dw	0
	dw	4182
	dw	0
	dw	344
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
	dw	345
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
	dw	346
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	347
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	348
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	349
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$akfagcia
	dw	0
	dw	4100
	dw	0
	dw	350
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	351
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$igfagcia
	dw	0
	dw	117
	dw	0
	dw	352
	dw	0
	dw	0
	dw	0
?patch198	equ	@654-@@stk@cpu@cpu_has_avx512bw$qv+72
?patch199	equ	0
?patch200	equ	@654-@@stk@cpu@cpu_has_avx512bw$qv
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
$infagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$abgagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512er$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512er$qv	proc	near
?live16427@0:
	?debug L 1552
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @655
@656:
	mov       ebx,offset $abgagcia
	?debug L 1558
?live16427@16: ; EBX = &$abgagcia
	mov       eax,dword ptr [$infagcia]
	cmp       eax,-1
	je        short @660
	?debug L 1559
?live16427@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @658
	?debug L 1561
?live16427@48: ; EBX = &$abgagcia
@659:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@660:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @659
	cmp       dword ptr [ebx],0
	jne       short @659
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
	jmp       short @663
@662:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@663:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @666
	cmp       dword ptr [ebx],0
@666:
	je        short @664
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1564
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
	?debug L 1566
	mov       eax,dword ptr [ebp-44]
	and       eax,134217728
	mov       dword ptr [$infagcia],eax
	?debug L 1567
?live16427@96: ; EBX = &$abgagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1568
?live16427@112: ; EBX = &$abgagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1570
?live16427@128: ; 
@668:
@658:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch203
	dd	?patch204
	dd	?patch205
	df	@@stk@cpu@cpu_has_avx512er$qv
	dw	0
	dw	4184
	dw	0
	dw	353
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
	dw	354
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
	dw	355
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	356
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	357
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	358
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$abgagcia
	dw	0
	dw	4100
	dw	0
	dw	359
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	360
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$infagcia
	dw	0
	dw	117
	dw	0
	dw	361
	dw	0
	dw	0
	dw	0
?patch203	equ	@668-@@stk@cpu@cpu_has_avx512er$qv+72
?patch204	equ	0
?patch205	equ	@668-@@stk@cpu@cpu_has_avx512er$qv
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
$iegagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aigagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512cd$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512cd$qv	proc	near
?live16428@0:
	?debug L 1573
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @669
@670:
	mov       ebx,offset $aigagcia
	?debug L 1579
?live16428@16: ; EBX = &$aigagcia
	mov       eax,dword ptr [$iegagcia]
	cmp       eax,-1
	je        short @674
	?debug L 1580
?live16428@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @672
	?debug L 1582
?live16428@48: ; EBX = &$aigagcia
@673:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@674:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @673
	cmp       dword ptr [ebx],0
	jne       short @673
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
	jmp       short @677
@676:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@677:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @680
	cmp       dword ptr [ebx],0
@680:
	je        short @678
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1585
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
	?debug L 1587
	mov       eax,dword ptr [ebp-44]
	and       eax,268435456
	mov       dword ptr [$iegagcia],eax
	?debug L 1588
?live16428@96: ; EBX = &$aigagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1589
?live16428@112: ; EBX = &$aigagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1591
?live16428@128: ; 
@682:
@672:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch208
	dd	?patch209
	dd	?patch210
	df	@@stk@cpu@cpu_has_avx512cd$qv
	dw	0
	dw	4186
	dw	0
	dw	362
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
	dw	363
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
	dw	364
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	365
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	366
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	367
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aigagcia
	dw	0
	dw	4100
	dw	0
	dw	368
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	369
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iegagcia
	dw	0
	dw	117
	dw	0
	dw	370
	dw	0
	dw	0
	dw	0
?patch208	equ	@682-@@stk@cpu@cpu_has_avx512cd$qv+72
?patch209	equ	0
?patch210	equ	@682-@@stk@cpu@cpu_has_avx512cd$qv
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
$ilgagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$apgagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512pf$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512pf$qv	proc	near
?live16429@0:
	?debug L 1594
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @683
@684:
	mov       ebx,offset $apgagcia
	?debug L 1600
?live16429@16: ; EBX = &$apgagcia
	mov       eax,dword ptr [$ilgagcia]
	cmp       eax,-1
	je        short @688
	?debug L 1601
?live16429@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @686
	?debug L 1603
?live16429@48: ; EBX = &$apgagcia
@687:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@688:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @687
	cmp       dword ptr [ebx],0
	jne       short @687
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
	jmp       short @691
@690:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@691:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @694
	cmp       dword ptr [ebx],0
@694:
	je        short @692
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1606
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
	?debug L 1608
	mov       eax,dword ptr [ebp-44]
	and       eax,67108864
	mov       dword ptr [$ilgagcia],eax
	?debug L 1609
?live16429@96: ; EBX = &$apgagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1610
?live16429@112: ; EBX = &$apgagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1612
?live16429@128: ; 
@696:
@686:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch213
	dd	?patch214
	dd	?patch215
	df	@@stk@cpu@cpu_has_avx512pf$qv
	dw	0
	dw	4188
	dw	0
	dw	371
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
	dw	372
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
	dw	373
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	374
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	375
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	376
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$apgagcia
	dw	0
	dw	4100
	dw	0
	dw	377
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	378
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ilgagcia
	dw	0
	dw	117
	dw	0
	dw	379
	dw	0
	dw	0
	dw	0
?patch213	equ	@696-@@stk@cpu@cpu_has_avx512pf$qv+72
?patch214	equ	0
?patch215	equ	@696-@@stk@cpu@cpu_has_avx512pf$qv
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
$ichagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aghagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512dq$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512dq$qv	proc	near
?live16430@0:
	?debug L 1615
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @697
@698:
	mov       ebx,offset $aghagcia
	?debug L 1621
?live16430@16: ; EBX = &$aghagcia
	mov       eax,dword ptr [$ichagcia]
	cmp       eax,-1
	je        short @702
	?debug L 1622
?live16430@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @700
	?debug L 1624
?live16430@48: ; EBX = &$aghagcia
@701:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@702:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @701
	cmp       dword ptr [ebx],0
	jne       short @701
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
	jmp       short @705
@704:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@705:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @708
	cmp       dword ptr [ebx],0
@708:
	je        short @706
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1627
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
	?debug L 1629
	mov       eax,dword ptr [ebp-44]
	and       eax,131072
	mov       dword ptr [$ichagcia],eax
	?debug L 1630
?live16430@96: ; EBX = &$aghagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1631
?live16430@112: ; EBX = &$aghagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1633
?live16430@128: ; 
@710:
@700:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch218
	dd	?patch219
	dd	?patch220
	df	@@stk@cpu@cpu_has_avx512dq$qv
	dw	0
	dw	4190
	dw	0
	dw	380
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
	dw	381
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
	dw	382
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	383
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	384
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	385
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aghagcia
	dw	0
	dw	4100
	dw	0
	dw	386
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	387
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ichagcia
	dw	0
	dw	117
	dw	0
	dw	388
	dw	0
	dw	0
	dw	0
?patch218	equ	@710-@@stk@cpu@cpu_has_avx512dq$qv+72
?patch219	equ	0
?patch220	equ	@710-@@stk@cpu@cpu_has_avx512dq$qv
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
$ijhagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$anhagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512vl$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512vl$qv	proc	near
?live16431@0:
	?debug L 1636
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @711
@712:
	mov       ebx,offset $anhagcia
	?debug L 1642
?live16431@16: ; EBX = &$anhagcia
	mov       eax,dword ptr [$ijhagcia]
	cmp       eax,-1
	je        short @716
	?debug L 1643
?live16431@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @714
	?debug L 1645
?live16431@48: ; EBX = &$anhagcia
@715:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@716:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @715
	cmp       dword ptr [ebx],0
	jne       short @715
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
	jmp       short @719
@718:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@719:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @722
	cmp       dword ptr [ebx],0
@722:
	je        short @720
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1648
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
	?debug L 1650
	mov       eax,dword ptr [ebp-44]
	and       eax,-2147483648
	mov       dword ptr [$ijhagcia],eax
	?debug L 1651
?live16431@96: ; EBX = &$anhagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1652
?live16431@112: ; EBX = &$anhagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1654
?live16431@128: ; 
@724:
@714:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch223
	dd	?patch224
	dd	?patch225
	df	@@stk@cpu@cpu_has_avx512vl$qv
	dw	0
	dw	4192
	dw	0
	dw	389
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
	dw	390
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
	dw	391
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	392
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	393
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	394
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$anhagcia
	dw	0
	dw	4100
	dw	0
	dw	395
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	396
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ijhagcia
	dw	0
	dw	117
	dw	0
	dw	397
	dw	0
	dw	0
	dw	0
?patch223	equ	@724-@@stk@cpu@cpu_has_avx512vl$qv+72
?patch224	equ	0
?patch225	equ	@724-@@stk@cpu@cpu_has_avx512vl$qv
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
$iaiagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aeiagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512ifma$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512ifma$qv	proc	near
?live16432@0:
	?debug L 1657
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @725
@726:
	mov       ebx,offset $aeiagcia
	?debug L 1663
?live16432@16: ; EBX = &$aeiagcia
	mov       eax,dword ptr [$iaiagcia]
	cmp       eax,-1
	je        short @730
	?debug L 1664
?live16432@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @728
	?debug L 1666
?live16432@48: ; EBX = &$aeiagcia
@729:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@730:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @729
	cmp       dword ptr [ebx],0
	jne       short @729
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
	jmp       short @733
@732:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@733:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @736
	cmp       dword ptr [ebx],0
@736:
	je        short @734
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1669
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
	?debug L 1671
	mov       eax,dword ptr [ebp-44]
	and       eax,2097152
	mov       dword ptr [$iaiagcia],eax
	?debug L 1672
?live16432@96: ; EBX = &$aeiagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1673
?live16432@112: ; EBX = &$aeiagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1675
?live16432@128: ; 
@738:
@728:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch228
	dd	?patch229
	dd	?patch230
	df	@@stk@cpu@cpu_has_avx512ifma$qv
	dw	0
	dw	4194
	dw	0
	dw	398
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
	dw	399
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
	dw	400
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	401
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	402
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	403
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aeiagcia
	dw	0
	dw	4100
	dw	0
	dw	404
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	405
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iaiagcia
	dw	0
	dw	117
	dw	0
	dw	406
	dw	0
	dw	0
	dw	0
?patch228	equ	@738-@@stk@cpu@cpu_has_avx512ifma$qv+72
?patch229	equ	0
?patch230	equ	@738-@@stk@cpu@cpu_has_avx512ifma$qv
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
$ihiagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aliagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512vbmi$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512vbmi$qv	proc	near
?live16433@0:
	?debug L 1678
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @739
@740:
	mov       ebx,offset $aliagcia
	?debug L 1684
?live16433@16: ; EBX = &$aliagcia
	mov       eax,dword ptr [$ihiagcia]
	cmp       eax,-1
	je        short @744
	?debug L 1685
?live16433@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @742
	?debug L 1687
?live16433@48: ; EBX = &$aliagcia
@743:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@744:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @743
	cmp       dword ptr [ebx],0
	jne       short @743
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
	jmp       short @747
@746:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@747:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @750
	cmp       dword ptr [ebx],0
@750:
	je        short @748
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1690
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
	?debug L 1692
	mov       eax,dword ptr [ebp-36]
	and       eax,2
	mov       dword ptr [$ihiagcia],eax
	?debug L 1693
?live16433@96: ; EBX = &$aliagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1694
?live16433@112: ; EBX = &$aliagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1696
?live16433@128: ; 
@752:
@742:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch233
	dd	?patch234
	dd	?patch235
	df	@@stk@cpu@cpu_has_avx512vbmi$qv
	dw	0
	dw	4196
	dw	0
	dw	407
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
	dw	408
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
	dw	409
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	410
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	411
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	412
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aliagcia
	dw	0
	dw	4100
	dw	0
	dw	413
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	414
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ihiagcia
	dw	0
	dw	117
	dw	0
	dw	415
	dw	0
	dw	0
	dw	0
?patch233	equ	@752-@@stk@cpu@cpu_has_avx512vbmi$qv+74
?patch234	equ	0
?patch235	equ	@752-@@stk@cpu@cpu_has_avx512vbmi$qv
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
$ioiagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$acjagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_adx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_adx$qv	proc	near
?live16434@0:
	?debug L 1699
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @753
@754:
	mov       ebx,offset $acjagcia
	?debug L 1705
?live16434@16: ; EBX = &$acjagcia
	mov       eax,dword ptr [$ioiagcia]
	cmp       eax,-1
	je        short @758
	?debug L 1706
?live16434@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @756
	?debug L 1708
?live16434@48: ; EBX = &$acjagcia
@757:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@758:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @757
	cmp       dword ptr [ebx],0
	jne       short @757
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
	jmp       short @761
@760:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@761:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @764
	cmp       dword ptr [ebx],0
@764:
	je        short @762
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1711
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
	?debug L 1713
	mov       eax,dword ptr [ebp-44]
	and       eax,524288
	mov       dword ptr [$ioiagcia],eax
	?debug L 1714
?live16434@96: ; EBX = &$acjagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1715
?live16434@112: ; EBX = &$acjagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1717
?live16434@128: ; 
@766:
@756:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch238
	dd	?patch239
	dd	?patch240
	df	@@stk@cpu@cpu_has_adx$qv
	dw	0
	dw	4198
	dw	0
	dw	416
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
	dw	417
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
	dw	418
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	419
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	420
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	421
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$acjagcia
	dw	0
	dw	4100
	dw	0
	dw	422
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	423
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ioiagcia
	dw	0
	dw	117
	dw	0
	dw	424
	dw	0
	dw	0
	dw	0
?patch238	equ	@766-@@stk@cpu@cpu_has_adx$qv+72
?patch239	equ	0
?patch240	equ	@766-@@stk@cpu@cpu_has_adx$qv
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
$ifjagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ajjagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_lzcnt$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_lzcnt$qv	proc	near
?live16435@0:
	?debug L 1720
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @767
@768:
	mov       ebx,offset $ajjagcia
	?debug L 1726
?live16435@16: ; EBX = &$ajjagcia
	mov       eax,dword ptr [$ifjagcia]
	cmp       eax,-1
	je        short @772
	?debug L 1727
?live16435@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @770
	?debug L 1729
?live16435@48: ; EBX = &$ajjagcia
@771:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@772:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @771
	cmp       dword ptr [ebx],0
	jne       short @771
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
	jmp       short @775
@774:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@775:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @778
	cmp       dword ptr [ebx],0
@778:
	je        short @776
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1732
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
	?debug L 1734
	mov       eax,dword ptr [ebp-36]
	and       eax,32
	mov       dword ptr [$ifjagcia],eax
	?debug L 1735
?live16435@96: ; EBX = &$ajjagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1736
?live16435@112: ; EBX = &$ajjagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1738
?live16435@128: ; 
@780:
@770:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch243
	dd	?patch244
	dd	?patch245
	df	@@stk@cpu@cpu_has_lzcnt$qv
	dw	0
	dw	4200
	dw	0
	dw	425
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
	dw	426
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
	dw	427
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	428
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	429
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	430
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ajjagcia
	dw	0
	dw	4100
	dw	0
	dw	431
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	432
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ifjagcia
	dw	0
	dw	117
	dw	0
	dw	433
	dw	0
	dw	0
	dw	0
?patch243	equ	@780-@@stk@cpu@cpu_has_lzcnt$qv+75
?patch244	equ	0
?patch245	equ	@780-@@stk@cpu@cpu_has_lzcnt$qv
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
$imjagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aakagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_tbm$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_tbm$qv	proc	near
?live16436@0:
	?debug L 1741
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @781
@782:
	mov       ebx,offset $aakagcia
	?debug L 1747
?live16436@16: ; EBX = &$aakagcia
	mov       eax,dword ptr [$imjagcia]
	cmp       eax,-1
	je        short @786
	?debug L 1748
?live16436@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @784
	?debug L 1750
?live16436@48: ; EBX = &$aakagcia
@785:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@786:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @785
	cmp       dword ptr [ebx],0
	jne       short @785
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
	jmp       short @789
@788:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@789:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @792
	cmp       dword ptr [ebx],0
@792:
	je        short @790
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1753
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
	?debug L 1755
	mov       eax,dword ptr [ebp-36]
	and       eax,2097152
	mov       dword ptr [$imjagcia],eax
	?debug L 1756
?live16436@96: ; EBX = &$aakagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1757
?live16436@112: ; EBX = &$aakagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1759
?live16436@128: ; 
@794:
@784:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch248
	dd	?patch249
	dd	?patch250
	df	@@stk@cpu@cpu_has_tbm$qv
	dw	0
	dw	4202
	dw	0
	dw	434
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
	dw	435
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
	dw	436
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	437
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	438
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	439
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aakagcia
	dw	0
	dw	4100
	dw	0
	dw	440
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	441
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$imjagcia
	dw	0
	dw	117
	dw	0
	dw	442
	dw	0
	dw	0
	dw	0
?patch248	equ	@794-@@stk@cpu@cpu_has_tbm$qv+73
?patch249	equ	0
?patch250	equ	@794-@@stk@cpu@cpu_has_tbm$qv
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
$idkagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ahkagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_clfsh$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_clfsh$qv	proc	near
?live16437@0:
	?debug L 1762
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @795
@796:
	mov       ebx,offset $ahkagcia
	?debug L 1768
?live16437@16: ; EBX = &$ahkagcia
	mov       eax,dword ptr [$idkagcia]
	cmp       eax,-1
	je        short @800
	?debug L 1769
?live16437@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @798
	?debug L 1771
?live16437@48: ; EBX = &$ahkagcia
@799:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@800:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @799
	cmp       dword ptr [ebx],0
	jne       short @799
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
	jmp       short @803
@802:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@803:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @806
	cmp       dword ptr [ebx],0
@806:
	je        short @804
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1774
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
	?debug L 1776
	mov       eax,dword ptr [ebp-36]
	and       eax,524288
	mov       dword ptr [$idkagcia],eax
	?debug L 1777
?live16437@96: ; EBX = &$ahkagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1778
?live16437@112: ; EBX = &$ahkagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1780
?live16437@128: ; 
@808:
@798:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch253
	dd	?patch254
	dd	?patch255
	df	@@stk@cpu@cpu_has_clfsh$qv
	dw	0
	dw	4204
	dw	0
	dw	443
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
	dw	444
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
	dw	445
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	446
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	447
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	448
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ahkagcia
	dw	0
	dw	4100
	dw	0
	dw	449
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	450
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$idkagcia
	dw	0
	dw	117
	dw	0
	dw	451
	dw	0
	dw	0
	dw	0
?patch253	equ	@808-@@stk@cpu@cpu_has_clfsh$qv+72
?patch254	equ	0
?patch255	equ	@808-@@stk@cpu@cpu_has_clfsh$qv
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
$ikkagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aokagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_pclmulqdq$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_pclmulqdq$qv	proc	near
?live16438@0:
	?debug L 1783
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @809
@810:
	mov       ebx,offset $aokagcia
	?debug L 1789
?live16438@16: ; EBX = &$aokagcia
	mov       eax,dword ptr [$ikkagcia]
	cmp       eax,-1
	je        short @814
	?debug L 1790
?live16438@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @812
	?debug L 1792
?live16438@48: ; EBX = &$aokagcia
@813:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@814:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @813
	cmp       dword ptr [ebx],0
	jne       short @813
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
	jmp       short @817
@816:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@817:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @820
	cmp       dword ptr [ebx],0
@820:
	je        short @818
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1795
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
	?debug L 1797
	mov       eax,dword ptr [ebp-36]
	and       eax,32
	mov       dword ptr [$ikkagcia],eax
	?debug L 1798
?live16438@96: ; EBX = &$aokagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1799
?live16438@112: ; EBX = &$aokagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1801
?live16438@128: ; 
@822:
@812:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch258
	dd	?patch259
	dd	?patch260
	df	@@stk@cpu@cpu_has_pclmulqdq$qv
	dw	0
	dw	4206
	dw	0
	dw	452
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
	dw	453
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
	dw	454
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	455
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	456
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	457
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aokagcia
	dw	0
	dw	4100
	dw	0
	dw	458
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	459
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ikkagcia
	dw	0
	dw	117
	dw	0
	dw	460
	dw	0
	dw	0
	dw	0
?patch258	equ	@822-@@stk@cpu@cpu_has_pclmulqdq$qv+74
?patch259	equ	0
?patch260	equ	@822-@@stk@cpu@cpu_has_pclmulqdq$qv
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
$iblagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$aflagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_fxsr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_fxsr$qv	proc	near
?live16439@0:
	?debug L 1804
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @823
@824:
	mov       ebx,offset $aflagcia
	?debug L 1810
?live16439@16: ; EBX = &$aflagcia
	mov       eax,dword ptr [$iblagcia]
	cmp       eax,-1
	je        short @828
	?debug L 1811
?live16439@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @826
	?debug L 1813
?live16439@48: ; EBX = &$aflagcia
@827:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@828:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @827
	cmp       dword ptr [ebx],0
	jne       short @827
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
	jmp       short @831
@830:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@831:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @834
	cmp       dword ptr [ebx],0
@834:
	je        short @832
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1816
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
	?debug L 1818
	mov       eax,dword ptr [ebp-36]
	and       eax,16777216
	mov       dword ptr [$iblagcia],eax
	?debug L 1819
?live16439@96: ; EBX = &$aflagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1820
?live16439@112: ; EBX = &$aflagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1822
?live16439@128: ; 
@836:
@826:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch263
	dd	?patch264
	dd	?patch265
	df	@@stk@cpu@cpu_has_fxsr$qv
	dw	0
	dw	4208
	dw	0
	dw	461
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
	dw	462
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
	dw	463
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	464
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	465
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	466
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aflagcia
	dw	0
	dw	4100
	dw	0
	dw	467
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	468
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iblagcia
	dw	0
	dw	117
	dw	0
	dw	469
	dw	0
	dw	0
	dw	0
?patch263	equ	@836-@@stk@cpu@cpu_has_fxsr$qv+72
?patch264	equ	0
?patch265	equ	@836-@@stk@cpu@cpu_has_fxsr$qv
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
$iilagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$amlagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_ss$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_ss$qv	proc	near
?live16440@0:
	?debug L 1825
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @837
@838:
	mov       ebx,offset $amlagcia
	?debug L 1831
?live16440@16: ; EBX = &$amlagcia
	mov       eax,dword ptr [$iilagcia]
	cmp       eax,-1
	je        short @842
	?debug L 1832
?live16440@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @840
	?debug L 1834
?live16440@48: ; EBX = &$amlagcia
@841:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@842:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @841
	cmp       dword ptr [ebx],0
	jne       short @841
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
	jmp       short @845
@844:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@845:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @848
	cmp       dword ptr [ebx],0
@848:
	je        short @846
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1837
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
	?debug L 1839
	mov       eax,dword ptr [ebp-36]
	and       eax,134217728
	mov       dword ptr [$iilagcia],eax
	?debug L 1840
?live16440@96: ; EBX = &$amlagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1841
?live16440@112: ; EBX = &$amlagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1843
?live16440@128: ; 
@850:
@840:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch268
	dd	?patch269
	dd	?patch270
	df	@@stk@cpu@cpu_has_ss$qv
	dw	0
	dw	4210
	dw	0
	dw	470
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
	dw	471
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
	dw	472
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	473
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	474
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	475
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$amlagcia
	dw	0
	dw	4100
	dw	0
	dw	476
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	477
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iilagcia
	dw	0
	dw	117
	dw	0
	dw	478
	dw	0
	dw	0
	dw	0
?patch268	equ	@850-@@stk@cpu@cpu_has_ss$qv+72
?patch269	equ	0
?patch270	equ	@850-@@stk@cpu@cpu_has_ss$qv
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
$iplagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$admagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_mtrr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mtrr$qv	proc	near
?live16441@0:
	?debug L 1846
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @851
@852:
	mov       ebx,offset $admagcia
	?debug L 1852
?live16441@16: ; EBX = &$admagcia
	mov       eax,dword ptr [$iplagcia]
	cmp       eax,-1
	je        short @856
	?debug L 1853
?live16441@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @854
	?debug L 1855
?live16441@48: ; EBX = &$admagcia
@855:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@856:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @855
	cmp       dword ptr [ebx],0
	jne       short @855
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
	jmp       short @859
@858:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@859:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @862
	cmp       dword ptr [ebx],0
@862:
	je        short @860
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1858
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
	?debug L 1860
	mov       eax,dword ptr [ebp-36]
	and       eax,4096
	mov       dword ptr [$iplagcia],eax
	?debug L 1861
?live16441@96: ; EBX = &$admagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1862
?live16441@112: ; EBX = &$admagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1864
?live16441@128: ; 
@864:
@854:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch273
	dd	?patch274
	dd	?patch275
	df	@@stk@cpu@cpu_has_mtrr$qv
	dw	0
	dw	4212
	dw	0
	dw	479
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
	dw	480
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
	dw	481
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	482
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	483
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	484
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$admagcia
	dw	0
	dw	4100
	dw	0
	dw	485
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	486
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iplagcia
	dw	0
	dw	117
	dw	0
	dw	487
	dw	0
	dw	0
	dw	0
?patch273	equ	@864-@@stk@cpu@cpu_has_mtrr$qv+72
?patch274	equ	0
?patch275	equ	@864-@@stk@cpu@cpu_has_mtrr$qv
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
$igmagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$akmagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_msr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_msr$qv	proc	near
?live16442@0:
	?debug L 1867
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @865
@866:
	mov       ebx,offset $akmagcia
	?debug L 1873
?live16442@16: ; EBX = &$akmagcia
	mov       eax,dword ptr [$igmagcia]
	cmp       eax,-1
	je        short @870
	?debug L 1874
?live16442@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @868
	?debug L 1876
?live16442@48: ; EBX = &$akmagcia
@869:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@870:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @869
	cmp       dword ptr [ebx],0
	jne       short @869
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
	jmp       short @873
@872:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@873:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @876
	cmp       dword ptr [ebx],0
@876:
	je        short @874
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1879
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
	?debug L 1881
	mov       eax,dword ptr [ebp-36]
	and       eax,4096
	mov       dword ptr [$igmagcia],eax
	?debug L 1882
?live16442@96: ; EBX = &$akmagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1883
?live16442@112: ; EBX = &$akmagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1885
?live16442@128: ; 
@878:
@868:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch278
	dd	?patch279
	dd	?patch280
	df	@@stk@cpu@cpu_has_msr$qv
	dw	0
	dw	4214
	dw	0
	dw	488
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
	dw	489
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
	dw	490
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	491
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	492
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	493
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$akmagcia
	dw	0
	dw	4100
	dw	0
	dw	494
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	495
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$igmagcia
	dw	0
	dw	117
	dw	0
	dw	496
	dw	0
	dw	0
	dw	0
?patch278	equ	@878-@@stk@cpu@cpu_has_msr$qv+72
?patch279	equ	0
?patch280	equ	@878-@@stk@cpu@cpu_has_msr$qv
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
$inmagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$abnagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_tsc$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_tsc$qv	proc	near
?live16443@0:
	?debug L 1888
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @879
@880:
	mov       ebx,offset $abnagcia
	?debug L 1894
?live16443@16: ; EBX = &$abnagcia
	mov       eax,dword ptr [$inmagcia]
	cmp       eax,-1
	je        short @884
	?debug L 1895
?live16443@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @882
	?debug L 1897
?live16443@48: ; EBX = &$abnagcia
@883:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@884:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @883
	cmp       dword ptr [ebx],0
	jne       short @883
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
	jmp       short @887
@886:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@887:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @890
	cmp       dword ptr [ebx],0
@890:
	je        short @888
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1900
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
	?debug L 1902
	mov       eax,dword ptr [ebp-28]
	and       eax,16
	mov       dword ptr [$inmagcia],eax
	?debug L 1903
?live16443@96: ; EBX = &$abnagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1904
?live16443@112: ; EBX = &$abnagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1906
?live16443@128: ; 
@892:
@882:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch283
	dd	?patch284
	dd	?patch285
	df	@@stk@cpu@cpu_has_tsc$qv
	dw	0
	dw	4216
	dw	0
	dw	497
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
	dw	498
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
	dw	499
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	500
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	501
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	502
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$abnagcia
	dw	0
	dw	4100
	dw	0
	dw	503
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	504
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$inmagcia
	dw	0
	dw	117
	dw	0
	dw	505
	dw	0
	dw	0
	dw	0
?patch283	equ	@892-@@stk@cpu@cpu_has_tsc$qv+74
?patch284	equ	0
?patch285	equ	@892-@@stk@cpu@cpu_has_tsc$qv
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
$ienagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ainagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_psn$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_psn$qv	proc	near
?live16444@0:
	?debug L 1909
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @893
@894:
	mov       ebx,offset $ainagcia
	?debug L 1915
?live16444@16: ; EBX = &$ainagcia
	mov       eax,dword ptr [$ienagcia]
	cmp       eax,-1
	je        short @898
	?debug L 1916
?live16444@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @896
	?debug L 1918
?live16444@48: ; EBX = &$ainagcia
@897:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@898:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @897
	cmp       dword ptr [ebx],0
	jne       short @897
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
	jmp       short @901
@900:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@901:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @904
	cmp       dword ptr [ebx],0
@904:
	je        short @902
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1921
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
	?debug L 1923
	mov       eax,dword ptr [ebp-28]
	and       eax,262144
	mov       dword ptr [$ienagcia],eax
	?debug L 1924
?live16444@96: ; EBX = &$ainagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1925
?live16444@112: ; EBX = &$ainagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1927
?live16444@128: ; 
@906:
@896:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch288
	dd	?patch289
	dd	?patch290
	df	@@stk@cpu@cpu_has_psn$qv
	dw	0
	dw	4218
	dw	0
	dw	506
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
	dw	507
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
	dw	508
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	509
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	510
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	511
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ainagcia
	dw	0
	dw	4100
	dw	0
	dw	512
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	513
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ienagcia
	dw	0
	dw	117
	dw	0
	dw	514
	dw	0
	dw	0
	dw	0
?patch288	equ	@906-@@stk@cpu@cpu_has_psn$qv+72
?patch289	equ	0
?patch290	equ	@906-@@stk@cpu@cpu_has_psn$qv
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
$ilnagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$apnagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_xsave$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_xsave$qv	proc	near
?live16445@0:
	?debug L 1930
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @907
@908:
	mov       ebx,offset $apnagcia
	?debug L 1936
?live16445@16: ; EBX = &$apnagcia
	mov       eax,dword ptr [$ilnagcia]
	cmp       eax,-1
	je        short @912
	?debug L 1937
?live16445@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @910
	?debug L 1939
?live16445@48: ; EBX = &$apnagcia
@911:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@912:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @911
	cmp       dword ptr [ebx],0
	jne       short @911
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
	jmp       short @915
@914:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@915:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @918
	cmp       dword ptr [ebx],0
@918:
	je        short @916
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1942
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
	?debug L 1944
	mov       eax,dword ptr [ebp-36]
	mov       edx,dword ptr [ebp-36]
	and       edx,134217728
	and       eax,67108864
	shr       edx,27
	?debug L 1942
	add       esp,24
	?debug L 1944
	shr       eax,26
	and       eax,edx
	?debug L 1946
?live16445@128: ; EBX = &$apnagcia, EAX = ret
	push      8
	?debug L 1945
?live16445@144: ; EBX = &$apnagcia, EAX = @temp3
	test      eax,eax
	?debug L 1944
?live16445@160: ; EBX = &$apnagcia
	mov       dword ptr [$ilnagcia],eax
	?debug L 1945
?live16445@176: ; EBX = &$apnagcia, EAX = @temp3
	setne     cl
	and       ecx,1
	?debug L 1946
?live16445@192: ; EBX = &$apnagcia, EAX = ret
	push      ebx
	?debug L 1945
?live16445@208: ; EBX = &$apnagcia, EAX = @temp3
	mov       eax,ecx
	?debug L 1946
?live16445@224: ; EBX = &$apnagcia, EAX = ret
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1948
?live16445@240: ; 
@920:
@910:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch293
	dd	?patch294
	dd	?patch295
	df	@@stk@cpu@cpu_has_xsave$qv
	dw	0
	dw	4220
	dw	0
	dw	515
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
	dw	516
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
	dw	517
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	518
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	519
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	520
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$apnagcia
	dw	0
	dw	4100
	dw	0
	dw	521
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	522
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ilnagcia
	dw	0
	dw	117
	dw	0
	dw	523
	dw	0
	dw	0
	dw	0
?patch293	equ	@920-@@stk@cpu@cpu_has_xsave$qv+75
?patch294	equ	0
?patch295	equ	@920-@@stk@cpu@cpu_has_xsave$qv
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
$icoagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$agoagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_clmul$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_clmul$qv	proc	near
?live16446@0:
	?debug L 1951
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @921
@922:
	mov       ebx,offset $agoagcia
	?debug L 1957
?live16446@16: ; EBX = &$agoagcia
	mov       eax,dword ptr [$icoagcia]
	cmp       eax,-1
	je        short @926
	?debug L 1958
?live16446@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @924
	?debug L 1960
?live16446@48: ; EBX = &$agoagcia
@925:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@926:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @925
	cmp       dword ptr [ebx],0
	jne       short @925
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
	jmp       short @929
@928:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@929:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @932
	cmp       dword ptr [ebx],0
@932:
	je        short @930
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1963
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
	?debug L 1965
	mov       eax,dword ptr [ebp-36]
	and       eax,4
	mov       dword ptr [$icoagcia],eax
	?debug L 1966
?live16446@96: ; EBX = &$agoagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1967
?live16446@112: ; EBX = &$agoagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1969
?live16446@128: ; 
@934:
@924:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch298
	dd	?patch299
	dd	?patch300
	df	@@stk@cpu@cpu_has_clmul$qv
	dw	0
	dw	4222
	dw	0
	dw	524
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
	dw	525
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
	dw	526
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	527
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	528
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	529
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$agoagcia
	dw	0
	dw	4100
	dw	0
	dw	530
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	531
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$icoagcia
	dw	0
	dw	117
	dw	0
	dw	532
	dw	0
	dw	0
	dw	0
?patch298	equ	@934-@@stk@cpu@cpu_has_clmul$qv+74
?patch299	equ	0
?patch300	equ	@934-@@stk@cpu@cpu_has_clmul$qv
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
$ijoagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$anoagcia	label	dword
	dd	0
	dd	0
	dd	0
	db	1	dup(?)
	align	4
$iapagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_psn$qv	segment virtual
	align	2
@@stk@cpu@cpu_psn$qv	proc	near
?live16447@0:
	?debug L 1972
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @935
@936:
	mov       ebx,offset $iapagcia
	mov       esi,offset $anoagcia
	?debug L 1979
?live16447@16: ; EBX = &$iapagcia, ESI = &$anoagcia
	cmp       dword ptr [$ijoagcia],-1
	je        short @940
	?debug L 1980
?live16447@32: ; ESI = &$anoagcia
	mov       eax,esi
	jmp       @938
	?debug L 1982
?live16447@48: ; EBX = &$iapagcia, ESI = &$anoagcia
@939:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@940:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @939
	cmp       dword ptr [ebx],0
	jne       short @939
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
	jmp       short @943
@942:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@943:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @946
	cmp       dword ptr [ebx],0
@946:
	je        short @944
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 1984
	push      4
	push      esi
	call      _CG_D_EP
	xor       eax,eax
	mov       dword ptr [esi],eax
	?debug L 1985
	push      4
	push      esi
	push      4
	call      _CG_DA_EPY
	xor       edx,edx
	mov       dword ptr [esi+4],edx
	?debug L 1986
	push      4
	push      esi
	push      8
	call      _CG_DA_EPY
	xor       eax,eax
	mov       dword ptr [esi+8],eax
	?debug L 1987
	call      @@stk@cpu@cpu_has_psn$qv
	test      al,al
	jne       short @948
	?debug L 1988
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1989
?live16447@144: ; ESI = &$anoagcia
	mov       eax,esi
	jmp       short @938
	?debug L 1993
?live16447@160: ; EBX = &$iapagcia, ESI = &$anoagcia
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
	?debug L 1995
	mov       ecx,dword ptr [ebp-52]
	push      4
	push      esi
	push      8
	call      _CG_DA_EPY
	mov       dword ptr [esi+8],ecx
	?debug L 1996
	mov       eax,dword ptr [ebp-28]
	push      4
	push      esi
	push      4
	call      _CG_DA_EPY
	mov       dword ptr [esi+4],eax
	?debug L 1997
	mov       edx,dword ptr [ebp-36]
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],edx
	?debug L 1998
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1999
?live16447@240: ; ESI = &$anoagcia
	mov       eax,esi
	?debug L 1998
?live16447@256: ; EBX = &$iapagcia, ESI = &$anoagcia
	mov       dword ptr [ebx+4],0
	?debug L 2000
?live16447@272: ; 
@949:
@938:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
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
	dd	?patch303
	dd	?patch304
	dd	?patch305
	df	@@stk@cpu@cpu_psn$qv
	dw	0
	dw	4224
	dw	0
	dw	533
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
	dw	534
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	535
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	536
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	537
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iapagcia
	dw	0
	dw	4100
	dw	0
	dw	538
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	539
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$anoagcia
	dw	0
	dw	4226
	dw	0
	dw	540
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ijoagcia
	dw	0
	dw	117
	dw	0
	dw	541
	dw	0
	dw	0
	dw	0
?patch303	equ	@949-@@stk@cpu@cpu_psn$qv+75
?patch304	equ	0
?patch305	equ	@949-@@stk@cpu@cpu_psn$qv
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
$aepagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ihpagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_fma$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_fma$qv	proc	near
?live16448@0:
	?debug L 2003
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @950
@951:
	mov       ebx,offset $ihpagcia
	?debug L 2009
?live16448@16: ; EBX = &$ihpagcia
	mov       eax,dword ptr [$aepagcia]
	cmp       eax,-1
	jne       @953
	?debug L 2010
?live16448@32: ; EAX = @temp3
	jmp       short @955
	?debug L 2012
?live16448@48: ; EBX = &$ihpagcia
@954:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@955:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @954
	cmp       dword ptr [ebx],0
	jne       short @954
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
	jmp       short @958
@957:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@958:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @961
	cmp       dword ptr [ebx],0
@961:
	je        short @959
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 2015
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
	?debug L 2017
	test      byte ptr [ebp-35],16
	je        short @963
	?debug L 2018
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
	?debug L 2019
	test      byte ptr [ebp-34],1
	je        short @964
	?debug L 2020
	mov       dword ptr [$aepagcia],4
	jmp       short @965
	?debug L 2022
@964:
	mov       dword ptr [$aepagcia],3
	?debug L 2023
	jmp       short @965
	?debug L 2025
@963:
	xor       eax,eax
	mov       dword ptr [$aepagcia],eax
	?debug L 2027
@965:
	cmp       dword ptr [$aepagcia],0
	setne     al
	and       eax,1
	?debug L 2028
?live16448@208: ; EBX = &$ihpagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 2029
?live16448@224: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	?debug L 2028
?live16448@240: ; EBX = &$ihpagcia, EAX = ret
	mov       dword ptr [ebx+4],0
	?debug L 2029
?live16448@256: ; EAX = ret
	mov       eax,edx
	?debug L 2030
?live16448@272: ; 
@966:
@953:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch306
	dd	?patch307
	dd	?patch308
	df	@@stk@cpu@cpu_has_fma$qv
	dw	0
	dw	4227
	dw	0
	dw	542
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
	dw	543
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
	dw	544
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	545
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	546
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	547
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ihpagcia
	dw	0
	dw	4100
	dw	0
	dw	548
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	549
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aepagcia
	dw	0
	dw	117
	dw	0
	dw	550
	dw	0
	dw	0
	dw	0
?patch306	equ	@966-@@stk@cpu@cpu_has_fma$qv+75
?patch307	equ	0
?patch308	equ	@966-@@stk@cpu@cpu_has_fma$qv
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
$alpagcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$iopagcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_aes$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_aes$qv	proc	near
?live16449@0:
	?debug L 2033
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @967
@968:
	mov       ebx,offset $iopagcia
	?debug L 2039
?live16449@16: ; EBX = &$iopagcia
	mov       eax,dword ptr [$alpagcia]
	cmp       eax,-1
	je        short @972
	?debug L 2040
?live16449@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @970
	?debug L 2042
?live16449@48: ; EBX = &$iopagcia
@971:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@972:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @971
	cmp       dword ptr [ebx],0
	jne       short @971
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
	jmp       short @975
@974:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@975:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @978
	cmp       dword ptr [ebx],0
@978:
	je        short @976
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 2045
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
	?debug L 2047
	mov       eax,dword ptr [ebp-36]
	and       eax,33554432
	mov       dword ptr [$alpagcia],eax
	?debug L 2048
?live16449@96: ; EBX = &$iopagcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2049
?live16449@112: ; EBX = &$iopagcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2051
?live16449@128: ; 
@980:
@970:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch311
	dd	?patch312
	dd	?patch313
	df	@@stk@cpu@cpu_has_aes$qv
	dw	0
	dw	4229
	dw	0
	dw	551
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
	dw	552
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
	dw	553
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	554
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	555
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	556
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$iopagcia
	dw	0
	dw	4100
	dw	0
	dw	557
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	558
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$alpagcia
	dw	0
	dw	117
	dw	0
	dw	559
	dw	0
	dw	0
	dw	0
?patch311	equ	@980-@@stk@cpu@cpu_has_aes$qv+72
?patch312	equ	0
?patch313	equ	@980-@@stk@cpu@cpu_has_aes$qv
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
$acabgcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ifabgcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viaaes$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viaaes$qv	proc	near
?live16450@0:
	?debug L 2054
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @981
@982:
	mov       ebx,offset $ifabgcia
	?debug L 2060
?live16450@16: ; EBX = &$ifabgcia
	mov       eax,dword ptr [$acabgcia]
	cmp       eax,-1
	je        short @986
	?debug L 2061
?live16450@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @984
	?debug L 2063
?live16450@48: ; EBX = &$ifabgcia
@985:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@986:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @985
	cmp       dword ptr [ebx],0
	jne       short @985
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
	jmp       short @989
@988:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@989:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @992
	cmp       dword ptr [ebx],0
@992:
	je        short @990
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 2066
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
	?debug L 2068
	mov       eax,dword ptr [ebp-28]
	and       eax,128
	mov       dword ptr [$acabgcia],eax
	?debug L 2069
?live16450@96: ; EBX = &$ifabgcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2070
?live16450@112: ; EBX = &$ifabgcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2072
?live16450@128: ; 
@994:
@984:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch316
	dd	?patch317
	dd	?patch318
	df	@@stk@cpu@cpu_has_viaaes$qv
	dw	0
	dw	4231
	dw	0
	dw	560
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
	dw	561
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
	dw	562
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	563
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	564
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	565
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ifabgcia
	dw	0
	dw	4100
	dw	0
	dw	566
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	567
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$acabgcia
	dw	0
	dw	117
	dw	0
	dw	568
	dw	0
	dw	0
	dw	0
?patch316	equ	@994-@@stk@cpu@cpu_has_viaaes$qv+73
?patch317	equ	0
?patch318	equ	@994-@@stk@cpu@cpu_has_viaaes$qv
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
$ajabgcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$imabgcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viarng$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viarng$qv	proc	near
?live16451@0:
	?debug L 2075
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @995
@996:
	mov       ebx,offset $imabgcia
	?debug L 2081
?live16451@16: ; EBX = &$imabgcia
	mov       eax,dword ptr [$ajabgcia]
	cmp       eax,-1
	je        short @1000
	?debug L 2082
?live16451@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @998
	?debug L 2084
?live16451@48: ; EBX = &$imabgcia
@999:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1000:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @999
	cmp       dword ptr [ebx],0
	jne       short @999
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
	jmp       short @1003
@1002:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1003:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1006
	cmp       dword ptr [ebx],0
@1006:
	je        short @1004
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 2087
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
	?debug L 2089
	mov       eax,dword ptr [ebp-28]
	and       eax,8
	mov       dword ptr [$ajabgcia],eax
	?debug L 2090
?live16451@96: ; EBX = &$imabgcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2091
?live16451@112: ; EBX = &$imabgcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2093
?live16451@128: ; 
@1008:
@998:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch321
	dd	?patch322
	dd	?patch323
	df	@@stk@cpu@cpu_has_viarng$qv
	dw	0
	dw	4233
	dw	0
	dw	569
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
	dw	570
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
	dw	571
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	572
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	573
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	574
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$imabgcia
	dw	0
	dw	4100
	dw	0
	dw	575
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	576
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ajabgcia
	dw	0
	dw	117
	dw	0
	dw	577
	dw	0
	dw	0
	dw	0
?patch321	equ	@1008-@@stk@cpu@cpu_has_viarng$qv+75
?patch322	equ	0
?patch323	equ	@1008-@@stk@cpu@cpu_has_viarng$qv
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
$aabbgcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$idbbgcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viahash$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viahash$qv	proc	near
?live16452@0:
	?debug L 2096
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @1009
@1010:
	mov       ebx,offset $idbbgcia
	?debug L 2102
?live16452@16: ; EBX = &$idbbgcia
	mov       eax,dword ptr [$aabbgcia]
	cmp       eax,-1
	je        short @1014
	?debug L 2103
?live16452@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @1012
	?debug L 2105
?live16452@48: ; EBX = &$idbbgcia
@1013:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1014:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1013
	cmp       dword ptr [ebx],0
	jne       short @1013
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
	jmp       short @1017
@1016:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1017:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1020
	cmp       dword ptr [ebx],0
@1020:
	je        short @1018
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 2108
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
	?debug L 2110
	mov       eax,dword ptr [ebp-28]
	and       eax,2048
	mov       dword ptr [$aabbgcia],eax
	?debug L 2111
?live16452@96: ; EBX = &$idbbgcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2112
?live16452@112: ; EBX = &$idbbgcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2114
?live16452@128: ; 
@1022:
@1012:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch326
	dd	?patch327
	dd	?patch328
	df	@@stk@cpu@cpu_has_viahash$qv
	dw	0
	dw	4235
	dw	0
	dw	578
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
	dw	579
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
	dw	580
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	581
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	582
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	583
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$idbbgcia
	dw	0
	dw	4100
	dw	0
	dw	584
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	585
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aabbgcia
	dw	0
	dw	117
	dw	0
	dw	586
	dw	0
	dw	0
	dw	0
?patch326	equ	@1022-@@stk@cpu@cpu_has_viahash$qv+73
?patch327	equ	0
?patch328	equ	@1022-@@stk@cpu@cpu_has_viahash$qv
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
$ahbbgcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ikbbgcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_rdseed$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_rdseed$qv	proc	near
?live16453@0:
	?debug L 2117
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @1023
@1024:
	mov       ebx,offset $ikbbgcia
	?debug L 2123
?live16453@16: ; EBX = &$ikbbgcia
	mov       eax,dword ptr [$ahbbgcia]
	cmp       eax,-1
	je        short @1028
	?debug L 2124
?live16453@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @1026
	?debug L 2126
?live16453@48: ; EBX = &$ikbbgcia
@1027:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1028:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1027
	cmp       dword ptr [ebx],0
	jne       short @1027
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
	jmp       short @1031
@1030:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1031:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1034
	cmp       dword ptr [ebx],0
@1034:
	je        short @1032
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 2129
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
	?debug L 2131
	mov       eax,dword ptr [ebp-44]
	and       eax,262144
	mov       dword ptr [$ahbbgcia],eax
	?debug L 2132
?live16453@96: ; EBX = &$ikbbgcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2133
?live16453@112: ; EBX = &$ikbbgcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2135
?live16453@128: ; 
@1036:
@1026:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch331
	dd	?patch332
	dd	?patch333
	df	@@stk@cpu@cpu_has_rdseed$qv
	dw	0
	dw	4237
	dw	0
	dw	587
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
	dw	588
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
	dw	589
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	590
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	591
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	592
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ikbbgcia
	dw	0
	dw	4100
	dw	0
	dw	593
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	594
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ahbbgcia
	dw	0
	dw	117
	dw	0
	dw	595
	dw	0
	dw	0
	dw	0
?patch331	equ	@1036-@@stk@cpu@cpu_has_rdseed$qv+72
?patch332	equ	0
?patch333	equ	@1036-@@stk@cpu@cpu_has_rdseed$qv
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
$aobbgcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ibcbgcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_rdrand$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_rdrand$qv	proc	near
?live16454@0:
	?debug L 2138
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @1037
@1038:
	mov       ebx,offset $ibcbgcia
	?debug L 2144
?live16454@16: ; EBX = &$ibcbgcia
	mov       eax,dword ptr [$aobbgcia]
	cmp       eax,-1
	je        short @1042
	?debug L 2145
?live16454@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @1040
	?debug L 2147
?live16454@48: ; EBX = &$ibcbgcia
@1041:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1042:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1041
	cmp       dword ptr [ebx],0
	jne       short @1041
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
	jmp       short @1045
@1044:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1045:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1048
	cmp       dword ptr [ebx],0
@1048:
	je        short @1046
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 2150
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
	?debug L 2152
	mov       eax,dword ptr [ebp-36]
	and       eax,1073741824
	mov       dword ptr [$aobbgcia],eax
	?debug L 2153
?live16454@96: ; EBX = &$ibcbgcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2154
?live16454@112: ; EBX = &$ibcbgcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2156
?live16454@128: ; 
@1050:
@1040:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch336
	dd	?patch337
	dd	?patch338
	df	@@stk@cpu@cpu_has_rdrand$qv
	dw	0
	dw	4239
	dw	0
	dw	596
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
	dw	597
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
	dw	598
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	599
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	600
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	601
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ibcbgcia
	dw	0
	dw	4100
	dw	0
	dw	602
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	603
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$aobbgcia
	dw	0
	dw	117
	dw	0
	dw	604
	dw	0
	dw	0
	dw	0
?patch336	equ	@1050-@@stk@cpu@cpu_has_rdrand$qv+72
?patch337	equ	0
?patch338	equ	@1050-@@stk@cpu@cpu_has_rdrand$qv
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
	?debug L 2165
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	push      ebx
	mov       dword ptr [ebp-8],offset @1051
@1052:
	mov       ebx,offset s@
	?debug L 2171
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
	?debug L 2172
	call      @@stk@cpu@cpu_name$qv
	push      eax
	push      ebx
	push      52
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+52]
	push      edx
	call      @@stk@con@prints$qpxce
	add       esp,8
	?debug L 2173
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
	?debug L 2174
	push      0
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1053
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
	jmp       short @1054
@1053:
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
	?debug L 2175
@1054:
	push      0
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1055
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
	jmp       short @1056
@1055:
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
	?debug L 2176
@1056:
	push      ebx
	push      197
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+197]
	push      eax
	call      @@stk@con@prints$qpxce
	pop       ecx
	?debug L 2177
	push      1
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1057
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
	jmp       short @1058
@1057:
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
	?debug L 2178
@1058:
	push      1
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1059
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
	jmp       short @1060
@1059:
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
	?debug L 2179
@1060:
	push      2
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1061
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
	jmp       short @1062
@1061:
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
	?debug L 2180
@1062:
	push      2
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1063
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
	jmp       short @1064
@1063:
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
	?debug L 2181
@1064:
	push      3
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1065
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
	jmp       short @1066
@1065:
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
	?debug L 2182
@1066:
	push      3
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1067
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
	jmp       short @1068
@1067:
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
	?debug L 2183
@1068:
	call      @@stk@cpu@cpu_num_cores$qv
	test      eax,eax
	je        short @1069
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
	jmp       short @1070
@1069:
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
	?debug L 2184
@1070:
	call      @@stk@cpu@cpu_num_threads$qv
	test      eax,eax
	je        short @1071
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
	jmp       short @1072
@1071:
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
	?debug L 2186
@1072:
	call      @@stk@cpu@cpu_has_amd64$qv
	and       eax,255
	test      eax,eax
	je        short @1073
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
	jmp       short @1074
@1073:
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
	?debug L 2187
@1074:
	call      @@stk@cpu@cpu_has_ht$qv
	and       eax,255
	test      eax,eax
	je        short @1075
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
	jmp       short @1076
@1075:
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
	?debug L 2188
@1076:
	call      @@stk@cpu@cpu_has_mmx$qv
	and       eax,255
	test      eax,eax
	je        short @1077
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
	jmp       short @1078
@1077:
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
	?debug L 2189
@1078:
	call      @@stk@cpu@cpu_has_mmxext$qv
	and       eax,255
	test      eax,eax
	je        short @1079
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
	jmp       short @1080
@1079:
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
	?debug L 2190
@1080:
	call      @@stk@cpu@cpu_has_3dnow$qv
	test      eax,eax
	je        short @1081
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
	jmp       short @1082
@1081:
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
	?debug L 2191
@1082:
	call      @@stk@cpu@cpu_has_3dnowprefetch$qv
	and       eax,255
	test      eax,eax
	je        short @1083
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
	jmp       short @1084
@1083:
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
	?debug L 2192
@1084:
	call      @@stk@cpu@cpu_has_fxsr$qv
	and       eax,255
	test      eax,eax
	je        short @1085
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
	jmp       short @1086
@1085:
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
	?debug L 2193
@1086:
	call      @@stk@cpu@cpu_has_sse$qv
	test      eax,eax
	je        short @1087
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
	jmp       short @1088
@1087:
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
	?debug L 2194
@1088:
	call      @@stk@cpu@cpu_has_xsave$qv
	and       eax,255
	test      eax,eax
	je        short @1089
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
	jmp       short @1090
@1089:
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
	?debug L 2195
@1090:
	call      @@stk@cpu@cpu_has_pclmulqdq$qv
	and       eax,255
	test      eax,eax
	je        short @1091
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
	jmp       short @1092
@1091:
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
	?debug L 2196
@1092:
	call      @@stk@cpu@cpu_has_movbe$qv
	and       eax,255
	test      eax,eax
	je        short @1093
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
	jmp       short @1094
@1093:
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
	?debug L 2197
@1094:
	call      @@stk@cpu@cpu_has_fma$qv
	test      eax,eax
	je        short @1095
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
	jmp       short @1096
@1095:
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
	?debug L 2198
@1096:
	call      @@stk@cpu@cpu_has_popcnt$qv
	and       eax,255
	test      eax,eax
	je        short @1097
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
	jmp       short @1098
@1097:
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
	?debug L 2199
@1098:
	call      @@stk@cpu@cpu_has_xop$qv
	and       eax,255
	test      eax,eax
	je        short @1099
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
	jmp       short @1100
@1099:
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
	?debug L 2200
@1100:
	call      @@stk@cpu@cpu_has_lzcnt$qv
	and       eax,255
	test      eax,eax
	je        short @1101
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
	jmp       short @1102
@1101:
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
	?debug L 2201
@1102:
	call      @@stk@cpu@cpu_has_f16c$qv
	and       eax,255
	test      eax,eax
	je        short @1103
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
	jmp       short @1104
@1103:
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
	?debug L 2202
@1104:
	call      @@stk@cpu@cpu_has_avx$qv
	test      eax,eax
	je        short @1105
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
	jmp       short @1106
@1105:
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
	?debug L 2203
@1106:
	call      @@stk@cpu@cpu_has_avx512f$qv
	and       eax,255
	test      eax,eax
	je        short @1107
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
	jmp       short @1108
@1107:
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
	?debug L 2204
@1108:
	call      @@stk@cpu@cpu_has_avx512bw$qv
	and       eax,255
	test      eax,eax
	je        short @1109
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
	jmp       short @1110
@1109:
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
	?debug L 2205
@1110:
	call      @@stk@cpu@cpu_has_avx512cd$qv
	and       eax,255
	test      eax,eax
	je        short @1111
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
	jmp       short @1112
@1111:
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
	?debug L 2206
@1112:
	call      @@stk@cpu@cpu_has_avx512dq$qv
	and       eax,255
	test      eax,eax
	je        short @1113
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
	jmp       short @1114
@1113:
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
	?debug L 2207
@1114:
	call      @@stk@cpu@cpu_has_avx512er$qv
	and       eax,255
	test      eax,eax
	je        short @1115
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
	jmp       short @1116
@1115:
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
	?debug L 2208
@1116:
	call      @@stk@cpu@cpu_has_avx512pf$qv
	and       eax,255
	test      eax,eax
	je        short @1117
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
	jmp       short @1118
@1117:
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
	?debug L 2209
@1118:
	call      @@stk@cpu@cpu_has_avx512vl$qv
	and       eax,255
	test      eax,eax
	je        short @1119
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
	jmp       short @1120
@1119:
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
	?debug L 2210
@1120:
	call      @@stk@cpu@cpu_has_avx512ifma$qv
	and       eax,255
	test      eax,eax
	je        short @1121
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
	jmp       short @1122
@1121:
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
	?debug L 2211
@1122:
	call      @@stk@cpu@cpu_has_bmi$qv
	test      eax,eax
	je        short @1123
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
	jmp       short @1124
@1123:
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
	?debug L 2212
@1124:
	call      @@stk@cpu@cpu_has_avx512vbmi$qv
	and       eax,255
	test      eax,eax
	je        short @1125
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
	jmp       short @1126
@1125:
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
	?debug L 2213
@1126:
	call      @@stk@cpu@cpu_has_cmov$qv
	and       eax,255
	test      eax,eax
	je        short @1127
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
	jmp       short @1128
@1127:
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
	?debug L 2214
@1128:
	call      @@stk@cpu@cpu_has_cmpxchg$qv
	test      eax,eax
	je        short @1129
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
	jmp       short @1130
@1129:
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
	?debug L 2215
@1130:
	call      @@stk@cpu@cpu_has_clmul$qv
	and       eax,255
	test      eax,eax
	je        short @1131
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
	jmp       short @1132
@1131:
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
	?debug L 2216
@1132:
	call      @@stk@cpu@cpu_has_aes$qv
	and       eax,255
	test      eax,eax
	je        short @1133
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
	jmp       short @1134
@1133:
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
	?debug L 2217
@1134:
	call      @@stk@cpu@cpu_has_sha$qv
	and       eax,255
	test      eax,eax
	je        short @1135
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
	jmp       short @1136
@1135:
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
	?debug L 2218
@1136:
	call      @@stk@cpu@cpu_has_rdrand$qv
	and       eax,255
	test      eax,eax
	je        short @1137
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
	jmp       short @1138
@1137:
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
	?debug L 2219
@1138:
	call      @@stk@cpu@cpu_has_rdseed$qv
	and       eax,255
	test      eax,eax
	je        short @1139
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
	jmp       short @1140
@1139:
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
	?debug L 2220
@1140:
	call      @@stk@cpu@cpu_has_tsc$qv
	and       eax,255
	test      eax,eax
	je        short @1141
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
	jmp       short @1142
@1141:
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
	?debug L 2221
@1142:
	call      @@stk@cpu@cpu_has_perftsc$qv
	and       eax,255
	test      eax,eax
	je        short @1143
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
	jmp       short @1144
@1143:
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
	?debug L 2222
@1144:
	call      @@stk@cpu@cpu_has_erms$qv
	and       eax,255
	test      eax,eax
	je        short @1145
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
	jmp       short @1146
@1145:
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
	?debug L 2223
@1146:
	call      @@stk@cpu@cpu_has_msr$qv
	and       eax,255
	test      eax,eax
	je        short @1147
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
	jmp       short @1148
@1147:
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
	?debug L 2224
@1148:
	call      @@stk@cpu@cpu_has_mtrr$qv
	and       eax,255
	test      eax,eax
	je        short @1149
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
	jmp       short @1150
@1149:
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
	?debug L 2225
@1150:
	call      @@stk@cpu@cpu_has_vmx$qv
	and       eax,255
	test      eax,eax
	je        short @1151
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
	jmp       short @1152
@1151:
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
	?debug L 2227
?live16455@880: ; 
@1152:
@1153:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
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
	dd	?patch341
	dd	?patch342
	dd	?patch343
	df	@@stk@cpu@cpu_print_info$qv
	dw	0
	dw	4241
	dw	0
	dw	605
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
	dw	606
	dw	0
	dw	0
	dw	0
?patch341	equ	@1153-@@stk@cpu@cpu_print_info$qv+35
?patch342	equ	0
?patch343	equ	@1153-@@stk@cpu@cpu_print_info$qv
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
	?debug L 2230
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @1154
	?debug L 2235
@1155:
	call      @@stk@cpu@cpu_print_info$qv
	?debug L 2236
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
	dd	?patch344
	dd	?patch345
	dd	?patch346
	df	@@stk@cpu@cpu_test$qv
	dw	0
	dw	4243
	dw	0
	dw	607
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
?patch344	equ	@1156-@@stk@cpu@cpu_test$qv+31
?patch345	equ	0
?patch346	equ	@1156-@@stk@cpu@cpu_test$qv
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
	dd	?patch347
	dd	?patch348
	dd	?patch349
	df	@_STCON0_$qv
	dw	0
	dw	4245
	dw	0
	dw	608
	dw	0
	dw	0
	dw	0
?patch347	equ	@1159-@_STCON0_$qv+31
?patch348	equ	0
?patch349	equ	@1159-@_STCON0_$qv
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
	dd	$addpfcia
	dd	8
	dd	4
	dd	$andpfcia
	dd	8
	dd	4
	dd	$iaepfcia
	dd	8
	dd	4
	dd	$aeepfcia
	dd	8
	dd	4
	dd	$ihepfcia
	dd	8
	dd	4
	dd	$alepfcia
	dd	8
	dd	4
	dd	$ioepfcia
	dd	8
	dd	4
	dd	$acfpfcia
	dd	4
	dd	4
	dd	$iffpfcia
	dd	4
	dd	4
	dd	$ajfpfcia
	dd	4
	dd	4
	dd	$imfpfcia
	dd	4
	dd	4
	dd	$aagpfcia
	dd	4
	dd	4
	dd	$idgpfcia
	dd	4
	dd	4
	dd	$ahgpfcia
	dd	8
	dd	4
	dd	$abhpfcia
	dd	16
	dd	4
	dd	$iehpfcia
	dd	8
	dd	4
	dd	$iohpfcia
	dd	52
	dd	4
	dd	$acipfcia
	dd	8
	dd	4
	dd	$amipfcia
	dd	4
	dd	4
	dd	$ipipfcia
	dd	8
	dd	4
	dd	$adjpfcia
	dd	4
	dd	4
	dd	$igjpfcia
	dd	8
	dd	4
	dd	$akjpfcia
	dd	4
	dd	4
	dd	$injpfcia
	dd	8
	dd	4
	dd	$abkpfcia
	dd	4
	dd	4
	dd	$iekpfcia
	dd	8
	dd	4
	dd	$aikpfcia
	dd	4
	dd	4
	dd	$ilkpfcia
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
	dd	8
	dd	4
	dd	$ihbagcia
	dd	4
	dd	4
	dd	$albagcia
	dd	8
	dd	4
	dd	$iobagcia
	dd	4
	dd	4
	dd	$accagcia
	dd	8
	dd	4
	dd	$ifcagcia
	dd	4
	dd	4
	dd	$ajcagcia
	dd	8
	dd	4
	dd	$imcagcia
	dd	4
	dd	4
	dd	$aadagcia
	dd	8
	dd	4
	dd	$iddagcia
	dd	4
	dd	4
	dd	$ahdagcia
	dd	8
	dd	4
	dd	$ikdagcia
	dd	4
	dd	4
	dd	$aodagcia
	dd	8
	dd	4
	dd	$ibeagcia
	dd	4
	dd	4
	dd	$afeagcia
	dd	8
	dd	4
	dd	$iieagcia
	dd	4
	dd	4
	dd	$ameagcia
	dd	8
	dd	4
	dd	$ipeagcia
	dd	4
	dd	4
	dd	$adfagcia
	dd	8
	dd	4
	dd	$igfagcia
	dd	4
	dd	4
	dd	$akfagcia
	dd	8
	dd	4
	dd	$infagcia
	dd	4
	dd	4
	dd	$abgagcia
	dd	8
	dd	4
	dd	$iegagcia
	dd	4
	dd	4
	dd	$aigagcia
	dd	8
	dd	4
	dd	$ilgagcia
	dd	4
	dd	4
	dd	$apgagcia
	dd	8
	dd	4
	dd	$ichagcia
	dd	4
	dd	4
	dd	$aghagcia
	dd	8
	dd	4
	dd	$ijhagcia
	dd	4
	dd	4
	dd	$anhagcia
	dd	8
	dd	4
	dd	$iaiagcia
	dd	4
	dd	4
	dd	$aeiagcia
	dd	8
	dd	4
	dd	$ihiagcia
	dd	4
	dd	4
	dd	$aliagcia
	dd	8
	dd	4
	dd	$ioiagcia
	dd	4
	dd	4
	dd	$acjagcia
	dd	8
	dd	4
	dd	$ifjagcia
	dd	4
	dd	4
	dd	$ajjagcia
	dd	8
	dd	4
	dd	$imjagcia
	dd	4
	dd	4
	dd	$aakagcia
	dd	8
	dd	4
	dd	$idkagcia
	dd	4
	dd	4
	dd	$ahkagcia
	dd	8
	dd	4
	dd	$ikkagcia
	dd	4
	dd	4
	dd	$aokagcia
	dd	8
	dd	4
	dd	$iblagcia
	dd	4
	dd	4
	dd	$aflagcia
	dd	8
	dd	4
	dd	$iilagcia
	dd	4
	dd	4
	dd	$amlagcia
	dd	8
	dd	4
	dd	$iplagcia
	dd	4
	dd	4
	dd	$admagcia
	dd	8
	dd	4
	dd	$igmagcia
	dd	4
	dd	4
	dd	$akmagcia
	dd	8
	dd	4
	dd	$inmagcia
	dd	4
	dd	4
	dd	$abnagcia
	dd	8
	dd	4
	dd	$ienagcia
	dd	4
	dd	4
	dd	$ainagcia
	dd	8
	dd	4
	dd	$ilnagcia
	dd	4
	dd	4
	dd	$apnagcia
	dd	8
	dd	4
	dd	$icoagcia
	dd	4
	dd	4
	dd	$agoagcia
	dd	8
	dd	4
	dd	$ijoagcia
	dd	4
	dd	4
	dd	$anoagcia
	dd	12
	dd	4
	dd	$iapagcia
	dd	8
	dd	4
	dd	$aepagcia
	dd	4
	dd	4
	dd	$ihpagcia
	dd	8
	dd	4
	dd	$alpagcia
	dd	4
	dd	4
	dd	$iopagcia
	dd	8
	dd	4
	dd	$acabgcia
	dd	4
	dd	4
	dd	$ifabgcia
	dd	8
	dd	4
	dd	$ajabgcia
	dd	4
	dd	4
	dd	$imabgcia
	dd	8
	dd	4
	dd	$aabbgcia
	dd	4
	dd	4
	dd	$idbbgcia
	dd	8
	dd	4
	dd	$ahbbgcia
	dd	4
	dd	4
	dd	$ikbbgcia
	dd	8
	dd	4
	dd	$aobbgcia
	dd	4
	dd	4
	dd	$ibcbgcia
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
	dw	609
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
	dw	610
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	611
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	113
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
	dw	1027
	dw	0
	dw	0
	dw	614
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	615
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	616
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	617
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1136
	dw	0
	dw	0
	dw	618
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	619
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	620
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	621
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	622
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	64
	dw	0
	dw	0
	dw	623
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	624
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	4255
	dw	0
	dw	0
	dw	625
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	626
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	627
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1141
	dw	0
	dw	0
	dw	628
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	629
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
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
	dw	117
	dw	0
	dw	0
	dw	636
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1141
	dw	0
	dw	0
	dw	637
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	638
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	639
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1141
	dw	0
	dw	0
	dw	640
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	641
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	642
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	643
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	17
	dw	0
	dw	0
	dw	644
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
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
	dw	18
	dw	0
	dw	0
	dw	647
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	648
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	118
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
	dw	119
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
	dw	1027
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
	dw	112
	dw	0
	dw	0
	dw	656
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	17
	dw	0
	dw	0
	dw	657
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	658
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	113
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
	dw	4264
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
	dw	1136
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
	dw	4264
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
	dw	113
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
	dw	1027
	dw	0
	dw	0
	dw	672
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	673
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	674
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	675
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	676
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	112
	dw	0
	dw	0
	dw	677
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	678
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
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
	dw	118
	dw	0
	dw	0
	dw	682
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
	dw	0
	dw	0
	dw	683
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	684
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
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
	dw	34
	dw	0
	dw	0
	dw	689
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	690
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	691
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
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
	dw	117
	dw	0
	dw	0
	dw	694
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
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
	dw	1027
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
	dw	33
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
	dw	116
	dw	0
	dw	0
	dw	730
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	731
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
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
	dw	113
	dw	0
	dw	0
	dw	737
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	738
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
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
	dw	1141
	dw	0
	dw	0
	dw	758
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	759
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
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
	dw	34
	dw	0
	dw	0
	dw	764
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	765
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	766
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	112
	dw	0
	dw	0
	dw	767
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	16
	dw	0
	dw	0
	dw	768
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
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
	dw	116
	dw	0
	dw	0
	dw	771
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	112
	dw	0
	dw	0
	dw	772
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	773
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	17
	dw	0
	dw	0
	dw	774
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	775
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	776
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
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
	dw	118
	dw	0
	dw	0
	dw	780
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
	dw	0
	dw	0
	dw	781
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
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
	dw	116
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
	dw	18
	dw	0
	dw	0
	dw	790
	dw	0
	dw	0
	dw	0
	dw	?patch351
	dw	37
	dw	791
	dw	0
	dw	0
	dw	0
	dw	0
?patch351	equ	12
	dw	?patch352
	dw	37
	dw	792
	dw	0
	dw	0
	dw	0
	dw	0
?patch352	equ	12
	dw	?patch353
	dw	37
	dw	793
	dw	0
	dw	0
	dw	0
	dw	0
?patch353	equ	12
	dw	?patch354
	dw	37
	dw	794
	dw	0
	dw	0
	dw	0
	dw	0
?patch354	equ	12
	dw	?patch355
	dw	37
	dw	795
	dw	0
	dw	0
	dw	0
	dw	0
?patch355	equ	12
	dw	?patch356
	dw	37
	dw	796
	dw	0
	dw	0
	dw	0
	dw	0
?patch356	equ	12
	dw	?patch357
	dw	37
	dw	797
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
	dw	798
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_PAUSED
	dw	0
	dw	119
	dw	0
	dw	799
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_LAST_MEASURED
	dw	0
	dw	119
	dw	0
	dw	800
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_ADJ
	dw	0
	dw	119
	dw	0
	dw	801
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_ELAPSED
	dw	0
	dw	119
	dw	0
	dw	802
	dw	0
	dw	0
	dw	0
	dw	?patch358
	dw	38
	dw	514
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
	dw	1315
	dw	0
	dw	1316
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
	?debug	D "C:\SRC\LIB\stk\cpu\stk_cpu.h" 23625 39993
	?debug	D "C:\SRC\LIB\stk\cpu\./../io/./../stk_main.h" 23625 33624
	?debug	D "C:\SRC\LIB\stk\cpu\./../io/stk_console.h" 23625 39993
	?debug	D "C:\SRC\LIB\stk\cpu\./../time/stk_time.h" 23625 39993
	?debug	D "C:\SRC\LIB\stk\cpu\./../stasm/stk_stasm.h" 22356 34828
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\_lim.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\limits.h" 10305 8192
	?debug	D "C:\SRC\LIB\stk\cpu\./../threads/./../cpu/./../stk_main.h" 23625 33624
	?debug	D "C:\SRC\LIB\stk\cpu\./../threads/./../cpu/stk_cpu.h" 23625 39993
	?debug	D "C:\SRC\LIB\stk\cpu\./../threads/./../time/stk_time.h" 23625 39993
	?debug	D "C:\SRC\LIB\stk\cpu\./../threads/./../stk_main.h" 23625 33624
	?debug	D "C:\SRC\LIB\stk\cpu\./../threads/stk_threads.h" 23625 39993
	?debug	D "C:\SRC\LIB\stk\cpu\./../text/stk_cstr_utils.h" 22373 26066
	?debug	D "C:\SRC\LIB\stk\cpu\./../mem/./.././stasm/./../stk_main.h" 23625 33624
	?debug	D "C:\SRC\LIB\stk\cpu\./../mem/./.././stasm/stk_stasm.h" 22356 34828
	?debug	D "C:\SRC\LIB\stk\cpu\./../mem/./.././text/./../stk_main.h" 23625 33624
	?debug	D "C:\SRC\LIB\stk\cpu\./../mem/./.././text/stk_cstr_utils.h" 22373 26066
	?debug	D "C:\SRC\LIB\stk\cpu\./../mem/./.././time/./../stk_main.h" 23625 33624
	?debug	D "C:\SRC\LIB\stk\cpu\./../mem/./.././time/stk_time.h" 23625 39993
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\sys/stat.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\sys/types.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\fcntl.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\stdio.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\time.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\assert.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\search.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\stdlib.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\tchar.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\dir.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\direct.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\_nfile.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\io.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\conio.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\qos.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\imm.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\mcx.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winsvc.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winnetwk.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winreg.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winver.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\wincon.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winnls.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\tvout.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winuser.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\pshpack1.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\wingdi.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winerror.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winbase.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\pshpack8.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\pshpack2.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\poppack.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\_loc.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\locale.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\_str.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\string.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\guiddef.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\basetsd.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\mbctype.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\ctype.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winnt.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\windef.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\stdarg.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\excpt.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\_null.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\_defs.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\_stddef.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\mem.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\windows.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\pshpack4.h" 10305 8192
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\winsock2.h" 10305 8192
	?debug	D "C:\SRC\LIB\stk\cpu\./../mem/./../stk_main.h" 23625 33624
	?debug	D "C:\SRC\LIB\stk\cpu\./../mem/stk_mem.h" 22373 26066
	?debug	D "C:\SRC\LIB\stk\cpu\stk_cpu.cpp" 23625 39993
	end
