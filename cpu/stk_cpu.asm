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
@stk@cpu@rdtscp$qpuit1	segment virtual
	align	2
@@stk@cpu@rdtscp$qpuit1	proc	near
?live16385@0:
	?debug L 18
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-40
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @1
	mov       esi,dword ptr [ebp+12]
	mov       ebx,dword ptr [ebp+8]
	?debug L 28
@2:
	rdtscp	
	?debug L 29
	mov	 [dword ptr [ebp-36]], eax
	?debug L 30
	mov	 [dword ptr [ebp-28]], edx
	?debug L 31
	mov	 [dword ptr [ebp-44]], ecx
	?debug L 41
?live16385@80: ; EBX = a_chip, ESI = a_core
	test      ebx,ebx
	je        short @3
	?debug L 42
	mov       eax,dword ptr [ebp-44]
	push      4
	and       eax,16773120
	push      ebx
	shr       eax,12
	push      0
	call      _CG_DA_EPY
	mov       dword ptr [ebx],eax
	?debug L 43
?live16385@112: ; ESI = a_core
@3:
	test      esi,esi
	je        short @4
	?debug L 44
	mov       edx,dword ptr [ebp-44]
	push      4
	push      esi
	push      0
	and       edx,4095
	call      _CG_DA_EPY
	mov       dword ptr [esi],edx
	?debug L 45
?live16385@144: ; 
@4:
	mov       eax,dword ptr [ebp-28]
	xor       edx,edx
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 46
	mov       edx,dword ptr [ebp-20]
	xor       eax,eax
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 47
	mov       eax,dword ptr [ebp-36]
	xor       edx,edx
	or        eax,dword ptr [ebp-20]
	or        edx,dword ptr [ebp-16]
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 48
	mov       eax,dword ptr [ebp-20]
	mov       edx,dword ptr [ebp-16]
	?debug L 49
@6:
@5:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1:
	db        67,71,83,0
	dd        @@stk@cpu@rdtscp$qpuit1+0
	dd        @1+0
	db        212,255,255,255,16,0,0,0,4,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0,212,255,255,255,4,0,0,0
	?debug L 0
@@stk@cpu@rdtscp$qpuit1	endp
@stk@cpu@rdtscp$qpuit1	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	db	2
	db	0
	db	0
	db	0
	dw	69
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
	df	@@stk@cpu@rdtscp$qpuit1
	dw	0
	dw	4096
	dw	0
	dw	1
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
	db	114
	db	100
	db	116
	db	115
	db	99
	db	112
	db	36
	db	113
	db	112
	db	117
	db	105
	db	116
	db	49
	dw	18
	dw	512
	dw	8
	dw	0
	dw	1141
	dw	0
	dw	2
	dw	0
	dw	0
	dw	0
	dw	?patch4
	dw	529
	dw	?patch5
	dd	?live16385@80-@@stk@cpu@rdtscp$qpuit1
	dd	?live16385@112-?live16385@80
	dw	20
?patch5	equ	1
?patch4	equ	14
	dw	18
	dw	512
	dw	12
	dw	0
	dw	1141
	dw	0
	dw	3
	dw	0
	dw	0
	dw	0
	dw	?patch6
	dw	529
	dw	?patch7
	dd	?live16385@80-@@stk@cpu@rdtscp$qpuit1
	dd	?live16385@144-?live16385@80
	dw	23
?patch7	equ	1
?patch6	equ	14
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	4
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	5
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	6
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	119
	dw	0
	dw	7
	dw	0
	dw	0
	dw	0
?patch1	equ	@6-@@stk@cpu@rdtscp$qpuit1+65
?patch2	equ	0
?patch3	equ	@6-@@stk@cpu@rdtscp$qpuit1
	dw	2
	dw	6
	dw	8
	dw	531
	dw	5
	dw	65484
	dw	65535
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@rdtsc$qv	segment virtual
	align	2
@@stk@cpu@rdtsc$qv	proc	near
?live16386@0:
	?debug L 53
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-32
	mov       dword ptr [ebp-8],offset @7
	?debug L 84
@8:
	rdtsc	
	?debug L 85
	mov	 [dword ptr [ebp-28]], eax
	?debug L 86
	mov	 [dword ptr [ebp-36]], edx
	?debug L 104
	mov       eax,dword ptr [ebp-36]
	xor       edx,edx
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 105
	mov       edx,dword ptr [ebp-20]
	xor       eax,eax
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 106
	mov       eax,dword ptr [ebp-28]
	xor       edx,edx
	or        eax,dword ptr [ebp-20]
	or        edx,dword ptr [ebp-16]
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 107
	mov       eax,dword ptr [ebp-20]
	mov       edx,dword ptr [ebp-16]
	?debug L 108
@10:
@9:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@7:
	db        67,71,83,0
	dd        @@stk@cpu@rdtsc$qv+0
	dd        @7+0
	db        220,255,255,255,8,0,0,0,3,0,0,0,236,255,255,255
	db        8,0,0,0,228,255,255,255,4,0,0,0,220,255,255,255
	db        4,0,0,0
	?debug L 0
@@stk@cpu@rdtsc$qv	endp
@stk@cpu@rdtsc$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	64
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
	df	@@stk@cpu@rdtsc$qv
	dw	0
	dw	4098
	dw	0
	dw	8
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
	dw	9
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	10
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	119
	dw	0
	dw	11
	dw	0
	dw	0
	dw	0
?patch8	equ	@10-@@stk@cpu@rdtsc$qv+57
?patch9	equ	0
?patch10	equ	@10-@@stk@cpu@rdtsc$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$enckfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@rdtscex$qv	segment virtual
	align	2
@@stk@cpu@rdtscex$qv	proc	near
?live16387@0:
	?debug L 111
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-44
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @11
	mov       edi,offset $enckfcia
@12:
	jmp       short @14
	?debug L 237
?live16387@16: ; EDI = &$enckfcia
@13:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@14:
	push      8
	push      edi
	call      _CG_D_EP
	cmp       dword ptr [edi+4],0
	jne       short @13
	cmp       dword ptr [edi],0
@15:
	jne       short @13
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
	jmp       short @17
@16:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@17:
	push      8
	push      edi
	call      _CG_D_EP
	cmp       dword ptr [edi+4],0
	jne       short @20
	cmp       dword ptr [edi],0
@20:
	je        short @18
	push      8
	push      edi
	call      _CG_D_EP
	mov       eax,dword ptr [edi]
	mov       edx,dword ptr [edi+4]
	cmp       edx,dword ptr [ebp-44]
	jne       short @21
	cmp       eax,dword ptr [ebp-48]
@21:
	setne     cl
	and       ecx,1
	jmp       short @19
@18:
	xor       ecx,ecx
@19:
	test      cl,cl
	jne       short @16
	?debug L 239
?live16387@32: ; 
	pushfd	
	?debug L 240
	push	 eax
	?debug L 241
	push	 ebx
	?debug L 242
	push	 ecx
	?debug L 243
	push	 edx
	?debug L 244
	push	 esi
	?debug L 245
	mov	 eax,000000001H
	?debug L 246
	xor	 ecx,ecx
	?debug L 247
	cpuid	
	?debug L 248
	mov	 ecx,000000001H
	?debug L 249
	shl	 ecx,27
	?debug L 250
	and	 ecx,edx
	?debug L 251
	xor	 eax,eax
	?debug L 252
	xor	 edx,edx
	?debug L 254
	test	 ecx,ecx
	?debug L 255
?live16387@272: ; EDI = &$enckfcia
	je        @22
	?debug L 256
?live16387@288: ; 
	mov	 eax,1
	?debug L 257
	cpuid	
	?debug L 258
?live16387@320: ; EDI = &$enckfcia
	jmp       @23
	?debug L 260
?live16387@336: ; 
	sfence	
	?debug L 261
	rdtsc	
	?debug L 263
@23:
tsc_intel_measure:
	?debug L 264
	sfence	
	?debug L 265
	rdtsc	
	?debug L 267
@22:
tsc_exit:
	?debug L 268
	mov	 [dword ptr [ebp-28]],eax
	?debug L 269
	mov	 [dword ptr [ebp-36]],edx
	?debug L 270
	pop	 esi
	?debug L 271
	pop	 edx
	?debug L 272
	pop	 ecx
	?debug L 273
	pop	 ebx
	?debug L 274
	pop	 eax
	?debug L 275
	popfd	
	?debug L 277
?live16387@560: ; EDI = &$enckfcia
	mov       eax,dword ptr [ebp-36]
	xor       edx,edx
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 278
	mov       edx,dword ptr [ebp-20]
	xor       eax,eax
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 279
	mov       eax,dword ptr [ebp-28]
	xor       edx,edx
	or        eax,dword ptr [ebp-20]
	or        edx,dword ptr [ebp-16]
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 280
	push      8
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],0
	mov       dword ptr [edi+4],0
	?debug L 281
?live16387@624: ; 
	mov       eax,dword ptr [ebp-20]
	mov       edx,dword ptr [ebp-16]
	?debug L 293
@25:
@24:
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@11:
	db        67,71,83,0
	dd        @@stk@cpu@rdtscex$qv+0
	dd        @11+0
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
	dd	?patch11
	dd	?patch12
	dd	?patch13
	df	@@stk@cpu@rdtscex$qv
	dw	0
	dw	4100
	dw	0
	dw	12
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
	df	$enckfcia
	dw	0
	dw	4102
	dw	0
	dw	13
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65488
	dw	65535
	dw	118
	dw	0
	dw	14
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	15
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	16
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	119
	dw	0
	dw	17
	dw	0
	dw	0
	dw	0
?patch11	equ	@25-@@stk@cpu@rdtscex$qv+68
?patch12	equ	0
?patch13	equ	@25-@@stk@cpu@rdtscex$qv
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
$ehdkfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_init$qv	segment virtual
	align	2
@@stk@cpu@tsc_init$qv	proc	near
?live16388@0:
	?debug L 296
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-52
	push      ebx
	mov       dword ptr [ebp-8],offset @26
@27:
	mov       ebx,offset $ehdkfcia
	jmp       short @29
	?debug L 299
?live16388@16: ; EBX = &$ehdkfcia
@28:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@29:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @28
	cmp       dword ptr [ebx],0
	jne       short @28
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
	jmp       short @32
@31:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@32:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @35
	cmp       dword ptr [ebx],0
@35:
	je        short @33
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @36
	cmp       eax,dword ptr [ebp-20]
@36:
	setne     cl
	and       ecx,1
	jmp       short @34
@33:
	xor       ecx,ecx
@34:
	test      cl,cl
	jne       short @31
	?debug L 301
	mov       dword ptr [_tsc_ADJ],0
	mov       dword ptr [_tsc_ADJ+4],0
	?debug L 302
	call      @@stk@cpu@tsc_start$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 303
	call      @@stk@cpu@tsc_checkpoint$qv
	mov       dword ptr [ebp-44],eax
	mov       dword ptr [ebp-40],edx
	?debug L 304
	mov       eax,dword ptr [ebp-44]
	mov       edx,dword ptr [ebp-40]
	cmp       edx,dword ptr [ebp-28]
	jne       short @38
	cmp       eax,dword ptr [ebp-32]
@38:
	jbe       short @37
	?debug L 305
	mov       eax,dword ptr [ebp-44]
	mov       edx,dword ptr [ebp-40]
	sub       eax,dword ptr [ebp-32]
	sbb       edx,dword ptr [ebp-28]
	mov       dword ptr [_tsc_ADJ],eax
	mov       dword ptr [_tsc_ADJ+4],edx
	?debug L 306
@37:
	mov       eax,dword ptr [_tsc_ADJ]
	mov       dword ptr [ebp-56],eax
	mov       eax,dword ptr [_tsc_ADJ+4]
	mov       dword ptr [ebp-52],eax
	?debug L 307
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 308
?live16388@144: ; 
	mov       eax,dword ptr [ebp-56]
	mov       edx,dword ptr [ebp-52]
	?debug L 309
@40:
@39:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@26:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_init$qv+0
	dd        @26+0
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
	dd	?patch14
	dd	?patch15
	dd	?patch16
	df	@@stk@cpu@tsc_init$qv
	dw	0
	dw	4103
	dw	0
	dw	18
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
	dw	19
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	119
	dw	0
	dw	20
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65504
	dw	65535
	dw	119
	dw	0
	dw	21
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ehdkfcia
	dw	0
	dw	4102
	dw	0
	dw	22
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	23
	dw	0
	dw	0
	dw	0
?patch14	equ	@40-@@stk@cpu@tsc_init$qv+64
?patch15	equ	0
?patch16	equ	@40-@@stk@cpu@tsc_init$qv
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
$mkdkfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_start$qv	segment virtual
	align	2
@@stk@cpu@tsc_start$qv	proc	near
?live16389@0:
	?debug L 312
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-28
	push      ebx
	mov       dword ptr [ebp-8],offset @41
@42:
	mov       ebx,offset $mkdkfcia
	jmp       short @44
	?debug L 315
?live16389@16: ; EBX = &$mkdkfcia
@43:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@44:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @43
	cmp       dword ptr [ebx],0
	jne       short @43
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
	jmp       short @47
@46:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@47:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @50
	cmp       dword ptr [ebx],0
@50:
	je        short @48
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @51
	cmp       eax,dword ptr [ebp-20]
@51:
	setne     cl
	and       ecx,1
	jmp       short @49
@48:
	xor       ecx,ecx
@49:
	test      cl,cl
	jne       short @46
	?debug L 316
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 317
	mov       eax,dword ptr [ebp-32]
	mov       dword ptr [_tsc_STARTED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_STARTED+4],eax
	?debug L 318
	mov       edx,dword ptr [ebp-32]
	mov       dword ptr [_tsc_LAST_MEASURED],edx
	mov       edx,dword ptr [ebp-28]
	mov       dword ptr [_tsc_LAST_MEASURED+4],edx
	?debug L 319
	mov       dword ptr [_tsc_PAUSED],0
	mov       dword ptr [_tsc_PAUSED+4],0
	mov       dword ptr [_tsc_ELAPSED],0
	mov       dword ptr [_tsc_ELAPSED+4],0
	?debug L 320
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 321
?live16389@112: ; 
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	?debug L 322
@53:
@52:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@41:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_start$qv+0
	dd        @41+0
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
	dd	?patch17
	dd	?patch18
	dd	?patch19
	df	@@stk@cpu@tsc_start$qv
	dw	0
	dw	4105
	dw	0
	dw	24
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
	dw	25
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mkdkfcia
	dw	0
	dw	4102
	dw	0
	dw	26
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	27
	dw	0
	dw	0
	dw	0
?patch17	equ	@53-@@stk@cpu@tsc_start$qv+49
?patch18	equ	0
?patch19	equ	@53-@@stk@cpu@tsc_start$qv
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
$eodkfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_checkpoint$qv	segment virtual
	align	2
@@stk@cpu@tsc_checkpoint$qv	proc	near
?live16390@0:
	?debug L 325
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-52
	push      ebx
	mov       dword ptr [ebp-8],offset @54
@55:
	mov       ebx,offset $eodkfcia
	jmp       short @57
	?debug L 328
?live16390@16: ; EBX = &$eodkfcia
@56:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@57:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @56
	cmp       dword ptr [ebx],0
	jne       short @56
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
	jmp       short @60
@59:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@60:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @63
	cmp       dword ptr [ebx],0
@63:
	je        short @61
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @64
	cmp       eax,dword ptr [ebp-20]
@64:
	setne     cl
	and       ecx,1
	jmp       short @62
@61:
	xor       ecx,ecx
@62:
	test      cl,cl
	jne       short @59
	?debug L 329
	mov       eax,dword ptr [_tsc_PAUSED]
	mov       dword ptr [ebp-32],eax
	mov       eax,dword ptr [_tsc_PAUSED+4]
	mov       dword ptr [ebp-28],eax
	?debug L 332
	cmp       dword ptr [ebp-28],0
	jne       short @65
	cmp       dword ptr [ebp-32],0
	jne       short @65
	?debug L 333
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 335
@65:
	mov       eax,dword ptr [_tsc_STARTED]
	mov       edx,dword ptr [_tsc_STARTED+4]
	sub       eax,dword ptr [_tsc_ADJ]
	sbb       edx,dword ptr [_tsc_ADJ+4]
	mov       dword ptr [ebp-44],eax
	mov       dword ptr [ebp-40],edx
	?debug L 336
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	cmp       edx,dword ptr [ebp-40]
	jne       short @68
	cmp       eax,dword ptr [ebp-44]
@68:
	jbe       short @67
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	sub       eax,dword ptr [ebp-44]
	sbb       edx,dword ptr [ebp-40]
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	jmp       short @69
	?debug L 338
@67:
	mov       dword ptr [ebp-56],0
	mov       dword ptr [ebp-52],0
	?debug L 340
@69:
	mov       eax,dword ptr [ebp-32]
	mov       dword ptr [_tsc_LAST_MEASURED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_LAST_MEASURED+4],eax
	?debug L 341
	mov       edx,dword ptr [ebp-56]
	mov       dword ptr [_tsc_ELAPSED],edx
	mov       edx,dword ptr [ebp-52]
	mov       dword ptr [_tsc_ELAPSED+4],edx
	?debug L 342
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 343
?live16390@176: ; 
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	?debug L 344
@71:
@70:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@54:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_checkpoint$qv+0
	dd        @54+0
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
	dd	?patch20
	dd	?patch21
	dd	?patch22
	df	@@stk@cpu@tsc_checkpoint$qv
	dw	0
	dw	4107
	dw	0
	dw	28
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
	dw	29
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	119
	dw	0
	dw	30
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65504
	dw	65535
	dw	119
	dw	0
	dw	31
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eodkfcia
	dw	0
	dw	4102
	dw	0
	dw	32
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	33
	dw	0
	dw	0
	dw	0
?patch20	equ	@71-@@stk@cpu@tsc_checkpoint$qv+67
?patch21	equ	0
?patch22	equ	@71-@@stk@cpu@tsc_checkpoint$qv
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
?live16391@0:
	?debug L 347
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @72
	?debug L 349
@73:
	mov       eax,dword ptr [_tsc_ELAPSED]
	mov       edx,dword ptr [_tsc_ELAPSED+4]
	?debug L 350
@75:
@74:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@72:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_elapsed$qv+0
	dd        @72+0
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
	dd	?patch23
	dd	?patch24
	dd	?patch25
	df	@@stk@cpu@tsc_elapsed$qv
	dw	0
	dw	4109
	dw	0
	dw	34
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
?patch23	equ	@75-@@stk@cpu@tsc_elapsed$qv+32
?patch24	equ	0
?patch25	equ	@75-@@stk@cpu@tsc_elapsed$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mbekfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_pause$qv	segment virtual
	align	2
@@stk@cpu@tsc_pause$qv	proc	near
?live16392@0:
	?debug L 353
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-28
	push      ebx
	mov       dword ptr [ebp-8],offset @76
@77:
	mov       ebx,offset $mbekfcia
	jmp       short @79
	?debug L 356
?live16392@16: ; EBX = &$mbekfcia
@78:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@79:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @78
	cmp       dword ptr [ebx],0
	jne       short @78
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
	jmp       short @82
@81:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@82:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @85
	cmp       dword ptr [ebx],0
@85:
	je        short @83
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @86
	cmp       eax,dword ptr [ebp-20]
@86:
	setne     cl
	and       ecx,1
	jmp       short @84
@83:
	xor       ecx,ecx
@84:
	test      cl,cl
	jne       short @81
	?debug L 357
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 358
	mov       eax,dword ptr [ebp-32]
	mov       dword ptr [_tsc_PAUSED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_PAUSED+4],eax
	?debug L 359
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 360
?live16392@80: ; 
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	?debug L 361
@88:
@87:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@76:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_pause$qv+0
	dd        @76+0
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
	dd	?patch26
	dd	?patch27
	dd	?patch28
	df	@@stk@cpu@tsc_pause$qv
	dw	0
	dw	4111
	dw	0
	dw	35
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
	dw	36
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mbekfcia
	dw	0
	dw	4102
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
?patch26	equ	@88-@@stk@cpu@tsc_pause$qv+51
?patch27	equ	0
?patch28	equ	@88-@@stk@cpu@tsc_pause$qv
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
$efekfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_resume$qv	segment virtual
	align	2
@@stk@cpu@tsc_resume$qv	proc	near
?live16393@0:
	?debug L 364
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-64
	push      ebx
	mov       dword ptr [ebp-8],offset @89
@90:
	mov       ebx,offset $efekfcia
	jmp       short @92
	?debug L 367
?live16393@16: ; EBX = &$efekfcia
@91:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@92:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @91
	cmp       dword ptr [ebx],0
	jne       short @91
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
	jmp       short @95
@94:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@95:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @98
	cmp       dword ptr [ebx],0
@98:
	je        short @96
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @99
	cmp       eax,dword ptr [ebp-20]
@99:
	setne     cl
	and       ecx,1
	jmp       short @97
@96:
	xor       ecx,ecx
@97:
	test      cl,cl
	jne       short @94
	?debug L 368
	mov       eax,dword ptr [_tsc_STARTED]
	mov       dword ptr [ebp-32],eax
	mov       eax,dword ptr [_tsc_STARTED+4]
	mov       dword ptr [ebp-28],eax
	?debug L 369
	mov       edx,dword ptr [_tsc_PAUSED]
	mov       dword ptr [ebp-44],edx
	mov       edx,dword ptr [_tsc_PAUSED+4]
	mov       dword ptr [ebp-40],edx
	?debug L 370
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	?debug L 371
	mov       eax,dword ptr [ebp-56]
	mov       edx,dword ptr [ebp-52]
	sub       eax,dword ptr [ebp-44]
	sbb       edx,dword ptr [ebp-40]
	add       eax,dword ptr [ebp-32]
	adc       edx,dword ptr [ebp-28]
	mov       dword ptr [ebp-68],eax
	mov       dword ptr [ebp-64],edx
	?debug L 372
	mov       eax,dword ptr [ebp-68]
	mov       dword ptr [_tsc_STARTED],eax
	mov       eax,dword ptr [ebp-64]
	mov       dword ptr [_tsc_STARTED+4],eax
	mov       dword ptr [_tsc_PAUSED],0
	mov       dword ptr [_tsc_PAUSED+4],0
	?debug L 373
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 374
?live16393@128: ; 
	mov       eax,dword ptr [ebp-56]
	mov       edx,dword ptr [ebp-52]
	?debug L 375
@101:
@100:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@89:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_resume$qv+0
	dd        @89+0
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
	dd	?patch29
	dd	?patch30
	dd	?patch31
	df	@@stk@cpu@tsc_resume$qv
	dw	0
	dw	4113
	dw	0
	dw	39
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
	dw	40
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65480
	dw	65535
	dw	119
	dw	0
	dw	41
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	119
	dw	0
	dw	42
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65504
	dw	65535
	dw	119
	dw	0
	dw	43
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$efekfcia
	dw	0
	dw	4102
	dw	0
	dw	44
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	45
	dw	0
	dw	0
	dw	0
?patch29	equ	@101-@@stk@cpu@tsc_resume$qv+75
?patch30	equ	0
?patch31	equ	@101-@@stk@cpu@tsc_resume$qv
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
$miekfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_start_paused$qv	segment virtual
	align	2
@@stk@cpu@tsc_start_paused$qv	proc	near
?live16394@0:
	?debug L 378
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-28
	push      ebx
	mov       dword ptr [ebp-8],offset @102
@103:
	mov       ebx,offset $miekfcia
	jmp       short @105
	?debug L 381
?live16394@16: ; EBX = &$miekfcia
@104:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@105:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @104
	cmp       dword ptr [ebx],0
	jne       short @104
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
	jmp       short @108
@107:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@108:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @111
	cmp       dword ptr [ebx],0
@111:
	je        short @109
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
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
	?debug L 382
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 383
	mov       eax,dword ptr [ebp-32]
	mov       dword ptr [_tsc_LAST_MEASURED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_LAST_MEASURED+4],eax
	?debug L 384
	mov       edx,dword ptr [ebp-32]
	mov       dword ptr [_tsc_STARTED],edx
	mov       edx,dword ptr [ebp-28]
	mov       dword ptr [_tsc_STARTED+4],edx
	?debug L 385
	mov       dword ptr [_tsc_ELAPSED],0
	mov       dword ptr [_tsc_ELAPSED+4],0
	mov       eax,dword ptr [ebp-32]
	mov       dword ptr [_tsc_PAUSED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_PAUSED+4],eax
	?debug L 386
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 387
?live16394@112: ; 
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	?debug L 388
@114:
@113:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@102:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_start_paused$qv+0
	dd        @102+0
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
	dd	?patch32
	dd	?patch33
	dd	?patch34
	df	@@stk@cpu@tsc_start_paused$qv
	dw	0
	dw	4115
	dw	0
	dw	46
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
	dw	47
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$miekfcia
	dw	0
	dw	4102
	dw	0
	dw	48
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	49
	dw	0
	dw	0
	dw	0
?patch32	equ	@114-@@stk@cpu@tsc_start_paused$qv+51
?patch33	equ	0
?patch34	equ	@114-@@stk@cpu@tsc_start_paused$qv
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
?live16395@0:
	?debug L 391
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @115
	?debug L 417
@116:
	mov	 eax,dword ptr [ebp+24]
	?debug L 418
	mov	 ecx,dword ptr [ebp+28]
	?debug L 419
	and	 eax,080000000H
	?debug L 420
	cpuid	
	?debug L 421
	mov	 ESI,dword ptr [ebp+8]
	?debug L 422
	mov	 [ESI],eax
	?debug L 423
	mov	 ESI,dword ptr [ebp+12]
	?debug L 424
	mov	 [ESI],ebx
	?debug L 425
	mov	 ESI,dword ptr [ebp+16]
	?debug L 426
	mov	 [ESI],ecx
	?debug L 427
	mov	 ESI,dword ptr [ebp+20]
	?debug L 428
	mov	 [ESI],edx
	?debug L 438
	mov       eax,dword ptr [ebp+8]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [eax]
	?debug L 440
@118:
@117:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@115:
	db        67,71,83,0
	dd        @@stk@cpu@cpuid$qpuit1t1t1uiui+0
	dd        @115+0
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
	dd	?patch35
	dd	?patch36
	dd	?patch37
	df	@@stk@cpu@cpuid$qpuit1t1t1uiui
	dw	0
	dw	4117
	dw	0
	dw	50
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
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	57
	dw	0
	dw	0
	dw	0
?patch35	equ	@118-@@stk@cpu@cpuid$qpuit1t1t1uiui+83
?patch36	equ	0
?patch37	equ	@118-@@stk@cpu@cpuid$qpuit1t1t1uiui
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
$emekfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$mpekfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$edfkfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$mgfkfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$ekfkfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mnfkfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ebgkfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpuidex$qpuit1t1t1uiui	segment virtual
	align	2
@@stk@cpu@cpuidex$qpuit1t1t1uiui	proc	near
?live16396@0:
	?debug L 443
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-16
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @119
@120:
	jmp       short @122
	?debug L 453
@121:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@122:
	cmp       dword ptr [$ebgkfcia+4],0
	jne       short @121
	cmp       dword ptr [$ebgkfcia],0
@123:
	jne       short @121
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [$ebgkfcia],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [$ebgkfcia+4],eax
	jmp       short @125
@124:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@125:
	cmp       dword ptr [$ebgkfcia+4],0
	jne       short @128
	cmp       dword ptr [$ebgkfcia],0
@128:
	je        short @126
	mov       eax,dword ptr [$ebgkfcia]
	mov       edx,dword ptr [$ebgkfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @129
	cmp       eax,dword ptr [ebp-20]
@129:
	setne     cl
	and       ecx,1
	jmp       short @127
@126:
	xor       ecx,ecx
@127:
	test      cl,cl
	jne       short @124
	?debug L 454
	mov       eax,dword ptr [ebp+24]
	cmp       eax,dword ptr [$ekfkfcia]
	jne       short @130
	mov       edx,dword ptr [ebp+28]
	cmp       edx,dword ptr [$mnfkfcia]
	jne       short @130
	?debug L 455
	mov       eax,dword ptr [ebp+8]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$emekfcia]
	mov       dword ptr [eax],edx
	?debug L 456
	mov       ecx,dword ptr [ebp+12]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [$mpekfcia]
	mov       dword ptr [ecx],eax
	?debug L 457
	mov       edx,dword ptr [ebp+16]
	push      4
	push      edx
	push      0
	call      _CG_DA_EPY
	mov       ecx,dword ptr [$edfkfcia]
	mov       dword ptr [edx],ecx
	?debug L 458
	mov       eax,dword ptr [ebp+20]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$mgfkfcia]
	mov       dword ptr [eax],edx
	?debug L 459
