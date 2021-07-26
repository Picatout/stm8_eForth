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

;************************************
;    doubles integers library 
;    doubles are signed 32 bits 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


    .module DOUBLE 

    DVER_MAJOR=1 
    DVER_MINOR=0 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  DBL-VER ( -- )
;  print library version 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DBLVER,7,"DBL-VER"
    CALL CR 
    CALL DOTQP 
    .byte  24 
    .ascii "double integer library, "
    CALL PRT_LICENCE
    CALL COPYRIGHT  
    _DOLIT DVER_MAJOR 
    _DOLIT DVER_MINOR  
    JP PRINT_VERSION  


; check for negative sign 
; ajust pointer and cntr 
nsign: ; ( addr cntr -- addr cntr f ) 
    SUBW X,#CELLL ; a cntr f 
    LDW Y,X 
    LDW Y,(4,Y) ; addr 
    LD A,(Y) ; char=*addr  
    CP A,#'-' 
    JREQ NEG_SIGN 
    CLR A  
    JRA STO_SIGN 
NEG_SIGN:
; increment addr 
    LDW Y,X 
    LDW Y,(4,Y)
    ADDW Y,#1   ;addr+1 
    LDW (4,X),Y 
; decrement cntr 
    LDW Y,X
    LDW Y,(2,Y)
    SUBW Y,#1   ;cntr-1 
    LDW (2,X),Y 
    LD A,#0XFF
STO_SIGN:   
    LD (X),A 
    LD (1,X),A 
    RET 


; get all digits in row 
; stop at first non-digit or end of string 
; ( dlo dhi a cntr -- dlo dhi [ a+ cntr- | a+ 0 ] )
parse_digits:
    CALL DUPP 
    _QBRAN parse_d5  
    CALL TOR   ; dlo dhi a R: cntr 
    CALL COUNT ; dlo dhi a+ char 
    CALL BASE 
    CALL AT 
    CALL DIGTQ 
    _QBRAN parse_d4 ; not a digit
    CALL DTOR  ; dlo dhi R: cntr a+ c  
    CALL BASE 
    CALL AT 
    CALL DSSTAR
    CALL RFROM 
    CALL ZERO 
    CALL DPLUS 
    CALL RFROM  ; dlo dhi a+ 
    CALL RFROM ; dlo dhi a+ cntr 
    CALL ONEM 
    JRA parse_digits ; dlo dhi a+ R: 
parse_d4:
    LDW Y,X 
    LDW Y,(2,Y)
    DECW Y  ; dec(a)
    LDW (2,X),Y 
    POPW Y 
    LDW (X),Y ; dlo dhi a cntr  
parse_d5:
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   NUMBER? (a -- s -1 |d -2 | a F )
;   convert string to integer 
;   double begin with '#' 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER NUMBQ,7,"NUMBER?"
; save current base value 
    CALL BASE 
    CALL AT 
    CALL TOR  ; R: base 
; initialize integer to 0     
    SUBW X,#4 ; create space for a double  
    CLRW Y 
    LDW (X),Y 
    LDW (2,X),Y ; a 0 0 R: base  
    _DOLIT 2 
    CALL PICK  ; a 0 0 a R: base    
    CALL COUNT ; a 0 0 a+ n 
; check for '#' double integer 
    CALL OVER  ; a 0 0 a+ n a+
    CALL CAT   ; a 0 0 a+ n c 
    _DOLIT '#' ; a 0 0 a+ n c '#' 
    CALL EQUAL 
    CALL TOR   ; a 0 0 a+ n R: base d? 
    CALL RAT   ; a 0 0 a+ n d? R: base d?
    _QBRAN NUMQ0
; update a and count
    CALL SWAPP 
    CALL ONEP 
    CALL SWAPP 
    CALL ONEM  ; a 0 0 a+ n- R: base d?
; check for '$' hexadecimal  
NUMQ0: 
    CALL OVER   
    CALL CAT   
    _DOLIT '$'
    CALL EQUAL ; a 0 0 a+ n- f  
    _QBRAN NUMQ1 
    CALL HEX   ; switch to hexadecimal base 
; update a and count 
    CALL SWAPP 
    CALL ONEP 
    CALL SWAPP
    CALL ONEM ; a 0 0 a+ n-  R: base d?
    CALL QDUP 
    _QBRAN NUMQ6 
