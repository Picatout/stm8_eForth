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
;  bits  31:24  signed exponent log10 
; 
;  input float format:
;      float32::= ['-'|'+']digits+['.']'e'|'E'['-'|'+'][digits]*
;      the presence of 'e'|'E' character is mandatory 
;      to differentiate float32 from double.
;    example:
;         3.141593  is double 3141593
;         3.141593e is float32  PI 
;         0e   is valid null float. 
;         0.  is valid null double
;***********************************************  

    .module FLOAT 

.if WANT_DOUBLE 
; already included 
.else
;  must be included  
    .include "double.asm"
.endif  

    MAX_MANTISSA = 0x7FFFFF 

    F32_MAJOR=1 
    F32_MINOR=0 

    FLOAT_SIZE=2*CELLL 

; floatting point state bits in FPSW 
    ZBIT=1 ; zero bit flag
    NBIT=2 ; negative flag 
    OVBIT=4 ; overflow flag 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   FLOAT-VER ( -- )
;   print library version 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FVER,9,"FLOAT-VER"
    CALL DOTQP 
    .byte  18 
    .ascii "\nfloat32 library, "
    _DOLIT F32_MAJOR     
    _DOLIT F32_MINOR 
    JP PRINT_VERSION 
    

;-------------------------
;    FPSW ( -- a )
;    floating state variable
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   FINIT ( -- )
;   initialize floating point 
;   library 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    _HEADER FINIT,5,"FINIT"
FINIT:
    CLR UFPSW+1 ; reset state bits 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    FER ( -- u )
;    return FPSW value 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    _HEADER FER,3,"FER"
FER:
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
;    _HEADER SFZ,3,"SFZ"
SFZ:
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
;    _HEADER SFN,3,"SFN"
SFN:
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
;   SFV ( e -- )
;   set overflow flag if e>127 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    _HEADER SFV,3,"SFV"
SFV:
    _DOLIT 127 
    CALL GREAT
    _QBRAN 1$
    CALL FER 
    _DOLIT 4 
    CALL ORR 
    CALL FPSW 
    CALL STORE 
