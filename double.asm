;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Copyright Jacques Deschênes 2019,2020,2021,2022 
;; This file is part of stm8_eforth  
;;
;;     stm8_eforth is free software: you can redistribute it and/or modify
;;     it under the terms of the GNU General Public License as published by
;;     the Free Software Foundation, either version 3 of the License, or
;;     (at your option) any later version.
;;
;;     stm8_eforth is distributed in the hope that it will be useful,
;;     but WITHOUT ANY WARRANTY;; without even the implied warranty of
;;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;     GNU General Public License for more details.
;;
;;     You should have received a copy of the GNU General Public License
;;     along with stm8_eforth.  If not, see <http:;;www.gnu.org/licenses/>.
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;************************************
;    doubles integers library 
;    doubles are signed 32 bits, two's complement 
;    range: {-2147483647...2147483647}  
;    -2147483648  is reserved as an overflow marker 
; 
;  double input formats:
;    decimal_base::= ['-'|'+']dec_digits+['.'][dec_digits]*
;    hexadecimal_base::=['-'|'+']'$'hex_digits+['.'][hex_digits]*
;    The '.' indicate a double number, i.e. 32 bits
;    The '.' can be placed anywhere in digits sequence: first, middle,last  
;    otherwise it is a single number, i.e. 16 bits 
;
;    if float.asm library is compiled with project a 'e'|'E' character is 
;    mandatory to differentiate a float from a double.
;    exmpample:
;         3.141593  is double 3141593
;         3.141593e is float32  PI 
;         0.  is valid null double
;         0e  is valid null float32  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .module DOUBLE 

    DVER_MAJOR=1 
    DVER_MINOR=0 

    DBL_SIZE=2*CELLL 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  DBL-VER ( -- )
;  print library version 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DBLVER,7,"DBL-VER"
    CALL CR 
    CALL DOTQP 
    .byte  24 
    .ascii "double integer library, "
    _DOLIT DVER_MAJOR 
    _DOLIT DVER_MINOR  
    JP PRINT_VERSION   

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; uint32 * uint8
; input:
;   ud   uint32 
;   u8   uint8 
; output:
;   ud    = uint32*uint8   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER UDU8STAR,5,"UDU8*"
;UDU8STAR: ; ( ud u8 -- prod )
    CALL TOR ; ud r: u8 
    PUSH #0  ; R: uint8 0 0
    LD A,(3,X) ; ud bits 7:0
    LD YL,A    
    LD A,(3,SP) ; uint8 
    MUL Y,A
    LD A,YL   
    LD (3,X),A  ; product bits 7:0 
    LD A,YH     ; partial prodcut bits 15:8
    LD (2,SP),A ; r: uint8 ovf  0 
    LD A,(2,X)  ; ud bits 15:8 
    LD YL,A     
    LD A,(3,SP) ; uint8 
    MUL Y,A    
    ADDW Y,(1,SP) ; Y+=overflow 1  
    LD A,YL        
    LD (2,X),A  ; product bits 15:8
    LD A,YH     
    LD (2,SP),A ; overflow 
    LD A,(1,X)  ; ud bits 23:16 
    LD YL,A 
    LD A,(3,SP) ; uint8 
    MUL Y,A 
    ADDW Y,(1,SP) ; Y+=overflow 
    LD A,YL    
    LD (1,X),A  ; product bits 23:16
    LD A,YH     
    LD (2,SP),A ; overflow 
    LD A,(X)    
    LD YL,A     ; ud bits 31:24
    LD A,(3,SP) ; uint8 
    MUL Y,A 
    ADDW Y,(1,SP) ; Y+= overflow 
    LD A,YL    
    LD (X),A  ; product bits 31:24 
    ADD SP,#CELLL+1 ; drop u8 and YH from r: 
    RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; get all digits in row 
; stop at first non-digit or end of string 
; ( dlo dhi a cnt -- dlo dhi a cnt )
; input:
;   dlo     low word of integer 
;   dlhi    high word of integer 
;   a       string pointer 
;   cnt     string length 
; output:
;   dlo     updated 
;   dhi     updated 
;   a       incremented
;   cnt     decremented 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
parse_digits: ; ( dlo dhi a cnt -- dlo dhi a cnt )
    CALL DUPP 
    _QBRAN parse_d5  ; end of string 
    CALL TOR   ; dlo dhi a R: cntr 
    CALL COUNT ; dlo dhi a+ char 
    CALL BASE 
    CALL AT 
    CALL DIGTQ 
    _QBRAN parse_d4 ; not a digit
    CALL DTOR  ; dlo dhi R: cntr a+ c  
    CALL BASE 
    CALL AT 
;    CALL UDSSTAR
    CALL UDU8STAR 
    CALL RFROM 
    CALL ZERO 
    CALL DPLUS 
    CALL RFROM  ; dlo dhi a+ 
    CALL RFROM ; dlo dhi a+ cntr 
    CALL ONEM 
    JRA parse_digits ; dlo dhi a+ R: 
