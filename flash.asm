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


;--------------------------------
; initialize FPTR 
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
    ld FPTR,a 
    addw x,#CELLL 
    ldw y,x 
    ldw y,(y)
    ldw PTR16,y
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
; fetch integer at address over 65535
;  F@   ( ud -- n )
;----------------------------------
    .word LINK 
LINK=.
    .byte 2
    .ascii "F@"
farat:
    call fptr_store
    ldf a,[FPTR]
    subw x,#CELLL 
    ld (x),a 
    ldw y,#1
    ldf a,([FPTR],y)
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
    ldf a,[FPTR]
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

;-----------------------------
; unlock FLASH or EEPROM 
; according to FPTR address 
;  UNLOCK ( -- )
;-----------------------------
	.word LINK 
	LINK=.
	.byte 6
	.ascii "UNLOCK"
unlock:
; put addr[15:0] in Y, for bounds check.
	ldw y,PTR16   ; Y=addr15:0
; check addr[23:16], if <> 0 then it is extened flash memory
	tnz FPTR 
	jrne 4$
    cpw y,#FLASH_BASE
    jruge 4$
	cpw y,#EEPROM_BASE  
    jrult 9$
	cpw y,#OPTION_END 
	jrugt 9$
	call unlock_eeprom
	ret 
4$: call unlock_flash
9$: ret 

;-------------------------
; lock write access to 
; FLASH and EEPROM 
; LOCK ( -- )
;-------------------------
	.word LINK 
	LINK=.
	.byte 4 
	.ascii "LOCK" 
lock: 
	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
	ret 

;-------------------------
; increment FPTR 
; INC-FPTR ( -- )
;-------------------------
	.word LINK 
	LINK=. 
	.byte 8 
	.ascii "INC-FPTR" 
inc_fptr:
	inc PTR8 
	jrne 1$
	ldw y,FPTR 
	incw y 
	ldw FPTR,y 
1$: ret 


;----------------------------
; write a byte at address pointed 
; by FPTR and increment FPTR.
; Expect pointer already initialized 
; and memory unlocked 
; WR-BYTE ( c -- )
;----------------------------

	.word LINK 
	LINK=. 
	.byte 7 
	.ascii "WR-BYTE" 

write_byte:
	ldw y,x 
	ldw y,(y)
	addw x,#CELLL 
	ld a,yl
	ldf [FPTR],a
	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
	jra inc_fptr 



;---------------------------------------
; write a byte to FLASH or EEPROM/OPTION  
; EEC!  (c ud -- )
;---------------------------------------
    .word LINK 
	LINK=.
    .byte 4 
    .ascii "EEC!"
	; local variables 
	BTW = 1   ; byte to write offset on stack
    OPT = 2 
	VSIZE = 2
ee_cstore:
	sub sp,#VSIZE
    call fptr_store
	ld a,(1,x)
	cpl a 
	ld (BTW,sp),a ; byte to write 
	clr (OPT,sp)  ; OPTION flag
	call unlock 
	; check if option
	tnz FPTR 
	jrne 2$
	ldw y,PTR16 
	cpw y,#OPTION_BASE
	jrmi 2$
	cpw y,#OPTION_END+1
	jrpl 2$
	cpl (OPT,sp)
	; OPTION WRITE require this unlock 
    bset FLASH_CR2,#FLASH_CR2_OPT
    bres FLASH_NCR2,#FLASH_CR2_OPT 
2$: 
	call write_byte 	
	tnz (OPT,sp)
	jreq 3$ 
    ld a,(BTW,sp)
    clrw y
	ld yl,a 
	subw x,#CELLL 
	ldw (x),y 
	call write_byte
3$: 
	call lock 
	addw sp,#VSIZE 
    ret

;------------------------------
; write integer in FLASH|EEPROM
; EE! ( n ud -- )
;------------------------------
	.word LINK 
	LINK=.
	.byte 3 
	.ascii "EE!"
ee_store:
	call fptr_store 
	call unlock 
	ldw y,x 
	ldw y,(y)
	pushw y 
	swapw y 
	ldw (x),y 
	call write_byte 
	popw y 
	subw x,#CELLL
	ldw (x),y 
	call write_byte
	jp lock 


;----------------------------
; Erase flash memory row 
; stm8s208 as 128 bytes rows
; ROW-ERASE ( ud -- )
;----------------------------
	.word LINK 
	LINK=. 
	.byte 9 
	.ascii "ROW-ERASE" 
row_erase:
	call fptr_store
;code must be execute from RAM 
;copy routine to PAD 
	subw x,#CELLL 
	ldw y,#row_erase_proc
	ldw (x),y 
	call PAD 
	ldw y,#row_erase_proc_end 
	subw y,#row_erase_proc
	subw x,#CELLL 
	ldw (x),y 
	call CMOVE 
block_erase:
	ldw y,FPTR+1
	cpw y,#app_space 
	jrpl erase_flash 
; erase eeprom block
	cpw y,#EEPROM_BASE 
	jruge 1$
	ret ; bad address 
1$: cpw y,#EEPROM_END 
	jrule 2$ 
	ret ; bad address 
