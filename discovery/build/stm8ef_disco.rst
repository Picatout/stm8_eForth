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
      008080 CD 99 32         [ 4]  238         call DOTS 
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
      0080B9 93 6D                  287         .word      INTER   ;'EVAL
      0080BB 00 00                  288         .word      0       ;HLD
      0080BD A0 F5                  289         .word      LASTN  ;CNTXT pointer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      0080BF 00 80                  290         .word      VAR_BASE   ;variables free space pointer 
      0080C1 A1 80                  291         .word      app_space ; FLASH free space pointer 
      0080C3 A0 F5                  292         .word      LASTN   ;LAST
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



      00812F CC 9A 27         [ 2]  344         jp  COLD   ;default=MN1
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
      008175 CD 85 83         [ 4]  405         call OVER ; ( level reg lshift rval lshift -- )
      008178 CD 84 34         [ 4]  406         call DOLIT 
      00817B 00 03                  407         .word 3
      00817D CD 85 69         [ 4]  408         call SWAPP  ; ( level reg lshift rval 3 lshift )
      008180 CD 8A 6C         [ 4]  409         call LSHIFT ; creat slot mask 
      008183 CD 87 6E         [ 4]  410         call INVER  ; ( level reg lshift rval mask )
      008186 CD 85 A5         [ 4]  411         call ANDD ; ( level reg lshift slot_masked )
      008189 CD 85 22         [ 4]  412         call TOR  ; ( level reg lshift -- R: slot_masked )
      00818C CD 87 14         [ 4]  413         call ROT  ; ( reg lshift level )
      00818F CD 85 69         [ 4]  414         call SWAPP ; ( reg level lshift )
      008192 CD 8A 6C         [ 4]  415         call LSHIFT  ; ( reg slot_level -- )
      008195 CD 85 03         [ 4]  416         call RFROM ; ( reg slot_level masked_val )
      008198 CD 85 B9         [ 4]  417         call ORR   ; ( reg updated_rval )
      00819B CD 85 69         [ 4]  418         call SWAPP 
      00819E CD 84 BF         [ 4]  419         call CSTOR
                                    420 
                                    421 ; sélectionne l'application 
                                    422 ; qui démarre automatique lors 
                                    423 ; d'un COLD start 
      0081A1 81 4A                  424         .word LINK 
                           000123   425         LINK=.
      0081A3 07                     426         .byte 7
      0081A4 41 55 54 4F 52 55 4E   427         .ascii "AUTORUN"
      0081AB                        428 AUTORUN:
      0081AB CD 91 32         [ 4]  429         call TOKEN 
      0081AE CD 85 59         [ 4]  430         call DUPP 
      0081B1 CD 84 67         [ 4]  431         call QBRAN 
      0081B4 82 8D                  432         .word FORGET2
      0081B6 CD 92 2F         [ 4]  433         call NAMEQ
      0081B9 CD 87 03         [ 4]  434         call QDUP 
      0081BC CD 84 67         [ 4]  435         call QBRAN 
      0081BF 82 8D                  436         .word FORGET2
      0081C1 CD 85 4F         [ 4]  437         call DROP 
      0081C4 1D 00 02         [ 2]  438         subw x,#CELLL 
      0081C7 90 AE 40 02      [ 2]  439         ldw y,#APP_RUN 
      0081CB FF               [ 2]  440         ldw (x),y 
      0081CC CC 9D 24         [ 2]  441         jp EE_STORE 
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
      0081D8 CD 91 32         [ 4]  452         call TOKEN
      0081DB CD 85 59         [ 4]  453         call DUPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      0081DE CD 84 67         [ 4]  454         call QBRAN 
      0081E1 82 8D                  455         .word FORGET2
      0081E3 CD 92 2F         [ 4]  456         call NAMEQ ; ( a -- ca na | a F )
      0081E6 CD 87 03         [ 4]  457         call QDUP 
      0081E9 CD 84 67         [ 4]  458         call QBRAN 
      0081EC 82 8D                  459         .word FORGET2
                                    460 ; only forget users words 
      0081EE CD 85 59         [ 4]  461         call DUPP ; ( ca na na )
      0081F1 CD 84 34         [ 4]  462         call DOLIT 
      0081F4 A1 80                  463         .word app_space 
      0081F6 CD 85 69         [ 4]  464         call SWAPP 
      0081F9 CD 88 14         [ 4]  465         call  ULESS 
      0081FC CD 84 67         [ 4]  466         call QBRAN 
      0081FF 82 4F                  467         .word FORGET6 
                                    468 ; ( ca na -- )        
                                    469 ;reset ivec with address >= ca
      008201 CD 85 69         [ 4]  470         call SWAPP ; ( na ca -- ) 
      008204 CD 9E E5         [ 4]  471         call CHKIVEC ; ( na -- ) 
                                    472 ; start at LAST and link back to na 
                                    473 ; if variable found reset VP at that point.
      008207                        474 FORGET1:
      008207 CD 86 C5         [ 4]  475         call LAST 
      00820A CD 84 B2         [ 4]  476         call AT 
      00820D CD 85 59         [ 4]  477         call DUPP  ; ( -- na last last )
      008210 CD 82 A3         [ 4]  478         call FREEVAR ; ( -- na last )
      008213 CD 85 59         [ 4]  479         call DUPP 
      008216 CD 84 34         [ 4]  480         call DOLIT 
      008219 00 02                  481         .word 2 
      00821B CD 87 CD         [ 4]  482         call SUBB ; ( na last -- na last lfa ) link address 
      00821E CD 84 B2         [ 4]  483         call AT 
      008221 CD 85 59         [ 4]  484         call DUPP ; ( -- na last a a )
      008224 CD 86 99         [ 4]  485         call CNTXT 
      008227 CD 84 9B         [ 4]  486         call STORE
      00822A CD 86 C5         [ 4]  487         call LAST  
      00822D CD 84 9B         [ 4]  488         call STORE ; ( --  na last )
      008230 CD 85 83         [ 4]  489         call OVER 
      008233 CD 87 F5         [ 4]  490         call EQUAL ; ( na last na -- na T|F ) 
      008236 CD 84 67         [ 4]  491         call QBRAN 
      008239 82 07                  492         .word FORGET1 
                                    493 ; ( na -- )
      00823B CD 84 34         [ 4]  494         call DOLIT 
      00823E 00 02                  495         .word 2 
      008240 CD 87 CD         [ 4]  496         call SUBB 
      008243 CD 86 B5         [ 4]  497         call CPP 
      008246 CD 84 9B         [ 4]  498         call STORE  
      008249 CD 9B E6         [ 4]  499         call UPDATCP 
      00824C CC 9B BD         [ 2]  500         jp UPDATLAST 
      00824F                        501 FORGET6: ; tried to forget a RAM or system word 
                                    502 ; ( ca na -- )
      00824F 1D 00 02         [ 2]  503         subw x,#CELLL 
      008252 90 BE 2A         [ 2]  504         ldw y,SP0 
      008255 FF               [ 2]  505         ldw (x),y  
      008256 CD 88 14         [ 4]  506         call ULESS
      008259 CD 84 67         [ 4]  507         call QBRAN 
      00825C 82 7F                  508         .word PROTECTED 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      00825E CD 93 3B         [ 4]  509         call ABORQ 
      008261 1D                     510         .byte 29
      008262 20 46 6F 72 20 52 41   511         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      00827F                        512 PROTECTED:
      00827F CD 93 3B         [ 4]  513         call ABORQ
      008282 0A                     514         .byte 10
      008283 20 50 72 6F 74 65 63   515         .ascii " Protected"
             74 65 64
      00828D                        516 FORGET2: ; no name or not found in dictionary 
      00828D CD 93 3B         [ 4]  517         call ABORQ
      008290 05                     518         .byte 5
      008291 20 77 68 61 74         519         .ascii " what"
      008296                        520 FORGET4:
      008296 CC 85 4F         [ 2]  521         jp DROP 
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
      0082A3 CD 85 59         [ 4]  534         call DUPP ; ( na na -- )
      0082A6 CD 84 D0         [ 4]  535         CALL CAT  ; ( na c -- )
      0082A9 CD 8A 4E         [ 4]  536         call ONEP ;
      0082AC CD 87 54         [ 4]  537         CALL PLUS ; ( na c+1 -- ca ) 
      0082AF CD 8A 4E         [ 4]  538         call ONEP ; ( ca+ -- ) to get routne address 
      0082B2 CD 85 59         [ 4]  539         call DUPP ; ( ca+ ca+ -- )
      0082B5 CD 84 B2         [ 4]  540         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082B8 CD 84 34         [ 4]  541         call DOLIT 
      0082BB 86 06                  542         .word DOVAR ; if routine address is DOVAR then variable 
      0082BD CD 87 F5         [ 4]  543         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082C0 CD 84 67         [ 4]  544         call QBRAN 
      0082C3 82 D9                  545         .word FREEVAR4 
      0082C5 CD 84 34         [ 4]  546         call DOLIT 
      0082C8 00 02                  547         .word 2 
      0082CA CD 87 54         [ 4]  548         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082CD CD 84 B2         [ 4]  549         call AT 
      0082D0 CD 86 A7         [ 4]  550         call VPP   
      0082D3 CD 84 9B         [ 4]  551         call STORE 
      0082D6 CC 9B FD         [ 2]  552         jp UPDATVP 
      0082D9                        553 FREEVAR4: ; not variable
      0082D9 CC 85 4F         [ 2]  554         jp  DROP 
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
      0083B3 CD 86 D8         [ 4]  714         call RAMLAST 
      0083B6 CD 84 B2         [ 4]  715         call AT 
      0083B9 CD 87 03         [ 4]  716         call QDUP 
      0083BC CD 84 67         [ 4]  717         call QBRAN
      0083BF 83 E2                  718         .word 1$
      0083C1 CD 93 3B         [ 4]  719         call ABORQ 
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
                           000000   849 .else 
                                    850 ;       EXIT    ( -- )
                                    851 ;       Terminate a colon definition.
                                    852         .word      LINK
                                    853 LINK = .
                                    854         .byte      4
                                    855         .ascii     "EXIT"
                                    856 EXIT:
                                    857         POPW Y
                                    858         RET
                                    859 .endif 
                                    860 
                                    861 ;       !       ( w a -- )
                                    862 ;       Pop  data stack to memory.
      008467 90 93                  863         .word      LINK
                           000419   864 LINK = .
      008469 1C                     865         .byte      1
      00846A 00                     866         .ascii     "!"
      00041B                        867 STORE:
      00846B 02 90            [ 1]  868         LDW Y,X
      00846D FE 27            [ 2]  869         LDW Y,(Y)    ;Y=a
      00846F 0E 90 85         [ 2]  870         LDW YTEMP,Y
      008472 90 EC            [ 1]  871         LDW Y,X
      008474 02 84 5F         [ 2]  872         LDW Y,(2,Y)
      008477 46 42 52         [ 5]  873         LDW [YTEMP],Y ;store w at a
      00847A 41 4E 43         [ 2]  874         ADDW X,#4 ; DDROP 
      00847D 48               [ 4]  875         RET     
                                    876 
                                    877 ;       @       ( a -- w )
                                    878 ;       Push memory location to stack.
      00847E 04 19                  879         .word      LINK
                           000430   880 LINK	= 	.
      00847E 90                     881         .byte    1
      00847F 85                     882         .ascii	"@"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      000432                        883 AT:
      008480 90 FE            [ 1]  884         LDW Y,X     ;Y = a
      008482 90 FC            [ 2]  885         LDW Y,(Y)   ; address 
      008484 84 77            [ 2]  886         LDW Y,(Y)   ; value 
      008486 07               [ 2]  887         LDW (X),Y ;w = @Y
      008487 45               [ 4]  888         RET     
                                    889 
                                    890 ;       C!      ( c b -- )
                                    891 ;       Pop  data stack to byte memory.
      008488 58 45                  892         .word      LINK
                           00043C   893 LINK	= .
      00848A 43                     894         .byte      2
      00848B 55 54                  895         .ascii     "C!"
      00043F                        896 CSTOR:
      00848D 45 93            [ 1]  897         LDW Y,X
      00848E 90 FE            [ 2]  898 	LDW Y,(Y)    ;Y=b
      00848E 90 93            [ 1]  899         LD A,(3,X)    ;D = c
      008490 1C 00            [ 1]  900         LD  (Y),A     ;store c at b
      008492 02 90 FE         [ 2]  901 	ADDW X,#4 ; DDROP 
      008495 90               [ 4]  902         RET     
                                    903 
                                    904 ;       C@      ( b -- c )
                                    905 ;       Push byte in memory to  stack.
      008496 FC 84                  906         .word      LINK
                           00044D   907 LINK	= 	.
      008498 86                     908         .byte      2
      008499 01 21                  909         .ascii     "C@"
      00849B                        910 CAT:
      00849B 90 93            [ 1]  911         LDW Y,X     ;Y=b
      00849D 90 FE            [ 2]  912         LDW Y,(Y)
      00849F 90 BF            [ 1]  913         LD A,(Y)
      0084A1 24 90            [ 1]  914         LD (1,X),A
      0084A3 93               [ 1]  915         CLR (X)
      0084A4 90               [ 4]  916         RET     
                                    917 
                                    918 ;       RP@     ( -- a )
                                    919 ;       Push current RP to data stack.
      0084A5 EE 02                  920         .word      LINK
                           00045C   921 LINK	= .
      0084A7 91                     922         .byte      3
      0084A8 CF 24 1C               923         .ascii     "RP@"
      000460                        924 RPAT:
      0084AB 00 04            [ 1]  925         LDW Y,SP    ;save return addr
      0084AD 81 84 99         [ 2]  926         SUBW X,#2
      0084B0 01               [ 2]  927         LDW (X),Y
      0084B1 40               [ 4]  928         RET     
                                    929 
                                    930 ;       RP!     ( a -- )
                                    931 ;       Set  return stack pointer.
      0084B2 04 5C                  932         .word      LINK
                           000469   933 LINK	= 	. 
      0084B2 90                     934 	.byte      COMPO+3
      0084B3 93 90 FE               935         .ascii     "RP!"
      00046D                        936 RPSTO:
      0084B6 90 FE            [ 2]  937         POPW Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0084B8 FF 81 84         [ 2]  938         LDW YTEMP,Y
      0084BB B0 02            [ 1]  939         LDW Y,X
      0084BD 43 21            [ 2]  940         LDW Y,(Y)
      0084BF 90 94            [ 1]  941         LDW SP,Y
      0084BF 90 93 90         [ 2]  942         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      0084C2 FE E6 03         [ 5]  943         JP [YTEMP]
                                    944 
                                    945 ;       R>      ( -- w )
                                    946 ;       Pop return stack to data stack.
      0084C5 90 F7                  947         .word      LINK
                           000480   948 LINK	= 	. 
      0084C7 1C                     949 	.byte      COMPO+2
      0084C8 00 04                  950         .ascii     "R>"
      000483                        951 RFROM:
      0084CA 81 84            [ 2]  952         POPW Y    ;save return addr
      0084CC BC 02 43         [ 2]  953         LDW YTEMP,Y
      0084CF 40 85            [ 2]  954         POPW Y
      0084D0 1D 00 02         [ 2]  955         SUBW X,#2
      0084D0 90               [ 2]  956         LDW (X),Y
      0084D1 93 90 FE         [ 5]  957         JP [YTEMP]
                                    958 
                                    959 ;       R@      ( -- w )
                                    960 ;       Copy top of return stack to stack.
      0084D4 90 F6                  961         .word      LINK
                           000493   962 LINK	= 	. 
      0084D6 E7                     963         .byte      2
      0084D7 01 7F                  964         .ascii     "R@"
      000496                        965 RAT:
      0084D9 81 84            [ 2]  966         ldw y,(3,sp)
      0084DB CD 03 52         [ 2]  967         subw x,#CELLL 
      0084DE 50               [ 2]  968         ldw (x),y 
      0084DF 40               [ 4]  969         ret 
                                    970 
                                    971 ;       >R      ( w -- )
                                    972 ;       Push data stack to return stack.
      0084E0 04 93                  973         .word      LINK
                           00049F   974 LINK	= 	. 
      0084E0 90                     975 	.byte      COMPO+2
      0084E1 96 1D                  976         .ascii     ">R"
      0004A2                        977 TOR:
      0084E3 00 02            [ 2]  978         POPW Y    ;save return addr
      0084E5 FF 81 84         [ 2]  979         LDW YTEMP,Y
      0084E8 DC 43            [ 1]  980         LDW Y,X
      0084EA 52 50            [ 2]  981         LDW Y,(Y)
      0084EC 21 89            [ 2]  982         PUSHW Y    ;restore return addr
      0084ED 1C 00 02         [ 2]  983         ADDW X,#2
      0084ED 90 85 90         [ 5]  984         JP [YTEMP]
                                    985 
                                    986 ;       SP@     ( -- a )
                                    987 ;       Push current stack pointer.
      0084F0 BF 24                  988         .word      LINK
                           0004B5   989 LINK	= 	. 
      0084F2 90                     990         .byte      3
      0084F3 93 90 FE               991         .ascii     "SP@"
      0004B9                        992 SPAT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      0084F6 90 94            [ 1]  993 	LDW Y,X
      0084F8 1C 00 02         [ 2]  994         SUBW X,#2
      0084FB 92               [ 2]  995 	LDW (X),Y
      0084FC CC               [ 4]  996         RET     
                                    997 
                                    998 ;       SP!     ( a -- )
                                    999 ;       Set  data stack pointer.
      0084FD 24 84                 1000         .word      LINK
                           0004C2  1001 LINK	= 	. 
      0084FF E9                    1002         .byte      3
      008500 42 52 3E              1003         .ascii     "SP!"
      008503                       1004 SPSTO:
      008503 90               [ 2] 1005         LDW     X,(X)     ;X = a
      008504 85               [ 4] 1006         RET     
                                   1007 
                                   1008 ;       DROP    ( w -- )
                                   1009 ;       Discard top stack item.
      008505 90 BF                 1010         .word      LINK
                           0004CA  1011 LINK	= 	. 
      008507 24                    1012         .byte      4
      008508 90 85 1D 00           1013         .ascii     "DROP"
      0004CF                       1014 DROP:
      00850C 02 FF 92         [ 2] 1015         ADDW X,#2     
      00850F CC               [ 4] 1016         RET     
                                   1017 
                                   1018 ;       DUP     ( w -- w w )
                                   1019 ;       Duplicate  top stack item.
      008510 24 85                 1020         .word      LINK
                           0004D5  1021 LINK	= 	. 
      008512 00                    1022         .byte      3
      008513 02 52 40              1023         .ascii     "DUP"
      008516                       1024 DUPP:
      008516 16 03            [ 1] 1025 	LDW Y,X
      008518 1D 00 02         [ 2] 1026         SUBW X,#2
      00851B FF 81            [ 2] 1027 	LDW Y,(Y)
      00851D 85               [ 2] 1028 	LDW (X),Y
      00851E 13               [ 4] 1029         RET     
                                   1030 
                                   1031 ;       SWAP    ( w1 w2 -- w2 w1 )
                                   1032 ;       Exchange top two stack items.
      00851F 42 3E                 1033         .word      LINK
                           0004E4  1034 LINK	= 	. 
      008521 52                    1035         .byte      4
      008522 53 57 41 50           1036         .ascii     "SWAP"
      0004E9                       1037 SWAPP:
      008522 90 85            [ 1] 1038         LDW Y,X
      008524 90 BF            [ 2] 1039         LDW Y,(Y)
      008526 24 90 93         [ 2] 1040         LDW YTEMP,Y
      008529 90 FE            [ 1] 1041         LDW Y,X
      00852B 90 89 1C         [ 2] 1042         LDW Y,(2,Y)
      00852E 00               [ 2] 1043         LDW (X),Y
      00852F 02 92 CC         [ 2] 1044         LDW Y,YTEMP
      008532 24 85            [ 2] 1045         LDW (2,X),Y
      008534 1F               [ 4] 1046         RET     
                                   1047 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                   1048 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                   1049 ;       Copy second stack item to top.
      008535 03 53                 1050         .word      LINK
                           0004FE  1051 LINK	= . 
      008537 50                    1052         .byte      4
      008538 40 56 45 52           1053         .ascii     "OVER"
      008539                       1054 OVER:
      008539 90 93 1D         [ 2] 1055         SUBW X,#2
      00853C 00 02            [ 1] 1056         LDW Y,X
      00853E FF 81 85         [ 2] 1057         LDW Y,(4,Y)
      008541 35               [ 2] 1058         LDW (X),Y
      008542 03               [ 4] 1059         RET     
                                   1060 
                                   1061 ;       0<      ( n -- t )
                                   1062 ;       Return true if n is negative.
      008543 53 50                 1063         .word      LINK
                           00050F  1064 LINK	= . 
      008545 21                    1065         .byte      2
      008546 30 3C                 1066         .ascii     "0<"
      000512                       1067 ZLESS:
      008546 FE 81            [ 1] 1068         LD A,#0xFF
      008548 85 42            [ 1] 1069         LDW Y,X
      00854A 04 44            [ 2] 1070         LDW Y,(Y)
      00854C 52 4F            [ 1] 1071         JRMI     ZL1
      00854E 50               [ 1] 1072         CLR A   ;false
      00854F F7               [ 1] 1073 ZL1:    LD     (X),A
      00854F 1C 00            [ 1] 1074         LD (1,X),A
      008551 02               [ 4] 1075 	RET     
                                   1076 
                                   1077 ;       AND     ( w w -- w )
                                   1078 ;       Bitwise AND.
      008552 81 85                 1079         .word      LINK
                           000521  1080 LINK	= . 
      008554 4A                    1081         .byte      3
      008555 03 44 55              1082         .ascii     "AND"
      000525                       1083 ANDD:
      008558 50               [ 1] 1084         LD  A,(X)    ;D=w
      008559 E4 02            [ 1] 1085         AND A,(2,X)
      008559 90 93            [ 1] 1086         LD (2,X),A
      00855B 1D 00            [ 1] 1087         LD A,(1,X)
      00855D 02 90            [ 1] 1088         AND A,(3,X)
      00855F FE FF            [ 1] 1089         LD (3,X),A
      008561 81 85 55         [ 2] 1090         ADDW X,#2
      008564 04               [ 4] 1091         RET
                                   1092 
                                   1093 ;       OR      ( w w -- w )
                                   1094 ;       Bitwise inclusive OR.
      008565 53 57                 1095         .word      LINK
                           000536  1096 LINK = . 
      008567 41                    1097         .byte      2
      008568 50 52                 1098         .ascii     "OR"
      008569                       1099 ORR:
      008569 90               [ 1] 1100         LD A,(X)    ;D=w
      00856A 93 90            [ 1] 1101         OR A,(2,X)
      00856C FE 90            [ 1] 1102         LD (2,X),A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      00856E BF 24            [ 1] 1103         LD A,(1,X)
      008570 90 93            [ 1] 1104         OR A,(3,X)
      008572 90 EE            [ 1] 1105         LD (3,X),A
      008574 02 FF 90         [ 2] 1106         ADDW X,#2
      008577 BE               [ 4] 1107         RET
                                   1108 
                                   1109 ;       XOR     ( w w -- w )
                                   1110 ;       Bitwise exclusive OR.
      008578 24 EF                 1111         .word      LINK
                           00054A  1112 LINK	= . 
      00857A 02                    1113         .byte      3
      00857B 81 85 64              1114         .ascii     "XOR"
      00054E                       1115 XORR:
      00857E 04               [ 1] 1116         LD A,(X)    ;D=w
      00857F 4F 56            [ 1] 1117         XOR A,(2,X)
      008581 45 52            [ 1] 1118         LD (2,X),A
      008583 E6 01            [ 1] 1119         LD A,(1,X)
      008583 1D 00            [ 1] 1120         XOR A,(3,X)
      008585 02 90            [ 1] 1121         LD (3,X),A
      008587 93 90 EE         [ 2] 1122         ADDW X,#2
      00858A 04               [ 4] 1123         RET
                                   1124 
                                   1125 ;       UM+     ( u u -- udsum )
                                   1126 ;       Add two unsigned single
                                   1127 ;       and return a double sum.
      00858B FF 81                 1128         .word      LINK
                           00055F  1129 LINK	= . 
      00858D 85                    1130         .byte      3
      00858E 7E 02 30              1131         .ascii     "UM+"
      000563                       1132 UPLUS:
      008591 3C 01            [ 1] 1133         LD A,#1
      008592 90 93            [ 1] 1134         LDW Y,X
      008592 A6 FF 90         [ 2] 1135         LDW Y,(2,Y)
      008595 93 90 FE         [ 2] 1136         LDW YTEMP,Y
      008598 2B 01            [ 1] 1137         LDW Y,X
      00859A 4F F7            [ 2] 1138         LDW Y,(Y)
      00859C E7 01 81 85      [ 2] 1139         ADDW Y,YTEMP
      0085A0 8F 03            [ 2] 1140         LDW (2,X),Y
      0085A2 41 4E            [ 1] 1141         JRC     UPL1
      0085A4 44               [ 1] 1142         CLR A
      0085A5 E7 01            [ 1] 1143 UPL1:   LD     (1,X),A
      0085A5 F6               [ 1] 1144         CLR (X)
      0085A6 E4               [ 4] 1145         RET
                                   1146 
                                   1147 ;; System and user variables
                                   1148 
                                   1149 ;       doVAR   ( -- a )
                                   1150 ;       Code for VARIABLE and CREATE.
      0085A7 02 E7                 1151         .word      LINK
                           000580  1152 LINK	= . 
      0085A9 02                    1153 	.byte      COMPO+5
      0085AA E6 01 E4 03 E7        1154         .ascii     "DOVAR"
      000586                       1155 DOVAR:
      0085AF 03 1C 00         [ 2] 1156 	SUBW X,#2
      0085B2 02 81            [ 2] 1157         POPW Y    ;get return addr (pfa)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      0085B4 85 A1            [ 2] 1158         LDW Y,(Y) ; indirect address 
      0085B6 02               [ 2] 1159         LDW (X),Y    ;push on stack
      0085B7 4F               [ 4] 1160         RET     ;go to RET of EXEC
                                   1161 
                                   1162 ;       BASE    ( -- a )
                                   1163 ;       Radix base for numeric I/O.
      0085B8 52 80                 1164         .word      LINK        
                           000591  1165 LINK = . 
      0085B9 04                    1166         .byte      4
      0085B9 F6 EA 02 E7           1167         .ascii     "BASE"
      000596                       1168 BASE:
      0085BD 02 E6 01 EA      [ 2] 1169 	LDW Y,#UBASE 
      0085C1 03 E7 03         [ 2] 1170 	SUBW X,#2
      0085C4 1C               [ 2] 1171         LDW (X),Y
      0085C5 00               [ 4] 1172         RET
                                   1173 
                                   1174 ;       tmp     ( -- a )
                                   1175 ;       A temporary storage.
      0085C6 02 81                 1176         .word      LINK
                                   1177         
                           0005A1  1178 LINK = . 
      0085C8 85                    1179 	.byte      3
      0085C9 B6 03 58              1180         .ascii     "TMP"
      0005A5                       1181 TEMP:
      0085CC 4F 52 00 08      [ 2] 1182 	LDW Y,#UTMP
      0085CE 1D 00 02         [ 2] 1183 	SUBW X,#2
      0085CE F6               [ 2] 1184         LDW (X),Y
      0085CF E8               [ 4] 1185         RET
                                   1186 
                                   1187 ;       >IN     ( -- a )
                                   1188 ;        Hold parsing pointer.
      0085D0 02 E7                 1189         .word      LINK
                           0005B0  1190 LINK = . 
      0085D2 02                    1191         .byte      3
      0085D3 E6 01 E8              1192         .ascii    ">IN"
      0005B4                       1193 INN:
      0085D6 03 E7 03 1C      [ 2] 1194 	LDW Y,#UINN 
      0085DA 00 02 81         [ 2] 1195 	SUBW X,#2
      0085DD 85               [ 2] 1196         LDW (X),Y
      0085DE CA               [ 4] 1197         RET
                                   1198 
                                   1199 ;       #TIB    ( -- a )
                                   1200 ;       Count in terminal input buffer.
      0085DF 03 55                 1201         .word      LINK
                           0005BF  1202 LINK = . 
      0085E1 4D                    1203         .byte      4
      0085E2 2B 54 49 42           1204         .ascii     "#TIB"
      0085E3                       1205 NTIB:
      0085E3 A6 01 90 93      [ 2] 1206 	LDW Y,#UCTIB 
      0085E7 90 EE 02         [ 2] 1207 	SUBW X,#2
      0085EA 90               [ 2] 1208         LDW (X),Y
      0085EB BF               [ 4] 1209         RET
                                   1210 
                                   1211 ;       TBUF ( -- a )
                                   1212 ;       address of 128 bytes transaction buffer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      0085EC 24 90                 1213         .word LINK 
                           0005CF  1214         LINK=.
      0085EE 93                    1215         .byte 4 
      0085EF 90 FE 72 B9           1216         .ascii "TBUF"
      0005D4                       1217 TBUF:
      0085F3 00 24 EF 02      [ 2] 1218         ldw y,#ROWBUFF
      0085F7 25 01 4F         [ 2] 1219         subw x,#CELLL
      0085FA E7               [ 2] 1220         ldw (x),y 
      0085FB 01               [ 4] 1221         ret 
                                   1222 
                                   1223 ; systeme variable 
                                   1224 ; compilation destination 
                                   1225 ; TFLASH ( -- A )
      0085FC 7F 81                 1226         .word LINK 
                           0005DF  1227         LINK=.
      0085FE 85                    1228         .byte 6 
      0085FF DF 45 44 4F 56 41     1229         .ascii "TFLASH"         
      0005E6                       1230 TFLASH:
      008605 52 00 02         [ 2] 1231         subw x,#CELLL 
      008606 90 AE 00 1E      [ 2] 1232         ldw y,#UTFLASH
      008606 1D               [ 2] 1233         ldw (x),y 
      008607 00               [ 4] 1234         ret 
                                   1235 
                                   1236 ;       "EVAL   ( -- a )
                                   1237 ;       Execution vector of EVAL.
      008608 02 90                 1238         .word      LINK
                           0005F1  1239 LINK = . 
      00860A 85                    1240         .byte      5
      00860B 90 FE FF 81 86        1241         .ascii     "'EVAL"
      0005F7                       1242 TEVAL:
      008610 00 04 42 41      [ 2] 1243 	LDW Y,#UINTER 
      008614 53 45 02         [ 2] 1244 	SUBW X,#2
      008616 FF               [ 2] 1245         LDW (X),Y
      008616 90               [ 4] 1246         RET
                                   1247 
                                   1248 ;       HLD     ( -- a )
                                   1249 ;       Hold a pointer of output string.
      008617 AE 00                 1250         .word      LINK
                           000602  1251 LINK = . 
      008619 06                    1252         .byte      3
      00861A 1D 00 02              1253         .ascii     "HLD"
      000606                       1254 HLD:
      00861D FF 81 86 11      [ 2] 1255 	LDW Y,#UHLD 
      008621 03 54 4D         [ 2] 1256 	SUBW X,#2
      008624 50               [ 2] 1257         LDW (X),Y
      008625 81               [ 4] 1258         RET
                                   1259 
                                   1260 ;       CONTEXT ( -- a )
                                   1261 ;       Start vocabulary search.
      008625 90 AE                 1262         .word      LINK
                           000611  1263 LINK = . 
      008627 00                    1264         .byte      7
      008628 08 1D 00 02 FF 81 86  1265         .ascii     "CONTEXT"
      000619                       1266 CNTXT:
      00862F 21 03 3E 49      [ 2] 1267 	LDW Y,#UCNTXT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      008633 4E 00 02         [ 2] 1268 	SUBW X,#2
      008634 FF               [ 2] 1269         LDW (X),Y
      008634 90               [ 4] 1270         RET
                                   1271 
                                   1272 ;       VP      ( -- a )
                                   1273 ;       Point to top of variables
      008635 AE 00                 1274         .word      LINK
                           000624  1275 LINK = . 
      008637 0A                    1276         .byte      2
      008638 1D 00                 1277         .ascii     "VP"
      000627                       1278 VPP:
      00863A 02 FF 81 86      [ 2] 1279 	LDW Y,#UVP 
      00863E 30 04 23         [ 2] 1280 	SUBW X,#2
      008641 54               [ 2] 1281         LDW (X),Y
      008642 49               [ 4] 1282         RET
                                   1283 
                                   1284 ;       CP    ( -- a )
                                   1285 ;       Pointer to top of FLASH 
      008643 42 24                 1286         .word LINK 
                           000632  1287         LINK=.
      008644 02                    1288         .byte 2 
      008644 90 AE                 1289         .ascii "CP"
      000635                       1290 CPP: 
      008646 00 0C 1D 00      [ 2] 1291         ldw y,#UCP 
      00864A 02 FF 81         [ 2] 1292         subw x,#CELLL 
      00864D 86               [ 2] 1293         ldw (x),y 
      00864E 3F               [ 4] 1294         ret                
                                   1295 
                                   1296 ;       LAST    ( -- a )
                                   1297 ;       Point to last name in dictionary.
      00864F 04 54                 1298         .word      LINK
                           000640  1299 LINK = . 
      008651 42                    1300         .byte      4
      008652 55 46 53 54           1301         .ascii     "LAST"
      008654                       1302 LAST:
      008654 90 AE 06 80      [ 2] 1303 	LDW Y,#ULAST 
      008658 1D 00 02         [ 2] 1304 	SUBW X,#2
      00865B FF               [ 2] 1305         LDW (X),Y
      00865C 81               [ 4] 1306         RET
                                   1307 
                                   1308 ; address of system variable URLAST 
                                   1309 ;       RAMLAST ( -- a )
                                   1310 ; RAM dictionary context 
      00865D 86 4F                 1311         .word LINK 
                           000650  1312         LINK=. 
      00865F 06                    1313         .byte 7  
      008660 54 46 4C 41 53 48 54  1314         .ascii "RAMLAST" 
      008666                       1315 RAMLAST: 
      008666 1D 00 02 90      [ 2] 1316         ldw y,#URLAST 
      00866A AE 00 1E         [ 2] 1317         subw x,#CELLL 
      00866D FF               [ 2] 1318         ldw (x),y 
      00866E 81               [ 4] 1319         ret 
                                   1320 
                                   1321 ; OFFSET ( -- a )
                                   1322 ; address of system variable OFFSET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      00866F 86 5F                 1323         .word LINK 
                           000663  1324         LINK=.
      008671 05                    1325         .byte 6
      008672 27 45 56 41 4C 54     1326         .ascii "OFFSET" 
      008677                       1327 OFFSET: 
      008677 90 AE 00         [ 2] 1328         subw x,#CELLL
      00867A 10 1D 00 02      [ 2] 1329         ldw y,#UOFFSET 
      00867E FF               [ 2] 1330         ldw (x),y 
      00867F 81               [ 4] 1331         ret 
                                   1332 
                                   1333 ; adjust jump address adding OFFSET
                                   1334 ; ADR-ADJ ( a -- a+offset )
      000673                       1335 ADRADJ: 
      008680 86 71 03         [ 4] 1336         call OFFSET 
      008683 48 4C 44         [ 4] 1337         call AT 
      008686 CC 06 D4         [ 2] 1338         jp PLUS 
                                   1339 
                                   1340 
                                   1341 ;; Common functions
                                   1342 
                                   1343 ;       ?DUP    ( w -- w w | 0 )
                                   1344 ;       Dup tos if its is not zero.
      008686 90 AE                 1345         .word      LINK
                           00067E  1346 LINK = . 
      008688 00                    1347         .byte      4
      008689 12 1D 00 02           1348         .ascii     "?DUP"
      000683                       1349 QDUP:
      00868D FF 81            [ 1] 1350         LDW Y,X
      00868F 86 82            [ 2] 1351 	LDW Y,(Y)
      008691 07 43            [ 1] 1352         JREQ     QDUP1
      008693 4F 4E 54         [ 2] 1353 	SUBW X,#2
      008696 45               [ 2] 1354         LDW (X),Y
      008697 58               [ 4] 1355 QDUP1:  RET
                                   1356 
                                   1357 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1358 ;       Rot 3rd item to top.
      008698 54 7E                 1359         .word      LINK
                           000690  1360 LINK = . 
      008699 03                    1361         .byte      3
      008699 90 AE 00              1362         .ascii     "ROT"
      000694                       1363 ROT:
      00869C 14 1D            [ 1] 1364         ldw y,x 
      00869E 00 02            [ 2] 1365         ldw y,(y)
      0086A0 FF 81            [ 2] 1366         pushw y 
      0086A2 86 91            [ 1] 1367         ldw y,x 
      0086A4 02 56 50         [ 2] 1368         ldw y,(4,y)
      0086A7 FF               [ 2] 1369         ldw (x),y 
      0086A7 90 AE            [ 1] 1370         ldw y,x 
      0086A9 00 16 1D         [ 2] 1371         ldw y,(2,y)
      0086AC 00 02            [ 2] 1372         ldw (4,x),y 
      0086AE FF 81            [ 2] 1373         popw y 
      0086B0 86 A4            [ 2] 1374         ldw (2,x),y
      0086B2 02               [ 4] 1375         ret 
                                   1376 
                                   1377 ;       2DROP   ( w w -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1378 ;       Discard two items on stack.
      0086B3 43 50                 1379         .word      LINK
                           0006AE  1380 LINK = . 
      0086B5 05                    1381         .byte      5
      0086B5 90 AE 00 18 1D        1382         .ascii     "2DROP"
      0006B4                       1383 DDROP:
      0086BA 00 02 FF         [ 2] 1384         ADDW X,#4
      0086BD 81               [ 4] 1385         RET
                                   1386 
                                   1387 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1388 ;       Duplicate top two items.
      0086BE 86 B2                 1389         .word      LINK
                           0006BA  1390 LINK = . 
      0086C0 04                    1391         .byte      4
      0086C1 4C 41 53 54           1392         .ascii     "2DUP"
      0086C5                       1393 DDUP:
      0086C5 90 AE 00         [ 2] 1394         SUBW X,#4
      0086C8 1A 1D            [ 1] 1395         LDW Y,X
      0086CA 00 02 FF         [ 2] 1396         LDW Y,(6,Y)
      0086CD 81 86            [ 2] 1397         LDW (2,X),Y
      0086CF C0 07            [ 1] 1398         LDW Y,X
      0086D1 52 41 4D         [ 2] 1399         LDW Y,(4,Y)
      0086D4 4C               [ 2] 1400         LDW (X),Y
      0086D5 41               [ 4] 1401         RET
                                   1402 
                                   1403 ;       +       ( w w -- sum )
                                   1404 ;       Add top two items.
      0086D6 53 54                 1405         .word      LINK
                           0006D2  1406 LINK = . 
      0086D8 01                    1407         .byte      1
      0086D8 90                    1408         .ascii     "+"
      0006D4                       1409 PLUS:
      0086D9 AE 00            [ 1] 1410         LDW Y,X
      0086DB 20 1D            [ 2] 1411         LDW Y,(Y)
      0086DD 00 02 FF         [ 2] 1412         LDW YTEMP,Y
      0086E0 81 86 D0         [ 2] 1413         ADDW X,#2
      0086E3 06 4F            [ 1] 1414         LDW Y,X
      0086E5 46 46            [ 2] 1415         LDW Y,(Y)
      0086E7 53 45 54 24      [ 2] 1416         ADDW Y,YTEMP
      0086EA FF               [ 2] 1417         LDW (X),Y
      0086EA 1D               [ 4] 1418         RET
                                   1419 
                                   1420 ;       NOT     ( w -- w )
                                   1421 ;       One's complement of tos.
      0086EB 00 02                 1422         .word      LINK
                           0006EA  1423 LINK = . 
      0086ED 90                    1424         .byte      3
      0086EE AE 00 1C              1425         .ascii     "NOT"
      0006EE                       1426 INVER:
      0086F1 FF 81            [ 1] 1427         LDW Y,X
      0086F3 90 FE            [ 2] 1428         LDW Y,(Y)
      0086F3 CD 86            [ 2] 1429         CPLW Y
      0086F5 EA               [ 2] 1430         LDW (X),Y
      0086F6 CD               [ 4] 1431         RET
                                   1432 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



                                   1433 ;       NEGATE  ( n -- -n )
                                   1434 ;       Two's complement of tos.
      0086F7 84 B2                 1435         .word      LINK
                           0006F8  1436 LINK = . 
      0086F9 CC                    1437         .byte      6
      0086FA 87 54 86 E3 04 3F     1438         .ascii     "NEGATE"
      0006FF                       1439 NEGAT:
      008700 44 55            [ 1] 1440         LDW Y,X
      008702 50 FE            [ 2] 1441         LDW Y,(Y)
      008703 90 50            [ 2] 1442         NEGW Y
      008703 90               [ 2] 1443         LDW (X),Y
      008704 93               [ 4] 1444         RET
                                   1445 
                                   1446 ;       DNEGATE ( d -- -d )
                                   1447 ;       Two's complement of top double.
      008705 90 FE                 1448         .word      LINK
                           000709  1449 LINK = . 
      008707 27                    1450         .byte      7
      008708 04 1D 00 02 FF 81 86  1451         .ascii     "DNEGATE"
      000711                       1452 DNEGA:
      00870F FE 03            [ 1] 1453         LDW Y,X
      008711 52 4F            [ 2] 1454 	LDW Y,(Y)
      008713 54 53            [ 2] 1455         CPLW Y     
      008714 90 BF 24         [ 2] 1456 	LDW YTEMP,Y
      008714 90 93            [ 1] 1457         LDW Y,X
      008716 90 FE 90         [ 2] 1458         LDW Y,(2,Y)
      008719 89 90            [ 2] 1459         CPLW Y
      00871B 93 90 EE 04      [ 2] 1460         addw y,#1
      00871F FF 90            [ 2] 1461         LDW (2,X),Y
      008721 93 90 EE         [ 2] 1462         LDW Y,YTEMP
      008724 02 EF            [ 1] 1463         JRNC DN1 
      008726 04 90            [ 2] 1464         INCW Y
      008728 85               [ 2] 1465 DN1:    LDW (X),Y
      008729 EF               [ 4] 1466         RET
                                   1467 
                                   1468 
                                   1469 ;       S>D ( n -- d )
                                   1470 ; convert single integer to double 
      00872A 02 81                 1471         .word LINK 
                           000732  1472         LINK=. 
      00872C 87                    1473         .byte 3 
      00872D 10 05 32              1474         .ascii "S>D"
      000736                       1475 STOD: 
      008730 44 52 4F         [ 2] 1476         subw x,#CELLL 
      008733 50 5F            [ 1] 1477         clrw y 
      008734 FF               [ 2] 1478         ldw (x),y 
      008734 1C 00            [ 1] 1479         ldw y,x 
      008736 04 81 87         [ 2] 1480         ldw y,(2,y)
      008739 2E 04            [ 1] 1481         jrpl 1$ 
      00873B 32 44 55 50      [ 2] 1482         ldw y,#-1
      00873F FF               [ 2] 1483         ldw (x),y 
      00873F 1D               [ 4] 1484 1$:     ret 
                                   1485 
                                   1486 
                                   1487 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1488 
                                   1489 ;       -       ( n1 n2 -- n1-n2 )
                                   1490 ;       Subtraction.
      008740 00 04                 1491         .word      LINK
                           00074B  1492 LINK = . 
      008742 90                    1493         .byte      1
      008743 93                    1494         .ascii     "-"
      00074D                       1495 SUBB:
      008744 90 EE            [ 1] 1496         LDW Y,X
      008746 06 EF            [ 2] 1497         LDW Y,(Y)
      008748 02 90 93         [ 2] 1498         LDW YTEMP,Y
      00874B 90 EE 04         [ 2] 1499         ADDW X,#2
      00874E FF 81            [ 1] 1500         LDW Y,X
      008750 87 3A            [ 2] 1501         LDW Y,(Y)
      008752 01 2B 00 24      [ 2] 1502         SUBW Y,YTEMP
      008754 FF               [ 2] 1503         LDW (X),Y
      008754 90               [ 4] 1504         RET
                                   1505 
                                   1506 ;       ABS     ( n -- n )
                                   1507 ;       Return  absolute value of n.
      008755 93 90                 1508         .word      LINK
                           000763  1509 LINK = . 
      008757 FE                    1510         .byte      3
      008758 90 BF 24              1511         .ascii     "ABS"
      000767                       1512 ABSS:
      00875B 1C 00            [ 1] 1513         LDW Y,X
      00875D 02 90            [ 2] 1514 	LDW Y,(Y)
      00875F 93 90            [ 1] 1515         JRPL     AB1     ;negate:
      008761 FE 72            [ 2] 1516         NEGW     Y     ;else negate hi byte
      008763 B9               [ 2] 1517         LDW (X),Y
      008764 00               [ 4] 1518 AB1:    RET
                                   1519 
                                   1520 ;       =       ( w w -- t )
                                   1521 ;       Return true if top two are =al.
      008765 24 FF                 1522         .word      LINK
                           000773  1523 LINK = . 
      008767 81                    1524         .byte      1
      008768 87                    1525         .ascii     "="
      000775                       1526 EQUAL:
      008769 52 03            [ 1] 1527         LD A,#0xFF  ;true
      00876B 4E 4F            [ 1] 1528         LDW Y,X    ;D = n2
      00876D 54 FE            [ 2] 1529         LDW Y,(Y)
      00876E 90 BF 24         [ 2] 1530         LDW YTEMP,Y
      00876E 90 93 90         [ 2] 1531         ADDW X,#2
      008771 FE 90            [ 1] 1532         LDW Y,X
      008773 53 FF            [ 2] 1533         LDW Y,(Y)
      008775 81 87 6A         [ 2] 1534         CPW Y,YTEMP     ;if n2 <> n1
      008778 06 4E            [ 1] 1535         JREQ     EQ1
      00877A 45               [ 1] 1536         CLR A
      00877B 47               [ 1] 1537 EQ1:    LD (X),A
      00877C 41 54            [ 1] 1538         LD (1,X),A
      00877E 45               [ 4] 1539 	RET     
                                   1540 
                                   1541 ;       U<      ( u u -- t )
                                   1542 ;       Unsigned compare of top two items.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      00877F 07 73                 1543         .word      LINK
                           000791  1544 LINK = . 
      00877F 90                    1545         .byte      2
      008780 93 90                 1546         .ascii     "U<"
      000794                       1547 ULESS:
      008782 FE 90            [ 1] 1548         LD A,#0xFF  ;true
      008784 50 FF            [ 1] 1549         LDW Y,X    ;D = n2
      008786 81 87            [ 2] 1550         LDW Y,(Y)
      008788 78 07 44         [ 2] 1551         LDW YTEMP,Y
      00878B 4E 45 47         [ 2] 1552         ADDW X,#2
      00878E 41 54            [ 1] 1553         LDW Y,X
      008790 45 FE            [ 2] 1554         LDW Y,(Y)
      008791 90 B3 24         [ 2] 1555         CPW Y,YTEMP     ;if n2 <> n1
      008791 90 93            [ 1] 1556         JRULT     ULES1
      008793 90               [ 1] 1557         CLR A
      008794 FE               [ 1] 1558 ULES1:  LD (X),A
      008795 90 53            [ 1] 1559         LD (1,X),A
      008797 90               [ 4] 1560 	RET     
                                   1561 
                                   1562 ;       <       ( n1 n2 -- t )
                                   1563 ;       Signed compare of top two items.
      008798 BF 24                 1564         .word      LINK
                           0007B0  1565 LINK = . 
      00879A 90                    1566         .byte      1
      00879B 93                    1567         .ascii     "<"
      0007B2                       1568 LESS:
      00879C 90 EE            [ 1] 1569         LD A,#0xFF  ;true
      00879E 02 90            [ 1] 1570         LDW Y,X    ;D = n2
      0087A0 53 72            [ 2] 1571         LDW Y,(Y)
      0087A2 A9 00 01         [ 2] 1572         LDW YTEMP,Y
      0087A5 EF 02 90         [ 2] 1573         ADDW X,#2
      0087A8 BE 24            [ 1] 1574         LDW Y,X
      0087AA 24 02            [ 2] 1575         LDW Y,(Y)
      0087AC 90 5C FF         [ 2] 1576         CPW Y,YTEMP     ;if n2 <> n1
      0087AF 81 87            [ 1] 1577         JRSLT     LT1
      0087B1 89               [ 1] 1578         CLR A
      0087B2 03               [ 1] 1579 LT1:    LD (X),A
      0087B3 53 3E            [ 1] 1580         LD (1,X),A
      0087B5 44               [ 4] 1581 	RET     
                                   1582 
                                   1583 ;       MAX     ( n n -- n )
                                   1584 ;       Return greater of two top items.
      0087B6 07 B0                 1585         .word      LINK
                           0007CE  1586 LINK = . 
      0087B6 1D                    1587         .byte      3
      0087B7 00 02 90              1588         .ascii     "MAX"
      0007D2                       1589 MAX:
      0087BA 5F FF            [ 1] 1590         LDW Y,X    ;D = n2
      0087BC 90 93 90         [ 2] 1591         LDW Y,(2,Y)
      0087BF EE 02 2A         [ 2] 1592         LDW YTEMP,Y
      0087C2 05 90            [ 1] 1593         LDW Y,X
      0087C4 AE FF            [ 2] 1594         LDW Y,(Y)
      0087C6 FF FF 81         [ 2] 1595         CPW Y,YTEMP     ;if n2 <> n1
      0087C9 87 B2            [ 1] 1596         JRSLT     MAX1
      0087CB 01 2D            [ 2] 1597         LDW (2,X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      0087CD 1C 00 02         [ 2] 1598 MAX1:   ADDW X,#2
      0087CD 90               [ 4] 1599 	RET     
                                   1600 
                                   1601 ;       MIN     ( n n -- n )
                                   1602 ;       Return smaller of top two items.
      0087CE 93 90                 1603         .word      LINK
                           0007EB  1604 LINK = . 
      0087D0 FE                    1605         .byte      3
      0087D1 90 BF 24              1606         .ascii     "MIN"
      0007EF                       1607 MIN:
      0087D4 1C 00            [ 1] 1608         LDW Y,X    ;D = n2
      0087D6 02 90 93         [ 2] 1609         LDW Y,(2,Y)
      0087D9 90 FE 72         [ 2] 1610         LDW YTEMP,Y
      0087DC B2 00            [ 1] 1611         LDW Y,X
      0087DE 24 FF            [ 2] 1612         LDW Y,(Y)
      0087E0 81 87 CB         [ 2] 1613         CPW Y,YTEMP     ;if n2 <> n1
      0087E3 03 41            [ 1] 1614         JRSGT     MIN1
      0087E5 42 53            [ 2] 1615         LDW (2,X),Y
      0087E7 1C 00 02         [ 2] 1616 MIN1:	ADDW X,#2
      0087E7 90               [ 4] 1617 	RET     
                                   1618 
                                   1619 ;       WITHIN  ( u ul uh -- t )
                                   1620 ;       Return true if u is within
                                   1621 ;       range of ul and uh. ( ul <= u < uh )
      0087E8 93 90                 1622         .word      LINK
                           000808  1623 LINK = . 
      0087EA FE                    1624         .byte      6
      0087EB 2A 03 90 50 FF 81     1625         .ascii     "WITHIN"
      00080F                       1626 WITHI:
      0087F1 87 E3 01         [ 4] 1627         CALL     OVER
      0087F4 3D 07 4D         [ 4] 1628         CALL     SUBB
      0087F5 CD 04 A2         [ 4] 1629         CALL     TOR
      0087F5 A6 FF 90         [ 4] 1630         CALL     SUBB
      0087F8 93 90 FE         [ 4] 1631         CALL     RFROM
      0087FB 90 BF 24         [ 2] 1632         JP     ULESS
                                   1633 
                                   1634 ;; Divide
                                   1635 
                                   1636 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1637 ;       Unsigned divide of a double by a
                                   1638 ;       single. Return mod and quotient.
      0087FE 1C 00                 1639         .word      LINK
                           000823  1640 LINK = . 
      008800 02                    1641         .byte      6
      008801 90 93 90 FE 90 B3     1642         .ascii     "UM/MOD"
      00082A                       1643 UMMOD:
      008807 24 27            [ 2] 1644 	LDW XTEMP,X	; save stack pointer
      008809 01               [ 2] 1645 	LDW X,(X)	; un
      00880A 4F F7            [ 2] 1646 	LDW YTEMP,X     ; save un
      00880C E7 01 81         [ 2] 1647 	LDW Y,XTEMP	; stack pointer
      00880F 87 F3 02         [ 2] 1648 	LDW Y,(4,Y)     ; Y=udl
      008812 55 3C            [ 2] 1649 	LDW X,XTEMP
      008814 EE 02            [ 2] 1650 	LDW X,(2,X)	; X=udh
      008814 A6 FF            [ 2] 1651 	CPW X,YTEMP
      008816 90 93            [ 2] 1652 	JRULE MMSM1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008818 90 FE            [ 2] 1653 	LDW X,XTEMP
      00881A 90 BF 24         [ 2] 1654 	ADDW X,#2	; pop off 1 level
      00881D 1C 00 02 90      [ 2] 1655 	LDW Y,#0xFFFF
      008821 93               [ 2] 1656 	LDW (X),Y
      008822 90 FE            [ 1] 1657 	CLRW Y
      008824 90 B3            [ 2] 1658 	LDW (2,X),Y
      008826 24               [ 4] 1659 	RET
      00084C                       1660 MMSM1:
                                   1661 ; take advantage of divw x,y when udh==0
      008827 25               [ 2] 1662         tnzw x  ; is udh==0?
      008828 01 4F            [ 1] 1663         jrne MMSM2 
      00882A F7               [ 1] 1664         ldw x,y    ;udl 
      00882B E7 01 81         [ 2] 1665         ldw y,YTEMP ; divisor 
      00882E 88               [ 2] 1666         divw x,y 
      00882F 11               [ 2] 1667         pushw x     ; quotient 
      008830 01 3C            [ 2] 1668         ldw x,XTEMP 
      008832 1C 00 02         [ 2] 1669         addw x,#CELLL 
      008832 A6 FF            [ 2] 1670         ldw (2,x),y  ; ur
      008834 90 93            [ 2] 1671         popw y 
      008836 90               [ 2] 1672         ldw (x),y ; uq 
      008837 FE               [ 4] 1673         ret 
      000860                       1674 MMSM2:        
      008838 90 BF            [ 1] 1675 	LD A,#17	; loop count
      000862                       1676 MMSM3:
      00883A 24 1C            [ 2] 1677 	CPW X,YTEMP	; compare udh to un
      00883C 00 02            [ 1] 1678 	JRULT MMSM4	; can't subtract
      00883E 90 93 90 FE      [ 2] 1679 	SUBW X,YTEMP	; can subtract
      00086A                       1680 MMSM4:
      008842 90               [ 1] 1681 	CCF	; quotient bit
      008843 B3 24            [ 2] 1682 	RLCW Y	; rotate into quotient
      008845 2F               [ 2] 1683 	RLCW X	; rotate into remainder
      008846 01               [ 1] 1684 	DEC A	; repeat
      008847 4F F7            [ 1] 1685 	JRUGT MMSM3
      008849 E7               [ 2] 1686         RRCW X 
      00884A 01 81            [ 2] 1687 	LDW YTEMP,X	; done, save remainder
      00884C 88 30            [ 2] 1688 	LDW X,XTEMP
      00884E 03 4D 41         [ 2] 1689 	ADDW X,#2	; drop
      008851 58               [ 2] 1690 	LDW (X),Y
      008852 90 BE 24         [ 2] 1691 	LDW Y,YTEMP	; save quotient
      008852 90 93            [ 2] 1692 	LDW (2,X),Y
      008854 90               [ 4] 1693 	RET
                                   1694 	
                                   1695 ;       M/MOD   ( d n -- r q )
                                   1696 ;       Signed floored divide of double by
                                   1697 ;       single. Return mod and quotient.
      008855 EE 02                 1698         .word      LINK
                           000882  1699 LINK = . 
      008857 90                    1700         .byte      5
      008858 BF 24 90 93 90        1701         .ascii     "M/MOD"
      000888                       1702 MSMOD:  
      00885D FE 90 B3         [ 4] 1703         CALL	DUPP
      008860 24 2F 02         [ 4] 1704         CALL	ZLESS
      008863 EF 02 1C         [ 4] 1705         CALL	DUPP
      008866 00 02 81         [ 4] 1706         CALL	TOR
      008869 88 4E 03         [ 4] 1707         CALL	QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      00886C 4D 49                 1708         .word	MMOD1
      00886E 4E 06 FF         [ 4] 1709         CALL	NEGAT
      00886F CD 04 A2         [ 4] 1710         CALL	TOR
      00886F 90 93 90         [ 4] 1711         CALL	DNEGA
      008872 EE 02 90         [ 4] 1712         CALL	RFROM
      008875 BF 24 90         [ 4] 1713 MMOD1:	CALL	TOR
      008878 93 90 FE         [ 4] 1714         CALL	DUPP
      00887B 90 B3 24         [ 4] 1715         CALL	ZLESS
      00887E 2C 02 EF         [ 4] 1716         CALL	QBRAN
      008881 02 1C                 1717         .word	MMOD2
      008883 00 02 81         [ 4] 1718         CALL	RAT
      008886 88 6B 06         [ 4] 1719         CALL	PLUS
      008889 57 49 54         [ 4] 1720 MMOD2:	CALL	RFROM
      00888C 48 49 4E         [ 4] 1721         CALL	UMMOD
      00888F CD 04 83         [ 4] 1722         CALL	RFROM
      00888F CD 85 83         [ 4] 1723         CALL	QBRAN
      008892 CD 87                 1724         .word	MMOD3
      008894 CD CD 85         [ 4] 1725         CALL	SWAPP
      008897 22 CD 87         [ 4] 1726         CALL	NEGAT
      00889A CD CD 85         [ 4] 1727         CALL	SWAPP
      00889D 03               [ 4] 1728 MMOD3:	RET
                                   1729 
                                   1730 ;       /MOD    ( n n -- r q )
                                   1731 ;       Signed divide. Return mod and quotient.
      00889E CC 88                 1732         .word      LINK
                           0008D3  1733 LINK = . 
      0088A0 14                    1734         .byte      4
      0088A1 88 88 06 55           1735         .ascii     "/MOD"
      0008D8                       1736 SLMOD:
      0088A5 4D 2F 4D         [ 4] 1737         CALL	OVER
      0088A8 4F 44 12         [ 4] 1738         CALL	ZLESS
      0088AA CD 04 E9         [ 4] 1739         CALL	SWAPP
      0088AA BF 22 FE         [ 2] 1740         JP	MSMOD
                                   1741 
                                   1742 ;       MOD     ( n n -- r )
                                   1743 ;       Signed divide. Return mod only.
      0088AD BF 24                 1744         .word      LINK
                           0008E6  1745 LINK = . 
      0088AF 90                    1746         .byte      3
      0088B0 BE 22 90              1747         .ascii     "MOD"
      0008EA                       1748 MODD:
      0088B3 EE 04 BE         [ 4] 1749 	CALL	SLMOD
      0088B6 22 EE 02         [ 2] 1750 	JP	DROP
                                   1751 
                                   1752 ;       /       ( n n -- q )
                                   1753 ;       Signed divide. Return quotient only.
      0088B9 B3 24                 1754         .word      LINK
                           0008F2  1755 LINK = . 
      0088BB 23                    1756         .byte      1
      0088BC 0F                    1757         .ascii     "/"
      0008F4                       1758 SLASH:
      0088BD BE 22 1C         [ 4] 1759         CALL	SLMOD
      0088C0 00 02 90         [ 4] 1760         CALL	SWAPP
      0088C3 AE FF FF         [ 2] 1761         JP	DROP
                                   1762 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1763 ;; Multiply
                                   1764 
                                   1765 ;       UM*     ( u u -- ud )
                                   1766 ;       Unsigned multiply. Return double product.
      0088C6 FF 90                 1767         .word      LINK
                           0008FF  1768 LINK = . 
      0088C8 5F                    1769         .byte      3
      0088C9 EF 02 81              1770         .ascii     "UM*"
      0088CC                       1771 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                                   1772 ; take advantage of SP addressing modes
                                   1773 ; these PRODx in RAM are not required
                                   1774 ; the product is kept on stack as local variable 
                                   1775         ;; bytes offset on data stack 
                           000002  1776         da=2 
                           000003  1777         db=3 
                           000000  1778         dc=0 
                           000001  1779         dd=1 
                                   1780         ;; product bytes offset on return stack 
                           000001  1781         UD1=1  ; ud bits 31..24
                           000002  1782         UD2=2  ; ud bits 23..16
                           000003  1783         UD3=3  ; ud bits 15..8 
                           000004  1784         UD4=4  ; ud bits 7..0 
                                   1785         ;; local variable for product set to zero   
      0088CC 5D 26            [ 1] 1786         clrw y 
      0088CE 11 93            [ 2] 1787         pushw y  ; bits 15..0
      0088D0 90 BE            [ 2] 1788         pushw y  ; bits 31..16 
      0088D2 24 65            [ 1] 1789         ld a,(db,x) ; b 
      0088D4 89 BE            [ 1] 1790         ld yl,a 
      0088D6 22 1C            [ 1] 1791         ld a,(dd,x)   ; d
      0088D8 00 02            [ 4] 1792         mul y,a    ; b*d  
      0088DA EF 02            [ 2] 1793         ldw (UD3,sp),y ; lowest weight product 
      0088DC 90 85            [ 1] 1794         ld a,(db,x)
      0088DE FF 81            [ 1] 1795         ld yl,a 
      0088E0 E6 00            [ 1] 1796         ld a,(dc,x)
      0088E0 A6 11            [ 4] 1797         mul y,a  ; b*c 
                                   1798         ;;; do the partial sum 
      0088E2 72 F9 02         [ 2] 1799         addw y,(UD2,sp)
      0088E2 B3               [ 1] 1800         clr a 
      0088E3 24               [ 1] 1801         rlc a
      0088E4 25 04            [ 1] 1802         ld (UD1,sp),a 
      0088E6 72 B0            [ 2] 1803         ldw (UD2,sp),y 
      0088E8 00 24            [ 1] 1804         ld a,(da,x)
      0088EA 90 97            [ 1] 1805         ld yl,a 
      0088EA 8C 90            [ 1] 1806         ld a,(dd,x)
      0088EC 59 59            [ 4] 1807         mul y,a   ; a*d 
                                   1808         ;; do partial sum 
      0088EE 4A 22 F1         [ 2] 1809         addw y,(UD2,sp)
      0088F1 56               [ 1] 1810         clr a 
      0088F2 BF 24            [ 1] 1811         adc a,(UD1,sp)
      0088F4 BE 22            [ 1] 1812         ld (UD1,sp),a  
      0088F6 1C 00            [ 2] 1813         ldw (UD2,sp),y 
      0088F8 02 FF            [ 1] 1814         ld a,(da,x)
      0088FA 90 BE            [ 1] 1815         ld yl,a 
      0088FC 24 EF            [ 1] 1816         ld a,(dc,x)
      0088FE 02 81            [ 4] 1817         mul y,a  ;  a*c highest weight product 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1818         ;;; do partial sum 
      008900 88 A3 05         [ 2] 1819         addw y,(UD1,sp)
      008903 4D               [ 2] 1820         ldw (x),y  ; udh 
      008904 2F 4D            [ 2] 1821         ldw y,(UD3,sp)
      008906 4F 44            [ 2] 1822         ldw (2,x),y  ; udl  
      008908 5B 04            [ 2] 1823         addw sp,#4 ; drop local variable 
      008908 CD               [ 4] 1824         ret  
                                   1825 
                                   1826 
                                   1827 ;       *       ( n n -- n )
                                   1828 ;       Signed multiply. Return single product.
      008909 85 59                 1829         .word      LINK
                           00094B  1830 LINK = . 
      00890B CD                    1831         .byte      1
      00890C 85                    1832         .ascii     "*"
      00094D                       1833 STAR:
      00890D 92 CD 85         [ 4] 1834 	CALL	UMSTA
      008910 59 CD 85         [ 2] 1835 	JP	DROP
                                   1836 
                                   1837 ;       M*      ( n n -- d )
                                   1838 ;       Signed multiply. Return double product.
      008913 22 CD                 1839         .word      LINK
                           000955  1840 LINK = . 
      008915 84                    1841         .byte      2
      008916 67 89                 1842         .ascii     "M*"
      000958                       1843 MSTAR:      
      008918 25 CD 87         [ 4] 1844         CALL	DDUP
      00891B 7F CD 85         [ 4] 1845         CALL	XORR
      00891E 22 CD 87         [ 4] 1846         CALL	ZLESS
      008921 91 CD 85         [ 4] 1847         CALL	TOR
      008924 03 CD 85         [ 4] 1848         CALL	ABSS
      008927 22 CD 85         [ 4] 1849         CALL	SWAPP
      00892A 59 CD 85         [ 4] 1850         CALL	ABSS
      00892D 92 CD 84         [ 4] 1851         CALL	UMSTA
      008930 67 89 39         [ 4] 1852         CALL	RFROM
      008933 CD 85 16         [ 4] 1853         CALL	QBRAN
      008936 CD 87                 1854         .word	MSTA1
      008938 54 CD 85         [ 4] 1855         CALL	DNEGA
      00893B 03               [ 4] 1856 MSTA1:	RET
                                   1857 
                                   1858 ;       */MOD   ( n1 n2 n3 -- r q )
                                   1859 ;       Multiply n1 and n2, then divide
                                   1860 ;       by n3. Return mod and quotient.
      00893C CD 88                 1861         .word      LINK
                           00097E  1862 LINK = . 
      00893E AA                    1863         .byte      5
      00893F CD 85 03 CD 84        1864         .ascii     "*/MOD"
      000984                       1865 SSMOD:
      008944 67 89 50         [ 4] 1866         CALL     TOR
      008947 CD 85 69         [ 4] 1867         CALL     MSTAR
      00894A CD 87 7F         [ 4] 1868         CALL     RFROM
      00894D CD 85 69         [ 2] 1869         JP     MSMOD
                                   1870 
                                   1871 ;       */      ( n1 n2 n3 -- q )
                                   1872 ;       Multiply n1 by n2, then divide
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                   1873 ;       by n3. Return quotient only.
      008950 81 89                 1874         .word      LINK
                           000992  1875 LINK = . 
      008952 02                    1876         .byte      2
      008953 04 2F                 1877         .ascii     "*/"
      000995                       1878 STASL:
      008955 4D 4F 44         [ 4] 1879         CALL	SSMOD
      008958 CD 04 E9         [ 4] 1880         CALL	SWAPP
      008958 CD 85 83         [ 2] 1881         JP	DROP
                                   1882 
                                   1883 ;; Miscellaneous
                                   1884 
                                   1885 ;       CELL+   ( a -- a )
                                   1886 ;       Add cell size in byte to address.
      00895B CD 85                 1887         .word      LINK
                           0009A0  1888 LINK = . 
      00895D 92                    1889         .byte       2
      00895E CD 85                 1890         .ascii     "2+"
      0009A3                       1891 CELLP:
      008960 69 CC            [ 1] 1892         LDW Y,X
      008962 89 08            [ 2] 1893 	LDW Y,(Y)
      008964 89 53 03 4D      [ 2] 1894         ADDW Y,#CELLL 
      008968 4F               [ 2] 1895         LDW (X),Y
      008969 44               [ 4] 1896         RET
                                   1897 
                                   1898 ;       CELL-   ( a -- a )
                                   1899 ;       Subtract 2 from address.
      00896A 09 A0                 1900         .word      LINK
                           0009AF  1901 LINK = . 
      00896A CD                    1902         .byte       2
      00896B 89 58                 1903         .ascii     "2-"
      0009B2                       1904 CELLM:
      00896D CC 85            [ 1] 1905         LDW Y,X
      00896F 4F 89            [ 2] 1906 	LDW Y,(Y)
      008971 66 01 2F 02      [ 2] 1907         SUBW Y,#CELLL
      008974 FF               [ 2] 1908         LDW (X),Y
      008974 CD               [ 4] 1909         RET
                                   1910 
                                   1911 ;       CELLS   ( n -- n )
                                   1912 ;       Multiply tos by 2.
      008975 89 58                 1913         .word      LINK
                           0009BE  1914 LINK = . 
      008977 CD                    1915         .byte       2
      008978 85 69                 1916         .ascii     "2*"
      0009C1                       1917 CELLS:
      00897A CC 85            [ 1] 1918         LDW Y,X
      00897C 4F 89            [ 2] 1919 	LDW Y,(Y)
      00897E 72 03            [ 2] 1920         SLAW Y
      008980 55               [ 2] 1921         LDW (X),Y
      008981 4D               [ 4] 1922         RET
                                   1923 
                                   1924 ;       1+      ( a -- a )
                                   1925 ;       Add cell size in byte to address.
      008982 2A BE                 1926         .word      LINK
                           0009CB  1927 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008983 02                    1928         .byte      2
      008983 90 5F                 1929         .ascii     "1+"
      0009CE                       1930 ONEP:
      008985 90 89            [ 1] 1931         LDW Y,X
      008987 90 89            [ 2] 1932 	LDW Y,(Y)
      008989 E6 03            [ 2] 1933         INCW Y
      00898B 90               [ 2] 1934         LDW (X),Y
      00898C 97               [ 4] 1935         RET
                                   1936 
                                   1937 ;       1-      ( a -- a )
                                   1938 ;       Subtract 2 from address.
      00898D E6 01                 1939         .word      LINK
                           0009D8  1940 LINK = . 
      00898F 90                    1941         .byte      2
      008990 42 17                 1942         .ascii     "1-"
      0009DB                       1943 ONEM:
      008992 03 E6            [ 1] 1944         LDW Y,X
      008994 03 90            [ 2] 1945 	LDW Y,(Y)
      008996 97 E6            [ 2] 1946         DECW Y
      008998 00               [ 2] 1947         LDW (X),Y
      008999 90               [ 4] 1948         RET
                                   1949 
                                   1950 ;  shift left n times 
                                   1951 ; LSHIFT ( n1 n2 -- n1<<n2 )
      00899A 42 72                 1952         .word LINK 
                           0009E5  1953         LINK=.
      00899C F9                    1954         .byte 6 
      00899D 02 4F 49 6B 01 17     1955         .ascii "LSHIFT"
      0009EC                       1956 LSHIFT:
      0089A3 02 E6            [ 1] 1957         ld a,(1,x)
      0089A5 02 90 97         [ 2] 1958         addw x,#CELLL 
      0089A8 E6 01            [ 1] 1959         ldw y,x 
      0089AA 90 42            [ 2] 1960         ldw y,(y)
      0009F5                       1961 LSHIFT1:
      0089AC 72               [ 1] 1962         tnz a 
      0089AD F9 02            [ 1] 1963         jreq LSHIFT4 
      0089AF 4F 19            [ 2] 1964         sllw y 
      0089B1 01               [ 1] 1965         dec a 
      0089B2 6B 01            [ 2] 1966         jra LSHIFT1 
      0009FD                       1967 LSHIFT4:
      0089B4 17               [ 2] 1968         ldw (x),y 
      0089B5 02               [ 4] 1969         ret 
                                   1970 
                                   1971 ; shift right n times                 
                                   1972 ; RSHIFT (n1 n2 -- n1>>n2 )
      0089B6 E6 02                 1973         .word LINK 
                           000A01  1974         LINK=.
      0089B8 90                    1975         .byte 6
      0089B9 97 E6 00 90 42 72     1976         .ascii "RSHIFT"
      000A08                       1977 RSHIFT:
      0089BF F9 01            [ 1] 1978         ld a,(1,x)
      0089C1 FF 16 03         [ 2] 1979         addw x,#CELLL 
      0089C4 EF 02            [ 1] 1980         ldw y,x 
      0089C6 5B 04            [ 2] 1981         ldw y,(y)
      000A11                       1982 RSHIFT1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      0089C8 81               [ 1] 1983         tnz a 
      0089C9 89 7F            [ 1] 1984         jreq RSHIFT4 
      0089CB 01 2A            [ 2] 1985         srlw y 
      0089CD 4A               [ 1] 1986         dec a 
      0089CD CD 89            [ 2] 1987         jra RSHIFT1 
      000A19                       1988 RSHIFT4:
      0089CF 83               [ 2] 1989         ldw (x),y 
      0089D0 CC               [ 4] 1990         ret 
                                   1991 
                                   1992 
                                   1993 ;       2/      ( n -- n )
                                   1994 ;       divide  tos by 2.
      0089D1 85 4F                 1995         .word      LINK
                           000A1D  1996 LINK = . 
      0089D3 89                    1997         .byte      2
      0089D4 CB 02                 1998         .ascii     "2/"
      000A20                       1999 TWOSL:
      0089D6 4D 2A            [ 1] 2000         LDW Y,X
      0089D8 90 FE            [ 2] 2001 	LDW Y,(Y)
      0089D8 CD 87            [ 2] 2002         SRAW Y
      0089DA 3F               [ 2] 2003         LDW (X),Y
      0089DB CD               [ 4] 2004         RET
                                   2005 
                                   2006 ;       BL      ( -- 32 )
                                   2007 ;       Return 32,  blank character.
      0089DC 85 CE                 2008         .word      LINK
                           000A2A  2009 LINK = . 
      0089DE CD                    2010         .byte      2
      0089DF 85 92                 2011         .ascii     "BL"
      000A2D                       2012 BLANK:
      0089E1 CD 85 22         [ 2] 2013         SUBW X,#2
      0089E4 CD 87 E7 CD      [ 2] 2014 	LDW Y,#32
      0089E8 85               [ 2] 2015         LDW (X),Y
      0089E9 69               [ 4] 2016         RET
                                   2017 
                                   2018 ;         0     ( -- 0)
                                   2019 ;         Return 0.
      0089EA CD 87                 2020         .word      LINK
                           000A38  2021 LINK = . 
      0089EC E7                    2022         .byte       1
      0089ED CD                    2023         .ascii     "0"
      000A3A                       2024 ZERO:
      0089EE 89 83 CD         [ 2] 2025         SUBW X,#2
      0089F1 85 03            [ 1] 2026 	CLRW Y
      0089F3 CD               [ 2] 2027         LDW (X),Y
      0089F4 84               [ 4] 2028         RET
                                   2029 
                                   2030 ;         1     ( -- 1)
                                   2031 ;         Return 1.
      0089F5 67 89                 2032         .word      LINK
                           000A43  2033 LINK = . 
      0089F7 FB                    2034         .byte       1
      0089F8 CD                    2035         .ascii     "1"
      000A45                       2036 ONE:
      0089F9 87 91 81         [ 2] 2037         SUBW X,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      0089FC 89 D5 05 2A      [ 2] 2038 	LDW Y,#1
      008A00 2F               [ 2] 2039         LDW (X),Y
      008A01 4D               [ 4] 2040         RET
                                   2041 
                                   2042 ;         -1    ( -- -1)
                                   2043 ;         Return 32,  blank character.
      008A02 4F 44                 2044         .word      LINK
                           000A50  2045 LINK = . 
      008A04 02                    2046         .byte       2
      008A04 CD 85                 2047         .ascii     "-1"
      000A53                       2048 MONE:
      008A06 22 CD 89         [ 2] 2049         SUBW X,#2
      008A09 D8 CD 85 03      [ 2] 2050 	LDW Y,#0xFFFF
      008A0D CC               [ 2] 2051         LDW (X),Y
      008A0E 89               [ 4] 2052         RET
                                   2053 
                                   2054 ;       >CHAR   ( c -- c )
                                   2055 ;       Filter non-printing characters.
      008A0F 08 89                 2056         .word      LINK
                           000A5E  2057 LINK = . 
      008A11 FE                    2058         .byte      5
      008A12 02 2A 2F 41 52        2059         .ascii     ">CHAR"
      008A15                       2060 TCHAR:
      008A15 CD 8A            [ 1] 2061         ld a,(1,x)
      008A17 04 CD            [ 1] 2062         cp a,#32  
      008A19 85 69            [ 1] 2063         jrmi 1$ 
      008A1B CC 85            [ 1] 2064         cp a,#127 
      008A1D 4F 8A            [ 1] 2065         jrpl 1$ 
      008A1F 12               [ 4] 2066         ret 
      008A20 02 32            [ 1] 2067 1$:     ld a,#'_ 
      008A22 2B 01            [ 1] 2068         ld (1,x),a 
      008A23 81               [ 4] 2069         ret 
                                   2070 
                                   2071 ;       DEPTH   ( -- n )
                                   2072 ;       Return  depth of  data stack.
      008A23 90 93                 2073         .word      LINK
                           000A76  2074 LINK = . 
      008A25 90                    2075         .byte      5
      008A26 FE 72 A9 00 02        2076         .ascii     "DEPTH"
      000A7C                       2077 DEPTH: 
      008A2B FF 81 8A         [ 2] 2078         LDW Y,SP0    ;save data stack ptr
      008A2E 20 02            [ 2] 2079 	LDW XTEMP,X
      008A30 32 2D 00 22      [ 2] 2080         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008A32 90 57            [ 2] 2081         SRAW Y    ;Y = #stack items
      008A32 90 93 90         [ 2] 2082 	SUBW X,#2
      008A35 FE               [ 2] 2083         LDW (X),Y     ; if neg, underflow
      008A36 72               [ 4] 2084         RET
                                   2085 
                                   2086 ;       PICK    ( ... +n -- ... w )
                                   2087 ;       Copy  nth stack item to tos.
      008A37 A2 00                 2088         .word      LINK
                           000A8E  2089 LINK = . 
      008A39 02                    2090         .byte      4
      008A3A FF 81 8A 2F           2091         .ascii     "PICK"
      000A93                       2092 PICK:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008A3E 02 32            [ 1] 2093         LDW Y,X   ;D = n1
      008A40 2A FE            [ 2] 2094         LDW Y,(Y)
                                   2095 ; modified for standard compliance          
                                   2096 ; 0 PICK must be equivalent to DUP 
      008A41 90 5C            [ 2] 2097         INCW Y 
      008A41 90 93            [ 2] 2098         SLAW Y
      008A43 90 FE            [ 2] 2099         LDW XTEMP,X
      008A45 90 58 FF 81      [ 2] 2100         ADDW Y,XTEMP
      008A49 8A 3E            [ 2] 2101         LDW Y,(Y)
      008A4B 02               [ 2] 2102         LDW (X),Y
      008A4C 31               [ 4] 2103         RET
                                   2104 
                                   2105 ;; Memory access
                                   2106 
                                   2107 ;       +!      ( n a -- )
                                   2108 ;       Add n to  contents at address a.
      008A4D 2B 8E                 2109         .word      LINK
                           000AA7  2110 LINK = . 
      008A4E 02                    2111         .byte      2
      008A4E 90 93                 2112         .ascii     "+!"
      000AAA                       2113 PSTOR:
      008A50 90 FE            [ 1] 2114         ldw y,x 
      008A52 90 5C            [ 2] 2115         ldw y,(y)
      008A54 FF 81 8A         [ 2] 2116         ldw YTEMP,y  ; address
      008A57 4B 02            [ 2] 2117         ldw y,(y)  
      008A59 31 2D            [ 2] 2118         pushw y  ; value at address 
      008A5B 90 93            [ 1] 2119         ldw y,x 
      008A5B 90 93 90         [ 2] 2120         ldw y,(2,y) ; n 
      008A5E FE 90 5A         [ 2] 2121         addw y,(1,sp) ; n+value
      008A61 FF 81 8A         [ 5] 2122         ldw [YTEMP],y ;  a!
      008A64 58 06            [ 2] 2123         popw y    ;drop local var
      008A66 4C 53 48         [ 2] 2124         addw x,#4 ; DDROP 
      008A69 49               [ 4] 2125         ret 
                                   2126 
                                   2127 ;       2!      ( d a -- )
                                   2128 ;       Store  double integer to address a.
      008A6A 46 54                 2129         .word      LINK
                           000AC8  2130 LINK = . 
      008A6C 02                    2131         .byte      2
      008A6C E6 01                 2132         .ascii     "2!"
      000ACB                       2133 DSTOR:
      008A6E 1C 00            [ 1] 2134         ldw y,x 
      008A70 02 90            [ 2] 2135         ldw y,(y)
      008A72 93 90 FE         [ 2] 2136         ldw YTEMP,y ; address 
      008A75 1C 00 02         [ 2] 2137         addw x,#CELLL ; drop a 
      008A75 4D 27            [ 1] 2138         ldw y,x 
      008A77 05 90            [ 2] 2139         ldw y,(y) ; hi word 
      008A79 58               [ 2] 2140         pushw x 
      008A7A 4A 20            [ 2] 2141         ldw x,(2,x) ; lo word 
      008A7C F8 CF 24         [ 5] 2142         ldw [YTEMP],y
      008A7D 90 93            [ 1] 2143         ldw y,x 
      008A7D FF 81 8A         [ 2] 2144         ldw x,#2 
      008A80 65 06 52         [ 5] 2145         ldw ([YTEMP],x),y 
      008A83 53               [ 2] 2146         popw x 
      008A84 48 49 46         [ 2] 2147         addw x,#4 ; DDROP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008A87 54               [ 4] 2148         ret 
                                   2149 
                                   2150 ;       2@      ( a -- d )
                                   2151 ;       Fetch double integer from address a.
      008A88 0A C8                 2152         .word      LINK
                           000AEE  2153 LINK = . 
      008A88 E6                    2154         .byte      2
      008A89 01 1C                 2155         .ascii     "2@"
      000AF1                       2156 DAT:
      008A8B 00 02            [ 1] 2157         ldw y,x 
      008A8D 90 93            [ 2] 2158         ldw y,(y) ;address 
      008A8F 90 FE 24         [ 2] 2159         ldw YTEMP,y 
      008A91 1D 00 02         [ 2] 2160         subw x,#CELLL ; space for udh 
      008A91 4D 27 05         [ 5] 2161         ldw y,[YTEMP] ; udh 
      008A94 90               [ 2] 2162         ldw (x),y 
      008A95 54 4A 20 F8      [ 2] 2163         ldw y,#2
      008A99 91 DE 24         [ 5] 2164         ldw y,([YTEMP],y) ; udl 
      008A99 FF 81            [ 2] 2165         ldw (2,x),y
      008A9B 8A               [ 4] 2166         ret 
                                   2167 
                                   2168 ;       COUNT   ( b -- b +n )
                                   2169 ;       Return count byte of a string
                                   2170 ;       and add 1 to byte address.
      008A9C 81 02                 2171         .word      LINK
                           000B0B  2172 LINK = . 
      008A9E 32                    2173         .byte      5
      008A9F 2F 4F 55 4E 54        2174         .ascii     "COUNT"
      008AA0                       2175 COUNT:
      008AA0 90 93            [ 1] 2176         ldw y,x 
      008AA2 90 FE            [ 2] 2177         ldw y,(y) ; address 
      008AA4 90 57            [ 1] 2178         ld a,(y)  ; count 
      008AA6 FF 81            [ 2] 2179         incw y 
      008AA8 8A               [ 2] 2180         ldw (x),y 
      008AA9 9D 02 42         [ 2] 2181         subw x,#CELLL 
      008AAC 4C 01            [ 1] 2182         ld (1,x),a 
      008AAD 7F               [ 1] 2183         clr (x)
      008AAD 1D               [ 4] 2184         ret 
                                   2185 
                                   2186 ;       HERE    ( -- a )
                                   2187 ;       Return  top of  variables
      008AAE 00 02                 2188         .word      LINK
                           000B23  2189 LINK = . 
      008AB0 90                    2190         .byte      4
      008AB1 AE 00 20 FF           2191         .ascii     "HERE"
      000B28                       2192 HERE:
      008AB5 81 8A AA 01      [ 2] 2193       	ldw y,#UVP 
      008AB9 30 FE            [ 2] 2194         ldw y,(y)
      008ABA 1D 00 02         [ 2] 2195         subw x,#CELLL 
      008ABA 1D               [ 2] 2196         ldw (x),y 
      008ABB 00               [ 4] 2197         ret 
                                   2198 
                                   2199 ;       PAD     ( -- a )
                                   2200 ;       Return address of text buffer
                                   2201 ;       above  code dictionary.
      008ABC 02 90                 2202         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                           000B35  2203 LINK = . 
      008ABE 5F                    2204         .byte      3
      008ABF FF 81 8A              2205         .ascii     "PAD"
      000B39                       2206 PAD:
      008AC2 B8 01 31         [ 4] 2207         CALL     HERE
      008AC5 CD 03 B4         [ 4] 2208         CALL     DOLIT
      008AC5 1D 00                 2209         .word      80
      008AC7 02 90 AE         [ 2] 2210         JP     PLUS
                                   2211 
                                   2212 ;       TIB     ( -- a )
                                   2213 ;       Return address of terminal input buffer.
      008ACA 00 01                 2214         .word      LINK
                           000B46  2215 LINK = . 
      008ACC FF                    2216         .byte      3
      008ACD 81 8A C3              2217         .ascii     "TIB"
      000B4A                       2218 TIB:
      008AD0 02 2D 31         [ 4] 2219         CALL     NTIB
      008AD3 CD 09 A3         [ 4] 2220         CALL     CELLP
      008AD3 1D 00 02         [ 2] 2221         JP     AT
                                   2222 
                                   2223 ;       @EXECUTE        ( a -- )
                                   2224 ;       Execute vector stored in address a.
      008AD6 90 AE                 2225         .word      LINK
                           000B55  2226 LINK = . 
      008AD8 FF                    2227         .byte      8
      008AD9 FF FF 81 8A D0 05 3E  2228         .ascii     "@EXECUTE"
             43
      000B5E                       2229 ATEXE:
      008AE1 48 41 52         [ 4] 2230         CALL     AT
      008AE4 CD 06 83         [ 4] 2231         CALL     QDUP    ;?address or zero
      008AE4 E6 01 A1         [ 4] 2232         CALL     QBRAN
      008AE7 20 2B                 2233         .word      EXE1
      008AE9 05 A1 7F         [ 4] 2234         CALL     EXECU   ;execute if non-zero
      008AEC 2A               [ 4] 2235 EXE1:   RET     ;do nothing if zero
                                   2236 
                                   2237 ;       CMOVE   ( b1 b2 u -- )
                                   2238 ;       Copy u bytes from b1 to b2.
      008AED 01 81                 2239         .word      LINK
                           000B6F  2240 LINK = . 
      008AEF A6                    2241         .byte      5
      008AF0 5F E7 01 81 8A        2242         .ascii     "CMOVE"
      000B75                       2243 CMOVE:
      008AF5 DE 05 44         [ 4] 2244         CALL	TOR
      008AF8 45 50 54         [ 4] 2245         CALL	BRAN
      008AFB 48 95                 2246         .word	CMOV2
      008AFC CD 04 A2         [ 4] 2247 CMOV1:	CALL	TOR
      008AFC 90 BE 2A         [ 4] 2248         CALL	DUPP
      008AFF BF 22 72         [ 4] 2249         CALL	CAT
      008B02 B2 00 22         [ 4] 2250         CALL	RAT
      008B05 90 57 1D         [ 4] 2251         CALL	CSTOR
      008B08 00 02 FF         [ 4] 2252         CALL	ONEP
      008B0B 81 8A F6         [ 4] 2253         CALL	RFROM
      008B0E 04 50 49         [ 4] 2254         CALL	ONEP
      008B11 43 4B C8         [ 4] 2255 CMOV2:	CALL	DONXT
      008B13 0B 7D                 2256         .word	CMOV1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008B13 90 93 90         [ 2] 2257         JP	DDROP
                                   2258 
                                   2259 ;       FILL    ( b u c -- )
                                   2260 ;       Fill u bytes of character c
                                   2261 ;       to area beginning at b.
      008B16 FE 90                 2262         .word       LINK
                           000B9F  2263 LINK = . 
      008B18 5C                    2264         .byte       4
      008B19 90 58 BF 22           2265         .ascii     "FILL"
      000BA4                       2266 FILL:
      008B1D 72 B9            [ 1] 2267         ldw y,x 
      008B1F 00 22 90         [ 1] 2268         ld a,(1,y) ; c 
      008B22 FE FF 81         [ 2] 2269         addw x,#CELLL ; drop c 
      008B25 8B 0E            [ 1] 2270         ldw y,x 
      008B27 02 2B            [ 2] 2271         ldw y,(y) ; count
      008B29 21 89            [ 2] 2272         pushw y 
      008B2A 1C 00 02         [ 2] 2273         addw x,#CELLL ; drop u 
      008B2A 90 93            [ 1] 2274         ldw y,x 
      008B2C 90 FE 90         [ 2] 2275         addw x,#CELLL ; drop b 
      008B2F BF 24            [ 2] 2276         ldw y,(y) ; address
      008B31 90 FE 90         [ 2] 2277         ldw YTEMP,y
      008B34 89 90            [ 2] 2278         popw y ; count 
      000BC1                       2279 FILL1:  
      008B36 93 90 EE         [ 4] 2280         ld [YTEMP],a 
      008B39 02 72            [ 1] 2281         inc YTEMP+1
      008B3B F9 01            [ 1] 2282         jrnc FILL2 
      008B3D 91 CF            [ 1] 2283         inc YTEMP
      000BCA                       2284 FILL2: 
      008B3F 24 90            [ 2] 2285         decw y ; count 
      008B41 85 1C            [ 1] 2286         jrne FILL1  
      008B43 00               [ 4] 2287         ret 
                                   2288 
                                   2289 ;       ERASE   ( b u -- )
                                   2290 ;       Erase u bytes beginning at b.
      008B44 04 81                 2291         .word      LINK
                           000BD1  2292 LINK = . 
      008B46 8B                    2293         .byte      5
      008B47 27 02 32 21 45        2294         .ascii     "ERASE"
      008B4B                       2295 ERASE:
      008B4B 90 93            [ 1] 2296         clrw y 
      008B4D 90 FE 90         [ 2] 2297         subw x,#CELLL 
      008B50 BF               [ 2] 2298         ldw (x),y 
      008B51 24 1C 00         [ 2] 2299         jp FILL 
                                   2300 
                                   2301 
                                   2302 ;       PACK0   ( b u a -- a )
                                   2303 ;       Build a counted string with
                                   2304 ;       u characters from b. Null fill.
      008B54 02 90                 2305         .word      LINK
                           000BE2  2306 LINK = . 
      008B56 93                    2307         .byte      5
      008B57 90 FE 89 EE 02        2308         .ascii     "PACK0"
      000BE8                       2309 PACKS:
      008B5C 91 CF 24         [ 4] 2310         CALL     DUPP
      008B5F 90 93 AE         [ 4] 2311         CALL     TOR     ;strings only on cell boundary
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008B62 00 02 92         [ 4] 2312         CALL     DDUP
      008B65 DF 24 85         [ 4] 2313         CALL     CSTOR
      008B68 1C 00 04         [ 4] 2314         CALL     ONEP ;save count
      008B6B 81 8B 48         [ 4] 2315         CALL     SWAPP
      008B6E 02 32 40         [ 4] 2316         CALL     CMOVE
      008B71 CD 04 83         [ 4] 2317         CALL     RFROM
      008B71 90               [ 4] 2318         RET
                                   2319 
                                   2320 ;; Numeric output, single precision
                                   2321 
                                   2322 ;       DIGIT   ( u -- c )
                                   2323 ;       Convert digit u to a character.
      008B72 93 90                 2324         .word      LINK
                           000C03  2325 LINK = . 
      008B74 FE                    2326         .byte      5
      008B75 90 BF 24 1D 00        2327         .ascii     "DIGIT"
      000C09                       2328 DIGIT:
      008B7A 02 91 CE         [ 4] 2329         CALL	DOLIT
      008B7D 24 FF                 2330         .word	9
      008B7F 90 AE 00         [ 4] 2331         CALL	OVER
      008B82 02 91 DE         [ 4] 2332         CALL	LESS
      008B85 24 EF 02         [ 4] 2333         CALL	DOLIT
      008B88 81 8B                 2334         .word	7
      008B8A 6E 05 43         [ 4] 2335         CALL	ANDD
      008B8D 4F 55 4E         [ 4] 2336         CALL	PLUS
      008B90 54 03 B4         [ 4] 2337         CALL	DOLIT
      008B91 00 30                 2338         .word	48	;'0'
      008B91 90 93 90         [ 2] 2339         JP	PLUS
                                   2340 
                                   2341 ;       EXTRACT ( n base -- n c )
                                   2342 ;       Extract least significant digit from n.
      008B94 FE 90                 2343         .word      LINK
                           000C29  2344 LINK = . 
      008B96 F6                    2345         .byte      7
      008B97 90 5C FF 1D 00 02 E7  2346         .ascii     "EXTRACT"
      000C31                       2347 EXTRC:
      008B9E 01 7F 81         [ 4] 2348         CALL     ZERO
      008BA1 8B 8B 04         [ 4] 2349         CALL     SWAPP
      008BA4 48 45 52         [ 4] 2350         CALL     UMMOD
      008BA7 45 04 E9         [ 4] 2351         CALL     SWAPP
      008BA8 CC 0C 09         [ 2] 2352         JP     DIGIT
                                   2353 
                                   2354 ;       <#      ( -- )
                                   2355 ;       Initiate  numeric output process.
      008BA8 90 AE                 2356         .word      LINK
                           000C42  2357 LINK = . 
      008BAA 00                    2358         .byte      2
      008BAB 16 90                 2359         .ascii     "<#"
      000C45                       2360 BDIGS:
      008BAD FE 1D 00         [ 4] 2361         CALL     PAD
      008BB0 02 FF 81         [ 4] 2362         CALL     HLD
      008BB3 8B A3 03         [ 2] 2363         JP     STORE
                                   2364 
                                   2365 ;       HOLD    ( c -- )
                                   2366 ;       Insert a character into output string.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008BB6 50 41                 2367         .word      LINK
                           000C50  2368 LINK = . 
      008BB8 44                    2369         .byte      4
      008BB9 48 4F 4C 44           2370         .ascii     "HOLD"
      000C55                       2371 HOLD:
      008BB9 CD 8B A8         [ 4] 2372         CALL     HLD
      008BBC CD 84 34         [ 4] 2373         CALL     AT
      008BBF 00 50 CC         [ 4] 2374         CALL     ONEM
      008BC2 87 54 8B         [ 4] 2375         CALL     DUPP
      008BC5 B5 03 54         [ 4] 2376         CALL     HLD
      008BC8 49 42 1B         [ 4] 2377         CALL     STORE
      008BCA CC 04 3F         [ 2] 2378         JP     CSTOR
                                   2379 
                                   2380 ;       #       ( u -- u )
                                   2381 ;       Extract one digit from u and
                                   2382 ;       append digit to output string.
      008BCA CD 86                 2383         .word      LINK
                           000C6C  2384 LINK = . 
      008BCC 44                    2385         .byte      1
      008BCD CD                    2386         .ascii     "#"
      000C6E                       2387 DIG:
      008BCE 8A 23 CC         [ 4] 2388         CALL     BASE
      008BD1 84 B2 8B         [ 4] 2389         CALL     AT
      008BD4 C6 08 40         [ 4] 2390         CALL     EXTRC
      008BD7 45 58 45         [ 2] 2391         JP     HOLD
                                   2392 
                                   2393 ;       #S      ( u -- 0 )
                                   2394 ;       Convert u until all digits
                                   2395 ;       are added to output string.
      008BDA 43 55                 2396         .word      LINK
                           000C7C  2397 LINK = . 
      008BDC 54                    2398         .byte      2
      008BDD 45 53                 2399         .ascii     "#S"
      008BDE                       2400 DIGS:
      008BDE CD 84 B2         [ 4] 2401 DIGS1:  CALL     DIG
      008BE1 CD 87 03         [ 4] 2402         CALL     DUPP
      008BE4 CD 84 67         [ 4] 2403         CALL     QBRAN
      008BE7 8B EC                 2404         .word      DIGS2
      008BE9 CD 84            [ 2] 2405         JRA     DIGS1
      008BEB 8E               [ 4] 2406 DIGS2:  RET
                                   2407 
                                   2408 ;       SIGN    ( n -- )
                                   2409 ;       Add a minus sign to
                                   2410 ;       numeric output string.
      008BEC 81 8B                 2411         .word      LINK
                           000C8F  2412 LINK = . 
      008BEE D5                    2413         .byte      4
      008BEF 05 43 4D 4F           2414         .ascii     "SIGN"
      000C94                       2415 SIGN:
      008BF3 56 45 12         [ 4] 2416         CALL     ZLESS
      008BF5 CD 03 E7         [ 4] 2417         CALL     QBRAN
      008BF5 CD 85                 2418         .word      SIGN1
      008BF7 22 CD 84         [ 4] 2419         CALL     DOLIT
      008BFA 7E 8C                 2420         .word      45	;"-"
      008BFC 15 CD 85         [ 2] 2421         JP     HOLD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008BFF 22               [ 4] 2422 SIGN1:  RET
                                   2423 
                                   2424 ;       #>      ( w -- b u )
                                   2425 ;       Prepare output string.
      008C00 CD 85                 2426         .word      LINK
                           000CA7  2427 LINK = . 
      008C02 59                    2428         .byte      2
      008C03 CD 84                 2429         .ascii     "#>"
      000CAA                       2430 EDIGS:
      008C05 D0 CD 85         [ 4] 2431         CALL     DROP
      008C08 16 CD 84         [ 4] 2432         CALL     HLD
      008C0B BF CD 8A         [ 4] 2433         CALL     AT
      008C0E 4E CD 85         [ 4] 2434         CALL     PAD
      008C11 03 CD 8A         [ 4] 2435         CALL     OVER
      008C14 4E CD 84         [ 2] 2436         JP     SUBB
                                   2437 
                                   2438 ;       str     ( w -- b u )
                                   2439 ;       Convert a signed integer
                                   2440 ;       to a numeric string.
      008C17 48 8B                 2441         .word      LINK
                           000CBE  2442 LINK = . 
      008C19 FD                    2443         .byte      3
      008C1A CC 87 34              2444         .ascii     "STR"
      000CC2                       2445 STR:
      008C1D 8B EF 04         [ 4] 2446         CALL     DUPP
      008C20 46 49 4C         [ 4] 2447         CALL     TOR
      008C23 4C 07 67         [ 4] 2448         CALL     ABSS
      008C24 CD 0C 45         [ 4] 2449         CALL     BDIGS
      008C24 90 93 90         [ 4] 2450         CALL     DIGS
      008C27 E6 01 1C         [ 4] 2451         CALL     RFROM
      008C2A 00 02 90         [ 4] 2452         CALL     SIGN
      008C2D 93 90 FE         [ 2] 2453         JP     EDIGS
                                   2454 
                                   2455 ;       HEX     ( -- )
                                   2456 ;       Use radix 16 as base for
                                   2457 ;       numeric conversions.
      008C30 90 89                 2458         .word      LINK
                           000CDC  2459 LINK = . 
      008C32 1C                    2460         .byte      3
      008C33 00 02 90              2461         .ascii     "HEX"
      000CE0                       2462 HEX:
      008C36 93 1C 00         [ 4] 2463         CALL     DOLIT
      008C39 02 90                 2464         .word      16
      008C3B FE 90 BF         [ 4] 2465         CALL     BASE
      008C3E 24 90 85         [ 2] 2466         JP     STORE
                                   2467 
                                   2468 ;       DECIMAL ( -- )
                                   2469 ;       Use radix 10 as base
                                   2470 ;       for numeric conversions.
      008C41 0C DC                 2471         .word      LINK
                           000CED  2472 LINK = . 
      008C41 92                    2473         .byte      7
      008C42 C7 24 3C 25 24 02 3C  2474         .ascii     "DECIMAL"
      000CF5                       2475 DECIM:
      008C49 24 03 B4         [ 4] 2476         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008C4A 00 0A                 2477         .word      10
      008C4A 90 5A 26         [ 4] 2478         CALL     BASE
      008C4D F3 81 8C         [ 2] 2479         JP     STORE
                                   2480 
                                   2481 ;; Numeric input, single precision
                                   2482 
                                   2483 ;       DIGIT?  ( c base -- u t )
                                   2484 ;       Convert a character to its numeric
                                   2485 ;       value. A flag indicates success.
      008C50 1F 05                 2486         .word      LINK
                           000D02  2487 LINK = . 
      008C52 45                    2488         .byte       6
      008C53 52 41 53 45 54 3F     2489         .ascii     "DIGIT?"
      008C57                       2490 DIGTQ:
      008C57 90 5F 1D         [ 4] 2491         CALL     TOR
      008C5A 00 02 FF         [ 4] 2492         CALL     DOLIT
      008C5D CC 8C                 2493         .word     48	; "0"
      008C5F 24 8C 51         [ 4] 2494         CALL     SUBB
      008C62 05 50 41         [ 4] 2495         CALL     DOLIT
      008C65 43 4B                 2496         .word      9
      008C67 30 05 03         [ 4] 2497         CALL     OVER
      008C68 CD 07 B2         [ 4] 2498         CALL     LESS
      008C68 CD 85 59         [ 4] 2499         CALL     QBRAN
      008C6B CD 85                 2500         .word      DGTQ1
      008C6D 22 CD 87         [ 4] 2501         CALL     DOLIT
      008C70 3F CD                 2502         .word      7
      008C72 84 BF CD         [ 4] 2503         CALL     SUBB
      008C75 8A 4E CD         [ 4] 2504         CALL     DUPP
      008C78 85 69 CD         [ 4] 2505         CALL     DOLIT
      008C7B 8B F5                 2506         .word      10
      008C7D CD 85 03         [ 4] 2507         CALL     LESS
      008C80 81 8C 62         [ 4] 2508         CALL     ORR
      008C83 05 44 49         [ 4] 2509 DGTQ1:  CALL     DUPP
      008C86 47 49 54         [ 4] 2510         CALL     RFROM
      008C89 CC 07 94         [ 2] 2511         JP     ULESS
                                   2512 
                                   2513 ;       NUMBER? ( a -- n T | a F )
                                   2514 ;       Convert a number string to
                                   2515 ;       integer. Push a flag on tos.
      008C89 CD 84                 2516         .word      LINK
                           000D45  2517 LINK = . 
      008C8B 34                    2518         .byte      7
      008C8C 00 09 CD 85 83 CD 88  2519         .ascii     "NUMBER?"
      000D4D                       2520 NUMBQ:
      008C93 32 CD 84         [ 4] 2521         CALL     BASE
      008C96 34 00 07         [ 4] 2522         CALL     AT
      008C99 CD 85 A5         [ 4] 2523         CALL     TOR
      008C9C CD 87 54         [ 4] 2524         CALL     ZERO
      008C9F CD 84 34         [ 4] 2525         CALL     OVER
      008CA2 00 30 CC         [ 4] 2526         CALL     COUNT
      008CA5 87 54 8C         [ 4] 2527         CALL     OVER
      008CA8 83 07 45         [ 4] 2528         CALL     CAT
      008CAB 58 54 52         [ 4] 2529         CALL     DOLIT
      008CAE 41 43                 2530         .word     36	; "0x"
      008CB0 54 07 75         [ 4] 2531         CALL     EQUAL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008CB1 CD 03 E7         [ 4] 2532         CALL     QBRAN
      008CB1 CD 8A                 2533         .word      NUMQ1
      008CB3 BA CD 85         [ 4] 2534         CALL     HEX
      008CB6 69 CD 88         [ 4] 2535         CALL     SWAPP
      008CB9 AA CD 85         [ 4] 2536         CALL     ONEP
      008CBC 69 CC 8C         [ 4] 2537         CALL     SWAPP
      008CBF 89 8C A9         [ 4] 2538         CALL     ONEM
      008CC2 02 3C 23         [ 4] 2539 NUMQ1:  CALL     OVER
      008CC5 CD 04 50         [ 4] 2540         CALL     CAT
      008CC5 CD 8B B9         [ 4] 2541         CALL     DOLIT
      008CC8 CD 86                 2542         .word     45	; "-"
      008CCA 86 CC 84         [ 4] 2543         CALL     EQUAL
      008CCD 9B 8C C2         [ 4] 2544         CALL     TOR
      008CD0 04 48 4F         [ 4] 2545         CALL     SWAPP
      008CD3 4C 44 96         [ 4] 2546         CALL     RAT
      008CD5 CD 07 4D         [ 4] 2547         CALL     SUBB
      008CD5 CD 86 86         [ 4] 2548         CALL     SWAPP
      008CD8 CD 84 B2         [ 4] 2549         CALL     RAT
      008CDB CD 8A 5B         [ 4] 2550         CALL     PLUS
      008CDE CD 85 59         [ 4] 2551         CALL     QDUP
      008CE1 CD 86 86         [ 4] 2552         CALL     QBRAN
      008CE4 CD 84                 2553         .word      NUMQ6
      008CE6 9B CC 84         [ 4] 2554         CALL     ONEM
      008CE9 BF 8C D0         [ 4] 2555         CALL     TOR
      008CEC 01 23 D9         [ 4] 2556 NUMQ2:  CALL     DUPP
      008CEE CD 04 A2         [ 4] 2557         CALL     TOR
      008CEE CD 86 16         [ 4] 2558         CALL     CAT
      008CF1 CD 84 B2         [ 4] 2559         CALL     BASE
      008CF4 CD 8C B1         [ 4] 2560         CALL     AT
      008CF7 CC 8C D5         [ 4] 2561         CALL     DIGTQ
      008CFA 8C EC 02         [ 4] 2562         CALL     QBRAN
      008CFD 23 53                 2563         .word      NUMQ4
      008CFF CD 04 E9         [ 4] 2564         CALL     SWAPP
      008CFF CD 8C EE         [ 4] 2565         CALL     BASE
      008D02 CD 85 59         [ 4] 2566         CALL     AT
      008D05 CD 84 67         [ 4] 2567         CALL     STAR
      008D08 8D 0C 20         [ 4] 2568         CALL     PLUS
      008D0B F3 81 8C         [ 4] 2569         CALL     RFROM
      008D0E FC 04 53         [ 4] 2570         CALL     ONEP
      008D11 49 47 4E         [ 4] 2571         CALL     DONXT
      008D14 0D B2                 2572         .word      NUMQ2
      008D14 CD 85 92         [ 4] 2573         CALL     RAT
      008D17 CD 84 67         [ 4] 2574         CALL     SWAPP
      008D1A 8D 24 CD         [ 4] 2575         CALL     DROP
      008D1D 84 34 00         [ 4] 2576         CALL     QBRAN
      008D20 2D CC                 2577         .word      NUMQ3
      008D22 8C D5 81         [ 4] 2578         CALL     NEGAT
      008D25 8D 0F 02         [ 4] 2579 NUMQ3:  CALL     SWAPP
      008D28 23 3E            [ 2] 2580         JRA     NUMQ5
      008D2A CD 04 83         [ 4] 2581 NUMQ4:  CALL     RFROM
      008D2A CD 85 4F         [ 4] 2582         CALL     RFROM
      008D2D CD 86 86         [ 4] 2583         CALL     DDROP
      008D30 CD 84 B2         [ 4] 2584         CALL     DDROP
      008D33 CD 8B B9         [ 4] 2585         CALL     ZERO
      008D36 CD 85 83         [ 4] 2586 NUMQ5:  CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008D39 CC 87 CD         [ 4] 2587 NUMQ6:  CALL     RFROM
      008D3C 8D 27 03         [ 4] 2588         CALL     DDROP
      008D3F 53 54 52         [ 4] 2589         CALL     RFROM
      008D42 CD 05 96         [ 4] 2590         CALL     BASE
      008D42 CD 85 59         [ 2] 2591         JP     STORE
                                   2592 
                                   2593 ;; Basic I/O
                                   2594 
                                   2595 ;       KEY     ( -- c )
                                   2596 ;       Wait for and return an
                                   2597 ;       input character.
      008D45 CD 85                 2598         .word      LINK
                           000E1C  2599 LINK = . 
      008D47 22                    2600         .byte      3
      008D48 CD 87 E7              2601         .ascii     "KEY"
      000E20                       2602 KEY:
      008D4B CD 8C C5 CD 8C   [ 2] 2603         btjf UART2_SR,#UART_SR_RXNE,. 
      008D50 FF CD 85         [ 1] 2604         ld a,UART2_DR 
      008D53 03 CD 8D         [ 2] 2605         subw x,#CELLL 
      008D56 14 CC            [ 1] 2606         ld (1,x),a 
      008D58 8D               [ 1] 2607         clr (x)
      008D59 2A               [ 4] 2608         ret 
                                   2609 
                                   2610 ;       NUF?    ( -- t )
                                   2611 ;       Return false if no input,
                                   2612 ;       else pause and if CR return true.
      008D5A 8D 3E                 2613         .word      LINK
                           000E31  2614 LINK = . 
      008D5C 03                    2615         .byte      4
      008D5D 48 45 58 3F           2616         .ascii     "NUF?"
      008D60                       2617 NUFQ:
      008D60 CD 84 34         [ 4] 2618         CALL     QKEY
      008D63 00 10 CD         [ 4] 2619         CALL     DUPP
      008D66 86 16 CC         [ 4] 2620         CALL     QBRAN
      008D69 84 9B                 2621         .word    NUFQ1
      008D6B 8D 5C 07         [ 4] 2622         CALL     DDROP
      008D6E 44 45 43         [ 4] 2623         CALL     KEY
      008D71 49 4D 41         [ 4] 2624         CALL     DOLIT
      008D74 4C 0D                 2625         .word      CRR
      008D75 CC 07 75         [ 2] 2626         JP     EQUAL
      008D75 CD               [ 4] 2627 NUFQ1:  RET
                                   2628 
                                   2629 ;       SPACE   ( -- )
                                   2630 ;       Send  blank character to
                                   2631 ;       output device.
      008D76 84 34                 2632         .word      LINK
                           000E52  2633 LINK = . 
      008D78 00                    2634         .byte      5
      008D79 0A CD 86 16 CC        2635         .ascii     "SPACE"
      000E58                       2636 SPACE:
      008D7E 84 9B 8D         [ 4] 2637         CALL     BLANK
      008D81 6D 06 44         [ 2] 2638         JP     EMIT
                                   2639 
                                   2640 ;       SPACES  ( +n -- )
                                   2641 ;       Send n spaces to output device.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008D84 49 47                 2642         .word      LINK
                           000E60  2643 LINK = . 
      008D86 49                    2644         .byte      6
      008D87 54 3F 41 43 45 53     2645         .ascii     "SPACES"
      008D89                       2646 SPACS:
      008D89 CD 85 22         [ 4] 2647         CALL     ZERO
      008D8C CD 84 34         [ 4] 2648         CALL     MAX
      008D8F 00 30 CD         [ 4] 2649         CALL     TOR
      008D92 87 CD            [ 2] 2650         JRA      CHAR2
      008D94 CD 84 34         [ 4] 2651 CHAR1:  CALL     SPACE
      008D97 00 09 CD         [ 4] 2652 CHAR2:  CALL     DONXT
      008D9A 85 83                 2653         .word    CHAR1
      008D9C CD               [ 4] 2654         RET
                                   2655 
                                   2656 ;       TYPE    ( b u -- )
                                   2657 ;       Output u characters from b.
      008D9D 88 32                 2658         .word      LINK
                           000E7D  2659 LINK = . 
      008D9F CD                    2660         .byte      4
      008DA0 84 67 8D BA           2661         .ascii     "TYPE"
      000E82                       2662 TYPES:
      008DA4 CD 84 34         [ 4] 2663         CALL     TOR
      008DA7 00 07            [ 2] 2664         JRA     TYPE2
      008DA9 CD 87 CD         [ 4] 2665 TYPE1:  CALL     DUPP
      008DAC CD 85 59         [ 4] 2666         CALL     CAT
      008DAF CD 84 34         [ 4] 2667         CALL     EMIT
      008DB2 00 0A CD         [ 4] 2668         CALL     ONEP
      008DB5 88 32 CD         [ 4] 2669 TYPE2:  CALL     DONXT
      008DB8 85 B9                 2670         .word      TYPE1
      008DBA CD 85 59         [ 2] 2671         JP     DROP
                                   2672 
                                   2673 ;       CR      ( -- )
                                   2674 ;       Output a carriage return
                                   2675 ;       and a line feed.
      008DBD CD 85                 2676         .word      LINK
                           000E9D  2677 LINK = . 
      008DBF 03                    2678         .byte      2
      008DC0 CC 88                 2679         .ascii     "CR"
      000EA0                       2680 CR:
      008DC2 14 8D 82         [ 4] 2681         CALL     DOLIT
      008DC5 07 4E                 2682         .word      CRR
      008DC7 55 4D 42         [ 4] 2683         CALL     EMIT
      008DCA 45 52 3F         [ 4] 2684         CALL     DOLIT
      008DCD 00 0A                 2685         .word      LF
      008DCD CD 86 16         [ 2] 2686         JP     EMIT
                                   2687 
                                   2688 ;       do$     ( -- a )
                                   2689 ;       Return  address of a compiled
                                   2690 ;       string.
      008DD0 CD 84                 2691         .word      LINK
                           000EB2  2692 LINK = . 
      008DD2 B2                    2693 	.byte      COMPO+3
      008DD3 CD 85 22              2694         .ascii     "DO$"
      000EB6                       2695 DOSTR:
      008DD6 CD 8A BA         [ 4] 2696         CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008DD9 CD 85 83         [ 4] 2697         CALL     RAT
      008DDC CD 8B 91         [ 4] 2698         CALL     RFROM
      008DDF CD 85 83         [ 4] 2699         CALL     COUNT
      008DE2 CD 84 D0         [ 4] 2700         CALL     PLUS
      008DE5 CD 84 34         [ 4] 2701         CALL     TOR
      008DE8 00 24 CD         [ 4] 2702         CALL     SWAPP
      008DEB 87 F5 CD         [ 4] 2703         CALL     TOR
      008DEE 84               [ 4] 2704         RET
                                   2705 
                                   2706 ;       $"|     ( -- a )
                                   2707 ;       Run time routine compiled by $".
                                   2708 ;       Return address of a compiled string.
      008DEF 67 8E                 2709         .word      LINK
                           000ED1  2710 LINK = . 
      008DF1 01                    2711 	.byte      COMPO+3
      008DF2 CD 8D 60              2712         .byte     '$','"','|'
      000ED5                       2713 STRQP:
      008DF5 CD 85 69         [ 4] 2714         CALL     DOSTR
      008DF8 CD               [ 4] 2715         RET
                                   2716 
                                   2717 ;       ."|     ( -- )
                                   2718 ;       Run time routine of ." .
                                   2719 ;       Output a compiled string.
      008DF9 8A 4E                 2720         .word      LINK
                           000EDB  2721 LINK = . 
      008DFB CD                    2722 	.byte      COMPO+3
      008DFC 85 69 CD              2723         .byte     '.','"','|'
      000EDF                       2724 DOTQP:
      008DFF 8A 5B CD         [ 4] 2725         CALL     DOSTR
      008E02 85 83 CD         [ 4] 2726         CALL     COUNT
      008E05 84 D0 CD         [ 2] 2727         JP     TYPES
                                   2728 
                                   2729 ;       .R      ( n +n -- )
                                   2730 ;       Display an integer in a field
                                   2731 ;       of n columns, right justified.
      008E08 84 34                 2732         .word      LINK
                           000EEA  2733 LINK = . 
      008E0A 00                    2734         .byte      2
      008E0B 2D CD                 2735         .ascii     ".R"
      000EED                       2736 DOTR:
      008E0D 87 F5 CD         [ 4] 2737         CALL     TOR
      008E10 85 22 CD         [ 4] 2738         CALL     STR
      008E13 85 69 CD         [ 4] 2739         CALL     RFROM
      008E16 85 16 CD         [ 4] 2740         CALL     OVER
      008E19 87 CD CD         [ 4] 2741         CALL     SUBB
      008E1C 85 69 CD         [ 4] 2742         CALL     SPACS
      008E1F 85 16 CD         [ 2] 2743         JP     TYPES
                                   2744 
                                   2745 ;       U.R     ( u +n -- )
                                   2746 ;       Display an unsigned integer
                                   2747 ;       in n column, right justified.
      008E22 87 54                 2748         .word      LINK
                           000F04  2749 LINK = . 
      008E24 CD                    2750         .byte      3
      008E25 87 03 CD              2751         .ascii     "U.R"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      000F08                       2752 UDOTR:
      008E28 84 67 8E         [ 4] 2753         CALL     TOR
      008E2B 8B CD 8A         [ 4] 2754         CALL     BDIGS
      008E2E 5B CD 85         [ 4] 2755         CALL     DIGS
      008E31 22 CD 85         [ 4] 2756         CALL     EDIGS
      008E34 59 CD 85         [ 4] 2757         CALL     RFROM
      008E37 22 CD 84         [ 4] 2758         CALL     OVER
      008E3A D0 CD 86         [ 4] 2759         CALL     SUBB
      008E3D 16 CD 84         [ 4] 2760         CALL     SPACS
      008E40 B2 CD 8D         [ 2] 2761         JP     TYPES
                                   2762 
                                   2763 ;       U.      ( u -- )
                                   2764 ;       Display an unsigned integer
                                   2765 ;       in free format.
      008E43 89 CD                 2766         .word      LINK
                           000F25  2767 LINK = . 
      008E45 84                    2768         .byte      2
      008E46 67 8E                 2769         .ascii     "U."
      000F28                       2770 UDOT:
      008E48 79 CD 85         [ 4] 2771         CALL     BDIGS
      008E4B 69 CD 86         [ 4] 2772         CALL     DIGS
      008E4E 16 CD 84         [ 4] 2773         CALL     EDIGS
      008E51 B2 CD 89         [ 4] 2774         CALL     SPACE
      008E54 CD CD 87         [ 2] 2775         JP     TYPES
                                   2776 
                                   2777 ;       .       ( w -- )
                                   2778 ;       Display an integer in free
                                   2779 ;       format, preceeded by a space.
      008E57 54 CD                 2780         .word      LINK
                           000F39  2781 LINK = . 
      008E59 85                    2782         .byte      1
      008E5A 03                    2783         .ascii     "."
      000F3B                       2784 DOT:
      008E5B CD 8A 4E         [ 4] 2785         CALL     BASE
      008E5E CD 84 48         [ 4] 2786         CALL     AT
      008E61 8E 32 CD         [ 4] 2787         CALL     DOLIT
      008E64 85 16                 2788         .word      10
      008E66 CD 85 69         [ 4] 2789         CALL     XORR    ;?decimal
      008E69 CD 85 4F         [ 4] 2790         CALL     QBRAN
      008E6C CD 84                 2791         .word      DOT1
      008E6E 67 8E 74         [ 2] 2792         JP     UDOT
      008E71 CD 87 7F         [ 4] 2793 DOT1:   CALL     STR
      008E74 CD 85 69         [ 4] 2794         CALL     SPACE
      008E77 20 0F CD         [ 2] 2795         JP     TYPES
                                   2796 
                                   2797 ;       ?       ( a -- )
                                   2798 ;       Display contents in memory cell.
      008E7A 85 03                 2799         .word      LINK
                                   2800         
                           000F5C  2801 LINK = . 
      008E7C CD                    2802         .byte      1
      008E7D 85                    2803         .ascii     "?"
      000F5E                       2804 QUEST:
      008E7E 03 CD 87         [ 4] 2805         CALL     AT
      008E81 34 CD 87         [ 2] 2806         JP     DOT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2807 
                                   2808 ;; Parsing
                                   2809 
                                   2810 ;       parse   ( b u c -- b u delta ; <string> )
                                   2811 ;       Scan string delimited by c.
                                   2812 ;       Return found string and its offset.
      008E84 34 CD                 2813         .word      LINK
                           000F66  2814 LINK = . 
      008E86 8A                    2815         .byte      5
      008E87 BA CD 85 59 CD        2816         .ascii     "parse"
      000F6C                       2817 PARS:
      008E8C 85 03 CD         [ 4] 2818         CALL     TEMP
      008E8F 87 34 CD         [ 4] 2819         CALL     STORE
      008E92 85 03 CD         [ 4] 2820         CALL     OVER
      008E95 86 16 CC         [ 4] 2821         CALL     TOR
      008E98 84 9B 8D         [ 4] 2822         CALL     DUPP
      008E9B C5 03 4B         [ 4] 2823         CALL     QBRAN
      008E9E 45 59                 2824         .word    PARS8
      008EA0 CD 09 DB         [ 4] 2825         CALL     ONEM
      008EA0 72 0B 52         [ 4] 2826         CALL     TEMP
      008EA3 40 FB C6         [ 4] 2827         CALL     AT
      008EA6 52 41 1D         [ 4] 2828         CALL     BLANK
      008EA9 00 02 E7         [ 4] 2829         CALL     EQUAL
      008EAC 01 7F 81         [ 4] 2830         CALL     QBRAN
      008EAF 8E 9C                 2831         .word      PARS3
      008EB1 04 4E 55         [ 4] 2832         CALL     TOR
      008EB4 46 3F 2D         [ 4] 2833 PARS1:  CALL     BLANK
      008EB6 CD 05 03         [ 4] 2834         CALL     OVER
      008EB6 CD 84 00         [ 4] 2835         CALL     CAT     ;skip leading blanks ONLY
      008EB9 CD 85 59         [ 4] 2836         CALL     SUBB
      008EBC CD 84 67         [ 4] 2837         CALL     ZLESS
      008EBF 8E CF CD         [ 4] 2838         CALL     INVER
      008EC2 87 34 CD         [ 4] 2839         CALL     QBRAN
      008EC5 8E A0                 2840         .word      PARS2
      008EC7 CD 84 34         [ 4] 2841         CALL     ONEP
      008ECA 00 0D CC         [ 4] 2842         CALL     DONXT
      008ECD 87 F5                 2843         .word      PARS1
      008ECF 81 8E B1         [ 4] 2844         CALL     RFROM
      008ED2 05 53 50         [ 4] 2845         CALL     DROP
      008ED5 41 43 45         [ 4] 2846         CALL     ZERO
      008ED8 CC 04 D9         [ 2] 2847         JP     DUPP
      008ED8 CD 8A AD         [ 4] 2848 PARS2:  CALL     RFROM
      008EDB CC 84 1E         [ 4] 2849 PARS3:  CALL     OVER
      008EDE 8E D2 06         [ 4] 2850         CALL     SWAPP
      008EE1 53 50 41         [ 4] 2851         CALL     TOR
      008EE4 43 45 53         [ 4] 2852 PARS4:  CALL     TEMP
      008EE7 CD 04 32         [ 4] 2853         CALL     AT
      008EE7 CD 8A BA         [ 4] 2854         CALL     OVER
      008EEA CD 88 52         [ 4] 2855         CALL     CAT
      008EED CD 85 22         [ 4] 2856         CALL     SUBB    ;scan for delimiter
      008EF0 20 03 CD         [ 4] 2857         CALL     TEMP
      008EF3 8E D8 CD         [ 4] 2858         CALL     AT
      008EF6 84 48 8E         [ 4] 2859         CALL     BLANK
      008EF9 F2 81 8E         [ 4] 2860         CALL     EQUAL
      008EFC E0 04 54         [ 4] 2861         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008EFF 59 50                 2862         .word      PARS5
      008F01 45 05 12         [ 4] 2863         CALL     ZLESS
      008F02 CD 03 E7         [ 4] 2864 PARS5:  CALL     QBRAN
      008F02 CD 85                 2865         .word      PARS6
      008F04 22 20 0C         [ 4] 2866         CALL     ONEP
      008F07 CD 85 59         [ 4] 2867         CALL     DONXT
      008F0A CD 84                 2868         .word      PARS4
      008F0C D0 CD 84         [ 4] 2869         CALL     DUPP
      008F0F 1E CD 8A         [ 4] 2870         CALL     TOR
      008F12 4E CD            [ 2] 2871         JRA     PARS7
      008F14 84 48 8F         [ 4] 2872 PARS6:  CALL     RFROM
      008F17 07 CC 85         [ 4] 2873         CALL     DROP
      008F1A 4F 8E FD         [ 4] 2874         CALL     DUPP
      008F1D 02 43 52         [ 4] 2875         CALL     ONEP
      008F20 CD 04 A2         [ 4] 2876         CALL     TOR
      008F20 CD 84 34         [ 4] 2877 PARS7:  CALL     OVER
      008F23 00 0D CD         [ 4] 2878         CALL     SUBB
      008F26 84 1E CD         [ 4] 2879         CALL     RFROM
      008F29 84 34 00         [ 4] 2880         CALL     RFROM
      008F2C 0A CC 84         [ 2] 2881         JP     SUBB
      008F2F 1E 8F 1D         [ 4] 2882 PARS8:  CALL     OVER
      008F32 43 44 4F         [ 4] 2883         CALL     RFROM
      008F35 24 07 4D         [ 2] 2884         JP     SUBB
                                   2885 
                                   2886 ;       PARSE   ( c -- b u ; <string> )
                                   2887 ;       Scan input stream and return
                                   2888 ;       counted string delimited by c.
      008F36 0F 66                 2889         .word      LINK
                           00102F  2890 LINK = . 
      008F36 CD                    2891         .byte      5
      008F37 85 03 CD 85 16        2892         .ascii     "PARSE"
      001035                       2893 PARSE:
      008F3C CD 85 03         [ 4] 2894         CALL     TOR
      008F3F CD 8B 91         [ 4] 2895         CALL     TIB
      008F42 CD 87 54         [ 4] 2896         CALL     INN
      008F45 CD 85 22         [ 4] 2897         CALL     AT
      008F48 CD 85 69         [ 4] 2898         CALL     PLUS    ;current input buffer pointer
      008F4B CD 85 22         [ 4] 2899         CALL     NTIB
      008F4E 81 8F 32         [ 4] 2900         CALL     AT
      008F51 43 24 22         [ 4] 2901         CALL     INN
      008F54 7C 04 32         [ 4] 2902         CALL     AT
      008F55 CD 07 4D         [ 4] 2903         CALL     SUBB    ;remaining count
      008F55 CD 8F 36         [ 4] 2904         CALL     RFROM
      008F58 81 8F 51         [ 4] 2905         CALL     PARS
      008F5B 43 2E 22         [ 4] 2906         CALL     INN
      008F5E 7C 0A AA         [ 2] 2907         JP     PSTOR
                                   2908 
                                   2909 ;       .(      ( -- )
                                   2910 ;       Output following string up to next ) .
      008F5F 10 2F                 2911         .word      LINK
                           001061  2912 LINK = . 
      008F5F CD                    2913 	.byte      IMEDD+2
      008F60 8F 36                 2914         .ascii     ".("
      001064                       2915 DOTPR:
      008F62 CD 8B 91         [ 4] 2916         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008F65 CC 8F                 2917         .word     41	; ")"
      008F67 02 8F 5B         [ 4] 2918         CALL     PARSE
      008F6A 02 2E 52         [ 2] 2919         JP     TYPES
                                   2920 
                                   2921 ;       (       ( -- )
                                   2922 ;       Ignore following string up to next ).
                                   2923 ;       A comment.
      008F6D 10 61                 2924         .word      LINK
                           001071  2925 LINK = . 
      008F6D CD                    2926 	.byte      IMEDD+1
      008F6E 85                    2927         .ascii     "("
      001073                       2928 PAREN:
      008F6F 22 CD 8D         [ 4] 2929         CALL     DOLIT
      008F72 42 CD                 2930         .word     41	; ")"
      008F74 85 03 CD         [ 4] 2931         CALL     PARSE
      008F77 85 83 CD         [ 2] 2932         JP     DDROP
                                   2933 
                                   2934 ;       \       ( -- )
                                   2935 ;       Ignore following text till
                                   2936 ;       end of line.
      008F7A 87 CD                 2937         .word      LINK
                           001080  2938 LINK = . 
      008F7C CD                    2939 	.byte      IMEDD+1
      008F7D 8E                    2940         .ascii     "\"
      001082                       2941 BKSLA:
      008F7E E7 CC 8F 02      [ 2] 2942         ldw y,#UCTIB ; #TIB  
      008F82 8F 6A            [ 2] 2943         ldw y,(y)
      008F84 03 55            [ 2] 2944         pushw y ; count in TIB 
      008F86 2E 52 00 0A      [ 2] 2945         ldw y,#UINN ; >IN 
      008F88 90 BF 24         [ 2] 2946         ldw YTEMP,y
      008F88 CD 85            [ 2] 2947         popw y 
      008F8A 22 CD 8C         [ 5] 2948         ldw [YTEMP],y
      008F8D C5               [ 4] 2949         ret 
                                   2950 
                                   2951 ;       WORD    ( c -- a ; <string> )
                                   2952 ;       Parse a word from input stream
                                   2953 ;       and copy it to code dictionary.
      008F8E CD 8C                 2954         .word      LINK
                           001099  2955 LINK = . 
      008F90 FF                    2956         .byte      4
      008F91 CD 8D 2A CD           2957         .ascii     "WORD"
      00109E                       2958 WORDD:
      008F95 85 03 CD         [ 4] 2959         CALL     PARSE
      008F98 85 83 CD         [ 4] 2960         CALL     HERE
      008F9B 87 CD CD         [ 4] 2961         CALL     CELLP
      008F9E 8E E7 CC         [ 2] 2962         JP     PACKS
                                   2963 
                                   2964 ;       TOKEN   ( -- a ; <string> )
                                   2965 ;       Parse a word from input stream
                                   2966 ;       and copy it to name dictionary.
      008FA1 8F 02                 2967         .word      LINK
                           0010AC  2968 LINK = . 
      008FA3 8F                    2969         .byte      5
      008FA4 84 02 55 2E 4E        2970         .ascii     "TOKEN"
      008FA8                       2971 TOKEN:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008FA8 CD 8C C5         [ 4] 2972         CALL     BLANK
      008FAB CD 8C FF         [ 2] 2973         JP     WORDD
                                   2974 
                                   2975 ;; Dictionary search
                                   2976 
                                   2977 ;       NAME>   ( na -- ca )
                                   2978 ;       Return a code address given
                                   2979 ;       a name address.
      008FAE CD 8D                 2980         .word      LINK
                           0010BA  2981 LINK = . 
      008FB0 2A                    2982         .byte      5
      008FB1 CD 8E D8 CC 8F        2983         .ascii     "NAME>"
      0010C0                       2984 NAMET:
      008FB6 02 8F A5         [ 4] 2985         CALL     COUNT
      008FB9 01 2E B4         [ 4] 2986         CALL     DOLIT
      008FBB 00 1F                 2987         .word      31
      008FBB CD 86 16         [ 4] 2988         CALL     ANDD
      008FBE CD 84 B2         [ 2] 2989         JP     PLUS
                                   2990 
                                   2991 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   2992 ;       Compare u cells in two
                                   2993 ;       strings. Return 0 if identical.
      008FC1 CD 84                 2994         .word      LINK
                           0010D0  2995 LINK = . 
      008FC3 34                    2996         .byte       5
      008FC4 00 0A CD 85 CE        2997         .ascii     "SAME?"
      0010D6                       2998 SAMEQ:
      008FC9 CD 84 67         [ 4] 2999         CALL     ONEM
      008FCC 8F D1 CC         [ 4] 3000         CALL     TOR
      008FCF 8F A8            [ 2] 3001         JRA     SAME2
      008FD1 CD 8D 42         [ 4] 3002 SAME1:  CALL     OVER
      008FD4 CD 8E D8         [ 4] 3003         CALL     RAT
      008FD7 CC 8F 02         [ 4] 3004         CALL     PLUS
      008FDA 8F B9 01         [ 4] 3005         CALL     CAT
      008FDD 3F 05 03         [ 4] 3006         CALL     OVER
      008FDE CD 04 96         [ 4] 3007         CALL     RAT
      008FDE CD 84 B2         [ 4] 3008         CALL     PLUS
      008FE1 CC 8F BB         [ 4] 3009         CALL     CAT
      008FE4 8F DC 05         [ 4] 3010         CALL     SUBB
      008FE7 70 61 72         [ 4] 3011         CALL     QDUP
      008FEA 73 65 E7         [ 4] 3012         CALL     QBRAN
      008FEC 11 07                 3013         .word      SAME2
      008FEC CD 86 25         [ 4] 3014         CALL     RFROM
      008FEF CD 84 9B         [ 2] 3015         JP     DROP
      008FF2 CD 85 83         [ 4] 3016 SAME2:  CALL     DONXT
      008FF5 CD 85                 3017         .word      SAME1
      008FF7 22 CD 85         [ 2] 3018         JP     ZERO
                                   3019 
                                   3020 ;       find    ( a va -- ca na | a F )
                                   3021 ;       Search vocabulary for string.
                                   3022 ;       Return ca and na if succeeded.
      008FFA 59 CD                 3023         .word      LINK
                           001111  3024 LINK = . 
      008FFC 84                    3025         .byte      4
      008FFD 67 90 A4 CD           3026         .ascii     "FIND"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      001116                       3027 FIND:
      009001 8A 5B CD         [ 4] 3028         CALL     SWAPP
      009004 86 25 CD         [ 4] 3029         CALL     DUPP
      009007 84 B2 CD         [ 4] 3030         CALL     CAT
      00900A 8A AD CD         [ 4] 3031         CALL     TEMP
      00900D 87 F5 CD         [ 4] 3032         CALL     STORE
      009010 84 67 90         [ 4] 3033         CALL     DUPP
      009013 45 CD 85         [ 4] 3034         CALL     AT
      009016 22 CD 8A         [ 4] 3035         CALL     TOR
      009019 AD CD 85         [ 4] 3036         CALL     CELLP
      00901C 83 CD 84         [ 4] 3037         CALL     SWAPP
      00901F D0 CD 87         [ 4] 3038 FIND1:  CALL     AT
      009022 CD CD 85         [ 4] 3039         CALL     DUPP
      009025 92 CD 87         [ 4] 3040         CALL     QBRAN
      009028 6E CD                 3041         .word      FIND6
      00902A 84 67 90         [ 4] 3042         CALL     DUPP
      00902D 42 CD 8A         [ 4] 3043         CALL     AT
      009030 4E CD 84         [ 4] 3044         CALL     DOLIT
      009033 48 90                 3045         .word      MASKK
      009035 17 CD 85         [ 4] 3046         CALL     ANDD
      009038 03 CD 85         [ 4] 3047         CALL     RAT
      00903B 4F CD 8A         [ 4] 3048         CALL     XORR
      00903E BA CC 85         [ 4] 3049         CALL     QBRAN
      009041 59 CD                 3050         .word      FIND2
      009043 85 03 CD         [ 4] 3051         CALL     CELLP
      009046 85 83 CD         [ 4] 3052         CALL     DOLIT
      009049 85 69                 3053         .word     0xFFFF
      00904B CD 85            [ 2] 3054         JRA     FIND3
      00904D 22 CD 86         [ 4] 3055 FIND2:  CALL     CELLP
      009050 25 CD 84         [ 4] 3056         CALL     TEMP
      009053 B2 CD 85         [ 4] 3057         CALL     AT
      009056 83 CD 84         [ 4] 3058         CALL     SAMEQ
      009059 D0 CD 87         [ 4] 3059 FIND3:  CALL     BRAN
      00905C CD CD                 3060         .word      FIND4
      00905E 86 25 CD         [ 4] 3061 FIND6:  CALL     RFROM
      009061 84 B2 CD         [ 4] 3062         CALL     DROP
      009064 8A AD CD         [ 4] 3063         CALL     SWAPP
      009067 87 F5 CD         [ 4] 3064         CALL     CELLM
      00906A 84 67 90         [ 2] 3065         JP     SWAPP
      00906D 71 CD 85         [ 4] 3066 FIND4:  CALL     QBRAN
      009070 92 CD                 3067         .word      FIND5
      009072 84 67 90         [ 4] 3068         CALL     CELLM
      009075 86 CD 8A         [ 4] 3069         CALL     CELLM
      009078 4E CD            [ 2] 3070         JRA     FIND1
      00907A 84 48 90         [ 4] 3071 FIND5:  CALL     RFROM
      00907D 4E CD 85         [ 4] 3072         CALL     DROP
      009080 59 CD 85         [ 4] 3073         CALL     SWAPP
      009083 22 20 0F         [ 4] 3074         CALL     DROP
      009086 CD 85 03         [ 4] 3075         CALL     CELLM
      009089 CD 85 4F         [ 4] 3076         CALL     DUPP
      00908C CD 85 59         [ 4] 3077         CALL     NAMET
      00908F CD 8A 4E         [ 2] 3078         JP     SWAPP
                                   3079 
                                   3080 ;       NAME?   ( a -- ca na | a F )
                                   3081 ;       Search vocabularies for a string.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009092 CD 85                 3082         .word      LINK
                           0011A9  3083 LINK = . 
      009094 22                    3084         .byte      5
      009095 CD 85 83 CD 87        3085         .ascii     "NAME?"
      0011AF                       3086 NAMEQ:
      00909A CD CD 85         [ 4] 3087         CALL   CNTXT
      00909D 03 CD 85         [ 2] 3088         JP     FIND
                                   3089 
                                   3090 ;; Terminal response
                                   3091 
                                   3092 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3093 ;       Backup cursor by one character.
      0090A0 03 CC                 3094         .word      LINK
                           0011B7  3095 LINK = . 
      0090A2 87                    3096         .byte      2
      0090A3 CD CD                 3097         .ascii     "^H"
      0011BA                       3098 BKSP:
      0090A5 85 83 CD         [ 4] 3099         CALL     TOR
      0090A8 85 03 CC         [ 4] 3100         CALL     OVER
      0090AB 87 CD 8F         [ 4] 3101         CALL     RFROM
      0090AE E6 05 50         [ 4] 3102         CALL     SWAPP
      0090B1 41 52 53         [ 4] 3103         CALL     OVER
      0090B4 45 05 4E         [ 4] 3104         CALL     XORR
      0090B5 CD 03 E7         [ 4] 3105         CALL     QBRAN
      0090B5 CD 85                 3106         .word      BACK1
      0090B7 22 CD 8B         [ 4] 3107         CALL     DOLIT
      0090BA CA CD                 3108         .word      BKSPP
      0090BC 86 34 CD         [ 4] 3109         CALL     EMIT
      0090BF 84 B2 CD         [ 4] 3110         CALL     ONEM
      0090C2 87 54 CD         [ 4] 3111         CALL     BLANK
      0090C5 86 44 CD         [ 4] 3112         CALL     EMIT
      0090C8 84 B2 CD         [ 4] 3113         CALL     DOLIT
      0090CB 86 34                 3114         .word      BKSPP
      0090CD CD 84 B2         [ 2] 3115         JP     EMIT
      0090D0 CD               [ 4] 3116 BACK1:  RET
                                   3117 
                                   3118 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3119 ;       Accept and echo key stroke
                                   3120 ;       and bump cursor.
      0090D1 87 CD                 3121         .word      LINK
                           0011ED  3122 LINK = . 
      0090D3 CD                    3123         .byte      3
      0090D4 85 03 CD              3124         .ascii     "TAP"
      0011F1                       3125 TAP:
      0090D7 8F EC CD         [ 4] 3126         CALL     DUPP
      0090DA 86 34 CC         [ 4] 3127         CALL     EMIT
      0090DD 8B 2A 90         [ 4] 3128         CALL     OVER
      0090E0 AF 82 2E         [ 4] 3129         CALL     CSTOR
      0090E3 28 09 CE         [ 2] 3130         JP     ONEP
                                   3131 
                                   3132 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3133 ;       Process a key stroke,
                                   3134 ;       CR or backspace.
      0090E4 11 ED                 3135         .word      LINK
                           001202  3136 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0090E4 CD                    3137         .byte      4
      0090E5 84 34 00 29           3138         .ascii     "KTAP"
      001207                       3139 KTAP:
      0090E9 CD 90 B5         [ 4] 3140         CALL     DUPP
      0090EC CC 8F 02         [ 4] 3141         CALL     DOLIT
      0090EF 90 E1                 3142         .word      CRR
      0090F1 81 28 4E         [ 4] 3143         CALL     XORR
      0090F3 CD 03 E7         [ 4] 3144         CALL     QBRAN
      0090F3 CD 84                 3145         .word      KTAP2
      0090F5 34 00 29         [ 4] 3146         CALL     DOLIT
      0090F8 CD 90                 3147         .word      BKSPP
      0090FA B5 CC 87         [ 4] 3148         CALL     XORR
      0090FD 34 90 F1         [ 4] 3149         CALL     QBRAN
      009100 81 5C                 3150         .word      KTAP1
      009102 CD 0A 2D         [ 4] 3151         CALL     BLANK
      009102 90 AE 00         [ 2] 3152         JP     TAP
      009105 0C 90 FE         [ 2] 3153 KTAP1:  JP     BKSP
      009108 90 89 90         [ 4] 3154 KTAP2:  CALL     DROP
      00910B AE 00 0A         [ 4] 3155         CALL     SWAPP
      00910E 90 BF 24         [ 4] 3156         CALL     DROP
      009111 90 85 91         [ 2] 3157         JP     DUPP
                                   3158 
                                   3159 ;       accept  ( b u -- b u )
                                   3160 ;       Accept characters to input
                                   3161 ;       buffer. Return with actual count.
      009114 CF 24                 3162         .word      LINK
                           00123B  3163 LINK = . 
      009116 81                    3164         .byte      6
      009117 91 00 04 57 4F 52     3165         .ascii     "ACCEPT"
      001242                       3166 ACCEP:
      00911D 44 05 03         [ 4] 3167         CALL     OVER
      00911E CD 06 D4         [ 4] 3168         CALL     PLUS
      00911E CD 90 B5         [ 4] 3169         CALL     OVER
      009121 CD 8B A8         [ 4] 3170 ACCP1:  CALL     DDUP
      009124 CD 8A 23         [ 4] 3171         CALL     XORR
      009127 CC 8C 68         [ 4] 3172         CALL     QBRAN
      00912A 91 19                 3173         .word      ACCP4
      00912C 05 54 4F         [ 4] 3174         CALL     KEY
      00912F 4B 45 4E         [ 4] 3175         CALL     DUPP
      009132 CD 0A 2D         [ 4] 3176         CALL     BLANK
      009132 CD 8A AD         [ 4] 3177         CALL     DOLIT
      009135 CC 91                 3178         .word      127
      009137 1E 91 2C         [ 4] 3179         CALL     WITHI
      00913A 05 4E 41         [ 4] 3180         CALL     QBRAN
      00913D 4D 45                 3181         .word      ACCP2
      00913F 3E 11 F1         [ 4] 3182         CALL     TAP
      009140 20 03            [ 2] 3183         JRA     ACCP3
      009140 CD 8B 91         [ 4] 3184 ACCP2:  CALL     KTAP
      009143 CD 84            [ 2] 3185 ACCP3:  JRA     ACCP1
      009145 34 00 1F         [ 4] 3186 ACCP4:  CALL     DROP
      009148 CD 85 A5         [ 4] 3187         CALL     OVER
      00914B CC 87 54         [ 2] 3188         JP     SUBB
                                   3189 
                                   3190 ;       QUERY   ( -- )
                                   3191 ;       Accept input stream to
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   3192 ;       terminal input buffer.
      00914E 91 3A                 3193         .word      LINK
                                   3194         
                           001281  3195 LINK = . 
      009150 05                    3196         .byte      5
      009151 53 41 4D 45 3F        3197         .ascii     "QUERY"
      009156                       3198 QUERY:
      009156 CD 8A 5B         [ 4] 3199         CALL     TIB
      009159 CD 85 22         [ 4] 3200         CALL     DOLIT
      00915C 20 29                 3201         .word      80
      00915E CD 85 83         [ 4] 3202         CALL     ACCEP
      009161 CD 85 16         [ 4] 3203         CALL     NTIB
      009164 CD 87 54         [ 4] 3204         CALL     STORE
      009167 CD 84 D0         [ 4] 3205         CALL     DROP
      00916A CD 85 83         [ 4] 3206         CALL     ZERO
      00916D CD 85 16         [ 4] 3207         CALL     INN
      009170 CD 87 54         [ 2] 3208         JP     STORE
                                   3209 
                                   3210 ;       ABORT   ( -- )
                                   3211 ;       Reset data stack and
                                   3212 ;       jump to QUIT.
      009173 CD 84                 3213         .word      LINK
                           0012A6  3214 LINK = . 
      009175 D0                    3215         .byte      5
      009176 CD 87 CD CD 87        3216         .ascii     "ABORT"
      0012AC                       3217 ABORT:
      00917B 03 CD 84         [ 4] 3218         CALL     PRESE
      00917E 67 91 87         [ 2] 3219         JP     QUIT
                                   3220 
                                   3221 ;       abort"  ( f -- )
                                   3222 ;       Run time routine of ABORT".
                                   3223 ;       Abort with a message.
      009181 CD 85                 3224         .word      LINK
                           0012B4  3225 LINK = . 
      009183 03                    3226 	.byte      COMPO+6
      009184 CC 85 4F CD 84        3227         .ascii     "ABORT"
      009189 48                    3228         .byte      '"'
      0012BB                       3229 ABORQ:
      00918A 91 5E CC         [ 4] 3230         CALL     QBRAN
      00918D 8A BA                 3231         .word      ABOR2   ;text flag
      00918F 91 50 04         [ 4] 3232         CALL     DOSTR
      009192 46 49 4E         [ 4] 3233 ABOR1:  CALL     SPACE
      009195 44 0B 11         [ 4] 3234         CALL     COUNT
      009196 CD 0E 82         [ 4] 3235         CALL     TYPES
      009196 CD 85 69         [ 4] 3236         CALL     DOLIT
      009199 CD 85                 3237         .word     63 ; "?"
      00919B 59 CD 84         [ 4] 3238         CALL     EMIT
      00919E D0 CD 86         [ 4] 3239         CALL     CR
      0091A1 25 CD 84         [ 2] 3240         JP     ABORT   ;pass error string
      0091A4 9B CD 85         [ 4] 3241 ABOR2:  CALL     DOSTR
      0091A7 59 CD 84         [ 2] 3242         JP     DROP
                                   3243 
                                   3244 ;; The text interpreter
                                   3245 
                                   3246 ;       $INTERPRET      ( a -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3247 ;       Interpret a word. If failed,
                                   3248 ;       try to convert it to an integer.
      0091AA B2 CD                 3249         .word      LINK
                           0012E2  3250 LINK = . 
      0091AC 85                    3251         .byte      10
      0091AD 22 CD 8A 23 CD 85 69  3252         .ascii     "$INTERPRET"
             CD 84 B2
      0012ED                       3253 INTER:
      0091B7 CD 85 59         [ 4] 3254         CALL     NAMEQ
      0091BA CD 84 67         [ 4] 3255         CALL     QDUP    ;?defined
      0091BD 91 F3 CD         [ 4] 3256         CALL     QBRAN
      0091C0 85 59                 3257         .word      INTE1
      0091C2 CD 84 B2         [ 4] 3258         CALL     AT
      0091C5 CD 84 34         [ 4] 3259         CALL     DOLIT
      0091C8 1F 7F                 3260 	.word       0x4000	; COMPO*256
      0091CA CD 85 A5         [ 4] 3261         CALL     ANDD    ;?compile only lexicon bits
      0091CD CD 85 16         [ 4] 3262         CALL     ABORQ
      0091D0 CD                    3263         .byte      13
      0091D1 85 CE CD 84 67 91 E2  3264         .ascii     " compile only"
             CD 8A 23 CD 84 34
      0091DE FF FF 20         [ 2] 3265         JP     EXECU
      0091E1 0C CD 8A         [ 4] 3266 INTE1:  CALL     NUMBQ   ;convert a number
      0091E4 23 CD 86         [ 4] 3267         CALL     QBRAN
      0091E7 25 CD                 3268         .word    ABOR1
      0091E9 84               [ 4] 3269         RET
                                   3270 
                                   3271 ;       [       ( -- )
                                   3272 ;       Start  text interpreter.
      0091EA B2 CD                 3273         .word      LINK
                           001322  3274 LINK = . 
      0091EC 91                    3275 	.byte      IMEDD+1
      0091ED 56                    3276         .ascii     "["
      001324                       3277 LBRAC:
      0091EE CD 84 7E         [ 4] 3278         CALL   DOLIT
      0091F1 92 02                 3279         .word  INTER
      0091F3 CD 85 03         [ 4] 3280         CALL   TEVAL
      0091F6 CD 85 4F         [ 2] 3281         JP     STORE
                                   3282 
                                   3283 ;       .OK     ( -- )
                                   3284 ;       Display 'ok' while interpreting.
      0091F9 CD 85                 3285         .word      LINK
                           001331  3286 LINK = . 
      0091FB 69                    3287         .byte      3
      0091FC CD 8A 32              3288         .ascii     ".OK"
      001335                       3289 DOTOK:
      0091FF CC 85 69         [ 4] 3290         CALL     DOLIT
      009202 CD 84                 3291         .word      INTER
      009204 67 92 0F         [ 4] 3292         CALL     TEVAL
      009207 CD 8A 32         [ 4] 3293         CALL     AT
      00920A CD 8A 32         [ 4] 3294         CALL     EQUAL
      00920D 20 A5 CD         [ 4] 3295         CALL     QBRAN
      009210 85 03                 3296         .word      DOTO1
      009212 CD 85 4F         [ 4] 3297         CALL     DOTQP
      009215 CD                    3298         .byte      3
      009216 85 69 CD              3299         .ascii     " ok"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      009219 85 4F CD         [ 2] 3300 DOTO1:  JP     CR
                                   3301 
                                   3302 ;       ?STACK  ( -- )
                                   3303 ;       Abort if stack underflows.
      00921C 8A 32                 3304         .word      LINK
                           001354  3305 LINK = . 
      00921E CD                    3306         .byte      6
      00921F 85 59 CD 91 40 CC     3307         .ascii     "?STACK"
      00135B                       3308 QSTAC: 
      009225 85 69 91         [ 4] 3309         CALL     DEPTH
      009228 91 05 4E         [ 4] 3310         CALL     ZLESS   ;check only for underflow
      00922B 41 4D 45         [ 4] 3311         CALL     ABORQ
      00922E 3F                    3312         .byte      11
      00922F 20 75 6E 64 65 72 66  3313         .ascii     " underflow "
             6C 6F 77 20
      00922F CD               [ 4] 3314         RET
                                   3315 
                                   3316 ;       EVAL    ( -- )
                                   3317 ;       Interpret  input stream.
      009230 86 99                 3318         .word      LINK
                           001373  3319 LINK = . 
      009232 CC                    3320         .byte      4
      009233 91 96 92 29           3321         .ascii     "EVAL"
      001378                       3322 EVAL:
      009237 02 5E 48         [ 4] 3323 EVAL1:  CALL     TOKEN
      00923A CD 04 D9         [ 4] 3324         CALL     DUPP
      00923A CD 85 22         [ 4] 3325         CALL     CAT     ;?input stream empty
      00923D CD 85 83         [ 4] 3326         CALL     QBRAN
      009240 CD 85                 3327         .word    EVAL2
      009242 03 CD 85         [ 4] 3328         CALL     TEVAL
      009245 69 CD 85         [ 4] 3329         CALL     ATEXE
      009248 83 CD 85         [ 4] 3330         CALL     QSTAC   ;evaluate input, check stack
      00924B CE CD 84         [ 4] 3331         CALL     BRAN
      00924E 67 92                 3332         .word    EVAL1
      009250 6A CD 84         [ 4] 3333 EVAL2:  CALL     DROP
      009253 34 00 08         [ 2] 3334         JP       DOTOK
                                   3335 
                                   3336 ;       PRESET  ( -- )
                                   3337 ;       Reset data stack pointer and
                                   3338 ;       terminal input buffer.
      009256 CD 84                 3339         .word      LINK
                           00139C  3340 LINK = . 
      009258 1E                    3341         .byte      6
      009259 CD 8A 5B CD 8A AD     3342         .ascii     "PRESET"
      0013A3                       3343 PRESE:
      00925F CD 84 1E         [ 4] 3344         CALL     DOLIT
      009262 CD 84                 3345         .word      SPP
      009264 34 00 08         [ 4] 3346         CALL     SPSTO
      009267 CC 84 1E         [ 4] 3347         CALL     DOLIT
      00926A 81 92                 3348         .word      TIBB
      00926C 37 03 54         [ 4] 3349         CALL     NTIB
      00926F 41 50 A3         [ 4] 3350         CALL     CELLP
      009271 CC 04 1B         [ 2] 3351         JP     STORE
                                   3352 
                                   3353 ;       QUIT    ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3354 ;       Reset return stack pointer
                                   3355 ;       and start text interpreter.
      009271 CD 85                 3356         .word      LINK
                           0013BB  3357 LINK = . 
      009273 59                    3358         .byte      4
      009274 CD 84 1E CD           3359         .ascii     "QUIT"
      0013C0                       3360 QUIT:
      009278 85 83 CD         [ 4] 3361         CALL     DOLIT
      00927B 84 BF                 3362         .word      RPP
      00927D CC 8A 4E         [ 4] 3363         CALL     RPSTO   ;reset return stack pointer
      009280 92 6D 04         [ 4] 3364 QUIT1:  CALL     LBRAC   ;start interpretation
      009283 4B 54 41         [ 4] 3365 QUIT2:  CALL     QUERY   ;get input
      009286 50 13 78         [ 4] 3366         CALL     EVAL
      009287 20 F8            [ 2] 3367         JRA     QUIT2   ;continue till error
                                   3368 
                                   3369 ;; The compiler
                                   3370 
                                   3371 ;       '       ( -- ca )
                                   3372 ;       Search vocabularies for
                                   3373 ;       next word in input stream.
      009287 CD 85                 3374         .word      LINK
                           0013D5  3375 LINK = . 
      009289 59                    3376         .byte      1
      00928A CD                    3377         .ascii     "'"
      0013D7                       3378 TICK:
      00928B 84 34 00         [ 4] 3379         CALL     TOKEN
      00928E 0D CD 85         [ 4] 3380         CALL     NAMEQ   ;?defined
      009291 CE CD 84         [ 4] 3381         CALL     QBRAN
      009294 67 92                 3382         .word      ABOR1
      009296 AD               [ 4] 3383         RET     ;yes, push code address
                                   3384 
                                   3385 ;       ALLOT   ( n -- )
                                   3386 ;       Allocate n bytes to RAM 
      009297 CD 84                 3387         .word      LINK
                           0013E5  3388         LINK = . 
      009299 34                    3389         .byte      5
      00929A 00 08 CD 85 CE        3390         .ascii     "ALLOT"
      0013EB                       3391 ALLOT:
      00929F CD 84 67         [ 4] 3392         CALL     VPP
                                   3393 ; must update APP_VP each time VP is modidied
      0092A2 92 AA CD         [ 4] 3394         call PSTOR 
      0092A5 8A AD CC         [ 2] 3395         jp UPDATVP 
                                   3396 
                                   3397 ;       ,       ( w -- )
                                   3398 ;         Compile an integer into
                                   3399 ;         variable space.
      0092A8 92 71                 3400         .word      LINK
                           0013F6  3401 LINK = . 
      0092AA CC                    3402         .byte      1
      0092AB 92                    3403         .ascii     ","
      0013F8                       3404 COMMA:
      0092AC 3A CD 85         [ 4] 3405         CALL     HERE
      0092AF 4F CD 85         [ 4] 3406         CALL     DUPP
      0092B2 69 CD 85         [ 4] 3407         CALL     CELLP   ;cell boundary
      0092B5 4F CC 85         [ 4] 3408         CALL     VPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0092B8 59 92 82         [ 4] 3409         CALL     STORE
      0092BB 06 41 43         [ 2] 3410         JP     STORE
                                   3411 
                                   3412 ;       C,      ( c -- )
                                   3413 ;       Compile a byte into
                                   3414 ;       variables space.
      0092BE 43 45                 3415        .word      LINK
                           00140C  3416 LINK = . 
      0092C0 50                    3417         .byte      2
      0092C1 54 2C                 3418         .ascii     "C,"
      0092C2                       3419 CCOMMA:
      0092C2 CD 85 83         [ 4] 3420         CALL     HERE
      0092C5 CD 87 54         [ 4] 3421         CALL     DUPP
      0092C8 CD 85 83         [ 4] 3422         CALL     ONEP
      0092CB CD 87 3F         [ 4] 3423         CALL     VPP
      0092CE CD 85 CE         [ 4] 3424         CALL     STORE
      0092D1 CD 84 67         [ 2] 3425         JP     CSTOR
                                   3426 
                                   3427 ;       [COMPILE]       ( -- ; <string> )
                                   3428 ;       Compile next immediate
                                   3429 ;       word into code dictionary.
      0092D4 92 F6                 3430         .word      LINK
                           001423  3431 LINK = . 
      0092D6 CD                    3432 	.byte      IMEDD+9
      0092D7 8E A0 CD 85 59 CD 8A  3433         .ascii     "[COMPILE]"
             AD CD
      00142D                       3434 BCOMP:
      0092E0 84 34 00         [ 4] 3435         CALL     TICK
      0092E3 7F CD 88         [ 2] 3436         JP     JSRC
                                   3437 
                                   3438 ;       COMPILE ( -- )
                                   3439 ;       Compile next jsr in
                                   3440 ;       colon list to code dictionary.
      0092E6 8F CD                 3441         .word      LINK
                           001435  3442 LINK = . 
      0092E8 84                    3443 	.byte      COMPO+7
      0092E9 67 92 F1 CD 92 71 20  3444         .ascii     "COMPILE"
      00143D                       3445 COMPI:
      0092F0 03 CD 92         [ 4] 3446         CALL     RFROM
      0092F3 87 20 D5         [ 4] 3447         CALL     DUPP
      0092F6 CD 85 4F         [ 4] 3448         CALL     AT
      0092F9 CD 85 83         [ 4] 3449         CALL     JSRC    ;compile subroutine
      0092FC CC 87 CD         [ 4] 3450         CALL     CELLP
      0092FF 92 BB            [ 1] 3451         ldw y,x 
      009301 05 51            [ 2] 3452         ldw y,(y)
      009303 55 45 52         [ 2] 3453         addw x,#CELLL 
      009306 59 FC            [ 2] 3454         jp (y)
                                   3455 
                                   3456 ;       LITERAL ( w -- )
                                   3457 ;       Compile tos to dictionary
                                   3458 ;       as an integer literal.
      009307 14 35                 3459         .word      LINK
                           001457  3460 LINK = . 
      009307 CD                    3461 	.byte      IMEDD+7
      009308 8B CA CD 84 34 00 50  3462         .ascii     "LITERAL"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal  CD-Bits]



      00145F                       3463 LITER:
      009310 92 C2 CD         [ 4] 3464         CALL     COMPI
      009313 86 44                 3465         .word DOLIT 
      009315 CD 84 9B         [ 2] 3466         JP     COMMA
                                   3467 
                                   3468 ;       $,"     ( -- )
                                   3469 ;       Compile a literal string
                                   3470 ;       up to next " .
      009318 CD 85                 3471         .word      LINK
                           001469  3472 LINK = . 
      00931A 4F                    3473         .byte      3
      00931B CD 8A BA              3474         .byte     '$',',','"'
      00146D                       3475 STRCQ:
      00931E CD 86 34         [ 4] 3476         CALL     DOLIT
      009321 CC 84                 3477         .word     34	; "
      009323 9B 93 01         [ 4] 3478         CALL     PARSE
      009326 05 41 42         [ 4] 3479         CALL     HERE
      009329 4F 52 54         [ 4] 3480         CALL     PACKS   ;string to code dictionary
      00932C CD 0B 11         [ 4] 3481         CALL     COUNT
      00932C CD 94 23         [ 4] 3482         CALL     PLUS    ;calculate aligned end of string
      00932F CC 94 40         [ 4] 3483         CALL     VPP
      009332 93 26 46         [ 2] 3484         JP     STORE
                                   3485 
                                   3486 ;; Structures
                                   3487 
                                   3488 ;       FOR     ( -- a )
                                   3489 ;       Start a FOR-NEXT loop
                                   3490 ;       structure in a colon definition.
      009335 41 42                 3491         .word      LINK
                           001489  3492 LINK = . 
      009337 4F                    3493 	.byte      IMEDD+3
      009338 52 54 22              3494         .ascii     "FOR"
      00933B                       3495 FOR:
      00933B CD 84 67         [ 4] 3496         CALL     COMPI
      00933E 93 5A                 3497         .word TOR 
      009340 CD 8F 36         [ 2] 3498         JP     HERE
                                   3499 
                                   3500 ;       NEXT    ( a -- )
                                   3501 ;       Terminate a FOR-NEXT loop.
      009343 CD 8E                 3502         .word      LINK
                           001497  3503 LINK = . 
      009345 D8                    3504 	.byte      IMEDD+4
      009346 CD 8B 91 CD           3505         .ascii     "NEXT"
      00149C                       3506 NEXT:
      00934A 8F 02 CD         [ 4] 3507         CALL     COMPI
      00934D 84 34                 3508         .word DONXT 
      00934F 00 3F CD         [ 4] 3509         call ADRADJ
      009352 84 1E CD         [ 2] 3510         JP     COMMA
                                   3511 
                                   3512 ;       I ( -- n )
                                   3513 ;       stack FOR-NEXT COUNTER 
      009355 8F 20                 3514         .word LINK 
                           0014A9  3515         LINK=.
      009357 CC                    3516         .byte 1 
      009358 93                    3517         .ascii "I"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0014AB                       3518 IFETCH: 
      009359 2C CD 8F         [ 2] 3519         subw x,#CELLL 
      00935C 36 CC            [ 2] 3520         ldw y,(3,sp)
      00935E 85               [ 2] 3521         ldw (x),y 
      00935F 4F               [ 4] 3522         ret 
                                   3523 
                                   3524 ;       BEGIN   ( -- a )
                                   3525 ;       Start an infinite or
                                   3526 ;       indefinite loop structure.
      009360 93 34                 3527         .word      LINK
                           0014B4  3528 LINK = . 
      009362 0A                    3529 	.byte      IMEDD+5
      009363 24 49 4E 54 45        3530         .ascii     "BEGIN"
      0014BA                       3531 BEGIN:
      009368 52 50 52         [ 2] 3532         JP     HERE
                                   3533 
                                   3534 ;       UNTIL   ( a -- )
                                   3535 ;       Terminate a BEGIN-UNTIL
                                   3536 ;       indefinite loop structure.
      00936B 45 54                 3537         .word      LINK
                           0014BF  3538 LINK = . 
      00936D 85                    3539 	.byte      IMEDD+5
      00936D CD 92 2F CD 87        3540         .ascii     "UNTIL"
      0014C5                       3541 UNTIL:
      009372 03 CD 84         [ 4] 3542         CALL     COMPI
      009375 67 93                 3543         .word    QBRAN 
      009377 97 CD 84         [ 4] 3544         call ADRADJ
      00937A B2 CD 84         [ 2] 3545         JP     COMMA
                                   3546 
                                   3547 ;       AGAIN   ( a -- )
                                   3548 ;       Terminate a BEGIN-AGAIN
                                   3549 ;       infinite loop structure.
      00937D 34 40                 3550         .word      LINK
                           0014D2  3551 LINK = . 
      00937F 00                    3552 	.byte      IMEDD+5
      009380 CD 85 A5 CD 93        3553         .ascii     "AGAIN"
      0014D8                       3554 AGAIN:
      009385 3B 0D 20         [ 4] 3555         CALL     COMPI
      009388 63 6F                 3556         .word BRAN
      00938A 6D 70 69         [ 4] 3557         call ADRADJ 
      00938D 6C 65 20         [ 2] 3558         JP     COMMA
                                   3559 
                                   3560 ;       IF      ( -- A )
                                   3561 ;       Begin a conditional branch.
      009390 6F 6E                 3562         .word      LINK
                           0014E5  3563 LINK = . 
      009392 6C                    3564 	.byte      IMEDD+2
      009393 79 CC                 3565         .ascii     "IF"
      0014E8                       3566 IFF:
      009395 84 8E CD         [ 4] 3567         CALL     COMPI
      009398 8D CD                 3568         .word QBRAN
      00939A CD 84 67         [ 4] 3569         CALL     HERE
      00939D 93 43 81         [ 4] 3570         CALL     ZERO
      0093A0 93 62 81         [ 2] 3571         JP     COMMA
                                   3572 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   3573 ;       THEN        ( A -- )
                                   3574 ;       Terminate a conditional branch structure.
      0093A3 5B E5                 3575         .word      LINK
                           0014F8  3576 LINK = . 
      0093A4 84                    3577 	.byte      IMEDD+4
      0093A4 CD 84 34 93           3578         .ascii     "THEN"
      0014FD                       3579 THENN:
      0093A8 6D CD 86         [ 4] 3580         CALL     HERE
      0093AB 77 CC 84         [ 4] 3581         call ADRADJ 
      0093AE 9B 93 A2         [ 4] 3582         CALL     SWAPP
      0093B1 03 2E 4F         [ 2] 3583         JP     STORE
                                   3584 
                                   3585 ;       ELSE        ( A -- A )
                                   3586 ;       Start the false clause in an IF-ELSE-THEN structure.
      0093B4 4B F8                 3587         .word      LINK
                           00150B  3588 LINK = . 
      0093B5 84                    3589 	.byte      IMEDD+4
      0093B5 CD 84 34 93           3590         .ascii     "ELSE"
      001510                       3591 ELSEE:
      0093B9 6D CD 86         [ 4] 3592         CALL     COMPI
      0093BC 77 CD                 3593         .word BRAN
      0093BE 84 B2 CD         [ 4] 3594         CALL     HERE
      0093C1 87 F5 CD         [ 4] 3595         CALL     ZERO
      0093C4 84 67 93         [ 4] 3596         CALL     COMMA
      0093C7 CF CD 8F         [ 4] 3597         CALL     SWAPP
      0093CA 5F 03 20         [ 4] 3598         CALL     HERE
      0093CD 6F 6B CC         [ 4] 3599         call ADRADJ 
      0093D0 8F 20 93         [ 4] 3600         CALL     SWAPP
      0093D3 B1 06 3F         [ 2] 3601         JP     STORE
                                   3602 
                                   3603 ;       AHEAD       ( -- A )
                                   3604 ;       Compile a forward branch instruction.
      0093D6 53 54                 3605         .word      LINK
                           00152F  3606 LINK = . 
      0093D8 41                    3607 	.byte      IMEDD+5
      0093D9 43 4B 45 41 44        3608         .ascii     "AHEAD"
      0093DB                       3609 AHEAD:
      0093DB CD 8A FC         [ 4] 3610         CALL     COMPI
      0093DE CD 85                 3611         .word BRAN
      0093E0 92 CD 93         [ 4] 3612         CALL     HERE
      0093E3 3B 0B 20         [ 4] 3613         CALL     ZERO
      0093E6 75 6E 64         [ 2] 3614         JP     COMMA
                                   3615 
                                   3616 ;       WHILE       ( a -- A a )
                                   3617 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      0093E9 65 72                 3618         .word      LINK
                           001545  3619 LINK = . 
      0093EB 66                    3620 	.byte      IMEDD+5
      0093EC 6C 6F 77 20 81        3621         .ascii     "WHILE"
      00154B                       3622 WHILE:
      0093F1 93 D4 04         [ 4] 3623         CALL     COMPI
      0093F4 45 56                 3624         .word QBRAN
      0093F6 41 4C 28         [ 4] 3625         CALL     HERE
      0093F8 CD 0A 3A         [ 4] 3626         CALL     ZERO
      0093F8 CD 91 32         [ 4] 3627         CALL     COMMA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0093FB CD 85 59         [ 2] 3628         JP     SWAPP
                                   3629 
                                   3630 ;       REPEAT      ( A a -- )
                                   3631 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      0093FE CD 84                 3632         .word      LINK
                           00155E  3633 LINK = . 
      009400 D0                    3634         .byte      IMEDD+6
      009401 CD 84 67 94 14 CD     3635         .ascii     "REPEAT"
      001565                       3636 REPEA:
      009407 86 77 CD         [ 4] 3637         CALL     COMPI
      00940A 8B DE                 3638         .word BRAN
      00940C CD 93 DB         [ 4] 3639         call ADRADJ 
      00940F CD 84 7E         [ 4] 3640         CALL     COMMA
      009412 93 F8 CD         [ 4] 3641         CALL     HERE
      009415 85 4F CC         [ 4] 3642         call ADRADJ 
      009418 93 B5 93         [ 4] 3643         CALL     SWAPP
      00941B F3 06 50         [ 2] 3644         JP     STORE
                                   3645 
                                   3646 ;       AFT         ( a -- a A )
                                   3647 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      00941E 52 45                 3648         .word      LINK
                           00157E  3649 LINK = . 
      009420 53                    3650 	.byte      IMEDD+3
      009421 45 54 54              3651         .ascii     "AFT"
      009423                       3652 AFT:
      009423 CD 84 34         [ 4] 3653         CALL     DROP
      009426 06 80 CD         [ 4] 3654         CALL     AHEAD
      009429 85 46 CD         [ 4] 3655         CALL     HERE
      00942C 84 34 07         [ 2] 3656         JP     SWAPP
                                   3657 
                                   3658 ;       ABORT"      ( -- ; <string> )
                                   3659 ;       Conditional abort with an error message.
      00942F 00 CD                 3660         .word      LINK
                           001590  3661 LINK = . 
      009431 86                    3662 	.byte      IMEDD+6
      009432 44 CD 8A 23 CC        3663         .ascii     "ABORT"
      009437 84                    3664         .byte      '"'
      001597                       3665 ABRTQ:
      009438 9B 94 1C         [ 4] 3666         CALL     COMPI
      00943B 04 51                 3667         .word ABORQ
      00943D 55 49 54         [ 2] 3668         JP     STRCQ
                                   3669 
                                   3670 ;       $"     ( -- ; <string> )
                                   3671 ;       Compile an inline string literal.
      009440 15 90                 3672         .word      LINK
                           0015A1  3673 LINK = . 
      009440 CD                    3674 	.byte      IMEDD+2
      009441 84 34                 3675         .byte     '$','"'
      0015A4                       3676 STRQ:
      009443 07 FF CD         [ 4] 3677         CALL     COMPI
      009446 84 ED                 3678         .word STRQP 
      009448 CD 93 A4         [ 2] 3679         JP     STRCQ
                                   3680 
                                   3681 ;       ."          ( -- ; <string> )
                                   3682 ;       Compile an inline string literal to be typed out at run time.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      00944B CD 93                 3683         .word      LINK
                           0015AE  3684 LINK = . 
      00944D 07                    3685 	.byte      IMEDD+2
      00944E CD 93                 3686         .byte     '.','"'
      0015B1                       3687 DOTQ:
      009450 F8 20 F8         [ 4] 3688         CALL     COMPI
      009453 94 3B                 3689         .word DOTQP 
      009455 01 27 6D         [ 2] 3690         JP     STRCQ
                                   3691 
                                   3692 ;; Name compiler
                                   3693 
                                   3694 ;       ?UNIQUE ( a -- a )
                                   3695 ;       Display a warning message
                                   3696 ;       if word already exists.
      009457 15 AE                 3697         .word      LINK
                           0015BB  3698 LINK = . 
      009457 CD                    3699         .byte      7
      009458 91 32 CD 92 2F CD 84  3700         .ascii     "?UNIQUE"
      0015C3                       3701 UNIQU:
      00945F 67 93 43         [ 4] 3702         CALL     DUPP
      009462 81 94 55         [ 4] 3703         CALL     NAMEQ   ;?name exists
      009465 05 41 4C         [ 4] 3704         CALL     QBRAN
      009468 4C 4F                 3705         .word      UNIQ1
      00946A 54 0E DF         [ 4] 3706         CALL     DOTQP   ;redef are OK
      00946B 07                    3707         .byte       7
      00946B CD 86 A7 CD 8B 2A CC  3708         .ascii     " reDef "       
      009472 9B FD 94         [ 4] 3709         CALL     OVER
      009475 65 01 2C         [ 4] 3710         CALL     COUNT
      009478 CD 0E 82         [ 4] 3711         CALL     TYPES   ;just in case
      009478 CD 8B A8         [ 2] 3712 UNIQ1:  JP     DROP
                                   3713 
                                   3714 ;       $,n     ( na -- )
                                   3715 ;       Build a new dictionary name
                                   3716 ;       using string at na.
                                   3717 ; compile dans l'espace des variables 
      00947B CD 85                 3718         .word      LINK
                           0015E7  3719 LINK = . 
      00947D 59                    3720         .byte      3
      00947E CD 8A 23              3721         .ascii     "$,n"
      0015EB                       3722 SNAME:
      009481 CD 86 A7         [ 4] 3723         CALL     DUPP
      009484 CD 84 9B         [ 4] 3724         CALL     CAT     ;?null input
      009487 CC 84 9B         [ 4] 3725         CALL     QBRAN
      00948A 94 76                 3726         .word      PNAM1
      00948C 02 43 2C         [ 4] 3727         CALL     UNIQU   ;?redefinition
      00948F CD 04 D9         [ 4] 3728         CALL     DUPP
      00948F CD 8B A8         [ 4] 3729         CALL     COUNT
      009492 CD 85 59         [ 4] 3730         CALL     PLUS
      009495 CD 8A 4E         [ 4] 3731         CALL     VPP
      009498 CD 86 A7         [ 4] 3732         CALL     STORE
      00949B CD 84 9B         [ 4] 3733         CALL     DUPP
      00949E CC 84 BF         [ 4] 3734         CALL     LAST
      0094A1 94 8C 89         [ 4] 3735         CALL     STORE   ;save na for vocabulary link
      0094A4 5B 43 4F         [ 4] 3736         CALL     CELLM   ;link address
      0094A7 4D 50 49         [ 4] 3737         CALL     CNTXT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0094AA 4C 45 5D         [ 4] 3738         CALL     AT
      0094AD CD 04 E9         [ 4] 3739         CALL     SWAPP
      0094AD CD 94 57         [ 4] 3740         CALL     STORE
      0094B0 CC               [ 4] 3741         RET     ;save code pointer
      0094B1 97 73 94         [ 4] 3742 PNAM1:  CALL     STRQP
      0094B4 A3                    3743         .byte      5
      0094B5 47 43 4F 4D 50        3744         .ascii     " name" ;null input
      0094BA 49 4C 45         [ 2] 3745         JP     ABOR1
                                   3746 
                                   3747 ;; FORTH compiler
                                   3748 
                                   3749 ;       $COMPILE        ( a -- )
                                   3750 ;       Compile next word to
                                   3751 ;       dictionary as a token or literal.
      0094BD 15 E7                 3752         .word      LINK
                           00162F  3753 LINK = . 
      0094BD CD                    3754         .byte      8
      0094BE 85 03 CD 85 59 CD 84  3755         .ascii     "$COMPILE"
             B2
      001638                       3756 SCOMP:
      0094C6 CD 97 73         [ 4] 3757         CALL     NAMEQ
      0094C9 CD 8A 23         [ 4] 3758         CALL     QDUP    ;?defined
      0094CC 90 93 90         [ 4] 3759         CALL     QBRAN
      0094CF FE 1C                 3760         .word      SCOM2
      0094D1 00 02 90         [ 4] 3761         CALL     AT
      0094D4 FC 94 B5         [ 4] 3762         CALL     DOLIT
      0094D7 87 4C                 3763         .word     0x8000	;  IMEDD*256
      0094D9 49 54 45         [ 4] 3764         CALL     ANDD    ;?immediate
      0094DC 52 41 4C         [ 4] 3765         CALL     QBRAN
      0094DF 16 56                 3766         .word      SCOM1
      0094DF CD 94 BD         [ 2] 3767         JP     EXECU
      0094E2 84 34 CC         [ 2] 3768 SCOM1:  JP     JSRC
      0094E5 94 78 94         [ 4] 3769 SCOM2:  CALL     NUMBQ   ;try to convert to number
      0094E8 D7 03 24         [ 4] 3770         CALL     QBRAN
      0094EB 2C 22                 3771         .word      ABOR1
      0094ED CC 14 5F         [ 2] 3772         JP     LITER
                                   3773 
                                   3774 ;       OVERT   ( -- )
                                   3775 ;       Link a new word into vocabulary.
      0094ED CD 84                 3776         .word      LINK
                           001666  3777 LINK = . 
      0094EF 34                    3778         .byte      5
      0094F0 00 22 CD 90 B5        3779         .ascii     "OVERT"
      00166C                       3780 OVERT:
      0094F5 CD 8B A8         [ 4] 3781         CALL     LAST
      0094F8 CD 8C 68         [ 4] 3782         CALL     AT
      0094FB CD 8B 91         [ 4] 3783         CALL     CNTXT
      0094FE CD 87 54         [ 2] 3784         JP     STORE
                                   3785 
                                   3786 ;       ;       ( -- )
                                   3787 ;       Terminate a colon definition.
      009501 CD 86                 3788         .word      LINK
                           00167A  3789 LINK = . 
      009503 A7                    3790 	.byte      IMEDD+COMPO+1
      009504 CC                    3791         .ascii     ";"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      00167C                       3792 SEMIS:
                           000001  3793 .if OPTIMIZE ; more compact and faster
      009505 84 9B 94         [ 4] 3794         call DOLIT 
      009508 E9 83                 3795         .word 0x81   ; opcode for RET 
      00950A 46 4F 52         [ 4] 3796         call CCOMMA 
                           000000  3797 .else
                                   3798         CALL     COMPI
                                   3799         .word EXIT 
                                   3800 .endif 
      00950D CD 13 24         [ 4] 3801         CALL     LBRAC
      00950D CD 94 BD         [ 4] 3802         call OVERT 
      009510 85 22 CC         [ 4] 3803         CALL FMOVE
      009513 8B A8 95         [ 4] 3804         call QDUP 
      009516 09 84 4E         [ 4] 3805         call QBRAN 
      009519 45 58                 3806         .word SET_RAMLAST 
      00951B 54 20 3D         [ 4] 3807         CALL UPDATPTR
      00951C 81               [ 4] 3808         RET 
                                   3809 
                                   3810 
                                   3811 ;       Terminate an ISR definition 
                                   3812 ;       retourn ca of ISR as double
                                   3813 ;       I; ( -- ud )
      00951C CD 94                 3814         .word LINK 
                           00169B  3815         LINK=.
      00951E BD                    3816         .byte 2+IMEDD+COMPO 
      00951F 84 48                 3817         .ascii "I;" 
      00169E                       3818 ISEMI:
      009521 CD 86 F3         [ 2] 3819         subw x,#CELLL  
      009524 CC 94 78 95      [ 2] 3820         ldw y,#IRET_CODE 
      009528 17               [ 2] 3821         ldw (x),y 
      009529 01 49 0F         [ 4] 3822         call CCOMMA
      00952B CD 13 24         [ 4] 3823         call LBRAC 
      00952B 1D 00 02         [ 4] 3824         call IFMOVE
      00952E 16 03 FF         [ 4] 3825         call QDUP 
      009531 81 95 29         [ 4] 3826         CALL QBRAN 
      009534 85 42                 3827         .word SET_RAMLAST
      009536 45 47 49         [ 4] 3828         CALL CPP
      009539 4E 04 32         [ 4] 3829         call AT 
      00953A CD 04 E9         [ 4] 3830         call SWAPP 
      00953A CC 8B A8         [ 4] 3831         CALL CPP 
      00953D 95 34 85         [ 4] 3832         call STORE 
      009540 55 4E 54         [ 4] 3833         call UPDATCP 
      009543 49 4C 27         [ 4] 3834         call EEPVP 
      009545 CD 04 CF         [ 4] 3835         call DROP 
      009545 CD 94 BD         [ 4] 3836         call AT 
      009548 84 67 CD         [ 4] 3837         call VPP 
      00954B 86 F3 CC         [ 4] 3838         call STORE 
      00954E 94 78 95         [ 2] 3839         jp ZERO
      009551 3F               [ 4] 3840         ret           
                                   3841         
                                   3842 
                                   3843 ;       ]       ( -- )
                                   3844 ;       Start compiling words in
                                   3845 ;       input stream.
      009552 85 41                 3846         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                           0016DE  3847 LINK = . 
      009554 47                    3848         .byte      1
      009555 41                    3849         .ascii     "]"
      0016E0                       3850 RBRAC:
      009556 49 4E B4         [ 4] 3851         CALL   DOLIT
      009558 16 38                 3852         .word  SCOMP
      009558 CD 94 BD         [ 4] 3853         CALL   TEVAL
      00955B 84 7E CD         [ 2] 3854         JP     STORE
                                   3855 
                                   3856 ;       CALL,    ( ca -- )
                                   3857 ;       Compile a subroutine call.
      00955E 86 F3                 3858         .word      LINK
                           0016ED  3859 LINK = . 
      009560 CC                    3860         .byte      5
      009561 94 78 95 52 82        3861         .ascii     "CALL,"
      0016F3                       3862 JSRC:
      009566 49 46 B4         [ 4] 3863         CALL     DOLIT
      009568 00 CD                 3864         .word     CALLL     ;CALL
      009568 CD 94 BD         [ 4] 3865         CALL     CCOMMA
      00956B 84 67 CD         [ 2] 3866         JP     COMMA
                                   3867 
                                   3868 ;       INIT-OFS ( -- )
                                   3869 ;       compute offset to adjust jump address 
                                   3870 ;       set variable OFFSET 
      00956E 8B A8                 3871         .word LINK 
                           001700  3872         LINK=.
      009570 CD                    3873         .byte 8 
      009571 8A BA CC 94 78 95 65  3874         .ascii "INIT-OFS" 
             84
      001709                       3875 INITOFS:
      009579 54 48 45         [ 4] 3876         call TFLASH 
      00957C 4E 04 32         [ 4] 3877         CALL AT 
      00957D CD 04 D9         [ 4] 3878         CALL DUPP 
      00957D CD 8B A8         [ 4] 3879         call QBRAN
      009580 CD 86                 3880         .word 1$
      009582 F3 CD 85         [ 4] 3881         call DROP  
      009585 69 CC 84         [ 4] 3882         call CPP 
      009588 9B 95 78         [ 4] 3883         call AT 
      00958B 84 45 4C         [ 4] 3884         call HERE
      00958E 53 45 4D         [ 4] 3885         call SUBB 
      009590 CD 06 6A         [ 4] 3886 1$:     call OFFSET 
      009590 CD 94 BD         [ 2] 3887         jp STORE  
                                   3888 
                                   3889 ;       :       ( -- ; <string> )
                                   3890 ;       Start a new colon definition
                                   3891 ;       using next word as its name.
      009593 84 7E                 3892         .word      LINK
                           00172E  3893 LINK = . 
      009595 CD                    3894         .byte      1
      009596 8B                    3895         .ascii     ":"
      001730                       3896 COLON:
      009597 A8 CD 8A         [ 4] 3897         call INITOFS       
      00959A BA CD 94         [ 4] 3898         CALL   TOKEN
      00959D 78 CD 85         [ 4] 3899         CALL   SNAME
      0095A0 69 CD 8B         [ 2] 3900         JP     RBRAC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3901 
                                   3902 ;       I:  ( -- )
                                   3903 ;       Start interrupt service routine definition
                                   3904 ;       those definition have no name.
      0095A3 A8 CD                 3905         .word LINK
                           00173E  3906         LINK=.
      0095A5 86                    3907         .byte 2 
      0095A6 F3 CD                 3908         .ascii "I:" 
      001741                       3909 ICOLON:
      0095A8 85 69 CC         [ 4] 3910         call INITOFS 
      0095AB 84 9B 95         [ 2] 3911         jp RBRAC  
                                   3912 
                                   3913 ;       IMMEDIATE       ( -- )
                                   3914 ;       Make last compiled word
                                   3915 ;       an immediate word.
      0095AE 8B 85                 3916         .word      LINK
                           001749  3917 LINK = . 
      0095B0 41                    3918         .byte      9
      0095B1 48 45 41 44 44 49 41  3919         .ascii     "IMMEDIATE"
             54 45
      0095B5                       3920 IMMED:
      0095B5 CD 94 BD         [ 4] 3921         CALL     DOLIT
      0095B8 84 7E                 3922         .word     0x8000	;  IMEDD*256
      0095BA CD 8B A8         [ 4] 3923         CALL     LAST
      0095BD CD 8A BA         [ 4] 3924         CALL     AT
      0095C0 CC 94 78         [ 4] 3925         CALL     AT
      0095C3 95 AF 85         [ 4] 3926         CALL     ORR
      0095C6 57 48 49         [ 4] 3927         CALL     LAST
      0095C9 4C 45 32         [ 4] 3928         CALL     AT
      0095CB CC 04 1B         [ 2] 3929         JP     STORE
                                   3930 
                                   3931 ;; Defining words
                                   3932 
                                   3933 ;       CREATE  ( -- ; <string> )
                                   3934 ;       Compile a new array
                                   3935 ;       without allocating space.
      0095CB CD 94                 3936         .word      LINK
                           00176F  3937 LINK = . 
      0095CD BD                    3938         .byte      6
      0095CE 84 67 CD 8B A8 CD     3939         .ascii     "CREATE"
      001776                       3940 CREAT:
      0095D4 8A BA CD         [ 4] 3941         CALL     TOKEN
      0095D7 94 78 CC         [ 4] 3942         CALL     SNAME
      0095DA 85 69 95         [ 4] 3943         CALL     OVERT        
      0095DD C5 86 52         [ 4] 3944         CALL     COMPI 
      0095E0 45 50                 3945         .word DOVAR 
      0095E2 45               [ 4] 3946         RET
                                   3947 
                                   3948 ;       VARIABLE        ( -- ; <string> )
                                   3949 ;       Compile a new variable
                                   3950 ;       initialized to 0.
      0095E3 41 54                 3951         .word      LINK
                           001787  3952 LINK = . 
      0095E5 08                    3953         .byte      8
      0095E5 CD 94 BD 84 7E CD 86  3954         .ascii     "VARIABLE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal  F3-Bits]



             45
      001790                       3955 VARIA:
                                   3956 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      0095ED CD 94 78         [ 4] 3957         CALL HERE
      0095F0 CD 8B A8         [ 4] 3958         CALL DUPP 
      0095F3 CD 86 F3         [ 4] 3959         CALL CELLP
      0095F6 CD 85 69         [ 4] 3960         CALL VPP 
      0095F9 CC 84 9B         [ 4] 3961         CALL STORE
      0095FC 95 DE 83         [ 4] 3962         CALL CREAT
      0095FF 41 46 54         [ 4] 3963         CALL DUPP
      009602 CD 13 F8         [ 4] 3964         CALL COMMA
      009602 CD 85 4F         [ 4] 3965         CALL ZERO
      009605 CD 95 B5         [ 4] 3966         call SWAPP 
      009608 CD 8B A8         [ 4] 3967         CALL STORE
      00960B CC 85 69         [ 4] 3968         CALL FMOVE ; move definition to FLASH
      00960E 95 FE 86         [ 4] 3969         CALL QDUP 
      009611 41 42 4F         [ 4] 3970         CALL QBRAN 
      009614 52 54                 3971         .word SET_RAMLAST   
      009616 22 1B 7D         [ 4] 3972         call UPDATVP  ; don't update if variable kept in RAM.
      009617 CD 20 3D         [ 4] 3973         CALL UPDATPTR
      009617 CD               [ 4] 3974         RET         
      0017C3                       3975 SET_RAMLAST: 
      009618 94 BD 93         [ 4] 3976         CALL LAST 
      00961B 3B CC 94         [ 4] 3977         CALL AT 
      00961E ED 96 10         [ 4] 3978         CALL RAMLAST 
      009621 82 24 22         [ 2] 3979         jp STORE  
                                   3980 
                                   3981 
                                   3982 ;       CONSTANT  ( n -- ; <string> )
                                   3983 ;       Compile a new constant 
                                   3984 ;       n CONSTANT name 
      009624 17 87                 3985         .word LINK 
                           0017D1  3986         LINK=. 
      009624 CD                    3987         .byte 8 
      009625 94 BD 8F 55 CC 94 ED  3988         .ascii "CONSTANT" 
             96
      0017DA                       3989 CONSTANT:          
      00962D 21 82 2E         [ 4] 3990         CALL TOKEN
      009630 22 15 EB         [ 4] 3991         CALL SNAME 
      009631 CD 16 6C         [ 4] 3992         CALL OVERT 
      009631 CD 94 BD         [ 4] 3993         CALL COMPI 
      009634 8F 5F                 3994         .word DOCONST
      009636 CC 94 ED         [ 4] 3995         CALL COMMA 
      009639 96 2E 07         [ 4] 3996         CALL FMOVE
      00963C 3F 55 4E         [ 4] 3997         CALL QDUP 
      00963F 49 51 55         [ 4] 3998         CALL QBRAN 
      009642 45 C3                 3999         .word SET_RAMLAST  
      009643 CD 20 3D         [ 4] 4000         CALL UPDATPTR  
      009643 CD               [ 4] 4001 1$:     RET          
                                   4002 
                                   4003 ; CONSTANT runtime semantic 
                                   4004 ; doCONST  ( -- n )
      009644 85 59                 4005         .word LINK 
                           0017FC  4006         LINK=.
      009646 CD                    4007         .byte 7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009647 92 2F CD 84 67 96 62  4008         .ascii "DOCONST"
      001804                       4009 DOCONST:
      00964E CD 8F 5F         [ 2] 4010         subw x,#CELLL
      009651 07 20            [ 2] 4011         popw y 
      009653 72 65            [ 2] 4012         ldw y,(y) 
      009655 44               [ 2] 4013         ldw (x),y 
      009656 65               [ 4] 4014         ret 
                                   4015 
                                   4016 
                                   4017 ;; Tools
                                   4018 
                                   4019 ;       _TYPE   ( b u -- )
                                   4020 ;       Display a string. Filter
                                   4021 ;       non-printing characters.
      009657 66 20                 4022         .word      LINK
                           00180F  4023 LINK = . 
      009659 CD                    4024         .byte      5
      00965A 85 83 CD 8B 91        4025         .ascii     "_TYPE"
      001815                       4026 UTYPE:
      00965F CD 8F 02         [ 4] 4027         CALL     TOR     ;start count down loop
      009662 CC 85            [ 2] 4028         JRA     UTYP2   ;skip first pass
      009664 4F 96 3B         [ 4] 4029 UTYP1:  CALL     DUPP
      009667 03 24 2C         [ 4] 4030         CALL     CAT
      00966A 6E 0A 64         [ 4] 4031         CALL     TCHAR
      00966B CD 03 9E         [ 4] 4032         CALL     EMIT    ;display only printable
      00966B CD 85 59         [ 4] 4033         CALL     ONEP    ;increment address
      00966E CD 84 D0         [ 4] 4034 UTYP2:  CALL     DONXT
      009671 CD 84                 4035         .word      UTYP1   ;loop till done
      009673 67 96 A1         [ 2] 4036         JP     DROP
                                   4037 
                                   4038 ;       dm+     ( a u -- a )
                                   4039 ;       Dump u bytes from ,
                                   4040 ;       leaving a+u on  stack.
      009676 CD 96                 4041         .word      LINK
                           001833  4042 LINK = . 
      009678 43                    4043         .byte      3
      009679 CD 85 59              4044         .ascii     "dm+"
      001837                       4045 DUMPP:
      00967C CD 8B 91         [ 4] 4046         CALL     OVER
      00967F CD 87 54         [ 4] 4047         CALL     DOLIT
      009682 CD 86                 4048         .word      4
      009684 A7 CD 84         [ 4] 4049         CALL     UDOTR   ;display address
      009687 9B CD 85         [ 4] 4050         CALL     SPACE
      00968A 59 CD 86         [ 4] 4051         CALL     TOR     ;start count down loop
      00968D C5 CD            [ 2] 4052         JRA     PDUM2   ;skip first pass
      00968F 84 9B CD         [ 4] 4053 PDUM1:  CALL     DUPP
      009692 8A 32 CD         [ 4] 4054         CALL     CAT
      009695 86 99 CD         [ 4] 4055         CALL     DOLIT
      009698 84 B2                 4056         .word      3
      00969A CD 85 69         [ 4] 4057         CALL     UDOTR   ;display numeric data
      00969D CD 84 9B         [ 4] 4058         CALL     ONEP    ;increment address
      0096A0 81 CD 8F         [ 4] 4059 PDUM2:  CALL     DONXT
      0096A3 55 05                 4060         .word      PDUM1   ;loop till done
      0096A5 20               [ 4] 4061         RET
                                   4062 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   4063 ;       DUMP    ( a u -- )
                                   4064 ;       Dump u bytes from a,
                                   4065 ;       in a formatted manner.
      0096A6 6E 61                 4066         .word      LINK
                           001863  4067 LINK = . 
      0096A8 6D                    4068         .byte      4
      0096A9 65 CC 93 43           4069         .ascii     "DUMP"
      001868                       4070 DUMP:
      0096AD 96 67 08         [ 4] 4071         CALL     BASE
      0096B0 24 43 4F         [ 4] 4072         CALL     AT
      0096B3 4D 50 49         [ 4] 4073         CALL     TOR
      0096B6 4C 45 E0         [ 4] 4074         CALL     HEX     ;save radix, set hex
      0096B8 CD 03 B4         [ 4] 4075         CALL     DOLIT
      0096B8 CD 92                 4076         .word      16
      0096BA 2F CD 87         [ 4] 4077         CALL     SLASH   ;change count to lines
      0096BD 03 CD 84         [ 4] 4078         CALL     TOR     ;start count down loop
      0096C0 67 96 D9         [ 4] 4079 DUMP1:  CALL     CR
      0096C3 CD 84 B2         [ 4] 4080         CALL     DOLIT
      0096C6 CD 84                 4081         .word      16
      0096C8 34 80 00         [ 4] 4082         CALL     DDUP
      0096CB CD 85 A5         [ 4] 4083         CALL     DUMPP   ;display numeric
      0096CE CD 84 67         [ 4] 4084         CALL     ROT
      0096D1 96 D6 CC         [ 4] 4085         CALL     ROT
      0096D4 84 8E CC         [ 4] 4086         CALL     SPACE
      0096D7 97 73 CD         [ 4] 4087         CALL     SPACE
      0096DA 8D CD CD         [ 4] 4088         CALL     UTYPE   ;display printable characters
      0096DD 84 67 93         [ 4] 4089         CALL     DONXT
      0096E0 43 CC                 4090         .word      DUMP1   ;loop till done
      0096E2 94 DF 96         [ 4] 4091 DUMP3:  CALL     DROP
      0096E5 AF 05 4F         [ 4] 4092         CALL     RFROM
      0096E8 56 45 52         [ 4] 4093         CALL     BASE
      0096EB 54 04 1B         [ 2] 4094         JP     STORE   ;restore radix
                                   4095 
                                   4096 ;       .S      ( ... -- ... )
                                   4097 ;        Display  contents of stack.
      0096EC 18 63                 4098         .word      LINK
                           0018AF  4099 LINK = . 
      0096EC CD                    4100         .byte      2
      0096ED 86 C5                 4101         .ascii     ".S"
      0018B2                       4102 DOTS:
      0096EF CD 84 B2         [ 4] 4103         CALL     CR
      0096F2 CD 86 99         [ 4] 4104         CALL     DEPTH   ;stack depth
      0096F5 CC 84 9B         [ 4] 4105         CALL     TOR     ;start count down loop
      0096F8 96 E6            [ 2] 4106         JRA     DOTS2   ;skip first pass
      0096FA C1 3B 96         [ 4] 4107 DOTS1:  CALL     RAT
      0096FC CD 0A 93         [ 4] 4108 	CALL     PICK
      0096FC CD 84 34         [ 4] 4109         CALL     DOT     ;index stack, display contents
      0096FF 00 81 CD         [ 4] 4110 DOTS2:  CALL     DONXT
      009702 94 8F                 4111         .word      DOTS1   ;loop till done
      009704 CD 93 A4         [ 4] 4112         CALL     DOTQP
      009707 CD                    4113         .byte      5
      009708 96 EC CD A0 35        4114         .ascii     " <sp "
      00970D CD               [ 4] 4115         RET
                                   4116 
                                   4117 ;       >NAME   ( ca -- na | F )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                   4118 ;       Convert code address
                                   4119 ;       to a name address.
      00970E 87 03                 4120         .word      LINK
                           0018D7  4121 LINK = . 
      009710 CD                    4122         .byte      5
      009711 84 67 98 43 CD        4123         .ascii     ">NAME"
      0018DD                       4124 TNAME:
      009716 A0 BD 81         [ 4] 4125         CALL     CNTXT   ;vocabulary link
      009719 96 FA C2         [ 4] 4126 TNAM2:  CALL     AT
      00971C 49 3B D9         [ 4] 4127         CALL     DUPP    ;?last word in a vocabulary
      00971E CD 03 E7         [ 4] 4128         CALL     QBRAN
      00971E 1D 00                 4129         .word      TNAM4
      009720 02 90 AE         [ 4] 4130         CALL     DDUP
      009723 00 80 FF         [ 4] 4131         CALL     NAMET
      009726 CD 94 8F         [ 4] 4132         CALL     XORR    ;compare
      009729 CD 93 A4         [ 4] 4133         CALL     QBRAN
      00972C CD A0                 4134         .word      TNAM3
      00972E FC CD 87         [ 4] 4135         CALL     CELLM   ;continue with next word
      009731 03 CD            [ 2] 4136         JRA     TNAM2
      009733 84 67 98         [ 4] 4137 TNAM3:  CALL     SWAPP
      009736 43 CD 86         [ 2] 4138         JP     DROP
      009739 B5 CD 84         [ 4] 4139 TNAM4:  CALL     DDROP
      00973C B2 CD 85         [ 2] 4140         JP     ZERO
                                   4141 
                                   4142 ;       .ID     ( na -- )
                                   4143 ;        Display  name at address.
      00973F 69 CD                 4144         .word      LINK
                           00190C  4145 LINK = . 
      009741 86                    4146         .byte      3
      009742 B5 CD 84              4147         .ascii     ".ID"
      001910                       4148 DOTID:
      009745 9B CD 9B         [ 4] 4149         CALL     QDUP    ;if zero no name
      009748 E6 CD 9B         [ 4] 4150         CALL     QBRAN
      00974B A7 CD                 4151         .word      DOTI1
      00974D 85 4F CD         [ 4] 4152         CALL     COUNT
      009750 84 B2 CD         [ 4] 4153         CALL     DOLIT
      009753 86 A7                 4154         .word      0x1F
      009755 CD 84 9B         [ 4] 4155         CALL     ANDD    ;mask lexicon bits
      009758 CC 8A BA         [ 2] 4156         JP     UTYPE
      00975B 81 97 1B         [ 4] 4157 DOTI1:  CALL     DOTQP
      00975E 01                    4158         .byte      9
      00975F 5D 6E 6F 4E 61 6D 65  4159         .ascii     " noName"
      009760 81               [ 4] 4160         RET
                                   4161 
                           000000  4162 WANT_SEE=0
                           000000  4163 .if WANT_SEE 
                                   4164 ;       SEE     ( -- ; <string> )
                                   4165 ;       A simple decompiler.
                                   4166 ;       Updated for byte machines.
                                   4167         .word      LINK
                                   4168 LINK = . 
                                   4169         .byte      3
                                   4170         .ascii     "SEE"
                                   4171 SEE:
                                   4172         CALL     TICK    ;starting address
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4173         CALL     CR
                                   4174         CALL     ONEM
                                   4175 SEE1:   CALL     ONEP
                                   4176         CALL     DUPP
                                   4177         CALL     AT
                                   4178         CALL     DUPP
                                   4179         CALL     QBRAN
                                   4180         .word    SEE2
                                   4181         CALL     TNAME   ;?is it a name
                                   4182 SEE2:   CALL     QDUP    ;name address or zero
                                   4183         CALL     QBRAN
                                   4184         .word    SEE3
                                   4185         CALL     SPACE
                                   4186         CALL     DOTID   ;display name
                                   4187         CALL     ONEP
                                   4188         JRA      SEE4
                                   4189 SEE3:   CALL     DUPP
                                   4190         CALL     CAT
                                   4191         CALL     UDOT    ;display number
                                   4192 SEE4:   CALL     NUFQ    ;user control
                                   4193         CALL     QBRAN
                                   4194         .word    SEE1
                                   4195         JP     DROP
                                   4196 .endif ; WANT_SEE 
                                   4197 
                                   4198 ;       WORDS   ( -- )
                                   4199 ;       Display names in vocabulary.
      009760 CD 84                 4200         .word      LINK
                           001934  4201 LINK = . 
      009762 34                    4202         .byte      5
      009763 96 B8 CD 86 77        4203         .ascii     "WORDS"
      00193A                       4204 WORDS:
      009768 CC 84 9B         [ 4] 4205         CALL     CR
      00976B 97 5E 05         [ 4] 4206         CALL     CNTXT   ;only in context
      00976E 43 41 4C         [ 4] 4207 WORS1:  CALL     AT
      009771 4C 2C 83         [ 4] 4208         CALL     QDUP    ;?at end of list
      009773 CD 03 E7         [ 4] 4209         CALL     QBRAN
      009773 CD 84                 4210         .word      WORS2
      009775 34 00 CD         [ 4] 4211         CALL     DUPP
      009778 CD 94 8F         [ 4] 4212         CALL     SPACE
      00977B CC 94 78         [ 4] 4213         CALL     DOTID   ;display a name
      00977E 97 6D 08         [ 4] 4214         CALL     CELLM
      009781 49 4E 49         [ 4] 4215         CALL     BRAN
      009784 54 2D                 4216         .word      WORS1
      009786 4F               [ 4] 4217 WORS2:  RET
                                   4218 
                                   4219         
                                   4220 ;; Hardware reset
                                   4221 
                                   4222 ;       hi      ( -- )
                                   4223 ;       Display sign-on message.
      009787 46 53                 4224         .word      LINK
                           00195F  4225 LINK = . 
      009789 02                    4226         .byte      2
      009789 CD 86                 4227         .ascii     "hi"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      001962                       4228 HI:
      00978B 66 CD 84         [ 4] 4229         CALL     CR
      00978E B2 CD 85         [ 4] 4230         CALL     DOTQP   ;initialize I/O
      009791 59                    4231         .byte      15
      009792 CD 84 67 97 A6 CD 85  4232         .ascii     "stm8eForth v"
             4F CD 86 B5 CD
      00979E 84                    4233 	.byte      VER+'0'
      00979F B2                    4234         .byte      '.' 
      0097A0 CD                    4235 	.byte      EXT+'0' ;version
      0097A1 8B A8 CD         [ 4] 4236         CALL    DOTQP 
      0097A4 87                    4237         .byte 20
      0097A5 CD CD 86 EA CC 84 9B  4238         .ascii  " for STM8S-DISCOVERY"
             97 80 01 3A 44 49 53
             43 4F 56 45 52 59
      0097B0 CC 0E A0         [ 2] 4239         JP     CR
                                   4240 
                           000000  4241 WANT_DEBUG=0
                           000000  4242 .if WANT_DEBUG 
                                   4243 ;       DEBUG      ( -- )
                                   4244 ;       Display sign-on message.
                                   4245 ;        .word      LINK
                                   4246 LINK = . 
                                   4247         .byte      5
                                   4248         .ascii     "DEBUG"
                                   4249 DEBUG:
                                   4250 	CALL DOLIT
                                   4251 	.word 0x65
                                   4252 	CALL EMIT
                                   4253 	CALL DOLIT
                                   4254 	.word 0
                                   4255  	CALL ZLESS 
                                   4256 	CALL DOLIT
                                   4257 	.word 0xFFFE
                                   4258 	CALL ZLESS 
                                   4259 	CALL UPLUS 
                                   4260  	CALL DROP 
                                   4261 	CALL DOLIT
                                   4262 	.word 3
                                   4263 	CALL UPLUS 
                                   4264 	CALL UPLUS 
                                   4265  	CALL DROP
                                   4266 	CALL DOLIT
                                   4267 	.word 0x43
                                   4268 	CALL UPLUS 
                                   4269  	CALL DROP
                                   4270 	CALL EMIT
                                   4271 	CALL DOLIT
                                   4272 	.word 0x4F
                                   4273 	CALL DOLIT
                                   4274 	.word 0x6F
                                   4275  	CALL XORR
                                   4276 	CALL DOLIT
                                   4277 	.word 0xF0
                                   4278  	CALL ANDD
                                   4279 	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4280 	.word 0x4F
                                   4281  	CALL ORR
                                   4282 	CALL EMIT
                                   4283 	CALL DOLIT
                                   4284 	.word 8
                                   4285 	CALL DOLIT
                                   4286 	.word 6
                                   4287  	CALL SWAPP
                                   4288 	CALL OVER
                                   4289 	CALL XORR
                                   4290 	CALL DOLIT
                                   4291 	.word 3
                                   4292 	CALL ANDD 
                                   4293 	CALL ANDD
                                   4294 	CALL DOLIT
                                   4295 	.word 0x70
                                   4296 	CALL UPLUS 
                                   4297 	CALL DROP
                                   4298 	CALL EMIT
                                   4299 	CALL DOLIT
                                   4300 	.word 0
                                   4301 	CALL QBRAN
                                   4302 	.word DEBUG1
                                   4303 	CALL DOLIT
                                   4304 	.word 0x3F
                                   4305 DEBUG1:
                                   4306 	CALL DOLIT
                                   4307 	.word 0xFFFF
                                   4308 	CALL QBRAN
                                   4309 	.word DEBUG2
                                   4310 	CALL DOLIT
                                   4311 	.word 0x74
                                   4312 	CALL BRAN
                                   4313 	.word DEBUG3
                                   4314 DEBUG2:
                                   4315 	CALL DOLIT
                                   4316 	.word 0x21
                                   4317 DEBUG3:
                                   4318 	CALL EMIT
                                   4319 	CALL DOLIT
                                   4320 	.word 0x68
                                   4321 	CALL DOLIT
                                   4322 	.word 0x80
                                   4323 	CALL STORE
                                   4324 	CALL DOLIT
                                   4325 	.word 0x80
                                   4326 	CALL AT
                                   4327 	CALL EMIT
                                   4328 	CALL DOLIT
                                   4329 	.word 0x4D
                                   4330 	CALL TOR
                                   4331 	CALL RAT
                                   4332 	CALL RFROM
                                   4333 	CALL ANDD
                                   4334 	CALL EMIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4335 	CALL DOLIT
                                   4336 	.word 0x61
                                   4337 	CALL DOLIT
                                   4338 	.word 0xA
                                   4339 	CALL TOR
                                   4340 DEBUG4:
                                   4341 	CALL DOLIT
                                   4342 	.word 1
                                   4343 	CALL UPLUS 
                                   4344 	CALL DROP
                                   4345 	CALL DONXT
                                   4346 	.word DEBUG4
                                   4347 	CALL EMIT
                                   4348 	CALL DOLIT
                                   4349 	.word 0x656D
                                   4350 	CALL DOLIT
                                   4351 	.word 0x100
                                   4352 	CALL UMSTA
                                   4353 	CALL SWAPP
                                   4354 	CALL DOLIT
                                   4355 	.word 0x100
                                   4356 	CALL UMSTA
                                   4357 	CALL SWAPP 
                                   4358 	CALL DROP
                                   4359 	CALL EMIT
                                   4360 	CALL EMIT
                                   4361 	CALL DOLIT
                                   4362 	.word 0x2043
                                   4363 	CALL DOLIT
                                   4364 	.word 0
                                   4365 	CALL DOLIT
                                   4366 	.word 0x100
                                   4367 	CALL UMMOD
                                   4368 	CALL EMIT
                                   4369 	CALL EMIT
                                   4370 	;JP ORIG
                                   4371 	RET
                                   4372 .endif ; WANT_DEBUG 
                                   4373 
                                   4374 
                                   4375 ;       'BOOT   ( -- a )
                                   4376 ;       The application startup vector.
      0097B0 CD 97                 4377         .word      LINK
                           001995  4378 LINK = . 
      0097B2 89                    4379         .byte      5
      0097B3 CD 91 32 CD 96        4380         .ascii     "'BOOT"
      00199B                       4381 TBOOT:
      0097B8 6B CC 97         [ 4] 4382         CALL     DOVAR
      0097BB 60 97                 4383         .word    APP_RUN      ;application to boot
                                   4384 
                                   4385 ;       COLD    ( -- )
                                   4386 ;       The hilevel cold start s=ence.
      0097BD AE 02                 4387         .word      LINK
                           0019A2  4388         LINK = . 
      0097BF 49                    4389         .byte      4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0097C0 3A 4F 4C 44           4390         .ascii     "COLD"
      0097C1                       4391 COLD:
                           000000  4392 .if WANT_DEBUG
                                   4393         CALL DEBUG
                                   4394 .endif ; WANT_DEBUG
      0097C1 CD 97 89         [ 4] 4395 COLD1:  CALL     DOLIT
      0097C4 CC 97                 4396         .word      UZERO
      0097C6 60 97 BE         [ 4] 4397 	CALL     DOLIT
      0097C9 09 49                 4398         .word      UPP
      0097CB 4D 4D 45         [ 4] 4399         CALL     DOLIT
      0097CE 44 49                 4400 	.word      UEND-UZERO
      0097D0 41 54 45         [ 4] 4401         CALL     CMOVE   ;initialize user area
                                   4402 
                                   4403 ; if APP_RUN==0 initialize with ca de 'hi'  
      0097D3 90 CE 40 02      [ 2] 4404         ldw y,APP_RUN 
      0097D3 CD 84            [ 1] 4405         jrne 0$
      0097D5 34 80 00         [ 2] 4406         subw x,#CELLL 
      0097D8 CD 86 C5 CD      [ 2] 4407         ldw y,#HI  
      0097DC 84               [ 2] 4408         ldw (x),y
      0097DD B2 CD 84         [ 4] 4409         call UPDATRUN 
      0019CA                       4410 0$:        
                                   4411 ; update LAST with APP_LAST 
                                   4412 ; if APP_LAST > LAST else do the opposite
      0097E0 B2 CD 85 B9      [ 2] 4413         ldw y,APP_LAST 
      0097E4 CD 86 C5         [ 2] 4414         cpw y,ULAST 
      0097E7 CD 84            [ 1] 4415         jrugt 1$ 
                                   4416 ; save LAST at APP_LAST  
      0097E9 B2 CC 84         [ 4] 4417         call UPDATLAST 
      0097EC 9B 97            [ 2] 4418         jra 2$
      0019D8                       4419 1$: ; update LAST with APP_LAST 
      0097EE C9 06 43         [ 2] 4420         ldw ULAST,y
      0097F1 52 45 41         [ 2] 4421         ldw UCNTXT,y
      0019DE                       4422 2$:  
                                   4423 ; update APP_CP if < app_space 
      0097F4 54 45 40 04      [ 2] 4424         ldw y,APP_CP  
      0097F6 90 B3 18         [ 2] 4425         cpw y,UCP   
      0097F6 CD 91            [ 1] 4426         jruge 3$ 
      0097F8 32 CD 96         [ 4] 4427         call UPDATCP
      0097FB 6B CD 96         [ 2] 4428         ldw y,UCP   
      0019ED                       4429 3$:
      0097FE EC CD 94         [ 2] 4430         ldw UCP,y                 
                                   4431 ; update UVP with APP_VP  
                                   4432 ; if APP_VP>UVP else do the opposite 
      009801 BD 86 06 81      [ 2] 4433         ldw y,APP_VP 
      009805 97 EF 08         [ 2] 4434         cpw y,UVP 
      009808 56 41            [ 1] 4435         jrugt 4$
      00980A 52 49 41         [ 4] 4436         call UPDATVP 
      00980D 42 4C            [ 2] 4437         jra 6$
      0019FE                       4438 4$: ; update UVP with APP_VP 
      00980F 45 BF 16         [ 2] 4439         ldw UVP,y 
      009810                       4440 6$:      
      009810 CD 8B A8         [ 4] 4441         CALL     PRESE   ;initialize data stack and TIB
      009813 CD 85 59         [ 4] 4442         CALL     TBOOT
      009816 CD 8A 23         [ 4] 4443         CALL     ATEXE   ;application boot
      009819 CD 86 A7         [ 4] 4444         CALL     OVERT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      00981C CD 84 9B         [ 2] 4445         JP     QUIT    ;start interpretation
                                   4446 
                           000001  4447 WANT_MATH_CONST = 1 
                           000001  4448 .if WANT_MATH_CONST 
                                   4449         ; irrational constants 
                                   4450         ; approximation by integers ratio.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4451         .include "../const_ratio.asm"
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
      00981F CD 97                   31         .word LINK 
                           001A12    32         LINK=.
      009821 F6                      33         .byte 2
      009822 CD 85                   34         .ascii "PI" 
      001A15                         35 PII:
      009824 59 CD 94         [ 2]   36         subw x,#2*CELLL 
      009827 78 CD 8A BA      [ 2]   37         ldw y,#355 
      00982B CD 85            [ 2]   38         ldw (2,x),y 
      00982D 69 CD 84 9B      [ 2]   39         ldw y,#113 
      009831 CD               [ 2]   40         ldw (x),y 
      009832 A0               [ 4]   41         ret 
                                     42 
                                     43 ;      SQRT2 ( -- 19601  13860 )
                                     44 ; precision: 1.5e-9 
                                     45 ; usage example to compute Voltage peek to peek from Vrms 
                                     46 ; : VPP SQRT2 */ 2 * ;
                                     47 ;
      009833 35 CD                   48         .word LINK 
                           001A26    49         LINK=.
      009835 87                      50         .byte 5 
      009836 03 CD 84 67 98          51         .ascii "SQRT2" 
      001A2C                         52 SQRT2:
      00983B 43 CD 9B         [ 2]   53         subw x,#2*CELLL 
      00983E FD CD A0 BD      [ 2]   54         ldw y,#19601 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      009842 81 02            [ 2]   55         ldw (2,x),y 
      009843 90 AE 36 24      [ 2]   56         ldw y,#13860 
      009843 CD               [ 2]   57         ldw (x),y 
      009844 86               [ 4]   58         ret 
                                     59 
                                     60 ;   SQRT3 ( -- 18817 10864 )
                                     61 ; precision: 1.1e-9
                                     62 ;
      009845 C5 CD                   63         .word LINK 
                           001A3D    64         LINK=.
      009847 84                      65         .byte 5
      009848 B2 CD 86 D8 CC          66         .ascii "SQRT3" 
      001A43                         67 SQRT3: 
      00984D 84 9B 98         [ 2]   68     subw x,#2*CELLL 
      009850 07 08 43 4F      [ 2]   69     ldw y,#18817 
      009854 4E 53            [ 2]   70     ldw (2,x),y 
      009856 54 41 4E 54      [ 2]   71     ldw y,#10864 
      00985A FF               [ 2]   72     ldw (x),y 
      00985A CD               [ 4]   73     ret 
                                     74 
                                     75 ;   E ( -- 28667 10546 )
                                     76 ; precision: 5.5e-9 
                                     77 ; natural log base 
      00985B 91 32                   78         .word LINK 
                           001A54    79         LINK=.
      00985D CD                      80         .byte 1
      00985E 96                      81         .ascii "E" 
      001A56                         82 ENEPER:
      00985F 6B CD 96         [ 2]   83     subw x,#2*CELLL 
      009862 EC CD 94 BD      [ 2]   84     ldw y,#28667 
      009866 98 84            [ 2]   85     ldw (2,x),y 
      009868 CD 94 78 CD      [ 2]   86     ldw y,#10546 
      00986C A0               [ 2]   87     ldw (x),y 
      00986D 35               [ 4]   88     ret 
                                     89 
                                     90 ;   SQRT10 ( -- 22936 7253 )
                                     91 ; precision: 5.7e-9 
      00986E CD 87                   92         .word LINK 
                           001A67    93         LINK=.
      009870 03                      94         .byte 6 
      009871 CD 84 67 98 43 CD       95         .ascii "SQRT10" 
      001A6E                         96 SQRT10:
      009877 A0 BD 81         [ 2]   97     subw x,#2*CELLL
      00987A 98 51 07 44      [ 2]   98     ldw y,#22936 
      00987E 4F 43            [ 2]   99     ldw (2,x),y 
      009880 4F 4E 53 54      [ 2]  100     ldw y,#7253
      009884 FF               [ 2]  101     ldw (x),y 
      009884 1D               [ 4]  102     ret 
                                    103 
                                    104 ;   12RT2 ( -- 26797 25293 )
                                    105 ; precision: 1.0e-9 
                                    106 ; used in music to compute well tempered scale
      009885 00 02                  107         .word LINK 
                           001A7F   108         LINK=. 
      009887 90                     109         .byte 5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009888 85 90 FE FF 81         110         .ascii "12RT2"
      001A85                        111 RT12_2:
      00988D 98 7C 05         [ 2]  112     subw x,#2*CELLL 
      009890 5F 54 59 50      [ 2]  113     ldw y,#26797
      009894 45 02            [ 2]  114     ldw (2,x),y 
      009895 90 AE 62 CD      [ 2]  115     ldw y,#25293
      009895 CD               [ 2]  116     ldw (x),y 
      009896 85               [ 4]  117     ret 
                                    118 
                                    119 ;   LOG2s ( -- 2040 11103 )
                                    120 ; log(2)/1.6384
                                    121 ; precision: 1.1e-8
      009897 22 20                  122         .word LINK 
                           001A96   123         LINK=.
      009899 0F                     124         .byte 5 
      00989A CD 85 59 CD 84         125         .ascii "LOG2S" 
      001A9C                        126 LOG2S:
      00989F D0 CD 8A         [ 2]  127     subw x,#2*CELLL
      0098A2 E4 CD 84 1E      [ 2]  128     ldw y,#2040 
      0098A6 CD 8A            [ 2]  129     ldw (2,x),y 
      0098A8 4E CD 84 48      [ 2]  130     ldw y,#11103 
      0098AC 98               [ 2]  131     ldw (x),y 
      0098AD 9A               [ 4]  132     ret 
                                    133 
                                    134 ;   LN2 ( -- 485 11464 )
                                    135 ; ln(2)/16.384 
                                    136 ; precision: 1.0e-7 
      0098AE CC 85                  137         .word LINK 
                           001AAD   138         LINK=.
      0098B0 4F                     139         .byte 4 
      0098B1 98 8F 03 64            140         .ascii "LN2S" 
      001AB2                        141 LN2S: 
      0098B5 6D 2B 04         [ 2]  142     subw x,#2*CELLL
      0098B7 90 AE 01 E5      [ 2]  143     ldw y,#485
      0098B7 CD 85            [ 2]  144     ldw (2,x),y 
      0098B9 83 CD 84 34      [ 2]  145     ldw y,#11464 
      0098BD 00               [ 2]  146     ldw (x),y 
      0098BE 04               [ 4]  147     ret 
                                    148 
                                    149 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4452 .endif ; WANT_MATH_CONST
                                   4453 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4454         .include "flash_disco.asm"
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
      0098BF CD 8F                   30     .word LINK 
                           001AC3    31     LINK=.
      0098C1 88                      32     .byte 4 
      0098C2 CD 8E D8 CD             33     .ascii "PTR!"
      001AC8                         34 PSTO:
      0098C6 85 22            [ 1]   35     ldw y,x
      0098C8 20 11            [ 2]   36     ldw y,(y)
      0098CA CD 85 59         [ 2]   37     ldw PTR16,y  
      0098CD CD 84 D0         [ 2]   38     addw x,#CELLL 
      0098D0 CD               [ 4]   39     ret 
                                     40 
                                     41 ;-----------------------------------
                                     42 ; return EEPROM base address 
                                     43 ;  EEPROM  ( -- a )
                                     44 ;-----------------------------------
      0098D1 84 34                   45     .word LINK 
                           001AD5    46 LINK=.
      0098D3 00                      47     .byte 6 
      0098D4 03 CD 8F 88 CD 8A       48     .ascii "EEPROM"
      001ADC                         49 EEPROM: 
      0098DA 4E CD 84 48      [ 2]   50     ldw y,#EEPROM_BASE
      0098DE 98 CA 81         [ 2]   51     subw x,#CELLL 
      0098E1 98               [ 2]   52     ldw (x),y 
      0098E2 B3               [ 4]   53     ret
                                     54 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                     55 ;---------------------------------
                                     56 ; return APP_LAST address 
                                     57 ; EEP-LAST ( -- a )
                                     58 ;---------------------------------
      0098E3 04 44                   59 	.word LINK 
                           001AE7    60 	LINK=.
      0098E5 55                      61 	.byte 8 
      0098E6 4D 50 50 2D 4C 41 53    62 	.ascii "EEP-LAST"
             54
      0098E8                         63 EEPLAST:
      0098E8 CD 86 16         [ 2]   64 	subw x,#CELLL 
      0098EB CD 84 B2 CD      [ 2]   65 	ldw y,#APP_LAST 
      0098EF 85               [ 2]   66 	ldw (x),y 
      0098F0 22               [ 4]   67 	ret 
                                     68 
                                     69 ;----------------------------------
                                     70 ; return APP_RUN address 	
                                     71 ; EEP-RUN ( -- a )
                                     72 ;-----------------------------------
      0098F1 CD 8D                   73 	.word LINK 
                           001AFB    74 	LINK=.
      0098F3 60                      75 	.byte 7
      0098F4 CD 84 34 00 10 CD 89    76 	.ascii "EEP-RUN"
      001B03                         77 EEPRUN:
      0098FB 74 CD 85         [ 2]   78 	subw x,#CELLL 
      0098FE 22 CD 8F 20      [ 2]   79 	ldw y,#APP_RUN 
      009902 CD               [ 2]   80 	ldw (x),y 
      009903 84               [ 4]   81 	ret 
                                     82 
                                     83 ;------------------------------------
                                     84 ; return APP_CP address  
                                     85 ; EEP-CP ( -- a )
                                     86 ;------------------------------------
      009904 34 00                   87 	.word LINK
                           001B0E    88 	LINK=.
      009906 10                      89 	.byte 6 
      009907 CD 87 3F CD 98 B7       90 	.ascii "EEP-CP"
      001B15                         91 EEPCP:
      00990D CD 87 14         [ 2]   92 	subw x,#CELLL 
      009910 CD 87 14 CD      [ 2]   93 	ldw y,#APP_CP  
      009914 8E               [ 2]   94 	ldw (x),y 
      009915 D8               [ 4]   95 	ret 
                                     96 
                                     97 ;------------------------------------
                                     98 ; return APP_VP address 
                                     99 ; EEP-VP ( -- a )
                                    100 ;-------------------------------------
      009916 CD 8E                  101 	.word LINK
                           001B20   102 	LINK=.
      009918 D8                     103 	.byte 6
      009919 CD 98 95 CD 84 48      104 	.ascii "EEP-VP"
      001B27                        105 EEPVP:
      00991F 98 FF CD         [ 2]  106 	subw x,#CELLL 
      009922 85 4F CD 85      [ 2]  107 	ldw y,#APP_VP  
      009926 03               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009927 CD               [ 4]  109 	ret 
                                    110 
                                    111 ;----------------------------------
                                    112 ; update APP_LAST with LAST 
                                    113 ; UPDAT-LAST ( -- )
                                    114 ;----------------------------------
      009928 86 16                  115 	.word LINK 
                           001B32   116 	LINK=.
      00992A CC                     117 	.byte 10
      00992B 84 9B 98 E3 02 2E 53   118 	.ascii "UPDAT-LAST"
             41 53 54
      009932                        119 UPDATLAST:
      009932 CD 8F 20         [ 4]  120 	call LAST
      009935 CD 8A FC         [ 4]  121 	call AT  
      009938 CD 85 22         [ 4]  122 	call EEPLAST
      00993B 20 09 CD         [ 2]  123 	jp EE_STORE 
                                    124 
                                    125 ;---------------------------------
                                    126 ; update APP_RUN 
                                    127 ; UPDAT-RUN ( a -- )
                                    128 ;---------------------------------
      00993E 85 16                  129 	.word LINK
                           001B4B   130 	LINK=.
      009940 CD                     131 	.byte 9
      009941 8B 13 CD 8F BB CD 84   132 	.ascii "UPDAT-RUN"
             48 99
      001B55                        133 UPDATRUN:
      00994A 3D CD 8F         [ 4]  134 	call EEPRUN
      00994D 5F 05 20         [ 2]  135 	jp EE_STORE 
                                    136 	
                                    137 ;---------------------------------
                                    138 ; update APP_CP with CP 
                                    139 ; UPDAT-CP ( -- )
                                    140 ;---------------------------------
      009950 3C 73                  141 	.word LINK 
                           001B5D   142 	LINK=.
      009952 70                     143 	.byte 8 
      009953 20 81 99 2F 05 3E 4E   144 	.ascii "UPDAT-CP"
             41
      001B66                        145 UPDATCP:
      00995B 4D 45 35         [ 4]  146 	call CPP 
      00995D CD 04 32         [ 4]  147 	call AT 
      00995D CD 86 99         [ 4]  148 	call EEPCP 
      009960 CD 84 B2         [ 2]  149 	jp EE_STORE 
                                    150 
                                    151 ;----------------------------------
                                    152 ; update APP_VP with VP 
                                    153 ; UPDAT-VP ( -- )
                                    154 ;----------------------------------
      009963 CD 85                  155 	.word LINK
                           001B74   156 	LINK=.
      009965 59                     157 	.byte 8 
      009966 CD 84 67 99 84 CD 87   158 	.ascii "UPDAT-VP" 
             3F
      001B7D                        159 UPDATVP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      00996E CD 91 40         [ 4]  160 	call VPP 
      009971 CD 85 CE         [ 4]  161 	call AT
      009974 CD 84 67         [ 4]  162 	call EEPVP 
      009977 99 7E CD         [ 2]  163 	jp EE_STORE
                                    164 	
                                    165 
                                    166 ;----------------------------------
                                    167 ; unlock EEPROM/OPT for writing/erasing
                                    168 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    169 ;  UNLKEE   ( -- )
                                    170 ;----------------------------------
      00997A 8A 32                  171     .word LINK 
                           001B8B   172 LINK=.
      00997C 20                     173     .byte 6 
      00997D E2 CD 85 69 CC 85      174     .ascii "UNLKEE"
      001B92                        175 unlock_eeprom:
      009983 4F CD 87 34      [ 1]  176 	mov FLASH_CR2,#0 
      009987 CC 8A BA 99      [ 1]  177 	mov FLASH_NCR2,#0xFF 
      00998B 57 03 2E 49      [ 1]  178 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      00998F 44 56 50 64      [ 1]  179     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009990 72 07 50 5F FB   [ 2]  180 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009990 CD               [ 4]  181 	ret
                                    182 
                                    183 ;----------------------------------
                                    184 ; unlock FLASH for writing/erasing
                                    185 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    186 ; UNLKFL  ( -- )
                                    187 ;----------------------------------
      009991 87 03                  188     .word LINK 
                           001BAA   189 LINK=. 
      009993 CD                     190     .byte 6 
      009994 84 67 99 A6 CD 8B      191     .ascii "UNLKFL"    
      001BB1                        192 unlock_flash:
      00999A 91 CD 84 34      [ 1]  193 	mov FLASH_CR2,#0 
      00999E 00 1F CD 85      [ 1]  194 	mov FLASH_NCR2,#0xFF 
      0099A2 A5 CC 98 95      [ 1]  195 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      0099A6 CD 8F 5F 09      [ 1]  196 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      0099AA 20 6E 6F 4E 61   [ 2]  197 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      0099AF 6D               [ 4]  198 	ret
                                    199 
                                    200 ;-----------------------------
                                    201 ; unlock FLASH or EEPROM 
                                    202 ; according to PTR16 address 
                                    203 ;  UNLOCK ( -- )
                                    204 ;-----------------------------
      0099B0 65 81                  205 	.word LINK 
                           001BC9   206 	LINK=.
      0099B2 99                     207 	.byte 6
      0099B3 8C 05 57 4F 52 44      208 	.ascii "UNLOCK"
      001BD0                        209 unlock:
                                    210 ; put addr[15:0] in Y, for bounds check.
      0099B9 53 BE 32         [ 2]  211 	ldw y,PTR16   ; Y=addr15:0
      0099BA 90 A3 80 00      [ 2]  212     cpw y,#FLASH_BASE
      0099BA CD 8F            [ 1]  213     jruge 4$
      0099BC 20 CD 86 99      [ 2]  214 	cpw y,#EEPROM_BASE  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      0099C0 CD 84            [ 1]  215     jrult 9$
      0099C2 B2 CD 87 03      [ 2]  216 	cpw y,#OPTION_END 
      0099C6 CD 84            [ 1]  217 	jrugt 9$
      0099C8 67 99 DC         [ 4]  218 	call unlock_eeprom
      0099CB CD               [ 4]  219 	ret 
      0099CC 85 59 CD         [ 4]  220 4$: call unlock_flash
      0099CF 8E               [ 4]  221 9$: ret 
                                    222 
                                    223 ;-------------------------
                                    224 ; lock write access to 
                                    225 ; FLASH and EEPROM 
                                    226 ; LOCK ( -- )
                                    227 ;-------------------------
      0099D0 D8 CD                  228 	.word LINK 
                           001BEF   229 	LINK=.
      0099D2 99                     230 	.byte 4 
      0099D3 90 CD 8A 32            231 	.ascii "LOCK" 
      001BF4                        232 lock: 
      0099D7 CD 84 7E 99      [ 1]  233 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0099DB C0 81 99 B4      [ 1]  234 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      0099DF 02               [ 4]  235 	ret 
                                    236 
                                    237 ;-------------------------
                                    238 ; increment PTR16 
                                    239 ; INC-PTR16 ( -- )
                                    240 ;-------------------------
      0099E0 68 69                  241 	.word LINK 
                           001BFF   242 	LINK=. 
      0099E2 08                     243 	.byte 8 
      0099E2 CD 8F 20 CD 8F 5F 0F   244 	.ascii "INC-PTR16" 
             73 74
      001C09                        245 INC_PTR16:
      0099EB 6D 38            [ 2]  246 	pushw y 
      0099ED 65 46 6F         [ 2]  247 	ldw y,PTR16 
      0099F0 72 74            [ 2]  248 	incw y 
      0099F2 68 20 76         [ 2]  249 	ldw PTR16,y
      0099F5 33 2E            [ 2]  250 	popw y 
      0099F7 30               [ 4]  251 	ret 
                                    252 
                                    253 
                                    254 ;----------------------------
                                    255 ; write a byte at address pointed 
                                    256 ; by PTR16 and increment PTR16.
                                    257 ; Expect pointer already initialized 
                                    258 ; and memory unlocked 
                                    259 ; WR-BYTE ( c -- )
                                    260 ;----------------------------
      0099F8 CD 8F                  261 	.word LINK 
                           001C18   262 	LINK=. 
      0099FA 5F                     263 	.byte 7 
      0099FB 14 20 66 6F 72 20 53   264 	.ascii "WR-BYTE" 
                                    265 
      001C20                        266 WR_BYTE:
      009A02 54 4D            [ 1]  267 	ldw y,x 
      009A04 38 53            [ 2]  268 	ldw y,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009A06 2D 44 49         [ 2]  269 	addw x,#CELLL 
      009A09 53 43            [ 1]  270 	ld a,yl
      009A0B 4F 56 45         [ 4]  271 	ld [PTR16],a
      009A0E 52 59 CC 8F 20   [ 2]  272 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009A13 99 DF            [ 2]  273 	jra INC_PTR16 
                                    274 
                                    275 ;---------------------------------------
                                    276 ; write a word at address pointed 
                                    277 ; by PTR16 and incrment PTR16 
                                    278 ; Expect pointer already initialized 
                                    279 ; WR-WORD ( w -- )
                                    280 ;---------------------------------------
      009A15 05 27                  281 	.word LINK 
                           001C35   282 	LINK=.
      009A17 42                     283 	.byte 7
      009A18 4F 4F 54 57 4F 52 44   284 	.ascii "WR-WORD"
      009A1B                        285 WR_WORD:
      009A1B CD 86            [ 1]  286 	ldw y,x 
      009A1D 06 40            [ 2]  287 	ldw y,(y)
      009A1F 02 9A            [ 2]  288 	pushw y 
      009A21 15 04            [ 1]  289 	swapw y 
      009A23 43               [ 2]  290 	ldw (x),y 
      009A24 4F 4C 44         [ 4]  291 	call WR_BYTE 
      009A27 90 85            [ 2]  292 	popw y 
      009A27 CD 84 34         [ 2]  293 	subw x,#CELLL
      009A2A 80               [ 2]  294 	ldw (x),y 
      009A2B AF CD 84         [ 4]  295 	call WR_BYTE
      009A2E 34 00 06         [ 2]  296 	jp lock 
                                    297 
                                    298 
                                    299 ;---------------------------------------
                                    300 ; write a byte to FLASH or EEPROM/OPTION  
                                    301 ; EEC!  (c a -- )
                                    302 ;---------------------------------------
      009A31 CD 84                  303     .word LINK 
                           001C57   304 	LINK=.
      009A33 34                     305     .byte 4 
      009A34 00 1A CD 8B            306     .ascii "EEC!"
                                    307 	; local variables 
                           000001   308 	BTW = 1   ; byte to write offset on stack
                           000002   309     OPT = 2 
                           000002   310 	VSIZE = 2
      001C5C                        311 EE_CSTORE:
      009A38 F5 90            [ 2]  312 	sub sp,#VSIZE
      009A3A CE 40 02         [ 4]  313     call PSTO
      009A3D 26 0B            [ 1]  314 	ld a,(1,x)
      009A3F 1D               [ 1]  315 	cpl a 
      009A40 00 02            [ 1]  316 	ld (BTW,sp),a ; byte to write 
      009A42 90 AE            [ 1]  317 	clr (OPT,sp)  ; OPTION flag
      009A44 99 E2 FF         [ 4]  318 	call unlock 
                                    319 	; check if option
      009A47 CD 9B D5         [ 2]  320 	ldw y,PTR16 
      009A4A 90 A3 48 00      [ 2]  321 	cpw y,#OPTION_BASE
      009A4A 90 CE            [ 1]  322 	jrmi 2$
      009A4C 40 00 90 B3      [ 2]  323 	cpw y,#OPTION_END+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009A50 1A 22            [ 1]  324 	jrpl 2$
      009A52 05 CD            [ 1]  325 	cpl (OPT,sp)
                                    326 	; OPTION WRITE require this unlock 
      009A54 9B BD 20 06      [ 1]  327     bset FLASH_CR2,#FLASH_CR2_OPT
      009A58 72 1F 50 5C      [ 1]  328     bres FLASH_NCR2,#FLASH_CR2_OPT 
      001C84                        329 2$: 
      009A58 90 BF 1A         [ 4]  330 	call WR_BYTE 	
      009A5B 90 BF            [ 1]  331 	tnz (OPT,sp)
      009A5D 14 0D            [ 1]  332 	jreq 3$ 
      009A5E 7B 01            [ 1]  333     ld a,(BTW,sp)
      009A5E 90 CE            [ 1]  334     clrw y
      009A60 40 04            [ 1]  335 	ld yl,a 
      009A62 90 B3 18         [ 2]  336 	subw x,#CELLL 
      009A65 24               [ 2]  337 	ldw (x),y 
      009A66 06 CD 9B         [ 4]  338 	call WR_BYTE
      001C98                        339 3$: 
      009A69 E6 90 BE         [ 4]  340 	call lock 
      009A6C 18 02            [ 2]  341 	addw sp,#VSIZE 
      009A6D 81               [ 4]  342     ret
                                    343 
                                    344 ;------------------------------
                                    345 ; write integer in FLASH|EEPROM
                                    346 ; EE! ( n a -- )
                                    347 ;------------------------------
      009A6D 90 BF                  348 	.word LINK 
                           001CA0   349 	LINK=.
      009A6F 18                     350 	.byte 3 
      009A70 90 CE 40               351 	.ascii "EE!"
      001CA4                        352 EE_STORE:
      009A73 06 90 B3         [ 4]  353 	call PSTO 
      009A76 16 22 05         [ 4]  354 	call unlock 
      009A79 CD 9B FD         [ 2]  355 	jp WR_WORD 
                                    356 
                                    357 
                                    358 ;----------------------------
                                    359 ; Erase flash memory row 
                                    360 ; stm8s105c6 as 128 bytes rows
                                    361 ; ROW-ERASE ( a -- )
                                    362 ;----------------------------
      009A7C 20 03                  363 	.word LINK 
                           001CAF   364 	LINK=. 
      009A7E 09                     365 	.byte 9 
      009A7E 90 BF 16 2D 45 52 41   366 	.ascii "ROW-ERASE" 
             53 45
      009A81                        367 row_erase:
      009A81 CD 94 23         [ 4]  368 	call PSTO
                                    369 ;code must be execute from RAM 
                                    370 ;copy routine to PAD 
      009A84 CD 9A 1B         [ 2]  371 	subw x,#CELLL 
      009A87 CD 8B DE CD      [ 2]  372 	ldw y,#row_erase_proc
      009A8B 96               [ 2]  373 	ldw (x),y 
      009A8C EC CC 94         [ 4]  374 	call PAD 
      009A8F 40 9A 22 02      [ 2]  375 	ldw y,#row_erase_proc_end 
      009A93 50 49 1D 06      [ 2]  376 	subw y,#row_erase_proc
      009A95 1D 00 02         [ 2]  377 	subw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009A95 1D               [ 2]  378 	ldw (x),y 
      009A96 00 04 90         [ 4]  379 	call CMOVE 
      001CD6                        380 block_erase:
      009A99 AE 01 63         [ 2]  381 	ldw y,PTR16
      009A9C EF 02 90 AE      [ 2]  382 	cpw y,#app_space 
      009AA0 00 71            [ 1]  383 	jrpl erase_flash 
                                    384 ; erase EEPROM block
      009AA2 FF 81 9A 92      [ 2]  385 	cpw y,#EEPROM_BASE 
      009AA6 05 53            [ 1]  386 	jruge 1$
      009AA8 51               [ 4]  387 	ret ; bad address 
      009AA9 52 54 32 FF      [ 2]  388 1$: cpw y,#EEPROM_END 
      009AAC 23 01            [ 2]  389 	jrule 2$ 
      009AAC 1D               [ 4]  390 	ret ; bad address 
      001CED                        391 2$:	
      009AAD 00 04 90         [ 4]  392 	call unlock_eeprom 
      009AB0 AE 4C            [ 2]  393 	jra proceed_erase
                                    394 ; erase flash block:
      001CF2                        395 erase_flash:
      009AB2 91 EF 02         [ 4]  396 	call unlock_flash 
      001CF5                        397 proceed_erase:
      009AB5 90 AE 36         [ 4]  398 	call PAD 
      009AB8 24 FF            [ 1]  399 	ldw y,x
      009ABA 81 9A            [ 2]  400 	ldw y,(y)
      009ABC A6 05 53         [ 2]  401 	addw x,#CELLL  
      009ABF 51 52            [ 4]  402 	call (y) 
      009AC1 54 33 50 5F      [ 1]  403 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009AC3 81               [ 4]  404 	ret 
                                    405 
                                    406 ; this routine is to be copied to PAD 
      001D06                        407 row_erase_proc:
      009AC3 1D 00 04 90      [ 1]  408 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009AC7 AE 49 81 EF      [ 1]  409 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009ACB 02               [ 1]  410 	clr a 
      009ACC 90 AE            [ 1]  411 	clrw y 
      009ACE 2A 70 FF         [ 4]  412 	ld ([PTR16],y),a
      009AD1 81 9A            [ 2]  413     incw y
      009AD3 BD 01 45         [ 4]  414 	ld ([PTR16],y),a
      009AD6 90 5C            [ 2]  415     incw y
      009AD6 1D 00 04         [ 4]  416 	ld ([PTR16],y),a
      009AD9 90 AE            [ 2]  417     incw y
      009ADB 6F FB EF         [ 4]  418 	ld ([PTR16],y),a
      009ADE 02 90 AE 29 32   [ 2]  419 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009AE3 FF               [ 4]  420 	ret
      001D29                        421 row_erase_proc_end:
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                           000001   433 	BCNT=1 
      001D29                        434 copy_buffer:
      009AE4 81 9A            [ 1]  435 	push #BLOCK_SIZE  
                                    436 ;enable block programming 
      009AE6 D4 06 53 51      [ 1]  437 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009AEA 52 54 31 30      [ 1]  438 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009AEE 90 5F            [ 1]  439 	clrw y
      009AEE 1D               [ 1]  440 1$:	ld a,(x)
      009AEF 00 04 90         [ 4]  441 	ld ([PTR16],y),a
      009AF2 AE               [ 2]  442 	incw x 
      009AF3 59 98            [ 2]  443 	incw y 
      009AF5 EF 02            [ 1]  444 	dec (BCNT,sp)
      009AF7 90 AE            [ 1]  445 	jrne 1$
                                    446 ; wait EOP bit 
      009AF9 1C 55 FF 81 9A   [ 2]  447 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009AFE E7               [ 1]  448 	pop a ; remove BCNT from stack 
      009AFF 05               [ 4]  449 	ret 
      001D47                        450 copy_buffer_end:
                                    451 
                                    452 ;-------------------------
                                    453 ; move program_row to RAM 
                                    454 ; in TIB 
                                    455 ;------------------------
      001D47                        456 copy_prog_to_ram:
      009B00 31 32 52         [ 2]  457 	subw x,#6
      009B03 54 32 1D 29      [ 2]  458 	ldw y,#copy_buffer 
      009B05 EF 04            [ 2]  459 	ldw (4,x),y 
      009B05 1D 00 04 90      [ 2]  460 	ldw y,#TIBBASE
      009B09 AE 68            [ 2]  461 	ldw (2,x),y 
      009B0B AD EF 02 90      [ 2]  462 	ldw y,#copy_buffer_end 
      009B0F AE 62 CD FF      [ 2]  463 	subw y,#copy_buffer  
      009B13 81               [ 2]  464 	ldw (x),y 
      009B14 9A FF 05         [ 4]  465 	call CMOVE 
      009B17 4C               [ 4]  466 	ret 
                                    467 
                                    468 
                                    469 ;-----------------------------
                                    470 ; write a row in FLASH/EEPROM 
                                    471 ; WR-ROW ( ab ar -- )
                                    472 ; ab -> address 128 byte buffer to write 
                                    473 ; ar ->  row address in FLASH|EEPROM 
                                    474 ;-----------------------------
      009B18 4F 47                  475 	.word LINK 
                           001D65   476 	LINK=.
      009B1A 32                     477 	.byte 6 
      009B1B 53 52 2D 52 4F 57      478 	.ascii "WR-ROW"
      009B1C                        479 WR_ROW:
      009B1C 1D 00 04         [ 4]  480 	call PSTO
                                    481 ; align to FLASH block 
      009B1F 90 AE            [ 1]  482 	ld a,#0x80 
      009B21 07 F8            [ 1]  483 	and a,PTR8 
      009B23 EF 02            [ 1]  484 	ld PTR8,a  
      009B25 90 AE 2B         [ 4]  485 	call copy_prog_to_ram
      009B28 5F FF 81         [ 4]  486 	call unlock
      009B2B 9B 16            [ 1]  487 	ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009B2D 04 4C            [ 2]  488 	ldw y,(y)
      009B2F 4E 32 53         [ 2]  489 	addw x,#CELLL 
      009B32 89               [ 2]  490 	pushw x 
      009B32 1D               [ 1]  491 	ldw x,y ; buffer address in x 
      009B33 00 04 90         [ 4]  492 	call TIBBASE
      009B36 AE 01 E5         [ 4]  493 	call lock
      009B39 EF               [ 2]  494 	popw x 
      009B3A 02               [ 4]  495 	ret 
                                    496 
                                    497 ;-------------------------------------
                                    498 ; change value of OPTION register 
                                    499 ; SET-OPT (c n -- ) 
                                    500 ; c new value.
                                    501 ; n OPT  number {1..7}
                                    502 ;--------------------------------------
      009B3B 90 AE                  503 		.word LINK 
                           001D8E   504 		LINK=.
      009B3D 2C                     505 		.byte 7 
      009B3E C8 FF 81 9B 2D 04 50   506 		.ascii "SET-OPT" 
      001D96                        507 set_option: 
      009B45 54 52            [ 1]  508 		ldw y,x 
      009B47 21 FE            [ 2]  509 		ldw y,(y)
      009B48 27 06            [ 1]  510 		jreq 1$
      009B48 90 93 90 FE      [ 2]  511 		cpw y,#7 
      009B4C 90 BF            [ 2]  512 		jrule 2$ 
                                    513 ; invalid OPTION number 		
      009B4E 32 1C 00         [ 2]  514 1$:		addw x,#2*CELLL
      009B51 02               [ 4]  515 		ret
      009B52 81 9B            [ 2]  516 2$:		sllw y 
      009B54 43 06 45 45      [ 2]  517 		addw y,#OPTION_BASE-1
      009B58 50               [ 2]  518 		ldw (x),y 
      009B59 52 4F 4D         [ 4]  519 		call EE_CSTORE
      009B5C 81               [ 4]  520 		ret 
                                    521 
                                    522 
                                    523 
                                    524 ;--------------------------------------
                                    525 ; reset system to its original state 
                                    526 ; before any user modification
                                    527 ; PRISTINE ( -- )
                                    528 ;-------------------------------------
      009B5C 90 AE                  529 	.word LINK  
                           001DB3   530 	LINK=.
      009B5E 40                     531 	.byte 8 
      009B5F 00 1D 00 02 FF 81 9B   532 	.ascii "PRISTINE"
             55
      001DBC                        533 pristine:
                                    534 ;;; erase EEPROM
      009B67 08 45 45         [ 4]  535 	call EEPROM 
      009B6A 50 2D 4C         [ 4]  536 1$:	call DUPP 
      009B6D 41 53 54         [ 4]  537 	call row_erase
      009B70 90 93            [ 1]  538 	ldw y,x 
      009B70 1D 00            [ 2]  539 	ldw y,(y)
      009B72 02 90 AE 40      [ 2]  540 	addw y,#BLOCK_SIZE
      009B76 00               [ 2]  541 	ldw (x),y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009B77 FF 81 9B 67      [ 2]  542 	cpw y,#OPTION_BASE 
      009B7B 07 45            [ 1]  543 	jrult 1$
                                    544 ;;; reset OPTION to default values
      009B7D 45 50 2D 52      [ 2]  545 	ldw y,#1 ; OPT1 
      009B81 55               [ 2]  546 2$:	ldw (x),y   
      009B82 4E 5F            [ 1]  547 	clrw y 
      009B83 EF 02            [ 2]  548 	ldw (2,x),y  ; ( 0 1 -- ) 
      009B83 1D 00 02         [ 4]  549 	call DDUP    ; ( 0 1 0 1 -- )  
      009B86 90 AE 40         [ 4]  550 	call set_option
      009B89 02 FF            [ 1]  551 	ldw y,x 
      009B8B 81 9B            [ 2]  552 	ldw y,(y)
      009B8D 7B 06            [ 2]  553 	incw y  ; next OPTION 
      009B8F 45 45 50 2D      [ 2]  554 	cpw y,#8 
      009B93 43 50            [ 1]  555 	jrult 2$
                                    556 ;;; erase first row of app_space 	
      009B95 CD 04 CF         [ 4]  557 	call DROP 
      009B95 1D 00 02 90      [ 2]  558 	ldw y,#app_space
      009B99 AE               [ 2]  559 	ldw (x),y   
      009B9A 40 04 FF         [ 4]  560 	call row_erase 
                                    561 ; reset interrupt vectors 
      009B9D 81 9B 8E         [ 2]  562 	subw x,#CELLL 
      009BA0 06 45            [ 1]  563 	clrw y  
      009BA2 45               [ 2]  564 4$:	ldw (x),y  ; ( n -- ) int# 
      009BA3 50 2D 56         [ 4]  565 	call DUPP  
      009BA6 50 1E 20         [ 4]  566 	call reset_vector
      009BA7 90 93            [ 1]  567 	ldw y,x 
      009BA7 1D 00            [ 2]  568 	ldw y,(y)
      009BA9 02 90            [ 2]  569 	incw y   ; next vector 
      009BAB AE 40 06 FF      [ 2]  570 	cpw y,#29 
      009BAF 81 9B            [ 1]  571 	jrult 4$
      009BB1 A0 0A 55         [ 2]  572 	jp NonHandledInterrupt ; reset MCU
                                    573 
                                    574 ;------------------------------
                                    575 ; reset an interrupt vector 
                                    576 ; to its initial value 
                                    577 ; i.e. NonHandledInterrupt
                                    578 ; RST-IVEC ( n -- )
                                    579 ;-----------------------------
      009BB4 50 44                  580 	.word LINK 
                           001E17   581 	LINK=. 
      009BB6 41                     582 	.byte 8 
      009BB7 54 2D 4C 41 53 54 45   583 	.ascii "RST-IVEC"
             43
      009BBD                        584 reset_vector:
      009BBD CD 86            [ 1]  585 	ldw y,x
      009BBF C5 CD 84         [ 2]  586 	addw x,#CELLL 
      009BC2 B2 CD            [ 2]  587 	ldw y,(y)
      009BC4 9B 70 CC 9D      [ 2]  588 	cpw y,#23 
      009BC8 24 9B            [ 1]  589 	jreq 9$
      009BCA B2 09 55 50      [ 2]  590 	cpw y,#29 ; last vector
      009BCE 44 41            [ 1]  591 	jrugt 9$  
      009BD0 54 2D            [ 2]  592 	sllw y 
      009BD2 52 55            [ 2]  593 	sllw y 
      009BD4 4E A9 80 08      [ 2]  594 	addw y,#0x8008 ; irq0 address 
      009BD5 1D 00 02         [ 2]  595 	subw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009BD5 CD               [ 2]  596 	ldw (x),y 
      009BD6 9B 83 CC         [ 4]  597 	call PSTO 
      009BD9 9D 24 9B         [ 2]  598 	subw x,#CELLL 
      009BDC CB 08            [ 1]  599 	clrw y
      009BDE 55 50            [ 1]  600 	ld a,#0x82 
      009BE0 44 41            [ 1]  601 	ld yh,a
      009BE2 54               [ 2]  602 	ldw (x),y
      009BE3 2D 43 50         [ 4]  603 	call WR_WORD 
      009BE6 1D 00 02         [ 2]  604 	subw x,#CELLL
      009BE6 CD 86 B5 CD      [ 2]  605 	ldw y,#NonHandledInterrupt
      009BEA 84               [ 2]  606 	ldw (x),y 
      009BEB B2 CD 9B         [ 4]  607 	call WR_WORD 
      009BEE 95               [ 4]  608 9$:	ret 
                                    609 
                                    610 
                                    611 ;------------------------------
                                    612 ; all interrupt vector with 
                                    613 ; an address >= a are resetted 
                                    614 ; to default
                                    615 ; CHKIVEC ( a -- )
                                    616 ;------------------------------
      009BEF CC 9D                  617 	.word LINK 
                           001E5D   618 	LINK=.
      009BF1 24                     619 	.byte 7
      009BF2 9B DD 08 55 50 44 41   620 	.ascii "CHKIVEC"
                                    621 ;local variables 
                           000001   622 	SSP=1
                           000003   623 	CADR=3
                           000005   624 	OFS=5
                           000006   625 	VSIZE=6  
      001E65                        626 CHKIVEC:
      009BF9 54 2D            [ 2]  627 	sub sp,#VSIZE ;alloc local variables 
      009BFB 56 50            [ 1]  628 	ldw y,x 
      009BFD 90 FE            [ 2]  629 	ldw y,(y)
      009BFD CD 86            [ 2]  630 	ldw (CADR,sp),y ; ca 
      009BFF A7 CD            [ 2]  631 	ldw (SSP,sp),x 
      009C01 84 B2 CD         [ 2]  632 	ldw x,#0x800a ; irq0 address 
      009C04 9B A7            [ 2]  633 	ldw PTR16,X
      009C06 CC 9D 24         [ 2]  634 	ldw x,#-4 
      009C09 9B F4 06         [ 2]  635 1$:	addw x,#4
      009C0C 55 4E 4C         [ 2]  636 	cpw x,#30*4 ; irq0-29 
      009C0F 4B 45            [ 1]  637 	jreq 9$
      009C11 45 93            [ 1]  638 	ldw y,x  
      009C12 91 D6 32         [ 4]  639 	ld a,([PTR16],y)
      009C12 35 00            [ 1]  640 	cp a,(CADR,sp)
      009C14 50 5B            [ 1]  641 	jrult 1$
      009C16 35 FF            [ 2]  642 	incw y 
      009C18 50 5C 35         [ 4]  643 	ld a,([PTR16],y)
      009C1B AE 50            [ 1]  644 	cp a,(CADR+1,sp) 
      009C1D 64 35            [ 1]  645 	jrult 1$ 
      009C1F 56 50            [ 2]  646 	ldw (OFS,sp),x 
      009C21 64               [ 2]  647 	srlw x
      009C22 72               [ 2]  648 	srlw x 
      009C23 07 50            [ 1]  649 	ldw y,x 
      009C25 5F FB            [ 2]  650 	ldw x,(SSP,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009C27 81               [ 2]  651 	ldw (x),y
      009C28 9C 0B 06         [ 4]  652 	call reset_vector
      009C2B 55 4E            [ 2]  653 	ldw x,(OFS,sp) 
      009C2D 4C 4B            [ 2]  654 	jra 1$
      009C2F 46 4C            [ 2]  655 9$:	ldw x,(SSP,sp) 
      009C31 1C 00 02         [ 2]  656 	addw x,#CELLL 
      009C31 35 00            [ 2]  657 	addw sp,#VSIZE ; drop local variables  
      009C33 50               [ 4]  658 	ret 
                                    659 
                                    660 ;------------------------------
                                    661 ; set interrupt vector 
                                    662 ; SET-IVEC ( a n -- )
                                    663 ;  a Handler address
                                    664 ;  n  vector # 0 .. 29 
                                    665 ;-----------------------------
      009C34 5B 35                  666 	.word LINK
                           001EAB   667 	LINK=.
      009C36 FF                     668 	.byte 8 
      009C37 50 5C 35 56 50 62 35   669 	.ascii "SET-IVEC" 
             AE
      001EB4                        670 set_vector:
      009C3F 50 62            [ 1]  671     ldw y,x 
      009C41 72 03            [ 2]  672 	ldw y,(y) ; vector #
      009C43 50 5F FB 81      [ 2]  673 	cpw y,#29 ; last vector
      009C47 9C 2A            [ 2]  674 	jrule 2$
      009C49 06 55 4E         [ 2]  675 	addw x,#2*CELLL 
      009C4C 4C               [ 4]  676 	ret
      009C4D 4F 43            [ 2]  677 2$:	sllw y 
      009C4F 4B 58            [ 2]  678 	sllw y 
      009C50 72 A9 80 08      [ 2]  679 	addw y,#0X8008 ; IRQ0 vector address 
      009C50 90               [ 2]  680 	ldw (x),y  ; vector address 
      009C51 BE 32 90         [ 4]  681 	call PSTO 
      009C54 A3 80            [ 1]  682 	clrw y 
      009C56 00 24            [ 1]  683 	ld a,#0x82 
      009C58 10 90            [ 1]  684 	ld yh,a 
      009C5A A3 40 00         [ 2]  685 	subw x,#CELLL 
      009C5D 25               [ 2]  686 	ldw (x),y 
      009C5E 0D 90 A3         [ 4]  687 	call WR_WORD 
      009C61 48 7F 22         [ 4]  688 	call WR_WORD 
      009C64 07               [ 4]  689 9$: ret 
                                    690 
                                    691 
                                    692 ;------------------------
                                    693 ; Compile word to flash
                                    694 ; EE, (w -- )
                                    695 ;-----------------------
      009C65 CD 9C                  696 	.word LINK
                           001EE1   697 	LINK=.
      009C67 12                     698 	.byte 3
      009C68 81 CD 9C               699 	.ascii "EE,"
      001EE5                        700 EE_COMMA:
      009C6B 31 81 9C         [ 2]  701 	subw x,#CELLL 
      009C6E 49 04 4C         [ 2]  702 	ldw y,UCP
      009C71 4F 43            [ 2]  703 	pushw y 
      009C73 4B               [ 2]  704 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009C74 CD 1C A4         [ 4]  705 	call EE_STORE
      009C74 72 13            [ 2]  706 	popw y 
      009C76 50 5F 72 17      [ 2]  707 	addw y,#2
      009C7A 50 5F 81         [ 2]  708 	ldw UCP,y
      009C7D 9C               [ 4]  709 	ret 
                                    710 
                                    711 
                                    712 ;-------------------------
                                    713 ; Compile byte to flash 
                                    714 ; EEC, ( c -- )	
                                    715 ;-------------------------
      009C7E 6F 08                  716 	.word LINK 
                           001EFD   717 	LINK=.
      009C80 49                     718 	.byte 4 
      009C81 4E 43 2D 50            719 	.ascii "EEC,"
      001F02                        720 EE_CCOMMA:
      009C85 54 52 31         [ 2]  721 	subw x,#CELLL 
      009C88 36 BE 18         [ 2]  722 	ldw y,UCP
      009C89 90 89            [ 2]  723 	pushw y 
      009C89 90               [ 2]  724 	ldw (x),y 
      009C8A 89 90 BE         [ 4]  725 	call EE_CSTORE
      009C8D 32 90            [ 2]  726 	popw y 
      009C8F 5C 90            [ 2]  727 	incw y 
      009C91 BF 32 90         [ 2]  728 	ldw UCP,y
      009C94 85               [ 4]  729 	ret 
                                    730 
                                    731 
                                    732 ;--------------------------
                                    733 ; copy FLASH block to ROWBUF
                                    734 ; ROW>BUF ( ar -- )
                                    735 ; ar row address 
                                    736 ;--------------------------
      009C95 81 9C                  737 	.word LINK 
                           001F18   738 	LINK=.
      009C97 7F                     739 	.byte 7 
      009C98 07 57 52 2D 42 59 54   740 	.ascii "ROW>BUF"
      001F20                        741 ROW2BUF: 
                                    742 ; align row address to block boundary
      009C9F 45 01            [ 1]  743 	ld a,(1,x)
      009CA0 A4 80            [ 1]  744 	and a,#BLOCK_SIZE 
      009CA0 90 93            [ 1]  745 	ld (1,x),a 
      009CA2 90 FE 1C         [ 2]  746 	subw x,#2*CELLL 
      009CA5 00 02 90 9F      [ 2]  747 	ldw y,#ROWBUFF 
      009CA9 92 C7            [ 2]  748 	ldw (2,x),y 
      009CAB 32 72 05 50      [ 2]  749 	ldw y,#BLOCK_SIZE
      009CAF 5F               [ 2]  750 	ldw (x),y 
      009CB0 FB 20 D6         [ 4]  751 	call CMOVE 
      009CB3 9C               [ 4]  752 	ret 
                                    753 
                                    754 
                                    755 ;---------------------------
                                    756 ; copy ROWBUFF to flash 
                                    757 ; BUF>ROW ( ar -- )
                                    758 ; ar row address
                                    759 ;---------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009CB4 98 07                  760 	.word LINK 
                           001F3A   761 	LINK=.
      009CB6 57                     762 	.byte 7 
      009CB7 52 2D 57 4F 52 44 57   763 	.ascii "BUF>ROW" 
      009CBD                        764 BUF2ROW:
      009CBD 90 93 90         [ 4]  765 	call TBUF ; ( ar Ab -- )
      009CC0 FE 90 89         [ 4]  766 	call SWAPP ; ( ab ar -- )
      009CC3 90 5E FF         [ 4]  767 	call WR_ROW 
      009CC6 CD               [ 4]  768 	ret 
                                    769 
                                    770 ;---------------------------------
                                    771 ; how many byte free in that row 
                                    772 ; RFREE ( a -- n )
                                    773 ; a is least byte of target address
                                    774 ;----------------------------------
      009CC7 9C A0                  775 	.word LINK 
                           001F4E   776 	LINK=.
      009CC9 90                     777 	.byte 5 
      009CCA 85 1D 00 02 FF         778 	.ascii "RFREE"
      001F54                        779 RFREE:
      009CCF CD 9C            [ 1]  780 	ld a,(1,x)
      009CD1 A0 CC            [ 1]  781 	and a,#BLOCK_SIZE-1 
      009CD3 9C 74            [ 1]  782 	ld YTEMP,a 
      009CD5 9C B5            [ 1]  783 	ld a,#BLOCK_SIZE 
      009CD7 04 45            [ 1]  784 	sub a,YTEMP 
      009CD9 45 43            [ 1]  785 	clrw y 
      009CDB 21 97            [ 1]  786 	ld yl,a
      009CDC FF               [ 2]  787 	ldw (x),y 
      009CDC 52               [ 4]  788 	ret 
                                    789 
                                    790 ;---------------------------------
                                    791 ; write u bytes to flash/EEPROM 
                                    792 ; constraint to row limit 
                                    793 ; RAM>EE ( af a u1 -- u2 )
                                    794 ; af flash address 
                                    795 ; a ram address 
                                    796 ; u bytes count
                                    797 ; return u2 bytes written  
                                    798 ;-------------------------------
      009CDD 02 CD                  799 	.word LINK 
                           001F66   800 	LINK=. 
      009CDF 9B                     801 	.byte 6
      009CE0 48 E6 01 43 6B 01      802 	.ascii "RAM>EE"
                                    803 	
      001F6D                        804 RAM2EE:
                                    805 ; PICK af
      009CE6 0F 02 CD         [ 4]  806 	call DOLIT 
      009CE9 9C 50                  807 	.word 2 
      009CEB 90 BE 32         [ 4]  808 	call PICK  ; { -- af a u1 af }
      009CEE 90 A3 48         [ 4]  809 	call DUPP 
      009CF1 00 2B 10         [ 4]  810 	call ROW2BUF ; copy in ROWBUFF  
      009CF4 90 A3 48         [ 4]  811 	call DUPP 
      009CF7 80 2A 0A         [ 4]  812 	call TOR 
      009CFA 03 02 72         [ 4]  813 	call DOLIT 
      009CFD 1E 50                  814 	.word BLOCK_SIZE-1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009CFF 5B 72 1F         [ 4]  815 	call ANDD 
      009D02 50 5C B4         [ 4]  816 	call DOLIT 
      009D04 06 80                  817 	.word ROWBUFF 
      009D04 CD 9C A0         [ 4]  818 	call PLUS  ; ( -- af a u1 ab )
      009D07 0D 02 27         [ 4]  819 	call SWAPP ;  ( -- af a ab u1 )
      009D0A 0D 7B 01         [ 4]  820 	call RFROM  ; ( -- af a ab u1 af )
      009D0D 90 5F 90         [ 4]  821 	call RFREE  ; ( -- af a ab u1 n )
      009D10 97 1D 00         [ 4]  822 	call MIN    
      009D13 02 FF CD         [ 4]  823 	call DUPP 
      009D16 9C A0 A2         [ 4]  824 	call TOR  
      009D18 CD 0B 75         [ 4]  825 	call CMOVE  ; copy RAM to RAM from a to ab 
      009D18 CD 9C 74         [ 4]  826 	call BUF2ROW ; ( af --  ) write ROWBUFF to flash 
      009D1B 5B 02 81         [ 4]  827 	call RFROM  ; how many written 
      009D1E 9C               [ 4]  828 	ret 
                                    829 
                                    830 
                                    831 ;--------------------------
                                    832 ; move new colon definition to FLASH 
                                    833 ; using WR-ROW for efficiency 
                                    834 ; preserving bytes already used 
                                    835 ; in the current block. 
                                    836 ; At this point the compiler as completed
                                    837 ; in RAM and pointers CP and CNTXT are updated.
                                    838 ; CNTXT point to nfa of new word and  
                                    839 ; CP is after compiled word so CP-CNTXT+2=count to write 
                                    840 ; 
                                    841 ; FMOVE ( -- cp+ )
                                    842 ; 
                                    843 ;--------------------------
      009D1F D7 03                  844 	.word LINK 
                           001FAF   845 	LINK=.
      009D21 45                     846 	.byte 5 
      009D22 45 21 4F 56 45         847 	.ascii "FMOVE" 
      009D24                        848 FMOVE:
      009D24 CD 9B 48         [ 4]  849 	call TFLASH 
      009D27 CD 9C 50         [ 4]  850 	CALL AT 
      009D2A CC 9C BD         [ 4]  851 	CALL QBRAN 
      009D2D 9D 20                  852 	.word no_move  
      009D2F 09 52 4F         [ 4]  853 	call CPP  
      009D32 57 2D 45         [ 4]  854 	call AT  
      009D35 52 41 53         [ 4]  855 	call DUPP ; ( cp cp -- )
      009D38 45 06 19         [ 4]  856 	call CNTXT 
      009D39 CD 04 32         [ 4]  857 	call AT 
      009D39 CD 9B 48         [ 4]  858 	call DOLIT 
      009D3C 1D 00                  859 	.word 2 
      009D3E 02 90 AE         [ 4]  860 	call SUBB ; ( cp cp la -- ) \ new word link address in RAM  
      009D41 9D 86 FF         [ 4]  861 	call DUPP 
      009D44 CD 8B B9         [ 4]  862 	call TOR    ; ( cp cp la R: la ) 
      001FDD                        863 FMOVE2:
      009D47 90 AE 9D         [ 4]  864 	call HERE  ; ( cp cp la vp  R: la )
      009D4A A9 72 A2         [ 4]  865 	call RAT   ; ( cp cp la vp la R: la )
      009D4D 9D 86 1D         [ 4]  866 	call SUBB ; ( cp cp la wl R: la  ) \ wl is bytes to copy 
      001FE6                        867 next_row:
      009D50 00 02 FF         [ 4]  868 	call DUPP 
      009D53 CD 8B F5         [ 4]  869 	call TOR  ; ( cp cp la wl -- ) R: a wl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009D56 CD 1F 6D         [ 4]  870 	call RAM2EE ; ( cp cp la wl -- cp u2 ) u2 is byte written to FLASH 
      009D56 90 BE 32         [ 4]  871 	call DUPP 
      009D59 90 A3 A1         [ 4]  872 	call TOR
      009D5C 80 2A 13         [ 4]  873 	call PLUS  ; ( cp+ ) 
      009D5F 90 A3 40         [ 4]  874 	call DUPP 
      009D62 00 24 01         [ 4]  875 	call RFROM  ; ( cp+ cp+ u2  R: a wl ) 
      009D65 81 90 A3         [ 4]  876 	call RFROM  ; ( cp+ cp+ u2 wl R: a ) 
      009D68 43 FF 23         [ 4]  877 	call OVER   ; ( cp+ cp+ u2 wl u2 -- )
      009D6B 01 81 4D         [ 4]  878 	call SUBB  ; ( cp+ cp+ u2 wl- R: a )
      009D6D CD 04 D9         [ 4]  879 	call DUPP 
      009D6D CD 9C 12         [ 4]  880 	call QBRAN
      009D70 20 03                  881 	.word fmove_done 
      009D72 CD 04 E9         [ 4]  882 	call SWAPP  ; ( cp+ cp+ wl- u2 R: a )
      009D72 CD 9C 31         [ 4]  883 	call RFROM ; ( cp+ cp+ wl- u2 a -- ) 
      009D75 CD 06 D4         [ 4]  884 	call PLUS  ; ( cp+ cp+ wl- a+ )
      009D75 CD 8B B9         [ 4]  885 	call DUPP 
      009D78 90 93 90         [ 4]  886 	call TOR   ; ( cp+ cp+ wl- a+ ) R: a+
      009D7B FE 1C 00         [ 4]  887 	call SWAPP ; ( cp+ cp+ a+ wl- )
      009D7E 02 90 FD         [ 4]  888 	call BRAN
      009D81 72 17                  889 	.word next_row  
      002026                        890 fmove_done:	
      009D83 50 5F 81         [ 4]  891 	call RFROM  ; ( -- cp+ cp+ u2 wl- a  )
      009D86 1C 00 08         [ 2]  892 	addw x,#4*CELLL ; (  -- cp+ ) new CP 
      009D86 35               [ 4]  893  	ret  
      00202D                        894 no_move:
      009D87 20 50 5B         [ 4]  895 	call ZERO
      009D8A 35               [ 4]  896 	ret 
                                    897 
                                    898 ;------------------------------------------
                                    899 ; adjust pointers after **FMOVE** operetion.
                                    900 ; UPDAT-PTR ( cp+ -- )
                                    901 ; cp+ is new CP position after FMOVE 
                                    902 ;-------------------------------------------
      009D8B DF 50                  903 	.word LINK 
                           002033   904 	LINK=.
      009D8D 5C                     905 	.byte 9
      009D8E 4F 90 5F 91 D7 32 90   906 	.ascii "UPDAT-PTR" 
             5C 91
      00203D                        907 UPDATPTR:
                                    908 ;reset VP to previous position  
      009D97 D7 32 90         [ 4]  909 	call EEPVP 
      009D9A 5C 91 D7         [ 4]  910 	call AT
      009D9D 32 90 5C         [ 4]  911 	call VPP 
      009DA0 91 D7 32         [ 4]  912 	call STORE
                                    913 ;update CONTEXT and LAST 
      009DA3 72 05 50         [ 4]  914 	call EEPCP 
      009DA6 5F FB 81         [ 4]  915 	call AT
      009DA9 CD 03 B4         [ 4]  916 	call DOLIT 
      009DA9 00 02                  917 	.word 2 
      009DA9 4B 80 72         [ 4]  918 	call PLUS 
      009DAC 10 50 5B         [ 4]  919 	call DUPP 
      009DAF 72 11 50         [ 4]  920 	call CNTXT 
      009DB2 5C 90 5F         [ 4]  921 	call STORE
      009DB5 F6 91 D7         [ 4]  922 	call LAST
      009DB8 32 5C 90         [ 4]  923 	call STORE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009DBB 5C 0A 01         [ 4]  924 	call UPDATLAST 
                                    925 ;update CP 
      009DBE 26 F5 72         [ 4]  926 	call CPP 
      009DC1 05 50 5F         [ 4]  927 	call STORE
      009DC4 FB 84 81         [ 4]  928 	call UPDATCP 
      009DC7 81               [ 4]  929 	ret 
                                    930 
                                    931 ;-----------------------------
                                    932 ; move interrupt sub-routine
                                    933 ; in flash memory
                                    934 ;----------------------------- 
      009DC7 20 33                  935 	.word LINK 
                           002075   936 	LINK=. 
      009DC7 1D                     937 	.byte 6
      009DC8 00 06 90 AE 9D A9      938 	.ascii "IFMOVE" 
      00207C                        939 IFMOVE:
      009DCE EF 04 90         [ 4]  940 	call TFLASH 
      009DD1 AE 07 00         [ 4]  941 	CALL AT 
      009DD4 EF 02 90         [ 4]  942 	CALL QBRAN 
      009DD7 AE 9D                  943 	.word no_move 
      009DD9 C7 72 A2         [ 4]  944 	call CPP 
      009DDC 9D A9 FF         [ 4]  945 	call AT 
      009DDF CD 8B F5         [ 4]  946 	call DUPP ; ( cp cp -- )
      009DE2 81 9D 2F         [ 4]  947 	call EEPVP 
      009DE5 06 57 52         [ 4]  948 	call AT  ; ( cp cp a )
      009DE8 2D 52 4F         [ 4]  949 	call TOR 
      009DEB 57 04 96         [ 4]  950 	call RAT ; ( cp cp a -- ) R: a 
      009DEC CC 1F DD         [ 2]  951 	jp FMOVE2 
                                    952 
                                    953 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   4455 
                                   4456 ;===============================================================
                                   4457 
                           002075  4458 LASTN =	LINK   ;last name defined
                                   4459 
                                   4460 ; application code begin here
      002100                       4461 	.bndry 128 ; align on flash block  
      002100                       4462 app_space: 
                                   4463 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000770 R   |   6 ABOR1      0012C3 R
  6 ABOR2      0012DA R   |   6 ABORQ      0012BB R   |   6 ABORT      0012AC R
  6 ABRTQ      001597 R   |   6 ABSS       000767 R   |   6 ACCEP      001242 R
  6 ACCP1      00124B R   |   6 ACCP2      001271 R   |   6 ACCP3      001274 R
  6 ACCP4      001276 R   |     ADC_AWCR=  00540E     |     ADC_AWCR=  00540F 
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
  6 ADRADJ     000673 R   |     AFR     =  004803     |     AFR0_ADC=  000000 
    AFR1_TIM=  000001     |     AFR2_CCO=  000002     |     AFR3_TIM=  000003 
    AFR4_TIM=  000004     |     AFR5_TIM=  000005     |     AFR6_I2C=  000006 
    AFR7_BEE=  000007     |   6 AFT        001582 R   |   6 AGAIN      0014D8 R
  6 AHEAD      001535 R   |   6 ALLOT      0013EB R   |   6 ANDD       000525 R
    APP_CP  =  004004     |     APP_LAST=  004000     |     APP_RUN =  004002 
    APP_VP  =  004006     |   6 AT         000432 R   |   6 ATEXE      000B5E R
  6 AUTORUN    00012B R   |     AWU_APR =  0050F1     |     AWU_CSR1=  0050F0 
    AWU_TBR =  0050F2     |     B115200 =  000006     |     B19200  =  000003 
    B230400 =  000007     |     B2400   =  000000     |     B38400  =  000004 
    B460800 =  000008     |     B4800   =  000001     |     B57600  =  000005 
    B921600 =  000009     |     B9600   =  000002     |   6 BACK1      0011EA R
  6 BASE       000596 R   |     BASEE   =  00000A     |     BCNT    =  000001 
  6 BCOMP      00142D R   |   6 BDIGS      000C45 R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00500F 
  6 BEGIN      0014BA R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
  6 BKSLA      001082 R   |   6 BKSP       0011BA R   |     BKSPP   =  000008 
  6 BLANK      000A2D R   |     BLOCK_SI=  000080     |   6 BRAN       0003FE R
    BTW     =  000001     |   6 BUF2ROW    001F42 R   |   6 BYE        0000B8 R
    CADR    =  000003     |     CALLL   =  0000CD     |     CARRY   =  000028 
  6 CAT        000450 R   |   6 CCOMMA     00140F R   |     CELLL   =  000002 
  6 CELLM      0009B2 R   |   6 CELLP      0009A3 R   |   6 CELLS      0009C1 R
    CFG_GCR =  007F60     |   6 CHAR1      000E72 R   |   6 CHAR2      000E75 R
  6 CHKIVEC    001E65 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
    CLKOPT_E=  000003     |     CLKOPT_P=  000000     |     CLKOPT_P=  000001 
    CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6     |     CLK_CKDI=  000000 
    CLK_CKDI=  000001     |     CLK_CKDI=  000002     |     CLK_CKDI=  000003 
    CLK_CKDI=  000004     |     CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8 
    CLK_ECKR=  0050C1     |     CLK_ECKR=  000000     |     CLK_ECKR=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
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
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |   6 CMOV1      000B7D R
  6 CMOV2      000B95 R   |   6 CMOVE      000B75 R   |     CNTDWN  =  000030 
  6 CNTXT      000619 R   |   6 COLD       0019A7 R   |   6 COLD1      0019A7 R
  6 COLON      001730 R   |   6 COMMA      0013F8 R   |   6 COMPI      00143D R
    COMPO   =  000040     |   6 CONSTANT   0017DA R   |   6 COUNT      000B11 R
  6 CPP        000635 R   |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
  6 CR         000EA0 R   |   6 CREAT      001776 R   |     CRR     =  00000D 
  6 CSTOR      00043F R   |   6 DAT        000AF1 R   |     DATSTK  =  000680 
  6 DDROP      0006B4 R   |   6 DDUP       0006BF R   |     DEBUG   =  000001 
  6 DECIM      000CF5 R   |   6 DEPTH      000A7C R   |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   6 DGTQ1      000D3A R   |   6 DI         0000C6 R
  6 DIG        000C6E R   |   6 DIGIT      000C09 R   |   6 DIGS       000C7F R
  6 DIGS1      000C7F R   |   6 DIGS2      000C8C R   |   6 DIGTQ      000D09 R
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   6 DN1        00072E R
  6 DNEGA      000711 R   |   6 DOCONST    001804 R   |   6 DOLIT      0003B4 R
  6 DONXT      0003C8 R   |   6 DOSTR      000EB6 R   |   6 DOT        000F3B R
  6 DOT1       000F51 R   |   6 DOTI1      001926 R   |   6 DOTID      001910 R
  6 DOTO1      00134F R   |   6 DOTOK      001335 R   |   6 DOTPR      001064 R
  6 DOTQ       0015B1 R   |   6 DOTQP      000EDF R   |   6 DOTR       000EED R
  6 DOTS       0018B2 R   |   6 DOTS1      0018BD R   |   6 DOTS2      0018C6 R
  6 DOVAR      000586 R   |   6 DROP       0004CF R   |   6 DSTOR      000ACB R
  6 DUMP       001868 R   |   6 DUMP1      00187F R   |   6 DUMP3      0018A1 R
  6 DUMPP      001837 R   |   6 DUPP       0004D9 R   |   6 EDIGS      000CAA R
  6 EEPCP      001B15 R   |   6 EEPLAST    001AF0 R   |   6 EEPROM     001ADC R
    EEPROM_B=  004000     |     EEPROM_E=  0043FF     |     EEPROM_S=  000400 
  6 EEPRUN     001B03 R   |   6 EEPVP      001B27 R   |   6 EE_CCOMM   001F02 R
  6 EE_COMMA   001EE5 R   |   6 EE_CSTOR   001C5C R   |   6 EE_STORE   001CA4 R
  6 EI         0000BF R   |   6 ELSEE      001510 R   |   6 EMIT       00039E R
  6 ENEPER     001A56 R   |   6 EQ1        00078B R   |   6 EQUAL      000775 R
  6 ERASE      000BD7 R   |     ERR     =  00001B     |   6 EVAL       001378 R
  6 EVAL1      001378 R   |   6 EVAL2      001394 R   |   6 EXE1       000B6C R
  6 EXECU      00040E R   |     EXT     =  000000     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |   6 EXTRC      000C31 R   |     FHSE    =  F42400 
    FHSE_K  =  003E80     |     FHSE_M  =  000010     |   6 FILL       000BA4 R
  6 FILL1      000BC1 R   |   6 FILL2      000BCA R   |   6 FIND       001116 R
  6 FIND1      001134 R   |   6 FIND2      001162 R   |   6 FIND3      00116E R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]

Symbol Table

  6 FIND4      001182 R   |   6 FIND5      00118F R   |   6 FIND6      001173 R
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
  6 FMOVE      001FB5 R   |   6 FMOVE2     001FDD R   |   6 FOR        00148D R
  6 FORGET     000158 R   |   6 FORGET1    000187 R   |   6 FORGET2    00020D R
  6 FORGET4    000216 R   |   6 FORGET6    0001CF R   |   6 FREEVAR    000223 R
  6 FREEVAR4   000259 R   |     GPIO_BAS=  005000     |     GPIO_SIZ=  000005 
  6 HERE       000B28 R   |   6 HEX        000CE0 R   |   6 HI         001962 R
  6 HLD        000606 R   |   6 HOLD       000C55 R   |     HSECNT  =  004809 
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
  6 ICOLON     001741 R   |   6 IFETCH     0014AB R   |   6 IFF        0014E8 R
  6 IFMOVE     00207C R   |     IMEDD   =  000080     |   6 IMMED      001753 R
  6 INCH       000392 R   |   6 INC_PTR1   001C09 R   |   6 INITOFS    001709 R
  6 INN        0005B4 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_PU=  000001     |   6 INTE1      001317 R
  6 INTER      0012ED R   |     INT_ADC1=  000016     |     INT_AWU =  000001 
    INT_CLK =  000002     |     INT_EXTI=  000003     |     INT_EXTI=  000004 
    INT_EXTI=  000005     |     INT_EXTI=  000006     |     INT_EXTI=  000007 
    INT_FLAS=  000018     |     INT_I2C =  000013     |     INT_RES1=  000008 
    INT_RES2=  000009     |     INT_RES3=  000011     |     INT_RES4=  000012 
    INT_SPI =  00000A     |     INT_TIM1=  00000C     |     INT_TIM1=  00000B 
    INT_TIM2=  00000E     |     INT_TIM2=  00000D     |     INT_TIM3=  000010 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
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
    INT_VECT=  008058     |   6 INVER      0006EE R   |     IPR0    =  000002 
    IPR1    =  000001     |     IPR2    =  000000     |     IPR3    =  000003 
    IPR_MASK=  000003     |     IRET_COD=  000080     |   6 ISEMI      00169E R
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   6 JSRC       0016F3 R
  6 KEY        000E20 R   |   6 KTAP       001207 R   |   6 KTAP1      00122A R
  6 KTAP2      00122D R   |   6 LAST       000645 R   |   6 LASTN   =  002075 R
  6 LBRAC      001324 R   |     LD1_BIT =  000000     |     LD1_MASK=  000001 
    LD1_PORT=  00500F     |   6 LESS       0007B2 R   |     LF      =  00000A 
  6 LINK    =  002075 R   |   6 LITER      00145F R   |   6 LN2S       001AB2 R
  6 LOG2S      001A9C R   |   6 LSHIFT     0009EC R   |   6 LSHIFT1    0009F5 R
  6 LSHIFT4    0009FD R   |   6 LT1        0007C8 R   |     MASKK   =  001F7F 
  6 MAX        0007D2 R   |   6 MAX1       0007E5 R   |   6 MIN        0007EF R
  6 MIN1       000802 R   |     MISCOPT =  004805     |     MISCOPT_=  000004 
    MISCOPT_=  000002     |     MISCOPT_=  000003     |     MISCOPT_=  000000 
    MISCOPT_=  000001     |   6 MMOD1      0008A5 R   |   6 MMOD2      0008B9 R
  6 MMOD3      0008D0 R   |   6 MMSM1      00084C R   |   6 MMSM2      000860 R
  6 MMSM3      000862 R   |   6 MMSM4      00086A R   |   6 MODD       0008EA R
  6 MONE       000A53 R   |     MS      =  00002E     |   6 MSEC       0002CE R
  6 MSMOD      000888 R   |   6 MSTA1      00097B R   |   6 MSTAR      000958 R
    NAFR    =  004804     |   6 NAMEQ      0011AF R   |   6 NAMET      0010C0 R
    NCLKOPT =  004808     |   6 NEGAT      0006FF R   |   6 NEX1       0003D5 R
  6 NEXT       00149C R   |     NHSECNT =  00480A     |     NMISCOPT=  004806 
    NMISCOPT=  FFFFFFFB     |     NMISCOPT=  FFFFFFFD     |     NMISCOPT=  FFFFFFFC 
    NMISCOPT=  FFFFFFFF     |     NMISCOPT=  FFFFFFFE     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPTBL  =  00487F     |   6 NTIB       0005C4 R
    NUBC    =  004802     |   6 NUFQ       000E36 R   |   6 NUFQ1      000E4F R
  6 NUMBQ      000D4D R   |   6 NUMQ1      000D81 R   |   6 NUMQ2      000DB2 R
  6 NUMQ3      000DF4 R   |   6 NUMQ4      000DF9 R   |   6 NUMQ5      000E08 R
  6 NUMQ6      000E0B R   |   6 NonHandl   000004 R   |   6 OFFSET     00066A R
    OFS     =  000005     |   6 ONE        000A45 R   |   6 ONEM       0009DB R
  6 ONEP       0009CE R   |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPTBL   =  00487E     |     OPTIMIZE=  000001     |     OPTION_B=  004800 
    OPTION_E=  00487F     |   6 ORIG       00004B R   |   6 ORR        000539 R
  6 OUTPUT     0003A3 R   |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |   6 OVER       000503 R
  6 OVERT      00166C R   |     PA      =  000000     |   6 PACKS      000BE8 R
  6 PAD        000B39 R   |   6 PAREN      001073 R   |   6 PARS       000F6C R
  6 PARS1      000F97 R   |   6 PARS2      000FC2 R   |   6 PARS3      000FC5 R
  6 PARS4      000FCE R   |   6 PARS5      000FF1 R   |   6 PARS6      001006 R
  6 PARS7      001015 R   |   6 PARS8      001024 R   |   6 PARSE      001035 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]

Symbol Table

  6 PAUSE      0002DE R   |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      00184A R   |   6 PDUM2      00185B R
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |   6 PICK       000A93 R
  6 PII        001A15 R   |     PIN0    =  000000     |     PIN1    =  000001 
    PIN2    =  000002     |     PIN3    =  000003     |     PIN4    =  000004 
    PIN5    =  000005     |     PIN6    =  000006     |     PIN7    =  000007 
  6 PLUS       0006D4 R   |   6 PNAM1      001621 R   |   6 PRESE      0013A3 R
    PROD1   =  000022     |     PROD2   =  000024     |     PROD3   =  000026 
  6 PROTECTE   0001FF R   |   6 PSTO       001AC8 R   |   6 PSTOR      000AAA R
    PTR16   =  000032     |     PTR8    =  000033     |   6 QBRAN      0003E7 R
  6 QDUP       000683 R   |   6 QDUP1      00068D R   |   6 QKEY       000380 R
  6 QSTAC      00135B R   |   6 QUERY      001287 R   |   6 QUEST      000F5E R
  6 QUIT       0013C0 R   |   6 QUIT1      0013C8 R   |   6 QUIT2      0013CB R
  6 RAM2EE     001F6D R   |     RAMBASE =  000000     |   6 RAMLAST    000658 R
    RAM_BASE=  000000     |     RAM_END =  0007FF     |     RAM_SIZE=  000800 
  6 RANDOM     00027C R   |   6 RAT        000496 R   |   6 RBRAC      0016E0 R
  6 REPEA      001565 R   |   6 RFREE      001F54 R   |   6 RFROM      000483 R
    ROP     =  004800     |   6 ROT        000694 R   |   6 ROW2BUF    001F20 R
    ROWBUFF =  000680     |     RP0     =  00002C     |   6 RPAT       000460 R
    RPP     =  0007FF     |   6 RPSTO      00046D R   |   6 RSHIFT     000A08 R
  6 RSHIFT1    000A11 R   |   6 RSHIFT4    000A19 R   |     RST_SR  =  0050B3 
  6 RT12_2     001A85 R   |   6 SAME1      0010DE R   |   6 SAME2      001107 R
  6 SAMEQ      0010D6 R   |   6 SCOM1      001656 R   |   6 SCOM2      001659 R
  6 SCOMP      001638 R   |   6 SEED       000263 R   |     SEEDX   =  000035 
    SEEDY   =  000037     |   6 SEMIS      00167C R   |   6 SETISP     0000D2 R
  6 SET_RAML   0017C3 R   |     SFR_BASE=  005000     |     SFR_END =  0057FF 
  6 SIGN       000C94 R   |   6 SIGN1      000CA4 R   |   6 SLASH      0008F4 R
  6 SLMOD      0008D8 R   |   6 SNAME      0015EB R   |     SP0     =  00002A 
  6 SPACE      000E58 R   |   6 SPACS      000E67 R   |   6 SPAT       0004B9 R
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SPP     =  000680 
    SPSAVE  =  000001     |   6 SPSTO      0004C6 R   |   6 SQRT10     001A6E R
  6 SQRT2      001A2C R   |   6 SQRT3      001A43 R   |   6 SSMOD      000984 R
    SSP     =  000001     |     STACK   =  0007FF     |   6 STAR       00094D R
  6 STASL      000995 R   |   6 STOD       000736 R   |   6 STORE      00041B R
  6 STR        000CC2 R   |   6 STRCQ      00146D R   |   6 STRQ       0015A4 R
  6 STRQP      000ED5 R   |   6 SUBB       00074D R   |   6 SWAPP      0004E9 R
    SWIM_CSR=  007F80     |   6 TAP        0011F1 R   |   6 TBOOT      00199B R
  6 TBUF       0005D4 R   |     TBUFFBAS=  000680     |   6 TCHAR      000A64 R
  6 TEMP       0005A5 R   |   6 TEVAL      0005F7 R   |   6 TFLASH     0005E6 R
  6 THENN      0014FD R   |   6 TIB        000B4A R   |     TIBB    =  000700 
    TIBBASE =  000700     |     TIC     =  000027     |   6 TICK       0013D7 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
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
    TIM4_SR_=  000000     |   6 TIMEOUTQ   00030E R   |   6 TIMER      0002F8 R
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |   6 TNAM2      0018E0 R
  6 TNAM3      0018FE R   |   6 TNAM4      001904 R   |   6 TNAME      0018DD R
  6 TOFLASH    000333 R   |   6 TOKEN      0010B2 R   |   6 TOR        0004A2 R
  6 TORAM      000373 R   |     TRUEE   =  00FFFF     |   6 TWOSL      000A20 R
  6 TYPE1      000E87 R   |   6 TYPE2      000E93 R   |   6 TYPES      000E82 R
  6 Timer4Ha   000009 R   |   6 TrapHand   000000 R   |     UART2_BR=  005242 
    UART2_BR=  005243     |     UART2_CR=  005244     |     UART2_CR=  005245 
    UART2_CR=  005246     |     UART2_CR=  005247     |     UART2_CR=  005248 
    UART2_CR=  004249     |     UART2_DR=  005241     |     UART2_GT=  00524A 
    UART2_PO=  00500F     |     UART2_PS=  00524B     |     UART2_RX=  000006 
    UART2_SR=  005240     |     UART2_TX=  000005     |     UART_CR1=  000004 
    UART_CR1=  000002     |     UART_CR1=  000000     |     UART_CR1=  000001 
    UART_CR1=  000007     |     UART_CR1=  000006     |     UART_CR1=  000005 
    UART_CR1=  000003     |     UART_CR2=  000004     |     UART_CR2=  000002 
    UART_CR2=  000005     |     UART_CR2=  000001     |     UART_CR2=  000000 
    UART_CR2=  000006     |     UART_CR2=  000003     |     UART_CR2=  000007 
    UART_CR3=  000003     |     UART_CR3=  000001     |     UART_CR3=  000002 
    UART_CR3=  000000     |     UART_CR3=  000006     |     UART_CR3=  000004 
    UART_CR3=  000005     |     UART_CR4=  000000     |     UART_CR4=  000001 
    UART_CR4=  000002     |     UART_CR4=  000003     |     UART_CR4=  000004 
    UART_CR4=  000006     |     UART_CR4=  000005     |     UART_CR5=  000003 
    UART_CR5=  000001     |     UART_CR5=  000002     |     UART_CR5=  000004 
    UART_CR5=  000005     |     UART_SR_=  000001     |     UART_SR_=  000004 
    UART_SR_=  000002     |     UART_SR_=  000003     |     UART_SR_=  000000 
    UART_SR_=  000005     |     UART_SR_=  000006     |     UART_SR_=  000007 
    UBASE   =  000006     |     UBC     =  004801     |     UCNTXT  =  000014 
    UCP     =  000018     |     UCTIB   =  00000C     |     UD1     =  000001 
    UD2     =  000002     |     UD3     =  000003     |     UD4     =  000004 
  6 UDOT       000F28 R   |   6 UDOTR      000F08 R   |   6 UEND       000049 R
    UHLD    =  000012     |     UINN    =  00000A     |     UINTER  =  000010 
    ULAST   =  00001A     |   6 ULES1      0007AA R   |   6 ULESS      000794 R
  6 UMMOD      00082A R   |   6 UMSTA      000903 R   |   6 UNIQ1      0015E2 R
  6 UNIQU      0015C3 R   |   6 UNTIL      0014C5 R   |     UOFFSET =  00001C 
  6 UPDATCP    001B66 R   |   6 UPDATLAS   001B3D R   |   6 UPDATPTR   00203D R
  6 UPDATRUN   001B55 R   |   6 UPDATVP    001B7D R   |   6 UPL1       00057A R
  6 UPLUS      000563 R   |     UPP     =  000006     |     URLAST  =  000020 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]

