; Q2 : tanx series

;By Mayukh Ghosh MT2018513


     AREA    appcode,CODE,READONLY
     EXPORT __main
     ENTRY


__main  FUNCTION





		MOV R8,#1; counter
			 
			 
        MOV R4,#13 ; n no of iterations
		
		
   
		VLDR.F32 S1,=1;t temp variable 
		
		
        VLDR.F32 S0,=1;
		
		
        
		
        
	
	
	 	VLDR.F32 S7,=0.017453; conversion factor


		VLDR.F32 S2,=210;x value in degree
		
		

		VMUL.F32 S2,S2,S7 ; change x to radian


		VMOV.F32 S1,S2; t=x for sine


		VMOV.F32 S0,S2; sum=x for sine


		VLDR.F32 S8,=1; t=1 for cos



		VLDR.F32 S9,=1; s=1 for cos





L1   CMP R8,R4;check counter and  N

        BLE L;if i < N JUMP TO L
		
		
stop    B stop;else  stop

L  	VMOV.F32 S3,R8; moving the value of counter in floating register


        VCVT.F32.U32 S3,S3; Convert into fp no
		
		
		VNMUL.F32 S4,S2,S2; -1*x*x
		
		MOV R5,#2
		
		MUL R2,R8,R5; 2i
		
		ADD R3,R2,#1; calc 2i+1 for sine
		
		SUB R6,R2,#1; calc 2i-1 for cosine
	 	
		MUL R3,R2,R3; calc 2i*(2i+1)  for sine
		
		MUL R7,R2,R6; calc 2i*(2i-1) for cosine
		
        VMOV.F32 S5,R3; 
		
		VMOV.F32 S10,R7; 
		
        VCVT.F32.U32 S5,S5; 
		
		VCVT.F32.U32 S10,S10; 
		
		VDIV.F32 S6,S4,S5 ; calc -(x*x)/2i*(2i+1)
		
		VDIV.F32 S11,S4,S10 ; calc -(x*x)/2i*(2i-1)
		
		VMUL.F32 S1,S1,S6; calc t=t*(-1)*(x*x)/2i*(2i+1)
		
		VMUL.F32 S8,S8,S11; calc t=t*(-1)*(x*x)/2i*(2i-1)
		
		VADD.F32 S0,S0,S1;add s to t and store it in s for sin
		
		VADD.F32 S9,S9,S8;Finally add s to t and store it in s for cos
		
		VDIV.F32 S12,S0,S9; final value
		
		ADD R8,R8,#1; increase counter

		B L1;;Again compare
		
		endfunc
		
        end