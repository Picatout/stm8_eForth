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

;-------------------------------------------------------------
;  eForth for STM8S adapted from C. H. Ting source file to 
;  assemble using sdasstm8
;  implemented on NUCLEO-8S208RB board
;  Adapted by picatout 2019/10/27
;  https://github.com/picatout/stm8_nucleo/eForth
;--------------------------------------------------------------
	.module EFORTH
         .optsdcc -mstm8
	.nlist
        .include "inc/macros.inc" 
        .include "inc/config.inc"
	.list
	.page

;===============================================================
;  Adaption to NUCLEO-8S208RB by Picatout
;  Date: 2020-06-07 
;       Suite aux nombreux changement remplacé le numéro de version pour 3.0
;  Date: 2019-10-26
;  Changes to memory map:
;       0x16f0  Data Stack, growing downward
;       0x1700  Terminal input buffer TIB
;       0x17ff  Return Stack, growing downard
;================================================================
;       STM8EF, Version 2.1, 13 July
;               Implemented on STM8S-Discovery Board.
;               Assembled by ST VisualDevelop STVD 
;               Bootup on internal 2 MHz clock
;               Switch to external 16 MHz crystal clock
;
; FORTH Virtual Machine:
; Subroutine threaded model
; SP Return stack pointer
; X Data stack pointer
; A,Y Scratch pad registers
;
; Memory Map:
; 0x0 RAM memory, system variables
; 0x80 Start of user defined words, linked to ROM dictionary
; 0x780 Data stack, growing downward
; 0x790 Terminal input buffer TIB
; 0x7FF Return stack, growing downward
; 0x8000 Interrupt vector table
; 0x8080 FORTH startup code
; 0x80E7 Start of FORTH dictionary in ROM
; 0x9584 End of FORTH dictionary
;
;       2020-04-26 Addapted for NUCLEO-8S208RB by Picatout 
;                  use UART1 instead of UART2 for communication with user.
;                  UART1 is available as ttyACM* device via USB connection.
;                  Use TIMER4 for millisecond interrupt to support MS counter 
;                  and MSEC word that return MS value.
;
;       EF12, Version 2.1, 18apr00cht
;               move to 8000H replacing WHYP.
;               copy interrupt vectors from WHYPFLSH.S19
;               to EF12.S19 before flashing
;               add TICKS1 and DELAY1 for motor stepping
;
;       EF12, 02/18/00, C. H. Ting
;       Adapt 86eForth v2.02 to 68HC12.
;               Use WHYP to seed EF12.ASM
;               Use AS12 native 68HC12 assembler:
;               as12 ef12.asm >ef12.lst
;       EF12A, add ADC code, 02mar00cht
;       EF12B, 01mar00cht
;               stack to 0x78, return stack to 0xf8.
;               add all port definitions
;               add PWM registers
;               add SPI registers and code
;       EF12C, 12mar00cht
;               add MAX5250 D/A converter
;       EF12D, 15mar00cht
;               add all the Lexel interface words
;       EF12E, 18apr00cht, save for reference
;
;       Copyright (c) 2000
;       Dr. C. H. Ting
;       156 14th Avenue
;       San Mateo, CA 94402
;       (650) 571-7639
;

      
;*********************************************************
;	Assembler constants
;*********************************************************
RAMBASE =	0x0000	   ;ram base
.if NUCLEO_8S20X 
STACK   =	0x17FF 	;system (return) stack empty 
DATSTK  =	0x1680	;data stack  empty
TBUFFBASE =     0x1680  ; flash read/write transaction buffer address  
TIBBASE =       0X1700  ; transaction input buffer addr.
.else ; DISCOVERY
STACK   =	0x7FF 	;system (return) stack empty 
DATSTK  =	0x680	;data stack  empty
TBUFFBASE =     0x680  ; flash read/write transaction buffer address  
TIBBASE =       0X700  ; transaction input buffer addr.
.endif

;; Memory allocation
UPP     =     RAMBASE+6          ; systeme variables base address 
SPP     =     RAMBASE+DATSTK     ; data stack bottom 
RPP     =     RAMBASE+STACK      ;  return stack bottom
ROWBUFF =     RAMBASE+TBUFFBASE ; flash write buffer 
TIBB    =     RAMBASE+TIBBASE  ; transaction input buffer
VAR_BASE =    RAMBASE+0x80  ; user variables start here .
VAR_TOP =     STACK-32*CELLL  ; reserve 32 cells for data stack. 

; user variables constants 
UBASE = UPP       ; numeric base 
UFPSW = UBASE+2  ; floating point state word 
UTMP = UFPSW+2    ; temporary storage
UINN = UTMP+2     ; >IN tib pointer 
UCTIB = UINN+2    ; tib count 
UTIB = UCTIB+2    ; tib address 
UINTER = UTIB+2   ; interpreter vector 
UHLD = UINTER+2   ; hold 
UCNTXT = UHLD+2   ; context, dictionary first link 
UVP = UCNTXT+2    ; variable pointer 
UCP = UVP+2      ; code pointer
ULAST = UCP+2    ; last dictionary pointer 
UOFFSET = ULAST+2 ; distance between CP and VP to adjust jump address at compile time.
UTFLASH = UOFFSET+2 ; select where between FLASH and RAM for compilation destination. 
URLAST = UTFLASH+2 ; context for dictionary in RAM memory 

;******  System Variables  ******
XTEMP	=	URLAST +2;address called by CREATE
YTEMP	=	XTEMP+2	;address called by CREATE
PROD1 = XTEMP	;space for UM*
PROD2 = PROD1+2
PROD3 = PROD2+2
CARRY = PROD3+2
SP0	= CARRY+2	;initial data stack pointer
RP0	= SP0+2		;initial return stack pointer
MS    =   RP0+2         ; millisecond counter 
CNTDWN =  MS+2          ; count down timer 
FPTR = CNTDWN+2         ; 24 bits farptr 
PTR16 = FPTR+1          ; middle byte of farptr 
PTR8 = FPTR+2           ; least byte of farptr 
SEEDX = PTR8+2          ; PRNG seed X 
SEEDY = SEEDX+2         ; PRNG seed Y 

; EEPROM persistant data  
APP_LAST = EEPROM_BASE ; Application last word pointer  
APP_RUN = APP_LAST+2   ; application autorun address 
APP_CP = APP_RUN+2     ; free application space pointer 
APP_VP = APP_CP+2      ; free data space pointer 


;***********************************************
;; Version control

VER     =     4         ;major release version
EXT     =     0         ;minor extension

;; Constants

TRUEE   =     0xFFFF      ;true flag

COMPO   =     0x40     ;lexicon compile only bit
IMEDD   =     0x80     ;lexicon immediate bit
MASKK   =     0x1F7F  ;lexicon bit mask

CELLL   =     2       ;size of a cell
BASEE   =     10      ;default radix
BKSPP   =     8       ;back space
LF      =     10      ;line feed
CRR     =     13      ;carriage return
XON     =     17
XOFF    =     19
ERR     =     27      ;error escape
TIC     =     39      ;tick
CALLL   =     0xCD     ;CALL opcodes
IRET_CODE =   0x80    ; IRET opcode 
ADDWX   =     0x1C    ; opcode for ADDW X,#word  
JPIMM   =     0xCC    ; JP addr opcode 

        .macro _ledon
            bset LED_PORT,#LED_BIT
        .endm

        .macro _ledoff
            bres LED_PORT,#LED_BIT
        .endm

;**********************************************************
        .area DATA (ABS)
        .org RAMBASE 
;**********************************************************

;**********************************************************
        .area SSEG (ABS) ; STACK
        .org 0x1700
        .ds 256 
; space for DATSTK,TIB and STACK         
;**********************************************************

;**********************************************************
        .area HOME ; vectors table
;**********************************************************
	int main	        ; reset
	int NonHandledInterrupt	; trap
	int NonHandledInterrupt	; irq0
	int NonHandledInterrupt	; irq1
	int NonHandledInterrupt	; irq2
	int NonHandledInterrupt	; irq3
	int NonHandledInterrupt	; irq4
	int NonHandledInterrupt	; irq5
	int NonHandledInterrupt	; irq6
	int NonHandledInterrupt	; irq7
	int NonHandledInterrupt	; irq8
	int NonHandledInterrupt	; irq9
	int NonHandledInterrupt	; irq10
	int NonHandledInterrupt	; irq11
	int NonHandledInterrupt	; irq12
	int NonHandledInterrupt	; irq13
	int NonHandledInterrupt	; irq14
	int NonHandledInterrupt	; irq15
	int NonHandledInterrupt	; irq16
	int NonHandledInterrupt	; irq17
	int NonHandledInterrupt	; irq18
	int NonHandledInterrupt	; irq19
	int NonHandledInterrupt	; irq20
	int NonHandledInterrupt	; irq21
	int NonHandledInterrupt	; irq22
	int Timer4Handler	; irq23
	int NonHandledInterrupt	; irq24
	int NonHandledInterrupt	; irq25
	int NonHandledInterrupt	; irq26
	int NonHandledInterrupt	; irq27
	int NonHandledInterrupt	; irq28
	int NonHandledInterrupt	; irq29

;**********************************************************
        .area CODE
;**********************************************************

; non handled interrupt reset MCU
NonHandledInterrupt:
        ld a, #0x80
        ld WWDG_CR,a ; WWDG_CR used to reset mcu
	;iret

; used for milliseconds counter 
; MS is 16 bits counter 
Timer4Handler:
	clr TIM4_SR 
        ldw x,MS 
        incw x 
        ldw MS,x
        ldw x,CNTDWN 
        jreq 1$
        decw x 
        ldw CNTDWN,x 
1$:         
        iret 


;; Main entry points and COLD start data
main:
; clear all RAM
	ldw X,#RAMBASE
clear_ram0:
	clr (X)
	incw X
	cpw X,#RAM_END
	jrule clear_ram0
        ldw x,#RPP
        ldw sp,x
; set SEEDX and SEEDY to 1 
        inc SEEDX+1 
        inc SEEDY+1          
	jp ORIG

; COLD initialize these variables.
UZERO:
        .word      BASEE   ;BASE
        .word      0       ; floating point state 
        .word      0       ;tmp
        .word      0       ;>IN
        .word      0       ;#TIB
        .word      TIBB    ;TIB
        .word      INTER   ;'EVAL
        .word      0       ;HLD
        .word      LASTN  ;CNTXT pointer
        .word      VAR_BASE   ;variables free space pointer 
        .word      app_space ; FLASH free space pointer 
        .word      LASTN   ;LAST
        .word      0        ; OFFSET 
        .word      0       ; TFLASH
;       .word      0       ; URLAST   
UEND:   .word      0

ORIG:   
; initialize SP
        LDW     X,#STACK  ;initialize return stack
        LDW     SP,X
        LDW     RP0,X
        LDW     X,#DATSTK ;initialize data stack
        LDW     SP0,X
.if NUCLEO_8S20X|DISCOVERY         
; initialize USER LED on board 
; added by Picatout 
        bset LED_CR1,#LED_BIT
        bset LED_CR2,#LED_BIT
        bset LED_DDR,#LED_BIT
.endif 
        _ledoff
; initialize clock to HSI
; no divisor 16Mhz 
; Added by Picatout 
clock_init:
        clr CLK_CKDIVR
	bset CLK_SWCR,#CLK_SWCR_SWEN
.if NUCLEO_8S20X|DOORBELL
	mov CLK_SWR,#CLK_SWR_HSI ; 16 Mhz internal 
.else ; DISCOVERY as 16Mhz crystal
	mov CLK_SWR,#CLK_SWR_HSE
.endif 
	ld a,CLK_SWR
1$:	cp a,CLK_CMSR
	jrne 1$
        
; initialize UART, 115200 8N1
.if NUCLEO_8S20X|DISCOVERY
uart_init:
;	bset CLK_PCKENR1,#UART_PCKEN
	; configure tx pin
	bset UART_PORT_DDR,#UART_TX_PIN ; tx pin
	bset UART_PORT_CR1,#UART_TX_PIN ; push-pull output
	bset UART_PORT_CR2,#UART_TX_PIN ; fast output
; baud rate 115200 Fmaster=16Mhz  16000000/115200=139=0x8b
; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
	ld a,#CLK_SWR_HSI
	cp a,CLK_CMSR 
	jreq 2$ 
1$: ; 8 Mhz 	
	mov UART_BRR2,#0x05 ; must be loaded first
	mov UART_BRR1,#0x4
	jra 3$
2$: ; 16 Mhz 	
	mov UART_BRR2,#0x0b ; must be loaded first
	mov UART_BRR1,#0x08
3$:
        clr UART_DR
	mov UART_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN));
	bset UART_CR2,#UART_CR2_SBK
        btjf UART_SR,#UART_SR_TC,.
.endif 
; initialize timer4, used for millisecond interrupt  
	mov TIM4_PSCR,#7 ; prescale 128  
	mov TIM4_ARR,#125 ; set for 1msec.
	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
	bset TIM4_IER,#TIM4_IER_UIE 
; set TIM4 interrupt priority to highest
        ld a,#~(IPR_MASK<<6)
        and a,ITC_SPR6
        or a,#(IPR3<<6)
        ld ITC_SPR6,a 
        rim
        jp  COLD   ;default=MN1


        LINK = 0  ; used by _HEADER macro 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;        
;; place MCU in sleep mode with
;; halt opcode 
;; BYE ( -- )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER BYE,3,"BYE"
        halt 
        ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;
; Enable interrupts 
; EI ( -- )
;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER EI,2,"EI"
        rim 
        ret 
;;;;;;;;;;;;;;;;;;;;;;;;;;
; Disable interrupts
; DI ( -- )
;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DI,2,"DI"
        sim 
        ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; set interrupt priority level 
; SET-ISP ( n1 n2 -- )
; n1 level {1..3}
; n2 vector {0..29}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER SETISP,7,"SET-ISP"
        ldw y,x 
        ldw y,(y)
        ld a,#4 ; 4 slot per register 
