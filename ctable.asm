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


;------------------------------
; words to create and read 
; constants tables in FLASH 
; and EEPROM
;------------------------------

;-----------------------------
; allocate space in CODE area 
; for constant table.
; CALLOT ( u -- ad )
; u  bytes to allocates 
; ad data address as double.
;-----------------------------
    .word LINK 
    LINK=.
    .byte 6
    .ascii "CALLOT"
CALLOT:
    CALL CPP
    CALL DUPP 
    CALL AT 
    CALL TOR 
    CALL PSTOR 
    CALL UPDATCP 
    CALL RFROM
    JP ZERO 

;------------------------------
; create constants bytes table 
; in persistant memory
;  CTABLE ( n+ -- ad ; <string> )
; n+ bytes reserved 
;-----------------------------
    .word LINK 
    LINK=.
    .byte 6
    .ascii "CTABLE"
CTABLE:
    CALL CALLOT     
    JP DCONST 
     

;--------------------------------
; create constants words table 
; in persistant memory 
; WTABLE ( n+ -- ad ; <string> )
; n+  words reserved  
;--------------------------------
    .word LINK 
    LINK=.
    .byte 6
    .ascii "WTABLE"
WTABLE:
    CALL CELLS  
    CALL CALLOT 
    JP DCONST 

;---------------------------------
; stack an element of CTABLE 
; CTABL@ ( u ad -- c )
; u element order {0..size-1}
; a|ad table address 
;--------------------------------
    .word LINK 
    LINK=.
    .byte 6
    .ascii "CTABL@" 
CTAT:
    call FPSTOR 
    call PTRPLUS 
    jp EE_CREAD 

;---------------------------------
; stack an element of WTABLE 
; WTABL@ ( u ud -- w )
; u is element order {0..size-1}
; a|ud table address 
;----------------------------------
    .word LINK 
    LINK=.
    .byte 6
    .ascii "WTABL@" 
WTAT:
    call FPSTOR 
    call CELLS 
    call PTRPLUS 
    call EE_READ 
    ret 

;--------------------------
; tool to initialize character table 
; CTINIT ( ad -- )
; ad is table address 
;--------------------------
    .word LINK 
    LINK=.
    .byte 6 
    .ascii "CTINIT"
CTINIT:
    CALL FPSTOR
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
2$: CALL DDROP 
    CALL LOCK 
    ret 

;--------------------------
; tool to initialize word table 
; WTINIT ( ad -- )
; ad is table address 
;--------------------------
    .word LINK 
    LINK=.
    .byte 6 
    .ascii "WTINIT"
WTINIT:
    CALL FPSTOR
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
2$: CALL DDROP 
    CALL LOCK 
    ret 

;------------------------
; Prompted input for integer 
; display n+ in bracket and
; '?' 
; [N]? ( n+ -- a )
;------------------------
    .word LINK 
    LINK=.
    .byte 4
    .ascii "[N]?" 
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

