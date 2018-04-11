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
	?debug	S "K:\prc++\x86_libraries\STK\cpu\stk_cpu.cpp"
	?debug	T "K:\prc++\x86_libraries\STK\cpu\stk_cpu.cpp"
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
	align	4
_tsc_PAUSED	label	qword
	db        0,0,0,0,0,0,0,0
	align	4
_tsc_LAST_MEASURED	label	qword
	db        0,0,0,0,0,0,0,0
	align	4
_tsc_ADJ	label	qword
	db	8	dup(?)
	align	4
_tsc_ELAPSED	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@rdtsc$qv	segment virtual
	align	2
@@stk@cpu@rdtsc$qv	proc	near
?live16385@0:
	?debug L 43
	push      ebp
	mov       ebp,esp
	add       esp,-16
	?debug L 50
@1:
	rdtsc	
	?debug L 51
	mov	 [dword ptr [ebp-8]], eax
	?debug L 52
	mov	 [dword ptr [ebp-4]], edx
	?debug L 55
	mov       eax,dword ptr [ebp-4]
	xor       edx,edx
	mov       dword ptr [ebp-16],eax
	mov       dword ptr [ebp-12],edx
	?debug L 56
	mov       edx,dword ptr [ebp-16]
	xor       eax,eax
	mov       dword ptr [ebp-16],eax
	mov       dword ptr [ebp-12],edx
	?debug L 57
	mov       eax,dword ptr [ebp-8]
	xor       edx,edx
	or        eax,dword ptr [ebp-16]
	or        edx,dword ptr [ebp-12]
	mov       dword ptr [ebp-16],eax
	mov       dword ptr [ebp-12],edx
	?debug L 58
	mov       eax,dword ptr [ebp-16]
	mov       edx,dword ptr [ebp-12]
	?debug L 59
@3:
@2:
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	65520
	dw	65535
	dw	119
	dw	0
	dw	2
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	117
	dw	0
	dw	3
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65532
	dw	65535
	dw	117
	dw	0
	dw	4
	dw	0
	dw	0
	dw	0
?patch1	equ	@3-@@stk@cpu@rdtsc$qv+4
?patch2	equ	0
?patch3	equ	@3-@@stk@cpu@rdtsc$qv
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@rdtscex$qv	segment virtual
	align	2
@@stk@cpu@rdtscex$qv	proc	near
?live16386@0:
	?debug L 62
	push      ebp
	mov       ebp,esp
	add       esp,-16
	push      ebx
	push      esi
	?debug L 73
@4:
	pushfd	
	?debug L 74
	push	 eax
	?debug L 75
	push	 ebx
	?debug L 76
	push	 ecx
	?debug L 77
	push	 edx
	?debug L 78
	push	 esi
	?debug L 79
	mov	 eax,000000001H
	?debug L 80
	xor	 ecx,ecx
	?debug L 81
	cpuid	
	?debug L 82
	mov	 ecx,000000001H
	?debug L 83
	shl	 ecx,27
	?debug L 84
	and	 ecx,edx
	?debug L 85
	xor	 eax,eax
	?debug L 86
	xor	 edx,edx
	?debug L 88
	test	 ecx,ecx
	?debug L 89
	je        @5
	?debug L 90
	mov	 eax,1
	?debug L 91
	cpuid	
	?debug L 92
	jmp       @6
	?debug L 93
tsc_amd_measure:
	?debug L 94
	sfence	
	?debug L 95
	rdtsc	
	?debug L 97
@6:
tsc_intel_measure:
	?debug L 98
	sfence	
	?debug L 99
	rdtsc	
	?debug L 101
@5:
tsc_exit:
	?debug L 102
	mov	 [dword ptr [ebp-4]],eax
	?debug L 103
	mov	 [dword ptr [ebp-8]],edx
	?debug L 104
	pop	 esi
	?debug L 105
	pop	 edx
	?debug L 106
	pop	 ecx
	?debug L 107
	pop	 ebx
	?debug L 108
	pop	 eax
	?debug L 109
	popfd	
	?debug L 111
	mov       eax,dword ptr [ebp-8]
	xor       edx,edx
	mov       dword ptr [ebp-16],eax
	mov       dword ptr [ebp-12],edx
	?debug L 112
	mov       edx,dword ptr [ebp-16]
	xor       eax,eax
	mov       dword ptr [ebp-16],eax
	mov       dword ptr [ebp-12],edx
	?debug L 169
	xor       eax,eax
	xor       edx,edx
	?debug L 170
@8:
@7:
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	119
	dw	0
	dw	6
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	117
	dw	0
	dw	7
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65532
	dw	65535
	dw	117
	dw	0
	dw	8
	dw	0
	dw	0
	dw	0
?patch4	equ	@8-@@stk@cpu@rdtscex$qv+6
?patch5	equ	0
?patch6	equ	@8-@@stk@cpu@rdtscex$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	5
	dw	65512
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$minofcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_init$qv	segment virtual
	align	2
@@stk@cpu@tsc_init$qv	proc	near
?live16387@0:
	?debug L 173
@9:
	push      ebp
	mov       ebp,esp
	add       esp,-32
	push      ebx
	mov       ebx,offset $minofcia
	jmp       short @11
	?debug L 176
?live16387@16: ; EBX = &$minofcia
@10:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@11:
	cmp       dword ptr [ebx+4],0
	jne       short @10
	cmp       dword ptr [ebx],0
	jne       short @10
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       eax,dword ptr [ebp-8]
	mov       dword ptr [ebx],eax
	mov       eax,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],eax
	jmp       short @14
@13:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@14:
	cmp       dword ptr [ebx+4],0
	jne       short @17
	cmp       dword ptr [ebx],0
@17:
	je        short @15
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @18
	cmp       eax,dword ptr [ebp-8]
@18:
	setne     cl
	and       ecx,1
	jmp       short @16
@15:
	xor       ecx,ecx
@16:
	test      cl,cl
	jne       short @13
	?debug L 178
	mov       dword ptr [_tsc_ADJ],0
	mov       dword ptr [_tsc_ADJ+4],0
	?debug L 179
	call      @@stk@cpu@tsc_start$qv
	mov       dword ptr [ebp-16],eax
	mov       dword ptr [ebp-12],edx
	?debug L 180
	call      @@stk@cpu@tsc_checkpoint$qv
	mov       dword ptr [ebp-24],eax
	mov       dword ptr [ebp-20],edx
	?debug L 181
	mov       eax,dword ptr [ebp-24]
	mov       edx,dword ptr [ebp-20]
	cmp       edx,dword ptr [ebp-12]
	jne       short @20
	cmp       eax,dword ptr [ebp-16]
@20:
	jbe       short @19
	?debug L 182
	mov       eax,dword ptr [ebp-24]
	mov       edx,dword ptr [ebp-20]
	sub       eax,dword ptr [ebp-16]
	sbb       edx,dword ptr [ebp-12]
	mov       dword ptr [_tsc_ADJ],eax
	mov       dword ptr [_tsc_ADJ+4],edx
	?debug L 183
@19:
	mov       eax,dword ptr [_tsc_ADJ]
	mov       dword ptr [ebp-32],eax
	mov       eax,dword ptr [_tsc_ADJ+4]
	mov       dword ptr [ebp-28],eax
	?debug L 184
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 185
?live16387@144: ; 
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	?debug L 186
@22:
@21:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	65504
	dw	65535
	dw	119
	dw	0
	dw	10
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	119
	dw	0
	dw	11
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	119
	dw	0
	dw	12
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$minofcia
	dw	0
	dw	4102
	dw	0
	dw	13
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	14
	dw	0
	dw	0
	dw	0
?patch7	equ	@22-@@stk@cpu@tsc_init$qv+5
?patch8	equ	0
?patch9	equ	@22-@@stk@cpu@tsc_init$qv
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
$emnofcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_start$qv	segment virtual
	align	2
@@stk@cpu@tsc_start$qv	proc	near
?live16388@0:
	?debug L 189
@23:
	push      ebp
	mov       ebp,esp
	add       esp,-16
	push      ebx
	mov       ebx,offset $emnofcia
	jmp       short @25
	?debug L 192
?live16388@16: ; EBX = &$emnofcia
@24:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@25:
	cmp       dword ptr [ebx+4],0
	jne       short @24
	cmp       dword ptr [ebx],0
	jne       short @24
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       eax,dword ptr [ebp-8]
	mov       dword ptr [ebx],eax
	mov       eax,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],eax
	jmp       short @28
@27:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@28:
	cmp       dword ptr [ebx+4],0
	jne       short @31
	cmp       dword ptr [ebx],0
@31:
	je        short @29
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @32
	cmp       eax,dword ptr [ebp-8]
@32:
	setne     cl
	and       ecx,1
	jmp       short @30
@29:
	xor       ecx,ecx
@30:
	test      cl,cl
	jne       short @27
	?debug L 193
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-16],eax
	mov       dword ptr [ebp-12],edx
	?debug L 194
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [_tsc_STARTED],eax
	mov       eax,dword ptr [ebp-12]
	mov       dword ptr [_tsc_STARTED+4],eax
	?debug L 195
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [_tsc_LAST_MEASURED],edx
	mov       edx,dword ptr [ebp-12]
	mov       dword ptr [_tsc_LAST_MEASURED+4],edx
	?debug L 196
	mov       dword ptr [_tsc_PAUSED],0
	mov       dword ptr [_tsc_PAUSED+4],0
	mov       dword ptr [_tsc_ELAPSED],0
	mov       dword ptr [_tsc_ELAPSED+4],0
	?debug L 197
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 198
?live16388@112: ; 
	mov       eax,dword ptr [ebp-16]
	mov       edx,dword ptr [ebp-12]
	?debug L 199
@34:
@33:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	65520
	dw	65535
	dw	119
	dw	0
	dw	16
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$emnofcia
	dw	0
	dw	4102
	dw	0
	dw	17
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	18
	dw	0
	dw	0
	dw	0
?patch10	equ	@34-@@stk@cpu@tsc_start$qv+5
?patch11	equ	0
?patch12	equ	@34-@@stk@cpu@tsc_start$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65516
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mpnofcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_checkpoint$qv	segment virtual
	align	2
@@stk@cpu@tsc_checkpoint$qv	proc	near
?live16389@0:
	?debug L 202
@35:
	push      ebp
	mov       ebp,esp
	add       esp,-32
	push      ebx
	mov       ebx,offset $mpnofcia
	jmp       short @37
	?debug L 205
?live16389@16: ; EBX = &$mpnofcia
@36:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@37:
	cmp       dword ptr [ebx+4],0
	jne       short @36
	cmp       dword ptr [ebx],0
	jne       short @36
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       eax,dword ptr [ebp-8]
	mov       dword ptr [ebx],eax
	mov       eax,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],eax
	jmp       short @40
@39:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@40:
	cmp       dword ptr [ebx+4],0
	jne       short @43
	cmp       dword ptr [ebx],0
@43:
	je        short @41
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @44
	cmp       eax,dword ptr [ebp-8]
@44:
	setne     cl
	and       ecx,1
	jmp       short @42
@41:
	xor       ecx,ecx
@42:
	test      cl,cl
	jne       short @39
	?debug L 206
	mov       eax,dword ptr [_tsc_PAUSED]
	mov       dword ptr [ebp-16],eax
	mov       eax,dword ptr [_tsc_PAUSED+4]
	mov       dword ptr [ebp-12],eax
	?debug L 209
	cmp       dword ptr [ebp-12],0
	jne       short @45
	cmp       dword ptr [ebp-16],0
	jne       short @45
	?debug L 210
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-16],eax
	mov       dword ptr [ebp-12],edx
	?debug L 212
@45:
	mov       eax,dword ptr [_tsc_STARTED]
	mov       edx,dword ptr [_tsc_STARTED+4]
	sub       eax,dword ptr [_tsc_ADJ]
	sbb       edx,dword ptr [_tsc_ADJ+4]
	mov       dword ptr [ebp-24],eax
	mov       dword ptr [ebp-20],edx
	?debug L 213
	mov       eax,dword ptr [ebp-16]
	mov       edx,dword ptr [ebp-12]
	cmp       edx,dword ptr [ebp-20]
	jne       short @48
	cmp       eax,dword ptr [ebp-24]
@48:
	jbe       short @47
	mov       eax,dword ptr [ebp-16]
	mov       edx,dword ptr [ebp-12]
	sub       eax,dword ptr [ebp-24]
	sbb       edx,dword ptr [ebp-20]
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	jmp       short @49
	?debug L 215
@47:
	mov       dword ptr [ebp-32],0
	mov       dword ptr [ebp-28],0
	?debug L 217
@49:
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [_tsc_LAST_MEASURED],eax
	mov       eax,dword ptr [ebp-12]
	mov       dword ptr [_tsc_LAST_MEASURED+4],eax
	?debug L 218
	mov       edx,dword ptr [ebp-32]
	mov       dword ptr [_tsc_ELAPSED],edx
	mov       edx,dword ptr [ebp-28]
	mov       dword ptr [_tsc_ELAPSED+4],edx
	?debug L 219
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 220
?live16389@176: ; 
	mov       eax,dword ptr [ebp-16]
	mov       edx,dword ptr [ebp-12]
	?debug L 221
@51:
@50:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	65504
	dw	65535
	dw	119
	dw	0
	dw	20
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	119
	dw	0
	dw	21
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	119
	dw	0
	dw	22
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mpnofcia
	dw	0
	dw	4102
	dw	0
	dw	23
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	24
	dw	0
	dw	0
	dw	0
?patch13	equ	@51-@@stk@cpu@tsc_checkpoint$qv+5
?patch14	equ	0
?patch15	equ	@51-@@stk@cpu@tsc_checkpoint$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65500
	dw	65535
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_elapsed$qv	segment virtual
	align	2
@@stk@cpu@tsc_elapsed$qv	proc	near
?live16390@0:
	?debug L 224
@52:
	push      ebp
	mov       ebp,esp
	?debug L 226
	mov       eax,dword ptr [_tsc_ELAPSED]
	mov       edx,dword ptr [_tsc_ELAPSED+4]
	?debug L 227
@54:
@53:
	pop       ebp
	ret 
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
?patch16	equ	@54-@@stk@cpu@tsc_elapsed$qv+2
?patch17	equ	0
?patch18	equ	@54-@@stk@cpu@tsc_elapsed$qv
	dw	2
	dw	6
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$edoofcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_pause$qv	segment virtual
	align	2
@@stk@cpu@tsc_pause$qv	proc	near
?live16391@0:
	?debug L 230
@55:
	push      ebp
	mov       ebp,esp
	add       esp,-16
	push      ebx
	mov       ebx,offset $edoofcia
	jmp       short @57
	?debug L 233
?live16391@16: ; EBX = &$edoofcia
@56:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@57:
	cmp       dword ptr [ebx+4],0
	jne       short @56
	cmp       dword ptr [ebx],0
	jne       short @56
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       eax,dword ptr [ebp-8]
	mov       dword ptr [ebx],eax
	mov       eax,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],eax
	jmp       short @60
@59:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@60:
	cmp       dword ptr [ebx+4],0
	jne       short @63
	cmp       dword ptr [ebx],0
@63:
	je        short @61
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @64
	cmp       eax,dword ptr [ebp-8]
@64:
	setne     cl
	and       ecx,1
	jmp       short @62
@61:
	xor       ecx,ecx
@62:
	test      cl,cl
	jne       short @59
	?debug L 234
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-16],eax
	mov       dword ptr [ebp-12],edx
	?debug L 235
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [_tsc_PAUSED],eax
	mov       eax,dword ptr [ebp-12]
	mov       dword ptr [_tsc_PAUSED+4],eax
	?debug L 236
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 237
?live16391@80: ; 
	mov       eax,dword ptr [ebp-16]
	mov       edx,dword ptr [ebp-12]
	?debug L 238
@66:
@65:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	65520
	dw	65535
	dw	119
	dw	0
	dw	27
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$edoofcia
	dw	0
	dw	4102
	dw	0
	dw	28
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	29
	dw	0
	dw	0
	dw	0
?patch19	equ	@66-@@stk@cpu@tsc_pause$qv+5
?patch20	equ	0
?patch21	equ	@66-@@stk@cpu@tsc_pause$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65516
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mgoofcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_resume$qv	segment virtual
	align	2
@@stk@cpu@tsc_resume$qv	proc	near
?live16392@0:
	?debug L 241
@67:
	push      ebp
	mov       ebp,esp
	add       esp,-40
	push      ebx
	mov       ebx,offset $mgoofcia
	jmp       short @69
	?debug L 244
?live16392@16: ; EBX = &$mgoofcia
@68:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@69:
	cmp       dword ptr [ebx+4],0
	jne       short @68
	cmp       dword ptr [ebx],0
	jne       short @68
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       eax,dword ptr [ebp-8]
	mov       dword ptr [ebx],eax
	mov       eax,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],eax
	jmp       short @72
@71:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@72:
	cmp       dword ptr [ebx+4],0
	jne       short @75
	cmp       dword ptr [ebx],0
@75:
	je        short @73
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @76
	cmp       eax,dword ptr [ebp-8]
@76:
	setne     cl
	and       ecx,1
	jmp       short @74
@73:
	xor       ecx,ecx
@74:
	test      cl,cl
	jne       short @71
	?debug L 245
	mov       eax,dword ptr [_tsc_STARTED]
	mov       dword ptr [ebp-16],eax
	mov       eax,dword ptr [_tsc_STARTED+4]
	mov       dword ptr [ebp-12],eax
	?debug L 246
	mov       edx,dword ptr [_tsc_PAUSED]
	mov       dword ptr [ebp-24],edx
	mov       edx,dword ptr [_tsc_PAUSED+4]
	mov       dword ptr [ebp-20],edx
	?debug L 247
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 248
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	sub       eax,dword ptr [ebp-24]
	sbb       edx,dword ptr [ebp-20]
	add       eax,dword ptr [ebp-16]
	adc       edx,dword ptr [ebp-12]
	mov       dword ptr [ebp-40],eax
	mov       dword ptr [ebp-36],edx
	?debug L 249
	mov       eax,dword ptr [ebp-40]
	mov       dword ptr [_tsc_STARTED],eax
	mov       eax,dword ptr [ebp-36]
	mov       dword ptr [_tsc_STARTED+4],eax
	mov       dword ptr [_tsc_PAUSED],0
	mov       dword ptr [_tsc_PAUSED+4],0
	?debug L 250
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 251
?live16392@128: ; 
	mov       eax,dword ptr [ebp-32]
	mov       edx,dword ptr [ebp-28]
	?debug L 252
@78:
@77:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	65496
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
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	119
	dw	0
	dw	33
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	119
	dw	0
	dw	34
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mgoofcia
	dw	0
	dw	4102
	dw	0
	dw	35
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	36
	dw	0
	dw	0
	dw	0
?patch22	equ	@78-@@stk@cpu@tsc_resume$qv+5
?patch23	equ	0
?patch24	equ	@78-@@stk@cpu@tsc_resume$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65492
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ekoofcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_start_paused$qv	segment virtual
	align	2
@@stk@cpu@tsc_start_paused$qv	proc	near
?live16393@0:
	?debug L 255
@79:
	push      ebp
	mov       ebp,esp
	add       esp,-16
	push      ebx
	mov       ebx,offset $ekoofcia
	jmp       short @81
	?debug L 258
?live16393@16: ; EBX = &$ekoofcia
@80:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@81:
	cmp       dword ptr [ebx+4],0
	jne       short @80
	cmp       dword ptr [ebx],0
	jne       short @80
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       eax,dword ptr [ebp-8]
	mov       dword ptr [ebx],eax
	mov       eax,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],eax
	jmp       short @84
@83:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@84:
	cmp       dword ptr [ebx+4],0
	jne       short @87
	cmp       dword ptr [ebx],0
@87:
	je        short @85
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @88
	cmp       eax,dword ptr [ebp-8]
@88:
	setne     cl
	and       ecx,1
	jmp       short @86
@85:
	xor       ecx,ecx
@86:
	test      cl,cl
	jne       short @83
	?debug L 259
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-16],eax
	mov       dword ptr [ebp-12],edx
	?debug L 260
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [_tsc_LAST_MEASURED],eax
	mov       eax,dword ptr [ebp-12]
	mov       dword ptr [_tsc_LAST_MEASURED+4],eax
	?debug L 261
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [_tsc_STARTED],edx
	mov       edx,dword ptr [ebp-12]
	mov       dword ptr [_tsc_STARTED+4],edx
	?debug L 262
	mov       dword ptr [_tsc_ELAPSED],0
	mov       dword ptr [_tsc_ELAPSED+4],0
	mov       eax,dword ptr [ebp-16]
	mov       dword ptr [_tsc_PAUSED],eax
	mov       eax,dword ptr [ebp-12]
	mov       dword ptr [_tsc_PAUSED+4],eax
	?debug L 263
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 264
?live16393@112: ; 
	mov       eax,dword ptr [ebp-16]
	mov       edx,dword ptr [ebp-12]
	?debug L 265
@90:
@89:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	65520
	dw	65535
	dw	119
	dw	0
	dw	38
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ekoofcia
	dw	0
	dw	4102
	dw	0
	dw	39
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	40
	dw	0
	dw	0
	dw	0
?patch25	equ	@90-@@stk@cpu@tsc_start_paused$qv+5
?patch26	equ	0
?patch27	equ	@90-@@stk@cpu@tsc_start_paused$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65516
	dw	65535
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpuid$qpuit1t1t1uiui	segment virtual
	align	2
@@stk@cpu@cpuid$qpuit1t1t1uiui	proc	near
?live16394@0:
	?debug L 268
@91:
	push      ebp
	mov       ebp,esp
	?debug L 296
	mov       eax,dword ptr [ebp+8]
	mov       eax,dword ptr [eax]
	?debug L 298
@93:
@92:
	pop       ebp
	ret 
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
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	48
	dw	0
	dw	0
	dw	0
?patch28	equ	@93-@@stk@cpu@cpuid$qpuit1t1t1uiui+2
?patch29	equ	0
?patch30	equ	@93-@@stk@cpu@cpuid$qpuit1t1t1uiui
	dw	2
	dw	6
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mnoofcia	label	dword
	dd	0
	align	4
$ebpofcia	label	dword
	dd	0
	align	4
$mepofcia	label	dword
	dd	0
	align	4
$eipofcia	label	dword
	dd	0
	align	4
$mlpofcia	label	dword
	dd	-1
	align	4
$eppofcia	label	dword
	dd	-1
	align	4
$mcapfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpuidex$qpuit1t1t1uiui	segment virtual
	align	2
@@stk@cpu@cpuidex$qpuit1t1t1uiui	proc	near
?live16395@0:
	?debug L 301
	push      ebp
	mov       ebp,esp
	add       esp,-8
	push      ebx
	push      esi
	push      edi
@94:
	jmp       short @96
	?debug L 310
@95:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@96:
	cmp       dword ptr [$mcapfcia+4],0
	jne       short @95
	cmp       dword ptr [$mcapfcia],0
@97:
	jne       short @95
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       eax,dword ptr [ebp-8]
	mov       dword ptr [$mcapfcia],eax
	mov       eax,dword ptr [ebp-4]
	mov       dword ptr [$mcapfcia+4],eax
	jmp       short @99
@98:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@99:
	cmp       dword ptr [$mcapfcia+4],0
	jne       short @102
	cmp       dword ptr [$mcapfcia],0
@102:
	je        short @100
	mov       eax,dword ptr [$mcapfcia]
	mov       edx,dword ptr [$mcapfcia+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @103
	cmp       eax,dword ptr [ebp-8]
@103:
	setne     cl
	and       ecx,1
	jmp       short @101
@100:
	xor       ecx,ecx
@101:
	test      cl,cl
	jne       short @98
	?debug L 311
	mov       eax,dword ptr [ebp+24]
	cmp       eax,dword ptr [$mlpofcia]
	jne       short @104
	mov       edx,dword ptr [ebp+28]
	cmp       edx,dword ptr [$eppofcia]
	jne       short @104
	?debug L 312
	mov       eax,dword ptr [ebp+8]
	mov       edx,dword ptr [$mnoofcia]
	mov       dword ptr [eax],edx
	?debug L 313
	mov       ecx,dword ptr [ebp+12]
	mov       eax,dword ptr [$ebpofcia]
	mov       dword ptr [ecx],eax
	?debug L 314
	mov       edx,dword ptr [ebp+16]
	mov       ecx,dword ptr [$mepofcia]
	mov       dword ptr [edx],ecx
	?debug L 315
	mov       eax,dword ptr [ebp+20]
	mov       edx,dword ptr [$eipofcia]
	mov       dword ptr [eax],edx
	?debug L 316
@105:
	mov       eax,dword ptr [$mnoofcia]
	?debug L 317
?live16395@128: ; EAX = r
	mov       dword ptr [$mcapfcia],0
	mov       dword ptr [$mcapfcia+4],0
	?debug L 318
	jmp       @106
	?debug L 319
?live16395@160: ; 
@107:
	jmp       short @108
	?debug L 321
@104:
	mov       edx,dword ptr [ebp+24]
	?debug L 322
	mov       ecx,dword ptr [ebp+28]
	?debug L 321
	mov       dword ptr [$mlpofcia],edx
	?debug L 322
	mov       dword ptr [$eppofcia],ecx
	?debug L 327
@108:
	pushfd	
	?debug L 328
	push	 eax
	?debug L 329
	push	 ebx
	?debug L 330
	push	 ecx
	?debug L 331
	push	 edx
	?debug L 332
	push	 esi
	?debug L 333
	push	 edi
	?debug L 334
	mov	 edi,dword ptr [ebp+24]
	?debug L 335
	mov	 eax,edi
	?debug L 336
	and	 eax,080000000H
	?debug L 337
	cpuid	
	?debug L 338
	mov	        esi,eax
	?debug L 339
	xor	        eax,eax
	?debug L 340
	xor	        ebx,ebx
	?debug L 341
	xor	        ecx,ecx
	?debug L 342
	xor	        edx,edx
	?debug L 343
	cmp	        esi,edi
	?debug L 344
	jb        short @109
	?debug L 345
	mov	        eax,edi
	?debug L 346
	mov	        edi,dword ptr [ebp+28]
	?debug L 347
	mov	        ecx,edi
	?debug L 348
	cpuid	
	?debug L 349
@109:
cpuid_save_result:
	?debug L 350
	mov	 dword ptr $mnoofcia,eax
	?debug L 351
	mov	 dword ptr $ebpofcia,ebx
	?debug L 352
	mov	 dword ptr $mepofcia,ecx
	?debug L 353
	mov	 dword ptr $eipofcia,edx
	?debug L 354
	pop	 edi
	?debug L 355
	pop	 esi
	?debug L 356
	pop	 edx
	?debug L 357
	pop	 ecx
	?debug L 358
	pop	 ebx
	?debug L 359
	pop	 eax
	?debug L 360
	popfd	
	?debug L 362
	mov       eax,dword ptr [ebp+8]
	mov       edx,dword ptr [$mnoofcia]
	mov       dword ptr [eax],edx
	?debug L 363
	mov       ecx,dword ptr [ebp+12]
	mov       eax,dword ptr [$ebpofcia]
	mov       dword ptr [ecx],eax
	?debug L 364
	mov       edx,dword ptr [ebp+16]
	mov       ecx,dword ptr [$mepofcia]
	mov       dword ptr [edx],ecx
	?debug L 365
	mov       eax,dword ptr [ebp+20]
	mov       edx,dword ptr [$eipofcia]
	mov       dword ptr [eax],edx
	?debug L 417
	mov       ecx,dword ptr [ebp+8]
	mov       eax,dword ptr [ecx]
	?debug L 418
?live16395@864: ; EAX = r
	mov       dword ptr [$mcapfcia],0
	mov       dword ptr [$mcapfcia+4],0
	?debug L 420
?live16395@880: ; 
@110:
@106:
	pop       edi
	pop       esi
	pop       ebx
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
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
	dw	49
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
	dw	50
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	12
	dw	0
	dw	1141
	dw	0
	dw	51
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	16
	dw	0
	dw	1141
	dw	0
	dw	52
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	20
	dw	0
	dw	1141
	dw	0
	dw	53
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	24
	dw	0
	dw	117
	dw	0
	dw	54
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	28
	dw	0
	dw	117
	dw	0
	dw	55
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	56
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
	df	$mcapfcia
	dw	0
	dw	4102
	dw	0
	dw	57
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	58
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eppofcia
	dw	0
	dw	117
	dw	0
	dw	59
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mlpofcia
	dw	0
	dw	117
	dw	0
	dw	60
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eipofcia
	dw	0
	dw	117
	dw	0
	dw	61
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mepofcia
	dw	0
	dw	117
	dw	0
	dw	62
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ebpofcia
	dw	0
	dw	117
	dw	0
	dw	63
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mnoofcia
	dw	0
	dw	117
	dw	0
	dw	64
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
	df	@105
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
	dw	?patch37
	dw	529
	dw	?patch38
	dd	?live16395@128-@@stk@cpu@cpuidex$qpuit1t1t1uiui
	dd	?live16395@160-?live16395@128
	dw	17
?patch38	equ	1
?patch37	equ	14
?patch36	equ	@107-@105
	dw	2
	dw	6
?patch31	equ	@110-@@stk@cpu@cpuidex$qpuit1t1t1uiui+7
?patch32	equ	0
?patch33	equ	@110-@@stk@cpu@cpuidex$qpuit1t1t1uiui
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
$egapfcia	label	dword
	dd	0
	dd	0
	dd	0
	dd	0
	align	4
$mjapfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_vendor$qv	segment virtual
	align	2
@@stk@cpu@cpu_vendor$qv	proc	near
?live16396@0:
	?debug L 423
@111:
	push      ebp
	mov       ebp,esp
	add       esp,-8
	push      ebx
	push      esi
	mov       ebx,offset $mjapfcia
	mov       esi,offset $egapfcia
	jmp       short @113
	?debug L 427
?live16396@16: ; EBX = &$mjapfcia, ESI = &$egapfcia
@112:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@113:
	cmp       dword ptr [ebx+4],0
	jne       short @112
	cmp       dword ptr [ebx],0
	jne       short @112
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       eax,dword ptr [ebp-8]
	mov       dword ptr [ebx],eax
	mov       eax,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],eax
	jmp       short @116
@115:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@116:
	cmp       dword ptr [ebx+4],0
	jne       short @119
	cmp       dword ptr [ebx],0
@119:
	je        short @117
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @120
	cmp       eax,dword ptr [ebp-8]
@120:
	setne     cl
	and       ecx,1
	jmp       short @118
@117:
	xor       ecx,ecx
@118:
	test      cl,cl
	jne       short @115
	?debug L 428
	push      0
	lea       eax,dword ptr [esi+4]
	push      0
	push      eax
	lea       edx,dword ptr [esi+8]
	lea       eax,dword ptr [esi+12]
	push      edx
	push      esi
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 429
	cmp       dword ptr [esi],0
	je        short @121
	?debug L 430
	xor       edx,edx
	mov       dword ptr [esi+12],edx
	?debug L 432
@121:
	mov       dword ptr [ebx],0
	?debug L 433
?live16396@96: ; ESI = &$egapfcia
	mov       eax,esi
	?debug L 432
?live16396@112: ; EBX = &$mjapfcia, ESI = &$egapfcia
	mov       dword ptr [ebx+4],0
	?debug L 434
