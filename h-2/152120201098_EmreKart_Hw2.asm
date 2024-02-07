
;<Program title>
;00h -> 20h decimal-> 32 B
;01h -> 20h decimal-> 32 C
;02h -> 67h decimal-> 103 D
;03h -> 89h decimal-> 137 E

jmp start
;data

;code
start: nop
; After loading data into ports via the interface, the following code lines
; First transfer the data from the port to accumulator A, and then
; All data is transferred to registers B-C-D-E step by step.
IN 0a00H	; Takes data from port address 0a00h and puts it into the A register.
MOV B,A		; Copies A register to B.
IN 0a01h	; Takes data from port address 0a01h and puts it into the A register.
MOV C,A		; Copies A register to C.
IN 0a02h	; Takes data from port address 0a02h and puts it into the A register.
MOV D,A		; Copies A register to D.
IN 0a03h	; Takes data from port address 0a03h and puts it into the A register.
MOV E,A		; Copies A register to E.

MVI A, 00h ;Clears A by assigning 0.

;Arithmetic Operations
MOV A, C	; Copies C to A.
ADD E		; Adds E to A.
DAA		; Adjusts the result to BCD (Binary Coded Decimal) format.
MOV C, A	; Copies the low byte of the result to L.

MOV A, B	; Copies B to A.
ADC D		; A + D
DAA		; Adjusts the result to BCD format.
MOV B, A   ; Copies the high byte of the result to H.

;My Student Num: 152120201098
;1098h
;Transfer data 
LXI H, 1098h	; Sets HL to the address 1098h
MOV M, B	; Stores B into [HL]
INX H		; Increases HL and moves to [HL] + 1
MOV M, C	; Stores C into [HL] + 1.

HLT






