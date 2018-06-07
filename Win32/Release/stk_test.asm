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
	?debug	S "stk_test.cpp"
	?debug	T "stk_test.cpp"
_TEXT	segment dword public use32 'CODE'
_TEXT	ends
_DATA	segment dword public use32 'DATA'
_DATA	ends
_BSS	segment dword public use32 'BSS'
_BSS	ends
DGROUP	group	_BSS,_DATA
_DATA	segment dword public use32 'DATA'
@std@%codecvt$cci%@id	segment virtual
	align	2
@@std@%codecvt$cci%@id	label	byte
	db	4	dup(?)
	db	1	dup(?)
@std@%codecvt$cci%@id	ends
_DATA	ends
_DATA	segment dword public use32 'DATA'
@std@%numpunct$c%@id	segment virtual
	align	2
@@std@%numpunct$c%@id	label	byte
	db	4	dup(?)
	db	1	dup(?)
@std@%numpunct$c%@id	ends
_DATA	ends
_DATA	segment dword public use32 'DATA'
@std@%num_get$c48std@%istreambuf_iterator$c19std@%char_traits$c%%%@id	segment virtual
	align	2
@@std@%num_get$c48std@%istreambuf_iterator$c19std@%char_traits$c%%%@id	label	byte
	db	4	dup(?)
	db	1	dup(?)
@std@%num_get$c48std@%istreambuf_iterator$c19std@%char_traits$c%%%@id	ends
_DATA	ends
_DATA	segment dword public use32 'DATA'
@std@%num_put$c48std@%ostreambuf_iterator$c19std@%char_traits$c%%%@id	segment virtual
	align	2
@@std@%num_put$c48std@%ostreambuf_iterator$c19std@%char_traits$c%%%@id	label	byte
	db	4	dup(?)
	db	1	dup(?)
@std@%num_put$c48std@%ostreambuf_iterator$c19std@%char_traits$c%%%@id	ends
_DATA	ends
_DATA	segment dword public use32 'DATA'
@std@%numpunct$b%@id	segment virtual
	align	2
@@std@%numpunct$b%@id	label	byte
	db	4	dup(?)
	db	1	dup(?)
@std@%numpunct$b%@id	ends
_DATA	ends
_DATA	segment dword public use32 'DATA'
@std@%num_get$b48std@%istreambuf_iterator$b19std@%char_traits$b%%%@id	segment virtual
	align	2
@@std@%num_get$b48std@%istreambuf_iterator$b19std@%char_traits$b%%%@id	label	byte
	db	4	dup(?)
	db	1	dup(?)
@std@%num_get$b48std@%istreambuf_iterator$b19std@%char_traits$b%%%@id	ends
_DATA	ends
_DATA	segment dword public use32 'DATA'
@std@%num_put$b48std@%ostreambuf_iterator$b19std@%char_traits$b%%%@id	segment virtual
	align	2
@@std@%num_put$b48std@%ostreambuf_iterator$b19std@%char_traits$b%%%@id	label	byte
	db	4	dup(?)
	db	1	dup(?)
@std@%num_put$b48std@%ostreambuf_iterator$b19std@%char_traits$b%%%@id	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@test_ConsolePrintHandler$qqspxc	segment virtual
	align	2
@@test_ConsolePrintHandler$qqspxc	proc	near
?live16420@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @1
@2:
	mov       eax,offset __streams
	add       eax,24
	push      offset __streams
	push      eax
	call      _CG_A_BP
	push      eax
	mov       edx,dword ptr [ebp+8]
	push      edx
	call      @_fputs
	add       esp,8
@3:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret       4
	align 4        
@1:
	db	67,71,83,0
	dd @@test_ConsolePrintHandler$qqspxc+0
	dd @1+0
	db	248,255,255,255,12,0,0,0,1,0,0,0,8,0,0,0
	db	4,0,0,0
@@test_ConsolePrintHandler$qqspxc	endp
@test_ConsolePrintHandler$qqspxc	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@test_ConsoleGetchHandler$qqsv	segment virtual
	align	2
@@test_ConsoleGetchHandler$qqsv	proc	near
?live16421@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @4
@5:
	call      @_getchar
@7:
@6:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@4:
	db	67,71,83,0
	dd @@test_ConsoleGetchHandler$qqsv+0
	dd @4+0
	db	248,255,255,255,8,0,0,0,0,0,0,0
@@test_ConsoleGetchHandler$qqsv	endp
@test_ConsoleGetchHandler$qqsv	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@test@stk_atexit$qv	segment virtual
	align	2
@@stk@test@stk_atexit$qv	proc	near
?live16422@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @8
@9:
	push      offset s@+2
	call      @_system
	pop       ecx
@10:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@8:
	db	67,71,83,0
	dd @@stk@test@stk_atexit$qv+0
	dd @8+0
	db	248,255,255,255,8,0,0,0,0,0,0,0
@@stk@test@stk_atexit$qv	endp
@stk@test@stk_atexit$qv	ends
_TEXT	ends
_BSS	segment dword public use32 'BSS'
	align	4
@stk@test@i	label	dword
	db	4	dup(?)
	db	1	dup(?)
_BSS	ends
_TEXT	segment dword public use32 'CODE'
@stk@test@start_test$qqsippc	segment virtual
	align	2
@@stk@test@start_test$qqsippc	proc	near
?live16423@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-636
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @11+16
@12:
	mov       ebx,offset s@
?live16423@16: ; EBX = &s@
	xor       edi,edi
?live16423@32: ; EBX = &s@, EDI = argl
	xor       esi,esi
	cmp       esi,dword ptr [ebp+8]
	jge       short @14
@13:
	mov       eax,dword ptr [ebp+12]
	push      4
	push      eax
	push      esi
	push      2
	push      0
	call      _CG_DA_EPXSY
	mov       edx,dword ptr [eax+4*esi]
	push      edx
	call      @@stk@cstr@len$qqspxc
	add       eax,edi
	mov       edi,eax
	inc       esi
	cmp       esi,dword ptr [ebp+8]
	jl        short @13
@14:
	lea       esi,dword ptr [edi+1]
	push      esi
	call      @@stk@mem@alloc$qqsxui
	mov       dword ptr [ebp-16],eax
?live16423@64: ; EBX = &s@
	xor       esi,esi
	cmp       esi,dword ptr [ebp+8]
	jge       short @17
@16:
	mov       eax,dword ptr [ebp+12]
	push      4
	push      eax
	push      esi
	push      2
	push      0
	call      _CG_DA_EPXSY
	mov       edx,dword ptr [eax+4*esi]
	push      edx
	mov       ecx,dword ptr [ebp-16]
	push      ecx
	call      @@stk@cstr@cat$qqspcpxc
	inc       esi
	cmp       esi,dword ptr [ebp+8]
	jl        short @16
@17:
	mov       ecx,dword ptr [ebp-16]
	push      1
	push      ecx
	push      0
	call      _CG_DA_EPY
	mov       byte ptr [ecx],0
	push      offset @@stk@test@stk_atexit$qv
	call      @_atexit
	pop       ecx
	push      ebx
	push      8
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+8]
	push      eax
	call      @_system
	pop       ecx
	xor       edx,edx
	mov       dword ptr [ebp-24],edx
	push      0
	push      offset @@test_ConsolePrintHandler$qqspxc
	push      offset @@test_ConsoleGetchHandler$qqsv
	call      @@stk@con@set_console_handlers$qqspqqsv$cpqqspxc$vt2
	push      ebx
	push      16
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+16]
	push      ecx
	call      @@stk@con@prints$qpxce
	pop       ecx
	call      @@stk@cpu@tsc_init$qv
	mov       dword ptr [ebp-36],200000000
	mov       dword ptr [ebp-32],0
	mov       dword ptr [ebp-60],10000
	mov       dword ptr [ebp-56],0
	mov       eax,dword ptr [ebp-36]
	mov       edi,eax
	push      edi
	call      @@stk@cstr@alloc$qqsui
	mov       esi,eax
	push      edi
	call      @@stk@cstr@alloc$qqsui
	mov       dword ptr [ebp-120],0
	mov       dword ptr [ebp-116],0
	mov       edi,eax
	jmp @20
@19:
@21:
	push      0
	push      65536
	mov       eax,dword ptr [ebp-120]
	mov       edx,dword ptr [ebp-116]
	call      __llumod
	cmp       edx,0
	jne       short @22
	cmp       eax,0
	jne       short @22
@24:
	call      @_clock
	push      eax
	call      @_srand
	pop       ecx
@25:
@22:
	call      @_rand
	mov       ecx,eax
	mov       eax,dword ptr [ebp-120]
	push      1
	push      esi
	push      eax
	push      0
	push      0
	call      _CG_DA_EPXSY
	mov       byte ptr [esi+eax],cl
	mov       eax,dword ptr [ebp-120]
	push      1
	push      esi
	push      eax
	push      0
	push      0
	call      _CG_DA_EPXSY
	cmp       byte ptr [esi+eax],0
	jne       short @26
	mov       eax,dword ptr [ebp-120]
	push      1
	push      esi
	push      eax
	push      0
	push      0
	call      _CG_DA_EPXSY
	mov       byte ptr [esi+eax],90
	jmp short @27
@26:
	mov       eax,dword ptr [ebp-120]
	push      1
	push      esi
	push      eax
	push      0
	push      0
	call      _CG_DA_EPXSY
	movsx     edx,byte ptr [esi+eax]
	cmp       edx,65
	jne       short @28
	mov       eax,dword ptr [ebp-120]
	push      1
	push      esi
	push      eax
	push      0
	push      0
	call      _CG_DA_EPXSY
	mov       byte ptr [esi+eax],90
@28:
@27:
@29:
	add       dword ptr [ebp-120],1
	adc       dword ptr [ebp-116],0
@20:
	mov       eax,dword ptr [ebp-120]
	mov       edx,dword ptr [ebp-116]
	cmp       edx,dword ptr [ebp-32]
	jne       short @31
	cmp       eax,dword ptr [ebp-36]
@31:
	jb        @19
	mov       eax,dword ptr [ebp-36]
	push      1
	push      esi
	push      eax
	push      0
	push      -1
	call      _CG_DA_EPXSY
	mov       byte ptr [esi+eax-1],0
	mov       eax,dword ptr [ebp-36]
	mov       edx,dword ptr [ebp-32]
	shrd      eax,edx,1
	shr       edx,1
	push      1
	push      esi
	push      eax
	push      0
	push      0
	call      _CG_DA_EPXSY
	mov       byte ptr [esi+eax],90
?live16423@192: ; EBX = &s@, ESI = test_in, EDI = test_out
	push      0
	push      1024
	push      0
	push      1024
	mov       eax,dword ptr [ebp-36]
	mov       edx,dword ptr [ebp-32]
	call      __lludiv
	call      __lludiv
	push      edx
	push      eax
	push      ebx
	push      41
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+41]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
	push      dword ptr [ebp-56]
	push      dword ptr [ebp-60]
	push      ebx
	push      65
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+65]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,12
	push      ebx
	push      117
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+117]
	push      edx
	call      @@stk@con@prints$qpxce
	pop       ecx
	push      ebx
	push      133
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+133]
	push      ecx
	call      @@stk@con@prints$qpxce
	pop       ecx
	push      ebx
	push      156
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+156]
	push      eax
	call      @@stk@con@prints$qpxce
	pop       ecx
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-72],eax
	mov       dword ptr [ebp-68],edx
	call      @@stk@cpu@tsc_start$qv
	call      @@stk@cpu@cpu_test$qv
	call      @@stk@cpu@tsc_checkpoint$qv
	call      @@stk@time@time_ms$qqsv
	sub       eax,dword ptr [ebp-72]
	sbb       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-72],eax
	mov       dword ptr [ebp-68],edx
	push      dword ptr [ebp-68]
	push      dword ptr [ebp-72]
	push      ebx
	push      168
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+168]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
	cmp       dword ptr [ebp-68],0
	jne       short @33
	cmp       dword ptr [ebp-72],0
@33:
	je        short @32
	push      dword ptr [ebp-32]
	push      dword ptr [ebp-36]
	mov       eax,1000
	xor       edx,edx
	call      __llmul
	mov       dword ptr [ebp-236],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-232],edx
	fild      qword ptr [ebp-236]
	fadd      qword ptr [@11]
	fdiv      dword ptr [@11+8]
	mov       eax,dword ptr [ebp-72]
	mov       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-248],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-244],edx
	fild      qword ptr [ebp-248]
	fadd      qword ptr [@11]
	fdivp      st(1),st
	fstp      qword ptr [ebp-96]
	jmp short @34
@32:
	xor       ecx,ecx
	mov       dword ptr [ebp-96],ecx
	mov       dword ptr [ebp-92],ecx
@34:
	push      dword ptr [ebp-92]
	push      dword ptr [ebp-96]
	push      dword ptr [ebp-32]
	push      dword ptr [ebp-36]
	push      ebx
	push      180
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+180]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,20
	fld       qword ptr [ebp-96]
	fmul      dword ptr [@11+12]
	call      __ftol
	movsx     eax,al
	mov       ecx,1000
	cdq
	idiv      ecx
	push      eax
	push      ebx
	push      211
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+211]
	push      ecx
	call      @@stk@con@printr$qpxcxc
	add       esp,8
	push      ebx
	push      213
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+213]
	push      eax
	call      @@stk@con@prints$qpxce
	pop       ecx
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-84],eax
	mov       dword ptr [ebp-80],edx
	cmp       dword ptr [ebp-68],0
	jne       short @36
	cmp       dword ptr [ebp-72],0
@36:
	je        short @35
	mov       eax,dword ptr [ebp-84]
	mov       edx,dword ptr [ebp-80]
	mov       dword ptr [ebp-260],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-256],edx
	fild      qword ptr [ebp-260]
	fadd      qword ptr [@11]
	mov       eax,dword ptr [ebp-72]
	mov       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-272],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-268],edx
	fild      qword ptr [ebp-272]
	fadd      qword ptr [@11]
	fdivp      st(1),st
	fstp      qword ptr [ebp-108]
	jmp short @37
@35:
	xor       ecx,ecx
	mov       dword ptr [ebp-108],ecx
	mov       dword ptr [ebp-104],ecx
@37:
	push      dword ptr [ebp-104]
	push      dword ptr [ebp-108]
	push      dword ptr [ebp-80]
	push      dword ptr [ebp-84]
	push      ebx
	push      215
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+215]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,20
	push      134
	push      ebx
	push      263
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+263]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,8
	push      1
	call      @@stk@hash@crc32@test_CRC32$qqso
	test      al,al
	je        short @38
	push      ebx
	push      271
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+271]
	push      edx
	call      @@stk@con@prints$qpxce
	pop       ecx
@38:
	push      136
	push      ebx
	push      281
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+281]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,8
	push      ebx
	push      289
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+289]
	push      eax
	call      @@stk@con@prints$qpxce
	pop       ecx
	push      ebx
	push      341
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+341]
	push      edx
	call      @@stk@con@prints$qpxce
	pop       ecx
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-72],eax
	mov       dword ptr [ebp-68],edx
	call      @@stk@cpu@tsc_start$qv
	push      0
	mov       eax,dword ptr [ebp-36]
	push      eax
	push      esi
	call      @@stk@hash@crc32@calc_CRC32$qqspxvxuixui
	call      @@stk@cpu@tsc_checkpoint$qv
	call      @@stk@time@time_ms$qqsv
	sub       eax,dword ptr [ebp-72]
	sbb       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-72],eax
	mov       dword ptr [ebp-68],edx
	push      dword ptr [ebp-68]
	push      dword ptr [ebp-72]
	push      ebx
	push      353
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+353]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
	cmp       dword ptr [ebp-68],0
	jne       short @40
	cmp       dword ptr [ebp-72],0