2$:	
	call unlock_eeprom 
	jra proceed_erase
; erase flash block:
erase_flash:
	call unlock_flash 
proceed_erase:
	call PAD 
	ldw y,x
	ldw y,(y)
	addw x,#CELLL  
	call (y) 
	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
	ret 

; this routine is to be copied to PAD 
row_erase_proc:
	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
	clr a 
	clrw y 
	ldf ([FPTR],y),a
    incw y
	ldf ([FPTR],y),a
    incw y
	ldf ([FPTR],y),a
    incw y
	ldf ([FPTR],y),a
	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
	ret
row_erase_proc_end:


;-----------------------------------
; block programming must be 
; executed from RAM 
; initial contidions: 
; 		memory unlocked
;       FPTR initialized 
; input: 
;    x   buffer address 
;-----------------------------------
	BCNT=1 
copy_buffer:
	push #BLOCK_SIZE  
;enable block programming 
	bset FLASH_CR2,#FLASH_CR2_PRG 
	bres FLASH_NCR2,#FLASH_CR2_PRG
	clrw y
1$:	ld a,(x)
	ldf ([FPTR],y),a
	incw x 
	incw y 
	dec (BCNT,sp)
	jrne 1$
; wait EOP bit 
	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
	pop a ; remove BCNT from stack 
	ret 
copy_buffer_end:

;-------------------------
; move program_row to RAM 
; in TIB 
;------------------------
copy_prog_to_ram:
	subw x,#6
	ldw y,#copy_buffer 
	ldw (4,x),y 
	ldw y,#TIBBASE
	ldw (2,x),y 
	ldw y,#copy_buffer_end 
	subw y,#copy_buffer  
	ldw (x),y 
	call CMOVE 
	ret 


;-----------------------------
; write a row in FLASH/EEPROM 
; WR-ROW ( a ud -- )
; a -> address 128 byte buffer to write 
; ud ->  row address in FLASH|EEPROM 
;-----------------------------
	.word LINK 
	LINK=.
	.byte 6 
	.ascii "WR-ROW"
write_row:
	call fptr_store
; align to FLASH block 
	ld a,#0x80 
	and a,PTR8 
	ld PTR8,a  
	call copy_prog_to_ram
	call unlock
	ldw y,x 
	ldw y,(y)
	addw x,#CELLL 
	pushw x 
	ldw x,y ; buffer address in x 
	call TIBBASE
	call lock
	popw x 
	ret 

;-------------------------------------
; change value of OPTION register 
; SET-OPT (c n -- ) 
; c new value.
; n OPT  number {1..7}
;--------------------------------------
		.word LINK 
		LINK=.
		.byte 7 
		.ascii "SET-OPT" 
set_option: 
		ldw y,x 
		ldw y,(y)
		jreq 1$
		cpw y,#7 
		jrule 2$ 
; invalid OPTION number 		
1$:		addw x,#2*CELLL
		ret
2$:		sllw y 
		addw y,#OPTION_BASE-1
		ldw (x),y 
		subw x,#CELLL 
		clrw y 
		ldw (x),y 
		call ee_cstore
		ret 



;--------------------------------------
; reset system to its original state 
; before any user modification
; PRISTINE ( -- )
;-------------------------------------
	.word LINK  
	LINK=.
	.byte 8 
	.ascii "PRISTINE"
pristine:
;;; erase EEPROM
	call eeprom 
1$:	call DDUP 
	call row_erase
	ldw y,x 
	ldw y,(2,y)
	addw y,#BLOCK_SIZE
	ldw (2,x),y
	cpw y,#OPTION_BASE 
	jrult 1$
;;; reset OPTION to default values
	ldw y,#1 ; OPT1 
2$:	ldw (x),y   
	clrw y 
	ldw (2,x),y  ; ( 0 1 -- ) 
	call DDUP    ; ( 0 1 0 1 -- )  
	call set_option
	ldw y,x 
	ldw y,(y)
	incw y  ; next OPTION 
	cpw y,#8 
	jrult 2$
;;; erase first row of app_space 	
	ldw y,#app_space
	ldw (2,x),y  
	clrw y 
	ldw (x),y ; ( app_space 0 -- )
	call row_erase 
; reset interrupt vectors 
	subw x,#CELLL 
	clrw y  
4$:	ldw (x),y  ; ( n -- ) int# 
	call DUPP  
	call reset_vector
	ldw y,x 
	ldw y,(y)
	incw y   ; next vector 
	cpw y,#25 
	jrult 4$
	jp NonHandledInterrupt ; reset MCU

;------------------------------
; reset an interrupt vector 
; to its initial value 
; i.e. NonHandledInterrupt
; RST-IVEC ( n -- )
;-----------------------------
	.word LINK 
	LINK=. 
	.byte 8 
	.ascii "RST-IVEC"
