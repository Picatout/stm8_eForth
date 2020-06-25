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
                                     40 ; 0x80 Start of user defined words, linked to ROM dictionary
                                     41 ; 0x780 Data stack, growing downward
                                     42 ; 0x790 Terminal input buffer TIB
                                     43 ; 0x7FF Return stack, growing downward
                                     44 ; 0x8000 Interrupt vector table
                                     45 ; 0x8080 FORTH startup code
                                     46 ; 0x80E7 Start of FORTH dictionary in ROM
                                     47 ; 0x9584 End of FORTH dictionary
                                     48 ;
                                     49 ;       2020-04-26 Addapted for NUCLEO-8S208RB by Picatout 
                                     50 ;                  use UART1 instead of UART3 for communication with user.
                                     51 ;                  UART1 is available as ttyACM* device via USB connection.
                                     52 ;                  Use TIMER4 for millisecond interrupt to support MS counter 
                                     53 ;                  and MSEC word that return MS value.
                                     54 ;
                                     55 ;       EF12, Version 2.1, 18apr00cht
                                     56 ;               move to 8000H replacing WHYP.
                                     57 ;               copy interrupt vectors from WHYPFLSH.S19
                                     58 ;               to EF12.S19 before flashing
                                     59 ;               add TICKS1 and DELAY1 for motor stepping
                                     60 ;
                                     61 ;       EF12, 02/18/00, C. H. Ting
                                     62 ;       Adapt 86eForth v2.02 to 68HC12.
                                     63 ;               Use WHYP to seed EF12.ASM
                                     64 ;               Use AS12 native 68HC12 assembler:
                                     65 ;               as12 ef12.asm >ef12.lst
                                     66 ;       EF12A, add ADC code, 02mar00cht
                                     67 ;       EF12B, 01mar00cht
                                     68 ;               stack to 0x78, return stack to 0xf8.
                                     69 ;               add all port definitions
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



                                     70 ;               add PWM registers
                                     71 ;               add SPI registers and code
                                     72 ;       EF12C, 12mar00cht
                                     73 ;               add MAX5250 D/A converter
                                     74 ;       EF12D, 15mar00cht
                                     75 ;               add all the Lexel interface words
                                     76 ;       EF12E, 18apr00cht, save for reference
                                     77 ;
                                     78 ;       Copyright (c) 2000
                                     79 ;       Dr. C. H. Ting
                                     80 ;       156 14th Avenue
                                     81 ;       San Mateo, CA 94402
                                     82 ;       (650) 571-7639
                                     83 ;
                                     84 
                                     85 
                                     86 ;*********************************************************
                                     87 ;	Assembler constants
                                     88 ;*********************************************************
                           000000    89 RAMBASE =	0x0000	   ;ram base
                           0007FF    90 STACK   =	0x7FF 	;system (return) stack empty 
                           000680    91 DATSTK  =	0x680	;data stack  empty
                           000680    92 TBUFFBASE =     0x680  ; flash read/write transaction buffer address  
                           000700    93 TIBBASE =       0X700  ; transaction input buffer addr.
                                     94 
                                     95 
                                     96 
                                     97 ;; Memory allocation
                                     98 
                           000006    99 UPP     =     RAMBASE+6          ; systeme variables base address 
                           000680   100 SPP     =     RAMBASE+DATSTK     ; data stack bottom 
                           0007FF   101 RPP     =     RAMBASE+STACK      ;  return stack bottom
                           000680   102 ROWBUFF =     RAMBASE+TBUFFBASE ; flash write buffer 
                           000700   103 TIBB    =     RAMBASE+TIBBASE  ; transaction input buffer
                           000080   104 VAR_BASE =    RAMBASE+0x80  ; user variables start here .
                           0007BF   105 VAR_TOP =     STACK-32*CELLL  ; reserve 32 cells for data stack. 
                                    106 
                                    107 ; user variables constants 
                           000006   108 UBASE = UPP       ; numeric base 
                           000008   109 UTMP = UBASE+2    ; temporary storage
                           00000A   110 UINN = UTMP+2     ; >IN tib pointer 
                           00000C   111 UCTIB = UINN+2    ; tib count 
                           00000E   112 UTIB = UCTIB+2    ; tib address 
                           000010   113 UINTER = UTIB+2   ; interpreter vector 
                           000012   114 UHLD = UINTER+2   ; hold 
                           000014   115 UCNTXT = UHLD+2   ; context, dictionary first link 
                           000016   116 UVP = UCNTXT+2    ; variable pointer 
                           000018   117 UCP = UVP+2      ; code pointer
                           00001A   118 ULAST = UCP+2    ; last dictionary pointer 
                           00001C   119 UOFFSET = ULAST+2 ; distance between CP and VP to adjust jump address at compile time.
                           00001E   120 UTFLASH = UOFFSET+2 ; select where between FLASH and RAM for compilation destination. 
                           000020   121 URLAST = UTFLASH+2 ; context for dictionary in RAM memory 
                                    122 
                                    123 ;******  System Variables  ******
                           000022   124 XTEMP	=	URLAST +2;address called by CREATE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                           000024   125 YTEMP	=	XTEMP+2	;address called by CREATE
                           000022   126 PROD1 = XTEMP	;space for UM*
                           000024   127 PROD2 = PROD1+2
                           000026   128 PROD3 = PROD2+2
                           000028   129 CARRY = PROD3+2
                           00002A   130 SP0	= CARRY+2	;initial data stack pointer
                           00002C   131 RP0	= SP0+2		;initial return stack pointer
                           00002E   132 MS    =   RP0+2         ; millisecond counter 
                           000030   133 CNTDWN =  MS+2          ; count down timer 
                           000032   134 PTR16 = CNTDWN+2         ; 24 bits farptr 
                           000033   135 PTR8 = PTR16+1           ; least byte of farptr 
                           000035   136 SEEDX = PTR8+2          ; PRNG seed X 
                           000037   137 SEEDY = SEEDX+2         ; PRNG seed Y 
                                    138 
                                    139 ; EEPROM persistant system variables in EEPROM   
                           004000   140 APP_LAST = EEPROM_BASE ; Application last word pointer  
                           004002   141 APP_RUN = APP_LAST+2   ; application autorun address 
                           004004   142 APP_CP = APP_RUN+2   ; free application space pointer 
                           004006   143 APP_VP = APP_CP+2  ; free data space pointer 
                                    144 
                                    145 
                                    146 ;***********************************************
                                    147 ;; Version control
                                    148 
                           000003   149 VER     =     3         ;major release version
                           000000   150 EXT     =     0         ;minor extension
                                    151 
                                    152 ;; Constants
                                    153 
                           00FFFF   154 TRUEE   =     0xFFFF      ;true flag
                                    155 
                           000040   156 COMPO   =     0x40     ;lexicon compile only bit
                           000080   157 IMEDD   =     0x80     ;lexicon immediate bit
                           001F7F   158 MASKK   =     0x1F7F  ;lexicon bit mask
                                    159 
                           000002   160 CELLL   =     2       ;size of a cell
                           00000A   161 BASEE   =     10      ;default radix
                           000008   162 BKSPP   =     8       ;back space
                           00000A   163 LF      =     10      ;line feed
                           00000D   164 CRR     =     13      ;carriage return
                           00001B   165 ERR     =     27      ;error escape
                           000027   166 TIC     =     39      ;tick
                           0000CD   167 CALLL   =     0xCD     ;CALL opcodes
                           000080   168 IRET_CODE =   0x80    ; IRET opcode 
                                    169 
                                    170         .macro _ledon
                                    171         bres PD_ODR,#LD1_BIT
                                    172         .endm
                                    173 
                                    174         .macro _ledoff
                                    175         bset PD_ODR,#LD1_BIT
                                    176         .endm
                                    177 
                                    178 ;**********************************************************
                                    179         .area DATA (ABS)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      000000                        180         .org RAMBASE 
                                    181 ;**********************************************************
                                    182 
                                    183 ;**********************************************************
                                    184         .area SSEG (ABS) ; STACK
      001700                        185         .org 0x1700
      001700                        186         .ds 256 
                                    187 ; space for DATSTK,TIB and STACK         
                                    188 ;**********************************************************
                                    189 
                                    190 ;**********************************************************
                                    191         .area HOME ; vectors table
                                    192 ;**********************************************************
      008000 82 00 80 96            193 	int main	        ; reset
      008004 82 00 80 80            194 	int NonHandledInterrupt	; trap
      008008 82 00 80 80            195 	int NonHandledInterrupt	; irq0
      00800C 82 00 80 80            196 	int NonHandledInterrupt	; irq1
      008010 82 00 80 80            197 	int NonHandledInterrupt	; irq2
      008014 82 00 80 80            198 	int NonHandledInterrupt	; irq3
      008018 82 00 80 80            199 	int NonHandledInterrupt	; irq4
      00801C 82 00 80 80            200 	int NonHandledInterrupt	; irq5
      008020 82 00 80 80            201 	int NonHandledInterrupt	; irq6
      008024 82 00 80 80            202 	int NonHandledInterrupt	; irq7
      008028 82 00 80 80            203 	int NonHandledInterrupt	; irq8
      00802C 82 00 80 80            204 	int NonHandledInterrupt	; irq9
      008030 82 00 80 80            205 	int NonHandledInterrupt	; irq10
      008034 82 00 80 80            206 	int NonHandledInterrupt	; irq11
      008038 82 00 80 80            207 	int NonHandledInterrupt	; irq12
      00803C 82 00 80 80            208 	int NonHandledInterrupt	; irq13
      008040 82 00 80 80            209 	int NonHandledInterrupt	; irq14
      008044 82 00 80 80            210 	int NonHandledInterrupt	; irq15
      008048 82 00 80 80            211 	int NonHandledInterrupt	; irq16
      00804C 82 00 80 80            212 	int NonHandledInterrupt	; irq17
      008050 82 00 80 80            213 	int NonHandledInterrupt	; irq18
      008054 82 00 80 80            214 	int NonHandledInterrupt	; irq19
      008058 82 00 80 80            215 	int NonHandledInterrupt	; irq20
      00805C 82 00 80 80            216 	int NonHandledInterrupt	; irq21
      008060 82 00 80 80            217 	int NonHandledInterrupt	; irq22
      008064 82 00 80 85            218 	int Timer4Handler	; irq23
      008068 82 00 80 80            219 	int NonHandledInterrupt	; irq24
      00806C 82 00 80 80            220 	int NonHandledInterrupt	; irq25
      008070 82 00 80 80            221 	int NonHandledInterrupt	; irq26
      008074 82 00 80 80            222 	int NonHandledInterrupt	; irq27
      008078 82 00 80 80            223 	int NonHandledInterrupt	; irq28
      00807C 82 00 80 80            224 	int NonHandledInterrupt	; irq29
                                    225 
                                    226 ;**********************************************************
                                    227         .area CODE
                                    228 ;**********************************************************
                                    229 
                                    230 ; non handled interrupt reset MCU
      008080                        231 NonHandledInterrupt:
      008080 A6 80            [ 1]  232         ld a, #0x80
      008082 C7 50 D1         [ 1]  233         ld WWDG_CR,a ; WWDG_CR used to reset mcu
                                    234 	;iret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    235 
                                    236 ; used for milliseconds counter 
                                    237 ; MS is 16 bits counter 
      008085                        238 Timer4Handler:
      008085 72 5F 53 42      [ 1]  239 	clr TIM4_SR 
      008089 BE 2E            [ 2]  240         ldw x,MS 
      00808B 5C               [ 2]  241         incw x 
      00808C BF 2E            [ 2]  242         ldw MS,x
      00808E BE 30            [ 2]  243         ldw x,CNTDWN 
      008090 27 03            [ 1]  244         jreq 1$
      008092 5A               [ 2]  245         decw x 
      008093 BF 30            [ 2]  246         ldw CNTDWN,x 
      008095                        247 1$:         
      008095 80               [11]  248         iret 
                                    249 
                                    250 
                                    251 ;; Main entry points and COLD start data
      008096                        252 main:
                                    253 ; clear all RAM
      008096 AE 00 00         [ 2]  254 	ldw X,#RAMBASE
      008099                        255 clear_ram0:
      008099 7F               [ 1]  256 	clr (X)
      00809A 5C               [ 2]  257 	incw X
      00809B A3 07 FF         [ 2]  258 	cpw X,#RAM_END
      00809E 23 F9            [ 2]  259 	jrule clear_ram0
      0080A0 AE 07 FF         [ 2]  260         ldw x,#RPP
      0080A3 94               [ 1]  261         ldw sp,x
                                    262 ; set SEEDX and SEEDY to 1 
      0080A4 3C 36            [ 1]  263         inc SEEDX+1 
      0080A6 3C 38            [ 1]  264         inc SEEDY+1          
      0080A8 CC 80 C7         [ 2]  265 	jp ORIG
                                    266 
                                    267 ; COLD initialize these variables.
      0080AB                        268 UZERO:
      0080AB 00 0A                  269         .word      BASEE   ;BASE
      0080AD 00 00                  270         .word      0       ;tmp
      0080AF 00 00                  271         .word      0       ;>IN
      0080B1 00 00                  272         .word      0       ;#TIB
      0080B3 07 00                  273         .word      TIBB    ;TIB
      0080B5 93 73                  274         .word      INTER   ;'EVAL
      0080B7 00 00                  275         .word      0       ;HLD
      0080B9 A0 E9                  276         .word      LASTN  ;CNTXT pointer
      0080BB 00 80                  277         .word      VAR_BASE   ;variables free space pointer 
      0080BD A1 80                  278         .word      app_space ; FLASH free space pointer 
      0080BF A0 E9                  279         .word      LASTN   ;LAST
      0080C1 00 00                  280         .word      0        ; OFFSET 
      0080C3 00 00                  281         .word      0       ; TFLASH
                                    282 ;       .word      0       ; URLAST   
      0080C5 00 00                  283 UEND:   .word      0
                                    284 
      0080C7                        285 ORIG:   
                                    286 ; initialize SP
      0080C7 AE 07 FF         [ 2]  287         LDW     X,#STACK  ;initialize return stack
      0080CA 94               [ 1]  288         LDW     SP,X
      0080CB BF 2C            [ 2]  289         LDW     RP0,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      0080CD AE 06 80         [ 2]  290         LDW     X,#DATSTK ;initialize data stack
      0080D0 BF 2A            [ 2]  291         LDW     SP0,X
                                    292 ; initialize PD_0 as output to control LED2
                                    293 ; added by Picatout 
      0080D2 72 10 50 12      [ 1]  294         bset PD_CR1,#LD1_BIT
      0080D6 72 10 50 13      [ 1]  295         bset PD_CR2,#LD1_BIT
      0080DA 72 10 50 11      [ 1]  296         bset PD_DDR,#LD1_BIT
      00005E                        297         _ledoff
      0080DE 72 10 50 0F      [ 1]    1         bset PD_ODR,#LD1_BIT
                                    298 ; initialize clock to HSE
                                    299 ; no divisor 16Mhz 
                                    300 ; Added by Picatout 
      0080E2                        301 clock_init:
      0080E2 72 5F 50 C6      [ 1]  302         clr CLK_CKDIVR
      0080E6 72 12 50 C5      [ 1]  303 	bset CLK_SWCR,#CLK_SWCR_SWEN
      0080EA A6 B4            [ 1]  304 	ld a,#CLK_SWR_HSE
      0080EC C7 50 C4         [ 1]  305 	ld CLK_SWR,a
      0080EF C1 50 C3         [ 1]  306 1$:	cp a,CLK_CMSR
      0080F2 26 FB            [ 1]  307 	jrne 1$
                                    308         
                                    309 ; initialize UART1, 115200 8N1
      0080F4                        310 uart2_init:
      0080F4 72 16 50 C7      [ 1]  311 	bset CLK_PCKENR1,#CLK_PCKENR1_UART2
                                    312 	; configure tx pin
      0080F8 72 1A 50 11      [ 1]  313 	bset PD_DDR,#UART2_TX_PIN ; tx pin
      0080FC 72 1A 50 12      [ 1]  314 	bset PD_CR1,#UART2_TX_PIN ; push-pull output
      008100 72 1A 50 13      [ 1]  315 	bset PD_CR2,#UART2_TX_PIN ; fast output
                                    316 	; baud rate 115200 Fmaster=8Mhz  
      008104 35 0B 52 43      [ 1]  317 	mov UART2_BRR2,#0x0b ; must be loaded first
      008108 35 08 52 42      [ 1]  318 	mov UART2_BRR1,#0x8
      00810C 35 0C 52 45      [ 1]  319 	mov UART2_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                                    320 ; initialize timer4, used for millisecond interrupt  
      008110 35 07 53 45      [ 1]  321 	mov TIM4_PSCR,#7 ; prescale 128  
      008114 35 7D 53 46      [ 1]  322 	mov TIM4_ARR,#125 ; set for 1msec.
      008118 35 05 53 40      [ 1]  323 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00811C 72 10 53 41      [ 1]  324 	bset TIM4_IER,#TIM4_IER_UIE 
                                    325 ; set TIM4 interrupt priority to highest
      008120 A6 3F            [ 1]  326         ld a,#~(IPR_MASK<<6)
      008122 C4 7F 75         [ 1]  327         and a,ITC_SPR6
      008125 AA C0            [ 1]  328         or a,#(IPR3<<6)
      008127 C7 7F 75         [ 1]  329         ld ITC_SPR6,a 
      00812A 9A               [ 1]  330         rim
      00812B CC 9A 15         [ 2]  331         jp  COLD   ;default=MN1
                                    332 
                                    333 
                                    334 ;; place MCU in sleep mode with
                                    335 ;; halt opcode 
                                    336 ;; BYE ( -- )
      00812E 00 00                  337         .word 0
                           0000B0   338         LINK=.
      008130 03                     339         .byte 3 
      008131 42 59 45               340         .ascii "BYE"
      008134                        341 BYE: 
      008134 8E               [10]  342         halt 
      008135 81               [ 4]  343         ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                                    344 
                                    345 ; Enable interrupts 
                                    346 ; EI ( -- )
      008136 81 30                  347         .word LINK 
                           0000B8   348         LINK=.
      008138 02                     349         .byte 2
      008139 45 49                  350         .ascii "EI"
      00813B                        351 EI:
      00813B 9A               [ 1]  352         rim 
      00813C 81               [ 4]  353         ret 
                                    354 
                                    355 ; Disable interrupts
                                    356 ; DI ( -- )
      00813D 81 38                  357         .word LINK 
                           0000BF   358         LINK=.
      00813F 02                     359         .byte 2 
      008140 44 49                  360         .ascii "DI"
      008142                        361 DI:
      008142 9B               [ 1]  362         sim 
      008143 81               [ 4]  363         ret 
                                    364 
                                    365 ; set interrupt priority level 
                                    366 ; SET-ISP ( n1 n2 -- )
                                    367 ; n1 level {1..3}
                                    368 ; n2 vector {0..29}
      008144 81 3F                  369         .word LINK 
                           0000C6   370         LINK=.
      008146 07                     371         .byte 7 
      008147 53 45 54 2D 49 53 50   372         .ascii "SET-ISP"
      00814E                        373 SETISP:
      00814E 90 93            [ 1]  374         ldw y,x 
      008150 90 FE            [ 2]  375         ldw y,(y)
      008152 A6 04            [ 1]  376         ld a,#4 ; 4 slot per register 
                                    377 ;  quotient select register, remainder select slot in register.        
      008154 90 62            [ 2]  378         div y,a ; register=ITC_SPR1[Y], lshift=2*A 
      008156 A4 03            [ 1]  379         and a,#3 
      008158 48               [ 1]  380         sll a ; 2*SLOT  lshift 
      008159 72 A9 7F 70      [ 2]  381         addw y,#ITC_SPR1 
      00815D FF               [ 2]  382         ldw (x),y  ; ( level reg -- )
      00815E 90 5F            [ 1]  383         clrw y 
      008160 90 97            [ 1]  384         ld yl,a 
      008162 1D 00 02         [ 2]  385         subw x,#CELLL 
      008165 FF               [ 2]  386         ldw (x),y  ; ( level reg lshift -- )
      008166 90 93            [ 1]  387         ldw y,x 
      008168 90 EE 02         [ 2]  388         ldw y,(2,y) 
      00816B 90 F6            [ 1]  389         ld a,(y)   ; reg_value
      00816D 1D 00 02         [ 2]  390         subw x,#CELLL 
      008170 FF               [ 2]  391         ldw (x),y ; ( level reg lshift rval -- )
      008171 CD 85 89         [ 4]  392         call OVER ; ( level reg lshift rval lshift -- )
      008174 CD 84 30         [ 4]  393         call DOLIT 
      008177 00 03                  394         .word 3
      008179 CD 85 6F         [ 4]  395         call SWAPP  ; ( level reg lshift rval 3 lshift )
      00817C CD 8A 72         [ 4]  396         call LSHIFT ; creat slot mask 
      00817F CD 87 74         [ 4]  397         call INVER  ; ( level reg lshift rval mask )
      008182 CD 85 AB         [ 4]  398         call ANDD ; ( level reg lshift slot_masked )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      008185 CD 85 28         [ 4]  399         call TOR  ; ( level reg lshift -- R: slot_masked )
      008188 CD 87 1A         [ 4]  400         call ROT  ; ( reg lshift level )
      00818B CD 85 6F         [ 4]  401         call SWAPP ; ( reg level lshift )
      00818E CD 8A 72         [ 4]  402         call LSHIFT  ; ( reg slot_level -- )
      008191 CD 85 09         [ 4]  403         call RFROM ; ( reg slot_level masked_val )
      008194 CD 85 BF         [ 4]  404         call ORR   ; ( reg updated_rval )
      008197 CD 85 6F         [ 4]  405         call SWAPP 
      00819A CD 84 C5         [ 4]  406         call CSTOR
                                    407 
                                    408 ; sélectionne l'application 
                                    409 ; qui démarre automatique lors 
                                    410 ; d'un COLD start 
      00819D 81 46                  411         .word LINK 
                           00011F   412         LINK=.
      00819F 07                     413         .byte 7
      0081A0 41 55 54 4F 52 55 4E   414         .ascii "AUTORUN"
      0081A7                        415 AUTORUN:
      0081A7 CD 91 38         [ 4]  416         call TOKEN 
      0081AA CD 85 5F         [ 4]  417         call DUPP 
      0081AD CD 84 63         [ 4]  418         call QBRAN 
      0081B0 82 89                  419         .word FORGET2
      0081B2 CD 92 35         [ 4]  420         call NAMEQ
      0081B5 CD 87 09         [ 4]  421         call QDUP 
      0081B8 CD 84 63         [ 4]  422         call QBRAN 
      0081BB 82 89                  423         .word FORGET2
      0081BD CD 85 55         [ 4]  424         call DROP 
      0081C0 1D 00 02         [ 2]  425         subw x,#CELLL 
      0081C3 90 AE 40 02      [ 2]  426         ldw y,#APP_RUN 
      0081C7 FF               [ 2]  427         ldw (x),y 
      0081C8 CC 9D 12         [ 2]  428         jp EE_STORE 
                                    429 
                                    430 ;; Reset dictionary pointer before 
                                    431 ;; forgotten word. RAM space and 
                                    432 ;; interrupt vector defined after 
                                    433 ;; must be resetted also.
      0081CB 81 9F                  434         .word LINK 
                           00014D   435         LINK=.
      0081CD 06                     436         .byte 6
      0081CE 46 4F 52 47 45 54      437         .ascii "FORGET" 
      0081D4                        438 FORGET: 
      0081D4 CD 91 38         [ 4]  439         call TOKEN
      0081D7 CD 85 5F         [ 4]  440         call DUPP 
      0081DA CD 84 63         [ 4]  441         call QBRAN 
      0081DD 82 89                  442         .word FORGET2
      0081DF CD 92 35         [ 4]  443         call NAMEQ ; ( a -- ca na | a F )
      0081E2 CD 87 09         [ 4]  444         call QDUP 
      0081E5 CD 84 63         [ 4]  445         call QBRAN 
      0081E8 82 89                  446         .word FORGET2
                                    447 ; only forget users words 
      0081EA CD 85 5F         [ 4]  448         call DUPP ; ( ca na na )
      0081ED CD 84 30         [ 4]  449         call DOLIT 
      0081F0 A1 80                  450         .word app_space 
      0081F2 CD 85 6F         [ 4]  451         call SWAPP 
      0081F5 CD 88 1A         [ 4]  452         call  ULESS 
      0081F8 CD 84 63         [ 4]  453         call QBRAN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      0081FB 82 4B                  454         .word FORGET6 
                                    455 ; ( ca na -- )        
                                    456 ;reset ivec with address >= ca
      0081FD CD 85 6F         [ 4]  457         call SWAPP ; ( na ca -- ) 
      008200 CD 9E D3         [ 4]  458         call CHKIVEC ; ( na -- ) 
                                    459 ; start at LAST and link back to na 
                                    460 ; if variable found reset VP at that point.
      008203                        461 FORGET1:
      008203 CD 86 CB         [ 4]  462         call LAST 
      008206 CD 84 B8         [ 4]  463         call AT 
      008209 CD 85 5F         [ 4]  464         call DUPP  ; ( -- na last last )
      00820C CD 82 9F         [ 4]  465         call FREEVAR ; ( -- na last )
      00820F CD 85 5F         [ 4]  466         call DUPP 
      008212 CD 84 30         [ 4]  467         call DOLIT 
      008215 00 02                  468         .word 2 
      008217 CD 87 D3         [ 4]  469         call SUBB ; ( na last -- na last lfa ) link address 
      00821A CD 84 B8         [ 4]  470         call AT 
      00821D CD 85 5F         [ 4]  471         call DUPP ; ( -- na last a a )
      008220 CD 86 9F         [ 4]  472         call CNTXT 
      008223 CD 84 A1         [ 4]  473         call STORE
      008226 CD 86 CB         [ 4]  474         call LAST  
      008229 CD 84 A1         [ 4]  475         call STORE ; ( --  na last )
      00822C CD 85 89         [ 4]  476         call OVER 
      00822F CD 87 FB         [ 4]  477         call EQUAL ; ( na last na -- na T|F ) 
      008232 CD 84 63         [ 4]  478         call QBRAN 
      008235 82 03                  479         .word FORGET1 
                                    480 ; ( na -- )
      008237 CD 84 30         [ 4]  481         call DOLIT 
      00823A 00 02                  482         .word 2 
      00823C CD 87 D3         [ 4]  483         call SUBB 
      00823F CD 86 BB         [ 4]  484         call CPP 
      008242 CD 84 A1         [ 4]  485         call STORE  
      008245 CD 9B D4         [ 4]  486         call UPDATCP 
      008248 CC 9B AB         [ 2]  487         jp UPDATLAST 
      00824B                        488 FORGET6: ; tried to forget a RAM or system word 
                                    489 ; ( ca na -- )
      00824B 1D 00 02         [ 2]  490         subw x,#CELLL 
      00824E 90 BE 2A         [ 2]  491         ldw y,SP0 
      008251 FF               [ 2]  492         ldw (x),y  
      008252 CD 88 1A         [ 4]  493         call ULESS
      008255 CD 84 63         [ 4]  494         call QBRAN 
      008258 82 7B                  495         .word PROTECTED 
      00825A CD 93 41         [ 4]  496         call ABORQ 
      00825D 1D                     497         .byte 29
      00825E 20 46 6F 72 20 52 41   498         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      00827B                        499 PROTECTED:
      00827B CD 93 41         [ 4]  500         call ABORQ
      00827E 0A                     501         .byte 10
      00827F 20 50 72 6F 74 65 63   502         .ascii " Protected"
             74 65 64
      008289                        503 FORGET2: ; no name or not found in dictionary 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008289 CD 93 41         [ 4]  504         call ABORQ
      00828C 05                     505         .byte 5
      00828D 20 77 68 61 74         506         .ascii " what"
      008292                        507 FORGET4:
      008292 CC 85 55         [ 2]  508         jp DROP 
                                    509 
                                    510 
                                    511 ;---------------------------------
                                    512 ; if na is variable 
                                    513 ; free variable data  
                                    514 ; FREEVAR ( na -- )
                                    515 ;---------------------------------
      008295 81 CD                  516         .word LINK 
                           000217   517         LINK=.
      008297 07                     518         .byte 7 
      008298 46 52 45 45 56 41 52   519         .ascii "FREEVAR"
      00829F                        520 FREEVAR:
      00829F CD 85 5F         [ 4]  521         call DUPP ; ( na na -- )
      0082A2 CD 84 D6         [ 4]  522         CALL CAT  ; ( na c -- )
      0082A5 CD 8A 54         [ 4]  523         call ONEP ;
      0082A8 CD 87 5A         [ 4]  524         CALL PLUS ; ( na c+1 -- ca ) 
      0082AB CD 8A 54         [ 4]  525         call ONEP ; ( ca+ -- ) to get routne address 
      0082AE CD 85 5F         [ 4]  526         call DUPP ; ( ca+ ca+ -- )
      0082B1 CD 84 B8         [ 4]  527         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082B4 CD 84 30         [ 4]  528         call DOLIT 
      0082B7 86 0C                  529         .word DOVAR ; if routine address is DOVAR then variable 
      0082B9 CD 87 FB         [ 4]  530         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082BC CD 84 63         [ 4]  531         call QBRAN 
      0082BF 82 D5                  532         .word FREEVAR4 
      0082C1 CD 84 30         [ 4]  533         call DOLIT 
      0082C4 00 02                  534         .word 2 
      0082C6 CD 87 5A         [ 4]  535         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082C9 CD 84 B8         [ 4]  536         call AT 
      0082CC CD 86 AD         [ 4]  537         call VPP   
      0082CF CD 84 A1         [ 4]  538         call STORE 
      0082D2 CC 9B EB         [ 2]  539         jp UPDATVP 
      0082D5                        540 FREEVAR4: ; not variable
      0082D5 CC 85 55         [ 2]  541         jp  DROP 
                                    542 
                                    543 ;    SEED ( n -- )
                                    544 ; Initialize PRNG seed with n 
      0082D8 82 97                  545         .word LINK 
                           00025A   546         LINK=. 
      0082DA 04                     547         .byte 4 
      0082DB 53 45 45 44            548         .ascii "SEED" 
      0082DF                        549 SEED:
      0082DF 90 93            [ 1]  550         ldw y,x 
      0082E1 1C 00 02         [ 2]  551         addw x,#CELLL
      0082E4 90 FE            [ 2]  552         ldw y,(y)
      0082E6 90 9E            [ 1]  553         ld a,yh 
      0082E8 B7 35            [ 1]  554         ld SEEDX,a 
      0082EA 90 9F            [ 1]  555         ld a,yl 
      0082EC B7 37            [ 1]  556         ld SEEDY,a 
      0082EE 81               [ 4]  557         ret 
                                    558 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    559 ;    RANDOM ( u1 -- u2 )
                                    560 ; Pseudo random number betwen 0 and u1-1
      0082EF 82 DA                  561         .word LINK 
                           000271   562         LINK=.
      0082F1 06                     563         .byte 6
      0082F2 52 41 4E 44 4F 4D      564         .ascii "RANDOM" 
      0082F8                        565 RANDOM:
                                    566 ;local variable 
                           000001   567         SPSAVE=1
                           000002   568         VSIZE=2 
      0082F8 52 02            [ 2]  569         sub sp,#VSIZE
      0082FA 1F 01            [ 2]  570         ldw (SPSAVE,sp),x  
                                    571 ; XTEMP=(SEEDX<<5)^SEEDX 
      0082FC 90 93            [ 1]  572         ldw y,x 
      0082FE 90 FE            [ 2]  573         ldw y,(y)
      008300 90 BF 24         [ 2]  574         ldw YTEMP,y 
      008303 BE 35            [ 2]  575 	ldw x,SEEDX 
      008305 58               [ 2]  576 	sllw x 
      008306 58               [ 2]  577 	sllw x 
      008307 58               [ 2]  578 	sllw x 
      008308 58               [ 2]  579 	sllw x 
      008309 58               [ 2]  580 	sllw x 
      00830A 9E               [ 1]  581 	ld a,xh 
      00830B B8 35            [ 1]  582 	xor a,SEEDX 
      00830D B7 22            [ 1]  583 	ld XTEMP,a 
      00830F 9F               [ 1]  584 	ld a,xl 
      008310 B8 36            [ 1]  585 	xor a,SEEDX+1 
      008312 B7 23            [ 1]  586 	ld XTEMP+1,a 
                                    587 ; SEEDX=SEEDY 
      008314 BE 37            [ 2]  588 	ldw x,SEEDY 
      008316 BF 35            [ 2]  589 	ldw SEEDX,x  
                                    590 ; SEEDY=SEEDY^(SEEDY>>1)
      008318 54               [ 2]  591 	srlw x 
      008319 9E               [ 1]  592 	ld a,xh 
      00831A B8 37            [ 1]  593 	xor a,SEEDY 
      00831C B7 37            [ 1]  594 	ld SEEDY,a  
      00831E 9F               [ 1]  595 	ld a,xl 
      00831F B8 38            [ 1]  596 	xor a,SEEDY+1 
      008321 B7 38            [ 1]  597 	ld SEEDY+1,a 
                                    598 ; XTEMP>>3 
      008323 BE 22            [ 2]  599 	ldw x,XTEMP 
      008325 54               [ 2]  600 	srlw x 
      008326 54               [ 2]  601 	srlw x 
      008327 54               [ 2]  602 	srlw x 
                                    603 ; x=XTEMP^x 
      008328 9E               [ 1]  604 	ld a,xh 
      008329 B8 22            [ 1]  605 	xor a,XTEMP 
      00832B 95               [ 1]  606 	ld xh,a 
      00832C 9F               [ 1]  607 	ld a,xl 
      00832D B8 23            [ 1]  608 	xor a,XTEMP+1  
      00832F 97               [ 1]  609 	ld xl,a 
                                    610 ; SEEDY=x^SEEDY 
      008330 B8 38            [ 1]  611 	xor a,SEEDY+1
      008332 97               [ 1]  612 	ld xl,a 
      008333 9E               [ 1]  613 	ld a,xh 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      008334 B8 37            [ 1]  614 	xor a,SEEDY
      008336 95               [ 1]  615 	ld xh,a 
      008337 BF 37            [ 2]  616 	ldw SEEDY,x 
                                    617 ; return SEEDY modulo YTEMP  
      008339 90 BE 24         [ 2]  618 	ldw y,YTEMP  
      00833C 65               [ 2]  619 	divw x,y 
      00833D 1E 01            [ 2]  620 	ldw x,(SPSAVE,sp)
      00833F FF               [ 2]  621         ldw (x),y 
      008340 5B 02            [ 2]  622         addw sp,#VSIZE 
      008342 81               [ 4]  623 	ret 
                                    624 
                                    625 
                                    626 ;;
                                    627 ;; get millisecond counter 
                                    628 ;; msec ( -- u )
                                    629 ;; Added by Picatout 2020-04-26
      008343 82 F1                  630         .word LINK  
                           0002C5   631         LINK = . 
      008345 04                     632         .byte 4
      008346 4D 53 45 43            633         .ascii "MSEC"
      00834A                        634 MSEC: 
      00834A 1D 00 02         [ 2]  635         subw x,#CELLL 
      00834D 90 BE 2E         [ 2]  636         ldw y,MS 
      008350 FF               [ 2]  637         ldw (x),y 
      008351 81               [ 4]  638         ret 
                                    639 
                                    640 ; suspend execution for u msec 
                                    641 ;  pause ( u -- )
      008352 83 45                  642         .word LINK 
                           0002D4   643         LINK=.
      008354 05                     644         .byte 5 
      008355 50 41 55 53 45         645         .ascii "PAUSE"
      00835A                        646 PAUSE:
      00835A 90 93            [ 1]  647         ldw y,x
      00835C 90 FE            [ 2]  648         ldw y,(y)
      00835E 72 B9 00 2E      [ 2]  649         addw y,MS 
      008362 8F               [10]  650 1$:     wfi  
      008363 90 B3 2E         [ 2]  651         cpw y,MS  
      008366 26 FA            [ 1]  652         jrne 1$        
      008368 1C 00 02         [ 2]  653         addw x,#CELLL 
      00836B 81               [ 4]  654         ret 
                                    655 
                                    656 ; initialize count down timer 
                                    657 ;  TIMER ( u -- )  milliseconds 
      00836C 83 54                  658         .word LINK 
                           0002EE   659         LINK=.
      00836E 05                     660         .byte 5 
      00836F 54 49 4D 45 52         661         .ascii "TIMER" 
      008374                        662 TIMER:
      008374 90 93            [ 1]  663         ldw y,x
      008376 90 FE            [ 2]  664         ldw y,(y) 
      008378 90 BF 30         [ 2]  665         ldw CNTDWN,y
      00837B 1C 00 02         [ 2]  666         addw x,#CELLL 
      00837E 81               [ 4]  667         ret 
                                    668 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                                    669 ; check for TIMER exiparition 
                                    670 ;  TIMEOUT? ( -- 0|-1 )
      00837F 83 6E                  671         .word LINK 
                           000301   672         LINK=. 
      008381 08                     673         .byte 8 
      008382 54 49 4D 45 4F 55 54   674         .ascii "TIMEOUT?"
             3F
      00838A                        675 TIMEOUTQ: 
      00838A 4F               [ 1]  676         clr a
      00838B 1D 00 02         [ 2]  677         subw x,#CELLL 
      00838E 90 BE 30         [ 2]  678         ldw y,CNTDWN 
      008391 26 01            [ 1]  679         jrne 1$ 
      008393 43               [ 1]  680         cpl a 
      008394 E7 01            [ 1]  681 1$:     ld (1,x),a 
      008396 F7               [ 1]  682         ld (x),a 
      008397 81               [ 4]  683         ret         
                                    684 
                                    685 ; reboot MCU 
                                    686 ; REBOOT ( -- )
      008398 83 81                  687         .word LINK 
                           00031A   688         LINK=. 
      00839A 06                     689         .byte 6 
      00839B 52 45 42 4F 4F 54      690         .ascii "REBOOT"
      0083A1                        691 reboot:
      0083A1 CC 80 80         [ 2]  692         jp NonHandledInterrupt
                                    693 
                                    694 ; compile to flash memory 
                                    695 ; TO-FLASH ( -- )
      0083A4 83 9A                  696         .word LINK 
                           000326   697         LINK=.
      0083A6 08                     698         .byte 8
      0083A7 54 4F 2D 46 4C 41 53   699         .ascii "TO-FLASH"
             48
      0083AF                        700 TOFLASH:
      0083AF CD 86 DE         [ 4]  701         call RAMLAST 
      0083B2 CD 84 B8         [ 4]  702         call AT 
      0083B5 CD 87 09         [ 4]  703         call QDUP 
      0083B8 CD 84 63         [ 4]  704         call QBRAN
      0083BB 83 DE                  705         .word 1$
      0083BD CD 93 41         [ 4]  706         call ABORQ 
      0083C0 1D                     707         .byte 29
      0083C1 20 4E 6F 74 20 77 68   708         .ascii " Not while definitions in RAM"   
             69 6C 65 20 64 65 66
             69 6E 69 74 69 6F 6E
             73 20 69 6E 20 52 41
             4D
      0083DE 90 AE FF FF      [ 2]  709 1$:     ldw y,#-1 
      0083E2 90 BF 1E         [ 2]  710         ldw UTFLASH,y
      0083E5 81               [ 4]  711         ret 
                                    712 
                                    713 ; compile to RAM 
                                    714 ; TO-RAM ( -- )
      0083E6 83 A6                  715         .word LINK 
                           000368   716         LINK=.
      0083E8 06                     717         .byte 6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0083E9 54 4F 2D 52 41 4D      718         .ascii "TO-RAM"
      0083EF                        719 TORAM:
      0083EF 90 5F            [ 1]  720         clrw y 
      0083F1 90 BF 1E         [ 2]  721         ldw UTFLASH,y 
      0083F4 81               [ 4]  722         ret 
                                    723         
                                    724 
                                    725 ;; Device dependent I/O
                                    726 ;       ?RX     ( -- c T | F )
                                    727 ;         Return input byte and true, or false.
      0083F5 83 E8                  728         .word      LINK 
                           000377   729 LINK	= .
      0083F7 04                     730         .byte      4
      0083F8 3F 4B 45 59            731         .ascii     "?KEY"
      0083FC                        732 QKEY:
      0083FC 90 5F            [ 1]  733         CLRW Y 
      0083FE 72 0B 52 40 0B   [ 2]  734         BTJF UART2_SR,#UART_SR_RXNE,INCH   ;check status
      008403 C6 52 41         [ 1]  735         LD    A,UART2_DR   ;get char in A
      008406 1D 00 02         [ 2]  736 	SUBW	X,#2
      008409 E7 01            [ 1]  737         LD     (1,X),A
      00840B 7F               [ 1]  738 	CLR	(X)
      00840C 90 53            [ 2]  739         CPLW     Y
      00840E                        740 INCH:
      00840E 1D 00 02         [ 2]  741 	SUBW	X,#2
      008411 FF               [ 2]  742         LDW     (X),Y
      008412 81               [ 4]  743         RET
                                    744 
                                    745 ;       TX!     ( c -- )
                                    746 ;       Send character c to  output device.
      008413 83 F7                  747         .word      LINK
                           000395   748 LINK	= .
      008415 04                     749         .byte      4
      008416 45 4D 49 54            750         .ascii     "EMIT"
      00841A                        751 EMIT:
      00841A E6 01            [ 1]  752         LD     A,(1,X)
      00841C 1C 00 02         [ 2]  753 	ADDW	X,#2
      00841F 72 0F 52 40 FB   [ 2]  754 OUTPUT: BTJF UART2_SR,#UART_SR_TXE,OUTPUT  ;loop until tdre
      008424 C7 52 41         [ 1]  755         LD    UART2_DR,A   ;send A
      008427 81               [ 4]  756         RET
                                    757 
                                    758 ;; The kernel
                                    759 
                                    760 ;       doLIT   ( -- w )
                                    761 ;       Push an inline literal.
      008428 84 15                  762         .word      LINK
                           0003AA   763 LINK	= 	.
      00842A 45                     764 	.byte      COMPO+5
      00842B 44 4F 4C 49 54         765         .ascii     "DOLIT"
      008430                        766 DOLIT:
      008430 1D 00 02         [ 2]  767 	SUBW X,#2
      008433 16 01            [ 2]  768         ldw y,(1,sp)
      008435 90 FE            [ 2]  769         ldw y,(y)
      008437 FF               [ 2]  770         ldw (x),y
      008438 90 85            [ 2]  771         popw y 
      00843A 90 EC 02         [ 2]  772         jp (2,y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    773 
                                    774 ;       next    ( -- )
                                    775 ;       Code for  single index loop.
      00843D 84 2A                  776         .word      LINK
                           0003BF   777 LINK	= 	.
      00843F 44                     778 	.byte      COMPO+4
      008440 6E 65 78 74            779         .ascii     "next"
      008444                        780 DONXT:
      008444 16 03            [ 2]  781 	LDW Y,(3,SP)
      008446 90 5A            [ 2]  782 	DECW Y
      008448 2A 07            [ 1]  783 	JRPL NEX1 ; jump if N=0
      00844A 90 85            [ 2]  784 	POPW Y
      00844C 5B 02            [ 2]  785         addw sp,#2
      00844E 90 EC 02         [ 2]  786         JP (2,Y)
      008451                        787 NEX1:
      008451 17 03            [ 2]  788         LDW (3,SP),Y
      008453 90 85            [ 2]  789         POPW Y
      008455 90 FE            [ 2]  790 	LDW Y,(Y)
      008457 90 FC            [ 2]  791 	JP (Y)
                                    792 
                                    793 ;       ?branch ( f -- )
                                    794 ;       Branch if flag is zero.
      008459 84 3F                  795         .word      LINK
                           0003DB   796 LINK	= 	.
      00845B 47                     797 	.byte      COMPO+7
      00845C 3F 42 52 41 4E 43 48   798         .ascii     "?BRANCH"
      008463                        799 QBRAN:	
      008463 90 93            [ 1]  800         LDW Y,X
      008465 1C 00 02         [ 2]  801 	ADDW X,#2
      008468 90 FE            [ 2]  802 	LDW Y,(Y)
      00846A 27 0E            [ 1]  803         JREQ     BRAN
      00846C 90 85            [ 2]  804 	POPW Y
      00846E 90 EC 02         [ 2]  805 	JP (2,Y)
                                    806         
                                    807 ;       branch  ( -- )
                                    808 ;       Branch to an inline address.
      008471 84 5B                  809         .word      LINK
                           0003F3   810 LINK	= 	.
      008473 46                     811 	.byte      COMPO+6
      008474 42 52 41 4E 43 48      812         .ascii     "BRANCH"
      00847A                        813 BRAN:
      00847A 90 85            [ 2]  814         POPW Y
      00847C 90 FE            [ 2]  815 	LDW Y,(Y)
      00847E 90 FC            [ 2]  816         JP     (Y)
                                    817 
                                    818 ;       EXECUTE ( ca -- )
                                    819 ;       Execute  word at ca.
      008480 84 73                  820         .word      LINK
                           000402   821 LINK	= 	.
      008482 07                     822         .byte       7
      008483 45 58 45 43 55 54 45   823         .ascii     "EXECUTE"
      00848A                        824 EXECU:
      00848A 90 93            [ 1]  825         LDW Y,X
      00848C 1C 00 02         [ 2]  826 	ADDW X,#2
      00848F 90 FE            [ 2]  827 	LDW  Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      008491 90 FC            [ 2]  828         JP   (Y)
                                    829 
                           000001   830 OPTIMIZE = 1
                           000001   831 .if OPTIMIZE 
                                    832 ; remplacement de CALL EXIT par 
                                    833 ; le opcode de RET.
                                    834 ; Voir modification au code de ";"
                                    835 ;
                                    836 ;       EXIT    ( -- )
                                    837 ;       Terminate a colon definition.
      008493 84 82                  838         .word      LINK
                           000415   839 LINK = .
      008495 04                     840         .byte      4
      008496 45 58 49 54            841         .ascii     "EXIT"
      00849A                        842 EXIT:
      00849A 90 85            [ 2]  843         POPW Y
      00849C 81               [ 4]  844         RET
                                    845 .endif 
                                    846 
                                    847 ;       !       ( w a -- )
                                    848 ;       Pop  data stack to memory.
      00849D 84 95                  849         .word      LINK
                           00041F   850 LINK = .
      00849F 01                     851         .byte      1
      0084A0 21                     852         .ascii     "!"
      0084A1                        853 STORE:
      0084A1 90 93            [ 1]  854         LDW Y,X
      0084A3 90 FE            [ 2]  855         LDW Y,(Y)    ;Y=a
      0084A5 90 BF 24         [ 2]  856         LDW YTEMP,Y
      0084A8 90 93            [ 1]  857         LDW Y,X
      0084AA 90 EE 02         [ 2]  858         LDW Y,(2,Y)
      0084AD 91 CF 24         [ 5]  859         LDW [YTEMP],Y ;store w at a
      0084B0 1C 00 04         [ 2]  860         ADDW X,#4 ; DDROP 
      0084B3 81               [ 4]  861         RET     
                                    862 
                                    863 ;       @       ( a -- w )
                                    864 ;       Push memory location to stack.
      0084B4 84 9F                  865         .word      LINK
                           000436   866 LINK	= 	.
      0084B6 01                     867         .byte    1
      0084B7 40                     868         .ascii	"@"
      0084B8                        869 AT:
      0084B8 90 93            [ 1]  870         LDW Y,X     ;Y = a
      0084BA 90 FE            [ 2]  871         LDW Y,(Y)   ; address 
      0084BC 90 FE            [ 2]  872         LDW Y,(Y)   ; value 
      0084BE FF               [ 2]  873         LDW (X),Y ;w = @Y
      0084BF 81               [ 4]  874         RET     
                                    875 
                                    876 ;       C!      ( c b -- )
                                    877 ;       Pop  data stack to byte memory.
      0084C0 84 B6                  878         .word      LINK
                           000442   879 LINK	= .
      0084C2 02                     880         .byte      2
      0084C3 43 21                  881         .ascii     "C!"
      0084C5                        882 CSTOR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      0084C5 90 93            [ 1]  883         LDW Y,X
      0084C7 90 FE            [ 2]  884 	LDW Y,(Y)    ;Y=b
      0084C9 E6 03            [ 1]  885         LD A,(3,X)    ;D = c
      0084CB 90 F7            [ 1]  886         LD  (Y),A     ;store c at b
      0084CD 1C 00 04         [ 2]  887 	ADDW X,#4 ; DDROP 
      0084D0 81               [ 4]  888         RET     
                                    889 
                                    890 ;       C@      ( b -- c )
                                    891 ;       Push byte in memory to  stack.
      0084D1 84 C2                  892         .word      LINK
                           000453   893 LINK	= 	.
      0084D3 02                     894         .byte      2
      0084D4 43 40                  895         .ascii     "C@"
      0084D6                        896 CAT:
      0084D6 90 93            [ 1]  897         LDW Y,X     ;Y=b
      0084D8 90 FE            [ 2]  898         LDW Y,(Y)
      0084DA 90 F6            [ 1]  899         LD A,(Y)
      0084DC E7 01            [ 1]  900         LD (1,X),A
      0084DE 7F               [ 1]  901         CLR (X)
      0084DF 81               [ 4]  902         RET     
                                    903 
                                    904 ;       RP@     ( -- a )
                                    905 ;       Push current RP to data stack.
      0084E0 84 D3                  906         .word      LINK
                           000462   907 LINK	= .
      0084E2 03                     908         .byte      3
      0084E3 52 50 40               909         .ascii     "RP@"
      0084E6                        910 RPAT:
      0084E6 90 96            [ 1]  911         LDW Y,SP    ;save return addr
      0084E8 1D 00 02         [ 2]  912         SUBW X,#2
      0084EB FF               [ 2]  913         LDW (X),Y
      0084EC 81               [ 4]  914         RET     
                                    915 
                                    916 ;       RP!     ( a -- )
                                    917 ;       Set  return stack pointer.
      0084ED 84 E2                  918         .word      LINK
                           00046F   919 LINK	= 	. 
      0084EF 43                     920 	.byte      COMPO+3
      0084F0 52 50 21               921         .ascii     "RP!"
      0084F3                        922 RPSTO:
      0084F3 90 85            [ 2]  923         POPW Y
      0084F5 90 BF 24         [ 2]  924         LDW YTEMP,Y
      0084F8 90 93            [ 1]  925         LDW Y,X
      0084FA 90 FE            [ 2]  926         LDW Y,(Y)
      0084FC 90 94            [ 1]  927         LDW SP,Y
      0084FE 1C 00 02         [ 2]  928         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      008501 92 CC 24         [ 5]  929         JP [YTEMP]
                                    930 
                                    931 ;       R>      ( -- w )
                                    932 ;       Pop return stack to data stack.
      008504 84 EF                  933         .word      LINK
                           000486   934 LINK	= 	. 
      008506 42                     935 	.byte      COMPO+2
      008507 52 3E                  936         .ascii     "R>"
      008509                        937 RFROM:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      008509 90 85            [ 2]  938         POPW Y    ;save return addr
      00850B 90 BF 24         [ 2]  939         LDW YTEMP,Y
      00850E 90 85            [ 2]  940         POPW Y
      008510 1D 00 02         [ 2]  941         SUBW X,#2
      008513 FF               [ 2]  942         LDW (X),Y
      008514 92 CC 24         [ 5]  943         JP [YTEMP]
                                    944 
                                    945 ;       R@      ( -- w )
                                    946 ;       Copy top of return stack to stack.
      008517 85 06                  947         .word      LINK
                           000499   948 LINK	= 	. 
      008519 02                     949         .byte      2
      00851A 52 40                  950         .ascii     "R@"
      00851C                        951 RAT:
      00851C 16 03            [ 2]  952         ldw y,(3,sp)
      00851E 1D 00 02         [ 2]  953         subw x,#CELLL 
      008521 FF               [ 2]  954         ldw (x),y 
      008522 81               [ 4]  955         ret 
                                    956 
                                    957 ;       >R      ( w -- )
                                    958 ;       Push data stack to return stack.
      008523 85 19                  959         .word      LINK
                           0004A5   960 LINK	= 	. 
      008525 42                     961 	.byte      COMPO+2
      008526 3E 52                  962         .ascii     ">R"
      008528                        963 TOR:
      008528 90 85            [ 2]  964         POPW Y    ;save return addr
      00852A 90 BF 24         [ 2]  965         LDW YTEMP,Y
      00852D 90 93            [ 1]  966         LDW Y,X
      00852F 90 FE            [ 2]  967         LDW Y,(Y)
      008531 90 89            [ 2]  968         PUSHW Y    ;restore return addr
      008533 1C 00 02         [ 2]  969         ADDW X,#2
      008536 92 CC 24         [ 5]  970         JP [YTEMP]
                                    971 
                                    972 ;       SP@     ( -- a )
                                    973 ;       Push current stack pointer.
      008539 85 25                  974         .word      LINK
                           0004BB   975 LINK	= 	. 
      00853B 03                     976         .byte      3
      00853C 53 50 40               977         .ascii     "SP@"
      00853F                        978 SPAT:
      00853F 90 93            [ 1]  979 	LDW Y,X
      008541 1D 00 02         [ 2]  980         SUBW X,#2
      008544 FF               [ 2]  981 	LDW (X),Y
      008545 81               [ 4]  982         RET     
                                    983 
                                    984 ;       SP!     ( a -- )
                                    985 ;       Set  data stack pointer.
      008546 85 3B                  986         .word      LINK
                           0004C8   987 LINK	= 	. 
      008548 03                     988         .byte      3
      008549 53 50 21               989         .ascii     "SP!"
      00854C                        990 SPSTO:
      00854C FE               [ 2]  991         LDW     X,(X)     ;X = a
      00854D 81               [ 4]  992         RET     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                                    993 
                                    994 ;       DROP    ( w -- )
                                    995 ;       Discard top stack item.
      00854E 85 48                  996         .word      LINK
                           0004D0   997 LINK	= 	. 
      008550 04                     998         .byte      4
      008551 44 52 4F 50            999         .ascii     "DROP"
      008555                       1000 DROP:
      008555 1C 00 02         [ 2] 1001         ADDW X,#2     
      008558 81               [ 4] 1002         RET     
                                   1003 
                                   1004 ;       DUP     ( w -- w w )
                                   1005 ;       Duplicate  top stack item.
      008559 85 50                 1006         .word      LINK
                           0004DB  1007 LINK	= 	. 
      00855B 03                    1008         .byte      3
      00855C 44 55 50              1009         .ascii     "DUP"
      00855F                       1010 DUPP:
      00855F 90 93            [ 1] 1011 	LDW Y,X
      008561 1D 00 02         [ 2] 1012         SUBW X,#2
      008564 90 FE            [ 2] 1013 	LDW Y,(Y)
      008566 FF               [ 2] 1014 	LDW (X),Y
      008567 81               [ 4] 1015         RET     
                                   1016 
                                   1017 ;       SWAP    ( w1 w2 -- w2 w1 )
                                   1018 ;       Exchange top two stack items.
      008568 85 5B                 1019         .word      LINK
                           0004EA  1020 LINK	= 	. 
      00856A 04                    1021         .byte      4
      00856B 53 57 41 50           1022         .ascii     "SWAP"
      00856F                       1023 SWAPP:
      00856F 90 93            [ 1] 1024         LDW Y,X
      008571 90 FE            [ 2] 1025         LDW Y,(Y)
      008573 90 BF 24         [ 2] 1026         LDW YTEMP,Y
      008576 90 93            [ 1] 1027         LDW Y,X
      008578 90 EE 02         [ 2] 1028         LDW Y,(2,Y)
      00857B FF               [ 2] 1029         LDW (X),Y
      00857C 90 BE 24         [ 2] 1030         LDW Y,YTEMP
      00857F EF 02            [ 2] 1031         LDW (2,X),Y
      008581 81               [ 4] 1032         RET     
                                   1033 
                                   1034 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                   1035 ;       Copy second stack item to top.
      008582 85 6A                 1036         .word      LINK
                           000504  1037 LINK	= . 
      008584 04                    1038         .byte      4
      008585 4F 56 45 52           1039         .ascii     "OVER"
      008589                       1040 OVER:
      008589 1D 00 02         [ 2] 1041         SUBW X,#2
      00858C 90 93            [ 1] 1042         LDW Y,X
      00858E 90 EE 04         [ 2] 1043         LDW Y,(4,Y)
      008591 FF               [ 2] 1044         LDW (X),Y
      008592 81               [ 4] 1045         RET     
                                   1046 
                                   1047 ;       0<      ( n -- t )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                   1048 ;       Return true if n is negative.
      008593 85 84                 1049         .word      LINK
                           000515  1050 LINK	= . 
      008595 02                    1051         .byte      2
      008596 30 3C                 1052         .ascii     "0<"
      008598                       1053 ZLESS:
      008598 A6 FF            [ 1] 1054         LD A,#0xFF
      00859A 90 93            [ 1] 1055         LDW Y,X
      00859C 90 FE            [ 2] 1056         LDW Y,(Y)
      00859E 2B 01            [ 1] 1057         JRMI     ZL1
      0085A0 4F               [ 1] 1058         CLR A   ;false
      0085A1 F7               [ 1] 1059 ZL1:    LD     (X),A
      0085A2 E7 01            [ 1] 1060         LD (1,X),A
      0085A4 81               [ 4] 1061 	RET     
                                   1062 
                                   1063 ;       AND     ( w w -- w )
                                   1064 ;       Bitwise AND.
      0085A5 85 95                 1065         .word      LINK
                           000527  1066 LINK	= . 
      0085A7 03                    1067         .byte      3
      0085A8 41 4E 44              1068         .ascii     "AND"
      0085AB                       1069 ANDD:
      0085AB F6               [ 1] 1070         LD  A,(X)    ;D=w
      0085AC E4 02            [ 1] 1071         AND A,(2,X)
      0085AE E7 02            [ 1] 1072         LD (2,X),A
      0085B0 E6 01            [ 1] 1073         LD A,(1,X)
      0085B2 E4 03            [ 1] 1074         AND A,(3,X)
      0085B4 E7 03            [ 1] 1075         LD (3,X),A
      0085B6 1C 00 02         [ 2] 1076         ADDW X,#2
      0085B9 81               [ 4] 1077         RET
                                   1078 
                                   1079 ;       OR      ( w w -- w )
                                   1080 ;       Bitwise inclusive OR.
      0085BA 85 A7                 1081         .word      LINK
                           00053C  1082 LINK = . 
      0085BC 02                    1083         .byte      2
      0085BD 4F 52                 1084         .ascii     "OR"
      0085BF                       1085 ORR:
      0085BF F6               [ 1] 1086         LD A,(X)    ;D=w
      0085C0 EA 02            [ 1] 1087         OR A,(2,X)
      0085C2 E7 02            [ 1] 1088         LD (2,X),A
      0085C4 E6 01            [ 1] 1089         LD A,(1,X)
      0085C6 EA 03            [ 1] 1090         OR A,(3,X)
      0085C8 E7 03            [ 1] 1091         LD (3,X),A
      0085CA 1C 00 02         [ 2] 1092         ADDW X,#2
      0085CD 81               [ 4] 1093         RET
                                   1094 
                                   1095 ;       XOR     ( w w -- w )
                                   1096 ;       Bitwise exclusive OR.
      0085CE 85 BC                 1097         .word      LINK
                           000550  1098 LINK	= . 
      0085D0 03                    1099         .byte      3
      0085D1 58 4F 52              1100         .ascii     "XOR"
      0085D4                       1101 XORR:
      0085D4 F6               [ 1] 1102         LD A,(X)    ;D=w
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      0085D5 E8 02            [ 1] 1103         XOR A,(2,X)
      0085D7 E7 02            [ 1] 1104         LD (2,X),A
      0085D9 E6 01            [ 1] 1105         LD A,(1,X)
      0085DB E8 03            [ 1] 1106         XOR A,(3,X)
      0085DD E7 03            [ 1] 1107         LD (3,X),A
      0085DF 1C 00 02         [ 2] 1108         ADDW X,#2
      0085E2 81               [ 4] 1109         RET
                                   1110 
                                   1111 ;       UM+     ( u u -- udsum )
                                   1112 ;       Add two unsigned single
                                   1113 ;       and return a double sum.
      0085E3 85 D0                 1114         .word      LINK
                           000565  1115 LINK	= . 
      0085E5 03                    1116         .byte      3
      0085E6 55 4D 2B              1117         .ascii     "UM+"
      0085E9                       1118 UPLUS:
      0085E9 A6 01            [ 1] 1119         LD A,#1
      0085EB 90 93            [ 1] 1120         LDW Y,X
      0085ED 90 EE 02         [ 2] 1121         LDW Y,(2,Y)
      0085F0 90 BF 24         [ 2] 1122         LDW YTEMP,Y
      0085F3 90 93            [ 1] 1123         LDW Y,X
      0085F5 90 FE            [ 2] 1124         LDW Y,(Y)
      0085F7 72 B9 00 24      [ 2] 1125         ADDW Y,YTEMP
      0085FB EF 02            [ 2] 1126         LDW (2,X),Y
      0085FD 25 01            [ 1] 1127         JRC     UPL1
      0085FF 4F               [ 1] 1128         CLR A
      008600 E7 01            [ 1] 1129 UPL1:   LD     (1,X),A
      008602 7F               [ 1] 1130         CLR (X)
      008603 81               [ 4] 1131         RET
                                   1132 
                                   1133 ;; System and user variables
                                   1134 
                                   1135 ;       doVAR   ( -- a )
                                   1136 ;       Code for VARIABLE and CREATE.
      008604 85 E5                 1137         .word      LINK
                           000586  1138 LINK	= . 
      008606 45                    1139 	.byte      COMPO+5
      008607 44 4F 56 41 52        1140         .ascii     "DOVAR"
      00860C                       1141 DOVAR:
      00860C 1D 00 02         [ 2] 1142 	SUBW X,#2
      00860F 90 85            [ 2] 1143         POPW Y    ;get return addr (pfa)
      008611 90 FE            [ 2] 1144         LDW Y,(Y) ; indirect address 
      008613 FF               [ 2] 1145         LDW (X),Y    ;push on stack
      008614 81               [ 4] 1146         RET     ;go to RET of EXEC
                                   1147 
                                   1148 ;       BASE    ( -- a )
                                   1149 ;       Radix base for numeric I/O.
      008615 86 06                 1150         .word      LINK        
                           000597  1151 LINK = . 
      008617 04                    1152         .byte      4
      008618 42 41 53 45           1153         .ascii     "BASE"
      00861C                       1154 BASE:
      00861C 90 AE 00 06      [ 2] 1155 	LDW Y,#UBASE 
      008620 1D 00 02         [ 2] 1156 	SUBW X,#2
      008623 FF               [ 2] 1157         LDW (X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008624 81               [ 4] 1158         RET
                                   1159 
                                   1160 ;       tmp     ( -- a )
                                   1161 ;       A temporary storage.
      008625 86 17                 1162         .word      LINK
                                   1163         
                           0005A7  1164 LINK = . 
      008627 03                    1165 	.byte      3
      008628 54 4D 50              1166         .ascii     "TMP"
      00862B                       1167 TEMP:
      00862B 90 AE 00 08      [ 2] 1168 	LDW Y,#UTMP
      00862F 1D 00 02         [ 2] 1169 	SUBW X,#2
      008632 FF               [ 2] 1170         LDW (X),Y
      008633 81               [ 4] 1171         RET
                                   1172 
                                   1173 ;       >IN     ( -- a )
                                   1174 ;        Hold parsing pointer.
      008634 86 27                 1175         .word      LINK
                           0005B6  1176 LINK = . 
      008636 03                    1177         .byte      3
      008637 3E 49 4E              1178         .ascii    ">IN"
      00863A                       1179 INN:
      00863A 90 AE 00 0A      [ 2] 1180 	LDW Y,#UINN 
      00863E 1D 00 02         [ 2] 1181 	SUBW X,#2
      008641 FF               [ 2] 1182         LDW (X),Y
      008642 81               [ 4] 1183         RET
                                   1184 
                                   1185 ;       #TIB    ( -- a )
                                   1186 ;       Count in terminal input buffer.
      008643 86 36                 1187         .word      LINK
                           0005C5  1188 LINK = . 
      008645 04                    1189         .byte      4
      008646 23 54 49 42           1190         .ascii     "#TIB"
      00864A                       1191 NTIB:
      00864A 90 AE 00 0C      [ 2] 1192 	LDW Y,#UCTIB 
      00864E 1D 00 02         [ 2] 1193 	SUBW X,#2
      008651 FF               [ 2] 1194         LDW (X),Y
      008652 81               [ 4] 1195         RET
                                   1196 
                                   1197 ;       TBUF ( -- a )
                                   1198 ;       address of 128 bytes transaction buffer 
      008653 86 45                 1199         .word LINK 
                           0005D5  1200         LINK=.
      008655 04                    1201         .byte 4 
      008656 54 42 55 46           1202         .ascii "TBUF"
      00865A                       1203 TBUF:
      00865A 90 AE 06 80      [ 2] 1204         ldw y,#ROWBUFF
      00865E 1D 00 02         [ 2] 1205         subw x,#CELLL
      008661 FF               [ 2] 1206         ldw (x),y 
      008662 81               [ 4] 1207         ret 
                                   1208 
                                   1209 ; systeme variable 
                                   1210 ; compilation destination 
                                   1211 ; TFLASH ( -- A )
      008663 86 55                 1212         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



                           0005E5  1213         LINK=.
      008665 06                    1214         .byte 6 
      008666 54 46 4C 41 53 48     1215         .ascii "TFLASH"         
      00866C                       1216 TFLASH:
      00866C 1D 00 02         [ 2] 1217         subw x,#CELLL 
      00866F 90 AE 00 1E      [ 2] 1218         ldw y,#UTFLASH
      008673 FF               [ 2] 1219         ldw (x),y 
      008674 81               [ 4] 1220         ret 
                                   1221 
                                   1222 ;       "EVAL   ( -- a )
                                   1223 ;       Execution vector of EVAL.
      008675 86 65                 1224         .word      LINK
                           0005F7  1225 LINK = . 
      008677 05                    1226         .byte      5
      008678 27 45 56 41 4C        1227         .ascii     "'EVAL"
      00867D                       1228 TEVAL:
      00867D 90 AE 00 10      [ 2] 1229 	LDW Y,#UINTER 
      008681 1D 00 02         [ 2] 1230 	SUBW X,#2
      008684 FF               [ 2] 1231         LDW (X),Y
      008685 81               [ 4] 1232         RET
                                   1233 
                                   1234 ;       HLD     ( -- a )
                                   1235 ;       Hold a pointer of output string.
      008686 86 77                 1236         .word      LINK
                           000608  1237 LINK = . 
      008688 03                    1238         .byte      3
      008689 48 4C 44              1239         .ascii     "HLD"
      00868C                       1240 HLD:
      00868C 90 AE 00 12      [ 2] 1241 	LDW Y,#UHLD 
      008690 1D 00 02         [ 2] 1242 	SUBW X,#2
      008693 FF               [ 2] 1243         LDW (X),Y
      008694 81               [ 4] 1244         RET
                                   1245 
                                   1246 ;       CONTEXT ( -- a )
                                   1247 ;       Start vocabulary search.
      008695 86 88                 1248         .word      LINK
                           000617  1249 LINK = . 
      008697 07                    1250         .byte      7
      008698 43 4F 4E 54 45 58 54  1251         .ascii     "CONTEXT"
      00869F                       1252 CNTXT:
      00869F 90 AE 00 14      [ 2] 1253 	LDW Y,#UCNTXT
      0086A3 1D 00 02         [ 2] 1254 	SUBW X,#2
      0086A6 FF               [ 2] 1255         LDW (X),Y
      0086A7 81               [ 4] 1256         RET
                                   1257 
                                   1258 ;       VP      ( -- a )
                                   1259 ;       Point to top of variables
      0086A8 86 97                 1260         .word      LINK
                           00062A  1261 LINK = . 
      0086AA 02                    1262         .byte      2
      0086AB 56 50                 1263         .ascii     "VP"
      0086AD                       1264 VPP:
      0086AD 90 AE 00 16      [ 2] 1265 	LDW Y,#UVP 
      0086B1 1D 00 02         [ 2] 1266 	SUBW X,#2
      0086B4 FF               [ 2] 1267         LDW (X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0086B5 81               [ 4] 1268         RET
                                   1269 
                                   1270 ;       CP    ( -- a )
                                   1271 ;       Pointer to top of FLASH 
      0086B6 86 AA                 1272         .word LINK 
                           000638  1273         LINK=.
      0086B8 02                    1274         .byte 2 
      0086B9 43 50                 1275         .ascii "CP"
      0086BB                       1276 CPP: 
      0086BB 90 AE 00 18      [ 2] 1277         ldw y,#UCP 
      0086BF 1D 00 02         [ 2] 1278         subw x,#CELLL 
      0086C2 FF               [ 2] 1279         ldw (x),y 
      0086C3 81               [ 4] 1280         ret                
                                   1281 
                                   1282 ;       LAST    ( -- a )
                                   1283 ;       Point to last name in dictionary.
      0086C4 86 B8                 1284         .word      LINK
                           000646  1285 LINK = . 
      0086C6 04                    1286         .byte      4
      0086C7 4C 41 53 54           1287         .ascii     "LAST"
      0086CB                       1288 LAST:
      0086CB 90 AE 00 1A      [ 2] 1289 	LDW Y,#ULAST 
      0086CF 1D 00 02         [ 2] 1290 	SUBW X,#2
      0086D2 FF               [ 2] 1291         LDW (X),Y
      0086D3 81               [ 4] 1292         RET
                                   1293 
                                   1294 ; address of system variable URLAST 
                                   1295 ;       RAMLAST ( -- a )
                                   1296 ; RAM dictionary context 
      0086D4 86 C6                 1297         .word LINK 
                           000656  1298         LINK=. 
      0086D6 07                    1299         .byte 7  
      0086D7 52 41 4D 4C 41 53 54  1300         .ascii "RAMLAST" 
      0086DE                       1301 RAMLAST: 
      0086DE 90 AE 00 20      [ 2] 1302         ldw y,#URLAST 
      0086E2 1D 00 02         [ 2] 1303         subw x,#CELLL 
      0086E5 FF               [ 2] 1304         ldw (x),y 
      0086E6 81               [ 4] 1305         ret 
                                   1306 
                                   1307 ; OFFSET ( -- a )
                                   1308 ; address of system variable OFFSET 
      0086E7 86 D6                 1309         .word LINK 
                           000669  1310         LINK=.
      0086E9 06                    1311         .byte 6
      0086EA 4F 46 46 53 45 54     1312         .ascii "OFFSET" 
      0086F0                       1313 OFFSET: 
      0086F0 1D 00 02         [ 2] 1314         subw x,#CELLL
      0086F3 90 AE 00 1C      [ 2] 1315         ldw y,#UOFFSET 
      0086F7 FF               [ 2] 1316         ldw (x),y 
      0086F8 81               [ 4] 1317         ret 
                                   1318 
                                   1319 ; adjust jump address adding OFFSET
                                   1320 ; ADR-ADJ ( a -- a+offset )
      0086F9                       1321 ADRADJ: 
      0086F9 CD 86 F0         [ 4] 1322         call OFFSET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      0086FC CD 84 B8         [ 4] 1323         call AT 
      0086FF CC 87 5A         [ 2] 1324         jp PLUS 
                                   1325 
                                   1326 
                                   1327 ;; Common functions
                                   1328 
                                   1329 ;       ?DUP    ( w -- w w | 0 )
                                   1330 ;       Dup tos if its is not zero.
      008702 86 E9                 1331         .word      LINK
                           000684  1332 LINK = . 
      008704 04                    1333         .byte      4
      008705 3F 44 55 50           1334         .ascii     "?DUP"
      008709                       1335 QDUP:
      008709 90 93            [ 1] 1336         LDW Y,X
      00870B 90 FE            [ 2] 1337 	LDW Y,(Y)
      00870D 27 04            [ 1] 1338         JREQ     QDUP1
      00870F 1D 00 02         [ 2] 1339 	SUBW X,#2
      008712 FF               [ 2] 1340         LDW (X),Y
      008713 81               [ 4] 1341 QDUP1:  RET
                                   1342 
                                   1343 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1344 ;       Rot 3rd item to top.
      008714 87 04                 1345         .word      LINK
                           000696  1346 LINK = . 
      008716 03                    1347         .byte      3
      008717 52 4F 54              1348         .ascii     "ROT"
      00871A                       1349 ROT:
      00871A 90 93            [ 1] 1350         ldw y,x 
      00871C 90 FE            [ 2] 1351         ldw y,(y)
      00871E 90 89            [ 2] 1352         pushw y 
      008720 90 93            [ 1] 1353         ldw y,x 
      008722 90 EE 04         [ 2] 1354         ldw y,(4,y)
      008725 FF               [ 2] 1355         ldw (x),y 
      008726 90 93            [ 1] 1356         ldw y,x 
      008728 90 EE 02         [ 2] 1357         ldw y,(2,y)
      00872B EF 04            [ 2] 1358         ldw (4,x),y 
      00872D 90 85            [ 2] 1359         popw y 
      00872F EF 02            [ 2] 1360         ldw (2,x),y
      008731 81               [ 4] 1361         ret 
                                   1362 
                                   1363 ;       2DROP   ( w w -- )
                                   1364 ;       Discard two items on stack.
      008732 87 16                 1365         .word      LINK
                           0006B4  1366 LINK = . 
      008734 05                    1367         .byte      5
      008735 32 44 52 4F 50        1368         .ascii     "2DROP"
      00873A                       1369 DDROP:
      00873A 1C 00 04         [ 2] 1370         ADDW X,#4
      00873D 81               [ 4] 1371         RET
                                   1372 
                                   1373 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1374 ;       Duplicate top two items.
      00873E 87 34                 1375         .word      LINK
                           0006C0  1376 LINK = . 
      008740 04                    1377         .byte      4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      008741 32 44 55 50           1378         .ascii     "2DUP"
      008745                       1379 DDUP:
      008745 1D 00 04         [ 2] 1380         SUBW X,#4
      008748 90 93            [ 1] 1381         LDW Y,X
      00874A 90 EE 06         [ 2] 1382         LDW Y,(6,Y)
      00874D EF 02            [ 2] 1383         LDW (2,X),Y
      00874F 90 93            [ 1] 1384         LDW Y,X
      008751 90 EE 04         [ 2] 1385         LDW Y,(4,Y)
      008754 FF               [ 2] 1386         LDW (X),Y
      008755 81               [ 4] 1387         RET
                                   1388 
                                   1389 ;       +       ( w w -- sum )
                                   1390 ;       Add top two items.
      008756 87 40                 1391         .word      LINK
                           0006D8  1392 LINK = . 
      008758 01                    1393         .byte      1
      008759 2B                    1394         .ascii     "+"
      00875A                       1395 PLUS:
      00875A 90 93            [ 1] 1396         LDW Y,X
      00875C 90 FE            [ 2] 1397         LDW Y,(Y)
      00875E 90 BF 24         [ 2] 1398         LDW YTEMP,Y
      008761 1C 00 02         [ 2] 1399         ADDW X,#2
      008764 90 93            [ 1] 1400         LDW Y,X
      008766 90 FE            [ 2] 1401         LDW Y,(Y)
      008768 72 B9 00 24      [ 2] 1402         ADDW Y,YTEMP
      00876C FF               [ 2] 1403         LDW (X),Y
      00876D 81               [ 4] 1404         RET
                                   1405 
                                   1406 ;       NOT     ( w -- w )
                                   1407 ;       One's complement of tos.
      00876E 87 58                 1408         .word      LINK
                           0006F0  1409 LINK = . 
      008770 03                    1410         .byte      3
      008771 4E 4F 54              1411         .ascii     "NOT"
      008774                       1412 INVER:
      008774 90 93            [ 1] 1413         LDW Y,X
      008776 90 FE            [ 2] 1414         LDW Y,(Y)
      008778 90 53            [ 2] 1415         CPLW Y
      00877A FF               [ 2] 1416         LDW (X),Y
      00877B 81               [ 4] 1417         RET
                                   1418 
                                   1419 ;       NEGATE  ( n -- -n )
                                   1420 ;       Two's complement of tos.
      00877C 87 70                 1421         .word      LINK
                           0006FE  1422 LINK = . 
      00877E 06                    1423         .byte      6
      00877F 4E 45 47 41 54 45     1424         .ascii     "NEGATE"
      008785                       1425 NEGAT:
      008785 90 93            [ 1] 1426         LDW Y,X
      008787 90 FE            [ 2] 1427         LDW Y,(Y)
      008789 90 50            [ 2] 1428         NEGW Y
      00878B FF               [ 2] 1429         LDW (X),Y
      00878C 81               [ 4] 1430         RET
                                   1431 
                                   1432 ;       DNEGATE ( d -- -d )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



                                   1433 ;       Two's complement of top double.
      00878D 87 7E                 1434         .word      LINK
                           00070F  1435 LINK = . 
      00878F 07                    1436         .byte      7
      008790 44 4E 45 47 41 54 45  1437         .ascii     "DNEGATE"
      008797                       1438 DNEGA:
      008797 90 93            [ 1] 1439         LDW Y,X
      008799 90 FE            [ 2] 1440 	LDW Y,(Y)
      00879B 90 53            [ 2] 1441         CPLW Y     
      00879D 90 BF 24         [ 2] 1442 	LDW YTEMP,Y
      0087A0 90 93            [ 1] 1443         LDW Y,X
      0087A2 90 EE 02         [ 2] 1444         LDW Y,(2,Y)
      0087A5 90 53            [ 2] 1445         CPLW Y
      0087A7 72 A9 00 01      [ 2] 1446         addw y,#1
      0087AB EF 02            [ 2] 1447         LDW (2,X),Y
      0087AD 90 BE 24         [ 2] 1448         LDW Y,YTEMP
      0087B0 24 02            [ 1] 1449         JRNC DN1 
      0087B2 90 5C            [ 2] 1450         INCW Y
      0087B4 FF               [ 2] 1451 DN1:    LDW (X),Y
      0087B5 81               [ 4] 1452         RET
                                   1453 
                                   1454 
                                   1455 ;       S>D ( n -- d )
                                   1456 ; convert single integer to double 
      0087B6 87 8F                 1457         .word LINK 
                           000738  1458         LINK=. 
      0087B8 03                    1459         .byte 3 
      0087B9 53 3E 44              1460         .ascii "S>D"
      0087BC                       1461 STOD: 
      0087BC 1D 00 02         [ 2] 1462         subw x,#CELLL 
      0087BF 90 5F            [ 1] 1463         clrw y 
      0087C1 FF               [ 2] 1464         ldw (x),y 
      0087C2 90 93            [ 1] 1465         ldw y,x 
      0087C4 90 EE 02         [ 2] 1466         ldw y,(2,y)
      0087C7 2A 05            [ 1] 1467         jrpl 1$ 
      0087C9 90 AE FF FF      [ 2] 1468         ldw y,#-1
      0087CD FF               [ 2] 1469         ldw (x),y 
      0087CE 81               [ 4] 1470 1$:     ret 
                                   1471 
                                   1472 
                                   1473 
                                   1474 
                                   1475 ;       -       ( n1 n2 -- n1-n2 )
                                   1476 ;       Subtraction.
      0087CF 87 B8                 1477         .word      LINK
                           000751  1478 LINK = . 
      0087D1 01                    1479         .byte      1
      0087D2 2D                    1480         .ascii     "-"
      0087D3                       1481 SUBB:
      0087D3 90 93            [ 1] 1482         LDW Y,X
      0087D5 90 FE            [ 2] 1483         LDW Y,(Y)
      0087D7 90 BF 24         [ 2] 1484         LDW YTEMP,Y
      0087DA 1C 00 02         [ 2] 1485         ADDW X,#2
      0087DD 90 93            [ 1] 1486         LDW Y,X
      0087DF 90 FE            [ 2] 1487         LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0087E1 72 B2 00 24      [ 2] 1488         SUBW Y,YTEMP
      0087E5 FF               [ 2] 1489         LDW (X),Y
      0087E6 81               [ 4] 1490         RET
                                   1491 
                                   1492 ;       ABS     ( n -- n )
                                   1493 ;       Return  absolute value of n.
      0087E7 87 D1                 1494         .word      LINK
                           000769  1495 LINK = . 
      0087E9 03                    1496         .byte      3
      0087EA 41 42 53              1497         .ascii     "ABS"
      0087ED                       1498 ABSS:
      0087ED 90 93            [ 1] 1499         LDW Y,X
      0087EF 90 FE            [ 2] 1500 	LDW Y,(Y)
      0087F1 2A 03            [ 1] 1501         JRPL     AB1     ;negate:
      0087F3 90 50            [ 2] 1502         NEGW     Y     ;else negate hi byte
      0087F5 FF               [ 2] 1503         LDW (X),Y
      0087F6 81               [ 4] 1504 AB1:    RET
                                   1505 
                                   1506 ;       =       ( w w -- t )
                                   1507 ;       Return true if top two are =al.
      0087F7 87 E9                 1508         .word      LINK
                           000779  1509 LINK = . 
      0087F9 01                    1510         .byte      1
      0087FA 3D                    1511         .ascii     "="
      0087FB                       1512 EQUAL:
      0087FB A6 FF            [ 1] 1513         LD A,#0xFF  ;true
      0087FD 90 93            [ 1] 1514         LDW Y,X    ;D = n2
      0087FF 90 FE            [ 2] 1515         LDW Y,(Y)
      008801 90 BF 24         [ 2] 1516         LDW YTEMP,Y
      008804 1C 00 02         [ 2] 1517         ADDW X,#2
      008807 90 93            [ 1] 1518         LDW Y,X
      008809 90 FE            [ 2] 1519         LDW Y,(Y)
      00880B 90 B3 24         [ 2] 1520         CPW Y,YTEMP     ;if n2 <> n1
      00880E 27 01            [ 1] 1521         JREQ     EQ1
      008810 4F               [ 1] 1522         CLR A
      008811 F7               [ 1] 1523 EQ1:    LD (X),A
      008812 E7 01            [ 1] 1524         LD (1,X),A
      008814 81               [ 4] 1525 	RET     
                                   1526 
                                   1527 ;       U<      ( u u -- t )
                                   1528 ;       Unsigned compare of top two items.
      008815 87 F9                 1529         .word      LINK
                           000797  1530 LINK = . 
      008817 02                    1531         .byte      2
      008818 55 3C                 1532         .ascii     "U<"
      00881A                       1533 ULESS:
      00881A A6 FF            [ 1] 1534         LD A,#0xFF  ;true
      00881C 90 93            [ 1] 1535         LDW Y,X    ;D = n2
      00881E 90 FE            [ 2] 1536         LDW Y,(Y)
      008820 90 BF 24         [ 2] 1537         LDW YTEMP,Y
      008823 1C 00 02         [ 2] 1538         ADDW X,#2
      008826 90 93            [ 1] 1539         LDW Y,X
      008828 90 FE            [ 2] 1540         LDW Y,(Y)
      00882A 90 B3 24         [ 2] 1541         CPW Y,YTEMP     ;if n2 <> n1
      00882D 25 01            [ 1] 1542         JRULT     ULES1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      00882F 4F               [ 1] 1543         CLR A
      008830 F7               [ 1] 1544 ULES1:  LD (X),A
      008831 E7 01            [ 1] 1545         LD (1,X),A
      008833 81               [ 4] 1546 	RET     
                                   1547 
                                   1548 ;       <       ( n1 n2 -- t )
                                   1549 ;       Signed compare of top two items.
      008834 88 17                 1550         .word      LINK
                           0007B6  1551 LINK = . 
      008836 01                    1552         .byte      1
      008837 3C                    1553         .ascii     "<"
      008838                       1554 LESS:
      008838 A6 FF            [ 1] 1555         LD A,#0xFF  ;true
      00883A 90 93            [ 1] 1556         LDW Y,X    ;D = n2
      00883C 90 FE            [ 2] 1557         LDW Y,(Y)
      00883E 90 BF 24         [ 2] 1558         LDW YTEMP,Y
      008841 1C 00 02         [ 2] 1559         ADDW X,#2
      008844 90 93            [ 1] 1560         LDW Y,X
      008846 90 FE            [ 2] 1561         LDW Y,(Y)
      008848 90 B3 24         [ 2] 1562         CPW Y,YTEMP     ;if n2 <> n1
      00884B 2F 01            [ 1] 1563         JRSLT     LT1
      00884D 4F               [ 1] 1564         CLR A
      00884E F7               [ 1] 1565 LT1:    LD (X),A
      00884F E7 01            [ 1] 1566         LD (1,X),A
      008851 81               [ 4] 1567 	RET     
                                   1568 
                                   1569 ;       MAX     ( n n -- n )
                                   1570 ;       Return greater of two top items.
      008852 88 36                 1571         .word      LINK
                           0007D4  1572 LINK = . 
      008854 03                    1573         .byte      3
      008855 4D 41 58              1574         .ascii     "MAX"
      008858                       1575 MAX:
      008858 90 93            [ 1] 1576         LDW Y,X    ;D = n2
      00885A 90 EE 02         [ 2] 1577         LDW Y,(2,Y)
      00885D 90 BF 24         [ 2] 1578         LDW YTEMP,Y
      008860 90 93            [ 1] 1579         LDW Y,X
      008862 90 FE            [ 2] 1580         LDW Y,(Y)
      008864 90 B3 24         [ 2] 1581         CPW Y,YTEMP     ;if n2 <> n1
      008867 2F 02            [ 1] 1582         JRSLT     MAX1
      008869 EF 02            [ 2] 1583         LDW (2,X),Y
      00886B 1C 00 02         [ 2] 1584 MAX1:   ADDW X,#2
      00886E 81               [ 4] 1585 	RET     
                                   1586 
                                   1587 ;       MIN     ( n n -- n )
                                   1588 ;       Return smaller of top two items.
      00886F 88 54                 1589         .word      LINK
                           0007F1  1590 LINK = . 
      008871 03                    1591         .byte      3
      008872 4D 49 4E              1592         .ascii     "MIN"
      008875                       1593 MIN:
      008875 90 93            [ 1] 1594         LDW Y,X    ;D = n2
      008877 90 EE 02         [ 2] 1595         LDW Y,(2,Y)
      00887A 90 BF 24         [ 2] 1596         LDW YTEMP,Y
      00887D 90 93            [ 1] 1597         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      00887F 90 FE            [ 2] 1598         LDW Y,(Y)
      008881 90 B3 24         [ 2] 1599         CPW Y,YTEMP     ;if n2 <> n1
      008884 2C 02            [ 1] 1600         JRSGT     MIN1
      008886 EF 02            [ 2] 1601         LDW (2,X),Y
      008888 1C 00 02         [ 2] 1602 MIN1:	ADDW X,#2
      00888B 81               [ 4] 1603 	RET     
                                   1604 
                                   1605 ;       WITHIN  ( u ul uh -- t )
                                   1606 ;       Return true if u is within
                                   1607 ;       range of ul and uh. ( ul <= u < uh )
      00888C 88 71                 1608         .word      LINK
                           00080E  1609 LINK = . 
      00888E 06                    1610         .byte      6
      00888F 57 49 54 48 49 4E     1611         .ascii     "WITHIN"
      008895                       1612 WITHI:
      008895 CD 85 89         [ 4] 1613         CALL     OVER
      008898 CD 87 D3         [ 4] 1614         CALL     SUBB
      00889B CD 85 28         [ 4] 1615         CALL     TOR
      00889E CD 87 D3         [ 4] 1616         CALL     SUBB
      0088A1 CD 85 09         [ 4] 1617         CALL     RFROM
      0088A4 CC 88 1A         [ 2] 1618         JP     ULESS
                                   1619 
                                   1620 ;; Divide
                                   1621 
                                   1622 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1623 ;       Unsigned divide of a double by a
                                   1624 ;       single. Return mod and quotient.
      0088A7 88 8E                 1625         .word      LINK
                           000829  1626 LINK = . 
      0088A9 06                    1627         .byte      6
      0088AA 55 4D 2F 4D 4F 44     1628         .ascii     "UM/MOD"
      0088B0                       1629 UMMOD:
      0088B0 BF 22            [ 2] 1630 	LDW XTEMP,X	; save stack pointer
      0088B2 FE               [ 2] 1631 	LDW X,(X)	; un
      0088B3 BF 24            [ 2] 1632 	LDW YTEMP,X     ; save un
      0088B5 90 BE 22         [ 2] 1633 	LDW Y,XTEMP	; stack pointer
      0088B8 90 EE 04         [ 2] 1634 	LDW Y,(4,Y)     ; Y=udl
      0088BB BE 22            [ 2] 1635 	LDW X,XTEMP
      0088BD EE 02            [ 2] 1636 	LDW X,(2,X)	; X=udh
      0088BF B3 24            [ 2] 1637 	CPW X,YTEMP
      0088C1 23 0F            [ 2] 1638 	JRULE MMSM1
      0088C3 BE 22            [ 2] 1639 	LDW X,XTEMP
      0088C5 1C 00 02         [ 2] 1640 	ADDW X,#2	; pop off 1 level
      0088C8 90 AE FF FF      [ 2] 1641 	LDW Y,#0xFFFF
      0088CC FF               [ 2] 1642 	LDW (X),Y
      0088CD 90 5F            [ 1] 1643 	CLRW Y
      0088CF EF 02            [ 2] 1644 	LDW (2,X),Y
      0088D1 81               [ 4] 1645 	RET
      0088D2                       1646 MMSM1:
                                   1647 ; take advantage of divw x,y when udh==0
      0088D2 5D               [ 2] 1648         tnzw x  ; is udh==0?
      0088D3 26 11            [ 1] 1649         jrne MMSM2 
      0088D5 93               [ 1] 1650         ldw x,y    ;udl 
      0088D6 90 BE 24         [ 2] 1651         ldw y,YTEMP ; divisor 
      0088D9 65               [ 2] 1652         divw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      0088DA 89               [ 2] 1653         pushw x     ; quotient 
      0088DB BE 22            [ 2] 1654         ldw x,XTEMP 
      0088DD 1C 00 02         [ 2] 1655         addw x,#CELLL 
      0088E0 EF 02            [ 2] 1656         ldw (2,x),y  ; ur
      0088E2 90 85            [ 2] 1657         popw y 
      0088E4 FF               [ 2] 1658         ldw (x),y ; uq 
      0088E5 81               [ 4] 1659         ret 
      0088E6                       1660 MMSM2:        
      0088E6 A6 11            [ 1] 1661 	LD A,#17	; loop count
      0088E8                       1662 MMSM3:
      0088E8 B3 24            [ 2] 1663 	CPW X,YTEMP	; compare udh to un
      0088EA 25 04            [ 1] 1664 	JRULT MMSM4	; can't subtract
      0088EC 72 B0 00 24      [ 2] 1665 	SUBW X,YTEMP	; can subtract
      0088F0                       1666 MMSM4:
      0088F0 8C               [ 1] 1667 	CCF	; quotient bit
      0088F1 90 59            [ 2] 1668 	RLCW Y	; rotate into quotient
      0088F3 59               [ 2] 1669 	RLCW X	; rotate into remainder
      0088F4 4A               [ 1] 1670 	DEC A	; repeat
      0088F5 22 F1            [ 1] 1671 	JRUGT MMSM3
      0088F7 56               [ 2] 1672         RRCW X 
      0088F8 BF 24            [ 2] 1673 	LDW YTEMP,X	; done, save remainder
      0088FA BE 22            [ 2] 1674 	LDW X,XTEMP
      0088FC 1C 00 02         [ 2] 1675 	ADDW X,#2	; drop
      0088FF FF               [ 2] 1676 	LDW (X),Y
      008900 90 BE 24         [ 2] 1677 	LDW Y,YTEMP	; save quotient
      008903 EF 02            [ 2] 1678 	LDW (2,X),Y
      008905 81               [ 4] 1679 	RET
                                   1680 	
                                   1681 ;       M/MOD   ( d n -- r q )
                                   1682 ;       Signed floored divide of double by
                                   1683 ;       single. Return mod and quotient.
      008906 88 A9                 1684         .word      LINK
                           000888  1685 LINK = . 
      008908 05                    1686         .byte      5
      008909 4D 2F 4D 4F 44        1687         .ascii     "M/MOD"
      00890E                       1688 MSMOD:  
      00890E CD 85 5F         [ 4] 1689         CALL	DUPP
      008911 CD 85 98         [ 4] 1690         CALL	ZLESS
      008914 CD 85 5F         [ 4] 1691         CALL	DUPP
      008917 CD 85 28         [ 4] 1692         CALL	TOR
      00891A CD 84 63         [ 4] 1693         CALL	QBRAN
      00891D 89 2B                 1694         .word	MMOD1
      00891F CD 87 85         [ 4] 1695         CALL	NEGAT
      008922 CD 85 28         [ 4] 1696         CALL	TOR
      008925 CD 87 97         [ 4] 1697         CALL	DNEGA
      008928 CD 85 09         [ 4] 1698         CALL	RFROM
      00892B CD 85 28         [ 4] 1699 MMOD1:	CALL	TOR
      00892E CD 85 5F         [ 4] 1700         CALL	DUPP
      008931 CD 85 98         [ 4] 1701         CALL	ZLESS
      008934 CD 84 63         [ 4] 1702         CALL	QBRAN
      008937 89 3F                 1703         .word	MMOD2
      008939 CD 85 1C         [ 4] 1704         CALL	RAT
      00893C CD 87 5A         [ 4] 1705         CALL	PLUS
      00893F CD 85 09         [ 4] 1706 MMOD2:	CALL	RFROM
      008942 CD 88 B0         [ 4] 1707         CALL	UMMOD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008945 CD 85 09         [ 4] 1708         CALL	RFROM
      008948 CD 84 63         [ 4] 1709         CALL	QBRAN
      00894B 89 56                 1710         .word	MMOD3
      00894D CD 85 6F         [ 4] 1711         CALL	SWAPP
      008950 CD 87 85         [ 4] 1712         CALL	NEGAT
      008953 CD 85 6F         [ 4] 1713         CALL	SWAPP
      008956 81               [ 4] 1714 MMOD3:	RET
                                   1715 
                                   1716 ;       /MOD    ( n n -- r q )
                                   1717 ;       Signed divide. Return mod and quotient.
      008957 89 08                 1718         .word      LINK
                           0008D9  1719 LINK = . 
      008959 04                    1720         .byte      4
      00895A 2F 4D 4F 44           1721         .ascii     "/MOD"
      00895E                       1722 SLMOD:
      00895E CD 85 89         [ 4] 1723         CALL	OVER
      008961 CD 85 98         [ 4] 1724         CALL	ZLESS
      008964 CD 85 6F         [ 4] 1725         CALL	SWAPP
      008967 CC 89 0E         [ 2] 1726         JP	MSMOD
                                   1727 
                                   1728 ;       MOD     ( n n -- r )
                                   1729 ;       Signed divide. Return mod only.
      00896A 89 59                 1730         .word      LINK
                           0008EC  1731 LINK = . 
      00896C 03                    1732         .byte      3
      00896D 4D 4F 44              1733         .ascii     "MOD"
      008970                       1734 MODD:
      008970 CD 89 5E         [ 4] 1735 	CALL	SLMOD
      008973 CC 85 55         [ 2] 1736 	JP	DROP
                                   1737 
                                   1738 ;       /       ( n n -- q )
                                   1739 ;       Signed divide. Return quotient only.
      008976 89 6C                 1740         .word      LINK
                           0008F8  1741 LINK = . 
      008978 01                    1742         .byte      1
      008979 2F                    1743         .ascii     "/"
      00897A                       1744 SLASH:
      00897A CD 89 5E         [ 4] 1745         CALL	SLMOD
      00897D CD 85 6F         [ 4] 1746         CALL	SWAPP
      008980 CC 85 55         [ 2] 1747         JP	DROP
                                   1748 
                                   1749 ;; Multiply
                                   1750 
                                   1751 ;       UM*     ( u u -- ud )
                                   1752 ;       Unsigned multiply. Return double product.
      008983 89 78                 1753         .word      LINK
                           000905  1754 LINK = . 
      008985 03                    1755         .byte      3
      008986 55 4D 2A              1756         .ascii     "UM*"
      008989                       1757 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                                   1758 ; take advantage of SP addressing modes
                                   1759 ; these PRODx in RAM are not required
                                   1760 ; the product is kept on stack as local variable 
                                   1761         ;; bytes offset on data stack 
                           000002  1762         da=2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                           000003  1763         db=3 
                           000000  1764         dc=0 
                           000001  1765         dd=1 
                                   1766         ;; product bytes offset on return stack 
                           000001  1767         UD1=1  ; ud bits 31..24
                           000002  1768         UD2=2  ; ud bits 23..16
                           000003  1769         UD3=3  ; ud bits 15..8 
                           000004  1770         UD4=4  ; ud bits 7..0 
                                   1771         ;; local variable for product set to zero   
      008989 90 5F            [ 1] 1772         clrw y 
      00898B 90 89            [ 2] 1773         pushw y  ; bits 15..0
      00898D 90 89            [ 2] 1774         pushw y  ; bits 31..16 
      00898F E6 03            [ 1] 1775         ld a,(db,x) ; b 
      008991 90 97            [ 1] 1776         ld yl,a 
      008993 E6 01            [ 1] 1777         ld a,(dd,x)   ; d
      008995 90 42            [ 4] 1778         mul y,a    ; b*d  
      008997 17 03            [ 2] 1779         ldw (UD3,sp),y ; lowest weight product 
      008999 E6 03            [ 1] 1780         ld a,(db,x)
      00899B 90 97            [ 1] 1781         ld yl,a 
      00899D E6 00            [ 1] 1782         ld a,(dc,x)
      00899F 90 42            [ 4] 1783         mul y,a  ; b*c 
                                   1784         ;;; do the partial sum 
      0089A1 72 F9 02         [ 2] 1785         addw y,(UD2,sp)
      0089A4 4F               [ 1] 1786         clr a 
      0089A5 49               [ 1] 1787         rlc a
      0089A6 6B 01            [ 1] 1788         ld (UD1,sp),a 
      0089A8 17 02            [ 2] 1789         ldw (UD2,sp),y 
      0089AA E6 02            [ 1] 1790         ld a,(da,x)
      0089AC 90 97            [ 1] 1791         ld yl,a 
      0089AE E6 01            [ 1] 1792         ld a,(dd,x)
      0089B0 90 42            [ 4] 1793         mul y,a   ; a*d 
                                   1794         ;; do partial sum 
      0089B2 72 F9 02         [ 2] 1795         addw y,(UD2,sp)
      0089B5 4F               [ 1] 1796         clr a 
      0089B6 19 01            [ 1] 1797         adc a,(UD1,sp)
      0089B8 6B 01            [ 1] 1798         ld (UD1,sp),a  
      0089BA 17 02            [ 2] 1799         ldw (UD2,sp),y 
      0089BC E6 02            [ 1] 1800         ld a,(da,x)
      0089BE 90 97            [ 1] 1801         ld yl,a 
      0089C0 E6 00            [ 1] 1802         ld a,(dc,x)
      0089C2 90 42            [ 4] 1803         mul y,a  ;  a*c highest weight product 
                                   1804         ;;; do partial sum 
      0089C4 72 F9 01         [ 2] 1805         addw y,(UD1,sp)
      0089C7 FF               [ 2] 1806         ldw (x),y  ; udh 
      0089C8 16 03            [ 2] 1807         ldw y,(UD3,sp)
      0089CA EF 02            [ 2] 1808         ldw (2,x),y  ; udl  
      0089CC 5B 04            [ 2] 1809         addw sp,#4 ; drop local variable 
      0089CE 81               [ 4] 1810         ret  
                                   1811 
                                   1812 
                                   1813 ;       *       ( n n -- n )
                                   1814 ;       Signed multiply. Return single product.
      0089CF 89 85                 1815         .word      LINK
                           000951  1816 LINK = . 
      0089D1 01                    1817         .byte      1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      0089D2 2A                    1818         .ascii     "*"
      0089D3                       1819 STAR:
      0089D3 CD 89 89         [ 4] 1820 	CALL	UMSTA
      0089D6 CC 85 55         [ 2] 1821 	JP	DROP
                                   1822 
                                   1823 ;       M*      ( n n -- d )
                                   1824 ;       Signed multiply. Return double product.
      0089D9 89 D1                 1825         .word      LINK
                           00095B  1826 LINK = . 
      0089DB 02                    1827         .byte      2
      0089DC 4D 2A                 1828         .ascii     "M*"
      0089DE                       1829 MSTAR:      
      0089DE CD 87 45         [ 4] 1830         CALL	DDUP
      0089E1 CD 85 D4         [ 4] 1831         CALL	XORR
      0089E4 CD 85 98         [ 4] 1832         CALL	ZLESS
      0089E7 CD 85 28         [ 4] 1833         CALL	TOR
      0089EA CD 87 ED         [ 4] 1834         CALL	ABSS
      0089ED CD 85 6F         [ 4] 1835         CALL	SWAPP
      0089F0 CD 87 ED         [ 4] 1836         CALL	ABSS
      0089F3 CD 89 89         [ 4] 1837         CALL	UMSTA
      0089F6 CD 85 09         [ 4] 1838         CALL	RFROM
      0089F9 CD 84 63         [ 4] 1839         CALL	QBRAN
      0089FC 8A 01                 1840         .word	MSTA1
      0089FE CD 87 97         [ 4] 1841         CALL	DNEGA
      008A01 81               [ 4] 1842 MSTA1:	RET
                                   1843 
                                   1844 ;       */MOD   ( n1 n2 n3 -- r q )
                                   1845 ;       Multiply n1 and n2, then divide
                                   1846 ;       by n3. Return mod and quotient.
      008A02 89 DB                 1847         .word      LINK
                           000984  1848 LINK = . 
      008A04 05                    1849         .byte      5
      008A05 2A 2F 4D 4F 44        1850         .ascii     "*/MOD"
      008A0A                       1851 SSMOD:
      008A0A CD 85 28         [ 4] 1852         CALL     TOR
      008A0D CD 89 DE         [ 4] 1853         CALL     MSTAR
      008A10 CD 85 09         [ 4] 1854         CALL     RFROM
      008A13 CC 89 0E         [ 2] 1855         JP     MSMOD
                                   1856 
                                   1857 ;       */      ( n1 n2 n3 -- q )
                                   1858 ;       Multiply n1 by n2, then divide
                                   1859 ;       by n3. Return quotient only.
      008A16 8A 04                 1860         .word      LINK
                           000998  1861 LINK = . 
      008A18 02                    1862         .byte      2
      008A19 2A 2F                 1863         .ascii     "*/"
      008A1B                       1864 STASL:
      008A1B CD 8A 0A         [ 4] 1865         CALL	SSMOD
      008A1E CD 85 6F         [ 4] 1866         CALL	SWAPP
      008A21 CC 85 55         [ 2] 1867         JP	DROP
                                   1868 
                                   1869 ;; Miscellaneous
                                   1870 
                                   1871 ;       CELL+   ( a -- a )
                                   1872 ;       Add cell size in byte to address.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008A24 8A 18                 1873         .word      LINK
                           0009A6  1874 LINK = . 
      008A26 02                    1875         .byte       2
      008A27 32 2B                 1876         .ascii     "2+"
      008A29                       1877 CELLP:
      008A29 90 93            [ 1] 1878         LDW Y,X
      008A2B 90 FE            [ 2] 1879 	LDW Y,(Y)
      008A2D 72 A9 00 02      [ 2] 1880         ADDW Y,#CELLL 
      008A31 FF               [ 2] 1881         LDW (X),Y
      008A32 81               [ 4] 1882         RET
                                   1883 
                                   1884 ;       CELL-   ( a -- a )
                                   1885 ;       Subtract 2 from address.
      008A33 8A 26                 1886         .word      LINK
                           0009B5  1887 LINK = . 
      008A35 02                    1888         .byte       2
      008A36 32 2D                 1889         .ascii     "2-"
      008A38                       1890 CELLM:
      008A38 90 93            [ 1] 1891         LDW Y,X
      008A3A 90 FE            [ 2] 1892 	LDW Y,(Y)
      008A3C 72 A2 00 02      [ 2] 1893         SUBW Y,#CELLL
      008A40 FF               [ 2] 1894         LDW (X),Y
      008A41 81               [ 4] 1895         RET
                                   1896 
                                   1897 ;       CELLS   ( n -- n )
                                   1898 ;       Multiply tos by 2.
      008A42 8A 35                 1899         .word      LINK
                           0009C4  1900 LINK = . 
      008A44 02                    1901         .byte       2
      008A45 32 2A                 1902         .ascii     "2*"
      008A47                       1903 CELLS:
      008A47 90 93            [ 1] 1904         LDW Y,X
      008A49 90 FE            [ 2] 1905 	LDW Y,(Y)
      008A4B 90 58            [ 2] 1906         SLAW Y
      008A4D FF               [ 2] 1907         LDW (X),Y
      008A4E 81               [ 4] 1908         RET
                                   1909 
                                   1910 ;       1+      ( a -- a )
                                   1911 ;       Add cell size in byte to address.
      008A4F 8A 44                 1912         .word      LINK
                           0009D1  1913 LINK = . 
      008A51 02                    1914         .byte      2
      008A52 31 2B                 1915         .ascii     "1+"
      008A54                       1916 ONEP:
      008A54 90 93            [ 1] 1917         LDW Y,X
      008A56 90 FE            [ 2] 1918 	LDW Y,(Y)
      008A58 90 5C            [ 2] 1919         INCW Y
      008A5A FF               [ 2] 1920         LDW (X),Y
      008A5B 81               [ 4] 1921         RET
                                   1922 
                                   1923 ;       1-      ( a -- a )
                                   1924 ;       Subtract 2 from address.
      008A5C 8A 51                 1925         .word      LINK
                           0009DE  1926 LINK = . 
      008A5E 02                    1927         .byte      2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008A5F 31 2D                 1928         .ascii     "1-"
      008A61                       1929 ONEM:
      008A61 90 93            [ 1] 1930         LDW Y,X
      008A63 90 FE            [ 2] 1931 	LDW Y,(Y)
      008A65 90 5A            [ 2] 1932         DECW Y
      008A67 FF               [ 2] 1933         LDW (X),Y
      008A68 81               [ 4] 1934         RET
                                   1935 
                                   1936 ;  shift left n times 
                                   1937 ; LSHIFT ( n1 n2 -- n1<<n2 )
      008A69 8A 5E                 1938         .word LINK 
                           0009EB  1939         LINK=.
      008A6B 06                    1940         .byte 6 
      008A6C 4C 53 48 49 46 54     1941         .ascii "LSHIFT"
      008A72                       1942 LSHIFT:
      008A72 E6 01            [ 1] 1943         ld a,(1,x)
      008A74 1C 00 02         [ 2] 1944         addw x,#CELLL 
      008A77 90 93            [ 1] 1945         ldw y,x 
      008A79 90 FE            [ 2] 1946         ldw y,(y)
      008A7B                       1947 LSHIFT1:
      008A7B 4D               [ 1] 1948         tnz a 
      008A7C 27 05            [ 1] 1949         jreq LSHIFT4 
      008A7E 90 58            [ 2] 1950         sllw y 
      008A80 4A               [ 1] 1951         dec a 
      008A81 20 F8            [ 2] 1952         jra LSHIFT1 
      008A83                       1953 LSHIFT4:
      008A83 FF               [ 2] 1954         ldw (x),y 
      008A84 81               [ 4] 1955         ret 
                                   1956 
                                   1957 ; shift right n times                 
                                   1958 ; RSHIFT (n1 n2 -- n1>>n2 )
      008A85 8A 6B                 1959         .word LINK 
                           000A07  1960         LINK=.
      008A87 06                    1961         .byte 6
      008A88 52 53 48 49 46 54     1962         .ascii "RSHIFT"
      008A8E                       1963 RSHIFT:
      008A8E E6 01            [ 1] 1964         ld a,(1,x)
      008A90 1C 00 02         [ 2] 1965         addw x,#CELLL 
      008A93 90 93            [ 1] 1966         ldw y,x 
      008A95 90 FE            [ 2] 1967         ldw y,(y)
      008A97                       1968 RSHIFT1:
      008A97 4D               [ 1] 1969         tnz a 
      008A98 27 05            [ 1] 1970         jreq RSHIFT4 
      008A9A 90 54            [ 2] 1971         srlw y 
      008A9C 4A               [ 1] 1972         dec a 
      008A9D 20 F8            [ 2] 1973         jra RSHIFT1 
      008A9F                       1974 RSHIFT4:
      008A9F FF               [ 2] 1975         ldw (x),y 
      008AA0 81               [ 4] 1976         ret 
                                   1977 
                                   1978 
                                   1979 ;       2/      ( n -- n )
                                   1980 ;       divide  tos by 2.
      008AA1 8A 87                 1981         .word      LINK
                           000A23  1982 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008AA3 02                    1983         .byte      2
      008AA4 32 2F                 1984         .ascii     "2/"
      008AA6                       1985 TWOSL:
      008AA6 90 93            [ 1] 1986         LDW Y,X
      008AA8 90 FE            [ 2] 1987 	LDW Y,(Y)
      008AAA 90 57            [ 2] 1988         SRAW Y
      008AAC FF               [ 2] 1989         LDW (X),Y
      008AAD 81               [ 4] 1990         RET
                                   1991 
                                   1992 ;       BL      ( -- 32 )
                                   1993 ;       Return 32,  blank character.
      008AAE 8A A3                 1994         .word      LINK
                           000A30  1995 LINK = . 
      008AB0 02                    1996         .byte      2
      008AB1 42 4C                 1997         .ascii     "BL"
      008AB3                       1998 BLANK:
      008AB3 1D 00 02         [ 2] 1999         SUBW X,#2
      008AB6 90 AE 00 20      [ 2] 2000 	LDW Y,#32
      008ABA FF               [ 2] 2001         LDW (X),Y
      008ABB 81               [ 4] 2002         RET
                                   2003 
                                   2004 ;         0     ( -- 0)
                                   2005 ;         Return 0.
      008ABC 8A B0                 2006         .word      LINK
                           000A3E  2007 LINK = . 
      008ABE 01                    2008         .byte       1
      008ABF 30                    2009         .ascii     "0"
      008AC0                       2010 ZERO:
      008AC0 1D 00 02         [ 2] 2011         SUBW X,#2
      008AC3 90 5F            [ 1] 2012 	CLRW Y
      008AC5 FF               [ 2] 2013         LDW (X),Y
      008AC6 81               [ 4] 2014         RET
                                   2015 
                                   2016 ;         1     ( -- 1)
                                   2017 ;         Return 1.
      008AC7 8A BE                 2018         .word      LINK
                           000A49  2019 LINK = . 
      008AC9 01                    2020         .byte       1
      008ACA 31                    2021         .ascii     "1"
      008ACB                       2022 ONE:
      008ACB 1D 00 02         [ 2] 2023         SUBW X,#2
      008ACE 90 AE 00 01      [ 2] 2024 	LDW Y,#1
      008AD2 FF               [ 2] 2025         LDW (X),Y
      008AD3 81               [ 4] 2026         RET
                                   2027 
                                   2028 ;         -1    ( -- -1)
                                   2029 ;         Return 32,  blank character.
      008AD4 8A C9                 2030         .word      LINK
                           000A56  2031 LINK = . 
      008AD6 02                    2032         .byte       2
      008AD7 2D 31                 2033         .ascii     "-1"
      008AD9                       2034 MONE:
      008AD9 1D 00 02         [ 2] 2035         SUBW X,#2
      008ADC 90 AE FF FF      [ 2] 2036 	LDW Y,#0xFFFF
      008AE0 FF               [ 2] 2037         LDW (X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008AE1 81               [ 4] 2038         RET
                                   2039 
                                   2040 ;       >CHAR   ( c -- c )
                                   2041 ;       Filter non-printing characters.
      008AE2 8A D6                 2042         .word      LINK
                           000A64  2043 LINK = . 
      008AE4 05                    2044         .byte      5
      008AE5 3E 43 48 41 52        2045         .ascii     ">CHAR"
      008AEA                       2046 TCHAR:
      008AEA E6 01            [ 1] 2047         ld a,(1,x)
      008AEC A1 20            [ 1] 2048         cp a,#32  
      008AEE 2B 05            [ 1] 2049         jrmi 1$ 
      008AF0 A1 7F            [ 1] 2050         cp a,#127 
      008AF2 2A 01            [ 1] 2051         jrpl 1$ 
      008AF4 81               [ 4] 2052         ret 
      008AF5 A6 5F            [ 1] 2053 1$:     ld a,#'_ 
      008AF7 E7 01            [ 1] 2054         ld (1,x),a 
      008AF9 81               [ 4] 2055         ret 
                                   2056 
                                   2057 ;       DEPTH   ( -- n )
                                   2058 ;       Return  depth of  data stack.
      008AFA 8A E4                 2059         .word      LINK
                           000A7C  2060 LINK = . 
      008AFC 05                    2061         .byte      5
      008AFD 44 45 50 54 48        2062         .ascii     "DEPTH"
      008B02                       2063 DEPTH: 
      008B02 90 BE 2A         [ 2] 2064         LDW Y,SP0    ;save data stack ptr
      008B05 BF 22            [ 2] 2065 	LDW XTEMP,X
      008B07 72 B2 00 22      [ 2] 2066         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008B0B 90 57            [ 2] 2067         SRAW Y    ;Y = #stack items
      008B0D 1D 00 02         [ 2] 2068 	SUBW X,#2
      008B10 FF               [ 2] 2069         LDW (X),Y     ; if neg, underflow
      008B11 81               [ 4] 2070         RET
                                   2071 
                                   2072 ;       PICK    ( ... +n -- ... w )
                                   2073 ;       Copy  nth stack item to tos.
      008B12 8A FC                 2074         .word      LINK
                           000A94  2075 LINK = . 
      008B14 04                    2076         .byte      4
      008B15 50 49 43 4B           2077         .ascii     "PICK"
      008B19                       2078 PICK:
      008B19 90 93            [ 1] 2079         LDW Y,X   ;D = n1
      008B1B 90 FE            [ 2] 2080         LDW Y,(Y)
                                   2081 ; modified for standard compliance          
                                   2082 ; 0 PICK must be equivalent to DUP 
      008B1D 90 5C            [ 2] 2083         INCW Y 
      008B1F 90 58            [ 2] 2084         SLAW Y
      008B21 BF 22            [ 2] 2085         LDW XTEMP,X
      008B23 72 B9 00 22      [ 2] 2086         ADDW Y,XTEMP
      008B27 90 FE            [ 2] 2087         LDW Y,(Y)
      008B29 FF               [ 2] 2088         LDW (X),Y
      008B2A 81               [ 4] 2089         RET
                                   2090 
                                   2091 ;; Memory access
                                   2092 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2093 ;       +!      ( n a -- )
                                   2094 ;       Add n to  contents at address a.
      008B2B 8B 14                 2095         .word      LINK
                           000AAD  2096 LINK = . 
      008B2D 02                    2097         .byte      2
      008B2E 2B 21                 2098         .ascii     "+!"
      008B30                       2099 PSTOR:
      008B30 90 93            [ 1] 2100         ldw y,x 
      008B32 90 FE            [ 2] 2101         ldw y,(y)
      008B34 90 BF 24         [ 2] 2102         ldw YTEMP,y  ; address
      008B37 90 FE            [ 2] 2103         ldw y,(y)  
      008B39 90 89            [ 2] 2104         pushw y  ; value at address 
      008B3B 90 93            [ 1] 2105         ldw y,x 
      008B3D 90 EE 02         [ 2] 2106         ldw y,(2,y) ; n 
      008B40 72 F9 01         [ 2] 2107         addw y,(1,sp) ; n+value
      008B43 91 CF 24         [ 5] 2108         ldw [YTEMP],y ;  a!
      008B46 90 85            [ 2] 2109         popw y    ;drop local var
      008B48 1C 00 04         [ 2] 2110         addw x,#4 ; DDROP 
      008B4B 81               [ 4] 2111         ret 
                                   2112 
                                   2113 ;       2!      ( d a -- )
                                   2114 ;       Store  double integer to address a.
      008B4C 8B 2D                 2115         .word      LINK
                           000ACE  2116 LINK = . 
      008B4E 02                    2117         .byte      2
      008B4F 32 21                 2118         .ascii     "2!"
      008B51                       2119 DSTOR:
      008B51 90 93            [ 1] 2120         ldw y,x 
      008B53 90 FE            [ 2] 2121         ldw y,(y)
      008B55 90 BF 24         [ 2] 2122         ldw YTEMP,y ; address 
      008B58 1C 00 02         [ 2] 2123         addw x,#CELLL ; drop a 
      008B5B 90 93            [ 1] 2124         ldw y,x 
      008B5D 90 FE            [ 2] 2125         ldw y,(y) ; hi word 
      008B5F 89               [ 2] 2126         pushw x 
      008B60 EE 02            [ 2] 2127         ldw x,(2,x) ; lo word 
      008B62 91 CF 24         [ 5] 2128         ldw [YTEMP],y
      008B65 90 93            [ 1] 2129         ldw y,x 
      008B67 AE 00 02         [ 2] 2130         ldw x,#2 
      008B6A 92 DF 24         [ 5] 2131         ldw ([YTEMP],x),y 
      008B6D 85               [ 2] 2132         popw x 
      008B6E 1C 00 04         [ 2] 2133         addw x,#4 ; DDROP 
      008B71 81               [ 4] 2134         ret 
                                   2135 
                                   2136 ;       2@      ( a -- d )
                                   2137 ;       Fetch double integer from address a.
      008B72 8B 4E                 2138         .word      LINK
                           000AF4  2139 LINK = . 
      008B74 02                    2140         .byte      2
      008B75 32 40                 2141         .ascii     "2@"
      008B77                       2142 DAT:
      008B77 90 93            [ 1] 2143         ldw y,x 
      008B79 90 FE            [ 2] 2144         ldw y,(y) ;address 
      008B7B 90 BF 24         [ 2] 2145         ldw YTEMP,y 
      008B7E 1D 00 02         [ 2] 2146         subw x,#CELLL ; space for udh 
      008B81 91 CE 24         [ 5] 2147         ldw y,[YTEMP] ; udh 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008B84 FF               [ 2] 2148         ldw (x),y 
      008B85 90 AE 00 02      [ 2] 2149         ldw y,#2
      008B89 91 DE 24         [ 5] 2150         ldw y,([YTEMP],y) ; udl 
      008B8C EF 02            [ 2] 2151         ldw (2,x),y
      008B8E 81               [ 4] 2152         ret 
                                   2153 
                                   2154 ;       COUNT   ( b -- b +n )
                                   2155 ;       Return count byte of a string
                                   2156 ;       and add 1 to byte address.
      008B8F 8B 74                 2157         .word      LINK
                           000B11  2158 LINK = . 
      008B91 05                    2159         .byte      5
      008B92 43 4F 55 4E 54        2160         .ascii     "COUNT"
      008B97                       2161 COUNT:
      008B97 90 93            [ 1] 2162         ldw y,x 
      008B99 90 FE            [ 2] 2163         ldw y,(y) ; address 
      008B9B 90 F6            [ 1] 2164         ld a,(y)  ; count 
      008B9D 90 5C            [ 2] 2165         incw y 
      008B9F FF               [ 2] 2166         ldw (x),y 
      008BA0 1D 00 02         [ 2] 2167         subw x,#CELLL 
      008BA3 E7 01            [ 1] 2168         ld (1,x),a 
      008BA5 7F               [ 1] 2169         clr (x)
      008BA6 81               [ 4] 2170         ret 
                                   2171 
                                   2172 ;       HERE    ( -- a )
                                   2173 ;       Return  top of  variables
      008BA7 8B 91                 2174         .word      LINK
                           000B29  2175 LINK = . 
      008BA9 04                    2176         .byte      4
      008BAA 48 45 52 45           2177         .ascii     "HERE"
      008BAE                       2178 HERE:
      008BAE 90 AE 00 16      [ 2] 2179       	ldw y,#UVP 
      008BB2 90 FE            [ 2] 2180         ldw y,(y)
      008BB4 1D 00 02         [ 2] 2181         subw x,#CELLL 
      008BB7 FF               [ 2] 2182         ldw (x),y 
      008BB8 81               [ 4] 2183         ret 
                                   2184 
                                   2185 ;       PAD     ( -- a )
                                   2186 ;       Return address of text buffer
                                   2187 ;       above  code dictionary.
      008BB9 8B A9                 2188         .word      LINK
                           000B3B  2189 LINK = . 
      008BBB 03                    2190         .byte      3
      008BBC 50 41 44              2191         .ascii     "PAD"
      008BBF                       2192 PAD:
      008BBF CD 8B AE         [ 4] 2193         CALL     HERE
      008BC2 CD 84 30         [ 4] 2194         CALL     DOLIT
      008BC5 00 50                 2195         .word      80
      008BC7 CC 87 5A         [ 2] 2196         JP     PLUS
                                   2197 
                                   2198 ;       TIB     ( -- a )
                                   2199 ;       Return address of terminal input buffer.
      008BCA 8B BB                 2200         .word      LINK
                           000B4C  2201 LINK = . 
      008BCC 03                    2202         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008BCD 54 49 42              2203         .ascii     "TIB"
      008BD0                       2204 TIB:
      008BD0 CD 86 4A         [ 4] 2205         CALL     NTIB
      008BD3 CD 8A 29         [ 4] 2206         CALL     CELLP
      008BD6 CC 84 B8         [ 2] 2207         JP     AT
                                   2208 
                                   2209 ;       @EXECUTE        ( a -- )
                                   2210 ;       Execute vector stored in address a.
      008BD9 8B CC                 2211         .word      LINK
                           000B5B  2212 LINK = . 
      008BDB 08                    2213         .byte      8
      008BDC 40 45 58 45 43 55 54  2214         .ascii     "@EXECUTE"
             45
      008BE4                       2215 ATEXE:
      008BE4 CD 84 B8         [ 4] 2216         CALL     AT
      008BE7 CD 87 09         [ 4] 2217         CALL     QDUP    ;?address or zero
      008BEA CD 84 63         [ 4] 2218         CALL     QBRAN
      008BED 8B F2                 2219         .word      EXE1
      008BEF CD 84 8A         [ 4] 2220         CALL     EXECU   ;execute if non-zero
      008BF2 81               [ 4] 2221 EXE1:   RET     ;do nothing if zero
                                   2222 
                                   2223 ;       CMOVE   ( b1 b2 u -- )
                                   2224 ;       Copy u bytes from b1 to b2.
      008BF3 8B DB                 2225         .word      LINK
                           000B75  2226 LINK = . 
      008BF5 05                    2227         .byte      5
      008BF6 43 4D 4F 56 45        2228         .ascii     "CMOVE"
      008BFB                       2229 CMOVE:
      008BFB CD 85 28         [ 4] 2230         CALL	TOR
      008BFE CD 84 7A         [ 4] 2231         CALL	BRAN
      008C01 8C 1B                 2232         .word	CMOV2
      008C03 CD 85 28         [ 4] 2233 CMOV1:	CALL	TOR
      008C06 CD 85 5F         [ 4] 2234         CALL	DUPP
      008C09 CD 84 D6         [ 4] 2235         CALL	CAT
      008C0C CD 85 1C         [ 4] 2236         CALL	RAT
      008C0F CD 84 C5         [ 4] 2237         CALL	CSTOR
      008C12 CD 8A 54         [ 4] 2238         CALL	ONEP
      008C15 CD 85 09         [ 4] 2239         CALL	RFROM
      008C18 CD 8A 54         [ 4] 2240         CALL	ONEP
      008C1B CD 84 44         [ 4] 2241 CMOV2:	CALL	DONXT
      008C1E 8C 03                 2242         .word	CMOV1
      008C20 CC 87 3A         [ 2] 2243         JP	DDROP
                                   2244 
                                   2245 ;       FILL    ( b u c -- )
                                   2246 ;       Fill u bytes of character c
                                   2247 ;       to area beginning at b.
      008C23 8B F5                 2248         .word       LINK
                           000BA5  2249 LINK = . 
      008C25 04                    2250         .byte       4
      008C26 46 49 4C 4C           2251         .ascii     "FILL"
      008C2A                       2252 FILL:
      008C2A 90 93            [ 1] 2253         ldw y,x 
      008C2C 90 E6 01         [ 1] 2254         ld a,(1,y) ; c 
      008C2F 1C 00 02         [ 2] 2255         addw x,#CELLL ; drop c 
      008C32 90 93            [ 1] 2256         ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008C34 90 FE            [ 2] 2257         ldw y,(y) ; count
      008C36 90 89            [ 2] 2258         pushw y 
      008C38 1C 00 02         [ 2] 2259         addw x,#CELLL ; drop u 
      008C3B 90 93            [ 1] 2260         ldw y,x 
      008C3D 1C 00 02         [ 2] 2261         addw x,#CELLL ; drop b 
      008C40 90 FE            [ 2] 2262         ldw y,(y) ; address
      008C42 90 BF 24         [ 2] 2263         ldw YTEMP,y
      008C45 90 85            [ 2] 2264         popw y ; count 
      008C47                       2265 FILL1:  
      008C47 92 C7 24         [ 4] 2266         ld [YTEMP],a 
      008C4A 3C 25            [ 1] 2267         inc YTEMP+1
      008C4C 24 02            [ 1] 2268         jrnc FILL2 
      008C4E 3C 24            [ 1] 2269         inc YTEMP
      008C50                       2270 FILL2: 
      008C50 90 5A            [ 2] 2271         decw y ; count 
      008C52 26 F3            [ 1] 2272         jrne FILL1  
      008C54 81               [ 4] 2273         ret 
                                   2274 
                                   2275 ;       ERASE   ( b u -- )
                                   2276 ;       Erase u bytes beginning at b.
      008C55 8C 25                 2277         .word      LINK
                           000BD7  2278 LINK = . 
      008C57 05                    2279         .byte      5
      008C58 45 52 41 53 45        2280         .ascii     "ERASE"
      008C5D                       2281 ERASE:
      008C5D 90 5F            [ 1] 2282         clrw y 
      008C5F 1D 00 02         [ 2] 2283         subw x,#CELLL 
      008C62 FF               [ 2] 2284         ldw (x),y 
      008C63 CC 8C 2A         [ 2] 2285         jp FILL 
                                   2286 
                                   2287 
                                   2288 ;       PACK0   ( b u a -- a )
                                   2289 ;       Build a counted string with
                                   2290 ;       u characters from b. Null fill.
      008C66 8C 57                 2291         .word      LINK
                           000BE8  2292 LINK = . 
      008C68 05                    2293         .byte      5
      008C69 50 41 43 4B 30        2294         .ascii     "PACK0"
      008C6E                       2295 PACKS:
      008C6E CD 85 5F         [ 4] 2296         CALL     DUPP
      008C71 CD 85 28         [ 4] 2297         CALL     TOR     ;strings only on cell boundary
      008C74 CD 87 45         [ 4] 2298         CALL     DDUP
      008C77 CD 84 C5         [ 4] 2299         CALL     CSTOR
      008C7A CD 8A 54         [ 4] 2300         CALL     ONEP ;save count
      008C7D CD 85 6F         [ 4] 2301         CALL     SWAPP
      008C80 CD 8B FB         [ 4] 2302         CALL     CMOVE
      008C83 CD 85 09         [ 4] 2303         CALL     RFROM
      008C86 81               [ 4] 2304         RET
                                   2305 
                                   2306 ;; Numeric output, single precision
                                   2307 
                                   2308 ;       DIGIT   ( u -- c )
                                   2309 ;       Convert digit u to a character.
      008C87 8C 68                 2310         .word      LINK
                           000C09  2311 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008C89 05                    2312         .byte      5
      008C8A 44 49 47 49 54        2313         .ascii     "DIGIT"
      008C8F                       2314 DIGIT:
      008C8F CD 84 30         [ 4] 2315         CALL	DOLIT
      008C92 00 09                 2316         .word	9
      008C94 CD 85 89         [ 4] 2317         CALL	OVER
      008C97 CD 88 38         [ 4] 2318         CALL	LESS
      008C9A CD 84 30         [ 4] 2319         CALL	DOLIT
      008C9D 00 07                 2320         .word	7
      008C9F CD 85 AB         [ 4] 2321         CALL	ANDD
      008CA2 CD 87 5A         [ 4] 2322         CALL	PLUS
      008CA5 CD 84 30         [ 4] 2323         CALL	DOLIT
      008CA8 00 30                 2324         .word	48	;'0'
      008CAA CC 87 5A         [ 2] 2325         JP	PLUS
                                   2326 
                                   2327 ;       EXTRACT ( n base -- n c )
                                   2328 ;       Extract least significant digit from n.
      008CAD 8C 89                 2329         .word      LINK
                           000C2F  2330 LINK = . 
      008CAF 07                    2331         .byte      7
      008CB0 45 58 54 52 41 43 54  2332         .ascii     "EXTRACT"
      008CB7                       2333 EXTRC:
      008CB7 CD 8A C0         [ 4] 2334         CALL     ZERO
      008CBA CD 85 6F         [ 4] 2335         CALL     SWAPP
      008CBD CD 88 B0         [ 4] 2336         CALL     UMMOD
      008CC0 CD 85 6F         [ 4] 2337         CALL     SWAPP
      008CC3 CC 8C 8F         [ 2] 2338         JP     DIGIT
                                   2339 
                                   2340 ;       <#      ( -- )
                                   2341 ;       Initiate  numeric output process.
      008CC6 8C AF                 2342         .word      LINK
                           000C48  2343 LINK = . 
      008CC8 02                    2344         .byte      2
      008CC9 3C 23                 2345         .ascii     "<#"
      008CCB                       2346 BDIGS:
      008CCB CD 8B BF         [ 4] 2347         CALL     PAD
      008CCE CD 86 8C         [ 4] 2348         CALL     HLD
      008CD1 CC 84 A1         [ 2] 2349         JP     STORE
                                   2350 
                                   2351 ;       HOLD    ( c -- )
                                   2352 ;       Insert a character into output string.
      008CD4 8C C8                 2353         .word      LINK
                           000C56  2354 LINK = . 
      008CD6 04                    2355         .byte      4
      008CD7 48 4F 4C 44           2356         .ascii     "HOLD"
      008CDB                       2357 HOLD:
      008CDB CD 86 8C         [ 4] 2358         CALL     HLD
      008CDE CD 84 B8         [ 4] 2359         CALL     AT
      008CE1 CD 8A 61         [ 4] 2360         CALL     ONEM
      008CE4 CD 85 5F         [ 4] 2361         CALL     DUPP
      008CE7 CD 86 8C         [ 4] 2362         CALL     HLD
      008CEA CD 84 A1         [ 4] 2363         CALL     STORE
      008CED CC 84 C5         [ 2] 2364         JP     CSTOR
                                   2365 
                                   2366 ;       #       ( u -- u )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                                   2367 ;       Extract one digit from u and
                                   2368 ;       append digit to output string.
      008CF0 8C D6                 2369         .word      LINK
                           000C72  2370 LINK = . 
      008CF2 01                    2371         .byte      1
      008CF3 23                    2372         .ascii     "#"
      008CF4                       2373 DIG:
      008CF4 CD 86 1C         [ 4] 2374         CALL     BASE
      008CF7 CD 84 B8         [ 4] 2375         CALL     AT
      008CFA CD 8C B7         [ 4] 2376         CALL     EXTRC
      008CFD CC 8C DB         [ 2] 2377         JP     HOLD
                                   2378 
                                   2379 ;       #S      ( u -- 0 )
                                   2380 ;       Convert u until all digits
                                   2381 ;       are added to output string.
      008D00 8C F2                 2382         .word      LINK
                           000C82  2383 LINK = . 
      008D02 02                    2384         .byte      2
      008D03 23 53                 2385         .ascii     "#S"
      008D05                       2386 DIGS:
      008D05 CD 8C F4         [ 4] 2387 DIGS1:  CALL     DIG
      008D08 CD 85 5F         [ 4] 2388         CALL     DUPP
      008D0B CD 84 63         [ 4] 2389         CALL     QBRAN
      008D0E 8D 12                 2390         .word      DIGS2
      008D10 20 F3            [ 2] 2391         JRA     DIGS1
      008D12 81               [ 4] 2392 DIGS2:  RET
                                   2393 
                                   2394 ;       SIGN    ( n -- )
                                   2395 ;       Add a minus sign to
                                   2396 ;       numeric output string.
      008D13 8D 02                 2397         .word      LINK
                           000C95  2398 LINK = . 
      008D15 04                    2399         .byte      4
      008D16 53 49 47 4E           2400         .ascii     "SIGN"
      008D1A                       2401 SIGN:
      008D1A CD 85 98         [ 4] 2402         CALL     ZLESS
      008D1D CD 84 63         [ 4] 2403         CALL     QBRAN
      008D20 8D 2A                 2404         .word      SIGN1
      008D22 CD 84 30         [ 4] 2405         CALL     DOLIT
      008D25 00 2D                 2406         .word      45	;"-"
      008D27 CC 8C DB         [ 2] 2407         JP     HOLD
      008D2A 81               [ 4] 2408 SIGN1:  RET
                                   2409 
                                   2410 ;       #>      ( w -- b u )
                                   2411 ;       Prepare output string.
      008D2B 8D 15                 2412         .word      LINK
                           000CAD  2413 LINK = . 
      008D2D 02                    2414         .byte      2
      008D2E 23 3E                 2415         .ascii     "#>"
      008D30                       2416 EDIGS:
      008D30 CD 85 55         [ 4] 2417         CALL     DROP
      008D33 CD 86 8C         [ 4] 2418         CALL     HLD
      008D36 CD 84 B8         [ 4] 2419         CALL     AT
      008D39 CD 8B BF         [ 4] 2420         CALL     PAD
      008D3C CD 85 89         [ 4] 2421         CALL     OVER
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008D3F CC 87 D3         [ 2] 2422         JP     SUBB
                                   2423 
                                   2424 ;       str     ( w -- b u )
                                   2425 ;       Convert a signed integer
                                   2426 ;       to a numeric string.
      008D42 8D 2D                 2427         .word      LINK
                           000CC4  2428 LINK = . 
      008D44 03                    2429         .byte      3
      008D45 53 54 52              2430         .ascii     "STR"
      008D48                       2431 STR:
      008D48 CD 85 5F         [ 4] 2432         CALL     DUPP
      008D4B CD 85 28         [ 4] 2433         CALL     TOR
      008D4E CD 87 ED         [ 4] 2434         CALL     ABSS
      008D51 CD 8C CB         [ 4] 2435         CALL     BDIGS
      008D54 CD 8D 05         [ 4] 2436         CALL     DIGS
      008D57 CD 85 09         [ 4] 2437         CALL     RFROM
      008D5A CD 8D 1A         [ 4] 2438         CALL     SIGN
      008D5D CC 8D 30         [ 2] 2439         JP     EDIGS
                                   2440 
                                   2441 ;       HEX     ( -- )
                                   2442 ;       Use radix 16 as base for
                                   2443 ;       numeric conversions.
      008D60 8D 44                 2444         .word      LINK
                           000CE2  2445 LINK = . 
      008D62 03                    2446         .byte      3
      008D63 48 45 58              2447         .ascii     "HEX"
      008D66                       2448 HEX:
      008D66 CD 84 30         [ 4] 2449         CALL     DOLIT
      008D69 00 10                 2450         .word      16
      008D6B CD 86 1C         [ 4] 2451         CALL     BASE
      008D6E CC 84 A1         [ 2] 2452         JP     STORE
                                   2453 
                                   2454 ;       DECIMAL ( -- )
                                   2455 ;       Use radix 10 as base
                                   2456 ;       for numeric conversions.
      008D71 8D 62                 2457         .word      LINK
                           000CF3  2458 LINK = . 
      008D73 07                    2459         .byte      7
      008D74 44 45 43 49 4D 41 4C  2460         .ascii     "DECIMAL"
      008D7B                       2461 DECIM:
      008D7B CD 84 30         [ 4] 2462         CALL     DOLIT
      008D7E 00 0A                 2463         .word      10
      008D80 CD 86 1C         [ 4] 2464         CALL     BASE
      008D83 CC 84 A1         [ 2] 2465         JP     STORE
                                   2466 
                                   2467 ;; Numeric input, single precision
                                   2468 
                                   2469 ;       DIGIT?  ( c base -- u t )
                                   2470 ;       Convert a character to its numeric
                                   2471 ;       value. A flag indicates success.
      008D86 8D 73                 2472         .word      LINK
                           000D08  2473 LINK = . 
      008D88 06                    2474         .byte       6
      008D89 44 49 47 49 54 3F     2475         .ascii     "DIGIT?"
      008D8F                       2476 DIGTQ:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008D8F CD 85 28         [ 4] 2477         CALL     TOR
      008D92 CD 84 30         [ 4] 2478         CALL     DOLIT
      008D95 00 30                 2479         .word     48	; "0"
      008D97 CD 87 D3         [ 4] 2480         CALL     SUBB
      008D9A CD 84 30         [ 4] 2481         CALL     DOLIT
      008D9D 00 09                 2482         .word      9
      008D9F CD 85 89         [ 4] 2483         CALL     OVER
      008DA2 CD 88 38         [ 4] 2484         CALL     LESS
      008DA5 CD 84 63         [ 4] 2485         CALL     QBRAN
      008DA8 8D C0                 2486         .word      DGTQ1
      008DAA CD 84 30         [ 4] 2487         CALL     DOLIT
      008DAD 00 07                 2488         .word      7
      008DAF CD 87 D3         [ 4] 2489         CALL     SUBB
      008DB2 CD 85 5F         [ 4] 2490         CALL     DUPP
      008DB5 CD 84 30         [ 4] 2491         CALL     DOLIT
      008DB8 00 0A                 2492         .word      10
      008DBA CD 88 38         [ 4] 2493         CALL     LESS
      008DBD CD 85 BF         [ 4] 2494         CALL     ORR
      008DC0 CD 85 5F         [ 4] 2495 DGTQ1:  CALL     DUPP
      008DC3 CD 85 09         [ 4] 2496         CALL     RFROM
      008DC6 CC 88 1A         [ 2] 2497         JP     ULESS
                                   2498 
                                   2499 ;       NUMBER? ( a -- n T | a F )
                                   2500 ;       Convert a number string to
                                   2501 ;       integer. Push a flag on tos.
      008DC9 8D 88                 2502         .word      LINK
                           000D4B  2503 LINK = . 
      008DCB 07                    2504         .byte      7
      008DCC 4E 55 4D 42 45 52 3F  2505         .ascii     "NUMBER?"
      008DD3                       2506 NUMBQ:
      008DD3 CD 86 1C         [ 4] 2507         CALL     BASE
      008DD6 CD 84 B8         [ 4] 2508         CALL     AT
      008DD9 CD 85 28         [ 4] 2509         CALL     TOR
      008DDC CD 8A C0         [ 4] 2510         CALL     ZERO
      008DDF CD 85 89         [ 4] 2511         CALL     OVER
      008DE2 CD 8B 97         [ 4] 2512         CALL     COUNT
      008DE5 CD 85 89         [ 4] 2513         CALL     OVER
      008DE8 CD 84 D6         [ 4] 2514         CALL     CAT
      008DEB CD 84 30         [ 4] 2515         CALL     DOLIT
      008DEE 00 24                 2516         .word     36	; "0x"
      008DF0 CD 87 FB         [ 4] 2517         CALL     EQUAL
      008DF3 CD 84 63         [ 4] 2518         CALL     QBRAN
      008DF6 8E 07                 2519         .word      NUMQ1
      008DF8 CD 8D 66         [ 4] 2520         CALL     HEX
      008DFB CD 85 6F         [ 4] 2521         CALL     SWAPP
      008DFE CD 8A 54         [ 4] 2522         CALL     ONEP
      008E01 CD 85 6F         [ 4] 2523         CALL     SWAPP
      008E04 CD 8A 61         [ 4] 2524         CALL     ONEM
      008E07 CD 85 89         [ 4] 2525 NUMQ1:  CALL     OVER
      008E0A CD 84 D6         [ 4] 2526         CALL     CAT
      008E0D CD 84 30         [ 4] 2527         CALL     DOLIT
      008E10 00 2D                 2528         .word     45	; "-"
      008E12 CD 87 FB         [ 4] 2529         CALL     EQUAL
      008E15 CD 85 28         [ 4] 2530         CALL     TOR
      008E18 CD 85 6F         [ 4] 2531         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E1B CD 85 1C         [ 4] 2532         CALL     RAT
      008E1E CD 87 D3         [ 4] 2533         CALL     SUBB
      008E21 CD 85 6F         [ 4] 2534         CALL     SWAPP
      008E24 CD 85 1C         [ 4] 2535         CALL     RAT
      008E27 CD 87 5A         [ 4] 2536         CALL     PLUS
      008E2A CD 87 09         [ 4] 2537         CALL     QDUP
      008E2D CD 84 63         [ 4] 2538         CALL     QBRAN
      008E30 8E 91                 2539         .word      NUMQ6
      008E32 CD 8A 61         [ 4] 2540         CALL     ONEM
      008E35 CD 85 28         [ 4] 2541         CALL     TOR
      008E38 CD 85 5F         [ 4] 2542 NUMQ2:  CALL     DUPP
      008E3B CD 85 28         [ 4] 2543         CALL     TOR
      008E3E CD 84 D6         [ 4] 2544         CALL     CAT
      008E41 CD 86 1C         [ 4] 2545         CALL     BASE
      008E44 CD 84 B8         [ 4] 2546         CALL     AT
      008E47 CD 8D 8F         [ 4] 2547         CALL     DIGTQ
      008E4A CD 84 63         [ 4] 2548         CALL     QBRAN
      008E4D 8E 7F                 2549         .word      NUMQ4
      008E4F CD 85 6F         [ 4] 2550         CALL     SWAPP
      008E52 CD 86 1C         [ 4] 2551         CALL     BASE
      008E55 CD 84 B8         [ 4] 2552         CALL     AT
      008E58 CD 89 D3         [ 4] 2553         CALL     STAR
      008E5B CD 87 5A         [ 4] 2554         CALL     PLUS
      008E5E CD 85 09         [ 4] 2555         CALL     RFROM
      008E61 CD 8A 54         [ 4] 2556         CALL     ONEP
      008E64 CD 84 44         [ 4] 2557         CALL     DONXT
      008E67 8E 38                 2558         .word      NUMQ2
      008E69 CD 85 1C         [ 4] 2559         CALL     RAT
      008E6C CD 85 6F         [ 4] 2560         CALL     SWAPP
      008E6F CD 85 55         [ 4] 2561         CALL     DROP
      008E72 CD 84 63         [ 4] 2562         CALL     QBRAN
      008E75 8E 7A                 2563         .word      NUMQ3
      008E77 CD 87 85         [ 4] 2564         CALL     NEGAT
      008E7A CD 85 6F         [ 4] 2565 NUMQ3:  CALL     SWAPP
      008E7D 20 0F            [ 2] 2566         JRA     NUMQ5
      008E7F CD 85 09         [ 4] 2567 NUMQ4:  CALL     RFROM
      008E82 CD 85 09         [ 4] 2568         CALL     RFROM
      008E85 CD 87 3A         [ 4] 2569         CALL     DDROP
      008E88 CD 87 3A         [ 4] 2570         CALL     DDROP
      008E8B CD 8A C0         [ 4] 2571         CALL     ZERO
      008E8E CD 85 5F         [ 4] 2572 NUMQ5:  CALL     DUPP
      008E91 CD 85 09         [ 4] 2573 NUMQ6:  CALL     RFROM
      008E94 CD 87 3A         [ 4] 2574         CALL     DDROP
      008E97 CD 85 09         [ 4] 2575         CALL     RFROM
      008E9A CD 86 1C         [ 4] 2576         CALL     BASE
      008E9D CC 84 A1         [ 2] 2577         JP     STORE
                                   2578 
                                   2579 ;; Basic I/O
                                   2580 
                                   2581 ;       KEY     ( -- c )
                                   2582 ;       Wait for and return an
                                   2583 ;       input character.
      008EA0 8D CB                 2584         .word      LINK
                           000E22  2585 LINK = . 
      008EA2 03                    2586         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008EA3 4B 45 59              2587         .ascii     "KEY"
      008EA6                       2588 KEY:
      008EA6 72 0B 52 40 FB   [ 2] 2589         btjf UART2_SR,#UART_SR_RXNE,. 
      008EAB C6 52 41         [ 1] 2590         ld a,UART2_DR 
      008EAE 1D 00 02         [ 2] 2591         subw x,#CELLL 
      008EB1 E7 01            [ 1] 2592         ld (1,x),a 
      008EB3 7F               [ 1] 2593         clr (x)
      008EB4 81               [ 4] 2594         ret 
                                   2595 
                                   2596 ;       NUF?    ( -- t )
                                   2597 ;       Return false if no input,
                                   2598 ;       else pause and if CR return true.
      008EB5 8E A2                 2599         .word      LINK
                           000E37  2600 LINK = . 
      008EB7 04                    2601         .byte      4
      008EB8 4E 55 46 3F           2602         .ascii     "NUF?"
      008EBC                       2603 NUFQ:
      008EBC CD 83 FC         [ 4] 2604         CALL     QKEY
      008EBF CD 85 5F         [ 4] 2605         CALL     DUPP
      008EC2 CD 84 63         [ 4] 2606         CALL     QBRAN
      008EC5 8E D5                 2607         .word    NUFQ1
      008EC7 CD 87 3A         [ 4] 2608         CALL     DDROP
      008ECA CD 8E A6         [ 4] 2609         CALL     KEY
      008ECD CD 84 30         [ 4] 2610         CALL     DOLIT
      008ED0 00 0D                 2611         .word      CRR
      008ED2 CC 87 FB         [ 2] 2612         JP     EQUAL
      008ED5 81               [ 4] 2613 NUFQ1:  RET
                                   2614 
                                   2615 ;       SPACE   ( -- )
                                   2616 ;       Send  blank character to
                                   2617 ;       output device.
      008ED6 8E B7                 2618         .word      LINK
                           000E58  2619 LINK = . 
      008ED8 05                    2620         .byte      5
      008ED9 53 50 41 43 45        2621         .ascii     "SPACE"
      008EDE                       2622 SPACE:
      008EDE CD 8A B3         [ 4] 2623         CALL     BLANK
      008EE1 CC 84 1A         [ 2] 2624         JP     EMIT
                                   2625 
                                   2626 ;       SPACES  ( +n -- )
                                   2627 ;       Send n spaces to output device.
      008EE4 8E D8                 2628         .word      LINK
                           000E66  2629 LINK = . 
      008EE6 06                    2630         .byte      6
      008EE7 53 50 41 43 45 53     2631         .ascii     "SPACES"
      008EED                       2632 SPACS:
      008EED CD 8A C0         [ 4] 2633         CALL     ZERO
      008EF0 CD 88 58         [ 4] 2634         CALL     MAX
      008EF3 CD 85 28         [ 4] 2635         CALL     TOR
      008EF6 20 03            [ 2] 2636         JRA      CHAR2
      008EF8 CD 8E DE         [ 4] 2637 CHAR1:  CALL     SPACE
      008EFB CD 84 44         [ 4] 2638 CHAR2:  CALL     DONXT
      008EFE 8E F8                 2639         .word    CHAR1
      008F00 81               [ 4] 2640         RET
                                   2641 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2642 ;       TYPE    ( b u -- )
                                   2643 ;       Output u characters from b.
      008F01 8E E6                 2644         .word      LINK
                           000E83  2645 LINK = . 
      008F03 04                    2646         .byte      4
      008F04 54 59 50 45           2647         .ascii     "TYPE"
      008F08                       2648 TYPES:
      008F08 CD 85 28         [ 4] 2649         CALL     TOR
      008F0B 20 0C            [ 2] 2650         JRA     TYPE2
      008F0D CD 85 5F         [ 4] 2651 TYPE1:  CALL     DUPP
      008F10 CD 84 D6         [ 4] 2652         CALL     CAT
      008F13 CD 84 1A         [ 4] 2653         CALL     EMIT
      008F16 CD 8A 54         [ 4] 2654         CALL     ONEP
      008F19 CD 84 44         [ 4] 2655 TYPE2:  CALL     DONXT
      008F1C 8F 0D                 2656         .word      TYPE1
      008F1E CC 85 55         [ 2] 2657         JP     DROP
                                   2658 
                                   2659 ;       CR      ( -- )
                                   2660 ;       Output a carriage return
                                   2661 ;       and a line feed.
      008F21 8F 03                 2662         .word      LINK
                           000EA3  2663 LINK = . 
      008F23 02                    2664         .byte      2
      008F24 43 52                 2665         .ascii     "CR"
      008F26                       2666 CR:
      008F26 CD 84 30         [ 4] 2667         CALL     DOLIT
      008F29 00 0D                 2668         .word      CRR
      008F2B CD 84 1A         [ 4] 2669         CALL     EMIT
      008F2E CD 84 30         [ 4] 2670         CALL     DOLIT
      008F31 00 0A                 2671         .word      LF
      008F33 CC 84 1A         [ 2] 2672         JP     EMIT
                                   2673 
                                   2674 ;       do$     ( -- a )
                                   2675 ;       Return  address of a compiled
                                   2676 ;       string.
      008F36 8F 23                 2677         .word      LINK
                           000EB8  2678 LINK = . 
      008F38 43                    2679 	.byte      COMPO+3
      008F39 44 4F 24              2680         .ascii     "DO$"
      008F3C                       2681 DOSTR:
      008F3C CD 85 09         [ 4] 2682         CALL     RFROM
      008F3F CD 85 1C         [ 4] 2683         CALL     RAT
      008F42 CD 85 09         [ 4] 2684         CALL     RFROM
      008F45 CD 8B 97         [ 4] 2685         CALL     COUNT
      008F48 CD 87 5A         [ 4] 2686         CALL     PLUS
      008F4B CD 85 28         [ 4] 2687         CALL     TOR
      008F4E CD 85 6F         [ 4] 2688         CALL     SWAPP
      008F51 CD 85 28         [ 4] 2689         CALL     TOR
      008F54 81               [ 4] 2690         RET
                                   2691 
                                   2692 ;       $"|     ( -- a )
                                   2693 ;       Run time routine compiled by $".
                                   2694 ;       Return address of a compiled string.
      008F55 8F 38                 2695         .word      LINK
                           000ED7  2696 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008F57 43                    2697 	.byte      COMPO+3
      008F58 24 22 7C              2698         .byte     '$','"','|'
      008F5B                       2699 STRQP:
      008F5B CD 8F 3C         [ 4] 2700         CALL     DOSTR
      008F5E 81               [ 4] 2701         RET
                                   2702 
                                   2703 ;       ."|     ( -- )
                                   2704 ;       Run time routine of ." .
                                   2705 ;       Output a compiled string.
      008F5F 8F 57                 2706         .word      LINK
                           000EE1  2707 LINK = . 
      008F61 43                    2708 	.byte      COMPO+3
      008F62 2E 22 7C              2709         .byte     '.','"','|'
      008F65                       2710 DOTQP:
      008F65 CD 8F 3C         [ 4] 2711         CALL     DOSTR
      008F68 CD 8B 97         [ 4] 2712         CALL     COUNT
      008F6B CC 8F 08         [ 2] 2713         JP     TYPES
                                   2714 
                                   2715 ;       .R      ( n +n -- )
                                   2716 ;       Display an integer in a field
                                   2717 ;       of n columns, right justified.
      008F6E 8F 61                 2718         .word      LINK
                           000EF0  2719 LINK = . 
      008F70 02                    2720         .byte      2
      008F71 2E 52                 2721         .ascii     ".R"
      008F73                       2722 DOTR:
      008F73 CD 85 28         [ 4] 2723         CALL     TOR
      008F76 CD 8D 48         [ 4] 2724         CALL     STR
      008F79 CD 85 09         [ 4] 2725         CALL     RFROM
      008F7C CD 85 89         [ 4] 2726         CALL     OVER
      008F7F CD 87 D3         [ 4] 2727         CALL     SUBB
      008F82 CD 8E ED         [ 4] 2728         CALL     SPACS
      008F85 CC 8F 08         [ 2] 2729         JP     TYPES
                                   2730 
                                   2731 ;       U.R     ( u +n -- )
                                   2732 ;       Display an unsigned integer
                                   2733 ;       in n column, right justified.
      008F88 8F 70                 2734         .word      LINK
                           000F0A  2735 LINK = . 
      008F8A 03                    2736         .byte      3
      008F8B 55 2E 52              2737         .ascii     "U.R"
      008F8E                       2738 UDOTR:
      008F8E CD 85 28         [ 4] 2739         CALL     TOR
      008F91 CD 8C CB         [ 4] 2740         CALL     BDIGS
      008F94 CD 8D 05         [ 4] 2741         CALL     DIGS
      008F97 CD 8D 30         [ 4] 2742         CALL     EDIGS
      008F9A CD 85 09         [ 4] 2743         CALL     RFROM
      008F9D CD 85 89         [ 4] 2744         CALL     OVER
      008FA0 CD 87 D3         [ 4] 2745         CALL     SUBB
      008FA3 CD 8E ED         [ 4] 2746         CALL     SPACS
      008FA6 CC 8F 08         [ 2] 2747         JP     TYPES
                                   2748 
                                   2749 ;       U.      ( u -- )
                                   2750 ;       Display an unsigned integer
                                   2751 ;       in free format.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008FA9 8F 8A                 2752         .word      LINK
                           000F2B  2753 LINK = . 
      008FAB 02                    2754         .byte      2
      008FAC 55 2E                 2755         .ascii     "U."
      008FAE                       2756 UDOT:
      008FAE CD 8C CB         [ 4] 2757         CALL     BDIGS
      008FB1 CD 8D 05         [ 4] 2758         CALL     DIGS
      008FB4 CD 8D 30         [ 4] 2759         CALL     EDIGS
      008FB7 CD 8E DE         [ 4] 2760         CALL     SPACE
      008FBA CC 8F 08         [ 2] 2761         JP     TYPES
                                   2762 
                                   2763 ;       .       ( w -- )
                                   2764 ;       Display an integer in free
                                   2765 ;       format, preceeded by a space.
      008FBD 8F AB                 2766         .word      LINK
                           000F3F  2767 LINK = . 
      008FBF 01                    2768         .byte      1
      008FC0 2E                    2769         .ascii     "."
      008FC1                       2770 DOT:
      008FC1 CD 86 1C         [ 4] 2771         CALL     BASE
      008FC4 CD 84 B8         [ 4] 2772         CALL     AT
      008FC7 CD 84 30         [ 4] 2773         CALL     DOLIT
      008FCA 00 0A                 2774         .word      10
      008FCC CD 85 D4         [ 4] 2775         CALL     XORR    ;?decimal
      008FCF CD 84 63         [ 4] 2776         CALL     QBRAN
      008FD2 8F D7                 2777         .word      DOT1
      008FD4 CC 8F AE         [ 2] 2778         JP     UDOT
      008FD7 CD 8D 48         [ 4] 2779 DOT1:   CALL     STR
      008FDA CD 8E DE         [ 4] 2780         CALL     SPACE
      008FDD CC 8F 08         [ 2] 2781         JP     TYPES
                                   2782 
                                   2783 ;       ?       ( a -- )
                                   2784 ;       Display contents in memory cell.
      008FE0 8F BF                 2785         .word      LINK
                                   2786         
                           000F62  2787 LINK = . 
      008FE2 01                    2788         .byte      1
      008FE3 3F                    2789         .ascii     "?"
      008FE4                       2790 QUEST:
      008FE4 CD 84 B8         [ 4] 2791         CALL     AT
      008FE7 CC 8F C1         [ 2] 2792         JP     DOT
                                   2793 
                                   2794 ;; Parsing
                                   2795 
                                   2796 ;       parse   ( b u c -- b u delta ; <string> )
                                   2797 ;       Scan string delimited by c.
                                   2798 ;       Return found string and its offset.
      008FEA 8F E2                 2799         .word      LINK
                           000F6C  2800 LINK = . 
      008FEC 05                    2801         .byte      5
      008FED 70 61 72 73 65        2802         .ascii     "parse"
      008FF2                       2803 PARS:
      008FF2 CD 86 2B         [ 4] 2804         CALL     TEMP
      008FF5 CD 84 A1         [ 4] 2805         CALL     STORE
      008FF8 CD 85 89         [ 4] 2806         CALL     OVER
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008FFB CD 85 28         [ 4] 2807         CALL     TOR
      008FFE CD 85 5F         [ 4] 2808         CALL     DUPP
      009001 CD 84 63         [ 4] 2809         CALL     QBRAN
      009004 90 AA                 2810         .word    PARS8
      009006 CD 8A 61         [ 4] 2811         CALL     ONEM
      009009 CD 86 2B         [ 4] 2812         CALL     TEMP
      00900C CD 84 B8         [ 4] 2813         CALL     AT
      00900F CD 8A B3         [ 4] 2814         CALL     BLANK
      009012 CD 87 FB         [ 4] 2815         CALL     EQUAL
      009015 CD 84 63         [ 4] 2816         CALL     QBRAN
      009018 90 4B                 2817         .word      PARS3
      00901A CD 85 28         [ 4] 2818         CALL     TOR
      00901D CD 8A B3         [ 4] 2819 PARS1:  CALL     BLANK
      009020 CD 85 89         [ 4] 2820         CALL     OVER
      009023 CD 84 D6         [ 4] 2821         CALL     CAT     ;skip leading blanks ONLY
      009026 CD 87 D3         [ 4] 2822         CALL     SUBB
      009029 CD 85 98         [ 4] 2823         CALL     ZLESS
      00902C CD 87 74         [ 4] 2824         CALL     INVER
      00902F CD 84 63         [ 4] 2825         CALL     QBRAN
      009032 90 48                 2826         .word      PARS2
      009034 CD 8A 54         [ 4] 2827         CALL     ONEP
      009037 CD 84 44         [ 4] 2828         CALL     DONXT
      00903A 90 1D                 2829         .word      PARS1
      00903C CD 85 09         [ 4] 2830         CALL     RFROM
      00903F CD 85 55         [ 4] 2831         CALL     DROP
      009042 CD 8A C0         [ 4] 2832         CALL     ZERO
      009045 CC 85 5F         [ 2] 2833         JP     DUPP
      009048 CD 85 09         [ 4] 2834 PARS2:  CALL     RFROM
      00904B CD 85 89         [ 4] 2835 PARS3:  CALL     OVER
      00904E CD 85 6F         [ 4] 2836         CALL     SWAPP
      009051 CD 85 28         [ 4] 2837         CALL     TOR
      009054 CD 86 2B         [ 4] 2838 PARS4:  CALL     TEMP
      009057 CD 84 B8         [ 4] 2839         CALL     AT
      00905A CD 85 89         [ 4] 2840         CALL     OVER
      00905D CD 84 D6         [ 4] 2841         CALL     CAT
      009060 CD 87 D3         [ 4] 2842         CALL     SUBB    ;scan for delimiter
      009063 CD 86 2B         [ 4] 2843         CALL     TEMP
      009066 CD 84 B8         [ 4] 2844         CALL     AT
      009069 CD 8A B3         [ 4] 2845         CALL     BLANK
      00906C CD 87 FB         [ 4] 2846         CALL     EQUAL
      00906F CD 84 63         [ 4] 2847         CALL     QBRAN
      009072 90 77                 2848         .word      PARS5
      009074 CD 85 98         [ 4] 2849         CALL     ZLESS
      009077 CD 84 63         [ 4] 2850 PARS5:  CALL     QBRAN
      00907A 90 8C                 2851         .word      PARS6
      00907C CD 8A 54         [ 4] 2852         CALL     ONEP
      00907F CD 84 44         [ 4] 2853         CALL     DONXT
      009082 90 54                 2854         .word      PARS4
      009084 CD 85 5F         [ 4] 2855         CALL     DUPP
      009087 CD 85 28         [ 4] 2856         CALL     TOR
      00908A 20 0F            [ 2] 2857         JRA     PARS7
      00908C CD 85 09         [ 4] 2858 PARS6:  CALL     RFROM
      00908F CD 85 55         [ 4] 2859         CALL     DROP
      009092 CD 85 5F         [ 4] 2860         CALL     DUPP
      009095 CD 8A 54         [ 4] 2861         CALL     ONEP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      009098 CD 85 28         [ 4] 2862         CALL     TOR
      00909B CD 85 89         [ 4] 2863 PARS7:  CALL     OVER
      00909E CD 87 D3         [ 4] 2864         CALL     SUBB
      0090A1 CD 85 09         [ 4] 2865         CALL     RFROM
      0090A4 CD 85 09         [ 4] 2866         CALL     RFROM
      0090A7 CC 87 D3         [ 2] 2867         JP     SUBB
      0090AA CD 85 89         [ 4] 2868 PARS8:  CALL     OVER
      0090AD CD 85 09         [ 4] 2869         CALL     RFROM
      0090B0 CC 87 D3         [ 2] 2870         JP     SUBB
                                   2871 
                                   2872 ;       PARSE   ( c -- b u ; <string> )
                                   2873 ;       Scan input stream and return
                                   2874 ;       counted string delimited by c.
      0090B3 8F EC                 2875         .word      LINK
                           001035  2876 LINK = . 
      0090B5 05                    2877         .byte      5
      0090B6 50 41 52 53 45        2878         .ascii     "PARSE"
      0090BB                       2879 PARSE:
      0090BB CD 85 28         [ 4] 2880         CALL     TOR
      0090BE CD 8B D0         [ 4] 2881         CALL     TIB
      0090C1 CD 86 3A         [ 4] 2882         CALL     INN
      0090C4 CD 84 B8         [ 4] 2883         CALL     AT
      0090C7 CD 87 5A         [ 4] 2884         CALL     PLUS    ;current input buffer pointer
      0090CA CD 86 4A         [ 4] 2885         CALL     NTIB
      0090CD CD 84 B8         [ 4] 2886         CALL     AT
      0090D0 CD 86 3A         [ 4] 2887         CALL     INN
      0090D3 CD 84 B8         [ 4] 2888         CALL     AT
      0090D6 CD 87 D3         [ 4] 2889         CALL     SUBB    ;remaining count
      0090D9 CD 85 09         [ 4] 2890         CALL     RFROM
      0090DC CD 8F F2         [ 4] 2891         CALL     PARS
      0090DF CD 86 3A         [ 4] 2892         CALL     INN
      0090E2 CC 8B 30         [ 2] 2893         JP     PSTOR
                                   2894 
                                   2895 ;       .(      ( -- )
                                   2896 ;       Output following string up to next ) .
      0090E5 90 B5                 2897         .word      LINK
                           001067  2898 LINK = . 
      0090E7 82                    2899 	.byte      IMEDD+2
      0090E8 2E 28                 2900         .ascii     ".("
      0090EA                       2901 DOTPR:
      0090EA CD 84 30         [ 4] 2902         CALL     DOLIT
      0090ED 00 29                 2903         .word     41	; ")"
      0090EF CD 90 BB         [ 4] 2904         CALL     PARSE
      0090F2 CC 8F 08         [ 2] 2905         JP     TYPES
                                   2906 
                                   2907 ;       (       ( -- )
                                   2908 ;       Ignore following string up to next ).
                                   2909 ;       A comment.
      0090F5 90 E7                 2910         .word      LINK
                           001077  2911 LINK = . 
      0090F7 81                    2912 	.byte      IMEDD+1
      0090F8 28                    2913         .ascii     "("
      0090F9                       2914 PAREN:
      0090F9 CD 84 30         [ 4] 2915         CALL     DOLIT
      0090FC 00 29                 2916         .word     41	; ")"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      0090FE CD 90 BB         [ 4] 2917         CALL     PARSE
      009101 CC 87 3A         [ 2] 2918         JP     DDROP
                                   2919 
                                   2920 ;       \       ( -- )
                                   2921 ;       Ignore following text till
                                   2922 ;       end of line.
      009104 90 F7                 2923         .word      LINK
                           001086  2924 LINK = . 
      009106 81                    2925 	.byte      IMEDD+1
      009107 5C                    2926         .ascii     "\"
      009108                       2927 BKSLA:
      009108 90 AE 00 0C      [ 2] 2928         ldw y,#UCTIB ; #TIB  
      00910C 90 FE            [ 2] 2929         ldw y,(y)
      00910E 90 89            [ 2] 2930         pushw y ; count in TIB 
      009110 90 AE 00 0A      [ 2] 2931         ldw y,#UINN ; >IN 
      009114 90 BF 24         [ 2] 2932         ldw YTEMP,y
      009117 90 85            [ 2] 2933         popw y 
      009119 91 CF 24         [ 5] 2934         ldw [YTEMP],y
      00911C 81               [ 4] 2935         ret 
                                   2936 
                                   2937 ;       WORD    ( c -- a ; <string> )
                                   2938 ;       Parse a word from input stream
                                   2939 ;       and copy it to code dictionary.
      00911D 91 06                 2940         .word      LINK
                           00109F  2941 LINK = . 
      00911F 04                    2942         .byte      4
      009120 57 4F 52 44           2943         .ascii     "WORD"
      009124                       2944 WORDD:
      009124 CD 90 BB         [ 4] 2945         CALL     PARSE
      009127 CD 8B AE         [ 4] 2946         CALL     HERE
      00912A CD 8A 29         [ 4] 2947         CALL     CELLP
      00912D CC 8C 6E         [ 2] 2948         JP     PACKS
                                   2949 
                                   2950 ;       TOKEN   ( -- a ; <string> )
                                   2951 ;       Parse a word from input stream
                                   2952 ;       and copy it to name dictionary.
      009130 91 1F                 2953         .word      LINK
                           0010B2  2954 LINK = . 
      009132 05                    2955         .byte      5
      009133 54 4F 4B 45 4E        2956         .ascii     "TOKEN"
      009138                       2957 TOKEN:
      009138 CD 8A B3         [ 4] 2958         CALL     BLANK
      00913B CC 91 24         [ 2] 2959         JP     WORDD
                                   2960 
                                   2961 ;; Dictionary search
                                   2962 
                                   2963 ;       NAME>   ( na -- ca )
                                   2964 ;       Return a code address given
                                   2965 ;       a name address.
      00913E 91 32                 2966         .word      LINK
                           0010C0  2967 LINK = . 
      009140 05                    2968         .byte      5
      009141 4E 41 4D 45 3E        2969         .ascii     "NAME>"
      009146                       2970 NAMET:
      009146 CD 8B 97         [ 4] 2971         CALL     COUNT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009149 CD 84 30         [ 4] 2972         CALL     DOLIT
      00914C 00 1F                 2973         .word      31
      00914E CD 85 AB         [ 4] 2974         CALL     ANDD
      009151 CC 87 5A         [ 2] 2975         JP     PLUS
                                   2976 
                                   2977 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   2978 ;       Compare u cells in two
                                   2979 ;       strings. Return 0 if identical.
      009154 91 40                 2980         .word      LINK
                           0010D6  2981 LINK = . 
      009156 05                    2982         .byte       5
      009157 53 41 4D 45 3F        2983         .ascii     "SAME?"
      00915C                       2984 SAMEQ:
      00915C CD 8A 61         [ 4] 2985         CALL     ONEM
      00915F CD 85 28         [ 4] 2986         CALL     TOR
      009162 20 29            [ 2] 2987         JRA     SAME2
      009164 CD 85 89         [ 4] 2988 SAME1:  CALL     OVER
      009167 CD 85 1C         [ 4] 2989         CALL     RAT
      00916A CD 87 5A         [ 4] 2990         CALL     PLUS
      00916D CD 84 D6         [ 4] 2991         CALL     CAT
      009170 CD 85 89         [ 4] 2992         CALL     OVER
      009173 CD 85 1C         [ 4] 2993         CALL     RAT
      009176 CD 87 5A         [ 4] 2994         CALL     PLUS
      009179 CD 84 D6         [ 4] 2995         CALL     CAT
      00917C CD 87 D3         [ 4] 2996         CALL     SUBB
      00917F CD 87 09         [ 4] 2997         CALL     QDUP
      009182 CD 84 63         [ 4] 2998         CALL     QBRAN
      009185 91 8D                 2999         .word      SAME2
      009187 CD 85 09         [ 4] 3000         CALL     RFROM
      00918A CC 85 55         [ 2] 3001         JP     DROP
      00918D CD 84 44         [ 4] 3002 SAME2:  CALL     DONXT
      009190 91 64                 3003         .word      SAME1
      009192 CC 8A C0         [ 2] 3004         JP     ZERO
                                   3005 
                                   3006 ;       find    ( a va -- ca na | a F )
                                   3007 ;       Search vocabulary for string.
                                   3008 ;       Return ca and na if succeeded.
      009195 91 56                 3009         .word      LINK
                           001117  3010 LINK = . 
      009197 04                    3011         .byte      4
      009198 46 49 4E 44           3012         .ascii     "FIND"
      00919C                       3013 FIND:
      00919C CD 85 6F         [ 4] 3014         CALL     SWAPP
      00919F CD 85 5F         [ 4] 3015         CALL     DUPP
      0091A2 CD 84 D6         [ 4] 3016         CALL     CAT
      0091A5 CD 86 2B         [ 4] 3017         CALL     TEMP
      0091A8 CD 84 A1         [ 4] 3018         CALL     STORE
      0091AB CD 85 5F         [ 4] 3019         CALL     DUPP
      0091AE CD 84 B8         [ 4] 3020         CALL     AT
      0091B1 CD 85 28         [ 4] 3021         CALL     TOR
      0091B4 CD 8A 29         [ 4] 3022         CALL     CELLP
      0091B7 CD 85 6F         [ 4] 3023         CALL     SWAPP
      0091BA CD 84 B8         [ 4] 3024 FIND1:  CALL     AT
      0091BD CD 85 5F         [ 4] 3025         CALL     DUPP
      0091C0 CD 84 63         [ 4] 3026         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0091C3 91 F9                 3027         .word      FIND6
      0091C5 CD 85 5F         [ 4] 3028         CALL     DUPP
      0091C8 CD 84 B8         [ 4] 3029         CALL     AT
      0091CB CD 84 30         [ 4] 3030         CALL     DOLIT
      0091CE 1F 7F                 3031         .word      MASKK
      0091D0 CD 85 AB         [ 4] 3032         CALL     ANDD
      0091D3 CD 85 1C         [ 4] 3033         CALL     RAT
      0091D6 CD 85 D4         [ 4] 3034         CALL     XORR
      0091D9 CD 84 63         [ 4] 3035         CALL     QBRAN
      0091DC 91 E8                 3036         .word      FIND2
      0091DE CD 8A 29         [ 4] 3037         CALL     CELLP
      0091E1 CD 84 30         [ 4] 3038         CALL     DOLIT
      0091E4 FF FF                 3039         .word     0xFFFF
      0091E6 20 0C            [ 2] 3040         JRA     FIND3
      0091E8 CD 8A 29         [ 4] 3041 FIND2:  CALL     CELLP
      0091EB CD 86 2B         [ 4] 3042         CALL     TEMP
      0091EE CD 84 B8         [ 4] 3043         CALL     AT
      0091F1 CD 91 5C         [ 4] 3044         CALL     SAMEQ
      0091F4 CD 84 7A         [ 4] 3045 FIND3:  CALL     BRAN
      0091F7 92 08                 3046         .word      FIND4
      0091F9 CD 85 09         [ 4] 3047 FIND6:  CALL     RFROM
      0091FC CD 85 55         [ 4] 3048         CALL     DROP
      0091FF CD 85 6F         [ 4] 3049         CALL     SWAPP
      009202 CD 8A 38         [ 4] 3050         CALL     CELLM
      009205 CC 85 6F         [ 2] 3051         JP     SWAPP
      009208 CD 84 63         [ 4] 3052 FIND4:  CALL     QBRAN
      00920B 92 15                 3053         .word      FIND5
      00920D CD 8A 38         [ 4] 3054         CALL     CELLM
      009210 CD 8A 38         [ 4] 3055         CALL     CELLM
      009213 20 A5            [ 2] 3056         JRA     FIND1
      009215 CD 85 09         [ 4] 3057 FIND5:  CALL     RFROM
      009218 CD 85 55         [ 4] 3058         CALL     DROP
      00921B CD 85 6F         [ 4] 3059         CALL     SWAPP
      00921E CD 85 55         [ 4] 3060         CALL     DROP
      009221 CD 8A 38         [ 4] 3061         CALL     CELLM
      009224 CD 85 5F         [ 4] 3062         CALL     DUPP
      009227 CD 91 46         [ 4] 3063         CALL     NAMET
      00922A CC 85 6F         [ 2] 3064         JP     SWAPP
                                   3065 
                                   3066 ;       NAME?   ( a -- ca na | a F )
                                   3067 ;       Search vocabularies for a string.
      00922D 91 97                 3068         .word      LINK
                           0011AF  3069 LINK = . 
      00922F 05                    3070         .byte      5
      009230 4E 41 4D 45 3F        3071         .ascii     "NAME?"
      009235                       3072 NAMEQ:
      009235 CD 86 9F         [ 4] 3073         CALL   CNTXT
      009238 CC 91 9C         [ 2] 3074         JP     FIND
                                   3075 
                                   3076 ;; Terminal response
                                   3077 
                                   3078 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3079 ;       Backup cursor by one character.
      00923B 92 2F                 3080         .word      LINK
                           0011BD  3081 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      00923D 02                    3082         .byte      2
      00923E 5E 48                 3083         .ascii     "^H"
      009240                       3084 BKSP:
      009240 CD 85 28         [ 4] 3085         CALL     TOR
      009243 CD 85 89         [ 4] 3086         CALL     OVER
      009246 CD 85 09         [ 4] 3087         CALL     RFROM
      009249 CD 85 6F         [ 4] 3088         CALL     SWAPP
      00924C CD 85 89         [ 4] 3089         CALL     OVER
      00924F CD 85 D4         [ 4] 3090         CALL     XORR
      009252 CD 84 63         [ 4] 3091         CALL     QBRAN
      009255 92 70                 3092         .word      BACK1
      009257 CD 84 30         [ 4] 3093         CALL     DOLIT
      00925A 00 08                 3094         .word      BKSPP
      00925C CD 84 1A         [ 4] 3095         CALL     EMIT
      00925F CD 8A 61         [ 4] 3096         CALL     ONEM
      009262 CD 8A B3         [ 4] 3097         CALL     BLANK
      009265 CD 84 1A         [ 4] 3098         CALL     EMIT
      009268 CD 84 30         [ 4] 3099         CALL     DOLIT
      00926B 00 08                 3100         .word      BKSPP
      00926D CC 84 1A         [ 2] 3101         JP     EMIT
      009270 81               [ 4] 3102 BACK1:  RET
                                   3103 
                                   3104 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3105 ;       Accept and echo key stroke
                                   3106 ;       and bump cursor.
      009271 92 3D                 3107         .word      LINK
                           0011F3  3108 LINK = . 
      009273 03                    3109         .byte      3
      009274 54 41 50              3110         .ascii     "TAP"
      009277                       3111 TAP:
      009277 CD 85 5F         [ 4] 3112         CALL     DUPP
      00927A CD 84 1A         [ 4] 3113         CALL     EMIT
      00927D CD 85 89         [ 4] 3114         CALL     OVER
      009280 CD 84 C5         [ 4] 3115         CALL     CSTOR
      009283 CC 8A 54         [ 2] 3116         JP     ONEP
                                   3117 
                                   3118 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3119 ;       Process a key stroke,
                                   3120 ;       CR or backspace.
      009286 92 73                 3121         .word      LINK
                           001208  3122 LINK = . 
      009288 04                    3123         .byte      4
      009289 4B 54 41 50           3124         .ascii     "KTAP"
      00928D                       3125 KTAP:
      00928D CD 85 5F         [ 4] 3126         CALL     DUPP
      009290 CD 84 30         [ 4] 3127         CALL     DOLIT
      009293 00 0D                 3128         .word      CRR
      009295 CD 85 D4         [ 4] 3129         CALL     XORR
      009298 CD 84 63         [ 4] 3130         CALL     QBRAN
      00929B 92 B3                 3131         .word      KTAP2
      00929D CD 84 30         [ 4] 3132         CALL     DOLIT
      0092A0 00 08                 3133         .word      BKSPP
      0092A2 CD 85 D4         [ 4] 3134         CALL     XORR
      0092A5 CD 84 63         [ 4] 3135         CALL     QBRAN
      0092A8 92 B0                 3136         .word      KTAP1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0092AA CD 8A B3         [ 4] 3137         CALL     BLANK
      0092AD CC 92 77         [ 2] 3138         JP     TAP
      0092B0 CC 92 40         [ 2] 3139 KTAP1:  JP     BKSP
      0092B3 CD 85 55         [ 4] 3140 KTAP2:  CALL     DROP
      0092B6 CD 85 6F         [ 4] 3141         CALL     SWAPP
      0092B9 CD 85 55         [ 4] 3142         CALL     DROP
      0092BC CC 85 5F         [ 2] 3143         JP     DUPP
                                   3144 
                                   3145 ;       accept  ( b u -- b u )
                                   3146 ;       Accept characters to input
                                   3147 ;       buffer. Return with actual count.
      0092BF 92 88                 3148         .word      LINK
                           001241  3149 LINK = . 
      0092C1 06                    3150         .byte      6
      0092C2 41 43 43 45 50 54     3151         .ascii     "ACCEPT"
      0092C8                       3152 ACCEP:
      0092C8 CD 85 89         [ 4] 3153         CALL     OVER
      0092CB CD 87 5A         [ 4] 3154         CALL     PLUS
      0092CE CD 85 89         [ 4] 3155         CALL     OVER
      0092D1 CD 87 45         [ 4] 3156 ACCP1:  CALL     DDUP
      0092D4 CD 85 D4         [ 4] 3157         CALL     XORR
      0092D7 CD 84 63         [ 4] 3158         CALL     QBRAN
      0092DA 92 FC                 3159         .word      ACCP4
      0092DC CD 8E A6         [ 4] 3160         CALL     KEY
      0092DF CD 85 5F         [ 4] 3161         CALL     DUPP
      0092E2 CD 8A B3         [ 4] 3162         CALL     BLANK
      0092E5 CD 84 30         [ 4] 3163         CALL     DOLIT
      0092E8 00 7F                 3164         .word      127
      0092EA CD 88 95         [ 4] 3165         CALL     WITHI
      0092ED CD 84 63         [ 4] 3166         CALL     QBRAN
      0092F0 92 F7                 3167         .word      ACCP2
      0092F2 CD 92 77         [ 4] 3168         CALL     TAP
      0092F5 20 03            [ 2] 3169         JRA     ACCP3
      0092F7 CD 92 8D         [ 4] 3170 ACCP2:  CALL     KTAP
      0092FA 20 D5            [ 2] 3171 ACCP3:  JRA     ACCP1
      0092FC CD 85 55         [ 4] 3172 ACCP4:  CALL     DROP
      0092FF CD 85 89         [ 4] 3173         CALL     OVER
      009302 CC 87 D3         [ 2] 3174         JP     SUBB
                                   3175 
                                   3176 ;       QUERY   ( -- )
                                   3177 ;       Accept input stream to
                                   3178 ;       terminal input buffer.
      009305 92 C1                 3179         .word      LINK
                                   3180         
                           001287  3181 LINK = . 
      009307 05                    3182         .byte      5
      009308 51 55 45 52 59        3183         .ascii     "QUERY"
      00930D                       3184 QUERY:
      00930D CD 8B D0         [ 4] 3185         CALL     TIB
      009310 CD 84 30         [ 4] 3186         CALL     DOLIT
      009313 00 50                 3187         .word      80
      009315 CD 92 C8         [ 4] 3188         CALL     ACCEP
      009318 CD 86 4A         [ 4] 3189         CALL     NTIB
      00931B CD 84 A1         [ 4] 3190         CALL     STORE
      00931E CD 85 55         [ 4] 3191         CALL     DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      009321 CD 8A C0         [ 4] 3192         CALL     ZERO
      009324 CD 86 3A         [ 4] 3193         CALL     INN
      009327 CC 84 A1         [ 2] 3194         JP     STORE
                                   3195 
                                   3196 ;       ABORT   ( -- )
                                   3197 ;       Reset data stack and
                                   3198 ;       jump to QUIT.
      00932A 93 07                 3199         .word      LINK
                           0012AC  3200 LINK = . 
      00932C 05                    3201         .byte      5
      00932D 41 42 4F 52 54        3202         .ascii     "ABORT"
      009332                       3203 ABORT:
      009332 CD 94 29         [ 4] 3204         CALL     PRESE
      009335 CC 94 46         [ 2] 3205         JP     QUIT
                                   3206 
                                   3207 ;       abort"  ( f -- )
                                   3208 ;       Run time routine of ABORT".
                                   3209 ;       Abort with a message.
      009338 93 2C                 3210         .word      LINK
                           0012BA  3211 LINK = . 
      00933A 46                    3212 	.byte      COMPO+6
      00933B 41 42 4F 52 54        3213         .ascii     "ABORT"
      009340 22                    3214         .byte      '"'
      009341                       3215 ABORQ:
      009341 CD 84 63         [ 4] 3216         CALL     QBRAN
      009344 93 60                 3217         .word      ABOR2   ;text flag
      009346 CD 8F 3C         [ 4] 3218         CALL     DOSTR
      009349 CD 8E DE         [ 4] 3219 ABOR1:  CALL     SPACE
      00934C CD 8B 97         [ 4] 3220         CALL     COUNT
      00934F CD 8F 08         [ 4] 3221         CALL     TYPES
      009352 CD 84 30         [ 4] 3222         CALL     DOLIT
      009355 00 3F                 3223         .word     63 ; "?"
      009357 CD 84 1A         [ 4] 3224         CALL     EMIT
      00935A CD 8F 26         [ 4] 3225         CALL     CR
      00935D CC 93 32         [ 2] 3226         JP     ABORT   ;pass error string
      009360 CD 8F 3C         [ 4] 3227 ABOR2:  CALL     DOSTR
      009363 CC 85 55         [ 2] 3228         JP     DROP
                                   3229 
                                   3230 ;; The text interpreter
                                   3231 
                                   3232 ;       $INTERPRET      ( a -- )
                                   3233 ;       Interpret a word. If failed,
                                   3234 ;       try to convert it to an integer.
      009366 93 3A                 3235         .word      LINK
                           0012E8  3236 LINK = . 
      009368 0A                    3237         .byte      10
      009369 24 49 4E 54 45 52 50  3238         .ascii     "$INTERPRET"
             52 45 54
      009373                       3239 INTER:
      009373 CD 92 35         [ 4] 3240         CALL     NAMEQ
      009376 CD 87 09         [ 4] 3241         CALL     QDUP    ;?defined
      009379 CD 84 63         [ 4] 3242         CALL     QBRAN
      00937C 93 9D                 3243         .word      INTE1
      00937E CD 84 B8         [ 4] 3244         CALL     AT
      009381 CD 84 30         [ 4] 3245         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009384 40 00                 3246 	.word       0x4000	; COMPO*256
      009386 CD 85 AB         [ 4] 3247         CALL     ANDD    ;?compile only lexicon bits
      009389 CD 93 41         [ 4] 3248         CALL     ABORQ
      00938C 0D                    3249         .byte      13
      00938D 20 63 6F 6D 70 69 6C  3250         .ascii     " compile only"
             65 20 6F 6E 6C 79
      00939A CC 84 8A         [ 2] 3251         JP     EXECU
      00939D CD 8D D3         [ 4] 3252 INTE1:  CALL     NUMBQ   ;convert a number
      0093A0 CD 84 63         [ 4] 3253         CALL     QBRAN
      0093A3 93 49                 3254         .word    ABOR1
      0093A5 81               [ 4] 3255         RET
                                   3256 
                                   3257 ;       [       ( -- )
                                   3258 ;       Start  text interpreter.
      0093A6 93 68                 3259         .word      LINK
                           001328  3260 LINK = . 
      0093A8 81                    3261 	.byte      IMEDD+1
      0093A9 5B                    3262         .ascii     "["
      0093AA                       3263 LBRAC:
      0093AA CD 84 30         [ 4] 3264         CALL   DOLIT
      0093AD 93 73                 3265         .word  INTER
      0093AF CD 86 7D         [ 4] 3266         CALL   TEVAL
      0093B2 CC 84 A1         [ 2] 3267         JP     STORE
                                   3268 
                                   3269 ;       .OK     ( -- )
                                   3270 ;       Display 'ok' while interpreting.
      0093B5 93 A8                 3271         .word      LINK
                           001337  3272 LINK = . 
      0093B7 03                    3273         .byte      3
      0093B8 2E 4F 4B              3274         .ascii     ".OK"
      0093BB                       3275 DOTOK:
      0093BB CD 84 30         [ 4] 3276         CALL     DOLIT
      0093BE 93 73                 3277         .word      INTER
      0093C0 CD 86 7D         [ 4] 3278         CALL     TEVAL
      0093C3 CD 84 B8         [ 4] 3279         CALL     AT
      0093C6 CD 87 FB         [ 4] 3280         CALL     EQUAL
      0093C9 CD 84 63         [ 4] 3281         CALL     QBRAN
      0093CC 93 D5                 3282         .word      DOTO1
      0093CE CD 8F 65         [ 4] 3283         CALL     DOTQP
      0093D1 03                    3284         .byte      3
      0093D2 20 6F 6B              3285         .ascii     " ok"
      0093D5 CC 8F 26         [ 2] 3286 DOTO1:  JP     CR
                                   3287 
                                   3288 ;       ?STACK  ( -- )
                                   3289 ;       Abort if stack underflows.
      0093D8 93 B7                 3290         .word      LINK
                           00135A  3291 LINK = . 
      0093DA 06                    3292         .byte      6
      0093DB 3F 53 54 41 43 4B     3293         .ascii     "?STACK"
      0093E1                       3294 QSTAC: 
      0093E1 CD 8B 02         [ 4] 3295         CALL     DEPTH
      0093E4 CD 85 98         [ 4] 3296         CALL     ZLESS   ;check only for underflow
      0093E7 CD 93 41         [ 4] 3297         CALL     ABORQ
      0093EA 0B                    3298         .byte      11
      0093EB 20 75 6E 64 65 72 66  3299         .ascii     " underflow "
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal  6C-Bits]



             6C 6F 77 20
      0093F3 6F               [ 4] 3300         RET
                                   3301 
                                   3302 ;       EVAL    ( -- )
                                   3303 ;       Interpret  input stream.
      0093F4 77 20                 3304         .word      LINK
                           001379  3305 LINK = . 
      0093F6 81                    3306         .byte      4
      0093F7 93 DA 04 45           3307         .ascii     "EVAL"
      00137E                       3308 EVAL:
      0093FB 56 41 4C         [ 4] 3309 EVAL1:  CALL     TOKEN
      0093FE CD 04 DF         [ 4] 3310         CALL     DUPP
      0093FE CD 91 38         [ 4] 3311         CALL     CAT     ;?input stream empty
      009401 CD 85 5F         [ 4] 3312         CALL     QBRAN
      009404 CD 84                 3313         .word    EVAL2
      009406 D6 CD 84         [ 4] 3314         CALL     TEVAL
      009409 63 94 1A         [ 4] 3315         CALL     ATEXE
      00940C CD 86 7D         [ 4] 3316         CALL     QSTAC   ;evaluate input, check stack
      00940F CD 8B E4         [ 4] 3317         CALL     BRAN
      009412 CD 93                 3318         .word    EVAL1
      009414 E1 CD 84         [ 4] 3319 EVAL2:  CALL     DROP
      009417 7A 93 FE         [ 2] 3320         JP       DOTOK
                                   3321 
                                   3322 ;       PRESET  ( -- )
                                   3323 ;       Reset data stack pointer and
                                   3324 ;       terminal input buffer.
      00941A CD 85                 3325         .word      LINK
                           0013A2  3326 LINK = . 
      00941C 55                    3327         .byte      6
      00941D CC 93 BB 93 F9 06     3328         .ascii     "PRESET"
      0013A9                       3329 PRESE:
      009423 50 52 45         [ 4] 3330         CALL     DOLIT
      009426 53 45                 3331         .word      SPP
      009428 54 04 CC         [ 4] 3332         CALL     SPSTO
      009429 CD 03 B0         [ 4] 3333         CALL     DOLIT
      009429 CD 84                 3334         .word      TIBB
      00942B 30 06 80         [ 4] 3335         CALL     NTIB
      00942E CD 85 4C         [ 4] 3336         CALL     CELLP
      009431 CD 84 30         [ 2] 3337         JP     STORE
                                   3338 
                                   3339 ;       QUIT    ( -- )
                                   3340 ;       Reset return stack pointer
                                   3341 ;       and start text interpreter.
      009434 07 00                 3342         .word      LINK
                           0013C1  3343 LINK = . 
      009436 CD                    3344         .byte      4
      009437 86 4A CD 8A           3345         .ascii     "QUIT"
      0013C6                       3346 QUIT:
      00943B 29 CC 84         [ 4] 3347         CALL     DOLIT
      00943E A1 94                 3348         .word      RPP
      009440 22 04 51         [ 4] 3349         CALL     RPSTO   ;reset return stack pointer
      009443 55 49 54         [ 4] 3350 QUIT1:  CALL     LBRAC   ;start interpretation
      009446 CD 12 8D         [ 4] 3351 QUIT2:  CALL     QUERY   ;get input
      009446 CD 84 30         [ 4] 3352         CALL     EVAL
      009449 07 FF            [ 2] 3353         JRA     QUIT2   ;continue till error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3354 
                                   3355 ;; The compiler
                                   3356 
                                   3357 ;       '       ( -- ca )
                                   3358 ;       Search vocabularies for
                                   3359 ;       next word in input stream.
      00944B CD 84                 3360         .word      LINK
                           0013DB  3361 LINK = . 
      00944D F3                    3362         .byte      1
      00944E CD                    3363         .ascii     "'"
      0013DD                       3364 TICK:
      00944F 93 AA CD         [ 4] 3365         CALL     TOKEN
      009452 93 0D CD         [ 4] 3366         CALL     NAMEQ   ;?defined
      009455 93 FE 20         [ 4] 3367         CALL     QBRAN
      009458 F8 94                 3368         .word      ABOR1
      00945A 41               [ 4] 3369         RET     ;yes, push code address
                                   3370 
                                   3371 ;       ALLOT   ( n -- )
                                   3372 ;       Allocate n bytes to RAM 
      00945B 01 27                 3373         .word      LINK
                           0013EB  3374         LINK = . 
      00945D 05                    3375         .byte      5
      00945D CD 91 38 CD 92        3376         .ascii     "ALLOT"
      0013F1                       3377 ALLOT:
      009462 35 CD 84         [ 4] 3378         CALL     VPP
                                   3379 ; must update APP_VP each time VP is modidied
      009465 63 93 49         [ 4] 3380         call PSTOR 
      009468 81 94 5B         [ 2] 3381         jp UPDATVP 
                                   3382 
                                   3383 ;       ,       ( w -- )
                                   3384 ;         Compile an integer into
                                   3385 ;         variable space.
      00946B 05 41                 3386         .word      LINK
                           0013FC  3387 LINK = . 
      00946D 4C                    3388         .byte      1
      00946E 4C                    3389         .ascii     ","
      0013FE                       3390 COMMA:
      00946F 4F 54 2E         [ 4] 3391         CALL     HERE
      009471 CD 04 DF         [ 4] 3392         CALL     DUPP
      009471 CD 86 AD         [ 4] 3393         CALL     CELLP   ;cell boundary
      009474 CD 8B 30         [ 4] 3394         CALL     VPP
      009477 CC 9B EB         [ 4] 3395         CALL     STORE
      00947A 94 6B 01         [ 2] 3396         JP     STORE
                                   3397 
                                   3398 ;       C,      ( c -- )
                                   3399 ;       Compile a byte into
                                   3400 ;       variables space.
      00947D 2C FC                 3401        .word      LINK
                           001412  3402 LINK = . 
      00947E 02                    3403         .byte      2
      00947E CD 8B                 3404         .ascii     "C,"
      001415                       3405 CCOMMA:
      009480 AE CD 85         [ 4] 3406         CALL     HERE
      009483 5F CD 8A         [ 4] 3407         CALL     DUPP
      009486 29 CD 86         [ 4] 3408         CALL     ONEP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      009489 AD CD 84         [ 4] 3409         CALL     VPP
      00948C A1 CC 84         [ 4] 3410         CALL     STORE
      00948F A1 94 7C         [ 2] 3411         JP     CSTOR
                                   3412 
                                   3413 ;       [COMPILE]       ( -- ; <string> )
                                   3414 ;       Compile next immediate
                                   3415 ;       word into code dictionary.
      009492 02 43                 3416         .word      LINK
                           001429  3417 LINK = . 
      009494 2C                    3418 	.byte      IMEDD+9
      009495 5B 43 4F 4D 50 49 4C  3419         .ascii     "[COMPILE]"
             45 5D
      001433                       3420 BCOMP:
      009495 CD 8B AE         [ 4] 3421         CALL     TICK
      009498 CD 85 5F         [ 2] 3422         JP     JSRC
                                   3423 
                                   3424 ;       COMPILE ( -- )
                                   3425 ;       Compile next jsr in
                                   3426 ;       colon list to code dictionary.
      00949B CD 8A                 3427         .word      LINK
                           00143B  3428 LINK = . 
      00949D 54                    3429 	.byte      COMPO+7
      00949E CD 86 AD CD 84 A1 CC  3430         .ascii     "COMPILE"
      001443                       3431 COMPI:
      0094A5 84 C5 94         [ 4] 3432         CALL     RFROM
      0094A8 92 89 5B         [ 4] 3433         CALL     DUPP
      0094AB 43 4F 4D         [ 4] 3434         CALL     AT
      0094AE 50 49 4C         [ 4] 3435         CALL     JSRC    ;compile subroutine
      0094B1 45 5D A9         [ 4] 3436         CALL     CELLP
      0094B3 90 93            [ 1] 3437         ldw y,x 
      0094B3 CD 94            [ 2] 3438         ldw y,(y)
      0094B5 5D CC 97         [ 2] 3439         addw x,#CELLL 
      0094B8 79 94            [ 2] 3440         jp (y)
                                   3441 
                                   3442 ;       LITERAL ( w -- )
                                   3443 ;       Compile tos to dictionary
                                   3444 ;       as an integer literal.
      0094BA A9 47                 3445         .word      LINK
                           00145D  3446 LINK = . 
      0094BC 43                    3447 	.byte      IMEDD+7
      0094BD 4F 4D 50 49 4C 45 4C  3448         .ascii     "LITERAL"
      0094C3                       3449 LITER:
      0094C3 CD 85 09         [ 4] 3450         CALL     COMPI
      0094C6 CD 85                 3451         .word DOLIT 
      0094C8 5F CD 84         [ 2] 3452         JP     COMMA
                                   3453 
                                   3454 ;       $,"     ( -- )
                                   3455 ;       Compile a literal string
                                   3456 ;       up to next " .
      0094CB B8 CD                 3457         .word      LINK
                           00146F  3458 LINK = . 
      0094CD 97                    3459         .byte      3
      0094CE 79 CD 8A              3460         .byte     '$',',','"'
      001473                       3461 STRCQ:
      0094D1 29 90 93         [ 4] 3462         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0094D4 90 FE                 3463         .word     34	; "
      0094D6 1C 00 02         [ 4] 3464         CALL     PARSE
      0094D9 90 FC 94         [ 4] 3465         CALL     HERE
      0094DC BB 87 4C         [ 4] 3466         CALL     PACKS   ;string to code dictionary
      0094DF 49 54 45         [ 4] 3467         CALL     COUNT
      0094E2 52 41 4C         [ 4] 3468         CALL     PLUS    ;calculate aligned end of string
      0094E5 CD 06 2D         [ 4] 3469         CALL     VPP
      0094E5 CD 94 C3         [ 2] 3470         JP     STORE
                                   3471 
                                   3472 ;; Structures
                                   3473 
                                   3474 ;       FOR     ( -- a )
                                   3475 ;       Start a FOR-NEXT loop
                                   3476 ;       structure in a colon definition.
      0094E8 84 30                 3477         .word      LINK
                           00148F  3478 LINK = . 
      0094EA CC                    3479 	.byte      IMEDD+3
      0094EB 94 7E 94              3480         .ascii     "FOR"
      001493                       3481 FOR:
      0094EE DD 03 24         [ 4] 3482         CALL     COMPI
      0094F1 2C 22                 3483         .word TOR 
      0094F3 CC 0B 2E         [ 2] 3484         JP     HERE
                                   3485 
                                   3486 ;       NEXT    ( a -- )
                                   3487 ;       Terminate a FOR-NEXT loop.
      0094F3 CD 84                 3488         .word      LINK
                           00149D  3489 LINK = . 
      0094F5 30                    3490 	.byte      IMEDD+4
      0094F6 00 22 CD 90           3491         .ascii     "NEXT"
      0014A2                       3492 NEXT:
      0094FA BB CD 8B         [ 4] 3493         CALL     COMPI
      0094FD AE CD                 3494         .word DONXT 
      0094FF 8C 6E CD         [ 4] 3495         call ADRADJ
      009502 8B 97 CD         [ 2] 3496         JP     COMMA
                                   3497 
                                   3498 ;       I ( -- n )
                                   3499 ;       stack FOR-NEXT COUNTER 
      009505 87 5A                 3500         .word LINK 
                           0014AF  3501         LINK=.
      009507 CD                    3502         .byte 1 
      009508 86                    3503         .ascii "I"
      0014B1                       3504 IFETCH: 
      009509 AD CC 84         [ 2] 3505         subw x,#CELLL 
      00950C A1 94            [ 2] 3506         ldw y,(3,sp)
      00950E EF               [ 2] 3507         ldw (x),y 
      00950F 83               [ 4] 3508         ret 
                                   3509 
                                   3510 ;       BEGIN   ( -- a )
                                   3511 ;       Start an infinite or
                                   3512 ;       indefinite loop structure.
      009510 46 4F                 3513         .word      LINK
                           0014BA  3514 LINK = . 
      009512 52                    3515 	.byte      IMEDD+5
      009513 42 45 47 49 4E        3516         .ascii     "BEGIN"
      0014C0                       3517 BEGIN:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009513 CD 94 C3         [ 2] 3518         JP     HERE
                                   3519 
                                   3520 ;       UNTIL   ( a -- )
                                   3521 ;       Terminate a BEGIN-UNTIL
                                   3522 ;       indefinite loop structure.
      009516 85 28                 3523         .word      LINK
                           0014C5  3524 LINK = . 
      009518 CC                    3525 	.byte      IMEDD+5
      009519 8B AE 95 0F 84        3526         .ascii     "UNTIL"
      0014CB                       3527 UNTIL:
      00951E 4E 45 58         [ 4] 3528         CALL     COMPI
      009521 54 E3                 3529         .word    QBRAN 
      009522 CD 06 79         [ 4] 3530         call ADRADJ
      009522 CD 94 C3         [ 2] 3531         JP     COMMA
                                   3532 
                                   3533 ;       AGAIN   ( a -- )
                                   3534 ;       Terminate a BEGIN-AGAIN
                                   3535 ;       infinite loop structure.
      009525 84 44                 3536         .word      LINK
                           0014D8  3537 LINK = . 
      009527 CD                    3538 	.byte      IMEDD+5
      009528 86 F9 CC 94 7E        3539         .ascii     "AGAIN"
      0014DE                       3540 AGAIN:
      00952D 95 1D 01         [ 4] 3541         CALL     COMPI
      009530 49 FA                 3542         .word BRAN
      009531 CD 06 79         [ 4] 3543         call ADRADJ 
      009531 1D 00 02         [ 2] 3544         JP     COMMA
                                   3545 
                                   3546 ;       IF      ( -- A )
                                   3547 ;       Begin a conditional branch.
      009534 16 03                 3548         .word      LINK
                           0014EB  3549 LINK = . 
      009536 FF                    3550 	.byte      IMEDD+2
      009537 81 95                 3551         .ascii     "IF"
      0014EE                       3552 IFF:
      009539 2F 85 42         [ 4] 3553         CALL     COMPI
      00953C 45 47                 3554         .word QBRAN
      00953E 49 4E 2E         [ 4] 3555         CALL     HERE
      009540 CD 0A 40         [ 4] 3556         CALL     ZERO
      009540 CC 8B AE         [ 2] 3557         JP     COMMA
                                   3558 
                                   3559 ;       THEN        ( A -- )
                                   3560 ;       Terminate a conditional branch structure.
      009543 95 3A                 3561         .word      LINK
                           0014FE  3562 LINK = . 
      009545 85                    3563 	.byte      IMEDD+4
      009546 55 4E 54 49           3564         .ascii     "THEN"
      001503                       3565 THENN:
      00954A 4C 0B 2E         [ 4] 3566         CALL     HERE
      00954B CD 06 79         [ 4] 3567         call ADRADJ 
      00954B CD 94 C3         [ 4] 3568         CALL     SWAPP
      00954E 84 63 CD         [ 2] 3569         JP     STORE
                                   3570 
                                   3571 ;       ELSE        ( A -- A )
                                   3572 ;       Start the false clause in an IF-ELSE-THEN structure.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009551 86 F9                 3573         .word      LINK
                           001511  3574 LINK = . 
      009553 CC                    3575 	.byte      IMEDD+4
      009554 94 7E 95 45           3576         .ascii     "ELSE"
      001516                       3577 ELSEE:
      009558 85 41 47         [ 4] 3578         CALL     COMPI
      00955B 41 49                 3579         .word BRAN
      00955D 4E 0B 2E         [ 4] 3580         CALL     HERE
      00955E CD 0A 40         [ 4] 3581         CALL     ZERO
      00955E CD 94 C3         [ 4] 3582         CALL     COMMA
      009561 84 7A CD         [ 4] 3583         CALL     SWAPP
      009564 86 F9 CC         [ 4] 3584         CALL     HERE
      009567 94 7E 95         [ 4] 3585         call ADRADJ 
      00956A 58 82 49         [ 4] 3586         CALL     SWAPP
      00956D 46 04 21         [ 2] 3587         JP     STORE
                                   3588 
                                   3589 ;       AHEAD       ( -- A )
                                   3590 ;       Compile a forward branch instruction.
      00956E 15 11                 3591         .word      LINK
                           001535  3592 LINK = . 
      00956E CD                    3593 	.byte      IMEDD+5
      00956F 94 C3 84 63 CD        3594         .ascii     "AHEAD"
      00153B                       3595 AHEAD:
      009574 8B AE CD         [ 4] 3596         CALL     COMPI
      009577 8A C0                 3597         .word BRAN
      009579 CC 94 7E         [ 4] 3598         CALL     HERE
      00957C 95 6B 84         [ 4] 3599         CALL     ZERO
      00957F 54 48 45         [ 2] 3600         JP     COMMA
                                   3601 
                                   3602 ;       WHILE       ( a -- A a )
                                   3603 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      009582 4E 35                 3604         .word      LINK
                           00154B  3605 LINK = . 
      009583 85                    3606 	.byte      IMEDD+5
      009583 CD 8B AE CD 86        3607         .ascii     "WHILE"
      001551                       3608 WHILE:
      009588 F9 CD 85         [ 4] 3609         CALL     COMPI
      00958B 6F CC                 3610         .word QBRAN
      00958D 84 A1 95         [ 4] 3611         CALL     HERE
      009590 7E 84 45         [ 4] 3612         CALL     ZERO
      009593 4C 53 45         [ 4] 3613         CALL     COMMA
      009596 CC 04 EF         [ 2] 3614         JP     SWAPP
                                   3615 
                                   3616 ;       REPEAT      ( A a -- )
                                   3617 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      009596 CD 94                 3618         .word      LINK
                           001564  3619 LINK = . 
      009598 C3                    3620         .byte      IMEDD+6
      009599 84 7A CD 8B AE CD     3621         .ascii     "REPEAT"
      00156B                       3622 REPEA:
      00959F 8A C0 CD         [ 4] 3623         CALL     COMPI
      0095A2 94 7E                 3624         .word BRAN
      0095A4 CD 85 6F         [ 4] 3625         call ADRADJ 
      0095A7 CD 8B AE         [ 4] 3626         CALL     COMMA
      0095AA CD 86 F9         [ 4] 3627         CALL     HERE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0095AD CD 85 6F         [ 4] 3628         call ADRADJ 
      0095B0 CC 84 A1         [ 4] 3629         CALL     SWAPP
      0095B3 95 91 85         [ 2] 3630         JP     STORE
                                   3631 
                                   3632 ;       AFT         ( a -- a A )
                                   3633 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      0095B6 41 48                 3634         .word      LINK
                           001584  3635 LINK = . 
      0095B8 45                    3636 	.byte      IMEDD+3
      0095B9 41 44 54              3637         .ascii     "AFT"
      0095BB                       3638 AFT:
      0095BB CD 94 C3         [ 4] 3639         CALL     DROP
      0095BE 84 7A CD         [ 4] 3640         CALL     AHEAD
      0095C1 8B AE CD         [ 4] 3641         CALL     HERE
      0095C4 8A C0 CC         [ 2] 3642         JP     SWAPP
                                   3643 
                                   3644 ;       ABORT"      ( -- ; <string> )
                                   3645 ;       Conditional abort with an error message.
      0095C7 94 7E                 3646         .word      LINK
                           001596  3647 LINK = . 
      0095C9 95                    3648 	.byte      IMEDD+6
      0095CA B5 85 57 48 49        3649         .ascii     "ABORT"
      0095CF 4C                    3650         .byte      '"'
      00159D                       3651 ABRTQ:
      0095D0 45 14 43         [ 4] 3652         CALL     COMPI
      0095D1 12 C1                 3653         .word ABORQ
      0095D1 CD 94 C3         [ 2] 3654         JP     STRCQ
                                   3655 
                                   3656 ;       $"     ( -- ; <string> )
                                   3657 ;       Compile an inline string literal.
      0095D4 84 63                 3658         .word      LINK
                           0015A7  3659 LINK = . 
      0095D6 CD                    3660 	.byte      IMEDD+2
      0095D7 8B AE                 3661         .byte     '$','"'
      0015AA                       3662 STRQ:
      0095D9 CD 8A C0         [ 4] 3663         CALL     COMPI
      0095DC CD 94                 3664         .word STRQP 
      0095DE 7E CC 85         [ 2] 3665         JP     STRCQ
                                   3666 
                                   3667 ;       ."          ( -- ; <string> )
                                   3668 ;       Compile an inline string literal to be typed out at run time.
      0095E1 6F 95                 3669         .word      LINK
                           0015B4  3670 LINK = . 
      0095E3 CB                    3671 	.byte      IMEDD+2
      0095E4 86 52                 3672         .byte     '.','"'
      0015B7                       3673 DOTQ:
      0095E6 45 50 45         [ 4] 3674         CALL     COMPI
      0095E9 41 54                 3675         .word DOTQP 
      0095EB CC 14 73         [ 2] 3676         JP     STRCQ
                                   3677 
                                   3678 ;; Name compiler
                                   3679 
                                   3680 ;       ?UNIQUE ( a -- a )
                                   3681 ;       Display a warning message
                                   3682 ;       if word already exists.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0095EB CD 94                 3683         .word      LINK
                           0015C1  3684 LINK = . 
      0095ED C3                    3685         .byte      7
      0095EE 84 7A CD 86 F9 CD 94  3686         .ascii     "?UNIQUE"
      0015C9                       3687 UNIQU:
      0095F5 7E CD 8B         [ 4] 3688         CALL     DUPP
      0095F8 AE CD 86         [ 4] 3689         CALL     NAMEQ   ;?name exists
      0095FB F9 CD 85         [ 4] 3690         CALL     QBRAN
      0095FE 6F CC                 3691         .word      UNIQ1
      009600 84 A1 95         [ 4] 3692         CALL     DOTQP   ;redef are OK
      009603 E4                    3693         .byte       7
      009604 83 41 46 54 65 66 20  3694         .ascii     " reDef "       
      009608 CD 05 09         [ 4] 3695         CALL     OVER
      009608 CD 85 55         [ 4] 3696         CALL     COUNT
      00960B CD 95 BB         [ 4] 3697         CALL     TYPES   ;just in case
      00960E CD 8B AE         [ 2] 3698 UNIQ1:  JP     DROP
                                   3699 
                                   3700 ;       $,n     ( na -- )
                                   3701 ;       Build a new dictionary name
                                   3702 ;       using string at na.
                                   3703 ; compile dans l'espace des variables 
      009611 CC 85                 3704         .word      LINK
                           0015ED  3705 LINK = . 
      009613 6F                    3706         .byte      3
      009614 96 04 86              3707         .ascii     "$,n"
      0015F1                       3708 SNAME:
      009617 41 42 4F         [ 4] 3709         CALL     DUPP
      00961A 52 54 22         [ 4] 3710         CALL     CAT     ;?null input
      00961D CD 03 E3         [ 4] 3711         CALL     QBRAN
      00961D CD 94                 3712         .word      PNAM1
      00961F C3 93 41         [ 4] 3713         CALL     UNIQU   ;?redefinition
      009622 CC 94 F3         [ 4] 3714         CALL     DUPP
      009625 96 16 82         [ 4] 3715         CALL     COUNT
      009628 24 22 DA         [ 4] 3716         CALL     PLUS
      00962A CD 06 2D         [ 4] 3717         CALL     VPP
      00962A CD 94 C3         [ 4] 3718         CALL     STORE
      00962D 8F 5B CC         [ 4] 3719         CALL     DUPP
      009630 94 F3 96         [ 4] 3720         CALL     LAST
      009633 27 82 2E         [ 4] 3721         CALL     STORE   ;save na for vocabulary link
      009636 22 09 B8         [ 4] 3722         CALL     CELLM   ;link address
      009637 CD 06 1F         [ 4] 3723         CALL     CNTXT
      009637 CD 94 C3         [ 4] 3724         CALL     AT
      00963A 8F 65 CC         [ 4] 3725         CALL     SWAPP
      00963D 94 F3 96         [ 4] 3726         CALL     STORE
      009640 34               [ 4] 3727         RET     ;save code pointer
      009641 07 3F 55         [ 4] 3728 PNAM1:  CALL     STRQP
      009644 4E                    3729         .byte      5
      009645 49 51 55 45 65        3730         .ascii     " name" ;null input
      009649 CC 12 C9         [ 2] 3731         JP     ABOR1
                                   3732 
                                   3733 ;; FORTH compiler
                                   3734 
                                   3735 ;       $COMPILE        ( a -- )
                                   3736 ;       Compile next word to
                                   3737 ;       dictionary as a token or literal.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009649 CD 85                 3738         .word      LINK
                           001635  3739 LINK = . 
      00964B 5F                    3740         .byte      8
      00964C CD 92 35 CD 84 63 96  3741         .ascii     "$COMPILE"
             68
      00163E                       3742 SCOMP:
      009654 CD 8F 65         [ 4] 3743         CALL     NAMEQ
      009657 07 20 72         [ 4] 3744         CALL     QDUP    ;?defined
      00965A 65 44 65         [ 4] 3745         CALL     QBRAN
      00965D 66 20                 3746         .word      SCOM2
      00965F CD 85 89         [ 4] 3747         CALL     AT
      009662 CD 8B 97         [ 4] 3748         CALL     DOLIT
      009665 CD 8F                 3749         .word     0x8000	;  IMEDD*256
      009667 08 CC 85         [ 4] 3750         CALL     ANDD    ;?immediate
      00966A 55 96 41         [ 4] 3751         CALL     QBRAN
      00966D 03 24                 3752         .word      SCOM1
      00966F 2C 6E 0A         [ 2] 3753         JP     EXECU
      009671 CC 16 F9         [ 2] 3754 SCOM1:  JP     JSRC
      009671 CD 85 5F         [ 4] 3755 SCOM2:  CALL     NUMBQ   ;try to convert to number
      009674 CD 84 D6         [ 4] 3756         CALL     QBRAN
      009677 CD 84                 3757         .word      ABOR1
      009679 63 96 A7         [ 2] 3758         JP     LITER
                                   3759 
                                   3760 ;       OVERT   ( -- )
                                   3761 ;       Link a new word into vocabulary.
      00967C CD 96                 3762         .word      LINK
                           00166C  3763 LINK = . 
      00967E 49                    3764         .byte      5
      00967F CD 85 5F CD 8B        3765         .ascii     "OVERT"
      001672                       3766 OVERT:
      009684 97 CD 87         [ 4] 3767         CALL     LAST
      009687 5A CD 86         [ 4] 3768         CALL     AT
      00968A AD CD 84         [ 4] 3769         CALL     CNTXT
      00968D A1 CD 85         [ 2] 3770         JP     STORE
                                   3771 
                                   3772 ;       ;       ( -- )
                                   3773 ;       Terminate a colon definition.
      009690 5F CD                 3774         .word      LINK
                           001680  3775 LINK = . 
      009692 86                    3776 	.byte      IMEDD+COMPO+1
      009693 CB                    3777         .ascii     ";"
      001682                       3778 SEMIS:
                           000001  3779 .if OPTIMIZE ; more compact and faster
      009694 CD 84 A1         [ 4] 3780         call DOLIT 
      009697 CD 8A                 3781         .word 0x81   ; opcode for RET 
      009699 38 CD 86         [ 4] 3782         call CCOMMA 
                           000000  3783 .else
                                   3784         CALL     COMPI
                                   3785         .word EXIT 
                                   3786 .endif 
      00969C 9F CD 84         [ 4] 3787         CALL     LBRAC
      00969F B8 CD 85         [ 4] 3788         call OVERT 
      0096A2 6F CD 84         [ 4] 3789         CALL FMOVE
      0096A5 A1 81 CD         [ 4] 3790         call QDUP 
      0096A8 8F 5B 05         [ 4] 3791         call QBRAN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0096AB 20 6E                 3792         .word SET_RAMLAST 
      0096AD 61 6D 65         [ 4] 3793         CALL UPDATPTR
      0096B0 CC               [ 4] 3794         RET 
                                   3795 
                                   3796 
                                   3797 ;       Terminate an ISR definition 
                                   3798 ;       retourn ca of ISR as double
                                   3799 ;       I; ( -- ud )
      0096B1 93 49                 3800         .word LINK 
                           0016A1  3801         LINK=.
      0096B3 96                    3802         .byte 2+IMEDD+COMPO 
      0096B4 6D 08                 3803         .ascii "I;" 
      0016A4                       3804 ISEMI:
      0096B6 24 43 4F         [ 2] 3805         subw x,#CELLL  
      0096B9 4D 50 49 4C      [ 2] 3806         ldw y,#IRET_CODE 
      0096BD 45               [ 2] 3807         ldw (x),y 
      0096BE CD 14 15         [ 4] 3808         call CCOMMA
      0096BE CD 92 35         [ 4] 3809         call LBRAC 
      0096C1 CD 87 09         [ 4] 3810         call IFMOVE
      0096C4 CD 84 63         [ 4] 3811         call QDUP 
      0096C7 96 DF CD         [ 4] 3812         CALL QBRAN 
      0096CA 84 B8                 3813         .word SET_RAMLAST
      0096CC CD 84 30         [ 4] 3814         CALL CPP
      0096CF 80 00 CD         [ 4] 3815         call AT 
      0096D2 85 AB CD         [ 4] 3816         call SWAPP 
      0096D5 84 63 96         [ 4] 3817         CALL CPP 
      0096D8 DC CC 84         [ 4] 3818         call STORE 
      0096DB 8A CC 97         [ 4] 3819         call UPDATCP 
      0096DE 79 CD 8D         [ 4] 3820         call EEPVP 
      0096E1 D3 CD 84         [ 4] 3821         call DROP 
      0096E4 63 93 49         [ 4] 3822         call AT 
      0096E7 CC 94 E5         [ 4] 3823         call VPP 
      0096EA 96 B5 05         [ 4] 3824         call STORE 
      0096ED 4F 56 45         [ 2] 3825         jp ZERO
      0096F0 52               [ 4] 3826         ret           
                                   3827         
                                   3828 
                                   3829 ;       ]       ( -- )
                                   3830 ;       Start compiling words in
                                   3831 ;       input stream.
      0096F1 54 A1                 3832         .word      LINK
                           0016E4  3833 LINK = . 
      0096F2 01                    3834         .byte      1
      0096F2 CD                    3835         .ascii     "]"
      0016E6                       3836 RBRAC:
      0096F3 86 CB CD         [ 4] 3837         CALL   DOLIT
      0096F6 84 B8                 3838         .word  SCOMP
      0096F8 CD 86 9F         [ 4] 3839         CALL   TEVAL
      0096FB CC 84 A1         [ 2] 3840         JP     STORE
                                   3841 
                                   3842 ;       CALL,    ( ca -- )
                                   3843 ;       Compile a subroutine call.
      0096FE 96 EC                 3844         .word      LINK
                           0016F3  3845 LINK = . 
      009700 C1                    3846         .byte      5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      009701 3B 41 4C 4C 2C        3847         .ascii     "CALL,"
      009702                       3848 JSRC:
      009702 CD 84 30         [ 4] 3849         CALL     DOLIT
      009705 00 81                 3850         .word     CALLL     ;CALL
      009707 CD 94 95         [ 4] 3851         CALL     CCOMMA
      00970A CD 93 AA         [ 2] 3852         JP     COMMA
                                   3853 
                                   3854 ;       INIT-OFS ( -- )
                                   3855 ;       compute offset to adjust jump address 
                                   3856 ;       set variable OFFSET 
      00970D CD 96                 3857         .word LINK 
                           001706  3858         LINK=.
      00970F F2                    3859         .byte 8 
      009710 CD A0 29 CD 87 09 CD  3860         .ascii "INIT-OFS" 
             84
      00170F                       3861 INITOFS:
      009718 63 98 49         [ 4] 3862         call TFLASH 
      00971B CD A0 B1         [ 4] 3863         CALL AT 
      00971E 81 97 00         [ 4] 3864         CALL DUPP 
      009721 C2 49 3B         [ 4] 3865         call QBRAN
      009724 17 2C                 3866         .word 1$
      009724 1D 00 02         [ 4] 3867         call DROP  
      009727 90 AE 00         [ 4] 3868         call CPP 
      00972A 80 FF CD         [ 4] 3869         call AT 
      00972D 94 95 CD         [ 4] 3870         call HERE
      009730 93 AA CD         [ 4] 3871         call SUBB 
      009733 A0 F0 CD         [ 4] 3872 1$:     call OFFSET 
      009736 87 09 CD         [ 2] 3873         jp STORE  
                                   3874 
                                   3875 ;       :       ( -- ; <string> )
                                   3876 ;       Start a new colon definition
                                   3877 ;       using next word as its name.
      009739 84 63                 3878         .word      LINK
                           001734  3879 LINK = . 
      00973B 98                    3880         .byte      1
      00973C 49                    3881         .ascii     ":"
      001736                       3882 COLON:
      00973D CD 86 BB         [ 4] 3883         call INITOFS       
      009740 CD 84 B8         [ 4] 3884         CALL   TOKEN
      009743 CD 85 6F         [ 4] 3885         CALL   SNAME
      009746 CD 86 BB         [ 2] 3886         JP     RBRAC
                                   3887 
                                   3888 ;       I:  ( -- )
                                   3889 ;       Start interrupt service routine definition
                                   3890 ;       those definition have no name.
      009749 CD 84                 3891         .word LINK
                           001744  3892         LINK=.
      00974B A1                    3893         .byte 2 
      00974C CD 9B                 3894         .ascii "I:" 
      001747                       3895 ICOLON:
      00974E D4 CD 9B         [ 4] 3896         call INITOFS 
      009751 95 CD 85         [ 2] 3897         jp RBRAC  
                                   3898 
                                   3899 ;       IMMEDIATE       ( -- )
                                   3900 ;       Make last compiled word
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3901 ;       an immediate word.
      009754 55 CD                 3902         .word      LINK
                           00174F  3903 LINK = . 
      009756 84                    3904         .byte      9
      009757 B8 CD 86 AD CD 84 A1  3905         .ascii     "IMMEDIATE"
             CC 8A
      001759                       3906 IMMED:
      009760 C0 81 97         [ 4] 3907         CALL     DOLIT
      009763 21 01                 3908         .word     0x8000	;  IMEDD*256
      009765 5D 06 4B         [ 4] 3909         CALL     LAST
      009766 CD 04 38         [ 4] 3910         CALL     AT
      009766 CD 84 30         [ 4] 3911         CALL     AT
      009769 96 BE CD         [ 4] 3912         CALL     ORR
      00976C 86 7D CC         [ 4] 3913         CALL     LAST
      00976F 84 A1 97         [ 4] 3914         CALL     AT
      009772 64 05 43         [ 2] 3915         JP     STORE
                                   3916 
                                   3917 ;; Defining words
                                   3918 
                                   3919 ;       CREATE  ( -- ; <string> )
                                   3920 ;       Compile a new array
                                   3921 ;       without allocating space.
      009775 41 4C                 3922         .word      LINK
                           001775  3923 LINK = . 
      009777 4C                    3924         .byte      6
      009778 2C 52 45 41 54 45     3925         .ascii     "CREATE"
      009779                       3926 CREAT:
      009779 CD 84 30         [ 4] 3927         CALL     TOKEN
      00977C 00 CD CD         [ 4] 3928         CALL     SNAME
      00977F 94 95 CC         [ 4] 3929         CALL     OVERT        
      009782 94 7E 97         [ 4] 3930         CALL     COMPI 
      009785 73 08                 3931         .word DOVAR 
      009787 49               [ 4] 3932         RET
                                   3933 
                                   3934 ;       VARIABLE        ( -- ; <string> )
                                   3935 ;       Compile a new variable
                                   3936 ;       initialized to 0.
      009788 4E 49                 3937         .word      LINK
                           00178D  3938 LINK = . 
      00978A 54                    3939         .byte      8
      00978B 2D 4F 46 53 41 42 4C  3940         .ascii     "VARIABLE"
             45
      00978F                       3941 VARIA:
                                   3942 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      00978F CD 86 6C         [ 4] 3943         CALL HERE
      009792 CD 84 B8         [ 4] 3944         CALL DUPP 
      009795 CD 85 5F         [ 4] 3945         CALL CELLP
      009798 CD 84 63         [ 4] 3946         CALL VPP 
      00979B 97 AC CD         [ 4] 3947         CALL STORE
      00979E 85 55 CD         [ 4] 3948         CALL CREAT
      0097A1 86 BB CD         [ 4] 3949         CALL DUPP
      0097A4 84 B8 CD         [ 4] 3950         CALL COMMA
      0097A7 8B AE CD         [ 4] 3951         CALL ZERO
      0097AA 87 D3 CD         [ 4] 3952         call SWAPP 
      0097AD 86 F0 CC         [ 4] 3953         CALL STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0097B0 84 A1 97         [ 4] 3954         CALL FMOVE ; move definition to FLASH
      0097B3 86 01 3A         [ 4] 3955         CALL QDUP 
      0097B6 CD 03 E3         [ 4] 3956         CALL QBRAN 
      0097B6 CD 97                 3957         .word SET_RAMLAST   
      0097B8 8F CD 91         [ 4] 3958         call UPDATVP  ; don't update if variable kept in RAM.
      0097BB 38 CD 96         [ 4] 3959         CALL UPDATPTR
      0097BE 71               [ 4] 3960         RET         
      0017C9                       3961 SET_RAMLAST: 
      0097BF CC 97 66         [ 4] 3962         CALL LAST 
      0097C2 97 B4 02         [ 4] 3963         CALL AT 
      0097C5 49 3A 5E         [ 4] 3964         CALL RAMLAST 
      0097C7 CC 04 21         [ 2] 3965         jp STORE  
                                   3966 
                                   3967 
                                   3968 ;       CONSTANT  ( n -- ; <string> )
                                   3969 ;       Compile a new constant 
                                   3970 ;       n CONSTANT name 
      0097C7 CD 97                 3971         .word LINK 
                           0017D7  3972         LINK=. 
      0097C9 8F                    3973         .byte 8 
      0097CA CC 97 66 97 C4 09 49  3974         .ascii "CONSTANT" 
             4D
      0017E0                       3975 CONSTANT:          
      0097D2 4D 45 44         [ 4] 3976         CALL TOKEN
      0097D5 49 41 54         [ 4] 3977         CALL SNAME 
      0097D8 45 16 72         [ 4] 3978         CALL OVERT 
      0097D9 CD 14 43         [ 4] 3979         CALL COMPI 
      0097D9 CD 84                 3980         .word DOCONST
      0097DB 30 80 00         [ 4] 3981         CALL COMMA 
      0097DE CD 86 CB         [ 4] 3982         CALL FMOVE
      0097E1 CD 84 B8         [ 4] 3983         CALL QDUP 
      0097E4 CD 84 B8         [ 4] 3984         CALL QBRAN 
      0097E7 CD 85                 3985         .word SET_RAMLAST  
      0097E9 BF CD 86         [ 4] 3986         CALL UPDATPTR  
      0097EC CB               [ 4] 3987 1$:     RET          
                                   3988 
                                   3989 ; CONSTANT runtime semantic 
                                   3990 ; doCONST  ( -- n )
      0097ED CD 84                 3991         .word LINK 
                           001802  3992         LINK=.
      0097EF B8                    3993         .byte 7
      0097F0 CC 84 A1 97 CF 06 43  3994         .ascii "DOCONST"
      00180A                       3995 DOCONST:
      0097F7 52 45 41         [ 2] 3996         subw x,#CELLL
      0097FA 54 45            [ 2] 3997         popw y 
      0097FC 90 FE            [ 2] 3998         ldw y,(y) 
      0097FC CD               [ 2] 3999         ldw (x),y 
      0097FD 91               [ 4] 4000         ret 
                                   4001 
                                   4002 
                                   4003 ;; Tools
                                   4004 
                                   4005 ;       _TYPE   ( b u -- )
                                   4006 ;       Display a string. Filter
                                   4007 ;       non-printing characters.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0097FE 38 CD                 4008         .word      LINK
                           001815  4009 LINK = . 
      009800 96                    4010         .byte      5
      009801 71 CD 96 F2 CD        4011         .ascii     "_TYPE"
      00181B                       4012 UTYPE:
      009806 94 C3 86         [ 4] 4013         CALL     TOR     ;start count down loop
      009809 0C 81            [ 2] 4014         JRA     UTYP2   ;skip first pass
      00980B 97 F5 08         [ 4] 4015 UTYP1:  CALL     DUPP
      00980E 56 41 52         [ 4] 4016         CALL     CAT
      009811 49 41 42         [ 4] 4017         CALL     TCHAR
      009814 4C 45 9A         [ 4] 4018         CALL     EMIT    ;display only printable
      009816 CD 09 D4         [ 4] 4019         CALL     ONEP    ;increment address
      009816 CD 8B AE         [ 4] 4020 UTYP2:  CALL     DONXT
      009819 CD 85                 4021         .word      UTYP1   ;loop till done
      00981B 5F CD 8A         [ 2] 4022         JP     DROP
                                   4023 
                                   4024 ;       dm+     ( a u -- a )
                                   4025 ;       Dump u bytes from ,
                                   4026 ;       leaving a+u on  stack.
      00981E 29 CD                 4027         .word      LINK
                           001839  4028 LINK = . 
      009820 86                    4029         .byte      3
      009821 AD CD 84              4030         .ascii     "dm+"
      00183D                       4031 DUMPP:
      009824 A1 CD 97         [ 4] 4032         CALL     OVER
      009827 FC CD 85         [ 4] 4033         CALL     DOLIT
      00982A 5F CD                 4034         .word      4
      00982C 94 7E CD         [ 4] 4035         CALL     UDOTR   ;display address
      00982F 8A C0 CD         [ 4] 4036         CALL     SPACE
      009832 85 6F CD         [ 4] 4037         CALL     TOR     ;start count down loop
      009835 84 A1            [ 2] 4038         JRA     PDUM2   ;skip first pass
      009837 CD A0 29         [ 4] 4039 PDUM1:  CALL     DUPP
      00983A CD 87 09         [ 4] 4040         CALL     CAT
      00983D CD 84 63         [ 4] 4041         CALL     DOLIT
      009840 98 49                 4042         .word      3
      009842 CD 9B EB         [ 4] 4043         CALL     UDOTR   ;display numeric data
      009845 CD A0 B1         [ 4] 4044         CALL     ONEP    ;increment address
      009848 81 03 C4         [ 4] 4045 PDUM2:  CALL     DONXT
      009849 18 50                 4046         .word      PDUM1   ;loop till done
      009849 CD               [ 4] 4047         RET
                                   4048 
                                   4049 ;       DUMP    ( a u -- )
                                   4050 ;       Dump u bytes from a,
                                   4051 ;       in a formatted manner.
      00984A 86 CB                 4052         .word      LINK
                           001869  4053 LINK = . 
      00984C CD                    4054         .byte      4
      00984D 84 B8 CD 86           4055         .ascii     "DUMP"
      00186E                       4056 DUMP:
      009851 DE CC 84         [ 4] 4057         CALL     BASE
      009854 A1 98 0D         [ 4] 4058         CALL     AT
      009857 08 43 4F         [ 4] 4059         CALL     TOR
      00985A 4E 53 54         [ 4] 4060         CALL     HEX     ;save radix, set hex
      00985D 41 4E 54         [ 4] 4061         CALL     DOLIT
      009860 00 10                 4062         .word      16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009860 CD 91 38         [ 4] 4063         CALL     SLASH   ;change count to lines
      009863 CD 96 71         [ 4] 4064         CALL     TOR     ;start count down loop
      009866 CD 96 F2         [ 4] 4065 DUMP1:  CALL     CR
      009869 CD 94 C3         [ 4] 4066         CALL     DOLIT
      00986C 98 8A                 4067         .word      16
      00986E CD 94 7E         [ 4] 4068         CALL     DDUP
      009871 CD A0 29         [ 4] 4069         CALL     DUMPP   ;display numeric
      009874 CD 87 09         [ 4] 4070         CALL     ROT
      009877 CD 84 63         [ 4] 4071         CALL     ROT
      00987A 98 49 CD         [ 4] 4072         CALL     SPACE
      00987D A0 B1 81         [ 4] 4073         CALL     SPACE
      009880 98 57 07         [ 4] 4074         CALL     UTYPE   ;display printable characters
      009883 44 4F 43         [ 4] 4075         CALL     DONXT
      009886 4F 4E                 4076         .word      DUMP1   ;loop till done
      009888 53 54 D5         [ 4] 4077 DUMP3:  CALL     DROP
      00988A CD 04 89         [ 4] 4078         CALL     RFROM
      00988A 1D 00 02         [ 4] 4079         CALL     BASE
      00988D 90 85 90         [ 2] 4080         JP     STORE   ;restore radix
                                   4081 
                                   4082 ;       .S      ( ... -- ... )
                                   4083 ;        Display  contents of stack.
      009890 FE FF                 4084         .word      LINK
                           0018B5  4085 LINK = . 
      009892 81                    4086         .byte      2
      009893 98 82                 4087         .ascii     ".S"
      0018B8                       4088 DOTS:
      009895 05 5F 54         [ 4] 4089         CALL     CR
      009898 59 50 45         [ 4] 4090         CALL     DEPTH   ;stack depth
      00989B CD 04 A8         [ 4] 4091         CALL     TOR     ;start count down loop
      00989B CD 85            [ 2] 4092         JRA     DOTS2   ;skip first pass
      00989D 28 20 0F         [ 4] 4093 DOTS1:  CALL     RAT
      0098A0 CD 85 5F         [ 4] 4094 	CALL     PICK
      0098A3 CD 84 D6         [ 4] 4095         CALL     DOT     ;index stack, display contents
      0098A6 CD 8A EA         [ 4] 4096 DOTS2:  CALL     DONXT
      0098A9 CD 84                 4097         .word      DOTS1   ;loop till done
      0098AB 1A CD 8A         [ 4] 4098         CALL     DOTQP
      0098AE 54                    4099         .byte      5
      0098AF CD 84 44 98 A0        4100         .ascii     " <sp "
      0098B4 CC               [ 4] 4101         RET
                                   4102 
                                   4103 ;       >NAME   ( ca -- na | F )
                                   4104 ;       Convert code address
                                   4105 ;       to a name address.
      0098B5 85 55                 4106         .word      LINK
                           0018DD  4107 LINK = . 
      0098B7 98                    4108         .byte      5
      0098B8 95 03 64 6D 2B        4109         .ascii     ">NAME"
      0098BD                       4110 TNAME:
      0098BD CD 85 89         [ 4] 4111         CALL     CNTXT   ;vocabulary link
      0098C0 CD 84 30         [ 4] 4112 TNAM2:  CALL     AT
      0098C3 00 04 CD         [ 4] 4113         CALL     DUPP    ;?last word in a vocabulary
      0098C6 8F 8E CD         [ 4] 4114         CALL     QBRAN
      0098C9 8E DE                 4115         .word      TNAM4
      0098CB CD 85 28         [ 4] 4116         CALL     DDUP
      0098CE 20 11 CD         [ 4] 4117         CALL     NAMET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0098D1 85 5F CD         [ 4] 4118         CALL     XORR    ;compare
      0098D4 84 D6 CD         [ 4] 4119         CALL     QBRAN
      0098D7 84 30                 4120         .word      TNAM3
      0098D9 00 03 CD         [ 4] 4121         CALL     CELLM   ;continue with next word
      0098DC 8F 8E            [ 2] 4122         JRA     TNAM2
      0098DE CD 8A 54         [ 4] 4123 TNAM3:  CALL     SWAPP
      0098E1 CD 84 44         [ 2] 4124         JP     DROP
      0098E4 98 D0 81         [ 4] 4125 TNAM4:  CALL     DDROP
      0098E7 98 B9 04         [ 2] 4126         JP     ZERO
                                   4127 
                                   4128 ;       .ID     ( na -- )
                                   4129 ;        Display  name at address.
      0098EA 44 55                 4130         .word      LINK
                           001912  4131 LINK = . 
      0098EC 4D                    4132         .byte      3
      0098ED 50 49 44              4133         .ascii     ".ID"
      0098EE                       4134 DOTID:
      0098EE CD 86 1C         [ 4] 4135         CALL     QDUP    ;if zero no name
      0098F1 CD 84 B8         [ 4] 4136         CALL     QBRAN
      0098F4 CD 85                 4137         .word      DOTI1
      0098F6 28 CD 8D         [ 4] 4138         CALL     COUNT
      0098F9 66 CD 84         [ 4] 4139         CALL     DOLIT
      0098FC 30 00                 4140         .word      0x1F
      0098FE 10 CD 89         [ 4] 4141         CALL     ANDD    ;mask lexicon bits
      009901 7A CD 85         [ 2] 4142         JP     UTYPE
      009904 28 CD 8F         [ 4] 4143 DOTI1:  CALL     DOTQP
      009907 26                    4144         .byte      9
      009908 CD 84 30 00 10 CD 87  4145         .ascii     " noName"
      00990F 45               [ 4] 4146         RET
                                   4147 
                           000000  4148 WANT_SEE=0
                           000000  4149 .if WANT_SEE 
                                   4150 ;       SEE     ( -- ; <string> )
                                   4151 ;       A simple decompiler.
                                   4152 ;       Updated for byte machines.
                                   4153         .word      LINK
                                   4154 LINK = . 
                                   4155         .byte      3
                                   4156         .ascii     "SEE"
                                   4157 SEE:
                                   4158         CALL     TICK    ;starting address
                                   4159         CALL     CR
                                   4160         CALL     ONEM
                                   4161 SEE1:   CALL     ONEP
                                   4162         CALL     DUPP
                                   4163         CALL     AT
                                   4164         CALL     DUPP
                                   4165         CALL     QBRAN
                                   4166         .word    SEE2
                                   4167         CALL     TNAME   ;?is it a name
                                   4168 SEE2:   CALL     QDUP    ;name address or zero
                                   4169         CALL     QBRAN
                                   4170         .word    SEE3
                                   4171         CALL     SPACE
                                   4172         CALL     DOTID   ;display name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4173         CALL     ONEP
                                   4174         JRA      SEE4
                                   4175 SEE3:   CALL     DUPP
                                   4176         CALL     CAT
                                   4177         CALL     UDOT    ;display number
                                   4178 SEE4:   CALL     NUFQ    ;user control
                                   4179         CALL     QBRAN
                                   4180         .word    SEE1
                                   4181         JP     DROP
                                   4182 .endif ; WANT_SEE 
                                   4183 
                                   4184 ;       WORDS   ( -- )
                                   4185 ;       Display names in vocabulary.
      009910 CD 98                 4186         .word      LINK
                           00193A  4187 LINK = . 
      009912 BD                    4188         .byte      5
      009913 CD 87 1A CD 87        4189         .ascii     "WORDS"
      001940                       4190 WORDS:
      009918 1A CD 8E         [ 4] 4191         CALL     CR
      00991B DE CD 8E         [ 4] 4192         CALL     CNTXT   ;only in context
      00991E DE CD 98         [ 4] 4193 WORS1:  CALL     AT
      009921 9B CD 84         [ 4] 4194         CALL     QDUP    ;?at end of list
      009924 44 99 05         [ 4] 4195         CALL     QBRAN
      009927 CD 85                 4196         .word      WORS2
      009929 55 CD 85         [ 4] 4197         CALL     DUPP
      00992C 09 CD 86         [ 4] 4198         CALL     SPACE
      00992F 1C CC 84         [ 4] 4199         CALL     DOTID   ;display a name
      009932 A1 98 E9         [ 4] 4200         CALL     CELLM
      009935 02 2E 53         [ 4] 4201         CALL     BRAN
      009938 19 46                 4202         .word      WORS1
      009938 CD               [ 4] 4203 WORS2:  RET
                                   4204 
                                   4205         
                                   4206 ;; Hardware reset
                                   4207 
                                   4208 ;       hi      ( -- )
                                   4209 ;       Display sign-on message.
      009939 8F 26                 4210         .word      LINK
                           001965  4211 LINK = . 
      00993B CD                    4212         .byte      2
      00993C 8B 02                 4213         .ascii     "hi"
      001968                       4214 HI:
      00993E CD 85 28         [ 4] 4215         CALL     CR
      009941 20 09 CD         [ 4] 4216         CALL     DOTQP   ;initialize I/O
      009944 85                    4217         .byte      15
      009945 1C CD 8B 19 CD 8F C1  4218         .ascii     "stm8eForth v"
             CD 84 44 99 43
      009951 CD                    4219 	.byte      VER+'0'
      009952 8F                    4220         .byte      '.' 
      009953 65                    4221 	.byte      EXT+'0' ;version
      009954 05 20 3C         [ 2] 4222         JP     CR
                                   4223 
                           000000  4224 WANT_DEBUG=0
                           000000  4225 .if WANT_DEBUG 
                                   4226 ;       DEBUG      ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4227 ;       Display sign-on message.
                                   4228 ;        .word      LINK
                                   4229 LINK = . 
                                   4230         .byte      5
                                   4231         .ascii     "DEBUG"
                                   4232 DEBUG:
                                   4233 	CALL DOLIT
                                   4234 	.word 0x65
                                   4235 	CALL EMIT
                                   4236 	CALL DOLIT
                                   4237 	.word 0
                                   4238  	CALL ZLESS 
                                   4239 	CALL DOLIT
                                   4240 	.word 0xFFFE
                                   4241 	CALL ZLESS 
                                   4242 	CALL UPLUS 
                                   4243  	CALL DROP 
                                   4244 	CALL DOLIT
                                   4245 	.word 3
                                   4246 	CALL UPLUS 
                                   4247 	CALL UPLUS 
                                   4248  	CALL DROP
                                   4249 	CALL DOLIT
                                   4250 	.word 0x43
                                   4251 	CALL UPLUS 
                                   4252  	CALL DROP
                                   4253 	CALL EMIT
                                   4254 	CALL DOLIT
                                   4255 	.word 0x4F
                                   4256 	CALL DOLIT
                                   4257 	.word 0x6F
                                   4258  	CALL XORR
                                   4259 	CALL DOLIT
                                   4260 	.word 0xF0
                                   4261  	CALL ANDD
                                   4262 	CALL DOLIT
                                   4263 	.word 0x4F
                                   4264  	CALL ORR
                                   4265 	CALL EMIT
                                   4266 	CALL DOLIT
                                   4267 	.word 8
                                   4268 	CALL DOLIT
                                   4269 	.word 6
                                   4270  	CALL SWAPP
                                   4271 	CALL OVER
                                   4272 	CALL XORR
                                   4273 	CALL DOLIT
                                   4274 	.word 3
                                   4275 	CALL ANDD 
                                   4276 	CALL ANDD
                                   4277 	CALL DOLIT
                                   4278 	.word 0x70
                                   4279 	CALL UPLUS 
                                   4280 	CALL DROP
                                   4281 	CALL EMIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4282 	CALL DOLIT
                                   4283 	.word 0
                                   4284 	CALL QBRAN
                                   4285 	.word DEBUG1
                                   4286 	CALL DOLIT
                                   4287 	.word 0x3F
                                   4288 DEBUG1:
                                   4289 	CALL DOLIT
                                   4290 	.word 0xFFFF
                                   4291 	CALL QBRAN
                                   4292 	.word DEBUG2
                                   4293 	CALL DOLIT
                                   4294 	.word 0x74
                                   4295 	CALL BRAN
                                   4296 	.word DEBUG3
                                   4297 DEBUG2:
                                   4298 	CALL DOLIT
                                   4299 	.word 0x21
                                   4300 DEBUG3:
                                   4301 	CALL EMIT
                                   4302 	CALL DOLIT
                                   4303 	.word 0x68
                                   4304 	CALL DOLIT
                                   4305 	.word 0x80
                                   4306 	CALL STORE
                                   4307 	CALL DOLIT
                                   4308 	.word 0x80
                                   4309 	CALL AT
                                   4310 	CALL EMIT
                                   4311 	CALL DOLIT
                                   4312 	.word 0x4D
                                   4313 	CALL TOR
                                   4314 	CALL RAT
                                   4315 	CALL RFROM
                                   4316 	CALL ANDD
                                   4317 	CALL EMIT
                                   4318 	CALL DOLIT
                                   4319 	.word 0x61
                                   4320 	CALL DOLIT
                                   4321 	.word 0xA
                                   4322 	CALL TOR
                                   4323 DEBUG4:
                                   4324 	CALL DOLIT
                                   4325 	.word 1
                                   4326 	CALL UPLUS 
                                   4327 	CALL DROP
                                   4328 	CALL DONXT
                                   4329 	.word DEBUG4
                                   4330 	CALL EMIT
                                   4331 	CALL DOLIT
                                   4332 	.word 0x656D
                                   4333 	CALL DOLIT
                                   4334 	.word 0x100
                                   4335 	CALL UMSTA
                                   4336 	CALL SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4337 	CALL DOLIT
                                   4338 	.word 0x100
                                   4339 	CALL UMSTA
                                   4340 	CALL SWAPP 
                                   4341 	CALL DROP
                                   4342 	CALL EMIT
                                   4343 	CALL EMIT
                                   4344 	CALL DOLIT
                                   4345 	.word 0x2043
                                   4346 	CALL DOLIT
                                   4347 	.word 0
                                   4348 	CALL DOLIT
                                   4349 	.word 0x100
                                   4350 	CALL UMMOD
                                   4351 	CALL EMIT
                                   4352 	CALL EMIT
                                   4353 	;JP ORIG
                                   4354 	RET
                                   4355 .endif ; WANT_DEBUG 
                                   4356 
                                   4357 
                                   4358 ;       'BOOT   ( -- a )
                                   4359 ;       The application startup vector.
      009957 73 70                 4360         .word      LINK
                           001983  4361 LINK = . 
      009959 20                    4362         .byte      5
      00995A 81 99 35 05 3E        4363         .ascii     "'BOOT"
      001989                       4364 TBOOT:
      00995F 4E 41 4D         [ 4] 4365         CALL     DOVAR
      009962 45 02                 4366         .word    APP_RUN      ;application to boot
                                   4367 
                                   4368 ;       COLD    ( -- )
                                   4369 ;       The hilevel cold start s=ence.
      009963 19 83                 4370         .word      LINK
                           001990  4371         LINK = . 
      009963 CD                    4372         .byte      4
      009964 86 9F CD 84           4373         .ascii     "COLD"
      001995                       4374 COLD:
                           000000  4375 .if WANT_DEBUG
                                   4376         CALL DEBUG
                                   4377 .endif ; WANT_DEBUG
      009968 B8 CD 85         [ 4] 4378 COLD1:  CALL     DOLIT
      00996B 5F CD                 4379         .word      UZERO
      00996D 84 63 99         [ 4] 4380 	CALL     DOLIT
      009970 8A CD                 4381         .word      UPP
      009972 87 45 CD         [ 4] 4382         CALL     DOLIT
      009975 91 46                 4383 	.word      UEND-UZERO
      009977 CD 85 D4         [ 4] 4384         CALL     CMOVE   ;initialize user area
                                   4385 
                                   4386 ; if APP_RUN==0 initialize with ca de 'hi'  
      00997A CD 84 63 99      [ 2] 4387         ldw y,APP_RUN 
      00997E 84 CD            [ 1] 4388         jrne 0$
      009980 8A 38 20         [ 2] 4389         subw x,#CELLL 
      009983 E2 CD 85 6F      [ 2] 4390         ldw y,#HI  
      009987 CC               [ 2] 4391         ldw (x),y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009988 85 55 CD         [ 4] 4392         call UPDATRUN 
      0019B8                       4393 0$:        
                                   4394 ; update LAST with APP_LAST 
                                   4395 ; if APP_LAST > LAST else do the opposite
      00998B 87 3A CC 8A      [ 2] 4396         ldw y,APP_LAST 
      00998F C0 99 5D         [ 2] 4397         cpw y,ULAST 
      009992 03 2E            [ 1] 4398         jrugt 1$ 
                                   4399 ; save LAST at APP_LAST  
      009994 49 44 2B         [ 4] 4400         call UPDATLAST 
      009996 20 06            [ 2] 4401         jra 2$
      0019C6                       4402 1$: ; update LAST with APP_LAST 
      009996 CD 87 09         [ 2] 4403         ldw ULAST,y
      009999 CD 84 63         [ 2] 4404         ldw UCNTXT,y
      0019CC                       4405 2$:  
                                   4406 ; update APP_CP if < app_space 
      00999C 99 AC CD 8B      [ 2] 4407         ldw y,APP_CP  
      0099A0 97 CD 84         [ 2] 4408         cpw y,UCP   
      0099A3 30 00            [ 1] 4409         jruge 3$ 
      0099A5 1F CD 85         [ 4] 4410         call UPDATCP
      0099A8 AB CC 98         [ 2] 4411         ldw y,UCP   
      0019DB                       4412 3$:
      0099AB 9B CD 8F         [ 2] 4413         ldw UCP,y                 
                                   4414 ; update UVP with APP_VP  
                                   4415 ; if APP_VP>UVP else do the opposite 
      0099AE 65 09 20 6E      [ 2] 4416         ldw y,APP_VP 
      0099B2 6F 4E 61         [ 2] 4417         cpw y,UVP 
      0099B5 6D 65            [ 1] 4418         jrugt 4$
      0099B7 81 99 92         [ 4] 4419         call UPDATVP 
      0099BA 05 57            [ 2] 4420         jra 6$
      0019EC                       4421 4$: ; update UVP with APP_VP 
      0099BC 4F 52 44         [ 2] 4422         ldw UVP,y 
      0019EF                       4423 6$:      
      0099BF 53 13 A9         [ 4] 4424         CALL     PRESE   ;initialize data stack and TIB
      0099C0 CD 19 89         [ 4] 4425         CALL     TBOOT
      0099C0 CD 8F 26         [ 4] 4426         CALL     ATEXE   ;application boot
      0099C3 CD 86 9F         [ 4] 4427         CALL     OVERT
      0099C6 CD 84 B8         [ 2] 4428         JP     QUIT    ;start interpretation
                                   4429 
                           000001  4430 WANT_MATH_CONST = 1 
                           000001  4431 .if WANT_MATH_CONST 
                                   4432         ; irrational constants 
                                   4433         ; approximation by integers ratio.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4434         .include "../const_ratio.asm"
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
      0099C9 CD 87                   31         .word LINK 
                           001A00    32         LINK=.
      0099CB 09                      33         .byte 2
      0099CC CD 84                   34         .ascii "PI" 
      001A03                         35 PII:
      0099CE 63 99 E2         [ 2]   36         subw x,#2*CELLL 
      0099D1 CD 85 5F CD      [ 2]   37         ldw y,#355 
      0099D5 8E DE            [ 2]   38         ldw (2,x),y 
      0099D7 CD 99 96 CD      [ 2]   39         ldw y,#113 
      0099DB 8A               [ 2]   40         ldw (x),y 
      0099DC 38               [ 4]   41         ret 
                                     42 
                                     43 ;      SQRT2 ( -- 19601  13860 )
                                     44 ; precision: 1.5e-9 
                                     45 ; usage example to compute Voltage peek to peek from Vrms 
                                     46 ; : VPP SQRT2 */ 2 * ;
                                     47 ;
      0099DD CD 84                   48         .word LINK 
                           001A14    49         LINK=.
      0099DF 7A                      50         .byte 5 
      0099E0 99 C6 81 99 BA          51         .ascii "SQRT2" 
      001A1A                         52 SQRT2:
      0099E5 02 68 69         [ 2]   53         subw x,#2*CELLL 
      0099E8 90 AE 4C 91      [ 2]   54         ldw y,#19601 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      0099E8 CD 8F            [ 2]   55         ldw (2,x),y 
      0099EA 26 CD 8F 65      [ 2]   56         ldw y,#13860 
      0099EE 0F               [ 2]   57         ldw (x),y 
      0099EF 73               [ 4]   58         ret 
                                     59 
                                     60 ;   SQRT3 ( -- 18817 10864 )
                                     61 ; precision: 1.1e-9
                                     62 ;
      0099F0 74 6D                   63         .word LINK 
                           001A2B    64         LINK=.
      0099F2 38                      65         .byte 5
      0099F3 65 46 6F 72 74          66         .ascii "SQRT3" 
      001A31                         67 SQRT3: 
      0099F8 68 20 76         [ 2]   68     subw x,#2*CELLL 
      0099FB 33 2E 30 CC      [ 2]   69     ldw y,#18817 
      0099FF 8F 26            [ 2]   70     ldw (2,x),y 
      009A01 99 E5 05 27      [ 2]   71     ldw y,#10864 
      009A05 42               [ 2]   72     ldw (x),y 
      009A06 4F               [ 4]   73     ret 
                                     74 
                                     75 ;   E ( -- 28667 10546 )
                                     76 ; precision: 5.5e-9 
                                     77 ; natural log base 
      009A07 4F 54                   78         .word LINK 
                           001A42    79         LINK=.
      009A09 01                      80         .byte 1
      009A09 CD                      81         .ascii "E" 
      001A44                         82 ENEPER:
      009A0A 86 0C 40         [ 2]   83     subw x,#2*CELLL 
      009A0D 02 9A 03 04      [ 2]   84     ldw y,#28667 
      009A11 43 4F            [ 2]   85     ldw (2,x),y 
      009A13 4C 44 29 32      [ 2]   86     ldw y,#10546 
      009A15 FF               [ 2]   87     ldw (x),y 
      009A15 CD               [ 4]   88     ret 
                                     89 
                                     90 ;   SQRT10 ( -- 22936 7253 )
                                     91 ; precision: 5.7e-9 
      009A16 84 30                   92         .word LINK 
                           001A55    93         LINK=.
      009A18 80                      94         .byte 6 
      009A19 AB CD 84 30 00 06       95         .ascii "SQRT10" 
      001A5C                         96 SQRT10:
      009A1F CD 84 30         [ 2]   97     subw x,#2*CELLL
      009A22 00 1A CD 8B      [ 2]   98     ldw y,#22936 
      009A26 FB 90            [ 2]   99     ldw (2,x),y 
      009A28 CE 40 02 26      [ 2]  100     ldw y,#7253
      009A2C 0B               [ 2]  101     ldw (x),y 
      009A2D 1D               [ 4]  102     ret 
                                    103 
                                    104 ;   12RT2 ( -- 26797 25293 )
                                    105 ; precision: 1.0e-9 
                                    106 ; used in music to compute well tempered scale
      009A2E 00 02                  107         .word LINK 
                           001A6D   108         LINK=. 
      009A30 90                     109         .byte 5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      009A31 AE 99 E8 FF CD         110         .ascii "12RT2"
      001A73                        111 RT12_2:
      009A36 9B C3 04         [ 2]  112     subw x,#2*CELLL 
      009A38 90 AE 68 AD      [ 2]  113     ldw y,#26797
      009A38 90 CE            [ 2]  114     ldw (2,x),y 
      009A3A 40 00 90 B3      [ 2]  115     ldw y,#25293
      009A3E 1A               [ 2]  116     ldw (x),y 
      009A3F 22               [ 4]  117     ret 
                                    118 
                                    119 ;   LOG2s ( -- 2040 11103 )
                                    120 ; log(2)/1.6384
                                    121 ; precision: 1.1e-8
      009A40 05 CD                  122         .word LINK 
                           001A84   123         LINK=.
      009A42 9B                     124         .byte 5 
      009A43 AB 20 06 32 53         125         .ascii "LOG2S" 
      009A46                        126 LOG2S:
      009A46 90 BF 1A         [ 2]  127     subw x,#2*CELLL
      009A49 90 BF 14 F8      [ 2]  128     ldw y,#2040 
      009A4C EF 02            [ 2]  129     ldw (2,x),y 
      009A4C 90 CE 40 04      [ 2]  130     ldw y,#11103 
      009A50 90               [ 2]  131     ldw (x),y 
      009A51 B3               [ 4]  132     ret 
                                    133 
                                    134 ;   LN2 ( -- 485 11464 )
                                    135 ; ln(2)/16.384 
                                    136 ; precision: 1.0e-7 
      009A52 18 24                  137         .word LINK 
                           001A9B   138         LINK=.
      009A54 06                     139         .byte 4 
      009A55 CD 9B D4 90            140         .ascii "LN2S" 
      001AA0                        141 LN2S: 
      009A59 BE 18 04         [ 2]  142     subw x,#2*CELLL
      009A5B 90 AE 01 E5      [ 2]  143     ldw y,#485
      009A5B 90 BF            [ 2]  144     ldw (2,x),y 
      009A5D 18 90 CE 40      [ 2]  145     ldw y,#11464 
      009A61 06               [ 2]  146     ldw (x),y 
      009A62 90               [ 4]  147     ret 
                                    148 
                                    149 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4435 .endif ; WANT_MATH_CONST
                                   4436 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4437         .include "flash_disco.asm"
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
      009A63 B3 16                   30     .word LINK 
                           001AB1    31     LINK=.
      009A65 22                      32     .byte 4 
      009A66 05 CD 9B EB             33     .ascii "PTR!"
      001AB6                         34 PSTO:
      009A6A 20 03            [ 1]   35     ldw y,x
      009A6C 90 FE            [ 2]   36     ldw y,(y)
      009A6C 90 BF 16         [ 2]   37     ldw PTR16,y  
      009A6F 1C 00 02         [ 2]   38     addw x,#CELLL 
      009A6F CD               [ 4]   39     ret 
                                     40 
                                     41 ;-----------------------------------
                                     42 ; return EEPROM base address 
                                     43 ;  EEPROM  ( -- a )
                                     44 ;-----------------------------------
      009A70 94 29                   45     .word LINK 
                           001AC3    46 LINK=.
      009A72 CD                      47     .byte 6 
      009A73 9A 09 CD 8B E4 CD       48     .ascii "EEPROM"
      001ACA                         49 EEPROM: 
      009A79 96 F2 CC 94      [ 2]   50     ldw y,#EEPROM_BASE
      009A7D 46 9A 10         [ 2]   51     subw x,#CELLL 
      009A80 02               [ 2]   52     ldw (x),y 
      009A81 50               [ 4]   53     ret
                                     54 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                     55 ;---------------------------------
                                     56 ; return APP_LAST address 
                                     57 ; EEP-LAST ( -- a )
                                     58 ;---------------------------------
      009A82 49 C3                   59 	.word LINK 
                           001AD5    60 	LINK=.
      009A83 08                      61 	.byte 8 
      009A83 1D 00 04 90 AE 01 63    62 	.ascii "EEP-LAST"
             EF
      001ADE                         63 EEPLAST:
      009A8B 02 90 AE         [ 2]   64 	subw x,#CELLL 
      009A8E 00 71 FF 81      [ 2]   65 	ldw y,#APP_LAST 
      009A92 9A               [ 2]   66 	ldw (x),y 
      009A93 80               [ 4]   67 	ret 
                                     68 
                                     69 ;----------------------------------
                                     70 ; return APP_RUN address 	
                                     71 ; EEP-RUN ( -- a )
                                     72 ;-----------------------------------
      009A94 05 53                   73 	.word LINK 
                           001AE9    74 	LINK=.
      009A96 51                      75 	.byte 7
      009A97 52 54 32 2D 52 55 4E    76 	.ascii "EEP-RUN"
      009A9A                         77 EEPRUN:
      009A9A 1D 00 04         [ 2]   78 	subw x,#CELLL 
      009A9D 90 AE 4C 91      [ 2]   79 	ldw y,#APP_RUN 
      009AA1 EF               [ 2]   80 	ldw (x),y 
      009AA2 02               [ 4]   81 	ret 
                                     82 
                                     83 ;------------------------------------
                                     84 ; return APP_CP address  
                                     85 ; EEP-CP ( -- a )
                                     86 ;------------------------------------
      009AA3 90 AE                   87 	.word LINK
                           001AFC    88 	LINK=.
      009AA5 36                      89 	.byte 6 
      009AA6 24 FF 81 9A 94 05       90 	.ascii "EEP-CP"
      001B03                         91 EEPCP:
      009AAC 53 51 52         [ 2]   92 	subw x,#CELLL 
      009AAF 54 33 40 04      [ 2]   93 	ldw y,#APP_CP  
      009AB1 FF               [ 2]   94 	ldw (x),y 
      009AB1 1D               [ 4]   95 	ret 
                                     96 
                                     97 ;------------------------------------
                                     98 ; return APP_VP address 
                                     99 ; EEP-VP ( -- a )
                                    100 ;-------------------------------------
      009AB2 00 04                  101 	.word LINK
                           001B0E   102 	LINK=.
      009AB4 90                     103 	.byte 6
      009AB5 AE 49 81 EF 02 90      104 	.ascii "EEP-VP"
      001B15                        105 EEPVP:
      009ABB AE 2A 70         [ 2]  106 	subw x,#CELLL 
      009ABE FF 81 9A AB      [ 2]  107 	ldw y,#APP_VP  
      009AC2 01               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009AC3 45               [ 4]  109 	ret 
                                    110 
                                    111 ;----------------------------------
                                    112 ; update APP_LAST with LAST 
                                    113 ; UPDAT-LAST ( -- )
                                    114 ;----------------------------------
      009AC4 1B 0E                  115 	.word LINK 
                           001B20   116 	LINK=.
      009AC4 1D                     117 	.byte 10
      009AC5 00 04 90 AE 6F FB EF   118 	.ascii "UPDAT-LAST"
             02 90 AE
      001B2B                        119 UPDATLAST:
      009ACF 29 32 FF         [ 4]  120 	call LAST
      009AD2 81 9A C2         [ 4]  121 	call AT  
      009AD5 06 53 51         [ 4]  122 	call EEPLAST
      009AD8 52 54 31         [ 2]  123 	jp EE_STORE 
                                    124 
                                    125 ;---------------------------------
                                    126 ; update APP_RUN 
                                    127 ; UPDAT-RUN ( a -- )
                                    128 ;---------------------------------
      009ADB 30 20                  129 	.word LINK
                           001B39   130 	LINK=.
      009ADC 09                     131 	.byte 9
      009ADC 1D 00 04 90 AE 59 98   132 	.ascii "UPDAT-RUN"
             EF 02
      001B43                        133 UPDATRUN:
      009AE5 90 AE 1C         [ 4]  134 	call EEPRUN
      009AE8 55 FF 81         [ 2]  135 	jp EE_STORE 
                                    136 	
                                    137 ;---------------------------------
                                    138 ; update APP_CP with CP 
                                    139 ; UPDAT-CP ( -- )
                                    140 ;---------------------------------
      009AEB 9A D5                  141 	.word LINK 
                           001B4B   142 	LINK=.
      009AED 05                     143 	.byte 8 
      009AEE 31 32 52 54 32 2D 43   144 	.ascii "UPDAT-CP"
             50
      009AF3                        145 UPDATCP:
      009AF3 1D 00 04         [ 4]  146 	call CPP 
      009AF6 90 AE 68         [ 4]  147 	call AT 
      009AF9 AD EF 02         [ 4]  148 	call EEPCP 
      009AFC 90 AE 62         [ 2]  149 	jp EE_STORE 
                                    150 
                                    151 ;----------------------------------
                                    152 ; update APP_VP with VP 
                                    153 ; UPDAT-VP ( -- )
                                    154 ;----------------------------------
      009AFF CD FF                  155 	.word LINK
                           001B62   156 	LINK=.
      009B01 81                     157 	.byte 8 
      009B02 9A ED 05 4C 4F 47 32   158 	.ascii "UPDAT-VP" 
             53
      009B0A                        159 UPDATVP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009B0A 1D 00 04         [ 4]  160 	call VPP 
      009B0D 90 AE 07         [ 4]  161 	call AT
      009B10 F8 EF 02         [ 4]  162 	call EEPVP 
      009B13 90 AE 2B         [ 2]  163 	jp EE_STORE
                                    164 	
                                    165 
                                    166 ;----------------------------------
                                    167 ; unlock EEPROM/OPT for writing/erasing
                                    168 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    169 ;  UNLKEE   ( -- )
                                    170 ;----------------------------------
      009B16 5F FF                  171     .word LINK 
                           001B79   172 LINK=.
      009B18 81                     173     .byte 6 
      009B19 9B 04 04 4C 4E 32      174     .ascii "UNLKEE"
      001B80                        175 unlock_eeprom:
      009B1F 53 00 50 5B      [ 1]  176 	mov FLASH_CR2,#0 
      009B20 35 FF 50 5C      [ 1]  177 	mov FLASH_NCR2,#0xFF 
      009B20 1D 00 04 90      [ 1]  178 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009B24 AE 01 E5 EF      [ 1]  179     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009B28 02 90 AE 2C C8   [ 2]  180 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009B2D FF               [ 4]  181 	ret
                                    182 
                                    183 ;----------------------------------
                                    184 ; unlock FLASH for writing/erasing
                                    185 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    186 ; UNLKFL  ( -- )
                                    187 ;----------------------------------
      009B2E 81 9B                  188     .word LINK 
                           001B98   189 LINK=. 
      009B30 1B                     190     .byte 6 
      009B31 04 50 54 52 21 4C      191     .ascii "UNLKFL"    
      009B36                        192 unlock_flash:
      009B36 90 93 90 FE      [ 1]  193 	mov FLASH_CR2,#0 
      009B3A 90 BF 32 1C      [ 1]  194 	mov FLASH_NCR2,#0xFF 
      009B3E 00 02 81 9B      [ 1]  195 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009B42 31 06 45 45      [ 1]  196 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009B46 50 52 4F 4D FB   [ 2]  197 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009B4A 81               [ 4]  198 	ret
                                    199 
                                    200 ;-----------------------------
                                    201 ; unlock FLASH or EEPROM 
                                    202 ; according to PTR16 address 
                                    203 ;  UNLOCK ( -- )
                                    204 ;-----------------------------
      009B4A 90 AE                  205 	.word LINK 
                           001BB7   206 	LINK=.
      009B4C 40                     207 	.byte 6
      009B4D 00 1D 00 02 FF 81      208 	.ascii "UNLOCK"
      001BBE                        209 unlock:
                                    210 ; put addr[15:0] in Y, for bounds check.
      009B53 9B 43 08         [ 2]  211 	ldw y,PTR16   ; Y=addr15:0
      009B56 45 45 50 2D      [ 2]  212     cpw y,#FLASH_BASE
      009B5A 4C 41            [ 1]  213     jruge 4$
      009B5C 53 54 40 00      [ 2]  214 	cpw y,#EEPROM_BASE  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009B5E 25 0D            [ 1]  215     jrult 9$
      009B5E 1D 00 02 90      [ 2]  216 	cpw y,#OPTION_END 
      009B62 AE 40            [ 1]  217 	jrugt 9$
      009B64 00 FF 81         [ 4]  218 	call unlock_eeprom
      009B67 9B               [ 4]  219 	ret 
      009B68 55 07 45         [ 4]  220 4$: call unlock_flash
      009B6B 45               [ 4]  221 9$: ret 
                                    222 
                                    223 ;-------------------------
                                    224 ; lock write access to 
                                    225 ; FLASH and EEPROM 
                                    226 ; LOCK ( -- )
                                    227 ;-------------------------
      009B6C 50 2D                  228 	.word LINK 
                           001BDD   229 	LINK=.
      009B6E 52                     230 	.byte 4 
      009B6F 55 4E 43 4B            231 	.ascii "LOCK" 
      009B71                        232 lock: 
      009B71 1D 00 02 90      [ 1]  233 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009B75 AE 40 02 FF      [ 1]  234 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009B79 81               [ 4]  235 	ret 
                                    236 
                                    237 ;-------------------------
                                    238 ; increment PTR16 
                                    239 ; INC-PTR16 ( -- )
                                    240 ;-------------------------
      009B7A 9B 69                  241 	.word LINK 
                           001BED   242 	LINK=. 
      009B7C 06                     243 	.byte 8 
      009B7D 45 45 50 2D 43 50 52   244 	.ascii "INC-PTR16" 
             31 36
      009B83                        245 INC_PTR16:
      009B83 1D 00            [ 2]  246 	pushw y 
      009B85 02 90 AE         [ 2]  247 	ldw y,PTR16 
      009B88 40 04            [ 2]  248 	incw y 
      009B8A FF 81 9B         [ 2]  249 	ldw PTR16,y
      009B8D 7C 06            [ 2]  250 	popw y 
      009B8F 45               [ 4]  251 	ret 
                                    252 
                                    253 
                                    254 ;----------------------------
                                    255 ; write a byte at address pointed 
                                    256 ; by PTR16 and increment PTR16.
                                    257 ; Expect pointer already initialized 
                                    258 ; and memory unlocked 
                                    259 ; WR-BYTE ( c -- )
                                    260 ;----------------------------
      009B90 45 50                  261 	.word LINK 
                           001C06   262 	LINK=. 
      009B92 2D                     263 	.byte 7 
      009B93 56 50 2D 42 59 54 45   264 	.ascii "WR-BYTE" 
                                    265 
      009B95                        266 WR_BYTE:
      009B95 1D 00            [ 1]  267 	ldw y,x 
      009B97 02 90            [ 2]  268 	ldw y,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009B99 AE 40 06         [ 2]  269 	addw x,#CELLL 
      009B9C FF 81            [ 1]  270 	ld a,yl
      009B9E 9B 8E 0A         [ 4]  271 	ld [PTR16],a
      009BA1 55 50 44 41 54   [ 2]  272 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009BA6 2D 4C            [ 2]  273 	jra INC_PTR16 
                                    274 
                                    275 ;---------------------------------------
                                    276 ; write a word at address pointed 
                                    277 ; by PTR16 and incrment PTR16 
                                    278 ; Expect pointer already initialized 
                                    279 ; WR-WORD ( w -- )
                                    280 ;---------------------------------------
      009BA8 41 53                  281 	.word LINK 
                           001C23   282 	LINK=.
      009BAA 54                     283 	.byte 7
      009BAB 57 52 2D 57 4F 52 44   284 	.ascii "WR-WORD"
      001C2B                        285 WR_WORD:
      009BAB CD 86            [ 1]  286 	ldw y,x 
      009BAD CB CD            [ 2]  287 	ldw y,(y)
      009BAF 84 B8            [ 2]  288 	pushw y 
      009BB1 CD 9B            [ 1]  289 	swapw y 
      009BB3 5E               [ 2]  290 	ldw (x),y 
      009BB4 CC 9D 12         [ 4]  291 	call WR_BYTE 
      009BB7 9B A0            [ 2]  292 	popw y 
      009BB9 09 55 50         [ 2]  293 	subw x,#CELLL
      009BBC 44               [ 2]  294 	ldw (x),y 
      009BBD 41 54 2D         [ 4]  295 	call WR_BYTE
      009BC0 52 55 4E         [ 2]  296 	jp lock 
                                    297 
                                    298 
                                    299 ;---------------------------------------
                                    300 ; write a byte to FLASH or EEPROM/OPTION  
                                    301 ; EEC!  (c a -- )
                                    302 ;---------------------------------------
      009BC3 1C 23                  303     .word LINK 
                           001C45   304 	LINK=.
      009BC3 CD                     305     .byte 4 
      009BC4 9B 71 CC 9D            306     .ascii "EEC!"
                                    307 	; local variables 
                           000001   308 	BTW = 1   ; byte to write offset on stack
                           000002   309     OPT = 2 
                           000002   310 	VSIZE = 2
      001C4A                        311 EE_CSTORE:
      009BC8 12 9B            [ 2]  312 	sub sp,#VSIZE
      009BCA B9 08 55         [ 4]  313     call PSTO
      009BCD 50 44            [ 1]  314 	ld a,(1,x)
      009BCF 41               [ 1]  315 	cpl a 
      009BD0 54 2D            [ 1]  316 	ld (BTW,sp),a ; byte to write 
      009BD2 43 50            [ 1]  317 	clr (OPT,sp)  ; OPTION flag
      009BD4 CD 1B BE         [ 4]  318 	call unlock 
                                    319 	; check if option
      009BD4 CD 86 BB         [ 2]  320 	ldw y,PTR16 
      009BD7 CD 84 B8 CD      [ 2]  321 	cpw y,#OPTION_BASE
      009BDB 9B 83            [ 1]  322 	jrmi 2$
      009BDD CC 9D 12 9B      [ 2]  323 	cpw y,#OPTION_END+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009BE1 CB 08            [ 1]  324 	jrpl 2$
      009BE3 55 50            [ 1]  325 	cpl (OPT,sp)
                                    326 	; OPTION WRITE require this unlock 
      009BE5 44 41 54 2D      [ 1]  327     bset FLASH_CR2,#FLASH_CR2_OPT
      009BE9 56 50 50 5C      [ 1]  328     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009BEB                        329 2$: 
      009BEB CD 86 AD         [ 4]  330 	call WR_BYTE 	
      009BEE CD 84            [ 1]  331 	tnz (OPT,sp)
      009BF0 B8 CD            [ 1]  332 	jreq 3$ 
      009BF2 9B 95            [ 1]  333     ld a,(BTW,sp)
      009BF4 CC 9D            [ 1]  334     clrw y
      009BF6 12 9B            [ 1]  335 	ld yl,a 
      009BF8 E2 06 55         [ 2]  336 	subw x,#CELLL 
      009BFB 4E               [ 2]  337 	ldw (x),y 
      009BFC 4C 4B 45         [ 4]  338 	call WR_BYTE
      001C86                        339 3$: 
      009BFF 45 1B E2         [ 4]  340 	call lock 
      009C00 5B 02            [ 2]  341 	addw sp,#VSIZE 
      009C00 35               [ 4]  342     ret
                                    343 
                                    344 ;------------------------------
                                    345 ; write integer in FLASH|EEPROM
                                    346 ; EE! ( n a -- )
                                    347 ;------------------------------
      009C01 00 50                  348 	.word LINK 
                           001C8E   349 	LINK=.
      009C03 5B                     350 	.byte 3 
      009C04 35 FF 50               351 	.ascii "EE!"
      001C92                        352 EE_STORE:
      009C07 5C 35 AE         [ 4]  353 	call PSTO 
      009C0A 50 64 35         [ 4]  354 	call unlock 
      009C0D 56 50 64         [ 2]  355 	jp WR_WORD 
                                    356 
                                    357 
                                    358 ;----------------------------
                                    359 ; Erase flash memory row 
                                    360 ; stm8s105c6 as 128 bytes rows
                                    361 ; ROW-ERASE ( a -- )
                                    362 ;----------------------------
      009C10 72 07                  363 	.word LINK 
                           001C9D   364 	LINK=. 
      009C12 50                     365 	.byte 9 
      009C13 5F FB 81 9B F9 06 55   366 	.ascii "ROW-ERASE" 
             4E 4C
      001CA7                        367 row_erase:
      009C1C 4B 46 4C         [ 4]  368 	call PSTO
                                    369 ;code must be execute from RAM 
                                    370 ;copy routine to PAD 
      009C1F 1D 00 02         [ 2]  371 	subw x,#CELLL 
      009C1F 35 00 50 5B      [ 2]  372 	ldw y,#row_erase_proc
      009C23 35               [ 2]  373 	ldw (x),y 
      009C24 FF 50 5C         [ 4]  374 	call PAD 
      009C27 35 56 50 62      [ 2]  375 	ldw y,#row_erase_proc_end 
      009C2B 35 AE 50 62      [ 2]  376 	subw y,#row_erase_proc
      009C2F 72 03 50         [ 2]  377 	subw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009C32 5F               [ 2]  378 	ldw (x),y 
      009C33 FB 81 9C         [ 4]  379 	call CMOVE 
      001CC4                        380 block_erase:
      009C36 18 06 55         [ 2]  381 	ldw y,PTR16
      009C39 4E 4C 4F 43      [ 2]  382 	cpw y,#app_space 
      009C3D 4B 13            [ 1]  383 	jrpl erase_flash 
                                    384 ; erase EEPROM block
      009C3E 90 A3 40 00      [ 2]  385 	cpw y,#EEPROM_BASE 
      009C3E 90 BE            [ 1]  386 	jruge 1$
      009C40 32               [ 4]  387 	ret ; bad address 
      009C41 90 A3 80 00      [ 2]  388 1$: cpw y,#EEPROM_END 
      009C45 24 10            [ 2]  389 	jrule 2$ 
      009C47 90               [ 4]  390 	ret ; bad address 
      001CDB                        391 2$:	
      009C48 A3 40 00         [ 4]  392 	call unlock_eeprom 
      009C4B 25 0D            [ 2]  393 	jra proceed_erase
                                    394 ; erase flash block:
      001CE0                        395 erase_flash:
      009C4D 90 A3 48         [ 4]  396 	call unlock_flash 
      001CE3                        397 proceed_erase:
      009C50 7F 22 07         [ 4]  398 	call PAD 
      009C53 CD 9C            [ 1]  399 	ldw y,x
      009C55 00 81            [ 2]  400 	ldw y,(y)
      009C57 CD 9C 1F         [ 2]  401 	addw x,#CELLL  
      009C5A 81 9C            [ 4]  402 	call (y) 
      009C5C 37 04 4C 4F      [ 1]  403 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009C60 43               [ 4]  404 	ret 
                                    405 
                                    406 ; this routine is to be copied to PAD 
      001CF4                        407 row_erase_proc:
      009C61 4B 20 50 5B      [ 1]  408 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009C62 35 DF 50 5C      [ 1]  409 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009C62 72               [ 1]  410 	clr a 
      009C63 13 50            [ 1]  411 	clrw y 
      009C65 5F 72 17         [ 4]  412 	ld ([PTR16],y),a
      009C68 50 5F            [ 2]  413     incw y
      009C6A 81 9C 5D         [ 4]  414 	ld ([PTR16],y),a
      009C6D 08 49            [ 2]  415     incw y
      009C6F 4E 43 2D         [ 4]  416 	ld ([PTR16],y),a
      009C72 50 54            [ 2]  417     incw y
      009C74 52 31 36         [ 4]  418 	ld ([PTR16],y),a
      009C77 72 05 50 5F FB   [ 2]  419 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009C77 90               [ 4]  420 	ret
      001D17                        421 row_erase_proc_end:
                                    422 
                                    423 
                                    424 ;-----------------------------------
                                    425 ; block programming must be 
                                    426 ; executed from RAM 
                                    427 ; initial contidions: 
                                    428 ; 		memory unlocked
                                    429 ;       PTR16 initialized 
                                    430 ; input: 
                                    431 ;    x   buffer address 
                                    432 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                           000001   433 	BCNT=1 
      001D17                        434 copy_buffer:
      009C78 89 90            [ 1]  435 	push #BLOCK_SIZE  
                                    436 ;enable block programming 
      009C7A BE 32 90 5C      [ 1]  437 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009C7E 90 BF 32 90      [ 1]  438 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009C82 85 81            [ 1]  439 	clrw y
      009C84 9C               [ 1]  440 1$:	ld a,(x)
      009C85 6D 07 57         [ 4]  441 	ld ([PTR16],y),a
      009C88 52               [ 2]  442 	incw x 
      009C89 2D 42            [ 2]  443 	incw y 
      009C8B 59 54            [ 1]  444 	dec (BCNT,sp)
      009C8D 45 F5            [ 1]  445 	jrne 1$
                                    446 ; wait EOP bit 
      009C8E 72 05 50 5F FB   [ 2]  447 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009C8E 90               [ 1]  448 	pop a ; remove BCNT from stack 
      009C8F 93               [ 4]  449 	ret 
      001D35                        450 copy_buffer_end:
                                    451 
                                    452 ;-------------------------
                                    453 ; move program_row to RAM 
                                    454 ; in TIB 
                                    455 ;------------------------
      001D35                        456 copy_prog_to_ram:
      009C90 90 FE 1C         [ 2]  457 	subw x,#6
      009C93 00 02 90 9F      [ 2]  458 	ldw y,#copy_buffer 
      009C97 92 C7            [ 2]  459 	ldw (4,x),y 
      009C99 32 72 05 50      [ 2]  460 	ldw y,#TIBBASE
      009C9D 5F FB            [ 2]  461 	ldw (2,x),y 
      009C9F 20 D6 9C 86      [ 2]  462 	ldw y,#copy_buffer_end 
      009CA3 07 57 52 2D      [ 2]  463 	subw y,#copy_buffer  
      009CA7 57               [ 2]  464 	ldw (x),y 
      009CA8 4F 52 44         [ 4]  465 	call CMOVE 
      009CAB 81               [ 4]  466 	ret 
                                    467 
                                    468 
                                    469 ;-----------------------------
                                    470 ; write a row in FLASH/EEPROM 
                                    471 ; WR-ROW ( ab ar -- )
                                    472 ; ab -> address 128 byte buffer to write 
                                    473 ; ar ->  row address in FLASH|EEPROM 
                                    474 ;-----------------------------
      009CAB 90 93                  475 	.word LINK 
                           001D53   476 	LINK=.
      009CAD 90                     477 	.byte 6 
      009CAE FE 90 89 90 5E FF      478 	.ascii "WR-ROW"
      001D5A                        479 WR_ROW:
      009CB4 CD 9C 8E         [ 4]  480 	call PSTO
                                    481 ; align to FLASH block 
      009CB7 90 85            [ 1]  482 	ld a,#0x80 
      009CB9 1D 00            [ 1]  483 	and a,PTR8 
      009CBB 02 FF            [ 1]  484 	ld PTR8,a  
      009CBD CD 9C 8E         [ 4]  485 	call copy_prog_to_ram
      009CC0 CC 9C 62         [ 4]  486 	call unlock
      009CC3 9C A3            [ 1]  487 	ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009CC5 04 45            [ 2]  488 	ldw y,(y)
      009CC7 45 43 21         [ 2]  489 	addw x,#CELLL 
      009CCA 89               [ 2]  490 	pushw x 
      009CCA 52               [ 1]  491 	ldw x,y ; buffer address in x 
      009CCB 02 CD 9B         [ 4]  492 	call TIBBASE
      009CCE 36 E6 01         [ 4]  493 	call lock
      009CD1 43               [ 2]  494 	popw x 
      009CD2 6B               [ 4]  495 	ret 
                                    496 
                                    497 ;-------------------------------------
                                    498 ; change value of OPTION register 
                                    499 ; SET-OPT (c n -- ) 
                                    500 ; c new value.
                                    501 ; n OPT  number {1..7}
                                    502 ;--------------------------------------
      009CD3 01 0F                  503 		.word LINK 
                           001D7C   504 		LINK=.
      009CD5 02                     505 		.byte 7 
      009CD6 CD 9C 3E 90 BE 32 90   506 		.ascii "SET-OPT" 
      001D84                        507 set_option: 
      009CDD A3 48            [ 1]  508 		ldw y,x 
      009CDF 00 2B            [ 2]  509 		ldw y,(y)
      009CE1 10 90            [ 1]  510 		jreq 1$
      009CE3 A3 48 80 2A      [ 2]  511 		cpw y,#7 
      009CE7 0A 03            [ 2]  512 		jrule 2$ 
                                    513 ; invalid OPTION number 		
      009CE9 02 72 1E         [ 2]  514 1$:		addw x,#2*CELLL
      009CEC 50               [ 4]  515 		ret
      009CED 5B 72            [ 2]  516 2$:		sllw y 
      009CEF 1F 50 5C FF      [ 2]  517 		addw y,#OPTION_BASE-1
      009CF2 FF               [ 2]  518 		ldw (x),y 
      009CF2 CD 9C 8E         [ 4]  519 		call EE_CSTORE
      009CF5 0D               [ 4]  520 		ret 
                                    521 
                                    522 
                                    523 
                                    524 ;--------------------------------------
                                    525 ; reset system to its original state 
                                    526 ; before any user modification
                                    527 ; PRISTINE ( -- )
                                    528 ;-------------------------------------
      009CF6 02 27                  529 	.word LINK  
                           001DA1   530 	LINK=.
      009CF8 0D                     531 	.byte 8 
      009CF9 7B 01 90 5F 90 97 1D   532 	.ascii "PRISTINE"
             00
      001DAA                        533 pristine:
                                    534 ;;; erase EEPROM
      009D01 02 FF CD         [ 4]  535 	call EEPROM 
      009D04 9C 8E DF         [ 4]  536 1$:	call DUPP 
      009D06 CD 1C A7         [ 4]  537 	call row_erase
      009D06 CD 9C            [ 1]  538 	ldw y,x 
      009D08 62 5B            [ 2]  539 	ldw y,(y)
      009D0A 02 81 9C C5      [ 2]  540 	addw y,#BLOCK_SIZE
      009D0E 03               [ 2]  541 	ldw (x),y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009D0F 45 45 21 00      [ 2]  542 	cpw y,#OPTION_BASE 
      009D12 25 EB            [ 1]  543 	jrult 1$
                                    544 ;;; reset OPTION to default values
      009D12 CD 9B 36 CD      [ 2]  545 	ldw y,#1 ; OPT1 
      009D16 9C               [ 2]  546 2$:	ldw (x),y   
      009D17 3E CC            [ 1]  547 	clrw y 
      009D19 9C AB            [ 2]  548 	ldw (2,x),y  ; ( 0 1 -- ) 
      009D1B 9D 0E 09         [ 4]  549 	call DDUP    ; ( 0 1 0 1 -- )  
      009D1E 52 4F 57         [ 4]  550 	call set_option
      009D21 2D 45            [ 1]  551 	ldw y,x 
      009D23 52 41            [ 2]  552 	ldw y,(y)
      009D25 53 45            [ 2]  553 	incw y  ; next OPTION 
      009D27 90 A3 00 08      [ 2]  554 	cpw y,#8 
      009D27 CD 9B            [ 1]  555 	jrult 2$
                                    556 ;;; erase first row of app_space 	
      009D29 36 1D 00         [ 4]  557 	call DROP 
      009D2C 02 90 AE 9D      [ 2]  558 	ldw y,#app_space
      009D30 74               [ 2]  559 	ldw (x),y   
      009D31 FF CD 8B         [ 4]  560 	call row_erase 
                                    561 ; reset interrupt vectors 
      009D34 BF 90 AE         [ 2]  562 	subw x,#CELLL 
      009D37 9D 97            [ 1]  563 	clrw y  
      009D39 72               [ 2]  564 4$:	ldw (x),y  ; ( n -- ) int# 
      009D3A A2 9D 74         [ 4]  565 	call DUPP  
      009D3D 1D 00 02         [ 4]  566 	call reset_vector
      009D40 FF CD            [ 1]  567 	ldw y,x 
      009D42 8B FB            [ 2]  568 	ldw y,(y)
      009D44 90 5C            [ 2]  569 	incw y   ; next vector 
      009D44 90 BE 32 90      [ 2]  570 	cpw y,#29 
      009D48 A3 A1            [ 1]  571 	jrult 4$
      009D4A 80 2A 13         [ 2]  572 	jp NonHandledInterrupt ; reset MCU
                                    573 
                                    574 ;------------------------------
                                    575 ; reset an interrupt vector 
                                    576 ; to its initial value 
                                    577 ; i.e. NonHandledInterrupt
                                    578 ; RST-IVEC ( n -- )
                                    579 ;-----------------------------
      009D4D 90 A3                  580 	.word LINK 
                           001E05   581 	LINK=. 
      009D4F 40                     582 	.byte 8 
      009D50 00 24 01 81 90 A3 43   583 	.ascii "RST-IVEC"
             FF
      001E0E                        584 reset_vector:
      009D58 23 01            [ 1]  585 	ldw y,x
      009D5A 81 00 02         [ 2]  586 	addw x,#CELLL 
      009D5B 90 FE            [ 2]  587 	ldw y,(y)
      009D5B CD 9C 00 20      [ 2]  588 	cpw y,#23 
      009D5F 03 2D            [ 1]  589 	jreq 9$
      009D60 90 A3 00 1D      [ 2]  590 	cpw y,#29 ; last vector
      009D60 CD 9C            [ 1]  591 	jrugt 9$  
      009D62 1F 58            [ 2]  592 	sllw y 
      009D63 90 58            [ 2]  593 	sllw y 
      009D63 CD 8B BF 90      [ 2]  594 	addw y,#0x8008 ; irq0 address 
      009D67 93 90 FE         [ 2]  595 	subw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009D6A 1C               [ 2]  596 	ldw (x),y 
      009D6B 00 02 90         [ 4]  597 	call PSTO 
      009D6E FD 72 17         [ 2]  598 	subw x,#CELLL 
      009D71 50 5F            [ 1]  599 	clrw y
      009D73 81 82            [ 1]  600 	ld a,#0x82 
      009D74 90 95            [ 1]  601 	ld yh,a
      009D74 35               [ 2]  602 	ldw (x),y
      009D75 20 50 5B         [ 4]  603 	call WR_WORD 
      009D78 35 DF 50         [ 2]  604 	subw x,#CELLL
      009D7B 5C 4F 90 5F      [ 2]  605 	ldw y,#NonHandledInterrupt
      009D7F 91               [ 2]  606 	ldw (x),y 
      009D80 D7 32 90         [ 4]  607 	call WR_WORD 
      009D83 5C               [ 4]  608 9$:	ret 
                                    609 
                                    610 
                                    611 ;------------------------------
                                    612 ; all interrupt vector with 
                                    613 ; an address >= a are resetted 
                                    614 ; to default
                                    615 ; CHKIVEC ( a -- )
                                    616 ;------------------------------
      009D84 91 D7                  617 	.word LINK 
                           001E4B   618 	LINK=.
      009D86 32                     619 	.byte 7
      009D87 90 5C 91 D7 32 90 5C   620 	.ascii "CHKIVEC"
                                    621 ;local variables 
                           000001   622 	SSP=1
                           000003   623 	CADR=3
                           000005   624 	OFS=5
                           000006   625 	VSIZE=6  
      001E53                        626 CHKIVEC:
      009D8E 91 D7            [ 2]  627 	sub sp,#VSIZE ;alloc local variables 
      009D90 32 72            [ 1]  628 	ldw y,x 
      009D92 05 50            [ 2]  629 	ldw y,(y)
      009D94 5F FB            [ 2]  630 	ldw (CADR,sp),y ; ca 
      009D96 81 01            [ 2]  631 	ldw (SSP,sp),x 
      009D97 AE 80 0A         [ 2]  632 	ldw x,#0x800a ; irq0 address 
      009D97 BF 32            [ 2]  633 	ldw PTR16,X
      009D97 4B 80 72         [ 2]  634 	ldw x,#-4 
      009D9A 10 50 5B         [ 2]  635 1$:	addw x,#4
      009D9D 72 11 50         [ 2]  636 	cpw x,#30*4 ; irq0-29 
      009DA0 5C 90            [ 1]  637 	jreq 9$
      009DA2 5F F6            [ 1]  638 	ldw y,x  
      009DA4 91 D7 32         [ 4]  639 	ld a,([PTR16],y)
      009DA7 5C 90            [ 1]  640 	cp a,(CADR,sp)
      009DA9 5C 0A            [ 1]  641 	jrult 1$
      009DAB 01 26            [ 2]  642 	incw y 
      009DAD F5 72 05         [ 4]  643 	ld a,([PTR16],y)
      009DB0 50 5F            [ 1]  644 	cp a,(CADR+1,sp) 
      009DB2 FB 84            [ 1]  645 	jrult 1$ 
      009DB4 81 05            [ 2]  646 	ldw (OFS,sp),x 
      009DB5 54               [ 2]  647 	srlw x
      009DB5 54               [ 2]  648 	srlw x 
      009DB5 1D 00            [ 1]  649 	ldw y,x 
      009DB7 06 90            [ 2]  650 	ldw x,(SSP,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009DB9 AE               [ 2]  651 	ldw (x),y
      009DBA 9D 97 EF         [ 4]  652 	call reset_vector
      009DBD 04 90            [ 2]  653 	ldw x,(OFS,sp) 
      009DBF AE 07            [ 2]  654 	jra 1$
      009DC1 00 EF            [ 2]  655 9$:	ldw x,(SSP,sp) 
      009DC3 02 90 AE         [ 2]  656 	addw x,#CELLL 
      009DC6 9D B5            [ 2]  657 	addw sp,#VSIZE ; drop local variables  
      009DC8 72               [ 4]  658 	ret 
                                    659 
                                    660 ;------------------------------
                                    661 ; set interrupt vector 
                                    662 ; SET-IVEC ( a n -- )
                                    663 ;  a Handler address
                                    664 ;  n  vector # 0 .. 29 
                                    665 ;-----------------------------
      009DC9 A2 9D                  666 	.word LINK
                           001E99   667 	LINK=.
      009DCB 97                     668 	.byte 8 
      009DCC FF CD 8B FB 81 9D 1D   669 	.ascii "SET-IVEC" 
             06
      001EA2                        670 set_vector:
      009DD4 57 52            [ 1]  671     ldw y,x 
      009DD6 2D 52            [ 2]  672 	ldw y,(y) ; vector #
      009DD8 4F 57 00 1D      [ 2]  673 	cpw y,#29 ; last vector
      009DDA 23 04            [ 2]  674 	jrule 2$
      009DDA CD 9B 36         [ 2]  675 	addw x,#2*CELLL 
      009DDD A6               [ 4]  676 	ret
      009DDE 80 B4            [ 2]  677 2$:	sllw y 
      009DE0 33 B7            [ 2]  678 	sllw y 
      009DE2 33 CD 9D B5      [ 2]  679 	addw y,#0X8008 ; IRQ0 vector address 
      009DE6 CD               [ 2]  680 	ldw (x),y  ; vector address 
      009DE7 9C 3E 90         [ 4]  681 	call PSTO 
      009DEA 93 90            [ 1]  682 	clrw y 
      009DEC FE 1C            [ 1]  683 	ld a,#0x82 
      009DEE 00 02            [ 1]  684 	ld yh,a 
      009DF0 89 93 CD         [ 2]  685 	subw x,#CELLL 
      009DF3 07               [ 2]  686 	ldw (x),y 
      009DF4 00 CD 9C         [ 4]  687 	call WR_WORD 
      009DF7 62 85 81         [ 4]  688 	call WR_WORD 
      009DFA 9D               [ 4]  689 9$: ret 
                                    690 
                                    691 
                                    692 ;------------------------
                                    693 ; Compile word to flash
                                    694 ; EE, (w -- )
                                    695 ;-----------------------
      009DFB D3 07                  696 	.word LINK
                           001ECF   697 	LINK=.
      009DFD 53                     698 	.byte 3
      009DFE 45 54 2D               699 	.ascii "EE,"
      001ED3                        700 EE_COMMA:
      009E01 4F 50 54         [ 2]  701 	subw x,#CELLL 
      009E04 90 BE 18         [ 2]  702 	ldw y,UCP
      009E04 90 93            [ 2]  703 	pushw y 
      009E06 90               [ 2]  704 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009E07 FE 27 06         [ 4]  705 	call EE_STORE
      009E0A 90 A3            [ 2]  706 	popw y 
      009E0C 00 07 23 04      [ 2]  707 	addw y,#2
      009E10 1C 00 04         [ 2]  708 	ldw UCP,y
      009E13 81               [ 4]  709 	ret 
                                    710 
                                    711 
                                    712 ;-------------------------
                                    713 ; Compile byte to flash 
                                    714 ; EEC, ( c -- )	
                                    715 ;-------------------------
      009E14 90 58                  716 	.word LINK 
                           001EEB   717 	LINK=.
      009E16 72                     718 	.byte 4 
      009E17 A9 47 FF FF            719 	.ascii "EEC,"
      001EF0                        720 EE_CCOMMA:
      009E1B CD 9C CA         [ 2]  721 	subw x,#CELLL 
      009E1E 81 9D FC         [ 2]  722 	ldw y,UCP
      009E21 08 50            [ 2]  723 	pushw y 
      009E23 52               [ 2]  724 	ldw (x),y 
      009E24 49 53 54         [ 4]  725 	call EE_CSTORE
      009E27 49 4E            [ 2]  726 	popw y 
      009E29 45 5C            [ 2]  727 	incw y 
      009E2A 90 BF 18         [ 2]  728 	ldw UCP,y
      009E2A CD               [ 4]  729 	ret 
                                    730 
                                    731 
                                    732 ;--------------------------
                                    733 ; copy FLASH block to ROWBUF
                                    734 ; ROW>BUF ( ar -- )
                                    735 ; ar row address 
                                    736 ;--------------------------
      009E2B 9B 4A                  737 	.word LINK 
                           001F06   738 	LINK=.
      009E2D CD                     739 	.byte 7 
      009E2E 85 5F CD 9D 27 90 93   740 	.ascii "ROW>BUF"
      001F0E                        741 ROW2BUF: 
      009E35 90 FE 72         [ 4]  742 	call PSTO 
      009E38 A9 00            [ 1]  743 	ld a,#BLOCK_SIZE
      009E3A 80               [ 1]  744 	push a 
                                    745  ; block align flash address	
      009E3B FF 90            [ 1]  746 	and a,PTR8
      009E3D A3 48            [ 1]  747 	ld PTR8,a
      009E3F 00 25 EB 90      [ 2]  748 	ldw y,#ROWBUFF 
      009E43 AE 00 01         [ 4]  749 1$: ld a,[PTR16]
      009E46 FF 90            [ 1]  750 	ld (y),a
      009E48 5F EF 02         [ 4]  751 	call INC_PTR16
      009E4B CD 87            [ 2]  752 	incw y 
      009E4D 45 CD            [ 1]  753 	dec (1,sp)
      009E4F 9E 04            [ 1]  754 	jrne 1$ 
      009E51 90               [ 1]  755 	pop a 
      009E52 93               [ 4]  756 	ret 
                                    757 
                                    758 
                                    759 ;---------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                    760 ; copy ROWBUFF to flash 
                                    761 ; BUF>ROW ( ar -- )
                                    762 ; ar row address
                                    763 ;---------------------------
      009E53 90 FE                  764 	.word LINK 
                           001F2E   765 	LINK=.
      009E55 90                     766 	.byte 7 
      009E56 5C 90 A3 00 08 25 E9   767 	.ascii "BUF>ROW" 
      001F36                        768 BUF2ROW:
      009E5D CD 85 55         [ 4]  769 	call TBUF ; ( ar Ab -- )
      009E60 90 AE A1         [ 4]  770 	call SWAPP ; ( ab ar -- )
      009E63 80 FF CD         [ 4]  771 	call WR_ROW 
      009E66 9D               [ 4]  772 	ret 
                                    773 
                                    774 ;---------------------------------
                                    775 ; how many byte free in that row 
                                    776 ; RFREE ( a -- n )
                                    777 ; a is least byte of target address
                                    778 ;----------------------------------
      009E67 27 1D                  779 	.word LINK 
                           001F42   780 	LINK=.
      009E69 00                     781 	.byte 5 
      009E6A 02 90 5F FF CD         782 	.ascii "RFREE"
      001F48                        783 RFREE:
      009E6F 85 5F            [ 1]  784 	ld a,(1,x)
      009E71 CD 9E            [ 1]  785 	and a,#BLOCK_SIZE-1 
      009E73 8E 90            [ 1]  786 	ld YTEMP,a 
      009E75 93 90            [ 1]  787 	ld a,#BLOCK_SIZE 
      009E77 FE 90            [ 1]  788 	sub a,YTEMP 
      009E79 5C 90            [ 1]  789 	clrw y 
      009E7B A3 00            [ 1]  790 	ld yl,a
      009E7D 1D               [ 2]  791 	ldw (x),y 
      009E7E 25               [ 4]  792 	ret 
                                    793 
                                    794 ;---------------------------------
                                    795 ; write u bytes to flash/EEPROM 
                                    796 ; constraint to row limit 
                                    797 ; RAM>EE ( af a u1 -- u2 )
                                    798 ; af flash address 
                                    799 ; a ram address 
                                    800 ; u bytes count
                                    801 ; return u2 bytes written  
                                    802 ;-------------------------------
      009E7F ED CC                  803 	.word LINK 
                           001F5A   804 	LINK=. 
      009E81 80                     805 	.byte 6
      009E82 80 9E 21 08 52 53      806 	.ascii "RAM>EE"
                                    807 	
      001F61                        808 RAM2EE:
                                    809 ; PICK af
      009E88 54 2D 49         [ 4]  810 	call DOLIT 
      009E8B 56 45                  811 	.word 2 
      009E8D 43 0A 99         [ 4]  812 	call PICK  ; { -- af a u1 af }
      009E8E CD 04 DF         [ 4]  813 	call DUPP 
      009E8E 90 93 1C         [ 4]  814 	call ROW2BUF ; copy in ROWBUFF  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009E91 00 02 90         [ 4]  815 	call DUPP 
      009E94 FE 90 A3         [ 4]  816 	call TOR 
      009E97 00 17 27         [ 4]  817 	call DOLIT 
      009E9A 2D 90                  818 	.word BLOCK_SIZE-1
      009E9C A3 00 1D         [ 4]  819 	call ANDD 
      009E9F 22 27 90         [ 4]  820 	call DOLIT 
      009EA2 58 90                  821 	.word ROWBUFF 
      009EA4 58 72 A9         [ 4]  822 	call PLUS  ; ( -- af a u1 ab )
      009EA7 80 08 1D         [ 4]  823 	call SWAPP ;  ( -- af a ab u1 )
      009EAA 00 02 FF         [ 4]  824 	call RFROM  ; ( -- af a ab u1 af )
      009EAD CD 9B 36         [ 4]  825 	call RFREE  ; ( -- af a ab u1 n )
      009EB0 1D 00 02         [ 4]  826 	call MIN    
      009EB3 90 5F A6         [ 4]  827 	call DUPP 
      009EB6 82 90 95         [ 4]  828 	call TOR  
      009EB9 FF CD 9C         [ 4]  829 	call CMOVE  ; copy RAM to RAM from a to ab 
      009EBC AB 1D 00         [ 4]  830 	call BUF2ROW ; ( af --  ) write ROWBUFF to flash 
      009EBF 02 90 AE         [ 4]  831 	call RFROM  ; how many written 
      009EC2 80               [ 4]  832 	ret 
                                    833 
                                    834 
                                    835 ;--------------------------
                                    836 ; move new colon definition to FLASH 
                                    837 ; using WR-ROW for efficiency 
                                    838 ; preserving bytes already used 
                                    839 ; in the current block. 
                                    840 ; At this point the compiler as completed
                                    841 ; in RAM and pointers CP and CNTXT are updated.
                                    842 ; CNTXT point to nfa of new word and  
                                    843 ; CP is after compiled word so CP-CNTXT+2=count to write 
                                    844 ; 
                                    845 ; FMOVE ( -- cp+ )
                                    846 ; 
                                    847 ;--------------------------
      009EC3 80 FF                  848 	.word LINK 
                           001FA3   849 	LINK=.
      009EC5 CD                     850 	.byte 5 
      009EC6 9C AB 81 9E 85         851 	.ascii "FMOVE" 
      001FA9                        852 FMOVE:
      009ECB 07 43 48         [ 4]  853 	call TFLASH 
      009ECE 4B 49 56         [ 4]  854 	CALL AT 
      009ED1 45 43 E3         [ 4]  855 	CALL QBRAN 
      009ED3 20 21                  856 	.word no_move  
      009ED3 52 06 90         [ 4]  857 	call CPP  
      009ED6 93 90 FE         [ 4]  858 	call AT  
      009ED9 17 03 1F         [ 4]  859 	call DUPP ; ( cp cp -- )
      009EDC 01 AE 80         [ 4]  860 	call CNTXT 
      009EDF 0A BF 32         [ 4]  861 	call AT 
      009EE2 AE FF FC         [ 4]  862 	call DOLIT 
      009EE5 1C 00                  863 	.word 2 
      009EE7 04 A3 00         [ 4]  864 	call SUBB ; ( cp cp la -- ) \ new word link address in RAM  
      009EEA 78 27 22         [ 4]  865 	call DUPP 
      009EED 90 93 91         [ 4]  866 	call TOR    ; ( cp cp la R: la ) 
      001FD1                        867 FMOVE2:
      009EF0 D6 32 11         [ 4]  868 	call HERE  ; ( cp cp la vp  R: la )
      009EF3 03 25 EF         [ 4]  869 	call RAT   ; ( cp cp la vp la R: la )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009EF6 90 5C 91         [ 4]  870 	call SUBB ; ( cp cp la wl R: la  ) \ wl is bytes to copy 
      001FDA                        871 next_row:
      009EF9 D6 32 11         [ 4]  872 	call DUPP 
      009EFC 04 25 E6         [ 4]  873 	call TOR  ; ( cp cp la wl -- ) R: a wl
      009EFF 1F 05 54         [ 4]  874 	call RAM2EE ; ( cp cp la wl -- cp u2 ) u2 is byte written to FLASH 
      009F02 54 90 93         [ 4]  875 	call DUPP 
      009F05 1E 01 FF         [ 4]  876 	call TOR
      009F08 CD 9E 8E         [ 4]  877 	call PLUS  ; ( cp+ ) 
      009F0B 1E 05 20         [ 4]  878 	call DUPP 
      009F0E D6 1E 01         [ 4]  879 	call RFROM  ; ( cp+ cp+ u2  R: a wl ) 
      009F11 1C 00 02         [ 4]  880 	call RFROM  ; ( cp+ cp+ u2 wl R: a ) 
      009F14 5B 06 81         [ 4]  881 	call OVER   ; ( cp+ cp+ u2 wl u2 -- )
      009F17 9E CB 08         [ 4]  882 	call SUBB  ; ( cp+ cp+ u2 wl- R: a )
      009F1A 53 45 54         [ 4]  883 	call DUPP 
      009F1D 2D 49 56         [ 4]  884 	call QBRAN
      009F20 45 43                  885 	.word fmove_done 
      009F22 CD 04 EF         [ 4]  886 	call SWAPP  ; ( cp+ cp+ wl- u2 R: a )
      009F22 90 93 90         [ 4]  887 	call RFROM ; ( cp+ cp+ wl- u2 a -- ) 
      009F25 FE 90 A3         [ 4]  888 	call PLUS  ; ( cp+ cp+ wl- a+ )
      009F28 00 1D 23         [ 4]  889 	call DUPP 
      009F2B 04 1C 00         [ 4]  890 	call TOR   ; ( cp+ cp+ wl- a+ ) R: a+
      009F2E 04 81 90         [ 4]  891 	call SWAPP ; ( cp+ cp+ a+ wl- )
      009F31 58 90 58         [ 4]  892 	call BRAN
      009F34 72 A9                  893 	.word next_row  
      00201A                        894 fmove_done:	
      009F36 80 08 FF         [ 4]  895 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      009F39 CD 9B 36         [ 2]  896 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      009F3C 90               [ 4]  897  	ret  
      002021                        898 no_move:
      009F3D 5F A6 82         [ 4]  899 	call ZERO
      009F40 90               [ 4]  900 	ret 
                                    901 
                                    902 ;------------------------------------------
                                    903 ; adjust pointers after **FMOVE** operetion.
                                    904 ; UPDAT-PTR ( cp+ -- )
                                    905 ; cp+ is new CP position after FMOVE 
                                    906 ;-------------------------------------------
      009F41 95 1D                  907 	.word LINK 
                           002027   908 	LINK=.
      009F43 00                     909 	.byte 9
      009F44 02 FF CD 9C AB CD 9C   910 	.ascii "UPDAT-PTR" 
             AB 81
      002031                        911 UPDATPTR:
                                    912 ;reset VP to previous position  
      009F4D 9F 19 03         [ 4]  913 	call EEPVP 
      009F50 45 45 2C         [ 4]  914 	call AT
      009F53 CD 06 2D         [ 4]  915 	call VPP 
      009F53 1D 00 02         [ 4]  916 	call STORE
                                    917 ;update CONTEXT and LAST 
      009F56 90 BE 18         [ 4]  918 	call EEPCP 
      009F59 90 89 FF         [ 4]  919 	call AT
      009F5C CD 9D 12         [ 4]  920 	call DOLIT 
      009F5F 90 85                  921 	.word 2 
      009F61 72 A9 00         [ 4]  922 	call PLUS 
      009F64 02 90 BF         [ 4]  923 	call DUPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009F67 18 81 9F         [ 4]  924 	call CNTXT 
      009F6A 4F 04 45         [ 4]  925 	call STORE
      009F6D 45 43 2C         [ 4]  926 	call LAST
      009F70 CD 04 21         [ 4]  927 	call STORE 
      009F70 1D 00 02         [ 4]  928 	call UPDATLAST 
                                    929 ;update CP 
      009F73 90 BE 18         [ 4]  930 	call CPP 
      009F76 90 89 FF         [ 4]  931 	call STORE
      009F79 CD 9C CA         [ 4]  932 	call UPDATCP 
      009F7C 90               [ 4]  933 	ret 
                                    934 
                                    935 ;-----------------------------
                                    936 ; move interrupt sub-routine
                                    937 ; in flash memory
                                    938 ;----------------------------- 
      009F7D 85 90                  939 	.word LINK 
                           002069   940 	LINK=. 
      009F7F 5C                     941 	.byte 6
      009F80 90 BF 18 81 9F 6B      942 	.ascii "IFMOVE" 
      002070                        943 IFMOVE:
      009F86 07 52 4F         [ 4]  944 	call TFLASH 
      009F89 57 3E 42         [ 4]  945 	CALL AT 
      009F8C 55 46 E3         [ 4]  946 	CALL QBRAN 
      009F8E 20 21                  947 	.word no_move 
      009F8E CD 9B 36         [ 4]  948 	call CPP 
      009F91 A6 80 88         [ 4]  949 	call AT 
      009F94 B4 33 B7         [ 4]  950 	call DUPP ; ( cp cp -- )
      009F97 33 90 AE         [ 4]  951 	call EEPVP 
      009F9A 06 80 92         [ 4]  952 	call AT  ; ( cp cp a )
      009F9D C6 32 90         [ 4]  953 	call TOR 
      009FA0 F7 CD 9C         [ 4]  954 	call RAT ; ( cp cp a -- ) R: a 
      009FA3 77 90 5C         [ 2]  955 	jp FMOVE2 
                                    956 
                                    957 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                   4438 
                                   4439 ;===============================================================
                                   4440 
                           002069  4441 LASTN =	LINK   ;last name defined
                                   4442 
                                   4443 ; application code begin here
      002100                       4444 	.bndry 128 ; align on flash block  
      002100                       4445 app_space: 
                                   4446 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000776 R   |   6 ABOR1      0012C9 R
  6 ABOR2      0012E0 R   |   6 ABORQ      0012C1 R   |   6 ABORT      0012B2 R
  6 ABRTQ      00159D R   |   6 ABSS       00076D R   |   6 ACCEP      001248 R
  6 ACCP1      001251 R   |   6 ACCP2      001277 R   |   6 ACCP3      00127A R
  6 ACCP4      00127C R   |     ADC_AWCR=  00540E     |     ADC_AWCR=  00540F 
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
  6 ADRADJ     000679 R   |     AFR     =  004803     |     AFR0_ADC=  000000 
    AFR1_TIM=  000001     |     AFR2_CCO=  000002     |     AFR3_TIM=  000003 
    AFR4_TIM=  000004     |     AFR5_TIM=  000005     |     AFR6_I2C=  000006 
    AFR7_BEE=  000007     |   6 AFT        001588 R   |   6 AGAIN      0014DE R
  6 AHEAD      00153B R   |   6 ALLOT      0013F1 R   |   6 ANDD       00052B R
    APP_CP  =  004004     |     APP_LAST=  004000     |     APP_RUN =  004002 
    APP_VP  =  004006     |   6 AT         000438 R   |   6 ATEXE      000B64 R
  6 AUTORUN    000127 R   |     AWU_APR =  0050F1     |     AWU_CSR1=  0050F0 
    AWU_TBR =  0050F2     |     B115200 =  000006     |     B19200  =  000003 
    B230400 =  000007     |     B2400   =  000000     |     B38400  =  000004 
    B460800 =  000008     |     B4800   =  000001     |     B57600  =  000005 
    B921600 =  000009     |     B9600   =  000002     |   6 BACK1      0011F0 R
  6 BASE       00059C R   |     BASEE   =  00000A     |     BCNT    =  000001 
  6 BCOMP      001433 R   |   6 BDIGS      000C4B R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00500F 
  6 BEGIN      0014C0 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
  6 BKSLA      001088 R   |   6 BKSP       0011C0 R   |     BKSPP   =  000008 
  6 BLANK      000A33 R   |     BLOCK_SI=  000080     |   6 BRAN       0003FA R
    BTW     =  000001     |   6 BUF2ROW    001F36 R   |   6 BYE        0000B4 R
    CADR    =  000003     |     CALLL   =  0000CD     |     CARRY   =  000028 
  6 CAT        000456 R   |   6 CCOMMA     001415 R   |     CELLL   =  000002 
  6 CELLM      0009B8 R   |   6 CELLP      0009A9 R   |   6 CELLS      0009C7 R
    CFG_GCR =  007F60     |   6 CHAR1      000E78 R   |   6 CHAR2      000E7B R
  6 CHKIVEC    001E53 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
    CLKOPT_E=  000003     |     CLKOPT_P=  000000     |     CLKOPT_P=  000001 
    CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6     |     CLK_CKDI=  000000 
    CLK_CKDI=  000001     |     CLK_CKDI=  000002     |     CLK_CKDI=  000003 
    CLK_CKDI=  000004     |     CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8 
    CLK_ECKR=  0050C1     |     CLK_ECKR=  000000     |     CLK_ECKR=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]

Symbol Table

    CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0     |     CLK_ICKR=  000002 
    CLK_ICKR=  000000     |     CLK_ICKR=  000001     |     CLK_ICKR=  000003 
    CLK_ICKR=  000004     |     CLK_ICKR=  000005     |     CLK_PCKE=  0050C7 
    CLK_PCKE=  000000     |     CLK_PCKE=  000001     |     CLK_PCKE=  000007 
    CLK_PCKE=  000005     |     CLK_PCKE=  000006     |     CLK_PCKE=  000004 
    CLK_PCKE=  000003     |     CLK_PCKE=  0050CA     |     CLK_PCKE=  000003 
    CLK_PCKE=  000002     |     CLK_SWCR=  0050C5     |     CLK_SWCR=  000000 
    CLK_SWCR=  000001     |     CLK_SWCR=  000002     |     CLK_SWCR=  000003 
    CLK_SWIM=  0050CD     |     CLK_SWR =  0050C4     |     CLK_SWR_=  0000B4 
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |   6 CMOV1      000B83 R
  6 CMOV2      000B9B R   |   6 CMOVE      000B7B R   |     CNTDWN  =  000030 
  6 CNTXT      00061F R   |   6 COLD       001995 R   |   6 COLD1      001995 R
  6 COLON      001736 R   |   6 COMMA      0013FE R   |   6 COMPI      001443 R
    COMPO   =  000040     |   6 CONSTANT   0017E0 R   |   6 COUNT      000B17 R
  6 CPP        00063B R   |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
  6 CR         000EA6 R   |   6 CREAT      00177C R   |     CRR     =  00000D 
  6 CSTOR      000445 R   |   6 DAT        000AF7 R   |     DATSTK  =  000680 
  6 DDROP      0006BA R   |   6 DDUP       0006C5 R   |   6 DECIM      000CFB R
  6 DEPTH      000A82 R   |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  6 DGTQ1      000D40 R   |   6 DI         0000C2 R   |   6 DIG        000C74 R
  6 DIGIT      000C0F R   |   6 DIGS       000C85 R   |   6 DIGS1      000C85 R
  6 DIGS2      000C92 R   |   6 DIGTQ      000D0F R   |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   6 DN1        000734 R   |   6 DNEGA      000717 R
  6 DOCONST    00180A R   |   6 DOLIT      0003B0 R   |   6 DONXT      0003C4 R
  6 DOSTR      000EBC R   |   6 DOT        000F41 R   |   6 DOT1       000F57 R
  6 DOTI1      00192C R   |   6 DOTID      001916 R   |   6 DOTO1      001355 R
  6 DOTOK      00133B R   |   6 DOTPR      00106A R   |   6 DOTQ       0015B7 R
  6 DOTQP      000EE5 R   |   6 DOTR       000EF3 R   |   6 DOTS       0018B8 R
  6 DOTS1      0018C3 R   |   6 DOTS2      0018CC R   |   6 DOVAR      00058C R
  6 DROP       0004D5 R   |   6 DSTOR      000AD1 R   |   6 DUMP       00186E R
  6 DUMP1      001885 R   |   6 DUMP3      0018A7 R   |   6 DUMPP      00183D R
  6 DUPP       0004DF R   |   6 EDIGS      000CB0 R   |   6 EEPCP      001B03 R
  6 EEPLAST    001ADE R   |   6 EEPROM     001ACA R   |     EEPROM_B=  004000 
    EEPROM_E=  0043FF     |     EEPROM_S=  000400     |   6 EEPRUN     001AF1 R
  6 EEPVP      001B15 R   |   6 EE_CCOMM   001EF0 R   |   6 EE_COMMA   001ED3 R
  6 EE_CSTOR   001C4A R   |   6 EE_STORE   001C92 R   |   6 EI         0000BB R
  6 ELSEE      001516 R   |   6 EMIT       00039A R   |   6 ENEPER     001A44 R
  6 EQ1        000791 R   |   6 EQUAL      00077B R   |   6 ERASE      000BDD R
    ERR     =  00001B     |   6 EVAL       00137E R   |   6 EVAL1      00137E R
  6 EVAL2      00139A R   |   6 EXE1       000B72 R   |   6 EXECU      00040A R
  6 EXIT       00041A R   |     EXT     =  000000     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |   6 EXTRC      000C37 R   |     FHSE    =  F42400 
    FHSE_K  =  003E80     |     FHSE_M  =  000010     |   6 FILL       000BAA R
  6 FILL1      000BC7 R   |   6 FILL2      000BD0 R   |   6 FIND       00111C R
  6 FIND1      00113A R   |   6 FIND2      001168 R   |   6 FIND3      001174 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]

Symbol Table

  6 FIND4      001188 R   |   6 FIND5      001195 R   |   6 FIND6      001179 R
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
  6 FMOVE      001FA9 R   |   6 FMOVE2     001FD1 R   |   6 FOR        001493 R
  6 FORGET     000154 R   |   6 FORGET1    000183 R   |   6 FORGET2    000209 R
  6 FORGET4    000212 R   |   6 FORGET6    0001CB R   |   6 FREEVAR    00021F R
  6 FREEVAR4   000255 R   |     GPIO_BAS=  005000     |     GPIO_SIZ=  000005 
  6 HERE       000B2E R   |   6 HEX        000CE6 R   |   6 HI         001968 R
  6 HLD        00060C R   |   6 HOLD       000C5B R   |     HSECNT  =  004809 
    I2C_CCRH=  00521C     |     I2C_CCRH=  000080     |     I2C_CCRH=  0000C0 
    I2C_CCRH=  000080     |     I2C_CCRH=  000000     |     I2C_CCRH=  000001 
    I2C_CCRH=  000000     |     I2C_CCRL=  00521B     |     I2C_CCRL=  00001A 
    I2C_CCRL=  000002     |     I2C_CCRL=  00000D     |     I2C_CCRL=  000050 
    I2C_CCRL=  000090     |     I2C_CCRL=  0000A0     |     I2C_CR1 =  005210 
    I2C_CR1_=  000006     |     I2C_CR1_=  000007     |     I2C_CR1_=  000000 
    I2C_CR2 =  005211     |     I2C_CR2_=  000002     |     I2C_CR2_=  000003 
    I2C_CR2_=  000000     |     I2C_CR2_=  000001     |     I2C_CR2_=  000007 
    I2C_DR  =  005216     |     I2C_FREQ=  005212     |     I2C_ITR =  00521A 
    I2C_ITR_=  000002     |     I2C_ITR_=  000000     |     I2C_ITR_=  000001 
    I2C_OARH=  005214     |     I2C_OARH=  000001     |     I2C_OARH=  000002 
    I2C_OARH=  000006     |     I2C_OARH=  000007     |     I2C_OARL=  005213 
    I2C_OARL=  000000     |     I2C_OAR_=  000813     |     I2C_OAR_=  000009 
    I2C_PECR=  00521E     |     I2C_READ=  000001     |     I2C_SR1 =  005217 
    I2C_SR1_=  000003     |     I2C_SR1_=  000001     |     I2C_SR1_=  000002 
    I2C_SR1_=  000006     |     I2C_SR1_=  000000     |     I2C_SR1_=  000004 
    I2C_SR1_=  000007     |     I2C_SR2 =  005218     |     I2C_SR2_=  000002 
    I2C_SR2_=  000001     |     I2C_SR2_=  000000     |     I2C_SR2_=  000003 
    I2C_SR2_=  000005     |     I2C_SR3 =  005219     |     I2C_SR3_=  000001 
    I2C_SR3_=  000007     |     I2C_SR3_=  000004     |     I2C_SR3_=  000000 
    I2C_SR3_=  000002     |     I2C_TRIS=  00521D     |     I2C_TRIS=  000005 
    I2C_TRIS=  000005     |     I2C_TRIS=  000005     |     I2C_TRIS=  000011 
    I2C_TRIS=  000011     |     I2C_TRIS=  000011     |     I2C_WRIT=  000000 
  6 ICOLON     001747 R   |   6 IFETCH     0014B1 R   |   6 IFF        0014EE R
  6 IFMOVE     002070 R   |     IMEDD   =  000080     |   6 IMMED      001759 R
  6 INCH       00038E R   |   6 INC_PTR1   001BF7 R   |   6 INITOFS    00170F R
  6 INN        0005BA R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_PU=  000001     |   6 INTE1      00131D R
  6 INTER      0012F3 R   |     INT_ADC1=  000016     |     INT_AWU =  000001 
    INT_CLK =  000002     |     INT_EXTI=  000003     |     INT_EXTI=  000004 
    INT_EXTI=  000005     |     INT_EXTI=  000006     |     INT_EXTI=  000007 
    INT_FLAS=  000018     |     INT_I2C =  000013     |     INT_RES1=  000008 
    INT_RES2=  000009     |     INT_RES3=  000011     |     INT_RES4=  000012 
    INT_SPI =  00000A     |     INT_TIM1=  00000C     |     INT_TIM1=  00000B 
    INT_TIM2=  00000E     |     INT_TIM2=  00000D     |     INT_TIM3=  000010 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]

Symbol Table

    INT_TIM3=  00000F     |     INT_TIM4=  000017     |     INT_TLI =  000000 
    INT_UART=  000015     |     INT_UART=  000014     |     INT_VECT=  008060 
    INT_VECT=  00800C     |     INT_VECT=  008010     |     INT_VECT=  008014 
    INT_VECT=  008018     |     INT_VECT=  00801C     |     INT_VECT=  008020 
    INT_VECT=  008024     |     INT_VECT=  008068     |     INT_VECT=  008054 
    INT_VECT=  008000     |     INT_VECT=  008030     |     INT_VECT=  008038 
    INT_VECT=  008034     |     INT_VECT=  008040     |     INT_VECT=  00803C 
    INT_VECT=  008048     |     INT_VECT=  008044     |     INT_VECT=  008064 
    INT_VECT=  008008     |     INT_VECT=  008004     |     INT_VECT=  00805C 
    INT_VECT=  008058     |   6 INVER      0006F4 R   |     IPR0    =  000002 
    IPR1    =  000001     |     IPR2    =  000000     |     IPR3    =  000003 
    IPR_MASK=  000003     |     IRET_COD=  000080     |   6 ISEMI      0016A4 R
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   6 JSRC       0016F9 R
  6 KEY        000E26 R   |   6 KTAP       00120D R   |   6 KTAP1      001230 R
  6 KTAP2      001233 R   |   6 LAST       00064B R   |   6 LASTN   =  002069 R
  6 LBRAC      00132A R   |     LD1_BIT =  000000     |     LD1_MASK=  000001 
    LD1_PORT=  00500F     |   6 LESS       0007B8 R   |     LF      =  00000A 
  6 LINK    =  002069 R   |   6 LITER      001465 R   |   6 LN2S       001AA0 R
  6 LOG2S      001A8A R   |   6 LSHIFT     0009F2 R   |   6 LSHIFT1    0009FB R
  6 LSHIFT4    000A03 R   |   6 LT1        0007CE R   |     MASKK   =  001F7F 
  6 MAX        0007D8 R   |   6 MAX1       0007EB R   |   6 MIN        0007F5 R
  6 MIN1       000808 R   |     MISCOPT =  004805     |     MISCOPT_=  000004 
    MISCOPT_=  000002     |     MISCOPT_=  000003     |     MISCOPT_=  000000 
    MISCOPT_=  000001     |   6 MMOD1      0008AB R   |   6 MMOD2      0008BF R
  6 MMOD3      0008D6 R   |   6 MMSM1      000852 R   |   6 MMSM2      000866 R
  6 MMSM3      000868 R   |   6 MMSM4      000870 R   |   6 MODD       0008F0 R
  6 MONE       000A59 R   |     MS      =  00002E     |   6 MSEC       0002CA R
  6 MSMOD      00088E R   |   6 MSTA1      000981 R   |   6 MSTAR      00095E R
    NAFR    =  004804     |   6 NAMEQ      0011B5 R   |   6 NAMET      0010C6 R
    NCLKOPT =  004808     |   6 NEGAT      000705 R   |   6 NEX1       0003D1 R
  6 NEXT       0014A2 R   |     NHSECNT =  00480A     |     NMISCOPT=  004806 
    NMISCOPT=  FFFFFFFB     |     NMISCOPT=  FFFFFFFD     |     NMISCOPT=  FFFFFFFC 
    NMISCOPT=  FFFFFFFF     |     NMISCOPT=  FFFFFFFE     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPTBL  =  00487F     |   6 NTIB       0005CA R
    NUBC    =  004802     |   6 NUFQ       000E3C R   |   6 NUFQ1      000E55 R
  6 NUMBQ      000D53 R   |   6 NUMQ1      000D87 R   |   6 NUMQ2      000DB8 R
  6 NUMQ3      000DFA R   |   6 NUMQ4      000DFF R   |   6 NUMQ5      000E0E R
  6 NUMQ6      000E11 R   |   6 NonHandl   000000 R   |   6 OFFSET     000670 R
    OFS     =  000005     |   6 ONE        000A4B R   |   6 ONEM       0009E1 R
  6 ONEP       0009D4 R   |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPTBL   =  00487E     |     OPTIMIZE=  000001     |     OPTION_B=  004800 
    OPTION_E=  00487F     |   6 ORIG       000047 R   |   6 ORR        00053F R
  6 OUTPUT     00039F R   |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |   6 OVER       000509 R
  6 OVERT      001672 R   |     PA      =  000000     |   6 PACKS      000BEE R
  6 PAD        000B3F R   |   6 PAREN      001079 R   |   6 PARS       000F72 R
  6 PARS1      000F9D R   |   6 PARS2      000FC8 R   |   6 PARS3      000FCB R
  6 PARS4      000FD4 R   |   6 PARS5      000FF7 R   |   6 PARS6      00100C R
  6 PARS7      00101B R   |   6 PARS8      00102A R   |   6 PARSE      00103B R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]

Symbol Table

  6 PAUSE      0002DA R   |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      001850 R   |   6 PDUM2      001861 R
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |   6 PICK       000A99 R
  6 PII        001A03 R   |     PIN0    =  000000     |     PIN1    =  000001 
    PIN2    =  000002     |     PIN3    =  000003     |     PIN4    =  000004 
    PIN5    =  000005     |     PIN6    =  000006     |     PIN7    =  000007 
  6 PLUS       0006DA R   |   6 PNAM1      001627 R   |   6 PRESE      0013A9 R
    PROD1   =  000022     |     PROD2   =  000024     |     PROD3   =  000026 
  6 PROTECTE   0001FB R   |   6 PSTO       001AB6 R   |   6 PSTOR      000AB0 R
    PTR16   =  000032     |     PTR8    =  000033     |   6 QBRAN      0003E3 R
  6 QDUP       000689 R   |   6 QDUP1      000693 R   |   6 QKEY       00037C R
  6 QSTAC      001361 R   |   6 QUERY      00128D R   |   6 QUEST      000F64 R
  6 QUIT       0013C6 R   |   6 QUIT1      0013CE R   |   6 QUIT2      0013D1 R
  6 RAM2EE     001F61 R   |     RAMBASE =  000000     |   6 RAMLAST    00065E R
    RAM_BASE=  000000     |     RAM_END =  0007FF     |     RAM_SIZE=  000800 
  6 RANDOM     000278 R   |   6 RAT        00049C R   |   6 RBRAC      0016E6 R
  6 REPEA      00156B R   |   6 RFREE      001F48 R   |   6 RFROM      000489 R
    ROP     =  004800     |   6 ROT        00069A R   |   6 ROW2BUF    001F0E R
    ROWBUFF =  000680     |     RP0     =  00002C     |   6 RPAT       000466 R
    RPP     =  0007FF     |   6 RPSTO      000473 R   |   6 RSHIFT     000A0E R
  6 RSHIFT1    000A17 R   |   6 RSHIFT4    000A1F R   |     RST_SR  =  0050B3 
  6 RT12_2     001A73 R   |   6 SAME1      0010E4 R   |   6 SAME2      00110D R
  6 SAMEQ      0010DC R   |   6 SCOM1      00165C R   |   6 SCOM2      00165F R
  6 SCOMP      00163E R   |   6 SEED       00025F R   |     SEEDX   =  000035 
    SEEDY   =  000037     |   6 SEMIS      001682 R   |   6 SETISP     0000CE R
  6 SET_RAML   0017C9 R   |     SFR_BASE=  005000     |     SFR_END =  0057FF 
  6 SIGN       000C9A R   |   6 SIGN1      000CAA R   |   6 SLASH      0008FA R
  6 SLMOD      0008DE R   |   6 SNAME      0015F1 R   |     SP0     =  00002A 
  6 SPACE      000E5E R   |   6 SPACS      000E6D R   |   6 SPAT       0004BF R
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SPP     =  000680 
    SPSAVE  =  000001     |   6 SPSTO      0004CC R   |   6 SQRT10     001A5C R
  6 SQRT2      001A1A R   |   6 SQRT3      001A31 R   |   6 SSMOD      00098A R
    SSP     =  000001     |     STACK   =  0007FF     |   6 STAR       000953 R
  6 STASL      00099B R   |   6 STOD       00073C R   |   6 STORE      000421 R
  6 STR        000CC8 R   |   6 STRCQ      001473 R   |   6 STRQ       0015AA R
  6 STRQP      000EDB R   |   6 SUBB       000753 R   |   6 SWAPP      0004EF R
    SWIM_CSR=  007F80     |   6 TAP        0011F7 R   |   6 TBOOT      001989 R
  6 TBUF       0005DA R   |     TBUFFBAS=  000680     |   6 TCHAR      000A6A R
  6 TEMP       0005AB R   |   6 TEVAL      0005FD R   |   6 TFLASH     0005EC R
  6 THENN      001503 R   |   6 TIB        000B50 R   |     TIBB    =  000700 
    TIBBASE =  000700     |     TIC     =  000027     |   6 TICK       0013DD R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_ARR=  005262     |     TIM1_ARR=  005263     |     TIM1_BKR=  00526D 
    TIM1_CCE=  00525C     |     TIM1_CCE=  00525D     |     TIM1_CCM=  005258 
    TIM1_CCM=  000000     |     TIM1_CCM=  000001     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000003     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000003     |     TIM1_CCM=  005259 
    TIM1_CCM=  000000     |     TIM1_CCM=  000001     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000003     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000003     |     TIM1_CCM=  00525A 
    TIM1_CCM=  000000     |     TIM1_CCM=  000001     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000003     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000003     |     TIM1_CCM=  00525B 
    TIM1_CCM=  000000     |     TIM1_CCM=  000001     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000003     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000003     |     TIM1_CCR=  005265 
    TIM1_CCR=  005266     |     TIM1_CCR=  005267     |     TIM1_CCR=  005268 
    TIM1_CCR=  005269     |     TIM1_CCR=  00526A     |     TIM1_CCR=  00526B 
    TIM1_CCR=  00526C     |     TIM1_CNT=  00525E     |     TIM1_CNT=  00525F 
    TIM1_CR1=  005250     |     TIM1_CR2=  005251     |     TIM1_CR2=  000000 
    TIM1_CR2=  000002     |     TIM1_CR2=  000004     |     TIM1_CR2=  000005 
    TIM1_CR2=  000006     |     TIM1_DTR=  00526E     |     TIM1_EGR=  005257 
    TIM1_EGR=  000007     |     TIM1_EGR=  000001     |     TIM1_EGR=  000002 
    TIM1_EGR=  000003     |     TIM1_EGR=  000004     |     TIM1_EGR=  000005 
    TIM1_EGR=  000006     |     TIM1_EGR=  000000     |     TIM1_ETR=  005253 
    TIM1_ETR=  000006     |     TIM1_ETR=  000000     |     TIM1_ETR=  000001 
    TIM1_ETR=  000002     |     TIM1_ETR=  000003     |     TIM1_ETR=  000007 
    TIM1_ETR=  000004     |     TIM1_ETR=  000005     |     TIM1_IER=  005254 
    TIM1_IER=  000007     |     TIM1_IER=  000001     |     TIM1_IER=  000002 
    TIM1_IER=  000003     |     TIM1_IER=  000004     |     TIM1_IER=  000005 
    TIM1_IER=  000006     |     TIM1_IER=  000000     |     TIM1_OIS=  00526F 
    TIM1_PSC=  005260     |     TIM1_PSC=  005261     |     TIM1_RCR=  005264 
    TIM1_SMC=  005252     |     TIM1_SMC=  000007     |     TIM1_SMC=  000000 
    TIM1_SMC=  000001     |     TIM1_SMC=  000002     |     TIM1_SMC=  000004 
    TIM1_SMC=  000005     |     TIM1_SMC=  000006     |     TIM1_SR1=  005255 
    TIM1_SR1=  000007     |     TIM1_SR1=  000001     |     TIM1_SR1=  000002 
    TIM1_SR1=  000003     |     TIM1_SR1=  000004     |     TIM1_SR1=  000005 
    TIM1_SR1=  000006     |     TIM1_SR1=  000000     |     TIM1_SR2=  005256 
    TIM1_SR2=  000001     |     TIM1_SR2=  000002     |     TIM1_SR2=  000003 
    TIM1_SR2=  000004     |     TIM2_ARR=  00530D     |     TIM2_ARR=  00530E 
    TIM2_CCE=  005308     |     TIM2_CCE=  005309     |     TIM2_CCM=  005305 
    TIM2_CCM=  005306     |     TIM2_CCM=  005307     |     TIM2_CCR=  00530F 
    TIM2_CCR=  005310     |     TIM2_CCR=  005311     |     TIM2_CCR=  005312 
    TIM2_CCR=  005313     |     TIM2_CCR=  005314     |     TIM2_CNT=  00530A 
    TIM2_CNT=  00530B     |     TIM2_CR1=  005300     |     TIM2_EGR=  005304 
    TIM2_IER=  005301     |     TIM2_PSC=  00530C     |     TIM2_SR1=  005302 
    TIM2_SR2=  005303     |     TIM3_ARR=  00532B     |     TIM3_ARR=  00532C 
    TIM3_CCE=  005327     |     TIM3_CCE=  000000     |     TIM3_CCE=  000001 
    TIM3_CCE=  000004     |     TIM3_CCE=  000005     |     TIM3_CCE=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]

Symbol Table

    TIM3_CCE=  000001     |     TIM3_CCM=  005325     |     TIM3_CCM=  005326 
    TIM3_CCM=  000000     |     TIM3_CCM=  000004     |     TIM3_CCM=  000003 
    TIM3_CCR=  00532D     |     TIM3_CCR=  00532E     |     TIM3_CCR=  00532F 
    TIM3_CCR=  005330     |     TIM3_CNT=  005328     |     TIM3_CNT=  005329 
    TIM3_CR1=  005320     |     TIM3_CR1=  000007     |     TIM3_CR1=  000000 
    TIM3_CR1=  000003     |     TIM3_CR1=  000001     |     TIM3_CR1=  000002 
    TIM3_EGR=  005324     |     TIM3_IER=  005321     |     TIM3_PSC=  00532A 
    TIM3_SR1=  005322     |     TIM3_SR2=  005323     |     TIM4_ARR=  005346 
    TIM4_CNT=  005344     |     TIM4_CR1=  005340     |     TIM4_CR1=  000007 
    TIM4_CR1=  000000     |     TIM4_CR1=  000003     |     TIM4_CR1=  000001 
    TIM4_CR1=  000002     |     TIM4_EGR=  005343     |     TIM4_EGR=  000000 
    TIM4_IER=  005341     |     TIM4_IER=  000000     |     TIM4_PSC=  005345 
    TIM4_PSC=  000000     |     TIM4_PSC=  000007     |     TIM4_PSC=  000004 
    TIM4_PSC=  000001     |     TIM4_PSC=  000005     |     TIM4_PSC=  000002 
    TIM4_PSC=  000006     |     TIM4_PSC=  000003     |     TIM4_PSC=  000000 
    TIM4_PSC=  000001     |     TIM4_PSC=  000002     |     TIM4_SR =  005342 
    TIM4_SR_=  000000     |   6 TIMEOUTQ   00030A R   |   6 TIMER      0002F4 R
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |   6 TNAM2      0018E6 R
  6 TNAM3      001904 R   |   6 TNAM4      00190A R   |   6 TNAME      0018E3 R
  6 TOFLASH    00032F R   |   6 TOKEN      0010B8 R   |   6 TOR        0004A8 R
  6 TORAM      00036F R   |     TRUEE   =  00FFFF     |   6 TWOSL      000A26 R
  6 TYPE1      000E8D R   |   6 TYPE2      000E99 R   |   6 TYPES      000E88 R
  6 Timer4Ha   000005 R   |     UART2_BR=  005242     |     UART2_BR=  005243 
    UART2_CR=  005244     |     UART2_CR=  005245     |     UART2_CR=  005246 
    UART2_CR=  005247     |     UART2_CR=  005248     |     UART2_CR=  004249 
    UART2_DR=  005241     |     UART2_GT=  00524A     |     UART2_PO=  00500F 
    UART2_PS=  00524B     |     UART2_RX=  000006     |     UART2_SR=  005240 
    UART2_TX=  000005     |     UART_CR1=  000004     |     UART_CR1=  000002 
    UART_CR1=  000000     |     UART_CR1=  000001     |     UART_CR1=  000007 
    UART_CR1=  000006     |     UART_CR1=  000005     |     UART_CR1=  000003 
    UART_CR2=  000004     |     UART_CR2=  000002     |     UART_CR2=  000005 
    UART_CR2=  000001     |     UART_CR2=  000000     |     UART_CR2=  000006 
    UART_CR2=  000003     |     UART_CR2=  000007     |     UART_CR3=  000003 
    UART_CR3=  000001     |     UART_CR3=  000002     |     UART_CR3=  000000 
    UART_CR3=  000006     |     UART_CR3=  000004     |     UART_CR3=  000005 
    UART_CR4=  000000     |     UART_CR4=  000001     |     UART_CR4=  000002 
    UART_CR4=  000003     |     UART_CR4=  000004     |     UART_CR4=  000006 
    UART_CR4=  000005     |     UART_CR5=  000003     |     UART_CR5=  000001 
    UART_CR5=  000002     |     UART_CR5=  000004     |     UART_CR5=  000005 
    UART_SR_=  000001     |     UART_SR_=  000004     |     UART_SR_=  000002 
    UART_SR_=  000003     |     UART_SR_=  000000     |     UART_SR_=  000005 
    UART_SR_=  000006     |     UART_SR_=  000007     |     UBASE   =  000006 
    UBC     =  004801     |     UCNTXT  =  000014     |     UCP     =  000018 
    UCTIB   =  00000C     |     UD1     =  000001     |     UD2     =  000002 
    UD3     =  000003     |     UD4     =  000004     |   6 UDOT       000F2E R
  6 UDOTR      000F0E R   |   6 UEND       000045 R   |     UHLD    =  000012 
    UINN    =  00000A     |     UINTER  =  000010     |     ULAST   =  00001A 
  6 ULES1      0007B0 R   |   6 ULESS      00079A R   |   6 UMMOD      000830 R
  6 UMSTA      000909 R   |   6 UNIQ1      0015E8 R   |   6 UNIQU      0015C9 R
  6 UNTIL      0014CB R   |     UOFFSET =  00001C     |   6 UPDATCP    001B54 R
  6 UPDATLAS   001B2B R   |   6 UPDATPTR   002031 R   |   6 UPDATRUN   001B43 R
  6 UPDATVP    001B6B R   |   6 UPL1       000580 R   |   6 UPLUS      000569 R
    UPP     =  000006     |     URLAST  =  000020     |     UTFLASH =  00001E 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]

Symbol Table

    UTIB    =  00000E     |     UTMP    =  000008     |   6 UTYP1      001820 R
  6 UTYP2      00182F R   |   6 UTYPE      00181B R   |     UVP     =  000016 
  6 UZERO      00002B R   |   6 VARIA      001796 R   |     VAR_BASE=  000080 
    VAR_TOP =  0007BF     |     VER     =  000003     |   6 VPP        00062D R
    VSIZE   =  000006     |     WANT_DEB=  000000     |     WANT_MAT=  000001 
    WANT_SEE=  000000     |   6 WHILE      001551 R   |   6 WITHI      000815 R
  6 WORDD      0010A4 R   |   6 WORDS      001940 R   |   6 WORS1      001946 R
  6 WORS2      001962 R   |   6 WR_BYTE    001C0E R   |   6 WR_ROW     001D5A R
  6 WR_WORD    001C2B R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    X4_FLASH=  00BFFF     |     X4_FLASH=  004000     |     X6_FLASH=  00FFFF 
    X6_FLASH=  008000     |   6 XORR       000554 R   |     XTEMP   =  000022 
    YTEMP   =  000024     |   6 ZERO       000A40 R   |   6 ZL1        000521 R
  6 ZLESS      000518 R   |   6 app_spac   002100 R   |   6 block_er   001CC4 R
  6 clear_ra   000019 R   |   6 clock_in   000062 R   |   6 copy_buf   001D17 R
  6 copy_buf   001D35 R   |   6 copy_pro   001D35 R   |     da      =  000002 
    db      =  000003     |     dc      =  000000     |     dd      =  000001 
  6 erase_fl   001CE0 R   |   6 fmove_do   00201A R   |   6 lock       001BE2 R
  6 main       000016 R   |   6 next_row   001FDA R   |   6 no_move    002021 R
  6 pristine   001DAA R   |   6 proceed_   001CE3 R   |   6 reboot     000321 R
  6 reset_ve   001E0E R   |   6 row_eras   001CA7 R   |   6 row_eras   001CF4 R
  6 row_eras   001D17 R   |   6 set_opti   001D84 R   |   6 set_vect   001EA2 R
  6 uart2_in   000074 R   |   6 unlock     001BBE R   |   6 unlock_e   001B80 R
  6 unlock_f   001B9F R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   2100   flags    0

