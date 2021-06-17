;*********************************
;    floating point library
;    adapted from 
;    Forth dimensions Vol. IV #1 
;    published in  may/june 1982
;
; Creation date: 2021-06-15 
;
; NOTE: I used a different format 
;       for float number. This 
;       enable comparison of floats 
;       as they were integer hence 
;       there no need for F>,F<,etc 
;************************************

;*************************************************
;  FLOAT format double for storage 
;  bits 22:0  mantissa absolute value 
;  bits  30:23  exponent with 127 offset added  
;  bit 31  mantissa sign 
;  float value: if bit 31 is 1 negate mantissa
;                else keep mantissas as bits 22:0
;                as is
;                eponent: 10^^(exp-127) 
;***********************************************  
    ; macro to create dictionary header record
    .macro _HEADER label,len,name 
        .word LINK 
        LINK=.
        .byte len  
        .ascii name
        label:
    .endm 

    ; runtime literal 
    .macro _DOLIT value 
    CALL DOLIT 
    .word value 
    .endm 

    ; 0BRANCH 
    .macro _QBRAN target 
    CALL QBRAN
    .word target
    .endm 

    ; BRANCH 
    .macro _BRAN target 
    CALL BRAN 
    .word target 
    .endm 

;-------------------------
;    FPSW ( -- a )
;    floating state variable
;    bit 0 zero flag 
;    bit 1 negative flag 
;    bit 2 overflow/error flag 
;---------------------------
    _HEADER FPSW,4,"FPSW"
	LDW Y,#UFPSW  
	SUBW X,#2
    LDW (X),Y
    RET

;----------------------------
;    FBASE ( -- a )
;    floating point numerical
;    base variable 
;----------------------------
    _HEADER FBASE,5,"FBASE"
	LDW Y,#UFBASE  
	SUBW X,#2
    LDW (X),Y
    RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   FRESET ( -- )
;   reset FPSW variable 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
    _HEADER FRESET,6,"FRESET"
    _DOLIT 0 
    CALL FPSW 
    CALL STORE 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   FINIT ( -- )
;   initialize floating point 
;   library 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FINIT,5,"FINIT"
    CALL FRESET 
    CALL BASE 
    CALL AT 
    CALL FBASE 
    CALL STORE 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    FER ( -- u )
;    return FPSW value 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FER,3,"FER"
    CALL FPSW 
    CALL AT 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    FZE  ( -- z )
;    return FPSW zero flag 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FZE,3,"FZE"
    CALL FPSW
    CALL AT  
    _DOLIT 1
    CALL ANDD 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    FNE ( -- n )
;    return FPSW negative flag 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FNE,3,"FNE"
    CALL FPSW 
    CALL AT 
    _DOLIT 2 
    CALL ANDD 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   FOV (A -- v )
;   return FPSW overflow flag 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FOV,3,"FOV"
    CALL FPSW
    CALL AT  
    _DOLIT 4 
    CALL ANDD 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    D0= ( d -- 0|-1 )
;    check if double is 0 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DZEQUAL,3,"D0="
    CALL ORR 
    LD A,#0xFF
    LDW Y,X
    LDW Y,(Y)
    JRMI  ZEQ1
    CLR A   ;false