Symbol Table

    UTFLASH =  00001E     |     UTIB    =  00000E     |     UTMP    =  000008 
  6 UTYP1      00181A R   |   6 UTYP2      001829 R   |   6 UTYPE      001815 R
    UVP     =  000016     |   6 UZERO      00002F R   |   6 VARIA      001790 R
    VAR_BASE=  000080     |     VAR_TOP =  0007BF     |     VER     =  000003 
  6 VPP        000627 R   |     VSIZE   =  000006     |     WANT_DEB=  000000 
    WANT_MAT=  000001     |     WANT_SEE=  000000     |   6 WHILE      00154B R
  6 WITHI      00080F R   |   6 WORDD      00109E R   |   6 WORDS      00193A R
  6 WORS1      001940 R   |   6 WORS2      00195C R   |   6 WR_BYTE    001C20 R
  6 WR_ROW     001D6C R   |   6 WR_WORD    001C3D R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     X4_FLASH=  00BFFF     |     X4_FLASH=  004000 
    X6_FLASH=  00FFFF     |     X6_FLASH=  008000     |   6 XORR       00054E R
    XTEMP   =  000022     |     YTEMP   =  000024     |   6 ZERO       000A3A R
  6 ZL1        00051B R   |   6 ZLESS      000512 R   |   6 app_spac   002100 R
  6 block_er   001CD6 R   |   6 clear_ra   00001D R   |   6 clock_in   000066 R
  6 copy_buf   001D29 R   |   6 copy_buf   001D47 R   |   6 copy_pro   001D47 R
    da      =  000002     |     db      =  000003     |     dc      =  000000 
    dd      =  000001     |   6 erase_fl   001CF2 R   |   6 fmove_do   002026 R
  6 lock       001BF4 R   |   6 main       00001A R   |   6 next_row   001FE6 R
  6 no_move    00202D R   |   6 pristine   001DBC R   |   6 proceed_   001CF5 R
  6 reboot     000325 R   |   6 reset_ve   001E20 R   |   6 row_eras   001CB9 R
  6 row_eras   001D06 R   |   6 row_eras   001D29 R   |   6 set_opti   001D96 R
  6 set_vect   001EB4 R   |   6 uart2_in   000078 R   |   6 unlock     001BD0 R
  6 unlock_e   001B92 R   |   6 unlock_f   001BB1 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   2100   flags    0