@40:
	je        short @39
	push      dword ptr [ebp-32]
	push      dword ptr [ebp-36]
	mov       eax,1000
	xor       edx,edx
	call      __llmul
	mov       dword ptr [ebp-284],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-280],edx
	fild      qword ptr [ebp-284]
	fadd      qword ptr [@11]
	fdiv      dword ptr [@11+8]
	mov       eax,dword ptr [ebp-72]
	mov       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-296],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-292],edx
	fild      qword ptr [ebp-296]
	fadd      qword ptr [@11]
	fdivp      st(1),st
	fstp      qword ptr [ebp-96]
	jmp short @41
@39:
	xor       ecx,ecx
	mov       dword ptr [ebp-96],ecx
	mov       dword ptr [ebp-92],ecx
@41:
	push      dword ptr [ebp-92]
	push      dword ptr [ebp-96]
	push      dword ptr [ebp-32]
	push      dword ptr [ebp-36]
	push      ebx
	push      365
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+365]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,20
	fld       qword ptr [ebp-96]
	fmul      dword ptr [@11+12]
	call      __ftol
	movsx     eax,al
	mov       ecx,1000
	cdq
	idiv      ecx
	push      eax
	push      ebx
	push      396
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+396]
	push      ecx
	call      @@stk@con@printr$qpxcxc
	add       esp,8
	push      ebx
	push      398
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+398]
	push      eax
	call      @@stk@con@prints$qpxce
	pop       ecx
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-84],eax
	mov       dword ptr [ebp-80],edx
	cmp       dword ptr [ebp-68],0
	jne       short @43
	cmp       dword ptr [ebp-72],0
@43:
	je        short @42
	mov       eax,dword ptr [ebp-84]
	mov       edx,dword ptr [ebp-80]
	mov       dword ptr [ebp-308],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-304],edx
	fild      qword ptr [ebp-308]
	fadd      qword ptr [@11]
	mov       eax,dword ptr [ebp-72]
	mov       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-320],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-316],edx
	fild      qword ptr [ebp-320]
	fadd      qword ptr [@11]
	fdivp      st(1),st
	fstp      qword ptr [ebp-108]
	jmp short @44
@42:
	xor       ecx,ecx
	mov       dword ptr [ebp-108],ecx
	mov       dword ptr [ebp-104],ecx
@44:
	push      dword ptr [ebp-104]
	push      dword ptr [ebp-108]
	push      dword ptr [ebp-80]
	push      dword ptr [ebp-84]
	push      ebx
	push      400
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+400]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,20
	push      138
	push      ebx
	push      448
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+448]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,8
	push      ebx
	push      456
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+456]
	push      edx
	call      @@stk@con@prints$qpxce
	pop       ecx
	push      ebx
	push      516
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+516]
	push      ecx
	call      @@stk@con@prints$qpxce
	pop       ecx
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-72],eax
	mov       dword ptr [ebp-68],edx
	call      @@stk@cpu@tsc_start$qv
	push      0
	mov       eax,dword ptr [ebp-36]
	push      eax
	push      esi
	call      @@stk@hash@crc32@calc_CRC32_bitwise$qqspxvxuixui
	call      @@stk@cpu@tsc_checkpoint$qv
	call      @@stk@time@time_ms$qqsv
	sub       eax,dword ptr [ebp-72]
	sbb       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-72],eax
	mov       dword ptr [ebp-68],edx
	push      dword ptr [ebp-68]
	push      dword ptr [ebp-72]
	push      ebx
	push      528
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+528]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
	cmp       dword ptr [ebp-68],0
	jne       short @46
	cmp       dword ptr [ebp-72],0
@46:
	je        short @45
	push      dword ptr [ebp-32]
	push      dword ptr [ebp-36]
	mov       eax,1000
	xor       edx,edx
	call      __llmul
	mov       dword ptr [ebp-332],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-328],edx
	fild      qword ptr [ebp-332]
	fadd      qword ptr [@11]
	fdiv      dword ptr [@11+8]
	mov       eax,dword ptr [ebp-72]
	mov       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-344],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-340],edx
	fild      qword ptr [ebp-344]
	fadd      qword ptr [@11]
	fdivp      st(1),st
	fstp      qword ptr [ebp-96]
	jmp short @47
@45:
	xor       ecx,ecx
	mov       dword ptr [ebp-96],ecx
	mov       dword ptr [ebp-92],ecx
@47:
	push      dword ptr [ebp-92]
	push      dword ptr [ebp-96]
	push      dword ptr [ebp-32]
	push      dword ptr [ebp-36]
	push      ebx
	push      540
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+540]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,20
	fld       qword ptr [ebp-96]
	fmul      dword ptr [@11+12]
	call      __ftol
	movsx     eax,al
	mov       ecx,1000
	cdq
	idiv      ecx
	push      eax
	push      ebx
	push      571
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+571]
	push      ecx
	call      @@stk@con@printr$qpxcxc
	add       esp,8
	push      ebx
	push      573
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+573]
	push      eax
	call      @@stk@con@prints$qpxce
	pop       ecx
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-84],eax
	mov       dword ptr [ebp-80],edx
	cmp       dword ptr [ebp-68],0
	jne       short @49
	cmp       dword ptr [ebp-72],0
@49:
	je        short @48
	mov       eax,dword ptr [ebp-84]
	mov       edx,dword ptr [ebp-80]
	mov       dword ptr [ebp-356],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-352],edx
	fild      qword ptr [ebp-356]
	fadd      qword ptr [@11]
	mov       eax,dword ptr [ebp-72]
	mov       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-368],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-364],edx
	fild      qword ptr [ebp-368]
	fadd      qword ptr [@11]
	fdivp      st(1),st
	fstp      qword ptr [ebp-108]
	jmp short @50
@48:
	xor       ecx,ecx
	mov       dword ptr [ebp-108],ecx
	mov       dword ptr [ebp-104],ecx
@50:
	push      dword ptr [ebp-104]
	push      dword ptr [ebp-108]
	push      dword ptr [ebp-80]
	push      dword ptr [ebp-84]
	push      ebx
	push      575
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+575]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,20
	push      140
	push      ebx
	push      623
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+623]
	push      eax
	call      @@stk@con@prints$qpxce
	add       esp,8
	push      ebx
	push      631
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+631]
	push      edx
	call      @@stk@con@prints$qpxce
	pop       ecx
	push      ebx
	push      685
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+685]
	push      ecx
	call      @@stk@con@prints$qpxce
	pop       ecx
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-72],eax
	mov       dword ptr [ebp-68],edx
	call      @@stk@cpu@tsc_start$qv
	mov       eax,dword ptr [ebp-36]
	push      eax
	push      esi
	call      @@stk@hash@adler32@calc_ADLER32$qqspxvxui
	call      @@stk@cpu@tsc_checkpoint$qv
	call      @@stk@time@time_ms$qqsv
	sub       eax,dword ptr [ebp-72]
	sbb       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-72],eax
	mov       dword ptr [ebp-68],edx
	push      dword ptr [ebp-68]
	push      dword ptr [ebp-72]
	push      ebx
	push      697
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+697]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
	cmp       dword ptr [ebp-68],0
	jne       short @52
	cmp       dword ptr [ebp-72],0
@52:
	je        short @51
	push      dword ptr [ebp-32]
	push      dword ptr [ebp-36]
	mov       eax,1000
	xor       edx,edx
	call      __llmul
	mov       dword ptr [ebp-380],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-376],edx
	fild      qword ptr [ebp-380]
	fadd      qword ptr [@11]
	fdiv      dword ptr [@11+8]
	mov       eax,dword ptr [ebp-72]
	mov       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-392],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-388],edx
	fild      qword ptr [ebp-392]
	fadd      qword ptr [@11]
	fdivp      st(1),st
	fstp      qword ptr [ebp-96]
	jmp short @53
@51:
	xor       ecx,ecx
	mov       dword ptr [ebp-96],ecx
	mov       dword ptr [ebp-92],ecx
@53:
	push      dword ptr [ebp-92]
	push      dword ptr [ebp-96]
	push      dword ptr [ebp-32]
	push      dword ptr [ebp-36]
	push      ebx
	push      709
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+709]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,20
	fld       qword ptr [ebp-96]
	fmul      dword ptr [@11+12]
	call      __ftol
	movsx     eax,al
	mov       ecx,1000
	cdq
	idiv      ecx
	push      eax
	push      ebx
	push      740
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+740]
	push      ecx
	call      @@stk@con@printr$qpxcxc
	add       esp,8
	push      ebx
	push      742
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+742]
	push      eax
	call      @@stk@con@prints$qpxce
	pop       ecx
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-84],eax
	mov       dword ptr [ebp-80],edx
	cmp       dword ptr [ebp-68],0
	jne       short @55
	cmp       dword ptr [ebp-72],0
@55:
	je        short @54
	mov       eax,dword ptr [ebp-84]
	mov       edx,dword ptr [ebp-80]
	mov       dword ptr [ebp-404],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-400],edx
	fild      qword ptr [ebp-404]
	fadd      qword ptr [@11]
	mov       eax,dword ptr [ebp-72]
	mov       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-416],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-412],edx
	fild      qword ptr [ebp-416]
	fadd      qword ptr [@11]
	fdivp      st(1),st
	fstp      qword ptr [ebp-108]
	jmp short @56
@54:
	xor       ecx,ecx
	mov       dword ptr [ebp-108],ecx
	mov       dword ptr [ebp-104],ecx
@56:
	push      dword ptr [ebp-104]
	push      dword ptr [ebp-108]
	push      dword ptr [ebp-80]
	push      dword ptr [ebp-84]
	push      ebx
	push      744
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+744]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,20
	push      ebx
	push      792
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+792]
	push      eax
	call      @@stk@con@prints$qpxce
	pop       ecx
	push      ebx
	push      830
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+830]
	push      edx
	call      @@stk@con@prints$qpxce
	pop       ecx
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-72],eax
	mov       dword ptr [ebp-68],edx
	call      @@stk@cpu@tsc_start$qv
	mov       eax,dword ptr [ebp-36]
	push      eax
	push      esi
	push      edi
	call      @_memmove
	add       esp,12
	call      @@stk@cpu@tsc_checkpoint$qv
	call      @@stk@time@time_ms$qqsv
	sub       eax,dword ptr [ebp-72]
	sbb       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-72],eax
	mov       dword ptr [ebp-68],edx
	push      dword ptr [ebp-68]
	push      dword ptr [ebp-72]
	push      ebx
	push      842
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+842]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
	cmp       dword ptr [ebp-68],0
	jne       short @58
	cmp       dword ptr [ebp-72],0
@58:
	je        short @57
	push      dword ptr [ebp-32]
	push      dword ptr [ebp-36]
	mov       eax,1000
	xor       edx,edx
	call      __llmul
	mov       dword ptr [ebp-428],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-424],edx
	fild      qword ptr [ebp-428]
	fadd      qword ptr [@11]
	fdiv      dword ptr [@11+8]
	mov       eax,dword ptr [ebp-72]
	mov       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-440],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-436],edx
	fild      qword ptr [ebp-440]
	fadd      qword ptr [@11]
	fdivp      st(1),st
	fstp      qword ptr [ebp-96]
	jmp short @59
@57:
	xor       ecx,ecx
	mov       dword ptr [ebp-96],ecx
	mov       dword ptr [ebp-92],ecx
@59:
	push      dword ptr [ebp-92]
	push      dword ptr [ebp-96]
	push      dword ptr [ebp-32]
	push      dword ptr [ebp-36]
	push      ebx
	push      854
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+854]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,20
	fld       qword ptr [ebp-96]
	fmul      dword ptr [@11+12]
	call      __ftol
	movsx     eax,al
	mov       ecx,1000
	cdq
	idiv      ecx
	push      eax
	push      ebx
	push      885
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+885]
	push      ecx
	call      @@stk@con@printr$qpxcxc
	add       esp,8
	push      ebx
	push      887
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+887]
	push      eax
	call      @@stk@con@prints$qpxce
	pop       ecx
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-84],eax
	mov       dword ptr [ebp-80],edx
	cmp       dword ptr [ebp-68],0
	jne       short @61
	cmp       dword ptr [ebp-72],0
@61:
	je        short @60
	mov       eax,dword ptr [ebp-84]
	mov       edx,dword ptr [ebp-80]
	mov       dword ptr [ebp-452],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-448],edx
	fild      qword ptr [ebp-452]
	fadd      qword ptr [@11]
	mov       eax,dword ptr [ebp-72]
	mov       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-464],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-460],edx
	fild      qword ptr [ebp-464]
	fadd      qword ptr [@11]
	fdivp      st(1),st
	fstp      qword ptr [ebp-108]
	jmp short @62
@60:
	xor       ecx,ecx
	mov       dword ptr [ebp-108],ecx
	mov       dword ptr [ebp-104],ecx
@62:
	push      dword ptr [ebp-104]
	push      dword ptr [ebp-108]
	push      dword ptr [ebp-80]
	push      dword ptr [ebp-84]
	push      ebx
	push      889
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+889]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,20
	push      ebx
	push      937
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+937]
	push      eax
	call      @@stk@con@prints$qpxce
	pop       ecx
	push      ebx
	push      981
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+981]
	push      edx
	call      @@stk@con@prints$qpxce
	pop       ecx
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-72],eax
	mov       dword ptr [ebp-68],edx
	call      @@stk@cpu@tsc_start$qv
	mov       eax,dword ptr [ebp-36]
	push      eax
	push      esi
	push      edi
	call      @@stk@mem@mov$qqspvpxvxui
	call      @@stk@cpu@tsc_checkpoint$qv
	call      @@stk@time@time_ms$qqsv
	sub       eax,dword ptr [ebp-72]
	sbb       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-72],eax
	mov       dword ptr [ebp-68],edx
	push      dword ptr [ebp-68]
	push      dword ptr [ebp-72]
	push      ebx
	push      993
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+993]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
	cmp       dword ptr [ebp-68],0
	jne       short @64
	cmp       dword ptr [ebp-72],0
@64:
	je        short @63
	push      dword ptr [ebp-32]
	push      dword ptr [ebp-36]
	mov       eax,1000
	xor       edx,edx
	call      __llmul
	mov       dword ptr [ebp-476],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-472],edx
	fild      qword ptr [ebp-476]
	fadd      qword ptr [@11]
	fdiv      dword ptr [@11+8]
	mov       eax,dword ptr [ebp-72]
	mov       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-488],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-484],edx
	fild      qword ptr [ebp-488]
	fadd      qword ptr [@11]
	fdivp      st(1),st
	fstp      qword ptr [ebp-96]
	jmp short @65
@63:
	xor       ecx,ecx
	mov       dword ptr [ebp-96],ecx
	mov       dword ptr [ebp-92],ecx
@65:
	push      dword ptr [ebp-92]
	push      dword ptr [ebp-96]
	push      dword ptr [ebp-32]
	push      dword ptr [ebp-36]
	push      ebx
	push      1005
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1005]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,20
	fld       qword ptr [ebp-96]
	fmul      dword ptr [@11+12]
	call      __ftol
	movsx     eax,al
	mov       ecx,1000
	cdq
	idiv      ecx
	push      eax
	push      ebx
	push      1036
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1036]
	push      ecx
	call      @@stk@con@printr$qpxcxc
	add       esp,8
	push      ebx
	push      1038
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1038]
	push      eax
	call      @@stk@con@prints$qpxce
	pop       ecx
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-84],eax
	mov       dword ptr [ebp-80],edx
	cmp       dword ptr [ebp-68],0
	jne       short @67
	cmp       dword ptr [ebp-72],0
@67:
	je        short @66
	mov       eax,dword ptr [ebp-84]
	mov       edx,dword ptr [ebp-80]
	mov       dword ptr [ebp-500],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-496],edx
	fild      qword ptr [ebp-500]
	fadd      qword ptr [@11]
	mov       eax,dword ptr [ebp-72]
	mov       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-512],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-508],edx
	fild      qword ptr [ebp-512]
	fadd      qword ptr [@11]
	fdivp      st(1),st
	fstp      qword ptr [ebp-108]
	jmp short @68
@66:
	xor       ecx,ecx
	mov       dword ptr [ebp-108],ecx
	mov       dword ptr [ebp-104],ecx
