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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  routines to write to FLASH, EEPROM 
;  and OPTION 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;pointer to far address 
    farptr=2
    ptr16=3
    ptr8=4

;--------------------------------
; initialize farptr 
; FP!  ( ud -- )
;---------------------------------
    .word LINK 
    LINK=.
    .byte 3 
    .ascii "FP!"
fptr_store:
    ldw y,x
    ldw y,(y)
    ld a,yl 
    ld farptr,a 
    addw x,#CELLL 
    ldw y,x 
    ldw y,(y)
    ldw ptr16,y
    addw x,#CELLL 
    ret 

;-----------------------------------
; return EEPROM base address 
; as a double 
;  EEPROM  ( -- ud )
;-----------------------------------
    .word LINK 
LINK=.
    .byte 6 
    .ascii "EEPROM"
eeprom: 
    ldw y,#EEPROM_BASE
    subw x,#2*CELLL 
    ldw (2,x),y 
    clrw y 
    ldw (x),y 
    ret

;----------------------------------
; fetch address over 65535
;  F@   ( ud -- n )
;----------------------------------
    .word LINK 
LINK=.
    .byte 2
    .ascii "F@"
farat:
    call fptr_store
    ldf a,[farptr]
    subw x,#CELLL 
    ld (x),a 
    ldw y,#1
    ldf a,([farptr],y)
    ld (1,x),a
    ret 

;-------------------------------------
; fetch C at address over 65535 
; FC@ ( ud -- c)
;-------------------------------------
    .word LINK
    LINK=.
    .byte 3 
    .ascii "FC@" 
farcat:
    call fptr_store 
    ldf a,[farptr]
    subw x,#CELLL 
    ld (1,x),a 
    clr (x)
    ret 
    
;----------------------------------
; unlock EEPROM/OPT for writing/erasing
; wait endlessly for FLASH_IAPSR_DUL bit.
;  UNLKEE   ( -- )
;----------------------------------
    .word LINK 
LINK=.
    .byte 6 
    .ascii "UNLKEE"
unlock_eeprom:
	mov FLASH_CR2,#0 
	mov FLASH_NCR2,#0xFF 
	mov FLASH_DUKR,#FLASH_DUKR_KEY1
    mov FLASH_DUKR,#FLASH_DUKR_KEY2
	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
	ret

;----------------------------------
; unlock FLASH for writing/erasing
; wait endlessly for FLASH_IAPSR_PUL bit.
; UNLKFL  ( -- )
;----------------------------------
    .word LINK 
LINK=. 
    .byte 6 
    .ascii "UNLKFL"    
unlock_flash:
	mov FLASH_CR2,#0 
	mov FLASH_NCR2,#0xFF 
	mov FLASH_PUKR,#FLASH_PUKR_KEY1
	mov FLASH_PUKR,#FLASH_PUKR_KEY2
	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
	ret

;---------------------------------------
; write a byte to FLASH or EEPROM/OPTION  
; EE-C!  (c ud -- )
;---------------------------------------
    .word LINK 
LINK=.
    .byte 5 
    .ascii "EE-C!"
	; local variables 
	BTW = 1   ; byte to write offset on stack
	OPT = 2   ; OPTION flag offset on stack
    VSIZE = 2
write_byte:
	sub sp,#VSIZE
    call fptr_store
    ld a,(1,x)
	ld (BTW,sp),a ; byte to write 
	clr (OPT,sp)  ; OPTION flag
    addw x,#CELLL 
; put addr[15:0] in Y, for bounds check.
	ldw y,ptr16   ; Y=addr15:0
; check addr[23:16], if <> 0 then it is extened flash memory
	tnz farptr 
	jrne write_flash
    cpw y,#user_space
    jruge write_flash
	cpw y,#EEPROM_BASE  
    jrult write_exit
	cpw y,#OPTION_END 
	jrugt write_exit
	jra write_eeprom 
; write program memory
write_flash:
	call unlock_flash 
1$:	sim 
	ld a,(BTW,sp)
	ldf [farptr],a ; farptr[x]=A
	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
    rim 
    bres FLASH_IAPSR,#FLASH_IAPSR_PUL
    jra write_exit
; write eeprom and option
write_eeprom:
	call unlock_eeprom
	; check for data eeprom or option eeprom
	cpw y,#OPTION_BASE
	jrmi 1$
	cpw y,#OPTION_END+1
	jrpl 1$
	cpl (OPT,sp)
1$: 
    tnz (OPT,sp)
    jreq 2$
	; pour modifier une option il faut modifier ces 2 bits
    bset FLASH_CR2,#FLASH_CR2_OPT
    bres FLASH_NCR2,#FLASH_CR2_OPT 