?live16396@128: ; 
@123:
@122:
	pop       esi
	pop       ebx
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
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
	dw	66
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
	df	$mjapfcia
	dw	0
	dw	4102
	dw	0
	dw	67
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	68
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$egapfcia
	dw	0
	dw	4121
	dw	0
	dw	69
	dw	0
	dw	0
	dw	0
?patch39	equ	@123-@@stk@cpu@cpu_vendor$qv+6
?patch40	equ	0
?patch41	equ	@123-@@stk@cpu@cpu_vendor$qv
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
$enapfcia	label	dword
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
	align	4
$mabpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_name$qv	segment virtual
	align	2
@@stk@cpu@cpu_name$qv	proc	near
?live16397@0:
	?debug L 437
@124:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	push      ebx
	push      esi
	push      edi
	mov       edi,offset $enapfcia
	?debug L 440
?live16397@16: ; EDI = &$enapfcia
	cmp       dword ptr [edi],0
	je        short @128
	?debug L 441
	mov       eax,edi
	jmp       @126
	?debug L 443
@127:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@128:
	cmp       dword ptr [$mabpfcia+4],0
	jne       short @127
	cmp       dword ptr [$mabpfcia],0
	jne       short @127
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       edx,dword ptr [ebp-8]
	mov       dword ptr [$mabpfcia],edx
	mov       edx,dword ptr [ebp-4]
	mov       dword ptr [$mabpfcia+4],edx
	jmp       short @131
@130:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@131:
	cmp       dword ptr [$mabpfcia+4],0
	jne       short @134
	cmp       dword ptr [$mabpfcia],0
@134:
	je        short @132
	mov       eax,dword ptr [$mabpfcia]
	mov       edx,dword ptr [$mabpfcia+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @135
	cmp       eax,dword ptr [ebp-8]
@135:
	setne     cl
	and       ecx,1
	jmp       short @133
@132:
	xor       ecx,ecx
@133:
	test      cl,cl
	jne       short @130
	?debug L 446
	push      0
	push      -2147483648
	lea       eax,dword ptr [ebp-12]
	push      eax
	lea       edx,dword ptr [ebp-16]
	push      edx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	cmp       eax,-2147483644
	jae       short @136
	?debug L 447
	mov       dword ptr [$mabpfcia],0
	mov       dword ptr [$mabpfcia+4],0
	?debug L 448
	push      12
	push      offset s@
	push      edi
	call      @@stk@mem@mov$qqspvpxvxui
	jmp       short @126
	?debug L 450
@136:
	mov       esi,-2147483646
	xor       ebx,ebx
	?debug L 452
?live16397@128: ; EBX = i, ESI = f, EDI = &$enapfcia
@137:
	lea       eax,dword ptr [ebx+3]
	push      0
	shl       eax,2
	push      esi
	add       eax,edi
	lea       edx,dword ptr [ebx+2]
	shl       edx,2
	push      eax
	lea       ecx,dword ptr [ebx+1]
	mov       eax,ebx
	shl       ecx,2
	add       edx,edi
	shl       eax,2
	add       ecx,edi
	push      edx
	push      ecx
	add       eax,edi
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 450
	inc       esi
	add       ebx,4
	cmp       ebx,12
	jb        short @137
	?debug L 454
?live16397@160: ; EDI = &$enapfcia
	push      edi
	call      @@stk@cstr@trim$qqspc
	?debug L 455
	mov       dword ptr [$mabpfcia],0
	mov       dword ptr [$mabpfcia+4],0
	?debug L 456
	mov       eax,edi
	?debug L 457
?live16397@208: ; 
@140:
@126:
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	70
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
	dw	71
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
	dw	72
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
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	73
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	74
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	75
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	76
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mabpfcia
	dw	0
	dw	4102
	dw	0
	dw	77
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	78
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$enapfcia
	dw	0
	dw	4124
	dw	0
	dw	79
	dw	0
	dw	0
	dw	0
?patch42	equ	@140-@@stk@cpu@cpu_name$qv+7
?patch43	equ	0
?patch44	equ	@140-@@stk@cpu@cpu_name$qv
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
$eebpfcia	label	dword
	dd	-1
	align	4
$mhbpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_threads$qv	segment virtual
	align	2
@@stk@cpu@cpu_num_threads$qv	proc	near
?live16398@0:
	?debug L 460
@141:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 463
?live16398@16: ; EBX = &$mhbpfcia
	mov       eax,dword ptr [$eebpfcia]
	cmp       eax,-1
	?debug L 460
?live16398@32: ; 
	push      ebx
	mov       ebx,offset $mhbpfcia
	?debug L 463
?live16398@48: ; EBX = &$mhbpfcia
	jne       @143
	?debug L 464
?live16398@64: ; EAX = @temp4
	jmp       short @145
	?debug L 466
?live16398@80: ; EBX = &$mhbpfcia
@144:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@145:
	cmp       dword ptr [ebx+4],0
	jne       short @144
	cmp       dword ptr [ebx],0
	jne       short @144
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       edx,dword ptr [ebp-8]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],edx
	jmp       short @148
@147:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@148:
	cmp       dword ptr [ebx+4],0
	jne       short @151
	cmp       dword ptr [ebx],0
@151:
	je        short @149
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @152
	cmp       eax,dword ptr [ebp-8]
@152:
	setne     cl
	and       ecx,1
	jmp       short @150
@149:
	xor       ecx,ecx
@150:
	test      cl,cl
	jne       short @147
	?debug L 469
	push      0
	push      1
	lea       eax,dword ptr [ebp-12]
	push      eax
	lea       edx,dword ptr [ebp-16]
	push      edx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 471
	mov       eax,dword ptr [ebp-20]
	shr       eax,16
	and       eax,255
	inc       eax
	mov       dword ptr [$eebpfcia],eax
	?debug L 473
?live16398@128: ; EBX = &$mhbpfcia, EAX = @temp3
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 475
?live16398@144: ; 
@153:
@143:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	80
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
	dw	81
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	82
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	83
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	84
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	85
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mhbpfcia
	dw	0
	dw	4102
	dw	0
	dw	86
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	87
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eebpfcia
	dw	0
	dw	117
	dw	0
	dw	88
	dw	0
	dw	0
	dw	0
?patch49	equ	@153-@@stk@cpu@cpu_num_threads$qv+5
?patch50	equ	0
?patch51	equ	@153-@@stk@cpu@cpu_num_threads$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$elbpfcia	label	dword
	dd	-1
	align	4
$mobpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_cores$qv	segment virtual
	align	2
@@stk@cpu@cpu_num_cores$qv	proc	near
?live16399@0:
	?debug L 478
@154:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 481
?live16399@16: ; EBX = &$mobpfcia
	mov       eax,dword ptr [$elbpfcia]
	cmp       eax,-1
	?debug L 478
?live16399@32: ; 
	push      ebx
	mov       ebx,offset $mobpfcia
	?debug L 481
?live16399@48: ; EBX = &$mobpfcia
	jne       @156
	?debug L 482
?live16399@64: ; EAX = @temp3
	jmp       short @158
	?debug L 484
?live16399@80: ; EBX = &$mobpfcia
@157:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@158:
	cmp       dword ptr [ebx+4],0
	jne       short @157
	cmp       dword ptr [ebx],0
	jne       short @157
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       edx,dword ptr [ebp-8]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],edx
	jmp       short @161
@160:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@161:
	cmp       dword ptr [ebx+4],0
	jne       short @164
	cmp       dword ptr [ebx],0
@164:
	je        short @162
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @165
	cmp       eax,dword ptr [ebp-8]
@165:
	setne     cl
	and       ecx,1
	jmp       short @163
@162:
	xor       ecx,ecx
@163:
	test      cl,cl
	jne       short @160
	?debug L 487
	push      12
	push      offset s@+13
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qqspxvt1xui
	cmp       edx,0
	jne       short @166
	cmp       eax,0
	jne       short @166
	?debug L 489
	push      0
	push      4
	lea       eax,dword ptr [ebp-12]
	push      eax
	lea       edx,dword ptr [ebp-16]
	push      edx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 490
	mov       ecx,dword ptr [ebp-24]
	shr       ecx,26
	and       ecx,63
	inc       ecx
	mov       dword ptr [$elbpfcia],ecx
	?debug L 492
	jmp       short @168
	?debug L 494
@166:
	push      12
	push      offset s@+26
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qqspxvt1xui
	cmp       edx,0
	jne       short @169
	cmp       eax,0
	jne       short @169
	?debug L 496
	push      0
	push      -2147483647
	lea       eax,dword ptr [ebp-12]
	push      eax
	lea       edx,dword ptr [ebp-16]
	push      edx
	lea       ecx,dword ptr [ebp-20]
	push      ecx
	lea       eax,dword ptr [ebp-24]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 497
	mov       edx,dword ptr [ebp-16]
	and       edx,255
	inc       edx
	mov       dword ptr [$elbpfcia],edx
	?debug L 499
	jmp       short @168
	?debug L 500
@169:
	call      @@stk@cpu@cpu_num_threads$qv
	mov       dword ptr [$elbpfcia],eax
	?debug L 501
@168:
	mov       eax,dword ptr [$elbpfcia]
	?debug L 502
?live16399@256: ; EBX = &$mobpfcia, EAX = r
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 505
?live16399@272: ; 
@171:
@156:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	89
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
	dw	90
	dw	0
	dw	0
	dw	0
	dw	?patch55
	dw	529
	dw	?patch56
	dd	?live16399@256-@@stk@cpu@cpu_num_cores$qv
	dd	?live16399@272-?live16399@256
	dw	17
?patch56	equ	1
?patch55	equ	14
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	91
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	92
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	93
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	94
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mobpfcia
	dw	0
	dw	4102
	dw	0
	dw	95
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	96
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$elbpfcia
	dw	0
	dw	117
	dw	0
	dw	97
	dw	0
	dw	0
	dw	0
?patch52	equ	@171-@@stk@cpu@cpu_num_cores$qv+5
?patch53	equ	0
?patch54	equ	@171-@@stk@cpu@cpu_num_cores$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eccpfcia	label	dword
	dd	-1
	align	4
$mfcpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_cache_size$quc	segment virtual
	align	2
@@stk@cpu@cpu_cache_size$quc	proc	near
?live16400@0:
	?debug L 506
@172:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	push      ebx
	push      esi
	push      edi
	mov       edi,offset $eccpfcia
	mov       ebx,dword ptr [ebp+8]
	mov       esi,offset $mfcpfcia
	?debug L 509
?live16400@16: ; EBX = a_level, ESI = &$mfcpfcia, EDI = &$eccpfcia
	mov       eax,dword ptr [edi]
	cmp       eax,-1
	jne       @174
	?debug L 510
?live16400@32: ; EAX = @temp5, EDI = &$eccpfcia
	jmp       short @176
	?debug L 512
?live16400@48: ; EBX = a_level, ESI = &$mfcpfcia, EDI = &$eccpfcia
@175:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@176:
	cmp       dword ptr [esi+4],0
	jne       short @175
	cmp       dword ptr [esi],0
	jne       short @175
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       edx,dword ptr [ebp-8]
	mov       dword ptr [esi],edx
	mov       edx,dword ptr [ebp-4]
	mov       dword ptr [esi+4],edx
	jmp       short @179
@178:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@179:
	cmp       dword ptr [esi+4],0
	jne       short @182
	cmp       dword ptr [esi],0
@182:
	je        short @180
	mov       eax,dword ptr [esi]
	mov       edx,dword ptr [esi+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @183
	cmp       eax,dword ptr [ebp-8]
@183:
	setne     cl
	and       ecx,1
	jmp       short @181
@180:
	xor       ecx,ecx
@181:
	test      cl,cl
	jne       short @178
	?debug L 515
	push      12
	push      offset s@+13
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qqspxvt1xui
	cmp       edx,0
	jne       @184
	cmp       eax,0
	jne       @184
	?debug L 516
	cmp       bl,2
	jne       @186
	?debug L 517
?live16400@96: ; ESI = &$mfcpfcia, EDI = &$eccpfcia
	push      0
	push      2
	lea       eax,dword ptr [ebp-12]
	push      eax
	lea       edx,dword ptr [ebp-16]
	push      edx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 518
	mov       eax,dword ptr [ebp-12]
	and       eax,255
	cmp       eax,64
	jne       short @187
	?debug L 519
	xor       edx,edx
	mov       dword ptr [edi],edx
	jmp       @188
	?debug L 521
?live16400@144: ; ESI = &$mfcpfcia, EAX = @temp4, EDI = &$eccpfcia
@187:
	cmp       eax,65
	jne       short @189
	?debug L 522
?live16400@160: ; ESI = &$mfcpfcia, EDI = &$eccpfcia
	mov       dword ptr [edi],128
	jmp       @188
	?debug L 524
?live16400@176: ; ESI = &$mfcpfcia, EAX = @temp4, EDI = &$eccpfcia
@189:
	cmp       eax,66
	jne       short @190
	?debug L 525
?live16400@192: ; ESI = &$mfcpfcia, EDI = &$eccpfcia
	mov       dword ptr [edi],256
	jmp       @188
	?debug L 527
?live16400@208: ; ESI = &$mfcpfcia, EAX = @temp4, EDI = &$eccpfcia
@190:
	cmp       eax,67
	jne       short @191
	?debug L 528
?live16400@224: ; ESI = &$mfcpfcia, EDI = &$eccpfcia
	mov       dword ptr [edi],512
	jmp       @188
	?debug L 530
?live16400@240: ; ESI = &$mfcpfcia, EAX = @temp4, EDI = &$eccpfcia
@191:
	cmp       eax,68
	jne       short @192
	?debug L 531
?live16400@256: ; ESI = &$mfcpfcia, EDI = &$eccpfcia
	mov       dword ptr [edi],1024
	jmp       @188
	?debug L 533
?live16400@272: ; ESI = &$mfcpfcia, EAX = @temp4, EDI = &$eccpfcia
@192:
	cmp       eax,69
	jne       short @193
	?debug L 534
?live16400@288: ; ESI = &$mfcpfcia, EDI = &$eccpfcia
	mov       dword ptr [edi],2048
	jmp       @188
	?debug L 538
@193:
	xor       ecx,ecx
	mov       dword ptr [edi],ecx
	?debug L 540
	jmp       @188
	?debug L 541
@186:
	xor       eax,eax
	mov       dword ptr [edi],eax
	?debug L 542
	jmp       @188
	?debug L 544
?live16400@368: ; EBX = a_level, ESI = &$mfcpfcia, EDI = &$eccpfcia
@184:
	push      12
	push      offset s@+26
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qqspxvt1xui
	cmp       edx,0
	jne       short @195
	cmp       eax,0
@195:
	jne       @196
	?debug L 545
	test      bl,bl
	jne       short @197
	?debug L 546
?live16400@400: ; ESI = &$mfcpfcia, EDI = &$eccpfcia
	push      0
	push      -2147483643
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 547
	mov       ecx,dword ptr [ebp-12]
	shr       ecx,24
	and       ecx,255
	mov       dword ptr [edi],ecx
	?debug L 548
	jmp       @198
	?debug L 550
?live16400@448: ; EBX = a_level, ESI = &$mfcpfcia, EDI = &$eccpfcia
@197:
	cmp       bl,1
	jne       short @199
	?debug L 551
?live16400@464: ; ESI = &$mfcpfcia, EDI = &$eccpfcia
	push      0
	push      -2147483643
	lea       eax,dword ptr [ebp-12]
	push      eax
	lea       edx,dword ptr [ebp-16]
	push      edx
	lea       ecx,dword ptr [ebp-20]
	push      ecx
	lea       eax,dword ptr [ebp-24]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 552
	mov       edx,dword ptr [ebp-16]
	shr       edx,24
	and       edx,255
	mov       dword ptr [edi],edx
	?debug L 553
	jmp       short @198
	?debug L 555
?live16400@512: ; EBX = a_level, ESI = &$mfcpfcia, EDI = &$eccpfcia
@199:
	cmp       bl,2
	jne       short @200
	?debug L 556
?live16400@528: ; ESI = &$mfcpfcia, EDI = &$eccpfcia
	push      0
	push      -2147483642
	lea       ecx,dword ptr [ebp-12]
	push      ecx
	lea       eax,dword ptr [ebp-16]
	push      eax
	lea       edx,dword ptr [ebp-20]
	push      edx
	lea       ecx,dword ptr [ebp-24]
	push      ecx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 557
	mov       eax,dword ptr [ebp-16]
	shr       eax,16
	and       eax,65535
	mov       dword ptr [edi],eax
	?debug L 558
	jmp       short @198
	?debug L 560
?live16400@576: ; EBX = a_level, ESI = &$mfcpfcia, EDI = &$eccpfcia
@200:
	cmp       bl,3
	jne       short @201
	?debug L 561
?live16400@592: ; ESI = &$mfcpfcia, EDI = &$eccpfcia
	push      0
	push      -2147483642
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 562
	mov       ecx,dword ptr [ebp-12]
	shr       ecx,18
	and       ecx,16383
	shl       ecx,9
	mov       dword ptr [edi],ecx
	?debug L 565
@201:
@198:
@196:
@188:
	mov       eax,dword ptr [edi]
	?debug L 566
?live16400@640: ; ESI = &$mfcpfcia, EAX = r
	mov       dword ptr [esi],0
	mov       dword ptr [esi+4],0
	?debug L 568
?live16400@656: ; 
@202:
@174:
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	98
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
	dw	99
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
	dw	100
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
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	101
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	102
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	103
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	104
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mfcpfcia
	dw	0
	dw	4102
	dw	0
	dw	105
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	106
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eccpfcia
	dw	0
	dw	117
	dw	0
	dw	107
	dw	0
	dw	0
	dw	0
?patch57	equ	@202-@@stk@cpu@cpu_cache_size$quc+7
?patch58	equ	0
?patch59	equ	@202-@@stk@cpu@cpu_cache_size$quc
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
$ejcpfcia	label	dword
	dd	-1
	align	4
$mmcpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_cache_line_size$quc	segment virtual
	align	2
@@stk@cpu@cpu_cache_line_size$quc	proc	near
?live16401@0:
	?debug L 571
@203:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 574
?live16401@16: ; ESI = &$mmcpfcia, EBX = a_level
	mov       eax,dword ptr [$ejcpfcia]
	cmp       eax,-1
	?debug L 571
?live16401@32: ; 
	push      ebx
	push      esi
	mov       esi,offset $mmcpfcia
	mov       ebx,dword ptr [ebp+8]
	?debug L 574
?live16401@48: ; ESI = &$mmcpfcia, EBX = a_level
	jne       @205
	?debug L 575
?live16401@64: ; EAX = @temp4
	jmp       short @207
	?debug L 577
?live16401@80: ; ESI = &$mmcpfcia, EBX = a_level
@206:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@207:
	cmp       dword ptr [esi+4],0
	jne       short @206
	cmp       dword ptr [esi],0
	jne       short @206
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       edx,dword ptr [ebp-8]
	mov       dword ptr [esi],edx
	mov       edx,dword ptr [ebp-4]
	mov       dword ptr [esi+4],edx
	jmp       short @210
@209:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@210:
	cmp       dword ptr [esi+4],0
	jne       short @213
	cmp       dword ptr [esi],0
@213:
	je        short @211
	mov       eax,dword ptr [esi]
	mov       edx,dword ptr [esi+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @214
	cmp       eax,dword ptr [ebp-8]
@214:
	setne     cl
	and       ecx,1
	jmp       short @212
@211:
	xor       ecx,ecx
@212:
	test      cl,cl
	jne       short @209
	?debug L 580
	push      12
	push      offset s@+13
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qqspxvt1xui
	cmp       edx,0
	jne       short @215
	cmp       eax,0
	jne       short @215
	?debug L 581
?live16401@112: ; ESI = &$mmcpfcia
	push      0
	push      4
	lea       eax,dword ptr [ebp-12]
	push      eax
	lea       edx,dword ptr [ebp-16]
	push      edx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 582
	mov       ecx,dword ptr [ebp-20]
	and       ecx,4095
	inc       ecx
	mov       dword ptr [$ejcpfcia],ecx
	?debug L 583
	jmp       @217
	?debug L 585
?live16401@160: ; ESI = &$mmcpfcia, EBX = a_level
@215:
	push      12
	push      offset s@+26
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qqspxvt1xui
	cmp       edx,0
	jne       @218
	cmp       eax,0
	jne       @218
	?debug L 586
	test      bl,bl
	jne       short @220
	?debug L 587
	push      0
	push      -2147483643
	lea       eax,dword ptr [ebp-12]
	push      eax
	lea       edx,dword ptr [ebp-16]
	push      edx
	lea       ecx,dword ptr [ebp-20]
	push      ecx
	lea       eax,dword ptr [ebp-24]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 588
	mov       edx,dword ptr [ebp-12]
	and       edx,255
	mov       dword ptr [$ejcpfcia],edx
	?debug L 590
@220:
	cmp       bl,1
	jne       short @221
	?debug L 591
	push      0
	push      -2147483643
	lea       ecx,dword ptr [ebp-12]
	push      ecx
	lea       eax,dword ptr [ebp-16]
	push      eax
	lea       edx,dword ptr [ebp-20]
	push      edx
	lea       ecx,dword ptr [ebp-24]
	push      ecx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 592
	mov       eax,dword ptr [ebp-16]
	and       eax,255
	mov       dword ptr [$ejcpfcia],eax
	?debug L 594
@221:
	cmp       bl,2
	jne       short @222
	?debug L 595
	push      0
	push      -2147483642
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 596
	mov       ecx,dword ptr [ebp-16]
	and       ecx,255
	mov       dword ptr [$ejcpfcia],ecx
	?debug L 598
@222:
	cmp       bl,3
	jne       short @223
	?debug L 599
?live16401@336: ; ESI = &$mmcpfcia
	push      0
	push      -2147483642
	lea       eax,dword ptr [ebp-12]
	push      eax
	lea       edx,dword ptr [ebp-16]
	push      edx
	lea       ecx,dword ptr [ebp-20]
	push      ecx
	lea       eax,dword ptr [ebp-24]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 600
	mov       edx,dword ptr [ebp-12]
	and       edx,255
	mov       dword ptr [$ejcpfcia],edx
	?debug L 603
@223:
@218:
@217:
	mov       eax,dword ptr [$ejcpfcia]
	?debug L 604
?live16401@384: ; ESI = &$mmcpfcia, EAX = r
	mov       dword ptr [esi],0
	mov       dword ptr [esi+4],0
	?debug L 607
?live16401@400: ; 
@224:
@205:
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	108
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
	dw	109
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
	dd	?live16401@64-?live16401@48
	dw	4
	dd	?live16401@80-@@stk@cpu@cpu_cache_line_size$quc
	dd	?live16401@112-?live16401@80
	dw	4
	dd	?live16401@160-@@stk@cpu@cpu_cache_line_size$quc
	dd	?live16401@336-?live16401@160
	dw	4
?patch68	equ	4
?patch67	equ	44
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	110
	dw	0
	dw	0
	dw	0
	dw	?patch69
	dw	529
	dw	?patch70
	dd	?live16401@384-@@stk@cpu@cpu_cache_line_size$quc
	dd	?live16401@400-?live16401@384
	dw	17
?patch70	equ	1
?patch69	equ	14
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	111
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	112
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	113
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	114
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mmcpfcia
	dw	0
	dw	4102
	dw	0
	dw	115
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	116
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ejcpfcia
	dw	0
	dw	117
	dw	0
	dw	117
	dw	0
	dw	0
	dw	0
?patch64	equ	@224-@@stk@cpu@cpu_cache_line_size$quc+6
?patch65	equ	0
?patch66	equ	@224-@@stk@cpu@cpu_cache_line_size$quc
	dw	2
	dw	6
	dw	8
	dw	531
	dw	5
	dw	65504
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eadpfcia	label	dword
	dd	0
	align	4
$mddpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_mhz$qo	segment virtual
	align	2
@@stk@cpu@cpu_num_mhz$qo	proc	near
?live16402@0:
	?debug L 610
@225:
	push      ebp
	mov       ebp,esp
	add       esp,-120
	push      ebx
	push      esi
	push      edi
	?debug L 613
	mov       eax,dword ptr [$eadpfcia]
	test      eax,eax
	je        short @229
	cmp       byte ptr [ebp+8],0
	je        @227
	?debug L 614
?live16402@32: ; EAX = @temp20
	jmp       short @229
	?debug L 616
?live16402@48: ; 
@228:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@229:
	cmp       dword ptr [$mddpfcia+4],0
	jne       short @228
	cmp       dword ptr [$mddpfcia],0
	jne       short @228
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       edx,dword ptr [ebp-8]
	mov       dword ptr [$mddpfcia],edx
	mov       edx,dword ptr [ebp-4]
	mov       dword ptr [$mddpfcia+4],edx
	jmp       short @232
@231:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@232:
	cmp       dword ptr [$mddpfcia+4],0
	jne       short @235
	cmp       dword ptr [$mddpfcia],0
@235:
	je        short @233
	mov       eax,dword ptr [$mddpfcia]
	mov       edx,dword ptr [$mddpfcia+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @236
	cmp       eax,dword ptr [ebp-8]
@236:
	setne     cl
	and       ecx,1
	jmp       short @234
@233:
	xor       ecx,ecx
@234:
	test      cl,cl
	jne       short @231
	?debug L 629
	xor       ebx,ebx
	lea       esi,dword ptr [ebp-120]
	?debug L 630
?live16402@80: ; EBX = i, ESI = @temp8
@237:
	call      @@stk@cpu@tsc_init$qv
	?debug L 631
	call      @@stk@cpu@tsc_start$qv
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-40],eax
	mov       dword ptr [ebp-36],edx
	call      @@stk@cpu@tsc_checkpoint$qv
	?debug L 632
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-80],eax
	mov       dword ptr [ebp-76],edx
	?debug L 633
@239:
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-48],eax
	mov       dword ptr [ebp-44],edx
	?debug L 634
	mov       eax,dword ptr [ebp-48]
	mov       edx,dword ptr [ebp-44]
	cmp       edx,dword ptr [ebp-36]
	jne       short @241
	cmp       eax,dword ptr [ebp-40]
@241:
	jbe       short @239
	?debug L 635
	call      @@stk@cpu@tsc_start$qv
	?debug L 636
@242:
	mov       edx,21
	?debug L 637
?live16402@192: ; EBX = i, EDX = trash1, ESI = @temp8
@243:
	xor       eax,eax
@245:
	inc       eax
	cmp       eax,1000000
	jb        short @245
	?debug L 636
	dec       edx
	test      edx,edx
	ja        short @243
	?debug L 640
?live16402@224: ; EBX = i, ESI = @temp8
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	?debug L 641
@249:
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-64],eax
	mov       dword ptr [ebp-60],edx
	?debug L 642
	mov       eax,dword ptr [ebp-64]
	mov       edx,dword ptr [ebp-60]
	cmp       edx,dword ptr [ebp-52]
	jne       short @251
	cmp       eax,dword ptr [ebp-56]
@251:
	jbe       short @249
	?debug L 643
	call      @@stk@cpu@tsc_checkpoint$qv
	?debug L 644
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-72],eax
	mov       dword ptr [ebp-68],edx
	?debug L 645
	mov       eax,dword ptr [ebp-64]
	mov       edx,dword ptr [ebp-60]
	sub       eax,dword ptr [ebp-48]
	sbb       edx,dword ptr [ebp-44]
	mov       dword ptr [ebp-32],eax
	mov       dword ptr [ebp-28],edx
	?debug L 646
	mov       eax,dword ptr [ebp-72]
	mov       edx,dword ptr [ebp-68]
	sub       eax,dword ptr [ebp-80]
	sbb       edx,dword ptr [ebp-76]
	mov       dword ptr [ebp-72],eax
	mov       dword ptr [ebp-68],edx
	?debug L 647
	push      0
	push      1000
	mov       eax,dword ptr [ebp-72]
	mov       edx,dword ptr [ebp-68]
	call      __llmul
	mov       dword ptr [ebp-72],eax
	mov       dword ptr [ebp-68],edx
	?debug L 648
	cmp       dword ptr [ebp-28],0
	jne       short @253
	cmp       dword ptr [ebp-32],0
@253:
	je        short @252
	push      dword ptr [ebp-28]
	push      dword ptr [ebp-32]
	mov       eax,dword ptr [ebp-72]
	mov       edx,dword ptr [ebp-68]
	call      __lludiv
	mov       dword ptr [ebp-72],eax
	mov       dword ptr [ebp-68],edx
	jmp       short @254
	?debug L 649
@252:
	mov       dword ptr [ebp-72],0
	mov       dword ptr [ebp-68],0
	?debug L 650
@254:
	mov       eax,dword ptr [ebp-72]
	mov       dword ptr [esi],eax
	mov       eax,dword ptr [ebp-68]
	mov       dword ptr [esi+4],eax
@255:
	inc       ebx
	add       esi,8
	cmp       ebx,5
	jb        @237
	?debug L 652
?live16402@400: ; 
	mov       edx,dword ptr [ebp-120]
	xor       edi,edi
	mov       dword ptr [ebp-16],edx
	xor       esi,esi
	mov       edx,dword ptr [ebp-116]
	xor       ebx,ebx
	mov       dword ptr [ebp-12],edx
	mov       ecx,dword ptr [ebp-120]
	mov       dword ptr [ebp-24],ecx
	mov       ecx,dword ptr [ebp-116]
	mov       dword ptr [ebp-20],ecx
	lea       ecx,dword ptr [ebp-120]
	?debug L 653
?live16402@416: ; EBX = i, ECX = @temp4, ESI = imax, EDI = imin
@257:
	mov       eax,dword ptr [ecx]
	mov       edx,dword ptr [ecx+4]
	cmp       edx,dword ptr [ebp-12]
	jne       short @260
	cmp       eax,dword ptr [ebp-16]
@260:
	jbe       short @259
	mov       eax,dword ptr [ecx]
	mov       esi,ebx
	mov       dword ptr [ebp-16],eax
	mov       eax,dword ptr [ecx+4]
	mov       dword ptr [ebp-12],eax
	?debug L 654
@259:
	mov       eax,dword ptr [ecx]
	mov       edx,dword ptr [ecx+4]
	cmp       edx,dword ptr [ebp-20]
	jne       short @262
	cmp       eax,dword ptr [ebp-24]
@262:
	jae       short @261
	mov       eax,dword ptr [ecx]
	mov       edi,ebx
	mov       dword ptr [ebp-24],eax
	mov       eax,dword ptr [ecx+4]
	mov       dword ptr [ebp-20],eax
@261:
	inc       ebx
	add       ecx,8
	cmp       ebx,5
	jb        short @257
	?debug L 656
?live16402@448: ; ESI = imax, EDI = imin
	mov       dword ptr [ebp-72],0
	mov       dword ptr [ebp-68],0
	xor       ebx,ebx
	lea       ecx,dword ptr [ebp-120]
@264:
	cmp       edi,ebx
	je        short @266
	cmp       esi,ebx
	je        short @266
	mov       eax,dword ptr [ecx]
	mov       edx,dword ptr [ecx+4]
	add       eax,dword ptr [ebp-72]
	adc       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-72],eax
	mov       dword ptr [ebp-68],edx
@266:
	inc       ebx
	add       ecx,8
	cmp       ebx,5
	jb        short @264
	?debug L 658
?live16402@464: ; 
	push      0
	push      1000000
	push      0
	push      3
	mov       eax,dword ptr [ebp-72]
	mov       edx,dword ptr [ebp-68]
	call      __lludiv
	call      __lludiv
	mov       dword ptr [ebp-72],eax
	mov       dword ptr [ebp-68],edx
	?debug L 659
	mov       eax,dword ptr [ebp-72]
	mov       ecx,eax
	mov       dword ptr [$eadpfcia],ecx
	?debug L 661