@68:
	push      dword ptr [ebp-104]
	push      dword ptr [ebp-108]
	push      dword ptr [ebp-80]
	push      dword ptr [ebp-84]
	push      ebx
	push      1040
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1040]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,20
	push      ebx
	push      1088
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1088]
	push      eax
	call      @@stk@con@prints$qpxce
	pop       ecx
	push      ebx
	push      1288
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1288]
	push      edx
	call      @@stk@con@prints$qpxce
	pop       ecx
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-72],eax
	mov       dword ptr [ebp-68],edx
	call      @@stk@cpu@tsc_start$qv
	mov       dword ptr [ebp-48],0
	mov       dword ptr [ebp-44],0
	jmp @70
@69:
@71:
	push      dword ptr [ebp-56]
	push      dword ptr [ebp-60]
	mov       eax,dword ptr [ebp-36]
	mov       edx,dword ptr [ebp-32]
	call      __lludiv
	push      eax
	mov       dword ptr [ebp-520],esi
	push      dword ptr [ebp-56]
	push      dword ptr [ebp-60]
	push      dword ptr [ebp-32]
	push      dword ptr [ebp-36]
	mov       eax,dword ptr [ebp-48]
	mov       edx,dword ptr [ebp-44]
	call      __llmul
	call      __lludiv
	add       eax,esi
	push      dword ptr [ebp-520]
	push      eax
	call      _CG_A_BP
	push      eax
	mov       dword ptr [ebp-528],edi
	push      dword ptr [ebp-56]
	push      dword ptr [ebp-60]
	push      dword ptr [ebp-32]
	push      dword ptr [ebp-36]
	mov       eax,dword ptr [ebp-48]
	mov       edx,dword ptr [ebp-44]
	call      __llmul
	call      __lludiv
	add       eax,edi
	push      dword ptr [ebp-528]
	push      eax
	call      _CG_A_BP
	push      eax
	call      @_memmove
	add       esp,12
@72:
	add       dword ptr [ebp-48],1
	adc       dword ptr [ebp-44],0
@70:
	mov       eax,dword ptr [ebp-48]
	mov       edx,dword ptr [ebp-44]
	cmp       edx,dword ptr [ebp-56]
	jne       short @74
	cmp       eax,dword ptr [ebp-60]
@74:
	jb        @69
	call      @@stk@cpu@tsc_checkpoint$qv
	call      @@stk@time@time_ms$qqsv
	sub       eax,dword ptr [ebp-72]
	sbb       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-72],eax
	mov       dword ptr [ebp-68],edx
	push      dword ptr [ebp-68]
	push      dword ptr [ebp-72]
	push      ebx
	push      1300
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1300]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
	cmp       dword ptr [ebp-68],0
	jne       short @76
	cmp       dword ptr [ebp-72],0
@76:
	je        short @75
	push      dword ptr [ebp-32]
	push      dword ptr [ebp-36]
	mov       eax,1000
	xor       edx,edx
	call      __llmul
	mov       dword ptr [ebp-540],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-536],edx
	fild      qword ptr [ebp-540]
	fadd      qword ptr [@11]
	fdiv      dword ptr [@11+8]
	mov       eax,dword ptr [ebp-72]
	mov       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-552],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-548],edx
	fild      qword ptr [ebp-552]
	fadd      qword ptr [@11]
	fdivp      st(1),st
	fstp      qword ptr [ebp-96]
	jmp short @77
@75:
	xor       ecx,ecx
	mov       dword ptr [ebp-96],ecx
	mov       dword ptr [ebp-92],ecx
@77:
	push      dword ptr [ebp-92]
	push      dword ptr [ebp-96]
	push      dword ptr [ebp-32]
	push      dword ptr [ebp-36]
	push      ebx
	push      1312
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1312]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,20
	fld       qword ptr [ebp-96]
	fmul      dword ptr [@11+12]
	call      __ftol
	movsx     eax,al
	mov       ecx,1000
	cdq
	idiv      ecx
	push      eax
	push      ebx
	push      1343
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1343]
	push      ecx
	call      @@stk@con@printr$qpxcxc
	add       esp,8
	push      ebx
	push      1345
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1345]
	push      eax
	call      @@stk@con@prints$qpxce
	pop       ecx
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-84],eax
	mov       dword ptr [ebp-80],edx
	cmp       dword ptr [ebp-68],0
	jne       short @79
	cmp       dword ptr [ebp-72],0
@79:
	je        short @78
	mov       eax,dword ptr [ebp-84]
	mov       edx,dword ptr [ebp-80]
	mov       dword ptr [ebp-564],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-560],edx
	fild      qword ptr [ebp-564]
	fadd      qword ptr [@11]
	mov       eax,dword ptr [ebp-72]
	mov       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-576],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-572],edx
	fild      qword ptr [ebp-576]
	fadd      qword ptr [@11]
	fdivp      st(1),st
	fstp      qword ptr [ebp-108]
	jmp short @80
@78:
	xor       ecx,ecx
	mov       dword ptr [ebp-108],ecx
	mov       dword ptr [ebp-104],ecx
@80:
	push      dword ptr [ebp-104]
	push      dword ptr [ebp-108]
	push      dword ptr [ebp-80]
	push      dword ptr [ebp-84]
	push      ebx
	push      1347
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1347]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,20
	push      ebx
	push      1395
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1395]
	push      eax
	call      @@stk@con@prints$qpxce
	pop       ecx
	push      ebx
	push      1599
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1599]
	push      edx
	call      @@stk@con@prints$qpxce
	pop       ecx
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-72],eax
	mov       dword ptr [ebp-68],edx
	call      @@stk@cpu@tsc_start$qv
	mov       dword ptr [ebp-48],0
	mov       dword ptr [ebp-44],0
	jmp @82
@81:
@83:
	push      dword ptr [ebp-56]
	push      dword ptr [ebp-60]
	mov       eax,dword ptr [ebp-36]
	mov       edx,dword ptr [ebp-32]
	call      __lludiv
	push      eax
	mov       dword ptr [ebp-584],esi
	push      dword ptr [ebp-56]
	push      dword ptr [ebp-60]
	push      dword ptr [ebp-32]
	push      dword ptr [ebp-36]
	mov       eax,dword ptr [ebp-48]
	mov       edx,dword ptr [ebp-44]
	call      __llmul
	call      __lludiv
	add       eax,esi
	push      dword ptr [ebp-584]
	push      eax
	call      _CG_A_BP
	push      eax
	mov       dword ptr [ebp-592],edi
	push      dword ptr [ebp-56]
	push      dword ptr [ebp-60]
	push      dword ptr [ebp-32]
	push      dword ptr [ebp-36]
	mov       eax,dword ptr [ebp-48]
	mov       edx,dword ptr [ebp-44]
	call      __llmul
	call      __lludiv
	add       eax,edi
	push      dword ptr [ebp-592]
	push      eax
	call      _CG_A_BP
	push      eax
	call      @@stk@mem@mov$qqspvpxvxui
@84:
	add       dword ptr [ebp-48],1
	adc       dword ptr [ebp-44],0
@82:
	mov       eax,dword ptr [ebp-48]
	mov       edx,dword ptr [ebp-44]
	cmp       edx,dword ptr [ebp-56]
	jne       short @86
	cmp       eax,dword ptr [ebp-60]
@86:
	jb        @81
	call      @@stk@cpu@tsc_checkpoint$qv
	call      @@stk@time@time_ms$qqsv
	sub       eax,dword ptr [ebp-72]
	sbb       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-72],eax
	mov       dword ptr [ebp-68],edx
	push      dword ptr [ebp-68]
	push      dword ptr [ebp-72]
	push      ebx
	push      1611
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1611]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,12
	cmp       dword ptr [ebp-68],0
	jne       short @88
	cmp       dword ptr [ebp-72],0
@88:
	je        short @87
	push      dword ptr [ebp-32]
	push      dword ptr [ebp-36]
	mov       eax,1000
	xor       edx,edx
	call      __llmul
	mov       dword ptr [ebp-604],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-600],edx
	fild      qword ptr [ebp-604]
	fadd      qword ptr [@11]
	fdiv      dword ptr [@11+8]
	mov       eax,dword ptr [ebp-72]
	mov       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-616],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-612],edx
	fild      qword ptr [ebp-616]
	fadd      qword ptr [@11]
	fdivp      st(1),st
	fstp      qword ptr [ebp-96]
	jmp short @89
@87:
	xor       ecx,ecx
	mov       dword ptr [ebp-96],ecx
	mov       dword ptr [ebp-92],ecx
@89:
	push      dword ptr [ebp-92]
	push      dword ptr [ebp-96]
	push      dword ptr [ebp-32]
	push      dword ptr [ebp-36]
	push      ebx
	push      1623
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1623]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,20
	fld       qword ptr [ebp-96]
	fmul      dword ptr [@11+12]
	call      __ftol
	movsx     eax,al
	mov       ecx,1000
	cdq
	idiv      ecx
	push      eax
	push      ebx
	push      1654
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1654]
	push      ecx
	call      @@stk@con@printr$qpxcxc
	add       esp,8
	push      ebx
	push      1656
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1656]
	push      eax
	call      @@stk@con@prints$qpxce
	pop       ecx
	call      @@stk@cpu@tsc_elapsed$qv
	mov       dword ptr [ebp-84],eax
	mov       dword ptr [ebp-80],edx
	cmp       dword ptr [ebp-68],0
	jne       short @91
	cmp       dword ptr [ebp-72],0
@91:
	je        short @90
	mov       eax,dword ptr [ebp-84]
	mov       edx,dword ptr [ebp-80]
	mov       dword ptr [ebp-628],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-624],edx
	fild      qword ptr [ebp-628]
	fadd      qword ptr [@11]
	mov       eax,dword ptr [ebp-72]
	mov       edx,dword ptr [ebp-68]
	mov       dword ptr [ebp-640],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-636],edx
	fild      qword ptr [ebp-640]
	fadd      qword ptr [@11]
	fdivp      st(1),st
	fstp      qword ptr [ebp-108]
	jmp short @92
@90:
	xor       ecx,ecx
	mov       dword ptr [ebp-108],ecx
	mov       dword ptr [ebp-104],ecx
@92:
	push      dword ptr [ebp-104]
	push      dword ptr [ebp-108]
	push      dword ptr [ebp-80]
	push      dword ptr [ebp-84]
	push      ebx
	push      1658
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1658]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,20
	push      ebx
	push      1706
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1706]
	push      eax
	call      @@stk@con@prints$qpxce
	pop       ecx
	push      edi
	call      @@stk@cstr@free$qqspc
	push      esi
	call      @@stk@cstr@free$qqspc
?live16423@480: ; EBX = &s@
	lea       esi,dword ptr [ebx+1727]
?live16423@496: ; EBX = &s@, ESI = texti
	push      41
	push      40
	push      esi
	lea       eax,dword ptr [ebp-224]
	push      eax
	call      @@stk@cstr@between_cc$qqspcpxcxcxc
	cmp       edx,0
	jne       short @94
	cmp       eax,0
	jb        short @93
	jmp short @95
@94:
	jl        short @93
@95:
	lea       edx,dword ptr [ebp-224]
	push      edx
	push      ebx
	push      1770
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1770]
	push      ecx
	call      @@stk@con@prints$qpxce
	add       esp,8
	jmp short @96
@93:
	push      ebx
	push      1776
	call      _CG_A_PY
	lea       ecx,dword ptr [ebx+1776]
	push      ecx
	call      @@stk@con@prints$qpxce
	pop       ecx
@96:
	push      ebx
	push      1801
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1801]
	push      eax
	push      ebx
	push      1795
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1795]
	lea       ecx,dword ptr [ebp-224]
	push      edx
	push      esi
	push      ecx
	call      @@stk@cstr@between_words$qqspcpxct2t2
	cmp       edx,0
	jne       short @98
	cmp       eax,0
	jb        short @97
	jmp short @99
@98:
	jl        short @97
?live16423@560: ; EBX = &s@
@99:
	lea       eax,dword ptr [ebp-224]
	push      eax
	push      ebx
	push      1805
	call      _CG_A_PY
	lea       edx,dword ptr [ebx+1805]
	push      edx
	call      @@stk@con@prints$qpxce
	add       esp,8
	jmp short @100
@97:
	push      ebx
	push      1811
	call      _CG_A_PY
	lea       eax,dword ptr [ebx+1811]
	push      eax
	call      @@stk@con@prints$qpxce
	pop       ecx
?live16423@592: ; 
@100:
	mov       eax,dword ptr [ebp-16]
	push      eax
	call      @@stk@mem@free$qqspv
	mov       eax,dword ptr [ebp-24]
@102:
@101:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret       8
	align 4        
@11:
	db	0,0,0,0,0,0,224,67,0,0,128,73,0,0,160,66
	db	67,71,83,0
	dd @@stk@test@start_test$qqsippc+0
	dd @11+0
	db	128,253,255,255,16,0,0,0,13,0,0,0,12,0,0,0
	db	4,0,0,0,8,0,0,0,4,0,0,0,240,255,255,255
	db	4,0,0,0,232,255,255,255,4,0,0,0,220,255,255,255
	db	8,0,0,0,208,255,255,255,8,0,0,0,196,255,255,255
	db	8,0,0,0,184,255,255,255,8,0,0,0,172,255,255,255
	db	8,0,0,0,160,255,255,255,8,0,0,0,148,255,255,255
	db	8,0,0,0,136,255,255,255,8,0,0,0,32,255,255,255
	db	100,0,0,0
@@stk@test@start_test$qqsippc	endp
@stk@test@start_test$qqsippc	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@__cstr_class@set$qqsp16stk@__cstr_class	segment virtual
	align	2
@@stk@__cstr_class@set$qqsp16stk@__cstr_class	proc	near
?live16385@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	push      ebx
	mov       dword ptr [ebp-8],offset @103
@104:
	mov       ebx,dword ptr [ebp+8]
	push      28
	push      ebx
	call      _CG_THIS
?live16385@16: ; EBX = this
	mov       eax,dword ptr [ebp+12]
	push      eax
	call      @@stk@__cstr_class@c_str$xqqsv
	push      eax
	push      ebx
	call      @@stk@__cstr_class@set$qqspxc
?live16385@32: ; 
@106:
@105:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	pop       ecx
	pop       ecx
	pop       ebp
	ret       8
	align 4        
@103:
	db	67,71,83,0
	dd @@stk@__cstr_class@set$qqsp16stk@__cstr_class+0
	dd @103+0
	db	248,255,255,255,16,0,0,0,1,0,0,0,12,0,0,0
	db	4,0,0,0
@@stk@__cstr_class@set$qqsp16stk@__cstr_class	endp
@stk@__cstr_class@set$qqsp16stk@__cstr_class	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@__cstr_class@set$qqsxui	segment virtual
	align	2
@@stk@__cstr_class@set$qqsxui	proc	near
?live16386@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	push      ebx
	mov       dword ptr [ebp-8],offset @107
@108:
	mov       ebx,dword ptr [ebp+8]
	push      28
	push      ebx
	call      _CG_THIS
?live16386@16: ; EBX = this
	mov       eax,dword ptr [ebp+12]
	push      eax
	call      @@stk@cstr@itoa$qqsxi
	push      eax
	push      ebx
	call      @@stk@__cstr_class@set$qqspxc
?live16386@32: ; 
@110:
@109:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	pop       ecx
	pop       ecx
	pop       ebp
	ret       8
	align 4        
@107:
	db	67,71,83,0
	dd @@stk@__cstr_class@set$qqsxui+0
	dd @107+0
	db	248,255,255,255,16,0,0,0,1,0,0,0,12,0,0,0
	db	4,0,0,0
@@stk@__cstr_class@set$qqsxui	endp
@stk@__cstr_class@set$qqsxui	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@__cstr_class@data$qqsv	segment virtual
	align	2
@@stk@__cstr_class@data$qqsv	proc	near
?live16387@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @111
@112:
	mov       eax,dword ptr [ebp+8]
	push      28
	push      eax
	call      _CG_THIS
?live16387@16: ; EAX = this
	push      eax
	call      @@stk@%__vector$c%@bottom$xqqsv
