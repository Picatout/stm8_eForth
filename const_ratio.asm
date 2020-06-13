;;
; Copyright Jacques Deschênes 2019,2020 
; This file is part of stm8_eForth  
;
;     stm8_eForth is free software: you can redistribute it and/or modify
;     it under the terms of the GNU General Public License as published by
;     the Free Software Foundation, either version 3 of the License, or
;     (at your option) any later version.
;
;     stm8_eForth is distributed in the hope that it will be useful,
;     but WITHOUT ANY WARRANTY; without even the implied warranty of
;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;     GNU General Public License for more details.
;
;     You should have received a copy of the GNU General Public License
;     along with stm8_eForth.  If not, see <http://www.gnu.org/licenses/>.
;;

;--------------------------------------------------------------------
; Irrationals constants 
; expressed as 2 integers ratio
; aproximation. These are to be used with scaling operators */ and */MOD 
; REF: https://www.forth.com/starting-forth/5-fixed-point-arithmetic/
;---------------------------------------------------------------------

;       PI ( --  355 113 )
; precision 8.5e-8 
; usage example to compute circle area
; : CAREA DUP * PI */ ;
; 
        .word LINK 
        LINK=.
        .byte 2
        .ascii "PI" 
PII:
        subw x,#2*CELLL 
        ldw y,#355 
        ldw (2,x),y 
        ldw y,#113 
        ldw (x),y 
        ret 

;      SQRT2 ( -- 19601  13860 )
; precision: 1.5e-9 
; usage example to compute Voltage peek to peek from Vrms 
; : VPP SQRT2 */ 2 * ;
;
        .word LINK 
        LINK=.
        .byte 5 
        .ascii "SQRT2" 
SQRT2:
        subw x,#2*CELLL 
        ldw y,#19601 
        ldw (2,x),y 
        ldw y,#13860 
        ldw (x),y 
        ret 

;   SQRT3 ( -- 18817 10864 )
; precision: 1.1e-9
;
        .word LINK 
        LINK=.
        .byte 5
        .ascii "SQRT3" 
SQRT3: 
    subw x,#2*CELLL 
    ldw y,#18817 
    ldw (2,x),y 
    ldw y,#10864 
    ldw (x),y 
    ret 

;   E ( -- 28667 10546 )
; precision: 5.5e-9 
; natural log base 
        .word LINK 
        LINK=.
        .byte 1
        .ascii "E" 
ENEPER:
    subw x,#2*CELLL 
    ldw y,#28667 
    ldw (2,x),y 
    ldw y,#10546 
    ldw (x),y 
    ret 

;   SQRT10 ( -- 22936 7253 )
; precision: 5.7e-9 
        .word LINK 
        LINK=.
        .byte 6 
        .ascii "SQRT10" 
SQRT10:
    subw x,#2*CELLL
    ldw y,#22936 
    ldw (2,x),y 
    ldw y,#7253
    ldw (x),y 
    ret 

;   SQRT12 ( -- 26797 25293 )
; precision: 1.0e-9 
; used in music to compute well tempered scale
        .word LINK 
        LINK=. 
        .byte 6 
        .ascii "SQRT12"
SQRT12:
    subw x,#2*CELLL 
    ldw y,#26797
    ldw (2,x),y 
    ldw y,#25293
    ldw (x),y 
    ret 

;   LOG2 ( -- 2040 11103 )
; precision: 1.1e-8
        .word LINK 
        LINK=.
        .byte 4 
        .ascii "LOG2" 
LOG2:
    subw x,#2*CELLL
    ldw y,#2040 
    ldw (2,x),y 
    ldw y,#11103 
    ldw (x),y 
    ret 

;   LN2 ( -- 485 11464 )
; precision: 1.0e-7 
        .word LINK 
        LINK=.
        .byte 3 
        .ascii "LN2" 
LN2: 
    subw x,#2*CELLL
    ldw y,#485
    ldw (2,x),y 
    ldw y,#11464 
    ldw (x),y 
    ret 