; check for minus sign 
NUMQ1: 
    CALL nsign 
    CALL TOR ; R: base d? sign  
; check for end of string     
    CALL QDUP    ; a dlo dhi a+ cntr R: base d? sign 
    _QBRAN NUMQ5 ; yes , not a number 
    CALL parse_digits
    CALL QDUP 
    CALL ZEQUAL  
    _QBRAN NUMQ4 ; error not end of string  ( a dlo dhi a+ R: base d? sign )
    _DROP  ; a dlo dhi 
    CALL RFROM  ; a dlo dhi sign 
    _QBRAN NUMQ3
    CALL DNEGA
NUMQ3: 
    CALL ROT ; dlo dhi a  R: base d?
    _DROP
    _DOLIT -2  ; double return -2 flag 
    CALL RFROM ; dlo dhi d? R: base 
    _TBRAN NUMQ8 
    CALL SWAPP 
    _DROP
    CALL ONEP   ; single return -1 flag   
    JRA NUMQ8
NUMQ4: ; not end of string error , ( a dlo dhi a+ cntr R: base d? sign )
.if WANT_FLOAT
    CALL RFROM ; sign 
    CALL RFROM ; d? 
    CALL FLOATQ ; ( a dlo dhi a+ cntr sign d? )
    JRA NUMQ8 
.endif 
NUMQ5: 
    ADDW SP,#2
NUMQ6:    
    ADDW SP,#2 
    ADDW X,#4 
    CLRW Y 
    LDW (X),Y 
NUMQ8: 
    CALL RFROM 
    CALL BASE 
    JP STORE 
     



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   DABS ( d -- d )
;   absolute value of double
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DABS,4,"DABS"
    LD A,(X) 
    AND A,#0X80 
    JREQ DABS1 
    JP DNEGA 
DABS1:
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  DSIGN ( d -- d f )
;  sign of double 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DSIGN,5,"DSIGN"
    LD A,#0 
    LDW Y,X 
    LDW Y,(Y)
    JRPL DSIGN1
    LD A,#0XFF 
DSIGN1:
    SUBW X,#2 
    LD (X),A 
    LD (1,X),A 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   DS/MOD ( ud us - ur qud )
;   unsigned divide double by single 
;   return double quotient 
;   and single remainder 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DSLMOD,6,"DS/MOD"
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
    JP HOLD 
     

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    D#S ( d -- s )
;   extract digit from double 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DDIGS,3,"D#S"
    CALL    DDIG 
    CALL    DDUP 
    CALL    DZEQUAL
    _QBRAN  DDIGS 
    _DROP 
    RET


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   D. ( d -- )
;   display double integer 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DDOT,2,"D."
    CALL SPACE 
    CALL DSIGN 
    CALL TOR
    CALL RAT 
    _QBRAN DDOT0
    CALL DNEGA 
DDOT0:     
    CALL BDIGS 
    CALL DDIGS 
    CALL RFROM 
    _QBRAN DDOT1 
    _DOLIT '-' 
    CALL HOLD 
DDOT1: 
    CALL EDIGS 
    JP TYPES     
     


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  UDS* ( ud u -- ud*u )
;  uint32*uint16 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER UDSSTAR,4,"UDS*"
    CALL TOR 
    CALL SWAPP 
    CALL RAT 
    CALL UMSTA ; udlo*u 
    CALL ROT 
    CALL RFROM 
    CALL UMSTA ; udhi*u 
    _DROP  ; drop overflow 
    JP PLUS  ; udlo*u+(uhi*u<<16)
     

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; multiply double by unsigned single 
; return double 
;  ( d u -- d )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DSSTAR,3,"DS*"
;DSSTAR:
    CALL TOR
    CALL DSIGN 
    CALL NROT 
    CALL DABS
    CALL RFROM 
    CALL UDSSTAR  
    CALL ROT 
    _QBRAN DSSTAR3 
    JP DNEGA 