@131:
	mov       eax,dword ptr [$emekfcia]
	?debug L 460
?live16396@128: ; EAX = ret
	mov       dword ptr [$ebgkfcia],0
	mov       dword ptr [$ebgkfcia+4],0
	?debug L 461
	jmp       @132
	?debug L 462
?live16396@160: ; 
@133:
	jmp       short @134
	?debug L 464
@130:
	mov       edx,dword ptr [ebp+24]
	?debug L 465
	mov       ecx,dword ptr [ebp+28]
	?debug L 464
	mov       dword ptr [$ekfkfcia],edx
	?debug L 465
	mov       dword ptr [$mnfkfcia],ecx
	?debug L 610
@134:
	pushfd	
	?debug L 611
	push	 eax
	?debug L 612
	push	 ebx
	?debug L 613
	push	 ecx
	?debug L 614
	push	 edx
	?debug L 615
	push	 esi
	?debug L 616
	push	 edi
	?debug L 617
	mov	 edi,dword ptr [ebp+24]
	?debug L 618
	mov	 eax,edi
	?debug L 619
	and	 eax,080000000H
	?debug L 620
	cpuid	
	?debug L 621
	mov	        esi,eax
	?debug L 622
	xor	        eax,eax
	?debug L 623
	xor	        ebx,ebx
	?debug L 624
	xor	        ecx,ecx
	?debug L 625
	xor	        edx,edx
	?debug L 626
	cmp	        esi,edi
	?debug L 627
	jb        short @135
	?debug L 628
	mov	        eax,edi
	?debug L 629
	mov	        edi,dword ptr [ebp+28]
	?debug L 630
	mov	        ecx,edi
	?debug L 631
	cpuid	
	?debug L 632
@135:
cpuid_save_result:
	?debug L 633
	mov	 dword ptr $emekfcia,eax
	?debug L 634
	mov	 dword ptr $mpekfcia,ebx
	?debug L 635
	mov	 dword ptr $edfkfcia,ecx
	?debug L 636
	mov	 dword ptr $mgfkfcia,edx
	?debug L 637
	pop	 edi
	?debug L 638
	pop	 esi
	?debug L 639
	pop	 edx
	?debug L 640
	pop	 ecx
	?debug L 641
	pop	 ebx
	?debug L 642
	pop	 eax
	?debug L 643
	popfd	
	?debug L 650
	mov       eax,dword ptr [ebp+8]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$emekfcia]
	mov       dword ptr [eax],edx
	?debug L 651
	mov       ecx,dword ptr [ebp+12]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [$mpekfcia]
	mov       dword ptr [ecx],eax
	?debug L 652
	mov       edx,dword ptr [ebp+16]
	push      4
	push      edx
	push      0
	call      _CG_DA_EPY
	mov       ecx,dword ptr [$edfkfcia]
	mov       dword ptr [edx],ecx
	?debug L 653
	mov       eax,dword ptr [ebp+20]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$mgfkfcia]
	mov       dword ptr [eax],edx
	?debug L 671
	mov       ecx,dword ptr [ebp+8]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [ecx]
	?debug L 672
?live16396@864: ; EAX = ret
	mov       dword ptr [$ebgkfcia],0
	mov       dword ptr [$ebgkfcia+4],0
	?debug L 674
?live16396@880: ; 
@136:
@132:
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@119:
	db        67,71,83,0
	dd        @@stk@cpu@cpuidex$qpuit1t1t1uiui+0
	dd        @119+0
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
	dd	?patch38
	dd	?patch39
	dd	?patch40
	df	@@stk@cpu@cpuidex$qpuit1t1t1uiui
	dw	0
	dw	4119
	dw	0
	dw	58
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
	dw	59
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	12
	dw	0
	dw	1141
	dw	0
	dw	60
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	16
	dw	0
	dw	1141
	dw	0
	dw	61
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	20
	dw	0
	dw	1141
	dw	0
	dw	62
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	24
	dw	0
	dw	117
	dw	0
	dw	63
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	28
	dw	0
	dw	117
	dw	0
	dw	64
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	65
	dw	0
	dw	0
	dw	0
	dw	?patch41
	dw	529
	dw	?patch42
	dd	?live16396@864-@@stk@cpu@cpuidex$qpuit1t1t1uiui
	dd	?live16396@880-?live16396@864
	dw	17
?patch42	equ	1
?patch41	equ	14
	dw	22
	dw	513
	df	$ebgkfcia
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
	df	$mnfkfcia
	dw	0
	dw	117
	dw	0
	dw	68
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ekfkfcia
	dw	0
	dw	117
	dw	0
	dw	69
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mgfkfcia
	dw	0
	dw	117
	dw	0
	dw	70
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$edfkfcia
	dw	0
	dw	117
	dw	0
	dw	71
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mpekfcia
	dw	0
	dw	117
	dw	0
	dw	72
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$emekfcia
	dw	0
	dw	117
	dw	0
	dw	73
	dw	0
	dw	0
	dw	0
	dw	24
	dw	519
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch43
	df	@131
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	74
	dw	0
	dw	0
	dw	0
	dw	?patch44
	dw	529
	dw	?patch45
	dd	?live16396@128-@@stk@cpu@cpuidex$qpuit1t1t1uiui
	dd	?live16396@160-?live16396@128
	dw	17
?patch45	equ	1
?patch44	equ	14
?patch43	equ	@133-@131
	dw	2
	dw	6
?patch38	equ	@136-@@stk@cpu@cpuidex$qpuit1t1t1uiui+91
?patch39	equ	0
?patch40	equ	@136-@@stk@cpu@cpuidex$qpuit1t1t1uiui
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
$megkfcia	label	dword
	dd	0
	dd	0
	dd	0
	dd	0
	db	1	dup(?)
	align	4
$eigkfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_vendor$qv	segment virtual
	align	2
@@stk@cpu@cpu_vendor$qv	proc	near
?live16397@0:
	?debug L 677
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-16
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @137
@138:
	mov       ebx,offset $eigkfcia
	mov       esi,offset $megkfcia
	jmp       short @140
	?debug L 684
?live16397@16: ; EBX = &$eigkfcia, ESI = &$megkfcia
@139:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@140:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @139
	cmp       dword ptr [ebx],0
	jne       short @139
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
	jmp       short @143
@142:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@143:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @146
	cmp       dword ptr [ebx],0
@146:
	je        short @144
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @147
	cmp       eax,dword ptr [ebp-20]
@147:
	setne     cl
	and       ecx,1
	jmp       short @145
@144:
	xor       ecx,ecx
@145:
	test      cl,cl
	jne       short @142
	?debug L 685
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
	?debug L 686
	push      4
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi],0
	je        short @148
	?debug L 687
	push      4
	push      esi
	push      12
	call      _CG_DA_EPY
	xor       edx,edx
	mov       dword ptr [esi+12],edx
	?debug L 689
@148:
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 690
?live16397@96: ; ESI = &$megkfcia
	mov       eax,esi
	?debug L 689
?live16397@112: ; EBX = &$eigkfcia, ESI = &$megkfcia
	mov       dword ptr [ebx+4],0
	?debug L 691
?live16397@128: ; 
@150:
@149:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@137:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_vendor$qv+0
	dd        @137+0
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
	dd	?patch46
	dd	?patch47
	dd	?patch48
	df	@@stk@cpu@cpu_vendor$qv
	dw	0
	dw	4121
	dw	0
	dw	75
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
	df	$eigkfcia
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
	df	$megkfcia
	dw	0
	dw	4123
	dw	0
	dw	78
	dw	0
	dw	0
	dw	0
?patch46	equ	@150-@@stk@cpu@cpu_vendor$qv+41
?patch47	equ	0
?patch48	equ	@150-@@stk@cpu@cpu_vendor$qv
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
$echkfcia	label	dword
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
$mfhkfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_name$qv	segment virtual
	align	2
@@stk@cpu@cpu_name$qv	proc	near
?live16398@0:
	?debug L 694
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @151
@152:
	mov       edi,offset $echkfcia
	?debug L 700
?live16398@16: ; EDI = &$echkfcia
	push      4
	push      edi
	call      _CG_D_EP
	cmp       dword ptr [edi],0
	je        short @156
	?debug L 701
	mov       eax,edi
	jmp       @154
	?debug L 703
@155:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@156:
	cmp       dword ptr [$mfhkfcia+4],0
	jne       short @155
	cmp       dword ptr [$mfhkfcia],0
	jne       short @155
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$mfhkfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$mfhkfcia+4],edx
	jmp       short @159
@158:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@159:
	cmp       dword ptr [$mfhkfcia+4],0
	jne       short @162
	cmp       dword ptr [$mfhkfcia],0
@162:
	je        short @160
	mov       eax,dword ptr [$mfhkfcia]
	mov       edx,dword ptr [$mfhkfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @163
	cmp       eax,dword ptr [ebp-20]
@163:
	setne     cl
	and       ecx,1
	jmp       short @161
@160:
	xor       ecx,ecx
@161:
	test      cl,cl
	jne       short @158
	?debug L 706
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
	jae       short @164
	?debug L 707
	mov       dword ptr [$mfhkfcia],0
	mov       dword ptr [$mfhkfcia+4],0
	?debug L 708
	push      12
	push      offset s@
	push      edi
	call      @@stk@mem@mov$qpvpxvxui
	jmp       @154
	?debug L 710
@164:
	mov       esi,-2147483646
	xor       ebx,ebx
	?debug L 712
?live16398@128: ; EBX = i, ESI = f, EDI = &$echkfcia
@165:
	lea       eax,dword ptr [ebx+3]
	push      0
	shl       eax,2
	push      esi
	add       eax,edi
	push      offset $echkfcia
	push      eax
	call      _CG_A_BP
	push      eax
	lea       edx,dword ptr [ebx+2]
	shl       edx,2
	add       edx,edi
	push      offset $echkfcia
	push      edx
	call      _CG_A_BP
	push      edx
	lea       ecx,dword ptr [ebx+1]
	shl       ecx,2
	add       ecx,edi
	push      offset $echkfcia
	push      ecx
	call      _CG_A_BP
	push      ecx
	mov       eax,ebx
	shl       eax,2
	add       eax,edi
	push      offset $echkfcia
	push      eax
	call      _CG_A_BP
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 710
	inc       esi
	add       ebx,4
	cmp       ebx,12
	jb        short @165
	?debug L 714
?live16398@160: ; EDI = &$echkfcia
	push      32
	push      edi
	call      @@stk@cstr@trim$qpcc
	?debug L 715
	mov       dword ptr [$mfhkfcia],0
	mov       dword ptr [$mfhkfcia+4],0
	?debug L 716
	mov       eax,edi
	?debug L 717
?live16398@208: ; 
@168:
@154:
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@151:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_name$qv+0
	dd        @151+0
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
	dd	?patch49
	dd	?patch50
	dd	?patch51
	df	@@stk@cpu@cpu_name$qv
	dw	0
	dw	4124
	dw	0
	dw	79
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
	dw	80
	dw	0
	dw	0
	dw	0
	dw	?patch52
	dw	529
	dw	?patch53
	dd	?live16398@128-@@stk@cpu@cpu_name$qv
	dd	?live16398@160-?live16398@128
	dw	20
?patch53	equ	1
?patch52	equ	14
	dw	16
	dw	2
	dw	117
	dw	0
	dw	23
	dw	81
	dw	0
	dw	0
	dw	0
	dw	?patch54
	dw	529
	dw	?patch55
	dd	?live16398@128-@@stk@cpu@cpu_name$qv
	dd	?live16398@160-?live16398@128
	dw	23
?patch55	equ	1
?patch54	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	82
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	83
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	84
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	85
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mfhkfcia
	dw	0
	dw	4102
	dw	0
	dw	86
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	87
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$echkfcia
	dw	0
	dw	4126
	dw	0
	dw	88
	dw	0
	dw	0
	dw	0
?patch49	equ	@168-@@stk@cpu@cpu_name$qv+75
?patch50	equ	0
?patch51	equ	@168-@@stk@cpu@cpu_name$qv
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
$mphkfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$edikfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_threads$qv	segment virtual
	align	2
@@stk@cpu@cpu_num_threads$qv	proc	near
?live16399@0:
	?debug L 720
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @169
@170:
	mov       ebx,offset $edikfcia
	?debug L 726
?live16399@16: ; EBX = &$edikfcia
	mov       eax,dword ptr [$mphkfcia]
	cmp       eax,-1
	jne       @172
	?debug L 727
?live16399@32: ; EAX = @temp4
	jmp       short @174
	?debug L 729
?live16399@48: ; EBX = &$edikfcia
@173:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@174:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @173
	cmp       dword ptr [ebx],0
	jne       short @173
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
	jmp       short @177
@176:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@177:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @180
	cmp       dword ptr [ebx],0
@180:
	je        short @178
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @181
	cmp       eax,dword ptr [ebp-20]
@181:
	setne     cl
	and       ecx,1
	jmp       short @179
@178:
	xor       ecx,ecx
@179:
	test      cl,cl
	jne       short @176
	?debug L 732
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
	?debug L 734
	mov       eax,dword ptr [ebp-44]
	?debug L 732
	add       esp,24
	?debug L 734
	shr       eax,16
	and       eax,255
	?debug L 736
?live16399@128: ; EBX = &$edikfcia, EAX = @temp3
	push      8
	?debug L 734
?live16399@144: ; EBX = &$edikfcia
	inc       eax
	?debug L 736
?live16399@160: ; EBX = &$edikfcia, EAX = @temp3
	push      ebx
	?debug L 734
?live16399@176: ; EBX = &$edikfcia
	mov       dword ptr [$mphkfcia],eax
	?debug L 736
?live16399@192: ; EBX = &$edikfcia, EAX = @temp3
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 738
?live16399@208: ; 
@182:
@172:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@169:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_num_threads$qv+0
	dd        @169+0
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
	dd	?patch56
	dd	?patch57
	dd	?patch58
	df	@@stk@cpu@cpu_num_threads$qv
	dw	0
	dw	4127
	dw	0
	dw	89
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
	dw	90
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	91
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	92
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	93
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	94
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$edikfcia
	dw	0
	dw	4102
	dw	0
	dw	95
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	96
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mphkfcia
	dw	0
	dw	117
	dw	0
	dw	97
	dw	0
	dw	0
	dw	0
?patch56	equ	@182-@@stk@cpu@cpu_num_threads$qv+75
?patch57	equ	0
?patch58	equ	@182-@@stk@cpu@cpu_num_threads$qv
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
$mgikfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ekikfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_cores$qv	segment virtual
	align	2
@@stk@cpu@cpu_num_cores$qv	proc	near
?live16400@0:
	?debug L 741
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @183
@184:
	mov       ebx,offset $ekikfcia
	?debug L 747
?live16400@16: ; EBX = &$ekikfcia
	mov       eax,dword ptr [$mgikfcia]
	cmp       eax,-1
	jne       @186
	?debug L 748
?live16400@32: ; EAX = @temp3
	jmp       short @188
	?debug L 750
?live16400@48: ; EBX = &$ekikfcia
@187:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@188:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @187
	cmp       dword ptr [ebx],0
	jne       short @187
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
	jmp       short @191
@190:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@191:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @194
	cmp       dword ptr [ebx],0
@194:
	je        short @192
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @195
	cmp       eax,dword ptr [ebp-20]
@195:
	setne     cl
	and       ecx,1
	jmp       short @193
@192:
	xor       ecx,ecx
@193:
	test      cl,cl
	jne       short @190
	?debug L 753
	push      12
	push      offset s@+13
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       short @196
	cmp       eax,0
	jne       short @196
	?debug L 755
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
	?debug L 756
	mov       ecx,dword ptr [ebp-52]
	shr       ecx,26
	and       ecx,63
	inc       ecx
	mov       dword ptr [$mgikfcia],ecx
	?debug L 758
	jmp       short @198
	?debug L 760
@196:
	push      12
	push      offset s@+26
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       short @199
	cmp       eax,0
	jne       short @199
	?debug L 762
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
	?debug L 763
	mov       edx,dword ptr [ebp-36]
	and       edx,255
	inc       edx
	mov       dword ptr [$mgikfcia],edx
	?debug L 765
	jmp       short @198
	?debug L 766
@199:
	call      @@stk@cpu@cpu_num_threads$qv
	mov       dword ptr [$mgikfcia],eax
	?debug L 767
@198:
	mov       eax,dword ptr [$mgikfcia]
	?debug L 768
?live16400@224: ; EBX = &$ekikfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 771
?live16400@240: ; 
@201:
@186:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@183:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_num_cores$qv+0
	dd        @183+0
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
	dd	?patch59
	dd	?patch60
	dd	?patch61
	df	@@stk@cpu@cpu_num_cores$qv
	dw	0
	dw	4129
	dw	0
	dw	98
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
	dw	99
	dw	0
	dw	0
	dw	0
	dw	?patch62
	dw	529
	dw	?patch63
	dd	?live16400@224-@@stk@cpu@cpu_num_cores$qv
	dd	?live16400@240-?live16400@224
	dw	17
?patch63	equ	1
?patch62	equ	14
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
	df	$ekikfcia
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
	df	$mgikfcia
	dw	0
	dw	117
	dw	0
	dw	106
	dw	0
	dw	0
	dw	0
?patch59	equ	@201-@@stk@cpu@cpu_num_cores$qv+74
?patch60	equ	0
?patch61	equ	@201-@@stk@cpu@cpu_num_cores$qv
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
$mnikfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ebjkfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_cache_size$quc	segment virtual
	align	2
@@stk@cpu@cpu_cache_size$quc	proc	near
?live16401@0:
	?debug L 772
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @202
@203:
	mov       ebx,dword ptr [ebp+8]
	mov       esi,offset $ebjkfcia
	mov       edi,offset $mnikfcia
	?debug L 778
?live16401@16: ; EBX = a_level, ESI = &$ebjkfcia, EDI = &$mnikfcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       eax,dword ptr [edi]
	cmp       eax,-1
	jne       @205
	?debug L 779
?live16401@32: ; EAX = @temp5, EDI = &$mnikfcia
	jmp       short @207
	?debug L 781
?live16401@48: ; EBX = a_level, ESI = &$ebjkfcia, EDI = &$mnikfcia
@206:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@207:
	push      8
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi+4],0
	jne       short @206
	cmp       dword ptr [esi],0
	jne       short @206
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
	jmp       short @210
@209:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@210:
	push      8
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi+4],0
	jne       short @213
	cmp       dword ptr [esi],0
@213:
	je        short @211
	push      8
	push      esi
	call      _CG_D_EP
	mov       eax,dword ptr [esi]
	mov       edx,dword ptr [esi+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @214
	cmp       eax,dword ptr [ebp-20]
@214:
	setne     cl
	and       ecx,1
	jmp       short @212
@211:
	xor       ecx,ecx
@212:
	test      cl,cl
	jne       short @209
	?debug L 784
	push      12
	push      offset s@+13
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       @215
	cmp       eax,0
	jne       @215
	?debug L 785
	cmp       bl,2
	jne       @217
	?debug L 786
?live16401@96: ; ESI = &$ebjkfcia, EDI = &$mnikfcia
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
	?debug L 787
	mov       eax,dword ptr [ebp-28]
	and       eax,255
	cmp       eax,64
	jne       short @218
	?debug L 788
	push      4
	push      edi
	call      _CG_D_EP
	xor       edx,edx
	mov       dword ptr [edi],edx
	jmp       @219
	?debug L 790
?live16401@144: ; ESI = &$ebjkfcia, EAX = @temp4, EDI = &$mnikfcia
@218:
	cmp       eax,65
	jne       short @220
	?debug L 791
?live16401@160: ; ESI = &$ebjkfcia, EDI = &$mnikfcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],128
	jmp       @219
	?debug L 793
?live16401@176: ; ESI = &$ebjkfcia, EAX = @temp4, EDI = &$mnikfcia
@220:
	cmp       eax,66
	jne       short @221
	?debug L 794
?live16401@192: ; ESI = &$ebjkfcia, EDI = &$mnikfcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],256
	jmp       @219
	?debug L 796
?live16401@208: ; ESI = &$ebjkfcia, EAX = @temp4, EDI = &$mnikfcia
@221:
	cmp       eax,67
	jne       short @222
	?debug L 797
?live16401@224: ; ESI = &$ebjkfcia, EDI = &$mnikfcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],512
	jmp       @219
	?debug L 799
?live16401@240: ; ESI = &$ebjkfcia, EAX = @temp4, EDI = &$mnikfcia
@222:
	cmp       eax,68
	jne       short @223
	?debug L 800
?live16401@256: ; ESI = &$ebjkfcia, EDI = &$mnikfcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],1024
	jmp       @219
	?debug L 802
?live16401@272: ; ESI = &$ebjkfcia, EAX = @temp4, EDI = &$mnikfcia
@223:
	cmp       eax,69
	jne       short @224
	?debug L 803
?live16401@288: ; ESI = &$ebjkfcia, EDI = &$mnikfcia
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],2048
	jmp       @219
	?debug L 807
@224:
	push      4
	push      edi
	call      _CG_D_EP
	xor       ecx,ecx
	mov       dword ptr [edi],ecx
	?debug L 809
	jmp       @219
	?debug L 810
@217:
	push      4
	push      edi
	call      _CG_D_EP
	xor       eax,eax
	mov       dword ptr [edi],eax
	?debug L 811
	jmp       @219
	?debug L 813
?live16401@368: ; EBX = a_level, ESI = &$ebjkfcia, EDI = &$mnikfcia
@215:
	push      12
	push      offset s@+26
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       short @226
	cmp       eax,0
@226:
	jne       @227
	?debug L 814
	test      bl,bl
	jne       short @228
	?debug L 815
?live16401@400: ; ESI = &$ebjkfcia, EDI = &$mnikfcia
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
	?debug L 816
	mov       ecx,dword ptr [ebp-28]
	shr       ecx,24
	and       ecx,255
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],ecx
	?debug L 817
	jmp       @229
	?debug L 819
?live16401@448: ; EBX = a_level, ESI = &$ebjkfcia, EDI = &$mnikfcia
@228:
	cmp       bl,1
	jne       short @230
	?debug L 820
?live16401@464: ; ESI = &$ebjkfcia, EDI = &$mnikfcia
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
	?debug L 821
	mov       edx,dword ptr [ebp-36]
	shr       edx,24
	and       edx,255
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],edx
	?debug L 822
	jmp       short @229
	?debug L 824
?live16401@512: ; EBX = a_level, ESI = &$ebjkfcia, EDI = &$mnikfcia
@230:
	cmp       bl,2
	jne       short @231
	?debug L 825
?live16401@528: ; ESI = &$ebjkfcia, EDI = &$mnikfcia
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
	?debug L 826
	mov       eax,dword ptr [ebp-36]
	shr       eax,16
	and       eax,65535
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],eax
	?debug L 827
	jmp       short @229
	?debug L 829
?live16401@576: ; EBX = a_level, ESI = &$ebjkfcia, EDI = &$mnikfcia
@231:
	cmp       bl,3
	jne       short @232
	?debug L 830
?live16401@592: ; ESI = &$ebjkfcia, EDI = &$mnikfcia
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
	?debug L 831
	mov       ecx,dword ptr [ebp-28]
	shr       ecx,18
	and       ecx,16383
	shl       ecx,9
	push      4
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],ecx
	?debug L 834
@232:
@229:
@227:
@219:
	push      4
	push      edi
	call      _CG_D_EP
	mov       eax,dword ptr [edi]
	?debug L 835
?live16401@640: ; ESI = &$ebjkfcia, EAX = ret
	push      8
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],0
	mov       dword ptr [esi+4],0
	?debug L 837
?live16401@656: ; 
@233:
@205:
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@202:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_cache_size$quc+0
	dd        @202+0
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
	dd	?patch64
	dd	?patch65
	dd	?patch66
	df	@@stk@cpu@cpu_cache_size$quc
	dw	0
	dw	4131
	dw	0
	dw	107
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
	dw	108
	dw	0
	dw	0
	dw	0
	dw	?patch67
	dw	529
	dw	?patch68
	dd	?live16401@16-@@stk@cpu@cpu_cache_size$quc
	dd	?live16401@32-?live16401@16
	dw	4
	dd	?live16401@48-@@stk@cpu@cpu_cache_size$quc
	dd	?live16401@96-?live16401@48
	dw	4
	dd	?live16401@368-@@stk@cpu@cpu_cache_size$quc
	dd	?live16401@400-?live16401@368
	dw	4
	dd	?live16401@448-@@stk@cpu@cpu_cache_size$quc
	dd	?live16401@464-?live16401@448
	dw	4
	dd	?live16401@512-@@stk@cpu@cpu_cache_size$quc
	dd	?live16401@528-?live16401@512
	dw	4
	dd	?live16401@576-@@stk@cpu@cpu_cache_size$quc
	dd	?live16401@592-?live16401@576
	dw	4
?patch68	equ	6
?patch67	equ	64
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	109
	dw	0
	dw	0
	dw	0
	dw	?patch69
	dw	529
	dw	?patch70
	dd	?live16401@640-@@stk@cpu@cpu_cache_size$quc
	dd	?live16401@656-?live16401@640
	dw	17
?patch70	equ	1
?patch69	equ	14
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
	df	$ebjkfcia
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
	df	$mnikfcia
	dw	0
	dw	117
	dw	0
	dw	116
	dw	0
	dw	0
	dw	0
?patch64	equ	@233-@@stk@cpu@cpu_cache_size$quc+76
?patch65	equ	0
?patch66	equ	@233-@@stk@cpu@cpu_cache_size$quc
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
$mejkfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eijkfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_cache_line_size$quc	segment virtual
	align	2
@@stk@cpu@cpu_cache_line_size$quc	proc	near
?live16402@0:
	?debug L 840
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @234
@235:
	mov       ebx,dword ptr [ebp+8]
	mov       esi,offset $eijkfcia
	?debug L 846
?live16402@16: ; ESI = &$eijkfcia, EBX = a_level
	mov       eax,dword ptr [$mejkfcia]
	cmp       eax,-1
	jne       @237
	?debug L 847
?live16402@32: ; EAX = @temp4
	jmp       short @239
	?debug L 849
?live16402@48: ; ESI = &$eijkfcia, EBX = a_level
@238:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@239:
	push      8
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi+4],0
	jne       short @238
	cmp       dword ptr [esi],0
	jne       short @238
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
	jmp       short @242
@241:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@242:
	push      8
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi+4],0
	jne       short @245
	cmp       dword ptr [esi],0
