

;EMRE KART
;Hw3
start: nop
LXI H, data 	; veri adresini HL çiftine yükle
MVI C, 14h	; veri sayısını C kaydına yükle
MVI A , 07h	
OUT  00h
MOV B, A 	; geçme notunu B kaydına kopyala

LOOP:   MOV A, M ; verinin bir elemanını A kaydına al
        CMP B ; A kaydını B kaydıyla karşılaştır
	JC FAIL ; A < B ise FAIL alt rutinine git
	INR D ; A >= B ise D kaydını bir artır
	JMP NEXT ; NEXT etiketine git
FAIL:   INR E ; A < B ise E kaydını bir artır
NEXT:   INX H ; HL çiftini bir artır
	DCR C ; C kaydını bir azalt
	JNZ LOOP ; C != 0 ise LOOP etiketine git

MOV A, D ; D kaydını A kaydına al D DE geçen öğrencvi sayısı bulunur 
OUT 01h ; A kaydını port 01h'ye yaz
MOV A, E ; E kaydını A kaydına al E DE Kalan öğrencvi sayısı bulunur
OUT 02h ; A kaydını port 02h'ye yaz

CMP D  ; A ile D'yi karşılaştır
JNC fail_to_much  ; Eğer A >= D ise A_greater_equal'e git

succes:	MVI A, 01h  ; C register'ına 01h değerini yükle (küçük durum için)
	OUT 03h ; Porta C değerini yaz
	JMP END ; Programı sonlandır

fail_to_much:	MVI A, 02h  ; C register'ına 02h değerini yükle (büyük veya eşit durum için)
		OUT 03h  ; Porta C değerini yaz

END:		HLT ; programı durdur
data: db 01h, 02h, 03h, 04h, 05h, 06h, 07h, 08h, 09h, 0ah, 0bh, 0ch, 0dh, 0eh, 0fh, 10h, 11h,12h, 13h, 14h