parse_d4:
    LDW Y,X 
    LDW Y,(CELLL,Y)
    DECW Y  ; dec(a)
    LDW (CELLL,X),Y 
    POPW Y 
    LDW (X),Y ; dlo dhi a cnt  
parse_d5:
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   NUMBER? (a -- s -1 |d -2 | a 0 )
;   convert string to integer 
;  if integer parse fail because of extra 
;  characters in string and WANT_FLOAT=1 
;  in config.inc then jump to FLOAT? in
;  float.asm
; 
; accepted integer format:
;    decimal ::= ['-'|'+']dec_digits+
;    hexadecimal ::= ['-'|'+']'$'hex_digits+
;   Optional '.' anywhere in digits 
;   sequence signal a double integer.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER NUMBQ,7,"NUMBER?"
; save current base value 
    CALL BASE 
    CALL AT 
    CALL TOR  ; R: base
; create d? flags R: 
; d? double integer flag 0=int16,-1=int32  
    _DOLIT 0 
    CALL TOR ; R: base d?=0 default to single 
    CALL DUPP 
    CALL ZERO 
    CALL DUPP 
    CALL ROT ; a ud=0 a 
    CALL COUNT ; a ud a+1 cnt 
; check for number sign 
    CALL NSIGN 
    CALL TOR ; R: base d?=0 s?   
; check for hexadecimal character '$'
    _DOLIT '$'
    CALL ACCEPT_CHAR
    _QBRAN 1$ 
    CALL HEX 
1$:     
; now parse digits 
; check for end of string     
    CALL QDUP ; dlo dhi a cnt R: base d? s? 
    _TBRAN 2$  ; parse not complete 
; invalid format clean stack     
    ADDW X,#3*CELLL ; drop ud a 
    ADDW SP,#DBL_SIZE ; drop d? s? from r: 
    JP BAD_FORMAT 
2$:    
    CALL parse_digits ; 
    CALL QDUP
    _QBRAN INTGR_FMT ; end of string 
; more characters to parse 
; if next char=='.' set d?=-1 
; and try for more digits  
    _DOLIT '.' 
    CALL ACCEPT_CHAR
    CALL OVER 
    CALL TOR   ; dlo dhi a cnt f  r: base d? s? cnt  
    _QBRAN 6$  
; it is a double integer set d?=-1
    CPL (5,SP)
    CPL (6,SP) ; d?=-1, int32 
    CALL parse_digits 
    CALL QDUP     
    _QBRAN 8$ ; end of string, it is a double integer  
6$: ; float number or bad format
.if WANT_FLOAT
    CALL RFROM ; cnt before last parse_digits 
    CALL OVER ; dlo dhi a cnt n cnt 
    CALL SUBB ; dlo dhi a cnt ndec -> how many digits after '.' 
    CALL RFROM ; dlo dhi a cnt ndec sign  
    ADDW SP,#CELLL ; drop d? not required by FLOAT? 
    CALL TOR 
    CALL TOR  ;  dlo dhi a cnt r: base sign digits 
    JP FLOATQ ;  dlo dhi a cnt r: base sign digits
.endif 
; error not a number 
; stack frame: dlo dhi a cnt r: base d? s? cnt 
; clean stacks 
    _DROPN 4*CELLL ; drop dlo dhi a cnt 
    ADDW SP,#3*CELLL ; drop d? s? cnt   
    JP BAD_FORMAT      
8$:
    ADDW SP,#CELLL ; drop cnt from r: 
INTGR_FMT: ; got an integer format 
; end of string
    ADDW X,#CELLL ; drop a+
    CALL ROT 
    ADDW X,#CELLL ; drop a 
; stracks: dlo dhi R: base d? sign  
    CALL RFROM  ; a dlo dhi sign 
    _QBRAN 1$
    CALL DNEGA
1$: 
    _DOLIT -2  ; double return -2 flag 
    CALL RFROM ; dlo dhi -2 d? R: base 
    _TBRAN NUMQ8 
    CALL SWAPP 
    _DROP
    CALL ONEP   ; single return -1 flag   
    _BRAN NUMQ8 
BAD_FORMAT: ; a R: base 
    _DOLIT 0 
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   DS/MOD ( ud us - ur udq )
;   unsigned divide double by single 
;   return double quotient 
;   and single remainder 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
    CALL TYPES     
    LD A,#'.
    JP putc  
     


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
    SUBW X,#DBL_SIZE
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
    SUBW X,#DBL_SIZE  
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
    SUBW X,#DBL_SIZE  
    LDW Y,(1,SP)
    LDW Y,(Y)
    LDW (X),Y 
    LDW Y,(1,SP)
    LDW Y,(2,Y)
    LDW (2,X),Y 
    POPW Y 
    JP (DBL_SIZE,Y)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   2OVER ( d1 d2 -- d1 d2 d1 )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DOVER,5,"2OVER"
    LDW Y,X 
    SUBW X,#DBL_SIZE 
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
;  UD/MOD ( ud1 ud2 -- udr udq )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER UDSLMOD,6,"UD/MOD"
;;;;;;;;;;;LOCAL VARIABLES ;;;;;;;;;;;;;;;;
    QLO = 9   ;   int16 
    QHI = 7   ;   int16 
    CNT1 = 6  ;   byte 
    CNT2 = 5  ;   byte 
    DIVISOR=1 ;   double 
    VARS_SIZE=10   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; unsigned double division 
    _VARS VARS_SIZE  ; space for local variables 
    CLRW Y 
    LDW (QLO,SP),Y 
    LDW (QHI,SP),Y ; quotient=0  
    LDW Y,X 
    LDW Y,(Y)
    PUSHW Y 
    LDW Y,X 
    LDW Y,(CELLL,Y)
    SUBW Y,(1,SP)
    _RDROP 
    JREQ UDSLA1 
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
    JRPL UDSLA2