@245:
	je        short @243
	push      8
	push      esi
	call      _CG_D_EP
	mov       eax,dword ptr [esi]
	mov       edx,dword ptr [esi+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @246
	cmp       eax,dword ptr [ebp-20]
@246:
	setne     cl
	and       ecx,1
	jmp       short @244
@243:
	xor       ecx,ecx
@244:
	test      cl,cl
	jne       short @241
	?debug L 852
	push      12
	push      offset s@+13
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       short @247
	cmp       eax,0
	jne       short @247
	?debug L 853
?live16402@80: ; ESI = &$eijkfcia
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
	?debug L 854
	mov       ecx,dword ptr [ebp-44]
	and       ecx,4095
	inc       ecx
	mov       dword ptr [$mejkfcia],ecx
	?debug L 855
	jmp       @249
	?debug L 857
?live16402@128: ; ESI = &$eijkfcia, EBX = a_level
@247:
	push      12
	push      offset s@+26
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qpxvt1xui
	cmp       edx,0
	jne       @250
	cmp       eax,0
	jne       @250
	?debug L 858
	test      bl,bl
	jne       short @252
	?debug L 859
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
	?debug L 860
	mov       edx,dword ptr [ebp-28]
	and       edx,255
	mov       dword ptr [$mejkfcia],edx
	?debug L 862
@252:
	cmp       bl,1
	jne       short @253
	?debug L 863
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
	?debug L 864
	mov       eax,dword ptr [ebp-36]
	and       eax,255
	mov       dword ptr [$mejkfcia],eax
	?debug L 866
@253:
	cmp       bl,2
	jne       short @254
	?debug L 867
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
	?debug L 868
	mov       ecx,dword ptr [ebp-36]
	and       ecx,255
	mov       dword ptr [$mejkfcia],ecx
	?debug L 870
@254:
	cmp       bl,3
	jne       short @255
	?debug L 871
?live16402@304: ; ESI = &$eijkfcia
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
	?debug L 872
	mov       edx,dword ptr [ebp-28]
	and       edx,255
	mov       dword ptr [$mejkfcia],edx
	?debug L 875
@255:
@250:
@249:
	mov       eax,dword ptr [$mejkfcia]
	?debug L 876
?live16402@352: ; ESI = &$eijkfcia, EAX = ret
	push      8
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],0
	mov       dword ptr [esi+4],0
	?debug L 879
?live16402@368: ; 
@256:
@237:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@234:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_cache_line_size$quc+0
	dd        @234+0
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
	dd	?patch71
	dd	?patch72
	dd	?patch73
	df	@@stk@cpu@cpu_cache_line_size$quc
	dw	0
	dw	4133
	dw	0
	dw	117
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
	dw	118
	dw	0
	dw	0
	dw	0
	dw	?patch74
	dw	529
	dw	?patch75
	dd	?live16402@16-@@stk@cpu@cpu_cache_line_size$quc
	dd	?live16402@32-?live16402@16
	dw	4
	dd	?live16402@48-@@stk@cpu@cpu_cache_line_size$quc
	dd	?live16402@80-?live16402@48
	dw	4
	dd	?live16402@128-@@stk@cpu@cpu_cache_line_size$quc
	dd	?live16402@304-?live16402@128
	dw	4
?patch75	equ	3
?patch74	equ	34
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	119
	dw	0
	dw	0
	dw	0
	dw	?patch76
	dw	529
	dw	?patch77
	dd	?live16402@352-@@stk@cpu@cpu_cache_line_size$quc
	dd	?live16402@368-?live16402@352
	dw	17
?patch77	equ	1
?patch76	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	120
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	121
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	122
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	123
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eijkfcia
	dw	0
	dw	4102
	dw	0
	dw	124
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	125
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mejkfcia
	dw	0
	dw	117
	dw	0
	dw	126
	dw	0
	dw	0
	dw	0
?patch71	equ	@256-@@stk@cpu@cpu_cache_line_size$quc+73
?patch72	equ	0
?patch73	equ	@256-@@stk@cpu@cpu_cache_line_size$quc
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
$mljkfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$epjkfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_mhz$qo	segment virtual
	align	2
@@stk@cpu@cpu_num_mhz$qo	proc	near
?live16403@0:
	?debug L 882
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-168
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @257
	?debug L 888
@258:
	mov       eax,dword ptr [$mljkfcia]
	test      eax,eax
	je        short @262
	cmp       byte ptr [ebp+8],0
	je        @260
	?debug L 889
?live16403@32: ; EAX = @temp18
	jmp       short @262
	?debug L 891
?live16403@48: ; 
@261:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@262:
	cmp       dword ptr [$epjkfcia+4],0
	jne       short @261
	cmp       dword ptr [$epjkfcia],0
	jne       short @261
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$epjkfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$epjkfcia+4],edx
	jmp       short @265
@264:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@265:
	cmp       dword ptr [$epjkfcia+4],0
	jne       short @268
	cmp       dword ptr [$epjkfcia],0
@268:
	je        short @266
	mov       eax,dword ptr [$epjkfcia]
	mov       edx,dword ptr [$epjkfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @269
	cmp       eax,dword ptr [ebp-20]
@269:
	setne     cl
	and       ecx,1
	jmp       short @267
@266:
	xor       ecx,ecx
@267:
	test      cl,cl
	jne       short @264
	?debug L 904
	xor       ebx,ebx
	?debug L 905
?live16403@80: ; EBX = i
@270:
	call      @@stk@cpu@tsc_init$qv
	?debug L 906
	call      @@stk@cpu@tsc_start$qv
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-68],eax
	mov       dword ptr [ebp-64],edx
	call      @@stk@cpu@tsc_checkpoint$qv
	?debug L 907
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-128],eax
	mov       dword ptr [ebp-124],edx
	?debug L 908
@272:
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-80],eax
	mov       dword ptr [ebp-76],edx
	?debug L 909
	mov       eax,dword ptr [ebp-80]
	mov       edx,dword ptr [ebp-76]
	cmp       edx,dword ptr [ebp-64]
	jne       short @274
	cmp       eax,dword ptr [ebp-68]
@274:
	jbe       short @272
	?debug L 910
	call      @@stk@cpu@tsc_start$qv
	?debug L 911
@275:
	mov       edx,21
	?debug L 912
?live16403@192: ; EBX = i, EDX = trash1
@276:
	xor       eax,eax
@278:
	inc       eax
	cmp       eax,1000000
	jb        short @278
	?debug L 911
	dec       edx
	test      edx,edx
	ja        short @276
	?debug L 915
?live16403@224: ; EBX = i
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-92],eax
	mov       dword ptr [ebp-88],edx
	?debug L 916
@282:
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-104],eax
	mov       dword ptr [ebp-100],edx
	?debug L 917
	mov       eax,dword ptr [ebp-104]
	mov       edx,dword ptr [ebp-100]
	cmp       edx,dword ptr [ebp-88]
	jne       short @284
	cmp       eax,dword ptr [ebp-92]
@284:
	jbe       short @282
	?debug L 918
	call      @@stk@cpu@tsc_checkpoint$qv
	?debug L 919
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	?debug L 920
	mov       eax,dword ptr [ebp-104]
	mov       edx,dword ptr [ebp-100]
	sub       eax,dword ptr [ebp-80]
	sbb       edx,dword ptr [ebp-76]
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	?debug L 921
	mov       eax,dword ptr [ebp-116]
	mov       edx,dword ptr [ebp-112]
	sub       eax,dword ptr [ebp-128]
	sbb       edx,dword ptr [ebp-124]
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	?debug L 922
	push      0
	push      1000
	mov       eax,dword ptr [ebp-116]
	mov       edx,dword ptr [ebp-112]
	call      __llmul
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	?debug L 923
	cmp       dword ptr [ebp-52],0
	jne       short @286
	cmp       dword ptr [ebp-56],0
@286:
	je        short @285
	push      dword ptr [ebp-52]
	push      dword ptr [ebp-56]
	mov       eax,dword ptr [ebp-116]
	mov       edx,dword ptr [ebp-112]
	call      __lludiv
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	jmp       short @287
	?debug L 924
@285:
	mov       dword ptr [ebp-116],0
	mov       dword ptr [ebp-112],0
	?debug L 925
@287:
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
@288:
	inc       ebx
	cmp       ebx,5
	jb        @270
	?debug L 927
?live16403@400: ; 
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
	?debug L 928
?live16403@416: ; EBX = i, ECX = imax, ESI = imin
@290:
	push      8
	push      -172
	push      ebx
	push      3
	push      0
	call      _CG_LDA_EOXSY
	mov       eax,dword ptr [ebp+8*ebx-172]
	mov       edx,dword ptr [ebp+8*ebx-168]
	cmp       edx,dword ptr [ebp-28]
	jne       short @293
	cmp       eax,dword ptr [ebp-32]
@293:
	jbe       short @292
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
	?debug L 929
@292:
	push      8
	push      -172
	push      ebx
	push      3
	push      0
	call      _CG_LDA_EOXSY
	mov       eax,dword ptr [ebp+8*ebx-172]
	mov       edx,dword ptr [ebp+8*ebx-168]
	cmp       edx,dword ptr [ebp-40]
	jne       short @295
	cmp       eax,dword ptr [ebp-44]
@295:
	jae       short @294
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
@294:
	inc       ebx
	cmp       ebx,5
	jb        @290
	?debug L 931
?live16403@448: ; ECX = imax, ESI = imin
	mov       dword ptr [ebp-116],0
	mov       dword ptr [ebp-112],0
	xor       ebx,ebx
@297:
	cmp       esi,ebx
	je        short @299
	cmp       ecx,ebx
	je        short @299
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
@299:
	inc       ebx
	cmp       ebx,5
	jb        short @297
	?debug L 933
?live16403@464: ; 
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
	?debug L 934
	mov       eax,dword ptr [ebp-116]
	mov       ecx,eax
	mov       dword ptr [$mljkfcia],ecx
	?debug L 936
?live16403@496: ; ECX = @temp17
	mov       dword ptr [$epjkfcia],0
	mov       dword ptr [$epjkfcia+4],0
	?debug L 937
	mov       eax,ecx
	?debug L 938
?live16403@528: ; 
@301:
@260:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@257:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_num_mhz$qo+0
	dd        @257+0
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
	dd	?patch78
	dd	?patch79
	dd	?patch80
	df	@@stk@cpu@cpu_num_mhz$qo
	dw	0
	dw	4135
	dw	0
	dw	127
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
	dw	128
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65408
	dw	65535
	dw	119
	dw	0
	dw	129
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65420
	dw	65535
	dw	119
	dw	0
	dw	130
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65432
	dw	65535
	dw	119
	dw	0
	dw	131
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65444
	dw	65535
	dw	119
	dw	0
	dw	132
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65456
	dw	65535
	dw	119
	dw	0
	dw	133
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65468
	dw	65535
	dw	119
	dw	0
	dw	134
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65480
	dw	65535
	dw	119
	dw	0
	dw	135
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	20
	dw	136
	dw	0
	dw	0
	dw	0
	dw	?patch81
	dw	529
	dw	?patch82
	dd	?live16403@80-@@stk@cpu@cpu_num_mhz$qo
	dd	?live16403@400-?live16403@80
	dw	20
	dd	?live16403@416-@@stk@cpu@cpu_num_mhz$qo
	dd	?live16403@448-?live16403@416
	dw	20
?patch82	equ	2
?patch81	equ	24
	dw	16
	dw	2
	dw	117
	dw	0
	dw	23
	dw	137
	dw	0
	dw	0
	dw	0
	dw	?patch83
	dw	529
	dw	?patch84
	dd	?live16403@416-@@stk@cpu@cpu_num_mhz$qo
	dd	?live16403@464-?live16403@416
	dw	23
?patch84	equ	1
?patch83	equ	14
	dw	16
	dw	2
	dw	117
	dw	0
	dw	18
	dw	138
	dw	0
	dw	0
	dw	0
	dw	?patch85
	dw	529
	dw	?patch86
	dd	?live16403@416-@@stk@cpu@cpu_num_mhz$qo
	dd	?live16403@464-?live16403@416
	dw	18
?patch86	equ	1
?patch85	equ	14
	dw	18
	dw	512
	dw	65364
	dw	65535
	dw	4137
	dw	0
	dw	139
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	119
	dw	0
	dw	140
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65504
	dw	65535
	dw	119
	dw	0
	dw	141
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$epjkfcia
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
	df	$mljkfcia
	dw	0
	dw	117
	dw	0
	dw	144
	dw	0
	dw	0
	dw	0
	dw	24
	dw	519
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch87
	df	@275
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	145
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	19
	dw	146
	dw	0
	dw	0
	dw	0
	dw	?patch88
	dw	529
	dw	?patch89
	dd	?live16403@192-@@stk@cpu@cpu_num_mhz$qo
	dd	?live16403@224-?live16403@192
	dw	19
?patch89	equ	1
?patch88	equ	14
?patch87	equ	@288-@275
	dw	2
	dw	6
?patch78	equ	@301-@@stk@cpu@cpu_num_mhz$qo+131
?patch79	equ	0
?patch80	equ	@301-@@stk@cpu@cpu_num_mhz$qo
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
$ejkkfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mmkkfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_x87$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_x87$qv	proc	near
?live16404@0:
	?debug L 943
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @302
@303:
	mov       ebx,offset $mmkkfcia
	?debug L 949
?live16404@16: ; EBX = &$mmkkfcia
	mov       eax,dword ptr [$ejkkfcia]
	cmp       eax,-1
	je        short @307
	?debug L 950
?live16404@32: ; EAX = @temp2
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @305
	?debug L 952
?live16404@48: ; EBX = &$mmkkfcia
@306:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@307:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @306
	cmp       dword ptr [ebx],0
	jne       short @306
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
	jmp       short @310
@309:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@310:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @313
	cmp       dword ptr [ebx],0
@313:
	je        short @311
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @314
	cmp       eax,dword ptr [ebp-20]
@314:
	setne     al
	and       eax,1
	jmp       short @312
@311:
	xor       eax,eax
@312:
	test      al,al
	jne       short @309
	?debug L 955
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
	?debug L 957
	test      byte ptr [ebp-28],1
	je        short @315
	?debug L 958
	mov       dword ptr [$ejkkfcia],1
	?debug L 959
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 960
?live16404@128: ; 
	mov       al,1
	jmp       short @305
	?debug L 964
?live16404@144: ; EBX = &$mmkkfcia
@315:
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
	?debug L 966
	test      byte ptr [ebp-28],1
	je        short @316
	?debug L 967
	mov       dword ptr [$ejkkfcia],1
	?debug L 968
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 969
?live16404@208: ; 
	mov       al,1
	jmp       short @305
	?debug L 971
?live16404@224: ; EBX = &$mmkkfcia
@316:
	xor       edx,edx
	mov       dword ptr [$ejkkfcia],edx
	?debug L 972
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 973
?live16404@256: ; 
	xor       eax,eax
	?debug L 972
?live16404@272: ; EBX = &$mmkkfcia
	mov       dword ptr [ebx+4],0
	?debug L 974
?live16404@288: ; 
@317:
@305:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@302:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_x87$qv+0
	dd        @302+0
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
	dd	?patch90
	dd	?patch91
	dd	?patch92
	df	@@stk@cpu@cpu_has_x87$qv
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
	dw	148
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	149
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	150
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	151
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mmkkfcia
	dw	0
	dw	4102
	dw	0
	dw	152
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	153
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ejkkfcia
	dw	0
	dw	117
	dw	0
	dw	154
	dw	0
	dw	0
	dw	0
?patch90	equ	@317-@@stk@cpu@cpu_has_x87$qv+72
?patch91	equ	0
?patch92	equ	@317-@@stk@cpu@cpu_has_x87$qv
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
$ealkfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mdlkfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_mmx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mmx$qv	proc	near
?live16405@0:
	?debug L 977
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @318
@319:
	mov       ebx,offset $mdlkfcia
	?debug L 983
?live16405@16: ; EBX = &$mdlkfcia
	mov       eax,dword ptr [$ealkfcia]
	cmp       eax,-1
	je        short @323
	?debug L 984
?live16405@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @321
	?debug L 986
?live16405@48: ; EBX = &$mdlkfcia
@322:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@323:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @322
	cmp       dword ptr [ebx],0
	jne       short @322
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
	jmp       short @326
@325:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@326:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @329
	cmp       dword ptr [ebx],0
@329:
	je        short @327
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @330
	cmp       eax,dword ptr [ebp-20]
@330:
	setne     al
	and       eax,1
	jmp       short @328
@327:
	xor       eax,eax
@328:
	test      al,al
	jne       short @325
	?debug L 989
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
	?debug L 991
	mov       eax,dword ptr [ebp-28]
	and       eax,8388608
	mov       dword ptr [$ealkfcia],eax
	?debug L 992
?live16405@96: ; EBX = &$mdlkfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 993
?live16405@112: ; EBX = &$mdlkfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 995
?live16405@128: ; 
@331:
@321:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@318:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_mmx$qv+0
	dd        @318+0
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
	dd	?patch93
	dd	?patch94
	dd	?patch95
	df	@@stk@cpu@cpu_has_mmx$qv
	dw	0
	dw	4140
	dw	0
	dw	155
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
	dw	156
	dw	0
	dw	0
	dw	0
	dw	?patch96
	dw	529
	dw	?patch97
	dd	?live16405@112-@@stk@cpu@cpu_has_mmx$qv
	dd	?live16405@128-?live16405@112
	dw	1
?patch97	equ	1
?patch96	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	157
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	158
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	159
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	160
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mdlkfcia
	dw	0
	dw	4102
	dw	0
	dw	161
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	162
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ealkfcia
	dw	0
	dw	117
	dw	0
	dw	163
	dw	0
	dw	0
	dw	0
?patch93	equ	@331-@@stk@cpu@cpu_has_mmx$qv+72
?patch94	equ	0
?patch95	equ	@331-@@stk@cpu@cpu_has_mmx$qv
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
$ehlkfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mklkfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_mmxext$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mmxext$qv	proc	near
?live16406@0:
	?debug L 998
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @332
@333:
	mov       ebx,offset $mklkfcia
	?debug L 1004
?live16406@16: ; EBX = &$mklkfcia
	mov       eax,dword ptr [$ehlkfcia]
	cmp       eax,-1
	je        short @337
	?debug L 1005
?live16406@32: ; EAX = @temp5
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @335
	?debug L 1007
?live16406@48: ; EBX = &$mklkfcia
@336:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@337:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @336
	cmp       dword ptr [ebx],0
	jne       short @336
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
	jmp       short @340
@339:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@340:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @343
	cmp       dword ptr [ebx],0
@343:
	je        short @341
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @344
	cmp       eax,dword ptr [ebp-20]
@344:
	setne     al
	and       eax,1
	jmp       short @342
@341:
	xor       eax,eax
@342:
	test      al,al
	jne       short @339
	?debug L 1010
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
	?debug L 1012
	mov       eax,dword ptr [ebp-28]
	and       eax,4194304
	mov       dword ptr [$ehlkfcia],eax
	?debug L 1013
?live16406@96: ; EBX = &$mklkfcia, EAX = @temp3
	test      eax,eax
	je        short @345
	?debug L 1014
?live16406@112: ; 
	mov       al,1
	jmp       short @335
	?debug L 1016
?live16406@128: ; EBX = &$mklkfcia
@345:
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
	?debug L 1018
	mov       eax,dword ptr [ebp-28]
	and       eax,33554432
	mov       dword ptr [$ehlkfcia],eax
	?debug L 1019
?live16406@160: ; EBX = &$mklkfcia, EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1020
?live16406@176: ; EBX = &$mklkfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1022
?live16406@192: ; 
@346:
@335:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@332:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_mmxext$qv+0
	dd        @332+0
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
	dd	?patch98
	dd	?patch99
	dd	?patch100
	df	@@stk@cpu@cpu_has_mmxext$qv
	dw	0
	dw	4142
	dw	0
	dw	164
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
	dw	165
	dw	0
	dw	0
	dw	0
	dw	?patch101
	dw	529
	dw	?patch102
	dd	?live16406@176-@@stk@cpu@cpu_has_mmxext$qv
	dd	?live16406@192-?live16406@176
	dw	1
?patch102	equ	1
?patch101	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	166
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	167
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	168
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	169
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mklkfcia
	dw	0
	dw	4102
	dw	0
	dw	170
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	171
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ehlkfcia
	dw	0
	dw	117
	dw	0
	dw	172
	dw	0
	dw	0
	dw	0
?patch98	equ	@346-@@stk@cpu@cpu_has_mmxext$qv+72
?patch99	equ	0
?patch100	equ	@346-@@stk@cpu@cpu_has_mmxext$qv
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
$eolkfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mbmkfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_amd64$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_amd64$qv	proc	near
?live16407@0:
	?debug L 1025
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @347
@348:
	mov       ebx,offset $mbmkfcia
	?debug L 1031
?live16407@16: ; EBX = &$mbmkfcia
	mov       eax,dword ptr [$eolkfcia]
	cmp       eax,-1
	je        short @352
	?debug L 1032
?live16407@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @350
	?debug L 1034
?live16407@48: ; EBX = &$mbmkfcia
@351:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@352:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @351
	cmp       dword ptr [ebx],0
	jne       short @351
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
	jmp       short @355
@354:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@355:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @358
	cmp       dword ptr [ebx],0
@358:
	je        short @356
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @359
	cmp       eax,dword ptr [ebp-20]
@359:
	setne     al
	and       eax,1
	jmp       short @357
@356:
	xor       eax,eax
@357:
	test      al,al
	jne       short @354
	?debug L 1037
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
	?debug L 1039
	mov       eax,dword ptr [ebp-28]
	and       eax,536870912
	mov       dword ptr [$eolkfcia],eax
	?debug L 1040
?live16407@96: ; EBX = &$mbmkfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1041
?live16407@112: ; EBX = &$mbmkfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1043
?live16407@128: ; 
@360:
@350:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@347:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_amd64$qv+0
	dd        @347+0
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
	dd	?patch103
	dd	?patch104
	dd	?patch105
	df	@@stk@cpu@cpu_has_amd64$qv
	dw	0
	dw	4144
	dw	0
	dw	173
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
	dw	174
	dw	0
	dw	0
	dw	0
	dw	?patch106
	dw	529
	dw	?patch107
	dd	?live16407@112-@@stk@cpu@cpu_has_amd64$qv
	dd	?live16407@128-?live16407@112
	dw	1
?patch107	equ	1
?patch106	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	175
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	176
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	177
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	178
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mbmkfcia
	dw	0
	dw	4102
	dw	0
	dw	179
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	180
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eolkfcia
	dw	0
	dw	117
	dw	0
	dw	181
	dw	0
	dw	0
	dw	0
?patch103	equ	@360-@@stk@cpu@cpu_has_amd64$qv+73
?patch104	equ	0
?patch105	equ	@360-@@stk@cpu@cpu_has_amd64$qv
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
$efmkfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mimkfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_ht$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_ht$qv	proc	near
?live16408@0:
	?debug L 1046
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @361
@362:
	mov       ebx,offset $mimkfcia
	?debug L 1052
?live16408@16: ; EBX = &$mimkfcia
	mov       eax,dword ptr [$efmkfcia]
	cmp       eax,-1
	je        short @366
	?debug L 1053
?live16408@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @364
	?debug L 1055
?live16408@48: ; EBX = &$mimkfcia
@365:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@366:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @365
	cmp       dword ptr [ebx],0
	jne       short @365
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
	jmp       short @369
@368:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@369:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @372
	cmp       dword ptr [ebx],0
@372:
	je        short @370
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @373
	cmp       eax,dword ptr [ebp-20]
@373:
	setne     al
	and       eax,1
	jmp       short @371
@370:
	xor       eax,eax
@371:
	test      al,al
	jne       short @368
	?debug L 1058
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
	?debug L 1060
	mov       eax,dword ptr [ebp-28]
	and       eax,268435456
	mov       dword ptr [$efmkfcia],eax
	?debug L 1061
?live16408@96: ; EBX = &$mimkfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1062
?live16408@112: ; EBX = &$mimkfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1064
?live16408@128: ; 
@374:
@364:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@361:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_ht$qv+0
	dd        @361+0
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
	dd	?patch108
	dd	?patch109
	dd	?patch110
	df	@@stk@cpu@cpu_has_ht$qv
	dw	0
	dw	4146
	dw	0
	dw	182
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
	dw	183
	dw	0
	dw	0
	dw	0
	dw	?patch111
	dw	529
	dw	?patch112
	dd	?live16408@112-@@stk@cpu@cpu_has_ht$qv
	dd	?live16408@128-?live16408@112
	dw	1
?patch112	equ	1
?patch111	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	184
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	185
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	186
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	187
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mimkfcia
	dw	0
	dw	4102
	dw	0
	dw	188
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	189
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$efmkfcia
	dw	0
	dw	117
	dw	0
	dw	190
	dw	0
	dw	0
	dw	0
?patch108	equ	@374-@@stk@cpu@cpu_has_ht$qv+72
?patch109	equ	0
?patch110	equ	@374-@@stk@cpu@cpu_has_ht$qv
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
$emmkfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mpmkfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sse$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sse$qv	proc	near
?live16409@0:
	?debug L 1067
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @375
@376:
	mov       ebx,offset $mpmkfcia
	mov       esi,offset $emmkfcia
	?debug L 1073
?live16409@16: ; EBX = &$mpmkfcia, ESI = &$emmkfcia
	push      4
	push      esi
	call      _CG_D_EP
	mov       eax,dword ptr [esi]
	cmp       eax,-1
	jne       @378
	?debug L 1074
?live16409@32: ; EAX = @temp3, ESI = &$emmkfcia
	jmp       short @380
	?debug L 1076
?live16409@48: ; EBX = &$mpmkfcia, ESI = &$emmkfcia
@379:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@380:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @379
	cmp       dword ptr [ebx],0
	jne       short @379
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
	jmp       short @383
@382:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@383:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @386
	cmp       dword ptr [ebx],0
@386:
	je        short @384
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @387
	cmp       eax,dword ptr [ebp-20]
@387:
	setne     cl
	and       ecx,1
	jmp       short @385
@384:
	xor       ecx,ecx
@385:
	test      cl,cl
	jne       short @382
	?debug L 1079
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
	?debug L 1081
	test      byte ptr [ebp-34],16
	je        short @388
	?debug L 1082
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],42
	jmp       short @389
	?debug L 1084
@388:
	test      byte ptr [ebp-34],8
	je        short @390
	?debug L 1085
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],41
	jmp       short @389
	?debug L 1087
@390:
	test      byte ptr [ebp-35],2
	je        short @391
	?debug L 1088
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],31
	jmp       short @389
	?debug L 1090
@391:
	test      byte ptr [ebp-36],1
	je        short @392
	?debug L 1091
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],30
	jmp       short @389
	?debug L 1093
@392:
	test      byte ptr [ebp-25],4
	je        short @393
	?debug L 1094
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],20
	jmp       short @389
	?debug L 1096
@393:
	test      byte ptr [ebp-25],2
	je        short @394
	?debug L 1097
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],10
	jmp       short @389
	?debug L 1099
@394:
	push      4
	push      esi
	call      _CG_D_EP
	xor       ecx,ecx
	mov       dword ptr [esi],ecx
	?debug L 1100
@389:
	push      4
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi],0
	setne     al
	and       eax,1
	?debug L 1101
?live16409@304: ; EBX = &$mpmkfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1102
?live16409@320: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	?debug L 1101
?live16409@336: ; EBX = &$mpmkfcia, EAX = ret
	mov       dword ptr [ebx+4],0
	?debug L 1102
?live16409@352: ; EAX = ret
	mov       eax,edx
	?debug L 1103
?live16409@368: ; 
@395:
@378:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@375:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_sse$qv+0
	dd        @375+0
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
	dd	?patch113
	dd	?patch114
	dd	?patch115
	df	@@stk@cpu@cpu_has_sse$qv
	dw	0
	dw	4148
	dw	0
	dw	191
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
	dw	192
	dw	0
	dw	0
	dw	0
	dw	?patch116
	dw	529
	dw	?patch117
	dd	?live16409@304-@@stk@cpu@cpu_has_sse$qv
	dd	?live16409@368-?live16409@304
	dw	1
?patch117	equ	1
?patch116	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	193
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	194
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	195
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	196
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mpmkfcia
	dw	0
	dw	4102
	dw	0
	dw	197
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	198
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$emmkfcia
	dw	0
	dw	117
	dw	0
	dw	199
	dw	0
	dw	0
	dw	0
?patch113	equ	@395-@@stk@cpu@cpu_has_sse$qv+74
?patch114	equ	0
?patch115	equ	@395-@@stk@cpu@cpu_has_sse$qv
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
$ednkfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mgnkfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sse4a$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sse4a$qv	proc	near
?live16410@0:
	?debug L 1106
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @396
@397:
	mov       ebx,offset $mgnkfcia
	?debug L 1112
?live16410@16: ; EBX = &$mgnkfcia
	mov       eax,dword ptr [$ednkfcia]
	cmp       eax,-1
	je        short @401
	?debug L 1113
