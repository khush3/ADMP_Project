ASSUME CS:CODE, DS:DATA

DATA SEGMENT
    DATA_BLOCK DW 1000H, 1002H, 1004H, 1020H, 1223H, 1000H, 1002H, 1004H, 1020H, 1223H
    
DATA ENDS


CODE SEGMENT 
    
START:
    MOV AX, DATA
    MOV DS, AX 
    
    MOV DX, 0000H
    MOV CX, 0000H
    MOV AL, 0AH
    
    LEA SI, DATA_BLOCK 
    CLC
    
    AGAIN: 
        MOV BL, [SI]
        MOV BH, [SI+1]
        AND BL, 01H
        JZ EVEN
    
    ODD: 
        ADD SI, 02H
        DEC AL 
        JZ AGAIN 
        JMP STOP_EXE 
    
    EVEN: 
        MOV CL, [SI]
        INC SI 
        MOV CH, BH
        ADC DX, CX
        DEC SI
        JMP ODD
    
    STOP_EXE: 
        MOV AH, 4CH 
        INT 21H 
    
    CODE ENDS 

END START

