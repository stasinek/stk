	.386p
	ifdef ??version
	if ??version GT 500H
	.mmx
	endif
	endif
	model flat
	ifndef	??version
	?debug	macro
	endm
	endif
	?debug	S "cpu\stk_cpu.cpp"
	?debug	T "cpu\stk_cpu.cpp"
_TEXT	segment dword public use32 'CODE'
_TEXT	ends
_DATA	segment dword public use32 'DATA'
_DATA	ends
_BSS	segment dword public use32 'BSS'
_BSS	ends
DGROUP	group	_BSS,_DATA
_DATA	segment dword public use32 'DATA'
	align	4
_tsc_STARTED	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
	align	4
_tsc_PAUSED	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
	align	4
_tsc_LAST_MEASURED	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
	align	4
_tsc_ADJ	label	qword
	db	8	dup(?)
	db	1	dup(?)
	align	4
_tsc_ELAPSED	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@rdtsc$qv	segment virtual
	align	2
@@stk@cpu@rdtsc$qv	proc	near
?live16385@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @1
@2:
	xor       eax,eax
	xor       edx,edx
@4:
@3:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@1:
	db	67,71,83,0
	dd @@stk@cpu@rdtsc$qv+0
	dd @1+0
	db	248,255,255,255,8,0,0,0,0,0,0,0
@@stk@cpu@rdtsc$qv	endp
@stk@cpu@rdtsc$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eebmgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTOC$@stk@cpu@rdtscex$qv	segment virtual
	align	2
@@_$ECTOC$@stk@cpu@rdtscex$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTOC$@stk@cpu@rdtscex$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@rdtscex$qv	segment virtual
	align	2
@@stk@cpu@rdtscex$qv	proc	near
?live16386@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-80
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @5
	mov       edi,offset $eebmgeia
@6:
	mov       eax,offset @@_$ECTOC$@stk@cpu@rdtscex$qv
	call      @__InitExceptBlockLDTC
	jmp short @8
?live16386@16: ; EDI = &$eebmgeia
@7:
@9:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@10:
@8:
	push      8
	push      edi
	call      _CG_D_EP
	cmp       dword ptr [edi+4],0
	jne       short @7
	cmp       dword ptr [edi],0
@11:
	jne       short @7
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      edi
	call      _CG_D_EP
	mov       edx,dword ptr [ebp-56]
	mov       dword ptr [edi],edx
	mov       edx,dword ptr [ebp-52]
	mov       dword ptr [edi+4],edx
	jmp short @13
@12:
@14:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@15:
@13:
	push      8
	push      edi
	call      _CG_D_EP
	cmp       dword ptr [edi+4],0
	jne       short @18
	cmp       dword ptr [edi],0
@18:
	je        short @16
	push      8
	push      edi
	call      _CG_D_EP
	mov       eax,dword ptr [edi]
	mov       edx,dword ptr [edi+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @19
	cmp       eax,dword ptr [ebp-56]
@19:
	setne     cl
	and       ecx,1
	jmp short @17
@16:
	xor       ecx,ecx
@17:
	test      cl,cl
	jne       short @12
?live16386@32: ; 
	pushfd	
	push	 eax
	push	 ebx
	push	 ecx
	push	 edx
	push	 esi
	mov	 eax,000000001H
	xor	 ecx,ecx
	cpuid	
	mov	 ecx,000000001H
	shl	 ecx,27
	and	 ecx,edx
	xor	 eax,eax
	xor	 edx,edx
	test	 ecx,ecx
?live16386@272: ; EDI = &$eebmgeia
	je        @20
?live16386@288: ; 
	mov	 eax,1
	cpuid	
?live16386@320: ; EDI = &$eebmgeia
	jmp short @21
?live16386@336: ; 
	sfence	
	rdtsc	
@21:
tsc_intel_measure:
	sfence	
	rdtsc	
@20:
tsc_exit:
	mov	 [dword ptr [ebp-64]],eax
	mov	 [dword ptr [ebp-72]],edx
	pop	 esi
	pop	 edx
	pop	 ecx
	pop	 ebx
	pop	 eax
	popfd	
?live16386@560: ; EDI = &$eebmgeia
	mov       eax,dword ptr [ebp-72]
	xor       edx,edx
	mov       dword ptr [ebp-84],eax
	mov       dword ptr [ebp-80],edx
	mov       edx,dword ptr [ebp-84]
	xor       eax,eax
	mov       dword ptr [ebp-84],eax
	mov       dword ptr [ebp-80],edx
	mov       eax,dword ptr [ebp-64]
	xor       edx,edx
	or        eax,dword ptr [ebp-84]
	or        edx,dword ptr [ebp-80]
	mov       dword ptr [ebp-84],eax
	mov       dword ptr [ebp-80],edx
	push      8
	push      edi
	call      _CG_D_EP
	mov       dword ptr [edi],0
	mov       dword ptr [edi+4],0
?live16386@624: ; 
	mov       eax,dword ptr [ebp-84]
	mov       edx,dword ptr [ebp-80]
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	jmp short @22
	xor       eax,eax
	xor       edx,edx
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
@23:
@22:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@5:
	db	67,71,83,0
	dd @@stk@cpu@rdtscex$qv+0
	dd @5+0
	db	172,255,255,255,8,0,0,0,5,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,172,255,255,255
	db	8,0,0,0
@@stk@cpu@rdtscex$qv	endp
@stk@cpu@rdtscex$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epbmgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTPC$@stk@cpu@tsc_init$qv	segment virtual
	align	2
@@_$ECTPC$@stk@cpu@tsc_init$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTPC$@stk@cpu@tsc_init$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_init$qv	segment virtual
	align	2
@@stk@cpu@tsc_init$qv	proc	near
?live16388@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-88
	push      ebx
	mov       dword ptr [ebp-8],offset @24
@25:
	mov       ebx,offset $epbmgeia
	mov       eax,offset @@_$ECTPC$@stk@cpu@tsc_init$qv
	call      @__InitExceptBlockLDTC
	jmp short @27
?live16388@16: ; EBX = &$epbmgeia
@26:
@28:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@29:
@27:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @26
	cmp       dword ptr [ebx],0
	jne       short @26
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       edx,dword ptr [ebp-56]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],edx
	jmp short @32
@31:
@33:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@34:
@32:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @37
	cmp       dword ptr [ebx],0
@37:
	je        short @35
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @38
	cmp       eax,dword ptr [ebp-56]
@38:
	setne     cl
	and       ecx,1
	jmp short @36
@35:
	xor       ecx,ecx
@36:
	test      cl,cl
	jne       short @31
	mov       dword ptr [_tsc_ADJ],0
	mov       dword ptr [_tsc_ADJ+4],0
	call      @@stk@cpu@tsc_start$qv
	mov       dword ptr [ebp-68],eax
	mov       dword ptr [ebp-64],edx
	call      @@stk@cpu@tsc_checkpoint$qv
	mov       dword ptr [ebp-80],eax
	mov       dword ptr [ebp-76],edx
	mov       eax,dword ptr [ebp-80]
	mov       edx,dword ptr [ebp-76]
	cmp       edx,dword ptr [ebp-64]
	jne       short @40
	cmp       eax,dword ptr [ebp-68]
@40:
	jbe       short @39
	mov       eax,dword ptr [ebp-80]
	mov       edx,dword ptr [ebp-76]
	sub       eax,dword ptr [ebp-68]
	sbb       edx,dword ptr [ebp-64]
	mov       dword ptr [_tsc_ADJ],eax
	mov       dword ptr [_tsc_ADJ+4],edx
@39:
	mov       ecx,dword ptr [_tsc_ADJ]
	mov       dword ptr [ebp-92],ecx
	mov       ecx,dword ptr [_tsc_ADJ+4]
	mov       dword ptr [ebp-88],ecx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16388@144: ; 
	mov       eax,dword ptr [ebp-92]
	mov       edx,dword ptr [ebp-88]
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
@42:
@41:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@24:
	db	67,71,83,0
	dd @@stk@cpu@tsc_init$qv+0
	dd @24+0
	db	164,255,255,255,8,0,0,0,5,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,188,255,255,255
	db	8,0,0,0,176,255,255,255,8,0,0,0,164,255,255,255
	db	8,0,0,0
@@stk@cpu@tsc_init$qv	endp
@stk@cpu@tsc_init$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$edcmgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTQC$@stk@cpu@tsc_start$qv	segment virtual
	align	2
@@_$ECTQC$@stk@cpu@tsc_start$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTQC$@stk@cpu@tsc_start$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_start$qv	segment virtual
	align	2
@@stk@cpu@tsc_start$qv	proc	near
?live16390@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-64
	push      ebx
	mov       dword ptr [ebp-8],offset @43
@44:
	mov       ebx,offset $edcmgeia
	mov       eax,offset @@_$ECTQC$@stk@cpu@tsc_start$qv
	call      @__InitExceptBlockLDTC
	jmp short @46
?live16390@16: ; EBX = &$edcmgeia
@45:
@47:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@48:
@46:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @45
	cmp       dword ptr [ebx],0
	jne       short @45
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       edx,dword ptr [ebp-56]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],edx
	jmp short @51
@50:
@52:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@53:
@51:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @56
	cmp       dword ptr [ebx],0
@56:
	je        short @54
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @57
	cmp       eax,dword ptr [ebp-56]
@57:
	setne     cl
	and       ecx,1
	jmp short @55
@54:
	xor       ecx,ecx
@55:
	test      cl,cl
	jne       short @50
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-68],eax
	mov       dword ptr [ebp-64],edx
	mov       eax,dword ptr [ebp-68]
	mov       dword ptr [_tsc_STARTED],eax
	mov       eax,dword ptr [ebp-64]
	mov       dword ptr [_tsc_STARTED+4],eax
	mov       edx,dword ptr [ebp-68]
	mov       dword ptr [_tsc_LAST_MEASURED],edx
	mov       edx,dword ptr [ebp-64]
	mov       dword ptr [_tsc_LAST_MEASURED+4],edx
	mov       dword ptr [_tsc_PAUSED],0
	mov       dword ptr [_tsc_PAUSED+4],0
	mov       dword ptr [_tsc_ELAPSED],0
	mov       dword ptr [_tsc_ELAPSED+4],0
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16390@112: ; 
	mov       eax,dword ptr [ebp-68]
	mov       edx,dword ptr [ebp-64]
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
@59:
@58:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@43:
	db	67,71,83,0
	dd @@stk@cpu@tsc_start$qv+0
	dd @43+0
	db	188,255,255,255,8,0,0,0,3,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,188,255,255,255
	db	8,0,0,0
@@stk@cpu@tsc_start$qv	endp
@stk@cpu@tsc_start$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehcmgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTRC$@stk@cpu@tsc_checkpoint$qv	segment virtual
	align	2
@@_$ECTRC$@stk@cpu@tsc_checkpoint$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTRC$@stk@cpu@tsc_checkpoint$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_checkpoint$qv	segment virtual
	align	2
@@stk@cpu@tsc_checkpoint$qv	proc	near
?live16392@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-88
	push      ebx
	mov       dword ptr [ebp-8],offset @60
@61:
	mov       ebx,offset $ehcmgeia
	mov       eax,offset @@_$ECTRC$@stk@cpu@tsc_checkpoint$qv
	call      @__InitExceptBlockLDTC
	jmp short @63
?live16392@16: ; EBX = &$ehcmgeia
@62:
@64:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@65:
@63:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @62
	cmp       dword ptr [ebx],0
	jne       short @62
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       edx,dword ptr [ebp-56]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],edx
	jmp short @68
@67:
@69:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@70:
@68:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @73
	cmp       dword ptr [ebx],0
@73:
	je        short @71
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @74
	cmp       eax,dword ptr [ebp-56]
@74:
	setne     cl
	and       ecx,1
	jmp short @72
@71:
	xor       ecx,ecx
@72:
	test      cl,cl
	jne       short @67
	mov       eax,dword ptr [_tsc_PAUSED]
	mov       dword ptr [ebp-68],eax
	mov       eax,dword ptr [_tsc_PAUSED+4]
	mov       dword ptr [ebp-64],eax
	cmp       dword ptr [ebp-64],0
	jne       short @75
	cmp       dword ptr [ebp-68],0
	jne       short @75
@77:
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-68],eax
	mov       dword ptr [ebp-64],edx
@78:
@75:
	mov       eax,dword ptr [_tsc_STARTED]
	mov       edx,dword ptr [_tsc_STARTED+4]
	sub       eax,dword ptr [_tsc_ADJ]
	sbb       edx,dword ptr [_tsc_ADJ+4]
	mov       dword ptr [ebp-80],eax
	mov       dword ptr [ebp-76],edx
	mov       eax,dword ptr [ebp-68]
	mov       edx,dword ptr [ebp-64]
	cmp       edx,dword ptr [ebp-76]
	jne       short @80
	cmp       eax,dword ptr [ebp-80]
@80:
	jbe       short @79
	mov       eax,dword ptr [ebp-68]
	mov       edx,dword ptr [ebp-64]
	sub       eax,dword ptr [ebp-80]
	sbb       edx,dword ptr [ebp-76]
	mov       dword ptr [ebp-92],eax
	mov       dword ptr [ebp-88],edx
	jmp short @81
@79:
@82:
	mov       dword ptr [ebp-92],0
	mov       dword ptr [ebp-88],0
@83:
@81:
	mov       ecx,dword ptr [ebp-68]
	mov       dword ptr [_tsc_LAST_MEASURED],ecx
	mov       ecx,dword ptr [ebp-64]
	mov       dword ptr [_tsc_LAST_MEASURED+4],ecx
	mov       eax,dword ptr [ebp-92]
	mov       dword ptr [_tsc_ELAPSED],eax
	mov       eax,dword ptr [ebp-88]
	mov       dword ptr [_tsc_ELAPSED+4],eax
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16392@176: ; 
	mov       eax,dword ptr [ebp-68]
	mov       edx,dword ptr [ebp-64]
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
@85:
@84:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@60:
	db	67,71,83,0
	dd @@stk@cpu@tsc_checkpoint$qv+0
	dd @60+0
	db	164,255,255,255,8,0,0,0,5,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,188,255,255,255
	db	8,0,0,0,176,255,255,255,8,0,0,0,164,255,255,255
	db	8,0,0,0
@@stk@cpu@tsc_checkpoint$qv	endp
@stk@cpu@tsc_checkpoint$qv	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_elapsed$qv	segment virtual
	align	2
@@stk@cpu@tsc_elapsed$qv	proc	near
?live16394@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @86
@87:
	mov       eax,dword ptr [_tsc_ELAPSED]
	mov       edx,dword ptr [_tsc_ELAPSED+4]
@89:
@88:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@86:
	db	67,71,83,0
	dd @@stk@cpu@tsc_elapsed$qv+0
	dd @86+0
	db	248,255,255,255,8,0,0,0,0,0,0,0
@@stk@cpu@tsc_elapsed$qv	endp
@stk@cpu@tsc_elapsed$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$elcmgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTSC$@stk@cpu@tsc_pause$qv	segment virtual
	align	2
@@_$ECTSC$@stk@cpu@tsc_pause$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTSC$@stk@cpu@tsc_pause$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_pause$qv	segment virtual
	align	2
@@stk@cpu@tsc_pause$qv	proc	near
?live16395@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-64
	push      ebx
	mov       dword ptr [ebp-8],offset @90
@91:
	mov       ebx,offset $elcmgeia
	mov       eax,offset @@_$ECTSC$@stk@cpu@tsc_pause$qv
	call      @__InitExceptBlockLDTC
	jmp short @93
?live16395@16: ; EBX = &$elcmgeia
@92:
@94:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@95:
@93:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @92
	cmp       dword ptr [ebx],0
	jne       short @92
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       edx,dword ptr [ebp-56]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],edx
	jmp short @98
@97:
@99:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@100:
@98:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @103
	cmp       dword ptr [ebx],0
@103:
	je        short @101
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @104
	cmp       eax,dword ptr [ebp-56]
@104:
	setne     cl
	and       ecx,1
	jmp short @102
@101:
	xor       ecx,ecx
@102:
	test      cl,cl
	jne       short @97
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-68],eax
	mov       dword ptr [ebp-64],edx
	mov       eax,dword ptr [ebp-68]
	mov       dword ptr [_tsc_PAUSED],eax
	mov       eax,dword ptr [ebp-64]
	mov       dword ptr [_tsc_PAUSED+4],eax
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16395@80: ; 
	mov       eax,dword ptr [ebp-68]
	mov       edx,dword ptr [ebp-64]
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
@106:
@105:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@90:
	db	67,71,83,0
	dd @@stk@cpu@tsc_pause$qv+0
	dd @90+0
	db	188,255,255,255,8,0,0,0,3,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,188,255,255,255
	db	8,0,0,0
@@stk@cpu@tsc_pause$qv	endp
@stk@cpu@tsc_pause$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epcmgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTTC$@stk@cpu@tsc_resume$qv	segment virtual
	align	2
@@_$ECTTC$@stk@cpu@tsc_resume$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTTC$@stk@cpu@tsc_resume$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_resume$qv	segment virtual
	align	2
@@stk@cpu@tsc_resume$qv	proc	near
?live16397@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-100
	push      ebx
	mov       dword ptr [ebp-8],offset @107
@108:
	mov       ebx,offset $epcmgeia
	mov       eax,offset @@_$ECTTC$@stk@cpu@tsc_resume$qv
	call      @__InitExceptBlockLDTC
	jmp short @110
?live16397@16: ; EBX = &$epcmgeia
@109:
@111:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@112:
@110:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @109
	cmp       dword ptr [ebx],0
	jne       short @109
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       edx,dword ptr [ebp-56]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],edx
	jmp short @115
@114:
@116:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@117:
@115:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @120
	cmp       dword ptr [ebx],0
@120:
	je        short @118
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @121
	cmp       eax,dword ptr [ebp-56]
@121:
	setne     cl
	and       ecx,1
	jmp short @119
@118:
	xor       ecx,ecx
@119:
	test      cl,cl
	jne       short @114
	mov       eax,dword ptr [_tsc_STARTED]
	mov       dword ptr [ebp-68],eax
	mov       eax,dword ptr [_tsc_STARTED+4]
	mov       dword ptr [ebp-64],eax
	mov       edx,dword ptr [_tsc_PAUSED]
	mov       dword ptr [ebp-80],edx
	mov       edx,dword ptr [_tsc_PAUSED+4]
	mov       dword ptr [ebp-76],edx
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-92],eax
	mov       dword ptr [ebp-88],edx
	mov       eax,dword ptr [ebp-92]
	mov       edx,dword ptr [ebp-88]
	sub       eax,dword ptr [ebp-80]
	sbb       edx,dword ptr [ebp-76]
	add       eax,dword ptr [ebp-68]
	adc       edx,dword ptr [ebp-64]
	mov       dword ptr [ebp-104],eax
	mov       dword ptr [ebp-100],edx
	mov       ecx,dword ptr [ebp-104]
	mov       dword ptr [_tsc_STARTED],ecx
	mov       ecx,dword ptr [ebp-100]
	mov       dword ptr [_tsc_STARTED+4],ecx
	mov       dword ptr [_tsc_PAUSED],0
	mov       dword ptr [_tsc_PAUSED+4],0
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16397@128: ; 
	mov       eax,dword ptr [ebp-92]
	mov       edx,dword ptr [ebp-88]
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
@123:
@122:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@107:
	db	67,71,83,0
	dd @@stk@cpu@tsc_resume$qv+0
	dd @107+0
	db	152,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,188,255,255,255
	db	8,0,0,0,176,255,255,255,8,0,0,0,164,255,255,255
	db	8,0,0,0,152,255,255,255,8,0,0,0
@@stk@cpu@tsc_resume$qv	endp
@stk@cpu@tsc_resume$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eddmgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTUC$@stk@cpu@tsc_start_paused$qv	segment virtual
	align	2
@@_$ECTUC$@stk@cpu@tsc_start_paused$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTUC$@stk@cpu@tsc_start_paused$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@tsc_start_paused$qv	segment virtual
	align	2
@@stk@cpu@tsc_start_paused$qv	proc	near
?live16399@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-64
	push      ebx
	mov       dword ptr [ebp-8],offset @124
@125:
	mov       ebx,offset $eddmgeia
	mov       eax,offset @@_$ECTUC$@stk@cpu@tsc_start_paused$qv
	call      @__InitExceptBlockLDTC
	jmp short @127
?live16399@16: ; EBX = &$eddmgeia
@126:
@128:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@129:
@127:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @126
	cmp       dword ptr [ebx],0
	jne       short @126
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       edx,dword ptr [ebp-56]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],edx
	jmp short @132
@131:
@133:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@134:
@132:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @137
	cmp       dword ptr [ebx],0
@137:
	je        short @135
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @138
	cmp       eax,dword ptr [ebp-56]
@138:
	setne     cl
	and       ecx,1
	jmp short @136
@135:
	xor       ecx,ecx
@136:
	test      cl,cl
	jne       short @131
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-68],eax
	mov       dword ptr [ebp-64],edx
	mov       eax,dword ptr [ebp-68]
	mov       dword ptr [_tsc_LAST_MEASURED],eax
	mov       eax,dword ptr [ebp-64]
	mov       dword ptr [_tsc_LAST_MEASURED+4],eax
	mov       edx,dword ptr [ebp-68]
	mov       dword ptr [_tsc_STARTED],edx
	mov       edx,dword ptr [ebp-64]
	mov       dword ptr [_tsc_STARTED+4],edx
	mov       dword ptr [_tsc_ELAPSED],0
	mov       dword ptr [_tsc_ELAPSED+4],0
	mov       ecx,dword ptr [ebp-68]
	mov       dword ptr [_tsc_PAUSED],ecx
	mov       ecx,dword ptr [ebp-64]
	mov       dword ptr [_tsc_PAUSED+4],ecx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16399@112: ; 
	mov       eax,dword ptr [ebp-68]
	mov       edx,dword ptr [ebp-64]
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
@140:
@139:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@124:
	db	67,71,83,0
	dd @@stk@cpu@tsc_start_paused$qv+0
	dd @124+0
	db	188,255,255,255,8,0,0,0,3,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,188,255,255,255
	db	8,0,0,0
@@stk@cpu@tsc_start_paused$qv	endp
@stk@cpu@tsc_start_paused$qv	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpuid$qpuit1t1t1uiui	segment virtual
	align	2
@@stk@cpu@cpuid$qpuit1t1t1uiui	proc	near
?live16401@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @141
@142:
	mov	 eax,dword ptr [ebp+24]
	mov	 ecx,dword ptr [ebp+28]
	and	 eax,080000000H
	cpuid	
	mov	 ESI,dword ptr [ebp+8]
	mov	 [ESI],eax
	mov	 ESI,dword ptr [ebp+12]
	mov	 [ESI],ebx
	mov	 ESI,dword ptr [ebp+16]
	mov	 [ESI],ecx
	mov	 ESI,dword ptr [ebp+20]
	mov	 [ESI],edx
	mov       eax,dword ptr [ebp+8]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       eax,dword ptr [eax]
@144:
@143:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@141:
	db	67,71,83,0
	dd @@stk@cpu@cpuid$qpuit1t1t1uiui+0
	dd @141+0
	db	248,255,255,255,32,0,0,0,6,0,0,0,28,0,0,0
	db	4,0,0,0,24,0,0,0,4,0,0,0,20,0,0,0
	db	4,0,0,0,16,0,0,0,4,0,0,0,12,0,0,0
	db	4,0,0,0,8,0,0,0,4,0,0,0
@@stk@cpu@cpuid$qpuit1t1t1uiui	endp
@stk@cpu@cpuid$qpuit1t1t1uiui	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eodmgeia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$ecemgeia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$egemgeia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$ekemgeia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$eoemgeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ecfmgeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$egfmgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTVC$@stk@cpu@cpuidex$qpuit1t1t1uiui	segment virtual
	align	2
@@_$ECTVC$@stk@cpu@cpuidex$qpuit1t1t1uiui	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTVC$@stk@cpu@cpuidex$qpuit1t1t1uiui	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpuidex$qpuit1t1t1uiui	segment virtual
	align	2
@@stk@cpu@cpuidex$qpuit1t1t1uiui	proc	near
?live16402@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-52
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @145
@146:
	mov       eax,offset @@_$ECTVC$@stk@cpu@cpuidex$qpuit1t1t1uiui
	call      @__InitExceptBlockLDTC
	jmp short @148
@147:
@149:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@150:
@148:
	cmp       dword ptr [$egfmgeia+4],0
	jne       short @147
	cmp       dword ptr [$egfmgeia],0
@151:
	jne       short @147
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	mov       edx,dword ptr [ebp-56]
	mov       dword ptr [$egfmgeia],edx
	mov       edx,dword ptr [ebp-52]
	mov       dword ptr [$egfmgeia+4],edx
	jmp short @153
@152:
@154:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@155:
@153:
	cmp       dword ptr [$egfmgeia+4],0
	jne       short @158
	cmp       dword ptr [$egfmgeia],0
@158:
	je        short @156
	mov       eax,dword ptr [$egfmgeia]
	mov       edx,dword ptr [$egfmgeia+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @159
	cmp       eax,dword ptr [ebp-56]
@159:
	setne     cl
	and       ecx,1
	jmp short @157
@156:
	xor       ecx,ecx
@157:
	test      cl,cl
	jne       short @152
	mov       eax,dword ptr [ebp+24]
	cmp       eax,dword ptr [$eoemgeia]
	jne       @160
	mov       edx,dword ptr [ebp+28]
	cmp       edx,dword ptr [$ecfmgeia]
	jne       @160
@161:
	mov       eax,dword ptr [ebp+8]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$eodmgeia]
	mov       dword ptr [eax],edx
	mov       ecx,dword ptr [ebp+12]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       ebx,dword ptr [$ecemgeia]
	mov       dword ptr [ecx],ebx
	mov       eax,dword ptr [ebp+16]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$egemgeia]
	mov       dword ptr [eax],edx
	mov       ecx,dword ptr [ebp+20]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       ebx,dword ptr [$ekemgeia]
	mov       dword ptr [ecx],ebx
	mov       ecx,dword ptr [$eodmgeia]
?live16402@128: ; ECX = ret
	mov       dword ptr [$egfmgeia],0
	mov       dword ptr [$egfmgeia+4],0
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp @162
?live16402@160: ; 
@163:
	jmp short @164
@160:
@165:
	mov       eax,dword ptr [ebp+24]
	mov       edx,dword ptr [ebp+28]
	mov       dword ptr [$eoemgeia],eax
	mov       dword ptr [$ecfmgeia],edx
