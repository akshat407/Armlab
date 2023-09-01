  ;sum 10 to 1 is 55 but reslut in the register is in hex decimal(0x37)
  AREA SUM,CODE,READONLY
  
ENTRY
  MOV R1,#10		; load 10 to regester
  MOV R2,#0			; empty the register to store result
loop
  ADD R2,R2,R1		; add the content of R1 with result at R2
  SUBS R1,#0x01		; Decreament R1 by 1
  BNE loop			; repeat till r1 goes 0
  
back B back			; jumps back to C code
  END
		


  