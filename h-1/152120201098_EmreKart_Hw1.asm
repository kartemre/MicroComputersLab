;152120201098
;Emre Kart
;2020h hex = 8224 dec
;1098h hex = 4248 dec

jmp start

;data


;code
start: nop

MVI H, 20h	; Load 20h into the H register.
	MVI L, 20h	; Load 20h into the L register.
	MOV B, M	; Move the value from memory location HL to the B register
 
	MVI H, 10h	; Load 10h into the H register.
	MVI L, 98h	; Load 98h into the L register.
	MOV D, M	; Move the value from memory location HL to the D register

	;Stack operations
	PUSH B 	;Push the value of B onto the stack
	PUSH D 	;Push the value of D onto the stack
	
	;stack is currently -> Data D, Data B
	POP B 	; Pop the top value from the stack into B, Old Data D is loaded to B register. 
	;Stack is currently -> Data B
	POP D 	; Pop the top value from the stack into D, Old data B is loaded to D register.
	;out to I/O Ports
	MOV A, B	; Move the value of B into the accumulator (A)
	OUT 00h		; Output the value in the accumulator (A) to port 00h
	MOV A, D	; Move the value of D into the accumulator (A)
	OUT 01h 	; Output the value in the accumulator (A) to port 01h

hlt