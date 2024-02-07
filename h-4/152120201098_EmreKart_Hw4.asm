; Program Üslü Sayı Hesabı Yapacak
; 152120201098 - EMRE KART - Hw4

jmp start

start: nop

	IN 01h       ; 01h portundan değeri al
	CPI 00H     ; A registerındaki değeri 00H ile karşılaştır
	JZ CONTROL_BASE ; Eğer 01h portundan gelen değer 0 ise kontrol işlemine git
	RAL          ; Sola döndür (işlem yapılan değer)
	MOV B, A     ; Alınan değeri B'ye kopyala

	IN 00h        ; 00h portundan değeri al
	CPI 00H     ; A registerındaki değeri 00H ile karşılaştır
	JZ CONTROL_EXPONENT ; Eğer 01h portundan gelen değer 0 ise kontrol işlemine git
	RRC           ; Sağa döndür (işlem yapılan değer)
	MOV C, A      ; Alınan değeri C'ye kopyala

	MVI D, 01H   ; C^B işlemi yapılacak

Exponentiation:	CALL MULTIPLY    ; Çarpma fonksiyonunu çağır
		DCR C            ; C'yi azalt
		JNZ Exponentiation   ; C sıfır olana kadar döngüyü tekrarla
		MOV A, D     ; D'yi A'ya kopyala
		OUT 02h      ; Sonucu 02h porta yaz
	        HLT              ; Programı durdur

CONTROL_BASE:	MVI A, 00H   ; A registerına 0 değerini yükle
    		OUT 02H      ; 02h porta 0 değerini yaz
    		HLT          ; Programı sonlandır

CONTROL_EXPONENT:	MVI A, 01H   ; A registerına 1 değerini yükle
			OUT 02H      ; 02h porta 1 değerini yaz
    			HLT          ; Programı sonlandır

MULTIPLY:   MOV E, B       ; B'yi E'ye kopyala
            MVI A, 00H     ; A'ya 0 değerini yükle

MULTIPLYLOOP: ADD D       ; D'yi A ile topla e deki değeri akümulatore atar
              DCR E       ; E'yi azalt
              JNZ MULTIPLYLOOP  ; E sıfır olana kadar döngüyü tekrarla
              MOV D, A         ; A'yı D'ye kopyala
              RET              ; Alt programdan dön



EXIT: HLT    ; Programı durdur
