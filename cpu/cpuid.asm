section .rodata
.align 4
asm_data: .byte2 0x1234

.text;
.align 4;
.global _asm_function;
.extern _c_func;
_asm_function:

		link 8;

	[--SP] = R0;
	[--SP] = RETS;

	P0.L = asm_data;
	P0.H = asm_data;
	R0 = [P0];

	CALL _c_func;

	RETS = [SP++];
	R0 = [SP++];

	unlink;

	RTS;


;=========================================================================================================
;                                            Procek.asm
;     				Program pokazuje informacje dotyczace procesora
;
;                                                                       Autor: HaRv3sTeR
;                                                                       Testowany na TASM
;									Ostatnia aktualizacja: 31/8/2001
;                                                                       Pierwsza aktualizacja: 30/8/2001
;=========================================================================================================
.586			; dzieki tej dyrektywie mozna bedzie korzystac z CPUID
;-----------------------------------|
;       Pocz¹tek segmentu stosu     |
;-----------------------------------|
MyStack   Segment Stack
		  DB  64 DUP ('StAcK!!!')
MyStack   EndS
;-----------------------------------|
;       Koniec segmentu stosu       |
;-----------------------------------|

;-----------------------------------|
;       Pocz¹tek segmentu danych    |
;-----------------------------------|
Mydata    Segment
Procek8086		DB  "Procesor: 8086 lub 8088 ",'$'
Procek286		DB  "Procesor: 286 ",'$'
Procek386		DB  "Procesor: 386 ",'$'
Procek386Intel		DB  "Procesor: Intel 386 ",'$'
Procek386AMD		DB  "Procesor: AMD 386 ",'$'
Procek386Cyrix		DB  "Procesor: Cyrix 386 ",'$'
Procek486		DB  "Procesor: 486 ",'$'
Procek486DX		DB  "Procesor: Intel 486 DX-25/33 ",'$'
Procek486DX50		DB  "Procesor: Intel 486 DX-50 ",'$'
Procek486SX		DB  "Procesor: Intel 486 SX ",'$'
Procek486DX2		DB  "Procesor: Intel 486 DX/2 ",'$'
Procek486SL		DB  "Procesor: Intel 486 SL ",'$'
Procek486SX2		DB  "Procesor: Intel 486 SX/2 ",'$'
Procek486DX2WB		DB  "Procesor: Intel 486 DX/2-WB ",'$'
Procek486DX4		DB  "Procesor: Intel 486 DX/4 ",'$'
Procek486DX4WB		DB  "Procesor: Intel 486 DX/4-WB ",'$'
Procek486AMD2		DB  "Procesor: AMD 486 DX/2 ",'$'
Procek486AMD2WB		DB  "Procesor: AMD 486 DX/2-WB ",'$'
Procek486AMD4		DB  "Procesor: AMD 486 DX/4 ",'$'
Procek486AMD4WB		DB  "Procesor: AMD 486 DX/4-WB ",'$'
Procek486Cyrix		DB  "Procesor: Cyrix Cx486 ",'$'
Procek586		DB  "Procesor: (586) Intel Pentium 60/66 ",'$'
Procek58675		DB  "Procesor: (586) Intel Pentium 75-200 ",'$'
Procek586OverDrive	DB  "Procesor: (586) Intel Pentium OverDrive PODP5V83 ",'$'
Procek586MMX		DB  "Procesor: (586) Intel Pentium MMX ",'$'
Procek586Mobile		DB  "Procesor: (586) Intel Mobile Pentium ",'$'
Procek586MobileMMX	DB  "Procesor: (586) Intel Mobile Pentium MMX ",'$'
Procek586K50		DB  "Procesor: (586) AMD K5 (Model 0 K5/SSA5) ",'$'
Procek586K51		DB  "Procesor: (586) AMD K5 (Model 1 K5) ",'$'
Procek586K52		DB  "Procesor: (586) AMD K5 (Model 2 AMDAm5x86-WT) ",'$'
Procek586K53		DB  "Procesor: (586) AMD K5 (Model 3 AMDAm5x86-WB) ",'$'
Procek586Cyrix		DB  "Procesor: (586) Cyrix M1 ",'$'
Procek586IDT		DB  "Procesor: (586) IDT WinChip 2 ",'$'
Procek586IDTA		DB  "Procesor: (586) IDT WinChip 2 Rev. A ",'$'
Procek586Transmeta	DB  "Procesor: (586) Transmeta Crusoe TM5xxx ",'$'
Procek586Transmeta5400	DB  "Procesor: (586) Transmeta Crusoe TM5400 ",'$'
Procek586Transmeta5600	DB  "Procesor: (586) Transmeta Crusoe TM5600 ",'$'
Procek586Transmeta5800	DB  "Procesor: (586) Transmeta Crusoe TM5800 ",'$'
Procek686PRO		DB  "Procesor: (686) Intel Pentium PRO ",'$'
Procek686Pierwszy	DB  "Procesor: (686) Intel Penitum II (P6L Klamath) ",'$'
Procek686		DB  "Procesor: (686) Intel Pentium II (P6L Deschutes) ",'$'
Procek686PIIM		DB  "Procesor: (686) Intel Pentium II Mobile ",'$'
Procek686Celeron	DB  "Procesor: (686) Intel Celeron (P6C Mendocino) ",'$'
Procek686CM		DB  "Procesor: (686) Intel Celeron Mobile ",'$'
Procek686XEON		DB  "Procesor: (686) Intel Pentium II Xeon ",'$'
Procek686III		DB  "Procesor: (686) Intel Pentium III (P6K Katmai) ",'$'
Procek686IIIXEON	DB  "Procesor: (686) Intel Pentium III Xeon ",'$'
Procek686K66		DB  "Procesor: (686) AMD K6 (Model 6) ",'$'
Procek686K67		DB  "Procesor: (686) AMD K6 (Model 7) ",'$'
Procek686K68		DB  "Procesor: (686) AMD K6-2 (Model 8) ",'$'
Procek686K69		DB  "Procesor: (686) AMD K6-III (Model 9) ",'$'
Procek686K62		DB  "Procesor: (686) AMD K6-II+ (Model D) ",'$'
Procek686K6III		DB  "Procesor: (686) AMD K6-III+ (Model D) ",'$'
Procek686Cyrix		DB  "Procesor: (686) Cyrix 6x86MX ",'$'
Procek686CyrixGX	DB  "Procesor: (686) Cyrix MediaGX ",'$'
Procek686CyrixMX	DB  "Procesor: (686) Cyrix 6x86MX ",'$'
Procek686CyrixMII	DB  "Procesor: (686) Cyrix MII ",'$'
Procek686CyrixIII	DB  "Procesor: (686) VIA Cyrix III ",'$'
Procek686Rise		DB  "Procesor: (686) Rise mP6 ",'$'
PRocek686RiseII		DB  "Procesor: (686) Rose mP6-II ",'$'
Procek686IDT		DB  "Procesor: (686) IDT WinChip C6 ",'$'
Procek686IDT3		DB  "Procesor: (686) IDT WinChip 3 ",'$'
Procek686IDT4		DB  "Procesor: (686) IDT WinChip 4 ",'$'
Procek786		DB  "Procesor: (786) Intel Pentium 4 (Williamette) ",'$'
Procek786K7		DB  "Procesor: (786) AMD Athlon (K7 ES Model 0) ",'$'
Procek786Athlon1	DB  "Procesor: (786) AMD Athlon (Model 1) ",'$'
Procek786Athlon2	DB  "Procesor: (786) AMD Athlon (Model 2) ",'$'
Procek786Duron3		DB  "Procesor: (786) AMD Duron (Model3) ",'$'
Procek786Athlon4	DB  "Procesor: (786) AMD Athlon (Model4) ",'$'
ZawieraFPU		DB  "FPU i wykonuje rozkazy koprocesora Intel 387....",'$'
ZawieraVME		DB  "VME - rozszerzony tryb pracy wirtualnej 8086....",'$'
ZawieraDE		DB  "DE - analiza punktow przerwan I/O, umozliwia rozszerzony debugging....",'$'
ZawieraPSE		DB  "PSE - procesor wspomaga prace na 4-Mbajtowych stronach....",'$'
ZawieraTSC		DB  "TSC - procesor zawiera licznik czasu (rozkaz RDTSC)....",'$'
ZawieraMSR		DB  "MSR - procesor pozwala na odczyt i zapisa do rejestrow czasu....",'$'
ZawieraPAE		DB  "PAE - procesor wyznacza adresy fizyczne wieksze niz 32-bitowe....",'$'
ZawieraMCE		DB  "MCE - procesor zawiera zaawansowane funkcje kontrolne....",'$'
ZawieraCMPXCHG8B	DB  "rozkaz CMPXCHG8B - porownania i zmiany....",'$'
ZawieraAPIC		DB  "APIC - zaawansowany programowalny kontroler przerwan....",'$'
ZawieraSYSENTER		DB  "SYSENTER/SYSEXIT....",'$'
ZawieraMTRR		DB  "MTRR - procesor moze operowac na specjalnych rejestrach....",'$'
ZawieraPGE		DB  "PGE - procesor pozwala na wielofunkcyjne operowanie blokiem TLB....",'$'
ZawieraMCA		DB  "MCA - procesor posiada zdolnosc pelnej kontroli maszyny....",'$'
ZawieraCMOV		DB  "rozkaz CMOVcc, mozliwosc uzycia FCMOVcc i FCOMI....",'$'
ZawieraMMX		DB  "MMX - rozkazy wspomagajace multimedia....",'$'
ZawieraFXSAVE		DB  "FXSAVE/FXSTOR....",'$'
ZawieraSSE		DB  "SSE - nowe rozkazy multimedialne....",'$'
Zawiera3DNow		DB  "3DNow! - rozkazy multimedialne wspomagajace grafike 3D....",'$'
TrybChroniony		DB  "Procesor pracuje w trybie chronionym",'$'
TrybRzeczywisty		DB  "Procesor pracuje w trybie rzeczywistym lub V86",'$'
Tak			DB  "Tak",'$'
Nie			DB  "Nie",'$'
FPU_Stanu		DW  ?
FPUSux			DB  "Nie ma FPU",'$'
FPU8087			DB  "FPU: 8087",'$'
FPU287			DB  "FPU: 287",'$'
FPU387			DB  "FPU: 387",'$'
Cache			DB  "Pamiec cache procesora: ",'$'
Cache128		DB  "zunifikowany, 128kB, poczworna asocjacja pamieci",13,10,"podrecznej, 32-bajtowe linie kodu",'$'
Cache256		DB  "zunifikowany, 256kB, poczworna asocjacja pamieci",13,10,"podrecznej, 32-bajtowe linie kodu",'$'
Cache512		DB  "zunifikowany, 512kB, poczworna asocjacja pamieci",13,10,"podrecznej, 32-bajtowe linie kodu",'$'
Cache1			DB  "zunifikowany, 1MB, poczworna asocjacja pamieci",13,10,"podrecznej, 32-bajtowe linie kodu",'$'
Cache2			DB  "zunifikowany, 2MB, poczworna asocjacja pamieci",13,10,"podrecznej, 32-bajtowe linie kodu",'$'
Mydata    EndS
;-----------------------------------|
;       Koniec segmentu danych      |
;-----------------------------------|

