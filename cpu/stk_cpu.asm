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
_TEXT	segment dword public use32 'CODE'
@$bnew$qui	segment virtual
	align	2
@@$bnew$qui	proc	near
?live16385@0:
	?debug	T "C:\Src\LIB\stk\cpu\./../mem/stk_mem.h"
	?debug L 96
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @1
	?debug L 97
@2:
	mov       eax,dword ptr [ebp+8]
	push      eax
	call      @@stk@mem@alloc$qxui
	?debug L 97
@4:
@3:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@1:
	db        67,71,83,0
	dd        @@$bnew$qui+0
	dd        @1+0
	db        248,255,255,255,12,0,0,0,1,0,0,0,8,0,0,0
	db        4,0,0,0
	?debug L 0
@@$bnew$qui	endp
@$bnew$qui	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	db	2
	db	0
	db	0
	db	0
	dw	57
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
	df	@@$bnew$qui
	dw	0
	dw	4096
	dw	0
	dw	1
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
	dw	2
	dw	0
	dw	0
	dw	0
?patch1	equ	@4-@@$bnew$qui+39
?patch2	equ	0
?patch3	equ	@4-@@$bnew$qui
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
@$bnwa$qui	segment virtual
	align	2
@@$bnwa$qui	proc	near
?live16386@0:
	?debug L 98
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @5
	?debug L 99
@6:
	mov       eax,dword ptr [ebp+8]
	push      eax
	call      @@stk@mem@alloc$qxui
	?debug L 99
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
	dd        @@$bnwa$qui+0
	dd        @5+0
	db        248,255,255,255,12,0,0,0,1,0,0,0,8,0,0,0
	db        4,0,0,0
	?debug L 0
@@$bnwa$qui	endp
@$bnwa$qui	ends
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
	dd	?patch4
	dd	?patch5
	dd	?patch6
	df	@@$bnwa$qui
	dw	0
	dw	4098
	dw	0
	dw	3
	dw	0
	dw	0
	dw	0
	db	10
	db	64
	db	36
	db	98
	db	110
	db	119
	db	97
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
	dw	4
	dw	0
	dw	0
	dw	0
?patch4	equ	@8-@@$bnwa$qui+39
?patch5	equ	0
?patch6	equ	@8-@@$bnwa$qui
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
@$bdele$qpv	segment virtual
	align	2
@@$bdele$qpv	proc	near
?live16387@0:
	?debug L 100
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @9
	?debug L 101
@10:
	mov       eax,dword ptr [ebp+8]
	push      eax
	call      @@stk@mem@free$qpv
	?debug L 101
@11:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@9:
	db        67,71,83,0
	dd        @@$bdele$qpv+0
	dd        @9+0
	db        248,255,255,255,12,0,0,0,1,0,0,0,8,0,0,0
	db        4,0,0,0
	?debug L 0
@@$bdele$qpv	endp
@$bdele$qpv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	58
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
	df	@@$bdele$qpv
	dw	0
	dw	4100
	dw	0
	dw	5
	dw	0
	dw	0
	dw	0
	db	11
	db	64
	db	36
	db	98
	db	100
	db	101
	db	108
	db	101
	db	36
	db	113
	db	112
	db	118
	dw	18
	dw	512
	dw	8
	dw	0
	dw	1027
	dw	0
	dw	6
	dw	0
	dw	0
	dw	0
?patch7	equ	@11-@@$bdele$qpv+39
?patch8	equ	0
?patch9	equ	@11-@@$bdele$qpv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
@$bdla$qpv	segment virtual
	align	2
@@$bdla$qpv	proc	near
?live16388@0:
	?debug L 102
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @12
	?debug L 103
@13:
	mov       eax,dword ptr [ebp+8]
	push      eax
	call      @@stk@mem@free$qpv
	?debug L 103
@14:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@12:
	db        67,71,83,0
	dd        @@$bdla$qpv+0
	dd        @12+0
	db        248,255,255,255,12,0,0,0,1,0,0,0,8,0,0,0
	db        4,0,0,0
	?debug L 0
@@$bdla$qpv	endp
@$bdla$qpv	ends
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
	dd	?patch10
	dd	?patch11
	dd	?patch12
	df	@@$bdla$qpv
	dw	0
	dw	4102
	dw	0
	dw	7
	dw	0
	dw	0
	dw	0
	db	10
	db	64
	db	36
	db	98
	db	100
	db	108
	db	97
	db	36
	db	113
	db	112
	db	118
	dw	18
	dw	512
	dw	8
	dw	0
	dw	1027
	dw	0
	dw	8
	dw	0
	dw	0
	dw	0
?patch10	equ	@14-@@$bdla$qpv+39
?patch11	equ	0
?patch12	equ	@14-@@$bdla$qpv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
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
?live16389@0:
	?debug	T "C:\Src\LIB\stk\cpu\stk_cpu.cpp"
	?debug L 80
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-32
	mov       dword ptr [ebp-8],offset @15
	?debug L 115
@16:
	db        15
	?debug L 116
@17:
	db        49
	?debug L 117
@18:
 	mov	 [dword ptr [ebp-28]], eax
	?debug L 118
 	mov	 [dword ptr [ebp-36]], edx
	?debug L 139
	mov       eax,dword ptr [ebp-36]
	xor       edx,edx
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 140
	mov       edx,dword ptr [ebp-20]
	xor       eax,eax
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 141
	mov       eax,dword ptr [ebp-28]
	xor       edx,edx
	or        eax,dword ptr [ebp-20]
	or        edx,dword ptr [ebp-16]
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 142
	mov       eax,dword ptr [ebp-20]
	mov       edx,dword ptr [ebp-16]
	?debug L 143
@20:
@19:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@15:
	db        67,71,83,0
	dd        @@stk@cpu@rdtsc$qv+0
	dd        @15+0
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
	dd	?patch13
	dd	?patch14
	dd	?patch15
	df	@@stk@cpu@rdtsc$qv
	dw	0
	dw	4104
	dw	0
	dw	9
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
	dw	10
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	11
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	119
	dw	0
	dw	12
	dw	0
	dw	0
	dw	0
?patch13	equ	@20-@@stk@cpu@rdtsc$qv+55
?patch14	equ	0
?patch15	equ	@20-@@stk@cpu@rdtsc$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mphlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@rdtscex$qv	segment virtual
	align	2
@@stk@cpu@rdtscex$qv	proc	near
?live16390@0:
	?debug L 146
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-44
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @21
@22:
	jmp       short @24
	?debug L 273
@23:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@24:
	cmp       dword ptr [$mphlfcia+4],0
	jne       short @23
	cmp       dword ptr [$mphlfcia],0
@25:
	jne       short @23
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-48],eax
	mov       dword ptr [ebp-44],edx
	mov       eax,dword ptr [ebp-48]
	mov       dword ptr [$mphlfcia],eax
	mov       eax,dword ptr [ebp-44]
	mov       dword ptr [$mphlfcia+4],eax
	jmp       short @27
@26:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@27:
	cmp       dword ptr [$mphlfcia+4],0
	jne       short @30
	cmp       dword ptr [$mphlfcia],0
@30:
	je        short @28
	mov       eax,dword ptr [$mphlfcia]
	mov       edx,dword ptr [$mphlfcia+4]
	cmp       edx,dword ptr [ebp-44]
	jne       short @31
	cmp       eax,dword ptr [ebp-48]
@31:
	setne     cl
	and       ecx,1
	jmp       short @29
@28:
	xor       ecx,ecx
@29:
	test      cl,cl
	jne       short @26
	?debug L 275
	pushfd	
	?debug L 276
	push	 eax
	?debug L 277
	push	 ebx
	?debug L 278
	push	 ecx
	?debug L 279
	push	 edx
	?debug L 280
	push	 esi
	?debug L 281
	mov	 eax,000000001H
	?debug L 282
	xor	 ecx,ecx
	?debug L 283
	cpuid	
	?debug L 284
	mov	 ecx,000000001H
	?debug L 285
	shl	 ecx,27
	?debug L 286
	and	 ecx,edx
	?debug L 287
	xor	 eax,eax
	?debug L 288
	xor	 edx,edx
	?debug L 290
	test	 ecx,ecx
	?debug L 291
	je        @32
	?debug L 292
	mov	 eax,1
	?debug L 293
	cpuid	
	?debug L 294
	jmp       short @33
	?debug L 306
	db        15
	?debug L 307
@34:
	db        49
	?debug L 322
@35:
@33:
 tsc_intel_serialize_measure:
	?debug L 333
	db        15
	?debug L 334
@36:
	db        49
	?debug L 348
@37:
@32:
tsc_exit:
	?debug L 349
	mov	 [dword ptr [ebp-28]],eax
	?debug L 350
	mov	 [dword ptr [ebp-36]],edx
	?debug L 351
	pop	 esi
	?debug L 352
	pop	 edx
	?debug L 353
	pop	 ecx
	?debug L 354
	pop	 ebx
	?debug L 355
	pop	 eax
	?debug L 356
	popfd	
	?debug L 358
	mov       eax,dword ptr [ebp-36]
	xor       edx,edx
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 359
	mov       edx,dword ptr [ebp-20]
	xor       eax,eax
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 360
	mov       eax,dword ptr [ebp-28]
	xor       edx,edx
	or        eax,dword ptr [ebp-20]
	or        edx,dword ptr [ebp-16]
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	?debug L 361
	mov       dword ptr [$mphlfcia],0
	mov       dword ptr [$mphlfcia+4],0
	?debug L 362
	mov       eax,dword ptr [ebp-20]
	mov       edx,dword ptr [ebp-16]
	jmp       short @38
	?debug L 371
	xor       eax,eax
	xor       edx,edx
	?debug L 372
@39:
@38:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@21:
	db        67,71,83,0
	dd        @@stk@cpu@rdtscex$qv+0
	dd        @21+0
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
	dd	?patch16
	dd	?patch17
	dd	?patch18
	df	@@stk@cpu@rdtscex$qv
	dw	0
	dw	4106
	dw	0
	dw	13
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
	df	$mphlfcia
	dw	0
	dw	4108
	dw	0
	dw	14
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65488
	dw	65535
	dw	118
	dw	0
	dw	15
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	16
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	17
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	119
	dw	0
	dw	18
	dw	0
	dw	0
	dw	0
?patch16	equ	@39-@@stk@cpu@rdtscex$qv+68
?patch17	equ	0
?patch18	equ	@39-@@stk@cpu@rdtscex$qv
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
$edilfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_init$qv	segment virtual
	align	2
@@stk@cpu@tsc_init$qv	proc	near
?live16391@0:
	?debug L 375
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-52
	mov       dword ptr [ebp-8],offset @40
@41:
	jmp       short @43
	?debug L 378
@42:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@43:
	cmp       dword ptr [$edilfcia+4],0
	jne       short @42
	cmp       dword ptr [$edilfcia],0
	jne       short @42
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [$edilfcia],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [$edilfcia+4],eax
	jmp       short @46
@45:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@46:
	cmp       dword ptr [$edilfcia+4],0
	jne       short @49
	cmp       dword ptr [$edilfcia],0
