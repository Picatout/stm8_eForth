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
; initialize PTR16 
; PTR!  ( a -- )
;---------------------------------
    .word LINK 
    LINK=.
    .byte 4 
    .ascii "PTR!"
PSTO:
    ldw y,x
    ldw y,(y)
    ldw PTR16,y  
    addw x,#CELLL 
    ret 

;-----------------------------------
; return EEPROM base address 
;  EEPROM  ( -- a )
;-----------------------------------
    .word LINK 
LINK=.
    .byte 6 
    .ascii "EEPROM"
EEPROM: 
    ldw y,#EEPROM_BASE
    subw x,#CELLL 
    ldw (x),y 
    ret

;---------------------------------
; return APP_LAST address 
; EEP-LAST ( -- a )
;---------------------------------
	.word LINK 
	LINK=.
	.byte 8 
	.ascii "EEP-LAST"
EEPLAST:
	subw x,#CELLL 
	ldw y,#APP_LAST 
	ldw (x),y 
	ret 

;----------------------------------
; return APP_RUN address 	
; EEP-RUN ( -- a )
;-----------------------------------
	.word LINK 
	LINK=.
	.byte 7
	.ascii "EEP-RUN"
EEPRUN:
	subw x,#CELLL 
	ldw y,#APP_RUN 
	ldw (x),y 
	ret 

;------------------------------------
; return APP_CP address  
; EEP-CP ( -- a )
;------------------------------------
	.word LINK
	LINK=.
	.byte 6 
	.ascii "EEP-CP"
EEPCP:
	subw x,#CELLL 
	ldw y,#APP_CP  
	ldw (x),y 
	ret 

;------------------------------------
; return APP_VP address 
; EEP-VP ( -- a )
;-------------------------------------
	.word LINK
	LINK=.
	.byte 6
	.ascii "EEP-VP"
EEPVP:
	subw x,#CELLL 
	ldw y,#APP_VP  
	ldw (x),y 
	ret 

;----------------------------------
; update APP_LAST with LAST 
; UPDAT-LAST ( -- )
;----------------------------------
	.word LINK 
	LINK=.
	.byte 10
	.ascii "UPDAT-LAST"
UPDATLAST:
	call LAST
	call AT  
	call EEPLAST
	jp EE_STORE 

;---------------------------------
; update APP_RUN 
; UPDAT-RUN ( a -- )
;---------------------------------
	.word LINK
	LINK=.
	.byte 9
	.ascii "UPDAT-RUN"
UPDATRUN:
	call EEPRUN
	jp EE_STORE 
	
;---------------------------------
; update APP_CP with CP 
; UPDAT-CP ( -- )
;---------------------------------
	.word LINK 
	LINK=.
	.byte 8 
	.ascii "UPDAT-CP"
UPDATCP:
	call CPP 
	call AT 
	call EEPCP 
	jp EE_STORE 

;----------------------------------
; update APP_VP with VP 
; UPDAT-VP ( -- )
;----------------------------------
	.word LINK
	LINK=.
	.byte 8 
	.ascii "UPDAT-VP" 
UPDATVP:
	call VPP 
	call AT
	call EEPVP 
	jp EE_STORE
	

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
; according to PTR16 address 
;  UNLOCK ( -- )
;-----------------------------
	.word LINK 
	LINK=.
	.byte 6
	.ascii "UNLOCK"
unlock:
; put addr[15:0] in Y, for bounds check.
	ldw y,PTR16   ; Y=addr15:0
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
; increment PTR16 
; INC-PTR16 ( -- )
;-------------------------
	.word LINK 
	LINK=. 
	.byte 8 
	.ascii "INC-PTR16" 
INC_PTR16:
	pushw y 
	ldw y,PTR16 
	incw y 
	ldw PTR16,y
	popw y 
	ret 


;----------------------------
; write a byte at address pointed 
; by PTR16 and increment PTR16.
; Expect pointer already initialized 
; and memory unlocked 
; WR-BYTE ( c -- )
;----------------------------
	.word LINK 
	LINK=. 
	.byte 7 
	.ascii "WR-BYTE" 

WR_BYTE:
	ldw y,x 
	ldw y,(y)
	addw x,#CELLL 
	ld a,yl
	ld [PTR16],a
	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
	jra INC_PTR16 

