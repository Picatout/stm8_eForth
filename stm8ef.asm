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
	.include "inc/nucleo_8s208.inc"
	.include "inc/stm8s208.inc"
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
;                  use UART1 instead of UART3 for communication with user.
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

;*************************************
; constant used for conditationnal 
; assembly for those word I converted 
; to code.
; Added by Picatout 2020-05-24 
;*************************************
CONVERT_TO_CODE=1 ; words converted in assembly by Picatout
PICATOUT_MOD=1  ; code modified by Picatout 

;*********************************************************
;	Assembler constants
;*********************************************************
RAMBASE =	0x0000	   ;ram base
STACK   =	0x17FF 	;system (return) stack empty 
DATSTK  =	0x1670	;data stack  empty
TBUFFBASE =     0x1680  ; flash read/write transaction buffer 
TIBBASE =       0X1700  ; tib addr.



;; Memory allocation

UPP     =     RAMBASE+6
SPP     =     RAMBASE+DATSTK
RPP     =     RAMBASE+STACK
ROWBUFF =     RAMBASE+TBUFFBASE 
TIBB    =     RAMBASE+TIBBASE
CTOP    =     RAMBASE+0x80

.if PICATOUT_MOD 
; user variables constants 
UBASE = UPP       ; numeric base 
UTMP = UBASE+2    ; temporary storage
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
.endif ; PICATOUT_MOD
;******  System Variables  ******
XTEMP	=	UTFLASH +2;address called by CREATE
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

.if PICATOUT_MOD
; EEPROM persistant data  
APP_LAST = EEPROM_BASE ; Application last word pointer  
APP_RUN = APP_LAST+2   ; application autorun address 
APP_CP = APP_RUN+2   ; free application space pointer 
APP_VP = APP_CP+2  ; free data space pointer 
.endif ;PICATOUT_MOD


;***********************************************
;; Version control

VER     =     3         ;major release version
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
ERR     =     27      ;error escape
TIC     =     39      ;tick
CALLL   =     0xCD     ;CALL opcodes
IRET_CODE =   0x80    ; IRET opcode 

        .macro _ledon
        bset PC_ODR,#LED2_BIT
        .endm

        .macro _ledoff
        bres PC_ODR,#LED2_BIT
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
	jp ORIG

; COLD initialize these variables.
UZERO:
        .word      BASEE   ;BASE
        .word      0       ;tmp
        .word      0       ;>IN
        .word      0       ;#TIB
        .word      TIBB    ;TIB
        .word      INTER   ;'EVAL
        .word      0       ;HLD
        .word      LASTN  ;CNTXT pointer
        .word      CTOP   ;CP in RAM
        .word      app_space ; CP in FLASH 
        .word      LASTN   ;LAST
        .word      0        ; OFFSET 
        .word      0       ; TFLASH 
UEND:   .word      0

ORIG:   
; initialize SP
        LDW     X,#STACK  ;initialize return stack
        LDW     SP,X
        LDW     RP0,X
        LDW     X,#DATSTK ;initialize data stack
        LDW     SP0,X
; initialize PC_5 as output to control LED2
; added by Picatout 
        bset PC_CR1,#LED2_BIT
        bset PC_CR2,#LED2_BIT
        bset PC_DDR,#LED2_BIT
        _ledoff
; initialize clock to HSI
; no divisor 16Mhz 
; Added by Picatout 
clock_init:
        clr CLK_CKDIVR
	bset CLK_SWCR,#CLK_SWCR_SWEN
	ld a,#CLK_SWR_HSI
	ld CLK_SWR,a
1$:	cp a,CLK_CMSR
	jrne 1$
        
; initialize UART1, 115200 8N1
uart1_init:
	bset CLK_PCKENR1,#CLK_PCKENR1_UART1
	; configure tx pin
	bset PA_DDR,#UART1_TX_PIN ; tx pin
	bset PA_CR1,#UART1_TX_PIN ; push-pull output
	bset PA_CR2,#UART1_TX_PIN ; fast output
	; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
	mov UART1_BRR2,#0x0b ; must be loaded first
	mov UART1_BRR1,#0x8
	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
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


;; place MCU in sleep mode with
;; halt opcode 
;; BYE ( -- )
        .word 0
        LINK=.
        .byte 3 
        .ascii "BYE"
BYE: 
        halt 
        ret 

; Enable interrupts 
; EI ( -- )
        .word LINK 
        LINK=.
        .byte 2
        .ascii "EI"
EI:
        rim 
        ret 

; Disable interrupts
; DI ( -- )
        .word LINK 
        LINK=.
        .byte 2 
        .ascii "DI"
DI:
        sim 
        ret 

; set interrupt priority level 
; SET-ISP ( n1 n2 -- )
; n1 level {1..3}
; n2 vector {0..29}
        .word LINK 
        LINK=.
        .byte 7 
        .ascii "SET-ISP"
SETISP:
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
        call CSTOR

; sélectionne l'application 
; qui démarre automatique lors 
; d'un COLD start 
        .word LINK 
        LINK=.
        .byte 7
        .ascii "AUTORUN"
AUTORUN:
        call TOKEN 
        call DUPP 
        call QBRAN 
        .word FORGET2
        call NAMEQ
        call QDUP 
        call QBRAN 
        .word FORGET2
        call DROP 
        subw x,#2*CELLL 
        clrw y 
        ldw (x),y 
        ldw y,#APP_RUN 
        ldw (2,x),y 
        jp ee_store 


;; Reset dictionary pointer before 
;; forgotten word. RAM SPACE and 
;; interrupt vector defineD after 
;; must be resetted also.
        .word LINK 
        LINK=.
        .byte 6
        .ascii "FORGET" 
FORGET: 
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
        call SUBB 
        call  ZLESS 
        call QBRAN 
        .word CANT_FORGET 
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
CANT_FORGET:
        call ABORQ
        .byte 10
        .ascii " Protected"
FORGET2:
        call ABORQ
        .byte 5
        .ascii " what"
FORGET4:
        jp DROP 

;---------------------------------
; if na is variable 
; free variable data  
; FREEVAR ( na -- )
;---------------------------------
        .word LINK 
        LINK=.
        .byte 7 
        .ascii "FREEVAR"
FREEVAR:
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
        jp  DROP 

;;
;; get millisecond counter 
;; msec ( -- u )
;; Added by Picatout 2020-04-26
        .word LINK  
        LINK = . 
        .byte 4
        .ascii "MSEC"
MSEC: 
        subw x,#CELLL 
        ldw y,MS 
        ldw (x),y 
        ret 

; suspend execution for u msec 
;  pause ( u -- )
        .word LINK 
        LINK=.
        .byte 5 
        .ascii "PAUSE"
PAUSE:
        ldw y,x
        ldw y,(y)
        addw y,MS 
1$:     wfi  
        cpw y,MS  
        jrne 1$        
        addw x,#CELLL 
        ret 

; initialize count down timer 
;  TIMER ( u -- )  milliseconds 
        .word LINK 
        LINK=.
        .byte 5 
        .ascii "TIMER" 
TIMER:
        ldw y,x
        ldw y,(y) 
        ldw CNTDWN,y
        addw x,#CELLL 
        ret 

; check for TIMER exiparition 
;  TIMEOUT? ( -- 0|-1 )
        .word LINK 
        LINK=. 
        .byte 8 
        .ascii "TIMEOUT?"
TIMEOUTQ: 
        clr a
        subw x,#CELLL 
        ldw y,CNTDWN 
        jrne 1$ 
        cpl a 
1$:     ld (1,x),a 
        ld (x),a 
        ret         

; reboot MCU 
; REBOOT ( -- )
        .word LINK 
        LINK=. 
        .byte 6 
        .ascii "REBOOT"
reboot:
        jp NonHandledInterrupt

; compile to flash memory 
; TO-FLASH ( -- )
        .word LINK 
        LINK=.
        .byte 8
        .ascii "TO-FLASH"
TOFLASH:
        ldw y,#-1 
        ldw UTFLASH,y
        ret 

; compile to RAM 
; TO-RAM ( -- )
        .word LINK 
        LINK=.
        .byte 6 
        .ascii "TO-RAM"
TORAM:
        clrw y 
        ldw UTFLASH,y 
        ret 
        

;; Device dependent I/O
;       ?RX     ( -- c T | F )
;         Return input byte and true, or false.
        .word      LINK 
LINK	= .
        .byte      4
        .ascii     "?KEY"
QKEY:
        CLRW Y 
        BTJF UART1_SR,#UART_SR_RXNE,INCH   ;check status
        LD    A,UART1_DR   ;get char in A
	SUBW	X,#2
        LD     (1,X),A
	CLR	(X)
        CPLW     Y
INCH:
	SUBW	X,#2
        LDW     (X),Y
        RET

;       TX!     ( c -- )
;       Send character c to  output device.
        .word      LINK
LINK	= .
        .byte      4
        .ascii     "EMIT"
EMIT:
        LD     A,(1,X)
	ADDW	X,#2
OUTPUT: BTJF UART1_SR,#UART_SR_TXE,OUTPUT  ;loop until tdre
        LD    UART1_DR,A   ;send A
        RET

;; The kernel

;       doLIT   ( -- w )
;       Push an inline literal.
        .word      LINK
LINK	= 	.
	.byte      COMPO+5
        .ascii     "DOLIT"
DOLIT:
	SUBW X,#2
.if PICATOUT_MOD 
        ldw y,(1,sp)
        ldw y,(y)
        ldw (x),y
        popw y 
        jp (2,y)
.else 
        POPW Y
	LDW YTEMP,Y
	LDW Y,(Y)
        LDW (X),Y
        LDW Y,YTEMP
	JP (2,Y)
.endif 

;       next    ( -- )
;       Code for  single index loop.
        .word      LINK
LINK	= 	.
	.byte      COMPO+4
        .ascii     "NEXT"
DONXT:
	LDW Y,(3,SP)
	DECW Y
	JRPL NEX1 ; jump if N=0
	POPW Y
.if PICATOUT_MOD
        addw sp,#2
.else        
	POP A
	POP A
.endif         
        JP (2,Y)
NEX1:
        LDW (3,SP),Y
        POPW Y
	LDW Y,(Y)
	JP (Y)

;       ?branch ( f -- )
;       Branch if flag is zero.
        .word      LINK
LINK	= 	.
	.byte      COMPO+7
        .ascii     "?BRANCH"