@49:
	je        short @47
	mov       eax,dword ptr [$edilfcia]
	mov       edx,dword ptr [$edilfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @50
	cmp       eax,dword ptr [ebp-20]
@50:
	setne     cl
	and       ecx,1
	jmp       short @48
@47:
	xor       ecx,ecx
@48:
	test      cl,cl
	jne       short @45
	?debug L 380
	mov       dword ptr [_tsc_ADJ],0
	mov       dword ptr [_tsc_ADJ+4],0
	?debug L 381
	call      @@stk@cpu@tsc_start$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 382
	call      @@stk@cpu@tsc_checkpoint$qv
	mov       dword ptr [ebp-44],eax
	mov       dword ptr [ebp-40],edx
	?debug L 383
	mov       eax,dword ptr [ebp-44]
	mov       edx,dword ptr [ebp-40]
	cmp       edx,dword ptr [ebp-28]
	jne       short @52
	cmp       eax,dword ptr [ebp-32]
@52:
	jbe       short @51
	?debug L 384
	mov       eax,dword ptr [ebp-44]
	mov       edx,dword ptr [ebp-40]
	sub       eax,dword ptr [ebp-32]
	sbb       edx,dword ptr [ebp-28]
	mov       dword ptr [_tsc_ADJ],eax
	mov       dword ptr [_tsc_ADJ+4],edx
	?debug L 385
@51:
	mov       eax,dword ptr [_tsc_ADJ]
	mov       dword ptr [ebp-56],eax
	mov       eax,dword ptr [_tsc_ADJ+4]
	mov       dword ptr [ebp-52],eax
	?debug L 386
	mov       dword ptr [$edilfcia],0
	mov       dword ptr [$edilfcia+4],0
	?debug L 387
	mov       eax,dword ptr [ebp-56]
	mov       edx,dword ptr [ebp-52]
	?debug L 388
@54:
@53:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@40:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_init$qv+0
	dd        @40+0
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
	dd	?patch19
	dd	?patch20
	dd	?patch21
	df	@@stk@cpu@tsc_init$qv
	dw	0
	dw	4109
	dw	0
	dw	19
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
	df	$edilfcia
	dw	0
	dw	4108
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
?patch19	equ	@54-@@stk@cpu@tsc_init$qv+63
?patch20	equ	0
?patch21	equ	@54-@@stk@cpu@tsc_init$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mgilfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_start$qv	segment virtual
	align	2
@@stk@cpu@tsc_start$qv	proc	near
?live16392@0:
	?debug L 391
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-28
	mov       dword ptr [ebp-8],offset @55
@56:
	jmp       short @58
	?debug L 394
@57:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@58:
	cmp       dword ptr [$mgilfcia+4],0
	jne       short @57
	cmp       dword ptr [$mgilfcia],0
	jne       short @57
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [$mgilfcia],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [$mgilfcia+4],eax
	jmp       short @61
@60:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@61:
	cmp       dword ptr [$mgilfcia+4],0
	jne       short @64
	cmp       dword ptr [$mgilfcia],0
@64:
	je        short @62
	mov       eax,dword ptr [$mgilfcia]
	mov       edx,dword ptr [$mgilfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @65
	cmp       eax,dword ptr [ebp-20]
@65:
	setne     cl
	and       ecx,1
	jmp       short @63
@62:
	xor       ecx,ecx
@63:
	test      cl,cl
	jne       short @60
	?debug L 395
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 396
	mov       eax,dword ptr [ebp-32]
	?debug L 397
	mov       edx,dword ptr [ebp-32]
	?debug L 396
	mov       dword ptr [_tsc_STARTED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_STARTED+4],eax
	?debug L 397
	mov       dword ptr [_tsc_LAST_MEASURED],edx
	mov       edx,dword ptr [ebp-28]
	?debug L 400
	mov       eax,dword ptr [ebp-32]
	?debug L 397
	mov       dword ptr [_tsc_LAST_MEASURED+4],edx
	?debug L 398
	mov       dword ptr [_tsc_PAUSED],0
	mov       dword ptr [_tsc_PAUSED+4],0
	mov       dword ptr [_tsc_ELAPSED],0
	mov       dword ptr [_tsc_ELAPSED+4],0
	?debug L 399
	mov       dword ptr [$mgilfcia],0
	mov       dword ptr [$mgilfcia+4],0
	?debug L 400
	mov       edx,dword ptr [ebp-28]
	?debug L 401
@67:
@66:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@55:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_start$qv+0
	dd        @55+0
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
	dd	?patch22
	dd	?patch23
	dd	?patch24
	df	@@stk@cpu@tsc_start$qv
	dw	0
	dw	4111
	dw	0
	dw	25
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
	dw	26
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mgilfcia
	dw	0
	dw	4108
	dw	0
	dw	27
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	28
	dw	0
	dw	0
	dw	0
?patch22	equ	@67-@@stk@cpu@tsc_start$qv+48
?patch23	equ	0
?patch24	equ	@67-@@stk@cpu@tsc_start$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ekilfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_checkpoint$qv	segment virtual
	align	2
@@stk@cpu@tsc_checkpoint$qv	proc	near
?live16393@0:
	?debug L 404
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-52
	mov       dword ptr [ebp-8],offset @68
@69:
	jmp       short @71
	?debug L 407
@70:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@71:
	cmp       dword ptr [$ekilfcia+4],0
	jne       short @70
	cmp       dword ptr [$ekilfcia],0
	jne       short @70
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [$ekilfcia],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [$ekilfcia+4],eax
	jmp       short @74
@73:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@74:
	cmp       dword ptr [$ekilfcia+4],0
	jne       short @77
	cmp       dword ptr [$ekilfcia],0
@77:
	je        short @75
	mov       eax,dword ptr [$ekilfcia]
	mov       edx,dword ptr [$ekilfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @78
	cmp       eax,dword ptr [ebp-20]
@78:
	setne     cl
	and       ecx,1
	jmp       short @76
@75:
	xor       ecx,ecx
@76:
	test      cl,cl
	jne       short @73
	?debug L 408
	mov       eax,dword ptr [_tsc_PAUSED]
	mov       dword ptr [ebp-32],eax
	mov       eax,dword ptr [_tsc_PAUSED+4]
	mov       dword ptr [ebp-28],eax
	?debug L 411
	cmp       dword ptr [ebp-28],0
	jne       short @79
	cmp       dword ptr [ebp-32],0
	jne       short @79
	?debug L 412
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 414
@79:
	mov       eax,dword ptr [_tsc_STARTED]
	mov       edx,dword ptr [_tsc_STARTED+4]
	sub       eax,dword ptr [_tsc_ADJ]
	sbb       edx,dword ptr [_tsc_ADJ+4]
	mov       dword ptr [ebp-44],eax
	mov       dword ptr [ebp-40],edx
	?debug L 415
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	cmp       edx,dword ptr [ebp-40]
	jne       short @82
	cmp       eax,dword ptr [ebp-44]
@82:
	jbe       short @81
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	sub       eax,dword ptr [ebp-44]
	sbb       edx,dword ptr [ebp-40]
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	jmp       short @83
	?debug L 417
@81:
	mov       dword ptr [ebp-56],0
	mov       dword ptr [ebp-52],0
	?debug L 419
@83:
	mov       eax,dword ptr [ebp-32]
	?debug L 420
	mov       edx,dword ptr [ebp-56]
	?debug L 419
	mov       dword ptr [_tsc_LAST_MEASURED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_LAST_MEASURED+4],eax
	?debug L 420
	mov       dword ptr [_tsc_ELAPSED],edx
	mov       edx,dword ptr [ebp-52]
	?debug L 422
	mov       eax,dword ptr [ebp-32]
	?debug L 420
	mov       dword ptr [_tsc_ELAPSED+4],edx
	?debug L 421
	mov       dword ptr [$ekilfcia],0
	mov       dword ptr [$ekilfcia+4],0
	?debug L 422
	mov       edx,dword ptr [ebp-28]
	?debug L 423
@85:
@84:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@68:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_checkpoint$qv+0
	dd        @68+0
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
	dd	?patch25
	dd	?patch26
	dd	?patch27
	df	@@stk@cpu@tsc_checkpoint$qv
	dw	0
	dw	4113
	dw	0
	dw	29
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
	dw	30
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	119
	dw	0
	dw	31
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65504
	dw	65535
	dw	119
	dw	0
	dw	32
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ekilfcia
	dw	0
	dw	4108
	dw	0
	dw	33
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	34
	dw	0
	dw	0
	dw	0
?patch25	equ	@85-@@stk@cpu@tsc_checkpoint$qv+66
?patch26	equ	0
?patch27	equ	@85-@@stk@cpu@tsc_checkpoint$qv
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
?live16394@0:
	?debug L 426
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @86
	?debug L 428
@87:
	mov       eax,dword ptr [_tsc_ELAPSED]
	mov       edx,dword ptr [_tsc_ELAPSED+4]
	?debug L 429
@89:
@88:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@86:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_elapsed$qv+0
	dd        @86+0
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
	dd	?patch28
	dd	?patch29
	dd	?patch30
	df	@@stk@cpu@tsc_elapsed$qv
	dw	0
	dw	4115
	dw	0
	dw	35
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
?patch28	equ	@89-@@stk@cpu@tsc_elapsed$qv+32
?patch29	equ	0
?patch30	equ	@89-@@stk@cpu@tsc_elapsed$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mnilfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_pause$qv	segment virtual
	align	2
@@stk@cpu@tsc_pause$qv	proc	near
?live16395@0:
	?debug L 432
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-28
	mov       dword ptr [ebp-8],offset @90
@91:
	jmp       short @93
	?debug L 435
@92:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@93:
	cmp       dword ptr [$mnilfcia+4],0
	jne       short @92
	cmp       dword ptr [$mnilfcia],0
	jne       short @92
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [$mnilfcia],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [$mnilfcia+4],eax
	jmp       short @96
@95:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@96:
	cmp       dword ptr [$mnilfcia+4],0
	jne       short @99
	cmp       dword ptr [$mnilfcia],0
@99:
	je        short @97
	mov       eax,dword ptr [$mnilfcia]
	mov       edx,dword ptr [$mnilfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @100
	cmp       eax,dword ptr [ebp-20]
@100:
	setne     cl
	and       ecx,1
	jmp       short @98
@97:
	xor       ecx,ecx
@98:
	test      cl,cl
	jne       short @95
	?debug L 436
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 437
	mov       eax,dword ptr [ebp-32]
	?debug L 439
	mov       edx,dword ptr [ebp-28]
	?debug L 437
	mov       dword ptr [_tsc_PAUSED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_PAUSED+4],eax
	?debug L 438
	mov       dword ptr [$mnilfcia],0
	mov       dword ptr [$mnilfcia+4],0
	?debug L 439
	mov       eax,dword ptr [ebp-32]
	?debug L 440
@102:
@101:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@90:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_pause$qv+0
	dd        @90+0
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
	dd	?patch31
	dd	?patch32
	dd	?patch33
	df	@@stk@cpu@tsc_pause$qv
	dw	0
	dw	4117
	dw	0
	dw	36
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
	dw	37
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mnilfcia
	dw	0
	dw	4108
	dw	0
	dw	38
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	39
	dw	0
	dw	0
	dw	0
?patch31	equ	@102-@@stk@cpu@tsc_pause$qv+50
?patch32	equ	0
?patch33	equ	@102-@@stk@cpu@tsc_pause$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ebjlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_resume$qv	segment virtual
	align	2
@@stk@cpu@tsc_resume$qv	proc	near
?live16396@0:
	?debug L 443
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-64
	mov       dword ptr [ebp-8],offset @103
@104:
	jmp       short @106
	?debug L 446
@105:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@106:
	cmp       dword ptr [$ebjlfcia+4],0
	jne       short @105
	cmp       dword ptr [$ebjlfcia],0
	jne       short @105
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [$ebjlfcia],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [$ebjlfcia+4],eax
	jmp       short @109
@108:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@109:
	cmp       dword ptr [$ebjlfcia+4],0
	jne       short @112
	cmp       dword ptr [$ebjlfcia],0
@112:
	je        short @110
	mov       eax,dword ptr [$ebjlfcia]
	mov       edx,dword ptr [$ebjlfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @113
	cmp       eax,dword ptr [ebp-20]
@113:
	setne     cl
	and       ecx,1
	jmp       short @111
@110:
	xor       ecx,ecx
@111:
	test      cl,cl
	jne       short @108
	?debug L 447
	mov       eax,dword ptr [_tsc_STARTED]
	mov       dword ptr [ebp-32],eax
	mov       eax,dword ptr [_tsc_STARTED+4]
	mov       dword ptr [ebp-28],eax
	?debug L 448
	mov       edx,dword ptr [_tsc_PAUSED]
	mov       dword ptr [ebp-44],edx
	mov       edx,dword ptr [_tsc_PAUSED+4]
	mov       dword ptr [ebp-40],edx
	?debug L 449
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	?debug L 450
	mov       eax,dword ptr [ebp-56]
	mov       edx,dword ptr [ebp-52]
	sub       eax,dword ptr [ebp-44]
	sbb       edx,dword ptr [ebp-40]
	add       eax,dword ptr [ebp-32]
	adc       edx,dword ptr [ebp-28]
	mov       dword ptr [ebp-68],eax
	mov       dword ptr [ebp-64],edx
	?debug L 451
	mov       eax,dword ptr [ebp-68]
	?debug L 453
	mov       edx,dword ptr [ebp-52]
	?debug L 451
	mov       dword ptr [_tsc_STARTED],eax
	mov       eax,dword ptr [ebp-64]
	mov       dword ptr [_tsc_STARTED+4],eax
	mov       dword ptr [_tsc_PAUSED],0
	mov       dword ptr [_tsc_PAUSED+4],0
	?debug L 452
	mov       dword ptr [$ebjlfcia],0
	mov       dword ptr [$ebjlfcia+4],0
	?debug L 453
	mov       eax,dword ptr [ebp-56]
	?debug L 454
@115:
@114:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@103:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_resume$qv+0
	dd        @103+0
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
	dd	?patch34
	dd	?patch35
	dd	?patch36
	df	@@stk@cpu@tsc_resume$qv
	dw	0
	dw	4119
	dw	0
	dw	40
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
	dw	41
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65480
	dw	65535
	dw	119
	dw	0
	dw	42
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	119
	dw	0
	dw	43
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65504
	dw	65535
	dw	119
	dw	0
	dw	44
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ebjlfcia
	dw	0
	dw	4108
	dw	0
	dw	45
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	46
	dw	0
	dw	0
	dw	0
?patch34	equ	@115-@@stk@cpu@tsc_resume$qv+74
?patch35	equ	0
?patch36	equ	@115-@@stk@cpu@tsc_resume$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mejlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_start_paused$qv	segment virtual
	align	2
@@stk@cpu@tsc_start_paused$qv	proc	near
?live16397@0:
	?debug L 457
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-28
	mov       dword ptr [ebp-8],offset @116
@117:
	jmp       short @119
	?debug L 460
@118:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@119:
	cmp       dword ptr [$mejlfcia+4],0
	jne       short @118
	cmp       dword ptr [$mejlfcia],0
	jne       short @118
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [$mejlfcia],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [$mejlfcia+4],eax
	jmp       short @122
@121:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@122:
	cmp       dword ptr [$mejlfcia+4],0
	jne       short @125
	cmp       dword ptr [$mejlfcia],0
@125:
	je        short @123
	mov       eax,dword ptr [$mejlfcia]
	mov       edx,dword ptr [$mejlfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @126
	cmp       eax,dword ptr [ebp-20]
@126:
	setne     cl
	and       ecx,1
	jmp       short @124
@123:
	xor       ecx,ecx
@124:
	test      cl,cl
	jne       short @121
	?debug L 461
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 462
	mov       eax,dword ptr [ebp-32]
	?debug L 463
	mov       edx,dword ptr [ebp-32]
	?debug L 462
	mov       dword ptr [_tsc_LAST_MEASURED],eax
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [_tsc_LAST_MEASURED+4],eax
	?debug L 463
	mov       dword ptr [_tsc_STARTED],edx
	mov       edx,dword ptr [ebp-28]
	?debug L 464
	mov       eax,dword ptr [ebp-32]
	?debug L 463
	mov       dword ptr [_tsc_STARTED+4],edx
	?debug L 464
	mov       dword ptr [_tsc_ELAPSED],0
	mov       dword ptr [_tsc_ELAPSED+4],0
	mov       dword ptr [_tsc_PAUSED],eax
	mov       eax,dword ptr [ebp-28]
	?debug L 466
	mov       edx,dword ptr [ebp-28]
	?debug L 464
	mov       dword ptr [_tsc_PAUSED+4],eax
	?debug L 465
	mov       dword ptr [$mejlfcia],0
	mov       dword ptr [$mejlfcia+4],0
	?debug L 466
	mov       eax,dword ptr [ebp-32]
	?debug L 467
@128:
@127:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@116:
	db        67,71,83,0
	dd        @@stk@cpu@tsc_start_paused$qv+0
	dd        @116+0
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
	dd	?patch37
	dd	?patch38
	dd	?patch39
	df	@@stk@cpu@tsc_start_paused$qv
	dw	0
	dw	4121
	dw	0
	dw	47
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
	dw	48
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mejlfcia
	dw	0
	dw	4108
	dw	0
	dw	49
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	50
	dw	0
	dw	0
	dw	0
?patch37	equ	@128-@@stk@cpu@tsc_start_paused$qv+50
?patch38	equ	0
?patch39	equ	@128-@@stk@cpu@tsc_start_paused$qv
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
?live16398@0:
	?debug L 470
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @129
	?debug L 496
@130:
	mov	 eax,dword ptr [ebp+24]
	?debug L 497
	mov	 ecx,dword ptr [ebp+28]
	?debug L 498
	and	 eax,080000000H
	?debug L 499
	cpuid	
	?debug L 500
	mov	 ESI,dword ptr [ebp+8]
	?debug L 501
	mov	 [ESI],eax
	?debug L 502
	mov	 ESI,dword ptr [ebp+12]
	?debug L 503
	mov	 [ESI],ebx
	?debug L 504
	mov	 ESI,dword ptr [ebp+16]
	?debug L 505
	mov	 [ESI],ecx
	?debug L 506
	mov	 ESI,dword ptr [ebp+20]
	?debug L 507
	mov	 [ESI],edx
	?debug L 509
	mov       eax,dword ptr [ebp+8]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [eax]
	?debug L 518
@132:
@131:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@129:
	db        67,71,83,0
	dd        @@stk@cpu@cpuid$qpuit1t1t1uiui+0
	dd        @129+0
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
	dd	?patch40
	dd	?patch41
	dd	?patch42
	df	@@stk@cpu@cpuid$qpuit1t1t1uiui
	dw	0
	dw	4123
	dw	0
	dw	51
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
?patch40	equ	@132-@@stk@cpu@cpuid$qpuit1t1t1uiui+83
?patch41	equ	0
?patch42	equ	@132-@@stk@cpu@cpuid$qpuit1t1t1uiui
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
$mojlfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$ecklfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$mfklfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$ejklfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$mmklfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eallfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mdllfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpuidex$qpuit1t1t1uiui	segment virtual
	align	2
@@stk@cpu@cpuidex$qpuit1t1t1uiui	proc	near
?live16399@0:
	?debug L 521
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-16
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @133
@134:
	jmp       short @136
	?debug L 531
@135:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@136:
	cmp       dword ptr [$mdllfcia+4],0
	jne       short @135
	cmp       dword ptr [$mdllfcia],0
@137:
	jne       short @135
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [$mdllfcia],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [$mdllfcia+4],eax
	jmp       short @139
@138:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@139:
	cmp       dword ptr [$mdllfcia+4],0
	jne       short @142
	cmp       dword ptr [$mdllfcia],0
@142:
	je        short @140
	mov       eax,dword ptr [$mdllfcia]
	mov       edx,dword ptr [$mdllfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @143
	cmp       eax,dword ptr [ebp-20]
@143:
	setne     cl
	and       ecx,1
	jmp       short @141
@140:
	xor       ecx,ecx
@141:
	test      cl,cl
	jne       short @138
	?debug L 532
	mov       eax,dword ptr [ebp+24]
	mov       edx,dword ptr [$mmklfcia]
	cmp       eax,edx
	jne       short @144
	mov       eax,dword ptr [ebp+28]
	mov       edx,dword ptr [$eallfcia]
	cmp       eax,edx
	jne       short @144
	?debug L 533
	mov       ecx,dword ptr [ebp+8]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [$mojlfcia]
	mov       dword ptr [ecx],eax
	?debug L 534
	mov       edx,dword ptr [ebp+12]
	push      4
	push      edx
	push      0
	call      _CG_DA_EPY
	mov       ecx,dword ptr [$ecklfcia]
	mov       dword ptr [edx],ecx
	?debug L 535
	mov       eax,dword ptr [ebp+16]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$mfklfcia]
	mov       dword ptr [eax],edx
	?debug L 536
	mov       ecx,dword ptr [ebp+20]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [$ejklfcia]
	mov       dword ptr [ecx],eax
	?debug L 537
@145:
	mov       eax,dword ptr [$mojlfcia]
	?debug L 538
?live16399@128: ; EAX = ret
	mov       dword ptr [$mdllfcia],0
	mov       dword ptr [$mdllfcia+4],0
	?debug L 539
	jmp       @146
	?debug L 540
?live16399@160: ; 
@147:
	jmp       short @148
	?debug L 542
@144:
	mov       edx,dword ptr [ebp+24]
	?debug L 543
	mov       ecx,dword ptr [ebp+28]
	?debug L 542
	mov       dword ptr [$mmklfcia],edx
	?debug L 543
	mov       dword ptr [$eallfcia],ecx
	?debug L 687
@148:
	pushfd	
	?debug L 688
	push	 eax
	?debug L 689
	push	 ebx
	?debug L 690
	push	 ecx
	?debug L 691
	push	 edx
	?debug L 692
	push	 esi
	?debug L 693
	push	 edi
	?debug L 694
	mov	 edi,dword ptr [ebp+24]
	?debug L 695
	mov	 eax,edi
	?debug L 696
	and	 eax,080000000H
	?debug L 697
	cpuid	
	?debug L 698
	mov	        esi,eax
	?debug L 699
	xor	        eax,eax
	?debug L 700
	xor	        ebx,ebx
	?debug L 701
	xor	        ecx,ecx
	?debug L 702
	xor	        edx,edx
	?debug L 703
	cmp	        esi,edi
	?debug L 704
	jb        short @149
	?debug L 705
	mov	        eax,edi
	?debug L 706
	mov	        edi,dword ptr [ebp+28]
	?debug L 707
	mov	        ecx,edi
	?debug L 708
	cpuid	
	?debug L 709
@149:
cpuid_save_result:
	?debug L 710
	mov	 dword ptr $mojlfcia,eax
	?debug L 711
	mov	 dword ptr $ecklfcia,ebx
	?debug L 712
	mov	 dword ptr $mfklfcia,ecx
	?debug L 713
	mov	 dword ptr $ejklfcia,edx
	?debug L 714
	pop	 edi
	?debug L 715
	pop	 esi
	?debug L 716
	pop	 edx
	?debug L 717
	pop	 ecx
	?debug L 718
	pop	 ebx
	?debug L 719
	pop	 eax
	?debug L 720
	popfd	
	?debug L 726
	mov       eax,dword ptr [ebp+8]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$mojlfcia]
	mov       dword ptr [eax],edx
	?debug L 727
	mov       ecx,dword ptr [ebp+12]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [$ecklfcia]
	mov       dword ptr [ecx],eax
	?debug L 728
	mov       edx,dword ptr [ebp+16]
	push      4
	push      edx
	push      0
	call      _CG_DA_EPY
	mov       ecx,dword ptr [$mfklfcia]
	mov       dword ptr [edx],ecx
	?debug L 729
	mov       eax,dword ptr [ebp+20]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$ejklfcia]
	mov       dword ptr [eax],edx
	?debug L 746
	mov       ecx,dword ptr [ebp+8]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [ecx]
	?debug L 747
?live16399@864: ; EAX = ret
	mov       dword ptr [$mdllfcia],0
	mov       dword ptr [$mdllfcia+4],0
	?debug L 749
?live16399@880: ; 
@150:
@146:
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@133:
	db        67,71,83,0
	dd        @@stk@cpu@cpuidex$qpuit1t1t1uiui+0
	dd        @133+0
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
	dd	?patch43
	dd	?patch44
	dd	?patch45
	df	@@stk@cpu@cpuidex$qpuit1t1t1uiui
	dw	0
	dw	4125
	dw	0
	dw	59
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
	dw	60
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	12
	dw	0
	dw	1141
	dw	0
	dw	61
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	16
	dw	0
	dw	1141
	dw	0
	dw	62
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	20
	dw	0
	dw	1141
	dw	0
	dw	63
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	24
	dw	0
	dw	117
	dw	0
	dw	64
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	28
	dw	0
	dw	117
	dw	0
	dw	65
	dw	0
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
	dw	?patch46
	dw	529
	dw	?patch47
	dd	?live16399@864-@@stk@cpu@cpuidex$qpuit1t1t1uiui
	dd	?live16399@880-?live16399@864
	dw	17
?patch47	equ	1
?patch46	equ	14
	dw	22
	dw	513
	df	$mdllfcia
	dw	0
	dw	4108
	dw	0
	dw	67
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	68
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eallfcia
	dw	0
	dw	117
	dw	0
	dw	69
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mmklfcia
	dw	0
	dw	117
	dw	0
	dw	70
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ejklfcia
	dw	0
	dw	117
	dw	0
	dw	71
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mfklfcia
	dw	0
	dw	117
	dw	0
	dw	72
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ecklfcia
	dw	0
	dw	117
	dw	0
	dw	73
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mojlfcia
	dw	0
	dw	117
	dw	0
	dw	74
	dw	0
	dw	0
	dw	0
	dw	24
	dw	519
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch48
	df	@145
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	75
	dw	0
	dw	0
	dw	0
	dw	?patch49
	dw	529
	dw	?patch50
	dd	?live16399@128-@@stk@cpu@cpuidex$qpuit1t1t1uiui
	dd	?live16399@160-?live16399@128
	dw	17
?patch50	equ	1
?patch49	equ	14
?patch48	equ	@147-@145
	dw	2
	dw	6
?patch43	equ	@150-@@stk@cpu@cpuidex$qpuit1t1t1uiui+92
?patch44	equ	0
?patch45	equ	@150-@@stk@cpu@cpuidex$qpuit1t1t1uiui
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
$ehllfcia	label	dword
	dd	0
	dd	0
	dd	0
	dd	0
	db	1	dup(?)
	align	4
$mkllfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_vendor$qv	segment virtual
	align	2
@@stk@cpu@cpu_vendor$qv	proc	near
?live16400@0:
	?debug L 752
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-16
	mov       dword ptr [ebp-8],offset @151
@152:
	jmp       short @154
	?debug L 759
@153:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@154:
	cmp       dword ptr [$mkllfcia+4],0
	jne       short @153
	cmp       dword ptr [$mkllfcia],0
	jne       short @153
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       eax,dword ptr [ebp-20]
	mov       dword ptr [$mkllfcia],eax
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [$mkllfcia+4],eax
	jmp       short @157
@156:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@157:
	cmp       dword ptr [$mkllfcia+4],0
	jne       short @160
	cmp       dword ptr [$mkllfcia],0
@160:
	je        short @158
	mov       eax,dword ptr [$mkllfcia]
	mov       edx,dword ptr [$mkllfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @161
	cmp       eax,dword ptr [ebp-20]
@161:
	setne     cl
	and       ecx,1
	jmp       short @159
@158:
	xor       ecx,ecx
@159:
	test      cl,cl
	jne       short @156
	?debug L 760
	push      0
	push      0
	push      offset $ehllfcia+4
	push      offset $ehllfcia+8
	push      offset $ehllfcia
	push      offset $ehllfcia+12
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 761
	mov       eax,dword ptr [$ehllfcia]
	test      eax,eax
	je        short @162
	?debug L 762
	xor       edx,edx
	mov       dword ptr [$ehllfcia+12],edx
	?debug L 764
@162:
	mov       dword ptr [$mkllfcia],0
	mov       dword ptr [$mkllfcia+4],0
	?debug L 765
	push      4
	push      offset $ehllfcia
	push      0
	call      _CG_GDA_EGY
	mov       eax,offset $ehllfcia
	?debug L 766
@164:
@163:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@151:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_vendor$qv+0
	dd        @151+0
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
	dd	?patch51
	dd	?patch52
	dd	?patch53
	df	@@stk@cpu@cpu_vendor$qv
	dw	0
	dw	4127
	dw	0
	dw	76
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
	df	$mkllfcia
	dw	0
	dw	4108
	dw	0
	dw	77
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	78
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ehllfcia
	dw	0
	dw	4129
	dw	0
	dw	79
	dw	0
	dw	0
	dw	0
?patch51	equ	@164-@@stk@cpu@cpu_vendor$qv+41
?patch52	equ	0
?patch53	equ	@164-@@stk@cpu@cpu_vendor$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$memlfcia	label	dword
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
$eimlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_name$qv	segment virtual
	align	2
@@stk@cpu@cpu_name$qv	proc	near
?live16401@0:
	?debug L 769
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @165
	?debug L 775
@166:
	mov       eax,dword ptr [$memlfcia]
	test      eax,eax
	je        short @170
	?debug L 776
	push      4
	push      offset $memlfcia
	push      0
	call      _CG_GDA_EGY
	mov       eax,offset $memlfcia
	jmp       @168
	?debug L 778
@169:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@170:
	cmp       dword ptr [$eimlfcia+4],0
	jne       short @169
	cmp       dword ptr [$eimlfcia],0
	jne       short @169
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$eimlfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$eimlfcia+4],edx
	jmp       short @173
@172:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@173:
	cmp       dword ptr [$eimlfcia+4],0
	jne       short @176
	cmp       dword ptr [$eimlfcia],0
@176:
	je        short @174
	mov       eax,dword ptr [$eimlfcia]
	mov       edx,dword ptr [$eimlfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @177
	cmp       eax,dword ptr [ebp-20]
@177:
	setne     cl
	and       ecx,1
	jmp       short @175
@174:
	xor       ecx,ecx
@175:
	test      cl,cl
	jne       short @172
	?debug L 781
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
	jae       short @178
	?debug L 782
	mov       dword ptr [$eimlfcia],0
	mov       dword ptr [$eimlfcia+4],0
	?debug L 783
	push      12
	push      4
	push      offset s@
	push      0
	call      _CG_GDA_EGY
	push      offset s@
	push      4
	push      offset $memlfcia
	push      0
	call      _CG_GDA_EGY
	push      offset $memlfcia
	call      @@stk@mem@mov$qpvpxvxui
	jmp       @168
	?debug L 785
@178:
	mov       esi,-2147483646
	xor       ebx,ebx
	?debug L 787
?live16401@128: ; EBX = i, ESI = f
@179:
	lea       eax,dword ptr [ebx+3]
	push      0
	shl       eax,2
	push      esi
	add       eax,offset $memlfcia
	push      offset $memlfcia
	push      eax
	call      _CG_A_BP
	push      eax
	lea       edx,dword ptr [ebx+2]
	shl       edx,2
	add       edx,offset $memlfcia
	push      offset $memlfcia
	push      edx
	call      _CG_A_BP
	push      edx
	lea       ecx,dword ptr [ebx+1]
	shl       ecx,2
	add       ecx,offset $memlfcia
	push      offset $memlfcia
	push      ecx
	call      _CG_A_BP
	push      ecx
	mov       eax,ebx
	shl       eax,2
	add       eax,offset $memlfcia
	push      offset $memlfcia
	push      eax
	call      _CG_A_BP
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 785
	inc       esi
	add       ebx,4
	cmp       ebx,12
	jb        short @179
	?debug L 789
?live16401@160: ; 
	push      32
	push      4
	push      offset $memlfcia
	push      0
	call      _CG_GDA_EGY
	push      offset $memlfcia
	call      @@stk@cstr@trim$qpcc
	?debug L 790
	mov       dword ptr [$eimlfcia],0
	mov       dword ptr [$eimlfcia+4],0
	?debug L 791
	push      4
	push      offset $memlfcia
	push      0
	call      _CG_GDA_EGY
	mov       eax,offset $memlfcia
	?debug L 792
@182:
@168:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@165:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_name$qv+0
	dd        @165+0
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
	dd	?patch54
	dd	?patch55
	dd	?patch56
	df	@@stk@cpu@cpu_name$qv
	dw	0
	dw	4130
	dw	0
	dw	80
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
	dw	81
	dw	0
	dw	0
	dw	0
	dw	?patch57
	dw	529
	dw	?patch58
	dd	?live16401@128-@@stk@cpu@cpu_name$qv
	dd	?live16401@160-?live16401@128
	dw	20
?patch58	equ	1
?patch57	equ	14
	dw	16
	dw	2
	dw	117
	dw	0
	dw	23
	dw	82
	dw	0
	dw	0
	dw	0
	dw	?patch59
	dw	529
	dw	?patch60
	dd	?live16401@128-@@stk@cpu@cpu_name$qv
	dd	?live16401@160-?live16401@128
	dw	23
?patch60	equ	1
?patch59	equ	14
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
	df	$eimlfcia
	dw	0
	dw	4108
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
	df	$memlfcia
	dw	0
	dw	4132
	dw	0
	dw	89
	dw	0
	dw	0
	dw	0
?patch54	equ	@182-@@stk@cpu@cpu_name$qv+73
?patch55	equ	0
?patch56	equ	@182-@@stk@cpu@cpu_name$qv
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
$ecnlfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mfnlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_threads$qv	segment virtual
	align	2
@@stk@cpu@cpu_num_threads$qv	proc	near
?live16402@0:
	?debug L 795
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @183
	?debug L 801
@184:
	mov       eax,dword ptr [$ecnlfcia]
	cmp       eax,-1
	jne       @186
	?debug L 802
?live16402@32: ; EAX = @temp4
	jmp       short @188
	?debug L 804
?live16402@48: ; 
@187:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@188:
	cmp       dword ptr [$mfnlfcia+4],0
	jne       short @187
	cmp       dword ptr [$mfnlfcia],0
	jne       short @187
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$mfnlfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$mfnlfcia+4],edx
	jmp       short @191
@190:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@191:
	cmp       dword ptr [$mfnlfcia+4],0
	jne       short @194
	cmp       dword ptr [$mfnlfcia],0
@194:
	je        short @192
	mov       eax,dword ptr [$mfnlfcia]
	mov       edx,dword ptr [$mfnlfcia+4]
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
	?debug L 807
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
	?debug L 809
	mov       eax,dword ptr [ebp-44]
	shr       eax,16
	and       eax,255
	inc       eax
	mov       dword ptr [$ecnlfcia],eax
	?debug L 811
?live16402@96: ; EAX = @temp3
	mov       dword ptr [$mfnlfcia],0
	mov       dword ptr [$mfnlfcia+4],0
	?debug L 813
?live16402@112: ; 
@196:
@186:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@183:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_num_threads$qv+0
	dd        @183+0
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
	dd	?patch61
	dd	?patch62
	dd	?patch63
	df	@@stk@cpu@cpu_num_threads$qv
	dw	0
	dw	4133
	dw	0
	dw	90
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
	dw	91
	dw	0
	dw	0
	dw	0
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
	df	$mfnlfcia
	dw	0
	dw	4108
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
	df	$ecnlfcia
	dw	0
	dw	117
	dw	0
	dw	98
	dw	0
	dw	0
	dw	0
?patch61	equ	@196-@@stk@cpu@cpu_num_threads$qv+74
?patch62	equ	0
?patch63	equ	@196-@@stk@cpu@cpu_num_threads$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ejnlfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mmnlfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_cores$qv	segment virtual
	align	2
@@stk@cpu@cpu_num_cores$qv	proc	near
?live16403@0:
	?debug L 816
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @197
	?debug L 822
@198:
	mov       eax,dword ptr [$ejnlfcia]
	cmp       eax,-1
	jne       @200
	?debug L 823
?live16403@32: ; EAX = @temp3
	jmp       short @202
	?debug L 825
?live16403@48: ; 
@201:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@202:
	cmp       dword ptr [$mmnlfcia+4],0
	jne       short @201
	cmp       dword ptr [$mmnlfcia],0
	jne       short @201
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$mmnlfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$mmnlfcia+4],edx
	jmp       short @205
@204:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@205:
	cmp       dword ptr [$mmnlfcia+4],0
	jne       short @208
	cmp       dword ptr [$mmnlfcia],0
@208:
	je        short @206
	mov       eax,dword ptr [$mmnlfcia]
	mov       edx,dword ptr [$mmnlfcia+4]
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
	?debug L 828
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
	jne       short @210
	cmp       eax,0
	jne       short @210
	?debug L 830
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
	?debug L 831
	mov       ecx,dword ptr [ebp-52]
	shr       ecx,26
	and       ecx,63
	inc       ecx
	mov       dword ptr [$ejnlfcia],ecx
	?debug L 833
	jmp       short @212
	?debug L 835
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
	jne       short @213
	cmp       eax,0
	jne       short @213
	?debug L 837
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
	?debug L 838
	mov       edx,dword ptr [ebp-36]
	and       edx,255
	inc       edx
	mov       dword ptr [$ejnlfcia],edx
	?debug L 840
	jmp       short @212
	?debug L 841
@213:
	call      @@stk@cpu@cpu_num_threads$qv
	mov       dword ptr [$ejnlfcia],eax
	?debug L 842
@212:
	mov       eax,dword ptr [$ejnlfcia]
	?debug L 843
?live16403@224: ; EAX = ret
	mov       dword ptr [$mmnlfcia],0
	mov       dword ptr [$mmnlfcia+4],0
	?debug L 846
?live16403@240: ; 
@215:
@200:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@197:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_num_cores$qv+0
	dd        @197+0
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
	dd	?patch64
	dd	?patch65
	dd	?patch66
	df	@@stk@cpu@cpu_num_cores$qv
	dw	0
	dw	4135
	dw	0
	dw	99
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
	dw	100
	dw	0
	dw	0
	dw	0
	dw	?patch67
	dw	529
	dw	?patch68
	dd	?live16403@224-@@stk@cpu@cpu_num_cores$qv
	dd	?live16403@240-?live16403@224
	dw	17
?patch68	equ	1
?patch67	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	101
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	102
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	103
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	104
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mmnlfcia
	dw	0
	dw	4108
	dw	0
	dw	105
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	106
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ejnlfcia
	dw	0
	dw	117
	dw	0
	dw	107
	dw	0
	dw	0
	dw	0
?patch64	equ	@215-@@stk@cpu@cpu_num_cores$qv+73
?patch65	equ	0
?patch66	equ	@215-@@stk@cpu@cpu_num_cores$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eaolfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mdolfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_cache_size$quc	segment virtual
	align	2
@@stk@cpu@cpu_cache_size$quc	proc	near
?live16404@0:
	?debug L 847
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @216
@217:
	mov       ebx,dword ptr [ebp+8]
	?debug L 853
?live16404@16: ; EBX = a_level
	mov       eax,dword ptr [$eaolfcia]
	cmp       eax,-1
	jne       @219
	?debug L 854
?live16404@32: ; EAX = @temp5
	jmp       short @221
	?debug L 856
?live16404@48: ; EBX = a_level
@220:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@221:
	cmp       dword ptr [$mdolfcia+4],0
	jne       short @220
	cmp       dword ptr [$mdolfcia],0
	jne       short @220
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$mdolfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$mdolfcia+4],edx
	jmp       short @224
@223:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@224:
	cmp       dword ptr [$mdolfcia+4],0
	jne       short @227
	cmp       dword ptr [$mdolfcia],0
@227:
	je        short @225
	mov       eax,dword ptr [$mdolfcia]
	mov       edx,dword ptr [$mdolfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @228
	cmp       eax,dword ptr [ebp-20]
@228:
	setne     cl
	and       ecx,1
	jmp       short @226
@225:
	xor       ecx,ecx
@226:
	test      cl,cl
	jne       short @223
	?debug L 859
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
	jne       @229
	cmp       eax,0
	jne       @229
	?debug L 860
	cmp       bl,2
	jne       @231
	?debug L 861
?live16404@96: ; 
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
	?debug L 862
	mov       eax,dword ptr [ebp-28]
	and       eax,255
	cmp       eax,64
	jne       short @232
	?debug L 863
	xor       edx,edx
	mov       dword ptr [$eaolfcia],edx
	jmp       @233
	?debug L 865
?live16404@144: ; EAX = @temp4
@232:
	cmp       eax,65
	jne       short @234
	?debug L 866
?live16404@160: ; 
	mov       dword ptr [$eaolfcia],128
	jmp       @233
	?debug L 868
?live16404@176: ; EAX = @temp4
@234:
	cmp       eax,66
	jne       short @235
	?debug L 869
?live16404@192: ; 
	mov       dword ptr [$eaolfcia],256
	jmp       @233
	?debug L 871
?live16404@208: ; EAX = @temp4
@235:
	cmp       eax,67
	jne       short @236
	?debug L 872
?live16404@224: ; 
	mov       dword ptr [$eaolfcia],512
	jmp       @233
	?debug L 874
?live16404@240: ; EAX = @temp4
@236:
	cmp       eax,68
	jne       short @237
	?debug L 875
?live16404@256: ; 
	mov       dword ptr [$eaolfcia],1024
	jmp       @233
	?debug L 877
?live16404@272: ; EAX = @temp4
@237:
	cmp       eax,69
	jne       short @238
	?debug L 878
?live16404@288: ; 
	mov       dword ptr [$eaolfcia],2048
	jmp       @233
	?debug L 882
@238:
	xor       ecx,ecx
	mov       dword ptr [$eaolfcia],ecx
	?debug L 884
	jmp       @233
	?debug L 885
@231:
	xor       eax,eax
	mov       dword ptr [$eaolfcia],eax
	?debug L 886
	jmp       @233
	?debug L 888
?live16404@368: ; EBX = a_level
@229:
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
	jne       short @240
	cmp       eax,0
@240:
	jne       @241
	?debug L 889
	test      bl,bl
	jne       short @242
	?debug L 890
?live16404@400: ; 
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
	?debug L 891
	mov       ecx,dword ptr [ebp-28]
	shr       ecx,24
	and       ecx,255
	mov       dword ptr [$eaolfcia],ecx
	?debug L 892
	jmp       @243
	?debug L 894
?live16404@448: ; EBX = a_level
@242:
	cmp       bl,1
	jne       short @244
	?debug L 895
?live16404@464: ; 
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
	?debug L 896
	mov       edx,dword ptr [ebp-36]
	shr       edx,24
	and       edx,255
	mov       dword ptr [$eaolfcia],edx
	?debug L 897
	jmp       short @243
	?debug L 899
?live16404@512: ; EBX = a_level
@244:
	cmp       bl,2
	jne       short @245
	?debug L 900
?live16404@528: ; 
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
	?debug L 901
	mov       eax,dword ptr [ebp-36]
	shr       eax,16
	and       eax,65535
	mov       dword ptr [$eaolfcia],eax
	?debug L 902
	jmp       short @243
	?debug L 904
?live16404@576: ; EBX = a_level
@245:
	cmp       bl,3
	jne       short @246
	?debug L 905
?live16404@592: ; 
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
	?debug L 906
	mov       ecx,dword ptr [ebp-28]
	shr       ecx,18
	and       ecx,16383
	shl       ecx,9
	mov       dword ptr [$eaolfcia],ecx
	?debug L 909
@246:
@243:
@241:
@233:
	mov       eax,dword ptr [$eaolfcia]
	?debug L 910
?live16404@640: ; EAX = ret
	mov       dword ptr [$mdolfcia],0
	mov       dword ptr [$mdolfcia+4],0
	?debug L 912
?live16404@656: ; 
@247:
@219:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@216:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_cache_size$quc+0
	dd        @216+0
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
	dd	?patch69
	dd	?patch70
	dd	?patch71
	df	@@stk@cpu@cpu_cache_size$quc
	dw	0
	dw	4137
	dw	0
	dw	108
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
	dw	109
	dw	0
	dw	0
	dw	0
	dw	?patch72
	dw	529
	dw	?patch73
	dd	?live16404@16-@@stk@cpu@cpu_cache_size$quc
	dd	?live16404@32-?live16404@16
	dw	4
	dd	?live16404@48-@@stk@cpu@cpu_cache_size$quc
	dd	?live16404@96-?live16404@48
	dw	4
	dd	?live16404@368-@@stk@cpu@cpu_cache_size$quc
	dd	?live16404@400-?live16404@368
	dw	4
	dd	?live16404@448-@@stk@cpu@cpu_cache_size$quc
	dd	?live16404@464-?live16404@448
	dw	4
	dd	?live16404@512-@@stk@cpu@cpu_cache_size$quc
	dd	?live16404@528-?live16404@512
	dw	4
	dd	?live16404@576-@@stk@cpu@cpu_cache_size$quc
	dd	?live16404@592-?live16404@576
	dw	4
?patch73	equ	6
?patch72	equ	64
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	110
	dw	0
	dw	0
	dw	0
	dw	?patch74
	dw	529
	dw	?patch75
	dd	?live16404@640-@@stk@cpu@cpu_cache_size$quc
	dd	?live16404@656-?live16404@640
	dw	17
?patch75	equ	1
?patch74	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	111
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	112
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	113
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	114
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mdolfcia
	dw	0
	dw	4108
	dw	0
	dw	115
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	116
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eaolfcia
	dw	0
	dw	117
	dw	0
	dw	117
	dw	0
	dw	0
	dw	0
?patch69	equ	@247-@@stk@cpu@cpu_cache_size$quc+73
?patch70	equ	0
?patch71	equ	@247-@@stk@cpu@cpu_cache_size$quc
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
$eholfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mkolfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_cache_line_size$quc	segment virtual
	align	2
@@stk@cpu@cpu_cache_line_size$quc	proc	near
?live16405@0:
	?debug L 915
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	push      ebx
	mov       dword ptr [ebp-8],offset @248
@249:
	mov       ebx,dword ptr [ebp+8]
	?debug L 921
?live16405@16: ; EBX = a_level
	mov       eax,dword ptr [$eholfcia]
	cmp       eax,-1
	jne       @251
	?debug L 922
?live16405@32: ; EAX = @temp4
	jmp       short @253
	?debug L 924
?live16405@48: ; EBX = a_level
@252:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@253:
	cmp       dword ptr [$mkolfcia+4],0
	jne       short @252
	cmp       dword ptr [$mkolfcia],0
	jne       short @252
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$mkolfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$mkolfcia+4],edx
	jmp       short @256
@255:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@256:
	cmp       dword ptr [$mkolfcia+4],0
	jne       short @259
	cmp       dword ptr [$mkolfcia],0
@259:
	je        short @257
	mov       eax,dword ptr [$mkolfcia]
	mov       edx,dword ptr [$mkolfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @260
	cmp       eax,dword ptr [ebp-20]
@260:
	setne     cl
	and       ecx,1
	jmp       short @258
@257:
	xor       ecx,ecx
@258:
	test      cl,cl
	jne       short @255
	?debug L 927
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
	jne       short @261
	cmp       eax,0
	jne       short @261
	?debug L 928
?live16405@80: ; 
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
	?debug L 929
	mov       ecx,dword ptr [ebp-44]
	and       ecx,4095
	inc       ecx
	mov       dword ptr [$eholfcia],ecx
	?debug L 930
	jmp       @263
	?debug L 932
?live16405@128: ; EBX = a_level
@261:
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
	jne       @264
	cmp       eax,0
	jne       @264
	?debug L 933
	test      bl,bl
	jne       short @266
	?debug L 934
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
	?debug L 935
	mov       edx,dword ptr [ebp-28]
	and       edx,255
	mov       dword ptr [$eholfcia],edx
	?debug L 937
@266:
	cmp       bl,1
	jne       short @267
	?debug L 938
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
	?debug L 939
	mov       eax,dword ptr [ebp-36]
	and       eax,255
	mov       dword ptr [$eholfcia],eax
	?debug L 941
@267:
	cmp       bl,2
	jne       short @268
	?debug L 942
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
	?debug L 943
	mov       ecx,dword ptr [ebp-36]
	and       ecx,255
	mov       dword ptr [$eholfcia],ecx
	?debug L 945
@268:
	cmp       bl,3
	jne       short @269
	?debug L 946
?live16405@304: ; 
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
	?debug L 947
	mov       edx,dword ptr [ebp-28]
	and       edx,255
	mov       dword ptr [$eholfcia],edx
	?debug L 950
@269:
@264:
@263:
	mov       eax,dword ptr [$eholfcia]
	?debug L 951
?live16405@352: ; EAX = ret
	mov       dword ptr [$mkolfcia],0
	mov       dword ptr [$mkolfcia+4],0
	?debug L 954
?live16405@368: ; 
@270:
@251:
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@248:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_cache_line_size$quc+0
	dd        @248+0
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
	dd	?patch76
	dd	?patch77
	dd	?patch78
	df	@@stk@cpu@cpu_cache_line_size$quc
	dw	0
	dw	4139
	dw	0
	dw	118
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
	dw	119
	dw	0
	dw	0
	dw	0
	dw	?patch79
	dw	529
	dw	?patch80
	dd	?live16405@16-@@stk@cpu@cpu_cache_line_size$quc
	dd	?live16405@32-?live16405@16
	dw	4
	dd	?live16405@48-@@stk@cpu@cpu_cache_line_size$quc
	dd	?live16405@80-?live16405@48
	dw	4
	dd	?live16405@128-@@stk@cpu@cpu_cache_line_size$quc
	dd	?live16405@304-?live16405@128
	dw	4
?patch80	equ	3
?patch79	equ	34
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	120
	dw	0
	dw	0
	dw	0
	dw	?patch81
	dw	529
	dw	?patch82
	dd	?live16405@352-@@stk@cpu@cpu_cache_line_size$quc
	dd	?live16405@368-?live16405@352
	dw	17
?patch82	equ	1
?patch81	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	121
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	122
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	123
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	124
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mkolfcia
	dw	0
	dw	4108
	dw	0
	dw	125
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	126
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eholfcia
	dw	0
	dw	117
	dw	0
	dw	127
	dw	0
	dw	0
	dw	0
?patch76	equ	@270-@@stk@cpu@cpu_cache_line_size$quc+72
?patch77	equ	0
?patch78	equ	@270-@@stk@cpu@cpu_cache_line_size$quc
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
$eoolfcia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$mbplfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_mhz$qo	segment virtual
	align	2
@@stk@cpu@cpu_num_mhz$qo	proc	near
?live16406@0:
	?debug L 957
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-168
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @271
	?debug L 963
@272:
	mov       eax,dword ptr [$eoolfcia]
	test      eax,eax
	je        short @276
	mov       dl,byte ptr [ebp+8]
	test      dl,dl
	je        @274
	?debug L 964
?live16406@32: ; EAX = @temp18
	jmp       short @276
	?debug L 966
?live16406@48: ; 
@275:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@276:
	cmp       dword ptr [$mbplfcia+4],0
	jne       short @275
	cmp       dword ptr [$mbplfcia],0
	jne       short @275
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$mbplfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$mbplfcia+4],ecx
	jmp       short @279
@278:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@279:
	cmp       dword ptr [$mbplfcia+4],0
	jne       short @282
	cmp       dword ptr [$mbplfcia],0
@282:
	je        short @280
	mov       eax,dword ptr [$mbplfcia]
	mov       edx,dword ptr [$mbplfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @283
	cmp       eax,dword ptr [ebp-20]
@283:
	setne     al
	and       eax,1
	jmp       short @281
@280:
	xor       eax,eax
@281:
	test      al,al
	jne       short @278
	?debug L 979
	xor       ebx,ebx
	?debug L 980
?live16406@80: ; EBX = i
@284:
	call      @@stk@cpu@tsc_init$qv
	?debug L 981
	call      @@stk@cpu@tsc_start$qv
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-68],eax
	mov       dword ptr [ebp-64],edx
	call      @@stk@cpu@tsc_checkpoint$qv
	?debug L 982
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-128],eax
	mov       dword ptr [ebp-124],edx
	?debug L 983
@286:
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-80],eax
	mov       dword ptr [ebp-76],edx
	?debug L 984
	mov       eax,dword ptr [ebp-80]
	mov       edx,dword ptr [ebp-76]
	cmp       edx,dword ptr [ebp-64]
	jne       short @288
	cmp       eax,dword ptr [ebp-68]
