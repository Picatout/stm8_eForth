;************************************
;    doubles integers library 
;    doubles are signed 32 bits 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


    .module DOUBLE 

; check for negative sign 
; ajust pointer and cntr 
nsign: ; a cntr -- a cntr f 
    CALL ZERO 
    CALL TOR  ; R: sign 
    CALL TOR  ; R: sign cntr 
    CALL DUPP 
    CALL CAT 
    _DOLIT '-'
    CALL EQUAL 
    _QBRAN nsign1 
    CALL ONEP ; a+ 
    CALL RFROM 
    CALL ONEM ; cntr-
    CALL RFROM ; sign 
    CALL INVER ; -1
    CALL TOR   ; R: sign 
    CALL TOR   ; R: cntr 
nsign1:
    CALL RFROM 
    CALL RFROM 
    RET 


; get all digits in row 
; stop at first non-digit or end of string 
; ( dlo dhi a cntr -- dlo dhi [ a+ cntr- | a+ 0 ] )
parse_digits:
1$:
    CALL DUPP 
    _QBRAN 5$ 
    CALL TOR   ; dlo dhi a R: cntr 
    CALL COUNT ; dlo dhi a+ char 
    CALL BASE 
    CALL AT 
    CALL DIGTQ 
    _QBRAN 4$ ; not a digit
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
    _BRAN 1$ ; dlo dhi a+ R: 
4$: CALL DROP  ; dlo dhi a+ 
    CALL ONEM  ; unget char 
    CALL RFROM ; dlo dhi a+ cntr-
5$:
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
    CALL TOR 
; initialize integer to 0     
    SUBW X,#4 
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
; check for minus sign 
NUMQ1: 
    CALL nsign 
    CALL TOR ; R: base d? sign  
; check for end of string     
    CALL QDUP    ; a dlo dhi a+ cntr R: base d? sign 
    _QBRAN NUMQ4 ; yes , not a number 
    CALL parse_digits
    CALL QDUP 
    CALL ZEQUAL  
    _QBRAN NUMQ4 ; error not end of string  ( a dlo dhi a+ R: base d? sign )
    CALL DROP  ; a dlo dhi 
    CALL RFROM  ; a dlo dhi sign 
    _QBRAN NUMQ3
    CALL DNEGA
NUMQ3: 
    CALL ROT ; dlo dhi a  R: base d?
    CALL DROP
    _DOLIT -2  ; double return -2 flag 
    CALL RFROM ; dlo dhi d? R: base 
    CALL INVER 
    _QBRAN NUMQ8 
    CALL SWAPP 
    CALL DROP
    CALL ONEP   ; single return -1 flag   
    _BRAN NUMQ8
NUMQ4: ; not end of string error , ( a dlo dhi a+ cntr R: base d? sign )
.if WANT_FLOAT
    CALL RFROM ; sign 
    CALL RFROM ; d? 
    CALL FLOATQ ; ( a dlo dhi a+ cntr sign d? )    
.else 
    ADDW X,#4 ; drop dhi a+  , ( a dlo R: base d? sign ) 
    ADDW SP,#4 ; drop d? sign  R: base 
    CLRW Y 
    LDW (X),Y ; dlo replaced by 0 ( -- a 0 R: base ) 
.endif 
; restore original base value     
NUMQ8: 
    CALL RFROM 
    CALL BASE 
    CALL STORE 
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
    CPW Y,#0 
    JREQ  ZEQ1
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
;   DABS ( d -- d )
;   absolute value of double
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DABS,4,"DABS"
    CALL DUPP 
    CALL ZLESS 
    _QBRAN DABS1 
    CALL DNEGA 
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    D#S ( d -- s )
;   extract digit from double 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DDIGS,3,"D#S"
    CALL    DDIG 
    CALL    DDUP 
    CALL    DZEQUAL
    _QBRAN  DDIGS 
    CALL    DROP 
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
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; multiply double by single 
; return double 
;  ( d s -- d )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DSSTAR,3,"DS*"
;DSSTAR:
    CALL TOR
    CALL DUPP 
    CALL ZLESS
    CALL DUPP 
    CALL TOR 
    _QBRAN DSSTAR1 
    CALL DNEGA 