;  quotient select register, remainder select slot in register.        
        div y,a ; register=ITC_SPR1[Y], lshift=2*A 
        and a,#3 
        sll a ; 2*SLOT  lshift 
        addw y,#ITC_SPR1 
        ldw (x),y  ; ( level reg -- )
        clrw y 
        ld yl,a 
        subw x,#CELLL 
        ldw (x),y  ; ( level reg lshift -- )
        ldw y,x 
        ldw y,(2,y) 
        ld a,(y)   ; reg_value
        subw x,#CELLL 
        ldw (x),y ; ( level reg lshift rval -- )
        call OVER ; ( level reg lshift rval lshift -- )
        call DOLIT 
        .word 3
        call SWAPP  ; ( level reg lshift rval 3 lshift )
        call LSHIFT ; creat slot mask 
        call INVER  ; ( level reg lshift rval mask )
        call ANDD ; ( level reg lshift slot_masked )
        call TOR  ; ( level reg lshift -- R: slot_masked )
        call ROT  ; ( reg lshift level )
        call SWAPP ; ( reg level lshift )
        call LSHIFT  ; ( reg slot_level -- )
        call RFROM ; ( reg slot_level masked_val )
        call ORR   ; ( reg updated_rval )
        call SWAPP 
        jp CSTOR

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; sélectionne l'application 
; qui démarre automatique lors 
; d'un COLD start 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER AUTORUN,7,"AUTORUN"
        call TOKEN 
        call DUPP 
        call QBRAN 
        .word FORGET2
        call NAMEQ
        call QDUP 
        call QBRAN 
        .word FORGET2
        _DROP 
        subw x,#2*CELLL 
        clrw y 
        ldw (x),y 
        ldw y,#APP_RUN 
        ldw (2,x),y 
        jp EESTORE 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Reset dictionary pointer before 
;; forgotten word. RAM space and 
;; interrupt vector defined after 
;; must be resetted also.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER FORGET,6,"FORGET"
        call TOKEN
        call DUPP 
        call QBRAN 
        .word FORGET2
        call NAMEQ ; ( a -- ca na | a F )
        call QDUP 
        call QBRAN 
        .word FORGET2
; only forget users words 
        call DUPP ; ( ca na na )
        call DOLIT 
        .word app_space 
        call SWAPP 
        call  ULESS 
        call QBRAN 
        .word FORGET6 
; ( ca na -- )        
;reset ivec with address >= ca
        call SWAPP ; ( na ca -- ) 
        call CHKIVEC ; ( na -- ) 
; start at LAST and link back to na 
; if variable found reset VP at that point.
FORGET1:
        call LAST 
        call AT 
        call DUPP  ; ( -- na last last )
        call FREEVAR ; ( -- na last )
        call DUPP 
        call DOLIT 
        .word 2 
        call SUBB ; ( na last -- na last lfa ) link address 
        call AT 
        call DUPP ; ( -- na last a a )
        call CNTXT 
        call STORE
        call LAST  
        call STORE ; ( --  na last )
        call OVER 
        call EQUAL ; ( na last na -- na T|F ) 
        call QBRAN 
        .word FORGET1 
; ( na -- )
        call DOLIT 
        .word 2 
        call SUBB 
        call CPP 
        call STORE  
        call UPDATCP 
        jp UPDATLAST 
FORGET6: ; tried to forget a RAM or system word 
; ( ca na -- )
        subw x,#CELLL 
        ldw y,SP0 
        ldw (x),y  
        call ULESS
        call QBRAN 
        .word PROTECTED 
        call ABORQ 
        .byte 29
        .ascii " For RAM definition do REBOOT"
PROTECTED:
        call ABORQ
        .byte 10
        .ascii " Protected"
FORGET2: ; no name or not found in dictionary 
        call ABORQ
        .byte 5
        .ascii " what"
FORGET4:
        jp DROP 


;;;;;;;;;;;;;;;;;;;;;
; if na is variable 
; free variable data  
; FREEVAR ( na -- )
;;;;;;;;;;;;;;;;;;;;;;
        _HEADER FREEVAR,7,"FREEVAR"
        call DUPP ; ( na na -- )
        CALL CAT  ; ( na c -- )
        call ONEP ;
        CALL PLUS ; ( na c+1 -- ca ) 
        call ONEP ; ( ca+ -- ) to get routne address 
        call DUPP ; ( ca+ ca+ -- )
        CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
        call DOLIT 
        .word DOVAR ; if routine address is DOVAR then variable 
        call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
        call QBRAN 
        .word FREEVAR4 
        call DOLIT 
        .word 2 
        call PLUS  ; ( ca+ 2 -- da ) da is data address 
        call AT 
        call VPP   
        call STORE 
        jp UPDATVP 
FREEVAR4: ; not variable
        _DROP 
        RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    SEED ( n -- )
; Initialize PRNG seed with n 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER SEED,4,"SEED"
        ldw y,x 
        addw x,#CELLL
        ldw y,(y)
        ld a,yh 
        ld SEEDX,a 
        ld a,yl 
        ld SEEDY,a 
        ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    RANDOM ( u1 -- u2 )
; Pseudo random number betwen 0 and u1-1
;  XOR32 algorithm 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER RANDOM,6,"RANDOM"
;local variable 
        SPSAVE=1
        VSIZE=2 
        sub sp,#VSIZE
        ldw (SPSAVE,sp),x  
; XTEMP=(SEEDX<<5)^SEEDX 
        ldw y,x 
        ldw y,(y)
        ldw YTEMP,y 
	ldw x,SEEDX 
	sllw x 
	sllw x 
	sllw x 
	sllw x 
	sllw x 
	ld a,xh 
	xor a,SEEDX 
	ld XTEMP,a 
	ld a,xl 
	xor a,SEEDX+1 
	ld XTEMP+1,a 
; SEEDX=SEEDY 
	ldw x,SEEDY 
	ldw SEEDX,x  
; SEEDY=SEEDY^(SEEDY>>1)
	srlw x 
	ld a,xh 
	xor a,SEEDY 
	ld SEEDY,a  
	ld a,xl 
	xor a,SEEDY+1 
	ld SEEDY+1,a 
; XTEMP>>3 
	ldw x,XTEMP 
	srlw x 
	srlw x 
	srlw x 
; x=XTEMP^x 
	ld a,xh 
	xor a,XTEMP 
	ld xh,a 
	ld a,xl 
	xor a,XTEMP+1  
	ld xl,a 
; SEEDY=x^SEEDY 
	xor a,SEEDY+1
	ld xl,a 
	ld a,xh 
	xor a,SEEDY
	ld xh,a 
	ldw SEEDY,x 
; return SEEDY modulo YTEMP  
	ldw y,YTEMP  
	divw x,y 
	ldw x,(SPSAVE,sp)
        ldw (x),y 
        addw sp,#VSIZE 
	ret 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; get millisecond counter 
;; msec ( -- u )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER MSEC,4,"MSEC"
        subw x,#CELLL 
        ldw y,MS 
        ldw (x),y 
        ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; suspend execution for u msec 
;  pause ( u -- )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER PAUSE,5,"PAUSE"
        ldw y,x
        ldw y,(y)
        addw y,MS 
1$:     wfi  
        cpw y,MS  
        jrne 1$        
        addw x,#CELLL 
        ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; initialize count down timer 
;  TIMER ( u -- )  milliseconds
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER TIMER,5,"TIMER"
        ldw y,x
        ldw y,(y) 
        ldw CNTDWN,y
        addw x,#CELLL 
        ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; check for TIMER exiparition 
;  TIMEOUT? ( -- 0|-1 )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER TIMEOUTQ,8,"TIMEOUT?"
        clr a
        subw x,#CELLL 
        ldw y,CNTDWN 
        jrne 1$ 
        cpl a 
1$:     ld (1,x),a 
        ld (x),a 
        ret         

;;;;;;;;;;;;;;;;;;;;;
; reboot MCU 
; REBOOT ( -- )
;;;;;;;;;;;;;;;;;;;;;
        _HEADER reboot,6,"REBOOT"
        jp NonHandledInterrupt

;;;;;;;;;;;;;;;;;;;;;;;;;;
; compile to flash memory 
; TO-FLASH ( -- )
;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER TOFLASH,8,"TO-FLASH"
        call RAMLAST 
        call AT 
        call QDUP 
        call QBRAN
        .word 1$
        call ABORQ 
        .byte 29
        .ascii " Not while definitions in RAM"   
1$:     ldw y,#-1 
        ldw UTFLASH,y
        ret 

;;;;;;;;;;;;;;;;;;;;;;
; compile to RAM 
; TO-RAM ( -- )
;;;;;;;;;;;;;;;;;;;;;;
        _HEADER TORAM,6,"TO-RAM"
        clrw y 
        ldw UTFLASH,y 
        ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BAUD RATE constants table
; values to put in BRR1 & BRR2 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
baudrate: 
	.byte 0xa0,0x1b ; 2400
	.byte 0xd0,0x5  ; 4800 
	.byte 0x68,0x3  ; 9600
	.byte 0x34,0x1  ; 19200
	.byte 0x11,0x6  ; 57600
	.byte 0x8,0xb   ; 115200

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; BAUD RATE CONSTANTS names 
; 2400 baud  ( -- n )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER B2K4,4,"B2K4"
	subw x,#CELLL 
        clrw y
        ldw (x),y
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 4800 baud	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER B4K8,4,"B4K8"
        subw x,#CELLL 
        ldw y,#2 
        ldw (x),y
        ret 

;;;;;;;;;;;;;;;;;;;;
; 9600 baud
;;;;;;;;;;;;;;;;;;;;
        _HEADER B9K6,4,"B9K6"
        subw x,#CELLL 
        ldw y,#4 
        ldw (x),y 
        ret 
;;;;;;;;;;;;;;
; 19200 baud
;;;;;;;;;;;;;;
        _HEADER B19K2,5,"B19K2"
        subw x,#CELLL
        ldw y,#6 
        ldw (x),y 
        ret 
;;;;;;;;;;;;;;
; 57600 baud  
;;;;;;;;;;;;;;
        _HEADER B57K6,5,"B57K6"
        subw x,#CELLL 
        ldw y,#8 
        ldw (x),y 
        ret 
;;;;;;;;;;;;;;
; 115200 baud 
;;;;;;;;;;;;;;
        _HEADER B115K2,6,"B115K2"
	subw x,#CELLL 
        ldw y,#10 
        ldw (x),y 
        ret 

;;;;;;;;;;;;;;;;;;;;;;;	
;; set UART2 BAUD rate
;	BAUD ( u -- )
;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER BAUD,4,"BAUD"
	subw x,#CELLL
        ldw y,#baudrate 
        ldw (x),y 
        call PLUS
        ldw y,x  
        ldw y,(y)
        ld a,(y)
        push a 
        incw y 
        ld a,(y)
        ld UART_BRR2,a 
        pop a
        ld UART_BRR1,a 
        addw x,#CELLL 
        ret 

;; Device dependent I/O
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       ?RX     ( -- c T | F )
;         Return input byte and true, or false.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER QKEY,4,"?KEY"
        CLRW Y 
        BTJF UART_SR,#UART_SR_RXNE,INCH   ;check status
        LD    A,UART_DR   ;get char in A
	SUBW	X,#2
        LD     (1,X),A
	CLR	(X)
        CPLW     Y
