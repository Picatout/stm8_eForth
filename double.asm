;************************************
;    doubles integers library 
;    doubles are signed 32 bits 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .module DOUBLE 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   NUMBER? (a -- s|d T | a F )
;   convert string to integer 
;   double begin with '!' 
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
; check for '!' double integer 
    CALL OVER  ; a 0 0 a+ n a+
    CALL CAT   ; a 0 0 a+ n c 
    _DOLIT '!' ; a 0 0 a+ n c '!' 
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
    CALL OVER 
    CALL CAT   
    _DOLIT '-' 
    CALL EQUAL 
    CALL TOR ; R: base d? sign  
; update a and n, if sign==0 no change  
    CALL RAT   
    CALL PLUS  
    CALL SWAPP 
    CALL RAT 
    CALL SUBB  
    CALL SWAPP 
; check for end of string     
    CALL QDUP    ; count==0?
    _QBRAN NUMQ6 ; yes , not a number 
; initialize loop counter 
    CALL ONEM    ; n-1 
    CALL TOR     ; loop counter 
; parse digits loop 
NUMQ2:   ; a dlo dhi a+ R: base d? sign cntr  
    CALL DUPP 
    CALL TOR   ; a dlo dhi a+ R: base d? sign cntr a+ 
    CALL CAT 
    CALL BASE 
    CALL AT 
    CALL DIGTQ  ; a dlo dhi u f R: base d? sign cntr a+  
    _QBRAN NUMQ4 ; not digit  
    CALL TOR    ; a dlo dhi R: base d? sign cntr a+ digit   
    CALL BASE 
    CALL AT 
    CALL DSSTAR 
    CALL RFROM 
    CALL ZERO 
    CALL DPLUS  
    CALL RFROM  
    CALL ONEP    ; a dlo dhi a+ R: base d? sign cntr 
    _DONXT NUMQ2 
    CALL DROP   ; a dlo dhi R: base d? sign 
    CALL RFROM  
    _QBRAN NUMQ3
    CALL DNEGA
NUMQ3: 
    CALL ROT ; dlo dhi a  R: base d?
    CALL DROP 
    _DOLIT -1 
    CALL RFROM ; dlo dhi -1 d? R: base 
    CALL INVER 
    _QBRAN NUMQ8 
    CALL SWAPP 
    CALL DROP 
    _BRAN NUMQ8 
NUMQ4: ; 'u' not digit error , ( a dlo dhi u R: base d? sign cntr a+ )
    ADDW X,#4 ; drop dhi u, ( a dlo R: base d? sign cntr a+ ) 
    ADDW SP,#8 ; drop d? sign cntr a+  R: base 
    CLRW Y 
    LDW (X),Y ; dlo replaced by 0 ( -- a 0 R: base ) 
    _BRAN NUMQ8 
NUMQ5: 
    CALL DUPP  ; a 0 dlo dlo 
; no digits error 
NUMQ6: ;   a 0 0 a+ R: base d? sign 
    ADDW X,#4 ; a 0 R: base d? sign 
    ADDW SP,#4  ; a 0 R: base 
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
    LD A,#0 
    LDW Y,X 
    LDW Y,(4,Y)  ; d1 hi 
    CPW Y,(X)    ; d2 hi 
    JRSLT DGREAT4 
    LDW Y,X 
    LDW Y,(6,Y)
    CPW Y,(2,X)
    JRSLE DGREAT4 
    LD A,#0XFF
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
    LD A,#0 
    LDW Y,X 
    LDW Y,(4,Y)
    CPW Y,(X)
    JRSGT DLESS4 
    LDW Y,X 
    LDW Y,(6,Y)
    CPW Y,(2,X)
    JRSGE DEQU4 
    LD A,#0XFF
DLESS4:
    ADDW X,#6
    LD (X),A 
    LD (1,X),A 
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
;   D>R ( d -- R: d )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DTOR,3,"D>R"
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
;  DR> ( -- d ) R: d --      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DRFROM,3,"DR>"
    POPW Y      ; d hi 
    LDW YTEMP,Y 
    SUBW X,#4
    POPW Y       ; d hi 
    LDW (X),Y 
    POPW Y       ; d low  
    LDW (2,X),Y 
    JP [YTEMP]
    

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
    _DOLIT 0 
    CALL NROT  
    CALL DUPP 
    CALL ZLESS 
    _QBRAN DDSTAR1 
    CALL DNEGA 
    CALL ROT  
    CALL INVER 
    CALL NROT  
DDSTAR1:
    CALL TOR 
    CALL TOR
    CALL NROT  
    CALL DUPP 
    CALL ZLESS 
    _QBRAN DDSTAR2 
    CALL DNEGA 
    CALL ROT
    CALL INVER 
    CALL NROT 
DDSTAR2:
    CALL DDUP 
    CALL RFROM 
    CALL DSSTAR 
    CALL DSWAP 
    CALL RFROM 
    CALL DSSTAR 
    CALL DROP
    CALL PLUS
    CALL ROT 
    _QBRAN DDSTAR3 
    CALL DNEGA 
DDSTAR3:  
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