?live16402@496: ; ECX = @temp19
	mov       dword ptr [$mddpfcia],0
	mov       dword ptr [$mddpfcia+4],0
	?debug L 662
	mov       eax,ecx
	?debug L 663
?live16402@528: ; 
@268:
@227:
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	118
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
	dw	119
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65456
	dw	65535
	dw	119
	dw	0
	dw	120
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65464
	dw	65535
	dw	119
	dw	0
	dw	121
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65472
	dw	65535
	dw	119
	dw	0
	dw	122
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65480
	dw	65535
	dw	119
	dw	0
	dw	123
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65488
	dw	65535
	dw	119
	dw	0
	dw	124
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65496
	dw	65535
	dw	119
	dw	0
	dw	125
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65504
	dw	65535
	dw	119
	dw	0
	dw	126
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	20
	dw	127
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
	dw	24
	dw	128
	dw	0
	dw	0
	dw	0
	dw	?patch76
	dw	529
	dw	?patch77
	dd	?live16402@416-@@stk@cpu@cpu_num_mhz$qo
	dd	?live16402@464-?live16402@416
	dw	24
?patch77	equ	1
?patch76	equ	14
	dw	16
	dw	2
	dw	117
	dw	0
	dw	23
	dw	129
	dw	0
	dw	0
	dw	0
	dw	?patch78
	dw	529
	dw	?patch79
	dd	?live16402@416-@@stk@cpu@cpu_num_mhz$qo
	dd	?live16402@464-?live16402@416
	dw	23
?patch79	equ	1
?patch78	equ	14
	dw	18
	dw	512
	dw	65416
	dw	65535
	dw	4135
	dw	0
	dw	130
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	119
	dw	0
	dw	131
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	119
	dw	0
	dw	132
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mddpfcia
	dw	0
	dw	4102
	dw	0
	dw	133
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	134
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eadpfcia
	dw	0
	dw	117
	dw	0
	dw	135
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
	df	@242
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	17
	dw	136
	dw	0
	dw	0
	dw	0
	dw	16
	dw	2
	dw	117
	dw	0
	dw	19
	dw	137
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
?patch80	equ	@255-@242
	dw	2
	dw	6
?patch71	equ	@268-@@stk@cpu@cpu_num_mhz$qo+7
?patch72	equ	0
?patch73	equ	@268-@@stk@cpu@cpu_num_mhz$qo
	dw	2
	dw	6
	dw	8
	dw	531
	dw	7
	dw	65404
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehdpfcia	label	dword
	dd	-1
	align	4
$mkdpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_x87$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_x87$qv	proc	near
?live16403@0:
	?debug L 668
@269:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 671
?live16403@16: ; EBX = &$mkdpfcia
	mov       eax,dword ptr [$ehdpfcia]
	cmp       eax,-1
	?debug L 668
?live16403@32: ; 
	push      ebx
	mov       ebx,offset $mkdpfcia
	?debug L 671
?live16403@48: ; EBX = &$mkdpfcia
	je        short @273
	?debug L 672
?live16403@64: ; EAX = @temp2
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @271
	?debug L 674
?live16403@80: ; EBX = &$mkdpfcia
@272:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@273:
	cmp       dword ptr [ebx+4],0
	jne       short @272
	cmp       dword ptr [ebx],0
	jne       short @272
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @276
@275:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@276:
	cmp       dword ptr [ebx+4],0
	jne       short @279
	cmp       dword ptr [ebx],0
@279:
	je        short @277
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @280
	cmp       eax,dword ptr [ebp-8]
@280:
	setne     al
	and       eax,1
	jmp       short @278
@277:
	xor       eax,eax
@278:
	test      al,al
	jne       short @275
	?debug L 677
	push      0
	push      1
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 679
	test      byte ptr [ebp-12],1
	je        short @281
	?debug L 680
	mov       dword ptr [$ehdpfcia],1
	?debug L 681
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 682
?live16403@160: ; 
	mov       al,1
	jmp       short @271
	?debug L 686
?live16403@176: ; EBX = &$mkdpfcia
@281:
	push      0
	push      -2147483647
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 688
	test      byte ptr [ebp-12],1
	je        short @282
	?debug L 689
	mov       dword ptr [$ehdpfcia],1
	?debug L 690
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 691
?live16403@240: ; 
	mov       al,1
	jmp       short @271
	?debug L 693
?live16403@256: ; EBX = &$mkdpfcia
@282:
	xor       edx,edx
	?debug L 695
?live16403@272: ; 
	xor       eax,eax
	?debug L 693
?live16403@288: ; EBX = &$mkdpfcia
	mov       dword ptr [$ehdpfcia],edx
	?debug L 694
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 696
?live16403@320: ; 
@283:
@271:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	138
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
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	139
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	140
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	141
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	142
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mkdpfcia
	dw	0
	dw	4102
	dw	0
	dw	143
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	144
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ehdpfcia
	dw	0
	dw	117
	dw	0
	dw	145
	dw	0
	dw	0
	dw	0
?patch83	equ	@283-@@stk@cpu@cpu_has_x87$qv+5
?patch84	equ	0
?patch85	equ	@283-@@stk@cpu@cpu_has_x87$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eodpfcia	label	dword
	dd	-1
	align	4
$mbepfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_mmx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mmx$qv	proc	near
?live16404@0:
	?debug L 699
@284:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 702
?live16404@16: ; EBX = &$mbepfcia
	mov       eax,dword ptr [$eodpfcia]
	cmp       eax,-1
	?debug L 699
?live16404@32: ; 
	push      ebx
	mov       ebx,offset $mbepfcia
	?debug L 702
?live16404@48: ; EBX = &$mbepfcia
	je        short @288
	?debug L 703
?live16404@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @286
	?debug L 705
?live16404@80: ; EBX = &$mbepfcia
@287:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@288:
	cmp       dword ptr [ebx+4],0
	jne       short @287
	cmp       dword ptr [ebx],0
	jne       short @287
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @291
@290:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@291:
	cmp       dword ptr [ebx+4],0
	jne       short @294
	cmp       dword ptr [ebx],0
@294:
	je        short @292
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @295
	cmp       eax,dword ptr [ebp-8]
@295:
	setne     al
	and       eax,1
	jmp       short @293
@292:
	xor       eax,eax
@293:
	test      al,al
	jne       short @290
	?debug L 708
	push      0
	push      1
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 710
	mov       eax,dword ptr [ebp-12]
	?debug L 708
	add       esp,24
	?debug L 710
	and       eax,8388608
	?debug L 711
?live16404@160: ; EBX = &$mbepfcia, EAX = @temp3
	test      eax,eax
	?debug L 710
?live16404@176: ; EBX = &$mbepfcia
	mov       dword ptr [$eodpfcia],eax
	?debug L 711
?live16404@192: ; EBX = &$mbepfcia, EAX = @temp3
	setne     dl
	?debug L 712
?live16404@208: ; EBX = &$mbepfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 711
?live16404@224: ; EBX = &$mbepfcia, EAX = @temp3
	and       edx,1
	?debug L 712
?live16404@240: ; EBX = &$mbepfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 711
?live16404@256: ; EBX = &$mbepfcia, EAX = @temp3
	mov       eax,edx
	?debug L 714
?live16404@272: ; 
@296:
@286:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	146
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
	dw	147
	dw	0
	dw	0
	dw	0
	dw	?patch89
	dw	529
	dw	?patch90
	dd	?live16404@208-@@stk@cpu@cpu_has_mmx$qv
	dd	?live16404@224-?live16404@208
	dw	1
	dd	?live16404@240-@@stk@cpu@cpu_has_mmx$qv
	dd	?live16404@256-?live16404@240
	dw	1
?patch90	equ	2
?patch89	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	148
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	149
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	150
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	151
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mbepfcia
	dw	0
	dw	4102
	dw	0
	dw	152
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	153
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eodpfcia
	dw	0
	dw	117
	dw	0
	dw	154
	dw	0
	dw	0
	dw	0
?patch86	equ	@296-@@stk@cpu@cpu_has_mmx$qv+5
?patch87	equ	0
?patch88	equ	@296-@@stk@cpu@cpu_has_mmx$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$efepfcia	label	dword
	dd	-1
	align	4
$miepfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_mmxext$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mmxext$qv	proc	near
?live16405@0:
	?debug L 717
@297:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 720
?live16405@16: ; EBX = &$miepfcia
	mov       eax,dword ptr [$efepfcia]
	cmp       eax,-1
	?debug L 717
?live16405@32: ; 
	push      ebx
	mov       ebx,offset $miepfcia
	?debug L 720
?live16405@48: ; EBX = &$miepfcia
	je        short @301
	?debug L 721
?live16405@64: ; EAX = @temp5
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @299
	?debug L 723
?live16405@80: ; EBX = &$miepfcia
@300:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@301:
	cmp       dword ptr [ebx+4],0
	jne       short @300
	cmp       dword ptr [ebx],0
	jne       short @300
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @304
@303:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@304:
	cmp       dword ptr [ebx+4],0
	jne       short @307
	cmp       dword ptr [ebx],0
@307:
	je        short @305
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @308
	cmp       eax,dword ptr [ebp-8]
@308:
	setne     al
	and       eax,1
	jmp       short @306
@305:
	xor       eax,eax
@306:
	test      al,al
	jne       short @303
	?debug L 726
	push      0
	push      -2147483647
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 728
	mov       eax,dword ptr [ebp-12]
	and       eax,4194304
	mov       dword ptr [$efepfcia],eax
	?debug L 729
?live16405@128: ; EBX = &$miepfcia, EAX = @temp3
	test      eax,eax
	je        short @309
	?debug L 730
?live16405@144: ; 
	mov       al,1
	jmp       short @299
	?debug L 732
?live16405@160: ; EBX = &$miepfcia
@309:
	push      0
	push      1
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 734
	mov       eax,dword ptr [ebp-12]
	?debug L 732
	add       esp,24
	?debug L 734
	and       eax,33554432
	?debug L 735
?live16405@224: ; EBX = &$miepfcia, EAX = @temp4
	test      eax,eax
	?debug L 734
?live16405@240: ; EBX = &$miepfcia
	mov       dword ptr [$efepfcia],eax
	?debug L 735
?live16405@256: ; EBX = &$miepfcia, EAX = @temp4
	setne     dl
	?debug L 736
?live16405@272: ; EBX = &$miepfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 735
?live16405@288: ; EBX = &$miepfcia, EAX = @temp4
	and       edx,1
	?debug L 736
?live16405@304: ; EBX = &$miepfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 735
?live16405@320: ; EBX = &$miepfcia, EAX = @temp4
	mov       eax,edx
	?debug L 738
?live16405@336: ; 
@310:
@299:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	155
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
	dw	156
	dw	0
	dw	0
	dw	0
	dw	?patch94
	dw	529
	dw	?patch95
	dd	?live16405@272-@@stk@cpu@cpu_has_mmxext$qv
	dd	?live16405@288-?live16405@272
	dw	1
	dd	?live16405@304-@@stk@cpu@cpu_has_mmxext$qv
	dd	?live16405@320-?live16405@304
	dw	1
?patch95	equ	2
?patch94	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	157
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	158
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	159
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	160
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$miepfcia
	dw	0
	dw	4102
	dw	0
	dw	161
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	162
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$efepfcia
	dw	0
	dw	117
	dw	0
	dw	163
	dw	0
	dw	0
	dw	0
?patch91	equ	@310-@@stk@cpu@cpu_has_mmxext$qv+5
?patch92	equ	0
?patch93	equ	@310-@@stk@cpu@cpu_has_mmxext$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$emepfcia	label	dword
	dd	-1
	align	4
$mpepfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_amd64$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_amd64$qv	proc	near
?live16406@0:
	?debug L 741
@311:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 744
?live16406@16: ; EBX = &$mpepfcia
	mov       eax,dword ptr [$emepfcia]
	cmp       eax,-1
	?debug L 741
?live16406@32: ; 
	push      ebx
	mov       ebx,offset $mpepfcia
	?debug L 744
?live16406@48: ; EBX = &$mpepfcia
	je        short @315
	?debug L 745
?live16406@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @313
	?debug L 747
?live16406@80: ; EBX = &$mpepfcia
@314:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@315:
	cmp       dword ptr [ebx+4],0
	jne       short @314
	cmp       dword ptr [ebx],0
	jne       short @314
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @318
@317:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@318:
	cmp       dword ptr [ebx+4],0
	jne       short @321
	cmp       dword ptr [ebx],0
@321:
	je        short @319
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @322
	cmp       eax,dword ptr [ebp-8]
@322:
	setne     al
	and       eax,1
	jmp       short @320
@319:
	xor       eax,eax
@320:
	test      al,al
	jne       short @317
	?debug L 750
	push      0
	push      -2147483647
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 752
	mov       eax,dword ptr [ebp-12]
	?debug L 750
	add       esp,24
	?debug L 752
	and       eax,536870912
	?debug L 753
?live16406@160: ; EBX = &$mpepfcia, EAX = @temp3
	test      eax,eax
	?debug L 752
?live16406@176: ; EBX = &$mpepfcia
	mov       dword ptr [$emepfcia],eax
	?debug L 753
?live16406@192: ; EBX = &$mpepfcia, EAX = @temp3
	setne     dl
	?debug L 754
?live16406@208: ; EBX = &$mpepfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 753
?live16406@224: ; EBX = &$mpepfcia, EAX = @temp3
	and       edx,1
	?debug L 754
?live16406@240: ; EBX = &$mpepfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 753
?live16406@256: ; EBX = &$mpepfcia, EAX = @temp3
	mov       eax,edx
	?debug L 756
?live16406@272: ; 
@323:
@313:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	164
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
	dw	165
	dw	0
	dw	0
	dw	0
	dw	?patch99
	dw	529
	dw	?patch100
	dd	?live16406@208-@@stk@cpu@cpu_has_amd64$qv
	dd	?live16406@224-?live16406@208
	dw	1
	dd	?live16406@240-@@stk@cpu@cpu_has_amd64$qv
	dd	?live16406@256-?live16406@240
	dw	1
?patch100	equ	2
?patch99	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	166
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	167
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	168
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	169
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mpepfcia
	dw	0
	dw	4102
	dw	0
	dw	170
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	171
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$emepfcia
	dw	0
	dw	117
	dw	0
	dw	172
	dw	0
	dw	0
	dw	0
?patch96	equ	@323-@@stk@cpu@cpu_has_amd64$qv+5
?patch97	equ	0
?patch98	equ	@323-@@stk@cpu@cpu_has_amd64$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$edfpfcia	label	dword
	dd	-1
	align	4
$mgfpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_ht$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_ht$qv	proc	near
?live16407@0:
	?debug L 759
@324:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 762
?live16407@16: ; EBX = &$mgfpfcia
	mov       eax,dword ptr [$edfpfcia]
	cmp       eax,-1
	?debug L 759
?live16407@32: ; 
	push      ebx
	mov       ebx,offset $mgfpfcia
	?debug L 762
?live16407@48: ; EBX = &$mgfpfcia
	je        short @328
	?debug L 763
?live16407@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @326
	?debug L 765
?live16407@80: ; EBX = &$mgfpfcia
@327:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@328:
	cmp       dword ptr [ebx+4],0
	jne       short @327
	cmp       dword ptr [ebx],0
	jne       short @327
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @331
@330:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@331:
	cmp       dword ptr [ebx+4],0
	jne       short @334
	cmp       dword ptr [ebx],0
@334:
	je        short @332
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @335
	cmp       eax,dword ptr [ebp-8]
@335:
	setne     al
	and       eax,1
	jmp       short @333
@332:
	xor       eax,eax
@333:
	test      al,al
	jne       short @330
	?debug L 768
	push      0
	push      1
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 770
	mov       eax,dword ptr [ebp-12]
	?debug L 768
	add       esp,24
	?debug L 770
	and       eax,268435456
	?debug L 771
?live16407@160: ; EBX = &$mgfpfcia, EAX = @temp3
	test      eax,eax
	?debug L 770
?live16407@176: ; EBX = &$mgfpfcia
	mov       dword ptr [$edfpfcia],eax
	?debug L 771
?live16407@192: ; EBX = &$mgfpfcia, EAX = @temp3
	setne     dl
	?debug L 772
?live16407@208: ; EBX = &$mgfpfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 771
?live16407@224: ; EBX = &$mgfpfcia, EAX = @temp3
	and       edx,1
	?debug L 772
?live16407@240: ; EBX = &$mgfpfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 771
?live16407@256: ; EBX = &$mgfpfcia, EAX = @temp3
	mov       eax,edx
	?debug L 774
?live16407@272: ; 
@336:
@326:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	173
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
	dw	174
	dw	0
	dw	0
	dw	0
	dw	?patch104
	dw	529
	dw	?patch105
	dd	?live16407@208-@@stk@cpu@cpu_has_ht$qv
	dd	?live16407@224-?live16407@208
	dw	1
	dd	?live16407@240-@@stk@cpu@cpu_has_ht$qv
	dd	?live16407@256-?live16407@240
	dw	1
?patch105	equ	2
?patch104	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	175
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	176
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	177
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	178
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mgfpfcia
	dw	0
	dw	4102
	dw	0
	dw	179
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	180
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$edfpfcia
	dw	0
	dw	117
	dw	0
	dw	181
	dw	0
	dw	0
	dw	0
?patch101	equ	@336-@@stk@cpu@cpu_has_ht$qv+5
?patch102	equ	0
?patch103	equ	@336-@@stk@cpu@cpu_has_ht$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ekfpfcia	label	dword
	dd	-1
	align	4
$mnfpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sse$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sse$qv	proc	near
?live16408@0:
	?debug L 777
@337:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	push      ebx
	push      esi
	mov       ebx,offset $mnfpfcia
	mov       esi,offset $ekfpfcia
	?debug L 780
?live16408@16: ; EBX = &$mnfpfcia, ESI = &$ekfpfcia
	mov       eax,dword ptr [esi]
	cmp       eax,-1
	jne       @339
	?debug L 781
?live16408@32: ; EAX = @temp3, ESI = &$ekfpfcia
	jmp       short @341
	?debug L 783
?live16408@48: ; EBX = &$mnfpfcia, ESI = &$ekfpfcia
@340:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@341:
	cmp       dword ptr [ebx+4],0
	jne       short @340
	cmp       dword ptr [ebx],0
	jne       short @340
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       edx,dword ptr [ebp-8]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],edx
	jmp       short @344
@343:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@344:
	cmp       dword ptr [ebx+4],0
	jne       short @347
	cmp       dword ptr [ebx],0
@347:
	je        short @345
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @348
	cmp       eax,dword ptr [ebp-8]
@348:
	setne     cl
	and       ecx,1
	jmp       short @346
@345:
	xor       ecx,ecx
@346:
	test      cl,cl
	jne       short @343
	?debug L 786
	push      0
	push      1
	lea       eax,dword ptr [ebp-12]
	push      eax
	lea       edx,dword ptr [ebp-16]
	push      edx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 788
	test      byte ptr [ebp-14],16
	je        short @349
	?debug L 789
	mov       dword ptr [esi],42
	jmp       short @350
	?debug L 791
@349:
	test      byte ptr [ebp-14],8
	je        short @351
	?debug L 792
	mov       dword ptr [esi],41
	jmp       short @350
	?debug L 794
@351:
	test      byte ptr [ebp-15],2
	je        short @352
	?debug L 795
	mov       dword ptr [esi],31
	jmp       short @350
	?debug L 797
@352:
	test      byte ptr [ebp-16],1
	je        short @353
	?debug L 798
	mov       dword ptr [esi],30
	jmp       short @350
	?debug L 800
@353:
	test      byte ptr [ebp-9],4
	je        short @354
	?debug L 801
	mov       dword ptr [esi],20
	jmp       short @350
	?debug L 803
@354:
	test      byte ptr [ebp-9],2
	je        short @355
	?debug L 804
	mov       dword ptr [esi],10
	jmp       short @350
	?debug L 806
@355:
	xor       ecx,ecx
	mov       dword ptr [esi],ecx
	?debug L 807
@350:
	cmp       dword ptr [esi],0
	?debug L 808
?live16408@304: ; EBX = &$mnfpfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 807
?live16408@320: ; EBX = &$mnfpfcia, ESI = &$ekfpfcia
	setne     al
	and       eax,1
	?debug L 809
?live16408@336: ; EAX = r
	xor       edx,edx
	mov       dl,al
	?debug L 808
?live16408@352: ; EBX = &$mnfpfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 809
?live16408@368: ; EAX = r
	mov       eax,edx
	?debug L 810
?live16408@384: ; 
@356:
@339:
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	182
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
	dw	183
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
	dd	?live16408@384-?live16408@336
	dw	1
?patch110	equ	2
?patch109	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	184
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	185
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	186
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	187
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mnfpfcia
	dw	0
	dw	4102
	dw	0
	dw	188
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	189
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ekfpfcia
	dw	0
	dw	117
	dw	0
	dw	190
	dw	0
	dw	0
	dw	0
?patch106	equ	@356-@@stk@cpu@cpu_has_sse$qv+6
?patch107	equ	0
?patch108	equ	@356-@@stk@cpu@cpu_has_sse$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	5
	dw	65504
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ebgpfcia	label	dword
	dd	-1
	align	4
$megpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sse4a$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sse4a$qv	proc	near
?live16409@0:
	?debug L 813
@357:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 816
?live16409@16: ; EBX = &$megpfcia
	mov       eax,dword ptr [$ebgpfcia]
	cmp       eax,-1
	?debug L 813
?live16409@32: ; 
	push      ebx
	mov       ebx,offset $megpfcia
	?debug L 816
?live16409@48: ; EBX = &$megpfcia
	je        short @361
	?debug L 817
?live16409@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @359
	?debug L 819
?live16409@80: ; EBX = &$megpfcia
@360:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@361:
	cmp       dword ptr [ebx+4],0
	jne       short @360
	cmp       dword ptr [ebx],0
	jne       short @360
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @364
@363:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@364:
	cmp       dword ptr [ebx+4],0
	jne       short @367
	cmp       dword ptr [ebx],0
@367:
	je        short @365
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @368
	cmp       eax,dword ptr [ebp-8]
@368:
	setne     al
	and       eax,1
	jmp       short @366
@365:
	xor       eax,eax
@366:
	test      al,al
	jne       short @363
	?debug L 822
	push      0
	push      -2147483647
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 824
	mov       eax,dword ptr [ebp-16]
	?debug L 822
	add       esp,24
	?debug L 824
	and       eax,64
	?debug L 825
?live16409@160: ; EBX = &$megpfcia, EAX = @temp3
	test      eax,eax
	?debug L 824
?live16409@176: ; EBX = &$megpfcia
	mov       dword ptr [$ebgpfcia],eax
	?debug L 825
?live16409@192: ; EBX = &$megpfcia, EAX = @temp3
	setne     dl
	?debug L 826
?live16409@208: ; EBX = &$megpfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 825
?live16409@224: ; EBX = &$megpfcia, EAX = @temp3
	and       edx,1
	?debug L 826
?live16409@240: ; EBX = &$megpfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 825
?live16409@256: ; EBX = &$megpfcia, EAX = @temp3
	mov       eax,edx
	?debug L 828
?live16409@272: ; 
@369:
@359:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	191
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
	dw	192
	dw	0
	dw	0
	dw	0
	dw	?patch114
	dw	529
	dw	?patch115
	dd	?live16409@208-@@stk@cpu@cpu_has_sse4a$qv
	dd	?live16409@224-?live16409@208
	dw	1
	dd	?live16409@240-@@stk@cpu@cpu_has_sse4a$qv
	dd	?live16409@256-?live16409@240
	dw	1
?patch115	equ	2
?patch114	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	193
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	194
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	195
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	196
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$megpfcia
	dw	0
	dw	4102
	dw	0
	dw	197
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	198
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ebgpfcia
	dw	0
	dw	117
	dw	0
	dw	199
	dw	0
	dw	0
	dw	0
?patch111	equ	@369-@@stk@cpu@cpu_has_sse4a$qv+5
?patch112	equ	0
?patch113	equ	@369-@@stk@cpu@cpu_has_sse4a$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eigpfcia	label	dword
	dd	-1
	align	4
$mlgpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx$qv	proc	near
?live16410@0:
	?debug L 831
@370:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 834
?live16410@16: ; EBX = &$mlgpfcia
	mov       eax,dword ptr [$eigpfcia]
	cmp       eax,-1
	?debug L 831
?live16410@32: ; 
	push      ebx
	mov       ebx,offset $mlgpfcia
	?debug L 834
?live16410@48: ; EBX = &$mlgpfcia
	jne       @372
	?debug L 835
?live16410@64: ; EAX = @temp3
	jmp       short @374
	?debug L 837
?live16410@80: ; EBX = &$mlgpfcia
@373:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@374:
	cmp       dword ptr [ebx+4],0
	jne       short @373
	cmp       dword ptr [ebx],0
	jne       short @373
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       edx,dword ptr [ebp-8]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],edx
	jmp       short @377
@376:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@377:
	cmp       dword ptr [ebx+4],0
	jne       short @380
	cmp       dword ptr [ebx],0
@380:
	je        short @378
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @381
	cmp       eax,dword ptr [ebp-8]
@381:
	setne     cl
	and       ecx,1
	jmp       short @379
@378:
	xor       ecx,ecx
@379:
	test      cl,cl
	jne       short @376
	?debug L 840
	push      0
	push      1
	lea       eax,dword ptr [ebp-12]
	push      eax
	lea       edx,dword ptr [ebp-16]
	push      edx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 842
	test      byte ptr [ebp-13],16
	je        short @382
	?debug L 843
	push      0
	push      7
	lea       ecx,dword ptr [ebp-12]
	push      ecx
	lea       eax,dword ptr [ebp-16]
	push      eax
	lea       edx,dword ptr [ebp-20]
	push      edx
	lea       ecx,dword ptr [ebp-24]
	push      ecx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 844
	test      byte ptr [ebp-20],32
	je        short @383
	?debug L 845
	mov       dword ptr [$eigpfcia],2
	jmp       short @384
	?debug L 847
@383:
	mov       dword ptr [$eigpfcia],1
	?debug L 848
	jmp       short @384
	?debug L 850
@382:
	xor       eax,eax
	mov       dword ptr [$eigpfcia],eax
	?debug L 852
@384:
	cmp       dword ptr [$eigpfcia],0
	?debug L 853
?live16410@240: ; EBX = &$mlgpfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 852
?live16410@256: ; EBX = &$mlgpfcia
	setne     al
	and       eax,1
	?debug L 854
?live16410@272: ; EAX = r
	xor       edx,edx
	mov       dl,al
	?debug L 853
?live16410@288: ; EBX = &$mlgpfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 854
?live16410@304: ; EAX = r
	mov       eax,edx
	?debug L 855
?live16410@320: ; 
@385:
@372:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	200
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
	dw	201
	dw	0
	dw	0
	dw	0
	dw	?patch119
	dw	529
	dw	?patch120
	dd	?live16410@240-@@stk@cpu@cpu_has_avx$qv
	dd	?live16410@256-?live16410@240
	dw	1
	dd	?live16410@272-@@stk@cpu@cpu_has_avx$qv
	dd	?live16410@320-?live16410@272
	dw	1
?patch120	equ	2
?patch119	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	202
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	203
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	204
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	205
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mlgpfcia
	dw	0
	dw	4102
	dw	0
	dw	206
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	207
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eigpfcia
	dw	0
	dw	117
	dw	0
	dw	208
	dw	0
	dw	0
	dw	0
?patch116	equ	@385-@@stk@cpu@cpu_has_avx$qv+5
?patch117	equ	0
?patch118	equ	@385-@@stk@cpu@cpu_has_avx$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epgpfcia	label	dword
	dd	-1
	align	4
$mchpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_popcnt$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_popcnt$qv	proc	near
?live16411@0:
	?debug L 858
@386:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 861
?live16411@16: ; EBX = &$mchpfcia
	mov       eax,dword ptr [$epgpfcia]
	cmp       eax,-1
	?debug L 858
?live16411@32: ; 
	push      ebx
	mov       ebx,offset $mchpfcia
	?debug L 861
?live16411@48: ; EBX = &$mchpfcia
	je        short @390
	?debug L 862
?live16411@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @388
	?debug L 864
?live16411@80: ; EBX = &$mchpfcia
@389:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@390:
	cmp       dword ptr [ebx+4],0
	jne       short @389
	cmp       dword ptr [ebx],0
	jne       short @389
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @393
@392:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@393:
	cmp       dword ptr [ebx+4],0
	jne       short @396
	cmp       dword ptr [ebx],0
@396:
	je        short @394
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @397
	cmp       eax,dword ptr [ebp-8]
@397:
	setne     al
	and       eax,1
	jmp       short @395
@394:
	xor       eax,eax
@395:
	test      al,al
	jne       short @392
	?debug L 867
	push      0
	push      1
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 869
	mov       eax,dword ptr [ebp-16]
	?debug L 867
	add       esp,24
	?debug L 869
	and       eax,8388608
	?debug L 870
?live16411@160: ; EBX = &$mchpfcia, EAX = @temp3
	test      eax,eax
	?debug L 869
?live16411@176: ; EBX = &$mchpfcia
	mov       dword ptr [$epgpfcia],eax
	?debug L 870
?live16411@192: ; EBX = &$mchpfcia, EAX = @temp3
	setne     dl
	?debug L 871
?live16411@208: ; EBX = &$mchpfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 870
?live16411@224: ; EBX = &$mchpfcia, EAX = @temp3
	and       edx,1
	?debug L 871
?live16411@240: ; EBX = &$mchpfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 870
?live16411@256: ; EBX = &$mchpfcia, EAX = @temp3
	mov       eax,edx
	?debug L 873
?live16411@272: ; 
@398:
@388:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	209
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
	dw	210
	dw	0
	dw	0
	dw	0
	dw	?patch124
	dw	529
	dw	?patch125
	dd	?live16411@208-@@stk@cpu@cpu_has_popcnt$qv
	dd	?live16411@224-?live16411@208
	dw	1
	dd	?live16411@240-@@stk@cpu@cpu_has_popcnt$qv
	dd	?live16411@256-?live16411@240
	dw	1
?patch125	equ	2
?patch124	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	211
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	212
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	213
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	214
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mchpfcia
	dw	0
	dw	4102
	dw	0
	dw	215
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	216
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$epgpfcia
	dw	0
	dw	117
	dw	0
	dw	217
	dw	0
	dw	0
	dw	0
?patch121	equ	@398-@@stk@cpu@cpu_has_popcnt$qv+5
?patch122	equ	0
?patch123	equ	@398-@@stk@cpu@cpu_has_popcnt$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eghpfcia	label	dword
	dd	-1
	align	4
$mjhpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_f16c$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_f16c$qv	proc	near
?live16412@0:
	?debug L 876
@399:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 879
?live16412@16: ; EBX = &$mjhpfcia
	mov       eax,dword ptr [$eghpfcia]
	cmp       eax,-1
	?debug L 876
?live16412@32: ; 
	push      ebx
	mov       ebx,offset $mjhpfcia
	?debug L 879
?live16412@48: ; EBX = &$mjhpfcia
	je        short @403
	?debug L 880
?live16412@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @401
	?debug L 882
