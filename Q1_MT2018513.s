; Answer to Q1 : Exponential of x
;By Mayukh Ghosh MT2018513
  	    AREA    appcode ,CODE,READONLY
			
        EXPORT __main
			
        ENTRY
		
__main    FUNCTION
	
		
        MOV R0,#13; no of terms
		
        MOV R1,#1;counter
				
		LDR R3,= 0x00000001 ; sum temp
		
	    VMOV.F S0,R3 ;  final sum
		
	    VCVT.F32.U32 S0,S0
	   
	   
	   
	    LDR R4,= 0x00000001 ; temp var
		
	    VMOV.F S1,R4 ; 
		
		
	    VCVT.F32.U32 S1,S1
		
	   
	    LDR R5,= 0x00000006 ; x value
		
	    VMOV.F S2,R5 ; 
		
	    VCVT.F32.U32 S2,S2
		
		
	   
	    LDR R6,= 0x00000001 ; temp for fact calc
		
	    VMOV.F S6,R6 ; 
		
		
	    VCVT.F32.U32 S6,S6
		



L1    CMP R1,R0; compare counter and n

        BLE L; check if counter < n 
		
        B stop;else stop
		
L    VMUL.F32 S1,S1,S2; t = t*x

		VMOV.F32 S3,S1;
		
        VMOV.F32 S5,R1; move from R1 to S5
		
        VCVT.F32.U32 S5, S5;
		
		VMUL.F32 S6,S6,S5
		
        VDIV.F32 S3,S3,S6;Divide t by factorial S6 and keep in S6
		
        VADD.F32 S0,S0,S3;final result
		
		
        ADD R1,R1,#1;increase counter 
		
        B L1;compare
		
stop    B stop
        ENDFUNC
        END