DSSTAR3:
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  2SWAP ( d1 d2 -- d2 d1 )
;  swap double 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DSWAP,5,"2SWAP"
    LDW Y,X 
    LDW Y,(Y)
    LDW YTEMP,Y ; d2 hi 
    LDW Y,X 
    LDW Y,(2,Y)
    LDW XTEMP,Y  ; d2 lo 
    LDW Y,X 
    LDW Y,(4,Y)  ; d1 hi 
    LDW (X),Y 
    LDW Y,X
    LDW Y,(6,Y)  ; d1 lo 
    LDW (2,X),Y
    LDW Y,YTEMP  
    LDW (4,X),Y 
    LDW Y,XTEMP 
    LDW (6,X),Y 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    DCLZ ( d -- u )
;    double count leading zeros
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DCLZ,4,"DCLZ"
    CLR A 
    LDW Y,X 
    LDW Y,(Y)
    JRMI DCLZ8 ; no leading zero 
    JREQ DCLZ4 ; >=16 
DCLZ1: ; <16
    SLLW Y
    INC A 
    TNZW Y 
    JRMI DCLZ8
    JRA DCLZ1 
DCLZ4: ; >=16 
    LD A,#16 
    LDW Y,X 
    LDW Y,(2,Y)
    JRMI DCLZ8 
    JRNE DCLZ1 
    ADD A,#16
DCLZ8: 
    ADDW X,#2 
    CLRW Y 
    LD YL,A 
    LDW (X),Y 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   <2ROT ( d1 d2 d3 -- d3 d1 d2 )
;   rotate left doubles 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER NDROT,5,"<2ROT"
; save d3 in temp 
    LDW Y,X 
    LDW Y,(Y)
    LDW YTEMP,Y  ; d3 hi 
    LDW Y,X 
    LDW Y,(2,Y)
    LDW XTEMP,Y  ; d3 lo 
; put d2 in d1 slot 
    LDW Y,X 
    LDW Y,(4,Y) 
    LDW (X),Y   ; d2 hi 
    LDW Y,X 
    LDW Y,(6,Y)
    LDW (2,X),Y ; d2 lo
; put d1 in d2 slot 
    LDW Y,X 
    LDW Y,(8,Y) 
    LDW (4,X),Y ; d1 hi 
    LDW Y,X 
    LDW Y,(10,Y)
    LDW (6,X),Y  ; d1 lo 
; put d3 in d1 slot 
    LDW Y,YTEMP 
    LDW (8,X),Y  ; d3 hi 
    LDW Y,XTEMP 
    LDW (10,X),Y  ; d3 lo 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   2ROT ( d1 d2 d3 -- d2 d3 d1 )
;   rotate right doubles 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DROT,4,"2ROT"
; save d3 in temp 
    LDW Y,X 
    LDW Y,(Y)
    LDW YTEMP,Y ; d3 hi 
    LDW Y,X 
    LDW Y,(2,Y)
    LDW XTEMP,Y ; d3 lo 
; put d1 in d3 slot 
    LDW Y,X 
    LDW Y,(8,Y)
    LDW (X),Y  ; d1 hi 
    LDW Y,X 
    LDW Y,(10,Y) 
    LDW (2,X),Y ; d1 lo 
; put d2 in d1 slot 
    LDW Y,X 
    LDW Y,(4,Y) ; d2 hi 
    LDW (8,X),Y 
    LDW Y,X 
    LDW Y,(6,Y) ; d2 lo 
    LDW (10,X),Y 
; put d3 in d2 slot 
    LDW Y,YTEMP 
    LDW (4,X),Y 
    LDW Y,XTEMP 
    LDW (6,X),Y 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    D0= ( d -- 0|-1 )
;    check if double is 0 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DZEQUAL,3,"D0="
    CLR A  
    LDW Y,X 
    LDW Y,(Y)
    JRNE ZEQ1 
    LDW Y,X 
    LDW Y,(2,Y)
    JRNE ZEQ1 
    LD A,#0xFF
ZEQ1:
    ADDW X,#CELLL 
    LD (X),A
    LD (1,X),A
	RET     


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   D= ( d1 d2 -- f )
;   d1==d2?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DEQUAL,2,"D="
    LD A,#0 
    LDW Y,X 
    LDW Y,(Y)
    CPW Y,(4,X)
    JRNE DEQU4 
    LDW Y,X 
    LDW Y,(2,Y)
    CPW Y,(6,X)
    JRNE DEQU4 
    LD A,#0XFF