?live16412@80: ; EBX = &$mjhpfcia
@402:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@403:
	cmp       dword ptr [ebx+4],0
	jne       short @402
	cmp       dword ptr [ebx],0
	jne       short @402
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @406
@405:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@406:
	cmp       dword ptr [ebx+4],0
	jne       short @409
	cmp       dword ptr [ebx],0
@409:
	je        short @407
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @410
	cmp       eax,dword ptr [ebp-8]
@410:
	setne     al
	and       eax,1
	jmp       short @408
@407:
	xor       eax,eax
@408:
	test      al,al
	jne       short @405
	?debug L 885
	push      0
	push      1
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 887
	mov       eax,dword ptr [ebp-16]
	?debug L 885
	add       esp,24
	?debug L 887
	and       eax,536870912
	?debug L 888
?live16412@160: ; EBX = &$mjhpfcia, EAX = @temp3
	test      eax,eax
	?debug L 887
?live16412@176: ; EBX = &$mjhpfcia
	mov       dword ptr [$eghpfcia],eax
	?debug L 888
?live16412@192: ; EBX = &$mjhpfcia, EAX = @temp3
	setne     dl
	?debug L 889
?live16412@208: ; EBX = &$mjhpfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 888
?live16412@224: ; EBX = &$mjhpfcia, EAX = @temp3
	and       edx,1
	?debug L 889
?live16412@240: ; EBX = &$mjhpfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 888
?live16412@256: ; EBX = &$mjhpfcia, EAX = @temp3
	mov       eax,edx
	?debug L 891
?live16412@272: ; 
@411:
@401:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	218
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
	dw	219
	dw	0
	dw	0
	dw	0
	dw	?patch129
	dw	529
	dw	?patch130
	dd	?live16412@208-@@stk@cpu@cpu_has_f16c$qv
	dd	?live16412@224-?live16412@208
	dw	1
	dd	?live16412@240-@@stk@cpu@cpu_has_f16c$qv
	dd	?live16412@256-?live16412@240
	dw	1
?patch130	equ	2
?patch129	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	220
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	221
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	222
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	223
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mjhpfcia
	dw	0
	dw	4102
	dw	0
	dw	224
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	225
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eghpfcia
	dw	0
	dw	117
	dw	0
	dw	226
	dw	0
	dw	0
	dw	0
?patch126	equ	@411-@@stk@cpu@cpu_has_f16c$qv+5
?patch127	equ	0
?patch128	equ	@411-@@stk@cpu@cpu_has_f16c$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$enhpfcia	label	dword
	dd	-1
	align	4
$maipfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_cmpxchg$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_cmpxchg$qv	proc	near
?live16413@0:
	?debug L 894
@412:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 897
?live16413@16: ; EBX = &$maipfcia
	mov       eax,dword ptr [$enhpfcia]
	cmp       eax,-1
	?debug L 894
?live16413@32: ; 
	push      ebx
	mov       ebx,offset $maipfcia
	?debug L 897
?live16413@48: ; EBX = &$maipfcia
	jne       @414
	?debug L 898
?live16413@64: ; EAX = @temp2
	jmp       short @416
	?debug L 900
?live16413@80: ; EBX = &$maipfcia
@415:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@416:
	cmp       dword ptr [ebx+4],0
	jne       short @415
	cmp       dword ptr [ebx],0
	jne       short @415
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       edx,dword ptr [ebp-8]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],edx
	jmp       short @419
@418:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@419:
	cmp       dword ptr [ebx+4],0
	jne       short @422
	cmp       dword ptr [ebx],0
@422:
	je        short @420
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @423
	cmp       eax,dword ptr [ebp-8]
@423:
	setne     cl
	and       ecx,1
	jmp       short @421
@420:
	xor       ecx,ecx
@421:
	test      cl,cl
	jne       short @418
	?debug L 903
	push      0
	push      1
	lea       eax,dword ptr [ebp-12]
	push      eax
	lea       edx,dword ptr [ebp-16]
	push      edx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 905
	test      byte ptr [ebp-15],32
	je        short @424
	?debug L 906
	mov       dword ptr [$enhpfcia],16
	?debug L 907
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 908
?live16413@160: ; 
	mov       eax,16
	jmp       @414
	?debug L 910
?live16413@176: ; EBX = &$maipfcia
@424:
	test      byte ptr [ebp-11],1
	je        short @425
	?debug L 911
	mov       dword ptr [$enhpfcia],8
	?debug L 912
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 913
?live16413@224: ; 
	mov       eax,8
	jmp       short @414
	?debug L 917
?live16413@240: ; EBX = &$maipfcia
@425:
	push      0
	push      -2147483647
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 919
	test      byte ptr [ebp-11],1
	je        short @426
	?debug L 920
	mov       dword ptr [$enhpfcia],8
	?debug L 921
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 922
?live16413@304: ; 
	mov       eax,8
	jmp       short @414
	?debug L 924
?live16413@320: ; EBX = &$maipfcia
@426:
	mov       dword ptr [$enhpfcia],1
	?debug L 925
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 926
?live16413@352: ; 
	mov       eax,1
	?debug L 927
@427:
@414:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	227
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
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	228
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	229
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	230
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	231
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$maipfcia
	dw	0
	dw	4102
	dw	0
	dw	232
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	233
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$enhpfcia
	dw	0
	dw	117
	dw	0
	dw	234
	dw	0
	dw	0
	dw	0
?patch131	equ	@427-@@stk@cpu@cpu_has_cmpxchg$qv+5
?patch132	equ	0
?patch133	equ	@427-@@stk@cpu@cpu_has_cmpxchg$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eeipfcia	label	dword
	dd	-1
	align	4
$mhipfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_vmx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_vmx$qv	proc	near
?live16414@0:
	?debug L 930
@428:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 933
?live16414@16: ; EBX = &$mhipfcia
	mov       eax,dword ptr [$eeipfcia]
	cmp       eax,-1
	?debug L 930
?live16414@32: ; 
	push      ebx
	mov       ebx,offset $mhipfcia
	?debug L 933
?live16414@48: ; EBX = &$mhipfcia
	je        short @432
	?debug L 934
?live16414@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @430
	?debug L 936
?live16414@80: ; EBX = &$mhipfcia
@431:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@432:
	cmp       dword ptr [ebx+4],0
	jne       short @431
	cmp       dword ptr [ebx],0
	jne       short @431
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @435
@434:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@435:
	cmp       dword ptr [ebx+4],0
	jne       short @438
	cmp       dword ptr [ebx],0
@438:
	je        short @436
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @439
	cmp       eax,dword ptr [ebp-8]
@439:
	setne     al
	and       eax,1
	jmp       short @437
@436:
	xor       eax,eax
@437:
	test      al,al
	jne       short @434
	?debug L 939
	push      0
	push      1
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 941
	mov       eax,dword ptr [ebp-16]
	?debug L 939
	add       esp,24
	?debug L 941
	and       eax,32
	?debug L 942
?live16414@160: ; EBX = &$mhipfcia, EAX = @temp3
	test      eax,eax
	?debug L 941
?live16414@176: ; EBX = &$mhipfcia
	mov       dword ptr [$eeipfcia],eax
	?debug L 942
?live16414@192: ; EBX = &$mhipfcia, EAX = @temp3
	setne     dl
	?debug L 943
?live16414@208: ; EBX = &$mhipfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 942
?live16414@224: ; EBX = &$mhipfcia, EAX = @temp3
	and       edx,1
	?debug L 943
?live16414@240: ; EBX = &$mhipfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 942
?live16414@256: ; EBX = &$mhipfcia, EAX = @temp3
	mov       eax,edx
	?debug L 945
?live16414@272: ; 
@440:
@430:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	235
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
	dw	236
	dw	0
	dw	0
	dw	0
	dw	?patch137
	dw	529
	dw	?patch138
	dd	?live16414@208-@@stk@cpu@cpu_has_vmx$qv
	dd	?live16414@224-?live16414@208
	dw	1
	dd	?live16414@240-@@stk@cpu@cpu_has_vmx$qv
	dd	?live16414@256-?live16414@240
	dw	1
?patch138	equ	2
?patch137	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	237
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	238
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	239
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	240
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mhipfcia
	dw	0
	dw	4102
	dw	0
	dw	241
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	242
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eeipfcia
	dw	0
	dw	117
	dw	0
	dw	243
	dw	0
	dw	0
	dw	0
?patch134	equ	@440-@@stk@cpu@cpu_has_vmx$qv+5
?patch135	equ	0
?patch136	equ	@440-@@stk@cpu@cpu_has_vmx$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$elipfcia	label	dword
	dd	-1
	align	4
$moipfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_smx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_smx$qv	proc	near
?live16415@0:
	?debug L 948
@441:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 951
?live16415@16: ; EBX = &$moipfcia
	mov       eax,dword ptr [$elipfcia]
	cmp       eax,-1
	?debug L 948
?live16415@32: ; 
	push      ebx
	mov       ebx,offset $moipfcia
	?debug L 951
?live16415@48: ; EBX = &$moipfcia
	je        short @445
	?debug L 952
?live16415@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @443
	?debug L 954
?live16415@80: ; EBX = &$moipfcia
@444:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@445:
	cmp       dword ptr [ebx+4],0
	jne       short @444
	cmp       dword ptr [ebx],0
	jne       short @444
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @448
@447:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@448:
	cmp       dword ptr [ebx+4],0
	jne       short @451
	cmp       dword ptr [ebx],0
@451:
	je        short @449
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @452
	cmp       eax,dword ptr [ebp-8]
@452:
	setne     al
	and       eax,1
	jmp       short @450
@449:
	xor       eax,eax
@450:
	test      al,al
	jne       short @447
	?debug L 957
	push      0
	push      1
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 959
	mov       eax,dword ptr [ebp-16]
	?debug L 957
	add       esp,24
	?debug L 959
	and       eax,64
	?debug L 960
?live16415@160: ; EBX = &$moipfcia, EAX = @temp3
	test      eax,eax
	?debug L 959
?live16415@176: ; EBX = &$moipfcia
	mov       dword ptr [$elipfcia],eax
	?debug L 960
?live16415@192: ; EBX = &$moipfcia, EAX = @temp3
	setne     dl
	?debug L 961
?live16415@208: ; EBX = &$moipfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 960
?live16415@224: ; EBX = &$moipfcia, EAX = @temp3
	and       edx,1
	?debug L 961
?live16415@240: ; EBX = &$moipfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 960
?live16415@256: ; EBX = &$moipfcia, EAX = @temp3
	mov       eax,edx
	?debug L 963
?live16415@272: ; 
@453:
@443:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	245
	dw	0
	dw	0
	dw	0
	dw	?patch142
	dw	529
	dw	?patch143
	dd	?live16415@208-@@stk@cpu@cpu_has_smx$qv
	dd	?live16415@224-?live16415@208
	dw	1
	dd	?live16415@240-@@stk@cpu@cpu_has_smx$qv
	dd	?live16415@256-?live16415@240
	dw	1
?patch143	equ	2
?patch142	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	246
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	247
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	248
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	249
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$moipfcia
	dw	0
	dw	4102
	dw	0
	dw	250
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	251
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$elipfcia
	dw	0
	dw	117
	dw	0
	dw	252
	dw	0
	dw	0
	dw	0
?patch139	equ	@453-@@stk@cpu@cpu_has_smx$qv+5
?patch140	equ	0
?patch141	equ	@453-@@stk@cpu@cpu_has_smx$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ecjpfcia	label	dword
	dd	-1
	align	4
$mfjpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_cmov$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_cmov$qv	proc	near
?live16416@0:
	?debug L 966
@454:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 969
?live16416@16: ; EBX = &$mfjpfcia
	mov       eax,dword ptr [$ecjpfcia]
	cmp       eax,-1
	?debug L 966
?live16416@32: ; 
	push      ebx
	mov       ebx,offset $mfjpfcia
	?debug L 969
?live16416@48: ; EBX = &$mfjpfcia
	je        short @458
	?debug L 970
?live16416@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @456
	?debug L 972
?live16416@80: ; EBX = &$mfjpfcia
@457:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@458:
	cmp       dword ptr [ebx+4],0
	jne       short @457
	cmp       dword ptr [ebx],0
	jne       short @457
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @461
@460:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@461:
	cmp       dword ptr [ebx+4],0
	jne       short @464
	cmp       dword ptr [ebx],0
@464:
	je        short @462
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @465
	cmp       eax,dword ptr [ebp-8]
@465:
	setne     al
	and       eax,1
	jmp       short @463
@462:
	xor       eax,eax
@463:
	test      al,al
	jne       short @460
	?debug L 975
	push      0
	push      1
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 977
	mov       eax,dword ptr [ebp-12]
	?debug L 975
	add       esp,24
	?debug L 977
	and       eax,32768
	?debug L 978
?live16416@160: ; EBX = &$mfjpfcia, EAX = @temp3
	test      eax,eax
	?debug L 977
?live16416@176: ; EBX = &$mfjpfcia
	mov       dword ptr [$ecjpfcia],eax
	?debug L 978
?live16416@192: ; EBX = &$mfjpfcia, EAX = @temp3
	setne     dl
	?debug L 979
?live16416@208: ; EBX = &$mfjpfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 978
?live16416@224: ; EBX = &$mfjpfcia, EAX = @temp3
	and       edx,1
	?debug L 979
?live16416@240: ; EBX = &$mfjpfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 978
?live16416@256: ; EBX = &$mfjpfcia, EAX = @temp3
	mov       eax,edx
	?debug L 981
?live16416@272: ; 
@466:
@456:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	253
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
	dw	254
	dw	0
	dw	0
	dw	0
	dw	?patch147
	dw	529
	dw	?patch148
	dd	?live16416@208-@@stk@cpu@cpu_has_cmov$qv
	dd	?live16416@224-?live16416@208
	dw	1
	dd	?live16416@240-@@stk@cpu@cpu_has_cmov$qv
	dd	?live16416@256-?live16416@240
	dw	1
?patch148	equ	2
?patch147	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	255
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	256
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	257
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	258
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mfjpfcia
	dw	0
	dw	4102
	dw	0
	dw	259
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	260
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ecjpfcia
	dw	0
	dw	117
	dw	0
	dw	261
	dw	0
	dw	0
	dw	0
?patch144	equ	@466-@@stk@cpu@cpu_has_cmov$qv+5
?patch145	equ	0
?patch146	equ	@466-@@stk@cpu@cpu_has_cmov$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ejjpfcia	label	dword
	dd	-1
	align	4
$mmjpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_movbe$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_movbe$qv	proc	near
?live16417@0:
	?debug L 984
@467:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 987
?live16417@16: ; EBX = &$mmjpfcia
	mov       eax,dword ptr [$ejjpfcia]
	cmp       eax,-1
	?debug L 984
?live16417@32: ; 
	push      ebx
	mov       ebx,offset $mmjpfcia
	?debug L 987
?live16417@48: ; EBX = &$mmjpfcia
	je        short @471
	?debug L 988
?live16417@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @469
	?debug L 990
?live16417@80: ; EBX = &$mmjpfcia
@470:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@471:
	cmp       dword ptr [ebx+4],0
	jne       short @470
	cmp       dword ptr [ebx],0
	jne       short @470
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @474
@473:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@474:
	cmp       dword ptr [ebx+4],0
	jne       short @477
	cmp       dword ptr [ebx],0
@477:
	je        short @475
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @478
	cmp       eax,dword ptr [ebp-8]
@478:
	setne     al
	and       eax,1
	jmp       short @476
@475:
	xor       eax,eax
@476:
	test      al,al
	jne       short @473
	?debug L 993
	push      0
	push      1
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 995
	mov       eax,dword ptr [ebp-16]
	?debug L 993
	add       esp,24
	?debug L 995
	and       eax,4194304
	?debug L 996
?live16417@160: ; EBX = &$mmjpfcia, EAX = @temp3
	test      eax,eax
	?debug L 995
?live16417@176: ; EBX = &$mmjpfcia
	mov       dword ptr [$ejjpfcia],eax
	?debug L 996
?live16417@192: ; EBX = &$mmjpfcia, EAX = @temp3
	setne     dl
	?debug L 997
?live16417@208: ; EBX = &$mmjpfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 996
?live16417@224: ; EBX = &$mmjpfcia, EAX = @temp3
	and       edx,1
	?debug L 997
?live16417@240: ; EBX = &$mmjpfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 996
?live16417@256: ; EBX = &$mmjpfcia, EAX = @temp3
	mov       eax,edx
	?debug L 999
?live16417@272: ; 
@479:
@469:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	262
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
	dw	263
	dw	0
	dw	0
	dw	0
	dw	?patch152
	dw	529
	dw	?patch153
	dd	?live16417@208-@@stk@cpu@cpu_has_movbe$qv
	dd	?live16417@224-?live16417@208
	dw	1
	dd	?live16417@240-@@stk@cpu@cpu_has_movbe$qv
	dd	?live16417@256-?live16417@240
	dw	1
?patch153	equ	2
?patch152	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	264
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	265
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	266
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	267
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mmjpfcia
	dw	0
	dw	4102
	dw	0
	dw	268
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	269
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ejjpfcia
	dw	0
	dw	117
	dw	0
	dw	270
	dw	0
	dw	0
	dw	0
?patch149	equ	@479-@@stk@cpu@cpu_has_movbe$qv+5
?patch150	equ	0
?patch151	equ	@479-@@stk@cpu@cpu_has_movbe$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eakpfcia	label	dword
	dd	-1
	align	4
$mdkpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_bmi$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_bmi$qv	proc	near
?live16418@0:
	?debug L 1002
@480:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1005
?live16418@16: ; EBX = &$mdkpfcia
	mov       eax,dword ptr [$eakpfcia]
	cmp       eax,-1
	?debug L 1002
?live16418@32: ; 
	push      ebx
	mov       ebx,offset $mdkpfcia
	?debug L 1005
?live16418@48: ; EBX = &$mdkpfcia
	jne       @482
	?debug L 1006
?live16418@64: ; EAX = @temp3
	jmp       short @484
	?debug L 1008
?live16418@80: ; EBX = &$mdkpfcia
@483:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@484:
	cmp       dword ptr [ebx+4],0
	jne       short @483
	cmp       dword ptr [ebx],0
	jne       short @483
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       edx,dword ptr [ebp-8]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],edx
	jmp       short @487
@486:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@487:
	cmp       dword ptr [ebx+4],0
	jne       short @490
	cmp       dword ptr [ebx],0
@490:
	je        short @488
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @491
	cmp       eax,dword ptr [ebp-8]
@491:
	setne     cl
	and       ecx,1
	jmp       short @489
@488:
	xor       ecx,ecx
@489:
	test      cl,cl
	jne       short @486
	?debug L 1011
	push      0
	push      7
	lea       eax,dword ptr [ebp-12]
	push      eax
	lea       edx,dword ptr [ebp-16]
	push      edx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1013
	test      byte ptr [ebp-19],1
	je        short @492
	?debug L 1014
	mov       dword ptr [$eakpfcia],2
	jmp       short @493
	?debug L 1016
@492:
	test      byte ptr [ebp-20],8
	je        short @494
	?debug L 1017
	mov       dword ptr [$eakpfcia],1
	jmp       short @493
	?debug L 1019
@494:
	xor       ecx,ecx
	mov       dword ptr [$eakpfcia],ecx
	?debug L 1020
@493:
	cmp       dword ptr [$eakpfcia],0
	?debug L 1021
?live16418@208: ; EBX = &$mdkpfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1020
?live16418@224: ; EBX = &$mdkpfcia
	setne     al
	and       eax,1
	?debug L 1022
?live16418@240: ; EAX = r
	xor       edx,edx
	mov       dl,al
	?debug L 1021
?live16418@256: ; EBX = &$mdkpfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1022
?live16418@272: ; EAX = r
	mov       eax,edx
	?debug L 1023
?live16418@288: ; 
@495:
@482:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	271
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
	dw	272
	dw	0
	dw	0
	dw	0
	dw	?patch157
	dw	529
	dw	?patch158
	dd	?live16418@208-@@stk@cpu@cpu_has_bmi$qv
	dd	?live16418@224-?live16418@208
	dw	1
	dd	?live16418@240-@@stk@cpu@cpu_has_bmi$qv
	dd	?live16418@288-?live16418@240
	dw	1
?patch158	equ	2
?patch157	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	273
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	274
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	275
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	276
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mdkpfcia
	dw	0
	dw	4102
	dw	0
	dw	277
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	278
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eakpfcia
	dw	0
	dw	117
	dw	0
	dw	279
	dw	0
	dw	0
	dw	0
?patch154	equ	@495-@@stk@cpu@cpu_has_bmi$qv+5
?patch155	equ	0
?patch156	equ	@495-@@stk@cpu@cpu_has_bmi$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehkpfcia	label	dword
	dd	-1
	align	4
$mkkpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_erms$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_erms$qv	proc	near
?live16419@0:
	?debug L 1026
@496:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1029
?live16419@16: ; EBX = &$mkkpfcia
	mov       eax,dword ptr [$ehkpfcia]
	cmp       eax,-1
	?debug L 1026
?live16419@32: ; 
	push      ebx
	mov       ebx,offset $mkkpfcia
	?debug L 1029
?live16419@48: ; EBX = &$mkkpfcia
	je        short @500
	?debug L 1030
?live16419@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @498
	?debug L 1032
?live16419@80: ; EBX = &$mkkpfcia
@499:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@500:
	cmp       dword ptr [ebx+4],0
	jne       short @499
	cmp       dword ptr [ebx],0
	jne       short @499
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @503
@502:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@503:
	cmp       dword ptr [ebx+4],0
	jne       short @506
	cmp       dword ptr [ebx],0
@506:
	je        short @504
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @507
	cmp       eax,dword ptr [ebp-8]
@507:
	setne     al
	and       eax,1
	jmp       short @505
@504:
	xor       eax,eax
@505:
	test      al,al
	jne       short @502
	?debug L 1035
	push      0
	push      7
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1037
	mov       eax,dword ptr [ebp-20]
	?debug L 1035
	add       esp,24
	?debug L 1037
	and       eax,512
	?debug L 1038
?live16419@160: ; EBX = &$mkkpfcia, EAX = @temp3
	test      eax,eax
	?debug L 1037
?live16419@176: ; EBX = &$mkkpfcia
	mov       dword ptr [$ehkpfcia],eax
	?debug L 1038
?live16419@192: ; EBX = &$mkkpfcia, EAX = @temp3
	setne     dl
	?debug L 1039
?live16419@208: ; EBX = &$mkkpfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1038
?live16419@224: ; EBX = &$mkkpfcia, EAX = @temp3
	and       edx,1
	?debug L 1039
?live16419@240: ; EBX = &$mkkpfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1038
?live16419@256: ; EBX = &$mkkpfcia, EAX = @temp3
	mov       eax,edx
	?debug L 1041
?live16419@272: ; 
@508:
@498:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	280
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
	dw	281
	dw	0
	dw	0
	dw	0
	dw	?patch162
	dw	529
	dw	?patch163
	dd	?live16419@208-@@stk@cpu@cpu_has_erms$qv
	dd	?live16419@224-?live16419@208
	dw	1
	dd	?live16419@240-@@stk@cpu@cpu_has_erms$qv
	dd	?live16419@256-?live16419@240
	dw	1
?patch163	equ	2
?patch162	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	282
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	283
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	284
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	285
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mkkpfcia
	dw	0
	dw	4102
	dw	0
	dw	286
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	287
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ehkpfcia
	dw	0
	dw	117
	dw	0
	dw	288
	dw	0
	dw	0
	dw	0
?patch159	equ	@508-@@stk@cpu@cpu_has_erms$qv+5
?patch160	equ	0
?patch161	equ	@508-@@stk@cpu@cpu_has_erms$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eokpfcia	label	dword
	dd	-1
	align	4
$mblpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_3dnow$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_3dnow$qv	proc	near
?live16420@0:
	?debug L 1044
@509:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1047
?live16420@16: ; EBX = &$mblpfcia
	mov       eax,dword ptr [$eokpfcia]
	cmp       eax,-1
	?debug L 1044
?live16420@32: ; 
	push      ebx
	mov       ebx,offset $mblpfcia
	?debug L 1047
?live16420@48: ; EBX = &$mblpfcia
	jne       @511
	?debug L 1048
?live16420@64: ; EAX = @temp3
	jmp       short @513
	?debug L 1050
?live16420@80: ; EBX = &$mblpfcia
@512:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@513:
	cmp       dword ptr [ebx+4],0
	jne       short @512
	cmp       dword ptr [ebx],0
	jne       short @512
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       edx,dword ptr [ebp-8]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],edx
	jmp       short @516
@515:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@516:
	cmp       dword ptr [ebx+4],0
	jne       short @519
	cmp       dword ptr [ebx],0
@519:
	je        short @517
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @520
	cmp       eax,dword ptr [ebp-8]
@520:
	setne     cl
	and       ecx,1
	jmp       short @518
@517:
	xor       ecx,ecx
@518:
	test      cl,cl
	jne       short @515
	?debug L 1053
	push      0
	push      -2147483647
	lea       eax,dword ptr [ebp-12]
	push      eax
	lea       edx,dword ptr [ebp-16]
	push      edx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1055
	test      byte ptr [ebp-9],64
	je        short @521
	?debug L 1056
	mov       dword ptr [$eokpfcia],2
	jmp       short @522
	?debug L 1058
@521:
	test      byte ptr [ebp-9],-128
	je        short @523
	?debug L 1059
	mov       dword ptr [$eokpfcia],1
	jmp       short @522
	?debug L 1061
@523:
	xor       ecx,ecx
	mov       dword ptr [$eokpfcia],ecx
	?debug L 1062
@522:
	cmp       dword ptr [$eokpfcia],0
	?debug L 1063
?live16420@208: ; EBX = &$mblpfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1062
?live16420@224: ; EBX = &$mblpfcia
	setne     al
	and       eax,1
	?debug L 1064
?live16420@240: ; EAX = r
	xor       edx,edx
	mov       dl,al
	?debug L 1063
?live16420@256: ; EBX = &$mblpfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1064
?live16420@272: ; EAX = r
	mov       eax,edx
	?debug L 1065
?live16420@288: ; 
@524:
@511:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	289
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
	dw	290
	dw	0
	dw	0
	dw	0
	dw	?patch167
	dw	529
	dw	?patch168
	dd	?live16420@208-@@stk@cpu@cpu_has_3dnow$qv
	dd	?live16420@224-?live16420@208
	dw	1
	dd	?live16420@240-@@stk@cpu@cpu_has_3dnow$qv
	dd	?live16420@288-?live16420@240
	dw	1
?patch168	equ	2
?patch167	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	291
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	292
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	293
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	294
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mblpfcia
	dw	0
	dw	4102
	dw	0
	dw	295
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	296
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eokpfcia
	dw	0
	dw	117
	dw	0
	dw	297
	dw	0
	dw	0
	dw	0
?patch164	equ	@524-@@stk@cpu@cpu_has_3dnow$qv+5
?patch165	equ	0
?patch166	equ	@524-@@stk@cpu@cpu_has_3dnow$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eflpfcia	label	dword
	dd	-1
	align	4
$milpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_3dnowprefetch$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_3dnowprefetch$qv	proc	near
?live16421@0:
	?debug L 1068
@525:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1071
?live16421@16: ; EBX = &$milpfcia
	mov       eax,dword ptr [$eflpfcia]
	cmp       eax,-1
	?debug L 1068
?live16421@32: ; 
	push      ebx
	mov       ebx,offset $milpfcia
	?debug L 1071
?live16421@48: ; EBX = &$milpfcia
	je        short @529
	?debug L 1072
?live16421@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @527
	?debug L 1074
?live16421@80: ; EBX = &$milpfcia
@528:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@529:
	cmp       dword ptr [ebx+4],0
	jne       short @528
	cmp       dword ptr [ebx],0
	jne       short @528
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @532
@531:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@532:
	cmp       dword ptr [ebx+4],0
	jne       short @535
	cmp       dword ptr [ebx],0
@535:
	je        short @533
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @536
	cmp       eax,dword ptr [ebp-8]
@536:
	setne     al
	and       eax,1
	jmp       short @534
@533:
	xor       eax,eax
@534:
	test      al,al
	jne       short @531
	?debug L 1077
	push      0
	push      -2147483647
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1079
	mov       eax,dword ptr [ebp-16]
	?debug L 1077
	add       esp,24
	?debug L 1079
	and       eax,256
	?debug L 1080
?live16421@160: ; EBX = &$milpfcia, EAX = @temp3
	test      eax,eax
	?debug L 1079
?live16421@176: ; EBX = &$milpfcia
	mov       dword ptr [$eflpfcia],eax
	?debug L 1080
?live16421@192: ; EBX = &$milpfcia, EAX = @temp3
	setne     dl
	?debug L 1081
?live16421@208: ; EBX = &$milpfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1080
?live16421@224: ; EBX = &$milpfcia, EAX = @temp3
	and       edx,1
	?debug L 1081
?live16421@240: ; EBX = &$milpfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1080
?live16421@256: ; EBX = &$milpfcia, EAX = @temp3
	mov       eax,edx
	?debug L 1083
?live16421@272: ; 
@537:
@527:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	298
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
	dw	299
	dw	0
	dw	0
	dw	0
	dw	?patch172
	dw	529
	dw	?patch173
	dd	?live16421@208-@@stk@cpu@cpu_has_3dnowprefetch$qv
	dd	?live16421@224-?live16421@208
	dw	1
	dd	?live16421@240-@@stk@cpu@cpu_has_3dnowprefetch$qv
	dd	?live16421@256-?live16421@240
	dw	1
?patch173	equ	2
?patch172	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	300
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	301
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	302
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	303
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$milpfcia
	dw	0
	dw	4102
	dw	0
	dw	304
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	305
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eflpfcia
	dw	0
	dw	117
	dw	0
	dw	306
	dw	0
	dw	0
	dw	0
?patch169	equ	@537-@@stk@cpu@cpu_has_3dnowprefetch$qv+5
?patch170	equ	0
?patch171	equ	@537-@@stk@cpu@cpu_has_3dnowprefetch$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$emlpfcia	label	dword
	dd	-1
	align	4
$mplpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_perftsc$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_perftsc$qv	proc	near
?live16422@0:
	?debug L 1086
@538:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1089
?live16422@16: ; EBX = &$mplpfcia
	mov       eax,dword ptr [$emlpfcia]
	cmp       eax,-1
	?debug L 1086
?live16422@32: ; 
	push      ebx
	mov       ebx,offset $mplpfcia
	?debug L 1089
?live16422@48: ; EBX = &$mplpfcia
	je        short @542
	?debug L 1090
?live16422@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @540
	?debug L 1092
?live16422@80: ; EBX = &$mplpfcia
@541:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@542:
	cmp       dword ptr [ebx+4],0
	jne       short @541
	cmp       dword ptr [ebx],0
	jne       short @541
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @545
@544:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@545:
	cmp       dword ptr [ebx+4],0
	jne       short @548
	cmp       dword ptr [ebx],0
@548:
	je        short @546
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @549
	cmp       eax,dword ptr [ebp-8]
@549:
	setne     al
	and       eax,1
	jmp       short @547
@546:
	xor       eax,eax
@547:
	test      al,al
	jne       short @544
	?debug L 1095
	push      0
	push      -2147483647
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1097
	mov       eax,dword ptr [ebp-12]
	?debug L 1095
	add       esp,24
	?debug L 1097
	and       eax,134217728
	?debug L 1098
?live16422@160: ; EBX = &$mplpfcia, EAX = @temp3
	test      eax,eax
	?debug L 1097