INCH:
		SUBW	X,#2
        LDW     (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       TX!     ( c -- )
;       Send character c to  output device.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER EMIT,4,"EMIT"
        LD     A,(1,X)
	ADDW	X,#2
putc:         
OUTPUT: BTJF UART_SR,#UART_SR_TXE,OUTPUT  ;loop until tx empty 
        LD    UART_DR,A   ;send A
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       FC-XON  ( -- )
;       send XON character 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER FC_XON,6,"FC-XON"
        subw x,#CELLL 
        clr (x)
        ld a,#XON 
        ld (1,x),a 
        call EMIT 
        ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       FC-XOFF ( -- )
;       Send XOFF character 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER FC_XOFF,7,"FC-XOFF"
        subw x,#CELLL 
        clr (x)
        ld a,#XOFF 
        ld (1,x),a 
        call EMIT 
        ret

;; The kernel

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       doLIT   ( -- w )
;       Push an inline literal.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DOLIT:
	SUBW X,#2
        ldw y,(1,sp)
        ldw y,(y)
        ldw (x),y
        popw y 
        jp (2,y)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       NEXT    ( -- )
;       Code for  single index loop.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DONXT,COMPO+4,"NEXT"
	LDW Y,(3,SP)
	DECW Y
	JRPL NEX1 ; jump if N=0
	POPW Y
        addw sp,#2
        JP (2,Y)
NEX1:
        LDW (3,SP),Y
        POPW Y
	LDW Y,(Y)
	JP (Y)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       ?branch ( f -- )
;       Branch if flag is zero.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       _HEADER QBRAN,COMPO+7,"?BRANCH"        
QBRAN:	
        LDW Y,X
	ADDW X,#2
	LDW Y,(Y)
        JREQ     BRAN
	POPW Y
	JP (2,Y)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  TBRANCH ( f -- )
;  branch if f==TRUE 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;        _HEADER TBRAN,COMPO+7,"TBRANCH"
TBRAN: 
        LDW Y,X 
        ADDW X,#2 
        LDW Y,(Y)
        JRNE BRAN 
        POPW Y 
        JP (2,Y)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       branch  ( -- )
;       Branch to an inline address.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       _HEADER BRAN,COMPO+6,"BRANCH"
BRAN:
        POPW Y
	LDW Y,(Y)
        JP  (Y)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       EXECUTE ( ca -- )
;       Execute  word at ca.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER EXECU,7,"EXECUTE"
        LDW Y,X
	ADDW X,#CELLL 
	LDW  Y,(Y)
        JP   (Y)

OPTIMIZE = 1
.if OPTIMIZE 
; remplacement de CALL EXIT par 
; le opcode de RET.
; Voir modification au code de ";"
.else 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       EXIT    ( -- )
;       Terminate a colon definition.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       _HEADER EXIT,4,"EXIT"
EXIT:
        POPW Y
        RET
.endif 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       !       ( w a -- )
;       Pop  data stack to memory.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER STORE,1,"!"
        LDW Y,X
        LDW Y,(Y)    ;Y=a
        PUSHW X
        LDW X,(2,X) ; x=w 
        LDW (Y),X 
        POPW X  
        _DDROP 
        RET     

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       @       ( a -- w )
;       Push memory location to stack.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER AT,1,"@"
        LDW Y,X     ;Y = a
        LDW Y,(Y)   ; address 
        LDW Y,(Y)   ; value 
        LDW (X),Y ;w = @Y
        RET     

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       C!      ( c b -- )
;       Pop  data stack to byte memory.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER CSTOR,2,"C!"
        LDW Y,X
	LDW Y,(Y)    ;Y=b
        LD A,(3,X)    ;D = c
        LD  (Y),A     ;store c at b
	ADDW X,#4 ; DDROP 
        RET     

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       C@      ( b -- c )
;       Push byte in memory to  stack.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER CAT,2,"C@"
        LDW Y,X     ;Y=b
        LDW Y,(Y)
        LD A,(Y)
        LD (1,X),A
        CLR (X)
        RET     

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       RP@     ( -- a )
;       Push current RP to data stack.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER RPAT,3,"RP@"
        LDW Y,SP    ;save return addr
        SUBW X,#2
        LDW (X),Y
        RET     

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       RP!     ( a -- )
;       Set  return stack pointer.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER RPSTO,COMPO+3,"RP!"
        POPW Y
        LDW YTEMP,Y
        LDW Y,X
        LDW Y,(Y)
        LDW SP,Y
        ADDW X,#CELLL ; a was not dropped, Picatout 2020-05-24
        JP [YTEMP]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       R>      ( -- w )
;       Pop return stack to data stack.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER RFROM,2,"R>"
        SUBW X,#CELLL 
        LDW Y,(3,SP)
        LDW (X),Y 
        POPW Y 
        ADDW SP,#2 
        JP (Y)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       R@      ( -- w )
;       Copy top of return stack to stack.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER RAT,2,"R@"
        ldw y,(3,sp)
        subw x,#CELLL 
        ldw (x),y 
        ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       LOCAL ( n -- )
;       reserve n slots on return stack
;       for local variables 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER LOCAL,5,"LOCAL"
        POPW Y  
        LDW YTEMP,Y ; RETURN ADDRESS 
        LD A,(1,X)
        LD YL,A 
        LD A,#CELLL 
        MUL Y,A 
        LDw XTEMP,Y
        LDW Y,SP 
        SUBW Y,XTEMP
        LDW SP,Y 
        ADDW X,#CELLL 
        JP [YTEMP]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       NRDROP ( n -- )
;       drop n elements from rstack
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER NRDROP,6,"NRDROP" 
        POPW Y 
        LDW YTEMP,Y ; RETURN ADDRESS 
        LD A,(1,X)
        LD YL,A  
        LD A,#CELLL 
        MUL Y,A 
        LDW XTEMP,Y 
        LDW Y,SP 
        ADDW Y,XTEMP 
        LDW SP,Y  
        ADDW X,#CELLL 
        JP [YTEMP]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;        ( n -- w)
;      fetch nth element ofr return stack 
;      n==0 is same as R@ 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER NRAT,3,"NR@"
        LD A,(1,X)
        LD YL,A 
        LD A,#CELLL 
        MUL Y,A 
        LDW YTEMP,Y 
        LDW Y,SP 
        ADDW Y,#3 
        ADDW Y,YTEMP 
        LDW Y,(Y)
        LDW (X),Y 
        RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       NR! ( w n --  )
;       store w on nth position of 
;       return stack 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER NRSTO,3,"NR!"
        LDW Y,SP
        ADDW Y,#3 
        LDW YTEMP,Y 
        LD A,(1,X)
        LD YL,A 
        LD A,#CELLL 
        MUL Y,A 
        ADDW Y,YTEMP
        PUSHW X 
        LDW X,(2,X)
        LDW (Y),X
        POPW X 
        ADDW X,#2*CELLL 
        RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       >R      ( w -- )
;       Push data stack to return stack.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER TOR,COMPO+2,">R"
        POPW Y    ;save return addr
        LDW YTEMP,Y
        LDW Y,X
        LDW Y,(Y)  ; W
        PUSHW Y    ;W >R 
        ADDW X,#2
        JP [YTEMP]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       SP@     ( -- a )
;       Push current stack pointer.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER SPAT,3,"SP@"
	LDW Y,X
        SUBW X,#2
	LDW (X),Y
        RET     

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       SP!     ( a -- )
;       Set  data stack pointer.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER SPSTO,3,"SP!"
        LDW     X,(X)     ;X = a
        RET     

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       DROP    ( w -- )
;       Discard top stack item.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DROP,4,"DROP"
        ADDW X,#2     
        RET     

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       DUP     ( w -- w w )
;       Duplicate  top stack item.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DUPP,3,"DUP"
	LDW Y,X
        SUBW X,#2
	LDW Y,(Y)
	LDW (X),Y
        RET     

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       SWAP    ( w1 w2 -- w2 w1 )
;       Exchange top two stack items.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER SWAPP,4,"SWAP"
        LDW Y,X
        LDW Y,(Y)
        PUSHW Y  
        LDW Y,X
        LDW Y,(2,Y)
        LDW (X),Y
        POPW Y 
        LDW (2,X),Y
        RET     

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       OVER    ( w1 w2 -- w1 w2 w1 )
;       Copy second stack item to top.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER OVER,4,"OVER"
        SUBW X,#2
        LDW Y,X
        LDW Y,(4,Y)
        LDW (X),Y
        RET     

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       0<      ( n -- t )
;       Return true if n is negative.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER ZLESS,2,"0<"
        LD A,#0xFF
        LDW Y,X
        LDW Y,(Y)
        JRMI     ZL1
        CLR A   ;false
ZL1:    LD     (X),A
        LD (1,X),A
	RET     

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       0= ( n -- f )
;   n==0?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER ZEQUAL,2,"0="
        LD A,#0XFF 
        LDW Y,X 
        LDW Y,(Y)
        JREQ ZEQU1 
        LD A,#0 
ZEQU1:  
        LD (X),A 
        LD (1,X),A         
        RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       AND     ( w w -- w )
;       Bitwise AND.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER ANDD,3,"AND"
        LD  A,(X)    ;D=w
        AND A,(2,X)
        LD (2,X),A
        LD A,(1,X)
        AND A,(3,X)
        LD (3,X),A
        ADDW X,#2
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       OR      ( w w -- w )
;       Bitwise inclusive OR.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER ORR,2,"OR"
        LD A,(X)    ;D=w
        OR A,(2,X)
        LD (2,X),A
        LD A,(1,X)
        OR A,(3,X)
        LD (3,X),A
        ADDW X,#2
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       XOR     ( w w -- w )
;       Bitwise exclusive OR.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER XORR,3,"XOR"
        LD A,(X)    ;D=w
        XOR A,(2,X)
        LD (2,X),A
        LD A,(1,X)
        XOR A,(3,X)
        LD (3,X),A
        ADDW X,#2
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       UM+     ( u u -- udsum )
;       Add two unsigned single
;       and return a double sum.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER UPLUS,3,"UM+"
        LD A,#1
        LDW Y,X
        LDW Y,(2,Y)
        LDW YTEMP,Y
        LDW Y,X
        LDW Y,(Y)
        ADDW Y,YTEMP
        LDW (2,X),Y
        JRC     UPL1
        CLR A
UPL1:   LD     (1,X),A
        CLR (X)
        RET

;; System and user variables

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       doVAR   ( -- a )
;       run time code 
;       for VARIABLE and CREATE.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       HEADER DOVAR,COMPO+5,"DOVAR"
DOVAR:
	SUBW X,#2
        POPW Y    ;get return addr (pfa)
        LDW Y,(Y) ; indirect address 
        LDW (X),Y    ;push on stack
        RET     ;go to RET of EXEC

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       BASE    ( -- a )
;       Radix base for numeric I/O.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER BASE,4,"BASE"
	LDW Y,#UBASE 
	SUBW X,#2
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       tmp     ( -- a )
;       A temporary storage.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER TEMP,3,"TMP"
	LDW Y,#UTMP
	SUBW X,#2
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       >IN     ( -- a )
;        Hold parsing pointer.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER INN,3,">IN"
	LDW Y,#UINN 
	SUBW X,#2
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       #TIB    ( -- a )
;       Count in terminal input 
;       buffer.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER NTIB,4,"#TIB"
	LDW Y,#UCTIB 
	SUBW X,#2
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       TBUF ( -- a )
;       address of 128 bytes 
;       transaction buffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER TBUF,4,"TBUF"
        ldw y,#ROWBUFF
        subw x,#CELLL
        ldw (x),y 
        ret 

; systeme variable 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; compilation destination 
; TFLASH ( -- A )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER TFLASH,6,"TFLASH"
        subw x,#CELLL 
        ldw y,#UTFLASH
        ldw (x),y 
        ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       "EVAL   ( -- a )
;       Execution vector of EVAL.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER TEVAL,5,"'EVAL"
	LDW Y,#UINTER 
	SUBW X,#2
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       HLD     ( -- a )
;       Hold a pointer of output
;        string.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER HLD,3,"HLD"
	LDW Y,#UHLD 
	SUBW X,#2
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       CONTEXT ( -- a )
;       Start vocabulary search.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER CNTXT,7,"CONTEXT"
	LDW Y,#UCNTXT
	SUBW X,#2
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       VP      ( -- a )
;       Point to top of variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER VPP,2,"VP"
	LDW Y,#UVP 
	SUBW X,#2
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       CP    ( -- a )
;       Pointer to top of FLASH 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER CPP,2,"CP"
        ldw y,#UCP 
        subw x,#CELLL 
        ldw (x),y 
        ret                

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       LAST    ( -- a )
;       Point to last name in 
;       dictionary.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER LAST,4,"LAST"
	LDW Y,#ULAST 
	SUBW X,#2
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; address of system variable URLAST 
;       RAMLAST ( -- a )
; RAM dictionary context 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER RAMLAST,7,"RAMLAST"
        ldw y,#URLAST 
        subw x,#CELLL 
        ldw (x),y 
        ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       OFFSET ( -- a )
;       address of system 
;       variable OFFSET 
;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER OFFSET,6,"OFFSET"
        subw x,#CELLL
        ldw y,#UOFFSET 
        ldw (x),y 
        ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; adjust jump address 
;  adding OFFSET
; ADR-ADJ ( a -- a+offset )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ADRADJ: 
        call OFFSET 
        call AT 
        jp PLUS 


;; Common functions

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       ?DUP    ( w -- w w | 0 )
;       Dup tos if its is not zero.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER QDUP,4,"?DUP"
        LDW Y,X
	LDW Y,(Y)
        JREQ     QDUP1
	SUBW X,#CELLL 
        LDW (X),Y
QDUP1:  RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
;       Rot 3rd item to top.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER ROT,3,"ROT"
        ldw y,x 
        ldw y,(y)
        pushw y 
        ldw y,x 
        ldw y,(4,y)
        ldw (x),y 
        ldw y,x 
        ldw y,(2,y)
        ldw (4,x),y 
        popw y 
        ldw (2,x),y
        ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    <ROT ( n1 n2 n3 -- n3 n1 n2 )
;    rotate left 3 top elements 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    _HEADER NROT,4,"<ROT"
    LDW Y,X 
    LDW Y,(Y)
    PUSHW Y ; n3 >R 
    LDW Y,X 
    LDW Y,(2,Y) ; Y = n2 
    LDW (X),Y   ; TOS = n2 
    LDW Y,X    
    LDW Y,(4,Y) ; Y = n1 
    LDW (2,X),Y ;   = n1 
    POPW Y  ; R> Y 
    LDW (4,X),Y ; = n3 
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       2DROP   ( w w -- )
;       Discard two items on stack.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DDROP,5,"2DROP"
        ADDW X,#4
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
;       Duplicate top two items.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DDUP,4,"2DUP"
        SUBW X,#4
        LDW Y,X
        LDW Y,(6,Y)
        LDW (2,X),Y
        LDW Y,X
        LDW Y,(4,Y)
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       +       ( w w -- sum )
;       Add top two items.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER PLUS,1,"+"
        LDW Y,X
        LDW Y,(Y)
        LDW YTEMP,Y
        ADDW X,#2
        LDW Y,X
        LDW Y,(Y)
        ADDW Y,YTEMP
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       TRUE ( -- -1 )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER TRUE,4,"TRUE"
        LD A,#255 
        SUBW X,#CELLL
        LD (X),A 
        LD (1,X),A 
        RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       FALSE ( -- 0 )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER FALSE,5,"FALSE"
        SUBW X,#CELLL 
        CLR (X) 
        CLR (1,X)
        RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       NOT     ( w -- w )
;       One's complement of tos.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER INVER,3,"NOT"
        LDW Y,X
        LDW Y,(Y)
        CPLW Y
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       NEGATE  ( n -- -n )
;       Two's complement of tos.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER NEGAT,6,"NEGATE"
        LDW Y,X
        LDW Y,(Y)
        NEGW Y
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       DNEGATE ( d -- -d )
;       Two's complement of double.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DNEGA,7,"DNEGATE"
        LDW Y,X
	LDW Y,(Y)
        CPLW Y
        PUSHW Y      ; Y >R 
        LDW Y,X
        LDW Y,(2,Y)
        CPLW Y
        ADDW Y,#1
        LDW (2,X),Y
        POPW Y       ; R> Y  
        JRNC DN1 
        INCW Y
DN1:    LDW (X),Y
        RET


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       S>D ( n -- d )
; convert single integer to double 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER STOD,3,"S>D"
        SUBW X,#CELLL 
        CLR (X) 
        CLR (1,X) 
        LDW Y,X 
        LDW Y,(2,Y)
        JRPL 1$
        LDW Y,#-1 
        LDW (X),Y 
1$:     RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       -       ( n1 n2 -- n1-n2 )
;       Subtraction.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER SUBB,1,"-"
        LDW Y,X
        LDW Y,(Y) ; n2 
        LDW YTEMP,Y 
        ADDW X,#CELLL 
        LDW Y,X
        LDW Y,(Y) ; n1 
        SUBW Y,YTEMP ; n1-n2 
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       ABS     ( n -- n )
;       Return  absolute value of n.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER ABSS,3,"ABS"
        LDW Y,X
	LDW Y,(Y)
        JRPL     AB1     ;negate:
        NEGW     Y     ;else negate hi byte
        LDW (X),Y
AB1:    RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       =       ( w w -- t )
;       Return true if top two are equal.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER EQUAL,1,"="
        LD A,#0xFF  ;true
        LDW Y,X    
        LDW Y,(Y)   ; n2 
        ADDW X,#CELLL 
        CPW Y,(X)   ; n1==n2
        JREQ EQ1 
        CLR A 
EQ1:    LD (X),A
        LD (1,X),A
	RET     

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       U<      ( u1 u2 -- f )
;       Unsigned compare of top two items.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER ULESS,2,"U<"
        LD A,#0xFF  ;true
        LDW Y,X    
        LDW Y,(2,Y) ; u1 
        CPW Y,(X)   ; cpw u1  u2 
        JRULT     ULES1
        CLR A
ULES1:  ADDW X,#CELLL 
        LD (X),A
        LD (1,X),A
	RET     


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       <       ( n1 n2 -- t )
;       Signed compare of top two items.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER LESS,1,"<"
        LD A,#0xFF  ;true
        LDW Y,X    
        LDW Y,(2,Y)  ; n1 
        CPW Y,(X)  ; n1 < n2 ? 
        JRSLT     LT1
        CLR A
LT1:    ADDW X,#CELLL 
        LD (X),A
        LD (1,X),A
	RET     

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   U> ( u1 u2 -- f )
;   f = true if u1>u2 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER UGREAT,2,"U>"
        LD A,#255  
        LDW Y,X 
        LDW Y,(2,Y)  ; u1 
        CPW Y,(X)  ; u1 > u2 
        JRUGT UGREAT1 
        CLR A   
UGREAT1:
        ADDW X,#CELLL 
        LD (X),A 
        LD (1,X),A 
        RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       >   (n1 n2 -- f )
;  signed compare n1 n2 
;  true if n1 > n2 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER GREAT,1,">"
        LD A,#0xFF ;
        LDW Y,X 
        LDW Y,(2,Y)  ; n1 
        CPW Y,(X) ; n1 > n2 ?  
        JRSGT GREAT1 
        CLR  A
GREAT1:
        ADDW X,#CELLL 
        LD (X),A 
        LD (1,X),A 
        RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       MAX     ( n n -- n )
;       Return greater of two top items.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER MAX,3,"MAX"
        LDW Y,X    
        LDW Y,(Y) ; n2 
        CPW Y,(2,X)   
        JRSLT  MAX1
        LDW (2,X),Y
MAX1:   ADDW X,#2
	RET     

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       MIN     ( n n -- n )
;       Return smaller of top two items.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER MIN,3,"MIN"
        LDW Y,X    
        LDW Y,(Y)  ; n2 
        CPW Y,(2,X) 
        JRSGT MIN1
        LDW (2,X),Y
MIN1:	ADDW X,#2
	RET     

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       WITHIN  ( u ul uh -- t )
;       Return true if u is within
;       range of ul and uh. ( ul <= u < uh )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER WITHI,6,"WITHIN"
        CALL     OVER
        CALL     SUBB
        CALL     TOR
        CALL     SUBB
        CALL     RFROM
        JP     ULESS

;; Divide

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       UM/MOD  ( udl udh un -- ur uq )
;       Unsigned divide of a double by a
;       single. Return mod and quotient.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 2021-02-22
; changed algorithm for Jeeek one 
; ref: https://github.com/TG9541/stm8ef/pull/406        
        _HEADER UMMOD,6,"UM/MOD"
        LDW     Y,X             ; stack pointer to Y
        LDW     X,(X)           ; un
        LDW     YTEMP,X         ; save un
        LDW     X,Y
        INCW    X               ; drop un
        INCW    X
        PUSHW   X               ; save stack pointer
        LDW     X,(X)           ; X=udh
        JRNE    MMSM0
        LDW    X,(1,SP)
        LDW    X,(2,X)          ; udl 
        LDW     Y,YTEMP         ;divisor 
        DIVW    X,Y             ; udl/un 
        EXGW    X,Y 
        JRA     MMSMb 
MMSM0:    
        LDW     Y,(4,Y)         ; Y=udl (offset before drop)
        CPW     X,YTEMP
        JRULT   MMSM1           ; X is still on the R-stack
        POPW    X               ; restore stack pointer
        CLRW    Y
        LDW     (2,X),Y         ; remainder 0
        DECW    Y
        LDW     (X),Y           ; quotient max. 16 bit value
        RET
MMSM1:
        LD      A,#16           ; loop count
        SLLW    Y               ; udl shift udl into udh
MMSM3:
        RLCW    X               ; rotate udl bit into uhdh (= remainder)
        JRC     MMSMa           ; if carry out of rotate
        CPW     X,YTEMP         ; compare udh to un
        JRULT   MMSM4           ; can't subtract
MMSMa:
        SUBW    X,YTEMP         ; can subtract
        RCF
MMSM4:
        CCF                     ; quotient bit
        RLCW    Y               ; rotate into quotient, rotate out udl
        DEC     A               ; repeat
        JRNE    MMSM3           ; if A == 0
MMSMb:
        LDW     YTEMP,X         ; done, save remainder
        POPW    X               ; restore stack pointer
        LDW     (X),Y           ; save quotient
        LDW     Y,YTEMP         ; remainder onto stack
        LDW     (2,X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   U/MOD ( u1 u2 -- ur uq )
;   unsigned divide u1/u2 
;   return remainder and quotient 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER USLMOD,5,"U/MOD"
        LDW Y,X 
        LDW Y,(Y)  ; dividend 
        PUSHW X    ; DP >R 
        LDW X,(2,X) ; divisor 
        DIVW X,Y 
        PUSHW X     ; quotient 
        LDW X,(3,SP) ; DP 
        LDW (2,X),Y ; remainder 
        LDW Y,(1,SP) ; quotient 
        LDW (X),Y 
        ADDW SP,#2*CELLL ; drop quotient and DP from rstack 
        RET 



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;       M/MOD   ( d n -- r q )
;       Signed floored divide of double by
;       single. Return mod and quotient.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER MSMOD,5,"M/MOD"
        CALL	DUPP
        CALL	ZLESS
        CALL	DUPP
        CALL	TOR
        CALL	QBRAN
        .word	MMOD1
        CALL	NEGAT
        CALL	TOR
        CALL	DNEGA
        CALL	RFROM
MMOD1:	CALL	TOR
        CALL	DUPP
        CALL	ZLESS
        CALL	QBRAN
        .word	MMOD2
        CALL	RAT
        CALL	PLUS
MMOD2:	CALL	RFROM
        CALL	UMMOD
        CALL	RFROM
        CALL	QBRAN
        .word	MMOD3
        CALL	SWAPP
        CALL	NEGAT
        JP	SWAPP
MMOD3:	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       /MOD    ( n1 n2 -- r q )
;       Signed divide n1/n2. 
;       Return mod and quotient.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER SLMOD,4,"/MOD"
        LD A,(X)
        PUSH A   ; n2 sign 
        LD A,(2,X)
        PUSH A    ; n1 sign 
        CALL ABSS 
        CALL TOR  ; 
        CALL ABSS 
        CALL RAT   
        CALL USLMOD 
        LD A,(3,SP)
        OR A,(4,SP)
        JRPL SLMOD8 ; both positive nothing to change 
        LD A,(3,SP)
        XOR A,(4,SP)
        JRPL SLMOD1
; dividend and divisor are opposite sign          
        CALL NEGAT ; negative quotient
        CALL OVER 
        CALL ZEQUAL 
        _TBRAN SLMOD8 
        CALL ONEM   ; add one to quotient 
        CALL RAT 
        CALL ROT 
        CALL SUBB  ; corrected_remainder=divisor-remainder 
        CALL SWAPP
SLMOD1:
        LD A,(4,SP) ; divisor sign 
        JRPL SLMOD8 
        CALL TOR 
        CALL NEGAT ; if divisor negative negate remainder 
        CALL RFROM 
SLMOD8: 
        ADDW SP,#4 
        RET 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       MOD     ( n n -- r )
;       Signed divide. Return mod only.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER MODD,3,"MOD"
	CALL	SLMOD
	JP	DROP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       /       ( n n -- q )
;       Signed divide. Return quotient only.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER SLASH,1,"/"
        CALL	SLMOD
        CALL	SWAPP
        JP	DROP

;; Multiply

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       UM*     ( u1 u2 -- ud )
;       Unsigned multiply. Return 
;       double product.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER UMSTA,3,"UM*"
; stack have 4 bytes u1=a:b u2=c:d
        ;; bytes offset on data stack 
        da=2 
        db=3 
        dc=0 
        dd=1 
        ;;;;;; local variables ;;;;;;;;;
        ;; product bytes offset on return stack 
        UD1=1  ; ud bits 31..24
        UD2=2  ; ud bits 23..16
        UD3=3  ; ud bits 15..8 
        UD4=4  ; ud bits 7..0 
        ;; local variable for product set to zero   
        clrw y 
        pushw y  ; bits 15..0
        pushw y  ; bits 31..16 
        ld a,(db,x) ; b 
        ld yl,a 
        ld a,(dd,x)   ; d
        mul y,a    ; b*d  
        ldw (UD3,sp),y ; lowest weight product 
        ld a,(db,x)
        ld yl,a 
        ld a,(dc,x)
        mul y,a  ; b*c 
        ;;; do the partial sum 
        addw y,(UD2,sp)
        clr a 
        rlc a
        ld (UD1,sp),a 
        ldw (UD2,sp),y 
        ld a,(da,x)
        ld yl,a 
        ld a,(dd,x)
        mul y,a   ; a*d 
        ;; do partial sum 
        addw y,(UD2,sp)
        clr a 
        adc a,(UD1,sp)
        ld (UD1,sp),a  
        ldw (UD2,sp),y 
        ld a,(da,x)
        ld yl,a 
        ld a,(dc,x)
        mul y,a  ;  a*c highest weight product 
        ;;; do partial sum 
        addw y,(UD1,sp)
        ldw (x),y  ; udh 
        ldw y,(UD3,sp)
        ldw (2,x),y  ; udl  
        addw sp,#4 ; drop local variable 
        ret  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       *       ( n n -- n )
;       Signed multiply. Return 
;       single product.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER STAR,1,"*"
	CALL	UMSTA
	JP	DROP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       M*      ( n n -- d )
;       Signed multiply. Return 
;       double product.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER MSTAR,2,"M*"
        CALL	DDUP
        CALL	XORR
        CALL	ZLESS
        CALL	TOR
        CALL	ABSS
        CALL	SWAPP
        CALL	ABSS
        CALL	UMSTA
        CALL	RFROM
        CALL	QBRAN
        .word	MSTA1
        JP	DNEGA
MSTA1:	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       */MOD   ( n1 n2 n3 -- r q )
;       Multiply n1 and n2, then divide
;       by n3. Return mod and quotient.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER SSMOD,5,"*/MOD"
        CALL     TOR
        CALL     MSTAR
        CALL     RFROM
        JP     MSMOD

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       */      ( n1 n2 n3 -- q )
;       Multiply n1 by n2, then divide
;       by n3. Return quotient only.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER STASL,2,"*/"
        CALL	SSMOD
        CALL	SWAPP
        JP	DROP

;; Miscellaneous

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       2+   ( a -- a )
;       Add cell size in byte to address.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER CELLP,2,"2+"
        LDW Y,X
	LDW Y,(Y)
        ADDW Y,#CELLL 
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       2-   ( a -- a )
;       Subtract 2 from address.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER CELLM,2,"2-"
        LDW Y,X
	LDW Y,(Y)
        SUBW Y,#CELLL
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       2*   ( n -- n )
;       Multiply tos by 2.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER CELLS,2,"2*"
        LDW Y,X
	LDW Y,(Y)
        SLAW Y
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       1+      ( a -- a )
;       Add cell size in byte 
;       to address.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER ONEP,2,"1+"
        LDW Y,X
	LDW Y,(Y)
        INCW Y
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       1-      ( a -- a )
;       Subtract 2 from address.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER ONEM,2,"1-"
        LDW Y,X
	LDW Y,(Y)
        DECW Y
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  shift left n times 
; LSHIFT ( n1 n2 -- n1<<n2 )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER LSHIFT,6,"LSHIFT"
        ld a,(1,x)
        addw x,#CELLL 
        ldw y,x 
        ldw y,(y)
LSHIFT1:
        tnz a 
        jreq LSHIFT4 
        sllw y 
        dec a 
        jra LSHIFT1 
LSHIFT4:
        ldw (x),y 
        ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; shift right n times                 
; RSHIFT (n1 n2 -- n1>>n2 )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER RSHIFT,6,"RSHIFT"
        ld a,(1,x)
        addw x,#CELLL 
        ldw y,x 
        ldw y,(y)
RSHIFT1:
        tnz a 
        jreq RSHIFT4 
        srlw y 
        dec a 
        jra RSHIFT1 
RSHIFT4:
        ldw (x),y 
        ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       2/      ( n -- n )
;       divide  tos by 2.
;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER TWOSL,2,"2/"
        LDW Y,X
	LDW Y,(Y)
        SRAW Y
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       BL      ( -- 32 )
;       Return 32,  blank character.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER BLANK,2,"BL"
        SUBW X,#2
	LDW Y,#32
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;         0     ( -- 0)
;         Return 0.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER ZERO,1,"0"
        SUBW X,#2
	CLRW Y
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;         1     ( -- 1)
;         Return 1.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER ONE,1,"1"
        SUBW X,#2
	LDW Y,#1
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;         -1    ( -- -1)
;   Return -1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER MONE,2,"-1"
        SUBW X,#2
	LDW Y,#0xFFFF
        LDW (X),Y
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       >CHAR   ( c -- c )
;       Filter non-printing characters.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER TCHAR,5,">CHAR"
        ld a,(1,x)
        cp a,#32  
        jrmi 1$ 
        cp a,#127 
        jrpl 1$ 
        ret 
1$:     ld a,#'_ 
        ld (1,x),a 
        ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       DEPTH   ( -- n )
;       Return  depth of  data stack.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DEPTH,5,"DEPTH"
        LDW Y,SP0    ;save data stack ptr
	LDW XTEMP,X
        SUBW Y,XTEMP     ;#bytes = SP0 - X
        SRAW Y    ;Y = #stack items
	SUBW X,#2
        LDW (X),Y     ; if neg, underflow
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       PICK    ( ... +n -- ... w )
;       Copy  nth stack item to tos.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER PICK,4,"PICK"
        LDW Y,X   ;D = n1
        LDW Y,(Y)
; modified for standard compliance          
; 0 PICK must be equivalent to DUP 
        INCW Y 
        SLAW Y
        LDW XTEMP,X
        ADDW Y,XTEMP
        LDW Y,(Y)
        LDW (X),Y
        RET

;; Memory access

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       +!      ( n a -- )
;       Add n to  contents at 
;       address a.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER PSTOR,2,"+!"
        PUSHW X   ; R: DP 
        LDW Y,X 
        LDW X,(X) ; a 
        LDW Y,(2,Y)  ; n 
        PUSHW Y      ; R: DP n 
        LDW Y,X 
        LDW Y,(Y)
        ADDW Y,(1,SP) ; *a + n 
        LDW (X),Y 
        LDW X,(3,SP) ; DP
        ADDW X,#2*CELLL  ; ( n a -- )  
        ADDW SP,#2*CELLL ; R: DP n -- 
        RET 
                

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       2!      ( d a -- )
;       Store  double integer 
;       to address a.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DSTOR,2,"2!"
        LDW Y,X 
        PUSHW X 
        LDW X,(X) ; a 
        LDW Y,(2,Y) ; dhi 
        LDW (X),Y 
        LDW Y,(1,SP)  
        LDW Y,(4,Y) ; dlo 
        LDW (2,X),Y  
        POPW X 
        ADDW X,#3*CELLL 
        RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       2@      ( a -- d )
;       Fetch double integer 
;       from address a.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DAT,2,"2@"
        ldw y,x 
        subw x,#CELLL 
        ldw y,(y) ;address 
        pushw y  
        ldw y,(y) ; dhi 
        ldw (x),y 
        popw y 
        ldw y,(2,y) ; dlo 
        ldw (2,x),y 
        ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       COUNT   ( b -- b +n )
;       Return count byte of a string
;       and add 1 to byte address.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER COUNT,5,"COUNT"
        ldw y,x 
        ldw y,(y) ; address 
        ld a,(y)  ; count 
        incw y 
        ldw (x),y 
        subw x,#CELLL 
        ld (1,x),a 
        clr (x)
        ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       HERE    ( -- a )
;       Return  top of  variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER HERE,4,"HERE"
      	ldw y,#UVP 
        ldw y,(y)
        subw x,#CELLL 
        ldw (x),y 
        ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       PAD     ( -- a )
;       Return address of text buffer
;       above  code dictionary.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER PAD,3,"PAD"
        CALL     HERE
        _DOLIT   80
        JP     PLUS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       TIB     ( -- a )
;       Return address of 
;       terminal input buffer.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER TIB,3,"TIB"
        CALL     NTIB
        CALL     CELLP
        JP     AT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       @EXECUTE        ( a -- )
;       Execute vector stored in 
;       address a.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER ATEXE,8,"@EXECUTE"
        CALL     AT
        CALL     QDUP    ;?address or zero
        CALL     QBRAN
        .word      EXE1
        CALL     EXECU   ;execute if non-zero
EXE1:   RET     ;do nothing if zero

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       CMOVE   ( b1 b2 u -- )
;       Copy u bytes from b1 to b2.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER CMOVE,5,"CMOVE"
        ;;;;  local variables ;;;;;;;
        DP = 5
        YTMP = 3 
        CNT  = 1 
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        PUSHW X  ; R: DP  
        SUB SP,#2 ; R: DP YTMP 
        LDW Y,X 
        LDW Y,(Y) ; CNT 
        PUSHW Y  ; R: DP YTMP CNT
        LDW Y,X 
        LDW Y,(2,Y) ; b2, dest 
        LDW X,(4,X) ; b1, src 
        LDW (YTMP,SP),Y 
        CPW X,(YTMP,SP) 
        JRUGT CMOV2  ; src>dest 
; src<dest copy from top to bottom
        ADDW X,(CNT,SP)
        ADDW Y,(CNT,SP)
CMOV1:  
        LDW (YTMP,SP),Y 
        LDW Y,(CNT,SP)
        JREQ CMOV3 
        DECW Y 
        LDW (CNT,SP),Y 
        LDW Y,(YTMP,SP)
        DECW X
        LD A,(X)
        DECW Y 
        LD (Y),A 
        JRA CMOV1
; src>dest copy from bottom to top   
CMOV2: 
        LDW (YTMP,SP),Y 
        LDW Y,(CNT,SP)
        JREQ CMOV3
        DECW Y 
        LDW (CNT,SP),Y 
        LDW Y,(YTMP,SP)
        LD A,(X)
        INCW X 
        LD (Y),A 
        INCW Y 
        JRA CMOV2 
CMOV3:
        LDW X,(DP,SP)
        ADDW X,#3*CELLL 
        ADDW SP,#3*CELLL 
        RET 
        

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       FILL    ( b u c -- )
;       Fill u bytes of character c
;       to area beginning at b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER FILL,4,"FILL"
        LD A,(1,X)
        LDW Y,X 
        ADDW X,#3*CELLL 
        PUSHW X ; R: DP 
        LDW X,Y 
        LDW X,(4,X) ; b
        LDW Y,(2,Y) ; u
FILL0:
        JREQ FILL1
        LD (X),A 
        INCW X 
        DECW Y 
        JRA FILL0         
FILL1: POPW X 
        RET         
        

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       ERASE   ( b u -- )
;       Erase u bytes beginning at b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER ERASE,5,"ERASE"
        clrw y 
        subw x,#CELLL 
        ldw (x),y 
        jp FILL 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       PACK0   ( b u a -- a )
;       Build a counted string with
;       u characters from b. Null fill.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER PACKS,5,"PACK0"
        CALL     DUPP
        CALL     TOR     ;strings only on cell boundary
        CALL     DDUP
        CALL     CSTOR
        CALL     ONEP ;save count
        CALL     SWAPP
        CALL     CMOVE
        CALL     RFROM
        RET

;; Numeric output, single precision

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       DIGIT   ( u -- c )
;       Convert digit u to a character.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DIGIT,5,"DIGIT"
        CALL	DOLIT
        .word	9
        CALL	OVER
        CALL	LESS
        CALL	DOLIT
        .word	7
        CALL	ANDD
        CALL	PLUS
        CALL	DOLIT
        .word	48	;'0'
        JP	PLUS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       EXTRACT ( n base -- n c )
;       Extract least significant 
;       digit from n.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER EXTRC,7,"EXTRACT"
        CALL     ZERO
        CALL     SWAPP
        CALL     UMMOD
        CALL     SWAPP
        JP     DIGIT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       <#      ( -- )
;       Initiate  numeric 
;       output process.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER BDIGS,2,"#<"
        CALL     PAD
        CALL     HLD
        JP     STORE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       HOLD    ( c -- )
;       Insert a character 
;       into output string.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER HOLD,4,"HOLD"
        CALL     HLD
        CALL     AT
        CALL     ONEM
        CALL     DUPP
        CALL     HLD
        CALL     STORE
        JP     CSTOR

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       #       ( u -- u )
;       Extract one digit from u and
;       append digit to output string.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DIG,1,"#"
        CALL     BASE
        CALL     AT
        CALL     EXTRC
        JP     HOLD

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       #S      ( u -- 0 )
;       Convert u until all digits
;       are added to output string.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DIGS,2,"#S"
DIGS1:  CALL     DIG
        CALL     DUPP
        CALL     QBRAN
        .word      DIGS2
        JRA     DIGS1
DIGS2:  RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       SIGN    ( n -- )
;       Add a minus sign to
;       numeric output string.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER SIGN,4,"SIGN"
        CALL     ZLESS
        CALL     QBRAN
        .word      SIGN1
        CALL     DOLIT
        .word      45	;"-"
        JP     HOLD
SIGN1:  RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       #>      ( w -- b u )
;       Prepare output string.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER EDIGS,2,"#>"
        CALL     DROP
        CALL     HLD
        CALL     AT
        CALL     PAD
        CALL     OVER
        JP     SUBB

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       str     ( w -- b u )
;       Convert a signed integer
;       to a numeric string.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER STR,3,"STR"
        CALL     DUPP
        CALL     TOR
        CALL     ABSS
        CALL     BDIGS
        CALL     DIGS
        CALL     RFROM
        CALL     SIGN
        JP     EDIGS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       HEX     ( -- )
;       Use radix 16 as base for
;       numeric conversions.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER HEX,3,"HEX"
        CALL     DOLIT
        .word      16
        CALL     BASE
        JP     STORE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       DECIMAL ( -- )
;       Use radix 10 as base
;       for numeric conversions.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DECIM,7,"DECIMAL"
        CALL     DOLIT
        .word      10
        CALL     BASE
        JP     STORE

;; Numeric input, single precision

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       DIGIT?  ( c base -- u t )
;       Convert a character to its numeric
;       value. A flag indicates success.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DIGTQ,6,"DIGIT?"
        CALL     TOR
        CALL     DOLIT
        .word     48	; "0"
        CALL     SUBB
        CALL     DOLIT
        .word      9
        CALL     OVER
        CALL     LESS
        CALL     QBRAN
        .word      DGTQ1
        CALL     DOLIT
        .word      7
        CALL     SUBB
        CALL     DUPP
        CALL     DOLIT
        .word      10
        CALL     LESS
        CALL     ORR
DGTQ1:  CALL     DUPP
        CALL     RFROM
        JP     ULESS

.if  WANT_DOUBLE  
.iff 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; get all digits in row 
; stop at first non-digit or end of string
; ( n a cntr -- n  a+ cntr-  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
parse_digits:
    CALL DUPP 
    _QBRAN 5$  
    CALL TOR   ; n a R: cntr 
1$: CALL COUNT ; n a+ char 
    CALL BASE 
    CALL AT 
    CALL DIGTQ 
    _QBRAN 4$ ; not a digit
    CALL ROT 
    CALL BASE 
    CALL AT 
    CALL STAR
    CALL PLUS
    CALL SWAPP  
    CALL RFROM  ; n a+ cntr 
    CALL ONEM 
    JRA parse_digits ; n a+ cntr  
4$: ; n a+ char R: cntr 
    LDW Y,X 
    LDW Y,(2,Y)
    DECW Y  ; dec(a)
    LDW (2,X),Y 
    POPW Y 
    LDW (X),Y ; n a cntr  
5$:
    RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       NUMBER? ( a -- n T | a F )
;       Convert a number string to
;       integer. Push a flag on tos.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER NUMBQ,7,"NUMBER?"
; save BASE
        CALL     BASE
        CALL     AT
        CALL     TOR
        CALL     ZERO
        CALL     OVER
        CALL     COUNT ; string length,  a 0 a+ cnt 
;  check hexadecimal character        
        CALL     OVER           ; a 0 a+ cnt a+ 
        CALL     CAT
        _DOLIT   '$'  ; hex?    ; a 0 a+ cnt char '$'
        CALL     EQUAL
        _QBRAN   NUMQ1
        CALL     HEX
        CALL     SWAPP
        CALL     ONEP
        CALL     SWAPP
        CALL     ONEM
; check for negative sign         
NUMQ1:  CALL     OVER
        CALL     CAT
        _DOLIT   '-'
        CALL     EQUAL
        CALL     TOR    ; a 0 a+ cnt R: base sign 
; update address and count 
        CALL     SWAPP
        CALL     RAT
        CALL     SUBB
        CALL     SWAPP
        CALL     RAT
        CALL     PLUS  ; a 0 a+ cnt- R: base sign 
        CALL     QDUP
        _QBRAN   NUMQ4  ; end of string  a 0 a+ R: base sign 
        CALL     parse_digits ; a 0 a+ cntr- -- a n a+ cntr-  R: base sign 
        CALL     DUPP   ; a n a+ cnt cnt -- R: base sign  
        _TBRAN   NUMQ6
        CALL     DDROP   ; a n  R: base sign  
        CALL     RFROM   ; a n sign R: base 
        _QBRAN   NUMQ3
        CALL     NEGAT ; a n R: base 
NUMQ3:  CALL     SWAPP
        LDW  Y, #-1 
        LDW (X),Y     ; n -1 R: base 
        JRA      NUMQ9
NUMQ4:  CALL     RFROM
        CALL     DDROP
        JRA      NUMQ9 
NUMQ6:  
.if WANT_FLOAT24 
.ift 
        CALL     RFROM ; a n a+ cnt sign R: base 
        CALL     FLOATQ  
.iff
        ADDW SP,#CELLL ; remove sign from rstack 
        ADDW  X,#2*CELLL ; drop a+ cnt S: a n  R: sign 
        CLRW Y  
        LDW (X),Y  ;  a 0 R: base 
.endif 
; restore BASE 
NUMQ9: 
        CALL     RFROM
        CALL     BASE
        JP       STORE
.endif ; WANT_DOUBLE   

;; Basic I/O

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       KEY     ( -- c )
;       Wait for and return an
;       input character.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER KEY,3,"KEY"
        btjf UART_SR,#UART_SR_RXNE,. 
        ld a,UART_DR 
        subw x,#CELLL 
        ld (1,x),a 
        clr (x)
        ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       NUF?    ( -- t )
;       Return false if no input,
;       else pause and if CR return true.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER NUFQ,4,"NUF?"
        CALL     QKEY
        CALL     DUPP
        CALL     QBRAN
        .word    NUFQ1
        CALL     DDROP
        CALL     KEY
        CALL     DOLIT
        .word      CRR
        JP     EQUAL
NUFQ1:  RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       SPACE   ( -- )
;       Send  blank character to
;       output device.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER SPACE,5,"SPACE"
        CALL     BLANK
        JP     EMIT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       SPACES  ( +n -- )
;       Send n spaces to output device.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER SPACS,6,"SPACES"
        CALL     ZERO
        CALL     MAX
        CALL     TOR
        JRA      CHAR2
CHAR1:  CALL     SPACE
CHAR2:  CALL     DONXT
        .word    CHAR1
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       TYPE    ( b u -- )
;       Output u characters from b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER TYPES,4,"TYPE"
        CALL     TOR
        JRA     TYPE2
TYPE1:  CALL     COUNT 
        CALL     EMIT
TYPE2:  _DONXT  TYPE1
        _DROP
        RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       CR      ( -- )
;       Output a carriage return
;       and a line feed.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER CR,2,"CR"
        _DOLIT  CRR 
        CALL    EMIT
        _DOLIT  LF
        JP      EMIT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       do$     ( -- a )
;       Return  address of a compiled
;       string.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       _HEADER DOSTR,COMPO+3,"DO$"
DOSTR:
        CALL     RFROM
        CALL     RAT
        CALL     RFROM
        CALL     COUNT
        CALL     PLUS
        CALL     TOR
        CALL     SWAPP
        CALL     TOR
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       $"|     ( -- a )
;       Run time routine compiled by $".
;       Return address of a compiled string.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       _HEADER STRQP,COMPO+3,"$\"|"
STRQP:
        CALL     DOSTR
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       ."|     ( -- )
;       Run time routine of ." .
;       Output a compiled string.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       _HEADER DOTQP,COMPO+3,".\"|"
DOTQP:
        CALL     DOSTR
        CALL     COUNT
        JP     TYPES

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       .R      ( n +n -- )
;       Display an integer in a field
;       of n columns, right justified.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DOTR,2,".R"
        CALL     TOR
        CALL     STR
        CALL     RFROM
        CALL     OVER
        CALL     SUBB
        CALL     SPACS
        JP     TYPES

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       U.R     ( u +n -- )
;       Display an unsigned integer
;       in n column, right justified.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER UDOTR,3,"U.R"
        CALL     TOR
        CALL     BDIGS
        CALL     DIGS
        CALL     EDIGS
        CALL     RFROM
        CALL     OVER
        CALL     SUBB
        CALL     SPACS
        JP     TYPES

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       U.      ( u -- )
;       Display an unsigned integer
;       in free format.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER UDOT,2,"U."
        CALL     BDIGS
        CALL     DIGS
        CALL     EDIGS
        CALL     SPACE
        JP     TYPES

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   H. ( n -- )
;   display n in hexadecimal 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER HDOT,2,"H."
        CALL BASE 
        CALL AT 
        CALL TOR 
        CALL HEX 
        CALL UDOT 
        CALL RFROM 
        CALL BASE 
        JP STORE 
         

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       .       ( w -- )
;       Display an integer in free
;       format, preceeded by a space.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DOT,1,"."
        CALL     BASE
        CALL     AT
        CALL     DOLIT
        .word      10
        CALL     XORR    ;?decimal
        CALL     QBRAN
        .word      DOT1
        JRA     UDOT
DOT1:   CALL     STR
        CALL     SPACE
        JP     TYPES

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       ?       ( a -- )
;       Display contents in memory cell.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER QUEST,1,"?"
        CALL     AT
        JRA     DOT

;; Parsing

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       parse   ( b u c -- b u delta ; <string> )
;       Scan string delimited by c.
;       Return found string and its offset.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER PARS,5,"PARS$"
        CALL     TEMP
        CALL     STORE
        CALL     OVER
        CALL     TOR
        CALL     DUPP
        CALL     QBRAN
        .word    PARS8
        CALL     ONEM
        CALL     TEMP
        CALL     AT
        CALL     BLANK
        CALL     EQUAL
        CALL     QBRAN
        .word      PARS3
        CALL     TOR
PARS1:  CALL     BLANK
        CALL     OVER
        CALL     CAT     ;skip leading blanks ONLY
        CALL     SUBB
        CALL     ZLESS
        CALL     INVER
        CALL     QBRAN
        .word      PARS2
        CALL     ONEP
        CALL     DONXT
        .word      PARS1
        CALL     RFROM
        CALL     DROP
        CALL     ZERO
        JP     DUPP
PARS2:  CALL     RFROM
PARS3:  CALL     OVER
        CALL     SWAPP
        CALL     TOR
PARS4:  CALL     TEMP
        CALL     AT
        CALL     OVER
        CALL     CAT
        CALL     SUBB    ;scan for delimiter
        CALL     TEMP
        CALL     AT
        CALL     BLANK
        CALL     EQUAL
        CALL     QBRAN
        .word      PARS5
        CALL     ZLESS
PARS5:  CALL     QBRAN
        .word      PARS6
        CALL     ONEP
        CALL     DONXT
        .word      PARS4
        CALL     DUPP
        CALL     TOR
        JRA     PARS7
PARS6:  CALL     RFROM
        CALL     DROP
        CALL     DUPP
        CALL     ONEP
        CALL     TOR
PARS7:  CALL     OVER
        CALL     SUBB
        CALL     RFROM
        CALL     RFROM
        JP     SUBB
PARS8:  CALL     OVER
        CALL     RFROM
        JP     SUBB

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       PARSE   ( c -- b u ; <string> )
;       Scan input stream and return
;       counted string delimited by c.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER PARSE,5,"PARSE"
        CALL     TOR
        CALL     TIB
        CALL     INN
        CALL     AT
        CALL     PLUS    ;current input buffer pointer
        CALL     NTIB
        CALL     AT
        CALL     INN
        CALL     AT
        CALL     SUBB    ;remaining count
        CALL     RFROM
        CALL     PARS
        CALL     INN
        JP     PSTOR

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       .(      ( -- )
;       Output following string up to next ) .
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DOTPR,IMEDD+2,".("
        CALL     DOLIT
        .word     41	; ")"
        CALL     PARSE
        JP     TYPES

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       (       ( -- )
;       Ignore following string up to next ).
;       A comment.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER PAREN,IMEDD+1,"("
        CALL     DOLIT
        .word     41	; ")"
        CALL     PARSE
        JP     DDROP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       \       ( -- )
;       Ignore following text till
;       end of line.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER BKSLA,IMEDD+1,"\\"
        ldw y,#UCTIB ; #TIB  
        ldw y,(y)
        pushw y ; count in TIB 
        ldw y,#UINN ; >IN 
        ldw YTEMP,y
        popw y 
        ldw [YTEMP],y
        ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       WORD    ( c -- a ; <string> )
;       Parse a word from input stream
;       and copy it to code dictionary.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER WORDD,4,"WORD"
        CALL     PARSE
        CALL     HERE
        CALL     CELLP
.IF CASE_SENSE 
        JP      PACKS 
.ELSE                 
        CALL     PACKS
; uppercase TOKEN 
        CALL    DUPP 
        CALL    COUNT 
        CALL    TOR 
        CALL    BRAN 
        .word   UPPER2  
UPPER:
        CALL    DUPP 
        CALL    CAT
        CALL    DUPP 
        CALL   DOLIT
        .word   'a' 
        CALL    DOLIT
        .word   'z'+1 
        CALL   WITHI 
        CALL   QBRAN
        .word  UPPER1  
        CALL    DOLIT 
        .word   0xDF 
        CALL    ANDD 
UPPER1:
        CALL    OVER 
        CALL    CSTOR          
        CALL    ONEP 
UPPER2: 
        CALL    DONXT
        .word   UPPER  
        CALL    DROP  
        RET 
.ENDIF 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       TOKEN   ( -- a ; <string> )
;       Parse a word from input stream
;       and copy it to name dictionary.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER TOKEN,5,"TOKEN"
        CALL     BLANK
        JP     WORDD

;; Dictionary search

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       NAME>   ( na -- ca )
;       Return a code address given
;       a name address.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER NAMET,5,"NAME>"
        CALL     COUNT
        CALL     DOLIT
        .word      31
        CALL     ANDD
        JP     PLUS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       SAME?   ( a a u -- a a f \ -0+ )
;       Compare u cells in two
;       strings. Return 0 if identical.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER SAMEQ,5,"SAME?"
        CALL     ONEM
        CALL     TOR
        JRA     SAME2
SAME1:  CALL     OVER
        CALL     RAT
        CALL     PLUS
        CALL     CAT
        CALL     OVER
        CALL     RAT
        CALL     PLUS
        CALL     CAT
        CALL     SUBB
        CALL     QDUP
        CALL     QBRAN
        .word      SAME2
        CALL     RFROM
        JP     DROP
SAME2:  CALL     DONXT
        .word      SAME1
        JP     ZERO

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       find    ( a va -- ca na | a F )
;       Search vocabulary for string.
;       Return ca and na if succeeded.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER FIND,4,"FIND"
        CALL     SWAPP
        CALL     DUPP
        CALL     CAT
        CALL     TEMP
        CALL     STORE
        CALL     DUPP
        CALL     AT
        CALL     TOR
        CALL     CELLP
        CALL     SWAPP
FIND1:  CALL     AT
        CALL     DUPP
        CALL     QBRAN
        .word      FIND6
        CALL     DUPP
        CALL     AT
        CALL     DOLIT
        .word      MASKK
        CALL     ANDD
        CALL     RAT
        CALL     XORR
        CALL     QBRAN
        .word      FIND2
        CALL     CELLP
        CALL     DOLIT
        .word     0xFFFF
        JRA     FIND3
FIND2:  CALL     CELLP
        CALL     TEMP
        CALL     AT
        CALL     SAMEQ
FIND3:  CALL     BRAN
        .word      FIND4
FIND6:  CALL     RFROM
        CALL     DROP
        CALL     SWAPP
        CALL     CELLM
        JP     SWAPP
FIND4:  CALL     QBRAN
        .word      FIND5
        CALL     CELLM
        CALL     CELLM
        JRA     FIND1
FIND5:  CALL     RFROM
        CALL     DROP
        CALL     SWAPP
        CALL     DROP
        CALL     CELLM
        CALL     DUPP
        CALL     NAMET
        JP     SWAPP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       NAME?   ( a -- ca na | a F )
;       Search vocabularies for a string.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER NAMEQ,5,"NAME?"
        CALL   CNTXT
        JP     FIND

;; Terminal response

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       ^H      ( bot eot cur -- bot eot cur )
;       Backup cursor by one character.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER BKSP,2,"^H"
        CALL     TOR
        CALL     OVER
        CALL     RFROM
        CALL     SWAPP
        CALL     OVER
        CALL     XORR
        CALL     QBRAN
        .word      BACK1
        CALL     DOLIT
        .word      BKSPP
        CALL     EMIT
        CALL     ONEM
        CALL     BLANK
        CALL     EMIT
        CALL     DOLIT
        .word      BKSPP
        JP     EMIT
BACK1:  RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       TAP    ( bot eot cur c -- bot eot cur )
;       Accept and echo key stroke
;       and bump cursor.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER TAP,3,"TAP"
        CALL     DUPP
        CALL     EMIT
        CALL     OVER
        CALL     CSTOR
        JP     ONEP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       kTAP    ( bot eot cur c -- bot eot cur )
;       Process a key stroke,
;       CR,LF or backspace.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER KTAP,4,"KTAP"
        CALL     DUPP
        CALL     DOLIT
.if EOL_CR
        .word   CRR
.else ; EOL_LF 
        .word   LF
.endif 
        CALL     XORR
        CALL     QBRAN
        .word      KTAP2
        CALL     DOLIT
        .word      BKSPP
        CALL     XORR
        CALL     QBRAN
        .word      KTAP1
        CALL     BLANK
        JP     TAP
KTAP1:  JP     BKSP
KTAP2:  CALL     DROP
        CALL     SWAPP
        CALL     DROP
        JP     DUPP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       accept  ( b u -- b u )
;       Accept characters to input
;       buffer. Return with actual count.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER ACCEP,6,"ACCEPT"
        CALL     OVER
        CALL     PLUS
        CALL     OVER
ACCP1:  CALL     DDUP
        CALL     XORR
        CALL     QBRAN
        .word      ACCP4
        CALL     KEY
        CALL     DUPP
        CALL     BLANK
        CALL     DOLIT
        .word      127
        CALL     WITHI
        CALL     QBRAN
        .word      ACCP2
        CALL     TAP
        JRA     ACCP3
ACCP2:  CALL     KTAP
ACCP3:  JRA     ACCP1
ACCP4:  CALL     DROP
        CALL     OVER
        JP     SUBB

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       QUERY   ( -- )
;       Accept input stream to
;       terminal input buffer.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER QUERY,5,"QUERY"
        CALL     TIB
        CALL     DOLIT
        .word      80
        CALL     ACCEP
        CALL     NTIB
        CALL     STORE
        CALL     DROP
        CALL     ZERO
        CALL     INN
        JP     STORE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       ABORT   ( -- )
;       Reset data stack and
;       jump to QUIT.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER ABORT,5,"ABORT"
        CALL     PRESE
        JP     QUIT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       abort"  ( f -- )
;       Run time routine of ABORT".
;       Abort with a message.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER ABORQ,COMPO+6,'ABORT"'
        CALL     QBRAN
        .word      ABOR2   ;text flag
        CALL     DOSTR
ABOR1:  CALL     SPACE
        CALL     COUNT
        CALL     TYPES
        CALL     DOLIT
        .word     63 ; "?"
        CALL     EMIT
        CALL     CR
        JP     ABORT   ;pass error string
ABOR2:  CALL     DOSTR
        JP     DROP

;; The text interpreter

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       $INTERPRET      ( a -- )
;       Interpret a word. If failed,
;       try to convert it to an integer.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER INTER,10,"$INTERPRET"
        CALL     NAMEQ
        CALL     QDUP    ;?defined
        CALL     QBRAN
        .word      INTE1
        CALL     AT
        CALL     DOLIT
	.word       0x4000	; COMPO*256
        CALL     ANDD    ;?compile only lexicon bits
        CALL     ABORQ
        .byte      13
        .ascii     " compile only"
        JP      EXECU
INTE1:  
        CALL     NUMBQ   ;convert a number
        CALL     QBRAN
        .word    ABOR1
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       [       ( -- )
;       Start  text interpreter.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER LBRAC,IMEDD+1,"["
        CALL   DOLIT
        .word  INTER
        CALL   TEVAL
        JP     STORE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       .OK     ( -- )
;       Display 'ok' while interpreting.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DOTOK,3,".OK"
        CALL     DOLIT
        .word      INTER
        CALL     TEVAL
        CALL     AT
        CALL     EQUAL
        CALL     QBRAN
        .word      DOTO1
        CALL     DOTQP
        .byte      3
        .ascii     " ok"
DOTO1:  JP     CR

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       ?STACK  ( -- )
;       Abort if stack underflows.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER QSTAC,6,"?STACK"
        CALL     DEPTH
        CALL     ZLESS   ;check only for underflow
        CALL     ABORQ
        .byte      11
        .ascii     " underflow "
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       EVAL    ( -- )
;       Interpret  input stream.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER EVAL,4,"EVAL"
EVAL1:  CALL     TOKEN
        CALL     DUPP
        CALL     CAT     ;?input stream empty
        CALL     QBRAN
        .word    EVAL2
        CALL     TEVAL
        CALL     ATEXE
        CALL     QSTAC   ;evaluate input, check stack
        JRA     EVAL1 
EVAL2:  CALL     DROP
        JP       DOTOK

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       PRESET  ( -- )
;       Reset data stack pointer and
;       terminal input buffer.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER PRESE,6,"PRESET"
        CALL     DOLIT
        .word      SPP
        CALL     SPSTO
        CALL     DOLIT
        .word      TIBB
        CALL     NTIB
        CALL     CELLP
        JP     STORE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       QUIT    ( -- )
;       Reset return stack pointer
;       and start text interpreter.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER QUIT,4,"QUIT"
        CALL     DOLIT
        .word      RPP
        CALL     RPSTO   ;reset return stack pointer
QUIT1:  CALL     LBRAC   ;start interpretation
QUIT2:  CALL     QUERY   ;get input
        CALL     EVAL
        JRA     QUIT2   ;continue till error

;; The compiler

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       '       ( -- ca )
;       Search vocabularies for
;       next word in input stream.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER TICK,1,"'"
        CALL     TOKEN
        CALL     NAMEQ   ;?defined
        CALL     QBRAN
        .word      ABOR1
        RET     ;yes, push code address

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       ALLOT   ( n -- )
;       Allocate n bytes to RAM 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER ALLOT,5,"ALLOT"
        CALL     VPP
; must update APP_VP each time VP is modidied
        call PSTOR 
        jp UPDATVP 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       ,       ( w -- )
;         Compile an integer into
;         variable space.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER COMMA,1,^/"\,"/
        CALL     HERE
        CALL     DUPP
        CALL     CELLP   ;cell boundary
        CALL     VPP
        CALL     STORE
        JP     STORE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       C,      ( c -- )
;       Compile a byte into
;       variables space.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER CCOMMA,2,^/"C,"/
        CALL     HERE
        CALL     DUPP
        CALL     ONEP
        CALL     VPP
        CALL     STORE
        JP     CSTOR

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       [COMPILE]       ( -- ; <string> )
;       Compile next immediate
;       word into code dictionary.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER BCOMP,COMPO+IMEDD+9,"[COMPILE]"
        CALL     TICK
        JP     JSRC

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       COMPILE ( -- )
;       Compile next jsr in
;       colon list to code dictionary.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER COMPI,COMPO+7,"COMPILE"
        CALL     RFROM
        CALL     DUPP
        CALL     AT
        CALL     JSRC    ;compile subroutine
        CALL     CELLP
        ldw y,x 
        ldw y,(y)
        addw x,#CELLL 
        jp (y)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       LITERAL ( w -- )
;       Compile tos to dictionary
;       as an integer literal.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER LITER,COMPO+IMEDD+7,"LITERAL"
        CALL     COMPI
        .word DOLIT 
        JP     COMMA

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       $,"     ( -- )
;       Compile a literal string
;       up to next " .
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;        _HEADER STRCQ,3,^/'$,"'/
STRCQ:
        CALL     DOLIT
        .word     34	; "
        CALL     PARSE
        CALL     HERE
        CALL     PACKS   ;string to code dictionary
        CALL     COUNT
        CALL     PLUS    ;calculate aligned end of string
        CALL     VPP
        JP     STORE

;; Structures

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       FOR     ( -- a )
;       Start a FOR-NEXT loop
;       structure in a colon definition.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER FOR,COMPO+IMEDD+3,"FOR"
        CALL     COMPI
        .word TOR 
        JP     HERE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       NEXT    ( a -- )
;       Terminate a FOR-NEXT loop.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER NEXT,COMPO+IMEDD+4,"NEXT"
        CALL     COMPI
        .word DONXT 
        call ADRADJ
        JP     COMMA

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       I ( -- n )
;       stack COUNTER
;       of innermost FOR-NEXT  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER IFETCH,1,"I"
        subw x,#CELLL 
        ldw y,(3,sp)
        ldw (x),y 
        ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       J ( -- n )
;   stack COUNTER
;   of outer FOR-NEXT  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER JFETCH,1,"J"
        SUBW X,#CELLL 
        LDW Y,(5,SP)
        LDW (X),Y 
        RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       BEGIN   ( -- a )
;       Start an infinite or
;       indefinite loop structure.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER BEGIN,COMPO+IMEDD+5,"BEGIN"
        JP     HERE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       UNTIL   ( a -- )
;       Terminate a BEGIN-UNTIL
;       indefinite loop structure.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER UNTIL,COMPO+IMEDD+5,"UNTIL"
        CALL     COMPI
        .word    QBRAN 
        call ADRADJ
        JP     COMMA

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       AGAIN   ( a -- )
;       Terminate a BEGIN-AGAIN
;       infinite loop structure.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER AGAIN,COMPO+IMEDD+5,"AGAIN"
.if OPTIMIZE 
        _DOLIT JPIMM 
        CALL  CCOMMA
.else 
        CALL     COMPI
        .word BRAN
.endif 
        call ADRADJ 
        JP     COMMA

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       IF      ( -- A )
;       Begin a conditional branch.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER IFF,COMPO+IMEDD+2,"IF"
        CALL     COMPI
        .word QBRAN
        CALL     HERE
        CALL     ZERO
        JP     COMMA

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       THEN        ( A -- )
;       Terminate a conditional 
;       branch structure.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER THENN,COMPO+IMEDD+4,"THEN"
        CALL     HERE
        call ADRADJ 
        CALL     SWAPP
        JP     STORE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       ELSE        ( A -- A )
;       Start the false clause in 
;       an IF-ELSE-THEN structure.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER ELSEE,COMPO+IMEDD+4,"ELSE"
.if OPTIMIZE 
        _DOLIT JPIMM 
        CALL CCOMMA 
.else 
         CALL     COMPI
        .word BRAN
.endif 
        CALL     HERE
        CALL     ZERO
        CALL     COMMA
        CALL     SWAPP
        CALL     HERE
        call ADRADJ 
        CALL     SWAPP
        JP     STORE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       AHEAD       ( -- A )
;       Compile a forward branch
;       instruction.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER AHEAD,COMPO+IMEDD+5,"AHEAD"
.if OPTIMIZE 
        _DOLIT JPIMM 
        CALL CCOMMA
.else 
        CALL     COMPI
        .word BRAN
.endif 
        CALL     HERE
        CALL     ZERO
        JP     COMMA

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       WHILE       ( a -- A a )
;       Conditional branch out of a 
;       BEGIN-WHILE-REPEAT loop.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER WHILE,COMPO+IMEDD+5,"WHILE"
        CALL     COMPI
        .word QBRAN
        CALL     HERE
        CALL     ZERO
        CALL     COMMA
        JP     SWAPP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       REPEAT      ( A a -- )
;       Terminate a BEGIN-WHILE-REPEAT 
;       indefinite loop.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER REPEA,COMPO+IMEDD+6,"REPEAT"
.if OPTIMIZE 
        _DOLIT JPIMM 
        CALL  CCOMMA
.else 
        CALL     COMPI
        .word BRAN
.endif 
        call ADRADJ 
        CALL     COMMA
        CALL     HERE
        call ADRADJ 
        CALL     SWAPP
        JP     STORE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       AFT         ( a -- a A )
;       Jump to THEN in a FOR-AFT-THEN-NEXT 
;       loop the first time through.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER AFT,COMPO+IMEDD+3,"AFT"
        CALL     DROP
        CALL     AHEAD
        CALL     HERE
        JP     SWAPP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       ABORT"      ( -- ; <string> )
;       Conditional abort with an error message.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER ABRTQ,IMEDD+6,'ABORT"'
        CALL     COMPI
        .word ABORQ
        JP     STRCQ

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       $"     ( -- ; <string> )
;       Compile an inline string literal.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER STRQ,IMEDD+COMPO+2,'$"'
        CALL     COMPI
        .word STRQP 
        JP     STRCQ

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       ."          ( -- ; <string> )
;       Compile an inline string literal 
;       to be typed out at run time.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DOTQ,IMEDD+COMPO+2,'."'
        CALL     COMPI
        .word DOTQP 
        JP     STRCQ

;; Name compiler

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       ?UNIQUE ( a -- a )
;       Display a warning message
;       if word already exists.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER UNIQU,7,"?UNIQUE"
        CALL     DUPP
        CALL     NAMEQ   ;?name exists
        CALL     QBRAN
        .word      UNIQ1
        CALL     DOTQP   ;redef are OK
        .byte       7
        .ascii     " reDef "       
        CALL     OVER
        CALL     COUNT
        CALL     TYPES   ;just in case
UNIQ1:  JP     DROP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       $,n     ( na -- )
;       Build a new dictionary name
;       using string at na.
; compile dans l'espace des variables 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;        _HEADER SNAME,3,^/"$,n"/
SNAME: 
        CALL     DUPP
        CALL     CAT     ;?null input
        CALL     QBRAN
        .word      PNAM1
        CALL     UNIQU   ;?redefinition
        CALL     DUPP
        CALL     COUNT
        CALL     PLUS
        CALL     VPP
        CALL     STORE
        CALL     DUPP
        CALL     LAST
        CALL     STORE   ;save na for vocabulary link
        CALL     CELLM   ;link address
        CALL     CNTXT
        CALL     AT
        CALL     SWAPP
        CALL     STORE
        RET     ;save code pointer
PNAM1:  CALL     STRQP
        .byte      5
        .ascii     " name" ;null input
        JP     ABOR1

;; FORTH compiler

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       $COMPILE        ( a -- )
;       Compile next word to
;       dictionary as a token or literal.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER SCOMP,8,"$COMPILE"
        CALL     NAMEQ
        CALL     QDUP    ;?defined
        CALL     QBRAN
        .word      SCOM2
        CALL     AT
        CALL     DOLIT
        .word     0x8000	;  IMEDD*256
        CALL     ANDD    ;?immediate
        CALL     QBRAN
        .word      SCOM1
        JP     EXECU
SCOM1:  JP     JSRC
SCOM2:  CALL     NUMBQ   ;try to convert to number 
        CALL    QDUP  
        CALL     QBRAN
        .word      ABOR1
.if WANT_DOUBLE 
        _DOLIT  -1
        CALL    EQUAL
        _QBRAN DLITER
        JP  LITER 
.endif 
.if WANT_FLOAT24 
        _DOLIT -1 
        CALL EQUAL 
        _QBRAN FLITER
        JP  LITER  
.endif 
        _DROP 
        JP     LITER


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       OVERT   ( -- )
;       Link a new word into vocabulary.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER OVERT,5,"OVERT"
        CALL     LAST
        CALL     AT
        CALL     CNTXT
        JP     STORE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       ;       ( -- )
;       Terminate a colon definition.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER SEMIS,IMEDD+COMPO+1,^/";"/
.if OPTIMIZE ; more compact and faster
        call DOLIT 
        .word 0x81   ; opcode for RET 
        call CCOMMA 
.else
        CALL     COMPI
        .word EXIT 
.endif 
        CALL     LBRAC
        call OVERT 
        CALL FMOVE
        call QDUP 
        call QBRAN 
        .word SET_RAMLAST 
        CALL UPDATPTR
        RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       Terminate an ISR definition 
;       retourn ca of ISR as double
;       I; ( -- ud )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
       _HEADER ISEMI,2+IMEDD+COMPO,^/"I;"/
        subw x,#CELLL  
        ldw y,#IRET_CODE 
        ldw (x),y 
        call CCOMMA
        call LBRAC 
        call IFMOVE
        call QDUP 
        CALL QBRAN 
        .word SET_RAMLAST
        CALL CPP
        call AT 
        call SWAPP 
        CALL CPP 
        call STORE 
        call UPDATCP 
        call EEPVP 
        _DROP 
        call AT 
        call VPP 
        call STORE 
        jp ZERO
        ret           
        
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       ]       ( -- )
;       Start compiling words in
;       input stream.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER RBRAC,1,"]"
        CALL   DOLIT
        .word  SCOMP
        CALL   TEVAL
        JP     STORE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       CALL,    ( ca -- )
;       Compile a subroutine call.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER JSRC,5,^/"CALL,"/
.if OPTIMIZE 
;;;;; optimization code ;;;;;;;;;;;;;;;
        LDW Y,#DROP 
        LDW YTEMP,Y 
        LDW Y,X 
        LDW Y,(Y)
        CPW Y,YTEMP 
        JRNE JSRC1         
; replace CALL DROP BY  ADDW X,#CELLL 
        ADDW X,#CELLL 
        _DOLIT ADDWX ; opcode 
        CALL   CCOMMA 
        _DOLIT CELLL 
        JP      COMMA 
JSRC1: ; check for DDROP 
        LDW Y,#DDROP 
        LDW YTEMP,Y 
        LDW Y,X 
        LDW Y,(Y)
        CPW Y,YTEMP 
        JRNE JSRC2 
; replace CALL DDROP BY ADDW X,#2*CELLL 
        ADDW X,#CELLL 
        _DOLIT ADDWX 
        CALL  CCOMMA 
        _DOLIT 2*CELLL 
        JP  COMMA 
JSRC2: 
;;;;;;;; end optimization code ;;;;;;;;;;        
.endif        
        CALL     DOLIT
        .word     CALLL     ;CALL
        CALL     CCOMMA
        JP     COMMA

;       INIT-OFS ( -- )
;       compute offset to adjust jump address 
;       set variable OFFSET 
        .word LINK 
        LINK=.
        .byte 8 
        .ascii "INIT-OFS" 
INITOFS:
        call TFLASH 
        CALL AT 
        CALL DUPP 
        call QBRAN
        .word 1$
        _DROP  
        call CPP 
        call AT 
        call HERE
        call SUBB 
1$:     call OFFSET 
        jp STORE  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       :       ( -- ; <string> )
;       Start a new colon definition
;       using next word as its name.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER COLON,1,":"
        call INITOFS       
        CALL   TOKEN
        CALL   SNAME
        JP     RBRAC

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       I:  ( -- )
;       Start interrupt service 
;       routine definition
;       those definition have 
;       no name.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER ICOLON,2,"I:"
        call INITOFS 
        jp RBRAC  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       IMMEDIATE       ( -- )
;       Make last compiled word
;       an immediate word.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER IMMED,9,"IMMEDIATE"
        CALL	DOLIT
        .word	(IMEDD<<8)
IMM01:  CALL	LAST
        CALL    AT
        CALL    AT
        CALL    ORR
        CALL    LAST
        CALL    AT
        JP      STORE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		COMPILE-ONLY  ( -- )
;		Make last compiled word 
;		a compile only word.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER COMPONLY,12,"COMPILE-ONLY"
        CALL     DOLIT
        .word    (COMPO<<8)
        JP       IMM01
		
;; Defining words

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       CREATE  ( -- ; <string> )
;       Compile a new array
;       without allocating space.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER CREAT,6,"CREATE"
        CALL     TOKEN
        CALL     SNAME
        CALL     OVERT        
        CALL     COMPI 
        .word DOVAR 
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       VARIABLE  ( -- ; <string> )
;       Compile a new variable
;       initialized to 0.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER VARIA,8,"VARIABLE"
; indirect variable so that VARIABLE definition can be compiled in FLASH 
        CALL HERE
        CALL DUPP 
        CALL CELLP
        CALL VPP 
        CALL STORE
        CALL CREAT
        CALL DUPP
        CALL COMMA
        CALL ZERO
        call SWAPP 
        CALL STORE
        CALL FMOVE ; move definition to FLASH
        CALL QDUP 
        CALL QBRAN 
        .word SET_RAMLAST   
        call UPDATVP  ; don't update if variable kept in RAM.
        CALL UPDATPTR
        RET         
SET_RAMLAST: 
        CALL LAST 
        CALL AT 
        CALL RAMLAST 
        JP STORE  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       CONSTANT  ( n -- ; <string> )
;       Compile a new constant 
;       n CONSTANT name 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER CONSTANT,8,"CONSTANT"
        CALL TOKEN
        CALL SNAME 
        CALL OVERT 
        CALL COMPI 
        .word DOCONST
        CALL COMMA 
        CALL FMOVE
        CALL QDUP 
        CALL QBRAN 
        .word SET_RAMLAST  
        CALL UPDATPTR  
1$:     RET          

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CONSTANT runtime semantic 
; doCONST  ( -- n )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       _HEADER DOCONST,7,"DOCONST"
DOCONST:
        subw x,#CELLL
        popw y 
        ldw y,(y) 
        ldw (x),y 
        ret 

;----------------------------------
; create double constant 
; 2CONSTANT ( d -- ; <string> )
;----------------------------------
        _HEADER DCONST,9,"2CONSTANT"
        CALL TOKEN
        CALL SNAME 
        CALL OVERT 
        CALL COMPI 
        .word DO_DCONST
        CALL COMMA
        CALL COMMA  
        CALL FMOVE
        CALL QDUP 
        CALL QBRAN 
        .word SET_RAMLAST  
        CALL UPDATPTR  
1$:     RET          
    
;----------------------------------
; runtime for DCONST 
; stack double constant 
; DO-DCONST ( -- d )
;-----------------------------------
;       _HEADER DO_DCONST,9,"DO-DCONST"
DO_DCONST:
    popw y 
    ldw YTEMP,y 
    subw x,#2*CELLL 
    ldw y,(y)
    ldw (x),y 
    ldw y,YTEMP 
    ldw y,(2,y)
    ldw (2,x),y 
    ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          TOOLS 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       _TYPE   ( b u -- )
;       Display a string. Filter
;       non-printing characters.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER UTYPE,5,"_TYPE"
        CALL     TOR     ;start count down loop
        JRA     UTYP2   ;skip first pass
UTYP1:  CALL     DUPP
        CALL     CAT
        CALL     TCHAR
        CALL     EMIT    ;display only printable
        CALL     ONEP    ;increment address
UTYP2:  CALL     DONXT
        .word      UTYP1   ;loop till done
        JP     DROP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       dm+     ( a u -- a )
;       Dump u bytes from ,
;       leaving a+u on  stack.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DUMPP,3,"DM+"
        CALL     OVER
        CALL     DOLIT
        .word      4
        CALL     UDOTR   ;display address
        CALL     SPACE
        CALL     TOR     ;start count down loop
        JRA     PDUM2   ;skip first pass
PDUM1:  CALL     DUPP
        CALL     CAT
        CALL     DOLIT
        .word      3
        CALL     UDOTR   ;display numeric data
        CALL     ONEP    ;increment address
PDUM2:  CALL     DONXT
        .word      PDUM1   ;loop till done
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       DUMP    ( a u -- )
;       Dump u bytes from a,
;       in a formatted manner.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DUMP,4,"DUMP"
        CALL     BASE
        CALL     AT
        CALL     TOR
        CALL     HEX     ;save radix, set hex
        CALL     DOLIT
        .word      16
        CALL     SLASH   ;change count to lines
        CALL     TOR     ;start count down loop
DUMP1:  CALL     CR
        CALL     DOLIT
        .word      16
        CALL     DDUP
        CALL     DUMPP   ;display numeric
        CALL     ROT
        CALL     ROT
        CALL     SPACE
        CALL     SPACE
        CALL     UTYPE   ;display printable characters
        CALL     DONXT
        .word      DUMP1   ;loop till done
DUMP3:  CALL     DROP
        CALL     RFROM
        CALL     BASE
        JP     STORE   ;restore radix

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       .S      ( ... -- ... )
;        Display  contents of stack.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DOTS,2,".S"
        CALL     CR
        CALL     DEPTH   ;stack depth
        CALL     TOR     ;start count down loop
        JRA     DOTS2   ;skip first pass
DOTS1:  CALL     RAT
	CALL     PICK
        CALL     DOT     ;index stack, display contents
DOTS2:  CALL     DONXT
        .word      DOTS1   ;loop till done
        CALL     DOTQP
        .byte      5
        .ascii     " <sp "
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       >NAME   ( ca -- na | F )
;       Convert code address
;       to a name address.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER TNAME,5,">NAME"
        CALL     CNTXT   ;vocabulary link
TNAM2:  CALL     AT
        CALL     DUPP    ;?last word in a vocabulary
        CALL     QBRAN
        .word      TNAM4
        CALL     DDUP
        CALL     NAMET
        CALL     XORR    ;compare
        CALL     QBRAN
        .word      TNAM3
        CALL     CELLM   ;continue with next word
        JRA     TNAM2
TNAM3:  CALL     SWAPP
        JP     DROP
TNAM4:  CALL     DDROP
        JP     ZERO

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       .ID     ( na -- )
;        Display  name at address.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DOTID,3,".ID"
        CALL     QDUP    ;if zero no name
        CALL     QBRAN
        .word      DOTI1
        CALL     COUNT
        CALL     DOLIT
        .word      0x1F
        CALL     ANDD    ;mask lexicon bits
        JP     UTYPE
DOTI1:  CALL     DOTQP
        .byte      9
        .ascii     " noName"
        RET

WANT_SEE=0
.if WANT_SEE 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       SEE     ( -- ; <string> )
;       A simple decompiler.
;       Updated for byte machines.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER SEE,3,"SEE"
        CALL     TICK    ;starting address
        CALL     CR
        CALL     ONEM
SEE1:   CALL     ONEP
        CALL     DUPP
        CALL     AT
        CALL     DUPP
        CALL     QBRAN
        .word    SEE2
        CALL     TNAME   ;?is it a name
SEE2:   CALL     QDUP    ;name address or zero
        CALL     QBRAN
        .word    SEE3
        CALL     SPACE
        CALL     DOTID   ;display name
        CALL     ONEP
        JRA      SEE4
SEE3:   CALL     DUPP
        CALL     CAT
        CALL     UDOT    ;display number
SEE4:   CALL     NUFQ    ;user control
        CALL     QBRAN
        .word    SEE1
        JP     DROP
.endif ; WANT_SEE 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       WORDS   ( -- )
;       Display names in vocabulary.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER WORDS,5,"WORDS"
        CALL     CR
        CALL     CNTXT   ;only in context
WORS1:  CALL     AT
        CALL     QDUP    ;?at end of list
        CALL     QBRAN
        .word      WORS2
        CALL     DUPP
        CALL     SPACE
        CALL     DOTID   ;display a name
        CALL     CELLM
        CALL     BRAN
        .word      WORS1
WORS2:  RET

        
;; Hardware reset

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  COPYRIGTH
; print copyright notice 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
COPYRIGHT:
    CALL DOTQP 
    .byte 33 
    .ascii "Jacques Deschenes, Copyright 2021"
    JP CR 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PRT_LICENSE 
;  print GPLV3 licence 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PRT_LICENSE:
        CALL DOTQP 
        .byte  15 
        .ascii "LICENSE GPLV3\r\n"
        RET 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    PRINT_VERSION ( c1 c2 -- )
;    c2 minor 
;    c1 major 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PRINT_VERSION:
     CALL DOTQP 
     .byte 9
     .ascii " version "
     CALL BDIGS 
     CALL DIGS 
     CALL DIGS 
     _DOLIT '.' 
     CALL HOLD 
     _DROP 
     CALL DIGS 
     CALL EDIGS 
     JP TYPES 
      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       hi      ( -- )
;       Display sign-on message.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER HI,2,"HI"
        CALL     CR
        CALL     DOTQP   
        .byte      10
        .ascii     "stm8eForth"
	_DOLIT VER 
        _DOLIT EXT 
        CALL PRINT_VERSION 
        CALL    DOTQP
.if NUCLEO_8S208RB         
        .byte 18
        .ascii  " on NUCLEO-8S208RB"
.endif
.if NUCLEO_8S207K8 
        .byte 18 
        .ascii  " on NUCLEO-8S207K8" 
.endif 
.if DISCOVERY
        .byte 19
        .ascii  " on STM8S-DISCOVERY"
.endif
.if DOORBELL
        .byte 16
        .ascii " on stm8s105k6b6"
.endif
        JP     CR

WANT_DEBUG=0
.if WANT_DEBUG 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       DEBUG      ( -- )
;       Display sign-on message.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER DEBUG,5,"DEBUG"
	CALL DOLIT
	.word 0x65
	CALL EMIT
	CALL ZERO
 	CALL ZLESS 
	CALL DOLIT
	.word 0xFFFE
	CALL ZLESS 
	CALL UPLUS 
 	_DROP 
	CALL DOLIT
	.word 3
	CALL UPLUS 
	CALL UPLUS 
 	_DROP
	CALL DOLIT
	.word 0x43
	CALL UPLUS 
 	_DROP
	CALL EMIT
	CALL DOLIT
	.word 0x4F
	CALL DOLIT
	.word 0x6F
 	CALL XORR
	CALL DOLIT
	.word 0xF0
 	CALL ANDD
	CALL DOLIT
	.word 0x4F
 	CALL ORR
	CALL EMIT
	CALL DOLIT
	.word 8
	CALL DOLIT
	.word 6
 	CALL SWAPP
	CALL OVER
	CALL XORR
	CALL DOLIT
	.word 3
	CALL ANDD 
	CALL ANDD
	CALL DOLIT
	.word 0x70
	CALL UPLUS 
	_DROP
	CALL EMIT
	CALL ZERO
	CALL QBRAN
	.word DEBUG1
	CALL DOLIT
	.word 0x3F
DEBUG1:
	CALL DOLIT
	.word 0xFFFF
	CALL QBRAN
	.word DEBUG2
	CALL DOLIT
	.word 0x74
	CALL BRAN
	.word DEBUG3
DEBUG2:
	CALL DOLIT
	.word 0x21
DEBUG3:
	CALL EMIT
	CALL DOLIT
	.word 0x68
	CALL DOLIT
	.word 0x80
	CALL STORE
	CALL DOLIT
	.word 0x80
	CALL AT
	CALL EMIT
	CALL DOLIT
	.word 0x4D
	CALL TOR
	CALL RAT
	CALL RFROM
	CALL ANDD
	CALL EMIT
	CALL DOLIT
	.word 0x61
	CALL DOLIT
	.word 0xA
	CALL TOR
DEBUG4:
	CALL ONE
	CALL UPLUS 
	_DROP
	CALL DONXT
	.word DEBUG4
	CALL EMIT
	CALL DOLIT
	.word 0x656D
	CALL DOLIT
	.word 0x100
	CALL UMSTA
	CALL SWAPP
	CALL DOLIT
	.word 0x100
	CALL UMSTA
	CALL SWAPP 
	_DROP
	CALL EMIT
	CALL EMIT
	CALL DOLIT
	.word 0x2043
	CALL ZERO
	CALL DOLIT
	.word 0x100
	CALL UMMOD
	CALL EMIT
	CALL EMIT
	;JP ORIG
	RET
.endif ; WANT_DEBUG 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       'BOOT   ( -- a )
;       The application startup vector.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER TBOOT,5,"'BOOT"
        CALL     DOVAR
        .word    APP_RUN      ;application to boot

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       COLD    ( -- )
;       The hilevel cold start s=ence.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _HEADER COLD,4,"COLD"
.if WANT_DEBUG
        CALL DEBUG
.endif ; WANT_DEBUG
COLD1:  CALL     DOLIT
        .word      UZERO
	CALL     DOLIT
        .word      UPP
        CALL     DOLIT
	.word      UEND-UZERO
        CALL     CMOVE   ;initialize user area
        ldw y,APP_RUN 
        jrne 1$
0$:
; there is no autorun application
; initialize EEPROM variables to default  
        subw x,#CELLL 
        ldw y,#HI  
        ldw (x),y
        call UPDATRUN
        call UPDATLAST 
        call UPDATCP 
        call UPDATVP
        jra 6$ 
1$:        
; if no app at app_space initialize EEPROM with ca of 'HI'  
        ldw y,app_space
        jreq 0$ 
; update LAST with APP_LAST 
; if APP_LAST > LAST else do the opposite
        ldw y,APP_LAST 
        cpw y,ULAST 
        jrugt 3$ 
; save LAST at APP_LAST  
        call UPDATLAST 
        jra 3$
2$: ; update LAST with APP_LAST 
        ldw ULAST,y
        ldw UCNTXT,y
3$:  
; update APP_CP if < app_space 
        ldw y,APP_CP  
        cpw y,UCP   
        jruge 4$ 
        call UPDATCP
        ldw y,UCP   
4$:
        ldw UCP,y                 
; update UVP with APP_VP  
; if APP_VP>UVP else do the opposite 
        ldw y,APP_VP 
        cpw y,UVP 
        jrugt 5$
        call UPDATVP 
        jra 6$
5$: ; update UVP with APP_VP 
        ldw UVP,y 
6$:      
        CALL     PRESE   ;initialize data stack and TIB
        CALL     TBOOT
        CALL     ATEXE   ;application boot
        CALL     OVERT
        JP     QUIT    ;start interpretation


        .include "flash.asm"
.if WANT_SCALING_CONST 
        .include "const_ratio.asm"
.endif
.if WANT_CONST_TABLE 
        .include "ctable.asm"
.endif
.if WANT_DOUBLE 
        .include "double.asm"
.endif 
.if WANT_FLOAT 
        .include "float.asm"
.endif 
.if WANT_FLOAT24 
        .include "float24.asm"
.endif 

;===============================================================

LASTN =	LINK   ;last name defined

; application code begin here
	.bndry 128 ; align on flash block  
app_space: 
.word 0,0,0,0