@288:
	jbe       short @286
	?debug L 985
	call      @@stk@cpu@tsc_start$qv
	?debug L 986
@289:
	mov       edx,21
	?debug L 987
?live16406@192: ; EBX = i, EDX = trash1
@290:
	xor       eax,eax
@292:
	inc       eax
	cmp       eax,1000000
	jb        short @292
	?debug L 986
	dec       edx
	test      edx,edx
	ja        short @290
	?debug L 990
?live16406@224: ; EBX = i
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-92],eax
	mov       dword ptr [ebp-88],edx
	?debug L 991
@296:
	call      @@stk@time@time_ms$qv
	mov       dword ptr [ebp-104],eax
	mov       dword ptr [ebp-100],edx
	?debug L 992
	mov       eax,dword ptr [ebp-104]
	mov       edx,dword ptr [ebp-100]
	cmp       edx,dword ptr [ebp-88]
	jne       short @298
	cmp       eax,dword ptr [ebp-92]
@298:
	jbe       short @296
	?debug L 993
	call      @@stk@cpu@tsc_checkpoint$qv
	?debug L 994
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	?debug L 995
	mov       eax,dword ptr [ebp-104]
	mov       edx,dword ptr [ebp-100]
	sub       eax,dword ptr [ebp-80]
	sbb       edx,dword ptr [ebp-76]
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	?debug L 996
	mov       eax,dword ptr [ebp-116]
	mov       edx,dword ptr [ebp-112]
	sub       eax,dword ptr [ebp-128]
	sbb       edx,dword ptr [ebp-124]
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	?debug L 997
	push      0
	push      1000
	mov       eax,dword ptr [ebp-116]
	mov       edx,dword ptr [ebp-112]
	call      __llmul
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	?debug L 998
	cmp       dword ptr [ebp-52],0
	jne       short @300
	cmp       dword ptr [ebp-56],0
@300:
	je        short @299
	push      dword ptr [ebp-52]
	push      dword ptr [ebp-56]
	mov       eax,dword ptr [ebp-116]
	mov       edx,dword ptr [ebp-112]
	call      __lludiv
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
	jmp       short @301
	?debug L 999
@299:
	mov       dword ptr [ebp-116],0
	mov       dword ptr [ebp-112],0
	?debug L 1000
@301:
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
@302:
	inc       ebx
	cmp       ebx,5
	jb        @284
	?debug L 1002
?live16406@400: ; 
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
	?debug L 1003
?live16406@416: ; EBX = i, ECX = imax, ESI = imin
@304:
	push      8
	push      -172
	push      ebx
	push      3
	push      0
	call      _CG_LDA_EOXSY
	mov       eax,dword ptr [ebp+8*ebx-172]
	mov       edx,dword ptr [ebp+8*ebx-168]
	cmp       edx,dword ptr [ebp-28]
	jne       short @307
	cmp       eax,dword ptr [ebp-32]
@307:
	jbe       short @306
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
	?debug L 1004
@306:
	push      8
	push      -172
	push      ebx
	push      3
	push      0
	call      _CG_LDA_EOXSY
	mov       eax,dword ptr [ebp+8*ebx-172]
	mov       edx,dword ptr [ebp+8*ebx-168]
	cmp       edx,dword ptr [ebp-40]
	jne       short @309
	cmp       eax,dword ptr [ebp-44]
@309:
	jae       short @308
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
@308:
	inc       ebx
	cmp       ebx,5
	jb        @304
	?debug L 1006
?live16406@448: ; ECX = imax, ESI = imin
	mov       dword ptr [ebp-116],0
	mov       dword ptr [ebp-112],0
	xor       ebx,ebx
@311:
	cmp       esi,ebx
	je        short @313
	cmp       ecx,ebx
	je        short @313
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
@313:
	inc       ebx
	cmp       ebx,5
	jb        short @311
	?debug L 1008
?live16406@464: ; 
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
	?debug L 1009
	mov       eax,dword ptr [ebp-116]
	mov       ecx,eax
	mov       dword ptr [$eoolfcia],ecx
	?debug L 1011
?live16406@496: ; ECX = @temp17
	mov       dword ptr [$mbplfcia],0
	mov       dword ptr [$mbplfcia+4],0
	?debug L 1012
	mov       eax,ecx
	?debug L 1013
?live16406@528: ; 
@315:
@274:
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@271:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_num_mhz$qo+0
	dd        @271+0
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
	dd	?patch83
	dd	?patch84
	dd	?patch85
	df	@@stk@cpu@cpu_num_mhz$qo
	dw	0
	dw	4141
	dw	0
	dw	128
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
	dw	129
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65408
	dw	65535
	dw	119
	dw	0
	dw	130
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65420
	dw	65535
	dw	119
	dw	0
	dw	131
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65432
	dw	65535
	dw	119
	dw	0
	dw	132
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65444
	dw	65535
	dw	119
	dw	0
	dw	133
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65456
	dw	65535
	dw	119
	dw	0
	dw	134
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65468
	dw	65535
	dw	119
	dw	0
	dw	135
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65480
	dw	65535
	dw	119
	dw	0
	dw	136
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	20
	dw	137
	dw	0
	dw	0
	dw	0
	dw	?patch86
	dw	529
	dw	?patch87
	dd	?live16406@80-@@stk@cpu@cpu_num_mhz$qo
	dd	?live16406@400-?live16406@80
	dw	20
	dd	?live16406@416-@@stk@cpu@cpu_num_mhz$qo
	dd	?live16406@448-?live16406@416
	dw	20
?patch87	equ	2
?patch86	equ	24
	dw	16
	dw	2
	dw	117
	dw	0
	dw	23
	dw	138
	dw	0
	dw	0
	dw	0
	dw	?patch88
	dw	529
	dw	?patch89
	dd	?live16406@416-@@stk@cpu@cpu_num_mhz$qo
	dd	?live16406@464-?live16406@416
	dw	23
?patch89	equ	1
?patch88	equ	14
	dw	16
	dw	2
	dw	117
	dw	0
	dw	18
	dw	139
	dw	0
	dw	0
	dw	0
	dw	?patch90
	dw	529
	dw	?patch91
	dd	?live16406@416-@@stk@cpu@cpu_num_mhz$qo
	dd	?live16406@464-?live16406@416
	dw	18
?patch91	equ	1
?patch90	equ	14
	dw	18
	dw	512
	dw	65364
	dw	65535
	dw	4143
	dw	0
	dw	140
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	119
	dw	0
	dw	141
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65504
	dw	65535
	dw	119
	dw	0
	dw	142
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mbplfcia
	dw	0
	dw	4108
	dw	0
	dw	143
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	144
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eoolfcia
	dw	0
	dw	117
	dw	0
	dw	145
	dw	0
	dw	0
	dw	0
	dw	24
	dw	519
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch92
	df	@289
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	146
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	19
	dw	147
	dw	0
	dw	0
	dw	0
	dw	?patch93
	dw	529
	dw	?patch94
	dd	?live16406@192-@@stk@cpu@cpu_num_mhz$qo
	dd	?live16406@224-?live16406@192
	dw	19
?patch94	equ	1
?patch93	equ	14
?patch92	equ	@302-@289
	dw	2
	dw	6
?patch83	equ	@315-@@stk@cpu@cpu_num_mhz$qo+130
?patch84	equ	0
?patch85	equ	@315-@@stk@cpu@cpu_num_mhz$qo
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
$mlplfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$epplfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_x87$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_x87$qv	proc	near
?live16407@0:
	?debug L 1018
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @316
	?debug L 1024
@317:
	mov       eax,dword ptr [$mlplfcia]
	cmp       eax,-1
	je        short @321
	?debug L 1025
?live16407@32: ; EAX = @temp2
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @319
	?debug L 1027
?live16407@48: ; 
@320:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@321:
	cmp       dword ptr [$epplfcia+4],0
	jne       short @320
	cmp       dword ptr [$epplfcia],0
	jne       short @320
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$epplfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$epplfcia+4],ecx
	jmp       short @324
@323:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@324:
	cmp       dword ptr [$epplfcia+4],0
	jne       short @327
	cmp       dword ptr [$epplfcia],0
@327:
	je        short @325
	mov       eax,dword ptr [$epplfcia]
	mov       edx,dword ptr [$epplfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @328
	cmp       eax,dword ptr [ebp-20]
@328:
	setne     al
	and       eax,1
	jmp       short @326
@325:
	xor       eax,eax
@326:
	test      al,al
	jne       short @323
	?debug L 1030
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
	?debug L 1032
	test      byte ptr [ebp-28],1
	je        short @329
	?debug L 1033
	mov       dword ptr [$mlplfcia],1
	?debug L 1034
	mov       dword ptr [$epplfcia],0
	mov       dword ptr [$epplfcia+4],0
	?debug L 1035
	mov       al,1
	jmp       short @319
	?debug L 1039
@329:
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
	test      byte ptr [ebp-28],1
	je        short @330
	?debug L 1042
	mov       dword ptr [$mlplfcia],1
	?debug L 1043
	mov       dword ptr [$epplfcia],0
	mov       dword ptr [$epplfcia+4],0
	?debug L 1044
	mov       al,1
	jmp       short @319
	?debug L 1046
@330:
	xor       edx,edx
	?debug L 1048
	xor       eax,eax
	?debug L 1046
	mov       dword ptr [$mlplfcia],edx
	?debug L 1047
	mov       dword ptr [$epplfcia],0
	mov       dword ptr [$epplfcia+4],0
	?debug L 1049
@331:
@319:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@316:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_x87$qv+0
	dd        @316+0
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
	dd	?patch95
	dd	?patch96
	dd	?patch97
	df	@@stk@cpu@cpu_has_x87$qv
	dw	0
	dw	4144
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
	df	$epplfcia
	dw	0
	dw	4108
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
	df	$mlplfcia
	dw	0
	dw	117
	dw	0
	dw	155
	dw	0
	dw	0
	dw	0
?patch95	equ	@331-@@stk@cpu@cpu_has_x87$qv+73
?patch96	equ	0
?patch97	equ	@331-@@stk@cpu@cpu_has_x87$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mcamfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$egamfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_mmx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mmx$qv	proc	near
?live16408@0:
	?debug L 1052
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @332
	?debug L 1058
@333:
	mov       eax,dword ptr [$mcamfcia]
	cmp       eax,-1
	je        short @337
	?debug L 1059
?live16408@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @335
	?debug L 1061
?live16408@48: ; 
@336:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@337:
	cmp       dword ptr [$egamfcia+4],0
	jne       short @336
	cmp       dword ptr [$egamfcia],0
	jne       short @336
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$egamfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$egamfcia+4],ecx
	jmp       short @340
@339:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@340:
	cmp       dword ptr [$egamfcia+4],0
	jne       short @343
	cmp       dword ptr [$egamfcia],0
@343:
	je        short @341
	mov       eax,dword ptr [$egamfcia]
	mov       edx,dword ptr [$egamfcia+4]
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
	?debug L 1064
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
	?debug L 1066
	mov       eax,dword ptr [ebp-28]
	?debug L 1064
	add       esp,24
	?debug L 1066
	and       eax,8388608
	?debug L 1067
?live16408@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1066
?live16408@144: ; 
	mov       dword ptr [$mcamfcia],eax
	?debug L 1067
?live16408@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1068
?live16408@176: ; EAX = ret
	mov       dword ptr [$egamfcia],0
	mov       dword ptr [$egamfcia+4],0
	?debug L 1067
?live16408@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1070
?live16408@208: ; 
@345:
@335:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@332:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_mmx$qv+0
	dd        @332+0
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
	dd	?patch98
	dd	?patch99
	dd	?patch100
	df	@@stk@cpu@cpu_has_mmx$qv
	dw	0
	dw	4146
	dw	0
	dw	156
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
	dw	157
	dw	0
	dw	0
	dw	0
	dw	?patch101
	dw	529
	dw	?patch102
	dd	?live16408@176-@@stk@cpu@cpu_has_mmx$qv
	dd	?live16408@192-?live16408@176
	dw	1
?patch102	equ	1
?patch101	equ	14
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
	df	$egamfcia
	dw	0
	dw	4108
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
	df	$mcamfcia
	dw	0
	dw	117
	dw	0
	dw	164
	dw	0
	dw	0
	dw	0
?patch98	equ	@345-@@stk@cpu@cpu_has_mmx$qv+71
?patch99	equ	0
?patch100	equ	@345-@@stk@cpu@cpu_has_mmx$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mjamfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$enamfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_mmxext$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mmxext$qv	proc	near
?live16409@0:
	?debug L 1073
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @346
	?debug L 1079
@347:
	mov       eax,dword ptr [$mjamfcia]
	cmp       eax,-1
	je        short @351
	?debug L 1080
?live16409@32: ; EAX = @temp5
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @349
	?debug L 1082
?live16409@48: ; 
@350:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@351:
	cmp       dword ptr [$enamfcia+4],0
	jne       short @350
	cmp       dword ptr [$enamfcia],0
	jne       short @350
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$enamfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$enamfcia+4],ecx
	jmp       short @354
@353:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@354:
	cmp       dword ptr [$enamfcia+4],0
	jne       short @357
	cmp       dword ptr [$enamfcia],0
@357:
	je        short @355
	mov       eax,dword ptr [$enamfcia]
	mov       edx,dword ptr [$enamfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @358
	cmp       eax,dword ptr [ebp-20]
@358:
	setne     al
	and       eax,1
	jmp       short @356
@355:
	xor       eax,eax
@356:
	test      al,al
	jne       short @353
	?debug L 1085
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
	?debug L 1087
	mov       eax,dword ptr [ebp-28]
	and       eax,4194304
	mov       dword ptr [$mjamfcia],eax
	?debug L 1088
?live16409@96: ; EAX = @temp3
	test      eax,eax
	je        short @359
	?debug L 1089
?live16409@112: ; 
	mov       al,1
	jmp       short @349
	?debug L 1091
@359:
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
	?debug L 1093
	mov       eax,dword ptr [ebp-28]
	?debug L 1091
	add       esp,24
	?debug L 1093
	and       eax,33554432
	?debug L 1094
?live16409@192: ; EAX = @temp4
	test      eax,eax
	?debug L 1093
?live16409@208: ; 
	mov       dword ptr [$mjamfcia],eax
	?debug L 1094
?live16409@224: ; EAX = @temp4
	setne     dl
	and       edx,1
	?debug L 1095
?live16409@240: ; EAX = ret
	mov       dword ptr [$enamfcia],0
	mov       dword ptr [$enamfcia+4],0
	?debug L 1094
?live16409@256: ; EAX = @temp4
	mov       eax,edx
	?debug L 1097
?live16409@272: ; 
@360:
@349:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@346:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_mmxext$qv+0
	dd        @346+0
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
	dd	?patch103
	dd	?patch104
	dd	?patch105
	df	@@stk@cpu@cpu_has_mmxext$qv
	dw	0
	dw	4148
	dw	0
	dw	165
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
	dw	166
	dw	0
	dw	0
	dw	0
	dw	?patch106
	dw	529
	dw	?patch107
	dd	?live16409@240-@@stk@cpu@cpu_has_mmxext$qv
	dd	?live16409@256-?live16409@240
	dw	1
?patch107	equ	1
?patch106	equ	14
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
	df	$enamfcia
	dw	0
	dw	4108
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
	df	$mjamfcia
	dw	0
	dw	117
	dw	0
	dw	173
	dw	0
	dw	0
	dw	0
?patch103	equ	@360-@@stk@cpu@cpu_has_mmxext$qv+71
?patch104	equ	0
?patch105	equ	@360-@@stk@cpu@cpu_has_mmxext$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mabmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eebmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_amd64$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_amd64$qv	proc	near
?live16410@0:
	?debug L 1100
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @361
	?debug L 1106
@362:
	mov       eax,dword ptr [$mabmfcia]
	cmp       eax,-1
	je        short @366
	?debug L 1107
?live16410@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @364
	?debug L 1109
?live16410@48: ; 
@365:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@366:
	cmp       dword ptr [$eebmfcia+4],0
	jne       short @365
	cmp       dword ptr [$eebmfcia],0
	jne       short @365
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$eebmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$eebmfcia+4],ecx
	jmp       short @369
@368:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@369:
	cmp       dword ptr [$eebmfcia+4],0
	jne       short @372
	cmp       dword ptr [$eebmfcia],0
@372:
	je        short @370
	mov       eax,dword ptr [$eebmfcia]
	mov       edx,dword ptr [$eebmfcia+4]
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
	?debug L 1112
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
	?debug L 1114
	mov       eax,dword ptr [ebp-28]
	?debug L 1112
	add       esp,24
	?debug L 1114
	and       eax,536870912
	?debug L 1115
?live16410@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1114
?live16410@144: ; 
	mov       dword ptr [$mabmfcia],eax
	?debug L 1115
?live16410@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1116
?live16410@176: ; EAX = ret
	mov       dword ptr [$eebmfcia],0
	mov       dword ptr [$eebmfcia+4],0
	?debug L 1115
?live16410@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1118
?live16410@208: ; 
@374:
@364:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@361:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_amd64$qv+0
	dd        @361+0
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
	dd	?patch108
	dd	?patch109
	dd	?patch110
	df	@@stk@cpu@cpu_has_amd64$qv
	dw	0
	dw	4150
	dw	0
	dw	174
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
	dw	175
	dw	0
	dw	0
	dw	0
	dw	?patch111
	dw	529
	dw	?patch112
	dd	?live16410@176-@@stk@cpu@cpu_has_amd64$qv
	dd	?live16410@192-?live16410@176
	dw	1
?patch112	equ	1
?patch111	equ	14
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
	df	$eebmfcia
	dw	0
	dw	4108
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
	df	$mabmfcia
	dw	0
	dw	117
	dw	0
	dw	182
	dw	0
	dw	0
	dw	0
?patch108	equ	@374-@@stk@cpu@cpu_has_amd64$qv+72
?patch109	equ	0
?patch110	equ	@374-@@stk@cpu@cpu_has_amd64$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mhbmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elbmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_ht$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_ht$qv	proc	near
?live16411@0:
	?debug L 1121
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @375
	?debug L 1127
@376:
	mov       eax,dword ptr [$mhbmfcia]
	cmp       eax,-1
	je        short @380
	?debug L 1128
?live16411@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @378
	?debug L 1130
?live16411@48: ; 
@379:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@380:
	cmp       dword ptr [$elbmfcia+4],0
	jne       short @379
	cmp       dword ptr [$elbmfcia],0
	jne       short @379
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$elbmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$elbmfcia+4],ecx
	jmp       short @383
@382:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@383:
	cmp       dword ptr [$elbmfcia+4],0
	jne       short @386
	cmp       dword ptr [$elbmfcia],0
@386:
	je        short @384
	mov       eax,dword ptr [$elbmfcia]
	mov       edx,dword ptr [$elbmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @387
	cmp       eax,dword ptr [ebp-20]
@387:
	setne     al
	and       eax,1
	jmp       short @385
@384:
	xor       eax,eax
@385:
	test      al,al
	jne       short @382
	?debug L 1133
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
	?debug L 1135
	mov       eax,dword ptr [ebp-28]
	?debug L 1133
	add       esp,24
	?debug L 1135
	and       eax,268435456
	?debug L 1136
?live16411@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1135
?live16411@144: ; 
	mov       dword ptr [$mhbmfcia],eax
	?debug L 1136
?live16411@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1137
?live16411@176: ; EAX = ret
	mov       dword ptr [$elbmfcia],0
	mov       dword ptr [$elbmfcia+4],0
	?debug L 1136
?live16411@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1139
?live16411@208: ; 
@388:
@378:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@375:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_ht$qv+0
	dd        @375+0
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
	dd	?patch113
	dd	?patch114
	dd	?patch115
	df	@@stk@cpu@cpu_has_ht$qv
	dw	0
	dw	4152
	dw	0
	dw	183
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
	dw	184
	dw	0
	dw	0
	dw	0
	dw	?patch116
	dw	529
	dw	?patch117
	dd	?live16411@176-@@stk@cpu@cpu_has_ht$qv
	dd	?live16411@192-?live16411@176
	dw	1
?patch117	equ	1
?patch116	equ	14
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
	df	$elbmfcia
	dw	0
	dw	4108
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
	df	$mhbmfcia
	dw	0
	dw	117
	dw	0
	dw	191
	dw	0
	dw	0
	dw	0
?patch113	equ	@388-@@stk@cpu@cpu_has_ht$qv+71
?patch114	equ	0
?patch115	equ	@388-@@stk@cpu@cpu_has_ht$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mobmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eccmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sse$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sse$qv	proc	near
?live16412@0:
	?debug L 1142
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @389
	?debug L 1148
@390:
	mov       eax,dword ptr [$mobmfcia]
	cmp       eax,-1
	jne       @392
	?debug L 1149
?live16412@32: ; EAX = @temp3
	jmp       short @394
	?debug L 1151
?live16412@48: ; 
@393:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@394:
	cmp       dword ptr [$eccmfcia+4],0
	jne       short @393
	cmp       dword ptr [$eccmfcia],0
	jne       short @393
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$eccmfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$eccmfcia+4],edx
	jmp       short @397
@396:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@397:
	cmp       dword ptr [$eccmfcia+4],0
	jne       short @400
	cmp       dword ptr [$eccmfcia],0
@400:
	je        short @398
	mov       eax,dword ptr [$eccmfcia]
	mov       edx,dword ptr [$eccmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @401
	cmp       eax,dword ptr [ebp-20]
@401:
	setne     cl
	and       ecx,1
	jmp       short @399
@398:
	xor       ecx,ecx
@399:
	test      cl,cl
	jne       short @396
	?debug L 1154
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
	?debug L 1156
	test      byte ptr [ebp-34],16
	je        short @402
	?debug L 1157
	mov       dword ptr [$mobmfcia],42
	jmp       short @403
	?debug L 1159
@402:
	test      byte ptr [ebp-34],8
	je        short @404
	?debug L 1160
	mov       dword ptr [$mobmfcia],41
	jmp       short @403
	?debug L 1162
@404:
	test      byte ptr [ebp-35],2
	je        short @405
	?debug L 1163
	mov       dword ptr [$mobmfcia],31
	jmp       short @403
	?debug L 1165
@405:
	test      byte ptr [ebp-36],1
	je        short @406
	?debug L 1166
	mov       dword ptr [$mobmfcia],30
	jmp       short @403
	?debug L 1168
@406:
	test      byte ptr [ebp-25],4
	je        short @407
	?debug L 1169
	mov       dword ptr [$mobmfcia],20
	jmp       short @403
	?debug L 1171
@407:
	test      byte ptr [ebp-25],2
	je        short @408
	?debug L 1172
	mov       dword ptr [$mobmfcia],10
	jmp       short @403
	?debug L 1174
@408:
	xor       ecx,ecx
	mov       dword ptr [$mobmfcia],ecx
	?debug L 1175
@403:
	mov       eax,dword ptr [$mobmfcia]
	?debug L 1176
?live16412@304: ; EAX = ret
	mov       dword ptr [$eccmfcia],0
	?debug L 1175
?live16412@320: ; 
	test      eax,eax
	?debug L 1176
?live16412@336: ; EAX = ret
	mov       dword ptr [$eccmfcia+4],0
	?debug L 1175
?live16412@352: ; 
	setne     al
	and       eax,1
	?debug L 1177
?live16412@368: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	mov       eax,edx
	?debug L 1178
?live16412@384: ; 
@409:
@392:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@389:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_sse$qv+0
	dd        @389+0
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
	dd	?patch118
	dd	?patch119
	dd	?patch120
	df	@@stk@cpu@cpu_has_sse$qv
	dw	0
	dw	4154
	dw	0
	dw	192
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
	dw	193
	dw	0
	dw	0
	dw	0
	dw	?patch121
	dw	529
	dw	?patch122
	dd	?live16412@304-@@stk@cpu@cpu_has_sse$qv
	dd	?live16412@320-?live16412@304
	dw	1
	dd	?live16412@336-@@stk@cpu@cpu_has_sse$qv
	dd	?live16412@352-?live16412@336
	dw	1
	dd	?live16412@368-@@stk@cpu@cpu_has_sse$qv
	dd	?live16412@384-?live16412@368
	dw	1
?patch122	equ	3
?patch121	equ	34
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
	df	$eccmfcia
	dw	0
	dw	4108
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
	df	$mobmfcia
	dw	0
	dw	117
	dw	0
	dw	200
	dw	0
	dw	0
	dw	0
?patch118	equ	@409-@@stk@cpu@cpu_has_sse$qv+72
?patch119	equ	0
?patch120	equ	@409-@@stk@cpu@cpu_has_sse$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mfcmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ejcmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sse4a$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sse4a$qv	proc	near
?live16413@0:
	?debug L 1181
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @410
	?debug L 1187
@411:
	mov       eax,dword ptr [$mfcmfcia]
	cmp       eax,-1
	je        short @415
	?debug L 1188
?live16413@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @413
	?debug L 1190
?live16413@48: ; 
@414:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@415:
	cmp       dword ptr [$ejcmfcia+4],0
	jne       short @414
	cmp       dword ptr [$ejcmfcia],0
	jne       short @414
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$ejcmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$ejcmfcia+4],ecx
	jmp       short @418
@417:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@418:
	cmp       dword ptr [$ejcmfcia+4],0
	jne       short @421
	cmp       dword ptr [$ejcmfcia],0
@421:
	je        short @419
	mov       eax,dword ptr [$ejcmfcia]
	mov       edx,dword ptr [$ejcmfcia+4]
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
	?debug L 1193
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
	?debug L 1195
	mov       eax,dword ptr [ebp-36]
	?debug L 1193
	add       esp,24
	?debug L 1195
	and       eax,64
	?debug L 1196
?live16413@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1195
?live16413@144: ; 
	mov       dword ptr [$mfcmfcia],eax
	?debug L 1196
?live16413@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1197
?live16413@176: ; EAX = ret
	mov       dword ptr [$ejcmfcia],0
	mov       dword ptr [$ejcmfcia+4],0
	?debug L 1196
?live16413@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1199
?live16413@208: ; 
@423:
@413:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@410:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_sse4a$qv+0
	dd        @410+0
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
	dd	?patch123
	dd	?patch124
	dd	?patch125
	df	@@stk@cpu@cpu_has_sse4a$qv
	dw	0
	dw	4156
	dw	0
	dw	201
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
	dw	202
	dw	0
	dw	0
	dw	0
	dw	?patch126
	dw	529
	dw	?patch127
	dd	?live16413@176-@@stk@cpu@cpu_has_sse4a$qv
	dd	?live16413@192-?live16413@176
	dw	1
?patch127	equ	1
?patch126	equ	14
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
	df	$ejcmfcia
	dw	0
	dw	4108
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
	df	$mfcmfcia
	dw	0
	dw	117
	dw	0
	dw	209
	dw	0
	dw	0
	dw	0
?patch123	equ	@423-@@stk@cpu@cpu_has_sse4a$qv+74
?patch124	equ	0
?patch125	equ	@423-@@stk@cpu@cpu_has_sse4a$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mmcmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eadmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx$qv	proc	near
?live16414@0:
	?debug L 1202
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @424
	?debug L 1208
@425:
	mov       eax,dword ptr [$mmcmfcia]
	cmp       eax,-1
	jne       @427
	?debug L 1209
?live16414@32: ; EAX = @temp3
	jmp       short @429
	?debug L 1211
?live16414@48: ; 
@428:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@429:
	cmp       dword ptr [$eadmfcia+4],0
	jne       short @428
	cmp       dword ptr [$eadmfcia],0
	jne       short @428
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$eadmfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$eadmfcia+4],edx
	jmp       short @432
@431:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@432:
	cmp       dword ptr [$eadmfcia+4],0
	jne       short @435
	cmp       dword ptr [$eadmfcia],0
@435:
	je        short @433
	mov       eax,dword ptr [$eadmfcia]
	mov       edx,dword ptr [$eadmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @436
	cmp       eax,dword ptr [ebp-20]
@436:
	setne     cl
	and       ecx,1
	jmp       short @434
@433:
	xor       ecx,ecx
@434:
	test      cl,cl
	jne       short @431
	?debug L 1214
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
	?debug L 1216
	test      byte ptr [ebp-33],16
	je        short @437
	?debug L 1217
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
	?debug L 1218
	test      byte ptr [ebp-44],32
	je        short @438
	?debug L 1219
	mov       dword ptr [$mmcmfcia],2
	jmp       short @439
	?debug L 1221
@438:
	mov       dword ptr [$mmcmfcia],1
	?debug L 1222
	jmp       short @439
	?debug L 1224
@437:
	xor       eax,eax
	mov       dword ptr [$mmcmfcia],eax
	?debug L 1226
@439:
	mov       edx,dword ptr [$mmcmfcia]
	?debug L 1227
?live16414@208: ; EAX = ret
	mov       dword ptr [$eadmfcia],0
	?debug L 1226
?live16414@224: ; 
	test      edx,edx
	?debug L 1227
?live16414@240: ; EAX = ret
	mov       dword ptr [$eadmfcia+4],0
	?debug L 1226
?live16414@256: ; 
	setne     al
	and       eax,1
	?debug L 1228
?live16414@272: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	mov       eax,edx
	?debug L 1229
?live16414@288: ; 
@440:
@427:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@424:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx$qv+0
	dd        @424+0
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
	dd	?patch128
	dd	?patch129
	dd	?patch130
	df	@@stk@cpu@cpu_has_avx$qv
	dw	0
	dw	4158
	dw	0
	dw	210
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
	dw	211
	dw	0
	dw	0
	dw	0
	dw	?patch131
	dw	529
	dw	?patch132
	dd	?live16414@208-@@stk@cpu@cpu_has_avx$qv
	dd	?live16414@224-?live16414@208
	dw	1
	dd	?live16414@240-@@stk@cpu@cpu_has_avx$qv
	dd	?live16414@256-?live16414@240
	dw	1
	dd	?live16414@272-@@stk@cpu@cpu_has_avx$qv
	dd	?live16414@288-?live16414@272
	dw	1
?patch132	equ	3
?patch131	equ	34
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
	df	$eadmfcia
	dw	0
	dw	4108
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
	df	$mmcmfcia
	dw	0
	dw	117
	dw	0
	dw	218
	dw	0
	dw	0
	dw	0
?patch128	equ	@440-@@stk@cpu@cpu_has_avx$qv+72
?patch129	equ	0
?patch130	equ	@440-@@stk@cpu@cpu_has_avx$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mddmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ehdmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_popcnt$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_popcnt$qv	proc	near
?live16415@0:
	?debug L 1232
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @441
	?debug L 1238
@442:
	mov       eax,dword ptr [$mddmfcia]
	cmp       eax,-1
	je        short @446
	?debug L 1239
?live16415@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @444
	?debug L 1241
?live16415@48: ; 
@445:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@446:
	cmp       dword ptr [$ehdmfcia+4],0
	jne       short @445
	cmp       dword ptr [$ehdmfcia],0
	jne       short @445
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$ehdmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$ehdmfcia+4],ecx
	jmp       short @449
