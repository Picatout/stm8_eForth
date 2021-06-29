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

    .module FLOAT 

.if WANT_DOUBLE 
; already included 
.else
;  must be included  
    .include "double.asm"
.endif  

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
;   E. ( f# -- )
;   print float in scientific 
;   format 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER EDOT,2,"E."
    CALL BASE 
    CALL AT 
    CALL TOR 
    _DOLIT 10 
    CALL BASE 
    CALL STORE 
    CALL ATEXP ; m e 
EDOT0:
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

;;;;;;;;;;;;;;;;;;;;;;;;;
;   F. (f# -- )
;   print float in fixed
;   point format. 
;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FDOT,2,"F."
    CALL BASE 
    CALL AT 
    CALL TOR 
    _DOLIT 10 
    CALL BASE 
    CALL STORE 
    CALL    ATEXP
    CALL    DUPP  
    CALL    ABSS 
    _DOLIT  8
    CALL    GREAT 
    _QBRAN  FDOT1 
    JP      EDOT0 
FDOT1:
    CALL    SPACE 
    CALL    TOR 
    CALL    FNE 
    _QBRAN  FDOT0 
    CALL    DNEGAT 
FDOT0: 
    CALL    BDIGS
    CALL    RAT  
    CALL    ZLESS 
    _QBRAN  FDOT6 
FDOT2: ; e<0 
    CALL    DDIG 
    CALL    RFROM
    CALL    ONEP 
    CALL    QDUP 
    _QBRAN  FDOT3 
    CALL    TOR 
    _BRAN   FDOT2 
FDOT3:
    _DOLIT  '.' 
    CALL    HOLD 
    CALL    DDIGS
    _BRAN   FDOT9  
FDOT6: ; e>=0 
    _BRAN   FDOT8
FDOT7:     
    _DOLIT  '0'
    CALL    HOLD 
FDOT8:
    CALL    DONXT 
    .word   FDOT7
    CALL    DDIGS 
FDOT9:
    CALL    FNE 
    _QBRAN  FDOT10 
    _DOLIT '-' 
    CALL   HOLD 
FDOT10:
    CALL    EDIGS 
    CALL    TYPES 
    CALL    RFROM 
    CALL    BASE 
    CALL    STORE 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; return parsed exponent or 
; 0 if failed
; at entry exprect *a=='E'    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
parse_exponent: ; a cntr -- e -1 | 0 
    CALL TOR   ; R: cntr 
    CALL DUPP 
    CALL CAT 
    _DOLIT 'E' 
    CALL EQUAL 
    _QBRAN 1$
    CALL ONEP 
    CALL RFROM  ; a cntr 
    CALL ONEM
    CALL DUPP 
    _QBRAN 2$ ; a cntr 
    CALL ZERO
    CALL DUPP 
    CALL DSWAP ; 0 0 a cntr  
    CALL nsign 
    CALL TOR   ; R: esign  
    CALL parse_digits
    _QBRAN PARSEXP_SUCCESS ; parsed to end of string 
; failed invalid character
    CALL DDROP ; 0 a 
1$: 
    CALL RFROM ; sign||cntr  
2$:
    CALL DDROP  ; a cntr || a sign || 0 cntr   
    CALL ZERO   ; return only 0 
    RET 
PARSEXP_SUCCESS: 
    CALL DDROP ; drop dhi a 
    CALL RFROM ; es 
    _QBRAN 1$
    CALL NEGAT
1$:
    _DOLIT -1 ; -- e -1 
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   FLOAT?  ( a dlo dhi a+ cntr sign d? -- f -3 | a 0 )
;   called by NUMBER? 
;   convert string to float 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FLOATQ,5,"FLOAT?"
    _QBRAN FLOATQ0 
    _BRAN FLOAT_ERROR  ; not a float, string start with '#'
FLOATQ0:
; BASE must be 10 
    CALL BASE 
    CALL AT 
    _DOLIT 10 
    CALL EQUAL 
    _QBRAN FLOAT_ERROR 
; if float next char is '.' or 'E' 
    CALL TOR ; R: sign  
    CALL TOR ; R: sign cntr 
    CALL DUPP
    CALL CAT 
    _DOLIT '.' 
    CALL EQUAL 
    _QBRAN FLOATQ1 ; not a dot 
    CALL ONEP 
    CALL RFROM  ; dlo dhi a cntr R: sign  
    CALL ONEM 
    CALL DUPP 
    CALL TOR  ; R: sign cntr 
; parse fractional part
    CALL parse_digits ; dlo dhi a cntr -- dm a cntr 
    CALL DUPP 
    CALL RFROM 
    CALL SWAPP 
    CALL SUBB ; fd -> fraction digits count 
    CALL TOR  ; dlo dhi a cntr R: sign fd 
    CALL DUPP ; cntr cntr  
    _QBRAN 1$ ; end of string, no exponent
    _BRAN FLOATQ2
1$: CALL SWAPP 
    CALL DROP ; a
    _BRAN FLOATQ3        
FLOATQ1: ; must push fd==0 on RSTACK 
    CALL RFROM ; cntr 
    CALL ZERO  ; fd 
    CALL TOR   ; dm a cntr R: sign fd 
FLOATQ2: 
    CALL parse_exponent 
    _QBRAN FLOAT_ERROR0 ; exponent expected 
FLOATQ3: ; dm 0 || dm e  
    CALL RFROM ;  fd  
    CALL SUBB  ; exp=e-fd 
    CALL NROT 
    CALL RFROM  ; sign 
    _QBRAN FLOATQ4 
    CALL DNEGA 
FLOATQ4:
    CALL ROT 
    CALL STEXP 
    CALL ROT 
    CALL DROP 
    _DOLIT -3 
    RET       
FLOAT_ERROR0: 
    CALL DRFROM ; sign df      
FLOAT_ERROR: 
    CALL DEPTH 
    CALL CELLS 
    CALL SPAT 
    CALL SWAPP 
    CALL PLUS  
    CALL SPSTO 
    _DOLIT 0 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  LSCALE ( f# -- f# )
;  m *=fbase , e -= 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER LSCALE,6,"LSCALE"
    CALL ATEXP 
    _DOLIT 1 
    CALL SUBB 
    CALL TOR
    _DOLIT 10 
    CALL DSSTAR
    CALL RFROM 
    CALL STEXP 
    RET  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  RSCALE ( f# -- f# )
;  m /=fbase , e+=1 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER RSCALE,6,"RSCALE"
    CALL ATEXP 
    _DOLIT 1 
    CALL PLUS 
    CALL TOR 
    _DOLIT 10 
    CALL DSLMOD 
    CALL ROT 
    CALL DROP 
    CALL RFROM 
    CALL STEXP 
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    F* ( f#1 f#2 -- f#3 )
;    float product 
;    f#3=f#1 * f#2 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FSTAR,2,"F*"
    CALL ATEXP ; f#1 m2 e2 
    CALL TOR   
    CALL DSWAP ; m2 f#1
    CALL ATEXP ; m2 m1 e1 
    CALL RFROM ; m2 m1 e1 e2 
    CALL PLUS  ; m2 m1 e 
    CALL TOR
    CALL DSTAR ; m2 m1 m2*m1 
    CALL DSIGN 
    CALL NROT 
    CALL DABS 
FSTAR1: ; scale down 32 bit to 24 bits 
    CALL DUPP
    _DOLIT 0X7F   
    CALL GREAT 
    _QBRAN FSTAR2 
    _DOLIT 10 
    CALL DSLMOD 
    CALL ROT 
    CALL DROP
    CALL RFROM 
    CALL ONEP 
    CALL TOR  
    _BRAN FSTAR1
FSTAR2:
    CALL ROT 
    _QBRAN FSTAR3 
    CALL DNEGA 
FSTAR3:     
    CALL RFROM 
    CALL STEXP 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  F/ ( f#1 f#2 -- f#3 )
;  float division
;  f#3 = f#1/f#2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FSLASH,2,"F/"
    CALL ATEXP  ; f#1 dm2 e2  
    CALL TOR    ; f#1 dm2   R: e2 
    CALL DSIGN  ; f#1 dm2 s2 
    CALL TOR    ; f#1 dm2  R: e2 s2 
    CALL DABS   ; f#1 +dm2 
    CALL DSWAP  ; +dm2 f#1 
    CALL ATEXP  ; +dm2 dm1 e1 
    CALL RFROM  ; +dm2 dm1 e1 s2 
    CALL SWAPP  ; +dm2 dm1 s1 e1 
    CALL TOR    ; +dm2 dm1 s2 R: e2 e1  
    CALL NROT   ; +dm2 s2 dm1 
    CALL DSIGN  ; +dm2 s2 dm1 s1 
    CALL NROT   ; +dm2 s2 s1 dm1 
    CALL DABS   ; +dm2 s2 s1 +dm1  
    CALL TOR    
    CALL TOR    ; +dm2 s2 s1 R: e2 e1 +dm1  
    CALL XORR   ; +dm2 s R: e2 e1 +dm1 
    CALL NROT   ; s +dm2 
    CALL RFROM 
    CALL RFROM  ; s +dm2 +dm1 
    CALL DSWAP  ; s +dm1 +dm2 
FSLASH1:
    CALL DUPP 
    _QBRAN FSLASH4 
FSLASH2: 
; reduce divisor
    _DOLIT 10 
    CALL DSLMOD
    CALL ROT 
    CALL DROP ; drop remainder 
    CALL TOR 
    CALL TOR
; redure divident      
    _DOLIT 10 
    CALL DSLMOD 
    CALL ROT    
    CALL DROP    ; drop remainder 
    CALL RFROM 
    CALL RFROM   ; s +dm1 +dm2 
    _BRAN FSLASH1 
FSLASH4:
    CALL DROP   ; drop divisor hi, is 0 
    CALL DSLMOD 
; scale up dquot to include remainder 
    _DOLIT 2 
    CALL PICK 
    CALL NROT  ; s r r dquot 
FSL1:
    _DOLIT 2
    CALL PICK 
    _QBRAN FSL4 
    _DOLIT 10 
    CALL DSSTAR
    CALL RFROM 
    CALL ONEM 
    CALL TOR 
    CALL ROT 
    _DOLIT 10 
    CALL SLASH 
    CALL NROT 
    _BRAN FSL1 
FSL4:
    CALL ROT
    CALL TOR 
    CALL ROT 
    CALL RFROM 
    CALL DPLUS  
    CALL ROT    ; dquot s 
    _QBRAN FSLASH5 
    CALL DNEGA  ; negate quotient 
FSLASH5:
    CALL RFROM 
    CALL RFROM 
    CALL PLUS   
    CALL STEXP 
    RET     

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   SCALE> ( # -- #  )
;   scale down a double dividing it 
;   by 10;  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER SCALETO,6,"SCALE>"
    CALL DSIGN 
    CALL TOR 
    CALL DABS 
SCAL1:
    _DOLIT 10 
    CALL DSLMOD 
    CALL ROT  
    CALL DROP 
    CALL RFROM 
    _QBRAN SCAL2 
    CALL DNEGAT 
SCAL2: 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   D>F  ( # -- f# )
;   convert double to float 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DTOF,3,"D>F"
    CALL DSIGN 
    CALL TOR
    CALL DABS  
    CALL ZERO 
    CALL NROT
DTOF1:      
    CALL DDUP 
    _DOLIT 0XFFFF 
    _DOLIT 0X7F 
    CALL DGREAT 
    _QBRAN DTOF4
    CALL ROT 
    CALL ONEP 
    CALL NROT 
    CALL SCALETO 
    _BRAN DTOF1 
DTOF4:     
    CALL RFROM 
    _QBRAN DTOF6
    CALL DNEGAT 
DTOF6: 
    CALL ROT 
    CALL STEXP 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   F>D  ( f# -- # )
;  convert float to double 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FTOD,3,"F>D"
    CALL ATEXP 
    CALL QDUP
    _QBRAN FTOD8
    CALL DUPP   
    CALL ZLESS 
    _QBRAN FTOD4 
; negative exponent 
    CALL ABSS 
    CALL TOR
    _BRAN FTOD2  
FTOD1:
    CALL DDUP 
    CALL DZEQUAL 
    CALL INVER 
    _QBRAN FTOD3 
    _DOLIT 10 
    CALL DSLMOD 
    CALL ROT 
    CALL DROP
FTOD2:      
    _DONXT FTOD1
    RET  
FTOD3: 
    CALL RFROM 
    CALL DROP 
    RET 
; positive exponent 
FTOD4:
    CALL TOR 
    _BRAN FTOD6
FTOD5:
    _DOLIT 10 
    CALL ZERO 
    CALL DSTAR 
FTOD6: 
    _DONXT FTOD5 
FTOD8:     
    RET 