?live16422@176: ; EBX = &$mplpfcia
	mov       dword ptr [$emlpfcia],eax
	?debug L 1098
?live16422@192: ; EBX = &$mplpfcia, EAX = @temp3
	setne     dl
	?debug L 1099
?live16422@208: ; EBX = &$mplpfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1098
?live16422@224: ; EBX = &$mplpfcia, EAX = @temp3
	and       edx,1
	?debug L 1099
?live16422@240: ; EBX = &$mplpfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1098
?live16422@256: ; EBX = &$mplpfcia, EAX = @temp3
	mov       eax,edx
	?debug L 1101
?live16422@272: ; 
@550:
@540:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	307
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
	dw	308
	dw	0
	dw	0
	dw	0
	dw	?patch177
	dw	529
	dw	?patch178
	dd	?live16422@208-@@stk@cpu@cpu_has_perftsc$qv
	dd	?live16422@224-?live16422@208
	dw	1
	dd	?live16422@240-@@stk@cpu@cpu_has_perftsc$qv
	dd	?live16422@256-?live16422@240
	dw	1
?patch178	equ	2
?patch177	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	309
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	310
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	311
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	312
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mplpfcia
	dw	0
	dw	4102
	dw	0
	dw	313
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	314
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$emlpfcia
	dw	0
	dw	117
	dw	0
	dw	315
	dw	0
	dw	0
	dw	0
?patch174	equ	@550-@@stk@cpu@cpu_has_perftsc$qv+5
?patch175	equ	0
?patch176	equ	@550-@@stk@cpu@cpu_has_perftsc$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$edmpfcia	label	dword
	dd	-1
	align	4
$mgmpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sha$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sha$qv	proc	near
?live16423@0:
	?debug L 1104
@551:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1107
?live16423@16: ; EBX = &$mgmpfcia
	mov       eax,dword ptr [$edmpfcia]
	cmp       eax,-1
	?debug L 1104
?live16423@32: ; 
	push      ebx
	mov       ebx,offset $mgmpfcia
	?debug L 1107
?live16423@48: ; EBX = &$mgmpfcia
	je        short @555
	?debug L 1108
?live16423@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @553
	?debug L 1110
?live16423@80: ; EBX = &$mgmpfcia
@554:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@555:
	cmp       dword ptr [ebx+4],0
	jne       short @554
	cmp       dword ptr [ebx],0
	jne       short @554
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @558
@557:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@558:
	cmp       dword ptr [ebx+4],0
	jne       short @561
	cmp       dword ptr [ebx],0
@561:
	je        short @559
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @562
	cmp       eax,dword ptr [ebp-8]
@562:
	setne     al
	and       eax,1
	jmp       short @560
@559:
	xor       eax,eax
@560:
	test      al,al
	jne       short @557
	?debug L 1113
	push      0
	push      7
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1115
	mov       eax,dword ptr [ebp-20]
	?debug L 1113
	add       esp,24
	?debug L 1115
	and       eax,536870912
	?debug L 1116
?live16423@160: ; EBX = &$mgmpfcia, EAX = @temp3
	test      eax,eax
	?debug L 1115
?live16423@176: ; EBX = &$mgmpfcia
	mov       dword ptr [$edmpfcia],eax
	?debug L 1116
?live16423@192: ; EBX = &$mgmpfcia, EAX = @temp3
	setne     dl
	?debug L 1117
?live16423@208: ; EBX = &$mgmpfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1116
?live16423@224: ; EBX = &$mgmpfcia, EAX = @temp3
	and       edx,1
	?debug L 1117
?live16423@240: ; EBX = &$mgmpfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1116
?live16423@256: ; EBX = &$mgmpfcia, EAX = @temp3
	mov       eax,edx
	?debug L 1119
?live16423@272: ; 
@563:
@553:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	316
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
	dw	317
	dw	0
	dw	0
	dw	0
	dw	?patch182
	dw	529
	dw	?patch183
	dd	?live16423@208-@@stk@cpu@cpu_has_sha$qv
	dd	?live16423@224-?live16423@208
	dw	1
	dd	?live16423@240-@@stk@cpu@cpu_has_sha$qv
	dd	?live16423@256-?live16423@240
	dw	1
?patch183	equ	2
?patch182	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	318
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	319
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	320
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	321
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mgmpfcia
	dw	0
	dw	4102
	dw	0
	dw	322
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	323
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$edmpfcia
	dw	0
	dw	117
	dw	0
	dw	324
	dw	0
	dw	0
	dw	0
?patch179	equ	@563-@@stk@cpu@cpu_has_sha$qv+5
?patch180	equ	0
?patch181	equ	@563-@@stk@cpu@cpu_has_sha$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ekmpfcia	label	dword
	dd	-1
	align	4
$mnmpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_xop$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_xop$qv	proc	near
?live16424@0:
	?debug L 1122
@564:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1125
?live16424@16: ; EBX = &$mnmpfcia
	mov       eax,dword ptr [$ekmpfcia]
	cmp       eax,-1
	?debug L 1122
?live16424@32: ; 
	push      ebx
	mov       ebx,offset $mnmpfcia
	?debug L 1125
?live16424@48: ; EBX = &$mnmpfcia
	je        short @568
	?debug L 1126
?live16424@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @566
	?debug L 1128
?live16424@80: ; EBX = &$mnmpfcia
@567:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@568:
	cmp       dword ptr [ebx+4],0
	jne       short @567
	cmp       dword ptr [ebx],0
	jne       short @567
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @571
@570:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@571:
	cmp       dword ptr [ebx+4],0
	jne       short @574
	cmp       dword ptr [ebx],0
@574:
	je        short @572
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @575
	cmp       eax,dword ptr [ebp-8]
@575:
	setne     al
	and       eax,1
	jmp       short @573
@572:
	xor       eax,eax
@573:
	test      al,al
	jne       short @570
	?debug L 1131
	push      0
	push      -2147483647
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1133
	mov       eax,dword ptr [ebp-16]
	?debug L 1131
	add       esp,24
	?debug L 1133
	and       eax,2048
	?debug L 1134
?live16424@160: ; EBX = &$mnmpfcia, EAX = @temp3
	test      eax,eax
	?debug L 1133
?live16424@176: ; EBX = &$mnmpfcia
	mov       dword ptr [$ekmpfcia],eax
	?debug L 1134
?live16424@192: ; EBX = &$mnmpfcia, EAX = @temp3
	setne     dl
	?debug L 1135
?live16424@208: ; EBX = &$mnmpfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1134
?live16424@224: ; EBX = &$mnmpfcia, EAX = @temp3
	and       edx,1
	?debug L 1135
?live16424@240: ; EBX = &$mnmpfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1134
?live16424@256: ; EBX = &$mnmpfcia, EAX = @temp3
	mov       eax,edx
	?debug L 1137
?live16424@272: ; 
@576:
@566:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	326
	dw	0
	dw	0
	dw	0
	dw	?patch187
	dw	529
	dw	?patch188
	dd	?live16424@208-@@stk@cpu@cpu_has_xop$qv
	dd	?live16424@224-?live16424@208
	dw	1
	dd	?live16424@240-@@stk@cpu@cpu_has_xop$qv
	dd	?live16424@256-?live16424@240
	dw	1
?patch188	equ	2
?patch187	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	327
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	328
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	329
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	330
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mnmpfcia
	dw	0
	dw	4102
	dw	0
	dw	331
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	332
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ekmpfcia
	dw	0
	dw	117
	dw	0
	dw	333
	dw	0
	dw	0
	dw	0
?patch184	equ	@576-@@stk@cpu@cpu_has_xop$qv+5
?patch185	equ	0
?patch186	equ	@576-@@stk@cpu@cpu_has_xop$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ebnpfcia	label	dword
	dd	-1
	align	4
$menpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512f$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512f$qv	proc	near
?live16425@0:
	?debug L 1140
@577:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1143
?live16425@16: ; EBX = &$menpfcia
	mov       eax,dword ptr [$ebnpfcia]
	cmp       eax,-1
	?debug L 1140
?live16425@32: ; 
	push      ebx
	mov       ebx,offset $menpfcia
	?debug L 1143
?live16425@48: ; EBX = &$menpfcia
	je        short @581
	?debug L 1144
?live16425@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @579
	?debug L 1146
?live16425@80: ; EBX = &$menpfcia
@580:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@581:
	cmp       dword ptr [ebx+4],0
	jne       short @580
	cmp       dword ptr [ebx],0
	jne       short @580
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @584
@583:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@584:
	cmp       dword ptr [ebx+4],0
	jne       short @587
	cmp       dword ptr [ebx],0
@587:
	je        short @585
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @588
	cmp       eax,dword ptr [ebp-8]
@588:
	setne     al
	and       eax,1
	jmp       short @586
@585:
	xor       eax,eax
@586:
	test      al,al
	jne       short @583
	?debug L 1149
	push      0
	push      7
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1151
	mov       eax,dword ptr [ebp-20]
	?debug L 1149
	add       esp,24
	?debug L 1151
	and       eax,65536
	?debug L 1152
?live16425@160: ; EBX = &$menpfcia, EAX = @temp3
	test      eax,eax
	?debug L 1151
?live16425@176: ; EBX = &$menpfcia
	mov       dword ptr [$ebnpfcia],eax
	?debug L 1152
?live16425@192: ; EBX = &$menpfcia, EAX = @temp3
	setne     dl
	?debug L 1153
?live16425@208: ; EBX = &$menpfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1152
?live16425@224: ; EBX = &$menpfcia, EAX = @temp3
	and       edx,1
	?debug L 1153
?live16425@240: ; EBX = &$menpfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1152
?live16425@256: ; EBX = &$menpfcia, EAX = @temp3
	mov       eax,edx
	?debug L 1155
?live16425@272: ; 
@589:
@579:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	334
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
	dw	335
	dw	0
	dw	0
	dw	0
	dw	?patch192
	dw	529
	dw	?patch193
	dd	?live16425@208-@@stk@cpu@cpu_has_avx512f$qv
	dd	?live16425@224-?live16425@208
	dw	1
	dd	?live16425@240-@@stk@cpu@cpu_has_avx512f$qv
	dd	?live16425@256-?live16425@240
	dw	1
?patch193	equ	2
?patch192	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	336
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	337
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	338
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	339
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$menpfcia
	dw	0
	dw	4102
	dw	0
	dw	340
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	341
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ebnpfcia
	dw	0
	dw	117
	dw	0
	dw	342
	dw	0
	dw	0
	dw	0
?patch189	equ	@589-@@stk@cpu@cpu_has_avx512f$qv+5
?patch190	equ	0
?patch191	equ	@589-@@stk@cpu@cpu_has_avx512f$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$einpfcia	label	dword
	dd	-1
	align	4
$mlnpfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512bw$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512bw$qv	proc	near
?live16426@0:
	?debug L 1158
@590:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1161
?live16426@16: ; EBX = &$mlnpfcia
	mov       eax,dword ptr [$einpfcia]
	cmp       eax,-1
	?debug L 1158
?live16426@32: ; 
	push      ebx
	mov       ebx,offset $mlnpfcia
	?debug L 1161
?live16426@48: ; EBX = &$mlnpfcia
	je        short @594
	?debug L 1162
?live16426@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @592
	?debug L 1164
?live16426@80: ; EBX = &$mlnpfcia
@593:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@594:
	cmp       dword ptr [ebx+4],0
	jne       short @593
	cmp       dword ptr [ebx],0
	jne       short @593
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @597
@596:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@597:
	cmp       dword ptr [ebx+4],0
	jne       short @600
	cmp       dword ptr [ebx],0
@600:
	je        short @598
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @601
	cmp       eax,dword ptr [ebp-8]
@601:
	setne     al
	and       eax,1
	jmp       short @599
@598:
	xor       eax,eax
@599:
	test      al,al
	jne       short @596
	?debug L 1167
	push      0
	push      7
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1169
	mov       eax,dword ptr [ebp-20]
	?debug L 1167
	add       esp,24
	?debug L 1169
	and       eax,1073741824
	?debug L 1170
?live16426@160: ; EBX = &$mlnpfcia, EAX = @temp3
	test      eax,eax
	?debug L 1169
?live16426@176: ; EBX = &$mlnpfcia
	mov       dword ptr [$einpfcia],eax
	?debug L 1170
?live16426@192: ; EBX = &$mlnpfcia, EAX = @temp3
	setne     dl
	?debug L 1171
?live16426@208: ; EBX = &$mlnpfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1170
?live16426@224: ; EBX = &$mlnpfcia, EAX = @temp3
	and       edx,1
	?debug L 1171
?live16426@240: ; EBX = &$mlnpfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1170
?live16426@256: ; EBX = &$mlnpfcia, EAX = @temp3
	mov       eax,edx
	?debug L 1173
?live16426@272: ; 
@602:
@592:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	343
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
	dw	344
	dw	0
	dw	0
	dw	0
	dw	?patch197
	dw	529
	dw	?patch198
	dd	?live16426@208-@@stk@cpu@cpu_has_avx512bw$qv
	dd	?live16426@224-?live16426@208
	dw	1
	dd	?live16426@240-@@stk@cpu@cpu_has_avx512bw$qv
	dd	?live16426@256-?live16426@240
	dw	1
?patch198	equ	2
?patch197	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	345
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	346
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	347
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	348
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mlnpfcia
	dw	0
	dw	4102
	dw	0
	dw	349
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	350
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$einpfcia
	dw	0
	dw	117
	dw	0
	dw	351
	dw	0
	dw	0
	dw	0
?patch194	equ	@602-@@stk@cpu@cpu_has_avx512bw$qv+5
?patch195	equ	0
?patch196	equ	@602-@@stk@cpu@cpu_has_avx512bw$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epnpfcia	label	dword
	dd	-1
	align	4
$mcopfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512er$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512er$qv	proc	near
?live16427@0:
	?debug L 1176
@603:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1179
?live16427@16: ; EBX = &$mcopfcia
	mov       eax,dword ptr [$epnpfcia]
	cmp       eax,-1
	?debug L 1176
?live16427@32: ; 
	push      ebx
	mov       ebx,offset $mcopfcia
	?debug L 1179
?live16427@48: ; EBX = &$mcopfcia
	je        short @607
	?debug L 1180
?live16427@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @605
	?debug L 1182
?live16427@80: ; EBX = &$mcopfcia
@606:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@607:
	cmp       dword ptr [ebx+4],0
	jne       short @606
	cmp       dword ptr [ebx],0
	jne       short @606
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @610
@609:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@610:
	cmp       dword ptr [ebx+4],0
	jne       short @613
	cmp       dword ptr [ebx],0
@613:
	je        short @611
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @614
	cmp       eax,dword ptr [ebp-8]
@614:
	setne     al
	and       eax,1
	jmp       short @612
@611:
	xor       eax,eax
@612:
	test      al,al
	jne       short @609
	?debug L 1185
	push      0
	push      7
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1187
	mov       eax,dword ptr [ebp-20]
	?debug L 1185
	add       esp,24
	?debug L 1187
	and       eax,134217728
	?debug L 1188
?live16427@160: ; EBX = &$mcopfcia, EAX = @temp3
	test      eax,eax
	?debug L 1187
?live16427@176: ; EBX = &$mcopfcia
	mov       dword ptr [$epnpfcia],eax
	?debug L 1188
?live16427@192: ; EBX = &$mcopfcia, EAX = @temp3
	setne     dl
	?debug L 1189
?live16427@208: ; EBX = &$mcopfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1188
?live16427@224: ; EBX = &$mcopfcia, EAX = @temp3
	and       edx,1
	?debug L 1189
?live16427@240: ; EBX = &$mcopfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1188
?live16427@256: ; EBX = &$mcopfcia, EAX = @temp3
	mov       eax,edx
	?debug L 1191
?live16427@272: ; 
@615:
@605:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	353
	dw	0
	dw	0
	dw	0
	dw	?patch202
	dw	529
	dw	?patch203
	dd	?live16427@208-@@stk@cpu@cpu_has_avx512er$qv
	dd	?live16427@224-?live16427@208
	dw	1
	dd	?live16427@240-@@stk@cpu@cpu_has_avx512er$qv
	dd	?live16427@256-?live16427@240
	dw	1
?patch203	equ	2
?patch202	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	354
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	355
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	356
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	357
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mcopfcia
	dw	0
	dw	4102
	dw	0
	dw	358
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	359
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$epnpfcia
	dw	0
	dw	117
	dw	0
	dw	360
	dw	0
	dw	0
	dw	0
?patch199	equ	@615-@@stk@cpu@cpu_has_avx512er$qv+5
?patch200	equ	0
?patch201	equ	@615-@@stk@cpu@cpu_has_avx512er$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$egopfcia	label	dword
	dd	-1
	align	4
$mjopfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512cd$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512cd$qv	proc	near
?live16428@0:
	?debug L 1194
@616:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1197
?live16428@16: ; EBX = &$mjopfcia
	mov       eax,dword ptr [$egopfcia]
	cmp       eax,-1
	?debug L 1194
?live16428@32: ; 
	push      ebx
	mov       ebx,offset $mjopfcia
	?debug L 1197
?live16428@48: ; EBX = &$mjopfcia
	je        short @620
	?debug L 1198
?live16428@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @618
	?debug L 1200
?live16428@80: ; EBX = &$mjopfcia
@619:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@620:
	cmp       dword ptr [ebx+4],0
	jne       short @619
	cmp       dword ptr [ebx],0
	jne       short @619
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @623
@622:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@623:
	cmp       dword ptr [ebx+4],0
	jne       short @626
	cmp       dword ptr [ebx],0
@626:
	je        short @624
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @627
	cmp       eax,dword ptr [ebp-8]
@627:
	setne     al
	and       eax,1
	jmp       short @625
@624:
	xor       eax,eax
@625:
	test      al,al
	jne       short @622
	?debug L 1203
	push      0
	push      7
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1205
	mov       eax,dword ptr [ebp-20]
	?debug L 1203
	add       esp,24
	?debug L 1205
	and       eax,268435456
	?debug L 1206
?live16428@160: ; EBX = &$mjopfcia, EAX = @temp3
	test      eax,eax
	?debug L 1205
?live16428@176: ; EBX = &$mjopfcia
	mov       dword ptr [$egopfcia],eax
	?debug L 1206
?live16428@192: ; EBX = &$mjopfcia, EAX = @temp3
	setne     dl
	?debug L 1207
?live16428@208: ; EBX = &$mjopfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1206
?live16428@224: ; EBX = &$mjopfcia, EAX = @temp3
	and       edx,1
	?debug L 1207
?live16428@240: ; EBX = &$mjopfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1206
?live16428@256: ; EBX = &$mjopfcia, EAX = @temp3
	mov       eax,edx
	?debug L 1209
?live16428@272: ; 
@628:
@618:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	362
	dw	0
	dw	0
	dw	0
	dw	?patch207
	dw	529
	dw	?patch208
	dd	?live16428@208-@@stk@cpu@cpu_has_avx512cd$qv
	dd	?live16428@224-?live16428@208
	dw	1
	dd	?live16428@240-@@stk@cpu@cpu_has_avx512cd$qv
	dd	?live16428@256-?live16428@240
	dw	1
?patch208	equ	2
?patch207	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	363
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	364
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	365
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	366
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mjopfcia
	dw	0
	dw	4102
	dw	0
	dw	367
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	368
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$egopfcia
	dw	0
	dw	117
	dw	0
	dw	369
	dw	0
	dw	0
	dw	0
?patch204	equ	@628-@@stk@cpu@cpu_has_avx512cd$qv+5
?patch205	equ	0
?patch206	equ	@628-@@stk@cpu@cpu_has_avx512cd$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$enopfcia	label	dword
	dd	-1
	align	4
$mappfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512pf$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512pf$qv	proc	near
?live16429@0:
	?debug L 1212
@629:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1215
?live16429@16: ; EBX = &$mappfcia
	mov       eax,dword ptr [$enopfcia]
	cmp       eax,-1
	?debug L 1212
?live16429@32: ; 
	push      ebx
	mov       ebx,offset $mappfcia
	?debug L 1215
?live16429@48: ; EBX = &$mappfcia
	je        short @633
	?debug L 1216
?live16429@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @631
	?debug L 1218
?live16429@80: ; EBX = &$mappfcia
@632:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@633:
	cmp       dword ptr [ebx+4],0
	jne       short @632
	cmp       dword ptr [ebx],0
	jne       short @632
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @636
@635:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@636:
	cmp       dword ptr [ebx+4],0
	jne       short @639
	cmp       dword ptr [ebx],0
@639:
	je        short @637
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @640
	cmp       eax,dword ptr [ebp-8]
@640:
	setne     al
	and       eax,1
	jmp       short @638
@637:
	xor       eax,eax
@638:
	test      al,al
	jne       short @635
	?debug L 1221
	push      0
	push      7
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1223
	mov       eax,dword ptr [ebp-20]
	?debug L 1221
	add       esp,24
	?debug L 1223
	and       eax,67108864
	?debug L 1224
?live16429@160: ; EBX = &$mappfcia, EAX = @temp3
	test      eax,eax
	?debug L 1223
?live16429@176: ; EBX = &$mappfcia
	mov       dword ptr [$enopfcia],eax
	?debug L 1224
?live16429@192: ; EBX = &$mappfcia, EAX = @temp3
	setne     dl
	?debug L 1225
?live16429@208: ; EBX = &$mappfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1224
?live16429@224: ; EBX = &$mappfcia, EAX = @temp3
	and       edx,1
	?debug L 1225
?live16429@240: ; EBX = &$mappfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1224
?live16429@256: ; EBX = &$mappfcia, EAX = @temp3
	mov       eax,edx
	?debug L 1227
?live16429@272: ; 
@641:
@631:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	371
	dw	0
	dw	0
	dw	0
	dw	?patch212
	dw	529
	dw	?patch213
	dd	?live16429@208-@@stk@cpu@cpu_has_avx512pf$qv
	dd	?live16429@224-?live16429@208
	dw	1
	dd	?live16429@240-@@stk@cpu@cpu_has_avx512pf$qv
	dd	?live16429@256-?live16429@240
	dw	1
?patch213	equ	2
?patch212	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	372
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	373
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	374
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	375
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mappfcia
	dw	0
	dw	4102
	dw	0
	dw	376
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	377
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$enopfcia
	dw	0
	dw	117
	dw	0
	dw	378
	dw	0
	dw	0
	dw	0
?patch209	equ	@641-@@stk@cpu@cpu_has_avx512pf$qv+5
?patch210	equ	0
?patch211	equ	@641-@@stk@cpu@cpu_has_avx512pf$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eeppfcia	label	dword
	dd	-1
	align	4
$mhppfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512dq$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512dq$qv	proc	near
?live16430@0:
	?debug L 1230
@642:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1233
?live16430@16: ; EBX = &$mhppfcia
	mov       eax,dword ptr [$eeppfcia]
	cmp       eax,-1
	?debug L 1230
?live16430@32: ; 
	push      ebx
	mov       ebx,offset $mhppfcia
	?debug L 1233
?live16430@48: ; EBX = &$mhppfcia
	je        short @646
	?debug L 1234
?live16430@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @644
	?debug L 1236
?live16430@80: ; EBX = &$mhppfcia
@645:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@646:
	cmp       dword ptr [ebx+4],0
	jne       short @645
	cmp       dword ptr [ebx],0
	jne       short @645
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @649
@648:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@649:
	cmp       dword ptr [ebx+4],0
	jne       short @652
	cmp       dword ptr [ebx],0
@652:
	je        short @650
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @653
	cmp       eax,dword ptr [ebp-8]
@653:
	setne     al
	and       eax,1
	jmp       short @651
@650:
	xor       eax,eax
@651:
	test      al,al
	jne       short @648
	?debug L 1239
	push      0
	push      7
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1241
	mov       eax,dword ptr [ebp-20]
	?debug L 1239
	add       esp,24
	?debug L 1241
	and       eax,131072
	?debug L 1242
?live16430@160: ; EBX = &$mhppfcia, EAX = @temp3
	test      eax,eax
	?debug L 1241
?live16430@176: ; EBX = &$mhppfcia
	mov       dword ptr [$eeppfcia],eax
	?debug L 1242
?live16430@192: ; EBX = &$mhppfcia, EAX = @temp3
	setne     dl
	?debug L 1243
?live16430@208: ; EBX = &$mhppfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1242
?live16430@224: ; EBX = &$mhppfcia, EAX = @temp3
	and       edx,1
	?debug L 1243
?live16430@240: ; EBX = &$mhppfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1242
?live16430@256: ; EBX = &$mhppfcia, EAX = @temp3
	mov       eax,edx
	?debug L 1245
?live16430@272: ; 
@654:
@644:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	380
	dw	0
	dw	0
	dw	0
	dw	?patch217
	dw	529
	dw	?patch218
	dd	?live16430@208-@@stk@cpu@cpu_has_avx512dq$qv
	dd	?live16430@224-?live16430@208
	dw	1
	dd	?live16430@240-@@stk@cpu@cpu_has_avx512dq$qv
	dd	?live16430@256-?live16430@240
	dw	1
?patch218	equ	2
?patch217	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	381
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	382
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	383
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	384
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mhppfcia
	dw	0
	dw	4102
	dw	0
	dw	385
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	386
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eeppfcia
	dw	0
	dw	117
	dw	0
	dw	387
	dw	0
	dw	0
	dw	0
?patch214	equ	@654-@@stk@cpu@cpu_has_avx512dq$qv+5
?patch215	equ	0
?patch216	equ	@654-@@stk@cpu@cpu_has_avx512dq$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$elppfcia	label	dword
	dd	-1
	align	4
$moppfcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512vl$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512vl$qv	proc	near
?live16431@0:
	?debug L 1248
@655:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1251
?live16431@16: ; EBX = &$moppfcia
	mov       eax,dword ptr [$elppfcia]
	cmp       eax,-1
	?debug L 1248
?live16431@32: ; 
	push      ebx
	mov       ebx,offset $moppfcia
	?debug L 1251
?live16431@48: ; EBX = &$moppfcia
	je        short @659
	?debug L 1252
?live16431@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @657
	?debug L 1254
?live16431@80: ; EBX = &$moppfcia
@658:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@659:
	cmp       dword ptr [ebx+4],0
	jne       short @658
	cmp       dword ptr [ebx],0
	jne       short @658
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @662
@661:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@662:
	cmp       dword ptr [ebx+4],0
	jne       short @665
	cmp       dword ptr [ebx],0
@665:
	je        short @663
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @666
	cmp       eax,dword ptr [ebp-8]
@666:
	setne     al
	and       eax,1
	jmp       short @664
@663:
	xor       eax,eax
@664:
	test      al,al
	jne       short @661
	?debug L 1257
	push      0
	push      7
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1259
	mov       eax,dword ptr [ebp-20]
	?debug L 1257
	add       esp,24
	?debug L 1259
	and       eax,-2147483648
	?debug L 1260
?live16431@160: ; EBX = &$moppfcia, EAX = @temp3
	test      eax,eax
	?debug L 1259
?live16431@176: ; EBX = &$moppfcia
	mov       dword ptr [$elppfcia],eax
	?debug L 1260
?live16431@192: ; EBX = &$moppfcia, EAX = @temp3
	setne     dl
	?debug L 1261
?live16431@208: ; EBX = &$moppfcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1260
?live16431@224: ; EBX = &$moppfcia, EAX = @temp3
	and       edx,1
	?debug L 1261
?live16431@240: ; EBX = &$moppfcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1260
?live16431@256: ; EBX = &$moppfcia, EAX = @temp3
	mov       eax,edx
	?debug L 1263
?live16431@272: ; 
@667:
@657:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	389
	dw	0
	dw	0
	dw	0
	dw	?patch222
	dw	529
	dw	?patch223
	dd	?live16431@208-@@stk@cpu@cpu_has_avx512vl$qv
	dd	?live16431@224-?live16431@208
	dw	1
	dd	?live16431@240-@@stk@cpu@cpu_has_avx512vl$qv
	dd	?live16431@256-?live16431@240
	dw	1
?patch223	equ	2
?patch222	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	390
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	391
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	392
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	393
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$moppfcia
	dw	0
	dw	4102
	dw	0
	dw	394
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	395
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$elppfcia
	dw	0
	dw	117
	dw	0
	dw	396
	dw	0
	dw	0
	dw	0
?patch219	equ	@667-@@stk@cpu@cpu_has_avx512vl$qv+5
?patch220	equ	0
?patch221	equ	@667-@@stk@cpu@cpu_has_avx512vl$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ecaagcia	label	dword
	dd	-1
	align	4
$mfaagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512ifma$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512ifma$qv	proc	near
?live16432@0:
	?debug L 1266
@668:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1269
?live16432@16: ; EBX = &$mfaagcia
	mov       eax,dword ptr [$ecaagcia]
	cmp       eax,-1
	?debug L 1266
?live16432@32: ; 
	push      ebx
	mov       ebx,offset $mfaagcia
	?debug L 1269
?live16432@48: ; EBX = &$mfaagcia
	je        short @672
	?debug L 1270
?live16432@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @670
	?debug L 1272
?live16432@80: ; EBX = &$mfaagcia
@671:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@672:
	cmp       dword ptr [ebx+4],0
	jne       short @671
	cmp       dword ptr [ebx],0
	jne       short @671
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @675
@674:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@675:
	cmp       dword ptr [ebx+4],0
	jne       short @678
	cmp       dword ptr [ebx],0
@678:
	je        short @676
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @679
	cmp       eax,dword ptr [ebp-8]
@679:
	setne     al
	and       eax,1
	jmp       short @677
@676:
	xor       eax,eax
@677:
	test      al,al
	jne       short @674
	?debug L 1275
	push      0
	push      7
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1277
	mov       eax,dword ptr [ebp-20]
	?debug L 1275
	add       esp,24
	?debug L 1277
	and       eax,2097152
	?debug L 1278
?live16432@160: ; EBX = &$mfaagcia, EAX = @temp3
	test      eax,eax
	?debug L 1277
?live16432@176: ; EBX = &$mfaagcia
	mov       dword ptr [$ecaagcia],eax
	?debug L 1278
?live16432@192: ; EBX = &$mfaagcia, EAX = @temp3
	setne     dl
	?debug L 1279
?live16432@208: ; EBX = &$mfaagcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1278
?live16432@224: ; EBX = &$mfaagcia, EAX = @temp3
	and       edx,1
	?debug L 1279
?live16432@240: ; EBX = &$mfaagcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1278
?live16432@256: ; EBX = &$mfaagcia, EAX = @temp3
	mov       eax,edx
	?debug L 1281
?live16432@272: ; 
@680:
@670:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	397
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
	dw	398
	dw	0
	dw	0
	dw	0
	dw	?patch227
	dw	529
	dw	?patch228
	dd	?live16432@208-@@stk@cpu@cpu_has_avx512ifma$qv
	dd	?live16432@224-?live16432@208
	dw	1
	dd	?live16432@240-@@stk@cpu@cpu_has_avx512ifma$qv
	dd	?live16432@256-?live16432@240
	dw	1
?patch228	equ	2
?patch227	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	399
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	400
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	401
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	402
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mfaagcia
	dw	0
	dw	4102
	dw	0
	dw	403
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	404
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ecaagcia
	dw	0
	dw	117
	dw	0
	dw	405
	dw	0
	dw	0
	dw	0
?patch224	equ	@680-@@stk@cpu@cpu_has_avx512ifma$qv+5
?patch225	equ	0
?patch226	equ	@680-@@stk@cpu@cpu_has_avx512ifma$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ejaagcia	label	dword
	dd	-1
	align	4
$mmaagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512vbmi$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512vbmi$qv	proc	near
?live16433@0:
	?debug L 1284
@681:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1287
?live16433@16: ; EBX = &$mmaagcia
	mov       eax,dword ptr [$ejaagcia]
	cmp       eax,-1
	?debug L 1284
?live16433@32: ; 
	push      ebx
	mov       ebx,offset $mmaagcia
	?debug L 1287
?live16433@48: ; EBX = &$mmaagcia
	je        short @685
	?debug L 1288
?live16433@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @683
	?debug L 1290
?live16433@80: ; EBX = &$mmaagcia
@684:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@685:
	cmp       dword ptr [ebx+4],0
	jne       short @684
	cmp       dword ptr [ebx],0
	jne       short @684
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @688
@687:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@688:
	cmp       dword ptr [ebx+4],0
	jne       short @691
	cmp       dword ptr [ebx],0
@691:
	je        short @689
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @692
	cmp       eax,dword ptr [ebp-8]
@692:
	setne     al
	and       eax,1
	jmp       short @690
@689:
	xor       eax,eax
@690:
	test      al,al
	jne       short @687
	?debug L 1293
	push      0
	push      7
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1295
	mov       eax,dword ptr [ebp-16]
	?debug L 1293
	add       esp,24
	?debug L 1295
	and       eax,2
	?debug L 1296
?live16433@160: ; EBX = &$mmaagcia, EAX = @temp3
	test      eax,eax
	?debug L 1295
?live16433@176: ; EBX = &$mmaagcia
	mov       dword ptr [$ejaagcia],eax
	?debug L 1296
?live16433@192: ; EBX = &$mmaagcia, EAX = @temp3
	setne     dl
	?debug L 1297
?live16433@208: ; EBX = &$mmaagcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1296
?live16433@224: ; EBX = &$mmaagcia, EAX = @temp3
	and       edx,1
	?debug L 1297
?live16433@240: ; EBX = &$mmaagcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1296
?live16433@256: ; EBX = &$mmaagcia, EAX = @temp3
	mov       eax,edx
	?debug L 1299
?live16433@272: ; 
@693:
@683:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	407
	dw	0
	dw	0
	dw	0
	dw	?patch232
	dw	529
	dw	?patch233
	dd	?live16433@208-@@stk@cpu@cpu_has_avx512vbmi$qv
	dd	?live16433@224-?live16433@208
	dw	1
	dd	?live16433@240-@@stk@cpu@cpu_has_avx512vbmi$qv
	dd	?live16433@256-?live16433@240
	dw	1
?patch233	equ	2
?patch232	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	408
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	409
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	410
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	411
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mmaagcia
	dw	0
	dw	4102
	dw	0
	dw	412
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	413
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ejaagcia
	dw	0
	dw	117
	dw	0
	dw	414
	dw	0
	dw	0
	dw	0
?patch229	equ	@693-@@stk@cpu@cpu_has_avx512vbmi$qv+5
?patch230	equ	0
?patch231	equ	@693-@@stk@cpu@cpu_has_avx512vbmi$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eabagcia	label	dword
	dd	-1
	align	4
$mdbagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_adx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_adx$qv	proc	near
?live16434@0:
	?debug L 1302
@694:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1305
?live16434@16: ; EBX = &$mdbagcia
	mov       eax,dword ptr [$eabagcia]
	cmp       eax,-1
	?debug L 1302
?live16434@32: ; 
	push      ebx
	mov       ebx,offset $mdbagcia
	?debug L 1305
?live16434@48: ; EBX = &$mdbagcia
	je        short @698
	?debug L 1306
?live16434@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @696
	?debug L 1308
?live16434@80: ; EBX = &$mdbagcia
@697:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@698:
	cmp       dword ptr [ebx+4],0
	jne       short @697
	cmp       dword ptr [ebx],0
	jne       short @697
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @701
@700:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@701:
	cmp       dword ptr [ebx+4],0
	jne       short @704
	cmp       dword ptr [ebx],0
@704:
	je        short @702
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @705
	cmp       eax,dword ptr [ebp-8]
@705:
	setne     al
	and       eax,1
	jmp       short @703
@702:
	xor       eax,eax
@703:
	test      al,al
	jne       short @700
	?debug L 1311
	push      0
	push      7
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1313
	mov       eax,dword ptr [ebp-20]
	?debug L 1311
	add       esp,24
	?debug L 1313
	and       eax,524288
	?debug L 1314
?live16434@160: ; EBX = &$mdbagcia, EAX = @temp3
	test      eax,eax
	?debug L 1313
?live16434@176: ; EBX = &$mdbagcia
	mov       dword ptr [$eabagcia],eax
	?debug L 1314
?live16434@192: ; EBX = &$mdbagcia, EAX = @temp3
	setne     dl
	?debug L 1315
?live16434@208: ; EBX = &$mdbagcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1314
?live16434@224: ; EBX = &$mdbagcia, EAX = @temp3
	and       edx,1
	?debug L 1315
?live16434@240: ; EBX = &$mdbagcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1314
?live16434@256: ; EBX = &$mdbagcia, EAX = @temp3
	mov       eax,edx
	?debug L 1317
?live16434@272: ; 
@706:
@696:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	415
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
	dw	416
	dw	0
	dw	0
	dw	0
	dw	?patch237
	dw	529
	dw	?patch238
	dd	?live16434@208-@@stk@cpu@cpu_has_adx$qv
	dd	?live16434@224-?live16434@208
	dw	1
	dd	?live16434@240-@@stk@cpu@cpu_has_adx$qv
	dd	?live16434@256-?live16434@240
	dw	1
?patch238	equ	2
?patch237	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	417
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	418
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	419
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	420
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mdbagcia
	dw	0
	dw	4102
	dw	0
	dw	421
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	422
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eabagcia
	dw	0
	dw	117
	dw	0
	dw	423
	dw	0
	dw	0
	dw	0
?patch234	equ	@706-@@stk@cpu@cpu_has_adx$qv+5
?patch235	equ	0
?patch236	equ	@706-@@stk@cpu@cpu_has_adx$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehbagcia	label	dword
	dd	-1
	align	4
$mkbagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_lzcnt$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_lzcnt$qv	proc	near
?live16435@0:
	?debug L 1320
@707:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1323
?live16435@16: ; EBX = &$mkbagcia
	mov       eax,dword ptr [$ehbagcia]
	cmp       eax,-1
	?debug L 1320
?live16435@32: ; 
	push      ebx
	mov       ebx,offset $mkbagcia
	?debug L 1323
?live16435@48: ; EBX = &$mkbagcia
	je        short @711
	?debug L 1324
?live16435@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @709
	?debug L 1326
?live16435@80: ; EBX = &$mkbagcia
@710:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@711:
	cmp       dword ptr [ebx+4],0
	jne       short @710
	cmp       dword ptr [ebx],0
	jne       short @710
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @714
@713:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@714:
	cmp       dword ptr [ebx+4],0
	jne       short @717
	cmp       dword ptr [ebx],0
@717:
	je        short @715
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @718
	cmp       eax,dword ptr [ebp-8]
@718:
	setne     al
	and       eax,1
	jmp       short @716
@715:
	xor       eax,eax
@716:
	test      al,al
	jne       short @713
	?debug L 1329
	push      0
	push      -2147483647
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1331
	mov       eax,dword ptr [ebp-16]
	?debug L 1329
	add       esp,24
	?debug L 1331
	and       eax,32
	?debug L 1332
?live16435@160: ; EBX = &$mkbagcia, EAX = @temp3
	test      eax,eax
	?debug L 1331
?live16435@176: ; EBX = &$mkbagcia
	mov       dword ptr [$ehbagcia],eax
	?debug L 1332
?live16435@192: ; EBX = &$mkbagcia, EAX = @temp3
	setne     dl
	?debug L 1333
?live16435@208: ; EBX = &$mkbagcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1332
?live16435@224: ; EBX = &$mkbagcia, EAX = @temp3
	and       edx,1
	?debug L 1333
?live16435@240: ; EBX = &$mkbagcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1332
?live16435@256: ; EBX = &$mkbagcia, EAX = @temp3
	mov       eax,edx
	?debug L 1335
?live16435@272: ; 
@719:
@709:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	424
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
	dw	425
	dw	0
	dw	0
	dw	0
	dw	?patch242
	dw	529
	dw	?patch243
	dd	?live16435@208-@@stk@cpu@cpu_has_lzcnt$qv
	dd	?live16435@224-?live16435@208
	dw	1
	dd	?live16435@240-@@stk@cpu@cpu_has_lzcnt$qv
	dd	?live16435@256-?live16435@240
	dw	1
?patch243	equ	2
?patch242	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	426
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	427
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	428
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	429
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mkbagcia
	dw	0
	dw	4102
	dw	0
	dw	430
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	431
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ehbagcia
	dw	0
	dw	117
	dw	0
	dw	432
	dw	0
	dw	0
	dw	0
?patch239	equ	@719-@@stk@cpu@cpu_has_lzcnt$qv+5
?patch240	equ	0
?patch241	equ	@719-@@stk@cpu@cpu_has_lzcnt$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eobagcia	label	dword
	dd	-1
	align	4
$mbcagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_tbm$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_tbm$qv	proc	near
?live16436@0:
	?debug L 1338
@720:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1341
?live16436@16: ; EBX = &$mbcagcia
	mov       eax,dword ptr [$eobagcia]
	cmp       eax,-1
	?debug L 1338
?live16436@32: ; 
	push      ebx
	mov       ebx,offset $mbcagcia
	?debug L 1341
?live16436@48: ; EBX = &$mbcagcia
	je        short @724
	?debug L 1342
?live16436@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @722
	?debug L 1344
?live16436@80: ; EBX = &$mbcagcia
@723:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@724:
	cmp       dword ptr [ebx+4],0
	jne       short @723
	cmp       dword ptr [ebx],0
	jne       short @723
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @727
@726:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@727:
	cmp       dword ptr [ebx+4],0
	jne       short @730
	cmp       dword ptr [ebx],0
@730:
	je        short @728
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @731
	cmp       eax,dword ptr [ebp-8]
@731:
	setne     al
	and       eax,1
	jmp       short @729
@728:
	xor       eax,eax
@729:
	test      al,al
	jne       short @726
	?debug L 1347
	push      0
	push      -2147483647
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1349
	mov       eax,dword ptr [ebp-16]
	?debug L 1347
	add       esp,24
	?debug L 1349
	and       eax,2097152
	?debug L 1350
?live16436@160: ; EBX = &$mbcagcia, EAX = @temp3
	test      eax,eax
	?debug L 1349
?live16436@176: ; EBX = &$mbcagcia
	mov       dword ptr [$eobagcia],eax
	?debug L 1350
?live16436@192: ; EBX = &$mbcagcia, EAX = @temp3
	setne     dl
	?debug L 1351
?live16436@208: ; EBX = &$mbcagcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1350
?live16436@224: ; EBX = &$mbcagcia, EAX = @temp3
	and       edx,1
	?debug L 1351
?live16436@240: ; EBX = &$mbcagcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1350
?live16436@256: ; EBX = &$mbcagcia, EAX = @temp3
	mov       eax,edx
	?debug L 1353
?live16436@272: ; 
@732:
@722:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	433
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
	dw	434
	dw	0
	dw	0
	dw	0
	dw	?patch247
	dw	529
	dw	?patch248
	dd	?live16436@208-@@stk@cpu@cpu_has_tbm$qv
	dd	?live16436@224-?live16436@208
	dw	1
	dd	?live16436@240-@@stk@cpu@cpu_has_tbm$qv
	dd	?live16436@256-?live16436@240
	dw	1
?patch248	equ	2
?patch247	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	435
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	436
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	437
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	438
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mbcagcia
	dw	0
	dw	4102
	dw	0
	dw	439
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	440
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eobagcia
	dw	0
	dw	117
	dw	0
	dw	441
	dw	0
	dw	0
	dw	0
?patch244	equ	@732-@@stk@cpu@cpu_has_tbm$qv+5
?patch245	equ	0
?patch246	equ	@732-@@stk@cpu@cpu_has_tbm$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$efcagcia	label	dword
	dd	-1
	align	4
$micagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_clfsh$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_clfsh$qv	proc	near
?live16437@0:
	?debug L 1356
@733:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1359
?live16437@16: ; EBX = &$micagcia
	mov       eax,dword ptr [$efcagcia]
	cmp       eax,-1
	?debug L 1356
?live16437@32: ; 
	push      ebx
	mov       ebx,offset $micagcia
	?debug L 1359
?live16437@48: ; EBX = &$micagcia
	je        short @737
	?debug L 1360
?live16437@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @735
	?debug L 1362
?live16437@80: ; EBX = &$micagcia
@736:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@737:
	cmp       dword ptr [ebx+4],0
	jne       short @736
	cmp       dword ptr [ebx],0
	jne       short @736
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @740
@739:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@740:
	cmp       dword ptr [ebx+4],0
	jne       short @743
	cmp       dword ptr [ebx],0
@743:
	je        short @741
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @744
	cmp       eax,dword ptr [ebp-8]
@744:
	setne     al
	and       eax,1
	jmp       short @742
@741:
	xor       eax,eax
@742:
	test      al,al
	jne       short @739
	?debug L 1365
	push      0
	push      1
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1367
	mov       eax,dword ptr [ebp-16]
	?debug L 1365
	add       esp,24
	?debug L 1367
	and       eax,524288
	?debug L 1368
?live16437@160: ; EBX = &$micagcia, EAX = @temp3
	test      eax,eax
	?debug L 1367
?live16437@176: ; EBX = &$micagcia
	mov       dword ptr [$efcagcia],eax
	?debug L 1368
?live16437@192: ; EBX = &$micagcia, EAX = @temp3
	setne     dl
	?debug L 1369
?live16437@208: ; EBX = &$micagcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1368
?live16437@224: ; EBX = &$micagcia, EAX = @temp3
	and       edx,1
	?debug L 1369
?live16437@240: ; EBX = &$micagcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1368
?live16437@256: ; EBX = &$micagcia, EAX = @temp3
	mov       eax,edx
	?debug L 1371
?live16437@272: ; 
@745:
@735:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	442
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
	dw	443
	dw	0
	dw	0
	dw	0
	dw	?patch252
	dw	529
	dw	?patch253
	dd	?live16437@208-@@stk@cpu@cpu_has_clfsh$qv
	dd	?live16437@224-?live16437@208
	dw	1
	dd	?live16437@240-@@stk@cpu@cpu_has_clfsh$qv
	dd	?live16437@256-?live16437@240
	dw	1
?patch253	equ	2
?patch252	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	444
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	445
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	446
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	447
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$micagcia
	dw	0
	dw	4102
	dw	0
	dw	448
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	449
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$efcagcia
	dw	0
	dw	117
	dw	0
	dw	450
	dw	0
	dw	0
	dw	0
?patch249	equ	@745-@@stk@cpu@cpu_has_clfsh$qv+5
?patch250	equ	0
?patch251	equ	@745-@@stk@cpu@cpu_has_clfsh$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$emcagcia	label	dword
	dd	-1
	align	4
$mpcagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_pclmulqdq$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_pclmulqdq$qv	proc	near
?live16438@0:
	?debug L 1374
@746:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1377
?live16438@16: ; EBX = &$mpcagcia
	mov       eax,dword ptr [$emcagcia]
	cmp       eax,-1
	?debug L 1374
?live16438@32: ; 
	push      ebx
	mov       ebx,offset $mpcagcia
	?debug L 1377
?live16438@48: ; EBX = &$mpcagcia
	je        short @750
	?debug L 1378
?live16438@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @748
	?debug L 1380
?live16438@80: ; EBX = &$mpcagcia
@749:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@750:
	cmp       dword ptr [ebx+4],0
	jne       short @749
	cmp       dword ptr [ebx],0
	jne       short @749
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @753
@752:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@753:
	cmp       dword ptr [ebx+4],0
	jne       short @756
	cmp       dword ptr [ebx],0
@756:
	je        short @754
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @757
	cmp       eax,dword ptr [ebp-8]
@757:
	setne     al
	and       eax,1
	jmp       short @755
@754:
	xor       eax,eax
@755:
	test      al,al
	jne       short @752
	?debug L 1383
	push      0
	push      1
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1385
	mov       eax,dword ptr [ebp-16]
	?debug L 1383
	add       esp,24
	?debug L 1385
	and       eax,32
	?debug L 1386
?live16438@160: ; EBX = &$mpcagcia, EAX = @temp3
	test      eax,eax
	?debug L 1385
?live16438@176: ; EBX = &$mpcagcia
	mov       dword ptr [$emcagcia],eax
	?debug L 1386
?live16438@192: ; EBX = &$mpcagcia, EAX = @temp3
	setne     dl
	?debug L 1387
?live16438@208: ; EBX = &$mpcagcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1386
?live16438@224: ; EBX = &$mpcagcia, EAX = @temp3
	and       edx,1
	?debug L 1387
?live16438@240: ; EBX = &$mpcagcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1386
?live16438@256: ; EBX = &$mpcagcia, EAX = @temp3
	mov       eax,edx
	?debug L 1389
?live16438@272: ; 
@758:
@748:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	451
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
	dw	452
	dw	0
	dw	0
	dw	0
	dw	?patch257
	dw	529
	dw	?patch258
	dd	?live16438@208-@@stk@cpu@cpu_has_pclmulqdq$qv
	dd	?live16438@224-?live16438@208
	dw	1
	dd	?live16438@240-@@stk@cpu@cpu_has_pclmulqdq$qv
	dd	?live16438@256-?live16438@240
	dw	1
?patch258	equ	2
?patch257	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	453
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	454
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	455
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	456
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mpcagcia
	dw	0
	dw	4102
	dw	0
	dw	457
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	458
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$emcagcia
	dw	0
	dw	117
	dw	0
	dw	459
	dw	0
	dw	0
	dw	0
?patch254	equ	@758-@@stk@cpu@cpu_has_pclmulqdq$qv+5
?patch255	equ	0
?patch256	equ	@758-@@stk@cpu@cpu_has_pclmulqdq$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eddagcia	label	dword
	dd	-1
	align	4
$mgdagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_fxsr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_fxsr$qv	proc	near
?live16439@0:
	?debug L 1392
@759:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1395
?live16439@16: ; EBX = &$mgdagcia
	mov       eax,dword ptr [$eddagcia]
	cmp       eax,-1
	?debug L 1392
?live16439@32: ; 
	push      ebx
	mov       ebx,offset $mgdagcia
	?debug L 1395
?live16439@48: ; EBX = &$mgdagcia
	je        short @763
	?debug L 1396
?live16439@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @761
	?debug L 1398
?live16439@80: ; EBX = &$mgdagcia
@762:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@763:
	cmp       dword ptr [ebx+4],0
	jne       short @762
	cmp       dword ptr [ebx],0
	jne       short @762
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @766
@765:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@766:
	cmp       dword ptr [ebx+4],0
	jne       short @769
	cmp       dword ptr [ebx],0
@769:
	je        short @767
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @770
	cmp       eax,dword ptr [ebp-8]
@770:
	setne     al
	and       eax,1
	jmp       short @768
@767:
	xor       eax,eax
@768:
	test      al,al
	jne       short @765
	?debug L 1401
	push      0
	push      1
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1403
	mov       eax,dword ptr [ebp-16]
	?debug L 1401
	add       esp,24
	?debug L 1403
	and       eax,16777216
	?debug L 1404
?live16439@160: ; EBX = &$mgdagcia, EAX = @temp3
	test      eax,eax
	?debug L 1403
?live16439@176: ; EBX = &$mgdagcia
	mov       dword ptr [$eddagcia],eax
	?debug L 1404
?live16439@192: ; EBX = &$mgdagcia, EAX = @temp3
	setne     dl
	?debug L 1405
?live16439@208: ; EBX = &$mgdagcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1404
?live16439@224: ; EBX = &$mgdagcia, EAX = @temp3
	and       edx,1
	?debug L 1405
?live16439@240: ; EBX = &$mgdagcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1404
?live16439@256: ; EBX = &$mgdagcia, EAX = @temp3
	mov       eax,edx
	?debug L 1407
?live16439@272: ; 
@771:
@761:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	460
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
	dw	461
	dw	0
	dw	0
	dw	0
	dw	?patch262
	dw	529
	dw	?patch263
	dd	?live16439@208-@@stk@cpu@cpu_has_fxsr$qv
	dd	?live16439@224-?live16439@208
	dw	1
	dd	?live16439@240-@@stk@cpu@cpu_has_fxsr$qv
	dd	?live16439@256-?live16439@240
	dw	1
?patch263	equ	2
?patch262	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	462
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	463
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	464
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	465
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mgdagcia
	dw	0
	dw	4102
	dw	0
	dw	466
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	467
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eddagcia
	dw	0
	dw	117
	dw	0
	dw	468
	dw	0
	dw	0
	dw	0
?patch259	equ	@771-@@stk@cpu@cpu_has_fxsr$qv+5
?patch260	equ	0
?patch261	equ	@771-@@stk@cpu@cpu_has_fxsr$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ekdagcia	label	dword
	dd	-1
	align	4
$mndagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_ss$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_ss$qv	proc	near
?live16440@0:
	?debug L 1410
@772:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1413
?live16440@16: ; EBX = &$mndagcia
	mov       eax,dword ptr [$ekdagcia]
	cmp       eax,-1
	?debug L 1410
?live16440@32: ; 
	push      ebx
	mov       ebx,offset $mndagcia
	?debug L 1413
?live16440@48: ; EBX = &$mndagcia
	je        short @776
	?debug L 1414
?live16440@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @774
	?debug L 1416
?live16440@80: ; EBX = &$mndagcia
@775:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@776:
	cmp       dword ptr [ebx+4],0
	jne       short @775
	cmp       dword ptr [ebx],0
	jne       short @775
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @779
@778:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@779:
	cmp       dword ptr [ebx+4],0
	jne       short @782
	cmp       dword ptr [ebx],0
@782:
	je        short @780
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @783
	cmp       eax,dword ptr [ebp-8]
@783:
	setne     al
	and       eax,1
	jmp       short @781
@780:
	xor       eax,eax
@781:
	test      al,al
	jne       short @778
	?debug L 1419
	push      0
	push      1
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1421
	mov       eax,dword ptr [ebp-16]
	?debug L 1419
	add       esp,24
	?debug L 1421
	and       eax,134217728
	?debug L 1422
?live16440@160: ; EBX = &$mndagcia, EAX = @temp3
	test      eax,eax
	?debug L 1421
?live16440@176: ; EBX = &$mndagcia
	mov       dword ptr [$ekdagcia],eax
	?debug L 1422
?live16440@192: ; EBX = &$mndagcia, EAX = @temp3
	setne     dl
	?debug L 1423
?live16440@208: ; EBX = &$mndagcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1422
?live16440@224: ; EBX = &$mndagcia, EAX = @temp3
	and       edx,1
	?debug L 1423
?live16440@240: ; EBX = &$mndagcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1422
?live16440@256: ; EBX = &$mndagcia, EAX = @temp3
	mov       eax,edx
	?debug L 1425
?live16440@272: ; 
@784:
@774:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	469
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
	dw	470
	dw	0
	dw	0
	dw	0
	dw	?patch267
	dw	529
	dw	?patch268
	dd	?live16440@208-@@stk@cpu@cpu_has_ss$qv
	dd	?live16440@224-?live16440@208
	dw	1
	dd	?live16440@240-@@stk@cpu@cpu_has_ss$qv
	dd	?live16440@256-?live16440@240
	dw	1
?patch268	equ	2
?patch267	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	471
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	472
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	473
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	474
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mndagcia
	dw	0
	dw	4102
	dw	0
	dw	475
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	476
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ekdagcia
	dw	0
	dw	117
	dw	0
	dw	477
	dw	0
	dw	0
	dw	0
?patch264	equ	@784-@@stk@cpu@cpu_has_ss$qv+5
?patch265	equ	0
?patch266	equ	@784-@@stk@cpu@cpu_has_ss$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ebeagcia	label	dword
	dd	-1
	align	4
$meeagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_mtrr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mtrr$qv	proc	near
?live16441@0:
	?debug L 1428
@785:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1431
?live16441@16: ; EBX = &$meeagcia
	mov       eax,dword ptr [$ebeagcia]
	cmp       eax,-1
	?debug L 1428
?live16441@32: ; 
	push      ebx
	mov       ebx,offset $meeagcia
	?debug L 1431
?live16441@48: ; EBX = &$meeagcia
	je        short @789
	?debug L 1432
?live16441@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @787
	?debug L 1434
?live16441@80: ; EBX = &$meeagcia
@788:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@789:
	cmp       dword ptr [ebx+4],0
	jne       short @788
	cmp       dword ptr [ebx],0
	jne       short @788
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @792
@791:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@792:
	cmp       dword ptr [ebx+4],0
	jne       short @795
	cmp       dword ptr [ebx],0
@795:
	je        short @793
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @796
	cmp       eax,dword ptr [ebp-8]
@796:
	setne     al
	and       eax,1
	jmp       short @794
@793:
	xor       eax,eax
@794:
	test      al,al
	jne       short @791
	?debug L 1437
	push      0
	push      1
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1439
	mov       eax,dword ptr [ebp-16]
	?debug L 1437
	add       esp,24
	?debug L 1439
	and       eax,4096
	?debug L 1440
?live16441@160: ; EBX = &$meeagcia, EAX = @temp3
	test      eax,eax
	?debug L 1439
?live16441@176: ; EBX = &$meeagcia
	mov       dword ptr [$ebeagcia],eax
	?debug L 1440
?live16441@192: ; EBX = &$meeagcia, EAX = @temp3
	setne     dl
	?debug L 1441
?live16441@208: ; EBX = &$meeagcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1440
?live16441@224: ; EBX = &$meeagcia, EAX = @temp3
	and       edx,1
	?debug L 1441
?live16441@240: ; EBX = &$meeagcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1440
?live16441@256: ; EBX = &$meeagcia, EAX = @temp3
	mov       eax,edx
	?debug L 1443
?live16441@272: ; 
@797:
@787:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	478
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
	dw	479
	dw	0
	dw	0
	dw	0
	dw	?patch272
	dw	529
	dw	?patch273
	dd	?live16441@208-@@stk@cpu@cpu_has_mtrr$qv
	dd	?live16441@224-?live16441@208
	dw	1
	dd	?live16441@240-@@stk@cpu@cpu_has_mtrr$qv
	dd	?live16441@256-?live16441@240
	dw	1
?patch273	equ	2
?patch272	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	480
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	481
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	482
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	483
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$meeagcia
	dw	0
	dw	4102
	dw	0
	dw	484
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	485
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ebeagcia
	dw	0
	dw	117
	dw	0
	dw	486
	dw	0
	dw	0
	dw	0
?patch269	equ	@797-@@stk@cpu@cpu_has_mtrr$qv+5
?patch270	equ	0
?patch271	equ	@797-@@stk@cpu@cpu_has_mtrr$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eieagcia	label	dword
	dd	-1
	align	4
$mleagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_msr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_msr$qv	proc	near
?live16442@0:
	?debug L 1446
@798:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1449
?live16442@16: ; EBX = &$mleagcia
	mov       eax,dword ptr [$eieagcia]
	cmp       eax,-1
	?debug L 1446
?live16442@32: ; 
	push      ebx
	mov       ebx,offset $mleagcia
	?debug L 1449
?live16442@48: ; EBX = &$mleagcia
	je        short @802
	?debug L 1450
?live16442@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @800
	?debug L 1452
?live16442@80: ; EBX = &$mleagcia
@801:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@802:
	cmp       dword ptr [ebx+4],0
	jne       short @801
	cmp       dword ptr [ebx],0
	jne       short @801
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @805
@804:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@805:
	cmp       dword ptr [ebx+4],0
	jne       short @808
	cmp       dword ptr [ebx],0
@808:
	je        short @806
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @809
	cmp       eax,dword ptr [ebp-8]
@809:
	setne     al
	and       eax,1
	jmp       short @807
@806:
	xor       eax,eax
@807:
	test      al,al
	jne       short @804
	?debug L 1455
	push      0
	push      1
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1457
	mov       eax,dword ptr [ebp-16]
	?debug L 1455
	add       esp,24
	?debug L 1457
	and       eax,4096
	?debug L 1458
?live16442@160: ; EBX = &$mleagcia, EAX = @temp3
	test      eax,eax
	?debug L 1457
?live16442@176: ; EBX = &$mleagcia
	mov       dword ptr [$eieagcia],eax
	?debug L 1458
?live16442@192: ; EBX = &$mleagcia, EAX = @temp3
	setne     dl
	?debug L 1459
?live16442@208: ; EBX = &$mleagcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1458
?live16442@224: ; EBX = &$mleagcia, EAX = @temp3
	and       edx,1
	?debug L 1459
?live16442@240: ; EBX = &$mleagcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1458
?live16442@256: ; EBX = &$mleagcia, EAX = @temp3
	mov       eax,edx
	?debug L 1461
?live16442@272: ; 
@810:
@800:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	487
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
	dw	488
	dw	0
	dw	0
	dw	0
	dw	?patch277
	dw	529
	dw	?patch278
	dd	?live16442@208-@@stk@cpu@cpu_has_msr$qv
	dd	?live16442@224-?live16442@208
	dw	1
	dd	?live16442@240-@@stk@cpu@cpu_has_msr$qv
	dd	?live16442@256-?live16442@240
	dw	1
?patch278	equ	2
?patch277	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	489
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	490
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	491
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	492
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mleagcia
	dw	0
	dw	4102
	dw	0
	dw	493
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	494
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eieagcia
	dw	0
	dw	117
	dw	0
	dw	495
	dw	0
	dw	0
	dw	0
?patch274	equ	@810-@@stk@cpu@cpu_has_msr$qv+5
?patch275	equ	0
?patch276	equ	@810-@@stk@cpu@cpu_has_msr$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epeagcia	label	dword
	dd	-1
	align	4
$mcfagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_tsc$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_tsc$qv	proc	near
?live16443@0:
	?debug L 1464
@811:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1467
?live16443@16: ; EBX = &$mcfagcia
	mov       eax,dword ptr [$epeagcia]
	cmp       eax,-1
	?debug L 1464
?live16443@32: ; 
	push      ebx
	mov       ebx,offset $mcfagcia
	?debug L 1467
?live16443@48: ; EBX = &$mcfagcia
	je        short @815
	?debug L 1468
?live16443@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @813
	?debug L 1470
?live16443@80: ; EBX = &$mcfagcia
@814:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@815:
	cmp       dword ptr [ebx+4],0
	jne       short @814
	cmp       dword ptr [ebx],0
	jne       short @814
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @818
@817:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@818:
	cmp       dword ptr [ebx+4],0
	jne       short @821
	cmp       dword ptr [ebx],0
@821:
	je        short @819
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @822
	cmp       eax,dword ptr [ebp-8]
@822:
	setne     al
	and       eax,1
	jmp       short @820
@819:
	xor       eax,eax
@820:
	test      al,al
	jne       short @817
	?debug L 1473
	push      0
	push      1
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1475
	mov       eax,dword ptr [ebp-12]
	?debug L 1473
	add       esp,24
	?debug L 1475
	and       eax,16
	?debug L 1476
?live16443@160: ; EBX = &$mcfagcia, EAX = @temp3
	test      eax,eax
	?debug L 1475
?live16443@176: ; EBX = &$mcfagcia
	mov       dword ptr [$epeagcia],eax
	?debug L 1476