@448:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@449:
	cmp       dword ptr [$ehdmfcia+4],0
	jne       short @452
	cmp       dword ptr [$ehdmfcia],0
@452:
	je        short @450
	mov       eax,dword ptr [$ehdmfcia]
	mov       edx,dword ptr [$ehdmfcia+4]
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
	?debug L 1244
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
	?debug L 1246
	mov       eax,dword ptr [ebp-36]
	?debug L 1244
	add       esp,24
	?debug L 1246
	and       eax,8388608
	?debug L 1247
?live16415@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1246
?live16415@144: ; 
	mov       dword ptr [$mddmfcia],eax
	?debug L 1247
?live16415@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1248
?live16415@176: ; EAX = ret
	mov       dword ptr [$ehdmfcia],0
	mov       dword ptr [$ehdmfcia+4],0
	?debug L 1247
?live16415@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1250
?live16415@208: ; 
@454:
@444:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@441:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_popcnt$qv+0
	dd        @441+0
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
	dd	?patch133
	dd	?patch134
	dd	?patch135
	df	@@stk@cpu@cpu_has_popcnt$qv
	dw	0
	dw	4160
	dw	0
	dw	219
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
	dw	220
	dw	0
	dw	0
	dw	0
	dw	?patch136
	dw	529
	dw	?patch137
	dd	?live16415@176-@@stk@cpu@cpu_has_popcnt$qv
	dd	?live16415@192-?live16415@176
	dw	1
?patch137	equ	1
?patch136	equ	14
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
	df	$ehdmfcia
	dw	0
	dw	4108
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
	df	$mddmfcia
	dw	0
	dw	117
	dw	0
	dw	227
	dw	0
	dw	0
	dw	0
?patch133	equ	@454-@@stk@cpu@cpu_has_popcnt$qv+71
?patch134	equ	0
?patch135	equ	@454-@@stk@cpu@cpu_has_popcnt$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mkdmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eodmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_f16c$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_f16c$qv	proc	near
?live16416@0:
	?debug L 1253
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @455
	?debug L 1259
@456:
	mov       eax,dword ptr [$mkdmfcia]
	cmp       eax,-1
	je        short @460
	?debug L 1260
?live16416@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @458
	?debug L 1262
?live16416@48: ; 
@459:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@460:
	cmp       dword ptr [$eodmfcia+4],0
	jne       short @459
	cmp       dword ptr [$eodmfcia],0
	jne       short @459
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$eodmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$eodmfcia+4],ecx
	jmp       short @463
@462:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@463:
	cmp       dword ptr [$eodmfcia+4],0
	jne       short @466
	cmp       dword ptr [$eodmfcia],0
@466:
	je        short @464
	mov       eax,dword ptr [$eodmfcia]
	mov       edx,dword ptr [$eodmfcia+4]
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
	?debug L 1265
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
	?debug L 1267
	mov       eax,dword ptr [ebp-36]
	?debug L 1265
	add       esp,24
	?debug L 1267
	and       eax,536870912
	?debug L 1268
?live16416@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1267
?live16416@144: ; 
	mov       dword ptr [$mkdmfcia],eax
	?debug L 1268
?live16416@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1269
?live16416@176: ; EAX = ret
	mov       dword ptr [$eodmfcia],0
	mov       dword ptr [$eodmfcia+4],0
	?debug L 1268
?live16416@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1271
?live16416@208: ; 
@468:
@458:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@455:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_f16c$qv+0
	dd        @455+0
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
	dd	?patch138
	dd	?patch139
	dd	?patch140
	df	@@stk@cpu@cpu_has_f16c$qv
	dw	0
	dw	4162
	dw	0
	dw	228
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
	dw	229
	dw	0
	dw	0
	dw	0
	dw	?patch141
	dw	529
	dw	?patch142
	dd	?live16416@176-@@stk@cpu@cpu_has_f16c$qv
	dd	?live16416@192-?live16416@176
	dw	1
?patch142	equ	1
?patch141	equ	14
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
	df	$eodmfcia
	dw	0
	dw	4108
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
	df	$mkdmfcia
	dw	0
	dw	117
	dw	0
	dw	236
	dw	0
	dw	0
	dw	0
?patch138	equ	@468-@@stk@cpu@cpu_has_f16c$qv+71
?patch139	equ	0
?patch140	equ	@468-@@stk@cpu@cpu_has_f16c$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mbemfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$efemfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_cmpxchg$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_cmpxchg$qv	proc	near
?live16417@0:
	?debug L 1274
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @469
	?debug L 1280
@470:
	mov       eax,dword ptr [$mbemfcia]
	cmp       eax,-1
	jne       @472
	?debug L 1281
?live16417@32: ; EAX = @temp2
	jmp       short @474
	?debug L 1283
?live16417@48: ; 
@473:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@474:
	cmp       dword ptr [$efemfcia+4],0
	jne       short @473
	cmp       dword ptr [$efemfcia],0
	jne       short @473
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$efemfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$efemfcia+4],edx
	jmp       short @477
@476:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@477:
	cmp       dword ptr [$efemfcia+4],0
	jne       short @480
	cmp       dword ptr [$efemfcia],0
@480:
	je        short @478
	mov       eax,dword ptr [$efemfcia]
	mov       edx,dword ptr [$efemfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @481
	cmp       eax,dword ptr [ebp-20]
@481:
	setne     cl
	and       ecx,1
	jmp       short @479
@478:
	xor       ecx,ecx
@479:
	test      cl,cl
	jne       short @476
	?debug L 1286
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
	?debug L 1288
	test      byte ptr [ebp-35],32
	je        short @482
	?debug L 1289
	mov       dword ptr [$mbemfcia],16
	?debug L 1290
	mov       dword ptr [$efemfcia],0
	mov       dword ptr [$efemfcia+4],0
	?debug L 1291
	mov       eax,16
	jmp       @472
	?debug L 1293
@482:
	test      byte ptr [ebp-27],1
	je        short @483
	?debug L 1294
	mov       dword ptr [$mbemfcia],8
	?debug L 1295
	mov       dword ptr [$efemfcia],0
	mov       dword ptr [$efemfcia+4],0
	?debug L 1296
	mov       eax,8
	jmp       short @472
	?debug L 1300
@483:
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
	?debug L 1302
	test      byte ptr [ebp-27],1
	je        short @484
	?debug L 1303
	mov       dword ptr [$mbemfcia],8
	?debug L 1304
	mov       dword ptr [$efemfcia],0
	mov       dword ptr [$efemfcia+4],0
	?debug L 1305
	mov       eax,8
	jmp       short @472
	?debug L 1307
@484:
	mov       dword ptr [$mbemfcia],1
	?debug L 1308
	mov       dword ptr [$efemfcia],0
	mov       dword ptr [$efemfcia+4],0
	?debug L 1309
	mov       eax,1
	?debug L 1310
@485:
@472:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@469:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_cmpxchg$qv+0
	dd        @469+0
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
	dd	?patch143
	dd	?patch144
	dd	?patch145
	df	@@stk@cpu@cpu_has_cmpxchg$qv
	dw	0
	dw	4164
	dw	0
	dw	237
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
	df	$efemfcia
	dw	0
	dw	4108
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
	df	$mbemfcia
	dw	0
	dw	117
	dw	0
	dw	244
	dw	0
	dw	0
	dw	0
?patch143	equ	@485-@@stk@cpu@cpu_has_cmpxchg$qv+73
?patch144	equ	0
?patch145	equ	@485-@@stk@cpu@cpu_has_cmpxchg$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$miemfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ememfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_vmx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_vmx$qv	proc	near
?live16418@0:
	?debug L 1313
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @486
	?debug L 1319
@487:
	mov       eax,dword ptr [$miemfcia]
	cmp       eax,-1
	je        short @491
	?debug L 1320
?live16418@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @489
	?debug L 1322
?live16418@48: ; 
@490:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@491:
	cmp       dword ptr [$ememfcia+4],0
	jne       short @490
	cmp       dword ptr [$ememfcia],0
	jne       short @490
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$ememfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$ememfcia+4],ecx
	jmp       short @494
@493:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@494:
	cmp       dword ptr [$ememfcia+4],0
	jne       short @497
	cmp       dword ptr [$ememfcia],0
@497:
	je        short @495
	mov       eax,dword ptr [$ememfcia]
	mov       edx,dword ptr [$ememfcia+4]
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
	?debug L 1325
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
	?debug L 1327
	mov       eax,dword ptr [ebp-36]
	?debug L 1325
	add       esp,24
	?debug L 1327
	and       eax,32
	?debug L 1328
?live16418@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1327
?live16418@144: ; 
	mov       dword ptr [$miemfcia],eax
	?debug L 1328
?live16418@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1329
?live16418@176: ; EAX = ret
	mov       dword ptr [$ememfcia],0
	mov       dword ptr [$ememfcia+4],0
	?debug L 1328
?live16418@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1331
?live16418@208: ; 
@499:
@489:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@486:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_vmx$qv+0
	dd        @486+0
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
	dd	?patch146
	dd	?patch147
	dd	?patch148
	df	@@stk@cpu@cpu_has_vmx$qv
	dw	0
	dw	4166
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
	dw	246
	dw	0
	dw	0
	dw	0
	dw	?patch149
	dw	529
	dw	?patch150
	dd	?live16418@176-@@stk@cpu@cpu_has_vmx$qv
	dd	?live16418@192-?live16418@176
	dw	1
?patch150	equ	1
?patch149	equ	14
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
	df	$ememfcia
	dw	0
	dw	4108
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
	df	$miemfcia
	dw	0
	dw	117
	dw	0
	dw	253
	dw	0
	dw	0
	dw	0
?patch146	equ	@499-@@stk@cpu@cpu_has_vmx$qv+73
?patch147	equ	0
?patch148	equ	@499-@@stk@cpu@cpu_has_vmx$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mpemfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$edfmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_smx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_smx$qv	proc	near
?live16419@0:
	?debug L 1334
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @500
	?debug L 1340
@501:
	mov       eax,dword ptr [$mpemfcia]
	cmp       eax,-1
	je        short @505
	?debug L 1341
?live16419@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @503
	?debug L 1343
?live16419@48: ; 
@504:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@505:
	cmp       dword ptr [$edfmfcia+4],0
	jne       short @504
	cmp       dword ptr [$edfmfcia],0
	jne       short @504
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$edfmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$edfmfcia+4],ecx
	jmp       short @508
@507:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@508:
	cmp       dword ptr [$edfmfcia+4],0
	jne       short @511
	cmp       dword ptr [$edfmfcia],0
@511:
	je        short @509
	mov       eax,dword ptr [$edfmfcia]
	mov       edx,dword ptr [$edfmfcia+4]
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
	?debug L 1346
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
	?debug L 1348
	mov       eax,dword ptr [ebp-36]
	?debug L 1346
	add       esp,24
	?debug L 1348
	and       eax,64
	?debug L 1349
?live16419@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1348
?live16419@144: ; 
	mov       dword ptr [$mpemfcia],eax
	?debug L 1349
?live16419@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1350
?live16419@176: ; EAX = ret
	mov       dword ptr [$edfmfcia],0
	mov       dword ptr [$edfmfcia+4],0
	?debug L 1349
?live16419@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1352
?live16419@208: ; 
@513:
@503:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@500:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_smx$qv+0
	dd        @500+0
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
	dd	?patch151
	dd	?patch152
	dd	?patch153
	df	@@stk@cpu@cpu_has_smx$qv
	dw	0
	dw	4168
	dw	0
	dw	254
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
	dw	255
	dw	0
	dw	0
	dw	0
	dw	?patch154
	dw	529
	dw	?patch155
	dd	?live16419@176-@@stk@cpu@cpu_has_smx$qv
	dd	?live16419@192-?live16419@176
	dw	1
?patch155	equ	1
?patch154	equ	14
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
	df	$edfmfcia
	dw	0
	dw	4108
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
	df	$mpemfcia
	dw	0
	dw	117
	dw	0
	dw	262
	dw	0
	dw	0
	dw	0
?patch151	equ	@513-@@stk@cpu@cpu_has_smx$qv+73
?patch152	equ	0
?patch153	equ	@513-@@stk@cpu@cpu_has_smx$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mgfmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ekfmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_cmov$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_cmov$qv	proc	near
?live16420@0:
	?debug L 1355
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @514
	?debug L 1361
@515:
	mov       eax,dword ptr [$mgfmfcia]
	cmp       eax,-1
	je        short @519
	?debug L 1362
?live16420@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @517
	?debug L 1364
?live16420@48: ; 
@518:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@519:
	cmp       dword ptr [$ekfmfcia+4],0
	jne       short @518
	cmp       dword ptr [$ekfmfcia],0
	jne       short @518
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$ekfmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$ekfmfcia+4],ecx
	jmp       short @522
@521:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@522:
	cmp       dword ptr [$ekfmfcia+4],0
	jne       short @525
	cmp       dword ptr [$ekfmfcia],0
@525:
	je        short @523
	mov       eax,dword ptr [$ekfmfcia]
	mov       edx,dword ptr [$ekfmfcia+4]
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
	?debug L 1367
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
	?debug L 1369
	mov       eax,dword ptr [ebp-28]
	?debug L 1367
	add       esp,24
	?debug L 1369
	and       eax,32768
	?debug L 1370
?live16420@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1369
?live16420@144: ; 
	mov       dword ptr [$mgfmfcia],eax
	?debug L 1370
?live16420@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1371
?live16420@176: ; EAX = ret
	mov       dword ptr [$ekfmfcia],0
	mov       dword ptr [$ekfmfcia+4],0
	?debug L 1370
?live16420@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1373
?live16420@208: ; 
@527:
@517:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@514:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_cmov$qv+0
	dd        @514+0
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
	dd	?patch156
	dd	?patch157
	dd	?patch158
	df	@@stk@cpu@cpu_has_cmov$qv
	dw	0
	dw	4170
	dw	0
	dw	263
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
	dw	264
	dw	0
	dw	0
	dw	0
	dw	?patch159
	dw	529
	dw	?patch160
	dd	?live16420@176-@@stk@cpu@cpu_has_cmov$qv
	dd	?live16420@192-?live16420@176
	dw	1
?patch160	equ	1
?patch159	equ	14
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
	df	$ekfmfcia
	dw	0
	dw	4108
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
	df	$mgfmfcia
	dw	0
	dw	117
	dw	0
	dw	271
	dw	0
	dw	0
	dw	0
?patch156	equ	@527-@@stk@cpu@cpu_has_cmov$qv+71
?patch157	equ	0
?patch158	equ	@527-@@stk@cpu@cpu_has_cmov$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mnfmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ebgmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_movbe$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_movbe$qv	proc	near
?live16421@0:
	?debug L 1376
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @528
	?debug L 1382
@529:
	mov       eax,dword ptr [$mnfmfcia]
	cmp       eax,-1
	je        short @533
	?debug L 1383
?live16421@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @531
	?debug L 1385
?live16421@48: ; 
@532:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@533:
	cmp       dword ptr [$ebgmfcia+4],0
	jne       short @532
	cmp       dword ptr [$ebgmfcia],0
	jne       short @532
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$ebgmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$ebgmfcia+4],ecx
	jmp       short @536
@535:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@536:
	cmp       dword ptr [$ebgmfcia+4],0
	jne       short @539
	cmp       dword ptr [$ebgmfcia],0
@539:
	je        short @537
	mov       eax,dword ptr [$ebgmfcia]
	mov       edx,dword ptr [$ebgmfcia+4]
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
	?debug L 1388
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
	?debug L 1390
	mov       eax,dword ptr [ebp-36]
	?debug L 1388
	add       esp,24
	?debug L 1390
	and       eax,4194304
	?debug L 1391
?live16421@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1390
?live16421@144: ; 
	mov       dword ptr [$mnfmfcia],eax
	?debug L 1391
?live16421@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1392
?live16421@176: ; EAX = ret
	mov       dword ptr [$ebgmfcia],0
	mov       dword ptr [$ebgmfcia+4],0
	?debug L 1391
?live16421@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1394
?live16421@208: ; 
@541:
@531:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@528:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_movbe$qv+0
	dd        @528+0
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
	dd	?patch161
	dd	?patch162
	dd	?patch163
	df	@@stk@cpu@cpu_has_movbe$qv
	dw	0
	dw	4172
	dw	0
	dw	272
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
	dw	273
	dw	0
	dw	0
	dw	0
	dw	?patch164
	dw	529
	dw	?patch165
	dd	?live16421@176-@@stk@cpu@cpu_has_movbe$qv
	dd	?live16421@192-?live16421@176
	dw	1
?patch165	equ	1
?patch164	equ	14
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
	df	$ebgmfcia
	dw	0
	dw	4108
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
	df	$mnfmfcia
	dw	0
	dw	117
	dw	0
	dw	280
	dw	0
	dw	0
	dw	0
?patch161	equ	@541-@@stk@cpu@cpu_has_movbe$qv+71
?patch162	equ	0
?patch163	equ	@541-@@stk@cpu@cpu_has_movbe$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$megmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eigmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_bmi$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_bmi$qv	proc	near
?live16422@0:
	?debug L 1397
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @542
	?debug L 1403
@543:
	mov       eax,dword ptr [$megmfcia]
	cmp       eax,-1
	jne       @545
	?debug L 1404
?live16422@32: ; EAX = @temp3
	jmp       short @547
	?debug L 1406
?live16422@48: ; 
@546:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@547:
	cmp       dword ptr [$eigmfcia+4],0
	jne       short @546
	cmp       dword ptr [$eigmfcia],0
	jne       short @546
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$eigmfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$eigmfcia+4],edx
	jmp       short @550
@549:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@550:
	cmp       dword ptr [$eigmfcia+4],0
	jne       short @553
	cmp       dword ptr [$eigmfcia],0
@553:
	je        short @551
	mov       eax,dword ptr [$eigmfcia]
	mov       edx,dword ptr [$eigmfcia+4]
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
	?debug L 1409
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
	?debug L 1411
	test      byte ptr [ebp-43],1
	je        short @555
	?debug L 1412
	mov       dword ptr [$megmfcia],2
	jmp       short @556
	?debug L 1414
@555:
	test      byte ptr [ebp-44],8
	je        short @557
	?debug L 1415
	mov       dword ptr [$megmfcia],1
	jmp       short @556
	?debug L 1417
@557:
	xor       ecx,ecx
	mov       dword ptr [$megmfcia],ecx
	?debug L 1418
@556:
	mov       eax,dword ptr [$megmfcia]
	?debug L 1419
?live16422@176: ; EAX = ret
	mov       dword ptr [$eigmfcia],0
	?debug L 1418
?live16422@192: ; 
	test      eax,eax
	?debug L 1419
?live16422@208: ; EAX = ret
	mov       dword ptr [$eigmfcia+4],0
	?debug L 1418
?live16422@224: ; 
	setne     al
	and       eax,1
	?debug L 1420
?live16422@240: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	mov       eax,edx
	?debug L 1421
?live16422@256: ; 
@558:
@545:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@542:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_bmi$qv+0
	dd        @542+0
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
	dd	?patch166
	dd	?patch167
	dd	?patch168
	df	@@stk@cpu@cpu_has_bmi$qv
	dw	0
	dw	4174
	dw	0
	dw	281
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
	dw	282
	dw	0
	dw	0
	dw	0
	dw	?patch169
	dw	529
	dw	?patch170
	dd	?live16422@176-@@stk@cpu@cpu_has_bmi$qv
	dd	?live16422@192-?live16422@176
	dw	1
	dd	?live16422@208-@@stk@cpu@cpu_has_bmi$qv
	dd	?live16422@224-?live16422@208
	dw	1
	dd	?live16422@240-@@stk@cpu@cpu_has_bmi$qv
	dd	?live16422@256-?live16422@240
	dw	1
?patch170	equ	3
?patch169	equ	34
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
	df	$eigmfcia
	dw	0
	dw	4108
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
	df	$megmfcia
	dw	0
	dw	117
	dw	0
	dw	289
	dw	0
	dw	0
	dw	0
?patch166	equ	@558-@@stk@cpu@cpu_has_bmi$qv+72
?patch167	equ	0
?patch168	equ	@558-@@stk@cpu@cpu_has_bmi$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mlgmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$epgmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_erms$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_erms$qv	proc	near
?live16423@0:
	?debug L 1424
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @559
	?debug L 1430
@560:
	mov       eax,dword ptr [$mlgmfcia]
	cmp       eax,-1
	je        short @564
	?debug L 1431
?live16423@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @562
	?debug L 1433
?live16423@48: ; 
@563:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@564:
	cmp       dword ptr [$epgmfcia+4],0
	jne       short @563
	cmp       dword ptr [$epgmfcia],0
	jne       short @563
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$epgmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$epgmfcia+4],ecx
	jmp       short @567
@566:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@567:
	cmp       dword ptr [$epgmfcia+4],0
	jne       short @570
	cmp       dword ptr [$epgmfcia],0
@570:
	je        short @568
	mov       eax,dword ptr [$epgmfcia]
	mov       edx,dword ptr [$epgmfcia+4]
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
	?debug L 1436
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
	?debug L 1438
	mov       eax,dword ptr [ebp-44]
	?debug L 1436
	add       esp,24
	?debug L 1438
	and       eax,512
	?debug L 1439
?live16423@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1438
?live16423@144: ; 
	mov       dword ptr [$mlgmfcia],eax
	?debug L 1439
?live16423@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1440
?live16423@176: ; EAX = ret
	mov       dword ptr [$epgmfcia],0
	mov       dword ptr [$epgmfcia+4],0
	?debug L 1439
?live16423@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1442
?live16423@208: ; 
@572:
@562:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@559:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_erms$qv+0
	dd        @559+0
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
	dd	?patch171
	dd	?patch172
	dd	?patch173
	df	@@stk@cpu@cpu_has_erms$qv
	dw	0
	dw	4176
	dw	0
	dw	290
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
	dw	291
	dw	0
	dw	0
	dw	0
	dw	?patch174
	dw	529
	dw	?patch175
	dd	?live16423@176-@@stk@cpu@cpu_has_erms$qv
	dd	?live16423@192-?live16423@176
	dw	1
?patch175	equ	1
?patch174	equ	14
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
	df	$epgmfcia
	dw	0
	dw	4108
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
	df	$mlgmfcia
	dw	0
	dw	117
	dw	0
	dw	298
	dw	0
	dw	0
	dw	0
?patch171	equ	@572-@@stk@cpu@cpu_has_erms$qv+71
?patch172	equ	0
?patch173	equ	@572-@@stk@cpu@cpu_has_erms$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mchmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eghmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_3dnow$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_3dnow$qv	proc	near
?live16424@0:
	?debug L 1445
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @573
	?debug L 1451
@574:
	mov       eax,dword ptr [$mchmfcia]
	cmp       eax,-1
	jne       @576
	?debug L 1452
?live16424@32: ; EAX = @temp3
	jmp       short @578
	?debug L 1454
?live16424@48: ; 
@577:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@578:
	cmp       dword ptr [$eghmfcia+4],0
	jne       short @577
	cmp       dword ptr [$eghmfcia],0
	jne       short @577
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$eghmfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$eghmfcia+4],edx
	jmp       short @581
@580:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@581:
	cmp       dword ptr [$eghmfcia+4],0
	jne       short @584
	cmp       dword ptr [$eghmfcia],0
@584:
	je        short @582
	mov       eax,dword ptr [$eghmfcia]
	mov       edx,dword ptr [$eghmfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @585
	cmp       eax,dword ptr [ebp-20]
@585:
	setne     cl
	and       ecx,1
	jmp       short @583
@582:
	xor       ecx,ecx
@583:
	test      cl,cl
	jne       short @580
	?debug L 1457
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
	?debug L 1459
	test      byte ptr [ebp-25],64
	je        short @586
	?debug L 1460
	mov       dword ptr [$mchmfcia],2
	jmp       short @587
	?debug L 1462
@586:
	test      byte ptr [ebp-25],-128
	je        short @588
	?debug L 1463
	mov       dword ptr [$mchmfcia],1
	jmp       short @587
	?debug L 1465
@588:
	xor       ecx,ecx
	mov       dword ptr [$mchmfcia],ecx
	?debug L 1466
@587:
	mov       eax,dword ptr [$mchmfcia]
	?debug L 1467
?live16424@176: ; EAX = ret
	mov       dword ptr [$eghmfcia],0
	?debug L 1466
?live16424@192: ; 
	test      eax,eax
	?debug L 1467
?live16424@208: ; EAX = ret
	mov       dword ptr [$eghmfcia+4],0
	?debug L 1466
?live16424@224: ; 
	setne     al
	and       eax,1
	?debug L 1468
?live16424@240: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	mov       eax,edx
	?debug L 1469
?live16424@256: ; 
@589:
@576:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@573:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_3dnow$qv+0
	dd        @573+0
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
	dd	?patch176
	dd	?patch177
	dd	?patch178
	df	@@stk@cpu@cpu_has_3dnow$qv
	dw	0
	dw	4178
	dw	0
	dw	299
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
	dw	300
	dw	0
	dw	0
	dw	0
	dw	?patch179
	dw	529
	dw	?patch180
	dd	?live16424@176-@@stk@cpu@cpu_has_3dnow$qv
	dd	?live16424@192-?live16424@176
	dw	1
	dd	?live16424@208-@@stk@cpu@cpu_has_3dnow$qv
	dd	?live16424@224-?live16424@208
	dw	1
	dd	?live16424@240-@@stk@cpu@cpu_has_3dnow$qv
	dd	?live16424@256-?live16424@240
	dw	1
?patch180	equ	3
?patch179	equ	34
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
	df	$eghmfcia
	dw	0
	dw	4108
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
	df	$mchmfcia
	dw	0
	dw	117
	dw	0
	dw	307
	dw	0
	dw	0
	dw	0
?patch176	equ	@589-@@stk@cpu@cpu_has_3dnow$qv+73
?patch177	equ	0
?patch178	equ	@589-@@stk@cpu@cpu_has_3dnow$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mjhmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$enhmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_3dnowprefetch$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_3dnowprefetch$qv	proc	near
?live16425@0:
	?debug L 1472
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @590
	?debug L 1478
@591:
	mov       eax,dword ptr [$mjhmfcia]
	cmp       eax,-1
	je        short @595
	?debug L 1479
?live16425@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @593
	?debug L 1481
?live16425@48: ; 
@594:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@595:
	cmp       dword ptr [$enhmfcia+4],0
	jne       short @594
	cmp       dword ptr [$enhmfcia],0
	jne       short @594
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$enhmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$enhmfcia+4],ecx
	jmp       short @598
@597:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@598:
	cmp       dword ptr [$enhmfcia+4],0
	jne       short @601
	cmp       dword ptr [$enhmfcia],0
@601:
	je        short @599
	mov       eax,dword ptr [$enhmfcia]
	mov       edx,dword ptr [$enhmfcia+4]
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
	?debug L 1484
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
	?debug L 1486
	mov       eax,dword ptr [ebp-36]
	?debug L 1484
	add       esp,24
	?debug L 1486
	and       eax,256
	?debug L 1487
?live16425@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1486
?live16425@144: ; 
	mov       dword ptr [$mjhmfcia],eax
	?debug L 1487
?live16425@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1488
?live16425@176: ; EAX = ret
	mov       dword ptr [$enhmfcia],0
	mov       dword ptr [$enhmfcia+4],0
	?debug L 1487
?live16425@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1490
?live16425@208: ; 
@603:
@593:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@590:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_3dnowprefetch$qv+0
	dd        @590+0
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
	dd	?patch181
	dd	?patch182
	dd	?patch183
	df	@@stk@cpu@cpu_has_3dnowprefetch$qv
	dw	0
	dw	4180
	dw	0
	dw	308
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
	dw	309
	dw	0
	dw	0
	dw	0
	dw	?patch184
	dw	529
	dw	?patch185
	dd	?live16425@176-@@stk@cpu@cpu_has_3dnowprefetch$qv
	dd	?live16425@192-?live16425@176
	dw	1
?patch185	equ	1
?patch184	equ	14
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
	df	$enhmfcia
	dw	0
	dw	4108
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
	df	$mjhmfcia
	dw	0
	dw	117
	dw	0
	dw	316
	dw	0
	dw	0
	dw	0
?patch181	equ	@603-@@stk@cpu@cpu_has_3dnowprefetch$qv+72
?patch182	equ	0
?patch183	equ	@603-@@stk@cpu@cpu_has_3dnowprefetch$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$maimfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eeimfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_perftsc$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_perftsc$qv	proc	near
?live16426@0:
	?debug L 1493
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @604
	?debug L 1499
@605:
	mov       eax,dword ptr [$maimfcia]
	cmp       eax,-1
	je        short @609
	?debug L 1500
?live16426@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @607
	?debug L 1502
?live16426@48: ; 
@608:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@609:
	cmp       dword ptr [$eeimfcia+4],0
	jne       short @608
	cmp       dword ptr [$eeimfcia],0
	jne       short @608
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$eeimfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$eeimfcia+4],ecx
	jmp       short @612
@611:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@612:
	cmp       dword ptr [$eeimfcia+4],0
	jne       short @615
	cmp       dword ptr [$eeimfcia],0
@615:
	je        short @613
	mov       eax,dword ptr [$eeimfcia]
	mov       edx,dword ptr [$eeimfcia+4]
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
	?debug L 1505
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
	?debug L 1507
	mov       eax,dword ptr [ebp-28]
	?debug L 1505
	add       esp,24
	?debug L 1507
	and       eax,134217728
	?debug L 1508
