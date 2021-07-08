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

;*********************************
;    floating point library
;    adapted from 
;    Forth dimensions Vol. IV #1 
;    published in  may/june 1982
;
; Creation date: 2021-06-15 
;
;  This file is part of stm8_eforth 
;  project and same licence apply.
;************************************

;*************************************************
;  FLOAT format double for storage 
;  bits 23:0  signed mantissa
;  bits  31:24  signed exponent
;***********************************************  

    .module FLOAT 

.if WANT_DOUBLE 
; already included 
.else
;  must be included  
    .include "double.asm"
.endif  

    MAX_MANTISSA = 0x7FFFFF 

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
    CALL ZERO  
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
;    FZE  ( -- 0|-1 )
;    return FPSW zero flag 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FZE,3,"FZE"
    CALL FPSW
    CALL AT  
    CALL ONE 
    CALL ANDD
    CALL NEGAT  
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    FNE ( -- 0|-1 )
;    return FPSW negative flag 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FNE,3,"FNE"
    CALL FPSW 
    CALL AT 
    _DOLIT 2 
    CALL ANDD
    CALL TWOSL
    CALL NEGAT   
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   FOV (  -- 0|-1 )
;   return FPSW overflow flag 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FOV,3,"FOV"
    CALL FPSW
    CALL AT  
    _DOLIT 4 
    CALL ANDD
    _DOLIT 2 
    CALL RSHIFT 
    CALL NEGAT  
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    SFZ ( f# -- f# )
;    set FPSW zero flag 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER SFZ,3,"SFZ"
    CALL FER 
    _DOLIT 0xfffe 
    CALL ANDD 
    CALL TOR    
    CALL DDUP 
    _DOLIT 0xFF  
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
    CALL FER 
    _DOLIT 0xFFFD 
    CALL ANDD  
    CALL TOR 
    CALL DUPP 
    _DOLIT 0X80 
    CALL ANDD 
    _DOLIT 6 
    CALL RSHIFT 
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
    CALL FER 
    _DOLIT 4 
    CALL ORR 
    CALL FPSW 
    CALL STORE 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  F>ME ( f# -- m e )
;  split float in mantissa/exponent 
;  m mantissa as a double 
;  e exponent as a single 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER ATEXP,4,"F>ME"             
    CALL FRESET
    CALL SFN
    CALL SFZ 
    LDW Y,X 
    LDW Y,(Y)
    PUSHW Y 
    CLR A  
    SWAPW Y 
    JRPL ATEXP1 
    CPL A 
ATEXP1: ; sign extend mantissa 
    SWAPW Y 
    LD YH,A 
    LDW (X),Y 
    SUBW X,#CELLL 
    POPW Y 
    CLR A 
    TNZW Y 
    JRPL ATEXP2 
    CPL A 
ATEXP2:
    SWAPW Y 
    LD YH,A 
    LDW (X),Y 
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    ME>F ( m e -- f# )
;    built float from mantissa/exponent 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER STEXP,4,"ME>F"
    CALL DUPP 
    CALL ABSS 
    _DOLIT 127 
    CALL GREAT
    _QBRAN STEXP1
    CALL SFV
STEXP1:
    LDW Y,X 
    LDW Y,(Y)
    CLR A 
    LD YH,A
    SWAPW Y 
    PUSHW Y  ; e >r 
    ADDW X,#CELLL 
    CALL DDUP 
    CALL DABS
    CALL SWAPP 
    CALL DROP  
    _DOLIT 127 
    CALL GREAT 
    _QBRAN STEXP2 
    CALL SFV 
STEXP2: 
    CLR A 
    LD (X),A     
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
    CALL DABS 
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
    CALL DROP 
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
    CALL    DNEGA 
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
    CALL SFN 
    CALL SFZ 
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
    CALL ZERO 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  LSCALE ( f# -- f# )
;  m *=10 , e -= 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER LSCALE,6,"LSCALE"
    CALL ATEXP 
    CALL ONE 
    CALL SUBB 
    CALL TOR
    _DOLIT 10 
    CALL DSSTAR
    CALL RFROM 
    CALL STEXP 
    RET  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  RSCALE ( f# -- f# )
;  m /=10 , e+=1 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER RSCALE,6,"RSCALE"
    CALL ATEXP 
    CALL ONE 
    CALL PLUS 
    CALL TOR 
    _DOLIT 10 
    CALL DSLMOD 
    CALL ROT 
    CALL DROP 
    CALL RFROM 
    CALL STEXP 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  SCALEUP ( ud u1 u2 -- ud*10 u1 u2 )
;  while (ud<=0xcccccccc && u1<u2 ){
;        ud*10;
;        u2--;
;  }  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SCALEUP:
    CALL DDUP
    CALL LESS  
    _QBRAN SCALEUP3
    CALL DTOR   ; R: u1 u2  
    CALL DDUP 
    _DOLIT 0XCCCC 
    _DOLIT 0XCCC 
    CALL DGREAT  
    _TBRAN SCALEUP2 
    _DOLIT 10 
    CALL UDSSTAR 
    CALL DRFROM 
    CALL ONEM
    JRA SCALEUP
SCALEUP2:
    CALL DRFROM
SCALEUP3: 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SCALEDOWN ( ud u1 u2 -- ud u1 u2 )
;  whhile (ud && u1>u2 ){ 
;     ud/10;
;     u2++;
;  } 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SCALEDOWN: 
    CALL DDUP 
    CALL GREAT 
    _QBRAN SCALDN3 
    CALL DTOR 
    CALL DDUP 
    CALL DZEQUAL 
    _TBRAN SCALDN2  
    _DOLIT 10 
    CALL UDSLMOD 
    CALL ROT  
    CALL DROP
    CALL DRFROM 
    CALL ONEP  
    JRA SCALEDOWN 
SCALDN2:
    CALL DRFROM 
SCALDN3:
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  F-ALIGN ( f#1 f#2 -- m1 m2 e )
;  align to same exponent 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FALIGN,7,"F-ALIGN"
    CALL ATEXP 
    CALL TOR   ; f#1 m2 R: e2 
    CALL DSWAP  ; m2 f#1 R: e2 
    CALL ATEXP   ; m2 m1 e1 R: e2 
    CALL TOR   ; m2 m1 R: e2 e1 
    CALL DSIGN  ; m2 m1 m1s  
    CALL TOR    ; m2 m1 
    CALL DABS   ; m2 um1 
    CALL DSWAP  ; um1 m2 
    CALL DSIGN  ; um1 m2 m2s 
    CALL TOR    ; um1 m2 R: e1 e1 m1s m2s 
    CALL DABS ; um1 um2 R: e2 e1 m1s m2s 
    CALL DRFROM 
    CALL DRFROM 
    CALL DSWAP 
    CALL DTOR  
    CALL DTOR ; um1 um2 R: m1s m2s e2 e1 
; if e2==e1 not scaling 
    CALL JFETCH   ; E2 
    CALL IFETCH   ; E1 
    CALL EQUAL 
    _TBRAN FALGN8 
    CALL JFETCH  
    CALL IFETCH  
    CALL LESS ; E2<E1 
    _TBRAN FALGN4 
; E2>E1 
    CALL DRFROM   ; um1 um2 e2 e1 
    CALL SWAPP    ; um1 um2 e1 e2 
CALL DOTS 
    CALL SCALEUP ; scale up um2 until e1==e2 
CALL DOTS 
    CALL SWAPP 
    CALL DTOR 
    CALL DRAT 
    CALL EQUAL 
    _TBRAN FALGN8 
    CALL DSWAP   ; um2 um1 
    CALL DRFROM  ;`um2 um1 e2 e1 
CALL DOTS 
    CALL SCALEDOWN ; um1 while e2>e1 
CALL DOTS 
    CALL DDUP 
    CALL GREAT 
    _TBRAN FALGN3 ; e2>e1 keep e2 
    CALL SWAPP   ; else keep e1
FALGN3:
    CALL DTOR 
    CALL DSWAP  ; um1 um2 
    JRA FALGN8  
FALGN4: ; E2<E1 
    CALL DSWAP 
    CALL DRFROM ; um2 um1 e2 e1  
    CALL SCALEUP ; um1 until e2==e1 
    CALL DTOR 
    CALL DSWAP
    CALL DRAT 
    CALL EQUAL 
    _TBRAN FALGN8 
    CALL DRFROM    ; um1 um2 e2 e1 
    CALL SWAPP     ; um1 um2 e1 e2 
    CALL SCALEDOWN ; um2 until e1==e2 
    CALL DTOR 
FALGN8: 
    CALL DRFROM  ; um1 um2 e2 e1 
    CALL DROP   ;  um1 um2 e1 
    CALL DRFROM  ; um1 um2 e1 m1s m2s 
    CALL ROT     ; um1 um2 m1s m2s e1 
    CALL TOR     ; um1 um2 m1s m2s R: e
    CALL SWAPP 
    CALL TOR     ; um1 um2 m2s R: e m1s 
    _QBRAN FALGN9 
    CALL DNEGA
FALGN9:
    CALL DSWAP 
    CALL RFROM 
    _QBRAN FALGN10 
    CALL DNEGA 
FALGN10:
    CALL DSWAP  ; m1 m2 R: e1 
    CALL RFROM  ; m1 m2 e 
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   F+ ( f#1 f#2 -- f#1+f#2 )
;   float addition 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FPLUS,2,"F+"
    CALL FALIGN 
    CALL TOR 
    CALL DPLUS
    CALL SCALETOM
    CALL ROT   
    CALL RFROM
    CALL PLUS  
    CALL STEXP 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  F- ( f#1 f#2 -- f#1-f#2 )
;  substraction 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FSUB,2,"F-"
    CALL FALIGN 
    CALL TOR 
    CALL DSUB
    CALL DSIGN 
    CALL TOR 
    CALL DABS 
    CALL SCALETOM 
    CALL RFROM 
    _QBRAN FSUB1 
    CALL DNEGA 
FSUB1:
    CALL ROT 
    CALL RFROM
    CALL PLUS  
    CALL STEXP 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; /mod10  ( m -- m/10 r )
; divide mantissa by 10 
; return quotient and remainder 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
UMOD10:
    _DOLIT 10 
    CALL DSLMOD
    CALL ROT  
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   SCALE>M ( ud1 -- e ud2 )
;   scale down a double  
;   by repeated d/10
;   until ud<=MAX_MANTISSA   
;   e is log10 exponent of scaled down
;   ud2 is scaled down ud1 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER SCALETOM,7,"SCALE>M"
    CALL ZERO 
    CALL NROT 
SCAL1:
    CALL DUPP 
    _DOLIT 0X7F 
    CALL UGREAT 
    _QBRAN SCAL2  
    CALL UMOD10 
    CALL DROP 
    CALL ROT 
    CALL ONEP 
    CALL NROT  
    _BRAN SCAL1 
SCAL2: 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  UDIV10 ( ut -- ut )
;  divide a 48 bits uint by 10 
;  used to scale down MM* 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
UDIV10:
    LDW Y,X 
    LDW Y,(Y)
    LD A,#10 
    DIV Y,A 
    LDW (X),Y 
    LD YH,A 
    LD A,(2,X)
    LD YL,A 
    LD A,#10 
    DIV Y,A 
    LD YH,A 
    LD A,YL 
    LD (2,X),A 
    LD A,(3,X)
    LD YL,A 
    LD A,#10 
    DIV Y,A 
    LD YH,A 
    LD A,YL 
    LD (3,X),A 
    LD A,(4,X)
    LD YL,A 
    LD A,#10 
    DIV Y,A 
    LD YH,A 
    LD A,YL 
    LD (4,X),A 
    LD A,(5,X)
    LD YL,A 
    LD A,#10 
    DIV Y,A 
    LD A,YL 
    LD (5,X),A 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   MM* ( m1 m2 -- m3 e )
;   mantissa product 
;  scale down to 23 bits 
;   e  is log10 scaling factor.
;   The maximum product size 
;   before scaling is 46 bits .
;   UDIV10 is used to scale down.  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER MMSTAR,3,"MM*"
    CALL DDUP
    CALL DZEQUAL
    _TBRAN MMSTA2
MMSTA1:
    CALL DOVER 
    CALL DZEQUAL 
    _QBRAN MMSTA3 
MMSTA2: ; ( -- 0 0 0 )
    ADDW X,#2 
    CLRW Y 
    LDW (X),Y 
    LDW (2,X),Y
    LDW (4,X),Y 
    RET 
MMSTA3:
    CALL DSIGN 
    CALL TOR    ; R: m2sign 
    CALL DABS   ; m1 um2 
    CALL DSWAP  ; um2 m1 
    CALL DSIGN  ; um2 m1 m1sign 
    CALL RFROM 
    CALL XORR 
    CALL TOR   ; R: product_sign 
    CALL DABS  ; um2 um1  
    CALL DTOR  ; um2 
    CALL DUPP  ; um2 um2hi 
    CALL RAT   ; um2 um2hi um1hi
; first partial product  
; pd1=um2hi*um1hi 
    CALL STAR 
    CALL ZERO 
    CALL SWAPP ; pd1<<16  
    CALL DSWAP ; pd1 um2 
    CALL OVER  ; pd1 um2 um2lo 
    CALL RFROM ; pd1 um2 um2lo um1hi 
; pd2=um2lo*um1hi 
    CALL UMSTA ; pd1 um2 pd2 
    CALL DSWAP ; pd1 pd2 um2 
    CALL RAT   ; pd1 pd2 um2 um1lo 
; pd3= um2hi*um1lo 
    CALL UMSTA ; pd1 pd2 um2lo pd3 
    CALL ROT ; pd1 pd2 pd3 um2lo 
    CALL TOR ; pd1 pd2 pd3 R: psign um1lo um2lo 
; pd1+pd2+pd3  pd1
    CALL DPLUS 
    CALL DPLUS  
    CALL DRFROM ; triple um2lo um1lo 
; last partial product um2lo*um1lo 
    CALL UMSTA ; prod pd4 
; mm*=prod<<16+pd4  
    CALL DTOR ;   R: psign pd4lo pd4hi  
 ; add pd4hi to prodlo and propagate carry 
    LDW Y,X 
    LDW Y,(2,Y)  ; prodlo 
    ADDW Y,(1,SP)  ; prodlo+pd4hi 
    LDW (1,SP),Y    ; plo phi  
    LDW Y,X
    LDW Y,(Y) ; prodhi  
    JRNC MMSTA4
    ADDW Y,#1 ; add carry 
MMSTA4:     
    SUBW X,#2 
    LDW (X),Y 
    POPW Y 
    LDW (2,X),Y 
    POPW Y 
    LDW (4,X),Y
    CALL ZERO 
    CALL TOR 
MMSTA5:
    CALL QDUP 
    _QBRAN MMSTA6 
    CALL UDIV10 
    CALL RFROM 
    CALL ONEP 
    CALL TOR 
    _BRAN MMSTA5 
; now scale to double 
; scale further <= MAX_MANTISSA 
MMSTA6: 
    CALL RFROM 
    CALL NROT 
    CALL SCALETOM
    CALL DTOR 
    CALL PLUS 
    CALL DRFROM 
    CALL RFROM
    _QBRAN MMSTA7
    CALL DNEGA
MMSTA7:
    CALL ROT ; m e 
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
    CALL TOR   ; m2 m1 R: e 
    CALL MMSTAR ; m2*m1 e   
    CALL RFROM 
    CALL PLUS 
    CALL STEXP ; f#3 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  F/ ( f#1 f#2 -- f#3 )
;  float division
;  f#3 = f#1/f#2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FSLASH,2,"F/"
    CALL ATEXP  ; f#1 m2 e2 
    CALL TOR    ; f#1 m2   R: e2 
    CALL DSIGN  ; f#1 m2 m2sign 
    CALL TOR    ; F#1 m2 R: e2 m2s 
    CALL DABS   ; F#1 um2 
    CALL DSWAP  ; m2 f#1 
    CALL ATEXP  ; m2 m1 e1 
    CALL ONE    ; e2 slot on rstack  
    CALL NRAT   ; m2 m1 e1 e2 
    CALL PLUS   ; m2 m1 e 
    CALL ONE    ; e slot on rstack 
    CALL NRSTO  ; m2 m1 R: e m2s 
    CALL DSIGN  ; m2 m1 m1sign 
    CALL RFROM  ; m2 m1 m1s m2s  
    CALL XORR   ; m2 m1 quot_sign R: e 
    CALL RFROM   
    CALL DTOR   ; m2 m1 R: qs e  
    CALL DABS   ; um2 um1 R: qs e  
    CALL DSWAP  ; m1 m2 R: qs e
    CALL DDUP  ; m1 m2 m2 R: qs e
    CALL DTOR  ; m1 m2 R: qs e m2 ( keep divisor need later ) 
    CALL UDSLMOD ; remainder m1/m2 R: e m2 
FSLASH1: 
    CALL DOVER ; if remainder null done 
    CALL DZEQUAL 
    _TBRAN FSLASH8 
; get fractional digits from remainder until mantissa saturate
; remainder mantissa R: e divisor 
; check for mantissa saturation 
    CALL DDUP 
    _DOLIT 0XCCCC 
    _DOLIT 0xC
    CALL DGREAT 
    _TBRAN FSLASH8 ; another loop would result in mantissa overflow 
; multiply mantissa by 10 
    _DOLIT 10 
    CALL ZERO 
    CALL DSTAR 
; mutliply remainder by 10     
    CALL DSWAP 
    _DOLIT 10 
    CALL ZERO 
    CALL DSTAR 
; divide remainder by m2     
    CALL DRAT  ; mantissa remainder divisor R: e divisor 
    CALL UDSLMOD ; mantissa dr dq R: qs e divisor 
    CALL DSWAP ; mantissa frac_digit remainder R: qs e divisor  
    CALL DTOR  ; mantissa frac_digit R: qs e divisor remainder 
    CALL DPLUS ; mantissa+frac_digit 
    CALL DRFROM ; mantissa remainder R: qs e divisor  
    CALL DSWAP  ; remainder mantissa  
; increment e 
    _DOLIT 2    ; e slot on rstack 
    CALL NRAT   ;  2 NR@ -- e 
    CALL ONEP   ; increment exponent 
    _DOLIT 2 
    CALL NRSTO  ; e 2 NR! , update e on rstack     
    _BRAN FSLASH1
FSLASH8: ; remainder mantissa R: qs e divisor 
    CALL DSWAP  
    CALL DDROP  ; drop remainder     
    CALL DRFROM
    CALL DDROP  ; drop divisor 
    CALL JFETCH    ; quotient sign 
    _QBRAN FSLASH9 
    CALL DNEGA  
FSLASH9:
    CALL RFROM  ; exponent 
    CALL STEXP 
    CALL RFROM 
    CALL DROP ; drop qs 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   D>F  ( # -- f# )
;   convert double to float 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER DTOF,3,"D>F"
    CALL DSIGN 
    CALL TOR
    CALL DABS  
DTOF1:      
    CALL SCALETOM 
    CALL RFROM
    _QBRAN DTOF2 
    CALL DNEGA 
DTOF2: 
    CALL ROT 
    CALL STEXP 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   F>D  ( f# -- # )
;  convert float to double 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FTOD,3,"F>D"
    CALL ATEXP ; m e 
    CALL QDUP
    _QBRAN FTOD9
    CALL TOR 
    CALL DSIGN 
    CALL NROT 
    CALL DABS
    CALL RFROM  
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
    _TBRAN FTOD3 
    _DOLIT 10 
    CALL DSLMOD 
    CALL ROT 
    CALL DROP
FTOD2:      
    _DONXT FTOD1
    _BRAN FTOD8   
FTOD3: 
    CALL RFROM 
    CALL DROP 
    _BRAN FTOD8  
; positive exponent 
FTOD4:
    CALL TOR 
    _BRAN FTOD6
FTOD5:
    CALL DDUP 
    _DOLIT 0XCCCC
    _DOLIT 0XCCC  
    CALL DGREAT 
    _TBRAN FTOD3 
    _DOLIT 10 
    CALL ZERO 
    CALL DSTAR 
FTOD6: 
    _DONXT FTOD5 
FTOD8:
    CALL ROT 
    _QBRAN FTOD9 
    CALL DNEGA
FTOD9:          
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;
;   F0< ( f# -- f )
;   true if f#<0
;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FZLESS,3,"F0<"
    CALL ATEXP 
    CALL DROP 
    CALL SWAPP 
    CALL DROP 
    CALL ZLESS 
    RET

;;;;;;;;;;;;;;;;;;;;;;;;
;   F< ( f#1 f#2 -- f )
; true if f#1 < f#1 
;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FLESS,2,"F<"
    CALL FSUB  
    JP FZLESS

;;;;;;;;;;;;;;;;;;;;;;;;;
;   F> ( f#1 f#2 -- f )
;   true fi f#1>f#2
;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FGREAT,2,"F>"
    CALL DSWAP 
    JP FLESS 

;;;;;;;;;;;;;;;;;;;;;;;;;
;   F= ( f#1 f#2 -- f ) 
;   true fi f#1==f#2 
;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FEQUAL,2,"F="
    JP DEQUAL 

;;;;;;;;;;;;;;;;;;;;;;;;;;
;   F0= ( f# -- f )
;   true if f# is 0.0 
;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FZEQUAL,3,"F0="
    CALL ATEXP 
    CALL DROP 
    JP DZEQUAL  

;;;;;;;;;;;;;;;;;;;;;;;;;;
;  FNEGATE ( f#1 -- f#2 )
;  f#2 is negation of f#1 
;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FNEGA,7,"FNEGATE"
    CALL ATEXP 
    CALL TOR 
    CALL DNEGA
    CALL RFROM 
    CALL STEXP 
    CALL SFN 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  FABS ( f#1 -- abs(f#1) )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FABS,4,"FABS"
    CALL ATEXP 
    CALL TOR 
    CALL DUPP 
    _DOLIT 0X80 
    CALL ANDD 
    _QBRAN FABS1
    CALL DNEGA 
FABS1: 
    CALL RFROM 
    CALL STEXP 
    CALL SFN 
    RET 