DEQU4:
    ADDW X,#6
    LD (X),A 
    LD (1,X),A 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   D> ( d1 d2 -- f )
;   d1>d2?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DGREAT,2,"D>"
    CALL DSWAP 
    JP DLESS 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   D< ( d1 d2 -- f )
;   d1<d2? 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DLESS,2,"D<"
    CALL DSUB
    CALL ZERO
    CALL NROT  
    CALL DZLESS 
    _QBRAN DLESS4
    JP INVER  
DLESS4:
    RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  D0< ( d -- f )
;  d<0? 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DZLESS,3,"D0<"
    LD A,#0 
    LDW Y,X 
    LDW Y,(Y)
    JRPL DZLESS1 
    LD A,#0XFF 
DZLESS1:
    ADDW X,#CELLL 
    LD (X),A 
    LD (1,X),A    
    RET 



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   2>R ( d -- R: d )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DTOR,3,"2>R"
    POPW Y 
    LDW YTEMP,Y 
    LDW Y,X 
    LDW Y,(2,Y)
    PUSHW Y   ; d low 
    LDW Y,X 
    LDW Y,(Y)
    PUSHW Y   ; d hi 
    _DDROP  
    JP [YTEMP]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  2R> ( -- d ) R: d --      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DRFROM,3,"2R>"
    POPW Y      ; d hi 
    LDW YTEMP,Y 
    SUBW X,#4
    POPW Y       ; d hi 
    LDW (X),Y 
    POPW Y       ; d low  
    LDW (2,X),Y 
    JP [YTEMP]
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   2R@ ( -- d )
;   fecth a double from RSTACK
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DRAT,3,"2R@"
    POPW Y 
    LDW YTEMP,Y 
    SUBW X,#4 
    LDW Y,(1,SP)
    LDW (X),Y 
    LDW Y,(3,SP)
    LDW (2,X),Y 
    JP [YTEMP]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  2VARIABLE <name> 
;  create a double variable 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DVARIA,9,"2VARIABLE"
        CALL HERE
        CALL DUPP
        _DOLIT 4  
        CALL PLUS 
        CALL VPP 
        CALL STORE
        CALL CREAT
        CALL DUPP
        CALL COMMA
        CALL ZERO
        CALL OVER 
        CALL STORE 
        CALL ZERO 
        CALL SWAPP 
        CALL STORE
        CALL FMOVE ; move definition to FLASH
        CALL QDUP 
        CALL QBRAN 
        .word SET_RAMLAST   
        CALL UPDATVP  ; don't update if variable kept in RAM.
        JP UPDATPTR
                



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  2LITERAL ( d -- )
;  compile double literal 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DLITER,COMPO+IMEDD+8,"2LITERAL"
    CALL COMPI 
    .word do2lit 
    CALL COMMA 
    JP   COMMA 


; runtime for 2LITERAL 
do2lit:
    SUBW X,#4 
    LDW Y,(1,SP)
    LDW Y,(Y)
    LDW (X),Y 
    LDW Y,(1,SP)
    LDW Y,(2,Y)
    LDW (2,X),Y 
    POPW Y 
    JP (4,Y)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   2OVER ( d1 d2 -- d1 d2 d1 )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DOVER,5,"2OVER"
    LDW Y,X 
    SUBW X,#4 
    PUSHW Y 
    LDW Y,(4,Y)  ; d1 hi 
    LDW (X),Y 
    POPW Y 
    LDW Y,(6,Y)  ;d1 lo 
    LDW (2,X),Y 
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   D2/ ( d -- d/2 )
;   divide double by 2 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER D2SLASH,3,"D2/"
    LDW Y,X 
    LDW Y,(Y)
    SRAW Y 
    LDW (X),Y 
    LDW Y,X 
    LDW Y,(2,Y)
    RRCW Y 
    LDW (2,X),Y 
    RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  D2* ( d -- d*2 )
;  multiply double by 2 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER D2STAR,3,"D2*"
    LDW Y,X 
    LDW Y,(2,Y)
    RCF 
    RLCW Y 
    LDW (2,X),Y 
    LDW Y,X 
    LDW Y,(Y)
    RLCW Y 
    LDW (X),Y 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   DLSHIFT ( d n -- d )