QBRAN:	
        LDW Y,X
	ADDW X,#2
	LDW Y,(Y)
        JREQ     BRAN
	POPW Y
	JP (2,Y)
        
;       branch  ( -- )
;       Branch to an inline address.
        .word      LINK
LINK	= 	.
	.byte      COMPO+6
        .ascii     "BRANCH"
BRAN:
        POPW Y
	LDW Y,(Y)
        JP     (Y)

;       EXECUTE ( ca -- )
;       Execute  word at ca.
        .word      LINK
LINK	= 	.
        .byte       7
        .ascii     "EXECUTE"
EXECU:
        LDW Y,X
	ADDW X,#2
	LDW  Y,(Y)
        JP   (Y)

;       EXIT    ( -- )
;       Terminate a colon definition.
        .word      LINK
LINK = .
        .byte      4
        .ascii     "EXIT"
EXIT:
        POPW Y
        RET

;       !       ( w a -- )
;       Pop  data stack to memory.
        .word      LINK
LINK = .
        .byte      1
        .ascii     "!"
STORE:
        LDW Y,X
        LDW Y,(Y)    ;Y=a
        LDW YTEMP,Y
        LDW Y,X
        LDW Y,(2,Y)
        LDW [YTEMP],Y ;store w at a
        ADDW X,#4 ; DDROP 
        RET     

;       @       ( a -- w )
;       Push memory location to stack.
        .word      LINK
LINK	= 	.
        .byte    1
        .ascii	"@"
AT:
        LDW Y,X     ;Y = a
        LDW Y,(Y)   ; address 
        LDW Y,(Y)   ; value 
        LDW (X),Y ;w = @Y
        RET     

;       C!      ( c b -- )
;       Pop  data stack to byte memory.
        .word      LINK
LINK	= .
        .byte      2
        .ascii     "C!"
CSTOR:
        LDW Y,X
	LDW Y,(Y)    ;Y=b
        LD A,(3,X)    ;D = c
        LD  (Y),A     ;store c at b
	ADDW X,#4 ; DDROP 
        RET     

;       C@      ( b -- c )
;       Push byte in memory to  stack.
        .word      LINK
LINK	= 	.
        .byte      2
        .ascii     "C@"
CAT:
        LDW Y,X     ;Y=b
        LDW Y,(Y)
        LD A,(Y)
        LD (1,X),A
        CLR (X)
        RET     

;       RP@     ( -- a )
;       Push current RP to data stack.
        .word      LINK
LINK	= .
        .byte      3
        .ascii     "RP@"
RPAT:
        LDW Y,SP    ;save return addr
        SUBW X,#2
        LDW (X),Y
        RET     

;       RP!     ( a -- )
;       Set  return stack pointer.
        .word      LINK
LINK	= 	. 
	.byte      COMPO+3
        .ascii     "RP!"
RPSTO:
        POPW Y
        LDW YTEMP,Y
        LDW Y,X
        LDW Y,(Y)
        LDW SP,Y
        ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
        JP [YTEMP]

;       R>      ( -- w )
;       Pop return stack to data stack.
        .word      LINK
LINK	= 	. 
	.byte      COMPO+2
        .ascii     "R>"
RFROM:
        POPW Y    ;save return addr
        LDW YTEMP,Y
        POPW Y
        SUBW X,#2
        LDW (X),Y
        JP [YTEMP]

;       R@      ( -- w )
;       Copy top of return stack to stack.
        .word      LINK
LINK	= 	. 
        .byte      2
        .ascii     "R@"
RAT:
.if PICATOUT_MOD
        ldw y,(3,sp)
        subw x,#CELLL 
        ldw (x),y 
        ret 
.else 
        POPW Y
        LDW YTEMP,Y
        POPW Y
        PUSHW Y
        SUBW X,#2
        LDW (X),Y
        JP [YTEMP]
.endif         

;       >R      ( w -- )
;       Push data stack to return stack.
        .word      LINK
LINK	= 	. 
	.byte      COMPO+2
        .ascii     ">R"
TOR:
        POPW Y    ;save return addr
        LDW YTEMP,Y
        LDW Y,X
        LDW Y,(Y)
        PUSHW Y    ;restore return addr
        ADDW X,#2
        JP [YTEMP]

;       SP@     ( -- a )
;       Push current stack pointer.
        .word      LINK
LINK	= 	. 
        .byte      3
        .ascii     "SP@"
SPAT:
	LDW Y,X
        SUBW X,#2
	LDW (X),Y
        RET     

;       SP!     ( a -- )
;       Set  data stack pointer.
        .word      LINK
LINK	= 	. 
        .byte      3
        .ascii     "SP!"
SPSTO:
        LDW     X,(X)     ;X = a
        RET     

;       DROP    ( w -- )
;       Discard top stack item.
        .word      LINK
LINK	= 	. 
        .byte      4
        .ascii     "DROP"
DROP:
        ADDW X,#2     
        RET     

;       DUP     ( w -- w w )
;       Duplicate  top stack item.
        .word      LINK
LINK	= 	. 
        .byte      3
        .ascii     "DUP"
DUPP:
	LDW Y,X
        SUBW X,#2
	LDW Y,(Y)
	LDW (X),Y
        RET     

;       SWAP    ( w1 w2 -- w2 w1 )
;       Exchange top two stack items.
        .word      LINK
LINK	= 	. 
        .byte      4
        .ascii     "SWAP"
SWAPP:
        LDW Y,X
        LDW Y,(Y)
        LDW YTEMP,Y
        LDW Y,X
        LDW Y,(2,Y)
        LDW (X),Y
        LDW Y,YTEMP
        LDW (2,X),Y
        RET     

;       OVER    ( w1 w2 -- w1 w2 w1 )
;       Copy second stack item to top.
        .word      LINK
LINK	= . 
        .byte      4
        .ascii     "OVER"
OVER:
        SUBW X,#2
        LDW Y,X
        LDW Y,(4,Y)
        LDW (X),Y
        RET     

;       0<      ( n -- t )
;       Return true if n is negative.
        .word      LINK
LINK	= . 
        .byte      2
        .ascii     "0<"
ZLESS:
        LD A,#0xFF
        LDW Y,X
        LDW Y,(Y)
        JRMI     ZL1
        CLR A   ;false
ZL1:    LD     (X),A
        LD (1,X),A
	RET     

;       AND     ( w w -- w )
;       Bitwise AND.
        .word      LINK
LINK	= . 
        .byte      3
        .ascii     "AND"
ANDD:
        LD  A,(X)    ;D=w
        AND A,(2,X)
        LD (2,X),A
        LD A,(1,X)
        AND A,(3,X)
        LD (3,X),A
        ADDW X,#2
        RET

;       OR      ( w w -- w )
;       Bitwise inclusive OR.
        .word      LINK
LINK = . 
        .byte      2
        .ascii     "OR"
ORR:
        LD A,(X)    ;D=w
        OR A,(2,X)
        LD (2,X),A
        LD A,(1,X)
        OR A,(3,X)
        LD (3,X),A
        ADDW X,#2
        RET

;       XOR     ( w w -- w )
;       Bitwise exclusive OR.
        .word      LINK
LINK	= . 
        .byte      3
        .ascii     "XOR"
XORR:
        LD A,(X)    ;D=w
        XOR A,(2,X)
        LD (2,X),A
        LD A,(1,X)
        XOR A,(3,X)
        LD (3,X),A
        ADDW X,#2
        RET

;       UM+     ( u u -- udsum )
;       Add two unsigned single
;       and return a double sum.
        .word      LINK
LINK	= . 
        .byte      3
        .ascii     "UM+"
UPLUS:
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

;       doVAR   ( -- a )
;       Code for VARIABLE and CREATE.
        .word      LINK
LINK	= . 
	.byte      COMPO+5
        .ascii     "DOVAR"
DOVAR:
	SUBW X,#2
        POPW Y    ;get return addr (pfa)
.if PICATOUT_MOD
        LDW Y,(Y) ; indirect address 
.endif ;PICATOUT_MOD        
        LDW (X),Y    ;push on stack
        RET     ;go to RET of EXEC

;       BASE    ( -- a )
;       Radix base for numeric I/O.
        .word      LINK        
LINK = . 
        .byte      4
        .ascii     "BASE"
BASE:
	LDW Y,#UBASE 
	SUBW X,#2
        LDW (X),Y
        RET

;       tmp     ( -- a )
;       A temporary storage.
        .word      LINK
        
LINK = . 
	.byte      3
        .ascii     "TMP"
TEMP:
	LDW Y,#UTMP
	SUBW X,#2
        LDW (X),Y
        RET

;       >IN     ( -- a )
;        Hold parsing pointer.
        .word      LINK
LINK = . 
        .byte      3
        .ascii    ">IN"
INN:
	LDW Y,#UINN 
	SUBW X,#2
        LDW (X),Y
        RET

;       #TIB    ( -- a )
;       Count in terminal input buffer.
        .word      LINK
LINK = . 
        .byte      4
        .ascii     "#TIB"
NTIB:
	LDW Y,#UCTIB 
	SUBW X,#2
        LDW (X),Y
        RET

.if PICATOUT_MOD
;       TBUF ( -- a )
;       address of 128 bytes transaction buffer 
        .word LINK 
        LINK=.
        .byte 4 
        .ascii "TBUF"
TBUF:
        ldw y,#ROWBUFF
        subw x,#CELLL
        ldw (x),y 
        ret 

; systeme variable 
; compilation destination 
; TFLASH ( -- A )
        .word LINK 
        LINK=.
        .byte 6 
        .ascii "TFLASH"         
TFLASH:
        subw x,#CELLL 
        ldw y,#UTFLASH
        ldw (x),y 
        ret 

.endif ;PICATOUT_MOD

;       "EVAL   ( -- a )
;       Execution vector of EVAL.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     "'EVAL"
TEVAL:
	LDW Y,#UINTER 
	SUBW X,#2
        LDW (X),Y
        RET

;       HLD     ( -- a )
;       Hold a pointer of output string.
        .word      LINK
LINK = . 
        .byte      3
        .ascii     "HLD"
HLD:
	LDW Y,#UHLD 
	SUBW X,#2
        LDW (X),Y
        RET

;       CONTEXT ( -- a )
;       Start vocabulary search.
        .word      LINK
LINK = . 
        .byte      7
        .ascii     "CONTEXT"
CNTXT:
	LDW Y,#UCNTXT
	SUBW X,#2
        LDW (X),Y
        RET