?live16387@32: ; 
@114:
@113:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret       4
	align 4        
@111:
	db	67,71,83,0
	dd @@stk@__cstr_class@data$qqsv+0
	dd @111+0
	db	248,255,255,255,12,0,0,0,0,0,0,0
@@stk@__cstr_class@data$qqsv	endp
@stk@__cstr_class@data$qqsv	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@__cstr_class@at$xqqsxui	segment virtual
	align	2
@@stk@__cstr_class@at$xqqsxui	proc	near
?live16388@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @115
@116:
	mov       eax,dword ptr [ebp+8]
	push      28
	push      eax
	call      _CG_THIS
?live16388@16: ; EAX = this
	mov       edx,dword ptr [ebp+12]
	push      edx
	push      eax
	call      @@stk@%__vector$c%@at$xqqsxui
?live16388@32: ; 
@118:
@117:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret       8
	align 4        
@115:
	db	67,71,83,0
	dd @@stk@__cstr_class@at$xqqsxui+0
	dd @115+0
	db	248,255,255,255,16,0,0,0,1,0,0,0,12,0,0,0
	db	4,0,0,0
@@stk@__cstr_class@at$xqqsxui	endp
@stk@__cstr_class@at$xqqsxui	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@__cstr_class@len$xqqsv	segment virtual
	align	2
@@stk@__cstr_class@len$xqqsv	proc	near
?live16389@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	push      ebx
	mov       dword ptr [ebp-8],offset @119
@120:
	mov       ebx,dword ptr [ebp+8]
	push      28
	push      ebx
	call      _CG_THIS
?live16389@16: ; EBX = this
	push      ebx
	call      @@stk@%__vector$c%@bottom$xqqsv
	push      eax
	call      @@stk@cstr@len$qqspxc
?live16389@32: ; 
@122:
@121:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	pop       ecx
	pop       ecx
	pop       ebp
	ret       4
	align 4        
@119:
	db	67,71,83,0
	dd @@stk@__cstr_class@len$xqqsv+0
	dd @119+0
	db	248,255,255,255,12,0,0,0,0,0,0,0
@@stk@__cstr_class@len$xqqsv	endp
@stk@__cstr_class@len$xqqsv	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@__cstr_class@i$xqqsv	segment virtual
	align	2
@@stk@__cstr_class@i$xqqsv	proc	near
?live16390@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	push      ebx
	mov       dword ptr [ebp-8],offset @123
@124:
	mov       ebx,dword ptr [ebp+8]
	push      28
	push      ebx
	call      _CG_THIS
?live16390@16: ; EBX = this
	push      ebx
	call      @@stk@%__vector$c%@bottom$xqqsv
	push      eax
	call      @@stk@cstr@atoi$qqspxc
?live16390@32: ; 
@126:
@125:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	pop       ecx
	pop       ecx
	pop       ebp
	ret       4
	align 4        
@123:
	db	67,71,83,0
	dd @@stk@__cstr_class@i$xqqsv+0
	dd @123+0
	db	248,255,255,255,12,0,0,0,0,0,0,0
@@stk@__cstr_class@i$xqqsv	endp
@stk@__cstr_class@i$xqqsv	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@__cstr_class@c_str$xqqsv	segment virtual
	align	2
@@stk@__cstr_class@c_str$xqqsv	proc	near
?live16391@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @127
@128:
	mov       eax,dword ptr [ebp+8]
	push      28
	push      eax
	call      _CG_THIS
?live16391@16: ; EAX = this
	push      eax
	call      @@stk@%__vector$c%@bottom$xqqsv
?live16391@32: ; 
@130:
@129:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret       4
	align 4        
@127:
	db	67,71,83,0
	dd @@stk@__cstr_class@c_str$xqqsv+0
	dd @127+0
	db	248,255,255,255,12,0,0,0,0,0,0,0
@@stk@__cstr_class@c_str$xqqsv	endp
@stk@__cstr_class@c_str$xqqsv	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@__cstr_class@$opxc$xqqsv	segment virtual
	align	2
@@stk@__cstr_class@$opxc$xqqsv	proc	near
?live16392@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @131
@132:
	mov       eax,dword ptr [ebp+8]
	push      28
	push      eax
	call      _CG_THIS
?live16392@16: ; EAX = this
	push      eax
	call      @@stk@__cstr_class@c_str$xqqsv
?live16392@32: ; 
@134:
@133:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret       4
	align 4        
@131:
	db	67,71,83,0
	dd @@stk@__cstr_class@$opxc$xqqsv+0
	dd @131+0
	db	248,255,255,255,12,0,0,0,0,0,0,0
@@stk@__cstr_class@$opxc$xqqsv	endp
@stk@__cstr_class@$opxc$xqqsv	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@__cstr_class@$oui$xqqsv	segment virtual
	align	2
@@stk@__cstr_class@$oui$xqqsv	proc	near
?live16393@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @135
@136:
	mov       eax,dword ptr [ebp+8]
	push      28
	push      eax
	call      _CG_THIS
?live16393@16: ; EAX = this
	push      eax
	call      @@stk@__cstr_class@i$xqqsv
?live16393@32: ; 
@138:
@137:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret       4
	align 4        
@135:
	db	67,71,83,0
	dd @@stk@__cstr_class@$oui$xqqsv+0
	dd @135+0
	db	248,255,255,255,12,0,0,0,0,0,0,0
@@stk@__cstr_class@$oui$xqqsv	endp
@stk@__cstr_class@$oui$xqqsv	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@__cstr_class@$basg$qqspxc	segment virtual
	align	2
@@stk@__cstr_class@$basg$qqspxc	proc	near
?live16394@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @139
@140:
	mov       eax,dword ptr [ebp+8]
	push      28
	push      eax
	call      _CG_THIS
?live16394@16: ; EAX = this
	mov       edx,dword ptr [ebp+12]
	push      edx
	push      eax
	call      @@stk@__cstr_class@set$qqspxc
?live16394@32: ; 
@142:
@141:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret       8
	align 4        
@139:
	db	67,71,83,0
	dd @@stk@__cstr_class@$basg$qqspxc+0
	dd @139+0
	db	248,255,255,255,16,0,0,0,1,0,0,0,12,0,0,0
	db	4,0,0,0
@@stk@__cstr_class@$basg$qqspxc	endp
@stk@__cstr_class@$basg$qqspxc	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@__cstr_class@$basg$qqsxc	segment virtual
	align	2
@@stk@__cstr_class@$basg$qqsxc	proc	near
?live16395@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-76
	mov       dword ptr [ebp-8],offset @143
@144:
	mov       eax,dword ptr [ebp+8]
	push      28
	push      eax
	call      _CG_THIS
?live16395@16: ; EAX = this
	mov       dl,byte ptr [ebp+12]
	lea       ecx,dword ptr [ebp-80]
	mov       byte ptr [ebp-80],dl
	mov       byte ptr [ebp-79],0
	push      ecx
	push      eax
	call      @@stk@__cstr_class@set$qqspxc
?live16395@32: ; 
@146:
@145:
	mov       esp,ebp
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebp
	ret       8
	align 4        
@143:
	db	67,71,83,0
	dd @@stk@__cstr_class@$basg$qqsxc+0
	dd @143+0
	db	176,255,255,255,16,0,0,0,2,0,0,0,12,0,0,0
	db	1,0,0,0,176,255,255,255,2,0,0,0
@@stk@__cstr_class@$basg$qqsxc	endp
@stk@__cstr_class@$basg$qqsxc	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@__cstr_class@$basg$qqsxo	segment virtual
	align	2
@@stk@__cstr_class@$basg$qqsxo	proc	near
?live16396@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @147
@148:
	mov       eax,dword ptr [ebp+8]
	push      28
	push      eax
	call      _CG_THIS
?live16396@16: ; EAX = this
	cmp       byte ptr [ebp+12],0
	je        short @149
	push      offset s@+1830
	push      eax
	call      @@stk@__cstr_class@set$qqspxc
	jmp short @150
@149:
	push      offset s@+1832
	push      eax
	call      @@stk@__cstr_class@set$qqspxc
?live16396@32: ; 
@152:
@150:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret       8
	align 4        
@147:
	db	67,71,83,0
	dd @@stk@__cstr_class@$basg$qqsxo+0
	dd @147+0
	db	248,255,255,255,16,0,0,0,1,0,0,0,12,0,0,0
	db	1,0,0,0
@@stk@__cstr_class@$basg$qqsxo	endp
@stk@__cstr_class@$basg$qqsxo	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@__cstr_class@$basg$qqsxui	segment virtual
	align	2
@@stk@__cstr_class@$basg$qqsxui	proc	near
?live16397@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @153
@154:
	mov       eax,dword ptr [ebp+8]
	push      28
	push      eax
	call      _CG_THIS
?live16397@16: ; EAX = this
	mov       edx,dword ptr [ebp+12]
	push      edx
	push      eax
	call      @@stk@__cstr_class@set$qqsxui
?live16397@32: ; 
@156:
@155:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret       8
	align 4        
@153:
	db	67,71,83,0
	dd @@stk@__cstr_class@$basg$qqsxui+0
	dd @153+0
	db	248,255,255,255,16,0,0,0,1,0,0,0,12,0,0,0
	db	4,0,0,0
@@stk@__cstr_class@$basg$qqsxui	endp
@stk@__cstr_class@$basg$qqsxui	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
@_$DCPZH$@stk@__database_alias@$bctr$qqsv	segment virtual
	align	2
@@_$DCPZH$@stk@__database_alias@$bctr$qqsv	label	dword
	dd	@@$xt$p20stk@__database_alias
	dd	5
	dd	8
	dd	0
	db	1	dup(?)
@_$DCPZH$@stk@__database_alias@$bctr$qqsv	ends
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTQZH$@stk@__database_alias@$bctr$qqsv	segment virtual
	align	2
@@_$ECTQZH$@stk@__database_alias@$bctr$qqsv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	@@_$DCPZH$@stk@__database_alias@$bctr$qqsv
	db	1	dup(?)
@_$ECTQZH$@stk@__database_alias@$bctr$qqsv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@__database_alias@$bctr$qqsv	segment virtual
	align	2
@@stk@__database_alias@$bctr$qqsv	proc	near
?live16398@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-40
	push      ebx
	mov       dword ptr [ebp-8],offset @157
@158:
	push      28
	push      dword ptr [ebp+8]
	call      _CG_THIS
	mov       eax,offset @@_$ECTQZH$@stk@__database_alias@$bctr$qqsv
	call      @__InitExceptBlockLDTC
	mov       word ptr [ebp-28],12
	mov       edx,dword ptr [ebp+8]
	push      edx
	call      @@stk@__cstr_class@$bctr$qqsv
	add       dword ptr [ebp-16],2
	push      offset @@stk@__database_alias@3
	push      offset @@stk@__database_alias@3+12
	call      _CG_GA_BP
	push      1
	push      offset @@stk@__database_alias@3
	push      12
	call      _CG_GDA_EGY
	mov       ecx,offset @@stk@__database_alias@3+12
	mov       ebx,dword ptr [ebp+8]
	push      4
	push      ebx
	push      12
	call      _CG_DA_EPY
	mov       dword ptr [ebx+12],ecx
	mov       eax,dword ptr [ebp-44]
	mov       dword ptr fs:[0],eax
	mov       eax,dword ptr [ebp+8]
@160:
@159:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret       4
	align 4        
@157:
	db	67,71,83,0
	dd @@stk@__database_alias@$bctr$qqsv+0
	dd @157+0
	db	212,255,255,255,12,0,0,0,2,0,0,0,8,0,0,0
	db	4,0,0,0,212,255,255,255,33,0,0,0
@@stk@__database_alias@$bctr$qqsv	endp
@stk@__database_alias@$bctr$qqsv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
@_$DCRZH$@stk@__database_alias@$bctr$qqspxc	segment virtual
	align	2
@@_$DCRZH$@stk@__database_alias@$bctr$qqspxc	label	dword
	dd	@@$xt$p20stk@__database_alias
	dd	5
	dd	8
	dd	0
	db	1	dup(?)
@_$DCRZH$@stk@__database_alias@$bctr$qqspxc	ends
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTSZH$@stk@__database_alias@$bctr$qqspxc	segment virtual
	align	2
@@_$ECTSZH$@stk@__database_alias@$bctr$qqspxc	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	@@_$DCRZH$@stk@__database_alias@$bctr$qqspxc
	db	1	dup(?)
@_$ECTSZH$@stk@__database_alias@$bctr$qqspxc	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@__database_alias@$bctr$qqspxc	segment virtual
	align	2
@@stk@__database_alias@$bctr$qqspxc	proc	near
?live16399@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-40
	mov       dword ptr [ebp-8],offset @161
@162:
	push      28
	push      dword ptr [ebp+8]
	call      _CG_THIS
	mov       eax,offset @@_$ECTSZH$@stk@__database_alias@$bctr$qqspxc
	call      @__InitExceptBlockLDTC
	mov       word ptr [ebp-28],12
	mov       edx,dword ptr [ebp+12]
	push      edx
	mov       ecx,dword ptr [ebp+8]
	push      ecx
	call      @@stk@__cstr_class@$bctr$qqspxc
	add       dword ptr [ebp-16],2
	push      offset @@stk@__database_alias@3
	push      offset @@stk@__database_alias@3+12
	call      _CG_GA_BP
	push      1
	push      offset @@stk@__database_alias@3
	push      12
	call      _CG_GDA_EGY
	mov       eax,offset @@stk@__database_alias@3+12
	mov       edx,dword ptr [ebp+8]
	push      4
	push      edx
	push      12
	call      _CG_DA_EPY
	mov       dword ptr [edx+12],eax
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
	mov       eax,dword ptr [ebp+8]
@164:
@163:
	mov       esp,ebp
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebp
	ret       8
	align 4        
@161:
	db	67,71,83,0
	dd @@stk@__database_alias@$bctr$qqspxc+0
	dd @161+0
	db	212,255,255,255,16,0,0,0,3,0,0,0,12,0,0,0
	db	4,0,0,0,8,0,0,0,4,0,0,0,212,255,255,255
	db	33,0,0,0
@@stk@__database_alias@$bctr$qqspxc	endp
@stk@__database_alias@$bctr$qqspxc	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
@_$DCTZH$@stk@__database_alias@$bdtr$qqsv	segment virtual
	align	2
@@_$DCTZH$@stk@__database_alias@$bdtr$qqsv	label	dword
	dd	@@$xt$p20stk@__database_alias
	dd	5
	dd	8
	dd	0
	db	1	dup(?)
@_$DCTZH$@stk@__database_alias@$bdtr$qqsv	ends
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTUZH$@stk@__database_alias@$bdtr$qqsv	segment virtual
	align	2
@@_$ECTUZH$@stk@__database_alias@$bdtr$qqsv	label	dword
	dd	0
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	@@_$DCTZH$@stk@__database_alias@$bdtr$qqsv
	db	1	dup(?)
@_$ECTUZH$@stk@__database_alias@$bdtr$qqsv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@__database_alias@$bdtr$qqsv	segment virtual
	align	2
@@stk@__database_alias@$bdtr$qqsv	proc	near
?live16400@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-40
	mov       dword ptr [ebp-8],offset @165
@166:
	push      28
	push      dword ptr [ebp+8]
	call      _CG_DTORTHIS
	mov       eax,offset @@_$ECTUZH$@stk@__database_alias@$bdtr$qqsv
	call      @__InitExceptBlockLDTC
	mov       dword ptr [ebp-16],2
	cmp       dword ptr [ebp+8],0
	je        short @167
	mov       word ptr [ebp-28],12
	push      offset @@stk@__database_alias@3
	push      offset @@stk@__database_alias@3+12
	call      _CG_GA_BP
	push      1
	push      offset @@stk@__database_alias@3
	push      12
	call      _CG_GDA_EGY
	mov       edx,offset @@stk@__database_alias@3+12
	mov       ecx,dword ptr [ebp+8]
	push      4
	push      ecx
	push      12
	call      _CG_DA_EPY
	mov       dword ptr [ecx+12],edx
	sub       dword ptr [ebp-16],2
	push      0
	mov       eax,dword ptr [ebp+8]
	push      eax
	call      @@stk@__cstr_class@$bdtr$qqsv
	test      byte ptr [ebp+12],1
	je        short @168
	mov       eax,dword ptr [ebp+8]
	push      eax
	call      @@stk@mem@free$qqspv