@166:
@164:
	pushfd	
	push	 eax
	push	 ebx
	push	 ecx
	push	 edx
	push	 esi
	push	 edi
	mov	 edi,dword ptr [ebp+24]
	mov	 eax,edi
	and	 eax,080000000H
	cpuid	
	mov	        esi,eax
	xor	        eax,eax
	xor	        ebx,ebx
	xor	        ecx,ecx
	xor	        edx,edx
	cmp	        esi,edi
	jb        short @167
	mov	        eax,edi
	mov	        edi,dword ptr [ebp+28]
	mov	        ecx,edi
	cpuid	
@167:
cpuid_save_result:
	mov	 dword ptr $eodmgeia,eax
	mov	 dword ptr $ecemgeia,ebx
	mov	 dword ptr $egemgeia,ecx
	mov	 dword ptr $ekemgeia,edx
	pop	 edi
	pop	 esi
	pop	 edx
	pop	 ecx
	pop	 ebx
	pop	 eax
	popfd	
	mov       ecx,dword ptr [ebp+8]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       ebx,dword ptr [$eodmgeia]
	mov       dword ptr [ecx],ebx
	mov       eax,dword ptr [ebp+12]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$ecemgeia]
	mov       dword ptr [eax],edx
	mov       ecx,dword ptr [ebp+16]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       ebx,dword ptr [$egemgeia]
	mov       dword ptr [ecx],ebx
	mov       eax,dword ptr [ebp+20]
	push      4
	push      eax
	push      0
	call      _CG_DA_EPY
	mov       edx,dword ptr [$ekemgeia]
	mov       dword ptr [eax],edx
	mov       ecx,dword ptr [ebp+8]
	push      4
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       ecx,dword ptr [ecx]
?live16402@864: ; ECX = ret
	mov       dword ptr [$egfmgeia],0
	mov       dword ptr [$egfmgeia+4],0
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16402@896: ; 
@168:
@162:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@145:
	db	67,71,83,0
	dd @@stk@cpu@cpuidex$qpuit1t1t1uiui+0
	dd @145+0
	db	200,255,255,255,32,0,0,0,8,0,0,0,28,0,0,0
	db	4,0,0,0,24,0,0,0,4,0,0,0,20,0,0,0
	db	4,0,0,0,16,0,0,0,4,0,0,0,12,0,0,0
	db	4,0,0,0,8,0,0,0,4,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0
@@stk@cpu@cpuidex$qpuit1t1t1uiui	endp
@stk@cpu@cpuidex$qpuit1t1t1uiui	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ekfmgeia	label	dword
	dd	0
	dd	0
	dd	0
	dd	0
	db	1	dup(?)
	align	4
$eofmgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTWC$@stk@cpu@cpu_vendor$qv	segment virtual
	align	2
@@_$ECTWC$@stk@cpu@cpu_vendor$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTWC$@stk@cpu@cpu_vendor$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_vendor$qv	segment virtual
	align	2
@@stk@cpu@cpu_vendor$qv	proc	near
?live16404@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-52
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @169
@170:
	mov       ebx,offset $eofmgeia
	mov       esi,offset $ekfmgeia
	mov       eax,offset @@_$ECTWC$@stk@cpu@cpu_vendor$qv
	call      @__InitExceptBlockLDTC
	jmp short @172
?live16404@16: ; EBX = &$eofmgeia, ESI = &$ekfmgeia
@171:
@173:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@174:
@172:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @171
	cmp       dword ptr [ebx],0
	jne       short @171
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       edx,dword ptr [ebp-56]
	mov       dword ptr [ebx],edx
	mov       edx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],edx
	jmp short @177
@176:
@178:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@179:
@177:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @182
	cmp       dword ptr [ebx],0
@182:
	je        short @180
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @183
	cmp       eax,dword ptr [ebp-56]
@183:
	setne     cl
	and       ecx,1
	jmp short @181
@180:
	xor       ecx,ecx
@181:
	test      cl,cl
	jne       short @176
	push      0
	push      0
	mov       eax,esi
	add       eax,4
	push      offset $ekfmgeia
	push      eax
	call      _CG_A_BP
	push      eax
	mov       edx,esi
	add       edx,8
	push      offset $ekfmgeia
	push      edx
	call      _CG_A_BP
	push      edx
	push      esi
	mov       ecx,esi
	add       ecx,12
	push      offset $ekfmgeia
	push      ecx
	call      _CG_A_BP
	push      ecx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	push      4
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi],0
	je        short @184
	push      4
	push      esi
	push      12
	call      _CG_DA_EPY
	xor       eax,eax
	mov       dword ptr [esi+12],eax
@184:
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16404@96: ; ESI = &$ekfmgeia
	mov       eax,esi
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16404@112: ; 
@186:
@185:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@169:
	db	67,71,83,0
	dd @@stk@cpu@cpu_vendor$qv+0
	dd @169+0
	db	200,255,255,255,8,0,0,0,2,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0
@@stk@cpu@cpu_vendor$qv	endp
@stk@cpu@cpu_vendor$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ejgmgeia	label	dword
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
$engmgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTXC$@stk@cpu@cpu_name$qv	segment virtual
	align	2
@@_$ECTXC$@stk@cpu@cpu_name$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTXC$@stk@cpu@cpu_name$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_name$qv	segment virtual
	align	2
@@stk@cpu@cpu_name$qv	proc	near
?live16406@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @187
@188:
	mov       edi,offset $ejgmgeia
	mov       eax,offset @@_$ECTXC$@stk@cpu@cpu_name$qv
	call      @__InitExceptBlockLDTC
?live16406@16: ; EDI = &$ejgmgeia
	push      4
	push      edi
	call      _CG_D_EP
	cmp       dword ptr [edi],0
	je        short @192
	mov       eax,edi
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp @190
@191:
@193:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@194:
@192:
	cmp       dword ptr [$engmgeia+4],0
	jne       short @191
	cmp       dword ptr [$engmgeia],0
	jne       short @191
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [$engmgeia],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [$engmgeia+4],ecx
	jmp short @197
@196:
@198:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@199:
@197:
	cmp       dword ptr [$engmgeia+4],0
	jne       short @202
	cmp       dword ptr [$engmgeia],0
@202:
	je        short @200
	mov       eax,dword ptr [$engmgeia]
	mov       edx,dword ptr [$engmgeia+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @203
	cmp       eax,dword ptr [ebp-56]
@203:
	setne     al
	and       eax,1
	jmp short @201
@200:
	xor       eax,eax
@201:
	test      al,al
	jne       short @196
	push      0
	push      -2147483648
	lea       edx,dword ptr [ebp-64]
	push      edx
	lea       ecx,dword ptr [ebp-72]
	push      ecx
	lea       esi,dword ptr [ebp-80]
	push      esi
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	cmp       eax,-2147483644
	jae       short @204
@205:
	mov       dword ptr [$engmgeia],0
	mov       dword ptr [$engmgeia+4],0
	push      12
	push      1
	push      offset s@
	push      0
	call      _CG_GDA_EGY
	push      offset s@
	push      edi
	call      @@stk@mem@mov$qqspvpxvxui
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp @190
@206:
@204:
	mov       esi,-2147483646
	xor       ebx,ebx
?live16406@128: ; EBX = i, ESI = f, EDI = &$ejgmgeia
@207:
@209:
	lea       eax,dword ptr [ebx+3]
	push      0
	shl       eax,2
	push      esi
	add       eax,edi
	push      offset $ejgmgeia
	push      eax
	call      _CG_A_BP
	push      eax
	lea       edx,dword ptr [ebx+2]
	shl       edx,2
	add       edx,edi
	push      offset $ejgmgeia
	push      edx
	call      _CG_A_BP
	push      edx
	lea       ecx,dword ptr [ebx+1]
	shl       ecx,2
	add       ecx,edi
	push      offset $ejgmgeia
	push      ecx
	call      _CG_A_BP
	push      ecx
	mov       ecx,ebx
	shl       ecx,2
	add       ecx,edi
	push      offset $ejgmgeia
	push      ecx
	call      _CG_A_BP
	push      ecx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
@210:
	inc       esi
	add       ebx,4
	cmp       ebx,12
	jb        short @207
?live16406@160: ; EDI = &$ejgmgeia
	push      32
	push      edi
	call      @@stk@cstr@trim$qqspcc
	mov       dword ptr [$engmgeia],0
	mov       dword ptr [$engmgeia+4],0
	mov       eax,edi
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16406@208: ; 
@212:
@190:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@187:
	db	67,71,83,0
	dd @@stk@cpu@cpu_name$qv+0
	dd @187+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_name$qv	endp
@stk@cpu@cpu_name$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eihmgeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$emhmgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTYC$@stk@cpu@cpu_num_threads$qv	segment virtual
	align	2
@@_$ECTYC$@stk@cpu@cpu_num_threads$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTYC$@stk@cpu@cpu_num_threads$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_threads$qv	segment virtual
	align	2
@@stk@cpu@cpu_num_threads$qv	proc	near
?live16408@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @213
@214:
	mov       ebx,offset $emhmgeia
	mov       eax,offset @@_$ECTYC$@stk@cpu@cpu_num_threads$qv
	call      @__InitExceptBlockLDTC
?live16408@16: ; EBX = &$emhmgeia
	mov       eax,dword ptr [$eihmgeia]
	cmp       eax,-1
	je        short @218
?live16408@32: ; EAX = @temp4
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp @216
?live16408@48: ; EBX = &$emhmgeia
@217:
@219:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@220:
@218:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @217
	cmp       dword ptr [ebx],0
	jne       short @217
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @223
@222:
@224:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@225:
@223:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @228
	cmp       dword ptr [ebx],0
@228:
	je        short @226
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @229
	cmp       eax,dword ptr [ebp-56]
@229:
	setne     cl
	and       ecx,1
	jmp short @227
@226:
	xor       ecx,ecx
@227:
	test      cl,cl
	jne       short @222
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	mov       eax,dword ptr [ebp-80]
	add       esp,24
	shr       eax,16
	and       eax,255
?live16408@128: ; EBX = &$emhmgeia, ECX = ret
	push      8
?live16408@144: ; EBX = &$emhmgeia
	inc       eax
?live16408@160: ; EBX = &$emhmgeia, ECX = ret
	push      ebx
?live16408@176: ; EBX = &$emhmgeia
	mov       dword ptr [$eihmgeia],eax
?live16408@192: ; EBX = &$emhmgeia, EAX = @temp3
	mov       ecx,eax
?live16408@208: ; EBX = &$emhmgeia, ECX = ret
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16408@224: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16408@240: ; 
@230:
@216:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@213:
	db	67,71,83,0
	dd @@stk@cpu@cpu_num_threads$qv+0
	dd @213+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_num_threads$qv	endp
@stk@cpu@cpu_num_threads$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eaimgeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eeimgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTZC$@stk@cpu@cpu_num_cores$qv	segment virtual
	align	2
@@_$ECTZC$@stk@cpu@cpu_num_cores$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTZC$@stk@cpu@cpu_num_cores$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_cores$qv	segment virtual
	align	2
@@stk@cpu@cpu_num_cores$qv	proc	near
?live16410@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @231
@232:
	mov       ebx,offset $eeimgeia
	mov       eax,offset @@_$ECTZC$@stk@cpu@cpu_num_cores$qv
	call      @__InitExceptBlockLDTC
?live16410@16: ; EBX = &$eeimgeia
	mov       eax,dword ptr [$eaimgeia]
	cmp       eax,-1
	je        short @236
?live16410@32: ; EAX = @temp3
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp @234
?live16410@48: ; EBX = &$eeimgeia
@235:
@237:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@238:
@236:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @235
	cmp       dword ptr [ebx],0
	jne       short @235
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @241
@240:
@242:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@243:
@241:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @246
	cmp       dword ptr [ebx],0
@246:
	je        short @244
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @247
	cmp       eax,dword ptr [ebp-56]
@247:
	setne     cl
	and       ecx,1
	jmp short @245
@244:
	xor       ecx,ecx
@245:
	test      cl,cl
	jne       short @240
	push      12
	push      1
	push      offset s@
	push      13
	call      _CG_GDA_EGY
	push      offset s@+13
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qqspxvt1xui
	cmp       edx,0
	jne       short @248
	cmp       eax,0
	jne       short @248
@250:
	push      0
	push      4
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       edx,dword ptr [ebp-88]
	shr       edx,26
	and       edx,63
	inc       edx
	mov       dword ptr [$eaimgeia],edx
@251:
	jmp short @252
@248:
	push      12
	push      1
	push      offset s@
	push      26
	call      _CG_GDA_EGY
	push      offset s@+26
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qqspxvt1xui
	cmp       edx,0
	jne       short @253
	cmp       eax,0
	jne       short @253
@255:
	push      0
	push      -2147483647
	lea       ecx,dword ptr [ebp-64]
	push      ecx
	lea       eax,dword ptr [ebp-72]
	push      eax
	lea       edx,dword ptr [ebp-80]
	push      edx
	lea       ecx,dword ptr [ebp-88]
	push      ecx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-72]
	and       eax,255
	inc       eax
	mov       dword ptr [$eaimgeia],eax
@256:
	jmp short @252
@253:
	call      @@stk@cpu@cpu_num_threads$qv
	mov       dword ptr [$eaimgeia],eax
@252:
	mov       ecx,dword ptr [$eaimgeia]
?live16410@224: ; EBX = &$eeimgeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16410@240: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16410@256: ; 
@257:
@234:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@231:
	db	67,71,83,0
	dd @@stk@cpu@cpu_num_cores$qv+0
	dd @231+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_num_cores$qv	endp
@stk@cpu@cpu_num_cores$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eiimgeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$emimgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTAD$@stk@cpu@cpu_cache_size$quc	segment virtual
	align	2
@@_$ECTAD$@stk@cpu@cpu_cache_size$quc	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTAD$@stk@cpu@cpu_cache_size$quc	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_cache_size$quc	segment virtual
	align	2
@@stk@cpu@cpu_cache_size$quc	proc	near
?live16412@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @258
@259:
	mov       ebx,dword ptr [ebp+8]
	mov       esi,offset $emimgeia
	mov       eax,offset @@_$ECTAD$@stk@cpu@cpu_cache_size$quc
	call      @__InitExceptBlockLDTC
?live16412@16: ; EBX = a_level, ESI = &$emimgeia
	mov       eax,dword ptr [$eiimgeia]
	cmp       eax,-1
	je        short @263
?live16412@32: ; EAX = @temp7
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp @261
?live16412@48: ; EBX = a_level, ESI = &$emimgeia
@262:
@264:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@265:
@263:
	push      8
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi+4],0
	jne       short @262
	cmp       dword ptr [esi],0
	jne       short @262
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      esi
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [esi],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [esi+4],ecx
	jmp short @268
@267:
@269:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@270:
@268:
	push      8
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi+4],0
	jne       short @273
	cmp       dword ptr [esi],0
@273:
	je        short @271
	push      8
	push      esi
	call      _CG_D_EP
	mov       eax,dword ptr [esi]
	mov       edx,dword ptr [esi+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @274
	cmp       eax,dword ptr [ebp-56]
@274:
	setne     cl
	and       ecx,1
	jmp short @272
@271:
	xor       ecx,ecx
@272:
	test      cl,cl
	jne       short @267
	push      12
	push      1
	push      offset s@
	push      39
	call      _CG_GDA_EGY
	push      offset s@+39
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qqspxvt1xui
	cmp       edx,0
	jne       short @276
	cmp       eax,0
@276:
	jne       @277
@278:
	xor       eax,eax
	mov       al,bl
	cmp       eax,2
	jne       @280
?live16412@96: ; ESI = &$emimgeia
@281:
	push      0
	push      2
	lea       edx,dword ptr [ebp-64]
	push      edx
	lea       edi,dword ptr [ebp-72]
	push      edi
	lea       eax,dword ptr [ebp-80]
	push      eax
	lea       edx,dword ptr [ebp-88]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-64]
	and       eax,255
	cmp       eax,64
	jne       short @282
	xor       edx,edx
	mov       dword ptr [$eiimgeia],edx
	jmp @294
?live16412@144: ; EAX = @temp1, ESI = &$emimgeia
@282:
	cmp       eax,65
	jne       short @284
?live16412@160: ; ESI = &$emimgeia
	mov       dword ptr [$eiimgeia],128
	jmp @294
?live16412@176: ; EAX = @temp1, ESI = &$emimgeia
@284:
	cmp       eax,66
	jne       short @285
?live16412@192: ; ESI = &$emimgeia
	mov       dword ptr [$eiimgeia],256
	jmp @294
?live16412@208: ; EAX = @temp1, ESI = &$emimgeia
@285:
	cmp       eax,67
	jne       short @286
?live16412@224: ; ESI = &$emimgeia
	mov       dword ptr [$eiimgeia],512
	jmp @294
?live16412@240: ; EAX = @temp1, ESI = &$emimgeia
@286:
	cmp       eax,68
	jne       short @287
?live16412@256: ; ESI = &$emimgeia
	mov       dword ptr [$eiimgeia],1024
	jmp @294
?live16412@272: ; EAX = @temp1, ESI = &$emimgeia
@287:
	cmp       eax,69
	jne       short @288
?live16412@288: ; ESI = &$emimgeia
	mov       dword ptr [$eiimgeia],2048
	jmp @294
@288:
@289:
	xor       ecx,ecx
	mov       dword ptr [$eiimgeia],ecx
@290:
@291:
	jmp @294
@280:
	xor       edi,edi
	mov       dword ptr [$eiimgeia],edi
@293:
	jmp @294
?live16412@368: ; EBX = a_level, ESI = &$emimgeia
@277:
	push      12
	push      1
	push      offset s@
	push      52
	call      _CG_GDA_EGY
	push      offset s@+52
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qqspxvt1xui
	cmp       edx,0
	jne       short @296
	cmp       eax,0
@296:
	jne       @297
@298:
	test      bl,bl
	jne       short @299
?live16412@400: ; ESI = &$emimgeia
@300:
	push      0
	push      -2147483643
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       edi,dword ptr [ebp-88]
	push      edi
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-64]
	shr       eax,24
	and       eax,255
	mov       dword ptr [$eiimgeia],eax
@301:
	jmp @302
?live16412@448: ; EBX = a_level, ESI = &$emimgeia
@299:
	xor       eax,eax
	mov       al,bl
	cmp       eax,1
	jne       short @303
?live16412@464: ; ESI = &$emimgeia
@304:
	push      0
	push      -2147483643
	lea       edx,dword ptr [ebp-64]
	push      edx
	lea       ecx,dword ptr [ebp-72]
	push      ecx
	lea       edi,dword ptr [ebp-80]
	push      edi
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       edx,dword ptr [ebp-72]
	shr       edx,24
	and       edx,255
	mov       dword ptr [$eiimgeia],edx
@305:
	jmp short @302
?live16412@512: ; EBX = a_level, ESI = &$emimgeia, EAX = @temp4
@303:
	cmp       eax,2
	jne       short @306
?live16412@528: ; ESI = &$emimgeia
@307:
	push      0
	push      -2147483642
	lea       ecx,dword ptr [ebp-64]
	push      ecx
	lea       edi,dword ptr [ebp-72]
	push      edi
	lea       eax,dword ptr [ebp-80]
	push      eax
	lea       edx,dword ptr [ebp-88]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       ecx,dword ptr [ebp-72]
	shr       ecx,16
	and       ecx,65535
	mov       dword ptr [$eiimgeia],ecx
@308:
	jmp short @302
?live16412@576: ; EBX = a_level, ESI = &$emimgeia, EAX = @temp4
@306:
	cmp       eax,3
	jne       short @309
?live16412@592: ; ESI = &$emimgeia
@310:
	push      0
	push      -2147483642
	lea       edi,dword ptr [ebp-64]
	push      edi
	lea       eax,dword ptr [ebp-72]
	push      eax
	lea       edx,dword ptr [ebp-80]
	push      edx
	lea       ecx,dword ptr [ebp-88]
	push      ecx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       edi,dword ptr [ebp-64]
	shr       edi,18
	and       edi,16383
	shl       edi,9
	mov       dword ptr [$eiimgeia],edi
@311:
@309:
@302:
@312:
@297:
@294:
	mov       ecx,dword ptr [$eiimgeia]
?live16412@640: ; ESI = &$emimgeia, ECX = ret
	push      8
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],0
	mov       dword ptr [esi+4],0
?live16412@656: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16412@672: ; 
@313:
@261:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@258:
	db	67,71,83,0
	dd @@stk@cpu@cpu_cache_size$quc+0
	dd @258+0
	db	168,255,255,255,12,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_cache_size$quc	endp
@stk@cpu@cpu_cache_size$quc	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eajmgeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eejmgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTBD$@stk@cpu@cpu_cache_line_size$quc	segment virtual
	align	2
@@_$ECTBD$@stk@cpu@cpu_cache_line_size$quc	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTBD$@stk@cpu@cpu_cache_line_size$quc	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_cache_line_size$quc	segment virtual
	align	2
@@stk@cpu@cpu_cache_line_size$quc	proc	near
?live16414@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @314
@315:
	mov       ebx,dword ptr [ebp+8]
	mov       esi,offset $eejmgeia
	mov       eax,offset @@_$ECTBD$@stk@cpu@cpu_cache_line_size$quc
	call      @__InitExceptBlockLDTC
?live16414@16: ; ESI = &$eejmgeia, EBX = a_level
	mov       eax,dword ptr [$eajmgeia]
	cmp       eax,-1
	je        short @319
?live16414@32: ; EAX = @temp5
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp @317
?live16414@48: ; ESI = &$eejmgeia, EBX = a_level
@318:
@320:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@321:
@319:
	push      8
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi+4],0
	jne       short @318
	cmp       dword ptr [esi],0
	jne       short @318
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      esi
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [esi],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [esi+4],ecx
	jmp short @324
@323:
@325:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@326:
@324:
	push      8
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi+4],0
	jne       short @329
	cmp       dword ptr [esi],0
@329:
	je        short @327
	push      8
	push      esi
	call      _CG_D_EP
	mov       eax,dword ptr [esi]
	mov       edx,dword ptr [esi+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @330
	cmp       eax,dword ptr [ebp-56]
@330:
	setne     cl
	and       ecx,1
	jmp short @328
@327:
	xor       ecx,ecx
@328:
	test      cl,cl
	jne       short @323
	push      12
	push      1
	push      offset s@
	push      65
	call      _CG_GDA_EGY
	push      offset s@+65
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qqspxvt1xui
	cmp       edx,0
	jne       short @331
	cmp       eax,0
	jne       short @331
?live16414@80: ; ESI = &$eejmgeia
@333:
	push      0
	push      4
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       edi,dword ptr [ebp-80]
	push      edi
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       edx,dword ptr [ebp-80]
	and       edx,4095
	inc       edx
	mov       dword ptr [$eajmgeia],edx
@334:
	jmp @335
?live16414@128: ; ESI = &$eejmgeia, EBX = a_level
@331:
	push      12
	push      1
	push      offset s@
	push      78
	call      _CG_GDA_EGY
	push      offset s@+78
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	call      @@stk@mem@cmp$qqspxvt1xui
	cmp       edx,0
	jne       @336
	cmp       eax,0
	jne       @336
@338:
	test      bl,bl
	jne       short @339
@340:
	push      0
	push      -2147483643
	lea       ecx,dword ptr [ebp-64]
	push      ecx
	lea       ecx,dword ptr [ebp-72]
	push      ecx
	lea       eax,dword ptr [ebp-80]
	push      eax
	lea       edx,dword ptr [ebp-88]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       ecx,dword ptr [ebp-64]
	and       ecx,255
	mov       dword ptr [$eajmgeia],ecx
@341:
@339:
	mov       edi,ebx
	and       edi,255
	cmp       edi,1
	jne       short @342
?live16414@208: ; ESI = &$eejmgeia, EBX = a_level, EDI = @temp4
@343:
	push      0
	push      -2147483643
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       ecx,dword ptr [ebp-88]
	push      ecx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-72]
	and       eax,255
	mov       dword ptr [$eajmgeia],eax
@344:
@342:
	cmp       edi,2
	jne       short @345
@346:
	push      0
	push      -2147483642
	lea       edx,dword ptr [ebp-64]
	push      edx
	lea       ecx,dword ptr [ebp-72]
	push      ecx
	lea       eax,dword ptr [ebp-80]
	push      eax
	lea       edx,dword ptr [ebp-88]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       ecx,dword ptr [ebp-72]
	and       ecx,255
	mov       dword ptr [$eajmgeia],ecx
@347:
@345:
	cmp       edi,3
	jne       short @348
?live16414@304: ; ESI = &$eejmgeia
@349:
	push      0
	push      -2147483642
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       edi,dword ptr [ebp-80]
	push      edi
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       edx,dword ptr [ebp-64]
	and       edx,255
	mov       dword ptr [$eajmgeia],edx
@350:
@348:
@351:
@336:
@335:
	mov       ecx,dword ptr [$eajmgeia]
?live16414@352: ; ESI = &$eejmgeia, ECX = ret
	push      8
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],0
	mov       dword ptr [esi+4],0
?live16414@368: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16414@384: ; 
@352:
@317:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@314:
	db	67,71,83,0
	dd @@stk@cpu@cpu_cache_line_size$quc+0
	dd @314+0
	db	168,255,255,255,12,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_cache_line_size$quc	endp
@stk@cpu@cpu_cache_line_size$quc	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eijmgeia	label	dword
	dd	0
	db	1	dup(?)
	align	4
$emjmgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTCD$@stk@cpu@cpu_num_mhz$qo	segment virtual
	align	2
@@_$ECTCD$@stk@cpu@cpu_num_mhz$qo	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTCD$@stk@cpu@cpu_num_mhz$qo	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_num_mhz$qo	segment virtual
	align	2
@@stk@cpu@cpu_num_mhz$qo	proc	near
?live16416@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-204
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @353
@354:
	mov       esi,offset $emjmgeia
	mov       eax,offset @@_$ECTCD$@stk@cpu@cpu_num_mhz$qo
	call      @__InitExceptBlockLDTC
?live16416@16: ; ESI = &$emjmgeia
	mov       eax,dword ptr [$eijmgeia]
	test      eax,eax
	je        short @358
	cmp       byte ptr [ebp+8],0
	jne       short @358
?live16416@32: ; EAX = @temp18
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp @356
?live16416@48: ; ESI = &$emjmgeia
@357:
@359:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@360:
@358:
	push      8
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi+4],0
	jne       short @357
	cmp       dword ptr [esi],0
	jne       short @357
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      esi
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [esi],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [esi+4],ecx
	jmp short @363