; Powyzej mamy pelno danych, ktore zostana wypisane w programie.
;Caly interfejs programu jest bardzo brzydki. ALe to przeciez kod,
;ktory trzeba przerobic na Win32. Wtedy bedzie wszystko pieknie i szybko
;ponadto napisze co trzeba wywalic i/lub zmienic by procka dzialala
;w Win32




;-----------------------------------|
;       Pocz¹tek segmentu kodu      |
;-----------------------------------|
MyProg    Segment
		  assume CS:MyProg, DS:Mydata
Main      Proc
Start:

	jmp Poczatek

;**************************
;====Wyswietlenie Mydata===
;**************************

;==============================|
	Dane:		      ;|
		mov AX,Mydata ;| Ta mala procka wyswietla string.
			mov DS,AX     ;| Na wejsciu trzeba umiescic w DX
		mov AH,09H    ;| offset stringa. W Win32 konieczne
			int 21H       ;| trzeba ja zmienic na jakies API
	ret                   ;| wysylajace tekst na forme
;==============================|

;==============================|
	Ustawienia1  PROC     ;|
		  mov  AH,02H     ;| Prosta procedura. Ustawia kursor
		  mov  BH,00H     ;| w podanym miejscu. Trzeba tylko
		  mov  DH,00H     ;| podac wiersz i kolumne. W ProcSysie
		  mov  DL,00H     ;| wywalimy ja podajac do stringa
			  ret             ;| 10,13, zeby kursor przechodzil w dol.
		Ustawienia1 ENDP      ;| Ta procka jest zupelnie zbedna :)
;==============================|

Poczatek:


	jmp JakiProcesor	; ominiecie pozostalych procedur

;================================|
TrybProcesora PROC              ;|
	mov  AX,1686H           ;|
	int  2FH                ;| Procedura korzysta z przerwania 2Fh.
								;| Rozpoznaje czy procesor dziala w trybie
	cmp  AX,0               ;| chronionym czy w V86 lub rzeczywistym.
	je   TrybChronionyProc  ;| W naszym progu powinismy z niej zrezygnowac,
								;| poniewaz Windows i tak i tak pracuje w
	lea  DX,TrybRzeczywisty ;| trybie chronionym. Jedyne co moze byc
	call Dane               ;| "real" to dostep do portow HDD
	jmp  KoniecTrybu        ;|
								;|
TrybChronionyProc:              ;|
								;|
	lea  DX,TrybChroniony   ;|
	call Dane               ;|
								;|
KoniecTrybu:                    ;|
	ret                     ;|
	ENDP                    ;|
;================================|

;=====================================|
FPU	PROC                         ;| Ten fragment kodu chyba znasz. Procka
   FINIT                             ;| Sebastiana Stybla. Rozpoznaje FPU.
   MOV    FPU_Stanu, 5A5AH           ;| Koprocesor 8087 rozni sie tym od 287,
   FNSTSW FPU_Stanu                  ;| ma inaczej ustawiona jedna flage. A
   MOV    AX, FPU_Stanu              ;| 287 rozni sie tym od 387, ze 387 inaczej
   CMP    AL, 00H                    ;| moze interpretowac nieskonczonosc - ujemna
   JZ     Jest_FPU                   ;| i dodatnia.
									 ;|
	lea  DX,FPUSux               ;|
	call Dane                    ;|
	jmp  KoniecFPU               ;|
									 ;|
	Jest_FPU:                    ;|
	FINIT                        ;|
	AND    FPU_Stanu, 0FF7FH     ;|
	FLDCW  FPU_Stanu             ;|
	FDISI                        ;|
	FSTCW  FPU_Stanu             ;|
	TEST   FPU_Stanu, 0080H      ;|
	JE     FPU_80287lub387       ;|
									 ;|
		lea  DX,FPU8087      ;|
		call Dane            ;|
		jmp  KoniecFPU       ;|
									 ;|
		FPU_80287lub387:     ;|
		FINIT                ;|
		FLD1                 ;|
		FLDZ                 ;|
		FDIV                 ;|
		FLD    ST            ;|
		FCHS                 ;|
		FCOMPP               ;|
		FSTSW  FPU_Stanu     ;|
		MOV    AX, FPU_Stanu ;|
		SAHF                 ;|
		JNZ    FPU_80387     ;|
									 ;|
		lea  DX,FPU287       ;|
		call Dane            ;|
		jmp  KoniecFPU       ;|
									 ;|
		FPU_80387:           ;|
		lea  DX,FPU387       ;|
		call Dane            ;|
							 ;|
KoniecFPU:                           ;|
ret                                  ;|
ENDP                                 ;|
;=====================================|