DSSTAR1:
    CALL RFROM 
    CALL NROT       
    CALL SWAPP 
    CALL RAT 
    CALL UMSTA
    CALL ROT 
    CALL RFROM 
    CALL UMSTA 
    CALL DROP ; DROP OVERFLOW 
    CALL PLUS 
    CALL ROT 
    _QBRAN DSSTAR3 
    CALL DNEGA 
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
DCLZ4:
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
;   2<ROT ( d1 d2 d3 -- d3 d1 d2 )
;   rotate left doubles 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER NDROT,5,"2<ROT"
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
    LD A,#0XFF 
    LDW Y,X 
    LDW Y,(4,Y)  ; d1 hi 
    CPW Y,(X)    ; d2 hi 
    JRSGT DGREAT4 
    LDW Y,X 
    LDW Y,(6,Y)
    CPW Y,(2,X)
    JRUGT DGREAT4 
    LD A,#0
DGREAT4:
    ADDW X,#6
    LD (X),A 
    LD (1,X),A 
    RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   D< ( d1 d2 -- f )
;   d1<d2? 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DLESS,2,"D<"
    CALL DSUB
    _DOLIT 0 
    CALL NROT  
    CALL DZLESS 
    _QBRAN DLESS4
    CALL INVER  
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
    ADDW X,#2 
    LD (X),A 
    LD (1,X),A    
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  DCMP ( d1 d2 -- d1 d2 -1|0|1 )
; compare 2 doubles 
; keep the doubles 
; return flag: 
;    -1 if d1<d2 
;     0 if d1==d2
;     1 if d1>d2 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DCMP,4,"DCMP"
    LDW Y,X 
    LDW Y,(4,Y)
    CPW Y,(X) 
    JREQ DCMP2 
    JRSLT DCMP_SMALL 
    JRA  DCMP_GREAT 
DCMP2:    
    LDW Y,X 
    LDW Y,(6,Y)
    CPW Y,(2,X)
    JREQ DCMP_EQUAL  
    JRULT DCMP_SMALL 
    JRA DCMP_GREAT
DCMP_EQUAL:
    CLRW Y 
    JRA DCMP4 
DCMP_SMALL:
    LDW Y,#-1 
    JRA DCMP4 
DCMP_GREAT:
    LDW Y,#1
DCMP4:
    SUBW X,#2 
    LDW (X),Y 
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
    ADDW X,#4  
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
        call UPDATVP  ; don't update if variable kept in RAM.
        CALL UPDATPTR
        RET         



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  2LITERAL ( d -- )
;  compile double literal 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DLITER,IMEDD+8,"2LITERAL"
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
    ADDW X,#2 
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  DD/MOD ( d1 d2 -- dr dq )
;  unsigned division double 
;  double.
;  return double quotient and 
;  double remainder 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DDSLMOD,6,"DD/MOD"
    CALL DDUP 
    CALL DCLZ 
    CALL DUPP
    _DOLIT 16 
    CALL GREAT 
    _QBRAN DDSLMOD1 
    CALL DDROP 
    CALL DSLMOD 
    RET 
DDSLMOD1:
    CALL DUPP      
    CALL TOR 
    CALL DLSHIFT
    _DOLIT 32 
    CALL RFROM 
    CALL SUBB 
    _DOLIT 5 
    CALL PICK 
    _DOLIT 5 
    CALL PICK 
    CALL DCLZ 
    CALL TOR 
    CALL DSWAP 
    CALL RAT 
    CALL DLSHIFT 
    CALL DSWAP 
    CALL RFROM 
    CALL RFROM 
    CALL SWAPP 
    CALL SUBB ; number dividend left shift to do.

    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   D* ( d1 d2 -- d3 )
;   double product 
;   
;   d3 = d1 * d2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DSTAR,2,"D*"
    CALL DUPP 
    CALL ZLESS  
    CALL TOR    ; R: d2sign 
    CALL DABS   
    CALL RFROM 
    CALL NROT  ; d1 d2s ud2
    CALL DTOR  ; d1 d2s R: ud2  
    CALL TOR   ; d1 R: ud2 d2s   
    CALL DUPP 
    CALL ZLESS 
    CALL RFROM 
    CALL XORR   
    CALL TOR   ; d1 R: ud2 prod_sign  
    CALL DABS ; ud1 R: ud2 ps  
    CALL RFROM  
    CALL NROT   ; ps ud1 
    CALL DDUP   ; ps ud1 ud1  
    CALL RFROM  ; ps ud1 ud1 ud2hi 
    CALL DSSTAR ; ps ud1 dprodhi 