;       VP      ( -- a )
;       Point to top of variables
        .word      LINK
LINK = . 
        .byte      2
        .ascii     "VP"
VPP:
	LDW Y,#UVP 
	SUBW X,#2
        LDW (X),Y
        RET

.if PICATOUT_MOD
;       CP    ( -- a )
;       Pointer to top of FLASH 
        .word LINK 
        LINK=.
        .byte 3 
        .ascii "CP"
CPP: 
        ldw y,#UCP 
        subw x,#CELLL 
        ldw (x),y 
        ret                
.endif ;PICATOUT_MOD

;       LAST    ( -- a )
;       Point to last name in dictionary.
        .word      LINK
LINK = . 
        .byte      4
        .ascii     "LAST"
LAST:
	LDW Y,#ULAST 
	SUBW X,#2
        LDW (X),Y
        RET

.if PICATOUT_MOD
        .word LINK 
        LINK=.
        .byte 6
        .ascii "OFFSET" 
OFFSET: 
        subw x,#CELLL
        ldw y,#UOFFSET 
        ldw (x),y 
        ret 

; adjust jump address adding OFFSET
; ADR-ADJ ( a -- a+offset )
ADRADJ: 
        call OFFSET 
        call AT 
        jp PLUS 

.endif ; PICATOUT_MOD

;; Common functions

;       ?DUP    ( w -- w w | 0 )
;       Dup tos if its is not zero.
        .word      LINK
LINK = . 
        .byte      4
        .ascii     "?DUP"
QDUP:
        LDW Y,X
	LDW Y,(Y)
        JREQ     QDUP1
	SUBW X,#2
        LDW (X),Y
QDUP1:  RET

;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
;       Rot 3rd item to top.
        .word      LINK
LINK = . 
        .byte      3
        .ascii     "ROT"
ROT:
.if PICATOUT_MOD
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
.else 
        LDW Y,X
	LDW Y,(4,Y)
	LDW YTEMP,Y
        LDW Y,X
        LDW Y,(2,Y)
        LDW XTEMP,Y
        LDW Y,X
        LDW Y,(Y)
        LDW (2,X),Y
        LDW Y,XTEMP
        LDW (4,X),Y
        LDW Y,YTEMP
        LDW (X),Y
        RET
.endif 

;       2DROP   ( w w -- )
;       Discard two items on stack.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     "2DROP"
DDROP:
        ADDW X,#4
        RET

;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
;       Duplicate top two items.
        .word      LINK
LINK = . 
        .byte      4
        .ascii     "2DUP"
DDUP:
        SUBW X,#4
        LDW Y,X
        LDW Y,(6,Y)
        LDW (2,X),Y
        LDW Y,X
        LDW Y,(4,Y)
        LDW (X),Y
        RET

;       +       ( w w -- sum )
;       Add top two items.
        .word      LINK
LINK = . 
        .byte      1
        .ascii     "+"
PLUS:
        LDW Y,X
        LDW Y,(Y)
        LDW YTEMP,Y
        ADDW X,#2
        LDW Y,X
        LDW Y,(Y)
        ADDW Y,YTEMP
        LDW (X),Y
        RET

;       NOT     ( w -- w )
;       One's complement of tos.
        .word      LINK
LINK = . 
        .byte      3
        .ascii     "NOT"
INVER:
        LDW Y,X
        LDW Y,(Y)
        CPLW Y
        LDW (X),Y
        RET

;       NEGATE  ( n -- -n )
;       Two's complement of tos.
        .word      LINK
LINK = . 
        .byte      6
        .ascii     "NEGATE"
NEGAT:
        LDW Y,X
        LDW Y,(Y)
        NEGW Y
        LDW (X),Y
        RET

;       DNEGATE ( d -- -d )
;       Two's complement of top double.
        .word      LINK
LINK = . 
        .byte      7
        .ascii     "DNEGATE"
DNEGA:
        LDW Y,X
	LDW Y,(Y)
        CPLW Y     
	LDW YTEMP,Y
        LDW Y,X
        LDW Y,(2,Y)
        CPLW Y
        INCW Y
        LDW (2,X),Y
        LDW Y,YTEMP
        JRNC DN1 
        INCW Y
DN1:    LDW (X),Y
        RET

;       -       ( n1 n2 -- n1-n2 )
;       Subtraction.
        .word      LINK
LINK = . 
        .byte      1
        .ascii     "-"
SUBB:
        LDW Y,X
        LDW Y,(Y)
        LDW YTEMP,Y
        ADDW X,#2
        LDW Y,X
        LDW Y,(Y)
        SUBW Y,YTEMP
        LDW (X),Y
        RET

;       ABS     ( n -- n )
;       Return  absolute value of n.
        .word      LINK
LINK = . 
        .byte      3
        .ascii     "ABS"
ABSS:
        LDW Y,X
	LDW Y,(Y)
        JRPL     AB1     ;negate:
        NEGW     Y     ;else negate hi byte
        LDW (X),Y
AB1:    RET

;       =       ( w w -- t )
;       Return true if top two are =al.
        .word      LINK
LINK = . 
        .byte      1
        .ascii     "="
EQUAL:
        LD A,#0xFF  ;true
        LDW Y,X    ;D = n2
        LDW Y,(Y)
        LDW YTEMP,Y
        ADDW X,#2
        LDW Y,X
        LDW Y,(Y)
        CPW Y,YTEMP     ;if n2 <> n1
        JREQ     EQ1
        CLR A
EQ1:    LD (X),A
        LD (1,X),A
	RET     

;       U<      ( u u -- t )
;       Unsigned compare of top two items.
        .word      LINK
LINK = . 
        .byte      2
        .ascii     "U<"
ULESS:
        LD A,#0xFF  ;true
        LDW Y,X    ;D = n2
        LDW Y,(Y)
        LDW YTEMP,Y
        ADDW X,#2
        LDW Y,X
        LDW Y,(Y)
        CPW Y,YTEMP     ;if n2 <> n1
        JRULT     ULES1
        CLR A
ULES1:  LD (X),A
        LD (1,X),A
	RET     

;       <       ( n1 n2 -- t )
;       Signed compare of top two items.
        .word      LINK
LINK = . 
        .byte      1
        .ascii     "<"
LESS:
        LD A,#0xFF  ;true
        LDW Y,X    ;D = n2
        LDW Y,(Y)
        LDW YTEMP,Y
        ADDW X,#2
        LDW Y,X
        LDW Y,(Y)
        CPW Y,YTEMP     ;if n2 <> n1
        JRSLT     LT1
        CLR A
LT1:    LD (X),A
        LD (1,X),A
	RET     

;       MAX     ( n n -- n )
;       Return greater of two top items.
        .word      LINK
LINK = . 
        .byte      3
        .ascii     "MAX"
MAX:
        LDW Y,X    ;D = n2
        LDW Y,(2,Y)
        LDW YTEMP,Y
        LDW Y,X
        LDW Y,(Y)
        CPW Y,YTEMP     ;if n2 <> n1
        JRSLT     MAX1
        LDW (2,X),Y
MAX1:   ADDW X,#2
	RET     

;       MIN     ( n n -- n )
;       Return smaller of top two items.
        .word      LINK
LINK = . 
        .byte      3
        .ascii     "MIN"
MIN:
        LDW Y,X    ;D = n2
        LDW Y,(2,Y)
        LDW YTEMP,Y
        LDW Y,X
        LDW Y,(Y)
        CPW Y,YTEMP     ;if n2 <> n1
        JRSGT     MIN1
        LDW (2,X),Y
MIN1:	ADDW X,#2
	RET     

;       WITHIN  ( u ul uh -- t )
;       Return true if u is within
;       range of ul and uh. ( ul <= u < uh )
        .word      LINK
LINK = . 
        .byte      6
        .ascii     "WITHIN"
WITHI:
        CALL     OVER
        CALL     SUBB
        CALL     TOR
        CALL     SUBB
        CALL     RFROM
        JP     ULESS

;; Divide

;       UM/MOD  ( udl udh un -- ur uq )
;       Unsigned divide of a double by a
;       single. Return mod and quotient.
        .word      LINK
LINK = . 
        .byte      6
        .ascii     "UM/MOD"
UMMOD:
	LDW XTEMP,X	; save stack pointer
	LDW X,(X)	; un
	LDW YTEMP,X     ; save un
	LDW Y,XTEMP	; stack pointer
	LDW Y,(4,Y)     ; Y=udl
	LDW X,XTEMP
	LDW X,(2,X)	; X=udh
	CPW X,YTEMP
	JRULE MMSM1
	LDW X,XTEMP
	ADDW X,#2	; pop off 1 level
	LDW Y,#0xFFFF
	LDW (X),Y
	CLRW Y
	LDW (2,X),Y
	RET
MMSM1:
.if  PICATOUT_MOD 
; take advantage of divw x,y when udh==0
        tnzw x  ; is udh==0?
        jrne MMSM2 
        ldw x,y    ;udl 
        ldw y,YTEMP ; divisor 
        divw x,y 
        pushw x     ; quotient 
        ldw x,XTEMP 
        addw x,#CELLL 
        ldw (2,x),y  ; ur
        popw y 
        ldw (x),y ; uq 
        ret 
MMSM2:        
.endif 
	LD A,#17	; loop count
MMSM3:
	CPW X,YTEMP	; compare udh to un
	JRULT MMSM4	; can't subtract
	SUBW X,YTEMP	; can subtract
MMSM4:
	CCF	; quotient bit
	RLCW Y	; rotate into quotient
	RLCW X	; rotate into remainder
	DEC A	; repeat
	JRUGT MMSM3
	SRAW X
	LDW YTEMP,X	; done, save remainder
	LDW X,XTEMP
	ADDW X,#2	; drop
	LDW (X),Y
	LDW Y,YTEMP	; save quotient
	LDW (2,X),Y
	RET
	
;       M/MOD   ( d n -- r q )
;       Signed floored divide of double by
;       single. Return mod and quotient.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     "M/MOD"
MSMOD:  
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
        CALL	SWAPP
MMOD3:	RET

;       /MOD    ( n n -- r q )
;       Signed divide. Return mod and quotient.
        .word      LINK
LINK = . 
        .byte      4
        .ascii     "/MOD"
SLMOD:
        CALL	OVER
        CALL	ZLESS
        CALL	SWAPP
        JP	MSMOD