JakiProcesor    Proc

;=====================================|
	xor	DX,DX                ;|	Poczatkowe rozpoznanie procesora.
	push	DX		     ;| Polega na sprawdzeniu flag. Kolejno
	popf			     ;| sa rozpoznawane 8086, 286 i 386. A gdy
	pushf			     ;| procek daje rade z wszystkimi testami
	pop	AX		     ;| oznacza, to albo 486 albo nowszy.
	cmp	AX,0F000H	     ;| Jesli DX=0 mamy do czynienie z 8086
	je	Done		     ;|
;-------------------------------------+
	inc	DX		     ;| Jesli DX=1 to jest to 286
	push	0F000H	             ;|
	popf			     ;|
	pushf			     ;|
	pop	AX		     ;|
	and	AX,0F000H	     ;|
	jz	Done		     ;|
;-------------------------------------+
	inc	DX		     ;| Jesli DX=2 to procek 386
	mov	ECX,ESP	             ;|
	and	ESP,NOT 3	     ;|
	pushfd		             ;|
	pop	EAX		     ;|
	mov	EBX,EAX              ;|
	xor	EAX,0040000H         ;|
	push	EAX	             ;|
	popfd			     ;|
	pushfd		             ;|
	pop	EAX		     ;|
	xor	EAX,EBX              ;|
	jz	FixESP               ;|
;-------------------------------------+
	inc	DX		     ;| W innym wypadku DX=3, czyli procek 486
									 ;| lub lepszy. Nastepnie nastepuja skoki
		FixESP:	mov  ESP,ECX ;| do procek wypisujacych komunikaty o
									 ;| typie procesora
		Done:                ;|          |
		cmp  DX,0            ;|          |
		je   Procesor8086    ;|          |
		cmp  DX,1            ;|          |
		je   Procesor286     ;|          |
		cmp  DX,2            ;|          |
		je   Procesor386     ;|          |
		cmp  DX,3            ;|          |
		je   Procesor486     ;|          |
;=====================================|	         |
;                                                /
;===========================|                   /
Procesor8086:              ;|                  /
	jmp  Procek86Proc  ;|                 /
Procesor286:               ;|                /
	jmp  Procek286Proc ;| /             /
Procesor386:               ;|<=============/
	jmp  Procek386Proc ;| \
Procesor486:               ;|
	jmp  Procek486Proc ;|
;===========================|

	ProcekPentium4:		; Kolejno ustawione procki do dokladnego
					; rozpoznania procesora. Ustawione wedlug
	lea  DX,Procek786  	; generacji. Im nowsza tym wyzej. Co do
	call Dane		; Pentium 4 to bardzo latwo go wykryc, ale
	jmp  LecimyDalej	; o tym nieco nizej.

;===============================|
		Procek686Proc:         ;| Jesli procesor zostal rozpoznany jako ten
		xor  EAX,EAX           ;| 6 generacji nastepuje rozpoznanie producenta
		cpuid                  ;| kosci. Do wyboru sa: Intel, AMD, Cyrix i Rise
		cmp  EBX,756E6547H     ;| Porownanie pierwszych 4 bajtow ciagow
		je   Intel             ;| Jesli Intel to Genu, jesli AMD to Auth, jesli
		cmp  EBX,68747541H     ;| Cyrix to Cyrix, jesli za Rise to Rise. Pozniej
		je   AMD               ;| nastepuja skoki do odpowiednich producentow.
		cmp  EBX,69727943H     ;|
		je   Cyrix             ;|
		cmp  EBX,65736952H     ;|
		je   Rise              ;|
;===============================|

				Intel:          ; Tutaj mamy procki 686 produkcji Intela.
				mov  EAX,1      ; Najpierw wstepne rozpoznanie ich po modelu...
				CPUID           ; Instrukcja shr AL,4 jest wykonywana po to, by
				shr  AL,4       ; pozostawic tylko 4 pierwsze bity, a reszte wyzerowac

;=================================|
				cmp  AL,1010B    ;| Jesli model to wartosc 7,8 lub 0Ah, czyli 10
				je   PentiumIII  ;| to mozemy byc pewni, ze jest to procesor Intel
				cmp  AL,1000B    ;| Pentium III. Wiec skaczemy w odpowiednie
				je   PentiumIII  ;| miejsce, zeby wypisac komunikat
				cmp  AL,0111B    ;|========================================\
				je   PentiumIII  ;|                                         \
;=================================|                                         |
;                                                                           |
				cmp  AL,110B                   ; Wartosci 6 odpowiada Intel |
				je   CeleronLubPentiumIIMobile ; Celeron lub Pentium II     |
						   ; Mobile. Trzeba sprawdzic   |
;									    |
				cmp  AL,0101B              ; Jesli wartosc=5 to jest to     |
				je   PentiumIILubCeleron   ; albo Pentium II albo Celeron   |
;									    |
				cmp  AL,0011B        	; Wartosci 3 odpowiada pierwszy     |
				je   PentiumIIPierwszy  ; model Pentium II (Klamath)        |
;								            |
				cmp  AL,0001B     ; Wartosc 1 oznacza, ze mamy do czynienia |
				je   PentiumPro   ; z prockiem Intel Pentium PRO            |
;                                                  |                        |
						PentiumPro:          ;     |                        |
						lea  DX,Procek686Pro ; /   |                        |
						call Dane            ;<====/                        |
						jmp  LecimyDalej     ; \                            |
;                                                                           |
						PentiumIIPierwszy:        ;                         |
						mov  EAX,2                ; Sprawdzenie czy procek  |
						CPUID                     ; to zwykly Pentium II    |
						cmp  DL,44H               ; czy Xeon. Oczywiscie po |
						jae  PentiumIIXeon        ; rozmiarze pamieci cache |
						lea  DX,Procek686Pierwszy ; i skok do LecimyDalej,  |
						call Dane                 ; czyli sprawdzeniu flag  |
						jmp  LecimyDalej          ;                         |
;                                                                           |
						PentiumIILubCeleron:  ;                             |
						mov  EAX,2            ; Sprawdzenie po rozmiarze    |
						CPUID                 ; cache'u czy procek to Intel |
						cmp  DL,44H           ; Celeron czy Pentium II      |
						jae  PentiumIIXeon    ;                             |
						cmp  DL,43H           ;                             |
						jb   Celeron          ;                             |
						lea  DX,Procek686     ;                             |
						call Dane             ;                             |
						jmp  LecimyDalej      ;                             |
;                                                                           |
								PentiumIIXeon:        ; Wyswietlenie info,  |
								lea  DX,Procek686Xeon ; ze procek to Intel  |
								call Dane             ; Pentium II Xeon     |
								jmp  LecimyDalej      ;                     |
;                                                                           |
								Celeron:                 ; Wyswietlenie     |
								lea  DX,Procek686Celeron ; info, ze procek  |
								call Dane                ; to Intel Celeron |
								jmp  LecimyDalej         ;                  |
;                                                                           |
						CeleronLubPentiumIIMobile:    ; Sprawdzenie ilosci  |
						mov  EAX,2                    ; cache'u, a nastepnie|
						CPUID                         ; skok odpowiednio do |
						cmp  DL,41H                   ; Pentium II Mobile   |
						je   CeleronMobileLubCeleron  ; lub Celeron Mobile  |
;                                                                           |
								PentiumIIMobile:         ; Wyswietlenie     |
								lea  DX,Procek686PIIM    ; odpowiedniego    |
								call Dane                ; komunikatu       |
								jmp  LecimyDalej         ;                  |
;                                                                           |
								CeleronMobileLubCeleron: ; Sprawdzenie po   |
								mov  EAX,1               ; modelu czy procek|
								CPUID                    ; jest Celeronem   |
								shl  AL,4                ; czy Celeronem    |
								shr  AL,4                ; Mobile. Jesli    |
								cmp  AL,1010B            ; model to 0Ah lub |
								je   CeleronMobile       ; 0Dh to Celeron   |
								cmp  AL,1101B            ; Mobile. W innym  |
								je   CeleronMobile       ; wypadku zwykly   |
								jmp  PentiumIILubCeleron ; Celeron          |
