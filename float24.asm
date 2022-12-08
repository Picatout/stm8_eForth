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
;  This library is not dependant on double.asm 
;  The code is smaller and faster than float.asm at 
;  the cost of less precision on mantissa. 
;  Exponent range is the same. 
;
;  This format is stored on the stack as a double, i.e. 32 bits 
;  but as 24 bits in memory. 
;
;  The original inspiration for this implementation come from 
;    Forth dimensions Vol. IV #1 
;    published in  may/june 1982
; 
;  STACK frame:
;      -- m e 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    MAX_MANTISSA = 0x7FFF ; absolute value maximum mantissa  

    F24_MAJOR=1 
    F24_MINOR=0 

; floatting point state bits in FPSW 
    ZBIT=0 ; zero bit flag
    NBIT=1 ; negative flag 
    OVBIT=2 ; overflow flag 


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
    _HEADER FINIT,5,"FINIT"
    CLR UFPSW+1 ; reset state bits 
    RET 

;-------------------------
;    FPSW ( -- a )
;    floating point state variable
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
;    FER ( -- u )
;    return FPSW value 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FER,3,"FER"
    LDW Y,UFPSW 
    SUBW X,#CELLL  
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  SET-FPSW ( f24 -- f24 )
;  set float status word 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER SET_FPSW,8,"SET-FPSW"
    CLR UFPSW+1 
    LDW Y,X 
    LDW Y,(2,Y) ; mantissa  
    JRNE 1$
    BSET UFPSW+1,#ZBIT  ; null mantissa 
    JRA 4$ 
1$: JRPL 2$    
    BSET UFPSW+1,#NBIT  ; negative mantissa 
2$: LDW Y,X 
    LDW Y,(Y) ; exponent  
    CPW Y,#-127  
    JRMI 3$
    CPW Y,#128 
    JRMI 4$ 
3$:
    BSET UFPSW+1,#OVBIT  ; overflow         
4$: RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    SFZ ( f24 -- f24 )
;    set FPSW zero flag 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER SFZ,3,"SFZ"
    BRES UFPSW+1,#ZBIT 
    LDW Y,X 
    LDW Y,(2,Y) ; mantissa 
    JRNE 9$
    BSET UFPSW+1,#ZBIT 
9$: RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   SFN ( f24 -- f24 )
;   set FPSW negative flag 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER SFN,3,"SFN"
    BRES UFPSW+1,#NBIT 
    LDW Y,X 
    LDW Y,(2,Y) ; mantissa    
    JRPL 9$
    BSET UFPSW+1,#NBIT 
9$: RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   SFV ( f24 -- f24 )
;   set overflow flag 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER SFV,3,"SFV"
    BRES UFPSW+1,#OVBIT
    LDW Y,X 
    LDW Y,(Y) ; exponent  
    CPW Y,#-127  
    JRMI 3$
    CPW Y,#128 
    JRMI 4$ 
3$: BSET UFPSW+1,#OVBIT ; overflow 
4$: RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   MSIGN  (m -- m -1|0 )
;   get mantissa sign 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     _HEADER MSIGN,5,"MSIGN"
    CLRW Y 
    LD A,(X)
    JRPL 1$
    CPLW Y 