@362:
@364:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@365:
@363:
	push      8
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi+4],0
	jne       short @368
	cmp       dword ptr [esi],0
@368:
	je        short @366
	push      8
	push      esi
	call      _CG_D_EP
	mov       eax,dword ptr [esi]
	mov       edx,dword ptr [esi+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @369
	cmp       eax,dword ptr [ebp-56]
@369:
	setne     al
	and       eax,1
	jmp short @367
@366:
	xor       eax,eax
@367:
	test      al,al
	jne       short @362
	xor       ebx,ebx
?live16416@80: ; EBX = i, ESI = &$emjmgeia
@370:
@372:
	call      @@stk@cpu@tsc_init$qv
	call      @@stk@cpu@tsc_start$qv
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-104],eax
	mov       dword ptr [ebp-100],edx
	call      @@stk@cpu@tsc_checkpoint$qv
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-164],eax
	mov       dword ptr [ebp-160],edx
@373:
@374:
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-116],eax
	mov       dword ptr [ebp-112],edx
@375:
	mov       eax,dword ptr [ebp-116]
	mov       edx,dword ptr [ebp-112]
	cmp       edx,dword ptr [ebp-100]
	jne       short @377
	cmp       eax,dword ptr [ebp-104]
@377:
	jbe       short @373
	call      @@stk@cpu@tsc_start$qv
	mov       edx,21
?live16416@192: ; EBX = i, EDX = trash1, ESI = &$emjmgeia
@378:
	xor       eax,eax
@380:
@382:
@383:
	inc       eax
	cmp       eax,1000000
	jb        short @380
	dec       edx
	test      edx,edx
	ja        short @378
?live16416@224: ; EBX = i, ESI = &$emjmgeia
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-128],eax
	mov       dword ptr [ebp-124],edx
@386:
@387:
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-140],eax
	mov       dword ptr [ebp-136],edx
@388:
	mov       eax,dword ptr [ebp-140]
	mov       edx,dword ptr [ebp-136]
	cmp       edx,dword ptr [ebp-124]
	jne       short @390
	cmp       eax,dword ptr [ebp-128]
@390:
	jbe       short @386
	call      @@stk@cpu@tsc_checkpoint$qv
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-152],eax
	mov       dword ptr [ebp-148],edx
	mov       eax,dword ptr [ebp-140]
	mov       edx,dword ptr [ebp-136]
	sub       eax,dword ptr [ebp-116]
	sbb       edx,dword ptr [ebp-112]
	mov       dword ptr [ebp-92],eax
	mov       dword ptr [ebp-88],edx
	mov       eax,dword ptr [ebp-152]
	mov       edx,dword ptr [ebp-148]
	sub       eax,dword ptr [ebp-164]
	sbb       edx,dword ptr [ebp-160]
	mov       dword ptr [ebp-152],eax
	mov       dword ptr [ebp-148],edx
	push      0
	push      1000
	mov       eax,dword ptr [ebp-152]
	mov       edx,dword ptr [ebp-148]
	call      __llmul
	mov       dword ptr [ebp-152],eax
	mov       dword ptr [ebp-148],edx
	cmp       dword ptr [ebp-88],0
	jne       short @392
	cmp       dword ptr [ebp-92],0
@392:
	je        short @391
	push      dword ptr [ebp-88]
	push      dword ptr [ebp-92]
	mov       eax,dword ptr [ebp-152]
	mov       edx,dword ptr [ebp-148]
	call      __lludiv
	mov       dword ptr [ebp-152],eax
	mov       dword ptr [ebp-148],edx
	jmp short @393
@391:
	mov       dword ptr [ebp-152],0
	mov       dword ptr [ebp-148],0
@393:
	push      8
	push      -208
	push      ebx
	push      3
	push      0
	call      _CG_LDA_EOXSY
	mov       ecx,dword ptr [ebp-152]
	mov       dword ptr [ebp+8*ebx-208],ecx
	mov       ecx,dword ptr [ebp-148]
	mov       dword ptr [ebp+8*ebx-204],ecx
@394:
	inc       ebx
	cmp       ebx,5
	jb        @370
?live16416@400: ; ESI = &$emjmgeia
	mov       eax,dword ptr [ebp-208]
	xor       edi,edi
	mov       dword ptr [ebp-68],eax
	xor       ecx,ecx
	mov       eax,dword ptr [ebp-204]
	xor       ebx,ebx
	mov       dword ptr [ebp-64],eax
	mov       edx,dword ptr [ebp-208]
	mov       dword ptr [ebp-80],edx
	mov       edx,dword ptr [ebp-204]
	mov       dword ptr [ebp-76],edx
?live16416@416: ; EBX = i, ECX = imax, EDI = imin, ESI = &$emjmgeia
@396:
@398:
	push      8
	push      -208
	push      ebx
	push      3
	push      0
	call      _CG_LDA_EOXSY
	mov       eax,dword ptr [ebp+8*ebx-208]
	mov       edx,dword ptr [ebp+8*ebx-204]
	cmp       edx,dword ptr [ebp-64]
	jne       short @400
	cmp       eax,dword ptr [ebp-68]
@400:
	jbe       short @399
@401:
	push      8
	push      -208
	push      ebx
	push      3
	push      0
	call      _CG_LDA_EOXSY
	mov       ecx,dword ptr [ebp+8*ebx-208]
	mov       dword ptr [ebp-68],ecx
	mov       ecx,dword ptr [ebp+8*ebx-204]
	mov       dword ptr [ebp-64],ecx
	mov       ecx,ebx
@402:
@399:
	push      8
	push      -208
	push      ebx
	push      3
	push      0
	call      _CG_LDA_EOXSY
	mov       eax,dword ptr [ebp+8*ebx-208]
	mov       edx,dword ptr [ebp+8*ebx-204]
	cmp       edx,dword ptr [ebp-76]
	jne       short @404
	cmp       eax,dword ptr [ebp-80]
@404:
	jae       short @403
@405:
	push      8
	push      -208
	push      ebx
	push      3
	push      0
	call      _CG_LDA_EOXSY
	mov       edi,dword ptr [ebp+8*ebx-208]
	mov       dword ptr [ebp-80],edi
	mov       edi,dword ptr [ebp+8*ebx-204]
	mov       dword ptr [ebp-76],edi
	mov       edi,ebx
@406:
@403:
@407:
	inc       ebx
	cmp       ebx,5
	jb        @396
?live16416@448: ; ECX = imax, EDI = imin, ESI = &$emjmgeia
	mov       dword ptr [ebp-152],0
	mov       dword ptr [ebp-148],0
	xor       ebx,ebx
@409:
@411:
	cmp       edi,ebx
	je        short @412
	cmp       ecx,ebx
	je        short @412
	push      8
	push      -208
	push      ebx
	push      3
	push      0
	call      _CG_LDA_EOXSY
	mov       eax,dword ptr [ebp+8*ebx-208]
	mov       edx,dword ptr [ebp+8*ebx-204]
	add       eax,dword ptr [ebp-152]
	adc       edx,dword ptr [ebp-148]
	mov       dword ptr [ebp-152],eax
	mov       dword ptr [ebp-148],edx
@412:
@413:
	inc       ebx
	cmp       ebx,5
	jb        short @409
?live16416@464: ; ESI = &$emjmgeia
	push      0
	push      1000000
	push      0
	push      3
	mov       eax,dword ptr [ebp-152]
	mov       edx,dword ptr [ebp-148]
	call      __lludiv
	call      __lludiv
	mov       dword ptr [ebp-152],eax
	mov       dword ptr [ebp-148],edx
	mov       eax,dword ptr [ebp-152]
?live16416@496: ; ESI = &$emjmgeia, ECX = @temp17
	push      8
?live16416@512: ; ESI = &$emjmgeia
	mov       ecx,eax
?live16416@528: ; ESI = &$emjmgeia, ECX = @temp17
	push      esi
?live16416@544: ; ESI = &$emjmgeia
	mov       dword ptr [$eijmgeia],ecx
?live16416@560: ; ESI = &$emjmgeia, ECX = @temp17
	call      _CG_D_EP
	mov       dword ptr [esi],0
	mov       dword ptr [esi+4],0
?live16416@576: ; ECX = @temp17
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16416@592: ; 
@415:
@356:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@353:
	db	67,71,83,0
	dd @@stk@cpu@cpu_num_mhz$qo+0
	dd @353+0
	db	48,255,255,255,12,0,0,0,13,0,0,0,8,0,0,0
	db	1,0,0,0,212,255,255,255,33,0,0,0,200,255,255,255
	db	8,0,0,0,188,255,255,255,8,0,0,0,176,255,255,255
	db	8,0,0,0,164,255,255,255,8,0,0,0,152,255,255,255
	db	8,0,0,0,140,255,255,255,8,0,0,0,128,255,255,255
	db	8,0,0,0,116,255,255,255,8,0,0,0,104,255,255,255
	db	8,0,0,0,92,255,255,255,8,0,0,0,48,255,255,255
	db	40,0,0,0
@@stk@cpu@cpu_num_mhz$qo	endp
@stk@cpu@cpu_num_mhz$qo	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehkmgeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elkmgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTDD$@stk@cpu@cpu_has_x87$qv	segment virtual
	align	2
@@_$ECTDD$@stk@cpu@cpu_has_x87$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTDD$@stk@cpu@cpu_has_x87$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_x87$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_x87$qv	proc	near
?live16418@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @416
@417:
	mov       ebx,offset $elkmgeia
	mov       eax,offset @@_$ECTDD$@stk@cpu@cpu_has_x87$qv
	call      @__InitExceptBlockLDTC
?live16418@16: ; EBX = &$elkmgeia
	mov       eax,dword ptr [$ehkmgeia]
	cmp       eax,-1
	je        short @421
?live16418@32: ; EAX = @temp2
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @419
?live16418@48: ; EBX = &$elkmgeia
@420:
@422:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@423:
@421:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @420
	cmp       dword ptr [ebx],0
	jne       short @420
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @426
@425:
@427:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@428:
@426:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @431
	cmp       dword ptr [ebx],0
@431:
	je        short @429
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @432
	cmp       eax,dword ptr [ebp-56]
@432:
	setne     cl
	and       ecx,1
	jmp short @430
@429:
	xor       ecx,ecx
@430:
	test      cl,cl
	jne       short @425
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	test      byte ptr [ebp-64],1
	je        short @433
@434:
	mov       dword ptr [$ehkmgeia],1
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16418@128: ; 
	mov       al,1
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp short @419
?live16418@144: ; EBX = &$elkmgeia
@435:
@433:
	push      0
	push      -2147483647
	lea       ecx,dword ptr [ebp-64]
	push      ecx
	lea       ecx,dword ptr [ebp-72]
	push      ecx
	lea       eax,dword ptr [ebp-80]
	push      eax
	lea       edx,dword ptr [ebp-88]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	test      byte ptr [ebp-64],1
	je        short @436
@437:
	mov       dword ptr [$ehkmgeia],1
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16418@208: ; 
	mov       al,1
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp short @419
?live16418@224: ; EBX = &$elkmgeia
@438:
@436:
	xor       ecx,ecx
	mov       dword ptr [$ehkmgeia],ecx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16418@256: ; 
	xor       eax,eax
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
@439:
@419:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@416:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_x87$qv+0
	dd @416+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_x87$qv	endp
@stk@cpu@cpu_has_x87$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epkmgeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$edlmgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTED$@stk@cpu@cpu_has_mmx$qv	segment virtual
	align	2
@@_$ECTED$@stk@cpu@cpu_has_mmx$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTED$@stk@cpu@cpu_has_mmx$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_mmx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mmx$qv	proc	near
?live16420@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @440
@441:
	mov       ebx,offset $edlmgeia
	mov       eax,offset @@_$ECTED$@stk@cpu@cpu_has_mmx$qv
	call      @__InitExceptBlockLDTC
?live16420@16: ; EBX = &$edlmgeia
	mov       eax,dword ptr [$epkmgeia]
	cmp       eax,-1
	je        short @445
?live16420@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @443
?live16420@48: ; EBX = &$edlmgeia
@444:
@446:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@447:
@445:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @444
	cmp       dword ptr [ebx],0
	jne       short @444
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @450
@449:
@451:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@452:
@450:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @455
	cmp       dword ptr [ebx],0
@455:
	je        short @453
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @456
	cmp       eax,dword ptr [ebp-56]
@456:
	setne     cl
	and       ecx,1
	jmp short @454
@453:
	xor       ecx,ecx
@454:
	test      cl,cl
	jne       short @449
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-64]
	and       eax,8388608
	mov       dword ptr [$epkmgeia],eax
?live16420@96: ; EBX = &$edlmgeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16420@112: ; EBX = &$edlmgeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16420@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16420@144: ; 
@457:
@443:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@440:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_mmx$qv+0
	dd @440+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_mmx$qv	endp
@stk@cpu@cpu_has_mmx$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehlmgeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ellmgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTFD$@stk@cpu@cpu_has_mmxext$qv	segment virtual
	align	2
@@_$ECTFD$@stk@cpu@cpu_has_mmxext$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTFD$@stk@cpu@cpu_has_mmxext$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_mmxext$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mmxext$qv	proc	near
?live16422@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @458
@459:
	mov       ebx,offset $ellmgeia
	mov       eax,offset @@_$ECTFD$@stk@cpu@cpu_has_mmxext$qv
	call      @__InitExceptBlockLDTC
?live16422@16: ; EBX = &$ellmgeia
	mov       eax,dword ptr [$ehlmgeia]
	cmp       eax,-1
	je        short @463
?live16422@32: ; EAX = @temp5
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @461
?live16422@48: ; EBX = &$ellmgeia
@462:
@464:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@465:
@463:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @462
	cmp       dword ptr [ebx],0
	jne       short @462
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @468
@467:
@469:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@470:
@468:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @473
	cmp       dword ptr [ebx],0
@473:
	je        short @471
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @474
	cmp       eax,dword ptr [ebp-56]
@474:
	setne     cl
	and       ecx,1
	jmp short @472
@471:
	xor       ecx,ecx
@472:
	test      cl,cl
	jne       short @467
	push      0
	push      -2147483647
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-64]
	and       eax,4194304
	mov       dword ptr [$ehlmgeia],eax
?live16422@96: ; EBX = &$ellmgeia, EAX = @temp3
	test      eax,eax
	je        short @475
?live16422@112: ; 
	mov       al,1
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp short @461
?live16422@128: ; EBX = &$ellmgeia
@475:
	push      0
	push      1
	lea       ecx,dword ptr [ebp-64]
	push      ecx
	lea       ecx,dword ptr [ebp-72]
	push      ecx
	lea       eax,dword ptr [ebp-80]
	push      eax
	lea       edx,dword ptr [ebp-88]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-64]
	and       eax,33554432
	mov       dword ptr [$ehlmgeia],eax
?live16422@160: ; EBX = &$ellmgeia, EAX = @temp4
	test      eax,eax
	setne     cl
	and       ecx,1
?live16422@176: ; EBX = &$ellmgeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16422@192: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16422@208: ; 
@476:
@461:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@458:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_mmxext$qv+0
	dd @458+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_mmxext$qv	endp
@stk@cpu@cpu_has_mmxext$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eplmgeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$edmmgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTGD$@stk@cpu@cpu_has_amd64$qv	segment virtual
	align	2
@@_$ECTGD$@stk@cpu@cpu_has_amd64$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTGD$@stk@cpu@cpu_has_amd64$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_amd64$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_amd64$qv	proc	near
?live16424@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @477
@478:
	mov       ebx,offset $edmmgeia
	mov       eax,offset @@_$ECTGD$@stk@cpu@cpu_has_amd64$qv
	call      @__InitExceptBlockLDTC
?live16424@16: ; EBX = &$edmmgeia
	mov       eax,dword ptr [$eplmgeia]
	cmp       eax,-1
	je        short @482
?live16424@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @480
?live16424@48: ; EBX = &$edmmgeia
@481:
@483:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@484:
@482:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @481
	cmp       dword ptr [ebx],0
	jne       short @481
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @487
@486:
@488:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@489:
@487:
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
	cmp       edx,dword ptr [ebp-52]
	jne       short @493
	cmp       eax,dword ptr [ebp-56]
@493:
	setne     cl
	and       ecx,1
	jmp short @491
@490:
	xor       ecx,ecx
@491:
	test      cl,cl
	jne       short @486
	push      0
	push      -2147483647
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-64]
	and       eax,536870912
	mov       dword ptr [$eplmgeia],eax
?live16424@96: ; EBX = &$edmmgeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16424@112: ; EBX = &$edmmgeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16424@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16424@144: ; 
@494:
@480:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@477:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_amd64$qv+0
	dd @477+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_amd64$qv	endp
@stk@cpu@cpu_has_amd64$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehmmgeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elmmgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTHD$@stk@cpu@cpu_has_ht$qv	segment virtual
	align	2
@@_$ECTHD$@stk@cpu@cpu_has_ht$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTHD$@stk@cpu@cpu_has_ht$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_ht$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_ht$qv	proc	near
?live16426@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @495
@496:
	mov       ebx,offset $elmmgeia
	mov       eax,offset @@_$ECTHD$@stk@cpu@cpu_has_ht$qv
	call      @__InitExceptBlockLDTC
?live16426@16: ; EBX = &$elmmgeia
	mov       eax,dword ptr [$ehmmgeia]
	cmp       eax,-1
	je        short @500
?live16426@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @498
?live16426@48: ; EBX = &$elmmgeia
@499:
@501:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@502:
@500:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @499
	cmp       dword ptr [ebx],0
	jne       short @499
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @505
@504:
@506:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@507:
@505:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @510
	cmp       dword ptr [ebx],0
@510:
	je        short @508
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @511
	cmp       eax,dword ptr [ebp-56]
@511:
	setne     cl
	and       ecx,1
	jmp short @509
@508:
	xor       ecx,ecx
@509:
	test      cl,cl
	jne       short @504
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-64]
	and       eax,268435456
	mov       dword ptr [$ehmmgeia],eax
?live16426@96: ; EBX = &$elmmgeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16426@112: ; EBX = &$elmmgeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16426@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16426@144: ; 
@512:
@498:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@495:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_ht$qv+0
	dd @495+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_ht$qv	endp
@stk@cpu@cpu_has_ht$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epmmgeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ednmgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTID$@stk@cpu@cpu_has_sse$qv	segment virtual
	align	2
@@_$ECTID$@stk@cpu@cpu_has_sse$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTID$@stk@cpu@cpu_has_sse$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sse$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sse$qv	proc	near
?live16428@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @513
@514:
	mov       ebx,offset $ednmgeia
	mov       esi,offset $epmmgeia
	mov       eax,offset @@_$ECTID$@stk@cpu@cpu_has_sse$qv
	call      @__InitExceptBlockLDTC
?live16428@16: ; EBX = &$ednmgeia, ESI = &$epmmgeia
	push      4
	push      esi
	call      _CG_D_EP
	mov       eax,dword ptr [esi]
	cmp       eax,-1
	je        short @518
?live16428@32: ; EAX = @temp3, ESI = &$epmmgeia
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp @516
?live16428@48: ; EBX = &$ednmgeia, ESI = &$epmmgeia
@517:
@519:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@520:
@518:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @517
	cmp       dword ptr [ebx],0
	jne       short @517
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @523
@522:
@524:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@525:
@523:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @528
	cmp       dword ptr [ebx],0
@528:
	je        short @526
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @529
	cmp       eax,dword ptr [ebp-56]
@529:
	setne     cl
	and       ecx,1
	jmp short @527
@526:
	xor       ecx,ecx
@527:
	test      cl,cl
	jne       short @522
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	test      byte ptr [ebp-70],16
	je        short @530
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],42
	jmp short @531
@530:
	test      byte ptr [ebp-70],8
	je        short @532
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],41
	jmp short @531
@532:
	test      byte ptr [ebp-71],2
	je        short @533
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],31
	jmp short @531
@533:
	test      byte ptr [ebp-72],1
	je        short @534
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],30
	jmp short @531
@534:
	test      byte ptr [ebp-61],4
	je        short @535
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],20
	jmp short @531
@535:
	test      byte ptr [ebp-61],2
	je        short @536
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],10
	jmp short @531
@536:
	push      4
	push      esi
	call      _CG_D_EP
	xor       edx,edx
	mov       dword ptr [esi],edx
@531:
	push      4
	push      esi
	call      _CG_D_EP
	cmp       dword ptr [esi],0
	setne     cl
	and       ecx,1
?live16428@304: ; EBX = &$ednmgeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
?live16428@320: ; ECX = ret
	xor       eax,eax
?live16428@336: ; EBX = &$ednmgeia, ECX = ret
	mov       dword ptr [ebx+4],0
?live16428@352: ; ECX = ret
	mov       edx,dword ptr [ebp-44]
	mov       al,cl
	mov       dword ptr fs:[0],edx
?live16428@368: ; 
@537:
@516:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@513:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_sse$qv+0
	dd @513+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_sse$qv	endp
@stk@cpu@cpu_has_sse$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehnmgeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elnmgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTJD$@stk@cpu@cpu_has_sse4a$qv	segment virtual
	align	2
@@_$ECTJD$@stk@cpu@cpu_has_sse4a$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTJD$@stk@cpu@cpu_has_sse4a$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sse4a$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sse4a$qv	proc	near
?live16430@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @538
@539:
	mov       ebx,offset $elnmgeia
	mov       eax,offset @@_$ECTJD$@stk@cpu@cpu_has_sse4a$qv
	call      @__InitExceptBlockLDTC
?live16430@16: ; EBX = &$elnmgeia
	mov       eax,dword ptr [$ehnmgeia]
	cmp       eax,-1
	je        short @543
?live16430@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @541
?live16430@48: ; EBX = &$elnmgeia
@542:
@544:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@545:
@543:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @542
	cmp       dword ptr [ebx],0
	jne       short @542
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @548
@547:
@549:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@550:
@548:
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
	cmp       edx,dword ptr [ebp-52]
	jne       short @554
	cmp       eax,dword ptr [ebp-56]
@554:
	setne     cl
	and       ecx,1
	jmp short @552
@551:
	xor       ecx,ecx
@552:
	test      cl,cl
	jne       short @547
	push      0
	push      -2147483647
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-72]
	and       eax,64
	mov       dword ptr [$ehnmgeia],eax
?live16430@96: ; EBX = &$elnmgeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16430@112: ; EBX = &$elnmgeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16430@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16430@144: ; 
@555:
@541:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@538:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_sse4a$qv+0
	dd @538+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_sse4a$qv	endp
@stk@cpu@cpu_has_sse4a$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epnmgeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$edomgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTKD$@stk@cpu@cpu_has_avx$qv	segment virtual
	align	2
@@_$ECTKD$@stk@cpu@cpu_has_avx$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTKD$@stk@cpu@cpu_has_avx$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx$qv	proc	near
?live16432@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @556
@557:
	mov       ebx,offset $edomgeia
	mov       eax,offset @@_$ECTKD$@stk@cpu@cpu_has_avx$qv
	call      @__InitExceptBlockLDTC
?live16432@16: ; EBX = &$edomgeia
	mov       eax,dword ptr [$epnmgeia]
	cmp       eax,-1
	je        short @561
?live16432@32: ; EAX = @temp3
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp @559
?live16432@48: ; EBX = &$edomgeia
@560:
@562:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@563:
@561:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @560
	cmp       dword ptr [ebx],0
	jne       short @560
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @566
@565:
@567:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@568:
@566:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @571
	cmp       dword ptr [ebx],0
@571:
	je        short @569
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @572
	cmp       eax,dword ptr [ebp-56]
@572:
	setne     cl
	and       ecx,1
	jmp short @570
@569:
	xor       ecx,ecx
@570:
	test      cl,cl
	jne       short @565
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	test      byte ptr [ebp-69],16
	je        short @574
@575:
	push      0
	push      7
	lea       edx,dword ptr [ebp-64]
	push      edx
	lea       ecx,dword ptr [ebp-72]
	push      ecx
	lea       eax,dword ptr [ebp-80]
	push      eax
	lea       edx,dword ptr [ebp-88]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	test      byte ptr [ebp-80],32
	je        short @576
	mov       dword ptr [$epnmgeia],2
	jmp short @579
@576:
	mov       dword ptr [$epnmgeia],1
@578:
	jmp short @579
@574:
@580:
	xor       ecx,ecx
	mov       dword ptr [$epnmgeia],ecx
@581:
@579:
	cmp       dword ptr [$epnmgeia],0
	setne     cl
	and       ecx,1
?live16432@208: ; EBX = &$edomgeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
?live16432@224: ; ECX = ret
	xor       eax,eax
?live16432@240: ; EBX = &$edomgeia, ECX = ret
	mov       dword ptr [ebx+4],0
?live16432@256: ; ECX = ret
	mov       edx,dword ptr [ebp-44]
	mov       al,cl
	mov       dword ptr fs:[0],edx
?live16432@272: ; 
@582:
@559:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@556:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_avx$qv+0
	dd @556+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_avx$qv	endp
@stk@cpu@cpu_has_avx$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehomgeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elomgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTLD$@stk@cpu@cpu_has_popcnt$qv	segment virtual
	align	2
@@_$ECTLD$@stk@cpu@cpu_has_popcnt$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTLD$@stk@cpu@cpu_has_popcnt$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_popcnt$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_popcnt$qv	proc	near
?live16434@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @583
@584:
	mov       ebx,offset $elomgeia
	mov       eax,offset @@_$ECTLD$@stk@cpu@cpu_has_popcnt$qv
	call      @__InitExceptBlockLDTC
?live16434@16: ; EBX = &$elomgeia
	mov       eax,dword ptr [$ehomgeia]
	cmp       eax,-1
	je        short @588
?live16434@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @586
?live16434@48: ; EBX = &$elomgeia
@587:
@589:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@590:
@588:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @587
	cmp       dword ptr [ebx],0
	jne       short @587
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @593
@592:
@594:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@595:
@593:
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
	cmp       edx,dword ptr [ebp-52]
	jne       short @599
	cmp       eax,dword ptr [ebp-56]
@599:
	setne     cl
	and       ecx,1
	jmp short @597
@596:
	xor       ecx,ecx
@597:
	test      cl,cl
	jne       short @592
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-72]
	and       eax,8388608
	mov       dword ptr [$ehomgeia],eax
?live16434@96: ; EBX = &$elomgeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16434@112: ; EBX = &$elomgeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16434@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16434@144: ; 
@600:
@586:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@583:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_popcnt$qv+0
	dd @583+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_popcnt$qv	endp
