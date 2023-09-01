;/* PROGRAM TO FIND SMALLEST NUMBER IN AN ARRAY & STORE IN INTERNAL RAM				*/
;/*	ARRAY OF 7 NUMBERS 0X44444444 ,0X22222222,0X11111111,0X22222222,0XAAAAAAAA		*/		
;/*							0X88888888 ,0X99999999									*/
;/* RESULT CAN BE VIEWED IN LOCATION 0X40000000 & ALSO IN R2						*/
;/* SET A BREAKPOINT AT NOP INSTRUCTION,RUN THE PROGRAM & CHECK THE RESULT 			*/ 
;/* PROGRAM WRITTEN BY ALS R&D TEAM BENGALURU	DATE:08/08/2011						*/ 

	AREA  SMALLEST , CODE, READONLY

ENTRY				;Mark first instruction to execute

START
	MOV R5,#6				; INTIALISE COUNTER TO 6(i.e. N=7)
 	LDR R1,=VALUE1   	   	; LOADS THE ADDRESS OF FIRST VALUE
	LDR R2,[R1],#4			; WORD ALIGN T0 ARRAY ELEMENT 
LOOP
	LDR R4,[R1],#4			; WORD ALIGN T0 ARRAY ELEMENT 
	CMP R2,R4				; COMPARE NUMBERS
	BLS LOOP1				; IF THE FIRST NUMBER IS < THEN GOTO LOOP1

	MOV R2,R4				; IF THE FIRST NUMBER IS > THEN MOV CONTENT R4 TO R2
LOOP1					
	SUBS R5,R5,#1			; DECREMENT COUNTER
	CMP R5,#0				; COMPARE COUNTER TO 0
	BNE LOOP				; LOOP BACK TILL ARRAY ENDS

 	LDR R4,=RESULT		  	; LOADS THE ADDRESS OF RESULT 
	STR R2,[R4]				; STORES THE RESULT IN R1

	NOP
	NOP
	NOP


; ARRAY OF 32 BIT NUMBERS(N=7)

VALUE1 
		DCD 0X44444444	  		;
		DCD	0X22222222			;
		DCD	0X11111111			;
		DCD	0X22222222			;  			
		DCD	0XAAAAAAAA			;
		DCD	0X88888888			;		   	 
		DCD	0X99999999			;

	

	AREA DATA2,DATA,READWRITE  		; TO STORE RESULT IN GIVEN ADDRESS			
RESULT DCD 0X0				

	END				; Mark end of file
	
	