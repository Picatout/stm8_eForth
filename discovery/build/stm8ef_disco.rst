ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 1.
Hexadecimal [24-Bits]



                                      1 ;-------------------------------------------------------------
                                      2 ;  eForth for STM8S adapted from C. H. Ting source file to 
                                      3 ;  assemble using sdasstm8
                                      4 ;  implemented on NUCLEO-8S208RB board
                                      5 ;  Adapted by picatout 2019/10/27
                                      6 ;  https://github.com/picatout/stm8_nucleo/eForth
                                      7 ;--------------------------------------------------------------
                                      8 	.module EFORTH
                                      9          .optsdcc -mstm8
                                                .include "../inc/stm8s105.inc"
                                        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ; 2019/04/26
                                        ; STM8S105x4/6 µC registers map
                                        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        	.module stm8s105c6
                                        	
                                        ;;;;;;;;;;
                                        ; bit mask
                                        ;;;;;;;;;;
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; controller memory regions
                                        ; C4/C6,S4/S6 and K4/K6 all have 2K RAM and 1K EEPROM
                                 
                                 
                                        ; STM8S105x4 have 16K flash
                                 
                                        ; STM8S105x6 have 32K flash
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        
                                        ; options bytes
                                        ; this one can be programmed only from SWIM  (ICP)
                                 
                                        ; these can be programmed at runtime (IAP)
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; option registers usage
                                        ; read out protection, value 0xAA enable ROP
                                 
                                        ; user boot code, {0..0x3e} 512 bytes row
                                 
                                 
                                        ; alternate function register
                                 
                                 
                                        ; miscelinous options
                                 
                                 
                                        ; clock options
                                 
                                 
                                        ; HSE clock startup delay
                                 
                                 
                                        
                                        ; MISCOPT bits
                                 
                                 
                                 
                                 
                                 
                                        ; NMISCOPT bits
                                 
                                 
                                 
                                 
                                 
                                        ; CLKOPT bits
                                 
                                 
                                 
                                 
                                        
                                        ; AFR option, remapable functions
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; device ID = (read only)
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        
                                        ; port bit
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                        ; PORTS SFR OFFSET
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; GPIO
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; input modes CR1
                                 
                                 
                                        ; output mode CR1
                                 
                                 
                                        ; input modes CR2
                                 
                                 
                                        ; output speed CR2
                                 
                                 
                                        
                                        
                                        ; Flash
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; data memory unlock keys
                                 
                                 
                                        ; flash memory unlock keys
                                 
                                 
                                        ; FLASH_CR1 bits
                                 
                                 
                                 
                                 
                                        ; FLASH_CR2 bits
                                 
                                 
                                 
                                 
                                 
                                        ; FLASH_FPR bits
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; FLASH_NFPR bits
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; FLASH_IAPSR bits
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Interrupt control
                                 
                                 
                                        
                                        ; Reset Status
                                 
                                        
                                        ; Clock Registers
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Peripherals clock gating
                                        ; CLK_PCKENR1 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; CLK_PCKENR2
                                 
                                 
                                        
                                        ; Clock bits
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                        ; clock source
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Watchdog
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Beep
                                 
                                        
                                        ; SPI
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; I2C
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                        
                                        ; Precalculated values, all in KHz
                                 
                                 
                                        ;
                                        ; Fast I2C mode max rise time = 300ns
                                        ; I2C_FREQR = 16 = (MHz) => tMASTER = 1/16 = 62.5 ns
                                        ; TRISER = = (300/62.5) + 1 = floor(4.8) + 1 = 5.
                                        
                                 
                                        
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                        
                                 
                                 
                                        ;
                                        ; Standard I2C mode max rise time = 1000ns
                                        ; I2C_FREQR = 16 = (MHz) => tMASTER = 1/16 = 62.5 ns
                                        ; TRISER = = (1000/62.5) + 1 = floor(16) + 1 = 17.
                                        
                                 
                                        
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                        
                                 
                                 
                                        
                                        ; baudrate constant for brr_value table access
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; UART2
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                        
                                        ; UART Status Register bits
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Uart Control Register bits
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; TIMERS
                                        ; Timer 1 - 16-bit timer with complementary PWM outputs
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Timer Control Register bits
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Timer Slave Mode Control bits
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Timer External Trigger Enable bits
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Timer Interrupt Enable bits
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Timer Status Register bits
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                        
                                        ; Timer Event Generation Register bits
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Capture/Compare Mode Register 1 - channel configured in output
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Capture/Compare Mode Register 1 - channel configured in input
                                 
                                 
                                 
                                 
                                 
                                 
                                        ;  TIM1_CCMR1_CC1S1 = (1)
                                 
                                        
                                        ; Capture/Compare Mode Register 2 - channel configured in output
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Capture/Compare Mode Register 2 - channel configured in input
                                 
                                 
                                 
                                 
                                 
                                 
                                        ;  TIM1_CCMR2_CC2S1 = (1)
                                 
                                        
                                        ; Capture/Compare Mode Register 3 - channel configured in output
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Capture/Compare Mode Register 3 - channel configured in input
                                 
                                 
                                 
                                 
                                 
                                 
                                        ;  TIM1_CCMR3_CC3S1 = (1)
                                 
                                        
                                        ; Capture/Compare Mode Register 4 - channel configured in output
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Capture/Compare Mode Register 4 - channel configured in input
                                 
                                 
                                 
                                 
                                 
                                 
                                        ;  TIM1_CCMR4_CC4S1 = (1)
                                 
                                        
                                        ; Timer 2 - 16-bit timer
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Timer 3
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; TIM3_CR1  fields
                                 
                                 
                                 
                                 
                                 
                                        ; TIM3_CCR2  fields
                                 
                                 
                                 
                                        ; TIM3_CCER1 fields
                                 
                                 
                                 
                                 
                                        ; TIM3_CCER2 fields
                                 
                                 
                                        
                                        ; Timer 4
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Timer 4 bitmasks
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                        
                                 
                                        
                                 
                                        
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; ADC individual element access
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; ADC bitmasks
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                        
                                        ; CPU
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; global configuration register
                                 
                                        
                                        ; interrupt control registers
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; interrupt priority
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; SWIM, control and status register
                                 
                                        ; debug registers
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Interrupt Numbers
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Interrupt Vectors
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                         
                                        	.include "../inc/stm8s_disco.inc"
                                        ;-------------------------------------
                                        ; STM8S-Discovery card 
                                        ;-------------------------------------
                                        
                                        
                                 
                                 
                                 
                                        
                                        
                                        ; LD1 LED 
                                 
                                 
                                 
                                        
                                        ; BEEP
                                 
                                 
                                 
                                        
                                        ; TS1 
                                        ; use TIMER 1 3 channels 
                                        
                                        
                                     13 	.list
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



                                     15 
                                     16 ;===============================================================
                                     17 ;  Adaption to NUCLEO-8S208RB by Picatout
                                     18 ;  Date: 2020-06-07 
                                     19 ;       Suite aux nombreux changement remplacé le numéro de version pour 3.0
                                     20 ;  Date: 2019-10-26
                                     21 ;  Changes to memory map:
                                     22 ;       0x16f0  Data Stack, growing downward
                                     23 ;       0x1700  Terminal input buffer TIB
                                     24 ;       0x17ff  Return Stack, growing downard
                                     25 ;================================================================
                                     26 ;       STM8EF, Version 2.1, 13 July
                                     27 ;               Implemented on STM8S-Discovery Board.
                                     28 ;               Assembled by ST VisualDevelop STVD 
                                     29 ;               Bootup on internal 2 MHz clock
                                     30 ;               Switch to external 16 MHz crystal clock
                                     31 ;
                                     32 ; FORTH Virtual Machine:
                                     33 ; Subroutine threaded model
                                     34 ; SP Return stack pointer
                                     35 ; X Data stack pointer
                                     36 ; A,Y Scratch pad registers
                                     37 ;
                                     38 ; Memory Map:
                                     39 ; 0x0 RAM memory, system variables
                                     40 ; 0x40 variables space, linked to ROM dictionary
                                     41 ; 0x780 Data stack, growing downward
                                     42 ; 0x780 Terminal input buffer TIB
                                     43 ; 0x7FF Return stack, growing downward
                                     44 ; 0x8000 Interrupt vector table
                                     45 ; 0x8080 FORTH startup code
                                     46 ;
                                     47 ;       EF30  verion 3.0, 2020-06-23 Picatout
                                     48 ;
                                     49 ;       EF12, Version 2.1, 18apr00cht
                                     50 ;               move to 8000H replacing WHYP.
                                     51 ;               copy interrupt vectors from WHYPFLSH.S19
                                     52 ;               to EF12.S19 before flashing
                                     53 ;               add TICKS1 and DELAY1 for motor stepping
                                     54 ;
                                     55 ;       EF12, 02/18/00, C. H. Ting
                                     56 ;       Adapt 86eForth v2.02 to 68HC12.
                                     57 ;               Use WHYP to seed EF12.ASM
                                     58 ;               Use AS12 native 68HC12 assembler:
                                     59 ;               as12 ef12.asm >ef12.lst
                                     60 ;       EF12A, add ADC code, 02mar00cht
                                     61 ;       EF12B, 01mar00cht
                                     62 ;               stack to 0x78, return stack to 0xf8.
                                     63 ;               add all port definitions
                                     64 ;               add PWM registers
                                     65 ;               add SPI registers and code
                                     66 ;       EF12C, 12mar00cht
                                     67 ;               add MAX5250 D/A converter
                                     68 ;       EF12D, 15mar00cht
                                     69 ;               add all the Lexel interface words
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



                                     70 ;       EF12E, 18apr00cht, save for reference
                                     71 ;
                                     72 ;       Copyright (c) 2000
                                     73 ;       Dr. C. H. Ting
                                     74 ;       156 14th Avenue
                                     75 ;       San Mateo, CA 94402
                                     76 ;       (650) 571-7639
                                     77 ;
                                     78 
                                     79 
                                     80 ;*********************************************************
                                     81 ;	Assembler constants
                                     82 ;*********************************************************
                           000000    83 RAMBASE =	0x0000	   ;ram base
                           0007FE    84 STACK   =	RAM_END-1  ;system (return) stack empty 48 bytes 24 CELLS 
                           00077F    85 DATSTK  =	RAM_END-128	;data stack  empty, grow down 
                           00077F    86 TIBBASE =       RAM_END-128  ; transaction input buffer addr. 80 bytes 
                                     87 
                                     88 
                                     89 
                                     90 ;; Memory allocation
                                     91 
                           000006    92 UPP     =     RAMBASE+6          ; systeme variables base address 
                           00077F    93 SPP     =     RAMBASE+DATSTK     ; data stack bottom 
                           0007FE    94 RPP     =     RAMBASE+STACK      ;  return stack bottom
                           00077F    95 TIBB    =     RAMBASE+TIBBASE    ; transaction input buffer
                           000080    96 VAR_BASE =    RAMBASE+0x80       ; user variables start here .
                           0007BE    97 VAR_TOP =     STACK-32*CELLL     ; reserve 32 cells for data stack. 
                                     98 
                                     99 ; user variables constants 
                           000006   100 UBASE = UPP       ; numeric base 
                           000008   101 UTMP = UBASE+2    ; temporary storage
                           00000A   102 UINN = UTMP+2     ; >IN tib pointer 
                           00000C   103 UCTIB = UINN+2    ; tib count 
                           00000E   104 UTIB = UCTIB+2    ; tib address 
                           000010   105 UINTER = UTIB+2   ; interpreter vector 
                           000012   106 UHLD = UINTER+2   ; hold 
                           000014   107 UCNTXT = UHLD+2   ; context, dictionary first link 
                           000016   108 UVP = UCNTXT+2    ; variable pointer 
                           000018   109 UCP = UVP+2      ; code pointer
                           00001A   110 ULAST = UCP+2    ; last dictionary pointer 
                                    111 
                                    112 ;******  System Variables  ******
                           00001C   113 XTEMP	=	ULAST+2;address called by CREATE
                           00001E   114 YTEMP	=	XTEMP+2	;address called by CREATE
                           00001C   115 PROD1 = XTEMP	;space for UM*
                           00001E   116 PROD2 = PROD1+2
                           000020   117 PROD3 = PROD2+2
                           000022   118 CARRY = PROD3+2
                           000024   119 SP0	= CARRY+2	;initial data stack pointer
                           000026   120 RP0	= SP0+2		;initial return stack pointer
                           000028   121 MS    =   RP0+2         ; millisecond counter 
                           00002A   122 CNTDWN =  MS+2          ; count down timer 
                           00002C   123 PTR16 = CNTDWN+2        ; middle byte of farptr 
                           00002E   124 PTR8 = PTR16+2           ; least byte of farptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                           000030   125 SEEDX = PTR8+2          ; PRNG seed X 
                           000032   126 SEEDY = SEEDX+2         ; PRNG seed Y 
                                    127 
                                    128 ; EEPROM persistant data  
                           004000   129 APP_LAST = EEPROM_BASE ; Application last word pointer  
                           004002   130 APP_RUN = APP_LAST+2   ; application autorun address 
                           004004   131 APP_CP = APP_RUN+2   ; free application space pointer 
                           004006   132 APP_VP = APP_CP+2  ; free data space pointer 
                                    133 
                                    134 
                                    135 ;***********************************************
                                    136 ;; Version control
                                    137 
                           000003   138 VER     =     3         ;major release version
                           000000   139 EXT     =     0         ;minor extension
                                    140 
                                    141 ;; Constants
                                    142 
                           00FFFF   143 TRUEE   =     0xFFFF      ;true flag
                                    144 
                           000040   145 COMPO   =     0x40     ;lexicon compile only bit
                           000080   146 IMEDD   =     0x80     ;lexicon immediate bit
                           001F7F   147 MASKK   =     0x1F7F  ;lexicon bit mask
                                    148 
                           000002   149 CELLL   =     2       ;size of a cell
                           00000A   150 BASEE   =     10      ;default radix
                           000008   151 BKSPP   =     8       ;back space
                           00000A   152 LF      =     10      ;line feed
                           00000D   153 CRR     =     13      ;carriage return
                           00001B   154 ERR     =     27      ;error escape
                           000027   155 TIC     =     39      ;tick
                           0000CD   156 CALLL   =     0xCD     ;CALL opcodes
                           000080   157 IRET_CODE =   0x80    ; IRET opcode 
                                    158 
                                    159         .macro _ledon
                                    160         bset PD_ODR,#LD1_BIT
                                    161         .endm
                                    162 
                                    163         .macro _ledoff
                                    164         bres PD_ODR,#LD1_BIT
                                    165         .endm
                                    166 
                                    167 ;**********************************************************
                                    168         .area DATA (ABS)
      000000                        169         .org RAMBASE 
                                    170 ;**********************************************************
                                    171 
                                    172 ;**********************************************************
                                    173         .area SSEG (ABS) ; STACK
      001700                        174         .org 0x1700
      001700                        175         .ds 256 
                                    176 ; space for DATSTK,TIB and STACK         
                                    177 ;**********************************************************
                                    178 
                                    179 ;**********************************************************
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    180         .area HOME ; vectors table
                                    181 ;**********************************************************
      008000 82 00 80 96            182 	int main	        ; reset
      008004 82 00 80 80            183 	int NonHandledInterrupt	; trap
      008008 82 00 80 80            184 	int NonHandledInterrupt	; irq0
      00800C 82 00 80 80            185 	int NonHandledInterrupt	; irq1
      008010 82 00 80 80            186 	int NonHandledInterrupt	; irq2
      008014 82 00 80 80            187 	int NonHandledInterrupt	; irq3
      008018 82 00 80 80            188 	int NonHandledInterrupt	; irq4
      00801C 82 00 80 80            189 	int NonHandledInterrupt	; irq5
      008020 82 00 80 80            190 	int NonHandledInterrupt	; irq6
      008024 82 00 80 80            191 	int NonHandledInterrupt	; irq7
      008028 82 00 80 80            192 	int NonHandledInterrupt	; irq8
      00802C 82 00 80 80            193 	int NonHandledInterrupt	; irq9
      008030 82 00 80 80            194 	int NonHandledInterrupt	; irq10
      008034 82 00 80 80            195 	int NonHandledInterrupt	; irq11
      008038 82 00 80 80            196 	int NonHandledInterrupt	; irq12
      00803C 82 00 80 80            197 	int NonHandledInterrupt	; irq13
      008040 82 00 80 80            198 	int NonHandledInterrupt	; irq14
      008044 82 00 80 80            199 	int NonHandledInterrupt	; irq15
      008048 82 00 80 80            200 	int NonHandledInterrupt	; irq16
      00804C 82 00 80 80            201 	int NonHandledInterrupt	; irq17
      008050 82 00 80 80            202 	int NonHandledInterrupt	; irq18
      008054 82 00 80 80            203 	int NonHandledInterrupt	; irq19
      008058 82 00 80 80            204 	int NonHandledInterrupt	; irq20
      00805C 82 00 80 80            205 	int NonHandledInterrupt	; irq21
      008060 82 00 80 80            206 	int NonHandledInterrupt	; irq22
      008064 82 00 80 85            207 	int Timer4Handler	; irq23
      008068 82 00 80 80            208 	int NonHandledInterrupt	; irq24
      00806C 82 00 80 80            209 	int NonHandledInterrupt	; irq25
      008070 82 00 80 80            210 	int NonHandledInterrupt	; irq26
      008074 82 00 80 80            211 	int NonHandledInterrupt	; irq27
      008078 82 00 80 80            212 	int NonHandledInterrupt	; irq28
      00807C 82 00 80 80            213 	int NonHandledInterrupt	; irq29
                                    214 
                                    215 ;**********************************************************
                                    216         .area CODE
                                    217 ;**********************************************************
                                    218 
                                    219 ; non handled interrupt reset MCU
      008080                        220 NonHandledInterrupt:
      008080 A6 80            [ 1]  221         ld a, #0x80
      008082 C7 50 D1         [ 1]  222         ld WWDG_CR,a ; WWDG_CR used to reset mcu
                                    223 	;iret
                                    224 
                                    225 ; used for milliseconds counter 
                                    226 ; MS is 16 bits counter 
      008085                        227 Timer4Handler:
      008085 72 5F 53 42      [ 1]  228 	clr TIM4_SR 
      008089 BE 28            [ 2]  229         ldw x,MS 
      00808B 5C               [ 2]  230         incw x 
      00808C BF 28            [ 2]  231         ldw MS,x
      00808E BE 2A            [ 2]  232         ldw x,CNTDWN 
      008090 27 03            [ 1]  233         jreq 1$
      008092 5A               [ 2]  234         decw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      008093 BF 2A            [ 2]  235         ldw CNTDWN,x 
      008095                        236 1$:         
      008095 80               [11]  237         iret 
                                    238 
                                    239 
                                    240 ;; Main entry points and COLD start data
      008096                        241 main:
                                    242 ; clear all RAM
      008096 AE 00 00         [ 2]  243 	ldw X,#RAMBASE
      008099                        244 clear_ram0:
      008099 7F               [ 1]  245 	clr (X)
      00809A 5C               [ 2]  246 	incw X
      00809B A3 07 FF         [ 2]  247 	cpw X,#RAM_END
      00809E 23 F9            [ 2]  248 	jrule clear_ram0
      0080A0 AE 07 FE         [ 2]  249         ldw x,#RPP
      0080A3 94               [ 1]  250         ldw sp,x
                                    251 ; set SEEDX and SEEDY to 1 
      0080A4 3C 31            [ 1]  252         inc SEEDX+1 
      0080A6 3C 33            [ 1]  253         inc SEEDY+1          
      0080A8 CC 80 C3         [ 2]  254 	jp ORIG
                                    255 
                                    256 ; COLD initialize these variables.
      0080AB                        257 UZERO:
      0080AB 00 0A                  258         .word      BASEE   ;BASE
      0080AD 00 00                  259         .word      0       ;tmp
      0080AF 00 00                  260         .word      0       ;>IN
      0080B1 00 00                  261         .word      0       ;#TIB
      0080B3 07 7F                  262         .word      TIBB    ;TIB
      0080B5 92 C8                  263         .word      INTER   ;'EVAL
      0080B7 00 00                  264         .word      0       ;HLD
      0080B9 9E 94                  265         .word      LASTN  ;CNTXT pointer
      0080BB 00 80                  266         .word      VAR_BASE   ;variables free space pointer 
      0080BD 9F 00                  267         .word      app_space ; FLASH free space pointer 
      0080BF 9E 94                  268         .word      LASTN   ;LAST
      0080C1 00 00                  269 UEND:   .word      0
                                    270 
      0080C3                        271 ORIG:   
                                    272 ; initialize SP
      0080C3 AE 07 FE         [ 2]  273         LDW     X,#STACK  ;initialize return stack
      0080C6 94               [ 1]  274         LDW     SP,X
      0080C7 BF 26            [ 2]  275         LDW     RP0,X
      0080C9 AE 07 7F         [ 2]  276         LDW     X,#DATSTK ;initialize data stack
      0080CC BF 24            [ 2]  277         LDW     SP0,X
                                    278 ; initialize PD_0 as output to control LD1 LED 
                                    279 ; added by Picatout 
      0080CE 72 10 50 12      [ 1]  280         bset PD_CR1,#LD1_BIT
      0080D2 72 10 50 13      [ 1]  281         bset PD_CR2,#LD1_BIT
      0080D6 72 10 50 11      [ 1]  282         bset PD_DDR,#LD1_BIT
      00005A                        283         _ledoff
      0080DA 72 11 50 0F      [ 1]    1         bres PD_ODR,#LD1_BIT
                                    284 ; initialize clock to HSE
                                    285 ; no divisor 16Mhz 
                                    286 ; Added by Picatout 
      0080DE                        287 clock_init:
      0080DE 72 5F 50 C6      [ 1]  288         clr CLK_CKDIVR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      0080E2 72 12 50 C5      [ 1]  289 	bset CLK_SWCR,#CLK_SWCR_SWEN
      0080E6 A6 B4            [ 1]  290 	ld a,#CLK_SWR_HSE
      0080E8 C7 50 C4         [ 1]  291 	ld CLK_SWR,a
      0080EB C1 50 C3         [ 1]  292 1$:	cp a,CLK_CMSR
      0080EE 26 FB            [ 1]  293 	jrne 1$
                                    294         
                                    295 ; initialize UART2, 115200 8N1
      0080F0                        296 uart2_init:
      0080F0 72 16 50 C7      [ 1]  297 	bset CLK_PCKENR1,#CLK_PCKENR1_UART2 ; enable signal
                                    298 	; configure tx pin
      0080F4 72 1A 50 11      [ 1]  299 	bset PD_DDR,#UART2_TX_PIN ; tx pin
      0080F8 72 1A 50 12      [ 1]  300 	bset PD_CR1,#UART2_TX_PIN ; push-pull output
      0080FC 72 1A 50 13      [ 1]  301 	bset PD_CR2,#UART2_TX_PIN ; fast output
                                    302 	; baud rate 115200 Fmaster=16Mhz  16000000/115200=139=0x8B
      008100 35 0B 52 43      [ 1]  303 	mov UART2_BRR2,#0x0b ; must be loaded first
      008104 35 08 52 42      [ 1]  304 	mov UART2_BRR1,#0x8
      008108 35 0C 52 45      [ 1]  305 	mov UART2_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                                    306 ; initialize timer4, used for millisecond interrupt  
      00810C 35 07 53 45      [ 1]  307 	mov TIM4_PSCR,#7 ; prescale 128  
      008110 35 7D 53 46      [ 1]  308 	mov TIM4_ARR,#125 ; set for 1msec.
      008114 35 05 53 40      [ 1]  309 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008118 72 10 53 41      [ 1]  310 	bset TIM4_IER,#TIM4_IER_UIE 
                                    311 ; set TIM4 interrupt priority to highest
      00811C A6 3F            [ 1]  312         ld a,#~(IPR_MASK<<6)
      00811E C4 7F 75         [ 1]  313         and a,ITC_SPR6
      008121 AA C0            [ 1]  314         or a,#(IPR3<<6)
      008123 C7 7F 75         [ 1]  315         ld ITC_SPR6,a 
      008126 9A               [ 1]  316         rim
      008127 CC 98 E3         [ 2]  317         jp  COLD   ;default=MN1
                                    318 
                                    319 
                                    320 ;; place MCU in sleep mode with
                                    321 ;; halt opcode 
                                    322 ;; BYE ( -- )
      00812A 00 00                  323         .word 0
                           0000AC   324         LINK=.
      00812C 03                     325         .byte 3 
      00812D 42 59 45               326         .ascii "BYE"
      008130                        327 BYE: 
      008130 8E               [10]  328         halt 
      008131 81               [ 4]  329         ret 
                                    330 
                                    331 ; Enable interrupts 
                                    332 ; EI ( -- )
      008132 81 2C                  333         .word LINK 
                           0000B4   334         LINK=.
      008134 02                     335         .byte 2
      008135 45 49                  336         .ascii "EI"
      008137                        337 EI:
      008137 9A               [ 1]  338         rim 
      008138 81               [ 4]  339         ret 
                                    340 
                                    341 ; Disable interrupts
                                    342 ; DI ( -- )
      008139 81 34                  343         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                           0000BB   344         LINK=.
      00813B 02                     345         .byte 2 
      00813C 44 49                  346         .ascii "DI"
      00813E                        347 DI:
      00813E 9B               [ 1]  348         sim 
      00813F 81               [ 4]  349         ret 
                                    350 
                                    351 ; set interrupt priority level 
                                    352 ; SET-ISP ( n1 n2 -- )
                                    353 ; n1 level {1..3}
                                    354 ; n2 vector {0..29}
      008140 81 3B                  355         .word LINK 
                           0000C2   356         LINK=.
      008142 07                     357         .byte 7 
      008143 53 45 54 2D 49 53 50   358         .ascii "SET-ISP"
      00814A                        359 SETISP:
      00814A 90 93            [ 1]  360         ldw y,x 
      00814C 90 FE            [ 2]  361         ldw y,(y)
      00814E A6 04            [ 1]  362         ld a,#4 ; 4 slot per register 
                                    363 ;  quotient select register, remainder select slot in register.        
      008150 90 62            [ 2]  364         div y,a ; register=ITC_SPR1[Y], lshift=2*A 
      008152 A4 03            [ 1]  365         and a,#3 
      008154 48               [ 1]  366         sll a ; 2*SLOT  lshift 
      008155 72 A9 7F 70      [ 2]  367         addw y,#ITC_SPR1 
      008159 FF               [ 2]  368         ldw (x),y  ; ( level reg -- )
      00815A 90 5F            [ 1]  369         clrw y 
      00815C 90 97            [ 1]  370         ld yl,a 
      00815E 1D 00 02         [ 2]  371         subw x,#CELLL 
      008161 FF               [ 2]  372         ldw (x),y  ; ( level reg lshift -- )
      008162 90 93            [ 1]  373         ldw y,x 
      008164 90 EE 02         [ 2]  374         ldw y,(2,y) 
      008167 90 F6            [ 1]  375         ld a,(y)   ; reg_value
      008169 1D 00 02         [ 2]  376         subw x,#CELLL 
      00816C FF               [ 2]  377         ldw (x),y ; ( level reg lshift rval -- )
      00816D CD 85 2E         [ 4]  378         call OVER ; ( level reg lshift rval lshift -- )
      008170 CD 83 DF         [ 4]  379         call DOLIT 
      008173 00 03                  380         .word 3
      008175 CD 85 14         [ 4]  381         call SWAPP  ; ( level reg lshift rval 3 lshift )
      008178 CD 89 C7         [ 4]  382         call LSHIFT ; creat slot mask 
      00817B CD 86 C9         [ 4]  383         call INVER  ; ( level reg lshift rval mask )
      00817E CD 85 50         [ 4]  384         call ANDD ; ( level reg lshift slot_masked )
      008181 CD 84 CD         [ 4]  385         call TOR  ; ( level reg lshift -- R: slot_masked )
      008184 CD 86 6F         [ 4]  386         call ROT  ; ( reg lshift level )
      008187 CD 85 14         [ 4]  387         call SWAPP ; ( reg level lshift )
      00818A CD 89 C7         [ 4]  388         call LSHIFT  ; ( reg slot_level -- )
      00818D CD 84 AE         [ 4]  389         call RFROM ; ( reg slot_level masked_val )
      008190 CD 85 64         [ 4]  390         call ORR   ; ( reg updated_rval )
      008193 CD 85 14         [ 4]  391         call SWAPP 
      008196 CD 84 6A         [ 4]  392         call CSTOR
                                    393 
                                    394 ; set application startup vector 
      008199 81 42                  395         .word LINK 
                           00011B   396         LINK=.
      00819B 07                     397         .byte 7
      00819C 41 55 54 4F 52 55 4E   398         .ascii "AUTORUN"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      0081A3                        399 AUTORUN:
      0081A3 CD 90 8D         [ 4]  400         call TOKEN 
      0081A6 CD 85 04         [ 4]  401         call DUPP 
      0081A9 CD 84 12         [ 4]  402         call QBRAN 
      0081AC 82 89                  403         .word FORGET2
      0081AE CD 91 8A         [ 4]  404         call NAMEQ
      0081B1 CD 86 5E         [ 4]  405         call QDUP 
      0081B4 CD 84 12         [ 4]  406         call QBRAN 
      0081B7 82 89                  407         .word FORGET2
      0081B9 CD 84 FA         [ 4]  408         call DROP 
      0081BC 1D 00 04         [ 2]  409         subw x,#2*CELLL 
      0081BF 90 5F            [ 1]  410         clrw y 
      0081C1 FF               [ 2]  411         ldw (x),y 
      0081C2 90 AE 40 02      [ 2]  412         ldw y,#APP_RUN 
      0081C6 EF 02            [ 2]  413         ldw (2,x),y 
      0081C8 CC 9B BC         [ 2]  414         jp EESTO 
                                    415 
                                    416 ;; Reset dictionary pointer before 
                                    417 ;; forgotten word. RAM space and 
                                    418 ;; interrupt vector defined after 
                                    419 ;; must be resetted also.
      0081CB 81 9B                  420         .word LINK 
                           00014D   421         LINK=.
      0081CD 06                     422         .byte 6
      0081CE 46 4F 52 47 45 54      423         .ascii "FORGET" 
      0081D4                        424 FORGET: 
      0081D4 CD 90 8D         [ 4]  425         call TOKEN
      0081D7 CD 85 04         [ 4]  426         call DUPP 
      0081DA CD 84 12         [ 4]  427         call QBRAN 
      0081DD 82 89                  428         .word FORGET2
      0081DF CD 91 8A         [ 4]  429         call NAMEQ ; ( a -- ca na | a F )
      0081E2 CD 86 5E         [ 4]  430         call QDUP 
      0081E5 CD 84 12         [ 4]  431         call QBRAN 
      0081E8 82 89                  432         .word FORGET2
                                    433 ; only forget users words 
      0081EA CD 85 04         [ 4]  434         call DUPP ; ( ca na na )
      0081ED CD 83 DF         [ 4]  435         call DOLIT 
      0081F0 9F 00                  436         .word app_space 
      0081F2 CD 85 14         [ 4]  437         call SWAPP 
      0081F5 CD 87 6F         [ 4]  438         call  ULESS 
      0081F8 CD 84 12         [ 4]  439         call QBRAN 
      0081FB 82 4B                  440         .word FORGET6 
                                    441 ; ( ca na -- )        
                                    442 ;reset ivec with address >= ca
      0081FD CD 85 14         [ 4]  443         call SWAPP ; ( na ca -- ) 
      008200 CD 9D 9E         [ 4]  444         call CHKIVEC ; ( na -- ) 
                                    445 ; start at LAST and link back to na 
                                    446 ; if variable found reset VP at that point.
      008203                        447 FORGET1:
      008203 CD 86 4E         [ 4]  448         call LAST 
      008206 CD 84 5D         [ 4]  449         call AT 
      008209 CD 85 04         [ 4]  450         call DUPP  ; ( -- na last last )
      00820C CD 82 9F         [ 4]  451         call FREEVAR ; ( -- na last )
      00820F CD 85 04         [ 4]  452         call DUPP 
      008212 CD 83 DF         [ 4]  453         call DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      008215 00 02                  454         .word 2 
      008217 CD 87 28         [ 4]  455         call SUBB ; ( na last -- na last lfa ) link address 
      00821A CD 84 5D         [ 4]  456         call AT 
      00821D CD 85 04         [ 4]  457         call DUPP ; ( -- na last a a )
      008220 CD 86 22         [ 4]  458         call CNTXT 
      008223 CD 84 46         [ 4]  459         call STORE
      008226 CD 86 4E         [ 4]  460         call LAST  
      008229 CD 84 46         [ 4]  461         call STORE ; ( --  na last )
      00822C CD 85 2E         [ 4]  462         call OVER 
      00822F CD 87 50         [ 4]  463         call EQUAL ; ( na last na -- na T|F ) 
      008232 CD 84 12         [ 4]  464         call QBRAN 
      008235 82 03                  465         .word FORGET1 
                                    466 ; ( na -- )
      008237 CD 83 DF         [ 4]  467         call DOLIT 
      00823A 00 02                  468         .word 2 
      00823C CD 87 28         [ 4]  469         call SUBB 
      00823F CD 86 3E         [ 4]  470         call CPP 
      008242 CD 84 46         [ 4]  471         call STORE  
      008245 CD 9A A6         [ 4]  472         call UPDATCP 
      008248 CC 9A 7D         [ 2]  473         jp UPDATLAST 
      00824B                        474 FORGET6: ; tried to forget a RAM or system word 
                                    475 ; ( ca na -- )
      00824B 1D 00 02         [ 2]  476         subw x,#CELLL 
      00824E 90 BE 24         [ 2]  477         ldw y,SP0 
      008251 FF               [ 2]  478         ldw (x),y  
      008252 CD 87 6F         [ 4]  479         call ULESS
      008255 CD 84 12         [ 4]  480         call QBRAN 
      008258 82 7B                  481         .word PROTECTED 
      00825A CD 92 96         [ 4]  482         call ABORQ 
      00825D 1D                     483         .byte 29
      00825E 20 46 6F 72 20 52 41   484         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      00827B                        485 PROTECTED:
      00827B CD 92 96         [ 4]  486         call ABORQ
      00827E 0A                     487         .byte 10
      00827F 20 50 72 6F 74 65 63   488         .ascii " Protected"
             74 65 64
      008289                        489 FORGET2: ; no name or not found in dictionary 
      008289 CD 92 96         [ 4]  490         call ABORQ
      00828C 05                     491         .byte 5
      00828D 20 77 68 61 74         492         .ascii " what"
      008292                        493 FORGET4:
      008292 CC 84 FA         [ 2]  494         jp DROP 
                                    495 
                                    496 
                                    497 ;---------------------------------
                                    498 ; if na is variable 
                                    499 ; free variable data  
                                    500 ; FREEVAR ( na -- )
                                    501 ;---------------------------------
      008295 81 CD                  502         .word LINK 
                           000217   503         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008297 07                     504         .byte 7 
      008298 46 52 45 45 56 41 52   505         .ascii "FREEVAR"
      00829F                        506 FREEVAR:
      00829F CD 85 04         [ 4]  507         call DUPP ; ( na na -- )
      0082A2 CD 84 7B         [ 4]  508         CALL CAT  ; ( na c -- )
      0082A5 CD 89 A9         [ 4]  509         call ONEP ;
      0082A8 CD 86 AF         [ 4]  510         CALL PLUS ; ( na c+1 -- ca ) 
      0082AB CD 89 A9         [ 4]  511         call ONEP ; ( ca+ -- ) to get routne address 
      0082AE CD 85 04         [ 4]  512         call DUPP ; ( ca+ ca+ -- )
      0082B1 CD 84 5D         [ 4]  513         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082B4 CD 83 DF         [ 4]  514         call DOLIT 
      0082B7 85 B1                  515         .word DOVAR ; if routine address is DOVAR then variable 
      0082B9 CD 87 50         [ 4]  516         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082BC CD 84 12         [ 4]  517         call QBRAN 
      0082BF 82 D5                  518         .word FREEVAR4 
      0082C1 CD 83 DF         [ 4]  519         call DOLIT 
      0082C4 00 02                  520         .word 2 
      0082C6 CD 86 AF         [ 4]  521         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082C9 CD 84 5D         [ 4]  522         call AT 
      0082CC CD 86 30         [ 4]  523         call VPP   
      0082CF CD 84 46         [ 4]  524         call STORE 
      0082D2 CC 9A BD         [ 2]  525         jp UPDATVP 
      0082D5                        526 FREEVAR4: ; not variable
      0082D5 CC 84 FA         [ 2]  527         jp  DROP 
                                    528 
                                    529 ;    SEED ( n -- )
                                    530 ; Initialize PRNG seed with n 
      0082D8 82 97                  531         .word LINK 
                           00025A   532         LINK=. 
      0082DA 04                     533         .byte 4 
      0082DB 53 45 45 44            534         .ascii "SEED" 
      0082DF                        535 SEED:
      0082DF 90 93            [ 1]  536         ldw y,x 
      0082E1 1C 00 02         [ 2]  537         addw x,#CELLL
      0082E4 90 FE            [ 2]  538         ldw y,(y)
      0082E6 90 9E            [ 1]  539         ld a,yh 
      0082E8 B7 30            [ 1]  540         ld SEEDX,a 
      0082EA 90 9F            [ 1]  541         ld a,yl 
      0082EC B7 32            [ 1]  542         ld SEEDY,a 
      0082EE 81               [ 4]  543         ret 
                                    544 
                                    545 ;    RANDOM ( u1 -- u2 )
                                    546 ; Pseudo random number betwen 0 and u1-1
      0082EF 82 DA                  547         .word LINK 
                           000271   548         LINK=.
      0082F1 06                     549         .byte 6
      0082F2 52 41 4E 44 4F 4D      550         .ascii "RANDOM" 
      0082F8                        551 RANDOM:
                                    552 ;local variable 
                           000001   553         SPSAVE=1
                           000002   554         VSIZE=2 
      0082F8 52 02            [ 2]  555         sub sp,#VSIZE
      0082FA 1F 01            [ 2]  556         ldw (SPSAVE,sp),x  
                                    557 ; XTEMP=(SEEDX<<5)^SEEDX 
      0082FC 90 93            [ 1]  558         ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      0082FE 90 FE            [ 2]  559         ldw y,(y)
      008300 90 BF 1E         [ 2]  560         ldw YTEMP,y 
      008303 BE 30            [ 2]  561 	ldw x,SEEDX 
      008305 58               [ 2]  562 	sllw x 
      008306 58               [ 2]  563 	sllw x 
      008307 58               [ 2]  564 	sllw x 
      008308 58               [ 2]  565 	sllw x 
      008309 58               [ 2]  566 	sllw x 
      00830A 9E               [ 1]  567 	ld a,xh 
      00830B B8 30            [ 1]  568 	xor a,SEEDX 
      00830D B7 1C            [ 1]  569 	ld XTEMP,a 
      00830F 9F               [ 1]  570 	ld a,xl 
      008310 B8 31            [ 1]  571 	xor a,SEEDX+1 
      008312 B7 1D            [ 1]  572 	ld XTEMP+1,a 
                                    573 ; SEEDX=SEEDY 
      008314 BE 32            [ 2]  574 	ldw x,SEEDY 
      008316 BF 30            [ 2]  575 	ldw SEEDX,x  
                                    576 ; SEEDY=SEEDY^(SEEDY>>1)
      008318 54               [ 2]  577 	srlw x 
      008319 9E               [ 1]  578 	ld a,xh 
      00831A B8 32            [ 1]  579 	xor a,SEEDY 
      00831C B7 32            [ 1]  580 	ld SEEDY,a  
      00831E 9F               [ 1]  581 	ld a,xl 
      00831F B8 33            [ 1]  582 	xor a,SEEDY+1 
      008321 B7 33            [ 1]  583 	ld SEEDY+1,a 
                                    584 ; XTEMP>>3 
      008323 BE 1C            [ 2]  585 	ldw x,XTEMP 
      008325 54               [ 2]  586 	srlw x 
      008326 54               [ 2]  587 	srlw x 
      008327 54               [ 2]  588 	srlw x 
                                    589 ; x=XTEMP^x 
      008328 9E               [ 1]  590 	ld a,xh 
      008329 B8 1C            [ 1]  591 	xor a,XTEMP 
      00832B 95               [ 1]  592 	ld xh,a 
      00832C 9F               [ 1]  593 	ld a,xl 
      00832D B8 1D            [ 1]  594 	xor a,XTEMP+1  
      00832F 97               [ 1]  595 	ld xl,a 
                                    596 ; SEEDY=x^SEEDY 
      008330 B8 33            [ 1]  597 	xor a,SEEDY+1
      008332 97               [ 1]  598 	ld xl,a 
      008333 9E               [ 1]  599 	ld a,xh 
      008334 B8 32            [ 1]  600 	xor a,SEEDY
      008336 95               [ 1]  601 	ld xh,a 
      008337 BF 32            [ 2]  602 	ldw SEEDY,x 
                                    603 ; return SEEDY modulo YTEMP  
      008339 90 BE 1E         [ 2]  604 	ldw y,YTEMP  
      00833C 65               [ 2]  605 	divw x,y 
      00833D 1E 01            [ 2]  606 	ldw x,(SPSAVE,sp)
      00833F FF               [ 2]  607         ldw (x),y 
      008340 5B 02            [ 2]  608         addw sp,#VSIZE 
      008342 81               [ 4]  609 	ret 
                                    610 
                                    611 
                                    612 ;;
                                    613 ;; get millisecond counter 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                                    614 ;; msec ( -- u )
                                    615 ;; Added by Picatout 2020-04-26
      008343 82 F1                  616         .word LINK  
                           0002C5   617         LINK = . 
      008345 04                     618         .byte 4
      008346 4D 53 45 43            619         .ascii "MSEC"
      00834A                        620 MSEC: 
      00834A 1D 00 02         [ 2]  621         subw x,#CELLL 
      00834D 90 BE 28         [ 2]  622         ldw y,MS 
      008350 FF               [ 2]  623         ldw (x),y 
      008351 81               [ 4]  624         ret 
                                    625 
                                    626 ; suspend execution for u msec 
                                    627 ;  pause ( u -- )
      008352 83 45                  628         .word LINK 
                           0002D4   629         LINK=.
      008354 05                     630         .byte 5 
      008355 50 41 55 53 45         631         .ascii "PAUSE"
      00835A                        632 PAUSE:
      00835A 90 93            [ 1]  633         ldw y,x
      00835C 90 FE            [ 2]  634         ldw y,(y)
      00835E 72 B9 00 28      [ 2]  635         addw y,MS 
      008362 8F               [10]  636 1$:     wfi  
      008363 90 B3 28         [ 2]  637         cpw y,MS  
      008366 26 FA            [ 1]  638         jrne 1$        
      008368 1C 00 02         [ 2]  639         addw x,#CELLL 
      00836B 81               [ 4]  640         ret 
                                    641 
                                    642 ; initialize count down timer 
                                    643 ;  TIMER ( u -- )  milliseconds 
      00836C 83 54                  644         .word LINK 
                           0002EE   645         LINK=.
      00836E 05                     646         .byte 5 
      00836F 54 49 4D 45 52         647         .ascii "TIMER" 
      008374                        648 TIMER:
      008374 90 93            [ 1]  649         ldw y,x
      008376 90 FE            [ 2]  650         ldw y,(y) 
      008378 90 BF 2A         [ 2]  651         ldw CNTDWN,y
      00837B 1C 00 02         [ 2]  652         addw x,#CELLL 
      00837E 81               [ 4]  653         ret 
                                    654 
                                    655 ; check for TIMER exiparition 
                                    656 ;  TIMEOUT? ( -- 0|-1 )
      00837F 83 6E                  657         .word LINK 
                           000301   658         LINK=. 
      008381 08                     659         .byte 8 
      008382 54 49 4D 45 4F 55 54   660         .ascii "TIMEOUT?"
             3F
      00838A                        661 TIMEOUTQ: 
      00838A 4F               [ 1]  662         clr a
      00838B 1D 00 02         [ 2]  663         subw x,#CELLL 
      00838E 90 BE 2A         [ 2]  664         ldw y,CNTDWN 
      008391 26 01            [ 1]  665         jrne 1$ 
      008393 43               [ 1]  666         cpl a 
      008394 E7 01            [ 1]  667 1$:     ld (1,x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008396 F7               [ 1]  668         ld (x),a 
      008397 81               [ 4]  669         ret         
                                    670 
                                    671 ; reboot MCU 
                                    672 ; REBOOT ( -- )
      008398 83 81                  673         .word LINK 
                           00031A   674         LINK=. 
      00839A 06                     675         .byte 6 
      00839B 52 45 42 4F 4F 54      676         .ascii "REBOOT"
      0083A1                        677 reboot:
      0083A1 CC 80 80         [ 2]  678         jp NonHandledInterrupt
                                    679 
                                    680 
                                    681 ;; Device dependent I/O
                                    682 ;       ?RX     ( -- c T | F )
                                    683 ;         Return input byte and true, or false.
      0083A4 83 9A                  684         .word      LINK 
                           000326   685 LINK	= .
      0083A6 04                     686         .byte      4
      0083A7 3F 4B 45 59            687         .ascii     "?KEY"
      0083AB                        688 QKEY:
      0083AB 90 5F            [ 1]  689         CLRW Y 
      0083AD 72 0B 52 40 0B   [ 2]  690         BTJF UART2_SR,#UART_SR_RXNE,INCH   ;check status
      0083B2 C6 52 41         [ 1]  691         LD    A,UART2_DR   ;get char in A
      0083B5 1D 00 02         [ 2]  692 	SUBW	X,#2
      0083B8 E7 01            [ 1]  693         LD     (1,X),A
      0083BA 7F               [ 1]  694 	CLR	(X)
      0083BB 90 53            [ 2]  695         CPLW     Y
      0083BD                        696 INCH:
      0083BD 1D 00 02         [ 2]  697 	SUBW	X,#2
      0083C0 FF               [ 2]  698         LDW     (X),Y
      0083C1 81               [ 4]  699         RET
                                    700 
                                    701 ;       TX!     ( c -- )
                                    702 ;       Send character c to  output device.
      0083C2 83 A6                  703         .word      LINK
                           000344   704 LINK	= .
      0083C4 04                     705         .byte      4
      0083C5 45 4D 49 54            706         .ascii     "EMIT"
      0083C9                        707 EMIT:
      0083C9 E6 01            [ 1]  708         LD     A,(1,X)
      0083CB 1C 00 02         [ 2]  709 	ADDW	X,#2
      0083CE 72 0F 52 40 FB   [ 2]  710 OUTPUT: BTJF UART2_SR,#UART_SR_TXE,OUTPUT  ;loop until tdre
      0083D3 C7 52 41         [ 1]  711         LD    UART2_DR,A   ;send A
      0083D6 81               [ 4]  712         RET
                                    713 
                                    714 ;; The kernel
                                    715 
                                    716 ;       doLIT   ( -- w )
                                    717 ;       Push an inline literal.
      0083D7 83 C4                  718         .word      LINK
                           000359   719 LINK	= 	.
      0083D9 45                     720 	.byte      COMPO+5
      0083DA 44 4F 4C 49 54         721         .ascii     "DOLIT"
      0083DF                        722 DOLIT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0083DF 1D 00 02         [ 2]  723 	SUBW X,#2
      0083E2 16 01            [ 2]  724         ldw y,(1,sp)
      0083E4 90 FE            [ 2]  725         ldw y,(y)
      0083E6 FF               [ 2]  726         ldw (x),y
      0083E7 90 85            [ 2]  727         popw y 
      0083E9 90 EC 02         [ 2]  728         jp (2,y)
                                    729 
                                    730 ;       next    ( -- )
                                    731 ;       Code for  single index loop.
      0083EC 83 D9                  732         .word      LINK
                           00036E   733 LINK	= 	.
      0083EE 44                     734 	.byte      COMPO+4
      0083EF 6E 65 78 74            735         .ascii     "next"
      0083F3                        736 DONXT:
      0083F3 16 03            [ 2]  737 	LDW Y,(3,SP)
      0083F5 90 5A            [ 2]  738 	DECW Y
      0083F7 2A 07            [ 1]  739 	JRPL NEX1 ; jump if N=0
      0083F9 90 85            [ 2]  740 	POPW Y
      0083FB 5B 02            [ 2]  741         addw sp,#2
      0083FD 90 EC 02         [ 2]  742         JP (2,Y)
      008400                        743 NEX1:
      008400 17 03            [ 2]  744         LDW (3,SP),Y
      008402 90 85            [ 2]  745         POPW Y
      008404 90 FE            [ 2]  746 	LDW Y,(Y)
      008406 90 FC            [ 2]  747 	JP (Y)
                                    748 
                                    749 ;       ?branch ( f -- )
                                    750 ;       Branch if flag is zero.
      008408 83 EE                  751         .word      LINK
                           00038A   752 LINK	= 	.
      00840A 47                     753 	.byte      COMPO+7
      00840B 3F 42 52 41 4E 43 48   754         .ascii     "?BRANCH"
      008412                        755 QBRAN:	
      008412 90 93            [ 1]  756         LDW Y,X
      008414 1C 00 02         [ 2]  757 	ADDW X,#2
      008417 90 FE            [ 2]  758 	LDW Y,(Y)
      008419 27 0E            [ 1]  759         JREQ     BRAN
      00841B 90 85            [ 2]  760 	POPW Y
      00841D 90 EC 02         [ 2]  761 	JP (2,Y)
                                    762         
                                    763 ;       branch  ( -- )
                                    764 ;       Branch to an inline address.
      008420 84 0A                  765         .word      LINK
                           0003A2   766 LINK	= 	.
      008422 46                     767 	.byte      COMPO+6
      008423 42 52 41 4E 43 48      768         .ascii     "BRANCH"
      008429                        769 BRAN:
      008429 90 85            [ 2]  770         POPW Y
      00842B 90 FE            [ 2]  771 	LDW Y,(Y)
      00842D 90 FC            [ 2]  772         JP     (Y)
                                    773 
                                    774 ;       EXECUTE ( ca -- )
                                    775 ;       Execute  word at ca.
      00842F 84 22                  776         .word      LINK
                           0003B1   777 LINK	= 	.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      008431 07                     778         .byte       7
      008432 45 58 45 43 55 54 45   779         .ascii     "EXECUTE"
      008439                        780 EXECU:
      008439 90 93            [ 1]  781         LDW Y,X
      00843B 1C 00 02         [ 2]  782 	ADDW X,#2
      00843E 90 FE            [ 2]  783 	LDW  Y,(Y)
      008440 90 FC            [ 2]  784         JP   (Y)
                                    785 
                           000001   786 OPTIMIZE = 1
                           000001   787 .if OPTIMIZE 
                                    788 ; replace CALL EXIT by 
                                    789 ; RET opcode
                                    790 ; See modificaiton to  ";" word
                                    791 ; then EXIT not required 
                           000000   792 .else 
                                    793 ;       EXIT    ( -- )
                                    794 ;       Terminate a colon definition.
                                    795         .word      LINK
                                    796         LINK = .
                                    797         .byte      4
                                    798         .ascii     "EXIT"
                                    799 EXIT:
                                    800         POPW Y
                                    801         RET
                                    802 .endif 
                                    803 
                                    804 ;       !       ( w a -- )
                                    805 ;       Pop  data stack to memory.
      008442 84 31                  806         .word      LINK
                           0003C4   807 LINK = .
      008444 01                     808         .byte      1
      008445 21                     809         .ascii     "!"
      008446                        810 STORE:
      008446 90 93            [ 1]  811         LDW Y,X
      008448 90 FE            [ 2]  812         LDW Y,(Y)    ;Y=a
      00844A 90 BF 1E         [ 2]  813         LDW YTEMP,Y
      00844D 90 93            [ 1]  814         LDW Y,X
      00844F 90 EE 02         [ 2]  815         LDW Y,(2,Y)
      008452 91 CF 1E         [ 5]  816         LDW [YTEMP],Y ;store w at a
      008455 1C 00 04         [ 2]  817         ADDW X,#4 ; DDROP 
      008458 81               [ 4]  818         RET     
                                    819 
                                    820 ;       @       ( a -- w )
                                    821 ;       Push memory location to stack.
      008459 84 44                  822         .word      LINK
                           0003DB   823 LINK	= 	.
      00845B 01                     824         .byte    1
      00845C 40                     825         .ascii	"@"
      00845D                        826 AT:
      00845D 90 93            [ 1]  827         LDW Y,X     ;Y = a
      00845F 90 FE            [ 2]  828         LDW Y,(Y)   ; address 
      008461 90 FE            [ 2]  829         LDW Y,(Y)   ; value 
      008463 FF               [ 2]  830         LDW (X),Y ;w = @Y
      008464 81               [ 4]  831         RET     
                                    832 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                                    833 ;       C!      ( c b -- )
                                    834 ;       Pop  data stack to byte memory.
      008465 84 5B                  835         .word      LINK
                           0003E7   836 LINK	= .
      008467 02                     837         .byte      2
      008468 43 21                  838         .ascii     "C!"
      00846A                        839 CSTOR:
      00846A 90 93            [ 1]  840         LDW Y,X
      00846C 90 FE            [ 2]  841 	LDW Y,(Y)    ;Y=b
      00846E E6 03            [ 1]  842         LD A,(3,X)    ;D = c
      008470 90 F7            [ 1]  843         LD  (Y),A     ;store c at b
      008472 1C 00 04         [ 2]  844 	ADDW X,#4 ; DDROP 
      008475 81               [ 4]  845         RET     
                                    846 
                                    847 ;       C@      ( b -- c )
                                    848 ;       Push byte in memory to  stack.
      008476 84 67                  849         .word      LINK
                           0003F8   850 LINK	= 	.
      008478 02                     851         .byte      2
      008479 43 40                  852         .ascii     "C@"
      00847B                        853 CAT:
      00847B 90 93            [ 1]  854         LDW Y,X     ;Y=b
      00847D 90 FE            [ 2]  855         LDW Y,(Y)
      00847F 90 F6            [ 1]  856         LD A,(Y)
      008481 E7 01            [ 1]  857         LD (1,X),A
      008483 7F               [ 1]  858         CLR (X)
      008484 81               [ 4]  859         RET     
                                    860 
                                    861 ;       RP@     ( -- a )
                                    862 ;       Push current RP to data stack.
      008485 84 78                  863         .word      LINK
                           000407   864 LINK	= .
      008487 03                     865         .byte      3
      008488 52 50 40               866         .ascii     "RP@"
      00848B                        867 RPAT:
      00848B 90 96            [ 1]  868         LDW Y,SP    ;save return addr
      00848D 1D 00 02         [ 2]  869         SUBW X,#2
      008490 FF               [ 2]  870         LDW (X),Y
      008491 81               [ 4]  871         RET     
                                    872 
                                    873 ;       RP!     ( a -- )
                                    874 ;       Set  return stack pointer.
      008492 84 87                  875         .word      LINK
                           000414   876 LINK	= 	. 
      008494 43                     877 	.byte      COMPO+3
      008495 52 50 21               878         .ascii     "RP!"
      008498                        879 RPSTO:
      008498 90 85            [ 2]  880         POPW Y
      00849A 90 BF 1E         [ 2]  881         LDW YTEMP,Y
      00849D 90 93            [ 1]  882         LDW Y,X
      00849F 90 FE            [ 2]  883         LDW Y,(Y)
      0084A1 90 94            [ 1]  884         LDW SP,Y
      0084A3 1C 00 02         [ 2]  885         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      0084A6 92 CC 1E         [ 5]  886         JP [YTEMP]
                                    887 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                                    888 ;       R>      ( -- w )
                                    889 ;       Pop return stack to data stack.
      0084A9 84 94                  890         .word      LINK
                           00042B   891 LINK	= 	. 
      0084AB 42                     892 	.byte      COMPO+2
      0084AC 52 3E                  893         .ascii     "R>"
      0084AE                        894 RFROM:
      0084AE 90 85            [ 2]  895         POPW Y    ;save return addr
      0084B0 90 BF 1E         [ 2]  896         LDW YTEMP,Y
      0084B3 90 85            [ 2]  897         POPW Y
      0084B5 1D 00 02         [ 2]  898         SUBW X,#2
      0084B8 FF               [ 2]  899         LDW (X),Y
      0084B9 92 CC 1E         [ 5]  900         JP [YTEMP]
                                    901 
                                    902 ;       R@      ( -- w )
                                    903 ;       Copy top of return stack to stack.
      0084BC 84 AB                  904         .word      LINK
                           00043E   905 LINK	= 	. 
      0084BE 02                     906         .byte      2
      0084BF 52 40                  907         .ascii     "R@"
      0084C1                        908 RAT:
      0084C1 16 03            [ 2]  909         ldw y,(3,sp)
      0084C3 1D 00 02         [ 2]  910         subw x,#CELLL 
      0084C6 FF               [ 2]  911         ldw (x),y 
      0084C7 81               [ 4]  912         ret 
                                    913 
                                    914 ;       >R      ( w -- )
                                    915 ;       Push data stack to return stack.
      0084C8 84 BE                  916         .word      LINK
                           00044A   917 LINK	= 	. 
      0084CA 42                     918 	.byte      COMPO+2
      0084CB 3E 52                  919         .ascii     ">R"
      0084CD                        920 TOR:
      0084CD 90 85            [ 2]  921         POPW Y    ;save return addr
      0084CF 90 BF 1E         [ 2]  922         LDW YTEMP,Y
      0084D2 90 93            [ 1]  923         LDW Y,X
      0084D4 90 FE            [ 2]  924         LDW Y,(Y)
      0084D6 90 89            [ 2]  925         PUSHW Y    ;restore return addr
      0084D8 1C 00 02         [ 2]  926         ADDW X,#2
      0084DB 92 CC 1E         [ 5]  927         JP [YTEMP]
                                    928 
                                    929 ;       SP@     ( -- a )
                                    930 ;       Push current stack pointer.
      0084DE 84 CA                  931         .word      LINK
                           000460   932 LINK	= 	. 
      0084E0 03                     933         .byte      3
      0084E1 53 50 40               934         .ascii     "SP@"
      0084E4                        935 SPAT:
      0084E4 90 93            [ 1]  936 	LDW Y,X
      0084E6 1D 00 02         [ 2]  937         SUBW X,#2
      0084E9 FF               [ 2]  938 	LDW (X),Y
      0084EA 81               [ 4]  939         RET     
                                    940 
                                    941 ;       SP!     ( a -- )
                                    942 ;       Set  data stack pointer.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0084EB 84 E0                  943         .word      LINK
                           00046D   944 LINK	= 	. 
      0084ED 03                     945         .byte      3
      0084EE 53 50 21               946         .ascii     "SP!"
      0084F1                        947 SPSTO:
      0084F1 FE               [ 2]  948         LDW     X,(X)     ;X = a
      0084F2 81               [ 4]  949         RET     
                                    950 
                                    951 ;       DROP    ( w -- )
                                    952 ;       Discard top stack item.
      0084F3 84 ED                  953         .word      LINK
                           000475   954 LINK	= 	. 
      0084F5 04                     955         .byte      4
      0084F6 44 52 4F 50            956         .ascii     "DROP"
      0084FA                        957 DROP:
      0084FA 1C 00 02         [ 2]  958         ADDW X,#2     
      0084FD 81               [ 4]  959         RET     
                                    960 
                                    961 ;       DUP     ( w -- w w )
                                    962 ;       Duplicate  top stack item.
      0084FE 84 F5                  963         .word      LINK
                           000480   964 LINK	= 	. 
      008500 03                     965         .byte      3
      008501 44 55 50               966         .ascii     "DUP"
      008504                        967 DUPP:
      008504 90 93            [ 1]  968 	LDW Y,X
      008506 1D 00 02         [ 2]  969         SUBW X,#2
      008509 90 FE            [ 2]  970 	LDW Y,(Y)
      00850B FF               [ 2]  971 	LDW (X),Y
      00850C 81               [ 4]  972         RET     
                                    973 
                                    974 ;       SWAP    ( w1 w2 -- w2 w1 )
                                    975 ;       Exchange top two stack items.
      00850D 85 00                  976         .word      LINK
                           00048F   977 LINK	= 	. 
      00850F 04                     978         .byte      4
      008510 53 57 41 50            979         .ascii     "SWAP"
      008514                        980 SWAPP:
      008514 90 93            [ 1]  981         LDW Y,X
      008516 90 FE            [ 2]  982         LDW Y,(Y)
      008518 90 BF 1E         [ 2]  983         LDW YTEMP,Y
      00851B 90 93            [ 1]  984         LDW Y,X
      00851D 90 EE 02         [ 2]  985         LDW Y,(2,Y)
      008520 FF               [ 2]  986         LDW (X),Y
      008521 90 BE 1E         [ 2]  987         LDW Y,YTEMP
      008524 EF 02            [ 2]  988         LDW (2,X),Y
      008526 81               [ 4]  989         RET     
                                    990 
                                    991 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                    992 ;       Copy second stack item to top.
      008527 85 0F                  993         .word      LINK
                           0004A9   994 LINK	= . 
      008529 04                     995         .byte      4
      00852A 4F 56 45 52            996         .ascii     "OVER"
      00852E                        997 OVER:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      00852E 1D 00 02         [ 2]  998         SUBW X,#2
      008531 90 93            [ 1]  999         LDW Y,X
      008533 90 EE 04         [ 2] 1000         LDW Y,(4,Y)
      008536 FF               [ 2] 1001         LDW (X),Y
      008537 81               [ 4] 1002         RET     
                                   1003 
                                   1004 ;       0<      ( n -- t )
                                   1005 ;       Return true if n is negative.
      008538 85 29                 1006         .word      LINK
                           0004BA  1007 LINK	= . 
      00853A 02                    1008         .byte      2
      00853B 30 3C                 1009         .ascii     "0<"
      00853D                       1010 ZLESS:
      00853D A6 FF            [ 1] 1011         LD A,#0xFF
      00853F 90 93            [ 1] 1012         LDW Y,X
      008541 90 FE            [ 2] 1013         LDW Y,(Y)
      008543 2B 01            [ 1] 1014         JRMI     ZL1
      008545 4F               [ 1] 1015         CLR A   ;false
      008546 F7               [ 1] 1016 ZL1:    LD     (X),A
      008547 E7 01            [ 1] 1017         LD (1,X),A
      008549 81               [ 4] 1018 	RET     
                                   1019 
                                   1020 ;       AND     ( w w -- w )
                                   1021 ;       Bitwise AND.
      00854A 85 3A                 1022         .word      LINK
                           0004CC  1023 LINK	= . 
      00854C 03                    1024         .byte      3
      00854D 41 4E 44              1025         .ascii     "AND"
      008550                       1026 ANDD:
      008550 F6               [ 1] 1027         LD  A,(X)    ;D=w
      008551 E4 02            [ 1] 1028         AND A,(2,X)
      008553 E7 02            [ 1] 1029         LD (2,X),A
      008555 E6 01            [ 1] 1030         LD A,(1,X)
      008557 E4 03            [ 1] 1031         AND A,(3,X)
      008559 E7 03            [ 1] 1032         LD (3,X),A
      00855B 1C 00 02         [ 2] 1033         ADDW X,#2
      00855E 81               [ 4] 1034         RET
                                   1035 
                                   1036 ;       OR      ( w w -- w )
                                   1037 ;       Bitwise inclusive OR.
      00855F 85 4C                 1038         .word      LINK
                           0004E1  1039 LINK = . 
      008561 02                    1040         .byte      2
      008562 4F 52                 1041         .ascii     "OR"
      008564                       1042 ORR:
      008564 F6               [ 1] 1043         LD A,(X)    ;D=w
      008565 EA 02            [ 1] 1044         OR A,(2,X)
      008567 E7 02            [ 1] 1045         LD (2,X),A
      008569 E6 01            [ 1] 1046         LD A,(1,X)
      00856B EA 03            [ 1] 1047         OR A,(3,X)
      00856D E7 03            [ 1] 1048         LD (3,X),A
      00856F 1C 00 02         [ 2] 1049         ADDW X,#2
      008572 81               [ 4] 1050         RET
                                   1051 
                                   1052 ;       XOR     ( w w -- w )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                   1053 ;       Bitwise exclusive OR.
      008573 85 61                 1054         .word      LINK
                           0004F5  1055 LINK	= . 
      008575 03                    1056         .byte      3
      008576 58 4F 52              1057         .ascii     "XOR"
      008579                       1058 XORR:
      008579 F6               [ 1] 1059         LD A,(X)    ;D=w
      00857A E8 02            [ 1] 1060         XOR A,(2,X)
      00857C E7 02            [ 1] 1061         LD (2,X),A
      00857E E6 01            [ 1] 1062         LD A,(1,X)
      008580 E8 03            [ 1] 1063         XOR A,(3,X)
      008582 E7 03            [ 1] 1064         LD (3,X),A
      008584 1C 00 02         [ 2] 1065         ADDW X,#2
      008587 81               [ 4] 1066         RET
                                   1067 
                                   1068 ;       UM+     ( u u -- udsum )
                                   1069 ;       Add two unsigned single
                                   1070 ;       and return a double sum.
      008588 85 75                 1071         .word      LINK
                           00050A  1072 LINK	= . 
      00858A 03                    1073         .byte      3
      00858B 55 4D 2B              1074         .ascii     "UM+"
      00858E                       1075 UPLUS:
      00858E A6 01            [ 1] 1076         LD A,#1
      008590 90 93            [ 1] 1077         LDW Y,X
      008592 90 EE 02         [ 2] 1078         LDW Y,(2,Y)
      008595 90 BF 1E         [ 2] 1079         LDW YTEMP,Y
      008598 90 93            [ 1] 1080         LDW Y,X
      00859A 90 FE            [ 2] 1081         LDW Y,(Y)
      00859C 72 B9 00 1E      [ 2] 1082         ADDW Y,YTEMP
      0085A0 EF 02            [ 2] 1083         LDW (2,X),Y
      0085A2 25 01            [ 1] 1084         JRC     UPL1
      0085A4 4F               [ 1] 1085         CLR A
      0085A5 E7 01            [ 1] 1086 UPL1:   LD     (1,X),A
      0085A7 7F               [ 1] 1087         CLR (X)
      0085A8 81               [ 4] 1088         RET
                                   1089 
                                   1090 ;; System and user variables
                                   1091 
                                   1092 ;       doVAR   ( -- a )
                                   1093 ;       Code for VARIABLE and CREATE.
      0085A9 85 8A                 1094         .word      LINK
                           00052B  1095 LINK	= . 
      0085AB 45                    1096 	.byte      COMPO+5
      0085AC 44 4F 56 41 52        1097         .ascii     "DOVAR"
      0085B1                       1098 DOVAR:
      0085B1 1D 00 02         [ 2] 1099 	SUBW X,#2
      0085B4 90 85            [ 2] 1100         POPW Y    ;get return addr (pfa)
      0085B6 90 FE            [ 2] 1101         LDW Y,(Y) ; indirect address 
      0085B8 FF               [ 2] 1102         LDW (X),Y    ;push on stack
      0085B9 81               [ 4] 1103         RET     ;go to RET of EXEC
                                   1104 
                                   1105 ;       BASE    ( -- a )
                                   1106 ;       Radix base for numeric I/O.
      0085BA 85 AB                 1107         .word      LINK        
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                           00053C  1108 LINK = . 
      0085BC 04                    1109         .byte      4
      0085BD 42 41 53 45           1110         .ascii     "BASE"
      0085C1                       1111 BASE:
      0085C1 90 AE 00 06      [ 2] 1112 	LDW Y,#UBASE 
      0085C5 1D 00 02         [ 2] 1113 	SUBW X,#2
      0085C8 FF               [ 2] 1114         LDW (X),Y
      0085C9 81               [ 4] 1115         RET
                                   1116 
                                   1117 ;       tmp     ( -- a )
                                   1118 ;       A temporary storage.
      0085CA 85 BC                 1119         .word      LINK
                                   1120         
                           00054C  1121 LINK = . 
      0085CC 03                    1122 	.byte      3
      0085CD 54 4D 50              1123         .ascii     "TMP"
      0085D0                       1124 TEMP:
      0085D0 90 AE 00 08      [ 2] 1125 	LDW Y,#UTMP
      0085D4 1D 00 02         [ 2] 1126 	SUBW X,#2
      0085D7 FF               [ 2] 1127         LDW (X),Y
      0085D8 81               [ 4] 1128         RET
                                   1129 
                                   1130 ;       >IN     ( -- a )
                                   1131 ;        Hold parsing pointer.
      0085D9 85 CC                 1132         .word      LINK
                           00055B  1133 LINK = . 
      0085DB 03                    1134         .byte      3
      0085DC 3E 49 4E              1135         .ascii    ">IN"
      0085DF                       1136 INN:
      0085DF 90 AE 00 0A      [ 2] 1137 	LDW Y,#UINN 
      0085E3 1D 00 02         [ 2] 1138 	SUBW X,#2
      0085E6 FF               [ 2] 1139         LDW (X),Y
      0085E7 81               [ 4] 1140         RET
                                   1141 
                                   1142 ;       #TIB    ( -- a )
                                   1143 ;       Count in terminal input buffer.
      0085E8 85 DB                 1144         .word      LINK
                           00056A  1145 LINK = . 
      0085EA 04                    1146         .byte      4
      0085EB 23 54 49 42           1147         .ascii     "#TIB"
      0085EF                       1148 NTIB:
      0085EF 90 AE 00 0C      [ 2] 1149 	LDW Y,#UCTIB 
      0085F3 1D 00 02         [ 2] 1150 	SUBW X,#2
      0085F6 FF               [ 2] 1151         LDW (X),Y
      0085F7 81               [ 4] 1152         RET
                                   1153 
                                   1154 ;       "EVAL   ( -- a )
                                   1155 ;       Execution vector of EVAL.
      0085F8 85 EA                 1156         .word      LINK
                           00057A  1157 LINK = . 
      0085FA 05                    1158         .byte      5
      0085FB 27 45 56 41 4C        1159         .ascii     "'EVAL"
      008600                       1160 TEVAL:
      008600 90 AE 00 10      [ 2] 1161 	LDW Y,#UINTER 
      008604 1D 00 02         [ 2] 1162 	SUBW X,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008607 FF               [ 2] 1163         LDW (X),Y
      008608 81               [ 4] 1164         RET
                                   1165 
                                   1166 ;       HLD     ( -- a )
                                   1167 ;       Hold a pointer of output string.
      008609 85 FA                 1168         .word      LINK
                           00058B  1169 LINK = . 
      00860B 03                    1170         .byte      3
      00860C 48 4C 44              1171         .ascii     "HLD"
      00860F                       1172 HLD:
      00860F 90 AE 00 12      [ 2] 1173 	LDW Y,#UHLD 
      008613 1D 00 02         [ 2] 1174 	SUBW X,#2
      008616 FF               [ 2] 1175         LDW (X),Y
      008617 81               [ 4] 1176         RET
                                   1177 
                                   1178 ;       CONTEXT ( -- a )
                                   1179 ;       Start vocabulary search.
      008618 86 0B                 1180         .word      LINK
                           00059A  1181 LINK = . 
      00861A 07                    1182         .byte      7
      00861B 43 4F 4E 54 45 58 54  1183         .ascii     "CONTEXT"
      008622                       1184 CNTXT:
      008622 90 AE 00 14      [ 2] 1185 	LDW Y,#UCNTXT
      008626 1D 00 02         [ 2] 1186 	SUBW X,#2
      008629 FF               [ 2] 1187         LDW (X),Y
      00862A 81               [ 4] 1188         RET
                                   1189 
                                   1190 ;       VP      ( -- a )
                                   1191 ;       Point to top of variables
      00862B 86 1A                 1192         .word      LINK
                           0005AD  1193 LINK = . 
      00862D 02                    1194         .byte      2
      00862E 56 50                 1195         .ascii     "VP"
      008630                       1196 VPP:
      008630 90 AE 00 16      [ 2] 1197 	LDW Y,#UVP 
      008634 1D 00 02         [ 2] 1198 	SUBW X,#2
      008637 FF               [ 2] 1199         LDW (X),Y
      008638 81               [ 4] 1200         RET
                                   1201 
                                   1202 ;       CP    ( -- a )
                                   1203 ;       Pointer to top of FLASH 
      008639 86 2D                 1204         .word LINK 
                           0005BB  1205         LINK=.
      00863B 02                    1206         .byte 2 
      00863C 43 50                 1207         .ascii "CP"
      00863E                       1208 CPP: 
      00863E 90 AE 00 18      [ 2] 1209         ldw y,#UCP 
      008642 1D 00 02         [ 2] 1210         subw x,#CELLL 
      008645 FF               [ 2] 1211         ldw (x),y 
      008646 81               [ 4] 1212         ret                
                                   1213 
                                   1214 ;       LAST    ( -- a )
                                   1215 ;       Point to last name in dictionary.
      008647 86 3B                 1216         .word      LINK
                           0005C9  1217 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008649 04                    1218         .byte      4
      00864A 4C 41 53 54           1219         .ascii     "LAST"
      00864E                       1220 LAST:
      00864E 90 AE 00 1A      [ 2] 1221 	LDW Y,#ULAST 
      008652 1D 00 02         [ 2] 1222 	SUBW X,#2
      008655 FF               [ 2] 1223         LDW (X),Y
      008656 81               [ 4] 1224         RET
                                   1225 
                                   1226 ;; Common functions
                                   1227 
                                   1228 ;       ?DUP    ( w -- w w | 0 )
                                   1229 ;       Dup tos if its is not zero.
      008657 86 49                 1230         .word      LINK
                           0005D9  1231 LINK = . 
      008659 04                    1232         .byte      4
      00865A 3F 44 55 50           1233         .ascii     "?DUP"
      00865E                       1234 QDUP:
      00865E 90 93            [ 1] 1235         LDW Y,X
      008660 90 FE            [ 2] 1236 	LDW Y,(Y)
      008662 27 04            [ 1] 1237         JREQ     QDUP1
      008664 1D 00 02         [ 2] 1238 	SUBW X,#2
      008667 FF               [ 2] 1239         LDW (X),Y
      008668 81               [ 4] 1240 QDUP1:  RET
                                   1241 
                                   1242 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1243 ;       Rot 3rd item to top.
      008669 86 59                 1244         .word      LINK
                           0005EB  1245 LINK = . 
      00866B 03                    1246         .byte      3
      00866C 52 4F 54              1247         .ascii     "ROT"
      00866F                       1248 ROT:
      00866F 90 93            [ 1] 1249         ldw y,x 
      008671 90 FE            [ 2] 1250         ldw y,(y)
      008673 90 89            [ 2] 1251         pushw y 
      008675 90 93            [ 1] 1252         ldw y,x 
      008677 90 EE 04         [ 2] 1253         ldw y,(4,y)
      00867A FF               [ 2] 1254         ldw (x),y 
      00867B 90 93            [ 1] 1255         ldw y,x 
      00867D 90 EE 02         [ 2] 1256         ldw y,(2,y)
      008680 EF 04            [ 2] 1257         ldw (4,x),y 
      008682 90 85            [ 2] 1258         popw y 
      008684 EF 02            [ 2] 1259         ldw (2,x),y
      008686 81               [ 4] 1260         ret 
                                   1261 
                                   1262 ;       2DROP   ( w w -- )
                                   1263 ;       Discard two items on stack.
      008687 86 6B                 1264         .word      LINK
                           000609  1265 LINK = . 
      008689 05                    1266         .byte      5
      00868A 32 44 52 4F 50        1267         .ascii     "2DROP"
      00868F                       1268 DDROP:
      00868F 1C 00 04         [ 2] 1269         ADDW X,#4
      008692 81               [ 4] 1270         RET
                                   1271 
                                   1272 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



                                   1273 ;       Duplicate top two items.
      008693 86 89                 1274         .word      LINK
                           000615  1275 LINK = . 
      008695 04                    1276         .byte      4
      008696 32 44 55 50           1277         .ascii     "2DUP"
      00869A                       1278 DDUP:
      00869A 1D 00 04         [ 2] 1279         SUBW X,#4
      00869D 90 93            [ 1] 1280         LDW Y,X
      00869F 90 EE 06         [ 2] 1281         LDW Y,(6,Y)
      0086A2 EF 02            [ 2] 1282         LDW (2,X),Y
      0086A4 90 93            [ 1] 1283         LDW Y,X
      0086A6 90 EE 04         [ 2] 1284         LDW Y,(4,Y)
      0086A9 FF               [ 2] 1285         LDW (X),Y
      0086AA 81               [ 4] 1286         RET
                                   1287 
                                   1288 ;       +       ( w w -- sum )
                                   1289 ;       Add top two items.
      0086AB 86 95                 1290         .word      LINK
                           00062D  1291 LINK = . 
      0086AD 01                    1292         .byte      1
      0086AE 2B                    1293         .ascii     "+"
      0086AF                       1294 PLUS:
      0086AF 90 93            [ 1] 1295         LDW Y,X
      0086B1 90 FE            [ 2] 1296         LDW Y,(Y)
      0086B3 90 BF 1E         [ 2] 1297         LDW YTEMP,Y
      0086B6 1C 00 02         [ 2] 1298         ADDW X,#2
      0086B9 90 93            [ 1] 1299         LDW Y,X
      0086BB 90 FE            [ 2] 1300         LDW Y,(Y)
      0086BD 72 B9 00 1E      [ 2] 1301         ADDW Y,YTEMP
      0086C1 FF               [ 2] 1302         LDW (X),Y
      0086C2 81               [ 4] 1303         RET
                                   1304 
                                   1305 ;       NOT     ( w -- w )
                                   1306 ;       One's complement of tos.
      0086C3 86 AD                 1307         .word      LINK
                           000645  1308 LINK = . 
      0086C5 03                    1309         .byte      3
      0086C6 4E 4F 54              1310         .ascii     "NOT"
      0086C9                       1311 INVER:
      0086C9 90 93            [ 1] 1312         LDW Y,X
      0086CB 90 FE            [ 2] 1313         LDW Y,(Y)
      0086CD 90 53            [ 2] 1314         CPLW Y
      0086CF FF               [ 2] 1315         LDW (X),Y
      0086D0 81               [ 4] 1316         RET
                                   1317 
                                   1318 ;       NEGATE  ( n -- -n )
                                   1319 ;       Two's complement of tos.
      0086D1 86 C5                 1320         .word      LINK
                           000653  1321 LINK = . 
      0086D3 06                    1322         .byte      6
      0086D4 4E 45 47 41 54 45     1323         .ascii     "NEGATE"
      0086DA                       1324 NEGAT:
      0086DA 90 93            [ 1] 1325         LDW Y,X
      0086DC 90 FE            [ 2] 1326         LDW Y,(Y)
      0086DE 90 50            [ 2] 1327         NEGW Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      0086E0 FF               [ 2] 1328         LDW (X),Y
      0086E1 81               [ 4] 1329         RET
                                   1330 
                                   1331 ;       DNEGATE ( d -- -d )
                                   1332 ;       Two's complement of top double.
      0086E2 86 D3                 1333         .word      LINK
                           000664  1334 LINK = . 
      0086E4 07                    1335         .byte      7
      0086E5 44 4E 45 47 41 54 45  1336         .ascii     "DNEGATE"
      0086EC                       1337 DNEGA:
      0086EC 90 93            [ 1] 1338         LDW Y,X
      0086EE 90 FE            [ 2] 1339 	LDW Y,(Y)
      0086F0 90 53            [ 2] 1340         CPLW Y     
      0086F2 90 BF 1E         [ 2] 1341 	LDW YTEMP,Y
      0086F5 90 93            [ 1] 1342         LDW Y,X
      0086F7 90 EE 02         [ 2] 1343         LDW Y,(2,Y)
      0086FA 90 53            [ 2] 1344         CPLW Y
      0086FC 72 A9 00 01      [ 2] 1345         addw y,#1
      008700 EF 02            [ 2] 1346         LDW (2,X),Y
      008702 90 BE 1E         [ 2] 1347         LDW Y,YTEMP
      008705 24 02            [ 1] 1348         JRNC DN1 
      008707 90 5C            [ 2] 1349         INCW Y
      008709 FF               [ 2] 1350 DN1:    LDW (X),Y
      00870A 81               [ 4] 1351         RET
                                   1352 
                                   1353 
                                   1354 ;       S>D ( n -- d )
                                   1355 ; convert single integer to double 
      00870B 86 E4                 1356         .word LINK 
                           00068D  1357         LINK=. 
      00870D 03                    1358         .byte 3 
      00870E 53 3E 44              1359         .ascii "S>D"
      008711                       1360 STOD: 
      008711 1D 00 02         [ 2] 1361         subw x,#CELLL 
      008714 90 5F            [ 1] 1362         clrw y 
      008716 FF               [ 2] 1363         ldw (x),y 
      008717 90 93            [ 1] 1364         ldw y,x 
      008719 90 EE 02         [ 2] 1365         ldw y,(2,y)
      00871C 2A 05            [ 1] 1366         jrpl 1$ 
      00871E 90 AE FF FF      [ 2] 1367         ldw y,#-1
      008722 FF               [ 2] 1368         ldw (x),y 
      008723 81               [ 4] 1369 1$:     ret 
                                   1370 
                                   1371 
                                   1372 
                                   1373 
                                   1374 ;       -       ( n1 n2 -- n1-n2 )
                                   1375 ;       Subtraction.
      008724 87 0D                 1376         .word      LINK
                           0006A6  1377 LINK = . 
      008726 01                    1378         .byte      1
      008727 2D                    1379         .ascii     "-"
      008728                       1380 SUBB:
      008728 90 93            [ 1] 1381         LDW Y,X
      00872A 90 FE            [ 2] 1382         LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      00872C 90 BF 1E         [ 2] 1383         LDW YTEMP,Y
      00872F 1C 00 02         [ 2] 1384         ADDW X,#2
      008732 90 93            [ 1] 1385         LDW Y,X
      008734 90 FE            [ 2] 1386         LDW Y,(Y)
      008736 72 B2 00 1E      [ 2] 1387         SUBW Y,YTEMP
      00873A FF               [ 2] 1388         LDW (X),Y
      00873B 81               [ 4] 1389         RET
                                   1390 
                                   1391 ;       ABS     ( n -- n )
                                   1392 ;       Return  absolute value of n.
      00873C 87 26                 1393         .word      LINK
                           0006BE  1394 LINK = . 
      00873E 03                    1395         .byte      3
      00873F 41 42 53              1396         .ascii     "ABS"
      008742                       1397 ABSS:
      008742 90 93            [ 1] 1398         LDW Y,X
      008744 90 FE            [ 2] 1399 	LDW Y,(Y)
      008746 2A 03            [ 1] 1400         JRPL     AB1     ;negate:
      008748 90 50            [ 2] 1401         NEGW     Y     ;else negate hi byte
      00874A FF               [ 2] 1402         LDW (X),Y
      00874B 81               [ 4] 1403 AB1:    RET
                                   1404 
                                   1405 ;       =       ( w w -- t )
                                   1406 ;       Return true if top two are =al.
      00874C 87 3E                 1407         .word      LINK
                           0006CE  1408 LINK = . 
      00874E 01                    1409         .byte      1
      00874F 3D                    1410         .ascii     "="
      008750                       1411 EQUAL:
      008750 A6 FF            [ 1] 1412         LD A,#0xFF  ;true
      008752 90 93            [ 1] 1413         LDW Y,X    ;D = n2
      008754 90 FE            [ 2] 1414         LDW Y,(Y)
      008756 90 BF 1E         [ 2] 1415         LDW YTEMP,Y
      008759 1C 00 02         [ 2] 1416         ADDW X,#2
      00875C 90 93            [ 1] 1417         LDW Y,X
      00875E 90 FE            [ 2] 1418         LDW Y,(Y)
      008760 90 B3 1E         [ 2] 1419         CPW Y,YTEMP     ;if n2 <> n1
      008763 27 01            [ 1] 1420         JREQ     EQ1
      008765 4F               [ 1] 1421         CLR A
      008766 F7               [ 1] 1422 EQ1:    LD (X),A
      008767 E7 01            [ 1] 1423         LD (1,X),A
      008769 81               [ 4] 1424 	RET     
                                   1425 
                                   1426 ;       U<      ( u u -- t )
                                   1427 ;       Unsigned compare of top two items.
      00876A 87 4E                 1428         .word      LINK
                           0006EC  1429 LINK = . 
      00876C 02                    1430         .byte      2
      00876D 55 3C                 1431         .ascii     "U<"
      00876F                       1432 ULESS:
      00876F A6 FF            [ 1] 1433         LD A,#0xFF  ;true
      008771 90 93            [ 1] 1434         LDW Y,X    ;D = n2
      008773 90 FE            [ 2] 1435         LDW Y,(Y)
      008775 90 BF 1E         [ 2] 1436         LDW YTEMP,Y
      008778 1C 00 02         [ 2] 1437         ADDW X,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      00877B 90 93            [ 1] 1438         LDW Y,X
      00877D 90 FE            [ 2] 1439         LDW Y,(Y)
      00877F 90 B3 1E         [ 2] 1440         CPW Y,YTEMP     ;if n2 <> n1
      008782 25 01            [ 1] 1441         JRULT     ULES1
      008784 4F               [ 1] 1442         CLR A
      008785 F7               [ 1] 1443 ULES1:  LD (X),A
      008786 E7 01            [ 1] 1444         LD (1,X),A
      008788 81               [ 4] 1445 	RET     
                                   1446 
                                   1447 ;       <       ( n1 n2 -- t )
                                   1448 ;       Signed compare of top two items.
      008789 87 6C                 1449         .word      LINK
                           00070B  1450 LINK = . 
      00878B 01                    1451         .byte      1
      00878C 3C                    1452         .ascii     "<"
      00878D                       1453 LESS:
      00878D A6 FF            [ 1] 1454         LD A,#0xFF  ;true
      00878F 90 93            [ 1] 1455         LDW Y,X    ;D = n2
      008791 90 FE            [ 2] 1456         LDW Y,(Y)
      008793 90 BF 1E         [ 2] 1457         LDW YTEMP,Y
      008796 1C 00 02         [ 2] 1458         ADDW X,#2
      008799 90 93            [ 1] 1459         LDW Y,X
      00879B 90 FE            [ 2] 1460         LDW Y,(Y)
      00879D 90 B3 1E         [ 2] 1461         CPW Y,YTEMP     ;if n2 <> n1
      0087A0 2F 01            [ 1] 1462         JRSLT     LT1
      0087A2 4F               [ 1] 1463         CLR A
      0087A3 F7               [ 1] 1464 LT1:    LD (X),A
      0087A4 E7 01            [ 1] 1465         LD (1,X),A
      0087A6 81               [ 4] 1466 	RET     
                                   1467 
                                   1468 ;       MAX     ( n n -- n )
                                   1469 ;       Return greater of two top items.
      0087A7 87 8B                 1470         .word      LINK
                           000729  1471 LINK = . 
      0087A9 03                    1472         .byte      3
      0087AA 4D 41 58              1473         .ascii     "MAX"
      0087AD                       1474 MAX:
      0087AD 90 93            [ 1] 1475         LDW Y,X    ;D = n2
      0087AF 90 EE 02         [ 2] 1476         LDW Y,(2,Y)
      0087B2 90 BF 1E         [ 2] 1477         LDW YTEMP,Y
      0087B5 90 93            [ 1] 1478         LDW Y,X
      0087B7 90 FE            [ 2] 1479         LDW Y,(Y)
      0087B9 90 B3 1E         [ 2] 1480         CPW Y,YTEMP     ;if n2 <> n1
      0087BC 2F 02            [ 1] 1481         JRSLT     MAX1
      0087BE EF 02            [ 2] 1482         LDW (2,X),Y
      0087C0 1C 00 02         [ 2] 1483 MAX1:   ADDW X,#2
      0087C3 81               [ 4] 1484 	RET     
                                   1485 
                                   1486 ;       MIN     ( n n -- n )
                                   1487 ;       Return smaller of top two items.
      0087C4 87 A9                 1488         .word      LINK
                           000746  1489 LINK = . 
      0087C6 03                    1490         .byte      3
      0087C7 4D 49 4E              1491         .ascii     "MIN"
      0087CA                       1492 MIN:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0087CA 90 93            [ 1] 1493         LDW Y,X    ;D = n2
      0087CC 90 EE 02         [ 2] 1494         LDW Y,(2,Y)
      0087CF 90 BF 1E         [ 2] 1495         LDW YTEMP,Y
      0087D2 90 93            [ 1] 1496         LDW Y,X
      0087D4 90 FE            [ 2] 1497         LDW Y,(Y)
      0087D6 90 B3 1E         [ 2] 1498         CPW Y,YTEMP     ;if n2 <> n1
      0087D9 2C 02            [ 1] 1499         JRSGT     MIN1
      0087DB EF 02            [ 2] 1500         LDW (2,X),Y
      0087DD 1C 00 02         [ 2] 1501 MIN1:	ADDW X,#2
      0087E0 81               [ 4] 1502 	RET     
                                   1503 
                                   1504 ;       WITHIN  ( u ul uh -- t )
                                   1505 ;       Return true if u is within
                                   1506 ;       range of ul and uh. ( ul <= u < uh )
      0087E1 87 C6                 1507         .word      LINK
                           000763  1508 LINK = . 
      0087E3 06                    1509         .byte      6
      0087E4 57 49 54 48 49 4E     1510         .ascii     "WITHIN"
      0087EA                       1511 WITHI:
      0087EA CD 85 2E         [ 4] 1512         CALL     OVER
      0087ED CD 87 28         [ 4] 1513         CALL     SUBB
      0087F0 CD 84 CD         [ 4] 1514         CALL     TOR
      0087F3 CD 87 28         [ 4] 1515         CALL     SUBB
      0087F6 CD 84 AE         [ 4] 1516         CALL     RFROM
      0087F9 CC 87 6F         [ 2] 1517         JP     ULESS
                                   1518 
                                   1519 ;; Divide
                                   1520 
                                   1521 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1522 ;       Unsigned divide of a double by a
                                   1523 ;       single. Return mod and quotient.
      0087FC 87 E3                 1524         .word      LINK
                           00077E  1525 LINK = . 
      0087FE 06                    1526         .byte      6
      0087FF 55 4D 2F 4D 4F 44     1527         .ascii     "UM/MOD"
      008805                       1528 UMMOD:
      008805 BF 1C            [ 2] 1529 	LDW XTEMP,X	; save stack pointer
      008807 FE               [ 2] 1530 	LDW X,(X)	; un
      008808 BF 1E            [ 2] 1531 	LDW YTEMP,X     ; save un
      00880A 90 BE 1C         [ 2] 1532 	LDW Y,XTEMP	; stack pointer
      00880D 90 EE 04         [ 2] 1533 	LDW Y,(4,Y)     ; Y=udl
      008810 BE 1C            [ 2] 1534 	LDW X,XTEMP
      008812 EE 02            [ 2] 1535 	LDW X,(2,X)	; X=udh
      008814 B3 1E            [ 2] 1536 	CPW X,YTEMP
      008816 23 0F            [ 2] 1537 	JRULE MMSM1
      008818 BE 1C            [ 2] 1538 	LDW X,XTEMP
      00881A 1C 00 02         [ 2] 1539 	ADDW X,#2	; pop off 1 level
      00881D 90 AE FF FF      [ 2] 1540 	LDW Y,#0xFFFF
      008821 FF               [ 2] 1541 	LDW (X),Y
      008822 90 5F            [ 1] 1542 	CLRW Y
      008824 EF 02            [ 2] 1543 	LDW (2,X),Y
      008826 81               [ 4] 1544 	RET
      008827                       1545 MMSM1:
                                   1546 ; take advantage of divw x,y when udh==0
      008827 5D               [ 2] 1547         tnzw x  ; is udh==0?
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      008828 26 11            [ 1] 1548         jrne MMSM2 
      00882A 93               [ 1] 1549         ldw x,y    ;udl 
      00882B 90 BE 1E         [ 2] 1550         ldw y,YTEMP ; divisor 
      00882E 65               [ 2] 1551         divw x,y 
      00882F 89               [ 2] 1552         pushw x     ; quotient 
      008830 BE 1C            [ 2] 1553         ldw x,XTEMP 
      008832 1C 00 02         [ 2] 1554         addw x,#CELLL 
      008835 EF 02            [ 2] 1555         ldw (2,x),y  ; ur
      008837 90 85            [ 2] 1556         popw y 
      008839 FF               [ 2] 1557         ldw (x),y ; uq 
      00883A 81               [ 4] 1558         ret 
      00883B                       1559 MMSM2:        
      00883B A6 11            [ 1] 1560 	LD A,#17	; loop count
      00883D                       1561 MMSM3:
      00883D B3 1E            [ 2] 1562 	CPW X,YTEMP	; compare udh to un
      00883F 25 04            [ 1] 1563 	JRULT MMSM4	; can't subtract
      008841 72 B0 00 1E      [ 2] 1564 	SUBW X,YTEMP	; can subtract
      008845                       1565 MMSM4:
      008845 8C               [ 1] 1566 	CCF	; quotient bit
      008846 90 59            [ 2] 1567 	RLCW Y	; rotate into quotient
      008848 59               [ 2] 1568 	RLCW X	; rotate into remainder
      008849 4A               [ 1] 1569 	DEC A	; repeat
      00884A 22 F1            [ 1] 1570 	JRUGT MMSM3
      00884C 56               [ 2] 1571         RRCW X 
      00884D BF 1E            [ 2] 1572 	LDW YTEMP,X	; done, save remainder
      00884F BE 1C            [ 2] 1573 	LDW X,XTEMP
      008851 1C 00 02         [ 2] 1574 	ADDW X,#2	; drop
      008854 FF               [ 2] 1575 	LDW (X),Y
      008855 90 BE 1E         [ 2] 1576 	LDW Y,YTEMP	; save quotient
      008858 EF 02            [ 2] 1577 	LDW (2,X),Y
      00885A 81               [ 4] 1578 	RET
                                   1579 	
                                   1580 ;       M/MOD   ( d n -- r q )
                                   1581 ;       Signed floored divide of double by
                                   1582 ;       single. Return mod and quotient.
      00885B 87 FE                 1583         .word      LINK
                           0007DD  1584 LINK = . 
      00885D 05                    1585         .byte      5
      00885E 4D 2F 4D 4F 44        1586         .ascii     "M/MOD"
      008863                       1587 MSMOD:  
      008863 CD 85 04         [ 4] 1588         CALL	DUPP
      008866 CD 85 3D         [ 4] 1589         CALL	ZLESS
      008869 CD 85 04         [ 4] 1590         CALL	DUPP
      00886C CD 84 CD         [ 4] 1591         CALL	TOR
      00886F CD 84 12         [ 4] 1592         CALL	QBRAN
      008872 88 80                 1593         .word	MMOD1
      008874 CD 86 DA         [ 4] 1594         CALL	NEGAT
      008877 CD 84 CD         [ 4] 1595         CALL	TOR
      00887A CD 86 EC         [ 4] 1596         CALL	DNEGA
      00887D CD 84 AE         [ 4] 1597         CALL	RFROM
      008880 CD 84 CD         [ 4] 1598 MMOD1:	CALL	TOR
      008883 CD 85 04         [ 4] 1599         CALL	DUPP
      008886 CD 85 3D         [ 4] 1600         CALL	ZLESS
      008889 CD 84 12         [ 4] 1601         CALL	QBRAN
      00888C 88 94                 1602         .word	MMOD2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      00888E CD 84 C1         [ 4] 1603         CALL	RAT
      008891 CD 86 AF         [ 4] 1604         CALL	PLUS
      008894 CD 84 AE         [ 4] 1605 MMOD2:	CALL	RFROM
      008897 CD 88 05         [ 4] 1606         CALL	UMMOD
      00889A CD 84 AE         [ 4] 1607         CALL	RFROM
      00889D CD 84 12         [ 4] 1608         CALL	QBRAN
      0088A0 88 AB                 1609         .word	MMOD3
      0088A2 CD 85 14         [ 4] 1610         CALL	SWAPP
      0088A5 CD 86 DA         [ 4] 1611         CALL	NEGAT
      0088A8 CD 85 14         [ 4] 1612         CALL	SWAPP
      0088AB 81               [ 4] 1613 MMOD3:	RET
                                   1614 
                                   1615 ;       /MOD    ( n n -- r q )
                                   1616 ;       Signed divide. Return mod and quotient.
      0088AC 88 5D                 1617         .word      LINK
                           00082E  1618 LINK = . 
      0088AE 04                    1619         .byte      4
      0088AF 2F 4D 4F 44           1620         .ascii     "/MOD"
      0088B3                       1621 SLMOD:
      0088B3 CD 85 2E         [ 4] 1622         CALL	OVER
      0088B6 CD 85 3D         [ 4] 1623         CALL	ZLESS
      0088B9 CD 85 14         [ 4] 1624         CALL	SWAPP
      0088BC CC 88 63         [ 2] 1625         JP	MSMOD
                                   1626 
                                   1627 ;       MOD     ( n n -- r )
                                   1628 ;       Signed divide. Return mod only.
      0088BF 88 AE                 1629         .word      LINK
                           000841  1630 LINK = . 
      0088C1 03                    1631         .byte      3
      0088C2 4D 4F 44              1632         .ascii     "MOD"
      0088C5                       1633 MODD:
      0088C5 CD 88 B3         [ 4] 1634 	CALL	SLMOD
      0088C8 CC 84 FA         [ 2] 1635 	JP	DROP
                                   1636 
                                   1637 ;       /       ( n n -- q )
                                   1638 ;       Signed divide. Return quotient only.
      0088CB 88 C1                 1639         .word      LINK
                           00084D  1640 LINK = . 
      0088CD 01                    1641         .byte      1
      0088CE 2F                    1642         .ascii     "/"
      0088CF                       1643 SLASH:
      0088CF CD 88 B3         [ 4] 1644         CALL	SLMOD
      0088D2 CD 85 14         [ 4] 1645         CALL	SWAPP
      0088D5 CC 84 FA         [ 2] 1646         JP	DROP
                                   1647 
                                   1648 ;; Multiply
                                   1649 
                                   1650 ;       UM*     ( u u -- ud )
                                   1651 ;       Unsigned multiply. Return double product.
      0088D8 88 CD                 1652         .word      LINK
                           00085A  1653 LINK = . 
      0088DA 03                    1654         .byte      3
      0088DB 55 4D 2A              1655         .ascii     "UM*"
      0088DE                       1656 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                                   1657 ; take advantage of SP addressing modes
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1658 ; these PRODx in RAM are not required
                                   1659 ; the product is kept on stack as local variable 
                                   1660         ;; bytes offset on data stack 
                           000002  1661         da=2 
                           000003  1662         db=3 
                           000000  1663         dc=0 
                           000001  1664         dd=1 
                                   1665         ;; product bytes offset on return stack 
                           000001  1666         UD1=1  ; ud bits 31..24
                           000002  1667         UD2=2  ; ud bits 23..16
                           000003  1668         UD3=3  ; ud bits 15..8 
                           000004  1669         UD4=4  ; ud bits 7..0 
                                   1670         ;; local variable for product set to zero   
      0088DE 90 5F            [ 1] 1671         clrw y 
      0088E0 90 89            [ 2] 1672         pushw y  ; bits 15..0
      0088E2 90 89            [ 2] 1673         pushw y  ; bits 31..16 
      0088E4 E6 03            [ 1] 1674         ld a,(db,x) ; b 
      0088E6 90 97            [ 1] 1675         ld yl,a 
      0088E8 E6 01            [ 1] 1676         ld a,(dd,x)   ; d
      0088EA 90 42            [ 4] 1677         mul y,a    ; b*d  
      0088EC 17 03            [ 2] 1678         ldw (UD3,sp),y ; lowest weight product 
      0088EE E6 03            [ 1] 1679         ld a,(db,x)
      0088F0 90 97            [ 1] 1680         ld yl,a 
      0088F2 E6 00            [ 1] 1681         ld a,(dc,x)
      0088F4 90 42            [ 4] 1682         mul y,a  ; b*c 
                                   1683         ;;; do the partial sum 
      0088F6 72 F9 02         [ 2] 1684         addw y,(UD2,sp)
      0088F9 4F               [ 1] 1685         clr a 
      0088FA 49               [ 1] 1686         rlc a
      0088FB 6B 01            [ 1] 1687         ld (UD1,sp),a 
      0088FD 17 02            [ 2] 1688         ldw (UD2,sp),y 
      0088FF E6 02            [ 1] 1689         ld a,(da,x)
      008901 90 97            [ 1] 1690         ld yl,a 
      008903 E6 01            [ 1] 1691         ld a,(dd,x)
      008905 90 42            [ 4] 1692         mul y,a   ; a*d 
                                   1693         ;; do partial sum 
      008907 72 F9 02         [ 2] 1694         addw y,(UD2,sp)
      00890A 4F               [ 1] 1695         clr a 
      00890B 19 01            [ 1] 1696         adc a,(UD1,sp)
      00890D 6B 01            [ 1] 1697         ld (UD1,sp),a  
      00890F 17 02            [ 2] 1698         ldw (UD2,sp),y 
      008911 E6 02            [ 1] 1699         ld a,(da,x)
      008913 90 97            [ 1] 1700         ld yl,a 
      008915 E6 00            [ 1] 1701         ld a,(dc,x)
      008917 90 42            [ 4] 1702         mul y,a  ;  a*c highest weight product 
                                   1703         ;;; do partial sum 
      008919 72 F9 01         [ 2] 1704         addw y,(UD1,sp)
      00891C FF               [ 2] 1705         ldw (x),y  ; udh 
      00891D 16 03            [ 2] 1706         ldw y,(UD3,sp)
      00891F EF 02            [ 2] 1707         ldw (2,x),y  ; udl  
      008921 5B 04            [ 2] 1708         addw sp,#4 ; drop local variable 
      008923 81               [ 4] 1709         ret  
                                   1710 
                                   1711 
                                   1712 ;       *       ( n n -- n )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1713 ;       Signed multiply. Return single product.
      008924 88 DA                 1714         .word      LINK
                           0008A6  1715 LINK = . 
      008926 01                    1716         .byte      1
      008927 2A                    1717         .ascii     "*"
      008928                       1718 STAR:
      008928 CD 88 DE         [ 4] 1719 	CALL	UMSTA
      00892B CC 84 FA         [ 2] 1720 	JP	DROP
                                   1721 
                                   1722 ;       M*      ( n n -- d )
                                   1723 ;       Signed multiply. Return double product.
      00892E 89 26                 1724         .word      LINK
                           0008B0  1725 LINK = . 
      008930 02                    1726         .byte      2
      008931 4D 2A                 1727         .ascii     "M*"
      008933                       1728 MSTAR:      
      008933 CD 86 9A         [ 4] 1729         CALL	DDUP
      008936 CD 85 79         [ 4] 1730         CALL	XORR
      008939 CD 85 3D         [ 4] 1731         CALL	ZLESS
      00893C CD 84 CD         [ 4] 1732         CALL	TOR
      00893F CD 87 42         [ 4] 1733         CALL	ABSS
      008942 CD 85 14         [ 4] 1734         CALL	SWAPP
      008945 CD 87 42         [ 4] 1735         CALL	ABSS
      008948 CD 88 DE         [ 4] 1736         CALL	UMSTA
      00894B CD 84 AE         [ 4] 1737         CALL	RFROM
      00894E CD 84 12         [ 4] 1738         CALL	QBRAN
      008951 89 56                 1739         .word	MSTA1
      008953 CD 86 EC         [ 4] 1740         CALL	DNEGA
      008956 81               [ 4] 1741 MSTA1:	RET
                                   1742 
                                   1743 ;       */MOD   ( n1 n2 n3 -- r q )
                                   1744 ;       Multiply n1 and n2, then divide
                                   1745 ;       by n3. Return mod and quotient.
      008957 89 30                 1746         .word      LINK
                           0008D9  1747 LINK = . 
      008959 05                    1748         .byte      5
      00895A 2A 2F 4D 4F 44        1749         .ascii     "*/MOD"
      00895F                       1750 SSMOD:
      00895F CD 84 CD         [ 4] 1751         CALL     TOR
      008962 CD 89 33         [ 4] 1752         CALL     MSTAR
      008965 CD 84 AE         [ 4] 1753         CALL     RFROM
      008968 CC 88 63         [ 2] 1754         JP     MSMOD
                                   1755 
                                   1756 ;       */      ( n1 n2 n3 -- q )
                                   1757 ;       Multiply n1 by n2, then divide
                                   1758 ;       by n3. Return quotient only.
      00896B 89 59                 1759         .word      LINK
                           0008ED  1760 LINK = . 
      00896D 02                    1761         .byte      2
      00896E 2A 2F                 1762         .ascii     "*/"
      008970                       1763 STASL:
      008970 CD 89 5F         [ 4] 1764         CALL	SSMOD
      008973 CD 85 14         [ 4] 1765         CALL	SWAPP
      008976 CC 84 FA         [ 2] 1766         JP	DROP
                                   1767 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1768 ;; Miscellaneous
                                   1769 
                                   1770 ;       CELL+   ( a -- a )
                                   1771 ;       Add cell size in byte to address.
      008979 89 6D                 1772         .word      LINK
                           0008FB  1773 LINK = . 
      00897B 02                    1774         .byte       2
      00897C 32 2B                 1775         .ascii     "2+"
      00897E                       1776 CELLP:
      00897E 90 93            [ 1] 1777         LDW Y,X
      008980 90 FE            [ 2] 1778 	LDW Y,(Y)
      008982 72 A9 00 02      [ 2] 1779         ADDW Y,#CELLL 
      008986 FF               [ 2] 1780         LDW (X),Y
      008987 81               [ 4] 1781         RET
                                   1782 
                                   1783 ;       CELL-   ( a -- a )
                                   1784 ;       Subtract 2 from address.
      008988 89 7B                 1785         .word      LINK
                           00090A  1786 LINK = . 
      00898A 02                    1787         .byte       2
      00898B 32 2D                 1788         .ascii     "2-"
      00898D                       1789 CELLM:
      00898D 90 93            [ 1] 1790         LDW Y,X
      00898F 90 FE            [ 2] 1791 	LDW Y,(Y)
      008991 72 A2 00 02      [ 2] 1792         SUBW Y,#CELLL
      008995 FF               [ 2] 1793         LDW (X),Y
      008996 81               [ 4] 1794         RET
                                   1795 
                                   1796 ;       CELLS   ( n -- n )
                                   1797 ;       Multiply tos by 2.
      008997 89 8A                 1798         .word      LINK
                           000919  1799 LINK = . 
      008999 02                    1800         .byte       2
      00899A 32 2A                 1801         .ascii     "2*"
      00899C                       1802 CELLS:
      00899C 90 93            [ 1] 1803         LDW Y,X
      00899E 90 FE            [ 2] 1804 	LDW Y,(Y)
      0089A0 90 58            [ 2] 1805         SLAW Y
      0089A2 FF               [ 2] 1806         LDW (X),Y
      0089A3 81               [ 4] 1807         RET
                                   1808 
                                   1809 ;       1+      ( a -- a )
                                   1810 ;       Add cell size in byte to address.
      0089A4 89 99                 1811         .word      LINK
                           000926  1812 LINK = . 
      0089A6 02                    1813         .byte      2
      0089A7 31 2B                 1814         .ascii     "1+"
      0089A9                       1815 ONEP:
      0089A9 90 93            [ 1] 1816         LDW Y,X
      0089AB 90 FE            [ 2] 1817 	LDW Y,(Y)
      0089AD 90 5C            [ 2] 1818         INCW Y
      0089AF FF               [ 2] 1819         LDW (X),Y
      0089B0 81               [ 4] 1820         RET
                                   1821 
                                   1822 ;       1-      ( a -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1823 ;       Subtract 2 from address.
      0089B1 89 A6                 1824         .word      LINK
                           000933  1825 LINK = . 
      0089B3 02                    1826         .byte      2
      0089B4 31 2D                 1827         .ascii     "1-"
      0089B6                       1828 ONEM:
      0089B6 90 93            [ 1] 1829         LDW Y,X
      0089B8 90 FE            [ 2] 1830 	LDW Y,(Y)
      0089BA 90 5A            [ 2] 1831         DECW Y
      0089BC FF               [ 2] 1832         LDW (X),Y
      0089BD 81               [ 4] 1833         RET
                                   1834 
                                   1835 ;  shift left n times 
                                   1836 ; LSHIFT ( n1 n2 -- n1<<n2 )
      0089BE 89 B3                 1837         .word LINK 
                           000940  1838         LINK=.
      0089C0 06                    1839         .byte 6 
      0089C1 4C 53 48 49 46 54     1840         .ascii "LSHIFT"
      0089C7                       1841 LSHIFT:
      0089C7 E6 01            [ 1] 1842         ld a,(1,x)
      0089C9 1C 00 02         [ 2] 1843         addw x,#CELLL 
      0089CC 90 93            [ 1] 1844         ldw y,x 
      0089CE 90 FE            [ 2] 1845         ldw y,(y)
      0089D0                       1846 LSHIFT1:
      0089D0 4D               [ 1] 1847         tnz a 
      0089D1 27 05            [ 1] 1848         jreq LSHIFT4 
      0089D3 90 58            [ 2] 1849         sllw y 
      0089D5 4A               [ 1] 1850         dec a 
      0089D6 20 F8            [ 2] 1851         jra LSHIFT1 
      0089D8                       1852 LSHIFT4:
      0089D8 FF               [ 2] 1853         ldw (x),y 
      0089D9 81               [ 4] 1854         ret 
                                   1855 
                                   1856 ; shift right n times                 
                                   1857 ; RSHIFT (n1 n2 -- n1>>n2 )
      0089DA 89 C0                 1858         .word LINK 
                           00095C  1859         LINK=.
      0089DC 06                    1860         .byte 6
      0089DD 52 53 48 49 46 54     1861         .ascii "RSHIFT"
      0089E3                       1862 RSHIFT:
      0089E3 E6 01            [ 1] 1863         ld a,(1,x)
      0089E5 1C 00 02         [ 2] 1864         addw x,#CELLL 
      0089E8 90 93            [ 1] 1865         ldw y,x 
      0089EA 90 FE            [ 2] 1866         ldw y,(y)
      0089EC                       1867 RSHIFT1:
      0089EC 4D               [ 1] 1868         tnz a 
      0089ED 27 05            [ 1] 1869         jreq RSHIFT4 
      0089EF 90 54            [ 2] 1870         srlw y 
      0089F1 4A               [ 1] 1871         dec a 
      0089F2 20 F8            [ 2] 1872         jra RSHIFT1 
      0089F4                       1873 RSHIFT4:
      0089F4 FF               [ 2] 1874         ldw (x),y 
      0089F5 81               [ 4] 1875         ret 
                                   1876 
                                   1877 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                   1878 ;       2/      ( n -- n )
                                   1879 ;       divide  tos by 2.
      0089F6 89 DC                 1880         .word      LINK
                           000978  1881 LINK = . 
      0089F8 02                    1882         .byte      2
      0089F9 32 2F                 1883         .ascii     "2/"
      0089FB                       1884 TWOSL:
      0089FB 90 93            [ 1] 1885         LDW Y,X
      0089FD 90 FE            [ 2] 1886 	LDW Y,(Y)
      0089FF 90 57            [ 2] 1887         SRAW Y
      008A01 FF               [ 2] 1888         LDW (X),Y
      008A02 81               [ 4] 1889         RET
                                   1890 
                                   1891 ;       BL      ( -- 32 )
                                   1892 ;       Return 32,  blank character.
      008A03 89 F8                 1893         .word      LINK
                           000985  1894 LINK = . 
      008A05 02                    1895         .byte      2
      008A06 42 4C                 1896         .ascii     "BL"
      008A08                       1897 BLANK:
      008A08 1D 00 02         [ 2] 1898         SUBW X,#2
      008A0B 90 AE 00 20      [ 2] 1899 	LDW Y,#32
      008A0F FF               [ 2] 1900         LDW (X),Y
      008A10 81               [ 4] 1901         RET
                                   1902 
                                   1903 ;         0     ( -- 0)
                                   1904 ;         Return 0.
      008A11 8A 05                 1905         .word      LINK
                           000993  1906 LINK = . 
      008A13 01                    1907         .byte       1
      008A14 30                    1908         .ascii     "0"
      008A15                       1909 ZERO:
      008A15 1D 00 02         [ 2] 1910         SUBW X,#2
      008A18 90 5F            [ 1] 1911 	CLRW Y
      008A1A FF               [ 2] 1912         LDW (X),Y
      008A1B 81               [ 4] 1913         RET
                                   1914 
                                   1915 ;         1     ( -- 1)
                                   1916 ;         Return 1.
      008A1C 8A 13                 1917         .word      LINK
                           00099E  1918 LINK = . 
      008A1E 01                    1919         .byte       1
      008A1F 31                    1920         .ascii     "1"
      008A20                       1921 ONE:
      008A20 1D 00 02         [ 2] 1922         SUBW X,#2
      008A23 90 AE 00 01      [ 2] 1923 	LDW Y,#1
      008A27 FF               [ 2] 1924         LDW (X),Y
      008A28 81               [ 4] 1925         RET
                                   1926 
                                   1927 ;         -1    ( -- -1)
                                   1928 ;         Return 32,  blank character.
      008A29 8A 1E                 1929         .word      LINK
                           0009AB  1930 LINK = . 
      008A2B 02                    1931         .byte       2
      008A2C 2D 31                 1932         .ascii     "-1"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008A2E                       1933 MONE:
      008A2E 1D 00 02         [ 2] 1934         SUBW X,#2
      008A31 90 AE FF FF      [ 2] 1935 	LDW Y,#0xFFFF
      008A35 FF               [ 2] 1936         LDW (X),Y
      008A36 81               [ 4] 1937         RET
                                   1938 
                                   1939 ;       >CHAR   ( c -- c )
                                   1940 ;       Filter non-printing characters.
      008A37 8A 2B                 1941         .word      LINK
                           0009B9  1942 LINK = . 
      008A39 05                    1943         .byte      5
      008A3A 3E 43 48 41 52        1944         .ascii     ">CHAR"
      008A3F                       1945 TCHAR:
      008A3F E6 01            [ 1] 1946         ld a,(1,x)
      008A41 A1 20            [ 1] 1947         cp a,#32  
      008A43 2B 05            [ 1] 1948         jrmi 1$ 
      008A45 A1 7F            [ 1] 1949         cp a,#127 
      008A47 2A 01            [ 1] 1950         jrpl 1$ 
      008A49 81               [ 4] 1951         ret 
      008A4A A6 5F            [ 1] 1952 1$:     ld a,#'_ 
      008A4C E7 01            [ 1] 1953         ld (1,x),a 
      008A4E 81               [ 4] 1954         ret 
                                   1955 
                                   1956 ;       DEPTH   ( -- n )
                                   1957 ;       Return  depth of  data stack.
      008A4F 8A 39                 1958         .word      LINK
                           0009D1  1959 LINK = . 
      008A51 05                    1960         .byte      5
      008A52 44 45 50 54 48        1961         .ascii     "DEPTH"
      008A57                       1962 DEPTH: 
      008A57 90 BE 24         [ 2] 1963         LDW Y,SP0    ;save data stack ptr
      008A5A BF 1C            [ 2] 1964 	LDW XTEMP,X
      008A5C 72 B2 00 1C      [ 2] 1965         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008A60 90 57            [ 2] 1966         SRAW Y    ;Y = #stack items
      008A62 1D 00 02         [ 2] 1967 	SUBW X,#2
      008A65 FF               [ 2] 1968         LDW (X),Y     ; if neg, underflow
      008A66 81               [ 4] 1969         RET
                                   1970 
                                   1971 ;       PICK    ( ... +n -- ... w )
                                   1972 ;       Copy  nth stack item to tos.
      008A67 8A 51                 1973         .word      LINK
                           0009E9  1974 LINK = . 
      008A69 04                    1975         .byte      4
      008A6A 50 49 43 4B           1976         .ascii     "PICK"
      008A6E                       1977 PICK:
      008A6E 90 93            [ 1] 1978         LDW Y,X   ;D = n1
      008A70 90 FE            [ 2] 1979         LDW Y,(Y)
                                   1980 ; modified for standard compliance          
                                   1981 ; 0 PICK must be equivalent to DUP 
      008A72 90 5C            [ 2] 1982         INCW Y 
      008A74 90 58            [ 2] 1983         SLAW Y
      008A76 BF 1C            [ 2] 1984         LDW XTEMP,X
      008A78 72 B9 00 1C      [ 2] 1985         ADDW Y,XTEMP
      008A7C 90 FE            [ 2] 1986         LDW Y,(Y)
      008A7E FF               [ 2] 1987         LDW (X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008A7F 81               [ 4] 1988         RET
                                   1989 
                                   1990 ;; Memory access
                                   1991 
                                   1992 ;       +!      ( n a -- )
                                   1993 ;       Add n to  contents at address a.
      008A80 8A 69                 1994         .word      LINK
                           000A02  1995 LINK = . 
      008A82 02                    1996         .byte      2
      008A83 2B 21                 1997         .ascii     "+!"
      008A85                       1998 PSTOR:
      008A85 90 93            [ 1] 1999         ldw y,x 
      008A87 90 FE            [ 2] 2000         ldw y,(y)
      008A89 90 BF 1E         [ 2] 2001         ldw YTEMP,y  ; address
      008A8C 90 FE            [ 2] 2002         ldw y,(y)  
      008A8E 90 89            [ 2] 2003         pushw y  ; value at address 
      008A90 90 93            [ 1] 2004         ldw y,x 
      008A92 90 EE 02         [ 2] 2005         ldw y,(2,y) ; n 
      008A95 72 F9 01         [ 2] 2006         addw y,(1,sp) ; n+value
      008A98 91 CF 1E         [ 5] 2007         ldw [YTEMP],y ;  a!
      008A9B 90 85            [ 2] 2008         popw y    ;drop local var
      008A9D 1C 00 04         [ 2] 2009         addw x,#4 ; DDROP 
      008AA0 81               [ 4] 2010         ret 
                                   2011 
                                   2012 ;       2!      ( d a -- )
                                   2013 ;       Store  double integer to address a.
      008AA1 8A 82                 2014         .word      LINK
                           000A23  2015 LINK = . 
      008AA3 02                    2016         .byte      2
      008AA4 32 21                 2017         .ascii     "2!"
      008AA6                       2018 DSTOR:
      008AA6 90 93            [ 1] 2019         ldw y,x 
      008AA8 90 FE            [ 2] 2020         ldw y,(y)
      008AAA 90 BF 1E         [ 2] 2021         ldw YTEMP,y ; address 
      008AAD 1C 00 02         [ 2] 2022         addw x,#CELLL ; drop a 
      008AB0 90 93            [ 1] 2023         ldw y,x 
      008AB2 90 FE            [ 2] 2024         ldw y,(y) ; hi word 
      008AB4 89               [ 2] 2025         pushw x 
      008AB5 EE 02            [ 2] 2026         ldw x,(2,x) ; lo word 
      008AB7 91 CF 1E         [ 5] 2027         ldw [YTEMP],y
      008ABA 90 93            [ 1] 2028         ldw y,x 
      008ABC AE 00 02         [ 2] 2029         ldw x,#2 
      008ABF 92 DF 1E         [ 5] 2030         ldw ([YTEMP],x),y 
      008AC2 85               [ 2] 2031         popw x 
      008AC3 1C 00 04         [ 2] 2032         addw x,#4 ; DDROP 
      008AC6 81               [ 4] 2033         ret 
                                   2034 
                                   2035 ;       2@      ( a -- d )
                                   2036 ;       Fetch double integer from address a.
      008AC7 8A A3                 2037         .word      LINK
                           000A49  2038 LINK = . 
      008AC9 02                    2039         .byte      2
      008ACA 32 40                 2040         .ascii     "2@"
      008ACC                       2041 DAT:
      008ACC 90 93            [ 1] 2042         ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008ACE 90 FE            [ 2] 2043         ldw y,(y) ;address 
      008AD0 90 BF 1E         [ 2] 2044         ldw YTEMP,y 
      008AD3 1D 00 02         [ 2] 2045         subw x,#CELLL ; space for udh 
      008AD6 91 CE 1E         [ 5] 2046         ldw y,[YTEMP] ; udh 
      008AD9 FF               [ 2] 2047         ldw (x),y 
      008ADA 90 AE 00 02      [ 2] 2048         ldw y,#2
      008ADE 91 DE 1E         [ 5] 2049         ldw y,([YTEMP],y) ; udl 
      008AE1 EF 02            [ 2] 2050         ldw (2,x),y
      008AE3 81               [ 4] 2051         ret 
                                   2052 
                                   2053 ;       COUNT   ( b -- b +n )
                                   2054 ;       Return count byte of a string
                                   2055 ;       and add 1 to byte address.
      008AE4 8A C9                 2056         .word      LINK
                           000A66  2057 LINK = . 
      008AE6 05                    2058         .byte      5
      008AE7 43 4F 55 4E 54        2059         .ascii     "COUNT"
      008AEC                       2060 COUNT:
      008AEC 90 93            [ 1] 2061         ldw y,x 
      008AEE 90 FE            [ 2] 2062         ldw y,(y) ; address 
      008AF0 90 F6            [ 1] 2063         ld a,(y)  ; count 
      008AF2 90 5C            [ 2] 2064         incw y 
      008AF4 FF               [ 2] 2065         ldw (x),y 
      008AF5 1D 00 02         [ 2] 2066         subw x,#CELLL 
      008AF8 E7 01            [ 1] 2067         ld (1,x),a 
      008AFA 7F               [ 1] 2068         clr (x)
      008AFB 81               [ 4] 2069         ret 
                                   2070 
                                   2071 ;       HERE    ( -- a )
                                   2072 ;       Return  top of  variables
      008AFC 8A E6                 2073         .word      LINK
                           000A7E  2074 LINK = . 
      008AFE 04                    2075         .byte      4
      008AFF 48 45 52 45           2076         .ascii     "HERE"
      008B03                       2077 HERE:
      008B03 90 AE 00 16      [ 2] 2078       	ldw y,#UVP 
      008B07 90 FE            [ 2] 2079         ldw y,(y)
      008B09 1D 00 02         [ 2] 2080         subw x,#CELLL 
      008B0C FF               [ 2] 2081         ldw (x),y 
      008B0D 81               [ 4] 2082         ret 
                                   2083 
                                   2084 ;       PAD     ( -- a )
                                   2085 ;       Return address of text buffer
                                   2086 ;       above  code dictionary.
      008B0E 8A FE                 2087         .word      LINK
                           000A90  2088 LINK = . 
      008B10 03                    2089         .byte      3
      008B11 50 41 44              2090         .ascii     "PAD"
      008B14                       2091 PAD:
      008B14 CD 8B 03         [ 4] 2092         CALL     HERE
      008B17 CD 83 DF         [ 4] 2093         CALL     DOLIT
      008B1A 00 50                 2094         .word      80
      008B1C CC 86 AF         [ 2] 2095         JP     PLUS
                                   2096 
                                   2097 ;       TIB     ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2098 ;       Return address of terminal input buffer.
      008B1F 8B 10                 2099         .word      LINK
                           000AA1  2100 LINK = . 
      008B21 03                    2101         .byte      3
      008B22 54 49 42              2102         .ascii     "TIB"
      008B25                       2103 TIB:
      008B25 CD 85 EF         [ 4] 2104         CALL     NTIB
      008B28 CD 89 7E         [ 4] 2105         CALL     CELLP
      008B2B CC 84 5D         [ 2] 2106         JP     AT
                                   2107 
                                   2108 ;       @EXECUTE        ( a -- )
                                   2109 ;       Execute vector stored in address a.
      008B2E 8B 21                 2110         .word      LINK
                           000AB0  2111 LINK = . 
      008B30 08                    2112         .byte      8
      008B31 40 45 58 45 43 55 54  2113         .ascii     "@EXECUTE"
             45
      008B39                       2114 ATEXE:
      008B39 CD 84 5D         [ 4] 2115         CALL     AT
      008B3C CD 86 5E         [ 4] 2116         CALL     QDUP    ;?address or zero
      008B3F CD 84 12         [ 4] 2117         CALL     QBRAN
      008B42 8B 47                 2118         .word      EXE1
      008B44 CD 84 39         [ 4] 2119         CALL     EXECU   ;execute if non-zero
      008B47 81               [ 4] 2120 EXE1:   RET     ;do nothing if zero
                                   2121 
                                   2122 ;       CMOVE   ( b1 b2 u -- )
                                   2123 ;       Copy u bytes from b1 to b2.
      008B48 8B 30                 2124         .word      LINK
                           000ACA  2125 LINK = . 
      008B4A 05                    2126         .byte      5
      008B4B 43 4D 4F 56 45        2127         .ascii     "CMOVE"
      008B50                       2128 CMOVE:
      008B50 CD 84 CD         [ 4] 2129         CALL	TOR
      008B53 CD 84 29         [ 4] 2130         CALL	BRAN
      008B56 8B 70                 2131         .word	CMOV2
      008B58 CD 84 CD         [ 4] 2132 CMOV1:	CALL	TOR
      008B5B CD 85 04         [ 4] 2133         CALL	DUPP
      008B5E CD 84 7B         [ 4] 2134         CALL	CAT
      008B61 CD 84 C1         [ 4] 2135         CALL	RAT
      008B64 CD 84 6A         [ 4] 2136         CALL	CSTOR
      008B67 CD 89 A9         [ 4] 2137         CALL	ONEP
      008B6A CD 84 AE         [ 4] 2138         CALL	RFROM
      008B6D CD 89 A9         [ 4] 2139         CALL	ONEP
      008B70 CD 83 F3         [ 4] 2140 CMOV2:	CALL	DONXT
      008B73 8B 58                 2141         .word	CMOV1
      008B75 CC 86 8F         [ 2] 2142         JP	DDROP
                                   2143 
                                   2144 ;       FILL    ( b u c -- )
                                   2145 ;       Fill u bytes of character c
                                   2146 ;       to area beginning at b.
      008B78 8B 4A                 2147         .word       LINK
                           000AFA  2148 LINK = . 
      008B7A 04                    2149         .byte       4
      008B7B 46 49 4C 4C           2150         .ascii     "FILL"
      008B7F                       2151 FILL:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008B7F 90 93            [ 1] 2152         ldw y,x 
      008B81 90 E6 01         [ 1] 2153         ld a,(1,y) ; c 
      008B84 1C 00 02         [ 2] 2154         addw x,#CELLL ; drop c 
      008B87 90 93            [ 1] 2155         ldw y,x 
      008B89 90 FE            [ 2] 2156         ldw y,(y) ; count
      008B8B 90 89            [ 2] 2157         pushw y 
      008B8D 1C 00 02         [ 2] 2158         addw x,#CELLL ; drop u 
      008B90 90 93            [ 1] 2159         ldw y,x 
      008B92 1C 00 02         [ 2] 2160         addw x,#CELLL ; drop b 
      008B95 90 FE            [ 2] 2161         ldw y,(y) ; address
      008B97 90 BF 1E         [ 2] 2162         ldw YTEMP,y
      008B9A 90 85            [ 2] 2163         popw y ; count 
      008B9C                       2164 FILL1:  
      008B9C 92 C7 1E         [ 4] 2165         ld [YTEMP],a 
      008B9F 3C 1F            [ 1] 2166         inc YTEMP+1
      008BA1 24 02            [ 1] 2167         jrnc FILL2 
      008BA3 3C 1E            [ 1] 2168         inc YTEMP
      008BA5                       2169 FILL2: 
      008BA5 90 5A            [ 2] 2170         decw y ; count 
      008BA7 26 F3            [ 1] 2171         jrne FILL1  
      008BA9 81               [ 4] 2172         ret 
                                   2173 
                                   2174 ;       ERASE   ( b u -- )
                                   2175 ;       Erase u bytes beginning at b.
      008BAA 8B 7A                 2176         .word      LINK
                           000B2C  2177 LINK = . 
      008BAC 05                    2178         .byte      5
      008BAD 45 52 41 53 45        2179         .ascii     "ERASE"
      008BB2                       2180 ERASE:
      008BB2 90 5F            [ 1] 2181         clrw y 
      008BB4 1D 00 02         [ 2] 2182         subw x,#CELLL 
      008BB7 FF               [ 2] 2183         ldw (x),y 
      008BB8 CC 8B 7F         [ 2] 2184         jp FILL 
                                   2185 
                                   2186 
                                   2187 ;       PACK0   ( b u a -- a )
                                   2188 ;       Build a counted string with
                                   2189 ;       u characters from b. Null fill.
      008BBB 8B AC                 2190         .word      LINK
                           000B3D  2191 LINK = . 
      008BBD 05                    2192         .byte      5
      008BBE 50 41 43 4B 30        2193         .ascii     "PACK0"
      008BC3                       2194 PACKS:
      008BC3 CD 85 04         [ 4] 2195         CALL     DUPP
      008BC6 CD 84 CD         [ 4] 2196         CALL     TOR     ;strings only on cell boundary
      008BC9 CD 86 9A         [ 4] 2197         CALL     DDUP
      008BCC CD 84 6A         [ 4] 2198         CALL     CSTOR
      008BCF CD 89 A9         [ 4] 2199         CALL     ONEP ;save count
      008BD2 CD 85 14         [ 4] 2200         CALL     SWAPP
      008BD5 CD 8B 50         [ 4] 2201         CALL     CMOVE
      008BD8 CD 84 AE         [ 4] 2202         CALL     RFROM
      008BDB 81               [ 4] 2203         RET
                                   2204 
                                   2205 ;; Numeric output, single precision
                                   2206 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2207 ;       DIGIT   ( u -- c )
                                   2208 ;       Convert digit u to a character.
      008BDC 8B BD                 2209         .word      LINK
                           000B5E  2210 LINK = . 
      008BDE 05                    2211         .byte      5
      008BDF 44 49 47 49 54        2212         .ascii     "DIGIT"
      008BE4                       2213 DIGIT:
      008BE4 CD 83 DF         [ 4] 2214         CALL	DOLIT
      008BE7 00 09                 2215         .word	9
      008BE9 CD 85 2E         [ 4] 2216         CALL	OVER
      008BEC CD 87 8D         [ 4] 2217         CALL	LESS
      008BEF CD 83 DF         [ 4] 2218         CALL	DOLIT
      008BF2 00 07                 2219         .word	7
      008BF4 CD 85 50         [ 4] 2220         CALL	ANDD
      008BF7 CD 86 AF         [ 4] 2221         CALL	PLUS
      008BFA CD 83 DF         [ 4] 2222         CALL	DOLIT
      008BFD 00 30                 2223         .word	48	;'0'
      008BFF CC 86 AF         [ 2] 2224         JP	PLUS
                                   2225 
                                   2226 ;       EXTRACT ( n base -- n c )
                                   2227 ;       Extract least significant digit from n.
      008C02 8B DE                 2228         .word      LINK
                           000B84  2229 LINK = . 
      008C04 07                    2230         .byte      7
      008C05 45 58 54 52 41 43 54  2231         .ascii     "EXTRACT"
      008C0C                       2232 EXTRC:
      008C0C CD 8A 15         [ 4] 2233         CALL     ZERO
      008C0F CD 85 14         [ 4] 2234         CALL     SWAPP
      008C12 CD 88 05         [ 4] 2235         CALL     UMMOD
      008C15 CD 85 14         [ 4] 2236         CALL     SWAPP
      008C18 CC 8B E4         [ 2] 2237         JP     DIGIT
                                   2238 
                                   2239 ;       <#      ( -- )
                                   2240 ;       Initiate  numeric output process.
      008C1B 8C 04                 2241         .word      LINK
                           000B9D  2242 LINK = . 
      008C1D 02                    2243         .byte      2
      008C1E 3C 23                 2244         .ascii     "<#"
      008C20                       2245 BDIGS:
      008C20 CD 8B 14         [ 4] 2246         CALL     PAD
      008C23 CD 86 0F         [ 4] 2247         CALL     HLD
      008C26 CC 84 46         [ 2] 2248         JP     STORE
                                   2249 
                                   2250 ;       HOLD    ( c -- )
                                   2251 ;       Insert a character into output string.
      008C29 8C 1D                 2252         .word      LINK
                           000BAB  2253 LINK = . 
      008C2B 04                    2254         .byte      4
      008C2C 48 4F 4C 44           2255         .ascii     "HOLD"
      008C30                       2256 HOLD:
      008C30 CD 86 0F         [ 4] 2257         CALL     HLD
      008C33 CD 84 5D         [ 4] 2258         CALL     AT
      008C36 CD 89 B6         [ 4] 2259         CALL     ONEM
      008C39 CD 85 04         [ 4] 2260         CALL     DUPP
      008C3C CD 86 0F         [ 4] 2261         CALL     HLD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008C3F CD 84 46         [ 4] 2262         CALL     STORE
      008C42 CC 84 6A         [ 2] 2263         JP     CSTOR
                                   2264 
                                   2265 ;       #       ( u -- u )
                                   2266 ;       Extract one digit from u and
                                   2267 ;       append digit to output string.
      008C45 8C 2B                 2268         .word      LINK
                           000BC7  2269 LINK = . 
      008C47 01                    2270         .byte      1
      008C48 23                    2271         .ascii     "#"
      008C49                       2272 DIG:
      008C49 CD 85 C1         [ 4] 2273         CALL     BASE
      008C4C CD 84 5D         [ 4] 2274         CALL     AT
      008C4F CD 8C 0C         [ 4] 2275         CALL     EXTRC
      008C52 CC 8C 30         [ 2] 2276         JP     HOLD
                                   2277 
                                   2278 ;       #S      ( u -- 0 )
                                   2279 ;       Convert u until all digits
                                   2280 ;       are added to output string.
      008C55 8C 47                 2281         .word      LINK
                           000BD7  2282 LINK = . 
      008C57 02                    2283         .byte      2
      008C58 23 53                 2284         .ascii     "#S"
      008C5A                       2285 DIGS:
      008C5A CD 8C 49         [ 4] 2286 DIGS1:  CALL     DIG
      008C5D CD 85 04         [ 4] 2287         CALL     DUPP
      008C60 CD 84 12         [ 4] 2288         CALL     QBRAN
      008C63 8C 67                 2289         .word      DIGS2
      008C65 20 F3            [ 2] 2290         JRA     DIGS1
      008C67 81               [ 4] 2291 DIGS2:  RET
                                   2292 
                                   2293 ;       SIGN    ( n -- )
                                   2294 ;       Add a minus sign to
                                   2295 ;       numeric output string.
      008C68 8C 57                 2296         .word      LINK
                           000BEA  2297 LINK = . 
      008C6A 04                    2298         .byte      4
      008C6B 53 49 47 4E           2299         .ascii     "SIGN"
      008C6F                       2300 SIGN:
      008C6F CD 85 3D         [ 4] 2301         CALL     ZLESS
      008C72 CD 84 12         [ 4] 2302         CALL     QBRAN
      008C75 8C 7F                 2303         .word      SIGN1
      008C77 CD 83 DF         [ 4] 2304         CALL     DOLIT
      008C7A 00 2D                 2305         .word      45	;"-"
      008C7C CC 8C 30         [ 2] 2306         JP     HOLD
      008C7F 81               [ 4] 2307 SIGN1:  RET
                                   2308 
                                   2309 ;       #>      ( w -- b u )
                                   2310 ;       Prepare output string.
      008C80 8C 6A                 2311         .word      LINK
                           000C02  2312 LINK = . 
      008C82 02                    2313         .byte      2
      008C83 23 3E                 2314         .ascii     "#>"
      008C85                       2315 EDIGS:
      008C85 CD 84 FA         [ 4] 2316         CALL     DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008C88 CD 86 0F         [ 4] 2317         CALL     HLD
      008C8B CD 84 5D         [ 4] 2318         CALL     AT
      008C8E CD 8B 14         [ 4] 2319         CALL     PAD
      008C91 CD 85 2E         [ 4] 2320         CALL     OVER
      008C94 CC 87 28         [ 2] 2321         JP     SUBB
                                   2322 
                                   2323 ;       str     ( w -- b u )
                                   2324 ;       Convert a signed integer
                                   2325 ;       to a numeric string.
      008C97 8C 82                 2326         .word      LINK
                           000C19  2327 LINK = . 
      008C99 03                    2328         .byte      3
      008C9A 53 54 52              2329         .ascii     "STR"
      008C9D                       2330 STR:
      008C9D CD 85 04         [ 4] 2331         CALL     DUPP
      008CA0 CD 84 CD         [ 4] 2332         CALL     TOR
      008CA3 CD 87 42         [ 4] 2333         CALL     ABSS
      008CA6 CD 8C 20         [ 4] 2334         CALL     BDIGS
      008CA9 CD 8C 5A         [ 4] 2335         CALL     DIGS
      008CAC CD 84 AE         [ 4] 2336         CALL     RFROM
      008CAF CD 8C 6F         [ 4] 2337         CALL     SIGN
      008CB2 CC 8C 85         [ 2] 2338         JP     EDIGS
                                   2339 
                                   2340 ;       HEX     ( -- )
                                   2341 ;       Use radix 16 as base for
                                   2342 ;       numeric conversions.
      008CB5 8C 99                 2343         .word      LINK
                           000C37  2344 LINK = . 
      008CB7 03                    2345         .byte      3
      008CB8 48 45 58              2346         .ascii     "HEX"
      008CBB                       2347 HEX:
      008CBB CD 83 DF         [ 4] 2348         CALL     DOLIT
      008CBE 00 10                 2349         .word      16
      008CC0 CD 85 C1         [ 4] 2350         CALL     BASE
      008CC3 CC 84 46         [ 2] 2351         JP     STORE
                                   2352 
                                   2353 ;       DECIMAL ( -- )
                                   2354 ;       Use radix 10 as base
                                   2355 ;       for numeric conversions.
      008CC6 8C B7                 2356         .word      LINK
                           000C48  2357 LINK = . 
      008CC8 07                    2358         .byte      7
      008CC9 44 45 43 49 4D 41 4C  2359         .ascii     "DECIMAL"
      008CD0                       2360 DECIM:
      008CD0 CD 83 DF         [ 4] 2361         CALL     DOLIT
      008CD3 00 0A                 2362         .word      10
      008CD5 CD 85 C1         [ 4] 2363         CALL     BASE
      008CD8 CC 84 46         [ 2] 2364         JP     STORE
                                   2365 
                                   2366 ;; Numeric input, single precision
                                   2367 
                                   2368 ;       DIGIT?  ( c base -- u t )
                                   2369 ;       Convert a character to its numeric
                                   2370 ;       value. A flag indicates success.
      008CDB 8C C8                 2371         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                           000C5D  2372 LINK = . 
      008CDD 06                    2373         .byte       6
      008CDE 44 49 47 49 54 3F     2374         .ascii     "DIGIT?"
      008CE4                       2375 DIGTQ:
      008CE4 CD 84 CD         [ 4] 2376         CALL     TOR
      008CE7 CD 83 DF         [ 4] 2377         CALL     DOLIT
      008CEA 00 30                 2378         .word     48	; "0"
      008CEC CD 87 28         [ 4] 2379         CALL     SUBB
      008CEF CD 83 DF         [ 4] 2380         CALL     DOLIT
      008CF2 00 09                 2381         .word      9
      008CF4 CD 85 2E         [ 4] 2382         CALL     OVER
      008CF7 CD 87 8D         [ 4] 2383         CALL     LESS
      008CFA CD 84 12         [ 4] 2384         CALL     QBRAN
      008CFD 8D 15                 2385         .word      DGTQ1
      008CFF CD 83 DF         [ 4] 2386         CALL     DOLIT
      008D02 00 07                 2387         .word      7
      008D04 CD 87 28         [ 4] 2388         CALL     SUBB
      008D07 CD 85 04         [ 4] 2389         CALL     DUPP
      008D0A CD 83 DF         [ 4] 2390         CALL     DOLIT
      008D0D 00 0A                 2391         .word      10
      008D0F CD 87 8D         [ 4] 2392         CALL     LESS
      008D12 CD 85 64         [ 4] 2393         CALL     ORR
      008D15 CD 85 04         [ 4] 2394 DGTQ1:  CALL     DUPP
      008D18 CD 84 AE         [ 4] 2395         CALL     RFROM
      008D1B CC 87 6F         [ 2] 2396         JP     ULESS
                                   2397 
                                   2398 ;       NUMBER? ( a -- n T | a F )
                                   2399 ;       Convert a number string to
                                   2400 ;       integer. Push a flag on tos.
      008D1E 8C DD                 2401         .word      LINK
                           000CA0  2402 LINK = . 
      008D20 07                    2403         .byte      7
      008D21 4E 55 4D 42 45 52 3F  2404         .ascii     "NUMBER?"
      008D28                       2405 NUMBQ:
      008D28 CD 85 C1         [ 4] 2406         CALL     BASE
      008D2B CD 84 5D         [ 4] 2407         CALL     AT
      008D2E CD 84 CD         [ 4] 2408         CALL     TOR
      008D31 CD 8A 15         [ 4] 2409         CALL     ZERO
      008D34 CD 85 2E         [ 4] 2410         CALL     OVER
      008D37 CD 8A EC         [ 4] 2411         CALL     COUNT
      008D3A CD 85 2E         [ 4] 2412         CALL     OVER
      008D3D CD 84 7B         [ 4] 2413         CALL     CAT
      008D40 CD 83 DF         [ 4] 2414         CALL     DOLIT
      008D43 00 24                 2415         .word     36	; "0x"
      008D45 CD 87 50         [ 4] 2416         CALL     EQUAL
      008D48 CD 84 12         [ 4] 2417         CALL     QBRAN
      008D4B 8D 5C                 2418         .word      NUMQ1
      008D4D CD 8C BB         [ 4] 2419         CALL     HEX
      008D50 CD 85 14         [ 4] 2420         CALL     SWAPP
      008D53 CD 89 A9         [ 4] 2421         CALL     ONEP
      008D56 CD 85 14         [ 4] 2422         CALL     SWAPP
      008D59 CD 89 B6         [ 4] 2423         CALL     ONEM
      008D5C CD 85 2E         [ 4] 2424 NUMQ1:  CALL     OVER
      008D5F CD 84 7B         [ 4] 2425         CALL     CAT
      008D62 CD 83 DF         [ 4] 2426         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008D65 00 2D                 2427         .word     45	; "-"
      008D67 CD 87 50         [ 4] 2428         CALL     EQUAL
      008D6A CD 84 CD         [ 4] 2429         CALL     TOR
      008D6D CD 85 14         [ 4] 2430         CALL     SWAPP
      008D70 CD 84 C1         [ 4] 2431         CALL     RAT
      008D73 CD 87 28         [ 4] 2432         CALL     SUBB
      008D76 CD 85 14         [ 4] 2433         CALL     SWAPP
      008D79 CD 84 C1         [ 4] 2434         CALL     RAT
      008D7C CD 86 AF         [ 4] 2435         CALL     PLUS
      008D7F CD 86 5E         [ 4] 2436         CALL     QDUP
      008D82 CD 84 12         [ 4] 2437         CALL     QBRAN
      008D85 8D E6                 2438         .word      NUMQ6
      008D87 CD 89 B6         [ 4] 2439         CALL     ONEM
      008D8A CD 84 CD         [ 4] 2440         CALL     TOR
      008D8D CD 85 04         [ 4] 2441 NUMQ2:  CALL     DUPP
      008D90 CD 84 CD         [ 4] 2442         CALL     TOR
      008D93 CD 84 7B         [ 4] 2443         CALL     CAT
      008D96 CD 85 C1         [ 4] 2444         CALL     BASE
      008D99 CD 84 5D         [ 4] 2445         CALL     AT
      008D9C CD 8C E4         [ 4] 2446         CALL     DIGTQ
      008D9F CD 84 12         [ 4] 2447         CALL     QBRAN
      008DA2 8D D4                 2448         .word      NUMQ4
      008DA4 CD 85 14         [ 4] 2449         CALL     SWAPP
      008DA7 CD 85 C1         [ 4] 2450         CALL     BASE
      008DAA CD 84 5D         [ 4] 2451         CALL     AT
      008DAD CD 89 28         [ 4] 2452         CALL     STAR
      008DB0 CD 86 AF         [ 4] 2453         CALL     PLUS
      008DB3 CD 84 AE         [ 4] 2454         CALL     RFROM
      008DB6 CD 89 A9         [ 4] 2455         CALL     ONEP
      008DB9 CD 83 F3         [ 4] 2456         CALL     DONXT
      008DBC 8D 8D                 2457         .word      NUMQ2
      008DBE CD 84 C1         [ 4] 2458         CALL     RAT
      008DC1 CD 85 14         [ 4] 2459         CALL     SWAPP
      008DC4 CD 84 FA         [ 4] 2460         CALL     DROP
      008DC7 CD 84 12         [ 4] 2461         CALL     QBRAN
      008DCA 8D CF                 2462         .word      NUMQ3
      008DCC CD 86 DA         [ 4] 2463         CALL     NEGAT
      008DCF CD 85 14         [ 4] 2464 NUMQ3:  CALL     SWAPP
      008DD2 20 0F            [ 2] 2465         JRA     NUMQ5
      008DD4 CD 84 AE         [ 4] 2466 NUMQ4:  CALL     RFROM
      008DD7 CD 84 AE         [ 4] 2467         CALL     RFROM
      008DDA CD 86 8F         [ 4] 2468         CALL     DDROP
      008DDD CD 86 8F         [ 4] 2469         CALL     DDROP
      008DE0 CD 8A 15         [ 4] 2470         CALL     ZERO
      008DE3 CD 85 04         [ 4] 2471 NUMQ5:  CALL     DUPP
      008DE6 CD 84 AE         [ 4] 2472 NUMQ6:  CALL     RFROM
      008DE9 CD 86 8F         [ 4] 2473         CALL     DDROP
      008DEC CD 84 AE         [ 4] 2474         CALL     RFROM
      008DEF CD 85 C1         [ 4] 2475         CALL     BASE
      008DF2 CC 84 46         [ 2] 2476         JP     STORE
                                   2477 
                                   2478 ;; Basic I/O
                                   2479 
                                   2480 ;       KEY     ( -- c )
                                   2481 ;       Wait for and return an
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



                                   2482 ;       input character.
      008DF5 8D 20                 2483         .word      LINK
                           000D77  2484 LINK = . 
      008DF7 03                    2485         .byte      3
      008DF8 4B 45 59              2486         .ascii     "KEY"
      008DFB                       2487 KEY:
      008DFB 72 0B 52 40 FB   [ 2] 2488         btjf UART2_SR,#UART_SR_RXNE,. 
      008E00 C6 52 41         [ 1] 2489         ld a,UART2_DR 
      008E03 1D 00 02         [ 2] 2490         subw x,#CELLL 
      008E06 E7 01            [ 1] 2491         ld (1,x),a 
      008E08 7F               [ 1] 2492         clr (x)
      008E09 81               [ 4] 2493         ret 
                                   2494 
                                   2495 ;       NUF?    ( -- t )
                                   2496 ;       Return false if no input,
                                   2497 ;       else pause and if CR return true.
      008E0A 8D F7                 2498         .word      LINK
                           000D8C  2499 LINK = . 
      008E0C 04                    2500         .byte      4
      008E0D 4E 55 46 3F           2501         .ascii     "NUF?"
      008E11                       2502 NUFQ:
      008E11 CD 83 AB         [ 4] 2503         CALL     QKEY
      008E14 CD 85 04         [ 4] 2504         CALL     DUPP
      008E17 CD 84 12         [ 4] 2505         CALL     QBRAN
      008E1A 8E 2A                 2506         .word    NUFQ1
      008E1C CD 86 8F         [ 4] 2507         CALL     DDROP
      008E1F CD 8D FB         [ 4] 2508         CALL     KEY
      008E22 CD 83 DF         [ 4] 2509         CALL     DOLIT
      008E25 00 0D                 2510         .word      CRR
      008E27 CC 87 50         [ 2] 2511         JP     EQUAL
      008E2A 81               [ 4] 2512 NUFQ1:  RET
                                   2513 
                                   2514 ;       SPACE   ( -- )
                                   2515 ;       Send  blank character to
                                   2516 ;       output device.
      008E2B 8E 0C                 2517         .word      LINK
                           000DAD  2518 LINK = . 
      008E2D 05                    2519         .byte      5
      008E2E 53 50 41 43 45        2520         .ascii     "SPACE"
      008E33                       2521 SPACE:
      008E33 CD 8A 08         [ 4] 2522         CALL     BLANK
      008E36 CC 83 C9         [ 2] 2523         JP     EMIT
                                   2524 
                                   2525 ;       SPACES  ( +n -- )
                                   2526 ;       Send n spaces to output device.
      008E39 8E 2D                 2527         .word      LINK
                           000DBB  2528 LINK = . 
      008E3B 06                    2529         .byte      6
      008E3C 53 50 41 43 45 53     2530         .ascii     "SPACES"
      008E42                       2531 SPACS:
      008E42 CD 8A 15         [ 4] 2532         CALL     ZERO
      008E45 CD 87 AD         [ 4] 2533         CALL     MAX
      008E48 CD 84 CD         [ 4] 2534         CALL     TOR
      008E4B 20 03            [ 2] 2535         JRA      CHAR2
      008E4D CD 8E 33         [ 4] 2536 CHAR1:  CALL     SPACE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E50 CD 83 F3         [ 4] 2537 CHAR2:  CALL     DONXT
      008E53 8E 4D                 2538         .word    CHAR1
      008E55 81               [ 4] 2539         RET
                                   2540 
                                   2541 ;       TYPE    ( b u -- )
                                   2542 ;       Output u characters from b.
      008E56 8E 3B                 2543         .word      LINK
                           000DD8  2544 LINK = . 
      008E58 04                    2545         .byte      4
      008E59 54 59 50 45           2546         .ascii     "TYPE"
      008E5D                       2547 TYPES:
      008E5D CD 84 CD         [ 4] 2548         CALL     TOR
      008E60 20 0C            [ 2] 2549         JRA     TYPE2
      008E62 CD 85 04         [ 4] 2550 TYPE1:  CALL     DUPP
      008E65 CD 84 7B         [ 4] 2551         CALL     CAT
      008E68 CD 83 C9         [ 4] 2552         CALL     EMIT
      008E6B CD 89 A9         [ 4] 2553         CALL     ONEP
      008E6E CD 83 F3         [ 4] 2554 TYPE2:  CALL     DONXT
      008E71 8E 62                 2555         .word      TYPE1
      008E73 CC 84 FA         [ 2] 2556         JP     DROP
                                   2557 
                                   2558 ;       CR      ( -- )
                                   2559 ;       Output a carriage return
                                   2560 ;       and a line feed.
      008E76 8E 58                 2561         .word      LINK
                           000DF8  2562 LINK = . 
      008E78 02                    2563         .byte      2
      008E79 43 52                 2564         .ascii     "CR"
      008E7B                       2565 CR:
      008E7B CD 83 DF         [ 4] 2566         CALL     DOLIT
      008E7E 00 0D                 2567         .word      CRR
      008E80 CD 83 C9         [ 4] 2568         CALL     EMIT
      008E83 CD 83 DF         [ 4] 2569         CALL     DOLIT
      008E86 00 0A                 2570         .word      LF
      008E88 CC 83 C9         [ 2] 2571         JP     EMIT
                                   2572 
                                   2573 ;       do$     ( -- a )
                                   2574 ;       Return  address of a compiled
                                   2575 ;       string.
      008E8B 8E 78                 2576         .word      LINK
                           000E0D  2577 LINK = . 
      008E8D 43                    2578 	.byte      COMPO+3
      008E8E 44 4F 24              2579         .ascii     "DO$"
      008E91                       2580 DOSTR:
      008E91 CD 84 AE         [ 4] 2581         CALL     RFROM
      008E94 CD 84 C1         [ 4] 2582         CALL     RAT
      008E97 CD 84 AE         [ 4] 2583         CALL     RFROM
      008E9A CD 8A EC         [ 4] 2584         CALL     COUNT
      008E9D CD 86 AF         [ 4] 2585         CALL     PLUS
      008EA0 CD 84 CD         [ 4] 2586         CALL     TOR
      008EA3 CD 85 14         [ 4] 2587         CALL     SWAPP
      008EA6 CD 84 CD         [ 4] 2588         CALL     TOR
      008EA9 81               [ 4] 2589         RET
                                   2590 
                                   2591 ;       $"|     ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2592 ;       Run time routine compiled by $".
                                   2593 ;       Return address of a compiled string.
      008EAA 8E 8D                 2594         .word      LINK
                           000E2C  2595 LINK = . 
      008EAC 43                    2596 	.byte      COMPO+3
      008EAD 24 22 7C              2597         .byte     '$','"','|'
      008EB0                       2598 STRQP:
      008EB0 CD 8E 91         [ 4] 2599         CALL     DOSTR
      008EB3 81               [ 4] 2600         RET
                                   2601 
                                   2602 ;       ."|     ( -- )
                                   2603 ;       Run time routine of ." .
                                   2604 ;       Output a compiled string.
      008EB4 8E AC                 2605         .word      LINK
                           000E36  2606 LINK = . 
      008EB6 43                    2607 	.byte      COMPO+3
      008EB7 2E 22 7C              2608         .byte     '.','"','|'
      008EBA                       2609 DOTQP:
      008EBA CD 8E 91         [ 4] 2610         CALL     DOSTR
      008EBD CD 8A EC         [ 4] 2611         CALL     COUNT
      008EC0 CC 8E 5D         [ 2] 2612         JP     TYPES
                                   2613 
                                   2614 ;       .R      ( n +n -- )
                                   2615 ;       Display an integer in a field
                                   2616 ;       of n columns, right justified.
      008EC3 8E B6                 2617         .word      LINK
                           000E45  2618 LINK = . 
      008EC5 02                    2619         .byte      2
      008EC6 2E 52                 2620         .ascii     ".R"
      008EC8                       2621 DOTR:
      008EC8 CD 84 CD         [ 4] 2622         CALL     TOR
      008ECB CD 8C 9D         [ 4] 2623         CALL     STR
      008ECE CD 84 AE         [ 4] 2624         CALL     RFROM
      008ED1 CD 85 2E         [ 4] 2625         CALL     OVER
      008ED4 CD 87 28         [ 4] 2626         CALL     SUBB
      008ED7 CD 8E 42         [ 4] 2627         CALL     SPACS
      008EDA CC 8E 5D         [ 2] 2628         JP     TYPES
                                   2629 
                                   2630 ;       U.R     ( u +n -- )
                                   2631 ;       Display an unsigned integer
                                   2632 ;       in n column, right justified.
      008EDD 8E C5                 2633         .word      LINK
                           000E5F  2634 LINK = . 
      008EDF 03                    2635         .byte      3
      008EE0 55 2E 52              2636         .ascii     "U.R"
      008EE3                       2637 UDOTR:
      008EE3 CD 84 CD         [ 4] 2638         CALL     TOR
      008EE6 CD 8C 20         [ 4] 2639         CALL     BDIGS
      008EE9 CD 8C 5A         [ 4] 2640         CALL     DIGS
      008EEC CD 8C 85         [ 4] 2641         CALL     EDIGS
      008EEF CD 84 AE         [ 4] 2642         CALL     RFROM
      008EF2 CD 85 2E         [ 4] 2643         CALL     OVER
      008EF5 CD 87 28         [ 4] 2644         CALL     SUBB
      008EF8 CD 8E 42         [ 4] 2645         CALL     SPACS
      008EFB CC 8E 5D         [ 2] 2646         JP     TYPES
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2647 
                                   2648 ;       U.      ( u -- )
                                   2649 ;       Display an unsigned integer
                                   2650 ;       in free format.
      008EFE 8E DF                 2651         .word      LINK
                           000E80  2652 LINK = . 
      008F00 02                    2653         .byte      2
      008F01 55 2E                 2654         .ascii     "U."
      008F03                       2655 UDOT:
      008F03 CD 8C 20         [ 4] 2656         CALL     BDIGS
      008F06 CD 8C 5A         [ 4] 2657         CALL     DIGS
      008F09 CD 8C 85         [ 4] 2658         CALL     EDIGS
      008F0C CD 8E 33         [ 4] 2659         CALL     SPACE
      008F0F CC 8E 5D         [ 2] 2660         JP     TYPES
                                   2661 
                                   2662 ;       .       ( w -- )
                                   2663 ;       Display an integer in free
                                   2664 ;       format, preceeded by a space.
      008F12 8F 00                 2665         .word      LINK
                           000E94  2666 LINK = . 
      008F14 01                    2667         .byte      1
      008F15 2E                    2668         .ascii     "."
      008F16                       2669 DOT:
      008F16 CD 85 C1         [ 4] 2670         CALL     BASE
      008F19 CD 84 5D         [ 4] 2671         CALL     AT
      008F1C CD 83 DF         [ 4] 2672         CALL     DOLIT
      008F1F 00 0A                 2673         .word      10
      008F21 CD 85 79         [ 4] 2674         CALL     XORR    ;?decimal
      008F24 CD 84 12         [ 4] 2675         CALL     QBRAN
      008F27 8F 2C                 2676         .word      DOT1
      008F29 CC 8F 03         [ 2] 2677         JP     UDOT
      008F2C CD 8C 9D         [ 4] 2678 DOT1:   CALL     STR
      008F2F CD 8E 33         [ 4] 2679         CALL     SPACE
      008F32 CC 8E 5D         [ 2] 2680         JP     TYPES
                                   2681 
                                   2682 ;       ?       ( a -- )
                                   2683 ;       Display contents in memory cell.
      008F35 8F 14                 2684         .word      LINK
                                   2685         
                           000EB7  2686 LINK = . 
      008F37 01                    2687         .byte      1
      008F38 3F                    2688         .ascii     "?"
      008F39                       2689 QUEST:
      008F39 CD 84 5D         [ 4] 2690         CALL     AT
      008F3C CC 8F 16         [ 2] 2691         JP     DOT
                                   2692 
                                   2693 ;; Parsing
                                   2694 
                                   2695 ;       parse   ( b u c -- b u delta ; <string> )
                                   2696 ;       Scan string delimited by c.
                                   2697 ;       Return found string and its offset.
      008F3F 8F 37                 2698         .word      LINK
                           000EC1  2699 LINK = . 
      008F41 05                    2700         .byte      5
      008F42 70 61 72 73 65        2701         .ascii     "parse"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008F47                       2702 PARS:
      008F47 CD 85 D0         [ 4] 2703         CALL     TEMP
      008F4A CD 84 46         [ 4] 2704         CALL     STORE
      008F4D CD 85 2E         [ 4] 2705         CALL     OVER
      008F50 CD 84 CD         [ 4] 2706         CALL     TOR
      008F53 CD 85 04         [ 4] 2707         CALL     DUPP
      008F56 CD 84 12         [ 4] 2708         CALL     QBRAN
      008F59 8F FF                 2709         .word    PARS8
      008F5B CD 89 B6         [ 4] 2710         CALL     ONEM
      008F5E CD 85 D0         [ 4] 2711         CALL     TEMP
      008F61 CD 84 5D         [ 4] 2712         CALL     AT
      008F64 CD 8A 08         [ 4] 2713         CALL     BLANK
      008F67 CD 87 50         [ 4] 2714         CALL     EQUAL
      008F6A CD 84 12         [ 4] 2715         CALL     QBRAN
      008F6D 8F A0                 2716         .word      PARS3
      008F6F CD 84 CD         [ 4] 2717         CALL     TOR
      008F72 CD 8A 08         [ 4] 2718 PARS1:  CALL     BLANK
      008F75 CD 85 2E         [ 4] 2719         CALL     OVER
      008F78 CD 84 7B         [ 4] 2720         CALL     CAT     ;skip leading blanks ONLY
      008F7B CD 87 28         [ 4] 2721         CALL     SUBB
      008F7E CD 85 3D         [ 4] 2722         CALL     ZLESS
      008F81 CD 86 C9         [ 4] 2723         CALL     INVER
      008F84 CD 84 12         [ 4] 2724         CALL     QBRAN
      008F87 8F 9D                 2725         .word      PARS2
      008F89 CD 89 A9         [ 4] 2726         CALL     ONEP
      008F8C CD 83 F3         [ 4] 2727         CALL     DONXT
      008F8F 8F 72                 2728         .word      PARS1
      008F91 CD 84 AE         [ 4] 2729         CALL     RFROM
      008F94 CD 84 FA         [ 4] 2730         CALL     DROP
      008F97 CD 8A 15         [ 4] 2731         CALL     ZERO
      008F9A CC 85 04         [ 2] 2732         JP     DUPP
      008F9D CD 84 AE         [ 4] 2733 PARS2:  CALL     RFROM
      008FA0 CD 85 2E         [ 4] 2734 PARS3:  CALL     OVER
      008FA3 CD 85 14         [ 4] 2735         CALL     SWAPP
      008FA6 CD 84 CD         [ 4] 2736         CALL     TOR
      008FA9 CD 85 D0         [ 4] 2737 PARS4:  CALL     TEMP
      008FAC CD 84 5D         [ 4] 2738         CALL     AT
      008FAF CD 85 2E         [ 4] 2739         CALL     OVER
      008FB2 CD 84 7B         [ 4] 2740         CALL     CAT
      008FB5 CD 87 28         [ 4] 2741         CALL     SUBB    ;scan for delimiter
      008FB8 CD 85 D0         [ 4] 2742         CALL     TEMP
      008FBB CD 84 5D         [ 4] 2743         CALL     AT
      008FBE CD 8A 08         [ 4] 2744         CALL     BLANK
      008FC1 CD 87 50         [ 4] 2745         CALL     EQUAL
      008FC4 CD 84 12         [ 4] 2746         CALL     QBRAN
      008FC7 8F CC                 2747         .word      PARS5
      008FC9 CD 85 3D         [ 4] 2748         CALL     ZLESS
      008FCC CD 84 12         [ 4] 2749 PARS5:  CALL     QBRAN
      008FCF 8F E1                 2750         .word      PARS6
      008FD1 CD 89 A9         [ 4] 2751         CALL     ONEP
      008FD4 CD 83 F3         [ 4] 2752         CALL     DONXT
      008FD7 8F A9                 2753         .word      PARS4
      008FD9 CD 85 04         [ 4] 2754         CALL     DUPP
      008FDC CD 84 CD         [ 4] 2755         CALL     TOR
      008FDF 20 0F            [ 2] 2756         JRA     PARS7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008FE1 CD 84 AE         [ 4] 2757 PARS6:  CALL     RFROM
      008FE4 CD 84 FA         [ 4] 2758         CALL     DROP
      008FE7 CD 85 04         [ 4] 2759         CALL     DUPP
      008FEA CD 89 A9         [ 4] 2760         CALL     ONEP
      008FED CD 84 CD         [ 4] 2761         CALL     TOR
      008FF0 CD 85 2E         [ 4] 2762 PARS7:  CALL     OVER
      008FF3 CD 87 28         [ 4] 2763         CALL     SUBB
      008FF6 CD 84 AE         [ 4] 2764         CALL     RFROM
      008FF9 CD 84 AE         [ 4] 2765         CALL     RFROM
      008FFC CC 87 28         [ 2] 2766         JP     SUBB
      008FFF CD 85 2E         [ 4] 2767 PARS8:  CALL     OVER
      009002 CD 84 AE         [ 4] 2768         CALL     RFROM
      009005 CC 87 28         [ 2] 2769         JP     SUBB
                                   2770 
                                   2771 ;       PARSE   ( c -- b u ; <string> )
                                   2772 ;       Scan input stream and return
                                   2773 ;       counted string delimited by c.
      009008 8F 41                 2774         .word      LINK
                           000F8A  2775 LINK = . 
      00900A 05                    2776         .byte      5
      00900B 50 41 52 53 45        2777         .ascii     "PARSE"
      009010                       2778 PARSE:
      009010 CD 84 CD         [ 4] 2779         CALL     TOR
      009013 CD 8B 25         [ 4] 2780         CALL     TIB
      009016 CD 85 DF         [ 4] 2781         CALL     INN
      009019 CD 84 5D         [ 4] 2782         CALL     AT
      00901C CD 86 AF         [ 4] 2783         CALL     PLUS    ;current input buffer pointer
      00901F CD 85 EF         [ 4] 2784         CALL     NTIB
      009022 CD 84 5D         [ 4] 2785         CALL     AT
      009025 CD 85 DF         [ 4] 2786         CALL     INN
      009028 CD 84 5D         [ 4] 2787         CALL     AT
      00902B CD 87 28         [ 4] 2788         CALL     SUBB    ;remaining count
      00902E CD 84 AE         [ 4] 2789         CALL     RFROM
      009031 CD 8F 47         [ 4] 2790         CALL     PARS
      009034 CD 85 DF         [ 4] 2791         CALL     INN
      009037 CC 8A 85         [ 2] 2792         JP     PSTOR
                                   2793 
                                   2794 ;       .(      ( -- )
                                   2795 ;       Output following string up to next ) .
      00903A 90 0A                 2796         .word      LINK
                           000FBC  2797 LINK = . 
      00903C 82                    2798 	.byte      IMEDD+2
      00903D 2E 28                 2799         .ascii     ".("
      00903F                       2800 DOTPR:
      00903F CD 83 DF         [ 4] 2801         CALL     DOLIT
      009042 00 29                 2802         .word     41	; ")"
      009044 CD 90 10         [ 4] 2803         CALL     PARSE
      009047 CC 8E 5D         [ 2] 2804         JP     TYPES
                                   2805 
                                   2806 ;       (       ( -- )
                                   2807 ;       Ignore following string up to next ).
                                   2808 ;       A comment.
      00904A 90 3C                 2809         .word      LINK
                           000FCC  2810 LINK = . 
      00904C 81                    2811 	.byte      IMEDD+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      00904D 28                    2812         .ascii     "("
      00904E                       2813 PAREN:
      00904E CD 83 DF         [ 4] 2814         CALL     DOLIT
      009051 00 29                 2815         .word     41	; ")"
      009053 CD 90 10         [ 4] 2816         CALL     PARSE
      009056 CC 86 8F         [ 2] 2817         JP     DDROP
                                   2818 
                                   2819 ;       \       ( -- )
                                   2820 ;       Ignore following text till
                                   2821 ;       end of line.
      009059 90 4C                 2822         .word      LINK
                           000FDB  2823 LINK = . 
      00905B 81                    2824 	.byte      IMEDD+1
      00905C 5C                    2825         .ascii     "\"
      00905D                       2826 BKSLA:
      00905D 90 AE 00 0C      [ 2] 2827         ldw y,#UCTIB ; #TIB  
      009061 90 FE            [ 2] 2828         ldw y,(y)
      009063 90 89            [ 2] 2829         pushw y ; count in TIB 
      009065 90 AE 00 0A      [ 2] 2830         ldw y,#UINN ; >IN 
      009069 90 BF 1E         [ 2] 2831         ldw YTEMP,y
      00906C 90 85            [ 2] 2832         popw y 
      00906E 91 CF 1E         [ 5] 2833         ldw [YTEMP],y
      009071 81               [ 4] 2834         ret 
                                   2835 
                                   2836 ;       WORD    ( c -- a ; <string> )
                                   2837 ;       Parse a word from input stream
                                   2838 ;       and copy it to code dictionary.
      009072 90 5B                 2839         .word      LINK
                           000FF4  2840 LINK = . 
      009074 04                    2841         .byte      4
      009075 57 4F 52 44           2842         .ascii     "WORD"
      009079                       2843 WORDD:
      009079 CD 90 10         [ 4] 2844         CALL     PARSE
      00907C CD 8B 03         [ 4] 2845         CALL     HERE
      00907F CD 89 7E         [ 4] 2846         CALL     CELLP
      009082 CC 8B C3         [ 2] 2847         JP     PACKS
                                   2848 
                                   2849 ;       TOKEN   ( -- a ; <string> )
                                   2850 ;       Parse a word from input stream
                                   2851 ;       and copy it to name dictionary.
      009085 90 74                 2852         .word      LINK
                           001007  2853 LINK = . 
      009087 05                    2854         .byte      5
      009088 54 4F 4B 45 4E        2855         .ascii     "TOKEN"
      00908D                       2856 TOKEN:
      00908D CD 8A 08         [ 4] 2857         CALL     BLANK
      009090 CC 90 79         [ 2] 2858         JP     WORDD
                                   2859 
                                   2860 ;; Dictionary search
                                   2861 
                                   2862 ;       NAME>   ( na -- ca )
                                   2863 ;       Return a code address given
                                   2864 ;       a name address.
      009093 90 87                 2865         .word      LINK
                           001015  2866 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      009095 05                    2867         .byte      5
      009096 4E 41 4D 45 3E        2868         .ascii     "NAME>"
      00909B                       2869 NAMET:
      00909B CD 8A EC         [ 4] 2870         CALL     COUNT
      00909E CD 83 DF         [ 4] 2871         CALL     DOLIT
      0090A1 00 1F                 2872         .word      31
      0090A3 CD 85 50         [ 4] 2873         CALL     ANDD
      0090A6 CC 86 AF         [ 2] 2874         JP     PLUS
                                   2875 
                                   2876 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   2877 ;       Compare u cells in two
                                   2878 ;       strings. Return 0 if identical.
      0090A9 90 95                 2879         .word      LINK
                           00102B  2880 LINK = . 
      0090AB 05                    2881         .byte       5
      0090AC 53 41 4D 45 3F        2882         .ascii     "SAME?"
      0090B1                       2883 SAMEQ:
      0090B1 CD 89 B6         [ 4] 2884         CALL     ONEM
      0090B4 CD 84 CD         [ 4] 2885         CALL     TOR
      0090B7 20 29            [ 2] 2886         JRA     SAME2
      0090B9 CD 85 2E         [ 4] 2887 SAME1:  CALL     OVER
      0090BC CD 84 C1         [ 4] 2888         CALL     RAT
      0090BF CD 86 AF         [ 4] 2889         CALL     PLUS
      0090C2 CD 84 7B         [ 4] 2890         CALL     CAT
      0090C5 CD 85 2E         [ 4] 2891         CALL     OVER
      0090C8 CD 84 C1         [ 4] 2892         CALL     RAT
      0090CB CD 86 AF         [ 4] 2893         CALL     PLUS
      0090CE CD 84 7B         [ 4] 2894         CALL     CAT
      0090D1 CD 87 28         [ 4] 2895         CALL     SUBB
      0090D4 CD 86 5E         [ 4] 2896         CALL     QDUP
      0090D7 CD 84 12         [ 4] 2897         CALL     QBRAN
      0090DA 90 E2                 2898         .word      SAME2
      0090DC CD 84 AE         [ 4] 2899         CALL     RFROM
      0090DF CC 84 FA         [ 2] 2900         JP     DROP
      0090E2 CD 83 F3         [ 4] 2901 SAME2:  CALL     DONXT
      0090E5 90 B9                 2902         .word      SAME1
      0090E7 CC 8A 15         [ 2] 2903         JP     ZERO
                                   2904 
                                   2905 ;       find    ( a va -- ca na | a F )
                                   2906 ;       Search vocabulary for string.
                                   2907 ;       Return ca and na if succeeded.
      0090EA 90 AB                 2908         .word      LINK
                           00106C  2909 LINK = . 
      0090EC 04                    2910         .byte      4
      0090ED 46 49 4E 44           2911         .ascii     "FIND"
      0090F1                       2912 FIND:
      0090F1 CD 85 14         [ 4] 2913         CALL     SWAPP
      0090F4 CD 85 04         [ 4] 2914         CALL     DUPP
      0090F7 CD 84 7B         [ 4] 2915         CALL     CAT
      0090FA CD 85 D0         [ 4] 2916         CALL     TEMP
      0090FD CD 84 46         [ 4] 2917         CALL     STORE
      009100 CD 85 04         [ 4] 2918         CALL     DUPP
      009103 CD 84 5D         [ 4] 2919         CALL     AT
      009106 CD 84 CD         [ 4] 2920         CALL     TOR
      009109 CD 89 7E         [ 4] 2921         CALL     CELLP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      00910C CD 85 14         [ 4] 2922         CALL     SWAPP
      00910F CD 84 5D         [ 4] 2923 FIND1:  CALL     AT
      009112 CD 85 04         [ 4] 2924         CALL     DUPP
      009115 CD 84 12         [ 4] 2925         CALL     QBRAN
      009118 91 4E                 2926         .word      FIND6
      00911A CD 85 04         [ 4] 2927         CALL     DUPP
      00911D CD 84 5D         [ 4] 2928         CALL     AT
      009120 CD 83 DF         [ 4] 2929         CALL     DOLIT
      009123 1F 7F                 2930         .word      MASKK
      009125 CD 85 50         [ 4] 2931         CALL     ANDD
      009128 CD 84 C1         [ 4] 2932         CALL     RAT
      00912B CD 85 79         [ 4] 2933         CALL     XORR
      00912E CD 84 12         [ 4] 2934         CALL     QBRAN
      009131 91 3D                 2935         .word      FIND2
      009133 CD 89 7E         [ 4] 2936         CALL     CELLP
      009136 CD 83 DF         [ 4] 2937         CALL     DOLIT
      009139 FF FF                 2938         .word     0xFFFF
      00913B 20 0C            [ 2] 2939         JRA     FIND3
      00913D CD 89 7E         [ 4] 2940 FIND2:  CALL     CELLP
      009140 CD 85 D0         [ 4] 2941         CALL     TEMP
      009143 CD 84 5D         [ 4] 2942         CALL     AT
      009146 CD 90 B1         [ 4] 2943         CALL     SAMEQ
      009149 CD 84 29         [ 4] 2944 FIND3:  CALL     BRAN
      00914C 91 5D                 2945         .word      FIND4
      00914E CD 84 AE         [ 4] 2946 FIND6:  CALL     RFROM
      009151 CD 84 FA         [ 4] 2947         CALL     DROP
      009154 CD 85 14         [ 4] 2948         CALL     SWAPP
      009157 CD 89 8D         [ 4] 2949         CALL     CELLM
      00915A CC 85 14         [ 2] 2950         JP     SWAPP
      00915D CD 84 12         [ 4] 2951 FIND4:  CALL     QBRAN
      009160 91 6A                 2952         .word      FIND5
      009162 CD 89 8D         [ 4] 2953         CALL     CELLM
      009165 CD 89 8D         [ 4] 2954         CALL     CELLM
      009168 20 A5            [ 2] 2955         JRA     FIND1
      00916A CD 84 AE         [ 4] 2956 FIND5:  CALL     RFROM
      00916D CD 84 FA         [ 4] 2957         CALL     DROP
      009170 CD 85 14         [ 4] 2958         CALL     SWAPP
      009173 CD 84 FA         [ 4] 2959         CALL     DROP
      009176 CD 89 8D         [ 4] 2960         CALL     CELLM
      009179 CD 85 04         [ 4] 2961         CALL     DUPP
      00917C CD 90 9B         [ 4] 2962         CALL     NAMET
      00917F CC 85 14         [ 2] 2963         JP     SWAPP
                                   2964 
                                   2965 ;       NAME?   ( a -- ca na | a F )
                                   2966 ;       Search vocabularies for a string.
      009182 90 EC                 2967         .word      LINK
                           001104  2968 LINK = . 
      009184 05                    2969         .byte      5
      009185 4E 41 4D 45 3F        2970         .ascii     "NAME?"
      00918A                       2971 NAMEQ:
      00918A CD 86 22         [ 4] 2972         CALL   CNTXT
      00918D CC 90 F1         [ 2] 2973         JP     FIND
                                   2974 
                                   2975 ;; Terminal response
                                   2976 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2977 ;       ^H      ( bot eot cur -- bot eot cur )
                                   2978 ;       Backup cursor by one character.
      009190 91 84                 2979         .word      LINK
                           001112  2980 LINK = . 
      009192 02                    2981         .byte      2
      009193 5E 48                 2982         .ascii     "^H"
      009195                       2983 BKSP:
      009195 CD 84 CD         [ 4] 2984         CALL     TOR
      009198 CD 85 2E         [ 4] 2985         CALL     OVER
      00919B CD 84 AE         [ 4] 2986         CALL     RFROM
      00919E CD 85 14         [ 4] 2987         CALL     SWAPP
      0091A1 CD 85 2E         [ 4] 2988         CALL     OVER
      0091A4 CD 85 79         [ 4] 2989         CALL     XORR
      0091A7 CD 84 12         [ 4] 2990         CALL     QBRAN
      0091AA 91 C5                 2991         .word      BACK1
      0091AC CD 83 DF         [ 4] 2992         CALL     DOLIT
      0091AF 00 08                 2993         .word      BKSPP
      0091B1 CD 83 C9         [ 4] 2994         CALL     EMIT
      0091B4 CD 89 B6         [ 4] 2995         CALL     ONEM
      0091B7 CD 8A 08         [ 4] 2996         CALL     BLANK
      0091BA CD 83 C9         [ 4] 2997         CALL     EMIT
      0091BD CD 83 DF         [ 4] 2998         CALL     DOLIT
      0091C0 00 08                 2999         .word      BKSPP
      0091C2 CC 83 C9         [ 2] 3000         JP     EMIT
      0091C5 81               [ 4] 3001 BACK1:  RET
                                   3002 
                                   3003 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3004 ;       Accept and echo key stroke
                                   3005 ;       and bump cursor.
      0091C6 91 92                 3006         .word      LINK
                           001148  3007 LINK = . 
      0091C8 03                    3008         .byte      3
      0091C9 54 41 50              3009         .ascii     "TAP"
      0091CC                       3010 TAP:
      0091CC CD 85 04         [ 4] 3011         CALL     DUPP
      0091CF CD 83 C9         [ 4] 3012         CALL     EMIT
      0091D2 CD 85 2E         [ 4] 3013         CALL     OVER
      0091D5 CD 84 6A         [ 4] 3014         CALL     CSTOR
      0091D8 CC 89 A9         [ 2] 3015         JP     ONEP
                                   3016 
                                   3017 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3018 ;       Process a key stroke,
                                   3019 ;       CR or backspace.
      0091DB 91 C8                 3020         .word      LINK
                           00115D  3021 LINK = . 
      0091DD 04                    3022         .byte      4
      0091DE 4B 54 41 50           3023         .ascii     "KTAP"
      0091E2                       3024 KTAP:
      0091E2 CD 85 04         [ 4] 3025         CALL     DUPP
      0091E5 CD 83 DF         [ 4] 3026         CALL     DOLIT
      0091E8 00 0D                 3027         .word      CRR
      0091EA CD 85 79         [ 4] 3028         CALL     XORR
      0091ED CD 84 12         [ 4] 3029         CALL     QBRAN
      0091F0 92 08                 3030         .word      KTAP2
      0091F2 CD 83 DF         [ 4] 3031         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0091F5 00 08                 3032         .word      BKSPP
      0091F7 CD 85 79         [ 4] 3033         CALL     XORR
      0091FA CD 84 12         [ 4] 3034         CALL     QBRAN
      0091FD 92 05                 3035         .word      KTAP1
      0091FF CD 8A 08         [ 4] 3036         CALL     BLANK
      009202 CC 91 CC         [ 2] 3037         JP     TAP
      009205 CC 91 95         [ 2] 3038 KTAP1:  JP     BKSP
      009208 CD 84 FA         [ 4] 3039 KTAP2:  CALL     DROP
      00920B CD 85 14         [ 4] 3040         CALL     SWAPP
      00920E CD 84 FA         [ 4] 3041         CALL     DROP
      009211 CC 85 04         [ 2] 3042         JP     DUPP
                                   3043 
                                   3044 ;       accept  ( b u -- b u )
                                   3045 ;       Accept characters to input
                                   3046 ;       buffer. Return with actual count.
      009214 91 DD                 3047         .word      LINK
                           001196  3048 LINK = . 
      009216 06                    3049         .byte      6
      009217 41 43 43 45 50 54     3050         .ascii     "ACCEPT"
      00921D                       3051 ACCEP:
      00921D CD 85 2E         [ 4] 3052         CALL     OVER
      009220 CD 86 AF         [ 4] 3053         CALL     PLUS
      009223 CD 85 2E         [ 4] 3054         CALL     OVER
      009226 CD 86 9A         [ 4] 3055 ACCP1:  CALL     DDUP
      009229 CD 85 79         [ 4] 3056         CALL     XORR
      00922C CD 84 12         [ 4] 3057         CALL     QBRAN
      00922F 92 51                 3058         .word      ACCP4
      009231 CD 8D FB         [ 4] 3059         CALL     KEY
      009234 CD 85 04         [ 4] 3060         CALL     DUPP
      009237 CD 8A 08         [ 4] 3061         CALL     BLANK
      00923A CD 83 DF         [ 4] 3062         CALL     DOLIT
      00923D 00 7F                 3063         .word      127
      00923F CD 87 EA         [ 4] 3064         CALL     WITHI
      009242 CD 84 12         [ 4] 3065         CALL     QBRAN
      009245 92 4C                 3066         .word      ACCP2
      009247 CD 91 CC         [ 4] 3067         CALL     TAP
      00924A 20 03            [ 2] 3068         JRA     ACCP3
      00924C CD 91 E2         [ 4] 3069 ACCP2:  CALL     KTAP
      00924F 20 D5            [ 2] 3070 ACCP3:  JRA     ACCP1
      009251 CD 84 FA         [ 4] 3071 ACCP4:  CALL     DROP
      009254 CD 85 2E         [ 4] 3072         CALL     OVER
      009257 CC 87 28         [ 2] 3073         JP     SUBB
                                   3074 
                                   3075 ;       QUERY   ( -- )
                                   3076 ;       Accept input stream to
                                   3077 ;       terminal input buffer.
      00925A 92 16                 3078         .word      LINK
                                   3079         
                           0011DC  3080 LINK = . 
      00925C 05                    3081         .byte      5
      00925D 51 55 45 52 59        3082         .ascii     "QUERY"
      009262                       3083 QUERY:
      009262 CD 8B 25         [ 4] 3084         CALL     TIB
      009265 CD 83 DF         [ 4] 3085         CALL     DOLIT
      009268 00 50                 3086         .word      80
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      00926A CD 92 1D         [ 4] 3087         CALL     ACCEP
      00926D CD 85 EF         [ 4] 3088         CALL     NTIB
      009270 CD 84 46         [ 4] 3089         CALL     STORE
      009273 CD 84 FA         [ 4] 3090         CALL     DROP
      009276 CD 8A 15         [ 4] 3091         CALL     ZERO
      009279 CD 85 DF         [ 4] 3092         CALL     INN
      00927C CC 84 46         [ 2] 3093         JP     STORE
                                   3094 
                                   3095 ;       ABORT   ( -- )
                                   3096 ;       Reset data stack and
                                   3097 ;       jump to QUIT.
      00927F 92 5C                 3098         .word      LINK
                           001201  3099 LINK = . 
      009281 05                    3100         .byte      5
      009282 41 42 4F 52 54        3101         .ascii     "ABORT"
      009287                       3102 ABORT:
      009287 CD 93 7E         [ 4] 3103         CALL     PRESE
      00928A CC 93 9B         [ 2] 3104         JP     QUIT
                                   3105 
                                   3106 ;       abort"  ( f -- )
                                   3107 ;       Run time routine of ABORT".
                                   3108 ;       Abort with a message.
      00928D 92 81                 3109         .word      LINK
                           00120F  3110 LINK = . 
      00928F 46                    3111 	.byte      COMPO+6
      009290 41 42 4F 52 54        3112         .ascii     "ABORT"
      009295 22                    3113         .byte      '"'
      009296                       3114 ABORQ:
      009296 CD 84 12         [ 4] 3115         CALL     QBRAN
      009299 92 B5                 3116         .word      ABOR2   ;text flag
      00929B CD 8E 91         [ 4] 3117         CALL     DOSTR
      00929E CD 8E 33         [ 4] 3118 ABOR1:  CALL     SPACE
      0092A1 CD 8A EC         [ 4] 3119         CALL     COUNT
      0092A4 CD 8E 5D         [ 4] 3120         CALL     TYPES
      0092A7 CD 83 DF         [ 4] 3121         CALL     DOLIT
      0092AA 00 3F                 3122         .word     63 ; "?"
      0092AC CD 83 C9         [ 4] 3123         CALL     EMIT
      0092AF CD 8E 7B         [ 4] 3124         CALL     CR
      0092B2 CC 92 87         [ 2] 3125         JP     ABORT   ;pass error string
      0092B5 CD 8E 91         [ 4] 3126 ABOR2:  CALL     DOSTR
      0092B8 CC 84 FA         [ 2] 3127         JP     DROP
                                   3128 
                                   3129 ;; The text interpreter
                                   3130 
                                   3131 ;       $INTERPRET      ( a -- )
                                   3132 ;       Interpret a word. If failed,
                                   3133 ;       try to convert it to an integer.
      0092BB 92 8F                 3134         .word      LINK
                           00123D  3135 LINK = . 
      0092BD 0A                    3136         .byte      10
      0092BE 24 49 4E 54 45 52 50  3137         .ascii     "$INTERPRET"
             52 45 54
      0092C8                       3138 INTER:
      0092C8 CD 91 8A         [ 4] 3139         CALL     NAMEQ
      0092CB CD 86 5E         [ 4] 3140         CALL     QDUP    ;?defined
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0092CE CD 84 12         [ 4] 3141         CALL     QBRAN
      0092D1 92 F2                 3142         .word      INTE1
      0092D3 CD 84 5D         [ 4] 3143         CALL     AT
      0092D6 CD 83 DF         [ 4] 3144         CALL     DOLIT
      0092D9 40 00                 3145 	.word       0x4000	; COMPO*256
      0092DB CD 85 50         [ 4] 3146         CALL     ANDD    ;?compile only lexicon bits
      0092DE CD 92 96         [ 4] 3147         CALL     ABORQ
      0092E1 0D                    3148         .byte      13
      0092E2 20 63 6F 6D 70 69 6C  3149         .ascii     " compile only"
             65 20 6F 6E 6C 79
      0092EF CC 84 39         [ 2] 3150         JP     EXECU
      0092F2 CD 8D 28         [ 4] 3151 INTE1:  CALL     NUMBQ   ;convert a number
      0092F5 CD 84 12         [ 4] 3152         CALL     QBRAN
      0092F8 92 9E                 3153         .word    ABOR1
      0092FA 81               [ 4] 3154         RET
                                   3155 
                                   3156 ;       [       ( -- )
                                   3157 ;       Start  text interpreter.
      0092FB 92 BD                 3158         .word      LINK
                           00127D  3159 LINK = . 
      0092FD 81                    3160 	.byte      IMEDD+1
      0092FE 5B                    3161         .ascii     "["
      0092FF                       3162 LBRAC:
      0092FF CD 83 DF         [ 4] 3163         CALL   DOLIT
      009302 92 C8                 3164         .word  INTER
      009304 CD 86 00         [ 4] 3165         CALL   TEVAL
      009307 CC 84 46         [ 2] 3166         JP     STORE
                                   3167 
                                   3168 ;       .OK     ( -- )
                                   3169 ;       Display 'ok' while interpreting.
      00930A 92 FD                 3170         .word      LINK
                           00128C  3171 LINK = . 
      00930C 03                    3172         .byte      3
      00930D 2E 4F 4B              3173         .ascii     ".OK"
      009310                       3174 DOTOK:
      009310 CD 83 DF         [ 4] 3175         CALL     DOLIT
      009313 92 C8                 3176         .word      INTER
      009315 CD 86 00         [ 4] 3177         CALL     TEVAL
      009318 CD 84 5D         [ 4] 3178         CALL     AT
      00931B CD 87 50         [ 4] 3179         CALL     EQUAL
      00931E CD 84 12         [ 4] 3180         CALL     QBRAN
      009321 93 2A                 3181         .word      DOTO1
      009323 CD 8E BA         [ 4] 3182         CALL     DOTQP
      009326 03                    3183         .byte      3
      009327 20 6F 6B              3184         .ascii     " ok"
      00932A CC 8E 7B         [ 2] 3185 DOTO1:  JP     CR
                                   3186 
                                   3187 ;       ?STACK  ( -- )
                                   3188 ;       Abort if stack underflows.
      00932D 93 0C                 3189         .word      LINK
                           0012AF  3190 LINK = . 
      00932F 06                    3191         .byte      6
      009330 3F 53 54 41 43 4B     3192         .ascii     "?STACK"
      009336                       3193 QSTAC: 
      009336 CD 8A 57         [ 4] 3194         CALL     DEPTH
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      009339 CD 85 3D         [ 4] 3195         CALL     ZLESS   ;check only for underflow
      00933C CD 92 96         [ 4] 3196         CALL     ABORQ
      00933F 0B                    3197         .byte      11
      009340 20 75 6E 64 65 72 66  3198         .ascii     " underflow "
             6C 6F 77 20
      00934B 81               [ 4] 3199         RET
                                   3200 
                                   3201 ;       EVAL    ( -- )
                                   3202 ;       Interpret  input stream.
      00934C 93 2F                 3203         .word      LINK
                           0012CE  3204 LINK = . 
      00934E 04                    3205         .byte      4
      00934F 45 56 41 4C           3206         .ascii     "EVAL"
      009353                       3207 EVAL:
      009353 CD 90 8D         [ 4] 3208 EVAL1:  CALL     TOKEN
      009356 CD 85 04         [ 4] 3209         CALL     DUPP
      009359 CD 84 7B         [ 4] 3210         CALL     CAT     ;?input stream empty
      00935C CD 84 12         [ 4] 3211         CALL     QBRAN
      00935F 93 6F                 3212         .word    EVAL2
      009361 CD 86 00         [ 4] 3213         CALL     TEVAL
      009364 CD 8B 39         [ 4] 3214         CALL     ATEXE
      009367 CD 93 36         [ 4] 3215         CALL     QSTAC   ;evaluate input, check stack
      00936A CD 84 29         [ 4] 3216         CALL     BRAN
      00936D 93 53                 3217         .word    EVAL1
      00936F CD 84 FA         [ 4] 3218 EVAL2:  CALL     DROP
      009372 CC 93 10         [ 2] 3219         JP       DOTOK
                                   3220 
                                   3221 ;       PRESET  ( -- )
                                   3222 ;       Reset data stack pointer and
                                   3223 ;       terminal input buffer.
      009375 93 4E                 3224         .word      LINK
                           0012F7  3225 LINK = . 
      009377 06                    3226         .byte      6
      009378 50 52 45 53 45 54     3227         .ascii     "PRESET"
      00937E                       3228 PRESE:
      00937E CD 83 DF         [ 4] 3229         CALL     DOLIT
      009381 07 7F                 3230         .word      SPP
      009383 CD 84 F1         [ 4] 3231         CALL     SPSTO
      009386 CD 83 DF         [ 4] 3232         CALL     DOLIT
      009389 07 7F                 3233         .word      TIBB
      00938B CD 85 EF         [ 4] 3234         CALL     NTIB
      00938E CD 89 7E         [ 4] 3235         CALL     CELLP
      009391 CC 84 46         [ 2] 3236         JP     STORE
                                   3237 
                                   3238 ;       QUIT    ( -- )
                                   3239 ;       Reset return stack pointer
                                   3240 ;       and start text interpreter.
      009394 93 77                 3241         .word      LINK
                           001316  3242 LINK = . 
      009396 04                    3243         .byte      4
      009397 51 55 49 54           3244         .ascii     "QUIT"
      00939B                       3245 QUIT:
      00939B CD 83 DF         [ 4] 3246         CALL     DOLIT
      00939E 07 FE                 3247         .word      RPP
      0093A0 CD 84 98         [ 4] 3248         CALL     RPSTO   ;reset return stack pointer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      0093A3 CD 92 FF         [ 4] 3249 QUIT1:  CALL     LBRAC   ;start interpretation
      0093A6 CD 92 62         [ 4] 3250 QUIT2:  CALL     QUERY   ;get input
      0093A9 CD 93 53         [ 4] 3251         CALL     EVAL
      0093AC 20 F8            [ 2] 3252         JRA     QUIT2   ;continue till error
                                   3253 
                                   3254 ;; The compiler
                                   3255 
                                   3256 ;       '       ( -- ca )
                                   3257 ;       Search vocabularies for
                                   3258 ;       next word in input stream.
      0093AE 93 96                 3259         .word      LINK
                           001330  3260 LINK = . 
      0093B0 01                    3261         .byte      1
      0093B1 27                    3262         .ascii     "'"
      0093B2                       3263 TICK:
      0093B2 CD 90 8D         [ 4] 3264         CALL     TOKEN
      0093B5 CD 91 8A         [ 4] 3265         CALL     NAMEQ   ;?defined
      0093B8 CD 84 12         [ 4] 3266         CALL     QBRAN
      0093BB 92 9E                 3267         .word      ABOR1
      0093BD 81               [ 4] 3268         RET     ;yes, push code address
                                   3269 
                                   3270 ;       ALLOT   ( n -- )
                                   3271 ;       Allocate n bytes to RAM 
      0093BE 93 B0                 3272         .word      LINK
                           001340  3273         LINK = . 
      0093C0 05                    3274         .byte      5
      0093C1 41 4C 4C 4F 54        3275         .ascii     "ALLOT"
      0093C6                       3276 ALLOT:
      0093C6 CD 86 30         [ 4] 3277         CALL     VPP
                                   3278 ; must update APP_VP each time VP is modidied
      0093C9 CD 8A 85         [ 4] 3279         call PSTOR 
      0093CC CC 9A BD         [ 2] 3280         jp UPDATVP 
                                   3281 
                                   3282 ;       ,       ( w -- )
                                   3283 ;         Compile an integer into
                                   3284 ;         variable space.
      0093CF 93 C0                 3285         .word      LINK
                           001351  3286 LINK = . 
      0093D1 01                    3287         .byte      1
      0093D2 2C                    3288         .ascii     ","
      0093D3                       3289 COMMA:
      0093D3 CD 8B 03         [ 4] 3290         CALL     HERE
      0093D6 CD 85 04         [ 4] 3291         CALL     DUPP
      0093D9 CD 89 7E         [ 4] 3292         CALL     CELLP   ;cell boundary
      0093DC CD 86 30         [ 4] 3293         CALL     VPP
      0093DF CD 84 46         [ 4] 3294         CALL     STORE
      0093E2 CC 84 46         [ 2] 3295         JP     STORE
                                   3296 
                                   3297 ;       C,      ( c -- )
                                   3298 ;       Compile a byte into
                                   3299 ;       variables space.
      0093E5 93 D1                 3300        .word      LINK
                           001367  3301 LINK = . 
      0093E7 02                    3302         .byte      2
      0093E8 43 2C                 3303         .ascii     "C,"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0093EA                       3304 CCOMMA:
      0093EA CD 8B 03         [ 4] 3305         CALL     HERE
      0093ED CD 85 04         [ 4] 3306         CALL     DUPP
      0093F0 CD 89 A9         [ 4] 3307         CALL     ONEP
      0093F3 CD 86 30         [ 4] 3308         CALL     VPP
      0093F6 CD 84 46         [ 4] 3309         CALL     STORE
      0093F9 CC 84 6A         [ 2] 3310         JP     CSTOR
                                   3311 
                                   3312 ;       [COMPILE]       ( -- ; <string> )
                                   3313 ;       Compile next immediate
                                   3314 ;       word into code dictionary.
      0093FC 93 E7                 3315         .word      LINK
                           00137E  3316 LINK = . 
      0093FE 89                    3317 	.byte      IMEDD+9
      0093FF 5B 43 4F 4D 50 49 4C  3318         .ascii     "[COMPILE]"
             45 5D
      009408                       3319 BCOMP:
      009408 CD 93 B2         [ 4] 3320         CALL     TICK
      00940B CC 96 9D         [ 2] 3321         JP     JSRC
                                   3322 
                                   3323 ;       COMPILE ( -- )
                                   3324 ;       Compile next jsr in
                                   3325 ;       colon list to code dictionary.
      00940E 93 FE                 3326         .word      LINK
                           001390  3327 LINK = . 
      009410 47                    3328 	.byte      COMPO+7
      009411 43 4F 4D 50 49 4C 45  3329         .ascii     "COMPILE"
      009418                       3330 COMPI:
      009418 CD 84 AE         [ 4] 3331         CALL     RFROM
      00941B CD 85 04         [ 4] 3332         CALL     DUPP
      00941E CD 84 5D         [ 4] 3333         CALL     AT
      009421 CD 96 9D         [ 4] 3334         CALL     JSRC    ;compile subroutine
      009424 CD 89 7E         [ 4] 3335         CALL     CELLP
      009427 90 93            [ 1] 3336         ldw y,x 
      009429 90 FE            [ 2] 3337         ldw y,(y)
      00942B 1C 00 02         [ 2] 3338         addw x,#CELLL 
      00942E 90 FC            [ 2] 3339         jp (y)
                                   3340 
                                   3341 ;       LITERAL ( w -- )
                                   3342 ;       Compile tos to dictionary
                                   3343 ;       as an integer literal.
      009430 94 10                 3344         .word      LINK
                           0013B2  3345 LINK = . 
      009432 87                    3346 	.byte      IMEDD+7
      009433 4C 49 54 45 52 41 4C  3347         .ascii     "LITERAL"
      00943A                       3348 LITER:
      00943A CD 94 18         [ 4] 3349         CALL     COMPI
      00943D 83 DF                 3350         .word DOLIT 
      00943F CC 93 D3         [ 2] 3351         JP     COMMA
                                   3352 
                                   3353 ;       $,"     ( -- )
                                   3354 ;       Compile a literal string
                                   3355 ;       up to next " .
      009442 94 32                 3356         .word      LINK
                           0013C4  3357 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      009444 03                    3358         .byte      3
      009445 24 2C 22              3359         .byte     '$',',','"'
      009448                       3360 STRCQ:
      009448 CD 83 DF         [ 4] 3361         CALL     DOLIT
      00944B 00 22                 3362         .word     34	; "
      00944D CD 90 10         [ 4] 3363         CALL     PARSE
      009450 CD 8B 03         [ 4] 3364         CALL     HERE
      009453 CD 8B C3         [ 4] 3365         CALL     PACKS   ;string to code dictionary
      009456 CD 8A EC         [ 4] 3366         CALL     COUNT
      009459 CD 86 AF         [ 4] 3367         CALL     PLUS    ;calculate aligned end of string
      00945C CD 86 30         [ 4] 3368         CALL     VPP
      00945F CC 84 46         [ 2] 3369         JP     STORE
                                   3370 
                                   3371 ;; Structures
                                   3372 
                                   3373 ;       FOR     ( -- a )
                                   3374 ;       Start a FOR-NEXT loop
                                   3375 ;       structure in a colon definition.
      009462 94 44                 3376         .word      LINK
                           0013E4  3377 LINK = . 
      009464 83                    3378 	.byte      IMEDD+3
      009465 46 4F 52              3379         .ascii     "FOR"
      009468                       3380 FOR:
      009468 CD 94 18         [ 4] 3381         CALL     COMPI
      00946B 84 CD                 3382         .word TOR 
      00946D CC 8B 03         [ 2] 3383         JP     HERE
                                   3384 
                                   3385 ;       NEXT    ( a -- )
                                   3386 ;       Terminate a FOR-NEXT loop.
      009470 94 64                 3387         .word      LINK
                           0013F2  3388 LINK = . 
      009472 84                    3389 	.byte      IMEDD+4
      009473 4E 45 58 54           3390         .ascii     "NEXT"
      009477                       3391 NEXT:
      009477 CD 94 18         [ 4] 3392         CALL     COMPI
      00947A 83 F3                 3393         .word DONXT 
      00947C CC 93 D3         [ 2] 3394         JP     COMMA
                                   3395 
                                   3396 ;       I ( -- n )
                                   3397 ;       stack FOR-NEXT COUNTER 
      00947F 94 72                 3398         .word LINK 
                           001401  3399         LINK=.
      009481 01                    3400         .byte 1 
      009482 49                    3401         .ascii "I"
      009483                       3402 IFETCH: 
      009483 1D 00 02         [ 2] 3403         subw x,#CELLL 
      009486 16 03            [ 2] 3404         ldw y,(3,sp)
      009488 FF               [ 2] 3405         ldw (x),y 
      009489 81               [ 4] 3406         ret 
                                   3407 
                                   3408 ;       BEGIN   ( -- a )
                                   3409 ;       Start an infinite or
                                   3410 ;       indefinite loop structure.
      00948A 94 81                 3411         .word      LINK
                           00140C  3412 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      00948C 85                    3413 	.byte      IMEDD+5
      00948D 42 45 47 49 4E        3414         .ascii     "BEGIN"
      009492                       3415 BEGIN:
      009492 CC 8B 03         [ 2] 3416         JP     HERE
                                   3417 
                                   3418 ;       UNTIL   ( a -- )
                                   3419 ;       Terminate a BEGIN-UNTIL
                                   3420 ;       indefinite loop structure.
      009495 94 8C                 3421         .word      LINK
                           001417  3422 LINK = . 
      009497 85                    3423 	.byte      IMEDD+5
      009498 55 4E 54 49 4C        3424         .ascii     "UNTIL"
      00949D                       3425 UNTIL:
      00949D CD 94 18         [ 4] 3426         CALL     COMPI
      0094A0 84 12                 3427         .word    QBRAN 
      0094A2 CC 93 D3         [ 2] 3428         JP     COMMA
                                   3429 
                                   3430 ;       AGAIN   ( a -- )
                                   3431 ;       Terminate a BEGIN-AGAIN
                                   3432 ;       infinite loop structure.
      0094A5 94 97                 3433         .word      LINK
                           001427  3434 LINK = . 
      0094A7 85                    3435 	.byte      IMEDD+5
      0094A8 41 47 41 49 4E        3436         .ascii     "AGAIN"
      0094AD                       3437 AGAIN:
      0094AD CD 94 18         [ 4] 3438         CALL     COMPI
      0094B0 84 29                 3439         .word BRAN
      0094B2 CC 93 D3         [ 2] 3440         JP     COMMA
                                   3441 
                                   3442 ;       IF      ( -- A )
                                   3443 ;       Begin a conditional branch.
      0094B5 94 A7                 3444         .word      LINK
                           001437  3445 LINK = . 
      0094B7 82                    3446 	.byte      IMEDD+2
      0094B8 49 46                 3447         .ascii     "IF"
      0094BA                       3448 IFF:
      0094BA CD 94 18         [ 4] 3449         CALL     COMPI
      0094BD 84 12                 3450         .word QBRAN
      0094BF CD 8B 03         [ 4] 3451         CALL     HERE
      0094C2 CD 8A 15         [ 4] 3452         CALL     ZERO
      0094C5 CC 93 D3         [ 2] 3453         JP     COMMA
                                   3454 
                                   3455 ;       THEN        ( A -- )
                                   3456 ;       Terminate a conditional branch structure.
      0094C8 94 B7                 3457         .word      LINK
                           00144A  3458 LINK = . 
      0094CA 84                    3459 	.byte      IMEDD+4
      0094CB 54 48 45 4E           3460         .ascii     "THEN"
      0094CF                       3461 THENN:
      0094CF CD 8B 03         [ 4] 3462         CALL     HERE
      0094D2 CD 85 14         [ 4] 3463         CALL     SWAPP
      0094D5 CC 84 46         [ 2] 3464         JP     STORE
                                   3465 
                                   3466 ;       ELSE        ( A -- A )
                                   3467 ;       Start the false clause in an IF-ELSE-THEN structure.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0094D8 94 CA                 3468         .word      LINK
                           00145A  3469 LINK = . 
      0094DA 84                    3470 	.byte      IMEDD+4
      0094DB 45 4C 53 45           3471         .ascii     "ELSE"
      0094DF                       3472 ELSEE:
      0094DF CD 94 18         [ 4] 3473         CALL     COMPI
      0094E2 84 29                 3474         .word BRAN
      0094E4 CD 8B 03         [ 4] 3475         CALL     HERE
      0094E7 CD 8A 15         [ 4] 3476         CALL     ZERO
      0094EA CD 93 D3         [ 4] 3477         CALL     COMMA
      0094ED CD 85 14         [ 4] 3478         CALL     SWAPP
      0094F0 CD 8B 03         [ 4] 3479         CALL     HERE
      0094F3 CD 85 14         [ 4] 3480         CALL     SWAPP
      0094F6 CC 84 46         [ 2] 3481         JP     STORE
                                   3482 
                                   3483 ;       AHEAD       ( -- A )
                                   3484 ;       Compile a forward branch instruction.
      0094F9 94 DA                 3485         .word      LINK
                           00147B  3486 LINK = . 
      0094FB 85                    3487 	.byte      IMEDD+5
      0094FC 41 48 45 41 44        3488         .ascii     "AHEAD"
      009501                       3489 AHEAD:
      009501 CD 94 18         [ 4] 3490         CALL     COMPI
      009504 84 29                 3491         .word BRAN
      009506 CD 8B 03         [ 4] 3492         CALL     HERE
      009509 CD 8A 15         [ 4] 3493         CALL     ZERO
      00950C CC 93 D3         [ 2] 3494         JP     COMMA
                                   3495 
                                   3496 ;       WHILE       ( a -- A a )
                                   3497 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      00950F 94 FB                 3498         .word      LINK
                           001491  3499 LINK = . 
      009511 85                    3500 	.byte      IMEDD+5
      009512 57 48 49 4C 45        3501         .ascii     "WHILE"
      009517                       3502 WHILE:
      009517 CD 94 18         [ 4] 3503         CALL     COMPI
      00951A 84 12                 3504         .word QBRAN
      00951C CD 8B 03         [ 4] 3505         CALL     HERE
      00951F CD 8A 15         [ 4] 3506         CALL     ZERO
      009522 CD 93 D3         [ 4] 3507         CALL     COMMA
      009525 CC 85 14         [ 2] 3508         JP     SWAPP
                                   3509 
                                   3510 ;       REPEAT      ( A a -- )
                                   3511 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      009528 95 11                 3512         .word      LINK
                           0014AA  3513 LINK = . 
      00952A 86                    3514         .byte      IMEDD+6
      00952B 52 45 50 45 41 54     3515         .ascii     "REPEAT"
      009531                       3516 REPEA:
      009531 CD 94 18         [ 4] 3517         CALL     COMPI
      009534 84 29                 3518         .word BRAN
      009536 CD 93 D3         [ 4] 3519         CALL     COMMA
      009539 CD 8B 03         [ 4] 3520         CALL     HERE
      00953C CD 85 14         [ 4] 3521         CALL     SWAPP
      00953F CC 84 46         [ 2] 3522         JP     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                                   3523 
                                   3524 ;       AFT         ( a -- a A )
                                   3525 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      009542 95 2A                 3526         .word      LINK
                           0014C4  3527 LINK = . 
      009544 83                    3528 	.byte      IMEDD+3
      009545 41 46 54              3529         .ascii     "AFT"
      009548                       3530 AFT:
      009548 CD 84 FA         [ 4] 3531         CALL     DROP
      00954B CD 95 01         [ 4] 3532         CALL     AHEAD
      00954E CD 8B 03         [ 4] 3533         CALL     HERE
      009551 CC 85 14         [ 2] 3534         JP     SWAPP
                                   3535 
                                   3536 ;       ABORT"      ( -- ; <string> )
                                   3537 ;       Conditional abort with an error message.
      009554 95 44                 3538         .word      LINK
                           0014D6  3539 LINK = . 
      009556 86                    3540 	.byte      IMEDD+6
      009557 41 42 4F 52 54        3541         .ascii     "ABORT"
      00955C 22                    3542         .byte      '"'
      00955D                       3543 ABRTQ:
      00955D CD 94 18         [ 4] 3544         CALL     COMPI
      009560 92 96                 3545         .word ABORQ
      009562 CC 94 48         [ 2] 3546         JP     STRCQ
                                   3547 
                                   3548 ;       $"     ( -- ; <string> )
                                   3549 ;       Compile an inline string literal.
      009565 95 56                 3550         .word      LINK
                           0014E7  3551 LINK = . 
      009567 82                    3552 	.byte      IMEDD+2
      009568 24 22                 3553         .byte     '$','"'
      00956A                       3554 STRQ:
      00956A CD 94 18         [ 4] 3555         CALL     COMPI
      00956D 8E B0                 3556         .word STRQP 
      00956F CC 94 48         [ 2] 3557         JP     STRCQ
                                   3558 
                                   3559 ;       ."          ( -- ; <string> )
                                   3560 ;       Compile an inline string literal to be typed out at run time.
      009572 95 67                 3561         .word      LINK
                           0014F4  3562 LINK = . 
      009574 82                    3563 	.byte      IMEDD+2
      009575 2E 22                 3564         .byte     '.','"'
      009577                       3565 DOTQ:
      009577 CD 94 18         [ 4] 3566         CALL     COMPI
      00957A 8E BA                 3567         .word DOTQP 
      00957C CC 94 48         [ 2] 3568         JP     STRCQ
                                   3569 
                                   3570 ;; Name compiler
                                   3571 
                                   3572 ;       ?UNIQUE ( a -- a )
                                   3573 ;       Display a warning message
                                   3574 ;       if word already exists.
      00957F 95 74                 3575         .word      LINK
                           001501  3576 LINK = . 
      009581 07                    3577         .byte      7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009582 3F 55 4E 49 51 55 45  3578         .ascii     "?UNIQUE"
      009589                       3579 UNIQU:
      009589 CD 85 04         [ 4] 3580         CALL     DUPP
      00958C CD 91 8A         [ 4] 3581         CALL     NAMEQ   ;?name exists
      00958F CD 84 12         [ 4] 3582         CALL     QBRAN
      009592 95 A8                 3583         .word      UNIQ1
      009594 CD 8E BA         [ 4] 3584         CALL     DOTQP   ;redef are OK
      009597 07                    3585         .byte       7
      009598 20 72 65 44 65 66 20  3586         .ascii     " reDef "       
      00959F CD 85 2E         [ 4] 3587         CALL     OVER
      0095A2 CD 8A EC         [ 4] 3588         CALL     COUNT
      0095A5 CD 8E 5D         [ 4] 3589         CALL     TYPES   ;just in case
      0095A8 CC 84 FA         [ 2] 3590 UNIQ1:  JP     DROP
                                   3591 
                                   3592 ;       $,n     ( na -- )
                                   3593 ;       Build a new dictionary name
                                   3594 ;       using string at na.
                                   3595 ; compile dans l'espace flash
      0095AB 95 81                 3596         .word      LINK
                           00152D  3597 LINK = . 
      0095AD 03                    3598         .byte      3
      0095AE 24 2C 6E              3599         .ascii     "$,n"
      0095B1                       3600 SNAME:
      0095B1 CD 85 04         [ 4] 3601         CALL     DUPP
      0095B4 CD 84 7B         [ 4] 3602         CALL     CAT     ;?null input
      0095B7 CD 84 12         [ 4] 3603         CALL     QBRAN
      0095BA 95 E1                 3604         .word      PNAM1
      0095BC CD 95 89         [ 4] 3605         CALL     UNIQU   ;?redefinition
      0095BF CD 9E 9F         [ 4] 3606         CALL    NAME_TO_FLASH 
      0095C2 CD 86 3E         [ 4] 3607         CALL    CPP 
      0095C5 CD 84 5D         [ 4] 3608         CALL    AT 
      0095C8 CD 89 7E         [ 4] 3609         CALL    CELLP 
      0095CB CD 85 04         [ 4] 3610         CALL     DUPP
      0095CE CD 86 4E         [ 4] 3611         CALL     LAST 
      0095D1 CD 84 46         [ 4] 3612         CALL     STORE
      0095D4 CD 86 22         [ 4] 3613         CALL     CNTXT
      0095D7 CD 84 46         [ 4] 3614         CALL     STORE
      0095DA CD 86 3E         [ 4] 3615         CALL    CPP 
      0095DD CD 84 46         [ 4] 3616         CALL    STORE 
      0095E0 81               [ 4] 3617         RET     ;save code pointer
      0095E1 CD 8E B0         [ 4] 3618 PNAM1:  CALL     STRQP
      0095E4 05                    3619         .byte      5
      0095E5 20 6E 61 6D 65        3620         .ascii     " name" ;null input
      0095EA CC 92 9E         [ 2] 3621         JP     ABOR1
                                   3622 
                                   3623 ;; FORTH compiler
                                   3624 
                                   3625 ;       $COMPILE        ( a -- )
                                   3626 ;       Compile next word to
                                   3627 ;       dictionary as a token or literal.
      0095ED 95 AD                 3628         .word      LINK
                           00156F  3629 LINK = . 
      0095EF 08                    3630         .byte      8
      0095F0 24 43 4F 4D 50 49 4C  3631         .ascii     "$COMPILE"
             45
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0095F8                       3632 SCOMP:
      0095F8 CD 91 8A         [ 4] 3633         CALL     NAMEQ
      0095FB CD 86 5E         [ 4] 3634         CALL     QDUP    ;?defined
      0095FE CD 84 12         [ 4] 3635         CALL     QBRAN
      009601 96 19                 3636         .word      SCOM2
      009603 CD 84 5D         [ 4] 3637         CALL     AT
      009606 CD 83 DF         [ 4] 3638         CALL     DOLIT
      009609 80 00                 3639         .word     0x8000	;  IMEDD*256
      00960B CD 85 50         [ 4] 3640         CALL     ANDD    ;?immediate
      00960E CD 84 12         [ 4] 3641         CALL     QBRAN
      009611 96 16                 3642         .word      SCOM1
      009613 CC 84 39         [ 2] 3643         JP     EXECU
      009616 CC 96 9D         [ 2] 3644 SCOM1:  JP     JSRC
      009619 CD 8D 28         [ 4] 3645 SCOM2:  CALL     NUMBQ   ;try to convert to number
      00961C CD 84 12         [ 4] 3646         CALL     QBRAN
      00961F 92 9E                 3647         .word      ABOR1
      009621 CC 94 3A         [ 2] 3648         JP     LITER
                                   3649 
                                   3650 ;       OVERT   ( -- )
                                   3651 ;       Link a new word into vocabulary.
      009624 95 EF                 3652         .word      LINK
                           0015A6  3653 LINK = . 
      009626 05                    3654         .byte      5
      009627 4F 56 45 52 54        3655         .ascii     "OVERT"
      00962C                       3656 OVERT:
      00962C CD 86 4E         [ 4] 3657         CALL     LAST
      00962F CD 84 5D         [ 4] 3658         CALL     AT
      009632 CD 86 22         [ 4] 3659         CALL     CNTXT
      009635 CC 84 46         [ 2] 3660         JP     STORE
                                   3661 
                                   3662 ;       ;       ( -- )
                                   3663 ;       Terminate a colon definition.
      009638 96 26                 3664         .word      LINK
                           0015BA  3665 LINK = . 
      00963A C1                    3666 	.byte      IMEDD+COMPO+1
      00963B 3B                    3667         .ascii     ";"
      00963C                       3668 SEMIS:
                           000001  3669 .if OPTIMIZE ; more compact and faster
      00963C CD 83 DF         [ 4] 3670         call DOLIT 
      00963F 00 81                 3671         .word 0x81   ; opcode for RET 
      009641 CD 93 EA         [ 4] 3672         call CCOMMA 
                           000000  3673 .else
                                   3674         CALL     COMPI
                                   3675         .word EXIT 
                                   3676 .endif 
      009644 CD 92 FF         [ 4] 3677         CALL     LBRAC
      009647 CD 96 2C         [ 4] 3678         call OVERT 
      00964A CD 9E 71         [ 4] 3679         CALL UPDATPTR
      00964D 81               [ 4] 3680         RET 
                                   3681 
                                   3682 
                                   3683 ;       Terminate an ISR definition 
                                   3684 ;       retourn ca of ISR as double
                                   3685 ;       I; ( -- ud )
      00964E 96 3A                 3686         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                           0015D0  3687         LINK=.
      009650 C2                    3688         .byte 2+IMEDD+COMPO 
      009651 49 3B                 3689         .ascii "I;" 
      009653                       3690 ISEMI:
      009653 1D 00 02         [ 2] 3691         subw x,#CELLL  
      009656 90 AE 00 80      [ 2] 3692         ldw y,#IRET_CODE 
      00965A FF               [ 2] 3693         ldw (x),y 
      00965B CD 93 EA         [ 4] 3694         call CCOMMA
      00965E CD 92 FF         [ 4] 3695         call LBRAC 
      009661 CD 86 3E         [ 4] 3696         CALL CPP
      009664 CD 84 5D         [ 4] 3697         call AT 
      009667 CD 85 14         [ 4] 3698         call SWAPP 
      00966A CD 86 3E         [ 4] 3699         CALL CPP 
      00966D CD 84 46         [ 4] 3700         call STORE 
      009670 CD 9A A6         [ 4] 3701         call UPDATCP 
      009673 CD 9A 66         [ 4] 3702         call EEPVP 
      009676 CD 84 FA         [ 4] 3703         call DROP 
      009679 CD 84 5D         [ 4] 3704         call AT 
      00967C CD 86 30         [ 4] 3705         call VPP 
      00967F CD 84 46         [ 4] 3706         call STORE 
      009682 CC 8A 15         [ 2] 3707         jp ZERO
      009685 81               [ 4] 3708         ret           
                                   3709         
                                   3710 
                                   3711 ;       ]       ( -- )
                                   3712 ;       Start compiling words in
                                   3713 ;       input stream.
      009686 96 50                 3714         .word      LINK
                           001608  3715 LINK = . 
      009688 01                    3716         .byte      1
      009689 5D                    3717         .ascii     "]"
      00968A                       3718 RBRAC:
      00968A CD 83 DF         [ 4] 3719         CALL   DOLIT
      00968D 95 F8                 3720         .word  SCOMP
      00968F CD 86 00         [ 4] 3721         CALL   TEVAL
      009692 CC 84 46         [ 2] 3722         JP     STORE
                                   3723 
                                   3724 ;       CALL,    ( ca -- )
                                   3725 ;       Compile a subroutine call.
      009695 96 88                 3726         .word      LINK
                           001617  3727 LINK = . 
      009697 05                    3728         .byte      5
      009698 43 41 4C 4C 2C        3729         .ascii     "CALL,"
      00969D                       3730 JSRC:
      00969D CD 83 DF         [ 4] 3731         CALL     DOLIT
      0096A0 00 CD                 3732         .word     CALLL     ;CALL
      0096A2 CD 93 EA         [ 4] 3733         CALL     CCOMMA
      0096A5 CC 93 D3         [ 2] 3734         JP     COMMA
                                   3735 
                                   3736 ;       :       ( -- ; <string> )
                                   3737 ;       Start a new colon definition
                                   3738 ;       using next word as its name.
      0096A8 96 97                 3739         .word      LINK
                           00162A  3740 LINK = . 
      0096AA 01                    3741         .byte      1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0096AB 3A                    3742         .ascii     ":"
      0096AC                       3743 COLON:
      0096AC CD 90 8D         [ 4] 3744         CALL   TOKEN
      0096AF CD 95 B1         [ 4] 3745         CALL   SNAME
      0096B2 CC 96 8A         [ 2] 3746         JP     RBRAC
                                   3747 
                                   3748 ;       I:  ( -- )
                                   3749 ;       Start interrupt service routine definition
                                   3750 ;       those definition have no name.
      0096B5 96 AA                 3751         .word LINK
                           001637  3752         LINK=.
      0096B7 02                    3753         .byte 2 
      0096B8 49 3A                 3754         .ascii "I:" 
      0096BA                       3755 ICOLON:
      0096BA CC 96 8A         [ 2] 3756         jp RBRAC  
                                   3757 
                                   3758 ;       IMMEDIATE       ( -- )
                                   3759 ;       Make last compiled word
                                   3760 ;       an immediate word.
      0096BD 96 B7                 3761         .word      LINK
                           00163F  3762 LINK = . 
      0096BF 09                    3763         .byte      9
      0096C0 49 4D 4D 45 44 49 41  3764         .ascii     "IMMEDIATE"
             54 45
      0096C9                       3765 IMMED:
      0096C9 CD 83 DF         [ 4] 3766         CALL     DOLIT
      0096CC 80 00                 3767         .word     0x8000	;  IMEDD*256
      0096CE CD 86 4E         [ 4] 3768         CALL     LAST
      0096D1 CD 84 5D         [ 4] 3769         CALL     AT
      0096D4 CD 84 5D         [ 4] 3770         CALL     AT
      0096D7 CD 85 64         [ 4] 3771         CALL     ORR
      0096DA CD 86 4E         [ 4] 3772         CALL     LAST
      0096DD CD 84 5D         [ 4] 3773         CALL     AT
      0096E0 CC 84 46         [ 2] 3774         JP     STORE
                                   3775 
                                   3776 ;; Defining words
                                   3777 
                                   3778 ;       CREATE  ( -- ; <string> )
                                   3779 ;       Compile a new array
                                   3780 ;       without allocating space.
      0096E3 96 BF                 3781         .word      LINK
                           001665  3782 LINK = . 
      0096E5 06                    3783         .byte      6
      0096E6 43 52 45 41 54 45     3784         .ascii     "CREATE"
      0096EC                       3785 CREAT:
      0096EC CD 90 8D         [ 4] 3786         CALL     TOKEN
      0096EF CD 95 B1         [ 4] 3787         CALL     SNAME
      0096F2 CD 96 2C         [ 4] 3788         CALL     OVERT        
      0096F5 CD 94 18         [ 4] 3789         CALL     COMPI 
      0096F8 85 B1                 3790         .word DOVAR 
      0096FA 81               [ 4] 3791         RET
                                   3792 
                                   3793 ;       VARIABLE        ( -- ; <string> )
                                   3794 ;       Compile a new variable
                                   3795 ;       initialized to 0.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0096FB 96 E5                 3796         .word      LINK
                           00167D  3797 LINK = . 
      0096FD 08                    3798         .byte      8
      0096FE 56 41 52 49 41 42 4C  3799         .ascii     "VARIABLE"
             45
      009706                       3800 VARIA:
                                   3801 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      009706 CD 8B 03         [ 4] 3802         CALL HERE
      009709 CD 85 04         [ 4] 3803         CALL DUPP 
      00970C CD 89 7E         [ 4] 3804         CALL CELLP
      00970F CD 86 30         [ 4] 3805         CALL VPP 
      009712 CD 84 46         [ 4] 3806         CALL STORE
      009715 CD 96 EC         [ 4] 3807         CALL CREAT
      009718 CD 85 04         [ 4] 3808         CALL DUPP
      00971B CD 93 D3         [ 4] 3809         CALL COMMA
      00971E CD 8A 15         [ 4] 3810         CALL ZERO
      009721 CD 85 14         [ 4] 3811         call SWAPP 
      009724 CD 84 46         [ 4] 3812         CALL STORE
      009727 CD 9A BD         [ 4] 3813         call UPDATVP  ; don't update if variable kept in RAM.
      00972A CD 9E 71         [ 4] 3814         CALL UPDATPTR
      00972D 81               [ 4] 3815         RET         
                                   3816 
                                   3817 
                                   3818 ;       CONSTANT  ( n -- ; <string> )
                                   3819 ;       Compile a new constant 
                                   3820 ;       n CONSTANT name 
      00972E 96 FD                 3821         .word LINK 
                           0016B0  3822         LINK=. 
      009730 08                    3823         .byte 8 
      009731 43 4F 4E 53 54 41 4E  3824         .ascii "CONSTANT" 
             54
      009739                       3825 CONSTANT:          
      009739 CD 90 8D         [ 4] 3826         CALL TOKEN
      00973C CD 95 B1         [ 4] 3827         CALL SNAME 
      00973F CD 96 2C         [ 4] 3828         CALL OVERT 
      009742 CD 94 18         [ 4] 3829         CALL COMPI 
      009745 97 58                 3830         .word DOCONST
      009747 CD 93 D3         [ 4] 3831         CALL COMMA 
      00974A CD 9E 71         [ 4] 3832         CALL UPDATPTR  
      00974D 81               [ 4] 3833 1$:     RET          
                                   3834 
                                   3835 ; CONSTANT runtime semantic 
                                   3836 ; doCONST  ( -- n )
      00974E 97 30                 3837         .word LINK 
                           0016D0  3838         LINK=.
      009750 07                    3839         .byte 7
      009751 44 4F 43 4F 4E 53 54  3840         .ascii "DOCONST"
      009758                       3841 DOCONST:
      009758 1D 00 02         [ 2] 3842         subw x,#CELLL
      00975B 90 85            [ 2] 3843         popw y 
      00975D 90 FE            [ 2] 3844         ldw y,(y) 
      00975F FF               [ 2] 3845         ldw (x),y 
      009760 81               [ 4] 3846         ret 
                                   3847 
                                   3848 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3849 ;; Tools
                                   3850 
                                   3851 ;       _TYPE   ( b u -- )
                                   3852 ;       Display a string. Filter
                                   3853 ;       non-printing characters.
      009761 97 50                 3854         .word      LINK
                           0016E3  3855 LINK = . 
      009763 05                    3856         .byte      5
      009764 5F 54 59 50 45        3857         .ascii     "_TYPE"
      009769                       3858 UTYPE:
      009769 CD 84 CD         [ 4] 3859         CALL     TOR     ;start count down loop
      00976C 20 0F            [ 2] 3860         JRA     UTYP2   ;skip first pass
      00976E CD 85 04         [ 4] 3861 UTYP1:  CALL     DUPP
      009771 CD 84 7B         [ 4] 3862         CALL     CAT
      009774 CD 8A 3F         [ 4] 3863         CALL     TCHAR
      009777 CD 83 C9         [ 4] 3864         CALL     EMIT    ;display only printable
      00977A CD 89 A9         [ 4] 3865         CALL     ONEP    ;increment address
      00977D CD 83 F3         [ 4] 3866 UTYP2:  CALL     DONXT
      009780 97 6E                 3867         .word      UTYP1   ;loop till done
      009782 CC 84 FA         [ 2] 3868         JP     DROP
                                   3869 
                                   3870 ;       dm+     ( a u -- a )
                                   3871 ;       Dump u bytes from ,
                                   3872 ;       leaving a+u on  stack.
      009785 97 63                 3873         .word      LINK
                           001707  3874 LINK = . 
      009787 03                    3875         .byte      3
      009788 64 6D 2B              3876         .ascii     "dm+"
      00978B                       3877 DUMPP:
      00978B CD 85 2E         [ 4] 3878         CALL     OVER
      00978E CD 83 DF         [ 4] 3879         CALL     DOLIT
      009791 00 04                 3880         .word      4
      009793 CD 8E E3         [ 4] 3881         CALL     UDOTR   ;display address
      009796 CD 8E 33         [ 4] 3882         CALL     SPACE
      009799 CD 84 CD         [ 4] 3883         CALL     TOR     ;start count down loop
      00979C 20 11            [ 2] 3884         JRA     PDUM2   ;skip first pass
      00979E CD 85 04         [ 4] 3885 PDUM1:  CALL     DUPP
      0097A1 CD 84 7B         [ 4] 3886         CALL     CAT
      0097A4 CD 83 DF         [ 4] 3887         CALL     DOLIT
      0097A7 00 03                 3888         .word      3
      0097A9 CD 8E E3         [ 4] 3889         CALL     UDOTR   ;display numeric data
      0097AC CD 89 A9         [ 4] 3890         CALL     ONEP    ;increment address
      0097AF CD 83 F3         [ 4] 3891 PDUM2:  CALL     DONXT
      0097B2 97 9E                 3892         .word      PDUM1   ;loop till done
      0097B4 81               [ 4] 3893         RET
                                   3894 
                                   3895 ;       DUMP    ( a u -- )
                                   3896 ;       Dump u bytes from a,
                                   3897 ;       in a formatted manner.
      0097B5 97 87                 3898         .word      LINK
                           001737  3899 LINK = . 
      0097B7 04                    3900         .byte      4
      0097B8 44 55 4D 50           3901         .ascii     "DUMP"
      0097BC                       3902 DUMP:
      0097BC CD 85 C1         [ 4] 3903         CALL     BASE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      0097BF CD 84 5D         [ 4] 3904         CALL     AT
      0097C2 CD 84 CD         [ 4] 3905         CALL     TOR
      0097C5 CD 8C BB         [ 4] 3906         CALL     HEX     ;save radix, set hex
      0097C8 CD 83 DF         [ 4] 3907         CALL     DOLIT
      0097CB 00 10                 3908         .word      16
      0097CD CD 88 CF         [ 4] 3909         CALL     SLASH   ;change count to lines
      0097D0 CD 84 CD         [ 4] 3910         CALL     TOR     ;start count down loop
      0097D3 CD 8E 7B         [ 4] 3911 DUMP1:  CALL     CR
      0097D6 CD 83 DF         [ 4] 3912         CALL     DOLIT
      0097D9 00 10                 3913         .word      16
      0097DB CD 86 9A         [ 4] 3914         CALL     DDUP
      0097DE CD 97 8B         [ 4] 3915         CALL     DUMPP   ;display numeric
      0097E1 CD 86 6F         [ 4] 3916         CALL     ROT
      0097E4 CD 86 6F         [ 4] 3917         CALL     ROT
      0097E7 CD 8E 33         [ 4] 3918         CALL     SPACE
      0097EA CD 8E 33         [ 4] 3919         CALL     SPACE
      0097ED CD 97 69         [ 4] 3920         CALL     UTYPE   ;display printable characters
      0097F0 CD 83 F3         [ 4] 3921         CALL     DONXT
      0097F3 97 D3                 3922         .word      DUMP1   ;loop till done
      0097F5 CD 84 FA         [ 4] 3923 DUMP3:  CALL     DROP
      0097F8 CD 84 AE         [ 4] 3924         CALL     RFROM
      0097FB CD 85 C1         [ 4] 3925         CALL     BASE
      0097FE CC 84 46         [ 2] 3926         JP     STORE   ;restore radix
                                   3927 
                                   3928 ;       .S      ( ... -- ... )
                                   3929 ;        Display  contents of stack.
      009801 97 B7                 3930         .word      LINK
                           001783  3931 LINK = . 
      009803 02                    3932         .byte      2
      009804 2E 53                 3933         .ascii     ".S"
      009806                       3934 DOTS:
      009806 CD 8E 7B         [ 4] 3935         CALL     CR
      009809 CD 8A 57         [ 4] 3936         CALL     DEPTH   ;stack depth
      00980C CD 84 CD         [ 4] 3937         CALL     TOR     ;start count down loop
      00980F 20 09            [ 2] 3938         JRA     DOTS2   ;skip first pass
      009811 CD 84 C1         [ 4] 3939 DOTS1:  CALL     RAT
      009814 CD 8A 6E         [ 4] 3940 	CALL     PICK
      009817 CD 8F 16         [ 4] 3941         CALL     DOT     ;index stack, display contents
      00981A CD 83 F3         [ 4] 3942 DOTS2:  CALL     DONXT
      00981D 98 11                 3943         .word      DOTS1   ;loop till done
      00981F CD 8E BA         [ 4] 3944         CALL     DOTQP
      009822 05                    3945         .byte      5
      009823 20 3C 73 70 20        3946         .ascii     " <sp "
      009828 81               [ 4] 3947         RET
                                   3948 
                                   3949 ;       >NAME   ( ca -- na | F )
                                   3950 ;       Convert code address
                                   3951 ;       to a name address.
      009829 98 03                 3952         .word      LINK
                           0017AB  3953 LINK = . 
      00982B 05                    3954         .byte      5
      00982C 3E 4E 41 4D 45        3955         .ascii     ">NAME"
      009831                       3956 TNAME:
      009831 CD 86 22         [ 4] 3957         CALL     CNTXT   ;vocabulary link
      009834 CD 84 5D         [ 4] 3958 TNAM2:  CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009837 CD 85 04         [ 4] 3959         CALL     DUPP    ;?last word in a vocabulary
      00983A CD 84 12         [ 4] 3960         CALL     QBRAN
      00983D 98 58                 3961         .word      TNAM4
      00983F CD 86 9A         [ 4] 3962         CALL     DDUP
      009842 CD 90 9B         [ 4] 3963         CALL     NAMET
      009845 CD 85 79         [ 4] 3964         CALL     XORR    ;compare
      009848 CD 84 12         [ 4] 3965         CALL     QBRAN
      00984B 98 52                 3966         .word      TNAM3
      00984D CD 89 8D         [ 4] 3967         CALL     CELLM   ;continue with next word
      009850 20 E2            [ 2] 3968         JRA     TNAM2
      009852 CD 85 14         [ 4] 3969 TNAM3:  CALL     SWAPP
      009855 CC 84 FA         [ 2] 3970         JP     DROP
      009858 CD 86 8F         [ 4] 3971 TNAM4:  CALL     DDROP
      00985B CC 8A 15         [ 2] 3972         JP     ZERO
                                   3973 
                                   3974 ;       .ID     ( na -- )
                                   3975 ;        Display  name at address.
      00985E 98 2B                 3976         .word      LINK
                           0017E0  3977 LINK = . 
      009860 03                    3978         .byte      3
      009861 2E 49 44              3979         .ascii     ".ID"
      009864                       3980 DOTID:
      009864 CD 86 5E         [ 4] 3981         CALL     QDUP    ;if zero no name
      009867 CD 84 12         [ 4] 3982         CALL     QBRAN
      00986A 98 7A                 3983         .word      DOTI1
      00986C CD 8A EC         [ 4] 3984         CALL     COUNT
      00986F CD 83 DF         [ 4] 3985         CALL     DOLIT
      009872 00 1F                 3986         .word      0x1F
      009874 CD 85 50         [ 4] 3987         CALL     ANDD    ;mask lexicon bits
      009877 CC 97 69         [ 2] 3988         JP     UTYPE
      00987A CD 8E BA         [ 4] 3989 DOTI1:  CALL     DOTQP
      00987D 09                    3990         .byte      9
      00987E 20 6E 6F 4E 61 6D 65  3991         .ascii     " noName"
      009885 81               [ 4] 3992         RET
                                   3993 
                           000000  3994 WANT_SEE=0
                           000000  3995 .if WANT_SEE 
                                   3996 ;       SEE     ( -- ; <string> )
                                   3997 ;       A simple decompiler.
                                   3998 ;       Updated for byte machines.
                                   3999         .word      LINK
                                   4000 LINK = . 
                                   4001         .byte      3
                                   4002         .ascii     "SEE"
                                   4003 SEE:
                                   4004         CALL     TICK    ;starting address
                                   4005         CALL     CR
                                   4006         CALL     ONEM
                                   4007 SEE1:   CALL     ONEP
                                   4008         CALL     DUPP
                                   4009         CALL     AT
                                   4010         CALL     DUPP
                                   4011         CALL     QBRAN
                                   4012         .word    SEE2
                                   4013         CALL     TNAME   ;?is it a name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                   4014 SEE2:   CALL     QDUP    ;name address or zero
                                   4015         CALL     QBRAN
                                   4016         .word    SEE3
                                   4017         CALL     SPACE
                                   4018         CALL     DOTID   ;display name
                                   4019         CALL     ONEP
                                   4020         JRA      SEE4
                                   4021 SEE3:   CALL     DUPP
                                   4022         CALL     CAT
                                   4023         CALL     UDOT    ;display number
                                   4024 SEE4:   CALL     NUFQ    ;user control
                                   4025         CALL     QBRAN
                                   4026         .word    SEE1
                                   4027         JP     DROP
                                   4028 .endif ; WANT_SEE 
                                   4029 
                                   4030 ;       WORDS   ( -- )
                                   4031 ;       Display names in vocabulary.
      009886 98 60                 4032         .word      LINK
                           001808  4033 LINK = . 
      009888 05                    4034         .byte      5
      009889 57 4F 52 44 53        4035         .ascii     "WORDS"
      00988E                       4036 WORDS:
      00988E CD 8E 7B         [ 4] 4037         CALL     CR
      009891 CD 86 22         [ 4] 4038         CALL     CNTXT   ;only in context
      009894 CD 84 5D         [ 4] 4039 WORS1:  CALL     AT
      009897 CD 86 5E         [ 4] 4040         CALL     QDUP    ;?at end of list
      00989A CD 84 12         [ 4] 4041         CALL     QBRAN
      00989D 98 B0                 4042         .word      WORS2
      00989F CD 85 04         [ 4] 4043         CALL     DUPP
      0098A2 CD 8E 33         [ 4] 4044         CALL     SPACE
      0098A5 CD 98 64         [ 4] 4045         CALL     DOTID   ;display a name
      0098A8 CD 89 8D         [ 4] 4046         CALL     CELLM
      0098AB CD 84 29         [ 4] 4047         CALL     BRAN
      0098AE 98 94                 4048         .word      WORS1
      0098B0 81               [ 4] 4049 WORS2:  RET
                                   4050 
                                   4051         
                                   4052 ;; Hardware reset
                                   4053 
                                   4054 ;       hi      ( -- )
                                   4055 ;       Display sign-on message.
      0098B1 98 88                 4056         .word      LINK
                           001833  4057 LINK = . 
      0098B3 02                    4058         .byte      2
      0098B4 68 69                 4059         .ascii     "hi"
      0098B6                       4060 HI:
      0098B6 CD 8E 7B         [ 4] 4061         CALL     CR
      0098B9 CD 8E BA         [ 4] 4062         CALL     DOTQP   ;initialize I/O
      0098BC 0F                    4063         .byte      15
      0098BD 73 74 6D 38 65 46 6F  4064         .ascii     "stm8eForth v"
             72 74 68 20 76
      0098C9 33                    4065 	.byte      VER+'0'
      0098CA 2E                    4066         .byte      '.' 
      0098CB 30                    4067 	.byte      EXT+'0' ;version
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0098CC CC 8E 7B         [ 2] 4068         JP     CR
                                   4069 
                           000000  4070 WANT_DEBUG=0
                           000000  4071 .if WANT_DEBUG 
                                   4072 ;       DEBUG      ( -- )
                                   4073 ;       Display sign-on message.
                                   4074 ;        .word      LINK
                                   4075 LINK = . 
                                   4076         .byte      5
                                   4077         .ascii     "DEBUG"
                                   4078 DEBUG:
                                   4079 	CALL DOLIT
                                   4080 	.word 0x65
                                   4081 	CALL EMIT
                                   4082 	CALL DOLIT
                                   4083 	.word 0
                                   4084  	CALL ZLESS 
                                   4085 	CALL DOLIT
                                   4086 	.word 0xFFFE
                                   4087 	CALL ZLESS 
                                   4088 	CALL UPLUS 
                                   4089  	CALL DROP 
                                   4090 	CALL DOLIT
                                   4091 	.word 3
                                   4092 	CALL UPLUS 
                                   4093 	CALL UPLUS 
                                   4094  	CALL DROP
                                   4095 	CALL DOLIT
                                   4096 	.word 0x43
                                   4097 	CALL UPLUS 
                                   4098  	CALL DROP
                                   4099 	CALL EMIT
                                   4100 	CALL DOLIT
                                   4101 	.word 0x4F
                                   4102 	CALL DOLIT
                                   4103 	.word 0x6F
                                   4104  	CALL XORR
                                   4105 	CALL DOLIT
                                   4106 	.word 0xF0
                                   4107  	CALL ANDD
                                   4108 	CALL DOLIT
                                   4109 	.word 0x4F
                                   4110  	CALL ORR
                                   4111 	CALL EMIT
                                   4112 	CALL DOLIT
                                   4113 	.word 8
                                   4114 	CALL DOLIT
                                   4115 	.word 6
                                   4116  	CALL SWAPP
                                   4117 	CALL OVER
                                   4118 	CALL XORR
                                   4119 	CALL DOLIT
                                   4120 	.word 3
                                   4121 	CALL ANDD 
                                   4122 	CALL ANDD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                   4123 	CALL DOLIT
                                   4124 	.word 0x70
                                   4125 	CALL UPLUS 
                                   4126 	CALL DROP
                                   4127 	CALL EMIT
                                   4128 	CALL DOLIT
                                   4129 	.word 0
                                   4130 	CALL QBRAN
                                   4131 	.word DEBUG1
                                   4132 	CALL DOLIT
                                   4133 	.word 0x3F
                                   4134 DEBUG1:
                                   4135 	CALL DOLIT
                                   4136 	.word 0xFFFF
                                   4137 	CALL QBRAN
                                   4138 	.word DEBUG2
                                   4139 	CALL DOLIT
                                   4140 	.word 0x74
                                   4141 	CALL BRAN
                                   4142 	.word DEBUG3
                                   4143 DEBUG2:
                                   4144 	CALL DOLIT
                                   4145 	.word 0x21
                                   4146 DEBUG3:
                                   4147 	CALL EMIT
                                   4148 	CALL DOLIT
                                   4149 	.word 0x68
                                   4150 	CALL DOLIT
                                   4151 	.word 0x80
                                   4152 	CALL STORE
                                   4153 	CALL DOLIT
                                   4154 	.word 0x80
                                   4155 	CALL AT
                                   4156 	CALL EMIT
                                   4157 	CALL DOLIT
                                   4158 	.word 0x4D
                                   4159 	CALL TOR
                                   4160 	CALL RAT
                                   4161 	CALL RFROM
                                   4162 	CALL ANDD
                                   4163 	CALL EMIT
                                   4164 	CALL DOLIT
                                   4165 	.word 0x61
                                   4166 	CALL DOLIT
                                   4167 	.word 0xA
                                   4168 	CALL TOR
                                   4169 DEBUG4:
                                   4170 	CALL DOLIT
                                   4171 	.word 1
                                   4172 	CALL UPLUS 
                                   4173 	CALL DROP
                                   4174 	CALL DONXT
                                   4175 	.word DEBUG4
                                   4176 	CALL EMIT
                                   4177 	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4178 	.word 0x656D
                                   4179 	CALL DOLIT
                                   4180 	.word 0x100
                                   4181 	CALL UMSTA
                                   4182 	CALL SWAPP
                                   4183 	CALL DOLIT
                                   4184 	.word 0x100
                                   4185 	CALL UMSTA
                                   4186 	CALL SWAPP 
                                   4187 	CALL DROP
                                   4188 	CALL EMIT
                                   4189 	CALL EMIT
                                   4190 	CALL DOLIT
                                   4191 	.word 0x2043
                                   4192 	CALL DOLIT
                                   4193 	.word 0
                                   4194 	CALL DOLIT
                                   4195 	.word 0x100
                                   4196 	CALL UMMOD
                                   4197 	CALL EMIT
                                   4198 	CALL EMIT
                                   4199 	;JP ORIG
                                   4200 	RET
                                   4201 .endif ; WANT_DEBUG 
                                   4202 
                                   4203 
                                   4204 ;       'BOOT   ( -- a )
                                   4205 ;       The application startup vector.
      0098CF 98 B3                 4206         .word      LINK
                           001851  4207 LINK = . 
      0098D1 05                    4208         .byte      5
      0098D2 27 42 4F 4F 54        4209         .ascii     "'BOOT"
      0098D7                       4210 TBOOT:
      0098D7 CD 85 B1         [ 4] 4211         CALL     DOVAR
      0098DA 40 02                 4212         .word    APP_RUN      ;application to boot
                                   4213 
                                   4214 ;       COLD    ( -- )
                                   4215 ;       The hilevel cold start s=ence.
      0098DC 98 D1                 4216         .word      LINK
                           00185E  4217         LINK = . 
      0098DE 04                    4218         .byte      4
      0098DF 43 4F 4C 44           4219         .ascii     "COLD"
      0098E3                       4220 COLD:
                           000000  4221 .if WANT_DEBUG
                                   4222         CALL DEBUG
                                   4223 .endif ; WANT_DEBUG
      0098E3 CD 83 DF         [ 4] 4224 COLD1:  CALL     DOLIT
      0098E6 80 AB                 4225         .word      UZERO
      0098E8 CD 83 DF         [ 4] 4226 	CALL     DOLIT
      0098EB 00 06                 4227         .word      UPP
      0098ED CD 83 DF         [ 4] 4228         CALL     DOLIT
      0098F0 00 16                 4229 	.word      UEND-UZERO
      0098F2 CD 8B 50         [ 4] 4230         CALL     CMOVE   ;initialize user area
                                   4231 
                                   4232 ; if APP_RUN==0 initialize with ca de 'hi'  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      0098F5 90 CE 40 02      [ 2] 4233         ldw y,APP_RUN 
      0098F9 26 0B            [ 1] 4234         jrne 0$
      0098FB 1D 00 02         [ 2] 4235         subw x,#CELLL 
      0098FE 90 AE 98 B6      [ 2] 4236         ldw y,#HI  
      009902 FF               [ 2] 4237         ldw (x),y
      009903 CD 9A 95         [ 4] 4238         call UPDATRUN 
      009906                       4239 0$:        
                                   4240 ; update LAST with APP_LAST 
                                   4241 ; if APP_LAST > LAST else do the opposite
      009906 90 CE 40 00      [ 2] 4242         ldw y,APP_LAST 
      00990A 90 B3 1A         [ 2] 4243         cpw y,ULAST 
      00990D 22 05            [ 1] 4244         jrugt 1$ 
                                   4245 ; save LAST at APP_LAST  
      00990F CD 9A 7D         [ 4] 4246         call UPDATLAST 
      009912 20 06            [ 2] 4247         jra 2$
      009914                       4248 1$: ; update LAST with APP_LAST 
      009914 90 BF 1A         [ 2] 4249         ldw ULAST,y
      009917 90 BF 14         [ 2] 4250         ldw UCNTXT,y
      00991A                       4251 2$:  
                                   4252 ; update APP_CP if < app_space 
      00991A 90 CE 40 04      [ 2] 4253         ldw y,APP_CP  
      00991E 90 B3 18         [ 2] 4254         cpw y,UCP   
      009921 24 06            [ 1] 4255         jruge 3$ 
      009923 CD 9A A6         [ 4] 4256         call UPDATCP
      009926 90 BE 18         [ 2] 4257         ldw y,UCP   
      009929                       4258 3$:
      009929 90 BF 18         [ 2] 4259         ldw UCP,y                 
                                   4260 ; update UVP with APP_VP  
                                   4261 ; if APP_VP>UVP else do the opposite 
      00992C 90 CE 40 06      [ 2] 4262         ldw y,APP_VP 
      009930 90 B3 16         [ 2] 4263         cpw y,UVP 
      009933 22 05            [ 1] 4264         jrugt 4$
      009935 CD 9A BD         [ 4] 4265         call UPDATVP 
      009938 20 03            [ 2] 4266         jra 6$
      00993A                       4267 4$: ; update UVP with APP_VP 
      00993A 90 BF 16         [ 2] 4268         ldw UVP,y 
      00993D                       4269 6$:      
      00993D CD 93 7E         [ 4] 4270         CALL     PRESE   ;initialize data stack and TIB
      009940 CD 98 D7         [ 4] 4271         CALL     TBOOT
      009943 CD 8B 39         [ 4] 4272         CALL     ATEXE   ;application boot
      009946 CD 96 2C         [ 4] 4273         CALL     OVERT
      009949 CC 93 9B         [ 2] 4274         JP     QUIT    ;start interpretation
                                   4275 
                           000001  4276 WANT_MATH_CONST = 1 
                           000001  4277 .if WANT_MATH_CONST 
                                   4278         ; irrational constants 
                                   4279         ; approximation by integers ratio.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4280         .include "../const_ratio.asm"
                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019,2020 
                                      3 ; This file is part of stm8_eForth  
                                      4 ;
                                      5 ;     stm8_eForth is free software: you can redistribute it and/or modify
                                      6 ;     it under the terms of the GNU General Public License as published by
                                      7 ;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;     (at your option) any later version.
                                      9 ;
                                     10 ;     stm8_eForth is distributed in the hope that it will be useful,
                                     11 ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                     12 ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;     GNU General Public License for more details.
                                     14 ;
                                     15 ;     You should have received a copy of the GNU General Public License
                                     16 ;     along with stm8_eForth.  If not, see <http://www.gnu.org/licenses/>.
                                     17 ;;
                                     18 
                                     19 ;--------------------------------------------------------------------
                                     20 ; Irrationals constants 
                                     21 ; expressed as 2 integers ratio
                                     22 ; aproximation. These are to be used with scaling operators */ and */MOD 
                                     23 ; REF: https://www.forth.com/starting-forth/5-fixed-point-arithmetic/
                                     24 ;---------------------------------------------------------------------
                                     25 
                                     26 ;       PI ( --  355 113 )
                                     27 ; precision 8.5e-8 
                                     28 ; usage example to compute circle area
                                     29 ; : CAREA DUP * PI */ ;
                                     30 ; 
      00994C 98 DE                   31         .word LINK 
                           0018CE    32         LINK=.
      00994E 02                      33         .byte 2
      00994F 50 49                   34         .ascii "PI" 
      009951                         35 PII:
      009951 1D 00 04         [ 2]   36         subw x,#2*CELLL 
      009954 90 AE 01 63      [ 2]   37         ldw y,#355 
      009958 EF 02            [ 2]   38         ldw (2,x),y 
      00995A 90 AE 00 71      [ 2]   39         ldw y,#113 
      00995E FF               [ 2]   40         ldw (x),y 
      00995F 81               [ 4]   41         ret 
                                     42 
                                     43 ;      SQRT2 ( -- 19601  13860 )
                                     44 ; precision: 1.5e-9 
                                     45 ; usage example to compute Voltage peek to peek from Vrms 
                                     46 ; : VPP SQRT2 */ 2 * ;
                                     47 ;
      009960 99 4E                   48         .word LINK 
                           0018E2    49         LINK=.
      009962 05                      50         .byte 5 
      009963 53 51 52 54 32          51         .ascii "SQRT2" 
      009968                         52 SQRT2:
      009968 1D 00 04         [ 2]   53         subw x,#2*CELLL 
      00996B 90 AE 4C 91      [ 2]   54         ldw y,#19601 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      00996F EF 02            [ 2]   55         ldw (2,x),y 
      009971 90 AE 36 24      [ 2]   56         ldw y,#13860 
      009975 FF               [ 2]   57         ldw (x),y 
      009976 81               [ 4]   58         ret 
                                     59 
                                     60 ;   SQRT3 ( -- 18817 10864 )
                                     61 ; precision: 1.1e-9
                                     62 ;
      009977 99 62                   63         .word LINK 
                           0018F9    64         LINK=.
      009979 05                      65         .byte 5
      00997A 53 51 52 54 33          66         .ascii "SQRT3" 
      00997F                         67 SQRT3: 
      00997F 1D 00 04         [ 2]   68     subw x,#2*CELLL 
      009982 90 AE 49 81      [ 2]   69     ldw y,#18817 
      009986 EF 02            [ 2]   70     ldw (2,x),y 
      009988 90 AE 2A 70      [ 2]   71     ldw y,#10864 
      00998C FF               [ 2]   72     ldw (x),y 
      00998D 81               [ 4]   73     ret 
                                     74 
                                     75 ;   E ( -- 28667 10546 )
                                     76 ; precision: 5.5e-9 
                                     77 ; natural log base 
      00998E 99 79                   78         .word LINK 
                           001910    79         LINK=.
      009990 01                      80         .byte 1
      009991 45                      81         .ascii "E" 
      009992                         82 ENEPER:
      009992 1D 00 04         [ 2]   83     subw x,#2*CELLL 
      009995 90 AE 6F FB      [ 2]   84     ldw y,#28667 
      009999 EF 02            [ 2]   85     ldw (2,x),y 
      00999B 90 AE 29 32      [ 2]   86     ldw y,#10546 
      00999F FF               [ 2]   87     ldw (x),y 
      0099A0 81               [ 4]   88     ret 
                                     89 
                                     90 ;   SQRT10 ( -- 22936 7253 )
                                     91 ; precision: 5.7e-9 
      0099A1 99 90                   92         .word LINK 
                           001923    93         LINK=.
      0099A3 06                      94         .byte 6 
      0099A4 53 51 52 54 31 30       95         .ascii "SQRT10" 
      0099AA                         96 SQRT10:
      0099AA 1D 00 04         [ 2]   97     subw x,#2*CELLL
      0099AD 90 AE 59 98      [ 2]   98     ldw y,#22936 
      0099B1 EF 02            [ 2]   99     ldw (2,x),y 
      0099B3 90 AE 1C 55      [ 2]  100     ldw y,#7253
      0099B7 FF               [ 2]  101     ldw (x),y 
      0099B8 81               [ 4]  102     ret 
                                    103 
                                    104 ;   12RT2 ( -- 26797 25293 )
                                    105 ; precision: 1.0e-9 
                                    106 ; used in music to compute well tempered scale
      0099B9 99 A3                  107         .word LINK 
                           00193B   108         LINK=. 
      0099BB 05                     109         .byte 5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0099BC 31 32 52 54 32         110         .ascii "12RT2"
      0099C1                        111 RT12_2:
      0099C1 1D 00 04         [ 2]  112     subw x,#2*CELLL 
      0099C4 90 AE 68 AD      [ 2]  113     ldw y,#26797
      0099C8 EF 02            [ 2]  114     ldw (2,x),y 
      0099CA 90 AE 62 CD      [ 2]  115     ldw y,#25293
      0099CE FF               [ 2]  116     ldw (x),y 
      0099CF 81               [ 4]  117     ret 
                                    118 
                                    119 ;   LOG2s ( -- 2040 11103 )
                                    120 ; log(2)/1.6384
                                    121 ; precision: 1.1e-8
      0099D0 99 BB                  122         .word LINK 
                           001952   123         LINK=.
      0099D2 05                     124         .byte 5 
      0099D3 4C 4F 47 32 53         125         .ascii "LOG2S" 
      0099D8                        126 LOG2S:
      0099D8 1D 00 04         [ 2]  127     subw x,#2*CELLL
      0099DB 90 AE 07 F8      [ 2]  128     ldw y,#2040 
      0099DF EF 02            [ 2]  129     ldw (2,x),y 
      0099E1 90 AE 2B 5F      [ 2]  130     ldw y,#11103 
      0099E5 FF               [ 2]  131     ldw (x),y 
      0099E6 81               [ 4]  132     ret 
                                    133 
                                    134 ;   LN2 ( -- 485 11464 )
                                    135 ; ln(2)/16.384 
                                    136 ; precision: 1.0e-7 
      0099E7 99 D2                  137         .word LINK 
                           001969   138         LINK=.
      0099E9 04                     139         .byte 4 
      0099EA 4C 4E 32 53            140         .ascii "LN2S" 
      0099EE                        141 LN2S: 
      0099EE 1D 00 04         [ 2]  142     subw x,#2*CELLL
      0099F1 90 AE 01 E5      [ 2]  143     ldw y,#485
      0099F5 EF 02            [ 2]  144     ldw (2,x),y 
      0099F7 90 AE 2C C8      [ 2]  145     ldw y,#11464 
      0099FB FF               [ 2]  146     ldw (x),y 
      0099FC 81               [ 4]  147     ret 
                                    148 
                                    149 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4281 .endif ; WANT_MATH_CONST
                                   4282 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4283         .include "flash_disco.asm"
                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019,2020 
                                      3 ; This file is part of stm8_eForth  
                                      4 ;
                                      5 ;     stm8_eForth is free software: you can redistribute it and/or modify
                                      6 ;     it under the terms of the GNU General Public License as published by
                                      7 ;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;     (at your option) any later version.
                                      9 ;
                                     10 ;     stm8_eForth is distributed in the hope that it will be useful,
                                     11 ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                     12 ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;     GNU General Public License for more details.
                                     14 ;
                                     15 ;     You should have received a copy of the GNU General Public License
                                     16 ;     along with stm8_eForth.  If not, see <http://www.gnu.org/licenses/>.
                                     17 ;;
                                     18 
                                     19 
                                     20 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     21 ;  routines to write to FLASH, EEPROM 
                                     22 ;  and OPTION 
                                     23 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     24 
                                     25 
                                     26 ;--------------------------------
                                     27 ; initialize PTR16 
                                     28 ; PTR!  ( a -- )
                                     29 ;---------------------------------
      0099FD 99 E9                   30     .word LINK 
                           00197F    31     LINK=.
      0099FF 03                      32     .byte 3 
      009A00 50 54 52 21             33     .ascii "PTR!"
      009A04                         34 PSTO:
      009A04 90 93            [ 1]   35     ldw y,x
      009A06 90 FE            [ 2]   36     ldw y,(y)
      009A08 90 BF 2C         [ 2]   37     ldw PTR16,y 
      009A0B 1C 00 02         [ 2]   38     addw x,#CELLL 
      009A0E 81               [ 4]   39     ret 
                                     40 
                                     41 ;-----------------------------------
                                     42 ; return EEPROM base address 
                                     43 ; as a double 
                                     44 ;  EEPROM  ( -- a )
                                     45 ;-----------------------------------
      009A0F 99 FF                   46     .word LINK 
                           001991    47 LINK=.
      009A11 06                      48     .byte 6 
      009A12 45 45 50 52 4F 4D       49     .ascii "EEPROM"
      009A18                         50 EEPROM: 
      009A18 90 AE 40 00      [ 2]   51     ldw y,#EEPROM_BASE
      009A1C 1D 00 02         [ 2]   52     subw x,#CELLL 
      009A1F FF               [ 2]   53     ldw (x),y 
      009A20 81               [ 4]   54     ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                     55 
                                     56 ;---------------------------------
                                     57 ; return APP_LAST address
                                     58 ; EEP-LAST ( -- a )
                                     59 ;---------------------------------
      009A21 9A 11                   60 	.word LINK 
                           0019A3    61 	LINK=.
      009A23 08                      62 	.byte 8 
      009A24 45 45 50 2D 4C 41 53    63 	.ascii "EEP-LAST"
             54
      009A2C                         64 EEPLAST:
      009A2C 1D 00 02         [ 2]   65 	subw x,#CELLL 
      009A2F 90 AE 40 00      [ 2]   66 	ldw y,#APP_LAST 
      009A33 EF 02            [ 2]   67 	ldw (2,x),y 
      009A35 81               [ 4]   68 	ret 
                                     69 
                                     70 ;----------------------------------
                                     71 ; return APP_RUN address
                                     72 ; EEP-RUN ( -- a )
                                     73 ;-----------------------------------
      009A36 9A 23                   74 	.word LINK 
                           0019B8    75 	LINK=.
      009A38 07                      76 	.byte 7
      009A39 45 45 50 2D 52 55 4E    77 	.ascii "EEP-RUN"
      009A40                         78 EEPRUN:
      009A40 1D 00 02         [ 2]   79 	subw x,#CELLL 
      009A43 90 AE 40 02      [ 2]   80 	ldw y,#APP_RUN 
      009A47 EF 02            [ 2]   81 	ldw (2,x),y 
      009A49 81               [ 4]   82 	ret 
                                     83 
                                     84 ;------------------------------------
                                     85 ; return APP_CP address
                                     86 ; EEP-CP ( -- a )
                                     87 ;------------------------------------
      009A4A 9A 38                   88 	.word LINK
                           0019CC    89 	LINK=.
      009A4C 06                      90 	.byte 6 
      009A4D 45 45 50 2D 43 50       91 	.ascii "EEP-CP"
      009A53                         92 EEPCP:
      009A53 1D 00 02         [ 2]   93 	subw x,#CELLL 
      009A56 90 AE 40 04      [ 2]   94 	ldw y,#APP_CP  
      009A5A EF 02            [ 2]   95 	ldw (2,x),y 
      009A5C 81               [ 4]   96 	ret 
                                     97 
                                     98 ;------------------------------------
                                     99 ; return APP_VP address  
                                    100 ; EEP-VP ( -- a )
                                    101 ;-------------------------------------
      009A5D 9A 4C                  102 	.word LINK
                           0019DF   103 	LINK=.
      009A5F 06                     104 	.byte 6
      009A60 45 45 50 2D 56 50      105 	.ascii "EEP-VP"
      009A66                        106 EEPVP:
      009A66 1D 00 02         [ 2]  107 	subw x,#CELLL 
      009A69 90 AE 40 06      [ 2]  108 	ldw y,#APP_VP  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009A6D EF 02            [ 2]  109 	ldw (2,x),y 
      009A6F 81               [ 4]  110 	ret 
                                    111 
                                    112 ;----------------------------------
                                    113 ; update APP_LAST with LAST 
                                    114 ; UPDAT-LAST ( -- )
                                    115 ;----------------------------------
      009A70 9A 5F                  116 	.word LINK 
                           0019F2   117 	LINK=.
      009A72 0A                     118 	.byte 10
      009A73 55 50 44 41 54 2D 4C   119 	.ascii "UPDAT-LAST"
             41 53 54
      009A7D                        120 UPDATLAST:
      009A7D CD 86 4E         [ 4]  121 	call LAST
      009A80 CD 84 5D         [ 4]  122 	call AT  
      009A83 CD 9A 2C         [ 4]  123 	call EEPLAST
      009A86 CC 9B BC         [ 2]  124 	jp EESTO 
                                    125 
                                    126 ;---------------------------------
                                    127 ; update APP_RUN 
                                    128 ; UPDAT-RUN ( a -- )
                                    129 ;---------------------------------
      009A89 9A 72                  130 	.word LINK
                           001A0B   131 	LINK=.
      009A8B 09                     132 	.byte 9
      009A8C 55 50 44 41 54 2D 52   133 	.ascii "UPDAT-RUN"
             55 4E
      009A95                        134 UPDATRUN:
      009A95 CD 9A 40         [ 4]  135 	call EEPRUN
      009A98 CC 9B BC         [ 2]  136 	jp EESTO 
                                    137 	
                                    138 ;---------------------------------
                                    139 ; update APP_CP with CP 
                                    140 ; UPDAT-CP ( -- )
                                    141 ;---------------------------------
      009A9B 9A 8B                  142 	.word LINK 
                           001A1D   143 	LINK=.
      009A9D 08                     144 	.byte 8 
      009A9E 55 50 44 41 54 2D 43   145 	.ascii "UPDAT-CP"
             50
      009AA6                        146 UPDATCP:
      009AA6 CD 86 3E         [ 4]  147 	call CPP 
      009AA9 CD 84 5D         [ 4]  148 	call AT 
      009AAC CD 9A 53         [ 4]  149 	call EEPCP 
      009AAF CC 9B BC         [ 2]  150 	jp EESTO 
                                    151 
                                    152 ;----------------------------------
                                    153 ; update APP_VP with VP 
                                    154 ; UPDAT-VP ( -- )
                                    155 ;----------------------------------
      009AB2 9A 9D                  156 	.word LINK
                           001A34   157 	LINK=.
      009AB4 08                     158 	.byte 8 
      009AB5 55 50 44 41 54 2D 56   159 	.ascii "UPDAT-VP" 
             50
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009ABD                        160 UPDATVP:
      009ABD CD 86 30         [ 4]  161 	call VPP 
      009AC0 CD 84 5D         [ 4]  162 	call AT
      009AC3 CD 9A 66         [ 4]  163 	call EEPVP 
      009AC6 CC 9B BC         [ 2]  164 	jp EESTO
                                    165 	
                                    166 
                                    167 ;----------------------------------
                                    168 ; unlock EEPROM/OPT for writing/erasing
                                    169 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    170 ;  UNLKEE   ( -- )
                                    171 ;----------------------------------
      009AC9 9A B4                  172     .word LINK 
                           001A4B   173 LINK=.
      009ACB 06                     174     .byte 6 
      009ACC 55 4E 4C 4B 45 45      175     .ascii "UNLKEE"
      009AD2                        176 unlock_eeprom:
      009AD2 35 00 50 5B      [ 1]  177 	mov FLASH_CR2,#0 
      009AD6 35 FF 50 5C      [ 1]  178 	mov FLASH_NCR2,#0xFF 
      009ADA 35 AE 50 64      [ 1]  179 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009ADE 35 56 50 64      [ 1]  180     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009AE2 72 07 50 5F FB   [ 2]  181 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009AE7 81               [ 4]  182 	ret
                                    183 
                                    184 ;----------------------------------
                                    185 ; unlock FLASH for writing/erasing
                                    186 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    187 ; UNLKFL  ( -- )
                                    188 ;----------------------------------
      009AE8 9A CB                  189     .word LINK 
                           001A6A   190 LINK=. 
      009AEA 06                     191     .byte 6 
      009AEB 55 4E 4C 4B 46 4C      192     .ascii "UNLKFL"    
      009AF1                        193 unlock_flash:
      009AF1 35 00 50 5B      [ 1]  194 	mov FLASH_CR2,#0 
      009AF5 35 FF 50 5C      [ 1]  195 	mov FLASH_NCR2,#0xFF 
      009AF9 35 56 50 62      [ 1]  196 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009AFD 35 AE 50 62      [ 1]  197 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009B01 72 03 50 5F FB   [ 2]  198 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009B06 81               [ 4]  199 	ret
                                    200 
                                    201 ;-----------------------------
                                    202 ; unlock FLASH or EEPROM 
                                    203 ; according to PTR16 address 
                                    204 ;  UNLOCK ( -- )
                                    205 ;-----------------------------
      009B07 9A EA                  206 	.word LINK 
                           001A89   207 	LINK=.
      009B09 06                     208 	.byte 6
      009B0A 55 4E 4C 4F 43 4B      209 	.ascii "UNLOCK"
      009B10                        210 unlock:
                                    211 ; put addr[15:0] in Y, for bounds check.
      009B10 90 BE 2C         [ 2]  212 	ldw y,PTR16   ; Y=addr15:0
      009B13 90 A3 80 00      [ 2]  213     cpw y,#FLASH_BASE
      009B17 24 10            [ 1]  214     jruge 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009B19 90 A3 40 00      [ 2]  215 	cpw y,#EEPROM_BASE  
      009B1D 25 0D            [ 1]  216     jrult 9$
      009B1F 90 A3 48 7F      [ 2]  217 	cpw y,#OPTION_END 
      009B23 22 07            [ 1]  218 	jrugt 9$
      009B25 CD 9A D2         [ 4]  219 	call unlock_eeprom
      009B28 81               [ 4]  220 	ret 
      009B29 CD 9A F1         [ 4]  221 4$: call unlock_flash
      009B2C 81               [ 4]  222 9$: ret 
                                    223 
                                    224 ;-------------------------
                                    225 ; lock write access to 
                                    226 ; FLASH and EEPROM 
                                    227 ; LOCK ( -- )
                                    228 ;-------------------------
      009B2D 9B 09                  229 	.word LINK 
                           001AAF   230 	LINK=.
      009B2F 04                     231 	.byte 4 
      009B30 4C 4F 43 4B            232 	.ascii "LOCK" 
      009B34                        233 lock: 
      009B34 72 13 50 5F      [ 1]  234 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009B38 72 17 50 5F      [ 1]  235 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009B3C 81               [ 4]  236 	ret 
                                    237 
                                    238 ;-------------------------
                                    239 ; increment PTR16 
                                    240 ; INC-PTR ( -- )
                                    241 ;-------------------------
      009B3D 9B 2F                  242 	.word LINK 
                           001ABF   243 	LINK=. 
      009B3F 08                     244 	.byte 8 
      009B40 49 4E 43 2D 50 54 52   245 	.ascii "INC-PTR" 
      009B47                        246 inc_ptr:
      009B47 90 BE 2C         [ 2]  247 	ldw y,PTR16 
      009B4A 90 5C            [ 2]  248 	incw y 
      009B4C 90 BF 2C         [ 2]  249 	ldw PTR16,y
      009B4F 81               [ 4]  250 	 ret 
                                    251 
                                    252 ;----------------------------
                                    253 ; write a byte at address pointed 
                                    254 ; by PTR16 and increment PTR16.
                                    255 ; Expect pointer already initialized 
                                    256 ; and memory unlocked 
                                    257 ; WR-BYTE ( c -- )
                                    258 ;----------------------------
                                    259 
      009B50 9B 3F                  260 	.word LINK 
                           001AD2   261 	LINK=. 
      009B52 07                     262 	.byte 7 
      009B53 57 52 2D 42 59 54 45   263 	.ascii "WR-BYTE" 
                                    264 
      009B5A                        265 WR_BYTE:
      009B5A 90 93            [ 1]  266 	ldw y,x 
      009B5C 90 FE            [ 2]  267 	ldw y,(y)
      009B5E 1C 00 02         [ 2]  268 	addw x,#CELLL 
      009B61 90 9F            [ 1]  269 	ld a,yl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009B63 92 C7 2C         [ 4]  270 	ld [PTR16],a
      009B66 72 05 50 5F FB   [ 2]  271 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009B6B 20 DA            [ 2]  272 	jra inc_ptr 
                                    273 
                                    274 
                                    275 
                                    276 ;---------------------------------------
                                    277 ; write a byte to FLASH or EEPROM/OPTION  
                                    278 ; EEC!  (c a -- )
                                    279 ;---------------------------------------
      009B6D 9B 52                  280     .word LINK 
                           001AEF   281 	LINK=.
      009B6F 04                     282     .byte 4 
      009B70 45 45 43 21            283     .ascii "EEC!"
                                    284 	; local variables 
                           000001   285 	BTW = 1   ; byte to write offset on stack
                           000002   286     OPT = 2 
                           000002   287 	VSIZE = 2
      009B74                        288 EECSTO:
      009B74 52 02            [ 2]  289 	sub sp,#VSIZE
      009B76 CD 9A 04         [ 4]  290     call PSTO
      009B79 E6 01            [ 1]  291 	ld a,(1,x)
      009B7B 43               [ 1]  292 	cpl a 
      009B7C 6B 01            [ 1]  293 	ld (BTW,sp),a ; byte to write 
      009B7E 0F 02            [ 1]  294 	clr (OPT,sp)  ; OPTION flag
      009B80 CD 9B 10         [ 4]  295 	call unlock 
                                    296 	; check if option
      009B83 90 BE 2C         [ 2]  297 	ldw y,PTR16 
      009B86 90 A3 48 00      [ 2]  298 	cpw y,#OPTION_BASE
      009B8A 2B 10            [ 1]  299 	jrmi 2$
      009B8C 90 A3 48 80      [ 2]  300 	cpw y,#OPTION_END+1
      009B90 2A 0A            [ 1]  301 	jrpl 2$
      009B92 03 02            [ 1]  302 	cpl (OPT,sp)
                                    303 	; OPTION WRITE require this unlock 
      009B94 72 1E 50 5B      [ 1]  304     bset FLASH_CR2,#FLASH_CR2_OPT
      009B98 72 1F 50 5C      [ 1]  305     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009B9C                        306 2$: 
      009B9C CD 9B 5A         [ 4]  307 	call WR_BYTE 	
      009B9F 0D 02            [ 1]  308 	tnz (OPT,sp)
      009BA1 27 0D            [ 1]  309 	jreq 3$ 
      009BA3 7B 01            [ 1]  310     ld a,(BTW,sp)
      009BA5 90 5F            [ 1]  311     clrw y
      009BA7 90 97            [ 1]  312 	ld yl,a 
      009BA9 1D 00 02         [ 2]  313 	subw x,#CELLL 
      009BAC FF               [ 2]  314 	ldw (x),y 
      009BAD CD 9B 5A         [ 4]  315 	call WR_BYTE
      009BB0                        316 3$: 
      009BB0 CD 9B 34         [ 4]  317 	call lock 
      009BB3 5B 02            [ 2]  318 	addw sp,#VSIZE 
      009BB5 81               [ 4]  319     ret
                                    320 
                                    321 ;------------------------------
                                    322 ; write integer in FLASH|EEPROM
                                    323 ; EE! ( n a -- )
                                    324 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009BB6 9B 6F                  325 	.word LINK 
                           001B38   326 	LINK=.
      009BB8 03                     327 	.byte 3 
      009BB9 45 45 21               328 	.ascii "EE!"
      009BBC                        329 EESTO:
      009BBC CD 9A 04         [ 4]  330 	call PSTO 
      009BBF CD 9B 10         [ 4]  331 	call unlock 
      009BC2 90 93            [ 1]  332 	ldw y,x 
      009BC4 90 FE            [ 2]  333 	ldw y,(y)
      009BC6 90 89            [ 2]  334 	pushw y 
      009BC8 90 5E            [ 1]  335 	swapw y 
      009BCA FF               [ 2]  336 	ldw (x),y 
      009BCB CD 9B 5A         [ 4]  337 	call WR_BYTE 
      009BCE 90 85            [ 2]  338 	popw y 
      009BD0 1D 00 02         [ 2]  339 	subw x,#CELLL
      009BD3 FF               [ 2]  340 	ldw (x),y 
      009BD4 CD 9B 5A         [ 4]  341 	call WR_BYTE
      009BD7 CC 9B 34         [ 2]  342 	jp lock 
                                    343 
                                    344 
                                    345 ;----------------------------
                                    346 ; Erase flash memory row 
                                    347 ; stm8s105 as 128 bytes rows
                                    348 ; ROW-ERASE ( a -- )
                                    349 ;----------------------------
      009BDA 9B B8                  350 	.word LINK 
                           001B5C   351 	LINK=. 
      009BDC 09                     352 	.byte 9 
      009BDD 52 4F 57 2D 45 52 41   353 	.ascii "ROW-ERASE" 
             53 45
      009BE6                        354 row_erase:
      009BE6 CD 9A 04         [ 4]  355 	call PSTO
                                    356 ;code must be execute from RAM 
                                    357 ;copy routine to PAD 
      009BE9 1D 00 02         [ 2]  358 	subw x,#CELLL 
      009BEC 90 AE 9C 33      [ 2]  359 	ldw y,#row_erase_proc
      009BF0 FF               [ 2]  360 	ldw (x),y 
      009BF1 CD 8B 14         [ 4]  361 	call PAD 
      009BF4 90 AE 9C 56      [ 2]  362 	ldw y,#row_erase_proc_end 
      009BF8 72 A2 9C 33      [ 2]  363 	subw y,#row_erase_proc
      009BFC 1D 00 02         [ 2]  364 	subw x,#CELLL 
      009BFF FF               [ 2]  365 	ldw (x),y 
      009C00 CD 8B 50         [ 4]  366 	call CMOVE 
      009C03                        367 block_erase:
      009C03 90 BE 2C         [ 2]  368 	ldw y,PTR16
      009C06 90 A3 9F 00      [ 2]  369 	cpw y,#app_space 
      009C0A 2A 13            [ 1]  370 	jrpl erase_flash 
                                    371 ; erase EEPROM block
      009C0C 90 A3 40 00      [ 2]  372 	cpw y,#EEPROM_BASE 
      009C10 24 01            [ 1]  373 	jruge 1$
      009C12 81               [ 4]  374 	ret ; bad address 
      009C13 90 A3 43 FF      [ 2]  375 1$: cpw y,#EEPROM_END 
      009C17 23 01            [ 2]  376 	jrule 2$ 
      009C19 81               [ 4]  377 	ret ; bad address 
      009C1A                        378 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009C1A CD 9A D2         [ 4]  379 	call unlock_eeprom 
      009C1D 20 03            [ 2]  380 	jra proceed_erase
                                    381 ; erase flash block:
      009C1F                        382 erase_flash:
      009C1F CD 9A F1         [ 4]  383 	call unlock_flash 
      009C22                        384 proceed_erase:
      009C22 CD 8B 14         [ 4]  385 	call PAD 
      009C25 90 93            [ 1]  386 	ldw y,x
      009C27 90 FE            [ 2]  387 	ldw y,(y)
      009C29 1C 00 02         [ 2]  388 	addw x,#CELLL  
      009C2C 90 FD            [ 4]  389 	call (y) 
      009C2E 72 17 50 5F      [ 1]  390 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009C32 81               [ 4]  391 	ret 
                                    392 
                                    393 ; this routine is to be copied to PAD 
      009C33                        394 row_erase_proc:
      009C33 35 20 50 5B      [ 1]  395 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009C37 35 DF 50 5C      [ 1]  396 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009C3B 4F               [ 1]  397 	clr a 
      009C3C 90 5F            [ 1]  398 	clrw y 
      009C3E 91 D7 2C         [ 4]  399 	ld ([PTR16],y),a
      009C41 90 5C            [ 2]  400     incw y
      009C43 91 D7 2C         [ 4]  401 	ld ([PTR16],y),a
      009C46 90 5C            [ 2]  402     incw y
      009C48 91 D7 2C         [ 4]  403 	ld ([PTR16],y),a
      009C4B 90 5C            [ 2]  404     incw y
      009C4D 91 D7 2C         [ 4]  405 	ld ([PTR16],y),a
      009C50 72 05 50 5F FB   [ 2]  406 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009C55 81               [ 4]  407 	ret
      009C56                        408 row_erase_proc_end:
                                    409 
                                    410 
                                    411 ;-----------------------------------
                                    412 ; block programming must be 
                                    413 ; executed from RAM 
                                    414 ; initial contidions: 
                                    415 ; 		memory unlocked
                                    416 ;       PTR16 initialized 
                                    417 ; input: 
                                    418 ;    x   buffer address 
                                    419 ;-----------------------------------
                           000001   420 	BCNT=1 
      009C56                        421 copy_buffer:
      009C56 4B 80            [ 1]  422 	push #BLOCK_SIZE  
                                    423 ;enable block programming 
      009C58 72 10 50 5B      [ 1]  424 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009C5C 72 11 50 5C      [ 1]  425 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009C60 90 5F            [ 1]  426 	clrw y
      009C62 F6               [ 1]  427 1$:	ld a,(x)
      009C63 91 D7 2C         [ 4]  428 	ld ([PTR16],y),a
      009C66 5C               [ 2]  429 	incw x 
      009C67 90 5C            [ 2]  430 	incw y 
      009C69 0A 01            [ 1]  431 	dec (BCNT,sp)
      009C6B 26 F5            [ 1]  432 	jrne 1$
                                    433 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009C6D 72 05 50 5F FB   [ 2]  434 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009C72 84               [ 1]  435 	pop a ; remove BCNT from stack 
      009C73 81               [ 4]  436 	ret 
      009C74                        437 copy_buffer_end:
                                    438 
                                    439 ;-------------------------
                                    440 ; move program_row to RAM 
                                    441 ; in TIB 
                                    442 ;------------------------
      009C74                        443 copy_prog_to_ram:
      009C74 1D 00 06         [ 2]  444 	subw x,#6
      009C77 90 AE 9C 56      [ 2]  445 	ldw y,#copy_buffer 
      009C7B EF 04            [ 2]  446 	ldw (4,x),y 
      009C7D 90 AE 07 7F      [ 2]  447 	ldw y,#TIBBASE
      009C81 EF 02            [ 2]  448 	ldw (2,x),y 
      009C83 90 AE 9C 74      [ 2]  449 	ldw y,#copy_buffer_end 
      009C87 72 A2 9C 56      [ 2]  450 	subw y,#copy_buffer  
      009C8B FF               [ 2]  451 	ldw (x),y 
      009C8C CD 8B 50         [ 4]  452 	call CMOVE 
      009C8F 81               [ 4]  453 	ret 
                                    454 
                                    455 
                                    456 ;-----------------------------
                                    457 ; write a row in FLASH/EEPROM 
                                    458 ; WR-ROW ( ab ar -- )
                                    459 ; ab -> address 128 byte buffer to write 
                                    460 ; ar ->  row address in FLASH|EEPROM 
                                    461 ;-----------------------------
      009C90 9B DC                  462 	.word LINK 
                           001C12   463 	LINK=.
      009C92 06                     464 	.byte 6 
      009C93 57 52 2D 52 4F 57      465 	.ascii "WR-ROW"
      009C99                        466 write_row:
      009C99 CD 9A 04         [ 4]  467 	call PSTO
                                    468 ; align to FLASH block 
      009C9C A6 80            [ 1]  469 	ld a,#0x80 
      009C9E B4 2E            [ 1]  470 	and a,PTR8 
      009CA0 B7 2E            [ 1]  471 	ld PTR8,a  
      009CA2 CD 9C 74         [ 4]  472 	call copy_prog_to_ram
      009CA5 CD 9B 10         [ 4]  473 	call unlock
      009CA8 90 93            [ 1]  474 	ldw y,x 
      009CAA 90 FE            [ 2]  475 	ldw y,(y)
      009CAC 1C 00 02         [ 2]  476 	addw x,#CELLL 
      009CAF 89               [ 2]  477 	pushw x 
      009CB0 93               [ 1]  478 	ldw x,y ; buffer address in x 
      009CB1 CD 07 7F         [ 4]  479 	call TIBBASE
      009CB4 CD 9B 34         [ 4]  480 	call lock
      009CB7 85               [ 2]  481 	popw x 
      009CB8 81               [ 4]  482 	ret 
                                    483 
                                    484 ;-------------------------------------
                                    485 ; change value of OPTION register 
                                    486 ; SET-OPT (c n -- ) 
                                    487 ; c new value.
                                    488 ; n OPT  number {1..7}
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                    489 ;--------------------------------------
      009CB9 9C 92                  490 		.word LINK 
                           001C3B   491 		LINK=.
      009CBB 07                     492 		.byte 7 
      009CBC 53 45 54 2D 4F 50 54   493 		.ascii "SET-OPT" 
      009CC3                        494 set_option: 
      009CC3 90 93            [ 1]  495 		ldw y,x 
      009CC5 90 FE            [ 2]  496 		ldw y,(y)
      009CC7 27 06            [ 1]  497 		jreq 1$
      009CC9 90 A3 00 07      [ 2]  498 		cpw y,#7 
      009CCD 23 04            [ 2]  499 		jrule 2$ 
                                    500 ; invalid OPTION number 		
      009CCF 1C 00 04         [ 2]  501 1$:		addw x,#2*CELLL
      009CD2 81               [ 4]  502 		ret
      009CD3 90 58            [ 2]  503 2$:		sllw y 
      009CD5 72 A9 47 FF      [ 2]  504 		addw y,#OPTION_BASE-1
      009CD9 FF               [ 2]  505 		ldw (x),y 
      009CDA 1D 00 02         [ 2]  506 		subw x,#CELLL 
      009CDD 90 5F            [ 1]  507 		clrw y 
      009CDF FF               [ 2]  508 		ldw (x),y 
      009CE0 CD 9B 74         [ 4]  509 		call EECSTO
      009CE3 81               [ 4]  510 		ret 
                                    511 
                                    512 
                                    513 
                                    514 ;--------------------------------------
                                    515 ; reset system to its original state 
                                    516 ; before any user modification
                                    517 ; PRISTINE ( -- )
                                    518 ;-------------------------------------
      009CE4 9C BB                  519 	.word LINK  
                           001C66   520 	LINK=.
      009CE6 08                     521 	.byte 8 
      009CE7 50 52 49 53 54 49 4E   522 	.ascii "PRISTINE"
             45
      009CEF                        523 pristine:
                                    524 ;;; erase EEPROM
      009CEF CD 9A 18         [ 4]  525 	call EEPROM 
      009CF2 CD 85 04         [ 4]  526 1$:	call DUPP 
      009CF5 CD 9B E6         [ 4]  527 	call row_erase
      009CF8 90 93            [ 1]  528 	ldw y,x 
      009CFA 90 EE 02         [ 2]  529 	ldw y,(2,y)
      009CFD 72 A9 00 80      [ 2]  530 	addw y,#BLOCK_SIZE
      009D01 EF 02            [ 2]  531 	ldw (2,x),y
      009D03 90 A3 48 00      [ 2]  532 	cpw y,#OPTION_BASE 
      009D07 25 E9            [ 1]  533 	jrult 1$
                                    534 ;;; reset OPTION to default values
      009D09 90 AE 00 01      [ 2]  535 	ldw y,#1 ; OPT1 
      009D0D FF               [ 2]  536 2$:	ldw (x),y   
      009D0E 90 5F            [ 1]  537 	clrw y 
      009D10 EF 02            [ 2]  538 	ldw (2,x),y  ; ( 0 1 -- ) 
      009D12 CD 86 9A         [ 4]  539 	call DDUP    ; ( 0 1 0 1 -- )  
      009D15 CD 9C C3         [ 4]  540 	call set_option
      009D18 90 93            [ 1]  541 	ldw y,x 
      009D1A 90 FE            [ 2]  542 	ldw y,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009D1C 90 5C            [ 2]  543 	incw y  ; next OPTION 
      009D1E 90 A3 00 08      [ 2]  544 	cpw y,#8 
      009D22 25 E9            [ 1]  545 	jrult 2$
                                    546 ;;; erase first row of app_space 	
      009D24 90 AE 9F 00      [ 2]  547 	ldw y,#app_space
      009D28 FF               [ 2]  548 	ldw (x),y  
      009D29 CD 9B E6         [ 4]  549 	call row_erase 
                                    550 ; reset interrupt vectors 
      009D2C 1D 00 02         [ 2]  551 	subw x,#CELLL 
      009D2F 90 5F            [ 1]  552 	clrw y  
      009D31 FF               [ 2]  553 4$:	ldw (x),y  ; ( n -- ) int# 
      009D32 CD 85 04         [ 4]  554 	call DUPP  
      009D35 CD 9D 52         [ 4]  555 	call reset_vector
      009D38 90 93            [ 1]  556 	ldw y,x 
      009D3A 90 FE            [ 2]  557 	ldw y,(y)
      009D3C 90 5C            [ 2]  558 	incw y   ; next vector 
      009D3E 90 A3 00 19      [ 2]  559 	cpw y,#25 
      009D42 25 ED            [ 1]  560 	jrult 4$
      009D44 CC 80 80         [ 2]  561 	jp NonHandledInterrupt ; reset MCU
                                    562 
                                    563 ;------------------------------
                                    564 ; reset an interrupt vector 
                                    565 ; to its initial value 
                                    566 ; i.e. NonHandledInterrupt
                                    567 ; RST-IVEC ( n -- )
                                    568 ;-----------------------------
      009D47 9C E6                  569 	.word LINK 
                           001CC9   570 	LINK=. 
      009D49 08                     571 	.byte 8 
      009D4A 52 53 54 2D 49 56 45   572 	.ascii "RST-IVEC"
             43
      009D52                        573 reset_vector:
      009D52 90 93            [ 1]  574 	ldw y,x
      009D54 1C 00 02         [ 2]  575 	addw x,#CELLL 
      009D57 90 FE            [ 2]  576 	ldw y,(y)
      009D59 90 A3 00 17      [ 2]  577 	cpw y,#23 
      009D5D 27 34            [ 1]  578 	jreq 9$
      009D5F 90 A3 00 1D      [ 2]  579 	cpw y,#29 ; last vector
      009D63 22 2E            [ 1]  580 	jrugt 9$  
      009D65 90 58            [ 2]  581 	sllw y 
      009D67 90 58            [ 2]  582 	sllw y 
      009D69 72 A9 80 08      [ 2]  583 	addw y,#0x8008 ; irq0 address 
      009D6D 90 BF 1E         [ 2]  584 	ldw YTEMP,y
      009D70 1D 00 04         [ 2]  585 	subw x,#2*CELLL 
      009D73 FF               [ 2]  586 	ldw (x),y 
      009D74 90 5F            [ 1]  587 	clrw y 
      009D76 A6 82            [ 1]  588 	ld a,#0x82 
      009D78 90 95            [ 1]  589 	ld yh,a
      009D7A EF 02            [ 2]  590 	ldw (2,x),y
      009D7C CD 9B BC         [ 4]  591 	call EESTO
      009D7F 1D 00 04         [ 2]  592 	subw x,#2*CELLL
      009D82 90 AE 80 80      [ 2]  593 	ldw y,#NonHandledInterrupt
      009D86 EF 02            [ 2]  594 	ldw (2,x),y 
      009D88 90 BE 1E         [ 2]  595 	ldw y,YTEMP  
      009D8B 72 A9 00 02      [ 2]  596 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009D8F FF               [ 2]  597 	ldw (x),y 
      009D90 CD 9B BC         [ 4]  598 	call EESTO
      009D93 81               [ 4]  599 9$:	ret 
                                    600 
                                    601 
                                    602 ;------------------------------
                                    603 ; all interrupt vector with 
                                    604 ; an address >= a are resetted 
                                    605 ; to default
                                    606 ; CHKIVEC ( a -- )
                                    607 ;------------------------------
      009D94 9D 49                  608 	.word LINK 
                           001D16   609 	LINK=.
      009D96 07                     610 	.byte 7
      009D97 43 48 4B 49 56 45 43   611 	.ascii "CHKIVEC"
                                    612 ;local variables 
                           000001   613 	SSP=1
                           000003   614 	CADR=3
                           000005   615 	OFS=5
                           000006   616 	VSIZE=6  
      009D9E                        617 CHKIVEC:
      009D9E 52 06            [ 2]  618 	sub sp,#VSIZE ;alloc local variables 
      009DA0 90 93            [ 1]  619 	ldw y,x 
      009DA2 90 FE            [ 2]  620 	ldw y,(y)
      009DA4 17 03            [ 2]  621 	ldw (CADR,sp),y ; ca 
      009DA6 1F 01            [ 2]  622 	ldw (SSP,sp),x 
      009DA8 AE 80 0A         [ 2]  623 	ldw x,#0x800a ; irq0 address 
      009DAB BF 2C            [ 2]  624 	ldw PTR16,X
      009DAD AE FF FC         [ 2]  625 	ldw x,#-4 
      009DB0 1C 00 04         [ 2]  626 1$:	addw x,#4
      009DB3 A3 00 78         [ 2]  627 	cpw x,#30*4 ; irq0-29 
      009DB6 27 22            [ 1]  628 	jreq 9$
      009DB8 90 93            [ 1]  629 	ldw y,x  
      009DBA 91 D6 2C         [ 4]  630 	ld a,([PTR16],y)
      009DBD 11 03            [ 1]  631 	cp a,(CADR,sp)
      009DBF 25 EF            [ 1]  632 	jrult 1$
      009DC1 90 5C            [ 2]  633 	incw y 
      009DC3 91 D6 2C         [ 4]  634 	ld a,([PTR16],y)
      009DC6 11 04            [ 1]  635 	cp a,(CADR+1,sp) 
      009DC8 25 E6            [ 1]  636 	jrult 1$ 
      009DCA 1F 05            [ 2]  637 	ldw (OFS,sp),x 
      009DCC 54               [ 2]  638 	srlw x
      009DCD 54               [ 2]  639 	srlw x 
      009DCE 90 93            [ 1]  640 	ldw y,x 
      009DD0 1E 01            [ 2]  641 	ldw x,(SSP,sp)
      009DD2 FF               [ 2]  642 	ldw (x),y
      009DD3 CD 9D 52         [ 4]  643 	call reset_vector
      009DD6 1E 05            [ 2]  644 	ldw x,(OFS,sp) 
      009DD8 20 D6            [ 2]  645 	jra 1$
      009DDA 1E 01            [ 2]  646 9$:	ldw x,(SSP,sp) 
      009DDC 1C 00 02         [ 2]  647 	addw x,#CELLL 
      009DDF 5B 06            [ 2]  648 	addw sp,#VSIZE ; drop local variables  
      009DE1 81               [ 4]  649 	ret 
                                    650 
                                    651 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                    652 ; set interrupt vector 
                                    653 ; SET-IVEC ( a n -- )
                                    654 ;  a Handler address
                                    655 ;  n  vector # 0 .. 29 
                                    656 ;-----------------------------
      009DE2 9D 96                  657 	.word LINK
                           001D64   658 	LINK=.
      009DE4 08                     659 	.byte 8 
      009DE5 53 45 54 2D 49 56 45   660 	.ascii "SET-IVEC" 
             43
      009DED                        661 set_vector:
      009DED 90 93            [ 1]  662     ldw y,x 
      009DEF 1C 00 02         [ 2]  663 	addw x,#CELLL 
      009DF2 90 FE            [ 2]  664 	ldw y,(y) ; vector #
      009DF4 90 A3 00 1D      [ 2]  665 	cpw y,#29 ; last vector
      009DF8 23 04            [ 2]  666 	jrule 2$
      009DFA 1C 00 02         [ 2]  667 	addw x,#CELLL 
      009DFD 81               [ 4]  668 	ret
      009DFE 90 58            [ 2]  669 2$:	sllw y 
      009E00 90 58            [ 2]  670 	sllw y 
      009E02 72 A9 80 08      [ 2]  671 	addw y,#0X8008 ; IRQ0 vector address 
      009E06 90 BF 1E         [ 2]  672 	ldw YTEMP,y ; vector address 
      009E09 90 5F            [ 1]  673 	clrw y 
      009E0B A6 82            [ 1]  674 	ld a,#0x82 
      009E0D 90 95            [ 1]  675 	ld yh,a 
                                    676 ;  write 0x8200
      009E0F 1D 00 04         [ 2]  677 	subw x,#2*CELLL 
      009E12 EF 02            [ 2]  678 	ldw (2,x),y 
      009E14 90 BE 1E         [ 2]  679 	ldw y,YTEMP
      009E17 FF               [ 2]  680 	ldw (x),y ; vector address 
      009E18 CD 9B BC         [ 4]  681 	call EESTO 
                                    682 ; write bits 15..0 int vector 
      009E1B 1D 00 02         [ 2]  683 	subw x,#CELLL 
      009E1E 90 BE 1E         [ 2]  684 	ldw y,YTEMP 
      009E21 72 A9 00 02      [ 2]  685 	addw y,#2 
      009E25 FF               [ 2]  686 	ldw (x),y 
      009E26 CD 9B BC         [ 4]  687 	call EESTO
      009E29 81               [ 4]  688 9$: ret 
                                    689 
                                    690 
                                    691 ;------------------------
                                    692 ; Compile word to flash
                                    693 ; EE, (w -- )
                                    694 ;-----------------------
      009E2A 9D E4                  695 	.word LINK
                           001DAC   696 	LINK=.
      009E2C 03                     697 	.byte 3
      009E2D 45 45 2C               698 	.ascii "EE,"
      009E30                        699 EE_COMMA:
      009E30 1D 00 02         [ 2]  700 	subw x,#CELLL 
      009E33 90 BE 18         [ 2]  701 	ldw y,UCP
      009E36 90 89            [ 2]  702 	pushw y 
      009E38 FF               [ 2]  703 	ldw (x),y 
      009E39 CD 9B BC         [ 4]  704 	call EESTO
      009E3C 90 85            [ 2]  705 	popw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009E3E 72 A9 00 02      [ 2]  706 	addw y,#2
      009E42 90 BF 18         [ 2]  707 	ldw UCP,y
      009E45 81               [ 4]  708 	ret 
                                    709 
                                    710 
                                    711 ;-------------------------
                                    712 ; Compile byte to flash 
                                    713 ; EEC, ( c -- )	
                                    714 ;-------------------------
      009E46 9E 2C                  715 	.word LINK 
                           001DC8   716 	LINK=.
      009E48 04                     717 	.byte 4 
      009E49 45 45 43 2C            718 	.ascii "EEC,"
      009E4D                        719 EEC_COMMA:
      009E4D 1D 00 04         [ 2]  720 	subw x,#2*CELLL 
      009E50 90 BE 18         [ 2]  721 	ldw y,UCP
      009E53 90 89            [ 2]  722 	pushw y 
      009E55 EF 02            [ 2]  723 	ldw (2,x),y 
      009E57 90 5F            [ 1]  724 	clrw y 
      009E59 FF               [ 2]  725 	ldw (x),y
      009E5A CD 9B 74         [ 4]  726 	call EECSTO
      009E5D 90 85            [ 2]  727 	popw y 
      009E5F 90 5C            [ 2]  728 	incw y 
      009E61 90 BF 18         [ 2]  729 	ldw UCP,y
      009E64 81               [ 4]  730 	ret 
                                    731 
                                    732 
                                    733 
                                    734 ;------------------------------------------
                                    735 ; adjust pointers after **FMOVE** operetion.
                                    736 ; UPDAT-PTR ( cp+ -- )
                                    737 ; cp+ is new CP position after FMOVE 
                                    738 ;-------------------------------------------
      009E65 9E 48                  739 	.word LINK 
                           001DE7   740 	LINK=.
      009E67 09                     741 	.byte 9
      009E68 55 50 44 41 54 2D 50   742 	.ascii "UPDAT-PTR" 
             54 52
      009E71                        743 UPDATPTR:
                                    744 ;update CONTEXT and LAST 
      009E71 CD 9A 53         [ 4]  745 	call EEPCP 
      009E74 CD 84 5D         [ 4]  746 	call AT
      009E77 CD 83 DF         [ 4]  747 	call DOLIT 
      009E7A 00 02                  748 	.word 2 
      009E7C CD 86 AF         [ 4]  749 	call PLUS 
      009E7F CD 85 04         [ 4]  750 	call DUPP 
      009E82 CD 86 22         [ 4]  751 	call CNTXT 
      009E85 CD 84 46         [ 4]  752 	call STORE
      009E88 CD 86 4E         [ 4]  753 	call LAST
      009E8B CD 84 46         [ 4]  754 	call STORE 
      009E8E CD 9A 7D         [ 4]  755 	call UPDATLAST 
      009E91 81               [ 4]  756 	ret 
                                    757 
                                    758 ;--------------------------------------
                                    759 ; write new definition name to flash 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                    760 ; NAME>FLASH ( a - a+ )
                                    761 ;--------------------------------------
      009E92 9E 67                  762 	.word LINK 
                           001E14   763 	LINK=.
      009E94 0A                     764 	.byte 10
      009E95 4E 41 4D 45 3E 46 4C   765 	.ascii "NAME>FLASH" 
             41 53 48
      009E9F                        766 NAME_TO_FLASH:
      009E9F CD 86 3E         [ 4]  767 	call CPP 
      009EA2 CD 84 5D         [ 4]  768 	call AT 
      009EA5 CD 9A 04         [ 4]  769 	call PSTO 
      009EA8 CD 86 22         [ 4]  770 	call CNTXT 
      009EAB CD 84 5D         [ 4]  771 	call AT 
      009EAE CD 9B BC         [ 4]  772 	call EESTO 
      009EB1 CD 8A EC         [ 4]  773 	call COUNT ; ( -- b u ) 
      009EB4 CD 89 A9         [ 4]  774 	call ONEP 
      009EB7 CD 85 D0         [ 4]  775 	call TEMP
      009EBA CD 84 46         [ 4]  776 	call STORE 
      009EBD CD 89 B6         [ 4]  777 	call ONEM 
      009EC0 CD 85 04         [ 4]  778 1$: call DUPP 
      009EC3 CD 84 7B         [ 4]  779 	call CAT 
      009EC6 CD 9B 5A         [ 4]  780 	call WR_BYTE 
      009EC9 CD 85 D0         [ 4]  781 	call TEMP
      009ECC CD 84 5D         [ 4]  782 	call AT 
      009ECF CD 89 B6         [ 4]  783 	call ONEM  
      009ED2 CD 86 5E         [ 4]  784 	call QDUP 
      009ED5 CD 84 12         [ 4]  785 	call QBRAN 
      009ED8 9E E8                  786 	.word 2$ 
      009EDA CD 85 D0         [ 4]  787 	call TEMP 
      009EDD CD 84 46         [ 4]  788 	call STORE 
      009EE0 CD 89 A9         [ 4]  789 	call ONEP 
      009EE3 CD 84 29         [ 4]  790 	call BRAN 
      009EE6 9E C0                  791 	.word 1$
      009EE8 90 BE 2C         [ 2]  792 2$: ldw y,PTR16 
      009EEB FF               [ 2]  793 	ldw (x),y 
      009EEC 81               [ 4]  794 	ret  
                                    795 
                                    796 
                                    797 
                                    798 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                   4284 
                                   4285 ;===============================================================
                                   4286 
                           001E14  4287 LASTN =	LINK   ;last name defined
                                   4288 
                                   4289 ; application code begin here
      009F00                       4290 	.bndry 128 ; align on flash block  
      009F00                       4291 app_space: 
                                   4292 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        0006CB R   |   6 ABOR1      00121E R
  6 ABOR2      001235 R   |   6 ABORQ      001216 R   |   6 ABORT      001207 R
  6 ABRTQ      0014DD R   |   6 ABSS       0006C2 R   |   6 ACCEP      00119D R
  6 ACCP1      0011A6 R   |   6 ACCP2      0011CC R   |   6 ACCP3      0011CF R
  6 ACCP4      0011D1 R   |     ADC_AWCR=  00540E     |     ADC_AWCR=  00540F 
    ADC_AWSR=  00540C     |     ADC_AWSR=  00540D     |     ADC_CR1 =  005401 
    ADC_CR1_=  000000     |     ADC_CR1_=  000001     |     ADC_CR1_=  000004 
    ADC_CR1_=  000005     |     ADC_CR1_=  000006     |     ADC_CR2 =  005402 
    ADC_CR2_=  000003     |     ADC_CR2_=  000004     |     ADC_CR2_=  000005 
    ADC_CR2_=  000006     |     ADC_CR2_=  000001     |     ADC_CR3 =  005403 
    ADC_CR3_=  000007     |     ADC_CR3_=  000006     |     ADC_CSR =  005400 
    ADC_CSR_=  000006     |     ADC_CSR_=  000004     |     ADC_CSR_=  000000 
    ADC_CSR_=  000001     |     ADC_CSR_=  000002     |     ADC_CSR_=  000003 
    ADC_CSR_=  000007     |     ADC_CSR_=  000005     |     ADC_DB0R=  0053E0 
    ADC_DB0R=  0053E1     |     ADC_DB1R=  0053E2     |     ADC_DB1R=  0053E3 
    ADC_DB2R=  0053E4     |     ADC_DB2R=  0053E5     |     ADC_DB3R=  0053E6 
    ADC_DB3R=  0053E7     |     ADC_DB4R=  0053E8     |     ADC_DB4R=  0053E9 
    ADC_DB5R=  0053EA     |     ADC_DB5R=  0053EB     |     ADC_DB6R=  0053EC 
    ADC_DB6R=  0053ED     |     ADC_DB7R=  0053EE     |     ADC_DB7R=  0053EF 
    ADC_DB8R=  0053F0     |     ADC_DB8R=  0053F1     |     ADC_DB9R=  0053F2 
    ADC_DB9R=  0053F3     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_HTRH=  005408     |     ADC_HTRL=  005409     |     ADC_LTRH=  00540A 
    ADC_LTRL=  00540B     |     ADC_TDRH=  005406     |     ADC_TDRL=  005407 
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  6 AFT        0014C8 R   |   6 AGAIN      00142D R   |   6 AHEAD      001481 R
  6 ALLOT      001346 R   |   6 ANDD       0004D0 R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         0003DD R   |   6 ATEXE      000AB9 R   |   6 AUTORUN    000123 R
    AWU_APR =  0050F1     |     AWU_CSR1=  0050F0     |     AWU_TBR =  0050F2 
    B115200 =  000006     |     B19200  =  000003     |     B230400 =  000007 
    B2400   =  000000     |     B38400  =  000004     |     B460800 =  000008 
    B4800   =  000001     |     B57600  =  000005     |     B921600 =  000009 
    B9600   =  000002     |   6 BACK1      001145 R   |   6 BASE       000541 R
    BASEE   =  00000A     |     BCNT    =  000001     |   6 BCOMP      001388 R
  6 BDIGS      000BA0 R   |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00500F     |   6 BEGIN      001412 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |   6 BKSLA      000FDD R
  6 BKSP       001115 R   |     BKSPP   =  000008     |   6 BLANK      000988 R
    BLOCK_SI=  000080     |   6 BRAN       0003A9 R   |     BTW     =  000001 
  6 BYE        0000B0 R   |     CADR    =  000003     |     CALLL   =  0000CD 
    CARRY   =  000022     |   6 CAT        0003FB R   |   6 CCOMMA     00136A R
    CELLL   =  000002     |   6 CELLM      00090D R   |   6 CELLP      0008FE R
  6 CELLS      00091C R   |     CFG_GCR =  007F60     |   6 CHAR1      000DCD R
  6 CHAR2      000DD0 R   |   6 CHKIVEC    001D1E R   |     CLKOPT  =  004807 
    CLKOPT_C=  000002     |     CLKOPT_E=  000003     |     CLKOPT_P=  000000 
    CLKOPT_P=  000001     |     CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6 
    CLK_CKDI=  000000     |     CLK_CKDI=  000001     |     CLK_CKDI=  000002 
    CLK_CKDI=  000003     |     CLK_CKDI=  000004     |     CLK_CMSR=  0050C3 
    CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1     |     CLK_ECKR=  000000 
    CLK_ECKR=  000001     |     CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]

Symbol Table

    CLK_ICKR=  000002     |     CLK_ICKR=  000000     |     CLK_ICKR=  000001 
    CLK_ICKR=  000003     |     CLK_ICKR=  000004     |     CLK_ICKR=  000005 
    CLK_PCKE=  0050C7     |     CLK_PCKE=  000000     |     CLK_PCKE=  000001 
    CLK_PCKE=  000007     |     CLK_PCKE=  000005     |     CLK_PCKE=  000006 
    CLK_PCKE=  000004     |     CLK_PCKE=  000003     |     CLK_PCKE=  0050CA 
    CLK_PCKE=  000003     |     CLK_PCKE=  000002     |     CLK_SWCR=  0050C5 
    CLK_SWCR=  000000     |     CLK_SWCR=  000001     |     CLK_SWCR=  000002 
    CLK_SWCR=  000003     |     CLK_SWIM=  0050CD     |     CLK_SWR =  0050C4 
    CLK_SWR_=  0000B4     |     CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2 
  6 CMOV1      000AD8 R   |   6 CMOV2      000AF0 R   |   6 CMOVE      000AD0 R
    CNTDWN  =  00002A     |   6 CNTXT      0005A2 R   |   6 COLD       001863 R
  6 COLD1      001863 R   |   6 COLON      00162C R   |   6 COMMA      001353 R
  6 COMPI      001398 R   |     COMPO   =  000040     |   6 CONSTANT   0016B9 R
  6 COUNT      000A6C R   |   6 CPP        0005BE R   |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |   6 CR         000DFB R   |   6 CREAT      00166C R
    CRR     =  00000D     |   6 CSTOR      0003EA R   |   6 DAT        000A4C R
    DATSTK  =  00077F     |   6 DDROP      00060F R   |   6 DDUP       00061A R
  6 DECIM      000C50 R   |   6 DEPTH      0009D7 R   |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   6 DGTQ1      000C95 R   |   6 DI         0000BE R
  6 DIG        000BC9 R   |   6 DIGIT      000B64 R   |   6 DIGS       000BDA R
  6 DIGS1      000BDA R   |   6 DIGS2      000BE7 R   |   6 DIGTQ      000C64 R
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   6 DN1        000689 R
  6 DNEGA      00066C R   |   6 DOCONST    0016D8 R   |   6 DOLIT      00035F R
  6 DONXT      000373 R   |   6 DOSTR      000E11 R   |   6 DOT        000E96 R
  6 DOT1       000EAC R   |   6 DOTI1      0017FA R   |   6 DOTID      0017E4 R
  6 DOTO1      0012AA R   |   6 DOTOK      001290 R   |   6 DOTPR      000FBF R
  6 DOTQ       0014F7 R   |   6 DOTQP      000E3A R   |   6 DOTR       000E48 R
  6 DOTS       001786 R   |   6 DOTS1      001791 R   |   6 DOTS2      00179A R
  6 DOVAR      000531 R   |   6 DROP       00047A R   |   6 DSTOR      000A26 R
  6 DUMP       00173C R   |   6 DUMP1      001753 R   |   6 DUMP3      001775 R
  6 DUMPP      00170B R   |   6 DUPP       000484 R   |   6 EDIGS      000C05 R
  6 EECSTO     001AF4 R   |   6 EEC_COMM   001DCD R   |   6 EEPCP      0019D3 R
  6 EEPLAST    0019AC R   |   6 EEPROM     001998 R   |     EEPROM_B=  004000 
    EEPROM_E=  0043FF     |     EEPROM_S=  000400     |   6 EEPRUN     0019C0 R
  6 EEPVP      0019E6 R   |   6 EESTO      001B3C R   |   6 EE_COMMA   001DB0 R
  6 EI         0000B7 R   |   6 ELSEE      00145F R   |   6 EMIT       000349 R
  6 ENEPER     001912 R   |   6 EQ1        0006E6 R   |   6 EQUAL      0006D0 R
  6 ERASE      000B32 R   |     ERR     =  00001B     |   6 EVAL       0012D3 R
  6 EVAL1      0012D3 R   |   6 EVAL2      0012EF R   |   6 EXE1       000AC7 R
  6 EXECU      0003B9 R   |     EXT     =  000000     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |   6 EXTRC      000B8C R   |     FHSE    =  F42400 
    FHSE_K  =  003E80     |     FHSE_M  =  000010     |   6 FILL       000AFF R
  6 FILL1      000B1C R   |   6 FILL2      000B25 R   |   6 FIND       001071 R
  6 FIND1      00108F R   |   6 FIND2      0010BD R   |   6 FIND3      0010C9 R
  6 FIND4      0010DD R   |   6 FIND5      0010EA R   |   6 FIND6      0010CE R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_BA=  008000     |     FLASH_CR=  00505A     |     FLASH_CR=  000002 
    FLASH_CR=  000000     |     FLASH_CR=  000003     |     FLASH_CR=  000001 
    FLASH_CR=  00505B     |     FLASH_CR=  000005     |     FLASH_CR=  000004 
    FLASH_CR=  000007     |     FLASH_CR=  000000     |     FLASH_CR=  000006 
    FLASH_DU=  005064     |     FLASH_DU=  0000AE     |     FLASH_DU=  000056 
    FLASH_FP=  00505D     |     FLASH_FP=  000000     |     FLASH_FP=  000001 
    FLASH_FP=  000002     |     FLASH_FP=  000003     |     FLASH_FP=  000004 
    FLASH_FP=  000005     |     FLASH_IA=  00505F     |     FLASH_IA=  000003 
    FLASH_IA=  000002     |     FLASH_IA=  000006     |     FLASH_IA=  000001 
    FLASH_IA=  000000     |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
  6 FOR        0013E8 R   |   6 FORGET     000154 R   |   6 FORGET1    000183 R
  6 FORGET2    000209 R   |   6 FORGET4    000212 R   |   6 FORGET6    0001CB R
  6 FREEVAR    00021F R   |   6 FREEVAR4   000255 R   |     GPIO_BAS=  005000 
    GPIO_SIZ=  000005     |   6 HERE       000A83 R   |   6 HEX        000C3B R
  6 HI         001836 R   |   6 HLD        00058F R   |   6 HOLD       000BB0 R
    HSECNT  =  004809     |     I2C_CCRH=  00521C     |     I2C_CCRH=  000080 
    I2C_CCRH=  0000C0     |     I2C_CCRH=  000080     |     I2C_CCRH=  000000 
    I2C_CCRH=  000001     |     I2C_CCRH=  000000     |     I2C_CCRL=  00521B 
    I2C_CCRL=  00001A     |     I2C_CCRL=  000002     |     I2C_CCRL=  00000D 
    I2C_CCRL=  000050     |     I2C_CCRL=  000090     |     I2C_CCRL=  0000A0 
    I2C_CR1 =  005210     |     I2C_CR1_=  000006     |     I2C_CR1_=  000007 
    I2C_CR1_=  000000     |     I2C_CR2 =  005211     |     I2C_CR2_=  000002 
    I2C_CR2_=  000003     |     I2C_CR2_=  000000     |     I2C_CR2_=  000001 
    I2C_CR2_=  000007     |     I2C_DR  =  005216     |     I2C_FREQ=  005212 
    I2C_ITR =  00521A     |     I2C_ITR_=  000002     |     I2C_ITR_=  000000 
    I2C_ITR_=  000001     |     I2C_OARH=  005214     |     I2C_OARH=  000001 
    I2C_OARH=  000002     |     I2C_OARH=  000006     |     I2C_OARH=  000007 
    I2C_OARL=  005213     |     I2C_OARL=  000000     |     I2C_OAR_=  000813 
    I2C_OAR_=  000009     |     I2C_PECR=  00521E     |     I2C_READ=  000001 
    I2C_SR1 =  005217     |     I2C_SR1_=  000003     |     I2C_SR1_=  000001 
    I2C_SR1_=  000002     |     I2C_SR1_=  000006     |     I2C_SR1_=  000000 
    I2C_SR1_=  000004     |     I2C_SR1_=  000007     |     I2C_SR2 =  005218 
    I2C_SR2_=  000002     |     I2C_SR2_=  000001     |     I2C_SR2_=  000000 
    I2C_SR2_=  000003     |     I2C_SR2_=  000005     |     I2C_SR3 =  005219 
    I2C_SR3_=  000001     |     I2C_SR3_=  000007     |     I2C_SR3_=  000004 
    I2C_SR3_=  000000     |     I2C_SR3_=  000002     |     I2C_TRIS=  00521D 
    I2C_TRIS=  000005     |     I2C_TRIS=  000005     |     I2C_TRIS=  000005 
    I2C_TRIS=  000011     |     I2C_TRIS=  000011     |     I2C_TRIS=  000011 
    I2C_WRIT=  000000     |   6 ICOLON     00163A R   |   6 IFETCH     001403 R
  6 IFF        00143A R   |     IMEDD   =  000080     |   6 IMMED      001649 R
  6 INCH       00033D R   |   6 INN        00055F R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
  6 INTE1      001272 R   |   6 INTER      001248 R   |     INT_ADC1=  000016 
    INT_AWU =  000001     |     INT_CLK =  000002     |     INT_EXTI=  000003 
    INT_EXTI=  000004     |     INT_EXTI=  000005     |     INT_EXTI=  000006 
    INT_EXTI=  000007     |     INT_FLAS=  000018     |     INT_I2C =  000013 
    INT_RES1=  000008     |     INT_RES2=  000009     |     INT_RES3=  000011 
    INT_RES4=  000012     |     INT_SPI =  00000A     |     INT_TIM1=  00000C 
    INT_TIM1=  00000B     |     INT_TIM2=  00000E     |     INT_TIM2=  00000D 
    INT_TIM3=  000010     |     INT_TIM3=  00000F     |     INT_TIM4=  000017 
    INT_TLI =  000000     |     INT_UART=  000015     |     INT_UART=  000014 
    INT_VECT=  008060     |     INT_VECT=  00800C     |     INT_VECT=  008010 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]

Symbol Table

    INT_VECT=  008014     |     INT_VECT=  008018     |     INT_VECT=  00801C 
    INT_VECT=  008020     |     INT_VECT=  008024     |     INT_VECT=  008068 
    INT_VECT=  008054     |     INT_VECT=  008000     |     INT_VECT=  008030 
    INT_VECT=  008038     |     INT_VECT=  008034     |     INT_VECT=  008040 
    INT_VECT=  00803C     |     INT_VECT=  008048     |     INT_VECT=  008044 
    INT_VECT=  008064     |     INT_VECT=  008008     |     INT_VECT=  008004 
    INT_VECT=  00805C     |     INT_VECT=  008058     |   6 INVER      000649 R
    IPR0    =  000002     |     IPR1    =  000001     |     IPR2    =  000000 
    IPR3    =  000003     |     IPR_MASK=  000003     |     IRET_COD=  000080 
  6 ISEMI      0015D3 R   |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  6 JSRC       00161D R   |   6 KEY        000D7B R   |   6 KTAP       001162 R
  6 KTAP1      001185 R   |   6 KTAP2      001188 R   |   6 LAST       0005CE R
  6 LASTN   =  001E14 R   |   6 LBRAC      00127F R   |     LD1_BIT =  000000 
    LD1_MASK=  000001     |     LD1_PORT=  00500F     |   6 LESS       00070D R
    LF      =  00000A     |   6 LINK    =  001E14 R   |   6 LITER      0013BA R
  6 LN2S       00196E R   |   6 LOG2S      001958 R   |   6 LSHIFT     000947 R
  6 LSHIFT1    000950 R   |   6 LSHIFT4    000958 R   |   6 LT1        000723 R
    MASKK   =  001F7F     |   6 MAX        00072D R   |   6 MAX1       000740 R
  6 MIN        00074A R   |   6 MIN1       00075D R   |     MISCOPT =  004805 
    MISCOPT_=  000004     |     MISCOPT_=  000002     |     MISCOPT_=  000003 
    MISCOPT_=  000000     |     MISCOPT_=  000001     |   6 MMOD1      000800 R
  6 MMOD2      000814 R   |   6 MMOD3      00082B R   |   6 MMSM1      0007A7 R
  6 MMSM2      0007BB R   |   6 MMSM3      0007BD R   |   6 MMSM4      0007C5 R
  6 MODD       000845 R   |   6 MONE       0009AE R   |     MS      =  000028 
  6 MSEC       0002CA R   |   6 MSMOD      0007E3 R   |   6 MSTA1      0008D6 R
  6 MSTAR      0008B3 R   |     NAFR    =  004804     |   6 NAMEQ      00110A R
  6 NAMET      00101B R   |   6 NAME_TO_   001E1F R   |     NCLKOPT =  004808 
  6 NEGAT      00065A R   |   6 NEX1       000380 R   |   6 NEXT       0013F7 R
    NHSECNT =  00480A     |     NMISCOPT=  004806     |     NMISCOPT=  FFFFFFFB 
    NMISCOPT=  FFFFFFFD     |     NMISCOPT=  FFFFFFFC     |     NMISCOPT=  FFFFFFFF 
    NMISCOPT=  FFFFFFFE     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPTBL  =  00487F     |   6 NTIB       00056F R   |     NUBC    =  004802 
  6 NUFQ       000D91 R   |   6 NUFQ1      000DAA R   |   6 NUMBQ      000CA8 R
  6 NUMQ1      000CDC R   |   6 NUMQ2      000D0D R   |   6 NUMQ3      000D4F R
  6 NUMQ4      000D54 R   |   6 NUMQ5      000D63 R   |   6 NUMQ6      000D66 R
  6 NonHandl   000000 R   |     OFS     =  000005     |   6 ONE        0009A0 R
  6 ONEM       000936 R   |   6 ONEP       000929 R   |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPTBL   =  00487E     |     OPTIMIZE=  000001 
    OPTION_B=  004800     |     OPTION_E=  00487F     |   6 ORIG       000043 R
  6 ORR        0004E4 R   |   6 OUTPUT     00034E R   |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
  6 OVER       0004AE R   |   6 OVERT      0015AC R   |     PA      =  000000 
  6 PACKS      000B43 R   |   6 PAD        000A94 R   |   6 PAREN      000FCE R
  6 PARS       000EC7 R   |   6 PARS1      000EF2 R   |   6 PARS2      000F1D R
  6 PARS3      000F20 R   |   6 PARS4      000F29 R   |   6 PARS5      000F4C R
  6 PARS6      000F61 R   |   6 PARS7      000F70 R   |   6 PARS8      000F7F R
  6 PARSE      000F90 R   |   6 PAUSE      0002DA R   |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_CR1  =  005008 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]

Symbol Table

    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |   6 PDUM1      00171E R
  6 PDUM2      00172F R   |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
  6 PICK       0009EE R   |   6 PII        0018D1 R   |     PIN0    =  000000 
    PIN1    =  000001     |     PIN2    =  000002     |     PIN3    =  000003 
    PIN4    =  000004     |     PIN5    =  000005     |     PIN6    =  000006 
    PIN7    =  000007     |   6 PLUS       00062F R   |   6 PNAM1      001561 R
  6 PRESE      0012FE R   |     PROD1   =  00001C     |     PROD2   =  00001E 
    PROD3   =  000020     |   6 PROTECTE   0001FB R   |   6 PSTO       001984 R
  6 PSTOR      000A05 R   |     PTR16   =  00002C     |     PTR8    =  00002E 
  6 QBRAN      000392 R   |   6 QDUP       0005DE R   |   6 QDUP1      0005E8 R
  6 QKEY       00032B R   |   6 QSTAC      0012B6 R   |   6 QUERY      0011E2 R
  6 QUEST      000EB9 R   |   6 QUIT       00131B R   |   6 QUIT1      001323 R
  6 QUIT2      001326 R   |     RAMBASE =  000000     |     RAM_BASE=  000000 
    RAM_END =  0007FF     |     RAM_SIZE=  000800     |   6 RANDOM     000278 R
  6 RAT        000441 R   |   6 RBRAC      00160A R   |   6 REPEA      0014B1 R
  6 RFROM      00042E R   |     ROP     =  004800     |   6 ROT        0005EF R
    RP0     =  000026     |   6 RPAT       00040B R   |     RPP     =  0007FE 
  6 RPSTO      000418 R   |   6 RSHIFT     000963 R   |   6 RSHIFT1    00096C R
  6 RSHIFT4    000974 R   |     RST_SR  =  0050B3     |   6 RT12_2     001941 R
  6 SAME1      001039 R   |   6 SAME2      001062 R   |   6 SAMEQ      001031 R
  6 SCOM1      001596 R   |   6 SCOM2      001599 R   |   6 SCOMP      001578 R
  6 SEED       00025F R   |     SEEDX   =  000030     |     SEEDY   =  000032 
  6 SEMIS      0015BC R   |   6 SETISP     0000CA R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SIGN       000BEF R   |   6 SIGN1      000BFF R
  6 SLASH      00084F R   |   6 SLMOD      000833 R   |   6 SNAME      001531 R
    SP0     =  000024     |   6 SPACE      000DB3 R   |   6 SPACS      000DC2 R
  6 SPAT       000464 R   |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SPP     =  00077F     |     SPSAVE  =  000001     |   6 SPSTO      000471 R
  6 SQRT10     00192A R   |   6 SQRT2      0018E8 R   |   6 SQRT3      0018FF R
  6 SSMOD      0008DF R   |     SSP     =  000001     |     STACK   =  0007FE 
  6 STAR       0008A8 R   |   6 STASL      0008F0 R   |   6 STOD       000691 R
  6 STORE      0003C6 R   |   6 STR        000C1D R   |   6 STRCQ      0013C8 R
  6 STRQ       0014EA R   |   6 STRQP      000E30 R   |   6 SUBB       0006A8 R
  6 SWAPP      000494 R   |     SWIM_CSR=  007F80     |   6 TAP        00114C R
  6 TBOOT      001857 R   |   6 TCHAR      0009BF R   |   6 TEMP       000550 R
  6 TEVAL      000580 R   |   6 THENN      00144F R   |   6 TIB        000AA5 R
    TIBB    =  00077F     |     TIBBASE =  00077F     |     TIC     =  000027 
  6 TICK       001332 R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
    TIM1_BKR=  00526D     |     TIM1_CCE=  00525C     |     TIM1_CCE=  00525D 
    TIM1_CCM=  005258     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000003 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000004 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000003 
    TIM1_CCM=  005259     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000003 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000003 
    TIM1_CCM=  00525A     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000003 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000003 
    TIM1_CCM=  00525B     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000003 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000003 
    TIM1_CCR=  005265     |     TIM1_CCR=  005266     |     TIM1_CCR=  005267 
    TIM1_CCR=  005268     |     TIM1_CCR=  005269     |     TIM1_CCR=  00526A 
    TIM1_CCR=  00526B     |     TIM1_CCR=  00526C     |     TIM1_CNT=  00525E 
    TIM1_CNT=  00525F     |     TIM1_CR1=  005250     |     TIM1_CR2=  005251 
    TIM1_CR2=  000000     |     TIM1_CR2=  000002     |     TIM1_CR2=  000004 
    TIM1_CR2=  000005     |     TIM1_CR2=  000006     |     TIM1_DTR=  00526E 
    TIM1_EGR=  005257     |     TIM1_EGR=  000007     |     TIM1_EGR=  000001 
    TIM1_EGR=  000002     |     TIM1_EGR=  000003     |     TIM1_EGR=  000004 
    TIM1_EGR=  000005     |     TIM1_EGR=  000006     |     TIM1_EGR=  000000 
    TIM1_ETR=  005253     |     TIM1_ETR=  000006     |     TIM1_ETR=  000000 
    TIM1_ETR=  000001     |     TIM1_ETR=  000002     |     TIM1_ETR=  000003 
    TIM1_ETR=  000007     |     TIM1_ETR=  000004     |     TIM1_ETR=  000005 
    TIM1_IER=  005254     |     TIM1_IER=  000007     |     TIM1_IER=  000001 
    TIM1_IER=  000002     |     TIM1_IER=  000003     |     TIM1_IER=  000004 
    TIM1_IER=  000005     |     TIM1_IER=  000006     |     TIM1_IER=  000000 
    TIM1_OIS=  00526F     |     TIM1_PSC=  005260     |     TIM1_PSC=  005261 
    TIM1_RCR=  005264     |     TIM1_SMC=  005252     |     TIM1_SMC=  000007 
    TIM1_SMC=  000000     |     TIM1_SMC=  000001     |     TIM1_SMC=  000002 
    TIM1_SMC=  000004     |     TIM1_SMC=  000005     |     TIM1_SMC=  000006 
    TIM1_SR1=  005255     |     TIM1_SR1=  000007     |     TIM1_SR1=  000001 
    TIM1_SR1=  000002     |     TIM1_SR1=  000003     |     TIM1_SR1=  000004 
    TIM1_SR1=  000005     |     TIM1_SR1=  000006     |     TIM1_SR1=  000000 
    TIM1_SR2=  005256     |     TIM1_SR2=  000001     |     TIM1_SR2=  000002 
    TIM1_SR2=  000003     |     TIM1_SR2=  000004     |     TIM2_ARR=  00530D 
    TIM2_ARR=  00530E     |     TIM2_CCE=  005308     |     TIM2_CCE=  005309 
    TIM2_CCM=  005305     |     TIM2_CCM=  005306     |     TIM2_CCM=  005307 
    TIM2_CCR=  00530F     |     TIM2_CCR=  005310     |     TIM2_CCR=  005311 
    TIM2_CCR=  005312     |     TIM2_CCR=  005313     |     TIM2_CCR=  005314 
    TIM2_CNT=  00530A     |     TIM2_CNT=  00530B     |     TIM2_CR1=  005300 
    TIM2_EGR=  005304     |     TIM2_IER=  005301     |     TIM2_PSC=  00530C 
    TIM2_SR1=  005302     |     TIM2_SR2=  005303     |     TIM3_ARR=  00532B 
    TIM3_ARR=  00532C     |     TIM3_CCE=  005327     |     TIM3_CCE=  000000 
    TIM3_CCE=  000001     |     TIM3_CCE=  000004     |     TIM3_CCE=  000005 
    TIM3_CCE=  000000     |     TIM3_CCE=  000001     |     TIM3_CCM=  005325 
    TIM3_CCM=  005326     |     TIM3_CCM=  000000     |     TIM3_CCM=  000004 
    TIM3_CCM=  000003     |     TIM3_CCR=  00532D     |     TIM3_CCR=  00532E 
    TIM3_CCR=  00532F     |     TIM3_CCR=  005330     |     TIM3_CNT=  005328 
    TIM3_CNT=  005329     |     TIM3_CR1=  005320     |     TIM3_CR1=  000007 
    TIM3_CR1=  000000     |     TIM3_CR1=  000003     |     TIM3_CR1=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]

Symbol Table

    TIM3_CR1=  000002     |     TIM3_EGR=  005324     |     TIM3_IER=  005321 
    TIM3_PSC=  00532A     |     TIM3_SR1=  005322     |     TIM3_SR2=  005323 
    TIM4_ARR=  005346     |     TIM4_CNT=  005344     |     TIM4_CR1=  005340 
    TIM4_CR1=  000007     |     TIM4_CR1=  000000     |     TIM4_CR1=  000003 
    TIM4_CR1=  000001     |     TIM4_CR1=  000002     |     TIM4_EGR=  005343 
    TIM4_EGR=  000000     |     TIM4_IER=  005341     |     TIM4_IER=  000000 
    TIM4_PSC=  005345     |     TIM4_PSC=  000000     |     TIM4_PSC=  000007 
    TIM4_PSC=  000004     |     TIM4_PSC=  000001     |     TIM4_PSC=  000005 
    TIM4_PSC=  000002     |     TIM4_PSC=  000006     |     TIM4_PSC=  000003 
    TIM4_PSC=  000000     |     TIM4_PSC=  000001     |     TIM4_PSC=  000002 
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   6 TIMEOUTQ   00030A R
  6 TIMER      0002F4 R   |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
    TIM_CR1_=  000006     |     TIM_CR1_=  000005     |     TIM_CR1_=  000004 
    TIM_CR1_=  000003     |     TIM_CR1_=  000001     |     TIM_CR1_=  000002 
  6 TNAM2      0017B4 R   |   6 TNAM3      0017D2 R   |   6 TNAM4      0017D8 R
  6 TNAME      0017B1 R   |   6 TOKEN      00100D R   |   6 TOR        00044D R
    TRUEE   =  00FFFF     |   6 TWOSL      00097B R   |   6 TYPE1      000DE2 R
  6 TYPE2      000DEE R   |   6 TYPES      000DDD R   |   6 Timer4Ha   000005 R
    UART2_BR=  005242     |     UART2_BR=  005243     |     UART2_CR=  005244 
    UART2_CR=  005245     |     UART2_CR=  005246     |     UART2_CR=  005247 
    UART2_CR=  005248     |     UART2_CR=  004249     |     UART2_DR=  005241 
    UART2_GT=  00524A     |     UART2_PO=  00500F     |     UART2_PS=  00524B 
    UART2_RX=  000006     |     UART2_SR=  005240     |     UART2_TX=  000005 
    UART_CR1=  000004     |     UART_CR1=  000002     |     UART_CR1=  000000 
    UART_CR1=  000001     |     UART_CR1=  000007     |     UART_CR1=  000006 
    UART_CR1=  000005     |     UART_CR1=  000003     |     UART_CR2=  000004 
    UART_CR2=  000002     |     UART_CR2=  000005     |     UART_CR2=  000001 
    UART_CR2=  000000     |     UART_CR2=  000006     |     UART_CR2=  000003 
    UART_CR2=  000007     |     UART_CR3=  000003     |     UART_CR3=  000001 
    UART_CR3=  000002     |     UART_CR3=  000000     |     UART_CR3=  000006 
    UART_CR3=  000004     |     UART_CR3=  000005     |     UART_CR4=  000000 
    UART_CR4=  000001     |     UART_CR4=  000002     |     UART_CR4=  000003 
    UART_CR4=  000004     |     UART_CR4=  000006     |     UART_CR4=  000005 
    UART_CR5=  000003     |     UART_CR5=  000001     |     UART_CR5=  000002 
    UART_CR5=  000004     |     UART_CR5=  000005     |     UART_SR_=  000001 
    UART_SR_=  000004     |     UART_SR_=  000002     |     UART_SR_=  000003 
    UART_SR_=  000000     |     UART_SR_=  000005     |     UART_SR_=  000006 
    UART_SR_=  000007     |     UBASE   =  000006     |     UBC     =  004801 
    UCNTXT  =  000014     |     UCP     =  000018     |     UCTIB   =  00000C 
    UD1     =  000001     |     UD2     =  000002     |     UD3     =  000003 
    UD4     =  000004     |   6 UDOT       000E83 R   |   6 UDOTR      000E63 R
  6 UEND       000041 R   |     UHLD    =  000012     |     UINN    =  00000A 
    UINTER  =  000010     |     ULAST   =  00001A     |   6 ULES1      000705 R
  6 ULESS      0006EF R   |   6 UMMOD      000785 R   |   6 UMSTA      00085E R
  6 UNIQ1      001528 R   |   6 UNIQU      001509 R   |   6 UNTIL      00141D R
  6 UPDATCP    001A26 R   |   6 UPDATLAS   0019FD R   |   6 UPDATPTR   001DF1 R
  6 UPDATRUN   001A15 R   |   6 UPDATVP    001A3D R   |   6 UPL1       000525 R
  6 UPLUS      00050E R   |     UPP     =  000006     |     UTIB    =  00000E 
    UTMP    =  000008     |   6 UTYP1      0016EE R   |   6 UTYP2      0016FD R
  6 UTYPE      0016E9 R   |     UVP     =  000016     |   6 UZERO      00002B R
  6 VARIA      001686 R   |     VAR_BASE=  000080     |     VAR_TOP =  0007BE 
    VER     =  000003     |   6 VPP        0005B0 R   |     VSIZE   =  000006 
    WANT_DEB=  000000     |     WANT_MAT=  000001     |     WANT_SEE=  000000 
  6 WHILE      001497 R   |   6 WITHI      00076A R   |   6 WORDD      000FF9 R
  6 WORDS      00180E R   |   6 WORS1      001814 R   |   6 WORS2      001830 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]

Symbol Table

  6 WR_BYTE    001ADA R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    X4_FLASH=  00BFFF     |     X4_FLASH=  004000     |     X6_FLASH=  00FFFF 
    X6_FLASH=  008000     |   6 XORR       0004F9 R   |     XTEMP   =  00001C 
    YTEMP   =  00001E     |   6 ZERO       000995 R   |   6 ZL1        0004C6 R
  6 ZLESS      0004BD R   |   6 app_spac   001E80 R   |   6 block_er   001B83 R
  6 clear_ra   000019 R   |   6 clock_in   00005E R   |   6 copy_buf   001BD6 R
  6 copy_buf   001BF4 R   |   6 copy_pro   001BF4 R   |     da      =  000002 
    db      =  000003     |     dc      =  000000     |     dd      =  000001 
  6 erase_fl   001B9F R   |   6 inc_ptr    001AC7 R   |   6 lock       001AB4 R
  6 main       000016 R   |   6 pristine   001C6F R   |   6 proceed_   001BA2 R
  6 reboot     000321 R   |   6 reset_ve   001CD2 R   |   6 row_eras   001B66 R
  6 row_eras   001BB3 R   |   6 row_eras   001BD6 R   |   6 set_opti   001C43 R
  6 set_vect   001D6D R   |   6 uart2_in   000070 R   |   6 unlock     001A90 R
  6 unlock_e   001A52 R   |   6 unlock_f   001A71 R   |   6 write_ro   001C19 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   1E80   flags    0