;       MOD     ( n n -- r )
;       Signed divide. Return mod only.
        .word      LINK
LINK = . 
        .byte      3
        .ascii     "MOD"
MODD:
	CALL	SLMOD
	JP	DROP

;       /       ( n n -- q )
;       Signed divide. Return quotient only.
        .word      LINK
LINK = . 
        .byte      1
        .ascii     "/"
SLASH:
        CALL	SLMOD
        CALL	SWAPP
        JP	DROP

;; Multiply

;       UM*     ( u u -- ud )
;       Unsigned multiply. Return double product.
        .word      LINK
LINK = . 
        .byte      3
        .ascii     "UM*"
UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
.if PICATOUT_MOD 
; take advantage of SP addressing modes
; these PRODx in RAM are not required
; the product is kept on stack as local variable 
        ;; bytes offset on data stack 
        da=2 
        db=3 
        dc=0 
        dd=1 
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
.else
	LD A,(2,X)	; b
	LD YL,A
	LD A,(X)	; d
	MUL Y,A
	LDW PROD1,Y
	LD A,(3,X)	; a
	LD YL,A
	LD A,(X)	; d
	MUL Y,A
	LDW PROD2,Y
	LD A,(2,X)	; b
	LD YL,A
	LD A,(1,X)	; c
	MUL Y,A
	LDW PROD3,Y
	LD A,(3,X)	; a
	LD YL,A
	LD A,(1,X)	; c
	MUL Y,A	; least signifiant product
	CLR A
	RRWA Y
	LD (3,X),A	; store least significant byte
	ADDW Y,PROD3
	CLR A
	ADC A,#0	; save carry
	LD CARRY,A
	ADDW Y,PROD2
	LD A,CARRY
	ADC A,#0	; add 2nd carry
	LD CARRY,A
	CLR A
	RRWA Y
	LD (2,X),A	; 2nd product byte
	ADDW Y,PROD1
	RRWA Y
	LD (1,X),A	; 3rd product byte
	RRWA Y  	; 4th product byte now in A
	ADC A,CARRY	; fill in carry bits
	LD (X),A
	RET
.endif 


;       *       ( n n -- n )
;       Signed multiply. Return single product.
        .word      LINK
LINK = . 
        .byte      1
        .ascii     "*"
STAR:
	CALL	UMSTA
	JP	DROP

;       M*      ( n n -- d )
;       Signed multiply. Return double product.
        .word      LINK
LINK = . 
        .byte      2
        .ascii     "M*"
MSTAR:      
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
        CALL	DNEGA
MSTA1:	RET

;       . /MOD   ( n1 n2 n3 -- r q )
;       Multiply n1 and n2, then divide
;       by n3. Return mod and quotient.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     "*/MOD"
SSMOD:
        CALL     TOR
        CALL     MSTAR
        CALL     RFROM
        JP     MSMOD

;       */      ( n1 n2 n3 -- q )
;       Multiply n1 by n2, then divide
;       by n3. Return quotient only.
        .word      LINK
LINK = . 
        .byte      2
        .ascii     "*/"
STASL:
        CALL	SSMOD
        CALL	SWAPP
        JP	DROP

;; Miscellaneous

;       CELL+   ( a -- a )
;       Add cell size in byte to address.
        .word      LINK
LINK = . 
        .byte       2
        .ascii     "2+"
CELLP:
        LDW Y,X
	LDW Y,(Y)
        ADDW Y,#CELLL 
        LDW (X),Y
        RET

;       CELL-   ( a -- a )
;       Subtract 2 from address.
        .word      LINK
LINK = . 
        .byte       2
        .ascii     "2-"
CELLM:
        LDW Y,X
	LDW Y,(Y)
        SUBW Y,#CELLL
        LDW (X),Y
        RET

;       CELLS   ( n -- n )
;       Multiply tos by 2.
        .word      LINK
LINK = . 
        .byte       2
        .ascii     "2*"
CELLS:
        LDW Y,X
	LDW Y,(Y)
        SLAW Y
        LDW (X),Y
        RET

;       1+      ( a -- a )
;       Add cell size in byte to address.
        .word      LINK
LINK = . 
        .byte      2
        .ascii     "1+"
ONEP:
        LDW Y,X
	LDW Y,(Y)
        INCW Y
        LDW (X),Y
        RET

;       1-      ( a -- a )
;       Subtract 2 from address.
        .word      LINK
LINK = . 
        .byte      2
        .ascii     "1-"
ONEM:
        LDW Y,X
	LDW Y,(Y)
        DECW Y
        LDW (X),Y
        RET

;  shift left n times 
; LSHIFT ( n1 n2 -- n1<<n2 )
        .word LINK 
        LINK=.
        .byte 6 
        .ascii "LSHIFT"
LSHIFT:
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

; shift right n times                 
; RSHIFT (n1 n2 -- n1>>n2 )
        .word LINK 
        LINK=.
        .byte 6
        .ascii "RSHIFT"
RSHIFT:
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


;       2/      ( n -- n )
;       Multiply tos by 2.
        .word      LINK
LINK = . 
        .byte      2
        .ascii     "2/"
TWOSL:
        LDW Y,X
	LDW Y,(Y)
        SRAW Y
        LDW (X),Y
        RET

;       BL      ( -- 32 )
;       Return 32,  blank character.
        .word      LINK
LINK = . 
        .byte      2
        .ascii     "BL"
BLANK:
        SUBW X,#2
	LDW Y,#32
        LDW (X),Y
        RET

;         0     ( -- 0)
;         Return 0.
        .word      LINK
LINK = . 
        .byte       1
        .ascii     "0"
ZERO:
        SUBW X,#2
	CLRW Y
        LDW (X),Y
        RET

;         1     ( -- 1)
;         Return 1.
        .word      LINK
LINK = . 
        .byte       1
        .ascii     "1"
ONE:
        SUBW X,#2
	LDW Y,#1
        LDW (X),Y
        RET

;         -1    ( -- -1)
;         Return 32,  blank character.
        .word      LINK
LINK = . 
        .byte       2
        .ascii     "-1"
MONE:
        SUBW X,#2
	LDW Y,#0xFFFF
        LDW (X),Y
        RET

;       >CHAR   ( c -- c )
;       Filter non-printing characters.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     ">CHAR"
TCHAR:
.if CONVERT_TO_CODE
        ld a,(1,x)
        cp a,#32  
        jrmi 1$ 
        cp a,#127 
        jrpl 1$ 
        ret 
1$:     ld a,#'_ 
        ld (1,x),a 
        ret 
.else
        CALL     DOLIT
        .word       0x7F
        CALL     ANDD
        CALL     DUPP    ;mask msb
        CALL     DOLIT
        .word      127
        CALL     BLANK
        CALL     WITHI   ;check for printable
        CALL     QBRAN
        .word    TCHA1
        CALL     DROP
        CALL     DOLIT
        .word     0x5F		; "_"     ;replace non-printables
.endif 
TCHA1:  RET

;       DEPTH   ( -- n )
;       Return  depth of  data stack.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     "DEPTH"
DEPTH: 
        LDW Y,SP0    ;save data stack ptr
	LDW XTEMP,X
        SUBW Y,XTEMP     ;#bytes = SP0 - X
        SRAW Y    ;Y = #stack items
.if PICATOUT_MOD
; why ? 
;      	DECW Y
.endif 
	SUBW X,#2
        LDW (X),Y     ; if neg, underflow
        RET

;       PICK    ( ... +n -- ... w )
;       Copy  nth stack item to tos.
        .word      LINK
LINK = . 
        .byte      4
        .ascii     "PICK"
PICK:
        LDW Y,X   ;D = n1
        LDW Y,(Y)
        SLAW Y
        LDW XTEMP,X
        ADDW Y,XTEMP
        LDW Y,(Y)
        LDW (X),Y
        RET

;; Memory access

;       +!      ( n a -- )
;       Add n to  contents at address a.
        .word      LINK
LINK = . 
        .byte      2
        .ascii     "+!"
PSTOR:
.if CONVERT_TO_CODE
        ldw y,x 
        ldw y,(y)
        ldw YTEMP,y  ; address
        ldw y,(y)  
        pushw y  ; value at address 
        ldw y,x 
        ldw y,(2,y) ; n 
        addw y,(1,sp) ; n+value
        ldw [YTEMP],y ;  a!
        popw y    ;drop local var
        addw x,#4 ; DDROP 
        ret 
.else
        CALL	SWAPP
        CALL	OVER
        CALL	AT
        CALL	PLUS
        CALL	SWAPP
        JP	STORE
.endif 

;       2!      ( d a -- )
;       Store  double integer to address a.
        .word      LINK
LINK = . 
        .byte      2
        .ascii     "2!"
DSTOR:
.if CONVERT_TO_CODE
        ldw y,x 
        ldw y,(y)
        ldw YTEMP,y ; address 
        addw x,#CELLL ; drop a 
        ldw y,x 
        ldw y,(y) ; hi word 
        pushw x 
        ldw x,(2,x) ; lo word 
        ldw [YTEMP],y
        ldw y,x 
        ldw x,#2 
        ldw ([YTEMP],x),y 
        popw x 
        addw x,#4 ; DDROP 
        ret 
.else
        CALL	SWAPP
        CALL	OVER
        CALL	STORE
        CALL	CELLP
        JP	STORE
.endif 
;       2@      ( a -- d )
;       Fetch double integer from address a.
        .word      LINK
LINK = . 
        .byte      2
        .ascii     "2@"
DAT:
.if CONVERT_TO_CODE
        ldw y,x 
        ldw y,(y) ;address 
        ldw YTEMP,y 
        subw x,#CELLL ; space for udh 
        ldw y,[YTEMP] ; udh 
        ldw (x),y 
        ldw y,#2
        ldw y,([YTEMP],y) ; udl 
        ldw (2,x),y
        ret 
.else 
        CALL	DUPP
        CALL	CELLP
        CALL	AT
        CALL	SWAPP
        JP	AT
.endif 

;       COUNT   ( b -- b +n )
;       Return count byte of a string
;       and add 1 to byte address.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     "COUNT"
COUNT:
.if CONVERT_TO_CODE
        ldw y,x 
        ldw y,(y) ; address 
        ld a,(y)  ; count 
        incw y 
        ldw (x),y 
        subw x,#CELLL 
        ld (1,x),a 
        clr (x)
        ret 
.else 
        CALL     DUPP
        CALL     ONEP
        CALL     SWAPP
        JP     CAT