; quotient is null
; replace divisor by 0 
; and exit  
    _DROP ; shift count 
    CLRW Y 
    LDW (X),Y 
    LDW (CELLL,X),Y 
    _DROP_VARS VARS_SIZE  
    RET 
UDSLA1: ; divisor=0
; return r=q=$8000.0000
    LDW Y,#0X8000 
    LDW (X),Y 
    LDW (DBL_SIZE,X),Y 
    CLRW Y 
    LDW (DBL_SIZE+CELLL,X),Y 
    _DROP_VARS VARS_SIZE 
    RET 
UDSLA2:
    CALL DLSHIFT ; align divisor with dividend
    _DRDROP  
    CALL DTOR ; R: divisor   
UDSLA3: ; division loop -- dividend divisor  
    CALL DDUP
    CALL DRAT   ; dividend dividend divisor 
    CALL DSUB   ; dividend diff 
    LD A,(X)
    JRMI UDSLA4 ; dividend diff  
    CALL DSWAP ; diff dividend  
UDSLA4: ; shift quotient and add qlbit 
    _DDROP 
    LDW Y,(QLO,SP) ; quotient low 
    SLL A
    CCF   
    RLCW Y
    LDW (QLO,SP),Y 
    LDW Y,(QHI,SP) ; quotient hi 
    RLCW Y 
    LDW (QHI,SP),Y 
    LD A,(CNT2,SP)
    JREQ UDSLA8 
    DEC (CNT2,SP) ; loop counter  
; shift dividend left 1 bit   DIVIDEND:A LSHIFT 1    
    LDW Y,X 
    LDW Y,(CELLL,Y)
    RCF 
    RLCW Y 
    LDW (CELLL,X),Y 
    LDW Y,X 
    LDW Y,(Y)
    RLCW Y 
    LDW (X),Y 
    JRA UDSLA3 
UDSLA8:
    ADDW SP,#DBL_SIZE+1  ; drop divisor and cnt2 
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
    LD A,(DBL_SIZE,X) ; dividend sign 
    PUSH A 
    LD A,(X) 
    PUSH A ; divisor sign 
    CALL DABS 
    CALL DTOR ; R: sign abs(divisor)
    CALL DABS  ; ud1  
    CALL DRFROM  ; ud1 ud2 R: sign 
    CALL UDSLMOD ; ud1/ud2 -- udr udq  
    POP  A ; divisor sign  
    XOR A,(1,SP)
    JREQ 1$ 
    CALL DNEGA
1$: POP A  
    TNZ A 
    JREQ 2$ 
    CALL DTOR 
    CALL DNEGA 
    CALL DRFROM
2$:        
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
    D2LO=3 
    D2HI=1 
    _HEADER DPLUS,2,"D+"
; 2>R 
    LDW Y,X 
    LDW Y,(CELLL,Y)
    PUSHW Y   ; d2 lo  
    LDW Y,X 
    LDW Y,(Y) 
    PUSHW Y ; d2 hi 
    _DROPN 2 ; d2 
    LDW Y,X 
    LDW Y,(CELLL,Y) ; d1lo 
    ADDW Y,(D2LO,SP)
    LDW (CELLL,X),Y 
    LDW Y,X 
    LDW Y,(Y)
    JRNC 1$
    INCW Y 
1$:
    ADDW Y,(D2HI,SP)
    LDW (X),Y 
    ADDW SP,#DBL_SIZE ; drop d2 from r: 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   D- ( d1 d2 -- d3 )
;   d3=d1-d2 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    D2LO=3 
    D2HI=1 
    _HEADER DSUB,2,"D-"
    LDW Y,X 
    LDW Y,(CELLL,Y)
    PUSHW Y ; d2 lo 
    LDW Y,X 
    LDW Y,(Y)
    PUSHW Y ; d2 hi 
    _DROPN 2 ; d2 
    LDW Y,X 
    LDW Y,(CELLL,Y)
    SUBW Y,(D2LO,SP)
    LDW (CELLL,X),Y 
    LDW Y,X 
    LDW Y,(Y)
    JRNC 1$
    DECW Y 
1$: 
    SUBW Y,(D2HI,SP)
    LDW (X),Y 
    ADDW SP,#DBL_SIZE ; drop d2 from r: 
    RET 

