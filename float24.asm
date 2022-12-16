;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Copyright Jacques Deschênes 2019,2020,2021 
;; This file is part of stm32_eforth  
;;
;;     stm8_eforth is free software: you can redistribute it and/or modify
;;     it under the terms of the GNU General Public License as published by
;;     the Free Software Foundation, either version 3 of the License, or
;;     (at your option) any later version.
;;
;;     stm32_eforth is distributed in the hope that it will be useful,
;;     but WITHOUT ANY WARRANTY;; without even the implied warranty of
;;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;     GNU General Public License for more details.
;;
;;     You should have received a copy of the GNU General Public License
;;     along with stm32_eforth.  If not, see <http:;;www.gnu.org/licenses/>.
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  implement 24 float pointing point format  
;  the mantissa is 16 bits signed 
;  exponent is 8 bits signed  
;  format: seeeeee smmmmmmmmmmmmmmm 
;
;  float24 input format:
;      float24::=['-'|'+']digit+['.'][digits]*['E'['-'|'+']digits+]
;
;  This library is not dependant on double.asm 
;  The code is smaller and faster than float.asm at 
;  the cost of less precision on mantissa. 
;  Exponent range is the same. 
;
;  This format is stored on the stack as a double, i.e. 32 bits 
;  but as 24 bits in memory. 
;
;  specials float values: 
;       m=0 e=-128 +INF  +overflow or float/0.0
;       m=-1 e=-128 -INF -overflow
;
;  The original inspiration for this implementation come from 
;    Forth dimensions Vol. IV #1 
;    published in  may/june 1982
; 
;  STACK frame:
;      -- m e 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  DSWAP and UDS/MOD  
;  required by this library 
;  but are for double operations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DSWAP ( d1 d2 -- d2 d1 )
; swap double numbers 
; floats or double integers 
; input:
;   d1   2 cells value 
;   d2   2 cells value 
; output:
;   d2
;   d1  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DSWAP,5,"DSWAP"
    LDW Y,X 
    LDW Y,(Y)
    PUSHW Y 
    LDW Y,X 
    LDW Y,(2,Y)
    PUSHW Y 
    LDW Y,X 
    LDW Y,(4,Y)
    LDW (X),Y 
    LDW Y,X 
    LDW Y,(6,Y)
    LDW (2,X),Y 
    POPW Y 
    LDW (6,X),Y 
    POPW Y 
    LDW (4,X),Y 
    JP SET_FPSW  ; reflect state of top float 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   UDS/MOD ( ud us - ur qud )
;   unsigned divide double by single 
;   return double quotient 
;   and single remainder 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER UDSLMOD,7,"UDS/MOD"
        LDW     Y,X             ; stack pointer to Y
        LDW     X,(X)           ; us
        LDW     YTEMP,X         ; save us
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    MAX_MANTISSA = 0x7FFF ; absolute value maximum mantissa  

    F24_MAJOR=1 
    F24_MINOR=0 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   FLOAT-VER ( -- )
;   print library version 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FVER,9,"FLOAT-VER"
    CALL DOTQP 
    .byte  18 
    .ascii "\nfloat24 library, "
    _DOLIT F24_MAJOR     
    _DOLIT F24_MINOR 
    JP PRINT_VERSION 
 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   FINIT ( -- )
;   initialize floating point 
;   library 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    _HEADER FINIT,5,"FINIT"
FINIT:
    CLR UFPSW+1 ; reset state bits 
    RET 

;-------------------------
;    FPSW ( -- a )
;    floating point state variable
;    bit 0 zero flag 
;    bit 1 negative flag 
;    bit 2 overflow/error flag 
;---------------------------
;    _HEADER FPSW,4,"FPSW"
FPSW:
	LDW Y,#UFPSW  
	SUBW X,#2
    LDW (X),Y
    RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    FZE  ( -- 0|-1 )
;    return FPSW zero flag 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FZE,3,"FZE"
    LD A,UFPSW+1  
    AND A,#(1<<ZBIT)
    CLRW Y  
    LD YL,A 
    NEGW Y 
    SUBW X,#CELLL 
    LDW (X),Y 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    FNE ( -- 0|-1 )
;    return FPSW negative flag 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FNE,3,"FNE"
    LD A,UFPSW+1 
    AND A,#(1<<NBIT) 
    SRL A 
    CLRW Y 
    LD YL,A 
    NEGW Y 
    SUBW X,#CELLL 
    LDW (X),Y 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   FOV (  -- 0|-1 )