?live16443@192: ; EBX = &$mcfagcia, EAX = @temp3
	setne     dl
	?debug L 1477
?live16443@208: ; EBX = &$mcfagcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1476
?live16443@224: ; EBX = &$mcfagcia, EAX = @temp3
	and       edx,1
	?debug L 1477
?live16443@240: ; EBX = &$mcfagcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1476
?live16443@256: ; EBX = &$mcfagcia, EAX = @temp3
	mov       eax,edx
	?debug L 1479
?live16443@272: ; 
@823:
@813:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	497
	dw	0
	dw	0
	dw	0
	dw	?patch282
	dw	529
	dw	?patch283
	dd	?live16443@208-@@stk@cpu@cpu_has_tsc$qv
	dd	?live16443@224-?live16443@208
	dw	1
	dd	?live16443@240-@@stk@cpu@cpu_has_tsc$qv
	dd	?live16443@256-?live16443@240
	dw	1
?patch283	equ	2
?patch282	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	498
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	499
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	500
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	501
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mcfagcia
	dw	0
	dw	4102
	dw	0
	dw	502
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	503
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$epeagcia
	dw	0
	dw	117
	dw	0
	dw	504
	dw	0
	dw	0
	dw	0
?patch279	equ	@823-@@stk@cpu@cpu_has_tsc$qv+5
?patch280	equ	0
?patch281	equ	@823-@@stk@cpu@cpu_has_tsc$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$egfagcia	label	dword
	dd	-1
	align	4
$mjfagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_psn$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_psn$qv	proc	near
?live16444@0:
	?debug L 1482
@824:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1485
?live16444@16: ; EBX = &$mjfagcia
	mov       eax,dword ptr [$egfagcia]
	cmp       eax,-1
	?debug L 1482
?live16444@32: ; 
	push      ebx
	mov       ebx,offset $mjfagcia
	?debug L 1485
?live16444@48: ; EBX = &$mjfagcia
	je        short @828
	?debug L 1486
?live16444@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @826
	?debug L 1488
?live16444@80: ; EBX = &$mjfagcia
@827:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@828:
	cmp       dword ptr [ebx+4],0
	jne       short @827
	cmp       dword ptr [ebx],0
	jne       short @827
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @831
@830:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@831:
	cmp       dword ptr [ebx+4],0
	jne       short @834
	cmp       dword ptr [ebx],0
@834:
	je        short @832
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @835
	cmp       eax,dword ptr [ebp-8]
@835:
	setne     al
	and       eax,1
	jmp       short @833
@832:
	xor       eax,eax
@833:
	test      al,al
	jne       short @830
	?debug L 1491
	push      0
	push      1
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1493
	mov       eax,dword ptr [ebp-12]
	?debug L 1491
	add       esp,24
	?debug L 1493
	and       eax,262144
	?debug L 1494
?live16444@160: ; EBX = &$mjfagcia, EAX = @temp3
	test      eax,eax
	?debug L 1493
?live16444@176: ; EBX = &$mjfagcia
	mov       dword ptr [$egfagcia],eax
	?debug L 1494
?live16444@192: ; EBX = &$mjfagcia, EAX = @temp3
	setne     dl
	?debug L 1495
?live16444@208: ; EBX = &$mjfagcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1494
?live16444@224: ; EBX = &$mjfagcia, EAX = @temp3
	and       edx,1
	?debug L 1495
?live16444@240: ; EBX = &$mjfagcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1494
?live16444@256: ; EBX = &$mjfagcia, EAX = @temp3
	mov       eax,edx
	?debug L 1497
?live16444@272: ; 
@836:
@826:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	506
	dw	0
	dw	0
	dw	0
	dw	?patch287
	dw	529
	dw	?patch288
	dd	?live16444@208-@@stk@cpu@cpu_has_psn$qv
	dd	?live16444@224-?live16444@208
	dw	1
	dd	?live16444@240-@@stk@cpu@cpu_has_psn$qv
	dd	?live16444@256-?live16444@240
	dw	1
?patch288	equ	2
?patch287	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	507
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	508
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	509
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	510
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mjfagcia
	dw	0
	dw	4102
	dw	0
	dw	511
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	512
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$egfagcia
	dw	0
	dw	117
	dw	0
	dw	513
	dw	0
	dw	0
	dw	0
?patch284	equ	@836-@@stk@cpu@cpu_has_psn$qv+5
?patch285	equ	0
?patch286	equ	@836-@@stk@cpu@cpu_has_psn$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$enfagcia	label	dword
	dd	-1
	align	4
$magagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_xsave$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_xsave$qv	proc	near
?live16445@0:
	?debug L 1500
@837:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1503
?live16445@16: ; EBX = &$magagcia
	mov       eax,dword ptr [$enfagcia]
	cmp       eax,-1
	?debug L 1500
?live16445@32: ; 
	push      ebx
	mov       ebx,offset $magagcia
	?debug L 1503
?live16445@48: ; EBX = &$magagcia
	je        short @841
	?debug L 1504
?live16445@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @839
	?debug L 1506
?live16445@80: ; EBX = &$magagcia
@840:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@841:
	cmp       dword ptr [ebx+4],0
	jne       short @840
	cmp       dword ptr [ebx],0
	jne       short @840
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @844
@843:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@844:
	cmp       dword ptr [ebx+4],0
	jne       short @847
	cmp       dword ptr [ebx],0
@847:
	je        short @845
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @848
	cmp       eax,dword ptr [ebp-8]
@848:
	setne     al
	and       eax,1
	jmp       short @846
@845:
	xor       eax,eax
@846:
	test      al,al
	jne       short @843
	?debug L 1509
	push      0
	push      1
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1511
	mov       eax,dword ptr [ebp-16]
	mov       edx,dword ptr [ebp-16]
	and       edx,134217728
	and       eax,67108864
	shr       edx,27
	?debug L 1509
	add       esp,24
	?debug L 1511
	shr       eax,26
	and       eax,edx
	?debug L 1512
?live16445@160: ; EBX = &$magagcia, EAX = @temp3
	test      eax,eax
	?debug L 1511
?live16445@176: ; EBX = &$magagcia
	mov       dword ptr [$enfagcia],eax
	?debug L 1512
?live16445@192: ; EBX = &$magagcia, EAX = @temp3
	setne     cl
	?debug L 1513
?live16445@208: ; EBX = &$magagcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1512
?live16445@224: ; EBX = &$magagcia, EAX = @temp3
	and       ecx,1
	?debug L 1513
?live16445@240: ; EBX = &$magagcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1512
?live16445@256: ; EBX = &$magagcia, EAX = @temp3
	mov       eax,ecx
	?debug L 1515
?live16445@272: ; 
@849:
@839:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	514
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
	dw	515
	dw	0
	dw	0
	dw	0
	dw	?patch292
	dw	529
	dw	?patch293
	dd	?live16445@208-@@stk@cpu@cpu_has_xsave$qv
	dd	?live16445@224-?live16445@208
	dw	1
	dd	?live16445@240-@@stk@cpu@cpu_has_xsave$qv
	dd	?live16445@256-?live16445@240
	dw	1
?patch293	equ	2
?patch292	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	516
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	517
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	518
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	519
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$magagcia
	dw	0
	dw	4102
	dw	0
	dw	520
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	521
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$enfagcia
	dw	0
	dw	117
	dw	0
	dw	522
	dw	0
	dw	0
	dw	0
?patch289	equ	@849-@@stk@cpu@cpu_has_xsave$qv+5
?patch290	equ	0
?patch291	equ	@849-@@stk@cpu@cpu_has_xsave$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eegagcia	label	dword
	dd	-1
	align	4
$mhgagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_clmul$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_clmul$qv	proc	near
?live16446@0:
	?debug L 1518
@850:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1521
?live16446@16: ; EBX = &$mhgagcia
	mov       eax,dword ptr [$eegagcia]
	cmp       eax,-1
	?debug L 1518
?live16446@32: ; 
	push      ebx
	mov       ebx,offset $mhgagcia
	?debug L 1521
?live16446@48: ; EBX = &$mhgagcia
	je        short @854
	?debug L 1522
?live16446@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @852
	?debug L 1524
?live16446@80: ; EBX = &$mhgagcia
@853:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@854:
	cmp       dword ptr [ebx+4],0
	jne       short @853
	cmp       dword ptr [ebx],0
	jne       short @853
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @857
@856:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@857:
	cmp       dword ptr [ebx+4],0
	jne       short @860
	cmp       dword ptr [ebx],0
@860:
	je        short @858
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @861
	cmp       eax,dword ptr [ebp-8]
@861:
	setne     al
	and       eax,1
	jmp       short @859
@858:
	xor       eax,eax
@859:
	test      al,al
	jne       short @856
	?debug L 1527
	push      0
	push      1
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1529
	mov       eax,dword ptr [ebp-16]
	?debug L 1527
	add       esp,24
	?debug L 1529
	and       eax,4
	?debug L 1530
?live16446@160: ; EBX = &$mhgagcia, EAX = @temp3
	test      eax,eax
	?debug L 1529
?live16446@176: ; EBX = &$mhgagcia
	mov       dword ptr [$eegagcia],eax
	?debug L 1530
?live16446@192: ; EBX = &$mhgagcia, EAX = @temp3
	setne     dl
	?debug L 1531
?live16446@208: ; EBX = &$mhgagcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1530
?live16446@224: ; EBX = &$mhgagcia, EAX = @temp3
	and       edx,1
	?debug L 1531
?live16446@240: ; EBX = &$mhgagcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1530
?live16446@256: ; EBX = &$mhgagcia, EAX = @temp3
	mov       eax,edx
	?debug L 1533
?live16446@272: ; 
@862:
@852:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	524
	dw	0
	dw	0
	dw	0
	dw	?patch297
	dw	529
	dw	?patch298
	dd	?live16446@208-@@stk@cpu@cpu_has_clmul$qv
	dd	?live16446@224-?live16446@208
	dw	1
	dd	?live16446@240-@@stk@cpu@cpu_has_clmul$qv
	dd	?live16446@256-?live16446@240
	dw	1
?patch298	equ	2
?patch297	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	525
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	526
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	527
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	528
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mhgagcia
	dw	0
	dw	4102
	dw	0
	dw	529
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	530
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eegagcia
	dw	0
	dw	117
	dw	0
	dw	531
	dw	0
	dw	0
	dw	0
?patch294	equ	@862-@@stk@cpu@cpu_has_clmul$qv+5
?patch295	equ	0
?patch296	equ	@862-@@stk@cpu@cpu_has_clmul$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$elgagcia	label	dword
	dd	-1
	align	4
$mogagcia	label	dword
	dd	0
	dd	0
	dd	0
	align	4
$echagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_psn$qv	segment virtual
	align	2
@@stk@cpu@cpu_psn$qv	proc	near
?live16447@0:
	?debug L 1536
@863:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	push      ebx
	push      esi
	mov       ebx,offset $echagcia
	mov       esi,offset $mogagcia
	?debug L 1540
?live16447@16: ; EBX = &$echagcia, ESI = &$mogagcia
	cmp       dword ptr [$elgagcia],-1
	je        short @867
	?debug L 1541
?live16447@32: ; ESI = &$mogagcia
	mov       eax,esi
	jmp       @865
	?debug L 1543
?live16447@48: ; EBX = &$echagcia, ESI = &$mogagcia
@866:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@867:
	cmp       dword ptr [ebx+4],0
	jne       short @866
	cmp       dword ptr [ebx],0
	jne       short @866
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       edx,dword ptr [ebp-8]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],edx
	jmp       short @870
@869:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@870:
	cmp       dword ptr [ebx+4],0
	jne       short @873
	cmp       dword ptr [ebx],0
@873:
	je        short @871
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @874
	cmp       eax,dword ptr [ebp-8]
@874:
	setne     cl
	and       ecx,1
	jmp       short @872
@871:
	xor       ecx,ecx
@872:
	test      cl,cl
	jne       short @869
	?debug L 1545
	xor       eax,eax
	mov       dword ptr [esi],eax
	?debug L 1546
	xor       edx,edx
	mov       dword ptr [esi+4],edx
	?debug L 1547
	xor       eax,eax
	mov       dword ptr [esi+8],eax
	?debug L 1548
	call      @@stk@cpu@cpu_has_psn$qv
	test      al,al
	jne       short @875
	?debug L 1549
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1550
?live16447@144: ; ESI = &$mogagcia
	mov       eax,esi
	jmp       short @865
	?debug L 1554
?live16447@160: ; EBX = &$echagcia, ESI = &$mogagcia
@875:
	push      0
	push      3
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1556
	mov       ecx,dword ptr [ebp-24]
	?debug L 1554
	add       esp,24
	?debug L 1556
	mov       dword ptr [esi+8],ecx
	?debug L 1557
	mov       eax,dword ptr [ebp-12]
	mov       dword ptr [esi+4],eax
	?debug L 1560
?live16447@240: ; ESI = &$mogagcia
	mov       eax,esi
	?debug L 1558
?live16447@256: ; EBX = &$echagcia, ESI = &$mogagcia
	mov       edx,dword ptr [ebp-16]
	mov       dword ptr [esi],edx
	?debug L 1559
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
	?debug L 1561
?live16447@288: ; 
@876:
@865:
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	532
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
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	533
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	534
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	535
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	536
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$echagcia
	dw	0
	dw	4102
	dw	0
	dw	537
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	538
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mogagcia
	dw	0
	dw	4226
	dw	0
	dw	539
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$elgagcia
	dw	0
	dw	117
	dw	0
	dw	540
	dw	0
	dw	0
	dw	0
?patch299	equ	@876-@@stk@cpu@cpu_psn$qv+6
?patch300	equ	0
?patch301	equ	@876-@@stk@cpu@cpu_psn$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	5
	dw	65504
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mfhagcia	label	dword
	dd	-1
	align	4
$ejhagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_fma$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_fma$qv	proc	near
?live16448@0:
	?debug L 1564
@877:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1567
?live16448@16: ; EBX = &$ejhagcia
	mov       eax,dword ptr [$mfhagcia]
	cmp       eax,-1
	?debug L 1564
?live16448@32: ; 
	push      ebx
	mov       ebx,offset $ejhagcia
	?debug L 1567
?live16448@48: ; EBX = &$ejhagcia
	jne       @879
	?debug L 1568
?live16448@64: ; EAX = @temp3
	jmp       short @881
	?debug L 1570
?live16448@80: ; EBX = &$ejhagcia
@880:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@881:
	cmp       dword ptr [ebx+4],0
	jne       short @880
	cmp       dword ptr [ebx],0
	jne       short @880
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       edx,dword ptr [ebp-8]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],edx
	jmp       short @884
@883:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@884:
	cmp       dword ptr [ebx+4],0
	jne       short @887
	cmp       dword ptr [ebx],0
@887:
	je        short @885
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @888
	cmp       eax,dword ptr [ebp-8]
@888:
	setne     cl
	and       ecx,1
	jmp       short @886
@885:
	xor       ecx,ecx
@886:
	test      cl,cl
	jne       short @883
	?debug L 1573
	push      0
	push      1
	lea       eax,dword ptr [ebp-12]
	push      eax
	lea       edx,dword ptr [ebp-16]
	push      edx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1575
	test      byte ptr [ebp-15],16
	je        short @889
	?debug L 1576
	push      0
	push      -2147483647
	lea       ecx,dword ptr [ebp-12]
	push      ecx
	lea       eax,dword ptr [ebp-16]
	push      eax
	lea       edx,dword ptr [ebp-20]
	push      edx
	lea       ecx,dword ptr [ebp-24]
	push      ecx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	?debug L 1577
	test      byte ptr [ebp-14],1
	je        short @890
	?debug L 1578
	mov       dword ptr [$mfhagcia],4
	jmp       short @891
	?debug L 1580
@890:
	mov       dword ptr [$mfhagcia],3
	?debug L 1581
	jmp       short @891
	?debug L 1583
@889:
	xor       eax,eax
	mov       dword ptr [$mfhagcia],eax
	?debug L 1585
@891:
	cmp       dword ptr [$mfhagcia],0
	?debug L 1586
?live16448@240: ; EBX = &$ejhagcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1585
?live16448@256: ; EBX = &$ejhagcia
	setne     al
	and       eax,1
	?debug L 1587
?live16448@272: ; EAX = r
	xor       edx,edx
	mov       dl,al
	?debug L 1586
?live16448@288: ; EBX = &$ejhagcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1587
?live16448@304: ; EAX = r
	mov       eax,edx
	?debug L 1588
?live16448@320: ; 
@892:
@879:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	541
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
	dw	542
	dw	0
	dw	0
	dw	0
	dw	?patch305
	dw	529
	dw	?patch306
	dd	?live16448@240-@@stk@cpu@cpu_has_fma$qv
	dd	?live16448@256-?live16448@240
	dw	1
	dd	?live16448@272-@@stk@cpu@cpu_has_fma$qv
	dd	?live16448@320-?live16448@272
	dw	1
?patch306	equ	2
?patch305	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	543
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	544
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	545
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	546
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ejhagcia
	dw	0
	dw	4102
	dw	0
	dw	547
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	548
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mfhagcia
	dw	0
	dw	117
	dw	0
	dw	549
	dw	0
	dw	0
	dw	0
?patch302	equ	@892-@@stk@cpu@cpu_has_fma$qv+5
?patch303	equ	0
?patch304	equ	@892-@@stk@cpu@cpu_has_fma$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mmhagcia	label	dword
	dd	-1
	align	4
$eaiagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_aes$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_aes$qv	proc	near
?live16449@0:
	?debug L 1591
@893:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1594
?live16449@16: ; EBX = &$eaiagcia
	mov       eax,dword ptr [$mmhagcia]
	cmp       eax,-1
	?debug L 1591
?live16449@32: ; 
	push      ebx
	mov       ebx,offset $eaiagcia
	?debug L 1594
?live16449@48: ; EBX = &$eaiagcia
	je        short @897
	?debug L 1595
?live16449@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @895
	?debug L 1597
?live16449@80: ; EBX = &$eaiagcia
@896:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@897:
	cmp       dword ptr [ebx+4],0
	jne       short @896
	cmp       dword ptr [ebx],0
	jne       short @896
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @900
@899:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@900:
	cmp       dword ptr [ebx+4],0
	jne       short @903
	cmp       dword ptr [ebx],0
@903:
	je        short @901
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @904
	cmp       eax,dword ptr [ebp-8]
@904:
	setne     al
	and       eax,1
	jmp       short @902
@901:
	xor       eax,eax
@902:
	test      al,al
	jne       short @899
	?debug L 1600
	push      0
	push      1
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1602
	mov       eax,dword ptr [ebp-16]
	?debug L 1600
	add       esp,24
	?debug L 1602
	and       eax,33554432
	?debug L 1603
?live16449@160: ; EBX = &$eaiagcia, EAX = @temp3
	test      eax,eax
	?debug L 1602
?live16449@176: ; EBX = &$eaiagcia
	mov       dword ptr [$mmhagcia],eax
	?debug L 1603
?live16449@192: ; EBX = &$eaiagcia, EAX = @temp3
	setne     dl
	?debug L 1604
?live16449@208: ; EBX = &$eaiagcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1603
?live16449@224: ; EBX = &$eaiagcia, EAX = @temp3
	and       edx,1
	?debug L 1604
?live16449@240: ; EBX = &$eaiagcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1603
?live16449@256: ; EBX = &$eaiagcia, EAX = @temp3
	mov       eax,edx
	?debug L 1606
?live16449@272: ; 
@905:
@895:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	551
	dw	0
	dw	0
	dw	0
	dw	?patch310
	dw	529
	dw	?patch311
	dd	?live16449@208-@@stk@cpu@cpu_has_aes$qv
	dd	?live16449@224-?live16449@208
	dw	1
	dd	?live16449@240-@@stk@cpu@cpu_has_aes$qv
	dd	?live16449@256-?live16449@240
	dw	1
?patch311	equ	2
?patch310	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	552
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	553
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	554
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	555
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eaiagcia
	dw	0
	dw	4102
	dw	0
	dw	556
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	557
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mmhagcia
	dw	0
	dw	117
	dw	0
	dw	558
	dw	0
	dw	0
	dw	0
?patch307	equ	@905-@@stk@cpu@cpu_has_aes$qv+5
?patch308	equ	0
?patch309	equ	@905-@@stk@cpu@cpu_has_aes$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mdiagcia	label	dword
	dd	-1
	align	4
$ehiagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viaaes$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viaaes$qv	proc	near
?live16450@0:
	?debug L 1609
@906:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1612
?live16450@16: ; EBX = &$ehiagcia
	mov       eax,dword ptr [$mdiagcia]
	cmp       eax,-1
	?debug L 1609
?live16450@32: ; 
	push      ebx
	mov       ebx,offset $ehiagcia
	?debug L 1612
?live16450@48: ; EBX = &$ehiagcia
	je        short @910
	?debug L 1613
?live16450@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @908
	?debug L 1615
?live16450@80: ; EBX = &$ehiagcia
@909:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@910:
	cmp       dword ptr [ebx+4],0
	jne       short @909
	cmp       dword ptr [ebx],0
	jne       short @909
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @913
@912:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@913:
	cmp       dword ptr [ebx+4],0
	jne       short @916
	cmp       dword ptr [ebx],0
@916:
	je        short @914
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @917
	cmp       eax,dword ptr [ebp-8]
@917:
	setne     al
	and       eax,1
	jmp       short @915
@914:
	xor       eax,eax
@915:
	test      al,al
	jne       short @912
	?debug L 1618
	push      0
	push      -1073741823
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1620
	mov       eax,dword ptr [ebp-12]
	?debug L 1618
	add       esp,24
	?debug L 1620
	and       eax,128
	?debug L 1621
?live16450@160: ; EBX = &$ehiagcia, EAX = @temp3
	test      eax,eax
	?debug L 1620
?live16450@176: ; EBX = &$ehiagcia
	mov       dword ptr [$mdiagcia],eax
	?debug L 1621
?live16450@192: ; EBX = &$ehiagcia, EAX = @temp3
	setne     dl
	?debug L 1622
?live16450@208: ; EBX = &$ehiagcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1621
?live16450@224: ; EBX = &$ehiagcia, EAX = @temp3
	and       edx,1
	?debug L 1622
?live16450@240: ; EBX = &$ehiagcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1621
?live16450@256: ; EBX = &$ehiagcia, EAX = @temp3
	mov       eax,edx
	?debug L 1624
?live16450@272: ; 
@918:
@908:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	559
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
	dw	560
	dw	0
	dw	0
	dw	0
	dw	?patch315
	dw	529
	dw	?patch316
	dd	?live16450@208-@@stk@cpu@cpu_has_viaaes$qv
	dd	?live16450@224-?live16450@208
	dw	1
	dd	?live16450@240-@@stk@cpu@cpu_has_viaaes$qv
	dd	?live16450@256-?live16450@240
	dw	1
?patch316	equ	2
?patch315	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	561
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	562
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	563
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	564
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$ehiagcia
	dw	0
	dw	4102
	dw	0
	dw	565
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	566
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mdiagcia
	dw	0
	dw	117
	dw	0
	dw	567
	dw	0
	dw	0
	dw	0
?patch312	equ	@918-@@stk@cpu@cpu_has_viaaes$qv+5
?patch313	equ	0
?patch314	equ	@918-@@stk@cpu@cpu_has_viaaes$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mkiagcia	label	dword
	dd	-1
	align	4
$eoiagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viarng$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viarng$qv	proc	near
?live16451@0:
	?debug L 1627
@919:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1630
?live16451@16: ; EBX = &$eoiagcia
	mov       eax,dword ptr [$mkiagcia]
	cmp       eax,-1
	?debug L 1627
?live16451@32: ; 
	push      ebx
	mov       ebx,offset $eoiagcia
	?debug L 1630
?live16451@48: ; EBX = &$eoiagcia
	je        short @923
	?debug L 1631
?live16451@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @921
	?debug L 1633
?live16451@80: ; EBX = &$eoiagcia
@922:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@923:
	cmp       dword ptr [ebx+4],0
	jne       short @922
	cmp       dword ptr [ebx],0
	jne       short @922
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @926
@925:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@926:
	cmp       dword ptr [ebx+4],0
	jne       short @929
	cmp       dword ptr [ebx],0
@929:
	je        short @927
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @930
	cmp       eax,dword ptr [ebp-8]
@930:
	setne     al
	and       eax,1
	jmp       short @928
@927:
	xor       eax,eax
@928:
	test      al,al
	jne       short @925
	?debug L 1636
	push      0
	push      -1073741823
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1638
	mov       eax,dword ptr [ebp-12]
	?debug L 1636
	add       esp,24
	?debug L 1638
	and       eax,8
	?debug L 1639
?live16451@160: ; EBX = &$eoiagcia, EAX = @temp3
	test      eax,eax
	?debug L 1638
?live16451@176: ; EBX = &$eoiagcia
	mov       dword ptr [$mkiagcia],eax
	?debug L 1639
?live16451@192: ; EBX = &$eoiagcia, EAX = @temp3
	setne     dl
	?debug L 1640
?live16451@208: ; EBX = &$eoiagcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1639
?live16451@224: ; EBX = &$eoiagcia, EAX = @temp3
	and       edx,1
	?debug L 1640
?live16451@240: ; EBX = &$eoiagcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1639
?live16451@256: ; EBX = &$eoiagcia, EAX = @temp3
	mov       eax,edx
	?debug L 1642
?live16451@272: ; 
@931:
@921:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	569
	dw	0
	dw	0
	dw	0
	dw	?patch320
	dw	529
	dw	?patch321
	dd	?live16451@208-@@stk@cpu@cpu_has_viarng$qv
	dd	?live16451@224-?live16451@208
	dw	1
	dd	?live16451@240-@@stk@cpu@cpu_has_viarng$qv
	dd	?live16451@256-?live16451@240
	dw	1
?patch321	equ	2
?patch320	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	570
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	571
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	572
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	573
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$eoiagcia
	dw	0
	dw	4102
	dw	0
	dw	574
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	575
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mkiagcia
	dw	0
	dw	117
	dw	0
	dw	576
	dw	0
	dw	0
	dw	0
?patch317	equ	@931-@@stk@cpu@cpu_has_viarng$qv+5
?patch318	equ	0
?patch319	equ	@931-@@stk@cpu@cpu_has_viarng$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mbjagcia	label	dword
	dd	-1
	align	4
$efjagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viahash$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viahash$qv	proc	near
?live16452@0:
	?debug L 1645
@932:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1648
?live16452@16: ; EBX = &$efjagcia
	mov       eax,dword ptr [$mbjagcia]
	cmp       eax,-1
	?debug L 1645
?live16452@32: ; 
	push      ebx
	mov       ebx,offset $efjagcia
	?debug L 1648
?live16452@48: ; EBX = &$efjagcia
	je        short @936
	?debug L 1649
?live16452@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @934
	?debug L 1651
?live16452@80: ; EBX = &$efjagcia
@935:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@936:
	cmp       dword ptr [ebx+4],0
	jne       short @935
	cmp       dword ptr [ebx],0
	jne       short @935
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @939
@938:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@939:
	cmp       dword ptr [ebx+4],0
	jne       short @942
	cmp       dword ptr [ebx],0
@942:
	je        short @940
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @943
	cmp       eax,dword ptr [ebp-8]
@943:
	setne     al
	and       eax,1
	jmp       short @941
@940:
	xor       eax,eax
@941:
	test      al,al
	jne       short @938
	?debug L 1654
	push      0
	push      -1073741823
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1656
	mov       eax,dword ptr [ebp-12]
	?debug L 1654
	add       esp,24
	?debug L 1656
	and       eax,2048
	?debug L 1657
?live16452@160: ; EBX = &$efjagcia, EAX = @temp3
	test      eax,eax
	?debug L 1656
?live16452@176: ; EBX = &$efjagcia
	mov       dword ptr [$mbjagcia],eax
	?debug L 1657
?live16452@192: ; EBX = &$efjagcia, EAX = @temp3
	setne     dl
	?debug L 1658
?live16452@208: ; EBX = &$efjagcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1657
?live16452@224: ; EBX = &$efjagcia, EAX = @temp3
	and       edx,1
	?debug L 1658
?live16452@240: ; EBX = &$efjagcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1657
?live16452@256: ; EBX = &$efjagcia, EAX = @temp3
	mov       eax,edx
	?debug L 1660
?live16452@272: ; 
@944:
@934:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	577
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
	dw	578
	dw	0
	dw	0
	dw	0
	dw	?patch325
	dw	529
	dw	?patch326
	dd	?live16452@208-@@stk@cpu@cpu_has_viahash$qv
	dd	?live16452@224-?live16452@208
	dw	1
	dd	?live16452@240-@@stk@cpu@cpu_has_viahash$qv
	dd	?live16452@256-?live16452@240
	dw	1
?patch326	equ	2
?patch325	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	579
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	580
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	581
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	582
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$efjagcia
	dw	0
	dw	4102
	dw	0
	dw	583
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	584
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mbjagcia
	dw	0
	dw	117
	dw	0
	dw	585
	dw	0
	dw	0
	dw	0
?patch322	equ	@944-@@stk@cpu@cpu_has_viahash$qv+5
?patch323	equ	0
?patch324	equ	@944-@@stk@cpu@cpu_has_viahash$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mijagcia	label	dword
	dd	-1
	align	4
$emjagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_rdseed$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_rdseed$qv	proc	near
?live16453@0:
	?debug L 1663
@945:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1666
?live16453@16: ; EBX = &$emjagcia
	mov       eax,dword ptr [$mijagcia]
	cmp       eax,-1
	?debug L 1663
?live16453@32: ; 
	push      ebx
	mov       ebx,offset $emjagcia
	?debug L 1666
?live16453@48: ; EBX = &$emjagcia
	je        short @949
	?debug L 1667
?live16453@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @947
	?debug L 1669
?live16453@80: ; EBX = &$emjagcia
@948:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@949:
	cmp       dword ptr [ebx+4],0
	jne       short @948
	cmp       dword ptr [ebx],0
	jne       short @948
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @952
@951:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@952:
	cmp       dword ptr [ebx+4],0
	jne       short @955
	cmp       dword ptr [ebx],0
@955:
	je        short @953
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @956
	cmp       eax,dword ptr [ebp-8]
@956:
	setne     al
	and       eax,1
	jmp       short @954
@953:
	xor       eax,eax
@954:
	test      al,al
	jne       short @951
	?debug L 1672
	push      0
	push      7
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1674
	mov       eax,dword ptr [ebp-20]
	?debug L 1672
	add       esp,24
	?debug L 1674
	and       eax,262144
	?debug L 1675
?live16453@160: ; EBX = &$emjagcia, EAX = @temp3
	test      eax,eax
	?debug L 1674
?live16453@176: ; EBX = &$emjagcia
	mov       dword ptr [$mijagcia],eax
	?debug L 1675
?live16453@192: ; EBX = &$emjagcia, EAX = @temp3
	setne     dl
	?debug L 1676
?live16453@208: ; EBX = &$emjagcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1675
?live16453@224: ; EBX = &$emjagcia, EAX = @temp3
	and       edx,1
	?debug L 1676
?live16453@240: ; EBX = &$emjagcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1675
?live16453@256: ; EBX = &$emjagcia, EAX = @temp3
	mov       eax,edx
	?debug L 1678