.endif 

;       HERE    ( -- a )
;       Return  top of  variables
        .word      LINK
LINK = . 
        .byte      4
        .ascii     "HERE"
HERE:
.if CONVERT_TO_CODE
      	ldw y,#UVP 
        ldw y,(y)
        subw x,#CELLL 
        ldw (x),y 
        ret 
.else
        CALL     VPP
        JP     AT
.endif 

;       PAD     ( -- a )
;       Return address of text buffer
;       above  code dictionary.
        .word      LINK
LINK = . 
        .byte      3
        .ascii     "PAD"
PAD:
        CALL     HERE
        CALL     DOLIT
        .word      80
        JP     PLUS

;       TIB     ( -- a )
;       Return address of terminal input buffer.
        .word      LINK
LINK = . 
        .byte      3
        .ascii     "TIB"
TIB:
        CALL     NTIB
        CALL     CELLP
        JP     AT

;       @EXECUTE        ( a -- )
;       Execute vector stored in address a.
        .word      LINK
LINK = . 
        .byte      8
        .ascii     "@EXECUTE"
ATEXE:
        CALL     AT
        CALL     QDUP    ;?address or zero
        CALL     QBRAN
        .word      EXE1
        CALL     EXECU   ;execute if non-zero
EXE1:   RET     ;do nothing if zero

;       CMOVE   ( b1 b2 u -- )
;       Copy u bytes from b1 to b2.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     "CMOVE"
CMOVE:
        CALL	TOR
        CALL	BRAN
        .word	CMOV2
CMOV1:	CALL	TOR
        CALL	DUPP
        CALL	CAT
        CALL	RAT
        CALL	CSTOR
        CALL	ONEP
        CALL	RFROM
        CALL	ONEP
CMOV2:	CALL	DONXT
        .word	CMOV1
        JP	DDROP

;       FILL    ( b u c -- )
;       Fill u bytes of character c
;       to area beginning at b.
        .word       LINK
LINK = . 
        .byte       4
        .ascii     "FILL"
FILL:
.if CONVERT_TO_CODE
        ldw y,x 
        ld a,(1,y) ; c 
        addw x,#CELLL ; drop c 
        ldw y,x 
        ldw y,(y) ; count
        pushw y 
        addw x,#CELLL ; drop u 
        ldw y,x 
        addw x,#CELLL ; drop b 
        ldw y,(y) ; address
        ldw YTEMP,y
        popw y ; count 
FILL1:  
        ld [YTEMP],a 
        inc YTEMP+1
        jrnc FILL2 
        inc YTEMP
FILL2: 
        decw y ; count 
        jrne FILL1  
        ret 
.else 
        CALL	SWAPP
        CALL	TOR
        CALL	SWAPP
        CALL	BRAN
        .word	FILL2
FILL1:	CALL	DDUP
        CALL	CSTOR
        CALL	ONEP
FILL2:	CALL	DONXT
        .word	FILL1
        JP	DDROP
.endif

;       ERASE   ( b u -- )
;       Erase u bytes beginning at b.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     "ERASE"
ERASE:
.if CONVERT_TO_CODE
        clrw y 
        subw x,#CELLL 
        ldw (x),y 
        jp FILL 
.else 
        CALL     ZERO
        JP     FILL
.endif 
;       PACK0x   ( b u a -- a )
;       Build a counted string with
;       u characters from b. Null fill.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     "PACK0X"
PACKS:
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

;       DIGIT   ( u -- c )
;       Convert digit u to a character.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     "DIGIT"
DIGIT:
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

;       EXTRACT ( n base -- n c )
;       Extract least significant digit from n.
        .word      LINK
LINK = . 
        .byte      7
        .ascii     "EXTRACT"
EXTRC:
        CALL     ZERO
        CALL     SWAPP
        CALL     UMMOD
        CALL     SWAPP
        JP     DIGIT

;       <#      ( -- )
;       Initiate  numeric output process.
        .word      LINK
LINK = . 
        .byte      2
        .ascii     "<#"
BDIGS:
        CALL     PAD
        CALL     HLD
        JP     STORE

;       HOLD    ( c -- )
;       Insert a character into output string.
        .word      LINK
LINK = . 
        .byte      4
        .ascii     "HOLD"
HOLD:
        CALL     HLD
        CALL     AT
        CALL     ONEM
        CALL     DUPP
        CALL     HLD
        CALL     STORE
        JP     CSTOR

;       #       ( u -- u )
;       Extract one digit from u and
;       append digit to output string.
        .word      LINK
LINK = . 
        .byte      1
        .ascii     "#"
DIG:
        CALL     BASE
        CALL     AT
        CALL     EXTRC
        JP     HOLD

;       #S      ( u -- 0 )
;       Convert u until all digits
;       are added to output string.
        .word      LINK
LINK = . 
        .byte      2
        .ascii     "#S"
DIGS:
DIGS1:  CALL     DIG
        CALL     DUPP
        CALL     QBRAN
        .word      DIGS2
        JRA     DIGS1
DIGS2:  RET

;       SIGN    ( n -- )
;       Add a minus sign to
;       numeric output string.
        .word      LINK
LINK = . 
        .byte      4
        .ascii     "SIGN"
SIGN:
        CALL     ZLESS
        CALL     QBRAN
        .word      SIGN1
        CALL     DOLIT
        .word      45	;"-"
        JP     HOLD
SIGN1:  RET

;       #>      ( w -- b u )
;       Prepare output string.
        .word      LINK
LINK = . 
        .byte      2
        .ascii     "#>"
EDIGS:
        CALL     DROP
        CALL     HLD
        CALL     AT
        CALL     PAD
        CALL     OVER
        JP     SUBB

;       str     ( w -- b u )
;       Convert a signed integer
;       to a numeric string.
        .word      LINK
LINK = . 
        .byte      3
        .ascii     "STR"
STR:
        CALL     DUPP
        CALL     TOR
        CALL     ABSS
        CALL     BDIGS
        CALL     DIGS
        CALL     RFROM
        CALL     SIGN
        JP     EDIGS

;       HEX     ( -- )
;       Use radix 16 as base for
;       numeric conversions.
        .word      LINK
LINK = . 
        .byte      3
        .ascii     "HEX"
HEX:
        CALL     DOLIT
        .word      16
        CALL     BASE
        JP     STORE

;       DECIMAL ( -- )
;       Use radix 10 as base
;       for numeric conversions.
        .word      LINK
LINK = . 
        .byte      7
        .ascii     "DECIMAL"
DECIM:
        CALL     DOLIT
        .word      10
        CALL     BASE
        JP     STORE

;; Numeric input, single precision

;       DIGIT?  ( c base -- u t )
;       Convert a character to its numeric
;       value. A flag indicates success.
        .word      LINK
LINK = . 
        .byte       6
        .ascii     "DIGIT?"
DIGTQ:
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

;       NUMBER? ( a -- n T | a F )
;       Convert a number string to
;       integer. Push a flag on tos.
        .word      LINK
LINK = . 
        .byte      7
        .ascii     "NUMBER?"
NUMBQ:
        CALL     BASE
        CALL     AT
        CALL     TOR
        CALL     ZERO
        CALL     OVER
        CALL     COUNT
        CALL     OVER
        CALL     CAT
        CALL     DOLIT
        .word     36	; "0x"
        CALL     EQUAL
        CALL     QBRAN
        .word      NUMQ1
        CALL     HEX
        CALL     SWAPP
        CALL     ONEP
        CALL     SWAPP
        CALL     ONEM
NUMQ1:  CALL     OVER
        CALL     CAT
        CALL     DOLIT
        .word     45	; "-"
        CALL     EQUAL
        CALL     TOR
        CALL     SWAPP
        CALL     RAT
        CALL     SUBB
        CALL     SWAPP
        CALL     RAT
        CALL     PLUS
        CALL     QDUP
        CALL     QBRAN
        .word      NUMQ6
        CALL     ONEM
        CALL     TOR
NUMQ2:  CALL     DUPP
        CALL     TOR
        CALL     CAT
        CALL     BASE
        CALL     AT
        CALL     DIGTQ
        CALL     QBRAN
        .word      NUMQ4
        CALL     SWAPP
        CALL     BASE
        CALL     AT
        CALL     STAR
        CALL     PLUS
        CALL     RFROM
        CALL     ONEP
        CALL     DONXT
        .word      NUMQ2
        CALL     RAT
        CALL     SWAPP
        CALL     DROP
        CALL     QBRAN
        .word      NUMQ3
        CALL     NEGAT
NUMQ3:  CALL     SWAPP
        JRA     NUMQ5
NUMQ4:  CALL     RFROM
        CALL     RFROM
        CALL     DDROP
        CALL     DDROP
        CALL     ZERO
NUMQ5:  CALL     DUPP
NUMQ6:  CALL     RFROM
        CALL     DDROP
        CALL     RFROM
        CALL     BASE
        JP     STORE

;; Basic I/O

;       KEY     ( -- c )
;       Wait for and return an
;       input character.
        .word      LINK
LINK = . 
        .byte      3
        .ascii     "KEY"
KEY:
.if CONVERT_TO_CODE
        btjf UART1_SR,#UART_SR_RXNE,. 
        ld a,UART1_DR 
        subw x,#CELLL 
        ld (1,x),a 
        clr (x)
        ret 
.else 
KEY1:   CALL     QKEY
        CALL     QBRAN
        .word      KEY1
        RET
.endif 

;       NUF?    ( -- t )
;       Return false if no input,
;       else pause and if CR return true.
        .word      LINK
LINK = . 
        .byte      4
        .ascii     "NUF?"
NUFQ:
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

;       SPACE   ( -- )
;       Send  blank character to
;       output device.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     "SPACE"
SPACE:
        CALL     BLANK
        JP     EMIT

;       SPACES  ( +n -- )
;       Send n spaces to output device.
        .word      LINK
LINK = . 
        .byte      6
        .ascii     "SPACES"
SPACS:
        CALL     ZERO
        CALL     MAX
        CALL     TOR
        JRA      CHAR2
CHAR1:  CALL     SPACE
CHAR2:  CALL     DONXT
        .word    CHAR1
        RET

;       TYPE    ( b u -- )
;       Output u characters from b.
        .word      LINK
LINK = . 
        .byte      4
        .ascii     "TYPE"
TYPES:
        CALL     TOR
        JRA     TYPE2
