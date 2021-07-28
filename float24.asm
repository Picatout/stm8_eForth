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
;  This format is store on the stack as a double, i.e. 32 bits 
;  but as 24 bits in memory. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


    MAX_MANTISSA = 0x7FFF ; absolute value maximum mantissa  

    F24_MAJOR=1 
    F24_MINOR=0 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   FLOAT-VER ( -- )
;   print library version 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FVER,9,"FLOAT-VER"
    CALL CR 
    CALL DOTQP 
    .byte  17 
    .ascii "float24 library, "
    CALL PRT_LICENCE 
    CALL COPYRIGHT 
    _DOLIT F24_MAJOR     
    _DOLIT F24_MINOR 
    JP PRINT_VERSION 


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
;  SET-FPSW ( f24 -- f24 )
;  set float status word 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER SET_FPSW,8,"SET-FPSW"
    CLR UFPSW+1 
    LDW Y,X 
    LDW Y,(2,Y) ; m 
    JRNE 1$
    BSET UFPSW+1,#0  ; null mantissa 
    JRA 4$ 
1$: JRPL 2$    
    BSET UFPSW+1,#1  ; negative mantissa 
2$: LDW Y,X 
    LDW Y,(Y) ; e 
    CPW Y,#-127  
    JRMI 3$
    CPW Y,#128 
    JRMI 4$ 
3$:
    CP A,#255 
    JREQ 3$
    BSET UFPSW+1,#2  ; overflow         
4$: RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    SFZ ( f# -- f# )
;    set FPSW zero flag 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER SFZ,3,"SFZ"
    CALL FER 
    _DOLIT 0xfffe 
    CALL ANDD 
    CALL TOR    
    CALL OVER  
    CALL ZEQUAL 
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
    CALL OVER 
    _DOLIT 15 
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
; ( n a cntr -- n  a+ cntr-  )
parse_digits:
    CALL DUPP 
    _QBRAN parse_d5  
    CALL TOR   ; n a R: cntr 
1$: CALL COUNT ; n a+ char 
    CALL BASE 
    CALL AT 
    CALL DIGTQ 
    _QBRAN parse_d4 ; not a digit
    CALL ROT 
    CALL BASE 
    CALL AT 
    CALL STAR
    CALL PLUS
    CALL SWAPP  
    CALL RFROM  ; n a+ cntr 
    CALL ONEM 
    JRA parse_digits ; n a+ cntr  
parse_d4: ; n a+ char R: cntr 
    LDW Y,X 
    LDW Y,(2,Y)
    DECW Y  ; dec(a)
    LDW (2,X),Y 
    POPW Y 
    LDW (X),Y ; n a cntr  
parse_d5:
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
    CALL NROT ;  0 a cntr  
    CALL nsign 
    CALL TOR   ; R: esign  
    CALL parse_digits
    _QBRAN PARSEXP_SUCCESS ; parsed to end of string 
; failed invalid character
    _DDROP ; 0 a 
1$: 
    CALL RFROM ; sign||cntr  
2$:
    _DDROP  ; a cntr || a sign || 0 cntr   
    CALL ZERO   ; return only 0 
    RET 
PARSEXP_SUCCESS: ; n a  
    _DROP ; n  
    CALL RFROM ; esign  
    _QBRAN 1$
    CALL NEGAT
1$:
    _DOLIT -1 ; -- e -1 
    RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   FLOAT?  ( a n a+ cnt sign  -- f24 -3 | a 0 )
;   called by NUMBER? 
;   convert string to float 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER FLOATQ,5,"FLOAT?"
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
    CALL RFROM  ; a  n a+ cntr R: sign  
    CALL ONEM 
    CALL DUPP 
    CALL TOR  ; R: sign cntr 
; parse fractional part
    CALL parse_digits ; a n a+ cntr -- n a cntr 
    _DOLIT 2 
    CALL  PICK ; n a cnt n  
    CALL ZLESS  
    CALL ABORQ 
    .byte 17 
    .ascii "mantissa overflow"
    CALL DUPP 
    CALL RFROM 
    CALL SWAPP 
    CALL SUBB ; fd -> fraction digits count 
    CALL TOR  ; n a cntr R: sign fd 
    CALL DUPP ; cntr cntr  
    _QBRAN 1$ ; end of string, no exponent
    JRA FLOATQ2
1$: CALL SWAPP 
    _DROP ; a
    JRA FLOATQ3        
FLOATQ1: ; must push fd==0 on RSTACK 
    CALL RFROM ; cntr 
    CALL ZERO  ; fd 
    CALL TOR   ; m a cntr R: sign fd 
FLOATQ2: 
    CALL parse_exponent 
    _QBRAN FLOAT_ERROR0 ; exponent expected 
FLOATQ3: ; m 0 || m e  
    CALL RFROM ;  fd  
    CALL SUBB  ; exp=e-fd 
    CALL DUPP
    CALL ABSS  
    _DOLIT 127
    CALL GREAT 
    CALL ABORQ 
    .byte 17 
    .ascii "exponent overflow" 
    CALL SWAPP  
    CALL RFROM  ; sign 
    _QBRAN FLOATQ4 
    CALL NEGAT 
FLOATQ4:
    CALL ROT  
    _DROP 
    CALL SWAPP ; m e 
    CALL SET_FPSW 
    _DOLIT -3 
    RET       
FLOAT_ERROR0: 
    CALL RFROM ; df 
    CALL RFROM ; df sign 
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
    LDW Y,(2,Y)
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


