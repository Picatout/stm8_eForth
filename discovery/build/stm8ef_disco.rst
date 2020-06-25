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
                                    178 
                                    179 ;**********************************************************
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    180         .area DATA (ABS)
      000000                        181         .org RAMBASE 
                                    182 ;**********************************************************
                                    183 
                                    184 ;**********************************************************
                                    185         .area SSEG (ABS) ; STACK
      001700                        186         .org 0x1700
      001700                        187         .ds 256 
                                    188 ; space for DATSTK,TIB and STACK         
                                    189 ;**********************************************************
                                    190 
                                    191 ;**********************************************************
                                    192         .area HOME ; vectors table
                                    193 ;**********************************************************
      008000 82 00 80 9A            194 	int main	        ; reset
                           000001   195 DEBUG=1
                           000001   196 .if DEBUG
      008004 82 00 80 80            197         int TrapHandler ;
                           000000   198 .else
                                    199 	int NonHandledInterrupt	; trap
                                    200 .endif 
      008008 82 00 80 84            201 	int NonHandledInterrupt	; irq0 TLI
      00800C 82 00 80 84            202 	int NonHandledInterrupt	; irq1 AWU 
      008010 82 00 80 84            203 	int NonHandledInterrupt	; irq2 CLK 
      008014 82 00 80 84            204 	int NonHandledInterrupt	; irq3 EXTI0
      008018 82 00 80 84            205 	int NonHandledInterrupt	; irq4 EXTI1 
      00801C 82 00 80 84            206 	int NonHandledInterrupt	; irq5 EXTI2 
      008020 82 00 80 84            207 	int NonHandledInterrupt	; irq6 EXTI3
      008024 82 00 80 84            208 	int NonHandledInterrupt	; irq7 EXTI4 
      008028 82 00 80 84            209 	int NonHandledInterrupt	; irq8 reserved
      00802C 82 00 80 84            210 	int NonHandledInterrupt	; irq9 reserved 
      008030 82 00 80 84            211 	int NonHandledInterrupt	; irq10 SPI
      008034 82 00 80 84            212 	int NonHandledInterrupt	; irq11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 84            213 	int NonHandledInterrupt	; irq12 TIM1 capture/compare
      00803C 82 00 80 84            214 	int NonHandledInterrupt	; irq13 TIM2 update/overflow
      008040 82 00 80 84            215 	int NonHandledInterrupt	; irq14 TIM2 capture/compare 
      008044 82 00 80 84            216 	int NonHandledInterrupt	; irq15 TIM3 update/overflow
      008048 82 00 80 84            217 	int NonHandledInterrupt	; irq16 TIM3 capture/compare 
      00804C 82 00 80 84            218 	int NonHandledInterrupt	; irq17 reserved
      008050 82 00 80 84            219 	int NonHandledInterrupt	; irq18 reserved 
      008054 82 00 80 84            220 	int NonHandledInterrupt	; irq19 I2C interrupt
      008058 82 00 80 84            221 	int NonHandledInterrupt	; irq20 UART2 tx complete  
      00805C 82 00 80 84            222 	int NonHandledInterrupt	; irq21 UART2 rx buffer full
      008060 82 00 80 84            223 	int NonHandledInterrupt	; irq22 ADC1 end of conversion/analog watchdog interrupt
      008064 82 00 80 89            224 	int Timer4Handler	; irq23 TIM4 update/overflow
      008068 82 00 80 84            225 	int NonHandledInterrupt	; irq24 FLASH EOP/WR_PG_DIS 
      00806C 82 00 80 84            226 	int NonHandledInterrupt	; irq25 resserved
      008070 82 00 80 84            227 	int NonHandledInterrupt	; irq26 reserved 
      008074 82 00 80 84            228 	int NonHandledInterrupt	; irq27 reserved
      008078 82 00 80 84            229 	int NonHandledInterrupt	; irq28 reserved 
      00807C 82 00 80 84            230 	int NonHandledInterrupt	; irq29 reserved 
                                    231 
                                    232 ;**********************************************************
                                    233         .area CODE
                                    234 ;**********************************************************
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    235 
                           000001   236 .if DEBUG 
      008080                        237 TrapHandler:
      008080 CD 99 3C         [ 4]  238         call DOTS 
      008083 80               [11]  239         iret 
                                    240 .endif 
                                    241 
                                    242 
                                    243 ; non handled interrupt reset MCU
      008084                        244 NonHandledInterrupt:
      008084 A6 80            [ 1]  245         ld a, #0x80
      008086 C7 50 D1         [ 1]  246         ld WWDG_CR,a ; WWDG_CR used to reset mcu
                                    247 	;iret
                                    248 
                                    249 ; used for milliseconds counter 
                                    250 ; MS is 16 bits counter 
      008089                        251 Timer4Handler:
      008089 72 5F 53 42      [ 1]  252 	clr TIM4_SR 
      00808D BE 2E            [ 2]  253         ldw x,MS 
      00808F 5C               [ 2]  254         incw x 
      008090 BF 2E            [ 2]  255         ldw MS,x
      008092 BE 30            [ 2]  256         ldw x,CNTDWN 
      008094 27 03            [ 1]  257         jreq 1$
      008096 5A               [ 2]  258         decw x 
      008097 BF 30            [ 2]  259         ldw CNTDWN,x 
      008099                        260 1$:         
      008099 80               [11]  261         iret 
                                    262 
                                    263 
                                    264 ;; Main entry points and COLD start data
      00809A                        265 main:
                                    266 ; clear all RAM
      00809A AE 00 00         [ 2]  267 	ldw X,#RAMBASE
      00809D                        268 clear_ram0:
      00809D 7F               [ 1]  269 	clr (X)
      00809E 5C               [ 2]  270 	incw X
      00809F A3 07 FF         [ 2]  271 	cpw X,#RAM_END
      0080A2 23 F9            [ 2]  272 	jrule clear_ram0
      0080A4 AE 07 FF         [ 2]  273         ldw x,#RPP
      0080A7 94               [ 1]  274         ldw sp,x
                                    275 ; set SEEDX and SEEDY to 1 
      0080A8 3C 36            [ 1]  276         inc SEEDX+1 
      0080AA 3C 38            [ 1]  277         inc SEEDY+1          
      0080AC CC 80 CB         [ 2]  278 	jp ORIG
                                    279 
                                    280 ; COLD initialize these variables.
      0080AF                        281 UZERO:
      0080AF 00 0A                  282         .word      BASEE   ;BASE
      0080B1 00 00                  283         .word      0       ;tmp
      0080B3 00 00                  284         .word      0       ;>IN
      0080B5 00 00                  285         .word      0       ;#TIB
      0080B7 07 00                  286         .word      TIBB    ;TIB
      0080B9 93 77                  287         .word      INTER   ;'EVAL
      0080BB 00 00                  288         .word      0       ;HLD
      0080BD A0 ED                  289         .word      LASTN  ;CNTXT pointer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      0080BF 00 80                  290         .word      VAR_BASE   ;variables free space pointer 
      0080C1 A1 80                  291         .word      app_space ; FLASH free space pointer 
      0080C3 A0 ED                  292         .word      LASTN   ;LAST
      0080C5 00 00                  293         .word      0        ; OFFSET 
      0080C7 00 00                  294         .word      0       ; TFLASH
                                    295 ;       .word      0       ; URLAST   
      0080C9 00 00                  296 UEND:   .word      0
                                    297 
      0080CB                        298 ORIG:   
                                    299 ; initialize SP
      0080CB AE 07 FF         [ 2]  300         LDW     X,#STACK  ;initialize return stack
      0080CE 94               [ 1]  301         LDW     SP,X
      0080CF BF 2C            [ 2]  302         LDW     RP0,X
      0080D1 AE 06 80         [ 2]  303         LDW     X,#DATSTK ;initialize data stack
      0080D4 BF 2A            [ 2]  304         LDW     SP0,X
                                    305 ; initialize PD_0 as output to control LED2
                                    306 ; added by Picatout 
      0080D6 72 10 50 12      [ 1]  307         bset PD_CR1,#LD1_BIT
      0080DA 72 10 50 13      [ 1]  308         bset PD_CR2,#LD1_BIT
      0080DE 72 10 50 11      [ 1]  309         bset PD_DDR,#LD1_BIT
      000062                        310         _ledoff
      0080E2 72 10 50 0F      [ 1]    1         bset PD_ODR,#LD1_BIT
                                    311 ; initialize clock to HSE
                                    312 ; no divisor 16Mhz 
                                    313 ; Added by Picatout 
      0080E6                        314 clock_init:
      0080E6 72 5F 50 C6      [ 1]  315         clr CLK_CKDIVR
      0080EA 72 12 50 C5      [ 1]  316 	bset CLK_SWCR,#CLK_SWCR_SWEN
      0080EE A6 B4            [ 1]  317 	ld a,#CLK_SWR_HSE
      0080F0 C7 50 C4         [ 1]  318 	ld CLK_SWR,a
      0080F3 C1 50 C3         [ 1]  319 1$:	cp a,CLK_CMSR
      0080F6 26 FB            [ 1]  320 	jrne 1$
                                    321         
                                    322 ; initialize UART1, 115200 8N1
      0080F8                        323 uart2_init:
      0080F8 72 16 50 C7      [ 1]  324 	bset CLK_PCKENR1,#CLK_PCKENR1_UART2
                                    325 	; configure tx pin
      0080FC 72 1A 50 11      [ 1]  326 	bset PD_DDR,#UART2_TX_PIN ; tx pin
      008100 72 1A 50 12      [ 1]  327 	bset PD_CR1,#UART2_TX_PIN ; push-pull output
      008104 72 1A 50 13      [ 1]  328 	bset PD_CR2,#UART2_TX_PIN ; fast output
                                    329 	; baud rate 115200 Fmaster=8Mhz  
      008108 35 0B 52 43      [ 1]  330 	mov UART2_BRR2,#0x0b ; must be loaded first
      00810C 35 08 52 42      [ 1]  331 	mov UART2_BRR1,#0x8
      008110 35 0C 52 45      [ 1]  332 	mov UART2_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                                    333 ; initialize timer4, used for millisecond interrupt  
      008114 35 07 53 45      [ 1]  334 	mov TIM4_PSCR,#7 ; prescale 128  
      008118 35 7D 53 46      [ 1]  335 	mov TIM4_ARR,#125 ; set for 1msec.
      00811C 35 05 53 40      [ 1]  336 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008120 72 10 53 41      [ 1]  337 	bset TIM4_IER,#TIM4_IER_UIE 
                                    338 ; set TIM4 interrupt priority to highest
      008124 A6 3F            [ 1]  339         ld a,#~(IPR_MASK<<6)
      008126 C4 7F 75         [ 1]  340         and a,ITC_SPR6
      008129 AA C0            [ 1]  341         or a,#(IPR3<<6)
      00812B C7 7F 75         [ 1]  342         ld ITC_SPR6,a 
      00812E 9A               [ 1]  343         rim
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      00812F CC 9A 19         [ 2]  344         jp  COLD   ;default=MN1
                                    345 
                                    346 
                                    347 ;; place MCU in sleep mode with
                                    348 ;; halt opcode 
                                    349 ;; BYE ( -- )
      008132 00 00                  350         .word 0
                           0000B4   351         LINK=.
      008134 03                     352         .byte 3 
      008135 42 59 45               353         .ascii "BYE"
      008138                        354 BYE: 
      008138 8E               [10]  355         halt 
      008139 81               [ 4]  356         ret 
                                    357 
                                    358 ; Enable interrupts 
                                    359 ; EI ( -- )
      00813A 81 34                  360         .word LINK 
                           0000BC   361         LINK=.
      00813C 02                     362         .byte 2
      00813D 45 49                  363         .ascii "EI"
      00813F                        364 EI:
      00813F 9A               [ 1]  365         rim 
      008140 81               [ 4]  366         ret 
                                    367 
                                    368 ; Disable interrupts
                                    369 ; DI ( -- )
      008141 81 3C                  370         .word LINK 
                           0000C3   371         LINK=.
      008143 02                     372         .byte 2 
      008144 44 49                  373         .ascii "DI"
      008146                        374 DI:
      008146 9B               [ 1]  375         sim 
      008147 81               [ 4]  376         ret 
                                    377 
                                    378 ; set interrupt priority level 
                                    379 ; SET-ISP ( n1 n2 -- )
                                    380 ; n1 level {1..3}
                                    381 ; n2 vector {0..29}
      008148 81 43                  382         .word LINK 
                           0000CA   383         LINK=.
      00814A 07                     384         .byte 7 
      00814B 53 45 54 2D 49 53 50   385         .ascii "SET-ISP"
      008152                        386 SETISP:
      008152 90 93            [ 1]  387         ldw y,x 
      008154 90 FE            [ 2]  388         ldw y,(y)
      008156 A6 04            [ 1]  389         ld a,#4 ; 4 slot per register 
                                    390 ;  quotient select register, remainder select slot in register.        
      008158 90 62            [ 2]  391         div y,a ; register=ITC_SPR1[Y], lshift=2*A 
      00815A A4 03            [ 1]  392         and a,#3 
      00815C 48               [ 1]  393         sll a ; 2*SLOT  lshift 
      00815D 72 A9 7F 70      [ 2]  394         addw y,#ITC_SPR1 
      008161 FF               [ 2]  395         ldw (x),y  ; ( level reg -- )
      008162 90 5F            [ 1]  396         clrw y 
      008164 90 97            [ 1]  397         ld yl,a 
      008166 1D 00 02         [ 2]  398         subw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      008169 FF               [ 2]  399         ldw (x),y  ; ( level reg lshift -- )
      00816A 90 93            [ 1]  400         ldw y,x 
      00816C 90 EE 02         [ 2]  401         ldw y,(2,y) 
      00816F 90 F6            [ 1]  402         ld a,(y)   ; reg_value
      008171 1D 00 02         [ 2]  403         subw x,#CELLL 
      008174 FF               [ 2]  404         ldw (x),y ; ( level reg lshift rval -- )
      008175 CD 85 8D         [ 4]  405         call OVER ; ( level reg lshift rval lshift -- )
      008178 CD 84 34         [ 4]  406         call DOLIT 
      00817B 00 03                  407         .word 3
      00817D CD 85 73         [ 4]  408         call SWAPP  ; ( level reg lshift rval 3 lshift )
      008180 CD 8A 76         [ 4]  409         call LSHIFT ; creat slot mask 
      008183 CD 87 78         [ 4]  410         call INVER  ; ( level reg lshift rval mask )
      008186 CD 85 AF         [ 4]  411         call ANDD ; ( level reg lshift slot_masked )
      008189 CD 85 2C         [ 4]  412         call TOR  ; ( level reg lshift -- R: slot_masked )
      00818C CD 87 1E         [ 4]  413         call ROT  ; ( reg lshift level )
      00818F CD 85 73         [ 4]  414         call SWAPP ; ( reg level lshift )
      008192 CD 8A 76         [ 4]  415         call LSHIFT  ; ( reg slot_level -- )
      008195 CD 85 0D         [ 4]  416         call RFROM ; ( reg slot_level masked_val )
      008198 CD 85 C3         [ 4]  417         call ORR   ; ( reg updated_rval )
      00819B CD 85 73         [ 4]  418         call SWAPP 
      00819E CD 84 C9         [ 4]  419         call CSTOR
                                    420 
                                    421 ; sélectionne l'application 
                                    422 ; qui démarre automatique lors 
                                    423 ; d'un COLD start 
      0081A1 81 4A                  424         .word LINK 
                           000123   425         LINK=.
      0081A3 07                     426         .byte 7
      0081A4 41 55 54 4F 52 55 4E   427         .ascii "AUTORUN"
      0081AB                        428 AUTORUN:
      0081AB CD 91 3C         [ 4]  429         call TOKEN 
      0081AE CD 85 63         [ 4]  430         call DUPP 
      0081B1 CD 84 67         [ 4]  431         call QBRAN 
      0081B4 82 8D                  432         .word FORGET2
      0081B6 CD 92 39         [ 4]  433         call NAMEQ
      0081B9 CD 87 0D         [ 4]  434         call QDUP 
      0081BC CD 84 67         [ 4]  435         call QBRAN 
      0081BF 82 8D                  436         .word FORGET2
      0081C1 CD 85 59         [ 4]  437         call DROP 
      0081C4 1D 00 02         [ 2]  438         subw x,#CELLL 
      0081C7 90 AE 40 02      [ 2]  439         ldw y,#APP_RUN 
      0081CB FF               [ 2]  440         ldw (x),y 
      0081CC CC 9D 16         [ 2]  441         jp EE_STORE 
                                    442 
                                    443 ;; Reset dictionary pointer before 
                                    444 ;; forgotten word. RAM space and 
                                    445 ;; interrupt vector defined after 
                                    446 ;; must be resetted also.
      0081CF 81 A3                  447         .word LINK 
                           000151   448         LINK=.
      0081D1 06                     449         .byte 6
      0081D2 46 4F 52 47 45 54      450         .ascii "FORGET" 
      0081D8                        451 FORGET: 
      0081D8 CD 91 3C         [ 4]  452         call TOKEN
      0081DB CD 85 63         [ 4]  453         call DUPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      0081DE CD 84 67         [ 4]  454         call QBRAN 
      0081E1 82 8D                  455         .word FORGET2
      0081E3 CD 92 39         [ 4]  456         call NAMEQ ; ( a -- ca na | a F )
      0081E6 CD 87 0D         [ 4]  457         call QDUP 
      0081E9 CD 84 67         [ 4]  458         call QBRAN 
      0081EC 82 8D                  459         .word FORGET2
                                    460 ; only forget users words 
      0081EE CD 85 63         [ 4]  461         call DUPP ; ( ca na na )
      0081F1 CD 84 34         [ 4]  462         call DOLIT 
      0081F4 A1 80                  463         .word app_space 
      0081F6 CD 85 73         [ 4]  464         call SWAPP 
      0081F9 CD 88 1E         [ 4]  465         call  ULESS 
      0081FC CD 84 67         [ 4]  466         call QBRAN 
      0081FF 82 4F                  467         .word FORGET6 
                                    468 ; ( ca na -- )        
                                    469 ;reset ivec with address >= ca
      008201 CD 85 73         [ 4]  470         call SWAPP ; ( na ca -- ) 
      008204 CD 9E D7         [ 4]  471         call CHKIVEC ; ( na -- ) 
                                    472 ; start at LAST and link back to na 
                                    473 ; if variable found reset VP at that point.
      008207                        474 FORGET1:
      008207 CD 86 CF         [ 4]  475         call LAST 
      00820A CD 84 BC         [ 4]  476         call AT 
      00820D CD 85 63         [ 4]  477         call DUPP  ; ( -- na last last )
      008210 CD 82 A3         [ 4]  478         call FREEVAR ; ( -- na last )
      008213 CD 85 63         [ 4]  479         call DUPP 
      008216 CD 84 34         [ 4]  480         call DOLIT 
      008219 00 02                  481         .word 2 
      00821B CD 87 D7         [ 4]  482         call SUBB ; ( na last -- na last lfa ) link address 
      00821E CD 84 BC         [ 4]  483         call AT 
      008221 CD 85 63         [ 4]  484         call DUPP ; ( -- na last a a )
      008224 CD 86 A3         [ 4]  485         call CNTXT 
      008227 CD 84 A5         [ 4]  486         call STORE
      00822A CD 86 CF         [ 4]  487         call LAST  
      00822D CD 84 A5         [ 4]  488         call STORE ; ( --  na last )
      008230 CD 85 8D         [ 4]  489         call OVER 
      008233 CD 87 FF         [ 4]  490         call EQUAL ; ( na last na -- na T|F ) 
      008236 CD 84 67         [ 4]  491         call QBRAN 
      008239 82 07                  492         .word FORGET1 
                                    493 ; ( na -- )
      00823B CD 84 34         [ 4]  494         call DOLIT 
      00823E 00 02                  495         .word 2 
      008240 CD 87 D7         [ 4]  496         call SUBB 
      008243 CD 86 BF         [ 4]  497         call CPP 
      008246 CD 84 A5         [ 4]  498         call STORE  
      008249 CD 9B D8         [ 4]  499         call UPDATCP 
      00824C CC 9B AF         [ 2]  500         jp UPDATLAST 
      00824F                        501 FORGET6: ; tried to forget a RAM or system word 
                                    502 ; ( ca na -- )
      00824F 1D 00 02         [ 2]  503         subw x,#CELLL 
      008252 90 BE 2A         [ 2]  504         ldw y,SP0 
      008255 FF               [ 2]  505         ldw (x),y  
      008256 CD 88 1E         [ 4]  506         call ULESS
      008259 CD 84 67         [ 4]  507         call QBRAN 
      00825C 82 7F                  508         .word PROTECTED 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      00825E CD 93 45         [ 4]  509         call ABORQ 
      008261 1D                     510         .byte 29
      008262 20 46 6F 72 20 52 41   511         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      00827F                        512 PROTECTED:
      00827F CD 93 45         [ 4]  513         call ABORQ
      008282 0A                     514         .byte 10
      008283 20 50 72 6F 74 65 63   515         .ascii " Protected"
             74 65 64
      00828D                        516 FORGET2: ; no name or not found in dictionary 
      00828D CD 93 45         [ 4]  517         call ABORQ
      008290 05                     518         .byte 5
      008291 20 77 68 61 74         519         .ascii " what"
      008296                        520 FORGET4:
      008296 CC 85 59         [ 2]  521         jp DROP 
                                    522 
                                    523 
                                    524 ;---------------------------------
                                    525 ; if na is variable 
                                    526 ; free variable data  
                                    527 ; FREEVAR ( na -- )
                                    528 ;---------------------------------
      008299 81 D1                  529         .word LINK 
                           00021B   530         LINK=.
      00829B 07                     531         .byte 7 
      00829C 46 52 45 45 56 41 52   532         .ascii "FREEVAR"
      0082A3                        533 FREEVAR:
      0082A3 CD 85 63         [ 4]  534         call DUPP ; ( na na -- )
      0082A6 CD 84 DA         [ 4]  535         CALL CAT  ; ( na c -- )
      0082A9 CD 8A 58         [ 4]  536         call ONEP ;
      0082AC CD 87 5E         [ 4]  537         CALL PLUS ; ( na c+1 -- ca ) 
      0082AF CD 8A 58         [ 4]  538         call ONEP ; ( ca+ -- ) to get routne address 
      0082B2 CD 85 63         [ 4]  539         call DUPP ; ( ca+ ca+ -- )
      0082B5 CD 84 BC         [ 4]  540         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082B8 CD 84 34         [ 4]  541         call DOLIT 
      0082BB 86 10                  542         .word DOVAR ; if routine address is DOVAR then variable 
      0082BD CD 87 FF         [ 4]  543         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082C0 CD 84 67         [ 4]  544         call QBRAN 
      0082C3 82 D9                  545         .word FREEVAR4 
      0082C5 CD 84 34         [ 4]  546         call DOLIT 
      0082C8 00 02                  547         .word 2 
      0082CA CD 87 5E         [ 4]  548         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082CD CD 84 BC         [ 4]  549         call AT 
      0082D0 CD 86 B1         [ 4]  550         call VPP   
      0082D3 CD 84 A5         [ 4]  551         call STORE 
      0082D6 CC 9B EF         [ 2]  552         jp UPDATVP 
      0082D9                        553 FREEVAR4: ; not variable
      0082D9 CC 85 59         [ 2]  554         jp  DROP 
                                    555 
                                    556 ;    SEED ( n -- )
                                    557 ; Initialize PRNG seed with n 
      0082DC 82 9B                  558         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                           00025E   559         LINK=. 
      0082DE 04                     560         .byte 4 
      0082DF 53 45 45 44            561         .ascii "SEED" 
      0082E3                        562 SEED:
      0082E3 90 93            [ 1]  563         ldw y,x 
      0082E5 1C 00 02         [ 2]  564         addw x,#CELLL
      0082E8 90 FE            [ 2]  565         ldw y,(y)
      0082EA 90 9E            [ 1]  566         ld a,yh 
      0082EC B7 35            [ 1]  567         ld SEEDX,a 
      0082EE 90 9F            [ 1]  568         ld a,yl 
      0082F0 B7 37            [ 1]  569         ld SEEDY,a 
      0082F2 81               [ 4]  570         ret 
                                    571 
                                    572 ;    RANDOM ( u1 -- u2 )
                                    573 ; Pseudo random number betwen 0 and u1-1
      0082F3 82 DE                  574         .word LINK 
                           000275   575         LINK=.
      0082F5 06                     576         .byte 6
      0082F6 52 41 4E 44 4F 4D      577         .ascii "RANDOM" 
      0082FC                        578 RANDOM:
                                    579 ;local variable 
                           000001   580         SPSAVE=1
                           000002   581         VSIZE=2 
      0082FC 52 02            [ 2]  582         sub sp,#VSIZE
      0082FE 1F 01            [ 2]  583         ldw (SPSAVE,sp),x  
                                    584 ; XTEMP=(SEEDX<<5)^SEEDX 
      008300 90 93            [ 1]  585         ldw y,x 
      008302 90 FE            [ 2]  586         ldw y,(y)
      008304 90 BF 24         [ 2]  587         ldw YTEMP,y 
      008307 BE 35            [ 2]  588 	ldw x,SEEDX 
      008309 58               [ 2]  589 	sllw x 
      00830A 58               [ 2]  590 	sllw x 
      00830B 58               [ 2]  591 	sllw x 
      00830C 58               [ 2]  592 	sllw x 
      00830D 58               [ 2]  593 	sllw x 
      00830E 9E               [ 1]  594 	ld a,xh 
      00830F B8 35            [ 1]  595 	xor a,SEEDX 
      008311 B7 22            [ 1]  596 	ld XTEMP,a 
      008313 9F               [ 1]  597 	ld a,xl 
      008314 B8 36            [ 1]  598 	xor a,SEEDX+1 
      008316 B7 23            [ 1]  599 	ld XTEMP+1,a 
                                    600 ; SEEDX=SEEDY 
      008318 BE 37            [ 2]  601 	ldw x,SEEDY 
      00831A BF 35            [ 2]  602 	ldw SEEDX,x  
                                    603 ; SEEDY=SEEDY^(SEEDY>>1)
      00831C 54               [ 2]  604 	srlw x 
      00831D 9E               [ 1]  605 	ld a,xh 
      00831E B8 37            [ 1]  606 	xor a,SEEDY 
      008320 B7 37            [ 1]  607 	ld SEEDY,a  
      008322 9F               [ 1]  608 	ld a,xl 
      008323 B8 38            [ 1]  609 	xor a,SEEDY+1 
      008325 B7 38            [ 1]  610 	ld SEEDY+1,a 
                                    611 ; XTEMP>>3 
      008327 BE 22            [ 2]  612 	ldw x,XTEMP 
      008329 54               [ 2]  613 	srlw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      00832A 54               [ 2]  614 	srlw x 
      00832B 54               [ 2]  615 	srlw x 
                                    616 ; x=XTEMP^x 
      00832C 9E               [ 1]  617 	ld a,xh 
      00832D B8 22            [ 1]  618 	xor a,XTEMP 
      00832F 95               [ 1]  619 	ld xh,a 
      008330 9F               [ 1]  620 	ld a,xl 
      008331 B8 23            [ 1]  621 	xor a,XTEMP+1  
      008333 97               [ 1]  622 	ld xl,a 
                                    623 ; SEEDY=x^SEEDY 
      008334 B8 38            [ 1]  624 	xor a,SEEDY+1
      008336 97               [ 1]  625 	ld xl,a 
      008337 9E               [ 1]  626 	ld a,xh 
      008338 B8 37            [ 1]  627 	xor a,SEEDY
      00833A 95               [ 1]  628 	ld xh,a 
      00833B BF 37            [ 2]  629 	ldw SEEDY,x 
                                    630 ; return SEEDY modulo YTEMP  
      00833D 90 BE 24         [ 2]  631 	ldw y,YTEMP  
      008340 65               [ 2]  632 	divw x,y 
      008341 1E 01            [ 2]  633 	ldw x,(SPSAVE,sp)
      008343 FF               [ 2]  634         ldw (x),y 
      008344 5B 02            [ 2]  635         addw sp,#VSIZE 
      008346 81               [ 4]  636 	ret 
                                    637 
                                    638 
                                    639 ;;
                                    640 ;; get millisecond counter 
                                    641 ;; msec ( -- u )
                                    642 ;; Added by Picatout 2020-04-26
      008347 82 F5                  643         .word LINK  
                           0002C9   644         LINK = . 
      008349 04                     645         .byte 4
      00834A 4D 53 45 43            646         .ascii "MSEC"
      00834E                        647 MSEC: 
      00834E 1D 00 02         [ 2]  648         subw x,#CELLL 
      008351 90 BE 2E         [ 2]  649         ldw y,MS 
      008354 FF               [ 2]  650         ldw (x),y 
      008355 81               [ 4]  651         ret 
                                    652 
                                    653 ; suspend execution for u msec 
                                    654 ;  pause ( u -- )
      008356 83 49                  655         .word LINK 
                           0002D8   656         LINK=.
      008358 05                     657         .byte 5 
      008359 50 41 55 53 45         658         .ascii "PAUSE"
      00835E                        659 PAUSE:
      00835E 90 93            [ 1]  660         ldw y,x
      008360 90 FE            [ 2]  661         ldw y,(y)
      008362 72 B9 00 2E      [ 2]  662         addw y,MS 
      008366 8F               [10]  663 1$:     wfi  
      008367 90 B3 2E         [ 2]  664         cpw y,MS  
      00836A 26 FA            [ 1]  665         jrne 1$        
      00836C 1C 00 02         [ 2]  666         addw x,#CELLL 
      00836F 81               [ 4]  667         ret 
                                    668 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                                    669 ; initialize count down timer 
                                    670 ;  TIMER ( u -- )  milliseconds 
      008370 83 58                  671         .word LINK 
                           0002F2   672         LINK=.
      008372 05                     673         .byte 5 
      008373 54 49 4D 45 52         674         .ascii "TIMER" 
      008378                        675 TIMER:
      008378 90 93            [ 1]  676         ldw y,x
      00837A 90 FE            [ 2]  677         ldw y,(y) 
      00837C 90 BF 30         [ 2]  678         ldw CNTDWN,y
      00837F 1C 00 02         [ 2]  679         addw x,#CELLL 
      008382 81               [ 4]  680         ret 
                                    681 
                                    682 ; check for TIMER exiparition 
                                    683 ;  TIMEOUT? ( -- 0|-1 )
      008383 83 72                  684         .word LINK 
                           000305   685         LINK=. 
      008385 08                     686         .byte 8 
      008386 54 49 4D 45 4F 55 54   687         .ascii "TIMEOUT?"
             3F
      00838E                        688 TIMEOUTQ: 
      00838E 4F               [ 1]  689         clr a
      00838F 1D 00 02         [ 2]  690         subw x,#CELLL 
      008392 90 BE 30         [ 2]  691         ldw y,CNTDWN 
      008395 26 01            [ 1]  692         jrne 1$ 
      008397 43               [ 1]  693         cpl a 
      008398 E7 01            [ 1]  694 1$:     ld (1,x),a 
      00839A F7               [ 1]  695         ld (x),a 
      00839B 81               [ 4]  696         ret         
                                    697 
                                    698 ; reboot MCU 
                                    699 ; REBOOT ( -- )
      00839C 83 85                  700         .word LINK 
                           00031E   701         LINK=. 
      00839E 06                     702         .byte 6 
      00839F 52 45 42 4F 4F 54      703         .ascii "REBOOT"
      0083A5                        704 reboot:
      0083A5 CC 80 84         [ 2]  705         jp NonHandledInterrupt
                                    706 
                                    707 ; compile to flash memory 
                                    708 ; TO-FLASH ( -- )
      0083A8 83 9E                  709         .word LINK 
                           00032A   710         LINK=.
      0083AA 08                     711         .byte 8
      0083AB 54 4F 2D 46 4C 41 53   712         .ascii "TO-FLASH"
             48
      0083B3                        713 TOFLASH:
      0083B3 CD 86 E2         [ 4]  714         call RAMLAST 
      0083B6 CD 84 BC         [ 4]  715         call AT 
      0083B9 CD 87 0D         [ 4]  716         call QDUP 
      0083BC CD 84 67         [ 4]  717         call QBRAN
      0083BF 83 E2                  718         .word 1$
      0083C1 CD 93 45         [ 4]  719         call ABORQ 
      0083C4 1D                     720         .byte 29
      0083C5 20 4E 6F 74 20 77 68   721         .ascii " Not while definitions in RAM"   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal  69-Bits]



             69 6C 65 20 64 65 66
             69 6E 69 74 69 6F 6E
             73 20 69 6E 20 52 41
             4D
      0083CD 6C 65 20 64      [ 2]  722 1$:     ldw y,#-1 
      0083D1 65 66 69         [ 2]  723         ldw UTFLASH,y
      0083D4 6E               [ 4]  724         ret 
                                    725 
                                    726 ; compile to RAM 
                                    727 ; TO-RAM ( -- )
      0083D5 69 74                  728         .word LINK 
                           00036C   729         LINK=.
      0083D7 69                     730         .byte 6 
      0083D8 6F 6E 73 20 69 6E      731         .ascii "TO-RAM"
      000373                        732 TORAM:
      0083DE 20 52            [ 1]  733         clrw y 
      0083E0 41 4D 90         [ 2]  734         ldw UTFLASH,y 
      0083E3 AE               [ 4]  735         ret 
                                    736         
                                    737 
                                    738 ;; Device dependent I/O
                                    739 ;       ?RX     ( -- c T | F )
                                    740 ;         Return input byte and true, or false.
      0083E4 FF FF                  741         .word      LINK 
                           00037B   742 LINK	= .
      0083E6 90                     743         .byte      4
      0083E7 BF 1E 81 83            744         .ascii     "?KEY"
      000380                        745 QKEY:
      0083EB AA 06            [ 1]  746         CLRW Y 
      0083ED 54 4F 2D 52 41   [ 2]  747         BTJF UART2_SR,#UART_SR_RXNE,INCH   ;check status
      0083F2 4D 52 41         [ 1]  748         LD    A,UART2_DR   ;get char in A
      0083F3 1D 00 02         [ 2]  749 	SUBW	X,#2
      0083F3 90 5F            [ 1]  750         LD     (1,X),A
      0083F5 90               [ 1]  751 	CLR	(X)
      0083F6 BF 1E            [ 2]  752         CPLW     Y
      000392                        753 INCH:
      0083F8 81 83 EC         [ 2]  754 	SUBW	X,#2
      0083FB 04               [ 2]  755         LDW     (X),Y
      0083FC 3F               [ 4]  756         RET
                                    757 
                                    758 ;       TX!     ( c -- )
                                    759 ;       Send character c to  output device.
      0083FD 4B 45                  760         .word      LINK
                           000399   761 LINK	= .
      0083FF 59                     762         .byte      4
      008400 45 4D 49 54            763         .ascii     "EMIT"
      00039E                        764 EMIT:
      008400 90 5F            [ 1]  765         LD     A,(1,X)
      008402 72 0B 52         [ 2]  766 	ADDW	X,#2
      008405 40 0B C6 52 41   [ 2]  767 OUTPUT: BTJF UART2_SR,#UART_SR_TXE,OUTPUT  ;loop until tdre
      00840A 1D 00 02         [ 1]  768         LD    UART2_DR,A   ;send A
      00840D E7               [ 4]  769         RET
                                    770 
                                    771 ;; The kernel
                                    772 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    773 ;       doLIT   ( -- w )
                                    774 ;       Push an inline literal.
      00840E 01 7F                  775         .word      LINK
                           0003AE   776 LINK	= 	.
      008410 90                     777 	.byte      COMPO+5
      008411 53 4F 4C 49 54         778         .ascii     "DOLIT"
      008412                        779 DOLIT:
      008412 1D 00 02         [ 2]  780 	SUBW X,#2
      008415 FF 81            [ 2]  781         ldw y,(1,sp)
      008417 83 FB            [ 2]  782         ldw y,(y)
      008419 04               [ 2]  783         ldw (x),y
      00841A 45 4D            [ 2]  784         popw y 
      00841C 49 54 02         [ 2]  785         jp (2,y)
                                    786 
                                    787 ;       next    ( -- )
                                    788 ;       Code for  single index loop.
      00841E 03 AE                  789         .word      LINK
                           0003C3   790 LINK	= 	.
      00841E E6                     791 	.byte      COMPO+4
      00841F 01 1C 00 02            792         .ascii     "next"
      0003C8                        793 DONXT:
      008423 72 0F            [ 2]  794 	LDW Y,(3,SP)
      008425 52 40            [ 2]  795 	DECW Y
      008427 FB C7            [ 1]  796 	JRPL NEX1 ; jump if N=0
      008429 52 41            [ 2]  797 	POPW Y
      00842B 81 84            [ 2]  798         addw sp,#2
      00842D 19 45 44         [ 2]  799         JP (2,Y)
      0003D5                        800 NEX1:
      008430 4F 4C            [ 2]  801         LDW (3,SP),Y
      008432 49 54            [ 2]  802         POPW Y
      008434 90 FE            [ 2]  803 	LDW Y,(Y)
      008434 1D 00            [ 2]  804 	JP (Y)
                                    805 
                                    806 ;       ?branch ( f -- )
                                    807 ;       Branch if flag is zero.
      008436 02 16                  808         .word      LINK
                           0003DF   809 LINK	= 	.
      008438 01                     810 	.byte      COMPO+7
      008439 90 FE FF 90 85 90 EC   811         .ascii     "?BRANCH"
      0003E7                        812 QBRAN:	
      008440 02 84            [ 1]  813         LDW Y,X
      008442 2E 44 6E         [ 2]  814 	ADDW X,#2
      008445 65 78            [ 2]  815 	LDW Y,(Y)
      008447 74 0E            [ 1]  816         JREQ     BRAN
      008448 90 85            [ 2]  817 	POPW Y
      008448 16 03 90         [ 2]  818 	JP (2,Y)
                                    819         
                                    820 ;       branch  ( -- )
                                    821 ;       Branch to an inline address.
      00844B 5A 2A                  822         .word      LINK
                           0003F7   823 LINK	= 	.
      00844D 07                     824 	.byte      COMPO+6
      00844E 90 85 5B 02 90 EC      825         .ascii     "BRANCH"
      0003FE                        826 BRAN:
      008454 02 85            [ 2]  827         POPW Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      008455 90 FE            [ 2]  828 	LDW Y,(Y)
      008455 17 03            [ 2]  829         JP     (Y)
                                    830 
                                    831 ;       EXECUTE ( ca -- )
                                    832 ;       Execute  word at ca.
      008457 90 85                  833         .word      LINK
                           000406   834 LINK	= 	.
      008459 90                     835         .byte       7
      00845A FE 90 FC 84 43 47 3F   836         .ascii     "EXECUTE"
      00040E                        837 EXECU:
      008461 42 52            [ 1]  838         LDW Y,X
      008463 41 4E 43         [ 2]  839 	ADDW X,#2
      008466 48 FE            [ 2]  840 	LDW  Y,(Y)
      008467 90 FC            [ 2]  841         JP   (Y)
                                    842 
                           000001   843 OPTIMIZE = 1
                           000001   844 .if OPTIMIZE 
                                    845 ; remplacement de CALL EXIT par 
                                    846 ; le opcode de RET.
                                    847 ; Voir modification au code de ";"
                                    848 ;
                                    849 ;       EXIT    ( -- )
                                    850 ;       Terminate a colon definition.
      008467 90 93                  851         .word      LINK
                           000419   852 LINK = .
      008469 1C                     853         .byte      4
      00846A 00 02 90 FE            854         .ascii     "EXIT"
      00041E                        855 EXIT:
      00846E 27 0E            [ 2]  856         POPW Y
      008470 90               [ 4]  857         RET
                                    858 .endif 
                                    859 
                                    860 ;       !       ( w a -- )
                                    861 ;       Pop  data stack to memory.
      008471 85 90                  862         .word      LINK
                           000423   863 LINK = .
      008473 EC                     864         .byte      1
      008474 02                     865         .ascii     "!"
      000425                        866 STORE:
      008475 84 5F            [ 1]  867         LDW Y,X
      008477 46 42            [ 2]  868         LDW Y,(Y)    ;Y=a
      008479 52 41 4E         [ 2]  869         LDW YTEMP,Y
      00847C 43 48            [ 1]  870         LDW Y,X
      00847E 90 EE 02         [ 2]  871         LDW Y,(2,Y)
      00847E 90 85 90         [ 5]  872         LDW [YTEMP],Y ;store w at a
      008481 FE 90 FC         [ 2]  873         ADDW X,#4 ; DDROP 
      008484 84               [ 4]  874         RET     
                                    875 
                                    876 ;       @       ( a -- w )
                                    877 ;       Push memory location to stack.
      008485 77 07                  878         .word      LINK
                           00043A   879 LINK	= 	.
      008487 45                     880         .byte    1
      008488 58                     881         .ascii	"@"
      00043C                        882 AT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      008489 45 43            [ 1]  883         LDW Y,X     ;Y = a
      00848B 55 54            [ 2]  884         LDW Y,(Y)   ; address 
      00848D 45 FE            [ 2]  885         LDW Y,(Y)   ; value 
      00848E FF               [ 2]  886         LDW (X),Y ;w = @Y
      00848E 90               [ 4]  887         RET     
                                    888 
                                    889 ;       C!      ( c b -- )
                                    890 ;       Pop  data stack to byte memory.
      00848F 93 1C                  891         .word      LINK
                           000446   892 LINK	= .
      008491 00                     893         .byte      2
      008492 02 90                  894         .ascii     "C!"
      000449                        895 CSTOR:
      008494 FE 90            [ 1]  896         LDW Y,X
      008496 FC 84            [ 2]  897 	LDW Y,(Y)    ;Y=b
      008498 86 04            [ 1]  898         LD A,(3,X)    ;D = c
      00849A 45 58            [ 1]  899         LD  (Y),A     ;store c at b
      00849C 49 54 04         [ 2]  900 	ADDW X,#4 ; DDROP 
      00849E 81               [ 4]  901         RET     
                                    902 
                                    903 ;       C@      ( b -- c )
                                    904 ;       Push byte in memory to  stack.
      00849E 90 85                  905         .word      LINK
                           000457   906 LINK	= 	.
      0084A0 81                     907         .byte      2
      0084A1 84 99                  908         .ascii     "C@"
      00045A                        909 CAT:
      0084A3 01 21            [ 1]  910         LDW Y,X     ;Y=b
      0084A5 90 FE            [ 2]  911         LDW Y,(Y)
      0084A5 90 93            [ 1]  912         LD A,(Y)
      0084A7 90 FE            [ 1]  913         LD (1,X),A
      0084A9 90               [ 1]  914         CLR (X)
      0084AA BF               [ 4]  915         RET     
                                    916 
                                    917 ;       RP@     ( -- a )
                                    918 ;       Push current RP to data stack.
      0084AB 24 90                  919         .word      LINK
                           000466   920 LINK	= .
      0084AD 93                     921         .byte      3
      0084AE 90 EE 02               922         .ascii     "RP@"
      00046A                        923 RPAT:
      0084B1 91 CF            [ 1]  924         LDW Y,SP    ;save return addr
      0084B3 24 1C 00         [ 2]  925         SUBW X,#2
      0084B6 04               [ 2]  926         LDW (X),Y
      0084B7 81               [ 4]  927         RET     
                                    928 
                                    929 ;       RP!     ( a -- )
                                    930 ;       Set  return stack pointer.
      0084B8 84 A3                  931         .word      LINK
                           000473   932 LINK	= 	. 
      0084BA 01                     933 	.byte      COMPO+3
      0084BB 40 50 21               934         .ascii     "RP!"
      0084BC                        935 RPSTO:
      0084BC 90 93            [ 2]  936         POPW Y
      0084BE 90 FE 90         [ 2]  937         LDW YTEMP,Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0084C1 FE FF            [ 1]  938         LDW Y,X
      0084C3 81 84            [ 2]  939         LDW Y,(Y)
      0084C5 BA 02            [ 1]  940         LDW SP,Y
      0084C7 43 21 02         [ 2]  941         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      0084C9 92 CC 24         [ 5]  942         JP [YTEMP]
                                    943 
                                    944 ;       R>      ( -- w )
                                    945 ;       Pop return stack to data stack.
      0084C9 90 93                  946         .word      LINK
                           00048A   947 LINK	= 	. 
      0084CB 90                     948 	.byte      COMPO+2
      0084CC FE E6                  949         .ascii     "R>"
      00048D                        950 RFROM:
      0084CE 03 90            [ 2]  951         POPW Y    ;save return addr
      0084D0 F7 1C 00         [ 2]  952         LDW YTEMP,Y
      0084D3 04 81            [ 2]  953         POPW Y
      0084D5 84 C6 02         [ 2]  954         SUBW X,#2
      0084D8 43               [ 2]  955         LDW (X),Y
      0084D9 40 CC 24         [ 5]  956         JP [YTEMP]
                                    957 
                                    958 ;       R@      ( -- w )
                                    959 ;       Copy top of return stack to stack.
      0084DA 04 8A                  960         .word      LINK
                           00049D   961 LINK	= 	. 
      0084DA 90                     962         .byte      2
      0084DB 93 90                  963         .ascii     "R@"
      0004A0                        964 RAT:
      0084DD FE 90            [ 2]  965         ldw y,(3,sp)
      0084DF F6 E7 01         [ 2]  966         subw x,#CELLL 
      0084E2 7F               [ 2]  967         ldw (x),y 
      0084E3 81               [ 4]  968         ret 
                                    969 
                                    970 ;       >R      ( w -- )
                                    971 ;       Push data stack to return stack.
      0084E4 84 D7                  972         .word      LINK
                           0004A9   973 LINK	= 	. 
      0084E6 03                     974 	.byte      COMPO+2
      0084E7 52 50                  975         .ascii     ">R"
      0004AC                        976 TOR:
      0084E9 40 85            [ 2]  977         POPW Y    ;save return addr
      0084EA 90 BF 24         [ 2]  978         LDW YTEMP,Y
      0084EA 90 96            [ 1]  979         LDW Y,X
      0084EC 1D 00            [ 2]  980         LDW Y,(Y)
      0084EE 02 FF            [ 2]  981         PUSHW Y    ;restore return addr
      0084F0 81 84 E6         [ 2]  982         ADDW X,#2
      0084F3 43 52 50         [ 5]  983         JP [YTEMP]
                                    984 
                                    985 ;       SP@     ( -- a )
                                    986 ;       Push current stack pointer.
      0084F6 21 A9                  987         .word      LINK
                           0004BF   988 LINK	= 	. 
      0084F7 03                     989         .byte      3
      0084F7 90 85 90               990         .ascii     "SP@"
      0004C3                        991 SPAT:
      0084FA BF 24            [ 1]  992 	LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      0084FC 90 93 90         [ 2]  993         SUBW X,#2
      0084FF FE               [ 2]  994 	LDW (X),Y
      008500 90               [ 4]  995         RET     
                                    996 
                                    997 ;       SP!     ( a -- )
                                    998 ;       Set  data stack pointer.
      008501 94 1C                  999         .word      LINK
                           0004CC  1000 LINK	= 	. 
      008503 00                    1001         .byte      3
      008504 02 92 CC              1002         .ascii     "SP!"
      0004D0                       1003 SPSTO:
      008507 24               [ 2] 1004         LDW     X,(X)     ;X = a
      008508 84               [ 4] 1005         RET     
                                   1006 
                                   1007 ;       DROP    ( w -- )
                                   1008 ;       Discard top stack item.
      008509 F3 42                 1009         .word      LINK
                           0004D4  1010 LINK	= 	. 
      00850B 52                    1011         .byte      4
      00850C 3E 52 4F 50           1012         .ascii     "DROP"
      00850D                       1013 DROP:
      00850D 90 85 90         [ 2] 1014         ADDW X,#2     
      008510 BF               [ 4] 1015         RET     
                                   1016 
                                   1017 ;       DUP     ( w -- w w )
                                   1018 ;       Duplicate  top stack item.
      008511 24 90                 1019         .word      LINK
                           0004DF  1020 LINK	= 	. 
      008513 85                    1021         .byte      3
      008514 1D 00 02              1022         .ascii     "DUP"
      0004E3                       1023 DUPP:
      008517 FF 92            [ 1] 1024 	LDW Y,X
      008519 CC 24 85         [ 2] 1025         SUBW X,#2
      00851C 0A 02            [ 2] 1026 	LDW Y,(Y)
      00851E 52               [ 2] 1027 	LDW (X),Y
      00851F 40               [ 4] 1028         RET     
                                   1029 
                                   1030 ;       SWAP    ( w1 w2 -- w2 w1 )
                                   1031 ;       Exchange top two stack items.
      008520 04 DF                 1032         .word      LINK
                           0004EE  1033 LINK	= 	. 
      008520 16                    1034         .byte      4
      008521 03 1D 00 02           1035         .ascii     "SWAP"
      0004F3                       1036 SWAPP:
      008525 FF 81            [ 1] 1037         LDW Y,X
      008527 85 1D            [ 2] 1038         LDW Y,(Y)
      008529 42 3E 52         [ 2] 1039         LDW YTEMP,Y
      00852C 90 93            [ 1] 1040         LDW Y,X
      00852C 90 85 90         [ 2] 1041         LDW Y,(2,Y)
      00852F BF               [ 2] 1042         LDW (X),Y
      008530 24 90 93         [ 2] 1043         LDW Y,YTEMP
      008533 90 FE            [ 2] 1044         LDW (2,X),Y
      008535 90               [ 4] 1045         RET     
                                   1046 
                                   1047 ;       OVER    ( w1 w2 -- w1 w2 w1 )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                   1048 ;       Copy second stack item to top.
      008536 89 1C                 1049         .word      LINK
                           000508  1050 LINK	= . 
      008538 00                    1051         .byte      4
      008539 02 92 CC 24           1052         .ascii     "OVER"
      00050D                       1053 OVER:
      00853D 85 29 03         [ 2] 1054         SUBW X,#2
      008540 53 50            [ 1] 1055         LDW Y,X
      008542 40 EE 04         [ 2] 1056         LDW Y,(4,Y)
      008543 FF               [ 2] 1057         LDW (X),Y
      008543 90               [ 4] 1058         RET     
                                   1059 
                                   1060 ;       0<      ( n -- t )
                                   1061 ;       Return true if n is negative.
      008544 93 1D                 1062         .word      LINK
                           000519  1063 LINK	= . 
      008546 00                    1064         .byte      2
      008547 02 FF                 1065         .ascii     "0<"
      00051C                       1066 ZLESS:
      008549 81 85            [ 1] 1067         LD A,#0xFF
      00854B 3F 03            [ 1] 1068         LDW Y,X
      00854D 53 50            [ 2] 1069         LDW Y,(Y)
      00854F 21 01            [ 1] 1070         JRMI     ZL1
      008550 4F               [ 1] 1071         CLR A   ;false
      008550 FE               [ 1] 1072 ZL1:    LD     (X),A
      008551 81 85            [ 1] 1073         LD (1,X),A
      008553 4C               [ 4] 1074 	RET     
                                   1075 
                                   1076 ;       AND     ( w w -- w )
                                   1077 ;       Bitwise AND.
      008554 04 44                 1078         .word      LINK
                           00052B  1079 LINK	= . 
      008556 52                    1080         .byte      3
      008557 4F 50 44              1081         .ascii     "AND"
      008559                       1082 ANDD:
      008559 1C               [ 1] 1083         LD  A,(X)    ;D=w
      00855A 00 02            [ 1] 1084         AND A,(2,X)
      00855C 81 85            [ 1] 1085         LD (2,X),A
      00855E 54 03            [ 1] 1086         LD A,(1,X)
      008560 44 55            [ 1] 1087         AND A,(3,X)
      008562 50 03            [ 1] 1088         LD (3,X),A
      008563 1C 00 02         [ 2] 1089         ADDW X,#2
      008563 90               [ 4] 1090         RET
                                   1091 
                                   1092 ;       OR      ( w w -- w )
                                   1093 ;       Bitwise inclusive OR.
      008564 93 1D                 1094         .word      LINK
                           000540  1095 LINK = . 
      008566 00                    1096         .byte      2
      008567 02 90                 1097         .ascii     "OR"
      000543                       1098 ORR:
      008569 FE               [ 1] 1099         LD A,(X)    ;D=w
      00856A FF 81            [ 1] 1100         OR A,(2,X)
      00856C 85 5F            [ 1] 1101         LD (2,X),A
      00856E 04 53            [ 1] 1102         LD A,(1,X)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      008570 57 41            [ 1] 1103         OR A,(3,X)
      008572 50 03            [ 1] 1104         LD (3,X),A
      008573 1C 00 02         [ 2] 1105         ADDW X,#2
      008573 90               [ 4] 1106         RET
                                   1107 
                                   1108 ;       XOR     ( w w -- w )
                                   1109 ;       Bitwise exclusive OR.
      008574 93 90                 1110         .word      LINK
                           000554  1111 LINK	= . 
      008576 FE                    1112         .byte      3
      008577 90 BF 24              1113         .ascii     "XOR"
      000558                       1114 XORR:
      00857A 90               [ 1] 1115         LD A,(X)    ;D=w
      00857B 93 90            [ 1] 1116         XOR A,(2,X)
      00857D EE 02            [ 1] 1117         LD (2,X),A
      00857F FF 90            [ 1] 1118         LD A,(1,X)
      008581 BE 24            [ 1] 1119         XOR A,(3,X)
      008583 EF 02            [ 1] 1120         LD (3,X),A
      008585 81 85 6E         [ 2] 1121         ADDW X,#2
      008588 04               [ 4] 1122         RET
                                   1123 
                                   1124 ;       UM+     ( u u -- udsum )
                                   1125 ;       Add two unsigned single
                                   1126 ;       and return a double sum.
      008589 4F 56                 1127         .word      LINK
                           000569  1128 LINK	= . 
      00858B 45                    1129         .byte      3
      00858C 52 4D 2B              1130         .ascii     "UM+"
      00858D                       1131 UPLUS:
      00858D 1D 00            [ 1] 1132         LD A,#1
      00858F 02 90            [ 1] 1133         LDW Y,X
      008591 93 90 EE         [ 2] 1134         LDW Y,(2,Y)
      008594 04 FF 81         [ 2] 1135         LDW YTEMP,Y
      008597 85 88            [ 1] 1136         LDW Y,X
      008599 02 30            [ 2] 1137         LDW Y,(Y)
      00859B 3C B9 00 24      [ 2] 1138         ADDW Y,YTEMP
      00859C EF 02            [ 2] 1139         LDW (2,X),Y
      00859C A6 FF            [ 1] 1140         JRC     UPL1
      00859E 90               [ 1] 1141         CLR A
      00859F 93 90            [ 1] 1142 UPL1:   LD     (1,X),A
      0085A1 FE               [ 1] 1143         CLR (X)
      0085A2 2B               [ 4] 1144         RET
                                   1145 
                                   1146 ;; System and user variables
                                   1147 
                                   1148 ;       doVAR   ( -- a )
                                   1149 ;       Code for VARIABLE and CREATE.
      0085A3 01 4F                 1150         .word      LINK
                           00058A  1151 LINK	= . 
      0085A5 F7                    1152 	.byte      COMPO+5
      0085A6 E7 01 81 85 99        1153         .ascii     "DOVAR"
      000590                       1154 DOVAR:
      0085AB 03 41 4E         [ 2] 1155 	SUBW X,#2
      0085AE 44 85            [ 2] 1156         POPW Y    ;get return addr (pfa)
      0085AF 90 FE            [ 2] 1157         LDW Y,(Y) ; indirect address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      0085AF F6               [ 2] 1158         LDW (X),Y    ;push on stack
      0085B0 E4               [ 4] 1159         RET     ;go to RET of EXEC
                                   1160 
                                   1161 ;       BASE    ( -- a )
                                   1162 ;       Radix base for numeric I/O.
      0085B1 02 E7                 1163         .word      LINK        
                           00059B  1164 LINK = . 
      0085B3 02                    1165         .byte      4
      0085B4 E6 01 E4 03           1166         .ascii     "BASE"
      0005A0                       1167 BASE:
      0085B8 E7 03 1C 00      [ 2] 1168 	LDW Y,#UBASE 
      0085BC 02 81 85         [ 2] 1169 	SUBW X,#2
      0085BF AB               [ 2] 1170         LDW (X),Y
      0085C0 02               [ 4] 1171         RET
                                   1172 
                                   1173 ;       tmp     ( -- a )
                                   1174 ;       A temporary storage.
      0085C1 4F 52                 1175         .word      LINK
                                   1176         
                           0005AB  1177 LINK = . 
      0085C3 03                    1178 	.byte      3
      0085C3 F6 EA 02              1179         .ascii     "TMP"
      0005AF                       1180 TEMP:
      0085C6 E7 02 E6 01      [ 2] 1181 	LDW Y,#UTMP
      0085CA EA 03 E7         [ 2] 1182 	SUBW X,#2
      0085CD 03               [ 2] 1183         LDW (X),Y
      0085CE 1C               [ 4] 1184         RET
                                   1185 
                                   1186 ;       >IN     ( -- a )
                                   1187 ;        Hold parsing pointer.
      0085CF 00 02                 1188         .word      LINK
                           0005BA  1189 LINK = . 
      0085D1 81                    1190         .byte      3
      0085D2 85 C0 03              1191         .ascii    ">IN"
      0005BE                       1192 INN:
      0085D5 58 4F 52 0A      [ 2] 1193 	LDW Y,#UINN 
      0085D8 1D 00 02         [ 2] 1194 	SUBW X,#2
      0085D8 F6               [ 2] 1195         LDW (X),Y
      0085D9 E8               [ 4] 1196         RET
                                   1197 
                                   1198 ;       #TIB    ( -- a )
                                   1199 ;       Count in terminal input buffer.
      0085DA 02 E7                 1200         .word      LINK
                           0005C9  1201 LINK = . 
      0085DC 02                    1202         .byte      4
      0085DD E6 01 E8 03           1203         .ascii     "#TIB"
      0005CE                       1204 NTIB:
      0085E1 E7 03 1C 00      [ 2] 1205 	LDW Y,#UCTIB 
      0085E5 02 81 85         [ 2] 1206 	SUBW X,#2
      0085E8 D4               [ 2] 1207         LDW (X),Y
      0085E9 03               [ 4] 1208         RET
                                   1209 
                                   1210 ;       TBUF ( -- a )
                                   1211 ;       address of 128 bytes transaction buffer 
      0085EA 55 4D                 1212         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



                           0005D9  1213         LINK=.
      0085EC 2B                    1214         .byte 4 
      0085ED 54 42 55 46           1215         .ascii "TBUF"
      0005DE                       1216 TBUF:
      0085ED A6 01 90 93      [ 2] 1217         ldw y,#ROWBUFF
      0085F1 90 EE 02         [ 2] 1218         subw x,#CELLL
      0085F4 90               [ 2] 1219         ldw (x),y 
      0085F5 BF               [ 4] 1220         ret 
                                   1221 
                                   1222 ; systeme variable 
                                   1223 ; compilation destination 
                                   1224 ; TFLASH ( -- A )
      0085F6 24 90                 1225         .word LINK 
                           0005E9  1226         LINK=.
      0085F8 93                    1227         .byte 6 
      0085F9 90 FE 72 B9 00 24     1228         .ascii "TFLASH"         
      0005F0                       1229 TFLASH:
      0085FF EF 02 25         [ 2] 1230         subw x,#CELLL 
      008602 01 4F E7 01      [ 2] 1231         ldw y,#UTFLASH
      008606 7F               [ 2] 1232         ldw (x),y 
      008607 81               [ 4] 1233         ret 
                                   1234 
                                   1235 ;       "EVAL   ( -- a )
                                   1236 ;       Execution vector of EVAL.
      008608 85 E9                 1237         .word      LINK
                           0005FB  1238 LINK = . 
      00860A 45                    1239         .byte      5
      00860B 44 4F 56 41 52        1240         .ascii     "'EVAL"
      008610                       1241 TEVAL:
      008610 1D 00 02 90      [ 2] 1242 	LDW Y,#UINTER 
      008614 85 90 FE         [ 2] 1243 	SUBW X,#2
      008617 FF               [ 2] 1244         LDW (X),Y
      008618 81               [ 4] 1245         RET
                                   1246 
                                   1247 ;       HLD     ( -- a )
                                   1248 ;       Hold a pointer of output string.
      008619 86 0A                 1249         .word      LINK
                           00060C  1250 LINK = . 
      00861B 04                    1251         .byte      3
      00861C 42 41 53              1252         .ascii     "HLD"
      000610                       1253 HLD:
      00861F 45 AE 00 12      [ 2] 1254 	LDW Y,#UHLD 
      008620 1D 00 02         [ 2] 1255 	SUBW X,#2
      008620 90               [ 2] 1256         LDW (X),Y
      008621 AE               [ 4] 1257         RET
                                   1258 
                                   1259 ;       CONTEXT ( -- a )
                                   1260 ;       Start vocabulary search.
      008622 00 06                 1261         .word      LINK
                           00061B  1262 LINK = . 
      008624 1D                    1263         .byte      7
      008625 00 02 FF 81 86 1B 03  1264         .ascii     "CONTEXT"
      000623                       1265 CNTXT:
      00862C 54 4D 50 14      [ 2] 1266 	LDW Y,#UCNTXT
      00862F 1D 00 02         [ 2] 1267 	SUBW X,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      00862F 90               [ 2] 1268         LDW (X),Y
      008630 AE               [ 4] 1269         RET
                                   1270 
                                   1271 ;       VP      ( -- a )
                                   1272 ;       Point to top of variables
      008631 00 08                 1273         .word      LINK
                           00062E  1274 LINK = . 
      008633 1D                    1275         .byte      2
      008634 00 02                 1276         .ascii     "VP"
      000631                       1277 VPP:
      008636 FF 81 86 2B      [ 2] 1278 	LDW Y,#UVP 
      00863A 03 3E 49         [ 2] 1279 	SUBW X,#2
      00863D 4E               [ 2] 1280         LDW (X),Y
      00863E 81               [ 4] 1281         RET
                                   1282 
                                   1283 ;       CP    ( -- a )
                                   1284 ;       Pointer to top of FLASH 
      00863E 90 AE                 1285         .word LINK 
                           00063C  1286         LINK=.
      008640 00                    1287         .byte 2 
      008641 0A 1D                 1288         .ascii "CP"
      00063F                       1289 CPP: 
      008643 00 02 FF 81      [ 2] 1290         ldw y,#UCP 
      008647 86 3A 04         [ 2] 1291         subw x,#CELLL 
      00864A 23               [ 2] 1292         ldw (x),y 
      00864B 54               [ 4] 1293         ret                
                                   1294 
                                   1295 ;       LAST    ( -- a )
                                   1296 ;       Point to last name in dictionary.
      00864C 49 42                 1297         .word      LINK
                           00064A  1298 LINK = . 
      00864E 04                    1299         .byte      4
      00864E 90 AE 00 0C           1300         .ascii     "LAST"
      00064F                       1301 LAST:
      008652 1D 00 02 FF      [ 2] 1302 	LDW Y,#ULAST 
      008656 81 86 49         [ 2] 1303 	SUBW X,#2
      008659 04               [ 2] 1304         LDW (X),Y
      00865A 54               [ 4] 1305         RET
                                   1306 
                                   1307 ; address of system variable URLAST 
                                   1308 ;       RAMLAST ( -- a )
                                   1309 ; RAM dictionary context 
      00865B 42 55                 1310         .word LINK 
                           00065A  1311         LINK=. 
      00865D 46                    1312         .byte 7  
      00865E 52 41 4D 4C 41 53 54  1313         .ascii "RAMLAST" 
      000662                       1314 RAMLAST: 
      00865E 90 AE 06 80      [ 2] 1315         ldw y,#URLAST 
      008662 1D 00 02         [ 2] 1316         subw x,#CELLL 
      008665 FF               [ 2] 1317         ldw (x),y 
      008666 81               [ 4] 1318         ret 
                                   1319 
                                   1320 ; OFFSET ( -- a )
                                   1321 ; address of system variable OFFSET 
      008667 86 59                 1322         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                           00066D  1323         LINK=.
      008669 06                    1324         .byte 6
      00866A 54 46 4C 41 53 48     1325         .ascii "OFFSET" 
      008670                       1326 OFFSET: 
      008670 1D 00 02         [ 2] 1327         subw x,#CELLL
      008673 90 AE 00 1E      [ 2] 1328         ldw y,#UOFFSET 
      008677 FF               [ 2] 1329         ldw (x),y 
      008678 81               [ 4] 1330         ret 
                                   1331 
                                   1332 ; adjust jump address adding OFFSET
                                   1333 ; ADR-ADJ ( a -- a+offset )
      00067D                       1334 ADRADJ: 
      008679 86 69 05         [ 4] 1335         call OFFSET 
      00867C 27 45 56         [ 4] 1336         call AT 
      00867F 41 4C DE         [ 2] 1337         jp PLUS 
                                   1338 
                                   1339 
                                   1340 ;; Common functions
                                   1341 
                                   1342 ;       ?DUP    ( w -- w w | 0 )
                                   1343 ;       Dup tos if its is not zero.
      008681 06 6D                 1344         .word      LINK
                           000688  1345 LINK = . 
      008681 90                    1346         .byte      4
      008682 AE 00 10 1D           1347         .ascii     "?DUP"
      00068D                       1348 QDUP:
      008686 00 02            [ 1] 1349         LDW Y,X
      008688 FF 81            [ 2] 1350 	LDW Y,(Y)
      00868A 86 7B            [ 1] 1351         JREQ     QDUP1
      00868C 03 48 4C         [ 2] 1352 	SUBW X,#2
      00868F 44               [ 2] 1353         LDW (X),Y
      008690 81               [ 4] 1354 QDUP1:  RET
                                   1355 
                                   1356 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1357 ;       Rot 3rd item to top.
      008690 90 AE                 1358         .word      LINK
                           00069A  1359 LINK = . 
      008692 00                    1360         .byte      3
      008693 12 1D 00              1361         .ascii     "ROT"
      00069E                       1362 ROT:
      008696 02 FF            [ 1] 1363         ldw y,x 
      008698 81 86            [ 2] 1364         ldw y,(y)
      00869A 8C 07            [ 2] 1365         pushw y 
      00869C 43 4F            [ 1] 1366         ldw y,x 
      00869E 4E 54 45         [ 2] 1367         ldw y,(4,y)
      0086A1 58               [ 2] 1368         ldw (x),y 
      0086A2 54 93            [ 1] 1369         ldw y,x 
      0086A3 90 EE 02         [ 2] 1370         ldw y,(2,y)
      0086A3 90 AE            [ 2] 1371         ldw (4,x),y 
      0086A5 00 14            [ 2] 1372         popw y 
      0086A7 1D 00            [ 2] 1373         ldw (2,x),y
      0086A9 02               [ 4] 1374         ret 
                                   1375 
                                   1376 ;       2DROP   ( w w -- )
                                   1377 ;       Discard two items on stack.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      0086AA FF 81                 1378         .word      LINK
                           0006B8  1379 LINK = . 
      0086AC 86                    1380         .byte      5
      0086AD 9B 02 56 50 50        1381         .ascii     "2DROP"
      0086B1                       1382 DDROP:
      0086B1 90 AE 00         [ 2] 1383         ADDW X,#4
      0086B4 16               [ 4] 1384         RET
                                   1385 
                                   1386 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1387 ;       Duplicate top two items.
      0086B5 1D 00                 1388         .word      LINK
                           0006C4  1389 LINK = . 
      0086B7 02                    1390         .byte      4
      0086B8 FF 81 86 AE           1391         .ascii     "2DUP"
      0006C9                       1392 DDUP:
      0086BC 02 43 50         [ 2] 1393         SUBW X,#4
      0086BF 90 93            [ 1] 1394         LDW Y,X
      0086BF 90 AE 00         [ 2] 1395         LDW Y,(6,Y)
      0086C2 18 1D            [ 2] 1396         LDW (2,X),Y
      0086C4 00 02            [ 1] 1397         LDW Y,X
      0086C6 FF 81 86         [ 2] 1398         LDW Y,(4,Y)
      0086C9 BC               [ 2] 1399         LDW (X),Y
      0086CA 04               [ 4] 1400         RET
                                   1401 
                                   1402 ;       +       ( w w -- sum )
                                   1403 ;       Add top two items.
      0086CB 4C 41                 1404         .word      LINK
                           0006DC  1405 LINK = . 
      0086CD 53                    1406         .byte      1
      0086CE 54                    1407         .ascii     "+"
      0086CF                       1408 PLUS:
      0086CF 90 AE            [ 1] 1409         LDW Y,X
      0086D1 00 1A            [ 2] 1410         LDW Y,(Y)
      0086D3 1D 00 02         [ 2] 1411         LDW YTEMP,Y
      0086D6 FF 81 86         [ 2] 1412         ADDW X,#2
      0086D9 CA 07            [ 1] 1413         LDW Y,X
      0086DB 52 41            [ 2] 1414         LDW Y,(Y)
      0086DD 4D 4C 41 53      [ 2] 1415         ADDW Y,YTEMP
      0086E1 54               [ 2] 1416         LDW (X),Y
      0086E2 81               [ 4] 1417         RET
                                   1418 
                                   1419 ;       NOT     ( w -- w )
                                   1420 ;       One's complement of tos.
      0086E2 90 AE                 1421         .word      LINK
                           0006F4  1422 LINK = . 
      0086E4 00                    1423         .byte      3
      0086E5 20 1D 00              1424         .ascii     "NOT"
      0006F8                       1425 INVER:
      0086E8 02 FF            [ 1] 1426         LDW Y,X
      0086EA 81 86            [ 2] 1427         LDW Y,(Y)
      0086EC DA 06            [ 2] 1428         CPLW Y
      0086EE 4F               [ 2] 1429         LDW (X),Y
      0086EF 46               [ 4] 1430         RET
                                   1431 
                                   1432 ;       NEGATE  ( n -- -n )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



                                   1433 ;       Two's complement of tos.
      0086F0 46 53                 1434         .word      LINK
                           000702  1435 LINK = . 
      0086F2 45                    1436         .byte      6
      0086F3 54 45 47 41 54 45     1437         .ascii     "NEGATE"
      0086F4                       1438 NEGAT:
      0086F4 1D 00            [ 1] 1439         LDW Y,X
      0086F6 02 90            [ 2] 1440         LDW Y,(Y)
      0086F8 AE 00            [ 2] 1441         NEGW Y
      0086FA 1C               [ 2] 1442         LDW (X),Y
      0086FB FF               [ 4] 1443         RET
                                   1444 
                                   1445 ;       DNEGATE ( d -- -d )
                                   1446 ;       Two's complement of top double.
      0086FC 81 02                 1447         .word      LINK
                           000713  1448 LINK = . 
      0086FD 07                    1449         .byte      7
      0086FD CD 86 F4 CD 84 BC CC  1450         .ascii     "DNEGATE"
      00071B                       1451 DNEGA:
      008704 87 5E            [ 1] 1452         LDW Y,X
      008706 86 ED            [ 2] 1453 	LDW Y,(Y)
      008708 04 3F            [ 2] 1454         CPLW Y     
      00870A 44 55 50         [ 2] 1455 	LDW YTEMP,Y
      00870D 90 93            [ 1] 1456         LDW Y,X
      00870D 90 93 90         [ 2] 1457         LDW Y,(2,Y)
      008710 FE 27            [ 2] 1458         CPLW Y
      008712 04 1D 00 02      [ 2] 1459         addw y,#1
      008716 FF 81            [ 2] 1460         LDW (2,X),Y
      008718 87 08 03         [ 2] 1461         LDW Y,YTEMP
      00871B 52 4F            [ 1] 1462         JRNC DN1 
      00871D 54 5C            [ 2] 1463         INCW Y
      00871E FF               [ 2] 1464 DN1:    LDW (X),Y
      00871E 90               [ 4] 1465         RET
                                   1466 
                                   1467 
                                   1468 ;       S>D ( n -- d )
                                   1469 ; convert single integer to double 
      00871F 93 90                 1470         .word LINK 
                           00073C  1471         LINK=. 
      008721 FE                    1472         .byte 3 
      008722 90 89 90              1473         .ascii "S>D"
      000740                       1474 STOD: 
      008725 93 90 EE         [ 2] 1475         subw x,#CELLL 
      008728 04 FF            [ 1] 1476         clrw y 
      00872A 90               [ 2] 1477         ldw (x),y 
      00872B 93 90            [ 1] 1478         ldw y,x 
      00872D EE 02 EF         [ 2] 1479         ldw y,(2,y)
      008730 04 90            [ 1] 1480         jrpl 1$ 
      008732 85 EF 02 81      [ 2] 1481         ldw y,#-1
      008736 87               [ 2] 1482         ldw (x),y 
      008737 1A               [ 4] 1483 1$:     ret 
                                   1484 
                                   1485 
                                   1486 
                                   1487 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1488 ;       -       ( n1 n2 -- n1-n2 )
                                   1489 ;       Subtraction.
      008738 05 32                 1490         .word      LINK
                           000755  1491 LINK = . 
      00873A 44                    1492         .byte      1
      00873B 52                    1493         .ascii     "-"
      000757                       1494 SUBB:
      00873C 4F 50            [ 1] 1495         LDW Y,X
      00873E 90 FE            [ 2] 1496         LDW Y,(Y)
      00873E 1C 00 04         [ 2] 1497         LDW YTEMP,Y
      008741 81 87 38         [ 2] 1498         ADDW X,#2
      008744 04 32            [ 1] 1499         LDW Y,X
      008746 44 55            [ 2] 1500         LDW Y,(Y)
      008748 50 B2 00 24      [ 2] 1501         SUBW Y,YTEMP
      008749 FF               [ 2] 1502         LDW (X),Y
      008749 1D               [ 4] 1503         RET
                                   1504 
                                   1505 ;       ABS     ( n -- n )
                                   1506 ;       Return  absolute value of n.
      00874A 00 04                 1507         .word      LINK
                           00076D  1508 LINK = . 
      00874C 90                    1509         .byte      3
      00874D 93 90 EE              1510         .ascii     "ABS"
      000771                       1511 ABSS:
      008750 06 EF            [ 1] 1512         LDW Y,X
      008752 02 90            [ 2] 1513 	LDW Y,(Y)
      008754 93 90            [ 1] 1514         JRPL     AB1     ;negate:
      008756 EE 04            [ 2] 1515         NEGW     Y     ;else negate hi byte
      008758 FF               [ 2] 1516         LDW (X),Y
      008759 81               [ 4] 1517 AB1:    RET
                                   1518 
                                   1519 ;       =       ( w w -- t )
                                   1520 ;       Return true if top two are =al.
      00875A 87 44                 1521         .word      LINK
                           00077D  1522 LINK = . 
      00875C 01                    1523         .byte      1
      00875D 2B                    1524         .ascii     "="
      00875E                       1525 EQUAL:
      00875E 90 93            [ 1] 1526         LD A,#0xFF  ;true
      008760 90 FE            [ 1] 1527         LDW Y,X    ;D = n2
      008762 90 BF            [ 2] 1528         LDW Y,(Y)
      008764 24 1C 00         [ 2] 1529         LDW YTEMP,Y
      008767 02 90 93         [ 2] 1530         ADDW X,#2
      00876A 90 FE            [ 1] 1531         LDW Y,X
      00876C 72 B9            [ 2] 1532         LDW Y,(Y)
      00876E 00 24 FF         [ 2] 1533         CPW Y,YTEMP     ;if n2 <> n1
      008771 81 87            [ 1] 1534         JREQ     EQ1
      008773 5C               [ 1] 1535         CLR A
      008774 03               [ 1] 1536 EQ1:    LD (X),A
      008775 4E 4F            [ 1] 1537         LD (1,X),A
      008777 54               [ 4] 1538 	RET     
                                   1539 
                                   1540 ;       U<      ( u u -- t )
                                   1541 ;       Unsigned compare of top two items.
      008778 07 7D                 1542         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                           00079B  1543 LINK = . 
      008778 90                    1544         .byte      2
      008779 93 90                 1545         .ascii     "U<"
      00079E                       1546 ULESS:
      00877B FE 90            [ 1] 1547         LD A,#0xFF  ;true
      00877D 53 FF            [ 1] 1548         LDW Y,X    ;D = n2
      00877F 81 87            [ 2] 1549         LDW Y,(Y)
      008781 74 06 4E         [ 2] 1550         LDW YTEMP,Y
      008784 45 47 41         [ 2] 1551         ADDW X,#2
      008787 54 45            [ 1] 1552         LDW Y,X
      008789 90 FE            [ 2] 1553         LDW Y,(Y)
      008789 90 93 90         [ 2] 1554         CPW Y,YTEMP     ;if n2 <> n1
      00878C FE 90            [ 1] 1555         JRULT     ULES1
      00878E 50               [ 1] 1556         CLR A
      00878F FF               [ 1] 1557 ULES1:  LD (X),A
      008790 81 87            [ 1] 1558         LD (1,X),A
      008792 82               [ 4] 1559 	RET     
                                   1560 
                                   1561 ;       <       ( n1 n2 -- t )
                                   1562 ;       Signed compare of top two items.
      008793 07 44                 1563         .word      LINK
                           0007BA  1564 LINK = . 
      008795 4E                    1565         .byte      1
      008796 45                    1566         .ascii     "<"
      0007BC                       1567 LESS:
      008797 47 41            [ 1] 1568         LD A,#0xFF  ;true
      008799 54 45            [ 1] 1569         LDW Y,X    ;D = n2
      00879B 90 FE            [ 2] 1570         LDW Y,(Y)
      00879B 90 93 90         [ 2] 1571         LDW YTEMP,Y
      00879E FE 90 53         [ 2] 1572         ADDW X,#2
      0087A1 90 BF            [ 1] 1573         LDW Y,X
      0087A3 24 90            [ 2] 1574         LDW Y,(Y)
      0087A5 93 90 EE         [ 2] 1575         CPW Y,YTEMP     ;if n2 <> n1
      0087A8 02 90            [ 1] 1576         JRSLT     LT1
      0087AA 53               [ 1] 1577         CLR A
      0087AB 72               [ 1] 1578 LT1:    LD (X),A
      0087AC A9 00            [ 1] 1579         LD (1,X),A
      0087AE 01               [ 4] 1580 	RET     
                                   1581 
                                   1582 ;       MAX     ( n n -- n )
                                   1583 ;       Return greater of two top items.
      0087AF EF 02                 1584         .word      LINK
                           0007D8  1585 LINK = . 
      0087B1 90                    1586         .byte      3
      0087B2 BE 24 24              1587         .ascii     "MAX"
      0007DC                       1588 MAX:
      0087B5 02 90            [ 1] 1589         LDW Y,X    ;D = n2
      0087B7 5C FF 81         [ 2] 1590         LDW Y,(2,Y)
      0087BA 87 93 03         [ 2] 1591         LDW YTEMP,Y
      0087BD 53 3E            [ 1] 1592         LDW Y,X
      0087BF 44 FE            [ 2] 1593         LDW Y,(Y)
      0087C0 90 B3 24         [ 2] 1594         CPW Y,YTEMP     ;if n2 <> n1
      0087C0 1D 00            [ 1] 1595         JRSLT     MAX1
      0087C2 02 90            [ 2] 1596         LDW (2,X),Y
      0087C4 5F FF 90         [ 2] 1597 MAX1:   ADDW X,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      0087C7 93               [ 4] 1598 	RET     
                                   1599 
                                   1600 ;       MIN     ( n n -- n )
                                   1601 ;       Return smaller of top two items.
      0087C8 90 EE                 1602         .word      LINK
                           0007F5  1603 LINK = . 
      0087CA 02                    1604         .byte      3
      0087CB 2A 05 90              1605         .ascii     "MIN"
      0007F9                       1606 MIN:
      0087CE AE FF            [ 1] 1607         LDW Y,X    ;D = n2
      0087D0 FF FF 81         [ 2] 1608         LDW Y,(2,Y)
      0087D3 87 BC 01         [ 2] 1609         LDW YTEMP,Y
      0087D6 2D 93            [ 1] 1610         LDW Y,X
      0087D7 90 FE            [ 2] 1611         LDW Y,(Y)
      0087D7 90 93 90         [ 2] 1612         CPW Y,YTEMP     ;if n2 <> n1
      0087DA FE 90            [ 1] 1613         JRSGT     MIN1
      0087DC BF 24            [ 2] 1614         LDW (2,X),Y
      0087DE 1C 00 02         [ 2] 1615 MIN1:	ADDW X,#2
      0087E1 90               [ 4] 1616 	RET     
                                   1617 
                                   1618 ;       WITHIN  ( u ul uh -- t )
                                   1619 ;       Return true if u is within
                                   1620 ;       range of ul and uh. ( ul <= u < uh )
      0087E2 93 90                 1621         .word      LINK
                           000812  1622 LINK = . 
      0087E4 FE                    1623         .byte      6
      0087E5 72 B2 00 24 FF 81     1624         .ascii     "WITHIN"
      000819                       1625 WITHI:
      0087EB 87 D5 03         [ 4] 1626         CALL     OVER
      0087EE 41 42 53         [ 4] 1627         CALL     SUBB
      0087F1 CD 04 AC         [ 4] 1628         CALL     TOR
      0087F1 90 93 90         [ 4] 1629         CALL     SUBB
      0087F4 FE 2A 03         [ 4] 1630         CALL     RFROM
      0087F7 90 50 FF         [ 2] 1631         JP     ULESS
                                   1632 
                                   1633 ;; Divide
                                   1634 
                                   1635 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1636 ;       Unsigned divide of a double by a
                                   1637 ;       single. Return mod and quotient.
      0087FA 81 87                 1638         .word      LINK
                           00082D  1639 LINK = . 
      0087FC ED                    1640         .byte      6
      0087FD 01 3D 2F 4D 4F 44     1641         .ascii     "UM/MOD"
      0087FF                       1642 UMMOD:
      0087FF A6 FF            [ 2] 1643 	LDW XTEMP,X	; save stack pointer
      008801 90               [ 2] 1644 	LDW X,(X)	; un
      008802 93 90            [ 2] 1645 	LDW YTEMP,X     ; save un
      008804 FE 90 BF         [ 2] 1646 	LDW Y,XTEMP	; stack pointer
      008807 24 1C 00         [ 2] 1647 	LDW Y,(4,Y)     ; Y=udl
      00880A 02 90            [ 2] 1648 	LDW X,XTEMP
      00880C 93 90            [ 2] 1649 	LDW X,(2,X)	; X=udh
      00880E FE 90            [ 2] 1650 	CPW X,YTEMP
      008810 B3 24            [ 2] 1651 	JRULE MMSM1
      008812 27 01            [ 2] 1652 	LDW X,XTEMP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008814 4F F7 E7         [ 2] 1653 	ADDW X,#2	; pop off 1 level
      008817 01 81 87 FD      [ 2] 1654 	LDW Y,#0xFFFF
      00881B 02               [ 2] 1655 	LDW (X),Y
      00881C 55 3C            [ 1] 1656 	CLRW Y
      00881E EF 02            [ 2] 1657 	LDW (2,X),Y
      00881E A6               [ 4] 1658 	RET
      000856                       1659 MMSM1:
                                   1660 ; take advantage of divw x,y when udh==0
      00881F FF               [ 2] 1661         tnzw x  ; is udh==0?
      008820 90 93            [ 1] 1662         jrne MMSM2 
      008822 90               [ 1] 1663         ldw x,y    ;udl 
      008823 FE 90 BF         [ 2] 1664         ldw y,YTEMP ; divisor 
      008826 24               [ 2] 1665         divw x,y 
      008827 1C               [ 2] 1666         pushw x     ; quotient 
      008828 00 02            [ 2] 1667         ldw x,XTEMP 
      00882A 90 93 90         [ 2] 1668         addw x,#CELLL 
      00882D FE 90            [ 2] 1669         ldw (2,x),y  ; ur
      00882F B3 24            [ 2] 1670         popw y 
      008831 25               [ 2] 1671         ldw (x),y ; uq 
      008832 01               [ 4] 1672         ret 
      00086A                       1673 MMSM2:        
      008833 4F F7            [ 1] 1674 	LD A,#17	; loop count
      00086C                       1675 MMSM3:
      008835 E7 01            [ 2] 1676 	CPW X,YTEMP	; compare udh to un
      008837 81 88            [ 1] 1677 	JRULT MMSM4	; can't subtract
      008839 1B 01 3C 24      [ 2] 1678 	SUBW X,YTEMP	; can subtract
      00883C                       1679 MMSM4:
      00883C A6               [ 1] 1680 	CCF	; quotient bit
      00883D FF 90            [ 2] 1681 	RLCW Y	; rotate into quotient
      00883F 93               [ 2] 1682 	RLCW X	; rotate into remainder
      008840 90               [ 1] 1683 	DEC A	; repeat
      008841 FE 90            [ 1] 1684 	JRUGT MMSM3
      008843 BF               [ 2] 1685         RRCW X 
      008844 24 1C            [ 2] 1686 	LDW YTEMP,X	; done, save remainder
      008846 00 02            [ 2] 1687 	LDW X,XTEMP
      008848 90 93 90         [ 2] 1688 	ADDW X,#2	; drop
      00884B FE               [ 2] 1689 	LDW (X),Y
      00884C 90 B3 24         [ 2] 1690 	LDW Y,YTEMP	; save quotient
      00884F 2F 01            [ 2] 1691 	LDW (2,X),Y
      008851 4F               [ 4] 1692 	RET
                                   1693 	
                                   1694 ;       M/MOD   ( d n -- r q )
                                   1695 ;       Signed floored divide of double by
                                   1696 ;       single. Return mod and quotient.
      008852 F7 E7                 1697         .word      LINK
                           00088C  1698 LINK = . 
      008854 01                    1699         .byte      5
      008855 81 88 3A 03 4D        1700         .ascii     "M/MOD"
      000892                       1701 MSMOD:  
      00885A 41 58 E3         [ 4] 1702         CALL	DUPP
      00885C CD 05 1C         [ 4] 1703         CALL	ZLESS
      00885C 90 93 90         [ 4] 1704         CALL	DUPP
      00885F EE 02 90         [ 4] 1705         CALL	TOR
      008862 BF 24 90         [ 4] 1706         CALL	QBRAN
      008865 93 90                 1707         .word	MMOD1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008867 FE 90 B3         [ 4] 1708         CALL	NEGAT
      00886A 24 2F 02         [ 4] 1709         CALL	TOR
      00886D EF 02 1C         [ 4] 1710         CALL	DNEGA
      008870 00 02 81         [ 4] 1711         CALL	RFROM
      008873 88 58 03         [ 4] 1712 MMOD1:	CALL	TOR
      008876 4D 49 4E         [ 4] 1713         CALL	DUPP
      008879 CD 05 1C         [ 4] 1714         CALL	ZLESS
      008879 90 93 90         [ 4] 1715         CALL	QBRAN
      00887C EE 02                 1716         .word	MMOD2
      00887E 90 BF 24         [ 4] 1717         CALL	RAT
      008881 90 93 90         [ 4] 1718         CALL	PLUS
      008884 FE 90 B3         [ 4] 1719 MMOD2:	CALL	RFROM
      008887 24 2C 02         [ 4] 1720         CALL	UMMOD
      00888A EF 02 1C         [ 4] 1721         CALL	RFROM
      00888D 00 02 81         [ 4] 1722         CALL	QBRAN
      008890 88 75                 1723         .word	MMOD3
      008892 06 57 49         [ 4] 1724         CALL	SWAPP
      008895 54 48 49         [ 4] 1725         CALL	NEGAT
      008898 4E 04 F3         [ 4] 1726         CALL	SWAPP
      008899 81               [ 4] 1727 MMOD3:	RET
                                   1728 
                                   1729 ;       /MOD    ( n n -- r q )
                                   1730 ;       Signed divide. Return mod and quotient.
      008899 CD 85                 1731         .word      LINK
                           0008DD  1732 LINK = . 
      00889B 8D                    1733         .byte      4
      00889C CD 87 D7 CD           1734         .ascii     "/MOD"
      0008E2                       1735 SLMOD:
      0088A0 85 2C CD         [ 4] 1736         CALL	OVER
      0088A3 87 D7 CD         [ 4] 1737         CALL	ZLESS
      0088A6 85 0D CC         [ 4] 1738         CALL	SWAPP
      0088A9 88 1E 88         [ 2] 1739         JP	MSMOD
                                   1740 
                                   1741 ;       MOD     ( n n -- r )
                                   1742 ;       Signed divide. Return mod only.
      0088AC 92 06                 1743         .word      LINK
                           0008F0  1744 LINK = . 
      0088AE 55                    1745         .byte      3
      0088AF 4D 2F 4D              1746         .ascii     "MOD"
      0008F4                       1747 MODD:
      0088B2 4F 44 E2         [ 4] 1748 	CALL	SLMOD
      0088B4 CC 04 D9         [ 2] 1749 	JP	DROP
                                   1750 
                                   1751 ;       /       ( n n -- q )
                                   1752 ;       Signed divide. Return quotient only.
      0088B4 BF 22                 1753         .word      LINK
                           0008FC  1754 LINK = . 
      0088B6 FE                    1755         .byte      1
      0088B7 BF                    1756         .ascii     "/"
      0008FE                       1757 SLASH:
      0088B8 24 90 BE         [ 4] 1758         CALL	SLMOD
      0088BB 22 90 EE         [ 4] 1759         CALL	SWAPP
      0088BE 04 BE 22         [ 2] 1760         JP	DROP
                                   1761 
                                   1762 ;; Multiply
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1763 
                                   1764 ;       UM*     ( u u -- ud )
                                   1765 ;       Unsigned multiply. Return double product.
      0088C1 EE 02                 1766         .word      LINK
                           000909  1767 LINK = . 
      0088C3 B3                    1768         .byte      3
      0088C4 24 23 0F              1769         .ascii     "UM*"
      00090D                       1770 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                                   1771 ; take advantage of SP addressing modes
                                   1772 ; these PRODx in RAM are not required
                                   1773 ; the product is kept on stack as local variable 
                                   1774         ;; bytes offset on data stack 
                           000002  1775         da=2 
                           000003  1776         db=3 
                           000000  1777         dc=0 
                           000001  1778         dd=1 
                                   1779         ;; product bytes offset on return stack 
                           000001  1780         UD1=1  ; ud bits 31..24
                           000002  1781         UD2=2  ; ud bits 23..16
                           000003  1782         UD3=3  ; ud bits 15..8 
                           000004  1783         UD4=4  ; ud bits 7..0 
                                   1784         ;; local variable for product set to zero   
      0088C7 BE 22            [ 1] 1785         clrw y 
      0088C9 1C 00            [ 2] 1786         pushw y  ; bits 15..0
      0088CB 02 90            [ 2] 1787         pushw y  ; bits 31..16 
      0088CD AE FF            [ 1] 1788         ld a,(db,x) ; b 
      0088CF FF FF            [ 1] 1789         ld yl,a 
      0088D1 90 5F            [ 1] 1790         ld a,(dd,x)   ; d
      0088D3 EF 02            [ 4] 1791         mul y,a    ; b*d  
      0088D5 81 03            [ 2] 1792         ldw (UD3,sp),y ; lowest weight product 
      0088D6 E6 03            [ 1] 1793         ld a,(db,x)
      0088D6 5D 26            [ 1] 1794         ld yl,a 
      0088D8 11 93            [ 1] 1795         ld a,(dc,x)
      0088DA 90 BE            [ 4] 1796         mul y,a  ; b*c 
                                   1797         ;;; do the partial sum 
      0088DC 24 65 89         [ 2] 1798         addw y,(UD2,sp)
      0088DF BE               [ 1] 1799         clr a 
      0088E0 22               [ 1] 1800         rlc a
      0088E1 1C 00            [ 1] 1801         ld (UD1,sp),a 
      0088E3 02 EF            [ 2] 1802         ldw (UD2,sp),y 
      0088E5 02 90            [ 1] 1803         ld a,(da,x)
      0088E7 85 FF            [ 1] 1804         ld yl,a 
      0088E9 81 01            [ 1] 1805         ld a,(dd,x)
      0088EA 90 42            [ 4] 1806         mul y,a   ; a*d 
                                   1807         ;; do partial sum 
      0088EA A6 11 02         [ 2] 1808         addw y,(UD2,sp)
      0088EC 4F               [ 1] 1809         clr a 
      0088EC B3 24            [ 1] 1810         adc a,(UD1,sp)
      0088EE 25 04            [ 1] 1811         ld (UD1,sp),a  
      0088F0 72 B0            [ 2] 1812         ldw (UD2,sp),y 
      0088F2 00 24            [ 1] 1813         ld a,(da,x)
      0088F4 90 97            [ 1] 1814         ld yl,a 
      0088F4 8C 90            [ 1] 1815         ld a,(dc,x)
      0088F6 59 59            [ 4] 1816         mul y,a  ;  a*c highest weight product 
                                   1817         ;;; do partial sum 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      0088F8 4A 22 F1         [ 2] 1818         addw y,(UD1,sp)
      0088FB 56               [ 2] 1819         ldw (x),y  ; udh 
      0088FC BF 24            [ 2] 1820         ldw y,(UD3,sp)
      0088FE BE 22            [ 2] 1821         ldw (2,x),y  ; udl  
      008900 1C 00            [ 2] 1822         addw sp,#4 ; drop local variable 
      008902 02               [ 4] 1823         ret  
                                   1824 
                                   1825 
                                   1826 ;       *       ( n n -- n )
                                   1827 ;       Signed multiply. Return single product.
      008903 FF 90                 1828         .word      LINK
                           000955  1829 LINK = . 
      008905 BE                    1830         .byte      1
      008906 24                    1831         .ascii     "*"
      000957                       1832 STAR:
      008907 EF 02 81         [ 4] 1833 	CALL	UMSTA
      00890A 88 AD 05         [ 2] 1834 	JP	DROP
                                   1835 
                                   1836 ;       M*      ( n n -- d )
                                   1837 ;       Signed multiply. Return double product.
      00890D 4D 2F                 1838         .word      LINK
                           00095F  1839 LINK = . 
      00890F 4D                    1840         .byte      2
      008910 4F 44                 1841         .ascii     "M*"
      008912                       1842 MSTAR:      
      008912 CD 85 63         [ 4] 1843         CALL	DDUP
      008915 CD 85 9C         [ 4] 1844         CALL	XORR
      008918 CD 85 63         [ 4] 1845         CALL	ZLESS
      00891B CD 85 2C         [ 4] 1846         CALL	TOR
      00891E CD 84 67         [ 4] 1847         CALL	ABSS
      008921 89 2F CD         [ 4] 1848         CALL	SWAPP
      008924 87 89 CD         [ 4] 1849         CALL	ABSS
      008927 85 2C CD         [ 4] 1850         CALL	UMSTA
      00892A 87 9B CD         [ 4] 1851         CALL	RFROM
      00892D 85 0D CD         [ 4] 1852         CALL	QBRAN
      008930 85 2C                 1853         .word	MSTA1
      008932 CD 85 63         [ 4] 1854         CALL	DNEGA
      008935 CD               [ 4] 1855 MSTA1:	RET
                                   1856 
                                   1857 ;       */MOD   ( n1 n2 n3 -- r q )
                                   1858 ;       Multiply n1 and n2, then divide
                                   1859 ;       by n3. Return mod and quotient.
      008936 85 9C                 1860         .word      LINK
                           000988  1861 LINK = . 
      008938 CD                    1862         .byte      5
      008939 84 67 89 43 CD        1863         .ascii     "*/MOD"
      00098E                       1864 SSMOD:
      00893E 85 20 CD         [ 4] 1865         CALL     TOR
      008941 87 5E CD         [ 4] 1866         CALL     MSTAR
      008944 85 0D CD         [ 4] 1867         CALL     RFROM
      008947 88 B4 CD         [ 2] 1868         JP     MSMOD
                                   1869 
                                   1870 ;       */      ( n1 n2 n3 -- q )
                                   1871 ;       Multiply n1 by n2, then divide
                                   1872 ;       by n3. Return quotient only.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      00894A 85 0D                 1873         .word      LINK
                           00099C  1874 LINK = . 
      00894C CD                    1875         .byte      2
      00894D 84 67                 1876         .ascii     "*/"
      00099F                       1877 STASL:
      00894F 89 5A CD         [ 4] 1878         CALL	SSMOD
      008952 85 73 CD         [ 4] 1879         CALL	SWAPP
      008955 87 89 CD         [ 2] 1880         JP	DROP
                                   1881 
                                   1882 ;; Miscellaneous
                                   1883 
                                   1884 ;       CELL+   ( a -- a )
                                   1885 ;       Add cell size in byte to address.
      008958 85 73                 1886         .word      LINK
                           0009AA  1887 LINK = . 
      00895A 81                    1888         .byte       2
      00895B 89 0C                 1889         .ascii     "2+"
      0009AD                       1890 CELLP:
      00895D 04 2F            [ 1] 1891         LDW Y,X
      00895F 4D 4F            [ 2] 1892 	LDW Y,(Y)
      008961 44 A9 00 02      [ 2] 1893         ADDW Y,#CELLL 
      008962 FF               [ 2] 1894         LDW (X),Y
      008962 CD               [ 4] 1895         RET
                                   1896 
                                   1897 ;       CELL-   ( a -- a )
                                   1898 ;       Subtract 2 from address.
      008963 85 8D                 1899         .word      LINK
                           0009B9  1900 LINK = . 
      008965 CD                    1901         .byte       2
      008966 85 9C                 1902         .ascii     "2-"
      0009BC                       1903 CELLM:
      008968 CD 85            [ 1] 1904         LDW Y,X
      00896A 73 CC            [ 2] 1905 	LDW Y,(Y)
      00896C 89 12 89 5D      [ 2] 1906         SUBW Y,#CELLL
      008970 03               [ 2] 1907         LDW (X),Y
      008971 4D               [ 4] 1908         RET
                                   1909 
                                   1910 ;       CELLS   ( n -- n )
                                   1911 ;       Multiply tos by 2.
      008972 4F 44                 1912         .word      LINK
                           0009C8  1913 LINK = . 
      008974 02                    1914         .byte       2
      008974 CD 89                 1915         .ascii     "2*"
      0009CB                       1916 CELLS:
      008976 62 CC            [ 1] 1917         LDW Y,X
      008978 85 59            [ 2] 1918 	LDW Y,(Y)
      00897A 89 70            [ 2] 1919         SLAW Y
      00897C 01               [ 2] 1920         LDW (X),Y
      00897D 2F               [ 4] 1921         RET
                                   1922 
                                   1923 ;       1+      ( a -- a )
                                   1924 ;       Add cell size in byte to address.
      00897E 09 C8                 1925         .word      LINK
                           0009D5  1926 LINK = . 
      00897E CD                    1927         .byte      2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      00897F 89 62                 1928         .ascii     "1+"
      0009D8                       1929 ONEP:
      008981 CD 85            [ 1] 1930         LDW Y,X
      008983 73 CC            [ 2] 1931 	LDW Y,(Y)
      008985 85 59            [ 2] 1932         INCW Y
      008987 89               [ 2] 1933         LDW (X),Y
      008988 7C               [ 4] 1934         RET
                                   1935 
                                   1936 ;       1-      ( a -- a )
                                   1937 ;       Subtract 2 from address.
      008989 03 55                 1938         .word      LINK
                           0009E2  1939 LINK = . 
      00898B 4D                    1940         .byte      2
      00898C 2A 2D                 1941         .ascii     "1-"
      00898D                       1942 ONEM:
      00898D 90 5F            [ 1] 1943         LDW Y,X
      00898F 90 89            [ 2] 1944 	LDW Y,(Y)
      008991 90 89            [ 2] 1945         DECW Y
      008993 E6               [ 2] 1946         LDW (X),Y
      008994 03               [ 4] 1947         RET
                                   1948 
                                   1949 ;  shift left n times 
                                   1950 ; LSHIFT ( n1 n2 -- n1<<n2 )
      008995 90 97                 1951         .word LINK 
                           0009EF  1952         LINK=.
      008997 E6                    1953         .byte 6 
      008998 01 90 42 17 03 E6     1954         .ascii "LSHIFT"
      0009F6                       1955 LSHIFT:
      00899E 03 90            [ 1] 1956         ld a,(1,x)
      0089A0 97 E6 00         [ 2] 1957         addw x,#CELLL 
      0089A3 90 42            [ 1] 1958         ldw y,x 
      0089A5 72 F9            [ 2] 1959         ldw y,(y)
      0009FF                       1960 LSHIFT1:
      0089A7 02               [ 1] 1961         tnz a 
      0089A8 4F 49            [ 1] 1962         jreq LSHIFT4 
      0089AA 6B 01            [ 2] 1963         sllw y 
      0089AC 17               [ 1] 1964         dec a 
      0089AD 02 E6            [ 2] 1965         jra LSHIFT1 
      000A07                       1966 LSHIFT4:
      0089AF 02               [ 2] 1967         ldw (x),y 
      0089B0 90               [ 4] 1968         ret 
                                   1969 
                                   1970 ; shift right n times                 
                                   1971 ; RSHIFT (n1 n2 -- n1>>n2 )
      0089B1 97 E6                 1972         .word LINK 
                           000A0B  1973         LINK=.
      0089B3 01                    1974         .byte 6
      0089B4 90 42 72 F9 02 4F     1975         .ascii "RSHIFT"
      000A12                       1976 RSHIFT:
      0089BA 19 01            [ 1] 1977         ld a,(1,x)
      0089BC 6B 01 17         [ 2] 1978         addw x,#CELLL 
      0089BF 02 E6            [ 1] 1979         ldw y,x 
      0089C1 02 90            [ 2] 1980         ldw y,(y)
      000A1B                       1981 RSHIFT1:
      0089C3 97               [ 1] 1982         tnz a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      0089C4 E6 00            [ 1] 1983         jreq RSHIFT4 
      0089C6 90 42            [ 2] 1984         srlw y 
      0089C8 72               [ 1] 1985         dec a 
      0089C9 F9 01            [ 2] 1986         jra RSHIFT1 
      000A23                       1987 RSHIFT4:
      0089CB FF               [ 2] 1988         ldw (x),y 
      0089CC 16               [ 4] 1989         ret 
                                   1990 
                                   1991 
                                   1992 ;       2/      ( n -- n )
                                   1993 ;       divide  tos by 2.
      0089CD 03 EF                 1994         .word      LINK
                           000A27  1995 LINK = . 
      0089CF 02                    1996         .byte      2
      0089D0 5B 04                 1997         .ascii     "2/"
      000A2A                       1998 TWOSL:
      0089D2 81 89            [ 1] 1999         LDW Y,X
      0089D4 89 01            [ 2] 2000 	LDW Y,(Y)
      0089D6 2A 57            [ 2] 2001         SRAW Y
      0089D7 FF               [ 2] 2002         LDW (X),Y
      0089D7 CD               [ 4] 2003         RET
                                   2004 
                                   2005 ;       BL      ( -- 32 )
                                   2006 ;       Return 32,  blank character.
      0089D8 89 8D                 2007         .word      LINK
                           000A34  2008 LINK = . 
      0089DA CC                    2009         .byte      2
      0089DB 85 59                 2010         .ascii     "BL"
      000A37                       2011 BLANK:
      0089DD 89 D5 02         [ 2] 2012         SUBW X,#2
      0089E0 4D 2A 00 20      [ 2] 2013 	LDW Y,#32
      0089E2 FF               [ 2] 2014         LDW (X),Y
      0089E2 CD               [ 4] 2015         RET
                                   2016 
                                   2017 ;         0     ( -- 0)
                                   2018 ;         Return 0.
      0089E3 87 49                 2019         .word      LINK
                           000A42  2020 LINK = . 
      0089E5 CD                    2021         .byte       1
      0089E6 85                    2022         .ascii     "0"
      000A44                       2023 ZERO:
      0089E7 D8 CD 85         [ 2] 2024         SUBW X,#2
      0089EA 9C CD            [ 1] 2025 	CLRW Y
      0089EC 85               [ 2] 2026         LDW (X),Y
      0089ED 2C               [ 4] 2027         RET
                                   2028 
                                   2029 ;         1     ( -- 1)
                                   2030 ;         Return 1.
      0089EE CD 87                 2031         .word      LINK
                           000A4D  2032 LINK = . 
      0089F0 F1                    2033         .byte       1
      0089F1 CD                    2034         .ascii     "1"
      000A4F                       2035 ONE:
      0089F2 85 73 CD         [ 2] 2036         SUBW X,#2
      0089F5 87 F1 CD 89      [ 2] 2037 	LDW Y,#1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      0089F9 8D               [ 2] 2038         LDW (X),Y
      0089FA CD               [ 4] 2039         RET
                                   2040 
                                   2041 ;         -1    ( -- -1)
                                   2042 ;         Return 32,  blank character.
      0089FB 85 0D                 2043         .word      LINK
                           000A5A  2044 LINK = . 
      0089FD CD                    2045         .byte       2
      0089FE 84 67                 2046         .ascii     "-1"
      000A5D                       2047 MONE:
      008A00 8A 05 CD         [ 2] 2048         SUBW X,#2
      008A03 87 9B 81 89      [ 2] 2049 	LDW Y,#0xFFFF
      008A07 DF               [ 2] 2050         LDW (X),Y
      008A08 05               [ 4] 2051         RET
                                   2052 
                                   2053 ;       >CHAR   ( c -- c )
                                   2054 ;       Filter non-printing characters.
      008A09 2A 2F                 2055         .word      LINK
                           000A68  2056 LINK = . 
      008A0B 4D                    2057         .byte      5
      008A0C 4F 44 48 41 52        2058         .ascii     ">CHAR"
      008A0E                       2059 TCHAR:
      008A0E CD 85            [ 1] 2060         ld a,(1,x)
      008A10 2C CD            [ 1] 2061         cp a,#32  
      008A12 89 E2            [ 1] 2062         jrmi 1$ 
      008A14 CD 85            [ 1] 2063         cp a,#127 
      008A16 0D CC            [ 1] 2064         jrpl 1$ 
      008A18 89               [ 4] 2065         ret 
      008A19 12 8A            [ 1] 2066 1$:     ld a,#'_ 
      008A1B 08 02            [ 1] 2067         ld (1,x),a 
      008A1D 2A               [ 4] 2068         ret 
                                   2069 
                                   2070 ;       DEPTH   ( -- n )
                                   2071 ;       Return  depth of  data stack.
      008A1E 2F 68                 2072         .word      LINK
                           000A80  2073 LINK = . 
      008A1F 05                    2074         .byte      5
      008A1F CD 8A 0E CD 85        2075         .ascii     "DEPTH"
      000A86                       2076 DEPTH: 
      008A24 73 CC 85         [ 2] 2077         LDW Y,SP0    ;save data stack ptr
      008A27 59 8A            [ 2] 2078 	LDW XTEMP,X
      008A29 1C 02 32 2B      [ 2] 2079         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008A2D 90 57            [ 2] 2080         SRAW Y    ;Y = #stack items
      008A2D 90 93 90         [ 2] 2081 	SUBW X,#2
      008A30 FE               [ 2] 2082         LDW (X),Y     ; if neg, underflow
      008A31 72               [ 4] 2083         RET
                                   2084 
                                   2085 ;       PICK    ( ... +n -- ... w )
                                   2086 ;       Copy  nth stack item to tos.
      008A32 A9 00                 2087         .word      LINK
                           000A98  2088 LINK = . 
      008A34 02                    2089         .byte      4
      008A35 FF 81 8A 2A           2090         .ascii     "PICK"
      000A9D                       2091 PICK:
      008A39 02 32            [ 1] 2092         LDW Y,X   ;D = n1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008A3B 2D FE            [ 2] 2093         LDW Y,(Y)
                                   2094 ; modified for standard compliance          
                                   2095 ; 0 PICK must be equivalent to DUP 
      008A3C 90 5C            [ 2] 2096         INCW Y 
      008A3C 90 93            [ 2] 2097         SLAW Y
      008A3E 90 FE            [ 2] 2098         LDW XTEMP,X
      008A40 72 A2 00 02      [ 2] 2099         ADDW Y,XTEMP
      008A44 FF 81            [ 2] 2100         LDW Y,(Y)
      008A46 8A               [ 2] 2101         LDW (X),Y
      008A47 39               [ 4] 2102         RET
                                   2103 
                                   2104 ;; Memory access
                                   2105 
                                   2106 ;       +!      ( n a -- )
                                   2107 ;       Add n to  contents at address a.
      008A48 02 32                 2108         .word      LINK
                           000AB1  2109 LINK = . 
      008A4A 2A                    2110         .byte      2
      008A4B 2B 21                 2111         .ascii     "+!"
      000AB4                       2112 PSTOR:
      008A4B 90 93            [ 1] 2113         ldw y,x 
      008A4D 90 FE            [ 2] 2114         ldw y,(y)
      008A4F 90 58 FF         [ 2] 2115         ldw YTEMP,y  ; address
      008A52 81 8A            [ 2] 2116         ldw y,(y)  
      008A54 48 02            [ 2] 2117         pushw y  ; value at address 
      008A56 31 2B            [ 1] 2118         ldw y,x 
      008A58 90 EE 02         [ 2] 2119         ldw y,(2,y) ; n 
      008A58 90 93 90         [ 2] 2120         addw y,(1,sp) ; n+value
      008A5B FE 90 5C         [ 5] 2121         ldw [YTEMP],y ;  a!
      008A5E FF 81            [ 2] 2122         popw y    ;drop local var
      008A60 8A 55 02         [ 2] 2123         addw x,#4 ; DDROP 
      008A63 31               [ 4] 2124         ret 
                                   2125 
                                   2126 ;       2!      ( d a -- )
                                   2127 ;       Store  double integer to address a.
      008A64 2D B1                 2128         .word      LINK
                           000AD2  2129 LINK = . 
      008A65 02                    2130         .byte      2
      008A65 90 93                 2131         .ascii     "2!"
      000AD5                       2132 DSTOR:
      008A67 90 FE            [ 1] 2133         ldw y,x 
      008A69 90 5A            [ 2] 2134         ldw y,(y)
      008A6B FF 81 8A         [ 2] 2135         ldw YTEMP,y ; address 
      008A6E 62 06 4C         [ 2] 2136         addw x,#CELLL ; drop a 
      008A71 53 48            [ 1] 2137         ldw y,x 
      008A73 49 46            [ 2] 2138         ldw y,(y) ; hi word 
      008A75 54               [ 2] 2139         pushw x 
      008A76 EE 02            [ 2] 2140         ldw x,(2,x) ; lo word 
      008A76 E6 01 1C         [ 5] 2141         ldw [YTEMP],y
      008A79 00 02            [ 1] 2142         ldw y,x 
      008A7B 90 93 90         [ 2] 2143         ldw x,#2 
      008A7E FE DF 24         [ 5] 2144         ldw ([YTEMP],x),y 
      008A7F 85               [ 2] 2145         popw x 
      008A7F 4D 27 05         [ 2] 2146         addw x,#4 ; DDROP 
      008A82 90               [ 4] 2147         ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2148 
                                   2149 ;       2@      ( a -- d )
                                   2150 ;       Fetch double integer from address a.
      008A83 58 4A                 2151         .word      LINK
                           000AF8  2152 LINK = . 
      008A85 20                    2153         .byte      2
      008A86 F8 40                 2154         .ascii     "2@"
      008A87                       2155 DAT:
      008A87 FF 81            [ 1] 2156         ldw y,x 
      008A89 8A 6F            [ 2] 2157         ldw y,(y) ;address 
      008A8B 06 52 53         [ 2] 2158         ldw YTEMP,y 
      008A8E 48 49 46         [ 2] 2159         subw x,#CELLL ; space for udh 
      008A91 54 CE 24         [ 5] 2160         ldw y,[YTEMP] ; udh 
      008A92 FF               [ 2] 2161         ldw (x),y 
      008A92 E6 01 1C 00      [ 2] 2162         ldw y,#2
      008A96 02 90 93         [ 5] 2163         ldw y,([YTEMP],y) ; udl 
      008A99 90 FE            [ 2] 2164         ldw (2,x),y
      008A9B 81               [ 4] 2165         ret 
                                   2166 
                                   2167 ;       COUNT   ( b -- b +n )
                                   2168 ;       Return count byte of a string
                                   2169 ;       and add 1 to byte address.
      008A9B 4D 27                 2170         .word      LINK
                           000B15  2171 LINK = . 
      008A9D 05                    2172         .byte      5
      008A9E 90 54 4A 20 F8        2173         .ascii     "COUNT"
      008AA3                       2174 COUNT:
      008AA3 FF 81            [ 1] 2175         ldw y,x 
      008AA5 8A 8B            [ 2] 2176         ldw y,(y) ; address 
      008AA7 02 32            [ 1] 2177         ld a,(y)  ; count 
      008AA9 2F 5C            [ 2] 2178         incw y 
      008AAA FF               [ 2] 2179         ldw (x),y 
      008AAA 90 93 90         [ 2] 2180         subw x,#CELLL 
      008AAD FE 90            [ 1] 2181         ld (1,x),a 
      008AAF 57               [ 1] 2182         clr (x)
      008AB0 FF               [ 4] 2183         ret 
                                   2184 
                                   2185 ;       HERE    ( -- a )
                                   2186 ;       Return  top of  variables
      008AB1 81 8A                 2187         .word      LINK
                           000B2D  2188 LINK = . 
      008AB3 A7                    2189         .byte      4
      008AB4 02 42 4C 45           2190         .ascii     "HERE"
      008AB7                       2191 HERE:
      008AB7 1D 00 02 90      [ 2] 2192       	ldw y,#UVP 
      008ABB AE 00            [ 2] 2193         ldw y,(y)
      008ABD 20 FF 81         [ 2] 2194         subw x,#CELLL 
      008AC0 8A               [ 2] 2195         ldw (x),y 
      008AC1 B4               [ 4] 2196         ret 
                                   2197 
                                   2198 ;       PAD     ( -- a )
                                   2199 ;       Return address of text buffer
                                   2200 ;       above  code dictionary.
      008AC2 01 30                 2201         .word      LINK
                           000B3F  2202 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008AC4 03                    2203         .byte      3
      008AC4 1D 00 02              2204         .ascii     "PAD"
      000B43                       2205 PAD:
      008AC7 90 5F FF         [ 4] 2206         CALL     HERE
      008ACA 81 8A C2         [ 4] 2207         CALL     DOLIT
      008ACD 01 31                 2208         .word      80
      008ACF CC 06 DE         [ 2] 2209         JP     PLUS
                                   2210 
                                   2211 ;       TIB     ( -- a )
                                   2212 ;       Return address of terminal input buffer.
      008ACF 1D 00                 2213         .word      LINK
                           000B50  2214 LINK = . 
      008AD1 02                    2215         .byte      3
      008AD2 90 AE 00              2216         .ascii     "TIB"
      000B54                       2217 TIB:
      008AD5 01 FF 81         [ 4] 2218         CALL     NTIB
      008AD8 8A CD 02         [ 4] 2219         CALL     CELLP
      008ADB 2D 31 3C         [ 2] 2220         JP     AT
                                   2221 
                                   2222 ;       @EXECUTE        ( a -- )
                                   2223 ;       Execute vector stored in address a.
      008ADD 0B 50                 2224         .word      LINK
                           000B5F  2225 LINK = . 
      008ADD 1D                    2226         .byte      8
      008ADE 00 02 90 AE FF FF FF  2227         .ascii     "@EXECUTE"
             81
      000B68                       2228 ATEXE:
      008AE6 8A DA 05         [ 4] 2229         CALL     AT
      008AE9 3E 43 48         [ 4] 2230         CALL     QDUP    ;?address or zero
      008AEC 41 52 E7         [ 4] 2231         CALL     QBRAN
      008AEE 0B 76                 2232         .word      EXE1
      008AEE E6 01 A1         [ 4] 2233         CALL     EXECU   ;execute if non-zero
      008AF1 20               [ 4] 2234 EXE1:   RET     ;do nothing if zero
                                   2235 
                                   2236 ;       CMOVE   ( b1 b2 u -- )
                                   2237 ;       Copy u bytes from b1 to b2.
      008AF2 2B 05                 2238         .word      LINK
                           000B79  2239 LINK = . 
      008AF4 A1                    2240         .byte      5
      008AF5 7F 2A 01 81 A6        2241         .ascii     "CMOVE"
      000B7F                       2242 CMOVE:
      008AFA 5F E7 01         [ 4] 2243         CALL	TOR
      008AFD 81 8A E8         [ 4] 2244         CALL	BRAN
      008B00 05 44                 2245         .word	CMOV2
      008B02 45 50 54         [ 4] 2246 CMOV1:	CALL	TOR
      008B05 48 04 E3         [ 4] 2247         CALL	DUPP
      008B06 CD 04 5A         [ 4] 2248         CALL	CAT
      008B06 90 BE 2A         [ 4] 2249         CALL	RAT
      008B09 BF 22 72         [ 4] 2250         CALL	CSTOR
      008B0C B2 00 22         [ 4] 2251         CALL	ONEP
      008B0F 90 57 1D         [ 4] 2252         CALL	RFROM
      008B12 00 02 FF         [ 4] 2253         CALL	ONEP
      008B15 81 8B 00         [ 4] 2254 CMOV2:	CALL	DONXT
      008B18 04 50                 2255         .word	CMOV1
      008B1A 49 43 4B         [ 2] 2256         JP	DDROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   2257 
                                   2258 ;       FILL    ( b u c -- )
                                   2259 ;       Fill u bytes of character c
                                   2260 ;       to area beginning at b.
      008B1D 0B 79                 2261         .word       LINK
                           000BA9  2262 LINK = . 
      008B1D 90                    2263         .byte       4
      008B1E 93 90 FE 90           2264         .ascii     "FILL"
      000BAE                       2265 FILL:
      008B22 5C 90            [ 1] 2266         ldw y,x 
      008B24 58 BF 22         [ 1] 2267         ld a,(1,y) ; c 
      008B27 72 B9 00         [ 2] 2268         addw x,#CELLL ; drop c 
      008B2A 22 90            [ 1] 2269         ldw y,x 
      008B2C FE FF            [ 2] 2270         ldw y,(y) ; count
      008B2E 81 8B            [ 2] 2271         pushw y 
      008B30 18 02 2B         [ 2] 2272         addw x,#CELLL ; drop u 
      008B33 21 93            [ 1] 2273         ldw y,x 
      008B34 1C 00 02         [ 2] 2274         addw x,#CELLL ; drop b 
      008B34 90 93            [ 2] 2275         ldw y,(y) ; address
      008B36 90 FE 90         [ 2] 2276         ldw YTEMP,y
      008B39 BF 24            [ 2] 2277         popw y ; count 
      000BCB                       2278 FILL1:  
      008B3B 90 FE 90         [ 4] 2279         ld [YTEMP],a 
      008B3E 89 90            [ 1] 2280         inc YTEMP+1
      008B40 93 90            [ 1] 2281         jrnc FILL2 
      008B42 EE 02            [ 1] 2282         inc YTEMP
      000BD4                       2283 FILL2: 
      008B44 72 F9            [ 2] 2284         decw y ; count 
      008B46 01 91            [ 1] 2285         jrne FILL1  
      008B48 CF               [ 4] 2286         ret 
                                   2287 
                                   2288 ;       ERASE   ( b u -- )
                                   2289 ;       Erase u bytes beginning at b.
      008B49 24 90                 2290         .word      LINK
                           000BDB  2291 LINK = . 
      008B4B 85                    2292         .byte      5
      008B4C 1C 00 04 81 8B        2293         .ascii     "ERASE"
      000BE1                       2294 ERASE:
      008B51 31 02            [ 1] 2295         clrw y 
      008B53 32 21 02         [ 2] 2296         subw x,#CELLL 
      008B55 FF               [ 2] 2297         ldw (x),y 
      008B55 90 93 90         [ 2] 2298         jp FILL 
                                   2299 
                                   2300 
                                   2301 ;       PACK0   ( b u a -- a )
                                   2302 ;       Build a counted string with
                                   2303 ;       u characters from b. Null fill.
      008B58 FE 90                 2304         .word      LINK
                           000BEC  2305 LINK = . 
      008B5A BF                    2306         .byte      5
      008B5B 24 1C 00 02 90        2307         .ascii     "PACK0"
      000BF2                       2308 PACKS:
      008B60 93 90 FE         [ 4] 2309         CALL     DUPP
      008B63 89 EE 02         [ 4] 2310         CALL     TOR     ;strings only on cell boundary
      008B66 91 CF 24         [ 4] 2311         CALL     DDUP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008B69 90 93 AE         [ 4] 2312         CALL     CSTOR
      008B6C 00 02 92         [ 4] 2313         CALL     ONEP ;save count
      008B6F DF 24 85         [ 4] 2314         CALL     SWAPP
      008B72 1C 00 04         [ 4] 2315         CALL     CMOVE
      008B75 81 8B 52         [ 4] 2316         CALL     RFROM
      008B78 02               [ 4] 2317         RET
                                   2318 
                                   2319 ;; Numeric output, single precision
                                   2320 
                                   2321 ;       DIGIT   ( u -- c )
                                   2322 ;       Convert digit u to a character.
      008B79 32 40                 2323         .word      LINK
                           000C0D  2324 LINK = . 
      008B7B 05                    2325         .byte      5
      008B7B 90 93 90 FE 90        2326         .ascii     "DIGIT"
      000C13                       2327 DIGIT:
      008B80 BF 24 1D         [ 4] 2328         CALL	DOLIT
      008B83 00 02                 2329         .word	9
      008B85 91 CE 24         [ 4] 2330         CALL	OVER
      008B88 FF 90 AE         [ 4] 2331         CALL	LESS
      008B8B 00 02 91         [ 4] 2332         CALL	DOLIT
      008B8E DE 24                 2333         .word	7
      008B90 EF 02 81         [ 4] 2334         CALL	ANDD
      008B93 8B 78 05         [ 4] 2335         CALL	PLUS
      008B96 43 4F 55         [ 4] 2336         CALL	DOLIT
      008B99 4E 54                 2337         .word	48	;'0'
      008B9B CC 06 DE         [ 2] 2338         JP	PLUS
                                   2339 
                                   2340 ;       EXTRACT ( n base -- n c )
                                   2341 ;       Extract least significant digit from n.
      008B9B 90 93                 2342         .word      LINK
                           000C33  2343 LINK = . 
      008B9D 90                    2344         .byte      7
      008B9E FE 90 F6 90 5C FF 1D  2345         .ascii     "EXTRACT"
      000C3B                       2346 EXTRC:
      008BA5 00 02 E7         [ 4] 2347         CALL     ZERO
      008BA8 01 7F 81         [ 4] 2348         CALL     SWAPP
      008BAB 8B 95 04         [ 4] 2349         CALL     UMMOD
      008BAE 48 45 52         [ 4] 2350         CALL     SWAPP
      008BB1 45 0C 13         [ 2] 2351         JP     DIGIT
                                   2352 
                                   2353 ;       <#      ( -- )
                                   2354 ;       Initiate  numeric output process.
      008BB2 0C 33                 2355         .word      LINK
                           000C4C  2356 LINK = . 
      008BB2 90                    2357         .byte      2
      008BB3 AE 00                 2358         .ascii     "<#"
      000C4F                       2359 BDIGS:
      008BB5 16 90 FE         [ 4] 2360         CALL     PAD
      008BB8 1D 00 02         [ 4] 2361         CALL     HLD
      008BBB FF 81 8B         [ 2] 2362         JP     STORE
                                   2363 
                                   2364 ;       HOLD    ( c -- )
                                   2365 ;       Insert a character into output string.
      008BBE AD 03                 2366         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                           000C5A  2367 LINK = . 
      008BC0 50                    2368         .byte      4
      008BC1 41 44 4C 44           2369         .ascii     "HOLD"
      008BC3                       2370 HOLD:
      008BC3 CD 8B B2         [ 4] 2371         CALL     HLD
      008BC6 CD 84 34         [ 4] 2372         CALL     AT
      008BC9 00 50 CC         [ 4] 2373         CALL     ONEM
      008BCC 87 5E 8B         [ 4] 2374         CALL     DUPP
      008BCF BF 03 54         [ 4] 2375         CALL     HLD
      008BD2 49 42 25         [ 4] 2376         CALL     STORE
      008BD4 CC 04 49         [ 2] 2377         JP     CSTOR
                                   2378 
                                   2379 ;       #       ( u -- u )
                                   2380 ;       Extract one digit from u and
                                   2381 ;       append digit to output string.
      008BD4 CD 86                 2382         .word      LINK
                           000C76  2383 LINK = . 
      008BD6 4E                    2384         .byte      1
      008BD7 CD                    2385         .ascii     "#"
      000C78                       2386 DIG:
      008BD8 8A 2D CC         [ 4] 2387         CALL     BASE
      008BDB 84 BC 8B         [ 4] 2388         CALL     AT
      008BDE D0 08 40         [ 4] 2389         CALL     EXTRC
      008BE1 45 58 45         [ 2] 2390         JP     HOLD
                                   2391 
                                   2392 ;       #S      ( u -- 0 )
                                   2393 ;       Convert u until all digits
                                   2394 ;       are added to output string.
      008BE4 43 55                 2395         .word      LINK
                           000C86  2396 LINK = . 
      008BE6 54                    2397         .byte      2
      008BE7 45 53                 2398         .ascii     "#S"
      008BE8                       2399 DIGS:
      008BE8 CD 84 BC         [ 4] 2400 DIGS1:  CALL     DIG
      008BEB CD 87 0D         [ 4] 2401         CALL     DUPP
      008BEE CD 84 67         [ 4] 2402         CALL     QBRAN
      008BF1 8B F6                 2403         .word      DIGS2
      008BF3 CD 84            [ 2] 2404         JRA     DIGS1
      008BF5 8E               [ 4] 2405 DIGS2:  RET
                                   2406 
                                   2407 ;       SIGN    ( n -- )
                                   2408 ;       Add a minus sign to
                                   2409 ;       numeric output string.
      008BF6 81 8B                 2410         .word      LINK
                           000C99  2411 LINK = . 
      008BF8 DF                    2412         .byte      4
      008BF9 05 43 4D 4F           2413         .ascii     "SIGN"
      000C9E                       2414 SIGN:
      008BFD 56 45 1C         [ 4] 2415         CALL     ZLESS
      008BFF CD 03 E7         [ 4] 2416         CALL     QBRAN
      008BFF CD 85                 2417         .word      SIGN1
      008C01 2C CD 84         [ 4] 2418         CALL     DOLIT
      008C04 7E 8C                 2419         .word      45	;"-"
      008C06 1F CD 85         [ 2] 2420         JP     HOLD
      008C09 2C               [ 4] 2421 SIGN1:  RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                   2422 
                                   2423 ;       #>      ( w -- b u )
                                   2424 ;       Prepare output string.
      008C0A CD 85                 2425         .word      LINK
                           000CB1  2426 LINK = . 
      008C0C 63                    2427         .byte      2
      008C0D CD 84                 2428         .ascii     "#>"
      000CB4                       2429 EDIGS:
      008C0F DA CD 85         [ 4] 2430         CALL     DROP
      008C12 20 CD 84         [ 4] 2431         CALL     HLD
      008C15 C9 CD 8A         [ 4] 2432         CALL     AT
      008C18 58 CD 85         [ 4] 2433         CALL     PAD
      008C1B 0D CD 8A         [ 4] 2434         CALL     OVER
      008C1E 58 CD 84         [ 2] 2435         JP     SUBB
                                   2436 
                                   2437 ;       str     ( w -- b u )
                                   2438 ;       Convert a signed integer
                                   2439 ;       to a numeric string.
      008C21 48 8C                 2440         .word      LINK
                           000CC8  2441 LINK = . 
      008C23 07                    2442         .byte      3
      008C24 CC 87 3E              2443         .ascii     "STR"
      000CCC                       2444 STR:
      008C27 8B F9 04         [ 4] 2445         CALL     DUPP
      008C2A 46 49 4C         [ 4] 2446         CALL     TOR
      008C2D 4C 07 71         [ 4] 2447         CALL     ABSS
      008C2E CD 0C 4F         [ 4] 2448         CALL     BDIGS
      008C2E 90 93 90         [ 4] 2449         CALL     DIGS
      008C31 E6 01 1C         [ 4] 2450         CALL     RFROM
      008C34 00 02 90         [ 4] 2451         CALL     SIGN
      008C37 93 90 FE         [ 2] 2452         JP     EDIGS
                                   2453 
                                   2454 ;       HEX     ( -- )
                                   2455 ;       Use radix 16 as base for
                                   2456 ;       numeric conversions.
      008C3A 90 89                 2457         .word      LINK
                           000CE6  2458 LINK = . 
      008C3C 1C                    2459         .byte      3
      008C3D 00 02 90              2460         .ascii     "HEX"
      000CEA                       2461 HEX:
      008C40 93 1C 00         [ 4] 2462         CALL     DOLIT
      008C43 02 90                 2463         .word      16
      008C45 FE 90 BF         [ 4] 2464         CALL     BASE
      008C48 24 90 85         [ 2] 2465         JP     STORE
                                   2466 
                                   2467 ;       DECIMAL ( -- )
                                   2468 ;       Use radix 10 as base
                                   2469 ;       for numeric conversions.
      008C4B 0C E6                 2470         .word      LINK
                           000CF7  2471 LINK = . 
      008C4B 92                    2472         .byte      7
      008C4C C7 24 3C 25 24 02 3C  2473         .ascii     "DECIMAL"
      000CFF                       2474 DECIM:
      008C53 24 03 B4         [ 4] 2475         CALL     DOLIT
      008C54 00 0A                 2476         .word      10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008C54 90 5A 26         [ 4] 2477         CALL     BASE
      008C57 F3 81 8C         [ 2] 2478         JP     STORE
                                   2479 
                                   2480 ;; Numeric input, single precision
                                   2481 
                                   2482 ;       DIGIT?  ( c base -- u t )
                                   2483 ;       Convert a character to its numeric
                                   2484 ;       value. A flag indicates success.
      008C5A 29 05                 2485         .word      LINK
                           000D0C  2486 LINK = . 
      008C5C 45                    2487         .byte       6
      008C5D 52 41 53 45 54 3F     2488         .ascii     "DIGIT?"
      008C61                       2489 DIGTQ:
      008C61 90 5F 1D         [ 4] 2490         CALL     TOR
      008C64 00 02 FF         [ 4] 2491         CALL     DOLIT
      008C67 CC 8C                 2492         .word     48	; "0"
      008C69 2E 8C 5B         [ 4] 2493         CALL     SUBB
      008C6C 05 50 41         [ 4] 2494         CALL     DOLIT
      008C6F 43 4B                 2495         .word      9
      008C71 30 05 0D         [ 4] 2496         CALL     OVER
      008C72 CD 07 BC         [ 4] 2497         CALL     LESS
      008C72 CD 85 63         [ 4] 2498         CALL     QBRAN
      008C75 CD 85                 2499         .word      DGTQ1
      008C77 2C CD 87         [ 4] 2500         CALL     DOLIT
      008C7A 49 CD                 2501         .word      7
      008C7C 84 C9 CD         [ 4] 2502         CALL     SUBB
      008C7F 8A 58 CD         [ 4] 2503         CALL     DUPP
      008C82 85 73 CD         [ 4] 2504         CALL     DOLIT
      008C85 8B FF                 2505         .word      10
      008C87 CD 85 0D         [ 4] 2506         CALL     LESS
      008C8A 81 8C 6C         [ 4] 2507         CALL     ORR
      008C8D 05 44 49         [ 4] 2508 DGTQ1:  CALL     DUPP
      008C90 47 49 54         [ 4] 2509         CALL     RFROM
      008C93 CC 07 9E         [ 2] 2510         JP     ULESS
                                   2511 
                                   2512 ;       NUMBER? ( a -- n T | a F )
                                   2513 ;       Convert a number string to
                                   2514 ;       integer. Push a flag on tos.
      008C93 CD 84                 2515         .word      LINK
                           000D4F  2516 LINK = . 
      008C95 34                    2517         .byte      7
      008C96 00 09 CD 85 8D CD 88  2518         .ascii     "NUMBER?"
      000D57                       2519 NUMBQ:
      008C9D 3C CD 84         [ 4] 2520         CALL     BASE
      008CA0 34 00 07         [ 4] 2521         CALL     AT
      008CA3 CD 85 AF         [ 4] 2522         CALL     TOR
      008CA6 CD 87 5E         [ 4] 2523         CALL     ZERO
      008CA9 CD 84 34         [ 4] 2524         CALL     OVER
      008CAC 00 30 CC         [ 4] 2525         CALL     COUNT
      008CAF 87 5E 8C         [ 4] 2526         CALL     OVER
      008CB2 8D 07 45         [ 4] 2527         CALL     CAT
      008CB5 58 54 52         [ 4] 2528         CALL     DOLIT
      008CB8 41 43                 2529         .word     36	; "0x"
      008CBA 54 07 7F         [ 4] 2530         CALL     EQUAL
      008CBB CD 03 E7         [ 4] 2531         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008CBB CD 8A                 2532         .word      NUMQ1
      008CBD C4 CD 85         [ 4] 2533         CALL     HEX
      008CC0 73 CD 88         [ 4] 2534         CALL     SWAPP
      008CC3 B4 CD 85         [ 4] 2535         CALL     ONEP
      008CC6 73 CC 8C         [ 4] 2536         CALL     SWAPP
      008CC9 93 8C B3         [ 4] 2537         CALL     ONEM
      008CCC 02 3C 23         [ 4] 2538 NUMQ1:  CALL     OVER
      008CCF CD 04 5A         [ 4] 2539         CALL     CAT
      008CCF CD 8B C3         [ 4] 2540         CALL     DOLIT
      008CD2 CD 86                 2541         .word     45	; "-"
      008CD4 90 CC 84         [ 4] 2542         CALL     EQUAL
      008CD7 A5 8C CC         [ 4] 2543         CALL     TOR
      008CDA 04 48 4F         [ 4] 2544         CALL     SWAPP
      008CDD 4C 44 A0         [ 4] 2545         CALL     RAT
      008CDF CD 07 57         [ 4] 2546         CALL     SUBB
      008CDF CD 86 90         [ 4] 2547         CALL     SWAPP
      008CE2 CD 84 BC         [ 4] 2548         CALL     RAT
      008CE5 CD 8A 65         [ 4] 2549         CALL     PLUS
      008CE8 CD 85 63         [ 4] 2550         CALL     QDUP
      008CEB CD 86 90         [ 4] 2551         CALL     QBRAN
      008CEE CD 84                 2552         .word      NUMQ6
      008CF0 A5 CC 84         [ 4] 2553         CALL     ONEM
      008CF3 C9 8C DA         [ 4] 2554         CALL     TOR
      008CF6 01 23 E3         [ 4] 2555 NUMQ2:  CALL     DUPP
      008CF8 CD 04 AC         [ 4] 2556         CALL     TOR
      008CF8 CD 86 20         [ 4] 2557         CALL     CAT
      008CFB CD 84 BC         [ 4] 2558         CALL     BASE
      008CFE CD 8C BB         [ 4] 2559         CALL     AT
      008D01 CC 8C DF         [ 4] 2560         CALL     DIGTQ
      008D04 8C F6 02         [ 4] 2561         CALL     QBRAN
      008D07 23 53                 2562         .word      NUMQ4
      008D09 CD 04 F3         [ 4] 2563         CALL     SWAPP
      008D09 CD 8C F8         [ 4] 2564         CALL     BASE
      008D0C CD 85 63         [ 4] 2565         CALL     AT
      008D0F CD 84 67         [ 4] 2566         CALL     STAR
      008D12 8D 16 20         [ 4] 2567         CALL     PLUS
      008D15 F3 81 8D         [ 4] 2568         CALL     RFROM
      008D18 06 04 53         [ 4] 2569         CALL     ONEP
      008D1B 49 47 4E         [ 4] 2570         CALL     DONXT
      008D1E 0D BC                 2571         .word      NUMQ2
      008D1E CD 85 9C         [ 4] 2572         CALL     RAT
      008D21 CD 84 67         [ 4] 2573         CALL     SWAPP
      008D24 8D 2E CD         [ 4] 2574         CALL     DROP
      008D27 84 34 00         [ 4] 2575         CALL     QBRAN
      008D2A 2D CC                 2576         .word      NUMQ3
      008D2C 8C DF 81         [ 4] 2577         CALL     NEGAT
      008D2F 8D 19 02         [ 4] 2578 NUMQ3:  CALL     SWAPP
      008D32 23 3E            [ 2] 2579         JRA     NUMQ5
      008D34 CD 04 8D         [ 4] 2580 NUMQ4:  CALL     RFROM
      008D34 CD 85 59         [ 4] 2581         CALL     RFROM
      008D37 CD 86 90         [ 4] 2582         CALL     DDROP
      008D3A CD 84 BC         [ 4] 2583         CALL     DDROP
      008D3D CD 8B C3         [ 4] 2584         CALL     ZERO
      008D40 CD 85 8D         [ 4] 2585 NUMQ5:  CALL     DUPP
      008D43 CC 87 D7         [ 4] 2586 NUMQ6:  CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008D46 8D 31 03         [ 4] 2587         CALL     DDROP
      008D49 53 54 52         [ 4] 2588         CALL     RFROM
      008D4C CD 05 A0         [ 4] 2589         CALL     BASE
      008D4C CD 85 63         [ 2] 2590         JP     STORE
                                   2591 
                                   2592 ;; Basic I/O
                                   2593 
                                   2594 ;       KEY     ( -- c )
                                   2595 ;       Wait for and return an
                                   2596 ;       input character.
      008D4F CD 85                 2597         .word      LINK
                           000E26  2598 LINK = . 
      008D51 2C                    2599         .byte      3
      008D52 CD 87 F1              2600         .ascii     "KEY"
      000E2A                       2601 KEY:
      008D55 CD 8C CF CD 8D   [ 2] 2602         btjf UART2_SR,#UART_SR_RXNE,. 
      008D5A 09 CD 85         [ 1] 2603         ld a,UART2_DR 
      008D5D 0D CD 8D         [ 2] 2604         subw x,#CELLL 
      008D60 1E CC            [ 1] 2605         ld (1,x),a 
      008D62 8D               [ 1] 2606         clr (x)
      008D63 34               [ 4] 2607         ret 
                                   2608 
                                   2609 ;       NUF?    ( -- t )
                                   2610 ;       Return false if no input,
                                   2611 ;       else pause and if CR return true.
      008D64 8D 48                 2612         .word      LINK
                           000E3B  2613 LINK = . 
      008D66 03                    2614         .byte      4
      008D67 48 45 58 3F           2615         .ascii     "NUF?"
      008D6A                       2616 NUFQ:
      008D6A CD 84 34         [ 4] 2617         CALL     QKEY
      008D6D 00 10 CD         [ 4] 2618         CALL     DUPP
      008D70 86 20 CC         [ 4] 2619         CALL     QBRAN
      008D73 84 A5                 2620         .word    NUFQ1
      008D75 8D 66 07         [ 4] 2621         CALL     DDROP
      008D78 44 45 43         [ 4] 2622         CALL     KEY
      008D7B 49 4D 41         [ 4] 2623         CALL     DOLIT
      008D7E 4C 0D                 2624         .word      CRR
      008D7F CC 07 7F         [ 2] 2625         JP     EQUAL
      008D7F CD               [ 4] 2626 NUFQ1:  RET
                                   2627 
                                   2628 ;       SPACE   ( -- )
                                   2629 ;       Send  blank character to
                                   2630 ;       output device.
      008D80 84 34                 2631         .word      LINK
                           000E5C  2632 LINK = . 
      008D82 00                    2633         .byte      5
      008D83 0A CD 86 20 CC        2634         .ascii     "SPACE"
      000E62                       2635 SPACE:
      008D88 84 A5 8D         [ 4] 2636         CALL     BLANK
      008D8B 77 06 44         [ 2] 2637         JP     EMIT
                                   2638 
                                   2639 ;       SPACES  ( +n -- )
                                   2640 ;       Send n spaces to output device.
      008D8E 49 47                 2641         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                           000E6A  2642 LINK = . 
      008D90 49                    2643         .byte      6
      008D91 54 3F 41 43 45 53     2644         .ascii     "SPACES"
      008D93                       2645 SPACS:
      008D93 CD 85 2C         [ 4] 2646         CALL     ZERO
      008D96 CD 84 34         [ 4] 2647         CALL     MAX
      008D99 00 30 CD         [ 4] 2648         CALL     TOR
      008D9C 87 D7            [ 2] 2649         JRA      CHAR2
      008D9E CD 84 34         [ 4] 2650 CHAR1:  CALL     SPACE
      008DA1 00 09 CD         [ 4] 2651 CHAR2:  CALL     DONXT
      008DA4 85 8D                 2652         .word    CHAR1
      008DA6 CD               [ 4] 2653         RET
                                   2654 
                                   2655 ;       TYPE    ( b u -- )
                                   2656 ;       Output u characters from b.
      008DA7 88 3C                 2657         .word      LINK
                           000E87  2658 LINK = . 
      008DA9 CD                    2659         .byte      4
      008DAA 84 67 8D C4           2660         .ascii     "TYPE"
      000E8C                       2661 TYPES:
      008DAE CD 84 34         [ 4] 2662         CALL     TOR
      008DB1 00 07            [ 2] 2663         JRA     TYPE2
      008DB3 CD 87 D7         [ 4] 2664 TYPE1:  CALL     DUPP
      008DB6 CD 85 63         [ 4] 2665         CALL     CAT
      008DB9 CD 84 34         [ 4] 2666         CALL     EMIT
      008DBC 00 0A CD         [ 4] 2667         CALL     ONEP
      008DBF 88 3C CD         [ 4] 2668 TYPE2:  CALL     DONXT
      008DC2 85 C3                 2669         .word      TYPE1
      008DC4 CD 85 63         [ 2] 2670         JP     DROP
                                   2671 
                                   2672 ;       CR      ( -- )
                                   2673 ;       Output a carriage return
                                   2674 ;       and a line feed.
      008DC7 CD 85                 2675         .word      LINK
                           000EA7  2676 LINK = . 
      008DC9 0D                    2677         .byte      2
      008DCA CC 88                 2678         .ascii     "CR"
      000EAA                       2679 CR:
      008DCC 1E 8D 8C         [ 4] 2680         CALL     DOLIT
      008DCF 07 4E                 2681         .word      CRR
      008DD1 55 4D 42         [ 4] 2682         CALL     EMIT
      008DD4 45 52 3F         [ 4] 2683         CALL     DOLIT
      008DD7 00 0A                 2684         .word      LF
      008DD7 CD 86 20         [ 2] 2685         JP     EMIT
                                   2686 
                                   2687 ;       do$     ( -- a )
                                   2688 ;       Return  address of a compiled
                                   2689 ;       string.
      008DDA CD 84                 2690         .word      LINK
                           000EBC  2691 LINK = . 
      008DDC BC                    2692 	.byte      COMPO+3
      008DDD CD 85 2C              2693         .ascii     "DO$"
      000EC0                       2694 DOSTR:
      008DE0 CD 8A C4         [ 4] 2695         CALL     RFROM
      008DE3 CD 85 8D         [ 4] 2696         CALL     RAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008DE6 CD 8B 9B         [ 4] 2697         CALL     RFROM
      008DE9 CD 85 8D         [ 4] 2698         CALL     COUNT
      008DEC CD 84 DA         [ 4] 2699         CALL     PLUS
      008DEF CD 84 34         [ 4] 2700         CALL     TOR
      008DF2 00 24 CD         [ 4] 2701         CALL     SWAPP
      008DF5 87 FF CD         [ 4] 2702         CALL     TOR
      008DF8 84               [ 4] 2703         RET
                                   2704 
                                   2705 ;       $"|     ( -- a )
                                   2706 ;       Run time routine compiled by $".
                                   2707 ;       Return address of a compiled string.
      008DF9 67 8E                 2708         .word      LINK
                           000EDB  2709 LINK = . 
      008DFB 0B                    2710 	.byte      COMPO+3
      008DFC CD 8D 6A              2711         .byte     '$','"','|'
      000EDF                       2712 STRQP:
      008DFF CD 85 73         [ 4] 2713         CALL     DOSTR
      008E02 CD               [ 4] 2714         RET
                                   2715 
                                   2716 ;       ."|     ( -- )
                                   2717 ;       Run time routine of ." .
                                   2718 ;       Output a compiled string.
      008E03 8A 58                 2719         .word      LINK
                           000EE5  2720 LINK = . 
      008E05 CD                    2721 	.byte      COMPO+3
      008E06 85 73 CD              2722         .byte     '.','"','|'
      000EE9                       2723 DOTQP:
      008E09 8A 65 CD         [ 4] 2724         CALL     DOSTR
      008E0C 85 8D CD         [ 4] 2725         CALL     COUNT
      008E0F 84 DA CD         [ 2] 2726         JP     TYPES
                                   2727 
                                   2728 ;       .R      ( n +n -- )
                                   2729 ;       Display an integer in a field
                                   2730 ;       of n columns, right justified.
      008E12 84 34                 2731         .word      LINK
                           000EF4  2732 LINK = . 
      008E14 00                    2733         .byte      2
      008E15 2D CD                 2734         .ascii     ".R"
      000EF7                       2735 DOTR:
      008E17 87 FF CD         [ 4] 2736         CALL     TOR
      008E1A 85 2C CD         [ 4] 2737         CALL     STR
      008E1D 85 73 CD         [ 4] 2738         CALL     RFROM
      008E20 85 20 CD         [ 4] 2739         CALL     OVER
      008E23 87 D7 CD         [ 4] 2740         CALL     SUBB
      008E26 85 73 CD         [ 4] 2741         CALL     SPACS
      008E29 85 20 CD         [ 2] 2742         JP     TYPES
                                   2743 
                                   2744 ;       U.R     ( u +n -- )
                                   2745 ;       Display an unsigned integer
                                   2746 ;       in n column, right justified.
      008E2C 87 5E                 2747         .word      LINK
                           000F0E  2748 LINK = . 
      008E2E CD                    2749         .byte      3
      008E2F 87 0D CD              2750         .ascii     "U.R"
      000F12                       2751 UDOTR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008E32 84 67 8E         [ 4] 2752         CALL     TOR
      008E35 95 CD 8A         [ 4] 2753         CALL     BDIGS
      008E38 65 CD 85         [ 4] 2754         CALL     DIGS
      008E3B 2C CD 85         [ 4] 2755         CALL     EDIGS
      008E3E 63 CD 85         [ 4] 2756         CALL     RFROM
      008E41 2C CD 84         [ 4] 2757         CALL     OVER
      008E44 DA CD 86         [ 4] 2758         CALL     SUBB
      008E47 20 CD 84         [ 4] 2759         CALL     SPACS
      008E4A BC CD 8D         [ 2] 2760         JP     TYPES
                                   2761 
                                   2762 ;       U.      ( u -- )
                                   2763 ;       Display an unsigned integer
                                   2764 ;       in free format.
      008E4D 93 CD                 2765         .word      LINK
                           000F2F  2766 LINK = . 
      008E4F 84                    2767         .byte      2
      008E50 67 8E                 2768         .ascii     "U."
      000F32                       2769 UDOT:
      008E52 83 CD 85         [ 4] 2770         CALL     BDIGS
      008E55 73 CD 86         [ 4] 2771         CALL     DIGS
      008E58 20 CD 84         [ 4] 2772         CALL     EDIGS
      008E5B BC CD 89         [ 4] 2773         CALL     SPACE
      008E5E D7 CD 87         [ 2] 2774         JP     TYPES
                                   2775 
                                   2776 ;       .       ( w -- )
                                   2777 ;       Display an integer in free
                                   2778 ;       format, preceeded by a space.
      008E61 5E CD                 2779         .word      LINK
                           000F43  2780 LINK = . 
      008E63 85                    2781         .byte      1
      008E64 0D                    2782         .ascii     "."
      000F45                       2783 DOT:
      008E65 CD 8A 58         [ 4] 2784         CALL     BASE
      008E68 CD 84 48         [ 4] 2785         CALL     AT
      008E6B 8E 3C CD         [ 4] 2786         CALL     DOLIT
      008E6E 85 20                 2787         .word      10
      008E70 CD 85 73         [ 4] 2788         CALL     XORR    ;?decimal
      008E73 CD 85 59         [ 4] 2789         CALL     QBRAN
      008E76 CD 84                 2790         .word      DOT1
      008E78 67 8E 7E         [ 2] 2791         JP     UDOT
      008E7B CD 87 89         [ 4] 2792 DOT1:   CALL     STR
      008E7E CD 85 73         [ 4] 2793         CALL     SPACE
      008E81 20 0F CD         [ 2] 2794         JP     TYPES
                                   2795 
                                   2796 ;       ?       ( a -- )
                                   2797 ;       Display contents in memory cell.
      008E84 85 0D                 2798         .word      LINK
                                   2799         
                           000F66  2800 LINK = . 
      008E86 CD                    2801         .byte      1
      008E87 85                    2802         .ascii     "?"
      000F68                       2803 QUEST:
      008E88 0D CD 87         [ 4] 2804         CALL     AT
      008E8B 3E CD 87         [ 2] 2805         JP     DOT
                                   2806 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2807 ;; Parsing
                                   2808 
                                   2809 ;       parse   ( b u c -- b u delta ; <string> )
                                   2810 ;       Scan string delimited by c.
                                   2811 ;       Return found string and its offset.
      008E8E 3E CD                 2812         .word      LINK
                           000F70  2813 LINK = . 
      008E90 8A                    2814         .byte      5
      008E91 C4 CD 85 63 CD        2815         .ascii     "parse"
      000F76                       2816 PARS:
      008E96 85 0D CD         [ 4] 2817         CALL     TEMP
      008E99 87 3E CD         [ 4] 2818         CALL     STORE
      008E9C 85 0D CD         [ 4] 2819         CALL     OVER
      008E9F 86 20 CC         [ 4] 2820         CALL     TOR
      008EA2 84 A5 8D         [ 4] 2821         CALL     DUPP
      008EA5 CF 03 4B         [ 4] 2822         CALL     QBRAN
      008EA8 45 59                 2823         .word    PARS8
      008EAA CD 09 E5         [ 4] 2824         CALL     ONEM
      008EAA 72 0B 52         [ 4] 2825         CALL     TEMP
      008EAD 40 FB C6         [ 4] 2826         CALL     AT
      008EB0 52 41 1D         [ 4] 2827         CALL     BLANK
      008EB3 00 02 E7         [ 4] 2828         CALL     EQUAL
      008EB6 01 7F 81         [ 4] 2829         CALL     QBRAN
      008EB9 8E A6                 2830         .word      PARS3
      008EBB 04 4E 55         [ 4] 2831         CALL     TOR
      008EBE 46 3F 37         [ 4] 2832 PARS1:  CALL     BLANK
      008EC0 CD 05 0D         [ 4] 2833         CALL     OVER
      008EC0 CD 84 00         [ 4] 2834         CALL     CAT     ;skip leading blanks ONLY
      008EC3 CD 85 63         [ 4] 2835         CALL     SUBB
      008EC6 CD 84 67         [ 4] 2836         CALL     ZLESS
      008EC9 8E D9 CD         [ 4] 2837         CALL     INVER
      008ECC 87 3E CD         [ 4] 2838         CALL     QBRAN
      008ECF 8E AA                 2839         .word      PARS2
      008ED1 CD 84 34         [ 4] 2840         CALL     ONEP
      008ED4 00 0D CC         [ 4] 2841         CALL     DONXT
      008ED7 87 FF                 2842         .word      PARS1
      008ED9 81 8E BB         [ 4] 2843         CALL     RFROM
      008EDC 05 53 50         [ 4] 2844         CALL     DROP
      008EDF 41 43 45         [ 4] 2845         CALL     ZERO
      008EE2 CC 04 E3         [ 2] 2846         JP     DUPP
      008EE2 CD 8A B7         [ 4] 2847 PARS2:  CALL     RFROM
      008EE5 CC 84 1E         [ 4] 2848 PARS3:  CALL     OVER
      008EE8 8E DC 06         [ 4] 2849         CALL     SWAPP
      008EEB 53 50 41         [ 4] 2850         CALL     TOR
      008EEE 43 45 53         [ 4] 2851 PARS4:  CALL     TEMP
      008EF1 CD 04 3C         [ 4] 2852         CALL     AT
      008EF1 CD 8A C4         [ 4] 2853         CALL     OVER
      008EF4 CD 88 5C         [ 4] 2854         CALL     CAT
      008EF7 CD 85 2C         [ 4] 2855         CALL     SUBB    ;scan for delimiter
      008EFA 20 03 CD         [ 4] 2856         CALL     TEMP
      008EFD 8E E2 CD         [ 4] 2857         CALL     AT
      008F00 84 48 8E         [ 4] 2858         CALL     BLANK
      008F03 FC 81 8E         [ 4] 2859         CALL     EQUAL
      008F06 EA 04 54         [ 4] 2860         CALL     QBRAN
      008F09 59 50                 2861         .word      PARS5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008F0B 45 05 1C         [ 4] 2862         CALL     ZLESS
      008F0C CD 03 E7         [ 4] 2863 PARS5:  CALL     QBRAN
      008F0C CD 85                 2864         .word      PARS6
      008F0E 2C 20 0C         [ 4] 2865         CALL     ONEP
      008F11 CD 85 63         [ 4] 2866         CALL     DONXT
      008F14 CD 84                 2867         .word      PARS4
      008F16 DA CD 84         [ 4] 2868         CALL     DUPP
      008F19 1E CD 8A         [ 4] 2869         CALL     TOR
      008F1C 58 CD            [ 2] 2870         JRA     PARS7
      008F1E 84 48 8F         [ 4] 2871 PARS6:  CALL     RFROM
      008F21 11 CC 85         [ 4] 2872         CALL     DROP
      008F24 59 8F 07         [ 4] 2873         CALL     DUPP
      008F27 02 43 52         [ 4] 2874         CALL     ONEP
      008F2A CD 04 AC         [ 4] 2875         CALL     TOR
      008F2A CD 84 34         [ 4] 2876 PARS7:  CALL     OVER
      008F2D 00 0D CD         [ 4] 2877         CALL     SUBB
      008F30 84 1E CD         [ 4] 2878         CALL     RFROM
      008F33 84 34 00         [ 4] 2879         CALL     RFROM
      008F36 0A CC 84         [ 2] 2880         JP     SUBB
      008F39 1E 8F 27         [ 4] 2881 PARS8:  CALL     OVER
      008F3C 43 44 4F         [ 4] 2882         CALL     RFROM
      008F3F 24 07 57         [ 2] 2883         JP     SUBB
                                   2884 
                                   2885 ;       PARSE   ( c -- b u ; <string> )
                                   2886 ;       Scan input stream and return
                                   2887 ;       counted string delimited by c.
      008F40 0F 70                 2888         .word      LINK
                           001039  2889 LINK = . 
      008F40 CD                    2890         .byte      5
      008F41 85 0D CD 85 20        2891         .ascii     "PARSE"
      00103F                       2892 PARSE:
      008F46 CD 85 0D         [ 4] 2893         CALL     TOR
      008F49 CD 8B 9B         [ 4] 2894         CALL     TIB
      008F4C CD 87 5E         [ 4] 2895         CALL     INN
      008F4F CD 85 2C         [ 4] 2896         CALL     AT
      008F52 CD 85 73         [ 4] 2897         CALL     PLUS    ;current input buffer pointer
      008F55 CD 85 2C         [ 4] 2898         CALL     NTIB
      008F58 81 8F 3C         [ 4] 2899         CALL     AT
      008F5B 43 24 22         [ 4] 2900         CALL     INN
      008F5E 7C 04 3C         [ 4] 2901         CALL     AT
      008F5F CD 07 57         [ 4] 2902         CALL     SUBB    ;remaining count
      008F5F CD 8F 40         [ 4] 2903         CALL     RFROM
      008F62 81 8F 5B         [ 4] 2904         CALL     PARS
      008F65 43 2E 22         [ 4] 2905         CALL     INN
      008F68 7C 0A B4         [ 2] 2906         JP     PSTOR
                                   2907 
                                   2908 ;       .(      ( -- )
                                   2909 ;       Output following string up to next ) .
      008F69 10 39                 2910         .word      LINK
                           00106B  2911 LINK = . 
      008F69 CD                    2912 	.byte      IMEDD+2
      008F6A 8F 40                 2913         .ascii     ".("
      00106E                       2914 DOTPR:
      008F6C CD 8B 9B         [ 4] 2915         CALL     DOLIT
      008F6F CC 8F                 2916         .word     41	; ")"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008F71 0C 8F 65         [ 4] 2917         CALL     PARSE
      008F74 02 2E 52         [ 2] 2918         JP     TYPES
                                   2919 
                                   2920 ;       (       ( -- )
                                   2921 ;       Ignore following string up to next ).
                                   2922 ;       A comment.
      008F77 10 6B                 2923         .word      LINK
                           00107B  2924 LINK = . 
      008F77 CD                    2925 	.byte      IMEDD+1
      008F78 85                    2926         .ascii     "("
      00107D                       2927 PAREN:
      008F79 2C CD 8D         [ 4] 2928         CALL     DOLIT
      008F7C 4C CD                 2929         .word     41	; ")"
      008F7E 85 0D CD         [ 4] 2930         CALL     PARSE
      008F81 85 8D CD         [ 2] 2931         JP     DDROP
                                   2932 
                                   2933 ;       \       ( -- )
                                   2934 ;       Ignore following text till
                                   2935 ;       end of line.
      008F84 87 D7                 2936         .word      LINK
                           00108A  2937 LINK = . 
      008F86 CD                    2938 	.byte      IMEDD+1
      008F87 8E                    2939         .ascii     "\"
      00108C                       2940 BKSLA:
      008F88 F1 CC 8F 0C      [ 2] 2941         ldw y,#UCTIB ; #TIB  
      008F8C 8F 74            [ 2] 2942         ldw y,(y)
      008F8E 03 55            [ 2] 2943         pushw y ; count in TIB 
      008F90 2E 52 00 0A      [ 2] 2944         ldw y,#UINN ; >IN 
      008F92 90 BF 24         [ 2] 2945         ldw YTEMP,y
      008F92 CD 85            [ 2] 2946         popw y 
      008F94 2C CD 8C         [ 5] 2947         ldw [YTEMP],y
      008F97 CF               [ 4] 2948         ret 
                                   2949 
                                   2950 ;       WORD    ( c -- a ; <string> )
                                   2951 ;       Parse a word from input stream
                                   2952 ;       and copy it to code dictionary.
      008F98 CD 8D                 2953         .word      LINK
                           0010A3  2954 LINK = . 
      008F9A 09                    2955         .byte      4
      008F9B CD 8D 34 CD           2956         .ascii     "WORD"
      0010A8                       2957 WORDD:
      008F9F 85 0D CD         [ 4] 2958         CALL     PARSE
      008FA2 85 8D CD         [ 4] 2959         CALL     HERE
      008FA5 87 D7 CD         [ 4] 2960         CALL     CELLP
      008FA8 8E F1 CC         [ 2] 2961         JP     PACKS
                                   2962 
                                   2963 ;       TOKEN   ( -- a ; <string> )
                                   2964 ;       Parse a word from input stream
                                   2965 ;       and copy it to name dictionary.
      008FAB 8F 0C                 2966         .word      LINK
                           0010B6  2967 LINK = . 
      008FAD 8F                    2968         .byte      5
      008FAE 8E 02 55 2E 4E        2969         .ascii     "TOKEN"
      008FB2                       2970 TOKEN:
      008FB2 CD 8C CF         [ 4] 2971         CALL     BLANK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008FB5 CD 8D 09         [ 2] 2972         JP     WORDD
                                   2973 
                                   2974 ;; Dictionary search
                                   2975 
                                   2976 ;       NAME>   ( na -- ca )
                                   2977 ;       Return a code address given
                                   2978 ;       a name address.
      008FB8 CD 8D                 2979         .word      LINK
                           0010C4  2980 LINK = . 
      008FBA 34                    2981         .byte      5
      008FBB CD 8E E2 CC 8F        2982         .ascii     "NAME>"
      0010CA                       2983 NAMET:
      008FC0 0C 8F AF         [ 4] 2984         CALL     COUNT
      008FC3 01 2E B4         [ 4] 2985         CALL     DOLIT
      008FC5 00 1F                 2986         .word      31
      008FC5 CD 86 20         [ 4] 2987         CALL     ANDD
      008FC8 CD 84 BC         [ 2] 2988         JP     PLUS
                                   2989 
                                   2990 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   2991 ;       Compare u cells in two
                                   2992 ;       strings. Return 0 if identical.
      008FCB CD 84                 2993         .word      LINK
                           0010DA  2994 LINK = . 
      008FCD 34                    2995         .byte       5
      008FCE 00 0A CD 85 D8        2996         .ascii     "SAME?"
      0010E0                       2997 SAMEQ:
      008FD3 CD 84 67         [ 4] 2998         CALL     ONEM
      008FD6 8F DB CC         [ 4] 2999         CALL     TOR
      008FD9 8F B2            [ 2] 3000         JRA     SAME2
      008FDB CD 8D 4C         [ 4] 3001 SAME1:  CALL     OVER
      008FDE CD 8E E2         [ 4] 3002         CALL     RAT
      008FE1 CC 8F 0C         [ 4] 3003         CALL     PLUS
      008FE4 8F C3 01         [ 4] 3004         CALL     CAT
      008FE7 3F 05 0D         [ 4] 3005         CALL     OVER
      008FE8 CD 04 A0         [ 4] 3006         CALL     RAT
      008FE8 CD 84 BC         [ 4] 3007         CALL     PLUS
      008FEB CC 8F C5         [ 4] 3008         CALL     CAT
      008FEE 8F E6 05         [ 4] 3009         CALL     SUBB
      008FF1 70 61 72         [ 4] 3010         CALL     QDUP
      008FF4 73 65 E7         [ 4] 3011         CALL     QBRAN
      008FF6 11 11                 3012         .word      SAME2
      008FF6 CD 86 2F         [ 4] 3013         CALL     RFROM
      008FF9 CD 84 A5         [ 2] 3014         JP     DROP
      008FFC CD 85 8D         [ 4] 3015 SAME2:  CALL     DONXT
      008FFF CD 85                 3016         .word      SAME1
      009001 2C CD 85         [ 2] 3017         JP     ZERO
                                   3018 
                                   3019 ;       find    ( a va -- ca na | a F )
                                   3020 ;       Search vocabulary for string.
                                   3021 ;       Return ca and na if succeeded.
      009004 63 CD                 3022         .word      LINK
                           00111B  3023 LINK = . 
      009006 84                    3024         .byte      4
      009007 67 90 AE CD           3025         .ascii     "FIND"
      001120                       3026 FIND:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      00900B 8A 65 CD         [ 4] 3027         CALL     SWAPP
      00900E 86 2F CD         [ 4] 3028         CALL     DUPP
      009011 84 BC CD         [ 4] 3029         CALL     CAT
      009014 8A B7 CD         [ 4] 3030         CALL     TEMP
      009017 87 FF CD         [ 4] 3031         CALL     STORE
      00901A 84 67 90         [ 4] 3032         CALL     DUPP
      00901D 4F CD 85         [ 4] 3033         CALL     AT
      009020 2C CD 8A         [ 4] 3034         CALL     TOR
      009023 B7 CD 85         [ 4] 3035         CALL     CELLP
      009026 8D CD 84         [ 4] 3036         CALL     SWAPP
      009029 DA CD 87         [ 4] 3037 FIND1:  CALL     AT
      00902C D7 CD 85         [ 4] 3038         CALL     DUPP
      00902F 9C CD 87         [ 4] 3039         CALL     QBRAN
      009032 78 CD                 3040         .word      FIND6
      009034 84 67 90         [ 4] 3041         CALL     DUPP
      009037 4C CD 8A         [ 4] 3042         CALL     AT
      00903A 58 CD 84         [ 4] 3043         CALL     DOLIT
      00903D 48 90                 3044         .word      MASKK
      00903F 21 CD 85         [ 4] 3045         CALL     ANDD
      009042 0D CD 85         [ 4] 3046         CALL     RAT
      009045 59 CD 8A         [ 4] 3047         CALL     XORR
      009048 C4 CC 85         [ 4] 3048         CALL     QBRAN
      00904B 63 CD                 3049         .word      FIND2
      00904D 85 0D CD         [ 4] 3050         CALL     CELLP
      009050 85 8D CD         [ 4] 3051         CALL     DOLIT
      009053 85 73                 3052         .word     0xFFFF
      009055 CD 85            [ 2] 3053         JRA     FIND3
      009057 2C CD 86         [ 4] 3054 FIND2:  CALL     CELLP
      00905A 2F CD 84         [ 4] 3055         CALL     TEMP
      00905D BC CD 85         [ 4] 3056         CALL     AT
      009060 8D CD 84         [ 4] 3057         CALL     SAMEQ
      009063 DA CD 87         [ 4] 3058 FIND3:  CALL     BRAN
      009066 D7 CD                 3059         .word      FIND4
      009068 86 2F CD         [ 4] 3060 FIND6:  CALL     RFROM
      00906B 84 BC CD         [ 4] 3061         CALL     DROP
      00906E 8A B7 CD         [ 4] 3062         CALL     SWAPP
      009071 87 FF CD         [ 4] 3063         CALL     CELLM
      009074 84 67 90         [ 2] 3064         JP     SWAPP
      009077 7B CD 85         [ 4] 3065 FIND4:  CALL     QBRAN
      00907A 9C CD                 3066         .word      FIND5
      00907C 84 67 90         [ 4] 3067         CALL     CELLM
      00907F 90 CD 8A         [ 4] 3068         CALL     CELLM
      009082 58 CD            [ 2] 3069         JRA     FIND1
      009084 84 48 90         [ 4] 3070 FIND5:  CALL     RFROM
      009087 58 CD 85         [ 4] 3071         CALL     DROP
      00908A 63 CD 85         [ 4] 3072         CALL     SWAPP
      00908D 2C 20 0F         [ 4] 3073         CALL     DROP
      009090 CD 85 0D         [ 4] 3074         CALL     CELLM
      009093 CD 85 59         [ 4] 3075         CALL     DUPP
      009096 CD 85 63         [ 4] 3076         CALL     NAMET
      009099 CD 8A 58         [ 2] 3077         JP     SWAPP
                                   3078 
                                   3079 ;       NAME?   ( a -- ca na | a F )
                                   3080 ;       Search vocabularies for a string.
      00909C CD 85                 3081         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                           0011B3  3082 LINK = . 
      00909E 2C                    3083         .byte      5
      00909F CD 85 8D CD 87        3084         .ascii     "NAME?"
      0011B9                       3085 NAMEQ:
      0090A4 D7 CD 85         [ 4] 3086         CALL   CNTXT
      0090A7 0D CD 85         [ 2] 3087         JP     FIND
                                   3088 
                                   3089 ;; Terminal response
                                   3090 
                                   3091 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3092 ;       Backup cursor by one character.
      0090AA 0D CC                 3093         .word      LINK
                           0011C1  3094 LINK = . 
      0090AC 87                    3095         .byte      2
      0090AD D7 CD                 3096         .ascii     "^H"
      0011C4                       3097 BKSP:
      0090AF 85 8D CD         [ 4] 3098         CALL     TOR
      0090B2 85 0D CC         [ 4] 3099         CALL     OVER
      0090B5 87 D7 8F         [ 4] 3100         CALL     RFROM
      0090B8 F0 05 50         [ 4] 3101         CALL     SWAPP
      0090BB 41 52 53         [ 4] 3102         CALL     OVER
      0090BE 45 05 58         [ 4] 3103         CALL     XORR
      0090BF CD 03 E7         [ 4] 3104         CALL     QBRAN
      0090BF CD 85                 3105         .word      BACK1
      0090C1 2C CD 8B         [ 4] 3106         CALL     DOLIT
      0090C4 D4 CD                 3107         .word      BKSPP
      0090C6 86 3E CD         [ 4] 3108         CALL     EMIT
      0090C9 84 BC CD         [ 4] 3109         CALL     ONEM
      0090CC 87 5E CD         [ 4] 3110         CALL     BLANK
      0090CF 86 4E CD         [ 4] 3111         CALL     EMIT
      0090D2 84 BC CD         [ 4] 3112         CALL     DOLIT
      0090D5 86 3E                 3113         .word      BKSPP
      0090D7 CD 84 BC         [ 2] 3114         JP     EMIT
      0090DA CD               [ 4] 3115 BACK1:  RET
                                   3116 
                                   3117 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3118 ;       Accept and echo key stroke
                                   3119 ;       and bump cursor.
      0090DB 87 D7                 3120         .word      LINK
                           0011F7  3121 LINK = . 
      0090DD CD                    3122         .byte      3
      0090DE 85 0D CD              3123         .ascii     "TAP"
      0011FB                       3124 TAP:
      0090E1 8F F6 CD         [ 4] 3125         CALL     DUPP
      0090E4 86 3E CC         [ 4] 3126         CALL     EMIT
      0090E7 8B 34 90         [ 4] 3127         CALL     OVER
      0090EA B9 82 2E         [ 4] 3128         CALL     CSTOR
      0090ED 28 09 D8         [ 2] 3129         JP     ONEP
                                   3130 
                                   3131 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3132 ;       Process a key stroke,
                                   3133 ;       CR or backspace.
      0090EE 11 F7                 3134         .word      LINK
                           00120C  3135 LINK = . 
      0090EE CD                    3136         .byte      4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0090EF 84 34 00 29           3137         .ascii     "KTAP"
      001211                       3138 KTAP:
      0090F3 CD 90 BF         [ 4] 3139         CALL     DUPP
      0090F6 CC 8F 0C         [ 4] 3140         CALL     DOLIT
      0090F9 90 EB                 3141         .word      CRR
      0090FB 81 28 58         [ 4] 3142         CALL     XORR
      0090FD CD 03 E7         [ 4] 3143         CALL     QBRAN
      0090FD CD 84                 3144         .word      KTAP2
      0090FF 34 00 29         [ 4] 3145         CALL     DOLIT
      009102 CD 90                 3146         .word      BKSPP
      009104 BF CC 87         [ 4] 3147         CALL     XORR
      009107 3E 90 FB         [ 4] 3148         CALL     QBRAN
      00910A 81 5C                 3149         .word      KTAP1
      00910C CD 0A 37         [ 4] 3150         CALL     BLANK
      00910C 90 AE 00         [ 2] 3151         JP     TAP
      00910F 0C 90 FE         [ 2] 3152 KTAP1:  JP     BKSP
      009112 90 89 90         [ 4] 3153 KTAP2:  CALL     DROP
      009115 AE 00 0A         [ 4] 3154         CALL     SWAPP
      009118 90 BF 24         [ 4] 3155         CALL     DROP
      00911B 90 85 91         [ 2] 3156         JP     DUPP
                                   3157 
                                   3158 ;       accept  ( b u -- b u )
                                   3159 ;       Accept characters to input
                                   3160 ;       buffer. Return with actual count.
      00911E CF 24                 3161         .word      LINK
                           001245  3162 LINK = . 
      009120 81                    3163         .byte      6
      009121 91 0A 04 57 4F 52     3164         .ascii     "ACCEPT"
      00124C                       3165 ACCEP:
      009127 44 05 0D         [ 4] 3166         CALL     OVER
      009128 CD 06 DE         [ 4] 3167         CALL     PLUS
      009128 CD 90 BF         [ 4] 3168         CALL     OVER
      00912B CD 8B B2         [ 4] 3169 ACCP1:  CALL     DDUP
      00912E CD 8A 2D         [ 4] 3170         CALL     XORR
      009131 CC 8C 72         [ 4] 3171         CALL     QBRAN
      009134 91 23                 3172         .word      ACCP4
      009136 05 54 4F         [ 4] 3173         CALL     KEY
      009139 4B 45 4E         [ 4] 3174         CALL     DUPP
      00913C CD 0A 37         [ 4] 3175         CALL     BLANK
      00913C CD 8A B7         [ 4] 3176         CALL     DOLIT
      00913F CC 91                 3177         .word      127
      009141 28 91 36         [ 4] 3178         CALL     WITHI
      009144 05 4E 41         [ 4] 3179         CALL     QBRAN
      009147 4D 45                 3180         .word      ACCP2
      009149 3E 11 FB         [ 4] 3181         CALL     TAP
      00914A 20 03            [ 2] 3182         JRA     ACCP3
      00914A CD 8B 9B         [ 4] 3183 ACCP2:  CALL     KTAP
      00914D CD 84            [ 2] 3184 ACCP3:  JRA     ACCP1
      00914F 34 00 1F         [ 4] 3185 ACCP4:  CALL     DROP
      009152 CD 85 AF         [ 4] 3186         CALL     OVER
      009155 CC 87 5E         [ 2] 3187         JP     SUBB
                                   3188 
                                   3189 ;       QUERY   ( -- )
                                   3190 ;       Accept input stream to
                                   3191 ;       terminal input buffer.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      009158 91 44                 3192         .word      LINK
                                   3193         
                           00128B  3194 LINK = . 
      00915A 05                    3195         .byte      5
      00915B 53 41 4D 45 3F        3196         .ascii     "QUERY"
      009160                       3197 QUERY:
      009160 CD 8A 65         [ 4] 3198         CALL     TIB
      009163 CD 85 2C         [ 4] 3199         CALL     DOLIT
      009166 20 29                 3200         .word      80
      009168 CD 85 8D         [ 4] 3201         CALL     ACCEP
      00916B CD 85 20         [ 4] 3202         CALL     NTIB
      00916E CD 87 5E         [ 4] 3203         CALL     STORE
      009171 CD 84 DA         [ 4] 3204         CALL     DROP
      009174 CD 85 8D         [ 4] 3205         CALL     ZERO
      009177 CD 85 20         [ 4] 3206         CALL     INN
      00917A CD 87 5E         [ 2] 3207         JP     STORE
                                   3208 
                                   3209 ;       ABORT   ( -- )
                                   3210 ;       Reset data stack and
                                   3211 ;       jump to QUIT.
      00917D CD 84                 3212         .word      LINK
                           0012B0  3213 LINK = . 
      00917F DA                    3214         .byte      5
      009180 CD 87 D7 CD 87        3215         .ascii     "ABORT"
      0012B6                       3216 ABORT:
      009185 0D CD 84         [ 4] 3217         CALL     PRESE
      009188 67 91 91         [ 2] 3218         JP     QUIT
                                   3219 
                                   3220 ;       abort"  ( f -- )
                                   3221 ;       Run time routine of ABORT".
                                   3222 ;       Abort with a message.
      00918B CD 85                 3223         .word      LINK
                           0012BE  3224 LINK = . 
      00918D 0D                    3225 	.byte      COMPO+6
      00918E CC 85 59 CD 84        3226         .ascii     "ABORT"
      009193 48                    3227         .byte      '"'
      0012C5                       3228 ABORQ:
      009194 91 68 CC         [ 4] 3229         CALL     QBRAN
      009197 8A C4                 3230         .word      ABOR2   ;text flag
      009199 91 5A 04         [ 4] 3231         CALL     DOSTR
      00919C 46 49 4E         [ 4] 3232 ABOR1:  CALL     SPACE
      00919F 44 0B 1B         [ 4] 3233         CALL     COUNT
      0091A0 CD 0E 8C         [ 4] 3234         CALL     TYPES
      0091A0 CD 85 73         [ 4] 3235         CALL     DOLIT
      0091A3 CD 85                 3236         .word     63 ; "?"
      0091A5 63 CD 84         [ 4] 3237         CALL     EMIT
      0091A8 DA CD 86         [ 4] 3238         CALL     CR
      0091AB 2F CD 84         [ 2] 3239         JP     ABORT   ;pass error string
      0091AE A5 CD 85         [ 4] 3240 ABOR2:  CALL     DOSTR
      0091B1 63 CD 84         [ 2] 3241         JP     DROP
                                   3242 
                                   3243 ;; The text interpreter
                                   3244 
                                   3245 ;       $INTERPRET      ( a -- )
                                   3246 ;       Interpret a word. If failed,
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3247 ;       try to convert it to an integer.
      0091B4 BC CD                 3248         .word      LINK
                           0012EC  3249 LINK = . 
      0091B6 85                    3250         .byte      10
      0091B7 2C CD 8A 2D CD 85 73  3251         .ascii     "$INTERPRET"
             CD 84 BC
      0012F7                       3252 INTER:
      0091C1 CD 85 63         [ 4] 3253         CALL     NAMEQ
      0091C4 CD 84 67         [ 4] 3254         CALL     QDUP    ;?defined
      0091C7 91 FD CD         [ 4] 3255         CALL     QBRAN
      0091CA 85 63                 3256         .word      INTE1
      0091CC CD 84 BC         [ 4] 3257         CALL     AT
      0091CF CD 84 34         [ 4] 3258         CALL     DOLIT
      0091D2 1F 7F                 3259 	.word       0x4000	; COMPO*256
      0091D4 CD 85 AF         [ 4] 3260         CALL     ANDD    ;?compile only lexicon bits
      0091D7 CD 85 20         [ 4] 3261         CALL     ABORQ
      0091DA CD                    3262         .byte      13
      0091DB 85 D8 CD 84 67 91 EC  3263         .ascii     " compile only"
             CD 8A 2D CD 84 34
      0091E8 FF FF 20         [ 2] 3264         JP     EXECU
      0091EB 0C CD 8A         [ 4] 3265 INTE1:  CALL     NUMBQ   ;convert a number
      0091EE 2D CD 86         [ 4] 3266         CALL     QBRAN
      0091F1 2F CD                 3267         .word    ABOR1
      0091F3 84               [ 4] 3268         RET
                                   3269 
                                   3270 ;       [       ( -- )
                                   3271 ;       Start  text interpreter.
      0091F4 BC CD                 3272         .word      LINK
                           00132C  3273 LINK = . 
      0091F6 91                    3274 	.byte      IMEDD+1
      0091F7 60                    3275         .ascii     "["
      00132E                       3276 LBRAC:
      0091F8 CD 84 7E         [ 4] 3277         CALL   DOLIT
      0091FB 92 0C                 3278         .word  INTER
      0091FD CD 85 0D         [ 4] 3279         CALL   TEVAL
      009200 CD 85 59         [ 2] 3280         JP     STORE
                                   3281 
                                   3282 ;       .OK     ( -- )
                                   3283 ;       Display 'ok' while interpreting.
      009203 CD 85                 3284         .word      LINK
                           00133B  3285 LINK = . 
      009205 73                    3286         .byte      3
      009206 CD 8A 3C              3287         .ascii     ".OK"
      00133F                       3288 DOTOK:
      009209 CC 85 73         [ 4] 3289         CALL     DOLIT
      00920C CD 84                 3290         .word      INTER
      00920E 67 92 19         [ 4] 3291         CALL     TEVAL
      009211 CD 8A 3C         [ 4] 3292         CALL     AT
      009214 CD 8A 3C         [ 4] 3293         CALL     EQUAL
      009217 20 A5 CD         [ 4] 3294         CALL     QBRAN
      00921A 85 0D                 3295         .word      DOTO1
      00921C CD 85 59         [ 4] 3296         CALL     DOTQP
      00921F CD                    3297         .byte      3
      009220 85 73 CD              3298         .ascii     " ok"
      009223 85 59 CD         [ 2] 3299 DOTO1:  JP     CR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3300 
                                   3301 ;       ?STACK  ( -- )
                                   3302 ;       Abort if stack underflows.
      009226 8A 3C                 3303         .word      LINK
                           00135E  3304 LINK = . 
      009228 CD                    3305         .byte      6
      009229 85 63 CD 91 4A CC     3306         .ascii     "?STACK"
      001365                       3307 QSTAC: 
      00922F 85 73 91         [ 4] 3308         CALL     DEPTH
      009232 9B 05 4E         [ 4] 3309         CALL     ZLESS   ;check only for underflow
      009235 41 4D 45         [ 4] 3310         CALL     ABORQ
      009238 3F                    3311         .byte      11
      009239 20 75 6E 64 65 72 66  3312         .ascii     " underflow "
             6C 6F 77 20
      009239 CD               [ 4] 3313         RET
                                   3314 
                                   3315 ;       EVAL    ( -- )
                                   3316 ;       Interpret  input stream.
      00923A 86 A3                 3317         .word      LINK
                           00137D  3318 LINK = . 
      00923C CC                    3319         .byte      4
      00923D 91 A0 92 33           3320         .ascii     "EVAL"
      001382                       3321 EVAL:
      009241 02 5E 48         [ 4] 3322 EVAL1:  CALL     TOKEN
      009244 CD 04 E3         [ 4] 3323         CALL     DUPP
      009244 CD 85 2C         [ 4] 3324         CALL     CAT     ;?input stream empty
      009247 CD 85 8D         [ 4] 3325         CALL     QBRAN
      00924A CD 85                 3326         .word    EVAL2
      00924C 0D CD 85         [ 4] 3327         CALL     TEVAL
      00924F 73 CD 85         [ 4] 3328         CALL     ATEXE
      009252 8D CD 85         [ 4] 3329         CALL     QSTAC   ;evaluate input, check stack
      009255 D8 CD 84         [ 4] 3330         CALL     BRAN
      009258 67 92                 3331         .word    EVAL1
      00925A 74 CD 84         [ 4] 3332 EVAL2:  CALL     DROP
      00925D 34 00 08         [ 2] 3333         JP       DOTOK
                                   3334 
                                   3335 ;       PRESET  ( -- )
                                   3336 ;       Reset data stack pointer and
                                   3337 ;       terminal input buffer.
      009260 CD 84                 3338         .word      LINK
                           0013A6  3339 LINK = . 
      009262 1E                    3340         .byte      6
      009263 CD 8A 65 CD 8A B7     3341         .ascii     "PRESET"
      0013AD                       3342 PRESE:
      009269 CD 84 1E         [ 4] 3343         CALL     DOLIT
      00926C CD 84                 3344         .word      SPP
      00926E 34 00 08         [ 4] 3345         CALL     SPSTO
      009271 CC 84 1E         [ 4] 3346         CALL     DOLIT
      009274 81 92                 3347         .word      TIBB
      009276 41 03 54         [ 4] 3348         CALL     NTIB
      009279 41 50 AD         [ 4] 3349         CALL     CELLP
      00927B CC 04 25         [ 2] 3350         JP     STORE
                                   3351 
                                   3352 ;       QUIT    ( -- )
                                   3353 ;       Reset return stack pointer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3354 ;       and start text interpreter.
      00927B CD 85                 3355         .word      LINK
                           0013C5  3356 LINK = . 
      00927D 63                    3357         .byte      4
      00927E CD 84 1E CD           3358         .ascii     "QUIT"
      0013CA                       3359 QUIT:
      009282 85 8D CD         [ 4] 3360         CALL     DOLIT
      009285 84 C9                 3361         .word      RPP
      009287 CC 8A 58         [ 4] 3362         CALL     RPSTO   ;reset return stack pointer
      00928A 92 77 04         [ 4] 3363 QUIT1:  CALL     LBRAC   ;start interpretation
      00928D 4B 54 41         [ 4] 3364 QUIT2:  CALL     QUERY   ;get input
      009290 50 13 82         [ 4] 3365         CALL     EVAL
      009291 20 F8            [ 2] 3366         JRA     QUIT2   ;continue till error
                                   3367 
                                   3368 ;; The compiler
                                   3369 
                                   3370 ;       '       ( -- ca )
                                   3371 ;       Search vocabularies for
                                   3372 ;       next word in input stream.
      009291 CD 85                 3373         .word      LINK
                           0013DF  3374 LINK = . 
      009293 63                    3375         .byte      1
      009294 CD                    3376         .ascii     "'"
      0013E1                       3377 TICK:
      009295 84 34 00         [ 4] 3378         CALL     TOKEN
      009298 0D CD 85         [ 4] 3379         CALL     NAMEQ   ;?defined
      00929B D8 CD 84         [ 4] 3380         CALL     QBRAN
      00929E 67 92                 3381         .word      ABOR1
      0092A0 B7               [ 4] 3382         RET     ;yes, push code address
                                   3383 
                                   3384 ;       ALLOT   ( n -- )
                                   3385 ;       Allocate n bytes to RAM 
      0092A1 CD 84                 3386         .word      LINK
                           0013EF  3387         LINK = . 
      0092A3 34                    3388         .byte      5
      0092A4 00 08 CD 85 D8        3389         .ascii     "ALLOT"
      0013F5                       3390 ALLOT:
      0092A9 CD 84 67         [ 4] 3391         CALL     VPP
                                   3392 ; must update APP_VP each time VP is modidied
      0092AC 92 B4 CD         [ 4] 3393         call PSTOR 
      0092AF 8A B7 CC         [ 2] 3394         jp UPDATVP 
                                   3395 
                                   3396 ;       ,       ( w -- )
                                   3397 ;         Compile an integer into
                                   3398 ;         variable space.
      0092B2 92 7B                 3399         .word      LINK
                           001400  3400 LINK = . 
      0092B4 CC                    3401         .byte      1
      0092B5 92                    3402         .ascii     ","
      001402                       3403 COMMA:
      0092B6 44 CD 85         [ 4] 3404         CALL     HERE
      0092B9 59 CD 85         [ 4] 3405         CALL     DUPP
      0092BC 73 CD 85         [ 4] 3406         CALL     CELLP   ;cell boundary
      0092BF 59 CC 85         [ 4] 3407         CALL     VPP
      0092C2 63 92 8C         [ 4] 3408         CALL     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0092C5 06 41 43         [ 2] 3409         JP     STORE
                                   3410 
                                   3411 ;       C,      ( c -- )
                                   3412 ;       Compile a byte into
                                   3413 ;       variables space.
      0092C8 43 45                 3414        .word      LINK
                           001416  3415 LINK = . 
      0092CA 50                    3416         .byte      2
      0092CB 54 2C                 3417         .ascii     "C,"
      0092CC                       3418 CCOMMA:
      0092CC CD 85 8D         [ 4] 3419         CALL     HERE
      0092CF CD 87 5E         [ 4] 3420         CALL     DUPP
      0092D2 CD 85 8D         [ 4] 3421         CALL     ONEP
      0092D5 CD 87 49         [ 4] 3422         CALL     VPP
      0092D8 CD 85 D8         [ 4] 3423         CALL     STORE
      0092DB CD 84 67         [ 2] 3424         JP     CSTOR
                                   3425 
                                   3426 ;       [COMPILE]       ( -- ; <string> )
                                   3427 ;       Compile next immediate
                                   3428 ;       word into code dictionary.
      0092DE 93 00                 3429         .word      LINK
                           00142D  3430 LINK = . 
      0092E0 CD                    3431 	.byte      IMEDD+9
      0092E1 8E AA CD 85 63 CD 8A  3432         .ascii     "[COMPILE]"
             B7 CD
      001437                       3433 BCOMP:
      0092EA 84 34 00         [ 4] 3434         CALL     TICK
      0092ED 7F CD 88         [ 2] 3435         JP     JSRC
                                   3436 
                                   3437 ;       COMPILE ( -- )
                                   3438 ;       Compile next jsr in
                                   3439 ;       colon list to code dictionary.
      0092F0 99 CD                 3440         .word      LINK
                           00143F  3441 LINK = . 
      0092F2 84                    3442 	.byte      COMPO+7
      0092F3 67 92 FB CD 92 7B 20  3443         .ascii     "COMPILE"
      001447                       3444 COMPI:
      0092FA 03 CD 92         [ 4] 3445         CALL     RFROM
      0092FD 91 20 D5         [ 4] 3446         CALL     DUPP
      009300 CD 85 59         [ 4] 3447         CALL     AT
      009303 CD 85 8D         [ 4] 3448         CALL     JSRC    ;compile subroutine
      009306 CC 87 D7         [ 4] 3449         CALL     CELLP
      009309 92 C5            [ 1] 3450         ldw y,x 
      00930B 05 51            [ 2] 3451         ldw y,(y)
      00930D 55 45 52         [ 2] 3452         addw x,#CELLL 
      009310 59 FC            [ 2] 3453         jp (y)
                                   3454 
                                   3455 ;       LITERAL ( w -- )
                                   3456 ;       Compile tos to dictionary
                                   3457 ;       as an integer literal.
      009311 14 3F                 3458         .word      LINK
                           001461  3459 LINK = . 
      009311 CD                    3460 	.byte      IMEDD+7
      009312 8B D4 CD 84 34 00 50  3461         .ascii     "LITERAL"
      001469                       3462 LITER:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal  CD-Bits]



      00931A 92 CC CD         [ 4] 3463         CALL     COMPI
      00931D 86 4E                 3464         .word DOLIT 
      00931F CD 84 A5         [ 2] 3465         JP     COMMA
                                   3466 
                                   3467 ;       $,"     ( -- )
                                   3468 ;       Compile a literal string
                                   3469 ;       up to next " .
      009322 CD 85                 3470         .word      LINK
                           001473  3471 LINK = . 
      009324 59                    3472         .byte      3
      009325 CD 8A C4              3473         .byte     '$',',','"'
      001477                       3474 STRCQ:
      009328 CD 86 3E         [ 4] 3475         CALL     DOLIT
      00932B CC 84                 3476         .word     34	; "
      00932D A5 93 0B         [ 4] 3477         CALL     PARSE
      009330 05 41 42         [ 4] 3478         CALL     HERE
      009333 4F 52 54         [ 4] 3479         CALL     PACKS   ;string to code dictionary
      009336 CD 0B 1B         [ 4] 3480         CALL     COUNT
      009336 CD 94 2D         [ 4] 3481         CALL     PLUS    ;calculate aligned end of string
      009339 CC 94 4A         [ 4] 3482         CALL     VPP
      00933C 93 30 46         [ 2] 3483         JP     STORE
                                   3484 
                                   3485 ;; Structures
                                   3486 
                                   3487 ;       FOR     ( -- a )
                                   3488 ;       Start a FOR-NEXT loop
                                   3489 ;       structure in a colon definition.
      00933F 41 42                 3490         .word      LINK
                           001493  3491 LINK = . 
      009341 4F                    3492 	.byte      IMEDD+3
      009342 52 54 22              3493         .ascii     "FOR"
      009345                       3494 FOR:
      009345 CD 84 67         [ 4] 3495         CALL     COMPI
      009348 93 64                 3496         .word TOR 
      00934A CD 8F 40         [ 2] 3497         JP     HERE
                                   3498 
                                   3499 ;       NEXT    ( a -- )
                                   3500 ;       Terminate a FOR-NEXT loop.
      00934D CD 8E                 3501         .word      LINK
                           0014A1  3502 LINK = . 
      00934F E2                    3503 	.byte      IMEDD+4
      009350 CD 8B 9B CD           3504         .ascii     "NEXT"
      0014A6                       3505 NEXT:
      009354 8F 0C CD         [ 4] 3506         CALL     COMPI
      009357 84 34                 3507         .word DONXT 
      009359 00 3F CD         [ 4] 3508         call ADRADJ
      00935C 84 1E CD         [ 2] 3509         JP     COMMA
                                   3510 
                                   3511 ;       I ( -- n )
                                   3512 ;       stack FOR-NEXT COUNTER 
      00935F 8F 2A                 3513         .word LINK 
                           0014B3  3514         LINK=.
      009361 CC                    3515         .byte 1 
      009362 93                    3516         .ascii "I"
      0014B5                       3517 IFETCH: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009363 36 CD 8F         [ 2] 3518         subw x,#CELLL 
      009366 40 CC            [ 2] 3519         ldw y,(3,sp)
      009368 85               [ 2] 3520         ldw (x),y 
      009369 59               [ 4] 3521         ret 
                                   3522 
                                   3523 ;       BEGIN   ( -- a )
                                   3524 ;       Start an infinite or
                                   3525 ;       indefinite loop structure.
      00936A 93 3E                 3526         .word      LINK
                           0014BE  3527 LINK = . 
      00936C 0A                    3528 	.byte      IMEDD+5
      00936D 24 49 4E 54 45        3529         .ascii     "BEGIN"
      0014C4                       3530 BEGIN:
      009372 52 50 52         [ 2] 3531         JP     HERE
                                   3532 
                                   3533 ;       UNTIL   ( a -- )
                                   3534 ;       Terminate a BEGIN-UNTIL
                                   3535 ;       indefinite loop structure.
      009375 45 54                 3536         .word      LINK
                           0014C9  3537 LINK = . 
      009377 85                    3538 	.byte      IMEDD+5
      009377 CD 92 39 CD 87        3539         .ascii     "UNTIL"
      0014CF                       3540 UNTIL:
      00937C 0D CD 84         [ 4] 3541         CALL     COMPI
      00937F 67 93                 3542         .word    QBRAN 
      009381 A1 CD 84         [ 4] 3543         call ADRADJ
      009384 BC CD 84         [ 2] 3544         JP     COMMA
                                   3545 
                                   3546 ;       AGAIN   ( a -- )
                                   3547 ;       Terminate a BEGIN-AGAIN
                                   3548 ;       infinite loop structure.
      009387 34 40                 3549         .word      LINK
                           0014DC  3550 LINK = . 
      009389 00                    3551 	.byte      IMEDD+5
      00938A CD 85 AF CD 93        3552         .ascii     "AGAIN"
      0014E2                       3553 AGAIN:
      00938F 45 0D 20         [ 4] 3554         CALL     COMPI
      009392 63 6F                 3555         .word BRAN
      009394 6D 70 69         [ 4] 3556         call ADRADJ 
      009397 6C 65 20         [ 2] 3557         JP     COMMA
                                   3558 
                                   3559 ;       IF      ( -- A )
                                   3560 ;       Begin a conditional branch.
      00939A 6F 6E                 3561         .word      LINK
                           0014EF  3562 LINK = . 
      00939C 6C                    3563 	.byte      IMEDD+2
      00939D 79 CC                 3564         .ascii     "IF"
      0014F2                       3565 IFF:
      00939F 84 8E CD         [ 4] 3566         CALL     COMPI
      0093A2 8D D7                 3567         .word QBRAN
      0093A4 CD 84 67         [ 4] 3568         CALL     HERE
      0093A7 93 4D 81         [ 4] 3569         CALL     ZERO
      0093AA 93 6C 81         [ 2] 3570         JP     COMMA
                                   3571 
                                   3572 ;       THEN        ( A -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   3573 ;       Terminate a conditional branch structure.
      0093AD 5B EF                 3574         .word      LINK
                           001502  3575 LINK = . 
      0093AE 84                    3576 	.byte      IMEDD+4
      0093AE CD 84 34 93           3577         .ascii     "THEN"
      001507                       3578 THENN:
      0093B2 77 CD 86         [ 4] 3579         CALL     HERE
      0093B5 81 CC 84         [ 4] 3580         call ADRADJ 
      0093B8 A5 93 AC         [ 4] 3581         CALL     SWAPP
      0093BB 03 2E 4F         [ 2] 3582         JP     STORE
                                   3583 
                                   3584 ;       ELSE        ( A -- A )
                                   3585 ;       Start the false clause in an IF-ELSE-THEN structure.
      0093BE 4B 02                 3586         .word      LINK
                           001515  3587 LINK = . 
      0093BF 84                    3588 	.byte      IMEDD+4
      0093BF CD 84 34 93           3589         .ascii     "ELSE"
      00151A                       3590 ELSEE:
      0093C3 77 CD 86         [ 4] 3591         CALL     COMPI
      0093C6 81 CD                 3592         .word BRAN
      0093C8 84 BC CD         [ 4] 3593         CALL     HERE
      0093CB 87 FF CD         [ 4] 3594         CALL     ZERO
      0093CE 84 67 93         [ 4] 3595         CALL     COMMA
      0093D1 D9 CD 8F         [ 4] 3596         CALL     SWAPP
      0093D4 69 03 20         [ 4] 3597         CALL     HERE
      0093D7 6F 6B CC         [ 4] 3598         call ADRADJ 
      0093DA 8F 2A 93         [ 4] 3599         CALL     SWAPP
      0093DD BB 06 3F         [ 2] 3600         JP     STORE
                                   3601 
                                   3602 ;       AHEAD       ( -- A )
                                   3603 ;       Compile a forward branch instruction.
      0093E0 53 54                 3604         .word      LINK
                           001539  3605 LINK = . 
      0093E2 41                    3606 	.byte      IMEDD+5
      0093E3 43 4B 45 41 44        3607         .ascii     "AHEAD"
      0093E5                       3608 AHEAD:
      0093E5 CD 8B 06         [ 4] 3609         CALL     COMPI
      0093E8 CD 85                 3610         .word BRAN
      0093EA 9C CD 93         [ 4] 3611         CALL     HERE
      0093ED 45 0B 20         [ 4] 3612         CALL     ZERO
      0093F0 75 6E 64         [ 2] 3613         JP     COMMA
                                   3614 
                                   3615 ;       WHILE       ( a -- A a )
                                   3616 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      0093F3 65 72                 3617         .word      LINK
                           00154F  3618 LINK = . 
      0093F5 66                    3619 	.byte      IMEDD+5
      0093F6 6C 6F 77 20 81        3620         .ascii     "WHILE"
      001555                       3621 WHILE:
      0093FB 93 DE 04         [ 4] 3622         CALL     COMPI
      0093FE 45 56                 3623         .word QBRAN
      009400 41 4C 32         [ 4] 3624         CALL     HERE
      009402 CD 0A 44         [ 4] 3625         CALL     ZERO
      009402 CD 91 3C         [ 4] 3626         CALL     COMMA
      009405 CD 85 63         [ 2] 3627         JP     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3628 
                                   3629 ;       REPEAT      ( A a -- )
                                   3630 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      009408 CD 84                 3631         .word      LINK
                           001568  3632 LINK = . 
      00940A DA                    3633         .byte      IMEDD+6
      00940B CD 84 67 94 1E CD     3634         .ascii     "REPEAT"
      00156F                       3635 REPEA:
      009411 86 81 CD         [ 4] 3636         CALL     COMPI
      009414 8B E8                 3637         .word BRAN
      009416 CD 93 E5         [ 4] 3638         call ADRADJ 
      009419 CD 84 7E         [ 4] 3639         CALL     COMMA
      00941C 94 02 CD         [ 4] 3640         CALL     HERE
      00941F 85 59 CC         [ 4] 3641         call ADRADJ 
      009422 93 BF 93         [ 4] 3642         CALL     SWAPP
      009425 FD 06 50         [ 2] 3643         JP     STORE
                                   3644 
                                   3645 ;       AFT         ( a -- a A )
                                   3646 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      009428 52 45                 3647         .word      LINK
                           001588  3648 LINK = . 
      00942A 53                    3649 	.byte      IMEDD+3
      00942B 45 54 54              3650         .ascii     "AFT"
      00942D                       3651 AFT:
      00942D CD 84 34         [ 4] 3652         CALL     DROP
      009430 06 80 CD         [ 4] 3653         CALL     AHEAD
      009433 85 50 CD         [ 4] 3654         CALL     HERE
      009436 84 34 07         [ 2] 3655         JP     SWAPP
                                   3656 
                                   3657 ;       ABORT"      ( -- ; <string> )
                                   3658 ;       Conditional abort with an error message.
      009439 00 CD                 3659         .word      LINK
                           00159A  3660 LINK = . 
      00943B 86                    3661 	.byte      IMEDD+6
      00943C 4E CD 8A 2D CC        3662         .ascii     "ABORT"
      009441 84                    3663         .byte      '"'
      0015A1                       3664 ABRTQ:
      009442 A5 94 26         [ 4] 3665         CALL     COMPI
      009445 04 51                 3666         .word ABORQ
      009447 55 49 54         [ 2] 3667         JP     STRCQ
                                   3668 
                                   3669 ;       $"     ( -- ; <string> )
                                   3670 ;       Compile an inline string literal.
      00944A 15 9A                 3671         .word      LINK
                           0015AB  3672 LINK = . 
      00944A CD                    3673 	.byte      IMEDD+2
      00944B 84 34                 3674         .byte     '$','"'
      0015AE                       3675 STRQ:
      00944D 07 FF CD         [ 4] 3676         CALL     COMPI
      009450 84 F7                 3677         .word STRQP 
      009452 CD 93 AE         [ 2] 3678         JP     STRCQ
                                   3679 
                                   3680 ;       ."          ( -- ; <string> )
                                   3681 ;       Compile an inline string literal to be typed out at run time.
      009455 CD 93                 3682         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                           0015B8  3683 LINK = . 
      009457 11                    3684 	.byte      IMEDD+2
      009458 CD 94                 3685         .byte     '.','"'
      0015BB                       3686 DOTQ:
      00945A 02 20 F8         [ 4] 3687         CALL     COMPI
      00945D 94 45                 3688         .word DOTQP 
      00945F 01 27 77         [ 2] 3689         JP     STRCQ
                                   3690 
                                   3691 ;; Name compiler
                                   3692 
                                   3693 ;       ?UNIQUE ( a -- a )
                                   3694 ;       Display a warning message
                                   3695 ;       if word already exists.
      009461 15 B8                 3696         .word      LINK
                           0015C5  3697 LINK = . 
      009461 CD                    3698         .byte      7
      009462 91 3C CD 92 39 CD 84  3699         .ascii     "?UNIQUE"
      0015CD                       3700 UNIQU:
      009469 67 93 4D         [ 4] 3701         CALL     DUPP
      00946C 81 94 5F         [ 4] 3702         CALL     NAMEQ   ;?name exists
      00946F 05 41 4C         [ 4] 3703         CALL     QBRAN
      009472 4C 4F                 3704         .word      UNIQ1
      009474 54 0E E9         [ 4] 3705         CALL     DOTQP   ;redef are OK
      009475 07                    3706         .byte       7
      009475 CD 86 B1 CD 8B 34 CC  3707         .ascii     " reDef "       
      00947C 9B EF 94         [ 4] 3708         CALL     OVER
      00947F 6F 01 2C         [ 4] 3709         CALL     COUNT
      009482 CD 0E 8C         [ 4] 3710         CALL     TYPES   ;just in case
      009482 CD 8B B2         [ 2] 3711 UNIQ1:  JP     DROP
                                   3712 
                                   3713 ;       $,n     ( na -- )
                                   3714 ;       Build a new dictionary name
                                   3715 ;       using string at na.
                                   3716 ; compile dans l'espace des variables 
      009485 CD 85                 3717         .word      LINK
                           0015F1  3718 LINK = . 
      009487 63                    3719         .byte      3
      009488 CD 8A 2D              3720         .ascii     "$,n"
      0015F5                       3721 SNAME:
      00948B CD 86 B1         [ 4] 3722         CALL     DUPP
      00948E CD 84 A5         [ 4] 3723         CALL     CAT     ;?null input
      009491 CC 84 A5         [ 4] 3724         CALL     QBRAN
      009494 94 80                 3725         .word      PNAM1
      009496 02 43 2C         [ 4] 3726         CALL     UNIQU   ;?redefinition
      009499 CD 04 E3         [ 4] 3727         CALL     DUPP
      009499 CD 8B B2         [ 4] 3728         CALL     COUNT
      00949C CD 85 63         [ 4] 3729         CALL     PLUS
      00949F CD 8A 58         [ 4] 3730         CALL     VPP
      0094A2 CD 86 B1         [ 4] 3731         CALL     STORE
      0094A5 CD 84 A5         [ 4] 3732         CALL     DUPP
      0094A8 CC 84 C9         [ 4] 3733         CALL     LAST
      0094AB 94 96 89         [ 4] 3734         CALL     STORE   ;save na for vocabulary link
      0094AE 5B 43 4F         [ 4] 3735         CALL     CELLM   ;link address
      0094B1 4D 50 49         [ 4] 3736         CALL     CNTXT
      0094B4 4C 45 5D         [ 4] 3737         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0094B7 CD 04 F3         [ 4] 3738         CALL     SWAPP
      0094B7 CD 94 61         [ 4] 3739         CALL     STORE
      0094BA CC               [ 4] 3740         RET     ;save code pointer
      0094BB 97 7D 94         [ 4] 3741 PNAM1:  CALL     STRQP
      0094BE AD                    3742         .byte      5
      0094BF 47 43 4F 4D 50        3743         .ascii     " name" ;null input
      0094C4 49 4C 45         [ 2] 3744         JP     ABOR1
                                   3745 
                                   3746 ;; FORTH compiler
                                   3747 
                                   3748 ;       $COMPILE        ( a -- )
                                   3749 ;       Compile next word to
                                   3750 ;       dictionary as a token or literal.
      0094C7 15 F1                 3751         .word      LINK
                           001639  3752 LINK = . 
      0094C7 CD                    3753         .byte      8
      0094C8 85 0D CD 85 63 CD 84  3754         .ascii     "$COMPILE"
             BC
      001642                       3755 SCOMP:
      0094D0 CD 97 7D         [ 4] 3756         CALL     NAMEQ
      0094D3 CD 8A 2D         [ 4] 3757         CALL     QDUP    ;?defined
      0094D6 90 93 90         [ 4] 3758         CALL     QBRAN
      0094D9 FE 1C                 3759         .word      SCOM2
      0094DB 00 02 90         [ 4] 3760         CALL     AT
      0094DE FC 94 BF         [ 4] 3761         CALL     DOLIT
      0094E1 87 4C                 3762         .word     0x8000	;  IMEDD*256
      0094E3 49 54 45         [ 4] 3763         CALL     ANDD    ;?immediate
      0094E6 52 41 4C         [ 4] 3764         CALL     QBRAN
      0094E9 16 60                 3765         .word      SCOM1
      0094E9 CD 94 C7         [ 2] 3766         JP     EXECU
      0094EC 84 34 CC         [ 2] 3767 SCOM1:  JP     JSRC
      0094EF 94 82 94         [ 4] 3768 SCOM2:  CALL     NUMBQ   ;try to convert to number
      0094F2 E1 03 24         [ 4] 3769         CALL     QBRAN
      0094F5 2C 22                 3770         .word      ABOR1
      0094F7 CC 14 69         [ 2] 3771         JP     LITER
                                   3772 
                                   3773 ;       OVERT   ( -- )
                                   3774 ;       Link a new word into vocabulary.
      0094F7 CD 84                 3775         .word      LINK
                           001670  3776 LINK = . 
      0094F9 34                    3777         .byte      5
      0094FA 00 22 CD 90 BF        3778         .ascii     "OVERT"
      001676                       3779 OVERT:
      0094FF CD 8B B2         [ 4] 3780         CALL     LAST
      009502 CD 8C 72         [ 4] 3781         CALL     AT
      009505 CD 8B 9B         [ 4] 3782         CALL     CNTXT
      009508 CD 87 5E         [ 2] 3783         JP     STORE
                                   3784 
                                   3785 ;       ;       ( -- )
                                   3786 ;       Terminate a colon definition.
      00950B CD 86                 3787         .word      LINK
                           001684  3788 LINK = . 
      00950D B1                    3789 	.byte      IMEDD+COMPO+1
      00950E CC                    3790         .ascii     ";"
      001686                       3791 SEMIS:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                           000001  3792 .if OPTIMIZE ; more compact and faster
      00950F 84 A5 94         [ 4] 3793         call DOLIT 
      009512 F3 83                 3794         .word 0x81   ; opcode for RET 
      009514 46 4F 52         [ 4] 3795         call CCOMMA 
                           000000  3796 .else
                                   3797         CALL     COMPI
                                   3798         .word EXIT 
                                   3799 .endif 
      009517 CD 13 2E         [ 4] 3800         CALL     LBRAC
      009517 CD 94 C7         [ 4] 3801         call OVERT 
      00951A 85 2C CC         [ 4] 3802         CALL FMOVE
      00951D 8B B2 95         [ 4] 3803         call QDUP 
      009520 13 84 4E         [ 4] 3804         call QBRAN 
      009523 45 58                 3805         .word SET_RAMLAST 
      009525 54 20 35         [ 4] 3806         CALL UPDATPTR
      009526 81               [ 4] 3807         RET 
                                   3808 
                                   3809 
                                   3810 ;       Terminate an ISR definition 
                                   3811 ;       retourn ca of ISR as double
                                   3812 ;       I; ( -- ud )
      009526 CD 94                 3813         .word LINK 
                           0016A5  3814         LINK=.
      009528 C7                    3815         .byte 2+IMEDD+COMPO 
      009529 84 48                 3816         .ascii "I;" 
      0016A8                       3817 ISEMI:
      00952B CD 86 FD         [ 2] 3818         subw x,#CELLL  
      00952E CC 94 82 95      [ 2] 3819         ldw y,#IRET_CODE 
      009532 21               [ 2] 3820         ldw (x),y 
      009533 01 49 19         [ 4] 3821         call CCOMMA
      009535 CD 13 2E         [ 4] 3822         call LBRAC 
      009535 1D 00 02         [ 4] 3823         call IFMOVE
      009538 16 03 FF         [ 4] 3824         call QDUP 
      00953B 81 95 33         [ 4] 3825         CALL QBRAN 
      00953E 85 42                 3826         .word SET_RAMLAST
      009540 45 47 49         [ 4] 3827         CALL CPP
      009543 4E 04 3C         [ 4] 3828         call AT 
      009544 CD 04 F3         [ 4] 3829         call SWAPP 
      009544 CC 8B B2         [ 4] 3830         CALL CPP 
      009547 95 3E 85         [ 4] 3831         call STORE 
      00954A 55 4E 54         [ 4] 3832         call UPDATCP 
      00954D 49 4C 19         [ 4] 3833         call EEPVP 
      00954F CD 04 D9         [ 4] 3834         call DROP 
      00954F CD 94 C7         [ 4] 3835         call AT 
      009552 84 67 CD         [ 4] 3836         call VPP 
      009555 86 FD CC         [ 4] 3837         call STORE 
      009558 94 82 95         [ 2] 3838         jp ZERO
      00955B 49               [ 4] 3839         ret           
                                   3840         
                                   3841 
                                   3842 ;       ]       ( -- )
                                   3843 ;       Start compiling words in
                                   3844 ;       input stream.
      00955C 85 41                 3845         .word      LINK
                           0016E8  3846 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      00955E 47                    3847         .byte      1
      00955F 41                    3848         .ascii     "]"
      0016EA                       3849 RBRAC:
      009560 49 4E B4         [ 4] 3850         CALL   DOLIT
      009562 16 42                 3851         .word  SCOMP
      009562 CD 94 C7         [ 4] 3852         CALL   TEVAL
      009565 84 7E CD         [ 2] 3853         JP     STORE
                                   3854 
                                   3855 ;       CALL,    ( ca -- )
                                   3856 ;       Compile a subroutine call.
      009568 86 FD                 3857         .word      LINK
                           0016F7  3858 LINK = . 
      00956A CC                    3859         .byte      5
      00956B 94 82 95 5C 82        3860         .ascii     "CALL,"
      0016FD                       3861 JSRC:
      009570 49 46 B4         [ 4] 3862         CALL     DOLIT
      009572 00 CD                 3863         .word     CALLL     ;CALL
      009572 CD 94 C7         [ 4] 3864         CALL     CCOMMA
      009575 84 67 CD         [ 2] 3865         JP     COMMA
                                   3866 
                                   3867 ;       INIT-OFS ( -- )
                                   3868 ;       compute offset to adjust jump address 
                                   3869 ;       set variable OFFSET 
      009578 8B B2                 3870         .word LINK 
                           00170A  3871         LINK=.
      00957A CD                    3872         .byte 8 
      00957B 8A C4 CC 94 82 95 6F  3873         .ascii "INIT-OFS" 
             84
      001713                       3874 INITOFS:
      009583 54 48 45         [ 4] 3875         call TFLASH 
      009586 4E 04 3C         [ 4] 3876         CALL AT 
      009587 CD 04 E3         [ 4] 3877         CALL DUPP 
      009587 CD 8B B2         [ 4] 3878         call QBRAN
      00958A CD 86                 3879         .word 1$
      00958C FD CD 85         [ 4] 3880         call DROP  
      00958F 73 CC 84         [ 4] 3881         call CPP 
      009592 A5 95 82         [ 4] 3882         call AT 
      009595 84 45 4C         [ 4] 3883         call HERE
      009598 53 45 57         [ 4] 3884         call SUBB 
      00959A CD 06 74         [ 4] 3885 1$:     call OFFSET 
      00959A CD 94 C7         [ 2] 3886         jp STORE  
                                   3887 
                                   3888 ;       :       ( -- ; <string> )
                                   3889 ;       Start a new colon definition
                                   3890 ;       using next word as its name.
      00959D 84 7E                 3891         .word      LINK
                           001738  3892 LINK = . 
      00959F CD                    3893         .byte      1
      0095A0 8B                    3894         .ascii     ":"
      00173A                       3895 COLON:
      0095A1 B2 CD 8A         [ 4] 3896         call INITOFS       
      0095A4 C4 CD 94         [ 4] 3897         CALL   TOKEN
      0095A7 82 CD 85         [ 4] 3898         CALL   SNAME
      0095AA 73 CD 8B         [ 2] 3899         JP     RBRAC
                                   3900 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3901 ;       I:  ( -- )
                                   3902 ;       Start interrupt service routine definition
                                   3903 ;       those definition have no name.
      0095AD B2 CD                 3904         .word LINK
                           001748  3905         LINK=.
      0095AF 86                    3906         .byte 2 
      0095B0 FD CD                 3907         .ascii "I:" 
      00174B                       3908 ICOLON:
      0095B2 85 73 CC         [ 4] 3909         call INITOFS 
      0095B5 84 A5 95         [ 2] 3910         jp RBRAC  
                                   3911 
                                   3912 ;       IMMEDIATE       ( -- )
                                   3913 ;       Make last compiled word
                                   3914 ;       an immediate word.
      0095B8 95 85                 3915         .word      LINK
                           001753  3916 LINK = . 
      0095BA 41                    3917         .byte      9
      0095BB 48 45 41 44 44 49 41  3918         .ascii     "IMMEDIATE"
             54 45
      0095BF                       3919 IMMED:
      0095BF CD 94 C7         [ 4] 3920         CALL     DOLIT
      0095C2 84 7E                 3921         .word     0x8000	;  IMEDD*256
      0095C4 CD 8B B2         [ 4] 3922         CALL     LAST
      0095C7 CD 8A C4         [ 4] 3923         CALL     AT
      0095CA CC 94 82         [ 4] 3924         CALL     AT
      0095CD 95 B9 85         [ 4] 3925         CALL     ORR
      0095D0 57 48 49         [ 4] 3926         CALL     LAST
      0095D3 4C 45 3C         [ 4] 3927         CALL     AT
      0095D5 CC 04 25         [ 2] 3928         JP     STORE
                                   3929 
                                   3930 ;; Defining words
                                   3931 
                                   3932 ;       CREATE  ( -- ; <string> )
                                   3933 ;       Compile a new array
                                   3934 ;       without allocating space.
      0095D5 CD 94                 3935         .word      LINK
                           001779  3936 LINK = . 
      0095D7 C7                    3937         .byte      6
      0095D8 84 67 CD 8B B2 CD     3938         .ascii     "CREATE"
      001780                       3939 CREAT:
      0095DE 8A C4 CD         [ 4] 3940         CALL     TOKEN
      0095E1 94 82 CC         [ 4] 3941         CALL     SNAME
      0095E4 85 73 95         [ 4] 3942         CALL     OVERT        
      0095E7 CF 86 52         [ 4] 3943         CALL     COMPI 
      0095EA 45 50                 3944         .word DOVAR 
      0095EC 45               [ 4] 3945         RET
                                   3946 
                                   3947 ;       VARIABLE        ( -- ; <string> )
                                   3948 ;       Compile a new variable
                                   3949 ;       initialized to 0.
      0095ED 41 54                 3950         .word      LINK
                           001791  3951 LINK = . 
      0095EF 08                    3952         .byte      8
      0095EF CD 94 C7 84 7E CD 86  3953         .ascii     "VARIABLE"
             FD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      00179A                       3954 VARIA:
                                   3955 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      0095F7 CD 94 82         [ 4] 3956         CALL HERE
      0095FA CD 8B B2         [ 4] 3957         CALL DUPP 
      0095FD CD 86 FD         [ 4] 3958         CALL CELLP
      009600 CD 85 73         [ 4] 3959         CALL VPP 
      009603 CC 84 A5         [ 4] 3960         CALL STORE
      009606 95 E8 83         [ 4] 3961         CALL CREAT
      009609 41 46 54         [ 4] 3962         CALL DUPP
      00960C CD 14 02         [ 4] 3963         CALL COMMA
      00960C CD 85 59         [ 4] 3964         CALL ZERO
      00960F CD 95 BF         [ 4] 3965         call SWAPP 
      009612 CD 8B B2         [ 4] 3966         CALL STORE
      009615 CC 85 73         [ 4] 3967         CALL FMOVE ; move definition to FLASH
      009618 96 08 86         [ 4] 3968         CALL QDUP 
      00961B 41 42 4F         [ 4] 3969         CALL QBRAN 
      00961E 52 54                 3970         .word SET_RAMLAST   
      009620 22 1B 6F         [ 4] 3971         call UPDATVP  ; don't update if variable kept in RAM.
      009621 CD 20 35         [ 4] 3972         CALL UPDATPTR
      009621 CD               [ 4] 3973         RET         
      0017CD                       3974 SET_RAMLAST: 
      009622 94 C7 93         [ 4] 3975         CALL LAST 
      009625 45 CC 94         [ 4] 3976         CALL AT 
      009628 F7 96 1A         [ 4] 3977         CALL RAMLAST 
      00962B 82 24 22         [ 2] 3978         jp STORE  
                                   3979 
                                   3980 
                                   3981 ;       CONSTANT  ( n -- ; <string> )
                                   3982 ;       Compile a new constant 
                                   3983 ;       n CONSTANT name 
      00962E 17 91                 3984         .word LINK 
                           0017DB  3985         LINK=. 
      00962E CD                    3986         .byte 8 
      00962F 94 C7 8F 5F CC 94 F7  3987         .ascii "CONSTANT" 
             96
      0017E4                       3988 CONSTANT:          
      009637 2B 82 2E         [ 4] 3989         CALL TOKEN
      00963A 22 15 F5         [ 4] 3990         CALL SNAME 
      00963B CD 16 76         [ 4] 3991         CALL OVERT 
      00963B CD 94 C7         [ 4] 3992         CALL COMPI 
      00963E 8F 69                 3993         .word DOCONST
      009640 CC 94 F7         [ 4] 3994         CALL COMMA 
      009643 96 38 07         [ 4] 3995         CALL FMOVE
      009646 3F 55 4E         [ 4] 3996         CALL QDUP 
      009649 49 51 55         [ 4] 3997         CALL QBRAN 
      00964C 45 CD                 3998         .word SET_RAMLAST  
      00964D CD 20 35         [ 4] 3999         CALL UPDATPTR  
      00964D CD               [ 4] 4000 1$:     RET          
                                   4001 
                                   4002 ; CONSTANT runtime semantic 
                                   4003 ; doCONST  ( -- n )
      00964E 85 63                 4004         .word LINK 
                           001806  4005         LINK=.
      009650 CD                    4006         .byte 7
      009651 92 39 CD 84 67 96 6C  4007         .ascii "DOCONST"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal  CD-Bits]



      00180E                       4008 DOCONST:
      009659 8F 69 07         [ 2] 4009         subw x,#CELLL
      00965C 20 72            [ 2] 4010         popw y 
      00965E 65 44            [ 2] 4011         ldw y,(y) 
      009660 65               [ 2] 4012         ldw (x),y 
      009661 66               [ 4] 4013         ret 
                                   4014 
                                   4015 
                                   4016 ;; Tools
                                   4017 
                                   4018 ;       _TYPE   ( b u -- )
                                   4019 ;       Display a string. Filter
                                   4020 ;       non-printing characters.
      009662 20 CD                 4021         .word      LINK
                           001819  4022 LINK = . 
      009664 85                    4023         .byte      5
      009665 8D CD 8B 9B CD        4024         .ascii     "_TYPE"
      00181F                       4025 UTYPE:
      00966A 8F 0C CC         [ 4] 4026         CALL     TOR     ;start count down loop
      00966D 85 59            [ 2] 4027         JRA     UTYP2   ;skip first pass
      00966F 96 45 03         [ 4] 4028 UTYP1:  CALL     DUPP
      009672 24 2C 6E         [ 4] 4029         CALL     CAT
      009675 CD 0A 6E         [ 4] 4030         CALL     TCHAR
      009675 CD 85 63         [ 4] 4031         CALL     EMIT    ;display only printable
      009678 CD 84 DA         [ 4] 4032         CALL     ONEP    ;increment address
      00967B CD 84 67         [ 4] 4033 UTYP2:  CALL     DONXT
      00967E 96 AB                 4034         .word      UTYP1   ;loop till done
      009680 CD 96 4D         [ 2] 4035         JP     DROP
                                   4036 
                                   4037 ;       dm+     ( a u -- a )
                                   4038 ;       Dump u bytes from ,
                                   4039 ;       leaving a+u on  stack.
      009683 CD 85                 4040         .word      LINK
                           00183D  4041 LINK = . 
      009685 63                    4042         .byte      3
      009686 CD 8B 9B              4043         .ascii     "dm+"
      001841                       4044 DUMPP:
      009689 CD 87 5E         [ 4] 4045         CALL     OVER
      00968C CD 86 B1         [ 4] 4046         CALL     DOLIT
      00968F CD 84                 4047         .word      4
      009691 A5 CD 85         [ 4] 4048         CALL     UDOTR   ;display address
      009694 63 CD 86         [ 4] 4049         CALL     SPACE
      009697 CF CD 84         [ 4] 4050         CALL     TOR     ;start count down loop
      00969A A5 CD            [ 2] 4051         JRA     PDUM2   ;skip first pass
      00969C 8A 3C CD         [ 4] 4052 PDUM1:  CALL     DUPP
      00969F 86 A3 CD         [ 4] 4053         CALL     CAT
      0096A2 84 BC CD         [ 4] 4054         CALL     DOLIT
      0096A5 85 73                 4055         .word      3
      0096A7 CD 84 A5         [ 4] 4056         CALL     UDOTR   ;display numeric data
      0096AA 81 CD 8F         [ 4] 4057         CALL     ONEP    ;increment address
      0096AD 5F 05 20         [ 4] 4058 PDUM2:  CALL     DONXT
      0096B0 6E 61                 4059         .word      PDUM1   ;loop till done
      0096B2 6D               [ 4] 4060         RET
                                   4061 
                                   4062 ;       DUMP    ( a u -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   4063 ;       Dump u bytes from a,
                                   4064 ;       in a formatted manner.
      0096B3 65 CC                 4065         .word      LINK
                           00186D  4066 LINK = . 
      0096B5 93                    4067         .byte      4
      0096B6 4D 96 71 08           4068         .ascii     "DUMP"
      001872                       4069 DUMP:
      0096BA 24 43 4F         [ 4] 4070         CALL     BASE
      0096BD 4D 50 49         [ 4] 4071         CALL     AT
      0096C0 4C 45 AC         [ 4] 4072         CALL     TOR
      0096C2 CD 0C EA         [ 4] 4073         CALL     HEX     ;save radix, set hex
      0096C2 CD 92 39         [ 4] 4074         CALL     DOLIT
      0096C5 CD 87                 4075         .word      16
      0096C7 0D CD 84         [ 4] 4076         CALL     SLASH   ;change count to lines
      0096CA 67 96 E3         [ 4] 4077         CALL     TOR     ;start count down loop
      0096CD CD 84 BC         [ 4] 4078 DUMP1:  CALL     CR
      0096D0 CD 84 34         [ 4] 4079         CALL     DOLIT
      0096D3 80 00                 4080         .word      16
      0096D5 CD 85 AF         [ 4] 4081         CALL     DDUP
      0096D8 CD 84 67         [ 4] 4082         CALL     DUMPP   ;display numeric
      0096DB 96 E0 CC         [ 4] 4083         CALL     ROT
      0096DE 84 8E CC         [ 4] 4084         CALL     ROT
      0096E1 97 7D CD         [ 4] 4085         CALL     SPACE
      0096E4 8D D7 CD         [ 4] 4086         CALL     SPACE
      0096E7 84 67 93         [ 4] 4087         CALL     UTYPE   ;display printable characters
      0096EA 4D CC 94         [ 4] 4088         CALL     DONXT
      0096ED E9 96                 4089         .word      DUMP1   ;loop till done
      0096EF B9 05 4F         [ 4] 4090 DUMP3:  CALL     DROP
      0096F2 56 45 52         [ 4] 4091         CALL     RFROM
      0096F5 54 05 A0         [ 4] 4092         CALL     BASE
      0096F6 CC 04 25         [ 2] 4093         JP     STORE   ;restore radix
                                   4094 
                                   4095 ;       .S      ( ... -- ... )
                                   4096 ;        Display  contents of stack.
      0096F6 CD 86                 4097         .word      LINK
                           0018B9  4098 LINK = . 
      0096F8 CF                    4099         .byte      2
      0096F9 CD 84                 4100         .ascii     ".S"
      0018BC                       4101 DOTS:
      0096FB BC CD 86         [ 4] 4102         CALL     CR
      0096FE A3 CC 84         [ 4] 4103         CALL     DEPTH   ;stack depth
      009701 A5 96 F0         [ 4] 4104         CALL     TOR     ;start count down loop
      009704 C1 3B            [ 2] 4105         JRA     DOTS2   ;skip first pass
      009706 CD 04 A0         [ 4] 4106 DOTS1:  CALL     RAT
      009706 CD 84 34         [ 4] 4107 	CALL     PICK
      009709 00 81 CD         [ 4] 4108         CALL     DOT     ;index stack, display contents
      00970C 94 99 CD         [ 4] 4109 DOTS2:  CALL     DONXT
      00970F 93 AE                 4110         .word      DOTS1   ;loop till done
      009711 CD 96 F6         [ 4] 4111         CALL     DOTQP
      009714 CD                    4112         .byte      5
      009715 A0 2D CD 87 0D        4113         .ascii     " <sp "
      00971A CD               [ 4] 4114         RET
                                   4115 
                                   4116 ;       >NAME   ( ca -- na | F )
                                   4117 ;       Convert code address
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                   4118 ;       to a name address.
      00971B 84 67                 4119         .word      LINK
                           0018E1  4120 LINK = . 
      00971D 98                    4121         .byte      5
      00971E 4D CD A0 B5 81        4122         .ascii     ">NAME"
      0018E7                       4123 TNAME:
      009723 97 04 C2         [ 4] 4124         CALL     CNTXT   ;vocabulary link
      009726 49 3B 3C         [ 4] 4125 TNAM2:  CALL     AT
      009728 CD 04 E3         [ 4] 4126         CALL     DUPP    ;?last word in a vocabulary
      009728 1D 00 02         [ 4] 4127         CALL     QBRAN
      00972B 90 AE                 4128         .word      TNAM4
      00972D 00 80 FF         [ 4] 4129         CALL     DDUP
      009730 CD 94 99         [ 4] 4130         CALL     NAMET
      009733 CD 93 AE         [ 4] 4131         CALL     XORR    ;compare
      009736 CD A0 F4         [ 4] 4132         CALL     QBRAN
      009739 CD 87                 4133         .word      TNAM3
      00973B 0D CD 84         [ 4] 4134         CALL     CELLM   ;continue with next word
      00973E 67 98            [ 2] 4135         JRA     TNAM2
      009740 4D CD 86         [ 4] 4136 TNAM3:  CALL     SWAPP
      009743 BF CD 84         [ 2] 4137         JP     DROP
      009746 BC CD 85         [ 4] 4138 TNAM4:  CALL     DDROP
      009749 73 CD 86         [ 2] 4139         JP     ZERO
                                   4140 
                                   4141 ;       .ID     ( na -- )
                                   4142 ;        Display  name at address.
      00974C BF CD                 4143         .word      LINK
                           001916  4144 LINK = . 
      00974E 84                    4145         .byte      3
      00974F A5 CD 9B              4146         .ascii     ".ID"
      00191A                       4147 DOTID:
      009752 D8 CD 9B         [ 4] 4148         CALL     QDUP    ;if zero no name
      009755 99 CD 85         [ 4] 4149         CALL     QBRAN
      009758 59 CD                 4150         .word      DOTI1
      00975A 84 BC CD         [ 4] 4151         CALL     COUNT
      00975D 86 B1 CD         [ 4] 4152         CALL     DOLIT
      009760 84 A5                 4153         .word      0x1F
      009762 CC 8A C4         [ 4] 4154         CALL     ANDD    ;mask lexicon bits
      009765 81 97 25         [ 2] 4155         JP     UTYPE
      009768 01 5D E9         [ 4] 4156 DOTI1:  CALL     DOTQP
      00976A 09                    4157         .byte      9
      00976A CD 84 34 96 C2 CD 86  4158         .ascii     " noName"
      009771 81               [ 4] 4159         RET
                                   4160 
                           000000  4161 WANT_SEE=0
                           000000  4162 .if WANT_SEE 
                                   4163 ;       SEE     ( -- ; <string> )
                                   4164 ;       A simple decompiler.
                                   4165 ;       Updated for byte machines.
                                   4166         .word      LINK
                                   4167 LINK = . 
                                   4168         .byte      3
                                   4169         .ascii     "SEE"
                                   4170 SEE:
                                   4171         CALL     TICK    ;starting address
                                   4172         CALL     CR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4173         CALL     ONEM
                                   4174 SEE1:   CALL     ONEP
                                   4175         CALL     DUPP
                                   4176         CALL     AT
                                   4177         CALL     DUPP
                                   4178         CALL     QBRAN
                                   4179         .word    SEE2
                                   4180         CALL     TNAME   ;?is it a name
                                   4181 SEE2:   CALL     QDUP    ;name address or zero
                                   4182         CALL     QBRAN
                                   4183         .word    SEE3
                                   4184         CALL     SPACE
                                   4185         CALL     DOTID   ;display name
                                   4186         CALL     ONEP
                                   4187         JRA      SEE4
                                   4188 SEE3:   CALL     DUPP
                                   4189         CALL     CAT
                                   4190         CALL     UDOT    ;display number
                                   4191 SEE4:   CALL     NUFQ    ;user control
                                   4192         CALL     QBRAN
                                   4193         .word    SEE1
                                   4194         JP     DROP
                                   4195 .endif ; WANT_SEE 
                                   4196 
                                   4197 ;       WORDS   ( -- )
                                   4198 ;       Display names in vocabulary.
      009772 CC 84                 4199         .word      LINK
                           00193E  4200 LINK = . 
      009774 A5                    4201         .byte      5
      009775 97 68 05 43 41        4202         .ascii     "WORDS"
      001944                       4203 WORDS:
      00977A 4C 4C 2C         [ 4] 4204         CALL     CR
      00977D CD 06 23         [ 4] 4205         CALL     CNTXT   ;only in context
      00977D CD 84 34         [ 4] 4206 WORS1:  CALL     AT
      009780 00 CD CD         [ 4] 4207         CALL     QDUP    ;?at end of list
      009783 94 99 CC         [ 4] 4208         CALL     QBRAN
      009786 94 82                 4209         .word      WORS2
      009788 97 77 08         [ 4] 4210         CALL     DUPP
      00978B 49 4E 49         [ 4] 4211         CALL     SPACE
      00978E 54 2D 4F         [ 4] 4212         CALL     DOTID   ;display a name
      009791 46 53 BC         [ 4] 4213         CALL     CELLM
      009793 CD 03 FE         [ 4] 4214         CALL     BRAN
      009793 CD 86                 4215         .word      WORS1
      009795 70               [ 4] 4216 WORS2:  RET
                                   4217 
                                   4218         
                                   4219 ;; Hardware reset
                                   4220 
                                   4221 ;       hi      ( -- )
                                   4222 ;       Display sign-on message.
      009796 CD 84                 4223         .word      LINK
                           001969  4224 LINK = . 
      009798 BC                    4225         .byte      2
      009799 CD 85                 4226         .ascii     "hi"
      00196C                       4227 HI:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      00979B 63 CD 84         [ 4] 4228         CALL     CR
      00979E 67 97 B0         [ 4] 4229         CALL     DOTQP   ;initialize I/O
      0097A1 CD                    4230         .byte      15
      0097A2 85 59 CD 86 BF CD 84  4231         .ascii     "stm8eForth v"
             BC CD 8B B2 CD
      0097AE 87                    4232 	.byte      VER+'0'
      0097AF D7                    4233         .byte      '.' 
      0097B0 CD                    4234 	.byte      EXT+'0' ;version
      0097B1 86 F4 CC         [ 2] 4235         JP     CR
                                   4236 
                           000000  4237 WANT_DEBUG=0
                           000000  4238 .if WANT_DEBUG 
                                   4239 ;       DEBUG      ( -- )
                                   4240 ;       Display sign-on message.
                                   4241 ;        .word      LINK
                                   4242 LINK = . 
                                   4243         .byte      5
                                   4244         .ascii     "DEBUG"
                                   4245 DEBUG:
                                   4246 	CALL DOLIT
                                   4247 	.word 0x65
                                   4248 	CALL EMIT
                                   4249 	CALL DOLIT
                                   4250 	.word 0
                                   4251  	CALL ZLESS 
                                   4252 	CALL DOLIT
                                   4253 	.word 0xFFFE
                                   4254 	CALL ZLESS 
                                   4255 	CALL UPLUS 
                                   4256  	CALL DROP 
                                   4257 	CALL DOLIT
                                   4258 	.word 3
                                   4259 	CALL UPLUS 
                                   4260 	CALL UPLUS 
                                   4261  	CALL DROP
                                   4262 	CALL DOLIT
                                   4263 	.word 0x43
                                   4264 	CALL UPLUS 
                                   4265  	CALL DROP
                                   4266 	CALL EMIT
                                   4267 	CALL DOLIT
                                   4268 	.word 0x4F
                                   4269 	CALL DOLIT
                                   4270 	.word 0x6F
                                   4271  	CALL XORR
                                   4272 	CALL DOLIT
                                   4273 	.word 0xF0
                                   4274  	CALL ANDD
                                   4275 	CALL DOLIT
                                   4276 	.word 0x4F
                                   4277  	CALL ORR
                                   4278 	CALL EMIT
                                   4279 	CALL DOLIT
                                   4280 	.word 8
                                   4281 	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4282 	.word 6
                                   4283  	CALL SWAPP
                                   4284 	CALL OVER
                                   4285 	CALL XORR
                                   4286 	CALL DOLIT
                                   4287 	.word 3
                                   4288 	CALL ANDD 
                                   4289 	CALL ANDD
                                   4290 	CALL DOLIT
                                   4291 	.word 0x70
                                   4292 	CALL UPLUS 
                                   4293 	CALL DROP
                                   4294 	CALL EMIT
                                   4295 	CALL DOLIT
                                   4296 	.word 0
                                   4297 	CALL QBRAN
                                   4298 	.word DEBUG1
                                   4299 	CALL DOLIT
                                   4300 	.word 0x3F
                                   4301 DEBUG1:
                                   4302 	CALL DOLIT
                                   4303 	.word 0xFFFF
                                   4304 	CALL QBRAN
                                   4305 	.word DEBUG2
                                   4306 	CALL DOLIT
                                   4307 	.word 0x74
                                   4308 	CALL BRAN
                                   4309 	.word DEBUG3
                                   4310 DEBUG2:
                                   4311 	CALL DOLIT
                                   4312 	.word 0x21
                                   4313 DEBUG3:
                                   4314 	CALL EMIT
                                   4315 	CALL DOLIT
                                   4316 	.word 0x68
                                   4317 	CALL DOLIT
                                   4318 	.word 0x80
                                   4319 	CALL STORE
                                   4320 	CALL DOLIT
                                   4321 	.word 0x80
                                   4322 	CALL AT
                                   4323 	CALL EMIT
                                   4324 	CALL DOLIT
                                   4325 	.word 0x4D
                                   4326 	CALL TOR
                                   4327 	CALL RAT
                                   4328 	CALL RFROM
                                   4329 	CALL ANDD
                                   4330 	CALL EMIT
                                   4331 	CALL DOLIT
                                   4332 	.word 0x61
                                   4333 	CALL DOLIT
                                   4334 	.word 0xA
                                   4335 	CALL TOR
                                   4336 DEBUG4:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4337 	CALL DOLIT
                                   4338 	.word 1
                                   4339 	CALL UPLUS 
                                   4340 	CALL DROP
                                   4341 	CALL DONXT
                                   4342 	.word DEBUG4
                                   4343 	CALL EMIT
                                   4344 	CALL DOLIT
                                   4345 	.word 0x656D
                                   4346 	CALL DOLIT
                                   4347 	.word 0x100
                                   4348 	CALL UMSTA
                                   4349 	CALL SWAPP
                                   4350 	CALL DOLIT
                                   4351 	.word 0x100
                                   4352 	CALL UMSTA
                                   4353 	CALL SWAPP 
                                   4354 	CALL DROP
                                   4355 	CALL EMIT
                                   4356 	CALL EMIT
                                   4357 	CALL DOLIT
                                   4358 	.word 0x2043
                                   4359 	CALL DOLIT
                                   4360 	.word 0
                                   4361 	CALL DOLIT
                                   4362 	.word 0x100
                                   4363 	CALL UMMOD
                                   4364 	CALL EMIT
                                   4365 	CALL EMIT
                                   4366 	;JP ORIG
                                   4367 	RET
                                   4368 .endif ; WANT_DEBUG 
                                   4369 
                                   4370 
                                   4371 ;       'BOOT   ( -- a )
                                   4372 ;       The application startup vector.
      0097B4 84 A5                 4373         .word      LINK
                           001987  4374 LINK = . 
      0097B6 97                    4375         .byte      5
      0097B7 8A 01 3A 4F 54        4376         .ascii     "'BOOT"
      0097BA                       4377 TBOOT:
      0097BA CD 97 93         [ 4] 4378         CALL     DOVAR
      0097BD CD 91                 4379         .word    APP_RUN      ;application to boot
                                   4380 
                                   4381 ;       COLD    ( -- )
                                   4382 ;       The hilevel cold start s=ence.
      0097BF 3C CD                 4383         .word      LINK
                           001994  4384         LINK = . 
      0097C1 96                    4385         .byte      4
      0097C2 75 CC 97 6A           4386         .ascii     "COLD"
      001999                       4387 COLD:
                           000000  4388 .if WANT_DEBUG
                                   4389         CALL DEBUG
                                   4390 .endif ; WANT_DEBUG
      0097C6 97 B8 02         [ 4] 4391 COLD1:  CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0097C9 49 3A                 4392         .word      UZERO
      0097CB CD 03 B4         [ 4] 4393 	CALL     DOLIT
      0097CB CD 97                 4394         .word      UPP
      0097CD 93 CC 97         [ 4] 4395         CALL     DOLIT
      0097D0 6A 97                 4396 	.word      UEND-UZERO
      0097D2 C8 09 49         [ 4] 4397         CALL     CMOVE   ;initialize user area
                                   4398 
                                   4399 ; if APP_RUN==0 initialize with ca de 'hi'  
      0097D5 4D 4D 45 44      [ 2] 4400         ldw y,APP_RUN 
      0097D9 49 41            [ 1] 4401         jrne 0$
      0097DB 54 45 02         [ 2] 4402         subw x,#CELLL 
      0097DD 90 AE 19 6C      [ 2] 4403         ldw y,#HI  
      0097DD CD               [ 2] 4404         ldw (x),y
      0097DE 84 34 80         [ 4] 4405         call UPDATRUN 
      0019BC                       4406 0$:        
                                   4407 ; update LAST with APP_LAST 
                                   4408 ; if APP_LAST > LAST else do the opposite
      0097E1 00 CD 86 CF      [ 2] 4409         ldw y,APP_LAST 
      0097E5 CD 84 BC         [ 2] 4410         cpw y,ULAST 
      0097E8 CD 84            [ 1] 4411         jrugt 1$ 
                                   4412 ; save LAST at APP_LAST  
      0097EA BC CD 85         [ 4] 4413         call UPDATLAST 
      0097ED C3 CD            [ 2] 4414         jra 2$
      0019CA                       4415 1$: ; update LAST with APP_LAST 
      0097EF 86 CF CD         [ 2] 4416         ldw ULAST,y
      0097F2 84 BC CC         [ 2] 4417         ldw UCNTXT,y
      0019D0                       4418 2$:  
                                   4419 ; update APP_CP if < app_space 
      0097F5 84 A5 97 D3      [ 2] 4420         ldw y,APP_CP  
      0097F9 06 43 52         [ 2] 4421         cpw y,UCP   
      0097FC 45 41            [ 1] 4422         jruge 3$ 
      0097FE 54 45 58         [ 4] 4423         call UPDATCP
      009800 90 BE 18         [ 2] 4424         ldw y,UCP   
      0019DF                       4425 3$:
      009800 CD 91 3C         [ 2] 4426         ldw UCP,y                 
                                   4427 ; update UVP with APP_VP  
                                   4428 ; if APP_VP>UVP else do the opposite 
      009803 CD 96 75 CD      [ 2] 4429         ldw y,APP_VP 
      009807 96 F6 CD         [ 2] 4430         cpw y,UVP 
      00980A 94 C7            [ 1] 4431         jrugt 4$
      00980C 86 10 81         [ 4] 4432         call UPDATVP 
      00980F 97 F9            [ 2] 4433         jra 6$
      0019F0                       4434 4$: ; update UVP with APP_VP 
      009811 08 56 41         [ 2] 4435         ldw UVP,y 
      0019F3                       4436 6$:      
      009814 52 49 41         [ 4] 4437         CALL     PRESE   ;initialize data stack and TIB
      009817 42 4C 45         [ 4] 4438         CALL     TBOOT
      00981A CD 0B 68         [ 4] 4439         CALL     ATEXE   ;application boot
      00981A CD 8B B2         [ 4] 4440         CALL     OVERT
      00981D CD 85 63         [ 2] 4441         JP     QUIT    ;start interpretation
                                   4442 
                           000001  4443 WANT_MATH_CONST = 1 
                           000001  4444 .if WANT_MATH_CONST 
                                   4445         ; irrational constants 
                                   4446         ; approximation by integers ratio.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4447         .include "../const_ratio.asm"
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
      009820 CD 8A                   31         .word LINK 
                           001A04    32         LINK=.
      009822 2D                      33         .byte 2
      009823 CD 86                   34         .ascii "PI" 
      001A07                         35 PII:
      009825 B1 CD 84         [ 2]   36         subw x,#2*CELLL 
      009828 A5 CD 98 00      [ 2]   37         ldw y,#355 
      00982C CD 85            [ 2]   38         ldw (2,x),y 
      00982E 63 CD 94 82      [ 2]   39         ldw y,#113 
      009832 CD               [ 2]   40         ldw (x),y 
      009833 8A               [ 4]   41         ret 
                                     42 
                                     43 ;      SQRT2 ( -- 19601  13860 )
                                     44 ; precision: 1.5e-9 
                                     45 ; usage example to compute Voltage peek to peek from Vrms 
                                     46 ; : VPP SQRT2 */ 2 * ;
                                     47 ;
      009834 C4 CD                   48         .word LINK 
                           001A18    49         LINK=.
      009836 85                      50         .byte 5 
      009837 73 CD 84 A5 CD          51         .ascii "SQRT2" 
      001A1E                         52 SQRT2:
      00983C A0 2D CD         [ 2]   53         subw x,#2*CELLL 
      00983F 87 0D CD 84      [ 2]   54         ldw y,#19601 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009843 67 98            [ 2]   55         ldw (2,x),y 
      009845 4D CD 9B EF      [ 2]   56         ldw y,#13860 
      009849 CD               [ 2]   57         ldw (x),y 
      00984A A0               [ 4]   58         ret 
                                     59 
                                     60 ;   SQRT3 ( -- 18817 10864 )
                                     61 ; precision: 1.1e-9
                                     62 ;
      00984B B5 81                   63         .word LINK 
                           001A2F    64         LINK=.
      00984D 05                      65         .byte 5
      00984D CD 86 CF CD 84          66         .ascii "SQRT3" 
      001A35                         67 SQRT3: 
      009852 BC CD 86         [ 2]   68     subw x,#2*CELLL 
      009855 E2 CC 84 A5      [ 2]   69     ldw y,#18817 
      009859 98 11            [ 2]   70     ldw (2,x),y 
      00985B 08 43 4F 4E      [ 2]   71     ldw y,#10864 
      00985F 53               [ 2]   72     ldw (x),y 
      009860 54               [ 4]   73     ret 
                                     74 
                                     75 ;   E ( -- 28667 10546 )
                                     76 ; precision: 5.5e-9 
                                     77 ; natural log base 
      009861 41 4E                   78         .word LINK 
                           001A46    79         LINK=.
      009863 54                      80         .byte 1
      009864 45                      81         .ascii "E" 
      001A48                         82 ENEPER:
      009864 CD 91 3C         [ 2]   83     subw x,#2*CELLL 
      009867 CD 96 75 CD      [ 2]   84     ldw y,#28667 
      00986B 96 F6            [ 2]   85     ldw (2,x),y 
      00986D CD 94 C7 98      [ 2]   86     ldw y,#10546 
      009871 8E               [ 2]   87     ldw (x),y 
      009872 CD               [ 4]   88     ret 
                                     89 
                                     90 ;   SQRT10 ( -- 22936 7253 )
                                     91 ; precision: 5.7e-9 
      009873 94 82                   92         .word LINK 
                           001A59    93         LINK=.
      009875 CD                      94         .byte 6 
      009876 A0 2D CD 87 0D CD       95         .ascii "SQRT10" 
      001A60                         96 SQRT10:
      00987C 84 67 98         [ 2]   97     subw x,#2*CELLL
      00987F 4D CD A0 B5      [ 2]   98     ldw y,#22936 
      009883 81 98            [ 2]   99     ldw (2,x),y 
      009885 5B 07 44 4F      [ 2]  100     ldw y,#7253
      009889 43               [ 2]  101     ldw (x),y 
      00988A 4F               [ 4]  102     ret 
                                    103 
                                    104 ;   12RT2 ( -- 26797 25293 )
                                    105 ; precision: 1.0e-9 
                                    106 ; used in music to compute well tempered scale
      00988B 4E 53                  107         .word LINK 
                           001A71   108         LINK=. 
      00988D 54                     109         .byte 5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      00988E 31 32 52 54 32         110         .ascii "12RT2"
      001A77                        111 RT12_2:
      00988E 1D 00 02         [ 2]  112     subw x,#2*CELLL 
      009891 90 85 90 FE      [ 2]  113     ldw y,#26797
      009895 FF 81            [ 2]  114     ldw (2,x),y 
      009897 98 86 05 5F      [ 2]  115     ldw y,#25293
      00989B 54               [ 2]  116     ldw (x),y 
      00989C 59               [ 4]  117     ret 
                                    118 
                                    119 ;   LOG2s ( -- 2040 11103 )
                                    120 ; log(2)/1.6384
                                    121 ; precision: 1.1e-8
      00989D 50 45                  122         .word LINK 
                           001A88   123         LINK=.
      00989F 05                     124         .byte 5 
      00989F CD 85 2C 20 0F         125         .ascii "LOG2S" 
      001A8E                        126 LOG2S:
      0098A4 CD 85 63         [ 2]  127     subw x,#2*CELLL
      0098A7 CD 84 DA CD      [ 2]  128     ldw y,#2040 
      0098AB 8A EE            [ 2]  129     ldw (2,x),y 
      0098AD CD 84 1E CD      [ 2]  130     ldw y,#11103 
      0098B1 8A               [ 2]  131     ldw (x),y 
      0098B2 58               [ 4]  132     ret 
                                    133 
                                    134 ;   LN2 ( -- 485 11464 )
                                    135 ; ln(2)/16.384 
                                    136 ; precision: 1.0e-7 
      0098B3 CD 84                  137         .word LINK 
                           001A9F   138         LINK=.
      0098B5 48                     139         .byte 4 
      0098B6 98 A4 CC 85            140         .ascii "LN2S" 
      001AA4                        141 LN2S: 
      0098BA 59 98 99         [ 2]  142     subw x,#2*CELLL
      0098BD 03 64 6D 2B      [ 2]  143     ldw y,#485
      0098C1 EF 02            [ 2]  144     ldw (2,x),y 
      0098C1 CD 85 8D CD      [ 2]  145     ldw y,#11464 
      0098C5 84               [ 2]  146     ldw (x),y 
      0098C6 34               [ 4]  147     ret 
                                    148 
                                    149 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4448 .endif ; WANT_MATH_CONST
                                   4449 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4450         .include "flash_disco.asm"
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
      0098C7 00 04                   30     .word LINK 
                           001AB5    31     LINK=.
      0098C9 CD                      32     .byte 4 
      0098CA 8F 92 CD 8E             33     .ascii "PTR!"
      001ABA                         34 PSTO:
      0098CE E2 CD            [ 1]   35     ldw y,x
      0098D0 85 2C            [ 2]   36     ldw y,(y)
      0098D2 20 11 CD         [ 2]   37     ldw PTR16,y  
      0098D5 85 63 CD         [ 2]   38     addw x,#CELLL 
      0098D8 84               [ 4]   39     ret 
                                     40 
                                     41 ;-----------------------------------
                                     42 ; return EEPROM base address 
                                     43 ;  EEPROM  ( -- a )
                                     44 ;-----------------------------------
      0098D9 DA CD                   45     .word LINK 
                           001AC7    46 LINK=.
      0098DB 84                      47     .byte 6 
      0098DC 34 00 03 CD 8F 92       48     .ascii "EEPROM"
      001ACE                         49 EEPROM: 
      0098E2 CD 8A 58 CD      [ 2]   50     ldw y,#EEPROM_BASE
      0098E6 84 48 98         [ 2]   51     subw x,#CELLL 
      0098E9 D4               [ 2]   52     ldw (x),y 
      0098EA 81               [ 4]   53     ret
                                     54 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                     55 ;---------------------------------
                                     56 ; return APP_LAST address 
                                     57 ; EEP-LAST ( -- a )
                                     58 ;---------------------------------
      0098EB 98 BD                   59 	.word LINK 
                           001AD9    60 	LINK=.
      0098ED 04                      61 	.byte 8 
      0098EE 44 55 4D 50 4C 41 53    62 	.ascii "EEP-LAST"
             54
      0098F2                         63 EEPLAST:
      0098F2 CD 86 20         [ 2]   64 	subw x,#CELLL 
      0098F5 CD 84 BC CD      [ 2]   65 	ldw y,#APP_LAST 
      0098F9 85               [ 2]   66 	ldw (x),y 
      0098FA 2C               [ 4]   67 	ret 
                                     68 
                                     69 ;----------------------------------
                                     70 ; return APP_RUN address 	
                                     71 ; EEP-RUN ( -- a )
                                     72 ;-----------------------------------
      0098FB CD 8D                   73 	.word LINK 
                           001AED    74 	LINK=.
      0098FD 6A                      75 	.byte 7
      0098FE CD 84 34 00 10 CD 89    76 	.ascii "EEP-RUN"
      001AF5                         77 EEPRUN:
      009905 7E CD 85         [ 2]   78 	subw x,#CELLL 
      009908 2C CD 8F 2A      [ 2]   79 	ldw y,#APP_RUN 
      00990C CD               [ 2]   80 	ldw (x),y 
      00990D 84               [ 4]   81 	ret 
                                     82 
                                     83 ;------------------------------------
                                     84 ; return APP_CP address  
                                     85 ; EEP-CP ( -- a )
                                     86 ;------------------------------------
      00990E 34 00                   87 	.word LINK
                           001B00    88 	LINK=.
      009910 10                      89 	.byte 6 
      009911 CD 87 49 CD 98 C1       90 	.ascii "EEP-CP"
      001B07                         91 EEPCP:
      009917 CD 87 1E         [ 2]   92 	subw x,#CELLL 
      00991A CD 87 1E CD      [ 2]   93 	ldw y,#APP_CP  
      00991E 8E               [ 2]   94 	ldw (x),y 
      00991F E2               [ 4]   95 	ret 
                                     96 
                                     97 ;------------------------------------
                                     98 ; return APP_VP address 
                                     99 ; EEP-VP ( -- a )
                                    100 ;-------------------------------------
      009920 CD 8E                  101 	.word LINK
                           001B12   102 	LINK=.
      009922 E2                     103 	.byte 6
      009923 CD 98 9F CD 84 48      104 	.ascii "EEP-VP"
      001B19                        105 EEPVP:
      009929 99 09 CD         [ 2]  106 	subw x,#CELLL 
      00992C 85 59 CD 85      [ 2]  107 	ldw y,#APP_VP  
      009930 0D               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009931 CD               [ 4]  109 	ret 
                                    110 
                                    111 ;----------------------------------
                                    112 ; update APP_LAST with LAST 
                                    113 ; UPDAT-LAST ( -- )
                                    114 ;----------------------------------
      009932 86 20                  115 	.word LINK 
                           001B24   116 	LINK=.
      009934 CC                     117 	.byte 10
      009935 84 A5 98 ED 02 2E 53   118 	.ascii "UPDAT-LAST"
             41 53 54
      00993C                        119 UPDATLAST:
      00993C CD 8F 2A         [ 4]  120 	call LAST
      00993F CD 8B 06         [ 4]  121 	call AT  
      009942 CD 85 2C         [ 4]  122 	call EEPLAST
      009945 20 09 CD         [ 2]  123 	jp EE_STORE 
                                    124 
                                    125 ;---------------------------------
                                    126 ; update APP_RUN 
                                    127 ; UPDAT-RUN ( a -- )
                                    128 ;---------------------------------
      009948 85 20                  129 	.word LINK
                           001B3D   130 	LINK=.
      00994A CD                     131 	.byte 9
      00994B 8B 1D CD 8F C5 CD 84   132 	.ascii "UPDAT-RUN"
             48 99
      001B47                        133 UPDATRUN:
      009954 47 CD 8F         [ 4]  134 	call EEPRUN
      009957 69 05 20         [ 2]  135 	jp EE_STORE 
                                    136 	
                                    137 ;---------------------------------
                                    138 ; update APP_CP with CP 
                                    139 ; UPDAT-CP ( -- )
                                    140 ;---------------------------------
      00995A 3C 73                  141 	.word LINK 
                           001B4F   142 	LINK=.
      00995C 70                     143 	.byte 8 
      00995D 20 81 99 39 05 3E 4E   144 	.ascii "UPDAT-CP"
             41
      001B58                        145 UPDATCP:
      009965 4D 45 3F         [ 4]  146 	call CPP 
      009967 CD 04 3C         [ 4]  147 	call AT 
      009967 CD 86 A3         [ 4]  148 	call EEPCP 
      00996A CD 84 BC         [ 2]  149 	jp EE_STORE 
                                    150 
                                    151 ;----------------------------------
                                    152 ; update APP_VP with VP 
                                    153 ; UPDAT-VP ( -- )
                                    154 ;----------------------------------
      00996D CD 85                  155 	.word LINK
                           001B66   156 	LINK=.
      00996F 63                     157 	.byte 8 
      009970 CD 84 67 99 8E CD 87   158 	.ascii "UPDAT-VP" 
             49
      001B6F                        159 UPDATVP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009978 CD 91 4A         [ 4]  160 	call VPP 
      00997B CD 85 D8         [ 4]  161 	call AT
      00997E CD 84 67         [ 4]  162 	call EEPVP 
      009981 99 88 CD         [ 2]  163 	jp EE_STORE
                                    164 	
                                    165 
                                    166 ;----------------------------------
                                    167 ; unlock EEPROM/OPT for writing/erasing
                                    168 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    169 ;  UNLKEE   ( -- )
                                    170 ;----------------------------------
      009984 8A 3C                  171     .word LINK 
                           001B7D   172 LINK=.
      009986 20                     173     .byte 6 
      009987 E2 CD 85 73 CC 85      174     .ascii "UNLKEE"
      001B84                        175 unlock_eeprom:
      00998D 59 CD 87 3E      [ 1]  176 	mov FLASH_CR2,#0 
      009991 CC 8A C4 99      [ 1]  177 	mov FLASH_NCR2,#0xFF 
      009995 61 03 2E 49      [ 1]  178 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009999 44 56 50 64      [ 1]  179     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00999A 72 07 50 5F FB   [ 2]  180 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      00999A CD               [ 4]  181 	ret
                                    182 
                                    183 ;----------------------------------
                                    184 ; unlock FLASH for writing/erasing
                                    185 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    186 ; UNLKFL  ( -- )
                                    187 ;----------------------------------
      00999B 87 0D                  188     .word LINK 
                           001B9C   189 LINK=. 
      00999D CD                     190     .byte 6 
      00999E 84 67 99 B0 CD 8B      191     .ascii "UNLKFL"    
      001BA3                        192 unlock_flash:
      0099A4 9B CD 84 34      [ 1]  193 	mov FLASH_CR2,#0 
      0099A8 00 1F CD 85      [ 1]  194 	mov FLASH_NCR2,#0xFF 
      0099AC AF CC 98 9F      [ 1]  195 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      0099B0 CD 8F 69 09      [ 1]  196 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      0099B4 20 6E 6F 4E 61   [ 2]  197 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      0099B9 6D               [ 4]  198 	ret
                                    199 
                                    200 ;-----------------------------
                                    201 ; unlock FLASH or EEPROM 
                                    202 ; according to PTR16 address 
                                    203 ;  UNLOCK ( -- )
                                    204 ;-----------------------------
      0099BA 65 81                  205 	.word LINK 
                           001BBB   206 	LINK=.
      0099BC 99                     207 	.byte 6
      0099BD 96 05 57 4F 52 44      208 	.ascii "UNLOCK"
      001BC2                        209 unlock:
                                    210 ; put addr[15:0] in Y, for bounds check.
      0099C3 53 BE 32         [ 2]  211 	ldw y,PTR16   ; Y=addr15:0
      0099C4 90 A3 80 00      [ 2]  212     cpw y,#FLASH_BASE
      0099C4 CD 8F            [ 1]  213     jruge 4$
      0099C6 2A CD 86 A3      [ 2]  214 	cpw y,#EEPROM_BASE  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      0099CA CD 84            [ 1]  215     jrult 9$
      0099CC BC CD 87 0D      [ 2]  216 	cpw y,#OPTION_END 
      0099D0 CD 84            [ 1]  217 	jrugt 9$
      0099D2 67 99 E6         [ 4]  218 	call unlock_eeprom
      0099D5 CD               [ 4]  219 	ret 
      0099D6 85 63 CD         [ 4]  220 4$: call unlock_flash
      0099D9 8E               [ 4]  221 9$: ret 
                                    222 
                                    223 ;-------------------------
                                    224 ; lock write access to 
                                    225 ; FLASH and EEPROM 
                                    226 ; LOCK ( -- )
                                    227 ;-------------------------
      0099DA E2 CD                  228 	.word LINK 
                           001BE1   229 	LINK=.
      0099DC 99                     230 	.byte 4 
      0099DD 9A CD 8A 3C            231 	.ascii "LOCK" 
      001BE6                        232 lock: 
      0099E1 CD 84 7E 99      [ 1]  233 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0099E5 CA 81 99 BE      [ 1]  234 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      0099E9 02               [ 4]  235 	ret 
                                    236 
                                    237 ;-------------------------
                                    238 ; increment PTR16 
                                    239 ; INC-PTR16 ( -- )
                                    240 ;-------------------------
      0099EA 68 69                  241 	.word LINK 
                           001BF1   242 	LINK=. 
      0099EC 08                     243 	.byte 8 
      0099EC CD 8F 2A CD 8F 69 0F   244 	.ascii "INC-PTR16" 
             73 74
      001BFB                        245 INC_PTR16:
      0099F5 6D 38            [ 2]  246 	pushw y 
      0099F7 65 46 6F         [ 2]  247 	ldw y,PTR16 
      0099FA 72 74            [ 2]  248 	incw y 
      0099FC 68 20 76         [ 2]  249 	ldw PTR16,y
      0099FF 33 2E            [ 2]  250 	popw y 
      009A01 30               [ 4]  251 	ret 
                                    252 
                                    253 
                                    254 ;----------------------------
                                    255 ; write a byte at address pointed 
                                    256 ; by PTR16 and increment PTR16.
                                    257 ; Expect pointer already initialized 
                                    258 ; and memory unlocked 
                                    259 ; WR-BYTE ( c -- )
                                    260 ;----------------------------
      009A02 CC 8F                  261 	.word LINK 
                           001C0A   262 	LINK=. 
      009A04 2A                     263 	.byte 7 
      009A05 99 E9 05 27 42 4F 4F   264 	.ascii "WR-BYTE" 
                                    265 
      001C12                        266 WR_BYTE:
      009A0C 54 93            [ 1]  267 	ldw y,x 
      009A0D 90 FE            [ 2]  268 	ldw y,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009A0D CD 86 10         [ 2]  269 	addw x,#CELLL 
      009A10 40 02            [ 1]  270 	ld a,yl
      009A12 9A 07 04         [ 4]  271 	ld [PTR16],a
      009A15 43 4F 4C 44 FB   [ 2]  272 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009A19 20 D6            [ 2]  273 	jra INC_PTR16 
                                    274 
                                    275 ;---------------------------------------
                                    276 ; write a word at address pointed 
                                    277 ; by PTR16 and incrment PTR16 
                                    278 ; Expect pointer already initialized 
                                    279 ; WR-WORD ( w -- )
                                    280 ;---------------------------------------
      009A19 CD 84                  281 	.word LINK 
                           001C27   282 	LINK=.
      009A1B 34                     283 	.byte 7
      009A1C 80 AF CD 84 34 00 06   284 	.ascii "WR-WORD"
      001C2F                        285 WR_WORD:
      009A23 CD 84            [ 1]  286 	ldw y,x 
      009A25 34 00            [ 2]  287 	ldw y,(y)
      009A27 1A CD            [ 2]  288 	pushw y 
      009A29 8B FF            [ 1]  289 	swapw y 
      009A2B 90               [ 2]  290 	ldw (x),y 
      009A2C CE 40 02         [ 4]  291 	call WR_BYTE 
      009A2F 26 0B            [ 2]  292 	popw y 
      009A31 1D 00 02         [ 2]  293 	subw x,#CELLL
      009A34 90               [ 2]  294 	ldw (x),y 
      009A35 AE 99 EC         [ 4]  295 	call WR_BYTE
      009A38 FF CD 9B         [ 2]  296 	jp lock 
                                    297 
                                    298 
                                    299 ;---------------------------------------
                                    300 ; write a byte to FLASH or EEPROM/OPTION  
                                    301 ; EEC!  (c a -- )
                                    302 ;---------------------------------------
      009A3B C7 27                  303     .word LINK 
                           001C49   304 	LINK=.
      009A3C 04                     305     .byte 4 
      009A3C 90 CE 40 00            306     .ascii "EEC!"
                                    307 	; local variables 
                           000001   308 	BTW = 1   ; byte to write offset on stack
                           000002   309     OPT = 2 
                           000002   310 	VSIZE = 2
      001C4E                        311 EE_CSTORE:
      009A40 90 B3            [ 2]  312 	sub sp,#VSIZE
      009A42 1A 22 05         [ 4]  313     call PSTO
      009A45 CD 9B            [ 1]  314 	ld a,(1,x)
      009A47 AF               [ 1]  315 	cpl a 
      009A48 20 06            [ 1]  316 	ld (BTW,sp),a ; byte to write 
      009A4A 0F 02            [ 1]  317 	clr (OPT,sp)  ; OPTION flag
      009A4A 90 BF 1A         [ 4]  318 	call unlock 
                                    319 	; check if option
      009A4D 90 BF 14         [ 2]  320 	ldw y,PTR16 
      009A50 90 A3 48 00      [ 2]  321 	cpw y,#OPTION_BASE
      009A50 90 CE            [ 1]  322 	jrmi 2$
      009A52 40 04 90 B3      [ 2]  323 	cpw y,#OPTION_END+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009A56 18 24            [ 1]  324 	jrpl 2$
      009A58 06 CD            [ 1]  325 	cpl (OPT,sp)
                                    326 	; OPTION WRITE require this unlock 
      009A5A 9B D8 90 BE      [ 1]  327     bset FLASH_CR2,#FLASH_CR2_OPT
      009A5E 18 1F 50 5C      [ 1]  328     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009A5F                        329 2$: 
      009A5F 90 BF 18         [ 4]  330 	call WR_BYTE 	
      009A62 90 CE            [ 1]  331 	tnz (OPT,sp)
      009A64 40 06            [ 1]  332 	jreq 3$ 
      009A66 90 B3            [ 1]  333     ld a,(BTW,sp)
      009A68 16 22            [ 1]  334     clrw y
      009A6A 05 CD            [ 1]  335 	ld yl,a 
      009A6C 9B EF 20         [ 2]  336 	subw x,#CELLL 
      009A6F 03               [ 2]  337 	ldw (x),y 
      009A70 CD 1C 12         [ 4]  338 	call WR_BYTE
      001C8A                        339 3$: 
      009A70 90 BF 16         [ 4]  340 	call lock 
      009A73 5B 02            [ 2]  341 	addw sp,#VSIZE 
      009A73 CD               [ 4]  342     ret
                                    343 
                                    344 ;------------------------------
                                    345 ; write integer in FLASH|EEPROM
                                    346 ; EE! ( n a -- )
                                    347 ;------------------------------
      009A74 94 2D                  348 	.word LINK 
                           001C92   349 	LINK=.
      009A76 CD                     350 	.byte 3 
      009A77 9A 0D CD               351 	.ascii "EE!"
      001C96                        352 EE_STORE:
      009A7A 8B E8 CD         [ 4]  353 	call PSTO 
      009A7D 96 F6 CC         [ 4]  354 	call unlock 
      009A80 94 4A 9A         [ 2]  355 	jp WR_WORD 
                                    356 
                                    357 
                                    358 ;----------------------------
                                    359 ; Erase flash memory row 
                                    360 ; stm8s105c6 as 128 bytes rows
                                    361 ; ROW-ERASE ( a -- )
                                    362 ;----------------------------
      009A83 14 02                  363 	.word LINK 
                           001CA1   364 	LINK=. 
      009A85 50                     365 	.byte 9 
      009A86 49 4F 57 2D 45 52 41   366 	.ascii "ROW-ERASE" 
             53 45
      009A87                        367 row_erase:
      009A87 1D 00 04         [ 4]  368 	call PSTO
                                    369 ;code must be execute from RAM 
                                    370 ;copy routine to PAD 
      009A8A 90 AE 01         [ 2]  371 	subw x,#CELLL 
      009A8D 63 EF 02 90      [ 2]  372 	ldw y,#row_erase_proc
      009A91 AE               [ 2]  373 	ldw (x),y 
      009A92 00 71 FF         [ 4]  374 	call PAD 
      009A95 81 9A 84 05      [ 2]  375 	ldw y,#row_erase_proc_end 
      009A99 53 51 52 54      [ 2]  376 	subw y,#row_erase_proc
      009A9D 32 00 02         [ 2]  377 	subw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009A9E FF               [ 2]  378 	ldw (x),y 
      009A9E 1D 00 04         [ 4]  379 	call CMOVE 
      001CC8                        380 block_erase:
      009AA1 90 AE 4C         [ 2]  381 	ldw y,PTR16
      009AA4 91 EF 02 90      [ 2]  382 	cpw y,#app_space 
      009AA8 AE 36            [ 1]  383 	jrpl erase_flash 
                                    384 ; erase EEPROM block
      009AAA 24 FF 81 9A      [ 2]  385 	cpw y,#EEPROM_BASE 
      009AAE 98 05            [ 1]  386 	jruge 1$
      009AB0 53               [ 4]  387 	ret ; bad address 
      009AB1 51 52 54 33      [ 2]  388 1$: cpw y,#EEPROM_END 
      009AB5 23 01            [ 2]  389 	jrule 2$ 
      009AB5 1D               [ 4]  390 	ret ; bad address 
      001CDF                        391 2$:	
      009AB6 00 04 90         [ 4]  392 	call unlock_eeprom 
      009AB9 AE 49            [ 2]  393 	jra proceed_erase
                                    394 ; erase flash block:
      001CE4                        395 erase_flash:
      009ABB 81 EF 02         [ 4]  396 	call unlock_flash 
      001CE7                        397 proceed_erase:
      009ABE 90 AE 2A         [ 4]  398 	call PAD 
      009AC1 70 FF            [ 1]  399 	ldw y,x
      009AC3 81 9A            [ 2]  400 	ldw y,(y)
      009AC5 AF 01 45         [ 2]  401 	addw x,#CELLL  
      009AC8 90 FD            [ 4]  402 	call (y) 
      009AC8 1D 00 04 90      [ 1]  403 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009ACC AE               [ 4]  404 	ret 
                                    405 
                                    406 ; this routine is to be copied to PAD 
      001CF8                        407 row_erase_proc:
      009ACD 6F FB EF 02      [ 1]  408 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009AD1 90 AE 29 32      [ 1]  409 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009AD5 FF               [ 1]  410 	clr a 
      009AD6 81 9A            [ 1]  411 	clrw y 
      009AD8 C6 06 53         [ 4]  412 	ld ([PTR16],y),a
      009ADB 51 52            [ 2]  413     incw y
      009ADD 54 31 30         [ 4]  414 	ld ([PTR16],y),a
      009AE0 90 5C            [ 2]  415     incw y
      009AE0 1D 00 04         [ 4]  416 	ld ([PTR16],y),a
      009AE3 90 AE            [ 2]  417     incw y
      009AE5 59 98 EF         [ 4]  418 	ld ([PTR16],y),a
      009AE8 02 90 AE 1C 55   [ 2]  419 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009AED FF               [ 4]  420 	ret
      001D1B                        421 row_erase_proc_end:
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
      001D1B                        434 copy_buffer:
      009AEE 81 9A            [ 1]  435 	push #BLOCK_SIZE  
                                    436 ;enable block programming 
      009AF0 D9 05 31 32      [ 1]  437 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009AF4 52 54 32 5C      [ 1]  438 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009AF7 90 5F            [ 1]  439 	clrw y
      009AF7 1D               [ 1]  440 1$:	ld a,(x)
      009AF8 00 04 90         [ 4]  441 	ld ([PTR16],y),a
      009AFB AE               [ 2]  442 	incw x 
      009AFC 68 AD            [ 2]  443 	incw y 
      009AFE EF 02            [ 1]  444 	dec (BCNT,sp)
      009B00 90 AE            [ 1]  445 	jrne 1$
                                    446 ; wait EOP bit 
      009B02 62 CD FF 81 9A   [ 2]  447 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009B07 F1               [ 1]  448 	pop a ; remove BCNT from stack 
      009B08 05               [ 4]  449 	ret 
      001D39                        450 copy_buffer_end:
                                    451 
                                    452 ;-------------------------
                                    453 ; move program_row to RAM 
                                    454 ; in TIB 
                                    455 ;------------------------
      001D39                        456 copy_prog_to_ram:
      009B09 4C 4F 47         [ 2]  457 	subw x,#6
      009B0C 32 53 1D 1B      [ 2]  458 	ldw y,#copy_buffer 
      009B0E EF 04            [ 2]  459 	ldw (4,x),y 
      009B0E 1D 00 04 90      [ 2]  460 	ldw y,#TIBBASE
      009B12 AE 07            [ 2]  461 	ldw (2,x),y 
      009B14 F8 EF 02 90      [ 2]  462 	ldw y,#copy_buffer_end 
      009B18 AE 2B 5F FF      [ 2]  463 	subw y,#copy_buffer  
      009B1C 81               [ 2]  464 	ldw (x),y 
      009B1D 9B 08 04         [ 4]  465 	call CMOVE 
      009B20 4C               [ 4]  466 	ret 
                                    467 
                                    468 
                                    469 ;-----------------------------
                                    470 ; write a row in FLASH/EEPROM 
                                    471 ; WR-ROW ( ab ar -- )
                                    472 ; ab -> address 128 byte buffer to write 
                                    473 ; ar ->  row address in FLASH|EEPROM 
                                    474 ;-----------------------------
      009B21 4E 32                  475 	.word LINK 
                           001D57   476 	LINK=.
      009B23 53                     477 	.byte 6 
      009B24 57 52 2D 52 4F 57      478 	.ascii "WR-ROW"
      001D5E                        479 WR_ROW:
      009B24 1D 00 04         [ 4]  480 	call PSTO
                                    481 ; align to FLASH block 
      009B27 90 AE            [ 1]  482 	ld a,#0x80 
      009B29 01 E5            [ 1]  483 	and a,PTR8 
      009B2B EF 02            [ 1]  484 	ld PTR8,a  
      009B2D 90 AE 2C         [ 4]  485 	call copy_prog_to_ram
      009B30 C8 FF 81         [ 4]  486 	call unlock
      009B33 9B 1F            [ 1]  487 	ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009B35 04 50            [ 2]  488 	ldw y,(y)
      009B37 54 52 21         [ 2]  489 	addw x,#CELLL 
      009B3A 89               [ 2]  490 	pushw x 
      009B3A 90               [ 1]  491 	ldw x,y ; buffer address in x 
      009B3B 93 90 FE         [ 4]  492 	call TIBBASE
      009B3E 90 BF 32         [ 4]  493 	call lock
      009B41 1C               [ 2]  494 	popw x 
      009B42 00               [ 4]  495 	ret 
                                    496 
                                    497 ;-------------------------------------
                                    498 ; change value of OPTION register 
                                    499 ; SET-OPT (c n -- ) 
                                    500 ; c new value.
                                    501 ; n OPT  number {1..7}
                                    502 ;--------------------------------------
      009B43 02 81                  503 		.word LINK 
                           001D80   504 		LINK=.
      009B45 9B                     505 		.byte 7 
      009B46 35 06 45 45 50 52 4F   506 		.ascii "SET-OPT" 
      001D88                        507 set_option: 
      009B4D 4D 93            [ 1]  508 		ldw y,x 
      009B4E 90 FE            [ 2]  509 		ldw y,(y)
      009B4E 90 AE            [ 1]  510 		jreq 1$
      009B50 40 00 1D 00      [ 2]  511 		cpw y,#7 
      009B54 02 FF            [ 2]  512 		jrule 2$ 
                                    513 ; invalid OPTION number 		
      009B56 81 9B 47         [ 2]  514 1$:		addw x,#2*CELLL
      009B59 08               [ 4]  515 		ret
      009B5A 45 45            [ 2]  516 2$:		sllw y 
      009B5C 50 2D 4C 41      [ 2]  517 		addw y,#OPTION_BASE-1
      009B60 53               [ 2]  518 		ldw (x),y 
      009B61 54 1C 4E         [ 4]  519 		call EE_CSTORE
      009B62 81               [ 4]  520 		ret 
                                    521 
                                    522 
                                    523 
                                    524 ;--------------------------------------
                                    525 ; reset system to its original state 
                                    526 ; before any user modification
                                    527 ; PRISTINE ( -- )
                                    528 ;-------------------------------------
      009B62 1D 00                  529 	.word LINK  
                           001DA5   530 	LINK=.
      009B64 02                     531 	.byte 8 
      009B65 90 AE 40 00 FF 81 9B   532 	.ascii "PRISTINE"
             59
      001DAE                        533 pristine:
                                    534 ;;; erase EEPROM
      009B6D 07 45 45         [ 4]  535 	call EEPROM 
      009B70 50 2D 52         [ 4]  536 1$:	call DUPP 
      009B73 55 4E AB         [ 4]  537 	call row_erase
      009B75 90 93            [ 1]  538 	ldw y,x 
      009B75 1D 00            [ 2]  539 	ldw y,(y)
      009B77 02 90 AE 40      [ 2]  540 	addw y,#BLOCK_SIZE
      009B7B 02               [ 2]  541 	ldw (x),y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009B7C FF 81 9B 6D      [ 2]  542 	cpw y,#OPTION_BASE 
      009B80 06 45            [ 1]  543 	jrult 1$
                                    544 ;;; reset OPTION to default values
      009B82 45 50 2D 43      [ 2]  545 	ldw y,#1 ; OPT1 
      009B86 50               [ 2]  546 2$:	ldw (x),y   
      009B87 90 5F            [ 1]  547 	clrw y 
      009B87 1D 00            [ 2]  548 	ldw (2,x),y  ; ( 0 1 -- ) 
      009B89 02 90 AE         [ 4]  549 	call DDUP    ; ( 0 1 0 1 -- )  
      009B8C 40 04 FF         [ 4]  550 	call set_option
      009B8F 81 9B            [ 1]  551 	ldw y,x 
      009B91 80 06            [ 2]  552 	ldw y,(y)
      009B93 45 45            [ 2]  553 	incw y  ; next OPTION 
      009B95 50 2D 56 50      [ 2]  554 	cpw y,#8 
      009B99 25 E9            [ 1]  555 	jrult 2$
                                    556 ;;; erase first row of app_space 	
      009B99 1D 00 02         [ 4]  557 	call DROP 
      009B9C 90 AE 40 06      [ 2]  558 	ldw y,#app_space
      009BA0 FF               [ 2]  559 	ldw (x),y   
      009BA1 81 9B 92         [ 4]  560 	call row_erase 
                                    561 ; reset interrupt vectors 
      009BA4 0A 55 50         [ 2]  562 	subw x,#CELLL 
      009BA7 44 41            [ 1]  563 	clrw y  
      009BA9 54               [ 2]  564 4$:	ldw (x),y  ; ( n -- ) int# 
      009BAA 2D 4C 41         [ 4]  565 	call DUPP  
      009BAD 53 54 12         [ 4]  566 	call reset_vector
      009BAF 90 93            [ 1]  567 	ldw y,x 
      009BAF CD 86            [ 2]  568 	ldw y,(y)
      009BB1 CF CD            [ 2]  569 	incw y   ; next vector 
      009BB3 84 BC CD 9B      [ 2]  570 	cpw y,#29 
      009BB7 62 CC            [ 1]  571 	jrult 4$
      009BB9 9D 16 9B         [ 2]  572 	jp NonHandledInterrupt ; reset MCU
                                    573 
                                    574 ;------------------------------
                                    575 ; reset an interrupt vector 
                                    576 ; to its initial value 
                                    577 ; i.e. NonHandledInterrupt
                                    578 ; RST-IVEC ( n -- )
                                    579 ;-----------------------------
      009BBC A4 09                  580 	.word LINK 
                           001E09   581 	LINK=. 
      009BBE 55                     582 	.byte 8 
      009BBF 50 44 41 54 2D 52 55   583 	.ascii "RST-IVEC"
             4E
      009BC7                        584 reset_vector:
      009BC7 CD 9B            [ 1]  585 	ldw y,x
      009BC9 75 CC 9D         [ 2]  586 	addw x,#CELLL 
      009BCC 16 9B            [ 2]  587 	ldw y,(y)
      009BCE BD 08 55 50      [ 2]  588 	cpw y,#23 
      009BD2 44 41            [ 1]  589 	jreq 9$
      009BD4 54 2D 43 50      [ 2]  590 	cpw y,#29 ; last vector
      009BD8 22 27            [ 1]  591 	jrugt 9$  
      009BD8 CD 86            [ 2]  592 	sllw y 
      009BDA BF CD            [ 2]  593 	sllw y 
      009BDC 84 BC CD 9B      [ 2]  594 	addw y,#0x8008 ; irq0 address 
      009BE0 87 CC 9D         [ 2]  595 	subw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009BE3 16               [ 2]  596 	ldw (x),y 
      009BE4 9B CF 08         [ 4]  597 	call PSTO 
      009BE7 55 50 44         [ 2]  598 	subw x,#CELLL 
      009BEA 41 54            [ 1]  599 	clrw y
      009BEC 2D 56            [ 1]  600 	ld a,#0x82 
      009BEE 50 95            [ 1]  601 	ld yh,a
      009BEF FF               [ 2]  602 	ldw (x),y
      009BEF CD 86 B1         [ 4]  603 	call WR_WORD 
      009BF2 CD 84 BC         [ 2]  604 	subw x,#CELLL
      009BF5 CD 9B 99 CC      [ 2]  605 	ldw y,#NonHandledInterrupt
      009BF9 9D               [ 2]  606 	ldw (x),y 
      009BFA 16 9B E6         [ 4]  607 	call WR_WORD 
      009BFD 06               [ 4]  608 9$:	ret 
                                    609 
                                    610 
                                    611 ;------------------------------
                                    612 ; all interrupt vector with 
                                    613 ; an address >= a are resetted 
                                    614 ; to default
                                    615 ; CHKIVEC ( a -- )
                                    616 ;------------------------------
      009BFE 55 4E                  617 	.word LINK 
                           001E4F   618 	LINK=.
      009C00 4C                     619 	.byte 7
      009C01 4B 45 45 49 56 45 43   620 	.ascii "CHKIVEC"
                                    621 ;local variables 
                           000001   622 	SSP=1
                           000003   623 	CADR=3
                           000005   624 	OFS=5
                           000006   625 	VSIZE=6  
      009C04                        626 CHKIVEC:
      009C04 35 00            [ 2]  627 	sub sp,#VSIZE ;alloc local variables 
      009C06 50 5B            [ 1]  628 	ldw y,x 
      009C08 35 FF            [ 2]  629 	ldw y,(y)
      009C0A 50 5C            [ 2]  630 	ldw (CADR,sp),y ; ca 
      009C0C 35 AE            [ 2]  631 	ldw (SSP,sp),x 
      009C0E 50 64 35         [ 2]  632 	ldw x,#0x800a ; irq0 address 
      009C11 56 50            [ 2]  633 	ldw PTR16,X
      009C13 64 72 07         [ 2]  634 	ldw x,#-4 
      009C16 50 5F FB         [ 2]  635 1$:	addw x,#4
      009C19 81 9B FD         [ 2]  636 	cpw x,#30*4 ; irq0-29 
      009C1C 06 55            [ 1]  637 	jreq 9$
      009C1E 4E 4C            [ 1]  638 	ldw y,x  
      009C20 4B 46 4C         [ 4]  639 	ld a,([PTR16],y)
      009C23 11 03            [ 1]  640 	cp a,(CADR,sp)
      009C23 35 00            [ 1]  641 	jrult 1$
      009C25 50 5B            [ 2]  642 	incw y 
      009C27 35 FF 50         [ 4]  643 	ld a,([PTR16],y)
      009C2A 5C 35            [ 1]  644 	cp a,(CADR+1,sp) 
      009C2C 56 50            [ 1]  645 	jrult 1$ 
      009C2E 62 35            [ 2]  646 	ldw (OFS,sp),x 
      009C30 AE               [ 2]  647 	srlw x
      009C31 50               [ 2]  648 	srlw x 
      009C32 62 72            [ 1]  649 	ldw y,x 
      009C34 03 50            [ 2]  650 	ldw x,(SSP,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009C36 5F               [ 2]  651 	ldw (x),y
      009C37 FB 81 9C         [ 4]  652 	call reset_vector
      009C3A 1C 06            [ 2]  653 	ldw x,(OFS,sp) 
      009C3C 55 4E            [ 2]  654 	jra 1$
      009C3E 4C 4F            [ 2]  655 9$:	ldw x,(SSP,sp) 
      009C40 43 4B 02         [ 2]  656 	addw x,#CELLL 
      009C42 5B 06            [ 2]  657 	addw sp,#VSIZE ; drop local variables  
      009C42 90               [ 4]  658 	ret 
                                    659 
                                    660 ;------------------------------
                                    661 ; set interrupt vector 
                                    662 ; SET-IVEC ( a n -- )
                                    663 ;  a Handler address
                                    664 ;  n  vector # 0 .. 29 
                                    665 ;-----------------------------
      009C43 BE 32                  666 	.word LINK
                           001E9D   667 	LINK=.
      009C45 90                     668 	.byte 8 
      009C46 A3 80 00 24 10 90 A3   669 	.ascii "SET-IVEC" 
             40
      001EA6                        670 set_vector:
      009C4E 00 25            [ 1]  671     ldw y,x 
      009C50 0D 90            [ 2]  672 	ldw y,(y) ; vector #
      009C52 A3 48 7F 22      [ 2]  673 	cpw y,#29 ; last vector
      009C56 07 CD            [ 2]  674 	jrule 2$
      009C58 9C 04 81         [ 2]  675 	addw x,#2*CELLL 
      009C5B CD               [ 4]  676 	ret
      009C5C 9C 23            [ 2]  677 2$:	sllw y 
      009C5E 81 9C            [ 2]  678 	sllw y 
      009C60 3B 04 4C 4F      [ 2]  679 	addw y,#0X8008 ; IRQ0 vector address 
      009C64 43               [ 2]  680 	ldw (x),y  ; vector address 
      009C65 4B 1A BA         [ 4]  681 	call PSTO 
      009C66 90 5F            [ 1]  682 	clrw y 
      009C66 72 13            [ 1]  683 	ld a,#0x82 
      009C68 50 5F            [ 1]  684 	ld yh,a 
      009C6A 72 17 50         [ 2]  685 	subw x,#CELLL 
      009C6D 5F               [ 2]  686 	ldw (x),y 
      009C6E 81 9C 61         [ 4]  687 	call WR_WORD 
      009C71 08 49 4E         [ 4]  688 	call WR_WORD 
      009C74 43               [ 4]  689 9$: ret 
                                    690 
                                    691 
                                    692 ;------------------------
                                    693 ; Compile word to flash
                                    694 ; EE, (w -- )
                                    695 ;-----------------------
      009C75 2D 50                  696 	.word LINK
                           001ED3   697 	LINK=.
      009C77 54                     698 	.byte 3
      009C78 52 31 36               699 	.ascii "EE,"
      009C7B                        700 EE_COMMA:
      009C7B 90 89 90         [ 2]  701 	subw x,#CELLL 
      009C7E BE 32 90         [ 2]  702 	ldw y,UCP
      009C81 5C 90            [ 2]  703 	pushw y 
      009C83 BF               [ 2]  704 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009C84 32 90 85         [ 4]  705 	call EE_STORE
      009C87 81 9C            [ 2]  706 	popw y 
      009C89 71 07 57 52      [ 2]  707 	addw y,#2
      009C8D 2D 42 59         [ 2]  708 	ldw UCP,y
      009C90 54               [ 4]  709 	ret 
                                    710 
                                    711 
                                    712 ;-------------------------
                                    713 ; Compile byte to flash 
                                    714 ; EEC, ( c -- )	
                                    715 ;-------------------------
      009C91 45 D3                  716 	.word LINK 
                           001EEF   717 	LINK=.
      009C92 04                     718 	.byte 4 
      009C92 90 93 90 FE            719 	.ascii "EEC,"
      001EF4                        720 EE_CCOMMA:
      009C96 1C 00 02         [ 2]  721 	subw x,#CELLL 
      009C99 90 9F 92         [ 2]  722 	ldw y,UCP
      009C9C C7 32            [ 2]  723 	pushw y 
      009C9E 72               [ 2]  724 	ldw (x),y 
      009C9F 05 50 5F         [ 4]  725 	call EE_CSTORE
      009CA2 FB 20            [ 2]  726 	popw y 
      009CA4 D6 9C            [ 2]  727 	incw y 
      009CA6 8A 07 57         [ 2]  728 	ldw UCP,y
      009CA9 52               [ 4]  729 	ret 
                                    730 
                                    731 
                                    732 ;--------------------------
                                    733 ; copy FLASH block to ROWBUF
                                    734 ; ROW>BUF ( ar -- )
                                    735 ; ar row address 
                                    736 ;--------------------------
      009CAA 2D 57                  737 	.word LINK 
                           001F0A   738 	LINK=.
      009CAC 4F                     739 	.byte 7 
      009CAD 52 44 57 3E 42 55 46   740 	.ascii "ROW>BUF"
      009CAF                        741 ROW2BUF: 
      009CAF 90 93 90         [ 4]  742 	call PSTO 
      009CB2 FE 90            [ 1]  743 	ld a,#BLOCK_SIZE
      009CB4 89               [ 1]  744 	push a 
                                    745  ; block align flash address	
      009CB5 90 5E            [ 1]  746 	and a,PTR8
      009CB7 FF CD            [ 1]  747 	ld PTR8,a
      009CB9 9C 92 90 85      [ 2]  748 	ldw y,#ROWBUFF 
      009CBD 1D 00 02         [ 4]  749 1$: ld a,[PTR16]
      009CC0 FF CD            [ 1]  750 	ld (y),a
      009CC2 9C 92 CC         [ 4]  751 	call INC_PTR16
      009CC5 9C 66            [ 2]  752 	incw y 
      009CC7 9C A7            [ 1]  753 	dec (1,sp)
      009CC9 04 45            [ 1]  754 	jrne 1$ 
      009CCB 45               [ 1]  755 	pop a 
      009CCC 43               [ 4]  756 	ret 
                                    757 
                                    758 
                                    759 ;---------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                    760 ; copy ROWBUFF to flash 
                                    761 ; BUF>ROW ( ar -- )
                                    762 ; ar row address
                                    763 ;---------------------------
      009CCD 21 0A                  764 	.word LINK 
                           001F32   765 	LINK=.
      009CCE 07                     766 	.byte 7 
      009CCE 52 02 CD 9B 3A E6 01   767 	.ascii "BUF>ROW" 
      001F3A                        768 BUF2ROW:
      009CD5 43 6B 01         [ 4]  769 	call TBUF ; ( ar Ab -- )
      009CD8 0F 02 CD         [ 4]  770 	call SWAPP ; ( ab ar -- )
      009CDB 9C 42 90         [ 4]  771 	call WR_ROW 
      009CDE BE               [ 4]  772 	ret 
                                    773 
                                    774 ;---------------------------------
                                    775 ; how many byte free in that row 
                                    776 ; RFREE ( a -- n )
                                    777 ; a is least byte of target address
                                    778 ;----------------------------------
      009CDF 32 90                  779 	.word LINK 
                           001F46   780 	LINK=.
      009CE1 A3                     781 	.byte 5 
      009CE2 48 00 2B 10 90         782 	.ascii "RFREE"
      001F4C                        783 RFREE:
      009CE7 A3 48            [ 1]  784 	ld a,(1,x)
      009CE9 80 2A            [ 1]  785 	and a,#BLOCK_SIZE-1 
      009CEB 0A 03            [ 1]  786 	ld YTEMP,a 
      009CED 02 72            [ 1]  787 	ld a,#BLOCK_SIZE 
      009CEF 1E 50            [ 1]  788 	sub a,YTEMP 
      009CF1 5B 72            [ 1]  789 	clrw y 
      009CF3 1F 50            [ 1]  790 	ld yl,a
      009CF5 5C               [ 2]  791 	ldw (x),y 
      009CF6 81               [ 4]  792 	ret 
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
      009CF6 CD 9C                  803 	.word LINK 
                           001F5E   804 	LINK=. 
      009CF8 92                     805 	.byte 6
      009CF9 0D 02 27 0D 7B 01      806 	.ascii "RAM>EE"
                                    807 	
      001F65                        808 RAM2EE:
                                    809 ; PICK af
      009CFF 90 5F 90         [ 4]  810 	call DOLIT 
      009D02 97 1D                  811 	.word 2 
      009D04 00 02 FF         [ 4]  812 	call PICK  ; { -- af a u1 af }
      009D07 CD 9C 92         [ 4]  813 	call DUPP 
      009D0A CD 1F 12         [ 4]  814 	call ROW2BUF ; copy in ROWBUFF  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009D0A CD 9C 66         [ 4]  815 	call DUPP 
      009D0D 5B 02 81         [ 4]  816 	call TOR 
      009D10 9C C9 03         [ 4]  817 	call DOLIT 
      009D13 45 45                  818 	.word BLOCK_SIZE-1
      009D15 21 05 2F         [ 4]  819 	call ANDD 
      009D16 CD 03 B4         [ 4]  820 	call DOLIT 
      009D16 CD 9B                  821 	.word ROWBUFF 
      009D18 3A CD 9C         [ 4]  822 	call PLUS  ; ( -- af a u1 ab )
      009D1B 42 CC 9C         [ 4]  823 	call SWAPP ;  ( -- af a ab u1 )
      009D1E AF 9D 12         [ 4]  824 	call RFROM  ; ( -- af a ab u1 af )
      009D21 09 52 4F         [ 4]  825 	call RFREE  ; ( -- af a ab u1 n )
      009D24 57 2D 45         [ 4]  826 	call MIN    
      009D27 52 41 53         [ 4]  827 	call DUPP 
      009D2A 45 04 AC         [ 4]  828 	call TOR  
      009D2B CD 0B 7F         [ 4]  829 	call CMOVE  ; copy RAM to RAM from a to ab 
      009D2B CD 9B 3A         [ 4]  830 	call BUF2ROW ; ( af --  ) write ROWBUFF to flash 
      009D2E 1D 00 02         [ 4]  831 	call RFROM  ; how many written 
      009D31 90               [ 4]  832 	ret 
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
      009D32 AE 9D                  848 	.word LINK 
                           001FA7   849 	LINK=.
      009D34 78                     850 	.byte 5 
      009D35 FF CD 8B C3 90         851 	.ascii "FMOVE" 
      001FAD                        852 FMOVE:
      009D3A AE 9D 9B         [ 4]  853 	call TFLASH 
      009D3D 72 A2 9D         [ 4]  854 	CALL AT 
      009D40 78 1D 00         [ 4]  855 	CALL QBRAN 
      009D43 02 FF                  856 	.word no_move  
      009D45 CD 8B FF         [ 4]  857 	call CPP  
      009D48 CD 04 3C         [ 4]  858 	call AT  
      009D48 90 BE 32         [ 4]  859 	call DUPP ; ( cp cp -- )
      009D4B 90 A3 A1         [ 4]  860 	call CNTXT 
      009D4E 80 2A 13         [ 4]  861 	call AT 
      009D51 90 A3 40         [ 4]  862 	call DOLIT 
      009D54 00 24                  863 	.word 2 
      009D56 01 81 90         [ 4]  864 	call SUBB ; ( cp cp la -- ) \ new word link address in RAM  
      009D59 A3 43 FF         [ 4]  865 	call DUPP 
      009D5C 23 01 81         [ 4]  866 	call TOR    ; ( cp cp la R: la ) 
      009D5F                        867 FMOVE2:
      009D5F CD 9C 04         [ 4]  868 	call HERE  ; ( cp cp la vp  R: la )
      009D62 20 03 A0         [ 4]  869 	call RAT   ; ( cp cp la vp la R: la )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009D64 CD 07 57         [ 4]  870 	call SUBB ; ( cp cp la wl R: la  ) \ wl is bytes to copy 
      001FDE                        871 next_row:
      009D64 CD 9C 23         [ 4]  872 	call DUPP 
      009D67 CD 04 AC         [ 4]  873 	call TOR  ; ( cp cp la wl -- ) R: a wl
      009D67 CD 8B C3         [ 4]  874 	call RAM2EE ; ( cp cp la wl -- cp u2 ) u2 is byte written to FLASH 
      009D6A 90 93 90         [ 4]  875 	call DUPP 
      009D6D FE 1C 00         [ 4]  876 	call TOR
      009D70 02 90 FD         [ 4]  877 	call PLUS  ; ( cp+ ) 
      009D73 72 17 50         [ 4]  878 	call DUPP 
      009D76 5F 81 8D         [ 4]  879 	call RFROM  ; ( cp+ cp+ u2  R: a wl ) 
      009D78 CD 04 8D         [ 4]  880 	call RFROM  ; ( cp+ cp+ u2 wl R: a ) 
      009D78 35 20 50         [ 4]  881 	call OVER   ; ( cp+ cp+ u2 wl u2 -- )
      009D7B 5B 35 DF         [ 4]  882 	call SUBB  ; ( cp+ cp+ u2 wl- R: a )
      009D7E 50 5C 4F         [ 4]  883 	call DUPP 
      009D81 90 5F 91         [ 4]  884 	call QBRAN
      009D84 D7 32                  885 	.word fmove_done 
      009D86 90 5C 91         [ 4]  886 	call SWAPP  ; ( cp+ cp+ wl- u2 R: a )
      009D89 D7 32 90         [ 4]  887 	call RFROM ; ( cp+ cp+ wl- u2 a -- ) 
      009D8C 5C 91 D7         [ 4]  888 	call PLUS  ; ( cp+ cp+ wl- a+ )
      009D8F 32 90 5C         [ 4]  889 	call DUPP 
      009D92 91 D7 32         [ 4]  890 	call TOR   ; ( cp+ cp+ wl- a+ ) R: a+
      009D95 72 05 50         [ 4]  891 	call SWAPP ; ( cp+ cp+ a+ wl- )
      009D98 5F FB 81         [ 4]  892 	call BRAN
      009D9B 1F DE                  893 	.word next_row  
      009D9B                        894 fmove_done:	
      009D9B 4B 80 72         [ 4]  895 	call RFROM  ; ( -- cp+ cp+ u2 wl- a  )
      009D9E 10 50 5B         [ 2]  896 	addw x,#4*CELLL ; (  -- cp+ ) new CP 
      009DA1 72               [ 4]  897  	ret  
      002025                        898 no_move:
      009DA2 11 50 5C         [ 4]  899 	call ZERO
      009DA5 90               [ 4]  900 	ret 
                                    901 
                                    902 ;------------------------------------------
                                    903 ; adjust pointers after **FMOVE** operetion.
                                    904 ; UPDAT-PTR ( cp+ -- )
                                    905 ; cp+ is new CP position after FMOVE 
                                    906 ;-------------------------------------------
      009DA6 5F F6                  907 	.word LINK 
                           00202B   908 	LINK=.
      009DA8 91                     909 	.byte 9
      009DA9 D7 32 5C 90 5C 0A 01   910 	.ascii "UPDAT-PTR" 
             26 F5
      002035                        911 UPDATPTR:
                                    912 ;reset VP to previous position  
      009DB2 72 05 50         [ 4]  913 	call EEPVP 
      009DB5 5F FB 84         [ 4]  914 	call AT
      009DB8 81 06 31         [ 4]  915 	call VPP 
      009DB9 CD 04 25         [ 4]  916 	call STORE
                                    917 ;update CONTEXT and LAST 
      009DB9 CD 1B 07         [ 4]  918 	call EEPCP 
      009DB9 1D 00 06         [ 4]  919 	call AT
      009DBC 90 AE 9D         [ 4]  920 	call DOLIT 
      009DBF 9B EF                  921 	.word 2 
      009DC1 04 90 AE         [ 4]  922 	call PLUS 
      009DC4 07 00 EF         [ 4]  923 	call DUPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009DC7 02 90 AE         [ 4]  924 	call CNTXT 
      009DCA 9D B9 72         [ 4]  925 	call STORE
      009DCD A2 9D 9B         [ 4]  926 	call LAST
      009DD0 FF CD 8B         [ 4]  927 	call STORE 
      009DD3 FF 81 9D         [ 4]  928 	call UPDATLAST 
                                    929 ;update CP 
      009DD6 21 06 57         [ 4]  930 	call CPP 
      009DD9 52 2D 52         [ 4]  931 	call STORE
      009DDC 4F 57 58         [ 4]  932 	call UPDATCP 
      009DDE 81               [ 4]  933 	ret 
                                    934 
                                    935 ;-----------------------------
                                    936 ; move interrupt sub-routine
                                    937 ; in flash memory
                                    938 ;----------------------------- 
      009DDE CD 9B                  939 	.word LINK 
                           00206D   940 	LINK=. 
      009DE0 3A                     941 	.byte 6
      009DE1 A6 80 B4 33 B7 33      942 	.ascii "IFMOVE" 
      002074                        943 IFMOVE:
      009DE7 CD 9D B9         [ 4]  944 	call TFLASH 
      009DEA CD 9C 42         [ 4]  945 	CALL AT 
      009DED 90 93 90         [ 4]  946 	CALL QBRAN 
      009DF0 FE 1C                  947 	.word no_move 
      009DF2 00 02 89         [ 4]  948 	call CPP 
      009DF5 93 CD 07         [ 4]  949 	call AT 
      009DF8 00 CD 9C         [ 4]  950 	call DUPP ; ( cp cp -- )
      009DFB 66 85 81         [ 4]  951 	call EEPVP 
      009DFE 9D D7 07         [ 4]  952 	call AT  ; ( cp cp a )
      009E01 53 45 54         [ 4]  953 	call TOR 
      009E04 2D 4F 50         [ 4]  954 	call RAT ; ( cp cp a -- ) R: a 
      009E07 54 1F D5         [ 2]  955 	jp FMOVE2 
                                    956 
                                    957 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                   4451 
                                   4452 ;===============================================================
                                   4453 
                           00206D  4454 LASTN =	LINK   ;last name defined
                                   4455 
                                   4456 ; application code begin here
      009E08                       4457 	.bndry 128 ; align on flash block  
      002100                       4458 app_space: 
                                   4459 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        00077A R   |   6 ABOR1      0012CD R
  6 ABOR2      0012E4 R   |   6 ABORQ      0012C5 R   |   6 ABORT      0012B6 R
  6 ABRTQ      0015A1 R   |   6 ABSS       000771 R   |   6 ACCEP      00124C R
  6 ACCP1      001255 R   |   6 ACCP2      00127B R   |   6 ACCP3      00127E R
  6 ACCP4      001280 R   |     ADC_AWCR=  00540E     |     ADC_AWCR=  00540F 
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
  6 ADRADJ     00067D R   |     AFR     =  004803     |     AFR0_ADC=  000000 
    AFR1_TIM=  000001     |     AFR2_CCO=  000002     |     AFR3_TIM=  000003 
    AFR4_TIM=  000004     |     AFR5_TIM=  000005     |     AFR6_I2C=  000006 
    AFR7_BEE=  000007     |   6 AFT        00158C R   |   6 AGAIN      0014E2 R
  6 AHEAD      00153F R   |   6 ALLOT      0013F5 R   |   6 ANDD       00052F R
    APP_CP  =  004004     |     APP_LAST=  004000     |     APP_RUN =  004002 
    APP_VP  =  004006     |   6 AT         00043C R   |   6 ATEXE      000B68 R
  6 AUTORUN    00012B R   |     AWU_APR =  0050F1     |     AWU_CSR1=  0050F0 
    AWU_TBR =  0050F2     |     B115200 =  000006     |     B19200  =  000003 
    B230400 =  000007     |     B2400   =  000000     |     B38400  =  000004 
    B460800 =  000008     |     B4800   =  000001     |     B57600  =  000005 
    B921600 =  000009     |     B9600   =  000002     |   6 BACK1      0011F4 R
  6 BASE       0005A0 R   |     BASEE   =  00000A     |     BCNT    =  000001 
  6 BCOMP      001437 R   |   6 BDIGS      000C4F R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00500F 
  6 BEGIN      0014C4 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
  6 BKSLA      00108C R   |   6 BKSP       0011C4 R   |     BKSPP   =  000008 
  6 BLANK      000A37 R   |     BLOCK_SI=  000080     |   6 BRAN       0003FE R
    BTW     =  000001     |   6 BUF2ROW    001F3A R   |   6 BYE        0000B8 R
    CADR    =  000003     |     CALLL   =  0000CD     |     CARRY   =  000028 
  6 CAT        00045A R   |   6 CCOMMA     001419 R   |     CELLL   =  000002 
  6 CELLM      0009BC R   |   6 CELLP      0009AD R   |   6 CELLS      0009CB R
    CFG_GCR =  007F60     |   6 CHAR1      000E7C R   |   6 CHAR2      000E7F R
  6 CHKIVEC    001E57 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
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
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |   6 CMOV1      000B87 R
  6 CMOV2      000B9F R   |   6 CMOVE      000B7F R   |     CNTDWN  =  000030 
  6 CNTXT      000623 R   |   6 COLD       001999 R   |   6 COLD1      001999 R
  6 COLON      00173A R   |   6 COMMA      001402 R   |   6 COMPI      001447 R
    COMPO   =  000040     |   6 CONSTANT   0017E4 R   |   6 COUNT      000B1B R
  6 CPP        00063F R   |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
  6 CR         000EAA R   |   6 CREAT      001780 R   |     CRR     =  00000D 
  6 CSTOR      000449 R   |   6 DAT        000AFB R   |     DATSTK  =  000680 
  6 DDROP      0006BE R   |   6 DDUP       0006C9 R   |     DEBUG   =  000001 
  6 DECIM      000CFF R   |   6 DEPTH      000A86 R   |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   6 DGTQ1      000D44 R   |   6 DI         0000C6 R
  6 DIG        000C78 R   |   6 DIGIT      000C13 R   |   6 DIGS       000C89 R
  6 DIGS1      000C89 R   |   6 DIGS2      000C96 R   |   6 DIGTQ      000D13 R
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   6 DN1        000738 R
  6 DNEGA      00071B R   |   6 DOCONST    00180E R   |   6 DOLIT      0003B4 R
  6 DONXT      0003C8 R   |   6 DOSTR      000EC0 R   |   6 DOT        000F45 R
  6 DOT1       000F5B R   |   6 DOTI1      001930 R   |   6 DOTID      00191A R
  6 DOTO1      001359 R   |   6 DOTOK      00133F R   |   6 DOTPR      00106E R
  6 DOTQ       0015BB R   |   6 DOTQP      000EE9 R   |   6 DOTR       000EF7 R
  6 DOTS       0018BC R   |   6 DOTS1      0018C7 R   |   6 DOTS2      0018D0 R
  6 DOVAR      000590 R   |   6 DROP       0004D9 R   |   6 DSTOR      000AD5 R
  6 DUMP       001872 R   |   6 DUMP1      001889 R   |   6 DUMP3      0018AB R
  6 DUMPP      001841 R   |   6 DUPP       0004E3 R   |   6 EDIGS      000CB4 R
  6 EEPCP      001B07 R   |   6 EEPLAST    001AE2 R   |   6 EEPROM     001ACE R
    EEPROM_B=  004000     |     EEPROM_E=  0043FF     |     EEPROM_S=  000400 
  6 EEPRUN     001AF5 R   |   6 EEPVP      001B19 R   |   6 EE_CCOMM   001EF4 R
  6 EE_COMMA   001ED7 R   |   6 EE_CSTOR   001C4E R   |   6 EE_STORE   001C96 R
  6 EI         0000BF R   |   6 ELSEE      00151A R   |   6 EMIT       00039E R
  6 ENEPER     001A48 R   |   6 EQ1        000795 R   |   6 EQUAL      00077F R
  6 ERASE      000BE1 R   |     ERR     =  00001B     |   6 EVAL       001382 R
  6 EVAL1      001382 R   |   6 EVAL2      00139E R   |   6 EXE1       000B76 R
  6 EXECU      00040E R   |   6 EXIT       00041E R   |     EXT     =  000000 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |   6 EXTRC      000C3B R
    FHSE    =  F42400     |     FHSE_K  =  003E80     |     FHSE_M  =  000010 
  6 FILL       000BAE R   |   6 FILL1      000BCB R   |   6 FILL2      000BD4 R
  6 FIND       001120 R   |   6 FIND1      00113E R   |   6 FIND2      00116C R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]

Symbol Table

  6 FIND3      001178 R   |   6 FIND4      00118C R   |   6 FIND5      001199 R
  6 FIND6      00117D R   |     FLASH_BA=  008000     |     FLASH_CR=  00505A 
    FLASH_CR=  000002     |     FLASH_CR=  000000     |     FLASH_CR=  000003 
    FLASH_CR=  000001     |     FLASH_CR=  00505B     |     FLASH_CR=  000005 
    FLASH_CR=  000004     |     FLASH_CR=  000007     |     FLASH_CR=  000000 
    FLASH_CR=  000006     |     FLASH_DU=  005064     |     FLASH_DU=  0000AE 
    FLASH_DU=  000056     |     FLASH_FP=  00505D     |     FLASH_FP=  000000 
    FLASH_FP=  000001     |     FLASH_FP=  000002     |     FLASH_FP=  000003 
    FLASH_FP=  000004     |     FLASH_FP=  000005     |     FLASH_IA=  00505F 
    FLASH_IA=  000003     |     FLASH_IA=  000002     |     FLASH_IA=  000006 
    FLASH_IA=  000001     |     FLASH_IA=  000000     |     FLASH_NC=  00505C 
    FLASH_NF=  00505E     |     FLASH_NF=  000000     |     FLASH_NF=  000001 
    FLASH_NF=  000002     |     FLASH_NF=  000003     |     FLASH_NF=  000004 
    FLASH_NF=  000005     |     FLASH_PU=  005062     |     FLASH_PU=  000056 
    FLASH_PU=  0000AE     |   6 FMOVE      001FAD R   |   6 FMOVE2     001FD5 R
  6 FOR        001497 R   |   6 FORGET     000158 R   |   6 FORGET1    000187 R
  6 FORGET2    00020D R   |   6 FORGET4    000216 R   |   6 FORGET6    0001CF R
  6 FREEVAR    000223 R   |   6 FREEVAR4   000259 R   |     GPIO_BAS=  005000 
    GPIO_SIZ=  000005     |   6 HERE       000B32 R   |   6 HEX        000CEA R
  6 HI         00196C R   |   6 HLD        000610 R   |   6 HOLD       000C5F R
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
    I2C_WRIT=  000000     |   6 ICOLON     00174B R   |   6 IFETCH     0014B5 R
  6 IFF        0014F2 R   |   6 IFMOVE     002074 R   |     IMEDD   =  000080 
  6 IMMED      00175D R   |   6 INCH       000392 R   |   6 INC_PTR1   001BFB R
  6 INITOFS    001713 R   |   6 INN        0005BE R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
  6 INTE1      001321 R   |   6 INTER      0012F7 R   |     INT_ADC1=  000016 
    INT_AWU =  000001     |     INT_CLK =  000002     |     INT_EXTI=  000003 
    INT_EXTI=  000004     |     INT_EXTI=  000005     |     INT_EXTI=  000006 
    INT_EXTI=  000007     |     INT_FLAS=  000018     |     INT_I2C =  000013 
    INT_RES1=  000008     |     INT_RES2=  000009     |     INT_RES3=  000011 
    INT_RES4=  000012     |     INT_SPI =  00000A     |     INT_TIM1=  00000C 
    INT_TIM1=  00000B     |     INT_TIM2=  00000E     |     INT_TIM2=  00000D 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]

Symbol Table

    INT_TIM3=  000010     |     INT_TIM3=  00000F     |     INT_TIM4=  000017 
    INT_TLI =  000000     |     INT_UART=  000015     |     INT_UART=  000014 
    INT_VECT=  008060     |     INT_VECT=  00800C     |     INT_VECT=  008010 
    INT_VECT=  008014     |     INT_VECT=  008018     |     INT_VECT=  00801C 
    INT_VECT=  008020     |     INT_VECT=  008024     |     INT_VECT=  008068 
    INT_VECT=  008054     |     INT_VECT=  008000     |     INT_VECT=  008030 
    INT_VECT=  008038     |     INT_VECT=  008034     |     INT_VECT=  008040 
    INT_VECT=  00803C     |     INT_VECT=  008048     |     INT_VECT=  008044 
    INT_VECT=  008064     |     INT_VECT=  008008     |     INT_VECT=  008004 
    INT_VECT=  00805C     |     INT_VECT=  008058     |   6 INVER      0006F8 R
    IPR0    =  000002     |     IPR1    =  000001     |     IPR2    =  000000 
    IPR3    =  000003     |     IPR_MASK=  000003     |     IRET_COD=  000080 
  6 ISEMI      0016A8 R   |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  6 JSRC       0016FD R   |   6 KEY        000E2A R   |   6 KTAP       001211 R
  6 KTAP1      001234 R   |   6 KTAP2      001237 R   |   6 LAST       00064F R
  6 LASTN   =  00206D R   |   6 LBRAC      00132E R   |     LD1_BIT =  000000 
    LD1_MASK=  000001     |     LD1_PORT=  00500F     |   6 LESS       0007BC R
    LF      =  00000A     |   6 LINK    =  00206D R   |   6 LITER      001469 R
  6 LN2S       001AA4 R   |   6 LOG2S      001A8E R   |   6 LSHIFT     0009F6 R
  6 LSHIFT1    0009FF R   |   6 LSHIFT4    000A07 R   |   6 LT1        0007D2 R
    MASKK   =  001F7F     |   6 MAX        0007DC R   |   6 MAX1       0007EF R
  6 MIN        0007F9 R   |   6 MIN1       00080C R   |     MISCOPT =  004805 
    MISCOPT_=  000004     |     MISCOPT_=  000002     |     MISCOPT_=  000003 
    MISCOPT_=  000000     |     MISCOPT_=  000001     |   6 MMOD1      0008AF R
  6 MMOD2      0008C3 R   |   6 MMOD3      0008DA R   |   6 MMSM1      000856 R
  6 MMSM2      00086A R   |   6 MMSM3      00086C R   |   6 MMSM4      000874 R
  6 MODD       0008F4 R   |   6 MONE       000A5D R   |     MS      =  00002E 
  6 MSEC       0002CE R   |   6 MSMOD      000892 R   |   6 MSTA1      000985 R
  6 MSTAR      000962 R   |     NAFR    =  004804     |   6 NAMEQ      0011B9 R
  6 NAMET      0010CA R   |     NCLKOPT =  004808     |   6 NEGAT      000709 R
  6 NEX1       0003D5 R   |   6 NEXT       0014A6 R   |     NHSECNT =  00480A 
    NMISCOPT=  004806     |     NMISCOPT=  FFFFFFFB     |     NMISCOPT=  FFFFFFFD 
    NMISCOPT=  FFFFFFFC     |     NMISCOPT=  FFFFFFFF     |     NMISCOPT=  FFFFFFFE 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPTBL  =  00487F 
  6 NTIB       0005CE R   |     NUBC    =  004802     |   6 NUFQ       000E40 R
  6 NUFQ1      000E59 R   |   6 NUMBQ      000D57 R   |   6 NUMQ1      000D8B R
  6 NUMQ2      000DBC R   |   6 NUMQ3      000DFE R   |   6 NUMQ4      000E03 R
  6 NUMQ5      000E12 R   |   6 NUMQ6      000E15 R   |   6 NonHandl   000004 R
  6 OFFSET     000674 R   |     OFS     =  000005     |   6 ONE        000A4F R
  6 ONEM       0009E5 R   |   6 ONEP       0009D8 R   |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPTBL   =  00487E     |     OPTIMIZE=  000001 
    OPTION_B=  004800     |     OPTION_E=  00487F     |   6 ORIG       00004B R
  6 ORR        000543 R   |   6 OUTPUT     0003A3 R   |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
  6 OVER       00050D R   |   6 OVERT      001676 R   |     PA      =  000000 
  6 PACKS      000BF2 R   |   6 PAD        000B43 R   |   6 PAREN      00107D R
  6 PARS       000F76 R   |   6 PARS1      000FA1 R   |   6 PARS2      000FCC R
  6 PARS3      000FCF R   |   6 PARS4      000FD8 R   |   6 PARS5      000FFB R
  6 PARS6      001010 R   |   6 PARS7      00101F R   |   6 PARS8      00102E R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]

Symbol Table

  6 PARSE      00103F R   |   6 PAUSE      0002DE R   |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |   6 PDUM1      001854 R
  6 PDUM2      001865 R   |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
  6 PICK       000A9D R   |   6 PII        001A07 R   |     PIN0    =  000000 
    PIN1    =  000001     |     PIN2    =  000002     |     PIN3    =  000003 
    PIN4    =  000004     |     PIN5    =  000005     |     PIN6    =  000006 
    PIN7    =  000007     |   6 PLUS       0006DE R   |   6 PNAM1      00162B R
  6 PRESE      0013AD R   |     PROD1   =  000022     |     PROD2   =  000024 
    PROD3   =  000026     |   6 PROTECTE   0001FF R   |   6 PSTO       001ABA R
  6 PSTOR      000AB4 R   |     PTR16   =  000032     |     PTR8    =  000033 
  6 QBRAN      0003E7 R   |   6 QDUP       00068D R   |   6 QDUP1      000697 R
  6 QKEY       000380 R   |   6 QSTAC      001365 R   |   6 QUERY      001291 R
  6 QUEST      000F68 R   |   6 QUIT       0013CA R   |   6 QUIT1      0013D2 R
  6 QUIT2      0013D5 R   |   6 RAM2EE     001F65 R   |     RAMBASE =  000000 
  6 RAMLAST    000662 R   |     RAM_BASE=  000000     |     RAM_END =  0007FF 
    RAM_SIZE=  000800     |   6 RANDOM     00027C R   |   6 RAT        0004A0 R
  6 RBRAC      0016EA R   |   6 REPEA      00156F R   |   6 RFREE      001F4C R
  6 RFROM      00048D R   |     ROP     =  004800     |   6 ROT        00069E R
  6 ROW2BUF    001F12 R   |     ROWBUFF =  000680     |     RP0     =  00002C 
  6 RPAT       00046A R   |     RPP     =  0007FF     |   6 RPSTO      000477 R
  6 RSHIFT     000A12 R   |   6 RSHIFT1    000A1B R   |   6 RSHIFT4    000A23 R
    RST_SR  =  0050B3     |   6 RT12_2     001A77 R   |   6 SAME1      0010E8 R
  6 SAME2      001111 R   |   6 SAMEQ      0010E0 R   |   6 SCOM1      001660 R
  6 SCOM2      001663 R   |   6 SCOMP      001642 R   |   6 SEED       000263 R
    SEEDX   =  000035     |     SEEDY   =  000037     |   6 SEMIS      001686 R
  6 SETISP     0000D2 R   |   6 SET_RAML   0017CD R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SIGN       000C9E R   |   6 SIGN1      000CAE R
  6 SLASH      0008FE R   |   6 SLMOD      0008E2 R   |   6 SNAME      0015F5 R
    SP0     =  00002A     |   6 SPACE      000E62 R   |   6 SPACS      000E71 R
  6 SPAT       0004C3 R   |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SPP     =  000680     |     SPSAVE  =  000001     |   6 SPSTO      0004D0 R
  6 SQRT10     001A60 R   |   6 SQRT2      001A1E R   |   6 SQRT3      001A35 R
  6 SSMOD      00098E R   |     SSP     =  000001     |     STACK   =  0007FF 
  6 STAR       000957 R   |   6 STASL      00099F R   |   6 STOD       000740 R
  6 STORE      000425 R   |   6 STR        000CCC R   |   6 STRCQ      001477 R
  6 STRQ       0015AE R   |   6 STRQP      000EDF R   |   6 SUBB       000757 R
  6 SWAPP      0004F3 R   |     SWIM_CSR=  007F80     |   6 TAP        0011FB R
  6 TBOOT      00198D R   |   6 TBUF       0005DE R   |     TBUFFBAS=  000680 
  6 TCHAR      000A6E R   |   6 TEMP       0005AF R   |   6 TEVAL      000601 R
  6 TFLASH     0005F0 R   |   6 THENN      001507 R   |   6 TIB        000B54 R
    TIBB    =  000700     |     TIBBASE =  000700     |     TIC     =  000027 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]

Symbol Table

  6 TICK       0013E1 R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
    TIM1_BKR=  00526D     |     TIM1_CCE=  00525C     |     TIM1_CCE=  00525D 
    TIM1_CCM=  005258     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000003 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000004 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]

Symbol Table

    TIM3_CCE=  000000     |     TIM3_CCE=  000001     |     TIM3_CCM=  005325 
    TIM3_CCM=  005326     |     TIM3_CCM=  000000     |     TIM3_CCM=  000004 
    TIM3_CCM=  000003     |     TIM3_CCR=  00532D     |     TIM3_CCR=  00532E 
    TIM3_CCR=  00532F     |     TIM3_CCR=  005330     |     TIM3_CNT=  005328 
    TIM3_CNT=  005329     |     TIM3_CR1=  005320     |     TIM3_CR1=  000007 
    TIM3_CR1=  000000     |     TIM3_CR1=  000003     |     TIM3_CR1=  000001 
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
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   6 TIMEOUTQ   00030E R
  6 TIMER      0002F8 R   |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
    TIM_CR1_=  000006     |     TIM_CR1_=  000005     |     TIM_CR1_=  000004 
    TIM_CR1_=  000003     |     TIM_CR1_=  000001     |     TIM_CR1_=  000002 
  6 TNAM2      0018EA R   |   6 TNAM3      001908 R   |   6 TNAM4      00190E R
  6 TNAME      0018E7 R   |   6 TOFLASH    000333 R   |   6 TOKEN      0010BC R
  6 TOR        0004AC R   |   6 TORAM      000373 R   |     TRUEE   =  00FFFF 
  6 TWOSL      000A2A R   |   6 TYPE1      000E91 R   |   6 TYPE2      000E9D R
  6 TYPES      000E8C R   |   6 Timer4Ha   000009 R   |   6 TrapHand   000000 R
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
    UD4     =  000004     |   6 UDOT       000F32 R   |   6 UDOTR      000F12 R
  6 UEND       000049 R   |     UHLD    =  000012     |     UINN    =  00000A 
    UINTER  =  000010     |     ULAST   =  00001A     |   6 ULES1      0007B4 R
  6 ULESS      00079E R   |   6 UMMOD      000834 R   |   6 UMSTA      00090D R
  6 UNIQ1      0015EC R   |   6 UNIQU      0015CD R   |   6 UNTIL      0014CF R
    UOFFSET =  00001C     |   6 UPDATCP    001B58 R   |   6 UPDATLAS   001B2F R
  6 UPDATPTR   002035 R   |   6 UPDATRUN   001B47 R   |   6 UPDATVP    001B6F R
  6 UPL1       000584 R   |   6 UPLUS      00056D R   |     UPP     =  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]

Symbol Table

    URLAST  =  000020     |     UTFLASH =  00001E     |     UTIB    =  00000E 
    UTMP    =  000008     |   6 UTYP1      001824 R   |   6 UTYP2      001833 R
  6 UTYPE      00181F R   |     UVP     =  000016     |   6 UZERO      00002F R
  6 VARIA      00179A R   |     VAR_BASE=  000080     |     VAR_TOP =  0007BF 
    VER     =  000003     |   6 VPP        000631 R   |     VSIZE   =  000006 
    WANT_DEB=  000000     |     WANT_MAT=  000001     |     WANT_SEE=  000000 
  6 WHILE      001555 R   |   6 WITHI      000819 R   |   6 WORDD      0010A8 R
  6 WORDS      001944 R   |   6 WORS1      00194A R   |   6 WORS2      001966 R
  6 WR_BYTE    001C12 R   |   6 WR_ROW     001D5E R   |   6 WR_WORD    001C2F R
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     X4_FLASH=  00BFFF 
    X4_FLASH=  004000     |     X6_FLASH=  00FFFF     |     X6_FLASH=  008000 
  6 XORR       000558 R   |     XTEMP   =  000022     |     YTEMP   =  000024 
  6 ZERO       000A44 R   |   6 ZL1        000525 R   |   6 ZLESS      00051C R
  6 app_spac   002100 R   |   6 block_er   001CC8 R   |   6 clear_ra   00001D R
  6 clock_in   000066 R   |   6 copy_buf   001D1B R   |   6 copy_buf   001D39 R
  6 copy_pro   001D39 R   |     da      =  000002     |     db      =  000003 
    dc      =  000000     |     dd      =  000001     |   6 erase_fl   001CE4 R
  6 fmove_do   00201E R   |   6 lock       001BE6 R   |   6 main       00001A R
  6 next_row   001FDE R   |   6 no_move    002025 R   |   6 pristine   001DAE R
  6 proceed_   001CE7 R   |   6 reboot     000325 R   |   6 reset_ve   001E12 R
  6 row_eras   001CAB R   |   6 row_eras   001CF8 R   |   6 row_eras   001D1B R
  6 set_opti   001D88 R   |   6 set_vect   001EA6 R   |   6 uart2_in   000078 R
  6 unlock     001BC2 R   |   6 unlock_e   001B84 R   |   6 unlock_f   001BA3 R

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