TYPE1:  CALL     DUPP
        CALL     CAT
        CALL     EMIT
        CALL     ONEP
TYPE2:  CALL     DONXT
        .word      TYPE1
        JP     DROP

;       CR      ( -- )
;       Output a carriage return
;       and a line feed.
        .word      LINK
LINK = . 
        .byte      2
        .ascii     "CR"
CR:
        CALL     DOLIT
        .word      CRR
        CALL     EMIT
        CALL     DOLIT
        .word      LF
        JP     EMIT

;       do$     ( -- a )
;       Return  address of a compiled
;       string.
        .word      LINK
LINK = . 
	.byte      COMPO+3
        .ascii     "DO$"
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

;       $"|     ( -- a )
;       Run time routine compiled by $".
;       Return address of a compiled string.
        .word      LINK
LINK = . 
	.byte      COMPO+3
        .byte     '$','"','|'
STRQP:
        CALL     DOSTR
        RET

;       ."|     ( -- )
;       Run time routine of ." .
;       Output a compiled string.
        .word      LINK
LINK = . 
	.byte      COMPO+3
        .byte     '.','"','|'
DOTQP:
        CALL     DOSTR
        CALL     COUNT
        JP     TYPES

;       .R      ( n +n -- )
;       Display an integer in a field
;       of n columns, right justified.
        .word      LINK
LINK = . 
        .byte      2
        .ascii     ".R"
DOTR:
        CALL     TOR
        CALL     STR
        CALL     RFROM
        CALL     OVER
        CALL     SUBB
        CALL     SPACS
        JP     TYPES

;       U.R     ( u +n -- )
;       Display an unsigned integer
;       in n column, right justified.
        .word      LINK
LINK = . 
        .byte      3
        .ascii     "U.R"
UDOTR:
        CALL     TOR
        CALL     BDIGS
        CALL     DIGS
        CALL     EDIGS
        CALL     RFROM
        CALL     OVER
        CALL     SUBB
        CALL     SPACS
        JP     TYPES

;       U.      ( u -- )
;       Display an unsigned integer
;       in free format.
        .word      LINK
LINK = . 
        .byte      2
        .ascii     "U."
UDOT:
        CALL     BDIGS
        CALL     DIGS
        CALL     EDIGS
        CALL     SPACE
        JP     TYPES

;       .       ( w -- )
;       Display an integer in free
;       format, preceeded by a space.
        .word      LINK
LINK = . 
        .byte      1
        .ascii     "."
DOT:
        CALL     BASE
        CALL     AT
        CALL     DOLIT
        .word      10
        CALL     XORR    ;?decimal
        CALL     QBRAN
        .word      DOT1
        JP     UDOT
DOT1:   CALL     STR
        CALL     SPACE
        JP     TYPES

;       ?       ( a -- )
;       Display contents in memory cell.
        .word      LINK
        
LINK = . 
        .byte      1
        .ascii     "?"
QUEST:
        CALL     AT
        JP     DOT

;; Parsing

;       parse   ( b u c -- b u delta ; <string> )
;       Scan string delimited by c.
;       Return found string and its offset.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     "parse"
PARS:
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

;       PARSE   ( c -- b u ; <string> )
;       Scan input stream and return
;       counted string delimited by c.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     "PARSE"
PARSE:
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

;       .(      ( -- )
;       Output following string up to next ) .
        .word      LINK
LINK = . 
	.byte      IMEDD+2
        .ascii     ".("
DOTPR:
        CALL     DOLIT
        .word     41	; ")"
        CALL     PARSE
        JP     TYPES

;       (       ( -- )
;       Ignore following string up to next ).
;       A comment.
        .word      LINK
LINK = . 
	.byte      IMEDD+1
        .ascii     "("
PAREN:
        CALL     DOLIT
        .word     41	; ")"
        CALL     PARSE
        JP     DDROP

;       \       ( -- )
;       Ignore following text till
;       end of line.
        .word      LINK
LINK = . 
	.byte      IMEDD+1
        .ascii     "\"
BKSLA:
.if CONVERT_TO_CODE
        ldw y,#UCTIB ; #TIB  
        ldw y,(y)
        pushw y ; count in TIB 
        ldw y,#UINN ; >IN 
        ldw YTEMP,y
        popw y 
        ldw [YTEMP],y
        ret 
.else
        CALL     NTIB
        CALL     AT
        CALL     INN
        JP     STORE
.endif 

;       WORD    ( c -- a ; <string> )
;       Parse a word from input stream
;       and copy it to code dictionary.
        .word      LINK
LINK = . 
        .byte      4
        .ascii     "WORD"
WORDD:
        CALL     PARSE
        CALL     HERE
        CALL     CELLP
        JP     PACKS

;       TOKEN   ( -- a ; <string> )
;       Parse a word from input stream
;       and copy it to name dictionary.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     "TOKEN"
TOKEN:
        CALL     BLANK
        JP     WORDD

;; Dictionary search

;       NAME>   ( na -- ca )
;       Return a code address given
;       a name address.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     "NAME>"
NAMET:
        CALL     COUNT
        CALL     DOLIT
        .word      31
        CALL     ANDD
        JP     PLUS

;       SAME?   ( a a u -- a a f \ -0+ )
;       Compare u cells in two
;       strings. Return 0 if identical.
        .word      LINK
LINK = . 
        .byte       5
        .ascii     "SAME?"
SAMEQ:
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

;       find    ( a va -- ca na | a F )
;       Search vocabulary for string.
;       Return ca and na if succeeded.
        .word      LINK
LINK = . 
        .byte      4
        .ascii     "FIND"
FIND:
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

;       NAME?   ( a -- ca na | a F )
;       Search vocabularies for a string.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     "NAME?"
NAMEQ:
        CALL   CNTXT
        JP     FIND

;; Terminal response

;       ^H      ( bot eot cur -- bot eot cur )
;       Backup cursor by one character.
        .word      LINK
LINK = . 
        .byte      2
        .ascii     "^H"
BKSP:
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

;       TAP     ( bot eot cur c -- bot eot cur )
;       Accept and echo key stroke
;       and bump cursor.
        .word      LINK
LINK = . 
        .byte      3
        .ascii     "TAP"
TAP:
        CALL     DUPP
        CALL     EMIT
        CALL     OVER
        CALL     CSTOR
        JP     ONEP

;       kTAP    ( bot eot cur c -- bot eot cur )
;       Process a key stroke,
;       CR or backspace.
        .word      LINK
LINK = . 
        .byte      4
        .ascii     "KTAP"
KTAP:
        CALL     DUPP
        CALL     DOLIT
        .word      CRR
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

;       accept  ( b u -- b u )
;       Accept characters to input
;       buffer. Return with actual count.
        .word      LINK
LINK = . 
        .byte      6
        .ascii     "ACCEPT"
ACCEP:
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

;       QUERY   ( -- )
;       Accept input stream to
;       terminal input buffer.
        .word      LINK
        
LINK = . 
        .byte      5
        .ascii     "QUERY"
QUERY:
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

;       ABORT   ( -- )
;       Reset data stack and
;       jump to QUIT.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     "ABORT"
ABORT:
        CALL     PRESE
        JP     QUIT

;       abort"  ( f -- )
;       Run time routine of ABORT".
;       Abort with a message.
        .word      LINK
LINK = . 
	.byte      COMPO+6
        .ascii     "ABORT"
        .byte      '"'
ABORQ:
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

;       $INTERPRET      ( a -- )
;       Interpret a word. If failed,
;       try to convert it to an integer.
        .word      LINK
LINK = . 
        .byte      10
        .ascii     "$INTERPRET"
INTER:
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
        JP     EXECU
INTE1:  CALL     NUMBQ   ;convert a number
        CALL     QBRAN
        .word    ABOR1
        RET