reset_vector:
	ldw y,x
	addw x,#CELLL 
	ldw y,(y)
	cpw y,#23 
	jreq 9$
	cpw y,#24 ; last vector for stm8s208 
	jrugt 9$  
	sllw y 
	sllw y 
	addw y,#0x8008 ; irq0 address 
	ldw YTEMP,y
	subw x,#3*CELLL 
	ldw (2,x),y 
	clrw y
	ldw (x),y 
	ld a,#0x82 
	ld yh,a
	ldw (4,x),y
	call ee_store
	subw x,#3*CELLL
	clrw y 
	ldw (x),y 
	ldw y,#NonHandledInterrupt
	ldw (4,x),y 
	ldw y,YTEMP  
	addw y,#2
	ldw (2,x),y 
	call ee_store
9$:	ret 


	
;------------------------------
; set interrupt vector 
; SET-IVEC ( ud n -- )
;  ud Handler address
;  n  vector # 0 .. 29 
;-----------------------------
	.word LINK
	LINK=.
	.byte 8 
	.ascii "SET-IVEC" 
set_vector:
    ldw y,x 
	addw x,#CELLL 
	ldw y,(y) ; vector #
	cpw y,#24 ; last vector for stm8s208  
	jrule 2$
	addw x,#2*CELLL 
	ret
2$:	sllw y 
	sllw y 
	addw y,#0X8008 ; IRQ0 vector address 
	ldw YTEMP,y ; vector address 
	ld a,#0x82 
	ld yh,a 
	ld a,(1,x) ; isr address bits 23..16 
	ld yl,a 
;  write 0x82 + most significant byte of int address	
	subw x,#3*CELLL 
	ldw (4,x),y 
	ldw y,YTEMP
	ldw (2,x),y ; vector address 
	clrw y 
	ldw (x),y   ; as a double 
	call ee_store 
	ldw y,x 
	ldw y,(2,y) ; bits 15..0 int vector 
	subw x,#3*CELLL 
	ldw (4,x),y 
	ldw y,YTEMP 
	addw y,#2 
	ldw (2,x),y 
	clrw y 
	ldw (x),y 
	call ee_store 
9$: ret 


;------------------------
; Compile word to flash
; EE, (w -- )
;-----------------------
	.word LINK
	LINK=.
	.byte 3
	.ascii "EE,"
ee_comma:
	subw x,#2*CELLL 
	ldw y,UFCP
	pushw y 
	ldw (2,x),y 
	clrw y 
	ldw (x),y
	call ee_store
	popw y 
	addw y,#2
	ldw UFCP,y
	ret 

;-------------------------
; Compile byte to flash 
; EEC, ( c -- )	
;-------------------------
	.word LINK 
	LINK=.
	.byte 4 
	.ascii "EEC,"
ee_ccomma:
	subw x,#2*CELLL 
	ldw y,UFCP
	pushw y 
	ldw (2,x),y 
	clrw y 
	ldw (x),y
	call ee_cstore
	popw y 
	incw y 
	ldw UFCP,y
	ret 


;--------------------------
; copy FLASH block to ROWBUF
; ROW2BUF ( ud -- )
;--------------------------
	.word LINK 
	LINK=.
	.byte 7 
	.ascii "ROW2BUF"
ROW2BUF: 
	call fptr_store 
	ld a,#BLOCK_SIZE
	push a 
	and a,PTR8 ; block align 
	ld PTR8,a
	ldw y,#ROWBUFF 
1$: ldf a,[FPTR]
	ld (y),a
	call inc_fptr
	incw y 
	dec (1,sp)
	jrne 1$ 
	pop a 
	ret 


;--------------------------
; move now colon definition to FLASH 
; preserving bytes already used 
; in the current block. 
; ud+c must not exceed block boundary 
; FMOVE ( a ud c -- )
;	a   RAM buffer address 
;   ud  FLASH address 
;   c   byte count {1..128}
;--------------------------
	.word LINK 
	LINK=.
	.byte 5 
	.ascii "FMOVE" 
FMOVE:
.if 0 ; to be done 
; bound c to 128 bytes 
	subw x,#CELLL 
	ldw y,#BLOCK_SIZE
	ldw (x),y 
	call MIN
	ldw y,x 
	ldw y,(x)
	ldw XTEMP,y ; save c 
	addw x,#CELLL 
; move FLASH block in ROWBUFF 
	call DDUP 
	call BLKCPY
; how many free in this block ?
; use MIN(c,bytes_free)
	ldw y,x 
	ld a,(3,y) ; ud least byte  
	jreq 2$
	cp a,#BLOCK_SIZE
	jreq 2$ 
	add a,#BLOCK_SIZE
	and a,#0x80
	subc a,(3,y) ; bytes free 
	subw x,#2*CELLL 
	clrw y 
	ldw (2,x),y 
	ldw y,XTEMP 
	ldw (x),y
	call MIN 
2$: ; ud is block aligned, all bytes free  
; now copy bytes from a to ROWBUFF+n 
	ldw y,x 
	ldw y,(2,y)
	andw y,#0x7f 
	addw y,#ROWBUFF
	ldw YTEMP,y 
	ldw y,x 
	ldw y,()
.else 
	ret 
.endif 



; application code begin here
	.bndry 128 ; align on flash block  
app_space: 