;                                                                           |
										CeleronMobile:     	; Wypisanie |
										lea  DX,Procek686CM     ; stringa o |
										call Dane               ; obecnosci |
										jmp  LecimyDalej        ; Celerona  |
																; Mobile    |
;           								    |
;=================================================|                         |
						PentiumIII:              ;|                         |
						mov  EAX,2               ;| /                       |
						CPUID                    ;|<========================/
						cmp  DL,44H              ;| \
						jae  PentiumIIIXeon      ;| Ale nie tak szybko! Najpierw
						lea  DX,Procek686III     ;| trzeba sprawdzic czy to "zwykly"
						call Dane                ;| Pentium III czy Xeon. Mozna to
						jmp  LecimyDalej         ;| poznac po ilosci cache'u. W zwyklym
												 ;| jest 512kB, a w Xeon 1MB. Po rozpoznaniu
						PentiumIIIXeon:          ;| wypisanie odpowiedniego stringa
						lea  DX,Procek686IIIXeon ;|
						call Dane                ;|
						jmp  LecimyDalej         ;|
;=================================================|

;================================|
		AMD:            ;| AMD. Tu sprawa jest nieco dziwna, ale prosta.
		mov  EAX,1      ;| Otoz AMD oznacza swoje procesory 7 generacji
		CPUID           ;| jako te 6. Czyli zamiast Family ID = 7 jest
		shr  AL,4       ;| rowne 6. Ale nic to. My wybieramy 4 mlodsze
		cmp  AL,0000B   ;| bity z AL i porownujemy. Jesli AL=0 to procek
		je   AMDK7ES    ;| to AMD Athlon K7 ES, czyli pierwszy Athlon,
		cmp  AL,0001B   ;| wartosci Al=1,2 i 4 oznaczaja kolejne wersje
		je   AMDAthlon1 ;| AMD Athlona. Zas AL=3 oznacza, ze mamy procek
		cmp  AL,0010B   ;| AMD Duron. Co do prockow AMD 6 generacji, czyli
		je   AMDAthlon2 ;| AMD K6, K62, K6-III to one sa oznaczone jako
		cmp  AL,0011B   ;| te z 5 generacji
		je   AMDDuron3  ;| /
		cmp  AL,0100B   ;|<================================\
		je   AMDAthlon4 ;| \                               |
;================================|                                 |
;                                                                  |
;=================================================|                |
			AMDK7ES:                 ;|                |
			lea  DX,Procek786K7      ;| /              |
			call Dane                ;|<===============/
			jmp  LecimyDalej         ;| \
												 ;| Po porownaniach sa wyswietlane
			AMDAthlon1:              ;| komunikaty o konkretnym modelu
			lea  DX,Procek786Athlon1 ;| procesora. W zestawie sa 4 rodzaje
			call Dane                ;| Athlonow i jeden AMD Duron
			jmp  LecimyDalej         ;|
												 ;|
			AMDAthlon2:              ;|
			lea  DX,Procek786Athlon2 ;|
			call Dane                ;|
			jmp  LecimyDalej         ;|
												 ;|
			AMDDuron3:               ;|
			lea  DX,Procek786Duron3  ;|
			call Dane                ;|
			jmp  LecimyDalej         ;|
												 ;|
			AMDAthlon4:              ;|
			lea  DX,Procek786Athlon4 ;|
			call Dane                ;|
			jmp  LecimyDalej         ;|
;=================================================|

;=================================|
		Cyrix:           ;| Cyrix. Tu jest podobnie jak z AMD. ]
		mov  EAX,1       ;| Tyle, ze modele 6 generacji sa     ]
		CPUID            ;| rozpoznawane w Family ID jako      ]===========\
		shr  AL,4        ;| 5 oraz 6. Z 6 sa tylko dwa:        ]           |
		cmp  AL,0        ;| Cyrix MII i Cyrix VIA III.         ]           |
		je   CyrixMII    ;|                 				   |
		cmp  AL,5        ;|  						   |
		je   CyrixVIAIII ;|						   |
;=================================|						   |
; 									     	   |
			Cyrix6x86:               ;                                 |
			lea  DX,Procek686Cyrix   ; Procki Cyrixa		   |
			call Dane                ; rowniez 6 generacji,		   |
			jmp  LecimyDalej         ; ale wykrywane jako		   |
												 ; te 5. Moglbym te 3		   |
			CyrixMediaGX:            ; procki umiescic jak 		   |
			lea  DX,Procek686CyrixGX ; w AMD w tej generacji	   |
			call Dane                ; jaka jest w Family ID,  	   |
			jmp  LecimyDalej         ; lecz postanowilem, ze	   |
												 ; tak bedzie czytelniej, 	   |
			Cyrix6x86MX:             ; a AMD juz nie chce mi 	   |
			lea  DX,Procek686CyrixMX ; sie przenosic :) 		   |
			call Dane                ; 				   |
			jmp  LecimyDalej         ; 				   |
;										   |
;==================================================|				   |
			CyrixMII:                 ;| / 				   |
			lea  DX,Procek686CyrixMII ;|<==============================/
			call Dane                 ;| \
			jmp  LecimyDalej          ;|
												  ;| Wyswietlenie stosownych info
			CyrixVIAIII:              ;| co do prockow Cyrixa.
			lea  DX,Procek686CyrixIII ;|
			call Dane                 ;|
			jmp  LecimyDalej          ;|
;==================================================|

;===============================|
		Rise:          ;| Rise. Z ta firma jest latwa, klarowna
		mov  EAX,1     ;| i prosta sytuacja. Podobnie jak z Intelem.
		CPUID          ;| Rise ma 2 procesory 686: Rise mP6 i Rise mP6-II.
		shr  AL,4      ;| Mozna je rozroznic juz na stopniu rozpoznawania
		cmp  AL,0      ;| modelu. mP6 ma model 0 i 2, a mP6-II ma modele
		je   RisemP6   ;| 8 i 9. Wlasciwie to wszystko co do tej firmy.
		cmp  AL,2      ;| Ponizej sa dwa moduly wyswietlajace info co
		je   RisemP6   ;| do zainstalowanego procesora. Pozwol, ze nie
		cmp  AL,8      ;| bede robil do nich strzalki ;)))
		je   RisemP6II ;| ...Albo zrobie :)
		cmp  AL,9      ;|
		je   RisemP6II ;|========\