;       [       ( -- )
;       Start  text interpreter.
        .word      LINK
LINK = . 
	.byte      IMEDD+1
        .ascii     "["
LBRAC:
        CALL   DOLIT
        .word  INTER
        CALL   TEVAL
        JP     STORE

;       .OK     ( -- )
;       Display 'ok' while interpreting.
        .word      LINK
LINK = . 
        .byte      3
        .ascii     ".OK"
DOTOK:
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

;       ?STACK  ( -- )
;       Abort if stack underflows.
        .word      LINK
LINK = . 
        .byte      6
        .ascii     "?STACK"
QSTAC: 
        CALL     DEPTH
        CALL     ZLESS   ;check only for underflow
        CALL     ABORQ
        .byte      11
        .ascii     " underflow "
        RET

;       EVAL    ( -- )
;       Interpret  input stream.
        .word      LINK
LINK = . 
        .byte      4
        .ascii     "EVAL"
EVAL:
EVAL1:  CALL     TOKEN
        CALL     DUPP
        CALL     CAT     ;?input stream empty
        CALL     QBRAN
        .word    EVAL2
        CALL     TEVAL
        CALL     ATEXE
        CALL     QSTAC   ;evaluate input, check stack
        CALL     BRAN
        .word    EVAL1
EVAL2:  CALL     DROP
        JP       DOTOK

;       PRESET  ( -- )
;       Reset data stack pointer and
;       terminal input buffer.
        .word      LINK
LINK = . 
        .byte      6
        .ascii     "PRESET"
PRESE:
        CALL     DOLIT
        .word      SPP
        CALL     SPSTO
        CALL     DOLIT
        .word      TIBB
        CALL     NTIB
        CALL     CELLP
        JP     STORE

;       QUIT    ( -- )
;       Reset return stack pointer
;       and start text interpreter.
        .word      LINK
LINK = . 
        .byte      4
        .ascii     "QUIT"
QUIT:
        CALL     DOLIT
        .word      RPP
        CALL     RPSTO   ;reset return stack pointer
QUIT1:  CALL     LBRAC   ;start interpretation
QUIT2:  CALL     QUERY   ;get input
        CALL     EVAL
        JRA     QUIT2   ;continue till error

;; The compiler

;       '       ( -- ca )
;       Search vocabularies for
;       next word in input stream.
        .word      LINK
LINK = . 
        .byte      1
        .ascii     "'"
TICK:
        CALL     TOKEN
        CALL     NAMEQ   ;?defined
        CALL     QBRAN
        .word      ABOR1
        RET     ;yes, push code address

;       ALLOT   ( n -- )
.if PICATOUT_MOD
;       Allocate n bytes to RAM 
.else 
;       Allocate n bytes to  code dictionary.
.endif 
        .word      LINK
LINK = . 
        .byte      5
        .ascii     "ALLOT"
ALLOT:
        CALL     VPP
.if PICATOUT_MOD
; must update APP_VP each time VP is modidied
        call PSTOR 
        call UPDATVP 
.else
        JP     PSTOR
.endif ;PICATOUT_MOD

;       ,       ( w -- )
;         Compile an integer into
;         variable space.
        .word      LINK
LINK = . 
        .byte      1
        .ascii     ","
COMMA:
        CALL     HERE
        CALL     DUPP
        CALL     CELLP   ;cell boundary
        CALL     VPP
        CALL     STORE
        JP     STORE

;       C,      ( c -- )
;       Compile a byte into
;       variables space.
       .word      LINK
LINK = . 
        .byte      2
        .ascii     "C,"
CCOMMA:
        CALL     HERE
        CALL     DUPP
        CALL     ONEP
        CALL     VPP
        CALL     STORE
        JP     CSTOR

;       [COMPILE]       ( -- ; <string> )
;       Compile next immediate
;       word into code dictionary.
        .word      LINK
LINK = . 
	.byte      IMEDD+9
        .ascii     "[COMPILE]"
BCOMP:
        CALL     TICK
        JP     JSRC

;       COMPILE ( -- )
;       Compile next jsr in
;       colon list to code dictionary.
        .word      LINK
LINK = . 
	.byte      COMPO+7
        .ascii     "COMPILE"
COMPI:
        CALL     RFROM
.if PICATOUT_MOD
; no need to increment
.else
        CALL     ONEP
.endif 
        CALL     DUPP
        CALL     AT
        CALL     JSRC    ;compile subroutine
        CALL     CELLP
.if PICATOUT_MOD
        ldw y,x 
        ldw y,(y)
        addw x,#CELLL 
        jp (y)
.else 
        JP     TOR
.endif 

;       LITERAL ( w -- )
;       Compile tos to dictionary
;       as an integer literal.
        .word      LINK
LINK = . 
	.byte      IMEDD+7
        .ascii     "LITERAL"
LITER:
        CALL     COMPI
.if PICATOUT_MOD
        .word DOLIT 
.else         
        CALL     DOLIT
.endif 
        JP     COMMA

;       $,"     ( -- )
;       Compile a literal string
;       up to next " .
        .word      LINK
LINK = . 
        .byte      3
        .byte     '$',',','"'
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

;       FOR     ( -- a )
;       Start a FOR-NEXT loop
;       structure in a colon definition.
        .word      LINK
LINK = . 
	.byte      IMEDD+3
        .ascii     "FOR"
FOR:
        CALL     COMPI
.if PICATOUT_MOD
        .word TOR 
.else
        CALL     TOR
.endif
        JP     HERE

;       NEXT    ( a -- )
;       Terminate a FOR-NEXT loop.
        .word      LINK
LINK = . 
	.byte      IMEDD+4
        .ascii     "NEXT"
NEXT:
        CALL     COMPI
.if PICATOUT_MOD
        .word DONXT 
.else 
        CALL     DONXT
.endif         
.if PICATOUT_MOD
        call ADRADJ
.endif ; PICATOUT_MOD
        JP     COMMA

;       I ( -- n )
;       stack FOR-NEXT COUNTER 
        .word LINK 
        LINK=.
        .byte 1 
        .ascii "I"
IFETCH: 
        subw x,#CELLL 
        ldw y,(3,sp)
        ldw (x),y 
        ret 

;       BEGIN   ( -- a )
;       Start an infinite or
;       indefinite loop structure.
        .word      LINK
LINK = . 
	.byte      IMEDD+5
        .ascii     "BEGIN"
BEGIN:
        JP     HERE

;       UNTIL   ( a -- )
;       Terminate a BEGIN-UNTIL
;       indefinite loop structure.
        .word      LINK
LINK = . 
	.byte      IMEDD+5
        .ascii     "UNTIL"
UNTIL:
        CALL     COMPI
.if PICATOUT_MOD
        .word    QBRAN 
.else 
        CALL     QBRAN
.endif 
.if PICATOUT_MOD 
        call ADRADJ
.endif ; PICATOUT_MOD
        JP     COMMA

;       AGAIN   ( a -- )
;       Terminate a BEGIN-AGAIN
;       infinite loop structure.
        .word      LINK
LINK = . 
	.byte      IMEDD+5
        .ascii     "AGAIN"
AGAIN:
        CALL     COMPI
.if PICATOUT_MOD
        .word BRAN
.else
        CALL     BRAN
.endif 
.if PICATOUT_MOD 
        call ADRADJ 
.endif ; PICATOUT_MOD
        JP     COMMA

;       IF      ( -- A )
;       Begin a conditional branch.
        .word      LINK
LINK = . 
	.byte      IMEDD+2
        .ascii     "IF"
IFF:
        CALL     COMPI
.if PICATOUT_MOD
        .word QBRAN
.else
        CALL     QBRAN
.endif 
        CALL     HERE
        CALL     ZERO
        JP     COMMA

;       THEN        ( A -- )
;       Terminate a conditional branch structure.
        .word      LINK
LINK = . 
	.byte      IMEDD+4
        .ascii     "THEN"
THENN:
        CALL     HERE
.if PICATOUT_MOD 
        call ADRADJ 
.endif ; PICATOUT_MOD
        CALL     SWAPP
        JP     STORE

;       ELSE        ( A -- A )
;       Start the false clause in an IF-ELSE-THEN structure.
        .word      LINK
LINK = . 
	.byte      IMEDD+4
        .ascii     "ELSE"
ELSEE:
        CALL     COMPI
.if PICATOUT_MOD
        .word BRAN
.else
        CALL     BRAN
.endif 
        CALL     HERE
        CALL     ZERO
        CALL     COMMA
        CALL     SWAPP
        CALL     HERE
.if PICATOUT_MOD 
        call ADRADJ 
.endif ; PICATOUT_MOD
        CALL     SWAPP
        JP     STORE

;       AHEAD       ( -- A )
;       Compile a forward branch instruction.
        .word      LINK
LINK = . 
	.byte      IMEDD+5
        .ascii     "AHEAD"
AHEAD:
        CALL     COMPI
.if PICATOUT_MOD
        .word BRAN
.else
        CALL     BRAN
.endif 
        CALL     HERE
        CALL     ZERO
        JP     COMMA

;       WHILE       ( a -- A a )
;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
        .word      LINK
LINK = . 
	.byte      IMEDD+5
        .ascii     "WHILE"
WHILE:
        CALL     COMPI
.if PICATOUT_MOD
        .word QBRAN
.else
        CALL     QBRAN
.endif 
        CALL     HERE
        CALL     ZERO
        CALL     COMMA
        JP     SWAPP

;       REPEAT      ( A a -- )
;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
        .word      LINK
LINK = . 
        .byte      IMEDD+6
        .ascii     "REPEAT"
REPEA:
        CALL     COMPI
.if PICATOUT_MOD
        .word BRAN
.else
        CALL     BRAN
.endif 
.if PICATOUT_MOD 
        call ADRADJ 
.endif ; PICATOUT_MOD
        CALL     COMMA
        CALL     HERE
.if PICATOUT_MOD 
        call ADRADJ 
.endif ; PICATOUT_MOD
        CALL     SWAPP
        JP     STORE

;       AFT         ( a -- a A )
;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
        .word      LINK
LINK = . 
	.byte      IMEDD+3
        .ascii     "AFT"
AFT:
        CALL     DROP
        CALL     AHEAD
        CALL     HERE
        JP     SWAPP

;       ABORT"      ( -- ; <string> )
;       Conditional abort with an error message.
        .word      LINK
LINK = . 
	.byte      IMEDD+6
        .ascii     "ABORT"
        .byte      '"'
ABRTQ:
        CALL     COMPI
.if PICATOUT_MOD
        .word ABORQ
.else
        CALL     ABORQ
.endif
        JP     STRCQ

;       $"     ( -- ; <string> )
;       Compile an inline string literal.
        .word      LINK
LINK = . 
	.byte      IMEDD+2
        .byte     '$','"'
STRQ:
        CALL     COMPI
.if PICATOUT_MOD
        .word STRQP 
.else
        CALL     STRQP
.endif
        JP     STRCQ

;       ."          ( -- ; <string> )
;       Compile an inline string literal to be typed out at run time.
        .word      LINK
LINK = . 
	.byte      IMEDD+2
        .byte     '.','"'
DOTQ:
        CALL     COMPI
.if PICATOUT_MOD
        .word DOTQP 
.else
        CALL     DOTQP
.endif 
        JP     STRCQ

;; Name compiler

;       ?UNIQUE ( a -- a )
;       Display a warning message
;       if word already exists.
        .word      LINK
LINK = . 
        .byte      7
        .ascii     "?UNIQUE"
UNIQU:
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

;       $,n     ( na -- )
;       Build a new dictionary name
;       using string at na.
.if PICATOUT_MOD
; compile dans l'espace des variables 
.endif 
        .word      LINK
LINK = . 
        .byte      3
        .ascii     "$,n"
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

;       $COMPILE        ( a -- )
;       Compile next word to
;       dictionary as a token or literal.
        .word      LINK
LINK = . 
        .byte      8
        .ascii     "$COMPILE"
SCOMP:
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
        CALL     QBRAN
        .word      ABOR1
        JP     LITER

;       OVERT   ( -- )
;       Link a new word into vocabulary.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     "OVERT"
OVERT:
        CALL     LAST
        CALL     AT
        CALL     CNTXT
        JP     STORE

;       ;       ( -- )
;       Terminate a colon definition.
        .word      LINK
LINK = . 
	.byte      IMEDD+COMPO+1
        .ascii     ";"
SEMIS:
        CALL     COMPI
.if PICATOUT_MOD
        .word EXIT 
.else
        CALL     EXIT
.endif 
        CALL     LBRAC
.if PICATOUT_MOD
        call OVERT 
        CALL FMOVE
        call QDUP 
        call QBRAN 
        .word 1$ 
        CALL UPDATPTR 
1$:     RET 
.else 
        JP     OVERT
.endif 

.if PICATOUT_MOD
;       Terminate an ISR definition 
;       retourn ca of ISR as double
;       I; ( -- ud )
        .word LINK 
        LINK=.
        .byte 2+IMEDD+COMPO 
        .ascii "I;" 
ISEMI:
        subw x,#CELLL  
        ldw y,#IRET_CODE 
        ldw (x),y 
        call CCOMMA
        call LBRAC 
        call IFMOVE
        call QDUP 
        CALL QBRAN 
        .word 1$ 
        CALL CPP
        call AT 
        call SWAPP 
        CALL CPP 
        call STORE 
        call UPDATCP 
        call EEPVP 
        call DROP 
        call AT 
        call VPP 
        call STORE 
        jp ZERO
1$:     ret           
        
.endif ;PICATOUT_MOD

;       ]       ( -- )
;       Start compiling words in
;       input stream.
        .word      LINK