1$:
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  SET-FPSW ( f# -- f# )
;  set float status word 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    _HEADER SET_FPSW,8,"SET-FPSW"
SET_FPSW:
    CALL SFZ 
    CALL SFN 
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  F>ME ( f# -- m e )
;  split float in mantissa/exponent 
;  m mantissa as a double 
;  e exponent as a single 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    _HEADER ATEXP,4,"F>ME"             
ATEXP:
    CALL FINIT 
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
;   _HEADER STEXP,4,"ME>F"
STEXP:
    CALL DUPP 
    CALL ABSS 
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
    _DROP  
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
    JRA EDOT2  
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
    _DROP 
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
    JRA   FDOT2 
FDOT3:
    _DOLIT  '.' 
    CALL    HOLD 
    CALL    DDIGS
    JRA   FDOT9  
FDOT6: ; e>=0 
    JRA   FDOT8
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
    LD  A,  #'E 
    CALL    putc   
    CALL    RFROM 
    CALL    BASE 
    CALL    STORE 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; return parsed exponent or 
; input:
;   a     string pointer to first digit 
;   cnt   digits left in string 
; output:
;    e     exponent 
;    0|-1  parse success flag 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
parse_exponent: ; a cnt -- e -1 | 0 
    CALL TOR   ; a R: cnt 
    CALL ZERO
    CALL DUPP 
    CALL ROT  ; 0 0 a r: cnt  
    CALL RFROM ; 0 0 a cnt 
    CALL NSIGN  
    CALL TOR  ; 0 0 a cnt r: esign 
    CALL QDUP 
    _QBRAN PARSE_SUCCESS ; no digits e=0
    CALL parse_digits
    _QBRAN PARSE_SUCCESS ; parsed to end of string 
PARSE_FAILED: ; digits left 
    CALL RFROM ; ud a esign 
    _DDROP ; ud  
    _DDROP ; drop ud  
    CALL ZERO ; 0 
    RET  
PARSE_SUCCESS: 
    _DDROP ; drop dhi a 
    CALL RFROM ; esign  
    _QBRAN 1$
    CALL NEGAT
1$:
    _DOLIT -1 ; -- e -1 
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  NUMBER? from double.asm jump here 
;  if number can't be parsed as an integer 
;  mantissa already parsed.
;   FLOAT?  
; stacks frames at input: 
;  s: a dlo dhi a cnt
;     a    adress string token  
;     dhi:dlo   mantissa already parsed as uint32 
;     a     moving string pointer 
;     cnt   # characters in string 
;  r: base sign digits
;     base   value of BASE at entry of NUMBER? 
;     sign   mantissa sign 
;     digits count of digits after '.'  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    _HEADER FLOATQ,5,"FLOAT?" ; ( -- float32 -3 )
FLOATQ:
; BASE must be 10 
    CALL BASE 
    CALL AT 
    _DOLIT 10 
    CALL EQUAL 
    _QBRAN FLOAT_ERROR 
; next char must be 'E' 
    _DOLIT 'E' 
    CALL ACCEPT_CHAR 
    _QBRAN FLOAT_ERROR
    CALL parse_exponent ; -- e -1 | 0 
    _QBRAN FLOAT_ERROR 
    CALL RFROM 
    CALL SUBB ; e - digits 
    CALL NROT ; a e ud 
    CALL RFROM ; a e ud msign 
    _QBRAN 2$ 
    CALL DNEGA ; a e -ud 
2$: CALL ROT   ; ud e 
    CALL TOR   ; a ud r: base e 
    CALL ROT   ; ud a r: base e 
    CALL DROP  ; ud r: base e 
    CALL RFROM ; ud e r: base 
    CALL STEXP ; ME>F 
    _DOLIT -3  ; ud e -3 
    JP FLOAT_EXIT 
FLOAT_ERROR: ; a ud a cnt r: base sign digits 
    CALL DRFROM ; sign digits       
    _DDROP ; drop sign digits 
    _DDROP ; drop a cnt 
    _DDROP ; drop ud 
    _DOLIT 0  ; a 0 r: base 
FLOAT_EXIT: 
    CALL RFROM 
    CALL BASE 
    JP STORE


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  LSCALE ( f# -- f# )
;  m *=10 , e -= 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    _HEADER LSCALE,6,"LSCALE"
LSCALE:
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
;    _HEADER RSCALE,6,"RSCALE"
RSCALE:
    CALL ATEXP 
    CALL ONE 
    CALL PLUS 
    CALL TOR 
    _DOLIT 10 
    CALL DSLMOD 
    CALL ROT 
    _DROP 
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
    CALL ZERO  
    CALL DSLASH 
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
;    _HEADER FALIGN,7,"F-ALIGN"
FALIGN:
    CALL ATEXP 
    CALL TOR 
    CALL DSWAP 
    CALL ATEXP 
    CALL TOR    ; m2 m1 R: e2 e1 
    CALL DSWAP 
    CALL DRAT 
    CALL EQUAL 
    _TBRAN FALGN8
; scaleup the largest float 
; but limit mantissa <=0xccccccc
; to avoid mantissa overflow     
    CALL DRAT ; m1 m2 e2 e1 
    CALL GREAT 
    _QBRAN FALGN4 ; e2<e1 
; e2>e1 then scale up m2   
    CALL DRFROM 
    CALL SWAPP 
    CALL SCALEUP 
    CALL SWAPP 
    CALL DTOR 
    JRA FALGN6
FALGN4: ; e2<e1 then scaleup m1 
    CALL DSWAP 
    CALL DRFROM 
    CALL SCALEUP 
    CALL DTOR
    CALL DSWAP 
; check again for e2==e1 
; if scaleup was not enough 
; to equalize exponent then
; scaledown smallest float     
FALGN6: 
    CALL DRAT 
    CALL EQUAL 
    _TBRAN FALGN8 
; e2!=e1 need to scale down smallest 
    CALL DRAT 
    CALL GREAT 
    _QBRAN FALGN7 ; e2<e1 
; e2>e1 scaledown m1 
    CALL DSWAP 
    CALL DRFROM 
    CALL SCALEDOWN
    CALL SWAPP 
    CALL DTOR 
    JRA FALGN71  
FALGN7: ; e2<e1 scaledown m2 
    CALL DRFROM 
    CALL SWAPP 
    CALL SCALEDOWN 
    CALL SWAPP 
    CALL DTOR 
; after scaledown if e2!=e1 
; this imply that one of mantissa 
; as been nullified by scalling 
; hence keep largest exponent 
FALGN71:
    CALL DRAT 
    CALL EQUAL
    _TBRAN FALGN8 
    CALL DRFROM 
    CALL DDUP 
    CALL GREAT 
    _TBRAN FALGN72
    CALL SWAPP     
FALGN72:
    CALL DTOR  ; now smallest e is at rtop.
FALGN8:
    CALL DRFROM 
    _DROP 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   F+ ( f#1 f#2 -- f#1+f#2 )
;   float addition 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FPLUS,2,"F+"
    CALL FALIGN 
    CALL TOR 
    CALL DPLUS
    CALL DSIGN 
    CALL TOR 
    CALL DABS 
    CALL SCALETOM
    CALL RFROM 
    _QBRAN FPLUS1 
    CALL DNEGA  
FPLUS1: 
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
;    _HEADER SCALETOM,7,"SCALE>M"
SCALETOM: 
    CALL ZERO 
    CALL NROT 
SCAL1:
    CALL DUPP 
    _DOLIT 0X7F 
    CALL UGREAT 
    _QBRAN SCAL2  
    CALL UMOD10 
    _DROP 
    CALL ROT 
    CALL ONEP 
    CALL NROT  
    JRA SCAL1 
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
;    _HEADER MMSTAR,3,"MM*"
MMSTAR:
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
    JRA MMSTA5 
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

; unsigned mutliply by 10 
;  ( ud -- ud ) 
UMUL10:
    LDW Y,X 
    LDW Y,(2,Y)
    PUSHW Y 
    LDW Y,X 
    LDW Y,(Y)
    PUSHW Y 
    SUBW X,#CELLL 
    CLR (X)
    LD A,#3 
    LD (1,X),A 
    CALL DLSHIFT 
    SUBW X,#2*CELLL 
    LDW Y,(3,SP)
    RCF 
    RLCW Y 
    LDW (2,X),Y 
    POPW Y 
    RLCW Y 
    LDW (X),Y 
    CALL DPLUS
    ADDW SP,#CELLL  
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  F/ ( f#1 f#2 -- f#3 )
;  float division
;  f#3 = f#1/f#2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FSLASH,2,"F/"
    CALL ATEXP  ; f#1 m2 e2 
    CALL TOR    ; f#1 m2   R: e2 
; m2 sign 
    CLRW  Y
    LD A,(X)
    JRPL 1$  
    CPLW Y  
1$: PUSHW Y     ; f#1 m2 R: e2 m2s  
    CALL DABS   ; F#1 um2 
    CALL DSWAP  ; m2 f#1 
    CALL ATEXP  ; m2 m1 e1 
; substract expoenents e1-e2 
    LDW Y,X 
    LDW Y,(Y)
    ADDW X,#CELLL 
    SUBW Y,(3,SP)
    LDW (3,SP),Y     
;    CALL ONE    ; e2 slot on rstack  
;    CALL NRAT   ; m2 m1 e1 e2 
;    CALL SUBB   ; m2 m1 e 
;    CALL ONE    ; e slot on rstack 
;    CALL NRSTO  ; m2 m1 R: e m2s 
; m1 sign xor m2 sign 
    CLR A
    LDW Y,X 
    LDW Y,(Y)
    JRPL 2$
    CPL A  
2$: XOR A,(1,SP)
    LD YTEMP,A 
    LD YTEMP+1,A 
; swap e qs on rstack 
    LDW Y,(3,SP) ; e 
    ldw (1,SP),Y 
    LDW Y,YTEMP 
    LDW (3,SP),Y ; m2 m1 R: qs e 
    CALL DABS   ; um2 um1 R: qs e  
    CALL DSWAP  ; m1 m2 R: qs e
    CALL DDUP  ; m1 m2 m2 R: qs e
    CALL DTOR  ; m1 m2 R: qs e m2 ( keep divisor needed later ) 
    CALL UDSLMOD ; remainder m1/m2 R: e m2 
FSLASH1: ; fraction loop 
; check for null remainder 
    LD A,(4,X)
    OR A,(5,X)
    OR A,(6,X)
    OR A,(7,X)
    JREQ FSLASH8 
; get fractional digits from remainder until mantissa saturate
; remainder mantissa R: e divisor 
; check for mantissa saturation 
    CALL DDUP 
; _DOLIT #0xccccc 
    SUBW X,#2*CELLL 
    LDW Y,#0XCCCC 
    LDW (2,X),Y 
    LDW Y,#0XC 
    LDW (X),Y 
    CALL DGREAT 
    _TBRAN FSLASH8 ; another loop would result in mantissa overflow 
; multiply mantissa by 10 
;    SUBW X,#2*CELLL 
;    LDW Y,#10 
;    LDW (2,X),Y 
;    CLRW Y 
;    LDW (X),Y 
;    CALL DSTAR
    CALL UMUL10 
; mutliply remainder by 10     
    CALL DSWAP 
;    SUBW X,#2*CELLL 
;    LDW Y,#10 
;    LDW (2,X),Y 
;    CLRW Y 
;    LDW (X),Y
;    CALL DSTAR 
    CALL UMUL10 
; divide remainder by m2     
    CALL DRAT  ; mantissa remainder divisor R: e divisor 
    CALL UDSLMOD ; mantissa dr dq R: qs e divisor 
    CALL DSWAP ; mantissa frac_digit remainder R: qs e divisor  
    CALL DTOR  ; mantissa frac_digit R: qs e divisor remainder 
    CALL DPLUS ; mantissa+frac_digit 
    CALL DRFROM ; mantissa remainder R: qs e divisor  
    CALL DSWAP  ; remainder mantissa  
; increment e 
    LDW Y,(5,SP) ; e 
    DECW Y 
    LDW (5,SP),Y 
    JRA FSLASH1
FSLASH8: ; remainder mantissa R: qs e divisor 
    CALL DSWAP  
    _DDROP  ; drop remainder     
    ADDW SP,#2*CELLL ; drop divisor on rstack     
    LDW Y,(3,SP)    ; quotient sign 
    JRPL FSLASH9 
    CALL DNEGA  
FSLASH9:
    CALL RFROM  ; exponent 
    CALL STEXP 
    ADDW SP,#CELLL ; drop qs on rstack 
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
    JRA FTOD2  
FTOD1:
    CALL DDUP 
    CALL DZEQUAL 
    _TBRAN FTOD3 
    _DOLIT 10 
    CALL DSLMOD 
    CALL ROT 
    _DROP
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
    _DROP 
    CALL SWAPP 
    _DROP 
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
    _DROP 
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