;   return FPSW overflow flag 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FOV,3,"FOV"
    LD A,UFPSW+1 
    AND A,#(1<<OVBIT) 
    SRL A 
    SRL A 
    CLRW Y 
    LD YL,A
    NEGW Y    
    SUBW X,#CELLL 
    LDW (X),Y 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  SET-FPSW ( f24 -- f24 )
;  set float status word
;  en cas de débordement 
;  l'exposant est remplacé par -128  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    _HEADER SET_FPSW,8,"SET-FPSW"
SET_FPSW: 
    CLR UFPSW+1
    LDW Y,X 
    LDW Y,(Y)
    CPW Y,#128 
    JRULT 0$
    CPW Y,#-127 
    JRSGE 0$   
; infinite overflow 
   BSET UFPSW+1,#OVBIT
   LD A,(X)
   JRMI 3$
   CLRW Y 
   LDW (CELLL,X),Y 
   JRA 4$ 
3$: LDW Y,#0X8000
    LDW (CELLL,X),Y 
4$:
   LDW Y,#-128
   LDW (X),Y ; E=-128 
   RET  
0$:
    LDW Y,X 
    LDW Y,(CELLL,Y) ; mantissa  
    JRNE 1$
    BSET UFPSW+1,#ZBIT  ; null mantissa 
    JRA 2$ 
1$: JRPL 2$    
    BSET UFPSW+1,#NBIT  ; negative mantissa 
2$: RET 


PLUS_INF:
    CALL ABORQ
    .byte 5 
    .ascii "+INF " 
    RET 