?live16410@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @399
	?debug L 1115
?live16410@48: ; EBX = &$mgnkfcia
@400:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@401:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @400
	cmp       dword ptr [ebx],0
	jne       short @400
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
	jmp       short @404
@403:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@404:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @407
	cmp       dword ptr [ebx],0
@407:
	je        short @405
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @408
	cmp       eax,dword ptr [ebp-20]
@408:
	setne     al
	and       eax,1
	jmp       short @406
@405:
	xor       eax,eax
@406:
	test      al,al
	jne       short @403
	?debug L 1118
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
	?debug L 1120
	mov       eax,dword ptr [ebp-36]
	and       eax,64
	mov       dword ptr [$ednkfcia],eax
	?debug L 1121
?live16410@96: ; EBX = &$mgnkfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1122
?live16410@112: ; EBX = &$mgnkfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1124
?live16410@128: ; 
@409:
@399:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@396:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_sse4a$qv+0
	dd        @396+0
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
	dd	?patch118
	dd	?patch119
	dd	?patch120
	df	@@stk@cpu@cpu_has_sse4a$qv
	dw	0
	dw	4150
	dw	0
	dw	200
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
	dw	201
	dw	0
	dw	0
	dw	0
	dw	?patch121
	dw	529
	dw	?patch122
	dd	?live16410@112-@@stk@cpu@cpu_has_sse4a$qv
	dd	?live16410@128-?live16410@112
	dw	1
?patch122	equ	1
?patch121	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	202
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	203
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	204
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	205
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mgnkfcia
	dw	0
	dw	4102
	dw	0
	dw	206
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	207
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ednkfcia
	dw	0
	dw	117
	dw	0
	dw	208
	dw	0
	dw	0
	dw	0
?patch118	equ	@409-@@stk@cpu@cpu_has_sse4a$qv+75
?patch119	equ	0
?patch120	equ	@409-@@stk@cpu@cpu_has_sse4a$qv
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
$eknkfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mnnkfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx$qv	proc	near
?live16411@0:
	?debug L 1127
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @410
@411:
	mov       ebx,offset $mnnkfcia
	?debug L 1133
?live16411@16: ; EBX = &$mnnkfcia
	mov       eax,dword ptr [$eknkfcia]
	cmp       eax,-1
	jne       @413
	?debug L 1134
?live16411@32: ; EAX = @temp3
	jmp       short @415
	?debug L 1136
?live16411@48: ; EBX = &$mnnkfcia
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
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],edx
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
	setne     cl
	and       ecx,1
	jmp       short @420
@419:
	xor       ecx,ecx
@420:
	test      cl,cl
	jne       short @417
	?debug L 1139
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
	?debug L 1141
	test      byte ptr [ebp-33],16
	je        short @423
	?debug L 1142
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
	?debug L 1143
	test      byte ptr [ebp-44],32
	je        short @424
	?debug L 1144
	mov       dword ptr [$eknkfcia],2
	jmp       short @425
	?debug L 1146
@424:
	mov       dword ptr [$eknkfcia],1
	?debug L 1147
	jmp       short @425
	?debug L 1149
@423:
	xor       eax,eax
	mov       dword ptr [$eknkfcia],eax
	?debug L 1151
@425:
	cmp       dword ptr [$eknkfcia],0
	setne     al
	and       eax,1
	?debug L 1152
?live16411@208: ; EBX = &$mnnkfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1153
?live16411@224: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	?debug L 1152
?live16411@240: ; EBX = &$mnnkfcia, EAX = ret
	mov       dword ptr [ebx+4],0
	?debug L 1153
?live16411@256: ; EAX = ret
	mov       eax,edx
	?debug L 1154
?live16411@272: ; 
@426:
@413:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@410:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx$qv+0
	dd        @410+0
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
	dd	?patch123
	dd	?patch124
	dd	?patch125
	df	@@stk@cpu@cpu_has_avx$qv
	dw	0
	dw	4152
	dw	0
	dw	209
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
	dw	210
	dw	0
	dw	0
	dw	0
	dw	?patch126
	dw	529
	dw	?patch127
	dd	?live16411@208-@@stk@cpu@cpu_has_avx$qv
	dd	?live16411@272-?live16411@208
	dw	1
?patch127	equ	1
?patch126	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	211
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	212
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	213
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	214
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mnnkfcia
	dw	0
	dw	4102
	dw	0
	dw	215
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	216
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eknkfcia
	dw	0
	dw	117
	dw	0
	dw	217
	dw	0
	dw	0
	dw	0
?patch123	equ	@426-@@stk@cpu@cpu_has_avx$qv+74
?patch124	equ	0
?patch125	equ	@426-@@stk@cpu@cpu_has_avx$qv
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
$ebokfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$meokfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_popcnt$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_popcnt$qv	proc	near
?live16412@0:
	?debug L 1157
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @427
@428:
	mov       ebx,offset $meokfcia
	?debug L 1163
?live16412@16: ; EBX = &$meokfcia
	mov       eax,dword ptr [$ebokfcia]
	cmp       eax,-1
	je        short @432
	?debug L 1164
?live16412@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @430
	?debug L 1166
?live16412@48: ; EBX = &$meokfcia
@431:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@432:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @431
	cmp       dword ptr [ebx],0
	jne       short @431
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
	jmp       short @435
@434:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@435:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @438
	cmp       dword ptr [ebx],0
@438:
	je        short @436
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @439
	cmp       eax,dword ptr [ebp-20]
@439:
	setne     al
	and       eax,1
	jmp       short @437
@436:
	xor       eax,eax
@437:
	test      al,al
	jne       short @434
	?debug L 1169
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
	?debug L 1171
	mov       eax,dword ptr [ebp-36]
	and       eax,8388608
	mov       dword ptr [$ebokfcia],eax
	?debug L 1172
?live16412@96: ; EBX = &$meokfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1173
?live16412@112: ; EBX = &$meokfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1175
?live16412@128: ; 
@440:
@430:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@427:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_popcnt$qv+0
	dd        @427+0
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
	dd	?patch128
	dd	?patch129
	dd	?patch130
	df	@@stk@cpu@cpu_has_popcnt$qv
	dw	0
	dw	4154
	dw	0
	dw	218
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
	dw	219
	dw	0
	dw	0
	dw	0
	dw	?patch131
	dw	529
	dw	?patch132
	dd	?live16412@112-@@stk@cpu@cpu_has_popcnt$qv
	dd	?live16412@128-?live16412@112
	dw	1
?patch132	equ	1
?patch131	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	220
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	221
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	222
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	223
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$meokfcia
	dw	0
	dw	4102
	dw	0
	dw	224
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	225
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ebokfcia
	dw	0
	dw	117
	dw	0
	dw	226
	dw	0
	dw	0
	dw	0
?patch128	equ	@440-@@stk@cpu@cpu_has_popcnt$qv+72
?patch129	equ	0
?patch130	equ	@440-@@stk@cpu@cpu_has_popcnt$qv
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
$eiokfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mlokfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_f16c$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_f16c$qv	proc	near
?live16413@0:
	?debug L 1178
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @441
@442:
	mov       ebx,offset $mlokfcia
	?debug L 1184
?live16413@16: ; EBX = &$mlokfcia
	mov       eax,dword ptr [$eiokfcia]
	cmp       eax,-1
	je        short @446
	?debug L 1185
?live16413@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @444
	?debug L 1187
?live16413@48: ; EBX = &$mlokfcia
@445:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@446:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @445
	cmp       dword ptr [ebx],0
	jne       short @445
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
	jmp       short @449
@448:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@449:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @452
	cmp       dword ptr [ebx],0
@452:
	je        short @450
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @453
	cmp       eax,dword ptr [ebp-20]
@453:
	setne     al
	and       eax,1
	jmp       short @451
@450:
	xor       eax,eax
@451:
	test      al,al
	jne       short @448
	?debug L 1190
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
	?debug L 1192
	mov       eax,dword ptr [ebp-36]
	and       eax,536870912
	mov       dword ptr [$eiokfcia],eax
	?debug L 1193
?live16413@96: ; EBX = &$mlokfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1194
?live16413@112: ; EBX = &$mlokfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1196
?live16413@128: ; 
@454:
@444:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@441:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_f16c$qv+0
	dd        @441+0
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
	dd	?patch133
	dd	?patch134
	dd	?patch135
	df	@@stk@cpu@cpu_has_f16c$qv
	dw	0
	dw	4156
	dw	0
	dw	227
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
	dw	228
	dw	0
	dw	0
	dw	0
	dw	?patch136
	dw	529
	dw	?patch137
	dd	?live16413@112-@@stk@cpu@cpu_has_f16c$qv
	dd	?live16413@128-?live16413@112
	dw	1
?patch137	equ	1
?patch136	equ	14
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
	df	$mlokfcia
	dw	0
	dw	4102
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
	df	$eiokfcia
	dw	0
	dw	117
	dw	0
	dw	235
	dw	0
	dw	0
	dw	0
?patch133	equ	@454-@@stk@cpu@cpu_has_f16c$qv+72
?patch134	equ	0
?patch135	equ	@454-@@stk@cpu@cpu_has_f16c$qv
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
$epokfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mcpkfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_cmpxchg$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_cmpxchg$qv	proc	near
?live16414@0:
	?debug L 1199
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @455
@456:
	mov       ebx,offset $mcpkfcia
	?debug L 1205
?live16414@16: ; EBX = &$mcpkfcia
	mov       eax,dword ptr [$epokfcia]
	cmp       eax,-1
	jne       @458
	?debug L 1206
?live16414@32: ; EAX = @temp2
	jmp       short @460
	?debug L 1208
?live16414@48: ; EBX = &$mcpkfcia
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
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],edx
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
	setne     cl
	and       ecx,1
	jmp       short @465
@464:
	xor       ecx,ecx
@465:
	test      cl,cl
	jne       short @462
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
	test      byte ptr [ebp-35],32
	je        short @468
	?debug L 1214
	mov       dword ptr [$epokfcia],16
	?debug L 1215
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1216
?live16414@128: ; 
	mov       eax,16
	jmp       @458
	?debug L 1218
?live16414@144: ; EBX = &$mcpkfcia
@468:
	test      byte ptr [ebp-27],1
	je        short @469
	?debug L 1219
	mov       dword ptr [$epokfcia],8
	?debug L 1220
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1221
?live16414@192: ; 
	mov       eax,8
	jmp       short @458
	?debug L 1225
?live16414@208: ; EBX = &$mcpkfcia
@469:
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
	?debug L 1227
	test      byte ptr [ebp-27],1
	je        short @470
	?debug L 1228
	mov       dword ptr [$epokfcia],8
	?debug L 1229
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1230
?live16414@272: ; 
	mov       eax,8
	jmp       short @458
	?debug L 1232
?live16414@288: ; EBX = &$mcpkfcia
@470:
	mov       dword ptr [$epokfcia],1
	?debug L 1233
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1234
?live16414@320: ; 
	mov       eax,1
	?debug L 1233
?live16414@336: ; EBX = &$mcpkfcia
	mov       dword ptr [ebx+4],0
	?debug L 1235
?live16414@352: ; 
@471:
@458:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@455:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_cmpxchg$qv+0
	dd        @455+0
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
	dd	?patch138
	dd	?patch139
	dd	?patch140
	df	@@stk@cpu@cpu_has_cmpxchg$qv
	dw	0
	dw	4158
	dw	0
	dw	236
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
	dw	237
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	238
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	239
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	240
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mcpkfcia
	dw	0
	dw	4102
	dw	0
	dw	241
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	242
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$epokfcia
	dw	0
	dw	117
	dw	0
	dw	243
	dw	0
	dw	0
	dw	0
?patch138	equ	@471-@@stk@cpu@cpu_has_cmpxchg$qv+75
?patch139	equ	0
?patch140	equ	@471-@@stk@cpu@cpu_has_cmpxchg$qv
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
$egpkfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mjpkfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_vmx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_vmx$qv	proc	near
?live16415@0:
	?debug L 1238
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @472
@473:
	mov       ebx,offset $mjpkfcia
	?debug L 1244
?live16415@16: ; EBX = &$mjpkfcia
	mov       eax,dword ptr [$egpkfcia]
	cmp       eax,-1
	je        short @477
	?debug L 1245
?live16415@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @475
	?debug L 1247
?live16415@48: ; EBX = &$mjpkfcia
@476:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@477:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @476
	cmp       dword ptr [ebx],0
	jne       short @476
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
	jmp       short @480
@479:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@480:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @483
	cmp       dword ptr [ebx],0
@483:
	je        short @481
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @484
	cmp       eax,dword ptr [ebp-20]
@484:
	setne     al
	and       eax,1
	jmp       short @482
@481:
	xor       eax,eax
@482:
	test      al,al
	jne       short @479
	?debug L 1250
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
	?debug L 1252
	mov       eax,dword ptr [ebp-36]
	and       eax,32
	mov       dword ptr [$egpkfcia],eax
	?debug L 1253
?live16415@96: ; EBX = &$mjpkfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1254
?live16415@112: ; EBX = &$mjpkfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1256
?live16415@128: ; 
@485:
@475:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@472:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_vmx$qv+0
	dd        @472+0
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
	dd	?patch141
	dd	?patch142
	dd	?patch143
	df	@@stk@cpu@cpu_has_vmx$qv
	dw	0
	dw	4160
	dw	0
	dw	244
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
	dw	245
	dw	0
	dw	0
	dw	0
	dw	?patch144
	dw	529
	dw	?patch145
	dd	?live16415@112-@@stk@cpu@cpu_has_vmx$qv
	dd	?live16415@128-?live16415@112
	dw	1
?patch145	equ	1
?patch144	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	246
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	247
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	248
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	249
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mjpkfcia
	dw	0
	dw	4102
	dw	0
	dw	250
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	251
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$egpkfcia
	dw	0
	dw	117
	dw	0
	dw	252
	dw	0
	dw	0
	dw	0
?patch141	equ	@485-@@stk@cpu@cpu_has_vmx$qv+74
?patch142	equ	0
?patch143	equ	@485-@@stk@cpu@cpu_has_vmx$qv
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
$enpkfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$maalfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_smx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_smx$qv	proc	near
?live16416@0:
	?debug L 1259
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @486
@487:
	mov       ebx,offset $maalfcia
	?debug L 1265
?live16416@16: ; EBX = &$maalfcia
	mov       eax,dword ptr [$enpkfcia]
	cmp       eax,-1
	je        short @491
	?debug L 1266
?live16416@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @489
	?debug L 1268
?live16416@48: ; EBX = &$maalfcia
@490:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@491:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @490
	cmp       dword ptr [ebx],0
	jne       short @490
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
	jmp       short @494
@493:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@494:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @497
	cmp       dword ptr [ebx],0
@497:
	je        short @495
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @498
	cmp       eax,dword ptr [ebp-20]
@498:
	setne     al
	and       eax,1
	jmp       short @496
@495:
	xor       eax,eax
@496:
	test      al,al
	jne       short @493
	?debug L 1271
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
	?debug L 1273
	mov       eax,dword ptr [ebp-36]
	and       eax,64
	mov       dword ptr [$enpkfcia],eax
	?debug L 1274
?live16416@96: ; EBX = &$maalfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1275
?live16416@112: ; EBX = &$maalfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1277
?live16416@128: ; 
@499:
@489:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@486:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_smx$qv+0
	dd        @486+0
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
	dd	?patch146
	dd	?patch147
	dd	?patch148
	df	@@stk@cpu@cpu_has_smx$qv
	dw	0
	dw	4162
	dw	0
	dw	253
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
	dw	254
	dw	0
	dw	0
	dw	0
	dw	?patch149
	dw	529
	dw	?patch150
	dd	?live16416@112-@@stk@cpu@cpu_has_smx$qv
	dd	?live16416@128-?live16416@112
	dw	1
?patch150	equ	1
?patch149	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	255
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	256
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	257
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	258
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$maalfcia
	dw	0
	dw	4102
	dw	0
	dw	259
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	260
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$enpkfcia
	dw	0
	dw	117
	dw	0
	dw	261
	dw	0
	dw	0
	dw	0
?patch146	equ	@499-@@stk@cpu@cpu_has_smx$qv+74
?patch147	equ	0
?patch148	equ	@499-@@stk@cpu@cpu_has_smx$qv
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
$eealfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mhalfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_cmov$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_cmov$qv	proc	near
?live16417@0:
	?debug L 1280
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @500
@501:
	mov       ebx,offset $mhalfcia
	?debug L 1286
?live16417@16: ; EBX = &$mhalfcia
	mov       eax,dword ptr [$eealfcia]
	cmp       eax,-1
	je        short @505
	?debug L 1287
?live16417@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @503
	?debug L 1289
?live16417@48: ; EBX = &$mhalfcia
@504:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@505:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @504
	cmp       dword ptr [ebx],0
	jne       short @504
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
	jmp       short @508
@507:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@508:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @511
	cmp       dword ptr [ebx],0
@511:
	je        short @509
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @512
	cmp       eax,dword ptr [ebp-20]
@512:
	setne     al
	and       eax,1
	jmp       short @510
@509:
	xor       eax,eax
@510:
	test      al,al
	jne       short @507
	?debug L 1292
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
	?debug L 1294
	mov       eax,dword ptr [ebp-28]
	and       eax,32768
	mov       dword ptr [$eealfcia],eax
	?debug L 1295
?live16417@96: ; EBX = &$mhalfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1296
?live16417@112: ; EBX = &$mhalfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1298
?live16417@128: ; 
@513:
@503:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@500:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_cmov$qv+0
	dd        @500+0
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
	dd	?patch151
	dd	?patch152
	dd	?patch153
	df	@@stk@cpu@cpu_has_cmov$qv
	dw	0
	dw	4164
	dw	0
	dw	262
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
	dw	263
	dw	0
	dw	0
	dw	0
	dw	?patch154
	dw	529
	dw	?patch155
	dd	?live16417@112-@@stk@cpu@cpu_has_cmov$qv
	dd	?live16417@128-?live16417@112
	dw	1
?patch155	equ	1
?patch154	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	264
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	265
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	266
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	267
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mhalfcia
	dw	0
	dw	4102
	dw	0
	dw	268
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	269
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eealfcia
	dw	0
	dw	117
	dw	0
	dw	270
	dw	0
	dw	0
	dw	0
?patch151	equ	@513-@@stk@cpu@cpu_has_cmov$qv+72
?patch152	equ	0
?patch153	equ	@513-@@stk@cpu@cpu_has_cmov$qv
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
$elalfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$moalfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_movbe$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_movbe$qv	proc	near
?live16418@0:
	?debug L 1301
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @514
@515:
	mov       ebx,offset $moalfcia
	?debug L 1307
?live16418@16: ; EBX = &$moalfcia
	mov       eax,dword ptr [$elalfcia]
	cmp       eax,-1
	je        short @519
	?debug L 1308
?live16418@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @517
	?debug L 1310
?live16418@48: ; EBX = &$moalfcia
@518:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@519:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @518
	cmp       dword ptr [ebx],0
	jne       short @518
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
	jmp       short @522
@521:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@522:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @525
	cmp       dword ptr [ebx],0
@525:
	je        short @523
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @526
	cmp       eax,dword ptr [ebp-20]
@526:
	setne     al
	and       eax,1
	jmp       short @524
@523:
	xor       eax,eax
@524:
	test      al,al
	jne       short @521
	?debug L 1313
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
	?debug L 1315
	mov       eax,dword ptr [ebp-36]
	and       eax,4194304
	mov       dword ptr [$elalfcia],eax
	?debug L 1316
?live16418@96: ; EBX = &$moalfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1317
?live16418@112: ; EBX = &$moalfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1319
?live16418@128: ; 
@527:
@517:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@514:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_movbe$qv+0
	dd        @514+0
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
	dd	?patch156
	dd	?patch157
	dd	?patch158
	df	@@stk@cpu@cpu_has_movbe$qv
	dw	0
	dw	4166
	dw	0
	dw	271
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
	dw	272
	dw	0
	dw	0
	dw	0
	dw	?patch159
	dw	529
	dw	?patch160
	dd	?live16418@112-@@stk@cpu@cpu_has_movbe$qv
	dd	?live16418@128-?live16418@112
	dw	1
?patch160	equ	1
?patch159	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	273
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	274
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	275
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	276
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$moalfcia
	dw	0
	dw	4102
	dw	0
	dw	277
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	278
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$elalfcia
	dw	0
	dw	117
	dw	0
	dw	279
	dw	0
	dw	0
	dw	0
?patch156	equ	@527-@@stk@cpu@cpu_has_movbe$qv+72
?patch157	equ	0
?patch158	equ	@527-@@stk@cpu@cpu_has_movbe$qv
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
$ecblfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mfblfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_bmi$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_bmi$qv	proc	near
?live16419@0:
	?debug L 1322
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @528
@529:
	mov       ebx,offset $mfblfcia
	?debug L 1328
?live16419@16: ; EBX = &$mfblfcia
	mov       eax,dword ptr [$ecblfcia]
	cmp       eax,-1
	jne       @531
	?debug L 1329
?live16419@32: ; EAX = @temp3
	jmp       short @533
	?debug L 1331
?live16419@48: ; EBX = &$mfblfcia
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
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],edx
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
	setne     cl
	and       ecx,1
	jmp       short @538
@537:
	xor       ecx,ecx
@538:
	test      cl,cl
	jne       short @535
	?debug L 1334
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
	?debug L 1336
	test      byte ptr [ebp-43],1
	je        short @541
	?debug L 1337
	mov       dword ptr [$ecblfcia],2
	jmp       short @542
	?debug L 1339
@541:
	test      byte ptr [ebp-44],8
	je        short @543
	?debug L 1340
	mov       dword ptr [$ecblfcia],1
	jmp       short @542
	?debug L 1342
@543:
	xor       ecx,ecx
	mov       dword ptr [$ecblfcia],ecx
	?debug L 1343
@542:
	cmp       dword ptr [$ecblfcia],0
	setne     al
	and       eax,1
	?debug L 1344
?live16419@176: ; EBX = &$mfblfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1345
?live16419@192: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	?debug L 1344
?live16419@208: ; EBX = &$mfblfcia, EAX = ret
	mov       dword ptr [ebx+4],0
	?debug L 1345
?live16419@224: ; EAX = ret
	mov       eax,edx
	?debug L 1346
?live16419@240: ; 
@544:
@531:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@528:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_bmi$qv+0
	dd        @528+0
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
	dd	?patch161
	dd	?patch162
	dd	?patch163
	df	@@stk@cpu@cpu_has_bmi$qv
	dw	0
	dw	4168
	dw	0
	dw	280
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
	dw	281
	dw	0
	dw	0
	dw	0
	dw	?patch164
	dw	529
	dw	?patch165
	dd	?live16419@176-@@stk@cpu@cpu_has_bmi$qv
	dd	?live16419@240-?live16419@176
	dw	1
?patch165	equ	1
?patch164	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	282
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	283
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	284
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	285
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mfblfcia
	dw	0
	dw	4102
	dw	0
	dw	286
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	287
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ecblfcia
	dw	0
	dw	117
	dw	0
	dw	288
	dw	0
	dw	0
	dw	0
?patch161	equ	@544-@@stk@cpu@cpu_has_bmi$qv+73
?patch162	equ	0
?patch163	equ	@544-@@stk@cpu@cpu_has_bmi$qv
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
$ejblfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mmblfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_erms$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_erms$qv	proc	near
?live16420@0:
	?debug L 1349
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @545
@546:
	mov       ebx,offset $mmblfcia
	?debug L 1355
?live16420@16: ; EBX = &$mmblfcia
	mov       eax,dword ptr [$ejblfcia]
	cmp       eax,-1
	je        short @550
	?debug L 1356
?live16420@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @548
	?debug L 1358
?live16420@48: ; EBX = &$mmblfcia
@549:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@550:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @549
	cmp       dword ptr [ebx],0
	jne       short @549
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
	jmp       short @553
@552:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@553:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @556
	cmp       dword ptr [ebx],0
@556:
	je        short @554
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @557
	cmp       eax,dword ptr [ebp-20]
@557:
	setne     al
	and       eax,1
	jmp       short @555
@554:
	xor       eax,eax
@555:
	test      al,al
	jne       short @552
	?debug L 1361
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
	?debug L 1363
	mov       eax,dword ptr [ebp-44]
	and       eax,512
	mov       dword ptr [$ejblfcia],eax
	?debug L 1364
?live16420@96: ; EBX = &$mmblfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1365
?live16420@112: ; EBX = &$mmblfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1367
?live16420@128: ; 
@558:
@548:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@545:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_erms$qv+0
	dd        @545+0
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
	dd	?patch166
	dd	?patch167
	dd	?patch168
	df	@@stk@cpu@cpu_has_erms$qv
	dw	0
	dw	4170
	dw	0
	dw	289
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
	dw	290
	dw	0
	dw	0
	dw	0
	dw	?patch169
	dw	529
	dw	?patch170
	dd	?live16420@112-@@stk@cpu@cpu_has_erms$qv
	dd	?live16420@128-?live16420@112
	dw	1
?patch170	equ	1
?patch169	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	291
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	292
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	293
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	294
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mmblfcia
	dw	0
	dw	4102
	dw	0
	dw	295
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	296
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ejblfcia
	dw	0
	dw	117
	dw	0
	dw	297
	dw	0
	dw	0
	dw	0
?patch166	equ	@558-@@stk@cpu@cpu_has_erms$qv+72
?patch167	equ	0
?patch168	equ	@558-@@stk@cpu@cpu_has_erms$qv
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
$eaclfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mdclfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_3dnow$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_3dnow$qv	proc	near
?live16421@0:
	?debug L 1370
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @559
@560:
	mov       ebx,offset $mdclfcia
	?debug L 1376
?live16421@16: ; EBX = &$mdclfcia
	mov       eax,dword ptr [$eaclfcia]
	cmp       eax,-1
	jne       @562
	?debug L 1377
?live16421@32: ; EAX = @temp3
	jmp       short @564
	?debug L 1379
?live16421@48: ; EBX = &$mdclfcia
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
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],edx
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
	setne     cl
	and       ecx,1
	jmp       short @569
@568:
	xor       ecx,ecx
@569:
	test      cl,cl
	jne       short @566
	?debug L 1382
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
	?debug L 1384
	test      byte ptr [ebp-25],64
	je        short @572
	?debug L 1385
	mov       dword ptr [$eaclfcia],2
	jmp       short @573
	?debug L 1387
@572:
	test      byte ptr [ebp-25],-128
	je        short @574
	?debug L 1388
	mov       dword ptr [$eaclfcia],1
	jmp       short @573
	?debug L 1390
@574:
	xor       ecx,ecx
	mov       dword ptr [$eaclfcia],ecx
	?debug L 1391
@573:
	cmp       dword ptr [$eaclfcia],0
	setne     al
	and       eax,1
	?debug L 1392
?live16421@176: ; EBX = &$mdclfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1393
?live16421@192: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	?debug L 1392
?live16421@208: ; EBX = &$mdclfcia, EAX = ret
	mov       dword ptr [ebx+4],0
	?debug L 1393
?live16421@224: ; EAX = ret
	mov       eax,edx
	?debug L 1394
?live16421@240: ; 
@575:
@562:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@559:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_3dnow$qv+0
	dd        @559+0
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
	dd	?patch171
	dd	?patch172
	dd	?patch173
	df	@@stk@cpu@cpu_has_3dnow$qv
	dw	0
	dw	4172
	dw	0
	dw	298
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
	dw	299
	dw	0
	dw	0
	dw	0
	dw	?patch174
	dw	529
	dw	?patch175
	dd	?live16421@176-@@stk@cpu@cpu_has_3dnow$qv
	dd	?live16421@240-?live16421@176
	dw	1
?patch175	equ	1
?patch174	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	300
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	301
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	302
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	303
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mdclfcia
	dw	0
	dw	4102
	dw	0
	dw	304
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	305
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eaclfcia
	dw	0
	dw	117
	dw	0
	dw	306
	dw	0
	dw	0
	dw	0
