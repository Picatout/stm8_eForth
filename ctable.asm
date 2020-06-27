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

;------------------------------
; words to create and read 
; constants tables in FLASH 
; and EEPROM
;------------------------------


;------------------------------
; create constants bytes table 
; in persistant memory
;  CT: ( --  ; <string> )
;-----------------------------
    .word LINK 
    LINK=.
    .byte 3
    .ascii "CT:"
CTABLE:

    ret 

;-------------------------------
; terminate CTABLE compilation
; CT; ( -- )
;-------------------------------
    .word LINK
    LINK=.
    .byte 3 
    .ascii "CT;" 
CTSEMI:

    ret 

;--------------------------------
; create constants words table 
; in persistant memory 
; WT: ( -- ; <string> )
;--------------------------------
    .word LINK 
    LINK=.
    .byte 3
    .ascii "WT:"
WTABLE:

    ret 

;-------------------------------
; terminate WTABLE compilation
; WT; ( -- )
;-------------------------------
    .word LINK
    LINK=.
    .byte 3 
    .ascii "WT;" 
WTSEMI:

    ret 


;----------------------------------
; table runtime
; stack table base address 
; DOTABLE ( -- a|ud )
;----------------------------------
    .word LINK 
    LINK=.
    .byte 7
    .ascii "DOTABLE"
DOTABLE:
    popw y 
    ldw YTEMP,y 
.if NUCLEO
    subw x,#2*CELLL 
    ldw y,(y)
    ldw (x),y 
    ldw y,YTEMP 
    ldw y,(2,y)
    ldw (2,x),y
.else ; DISCOVERY 
    subw x,#CELLL 
    ldw y,(y)
    ldw YTEMP,y
    ldw y,(y)
    ldw (x),y
.endif 
    ret ; address stacked by call to EXEC.

;---------------------------------
; stack an element of CTABLE 
; CT@ ( u a|ad -- c )
; u element order {0..size-1}
; a|ad table address 
;--------------------------------
    .word LINK 
    LINK=.
    .byte 3
    .ascii "CT@" 
CTAT:
    call PSTO 
    ldw y,x 
    ldw y,(y)
    addw y,PTR16
    ldw PTR16,y 
    clrw y
.if NUCLEO ; 24 bits address
    jrnc 1$
    inc FPTR 
1$:
    ldf a,[FPTR]
.else ; DISCOVERY 16 bits address     
    ld a,[PTR16]
.endif 
    ld yl,a 
    ldw (x),y 
    ret 

;---------------------------------
; stack an element of WTABLE 
; WT@ ( u a|ud -- w )
; u is element order {0..size-1}
; a|ud table address 
;----------------------------------
    .word LINK 
    LINK=.
    .byte 3
    .ascii "WT@" 
WTAT:
    call PSTO 
    ldw y,x 
    ldw y,(y)
    addw y,PTR16
    ldw PTR16,y 
.if NUCLEO ; 24 bits address
    jrnc 1$
    inc FPTR 
1$:
    ldf a,[FPTR]
    ld yh,a 
    call INC_FPTR 
    ldf a,[FPTR]
    ld yl,a 
.else ; DISCOVERY 16 bits address     
    ld a,[PTR16]
    ld yh,a 
    call inc_ptr 
    ld a,[PTR16]
    ld yl,a 
.endif 
    ldw (x),y 
    ret 

;--------------------------
; fill character table 
; CTFILL ( ud -- )
;--------------------------
    .word LINK 
    LINK=.
    .byte 6 
    .ascii "CTFILL"
CTFILL:
    CALL PSTO
    CALL UNLOCK
    CALL ZERO 
1$: CALL ONEP 
    CALL DUPP 
    CALL INTQ 
    CALL QBRAN 
    .word 2$
    call WR_BYTE 
    CALL BRAN 
    .word 1$ 
2$: CALL DROP 
    CALL LOCK 
    ret 

;--------------------------
; fill word table 
; WTFILL ( ud -- )
;--------------------------
    .word LINK 
    LINK=.
    .byte 6 
    .ascii "WTFILL"
WTFILL:
    CALL PSTO
    CALL UNLOCK
    CALL ZERO 
1$: CALL ONEP 
    CALL DUPP
    CALL INTQ
    CALL QBRAN 
    .word 2$
    call WR_WORD 
    CALL BRAN 
    .word 1$ 
2$: CALL DROP 
    CALL LOCK 
    ret 

;------------------------
; Prompted input for integer 
; [n]? ( -- a )
;------------------------
    .word LINK 
    LINK=.
    .byte 4
    .ascii "[n]?" 
INTQ:
    CALL CR 
    call DOLIT 
    .word '[
    CALL EMIT 
    CALL DOT 
    CALL  DOTQP
    .byte 3
    .ascii "]? " 
    CALL QUERY 
    call TOKEN 
    jp NUMBQ