; shift partial product 16 bits left 
    CALL DROP   ; drop overflow 
    CALL ZERO   ; ps ud1 prodhi 
    CALL SWAPP  
    CALL DSWAP  ; ps dprodhi ud1 
    CALL RFROM  ; ps dprodhi ud1 ud2lo
    CALL DSSTAR ; ps  dprodhi dprodlo 
    CALL DPLUS
    CALL ROT    ; dprod ps 
    _QBRAN DDSTAR3 
    CALL DNEGA 
DDSTAR3:  
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   D/  ( d1 d2 -- d3 )
;   double division d3=d1/d2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DSLASH,2,"D/"  
    _DOLIT 0 
    CALL TOR   ; R: sign 
    LDW Y,X     
    LDW Y,(Y)
    JRPL DSLA1
    CALL DNEGA
    CALL RFROM 
    CALL INVER 
    CALL TOR  ; sign inverted 
DSLA1:
    _DOLIT 2 
    CALL PICK 
    CALL ZLESS 
    _QBRAN DSLA2
    CALL DSWAP 
    CALL DNEGA
    CALL DSWAP       
    CALL RFROM 
    CALL INVER 
    CALL TOR   ;  sign inverted again 
DSLA2:
; unsigned double division 
    CALL ZERO 
    CALL ZERO
    CALL DTOR ; quotient  R: sign qlo qhi 
    CALL DOVER 
    CALL DCLZ ; n2, dividend leading zeros  
    CALL TOR 
    CALL DDUP    
    CALL DCLZ  ; n1, divisor leading zeros
    CALL RFROM ; n1 n2 
    CALL SUBB
    CALL DUPP   
    CALL ZLESS 
    CALL INVER 
    _QBRAN DSLA7 ; quotient is null 
    CALL DUPP 
    CALL TOR    ; loop counter 
    CALL QDUP 
    _QBRAN DSLA3
    CALL DLSHIFT ; align divisor with dividend 
DSLA3: ; division loop 
    CLRW Y 
    PUSHW Y  
    CALL DOVER 
    CALL DOVER 
    CALL DLESS 
    CALL INVER  
    _QBRAN DSLA4 
    POPW Y 
    ADDW Y,#1 
    PUSHW Y 
    CALL DDUP 
    CALL DTOR
    CALL DSUB
    CALL DRFROM  
DSLA4: ; shift quotient and add 1 bit 
    POPW Y 
    LDW YTEMP,Y 
    LDW Y,(5,SP) ; quotient low 
    RCF 
    RLCW Y
    LDW (5,SP),Y 
    LDW Y,(3,SP) ; quotient hi 
    RLCW Y 
    LDW (3,SP),Y 
    LDW Y,(5,SP) 
    ADDW Y,YTEMP
    LDW (5,SP),Y 
    LDW Y,(1,SP) ; loop counter 
    TNZW Y 
    JREQ DSLA8
    SUBW Y,#1  
    LDW (1,SP),Y  
; shift dividend left 1 bit      
    CALL DSWAP 
    CALL D2STAR 
    CALL DSWAP 
    JRA DSLA3 
DSLA7:
    ADDW X,#2 ; drop shift count  
DSLA8:
    ADDW X,#8 ; drop remainder and divisor 
    ADDW SP,#2 ; drop loop count on RSTACK 
    ; quotient replace dividend 
    CALL DRFROM 
    POPW Y ; sign 
    TNZW Y 
    JREQ DSLA9 
    CALL DNEGA 
DSLA9: 
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    ILOG ( ud base -- n )
;    integer part of double in base 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER ILOG,4,"ILOG"
    _DOLIT 0 
    CALL TOR 
    CALL NROT 
ILOG1: 
    _DOLIT 2 
    CALL PICK 
    CALL DSLMOD 
    CALL ROT 
    CALL DROP 
    CALL DDUP
    CALL DZEQUAL 
    CALL INVER 
    _QBRAN ILOG2
    CALL RFROM 
    CALL ONEP 
    CALL TOR 
    _BRAN ILOG1 
ILOG2:
    CALL DDROP 
    CALL DROP 
    CALL RFROM 
    RET 