;===============================|    	 |
;					\|/
			   ;''''''''''''''''''''''';
			RisemP6:
			lea  DX,Procek686Rise
			call Dane
			jmp  LecimyDalej

			RisemP6II:
			lea  DX,Procek686RiseII
			call Dane
			jmp LecimyDalej
			   ;.......................;

;===============================|
	Procek586Proc: 	       ;| Jesli procesor zostal rozpoznany po Family ID jako
	xor  EAX,EAX           ;| ten z 5 generacji to w tym miejscu jest jego
	cpuid                  ;| obsluga. Najpierw nastepuje rozpoznanie po
	cmp  EBX,756E6547H     ;| porownaniu charakterystycznych stringow, a
	je   Intel586          ;| nastepnie skoki do konkretnych modeli danego
	cmp  EBX,68747541H     ;| producenta. Posrod prockow 586 mamy 5 producentow:
	je   AMD586            ;| Intel, AMD, Cyrix, IDT i Transmeta. Podam na
	cmp  EBX,69727943H     ;| przykladzie AMD, ze procki z Family ID = 5
	je   Cyrix586          ;| moga byc w rzeczywistosci prockami 686. Jest
	cmp  EBX,746E6543h     ;| tak np. z AMD K6, K6-2, K6-III
	je   IDT586            ;|
	cmp  ECX,3638784DH     ;|
	je   Transmeta         ;|
;===============================|

;======================================|
		Intel586:             ;| Intel. Ta procedura rozpoznaje konkretne
		mov  EAX,1            ;| modele procesorow 5 generacji produkcji
		CPUID                 ;| Intela. Dadam, ze modele odpowiadaja
		shr  AL,4             ;| kolejno chipom:
		cmp  AL,1000B         ;| AL=8 - Mobile Pentium MMX
		je   MobilePentiumMMX ;| AL=7 - Mobile Pentium
		cmp  AL,0111B         ;| AL=4 - Pentium MMX
		je   MobilePentium    ;| AL=3 - Pentium OverDrive
		cmp  AL,0100B         ;| AL=2 - Pentium 75 (MHz)
		je   PentiumMMX       ;| AL=1 - Pentium 66 (MHz)
		cmp  AL,0011B         ;| Nastepnie sa wykonywane skoki do odpowiednich
		je   OverDrive        ;| procek wypisujacych stringi z nazwami ukladow.
		cmp  AL,0010B         ;| 					|
		je   Pentium75        ;|					|
		cmp  AL,0001B         ;|					|
		je   Pentium66        ;|					|
;======================================|					|
;										|
;====================================================|   			|
			Pentium66:                  ;|				|
			lea  DX,Procek586           ;| /		        /
			call Dane                   ;|<========================/
			jmp  LecimyDalej            ;| \
							;|
			Pentium75:                  ;| Mysle, ze tych 6 procek nie musze
			lea  DX,Procek58675         ;| dokladnie opisywac. Po prostu
			call Dane		    ;| wyswietlaja wybrane stringi, ktorych
			jmp  LecimyDalej            ;| OFFSET jest umieszczany w DX.
													;|
			OverDrive:                  ;|
			lea  DX,Procek586OverDrive  ;|
			call Dane                   ;|
			jmp  LecimyDalej            ;|
													;|
			PentiumMMX:                 ;|
			lea  DX,Procek586MMX        ;|
			call Dane                   ;|
			jmp  LecimyDalej            ;|
									;|
			MobilePentium:              ;|
			lea  DX,Procek586Mobile     ;|
			call Dane                   ;|
			jmp  LecimyDalej            ;|
													;|
			MobilePentiumMMX:           ;|
			lea  DX,Procek586MobileMMX  ;|
			call Dane                   ;|
			jmp  LecimyDalej            ;|
;====================================================|

;======================================|
		AMD586:		      ;| AMD. Ta procedura natomiast rozpoznaje
		mov  EAX,1            ;| poszczegolne modele procesorow AMD. Tak
		CPUID                 ;| jak to jest z Family ID=6, AMD podaje
		shr  AL,4             ;| "zanizone" Family ID. Tu Family ID=5,
		cmp  AL,00B           ;| ale za to procki takie jak AMD K6, K6-2
		je   K5Model0         ;| sa rozpoznawane wlasnie jako modele 5
		cmp  AL,01B           ;| generacji, choc w rzeczywistosci sa
		je   K5Model1         ;| to jak najbardziej procki 686. Oto
		cmp  AL,10B           ;| jak mozna rozpoznac te procki po Model ID.
		je   K5Model2         ;| AL=0 - AMD K5 Model 0     ]
		cmp  AL,11B           ;| AL=1 - AMD K5 Model 1     ]
		je   K5Model3         ;| AL=2 - AMD K5 Model 2     ]
		cmp  AL,110B          ;| AL=3 - AMD K5 Model 3     ]
		je   K6Model6         ;| AL=6 - AMD K6 Model 6     ]====================\
		cmp  AL,111B          ;| AL=7 - AMD K6 Model 7     ]			|
		je   K6Model7         ;| AL=8 - AMD K6-2 Model 8   ]			|
		cmp  AL,1000B         ;| AL=9 - AMD K6-III Model 9 ]			|
		je   K6Model8         ;|						|
		cmp  AL,1001B         ;|						|
		je   K6Model9         ;| AL=0Dh=13 - AMD K6-II+ lub K6-III+ (Model D)===|=========\
		cmp  AL,1101B         ;|						|	  |
		je   K6ModelD         ;|						|	  |
;======================================|						|         |
;											|         |
;================================================|					|         |
						K5Model0:               ;| /                                    |         |
						lea  DX,Procek586K50    ;|<=====================================/         |
						call Dane               ;| \                                              |
						jmp  LecimyDalej        ;|                                                |
												;| Nie ma co rozpisywac sie nad tymi prockami.    |
						K5Model1:               ;| Jedyne co robia to wypisuja wybrane stringi    |
						lea  DX,Procek586K51    ;|                                                |
						call Dane               ;|                                                |
						jmp  LecimyDalej        ;|                                                |
												;|                                                |
						K5Model2:               ;|                                                |
						lea  DX,Procek586K52    ;|                                                |
						call Dane               ;|                                                |
						jmp  LecimyDalej        ;|                                                |
												;|                                                |
						K5Model3:               ;|                                                |
						lea  DX,Procek586K53    ;|                                                |
						call Dane               ;|                                                |
						jmp  LecimyDalej        ;|                                                |
												;|                                                |
						K6Model6:               ;|                                                |
						lea  DX,Procek686K66    ;|                                                |
						call Dane               ;|                                                |
						jmp  LecimyDalej        ;|                                                |
												;|                                                |
						K6Model7:               ;|                                                |
						lea  DX,Procek686K67    ;|                                                |
						call Dane               ;|                                                |
						jmp  LecimyDalej        ;|                                                |
												;|                                                |
						K6Model8:               ;|                                                |
						lea  DX,Procek686K68    ;|                                                |
						call Dane               ;|                                                |
						jmp  LecimyDalej        ;|                                                |
												;|                                                |
						K6Model9:               ;|                                                |
						lea  DX,Procek686K69    ;|                                                |
						call Dane               ;|                                                |
						jmp  LecimyDalej        ;|                                                |
;================================================|                                                |
;                                                                                                 |
;========================================================|					  |
						K6ModelD:                       ;|                                        |
						mov  EAX,2                      ;|                                        |
						CPUID                           ;| /                                      |
														;|<=======================================/
						cmp  DL,41H           		;| \
			je   K62ModelD			;| Z modelem D sprawa jest troche bardziej skompikowana,
			cmp  DL,42H			;| ale tylko troche :), bo trzeba poznac po rozmiarze cache'u
			je   K6IIIModelD		;| jaki jest dokladnie procesor. Jesli cache'u jest 128kB (czyli
							;| wartosc Dl=41h) to jest to procek K6-II+, a jest wartosc DL=42h,
				K62ModelD:		;| czyli 256kB to jest to AMD K6-III+. Na koniec sa wypisywane
				lea  DX,Procek686K62	;| wybrane stringi, of coz :)
				call Dane		;|
				jmp  LecimyDalej	;|
							;|
				K6IIIModelD:		;|
				lea  DX,Procek686K6III  ;|
				call Dane		;|
				jmp  LecimyDalej	;|
;========================================================|

;=======================================|
		Cyrix586:	       ;| Cyrix. Tu sprawa jest podobna do AMD, czyli procki 686 maja Family ID = 5.
		mov  EAX,1	       ;| Najpierw sa rozpoznawane 2 modele po Model ID. Jesli AL=4 to porcesor Cyrix
		CPUID                  ;| 6x86 MX, jesli AL=2 to "zwykly" Cyrix 6x86. Gdyby AL nie bylo rowne ani 4, ani 2
		shr  Al,4              ;| to jest to procesor Cyrixa 5 generacji. Odpowiednie procki wypisujace info o
		cmp  AL,4              ;|	|	modelach z generacji 686 sa umieszczone w procce o procesorach
		je   Cyrix6x86MX       ;|	|	Cyrix 686. Nie bede robil strzalki, bo bylaby za dluga :)))
		cmp  AL,2              ;|	|
		je   Cyrix6x86         ;|	|
;--------------------------------------;|	|
		lea  DX,Procek586Cyrix ;| /     /
		call Dane              ;|<=====/
		jmp  LecimyDalej       ;| \
;=======================================|

;======================================|
		IDT586:		      ;| IDT. W tym miejscu sa rozpoznawane procesora IDT 5 i 6 generacji. Tak jak
		mov  EAX,1            ;| Cyrix i AMD Model ID nie zawsze odpowiada numerowi generacji procka. Opis
		CPUID                 ;| Model ID:
		shr  AL,4             ;| Al = 4 - IDT WinChip C6
		cmp  AL,4             ;| AL = 8 - IDT WinChip 2
		je   IDTC6            ;| AL = 9 - IDT WinChip 3
		cmp  AL,8             ;| AL = 0Ah = 10 - IDT WinChip 4
		je   IDTWinChip2      ;| A nastepnie procka wykonuje skoki aby wypisac odpowiednie stringi.
		cmp  AL,9             ;|
		je   IDTWinChip3      ;|
		cmp  AL,0AH           ;|
		je   IDTWinChip4      ;|
;======================================|

			IDTC6:			; Wypisanie stringa, ze procek to IDT WinChip C6
			lea  DX,Procek686IDT	;
			call Dane		;
			jmp  LecimyDalej	;

;======================================================|
			IDTWinChip2:                  ;| Szczegolowe rozpoznanie typu procesora. W WinChipach z serii
			mov  EAX,1                    ;| 2 sa dwie odmiamy. Jedna zwykla i druga "Rev. A". Oto jak je
			CPUID                         ;| wykryc. Jesli Model ID (rejestr AL) = 5 lub 0Ah (10D) to jest
			shl  AL,4                     ;| to "zwykly" WinChip 2, a jesli AL = 7,8 lub 9 to na pewno jest
			shr  AL,4                     ;| to WinChip 2 Rev. A. Nastepnie sa wykonywane skoki do procek
			cmp  AL,5                     ;| wypisujacych odpowiednie monity.
			je   WinChip2                 ;|			|
			cmp  Al,0AH                   ;|			|
			je   WinChip2                 ;|			|
			cmp  AL,7                     ;|			|
			je   WinChip2A                ;|			|
			cmp  AL,8                     ;|			|
			je   WinChip2A		      ;|			|
			cmp  AL,9		      ;|			|
			je   WinChip2A                ;|			|
;-----------------------------------------------------;|			|
				WinChip2:             ;| /			|
				lea  DX,Procek586IDT  ;|<======================/
				call Dane             ;| \
				jmp  LecimyDalej      ;|
							  ;|
				WinChip2A: 	      ;|
				lea  DX,Procek586IDTA ;|
				call Dane             ;|
				jmp  LecimyDalej      ;|
;======================================================|

			IDTWinChip3:		; Wypisanie stringa informujacego o obecnosci procesora IDT WinChip 3.
			lea  DX,Procek686IDT3	;
			call Dane		;
			jmp  LecimyDalej	;

			IDTWinChip4:		; Wypisanie stringa informujacego o obecnosci procesora IDT WinChip 4.
			lea  DX,Procek686IDT4	;
			call Dane		;
			jmp  LecimyDalej	;

;========================================|
		Transmeta:		;| Transmeta. Rozpoznanie po ilosci pamieci cache, jaki jest to dokladnie procesor.
		mov  EAX,2		;| I tak jesli wartosc DL = 42h (256kB pamieci cache L2) to jest to procek Transmeta
		CPUID			;| 5400, jesli DL = 43h (512kB cache'u) to jest to Transmeta 5600, natomiast jesli
		cmp  DL,42H		;| DL = 44h (1MB cache') to jest to Transmeta 5800. Ponizej sa procki wypisujace
		je   Transmeta5400	;| stringi informacyjne.		|
		cmp  DL,43H		;|					|
		je   Transmeta5600	;|					|
		cmp  DL,44H		;|					|
		je   Transmeta5800	;|					|
;========================================|					|
;										|
;========================================================|		       \|/
			lea  DX,Procek586Transmeta	;| To sa te 4 procki. Jedna jest jeszcze do omowienia (ta pierwsza).
			call Dane			;| Otoz ona wypisuje, ze jest to jakis inny procesor Transmety z 5
			jmp  LecimyDalej		;| generacji.
							;|
			Transmeta5400:			;|
			lea  DX,Procek586Transmeta5400  ;|
			call Dane			;|
			jmp  LecimyDalej		;|
							;|
			Transmeta5600:			;|
			lea  DX,Procek586Transmeta5600	;|
			call Dane			;|
			jmp  LecimyDalej		;|
							;|
			Transmeta5800:			;|
			lea  DX,Procek586Transmeta5800	;|
			call Dane			;|
			jmp  LecimyDalej		;|
;========================================================|

;=========================================|
	Procek486Proc:			 ;| Szczegolowe rozpoznanie procesorow z 4 generacji. Procka jest podzielona na 2
	pushfd				 ;| czesci. Po pierwsze. Sprawdzenie czy procek to napewno (!) 486 czy cos lepszego.
	pop  EAX			 ;| Jak to sprzwdzic? Ano po tym czy procek obsluguje instrukcje CPUID po 21 bicie
	or   EAX,1000000000000000000000B ;| rejestru  EFLAGS. Wiec jesli CPUID jest obecny nastepuje skok do drugiej czesci,
	push EAX			 ;| a jesli nie ma CPUID to skok do etykiety "NieMaCPUID", pod ktora procka wypisuje
	popfd				 ;| info, ze jest zainstalowany procek 486. A jesli jest CPUID to nastepuje skok do
	pushfd				 ;| "SprawdzamyDalej" gdzie wykonujemy CPUID i sprawdzamy, z ktorej generacji jest
	pop  EAX			 ;| procesor. A pozniej sa wykonywane skoki do poszczegolnych generacji. W przypadku
	and  EAX,1000000000000000000000B ;| procka 486 wykonujemy skok do JestCPUID.
	jnz  SprawdzamyDalej		 ;|
	jmp  NieMACPUID			 ;|
;----------------------------------------;|
		SprawdzamyDalej:	 ;|
		mov  EAX,1		 ;|
		cpuid			 ;|
		mov  CL,8		 ;|
		shr  AX,CL		 ;|
		cmp  AL,100B		 ;|
		je   JestCPUID		 ;|
		cmp  AL,101B		 ;|
		je   Procek586Proc	 ;|
		cmp  AL,110B		 ;|
		je   Procek686Proc 	 ;|
		cmp  AL,1111B		 ;|
		je   ProcekPentium4	 ;|
;=========================================|

;===========================|
	JestCPUID:         ;| Wiec jesli jest proek 486 i wykonuje CPUID sprawdzamy jego producenta, a nastepnie jaki to
	xor  EAX,EAX       ;| model. Skoki do producentow sa wykonywane na podstawie porownan stringow OEM. Posrod prockow
	cpuid		   ;| 4 generacji sa Intel, AMD i Cyrix.
	cmp  EBX,756E6547H ;|
	je   Intel486	   ;|
	cmp  EBX,68747541H ;|
	je   AMD486        ;|
	cmp  EBX,69727943H ;|
	je   Cyrix486      ;|
;===========================|

;================================|
		Intel486:	;| Rozpoznanie prockow Intela 486 na podstawie porownan Model ID. Opis wartosci i prockow:
		mov  EAX,1	;| AL = 9 - Intel 486 DX/4 WB
		CPUID		;| AL = 8 - Intel 486 DX/4
		shr  AL,4	;| AL = 7 - Intel 486 DX/2 WB
		cmp  AL,1001B	;| AL = 5 - Intel 486 SX/2
		je   I486DX4WB	;| AL = 4 - Intel 486 SL
		cmp  AL,1000B	;| AL = 3 - Intel 486 DX/2
		je   I486DX4	;| AL = 2 - Intel 486 SX
		cmp  AL,0111B	;| AL = 1 - Intel 486 DX 50 (MHz)
		je   I486DX2WB	;| AL = 0 - Intel 486 DX 25 (MHz)
		cmp  AL,0101B	;|
		je   I486SX2	;| Kolejno sa wykonywane skoki ponizej.
		cmp  AL,0100B	;|				|
		je   I486SL	;|				|
		cmp  AL,0011B	;|				|
		je   I486DX2	;|				|
		cmp  AL,0010B	;|				|
		je   I486SX	;|				|
		cmp  AL,0001B	;|				|
		je   I486DX50	;|				|
		cmp  AL,0000B	;|				|
		je   I486DX25	;|				|
;================================|				|
;								|
;================================================|		|
			I486DX25:		;|		|
			lea  DX,Procek486DX	;| 		|
			call Dane		;| /		|
			jmp  LecimyDalej	;|<=============/
						;| \
			I486DX50:		;|
			lea  DX,Procek486DX50	;| Wypisanie wybranych stringow!
			call Dane		;|
			jmp  LecimyDalej	;|
						;|
			I486SX:			;|
			lea  DX,Procek486SX	;|
			call Dane		;|
			jmp  LecimyDalej	;|
						;|
			I486DX2:		;|
			lea  DX,Procek486DX2	;|
			call Dane		;|
			jmp  LecimyDalej	;|
						;|
			I486SL:			;|
			lea  DX,Procek486SL	;|
			call Dane		;|
			jmp  LecimyDalej	;|
						;|
			I486SX2:		;|
			lea  DX,Procek486SX2	;|
			call Dane		;|
			jmp  LecimyDalej	;|
						;|
			I486DX2WB:		;|
			lea  DX,Procek486DX2WB	;|
			call Dane		;|
			jmp  LecimyDalej	;|
						;|
			I486DX4:		;|
			lea  DX,Procek486DX4	;|
			call Dane		;|
			jmp  LecimyDalej	;|
						;|
			I486DX4WB:		;|
			lea  DX,Procek486DX4WB	;|
			call Dane		;|
			jmp  LecimyDalej	;|
;================================================|

;================================|
		AMD486:		;| AMD. Wyszczegolnienie prockow na podstawie ich Model ID. Opis:
		mov  EAX,1	;| AL = 9 - AMD DX/4 WB
		CPUID		;| AL = 8 - AMD DX/4
		shr  AL,4	;| AL = 7 - AMD DX/2 WB
		cmp  AL,1001B	;| AL = 3 - AMD DX/2
		je   DX4WB	;|
		cmp  AL,1000B	;| Pozniej sa wykonywane skoki do procek wypisujacych info o procesorze.
		je   DX4	;|				|
		cmp  AL,0111B	;|				|
		je   DX2WB	;|				|
		cmp  AL,0011B	;|				|
		je   DX2	;|				|
;================================|				|
;								|
;================================================|		|
			DX2:			;| /		|
			lea  DX,Procek486AMD2	;|<=============/
			call Dane		;| \
			jmp  LecimyDalej	;|
						;| [Juz bez opisu] ;))))
			DX2WB:			;|
			lea  DX,Procek486AMD2WB	;|
			call Dane		;|
			jmp  LecimyDalej	;|
						;|
			DX4:			;|
			lea  DX,Procek486AMD4	;|
			call Dane		;|
			jmp  LecimyDalej	;|
						;|
			DX4WB:			;|
			lea  DX,Procek486AMD4WB	;|
			call Dane		;|
			jmp  LecimyDalej	;|
;================================================|

;=======================================|
		Cyrix486:              ;| Cyrix. Tu jest sytuacja dwuznaczna. Otoz przy Model ID = 4 jest jeden procek Cyrixa
		mov  EAX,1             ;| z 5 generacji: Cyrix Media GX. Jest to procek 586. Wiec wykonujemy skok do procki
		cpuid                  ;| wyswietlajace to info (znajduje sie ono posrod procki Cyrixa 586). Moze byc tez tak
		shr  AL,4              ;| ze procek jest prockiem 4 generacji. Wiec jest wyswietlany wybrany string, ten
		cmp  AL,4              ;| ponizej.
		je   CyrixMediaGX      ;|
;--------------------------------------;|
		lea  DX,Procek486Cyrix ;|
		call Dane              ;|
		jmp  LecimyDalej       ;|
;=======================================|

;=======================================|
NieMACPUID:			       ;| Jesli jest procesor 486 nie obslugujacy CPUID jest wypisywany string z t info, ze
	lea  DX,Procek486              ;| jest to zwykly procek 486, bez nazwy producenta i konkretnego modelu.
	call Dane                      ;|
	jmp  KoniecJakiProcesor        ;|
;=======================================|

;================================================|
	Procek386Proc:				;| Ta procka robi to samo co procka "Procek486Proc", wiec jesli chcesz opis
	pushfd					;| to przesun kod do gory :)
	pop  EAX				;|
	or   EAX,1000000000000000000000B	;|
	push EAX				;|
	popfd					;|
	pushfd					;|
	pop  EAX				;|
	and  EAX,1000000000000000000000B	;|
	jnz  LecimyDalej1			;|
	lea  DX,Procek386			;|
	call Dane				;|
	jmp  KoniecJakiProcesor			;|
;================================================|

;================================================|
		LecimyDalej1:			;|
		xor  EAX,EAX			;| Procedura sprawdza producenta procka, a nastepnie wykonuje skok
		cpuid				;| i wypisuje info o procku i jego producencie. Nie bede szerzej
		cmp  EBX,756E6547H		;| komentowal, bo wszystko jest takie schematyczne...
		je   Intel386			;|
		cmp  EBX,68747541H		;|
		je   AMD386			;|
		cmp  EBX,69727943H		;|
		je   Cyrix386			;|
						;|
			Intel386:		;|
			lea  DX,Procek386Intel 	;|
			call Dane		;|
			jmp  LecimyDalej	;|
						;|
			AMD386:			;|
			lea  DX,Procek386AMD	;|
			call Dane		;|
			jmp  LecimyDalej	;|
						;|
			Cyrix386:		;|
			lea  DX,Procek386Cyrix	;|
			call Dane		;|
			jmp  LecimyDalej	;|
;================================================|

	Procek286Proc:		;
	lea  DX,Procek286	; Wypisanie infa o tym, ze procek jest prockiem 286.
	call Dane		;
	mov  AH,02H 		;
	mov  BH,00H		;
	mov  DH,05H 		;
	mov  DL,00D		;
	int  10H		;
	jmp  KoniecJakiProcesor	;

	Procek86Proc:		; Wypisanie infa o tym, ze procek jest prockiem 8086.
	lea  DX,Procek8086  	;
	call Dane		;
	jmp  KoniecJakiProcesor	;

LecimyDalej:
	call FPU	; Najpierw wypisanie infa o FPU

	mov  EAX,1	; Nastepnie wykonanie CPUID i s[rawdzenie ustawienia flag, a przy tym wypisanie infa
	CPUID 		; o MMX, SSE itd. W przyszlosci bedzie mozna rozbudowac ta procke! Nie bede robil opisu
	mov  ECX,EDX	; bo niedlugo napisze ten calutki prog w Delphi i Ci wysle, ok?
	call Ustawienia1
	mov  DH,1
	int  10H
	lea  DX,ZawieraFPU
	call Dane
	test ECX,1B
	jnz  ZawieraFPUProc
	jmp  Bit1a

	ProceduraCPUID:
		ZawieraFPUProc:
		lea  DX,Tak
		call Dane
		jmp  Bit1

		Bit1a:
		lea  DX,Nie
		call Dane

		Bit1:
		call Ustawienia1
		mov  DH,2
		int  10H
		lea  DX,ZawieraVME
		call Dane
		test ECX,10B
		jnz  ZawieraVMEProc
		jmp  Bit2a

		ZawieraVMEProc:
		lea  DX,Tak
		call Dane
		jmp  Bit2

		Bit2a:
		lea  DX,Nie
		call Dane

		Bit2:
		call Ustawienia1
		mov  DH,3
		int  10H
		lea  DX,ZawieraDE
		call Dane
		test ECX,100B
		jnz  ZawieraDEProc
		jmp  Bit3a

		ZawieraDEProc:
		lea  DX,Tak
		call Dane
		jmp  Bit3

		Bit3a:
		lea  DX,Nie
		call Dane

		Bit3:
		call Ustawienia1
		mov  DH,4
		int  10H
		lea  DX,ZawieraPSE
		call Dane
		test ECX,1000B
		jnz  ZawieraPSEProc
		jmp  Bit4a

		ZawieraPSEProc:
		lea  DX,Tak
		call Dane
		jmp  Bit4

		Bit4a:
		lea  DX,Nie
		call Dane

		Bit4:
		call Ustawienia1
		mov  DH,5
		int  10H
		lea  DX,ZawieraTSC
		call Dane
		test ECX,10000B
		jnz  ZawieraTSCProc
		jmp  Bit5a

		ZawieraTSCProc:
		lea  DX,Tak
		call Dane
		jmp  Bit5

		Bit5a:
		lea  DX,Nie
		call Dane

		Bit5:
		call Ustawienia1
		mov  DH,6
		int  10H
		lea  DX,ZawieraMSR
		call Dane
		test ECX,100000B
		jnz  ZawieraMSRProc
		jmp  Bit6a

		ZawieraMSRProc:
		lea  DX,Tak
		call Dane
		jmp  Bit6

		Bit6a:
		lea  DX,Nie
		call Dane

		Bit6:
		call Ustawienia1
		mov  DH,7
		int  10H
		lea  DX,ZawieraPAE
		call Dane
		test ECX,1000000B
		jnz  ZawieraPAEProc
		jmp  Bit7a

		ZawieraPAEProc:
		lea  DX,Tak
		call Dane
		jmp  Bit7

		Bit7a:
		lea  DX,Nie
		call Dane

		Bit7:
		call Ustawienia1
		mov  DH,8
		int  10H
		lea  DX,ZawieraMCE
		call Dane
		test ECX,10000000B
		jnz  ZawieraMCEProc
		jmp  Bit8a

		ZawieraMCEProc:
		lea  DX,Tak
		call Dane
		jmp  Bit8

		Bit8a:
		lea  DX,Nie
		call Dane


		Bit8:
		call Ustawienia1
		mov  DH,9
		int  10H
		lea  DX,ZawieraCMPXCHG8B
		call Dane
		test ECX,100000000B
		jnz  ZawieraCMPXCHG8BProc
		jmp  Bit9a

		ZawieraCMPXCHG8BProc:
		lea  DX,Tak
		call Dane
		jmp  Bit9

		Bit9a:
		lea  DX,Nie
		call Dane

		Bit9:
		call Ustawienia1
		mov  DH,0AH
		int  10H
		lea  DX,ZawieraAPIC
		call Dane
		test ECX,1000000000B
		jnz  ZawieraAPICProc
		jmp  Bit10a

		ZawieraAPICProc:
		lea  DX,Tak
		call Dane
		jmp  Bit10

		Bit10a:
		lea  DX,Nie
		call Dane

		Bit10:
		call Ustawienia1
		mov  DH,0BH
		int  10H
		lea  DX,ZawieraSYSENTER
		call Dane
			test ECX,1000000000000B
		jnz  ZawieraSYSENTERProc
		jmp  Bit11a

		ZawieraSYSENTERProc:
		lea  DX,Tak
		call Dane
		jmp  Bit11

		Bit11a:
		lea  DX,Nie
		call Dane

		Bit11:
		call Ustawienia1
		mov  DH,0CH
		int  10H
		lea  DX,ZawieraMTRR
		call Dane
			test ECX,1000000000000B
		jnz  ZawieraMTRRProc
		jmp  Bit12a

		ZawieraMTRRProc:
		lea  DX,Tak
		call Dane
		jmp  Bit12

		Bit12a:
		lea  DX,Nie
		call Dane

		Bit12:
		call Ustawienia1
		mov  DH,0DH
		int  10H
		lea  DX,ZawieraPGE
		call Dane
		test ECX,10000000000000B
		jnz  ZawieraPGEProc
		jmp  Bit13a

		ZawieraPGEProc:
		lea  DX,Tak
		call Dane
		jmp  Bit13

		Bit13a:
		lea  DX,Nie
		call Dane

		Bit13:
		call Ustawienia1
		mov  DH,0EH
		int  10H
		lea  DX,ZawieraMCA
		call Dane
		test ECX,100000000000000B
		jnz  ZawieraMCAProc
		jmp  Bit14a

		ZawieraMCAProc:
		lea  DX,Tak
		call Dane
		jmp  Bit14

		Bit14a:
		lea  DX,Nie
		call Dane

		Bit14:
		call Ustawienia1
		mov  DH,0FH
		int  10H
		lea  DX,ZawieraCMOV
		call Dane
		test ECX,1000000000000000B
		jnz  ZawieraCMOVProc
		jmp  Bit15a

		ZawieraCMOVProc:
		lea  DX,Tak
		call Dane
		jmp  Bit15

		Bit15a:
		lea  DX,Nie
		call Dane

		Bit15:
		call Ustawienia1
		mov  DH,10H
		int  10H
		lea  DX,ZawieraMMX
		call Dane
		test ECX,100000000000000000000000B
		jnz  ZawieraMMXProc
		jmp  Bit16a

		ZawieraMMXProc:
		lea  DX,Tak
		call Dane
		jmp  Bit16

		Bit16a:
		lea  DX,Nie
		call Dane

		Bit16:
		call Ustawienia1
		mov  DH,11H
		int  10H
		lea  DX,ZawieraFXSAVE
		call Dane
		test ECX,1000000000000000000000000B
		jnz  ZawieraFXSAVEProc
		jmp  Bit17a

		ZawieraFXSAVEProc:
		lea  DX,Tak
		call Dane
		jmp  Bit17

		Bit17a:
		lea  DX,Nie
		call Dane

		Bit17:
		call Ustawienia1
		mov  DH,12H
		int  10H
		lea  DX,ZawieraSSE
		call Dane
		test ECX,10000000000000000000000000B
		jnz  ZawieraSSEProc
		jmp  Bit18a

		ZawieraSSEProc:
		lea  DX,Tak
		call Dane
		jmp  Bit18

		Bit18a:
		lea  DX,Nie
		call Dane

		Bit18:
		call Ustawienia1
		mov  DH,13H
		int  10H
		lea  DX,Zawiera3DNow
		call Dane
		test ECX,10000000000000000000000000000000B
		jnz  Zawiera3DNowProc
		jmp  Bit19a

		Zawiera3DNowProc:
		lea  DX,Tak
		call Dane
		jmp  CacheProc

		Bit19a:
		lea  DX,Nie
		call Dane

		CacheProc:
		mov  AH,02H
		mov  BH,00H
		mov  DH,14H
		mov  DL,00D
		int  10H

		lea  DX,Cache
		call Dane

		mov EAX,2
		CPUID
		mov  ECX,EAX

		cmp  DL,41H
		je   Cache128kB
		cmp  DL,42H
		je   Cache256kB
		cmp  Dl,43H
		je   Cache512kB
		cmp  DL,44H
		je   Cache1MB
		cmp  DL,45H
		je   Cache2MB

			Cache128kB:
			lea  DX,Cache128
			call Dane
			jmp  KoniecCPUID

			Cache256kB:
			lea  DX,Cache256
			call Dane
			jmp  KoniecCPUID

			Cache512kB:
			lea  DX,Cache512
			call Dane
			jmp  KoniecCPUID

			Cache1MB:
			lea  DX,Cache1
			call Dane
			jmp  KoniecCPUID

			Cache2MB:
			lea  DX,Cache2
			call Dane

		KoniecCPUID:
		mov  AH,02H
		mov  BH,00H
		mov  DH,15H
		mov  DL,00D
		int  10H
		call TrybProcesora



	KoniecJakiProcesor:



JakiProcesor	Endp

		mov AH,4CH
		xor AL,AL
		int 21H
Main    EndP
MyProg  EndS
;-----------------------------------|
;       Koniec segmentu kodu        |
;-----------------------------------|
		  End   Start