@stk@cpu@cpu_has_popcnt$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epomgeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$edpmgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTMD$@stk@cpu@cpu_has_f16c$qv	segment virtual
	align	2
@@_$ECTMD$@stk@cpu@cpu_has_f16c$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTMD$@stk@cpu@cpu_has_f16c$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_f16c$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_f16c$qv	proc	near
?live16436@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @601
@602:
	mov       ebx,offset $edpmgeia
	mov       eax,offset @@_$ECTMD$@stk@cpu@cpu_has_f16c$qv
	call      @__InitExceptBlockLDTC
?live16436@16: ; EBX = &$edpmgeia
	mov       eax,dword ptr [$epomgeia]
	cmp       eax,-1
	je        short @606
?live16436@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @604
?live16436@48: ; EBX = &$edpmgeia
@605:
@607:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@608:
@606:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @605
	cmp       dword ptr [ebx],0
	jne       short @605
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @611
@610:
@612:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@613:
@611:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @616
	cmp       dword ptr [ebx],0
@616:
	je        short @614
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @617
	cmp       eax,dword ptr [ebp-56]
@617:
	setne     cl
	and       ecx,1
	jmp short @615
@614:
	xor       ecx,ecx
@615:
	test      cl,cl
	jne       short @610
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-72]
	and       eax,536870912
	mov       dword ptr [$epomgeia],eax
?live16436@96: ; EBX = &$edpmgeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16436@112: ; EBX = &$edpmgeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16436@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16436@144: ; 
@618:
@604:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@601:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_f16c$qv+0
	dd @601+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_f16c$qv	endp
@stk@cpu@cpu_has_f16c$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehpmgeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elpmgeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTND$@stk@cpu@cpu_has_cmpxchg$qv	segment virtual
	align	2
@@_$ECTND$@stk@cpu@cpu_has_cmpxchg$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTND$@stk@cpu@cpu_has_cmpxchg$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_cmpxchg$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_cmpxchg$qv	proc	near
?live16438@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @619
@620:
	mov       ebx,offset $elpmgeia
	mov       eax,offset @@_$ECTND$@stk@cpu@cpu_has_cmpxchg$qv
	call      @__InitExceptBlockLDTC
?live16438@16: ; EBX = &$elpmgeia
	mov       eax,dword ptr [$ehpmgeia]
	cmp       eax,-1
	je        short @624
?live16438@32: ; EAX = @temp2
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp @622
?live16438@48: ; EBX = &$elpmgeia
@623:
@625:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@626:
@624:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @623
	cmp       dword ptr [ebx],0
	jne       short @623
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @629
@628:
@630:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@631:
@629:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @634
	cmp       dword ptr [ebx],0
@634:
	je        short @632
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @635
	cmp       eax,dword ptr [ebp-56]
@635:
	setne     cl
	and       ecx,1
	jmp short @633
@632:
	xor       ecx,ecx
@633:
	test      cl,cl
	jne       short @628
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	test      byte ptr [ebp-71],32
	je        short @636
@637:
	mov       dword ptr [$ehpmgeia],16
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16438@128: ; 
	mov       eax,16
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp @622
?live16438@144: ; EBX = &$elpmgeia
@638:
@636:
	test      byte ptr [ebp-63],1
	je        short @639
@640:
	mov       dword ptr [$ehpmgeia],8
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16438@192: ; 
	mov       eax,8
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp @622
?live16438@208: ; EBX = &$elpmgeia
@641:
@639:
	push      0
	push      -2147483647
	lea       ecx,dword ptr [ebp-64]
	push      ecx
	lea       ecx,dword ptr [ebp-72]
	push      ecx
	lea       eax,dword ptr [ebp-80]
	push      eax
	lea       edx,dword ptr [ebp-88]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	test      byte ptr [ebp-63],1
	je        short @642
@643:
	mov       dword ptr [$ehpmgeia],8
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16438@272: ; 
	mov       eax,8
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp short @622
?live16438@288: ; EBX = &$elpmgeia
@644:
@642:
	mov       dword ptr [$ehpmgeia],1
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16438@320: ; 
	mov       eax,1
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
@645:
@622:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@619:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_cmpxchg$qv+0
	dd @619+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_cmpxchg$qv	endp
@stk@cpu@cpu_has_cmpxchg$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eppmgeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$edangeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTOD$@stk@cpu@cpu_has_vmx$qv	segment virtual
	align	2
@@_$ECTOD$@stk@cpu@cpu_has_vmx$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTOD$@stk@cpu@cpu_has_vmx$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_vmx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_vmx$qv	proc	near
?live16440@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @646
@647:
	mov       ebx,offset $edangeia
	mov       eax,offset @@_$ECTOD$@stk@cpu@cpu_has_vmx$qv
	call      @__InitExceptBlockLDTC
?live16440@16: ; EBX = &$edangeia
	mov       eax,dword ptr [$eppmgeia]
	cmp       eax,-1
	je        short @651
?live16440@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @649
?live16440@48: ; EBX = &$edangeia
@650:
@652:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@653:
@651:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @650
	cmp       dword ptr [ebx],0
	jne       short @650
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @656
@655:
@657:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@658:
@656:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @661
	cmp       dword ptr [ebx],0
@661:
	je        short @659
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @662
	cmp       eax,dword ptr [ebp-56]
@662:
	setne     cl
	and       ecx,1
	jmp short @660
@659:
	xor       ecx,ecx
@660:
	test      cl,cl
	jne       short @655
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-72]
	and       eax,32
	mov       dword ptr [$eppmgeia],eax
?live16440@96: ; EBX = &$edangeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16440@112: ; EBX = &$edangeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16440@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16440@144: ; 
@663:
@649:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@646:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_vmx$qv+0
	dd @646+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_vmx$qv	endp
@stk@cpu@cpu_has_vmx$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehangeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elangeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTPD$@stk@cpu@cpu_has_smx$qv	segment virtual
	align	2
@@_$ECTPD$@stk@cpu@cpu_has_smx$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTPD$@stk@cpu@cpu_has_smx$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_smx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_smx$qv	proc	near
?live16442@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @664
@665:
	mov       ebx,offset $elangeia
	mov       eax,offset @@_$ECTPD$@stk@cpu@cpu_has_smx$qv
	call      @__InitExceptBlockLDTC
?live16442@16: ; EBX = &$elangeia
	mov       eax,dword ptr [$ehangeia]
	cmp       eax,-1
	je        short @669
?live16442@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @667
?live16442@48: ; EBX = &$elangeia
@668:
@670:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@671:
@669:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @668
	cmp       dword ptr [ebx],0
	jne       short @668
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @674
@673:
@675:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@676:
@674:
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
	cmp       edx,dword ptr [ebp-52]
	jne       short @680
	cmp       eax,dword ptr [ebp-56]
@680:
	setne     cl
	and       ecx,1
	jmp short @678
@677:
	xor       ecx,ecx
@678:
	test      cl,cl
	jne       short @673
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-72]
	and       eax,64
	mov       dword ptr [$ehangeia],eax
?live16442@96: ; EBX = &$elangeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16442@112: ; EBX = &$elangeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16442@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16442@144: ; 
@681:
@667:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@664:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_smx$qv+0
	dd @664+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_smx$qv	endp
@stk@cpu@cpu_has_smx$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epangeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$edbngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTQD$@stk@cpu@cpu_has_cmov$qv	segment virtual
	align	2
@@_$ECTQD$@stk@cpu@cpu_has_cmov$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTQD$@stk@cpu@cpu_has_cmov$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_cmov$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_cmov$qv	proc	near
?live16444@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @682
@683:
	mov       ebx,offset $edbngeia
	mov       eax,offset @@_$ECTQD$@stk@cpu@cpu_has_cmov$qv
	call      @__InitExceptBlockLDTC
?live16444@16: ; EBX = &$edbngeia
	mov       eax,dword ptr [$epangeia]
	cmp       eax,-1
	je        short @687
?live16444@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @685
?live16444@48: ; EBX = &$edbngeia
@686:
@688:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@689:
@687:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @686
	cmp       dword ptr [ebx],0
	jne       short @686
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @692
@691:
@693:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@694:
@692:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @697
	cmp       dword ptr [ebx],0
@697:
	je        short @695
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @698
	cmp       eax,dword ptr [ebp-56]
@698:
	setne     cl
	and       ecx,1
	jmp short @696
@695:
	xor       ecx,ecx
@696:
	test      cl,cl
	jne       short @691
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-64]
	and       eax,32768
	mov       dword ptr [$epangeia],eax
?live16444@96: ; EBX = &$edbngeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16444@112: ; EBX = &$edbngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16444@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16444@144: ; 
@699:
@685:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@682:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_cmov$qv+0
	dd @682+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_cmov$qv	endp
@stk@cpu@cpu_has_cmov$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehbngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elbngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTRD$@stk@cpu@cpu_has_movbe$qv	segment virtual
	align	2
@@_$ECTRD$@stk@cpu@cpu_has_movbe$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTRD$@stk@cpu@cpu_has_movbe$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_movbe$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_movbe$qv	proc	near
?live16446@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @700
@701:
	mov       ebx,offset $elbngeia
	mov       eax,offset @@_$ECTRD$@stk@cpu@cpu_has_movbe$qv
	call      @__InitExceptBlockLDTC
?live16446@16: ; EBX = &$elbngeia
	mov       eax,dword ptr [$ehbngeia]
	cmp       eax,-1
	je        short @705
?live16446@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @703
?live16446@48: ; EBX = &$elbngeia
@704:
@706:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@707:
@705:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @704
	cmp       dword ptr [ebx],0
	jne       short @704
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @710
@709:
@711:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@712:
@710:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @715
	cmp       dword ptr [ebx],0
@715:
	je        short @713
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @716
	cmp       eax,dword ptr [ebp-56]
@716:
	setne     cl
	and       ecx,1
	jmp short @714
@713:
	xor       ecx,ecx
@714:
	test      cl,cl
	jne       short @709
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-72]
	and       eax,4194304
	mov       dword ptr [$ehbngeia],eax
?live16446@96: ; EBX = &$elbngeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16446@112: ; EBX = &$elbngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16446@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16446@144: ; 
@717:
@703:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@700:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_movbe$qv+0
	dd @700+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_movbe$qv	endp
@stk@cpu@cpu_has_movbe$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epbngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$edcngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTSD$@stk@cpu@cpu_has_bmi$qv	segment virtual
	align	2
@@_$ECTSD$@stk@cpu@cpu_has_bmi$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTSD$@stk@cpu@cpu_has_bmi$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_bmi$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_bmi$qv	proc	near
?live16448@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @718
@719:
	mov       ebx,offset $edcngeia
	mov       eax,offset @@_$ECTSD$@stk@cpu@cpu_has_bmi$qv
	call      @__InitExceptBlockLDTC
?live16448@16: ; EBX = &$edcngeia
	mov       eax,dword ptr [$epbngeia]
	cmp       eax,-1
	je        short @723
?live16448@32: ; EAX = @temp3
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp @721
?live16448@48: ; EBX = &$edcngeia
@722:
@724:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@725:
@723:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @722
	cmp       dword ptr [ebx],0
	jne       short @722
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @728
@727:
@729:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@730:
@728:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @733
	cmp       dword ptr [ebx],0
@733:
	je        short @731
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @734
	cmp       eax,dword ptr [ebp-56]
@734:
	setne     cl
	and       ecx,1
	jmp short @732
@731:
	xor       ecx,ecx
@732:
	test      cl,cl
	jne       short @727
	push      0
	push      7
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	test      byte ptr [ebp-79],1
	je        short @735
	mov       dword ptr [$epbngeia],2
	jmp short @736
@735:
	test      byte ptr [ebp-80],8
	je        short @737
	mov       dword ptr [$epbngeia],1
	jmp short @736
@737:
	xor       edx,edx
	mov       dword ptr [$epbngeia],edx
@736:
	cmp       dword ptr [$epbngeia],0
	setne     cl
	and       ecx,1
?live16448@176: ; EBX = &$edcngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
?live16448@192: ; ECX = ret
	xor       eax,eax
?live16448@208: ; EBX = &$edcngeia, ECX = ret
	mov       dword ptr [ebx+4],0
?live16448@224: ; ECX = ret
	mov       edx,dword ptr [ebp-44]
	mov       al,cl
	mov       dword ptr fs:[0],edx
?live16448@240: ; 
@738:
@721:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@718:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_bmi$qv+0
	dd @718+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_bmi$qv	endp
@stk@cpu@cpu_has_bmi$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehcngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elcngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTTD$@stk@cpu@cpu_has_erms$qv	segment virtual
	align	2
@@_$ECTTD$@stk@cpu@cpu_has_erms$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTTD$@stk@cpu@cpu_has_erms$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_erms$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_erms$qv	proc	near
?live16450@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @739
@740:
	mov       ebx,offset $elcngeia
	mov       eax,offset @@_$ECTTD$@stk@cpu@cpu_has_erms$qv
	call      @__InitExceptBlockLDTC
?live16450@16: ; EBX = &$elcngeia
	mov       eax,dword ptr [$ehcngeia]
	cmp       eax,-1
	je        short @744
?live16450@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @742
?live16450@48: ; EBX = &$elcngeia
@743:
@745:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@746:
@744:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @743
	cmp       dword ptr [ebx],0
	jne       short @743
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @749
@748:
@750:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@751:
@749:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @754
	cmp       dword ptr [ebx],0
@754:
	je        short @752
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @755
	cmp       eax,dword ptr [ebp-56]
@755:
	setne     cl
	and       ecx,1
	jmp short @753
@752:
	xor       ecx,ecx
@753:
	test      cl,cl
	jne       short @748
	push      0
	push      7
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-80]
	and       eax,512
	mov       dword ptr [$ehcngeia],eax
?live16450@96: ; EBX = &$elcngeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16450@112: ; EBX = &$elcngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16450@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16450@144: ; 
@756:
@742:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@739:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_erms$qv+0
	dd @739+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_erms$qv	endp
@stk@cpu@cpu_has_erms$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epcngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eddngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTUD$@stk@cpu@cpu_has_3dnow$qv	segment virtual
	align	2
@@_$ECTUD$@stk@cpu@cpu_has_3dnow$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTUD$@stk@cpu@cpu_has_3dnow$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_3dnow$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_3dnow$qv	proc	near
?live16452@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @757
@758:
	mov       ebx,offset $eddngeia
	mov       eax,offset @@_$ECTUD$@stk@cpu@cpu_has_3dnow$qv
	call      @__InitExceptBlockLDTC
?live16452@16: ; EBX = &$eddngeia
	mov       eax,dword ptr [$epcngeia]
	cmp       eax,-1
	je        short @762
?live16452@32: ; EAX = @temp3
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp @760
?live16452@48: ; EBX = &$eddngeia
@761:
@763:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@764:
@762:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @761
	cmp       dword ptr [ebx],0
	jne       short @761
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @767
@766:
@768:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@769:
@767:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @772
	cmp       dword ptr [ebx],0
@772:
	je        short @770
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @773
	cmp       eax,dword ptr [ebp-56]
@773:
	setne     cl
	and       ecx,1
	jmp short @771
@770:
	xor       ecx,ecx
@771:
	test      cl,cl
	jne       short @766
	push      0
	push      -2147483647
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	test      byte ptr [ebp-61],64
	je        short @774
	mov       dword ptr [$epcngeia],2
	jmp short @775
@774:
	test      byte ptr [ebp-61],-128
	je        short @776
	mov       dword ptr [$epcngeia],1
	jmp short @775
@776:
	xor       edx,edx
	mov       dword ptr [$epcngeia],edx
@775:
	cmp       dword ptr [$epcngeia],0
	setne     cl
	and       ecx,1
?live16452@176: ; EBX = &$eddngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
?live16452@192: ; ECX = ret
	xor       eax,eax
?live16452@208: ; EBX = &$eddngeia, ECX = ret
	mov       dword ptr [ebx+4],0
?live16452@224: ; ECX = ret
	mov       edx,dword ptr [ebp-44]
	mov       al,cl
	mov       dword ptr fs:[0],edx
?live16452@240: ; 
@777:
@760:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@757:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_3dnow$qv+0
	dd @757+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_3dnow$qv	endp
@stk@cpu@cpu_has_3dnow$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehdngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eldngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTVD$@stk@cpu@cpu_has_3dnowprefetch$qv	segment virtual
	align	2
@@_$ECTVD$@stk@cpu@cpu_has_3dnowprefetch$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTVD$@stk@cpu@cpu_has_3dnowprefetch$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_3dnowprefetch$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_3dnowprefetch$qv	proc	near
?live16454@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @778
@779:
	mov       ebx,offset $eldngeia
	mov       eax,offset @@_$ECTVD$@stk@cpu@cpu_has_3dnowprefetch$qv
	call      @__InitExceptBlockLDTC
?live16454@16: ; EBX = &$eldngeia
	mov       eax,dword ptr [$ehdngeia]
	cmp       eax,-1
	je        short @783
?live16454@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @781
?live16454@48: ; EBX = &$eldngeia
@782:
@784:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@785:
@783:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @782
	cmp       dword ptr [ebx],0
	jne       short @782
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @788
@787:
@789:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@790:
@788:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @793
	cmp       dword ptr [ebx],0
@793:
	je        short @791
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @794
	cmp       eax,dword ptr [ebp-56]
@794:
	setne     cl
	and       ecx,1
	jmp short @792
@791:
	xor       ecx,ecx
@792:
	test      cl,cl
	jne       short @787
	push      0
	push      -2147483647
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-72]
	and       eax,256
	mov       dword ptr [$ehdngeia],eax
?live16454@96: ; EBX = &$eldngeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16454@112: ; EBX = &$eldngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16454@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16454@144: ; 
@795:
@781:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@778:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_3dnowprefetch$qv+0
	dd @778+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_3dnowprefetch$qv	endp
@stk@cpu@cpu_has_3dnowprefetch$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epdngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$edengeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTWD$@stk@cpu@cpu_has_perftsc$qv	segment virtual
	align	2
@@_$ECTWD$@stk@cpu@cpu_has_perftsc$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTWD$@stk@cpu@cpu_has_perftsc$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_perftsc$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_perftsc$qv	proc	near
?live16456@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @796
@797:
	mov       ebx,offset $edengeia
	mov       eax,offset @@_$ECTWD$@stk@cpu@cpu_has_perftsc$qv
	call      @__InitExceptBlockLDTC
?live16456@16: ; EBX = &$edengeia
	mov       eax,dword ptr [$epdngeia]
	cmp       eax,-1
	je        short @801
?live16456@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @799
?live16456@48: ; EBX = &$edengeia
@800:
@802:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@803:
@801:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @800
	cmp       dword ptr [ebx],0
	jne       short @800
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @806
@805:
@807:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@808:
@806:
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
	cmp       edx,dword ptr [ebp-52]
	jne       short @812
	cmp       eax,dword ptr [ebp-56]
@812:
	setne     cl
	and       ecx,1
	jmp short @810
@809:
	xor       ecx,ecx
@810:
	test      cl,cl
	jne       short @805
	push      0
	push      -2147483647
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-64]
	and       eax,134217728
	mov       dword ptr [$epdngeia],eax
?live16456@96: ; EBX = &$edengeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16456@112: ; EBX = &$edengeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16456@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16456@144: ; 
@813:
@799:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@796:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_perftsc$qv+0
	dd @796+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_perftsc$qv	endp
@stk@cpu@cpu_has_perftsc$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehengeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elengeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTXD$@stk@cpu@cpu_has_sha$qv	segment virtual
	align	2
@@_$ECTXD$@stk@cpu@cpu_has_sha$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTXD$@stk@cpu@cpu_has_sha$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_sha$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_sha$qv	proc	near
?live16458@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @814
@815:
	mov       ebx,offset $elengeia
	mov       eax,offset @@_$ECTXD$@stk@cpu@cpu_has_sha$qv
	call      @__InitExceptBlockLDTC
?live16458@16: ; EBX = &$elengeia
	mov       eax,dword ptr [$ehengeia]
	cmp       eax,-1
	je        short @819
?live16458@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @817
?live16458@48: ; EBX = &$elengeia
@818:
@820:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@821:
@819:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @818
	cmp       dword ptr [ebx],0
	jne       short @818
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @824
@823:
@825:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@826:
@824:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @829
	cmp       dword ptr [ebx],0
@829:
	je        short @827
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @830
	cmp       eax,dword ptr [ebp-56]
@830:
	setne     cl
	and       ecx,1
	jmp short @828
@827:
	xor       ecx,ecx
@828:
	test      cl,cl
	jne       short @823
	push      0
	push      7
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-80]
	and       eax,536870912
	mov       dword ptr [$ehengeia],eax
?live16458@96: ; EBX = &$elengeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16458@112: ; EBX = &$elengeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16458@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16458@144: ; 
@831:
@817:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@814:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_sha$qv+0
	dd @814+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_sha$qv	endp
@stk@cpu@cpu_has_sha$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epengeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$edfngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTYD$@stk@cpu@cpu_has_xop$qv	segment virtual
	align	2
@@_$ECTYD$@stk@cpu@cpu_has_xop$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTYD$@stk@cpu@cpu_has_xop$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_xop$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_xop$qv	proc	near
?live16460@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @832
@833:
	mov       ebx,offset $edfngeia
	mov       eax,offset @@_$ECTYD$@stk@cpu@cpu_has_xop$qv
	call      @__InitExceptBlockLDTC
?live16460@16: ; EBX = &$edfngeia
	mov       eax,dword ptr [$epengeia]
	cmp       eax,-1
	je        short @837
?live16460@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @835
?live16460@48: ; EBX = &$edfngeia
@836:
@838:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@839:
@837:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @836
	cmp       dword ptr [ebx],0
	jne       short @836
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @842
@841:
@843:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@844:
@842:
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
	cmp       edx,dword ptr [ebp-52]
	jne       short @848
	cmp       eax,dword ptr [ebp-56]
@848:
	setne     cl
	and       ecx,1
	jmp short @846
@845:
	xor       ecx,ecx
@846:
	test      cl,cl
	jne       short @841
	push      0
	push      -2147483647
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-72]
	and       eax,2048
	mov       dword ptr [$epengeia],eax
?live16460@96: ; EBX = &$edfngeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16460@112: ; EBX = &$edfngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16460@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16460@144: ; 
@849:
@835:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@832:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_xop$qv+0
	dd @832+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_xop$qv	endp
@stk@cpu@cpu_has_xop$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehfngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elfngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTZD$@stk@cpu@cpu_has_avx512f$qv	segment virtual
	align	2
@@_$ECTZD$@stk@cpu@cpu_has_avx512f$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTZD$@stk@cpu@cpu_has_avx512f$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512f$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512f$qv	proc	near
?live16462@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @850
@851:
	mov       ebx,offset $elfngeia
	mov       eax,offset @@_$ECTZD$@stk@cpu@cpu_has_avx512f$qv
	call      @__InitExceptBlockLDTC
?live16462@16: ; EBX = &$elfngeia
	mov       eax,dword ptr [$ehfngeia]
	cmp       eax,-1
	je        short @855
?live16462@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @853
?live16462@48: ; EBX = &$elfngeia
@854:
@856:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@857:
@855:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @854
	cmp       dword ptr [ebx],0
	jne       short @854
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @860
@859:
@861:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@862:
@860:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @865
	cmp       dword ptr [ebx],0
@865:
	je        short @863
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @866
	cmp       eax,dword ptr [ebp-56]
@866:
	setne     cl
	and       ecx,1
	jmp short @864
@863:
	xor       ecx,ecx
@864:
	test      cl,cl
	jne       short @859
	push      0
	push      7
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-80]
	and       eax,65536
	mov       dword ptr [$ehfngeia],eax
?live16462@96: ; EBX = &$elfngeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16462@112: ; EBX = &$elfngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16462@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16462@144: ; 
@867:
@853:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@850:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_avx512f$qv+0
	dd @850+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_avx512f$qv	endp
@stk@cpu@cpu_has_avx512f$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epfngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$edgngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTAE$@stk@cpu@cpu_has_avx512bw$qv	segment virtual
	align	2
@@_$ECTAE$@stk@cpu@cpu_has_avx512bw$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTAE$@stk@cpu@cpu_has_avx512bw$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512bw$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512bw$qv	proc	near
?live16464@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @868
@869:
	mov       ebx,offset $edgngeia
	mov       eax,offset @@_$ECTAE$@stk@cpu@cpu_has_avx512bw$qv
	call      @__InitExceptBlockLDTC
?live16464@16: ; EBX = &$edgngeia
	mov       eax,dword ptr [$epfngeia]
	cmp       eax,-1
	je        short @873
?live16464@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @871
?live16464@48: ; EBX = &$edgngeia
@872:
@874:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@875:
@873:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @872
	cmp       dword ptr [ebx],0
	jne       short @872
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @878
@877:
@879:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@880:
@878:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @883
	cmp       dword ptr [ebx],0
@883:
	je        short @881
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @884
	cmp       eax,dword ptr [ebp-56]
@884:
	setne     cl
	and       ecx,1
	jmp short @882
@881:
	xor       ecx,ecx
@882:
	test      cl,cl
	jne       short @877
	push      0
	push      7
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-80]
	and       eax,1073741824
	mov       dword ptr [$epfngeia],eax
?live16464@96: ; EBX = &$edgngeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16464@112: ; EBX = &$edgngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16464@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16464@144: ; 
@885:
@871:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@868:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_avx512bw$qv+0
	dd @868+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_avx512bw$qv	endp
@stk@cpu@cpu_has_avx512bw$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehgngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elgngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTBE$@stk@cpu@cpu_has_avx512er$qv	segment virtual
	align	2
@@_$ECTBE$@stk@cpu@cpu_has_avx512er$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTBE$@stk@cpu@cpu_has_avx512er$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512er$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512er$qv	proc	near
?live16466@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @886
@887:
	mov       ebx,offset $elgngeia
	mov       eax,offset @@_$ECTBE$@stk@cpu@cpu_has_avx512er$qv
	call      @__InitExceptBlockLDTC
?live16466@16: ; EBX = &$elgngeia
	mov       eax,dword ptr [$ehgngeia]
	cmp       eax,-1
	je        short @891
?live16466@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @889
?live16466@48: ; EBX = &$elgngeia
@890:
@892:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@893:
@891:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @890
	cmp       dword ptr [ebx],0
	jne       short @890
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @896
@895:
@897:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@898:
@896:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @901
	cmp       dword ptr [ebx],0
@901:
	je        short @899
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @902
	cmp       eax,dword ptr [ebp-56]
@902:
	setne     cl
	and       ecx,1
	jmp short @900
@899:
	xor       ecx,ecx
