	   AREA     mcode, CODE
                                
        ENTRY                   
		EXPORT __main
			
DIVV	MOV R7,#0;          Declare check variable
		UMULL R1,R2,R0,R3;    Divide by 3
		UMULL R6,R2,R0,R5;    Divide by 5
		
		MOV R1,R1,LSR #28;    Right shift top 4 bytes 
		CMP R1,#0;            Check if 0(multiple)
		MOVEQ R7,#1;          Set check variable
		CMP R1,#0X0000000F;   Check if 0xF(multiple)
		MOVEQ R7,#1;          Set check variable
		MOV R6,R6,LSR #28;    Right shift top 4 bytes
		CMP R6,#0;            Check if 0(multiple)
		MOVEQ R7,#1;          Set check variable
		CMP R6,#0X0000000F;   Check if 0xF(multiple)
		MOVEQ R7,#1;          Set check variable
		
		MOV PC,LR;            Return 
		
__main
		MOV R0,#999;         Loop Count
		MOV R4,#0;          Register to store sum
		LDR R3,=0X55555555; To divide by 3 -> (2^32 / 3) + 1
		LDR R5,=0X33333334; To divide by 5 -> (2^32 / 5) + 1
		

		
LOOP	BL DIVV;        Branch to Division subroutine
		CMP R7,#0;        Check if number is divisible
		ADDNE R4,R4,R0;   Increment sum
		
		SUB R0,R0,#1;     Decrement loop variable
		CMP R0,#0;        Check for loop termination
		BNE LOOP;         Loop back if no termination
		
		END
