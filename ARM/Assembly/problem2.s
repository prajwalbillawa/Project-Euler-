	   AREA     mcode, CODE, READONLY
                                ; Name this block of code ARMex
        ENTRY                   ; Mark first instruction to execute
		EXPORT __main
		
__main	 
		MOV R1,#1;
		MOV R2,#2;
		MOV R4,#2; STORE SUM
		MOV R3,#0;
		
LOOP	
		ADD R3,R1,R2;
		AND R5,R3,#00000001;
		CMP R5,#0;
		ADDEQ R4,R4,R3;
		
		MOV R1,R2;
		MOV R2,R3;
		LDR R6,=4000000
		CMP R3,R6;
		BLT LOOP;

	END
		


		



		