;---------------------------------------
; write a word at address pointed 
; by PTR16 and incrment PTR16 
; Expect pointer already initialized 
; WR-WORD ( w -- )
;---------------------------------------
	.word LINK 
	LINK=.
	.byte 7
	.ascii "WR-WORD"
WR_WORD:
	ldw y,x 
	ldw y,(y)
	pushw y 
	swapw y 
	ldw (x),y 
	call WR_BYTE 
	popw y 
	subw x,#CELLL
	ldw (x),y 
	call WR_BYTE
	jp lock 


;---------------------------------------
; write a byte to FLASH or EEPROM/OPTION  
; EEC!  (c a -- )
;---------------------------------------
    .word LINK 
	LINK=.
    .byte 4 
    .ascii "EEC!"
	; local variables 
	BTW = 1   ; byte to write offset on stack
    OPT = 2 
	VSIZE = 2
EE_CSTORE:
	sub sp,#VSIZE
    call PSTO
	ld a,(1,x)
	cpl a 
	ld (BTW,sp),a ; byte to write 
	clr (OPT,sp)  ; OPTION flag
	call unlock 
	; check if option
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
	call WR_BYTE 	
	tnz (OPT,sp)
	jreq 3$ 
    ld a,(BTW,sp)
    clrw y
	ld yl,a 
	subw x,#CELLL 
	ldw (x),y 
	call WR_BYTE
3$: 
	call lock 
	addw sp,#VSIZE 
    ret

;------------------------------
; write integer in FLASH|EEPROM
; EE! ( n a -- )
;------------------------------
	.word LINK 
	LINK=.
	.byte 3 
	.ascii "EE!"
EE_STORE:
	call PSTO 
	call unlock 
	jp WR_WORD 


;----------------------------
; Erase flash memory row 
; stm8s105c6 as 128 bytes rows
; ROW-ERASE ( a -- )
;----------------------------
	.word LINK 
	LINK=. 
	.byte 9 
	.ascii "ROW-ERASE" 
row_erase:
	call PSTO
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
	ldw y,PTR16
	cpw y,#app_space 
	jrpl erase_flash 
; erase EEPROM block
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
	ld ([PTR16],y),a
    incw y
	ld ([PTR16],y),a
    incw y
	ld ([PTR16],y),a
    incw y
	ld ([PTR16],y),a
	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
	ret
row_erase_proc_end:


;-----------------------------------
; block programming must be 
; executed from RAM 
; initial contidions: 
; 		memory unlocked
;       PTR16 initialized 
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
	ld ([PTR16],y),a
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
; WR-ROW ( ab ar -- )
; ab -> address 128 byte buffer to write 
; ar ->  row address in FLASH|EEPROM 
;-----------------------------
	.word LINK 
	LINK=.
	.byte 6 
	.ascii "WR-ROW"
WR_ROW:
	call PSTO
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
		call EE_CSTORE
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
	call EEPROM 
1$:	call DUPP 
	call row_erase
	ldw y,x 
	ldw y,(y)
	addw y,#BLOCK_SIZE
	ldw (x),y
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
	call DROP 
	ldw y,#app_space
	ldw (x),y   
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
	cpw y,#29 
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
	cpw y,#29 ; last vector
	jrugt 9$  
	sllw y 
	sllw y 
	addw y,#0x8008 ; irq0 address 
	subw x,#CELLL 
	ldw (x),y 
	call PSTO 
	subw x,#CELLL 
	clrw y
	ld a,#0x82 
	ld yh,a
	ldw (x),y
	call WR_WORD 
	subw x,#CELLL
	ldw y,#NonHandledInterrupt
	ldw (x),y 
	call WR_WORD 
9$:	ret 


;------------------------------
; all interrupt vector with 
; an address >= a are resetted 
; to default
; CHKIVEC ( a -- )
;------------------------------
	.word LINK 
	LINK=.
	.byte 7
	.ascii "CHKIVEC"
;local variables 
	SSP=1
	CADR=3
	OFS=5
	VSIZE=6  
CHKIVEC:
	sub sp,#VSIZE ;alloc local variables 
	ldw y,x 
	ldw y,(y)
	ldw (CADR,sp),y ; ca 
	ldw (SSP,sp),x 
	ldw x,#0x800a ; irq0 address 
	ldw PTR16,X
	ldw x,#-4 