1$: SUBW X,#CELLL 
    LDW (X),Y 
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   E. ( f# -- )
;   print float24 in scientific 
;   format 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER EDOT,2,"E."
    CALL BASE 
    CALL AT 
    CALL TOR 
    CALL DECIM 
    CALL SET_FPSW
EDOT0: 
    CALL TOR   ; R: e 
    CALL ABSS 
    CALL SPACE 
    CALL BDIGS     
EDOT2: 
    CALL DUPP 
    _DOLIT 10 
    CALL LESS 
    _TBRAN EDOT3 
    CALL DIG
    CALL RFROM 
    CALL ONEP 
    CALL TOR 
    _BRAN EDOT2 
EDOT3: 
    _DOLIT '.'
    CALL HOLD  
    CALL DIG
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
    _DOLIT 1  
    CALL DOTR
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
    CALL DECIM 
    CALL    SET_FPSW 
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
    CALL    NEGAT 
FDOT0: 
    CALL    BDIGS
    CALL    RAT  
    CALL    ZLESS 
    _QBRAN  FDOT6 
FDOT2: ; e<0 
    CALL    DIG 
    CALL    RFROM
    CALL    ONEP 
    CALL    QDUP  
    _QBRAN  FDOT3 
    CALL    TOR 
    JRA   FDOT2 
FDOT3:
    _DOLIT  '.' 
    CALL    HOLD 
    CALL    DIGS
    JRA   FDOT9  
FDOT6: ; e>=0 
    _DOLIT '.' 
    CALL HOLD  
    JRA   FDOT8
FDOT7:     
    _DOLIT  '0'
    CALL    HOLD 
FDOT8:
    _DONXT FDOT7 
    CALL    DIGS
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    number parser 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; return parsed exponent or 
; 0 if failed
; at entry exprect *a='E'
; input:
;   a   pointer to string 
;   cnt # characters left in string 
; ouput:
;   a+   updated string pointer 
;   cnt- updated count 
;   e    exponent    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
parse_exponent: ; a cnt -- a+ cnt- e   
    ldw y,x
    LDW Y,(CELLL,Y) ; a 
    LD A,(Y)
    cp a,#'E
    jreq 1$ 
; invalid format abort 
0$: 
    ADDW X,#3*CELLL ; drop  0 a cnt 
    JP ABOR1     
1$: ; exponent follow 'E'  
    CALL ONEM
    CALL DUPP  
    _TBRAN 2$
    JRA 0$ ; error, no more char, abort  
2$: ; a cnt  
    CALL SWAPP 
    CALL ONEP  ; a++ 
    CALL SWAPP 
    CALL ZERO
    CALL NROT ;  0 a cntr  
    CALL nsign 
    CALL TOR   ; R: esign  
    CALL DUPP  
    _QBRAN 0$ ; error, no digits after '-', abort 
    CALL parse_digits
    CALL ROT  
    CALL RFROM ; esign  
    _QBRAN 4$
    CALL NEGAT
4$: RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; return integer after decimal point 
; expect *a='.'
; input:
;    u    mantissa part already parsed before '.' 
;    a    string address should point at '.' 
;    cnt  characters left in string 
; output:
;   a+    updated string pointer 
;   cnt-  updated char left count 
;   ndec  number of decimals parsed 
;   m     mantissa  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
parse_fraction: ; ( a u a cnt -- a a+ cnt- ndec m )
    LDW Y,X 
    LDW Y,(CELLL,Y) ; a 
    LD A,(Y) ; next char in string
    CP A,#'.
    JREQ 1$   
; not a '.' character, no fractional part.    
    SUBW X,#2*CELLL ; space for ndec and frac 
    CLRW Y 
    LDW (X),Y 
    LDW (CELLL,X),Y  ; -- a a+ cnt m=0  ndec=0  
    RET 
1$: ; parse fraction 
    LDW Y,X 
    LDW Y,(Y) ; cnt 
    DECW Y   ; cnt-- 
    LDW (X),Y 
    PUSHW Y  ; cnt-- >R 
    LDW Y,X      
    LDW Y,(CELLL,Y ) ; a  
    INCW Y ; a++
    LDW (CELLL,X),Y  ; 
    CALL parse_digits ; a u a cnt -- a m a+ cnt-
    CALL RFROM ; needed to compute ndec 
    CALL OVER  
    CALL SUBB ; a frac a+ cnt- ndec 
    CALL TOR  
    CALL ROT ; a a+ cnt- frac
    CALL RFROM ; a a+ cnt- m ndec 
    CALL SWAPP ; a a+ cnt- ndec m   
    RET  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.if 0
;;;;;;;;;;;;;;;;;;;;;;;;;
; fast u16*10 
; input:
;   u    uint16 
; output:
;   ud   u*10 uint32 
;;;;;;;;;;;;;;;;;;;;;;;;;
    VSIZE=2 ; local variables size
    PROD=1 ; first product  
umult10: ; ( u -- ud=u*10 )
    sub sp,#VSIZE 
    ld a,(x) ; u high byte, bits 15..8 
    ldw yl,a 
    ld a,#10
    mul y,a 
    ldw (PROD,sp),y 
    ld a,(1,x) ; u low byte, bits 7..0  
    ld yl,a 
    ld a,#10 
    mul y,a 
    ld a,yh
; make space on stack for ud     
    subw x,#CELLL 
    clr (x) 
    add a,(PROD+1,sp) ; yh+low byte of first product 
    jrnc 1$
    inc (PROD,sp) ; overflow 
1$: ld (2,x),a  
    ld a,(PROD,sp)
    ld (1,x),a
    ld a,yl 
    ld (3,x),a 
    addw SP,#VSIZE 
    ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; divide u16/10 
; input:
;   u    uint16 
; output:
;   q    uint16 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
u16div10: ; ( u -- u/10 )
    ldw y,x 
    ldw y,(y)
    ld a,#10
    divw y,a
    ldw (x),y  
    ret 
.endif 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   FLOAT?  ( u a+ cnt sign  -- f24 -3 | ABORT )
;   called by NUMBER? 
;   parse string to float
;   clean stack and ABORT if parse fail. 
; input:
;   u     already parsed integer digits
;   a    point to string after last parsed digit 
;   cnt   number of char left in string 
;   sign  sign of parsed integer part 
; ouput:
;   f24   if format ok 
;   -3    data type identifier 
; -------------
;  ABORT if parse fail 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FLOATQ,5,"FLOAT?"
; BASE must be 10 
    CALL BASE 
    CALL AT 
    _DOLIT 10 
    CALL EQUAL 
    _TBRAN 1$ ; accept only base 10 float.
; bad float format abort   
    addw x,#4*CELLL ; drop u a+ cnt sign 
    JP ABOR1 
1$: ; first push sign 
    CALL TOR ; a u a+ cnt R: sign
    CALL parse_fraction ; -- a a+ cnt- ndec m
    CALL TOR ; a a+ cnt- ndec r: sign  m
    CALL TOR ; a a+ cnt- r: sign m ndec  
    CALL QDUP 
    _TBRAN 2$
; end of string, no exponent part 
    CLRW Y 
    PUSHW Y ;  a a+ r:sign m ndec exp=0
    JRA FLOATQ3   
2$: call parse_exponent ; -- a a+ cnt- e 
    CALL TOR ; a a+ cnt- r: sign m ndec exp 
    _QBRAN FLOATQ3 ; build float 
; if character left in string it's not a float 
; clean stack and ABORT 
    ADDW X,#2*CELLL ; drop a+ cnt-  
    JP ABOR1 
FLOATQ3: ; build float from part on R: 
; a a+ r: sign m ndec exp   
    ADDW X,#2*CELLL ; drop a a+ 
    CALL RFROM ; exp r: sign m ndec    
    CALL RFROM ; -- exp ndec r: sign m 
    CALL SUBB  ; adjusted exponent. 
    CALL RFROM ; exp  m r: sign 
; if m>MAX_MANTISSA then m/10 e++ 
    CALL  DUPP 
    CALL ZLESS 
    _QBRAN FLOATQ34
    _DOLIT 10 
    CALL USLMOD 
; round to nearest integer 
    CALL SWAPP 
    _DOLIT 5 
    CALL GREAT 
    _QBRAN FLOATQ31
    CALL ONEP 
FLOATQ31: 
    CALL SWAPP
    CALL ONEP 
    CALL SWAPP      
FLOATQ34:     
    CALL RFROM  ; sign 
    _QBRAN FLOATQ4 
    CALL NEGAT 
FLOATQ4:
    CALL SWAPP ; m e 
    CALL SET_FPSW 
    _DOLIT -3 
    RET       

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  LSCALE ( f24 -- f24 )
;  m *=10 , e -= 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER LSCALE,6,"LSCALE"
    CALL ONE 
    CALL SUBB 
    CALL TOR
    _DOLIT 10 
    CALL STAR
    CALL RFROM 
    RET  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  RSCALE ( f# -- f# )
;  m /=10 , e+=1 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER RSCALE,6,"RSCALE"
    CALL ONE 
    CALL PLUS 
    CALL TOR 
    _DOLIT 10 
    CALL SLASH  
    CALL RFROM 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  F24LITERAL ( f24 -- )
;  compile 24 bits literal 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FLITER,COMPO+IMEDD+10,"F24LITERAL"
CALL DOTS 
    CALL COMPI 
    .word dof24lit 
    CALL CCOMMA 
    JP   COMMA 


; runtime for F24LITERAL
; 24 bits literal 
dof24lit:
    SUBW X,#4 
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
    LDW (2,X),Y 
    POPW Y 
    JP (3,Y)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   F24CONST ( f24 -- )
;   create a float24 constant 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER F24CONST,8,"F24CONST" 
        CALL TOKEN
        CALL SNAME 
        CALL OVERT 
        CALL COMPI 
        .word DOF24CONST 
        CALL CCOMMA
        CALL COMMA  
        CALL FMOVE
        CALL QDUP 
        CALL QBRAN 
        .word SET_RAMLAST  
        CALL UPDATPTR  
        RET          

DOF24CONST:
    LDW Y,(1,SP) 
    SUBW x,#2*CELLL 
    LD A,(Y)
    CLRW Y 
    LD YL,A
    TNZ A 
    JRPL 1$
    LD A,#255
    LD YH,A 
1$:      
    LDW (X),Y 
    POPW Y 
    LDW Y,(1,Y)
    LDW (2,X),Y 
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   F24VAR "name" ( -- )
;   create a float24 variable 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER F24VAR,6,"F24VAR"
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
;   F24! ( f24 a -- )
;   store float24 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER F24STO,4,"F24!"
    LDW Y,X 
    LDW Y,(Y) ; a 
    LD A,(3,X) ; e low  
    LD (Y),A
    ADDW Y,#1  
    LDW YTEMP,Y 
    LDW Y,X 
    LDW Y,(4,Y) ; m 
    LDW [YTEMP],Y 
    ADDW X,#3*CELLL 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   F24@ ( a -- f24 )
;   stack float24 variable 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER F24AT,4,"F24@"
    LDW Y,X 
    LDW Y,(Y) ; a 
    PUSHW Y 
    SUBW X,#CELLL 
    LDW Y,(1,Y) ; m 
    LDW (2,X),Y 
    POPW Y   ; a 
    LD A,(Y) ; e 
    CLRW Y 
    LD YL,A 
    TNZ A 
    JRPL 1$
    LD A,#255 
    LD YH,A 
1$: LDW (X),Y ; m e -- 
    JP SET_FPSW 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  SCALEUP ( um u1 u2 -- um* u1 u2* )
;  while (um<=0xccc && u1<u2 ){
;        um*10;
;        u2--;
;  }  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SCALEUP:
    CALL DDUP
    CALL LESS  
    _QBRAN SCALEUP3
    CALL ROT 
    CALL DUPP 
    _DOLIT 0XCCC 
    CALL GREAT  
    _TBRAN SCALEUP2 
    _DOLIT 10 
    CALL STAR 
    CALL NROT 
    CALL ONEM
    JRA SCALEUP
SCALEUP2:
    CALL NROT 
SCALEUP3: 
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SCALEDOWN ( um u1 u2 -- um* u1 u2* )
;  whhile (um && u1>u2 ){ 
;     um/10;
;     u2++;
;  } 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SCALEDOWN: 
    CALL DDUP 
    CALL GREAT 
    _QBRAN SCALDN3 
    CALL ROT  
    CALL DUPP 
    CALL ZEQUAL 
    _TBRAN SCALDN2  
    _DOLIT 10
    CALL SLASH 
    CALL NROT  
    CALL ONEP  
    JRA SCALEDOWN 
SCALDN2:
    CALL NROT  
SCALDN3:
    RET 




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  F-ALIGN ( f#1 f#2 -- m1 m2 e )
;  align to same exponent 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FALIGN,7,"F-ALIGN"
    CALL TOR  
    CALL SWAPP  ; m1 m2 e1 R: e2 
    CALL RFROM ; m1 m2 e1 e2 
    CALL DDUP  
    CALL EQUAL 
    _QBRAN FALGN1 
    _DROP 
    RET 
FALGN1:     
; scale mantissa absolute values 
    CALL TOR 
    CALL TOR   ; m1 m2 R: e2 e1 
    CALL MSIGN 
    CALL NROT  ; m2s m1 m2  
    CALL ABSS  ; m2s m1 um2 
    CALL SWAPP  ; m2s um2 m1 
    CALL MSIGN ; m2s um2 m1 m1s 
    CALL NROT  ; m2s m1s um2 m1     
    CALL ABSS  ; m2s m1s um2 um1 
    CALL SWAPP ; m2s m1s um1 um2       
; scaleup the largest float 
; but limit mantissa <=0xCCC 
; to avoid mantissa overflow     
    CALL RFROM 
    CALL RFROM ; m2s m1s um1 um2 e1 e2 
    CALL DDUP 
    CALL LESS  
    _QBRAN FALGN4 ; e2<e1 
; e2>e1 then scale up m2   
    CALL SCALEUP  ; ... um1 um2* e1 e2* 
    JRA FALGN6
FALGN4: ; e2<e1 then scaleup m1 
    CALL TOR   ; ... um1 um2 e1 R: e2
    CALL TOR   ; ... um1 um2 R: e2 e1 
    CALL SWAPP 
    CALL RFROM  
    CALL RFROM 
    CALL SWAPP ; .. um2 um1 e2 e1 
    CALL SCALEUP ; um2 um1* e2 e1* 
    CALL SWAPP 
    CALL TOR
    CALL TOR     
    CALL SWAPP  ; um1 um2 R: e2 e1
    CALL RFROM 
    CALL RFROM
    CALL SWAPP  ; ... um1 um2 e1 e2  
; check again for e2==e1 
; if scaleup was not enough 
; to equalize exponent then
; scaledown smallest float     
FALGN6: 
    CALL DDUP 
    CALL EQUAL 
    _TBRAN FALGN8 
; e2!=e1 need to scale down smallest 
    CALL DDUP
    CALL LESS  
    _QBRAN FALGN7 ; e2<e1 
; e2>e1 scaledown m1 
    CALL TOR 
    CALL TOR 
    CALL SWAPP   ; ... um2 um1 
    CALL RFROM  ; ... um2 um1 e1 
    CALL RFROM  ; ... um2 um1 e1 e2 
    CALL SWAPP  ; ... um2 um1 e2 e1 
    CALL SCALEDOWN
    CALL SWAPP 
    CALL TOR
    CALL TOR 
    CALL SWAPP   ; m1 m2 R: e2 e1  
    CALL RFROM 
    CALL RFROM   ; ... um1 um2 e1 e2 
    JRA FALGN71  
FALGN7: ; e2<e1 scaledown m2 
    CALL SCALEDOWN 
; after scaledown if e2!=e1 
; this imply that one of mantissa 
; as been nullified by scalling 
; hence keep largest exponent 
FALGN71:
    CALL DDUP 
    CALL EQUAL
    _TBRAN FALGN8 
    CALL DDUP  
    CALL GREAT ; e1>e2 ? 
    _TBRAN FALGN8
    CALL SWAPP     
FALGN8: ; m2s m1s um1 um2 e2 e1  
    _DROP  ; m2s m1s um1 um2 e 
    CALL TOR 
    CALL TOR 
    CALL SWAPP ; m2s um1 m1s 
    _QBRAN FALGN9 
    CALL NEGAT 
FALGN9:  
    CALL SWAPP 
    CALL RFROM 
    CALL SWAPP 
    _QBRAN FALGN10 
    CALL NEGAT 
FALGN10: ; m1 m2 
    CALL RFROM ; m1 m2 e 
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  add 2 mantissa and ajust 
;  for overflow 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MPLUS: ; m1 m2 e -- m* e* )  
    CALL TOR 
    LDW Y,X 
    LDW Y,(Y)
    PUSHW Y 
    LDW Y,X 
    LDW Y,(2,Y)
    ADDW Y,(1,SP)
    LDW (2,X),Y ; sum 
    POPW Y ; drop local variable m2 
    JRNV 3$  ; no overflow, done 
; increment e 
    LDW Y,(1,SP) ; e
    ADDW Y,#1    ; increment e 
    LDW (1,SP),Y
; divide mantissa by 10
    LD A,(2,X) 
    PUSH A 
    JRMI 0$ 
    LDW Y,X 
    LDW Y,(2,Y)
    NEGW Y 
    LDW (2,X),Y 
0$: LDW Y,#10 
    LDW (X),Y 
    CALL USLMOD ; remainder  sum/10 
    CALL SWAPP
    _DOLIT 5 
    CALL LESS
    POP A 
    _TBRAN 2$
    LDW Y,X
    LDW Y,(Y) 
    ADDW Y,#1
    TNZ A 
    JRMI 1$
    NEGW Y 
1$: LDW (X),Y  
2$: SUBW X,#CELLL  
3$: 
    POPW Y  ; e 
    LDW (X),Y  ; e  
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
    LDW Y,x
    LDW Y,(2,Y)
    NEGW Y 
    LDW (2,X),Y 
    JRA FPLUS  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   DS/MOD ( ud us - ur qud )
;   unsigned divide double by single 
;   return double quotient 
;   and single remainder 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DSLMOD,6,"DS/MOD"
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   SCALE>M ( ud1 -- e u )
;   scale down a double  
;   by repeated ud1/10
;   until ud<=MAX_MANTISSA   
;   e is log10 exponent of scaled down
;   u is scaled down ud1 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER SCALETOM,7,"SCALE>M"
    CLRW Y 
    PUSHW Y  ; local variable to save last remainder 
    CALL ZERO 
    CALL NROT ;  e ud 
SCAL1:
    CALL DUPP 
    CALL ZEQUAL  
    _QBRAN SCAL2  
    CALL OVER 
    _DOLIT MAX_MANTISSA
    CALL UGREAT 
    _QBRAN SCAL3
SCAL2:     
    _DOLIT 10 
    CALL DSLMOD
    CALL ROT  
; save remainder on rstack     
    LDW Y,X 
    LDW Y,(Y)
    LDW (1,SP),Y 
    ADDW X,#CELLL ; drop it from dstack 
    CALL ROT 
    CALL ONEP 
    CALL NROT  
    JRA SCAL1 
SCAL3: 
    _DROP ; drop ud high
    CALL RFROM ; last remainder  
    _DOLIT 5 
    CALL LESS 
    _TBRAN SCAL4
    CALL ONEP 
SCAL4:      
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
    CALL MSIGN
    CALL TOR   ; m1 m2 R: e m2sign 
    CALL ABSS  
    CALL SWAPP ; um2 m1  R: e m2sign 
    CALL MSIGN ; um2 m1 m1sign R: e m2sign 
    CALL RFROM   
    CALL XORR 
    CALL NROT   ; *sign um2 m1 R: e 
    CALL ABSS  ; *sign um2 um1 R: e 
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  F/ ( f#1 f#2 -- f#3 )
;  float division
;  f#3 = f#1/f#2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FSLASH,2,"F/"
    CALL TOR    ; m1 e1 m2   R: e2 
    CALL SWAPP
    CALL RFROM 
    CALL SUBB 
    CALL TOR   ; m1 m2 R: e   
    CALL MSIGN 
    CALL TOR   ; m1 m2 R: e m2s 
    CALL ABSS   ; m1 um2 R: e m2s 
    CALL SWAPP  ;um2 m1 R: e m2s 
    CALL MSIGN  ; um2 m1 m1s R: e m2s 
    CALL RFROM  ; um2 m1 m1s m2s R: e
    CALL XORR   
    CALL NROT  ; qsign um2 m1 
    CALL ABSS  ; qsign um2 um1 R: e 
    CALL SWAPP ; qsign um1 um2 R: e  
    CALL DUPP 
    CALL TOR   ; qsign um1 um2 R: e um2 
    CALL USLMOD ; qsign ur uq R: e um2 
FSLASH1: ; fraction loop 
; check for null remainder 
    LD A,(2,X)
    OR A,(3,X)
    JREQ FSLASH8 
; get fractional digits from remainder until mantissa saturate
; qsign remainder mantissa R: e divisor 
; check for mantissa saturation 
    CALL DUPP 
    _DOLIT 0xCCC 
    CALL UGREAT
    _TBRAN FSLASH8 ; another loop would result in mantissa overflow 
; multiply mantissa by 10 
    _DOLIT 10 
    CALL STAR 
; mutliply remainder by 10     
    CALL SWAPP
    _DOLIT 10  
    CALL STAR 
; divide remainder by um2     
    CALL RAT  ; mantissa remainder divisor R: e divisor 
    CALL USLMOD ; mantissa dr dq R: e divisor 
    CALL SWAPP ; mantissa frac_digit remainder R:  e divisor  
    CALL TOR  ; mantissa frac_digit R: e divisor remainder 
    CALL PLUS ; mantissa+frac_digit 
    CALL RFROM ; mantissa remainder R: e divisor  
    CALL SWAPP  ; remainder mantissa  
; decrement e 
    LDW Y,(3,SP) ; e 
    DECW Y 
    LDW (3,SP),Y 
    JRA FSLASH1
FSLASH8: ; qsign remainder mantissa R: qs e divisor 
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
;   S>F  ( # -- f# )
;   convert double to float 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER STOF,3,"S>F"
    CALL ZERO 
    JP SET_FPSW

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   F>S  ( f# -- n )
;  convert float24 to single  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FTOS,3,"F>S"
    CALL QDUP
    _QBRAN FTOD9
    CALL TOR 
    CALL MSIGN 
    CALL SWAPP 
    CALL ABSS
    CALL RFROM  
    CALL DUPP   
    CALL ZLESS 
    _QBRAN FTOD4 
; negative exponent 
    CALL ABSS 
    CALL TOR
    JRA FTOD2  
FTOD1:
    CALL DDUP 
    CALL ZEQUAL 
    _TBRAN FTOD3 
    _DOLIT 10 
    CALL USLMOD 
    CALL SWAPP  
    _DOLIT 5 
    CALL LESS 
    _TBRAN FTOD2  
    CALL ONEP 
FTOD2:      
    _DONXT FTOD1
    JRA FTOD8   
FTOD3: 
    CALL RFROM 
    _DROP 
    JRA FTOD8  
; positive exponent 
FTOD4:
    CALL TOR 
    JRA FTOD6
FTOD5:
    _DOLIT 10 
    CALL UMSTA
    _QBRAN FTOD6 
    ADDW SP,#CELLL 
    JRA FTOD8  
FTOD6: 
    _DONXT FTOD5 
FTOD8:
    CALL ROT 
    _QBRAN FTOD9 
    CALL NEGAT
FTOD9:          
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DSWAP ( f#1 f#2 -- f#2 f#1 )
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
     