ZEQ1:
    LD     (X),A
    LD (1,X),A
	RET     
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  DNEGATE ( d -- d )
;  negate double (2's complement)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DNEGAT,7,"DNEGATE"
    CALL INVER
    CALL SWAPP 
    CALL INVER 
    LDW  Y,X 
    LDW Y,(Y)
    ADDW Y,#1 
    LDW (X),Y 
    JRNC DNEG1 
    LDW Y,X 
    LDW Y,(2,Y)
    ADDW Y,#1
    LDW (2,X),Y 
DNEG1:
    CALL SWAPP 
    RET      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   U> ( u1 u2 -- f )
;   f = true if u1>u2 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER UGREAT,2,"U>"
    LD A,#0
    LDW Y,X 
    LDW Y,(2,Y)
    LDW YTEMP,Y 
    LDW Y,X
    ADDW X,#2 
    LDW Y,(Y)
    CPW Y,YTEMP 
    JRMI UGREAT1 
    LD A,#0XFF 
UGREAT1:
    LD (X),A 
    LD (1,X),A 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    SFZ ( f# -- f# )
;    set FPSW zero flag 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER SFZ,3,"SFZ"
    CALL DDUP 
    CALL FER 
    _DOLIT 0xfffe 
    CALL ANDD 
    CALL TOR    
    _DOLIT 0x807F 
    CALL ANDD 
    CALL DZEQUAL 
    _DOLIT 1 
    CALL ANDD 
    CALL RFROM 
    CALL ORR 
    CALL FPSW 
    CALL STORE 
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   SFN ( f# -- f# )
;   set FPSW negative flag 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER SFN,3,"SFN"
    CALL DUPP  
    CALL FER 
    _DOLIT 0xFFFD 
    CALL ANDD  
    CALL TOR 
    _DOLIT 0x8000
    CALL ANDD
    LDW Y,X 
    LDW Y,(Y)
    RCF 
    RLCW Y 
    RLCW Y 
    RLCW Y 
    LDW (X),Y 
    CALL RFROM 
    CALL ORR 
    CALL FPSW
    CALL STORE 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   SFV ( -- )
;   set overflow flag 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER SFV,3,"SFV"
    CALL FPSW 
    CALL AT 
    _DOLIT 4 
    CALL ORR 
    CALL FPSW 
    CALL STORE 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  @EXPONENT ( f# -- m e )
;  split float in mantissa/exponent 
;  m mantissa as a double 
;  e exponent as a single 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER ATEXP,9,"@EXPONENT"             
    CALL FRESET
    CALL SFN
    CALL SFZ 
    CALL DUPP
    _DOLIT 0X7F80 
    CALL ANDD 
    _DOLIT 7 
    CALL RSHIFT
    _DOLIT 127 
    CALL SUBB
    CALL TOR 
    _DOLIT 0x7F
    CALL ANDD  ; mantissa as double  
    CALL FNE 
    _QBRAN POSMANT 
    CALL DNEGAT 
POSMANT:
    CALL RFROM 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    !EXPONENT ( m e -- f# )
;    built float from mantissa/exponent 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER STEXP,9,"!EXPONENT"
    CALL DUPP 
    CALL ABSS 
    _DOLIT 127 
    CALL UGREAT
    _QBRAN STEXP1
    CALL SFV  
STEXP1:
    _DOLIT 127 
    CALL PLUS 
    _DOLIT 0XFF 
    CALL ANDD 
    _DOLIT 7 
    CALL LSHIFT 
    CALL TOR   ; R: e 
    CALL DUPP 
    _DOLIT 0X8000 
    CALL ANDD 
    _QBRAN STEXP2 
    _DOLIT 0X8000 
    CALL RFROM 
    CALL ORR
    CALL TOR
    CALL DNEGAT  
STEXP2:
    CALL DUPP 
    _DOLIT 0X7F
    CALL UGREAT 
    _QBRAN STEXP3 
    CALL SFV 
STEXP3:
    _DOLIT 0X7F 
    CALL ANDD 
    CALL RFROM 
    CALL ORR 
    CALL SFZ 
    CALL SFN 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    -ROT ( n1 n2 n3 -- n3 n1 n2 )
;    rotate left 3 top elements 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER NROT,4,"-ROT"
    LDW Y,X 
    LDW Y,(Y)
    LDW YTEMP,Y ; n3  
    LDW Y,X 
    LDW Y,(2,Y) ; Y = n2 
    LDW (X),Y   ; TOS = n2 
    LDW Y,X    
    LDW Y,(4,Y) ; Y = n1 
    LDW (2,X),Y ;   = n1 
    LDW Y,YTEMP 
    LDW (4,X),Y ; = n3 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   D/MOD ( d s - r qd )
;   unsigned divide double by single 
;   return double quotient 
;   and single remainder 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DSLMOD,5,"D/MOD"
        LDW     Y,X             ; stack pointer to Y
        LDW     X,(X)           ; un
        LDW     YTEMP,X         ; save un
        LDW     X,Y
        PUSHW   X               ; save stack pointer
        PUSHW   Y 
        LDW     X,(2,X)           ; X=udh
        LDW     Y,YTEMP         ; divisor 
        DIVW    X,Y 
        LDW     XTEMP,X         ; QUOTIENT hi 
        LDW     X,Y             ; remainder in X 
        POPW    Y 
        LDW     Y,(4,Y)         ; Y=udl (offset before drop)
        LD      A,#16           ; loop count
        SLLW    Y               ; udl shift udl into udh
DSLMOD3:
        RLCW    X               ; rotate udl bit into uhdh (= remainder)
        JRC     DSLMODa         ; if carry out of rotate
        CPW     X,YTEMP         ; compare udh to un
        JRULT   DSLMOD4         ; can't subtract
DSLMODa:
        SUBW    X,YTEMP         ; can subtract
        RCF
DSLMOD4:
        CCF                     ; quotient bit
        RLCW    Y               ; rotate into quotient, rotate out udl
        DEC     A               ; repeat
        JRNE    DSLMOD3           ; if A == 0
DSLMODb:
        LDW     YTEMP,X         ; done, save remainder
        POPW    X               ; restore stack pointer
        LDW     (2,X),Y           ; save quotient low 
        LDW     Y,XTEMP         ; quotient hi 
        LDW     (X),Y           ; save quotient hi 
        LDW     Y,YTEMP         ; remainder onto stack
        LDW     (4,X),Y
        RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   D# ( d -- d )
;   extract least digit 
;   from double integer 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DDIG,2,"D#"
    CALL BASE 
    CALL AT 
    CALL DSLMOD
    CALL ROT   
    CALL DIGIT 
    CALL HOLD 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   E. ( f# -- )
;   print float in scientific 
;   format 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER EDOT,2,"E."
    CALL BASE 
    CALL AT 
    CALL TOR 
    CALL FBASE 
    CALL AT
    CALL BASE 
    CALL STORE 
    CALL ATEXP ; m e 
    CALL TOR   
    CALL FNE 
    _QBRAN EDOT1
    CALL DNEGAT
EDOT1:
    CALL SPACE 
    CALL BDIGS     
EDOT2: 
    CALL DDIG
    CALL RFROM 
    CALL ONEP 
    CALL TOR 
    CALL DUPP
    _QBRAN EDOT3 
    _BRAN EDOT2  
EDOT3:
    CALL OVER 
    CALL BASE 
    CALL AT 
    CALL ULESS 
    _QBRAN EDOT2 
    _DOLIT '.'
    CALL HOLD  
    CALL DDIG
    CALL FNE 
    _QBRAN EDOT4 
    _DOLIT '-'
    CALL HOLD 
EDOT4:       
    CALL EDIGS 
    CALL TYPES
    CALL RFROM 
    CALL QDUP 
    _QBRAN EDOT5     
    _DOLIT 'E'
    CALL EMIT 
    CALL DOT
EDOT5: 
    CALL RFROM 
    CALL BASE 
    CALL STORE  
    RET 