1$:	addw x,#4
	cpw x,#30*4 ; irq0-29 
	jreq 9$
	ldw y,x  
	ld a,([PTR16],y)
	cp a,(CADR,sp)
	jrult 1$
	incw y 
	ld a,([PTR16],y)
	cp a,(CADR+1,sp) 
	jrult 1$ 
	ldw (OFS,sp),x 
	srlw x
	srlw x 
	ldw y,x 
	ldw x,(SSP,sp)
	ldw (x),y
	call reset_vector
	ldw x,(OFS,sp) 
	jra 1$
9$:	ldw x,(SSP,sp) 
	addw x,#CELLL 
	addw sp,#VSIZE ; drop local variables  
	ret 

;------------------------------
; set interrupt vector 
; SET-IVEC ( a n -- )
;  a Handler address
;  n  vector # 0 .. 29 
;-----------------------------
	.word LINK
	LINK=.
	.byte 8 
	.ascii "SET-IVEC" 
set_vector:
    ldw y,x 
	ldw y,(y) ; vector #
	cpw y,#29 ; last vector
	jrule 2$
	addw x,#2*CELLL 
	ret
2$:	sllw y 
	sllw y 
	addw y,#0X8008 ; IRQ0 vector address 
	ldw (x),y  ; vector address 
	call PSTO 
	clrw y 
	ld a,#0x82 
	ld yh,a 
	subw x,#CELLL 
	ldw (x),y 
	call WR_WORD 
	call WR_WORD 
9$: ret 


;------------------------
; Compile word to flash
; EE, (w -- )
;-----------------------
	.word LINK
	LINK=.
	.byte 3
	.ascii "EE,"
EE_COMMA:
	subw x,#CELLL 
	ldw y,UCP
	pushw y 
	ldw (x),y 
	call EE_STORE
	popw y 
	addw y,#2
	ldw UCP,y
	ret 


;-------------------------
; Compile byte to flash 
; EEC, ( c -- )	
;-------------------------
	.word LINK 
	LINK=.
	.byte 4 
	.ascii "EEC,"
EE_CCOMMA:
	subw x,#CELLL 
	ldw y,UCP
	pushw y 
	ldw (x),y 
	call EE_CSTORE
	popw y 
	incw y 
	ldw UCP,y
	ret 


;--------------------------
; copy FLASH block to ROWBUF
; ROW>BUF ( ar -- )
; ar row address 
;--------------------------
	.word LINK 
	LINK=.
	.byte 7 
	.ascii "ROW>BUF"
ROW2BUF: 
; align row address to block boundary
	ld a,(1,x)
	and a,#BLOCK_SIZE 
	ld (1,x),a 
	subw x,#2*CELLL 
	ldw y,#ROWBUFF 
	ldw (2,x),y 
	ldw y,#BLOCK_SIZE
	ldw (x),y 
	call CMOVE 
	ret 


;---------------------------
; copy ROWBUFF to flash 
; BUF>ROW ( ar -- )
; ar row address
;---------------------------
	.word LINK 
	LINK=.
	.byte 7 
	.ascii "BUF>ROW" 
BUF2ROW:
	call TBUF ; ( ar Ab -- )
	call SWAPP ; ( ab ar -- )
	call WR_ROW 
	ret 

;---------------------------------
; how many byte free in that row 
; RFREE ( a -- n )
; a is least byte of target address
;----------------------------------
	.word LINK 
	LINK=.
	.byte 5 
	.ascii "RFREE"
RFREE:
	ld a,(1,x)
	and a,#BLOCK_SIZE-1 
	ld YTEMP,a 
	ld a,#BLOCK_SIZE 
	sub a,YTEMP 
	clrw y 
	ld yl,a
	ldw (x),y 
	ret 

;---------------------------------
; write u bytes to flash/EEPROM 
; constraint to row limit 
; RAM>EE ( af a u1 -- u2 )
; af flash address 
; a ram address 
; u bytes count
; return u2 bytes written  
;-------------------------------
	.word LINK 
	LINK=. 
	.byte 6
	.ascii "RAM>EE"
	