?patch171	equ	@575-@@stk@cpu@cpu_has_3dnow$qv+74
?patch172	equ	0
?patch173	equ	@575-@@stk@cpu@cpu_has_3dnow$qv
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
$ehclfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mkclfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_3dnowprefetch$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_3dnowprefetch$qv	proc	near
?live16422@0:
	?debug L 1397
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @576
@577:
	mov       ebx,offset $mkclfcia
	?debug L 1403
?live16422@16: ; EBX = &$mkclfcia
	mov       eax,dword ptr [$ehclfcia]
	cmp       eax,-1
	je        short @581
	?debug L 1404
?live16422@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @579
	?debug L 1406
?live16422@48: ; EBX = &$mkclfcia
@580:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@581:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @580
	cmp       dword ptr [ebx],0
	jne       short @580
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
	jmp       short @584
@583:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@584:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @587
	cmp       dword ptr [ebx],0
@587:
	je        short @585
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @588
	cmp       eax,dword ptr [ebp-20]
@588:
	setne     al
	and       eax,1
	jmp       short @586
@585:
	xor       eax,eax
@586:
	test      al,al
	jne       short @583
	?debug L 1409
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
	?debug L 1411
	mov       eax,dword ptr [ebp-36]
	and       eax,256
	mov       dword ptr [$ehclfcia],eax
	?debug L 1412
?live16422@96: ; EBX = &$mkclfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1413
?live16422@112: ; EBX = &$mkclfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1415
?live16422@128: ; 
@589:
@579:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@576:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_3dnowprefetch$qv+0
	dd        @576+0
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
	dd	?patch176
	dd	?patch177
	dd	?patch178
	df	@@stk@cpu@cpu_has_3dnowprefetch$qv
	dw	0
	dw	4174
	dw	0
	dw	307
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
	dw	308
	dw	0
	dw	0
	dw	0
	dw	?patch179
	dw	529
	dw	?patch180
	dd	?live16422@112-@@stk@cpu@cpu_has_3dnowprefetch$qv
	dd	?live16422@128-?live16422@112
	dw	1
?patch180	equ	1
?patch179	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	309
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	310
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	311
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	312
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mkclfcia
	dw	0
	dw	4102
	dw	0
	dw	313
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	314
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ehclfcia
	dw	0
	dw	117
	dw	0
	dw	315
	dw	0
	dw	0
	dw	0
?patch176	equ	@589-@@stk@cpu@cpu_has_3dnowprefetch$qv+73
?patch177	equ	0
?patch178	equ	@589-@@stk@cpu@cpu_has_3dnowprefetch$qv
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
$eoclfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mbdlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_perftsc$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_perftsc$qv	proc	near
?live16423@0:
	?debug L 1418
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @590
@591:
	mov       ebx,offset $mbdlfcia
	?debug L 1424
?live16423@16: ; EBX = &$mbdlfcia
	mov       eax,dword ptr [$eoclfcia]
	cmp       eax,-1
	je        short @595
	?debug L 1425
?live16423@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @593
	?debug L 1427
?live16423@48: ; EBX = &$mbdlfcia
@594:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@595:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @594
	cmp       dword ptr [ebx],0
	jne       short @594
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
	jmp       short @598
@597:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@598:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @601
	cmp       dword ptr [ebx],0
@601:
	je        short @599
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @602
	cmp       eax,dword ptr [ebp-20]
@602:
	setne     al
	and       eax,1
	jmp       short @600
@599:
	xor       eax,eax
@600:
	test      al,al
	jne       short @597
	?debug L 1430
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
	?debug L 1432
	mov       eax,dword ptr [ebp-28]
	and       eax,134217728
	mov       dword ptr [$eoclfcia],eax
	?debug L 1433
?live16423@96: ; EBX = &$mbdlfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1434
?live16423@112: ; EBX = &$mbdlfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1436
?live16423@128: ; 
@603:
@593:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@590:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_perftsc$qv+0
	dd        @590+0
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
	dd	?patch181
	dd	?patch182
	dd	?patch183
	df	@@stk@cpu@cpu_has_perftsc$qv
	dw	0
	dw	4176
	dw	0
	dw	316
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
	dw	317
	dw	0
	dw	0
	dw	0
	dw	?patch184
	dw	529
	dw	?patch185
	dd	?live16423@112-@@stk@cpu@cpu_has_perftsc$qv
	dd	?live16423@128-?live16423@112
	dw	1
?patch185	equ	1
?patch184	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	318
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	319
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	320
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	321
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mbdlfcia
	dw	0
	dw	4102
	dw	0
	dw	322
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	323
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eoclfcia
	dw	0
	dw	117
	dw	0
	dw	324
	dw	0
	dw	0
	dw	0
?patch181	equ	@603-@@stk@cpu@cpu_has_perftsc$qv+73
?patch182	equ	0
?patch183	equ	@603-@@stk@cpu@cpu_has_perftsc$qv
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
$efdlfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$midlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sha$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sha$qv	proc	near
?live16424@0:
	?debug L 1439
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @604
@605:
	mov       ebx,offset $midlfcia
	?debug L 1445
?live16424@16: ; EBX = &$midlfcia
	mov       eax,dword ptr [$efdlfcia]
	cmp       eax,-1
	je        short @609
	?debug L 1446
?live16424@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @607
	?debug L 1448
?live16424@48: ; EBX = &$midlfcia
@608:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@609:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @608
	cmp       dword ptr [ebx],0
	jne       short @608
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
	jmp       short @612
@611:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@612:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @615
	cmp       dword ptr [ebx],0
@615:
	je        short @613
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @616
	cmp       eax,dword ptr [ebp-20]
@616:
	setne     al
	and       eax,1
	jmp       short @614
@613:
	xor       eax,eax
@614:
	test      al,al
	jne       short @611
	?debug L 1451
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
	?debug L 1453
	mov       eax,dword ptr [ebp-44]
	and       eax,536870912
	mov       dword ptr [$efdlfcia],eax
	?debug L 1454
?live16424@96: ; EBX = &$midlfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1455
?live16424@112: ; EBX = &$midlfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1457
?live16424@128: ; 
@617:
@607:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@604:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_sha$qv+0
	dd        @604+0
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
	dd	?patch186
	dd	?patch187
	dd	?patch188
	df	@@stk@cpu@cpu_has_sha$qv
	dw	0
	dw	4178
	dw	0
	dw	325
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
	dw	326
	dw	0
	dw	0
	dw	0
	dw	?patch189
	dw	529
	dw	?patch190
	dd	?live16424@112-@@stk@cpu@cpu_has_sha$qv
	dd	?live16424@128-?live16424@112
	dw	1
?patch190	equ	1
?patch189	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	327
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	328
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	329
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	330
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$midlfcia
	dw	0
	dw	4102
	dw	0
	dw	331
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	332
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$efdlfcia
	dw	0
	dw	117
	dw	0
	dw	333
	dw	0
	dw	0
	dw	0
?patch186	equ	@617-@@stk@cpu@cpu_has_sha$qv+72
?patch187	equ	0
?patch188	equ	@617-@@stk@cpu@cpu_has_sha$qv
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
$emdlfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mpdlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_xop$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_xop$qv	proc	near
?live16425@0:
	?debug L 1460
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @618
@619:
	mov       ebx,offset $mpdlfcia
	?debug L 1466
?live16425@16: ; EBX = &$mpdlfcia
	mov       eax,dword ptr [$emdlfcia]
	cmp       eax,-1
	je        short @623
	?debug L 1467
?live16425@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @621
	?debug L 1469
?live16425@48: ; EBX = &$mpdlfcia
@622:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@623:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @622
	cmp       dword ptr [ebx],0
	jne       short @622
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
	jmp       short @626
@625:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@626:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @629
	cmp       dword ptr [ebx],0
@629:
	je        short @627
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @630
	cmp       eax,dword ptr [ebp-20]
@630:
	setne     al
	and       eax,1
	jmp       short @628
@627:
	xor       eax,eax
@628:
	test      al,al
	jne       short @625
	?debug L 1472
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
	?debug L 1474
	mov       eax,dword ptr [ebp-36]
	and       eax,2048
	mov       dword ptr [$emdlfcia],eax
	?debug L 1475
?live16425@96: ; EBX = &$mpdlfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1476
?live16425@112: ; EBX = &$mpdlfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1478
?live16425@128: ; 
@631:
@621:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@618:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_xop$qv+0
	dd        @618+0
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
	dd	?patch191
	dd	?patch192
	dd	?patch193
	df	@@stk@cpu@cpu_has_xop$qv
	dw	0
	dw	4180
	dw	0
	dw	334
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
	dw	335
	dw	0
	dw	0
	dw	0
	dw	?patch194
	dw	529
	dw	?patch195
	dd	?live16425@112-@@stk@cpu@cpu_has_xop$qv
	dd	?live16425@128-?live16425@112
	dw	1
?patch195	equ	1
?patch194	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	336
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	337
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	338
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	339
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mpdlfcia
	dw	0
	dw	4102
	dw	0
	dw	340
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	341
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$emdlfcia
	dw	0
	dw	117
	dw	0
	dw	342
	dw	0
	dw	0
	dw	0
?patch191	equ	@631-@@stk@cpu@cpu_has_xop$qv+73
?patch192	equ	0
?patch193	equ	@631-@@stk@cpu@cpu_has_xop$qv
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
$edelfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mgelfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512f$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512f$qv	proc	near
?live16426@0:
	?debug L 1481
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @632
@633:
	mov       ebx,offset $mgelfcia
	?debug L 1487
?live16426@16: ; EBX = &$mgelfcia
	mov       eax,dword ptr [$edelfcia]
	cmp       eax,-1
	je        short @637
	?debug L 1488
?live16426@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @635
	?debug L 1490
?live16426@48: ; EBX = &$mgelfcia
@636:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@637:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @636
	cmp       dword ptr [ebx],0
	jne       short @636
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
	jmp       short @640
@639:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@640:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @643
	cmp       dword ptr [ebx],0
@643:
	je        short @641
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @644
	cmp       eax,dword ptr [ebp-20]
@644:
	setne     al
	and       eax,1
	jmp       short @642
@641:
	xor       eax,eax
@642:
	test      al,al
	jne       short @639
	?debug L 1493
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
	?debug L 1495
	mov       eax,dword ptr [ebp-44]
	and       eax,65536
	mov       dword ptr [$edelfcia],eax
	?debug L 1496
?live16426@96: ; EBX = &$mgelfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1497
?live16426@112: ; EBX = &$mgelfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1499
?live16426@128: ; 
@645:
@635:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@632:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512f$qv+0
	dd        @632+0
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
	dd	?patch196
	dd	?patch197
	dd	?patch198
	df	@@stk@cpu@cpu_has_avx512f$qv
	dw	0
	dw	4182
	dw	0
	dw	343
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
	dw	344
	dw	0
	dw	0
	dw	0
	dw	?patch199
	dw	529
	dw	?patch200
	dd	?live16426@112-@@stk@cpu@cpu_has_avx512f$qv
	dd	?live16426@128-?live16426@112
	dw	1
?patch200	equ	1
?patch199	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	345
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	346
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	347
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	348
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mgelfcia
	dw	0
	dw	4102
	dw	0
	dw	349
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	350
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$edelfcia
	dw	0
	dw	117
	dw	0
	dw	351
	dw	0
	dw	0
	dw	0
?patch196	equ	@645-@@stk@cpu@cpu_has_avx512f$qv+72
?patch197	equ	0
?patch198	equ	@645-@@stk@cpu@cpu_has_avx512f$qv
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
$ekelfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mnelfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512bw$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512bw$qv	proc	near
?live16427@0:
	?debug L 1502
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @646
@647:
	mov       ebx,offset $mnelfcia
	?debug L 1508
?live16427@16: ; EBX = &$mnelfcia
	mov       eax,dword ptr [$ekelfcia]
	cmp       eax,-1
	je        short @651
	?debug L 1509
?live16427@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @649
	?debug L 1511
?live16427@48: ; EBX = &$mnelfcia
@650:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@651:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @650
	cmp       dword ptr [ebx],0
	jne       short @650
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
	jmp       short @654
@653:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@654:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @657
	cmp       dword ptr [ebx],0
@657:
	je        short @655
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @658
	cmp       eax,dword ptr [ebp-20]
@658:
	setne     al
	and       eax,1
	jmp       short @656
@655:
	xor       eax,eax
@656:
	test      al,al
	jne       short @653
	?debug L 1514
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
	?debug L 1516
	mov       eax,dword ptr [ebp-44]
	and       eax,1073741824
	mov       dword ptr [$ekelfcia],eax
	?debug L 1517
?live16427@96: ; EBX = &$mnelfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1518
?live16427@112: ; EBX = &$mnelfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1520
?live16427@128: ; 
@659:
@649:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@646:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512bw$qv+0
	dd        @646+0
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
	dd	?patch201
	dd	?patch202
	dd	?patch203
	df	@@stk@cpu@cpu_has_avx512bw$qv
	dw	0
	dw	4184
	dw	0
	dw	352
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
	dw	353
	dw	0
	dw	0
	dw	0
	dw	?patch204
	dw	529
	dw	?patch205
	dd	?live16427@112-@@stk@cpu@cpu_has_avx512bw$qv
	dd	?live16427@128-?live16427@112
	dw	1
?patch205	equ	1
?patch204	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	354
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	355
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	356
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	357
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mnelfcia
	dw	0
	dw	4102
	dw	0
	dw	358
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	359
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ekelfcia
	dw	0
	dw	117
	dw	0
	dw	360
	dw	0
	dw	0
	dw	0
?patch201	equ	@659-@@stk@cpu@cpu_has_avx512bw$qv+72
?patch202	equ	0
?patch203	equ	@659-@@stk@cpu@cpu_has_avx512bw$qv
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
$ebflfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$meflfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512er$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512er$qv	proc	near
?live16428@0:
	?debug L 1523
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @660
@661:
	mov       ebx,offset $meflfcia
	?debug L 1529
?live16428@16: ; EBX = &$meflfcia
	mov       eax,dword ptr [$ebflfcia]
	cmp       eax,-1
	je        short @665
	?debug L 1530
?live16428@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @663
	?debug L 1532
?live16428@48: ; EBX = &$meflfcia
@664:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@665:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @664
	cmp       dword ptr [ebx],0
	jne       short @664
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
	jmp       short @668
@667:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@668:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @671
	cmp       dword ptr [ebx],0
@671:
	je        short @669
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @672
	cmp       eax,dword ptr [ebp-20]
@672:
	setne     al
	and       eax,1
	jmp       short @670
@669:
	xor       eax,eax
@670:
	test      al,al
	jne       short @667
	?debug L 1535
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
	?debug L 1537
	mov       eax,dword ptr [ebp-44]
	and       eax,134217728
	mov       dword ptr [$ebflfcia],eax
	?debug L 1538
?live16428@96: ; EBX = &$meflfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1539
?live16428@112: ; EBX = &$meflfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1541
?live16428@128: ; 
@673:
@663:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@660:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512er$qv+0
	dd        @660+0
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
	dd	?patch206
	dd	?patch207
	dd	?patch208
	df	@@stk@cpu@cpu_has_avx512er$qv
	dw	0
	dw	4186
	dw	0
	dw	361
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
	dw	362
	dw	0
	dw	0
	dw	0
	dw	?patch209
	dw	529
	dw	?patch210
	dd	?live16428@112-@@stk@cpu@cpu_has_avx512er$qv
	dd	?live16428@128-?live16428@112
	dw	1
?patch210	equ	1
?patch209	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	363
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	364
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	365
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	366
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$meflfcia
	dw	0
	dw	4102
	dw	0
	dw	367
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	368
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ebflfcia
	dw	0
	dw	117
	dw	0
	dw	369
	dw	0
	dw	0
	dw	0
?patch206	equ	@673-@@stk@cpu@cpu_has_avx512er$qv+72
?patch207	equ	0
?patch208	equ	@673-@@stk@cpu@cpu_has_avx512er$qv
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
$eiflfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mlflfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512cd$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512cd$qv	proc	near
?live16429@0:
	?debug L 1544
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @674
@675:
	mov       ebx,offset $mlflfcia
	?debug L 1550
?live16429@16: ; EBX = &$mlflfcia
	mov       eax,dword ptr [$eiflfcia]
	cmp       eax,-1
	je        short @679
	?debug L 1551
?live16429@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @677
	?debug L 1553
?live16429@48: ; EBX = &$mlflfcia
@678:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@679:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @678
	cmp       dword ptr [ebx],0
	jne       short @678
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
	jmp       short @682
@681:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@682:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @685
	cmp       dword ptr [ebx],0
@685:
	je        short @683
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @686
	cmp       eax,dword ptr [ebp-20]
@686:
	setne     al
	and       eax,1
	jmp       short @684
@683:
	xor       eax,eax
@684:
	test      al,al
	jne       short @681
	?debug L 1556
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
	?debug L 1558
	mov       eax,dword ptr [ebp-44]
	and       eax,268435456
	mov       dword ptr [$eiflfcia],eax
	?debug L 1559
?live16429@96: ; EBX = &$mlflfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1560
?live16429@112: ; EBX = &$mlflfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1562
?live16429@128: ; 
@687:
@677:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@674:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512cd$qv+0
	dd        @674+0
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
	dd	?patch211
	dd	?patch212
	dd	?patch213
	df	@@stk@cpu@cpu_has_avx512cd$qv
	dw	0
	dw	4188
	dw	0
	dw	370
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
	dw	371
	dw	0
	dw	0
	dw	0
	dw	?patch214
	dw	529
	dw	?patch215
	dd	?live16429@112-@@stk@cpu@cpu_has_avx512cd$qv
	dd	?live16429@128-?live16429@112
	dw	1
?patch215	equ	1
?patch214	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	372
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	373
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	374
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	375
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mlflfcia
	dw	0
	dw	4102
	dw	0
	dw	376
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	377
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eiflfcia
	dw	0
	dw	117
	dw	0
	dw	378
	dw	0
	dw	0
	dw	0
?patch211	equ	@687-@@stk@cpu@cpu_has_avx512cd$qv+72
?patch212	equ	0
?patch213	equ	@687-@@stk@cpu@cpu_has_avx512cd$qv
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
$epflfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mcglfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512pf$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512pf$qv	proc	near
?live16430@0:
	?debug L 1565
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @688
@689:
	mov       ebx,offset $mcglfcia
	?debug L 1571
?live16430@16: ; EBX = &$mcglfcia
	mov       eax,dword ptr [$epflfcia]
	cmp       eax,-1
	je        short @693
	?debug L 1572
?live16430@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @691
	?debug L 1574
?live16430@48: ; EBX = &$mcglfcia
@692:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@693:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @692
	cmp       dword ptr [ebx],0
	jne       short @692
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
	jmp       short @696
@695:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@696:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @699
	cmp       dword ptr [ebx],0
@699:
	je        short @697
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @700
	cmp       eax,dword ptr [ebp-20]
@700:
	setne     al
	and       eax,1
	jmp       short @698
@697:
	xor       eax,eax
@698:
	test      al,al
	jne       short @695
	?debug L 1577
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
	?debug L 1579
	mov       eax,dword ptr [ebp-44]
	and       eax,67108864
	mov       dword ptr [$epflfcia],eax
	?debug L 1580
?live16430@96: ; EBX = &$mcglfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1581
?live16430@112: ; EBX = &$mcglfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1583
?live16430@128: ; 
@701:
@691:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@688:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512pf$qv+0
	dd        @688+0
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
	dd	?patch216
	dd	?patch217
	dd	?patch218
	df	@@stk@cpu@cpu_has_avx512pf$qv
	dw	0
	dw	4190
	dw	0
	dw	379
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
	dw	380
	dw	0
	dw	0
	dw	0
	dw	?patch219
	dw	529
	dw	?patch220
	dd	?live16430@112-@@stk@cpu@cpu_has_avx512pf$qv
	dd	?live16430@128-?live16430@112
	dw	1
?patch220	equ	1
?patch219	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	381
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	382
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	383
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	384
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mcglfcia
	dw	0
	dw	4102
	dw	0
	dw	385
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	386
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$epflfcia
	dw	0
	dw	117
	dw	0
	dw	387
	dw	0
	dw	0
	dw	0
?patch216	equ	@701-@@stk@cpu@cpu_has_avx512pf$qv+72
?patch217	equ	0
?patch218	equ	@701-@@stk@cpu@cpu_has_avx512pf$qv
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
$egglfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mjglfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512dq$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512dq$qv	proc	near
?live16431@0:
	?debug L 1586
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @702
@703:
	mov       ebx,offset $mjglfcia
	?debug L 1592
?live16431@16: ; EBX = &$mjglfcia
	mov       eax,dword ptr [$egglfcia]
	cmp       eax,-1
	je        short @707
	?debug L 1593
?live16431@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @705
	?debug L 1595
?live16431@48: ; EBX = &$mjglfcia
@706:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@707:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @706
	cmp       dword ptr [ebx],0
	jne       short @706
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
	jmp       short @710
@709:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@710:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @713
	cmp       dword ptr [ebx],0
@713:
	je        short @711
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @714
	cmp       eax,dword ptr [ebp-20]
@714:
	setne     al
	and       eax,1
	jmp       short @712
@711:
	xor       eax,eax
@712:
	test      al,al
	jne       short @709
	?debug L 1598
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
	?debug L 1600
	mov       eax,dword ptr [ebp-44]
	and       eax,131072
	mov       dword ptr [$egglfcia],eax
	?debug L 1601
?live16431@96: ; EBX = &$mjglfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1602
?live16431@112: ; EBX = &$mjglfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1604
?live16431@128: ; 
@715:
@705:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@702:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512dq$qv+0
	dd        @702+0
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
	dd	?patch221
	dd	?patch222
	dd	?patch223
	df	@@stk@cpu@cpu_has_avx512dq$qv
	dw	0
	dw	4192
	dw	0
	dw	388
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
	dw	389
	dw	0
	dw	0
	dw	0
	dw	?patch224
	dw	529
	dw	?patch225
	dd	?live16431@112-@@stk@cpu@cpu_has_avx512dq$qv
	dd	?live16431@128-?live16431@112
	dw	1
?patch225	equ	1
?patch224	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	390
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	391
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	392
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	393
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mjglfcia
	dw	0
	dw	4102
	dw	0
	dw	394
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	395
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$egglfcia
	dw	0
	dw	117
	dw	0
	dw	396
	dw	0
	dw	0
	dw	0
?patch221	equ	@715-@@stk@cpu@cpu_has_avx512dq$qv+72
?patch222	equ	0
?patch223	equ	@715-@@stk@cpu@cpu_has_avx512dq$qv
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
$englfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mahlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512vl$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512vl$qv	proc	near
?live16432@0:
	?debug L 1607
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @716
@717:
	mov       ebx,offset $mahlfcia
	?debug L 1613
?live16432@16: ; EBX = &$mahlfcia
	mov       eax,dword ptr [$englfcia]
	cmp       eax,-1
	je        short @721
	?debug L 1614
?live16432@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @719
	?debug L 1616
?live16432@48: ; EBX = &$mahlfcia
@720:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@721:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @720
	cmp       dword ptr [ebx],0
	jne       short @720
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
	jmp       short @724
@723:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@724:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @727
	cmp       dword ptr [ebx],0
@727:
	je        short @725
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @728
	cmp       eax,dword ptr [ebp-20]
@728:
	setne     al
	and       eax,1
	jmp       short @726
@725:
	xor       eax,eax
@726:
	test      al,al
	jne       short @723
	?debug L 1619
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
	?debug L 1621
	mov       eax,dword ptr [ebp-44]
	and       eax,-2147483648
	mov       dword ptr [$englfcia],eax
	?debug L 1622
?live16432@96: ; EBX = &$mahlfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1623
?live16432@112: ; EBX = &$mahlfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1625
?live16432@128: ; 
@729:
@719:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@716:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512vl$qv+0
	dd        @716+0
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
	dd	?patch226
	dd	?patch227
	dd	?patch228
	df	@@stk@cpu@cpu_has_avx512vl$qv
	dw	0
	dw	4194
	dw	0
	dw	397
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
	dw	398
	dw	0
	dw	0
	dw	0
	dw	?patch229
	dw	529
	dw	?patch230
	dd	?live16432@112-@@stk@cpu@cpu_has_avx512vl$qv
	dd	?live16432@128-?live16432@112
	dw	1
?patch230	equ	1
?patch229	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	399
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	400
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	401
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	402
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mahlfcia
	dw	0
	dw	4102
	dw	0
	dw	403
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	404
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$englfcia
	dw	0
	dw	117
	dw	0
	dw	405
	dw	0
	dw	0
	dw	0
?patch226	equ	@729-@@stk@cpu@cpu_has_avx512vl$qv+72
?patch227	equ	0
?patch228	equ	@729-@@stk@cpu@cpu_has_avx512vl$qv
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
$eehlfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mhhlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512ifma$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512ifma$qv	proc	near
?live16433@0:
	?debug L 1628
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @730
@731:
	mov       ebx,offset $mhhlfcia
	?debug L 1634
?live16433@16: ; EBX = &$mhhlfcia
	mov       eax,dword ptr [$eehlfcia]
	cmp       eax,-1
	je        short @735
	?debug L 1635
?live16433@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @733
	?debug L 1637
?live16433@48: ; EBX = &$mhhlfcia
@734:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@735:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @734
	cmp       dword ptr [ebx],0
	jne       short @734
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
	jmp       short @738
@737:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@738:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @741
	cmp       dword ptr [ebx],0
@741:
	je        short @739
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @742
	cmp       eax,dword ptr [ebp-20]
@742:
	setne     al
	and       eax,1
	jmp       short @740
@739:
	xor       eax,eax
@740:
	test      al,al
	jne       short @737
	?debug L 1640
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
	?debug L 1642
	mov       eax,dword ptr [ebp-44]
	and       eax,2097152
	mov       dword ptr [$eehlfcia],eax
	?debug L 1643
?live16433@96: ; EBX = &$mhhlfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1644
?live16433@112: ; EBX = &$mhhlfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1646
?live16433@128: ; 
@743:
@733:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@730:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512ifma$qv+0
	dd        @730+0
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
	dd	?patch231
	dd	?patch232
	dd	?patch233
	df	@@stk@cpu@cpu_has_avx512ifma$qv
	dw	0
	dw	4196
	dw	0
	dw	406
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
	dw	407
	dw	0
	dw	0
	dw	0
	dw	?patch234
	dw	529
	dw	?patch235
	dd	?live16433@112-@@stk@cpu@cpu_has_avx512ifma$qv
	dd	?live16433@128-?live16433@112
	dw	1
?patch235	equ	1
?patch234	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	408
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	409
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	410
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	411
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mhhlfcia
	dw	0
	dw	4102
	dw	0
	dw	412
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	413
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eehlfcia
	dw	0
	dw	117
	dw	0
	dw	414
	dw	0
	dw	0
	dw	0
?patch231	equ	@743-@@stk@cpu@cpu_has_avx512ifma$qv+72
?patch232	equ	0
?patch233	equ	@743-@@stk@cpu@cpu_has_avx512ifma$qv
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
$elhlfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mohlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512vbmi$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512vbmi$qv	proc	near
?live16434@0:
	?debug L 1649
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @744
@745:
	mov       ebx,offset $mohlfcia
	?debug L 1655
?live16434@16: ; EBX = &$mohlfcia
	mov       eax,dword ptr [$elhlfcia]
	cmp       eax,-1
	je        short @749
	?debug L 1656
?live16434@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @747
	?debug L 1658
?live16434@48: ; EBX = &$mohlfcia
@748:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@749:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @748
	cmp       dword ptr [ebx],0
	jne       short @748
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
	jmp       short @752
@751:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@752:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @755
	cmp       dword ptr [ebx],0
@755:
	je        short @753
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @756
	cmp       eax,dword ptr [ebp-20]
@756:
	setne     al
	and       eax,1
	jmp       short @754
@753:
	xor       eax,eax
@754:
	test      al,al
	jne       short @751
	?debug L 1661
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
	?debug L 1663
	mov       eax,dword ptr [ebp-36]
	and       eax,2
	mov       dword ptr [$elhlfcia],eax
	?debug L 1664