?live16426@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1507
?live16426@144: ; 
	mov       dword ptr [$maimfcia],eax
	?debug L 1508
?live16426@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1509
?live16426@176: ; EAX = ret
	mov       dword ptr [$eeimfcia],0
	mov       dword ptr [$eeimfcia+4],0
	?debug L 1508
?live16426@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1511
?live16426@208: ; 
@617:
@607:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@604:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_perftsc$qv+0
	dd        @604+0
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
	dd	?patch186
	dd	?patch187
	dd	?patch188
	df	@@stk@cpu@cpu_has_perftsc$qv
	dw	0
	dw	4182
	dw	0
	dw	317
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
	dw	318
	dw	0
	dw	0
	dw	0
	dw	?patch189
	dw	529
	dw	?patch190
	dd	?live16426@176-@@stk@cpu@cpu_has_perftsc$qv
	dd	?live16426@192-?live16426@176
	dw	1
?patch190	equ	1
?patch189	equ	14
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
	df	$eeimfcia
	dw	0
	dw	4108
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
	df	$maimfcia
	dw	0
	dw	117
	dw	0
	dw	325
	dw	0
	dw	0
	dw	0
?patch186	equ	@617-@@stk@cpu@cpu_has_perftsc$qv+72
?patch187	equ	0
?patch188	equ	@617-@@stk@cpu@cpu_has_perftsc$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mhimfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elimfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sha$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sha$qv	proc	near
?live16427@0:
	?debug L 1514
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @618
	?debug L 1520
@619:
	mov       eax,dword ptr [$mhimfcia]
	cmp       eax,-1
	je        short @623
	?debug L 1521
?live16427@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @621
	?debug L 1523
?live16427@48: ; 
@622:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@623:
	cmp       dword ptr [$elimfcia+4],0
	jne       short @622
	cmp       dword ptr [$elimfcia],0
	jne       short @622
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$elimfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$elimfcia+4],ecx
	jmp       short @626
@625:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@626:
	cmp       dword ptr [$elimfcia+4],0
	jne       short @629
	cmp       dword ptr [$elimfcia],0
@629:
	je        short @627
	mov       eax,dword ptr [$elimfcia]
	mov       edx,dword ptr [$elimfcia+4]
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
	?debug L 1526
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
	?debug L 1528
	mov       eax,dword ptr [ebp-44]
	?debug L 1526
	add       esp,24
	?debug L 1528
	and       eax,536870912
	?debug L 1529
?live16427@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1528
?live16427@144: ; 
	mov       dword ptr [$mhimfcia],eax
	?debug L 1529
?live16427@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1530
?live16427@176: ; EAX = ret
	mov       dword ptr [$elimfcia],0
	mov       dword ptr [$elimfcia+4],0
	?debug L 1529
?live16427@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1532
?live16427@208: ; 
@631:
@621:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@618:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_sha$qv+0
	dd        @618+0
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
	dd	?patch191
	dd	?patch192
	dd	?patch193
	df	@@stk@cpu@cpu_has_sha$qv
	dw	0
	dw	4184
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
	dw	327
	dw	0
	dw	0
	dw	0
	dw	?patch194
	dw	529
	dw	?patch195
	dd	?live16427@176-@@stk@cpu@cpu_has_sha$qv
	dd	?live16427@192-?live16427@176
	dw	1
?patch195	equ	1
?patch194	equ	14
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
	df	$elimfcia
	dw	0
	dw	4108
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
	df	$mhimfcia
	dw	0
	dw	117
	dw	0
	dw	334
	dw	0
	dw	0
	dw	0
?patch191	equ	@631-@@stk@cpu@cpu_has_sha$qv+71
?patch192	equ	0
?patch193	equ	@631-@@stk@cpu@cpu_has_sha$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$moimfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ecjmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_xop$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_xop$qv	proc	near
?live16428@0:
	?debug L 1535
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @632
	?debug L 1541
@633:
	mov       eax,dword ptr [$moimfcia]
	cmp       eax,-1
	je        short @637
	?debug L 1542
?live16428@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @635
	?debug L 1544
?live16428@48: ; 
@636:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@637:
	cmp       dword ptr [$ecjmfcia+4],0
	jne       short @636
	cmp       dword ptr [$ecjmfcia],0
	jne       short @636
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$ecjmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$ecjmfcia+4],ecx
	jmp       short @640
@639:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@640:
	cmp       dword ptr [$ecjmfcia+4],0
	jne       short @643
	cmp       dword ptr [$ecjmfcia],0
@643:
	je        short @641
	mov       eax,dword ptr [$ecjmfcia]
	mov       edx,dword ptr [$ecjmfcia+4]
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
	?debug L 1547
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
	?debug L 1549
	mov       eax,dword ptr [ebp-36]
	?debug L 1547
	add       esp,24
	?debug L 1549
	and       eax,2048
	?debug L 1550
?live16428@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1549
?live16428@144: ; 
	mov       dword ptr [$moimfcia],eax
	?debug L 1550
?live16428@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1551
?live16428@176: ; EAX = ret
	mov       dword ptr [$ecjmfcia],0
	mov       dword ptr [$ecjmfcia+4],0
	?debug L 1550
?live16428@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1553
?live16428@208: ; 
@645:
@635:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@632:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_xop$qv+0
	dd        @632+0
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
	dd	?patch196
	dd	?patch197
	dd	?patch198
	df	@@stk@cpu@cpu_has_xop$qv
	dw	0
	dw	4186
	dw	0
	dw	335
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
	dw	336
	dw	0
	dw	0
	dw	0
	dw	?patch199
	dw	529
	dw	?patch200
	dd	?live16428@176-@@stk@cpu@cpu_has_xop$qv
	dd	?live16428@192-?live16428@176
	dw	1
?patch200	equ	1
?patch199	equ	14
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
	df	$ecjmfcia
	dw	0
	dw	4108
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
	df	$moimfcia
	dw	0
	dw	117
	dw	0
	dw	343
	dw	0
	dw	0
	dw	0
?patch196	equ	@645-@@stk@cpu@cpu_has_xop$qv+72
?patch197	equ	0
?patch198	equ	@645-@@stk@cpu@cpu_has_xop$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mfjmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ejjmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512f$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512f$qv	proc	near
?live16429@0:
	?debug L 1556
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @646
	?debug L 1562
@647:
	mov       eax,dword ptr [$mfjmfcia]
	cmp       eax,-1
	je        short @651
	?debug L 1563
?live16429@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @649
	?debug L 1565
?live16429@48: ; 
@650:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@651:
	cmp       dword ptr [$ejjmfcia+4],0
	jne       short @650
	cmp       dword ptr [$ejjmfcia],0
	jne       short @650
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$ejjmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$ejjmfcia+4],ecx
	jmp       short @654
@653:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@654:
	cmp       dword ptr [$ejjmfcia+4],0
	jne       short @657
	cmp       dword ptr [$ejjmfcia],0
@657:
	je        short @655
	mov       eax,dword ptr [$ejjmfcia]
	mov       edx,dword ptr [$ejjmfcia+4]
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
	?debug L 1568
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
	?debug L 1570
	mov       eax,dword ptr [ebp-44]
	?debug L 1568
	add       esp,24
	?debug L 1570
	and       eax,65536
	?debug L 1571
?live16429@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1570
?live16429@144: ; 
	mov       dword ptr [$mfjmfcia],eax
	?debug L 1571
?live16429@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1572
?live16429@176: ; EAX = ret
	mov       dword ptr [$ejjmfcia],0
	mov       dword ptr [$ejjmfcia+4],0
	?debug L 1571
?live16429@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1574
?live16429@208: ; 
@659:
@649:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@646:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512f$qv+0
	dd        @646+0
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
	dd	?patch201
	dd	?patch202
	dd	?patch203
	df	@@stk@cpu@cpu_has_avx512f$qv
	dw	0
	dw	4188
	dw	0
	dw	344
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
	dw	345
	dw	0
	dw	0
	dw	0
	dw	?patch204
	dw	529
	dw	?patch205
	dd	?live16429@176-@@stk@cpu@cpu_has_avx512f$qv
	dd	?live16429@192-?live16429@176
	dw	1
?patch205	equ	1
?patch204	equ	14
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
	df	$ejjmfcia
	dw	0
	dw	4108
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
	df	$mfjmfcia
	dw	0
	dw	117
	dw	0
	dw	352
	dw	0
	dw	0
	dw	0
?patch201	equ	@659-@@stk@cpu@cpu_has_avx512f$qv+71
?patch202	equ	0
?patch203	equ	@659-@@stk@cpu@cpu_has_avx512f$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mmjmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eakmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512bw$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512bw$qv	proc	near
?live16430@0:
	?debug L 1577
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @660
	?debug L 1583
@661:
	mov       eax,dword ptr [$mmjmfcia]
	cmp       eax,-1
	je        short @665
	?debug L 1584
?live16430@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @663
	?debug L 1586
?live16430@48: ; 
@664:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@665:
	cmp       dword ptr [$eakmfcia+4],0
	jne       short @664
	cmp       dword ptr [$eakmfcia],0
	jne       short @664
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$eakmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$eakmfcia+4],ecx
	jmp       short @668
@667:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@668:
	cmp       dword ptr [$eakmfcia+4],0
	jne       short @671
	cmp       dword ptr [$eakmfcia],0
@671:
	je        short @669
	mov       eax,dword ptr [$eakmfcia]
	mov       edx,dword ptr [$eakmfcia+4]
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
	?debug L 1589
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
	?debug L 1591
	mov       eax,dword ptr [ebp-44]
	?debug L 1589
	add       esp,24
	?debug L 1591
	and       eax,1073741824
	?debug L 1592
?live16430@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1591
?live16430@144: ; 
	mov       dword ptr [$mmjmfcia],eax
	?debug L 1592
?live16430@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1593
?live16430@176: ; EAX = ret
	mov       dword ptr [$eakmfcia],0
	mov       dword ptr [$eakmfcia+4],0
	?debug L 1592
?live16430@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1595
?live16430@208: ; 
@673:
@663:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@660:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512bw$qv+0
	dd        @660+0
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
	dd	?patch206
	dd	?patch207
	dd	?patch208
	df	@@stk@cpu@cpu_has_avx512bw$qv
	dw	0
	dw	4190
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
	dw	354
	dw	0
	dw	0
	dw	0
	dw	?patch209
	dw	529
	dw	?patch210
	dd	?live16430@176-@@stk@cpu@cpu_has_avx512bw$qv
	dd	?live16430@192-?live16430@176
	dw	1
?patch210	equ	1
?patch209	equ	14
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
	df	$eakmfcia
	dw	0
	dw	4108
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
	df	$mmjmfcia
	dw	0
	dw	117
	dw	0
	dw	361
	dw	0
	dw	0
	dw	0
?patch206	equ	@673-@@stk@cpu@cpu_has_avx512bw$qv+71
?patch207	equ	0
?patch208	equ	@673-@@stk@cpu@cpu_has_avx512bw$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mdkmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ehkmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512er$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512er$qv	proc	near
?live16431@0:
	?debug L 1598
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @674
	?debug L 1604
@675:
	mov       eax,dword ptr [$mdkmfcia]
	cmp       eax,-1
	je        short @679
	?debug L 1605
?live16431@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @677
	?debug L 1607
?live16431@48: ; 
@678:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@679:
	cmp       dword ptr [$ehkmfcia+4],0
	jne       short @678
	cmp       dword ptr [$ehkmfcia],0
	jne       short @678
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$ehkmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$ehkmfcia+4],ecx
	jmp       short @682
@681:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@682:
	cmp       dword ptr [$ehkmfcia+4],0
	jne       short @685
	cmp       dword ptr [$ehkmfcia],0
@685:
	je        short @683
	mov       eax,dword ptr [$ehkmfcia]
	mov       edx,dword ptr [$ehkmfcia+4]
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
	?debug L 1610
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
	?debug L 1612
	mov       eax,dword ptr [ebp-44]
	?debug L 1610
	add       esp,24
	?debug L 1612
	and       eax,134217728
	?debug L 1613
?live16431@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1612
?live16431@144: ; 
	mov       dword ptr [$mdkmfcia],eax
	?debug L 1613
?live16431@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1614
?live16431@176: ; EAX = ret
	mov       dword ptr [$ehkmfcia],0
	mov       dword ptr [$ehkmfcia+4],0
	?debug L 1613
?live16431@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1616
?live16431@208: ; 
@687:
@677:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@674:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512er$qv+0
	dd        @674+0
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
	dd	?patch211
	dd	?patch212
	dd	?patch213
	df	@@stk@cpu@cpu_has_avx512er$qv
	dw	0
	dw	4192
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
	dw	363
	dw	0
	dw	0
	dw	0
	dw	?patch214
	dw	529
	dw	?patch215
	dd	?live16431@176-@@stk@cpu@cpu_has_avx512er$qv
	dd	?live16431@192-?live16431@176
	dw	1
?patch215	equ	1
?patch214	equ	14
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
	df	$ehkmfcia
	dw	0
	dw	4108
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
	df	$mdkmfcia
	dw	0
	dw	117
	dw	0
	dw	370
	dw	0
	dw	0
	dw	0
?patch211	equ	@687-@@stk@cpu@cpu_has_avx512er$qv+71
?patch212	equ	0
?patch213	equ	@687-@@stk@cpu@cpu_has_avx512er$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mkkmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eokmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512cd$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512cd$qv	proc	near
?live16432@0:
	?debug L 1619
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @688
	?debug L 1625
@689:
	mov       eax,dword ptr [$mkkmfcia]
	cmp       eax,-1
	je        short @693
	?debug L 1626
?live16432@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @691
	?debug L 1628
?live16432@48: ; 
@692:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@693:
	cmp       dword ptr [$eokmfcia+4],0
	jne       short @692
	cmp       dword ptr [$eokmfcia],0
	jne       short @692
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$eokmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$eokmfcia+4],ecx
	jmp       short @696
@695:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@696:
	cmp       dword ptr [$eokmfcia+4],0
	jne       short @699
	cmp       dword ptr [$eokmfcia],0
@699:
	je        short @697
	mov       eax,dword ptr [$eokmfcia]
	mov       edx,dword ptr [$eokmfcia+4]
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
	?debug L 1631
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
	?debug L 1633
	mov       eax,dword ptr [ebp-44]
	?debug L 1631
	add       esp,24
	?debug L 1633
	and       eax,268435456
	?debug L 1634
?live16432@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1633
?live16432@144: ; 
	mov       dword ptr [$mkkmfcia],eax
	?debug L 1634
?live16432@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1635
?live16432@176: ; EAX = ret
	mov       dword ptr [$eokmfcia],0
	mov       dword ptr [$eokmfcia+4],0
	?debug L 1634
?live16432@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1637
?live16432@208: ; 
@701:
@691:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@688:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512cd$qv+0
	dd        @688+0
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
	dd	?patch216
	dd	?patch217
	dd	?patch218
	df	@@stk@cpu@cpu_has_avx512cd$qv
	dw	0
	dw	4194
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
	dw	372
	dw	0
	dw	0
	dw	0
	dw	?patch219
	dw	529
	dw	?patch220
	dd	?live16432@176-@@stk@cpu@cpu_has_avx512cd$qv
	dd	?live16432@192-?live16432@176
	dw	1
?patch220	equ	1
?patch219	equ	14
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
	df	$eokmfcia
	dw	0
	dw	4108
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
	df	$mkkmfcia
	dw	0
	dw	117
	dw	0
	dw	379
	dw	0
	dw	0
	dw	0
?patch216	equ	@701-@@stk@cpu@cpu_has_avx512cd$qv+71
?patch217	equ	0
?patch218	equ	@701-@@stk@cpu@cpu_has_avx512cd$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mblmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eflmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512pf$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512pf$qv	proc	near
?live16433@0:
	?debug L 1640
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @702
	?debug L 1646
@703:
	mov       eax,dword ptr [$mblmfcia]
	cmp       eax,-1
	je        short @707
	?debug L 1647
?live16433@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @705
	?debug L 1649
?live16433@48: ; 
@706:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@707:
	cmp       dword ptr [$eflmfcia+4],0
	jne       short @706
	cmp       dword ptr [$eflmfcia],0
	jne       short @706
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$eflmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$eflmfcia+4],ecx
	jmp       short @710
@709:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@710:
	cmp       dword ptr [$eflmfcia+4],0
	jne       short @713
	cmp       dword ptr [$eflmfcia],0
@713:
	je        short @711
	mov       eax,dword ptr [$eflmfcia]
	mov       edx,dword ptr [$eflmfcia+4]
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
	?debug L 1652
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
	?debug L 1654
	mov       eax,dword ptr [ebp-44]
	?debug L 1652
	add       esp,24
	?debug L 1654
	and       eax,67108864
	?debug L 1655
?live16433@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1654
?live16433@144: ; 
	mov       dword ptr [$mblmfcia],eax
	?debug L 1655
?live16433@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1656
?live16433@176: ; EAX = ret
	mov       dword ptr [$eflmfcia],0
	mov       dword ptr [$eflmfcia+4],0
	?debug L 1655
?live16433@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1658
?live16433@208: ; 
@715:
@705:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@702:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512pf$qv+0
	dd        @702+0
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
	dd	?patch221
	dd	?patch222
	dd	?patch223
	df	@@stk@cpu@cpu_has_avx512pf$qv
	dw	0
	dw	4196
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
	dw	381
	dw	0
	dw	0
	dw	0
	dw	?patch224
	dw	529
	dw	?patch225
	dd	?live16433@176-@@stk@cpu@cpu_has_avx512pf$qv
	dd	?live16433@192-?live16433@176
	dw	1
?patch225	equ	1
?patch224	equ	14
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
	df	$eflmfcia
	dw	0
	dw	4108
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
	df	$mblmfcia
	dw	0
	dw	117
	dw	0
	dw	388
	dw	0
	dw	0
	dw	0
?patch221	equ	@715-@@stk@cpu@cpu_has_avx512pf$qv+71
?patch222	equ	0
?patch223	equ	@715-@@stk@cpu@cpu_has_avx512pf$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$milmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$emlmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512dq$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512dq$qv	proc	near
?live16434@0:
	?debug L 1661
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @716
	?debug L 1667
@717:
	mov       eax,dword ptr [$milmfcia]
	cmp       eax,-1
	je        short @721
	?debug L 1668
?live16434@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @719
	?debug L 1670
?live16434@48: ; 
@720:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@721:
	cmp       dword ptr [$emlmfcia+4],0
	jne       short @720
	cmp       dword ptr [$emlmfcia],0
	jne       short @720
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$emlmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$emlmfcia+4],ecx
	jmp       short @724
@723:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@724:
	cmp       dword ptr [$emlmfcia+4],0
	jne       short @727
	cmp       dword ptr [$emlmfcia],0
@727:
	je        short @725
	mov       eax,dword ptr [$emlmfcia]
	mov       edx,dword ptr [$emlmfcia+4]
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
	?debug L 1673
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
	?debug L 1675
	mov       eax,dword ptr [ebp-44]
	?debug L 1673
	add       esp,24
	?debug L 1675
	and       eax,131072
	?debug L 1676
?live16434@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1675
?live16434@144: ; 
	mov       dword ptr [$milmfcia],eax
	?debug L 1676
?live16434@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1677
?live16434@176: ; EAX = ret
	mov       dword ptr [$emlmfcia],0
	mov       dword ptr [$emlmfcia+4],0
	?debug L 1676
?live16434@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1679
?live16434@208: ; 
@729:
@719:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@716:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512dq$qv+0
	dd        @716+0
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
	dd	?patch226
	dd	?patch227
	dd	?patch228
	df	@@stk@cpu@cpu_has_avx512dq$qv
	dw	0
	dw	4198
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
	dw	390
	dw	0
	dw	0
	dw	0
	dw	?patch229
	dw	529
	dw	?patch230
	dd	?live16434@176-@@stk@cpu@cpu_has_avx512dq$qv
	dd	?live16434@192-?live16434@176
	dw	1
?patch230	equ	1
?patch229	equ	14
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
	df	$emlmfcia
	dw	0
	dw	4108
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
	df	$milmfcia
	dw	0
	dw	117
	dw	0
	dw	397
	dw	0
	dw	0
	dw	0
?patch226	equ	@729-@@stk@cpu@cpu_has_avx512dq$qv+71
?patch227	equ	0
?patch228	equ	@729-@@stk@cpu@cpu_has_avx512dq$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mplmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$edmmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512vl$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512vl$qv	proc	near
?live16435@0:
	?debug L 1682
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @730
	?debug L 1688
@731:
	mov       eax,dword ptr [$mplmfcia]
	cmp       eax,-1
	je        short @735
	?debug L 1689
?live16435@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @733
	?debug L 1691
?live16435@48: ; 
@734:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@735:
	cmp       dword ptr [$edmmfcia+4],0
	jne       short @734
	cmp       dword ptr [$edmmfcia],0
	jne       short @734
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$edmmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$edmmfcia+4],ecx
	jmp       short @738
@737:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@738:
	cmp       dword ptr [$edmmfcia+4],0
	jne       short @741
	cmp       dword ptr [$edmmfcia],0
@741:
	je        short @739
	mov       eax,dword ptr [$edmmfcia]
	mov       edx,dword ptr [$edmmfcia+4]
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
	?debug L 1694
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
	?debug L 1696
	mov       eax,dword ptr [ebp-44]
	?debug L 1694
	add       esp,24
	?debug L 1696
	and       eax,-2147483648
	?debug L 1697
?live16435@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1696
?live16435@144: ; 
	mov       dword ptr [$mplmfcia],eax
	?debug L 1697
?live16435@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1698
?live16435@176: ; EAX = ret
	mov       dword ptr [$edmmfcia],0
	mov       dword ptr [$edmmfcia+4],0
	?debug L 1697
?live16435@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1700
?live16435@208: ; 
@743:
@733:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@730:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512vl$qv+0
	dd        @730+0
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
	dd	?patch231
	dd	?patch232
	dd	?patch233
	df	@@stk@cpu@cpu_has_avx512vl$qv
	dw	0
	dw	4200
	dw	0
	dw	398
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
	dw	399
	dw	0
	dw	0
	dw	0
	dw	?patch234
	dw	529
	dw	?patch235
	dd	?live16435@176-@@stk@cpu@cpu_has_avx512vl$qv
	dd	?live16435@192-?live16435@176
	dw	1
?patch235	equ	1
?patch234	equ	14
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
	df	$edmmfcia
	dw	0
	dw	4108
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
	df	$mplmfcia
	dw	0
	dw	117
	dw	0
	dw	406
	dw	0
	dw	0
	dw	0
?patch231	equ	@743-@@stk@cpu@cpu_has_avx512vl$qv+71
?patch232	equ	0
?patch233	equ	@743-@@stk@cpu@cpu_has_avx512vl$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mgmmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ekmmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512ifma$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512ifma$qv	proc	near
?live16436@0:
	?debug L 1703
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @744
	?debug L 1709
@745:
	mov       eax,dword ptr [$mgmmfcia]
	cmp       eax,-1
	je        short @749
	?debug L 1710
?live16436@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @747
	?debug L 1712
?live16436@48: ; 
@748:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@749:
	cmp       dword ptr [$ekmmfcia+4],0
	jne       short @748
	cmp       dword ptr [$ekmmfcia],0
	jne       short @748
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$ekmmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$ekmmfcia+4],ecx
	jmp       short @752
@751:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@752:
	cmp       dword ptr [$ekmmfcia+4],0
	jne       short @755
	cmp       dword ptr [$ekmmfcia],0
@755:
	je        short @753
	mov       eax,dword ptr [$ekmmfcia]
	mov       edx,dword ptr [$ekmmfcia+4]
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
	?debug L 1715
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
	?debug L 1717
	mov       eax,dword ptr [ebp-44]
	?debug L 1715
	add       esp,24
	?debug L 1717
	and       eax,2097152
	?debug L 1718
?live16436@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1717
?live16436@144: ; 
	mov       dword ptr [$mgmmfcia],eax
	?debug L 1718
?live16436@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1719
?live16436@176: ; EAX = ret
	mov       dword ptr [$ekmmfcia],0
	mov       dword ptr [$ekmmfcia+4],0
	?debug L 1718
?live16436@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1721
?live16436@208: ; 
@757:
@747:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@744:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512ifma$qv+0
	dd        @744+0
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
	dd	?patch236
	dd	?patch237
	dd	?patch238
	df	@@stk@cpu@cpu_has_avx512ifma$qv
	dw	0
	dw	4202
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
	dw	408
	dw	0
	dw	0
	dw	0
	dw	?patch239
	dw	529
	dw	?patch240
	dd	?live16436@176-@@stk@cpu@cpu_has_avx512ifma$qv
	dd	?live16436@192-?live16436@176
	dw	1
?patch240	equ	1
?patch239	equ	14
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
	df	$ekmmfcia
	dw	0
	dw	4108
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
	df	$mgmmfcia
	dw	0
	dw	117
	dw	0
	dw	415
	dw	0
	dw	0
	dw	0
?patch236	equ	@757-@@stk@cpu@cpu_has_avx512ifma$qv+71
?patch237	equ	0
?patch238	equ	@757-@@stk@cpu@cpu_has_avx512ifma$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mnmmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ebnmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512vbmi$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512vbmi$qv	proc	near
?live16437@0:
	?debug L 1724
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @758
	?debug L 1730
@759:
	mov       eax,dword ptr [$mnmmfcia]
	cmp       eax,-1
	je        short @763
	?debug L 1731
?live16437@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @761
	?debug L 1733
?live16437@48: ; 
@762:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@763:
	cmp       dword ptr [$ebnmfcia+4],0
	jne       short @762
	cmp       dword ptr [$ebnmfcia],0
	jne       short @762
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$ebnmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$ebnmfcia+4],ecx
	jmp       short @766
@765:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@766:
	cmp       dword ptr [$ebnmfcia+4],0
	jne       short @769
	cmp       dword ptr [$ebnmfcia],0
@769:
	je        short @767
	mov       eax,dword ptr [$ebnmfcia]
	mov       edx,dword ptr [$ebnmfcia+4]
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
	?debug L 1736
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
	?debug L 1738
	mov       eax,dword ptr [ebp-36]
	?debug L 1736
	add       esp,24
	?debug L 1738
	and       eax,2
	?debug L 1739
?live16437@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1738
?live16437@144: ; 
	mov       dword ptr [$mnmmfcia],eax
	?debug L 1739
?live16437@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1740
?live16437@176: ; EAX = ret
	mov       dword ptr [$ebnmfcia],0
	mov       dword ptr [$ebnmfcia+4],0
	?debug L 1739
?live16437@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1742
?live16437@208: ; 
@771:
@761:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@758:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_avx512vbmi$qv+0
	dd        @758+0
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
	dd	?patch241
	dd	?patch242
	dd	?patch243
	df	@@stk@cpu@cpu_has_avx512vbmi$qv
	dw	0
	dw	4204
	dw	0
	dw	416
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
	dw	417
	dw	0
	dw	0
	dw	0
	dw	?patch244
	dw	529
	dw	?patch245
	dd	?live16437@176-@@stk@cpu@cpu_has_avx512vbmi$qv
	dd	?live16437@192-?live16437@176
	dw	1
?patch245	equ	1
?patch244	equ	14
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
	df	$ebnmfcia
	dw	0
	dw	4108
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
	df	$mnmmfcia
	dw	0
	dw	117
	dw	0
	dw	424
	dw	0
	dw	0
	dw	0
?patch241	equ	@771-@@stk@cpu@cpu_has_avx512vbmi$qv+73
?patch242	equ	0
?patch243	equ	@771-@@stk@cpu@cpu_has_avx512vbmi$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$menmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$einmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_adx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_adx$qv	proc	near
?live16438@0:
	?debug L 1745
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @772
	?debug L 1751
@773:
	mov       eax,dword ptr [$menmfcia]
	cmp       eax,-1
	je        short @777
	?debug L 1752
?live16438@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @775
	?debug L 1754
?live16438@48: ; 
@776:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@777:
	cmp       dword ptr [$einmfcia+4],0
	jne       short @776
	cmp       dword ptr [$einmfcia],0
	jne       short @776
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$einmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$einmfcia+4],ecx
	jmp       short @780
@779:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@780:
	cmp       dword ptr [$einmfcia+4],0
	jne       short @783
	cmp       dword ptr [$einmfcia],0
@783:
	je        short @781
	mov       eax,dword ptr [$einmfcia]
	mov       edx,dword ptr [$einmfcia+4]
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
	?debug L 1757
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
	?debug L 1759
	mov       eax,dword ptr [ebp-44]
	?debug L 1757
	add       esp,24
	?debug L 1759
	and       eax,524288
	?debug L 1760
?live16438@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1759
?live16438@144: ; 
	mov       dword ptr [$menmfcia],eax
	?debug L 1760
?live16438@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1761
?live16438@176: ; EAX = ret
	mov       dword ptr [$einmfcia],0
	mov       dword ptr [$einmfcia+4],0
	?debug L 1760
?live16438@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1763
?live16438@208: ; 
@785:
@775:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@772:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_adx$qv+0
	dd        @772+0
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
	dd	?patch246
	dd	?patch247
	dd	?patch248
	df	@@stk@cpu@cpu_has_adx$qv
	dw	0
	dw	4206
	dw	0
	dw	425
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
	dw	426
	dw	0
	dw	0
	dw	0
	dw	?patch249
	dw	529
	dw	?patch250
	dd	?live16438@176-@@stk@cpu@cpu_has_adx$qv
	dd	?live16438@192-?live16438@176
	dw	1
?patch250	equ	1
?patch249	equ	14
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
	df	$einmfcia
	dw	0
	dw	4108
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
	df	$menmfcia
	dw	0
	dw	117
	dw	0
	dw	433
	dw	0
	dw	0
	dw	0
?patch246	equ	@785-@@stk@cpu@cpu_has_adx$qv+71
?patch247	equ	0
?patch248	equ	@785-@@stk@cpu@cpu_has_adx$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mlnmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$epnmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_lzcnt$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_lzcnt$qv	proc	near
?live16439@0:
	?debug L 1766
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @786
	?debug L 1772
@787:
	mov       eax,dword ptr [$mlnmfcia]
	cmp       eax,-1
	je        short @791
	?debug L 1773
?live16439@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @789
	?debug L 1775
?live16439@48: ; 
@790:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@791:
	cmp       dword ptr [$epnmfcia+4],0
	jne       short @790
	cmp       dword ptr [$epnmfcia],0
	jne       short @790
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$epnmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$epnmfcia+4],ecx
	jmp       short @794
@793:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@794:
	cmp       dword ptr [$epnmfcia+4],0
	jne       short @797
	cmp       dword ptr [$epnmfcia],0
@797:
	je        short @795
	mov       eax,dword ptr [$epnmfcia]
	mov       edx,dword ptr [$epnmfcia+4]
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
	?debug L 1778
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
	?debug L 1780
	mov       eax,dword ptr [ebp-36]
	?debug L 1778
	add       esp,24
	?debug L 1780
	and       eax,32
	?debug L 1781