RAM2EE:
; PICK af
	call DOLIT 
	.word 2 
	call PICK  ; { -- af a u1 af }
	call DUPP 
	call ROW2BUF ; copy in ROWBUFF  
	call DUPP 
	call TOR 
	call DOLIT 
	.word BLOCK_SIZE-1
	call ANDD 
	call DOLIT 
	.word ROWBUFF 
	call PLUS  ; ( -- af a u1 ab )
	call SWAPP ;  ( -- af a ab u1 )
	call RFROM  ; ( -- af a ab u1 af )
	call RFREE  ; ( -- af a ab u1 n )
	call MIN    
	call DUPP 
	call TOR  
	call CMOVE  ; copy RAM to RAM from a to ab 
	call BUF2ROW ; ( af --  ) write ROWBUFF to flash 
	call RFROM  ; how many written 
	ret 


;--------------------------
; move new colon definition to FLASH 
; using WR-ROW for efficiency 
; preserving bytes already used 
; in the current block. 
; At this point the compiler as completed
; in RAM and pointers CP and CNTXT are updated.
; CNTXT point to nfa of new word and  
; CP is after compiled word so CP-CNTXT+2=count to write 
; 
; FMOVE ( -- cp+ )
; 
;--------------------------
	.word LINK 
	LINK=.
	.byte 5 
	.ascii "FMOVE" 
FMOVE:
	call TFLASH 
	CALL AT 
	CALL QBRAN 
	.word no_move  
	call CPP  
	call AT  
	call DUPP ; ( cp cp -- )
	call CNTXT 
	call AT 
	call DOLIT 
	.word 2 
	call SUBB ; ( cp cp la -- ) \ new word link address in RAM  
	call DUPP 
	call TOR    ; ( cp cp la R: la ) 
FMOVE2:
	call HERE  ; ( cp cp la vp  R: la )
	call RAT   ; ( cp cp la vp la R: la )
	call SUBB ; ( cp cp la wl R: la  ) \ wl is bytes to copy 
next_row:
	call DUPP 
	call TOR  ; ( cp cp la wl -- ) R: a wl
	call RAM2EE ; ( cp cp la wl -- cp u2 ) u2 is byte written to FLASH 
	call DUPP 
	call TOR
	call PLUS  ; ( cp+ ) 
	call DUPP 
	call RFROM  ; ( cp+ cp+ u2  R: a wl ) 
	call RFROM  ; ( cp+ cp+ u2 wl R: a ) 
	call OVER   ; ( cp+ cp+ u2 wl u2 -- )
	call SUBB  ; ( cp+ cp+ u2 wl- R: a )
	call DUPP 
	call QBRAN
	.word fmove_done 
	call SWAPP  ; ( cp+ cp+ wl- u2 R: a )
	call RFROM ; ( cp+ cp+ wl- u2 a -- ) 
	call PLUS  ; ( cp+ cp+ wl- a+ )
	call DUPP 
	call TOR   ; ( cp+ cp+ wl- a+ ) R: a+
	call SWAPP ; ( cp+ cp+ a+ wl- )
	call BRAN
	.word next_row  
fmove_done:	
	call RFROM  ; ( -- cp+ cp+ u2 wl- a  )
	addw x,#4*CELLL ; (  -- cp+ ) new CP 
 	ret  
no_move:
	call ZERO
	ret 

;------------------------------------------
; adjust pointers after **FMOVE** operetion.
; UPDAT-PTR ( cp+ -- )
; cp+ is new CP position after FMOVE 
;-------------------------------------------
	.word LINK 
	LINK=.
	.byte 9
	.ascii "UPDAT-PTR" 
UPDATPTR:
;reset VP to previous position  
	call EEPVP 
	call AT
	call VPP 
	call STORE
;update CONTEXT and LAST 
	call EEPCP 
	call AT
	call DOLIT 
	.word 2 
	call PLUS 
	call DUPP 
	call CNTXT 
	call STORE
	call LAST
	call STORE 
	call UPDATLAST 
;update CP 
	call CPP 
	call STORE
	call UPDATCP 
	ret 

;-----------------------------
; move interrupt sub-routine
; in flash memory
;----------------------------- 
	.word LINK 
	LINK=. 
	.byte 6
	.ascii "IFMOVE" 
IFMOVE:
	call TFLASH 
	CALL AT 
	CALL QBRAN 
	.word no_move 
	call CPP 
	call AT 
	call DUPP ; ( cp cp -- )
	call EEPVP 
	call AT  ; ( cp cp a )
	call TOR 
	call RAT ; ( cp cp a -- ) R: a 
	jp FMOVE2 