@900:
	test      cl,cl
	jne       short @895
	push      0
	push      7
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-80]
	and       eax,134217728
	mov       dword ptr [$ehgngeia],eax
?live16466@96: ; EBX = &$elgngeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16466@112: ; EBX = &$elgngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16466@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16466@144: ; 
@903:
@889:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@886:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_avx512er$qv+0
	dd @886+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_avx512er$qv	endp
@stk@cpu@cpu_has_avx512er$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epgngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$edhngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTCE$@stk@cpu@cpu_has_avx512cd$qv	segment virtual
	align	2
@@_$ECTCE$@stk@cpu@cpu_has_avx512cd$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTCE$@stk@cpu@cpu_has_avx512cd$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512cd$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512cd$qv	proc	near
?live16468@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @904
@905:
	mov       ebx,offset $edhngeia
	mov       eax,offset @@_$ECTCE$@stk@cpu@cpu_has_avx512cd$qv
	call      @__InitExceptBlockLDTC
?live16468@16: ; EBX = &$edhngeia
	mov       eax,dword ptr [$epgngeia]
	cmp       eax,-1
	je        short @909
?live16468@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @907
?live16468@48: ; EBX = &$edhngeia
@908:
@910:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@911:
@909:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @908
	cmp       dword ptr [ebx],0
	jne       short @908
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @914
@913:
@915:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@916:
@914:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @919
	cmp       dword ptr [ebx],0
@919:
	je        short @917
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @920
	cmp       eax,dword ptr [ebp-56]
@920:
	setne     cl
	and       ecx,1
	jmp short @918
@917:
	xor       ecx,ecx
@918:
	test      cl,cl
	jne       short @913
	push      0
	push      7
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-80]
	and       eax,268435456
	mov       dword ptr [$epgngeia],eax
?live16468@96: ; EBX = &$edhngeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16468@112: ; EBX = &$edhngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16468@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16468@144: ; 
@921:
@907:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@904:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_avx512cd$qv+0
	dd @904+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_avx512cd$qv	endp
@stk@cpu@cpu_has_avx512cd$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehhngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elhngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTDE$@stk@cpu@cpu_has_avx512pf$qv	segment virtual
	align	2
@@_$ECTDE$@stk@cpu@cpu_has_avx512pf$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTDE$@stk@cpu@cpu_has_avx512pf$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512pf$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512pf$qv	proc	near
?live16470@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @922
@923:
	mov       ebx,offset $elhngeia
	mov       eax,offset @@_$ECTDE$@stk@cpu@cpu_has_avx512pf$qv
	call      @__InitExceptBlockLDTC
?live16470@16: ; EBX = &$elhngeia
	mov       eax,dword ptr [$ehhngeia]
	cmp       eax,-1
	je        short @927
?live16470@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @925
?live16470@48: ; EBX = &$elhngeia
@926:
@928:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@929:
@927:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @926
	cmp       dword ptr [ebx],0
	jne       short @926
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @932
@931:
@933:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@934:
@932:
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
	cmp       edx,dword ptr [ebp-52]
	jne       short @938
	cmp       eax,dword ptr [ebp-56]
@938:
	setne     cl
	and       ecx,1
	jmp short @936
@935:
	xor       ecx,ecx
@936:
	test      cl,cl
	jne       short @931
	push      0
	push      7
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-80]
	and       eax,67108864
	mov       dword ptr [$ehhngeia],eax
?live16470@96: ; EBX = &$elhngeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16470@112: ; EBX = &$elhngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16470@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16470@144: ; 
@939:
@925:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@922:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_avx512pf$qv+0
	dd @922+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_avx512pf$qv	endp
@stk@cpu@cpu_has_avx512pf$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ephngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$edingeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTEE$@stk@cpu@cpu_has_avx512dq$qv	segment virtual
	align	2
@@_$ECTEE$@stk@cpu@cpu_has_avx512dq$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTEE$@stk@cpu@cpu_has_avx512dq$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512dq$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512dq$qv	proc	near
?live16472@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @940
@941:
	mov       ebx,offset $edingeia
	mov       eax,offset @@_$ECTEE$@stk@cpu@cpu_has_avx512dq$qv
	call      @__InitExceptBlockLDTC
?live16472@16: ; EBX = &$edingeia
	mov       eax,dword ptr [$ephngeia]
	cmp       eax,-1
	je        short @945
?live16472@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @943
?live16472@48: ; EBX = &$edingeia
@944:
@946:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@947:
@945:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @944
	cmp       dword ptr [ebx],0
	jne       short @944
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @950
@949:
@951:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@952:
@950:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @955
	cmp       dword ptr [ebx],0
@955:
	je        short @953
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @956
	cmp       eax,dword ptr [ebp-56]
@956:
	setne     cl
	and       ecx,1
	jmp short @954
@953:
	xor       ecx,ecx
@954:
	test      cl,cl
	jne       short @949
	push      0
	push      7
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-80]
	and       eax,131072
	mov       dword ptr [$ephngeia],eax
?live16472@96: ; EBX = &$edingeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16472@112: ; EBX = &$edingeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16472@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16472@144: ; 
@957:
@943:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@940:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_avx512dq$qv+0
	dd @940+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_avx512dq$qv	endp
@stk@cpu@cpu_has_avx512dq$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehingeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elingeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTFE$@stk@cpu@cpu_has_avx512vl$qv	segment virtual
	align	2
@@_$ECTFE$@stk@cpu@cpu_has_avx512vl$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTFE$@stk@cpu@cpu_has_avx512vl$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512vl$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512vl$qv	proc	near
?live16474@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @958
@959:
	mov       ebx,offset $elingeia
	mov       eax,offset @@_$ECTFE$@stk@cpu@cpu_has_avx512vl$qv
	call      @__InitExceptBlockLDTC
?live16474@16: ; EBX = &$elingeia
	mov       eax,dword ptr [$ehingeia]
	cmp       eax,-1
	je        short @963
?live16474@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @961
?live16474@48: ; EBX = &$elingeia
@962:
@964:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@965:
@963:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @962
	cmp       dword ptr [ebx],0
	jne       short @962
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @968
@967:
@969:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@970:
@968:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @973
	cmp       dword ptr [ebx],0
@973:
	je        short @971
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @974
	cmp       eax,dword ptr [ebp-56]
@974:
	setne     cl
	and       ecx,1
	jmp short @972
@971:
	xor       ecx,ecx
@972:
	test      cl,cl
	jne       short @967
	push      0
	push      7
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-80]
	and       eax,-2147483648
	mov       dword ptr [$ehingeia],eax
?live16474@96: ; EBX = &$elingeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16474@112: ; EBX = &$elingeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16474@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16474@144: ; 
@975:
@961:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@958:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_avx512vl$qv+0
	dd @958+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_avx512vl$qv	endp
@stk@cpu@cpu_has_avx512vl$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epingeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$edjngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTGE$@stk@cpu@cpu_has_avx512ifma$qv	segment virtual
	align	2
@@_$ECTGE$@stk@cpu@cpu_has_avx512ifma$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTGE$@stk@cpu@cpu_has_avx512ifma$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512ifma$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512ifma$qv	proc	near
?live16476@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @976
@977:
	mov       ebx,offset $edjngeia
	mov       eax,offset @@_$ECTGE$@stk@cpu@cpu_has_avx512ifma$qv
	call      @__InitExceptBlockLDTC
?live16476@16: ; EBX = &$edjngeia
	mov       eax,dword ptr [$epingeia]
	cmp       eax,-1
	je        short @981
?live16476@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @979
?live16476@48: ; EBX = &$edjngeia
@980:
@982:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@983:
@981:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @980
	cmp       dword ptr [ebx],0
	jne       short @980
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @986
@985:
@987:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@988:
@986:
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
	cmp       edx,dword ptr [ebp-52]
	jne       short @992
	cmp       eax,dword ptr [ebp-56]
@992:
	setne     cl
	and       ecx,1
	jmp short @990
@989:
	xor       ecx,ecx
@990:
	test      cl,cl
	jne       short @985
	push      0
	push      7
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-80]
	and       eax,2097152
	mov       dword ptr [$epingeia],eax
?live16476@96: ; EBX = &$edjngeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16476@112: ; EBX = &$edjngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16476@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16476@144: ; 
@993:
@979:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@976:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_avx512ifma$qv+0
	dd @976+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_avx512ifma$qv	endp
@stk@cpu@cpu_has_avx512ifma$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehjngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eljngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTHE$@stk@cpu@cpu_has_avx512vbmi$qv	segment virtual
	align	2
@@_$ECTHE$@stk@cpu@cpu_has_avx512vbmi$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTHE$@stk@cpu@cpu_has_avx512vbmi$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_avx512vbmi$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_avx512vbmi$qv	proc	near
?live16478@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @994
@995:
	mov       ebx,offset $eljngeia
	mov       eax,offset @@_$ECTHE$@stk@cpu@cpu_has_avx512vbmi$qv
	call      @__InitExceptBlockLDTC
?live16478@16: ; EBX = &$eljngeia
	mov       eax,dword ptr [$ehjngeia]
	cmp       eax,-1
	je        short @999
?live16478@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @997
?live16478@48: ; EBX = &$eljngeia
@998:
@1000:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1001:
@999:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @998
	cmp       dword ptr [ebx],0
	jne       short @998
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @1004
@1003:
@1005:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1006:
@1004:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1009
	cmp       dword ptr [ebx],0
@1009:
	je        short @1007
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @1010
	cmp       eax,dword ptr [ebp-56]
@1010:
	setne     cl
	and       ecx,1
	jmp short @1008
@1007:
	xor       ecx,ecx
@1008:
	test      cl,cl
	jne       short @1003
	push      0
	push      7
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-72]
	and       eax,2
	mov       dword ptr [$ehjngeia],eax
?live16478@96: ; EBX = &$eljngeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16478@112: ; EBX = &$eljngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16478@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16478@144: ; 
@1011:
@997:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@994:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_avx512vbmi$qv+0
	dd @994+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_avx512vbmi$qv	endp
@stk@cpu@cpu_has_avx512vbmi$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epjngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$edkngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTIE$@stk@cpu@cpu_has_adx$qv	segment virtual
	align	2
@@_$ECTIE$@stk@cpu@cpu_has_adx$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTIE$@stk@cpu@cpu_has_adx$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_adx$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_adx$qv	proc	near
?live16480@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @1012
@1013:
	mov       ebx,offset $edkngeia
	mov       eax,offset @@_$ECTIE$@stk@cpu@cpu_has_adx$qv
	call      @__InitExceptBlockLDTC
?live16480@16: ; EBX = &$edkngeia
	mov       eax,dword ptr [$epjngeia]
	cmp       eax,-1
	je        short @1017
?live16480@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @1015
?live16480@48: ; EBX = &$edkngeia
@1016:
@1018:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1019:
@1017:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1016
	cmp       dword ptr [ebx],0
	jne       short @1016
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @1022
@1021:
@1023:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1024:
@1022:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1027
	cmp       dword ptr [ebx],0
@1027:
	je        short @1025
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @1028
	cmp       eax,dword ptr [ebp-56]
@1028:
	setne     cl
	and       ecx,1
	jmp short @1026
@1025:
	xor       ecx,ecx
@1026:
	test      cl,cl
	jne       short @1021
	push      0
	push      7
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-80]
	and       eax,524288
	mov       dword ptr [$epjngeia],eax
?live16480@96: ; EBX = &$edkngeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16480@112: ; EBX = &$edkngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16480@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16480@144: ; 
@1029:
@1015:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1012:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_adx$qv+0
	dd @1012+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_adx$qv	endp
@stk@cpu@cpu_has_adx$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehkngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elkngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTJE$@stk@cpu@cpu_has_lzcnt$qv	segment virtual
	align	2
@@_$ECTJE$@stk@cpu@cpu_has_lzcnt$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTJE$@stk@cpu@cpu_has_lzcnt$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_lzcnt$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_lzcnt$qv	proc	near
?live16482@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @1030
@1031:
	mov       ebx,offset $elkngeia
	mov       eax,offset @@_$ECTJE$@stk@cpu@cpu_has_lzcnt$qv
	call      @__InitExceptBlockLDTC
?live16482@16: ; EBX = &$elkngeia
	mov       eax,dword ptr [$ehkngeia]
	cmp       eax,-1
	je        short @1035
?live16482@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @1033
?live16482@48: ; EBX = &$elkngeia
@1034:
@1036:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1037:
@1035:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1034
	cmp       dword ptr [ebx],0
	jne       short @1034
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @1040
@1039:
@1041:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1042:
@1040:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1045
	cmp       dword ptr [ebx],0
@1045:
	je        short @1043
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @1046
	cmp       eax,dword ptr [ebp-56]
@1046:
	setne     cl
	and       ecx,1
	jmp short @1044
@1043:
	xor       ecx,ecx
@1044:
	test      cl,cl
	jne       short @1039
	push      0
	push      -2147483647
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-72]
	and       eax,32
	mov       dword ptr [$ehkngeia],eax
?live16482@96: ; EBX = &$elkngeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16482@112: ; EBX = &$elkngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16482@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16482@144: ; 
@1047:
@1033:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1030:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_lzcnt$qv+0
	dd @1030+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_lzcnt$qv	endp
@stk@cpu@cpu_has_lzcnt$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epkngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$edlngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTKE$@stk@cpu@cpu_has_tbm$qv	segment virtual
	align	2
@@_$ECTKE$@stk@cpu@cpu_has_tbm$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTKE$@stk@cpu@cpu_has_tbm$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_tbm$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_tbm$qv	proc	near
?live16484@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @1048
@1049:
	mov       ebx,offset $edlngeia
	mov       eax,offset @@_$ECTKE$@stk@cpu@cpu_has_tbm$qv
	call      @__InitExceptBlockLDTC
?live16484@16: ; EBX = &$edlngeia
	mov       eax,dword ptr [$epkngeia]
	cmp       eax,-1
	je        short @1053
?live16484@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @1051
?live16484@48: ; EBX = &$edlngeia
@1052:
@1054:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1055:
@1053:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1052
	cmp       dword ptr [ebx],0
	jne       short @1052
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @1058
@1057:
@1059:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1060:
@1058:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1063
	cmp       dword ptr [ebx],0
@1063:
	je        short @1061
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @1064
	cmp       eax,dword ptr [ebp-56]
@1064:
	setne     cl
	and       ecx,1
	jmp short @1062
@1061:
	xor       ecx,ecx
@1062:
	test      cl,cl
	jne       short @1057
	push      0
	push      -2147483647
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-72]
	and       eax,2097152
	mov       dword ptr [$epkngeia],eax
?live16484@96: ; EBX = &$edlngeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16484@112: ; EBX = &$edlngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16484@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16484@144: ; 
@1065:
@1051:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1048:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_tbm$qv+0
	dd @1048+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_tbm$qv	endp
@stk@cpu@cpu_has_tbm$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehlngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ellngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTLE$@stk@cpu@cpu_has_clfsh$qv	segment virtual
	align	2
@@_$ECTLE$@stk@cpu@cpu_has_clfsh$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTLE$@stk@cpu@cpu_has_clfsh$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_clfsh$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_clfsh$qv	proc	near
?live16486@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @1066
@1067:
	mov       ebx,offset $ellngeia
	mov       eax,offset @@_$ECTLE$@stk@cpu@cpu_has_clfsh$qv
	call      @__InitExceptBlockLDTC
?live16486@16: ; EBX = &$ellngeia
	mov       eax,dword ptr [$ehlngeia]
	cmp       eax,-1
	je        short @1071
?live16486@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @1069
?live16486@48: ; EBX = &$ellngeia
@1070:
@1072:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1073:
@1071:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1070
	cmp       dword ptr [ebx],0
	jne       short @1070
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @1076
@1075:
@1077:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1078:
@1076:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1081
	cmp       dword ptr [ebx],0
@1081:
	je        short @1079
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @1082
	cmp       eax,dword ptr [ebp-56]
@1082:
	setne     cl
	and       ecx,1
	jmp short @1080
@1079:
	xor       ecx,ecx
@1080:
	test      cl,cl
	jne       short @1075
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-72]
	and       eax,524288
	mov       dword ptr [$ehlngeia],eax
?live16486@96: ; EBX = &$ellngeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16486@112: ; EBX = &$ellngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16486@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16486@144: ; 
@1083:
@1069:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1066:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_clfsh$qv+0
	dd @1066+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_clfsh$qv	endp
@stk@cpu@cpu_has_clfsh$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eplngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$edmngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTME$@stk@cpu@cpu_has_pclmulqdq$qv	segment virtual
	align	2
@@_$ECTME$@stk@cpu@cpu_has_pclmulqdq$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTME$@stk@cpu@cpu_has_pclmulqdq$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_pclmulqdq$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_pclmulqdq$qv	proc	near
?live16488@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @1084
@1085:
	mov       ebx,offset $edmngeia
	mov       eax,offset @@_$ECTME$@stk@cpu@cpu_has_pclmulqdq$qv
	call      @__InitExceptBlockLDTC
?live16488@16: ; EBX = &$edmngeia
	mov       eax,dword ptr [$eplngeia]
	cmp       eax,-1
	je        short @1089
?live16488@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @1087
?live16488@48: ; EBX = &$edmngeia
@1088:
@1090:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1091:
@1089:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1088
	cmp       dword ptr [ebx],0
	jne       short @1088
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @1094
@1093:
@1095:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1096:
@1094:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1099
	cmp       dword ptr [ebx],0
@1099:
	je        short @1097
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @1100
	cmp       eax,dword ptr [ebp-56]
@1100:
	setne     cl
	and       ecx,1
	jmp short @1098
@1097:
	xor       ecx,ecx
@1098:
	test      cl,cl
	jne       short @1093
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-72]
	and       eax,32
	mov       dword ptr [$eplngeia],eax
?live16488@96: ; EBX = &$edmngeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16488@112: ; EBX = &$edmngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16488@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16488@144: ; 
@1101:
@1087:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1084:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_pclmulqdq$qv+0
	dd @1084+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_pclmulqdq$qv	endp
@stk@cpu@cpu_has_pclmulqdq$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehmngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elmngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTNE$@stk@cpu@cpu_has_fxsr$qv	segment virtual
	align	2
@@_$ECTNE$@stk@cpu@cpu_has_fxsr$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTNE$@stk@cpu@cpu_has_fxsr$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_fxsr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_fxsr$qv	proc	near
?live16490@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @1102
@1103:
	mov       ebx,offset $elmngeia
	mov       eax,offset @@_$ECTNE$@stk@cpu@cpu_has_fxsr$qv
	call      @__InitExceptBlockLDTC
?live16490@16: ; EBX = &$elmngeia
	mov       eax,dword ptr [$ehmngeia]
	cmp       eax,-1
	je        short @1107
?live16490@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @1105
?live16490@48: ; EBX = &$elmngeia
@1106:
@1108:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1109:
@1107:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1106
	cmp       dword ptr [ebx],0
	jne       short @1106
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @1112
@1111:
@1113:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1114:
@1112:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1117
	cmp       dword ptr [ebx],0
@1117:
	je        short @1115
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @1118
	cmp       eax,dword ptr [ebp-56]
@1118:
	setne     cl
	and       ecx,1
	jmp short @1116
@1115:
	xor       ecx,ecx
@1116:
	test      cl,cl
	jne       short @1111
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-72]
	and       eax,16777216
	mov       dword ptr [$ehmngeia],eax
?live16490@96: ; EBX = &$elmngeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16490@112: ; EBX = &$elmngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16490@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16490@144: ; 
@1119:
@1105:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1102:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_fxsr$qv+0
	dd @1102+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_fxsr$qv	endp
@stk@cpu@cpu_has_fxsr$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epmngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ednngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTOE$@stk@cpu@cpu_has_ss$qv	segment virtual
	align	2
@@_$ECTOE$@stk@cpu@cpu_has_ss$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTOE$@stk@cpu@cpu_has_ss$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_ss$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_ss$qv	proc	near
?live16492@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @1120
@1121:
	mov       ebx,offset $ednngeia
	mov       eax,offset @@_$ECTOE$@stk@cpu@cpu_has_ss$qv
	call      @__InitExceptBlockLDTC
?live16492@16: ; EBX = &$ednngeia
	mov       eax,dword ptr [$epmngeia]
	cmp       eax,-1
	je        short @1125
?live16492@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @1123
?live16492@48: ; EBX = &$ednngeia
@1124:
@1126:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1127:
@1125:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1124
	cmp       dword ptr [ebx],0
	jne       short @1124
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @1130
@1129:
@1131:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1132:
@1130:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1135
	cmp       dword ptr [ebx],0
@1135:
	je        short @1133
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @1136
	cmp       eax,dword ptr [ebp-56]
@1136:
	setne     cl
	and       ecx,1
	jmp short @1134
@1133:
	xor       ecx,ecx
@1134:
	test      cl,cl
	jne       short @1129
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-72]
	and       eax,134217728
	mov       dword ptr [$epmngeia],eax
?live16492@96: ; EBX = &$ednngeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16492@112: ; EBX = &$ednngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16492@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16492@144: ; 
@1137:
@1123:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1120:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_ss$qv+0
	dd @1120+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_ss$qv	endp
@stk@cpu@cpu_has_ss$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehnngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elnngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTPE$@stk@cpu@cpu_has_mtrr$qv	segment virtual
	align	2
@@_$ECTPE$@stk@cpu@cpu_has_mtrr$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTPE$@stk@cpu@cpu_has_mtrr$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_mtrr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_mtrr$qv	proc	near
?live16494@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @1138
@1139:
	mov       ebx,offset $elnngeia
	mov       eax,offset @@_$ECTPE$@stk@cpu@cpu_has_mtrr$qv
	call      @__InitExceptBlockLDTC
?live16494@16: ; EBX = &$elnngeia
	mov       eax,dword ptr [$ehnngeia]
	cmp       eax,-1
	je        short @1143
?live16494@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @1141
?live16494@48: ; EBX = &$elnngeia
@1142:
@1144:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1145:
@1143:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1142
	cmp       dword ptr [ebx],0
	jne       short @1142
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @1148
@1147:
@1149:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1150:
@1148:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1153
	cmp       dword ptr [ebx],0
@1153:
	je        short @1151
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @1154
	cmp       eax,dword ptr [ebp-56]
@1154:
	setne     cl
	and       ecx,1
	jmp short @1152
@1151:
	xor       ecx,ecx
@1152:
	test      cl,cl
	jne       short @1147
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-72]
	and       eax,4096
	mov       dword ptr [$ehnngeia],eax
?live16494@96: ; EBX = &$elnngeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16494@112: ; EBX = &$elnngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16494@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16494@144: ; 
@1155:
@1141:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1138:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_mtrr$qv+0
	dd @1138+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_mtrr$qv	endp
@stk@cpu@cpu_has_mtrr$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epnngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$edongeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTQE$@stk@cpu@cpu_has_msr$qv	segment virtual
	align	2
@@_$ECTQE$@stk@cpu@cpu_has_msr$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTQE$@stk@cpu@cpu_has_msr$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_msr$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_msr$qv	proc	near
?live16496@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @1156
@1157:
	mov       ebx,offset $edongeia
	mov       eax,offset @@_$ECTQE$@stk@cpu@cpu_has_msr$qv
	call      @__InitExceptBlockLDTC
?live16496@16: ; EBX = &$edongeia
	mov       eax,dword ptr [$epnngeia]
	cmp       eax,-1
	je        short @1161
?live16496@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @1159
?live16496@48: ; EBX = &$edongeia
@1160:
@1162:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1163:
@1161:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1160
	cmp       dword ptr [ebx],0
	jne       short @1160
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @1166
@1165:
@1167:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1168:
@1166:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1171
	cmp       dword ptr [ebx],0
@1171:
	je        short @1169
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @1172
	cmp       eax,dword ptr [ebp-56]
@1172:
	setne     cl
	and       ecx,1
	jmp short @1170
@1169:
	xor       ecx,ecx
@1170:
	test      cl,cl
	jne       short @1165
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-72]
	and       eax,4096
	mov       dword ptr [$epnngeia],eax
?live16496@96: ; EBX = &$edongeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16496@112: ; EBX = &$edongeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16496@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16496@144: ; 
@1173:
@1159:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1156:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_msr$qv+0
	dd @1156+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_msr$qv	endp
@stk@cpu@cpu_has_msr$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehongeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elongeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTRE$@stk@cpu@cpu_has_tsc$qv	segment virtual
	align	2
@@_$ECTRE$@stk@cpu@cpu_has_tsc$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTRE$@stk@cpu@cpu_has_tsc$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_tsc$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_tsc$qv	proc	near
?live16498@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @1174
@1175:
	mov       ebx,offset $elongeia
	mov       eax,offset @@_$ECTRE$@stk@cpu@cpu_has_tsc$qv
	call      @__InitExceptBlockLDTC
?live16498@16: ; EBX = &$elongeia
	mov       eax,dword ptr [$ehongeia]
	cmp       eax,-1
	je        short @1179
?live16498@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @1177
?live16498@48: ; EBX = &$elongeia
@1178:
@1180:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1181:
@1179:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1178
	cmp       dword ptr [ebx],0
	jne       short @1178
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @1184
@1183:
@1185:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1186:
@1184:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1189
	cmp       dword ptr [ebx],0
@1189:
	je        short @1187
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @1190
	cmp       eax,dword ptr [ebp-56]
@1190:
	setne     cl
	and       ecx,1
	jmp short @1188
@1187:
	xor       ecx,ecx
@1188:
	test      cl,cl
	jne       short @1183
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-64]
	and       eax,16
	mov       dword ptr [$ehongeia],eax
?live16498@96: ; EBX = &$elongeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16498@112: ; EBX = &$elongeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16498@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16498@144: ; 
@1191:
@1177:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1174:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_tsc$qv+0
	dd @1174+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_tsc$qv	endp
@stk@cpu@cpu_has_tsc$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$epongeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$edpngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTSE$@stk@cpu@cpu_has_psn$qv	segment virtual
	align	2
@@_$ECTSE$@stk@cpu@cpu_has_psn$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTSE$@stk@cpu@cpu_has_psn$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_psn$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_psn$qv	proc	near
?live16500@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @1192
@1193:
	mov       ebx,offset $edpngeia
	mov       eax,offset @@_$ECTSE$@stk@cpu@cpu_has_psn$qv
	call      @__InitExceptBlockLDTC
?live16500@16: ; EBX = &$edpngeia
	mov       eax,dword ptr [$epongeia]
	cmp       eax,-1
	je        short @1197