?live16453@272: ; 
@957:
@947:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	586
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
	dw	587
	dw	0
	dw	0
	dw	0
	dw	?patch330
	dw	529
	dw	?patch331
	dd	?live16453@208-@@stk@cpu@cpu_has_rdseed$qv
	dd	?live16453@224-?live16453@208
	dw	1
	dd	?live16453@240-@@stk@cpu@cpu_has_rdseed$qv
	dd	?live16453@256-?live16453@240
	dw	1
?patch331	equ	2
?patch330	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	588
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	589
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	590
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	591
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$emjagcia
	dw	0
	dw	4102
	dw	0
	dw	592
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	593
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mijagcia
	dw	0
	dw	117
	dw	0
	dw	594
	dw	0
	dw	0
	dw	0
?patch327	equ	@957-@@stk@cpu@cpu_has_rdseed$qv+5
?patch328	equ	0
?patch329	equ	@957-@@stk@cpu@cpu_has_rdseed$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_DATA	segment dword public use32 'DATA'
	align	4
$mpjagcia	label	dword
	dd	-1
	align	4
$edkagcia	label	qword
	db        0,0,0,0,0,0,0,0
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_rdrand$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_rdrand$qv	proc	near
?live16454@0:
	?debug L 1681
@958:
	push      ebp
	mov       ebp,esp
	add       esp,-24
	?debug L 1684
?live16454@16: ; EBX = &$edkagcia
	mov       eax,dword ptr [$mpjagcia]
	cmp       eax,-1
	?debug L 1681
?live16454@32: ; 
	push      ebx
	mov       ebx,offset $edkagcia
	?debug L 1684
?live16454@48: ; EBX = &$edkagcia
	je        short @962
	?debug L 1685
?live16454@64: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       eax,edx
	jmp       @960
	?debug L 1687
?live16454@80: ; EBX = &$edkagcia
@961:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@962:
	cmp       dword ptr [ebx+4],0
	jne       short @961
	cmp       dword ptr [ebx],0
	jne       short @961
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-8],eax
	mov       dword ptr [ebp-4],edx
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ebx+4],ecx
	jmp       short @965
@964:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@965:
	cmp       dword ptr [ebx+4],0
	jne       short @968
	cmp       dword ptr [ebx],0
@968:
	je        short @966
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-4]
	jne       short @969
	cmp       eax,dword ptr [ebp-8]
@969:
	setne     al
	and       eax,1
	jmp       short @967
@966:
	xor       eax,eax
@967:
	test      al,al
	jne       short @964
	?debug L 1690
	push      0
	push      1
	lea       edx,dword ptr [ebp-12]
	push      edx
	lea       ecx,dword ptr [ebp-16]
	push      ecx
	lea       eax,dword ptr [ebp-20]
	push      eax
	lea       edx,dword ptr [ebp-24]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	?debug L 1692
	mov       eax,dword ptr [ebp-16]
	?debug L 1690
	add       esp,24
	?debug L 1692
	and       eax,1073741824
	?debug L 1693
?live16454@160: ; EBX = &$edkagcia, EAX = @temp3
	test      eax,eax
	?debug L 1692
?live16454@176: ; EBX = &$edkagcia
	mov       dword ptr [$mpjagcia],eax
	?debug L 1693
?live16454@192: ; EBX = &$edkagcia, EAX = @temp3
	setne     dl
	?debug L 1694
?live16454@208: ; EBX = &$edkagcia, EAX = r
	mov       dword ptr [ebx],0
	?debug L 1693
?live16454@224: ; EBX = &$edkagcia, EAX = @temp3
	and       edx,1
	?debug L 1694
?live16454@240: ; EBX = &$edkagcia, EAX = r
	mov       dword ptr [ebx+4],0
	?debug L 1693
?live16454@256: ; EBX = &$edkagcia, EAX = @temp3
	mov       eax,edx
	?debug L 1696
?live16454@272: ; 
@970:
@960:
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
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
	dw	596
	dw	0
	dw	0
	dw	0
	dw	?patch335
	dw	529
	dw	?patch336
	dd	?live16454@208-@@stk@cpu@cpu_has_rdrand$qv
	dd	?live16454@224-?live16454@208
	dw	1
	dd	?live16454@240-@@stk@cpu@cpu_has_rdrand$qv
	dd	?live16454@256-?live16454@240
	dw	1
?patch336	equ	2
?patch335	equ	24
	dw	18
	dw	512
	dw	65512
	dw	65535
	dw	117
	dw	0
	dw	597
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65516
	dw	65535
	dw	117
	dw	0
	dw	598
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65520
	dw	65535
	dw	117
	dw	0
	dw	599
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65524
	dw	65535
	dw	117
	dw	0
	dw	600
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$edkagcia
	dw	0
	dw	4102
	dw	0
	dw	601
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65528
	dw	65535
	dw	118
	dw	0
	dw	602
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	$mpjagcia
	dw	0
	dw	117
	dw	0
	dw	603
	dw	0
	dw	0
	dw	0
?patch332	equ	@970-@@stk@cpu@cpu_has_rdrand$qv+5
?patch333	equ	0
?patch334	equ	@970-@@stk@cpu@cpu_has_rdrand$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65508
	dw	65535
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_print_info$qv	segment virtual
	align	2
@@stk@cpu@cpu_print_info$qv	proc	near
?live16455@0:
	?debug L 1705
@971:
	push      ebp
	mov       ebp,esp
	push      ebx
	mov       ebx,offset s@
	?debug L 1708
?live16455@16: ; EBX = &s@
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	lea       eax,dword ptr [ebx+39]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,8
	?debug L 1709
	call      @@stk@cpu@cpu_name$qv
	push      eax
	lea       edx,dword ptr [ebx+52]
	push      edx
	call      @@stk@con@prints$qpxce
	add       esp,8
	?debug L 1710
	push      1
	call      @@stk@cpu@cpu_num_mhz$qo
	pop       ecx
	push      eax
	lea       ecx,dword ptr [ebx+73]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,8
	?debug L 1711
	push      0
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @972
	lea       edx,dword ptr [ebx+125]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @973
@972:
	lea       eax,dword ptr [ebx+125]
	push      eax
	lea       edx,dword ptr [ebx+123]
	push      edx
	lea       ecx,dword ptr [ebx+153]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1712
@973:
	push      0
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @974
	lea       edx,dword ptr [ebx+164]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @975
@974:
	lea       eax,dword ptr [ebx+164]
	push      eax
	lea       edx,dword ptr [ebx+123]
	push      edx
	lea       ecx,dword ptr [ebx+153]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1713
@975:
	lea       eax,dword ptr [ebx+197]
	push      eax
	call      @@stk@con@prints$qpxce
	pop       ecx
	?debug L 1714
	push      1
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @976
	lea       edx,dword ptr [ebx+239]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @977
@976:
	lea       edx,dword ptr [ebx+239]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1715
@977:
	push      1
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @978
	lea       edx,dword ptr [ebx+267]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @979
@978:
	lea       edx,dword ptr [ebx+267]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1716
@979:
	push      2
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @980
	lea       edx,dword ptr [ebx+300]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @981
@980:
	lea       edx,dword ptr [ebx+300]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1717
@981:
	push      2
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @982
	lea       edx,dword ptr [ebx+328]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @983
@982:
	lea       edx,dword ptr [ebx+328]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1718
@983:
	push      3
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @984
	lea       edx,dword ptr [ebx+361]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @985
@984:
	lea       edx,dword ptr [ebx+361]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1719
@985:
	push      3
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @986
	lea       edx,dword ptr [ebx+389]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @987
@986:
	lea       edx,dword ptr [ebx+389]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1720
@987:
	call      @@stk@cpu@cpu_num_cores$qv
	test      eax,eax
	je        short @988
	lea       edx,dword ptr [ebx+422]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @989
@988:
	lea       edx,dword ptr [ebx+422]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1721
@989:
	call      @@stk@cpu@cpu_num_threads$qv
	test      eax,eax
	je        short @990
	lea       edx,dword ptr [ebx+448]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @991
@990:
	lea       edx,dword ptr [ebx+448]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1723
@991:
	call      @@stk@cpu@cpu_has_amd64$qv
	and       eax,255
	test      eax,eax
	je        short @992
	lea       edx,dword ptr [ebx+476]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @993
@992:
	lea       edx,dword ptr [ebx+476]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1724
@993:
	call      @@stk@cpu@cpu_has_ht$qv
	and       eax,255
	test      eax,eax
	je        short @994
	lea       edx,dword ptr [ebx+502]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @995
@994:
	lea       edx,dword ptr [ebx+502]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1725
@995:
	call      @@stk@cpu@cpu_has_mmx$qv
	and       eax,255
	test      eax,eax
	je        short @996
	lea       edx,dword ptr [ebx+525]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @997
@996:
	lea       edx,dword ptr [ebx+525]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1726
@997:
	call      @@stk@cpu@cpu_has_mmxext$qv
	and       eax,255
	test      eax,eax
	je        short @998
	lea       edx,dword ptr [ebx+549]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @999
@998:
	lea       edx,dword ptr [ebx+549]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1727
@999:
	call      @@stk@cpu@cpu_has_3dnow$qv
	test      eax,eax
	je        short @1000
	lea       edx,dword ptr [ebx+576]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1001
@1000:
	lea       edx,dword ptr [ebx+576]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1728
@1001:
	call      @@stk@cpu@cpu_has_3dnowprefetch$qv
	and       eax,255
	test      eax,eax
	je        short @1002
	lea       edx,dword ptr [ebx+602]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1003
@1002:
	lea       edx,dword ptr [ebx+602]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1729
@1003:
	call      @@stk@cpu@cpu_has_fxsr$qv
	and       eax,255
	test      eax,eax
	je        short @1004
	lea       edx,dword ptr [ebx+636]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1005
@1004:
	lea       edx,dword ptr [ebx+636]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1730
@1005:
	call      @@stk@cpu@cpu_has_sse$qv
	test      eax,eax
	je        short @1006
	lea       edx,dword ptr [ebx+661]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1007
@1006:
	lea       edx,dword ptr [ebx+661]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1731
@1007:
	call      @@stk@cpu@cpu_has_xsave$qv
	and       eax,255
	test      eax,eax
	je        short @1008
	lea       edx,dword ptr [ebx+685]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1009
@1008:
	lea       edx,dword ptr [ebx+685]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1732
@1009:
	call      @@stk@cpu@cpu_has_pclmulqdq$qv
	and       eax,255
	test      eax,eax
	je        short @1010
	lea       edx,dword ptr [ebx+711]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1011
@1010:
	lea       edx,dword ptr [ebx+711]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1733
@1011:
	call      @@stk@cpu@cpu_has_movbe$qv
	and       eax,255
	test      eax,eax
	je        short @1012
	lea       edx,dword ptr [ebx+741]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1013
@1012:
	lea       edx,dword ptr [ebx+741]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1734
@1013:
	call      @@stk@cpu@cpu_has_fma$qv
	test      eax,eax
	je        short @1014
	lea       edx,dword ptr [ebx+767]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1015
@1014:
	lea       edx,dword ptr [ebx+767]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1735
@1015:
	call      @@stk@cpu@cpu_has_popcnt$qv
	and       eax,255
	test      eax,eax
	je        short @1016
	lea       edx,dword ptr [ebx+791]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1017
@1016:
	lea       edx,dword ptr [ebx+791]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1736
@1017:
	call      @@stk@cpu@cpu_has_xop$qv
	and       eax,255
	test      eax,eax
	je        short @1018
	lea       edx,dword ptr [ebx+818]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1019
@1018:
	lea       edx,dword ptr [ebx+818]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1737
@1019:
	call      @@stk@cpu@cpu_has_lzcnt$qv
	and       eax,255
	test      eax,eax
	je        short @1020
	lea       edx,dword ptr [ebx+842]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1021
@1020:
	lea       edx,dword ptr [ebx+842]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1738
@1021:
	call      @@stk@cpu@cpu_has_f16c$qv
	and       eax,255
	test      eax,eax
	je        short @1022
	lea       edx,dword ptr [ebx+868]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1023
@1022:
	lea       edx,dword ptr [ebx+868]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1739
@1023:
	call      @@stk@cpu@cpu_has_avx$qv
	test      eax,eax
	je        short @1024
	lea       edx,dword ptr [ebx+893]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1025
@1024:
	lea       edx,dword ptr [ebx+893]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1740
@1025:
	call      @@stk@cpu@cpu_has_avx512f$qv
	and       eax,255
	test      eax,eax
	je        short @1026
	lea       edx,dword ptr [ebx+917]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1027
@1026:
	lea       edx,dword ptr [ebx+917]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1741
@1027:
	call      @@stk@cpu@cpu_has_avx512bw$qv
	and       eax,255
	test      eax,eax
	je        short @1028
	lea       edx,dword ptr [ebx+945]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1029
@1028:
	lea       edx,dword ptr [ebx+945]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1742
@1029:
	call      @@stk@cpu@cpu_has_avx512cd$qv
	and       eax,255
	test      eax,eax
	je        short @1030
	lea       edx,dword ptr [ebx+974]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1031
@1030:
	lea       edx,dword ptr [ebx+974]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1743
@1031:
	call      @@stk@cpu@cpu_has_avx512dq$qv
	and       eax,255
	test      eax,eax
	je        short @1032
	lea       edx,dword ptr [ebx+1003]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1033
@1032:
	lea       edx,dword ptr [ebx+1003]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1744
@1033:
	call      @@stk@cpu@cpu_has_avx512er$qv
	and       eax,255
	test      eax,eax
	je        short @1034
	lea       edx,dword ptr [ebx+1032]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1035
@1034:
	lea       edx,dword ptr [ebx+1032]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1745
@1035:
	call      @@stk@cpu@cpu_has_avx512pf$qv
	and       eax,255
	test      eax,eax
	je        short @1036
	lea       edx,dword ptr [ebx+1061]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1037
@1036:
	lea       edx,dword ptr [ebx+1061]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1746
@1037:
	call      @@stk@cpu@cpu_has_avx512vl$qv
	and       eax,255
	test      eax,eax
	je        short @1038
	lea       edx,dword ptr [ebx+1090]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1039
@1038:
	lea       edx,dword ptr [ebx+1090]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1747
@1039:
	call      @@stk@cpu@cpu_has_avx512ifma$qv
	and       eax,255
	test      eax,eax
	je        short @1040
	lea       edx,dword ptr [ebx+1119]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1041
@1040:
	lea       edx,dword ptr [ebx+1119]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1748
@1041:
	call      @@stk@cpu@cpu_has_bmi$qv
	test      eax,eax
	je        short @1042
	lea       edx,dword ptr [ebx+1150]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1043
@1042:
	lea       edx,dword ptr [ebx+1150]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1749
@1043:
	call      @@stk@cpu@cpu_has_avx512vbmi$qv
	and       eax,255
	test      eax,eax
	je        short @1044
	lea       edx,dword ptr [ebx+1174]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1045
@1044:
	lea       edx,dword ptr [ebx+1174]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1750
@1045:
	call      @@stk@cpu@cpu_has_cmov$qv
	and       eax,255
	test      eax,eax
	je        short @1046
	lea       edx,dword ptr [ebx+1205]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1047
@1046:
	lea       edx,dword ptr [ebx+1205]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1751
@1047:
	call      @@stk@cpu@cpu_has_cmpxchg$qv
	test      eax,eax
	je        short @1048
	lea       edx,dword ptr [ebx+1230]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1049
@1048:
	lea       edx,dword ptr [ebx+1230]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1752
@1049:
	call      @@stk@cpu@cpu_has_clmul$qv
	and       eax,255
	test      eax,eax
	je        short @1050
	lea       edx,dword ptr [ebx+1258]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1051
@1050:
	lea       edx,dword ptr [ebx+1258]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1753
@1051:
	call      @@stk@cpu@cpu_has_aes$qv
	and       eax,255
	test      eax,eax
	je        short @1052
	lea       edx,dword ptr [ebx+1284]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1053
@1052:
	lea       edx,dword ptr [ebx+1284]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1754
@1053:
	call      @@stk@cpu@cpu_has_sha$qv
	and       eax,255
	test      eax,eax
	je        short @1054
	lea       edx,dword ptr [ebx+1308]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1055
@1054:
	lea       edx,dword ptr [ebx+1308]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1755
@1055:
	call      @@stk@cpu@cpu_has_rdrand$qv
	and       eax,255
	test      eax,eax
	je        short @1056
	lea       edx,dword ptr [ebx+1332]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1057
@1056:
	lea       edx,dword ptr [ebx+1332]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1756
@1057:
	call      @@stk@cpu@cpu_has_rdseed$qv
	and       eax,255
	test      eax,eax
	je        short @1058
	lea       edx,dword ptr [ebx+1359]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1059
@1058:
	lea       edx,dword ptr [ebx+1359]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1757
@1059:
	call      @@stk@cpu@cpu_has_tsc$qv
	and       eax,255
	test      eax,eax
	je        short @1060
	lea       edx,dword ptr [ebx+1386]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1061
@1060:
	lea       edx,dword ptr [ebx+1386]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1758
@1061:
	call      @@stk@cpu@cpu_has_perftsc$qv
	and       eax,255
	test      eax,eax
	je        short @1062
	lea       edx,dword ptr [ebx+1410]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1063
@1062:
	lea       edx,dword ptr [ebx+1410]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1759
@1063:
	call      @@stk@cpu@cpu_has_erms$qv
	and       eax,255
	test      eax,eax
	je        short @1064
	lea       edx,dword ptr [ebx+1438]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1065
@1064:
	lea       edx,dword ptr [ebx+1438]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1760
@1065:
	call      @@stk@cpu@cpu_has_msr$qv
	and       eax,255
	test      eax,eax
	je        short @1066
	lea       edx,dword ptr [ebx+1463]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1067
@1066:
	lea       edx,dword ptr [ebx+1463]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1761
@1067:
	call      @@stk@cpu@cpu_has_mtrr$qv
	and       eax,255
	test      eax,eax
	je        short @1068
	lea       edx,dword ptr [ebx+1487]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp       short @1069
@1068:
	lea       edx,dword ptr [ebx+1487]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1762
@1069:
	call      @@stk@cpu@cpu_has_vmx$qv
	and       eax,255
	test      eax,eax
	je        short @1070
	lea       edx,dword ptr [ebx+1512]
	lea       ecx,dword ptr [ebx+123]
	push      edx
	push      ecx
	push      eax
	lea       eax,dword ptr [ebx+98]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
@1073:
	pop       ebx
	pop       ebp
	ret 
@1070:
	lea       edx,dword ptr [ebx+1512]
	push      edx
	lea       ecx,dword ptr [ebx+123]
	push      ecx
	lea       eax,dword ptr [ebx+153]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	?debug L 1764
?live16455@880: ; 
@1071:
@1072:
	pop       ebx
	pop       ebp
	ret 
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
	dw	116
	dw	0
	dw	17
	dw	605
	dw	0
	dw	0
	dw	0
	dw	8
	dw	530
	dd	@1073-@@stk@cpu@cpu_print_info$qv
	dw	3
?patch337	equ	@1072-@@stk@cpu@cpu_print_info$qv+3
?patch338	equ	0
?patch339	equ	@1072-@@stk@cpu@cpu_print_info$qv
	dw	2
	dw	6
	dw	8
	dw	531
	dw	1
	dw	65532
	dw	65535
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_test$qv	segment virtual
	align	2
@@stk@cpu@cpu_test$qv	proc	near
?live16456@0:
	?debug L 1765
@1074:
	push      ebp
	mov       ebp,esp
	?debug L 1767
	call      @@stk@cpu@cpu_print_info$qv
	?debug L 1768
@1075:
	pop       ebp
	ret 
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
	dw	606
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
?patch340	equ	@1075-@@stk@cpu@cpu_test$qv+2
?patch341	equ	0
?patch342	equ	@1075-@@stk@cpu@cpu_test$qv
	dw	2
	dw	6
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
@1076:
	push      ebp
	mov       ebp,esp
	call      @@stk@cpu@tsc_init$qv
	mov       dword ptr [_tsc_ADJ],eax
	mov       dword ptr [_tsc_ADJ+4],edx
	?debug L 0
@1077:
	pop       ebp
	ret 
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
	dw	607
	dw	0
	dw	0
	dw	0
?patch343	equ	@1077-@_STCON0_$qv+2
?patch344	equ	0
?patch345	equ	@1077-@_STCON0_$qv
	dw	2
	dw	6
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
	align	4
_DATA	ends
_TEXT	segment dword public use32 'CODE'
_TEXT	ends
@@stk@time@wait_us$qqsxuj equ @stk@time@wait_us$qqsxuj
 extrn   @stk@time@wait_us$qqsxuj:near
@@stk@cstr@trim$qqspc equ @stk@cstr@trim$qqspc
 extrn   @stk@cstr@trim$qqspc:near
@@stk@mem@mov$qqspvpxvxui equ @stk@mem@mov$qqspvpxvxui
 extrn   @stk@mem@mov$qqspvpxvxui:near
@@stk@mem@cmp$qqspxvt1xui equ @stk@mem@cmp$qqspxvt1xui
 extrn   @stk@mem@cmp$qqspxvt1xui:near
@@stk@time@time_ms$qqsv equ @stk@time@time_ms$qqsv
 extrn   @stk@time@time_ms$qqsv:near
 extrn   __llmul:near
 extrn   __lludiv:near
@@stk@con@prints$qpxce equ @stk@con@prints$qpxce
 extrn   @stk@con@prints$qpxce:near
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	?patch346
	dw	37
	dw	608
	dw	0
	dw	0
	dw	0
	dw	0
?patch346	equ	12
	dw	?patch347
	dw	37
	dw	609
	dw	0
	dw	0
	dw	0
	dw	0
?patch347	equ	12
	dw	?patch348
	dw	37
	dw	610
	dw	0
	dw	0
	dw	0
	dw	0
?patch348	equ	12
	dw	?patch349
	dw	37
	dw	611
	dw	0
	dw	0
	dw	0
	dw	0
?patch349	equ	12
	dw	?patch350
	dw	37
	dw	612
	dw	0
	dw	0
	dw	0
	dw	0
?patch350	equ	12
	dw	?patch351
	dw	37
	dw	613
	dw	0
	dw	0
	dw	0
	dw	0
?patch351	equ	12
	dw	?patch352
	dw	37
	dw	614
	dw	0
	dw	0
	dw	0
	dw	0
?patch352	equ	12
	dw	?patch353
	dw	37
	dw	615
	dw	0
	dw	0
	dw	0
	dw	0
?patch353	equ	12
	dw	?patch354
	dw	37
	dw	616
	dw	0
	dw	0
	dw	0
	dw	0
?patch354	equ	12
	dw	22
	dw	513
	df	_tsc_STARTED
	dw	0
	dw	119
	dw	0
	dw	617
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_PAUSED
	dw	0
	dw	119
	dw	0
	dw	618
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_LAST_MEASURED
	dw	0
	dw	119
	dw	0
	dw	619
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_ADJ
	dw	0
	dw	119
	dw	0
	dw	620
	dw	0
	dw	0
	dw	0
	dw	22
	dw	513
	df	_tsc_ELAPSED
	dw	0
	dw	119
	dw	0
	dw	621
	dw	0
	dw	0
	dw	0
	dw	?patch355
	dw	38
	dw	514
	dw	622
	dw	0
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
?patch355	equ	2060
	dw	?patch356
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
?patch356	equ	18
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
	db        0,0,0,0,0,0,150,16,0,0,4,0,1,2,0,0
	db        14,0,8,0,3,0,0,0,7,0,1,0,153,16,0,0
	db        8,0,1,0,1,0,119,0,0,0,8,0,1,2,1,0
	db        152,16,0,0,14,0,8,0,112,4,0,0,7,0,1,0
	db        155,16,0,0,8,0,1,2,1,0,112,4,0,0,14,0
	db        8,0,3,4,0,0,7,0,3,0,160,16,0,0,8,0
	db        2,0,10,0,158,16,0,0,8,0,1,0,1,0,3,0
	db        0,0,8,0,1,0,1,0,117,0,0,0,16,0,1,2
	db        3,0,3,4,0,0,157,16,0,0,159,16,0,0,14,0
	db        8,0,119,0,0,0,7,0,3,0,162,16,0,0,16,0
	db        1,2,3,0,157,16,0,0,157,16,0,0,159,16,0,0
	db        14,0,8,0,119,0,0,0,7,0,0,0,164,16,0,0
	db        4,0,1,2,0,0,14,0,8,0,116,0,0,0,2,0
	db        0,0,166,16,0,0,4,0,1,2,0,0,14,0,8,0
	db        3,0,0,0,64,0,2,0,170,16,0,0,8,0,2,0
	db        10,0,169,16,0,0,8,0,1,0,1,0,112,0,0,0
	db        12,0,1,2,2,0,168,16,0,0,0,0,0,0
$$BTYPES	ends
$$BNAMES	segment byte public use32 'DEBNAM'
	db	17,'@stk@cpu@rdtsc$qv'
	db	1,'r'
	db	2,'LO'
	db	2,'HI'
	db	19,'@stk@cpu@rdtscex$qv'
	db	1,'r'
	db	2,'HI'
	db	2,'LO'
	db	20,'@stk@cpu@tsc_init$qv'
	db	1,'r'
	db	2,'m1'
	db	2,'m0'
	db	9,'__shared1'
	db	9,'__unique1'
	db	21,'@stk@cpu@tsc_start$qv'
	db	1,'r'
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
	db	1,'r'
	db	31,'@stk@cpu@cpuidex$qpuit1t1t1uiui'
	db	5,'a_eax'
	db	5,'a_ebx'
	db	5,'a_ecx'
	db	5,'a_edx'
	db	9,'a_feature'
	db	13,'a_feature_ecx'
	db	1,'r'
	db	9,'__shared1'
	db	9,'__unique1'
	db	20,'previous_feature_ecx'
	db	16,'previous_feature'
	db	10,'cached_edx'
	db	10,'cached_ecx'
	db	10,'cached_ebx'
	db	10,'cached_eax'
	db	1,'r'
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
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_num_cores$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	27,'@stk@cpu@cpu_cache_size$quc'
	db	7,'a_level'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	32,'@stk@cpu@cpu_cache_line_size$quc'
	db	7,'a_level'
	db	1,'r'
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
	db	1,'r'
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
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	26,'@stk@cpu@cpu_has_mmxext$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_amd64$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	22,'@stk@cpu@cpu_has_ht$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_sse$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_sse4a$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_avx$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	26,'@stk@cpu@cpu_has_popcnt$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	24,'@stk@cpu@cpu_has_f16c$qv'
	db	1,'r'
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
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_smx$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	24,'@stk@cpu@cpu_has_cmov$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_movbe$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_bmi$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	24,'@stk@cpu@cpu_has_erms$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_3dnow$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	33,'@stk@cpu@cpu_has_3dnowprefetch$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	27,'@stk@cpu@cpu_has_perftsc$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_sha$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_xop$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	27,'@stk@cpu@cpu_has_avx512f$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	28,'@stk@cpu@cpu_has_avx512bw$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	28,'@stk@cpu@cpu_has_avx512er$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	28,'@stk@cpu@cpu_has_avx512cd$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	28,'@stk@cpu@cpu_has_avx512pf$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	28,'@stk@cpu@cpu_has_avx512dq$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	28,'@stk@cpu@cpu_has_avx512vl$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	30,'@stk@cpu@cpu_has_avx512ifma$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	30,'@stk@cpu@cpu_has_avx512vbmi$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_adx$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_lzcnt$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_tbm$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_clfsh$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	29,'@stk@cpu@cpu_has_pclmulqdq$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	24,'@stk@cpu@cpu_has_fxsr$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	22,'@stk@cpu@cpu_has_ss$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	24,'@stk@cpu@cpu_has_mtrr$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_msr$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_tsc$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_psn$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_xsave$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	25,'@stk@cpu@cpu_has_clmul$qv'
	db	1,'r'
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
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	23,'@stk@cpu@cpu_has_aes$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	26,'@stk@cpu@cpu_has_viaaes$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	26,'@stk@cpu@cpu_has_viarng$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	27,'@stk@cpu@cpu_has_viahash$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	26,'@stk@cpu@cpu_has_rdseed$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	26,'@stk@cpu@cpu_has_rdrand$qv'
	db	1,'r'
	db	5,'f_eax'
	db	5,'f_ebx'
	db	5,'f_ecx'
	db	5,'f_edx'
	db	9,'__shared1'
	db	9,'__unique1'
	db	8,'s_answer'
	db	26,'@stk@cpu@cpu_print_info$qv'
	db	1,'r'
	db	20,'@stk@cpu@cpu_test$qv'
	db	8,'_STCON0_'
	db	3,'std'
	db	3,'stk'
	db	9,'@stk@time'
	db	8,'@stk@mem'
	db	9,'@stk@cstr'
	db	8,'@stk@cpu'
	db	11,'@stk@thread'
	db	16,'@stk@this_thread'
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
	?debug	D "K:\prc++\x86_libraries\STK\cpu\STK_CPU.H" 19055 45362
	?debug	D "K:\prc++\x86_libraries\STK\cpu\.\..\IO\./../stk_main.h" 19501 42785
	?debug	D "K:\prc++\x86_libraries\STK\cpu\.\..\IO\STK_CONSOLE.H" 19055 45362
	?debug	D "K:\prc++\x86_libraries\STK\cpu\.\..\TIME\STK_TIME.H" 19500 48172
	?debug	D "K:\prc++\x86_libraries\STK\cpu\.\..\STASM\STK_STASM.H" 19501 44203
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\_lim.h" 10305 10240
	?debug	D "C:\PROGRAM FILES\BORLAND\CBUILDER5\INCLUDE\limits.h" 10305 10240
	?debug	D "K:\prc++\x86_libraries\STK\cpu\.\..\STHREADS\./../cpu/./../stk_main.h" 19501 42785
	?debug	D "K:\prc++\x86_libraries\STK\cpu\.\..\STHREADS\./../cpu/stk_cpu.h" 19055 45362
	?debug	D "K:\prc++\x86_libraries\STK\cpu\.\..\STHREADS\./../time/stk_time.h" 19500 48172
	?debug	D "K:\prc++\x86_libraries\STK\cpu\.\..\STHREADS\./../stk_main.h" 19501 42785
	?debug	D "K:\prc++\x86_libraries\STK\cpu\.\..\STHREADS\STK_THREADS.H" 19055 45362
	?debug	D "K:\prc++\x86_libraries\STK\cpu\.\..\TEXT\./../mem/stk_mem.h" 19494 44707
	?debug	D "K:\prc++\x86_libraries\STK\cpu\.\..\TEXT\./../stk_main.h" 19501 42785
	?debug	D "K:\prc++\x86_libraries\STK\cpu\.\..\TEXT\STK_CSTR_UTILS.H" 19054 45782
	?debug	D "K:\prc++\x86_libraries\STK\cpu\.\..\MEM\./.././stasm/../stk_MAIN.h" 19501 42785
	?debug	D "K:\prc++\x86_libraries\STK\cpu\.\..\MEM\./.././stasm/stk_stasm.h" 19501 44203
	?debug	D "K:\prc++\x86_libraries\STK\cpu\.\..\MEM\./.././time/stk_time.h" 19500 48172
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
	?debug	D "K:\prc++\x86_libraries\STK\cpu\.\..\MEM\./../stk_main.h" 19501 42785
	?debug	D "K:\prc++\x86_libraries\STK\cpu\.\..\MEM\STK_MEM.H" 19494 44707
	?debug	D "K:\prc++\x86_libraries\STK\cpu\stk_cpu.cpp" 19501 43804
	end