MINUS_INF:
    CALL ABORQ 
    .byte 5
    .ascii "-INF " 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   F. ( f# -- )
;   print float24 in scientific 
;   format 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FDOT,2,"F."    
    LD A,(1,X) ; e 
    CP A,#-128 
    JRNE 2$ 
; débordement 
    LDW Y,X 
    LDW Y,(CELLL,Y)
    JRPL 1$ 
    JP MINUS_INF 
1$: JP PLUS_INF
2$:    
    CALL BASE 
    CALL AT 
    CALL TOR 
    CALL DECIM 
EDOT0:
    CALL TOR ; r: e
    CALL SPACE
    LD A,(X)
    JRPL 1$
    LD A,#'- 
    CALL putc 
    CALL NEGAT  
1$:  
; float in range {-32767. to 32767. } 
; are printed as integer if no fraction 
    LDW Y,(1,SP) ; E 
    CPW Y,#1
    JRPL 20$ 
    CPW Y,#-4 
    JRSLT 20$ 
    CALL ZERO ; S>D
    CALL RFROM 
    CALL ABSS 
    CALL POWER10  
    CALL UMMOD
    CALL STR 
    CALL TYPES 
    LD A,#'. 
    CALL putc
    CALL QDUP 
    _QBRAN EDOT5 
    CALL STR 
    CALL TYPES
    JP EDOT5 
20$:    
    CALL BDIGS 
EDOT2:
    LDW Y,X 
    LDW Y,(Y)
    CPW Y,#10 
    JRMI EDOT3 
    CALL DIG
    LDW Y,(1,SP)
    INCW Y  ; E++ 
    LDW (1,SP),Y 
    _BRAN EDOT2 
EDOT3: 
    _DOLIT '.'
    CALL HOLD  
    CALL DIG
EDOT4:       
    CALL EDIGS 
    CALL TYPES
    CALL RFROM 
    CALL QDUP 
    _QBRAN EDOT5     
    _DOLIT 'E'
    CALL EMIT
    _DOLIT 1  
    CALL DOTR
EDOT5: 
    CALL RFROM 
    CALL BASE 
    CALL STORE  
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    number parser 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; maximize mantissa value 
;  input: 
;    m     mantissa 
;  output:
;    m     scaled up mantissa 
;    n     log10(multiplier) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    PWR10=3 ; log10(multipler ) 
    PROD=1  ; partial product 
    VARS_SIZE=3 
max_mantissa: ; ( m -- m n )
    _VARS VARS_SIZE 
    CLR (PWR10,SP) 
    LDW Y,X   
    LDW Y,(Y)
    JREQ 2$
1$: LD A,(X) ; mantissa high byte 
    LD YL,A 
    LD A,#10 
    MUL Y,A 
    LDW (PROD,SP),Y ; high product 
    LD YL,A 
    LD A,(1,X) ; mantissa low byte 
    MUL Y,A ; low product 
    CLR A 
    RRWA Y 
    ADDW Y,(PROD,SP)
    RLWA Y 
    JRMI 2$ 
    TNZ A 
    JRNE 2$ 
    LDW (X),Y 
    INC (PWR10,SP)
    JRA 1$ 
2$: 
    SUBW X,#CELLL ; space for n 
    CLR (X)
    LD A,(PWR10,SP)
    LD (1,X),A 
    _DROP_VARS VARS_SIZE 
    RET 



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; first char must be 'E' 
; otherwise abort 
; input:
;   a    tokebn strin addres 
;   a+   pointer to string 
;   cnt- # characters left in string 
;   e1    exponent up to now 
; ouput:
;   a+   updated string pointer 
;   cnt- updated count 
;   e    final exponent    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
parse_exponent: ; a a+ cnt- e1 -- a a+ e   
    CALL OVER  
    _TBRAN 5$
; end of string     
    CALL SWAPP 
    _DROP ; a a+ e1 
    RET 
5$: 
    CALL TOR ; e1 -> r: 
    _DOLIT 'E
    CALL ACCEPT_CHAR
    _TBRAN 1$ 
; bad format abort
0$: ADDW X,#2*CELLL ; drop  a+ cnt- 
    JP ABOR1     
1$: ; exponent follow 'E'  
    CALL QDUP  
    _TBRAN 2$
; no digit after 'E' e=R> 
    CALL RFROM  
    RET  ; a a+ e1    
2$: ; a a+ cnt- r: e1  
    CALL NSIGN 
    CALL TOR ; exponent sign  r: e1 esign  
    CALL DUPP   
    _QBRAN 0$ ; error, no digits after '-', abort 
    CALL ZERO 
    CALL NROT ; a 0 a+ cnt- 
    CALL parse_digits ; -- a e a+ cnt- skip
    _DROP ; skip -- a e a+ cnt- r: e1 esign 
    _TBRAN 0$ ; error cnt not 0   
    CALL SWAPP ; a a+ u 
    CALL DUPP 
    _DOLIT 127 
    CALL GREAT
    _TBRAN 0$ ; exp to big   
    CALL RFROM ; esign
    _QBRAN 3$
    CALL NEGAT ; a a+ e2 
3$: CALL RFROM ; a a+ e2 e1  
    CALL PLUS  ; a a+ e 
4$: RET ; a a+ e 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; return integer after decimal point 
; if next char is '.' parse fraction
; else exit. 
; input:
;    a    original token address 
;    u    mantissa part already parsed before '.' 
;    a    string address should point at '.' 
;    cnt  characters left in string 
;    e1   exponent of integer part  
; output:
;   a+    updated string pointer 
;   cnt-  updated char left count 
;   f_digits  number of fractional digits parsed 
;   m     mantissa
;   efrac  exponent after fraction parsing    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
parse_fraction: ; ( a u a cnt e1 -- a a+ cnt- efrac m )
    CALL TOR ; e1 -> r: 
    _DOLIT '.' 
    CALL ACCEPT_CHAR 
    _TBRAN 1$ 
; not a '.' character, no fractional part.    
0$: CALL ROT ; a a+ cnt- u 
    CALL RFROM  
    CALL SWAPP ; a a+ cnt- efrac m  
    RET 
1$: CALL RAT 
    _QBRAN 2$
; maximm digits already parsed 
; skip all fractional digits 
    CALL SKIP_DIGITS
    _DROP 
    JRA 0$ 
2$: ; parse fraction 
    CALL DUPP
    CALL TOR  ; copy cnt  -> r: 
    CALL parse_digits ; a u a cnt -- a m a+ cnt- skip
; how many digits parsed ?
    CALL OVER  ; cnt- skip cnt-
    CALL RFROM ; cnt- skip cnt- cnt 
    CALL SWAPP  
    CALL SUBB   ; digits parsed
    CALL SWAPP  ;  
    CALL SUBB   ; efrac=parsed-skip   
    CALL TOR ;  
    CALL ROT ; a a+ cnt- m 
    CALL RFROM ; a a+ cnt- m efrac   
    CALL NEGAT ; -efrac
    CALL RFROM ; e1 
    CALL PLUS  ; adjusted efrac  
    CALL SWAPP ; a a+ cnt- efrac m   
    RET  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  round float mantissa 
; input:
;   m    mantissa 
;   r    remainder
;   div  divisor used 
; output:
;   m2   rounded mantissa
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
M_ROUNDING: ; -- m1 r div -- m2 
    CALL SWAPP 
    CALL TWOSTAR 
    CALL GREAT ; div > 2*r ? 
    _TBRAN 1$ 
    LDW Y,X 
    LDW Y,(Y)
    INCW Y 
    LDW (X),Y 
1$: RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   FLOAT?  ( a u a+ cnt- r: base sign -- f24 -3 | ABORT )
;   NUMBER? jump here if extra character after last digit.
;
;   parse string to float
;   clean stack and ABORT if parse fail. 
; input:
;   a     token string address 
;   u     already parsed integer digits
;   a+    point to string after last parsed digit 
;   cnt-   number of char left in string
;   skip  # digits skipped will be added to exponent  
; R:
;   base  BASE value saved at entry of NUMBER?  
;   sign  sign of parsed integer part
; ouput:
;   f24   if format ok 
;   -3    data type identifier 
; -------------
;  ABORT if parse fail 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; vars on R: 

;    _HEADER FLOATQ,6,"FLOAT?"
FLOATQ: 
; BASE must be 10 
; check BASE value 
    CALL BASE 
    CALL AT 
    _DOLIT 10 
    CALL EQUAL 
    _TBRAN 1$ ; accept only base 10 for float.
; bad float format abort   
    _DROPN 4  ; drop u a+ cnt skip 
    JP ABOR1  
1$:  
; NUMBER? may have accumulate over 32767
; check for it 
    LDW Y,X 
    LDW Y,(3*CELLL,Y)
    JRPL 14$ 
    LD A,#10 
    DIV Y,A 
    CP A,#5 
    JRMI 12$ 
    INCW Y 
12$:
    LDW (3*CELLL,X),Y 
    INC (1,X) ; skip++
14$:    
    CALL parse_fraction ; a u a+ cnt- skip r: base sign -- a a+ cnt- digits m r: base sign  
    CALL TOR ; a a+ cnt- e1 r: base sign m 
    CALL parse_exponent ; -- a a+ e r: base sign m 
    CALL TOR ;  a a+ r: base sign m e 
; build float from part on R: 
    _DROPN 2 ; drop a a+ 
    CALL RFROM ; exp r: sign m ndec    
    CALL RFROM ; exp  m r: base sign
    CALL DUPP 
    CALL ZLESS 
    _TBRAN 2$
    CALL max_mantissa
    CALL ROT
    CALL SWAPP  
    CALL SUBB   
    CALL SWAPP 
    _BRAN 4$
2$: 
    _DOLIT 10 
    CALL USLMOD 
; round to nearest integer 
    CALL SWAPP 
    _DOLIT 10 
    CALL M_ROUNDING 
4$:     
    CALL RFROM  ; sign 
    _QBRAN 5$ 
    CALL NEGAT 
5$:
; if m==0 then e=0 
    CALL DUPP  
    _TBRAN 6$ 
    CLRW Y 
    LDW (CELLL,X),Y 
6$:
    CALL SWAPP ; m e 
    CALL SET_FPSW 
    _DOLIT -3 
    CALL RFROM 
    CALL BASE 
    JP STORE       

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  FLITERAL ( f24 -- )
;  compile 24 bits literal 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FLITER,COMPO+IMEDD+8,"FLITERAL"
    CALL COMPI 
    .word dof24lit 
    CALL CCOMMA 
    JP   COMMA 


; runtime for FLITERAL
; 24 bits literal 
dof24lit:
    SUBW X,#2*CELLL  
    LDW Y,(1,SP)
    LD A,(Y)
    CLRW Y 
    LD YL,A 
    TNZ A 
    JRPL 1$
    LD A,#255 
    LD YH,A   
1$: LDW (X),Y 
    LDW Y,(1,SP)
    LDW Y,(1,Y)
    LDW (CELLL,X),Y 
    POPW Y 
    JP (3,Y)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   FCONST ( f24 -- )
;   create a float24 constant 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FCONST,6,"FCONST" 
        CALL TOKEN
        CALL SNAME 
        CALL OVERT 
        CALL COMPI 
        .word DOF24CONST 
        CALL SWAPP 
        CALL COMMA ; compile m 
        CALL CCOMMA ; compile e  
        CALL FMOVE
        CALL QDUP 
        CALL QBRAN 
        .word SET_RAMLAST  
        CALL UPDATPTR  
        RET          

DOF24CONST:
    LDW Y,(1,SP) 
    SUBW x,#2*CELLL ; space for float 
    LD A,(2,Y) ; e 
    CLRW Y 
    LD YL,A
    TNZ A 
    JRPL 1$
    LD A,#255
    LD YH,A 
1$:      
    LDW (X),Y 
    POPW Y  
    LDW Y,(Y) ; m 
    LDW (CELLL,X),Y 
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   FVAR "name" ( -- )
;   create a float24 variable 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER F24VAR,4,"FVAR"
    CALL HERE
    CALL DUPP
    _DOLIT 3  
    CALL PLUS 
    CALL VPP 
    CALL STORE
    CALL CREAT
    CALL DUPP
    CALL COMMA
    CALL ZERO
    CALL OVER 
    CALL CSTOR 
    CALL ZERO 
    CALL SWAPP 
    CALL ONEP  
    CALL STORE 
    CALL FMOVE ; move definition to FLASH
    CALL QDUP 
    CALL QBRAN 
    .word SET_RAMLAST   
    CALL UPDATVP  ; don't update if variable kept in RAM.
    JP UPDATPTR


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   F! ( f24 a -- )
;   store float24 
;  stored in VAR as: mlo mhi e 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER F24STO,2,"F!"
    LDW Y,X 
    LDW Y,(Y) ; address 
    _DROP ; a 
    LD A,(1,X) ; e 
    LD (2,Y),A 
    LD A,(2,X) ; m high byte 
    LD (Y),A 
    LD A,(3,X) ; m low byte 
    LD (1,Y),A 
    _DDROP ; m  
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   F@ ( a -- f24 )
;   stack float24 variable 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER F24AT,2,"F@"
    LDW Y,X 
    LDW Y,(Y) ; address 
    LD A,(2,Y); e 
    SUBW X,#CELLL 
    CLR (X)
    TNZ A 
    JRPL 1$ 
    CPL (X)
1$: LD (1,X),A 
    LDW Y,(Y)
    LDW (CELLL,X),Y ; m 
    JP SET_FPSW 

;;;;;;;;;;;;;;;;;;;;
; 10's powers  
;;;;;;;;;;;;;;;;;;;;
m_scaler: 
    .word 1 ; 0 
    .word 10 ; 1 
    .word 100 ; 2
    .word 1000 ; 3 
    .word 10000 ; 4 
    .word 0 ; too big 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; return 10^log 
;;;;;;;;;;;;;;;;;;;;;;;;;;;
POWER10: ; ( log -- power10 )
    LDW Y,#m_scaler 
    LD A,(1,X)
    SLL A
    LDW (X),Y 
    SUBW X,#CELLL 
    CLR (X)
    LD (1,X),A 
    CALL PLUS 
    CALL AT 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
; sort to float to put 
; smallest exponent on top 
; input:
;   m1    f1 mantissa
;   e1    f1 exponent  
;   m2    f2 mantissa 
;   e2    f2 exponent
; output:
;   big_m
;   big_m 
;   small_m 
;   small_e 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sort_floats:  
    CALL TOR  ; m1 e1 m2 r: e2  
    CALL OVER ; m1 e1 m2 e1 r: e2 
    CALL RAT  ; m1 e1 m2 e1 e2 r: e2 
    CALL LESS 
    _QBRAN 4$ 
; f1 < f2 -- m1 e1 m2 r: e2 
    CALL NROT ; m2 m1 e1 r: e2 
    CALL RFROM  ; m2 m1 e1 e2  
    CALL NROT ; m2 e2 m1 e1 
    RET
4$: ; f2 < f1 
    CALL RFROM 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; absolute difference between exponent 
; discard e2 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
delta_exp: ; ( m1 e1 m2 e2 -- m1 e1 m2 delta )
    _DOLIT 2 
    CALL PICK 
    CALL SUBB 
    CALL ABSS ; m1 e1 m2 delta 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; return absolute value of m 
; and its sign 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ABS_MSIGN: ; ( m -- abs(m) msign )
    CLRW Y 
    LD A,(X)
    JRPL 1$
    CPLW Y 
1$: SUBW X,#CELLL 
    LDW (X),Y 
    CALL TOR 
    CALL ABSS 
    CALL RFROM 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  F-ALIGN ( f#1 f#2 -- m1 m2 e )
;  align to same exponent 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    _HEADER FALIGN,7,"F-ALIGN"
FALIGN: 
    CALL sort_floats 
    CALL delta_exp 
    CALL QDUP 
    _TBRAN 1$ 
; delta=0, no scaling required     
    CALL SWAPP 
    RET 
1$:
; if delta > 5 out of scaling range 
; clear smallest mantissa      
    CALL DUPP 
    _DOLIT 5 
    CALL GREAT 
    _QBRAN 2$
; out of range 
; discard delta 
    _DROP ; m1 e1 m2
    CLRW Y 
    LDW (X),Y ; m2=0  
    CALL SWAPP ; m1 m2 e 
    RET 
2$: ; scale top float 
    CALL SWAPP 
    CALL ABS_MSIGN ; m1 e1 delta um2 msign 
    CALL TOR ; m1 e1 delta um2 r: msign 
    CALL SWAPP ; m1 e1 um2 delta 
; delta=5 is special case 
; divide by 10 and decrement delta 
    CALL DUPP ; delta 
    _DOLIT 5 
    CALL EQUAL     
    _QBRAN 6$ 
    LDW Y,#10
    LDW (X),Y 
    CALL USLMOD 
    CALL SWAPP 
    LDW Y,#4 
    LDW (X),Y ; delta=4      
6$: ; delta -> {1..4} -- m1 e1 m2 delta
    CALL POWER10 
    CALL DUPP 
    CALL TWOSL 
    CALL TOR 
    CALL USLMOD
    CALL SWAPP 
    CALL RFROM  
    CALL LESS 
    _TBRAN 7$
    CALL ONEP
7$: CALL RFROM ; msign 
    _QBRAN 8$ 
    CALL NEGAT      
8$: CALL SWAPP ; m1 m2 e 
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  add 2 mantissa and ajust 
;  for overflow 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MPLUS: ; m1 m2 e -- m* e* )  
    CALL TOR ; r: e 
    LDW Y,X 
    LDW Y,(Y)
    PUSHW Y  ; r: e m2 
    _DROP ; m1 r: e m2 
    LDW Y,X 
    LDW Y,(Y) ; m1 
    ADDW Y,(1,SP) ; m1 + m2 
    _RDROP ; r: e 
    LDW (X),Y ; sum 
    JRV 1$
    JRA 3$  
1$: ; scaledown mantissa 
    CLRW Y 
    JRNC 2$
    CPLW Y 
2$: INC (2,SP) ; inc e 
; convert sum to double 
    SUBW X,#CELLL 
    LDW (X),Y 
    _DOLIT 10 
    CALL MSMOD
    CALL SWAPP ; remainder on top 
    _DOLIT 10 
    CALL M_ROUNDING 
3$: 
    CALL RFROM  ; m* e* 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   F+ ( f#1 f#2 -- f#1+f#2 )
;   float addition 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FPLUS,2,"F+"
    CALL FALIGN 
    CALL MPLUS
    CALL SET_FPSW
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  F- ( f#1 f#2 -- f#1-f#2 )
;  substraction 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FSUB,2,"F-"
    CALL FNEGA 
    CALL FPLUS
    RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;
; return an approximation 
; of log10(u)
;;;;;;;;;;;;;;;;;;;;;;;;;;;
LOG10: ; ( ud  -- ud ~log10(ud) )
    LD A,#5  ; /100000
    LDW Y,X 
    LDW Y,(Y)
    CPW Y,#5000 
    JRPL 5$ 
    DEC A    ; /10000
    CPW Y,#500 
    JRPL 5$ 
    DEC A    ; /1000
.if 0 ; log10 is never < 3
    CPW Y,#50 
    JRPL 5$
    DEC A    ; 100
    JRA 5$
    CPW Y,#5 
    JRPL 5$
    DEC A    ; 10 
    TNZ (CELLL,X) ; ud low word 
    JRPL 5$
    DEC A    ; 1 
.endif     
5$: SUBW X,#CELLL 
    CLR (X)
    LD (1,X),A 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   SCALE>M ( ud1 -- e u )
;   scale down a double  
;   by repeated ud1/10
;   until ud<=MAX_MANTISSA   
;   e is log10 exponent of scaled down
;   u is scaled down ud1 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    _HEADER SCALETOM,7,"SCALE>M"
    DIVSR=1 
    LOG=3
    EXP=4
    VARS_SIZE=4   
SCALETOM:
    _VARS VARS_SIZE 
    CALL LOG10   
.if 0
    CALL DUPP 
    _TBRAN 0$ 
    CALL SWAPP
    _DROP  
    _DROP_VARS VARS_SIZE
    RET
.endif  
0$:    
    LD A,(1,X) 
    LD (LOG,SP),A 
    _DOLIT 4 
    CALL MIN 
    LD A,(1,X) ; <=4
    LD (EXP,SP),A  
    CALL POWER10 
    LDW Y,X 
    LDW Y,(Y) 
    LDW (DIVSR,SP),Y
    CALL UDSLMOD
    LD A,(LOG,SP)
    CP A,#5 
    JRMI 2$ 
    CALL ROT   ; ud r  
    INC (EXP,SP)
    LDW Y,#10 
    LDW (DIVSR,SP),Y 
    LDW (X),Y 
    CALL UDSLMOD 
2$: ; r q
    _DROP ; quotient high word 
    CALL SWAPP ; q r 
    CALL RFROM ; DIVISR 
    CALL M_ROUNDING
    CALL RFROM ; LOG:EXP 
    CLR (X) ; 
    CALL SWAPP 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    F* ( f#1 f#2 -- f#3 )
;    float24 product 
;    f#3=f#1 * f#2 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FSTAR,2,"F*"
    CALL TOR   ; m1 e1 m2 R: e2 
    CALL SWAPP ; m1 m2 e1  R: e2 
    CALL RFROM 
    CALL PLUS  ; m1 m2 e 
    CALL TOR   ; m1 m2 R: e  
    CALL ABS_MSIGN 
    CALL TOR   ; m1 um2 r: e m2sign 
    CALL SWAPP 
    call ABS_MSIGN ; um2 um1 m1sign r:= e m2sign
    CALL RFROM   
    CALL XORR 
    CALL NROT   ; *sign um2 um1 R: e 
    CALL UMSTA 
    CALL SCALETOM 
    CALL SWAPP 
    CALL RFROM 
    CALL PLUS 
    CALL TOR 
    CALL SWAPP 
    _QBRAN 1$
    CALL NEGAT 
1$: CALL RFROM  
    JP SET_FPSW 

DIV_0:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  F/ ( f#1 f#2 -- f#3 )
;  float division
;  f#3 = f#1/f#2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    EXP=3  ; exponent 
    DIVSR=1 ; divisor 
    _HEADER FSLASH,2,"F/"
; check for /0 
    LDW Y,X 
    LDW Y,(1,Y) ; m2 
    JRNE 0$ 
; division by 0.0 ABORT  
    _DROPN 3  
    CALL ABORQ 
    .byte 15
    .ascii  " division by 0 "
    CALL PRESE 
    JP QUIT 
0$:
    CALL TOR    ; m1 e1 m2   R: e2 
    CALL SWAPP
    CALL RFROM 
    CALL SUBB 
    CALL TOR   ; m1 m2 R: e   
    CALL ABS_MSIGN  
    CALL TOR   ; m1 um2 R: e m2s 
    CALL SWAPP  ;um2 m1 R: e m2s 
    CALL ABS_MSIGN  ; um2 m1 m1s R: e m2s 
    CALL RFROM  ; um2 m1 m1s m2s R: e
    CALL XORR   
    CALL NROT  ; qsign um2 um1 R: e 
    CALL SWAPP ; qsign um1 um2 R: e  
    CALL DUPP 
    CALL TOR   ; qsign um1 um2 R: e um2 
    CALL USLMOD ; qsign ur q R: e um2 
; fraction loop 
; check for null remainder 
    LD A,(CELLL,X)
    OR A,(CELLL+1,X)
    JREQ FSLASH8 
; get fractional digits from remainder until mantissa saturate
; qsign remainder mantissa R: e divisor 
; check for mantissa saturation 
    CALL DUPP 
    _DOLIT 3276
    CALL UGREAT
    _TBRAN FSLASH8 ; another loop would result in mantissa overflow 
; select multiplicator 
; use the largest possible 
    LDW Y,X
    LDW Y,(Y)  
    CPW Y,#3 
    JRUGT 1$ 
    LDW Y,#10000
    LD A,#-4 
    JRA 5$
1$: CPW Y,#32  
    JRUGT 2$
    LDW Y,#1000
    LD A,#-3 
    JRA 5$ 
2$: CPW Y,#327
    JRUGT 3$ 
    LDW Y,#100
    LD A,#-2 
    JRA 5$ 
3$: LDW Y,#10 
    LD A,#-1
5$: ; adjust exponent 
    ADD A,(EXP+1,SP)
    LD (EXP+1,SP),A
    LD A,#-1 
    ADC A,(EXP,SP) 
    LD (EXP,SP),A 
; push multiplier on stack 
    SUBW X,#CELLL ; space on s: for multiplier
    LDW (X),Y 
    SUB SP,#CELLL ; space on r: for multiplier  
    LDW (1,SP),Y ; multiplier -> r: 
    CALL STAR  
; to get next decimal digit 
; remainder*multiplier/um2
; then quotient is fractional digits        
    CALL SWAPP
    CALL RFROM   
    CALL UMSTA 
    CALL RAT 
    CALL UMMOD  ; r q  
    CALL SWAPP ; mantissa frac_digit remainder R:  e divisor  
    CALL TOR  ; mantissa frac_digit R: e divisor remainder 
    CALL PLUS ; mantissa+frac_digit 
    CALL RFROM ; mantissa remainder R: e divisor
    CALL SWAPP   
FSLASH8: ; qsign remainder mantissa R: e divisor 
; round to nearest digit, i.e r>=divisor/2
    CALL SWAPP 
    CALL RFROM 
    CALL TWOSL 
    CALL ULESS  
    _TBRAN FSLASH85 
    CALL ONEP 
FSLASH85: 
    CALL SWAPP ; quotient qsign
    _QBRAN FSLASH9 
    CALL NEGAT  
FSLASH9:
    CALL RFROM  ; exponent 
    JP SET_FPSW
    


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   S>F  ( n -- f# )
;   convert double to float 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER STOF,3,"S>F"
    CALL ABS_MSIGN 
    CALL SWAPP 
    CALL max_mantissa
    CALL ZERO 
    CALL SWAPP 
    CALL SUBB 
    CALL TOR  
    CALL SWAPP 
    _QBRAN 1$ 
    CALL NEGAT  
1$: CALL RFROM 
    JP SET_FPSW

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   F>S  ( f# -- n )
;  convert float24 to single  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FTOS,3,"F>S"
    CALL QDUP
    _QBRAN FTOS9 ; no scaling required 
    CALL TOR    ; m r: e 
    CALL ABS_MSIGN ; um sign r: e 
    CALL SWAPP 
    CALL RFROM  
    CALL DUPP   
    CALL ZLESS 
    _QBRAN FTOS4 ; um sign e 
; negative exponent
; divide m/10^e  
    CALL ABSS
    _DOLIT 5 
    CALL MIN
    CALL DUPP 
    _DOLIT 5 
    CALL EQUAL 
    _QBRAN FTOS3 
    LDW Y,#10 
    LDW (X),Y 
    CALL USLMOD 
    CALL SWAPP 
    LDW Y,#4 
    LDW (X),Y 
FTOS3:   
    CALL POWER10 
    CALL DUPP 
    CALL TOR 
    CALL USLMOD 
; rounding
    CALL SWAPP 
    CALL RFROM 
    CALL TWOSL 
    CALL LESS 
    _TBRAN FTOS8   
    CALL ONEP     
FTOS8:
    CALL SWAPP 
    _QBRAN FTOS9 
    CALL NEGAT 
    RET 
FTOS4:
; positive exponent
; imply overflow 
; return -32768 
    _DDROP ; sign e
    LDW Y,#0x8000
    LDW (X),Y
    BSET UFPSW+1,#OVBIT 
FTOS9:          
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;
;   F0< ( f# -- f )
;   true if f#<0
;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FZLESS,3,"F0<"
    _DROP 
    JP ZLESS 


;;;;;;;;;;;;;;;;;;;;;;;;
;   F< ( f#1 f#2 -- f )
;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FLESS,2,"F<"
    CALL FSUB 
    JRA FZLESS 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   F> ( f#1 f#2 -- f )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FGREAT,2,"F>"
    CALL DSWAP 
    JRA FLESS 



;;;;;;;;;;;;;;;;;;;;;;;;;
;   F= ( f#1 f#2 -- f ) 
;   true if f#1==f#2 
;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FEQUAL,2,"F="
    CLR A 
    LDW Y,X 
    LDW Y,(Y)
    LDW YTEMP,Y  
    LDW Y,X 
    LDW Y,(4,Y)
    CPW Y,YTEMP
    JRNE 1$
    LDW Y,X 
    LDW Y,(2,Y)
    LDW YTEMP,Y 
    LDW Y,X 
    LDW Y,(6,Y)
    CPW Y,YTEMP 
    JRNE 1$ 
    LD A,#255
1$: 
    ADDW X,#CELLL 
    LD (X),A 
    LD (1,X),A 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;
;   F0= ( f# -- f )
;   true if f# is 0.0 
;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FZEQUAL,3,"F0="
    _DROP  
    JP ZEQUAL  

;;;;;;;;;;;;;;;;;;;;;;;;;;
;  FNEGATE ( f#1 -- f#2 )
;  f#2 is negation of f#1 
;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FNEGA,7,"FNEGATE"
    CALL TOR 
    CALL NEGAT
    CALL RFROM 
    JP SET_FPSW
     

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  FABS ( f#1 -- abs(f#1) )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FABS,4,"FABS"
    CALL TOR 
    CALL ABSS 
    CALL RFROM 
    JP SET_FPSW
     