@168:
@167:
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
@169:
	mov       esp,ebp
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebp
	ret       8
	align 4        
@165:
	db	67,71,83,0
	dd @@stk@__database_alias@$bdtr$qqsv+0
	dd @165+0
	db	212,255,255,255,16,0,0,0,3,0,0,0,12,0,0,0
	db	4,0,0,0,8,0,0,0,4,0,0,0,212,255,255,255
	db	33,0,0,0
@@stk@__database_alias@$bdtr$qqsv	endp
@stk@__database_alias@$bdtr$qqsv	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@__journal@$blsh$qxc	segment virtual
	align	2
@@stk@__journal@$blsh$qxc	proc	near
?live16415@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @170
@171:
	mov       eax,dword ptr [ebp+8]
	push      48
	push      eax
	call      _CG_THIS
?live16415@16: ; EAX = this
	movsx     edx,byte ptr [ebp+12]
	push      edx
	push      offset s@+1834
	push      eax
	call      @@stk@__journal@write_formated_line$qpxce
	add       esp,12
?live16415@32: ; 
@172:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@170:
	db	67,71,83,0
	dd @@stk@__journal@$blsh$qxc+0
	dd @170+0
	db	248,255,255,255,16,0,0,0,1,0,0,0,12,0,0,0
	db	1,0,0,0
@@stk@__journal@$blsh$qxc	endp
@stk@__journal@$blsh$qxc	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@__journal@$blsh$qpxc	segment virtual
	align	2
@@stk@__journal@$blsh$qpxc	proc	near
?live16416@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @173
@174:
	mov       eax,dword ptr [ebp+8]
	push      48
	push      eax
	call      _CG_THIS
?live16416@16: ; EAX = this
	mov       edx,dword ptr [ebp+12]
	push      edx
	push      offset s@+1837
	push      eax
	call      @@stk@__journal@write_formated_line$qpxce
	add       esp,12
?live16416@32: ; 
@175:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@173:
	db	67,71,83,0
	dd @@stk@__journal@$blsh$qpxc+0
	dd @173+0
	db	248,255,255,255,16,0,0,0,1,0,0,0,12,0,0,0
	db	4,0,0,0
@@stk@__journal@$blsh$qpxc	endp
@stk@__journal@$blsh$qpxc	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@__journal@$blsh$qxui	segment virtual
	align	2
@@stk@__journal@$blsh$qxui	proc	near
?live16417@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @176
@177:
	mov       eax,dword ptr [ebp+8]
	push      48
	push      eax
	call      _CG_THIS
?live16417@16: ; EAX = this
	mov       edx,dword ptr [ebp+12]
	push      edx
	push      offset s@+1840
	push      eax
	call      @@stk@__journal@write_formated_line$qpxce
	add       esp,12
?live16417@32: ; 
@178:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@176:
	db	67,71,83,0
	dd @@stk@__journal@$blsh$qxui+0
	dd @176+0
	db	248,255,255,255,16,0,0,0,1,0,0,0,12,0,0,0
	db	4,0,0,0
@@stk@__journal@$blsh$qxui	endp
@stk@__journal@$blsh$qxui	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@__journal@$blsh$qxj	segment virtual
	align	2
@@stk@__journal@$blsh$qxj	proc	near
?live16418@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @179
@180:
	mov       eax,dword ptr [ebp+8]
	push      48
	push      eax
	call      _CG_THIS
?live16418@16: ; EAX = this
	push      dword ptr [ebp+16]
	push      dword ptr [ebp+12]
	push      offset s@+1843
	push      eax
	call      @@stk@__journal@write_formated_line$qpxce
	add       esp,16
?live16418@32: ; 
@181:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@179:
	db	67,71,83,0
	dd @@stk@__journal@$blsh$qxj+0
	dd @179+0
	db	248,255,255,255,20,0,0,0,1,0,0,0,12,0,0,0
	db	8,0,0,0
@@stk@__journal@$blsh$qxj	endp
@stk@__journal@$blsh$qxj	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@__journal@$blsh$qxd	segment virtual
	align	2
@@stk@__journal@$blsh$qxd	proc	near
?live16419@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @182
@183:
	mov       eax,dword ptr [ebp+8]
	push      48
	push      eax
	call      _CG_THIS
?live16419@16: ; EAX = this
	push      dword ptr [ebp+16]
	push      dword ptr [ebp+12]
	push      offset s@+1848
	push      eax
	call      @@stk@__journal@write_formated_line$qpxce
	add       esp,16
?live16419@32: ; 
@184:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@182:
	db	67,71,83,0
	dd @@stk@__journal@$blsh$qxd+0
	dd @182+0
	db	248,255,255,255,20,0,0,0,1,0,0,0,12,0,0,0
	db	8,0,0,0
_INIT_	segment word public use32 'INITDATA'
_INIT_	ends
@@stk@__journal@$blsh$qxd	endp
@stk@__journal@$blsh$qxd	ends
_TEXT	ends
_INIT_	segment word public use32 'INITDATA'
	db	0
	db	32
	dd	@_STCON0_$qv
_INIT_	ends
_TEXT	segment dword public use32 'CODE'
@stk@__journal@$blsh$qxd	segment virtual
@stk@__journal@$blsh$qxd	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
@#$cf$@std@%codecvt$cci%@id	segment virtual
$iibdnhia	label	byte
	db	0
	db	1	dup(?)
@#$cf$@std@%codecvt$cci%@id	ends
_DATA	ends
_DATA	segment dword public use32 'DATA'
@#$cf$@std@%numpunct$c%@id	segment virtual
$ecfmbiia	label	byte
	db	0
	db	1	dup(?)
@#$cf$@std@%numpunct$c%@id	ends
_DATA	ends
_DATA	segment dword public use32 'DATA'
@#$cf$@std@%num_get$c48std@%istreambuf_iterator$c19std@%char_traits$c%%%@id	segment virtual
$iphmbiia	label	byte
	db	0
	db	1	dup(?)
@#$cf$@std@%num_get$c48std@%istreambuf_iterator$c19std@%char_traits$c%%%@id	ends
_DATA	ends
_DATA	segment dword public use32 'DATA'
@#$cf$@std@%num_put$c48std@%ostreambuf_iterator$c19std@%char_traits$c%%%@id	segment virtual
$mmkmbiia	label	byte
	db	0
	db	1	dup(?)
@#$cf$@std@%num_put$c48std@%ostreambuf_iterator$c19std@%char_traits$c%%%@id	ends
_DATA	ends
_DATA	segment dword public use32 'DATA'
@#$cf$@std@%numpunct$b%@id	segment virtual
$aknmbiia	label	byte
	db	0
	db	1	dup(?)
@#$cf$@std@%numpunct$b%@id	ends
_DATA	ends
_DATA	segment dword public use32 'DATA'
@#$cf$@std@%num_get$b48std@%istreambuf_iterator$b19std@%char_traits$b%%%@id	segment virtual
$ehanbiia	label	byte
	db	0
	db	1	dup(?)
@#$cf$@std@%num_get$b48std@%istreambuf_iterator$b19std@%char_traits$b%%%@id	ends
_DATA	ends
_DATA	segment dword public use32 'DATA'
@#$cf$@std@%num_put$b48std@%ostreambuf_iterator$b19std@%char_traits$b%%%@id	segment virtual
$iednbiia	label	byte
	db	0
	db	1	dup(?)
@#$cf$@std@%num_put$b48std@%ostreambuf_iterator$b19std@%char_traits$b%%%@id	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
	align	4
@_STCON0_$qv	proc	near
@@_STCON0_$qv equ @_STCON0_$qv
?live1@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @185
@186:
	cmp       byte ptr [$iibdnhia],0
	jne       short @187
	xor       eax,eax
	mov       dword ptr [@@std@%codecvt$cci%@id],eax
	mov       byte ptr [$iibdnhia],1
@187:
	cmp       byte ptr [$ecfmbiia],0
	jne       short @188
	xor       edx,edx
	mov       dword ptr [@@std@%numpunct$c%@id],edx
	mov       byte ptr [$ecfmbiia],1
@188:
	cmp       byte ptr [$iphmbiia],0
	jne       short @189
	xor       ecx,ecx
	mov       dword ptr [@@std@%num_get$c48std@%istreambuf_iterator$c19std@%char_traits$c%%%@id],ecx
	mov       byte ptr [$iphmbiia],1
@189:
	cmp       byte ptr [$mmkmbiia],0
	jne       short @190
	xor       eax,eax
	mov       dword ptr [@@std@%num_put$c48std@%ostreambuf_iterator$c19std@%char_traits$c%%%@id],eax
	mov       byte ptr [$mmkmbiia],1
@190:
	cmp       byte ptr [$aknmbiia],0
	jne       short @191
	xor       edx,edx
	mov       dword ptr [@@std@%numpunct$b%@id],edx
	mov       byte ptr [$aknmbiia],1
@191:
	cmp       byte ptr [$ehanbiia],0
	jne       short @192
	xor       ecx,ecx
	mov       dword ptr [@@std@%num_get$b48std@%istreambuf_iterator$b19std@%char_traits$b%%%@id],ecx
	mov       byte ptr [$ehanbiia],1
@192:
	cmp       byte ptr [$iednbiia],0
	jne       short @193
	xor       eax,eax
	mov       dword ptr [@@std@%num_put$b48std@%ostreambuf_iterator$b19std@%char_traits$b%%%@id],eax
	mov       byte ptr [$iednbiia],1
@193:
@194:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret 
	align 4        
@185:
	db	67,71,83,0
	dd @_STCON0_$qv+0
	dd @185+0
	db	248,255,255,255,8,0,0,0,0,0,0,0
@_STCON0_$qv	endp
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@%__vector$c%@bottom$xqqsv	segment virtual
	align	2
@@stk@%__vector$c%@bottom$xqqsv	proc	near
?live16431@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @195
@196:
	mov       eax,dword ptr [ebp+8]
	push      16
	push      eax
	call      _CG_THIS
?live16431@16: ; EAX = this
	push      eax
	call      @@stk@%__vector$c%@back$xqqsv
?live16431@32: ; 
@198:
@197:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret       4
	align 4        
@195:
	db	67,71,83,0
	dd @@stk@%__vector$c%@bottom$xqqsv+0
	dd @195+0
	db	248,255,255,255,12,0,0,0,0,0,0,0
@@stk@%__vector$c%@bottom$xqqsv	endp
@stk@%__vector$c%@bottom$xqqsv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iedpckia	label	dword
	dd	203
	db	1	dup(?)
	align	4
$iidpckia	label	qword
	db	8	dup(?)
	db	1	dup(?)
$mcahdkia	label	byte
	db	0
	db	1	dup(?)
	align	4
$imdpckia	label	dword
	dd	1
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTVZH$@stk@%__vector$c%@back$xqqsv	segment virtual
	align	2
@@_$ECTVZH$@stk@%__vector$c%@back$xqqsv	label	dword
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
@_$ECTVZH$@stk@%__vector$c%@back$xqqsv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@%__vector$c%@back$xqqsv	segment virtual
	align	2
@@stk@%__vector$c%@back$xqqsv	proc	near
?live16432@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-72
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @199+8
@200:
	mov       esi,dword ptr [ebp+8]
	push      16
	push      esi
	call      _CG_THIS
	mov       eax,offset @@_$ECTVZH$@stk@%__vector$c%@back$xqqsv
	call      @__InitExceptBlockLDTC
?live16432@16: ; ESI = this
	cmp       byte ptr [$mcahdkia],0
	jne       short @201
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-68],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-64],edx
	fild      qword ptr [ebp-68]
	fadd      qword ptr [@199]
	fstp      qword ptr [$iidpckia]
	inc       byte ptr [$mcahdkia]
@201:
	mov       ebx,offset s@+1851
	push      47
	push      ebx
	call      @@stk@cstr@chrr$qqspxcxc
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	cmp       dword ptr [ebp-52],0
	jne       short @203
	cmp       dword ptr [ebp-56],0
	jae       short @202
	jmp short @204
@203:
	jge       short @202
@204:
	push      92
	push      ebx
	call      @@stk@cstr@chrr$qqspxcxc
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
@202:
	cmp       dword ptr [ebp-52],0
	jne       short @206
	cmp       dword ptr [ebp-56],0
	jae       short @205
	jmp short @207
@206:
	jge       short @205
@207:
	mov       eax,ebx
	jmp short @208
@205:
	mov       dword ptr [ebp-76],ebx
	mov       eax,dword ptr [ebp-56]
	inc       eax
	add       eax,ebx
	push      dword ptr [ebp-76]
	push      eax
	call      _CG_A_BP
@208:
	inc       dword ptr [$imdpckia]
	mov       edx,dword ptr [$imdpckia]
	push      edx
	push      203
	push      offset s@+1942
	push      eax
	push      offset s@+1889
	call      @@stk@con@prints$qpxce
	add       esp,20
	push      4
	push      esi
	push      8
	call      _CG_DA_EPY
	mov       eax,dword ptr [esi+8]
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16432@48: ; 
@210:
@209:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret       4
	align 4        
@199:
	db	0,0,0,0,0,0,224,67,67,71,83,0
	dd @@stk@%__vector$c%@back$xqqsv+0
	dd @199+0
	db	180,255,255,255,12,0,0,0,2,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0
@@stk@%__vector$c%@back$xqqsv	endp
@stk@%__vector$c%@back$xqqsv	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$ieepckia	label	dword
	dd	185
	db	1	dup(?)
	align	4
$iiepckia	label	qword
	db	8	dup(?)
	db	1	dup(?)
$mkahdkia	label	byte
	db	0
	db	1	dup(?)
	align	4
$imepckia	label	dword
	dd	1
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTWZH$@stk@%__vector$c%@at$xqqsxui	segment virtual
	align	2
@@_$ECTWZH$@stk@%__vector$c%@at$xqqsxui	label	dword
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
@_$ECTWZH$@stk@%__vector$c%@at$xqqsxui	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@%__vector$c%@at$xqqsxui	segment virtual
	align	2
@@stk@%__vector$c%@at$xqqsxui	proc	near
?live16434@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-80
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @211+8
@212:
	mov       esi,dword ptr [ebp+8]
	push      16
	push      esi
	call      _CG_THIS
	mov       eax,offset @@_$ECTWZH$@stk@%__vector$c%@at$xqqsxui
	call      @__InitExceptBlockLDTC
?live16434@16: ; ESI = this
	cmp       byte ptr [$mkahdkia],0
	jne       short @213
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-68],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-64],edx
	fild      qword ptr [ebp-68]
	fadd      qword ptr [@211]
	fstp      qword ptr [$iiepckia]
	inc       byte ptr [$mkahdkia]
@213:
	mov       ebx,offset s@+1943
	push      47
	push      ebx
	call      @@stk@cstr@chrr$qqspxcxc
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	cmp       dword ptr [ebp-52],0
	jne       short @215
	cmp       dword ptr [ebp-56],0
	jae       short @214
	jmp short @216
@215:
	jge       short @214
@216:
	push      92
	push      ebx
	call      @@stk@cstr@chrr$qqspxcxc
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
@214:
	cmp       dword ptr [ebp-52],0
	jne       short @218
	cmp       dword ptr [ebp-56],0
	jae       short @217
	jmp short @219
@218:
	jge       short @217
@219:
	mov       eax,ebx
	jmp short @220
@217:
	mov       dword ptr [ebp-76],ebx
	mov       eax,dword ptr [ebp-56]
	inc       eax
	add       eax,ebx
	push      dword ptr [ebp-76]
	push      eax
	call      _CG_A_BP