2$: 
    ld a,(BTW,sp)
    ldf [farptr],a
    tnz (OPT,sp)
    jreq 3$
    inc ptr8 
    jrne 21$
    inc ptr16      
21$:
    ld a,(BTW,sp)
    cpl a
    ldf [farptr],a
3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
write_exit:
	addw sp,#VSIZE 
    ret

.if 0
;----------------------------
; erase block code must be 
; executed from RAM
; input:
;-----------------------------
row_erase:
	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
	clr a 
	clrw y 
	ldf ([farptr],y),a
    incw y
	ldf ([farptr],y),a
    incw y
	ldf ([farptr],y),a
    incw y
	ldf ([farptr],y),a
	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
	ret
row_erase_end:

; copy erase_start in RAM 
move_erase_to_ram:
	ldw x,#row_erase_end 
	subw x,#row_erase
	ldw acc16,x 
	ldw x,#tib 
	ldw y,#row_erase 
	call move 
	ret 

;-----------------------------------
; block programming must be 
; executed from RAM 
; initial contidions: 
; 	memory unlocked
;   bit PRG set in 
; input:
;   x        128 bytes row to program 
;   farptr   row address 
; output:
;   none 
;----------------------------------
	BCNT=1 
program_row:
	push #BLOCK_SIZE  
;enable block programming 
	bset FLASH_CR2,#FLASH_CR2_PRG 
	bres FLASH_NCR2,#FLASH_CR2_PRG
	clrw y 
1$:	ld a,(x)
	ldf ([farptr],y),a
	incw x 
	incw y 
	dec (BCNT,sp)
	jrne 1$
; wait EOP bit 
	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
	_drop 1 
	ret 
program_row_end:

;-------------------------
; move program_row to RAM 
; at txtubound address 
;------------------------
move_prg_to_ram:
	ldw x,#program_row_end 
	subw x,#program_row 
	ldw acc16,x 
	ldw x,#tib 
	ldw y,#program_row 
	call move 
	ret 


;-----------------------------
; write a row in FLASH/EEPROM 
; input:
;    farptr   destination address 
;    x        source address 
;-----------------------------
write_row:
	pushw x 
	tnz farptr 
	jrne to_flash 
	ldw x,#FLASH_BASE 
	cpw x,farptr+1 
	jruge to_flash 
to_eeprom:
	ldw x,#EEPROM_BASE 
	cpw x,farptr+1 
	jruge 1$
	ret ; bad address 
1$: ldw x,#EEPROM_END 
	jrule 2$ 
	ret ; bad address 
2$:	call unlock_eeprom
	jra do_programming
to_flash:
	call unlock_flash 
do_programming:
	popw x 
	call tib
	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
	ret 


;-----------------------------------
; erase flash or EEPROM block
; a blow is 128 bytes 
; input:
;   farptr  address row begin
; output:
;   none
;--------------------------------------
block_erase:
	ldw x,farptr+1
	cpw x,#user_space 
	jrpl erase_flash 
; erase eeprom block
	cpw x,#EEPROM_BASE 
	jruge 1$
	ret ; bad address 
1$: ldw x,#EEPROM_END 
	jrule 2$ 
	ret ; bad address 
2$:	call unlock_eeprom 
	call tib 
	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
	ret 
; erase flash block:
erase_flash:
	call unlock_flash 
	call tib 
    bres FLASH_IAPSR,#FLASH_IAPSR_PUL
	ret 


;--------------------------------------------
; write a data block to eeprom or flash 
; input:
;   Y        source address   
;   X        array index  destination  farptr[x]
;   BSIZE    block size bytes 
;   farptr   write address , byte* 
; output:
;	X 		after last byte written 
;   Y 		after last byte read 
;  farptr   point after block
;---------------------------------------------
	_argofs 2 
	_arg BSIZE 1  ; block size
	; local var 
	XSAVE=1 
	VSIZE=2 
write_block:
	_vars VSIZE
	ldw (XSAVE,sp),x 
	ldw x,(BSIZE,sp) 
	jreq 9$
1$:	ldw x,(XSAVE,sp)
	ld a,(y)
	call write_byte 
	incw x 
	incw y 
	ldw (XSAVE,sp),x
	ldw x,(BSIZE,sp)
	decw x
	ldw (BSIZE,sp),x 
	jrne 1$
9$:
	ldw x,(XSAVE,sp)
	call incr_farptr
	_drop VSIZE
	ret 
.endif 

user_space: 