LINK = . 
        .byte      1
        .ascii     "]"
RBRAC:
        CALL   DOLIT
        .word  SCOMP
        CALL   TEVAL
        JP     STORE

;       CALL,    ( ca -- )
;       Compile a subroutine call.
        .word      LINK
LINK = . 
        .byte      4
        .ascii     "CALL,"
JSRC:
        CALL     DOLIT
        .word     CALLL     ;CALL
        CALL     CCOMMA
        JP     COMMA

.if PICATOUT_MOD
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
        call DROP  
        call CPP 
        call AT 
        call HERE
        call SUBB 
1$:     call OFFSET 
        jp STORE  
.endif 

;       :       ( -- ; <string> )
;       Start a new colon definition
;       using next word as its name.
        .word      LINK
LINK = . 
        .byte      1
        .ascii     ":"
COLON:
.if PICATOUT_MOD
        call INITOFS       
.endif ; PICATOUT_MOD
        CALL   TOKEN
        CALL   SNAME
        JP     RBRAC

.if PICATOUT_MOD 
;       I:  ( -- )
;       Start interrupt service routine definition
;       those definition have no name.
        .word LINK
        LINK=.
        .byte 2 
        .ascii "I:" 
ICOLON:
        call INITOFS 
        jp RBRAC  
.endif ; PICATOUT_MOD

;       IMMEDIATE       ( -- )
;       Make last compiled word
;       an immediate word.
        .word      LINK
LINK = . 
        .byte      9
        .ascii     "IMMEDIATE"
IMMED:
        CALL     DOLIT
        .word     0x8000	;  IMEDD*256
        CALL     LAST
        CALL     AT
        CALL     AT
        CALL     ORR
        CALL     LAST
        CALL     AT
        JP     STORE

;; Defining words

;       CREATE  ( -- ; <string> )
;       Compile a new array
;       without allocating space.
        .word      LINK
LINK = . 
        .byte      6
        .ascii     "CREATE"
CREAT:
        CALL     TOKEN
        CALL     SNAME
        CALL     OVERT        
        CALL     COMPI 
.if PICATOUT_MOD
        .word DOVAR 
.else
        CALL     DOVAR
.endif 
        RET

;       VARIABLE        ( -- ; <string> )
;       Compile a new variable
;       initialized to 0.
        .word      LINK
LINK = . 
        .byte      8
        .ascii     "VARIABLE"
VARIA:
.if PICATOUT_MOD
; indirect variable so that VARIABLE definition can be compiled in FLASH 
        CALL HERE
        CALL DUPP 
        CALL CELLP
        CALL VPP 
        CALL STORE
        call UPDATVP 
.endif         
        CALL CREAT
        CALL DUPP
        CALL COMMA
        CALL ZERO
.if PICATOUT_MOD 
        call SWAPP 
        CALL STORE 
        CALL FMOVE ; move definition to FLASH
        CALL QDUP 
        CALL QBRAN 
        .word 1$
        CALL UPDATPTR
1$:     RET 
.endif ;PICATOUT_MOD        

.if PICATOUT_MOD
;       CONSTANT  ( n -- ; <string> )
;       Compile a new constant 
;       n CONSTANT name 
        .word LINK 
        LINK=. 
        .byte 8 
        .ascii "CONSTANT" 
CONSTANT:          
        CALL TOKEN
        CALL SNAME 
        CALL OVERT 
        CALL COMPI 
.if PICATOUT_MOD
        .word DOCONST
.else
        CALL DOCONST
.endif 
        CALL COMMA 
        CALL FMOVE
        CALL QDUP 
        CALL QBRAN 
        .word 1$ 
        CALL UPDATPTR  
1$:     RET          

; CONSTANT runtime semantic 
; doCONST  ( -- n )
        .word LINK 
        LINK=.
        .byte 7
        .ascii "DOCONST"
DOCONST:
        subw x,#CELLL
        popw y 
        ldw y,(y) 
        ldw (x),y 
        ret 
.endif ;PICATOUT_MOD


;; Tools

;       _TYPE   ( b u -- )
;       Display a string. Filter
;       non-printing characters.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     "_TYPE"
UTYPE:
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

;       dm+     ( a u -- a )
;       Dump u bytes from ,
;       leaving a+u on  stack.
        .word      LINK
LINK = . 
        .byte      3
        .ascii     "dm+"
DUMPP:
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

;       DUMP    ( a u -- )
;       Dump u bytes from a,
;       in a formatted manner.
        .word      LINK
LINK = . 
        .byte      4
        .ascii     "DUMP"
DUMP:
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

;       .S      ( ... -- ... )
;        Display  contents of stack.
        .word      LINK
LINK = . 
        .byte      2
        .ascii     ".S"
DOTS:
        CALL     CR
        CALL     DEPTH   ;stack depth
        CALL     TOR     ;start count down loop
        JRA     DOTS2   ;skip first pass
DOTS1:  CALL     RAT
        CALL ONEP
	CALL     PICK
        CALL     DOT     ;index stack, display contents
DOTS2:  CALL     DONXT
        .word      DOTS1   ;loop till done
        CALL     DOTQP
        .byte      5
        .ascii     " <sp "
        RET

;       >NAME   ( ca -- na | F )
;       Convert code address
;       to a name address.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     ">NAME"
TNAME:
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

;       .ID     ( na -- )
;        Display  name at address.
        .word      LINK
LINK = . 
        .byte      3
        .ascii     ".ID"
DOTID:
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
;       SEE     ( -- ; <string> )
;       A simple decompiler.
;       Updated for byte machines.
        .word      LINK
LINK = . 
        .byte      3
        .ascii     "SEE"
SEE:
        CALL     TICK    ;starting address
        CALL     CR
        CALL     ONEM
SEE1:   CALL     ONEP
        CALL     DUPP
        CALL     AT
        CALL     DUPP    ;?does it contain a zero
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

;       WORDS   ( -- )
;       Display names in vocabulary.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     "WORDS"
WORDS:
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
        CALL     DROP
WORS2:  RET

        
;; Hardware reset

;       hi      ( -- )
;       Display sign-on message.
        .word      LINK
LINK = . 
        .byte      2
        .ascii     "hi"
HI:
        CALL     CR
        CALL     DOTQP   ;initialize I/O
        .byte      15
        .ascii     "stm8eForth v"
	.byte      VER+'0'
        .byte      '.' 
	.byte      EXT+'0' ;version
        JP     CR

WANT_DEBUG=0
.if WANT_DEBUG 
;       DEBUG      ( -- )
;       Display sign-on message.
;        .word      LINK
LINK = . 
        .byte      5
        .ascii     "DEBUG"
DEBUG:
	CALL DOLIT
	.word 0x65
	CALL EMIT
	CALL DOLIT
	.word 0
 	CALL ZLESS 
	CALL DOLIT
	.word 0xFFFE
	CALL ZLESS 
	CALL UPLUS 
 	CALL DROP 
	CALL DOLIT
	.word 3
	CALL UPLUS 
	CALL UPLUS 
 	CALL DROP
	CALL DOLIT
	.word 0x43
	CALL UPLUS 
 	CALL DROP
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
	CALL DROP
	CALL EMIT
	CALL DOLIT
	.word 0
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
	CALL DOLIT
	.word 1
	CALL UPLUS 
	CALL DROP
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
	CALL DROP
	CALL EMIT
	CALL EMIT
	CALL DOLIT
	.word 0x2043
	CALL DOLIT
	.word 0
	CALL DOLIT
	.word 0x100
	CALL UMMOD
	CALL EMIT
	CALL EMIT
	;JP ORIG
	RET
.endif ; WANT_DEBUG 


;       'BOOT   ( -- a )
;       The application startup vector.
        .word      LINK
LINK = . 
        .byte      5
        .ascii     "'BOOT"
TBOOT:
        CALL     DOVAR
        .word    APP_RUN      ;application to boot

;       COLD    ( -- )
;       The hilevel cold start s=ence.
        .word      LINK
        LINK = . 
        .byte      4
        .ascii     "COLD"
COLD:
.if WANT_DEBUG
        CALL DEBUG
.endif 
COLD1:  CALL     DOLIT
        .word      UZERO
	CALL     DOLIT
        .word      UPP
        CALL     DOLIT
	.word      UEND-UZERO
        CALL     CMOVE   ;initialize user area

.if PICATOUT_MOD
; if APP_RUN==0 initialize with ca de 'hi'  
        ldw y,APP_RUN 
        jrne 0$
        subw x,#CELLL 
        ldw y,#HI  
        ldw (x),y
        call UPDATRUN 
0$:        
; update LAST with APP_LAST 
; if APP_LAST > LAST else do the opposite
        ldw y,APP_LAST 
        cpw y,ULAST 
        jrugt 1$ 
; save LAST at APP_LAST  
        call UPDATLAST 
        jra 2$
1$: ; update LAST with APP_LAST 
        ldw ULAST,y
        ldw UCNTXT,y 
2$:  
; update APP_CP if < app_space 
        ldw y,APP_CP  
        cpw y,UCP   
        jruge 3$ 
        call UPDATCP
        ldw y,UCP   
3$:
        ldw UCP,y                 
; update UVP with APP_VP  
; if APP_VP>UVP else do the opposite 
        ldw y,APP_VP 
        cpw y,UVP 
        jrugt 4$
        call UPDATVP 
        jra 6$
4$: ; update UVP with APP_VP 
        ldw UVP,y 
6$:      
.endif ; PICATOUT_MOD
        CALL     PRESE   ;initialize data stack and TIB
        CALL     TBOOT
        CALL     ATEXE   ;application boot
        CALL     OVERT
        JP     QUIT    ;start interpretation

.if PICATOUT_MOD
        ; keep this include at end 
        .include "flash.asm"
.endif ; PICATOUT_MOD

;===============================================================

LASTN =	LINK   ;last name defined