?live16434@96: ; EBX = &$mohlfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1665
?live16434@112: ; EBX = &$mohlfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1667
?live16434@128: ; 
@757:
@747:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@744:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512vbmi$qv+0
	dd        @744+0
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
	dd	?patch236
	dd	?patch237
	dd	?patch238
	df	@@stk@cpu@cpu_has_avx512vbmi$qv
	dw	0
	dw	4198
	dw	0
	dw	415
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
	dw	416
	dw	0
	dw	0
	dw	0
	dw	?patch239
	dw	529
	dw	?patch240
	dd	?live16434@112-@@stk@cpu@cpu_has_avx512vbmi$qv
	dd	?live16434@128-?live16434@112
	dw	1
?patch240	equ	1
?patch239	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	417
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	418
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	419
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	420
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mohlfcia
	dw	0
	dw	4102
	dw	0
	dw	421
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	422
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$elhlfcia
	dw	0
	dw	117
	dw	0
	dw	423
	dw	0
	dw	0
	dw	0
?patch236	equ	@757-@@stk@cpu@cpu_has_avx512vbmi$qv+74
?patch237	equ	0
?patch238	equ	@757-@@stk@cpu@cpu_has_avx512vbmi$qv
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
$ecilfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mfilfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_adx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_adx$qv	proc	near
?live16435@0:
	?debug L 1670
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @758
@759:
	mov       ebx,offset $mfilfcia
	?debug L 1676
?live16435@16: ; EBX = &$mfilfcia
	mov       eax,dword ptr [$ecilfcia]
	cmp       eax,-1
	je        short @763
	?debug L 1677
?live16435@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @761
	?debug L 1679
?live16435@48: ; EBX = &$mfilfcia
@762:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@763:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @762
	cmp       dword ptr [ebx],0
	jne       short @762
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
	jmp       short @766
@765:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@766:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @769
	cmp       dword ptr [ebx],0
@769:
	je        short @767
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @770
	cmp       eax,dword ptr [ebp-20]
@770:
	setne     al
	and       eax,1
	jmp       short @768
@767:
	xor       eax,eax
@768:
	test      al,al
	jne       short @765
	?debug L 1682
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
	?debug L 1684
	mov       eax,dword ptr [ebp-44]
	and       eax,524288
	mov       dword ptr [$ecilfcia],eax
	?debug L 1685
?live16435@96: ; EBX = &$mfilfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1686
?live16435@112: ; EBX = &$mfilfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1688
?live16435@128: ; 
@771:
@761:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@758:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_adx$qv+0
	dd        @758+0
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
	dd	?patch241
	dd	?patch242
	dd	?patch243
	df	@@stk@cpu@cpu_has_adx$qv
	dw	0
	dw	4200
	dw	0
	dw	424
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
	dw	425
	dw	0
	dw	0
	dw	0
	dw	?patch244
	dw	529
	dw	?patch245
	dd	?live16435@112-@@stk@cpu@cpu_has_adx$qv
	dd	?live16435@128-?live16435@112
	dw	1
?patch245	equ	1
?patch244	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	426
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	427
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	428
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	429
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mfilfcia
	dw	0
	dw	4102
	dw	0
	dw	430
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	431
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ecilfcia
	dw	0
	dw	117
	dw	0
	dw	432
	dw	0
	dw	0
	dw	0
?patch241	equ	@771-@@stk@cpu@cpu_has_adx$qv+72
?patch242	equ	0
?patch243	equ	@771-@@stk@cpu@cpu_has_adx$qv
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
$ejilfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mmilfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_lzcnt$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_lzcnt$qv	proc	near
?live16436@0:
	?debug L 1691
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @772
@773:
	mov       ebx,offset $mmilfcia
	?debug L 1697
?live16436@16: ; EBX = &$mmilfcia
	mov       eax,dword ptr [$ejilfcia]
	cmp       eax,-1
	je        short @777
	?debug L 1698
?live16436@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @775
	?debug L 1700
?live16436@48: ; EBX = &$mmilfcia
@776:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@777:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @776
	cmp       dword ptr [ebx],0
	jne       short @776
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
	jmp       short @780
@779:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@780:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @783
	cmp       dword ptr [ebx],0
@783:
	je        short @781
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @784
	cmp       eax,dword ptr [ebp-20]
@784:
	setne     al
	and       eax,1
	jmp       short @782
@781:
	xor       eax,eax
@782:
	test      al,al
	jne       short @779
	?debug L 1703
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
	?debug L 1705
	mov       eax,dword ptr [ebp-36]
	and       eax,32
	mov       dword ptr [$ejilfcia],eax
	?debug L 1706
?live16436@96: ; EBX = &$mmilfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1707
?live16436@112: ; EBX = &$mmilfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1709
?live16436@128: ; 
@785:
@775:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@772:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_lzcnt$qv+0
	dd        @772+0
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
	dd	?patch246
	dd	?patch247
	dd	?patch248
	df	@@stk@cpu@cpu_has_lzcnt$qv
	dw	0
	dw	4202
	dw	0
	dw	433
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
	dw	434
	dw	0
	dw	0
	dw	0
	dw	?patch249
	dw	529
	dw	?patch250
	dd	?live16436@112-@@stk@cpu@cpu_has_lzcnt$qv
	dd	?live16436@128-?live16436@112
	dw	1
?patch250	equ	1
?patch249	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	435
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	436
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	437
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	438
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mmilfcia
	dw	0
	dw	4102
	dw	0
	dw	439
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	440
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ejilfcia
	dw	0
	dw	117
	dw	0
	dw	441
	dw	0
	dw	0
	dw	0
?patch246	equ	@785-@@stk@cpu@cpu_has_lzcnt$qv+75
?patch247	equ	0
?patch248	equ	@785-@@stk@cpu@cpu_has_lzcnt$qv
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
$eajlfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mdjlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_tbm$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_tbm$qv	proc	near
?live16437@0:
	?debug L 1712
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @786
@787:
	mov       ebx,offset $mdjlfcia
	?debug L 1718
?live16437@16: ; EBX = &$mdjlfcia
	mov       eax,dword ptr [$eajlfcia]
	cmp       eax,-1
	je        short @791
	?debug L 1719
?live16437@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @789
	?debug L 1721
?live16437@48: ; EBX = &$mdjlfcia
@790:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@791:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @790
	cmp       dword ptr [ebx],0
	jne       short @790
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
	jmp       short @794
@793:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@794:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @797
	cmp       dword ptr [ebx],0
@797:
	je        short @795
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @798
	cmp       eax,dword ptr [ebp-20]
@798:
	setne     al
	and       eax,1
	jmp       short @796
@795:
	xor       eax,eax
@796:
	test      al,al
	jne       short @793
	?debug L 1724
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
	?debug L 1726
	mov       eax,dword ptr [ebp-36]
	and       eax,2097152
	mov       dword ptr [$eajlfcia],eax
	?debug L 1727
?live16437@96: ; EBX = &$mdjlfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1728
?live16437@112: ; EBX = &$mdjlfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1730
?live16437@128: ; 
@799:
@789:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@786:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_tbm$qv+0
	dd        @786+0
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
	dd	?patch251
	dd	?patch252
	dd	?patch253
	df	@@stk@cpu@cpu_has_tbm$qv
	dw	0
	dw	4204
	dw	0
	dw	442
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
	dw	443
	dw	0
	dw	0
	dw	0
	dw	?patch254
	dw	529
	dw	?patch255
	dd	?live16437@112-@@stk@cpu@cpu_has_tbm$qv
	dd	?live16437@128-?live16437@112
	dw	1
?patch255	equ	1
?patch254	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	444
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	445
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	446
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	447
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mdjlfcia
	dw	0
	dw	4102
	dw	0
	dw	448
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	449
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eajlfcia
	dw	0
	dw	117
	dw	0
	dw	450
	dw	0
	dw	0
	dw	0
?patch251	equ	@799-@@stk@cpu@cpu_has_tbm$qv+73
?patch252	equ	0
?patch253	equ	@799-@@stk@cpu@cpu_has_tbm$qv
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
$ehjlfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mkjlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_clfsh$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_clfsh$qv	proc	near
?live16438@0:
	?debug L 1733
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @800
@801:
	mov       ebx,offset $mkjlfcia
	?debug L 1739
?live16438@16: ; EBX = &$mkjlfcia
	mov       eax,dword ptr [$ehjlfcia]
	cmp       eax,-1
	je        short @805
	?debug L 1740
?live16438@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @803
	?debug L 1742
?live16438@48: ; EBX = &$mkjlfcia
@804:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@805:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @804
	cmp       dword ptr [ebx],0
	jne       short @804
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
	jmp       short @808
@807:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@808:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @811
	cmp       dword ptr [ebx],0
@811:
	je        short @809
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @812
	cmp       eax,dword ptr [ebp-20]
@812:
	setne     al
	and       eax,1
	jmp       short @810
@809:
	xor       eax,eax
@810:
	test      al,al
	jne       short @807
	?debug L 1745
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
	?debug L 1747
	mov       eax,dword ptr [ebp-36]
	and       eax,524288
	mov       dword ptr [$ehjlfcia],eax
	?debug L 1748
?live16438@96: ; EBX = &$mkjlfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1749
?live16438@112: ; EBX = &$mkjlfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1751
?live16438@128: ; 
@813:
@803:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@800:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_clfsh$qv+0
	dd        @800+0
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
	dd	?patch256
	dd	?patch257
	dd	?patch258
	df	@@stk@cpu@cpu_has_clfsh$qv
	dw	0
	dw	4206
	dw	0
	dw	451
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
	dw	452
	dw	0
	dw	0
	dw	0
	dw	?patch259
	dw	529
	dw	?patch260
	dd	?live16438@112-@@stk@cpu@cpu_has_clfsh$qv
	dd	?live16438@128-?live16438@112
	dw	1
?patch260	equ	1
?patch259	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	453
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	454
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	455
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	456
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mkjlfcia
	dw	0
	dw	4102
	dw	0
	dw	457
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	458
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ehjlfcia
	dw	0
	dw	117
	dw	0
	dw	459
	dw	0
	dw	0
	dw	0
?patch256	equ	@813-@@stk@cpu@cpu_has_clfsh$qv+72
?patch257	equ	0
?patch258	equ	@813-@@stk@cpu@cpu_has_clfsh$qv
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
$eojlfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mbklfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_pclmulqdq$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_pclmulqdq$qv	proc	near
?live16439@0:
	?debug L 1754
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @814
@815:
	mov       ebx,offset $mbklfcia
	?debug L 1760
?live16439@16: ; EBX = &$mbklfcia
	mov       eax,dword ptr [$eojlfcia]
	cmp       eax,-1
	je        short @819
	?debug L 1761
?live16439@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @817
	?debug L 1763
?live16439@48: ; EBX = &$mbklfcia
@818:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@819:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @818
	cmp       dword ptr [ebx],0
	jne       short @818
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
	jmp       short @822
@821:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@822:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @825
	cmp       dword ptr [ebx],0
@825:
	je        short @823
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @826
	cmp       eax,dword ptr [ebp-20]
@826:
	setne     al
	and       eax,1
	jmp       short @824
@823:
	xor       eax,eax
@824:
	test      al,al
	jne       short @821
	?debug L 1766
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
	?debug L 1768
	mov       eax,dword ptr [ebp-36]
	and       eax,32
	mov       dword ptr [$eojlfcia],eax
	?debug L 1769
?live16439@96: ; EBX = &$mbklfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1770
?live16439@112: ; EBX = &$mbklfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1772
?live16439@128: ; 
@827:
@817:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@814:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_pclmulqdq$qv+0
	dd        @814+0
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
	dd	?patch261
	dd	?patch262
	dd	?patch263
	df	@@stk@cpu@cpu_has_pclmulqdq$qv
	dw	0
	dw	4208
	dw	0
	dw	460
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
	dw	461
	dw	0
	dw	0
	dw	0
	dw	?patch264
	dw	529
	dw	?patch265
	dd	?live16439@112-@@stk@cpu@cpu_has_pclmulqdq$qv
	dd	?live16439@128-?live16439@112
	dw	1
?patch265	equ	1
?patch264	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	462
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	463
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	464
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	465
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mbklfcia
	dw	0
	dw	4102
	dw	0
	dw	466
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	467
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eojlfcia
	dw	0
	dw	117
	dw	0
	dw	468
	dw	0
	dw	0
	dw	0
?patch261	equ	@827-@@stk@cpu@cpu_has_pclmulqdq$qv+74
?patch262	equ	0
?patch263	equ	@827-@@stk@cpu@cpu_has_pclmulqdq$qv
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
$efklfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$miklfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_fxsr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_fxsr$qv	proc	near
?live16440@0:
	?debug L 1775
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @828
@829:
	mov       ebx,offset $miklfcia
	?debug L 1781
?live16440@16: ; EBX = &$miklfcia
	mov       eax,dword ptr [$efklfcia]
	cmp       eax,-1
	je        short @833
	?debug L 1782
?live16440@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @831
	?debug L 1784
?live16440@48: ; EBX = &$miklfcia
@832:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@833:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @832
	cmp       dword ptr [ebx],0
	jne       short @832
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
	jmp       short @836
@835:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@836:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @839
	cmp       dword ptr [ebx],0
@839:
	je        short @837
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @840
	cmp       eax,dword ptr [ebp-20]
@840:
	setne     al
	and       eax,1
	jmp       short @838
@837:
	xor       eax,eax
@838:
	test      al,al
	jne       short @835
	?debug L 1787
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
	?debug L 1789
	mov       eax,dword ptr [ebp-36]
	and       eax,16777216
	mov       dword ptr [$efklfcia],eax
	?debug L 1790
?live16440@96: ; EBX = &$miklfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1791
?live16440@112: ; EBX = &$miklfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1793
?live16440@128: ; 
@841:
@831:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@828:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_fxsr$qv+0
	dd        @828+0
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
	dd	?patch266
	dd	?patch267
	dd	?patch268
	df	@@stk@cpu@cpu_has_fxsr$qv
	dw	0
	dw	4210
	dw	0
	dw	469
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
	dw	470
	dw	0
	dw	0
	dw	0
	dw	?patch269
	dw	529
	dw	?patch270
	dd	?live16440@112-@@stk@cpu@cpu_has_fxsr$qv
	dd	?live16440@128-?live16440@112
	dw	1
?patch270	equ	1
?patch269	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	471
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	472
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	473
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	474
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$miklfcia
	dw	0
	dw	4102
	dw	0
	dw	475
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	476
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$efklfcia
	dw	0
	dw	117
	dw	0
	dw	477
	dw	0
	dw	0
	dw	0
?patch266	equ	@841-@@stk@cpu@cpu_has_fxsr$qv+72
?patch267	equ	0
?patch268	equ	@841-@@stk@cpu@cpu_has_fxsr$qv
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
$emklfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mpklfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_ss$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_ss$qv	proc	near
?live16441@0:
	?debug L 1796
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @842
@843:
	mov       ebx,offset $mpklfcia
	?debug L 1802
?live16441@16: ; EBX = &$mpklfcia
	mov       eax,dword ptr [$emklfcia]
	cmp       eax,-1
	je        short @847
	?debug L 1803
?live16441@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @845
	?debug L 1805
?live16441@48: ; EBX = &$mpklfcia
@846:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@847:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @846
	cmp       dword ptr [ebx],0
	jne       short @846
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
	jmp       short @850
@849:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@850:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @853
	cmp       dword ptr [ebx],0
@853:
	je        short @851
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @854
	cmp       eax,dword ptr [ebp-20]
@854:
	setne     al
	and       eax,1
	jmp       short @852
@851:
	xor       eax,eax
@852:
	test      al,al
	jne       short @849
	?debug L 1808
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
	?debug L 1810
	mov       eax,dword ptr [ebp-36]
	and       eax,134217728
	mov       dword ptr [$emklfcia],eax
	?debug L 1811
?live16441@96: ; EBX = &$mpklfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1812
?live16441@112: ; EBX = &$mpklfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1814
?live16441@128: ; 
@855:
@845:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@842:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_ss$qv+0
	dd        @842+0
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
	dd	?patch271
	dd	?patch272
	dd	?patch273
	df	@@stk@cpu@cpu_has_ss$qv
	dw	0
	dw	4212
	dw	0
	dw	478
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
	dw	479
	dw	0
	dw	0
	dw	0
	dw	?patch274
	dw	529
	dw	?patch275
	dd	?live16441@112-@@stk@cpu@cpu_has_ss$qv
	dd	?live16441@128-?live16441@112
	dw	1
?patch275	equ	1
?patch274	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	480
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	481
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	482
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	483
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mpklfcia
	dw	0
	dw	4102
	dw	0
	dw	484
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	485
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$emklfcia
	dw	0
	dw	117
	dw	0
	dw	486
	dw	0
	dw	0
	dw	0
?patch271	equ	@855-@@stk@cpu@cpu_has_ss$qv+72
?patch272	equ	0
?patch273	equ	@855-@@stk@cpu@cpu_has_ss$qv
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
$edllfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mgllfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_mtrr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mtrr$qv	proc	near
?live16442@0:
	?debug L 1817
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @856
@857:
	mov       ebx,offset $mgllfcia
	?debug L 1823
?live16442@16: ; EBX = &$mgllfcia
	mov       eax,dword ptr [$edllfcia]
	cmp       eax,-1
	je        short @861
	?debug L 1824
?live16442@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @859
	?debug L 1826
?live16442@48: ; EBX = &$mgllfcia
@860:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@861:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @860
	cmp       dword ptr [ebx],0
	jne       short @860
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
	jmp       short @864
@863:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@864:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @867
	cmp       dword ptr [ebx],0
@867:
	je        short @865
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @868
	cmp       eax,dword ptr [ebp-20]
@868:
	setne     al
	and       eax,1
	jmp       short @866
@865:
	xor       eax,eax
@866:
	test      al,al
	jne       short @863
	?debug L 1829
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
	?debug L 1831
	mov       eax,dword ptr [ebp-36]
	and       eax,4096
	mov       dword ptr [$edllfcia],eax
	?debug L 1832
?live16442@96: ; EBX = &$mgllfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1833
?live16442@112: ; EBX = &$mgllfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1835
?live16442@128: ; 
@869:
@859:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@856:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_mtrr$qv+0
	dd        @856+0
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
	dd	?patch276
	dd	?patch277
	dd	?patch278
	df	@@stk@cpu@cpu_has_mtrr$qv
	dw	0
	dw	4214
	dw	0
	dw	487
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
	dw	488
	dw	0
	dw	0
	dw	0
	dw	?patch279
	dw	529
	dw	?patch280
	dd	?live16442@112-@@stk@cpu@cpu_has_mtrr$qv
	dd	?live16442@128-?live16442@112
	dw	1
?patch280	equ	1
?patch279	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	489
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	490
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	491
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	492
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mgllfcia
	dw	0
	dw	4102
	dw	0
	dw	493
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	494
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$edllfcia
	dw	0
	dw	117
	dw	0
	dw	495
	dw	0
	dw	0
	dw	0
?patch276	equ	@869-@@stk@cpu@cpu_has_mtrr$qv+72
?patch277	equ	0
?patch278	equ	@869-@@stk@cpu@cpu_has_mtrr$qv
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
$ekllfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mnllfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_msr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_msr$qv	proc	near
?live16443@0:
	?debug L 1838
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @870
@871:
	mov       ebx,offset $mnllfcia
	?debug L 1844
?live16443@16: ; EBX = &$mnllfcia
	mov       eax,dword ptr [$ekllfcia]
	cmp       eax,-1
	je        short @875
	?debug L 1845
?live16443@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @873
	?debug L 1847
?live16443@48: ; EBX = &$mnllfcia
@874:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@875:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @874
	cmp       dword ptr [ebx],0
	jne       short @874
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
	jmp       short @878
@877:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@878:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @881
	cmp       dword ptr [ebx],0
@881:
	je        short @879
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @882
	cmp       eax,dword ptr [ebp-20]
@882:
	setne     al
	and       eax,1
	jmp       short @880
@879:
	xor       eax,eax
@880:
	test      al,al
	jne       short @877
	?debug L 1850
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
	?debug L 1852
	mov       eax,dword ptr [ebp-36]
	and       eax,4096
	mov       dword ptr [$ekllfcia],eax
	?debug L 1853
?live16443@96: ; EBX = &$mnllfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1854
?live16443@112: ; EBX = &$mnllfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1856
?live16443@128: ; 
@883:
@873:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@870:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_msr$qv+0
	dd        @870+0
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
	dd	?patch281
	dd	?patch282
	dd	?patch283
	df	@@stk@cpu@cpu_has_msr$qv
	dw	0
	dw	4216
	dw	0
	dw	496
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
	dw	497
	dw	0
	dw	0
	dw	0
	dw	?patch284
	dw	529
	dw	?patch285
	dd	?live16443@112-@@stk@cpu@cpu_has_msr$qv
	dd	?live16443@128-?live16443@112
	dw	1
?patch285	equ	1
?patch284	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	498
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	499
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	500
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	501
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mnllfcia
	dw	0
	dw	4102
	dw	0
	dw	502
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	503
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ekllfcia
	dw	0
	dw	117
	dw	0
	dw	504
	dw	0
	dw	0
	dw	0
?patch281	equ	@883-@@stk@cpu@cpu_has_msr$qv+72
?patch282	equ	0
?patch283	equ	@883-@@stk@cpu@cpu_has_msr$qv
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
$ebmlfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$memlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_tsc$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_tsc$qv	proc	near
?live16444@0:
	?debug L 1859
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @884
@885:
	mov       ebx,offset $memlfcia
	?debug L 1865
?live16444@16: ; EBX = &$memlfcia
	mov       eax,dword ptr [$ebmlfcia]
	cmp       eax,-1
	je        short @889
	?debug L 1866
?live16444@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @887
	?debug L 1868
?live16444@48: ; EBX = &$memlfcia
@888:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@889:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @888
	cmp       dword ptr [ebx],0
	jne       short @888
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
	jmp       short @892
@891:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@892:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @895
	cmp       dword ptr [ebx],0
@895:
	je        short @893
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @896
	cmp       eax,dword ptr [ebp-20]
@896:
	setne     al
	and       eax,1
	jmp       short @894
@893:
	xor       eax,eax
@894:
	test      al,al
	jne       short @891
	?debug L 1871
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
	?debug L 1873
	mov       eax,dword ptr [ebp-28]
	and       eax,16
	mov       dword ptr [$ebmlfcia],eax
	?debug L 1874
?live16444@96: ; EBX = &$memlfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1875
?live16444@112: ; EBX = &$memlfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1877
?live16444@128: ; 
@897:
@887:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@884:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_tsc$qv+0
	dd        @884+0
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
	dd	?patch286
	dd	?patch287
	dd	?patch288
	df	@@stk@cpu@cpu_has_tsc$qv
	dw	0
	dw	4218
	dw	0
	dw	505
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
	dw	506
	dw	0
	dw	0
	dw	0
	dw	?patch289
	dw	529
	dw	?patch290
	dd	?live16444@112-@@stk@cpu@cpu_has_tsc$qv
	dd	?live16444@128-?live16444@112
	dw	1
?patch290	equ	1
?patch289	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	507
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	508
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	509
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	510
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$memlfcia
	dw	0
	dw	4102
	dw	0
	dw	511
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	512
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ebmlfcia
	dw	0
	dw	117
	dw	0
	dw	513
	dw	0
	dw	0
	dw	0
?patch286	equ	@897-@@stk@cpu@cpu_has_tsc$qv+74
?patch287	equ	0
?patch288	equ	@897-@@stk@cpu@cpu_has_tsc$qv
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
$eimlfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mlmlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_psn$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_psn$qv	proc	near
?live16445@0:
	?debug L 1880
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @898
@899:
	mov       ebx,offset $mlmlfcia
	?debug L 1886
?live16445@16: ; EBX = &$mlmlfcia
	mov       eax,dword ptr [$eimlfcia]
	cmp       eax,-1
	je        short @903
	?debug L 1887
?live16445@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @901
	?debug L 1889
?live16445@48: ; EBX = &$mlmlfcia
@902:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@903:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @902
	cmp       dword ptr [ebx],0
	jne       short @902
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
	jmp       short @906
@905:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@906:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @909
	cmp       dword ptr [ebx],0
@909:
	je        short @907
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @910
	cmp       eax,dword ptr [ebp-20]
@910:
	setne     al
	and       eax,1
	jmp       short @908
@907:
	xor       eax,eax
@908:
	test      al,al
	jne       short @905
	?debug L 1892
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
	?debug L 1894
	mov       eax,dword ptr [ebp-28]
	and       eax,262144
	mov       dword ptr [$eimlfcia],eax
	?debug L 1895
?live16445@96: ; EBX = &$mlmlfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1896
?live16445@112: ; EBX = &$mlmlfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1898
?live16445@128: ; 
@911:
@901:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@898:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_psn$qv+0
	dd        @898+0
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
	dd	?patch291
	dd	?patch292
	dd	?patch293
	df	@@stk@cpu@cpu_has_psn$qv
	dw	0
	dw	4220
	dw	0
	dw	514
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
	dw	515
	dw	0
	dw	0
	dw	0
	dw	?patch294
	dw	529
	dw	?patch295
	dd	?live16445@112-@@stk@cpu@cpu_has_psn$qv
	dd	?live16445@128-?live16445@112
	dw	1
?patch295	equ	1
?patch294	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	516
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	517
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	518
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	519
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mlmlfcia
	dw	0
	dw	4102
	dw	0
	dw	520
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	521
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eimlfcia
	dw	0
	dw	117
	dw	0
	dw	522
	dw	0
	dw	0
	dw	0
?patch291	equ	@911-@@stk@cpu@cpu_has_psn$qv+72
?patch292	equ	0
?patch293	equ	@911-@@stk@cpu@cpu_has_psn$qv
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
$epmlfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mcnlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_xsave$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_xsave$qv	proc	near
?live16446@0:
	?debug L 1901
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @912
@913:
	mov       ebx,offset $mcnlfcia
	?debug L 1907
?live16446@16: ; EBX = &$mcnlfcia
	mov       eax,dword ptr [$epmlfcia]
	cmp       eax,-1
	je        short @917
	?debug L 1908
?live16446@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @915
	?debug L 1910
?live16446@48: ; EBX = &$mcnlfcia
@916:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@917:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @916
	cmp       dword ptr [ebx],0
	jne       short @916
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
	jmp       short @920
@919:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@920:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @923
	cmp       dword ptr [ebx],0
@923:
	je        short @921
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @924
	cmp       eax,dword ptr [ebp-20]
@924:
	setne     al
	and       eax,1
	jmp       short @922
@921:
	xor       eax,eax
@922:
	test      al,al
	jne       short @919
	?debug L 1913
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
	?debug L 1915
	mov       eax,dword ptr [ebp-36]
	mov       edx,dword ptr [ebp-36]
	and       edx,134217728
	and       eax,67108864
	shr       edx,27
	?debug L 1913
	add       esp,24
	?debug L 1915
	shr       eax,26
	and       eax,edx
	?debug L 1917
?live16446@128: ; EBX = &$mcnlfcia, EAX = ret
	push      8
	?debug L 1916
?live16446@144: ; EBX = &$mcnlfcia, EAX = @temp3
	test      eax,eax
	?debug L 1915
?live16446@160: ; EBX = &$mcnlfcia
	mov       dword ptr [$epmlfcia],eax
	?debug L 1916
?live16446@176: ; EBX = &$mcnlfcia, EAX = @temp3
	setne     cl
	and       ecx,1
	?debug L 1917
?live16446@192: ; EBX = &$mcnlfcia, EAX = ret
	push      ebx
	?debug L 1916
?live16446@208: ; EBX = &$mcnlfcia, EAX = @temp3
	mov       eax,ecx
	?debug L 1917