@220:
	inc       dword ptr [$imepckia]
	mov       edx,dword ptr [$imepckia]
	push      edx
	push      185
	push      offset s@+2034
	push      eax
	push      offset s@+1981
	call      @@stk@con@prints$qpxce
	add       esp,20
	push      4
	push      esi
	push      8
	call      _CG_DA_EPY
	push      dword ptr [esi+8]
	pop       dword ptr [ebp-84]
	mov       eax,dword ptr [esi+8]
	add       eax,dword ptr [ebp+12]
	push      dword ptr [ebp-84]
	push      eax
	call      _CG_A_BP
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16434@48: ; 
@222:
@221:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret       8
	align 4        
@211:
	db	0,0,0,0,0,0,224,67,67,71,83,0
	dd @@stk@%__vector$c%@at$xqqsxui+0
	dd @211+0
	db	172,255,255,255,16,0,0,0,3,0,0,0,12,0,0,0
	db	4,0,0,0,212,255,255,255,33,0,0,0,200,255,255,255
	db	8,0,0,0
@@stk@%__vector$c%@at$xqqsxui	endp
@stk@%__vector$c%@at$xqqsxui	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@$xt$p20stk@__database_alias	segment virtual
	align	2
@@$xt$p20stk@__database_alias	label	dword
	dd	4
	dw	144
	dw	12
	dd	@@$xt$20stk@__database_alias
	db	115
	db	116
	db	107
	db	58
	db	58
	db	95
	db	95
	db	100
	db	97
	db	116
	db	97
	db	98
	db	97
	db	115
	db	101
	db	95
	db	97
	db	108
	db	105
	db	97
	db	115
	db	32
	db	42
	db	0
	db	1	dup(?)
@$xt$p20stk@__database_alias	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
@stk@__database_alias@3	segment virtual
	align	2
@@stk@__database_alias@3	label	byte
	dd	@@$xt$20stk@__database_alias
	dd	0
	dd	0
	dd	@@stk@__database_alias@$bdtr$qqsv
	dd	@@stk@%__vector$c%@cleared$qqsv
	db	1	dup(?)
@stk@__database_alias@3	ends
_DATA	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iefpckia	label	dword
	dd	140
	db	1	dup(?)
	align	4
$iifpckia	label	qword
	db	8	dup(?)
	db	1	dup(?)
$mgbhdkia	label	byte
	db	0
	db	1	dup(?)
	align	4
$imfpckia	label	dword
	dd	1
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTXZH$@stk@%__vector$c%@cleared$qqsv	segment virtual
	align	2
@@_$ECTXZH$@stk@%__vector$c%@cleared$qqsv	label	dword
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
@_$ECTXZH$@stk@%__vector$c%@cleared$qqsv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@%__vector$c%@cleared$qqsv	segment virtual
	align	2
@@stk@%__vector$c%@cleared$qqsv	proc	near
?live16438@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-72
	push      ebx
	mov       dword ptr [ebp-8],offset @223+8
@224:
	push      16
	push      dword ptr [ebp+8]
	call      _CG_THIS
	mov       eax,offset @@_$ECTXZH$@stk@%__vector$c%@cleared$qqsv
	call      @__InitExceptBlockLDTC
	cmp       byte ptr [$mgbhdkia],0
	jne       short @225
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-68],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-64],edx
	fild      qword ptr [ebp-68]
	fadd      qword ptr [@223]
	fstp      qword ptr [$iifpckia]
	inc       byte ptr [$mgbhdkia]
@225:
	mov       ebx,offset s@+2035
	push      47
	push      ebx
	call      @@stk@cstr@chrr$qqspxcxc
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	cmp       dword ptr [ebp-52],0
	jne       short @227
	cmp       dword ptr [ebp-56],0
	jae       short @226
	jmp short @228
@227:
	jge       short @226
@228:
	push      92
	push      ebx
	call      @@stk@cstr@chrr$qqspxcxc
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
@226:
	cmp       dword ptr [ebp-52],0
	jne       short @230
	cmp       dword ptr [ebp-56],0
	jae       short @229
	jmp short @231
@230:
	jge       short @229
@231:
	mov       eax,ebx
	jmp short @232
@229:
	mov       dword ptr [ebp-76],ebx
	mov       eax,dword ptr [ebp-56]
	inc       eax
	add       eax,ebx
	push      dword ptr [ebp-76]
	push      eax
	call      _CG_A_BP
@232:
	inc       dword ptr [$imfpckia]
	mov       edx,dword ptr [$imfpckia]
	push      edx
	push      140
	push      offset s@+2126
	push      eax
	push      offset s@+2073
	call      @@stk@con@prints$qpxce
	add       esp,20
	mov       ecx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],ecx
@233:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret       4
	align 4        
@223:
	db	0,0,0,0,0,0,224,67,67,71,83,0
	dd @@stk@%__vector$c%@cleared$qqsv+0
	dd @223+0
	db	180,255,255,255,12,0,0,0,3,0,0,0,8,0,0,0
	db	4,0,0,0,212,255,255,255,33,0,0,0,200,255,255,255
	db	8,0,0,0
@@stk@%__vector$c%@cleared$qqsv	endp
@stk@%__vector$c%@cleared$qqsv	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@$xt$20stk@__database_alias	segment virtual
	align	2
@@$xt$20stk@__database_alias	label	byte
	dd	28
	dw	3
	dw	48
	dd	12
	dd	119
	dw	72
	dw	88
	dd	0
	dw	0
	dw	0
	dd	0
	dd	3
	dd	3
	dd	@@stk@__database_alias@$bdtr$qqsv
	dw	5
	dw	92
	db	115
	db	116
	db	107
	db	58
	db	58
	db	95
	db	95
	db	100
	db	97
	db	116
	db	97
	db	98
	db	97
	db	115
	db	101
	db	95
	db	97
	db	108
	db	105
	db	97
	db	115
	db	0
	db	0
	db	0
	dd	@@$xt$16stk@__cstr_class
	dd	0
	dd	3
	dd	0
	dd	0
	dd	0
	db	1	dup(?)
@$xt$20stk@__database_alias	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@$xt$16stk@__cstr_class	segment virtual
	align	2
@@$xt$16stk@__cstr_class	label	byte
	dd	28
	dw	3
	dw	48
	dd	12
	dd	119
	dw	68
	dw	84
	dd	0
	dw	0
	dw	0
	dd	0
	dd	2
	dd	2
	dd	@@stk@__cstr_class@$bdtr$qqsv
	dw	5
	dw	88
	db	115
	db	116
	db	107
	db	58
	db	58
	db	95
	db	95
	db	99
	db	115
	db	116
	db	114
	db	95
	db	99
	db	108
	db	97
	db	115
	db	115
	db	0
	db	0
	db	0
	dd	@@$xt$16stk@%__vector$c%
	dd	0
	dd	3
	dd	0
	dd	0
	dd	0
	db	1	dup(?)
@$xt$16stk@__cstr_class	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@$xt$16stk@%__vector$c%	segment virtual
	align	2
@@$xt$16stk@%__vector$c%	label	byte
	dd	16
	dw	3
	dw	48
	dd	12
	dd	115
	dw	68
	dw	72
	dd	0
	dw	0
	dw	0
	dd	0
	dd	1
	dd	1
	dd	@@stk@%__vector$c%@$bdtr$qqsv
	dw	5
	dw	76
	db	115
	db	116
	db	107
	db	58
	db	58
	db	95
	db	95
	db	118
	db	101
	db	99
	db	116
	db	111
	db	114
	db	60
	db	99
	db	104
	db	97
	db	114
	db	62
	db	0
	dd	0
	dd	0
	dd	0
	db	1	dup(?)
@$xt$16stk@%__vector$c%	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iegpckia	label	dword
	dd	76
	db	1	dup(?)
	align	4
$iigpckia	label	qword
	db	8	dup(?)
	db	1	dup(?)
$anchdkia	label	byte
	db	0
	db	1	dup(?)
	align	4
$imgpckia	label	dword
	dd	1
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTYZH$@stk@%__vector$c%@$bdtr$qqsv	segment virtual
	align	2
@@_$ECTYZH$@stk@%__vector$c%@$bdtr$qqsv	label	dword
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
@_$ECTYZH$@stk@%__vector$c%@$bdtr$qqsv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@%__vector$c%@$bdtr$qqsv	segment virtual
	align	2
@@stk@%__vector$c%@$bdtr$qqsv	proc	near
?live16442@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-72
	push      ebx
	push      esi
	mov       dword ptr [ebp-8],offset @234+8
@235:
	mov       ebx,dword ptr [ebp+8]
	push      16
	push      ebx
	call      _CG_DTORTHIS
	mov       eax,offset @@_$ECTYZH$@stk@%__vector$c%@$bdtr$qqsv
	call      @__InitExceptBlockLDTC
	test      ebx,ebx
	je        @237
	push      offset @@stk@%__vector$c%@3
	push      offset @@stk@%__vector$c%@3+12
	call      _CG_GA_BP
	push      1
	push      offset @@stk@%__vector$c%@3
	push      12
	call      _CG_GDA_EGY
	mov       edx,offset @@stk@%__vector$c%@3+12
	push      4
	push      ebx
	push      12
	call      _CG_DA_EPY
	mov       dword ptr [ebx+12],edx
?live16442@16: ; EBX = this
	cmp       byte ptr [$anchdkia],0
	jne       short @238
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-68],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-64],edx
	fild      qword ptr [ebp-68]
	fadd      qword ptr [@234]
	fstp      qword ptr [$iigpckia]
	inc       byte ptr [$anchdkia]
@238:
	mov       esi,offset s@+2127
	push      47
	push      esi
	call      @@stk@cstr@chrr$qqspxcxc
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	cmp       dword ptr [ebp-52],0
	jne       short @240
	cmp       dword ptr [ebp-56],0
	jae       short @239
	jmp short @241
@240:
	jge       short @239
@241:
	push      92
	push      esi
	call      @@stk@cstr@chrr$qqspxcxc
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
@239:
	cmp       dword ptr [ebp-52],0
	jne       short @243
	cmp       dword ptr [ebp-56],0
	jae       short @242
	jmp short @244
@243:
	jge       short @242
@244:
	mov       eax,esi
	jmp short @245
@242:
	mov       dword ptr [ebp-76],esi
	mov       eax,dword ptr [ebp-56]
	inc       eax
	add       eax,esi
	push      dword ptr [ebp-76]
	push      eax
	call      _CG_A_BP
@245:
	inc       dword ptr [$imgpckia]
	mov       edx,dword ptr [$imgpckia]
	push      edx
	push      76
	push      offset s@+2218
	push      eax
	push      offset s@+2165
	call      @@stk@con@prints$qpxce
	add       esp,20
	push      0
	push      ebx
	call      @@stk@%__vector$c%@resize$qqsxui
	test      byte ptr [ebp+12],1
	je        short @246
	mov       eax,ebx
	push      eax
	call      @@stk@mem@free$qqspv
?live16442@48: ; 
@246:
@237:
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
@247:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret       8
	align 4        
@234:
	db	0,0,0,0,0,0,224,67,67,71,83,0
	dd @@stk@%__vector$c%@$bdtr$qqsv+0
	dd @234+0
	db	180,255,255,255,16,0,0,0,3,0,0,0,12,0,0,0
	db	4,0,0,0,212,255,255,255,33,0,0,0,200,255,255,255
	db	8,0,0,0
@@stk@%__vector$c%@$bdtr$qqsv	endp
@stk@%__vector$c%@$bdtr$qqsv	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@stk@%__vector$c%@resize$qqsxui	segment virtual
	align	2
@@stk@%__vector$c%@resize$qqsxui	proc	near
?live16444@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	push      ecx
	mov       dword ptr [ebp-8],offset @248
@249:
	mov       eax,dword ptr [ebp+8]
	push      16
	push      eax
	call      _CG_THIS
?live16444@16: ; EAX = this
	mov       edx,dword ptr [ebp+12]
	push      edx
	push      eax
	call      @@stk@%__vector$c%@set_size$qqsxui
?live16444@32: ; 
@251:
@250:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       ecx
	pop       ecx
	pop       ebp
	ret       8
	align 4        
@248:
	db	67,71,83,0
	dd @@stk@%__vector$c%@resize$qqsxui+0
	dd @248+0
	db	248,255,255,255,16,0,0,0,1,0,0,0,12,0,0,0
	db	4,0,0,0
@@stk@%__vector$c%@resize$qqsxui	endp
@stk@%__vector$c%@resize$qqsxui	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
	align	4
$iehpckia	label	dword
	dd	112
	db	1	dup(?)
	align	4
$iihpckia	label	qword
	db	8	dup(?)
	db	1	dup(?)
$afdhdkia	label	byte
	db	0
	db	1	dup(?)
	align	4
$imhpckia	label	dword
	dd	1
	db	1	dup(?)
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTZZH$@stk@%__vector$c%@set_size$qqsxui	segment virtual
	align	2
@@_$ECTZZH$@stk@%__vector$c%@set_size$qqsxui	label	dword
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
@_$ECTZZH$@stk@%__vector$c%@set_size$qqsxui	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@stk@%__vector$c%@set_size$qqsxui	segment virtual
	align	2
@@stk@%__vector$c%@set_size$qqsxui	proc	near
?live16445@0:
	push      ebp
	mov       ebp,esp
	push      5457731
	add       esp,-72
	push      ebx
	push      esi
	push      edi
	mov       dword ptr [ebp-8],offset @252+8
@253:
	mov       esi,dword ptr [ebp+12]
	mov       ebx,dword ptr [ebp+8]
	push      16
	push      ebx
	call      _CG_THIS
	mov       eax,offset @@_$ECTZZH$@stk@%__vector$c%@set_size$qqsxui
	call      @__InitExceptBlockLDTC
?live16445@16: ; EBX = this, ESI = a_new_size
	cmp       byte ptr [$afdhdkia],0
	jne       short @254
	call      @@stk@time@time_ms$qqsv
	mov       dword ptr [ebp-68],eax
	sub       edx,-2147483648
	mov       dword ptr [ebp-64],edx
	fild      qword ptr [ebp-68]
	fadd      qword ptr [@252]
	fstp      qword ptr [$iihpckia]
	inc       byte ptr [$afdhdkia]
@254:
	mov       edi,offset s@+2219
	push      47
	push      edi
	call      @@stk@cstr@chrr$qqspxcxc
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
	cmp       dword ptr [ebp-52],0
	jne       short @256
	cmp       dword ptr [ebp-56],0
	jae       short @255
	jmp short @257
@256:
	jge       short @255
@257:
	push      92
	push      edi
	call      @@stk@cstr@chrr$qqspxcxc
	mov       dword ptr [ebp-56],eax
	mov       dword ptr [ebp-52],edx
@255:
	cmp       dword ptr [ebp-52],0
	jne       short @259
	cmp       dword ptr [ebp-56],0
	jae       short @258
	jmp short @260
@259:
	jge       short @258
@260:
	mov       eax,edi
	jmp short @261
@258:
	mov       dword ptr [ebp-76],edi
	mov       eax,dword ptr [ebp-56]
	inc       eax
	add       eax,edi
	push      dword ptr [ebp-76]
	push      eax
	call      _CG_A_BP
@261:
	inc       dword ptr [$imhpckia]
	mov       edx,dword ptr [$imhpckia]
	push      edx
	push      112
	push      offset s@+2310
	push      eax
	push      offset s@+2257
	call      @@stk@con@prints$qpxce
	add       esp,20
	push      4
	push      ebx
	push      4
	call      _CG_DA_EPY
	cmp       esi,dword ptr [ebx+4]
	jne       short @262
?live16445@48: ; ESI = a_new_size
@263:
	mov       eax,esi
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
	jmp @264
?live16445@64: ; EBX = this, ESI = a_new_size
@265:
	jmp short @266
@262:
	push      4
	push      ebx
	push      4
	call      _CG_DA_EPY
	cmp       dword ptr [ebx+4],0
	jne       short @267
@268:
	push      esi
	call      @@stk@mem@alloc$qqsxui
	push      4
	push      ebx
	push      8
	call      _CG_DA_EPY
	mov       dword ptr [ebx+8],eax
@269:
	jmp short @266