?live16500@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @1195
?live16500@48: ; EBX = &$edpngeia
@1196:
@1198:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1199:
@1197:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1196
	cmp       dword ptr [ebx],0
	jne       short @1196
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @1202
@1201:
@1203:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1204:
@1202:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1207
	cmp       dword ptr [ebx],0
@1207:
	je        short @1205
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @1208
	cmp       eax,dword ptr [ebp-56]
@1208:
	setne     cl
	and       ecx,1
	jmp short @1206
@1205:
	xor       ecx,ecx
@1206:
	test      cl,cl
	jne       short @1201
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-64]
	and       eax,262144
	mov       dword ptr [$epongeia],eax
?live16500@96: ; EBX = &$edpngeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16500@112: ; EBX = &$edpngeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16500@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16500@144: ; 
@1209:
@1195:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1192:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_psn$qv+0
	dd @1192+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_psn$qv	endp
@stk@cpu@cpu_has_psn$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehpngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elpngeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTTE$@stk@cpu@cpu_has_xsave$qv	segment virtual
	align	2
@@_$ECTTE$@stk@cpu@cpu_has_xsave$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTTE$@stk@cpu@cpu_has_xsave$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_xsave$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_xsave$qv	proc	near
?live16502@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @1210
@1211:
	mov       ebx,offset $elpngeia
	mov       eax,offset @@_$ECTTE$@stk@cpu@cpu_has_xsave$qv
	call      @__InitExceptBlockLDTC
?live16502@16: ; EBX = &$elpngeia
	mov       eax,dword ptr [$ehpngeia]
	cmp       eax,-1
	je        short @1215
?live16502@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @1213
?live16502@48: ; EBX = &$elpngeia
@1214:
@1216:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1217:
@1215:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1214
	cmp       dword ptr [ebx],0
	jne       short @1214
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @1220
@1219:
@1221:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1222:
@1220:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1225
	cmp       dword ptr [ebx],0
@1225:
	je        short @1223
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @1226
	cmp       eax,dword ptr [ebp-56]
@1226:
	setne     cl
	and       ecx,1
	jmp short @1224
@1223:
	xor       ecx,ecx
@1224:
	test      cl,cl
	jne       short @1219
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	mov       eax,dword ptr [ebp-72]
	mov       edx,dword ptr [ebp-72]
	and       edx,134217728
	and       eax,67108864
	shr       edx,27
	add       esp,24
	shr       eax,26
	and       eax,edx
?live16502@128: ; EBX = &$elpngeia, ECX = ret
	push      8
?live16502@144: ; EBX = &$elpngeia, EAX = @temp3
	test      eax,eax
?live16502@160: ; EBX = &$elpngeia, ECX = ret
	push      ebx
?live16502@176: ; EBX = &$elpngeia, EAX = @temp3
	setne     cl
	and       ecx,1
?live16502@192: ; EBX = &$elpngeia
	mov       dword ptr [$ehpngeia],eax
?live16502@208: ; EBX = &$elpngeia, ECX = ret
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16502@224: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16502@240: ; 
@1227:
@1213:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1210:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_xsave$qv+0
	dd @1210+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_xsave$qv	endp
@stk@cpu@cpu_has_xsave$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eppngeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$edaogeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTUE$@stk@cpu@cpu_has_clmul$qv	segment virtual
	align	2
@@_$ECTUE$@stk@cpu@cpu_has_clmul$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTUE$@stk@cpu@cpu_has_clmul$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_clmul$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_clmul$qv	proc	near
?live16504@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @1228
@1229:
	mov       ebx,offset $edaogeia
	mov       eax,offset @@_$ECTUE$@stk@cpu@cpu_has_clmul$qv
	call      @__InitExceptBlockLDTC
?live16504@16: ; EBX = &$edaogeia
	mov       eax,dword ptr [$eppngeia]
	cmp       eax,-1
	je        short @1233
?live16504@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @1231
?live16504@48: ; EBX = &$edaogeia
@1232:
@1234:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1235:
@1233:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1232
	cmp       dword ptr [ebx],0
	jne       short @1232
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @1238
@1237:
@1239:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1240:
@1238:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1243
	cmp       dword ptr [ebx],0
@1243:
	je        short @1241
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @1244
	cmp       eax,dword ptr [ebp-56]
@1244:
	setne     cl
	and       ecx,1
	jmp short @1242
@1241:
	xor       ecx,ecx
@1242:
	test      cl,cl
	jne       short @1237
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-72]
	and       eax,4
	mov       dword ptr [$eppngeia],eax
?live16504@96: ; EBX = &$edaogeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16504@112: ; EBX = &$edaogeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16504@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16504@144: ; 
@1245:
@1231:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1228:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_clmul$qv+0
	dd @1228+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_clmul$qv	endp
@stk@cpu@cpu_has_clmul$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ehaogeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$elaogeia	label	dword
	dd	0
	dd	0
	dd	0
	db	1	dup(?)
	align	4
$epaogeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTVE$@stk@cpu@cpu_psn$qv	segment virtual
	align	2
@@_$ECTVE$@stk@cpu@cpu_psn$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTVE$@stk@cpu@cpu_psn$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_psn$qv	segment virtual
	align	2
@@stk@cpu@cpu_psn$qv	proc	near
?live16506@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @1246
@1247:
	mov       ebx,offset $epaogeia
	mov       esi,offset $elaogeia
	mov       eax,offset @@_$ECTVE$@stk@cpu@cpu_psn$qv
	call      @__InitExceptBlockLDTC
?live16506@16: ; EBX = &$epaogeia, ESI = &$elaogeia
	cmp       dword ptr [$ehaogeia],-1
	je        short @1251
?live16506@32: ; ESI = &$elaogeia
	mov       eax,esi
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp @1249
?live16506@48: ; EBX = &$epaogeia, ESI = &$elaogeia
@1250:
@1252:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1253:
@1251:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1250
	cmp       dword ptr [ebx],0
	jne       short @1250
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @1256
@1255:
@1257:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1258:
@1256:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1261
	cmp       dword ptr [ebx],0
@1261:
	je        short @1259
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @1262
	cmp       eax,dword ptr [ebp-56]
@1262:
	setne     cl
	and       ecx,1
	jmp short @1260
@1259:
	xor       ecx,ecx
@1260:
	test      cl,cl
	jne       short @1255
	push      4
	push      esi
	call      _CG_D_EP
	xor       eax,eax
	mov       dword ptr [esi],eax
	push      4
	push      esi
	push      4
	call      _CG_DA_EPY
	xor       edx,edx
	mov       dword ptr [esi+4],edx
	push      4
	push      esi
	push      8
	call      _CG_DA_EPY
	xor       ecx,ecx
	mov       dword ptr [esi+8],ecx
	call      @@stk@cpu@cpu_has_psn$qv
	test      al,al
	jne       short @1263
@1264:
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16506@144: ; ESI = &$elaogeia
	mov       eax,esi
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp short @1249
?live16506@160: ; EBX = &$epaogeia, ESI = &$elaogeia
@1265:
@1263:
	push      0
	push      3
	lea       ecx,dword ptr [ebp-64]
	push      ecx
	lea       eax,dword ptr [ebp-72]
	push      eax
	lea       edx,dword ptr [ebp-80]
	push      edx
	lea       ecx,dword ptr [ebp-88]
	push      ecx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-88]
	push      4
	push      esi
	push      8
	call      _CG_DA_EPY
	mov       dword ptr [esi+8],eax
	mov       edx,dword ptr [ebp-64]
	push      4
	push      esi
	push      4
	call      _CG_DA_EPY
	mov       dword ptr [esi+4],edx
	mov       ecx,dword ptr [ebp-72]
	push      4
	push      esi
	call      _CG_D_EP
	mov       dword ptr [esi],ecx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16506@240: ; ESI = &$elaogeia
	mov       eax,esi
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16506@256: ; 
@1266:
@1249:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1246:
	db	67,71,83,0
	dd @@stk@cpu@cpu_psn$qv+0
	dd @1246+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_psn$qv	endp
@stk@cpu@cpu_psn$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$edbogeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ehbogeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTWE$@stk@cpu@cpu_has_fma$qv	segment virtual
	align	2
@@_$ECTWE$@stk@cpu@cpu_has_fma$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTWE$@stk@cpu@cpu_has_fma$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_fma$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_fma$qv	proc	near
?live16508@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @1267
@1268:
	mov       ebx,offset $ehbogeia
	mov       eax,offset @@_$ECTWE$@stk@cpu@cpu_has_fma$qv
	call      @__InitExceptBlockLDTC
?live16508@16: ; EBX = &$ehbogeia
	mov       eax,dword ptr [$edbogeia]
	cmp       eax,-1
	je        short @1272
?live16508@32: ; EAX = @temp3
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp @1270
?live16508@48: ; EBX = &$ehbogeia
@1271:
@1273:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1274:
@1272:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1271
	cmp       dword ptr [ebx],0
	jne       short @1271
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @1277
@1276:
@1278:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1279:
@1277:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1282
	cmp       dword ptr [ebx],0
@1282:
	je        short @1280
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @1283
	cmp       eax,dword ptr [ebp-56]
@1283:
	setne     cl
	and       ecx,1
	jmp short @1281
@1280:
	xor       ecx,ecx
@1281:
	test      cl,cl
	jne       short @1276
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	test      byte ptr [ebp-71],16
	je        short @1285
@1286:
	push      0
	push      -2147483647
	lea       edx,dword ptr [ebp-64]
	push      edx
	lea       ecx,dword ptr [ebp-72]
	push      ecx
	lea       eax,dword ptr [ebp-80]
	push      eax
	lea       edx,dword ptr [ebp-88]
	push      edx
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	test      byte ptr [ebp-70],1
	je        short @1287
	mov       dword ptr [$edbogeia],4
	jmp short @1290
@1287:
	mov       dword ptr [$edbogeia],3
@1289:
	jmp short @1290
@1285:
@1291:
	xor       ecx,ecx
	mov       dword ptr [$edbogeia],ecx
@1292:
@1290:
	cmp       dword ptr [$edbogeia],0
	setne     cl
	and       ecx,1
?live16508@208: ; EBX = &$ehbogeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
?live16508@224: ; ECX = ret
	xor       eax,eax
?live16508@240: ; EBX = &$ehbogeia, ECX = ret
	mov       dword ptr [ebx+4],0
?live16508@256: ; ECX = ret
	mov       edx,dword ptr [ebp-44]
	mov       al,cl
	mov       dword ptr fs:[0],edx
?live16508@272: ; 
@1293:
@1270:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1267:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_fma$qv+0
	dd @1267+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_fma$qv	endp
@stk@cpu@cpu_has_fma$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$elbogeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$epbogeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTXE$@stk@cpu@cpu_has_aes$qv	segment virtual
	align	2
@@_$ECTXE$@stk@cpu@cpu_has_aes$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTXE$@stk@cpu@cpu_has_aes$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_aes$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_aes$qv	proc	near
?live16510@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @1294
@1295:
	mov       ebx,offset $epbogeia
	mov       eax,offset @@_$ECTXE$@stk@cpu@cpu_has_aes$qv
	call      @__InitExceptBlockLDTC
?live16510@16: ; EBX = &$epbogeia
	mov       eax,dword ptr [$elbogeia]
	cmp       eax,-1
	je        short @1299
?live16510@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @1297
?live16510@48: ; EBX = &$epbogeia
@1298:
@1300:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1301:
@1299:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1298
	cmp       dword ptr [ebx],0
	jne       short @1298
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @1304
@1303:
@1305:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1306:
@1304:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1309
	cmp       dword ptr [ebx],0
@1309:
	je        short @1307
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @1310
	cmp       eax,dword ptr [ebp-56]
@1310:
	setne     cl
	and       ecx,1
	jmp short @1308
@1307:
	xor       ecx,ecx
@1308:
	test      cl,cl
	jne       short @1303
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-72]
	and       eax,33554432
	mov       dword ptr [$elbogeia],eax
?live16510@96: ; EBX = &$epbogeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16510@112: ; EBX = &$epbogeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16510@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16510@144: ; 
@1311:
@1297:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1294:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_aes$qv+0
	dd @1294+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_aes$qv	endp
@stk@cpu@cpu_has_aes$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$edcogeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ehcogeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTYE$@stk@cpu@cpu_has_viaaes$qv	segment virtual
	align	2
@@_$ECTYE$@stk@cpu@cpu_has_viaaes$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTYE$@stk@cpu@cpu_has_viaaes$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viaaes$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viaaes$qv	proc	near
?live16512@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @1312
@1313:
	mov       ebx,offset $ehcogeia
	mov       eax,offset @@_$ECTYE$@stk@cpu@cpu_has_viaaes$qv
	call      @__InitExceptBlockLDTC
?live16512@16: ; EBX = &$ehcogeia
	mov       eax,dword ptr [$edcogeia]
	cmp       eax,-1
	je        short @1317
?live16512@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @1315
?live16512@48: ; EBX = &$ehcogeia
@1316:
@1318:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1319:
@1317:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1316
	cmp       dword ptr [ebx],0
	jne       short @1316
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @1322
@1321:
@1323:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1324:
@1322:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1327
	cmp       dword ptr [ebx],0
@1327:
	je        short @1325
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @1328
	cmp       eax,dword ptr [ebp-56]
@1328:
	setne     cl
	and       ecx,1
	jmp short @1326
@1325:
	xor       ecx,ecx
@1326:
	test      cl,cl
	jne       short @1321
	push      0
	push      -1073741823
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-64]
	and       eax,128
	mov       dword ptr [$edcogeia],eax
?live16512@96: ; EBX = &$ehcogeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16512@112: ; EBX = &$ehcogeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16512@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16512@144: ; 
@1329:
@1315:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1312:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_viaaes$qv+0
	dd @1312+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_viaaes$qv	endp
@stk@cpu@cpu_has_viaaes$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$elcogeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$epcogeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTZE$@stk@cpu@cpu_has_viarng$qv	segment virtual
	align	2
@@_$ECTZE$@stk@cpu@cpu_has_viarng$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTZE$@stk@cpu@cpu_has_viarng$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viarng$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viarng$qv	proc	near
?live16514@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @1330
@1331:
	mov       ebx,offset $epcogeia
	mov       eax,offset @@_$ECTZE$@stk@cpu@cpu_has_viarng$qv
	call      @__InitExceptBlockLDTC
?live16514@16: ; EBX = &$epcogeia
	mov       eax,dword ptr [$elcogeia]
	cmp       eax,-1
	je        short @1335
?live16514@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @1333
?live16514@48: ; EBX = &$epcogeia
@1334:
@1336:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1337:
@1335:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1334
	cmp       dword ptr [ebx],0
	jne       short @1334
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @1340
@1339:
@1341:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1342:
@1340:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1345
	cmp       dword ptr [ebx],0
@1345:
	je        short @1343
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @1346
	cmp       eax,dword ptr [ebp-56]
@1346:
	setne     cl
	and       ecx,1
	jmp short @1344
@1343:
	xor       ecx,ecx
@1344:
	test      cl,cl
	jne       short @1339
	push      0
	push      -1073741823
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-64]
	and       eax,8
	mov       dword ptr [$elcogeia],eax
?live16514@96: ; EBX = &$epcogeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16514@112: ; EBX = &$epcogeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16514@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16514@144: ; 
@1347:
@1333:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1330:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_viarng$qv+0
	dd @1330+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_viarng$qv	endp
@stk@cpu@cpu_has_viarng$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eddogeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$ehdogeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTAF$@stk@cpu@cpu_has_viahash$qv	segment virtual
	align	2
@@_$ECTAF$@stk@cpu@cpu_has_viahash$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTAF$@stk@cpu@cpu_has_viahash$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_viahash$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_viahash$qv	proc	near
?live16516@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @1348
@1349:
	mov       ebx,offset $ehdogeia
	mov       eax,offset @@_$ECTAF$@stk@cpu@cpu_has_viahash$qv
	call      @__InitExceptBlockLDTC
?live16516@16: ; EBX = &$ehdogeia
	mov       eax,dword ptr [$eddogeia]
	cmp       eax,-1
	je        short @1353
?live16516@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @1351
?live16516@48: ; EBX = &$ehdogeia
@1352:
@1354:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1355:
@1353:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1352
	cmp       dword ptr [ebx],0
	jne       short @1352
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @1358
@1357:
@1359:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1360:
@1358:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1363
	cmp       dword ptr [ebx],0
@1363:
	je        short @1361
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @1364
	cmp       eax,dword ptr [ebp-56]
@1364:
	setne     cl
	and       ecx,1
	jmp short @1362
@1361:
	xor       ecx,ecx
@1362:
	test      cl,cl
	jne       short @1357
	push      0
	push      -1073741823
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-64]
	and       eax,2048
	mov       dword ptr [$eddogeia],eax
?live16516@96: ; EBX = &$ehdogeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16516@112: ; EBX = &$ehdogeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16516@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16516@144: ; 
@1365:
@1351:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1348:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_viahash$qv+0
	dd @1348+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_viahash$qv	endp
@stk@cpu@cpu_has_viahash$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$eldogeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$epdogeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTBF$@stk@cpu@cpu_has_rdseed$qv	segment virtual
	align	2
@@_$ECTBF$@stk@cpu@cpu_has_rdseed$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTBF$@stk@cpu@cpu_has_rdseed$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_rdseed$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_rdseed$qv	proc	near
?live16518@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @1366
@1367:
	mov       ebx,offset $epdogeia
	mov       eax,offset @@_$ECTBF$@stk@cpu@cpu_has_rdseed$qv
	call      @__InitExceptBlockLDTC
?live16518@16: ; EBX = &$epdogeia
	mov       eax,dword ptr [$eldogeia]
	cmp       eax,-1
	je        short @1371
?live16518@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @1369
?live16518@48: ; EBX = &$epdogeia
@1370:
@1372:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1373:
@1371:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1370
	cmp       dword ptr [ebx],0
	jne       short @1370
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @1376
@1375:
@1377:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1378:
@1376:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1381
	cmp       dword ptr [ebx],0
@1381:
	je        short @1379
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @1382
	cmp       eax,dword ptr [ebp-56]
@1382:
	setne     cl
	and       ecx,1
	jmp short @1380
@1379:
	xor       ecx,ecx
@1380:
	test      cl,cl
	jne       short @1375
	push      0
	push      7
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-80]
	and       eax,262144
	mov       dword ptr [$eldogeia],eax
?live16518@96: ; EBX = &$epdogeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16518@112: ; EBX = &$epdogeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16518@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16518@144: ; 
@1383:
@1369:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1366:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_rdseed$qv+0
	dd @1366+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_rdseed$qv	endp
@stk@cpu@cpu_has_rdseed$qv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$edeogeia	label	dword
	dd	-1
	db	1	dup(?)
	align	4
$eheogeia	label	qword
	db	0,0,0,0,0,0,0,0
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTCF$@stk@cpu@cpu_has_rdrand$qv	segment virtual
	align	2
@@_$ECTCF$@stk@cpu@cpu_has_rdrand$qv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	0
	dw	5
	dd	0
	dd	0
	db	1	dup(?)
@_$ECTCF$@stk@cpu@cpu_has_rdrand$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_has_rdrand$qv	segment virtual
	align	2
@@stk@cpu@cpu_has_rdrand$qv	proc	near
?live16520@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-84
	push      ebx
	mov       dword ptr [ebp-8],offset @1384
@1385:
	mov       ebx,offset $eheogeia
	mov       eax,offset @@_$ECTCF$@stk@cpu@cpu_has_rdrand$qv
	call      @__InitExceptBlockLDTC
?live16520@16: ; EBX = &$eheogeia
	mov       eax,dword ptr [$edeogeia]
	cmp       eax,-1
	je        short @1389
?live16520@32: ; EAX = @temp4
	test      eax,eax
	setne     dl
	and       edx,1
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,edx
	jmp @1387
?live16520@48: ; EBX = &$eheogeia
@1388:
@1390:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1391:
@1389:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1388
	cmp       dword ptr [ebx],0
	jne       short @1388
	call      @@stk@cpu@rdtsc$qv
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	push      8
	push      ebx
	call      _CG_D_EP
	mov       ecx,dword ptr [ebp-56]
	mov       dword ptr [ebx],ecx
	mov       ecx,dword ptr [ebp-52]
	mov       dword ptr [ebx+4],ecx
	jmp short @1394
@1393:
@1395:
	push      0
	push      0
	call      @@stk@time@wait_us$qqsxuj
@1396:
@1394:
	push      8
	push      ebx
	call      _CG_D_EP
	cmp       dword ptr [ebx+4],0
	jne       short @1399
	cmp       dword ptr [ebx],0
@1399:
	je        short @1397
	push      8
	push      ebx
	call      _CG_D_EP
	mov       eax,dword ptr [ebx]
	mov       edx,dword ptr [ebx+4]
	cmp       edx,dword ptr [ebp-52]
	jne       short @1400
	cmp       eax,dword ptr [ebp-56]
@1400:
	setne     cl
	and       ecx,1
	jmp short @1398
@1397:
	xor       ecx,ecx
@1398:
	test      cl,cl
	jne       short @1393
	push      0
	push      1
	lea       eax,dword ptr [ebp-64]
	push      eax
	lea       edx,dword ptr [ebp-72]
	push      edx
	lea       ecx,dword ptr [ebp-80]
	push      ecx
	lea       eax,dword ptr [ebp-88]
	push      eax
	call      @@stk@cpu@cpuidex$qpuit1t1t1uiui
	add       esp,24
	mov       eax,dword ptr [ebp-72]
	and       eax,1073741824
	mov       dword ptr [$edeogeia],eax
?live16520@96: ; EBX = &$eheogeia, EAX = @temp3
	test      eax,eax
	setne     cl
	and       ecx,1
?live16520@112: ; EBX = &$eheogeia, ECX = ret
	push      8
	push      ebx
	call      _CG_D_EP
	mov       dword ptr [ebx],0
	mov       dword ptr [ebx+4],0
?live16520@128: ; ECX = ret
	mov       eax,ecx
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16520@144: ; 
@1401:
@1387:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret 
	align 4        
@1384:
	db	67,71,83,0
	dd @@stk@cpu@cpu_has_rdrand$qv+0
	dd @1384+0
	db	168,255,255,255,8,0,0,0,6,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0,192,255,255,255
	db	4,0,0,0,184,255,255,255,4,0,0,0,176,255,255,255
	db	4,0,0,0,168,255,255,255,4,0,0,0
@@stk@cpu@cpu_has_rdrand$qv	endp
@stk@cpu@cpu_has_rdrand$qv	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_print_info$qv	segment virtual
	align	2
@@stk@cpu@cpu_print_info$qv	proc	near
?live16522@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	push      ebx
	mov       dword ptr [ebp-8],offset @1402
@1403:
	mov       ebx,offset s@
?live16522@16: ; EBX = &s@
	call      @@stk@cpu@cpu_vendor$qv
	push      eax
	push      ebx
	push      91
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+91]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,8
	call      @@stk@cpu@cpu_name$qv
	push      eax
	push      ebx
	push      104
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+104]
	push      edx
	call      @@stk@con@prints$qpxce
	add       esp,8
	push      1
	call      @@stk@cpu@cpu_num_mhz$qo
	pop       ecx
	push      eax
	push      ebx
	push      125
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+125]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,8
	push      0
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1404
	push      ebx
	push      177
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+177]
	push      edx
	push      ebx
	push      175
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+175]
	push      ecx
	push      eax
	push      ebx
	push      150
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+150]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1405
@1404:
	push      ebx
	push      218
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+218]
	push      ecx
	push      ebx
	push      216
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+216]
	push      eax
	push      ebx
	push      205
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+205]
	push      edx
	call      @@stk@con@prints$qpxce
	add       esp,12
@1405:
	push      0
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1406
	push      ebx
	push      273
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+273]
	push      edx
	push      ebx
	push      271
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+271]
	push      ecx
	push      eax
	push      ebx
	push      246
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+246]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1407
@1406:
	push      ebx
	push      319
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+319]
	push      ecx
	push      ebx
	push      317
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+317]
	push      eax
	push      ebx
	push      306
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+306]
	push      edx
	call      @@stk@con@prints$qpxce
	add       esp,12
