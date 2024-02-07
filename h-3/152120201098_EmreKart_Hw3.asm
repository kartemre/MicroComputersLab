
;152120201098
;EMRE KART
;Hw3
; öğrencilerin notlarını en altta veri seti olarak aldım hl ye datanın başlangıç adresini attım
;loop u sonlandırmak için not sayısını azaltma yöntemini yaptım
;00h portuna geçme notunu attım ve döngüde saydırdım geçen ve kalanları register yardımı ile
;geçenleri 01h kalanları 02h protuna attım 
;geçen sayısı büyükse 03h portuna 2 değerini attım küçükse 1 değeri attım

start:	nop     ; No operation
	LXI H, data     ; Load the starting address of the data set into HL register pair    
	MVI C, 14h      ; Load the number of data points into register C
	MVI A, 08h      ; Set the passing grade
	OUT 00h         ; Output the passing grade to port 00h
	MOV B, A        ; Copy passing grade to register B
LOOP:	MOV A, M        ; Load an element of the data into register A
	CMP B           ; Compare A with the passing grade (B)
	JC FAIL         ; Jump to FAIL subroutine if A < B
	INR D           ; Increment D if A >= B (passed)
	JMP NEXT        ; Jump to NEXT label
FAIL:	INR E           ; Increment E if A < B (failed)
NEXT:   INX H           ; Increment HL pair to point to the next element in the data set
	DCR C           ; Decrement the counter C
	JNZ LOOP        ; Jump to LOOP if C is not zero
	MOV A, D        ; Move the value of D (number of students passed) to register A
	OUT 01h         ; Output the number of students passed to port 01h
	MOV A, E        ; Move the value of E (number of students failed) to register A
	OUT 02h         ; Output the number of students failed to port 02h
	CMP D           ; Compare A with D
	JNC fail_much   ; Jump to fail_much if A >= D (more students failed)
succes_much:	MVI A, 02h  ; Load 02h into register A (indicating more students passed)        
		OUT 03h     ; Output 02h to port 03h        
		JMP END     ; Jump to END label to end the program

fail_much:	MVI A, 01h  ; Load 01h into register A (indicating more students failed)
		OUT 03h     ; Output 01h to port 03h

END:	HLT             ; Halt the program

data:	db 01h, 02h, 03h, 04h, 05h, 06h, 07h, 08h, 09h, 0ah, 0bh, 0ch, 0dh, 0eh, 0fh, 10h, 11h, 12h, 13h, 14h