?live16439@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1780
?live16439@144: ; 
	mov       dword ptr [$mlnmfcia],eax
	?debug L 1781
?live16439@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1782
?live16439@176: ; EAX = ret
	mov       dword ptr [$epnmfcia],0
	mov       dword ptr [$epnmfcia+4],0
	?debug L 1781
?live16439@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1784
?live16439@208: ; 
@799:
@789:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@786:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_lzcnt$qv+0
	dd        @786+0
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
	dd	?patch251
	dd	?patch252
	dd	?patch253
	df	@@stk@cpu@cpu_has_lzcnt$qv
	dw	0
	dw	4208
	dw	0
	dw	434
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
	dw	435
	dw	0
	dw	0
	dw	0
	dw	?patch254
	dw	529
	dw	?patch255
	dd	?live16439@176-@@stk@cpu@cpu_has_lzcnt$qv
	dd	?live16439@192-?live16439@176
	dw	1
?patch255	equ	1
?patch254	equ	14
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
	df	$epnmfcia
	dw	0
	dw	4108
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
	df	$mlnmfcia
	dw	0
	dw	117
	dw	0
	dw	442
	dw	0
	dw	0
	dw	0
?patch251	equ	@799-@@stk@cpu@cpu_has_lzcnt$qv+74
?patch252	equ	0
?patch253	equ	@799-@@stk@cpu@cpu_has_lzcnt$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mcomfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$egomfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_tbm$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_tbm$qv	proc	near
?live16440@0:
	?debug L 1787
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @800
	?debug L 1793
@801:
	mov       eax,dword ptr [$mcomfcia]
	cmp       eax,-1
	je        short @805
	?debug L 1794
?live16440@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @803
	?debug L 1796
?live16440@48: ; 
@804:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@805:
	cmp       dword ptr [$egomfcia+4],0
	jne       short @804
	cmp       dword ptr [$egomfcia],0
	jne       short @804
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$egomfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$egomfcia+4],ecx
	jmp       short @808
@807:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@808:
	cmp       dword ptr [$egomfcia+4],0
	jne       short @811
	cmp       dword ptr [$egomfcia],0
@811:
	je        short @809
	mov       eax,dword ptr [$egomfcia]
	mov       edx,dword ptr [$egomfcia+4]
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
	?debug L 1799
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
	?debug L 1801
	mov       eax,dword ptr [ebp-36]
	?debug L 1799
	add       esp,24
	?debug L 1801
	and       eax,2097152
	?debug L 1802
?live16440@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1801
?live16440@144: ; 
	mov       dword ptr [$mcomfcia],eax
	?debug L 1802
?live16440@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1803
?live16440@176: ; EAX = ret
	mov       dword ptr [$egomfcia],0
	mov       dword ptr [$egomfcia+4],0
	?debug L 1802
?live16440@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1805
?live16440@208: ; 
@813:
@803:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@800:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_tbm$qv+0
	dd        @800+0
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
	dd	?patch256
	dd	?patch257
	dd	?patch258
	df	@@stk@cpu@cpu_has_tbm$qv
	dw	0
	dw	4210
	dw	0
	dw	443
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
	dw	444
	dw	0
	dw	0
	dw	0
	dw	?patch259
	dw	529
	dw	?patch260
	dd	?live16440@176-@@stk@cpu@cpu_has_tbm$qv
	dd	?live16440@192-?live16440@176
	dw	1
?patch260	equ	1
?patch259	equ	14
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
	df	$egomfcia
	dw	0
	dw	4108
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
	df	$mcomfcia
	dw	0
	dw	117
	dw	0
	dw	451
	dw	0
	dw	0
	dw	0
?patch256	equ	@813-@@stk@cpu@cpu_has_tbm$qv+72
?patch257	equ	0
?patch258	equ	@813-@@stk@cpu@cpu_has_tbm$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mjomfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$enomfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_clfsh$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_clfsh$qv	proc	near
?live16441@0:
	?debug L 1808
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @814
	?debug L 1814
@815:
	mov       eax,dword ptr [$mjomfcia]
	cmp       eax,-1
	je        short @819
	?debug L 1815
?live16441@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @817
	?debug L 1817
?live16441@48: ; 
@818:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@819:
	cmp       dword ptr [$enomfcia+4],0
	jne       short @818
	cmp       dword ptr [$enomfcia],0
	jne       short @818
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$enomfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$enomfcia+4],ecx
	jmp       short @822
@821:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@822:
	cmp       dword ptr [$enomfcia+4],0
	jne       short @825
	cmp       dword ptr [$enomfcia],0
@825:
	je        short @823
	mov       eax,dword ptr [$enomfcia]
	mov       edx,dword ptr [$enomfcia+4]
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
	?debug L 1820
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
	?debug L 1822
	mov       eax,dword ptr [ebp-36]
	?debug L 1820
	add       esp,24
	?debug L 1822
	and       eax,524288
	?debug L 1823
?live16441@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1822
?live16441@144: ; 
	mov       dword ptr [$mjomfcia],eax
	?debug L 1823
?live16441@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1824
?live16441@176: ; EAX = ret
	mov       dword ptr [$enomfcia],0
	mov       dword ptr [$enomfcia+4],0
	?debug L 1823
?live16441@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1826
?live16441@208: ; 
@827:
@817:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@814:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_clfsh$qv+0
	dd        @814+0
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
	dd	?patch261
	dd	?patch262
	dd	?patch263
	df	@@stk@cpu@cpu_has_clfsh$qv
	dw	0
	dw	4212
	dw	0
	dw	452
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
	dw	453
	dw	0
	dw	0
	dw	0
	dw	?patch264
	dw	529
	dw	?patch265
	dd	?live16441@176-@@stk@cpu@cpu_has_clfsh$qv
	dd	?live16441@192-?live16441@176
	dw	1
?patch265	equ	1
?patch264	equ	14
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
	df	$enomfcia
	dw	0
	dw	4108
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
	df	$mjomfcia
	dw	0
	dw	117
	dw	0
	dw	460
	dw	0
	dw	0
	dw	0
?patch261	equ	@827-@@stk@cpu@cpu_has_clfsh$qv+71
?patch262	equ	0
?patch263	equ	@827-@@stk@cpu@cpu_has_clfsh$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mapmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eepmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_pclmulqdq$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_pclmulqdq$qv	proc	near
?live16442@0:
	?debug L 1829
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @828
	?debug L 1835
@829:
	mov       eax,dword ptr [$mapmfcia]
	cmp       eax,-1
	je        short @833
	?debug L 1836
?live16442@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @831
	?debug L 1838
?live16442@48: ; 
@832:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@833:
	cmp       dword ptr [$eepmfcia+4],0
	jne       short @832
	cmp       dword ptr [$eepmfcia],0
	jne       short @832
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$eepmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$eepmfcia+4],ecx
	jmp       short @836
@835:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@836:
	cmp       dword ptr [$eepmfcia+4],0
	jne       short @839
	cmp       dword ptr [$eepmfcia],0
@839:
	je        short @837
	mov       eax,dword ptr [$eepmfcia]
	mov       edx,dword ptr [$eepmfcia+4]
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
	?debug L 1841
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
	?debug L 1843
	mov       eax,dword ptr [ebp-36]
	?debug L 1841
	add       esp,24
	?debug L 1843
	and       eax,32
	?debug L 1844
?live16442@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1843
?live16442@144: ; 
	mov       dword ptr [$mapmfcia],eax
	?debug L 1844
?live16442@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1845
?live16442@176: ; EAX = ret
	mov       dword ptr [$eepmfcia],0
	mov       dword ptr [$eepmfcia+4],0
	?debug L 1844
?live16442@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1847
?live16442@208: ; 
@841:
@831:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@828:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_pclmulqdq$qv+0
	dd        @828+0
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
	dd	?patch266
	dd	?patch267
	dd	?patch268
	df	@@stk@cpu@cpu_has_pclmulqdq$qv
	dw	0
	dw	4214
	dw	0
	dw	461
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
	dw	462
	dw	0
	dw	0
	dw	0
	dw	?patch269
	dw	529
	dw	?patch270
	dd	?live16442@176-@@stk@cpu@cpu_has_pclmulqdq$qv
	dd	?live16442@192-?live16442@176
	dw	1
?patch270	equ	1
?patch269	equ	14
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
	df	$eepmfcia
	dw	0
	dw	4108
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
	df	$mapmfcia
	dw	0
	dw	117
	dw	0
	dw	469
	dw	0
	dw	0
	dw	0
?patch266	equ	@841-@@stk@cpu@cpu_has_pclmulqdq$qv+73
?patch267	equ	0
?patch268	equ	@841-@@stk@cpu@cpu_has_pclmulqdq$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mhpmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elpmfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_fxsr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_fxsr$qv	proc	near
?live16443@0:
	?debug L 1850
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @842
	?debug L 1856
@843:
	mov       eax,dword ptr [$mhpmfcia]
	cmp       eax,-1
	je        short @847
	?debug L 1857
?live16443@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @845
	?debug L 1859
?live16443@48: ; 
@846:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@847:
	cmp       dword ptr [$elpmfcia+4],0
	jne       short @846
	cmp       dword ptr [$elpmfcia],0
	jne       short @846
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$elpmfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$elpmfcia+4],ecx
	jmp       short @850
@849:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@850:
	cmp       dword ptr [$elpmfcia+4],0
	jne       short @853
	cmp       dword ptr [$elpmfcia],0
@853:
	je        short @851
	mov       eax,dword ptr [$elpmfcia]
	mov       edx,dword ptr [$elpmfcia+4]
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
	?debug L 1862
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
	?debug L 1864
	mov       eax,dword ptr [ebp-36]
	?debug L 1862
	add       esp,24
	?debug L 1864
	and       eax,16777216
	?debug L 1865
?live16443@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1864
?live16443@144: ; 
	mov       dword ptr [$mhpmfcia],eax
	?debug L 1865
?live16443@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1866
?live16443@176: ; EAX = ret
	mov       dword ptr [$elpmfcia],0
	mov       dword ptr [$elpmfcia+4],0
	?debug L 1865
?live16443@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1868
?live16443@208: ; 
@855:
@845:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@842:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_fxsr$qv+0
	dd        @842+0
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
	dd	?patch271
	dd	?patch272
	dd	?patch273
	df	@@stk@cpu@cpu_has_fxsr$qv
	dw	0
	dw	4216
	dw	0
	dw	470
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
	dw	471
	dw	0
	dw	0
	dw	0
	dw	?patch274
	dw	529
	dw	?patch275
	dd	?live16443@176-@@stk@cpu@cpu_has_fxsr$qv
	dd	?live16443@192-?live16443@176
	dw	1
?patch275	equ	1
?patch274	equ	14
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
	df	$elpmfcia
	dw	0
	dw	4108
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
	df	$mhpmfcia
	dw	0
	dw	117
	dw	0
	dw	478
	dw	0
	dw	0
	dw	0
?patch271	equ	@855-@@stk@cpu@cpu_has_fxsr$qv+71
?patch272	equ	0
?patch273	equ	@855-@@stk@cpu@cpu_has_fxsr$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mopmfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ecanfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_ss$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_ss$qv	proc	near
?live16444@0:
	?debug L 1871
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @856
	?debug L 1877
@857:
	mov       eax,dword ptr [$mopmfcia]
	cmp       eax,-1
	je        short @861
	?debug L 1878
?live16444@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @859
	?debug L 1880
?live16444@48: ; 
@860:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@861:
	cmp       dword ptr [$ecanfcia+4],0
	jne       short @860
	cmp       dword ptr [$ecanfcia],0
	jne       short @860
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$ecanfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$ecanfcia+4],ecx
	jmp       short @864
@863:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@864:
	cmp       dword ptr [$ecanfcia+4],0
	jne       short @867
	cmp       dword ptr [$ecanfcia],0
@867:
	je        short @865
	mov       eax,dword ptr [$ecanfcia]
	mov       edx,dword ptr [$ecanfcia+4]
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
	?debug L 1883
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
	?debug L 1885
	mov       eax,dword ptr [ebp-36]
	?debug L 1883
	add       esp,24
	?debug L 1885
	and       eax,134217728
	?debug L 1886
?live16444@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1885
?live16444@144: ; 
	mov       dword ptr [$mopmfcia],eax
	?debug L 1886
?live16444@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1887
?live16444@176: ; EAX = ret
	mov       dword ptr [$ecanfcia],0
	mov       dword ptr [$ecanfcia+4],0
	?debug L 1886
?live16444@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1889
?live16444@208: ; 
@869:
@859:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@856:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_ss$qv+0
	dd        @856+0
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
	dd	?patch276
	dd	?patch277
	dd	?patch278
	df	@@stk@cpu@cpu_has_ss$qv
	dw	0
	dw	4218
	dw	0
	dw	479
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
	dw	480
	dw	0
	dw	0
	dw	0
	dw	?patch279
	dw	529
	dw	?patch280
	dd	?live16444@176-@@stk@cpu@cpu_has_ss$qv
	dd	?live16444@192-?live16444@176
	dw	1
?patch280	equ	1
?patch279	equ	14
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
	df	$ecanfcia
	dw	0
	dw	4108
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
	df	$mopmfcia
	dw	0
	dw	117
	dw	0
	dw	487
	dw	0
	dw	0
	dw	0
?patch276	equ	@869-@@stk@cpu@cpu_has_ss$qv+71
?patch277	equ	0
?patch278	equ	@869-@@stk@cpu@cpu_has_ss$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mfanfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ejanfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_mtrr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mtrr$qv	proc	near
?live16445@0:
	?debug L 1892
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @870
	?debug L 1898
@871:
	mov       eax,dword ptr [$mfanfcia]
	cmp       eax,-1
	je        short @875
	?debug L 1899
?live16445@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @873
	?debug L 1901
?live16445@48: ; 
@874:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@875:
	cmp       dword ptr [$ejanfcia+4],0
	jne       short @874
	cmp       dword ptr [$ejanfcia],0
	jne       short @874
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$ejanfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$ejanfcia+4],ecx
	jmp       short @878
@877:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@878:
	cmp       dword ptr [$ejanfcia+4],0
	jne       short @881
	cmp       dword ptr [$ejanfcia],0
@881:
	je        short @879
	mov       eax,dword ptr [$ejanfcia]
	mov       edx,dword ptr [$ejanfcia+4]
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
	?debug L 1904
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
	?debug L 1906
	mov       eax,dword ptr [ebp-36]
	?debug L 1904
	add       esp,24
	?debug L 1906
	and       eax,4096
	?debug L 1907
?live16445@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1906
?live16445@144: ; 
	mov       dword ptr [$mfanfcia],eax
	?debug L 1907
?live16445@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1908
?live16445@176: ; EAX = ret
	mov       dword ptr [$ejanfcia],0
	mov       dword ptr [$ejanfcia+4],0
	?debug L 1907
?live16445@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1910
?live16445@208: ; 
@883:
@873:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@870:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_mtrr$qv+0
	dd        @870+0
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
	dd	?patch281
	dd	?patch282
	dd	?patch283
	df	@@stk@cpu@cpu_has_mtrr$qv
	dw	0
	dw	4220
	dw	0
	dw	488
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
	dw	489
	dw	0
	dw	0
	dw	0
	dw	?patch284
	dw	529
	dw	?patch285
	dd	?live16445@176-@@stk@cpu@cpu_has_mtrr$qv
	dd	?live16445@192-?live16445@176
	dw	1
?patch285	equ	1
?patch284	equ	14
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
	df	$ejanfcia
	dw	0
	dw	4108
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
	df	$mfanfcia
	dw	0
	dw	117
	dw	0
	dw	496
	dw	0
	dw	0
	dw	0
?patch281	equ	@883-@@stk@cpu@cpu_has_mtrr$qv+71
?patch282	equ	0
?patch283	equ	@883-@@stk@cpu@cpu_has_mtrr$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mmanfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eabnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_msr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_msr$qv	proc	near
?live16446@0:
	?debug L 1913
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @884
	?debug L 1919
@885:
	mov       eax,dword ptr [$mmanfcia]
	cmp       eax,-1
	je        short @889
	?debug L 1920
?live16446@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @887
	?debug L 1922
?live16446@48: ; 
@888:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@889:
	cmp       dword ptr [$eabnfcia+4],0
	jne       short @888
	cmp       dword ptr [$eabnfcia],0
	jne       short @888
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$eabnfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$eabnfcia+4],ecx
	jmp       short @892
@891:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@892:
	cmp       dword ptr [$eabnfcia+4],0
	jne       short @895
	cmp       dword ptr [$eabnfcia],0
@895:
	je        short @893
	mov       eax,dword ptr [$eabnfcia]
	mov       edx,dword ptr [$eabnfcia+4]
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
	?debug L 1925
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
	?debug L 1927
	mov       eax,dword ptr [ebp-36]
	?debug L 1925
	add       esp,24
	?debug L 1927
	and       eax,4096
	?debug L 1928
?live16446@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1927
?live16446@144: ; 
	mov       dword ptr [$mmanfcia],eax
	?debug L 1928
?live16446@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1929
?live16446@176: ; EAX = ret
	mov       dword ptr [$eabnfcia],0
	mov       dword ptr [$eabnfcia+4],0
	?debug L 1928
?live16446@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1931
?live16446@208: ; 
@897:
@887:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@884:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_msr$qv+0
	dd        @884+0
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
	dd	?patch286
	dd	?patch287
	dd	?patch288
	df	@@stk@cpu@cpu_has_msr$qv
	dw	0
	dw	4222
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
	dw	498
	dw	0
	dw	0
	dw	0
	dw	?patch289
	dw	529
	dw	?patch290
	dd	?live16446@176-@@stk@cpu@cpu_has_msr$qv
	dd	?live16446@192-?live16446@176
	dw	1
?patch290	equ	1
?patch289	equ	14
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
	df	$eabnfcia
	dw	0
	dw	4108
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
	df	$mmanfcia
	dw	0
	dw	117
	dw	0
	dw	505
	dw	0
	dw	0
	dw	0
?patch286	equ	@897-@@stk@cpu@cpu_has_msr$qv+71
?patch287	equ	0
?patch288	equ	@897-@@stk@cpu@cpu_has_msr$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mdbnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ehbnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_tsc$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_tsc$qv	proc	near
?live16447@0:
	?debug L 1934
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @898
	?debug L 1940
@899:
	mov       eax,dword ptr [$mdbnfcia]
	cmp       eax,-1
	je        short @903
	?debug L 1941
?live16447@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @901
	?debug L 1943
?live16447@48: ; 
@902:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@903:
	cmp       dword ptr [$ehbnfcia+4],0
	jne       short @902
	cmp       dword ptr [$ehbnfcia],0
	jne       short @902
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$ehbnfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$ehbnfcia+4],ecx
	jmp       short @906
@905:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@906:
	cmp       dword ptr [$ehbnfcia+4],0
	jne       short @909
	cmp       dword ptr [$ehbnfcia],0
@909:
	je        short @907
	mov       eax,dword ptr [$ehbnfcia]
	mov       edx,dword ptr [$ehbnfcia+4]
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
	?debug L 1946
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
	?debug L 1948
	mov       eax,dword ptr [ebp-28]
	?debug L 1946
	add       esp,24
	?debug L 1948
	and       eax,16
	?debug L 1949
?live16447@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1948
?live16447@144: ; 
	mov       dword ptr [$mdbnfcia],eax
	?debug L 1949
?live16447@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1950
?live16447@176: ; EAX = ret
	mov       dword ptr [$ehbnfcia],0
	mov       dword ptr [$ehbnfcia+4],0
	?debug L 1949
?live16447@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1952
?live16447@208: ; 
@911:
@901:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@898:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_tsc$qv+0
	dd        @898+0
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
	dd	?patch291
	dd	?patch292
	dd	?patch293
	df	@@stk@cpu@cpu_has_tsc$qv
	dw	0
	dw	4224
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
	dw	507
	dw	0
	dw	0
	dw	0
	dw	?patch294
	dw	529
	dw	?patch295
	dd	?live16447@176-@@stk@cpu@cpu_has_tsc$qv
	dd	?live16447@192-?live16447@176
	dw	1
?patch295	equ	1
?patch294	equ	14
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
	df	$ehbnfcia
	dw	0
	dw	4108
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
	df	$mdbnfcia
	dw	0
	dw	117
	dw	0
	dw	514
	dw	0
	dw	0
	dw	0
?patch291	equ	@911-@@stk@cpu@cpu_has_tsc$qv+73
?patch292	equ	0
?patch293	equ	@911-@@stk@cpu@cpu_has_tsc$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mkbnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eobnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_psn$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_psn$qv	proc	near
?live16448@0:
	?debug L 1955
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @912
	?debug L 1961
@913:
	mov       eax,dword ptr [$mkbnfcia]
	cmp       eax,-1
	je        short @917
	?debug L 1962
?live16448@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @915
	?debug L 1964
?live16448@48: ; 
@916:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@917:
	cmp       dword ptr [$eobnfcia+4],0
	jne       short @916
	cmp       dword ptr [$eobnfcia],0
	jne       short @916
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$eobnfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$eobnfcia+4],ecx
	jmp       short @920
@919:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@920:
	cmp       dword ptr [$eobnfcia+4],0
	jne       short @923
	cmp       dword ptr [$eobnfcia],0
@923:
	je        short @921
	mov       eax,dword ptr [$eobnfcia]
	mov       edx,dword ptr [$eobnfcia+4]
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
	?debug L 1967
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
	?debug L 1969
	mov       eax,dword ptr [ebp-28]
	?debug L 1967
	add       esp,24
	?debug L 1969
	and       eax,262144
	?debug L 1970
?live16448@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1969
?live16448@144: ; 
	mov       dword ptr [$mkbnfcia],eax
	?debug L 1970
?live16448@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 1971
?live16448@176: ; EAX = ret
	mov       dword ptr [$eobnfcia],0
	mov       dword ptr [$eobnfcia+4],0
	?debug L 1970
?live16448@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 1973
?live16448@208: ; 
@925:
@915:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@912:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_psn$qv+0
	dd        @912+0
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
	dd	?patch296
	dd	?patch297
	dd	?patch298
	df	@@stk@cpu@cpu_has_psn$qv
	dw	0
	dw	4226
	dw	0
	dw	515
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
	dw	516
	dw	0
	dw	0
	dw	0
	dw	?patch299
	dw	529
	dw	?patch300
	dd	?live16448@176-@@stk@cpu@cpu_has_psn$qv
	dd	?live16448@192-?live16448@176
	dw	1
?patch300	equ	1
?patch299	equ	14
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
	df	$eobnfcia
	dw	0
	dw	4108
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
	df	$mkbnfcia
	dw	0
	dw	117
	dw	0
	dw	523
	dw	0
	dw	0
	dw	0
?patch296	equ	@925-@@stk@cpu@cpu_has_psn$qv+71
?patch297	equ	0
?patch298	equ	@925-@@stk@cpu@cpu_has_psn$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mbcnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$efcnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_xsave$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_xsave$qv	proc	near
?live16449@0:
	?debug L 1976
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @926
	?debug L 1982
@927:
	mov       eax,dword ptr [$mbcnfcia]
	cmp       eax,-1
	je        short @931
	?debug L 1983
?live16449@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @929
	?debug L 1985
?live16449@48: ; 
@930:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@931:
	cmp       dword ptr [$efcnfcia+4],0
	jne       short @930
	cmp       dword ptr [$efcnfcia],0
	jne       short @930
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$efcnfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$efcnfcia+4],ecx
	jmp       short @934
@933:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@934:
	cmp       dword ptr [$efcnfcia+4],0
	jne       short @937
	cmp       dword ptr [$efcnfcia],0
@937:
	je        short @935
	mov       eax,dword ptr [$efcnfcia]
	mov       edx,dword ptr [$efcnfcia+4]
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
	?debug L 1988
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
	?debug L 1990
	mov       eax,dword ptr [ebp-36]
	mov       edx,dword ptr [ebp-36]
	and       edx,134217728
	and       eax,67108864
	shr       edx,27
	?debug L 1988
	add       esp,24
	?debug L 1990
	shr       eax,26
	and       eax,edx
	?debug L 1991
?live16449@128: ; EAX = @temp3
	test      eax,eax
	?debug L 1990
?live16449@144: ; 
	mov       dword ptr [$mbcnfcia],eax
	?debug L 1991
?live16449@160: ; EAX = @temp3
	setne     cl
	and       ecx,1
	?debug L 1992
?live16449@176: ; EAX = ret
	mov       dword ptr [$efcnfcia],0
	mov       dword ptr [$efcnfcia+4],0
	?debug L 1991
?live16449@192: ; EAX = @temp3
	mov       eax,ecx
	?debug L 1994
?live16449@208: ; 
@939:
@929:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@926:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_xsave$qv+0
	dd        @926+0
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
	dd	?patch301
	dd	?patch302
	dd	?patch303
	df	@@stk@cpu@cpu_has_xsave$qv
	dw	0
	dw	4228
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
	dw	525
	dw	0
	dw	0
	dw	0
	dw	?patch304
	dw	529
	dw	?patch305
	dd	?live16449@176-@@stk@cpu@cpu_has_xsave$qv
	dd	?live16449@192-?live16449@176
	dw	1
?patch305	equ	1
?patch304	equ	14
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
	df	$efcnfcia
	dw	0
	dw	4108
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
	df	$mbcnfcia
	dw	0
	dw	117
	dw	0
	dw	532
	dw	0
	dw	0
	dw	0
?patch301	equ	@939-@@stk@cpu@cpu_has_xsave$qv+74
?patch302	equ	0
?patch303	equ	@939-@@stk@cpu@cpu_has_xsave$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$micnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$emcnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_clmul$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_clmul$qv	proc	near
?live16450@0:
	?debug L 1997
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @940
	?debug L 2003
@941:
	mov       eax,dword ptr [$micnfcia]
	cmp       eax,-1
	je        short @945
	?debug L 2004
?live16450@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @943
	?debug L 2006
?live16450@48: ; 
@944:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@945:
	cmp       dword ptr [$emcnfcia+4],0
	jne       short @944
	cmp       dword ptr [$emcnfcia],0
	jne       short @944
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$emcnfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$emcnfcia+4],ecx
	jmp       short @948
@947:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@948:
	cmp       dword ptr [$emcnfcia+4],0
	jne       short @951
	cmp       dword ptr [$emcnfcia],0
@951:
	je        short @949
	mov       eax,dword ptr [$emcnfcia]
	mov       edx,dword ptr [$emcnfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @952
	cmp       eax,dword ptr [ebp-20]
@952:
	setne     al
	and       eax,1
	jmp       short @950
@949:
	xor       eax,eax
@950:
	test      al,al
	jne       short @947
	?debug L 2009
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
	?debug L 2011
	mov       eax,dword ptr [ebp-36]
	?debug L 2009
	add       esp,24
	?debug L 2011
	and       eax,4
	?debug L 2012
?live16450@128: ; EAX = @temp3
	test      eax,eax
	?debug L 2011
?live16450@144: ; 
	mov       dword ptr [$micnfcia],eax
	?debug L 2012
?live16450@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 2013
?live16450@176: ; EAX = ret
	mov       dword ptr [$emcnfcia],0
	mov       dword ptr [$emcnfcia+4],0
	?debug L 2012
?live16450@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 2015
?live16450@208: ; 
@953:
@943:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@940:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_clmul$qv+0
	dd        @940+0
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
	dd	?patch306
	dd	?patch307
	dd	?patch308
	df	@@stk@cpu@cpu_has_clmul$qv
	dw	0
	dw	4230
	dw	0
	dw	533
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
	dw	534
	dw	0
	dw	0
	dw	0
	dw	?patch309
	dw	529
	dw	?patch310
	dd	?live16450@176-@@stk@cpu@cpu_has_clmul$qv
	dd	?live16450@192-?live16450@176
	dw	1
?patch310	equ	1
?patch309	equ	14
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
	df	$emcnfcia
	dw	0
	dw	4108
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
	df	$micnfcia
	dw	0
	dw	117
	dw	0
	dw	541
	dw	0
	dw	0
	dw	0
?patch306	equ	@953-@@stk@cpu@cpu_has_clmul$qv+73
?patch307	equ	0
?patch308	equ	@953-@@stk@cpu@cpu_has_clmul$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mpcnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eddnfcia	label	dword
	dd	0
	dd	0
	dd	0
	db	1	dup(?)
	align	4
$mgdnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_psn$qv	segment virtual
	align	2
@@stk@cpu@cpu_psn$qv	proc	near
?live16451@0:
	?debug L 2018
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @954
	?debug L 2025
@955:
	mov       eax,dword ptr [$mpcnfcia]
	cmp       eax,-1
	je        short @959
	?debug L 2026
	mov       eax,offset $eddnfcia
	jmp       @957
	?debug L 2028
@958:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@959:
	cmp       dword ptr [$mgdnfcia+4],0
	jne       short @958
	cmp       dword ptr [$mgdnfcia],0
	jne       short @958
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$mgdnfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$mgdnfcia+4],edx
	jmp       short @962
@961:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@962:
	cmp       dword ptr [$mgdnfcia+4],0
	jne       short @965
	cmp       dword ptr [$mgdnfcia],0