?live16446@224: ; EBX = &$mcnlfcia, EAX = ret
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1919
?live16446@240: ; 
@925:
@915:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@912:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_xsave$qv+0
	dd        @912+0
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
	dd	?patch296
	dd	?patch297
	dd	?patch298
	df	@@stk@cpu@cpu_has_xsave$qv
	dw	0
	dw	4222
	dw	0
	dw	523
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
	dw	524
	dw	0
	dw	0
	dw	0
	dw	?patch299
	dw	529
	dw	?patch300
	dd	?live16446@128-@@stk@cpu@cpu_has_xsave$qv
	dd	?live16446@144-?live16446@128
	dw	1
	dd	?live16446@192-@@stk@cpu@cpu_has_xsave$qv
	dd	?live16446@208-?live16446@192
	dw	1
	dd	?live16446@224-@@stk@cpu@cpu_has_xsave$qv
	dd	?live16446@240-?live16446@224
	dw	1
?patch300	equ	3
?patch299	equ	34
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	525
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	526
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	527
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	528
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mcnlfcia
	dw	0
	dw	4102
	dw	0
	dw	529
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	530
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$epmlfcia
	dw	0
	dw	117
	dw	0
	dw	531
	dw	0
	dw	0
	dw	0
?patch296	equ	@925-@@stk@cpu@cpu_has_xsave$qv+75
?patch297	equ	0
?patch298	equ	@925-@@stk@cpu@cpu_has_xsave$qv
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
$egnlfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mjnlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_clmul$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_clmul$qv	proc	near
?live16447@0:
	?debug L 1922
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @926
@927:
	mov       ebx,offset $mjnlfcia
	?debug L 1928
?live16447@16: ; EBX = &$mjnlfcia
	mov       eax,dword ptr [$egnlfcia]
	cmp       eax,-1
	je        short @931
	?debug L 1929
?live16447@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @929
	?debug L 1931
?live16447@48: ; EBX = &$mjnlfcia
@930:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@931:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @930
	cmp       dword ptr [ebx],0
	jne       short @930
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
	jmp       short @934
@933:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@934:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @937
	cmp       dword ptr [ebx],0
@937:
	je        short @935
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @938
	cmp       eax,dword ptr [ebp-20]
@938:
	setne     al
	and       eax,1
	jmp       short @936
@935:
	xor       eax,eax
@936:
	test      al,al
	jne       short @933
	?debug L 1934
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
	?debug L 1936
	mov       eax,dword ptr [ebp-36]
	and       eax,4
	mov       dword ptr [$egnlfcia],eax
	?debug L 1937
?live16447@96: ; EBX = &$mjnlfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 1938
?live16447@112: ; EBX = &$mjnlfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1940
?live16447@128: ; 
@939:
@929:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@926:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_clmul$qv+0
	dd        @926+0
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
	dd	?patch301
	dd	?patch302
	dd	?patch303
	df	@@stk@cpu@cpu_has_clmul$qv
	dw	0
	dw	4224
	dw	0
	dw	532
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
	dw	533
	dw	0
	dw	0
	dw	0
	dw	?patch304
	dw	529
	dw	?patch305
	dd	?live16447@112-@@stk@cpu@cpu_has_clmul$qv
	dd	?live16447@128-?live16447@112
	dw	1
?patch305	equ	1
?patch304	equ	14
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
	df	$mjnlfcia
	dw	0
	dw	4102
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
	df	$egnlfcia
	dw	0
	dw	117
	dw	0
	dw	540
	dw	0
	dw	0
	dw	0
?patch301	equ	@939-@@stk@cpu@cpu_has_clmul$qv+74
?patch302	equ	0
?patch303	equ	@939-@@stk@cpu@cpu_has_clmul$qv
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
$ennlfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$maolfcia	label	dword
	dd	0
	dd	0
	dd	0
	db	1	dup(?)
	align	4
$eeolfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_psn$qv	segment virtual
	align	2
@@stk@cpu@cpu_psn$qv	proc	near
?live16448@0:
	?debug L 1943
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @940
@941:
	mov       ebx,offset $eeolfcia
	mov       esi,offset $maolfcia
	?debug L 1950
?live16448@16: ; EBX = &$eeolfcia, ESI = &$maolfcia
	cmp       dword ptr [$ennlfcia],-1
	je        short @945
	?debug L 1951
?live16448@32: ; ESI = &$maolfcia
	mov       eax,esi
	jmp       @943
	?debug L 1953
?live16448@48: ; EBX = &$eeolfcia, ESI = &$maolfcia
@944:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@945:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @944
	cmp       dword ptr [ebx],0
	jne       short @944
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
	jmp       short @948
@947:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@948:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @951
	cmp       dword ptr [ebx],0
@951:
	je        short @949
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @952
	cmp       eax,dword ptr [ebp-20]
@952:
	setne     cl
	and       ecx,1
	jmp       short @950
@949:
	xor       ecx,ecx
@950:
	test      cl,cl
	jne       short @947
	?debug L 1955
	push      4
	push      esi
	call      _CG_D_EP
	xor       eax,eax
	mov       dword ptr [esi],eax
	?debug L 1956
	push      4
	push      esi
	push      4
	call      _CG_DA_EPY
	xor       edx,edx
	mov       dword ptr [esi+4],edx
	?debug L 1957
	push      4
	push      esi
	push      8
	call      _CG_DA_EPY
	xor       eax,eax
	mov       dword ptr [esi+8],eax
	?debug L 1958
	call      @@stk@cpu@cpu_has_psn$qv
	test      al,al
	jne       short @953
	?debug L 1959
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1960
?live16448@144: ; ESI = &$maolfcia
	mov       eax,esi
	jmp       short @943
	?debug L 1964
?live16448@160: ; EBX = &$eeolfcia, ESI = &$maolfcia
@953:
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
	?debug L 1966
	mov       ecx,dword ptr [ebp-52]
	push      4
	push      esi
	push      8
	call      _CG_DA_EPY
	mov       dword ptr [esi+8],ecx
	?debug L 1967
	mov       eax,dword ptr [ebp-28]
	push      4
	push      esi
	push      4
	call      _CG_DA_EPY
	mov       dword ptr [esi+4],eax
	?debug L 1968
	mov       edx,dword ptr [ebp-36]
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],edx
	?debug L 1969
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 1970
?live16448@240: ; ESI = &$maolfcia
	mov       eax,esi
	?debug L 1969
?live16448@256: ; EBX = &$eeolfcia, ESI = &$maolfcia
	mov       dword ptr [ebx+4],0
	?debug L 1971
?live16448@272: ; 
@954:
@943:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@940:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_psn$qv+0
	dd        @940+0
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
	dd	?patch306
	dd	?patch307
	dd	?patch308
	df	@@stk@cpu@cpu_psn$qv
	dw	0
	dw	4226
	dw	0
	dw	541
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
	df	$eeolfcia
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
	df	$maolfcia
	dw	0
	dw	4228
	dw	0
	dw	548
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ennlfcia
	dw	0
	dw	117
	dw	0
	dw	549
	dw	0
	dw	0
	dw	0
?patch306	equ	@954-@@stk@cpu@cpu_psn$qv+75
?patch307	equ	0
?patch308	equ	@954-@@stk@cpu@cpu_psn$qv
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
$mholfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elolfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_fma$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_fma$qv	proc	near
?live16449@0:
	?debug L 1974
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @955
@956:
	mov       ebx,offset $elolfcia
	?debug L 1980
?live16449@16: ; EBX = &$elolfcia
	mov       eax,dword ptr [$mholfcia]
	cmp       eax,-1
	jne       @958
	?debug L 1981
?live16449@32: ; EAX = @temp3
	jmp       short @960
	?debug L 1983
?live16449@48: ; EBX = &$elolfcia
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
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [ebx+4],edx
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
	setne     cl
	and       ecx,1
	jmp       short @965
@964:
	xor       ecx,ecx
@965:
	test      cl,cl
	jne       short @962
	?debug L 1986
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
	?debug L 1988
	test      byte ptr [ebp-35],16
	je        short @968
	?debug L 1989
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
	?debug L 1990
	test      byte ptr [ebp-34],1
	je        short @969
	?debug L 1991
	mov       dword ptr [$mholfcia],4
	jmp       short @970
	?debug L 1993
@969:
	mov       dword ptr [$mholfcia],3
	?debug L 1994
	jmp       short @970
	?debug L 1996
@968:
	xor       eax,eax
	mov       dword ptr [$mholfcia],eax
	?debug L 1998
@970:
	cmp       dword ptr [$mholfcia],0
	setne     al
	and       eax,1
	?debug L 1999
?live16449@208: ; EBX = &$elolfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	?debug L 2000
?live16449@224: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	?debug L 1999
?live16449@240: ; EBX = &$elolfcia, EAX = ret
	mov       dword ptr [ebx+4],0
	?debug L 2000
?live16449@256: ; EAX = ret
	mov       eax,edx
	?debug L 2001
?live16449@272: ; 
@971:
@958:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@955:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_fma$qv+0
	dd        @955+0
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
	dd	?patch309
	dd	?patch310
	dd	?patch311
	df	@@stk@cpu@cpu_has_fma$qv
	dw	0
	dw	4229
	dw	0
	dw	550
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
	dw	551
	dw	0
	dw	0
	dw	0
	dw	?patch312
	dw	529
	dw	?patch313
	dd	?live16449@208-@@stk@cpu@cpu_has_fma$qv
	dd	?live16449@272-?live16449@208
	dw	1
?patch313	equ	1
?patch312	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	552
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	553
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	554
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	555
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$elolfcia
	dw	0
	dw	4102
	dw	0
	dw	556
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	557
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mholfcia
	dw	0
	dw	117
	dw	0
	dw	558
	dw	0
	dw	0
	dw	0
?patch309	equ	@971-@@stk@cpu@cpu_has_fma$qv+75
?patch310	equ	0
?patch311	equ	@971-@@stk@cpu@cpu_has_fma$qv
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
$moolfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ecplfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_aes$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_aes$qv	proc	near
?live16450@0:
	?debug L 2004
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @972
@973:
	mov       ebx,offset $ecplfcia
	?debug L 2010
?live16450@16: ; EBX = &$ecplfcia
	mov       eax,dword ptr [$moolfcia]
	cmp       eax,-1
	je        short @977
	?debug L 2011
?live16450@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @975
	?debug L 2013
?live16450@48: ; EBX = &$ecplfcia
@976:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@977:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @976
	cmp       dword ptr [ebx],0
	jne       short @976
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
	jmp       short @980
@979:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@980:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @983
	cmp       dword ptr [ebx],0
@983:
	je        short @981
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @984
	cmp       eax,dword ptr [ebp-20]
@984:
	setne     al
	and       eax,1
	jmp       short @982
@981:
	xor       eax,eax
@982:
	test      al,al
	jne       short @979
	?debug L 2016
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
	?debug L 2018
	mov       eax,dword ptr [ebp-36]
	and       eax,33554432
	mov       dword ptr [$moolfcia],eax
	?debug L 2019
?live16450@96: ; EBX = &$ecplfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2020
?live16450@112: ; EBX = &$ecplfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2022
?live16450@128: ; 
@985:
@975:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@972:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_aes$qv+0
	dd        @972+0
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
	dd	?patch314
	dd	?patch315
	dd	?patch316
	df	@@stk@cpu@cpu_has_aes$qv
	dw	0
	dw	4231
	dw	0
	dw	559
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
	dw	560
	dw	0
	dw	0
	dw	0
	dw	?patch317
	dw	529
	dw	?patch318
	dd	?live16450@112-@@stk@cpu@cpu_has_aes$qv
	dd	?live16450@128-?live16450@112
	dw	1
?patch318	equ	1
?patch317	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	561
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	562
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	563
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	564
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ecplfcia
	dw	0
	dw	4102
	dw	0
	dw	565
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	566
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$moolfcia
	dw	0
	dw	117
	dw	0
	dw	567
	dw	0
	dw	0
	dw	0
?patch314	equ	@985-@@stk@cpu@cpu_has_aes$qv+72
?patch315	equ	0
?patch316	equ	@985-@@stk@cpu@cpu_has_aes$qv
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
$mfplfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ejplfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viaaes$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viaaes$qv	proc	near
?live16451@0:
	?debug L 2025
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @986
@987:
	mov       ebx,offset $ejplfcia
	?debug L 2031
?live16451@16: ; EBX = &$ejplfcia
	mov       eax,dword ptr [$mfplfcia]
	cmp       eax,-1
	je        short @991
	?debug L 2032
?live16451@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @989
	?debug L 2034
?live16451@48: ; EBX = &$ejplfcia
@990:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@991:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @990
	cmp       dword ptr [ebx],0
	jne       short @990
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
	jmp       short @994
@993:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@994:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @997
	cmp       dword ptr [ebx],0
@997:
	je        short @995
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @998
	cmp       eax,dword ptr [ebp-20]
@998:
	setne     al
	and       eax,1
	jmp       short @996
@995:
	xor       eax,eax
@996:
	test      al,al
	jne       short @993
	?debug L 2037
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
	?debug L 2039
	mov       eax,dword ptr [ebp-28]
	and       eax,128
	mov       dword ptr [$mfplfcia],eax
	?debug L 2040
?live16451@96: ; EBX = &$ejplfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2041
?live16451@112: ; EBX = &$ejplfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2043
?live16451@128: ; 
@999:
@989:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@986:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_viaaes$qv+0
	dd        @986+0
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
	dd	?patch319
	dd	?patch320
	dd	?patch321
	df	@@stk@cpu@cpu_has_viaaes$qv
	dw	0
	dw	4233
	dw	0
	dw	568
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
	dw	569
	dw	0
	dw	0
	dw	0
	dw	?patch322
	dw	529
	dw	?patch323
	dd	?live16451@112-@@stk@cpu@cpu_has_viaaes$qv
	dd	?live16451@128-?live16451@112
	dw	1
?patch323	equ	1
?patch322	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	570
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	571
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	572
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	573
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ejplfcia
	dw	0
	dw	4102
	dw	0
	dw	574
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	575
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mfplfcia
	dw	0
	dw	117
	dw	0
	dw	576
	dw	0
	dw	0
	dw	0
?patch319	equ	@999-@@stk@cpu@cpu_has_viaaes$qv+73
?patch320	equ	0
?patch321	equ	@999-@@stk@cpu@cpu_has_viaaes$qv
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
$mmplfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eaamfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viarng$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viarng$qv	proc	near
?live16452@0:
	?debug L 2046
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @1000
@1001:
	mov       ebx,offset $eaamfcia
	?debug L 2052
?live16452@16: ; EBX = &$eaamfcia
	mov       eax,dword ptr [$mmplfcia]
	cmp       eax,-1
	je        short @1005
	?debug L 2053
?live16452@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @1003
	?debug L 2055
?live16452@48: ; EBX = &$eaamfcia
@1004:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1005:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1004
	cmp       dword ptr [ebx],0
	jne       short @1004
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
	jmp       short @1008
@1007:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1008:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1011
	cmp       dword ptr [ebx],0
@1011:
	je        short @1009
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @1012
	cmp       eax,dword ptr [ebp-20]
@1012:
	setne     al
	and       eax,1
	jmp       short @1010
@1009:
	xor       eax,eax
@1010:
	test      al,al
	jne       short @1007
	?debug L 2058
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
	?debug L 2060
	mov       eax,dword ptr [ebp-28]
	and       eax,8
	mov       dword ptr [$mmplfcia],eax
	?debug L 2061
?live16452@96: ; EBX = &$eaamfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2062
?live16452@112: ; EBX = &$eaamfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2064
?live16452@128: ; 
@1013:
@1003:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1000:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_viarng$qv+0
	dd        @1000+0
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
	dd	?patch324
	dd	?patch325
	dd	?patch326
	df	@@stk@cpu@cpu_has_viarng$qv
	dw	0
	dw	4235
	dw	0
	dw	577
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
	dw	578
	dw	0
	dw	0
	dw	0
	dw	?patch327
	dw	529
	dw	?patch328
	dd	?live16452@112-@@stk@cpu@cpu_has_viarng$qv
	dd	?live16452@128-?live16452@112
	dw	1
?patch328	equ	1
?patch327	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	579
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	580
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	581
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	582
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eaamfcia
	dw	0
	dw	4102
	dw	0
	dw	583
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	584
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mmplfcia
	dw	0
	dw	117
	dw	0
	dw	585
	dw	0
	dw	0
	dw	0
?patch324	equ	@1013-@@stk@cpu@cpu_has_viarng$qv+75
?patch325	equ	0
?patch326	equ	@1013-@@stk@cpu@cpu_has_viarng$qv
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
$mdamfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ehamfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viahash$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viahash$qv	proc	near
?live16453@0:
	?debug L 2067
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @1014
@1015:
	mov       ebx,offset $ehamfcia
	?debug L 2073
?live16453@16: ; EBX = &$ehamfcia
	mov       eax,dword ptr [$mdamfcia]
	cmp       eax,-1
	je        short @1019
	?debug L 2074
?live16453@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @1017
	?debug L 2076
?live16453@48: ; EBX = &$ehamfcia
@1018:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1019:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1018
	cmp       dword ptr [ebx],0
	jne       short @1018
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
	jmp       short @1022
@1021:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1022:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1025
	cmp       dword ptr [ebx],0
@1025:
	je        short @1023
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @1026
	cmp       eax,dword ptr [ebp-20]
@1026:
	setne     al
	and       eax,1
	jmp       short @1024
@1023:
	xor       eax,eax
@1024:
	test      al,al
	jne       short @1021
	?debug L 2079
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
	?debug L 2081
	mov       eax,dword ptr [ebp-28]
	and       eax,2048
	mov       dword ptr [$mdamfcia],eax
	?debug L 2082
?live16453@96: ; EBX = &$ehamfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2083
?live16453@112: ; EBX = &$ehamfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2085
?live16453@128: ; 
@1027:
@1017:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1014:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_viahash$qv+0
	dd        @1014+0
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
	dd	?patch329
	dd	?patch330
	dd	?patch331
	df	@@stk@cpu@cpu_has_viahash$qv
	dw	0
	dw	4237
	dw	0
	dw	586
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
	dw	587
	dw	0
	dw	0
	dw	0
	dw	?patch332
	dw	529
	dw	?patch333
	dd	?live16453@112-@@stk@cpu@cpu_has_viahash$qv
	dd	?live16453@128-?live16453@112
	dw	1
?patch333	equ	1
?patch332	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	588
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	589
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	590
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	591
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ehamfcia
	dw	0
	dw	4102
	dw	0
	dw	592
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	593
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mdamfcia
	dw	0
	dw	117
	dw	0
	dw	594
	dw	0
	dw	0
	dw	0
?patch329	equ	@1027-@@stk@cpu@cpu_has_viahash$qv+73
?patch330	equ	0
?patch331	equ	@1027-@@stk@cpu@cpu_has_viahash$qv
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
$mkamfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eoamfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_rdseed$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_rdseed$qv	proc	near
?live16454@0:
	?debug L 2088
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @1028
@1029:
	mov       ebx,offset $eoamfcia
	?debug L 2094
?live16454@16: ; EBX = &$eoamfcia
	mov       eax,dword ptr [$mkamfcia]
	cmp       eax,-1
	je        short @1033
	?debug L 2095
?live16454@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @1031
	?debug L 2097
?live16454@48: ; EBX = &$eoamfcia
@1032:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1033:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1032
	cmp       dword ptr [ebx],0
	jne       short @1032
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
	jmp       short @1036
@1035:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1036:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1039
	cmp       dword ptr [ebx],0
@1039:
	je        short @1037
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @1040
	cmp       eax,dword ptr [ebp-20]
@1040:
	setne     al
	and       eax,1
	jmp       short @1038
@1037:
	xor       eax,eax
@1038:
	test      al,al
	jne       short @1035
	?debug L 2100
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
	?debug L 2102
	mov       eax,dword ptr [ebp-44]
	and       eax,262144
	mov       dword ptr [$mkamfcia],eax
	?debug L 2103
?live16454@96: ; EBX = &$eoamfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2104
?live16454@112: ; EBX = &$eoamfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2106
?live16454@128: ; 
@1041:
@1031:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1028:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_rdseed$qv+0
	dd        @1028+0
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
	dd	?patch334
	dd	?patch335
	dd	?patch336
	df	@@stk@cpu@cpu_has_rdseed$qv
	dw	0
	dw	4239
	dw	0
	dw	595
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
	dw	596
	dw	0
	dw	0
	dw	0
	dw	?patch337
	dw	529
	dw	?patch338
	dd	?live16454@112-@@stk@cpu@cpu_has_rdseed$qv
	dd	?live16454@128-?live16454@112
	dw	1
?patch338	equ	1
?patch337	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	597
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	598
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	599
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	600
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eoamfcia
	dw	0
	dw	4102
	dw	0
	dw	601
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	602
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mkamfcia
	dw	0
	dw	117
	dw	0
	dw	603
	dw	0
	dw	0
	dw	0
?patch334	equ	@1041-@@stk@cpu@cpu_has_rdseed$qv+72
?patch335	equ	0
?patch336	equ	@1041-@@stk@cpu@cpu_has_rdseed$qv
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
$mbbmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$efbmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_rdrand$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_rdrand$qv	proc	near
?live16455@0:
	?debug L 2109
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @1042
@1043:
	mov       ebx,offset $efbmfcia
	?debug L 2115
?live16455@16: ; EBX = &$efbmfcia
	mov       eax,dword ptr [$mbbmfcia]
	cmp       eax,-1
	je        short @1047
	?debug L 2116
?live16455@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @1045
	?debug L 2118
?live16455@48: ; EBX = &$efbmfcia
@1046:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1047:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1046
	cmp       dword ptr [ebx],0
	jne       short @1046
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
	jmp       short @1050
@1049:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1050:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1053
	cmp       dword ptr [ebx],0
@1053:
	je        short @1051
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @1054
	cmp       eax,dword ptr [ebp-20]
@1054:
	setne     al
	and       eax,1
	jmp       short @1052
@1051:
	xor       eax,eax
@1052:
	test      al,al
	jne       short @1049
	?debug L 2121
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
	?debug L 2123
	mov       eax,dword ptr [ebp-36]
	and       eax,1073741824
	mov       dword ptr [$mbbmfcia],eax
	?debug L 2124
?live16455@96: ; EBX = &$efbmfcia, EAX = @temp3
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	?debug L 2125
?live16455@112: ; EBX = &$efbmfcia, EAX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 2127
?live16455@128: ; 
@1055:
@1045:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1042:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_rdrand$qv+0
	dd        @1042+0
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
	dd	?patch339
	dd	?patch340
	dd	?patch341
	df	@@stk@cpu@cpu_has_rdrand$qv
	dw	0
	dw	4241
	dw	0
	dw	604
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
	dw	605
	dw	0
	dw	0
	dw	0
	dw	?patch342
	dw	529
	dw	?patch343
	dd	?live16455@112-@@stk@cpu@cpu_has_rdrand$qv
	dd	?live16455@128-?live16455@112
	dw	1
?patch343	equ	1
?patch342	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	606
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	607
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	608
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	609
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$efbmfcia
	dw	0
	dw	4102
	dw	0
	dw	610
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	611
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mbbmfcia
	dw	0
	dw	117
	dw	0
	dw	612
	dw	0
	dw	0
	dw	0
?patch339	equ	@1055-@@stk@cpu@cpu_has_rdrand$qv+72
?patch340	equ	0
?patch341	equ	@1055-@@stk@cpu@cpu_has_rdrand$qv
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
?live16456@0:
	?debug L 2136
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	push      ebx
	mov       dword ptr [ebp-8],offset @1056
@1057:
	mov       ebx,offset s@
	?debug L 2142
?live16456@16: ; EBX = &s@
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	push      ebx
	push      39
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+39]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,8
	?debug L 2143
	call      @@stk@cpu@cpu_name$qv
	push      eax
	push      ebx
	push      52
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+52]
	push      edx
	call      @@stk@con@prints$qpxce
	add       esp,8
	?debug L 2144
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
	?debug L 2145
	push      0
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1058
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
	jmp       short @1059
@1058:
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
	?debug L 2146
@1059:
	push      0
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1060
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
	jmp       short @1061
@1060:
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
	?debug L 2147
@1061:
	push      ebx
	push      197
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+197]
	push      eax
	call      @@stk@con@prints$qpxce
	pop       ecx
	?debug L 2148
	push      1
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1062
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
	jmp       short @1063
@1062:
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
	?debug L 2149
@1063:
	push      1
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1064
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
	jmp       short @1065
@1064:
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
	?debug L 2150
@1065:
	push      2
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1066
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
	jmp       short @1067
@1066:
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
	?debug L 2151
@1067:
	push      2
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1068
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
	jmp       short @1069
@1068:
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
	?debug L 2152
@1069:
	push      3
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1070
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
	jmp       short @1071
@1070:
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
	?debug L 2153
@1071:
	push      3
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1072
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
	jmp       short @1073
@1072:
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
	?debug L 2154
@1073:
	call      @@stk@cpu@cpu_num_cores$qv
	test      eax,eax
	je        short @1074
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
	jmp       short @1075
@1074:
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
	?debug L 2155
@1075:
	call      @@stk@cpu@cpu_num_threads$qv
	test      eax,eax
	je        short @1076
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
	jmp       short @1077
@1076:
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
	?debug L 2157
@1077:
	call      @@stk@cpu@cpu_has_amd64$qv
	and       eax,255
	test      eax,eax
	je        short @1078
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
	jmp       short @1079
@1078:
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
	?debug L 2158
@1079:
	call      @@stk@cpu@cpu_has_ht$qv
	and       eax,255
	test      eax,eax
	je        short @1080
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
	jmp       short @1081
@1080:
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
	?debug L 2159
@1081:
	call      @@stk@cpu@cpu_has_mmx$qv
	and       eax,255
	test      eax,eax
	je        short @1082
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
	jmp       short @1083
@1082:
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
	?debug L 2160
@1083:
	call      @@stk@cpu@cpu_has_mmxext$qv
	and       eax,255
	test      eax,eax
	je        short @1084
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
	jmp       short @1085
@1084:
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
	?debug L 2161
@1085:
	call      @@stk@cpu@cpu_has_3dnow$qv
	test      eax,eax
	je        short @1086
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
	jmp       short @1087
@1086:
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
	?debug L 2162
@1087:
	call      @@stk@cpu@cpu_has_3dnowprefetch$qv
	and       eax,255
	test      eax,eax
	je        short @1088
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
	jmp       short @1089
@1088:
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
	?debug L 2163
@1089:
	call      @@stk@cpu@cpu_has_fxsr$qv
	and       eax,255
	test      eax,eax
	je        short @1090
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
	jmp       short @1091
@1090:
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
	?debug L 2164
@1091:
	call      @@stk@cpu@cpu_has_sse$qv
	test      eax,eax
	je        short @1092
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
	jmp       short @1093
@1092:
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
	?debug L 2165
@1093:
	call      @@stk@cpu@cpu_has_xsave$qv
	and       eax,255
	test      eax,eax
	je        short @1094
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
	jmp       short @1095
@1094:
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
	?debug L 2166
@1095:
	call      @@stk@cpu@cpu_has_pclmulqdq$qv
	and       eax,255
	test      eax,eax
	je        short @1096
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
	jmp       short @1097
@1096:
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
	?debug L 2167
@1097:
	call      @@stk@cpu@cpu_has_movbe$qv
	and       eax,255
	test      eax,eax
	je        short @1098
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
	jmp       short @1099
@1098:
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
	?debug L 2168
@1099:
	call      @@stk@cpu@cpu_has_fma$qv
	test      eax,eax
	je        short @1100
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
	jmp       short @1101
@1100:
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
	?debug L 2169
@1101:
	call      @@stk@cpu@cpu_has_popcnt$qv
	and       eax,255
	test      eax,eax
	je        short @1102
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
	jmp       short @1103
@1102:
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
	?debug L 2170
@1103:
	call      @@stk@cpu@cpu_has_xop$qv
	and       eax,255
	test      eax,eax
	je        short @1104
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
	jmp       short @1105
@1104:
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
	?debug L 2171
@1105:
	call      @@stk@cpu@cpu_has_lzcnt$qv
	and       eax,255
	test      eax,eax
	je        short @1106
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
	jmp       short @1107
@1106:
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
	?debug L 2172
@1107:
	call      @@stk@cpu@cpu_has_f16c$qv
	and       eax,255
	test      eax,eax
	je        short @1108
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
	jmp       short @1109