@267:
	test      esi,esi
	jne       short @270
@271:
	push      4
	push      ebx
	push      8
	call      _CG_DA_EPY
	mov       ecx,dword ptr [ebx+8]
	push      ecx
	call      @@stk@mem@free$qqspv
	push      4
	push      ebx
	push      8
	call      _CG_DA_EPY
	xor       ecx,ecx
	mov       dword ptr [ebx+8],ecx
@272:
	jmp short @266
@270:
@273:
	push      esi
	push      4
	push      ebx
	push      8
	call      _CG_DA_EPY
	mov       eax,dword ptr [ebx+8]
	push      eax
	call      @@stk@mem@realloc$qqspvxui
	push      4
	push      ebx
	push      8
	call      _CG_DA_EPY
	mov       dword ptr [ebx+8],eax
@274:
@266:
	push      4
	push      ebx
	push      4
	call      _CG_DA_EPY
	mov       dword ptr [ebx+4],esi
?live16445@224: ; ESI = a_new_size
	mov       eax,esi
	mov       edx,dword ptr [ebp-44]
	mov       dword ptr fs:[0],edx
?live16445@240: ; 
@275:
@264:
	mov       dword ptr [ebp-4],ebp
	mov       dword ptr [ebp-4],ebp
	pop       edi
	pop       esi
	pop       ebx
	mov       esp,ebp
	pop       ebp
	ret       8
	align 4        
@252:
	db	0,0,0,0,0,0,224,67,67,71,83,0
	dd @@stk@%__vector$c%@set_size$qqsxui+0
	dd @252+0
	db	180,255,255,255,16,0,0,0,2,0,0,0,212,255,255,255
	db	33,0,0,0,200,255,255,255,8,0,0,0
@@stk@%__vector$c%@set_size$qqsxui	endp
@stk@%__vector$c%@set_size$qqsxui	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
@stk@%__vector$c%@3	segment virtual
	align	2
@@stk@%__vector$c%@3	label	byte
	dd	@@$xt$16stk@%__vector$c%
	dd	0
	dd	0
	dd	@@stk@%__vector$c%@$bdtr$qqsv
	dd	@@stk@%__vector$c%@cleared$qqsv
	db	1	dup(?)
@stk@%__vector$c%@3	ends
_DATA	ends
_DATA	segment dword public use32 'DATA'
	align	2
s@	label	byte
	;	s@+0:
	db	"C",0
	;	s@+2:
	db	"pause",0
	;	s@+8:
	db	"COLOR A",0
	;	s@+16:
	db	"ALLOCATING VARIABLES...",10,0
	;	s@+41:
	db	"RAM buffer size %lldMB",10,0
	;	s@+65:
	db	"Number of chunks in random mode RANDOM_TIME < %lld",10,0
	;	s@+117:
	db	"RUNNING TESTS:",10,0
	;	s@+133:
	db	"stk::cpu::cpu_test();",10,0
	;	s@+156:
	db	"WORKING...",10,0
	;	s@+168:
	db	"TIME=%ldms",10,0
	;	s@+180:
	db	"reed=%ld mem speed %5.2lfMB/s",10,0
	;	s@+211:
	db	"#",0,10,0
	;	s@+215:
	db	"%ld CPU ticks, %lld cpu ticks per milisecond",13,10,10,0
	;	s@+263:
	db	"[  %d]",9,0
	;	s@+271:
	db	"CRC32 OK",10,0
	;	s@+281:
	db	"[  %d]",9,0
	;	s@+289:
	db	"stk::hash::crc32::calc_CRC32(test_in,TEST_SIZE,0);",10,0
	;	s@+341:
	db	"WORKING...",10,0
	;	s@+353:
	db	"TIME=%ldms",10,0
	;	s@+365:
	db	"reed=%ld mem speed %5.2lfMB/s",10,0
	;	s@+396:
	db	"#",0,10,0
	;	s@+400:
	db	"%ld CPU ticks, %lld cpu ticks per milisecond",13,10,10,0
	;	s@+448:
	db	"[  %d]",9,0
	;	s@+456:
	db	"stk::hash::crc32::calc_CRC32_bitwise(test_in,TEST_SIZE,0);"
	db	10,0
	;	s@+516:
	db	"WORKING...",10,0
	;	s@+528:
	db	"TIME=%ldms",10,0
	;	s@+540:
	db	"reed=%ld mem speed %5.2lfMB/s",10,0
	;	s@+571:
	db	"#",0,10,0
	;	s@+575:
	db	"%ld CPU ticks, %lld cpu ticks per milisecond",13,10,10,0
	;	s@+623:
	db	"[  %d]",9,0
	;	s@+631:
	db	"stk::hash::adler32::calc_ADLER32(test_in,TEST_SIZE);",10,0
	;	s@+685:
	db	"WORKING...",10,0
	;	s@+697:
	db	"TIME=%ldms",10,0
	;	s@+709:
	db	"reed=%ld mem speed %5.2lfMB/s",10,0
	;	s@+740:
	db	"#",0,10,0
	;	s@+744:
	db	"%ld CPU ticks, %lld cpu ticks per milisecond",13,10,10,0
	;	s@+792:
	db	"memmove(test_out,test_in,TEST_SIZE);",10,0
	;	s@+830:
	db	"WORKING...",10,0
	;	s@+842:
	db	"TIME=%ldms",10,0
	;	s@+854:
	db	"reed=%ld mem speed %5.2lfMB/s",10,0
	;	s@+885:
	db	"#",0,10,0
	;	s@+889:
	db	"%ld CPU ticks, %lld cpu ticks per milisecond",13,10,10,0
	;	s@+937:
	db	"stk::mem::mov(test_out,test_in,TEST_SIZE);",10,0
	;	s@+981:
	db	"WORKING...",10,0
	;	s@+993:
	db	"TIME=%ldms",10,0
	;	s@+1005:
	db	"reed=%ld mem speed %5.2lfMB/s",10,0
	;	s@+1036:
	db	"#",0,10,0
	;	s@+1040:
	db	"%ld CPU ticks, %lld cpu ticks per milisecond",13,10,10,0
	;	s@+1088:
	db	"for (RANDOM_TIME = 0; RANDOM_TIME < RANDOM_TIMES; RANDOM_TI"
	;	s@+1147:
	db	"ME++) { memmove(&test_out[(RANDOM_TIME*TEST_SIZE)/RANDOM_TI"
	;	s@+1206:
	db	"MES],&test_in[((RANDOM_TIME*TEST_SIZE)/RANDOM_TIMES)],TEST_"
	;	s@+1265:
	db	"SIZE/RANDOM_TIMES); }",10,0
	;	s@+1288:
	db	"WORKING...",10,0
	;	s@+1300:
	db	"TIME=%ldms",10,0
	;	s@+1312:
	db	"reed=%ld mem speed %5.2lfMB/s",10,0
	;	s@+1343:
	db	"#",0,10,0
	;	s@+1347:
	db	"%ld CPU ticks, %lld cpu ticks per milisecond",13,10,10,0
	;	s@+1395:
	db	"for (RANDOM_TIME = 0; RANDOM_TIME < RANDOM_TIMES; RANDOM_TI"
	;	s@+1454:
	db	"ME++) { stk::mem::mov(&test_out[(RANDOM_TIME*TEST_SIZE)/RAN"
	;	s@+1513:
	db	"DOM_TIMES],&test_in[(RANDOM_TIME*TEST_SIZE)/RANDOM_TIMES],T"
	;	s@+1572:
	db	"EST_SIZE/RANDOM_TIMES); }",10,0
	;	s@+1599:
	db	"WORKING...",10,0
	;	s@+1611:
	db	"TIME=%ldms",10,0
	;	s@+1623:
	db	"reed=%ld mem speed %5.2lfMB/s",10,0
	;	s@+1654:
	db	"#",0,10,0
	;	s@+1658:
	db	"%ld CPU ticks, %lld cpu ticks per milisecond",13,10,10,0
	;	s@+1706:
	db	"Thank's for help :)",10,0
	;	s@+1727:
	db	"betweeen(a,b,c,d) begin { between_be } end",0,34
	;	s@+1771:
	db	"%s",34,10,0
	;	s@+1776:
	db	"not found between",10,0
	;	s@+1795:
	db	"begin",0
	;	s@+1801:
	db	"end",0,34
	;	s@+1806:
	db	"%s",34,10,0
	;	s@+1811:
	db	"not found between",10,0
	;	s@+1830:
	db	"1",0
	;	s@+1832:
	db	"0",0
	;	s@+1834:
	db	"%c",0
	;	s@+1837:
	db	"%s",0
	;	s@+1840:
	db	"%d",0
	;	s@+1843:
	db	"%lld",0
	;	s@+1848:
	db	"%f",0
	;	s@+1851:
	db	"./koperek/./../text/./../stk_vector.h",0
	;	s@+1889:
	db	"DEBUG: %s: Enter function: %s@%d line, for %d time",10,0
	db	0,0
	;	s@+1943:
	db	"./koperek/./../text/./../stk_vector.h",0
	;	s@+1981:
	db	"DEBUG: %s: Enter function: %s@%d line, for %d time",10,0
	db	0,0
	;	s@+2035:
	db	"./koperek/./../text/./../stk_vector.h",0
	;	s@+2073:
	db	"DEBUG: %s: Enter function: %s@%d line, for %d time",10,0
	db	0,0
	;	s@+2127:
	db	"./koperek/./../text/./../stk_vector.h",0
	;	s@+2165:
	db	"DEBUG: %s: Enter function: %s@%d line, for %d time",10,0
	db	0,0
	;	s@+2219:
	db	"./koperek/./../text/./../stk_vector.h",0
	;	s@+2257:
	db	"DEBUG: %s: Enter function: %s@%d line, for %d time",10,0
	db	0,0
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
	dd	$iedpckia
	dd	4
	dd	4
	dd	$iidpckia
	dd	8
	dd	1
	dd	$mcahdkia
	dd	1
	dd	2
	dd	$imdpckia
	dd	4
	dd	4
	dd	$ieepckia
	dd	4
	dd	4
	dd	$iiepckia
	dd	8
	dd	1
	dd	$mkahdkia
	dd	1
	dd	2
	dd	$imepckia
	dd	4
	dd	4
	dd	$iefpckia
	dd	4
	dd	4
	dd	$iifpckia
	dd	8
	dd	1
	dd	$mgbhdkia
	dd	1
	dd	2
	dd	$imfpckia
	dd	4
	dd	4
	dd	$iegpckia
	dd	4
	dd	4
	dd	$iigpckia
	dd	8
	dd	1
	dd	$anchdkia
	dd	1
	dd	2
	dd	$imgpckia
	dd	4
	dd	4
	dd	$iehpckia
	dd	4
	dd	4
	dd	$iihpckia
	dd	8
	dd	1
	dd	$afdhdkia
	dd	1
	dd	2
	dd	$imhpckia
	dd	4
	dd	2
	dd	s@
	dd	2311
	dd	3
	dd	@stk@test@i
	dd	4
	dd	1
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
 extrn __Exception_list:dword
 extrn __streams:byte
	public	@stk@test@i
@_fputs equ _fputs
 extrn _fputs:near
 extrn _CG_A_BP:near
@_getchar equ _getchar
 extrn _getchar:near
 ?debug C A00200174073746B40746573744073746B5F617465786974247176000000
@_system equ _system
 extrn _system:near
 ?debug C A002001C4073746B40746573744073746172745F746573742471717369707063000000
@@stk@cstr@len$qqspxc equ @stk@cstr@len$qqspxc
 extrn @stk@cstr@len$qqspxc:near
@@stk@mem@alloc$qqsxui equ @stk@mem@alloc$qqsxui
 extrn @stk@mem@alloc$qqsxui:near
@@stk@cstr@cat$qqspcpxc equ @stk@cstr@cat$qqspcpxc
 extrn @stk@cstr@cat$qqspcpxc:near
@_atexit equ _atexit
 extrn _atexit:near
@@stk@con@set_console_handlers$qqspqqsv$cpqqspxc$vt2 equ @stk@con@set_console_handlers$qqspqqsv$cpqqspxc$vt2
 extrn @stk@con@set_console_handlers$qqspqqsv$cpqqspxc$vt2:near
@@stk@con@prints$qpxce equ @stk@con@prints$qpxce
 extrn @stk@con@prints$qpxce:near
@@stk@cpu@tsc_init$qv equ @stk@cpu@tsc_init$qv
 extrn @stk@cpu@tsc_init$qv:near
@@stk@cstr@alloc$qqsui equ @stk@cstr@alloc$qqsui
 extrn @stk@cstr@alloc$qqsui:near
@_srand equ _srand
 extrn _srand:near
@_clock equ _clock
 extrn _clock:near
@_rand equ _rand
 extrn _rand:near
@@stk@time@time_ms$qqsv equ @stk@time@time_ms$qqsv
 extrn @stk@time@time_ms$qqsv:near
@@stk@cpu@tsc_start$qv equ @stk@cpu@tsc_start$qv
 extrn @stk@cpu@tsc_start$qv:near
@@stk@cpu@cpu_test$qv equ @stk@cpu@cpu_test$qv
 extrn @stk@cpu@cpu_test$qv:near
@@stk@cpu@tsc_checkpoint$qv equ @stk@cpu@tsc_checkpoint$qv
 extrn @stk@cpu@tsc_checkpoint$qv:near
@@stk@con@printr$qpxcxc equ @stk@con@printr$qpxcxc
 extrn @stk@con@printr$qpxcxc:near
@@stk@cpu@tsc_elapsed$qv equ @stk@cpu@tsc_elapsed$qv
 extrn @stk@cpu@tsc_elapsed$qv:near
@@stk@hash@crc32@test_CRC32$qqso equ @stk@hash@crc32@test_CRC32$qqso
 extrn @stk@hash@crc32@test_CRC32$qqso:near
@@stk@hash@crc32@calc_CRC32$qqspxvxuixui equ @stk@hash@crc32@calc_CRC32$qqspxvxuixui
 extrn @stk@hash@crc32@calc_CRC32$qqspxvxuixui:near
@@stk@hash@crc32@calc_CRC32_bitwise$qqspxvxuixui equ @stk@hash@crc32@calc_CRC32_bitwise$qqspxvxuixui
 extrn @stk@hash@crc32@calc_CRC32_bitwise$qqspxvxuixui:near
@@stk@hash@adler32@calc_ADLER32$qqspxvxui equ @stk@hash@adler32@calc_ADLER32$qqspxvxui
 extrn @stk@hash@adler32@calc_ADLER32$qqspxvxui:near
@_memmove equ _memmove
 extrn _memmove:near
@@stk@mem@mov$qqspvpxvxui equ @stk@mem@mov$qqspvpxvxui
 extrn @stk@mem@mov$qqspvpxvxui:near
@@stk@cstr@free$qqspc equ @stk@cstr@free$qqspc
 extrn @stk@cstr@free$qqspc:near
@@stk@cstr@between_cc$qqspcpxcxcxc equ @stk@cstr@between_cc$qqspcpxcxcxc
 extrn @stk@cstr@between_cc$qqspcpxcxcxc:near
@@stk@cstr@between_words$qqspcpxct2t2 equ @stk@cstr@between_words$qqspcpxct2t2
 extrn @stk@cstr@between_words$qqspcpxct2t2:near
@@stk@mem@free$qqspv equ @stk@mem@free$qqspv
 extrn @stk@mem@free$qqspv:near
 extrn _CG_DA_EPXSY:near
 extrn _CG_DA_EPY:near
 extrn _CG_A_PY:near
 extrn __llumod:near
 extrn __lludiv:near
 extrn __llmul:near
 extrn __ftol:near
@@stk@__cstr_class@set$qqspxc equ @stk@__cstr_class@set$qqspxc
 extrn @stk@__cstr_class@set$qqspxc:near
 extrn _CG_THIS:near
@@stk@cstr@itoa$qqsxi equ @stk@cstr@itoa$qqsxi
 extrn @stk@cstr@itoa$qqsxi:near