@965:
	je        short @963
	mov       eax,dword ptr [$mgdnfcia]
	mov       edx,dword ptr [$mgdnfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @966
	cmp       eax,dword ptr [ebp-20]
@966:
	setne     cl
	and       ecx,1
	jmp       short @964
@963:
	xor       ecx,ecx
@964:
	test      cl,cl
	jne       short @961
	?debug L 2030
	xor       eax,eax
	mov       dword ptr [$eddnfcia],eax
	?debug L 2031
	xor       edx,edx
	mov       dword ptr [$eddnfcia+4],edx
	?debug L 2032
	xor       eax,eax
	mov       dword ptr [$eddnfcia+8],eax
	?debug L 2033
	call      @@stk@cpu@cpu_has_psn$qv
	test      al,al
	jne       short @967
	?debug L 2034
	mov       dword ptr [$mgdnfcia],0
	mov       dword ptr [$mgdnfcia+4],0
	?debug L 2035
	mov       eax,offset $eddnfcia
	jmp       short @957
	?debug L 2039
@967:
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
	?debug L 2041
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [$eddnfcia+8],ecx
	?debug L 2042
	mov       eax,dword ptr [ebp-28]
	mov       dword ptr [$eddnfcia+4],eax
	?debug L 2043
	mov       edx,dword ptr [ebp-36]
	mov       dword ptr [$eddnfcia],edx
	?debug L 2044
	mov       dword ptr [$mgdnfcia],0
	mov       dword ptr [$mgdnfcia+4],0
	?debug L 2045
	mov       eax,offset $eddnfcia
	?debug L 2046
@968:
@957:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@954:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_psn$qv+0
	dd        @954+0
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
	dd	?patch311
	dd	?patch312
	dd	?patch313
	df	@@stk@cpu@cpu_psn$qv
	dw	0
	dw	4232
	dw	0
	dw	542
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
	dw	543
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	544
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	545
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	546
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mgdnfcia
	dw	0
	dw	4108
	dw	0
	dw	547
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	548
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eddnfcia
	dw	0
	dw	4234
	dw	0
	dw	549
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mpcnfcia
	dw	0
	dw	117
	dw	0
	dw	550
	dw	0
	dw	0
	dw	0
?patch311	equ	@968-@@stk@cpu@cpu_psn$qv+74
?patch312	equ	0
?patch313	equ	@968-@@stk@cpu@cpu_psn$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ekdnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mndnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_fma$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_fma$qv	proc	near
?live16452@0:
	?debug L 2049
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @969
	?debug L 2055
@970:
	mov       eax,dword ptr [$ekdnfcia]
	cmp       eax,-1
	jne       @972
	?debug L 2056
?live16452@32: ; EAX = @temp3
	jmp       short @974
	?debug L 2058
?live16452@48: ; 
@973:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@974:
	cmp       dword ptr [$mndnfcia+4],0
	jne       short @973
	cmp       dword ptr [$mndnfcia],0
	jne       short @973
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       edx,dword ptr [ebp-20]
	mov       dword ptr [$mndnfcia],edx
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [$mndnfcia+4],edx
	jmp       short @977
@976:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@977:
	cmp       dword ptr [$mndnfcia+4],0
	jne       short @980
	cmp       dword ptr [$mndnfcia],0
@980:
	je        short @978
	mov       eax,dword ptr [$mndnfcia]
	mov       edx,dword ptr [$mndnfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @981
	cmp       eax,dword ptr [ebp-20]
@981:
	setne     cl
	and       ecx,1
	jmp       short @979
@978:
	xor       ecx,ecx
@979:
	test      cl,cl
	jne       short @976
	?debug L 2061
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
	?debug L 2063
	test      byte ptr [ebp-35],16
	je        short @982
	?debug L 2064
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
	?debug L 2065
	test      byte ptr [ebp-34],1
	je        short @983
	?debug L 2066
	mov       dword ptr [$ekdnfcia],4
	jmp       short @984
	?debug L 2068
@983:
	mov       dword ptr [$ekdnfcia],3
	?debug L 2069
	jmp       short @984
	?debug L 2071
@982:
	xor       eax,eax
	mov       dword ptr [$ekdnfcia],eax
	?debug L 2073
@984:
	mov       edx,dword ptr [$ekdnfcia]
	?debug L 2074
?live16452@208: ; EAX = ret
	mov       dword ptr [$mndnfcia],0
	?debug L 2073
?live16452@224: ; 
	test      edx,edx
	?debug L 2074
?live16452@240: ; EAX = ret
	mov       dword ptr [$mndnfcia+4],0
	?debug L 2073
?live16452@256: ; 
	setne     al
	and       eax,1
	?debug L 2075
?live16452@272: ; EAX = ret
	xor       edx,edx
	mov       dl,al
	mov       eax,edx
	?debug L 2076
?live16452@288: ; 
@985:
@972:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@969:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_fma$qv+0
	dd        @969+0
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
	dd	?patch314
	dd	?patch315
	dd	?patch316
	df	@@stk@cpu@cpu_has_fma$qv
	dw	0
	dw	4235
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
	dw	552
	dw	0
	dw	0
	dw	0
	dw	?patch317
	dw	529
	dw	?patch318
	dd	?live16452@208-@@stk@cpu@cpu_has_fma$qv
	dd	?live16452@224-?live16452@208
	dw	1
	dd	?live16452@240-@@stk@cpu@cpu_has_fma$qv
	dd	?live16452@256-?live16452@240
	dw	1
	dd	?live16452@272-@@stk@cpu@cpu_has_fma$qv
	dd	?live16452@288-?live16452@272
	dw	1
?patch318	equ	3
?patch317	equ	34
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
	df	$mndnfcia
	dw	0
	dw	4108
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
	df	$ekdnfcia
	dw	0
	dw	117
	dw	0
	dw	559
	dw	0
	dw	0
	dw	0
?patch314	equ	@985-@@stk@cpu@cpu_has_fma$qv+73
?patch315	equ	0
?patch316	equ	@985-@@stk@cpu@cpu_has_fma$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ebenfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$meenfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_aes$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_aes$qv	proc	near
?live16453@0:
	?debug L 2079
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @986
	?debug L 2085
@987:
	mov       eax,dword ptr [$ebenfcia]
	cmp       eax,-1
	je        short @991
	?debug L 2086
?live16453@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @989
	?debug L 2088
?live16453@48: ; 
@990:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@991:
	cmp       dword ptr [$meenfcia+4],0
	jne       short @990
	cmp       dword ptr [$meenfcia],0
	jne       short @990
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$meenfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$meenfcia+4],ecx
	jmp       short @994
@993:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@994:
	cmp       dword ptr [$meenfcia+4],0
	jne       short @997
	cmp       dword ptr [$meenfcia],0
@997:
	je        short @995
	mov       eax,dword ptr [$meenfcia]
	mov       edx,dword ptr [$meenfcia+4]
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
	?debug L 2091
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
	?debug L 2093
	mov       eax,dword ptr [ebp-36]
	?debug L 2091
	add       esp,24
	?debug L 2093
	and       eax,33554432
	?debug L 2094
?live16453@128: ; EAX = @temp3
	test      eax,eax
	?debug L 2093
?live16453@144: ; 
	mov       dword ptr [$ebenfcia],eax
	?debug L 2094
?live16453@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 2095
?live16453@176: ; EAX = ret
	mov       dword ptr [$meenfcia],0
	mov       dword ptr [$meenfcia+4],0
	?debug L 2094
?live16453@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 2097
?live16453@208: ; 
@999:
@989:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@986:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_aes$qv+0
	dd        @986+0
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
	dd	?patch319
	dd	?patch320
	dd	?patch321
	df	@@stk@cpu@cpu_has_aes$qv
	dw	0
	dw	4237
	dw	0
	dw	560
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
	dw	561
	dw	0
	dw	0
	dw	0
	dw	?patch322
	dw	529
	dw	?patch323
	dd	?live16453@176-@@stk@cpu@cpu_has_aes$qv
	dd	?live16453@192-?live16453@176
	dw	1
?patch323	equ	1
?patch322	equ	14
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
	df	$meenfcia
	dw	0
	dw	4108
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
	df	$ebenfcia
	dw	0
	dw	117
	dw	0
	dw	568
	dw	0
	dw	0
	dw	0
?patch319	equ	@999-@@stk@cpu@cpu_has_aes$qv+71
?patch320	equ	0
?patch321	equ	@999-@@stk@cpu@cpu_has_aes$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eienfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mlenfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viaaes$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viaaes$qv	proc	near
?live16454@0:
	?debug L 2100
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @1000
	?debug L 2106
@1001:
	mov       eax,dword ptr [$eienfcia]
	cmp       eax,-1
	je        short @1005
	?debug L 2107
?live16454@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @1003
	?debug L 2109
?live16454@48: ; 
@1004:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1005:
	cmp       dword ptr [$mlenfcia+4],0
	jne       short @1004
	cmp       dword ptr [$mlenfcia],0
	jne       short @1004
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$mlenfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$mlenfcia+4],ecx
	jmp       short @1008
@1007:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1008:
	cmp       dword ptr [$mlenfcia+4],0
	jne       short @1011
	cmp       dword ptr [$mlenfcia],0
@1011:
	je        short @1009
	mov       eax,dword ptr [$mlenfcia]
	mov       edx,dword ptr [$mlenfcia+4]
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
	?debug L 2112
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
	?debug L 2114
	mov       eax,dword ptr [ebp-28]
	?debug L 2112
	add       esp,24
	?debug L 2114
	and       eax,128
	?debug L 2115
?live16454@128: ; EAX = @temp3
	test      eax,eax
	?debug L 2114
?live16454@144: ; 
	mov       dword ptr [$eienfcia],eax
	?debug L 2115
?live16454@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 2116
?live16454@176: ; EAX = ret
	mov       dword ptr [$mlenfcia],0
	mov       dword ptr [$mlenfcia+4],0
	?debug L 2115
?live16454@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 2118
?live16454@208: ; 
@1013:
@1003:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1000:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_viaaes$qv+0
	dd        @1000+0
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
	dd	?patch324
	dd	?patch325
	dd	?patch326
	df	@@stk@cpu@cpu_has_viaaes$qv
	dw	0
	dw	4239
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
	dw	570
	dw	0
	dw	0
	dw	0
	dw	?patch327
	dw	529
	dw	?patch328
	dd	?live16454@176-@@stk@cpu@cpu_has_viaaes$qv
	dd	?live16454@192-?live16454@176
	dw	1
?patch328	equ	1
?patch327	equ	14
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
	df	$mlenfcia
	dw	0
	dw	4108
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
	df	$eienfcia
	dw	0
	dw	117
	dw	0
	dw	577
	dw	0
	dw	0
	dw	0
?patch324	equ	@1013-@@stk@cpu@cpu_has_viaaes$qv+72
?patch325	equ	0
?patch326	equ	@1013-@@stk@cpu@cpu_has_viaaes$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epenfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mcfnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viarng$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viarng$qv	proc	near
?live16455@0:
	?debug L 2121
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @1014
	?debug L 2127
@1015:
	mov       eax,dword ptr [$epenfcia]
	cmp       eax,-1
	je        short @1019
	?debug L 2128
?live16455@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @1017
	?debug L 2130
?live16455@48: ; 
@1018:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1019:
	cmp       dword ptr [$mcfnfcia+4],0
	jne       short @1018
	cmp       dword ptr [$mcfnfcia],0
	jne       short @1018
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$mcfnfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$mcfnfcia+4],ecx
	jmp       short @1022
@1021:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1022:
	cmp       dword ptr [$mcfnfcia+4],0
	jne       short @1025
	cmp       dword ptr [$mcfnfcia],0
@1025:
	je        short @1023
	mov       eax,dword ptr [$mcfnfcia]
	mov       edx,dword ptr [$mcfnfcia+4]
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
	?debug L 2133
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
	?debug L 2135
	mov       eax,dword ptr [ebp-28]
	?debug L 2133
	add       esp,24
	?debug L 2135
	and       eax,8
	?debug L 2136
?live16455@128: ; EAX = @temp3
	test      eax,eax
	?debug L 2135
?live16455@144: ; 
	mov       dword ptr [$epenfcia],eax
	?debug L 2136
?live16455@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 2137
?live16455@176: ; EAX = ret
	mov       dword ptr [$mcfnfcia],0
	mov       dword ptr [$mcfnfcia+4],0
	?debug L 2136
?live16455@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 2139
?live16455@208: ; 
@1027:
@1017:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1014:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_viarng$qv+0
	dd        @1014+0
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
	dd	?patch329
	dd	?patch330
	dd	?patch331
	df	@@stk@cpu@cpu_has_viarng$qv
	dw	0
	dw	4241
	dw	0
	dw	578
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
	dw	579
	dw	0
	dw	0
	dw	0
	dw	?patch332
	dw	529
	dw	?patch333
	dd	?live16455@176-@@stk@cpu@cpu_has_viarng$qv
	dd	?live16455@192-?live16455@176
	dw	1
?patch333	equ	1
?patch332	equ	14
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
	df	$mcfnfcia
	dw	0
	dw	4108
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
	df	$epenfcia
	dw	0
	dw	117
	dw	0
	dw	586
	dw	0
	dw	0
	dw	0
?patch329	equ	@1027-@@stk@cpu@cpu_has_viarng$qv+74
?patch330	equ	0
?patch331	equ	@1027-@@stk@cpu@cpu_has_viarng$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$egfnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mjfnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viahash$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viahash$qv	proc	near
?live16456@0:
	?debug L 2142
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @1028
	?debug L 2148
@1029:
	mov       eax,dword ptr [$egfnfcia]
	cmp       eax,-1
	je        short @1033
	?debug L 2149
?live16456@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @1031
	?debug L 2151
?live16456@48: ; 
@1032:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1033:
	cmp       dword ptr [$mjfnfcia+4],0
	jne       short @1032
	cmp       dword ptr [$mjfnfcia],0
	jne       short @1032
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$mjfnfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$mjfnfcia+4],ecx
	jmp       short @1036
@1035:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1036:
	cmp       dword ptr [$mjfnfcia+4],0
	jne       short @1039
	cmp       dword ptr [$mjfnfcia],0
@1039:
	je        short @1037
	mov       eax,dword ptr [$mjfnfcia]
	mov       edx,dword ptr [$mjfnfcia+4]
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
	?debug L 2154
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
	?debug L 2156
	mov       eax,dword ptr [ebp-28]
	?debug L 2154
	add       esp,24
	?debug L 2156
	and       eax,2048
	?debug L 2157
?live16456@128: ; EAX = @temp3
	test      eax,eax
	?debug L 2156
?live16456@144: ; 
	mov       dword ptr [$egfnfcia],eax
	?debug L 2157
?live16456@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 2158
?live16456@176: ; EAX = ret
	mov       dword ptr [$mjfnfcia],0
	mov       dword ptr [$mjfnfcia+4],0
	?debug L 2157
?live16456@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 2160
?live16456@208: ; 
@1041:
@1031:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1028:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_viahash$qv+0
	dd        @1028+0
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
	dd	?patch334
	dd	?patch335
	dd	?patch336
	df	@@stk@cpu@cpu_has_viahash$qv
	dw	0
	dw	4243
	dw	0
	dw	587
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
	dw	588
	dw	0
	dw	0
	dw	0
	dw	?patch337
	dw	529
	dw	?patch338
	dd	?live16456@176-@@stk@cpu@cpu_has_viahash$qv
	dd	?live16456@192-?live16456@176
	dw	1
?patch338	equ	1
?patch337	equ	14
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
	df	$mjfnfcia
	dw	0
	dw	4108
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
	df	$egfnfcia
	dw	0
	dw	117
	dw	0
	dw	595
	dw	0
	dw	0
	dw	0
?patch334	equ	@1041-@@stk@cpu@cpu_has_viahash$qv+72
?patch335	equ	0
?patch336	equ	@1041-@@stk@cpu@cpu_has_viahash$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$enfnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$magnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_rdseed$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_rdseed$qv	proc	near
?live16457@0:
	?debug L 2163
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @1042
	?debug L 2169
@1043:
	mov       eax,dword ptr [$enfnfcia]
	cmp       eax,-1
	je        short @1047
	?debug L 2170
?live16457@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @1045
	?debug L 2172
?live16457@48: ; 
@1046:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1047:
	cmp       dword ptr [$magnfcia+4],0
	jne       short @1046
	cmp       dword ptr [$magnfcia],0
	jne       short @1046
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$magnfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$magnfcia+4],ecx
	jmp       short @1050
@1049:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1050:
	cmp       dword ptr [$magnfcia+4],0
	jne       short @1053
	cmp       dword ptr [$magnfcia],0
@1053:
	je        short @1051
	mov       eax,dword ptr [$magnfcia]
	mov       edx,dword ptr [$magnfcia+4]
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
	?debug L 2175
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
	?debug L 2177
	mov       eax,dword ptr [ebp-44]
	?debug L 2175
	add       esp,24
	?debug L 2177
	and       eax,262144
	?debug L 2178
?live16457@128: ; EAX = @temp3
	test      eax,eax
	?debug L 2177
?live16457@144: ; 
	mov       dword ptr [$enfnfcia],eax
	?debug L 2178
?live16457@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 2179
?live16457@176: ; EAX = ret
	mov       dword ptr [$magnfcia],0
	mov       dword ptr [$magnfcia+4],0
	?debug L 2178
?live16457@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 2181
?live16457@208: ; 
@1055:
@1045:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1042:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_rdseed$qv+0
	dd        @1042+0
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
	dd	?patch339
	dd	?patch340
	dd	?patch341
	df	@@stk@cpu@cpu_has_rdseed$qv
	dw	0
	dw	4245
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
	dw	597
	dw	0
	dw	0
	dw	0
	dw	?patch342
	dw	529
	dw	?patch343
	dd	?live16457@176-@@stk@cpu@cpu_has_rdseed$qv
	dd	?live16457@192-?live16457@176
	dw	1
?patch343	equ	1
?patch342	equ	14
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
	df	$magnfcia
	dw	0
	dw	4108
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
	df	$enfnfcia
	dw	0
	dw	117
	dw	0
	dw	604
	dw	0
	dw	0
	dw	0
?patch339	equ	@1055-@@stk@cpu@cpu_has_rdseed$qv+71
?patch340	equ	0
?patch341	equ	@1055-@@stk@cpu@cpu_has_rdseed$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eegnfcia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$mhgnfcia	label	qword
	db        0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_rdrand$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_rdrand$qv	proc	near
?live16458@0:
	?debug L 2184
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-48
	mov       dword ptr [ebp-8],offset @1056
	?debug L 2190
@1057:
	mov       eax,dword ptr [$eegnfcia]
	cmp       eax,-1
	je        short @1061
	?debug L 2191
?live16458@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @1059
	?debug L 2193
?live16458@48: ; 
@1060:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1061:
	cmp       dword ptr [$mhgnfcia+4],0
	jne       short @1060
	cmp       dword ptr [$mhgnfcia],0
	jne       short @1060
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-20],eax
	mov       dword ptr [ebp-16],edx
	mov       ecx,dword ptr [ebp-20]
	mov       dword ptr [$mhgnfcia],ecx
	mov       ecx,dword ptr [ebp-16]
	mov       dword ptr [$mhgnfcia+4],ecx
	jmp       short @1064
@1063:
	push      0
	push      0
	call      @@stk@time@wait_us$qxuj
@1064:
	cmp       dword ptr [$mhgnfcia+4],0
	jne       short @1067
	cmp       dword ptr [$mhgnfcia],0
@1067:
	je        short @1065
	mov       eax,dword ptr [$mhgnfcia]
	mov       edx,dword ptr [$mhgnfcia+4]
	cmp       edx,dword ptr [ebp-16]
	jne       short @1068
	cmp       eax,dword ptr [ebp-20]
@1068:
	setne     al
	and       eax,1
	jmp       short @1066
@1065:
	xor       eax,eax
@1066:
	test      al,al
	jne       short @1063
	?debug L 2196
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
	?debug L 2198
	mov       eax,dword ptr [ebp-36]
	?debug L 2196
	add       esp,24
	?debug L 2198
	and       eax,1073741824
	?debug L 2199
?live16458@128: ; EAX = @temp3
	test      eax,eax
	?debug L 2198
?live16458@144: ; 
	mov       dword ptr [$eegnfcia],eax
	?debug L 2199
?live16458@160: ; EAX = @temp3
	setne     dl
	and       edx,1
	?debug L 2200
?live16458@176: ; EAX = ret
	mov       dword ptr [$mhgnfcia],0
	mov       dword ptr [$mhgnfcia+4],0
	?debug L 2199
?live16458@192: ; EAX = @temp3
	mov       eax,edx
	?debug L 2202
?live16458@208: ; 
@1069:
@1059:
	mov       dword ptr [ebp-4],ebp
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1056:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_has_rdrand$qv+0
	dd        @1056+0
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
	dd	?patch344
	dd	?patch345
	dd	?patch346
	df	@@stk@cpu@cpu_has_rdrand$qv
	dw	0
	dw	4247
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
	dw	606
	dw	0
	dw	0
	dw	0
	dw	?patch347
	dw	529
	dw	?patch348
	dd	?live16458@176-@@stk@cpu@cpu_has_rdrand$qv
	dd	?live16458@192-?live16458@176
	dw	1
?patch348	equ	1
?patch347	equ	14
	dw	18
	dw	512
	dw	65484
	dw	65535
	dw	117
	dw	0
	dw	607
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65492
	dw	65535
	dw	117
	dw	0
	dw	608
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65500
	dw	65535
	dw	117
	dw	0
	dw	609
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65508
	dw	65535
	dw	117
	dw	0
	dw	610
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mhgnfcia
	dw	0
	dw	4108
	dw	0
	dw	611
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	118
	dw	0
	dw	612
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eegnfcia
	dw	0
	dw	117
	dw	0
	dw	613
	dw	0
	dw	0
	dw	0
?patch344	equ	@1069-@@stk@cpu@cpu_has_rdrand$qv+71
?patch345	equ	0
?patch346	equ	@1069-@@stk@cpu@cpu_has_rdrand$qv
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
?live16459@0:
	?debug L 2211
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @1070
	?debug L 2217
@1071:
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	push      offset s@+39
	call      @@stk@con@prints$qpxce
	add       esp,8
	?debug L 2218
	call      @@stk@cpu@cpu_name$qv
	push      eax
	push      offset s@+52
	call      @@stk@con@prints$qpxce
	add       esp,8
	?debug L 2219
	push      1
	call      @@stk@cpu@cpu_num_mhz$qo
	pop       ecx
	push      eax
	push      offset s@+73
	call      @@stk@con@prints$qpxce
	add       esp,8
	?debug L 2220
	push      0
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1072
	push      offset s@+125
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1073
@1072:
	push      offset s@+125
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2221
@1073:
	push      0
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1074
	push      offset s@+164
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1075
@1074:
	push      offset s@+164
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2222
@1075:
	push      offset s@+197
	call      @@stk@con@prints$qpxce
	pop       ecx
	?debug L 2223
	push      1
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1076
	push      offset s@+239
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1077
@1076:
	push      offset s@+239
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2224
@1077:
	push      1
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1078
	push      offset s@+267
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1079
@1078:
	push      offset s@+267
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2225
@1079:
	push      2
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1080
	push      offset s@+300
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1081
@1080:
	push      offset s@+300
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2226
@1081:
	push      2
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1082
	push      offset s@+328
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1083
@1082:
	push      offset s@+328
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2227
@1083:
	push      3
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1084
	push      offset s@+361
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1085
@1084:
	push      offset s@+361
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2228
@1085:
	push      3
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1086
	push      offset s@+389
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1087
@1086:
	push      offset s@+389
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2229
@1087:
	call      @@stk@cpu@cpu_num_cores$qv
	test      eax,eax
	je        short @1088
	push      offset s@+422
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1089
@1088:
	push      offset s@+422
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2230
@1089:
	call      @@stk@cpu@cpu_num_threads$qv
	test      eax,eax
	je        short @1090
	push      offset s@+448
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1091
@1090:
	push      offset s@+448
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2232
@1091:
	call      @@stk@cpu@cpu_has_amd64$qv
	and       eax,255
	test      eax,eax
	je        short @1092
	push      offset s@+476
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1093
@1092:
	push      offset s@+476
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2233
@1093:
	call      @@stk@cpu@cpu_has_ht$qv
	and       eax,255
	test      eax,eax
	je        short @1094
	push      offset s@+502
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1095
@1094:
	push      offset s@+502
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2234
@1095:
	call      @@stk@cpu@cpu_has_mmx$qv
	and       eax,255
	test      eax,eax
	je        short @1096
	push      offset s@+525
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1097
@1096:
	push      offset s@+525
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2235
@1097:
	call      @@stk@cpu@cpu_has_mmxext$qv
	and       eax,255
	test      eax,eax
	je        short @1098
	push      offset s@+549
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1099
@1098:
	push      offset s@+549
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2236
@1099:
	call      @@stk@cpu@cpu_has_3dnow$qv
	test      eax,eax
	je        short @1100
	push      offset s@+576
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1101
@1100:
	push      offset s@+576
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2237
@1101:
	call      @@stk@cpu@cpu_has_3dnowprefetch$qv
	and       eax,255
	test      eax,eax
	je        short @1102
	push      offset s@+602
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1103
@1102:
	push      offset s@+602
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2238
@1103:
	call      @@stk@cpu@cpu_has_fxsr$qv
	and       eax,255
	test      eax,eax
	je        short @1104
	push      offset s@+636
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1105
@1104:
	push      offset s@+636
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2239
@1105:
	call      @@stk@cpu@cpu_has_sse$qv
	test      eax,eax
	je        short @1106
	push      offset s@+661
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1107
@1106:
	push      offset s@+661
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2240
@1107:
	call      @@stk@cpu@cpu_has_xsave$qv
	and       eax,255
	test      eax,eax
	je        short @1108
	push      offset s@+685
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1109
@1108:
	push      offset s@+685
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2241
@1109:
	call      @@stk@cpu@cpu_has_pclmulqdq$qv
	and       eax,255
	test      eax,eax
	je        short @1110
	push      offset s@+711
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1111
@1110:
	push      offset s@+711
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2242
@1111:
	call      @@stk@cpu@cpu_has_movbe$qv
	and       eax,255
	test      eax,eax
	je        short @1112
	push      offset s@+741
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1113
@1112:
	push      offset s@+741
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2243
@1113:
	call      @@stk@cpu@cpu_has_fma$qv
	test      eax,eax
	je        short @1114
	push      offset s@+767
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1115
@1114:
	push      offset s@+767
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2244
@1115:
	call      @@stk@cpu@cpu_has_popcnt$qv
	and       eax,255
	test      eax,eax
	je        short @1116
	push      offset s@+791
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1117
@1116:
	push      offset s@+791
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2245
@1117:
	call      @@stk@cpu@cpu_has_xop$qv
	and       eax,255
	test      eax,eax
	je        short @1118
	push      offset s@+818
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1119
@1118:
	push      offset s@+818
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2246
@1119:
	call      @@stk@cpu@cpu_has_lzcnt$qv
	and       eax,255
	test      eax,eax
	je        short @1120
	push      offset s@+842
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1121
@1120:
	push      offset s@+842
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2247
@1121:
	call      @@stk@cpu@cpu_has_f16c$qv
	and       eax,255
	test      eax,eax
	je        short @1122
	push      offset s@+868
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1123
@1122:
	push      offset s@+868
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2248
@1123:
	call      @@stk@cpu@cpu_has_avx$qv
	test      eax,eax
	je        short @1124
	push      offset s@+893
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1125
@1124:
	push      offset s@+893
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2249
@1125:
	call      @@stk@cpu@cpu_has_avx512f$qv
	and       eax,255
	test      eax,eax
	je        short @1126
	push      offset s@+917
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1127
@1126:
	push      offset s@+917
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2250
@1127:
	call      @@stk@cpu@cpu_has_avx512bw$qv
	and       eax,255
	test      eax,eax
	je        short @1128
	push      offset s@+945
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1129
@1128:
	push      offset s@+945
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2251
@1129:
	call      @@stk@cpu@cpu_has_avx512cd$qv
	and       eax,255
	test      eax,eax
	je        short @1130
	push      offset s@+974
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1131
@1130:
	push      offset s@+974
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2252
@1131:
	call      @@stk@cpu@cpu_has_avx512dq$qv
	and       eax,255
	test      eax,eax
	je        short @1132
	push      offset s@+1003
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1133
@1132:
	push      offset s@+1003
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2253
@1133:
	call      @@stk@cpu@cpu_has_avx512er$qv
	and       eax,255
	test      eax,eax
	je        short @1134
	push      offset s@+1032
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1135
@1134:
	push      offset s@+1032
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2254
@1135:
	call      @@stk@cpu@cpu_has_avx512pf$qv
	and       eax,255
	test      eax,eax
	je        short @1136
	push      offset s@+1061
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1137
@1136:
	push      offset s@+1061
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2255
@1137:
	call      @@stk@cpu@cpu_has_avx512vl$qv
	and       eax,255
	test      eax,eax
	je        short @1138
	push      offset s@+1090
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1139
@1138:
	push      offset s@+1090
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2256
@1139:
	call      @@stk@cpu@cpu_has_avx512ifma$qv
	and       eax,255
	test      eax,eax
	je        short @1140
	push      offset s@+1119
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1141
@1140:
	push      offset s@+1119
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2257
@1141:
	call      @@stk@cpu@cpu_has_bmi$qv
	test      eax,eax
	je        short @1142
	push      offset s@+1150
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1143
@1142:
	push      offset s@+1150
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2258
@1143:
	call      @@stk@cpu@cpu_has_avx512vbmi$qv
	and       eax,255
	test      eax,eax
	je        short @1144
	push      offset s@+1174
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1145
@1144:
	push      offset s@+1174
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2259
@1145:
	call      @@stk@cpu@cpu_has_cmov$qv
	and       eax,255
	test      eax,eax
	je        short @1146
	push      offset s@+1205
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1147
@1146:
	push      offset s@+1205
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2260
@1147:
	call      @@stk@cpu@cpu_has_cmpxchg$qv
	test      eax,eax
	je        short @1148
	push      offset s@+1230
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1149
@1148:
	push      offset s@+1230
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2261
@1149:
	call      @@stk@cpu@cpu_has_clmul$qv
	and       eax,255
	test      eax,eax
	je        short @1150
	push      offset s@+1258
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1151
@1150:
	push      offset s@+1258
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2262
@1151:
	call      @@stk@cpu@cpu_has_aes$qv
	and       eax,255
	test      eax,eax
	je        short @1152
	push      offset s@+1284
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1153
@1152:
	push      offset s@+1284
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2263
@1153:
	call      @@stk@cpu@cpu_has_sha$qv
	and       eax,255
	test      eax,eax
	je        short @1154
	push      offset s@+1308
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1155
@1154:
	push      offset s@+1308
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2264
@1155:
	call      @@stk@cpu@cpu_has_rdrand$qv
	and       eax,255
	test      eax,eax
	je        short @1156
	push      offset s@+1332
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1157
@1156:
	push      offset s@+1332
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2265
@1157:
	call      @@stk@cpu@cpu_has_rdseed$qv
	and       eax,255
	test      eax,eax
	je        short @1158
	push      offset s@+1359
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1159
@1158:
	push      offset s@+1359
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2266
@1159:
	call      @@stk@cpu@cpu_has_tsc$qv
	and       eax,255
	test      eax,eax
	je        short @1160
	push      offset s@+1386
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1161
@1160:
	push      offset s@+1386
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2267
@1161:
	call      @@stk@cpu@cpu_has_perftsc$qv
	and       eax,255
	test      eax,eax
	je        short @1162
	push      offset s@+1410
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1163
@1162:
	push      offset s@+1410
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2268
@1163:
	call      @@stk@cpu@cpu_has_erms$qv
	and       eax,255
	test      eax,eax
	je        short @1164
	push      offset s@+1438
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1165
@1164:
	push      offset s@+1438
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2269
@1165:
	call      @@stk@cpu@cpu_has_msr$qv
	and       eax,255
	test      eax,eax
	je        short @1166
	push      offset s@+1463
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1167
@1166:
	push      offset s@+1463
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2270
@1167:
	call      @@stk@cpu@cpu_has_mtrr$qv
	and       eax,255
	test      eax,eax
	je        short @1168
	push      offset s@+1487
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1169
@1168:
	push      offset s@+1487
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2271
@1169:
	call      @@stk@cpu@cpu_has_vmx$qv
	and       eax,255
	test      eax,eax
	je        short @1170
	push      offset s@+1512
	push      offset s@+123
	push      eax
	push      offset s@+98
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1171
@1170:
	push      offset s@+1512
	push      offset s@+123
	push      offset s@+153
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 2273
@1171:
@1172:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@1070:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_print_info$qv+0
	dd        @1070+0
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
	dd	?patch349
	dd	?patch350
	dd	?patch351
	df	@@stk@cpu@cpu_print_info$qv
	dw	0
	dw	4249
	dw	0
	dw	614
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
	dw	615
	dw	0
	dw	0
	dw	0