;   left shift double 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DLSHIFT,7,"DLSHIFT"
    LD A,(1,X) ; shift count 
    AND A,#31
    ADDW X,#CELLL 
    LDW Y,X 
    LDW Y,(Y)
    LDW YTEMP,Y  ; d hi 
    LDW Y,X 
    LDW Y,(2,Y)  ; d low 
DLSHIFT1:
    TNZ A 
    JREQ DLSHIFT2 
    RCF 
    RLCW Y 
    PUSHW Y 
    LDW Y,YTEMP 
    RLCW Y 
    LDW YTEMP,Y 
    POPW Y 
    DEC A 
    JRA DLSHIFT1 
DLSHIFT2:
    LDW (2,X),Y 
    LDW Y,YTEMP 
    LDW (X),Y 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  DRSHIFT ( d n -- d )
;  shift right n bits 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DRSHIFT,7,"DRSHIFT"
    LD A,(1,X)
    AND A,#31
    ADDW X,#2 
DRSHIFT1:
    TNZ A 
    JREQ DRSHIFT2 
    LDW Y,X 
    LDW Y,(Y)
    SRLW Y 
    LDW (X),Y 
    LDW Y,X 
    LDW Y,(2,Y)
    RRCW Y 
    LDW (2,X),Y 
    DEC A
    JRA DRSHIFT1  
DRSHIFT2:
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   D* ( d1 d2 -- d3 )
;   double product 
;   d3 = d1 * d2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DSTAR,2,"D*"
    CLRW Y 
    LD A,(X)   ; d2 sign 
    XOR A,(4,X) ; d1 sign 
    JRPL 1$
    CPLW Y  
1$: SUB SP,#2 
    LDW (1,SP),Y ; R: prod_sign 
    CALL DABS   
    CALL DTOR 
    CALL DABS
    CALL DDUP   ; ud1 ud1  
    CALL RFROM  ; ud1 ud1 ud2hi 
    CALL DSSTAR ; ud1 dprodhi 
; shift partial product 16 bits left 
    _DROP   ; drop overflow 
    CALL ZERO   ; ud1 prodhi 
    CALL SWAPP  
    CALL DSWAP  ; dprodhi ud1 
    CALL RFROM  ; dprodhi ud1 ud2lo
    CALL DSSTAR ; dprodhi dprodlo 
    CALL DPLUS    
    CALL RFROM    ; dprod ps 
    _QBRAN DDSTAR3 
    JP DNEGA 
DDSTAR3:  
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  UD/MOD ( ud1 ud2 -- dr udq )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER UDSLMOD,6,"UD/MOD"
;;;;;;;;;;;LOCAL VARIABLES ;;;;;;;;;;;;;;;;
    QLO = 7   ;   int16 
    QHI = 5   ;   int16 
    CNT1 = 4  ;   byte 
    CNT2 = 3  ;   byte 
    QLBIT = 1 ;   int16
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; unsigned double division 
    SUB SP,#4*CELLL ; space for local variables 
    CLRW Y 
    LDW (QLO,SP),Y 
    LDW (QHI,SP),Y ; quotient=0  
    CALL DOVER 
    CALL DCLZ ; n2, dividend leading zeros  
    CALL TOR 
    CALL DDUP    
    CALL DCLZ  ; n1, divisor leading zeros
    CALL RFROM ; n1 n2 
    CALL SUBB  ; loop count 
    LDW Y,X 
    LDW Y,(Y)
    LD A,YL 
    LD (CNT1,SP),A
    LD (CNT2,SP),A 
    TNZW Y 
    JRMI UDSLA7 ; quotient is null 
    CALL DLSHIFT ; align divisor with dividend 
    CLRW Y  
    LDW (QLBIT,SP),Y ; quotient least bit R: qlo qhi cntr qlbit 
UDSLA3: ; division loop -- dividend divisor  
    CLR (2,SP)  ; qlbit=0 
    CALL DOVER 
    CALL DOVER 
    CALL DSUB
    LD A,(X)
    JRMI UDSLA4  
    CALL DSWAP 
    CALL DROT 
    INC (2,SP) ; quotient least bit 1 