@1407:
	push      ebx
	push      352
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+352]
	push      ecx
	call      @@stk@con@prints$qpxce
	pop       ecx
	push      1
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1408
	push      ebx
	push      421
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+421]
	push      edx
	push      ebx
	push      419
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+419]
	push      edx
	push      eax
	push      ebx
	push      394
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+394]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1409
@1408:
	push      ebx
	push      462
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+462]
	push      ecx
	push      ebx
	push      460
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+460]
	push      ecx
	push      ebx
	push      449
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+449]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1409:
	push      1
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1410
	push      ebx
	push      517
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+517]
	push      edx
	push      ebx
	push      515
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+515]
	push      edx
	push      eax
	push      ebx
	push      490
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+490]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1411
@1410:
	push      ebx
	push      563
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+563]
	push      ecx
	push      ebx
	push      561
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+561]
	push      ecx
	push      ebx
	push      550
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+550]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1411:
	push      2
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1412
	push      ebx
	push      623
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+623]
	push      edx
	push      ebx
	push      621
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+621]
	push      edx
	push      eax
	push      ebx
	push      596
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+596]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1413
@1412:
	push      ebx
	push      664
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+664]
	push      ecx
	push      ebx
	push      662
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+662]
	push      ecx
	push      ebx
	push      651
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+651]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1413:
	push      2
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1414
	push      ebx
	push      719
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+719]
	push      edx
	push      ebx
	push      717
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+717]
	push      edx
	push      eax
	push      ebx
	push      692
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+692]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1415
@1414:
	push      ebx
	push      765
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+765]
	push      ecx
	push      ebx
	push      763
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+763]
	push      ecx
	push      ebx
	push      752
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+752]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1415:
	push      3
	call      @@stk@cpu@cpu_cache_size$quc
	pop       ecx
	test      eax,eax
	je        short @1416
	push      ebx
	push      825
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+825]
	push      edx
	push      ebx
	push      823
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+823]
	push      edx
	push      eax
	push      ebx
	push      798
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+798]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1417
@1416:
	push      ebx
	push      866
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+866]
	push      ecx
	push      ebx
	push      864
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+864]
	push      ecx
	push      ebx
	push      853
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+853]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1417:
	push      3
	call      @@stk@cpu@cpu_cache_line_size$quc
	pop       ecx
	test      eax,eax
	je        short @1418
	push      ebx
	push      921
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+921]
	push      edx
	push      ebx
	push      919
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+919]
	push      edx
	push      eax
	push      ebx
	push      894
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+894]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1419
@1418:
	push      ebx
	push      967
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+967]
	push      ecx
	push      ebx
	push      965
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+965]
	push      ecx
	push      ebx
	push      954
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+954]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1419:
	call      @@stk@cpu@cpu_num_cores$qv
	test      eax,eax
	je        short @1420
	push      ebx
	push      1027
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1027]
	push      edx
	push      ebx
	push      1025
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1025]
	push      edx
	push      eax
	push      ebx
	push      1000
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1000]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1421
@1420:
	push      ebx
	push      1066
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1066]
	push      ecx
	push      ebx
	push      1064
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1064]
	push      ecx
	push      ebx
	push      1053
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1053]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1421:
	call      @@stk@cpu@cpu_num_threads$qv
	test      eax,eax
	je        short @1422
	push      ebx
	push      1119
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1119]
	push      edx
	push      ebx
	push      1117
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1117]
	push      edx
	push      eax
	push      ebx
	push      1092
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1092]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1423
@1422:
	push      ebx
	push      1160
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1160]
	push      ecx
	push      ebx
	push      1158
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1158]
	push      ecx
	push      ebx
	push      1147
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1147]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1423:
	call      @@stk@cpu@cpu_has_amd64$qv
	and       eax,255
	test      eax,eax
	je        short @1424
	push      ebx
	push      1215
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1215]
	push      edx
	push      ebx
	push      1213
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1213]
	push      ecx
	push      eax
	push      ebx
	push      1188
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1188]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1425
@1424:
	push      ebx
	push      1254
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1254]
	push      eax
	push      ebx
	push      1252
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1252]
	push      edx
	push      ebx
	push      1241
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1241]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
@1425:
	call      @@stk@cpu@cpu_has_ht$qv
	and       eax,255
	test      eax,eax
	je        short @1426
	push      ebx
	push      1307
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1307]
	push      edx
	push      ebx
	push      1305
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1305]
	push      edx
	push      eax
	push      ebx
	push      1280
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1280]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1427
@1426:
	push      ebx
	push      1343
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1343]
	push      ecx
	push      ebx
	push      1341
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1341]
	push      ecx
	push      ebx
	push      1330
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1330]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1427:
	call      @@stk@cpu@cpu_has_mmx$qv
	and       eax,255
	test      eax,eax
	je        short @1428
	push      ebx
	push      1393
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1393]
	push      edx
	push      ebx
	push      1391
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1391]
	push      ecx
	push      eax
	push      ebx
	push      1366
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1366]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1429
@1428:
	push      ebx
	push      1430
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1430]
	push      eax
	push      ebx
	push      1428
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1428]
	push      edx
	push      ebx
	push      1417
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1417]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
@1429:
	call      @@stk@cpu@cpu_has_mmxext$qv
	and       eax,255
	test      eax,eax
	je        short @1430
	push      ebx
	push      1481
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1481]
	push      edx
	push      ebx
	push      1479
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1479]
	push      edx
	push      eax
	push      ebx
	push      1454
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1454]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1431
@1430:
	push      ebx
	push      1521
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1521]
	push      ecx
	push      ebx
	push      1519
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1519]
	push      ecx
	push      ebx
	push      1508
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1508]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1431:
	call      @@stk@cpu@cpu_has_3dnow$qv
	test      eax,eax
	je        short @1432
	push      ebx
	push      1575
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1575]
	push      edx
	push      ebx
	push      1573
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1573]
	push      edx
	push      eax
	push      ebx
	push      1548
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1548]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1433
@1432:
	push      ebx
	push      1614
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1614]
	push      ecx
	push      ebx
	push      1612
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1612]
	push      ecx
	push      ebx
	push      1601
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1601]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1433:
	call      @@stk@cpu@cpu_has_3dnowprefetch$qv
	and       eax,255
	test      eax,eax
	je        short @1434
	push      ebx
	push      1667
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1667]
	push      edx
	push      ebx
	push      1665
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1665]
	push      ecx
	push      eax
	push      ebx
	push      1640
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1640]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1435
@1434:
	push      ebx
	push      1714
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1714]
	push      eax
	push      ebx
	push      1712
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1712]
	push      edx
	push      ebx
	push      1701
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1701]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
@1435:
	call      @@stk@cpu@cpu_has_fxsr$qv
	and       eax,255
	test      eax,eax
	je        short @1436
	push      ebx
	push      1775
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1775]
	push      edx
	push      ebx
	push      1773
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1773]
	push      edx
	push      eax
	push      ebx
	push      1748
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1748]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1437
@1436:
	push      ebx
	push      1813
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1813]
	push      ecx
	push      ebx
	push      1811
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1811]
	push      ecx
	push      ebx
	push      1800
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1800]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1437:
	call      @@stk@cpu@cpu_has_sse$qv
	test      eax,eax
	je        short @1438
	push      ebx
	push      1865
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1865]
	push      edx
	push      ebx
	push      1863
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1863]
	push      edx
	push      eax
	push      ebx
	push      1838
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1838]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1439
@1438:
	push      ebx
	push      1902
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1902]
	push      ecx
	push      ebx
	push      1900
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1900]
	push      ecx
	push      ebx
	push      1889
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1889]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1439:
	call      @@stk@cpu@cpu_has_xsave$qv
	and       eax,255
	test      eax,eax
	je        short @1440
	push      ebx
	push      1953
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1953]
	push      edx
	push      ebx
	push      1951
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1951]
	push      ecx
	push      eax
	push      ebx
	push      1926
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1926]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1441
@1440:
	push      ebx
	push      1992
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1992]
	push      eax
	push      ebx
	push      1990
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1990]
	push      edx
	push      ebx
	push      1979
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1979]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
@1441:
	call      @@stk@cpu@cpu_has_pclmulqdq$qv
	and       eax,255
	test      eax,eax
	je        short @1442
	push      ebx
	push      2045
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+2045]
	push      edx
	push      ebx
	push      2043
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+2043]
	push      edx
	push      eax
	push      ebx
	push      2018
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+2018]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1443
@1442:
	push      ebx
	push      2088
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2088]
	push      ecx
	push      ebx
	push      2086
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2086]
	push      ecx
	push      ebx
	push      2075
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+2075]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1443:
	call      @@stk@cpu@cpu_has_movbe$qv
	and       eax,255
	test      eax,eax
	je        short @1444
	push      ebx
	push      2145
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+2145]
	push      edx
	push      ebx
	push      2143
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2143]
	push      ecx
	push      eax
	push      ebx
	push      2118
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2118]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1445
@1444:
	push      ebx
	push      2184
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+2184]
	push      eax
	push      ebx
	push      2182
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+2182]
	push      edx
	push      ebx
	push      2171
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2171]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
@1445:
	call      @@stk@cpu@cpu_has_fma$qv
	test      eax,eax
	je        short @1446
	push      ebx
	push      2237
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+2237]
	push      edx
	push      ebx
	push      2235
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+2235]
	push      edx
	push      eax
	push      ebx
	push      2210
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+2210]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1447
@1446:
	push      ebx
	push      2274
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2274]
	push      ecx
	push      ebx
	push      2272
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2272]
	push      ecx
	push      ebx
	push      2261
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+2261]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1447:
	call      @@stk@cpu@cpu_has_popcnt$qv
	and       eax,255
	test      eax,eax
	je        short @1448
	push      ebx
	push      2325
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+2325]
	push      edx
	push      ebx
	push      2323
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2323]
	push      ecx
	push      eax
	push      ebx
	push      2298
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2298]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1449
@1448:
	push      ebx
	push      2365
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+2365]
	push      eax
	push      ebx
	push      2363
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+2363]
	push      edx
	push      ebx
	push      2352
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2352]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
@1449:
	call      @@stk@cpu@cpu_has_xop$qv
	and       eax,255
	test      eax,eax
	je        short @1450
	push      ebx
	push      2419
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+2419]
	push      edx
	push      ebx
	push      2417
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+2417]
	push      edx
	push      eax
	push      ebx
	push      2392
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+2392]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1451
@1450:
	push      ebx
	push      2456
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2456]
	push      ecx
	push      ebx
	push      2454
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2454]
	push      ecx
	push      ebx
	push      2443
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+2443]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1451:
	call      @@stk@cpu@cpu_has_lzcnt$qv
	and       eax,255
	test      eax,eax
	je        short @1452
	push      ebx
	push      2507
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+2507]
	push      edx
	push      ebx
	push      2505
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2505]
	push      ecx
	push      eax
	push      ebx
	push      2480
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2480]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1453
@1452:
	push      ebx
	push      2546
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+2546]
	push      eax
	push      ebx
	push      2544
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+2544]
	push      edx
	push      ebx
	push      2533
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2533]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
@1453:
	call      @@stk@cpu@cpu_has_f16c$qv
	and       eax,255
	test      eax,eax
	je        short @1454
	push      ebx
	push      2599
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+2599]
	push      edx
	push      ebx
	push      2597
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+2597]
	push      edx
	push      eax
	push      ebx
	push      2572
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+2572]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1455
@1454:
	push      ebx
	push      2637
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2637]
	push      ecx
	push      ebx
	push      2635
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2635]
	push      ecx
	push      ebx
	push      2624
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+2624]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1455:
	call      @@stk@cpu@cpu_has_avx$qv
	test      eax,eax
	je        short @1456
	push      ebx
	push      2689
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+2689]
	push      edx
	push      ebx
	push      2687
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+2687]
	push      edx
	push      eax
	push      ebx
	push      2662
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+2662]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1457
@1456:
	push      ebx
	push      2726
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2726]
	push      ecx
	push      ebx
	push      2724
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2724]
	push      ecx
	push      ebx
	push      2713
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+2713]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1457:
	call      @@stk@cpu@cpu_has_avx512f$qv
	and       eax,255
	test      eax,eax
	je        short @1458
	push      ebx
	push      2777
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+2777]
	push      edx
	push      ebx
	push      2775
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2775]
	push      ecx
	push      eax
	push      ebx
	push      2750
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2750]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1459
@1458:
	push      ebx
	push      2818
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+2818]
	push      eax
	push      ebx
	push      2816
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+2816]
	push      edx
	push      ebx
	push      2805
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2805]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
@1459:
	call      @@stk@cpu@cpu_has_avx512bw$qv
	and       eax,255
	test      eax,eax
	je        short @1460
	push      ebx
	push      2873
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+2873]
	push      edx
	push      ebx
	push      2871
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+2871]
	push      edx
	push      eax
	push      ebx
	push      2846
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+2846]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1461
@1460:
	push      ebx
	push      2915
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2915]
	push      ecx
	push      ebx
	push      2913
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2913]
	push      ecx
	push      ebx
	push      2902
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+2902]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1461:
	call      @@stk@cpu@cpu_has_avx512cd$qv
	and       eax,255
	test      eax,eax
	je        short @1462
	push      ebx
	push      2971
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+2971]
	push      edx
	push      ebx
	push      2969
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2969]
	push      ecx
	push      eax
	push      ebx
	push      2944
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+2944]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1463
@1462:
	push      ebx
	push      3013
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+3013]
	push      eax
	push      ebx
	push      3011
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+3011]
	push      edx
	push      ebx
	push      3000
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3000]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
@1463:
	call      @@stk@cpu@cpu_has_avx512dq$qv
	and       eax,255
	test      eax,eax
	je        short @1464
	push      ebx
	push      3069
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+3069]
	push      edx
	push      ebx
	push      3067
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+3067]
	push      edx
	push      eax
	push      ebx
	push      3042
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+3042]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1465
@1464:
	push      ebx
	push      3111
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3111]
	push      ecx
	push      ebx
	push      3109
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3109]
	push      ecx
	push      ebx
	push      3098
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+3098]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1465:
	call      @@stk@cpu@cpu_has_avx512er$qv
	and       eax,255
	test      eax,eax
	je        short @1466
	push      ebx
	push      3167
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+3167]
	push      edx
	push      ebx
	push      3165
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3165]
	push      ecx
	push      eax
	push      ebx
	push      3140
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3140]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1467
@1466:
	push      ebx
	push      3209
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+3209]
	push      eax
	push      ebx
	push      3207
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+3207]
	push      edx
	push      ebx
	push      3196
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3196]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
@1467:
	call      @@stk@cpu@cpu_has_avx512pf$qv
	and       eax,255
	test      eax,eax
	je        short @1468
	push      ebx
	push      3265
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+3265]
	push      edx
	push      ebx
	push      3263
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+3263]
	push      edx
	push      eax
	push      ebx
	push      3238
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+3238]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1469
@1468:
	push      ebx
	push      3307
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3307]
	push      ecx
	push      ebx
	push      3305
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3305]
	push      ecx
	push      ebx
	push      3294
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+3294]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1469:
	call      @@stk@cpu@cpu_has_avx512vl$qv
	and       eax,255
	test      eax,eax
	je        short @1470
	push      ebx
	push      3363
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+3363]
	push      edx
	push      ebx
	push      3361
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3361]
	push      ecx
	push      eax
	push      ebx
	push      3336
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3336]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1471
@1470:
	push      ebx
	push      3405
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+3405]
	push      eax
	push      ebx
	push      3403
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+3403]
	push      edx
	push      ebx
	push      3392
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3392]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
@1471:
	call      @@stk@cpu@cpu_has_avx512ifma$qv
	and       eax,255
	test      eax,eax
	je        short @1472
	push      ebx
	push      3461
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+3461]
	push      edx
	push      ebx
	push      3459
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+3459]
	push      edx
	push      eax
	push      ebx
	push      3434
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+3434]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1473
@1472:
	push      ebx
	push      3505
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3505]
	push      ecx
	push      ebx
	push      3503
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3503]
	push      ecx
	push      ebx
	push      3492
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+3492]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1473:
	call      @@stk@cpu@cpu_has_bmi$qv
	test      eax,eax
	je        short @1474
	push      ebx
	push      3563
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+3563]
	push      edx
	push      ebx
	push      3561
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+3561]
	push      edx
	push      eax
	push      ebx
	push      3536
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+3536]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1475
@1474:
	push      ebx
	push      3600
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3600]
	push      ecx
	push      ebx
	push      3598
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3598]
	push      ecx
	push      ebx
	push      3587
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+3587]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1475:
	call      @@stk@cpu@cpu_has_avx512vbmi$qv
	and       eax,255
	test      eax,eax
	je        short @1476
	push      ebx
	push      3651
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+3651]
	push      edx
	push      ebx
	push      3649
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3649]
	push      ecx
	push      eax
	push      ebx
	push      3624
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3624]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1477
@1476:
	push      ebx
	push      3695
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+3695]
	push      eax
	push      ebx
	push      3693
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+3693]
	push      edx
	push      ebx
	push      3682
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3682]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
@1477:
	call      @@stk@cpu@cpu_has_cmov$qv
	and       eax,255
	test      eax,eax
	je        short @1478
	push      ebx
	push      3753
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+3753]
	push      edx
	push      ebx
	push      3751
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+3751]
	push      edx
	push      eax
	push      ebx
	push      3726
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+3726]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1479
@1478:
	push      ebx
	push      3791
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3791]
	push      ecx
	push      ebx
	push      3789
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3789]
	push      ecx
	push      ebx
	push      3778
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+3778]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1479:
	call      @@stk@cpu@cpu_has_cmpxchg$qv
	test      eax,eax
	je        short @1480
	push      ebx
	push      3843
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+3843]
	push      edx
	push      ebx
	push      3841
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+3841]
	push      edx
	push      eax
	push      ebx
	push      3816
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+3816]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1481
@1480:
	push      ebx
	push      3884
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3884]
	push      ecx
	push      ebx
	push      3882
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3882]
	push      ecx
	push      ebx
	push      3871
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+3871]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1481:
	call      @@stk@cpu@cpu_has_clmul$qv
	and       eax,255
	test      eax,eax
	je        short @1482
	push      ebx
	push      3939
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+3939]
	push      edx
	push      ebx
	push      3937
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3937]
	push      ecx
	push      eax
	push      ebx
	push      3912
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3912]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1483
@1482:
	push      ebx
	push      3978
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+3978]
	push      eax
	push      ebx
	push      3976
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+3976]
	push      edx
	push      ebx
	push      3965
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+3965]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
@1483:
	call      @@stk@cpu@cpu_has_aes$qv
	and       eax,255
	test      eax,eax
	je        short @1484
	push      ebx
	push      4031
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+4031]
	push      edx
	push      ebx
	push      4029
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+4029]
	push      edx
	push      eax
	push      ebx
	push      4004
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+4004]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1485
@1484:
	push      ebx
	push      4068
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4068]
	push      ecx
	push      ebx
	push      4066
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4066]
	push      ecx
	push      ebx
	push      4055
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+4055]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1485:
	call      @@stk@cpu@cpu_has_sha$qv
	and       eax,255
	test      eax,eax
	je        short @1486
	push      ebx
	push      4119
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+4119]
	push      edx
	push      ebx
	push      4117
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4117]
	push      ecx
	push      eax
	push      ebx
	push      4092
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4092]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1487
@1486:
	push      ebx
	push      4156
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+4156]
	push      eax
	push      ebx
	push      4154
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+4154]
	push      edx
	push      ebx
	push      4143
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4143]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
@1487:
	call      @@stk@cpu@cpu_has_rdrand$qv
	and       eax,255
	test      eax,eax
	je        short @1488
	push      ebx
	push      4207
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+4207]
	push      edx
	push      ebx
	push      4205
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+4205]
	push      edx
	push      eax
	push      ebx
	push      4180
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+4180]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1489
@1488:
	push      ebx
	push      4247
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4247]
	push      ecx
	push      ebx
	push      4245
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4245]
	push      ecx
	push      ebx
	push      4234
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+4234]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1489:
	call      @@stk@cpu@cpu_has_rdseed$qv
	and       eax,255
	test      eax,eax
	je        short @1490
	push      ebx
	push      4301
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+4301]
	push      edx
	push      ebx
	push      4299
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4299]
	push      ecx
	push      eax
	push      ebx
	push      4274
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4274]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1491
@1490:
	push      ebx
	push      4341
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+4341]
	push      eax
	push      ebx
	push      4339
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+4339]
	push      edx
	push      ebx
	push      4328
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4328]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
@1491:
	call      @@stk@cpu@cpu_has_tsc$qv
	and       eax,255
	test      eax,eax
	je        short @1492
	push      ebx
	push      4395
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+4395]
	push      edx
	push      ebx
	push      4393
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+4393]
	push      edx
	push      eax
	push      ebx
	push      4368
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+4368]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1493
@1492:
	push      ebx
	push      4432
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4432]
	push      ecx
	push      ebx
	push      4430
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4430]
	push      ecx
	push      ebx
	push      4419
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+4419]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1493:
	call      @@stk@cpu@cpu_has_perftsc$qv
	and       eax,255
	test      eax,eax
	je        short @1494
	push      ebx
	push      4483
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+4483]
	push      edx
	push      ebx
	push      4481
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4481]
	push      ecx
	push      eax
	push      ebx
	push      4456
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4456]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1495
@1494:
	push      ebx
	push      4524
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+4524]
	push      eax
	push      ebx
	push      4522
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+4522]
	push      edx
	push      ebx
	push      4511
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4511]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
@1495:
	call      @@stk@cpu@cpu_has_erms$qv
	and       eax,255
	test      eax,eax
	je        short @1496
	push      ebx
	push      4579
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+4579]
	push      edx
	push      ebx
	push      4577
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+4577]
	push      edx
	push      eax
	push      ebx
	push      4552
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+4552]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1497
@1496:
	push      ebx
	push      4617
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4617]
	push      ecx
	push      ebx
	push      4615
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4615]
	push      ecx
	push      ebx
	push      4604
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+4604]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1497:
	call      @@stk@cpu@cpu_has_msr$qv
	and       eax,255
	test      eax,eax
	je        short @1498
	push      ebx
	push      4669
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+4669]
	push      edx
	push      ebx
	push      4667
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4667]
	push      ecx
	push      eax
	push      ebx
	push      4642
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4642]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1499
@1498:
	push      ebx
	push      4706
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+4706]
	push      eax
	push      ebx
	push      4704
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+4704]
	push      edx
	push      ebx
	push      4693
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4693]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
@1499:
	call      @@stk@cpu@cpu_has_mtrr$qv
	and       eax,255
	test      eax,eax
	je        short @1500
	push      ebx
	push      4757
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+4757]
	push      edx
	push      ebx
	push      4755
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+4755]
	push      edx
	push      eax
	push      ebx
	push      4730
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+4730]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1501
@1500:
	push      ebx
	push      4795
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4795]
	push      ecx
	push      ebx
	push      4793
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4793]
	push      ecx
	push      ebx
	push      4782
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+4782]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
@1501:
	call      @@stk@cpu@cpu_has_vmx$qv
	and       eax,255
	test      eax,eax
	je        short @1502
	push      ebx
	push      4847
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+4847]
	push      edx
	push      ebx
	push      4845
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4845]
	push      ecx
	push      eax
	push      ebx
	push      4820
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+4820]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,16
	jmp short @1503
@1502:
	push      ebx
	push      4884
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+4884]
	push      edx
	push      ebx
	push      4882
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+4882]
	push      ecx
	push      ebx
	push      4871
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+4871]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
?live16522@880: ; 
@1503:
@1504:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@1402:
	db	67,71,83,0
	dd @@stk@cpu@cpu_print_info$qv+0
	dd @1402+0
	db	248,255,255,255,8,0,0,0,0,0,0,0
@@stk@cpu@cpu_print_info$qv	endp
@stk@cpu@cpu_print_info$qv	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_test$qv	segment virtual
	align	2
@@stk@cpu@cpu_test$qv	proc	near
?live16523@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @1505
@1506:
	call      @@stk@cpu@cpu_print_info$qv
@1507:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@1505:
	db	67,71,83,0
	dd @@stk@cpu@cpu_test$qv+0
	dd @1505+0
	db	248,255,255,255,8,0,0,0,0,0,0,0
_INIT_	segment word public use32 'INITDATA'
_INIT_	ends
@@stk@cpu@cpu_test$qv	endp
@stk@cpu@cpu_test$qv	ends
_TEXT	ends
_INIT_	segment word public use32 'INITDATA'
	db	0
	db	32
	dd	@_STCON0_$qv
_INIT_	ends
_TEXT	segment dword public use32 'CODE'
@stk@cpu@cpu_test$qv	segment virtual
@stk@cpu@cpu_test$qv	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
	align	4
@_STCON0_$qv	proc	near
@@_STCON0_$qv equ @_STCON0_$qv
?live1@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @1508
@1509:
	call      @@stk@cpu@tsc_init$qv
	mov       dword ptr [_tsc_ADJ],eax
	mov       dword ptr [_tsc_ADJ+4],edx
@1510:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@1508:
	db	67,71,83,0
	dd @_STCON0_$qv+0
	dd @1508+0
	db	248,255,255,255,8,0,0,0,0,0,0,0