?patch349	equ	@1172-@@stk@cpu@cpu_print_info$qv+31
?patch350	equ	0
?patch351	equ	@1172-@@stk@cpu@cpu_print_info$qv
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
?live16460@0:
	?debug L 2276
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @1173
	?debug L 2281
@1174:
	call      @@stk@cpu@cpu_print_info$qv
	?debug L 2282
@1175:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@1173:
	db        67,71,83,0
	dd        @@stk@cpu@cpu_test$qv+0
	dd        @1173+0
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
	dd	?patch352
	dd	?patch353
	dd	?patch354
	df	@@stk@cpu@cpu_test$qv
	dw	0
	dw	4251
	dw	0
	dw	616
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
?patch352	equ	@1175-@@stk@cpu@cpu_test$qv+31
?patch353	equ	0
?patch354	equ	@1175-@@stk@cpu@cpu_test$qv
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
	mov       dword ptr [ebp-8],offset @1176
@1177:
	call      @@stk@cpu@tsc_init$qv
	mov       dword ptr [_tsc_ADJ],eax
	mov       dword ptr [_tsc_ADJ+4],edx
	?debug L 0
@1178:
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@1176:
	db        67,71,83,0
	dd        @_STCON0_$qv+0
	dd        @1176+0
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
	dd	?patch355
	dd	?patch356
	dd	?patch357
	df	@_STCON0_$qv
	dw	0
	dw	4253
	dw	0
	dw	617
	dw	0
	dw	0
	dw	0
?patch355	equ	@1178-@_STCON0_$qv+31
?patch356	equ	0
?patch357	equ	@1178-@_STCON0_$qv
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
	dd	$mphlfcia
	dd	8
	dd	4
	dd	$edilfcia
	dd	8
	dd	4
	dd	$mgilfcia
	dd	8
	dd	4
	dd	$ekilfcia
	dd	8
	dd	4
	dd	$mnilfcia
	dd	8
	dd	4
	dd	$ebjlfcia
	dd	8
	dd	4
	dd	$mejlfcia
	dd	8
	dd	4
	dd	$mojlfcia
	dd	4
	dd	4
	dd	$ecklfcia
	dd	4
	dd	4
	dd	$mfklfcia
	dd	4
	dd	4
	dd	$ejklfcia
	dd	4
	dd	4
	dd	$mmklfcia
	dd	4
	dd	4
	dd	$eallfcia
	dd	4
	dd	4
	dd	$mdllfcia
	dd	8
	dd	4
	dd	$ehllfcia
	dd	16
	dd	4
	dd	$mkllfcia
	dd	8
	dd	4
	dd	$memlfcia
	dd	52
	dd	4
	dd	$eimlfcia
	dd	8
	dd	4
	dd	$ecnlfcia
	dd	4
	dd	4
	dd	$mfnlfcia
	dd	8
	dd	4
	dd	$ejnlfcia
	dd	4
	dd	4
	dd	$mmnlfcia
	dd	8
	dd	4
	dd	$eaolfcia
	dd	4
	dd	4
	dd	$mdolfcia
	dd	8
	dd	4
	dd	$eholfcia
	dd	4
	dd	4
	dd	$mkolfcia
	dd	8
	dd	4
	dd	$eoolfcia
	dd	4
	dd	4
	dd	$mbplfcia
	dd	8
	dd	4
	dd	$mlplfcia
	dd	4
	dd	4
	dd	$epplfcia
	dd	8
	dd	4
	dd	$mcamfcia
	dd	4
	dd	4
	dd	$egamfcia
	dd	8
	dd	4
	dd	$mjamfcia
	dd	4
	dd	4
	dd	$enamfcia
	dd	8
	dd	4
	dd	$mabmfcia
	dd	4
	dd	4
	dd	$eebmfcia
	dd	8
	dd	4
	dd	$mhbmfcia
	dd	4
	dd	4
	dd	$elbmfcia
	dd	8
	dd	4
	dd	$mobmfcia
	dd	4
	dd	4
	dd	$eccmfcia
	dd	8
	dd	4
	dd	$mfcmfcia
	dd	4
	dd	4
	dd	$ejcmfcia
	dd	8
	dd	4
	dd	$mmcmfcia
	dd	4
	dd	4
	dd	$eadmfcia
	dd	8
	dd	4
	dd	$mddmfcia
	dd	4
	dd	4
	dd	$ehdmfcia
	dd	8
	dd	4
	dd	$mkdmfcia
	dd	4
	dd	4
	dd	$eodmfcia
	dd	8
	dd	4
	dd	$mbemfcia
	dd	4
	dd	4
	dd	$efemfcia
	dd	8
	dd	4
	dd	$miemfcia
	dd	4
	dd	4
	dd	$ememfcia
	dd	8
	dd	4
	dd	$mpemfcia
	dd	4
	dd	4
	dd	$edfmfcia
	dd	8
	dd	4
	dd	$mgfmfcia
	dd	4
	dd	4
	dd	$ekfmfcia
	dd	8
	dd	4
	dd	$mnfmfcia
	dd	4
	dd	4
	dd	$ebgmfcia
	dd	8
	dd	4
	dd	$megmfcia
	dd	4
	dd	4
	dd	$eigmfcia
	dd	8
	dd	4
	dd	$mlgmfcia
	dd	4
	dd	4
	dd	$epgmfcia
	dd	8
	dd	4
	dd	$mchmfcia
	dd	4
	dd	4
	dd	$eghmfcia
	dd	8
	dd	4
	dd	$mjhmfcia
	dd	4
	dd	4
	dd	$enhmfcia
	dd	8
	dd	4
	dd	$maimfcia
	dd	4
	dd	4
	dd	$eeimfcia
	dd	8
	dd	4
	dd	$mhimfcia
	dd	4
	dd	4
	dd	$elimfcia
	dd	8
	dd	4
	dd	$moimfcia
	dd	4
	dd	4
	dd	$ecjmfcia
	dd	8
	dd	4
	dd	$mfjmfcia
	dd	4
	dd	4
	dd	$ejjmfcia
	dd	8
	dd	4
	dd	$mmjmfcia
	dd	4
	dd	4
	dd	$eakmfcia
	dd	8
	dd	4
	dd	$mdkmfcia
	dd	4
	dd	4
	dd	$ehkmfcia
	dd	8
	dd	4
	dd	$mkkmfcia
	dd	4
	dd	4
	dd	$eokmfcia
	dd	8
	dd	4
	dd	$mblmfcia
	dd	4
	dd	4
	dd	$eflmfcia
	dd	8
	dd	4
	dd	$milmfcia
	dd	4
	dd	4
	dd	$emlmfcia
	dd	8
	dd	4
	dd	$mplmfcia
	dd	4
	dd	4
	dd	$edmmfcia
	dd	8
	dd	4
	dd	$mgmmfcia
	dd	4
	dd	4
	dd	$ekmmfcia
	dd	8
	dd	4
	dd	$mnmmfcia
	dd	4
	dd	4
	dd	$ebnmfcia
	dd	8
	dd	4
	dd	$menmfcia
	dd	4
	dd	4
	dd	$einmfcia
	dd	8
	dd	4
	dd	$mlnmfcia
	dd	4
	dd	4
	dd	$epnmfcia
	dd	8
	dd	4
	dd	$mcomfcia
	dd	4
	dd	4
	dd	$egomfcia
	dd	8
	dd	4
	dd	$mjomfcia
	dd	4
	dd	4
	dd	$enomfcia
	dd	8
	dd	4
	dd	$mapmfcia
	dd	4
	dd	4
	dd	$eepmfcia
	dd	8
	dd	4
	dd	$mhpmfcia
	dd	4
	dd	4
	dd	$elpmfcia
	dd	8
	dd	4
	dd	$mopmfcia
	dd	4
	dd	4
	dd	$ecanfcia
	dd	8
	dd	4
	dd	$mfanfcia
	dd	4
	dd	4
	dd	$ejanfcia
	dd	8
	dd	4
	dd	$mmanfcia
	dd	4
	dd	4
	dd	$eabnfcia
	dd	8
	dd	4
	dd	$mdbnfcia
	dd	4
	dd	4
	dd	$ehbnfcia
	dd	8
	dd	4
	dd	$mkbnfcia
	dd	4
	dd	4
	dd	$eobnfcia
	dd	8
	dd	4
	dd	$mbcnfcia
	dd	4
	dd	4
	dd	$efcnfcia
	dd	8
	dd	4
	dd	$micnfcia
	dd	4
	dd	4
	dd	$emcnfcia
	dd	8
	dd	4
	dd	$mpcnfcia
	dd	4
	dd	4
	dd	$eddnfcia
	dd	12
	dd	4
	dd	$mgdnfcia
	dd	8
	dd	4
	dd	$ekdnfcia
	dd	4
	dd	4
	dd	$mndnfcia
	dd	8
	dd	4
	dd	$ebenfcia
	dd	4
	dd	4
	dd	$meenfcia
	dd	8
	dd	4
	dd	$eienfcia
	dd	4
	dd	4
	dd	$mlenfcia
	dd	8
	dd	4
	dd	$epenfcia
	dd	4
	dd	4
	dd	$mcfnfcia
	dd	8
	dd	4
	dd	$egfnfcia
	dd	4
	dd	4
	dd	$mjfnfcia
	dd	8
	dd	4
	dd	$enfnfcia
	dd	4
	dd	4
	dd	$magnfcia
	dd	8
	dd	4
	dd	$eegnfcia
	dd	4
	dd	4
	dd	$mhgnfcia
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
@@stk@mem@alloc$qxui equ @stk@mem@alloc$qxui
 extrn   @stk@mem@alloc$qxui:near
@@stk@mem@free$qpv equ @stk@mem@free$qpv
 extrn   @stk@mem@free$qpv:near
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
	dw	?patch358
	dw	37
	dw	618
	dw	0
	dw	0
	dw	0
	dw	0
?patch358	equ	12
	dw	16
	dw	4
	dw	117
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
	dw	113
	dw	0
	dw	0
	dw	621
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	113
	dw	0
	dw	0
	dw	622
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	623
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	624
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	625
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	626
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1136
	dw	0
	dw	0
	dw	627
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
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
	dw	32
	dw	0
	dw	0
	dw	630
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	631
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	64
	dw	0
	dw	0
	dw	632
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	633
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	4266
	dw	0
	dw	0
	dw	634
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
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
	dw	34
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
	dw	116
	dw	0
	dw	0
	dw	640
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	641
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1141
	dw	0
	dw	0
	dw	642
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	643
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1141
	dw	0
	dw	0
	dw	644
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	645
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1141
	dw	0
	dw	0
	dw	646
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	647
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	648
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1141
	dw	0
	dw	0
	dw	649
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	650
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	651
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	652
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	17
	dw	0
	dw	0
	dw	653
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	654
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
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
	dw	34
	dw	0
	dw	0
	dw	657
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	118
	dw	0
	dw	0
	dw	658
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	118
	dw	0
	dw	0
	dw	659
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
	dw	0
	dw	0
	dw	660
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
	dw	0
	dw	0
	dw	661
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
	dw	0
	dw	0
	dw	662
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	663
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	664
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	112
	dw	0
	dw	0
	dw	665
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	17
	dw	0
	dw	0
	dw	666
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
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
	dw	1136
	dw	0
	dw	0
	dw	669
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1136
	dw	0
	dw	0
	dw	670
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1136
	dw	0
	dw	0
	dw	671
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	4276
	dw	0
	dw	0
	dw	672
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	4276
	dw	0
	dw	0
	dw	673
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1136
	dw	0
	dw	0
	dw	674
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1136
	dw	0
	dw	0
	dw	675
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1136
	dw	0
	dw	0
	dw	676
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	4276
	dw	0
	dw	0
	dw	677
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	4276
	dw	0
	dw	0
	dw	678
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	113
	dw	0
	dw	0
	dw	679
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	113
	dw	0
	dw	0
	dw	680
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
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
	dw	33
	dw	0
	dw	0
	dw	683
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	684
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	685
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	112
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
	dw	118
	dw	0
	dw	0
	dw	689
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
	dw	0
	dw	0
	dw	690
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	118
	dw	0
	dw	0
	dw	691
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
	dw	0
	dw	0
	dw	692
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
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
	dw	1027
	dw	0
	dw	0
	dw	697
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
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
	dw	32
	dw	0
	dw	0
	dw	700
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	701
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	702
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	703
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	704
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
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
	dw	33
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
	dw	1027
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
	dw	1027
	dw	0
	dw	0
	dw	733
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	734
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	735
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
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
	dw	1027
	dw	0
	dw	0
	dw	738
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
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
	dw	34
	dw	0
	dw	0
	dw	741
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	742
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	743
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	744
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	745
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	113
	dw	0
	dw	0
	dw	746
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	747
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	748
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	3
	dw	0
	dw	0
	dw	749
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	3
	dw	0
	dw	0
	dw	750
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	3
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
	dw	34
	dw	0
	dw	0
	dw	756
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	757
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	758
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
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
	dw	34
	dw	0
	dw	0
	dw	761
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	762
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	763
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	764
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	765
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1027
	dw	0
	dw	0
	dw	766
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	1141
	dw	0
	dw	0
	dw	767
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	768
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	33
	dw	0
	dw	0
	dw	769
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	770
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	771
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	772
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	34
	dw	0
	dw	0
	dw	773
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	774
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	775
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	112
	dw	0
	dw	0
	dw	776
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	16
	dw	0
	dw	0
	dw	777
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
	dw	0
	dw	0
	dw	778
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	112
	dw	0
	dw	0
	dw	779
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	780
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	112
	dw	0
	dw	0
	dw	781
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	32
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
	dw	33
	dw	0
	dw	0
	dw	784
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	785
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	117
	dw	0
	dw	0
	dw	786
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	118
	dw	0
	dw	0
	dw	787
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
	dw	0
	dw	0
	dw	788
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	118
	dw	0
	dw	0
	dw	789
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	119
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
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	792
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	17
	dw	0
	dw	0
	dw	793
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	17
	dw	0
	dw	0
	dw	794
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	17
	dw	0
	dw	0
	dw	795
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	17
	dw	0
	dw	0
	dw	796
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	797
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	116
	dw	0
	dw	0
	dw	798
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	799
	dw	0
	dw	0
	dw	0
	dw	?patch359
	dw	37
	dw	800
	dw	0
	dw	0
	dw	0
	dw	0
?patch359	equ	12
	dw	?patch360
	dw	37
	dw	801
	dw	0
	dw	0
	dw	0
	dw	0
?patch360	equ	12
	dw	?patch361
	dw	37
	dw	802
	dw	0
	dw	0
	dw	0
	dw	0
?patch361	equ	12
	dw	?patch362
	dw	37
	dw	803
	dw	0
	dw	0
	dw	0
	dw	0
?patch362	equ	12
	dw	?patch363
	dw	37
	dw	804
	dw	0
	dw	0
	dw	0
	dw	0
?patch363	equ	12
	dw	?patch364
	dw	37
	dw	805
	dw	0
	dw	0
	dw	0
	dw	0
?patch364	equ	12
	dw	?patch365
	dw	37
	dw	806
	dw	0
	dw	0
	dw	0
	dw	0
?patch365	equ	12
	dw	22
	dw	513
	df	_tsc_STARTED
	dw	0
	dw	119
	dw	0
	dw	807
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_PAUSED
	dw	0
	dw	119
	dw	0
	dw	808
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_LAST_MEASURED
	dw	0
	dw	119
	dw	0
	dw	809
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_ADJ
	dw	0
	dw	119
	dw	0
	dw	810
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_ELAPSED
	dw	0
	dw	119
	dw	0
	dw	811
	dw	0
	dw	0
	dw	0
	dw	?patch366
	dw	38
	dw	514
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
	dw	1318
	dw	0
	dw	1319
	dw	0
	dw	1320
	dw	0
	dw	1321
	dw	0
	dw	1322
	dw	0
	dw	1323
	dw	0
	dw	1324
	dw	0
	dw	1325
	dw	0
?patch366	equ	2060
	dw	?patch367
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
?patch367	equ	18
$$BSYMS	ends
$$BTYPES	segment byte public use32 'DEBTYP'
	db        2,0,0,0,14,0,8,0,3,4,0,0,0,0,1,0
	db        1,16,0,0,8,0,1,2,1,0,117,0,0,0,14,0
	db        8,0,3,4,0,0,0,0,1,0,3,16,0,0,8,0
	db        1,2,1,0,117,0,0,0,14,0,8,0,3,0,0,0
	db        0,0,1,0,5,16,0,0,8,0,1,2,1,0,3,4
	db        0,0,14,0,8,0,3,0,0,0,0,0,1,0,7,16
	db        0,0,8,0,1,2,1,0,3,4,0,0,14,0,8,0
	db        119,0,0,0,0,0,0,0,9,16,0,0,4,0,1,2
	db        0,0,14,0,8,0,119,0,0,0,0,0,0,0,11,16
	db        0,0,4,0,1,2,0,0,8,0,1,0,2,0,118,0
	db        0,0,14,0,8,0,119,0,0,0,0,0,0,0,14,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,119,0,0,0
	db        0,0,0,0,16,16,0,0,4,0,1,2,0,0,14,0
	db        8,0,119,0,0,0,0,0,0,0,18,16,0,0,4,0
	db        1,2,0,0,14,0,8,0,119,0,0,0,0,0,0,0
	db        20,16,0,0,4,0,1,2,0,0,14,0,8,0,119,0
	db        0,0,0,0,0,0,22,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,119,0,0,0,0,0,0,0,24,16,0,0
	db        4,0,1,2,0,0,14,0,8,0,119,0,0,0,0,0
	db        0,0,26,16,0,0,4,0,1,2,0,0,14,0,8,0
	db        117,0,0,0,0,0,6,0,28,16,0,0,28,0,1,2
	db        6,0,117,4,0,0,117,4,0,0,117,4,0,0,117,4
	db        0,0,117,0,0,0,117,0,0,0,14,0,8,0,117,0
	db        0,0,0,0,6,0,30,16,0,0,28,0,1,2,6,0
	db        117,4,0,0,117,4,0,0,117,4,0,0,117,4,0,0
	db        117,0,0,0,117,0,0,0,14,0,8,0,112,4,0,0
	db        0,0,0,0,32,16,0,0,4,0,1,2,0,0,18,0
	db        3,0,117,0,0,0,17,0,0,0,0,0,0,0,16,0
	db        4,0,14,0,8,0,112,4,0,0,0,0,0,0,35,16
	db        0,0,4,0,1,2,0,0,18,0,3,0,117,0,0,0
	db        17,0,0,0,0,0,0,0,52,0,13,0,14,0,8,0
	db        117,0,0,0,0,0,0,0,38,16,0,0,4,0,1,2
	db        0,0,14,0,8,0,117,0,0,0,0,0,0,0,40,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,117,0,0,0
	db        0,0,1,0,42,16,0,0,8,0,1,2,1,0,32,0
	db        0,0,14,0,8,0,117,0,0,0,0,0,1,0,44,16
	db        0,0,8,0,1,2,1,0,32,0,0,0,14,0,8,0
	db        117,0,0,0,0,0,1,0,46,16,0,0,8,0,1,2
	db        1,0,48,0,0,0,18,0,3,0,119,0,0,0,17,0
	db        0,0,0,0,0,0,40,0,5,0,14,0,8,0,48,0
	db        0,0,0,0,0,0,49,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,48,0,0,0,0,0,0,0,51,16,0,0
	db        4,0,1,2,0,0,14,0,8,0,48,0,0,0,0,0
	db        0,0,53,16,0,0,4,0,1,2,0,0,14,0,8,0
	db        48,0,0,0,0,0,0,0,55,16,0,0,4,0,1,2
	db        0,0,14,0,8,0,48,0,0,0,0,0,0,0,57,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,117,0,0,0
	db        0,0,0,0,59,16,0,0,4,0,1,2,0,0,14,0
	db        8,0,48,0,0,0,0,0,0,0,61,16,0,0,4,0
	db        1,2,0,0,14,0,8,0,117,0,0,0,0,0,0,0
	db        63,16,0,0,4,0,1,2,0,0,14,0,8,0,48,0
	db        0,0,0,0,0,0,65,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,48,0,0,0,0,0,0,0,67,16,0,0
	db        4,0,1,2,0,0,14,0,8,0,117,0,0,0,0,0
	db        0,0,69,16,0,0,4,0,1,2,0,0,14,0,8,0
	db        48,0,0,0,0,0,0,0,71,16,0,0,4,0,1,2
	db        0,0,14,0,8,0,48,0,0,0,0,0,0,0,73,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,48,0,0,0
	db        0,0,0,0,75,16,0,0,4,0,1,2,0,0,14,0
	db        8,0,48,0,0,0,0,0,0,0,77,16,0,0,4,0
	db        1,2,0,0,14,0,8,0,117,0,0,0,0,0,0,0
	db        79,16,0,0,4,0,1,2,0,0,14,0,8,0,48,0
	db        0,0,0,0,0,0,81,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,117,0,0,0,0,0,0,0,83,16,0,0
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
	db        127,16,0,0,4,0,1,2,0,0,14,0,8,0,48,0
	db        0,0,0,0,0,0,129,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,48,0,0,0,0,0,0,0,131,16,0,0
	db        4,0,1,2,0,0,14,0,8,0,48,0,0,0,0,0
	db        0,0,133,16,0,0,4,0,1,2,0,0,14,0,8,0
	db        48,0,0,0,0,0,0,0,135,16,0,0,4,0,1,2
	db        0,0,14,0,8,0,117,4,0,0,0,0,0,0,137,16
	db        0,0,4,0,1,2,0,0,18,0,3,0,117,0,0,0
	db        17,0,0,0,0,0,0,0,12,0,3,0,14,0,8,0
	db        117,0,0,0,0,0,0,0,140,16,0,0,4,0,1,2
	db        0,0,14,0,8,0,48,0,0,0,0,0,0,0,142,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,48,0,0,0
	db        0,0,0,0,144,16,0,0,4,0,1,2,0,0,14,0
	db        8,0,48,0,0,0,0,0,0,0,146,16,0,0,4,0
	db        1,2,0,0,14,0,8,0,48,0,0,0,0,0,0,0
	db        148,16,0,0,4,0,1,2,0,0,14,0,8,0,48,0
	db        0,0,0,0,0,0,150,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,48,0,0,0,0,0,0,0,152,16,0,0
	db        4,0,1,2,0,0,14,0,8,0,3,0,0,0,0,0
	db        0,0,154,16,0,0,4,0,1,2,0,0,14,0,8,0
	db        3,0,0,0,0,0,0,0,156,16,0,0,4,0,1,2
	db        0,0,14,0,8,0,3,0,0,0,7,0,0,0,158,16
	db        0,0,4,0,1,2,0,0,14,0,8,0,3,4,0,0
	db        7,0,1,0,161,16,0,0,8,0,1,0,1,0,117,0
	db        0,0,8,0,1,2,1,0,160,16,0,0,14,0,8,0
	db        3,0,0,0,7,0,1,0,163,16,0,0,8,0,1,2
	db        1,0,3,4,0,0,14,0,8,0,3,0,0,0,7,0
	db        1,0,166,16,0,0,8,0,1,0,1,0,119,0,0,0
	db        8,0,1,2,1,0,165,16,0,0,14,0,8,0,116,0
	db        0,0,2,0,0,0,168,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,3,4,0,0,7,0,3,0,172,16,0,0
	db        8,0,2,0,10,0,171,16,0,0,8,0,1,0,1,0
	db        3,0,0,0,16,0,1,2,3,0,3,4,0,0,170,16
	db        0,0,160,16,0,0,14,0,8,0,112,4,0,0,7,0
	db        2,0,174,16,0,0,12,0,1,2,2,0,112,4,0,0
	db        112,0,0,0,14,0,8,0,118,0,0,0,7,0,3,0
	db        176,16,0,0,16,0,1,2,3,0,170,16,0,0,170,16
	db        0,0,160,16,0,0,14,0,8,0,119,0,0,0,7,0
	db        0,0,178,16,0,0,4,0,1,2,0,0,14,0,8,0
	db        3,0,0,0,64,0,2,0,182,16,0,0,8,0,2,0
	db        10,0,181,16,0,0,8,0,1,0,1,0,112,0,0,0
	db        12,0,1,2,2,0,180,16,0,0,0,0,0,0
$$BTYPES	ends
$$BNAMES	segment byte public use32 'DEBNAM'
	db	10,'@$bnew$qui'
	db	7,'a_count'
	db	10,'@$bnwa$qui'
	db	7,'a_count'
	db	11,'@$bdele$qpv'
	db	5,'a_ptr'
	db	10,'@$bdla$qpv'
	db	5,'a_ptr'
	db	17,'@stk@cpu@rdtsc$qv'
	db	6,'ret_hi'
	db	6,'ret_lo'
	db	3,'ret'
	db	19,'@stk@cpu@rdtscex$qv'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	6,'ret_hi'
	db	6,'ret_lo'
	db	3,'ret'
	db	20,'@stk@cpu@tsc_init$qv'
	db	3,'ret'
	db	2,'m1'
	db	2,'m0'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	21,'@stk@cpu@tsc_start$qv'
	db	3,'ret'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	26,'@stk@cpu@tsc_checkpoint$qv'
	db	1,'e'
	db	1,'x'
	db	1,'n'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	23,'@stk@cpu@tsc_elapsed$qv'
	db	21,'@stk@cpu@tsc_pause$qv'
	db	1,'n'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	22,'@stk@cpu@tsc_resume$qv'
	db	1,'x'
	db	1,'n'
	db	1,'p'
	db	1,'s'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	28,'@stk@cpu@tsc_start_paused$qv'
	db	1,'n'
	db	10,'__shared_1'
	db	10,'__unique_1'
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
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	20,'previous_feature_ecx'
	db	16,'previous_feature'
	db	10,'cached_edx'
	db	10,'cached_ecx'
	db	10,'cached_ebx'
	db	10,'cached_eax'
	db	3,'ret'
	db	22,'@stk@cpu@cpu_vendor$qv'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	1,'v'
	db	20,'@stk@cpu@cpu_name$qv'
	db	1,'i'
	db	1,'f'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	1,'n'
	db	27,'@stk@cpu@cpu_num_threads$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_num_cores$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	27,'@stk@cpu@cpu_cache_size$quc'
	db	7,'a_level'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	32,'@stk@cpu@cpu_cache_line_size$quc'
	db	7,'a_level'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
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
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	6,'trash2'
	db	6,'trash1'
	db	23,'@stk@cpu@cpu_has_x87$qv'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_mmx$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	26,'@stk@cpu@cpu_has_mmxext$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_amd64$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	22,'@stk@cpu@cpu_has_ht$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_sse$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_sse4a$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_avx$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	26,'@stk@cpu@cpu_has_popcnt$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	24,'@stk@cpu@cpu_has_f16c$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	27,'@stk@cpu@cpu_has_cmpxchg$qv'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_vmx$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_smx$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	24,'@stk@cpu@cpu_has_cmov$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_movbe$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_bmi$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	24,'@stk@cpu@cpu_has_erms$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_3dnow$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	33,'@stk@cpu@cpu_has_3dnowprefetch$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	27,'@stk@cpu@cpu_has_perftsc$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_sha$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_xop$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	27,'@stk@cpu@cpu_has_avx512f$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	28,'@stk@cpu@cpu_has_avx512bw$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	28,'@stk@cpu@cpu_has_avx512er$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	28,'@stk@cpu@cpu_has_avx512cd$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	28,'@stk@cpu@cpu_has_avx512pf$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	28,'@stk@cpu@cpu_has_avx512dq$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	28,'@stk@cpu@cpu_has_avx512vl$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	30,'@stk@cpu@cpu_has_avx512ifma$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	30,'@stk@cpu@cpu_has_avx512vbmi$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_adx$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_lzcnt$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_tbm$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_clfsh$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	29,'@stk@cpu@cpu_has_pclmulqdq$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	24,'@stk@cpu@cpu_has_fxsr$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	22,'@stk@cpu@cpu_has_ss$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	24,'@stk@cpu@cpu_has_mtrr$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_msr$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_tsc$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_psn$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_xsave$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_clmul$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	19,'@stk@cpu@cpu_psn$qv'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	2,'sn'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_fma$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_aes$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	26,'@stk@cpu@cpu_has_viaaes$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	26,'@stk@cpu@cpu_has_viarng$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	27,'@stk@cpu@cpu_has_viahash$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	26,'@stk@cpu@cpu_has_rdseed$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
	db	8,'s_answer'
	db	26,'@stk@cpu@cpu_has_rdrand$qv'
	db	3,'ret'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	10,'__shared_1'
	db	10,'__unique_1'
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
	?debug	D "C:\Src\LIB\stk\cpu\./../io/./../stk_main.h" 23670 35701
	?debug	D "C:\Src\LIB\stk\cpu\./../io/stk_console.h" 23626 45852
	?debug	D "C:\Src\LIB\stk\cpu\./../time/stk_time.h" 23625 39992
	?debug	D "C:\Src\LIB\stk\cpu\./../stasm/./../stk_main.h" 23670 35701
	?debug	D "C:\Src\LIB\stk\cpu\./../stasm/stk_stasm.h" 23656 41755
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\_lim.h" 10305 10240
	?debug	D "C:\BORLAND\CBUILDER5\INCLUDE\limits.h" 10305 10240
	?debug	D "C:\Src\LIB\stk\cpu\./../threads/./../cpu/./../stk_main.h" 23670 35701
	?debug	D "C:\Src\LIB\stk\cpu\./../threads/./../cpu/stk_cpu.h" 23631 26774
	?debug	D "C:\Src\LIB\stk\cpu\./../threads/./../time/stk_time.h" 23625 39992
	?debug	D "C:\Src\LIB\stk\cpu\./../threads/./../stk_main.h" 23670 35701
	?debug	D "C:\Src\LIB\stk\cpu\./../threads/stk_threads.h" 23656 47831
	?debug	D "C:\Src\LIB\stk\cpu\./../text/stk_cstr_utils.h" 22373 26066
	?debug	D "C:\Src\LIB\stk\cpu\./../mem/./.././text/./../stk_main.h" 23670 35701
	?debug	D "C:\Src\LIB\stk\cpu\./../mem/./.././text/stk_cstr_utils.h" 22373 26066
	?debug	D "C:\Src\LIB\stk\cpu\./../mem/./.././time/./../stk_main.h" 23670 35701
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
	?debug	D "C:\Src\LIB\stk\cpu\./../mem/./../stk_main.h" 23670 35701
	?debug	D "C:\Src\LIB\stk\cpu\./../mem/stk_mem.h" 23632 18635
	?debug	D "C:\Src\LIB\stk\cpu\stk_cpu.cpp" 23670 36083
	end