UDSLA4: ; shift quotient and add qlbit 
    _DDROP 
    LDW Y,(QLO,SP) ; quotient low 
    RCF 
    RLCW Y
    LDW (QLO,SP),Y 
    LDW Y,(QHI,SP) ; quotient hi 
    RLCW Y 
    LDW (QHI,SP),Y 
    LDW Y,(QLO,SP) 
    ADDW Y,(QLBIT,SP)
    LDW (QLO,SP),Y 
    LD A,(CNT2,SP)
    JREQ UDSLA8 
    DEC (CNT2,SP) ; loop counter  
; shift dividend left 1 bit      
    CALL DSWAP 
    CALL D2STAR 
    CALL DSWAP 
    JRA UDSLA3 
UDSLA7:
    _DROP 
    CALL ZERO 
    _DOLIT 2   ; cnt1 local var 
    CALL NRSTO ; R: 0 0 cnt1 cnt2 qlbit     
UDSLA8:
    ADDW X,#4 ; drop divisor
    ADDW SP,#3 ; drop cnt2 qlbit   
    POP A 
    CLRW Y 
    LD YL,A 
    SUBW X,#CELLL 
    LDW (X),Y  
    CALL DRSHIFT 
    ; quotient replace dividend 
    CALL DRFROM  ; quotient 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   D/MOD  ( d1 d2 -- dr dq )
;   double division dq=d1/d2
;   dr remainder double 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DDSLMOD,5,"D/MOD"  
    LD A,(X) ; disisor sign 
    PUSH A 
    LD A,(4,X) ; dividend sign 
    PUSH A   ; R: sdivsor sdivnd 
    CALL DABS 
    CALL DTOR ; R: sign abs(divisor)
    CALL DABS  ; ud1  
    CALL DRAT  ; ud1 ud2 R: sign abs(divisor) 
    CALL UDSLMOD ; ud1/ud2 -- dr dq  
    LD A,(5,SP) ; sdivnd 
    XOR A,(6,SP) ; 
    JRPL DSLA8 
    CALL DNEGA ; negate quotient  
    CALL DOVER 
    CALL DZEQUAL
    _TBRAN DSLA9 
    CALL ONE 
    CALL ZERO 
    CALL DSUB  
    CALL DRAT 
    CALL DROT 
    CALL DSUB  ; corrected_remainder=divisor-remainder 
    CALL DSWAP
DSLA8:      
; check for divisor sign 
; if negative change negate remainder 
    LD A,(6,SP) ; divisor sign 
    JRPL DSLA9 
    CALL DTOR 
    CALL DNEGA 
    CALL DRFROM 
DSLA9:
    ADDW SP,#6 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   D/  ( d1 d2 -- dq )
;   division double by double 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DSLASH,2,"D/"
    CALL DDSLMOD
    CALL DSWAP
    _DDROP 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   D+ ( d1 d2 -- d3 )
;   add 2 doubles 
;   d3=d1+d2 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DPLUS,2,"D+"
    LDW Y,X 
    LDW Y,(Y)
    LDW YTEMP,Y ; d2 hi 
    LDW Y,X 
    LDW Y,(2,Y)
    LDW XTEMP,Y ; d2 lo 
    ADDW X,#4 
    LDW Y,X 
    LDW Y,(2,Y) ; d1 lo
    ADDW Y,XTEMP
    LDW (2,X),Y 
    LDW Y,X 
    LDW Y,(Y) ; d1 hi 
    JRNC DPLUS1 
    ADDW Y,#1 
DPLUS1: 
    ADDW Y,YTEMP 
    LDW (X),Y 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   D- ( d1 d2 -- d3 )
;   d3=d1-d2 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DSUB,2,"D-"
    LDW Y,X 
    LDW Y,(Y)
    LDW YTEMP,Y ; d2 hi 
    LDW Y,X 
    LDW Y,(2,Y)
    LDW XTEMP,Y ; d2 lo 
    ADDW X,#4 
    LDW Y,X 
    LDW Y,(2,Y) ; d1 lo
    SUBW Y,XTEMP
    LDW (2,X),Y 
    LDW Y,X 
    LDW Y,(Y) ; d1 hi 
    JRNC DSUB1 
    SUBW Y,#1 
DSUB1: 
    SUBW Y,YTEMP 
    LDW (X),Y 
    RET 