@_STCON0_$qv	endp
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	2
s@	label	byte
	;	s@+0:
	db	"Unsupported",0,0
	;	s@+13:
	db	"GenuineIntel",0
	;	s@+26:
	db	"AuthenticAMD",0
	;	s@+39:
	db	"GenuineIntel",0
	;	s@+52:
	db	"AuthenticAMD",0
	;	s@+65:
	db	"GenuineIntel",0
	;	s@+78:
	db	"AuthenticAMD",0
	;	s@+91:
	db	"Vendor ",34
	;	s@+99:
	db	"%s",34,10,0
	;	s@+104:
	db	"Processor name ",34
	;	s@+120:
	db	"%s",34,10,0
	;	s@+125:
	db	"CPU Core Clock is %dMhz",10,0
	;	s@+150:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+175:
	db	" ",0
	;	s@+177:
	db	"stk::cpu::cpu_cache_size(0)",0
	;	s@+205:
	db	"NOT%21s%s",10,0
	;	s@+216:
	db	" ",0
	;	s@+218:
	db	"stk::cpu::cpu_cache_size(0)",0
	;	s@+246:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+271:
	db	" ",0
	;	s@+273:
	db	"stk::cpu::cpu_cache_line_size(0)",0
	;	s@+306:
	db	"NOT%21s%s",10,0
	;	s@+317:
	db	" ",0
	;	s@+319:
	db	"stk::cpu::cpu_cache_line_size(0)",0
	;	s@+352:
	db	"Cache L1i, uOPS cache etc. = cache L0 :)",10,0
	;	s@+394:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+419:
	db	" ",0
	;	s@+421:
	db	"stk::cpu::cpu_cache_size(1)",0
	;	s@+449:
	db	"NOT%21s%s",10,0
	;	s@+460:
	db	" ",0
	;	s@+462:
	db	"stk::cpu::cpu_cache_size(1)",0
	;	s@+490:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+515:
	db	" ",0
	;	s@+517:
	db	"stk::cpu::cpu_cache_line_size(1)",0
	;	s@+550:
	db	"NOT%21s%s",10,0
	;	s@+561:
	db	" ",0
	;	s@+563:
	db	"stk::cpu::cpu_cache_line_size(1)",0
	;	s@+596:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+621:
	db	" ",0
	;	s@+623:
	db	"stk::cpu::cpu_cache_size(2)",0
	;	s@+651:
	db	"NOT%21s%s",10,0
	;	s@+662:
	db	" ",0
	;	s@+664:
	db	"stk::cpu::cpu_cache_size(2)",0
	;	s@+692:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+717:
	db	" ",0
	;	s@+719:
	db	"stk::cpu::cpu_cache_line_size(2)",0
	;	s@+752:
	db	"NOT%21s%s",10,0
	;	s@+763:
	db	" ",0
	;	s@+765:
	db	"stk::cpu::cpu_cache_line_size(2)",0
	;	s@+798:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+823:
	db	" ",0
	;	s@+825:
	db	"stk::cpu::cpu_cache_size(3)",0
	;	s@+853:
	db	"NOT%21s%s",10,0
	;	s@+864:
	db	" ",0
	;	s@+866:
	db	"stk::cpu::cpu_cache_size(3)",0
	;	s@+894:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+919:
	db	" ",0
	;	s@+921:
	db	"stk::cpu::cpu_cache_line_size(3)",0
	;	s@+954:
	db	"NOT%21s%s",10,0
	;	s@+965:
	db	" ",0
	;	s@+967:
	db	"stk::cpu::cpu_cache_line_size(3)",0
	;	s@+1000:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+1025:
	db	" ",0
	;	s@+1027:
	db	"stk::cpu::cpu_num_cores()",0
	;	s@+1053:
	db	"NOT%21s%s",10,0
	;	s@+1064:
	db	" ",0
	;	s@+1066:
	db	"stk::cpu::cpu_num_cores()",0
	;	s@+1092:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+1117:
	db	" ",0
	;	s@+1119:
	db	"stk::cpu::cpu_num_threads()",0
	;	s@+1147:
	db	"NOT%21s%s",10,0
	;	s@+1158:
	db	" ",0
	;	s@+1160:
	db	"stk::cpu::cpu_num_threads()",0
	;	s@+1188:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+1213:
	db	" ",0
	;	s@+1215:
	db	"stk::cpu::cpu_has_amd64()",0
	;	s@+1241:
	db	"NOT%21s%s",10,0
	;	s@+1252:
	db	" ",0
	;	s@+1254:
	db	"stk::cpu::cpu_has_amd64()",0
	;	s@+1280:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+1305:
	db	" ",0
	;	s@+1307:
	db	"stk::cpu::cpu_has_ht()",0
	;	s@+1330:
	db	"NOT%21s%s",10,0
	;	s@+1341:
	db	" ",0
	;	s@+1343:
	db	"stk::cpu::cpu_has_ht()",0
	;	s@+1366:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+1391:
	db	" ",0
	;	s@+1393:
	db	"stk::cpu::cpu_has_mmx()",0
	;	s@+1417:
	db	"NOT%21s%s",10,0
	;	s@+1428:
	db	" ",0
	;	s@+1430:
	db	"stk::cpu::cpu_has_mmx()",0
	;	s@+1454:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+1479:
	db	" ",0
	;	s@+1481:
	db	"stk::cpu::cpu_has_mmxext()",0
	;	s@+1508:
	db	"NOT%21s%s",10,0
	;	s@+1519:
	db	" ",0
	;	s@+1521:
	db	"stk::cpu::cpu_has_mmxext()",0
	;	s@+1548:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+1573:
	db	" ",0
	;	s@+1575:
	db	"stk::cpu::cpu_has_3dnow()",0
	;	s@+1601:
	db	"NOT%21s%s",10,0
	;	s@+1612:
	db	" ",0
	;	s@+1614:
	db	"stk::cpu::cpu_has_3dnow()",0
	;	s@+1640:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+1665:
	db	" ",0
	;	s@+1667:
	db	"stk::cpu::cpu_has_3dnowprefetch()",0
	;	s@+1701:
	db	"NOT%21s%s",10,0
	;	s@+1712:
	db	" ",0
	;	s@+1714:
	db	"stk::cpu::cpu_has_3dnowprefetch()",0
	;	s@+1748:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+1773:
	db	" ",0
	;	s@+1775:
	db	"stk::cpu::cpu_has_fxsr()",0
	;	s@+1800:
	db	"NOT%21s%s",10,0
	;	s@+1811:
	db	" ",0
	;	s@+1813:
	db	"stk::cpu::cpu_has_fxsr()",0
	;	s@+1838:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+1863:
	db	" ",0
	;	s@+1865:
	db	"stk::cpu::cpu_has_sse()",0
	;	s@+1889:
	db	"NOT%21s%s",10,0
	;	s@+1900:
	db	" ",0
	;	s@+1902:
	db	"stk::cpu::cpu_has_sse()",0
	;	s@+1926:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+1951:
	db	" ",0
	;	s@+1953:
	db	"stk::cpu::cpu_has_xsave()",0
	;	s@+1979:
	db	"NOT%21s%s",10,0
	;	s@+1990:
	db	" ",0
	;	s@+1992:
	db	"stk::cpu::cpu_has_xsave()",0
	;	s@+2018:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+2043:
	db	" ",0
	;	s@+2045:
	db	"stk::cpu::cpu_has_pclmulqdq()",0
	;	s@+2075:
	db	"NOT%21s%s",10,0
	;	s@+2086:
	db	" ",0
	;	s@+2088:
	db	"stk::cpu::cpu_has_pclmulqdq()",0
	;	s@+2118:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+2143:
	db	" ",0
	;	s@+2145:
	db	"stk::cpu::cpu_has_movbe()",0
	;	s@+2171:
	db	"NOT%21s%s",10,0
	;	s@+2182:
	db	" ",0
	;	s@+2184:
	db	"stk::cpu::cpu_has_movbe()",0
	;	s@+2210:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+2235:
	db	" ",0
	;	s@+2237:
	db	"stk::cpu::cpu_has_fma()",0
	;	s@+2261:
	db	"NOT%21s%s",10,0
	;	s@+2272:
	db	" ",0
	;	s@+2274:
	db	"stk::cpu::cpu_has_fma()",0
	;	s@+2298:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+2323:
	db	" ",0
	;	s@+2325:
	db	"stk::cpu::cpu_has_popcnt()",0
	;	s@+2352:
	db	"NOT%21s%s",10,0
	;	s@+2363:
	db	" ",0
	;	s@+2365:
	db	"stk::cpu::cpu_has_popcnt()",0
	;	s@+2392:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+2417:
	db	" ",0
	;	s@+2419:
	db	"stk::cpu::cpu_has_xop()",0
	;	s@+2443:
	db	"NOT%21s%s",10,0
	;	s@+2454:
	db	" ",0
	;	s@+2456:
	db	"stk::cpu::cpu_has_xop()",0
	;	s@+2480:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+2505:
	db	" ",0
	;	s@+2507:
	db	"stk::cpu::cpu_has_lzcnt()",0
	;	s@+2533:
	db	"NOT%21s%s",10,0
	;	s@+2544:
	db	" ",0
	;	s@+2546:
	db	"stk::cpu::cpu_has_lzcnt()",0
	;	s@+2572:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+2597:
	db	" ",0
	;	s@+2599:
	db	"stk::cpu::cpu_has_f16c()",0
	;	s@+2624:
	db	"NOT%21s%s",10,0
	;	s@+2635:
	db	" ",0
	;	s@+2637:
	db	"stk::cpu::cpu_has_f16c()",0
	;	s@+2662:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+2687:
	db	" ",0
	;	s@+2689:
	db	"stk::cpu::cpu_has_avx()",0
	;	s@+2713:
	db	"NOT%21s%s",10,0
	;	s@+2724:
	db	" ",0
	;	s@+2726:
	db	"stk::cpu::cpu_has_avx()",0
	;	s@+2750:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+2775:
	db	" ",0
	;	s@+2777:
	db	"stk::cpu::cpu_has_avx512f()",0
	;	s@+2805:
	db	"NOT%21s%s",10,0
	;	s@+2816:
	db	" ",0
	;	s@+2818:
	db	"stk::cpu::cpu_has_avx512f()",0
	;	s@+2846:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+2871:
	db	" ",0
	;	s@+2873:
	db	"stk::cpu::cpu_has_avx512bw()",0
	;	s@+2902:
	db	"NOT%21s%s",10,0
	;	s@+2913:
	db	" ",0
	;	s@+2915:
	db	"stk::cpu::cpu_has_avx512bw()",0
	;	s@+2944:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+2969:
	db	" ",0
	;	s@+2971:
	db	"stk::cpu::cpu_has_avx512cd()",0
	;	s@+3000:
	db	"NOT%21s%s",10,0
	;	s@+3011:
	db	" ",0
	;	s@+3013:
	db	"stk::cpu::cpu_has_avx512cd()",0
	;	s@+3042:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+3067:
	db	" ",0
	;	s@+3069:
	db	"stk::cpu::cpu_has_avx512dq()",0
	;	s@+3098:
	db	"NOT%21s%s",10,0
	;	s@+3109:
	db	" ",0
	;	s@+3111:
	db	"stk::cpu::cpu_has_avx512dq()",0
	;	s@+3140:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+3165:
	db	" ",0
	;	s@+3167:
	db	"stk::cpu::cpu_has_avx512er()",0
	;	s@+3196:
	db	"NOT%21s%s",10,0
	;	s@+3207:
	db	" ",0
	;	s@+3209:
	db	"stk::cpu::cpu_has_avx512er()",0
	;	s@+3238:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+3263:
	db	" ",0
	;	s@+3265:
	db	"stk::cpu::cpu_has_avx512pf()",0
	;	s@+3294:
	db	"NOT%21s%s",10,0
	;	s@+3305:
	db	" ",0
	;	s@+3307:
	db	"stk::cpu::cpu_has_avx512pf()",0
	;	s@+3336:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+3361:
	db	" ",0
	;	s@+3363:
	db	"stk::cpu::cpu_has_avx512vl()",0
	;	s@+3392:
	db	"NOT%21s%s",10,0
	;	s@+3403:
	db	" ",0
	;	s@+3405:
	db	"stk::cpu::cpu_has_avx512vl()",0
	;	s@+3434:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+3459:
	db	" ",0
	;	s@+3461:
	db	"stk::cpu::cpu_has_avx512ifma()",0
	;	s@+3492:
	db	"NOT%21s%s",10,0
	;	s@+3503:
	db	" ",0
	;	s@+3505:
	db	"stk::cpu::cpu_has_avx512ifma()",0
	;	s@+3536:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+3561:
	db	" ",0
	;	s@+3563:
	db	"stk::cpu::cpu_has_bmi()",0
	;	s@+3587:
	db	"NOT%21s%s",10,0
	;	s@+3598:
	db	" ",0
	;	s@+3600:
	db	"stk::cpu::cpu_has_bmi()",0
	;	s@+3624:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+3649:
	db	" ",0
	;	s@+3651:
	db	"stk::cpu::cpu_has_avx512vbmi()",0
	;	s@+3682:
	db	"NOT%21s%s",10,0
	;	s@+3693:
	db	" ",0
	;	s@+3695:
	db	"stk::cpu::cpu_has_avx512vbmi()",0
	;	s@+3726:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+3751:
	db	" ",0
	;	s@+3753:
	db	"stk::cpu::cpu_has_cmov()",0
	;	s@+3778:
	db	"NOT%21s%s",10,0
	;	s@+3789:
	db	" ",0
	;	s@+3791:
	db	"stk::cpu::cpu_has_cmov()",0
	;	s@+3816:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+3841:
	db	" ",0
	;	s@+3843:
	db	"stk::cpu::cpu_has_cmpxchg()",0
	;	s@+3871:
	db	"NOT%21s%s",10,0
	;	s@+3882:
	db	" ",0
	;	s@+3884:
	db	"stk::cpu::cpu_has_cmpxchg()",0
	;	s@+3912:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+3937:
	db	" ",0
	;	s@+3939:
	db	"stk::cpu::cpu_has_clmul()",0
	;	s@+3965:
	db	"NOT%21s%s",10,0
	;	s@+3976:
	db	" ",0
	;	s@+3978:
	db	"stk::cpu::cpu_has_clmul()",0
	;	s@+4004:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+4029:
	db	" ",0
	;	s@+4031:
	db	"stk::cpu::cpu_has_aes()",0
	;	s@+4055:
	db	"NOT%21s%s",10,0
	;	s@+4066:
	db	" ",0
	;	s@+4068:
	db	"stk::cpu::cpu_has_aes()",0
	;	s@+4092:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+4117:
	db	" ",0
	;	s@+4119:
	db	"stk::cpu::cpu_has_sha()",0
	;	s@+4143:
	db	"NOT%21s%s",10,0
	;	s@+4154:
	db	" ",0
	;	s@+4156:
	db	"stk::cpu::cpu_has_sha()",0
	;	s@+4180:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+4205:
	db	" ",0
	;	s@+4207:
	db	"stk::cpu::cpu_has_rdrand()",0
	;	s@+4234:
	db	"NOT%21s%s",10,0
	;	s@+4245:
	db	" ",0
	;	s@+4247:
	db	"stk::cpu::cpu_has_rdrand()",0
	;	s@+4274:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+4299:
	db	" ",0
	;	s@+4301:
	db	"stk::cpu::cpu_has_rdseed()",0
	;	s@+4328:
	db	"NOT%21s%s",10,0
	;	s@+4339:
	db	" ",0
	;	s@+4341:
	db	"stk::cpu::cpu_has_rdseed()",0
	;	s@+4368:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+4393:
	db	" ",0
	;	s@+4395:
	db	"stk::cpu::cpu_has_tsc()",0
	;	s@+4419:
	db	"NOT%21s%s",10,0
	;	s@+4430:
	db	" ",0
	;	s@+4432:
	db	"stk::cpu::cpu_has_tsc()",0
	;	s@+4456:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+4481:
	db	" ",0
	;	s@+4483:
	db	"stk::cpu::cpu_has_perftsc()",0
	;	s@+4511:
	db	"NOT%21s%s",10,0
	;	s@+4522:
	db	" ",0
	;	s@+4524:
	db	"stk::cpu::cpu_has_perftsc()",0
	;	s@+4552:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+4577:
	db	" ",0
	;	s@+4579:
	db	"stk::cpu::cpu_has_erms()",0
	;	s@+4604:
	db	"NOT%21s%s",10,0
	;	s@+4615:
	db	" ",0
	;	s@+4617:
	db	"stk::cpu::cpu_has_erms()",0
	;	s@+4642:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+4667:
	db	" ",0
	;	s@+4669:
	db	"stk::cpu::cpu_has_msr()",0
	;	s@+4693:
	db	"NOT%21s%s",10,0
	;	s@+4704:
	db	" ",0
	;	s@+4706:
	db	"stk::cpu::cpu_has_msr()",0
	;	s@+4730:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+4755:
	db	" ",0
	;	s@+4757:
	db	"stk::cpu::cpu_has_mtrr()",0
	;	s@+4782:
	db	"NOT%21s%s",10,0
	;	s@+4793:
	db	" ",0
	;	s@+4795:
	db	"stk::cpu::cpu_has_mtrr()",0
	;	s@+4820:
	db	"[SUPPORTED=%02d]%-10s%s",10,0
	;	s@+4845:
	db	" ",0
	;	s@+4847:
	db	"stk::cpu::cpu_has_vmx()",0
	;	s@+4871:
	db	"NOT%21s%s",10,0
	;	s@+4882:
	db	" ",0
	;	s@+4884:
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
	dd	$eebmgeia
	dd	8
	dd	4
	dd	$epbmgeia
	dd	8
	dd	4
	dd	$edcmgeia
	dd	8
	dd	4
	dd	$ehcmgeia
	dd	8
	dd	4
	dd	$elcmgeia
	dd	8
	dd	4
	dd	$epcmgeia
	dd	8
	dd	4
	dd	$eddmgeia
	dd	8
	dd	4
	dd	$eodmgeia
	dd	4
	dd	4
	dd	$ecemgeia
	dd	4
	dd	4
	dd	$egemgeia
	dd	4
	dd	4
	dd	$ekemgeia
	dd	4
	dd	4
	dd	$eoemgeia
	dd	4
	dd	4
	dd	$ecfmgeia
	dd	4
	dd	4
	dd	$egfmgeia
	dd	8
	dd	4
	dd	$ekfmgeia
	dd	16
	dd	4
	dd	$eofmgeia
	dd	8
	dd	4
	dd	$ejgmgeia
	dd	52
	dd	4
	dd	$engmgeia
	dd	8
	dd	4
	dd	$eihmgeia
	dd	4
	dd	4
	dd	$emhmgeia
	dd	8
	dd	4
	dd	$eaimgeia
	dd	4
	dd	4
	dd	$eeimgeia
	dd	8
	dd	4
	dd	$eiimgeia
	dd	4
	dd	4
	dd	$emimgeia
	dd	8
	dd	4
	dd	$eajmgeia
	dd	4
	dd	4
	dd	$eejmgeia
	dd	8
	dd	4
	dd	$eijmgeia
	dd	4
	dd	4
	dd	$emjmgeia
	dd	8
	dd	4
	dd	$ehkmgeia
	dd	4
	dd	4
	dd	$elkmgeia
	dd	8
	dd	4
	dd	$epkmgeia
	dd	4
	dd	4
	dd	$edlmgeia
	dd	8
	dd	4
	dd	$ehlmgeia
	dd	4
	dd	4
	dd	$ellmgeia
	dd	8
	dd	4
	dd	$eplmgeia
	dd	4
	dd	4
	dd	$edmmgeia
	dd	8
	dd	4
	dd	$ehmmgeia
	dd	4
	dd	4
	dd	$elmmgeia
	dd	8
	dd	4
	dd	$epmmgeia
	dd	4
	dd	4
	dd	$ednmgeia
	dd	8
	dd	4
	dd	$ehnmgeia
	dd	4
	dd	4
	dd	$elnmgeia
	dd	8
	dd	4
	dd	$epnmgeia
	dd	4
	dd	4
	dd	$edomgeia
	dd	8
	dd	4
	dd	$ehomgeia
	dd	4
	dd	4
	dd	$elomgeia
	dd	8
	dd	4
	dd	$epomgeia
	dd	4
	dd	4
	dd	$edpmgeia
	dd	8
	dd	4
	dd	$ehpmgeia
	dd	4
	dd	4
	dd	$elpmgeia
	dd	8
	dd	4
	dd	$eppmgeia
	dd	4
	dd	4
	dd	$edangeia
	dd	8
	dd	4
	dd	$ehangeia
	dd	4
	dd	4
	dd	$elangeia
	dd	8
	dd	4
	dd	$epangeia
	dd	4
	dd	4
	dd	$edbngeia
	dd	8
	dd	4
	dd	$ehbngeia
	dd	4
	dd	4
	dd	$elbngeia
	dd	8
	dd	4
	dd	$epbngeia
	dd	4
	dd	4
	dd	$edcngeia
	dd	8
	dd	4
	dd	$ehcngeia
	dd	4
	dd	4
	dd	$elcngeia
	dd	8
	dd	4
	dd	$epcngeia
	dd	4
	dd	4
	dd	$eddngeia
	dd	8
	dd	4
	dd	$ehdngeia
	dd	4
	dd	4
	dd	$eldngeia
	dd	8
	dd	4
	dd	$epdngeia
	dd	4
	dd	4
	dd	$edengeia
	dd	8
	dd	4
	dd	$ehengeia
	dd	4
	dd	4
	dd	$elengeia
	dd	8
	dd	4
	dd	$epengeia
	dd	4
	dd	4
	dd	$edfngeia
	dd	8
	dd	4
	dd	$ehfngeia
	dd	4
	dd	4
	dd	$elfngeia
	dd	8
	dd	4
	dd	$epfngeia
	dd	4
	dd	4
	dd	$edgngeia
	dd	8
	dd	4
	dd	$ehgngeia
	dd	4
	dd	4
	dd	$elgngeia
	dd	8
	dd	4
	dd	$epgngeia
	dd	4
	dd	4
	dd	$edhngeia
	dd	8
	dd	4
	dd	$ehhngeia
	dd	4
	dd	4
	dd	$elhngeia
	dd	8
	dd	4
	dd	$ephngeia
	dd	4
	dd	4
	dd	$edingeia
	dd	8
	dd	4
	dd	$ehingeia
	dd	4
	dd	4
	dd	$elingeia
	dd	8
	dd	4
	dd	$epingeia
	dd	4
	dd	4
	dd	$edjngeia
	dd	8
	dd	4
	dd	$ehjngeia
	dd	4
	dd	4
	dd	$eljngeia
	dd	8
	dd	4
	dd	$epjngeia
	dd	4
	dd	4
	dd	$edkngeia
	dd	8
	dd	4
	dd	$ehkngeia
	dd	4
	dd	4
	dd	$elkngeia
	dd	8
	dd	4
	dd	$epkngeia
	dd	4
	dd	4
	dd	$edlngeia
	dd	8
	dd	4
	dd	$ehlngeia
	dd	4
	dd	4
	dd	$ellngeia
	dd	8
	dd	4
	dd	$eplngeia
	dd	4
	dd	4
	dd	$edmngeia
	dd	8
	dd	4
	dd	$ehmngeia
	dd	4
	dd	4
	dd	$elmngeia
	dd	8
	dd	4
	dd	$epmngeia
	dd	4
	dd	4
	dd	$ednngeia
	dd	8
	dd	4
	dd	$ehnngeia
	dd	4
	dd	4
	dd	$elnngeia
	dd	8
	dd	4
	dd	$epnngeia
	dd	4
	dd	4
	dd	$edongeia
	dd	8
	dd	4
	dd	$ehongeia
	dd	4
	dd	4
	dd	$elongeia
	dd	8
	dd	4
	dd	$epongeia
	dd	4
	dd	4
	dd	$edpngeia
	dd	8
	dd	4
	dd	$ehpngeia
	dd	4
	dd	4
	dd	$elpngeia
	dd	8
	dd	4
	dd	$eppngeia
	dd	4
	dd	4
	dd	$edaogeia
	dd	8
	dd	4
	dd	$ehaogeia
	dd	4
	dd	4
	dd	$elaogeia
	dd	12
	dd	4
	dd	$epaogeia
	dd	8
	dd	4
	dd	$edbogeia
	dd	4
	dd	4
	dd	$ehbogeia
	dd	8
	dd	4
	dd	$elbogeia
	dd	4
	dd	4
	dd	$epbogeia
	dd	8
	dd	4
	dd	$edcogeia
	dd	4
	dd	4
	dd	$ehcogeia
	dd	8
	dd	4
	dd	$elcogeia
	dd	4
	dd	4
	dd	$epcogeia
	dd	8
	dd	4
	dd	$eddogeia
	dd	4
	dd	4
	dd	$ehdogeia
	dd	8
	dd	4
	dd	$eldogeia
	dd	4
	dd	4
	dd	$epdogeia
	dd	8
	dd	4
	dd	$edeogeia
	dd	4
	dd	4
	dd	$eheogeia
	dd	8
	dd	2
	dd	s@
	dd	4908
	dd	2
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
@@stk@time@wait_us$qqsxuj equ @stk@time@wait_us$qqsxuj
 extrn @stk@time@wait_us$qqsxuj:near
 extrn __Exception_list:dword
 extrn @__InitExceptBlockLDTC:near
 extrn _CG_D_EP:near
 extrn _CG_DA_EPY:near
 extrn _CG_A_BP:near
@@stk@mem@mov$qqspvpxvxui equ @stk@mem@mov$qqspvpxvxui
 extrn @stk@mem@mov$qqspvpxvxui:near
@@stk@cstr@trim$qqspcc equ @stk@cstr@trim$qqspcc
 extrn @stk@cstr@trim$qqspcc:near
 extrn _CG_GDA_EGY:near
@@stk@mem@cmp$qqspxvt1xui equ @stk@mem@cmp$qqspxvt1xui
 extrn @stk@mem@cmp$qqspxvt1xui:near
@@stk@time@time_ms$qqsv equ @stk@time@time_ms$qqsv
 extrn @stk@time@time_ms$qqsv:near
 extrn __llmul:near
 extrn __lludiv:near
 extrn _CG_LDA_EOXSY:near
@@stk@con@prints$qpxce equ @stk@con@prints$qpxce
 extrn @stk@con@prints$qpxce:near
 extrn _CG_A_PY:near
 extrn _CG_DESC:near
	?debug	D "cpu\stk_cpu.h" 22131 31182
	?debug	D "cpu\.\..\io\./../stk_main.h" 20746 22139
	?debug	D "cpu\.\..\io\stk_console.h" 20752 24368
	?debug	D "cpu\.\..\time\stk_time.h" 20752 24369
	?debug	D "cpu\.\..\stasm\stk_stasm.h" 22124 33532
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\_lim.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\limits.h" 18794 3808
	?debug	D "cpu\.\..\threads\./../cpu/./../stk_main.h" 20746 22139
	?debug	D "cpu\.\..\threads\./../cpu/stk_cpu.h" 22131 31182
	?debug	D "cpu\.\..\threads\./../time/stk_time.h" 20752 24369
	?debug	D "cpu\.\..\threads\./../stk_main.h" 20746 22139
	?debug	D "cpu\.\..\threads\stk_threads.h" 20752 24369
	?debug	D "cpu\.\..\text\stk_cstr_utils.h" 20752 25015
	?debug	D "cpu\.\..\mem\./.././stasm/./../stk_main.h" 20746 22139
	?debug	D "cpu\.\..\mem\./.././stasm/stk_stasm.h" 22124 33532
	?debug	D "cpu\.\..\mem\./.././text/./../mem/stk_mem.h" 20752 24368
	?debug	D "cpu\.\..\mem\./.././text/./../stk_main.h" 20746 22139
	?debug	D "cpu\.\..\mem\./.././text/stk_cstr_utils.h" 20752 25015
	?debug	D "cpu\.\..\mem\./.././time/./../stk_main.h" 20746 22139
	?debug	D "cpu\.\..\mem\./.././time/stk_time.h" 20752 24369
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\sys/stat.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\sys/types.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\fcntl.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\stdio.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\time.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\assert.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\errno.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\search.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\stdlib.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\tchar.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\dir.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\direct.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\_nfile.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\stdint.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\io.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\conio.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\qos.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\inaddr.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\ws2def.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\ime_cmodes.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\imm.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\mcx.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\winsvc.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\stralign.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\wnnc.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\winnetwk.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\reason.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\winreg.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\verrsrc.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\winver.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\consoleapi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\wincon.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\stringapiset.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\datetimeapi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\winnls.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\tvout.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\winuser.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\pshpack1.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\wingdi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\timezoneapi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\winerror.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\realtimeapiset.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\securityappcontainer.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\processtopologyapi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\systemtopologyapi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\namespaceapi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\securitybaseapi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\libloaderapi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\wow64apiset.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\jobapi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\threadpoolapiset.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\threadpoollegacyapiset.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\memoryapi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\sysinfoapi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\processthreadsapi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\interlockedapi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\synchapi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\ioapiset.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\heapapi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\profileapi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\namedpipeapi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\fibersapi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\errhandlingapi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\handleapi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\utilapiset.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\debugapi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\fileapi.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\processenv.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\minwinbase.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\apisetcconv.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\winbase.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\ktmtypes.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\apiset.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\pshpack8.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\pshpack2.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\poppack.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\pshpack4.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\_loc.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\locale.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\_str.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\string.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\guiddef.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\basetsd.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\kernelspecs.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\mbctype.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\ctype.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\winnt.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\no_sal2.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\sdv_driverspecs.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\driverspecs.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\specstrings_strict.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\ConcurrencySal.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\sal.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\specstrings.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\minwindef.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\windef.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\stdarg.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\excpt.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\_null.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\_defs.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\_stddef.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\mem.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\sdkddkver.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\windows.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\winpackagefamily.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\winapifamily.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\sdk\winsock2.h" 18794 3808
	?debug	D "cpu\.\..\mem\./../stk_main.h" 20746 22139
	?debug	D "cpu\.\..\mem\stk_mem.h" 20752 24368
	?debug	D "cpu\stk_cpu.cpp" 22141 31082
	end