@1108:
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
	?debug L 2173
@1109:
	call      @@stk@cpu@cpu_has_avx$qv
	test      eax,eax
	je        short @1110
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
	jmp       short @1111
@1110:
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
	?debug L 2174
@1111:
	call      @@stk@cpu@cpu_has_avx512f$qv
	and       eax,255
	test      eax,eax
	je        short @1112
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
	jmp       short @1113
@1112:
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
	?debug L 2175
@1113:
	call      @@stk@cpu@cpu_has_avx512bw$qv
	and       eax,255
	test      eax,eax
	je        short @1114
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
	jmp       short @1115
@1114:
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
	?debug L 2176
@1115:
	call      @@stk@cpu@cpu_has_avx512cd$qv
	and       eax,255
	test      eax,eax
	je        short @1116
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
	jmp       short @1117
@1116:
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
	?debug L 2177
@1117:
	call      @@stk@cpu@cpu_has_avx512dq$qv
	and       eax,255
	test      eax,eax
	je        short @1118
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
	jmp       short @1119
@1118:
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
	?debug L 2178
@1119:
	call      @@stk@cpu@cpu_has_avx512er$qv
	and       eax,255
	test      eax,eax
	je        short @1120
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
	jmp       short @1121
@1120:
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
	?debug L 2179
@1121:
	call      @@stk@cpu@cpu_has_avx512pf$qv
	and       eax,255
	test      eax,eax
	je        short @1122
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
	jmp       short @1123
@1122:
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
	?debug L 2180
@1123:
	call      @@stk@cpu@cpu_has_avx512vl$qv
	and       eax,255
	test      eax,eax
	je        short @1124
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
	jmp       short @1125
@1124:
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
	?debug L 2181
@1125:
	call      @@stk@cpu@cpu_has_avx512ifma$qv
	and       eax,255
	test      eax,eax
	je        short @1126
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
	jmp       short @1127
@1126:
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
	?debug L 2182
@1127:
	call      @@stk@cpu@cpu_has_bmi$qv
	test      eax,eax
	je        short @1128
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
	jmp       short @1129
@1128:
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
	?debug L 2183
@1129:
	call      @@stk@cpu@cpu_has_avx512vbmi$qv
	and       eax,255
	test      eax,eax
	je        short @1130
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
	jmp       short @1131
@1130:
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
	?debug L 2184
@1131:
	call      @@stk@cpu@cpu_has_cmov$qv
	and       eax,255
	test      eax,eax
	je        short @1132
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
	jmp       short @1133
@1132:
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
	?debug L 2185
@1133:
	call      @@stk@cpu@cpu_has_cmpxchg$qv
	test      eax,eax
	je        short @1134
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
	jmp       short @1135
@1134:
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
	?debug L 2186
@1135:
	call      @@stk@cpu@cpu_has_clmul$qv
	and       eax,255
	test      eax,eax
	je        short @1136
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
	jmp       short @1137
@1136:
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
	?debug L 2187
@1137:
	call      @@stk@cpu@cpu_has_aes$qv
	and       eax,255
	test      eax,eax
	je        short @1138
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
	jmp       short @1139
@1138:
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
	?debug L 2188
@1139:
	call      @@stk@cpu@cpu_has_sha$qv
	and       eax,255
	test      eax,eax
	je        short @1140
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
	jmp       short @1141
@1140:
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
	?debug L 2189
@1141:
	call      @@stk@cpu@cpu_has_rdrand$qv
	and       eax,255
	test      eax,eax
	je        short @1142
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
	jmp       short @1143
@1142:
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
	?debug L 2190
@1143:
	call      @@stk@cpu@cpu_has_rdseed$qv
	and       eax,255
	test      eax,eax
	je        short @1144
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
	jmp       short @1145
@1144:
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
	?debug L 2191
@1145:
	call      @@stk@cpu@cpu_has_tsc$qv
	and       eax,255
	test      eax,eax
	je        short @1146
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
	jmp       short @1147
@1146:
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
	?debug L 2192
@1147:
	call      @@stk@cpu@cpu_has_perftsc$qv
	and       eax,255
	test      eax,eax
	je        short @1148
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
	jmp       short @1149
@1148:
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
	?debug L 2193
@1149:
	call      @@stk@cpu@cpu_has_erms$qv
	and       eax,255
	test      eax,eax
	je        short @1150
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
	jmp       short @1151
@1150:
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
	?debug L 2194
@1151:
	call      @@stk@cpu@cpu_has_msr$qv
	and       eax,255
	test      eax,eax
	je        short @1152
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
	jmp       short @1153
@1152:
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
	?debug L 2195
@1153:
	call      @@stk@cpu@cpu_has_mtrr$qv
	and       eax,255
	test      eax,eax
	je        short @1154
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
	jmp       short @1155
@1154:
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
	?debug L 2196
@1155:
	call      @@stk@cpu@cpu_has_vmx$qv
	and       eax,255
	test      eax,eax
	je        short @1156
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
	jmp       short @1157
@1156:
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
	?debug L 2198
?live16456@880: ; 
@1157:
@1158:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@1056:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_print_info$qv+0
	dd        @1056+0
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
	dd	?patch344
	dd	?patch345
	dd	?patch346
	df	@@stk@cpu@cpu_print_info$qv
	dw	0
	dw	4243
	dw	0
	dw	613
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
	dw	614
	dw	0
	dw	0
	dw	0
?patch344	equ	@1158-@@stk@cpu@cpu_print_info$qv+35
?patch345	equ	0
?patch346	equ	@1158-@@stk@cpu@cpu_print_info$qv
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
?live16457@0:
	?debug L 2201
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @1159
	?debug L 2206
@1160:
	call      @@stk@cpu@cpu_print_info$qv
	?debug L 2207
@1161:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@1159:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_test$qv+0
	dd        @1159+0
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
	dd	?patch347
	dd	?patch348
	dd	?patch349
	df	@@stk@cpu@cpu_test$qv
	dw	0
	dw	4245
	dw	0
	dw	615
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
?patch347	equ	@1161-@@stk@cpu@cpu_test$qv+31
?patch348	equ	0
?patch349	equ	@1161-@@stk@cpu@cpu_test$qv
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
	mov       dword ptr [ebp-8],offset @1162
@1163:
	call      @@stk@cpu@tsc_init$qv
	mov       dword ptr [_tsc_ADJ],eax
	mov       dword ptr [_tsc_ADJ+4],edx
	?debug L 0
@1164:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@1162:
	db        67,71,83,0
	dd        @_STCON0_$qv+0
	dd        @1162+0
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
	dd	?patch350
	dd	?patch351
	dd	?patch352
	df	@_STCON0_$qv
	dw	0
	dw	4247
	dw	0
	dw	616
	dw	0
	dw	0
	dw	0
?patch350	equ	@1164-@_STCON0_$qv+31
?patch351	equ	0
?patch352	equ	@1164-@_STCON0_$qv
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
	dd	$enckfcia
	dd	8
	dd	4
	dd	$ehdkfcia
	dd	8
	dd	4
	dd	$mkdkfcia
	dd	8
	dd	4
	dd	$eodkfcia
	dd	8
	dd	4
	dd	$mbekfcia
	dd	8
	dd	4
	dd	$efekfcia
	dd	8
	dd	4
	dd	$miekfcia
	dd	8
	dd	4
	dd	$emekfcia
	dd	4
	dd	4
	dd	$mpekfcia
	dd	4
	dd	4
	dd	$edfkfcia
	dd	4
	dd	4
	dd	$mgfkfcia
	dd	4
	dd	4
	dd	$ekfkfcia
	dd	4
	dd	4
	dd	$mnfkfcia
	dd	4
	dd	4
	dd	$ebgkfcia
	dd	8
	dd	4
	dd	$megkfcia
	dd	16
	dd	4
	dd	$eigkfcia
	dd	8
	dd	4
	dd	$echkfcia
	dd	52
	dd	4
	dd	$mfhkfcia
	dd	8
	dd	4
	dd	$mphkfcia
	dd	4
	dd	4
	dd	$edikfcia
	dd	8
	dd	4
	dd	$mgikfcia
	dd	4
	dd	4
	dd	$ekikfcia
	dd	8
	dd	4
	dd	$mnikfcia
	dd	4
	dd	4
	dd	$ebjkfcia
	dd	8
	dd	4
	dd	$mejkfcia
	dd	4
	dd	4
	dd	$eijkfcia
	dd	8
	dd	4
	dd	$mljkfcia
	dd	4
	dd	4
	dd	$epjkfcia
	dd	8
	dd	4
	dd	$ejkkfcia
	dd	4
	dd	4
	dd	$mmkkfcia
	dd	8
	dd	4
	dd	$ealkfcia
	dd	4
	dd	4
	dd	$mdlkfcia
	dd	8
	dd	4
	dd	$ehlkfcia
	dd	4
	dd	4
	dd	$mklkfcia
	dd	8
	dd	4
	dd	$eolkfcia
	dd	4
	dd	4
	dd	$mbmkfcia
	dd	8
	dd	4
	dd	$efmkfcia
	dd	4
	dd	4
	dd	$mimkfcia
	dd	8
	dd	4
	dd	$emmkfcia
	dd	4
	dd	4
	dd	$mpmkfcia
	dd	8
	dd	4
	dd	$ednkfcia
	dd	4
	dd	4
	dd	$mgnkfcia
	dd	8
	dd	4
	dd	$eknkfcia
	dd	4
	dd	4
	dd	$mnnkfcia
	dd	8
	dd	4
	dd	$ebokfcia
	dd	4
	dd	4
	dd	$meokfcia
	dd	8
	dd	4
	dd	$eiokfcia
	dd	4
	dd	4
	dd	$mlokfcia
	dd	8
	dd	4
	dd	$epokfcia
	dd	4
	dd	4
	dd	$mcpkfcia
	dd	8
	dd	4
	dd	$egpkfcia
	dd	4
	dd	4
	dd	$mjpkfcia
	dd	8
	dd	4
	dd	$enpkfcia
	dd	4
	dd	4
	dd	$maalfcia
	dd	8
	dd	4
	dd	$eealfcia
	dd	4
	dd	4
	dd	$mhalfcia
	dd	8
	dd	4
	dd	$elalfcia
	dd	4
	dd	4
	dd	$moalfcia
	dd	8
	dd	4
	dd	$ecblfcia
	dd	4
	dd	4
	dd	$mfblfcia
	dd	8
	dd	4
	dd	$ejblfcia
	dd	4
	dd	4
	dd	$mmblfcia
	dd	8
	dd	4
	dd	$eaclfcia
	dd	4
	dd	4
	dd	$mdclfcia
	dd	8
	dd	4
	dd	$ehclfcia
	dd	4
	dd	4
	dd	$mkclfcia
	dd	8
	dd	4
	dd	$eoclfcia
	dd	4
	dd	4
	dd	$mbdlfcia
	dd	8
	dd	4
	dd	$efdlfcia
	dd	4
	dd	4
	dd	$midlfcia
	dd	8
	dd	4
	dd	$emdlfcia
	dd	4
	dd	4
	dd	$mpdlfcia
	dd	8
	dd	4
	dd	$edelfcia
	dd	4
	dd	4
	dd	$mgelfcia
	dd	8
	dd	4
	dd	$ekelfcia
	dd	4
	dd	4
	dd	$mnelfcia
	dd	8
	dd	4
	dd	$ebflfcia
	dd	4
	dd	4
	dd	$meflfcia
	dd	8
	dd	4
	dd	$eiflfcia
	dd	4
	dd	4
	dd	$mlflfcia
	dd	8
	dd	4
	dd	$epflfcia
	dd	4
	dd	4
	dd	$mcglfcia
	dd	8
	dd	4
	dd	$egglfcia
	dd	4
	dd	4
	dd	$mjglfcia
	dd	8
	dd	4
	dd	$englfcia
	dd	4
	dd	4
	dd	$mahlfcia
	dd	8
	dd	4
	dd	$eehlfcia
	dd	4
	dd	4
	dd	$mhhlfcia
	dd	8
	dd	4
	dd	$elhlfcia
	dd	4
	dd	4
	dd	$mohlfcia
	dd	8
	dd	4
	dd	$ecilfcia
	dd	4
	dd	4
	dd	$mfilfcia
	dd	8
	dd	4
	dd	$ejilfcia
	dd	4
	dd	4
	dd	$mmilfcia
	dd	8
	dd	4
	dd	$eajlfcia
	dd	4
	dd	4
	dd	$mdjlfcia
	dd	8
	dd	4
	dd	$ehjlfcia
	dd	4
	dd	4
	dd	$mkjlfcia
	dd	8
	dd	4
	dd	$eojlfcia
	dd	4
	dd	4
	dd	$mbklfcia
	dd	8
	dd	4
	dd	$efklfcia
	dd	4
	dd	4
	dd	$miklfcia
	dd	8
	dd	4
	dd	$emklfcia
	dd	4
	dd	4
	dd	$mpklfcia
	dd	8
	dd	4
	dd	$edllfcia
	dd	4
	dd	4
	dd	$mgllfcia
	dd	8
	dd	4
	dd	$ekllfcia
	dd	4
	dd	4
	dd	$mnllfcia
	dd	8
	dd	4
	dd	$ebmlfcia
	dd	4
	dd	4
	dd	$memlfcia
	dd	8
	dd	4
	dd	$eimlfcia
	dd	4
	dd	4
	dd	$mlmlfcia
	dd	8
	dd	4
	dd	$epmlfcia
	dd	4
	dd	4
	dd	$mcnlfcia
	dd	8
	dd	4
	dd	$egnlfcia
	dd	4
	dd	4
	dd	$mjnlfcia
	dd	8
	dd	4
	dd	$ennlfcia
	dd	4
	dd	4
	dd	$maolfcia
	dd	12
	dd	4
	dd	$eeolfcia
	dd	8
	dd	4
	dd	$mholfcia
	dd	4
	dd	4
	dd	$elolfcia
	dd	8
	dd	4
	dd	$moolfcia
	dd	4
	dd	4
	dd	$ecplfcia
	dd	8
	dd	4
	dd	$mfplfcia
	dd	4
	dd	4
	dd	$ejplfcia
	dd	8
	dd	4
	dd	$mmplfcia
	dd	4
	dd	4
	dd	$eaamfcia
	dd	8
	dd	4
	dd	$mdamfcia
	dd	4
	dd	4
	dd	$ehamfcia
	dd	8
	dd	4
	dd	$mkamfcia
	dd	4
	dd	4
	dd	$eoamfcia
	dd	8
	dd	4
	dd	$mbbmfcia
	dd	4
	dd	4
	dd	$efbmfcia
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
 extrn   _CG_DA_EPY:near
@@stk@time@wait_us$qxuj equ @stk@time@wait_us$qxuj
 extrn   @stk@time@wait_us$qxuj:near
 extrn   _CG_D_EP:near
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
	dw	?patch353
	dw	37
	dw	617
	dw	0
	dw	0
	dw	0
	dw	0
?patch353	equ	12
	dw	?patch354
	dw	37
	dw	618
	dw	0
	dw	0
	dw	0
	dw	0
?patch354	equ	12
	dw	?patch355
	dw	37
	dw	619
	dw	0
	dw	0
	dw	0
	dw	0
?patch355	equ	12
	dw	?patch356
	dw	37
	dw	620
	dw	0
	dw	0
	dw	0
	dw	0
?patch356	equ	12
	dw	?patch357
	dw	37
	dw	621
	dw	0
	dw	0
	dw	0
	dw	0
?patch357	equ	12
	dw	?patch358
	dw	37
	dw	622
	dw	0
	dw	0
	dw	0
	dw	0
?patch358	equ	12
	dw	?patch359
	dw	37
	dw	623
	dw	0
	dw	0
	dw	0
	dw	0
?patch359	equ	12
	dw	?patch360
	dw	37
	dw	624
	dw	0
	dw	0
	dw	0
	dw	0
?patch360	equ	12
	dw	22
	dw	513
	df	_tsc_STARTED
	dw	0
	dw	119
	dw	0
	dw	625
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_PAUSED
	dw	0
	dw	119
	dw	0
	dw	626
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_LAST_MEASURED
	dw	0
	dw	119
	dw	0
	dw	627
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_ADJ
	dw	0
	dw	119
	dw	0
	dw	628
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_ELAPSED
	dw	0
	dw	119
	dw	0
	dw	629
	dw	0
	dw	0
	dw	0
	dw	?patch361
	dw	38
	dw	498
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
?patch361	equ	1996
	dw	?patch362
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
?patch362	equ	16
$$BSYMS	ends
$$BTYPES	segment byte public use32 'DEBTYP'
	db        2,0,0,0,14,0,8,0,119,0,0,0,0,0,2,0
	db        1,16,0,0,12,0,1,2,2,0,117,4,0,0,117,4
	db        0,0,14,0,8,0,119,0,0,0,0,0,0,0,3,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,119,0,0,0
	db        0,0,0,0,5,16,0,0,4,0,1,2,0,0,8,0
	db        1,0,2,0,118,0,0,0,14,0,8,0,119,0,0,0
	db        0,0,0,0,8,16,0,0,4,0,1,2,0,0,14,0
	db        8,0,119,0,0,0,0,0,0,0,10,16,0,0,4,0
	db        1,2,0,0,14,0,8,0,119,0,0,0,0,0,0,0
	db        12,16,0,0,4,0,1,2,0,0,14,0,8,0,119,0
	db        0,0,0,0,0,0,14,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,119,0,0,0,0,0,0,0,16,16,0,0
	db        4,0,1,2,0,0,14,0,8,0,119,0,0,0,0,0
	db        0,0,18,16,0,0,4,0,1,2,0,0,14,0,8,0
	db        119,0,0,0,0,0,0,0,20,16,0,0,4,0,1,2
	db        0,0,14,0,8,0,117,0,0,0,0,0,6,0,22,16
	db        0,0,28,0,1,2,6,0,117,4,0,0,117,4,0,0
	db        117,4,0,0,117,4,0,0,117,0,0,0,117,0,0,0
	db        14,0,8,0,117,0,0,0,0,0,6,0,24,16,0,0
	db        28,0,1,2,6,0,117,4,0,0,117,4,0,0,117,4
	db        0,0,117,4,0,0,117,0,0,0,117,0,0,0,14,0
	db        8,0,112,4,0,0,0,0,0,0,26,16,0,0,4,0
	db        1,2,0,0,18,0,3,0,117,0,0,0,17,0,0,0
	db        0,0,0,0,16,0,4,0,14,0,8,0,112,4,0,0
	db        0,0,0,0,29,16,0,0,4,0,1,2,0,0,18,0
	db        3,0,117,0,0,0,17,0,0,0,0,0,0,0,52,0
	db        13,0,14,0,8,0,117,0,0,0,0,0,0,0,32,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,117,0,0,0
	db        0,0,0,0,34,16,0,0,4,0,1,2,0,0,14,0
	db        8,0,117,0,0,0,0,0,1,0,36,16,0,0,8,0
	db        1,2,1,0,32,0,0,0,14,0,8,0,117,0,0,0
	db        0,0,1,0,38,16,0,0,8,0,1,2,1,0,32,0
	db        0,0,14,0,8,0,117,0,0,0,0,0,1,0,40,16
	db        0,0,8,0,1,2,1,0,48,0,0,0,18,0,3,0
	db        119,0,0,0,17,0,0,0,0,0,0,0,40,0,5,0
	db        14,0,8,0,48,0,0,0,0,0,0,0,43,16,0,0
	db        4,0,1,2,0,0,14,0,8,0,48,0,0,0,0,0
	db        0,0,45,16,0,0,4,0,1,2,0,0,14,0,8,0
	db        48,0,0,0,0,0,0,0,47,16,0,0,4,0,1,2
	db        0,0,14,0,8,0,48,0,0,0,0,0,0,0,49,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,48,0,0,0
	db        0,0,0,0,51,16,0,0,4,0,1,2,0,0,14,0
	db        8,0,117,0,0,0,0,0,0,0,53,16,0,0,4,0
	db        1,2,0,0,14,0,8,0,48,0,0,0,0,0,0,0
	db        55,16,0,0,4,0,1,2,0,0,14,0,8,0,117,0
	db        0,0,0,0,0,0,57,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,48,0,0,0,0,0,0,0,59,16,0,0
	db        4,0,1,2,0,0,14,0,8,0,48,0,0,0,0,0
	db        0,0,61,16,0,0,4,0,1,2,0,0,14,0,8,0
	db        117,0,0,0,0,0,0,0,63,16,0,0,4,0,1,2
	db        0,0,14,0,8,0,48,0,0,0,0,0,0,0,65,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,48,0,0,0
	db        0,0,0,0,67,16,0,0,4,0,1,2,0,0,14,0
	db        8,0,48,0,0,0,0,0,0,0,69,16,0,0,4,0
	db        1,2,0,0,14,0,8,0,48,0,0,0,0,0,0,0
	db        71,16,0,0,4,0,1,2,0,0,14,0,8,0,117,0
	db        0,0,0,0,0,0,73,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,48,0,0,0,0,0,0,0,75,16,0,0
	db        4,0,1,2,0,0,14,0,8,0,117,0,0,0,0,0
	db        0,0,77,16,0,0,4,0,1,2,0,0,14,0,8,0
	db        48,0,0,0,0,0,0,0,79,16,0,0,4,0,1,2
	db        0,0,14,0,8,0,48,0,0,0,0,0,0,0,81,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,48,0,0,0
	db        0,0,0,0,83,16,0,0,4,0,1,2,0,0,14,0
	db        8,0,48,0,0,0,0,0,0,0,85,16,0,0,4,0
	db        1,2,0,0,14,0,8,0,48,0,0,0,0,0,0,0
	db        87,16,0,0,4,0,1,2,0,0,14,0,8,0,48,0
	db        0,0,0,0,0,0,89,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,48,0,0,0,0,0,0,0,91,16,0,0
	db        4,0,1,2,0,0,14,0,8,0,48,0,0,0,0,0
	db        0,0,93,16,0,0,4,0,1,2,0,0,14,0,8,0
	db        48,0,0,0,0,0,0,0,95,16,0,0,4,0,1,2
	db        0,0,14,0,8,0,48,0,0,0,0,0,0,0,97,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,48,0,0,0
	db        0,0,0,0,99,16,0,0,4,0,1,2,0,0,14,0
	db        8,0,48,0,0,0,0,0,0,0,101,16,0,0,4,0
	db        1,2,0,0,14,0,8,0,48,0,0,0,0,0,0,0
	db        103,16,0,0,4,0,1,2,0,0,14,0,8,0,48,0
	db        0,0,0,0,0,0,105,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,48,0,0,0,0,0,0,0,107,16,0,0
	db        4,0,1,2,0,0,14,0,8,0,48,0,0,0,0,0
	db        0,0,109,16,0,0,4,0,1,2,0,0,14,0,8,0
	db        48,0,0,0,0,0,0,0,111,16,0,0,4,0,1,2
	db        0,0,14,0,8,0,48,0,0,0,0,0,0,0,113,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,48,0,0,0
	db        0,0,0,0,115,16,0,0,4,0,1,2,0,0,14,0
	db        8,0,48,0,0,0,0,0,0,0,117,16,0,0,4,0
	db        1,2,0,0,14,0,8,0,48,0,0,0,0,0,0,0
	db        119,16,0,0,4,0,1,2,0,0,14,0,8,0,48,0
	db        0,0,0,0,0,0,121,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,48,0,0,0,0,0,0,0,123,16,0,0
	db        4,0,1,2,0,0,14,0,8,0,48,0,0,0,0,0
	db        0,0,125,16,0,0,4,0,1,2,0,0,14,0,8,0
	db        48,0,0,0,0,0,0,0,127,16,0,0,4,0,1,2
	db        0,0,14,0,8,0,48,0,0,0,0,0,0,0,129,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,117,4,0,0
	db        0,0,0,0,131,16,0,0,4,0,1,2,0,0,18,0
	db        3,0,117,0,0,0,17,0,0,0,0,0,0,0,12,0
	db        3,0,14,0,8,0,117,0,0,0,0,0,0,0,134,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,48,0,0,0
	db        0,0,0,0,136,16,0,0,4,0,1,2,0,0,14,0
	db        8,0,48,0,0,0,0,0,0,0,138,16,0,0,4,0
	db        1,2,0,0,14,0,8,0,48,0,0,0,0,0,0,0
	db        140,16,0,0,4,0,1,2,0,0,14,0,8,0,48,0
	db        0,0,0,0,0,0,142,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,48,0,0,0,0,0,0,0,144,16,0,0
	db        4,0,1,2,0,0,14,0,8,0,48,0,0,0,0,0
	db        0,0,146,16,0,0,4,0,1,2,0,0,14,0,8,0
	db        3,0,0,0,0,0,0,0,148,16,0,0,4,0,1,2
	db        0,0,14,0,8,0,3,0,0,0,0,0,0,0,150,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,3,0,0,0
	db        7,0,0,0,152,16,0,0,4,0,1,2,0,0,14,0
	db        8,0,116,0,0,0,2,0,0,0,154,16,0,0,4,0
	db        1,2,0,0,14,0,8,0,3,0,0,0,7,0,1,0
	db        157,16,0,0,8,0,1,0,1,0,119,0,0,0,8,0
	db        1,2,1,0,156,16,0,0,14,0,8,0,112,4,0,0
	db        7,0,2,0,159,16,0,0,12,0,1,2,2,0,112,4
	db        0,0,112,0,0,0,14,0,8,0,3,4,0,0,7,0
	db        3,0,164,16,0,0,8,0,2,0,10,0,162,16,0,0
	db        8,0,1,0,1,0,3,0,0,0,8,0,1,0,1,0
	db        117,0,0,0,16,0,1,2,3,0,3,4,0,0,161,16
	db        0,0,163,16,0,0,14,0,8,0,118,0,0,0,7,0
	db        3,0,166,16,0,0,16,0,1,2,3,0,161,16,0,0
	db        161,16,0,0,163,16,0,0,14,0,8,0,119,0,0,0
	db        7,0,0,0,168,16,0,0,4,0,1,2,0,0,14,0
	db        8,0,3,0,0,0,64,0,2,0,172,16,0,0,8,0
	db        2,0,10,0,171,16,0,0,8,0,1,0,1,0,112,0
	db        0,0,12,0,1,2,2,0,170,16,0,0,0,0,0,0
$$BTYPES	ends
$$BNAMES	segment byte public use32 'DEBNAM'
	db	22,'@stk@cpu@rdtscp$qpuit1'
	db	6,'a_chip'
	db	6,'a_core'
	db	6,'ret_cc'
	db	6,'ret_lo'
	db	6,'ret_hi'
	db	3,'ret'
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
	db	26,'@std@%max$T1%$qrxT1t1$rxT1'
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
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\STK_CPU.H" 22191 48643
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\IO\./../stk_main.h" 22183 27213
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\IO\STK_CONSOLE.H" 22172 32832
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\TIME\STK_TIME.H" 20752 24369
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\STASM\STK_STASM.H" 22142 40733
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\_lim.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\limits.h" 10305 10240
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\THREADS\./../cpu/./../stk_main.h" 22183 27213
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\THREADS\./../cpu/stk_cpu.h" 22191 48643
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\THREADS\./../time/stk_time.h" 20752 24369
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\THREADS\./../stk_main.h" 22183 27213
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\THREADS\STK_THREADS.H" 22172 32835
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\TEXT\STK_CSTR_UTILS.H" 22172 32834
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\MEM\./.././stasm/./../stk_main.h" 22183 27213
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\MEM\./.././stasm/stk_stasm.h" 22142 40733
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\MEM\./.././text/./../mem/stk_mem.h" 20752 24368
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\MEM\./.././text/./../stk_main.h" 22183 27213
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\MEM\./.././text/stk_cstr_utils.h" 22172 32834
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\MEM\./.././time/./../stk_main.h" 22183 27213
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
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\MEM\./../stk_main.h" 22183 27213
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\.\..\MEM\STK_MEM.H" 20752 24368
	?debug	D "E:\SRC\X86_LIBRARIES\stk\cpu\stk_cpu.cpp" 22191 48338
	end