@@stk@cstr@atoi$qqspxc equ @stk@cstr@atoi$qqspxc
 extrn @stk@cstr@atoi$qqspxc:near
@@stk@__cstr_class@$bctr$qqsv equ @stk@__cstr_class@$bctr$qqsv
 extrn @stk@__cstr_class@$bctr$qqsv:near
 extrn @__InitExceptBlockLDTC:near
 extrn _CG_GA_BP:near
 extrn _CG_GDA_EGY:near
@@stk@__cstr_class@$bctr$qqspxc equ @stk@__cstr_class@$bctr$qqspxc
 extrn @stk@__cstr_class@$bctr$qqspxc:near
@@stk@__cstr_class@$bdtr$qqsv equ @stk@__cstr_class@$bdtr$qqsv
 extrn @stk@__cstr_class@$bdtr$qqsv:near
 extrn _CG_DTORTHIS:near
@@stk@__journal@write_formated_line$qpxce equ @stk@__journal@write_formated_line$qpxce
 extrn @stk@__journal@write_formated_line$qpxce:near
@@stk@cstr@chrr$qqspxcxc equ @stk@cstr@chrr$qqspxcxc
 extrn @stk@cstr@chrr$qqspxcxc:near
@@stk@mem@realloc$qqspvxui equ @stk@mem@realloc$qqspvxui
 extrn @stk@mem@realloc$qqspvxui:near
 extrn _CG_DESC:near
	extrn	__turboFloat:word
	?debug	D "c:\program files\embarcadero\studio\18.0\include\../include/dinkumware/iostream" 18794 3808
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost\tr1\tr1\iostream" 15056 37002
	?debug	D "./io/stk_console.h" 19625 41889
	?debug	D "./process_journal/stk_journal.h" 19653 35517
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/function/function_template.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/function/detail/maybe_include.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/function/detail/function_iterate.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/enum_params.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/enum.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/function/function_fwd.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/function_equal.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/utility/enable_if.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/alignment_of.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/is_void.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/is_same.hpp" 15480 6522
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/intrinsics.hpp" 15480 6522
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/is_union.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/is_reference.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/is_pointer.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/detail/type_trait_undef.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/detail/type_trait_def.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/broken_compiler_spec.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/remove_cv.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/detail/is_mem_fun_pointer_impl.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/is_member_function_pointer.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/is_member_pointer.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/is_enum.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/config.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/is_array.hpp" 16097 9167
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/composite_traits.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/is_volatile.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/is_integral.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/detail/bool_trait_undef.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/detail/template_arity_spec.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/detail/bool_trait_def.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/detail/cv_traits_impl.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/is_const.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/assert.hpp" 15056 37002
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\xlocinfo.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\ctime" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\clocale" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\cctype" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\xlocinfo" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\xdebug" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\typeinfo.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\../include/dinkumware/typeinfo" 18794 3808
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost\tr1\tr1\typeinfo" 15056 37002
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\xlocale" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\xiosbase" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\../include/dinkumware/streambuf" 18794 3808
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost\tr1\tr1\streambuf" 15056 37002
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\math.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\cmath" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\xlocnum" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\../include/dinkumware/ios" 18794 3808
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost\tr1\tr1\ios" 15056 37002
	?debug	D "c:\program files\embarcadero\studio\18.0\include\../include/dinkumware/ostream" 18794 3808
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost\tr1\tr1\ostream" 15056 37002
	?debug	D "c:\program files\embarcadero\studio\18.0\include\../include/dinkumware/istream" 18794 3808
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost\tr1\tr1\istream" 15056 37002
	?debug	D "c:\program files\embarcadero\studio\18.0\include\../include/dinkumware/string" 18794 3808
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost\tr1\tr1\string" 15056 37002
	?debug	D "c:\program files\embarcadero\studio\18.0\include\../include/dinkumware/stdexcept" 18794 3808
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost\tr1\tr1\stdexcept" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/function/function_base.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/throw_exception.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/config/no_tr1/functional.hpp" 15056 37002
	?debug	D "c:\program files\embarcadero\studio\18.0\include\../include/dinkumware/algorithm" 18794 3808
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost\tr1\tr1\algorithm" 15056 37002
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\cassert" 18794 3808
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/function/detail/prologue.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/iterate.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/function.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/bind/placeholders.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/bind/bind_mf2_cc.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/bind/bind_mf_cc.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/bind/bind_cc.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/bind/bind_template.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/bind/storage.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/visit_each.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/bind/arg.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/is_placeholder.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/bind/bind.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/bind.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/bind/mem_fn_cc.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/bind/mem_fn_template.hpp" 15056 37002
	?debug	D "c:\program files\embarcadero\studio\18.0\include\../include/dinkumware/memory" 18794 3808
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost\tr1\tr1\memory" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/config/no_tr1/memory.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/get_pointer.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/bind/mem_fn.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mem_fn.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/utility/detail/result_of_iterate.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/iteration/detail/bounds/upper1.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/slot/detail/shared.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/iteration/detail/bounds/lower1.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/iteration/detail/iter/forward1.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/lambda_support.hpp" 16097 9167
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/lambda_arity_param.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/empty.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/identity.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/limits/arity.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/preprocessor/def_params_tail.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/preprocessor/enum.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/inc.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/repeat.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/comma_if.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/config/preprocessor.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/preprocessor/params.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/template_arity_fwd.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/config/dtp.hpp" 16097 9167
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/arity.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/config/ttp.hpp" 16097 9167
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/config/lambda.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/na_fwd.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/na.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/void_fwd.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/lambda_fwd.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/na_spec.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/int_fwd.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/int.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/config/eti.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/config/integral.hpp" 16097 9167
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/value_wknd.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/if.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/static_cast.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/integral_wrapper.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/integral_c_fwd.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/integral_c.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/integral_constant.hpp" 15056 37002
	?debug	D "c:\program files\embarcadero\studio\18.0\include\../include/dinkumware/type_traits" 18794 3808
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost\tr1\tr1\type_traits" 15090 8507
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/is_class.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/config/msvc_typename.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/config/overload_resolution.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/config/has_xxx.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/config/arrays.hpp" 16097 9167
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/config/nttp.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/nttp_decl.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/yes_no.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/config/ctps.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/type_wrapper.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/has_xxx.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/tuple/to_seq.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/tuple.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/slot.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/transform.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/to_tuple.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/to_array.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/subseq.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/replace.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/remove.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/push_front.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/push_back.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/pop_front.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/pop_back.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/rest_n.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/insert.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/for_each_product.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/for_each_i.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/for_each.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/reverse.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/fold_right.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/detail/split.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/first_n.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/filter.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/enum.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/size.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/elem.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/seq.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/fold_left.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq/cat.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/seq.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/selection/min.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/selection/max.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/selection.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/repetition/repeat_from_to.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/repetition/enum_trailing_params.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/repetition/enum_trailing_binary_params.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/repetition/enum_trailing.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/repetition/enum_shifted_params.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/repetition/enum_shifted_binary_params.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/repetition/enum_shifted.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/repetition/enum_params_with_defaults.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/repetition/enum_params_with_a_default.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/repetition/enum_params.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/repetition/enum_binary_params.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/repetition/deduce_r.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/repetition.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/punctuation/paren_if.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/punctuation/paren.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/punctuation.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/logical/xor.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/logical/or.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/logical/nor.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/logical/bitxor.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/logical/bitor.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/logical/bitnor.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/logical/and.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/logical.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/list/transform.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/list/size.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/tuple/to_list.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/list/to_tuple.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/list/for_each_product.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/list/for_each.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/list/first_n.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/list/filter.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/repetition/detail/for.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/repetition/for.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/list/for_each_i.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/list/enum.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/list/cat.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/list/rest_n.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/list/at.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/list/append.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/list.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/iteration/self.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/iteration/local.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/iteration.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/facilities/intercept.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/facilities/identity.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/facilities/expand.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/detail/is_unary.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/facilities/apply.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/facilities.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/stringize.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/slot/detail/def.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/slot/slot.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/iteration/iterate.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/debug/line.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/debug/assert.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/debug.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/control/expr_if.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/control.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/config/limits.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/comparison/greater_equal.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/comparison/less.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/comparison/greater.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/comparison/equal.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/comparison.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/tuple/reverse.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/array/reverse.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/array/replace.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/array/remove.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/array/push_front.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/array/pop_front.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/repetition/deduce_z.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/repetition/repeat.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/repetition/enum.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/array/pop_back.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/control/deduce_d.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/comparison/not_equal.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/punctuation/comma.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/facilities/empty.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/control/if.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/punctuation/comma_if.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/array/push_back.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/array/insert.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/array/size.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/array/elem.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/array/data.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/array.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/arithmetic/mul.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/arithmetic/mod.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/tuple/rem.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/logical/not.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/comparison/less_equal.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/arithmetic/sub.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/arithmetic/detail/div_base.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/arithmetic/div.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/tuple/elem.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/logical/bool.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/control/detail/while.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/logical/bitand.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/list/reverse.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/list/detail/fold_right.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/list/fold_right.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/tuple/eat.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/logical/compl.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/detail/check.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/detail/is_binary.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/list/adt.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/control/expr_iif.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/list/detail/fold_left.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/list/fold_left.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/control/iif.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/detail/auto_rec.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/debug/error.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/cat.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/control/while.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/arithmetic/inc.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/config/config.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/arithmetic/dec.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/arithmetic/add.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/arithmetic.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor/library.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/preprocessor.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/detail/ice_eq.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/detail/ice_not.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/detail/ice_and.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/detail/ice_or.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/detail/yes_no_type.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/type_traits/ice.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/utility/result_of.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/config/static_constant.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/integral_c_tag.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/config/workaround.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/config/gcc.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/config/intel.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/config/msvc.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/config/adl.hpp" 16097 9167
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/aux_/adl_barrier.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/bool_fwd.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/mpl/bool.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/detail/workaround.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/utility/addressof.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/ref.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/tr1/functional.hpp" 15056 37002
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\climits" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\xutility" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\../include/dinkumware/exception" 18794 3808
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost\tr1\tr1\exception" 15056 37002
	?debug	D "c:\program files\embarcadero\studio\18.0\include\../include/dinkumware/new" 18794 3808
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost\tr1\tr1\new" 15056 37002
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\xmemory" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\xstring" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\../include/dinkumware/functional" 18794 3808
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/config/suffix.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/config/platform/win32.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/config/select_platform_config.hpp" 16997 6322
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/config/stdlib/dinkumware.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost\tr1\tr1\utility" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/config/no_tr1/utility.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/config/select_stdlib_config.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/config/compiler/codegear.hpp" 18145 25588
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/config/select_compiler_config.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/config/user.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/config.hpp" 15056 37002
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/tr1/detail/config.hpp" 16097 9167
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\xremoveref" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\xstddef" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\wchar.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\cwchar" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\cstring" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\cstdio" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\iosfwd" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\../include/dinkumware/utility" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\cstdlib" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\stddef.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\yvals.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\dinkumware\cstddef" 18794 3808
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost/tr1/detail/config_all.hpp" 16997 6322
	?debug	D "C:\Program Files\Embarcadero\Studio\18.0\include\boost_1_39\boost\tr1\tr1\functional" 15056 37002
	?debug	D "././stk_main.h" 19655 27682
	?debug	D "./stk_tree.h" 19501 44184
	?debug	D "./3D/stk_3Dvector.h" 19625 42548
	?debug	D "./stk_vector.h" 19655 27682
	?debug	D "./hash/stk_hash_ssc1.h" 19624 17749
	?debug	D "./hash/stk_hash_md5.h" 19625 42548
	?debug	D "./hash/./../stk_main.h" 19655 27682
	?debug	D "./hash/stk_hash_crc32.h" 19625 42548
	?debug	D "./hash/stk_hash_password.h" 19625 42548
	?debug	D "./hash/stk_hash_API.h" 19653 35497
	?debug	D "./cipher/./../file/eno/stk_file_lzst_header.h" 19624 18116
	?debug	D "./cipher/./../stk_main.h" 19655 27682
	?debug	D "./cipher/stk_cipher_API.h" 19625 42209
	?debug	D "./compression/./../file/eno/stk_file_lzst_header.h" 19624 18116
	?debug	D "./compression/./../stk_main.h" 19655 27682
	?debug	D "./compression/stk_compression_API.h" 19625 45772
	?debug	D "./koperek/./../io/stk_file_io.h" 19655 27428
	?debug	D "./koperek/stk_kop32_search.h" 19623 45423
	?debug	D "./koperek/stk_kop32_controler.h" 19624 17693
	?debug	D "./koperek/stk_kop32_list.h" 19624 17653
	?debug	D "./koperek/./../file/eno/./../../stk_main.h" 19655 27682
	?debug	D "./koperek/./../file/eno/stk_file_lzst_header.h" 19624 18116
	?debug	D "./koperek/./../hash/./../stk_main.h" 19655 27682
	?debug	D "./koperek/./../hash/stk_hash_password.h" 19625 42548
	?debug	D "./koperek/stk_kop32_options.h" 19625 21679
	?debug	D "./koperek/./../database/./../text/stk_cstr_utils.h" 19629 48806
	?debug	D "./koperek/./../database/stk_database_items.h" 19624 17610
	?debug	D "./koperek/./../database/./../text/stk_cstr_class.h" 19625 37446
	?debug	D "./koperek/./../database/stk_database_alias.h" 19623 38331
	?debug	D "./koperek/./../database/./../stk_main.h" 19655 27682
	?debug	D "./koperek/./../database/stk_database.h" 19653 36045
	?debug	D "./koperek/./../text/./.././io/./../stk_main.h" 19655 27682
	?debug	D "./koperek/./../text/./.././io/stk_console.h" 19625 41889
	?debug	D "./koperek/./../text/./.././text/stk_cstr_utils.h" 19629 48806
	?debug	D "./koperek/./../text/./.././mem/stk_mem.h" 19625 41929
	?debug	D "./koperek/./../text/./../stk_vector.h" 19655 27682
	?debug	D "./koperek/./../text/./stk_cstr_utils.h" 19629 48806
	?debug	D "./koperek/./../text/stk_cstr_class.h" 19625 37446
	?debug	D "./koperek/./../text/./../stk_main.h" 19655 27682
	?debug	D "./koperek/./../text/stk_cstr_stack.h" 19624 18050
	?debug	D "./koperek/stk_kop32_class.h" 19625 21636
	?debug	D "./koperek/./../stk_main.h" 19655 27682
	?debug	D "./koperek/stk_kop32_API.h" 19625 42548
	?debug	D "./time/stk_time.h" 19650 24116
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\_lim.h" 18794 3808
	?debug	D "c:\program files\embarcadero\studio\18.0\include\windows\crtl\limits.h" 18794 3808
	?debug	D "./threads/./../cpu/stk_cpu.h" 19623 33464
	?debug	D "./threads/./../time/stk_time.h" 19650 24116
	?debug	D "./threads/./../stk_main.h" 19655 27682
	?debug	D "./threads/stk_threads.h" 19653 34830
	?debug	D "./cpu/./../stk_main.h" 19655 27682
	?debug	D "./cpu/stk_cpu.h" 19623 33464
	?debug	D "./mem/stk_mem.h" 19625 41929
	?debug	D "./text/stk_cstr_utils.h" 19629 48806
	?debug	D "D:\x86_libraries\STK\./stasm/stk_stasm.h" 19650 23886
	?debug	D "D:\x86_libraries\STK\./text/./../mem/./../stk_main.h" 19655 27682
	?debug	D "D:\x86_libraries\STK\./text/./../mem/stk_mem.h" 19625 41929
	?debug	D "D:\x86_libraries\STK\./text/./../stk_main.h" 19655 27682
	?debug	D "D:\x86_libraries\STK\./text/stk_cstr_utils.h" 19629 48806
	?debug	D "D:\x86_libraries\STK\./time/stk_time.h" 19650 24116
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
	?debug	D "D:\x86_libraries\STK\stk_main.h" 19655 27682
	?debug	D "stk_test.h" 19653 35507
	?debug	D "stk_test.cpp" 19655 27444
	end
