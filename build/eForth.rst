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
                                                .include "inc/config.inc"
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
                                        
                                        
                                        ; constants to select board
                                        ; to assemble for a specific 
                                        ; board or MCU set it to 1 and the other
                                        ; to 0. 
                                 
                                 
                                 
                                        
                                        ; select end of line character
                                 
                                 
                                        
                                        ; set to 1 to include 
                                        ; scaling constants vocabulary
                                        ; see: const_ratio.asm 
                                 
                                        
                                        ; set to 1 to include 
                                        ; constants tables vocabulary 
                                        ; see: ctable.asm 
                                 
                                        
                                        ; how many bytes are reserved 
                                        ; by system at EEPROM base.
                                 
                                        
                                        
                                 
                                        	.include "inc/nucleo_8s208.inc"
                                        	.include "inc/stm8s208.inc"
                                        
                                        XMEM_SIZE=96304 ; size in bytes of EXTENDED MEMORY 
                                        UART_SR=UART1_SR
                                        UART_DR=UART1_DR
                                        .endif
                                        
                                 
                                        	.include "inc/stm8s105.inc"
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
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                         
                                 
                                        	.include "inc/stm8s_disco.inc"
                                        .endif 
                                 
                                 
                                 
                                        .endif 
                                        
                                        	
                                         
                                        
                                        
                                        
                                     12 	.list
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



                                     14 
                                     15 ;===============================================================
                                     16 ;  Adaption to NUCLEO-8S208RB by Picatout
                                     17 ;  Date: 2020-06-07 
                                     18 ;       Suite aux nombreux changement remplacé le numéro de version pour 3.0
                                     19 ;  Date: 2019-10-26
                                     20 ;  Changes to memory map:
                                     21 ;       0x16f0  Data Stack, growing downward
                                     22 ;       0x1700  Terminal input buffer TIB
                                     23 ;       0x17ff  Return Stack, growing downard
                                     24 ;================================================================
                                     25 ;       STM8EF, Version 2.1, 13 July
                                     26 ;               Implemented on STM8S-Discovery Board.
                                     27 ;               Assembled by ST VisualDevelop STVD 
                                     28 ;               Bootup on internal 2 MHz clock
                                     29 ;               Switch to external 16 MHz crystal clock
                                     30 ;
                                     31 ; FORTH Virtual Machine:
                                     32 ; Subroutine threaded model
                                     33 ; SP Return stack pointer
                                     34 ; X Data stack pointer
                                     35 ; A,Y Scratch pad registers
                                     36 ;
                                     37 ; Memory Map:
                                     38 ; 0x0 RAM memory, system variables
                                     39 ; 0x80 Start of user defined words, linked to ROM dictionary
                                     40 ; 0x780 Data stack, growing downward
                                     41 ; 0x790 Terminal input buffer TIB
                                     42 ; 0x7FF Return stack, growing downward
                                     43 ; 0x8000 Interrupt vector table
                                     44 ; 0x8080 FORTH startup code
                                     45 ; 0x80E7 Start of FORTH dictionary in ROM
                                     46 ; 0x9584 End of FORTH dictionary
                                     47 ;
                                     48 ;       2020-04-26 Addapted for NUCLEO-8S208RB by Picatout 
                                     49 ;                  use UART1 instead of UART2 for communication with user.
                                     50 ;                  UART1 is available as ttyACM* device via USB connection.
                                     51 ;                  Use TIMER4 for millisecond interrupt to support MS counter 
                                     52 ;                  and MSEC word that return MS value.
                                     53 ;
                                     54 ;       EF12, Version 2.1, 18apr00cht
                                     55 ;               move to 8000H replacing WHYP.
                                     56 ;               copy interrupt vectors from WHYPFLSH.S19
                                     57 ;               to EF12.S19 before flashing
                                     58 ;               add TICKS1 and DELAY1 for motor stepping
                                     59 ;
                                     60 ;       EF12, 02/18/00, C. H. Ting
                                     61 ;       Adapt 86eForth v2.02 to 68HC12.
                                     62 ;               Use WHYP to seed EF12.ASM
                                     63 ;               Use AS12 native 68HC12 assembler:
                                     64 ;               as12 ef12.asm >ef12.lst
                                     65 ;       EF12A, add ADC code, 02mar00cht
                                     66 ;       EF12B, 01mar00cht
                                     67 ;               stack to 0x78, return stack to 0xf8.
                                     68 ;               add all port definitions
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



                                     69 ;               add PWM registers
                                     70 ;               add SPI registers and code
                                     71 ;       EF12C, 12mar00cht
                                     72 ;               add MAX5250 D/A converter
                                     73 ;       EF12D, 15mar00cht
                                     74 ;               add all the Lexel interface words
                                     75 ;       EF12E, 18apr00cht, save for reference
                                     76 ;
                                     77 ;       Copyright (c) 2000
                                     78 ;       Dr. C. H. Ting
                                     79 ;       156 14th Avenue
                                     80 ;       San Mateo, CA 94402
                                     81 ;       (650) 571-7639
                                     82 ;
                                     83 
                                     84       
                                     85 ;*********************************************************
                                     86 ;	Assembler constants
                                     87 ;*********************************************************
                           000000    88 RAMBASE =	0x0000	   ;ram base
                           000000    89 .if NUCLEO 
                                     90 STACK   =	0x17FF 	;system (return) stack empty 
                                     91 DATSTK  =	0x1680	;data stack  empty
                                     92 TBUFFBASE =     0x1680  ; flash read/write transaction buffer address  
                                     93 TIBBASE =       0X1700  ; transaction input buffer addr.
                           000001    94 .else ; DISCOVERY
                           0007FF    95 STACK   =	0x7FF 	;system (return) stack empty 
                           000680    96 DATSTK  =	0x680	;data stack  empty
                           000680    97 TBUFFBASE =     0x680  ; flash read/write transaction buffer address  
                           000700    98 TIBBASE =       0X700  ; transaction input buffer addr.
                                     99 .endif
                                    100 
                                    101 ;; Memory allocation
                           000006   102 UPP     =     RAMBASE+6          ; systeme variables base address 
                           000680   103 SPP     =     RAMBASE+DATSTK     ; data stack bottom 
                           0007FF   104 RPP     =     RAMBASE+STACK      ;  return stack bottom
                           000680   105 ROWBUFF =     RAMBASE+TBUFFBASE ; flash write buffer 
                           000700   106 TIBB    =     RAMBASE+TIBBASE  ; transaction input buffer
                           000080   107 VAR_BASE =    RAMBASE+0x80  ; user variables start here .
                           0007BF   108 VAR_TOP =     STACK-32*CELLL  ; reserve 32 cells for data stack. 
                                    109 
                                    110 ; user variables constants 
                           000006   111 UBASE = UPP       ; numeric base 
                           000008   112 UTMP = UBASE+2    ; temporary storage
                           00000A   113 UINN = UTMP+2     ; >IN tib pointer 
                           00000C   114 UCTIB = UINN+2    ; tib count 
                           00000E   115 UTIB = UCTIB+2    ; tib address 
                           000010   116 UINTER = UTIB+2   ; interpreter vector 
                           000012   117 UHLD = UINTER+2   ; hold 
                           000014   118 UCNTXT = UHLD+2   ; context, dictionary first link 
                           000016   119 UVP = UCNTXT+2    ; variable pointer 
                           000018   120 UCP = UVP+2      ; code pointer
                           00001A   121 ULAST = UCP+2    ; last dictionary pointer 
                           00001C   122 UOFFSET = ULAST+2 ; distance between CP and VP to adjust jump address at compile time.
                           00001E   123 UTFLASH = UOFFSET+2 ; select where between FLASH and RAM for compilation destination. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                           000020   124 URLAST = UTFLASH+2 ; context for dictionary in RAM memory 
                                    125 
                                    126 ;******  System Variables  ******
                           000022   127 XTEMP	=	URLAST +2;address called by CREATE
                           000024   128 YTEMP	=	XTEMP+2	;address called by CREATE
                           000022   129 PROD1 = XTEMP	;space for UM*
                           000024   130 PROD2 = PROD1+2
                           000026   131 PROD3 = PROD2+2
                           000028   132 CARRY = PROD3+2
                           00002A   133 SP0	= CARRY+2	;initial data stack pointer
                           00002C   134 RP0	= SP0+2		;initial return stack pointer
                           00002E   135 MS    =   RP0+2         ; millisecond counter 
                           000030   136 CNTDWN =  MS+2          ; count down timer 
                           000032   137 FPTR = CNTDWN+2         ; 24 bits farptr 
                           000033   138 PTR16 = FPTR+1          ; middle byte of farptr 
                           000034   139 PTR8 = FPTR+2           ; least byte of farptr 
                           000036   140 SEEDX = PTR8+2          ; PRNG seed X 
                           000038   141 SEEDY = SEEDX+2         ; PRNG seed Y 
                                    142 
                                    143 ; EEPROM persistant data  
                           004000   144 APP_LAST = EEPROM_BASE ; Application last word pointer  
                           004002   145 APP_RUN = APP_LAST+2   ; application autorun address 
                           004004   146 APP_CP = APP_RUN+2   ; free application space pointer 
                           004006   147 APP_VP = APP_CP+2  ; free data space pointer 
                                    148 
                                    149 
                                    150 ;***********************************************
                                    151 ;; Version control
                                    152 
                           000003   153 VER     =     3         ;major release version
                           000000   154 EXT     =     0         ;minor extension
                                    155 
                                    156 ;; Constants
                                    157 
                           00FFFF   158 TRUEE   =     0xFFFF      ;true flag
                                    159 
                           000040   160 COMPO   =     0x40     ;lexicon compile only bit
                           000080   161 IMEDD   =     0x80     ;lexicon immediate bit
                           001F7F   162 MASKK   =     0x1F7F  ;lexicon bit mask
                                    163 
                           000002   164 CELLL   =     2       ;size of a cell
                           00000A   165 BASEE   =     10      ;default radix
                           000008   166 BKSPP   =     8       ;back space
                           00000A   167 LF      =     10      ;line feed
                           00000D   168 CRR     =     13      ;carriage return
                           000011   169 XON     =     17
                           000013   170 XOFF    =     19
                           00001B   171 ERR     =     27      ;error escape
                           000027   172 TIC     =     39      ;tick
                           0000CD   173 CALLL   =     0xCD     ;CALL opcodes
                           000080   174 IRET_CODE =   0x80    ; IRET opcode 
                                    175 
                                    176         .macro _ledon
                                    177         .if NUCLEO
                                    178         bset PC_ODR,#LED2_BIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    179         .else ;DISCOVERY 
                                    180         .if DISCOVERY
                                    181         bres PD_ODR,#LD1_BIT 
                                    182         .endif
                                    183         .endif
                                    184         .endm
                                    185 
                                    186         .macro _ledoff
                                    187         .if NUCLEO 
                                    188         bres PC_ODR,#LED2_BIT
                                    189         .else ;DISCOVERY 
                                    190         .if DISCOVERY
                                    191         bset PD_ODR,#LD1_BIT 
                                    192         .endif 
                                    193         .endif
                                    194         .endm
                                    195 
                                    196 ;**********************************************************
                                    197         .area DATA (ABS)
      000000                        198         .org RAMBASE 
                                    199 ;**********************************************************
                                    200 
                                    201 ;**********************************************************
                                    202         .area SSEG (ABS) ; STACK
      001700                        203         .org 0x1700
      001700                        204         .ds 256 
                                    205 ; space for DATSTK,TIB and STACK         
                                    206 ;**********************************************************
                                    207 
                                    208 ;**********************************************************
                                    209         .area HOME ; vectors table
                                    210 ;**********************************************************
      008000 82 00 80 96            211 	int main	        ; reset
      008004 82 00 80 80            212 	int NonHandledInterrupt	; trap
      008008 82 00 80 80            213 	int NonHandledInterrupt	; irq0
      00800C 82 00 80 80            214 	int NonHandledInterrupt	; irq1
      008010 82 00 80 80            215 	int NonHandledInterrupt	; irq2
      008014 82 00 80 80            216 	int NonHandledInterrupt	; irq3
      008018 82 00 80 80            217 	int NonHandledInterrupt	; irq4
      00801C 82 00 80 80            218 	int NonHandledInterrupt	; irq5
      008020 82 00 80 80            219 	int NonHandledInterrupt	; irq6
      008024 82 00 80 80            220 	int NonHandledInterrupt	; irq7
      008028 82 00 80 80            221 	int NonHandledInterrupt	; irq8
      00802C 82 00 80 80            222 	int NonHandledInterrupt	; irq9
      008030 82 00 80 80            223 	int NonHandledInterrupt	; irq10
      008034 82 00 80 80            224 	int NonHandledInterrupt	; irq11
      008038 82 00 80 80            225 	int NonHandledInterrupt	; irq12
      00803C 82 00 80 80            226 	int NonHandledInterrupt	; irq13
      008040 82 00 80 80            227 	int NonHandledInterrupt	; irq14
      008044 82 00 80 80            228 	int NonHandledInterrupt	; irq15
      008048 82 00 80 80            229 	int NonHandledInterrupt	; irq16
      00804C 82 00 80 80            230 	int NonHandledInterrupt	; irq17
      008050 82 00 80 80            231 	int NonHandledInterrupt	; irq18
      008054 82 00 80 80            232 	int NonHandledInterrupt	; irq19
      008058 82 00 80 80            233 	int NonHandledInterrupt	; irq20
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      00805C 82 00 80 80            234 	int NonHandledInterrupt	; irq21
      008060 82 00 80 80            235 	int NonHandledInterrupt	; irq22
      008064 82 00 80 85            236 	int Timer4Handler	; irq23
      008068 82 00 80 80            237 	int NonHandledInterrupt	; irq24
      00806C 82 00 80 80            238 	int NonHandledInterrupt	; irq25
      008070 82 00 80 80            239 	int NonHandledInterrupt	; irq26
      008074 82 00 80 80            240 	int NonHandledInterrupt	; irq27
      008078 82 00 80 80            241 	int NonHandledInterrupt	; irq28
      00807C 82 00 80 80            242 	int NonHandledInterrupt	; irq29
                                    243 
                                    244 ;**********************************************************
                                    245         .area CODE
                                    246 ;**********************************************************
                                    247 
                                    248 ; non handled interrupt reset MCU
      008080                        249 NonHandledInterrupt:
      008080 A6 80            [ 1]  250         ld a, #0x80
      008082 C7 50 D1         [ 1]  251         ld WWDG_CR,a ; WWDG_CR used to reset mcu
                                    252 	;iret
                                    253 
                                    254 ; used for milliseconds counter 
                                    255 ; MS is 16 bits counter 
      008085                        256 Timer4Handler:
      008085 72 5F 53 42      [ 1]  257 	clr TIM4_SR 
      008089 BE 2E            [ 2]  258         ldw x,MS 
      00808B 5C               [ 1]  259         incw x 
      00808C BF 2E            [ 2]  260         ldw MS,x
      00808E BE 30            [ 2]  261         ldw x,CNTDWN 
      008090 27 03            [ 1]  262         jreq 1$
      008092 5A               [ 2]  263         decw x 
      008093 BF 30            [ 2]  264         ldw CNTDWN,x 
      008095                        265 1$:         
      008095 80               [11]  266         iret 
                                    267 
                                    268 
                                    269 ;; Main entry points and COLD start data
      008096                        270 main:
                                    271 ; clear all RAM
      008096 AE 00 00         [ 2]  272 	ldw X,#RAMBASE
      008099                        273 clear_ram0:
      008099 7F               [ 1]  274 	clr (X)
      00809A 5C               [ 1]  275 	incw X
      00809B A3 07 FF         [ 2]  276 	cpw X,#RAM_END
      00809E 23 F9            [ 2]  277 	jrule clear_ram0
      0080A0 AE 07 FF         [ 2]  278         ldw x,#RPP
      0080A3 94               [ 1]  279         ldw sp,x
                                    280 ; set SEEDX and SEEDY to 1 
      0080A4 3C 37            [ 1]  281         inc SEEDX+1 
      0080A6 3C 39            [ 1]  282         inc SEEDY+1          
      0080A8 CC 80 C7         [ 2]  283 	jp ORIG
                                    284 
                                    285 ; COLD initialize these variables.
      0080AB                        286 UZERO:
      0080AB 00 0A                  287         .word      BASEE   ;BASE
      0080AD 00 00                  288         .word      0       ;tmp
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      0080AF 00 00                  289         .word      0       ;>IN
      0080B1 00 00                  290         .word      0       ;#TIB
      0080B3 07 00                  291         .word      TIBB    ;TIB
      0080B5 94 1E                  292         .word      INTER   ;'EVAL
      0080B7 00 00                  293         .word      0       ;HLD
      0080B9 A4 21                  294         .word      LASTN  ;CNTXT pointer
      0080BB 00 80                  295         .word      VAR_BASE   ;variables free space pointer 
      0080BD A4 80                  296         .word      app_space ; FLASH free space pointer 
      0080BF A4 21                  297         .word      LASTN   ;LAST
      0080C1 00 00                  298         .word      0        ; OFFSET 
      0080C3 00 00                  299         .word      0       ; TFLASH
                                    300 ;       .word      0       ; URLAST   
      0080C5 00 00                  301 UEND:   .word      0
                                    302 
      0080C7                        303 ORIG:   
                                    304 ; initialize SP
      0080C7 AE 07 FF         [ 2]  305         LDW     X,#STACK  ;initialize return stack
      0080CA 94               [ 1]  306         LDW     SP,X
      0080CB BF 2C            [ 2]  307         LDW     RP0,X
      0080CD AE 06 80         [ 2]  308         LDW     X,#DATSTK ;initialize data stack
      0080D0 BF 2A            [ 2]  309         LDW     SP0,X
                           000000   310 .if NUCLEO        
                                    311 ; initialize PC_5 as output to control LED2
                                    312 ; added by Picatout 
                                    313         bset PC_CR1,#LED2_BIT
                                    314         bset PC_CR2,#LED2_BIT
                                    315         bset PC_DDR,#LED2_BIT
                                    316 .endif 
                           000000   317 .if DISCOVERY
                                    318         bset PD_CR1,#LD1_BIT
                                    319         bset PD_CR2,#LD1_BIT
                                    320         bset PD_DDR,#LD1_BIT 
                                    321 .endif
      0080D2                        322         _ledoff
                           000000     1         .if NUCLEO 
                                      2         bres PC_ODR,#LED2_BIT
                           000001     3         .else ;DISCOVERY 
                           000000     4         .if DISCOVERY
                                      5         bset PD_ODR,#LD1_BIT 
                                      6         .endif 
                                      7         .endif
                                    323 ; initialize clock to HSI
                                    324 ; no divisor 16Mhz 
                                    325 ; Added by Picatout 
      000052                        326 clock_init:
      0080D2 72 5F 50 C6      [ 1]  327         clr CLK_CKDIVR
      0080D6 72 12 50 C5      [ 1]  328 	bset CLK_SWCR,#CLK_SWCR_SWEN
                           000001   329 .if NUCLEO|DOORBELL
      0080DA A6 E1            [ 1]  330 	ld a,#CLK_SWR_HSI
                           000000   331 .else ; DISCOVERY as 16Mhz crystal
                                    332 	ld a,#CLK_SWR_HSE
                                    333 .endif 
      0080DC C7 50 C4         [ 1]  334 	ld CLK_SWR,a
      0080DF C1 50 C3         [ 1]  335 1$:	cp a,CLK_CMSR
      0080E2 26 FB            [ 1]  336 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                                    337         
                                    338 ; initialize UART, 115200 8N1
      0080E4                        339 uart_init:
                           000000   340 .if NUCLEO 
                                    341 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1
                                    342 	; configure tx pin
                                    343 	bset PA_DDR,#UART1_TX_PIN ; tx pin
                                    344 	bset PA_CR1,#UART1_TX_PIN ; push-pull output
                                    345 	bset PA_CR2,#UART1_TX_PIN ; fast output
                                    346 	; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    347 	mov UART1_BRR2,#0x0b ; must be loaded first
                                    348 	mov UART1_BRR1,#0x8
                                    349 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                           000001   350 .else ; DISCOVERY use UART2 
      0080E4 72 16 50 C7      [ 1]  351 	bset CLK_PCKENR1,#CLK_PCKENR1_UART2
                                    352 	; configure tx pin
      0080E8 72 1A 50 11      [ 1]  353 	bset PD_DDR,#UART2_TX_PIN ; tx pin
      0080EC 72 1A 50 12      [ 1]  354 	bset PD_CR1,#UART2_TX_PIN ; push-pull output
      0080F0 72 1A 50 13      [ 1]  355 	bset PD_CR2,#UART2_TX_PIN ; fast output
                                    356 	; baud rate 115200 Fmaster=8Mhz  
      0080F4 35 0B 52 43      [ 1]  357 	mov UART2_BRR2,#0x0b ; must be loaded first
      0080F8 35 08 52 42      [ 1]  358 	mov UART2_BRR1,#0x8
      0080FC 35 0C 52 45      [ 1]  359 	mov UART2_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                                    360 .endif
                                    361 ; initialize timer4, used for millisecond interrupt  
      008100 35 07 53 45      [ 1]  362 	mov TIM4_PSCR,#7 ; prescale 128  
      008104 35 7D 53 46      [ 1]  363 	mov TIM4_ARR,#125 ; set for 1msec.
      008108 35 05 53 40      [ 1]  364 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00810C 72 10 53 41      [ 1]  365 	bset TIM4_IER,#TIM4_IER_UIE 
                                    366 ; set TIM4 interrupt priority to highest
      008110 A6 3F            [ 1]  367         ld a,#~(IPR_MASK<<6)
      008112 C4 7F 75         [ 1]  368         and a,ITC_SPR6
      008115 AA C0            [ 1]  369         or a,#(IPR3<<6)
      008117 C7 7F 75         [ 1]  370         ld ITC_SPR6,a 
      00811A 9A               [ 1]  371         rim
      00811B CC 9B 20         [ 2]  372         jp  COLD   ;default=MN1
                                    373 
                                    374 
                                    375 ;; place MCU in sleep mode with
                                    376 ;; halt opcode 
                                    377 ;; BYE ( -- )
      00811E 00 00                  378         .word 0
                           0000A0   379         LINK=.
      008120 03                     380         .byte 3 
      008121 42 59 45               381         .ascii "BYE"
      008124                        382 BYE: 
      008124 8E               [10]  383         halt 
      008125 81               [ 4]  384         ret 
                                    385 
                                    386 ; Enable interrupts 
                                    387 ; EI ( -- )
      008126 81 20                  388         .word LINK 
                           0000A8   389         LINK=.
      008128 02                     390         .byte 2
      008129 45 49                  391         .ascii "EI"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      00812B                        392 EI:
      00812B 9A               [ 1]  393         rim 
      00812C 81               [ 4]  394         ret 
                                    395 
                                    396 ; Disable interrupts
                                    397 ; DI ( -- )
      00812D 81 28                  398         .word LINK 
                           0000AF   399         LINK=.
      00812F 02                     400         .byte 2 
      008130 44 49                  401         .ascii "DI"
      008132                        402 DI:
      008132 9B               [ 1]  403         sim 
      008133 81               [ 4]  404         ret 
                                    405 
                                    406 ; set interrupt priority level 
                                    407 ; SET-ISP ( n1 n2 -- )
                                    408 ; n1 level {1..3}
                                    409 ; n2 vector {0..29}
      008134 81 2F                  410         .word LINK 
                           0000B6   411         LINK=.
      008136 07                     412         .byte 7 
      008137 53 45 54 2D 49 53 50   413         .ascii "SET-ISP"
      00813E                        414 SETISP:
      00813E 90 93            [ 1]  415         ldw y,x 
      008140 90 FE            [ 2]  416         ldw y,(y)
      008142 A6 04            [ 1]  417         ld a,#4 ; 4 slot per register 
                                    418 ;  quotient select register, remainder select slot in register.        
      008144 90 62            [ 2]  419         div y,a ; register=ITC_SPR1[Y], lshift=2*A 
      008146 A4 03            [ 1]  420         and a,#3 
      008148 48               [ 1]  421         sll a ; 2*SLOT  lshift 
      008149 72 A9 7F 70      [ 2]  422         addw y,#ITC_SPR1 
      00814D FF               [ 2]  423         ldw (x),y  ; ( level reg -- )
      00814E 90 5F            [ 1]  424         clrw y 
      008150 90 97            [ 1]  425         ld yl,a 
      008152 1D 00 02         [ 2]  426         subw x,#CELLL 
      008155 FF               [ 2]  427         ldw (x),y  ; ( level reg lshift -- )
      008156 90 93            [ 1]  428         ldw y,x 
      008158 90 EE 02         [ 2]  429         ldw y,(2,y) 
      00815B 90 F6            [ 1]  430         ld a,(y)   ; reg_value
      00815D 1D 00 02         [ 2]  431         subw x,#CELLL 
      008160 FF               [ 2]  432         ldw (x),y ; ( level reg lshift rval -- )
      008161 CD 86 34         [ 4]  433         call OVER ; ( level reg lshift rval lshift -- )
      008164 CD 84 E5         [ 4]  434         call DOLIT 
      008167 00 03                  435         .word 3
      008169 CD 86 1A         [ 4]  436         call SWAPP  ; ( level reg lshift rval 3 lshift )
      00816C CD 8B 1D         [ 4]  437         call LSHIFT ; creat slot mask 
      00816F CD 88 1F         [ 4]  438         call INVER  ; ( level reg lshift rval mask )
      008172 CD 86 56         [ 4]  439         call ANDD ; ( level reg lshift slot_masked )
      008175 CD 85 D3         [ 4]  440         call TOR  ; ( level reg lshift -- R: slot_masked )
      008178 CD 87 C5         [ 4]  441         call ROT  ; ( reg lshift level )
      00817B CD 86 1A         [ 4]  442         call SWAPP ; ( reg level lshift )
      00817E CD 8B 1D         [ 4]  443         call LSHIFT  ; ( reg slot_level -- )
      008181 CD 85 B4         [ 4]  444         call RFROM ; ( reg slot_level masked_val )
      008184 CD 86 6A         [ 4]  445         call ORR   ; ( reg updated_rval )
      008187 CD 86 1A         [ 4]  446         call SWAPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      00818A CD 85 70         [ 4]  447         call CSTOR
                                    448 
                                    449 ; sélectionne l'application 
                                    450 ; qui démarre automatique lors 
                                    451 ; d'un COLD start 
      00818D 81 36                  452         .word LINK 
                           00010F   453         LINK=.
      00818F 07                     454         .byte 7
      008190 41 55 54 4F 52 55 4E   455         .ascii "AUTORUN"
      008197                        456 AUTORUN:
      008197 CD 91 E3         [ 4]  457         call TOKEN 
      00819A CD 86 0A         [ 4]  458         call DUPP 
      00819D CD 85 18         [ 4]  459         call QBRAN 
      0081A0 82 7D                  460         .word FORGET2
      0081A2 CD 92 E0         [ 4]  461         call NAMEQ
      0081A5 CD 87 B4         [ 4]  462         call QDUP 
      0081A8 CD 85 18         [ 4]  463         call QBRAN 
      0081AB 82 7D                  464         .word FORGET2
      0081AD CD 86 00         [ 4]  465         call DROP 
      0081B0 1D 00 04         [ 2]  466         subw x,#2*CELLL 
      0081B3 90 5F            [ 1]  467         clrw y 
      0081B5 FF               [ 2]  468         ldw (x),y 
      0081B6 90 AE 40 02      [ 2]  469         ldw y,#APP_RUN 
      0081BA EF 02            [ 2]  470         ldw (2,x),y 
      0081BC CC 9E 02         [ 2]  471         jp EESTORE 
                                    472 
                                    473 ;; Reset dictionary pointer before 
                                    474 ;; forgotten word. RAM space and 
                                    475 ;; interrupt vector defined after 
                                    476 ;; must be resetted also.
      0081BF 81 8F                  477         .word LINK 
                           000141   478         LINK=.
      0081C1 06                     479         .byte 6
      0081C2 46 4F 52 47 45 54      480         .ascii "FORGET" 
      0081C8                        481 FORGET: 
      0081C8 CD 91 E3         [ 4]  482         call TOKEN
      0081CB CD 86 0A         [ 4]  483         call DUPP 
      0081CE CD 85 18         [ 4]  484         call QBRAN 
      0081D1 82 7D                  485         .word FORGET2
      0081D3 CD 92 E0         [ 4]  486         call NAMEQ ; ( a -- ca na | a F )
      0081D6 CD 87 B4         [ 4]  487         call QDUP 
      0081D9 CD 85 18         [ 4]  488         call QBRAN 
      0081DC 82 7D                  489         .word FORGET2
                                    490 ; only forget users words 
      0081DE CD 86 0A         [ 4]  491         call DUPP ; ( ca na na )
      0081E1 CD 84 E5         [ 4]  492         call DOLIT 
      0081E4 A4 80                  493         .word app_space 
      0081E6 CD 86 1A         [ 4]  494         call SWAPP 
      0081E9 CD 88 C5         [ 4]  495         call  ULESS 
      0081EC CD 85 18         [ 4]  496         call QBRAN 
      0081EF 82 3F                  497         .word FORGET6 
                                    498 ; ( ca na -- )        
                                    499 ;reset ivec with address >= ca
      0081F1 CD 86 1A         [ 4]  500         call SWAPP ; ( na ca -- ) 
      0081F4 CD A0 05         [ 4]  501         call CHKIVEC ; ( na -- ) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    502 ; start at LAST and link back to na 
                                    503 ; if variable found reset VP at that point.
      0081F7                        504 FORGET1:
      0081F7 CD 87 76         [ 4]  505         call LAST 
      0081FA CD 85 63         [ 4]  506         call AT 
      0081FD CD 86 0A         [ 4]  507         call DUPP  ; ( -- na last last )
      008200 CD 82 93         [ 4]  508         call FREEVAR ; ( -- na last )
      008203 CD 86 0A         [ 4]  509         call DUPP 
      008206 CD 84 E5         [ 4]  510         call DOLIT 
      008209 00 02                  511         .word 2 
      00820B CD 88 7E         [ 4]  512         call SUBB ; ( na last -- na last lfa ) link address 
      00820E CD 85 63         [ 4]  513         call AT 
      008211 CD 86 0A         [ 4]  514         call DUPP ; ( -- na last a a )
      008214 CD 87 4A         [ 4]  515         call CNTXT 
      008217 CD 85 4C         [ 4]  516         call STORE
      00821A CD 87 76         [ 4]  517         call LAST  
      00821D CD 85 4C         [ 4]  518         call STORE ; ( --  na last )
      008220 CD 86 34         [ 4]  519         call OVER 
      008223 CD 88 A6         [ 4]  520         call EQUAL ; ( na last na -- na T|F ) 
      008226 CD 85 18         [ 4]  521         call QBRAN 
      008229 81 F7                  522         .word FORGET1 
                                    523 ; ( na -- )
      00822B CD 84 E5         [ 4]  524         call DOLIT 
      00822E 00 02                  525         .word 2 
      008230 CD 88 7E         [ 4]  526         call SUBB 
      008233 CD 87 66         [ 4]  527         call CPP 
      008236 CD 85 4C         [ 4]  528         call STORE  
      008239 CD 9C 4C         [ 4]  529         call UPDATCP 
      00823C CC 9C 23         [ 2]  530         jp UPDATLAST 
      00823F                        531 FORGET6: ; tried to forget a RAM or system word 
                                    532 ; ( ca na -- )
      00823F 1D 00 02         [ 2]  533         subw x,#CELLL 
      008242 90 BE 2A         [ 2]  534         ldw y,SP0 
      008245 FF               [ 2]  535         ldw (x),y  
      008246 CD 88 C5         [ 4]  536         call ULESS
      008249 CD 85 18         [ 4]  537         call QBRAN 
      00824C 82 6F                  538         .word PROTECTED 
      00824E CD 93 EC         [ 4]  539         call ABORQ 
      008251 1D                     540         .byte 29
      008252 20 46 6F 72 20 52 41   541         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      00826F                        542 PROTECTED:
      00826F CD 93 EC         [ 4]  543         call ABORQ
      008272 0A                     544         .byte 10
      008273 20 50 72 6F 74 65 63   545         .ascii " Protected"
             74 65 64
      00827D                        546 FORGET2: ; no name or not found in dictionary 
      00827D CD 93 EC         [ 4]  547         call ABORQ
      008280 05                     548         .byte 5
      008281 20 77 68 61 74         549         .ascii " what"
      008286                        550 FORGET4:
      008286 CC 86 00         [ 2]  551         jp DROP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    552 
                                    553 
                                    554 ;---------------------------------
                                    555 ; if na is variable 
                                    556 ; free variable data  
                                    557 ; FREEVAR ( na -- )
                                    558 ;---------------------------------
      008289 81 C1                  559         .word LINK 
                           00020B   560         LINK=.
      00828B 07                     561         .byte 7 
      00828C 46 52 45 45 56 41 52   562         .ascii "FREEVAR"
      008293                        563 FREEVAR:
      008293 CD 86 0A         [ 4]  564         call DUPP ; ( na na -- )
      008296 CD 85 81         [ 4]  565         CALL CAT  ; ( na c -- )
      008299 CD 8A FF         [ 4]  566         call ONEP ;
      00829C CD 88 05         [ 4]  567         CALL PLUS ; ( na c+1 -- ca ) 
      00829F CD 8A FF         [ 4]  568         call ONEP ; ( ca+ -- ) to get routne address 
      0082A2 CD 86 0A         [ 4]  569         call DUPP ; ( ca+ ca+ -- )
      0082A5 CD 85 63         [ 4]  570         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082A8 CD 84 E5         [ 4]  571         call DOLIT 
      0082AB 86 B7                  572         .word DOVAR ; if routine address is DOVAR then variable 
      0082AD CD 88 A6         [ 4]  573         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082B0 CD 85 18         [ 4]  574         call QBRAN 
      0082B3 82 C9                  575         .word FREEVAR4 
      0082B5 CD 84 E5         [ 4]  576         call DOLIT 
      0082B8 00 02                  577         .word 2 
      0082BA CD 88 05         [ 4]  578         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082BD CD 85 63         [ 4]  579         call AT 
      0082C0 CD 87 58         [ 4]  580         call VPP   
      0082C3 CD 85 4C         [ 4]  581         call STORE 
      0082C6 CC 9C 63         [ 2]  582         jp UPDATVP 
      0082C9                        583 FREEVAR4: ; not variable
      0082C9 CC 86 00         [ 2]  584         jp  DROP 
                                    585 
                                    586 ;    SEED ( n -- )
                                    587 ; Initialize PRNG seed with n 
      0082CC 82 8B                  588         .word LINK 
                           00024E   589         LINK=. 
      0082CE 04                     590         .byte 4 
      0082CF 53 45 45 44            591         .ascii "SEED" 
      0082D3                        592 SEED:
      0082D3 90 93            [ 1]  593         ldw y,x 
      0082D5 1C 00 02         [ 2]  594         addw x,#CELLL
      0082D8 90 FE            [ 2]  595         ldw y,(y)
      0082DA 90 9E            [ 1]  596         ld a,yh 
      0082DC B7 36            [ 1]  597         ld SEEDX,a 
      0082DE 90 9F            [ 1]  598         ld a,yl 
      0082E0 B7 38            [ 1]  599         ld SEEDY,a 
      0082E2 81               [ 4]  600         ret 
                                    601 
                                    602 ;    RANDOM ( u1 -- u2 )
                                    603 ; Pseudo random number betwen 0 and u1-1
      0082E3 82 CE                  604         .word LINK 
                           000265   605         LINK=.
      0082E5 06                     606         .byte 6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      0082E6 52 41 4E 44 4F 4D      607         .ascii "RANDOM" 
      0082EC                        608 RANDOM:
                                    609 ;local variable 
                           000001   610         SPSAVE=1
                           000002   611         VSIZE=2 
      0082EC 52 02            [ 2]  612         sub sp,#VSIZE
      0082EE 1F 01            [ 2]  613         ldw (SPSAVE,sp),x  
                                    614 ; XTEMP=(SEEDX<<5)^SEEDX 
      0082F0 90 93            [ 1]  615         ldw y,x 
      0082F2 90 FE            [ 2]  616         ldw y,(y)
      0082F4 90 BF 24         [ 2]  617         ldw YTEMP,y 
      0082F7 BE 36            [ 2]  618 	ldw x,SEEDX 
      0082F9 58               [ 2]  619 	sllw x 
      0082FA 58               [ 2]  620 	sllw x 
      0082FB 58               [ 2]  621 	sllw x 
      0082FC 58               [ 2]  622 	sllw x 
      0082FD 58               [ 2]  623 	sllw x 
      0082FE 9E               [ 1]  624 	ld a,xh 
      0082FF B8 36            [ 1]  625 	xor a,SEEDX 
      008301 B7 22            [ 1]  626 	ld XTEMP,a 
      008303 9F               [ 1]  627 	ld a,xl 
      008304 B8 37            [ 1]  628 	xor a,SEEDX+1 
      008306 B7 23            [ 1]  629 	ld XTEMP+1,a 
                                    630 ; SEEDX=SEEDY 
      008308 BE 38            [ 2]  631 	ldw x,SEEDY 
      00830A BF 36            [ 2]  632 	ldw SEEDX,x  
                                    633 ; SEEDY=SEEDY^(SEEDY>>1)
      00830C 54               [ 2]  634 	srlw x 
      00830D 9E               [ 1]  635 	ld a,xh 
      00830E B8 38            [ 1]  636 	xor a,SEEDY 
      008310 B7 38            [ 1]  637 	ld SEEDY,a  
      008312 9F               [ 1]  638 	ld a,xl 
      008313 B8 39            [ 1]  639 	xor a,SEEDY+1 
      008315 B7 39            [ 1]  640 	ld SEEDY+1,a 
                                    641 ; XTEMP>>3 
      008317 BE 22            [ 2]  642 	ldw x,XTEMP 
      008319 54               [ 2]  643 	srlw x 
      00831A 54               [ 2]  644 	srlw x 
      00831B 54               [ 2]  645 	srlw x 
                                    646 ; x=XTEMP^x 
      00831C 9E               [ 1]  647 	ld a,xh 
      00831D B8 22            [ 1]  648 	xor a,XTEMP 
      00831F 95               [ 1]  649 	ld xh,a 
      008320 9F               [ 1]  650 	ld a,xl 
      008321 B8 23            [ 1]  651 	xor a,XTEMP+1  
      008323 97               [ 1]  652 	ld xl,a 
                                    653 ; SEEDY=x^SEEDY 
      008324 B8 39            [ 1]  654 	xor a,SEEDY+1
      008326 97               [ 1]  655 	ld xl,a 
      008327 9E               [ 1]  656 	ld a,xh 
      008328 B8 38            [ 1]  657 	xor a,SEEDY
      00832A 95               [ 1]  658 	ld xh,a 
      00832B BF 38            [ 2]  659 	ldw SEEDY,x 
                                    660 ; return SEEDY modulo YTEMP  
      00832D 90 BE 24         [ 2]  661 	ldw y,YTEMP  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008330 65               [ 2]  662 	divw x,y 
      008331 1E 01            [ 2]  663 	ldw x,(SPSAVE,sp)
      008333 FF               [ 2]  664         ldw (x),y 
      008334 5B 02            [ 2]  665         addw sp,#VSIZE 
      008336 81               [ 4]  666 	ret 
                                    667 
                                    668 
                                    669 ;;
                                    670 ;; get millisecond counter 
                                    671 ;; msec ( -- u )
                                    672 ;; Added by Picatout 2020-04-26
      008337 82 E5                  673         .word LINK  
                           0002B9   674         LINK = . 
      008339 04                     675         .byte 4
      00833A 4D 53 45 43            676         .ascii "MSEC"
      00833E                        677 MSEC: 
      00833E 1D 00 02         [ 2]  678         subw x,#CELLL 
      008341 90 BE 2E         [ 2]  679         ldw y,MS 
      008344 FF               [ 2]  680         ldw (x),y 
      008345 81               [ 4]  681         ret 
                                    682 
                                    683 ; suspend execution for u msec 
                                    684 ;  pause ( u -- )
      008346 83 39                  685         .word LINK 
                           0002C8   686         LINK=.
      008348 05                     687         .byte 5 
      008349 50 41 55 53 45         688         .ascii "PAUSE"
      00834E                        689 PAUSE:
      00834E 90 93            [ 1]  690         ldw y,x
      008350 90 FE            [ 2]  691         ldw y,(y)
      008352 72 B9 00 2E      [ 2]  692         addw y,MS 
      008356 8F               [10]  693 1$:     wfi  
      008357 90 B3 2E         [ 2]  694         cpw y,MS  
      00835A 26 FA            [ 1]  695         jrne 1$        
      00835C 1C 00 02         [ 2]  696         addw x,#CELLL 
      00835F 81               [ 4]  697         ret 
                                    698 
                                    699 ; initialize count down timer 
                                    700 ;  TIMER ( u -- )  milliseconds 
      008360 83 48                  701         .word LINK 
                           0002E2   702         LINK=.
      008362 05                     703         .byte 5 
      008363 54 49 4D 45 52         704         .ascii "TIMER" 
      008368                        705 TIMER:
      008368 90 93            [ 1]  706         ldw y,x
      00836A 90 FE            [ 2]  707         ldw y,(y) 
      00836C 90 BF 30         [ 2]  708         ldw CNTDWN,y
      00836F 1C 00 02         [ 2]  709         addw x,#CELLL 
      008372 81               [ 4]  710         ret 
                                    711 
                                    712 ; check for TIMER exiparition 
                                    713 ;  TIMEOUT? ( -- 0|-1 )
      008373 83 62                  714         .word LINK 
                           0002F5   715         LINK=. 
      008375 08                     716         .byte 8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      008376 54 49 4D 45 4F 55 54   717         .ascii "TIMEOUT?"
             3F
      00837E                        718 TIMEOUTQ: 
      00837E 4F               [ 1]  719         clr a
      00837F 1D 00 02         [ 2]  720         subw x,#CELLL 
      008382 90 BE 30         [ 2]  721         ldw y,CNTDWN 
      008385 26 01            [ 1]  722         jrne 1$ 
      008387 43               [ 1]  723         cpl a 
      008388 E7 01            [ 1]  724 1$:     ld (1,x),a 
      00838A F7               [ 1]  725         ld (x),a 
      00838B 81               [ 4]  726         ret         
                                    727 
                                    728 ; reboot MCU 
                                    729 ; REBOOT ( -- )
      00838C 83 75                  730         .word LINK 
                           00030E   731         LINK=. 
      00838E 06                     732         .byte 6 
      00838F 52 45 42 4F 4F 54      733         .ascii "REBOOT"
      008395                        734 reboot:
      008395 CC 80 80         [ 2]  735         jp NonHandledInterrupt
                                    736 
                                    737 ; compile to flash memory 
                                    738 ; TO-FLASH ( -- )
      008398 83 8E                  739         .word LINK 
                           00031A   740         LINK=.
      00839A 08                     741         .byte 8
      00839B 54 4F 2D 46 4C 41 53   742         .ascii "TO-FLASH"
             48
      0083A3                        743 TOFLASH:
      0083A3 CD 87 89         [ 4]  744         call RAMLAST 
      0083A6 CD 85 63         [ 4]  745         call AT 
      0083A9 CD 87 B4         [ 4]  746         call QDUP 
      0083AC CD 85 18         [ 4]  747         call QBRAN
      0083AF 83 D2                  748         .word 1$
      0083B1 CD 93 EC         [ 4]  749         call ABORQ 
      0083B4 1D                     750         .byte 29
      0083B5 20 4E 6F 74 20 77 68   751         .ascii " Not while definitions in RAM"   
             69 6C 65 20 64 65 66
             69 6E 69 74 69 6F 6E
             73 20 69 6E 20 52 41
             4D
      0083D2 90 AE FF FF      [ 2]  752 1$:     ldw y,#-1 
      0083D6 90 BF 1E         [ 2]  753         ldw UTFLASH,y
      0083D9 81               [ 4]  754         ret 
                                    755 
                                    756 ; compile to RAM 
                                    757 ; TO-RAM ( -- )
      0083DA 83 9A                  758         .word LINK 
                           00035C   759         LINK=.
      0083DC 06                     760         .byte 6 
      0083DD 54 4F 2D 52 41 4D      761         .ascii "TO-RAM"
      0083E3                        762 TORAM:
      0083E3 90 5F            [ 1]  763         clrw y 
      0083E5 90 BF 1E         [ 2]  764         ldw UTFLASH,y 
      0083E8 81               [ 4]  765         ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    766 
                                    767 ;; BAUD RATE constants table
                                    768 ; values to put in BRR1 & BRR2 
      0083E9                        769 baudrate: 
      0083E9 A0 1B                  770 	.byte 0xa0,0x1b ; 2400
      0083EB D0 05                  771 	.byte 0xd0,0x5  ; 4800 
      0083ED 68 03                  772 	.byte 0x68,0x3  ; 9600
      0083EF 34 01                  773 	.byte 0x34,0x1  ; 19200
      0083F1 11 06                  774 	.byte 0x11,0x6  ; 57600
      0083F3 08 0B                  775 	.byte 0x8,0xb   ; 115200
                                    776 
                                    777 ; BAUD RATE CONSTANTS names 
                                    778 ; 2400 baud
      0083F5 83 DC                  779 	.word LINK
                           000377   780 LINK	= .
      0083F7 04                     781 	.byte 4
      0083F8 42 32 4B 34            782 	.ascii "B2K4" 
      0083FC                        783 B2K4:
      0083FC 1D 00 02         [ 2]  784 	subw x,#CELLL 
      0083FF 90 5F            [ 1]  785         clrw y
      008401 FF               [ 2]  786         ldw (x),y
      008402 81               [ 4]  787 	ret
                                    788 ; 4800 baud	
      008403 83 F7                  789 	.word LINK
                           000385   790 LINK	= .
      008405 04                     791 	.byte 4
      008406 42 34 4B 38            792 	.ascii "B4K8" 
      00840A                        793 B4K8:
      00840A 1D 00 02         [ 2]  794         subw x,#CELLL 
      00840D 90 AE 00 02      [ 2]  795         ldw y,#2 
      008411 FF               [ 2]  796         ldw (x),y
      008412 81               [ 4]  797         ret 
                                    798 ; 9600 baud
      008413 84 05                  799 	.word LINK
                           000395   800 LINK	= .
      008415 04                     801 	.byte 4
      008416 42 39 4B 36            802 	.ascii "B9K6" 
      00841A                        803 B9K6:
      00841A 1D 00 02         [ 2]  804         subw x,#CELLL 
      00841D 90 AE 00 04      [ 2]  805         ldw y,#4 
      008421 FF               [ 2]  806         ldw (x),y 
      008422 81               [ 4]  807         ret 
                                    808 ; 19200 baud
      008423 84 15                  809 	.word LINK
                           0003A5   810 LINK	= .
      008425 05                     811 	.byte 5
      008426 42 31 39 4B 32         812 	.ascii "B19K2" 
      00842B                        813 B19K2:
      00842B 1D 00 02         [ 2]  814         subw x,#CELLL
      00842E 90 AE 00 06      [ 2]  815         ldw y,#6 
      008432 FF               [ 2]  816         ldw (x),y 
      008433 81               [ 4]  817         ret 
                                    818 ; 57600 baud        
      008434 84 25                  819 	.word LINK
                           0003B6   820 LINK	= .
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      008436 05                     821 	.byte 5
      008437 42 35 37 4B 36         822 	.ascii "B57K6" 
      00843C                        823 B57K6:
      00843C 1D 00 02         [ 2]  824         subw x,#CELLL 
      00843F 90 AE 00 08      [ 2]  825         ldw y,#8 
      008443 FF               [ 2]  826         ldw (x),y 
      008444 81               [ 4]  827         ret 
                                    828 ; 115200 baud 
      008445 84 36                  829 	.word LINK
                           0003C7   830 LINK	= .
      008447 06                     831 	.byte 6
      008448 42 31 31 35 4B 32      832 	.ascii "B115K2" 
      00844E                        833 B115K2:
      00844E 1D 00 02         [ 2]  834 	subw x,#CELLL 
      008451 90 AE 00 0A      [ 2]  835         ldw y,#10 
      008455 FF               [ 2]  836         ldw (x),y 
      008456 81               [ 4]  837         ret 
                                    838 	
                                    839        
                                    840 ;; set UART2 BAUD rate
                                    841 ;	BAUD ( u -- )
      008457 84 47                  842 	.word LINK 
                           0003D9   843 LINK	= .
      008459 04                     844 	.byte 4
      00845A 42 41 55 44            845 	.ascii "BAUD" 
      00845E                        846 BAUD:
      00845E 1D 00 02         [ 2]  847 	subw x,#CELLL
      008461 90 AE 83 E9      [ 2]  848         ldw y,#baudrate 
      008465 FF               [ 2]  849         ldw (x),y 
      008466 CD 88 05         [ 4]  850         call PLUS
      008469 90 93            [ 1]  851         ldw y,x  
      00846B 90 FE            [ 2]  852         ldw y,(y)
      00846D 90 F6            [ 1]  853         ld a,(y)
      00846F 88               [ 1]  854         push a 
      008470 90 5C            [ 1]  855         incw y 
      008472 90 F6            [ 1]  856         ld a,(y)
      008474 C7 52 43         [ 1]  857         ld UART2_BRR2,a 
      008477 84               [ 1]  858         pop a
      008478 C7 52 42         [ 1]  859         ld UART2_BRR1,a 
      00847B 1C 00 02         [ 2]  860         addw x,#CELLL 
      00847E 81               [ 4]  861         ret 
                                    862 
                                    863 ;; Device dependent I/O
                                    864 ;       ?RX     ( -- c T | F )
                                    865 ;         Return input byte and true, or false.
      00847F 84 59                  866         .word      LINK 
                           000401   867 LINK	= .
      008481 04                     868         .byte      4
      008482 3F 4B 45 59            869         .ascii     "?KEY"
      008486                        870 QKEY:
      008486 90 5F            [ 1]  871         CLRW Y 
      008488 72 0B 52 40 0B   [ 2]  872         BTJF UART_SR,#UART_SR_RXNE,INCH   ;check status
      00848D C6 52 41         [ 1]  873         LD    A,UART_DR   ;get char in A
      008490 1D 00 02         [ 2]  874 	SUBW	X,#2
      008493 E7 01            [ 1]  875         LD     (1,X),A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      008495 7F               [ 1]  876 	CLR	(X)
      008496 90 53            [ 2]  877         CPLW     Y
      008498                        878 INCH:
      008498 1D 00 02         [ 2]  879 		SUBW	X,#2
      00849B FF               [ 2]  880         LDW     (X),Y
      00849C 81               [ 4]  881         RET
                                    882 
                                    883 ;       TX!     ( c -- )
                                    884 ;       Send character c to  output device.
      00849D 84 81                  885         .word      LINK
                           00041F   886 LINK	= .
      00849F 04                     887         .byte      4
      0084A0 45 4D 49 54            888         .ascii     "EMIT"
      0084A4                        889 EMIT:
      0084A4 E6 01            [ 1]  890         LD     A,(1,X)
      0084A6 1C 00 02         [ 2]  891 	ADDW	X,#2
      0084A9 72 0F 52 40 FB   [ 2]  892 OUTPUT: BTJF UART_SR,#UART_SR_TXE,OUTPUT  ;loop until tx empty 
      0084AE C7 52 41         [ 1]  893         LD    UART_DR,A   ;send A
      0084B1 81               [ 4]  894         RET
                                    895 
                                    896 ;       FC-XON  ( -- )
                                    897 ;       send XON character 
      0084B2 84 9F                  898         .word LINK
                           000434   899 LINK    = .
      0084B4 06                     900         .byte 6 
      0084B5 46 43 2D 58 4F 4E      901         .ascii "FC-XON"
      0084BB                        902 FC_XON:
      0084BB 1D 00 02         [ 2]  903         subw x,#CELLL 
      0084BE 7F               [ 1]  904         clr (x)
      0084BF A6 11            [ 1]  905         ld a,#XON 
      0084C1 E7 01            [ 1]  906         ld (1,x),a 
      0084C3 CD 84 A4         [ 4]  907         call EMIT 
      0084C6 81               [ 4]  908         ret 
                                    909 
                                    910 ;       FC-XOFF ( -- )
                                    911 ;       Send XOFF character 
      0084C7 84 B4                  912         .word LINK
                           000449   913 LINK    = .
      0084C9 07                     914         .byte 7
      0084CA 46 43 2D 58 4F 46 46   915         .ascii "FC-XOFF"
      0084D1                        916 FC_XOFF:
      0084D1 1D 00 02         [ 2]  917         subw x,#CELLL 
      0084D4 7F               [ 1]  918         clr (x)
      0084D5 A6 13            [ 1]  919         ld a,#XOFF 
      0084D7 E7 01            [ 1]  920         ld (1,x),a 
      0084D9 CD 84 A4         [ 4]  921         call EMIT 
      0084DC 81               [ 4]  922         ret
                                    923 
                                    924 ;; The kernel
                                    925 
                                    926 ;       doLIT   ( -- w )
                                    927 ;       Push an inline literal.
      0084DD 84 C9                  928         .word      LINK
                           00045F   929 LINK	= 	.
      0084DF 45                     930 	.byte      COMPO+5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0084E0 44 4F 4C 49 54         931         .ascii     "DOLIT"
      0084E5                        932 DOLIT:
      0084E5 1D 00 02         [ 2]  933 	SUBW X,#2
      0084E8 16 01            [ 2]  934         ldw y,(1,sp)
      0084EA 90 FE            [ 2]  935         ldw y,(y)
      0084EC FF               [ 2]  936         ldw (x),y
      0084ED 90 85            [ 2]  937         popw y 
      0084EF 90 EC 02         [ 2]  938         jp (2,y)
                                    939 
                                    940 ;       next    ( -- )
                                    941 ;       Code for  single index loop.
      0084F2 84 DF                  942         .word      LINK
                           000474   943 LINK	= 	.
      0084F4 44                     944 	.byte      COMPO+4
      0084F5 6E 65 78 74            945         .ascii     "next"
      0084F9                        946 DONXT:
      0084F9 16 03            [ 2]  947 	LDW Y,(3,SP)
      0084FB 90 5A            [ 2]  948 	DECW Y
      0084FD 2A 07            [ 1]  949 	JRPL NEX1 ; jump if N=0
      0084FF 90 85            [ 2]  950 	POPW Y
      008501 5B 02            [ 2]  951         addw sp,#2
      008503 90 EC 02         [ 2]  952         JP (2,Y)
      008506                        953 NEX1:
      008506 17 03            [ 2]  954         LDW (3,SP),Y
      008508 90 85            [ 2]  955         POPW Y
      00850A 90 FE            [ 2]  956 	LDW Y,(Y)
      00850C 90 FC            [ 2]  957 	JP (Y)
                                    958 
                                    959 ;       ?branch ( f -- )
                                    960 ;       Branch if flag is zero.
      00850E 84 F4                  961         .word      LINK
                           000490   962 LINK	= 	.
      008510 47                     963 	.byte      COMPO+7
      008511 3F 42 52 41 4E 43 48   964         .ascii     "?BRANCH"
      008518                        965 QBRAN:	
      008518 90 93            [ 1]  966         LDW Y,X
      00851A 1C 00 02         [ 2]  967 	ADDW X,#2
      00851D 90 FE            [ 2]  968 	LDW Y,(Y)
      00851F 27 0E            [ 1]  969         JREQ     BRAN
      008521 90 85            [ 2]  970 	POPW Y
      008523 90 EC 02         [ 2]  971 	JP (2,Y)
                                    972         
                                    973 ;       branch  ( -- )
                                    974 ;       Branch to an inline address.
      008526 85 10                  975         .word      LINK
                           0004A8   976 LINK	= 	.
      008528 46                     977 	.byte      COMPO+6
      008529 42 52 41 4E 43 48      978         .ascii     "BRANCH"
      00852F                        979 BRAN:
      00852F 90 85            [ 2]  980         POPW Y
      008531 90 FE            [ 2]  981 	LDW Y,(Y)
      008533 90 FC            [ 2]  982         JP     (Y)
                                    983 
                                    984 ;       EXECUTE ( ca -- )
                                    985 ;       Execute  word at ca.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008535 85 28                  986         .word      LINK
                           0004B7   987 LINK	= 	.
      008537 07                     988         .byte       7
      008538 45 58 45 43 55 54 45   989         .ascii     "EXECUTE"
      00853F                        990 EXECU:
      00853F 90 93            [ 1]  991         LDW Y,X
      008541 1C 00 02         [ 2]  992 	ADDW X,#2
      008544 90 FE            [ 2]  993 	LDW  Y,(Y)
      008546 90 FC            [ 2]  994         JP   (Y)
                                    995 
                           000001   996 OPTIMIZE = 1
                           000001   997 .if OPTIMIZE 
                                    998 ; remplacement de CALL EXIT par 
                                    999 ; le opcode de RET.
                                   1000 ; Voir modification au code de ";"
                           000000  1001 .else 
                                   1002 ;       EXIT    ( -- )
                                   1003 ;       Terminate a colon definition.
                                   1004         .word      LINK
                                   1005 LINK = .
                                   1006         .byte      4
                                   1007         .ascii     "EXIT"
                                   1008 EXIT:
                                   1009         POPW Y
                                   1010         RET
                                   1011 .endif 
                                   1012 
                                   1013 ;       !       ( w a -- )
                                   1014 ;       Pop  data stack to memory.
      008548 85 37                 1015         .word      LINK
                           0004CA  1016 LINK = .
      00854A 01                    1017         .byte      1
      00854B 21                    1018         .ascii     "!"
      00854C                       1019 STORE:
      00854C 90 93            [ 1] 1020         LDW Y,X
      00854E 90 FE            [ 2] 1021         LDW Y,(Y)    ;Y=a
      008550 90 BF 24         [ 2] 1022         LDW YTEMP,Y
      008553 90 93            [ 1] 1023         LDW Y,X
      008555 90 EE 02         [ 2] 1024         LDW Y,(2,Y)
      008558 91 CF 24         [ 5] 1025         LDW [YTEMP],Y ;store w at a
      00855B 1C 00 04         [ 2] 1026         ADDW X,#4 ; DDROP 
      00855E 81               [ 4] 1027         RET     
                                   1028 
                                   1029 ;       @       ( a -- w )
                                   1030 ;       Push memory location to stack.
      00855F 85 4A                 1031         .word      LINK
                           0004E1  1032 LINK	= 	.
      008561 01                    1033         .byte    1
      008562 40                    1034         .ascii	"@"
      008563                       1035 AT:
      008563 90 93            [ 1] 1036         LDW Y,X     ;Y = a
      008565 90 FE            [ 2] 1037         LDW Y,(Y)   ; address 
      008567 90 FE            [ 2] 1038         LDW Y,(Y)   ; value 
      008569 FF               [ 2] 1039         LDW (X),Y ;w = @Y
      00856A 81               [ 4] 1040         RET     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                   1041 
                                   1042 ;       C!      ( c b -- )
                                   1043 ;       Pop  data stack to byte memory.
      00856B 85 61                 1044         .word      LINK
                           0004ED  1045 LINK	= .
      00856D 02                    1046         .byte      2
      00856E 43 21                 1047         .ascii     "C!"
      008570                       1048 CSTOR:
      008570 90 93            [ 1] 1049         LDW Y,X
      008572 90 FE            [ 2] 1050 	LDW Y,(Y)    ;Y=b
      008574 E6 03            [ 1] 1051         LD A,(3,X)    ;D = c
      008576 90 F7            [ 1] 1052         LD  (Y),A     ;store c at b
      008578 1C 00 04         [ 2] 1053 	ADDW X,#4 ; DDROP 
      00857B 81               [ 4] 1054         RET     
                                   1055 
                                   1056 ;       C@      ( b -- c )
                                   1057 ;       Push byte in memory to  stack.
      00857C 85 6D                 1058         .word      LINK
                           0004FE  1059 LINK	= 	.
      00857E 02                    1060         .byte      2
      00857F 43 40                 1061         .ascii     "C@"
      008581                       1062 CAT:
      008581 90 93            [ 1] 1063         LDW Y,X     ;Y=b
      008583 90 FE            [ 2] 1064         LDW Y,(Y)
      008585 90 F6            [ 1] 1065         LD A,(Y)
      008587 E7 01            [ 1] 1066         LD (1,X),A
      008589 7F               [ 1] 1067         CLR (X)
      00858A 81               [ 4] 1068         RET     
                                   1069 
                                   1070 ;       RP@     ( -- a )
                                   1071 ;       Push current RP to data stack.
      00858B 85 7E                 1072         .word      LINK
                           00050D  1073 LINK	= .
      00858D 03                    1074         .byte      3
      00858E 52 50 40              1075         .ascii     "RP@"
      008591                       1076 RPAT:
      008591 90 96            [ 1] 1077         LDW Y,SP    ;save return addr
      008593 1D 00 02         [ 2] 1078         SUBW X,#2
      008596 FF               [ 2] 1079         LDW (X),Y
      008597 81               [ 4] 1080         RET     
                                   1081 
                                   1082 ;       RP!     ( a -- )
                                   1083 ;       Set  return stack pointer.
      008598 85 8D                 1084         .word      LINK
                           00051A  1085 LINK	= 	. 
      00859A 43                    1086 	.byte      COMPO+3
      00859B 52 50 21              1087         .ascii     "RP!"
      00859E                       1088 RPSTO:
      00859E 90 85            [ 2] 1089         POPW Y
      0085A0 90 BF 24         [ 2] 1090         LDW YTEMP,Y
      0085A3 90 93            [ 1] 1091         LDW Y,X
      0085A5 90 FE            [ 2] 1092         LDW Y,(Y)
      0085A7 90 94            [ 1] 1093         LDW SP,Y
      0085A9 1C 00 02         [ 2] 1094         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      0085AC 92 CC 24         [ 5] 1095         JP [YTEMP]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                   1096 
                                   1097 ;       R>      ( -- w )
                                   1098 ;       Pop return stack to data stack.
      0085AF 85 9A                 1099         .word      LINK
                           000531  1100 LINK	= 	. 
      0085B1 42                    1101 	.byte      COMPO+2
      0085B2 52 3E                 1102         .ascii     "R>"
      0085B4                       1103 RFROM:
      0085B4 90 85            [ 2] 1104         POPW Y    ;save return addr
      0085B6 90 BF 24         [ 2] 1105         LDW YTEMP,Y
      0085B9 90 85            [ 2] 1106         POPW Y
      0085BB 1D 00 02         [ 2] 1107         SUBW X,#2
      0085BE FF               [ 2] 1108         LDW (X),Y
      0085BF 92 CC 24         [ 5] 1109         JP [YTEMP]
                                   1110 
                                   1111 ;       R@      ( -- w )
                                   1112 ;       Copy top of return stack to stack.
      0085C2 85 B1                 1113         .word      LINK
                           000544  1114 LINK	= 	. 
      0085C4 02                    1115         .byte      2
      0085C5 52 40                 1116         .ascii     "R@"
      0085C7                       1117 RAT:
      0085C7 16 03            [ 2] 1118         ldw y,(3,sp)
      0085C9 1D 00 02         [ 2] 1119         subw x,#CELLL 
      0085CC FF               [ 2] 1120         ldw (x),y 
      0085CD 81               [ 4] 1121         ret 
                                   1122 
                                   1123 ;       >R      ( w -- )
                                   1124 ;       Push data stack to return stack.
      0085CE 85 C4                 1125         .word      LINK
                           000550  1126 LINK	= 	. 
      0085D0 42                    1127 	.byte      COMPO+2
      0085D1 3E 52                 1128         .ascii     ">R"
      0085D3                       1129 TOR:
      0085D3 90 85            [ 2] 1130         POPW Y    ;save return addr
      0085D5 90 BF 24         [ 2] 1131         LDW YTEMP,Y
      0085D8 90 93            [ 1] 1132         LDW Y,X
      0085DA 90 FE            [ 2] 1133         LDW Y,(Y)
      0085DC 90 89            [ 2] 1134         PUSHW Y    ;restore return addr
      0085DE 1C 00 02         [ 2] 1135         ADDW X,#2
      0085E1 92 CC 24         [ 5] 1136         JP [YTEMP]
                                   1137 
                                   1138 ;       SP@     ( -- a )
                                   1139 ;       Push current stack pointer.
      0085E4 85 D0                 1140         .word      LINK
                           000566  1141 LINK	= 	. 
      0085E6 03                    1142         .byte      3
      0085E7 53 50 40              1143         .ascii     "SP@"
      0085EA                       1144 SPAT:
      0085EA 90 93            [ 1] 1145 	LDW Y,X
      0085EC 1D 00 02         [ 2] 1146         SUBW X,#2
      0085EF FF               [ 2] 1147 	LDW (X),Y
      0085F0 81               [ 4] 1148         RET     
                                   1149 
                                   1150 ;       SP!     ( a -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                                   1151 ;       Set  data stack pointer.
      0085F1 85 E6                 1152         .word      LINK
                           000573  1153 LINK	= 	. 
      0085F3 03                    1154         .byte      3
      0085F4 53 50 21              1155         .ascii     "SP!"
      0085F7                       1156 SPSTO:
      0085F7 FE               [ 2] 1157         LDW     X,(X)     ;X = a
      0085F8 81               [ 4] 1158         RET     
                                   1159 
                                   1160 ;       DROP    ( w -- )
                                   1161 ;       Discard top stack item.
      0085F9 85 F3                 1162         .word      LINK
                           00057B  1163 LINK	= 	. 
      0085FB 04                    1164         .byte      4
      0085FC 44 52 4F 50           1165         .ascii     "DROP"
      008600                       1166 DROP:
      008600 1C 00 02         [ 2] 1167         ADDW X,#2     
      008603 81               [ 4] 1168         RET     
                                   1169 
                                   1170 ;       DUP     ( w -- w w )
                                   1171 ;       Duplicate  top stack item.
      008604 85 FB                 1172         .word      LINK
                           000586  1173 LINK	= 	. 
      008606 03                    1174         .byte      3
      008607 44 55 50              1175         .ascii     "DUP"
      00860A                       1176 DUPP:
      00860A 90 93            [ 1] 1177 	LDW Y,X
      00860C 1D 00 02         [ 2] 1178         SUBW X,#2
      00860F 90 FE            [ 2] 1179 	LDW Y,(Y)
      008611 FF               [ 2] 1180 	LDW (X),Y
      008612 81               [ 4] 1181         RET     
                                   1182 
                                   1183 ;       SWAP    ( w1 w2 -- w2 w1 )
                                   1184 ;       Exchange top two stack items.
      008613 86 06                 1185         .word      LINK
                           000595  1186 LINK	= 	. 
      008615 04                    1187         .byte      4
      008616 53 57 41 50           1188         .ascii     "SWAP"
      00861A                       1189 SWAPP:
      00861A 90 93            [ 1] 1190         LDW Y,X
      00861C 90 FE            [ 2] 1191         LDW Y,(Y)
      00861E 90 BF 24         [ 2] 1192         LDW YTEMP,Y
      008621 90 93            [ 1] 1193         LDW Y,X
      008623 90 EE 02         [ 2] 1194         LDW Y,(2,Y)
      008626 FF               [ 2] 1195         LDW (X),Y
      008627 90 BE 24         [ 2] 1196         LDW Y,YTEMP
      00862A EF 02            [ 2] 1197         LDW (2,X),Y
      00862C 81               [ 4] 1198         RET     
                                   1199 
                                   1200 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                   1201 ;       Copy second stack item to top.
      00862D 86 15                 1202         .word      LINK
                           0005AF  1203 LINK	= . 
      00862F 04                    1204         .byte      4
      008630 4F 56 45 52           1205         .ascii     "OVER"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008634                       1206 OVER:
      008634 1D 00 02         [ 2] 1207         SUBW X,#2
      008637 90 93            [ 1] 1208         LDW Y,X
      008639 90 EE 04         [ 2] 1209         LDW Y,(4,Y)
      00863C FF               [ 2] 1210         LDW (X),Y
      00863D 81               [ 4] 1211         RET     
                                   1212 
                                   1213 ;       0<      ( n -- t )
                                   1214 ;       Return true if n is negative.
      00863E 86 2F                 1215         .word      LINK
                           0005C0  1216 LINK	= . 
      008640 02                    1217         .byte      2
      008641 30 3C                 1218         .ascii     "0<"
      008643                       1219 ZLESS:
      008643 A6 FF            [ 1] 1220         LD A,#0xFF
      008645 90 93            [ 1] 1221         LDW Y,X
      008647 90 FE            [ 2] 1222         LDW Y,(Y)
      008649 2B 01            [ 1] 1223         JRMI     ZL1
      00864B 4F               [ 1] 1224         CLR A   ;false
      00864C F7               [ 1] 1225 ZL1:    LD     (X),A
      00864D E7 01            [ 1] 1226         LD (1,X),A
      00864F 81               [ 4] 1227 	RET     
                                   1228 
                                   1229 ;       AND     ( w w -- w )
                                   1230 ;       Bitwise AND.
      008650 86 40                 1231         .word      LINK
                           0005D2  1232 LINK	= . 
      008652 03                    1233         .byte      3
      008653 41 4E 44              1234         .ascii     "AND"
      008656                       1235 ANDD:
      008656 F6               [ 1] 1236         LD  A,(X)    ;D=w
      008657 E4 02            [ 1] 1237         AND A,(2,X)
      008659 E7 02            [ 1] 1238         LD (2,X),A
      00865B E6 01            [ 1] 1239         LD A,(1,X)
      00865D E4 03            [ 1] 1240         AND A,(3,X)
      00865F E7 03            [ 1] 1241         LD (3,X),A
      008661 1C 00 02         [ 2] 1242         ADDW X,#2
      008664 81               [ 4] 1243         RET
                                   1244 
                                   1245 ;       OR      ( w w -- w )
                                   1246 ;       Bitwise inclusive OR.
      008665 86 52                 1247         .word      LINK
                           0005E7  1248 LINK = . 
      008667 02                    1249         .byte      2
      008668 4F 52                 1250         .ascii     "OR"
      00866A                       1251 ORR:
      00866A F6               [ 1] 1252         LD A,(X)    ;D=w
      00866B EA 02            [ 1] 1253         OR A,(2,X)
      00866D E7 02            [ 1] 1254         LD (2,X),A
      00866F E6 01            [ 1] 1255         LD A,(1,X)
      008671 EA 03            [ 1] 1256         OR A,(3,X)
      008673 E7 03            [ 1] 1257         LD (3,X),A
      008675 1C 00 02         [ 2] 1258         ADDW X,#2
      008678 81               [ 4] 1259         RET
                                   1260 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



                                   1261 ;       XOR     ( w w -- w )
                                   1262 ;       Bitwise exclusive OR.
      008679 86 67                 1263         .word      LINK
                           0005FB  1264 LINK	= . 
      00867B 03                    1265         .byte      3
      00867C 58 4F 52              1266         .ascii     "XOR"
      00867F                       1267 XORR:
      00867F F6               [ 1] 1268         LD A,(X)    ;D=w
      008680 E8 02            [ 1] 1269         XOR A,(2,X)
      008682 E7 02            [ 1] 1270         LD (2,X),A
      008684 E6 01            [ 1] 1271         LD A,(1,X)
      008686 E8 03            [ 1] 1272         XOR A,(3,X)
      008688 E7 03            [ 1] 1273         LD (3,X),A
      00868A 1C 00 02         [ 2] 1274         ADDW X,#2
      00868D 81               [ 4] 1275         RET
                                   1276 
                                   1277 ;       UM+     ( u u -- udsum )
                                   1278 ;       Add two unsigned single
                                   1279 ;       and return a double sum.
      00868E 86 7B                 1280         .word      LINK
                           000610  1281 LINK	= . 
      008690 03                    1282         .byte      3
      008691 55 4D 2B              1283         .ascii     "UM+"
      008694                       1284 UPLUS:
      008694 A6 01            [ 1] 1285         LD A,#1
      008696 90 93            [ 1] 1286         LDW Y,X
      008698 90 EE 02         [ 2] 1287         LDW Y,(2,Y)
      00869B 90 BF 24         [ 2] 1288         LDW YTEMP,Y
      00869E 90 93            [ 1] 1289         LDW Y,X
      0086A0 90 FE            [ 2] 1290         LDW Y,(Y)
      0086A2 72 B9 00 24      [ 2] 1291         ADDW Y,YTEMP
      0086A6 EF 02            [ 2] 1292         LDW (2,X),Y
      0086A8 25 01            [ 1] 1293         JRC     UPL1
      0086AA 4F               [ 1] 1294         CLR A
      0086AB E7 01            [ 1] 1295 UPL1:   LD     (1,X),A
      0086AD 7F               [ 1] 1296         CLR (X)
      0086AE 81               [ 4] 1297         RET
                                   1298 
                                   1299 ;; System and user variables
                                   1300 
                                   1301 ;       doVAR   ( -- a )
                                   1302 ;       Code for VARIABLE and CREATE.
      0086AF 86 90                 1303         .word      LINK
                           000631  1304 LINK	= . 
      0086B1 45                    1305 	.byte      COMPO+5
      0086B2 44 4F 56 41 52        1306         .ascii     "DOVAR"
      0086B7                       1307 DOVAR:
      0086B7 1D 00 02         [ 2] 1308 	SUBW X,#2
      0086BA 90 85            [ 2] 1309         POPW Y    ;get return addr (pfa)
      0086BC 90 FE            [ 2] 1310         LDW Y,(Y) ; indirect address 
      0086BE FF               [ 2] 1311         LDW (X),Y    ;push on stack
      0086BF 81               [ 4] 1312         RET     ;go to RET of EXEC
                                   1313 
                                   1314 ;       BASE    ( -- a )
                                   1315 ;       Radix base for numeric I/O.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      0086C0 86 B1                 1316         .word      LINK        
                           000642  1317 LINK = . 
      0086C2 04                    1318         .byte      4
      0086C3 42 41 53 45           1319         .ascii     "BASE"
      0086C7                       1320 BASE:
      0086C7 90 AE 00 06      [ 2] 1321 	LDW Y,#UBASE 
      0086CB 1D 00 02         [ 2] 1322 	SUBW X,#2
      0086CE FF               [ 2] 1323         LDW (X),Y
      0086CF 81               [ 4] 1324         RET
                                   1325 
                                   1326 ;       tmp     ( -- a )
                                   1327 ;       A temporary storage.
      0086D0 86 C2                 1328         .word      LINK
                                   1329         
                           000652  1330 LINK = . 
      0086D2 03                    1331 	.byte      3
      0086D3 54 4D 50              1332         .ascii     "TMP"
      0086D6                       1333 TEMP:
      0086D6 90 AE 00 08      [ 2] 1334 	LDW Y,#UTMP
      0086DA 1D 00 02         [ 2] 1335 	SUBW X,#2
      0086DD FF               [ 2] 1336         LDW (X),Y
      0086DE 81               [ 4] 1337         RET
                                   1338 
                                   1339 ;       >IN     ( -- a )
                                   1340 ;        Hold parsing pointer.
      0086DF 86 D2                 1341         .word      LINK
                           000661  1342 LINK = . 
      0086E1 03                    1343         .byte      3
      0086E2 3E 49 4E              1344         .ascii    ">IN"
      0086E5                       1345 INN:
      0086E5 90 AE 00 0A      [ 2] 1346 	LDW Y,#UINN 
      0086E9 1D 00 02         [ 2] 1347 	SUBW X,#2
      0086EC FF               [ 2] 1348         LDW (X),Y
      0086ED 81               [ 4] 1349         RET
                                   1350 
                                   1351 ;       #TIB    ( -- a )
                                   1352 ;       Count in terminal input buffer.
      0086EE 86 E1                 1353         .word      LINK
                           000670  1354 LINK = . 
      0086F0 04                    1355         .byte      4
      0086F1 23 54 49 42           1356         .ascii     "#TIB"
      0086F5                       1357 NTIB:
      0086F5 90 AE 00 0C      [ 2] 1358 	LDW Y,#UCTIB 
      0086F9 1D 00 02         [ 2] 1359 	SUBW X,#2
      0086FC FF               [ 2] 1360         LDW (X),Y
      0086FD 81               [ 4] 1361         RET
                                   1362 
                                   1363 ;       TBUF ( -- a )
                                   1364 ;       address of 128 bytes transaction buffer 
      0086FE 86 F0                 1365         .word LINK 
                           000680  1366         LINK=.
      008700 04                    1367         .byte 4 
      008701 54 42 55 46           1368         .ascii "TBUF"
      008705                       1369 TBUF:
      008705 90 AE 06 80      [ 2] 1370         ldw y,#ROWBUFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      008709 1D 00 02         [ 2] 1371         subw x,#CELLL
      00870C FF               [ 2] 1372         ldw (x),y 
      00870D 81               [ 4] 1373         ret 
                                   1374 
                                   1375 ; systeme variable 
                                   1376 ; compilation destination 
                                   1377 ; TFLASH ( -- A )
      00870E 87 00                 1378         .word LINK 
                           000690  1379         LINK=.
      008710 06                    1380         .byte 6 
      008711 54 46 4C 41 53 48     1381         .ascii "TFLASH"         
      008717                       1382 TFLASH:
      008717 1D 00 02         [ 2] 1383         subw x,#CELLL 
      00871A 90 AE 00 1E      [ 2] 1384         ldw y,#UTFLASH
      00871E FF               [ 2] 1385         ldw (x),y 
      00871F 81               [ 4] 1386         ret 
                                   1387 
                                   1388 ;       "EVAL   ( -- a )
                                   1389 ;       Execution vector of EVAL.
      008720 87 10                 1390         .word      LINK
                           0006A2  1391 LINK = . 
      008722 05                    1392         .byte      5
      008723 27 45 56 41 4C        1393         .ascii     "'EVAL"
      008728                       1394 TEVAL:
      008728 90 AE 00 10      [ 2] 1395 	LDW Y,#UINTER 
      00872C 1D 00 02         [ 2] 1396 	SUBW X,#2
      00872F FF               [ 2] 1397         LDW (X),Y
      008730 81               [ 4] 1398         RET
                                   1399 
                                   1400 ;       HLD     ( -- a )
                                   1401 ;       Hold a pointer of output string.
      008731 87 22                 1402         .word      LINK
                           0006B3  1403 LINK = . 
      008733 03                    1404         .byte      3
      008734 48 4C 44              1405         .ascii     "HLD"
      008737                       1406 HLD:
      008737 90 AE 00 12      [ 2] 1407 	LDW Y,#UHLD 
      00873B 1D 00 02         [ 2] 1408 	SUBW X,#2
      00873E FF               [ 2] 1409         LDW (X),Y
      00873F 81               [ 4] 1410         RET
                                   1411 
                                   1412 ;       CONTEXT ( -- a )
                                   1413 ;       Start vocabulary search.
      008740 87 33                 1414         .word      LINK
                           0006C2  1415 LINK = . 
      008742 07                    1416         .byte      7
      008743 43 4F 4E 54 45 58 54  1417         .ascii     "CONTEXT"
      00874A                       1418 CNTXT:
      00874A 90 AE 00 14      [ 2] 1419 	LDW Y,#UCNTXT
      00874E 1D 00 02         [ 2] 1420 	SUBW X,#2
      008751 FF               [ 2] 1421         LDW (X),Y
      008752 81               [ 4] 1422         RET
                                   1423 
                                   1424 ;       VP      ( -- a )
                                   1425 ;       Point to top of variables
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008753 87 42                 1426         .word      LINK
                           0006D5  1427 LINK = . 
      008755 02                    1428         .byte      2
      008756 56 50                 1429         .ascii     "VP"
      008758                       1430 VPP:
      008758 90 AE 00 16      [ 2] 1431 	LDW Y,#UVP 
      00875C 1D 00 02         [ 2] 1432 	SUBW X,#2
      00875F FF               [ 2] 1433         LDW (X),Y
      008760 81               [ 4] 1434         RET
                                   1435 
                                   1436 ;       CP    ( -- a )
                                   1437 ;       Pointer to top of FLASH 
      008761 87 55                 1438         .word LINK 
                           0006E3  1439         LINK=.
      008763 02                    1440         .byte 2 
      008764 43 50                 1441         .ascii "CP"
      008766                       1442 CPP: 
      008766 90 AE 00 18      [ 2] 1443         ldw y,#UCP 
      00876A 1D 00 02         [ 2] 1444         subw x,#CELLL 
      00876D FF               [ 2] 1445         ldw (x),y 
      00876E 81               [ 4] 1446         ret                
                                   1447 
                                   1448 ;       LAST    ( -- a )
                                   1449 ;       Point to last name in dictionary.
      00876F 87 63                 1450         .word      LINK
                           0006F1  1451 LINK = . 
      008771 04                    1452         .byte      4
      008772 4C 41 53 54           1453         .ascii     "LAST"
      008776                       1454 LAST:
      008776 90 AE 00 1A      [ 2] 1455 	LDW Y,#ULAST 
      00877A 1D 00 02         [ 2] 1456 	SUBW X,#2
      00877D FF               [ 2] 1457         LDW (X),Y
      00877E 81               [ 4] 1458         RET
                                   1459 
                                   1460 ; address of system variable URLAST 
                                   1461 ;       RAMLAST ( -- a )
                                   1462 ; RAM dictionary context 
      00877F 87 71                 1463         .word LINK 
                           000701  1464         LINK=. 
      008781 07                    1465         .byte 7  
      008782 52 41 4D 4C 41 53 54  1466         .ascii "RAMLAST" 
      008789                       1467 RAMLAST: 
      008789 90 AE 00 20      [ 2] 1468         ldw y,#URLAST 
      00878D 1D 00 02         [ 2] 1469         subw x,#CELLL 
      008790 FF               [ 2] 1470         ldw (x),y 
      008791 81               [ 4] 1471         ret 
                                   1472 
                                   1473 ; OFFSET ( -- a )
                                   1474 ; address of system variable OFFSET 
      008792 87 81                 1475         .word LINK 
                           000714  1476         LINK=.
      008794 06                    1477         .byte 6
      008795 4F 46 46 53 45 54     1478         .ascii "OFFSET" 
      00879B                       1479 OFFSET: 
      00879B 1D 00 02         [ 2] 1480         subw x,#CELLL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      00879E 90 AE 00 1C      [ 2] 1481         ldw y,#UOFFSET 
      0087A2 FF               [ 2] 1482         ldw (x),y 
      0087A3 81               [ 4] 1483         ret 
                                   1484 
                                   1485 ; adjust jump address adding OFFSET
                                   1486 ; ADR-ADJ ( a -- a+offset )
      0087A4                       1487 ADRADJ: 
      0087A4 CD 87 9B         [ 4] 1488         call OFFSET 
      0087A7 CD 85 63         [ 4] 1489         call AT 
      0087AA CC 88 05         [ 2] 1490         jp PLUS 
                                   1491 
                                   1492 
                                   1493 ;; Common functions
                                   1494 
                                   1495 ;       ?DUP    ( w -- w w | 0 )
                                   1496 ;       Dup tos if its is not zero.
      0087AD 87 94                 1497         .word      LINK
                           00072F  1498 LINK = . 
      0087AF 04                    1499         .byte      4
      0087B0 3F 44 55 50           1500         .ascii     "?DUP"
      0087B4                       1501 QDUP:
      0087B4 90 93            [ 1] 1502         LDW Y,X
      0087B6 90 FE            [ 2] 1503 	LDW Y,(Y)
      0087B8 27 04            [ 1] 1504         JREQ     QDUP1
      0087BA 1D 00 02         [ 2] 1505 	SUBW X,#2
      0087BD FF               [ 2] 1506         LDW (X),Y
      0087BE 81               [ 4] 1507 QDUP1:  RET
                                   1508 
                                   1509 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1510 ;       Rot 3rd item to top.
      0087BF 87 AF                 1511         .word      LINK
                           000741  1512 LINK = . 
      0087C1 03                    1513         .byte      3
      0087C2 52 4F 54              1514         .ascii     "ROT"
      0087C5                       1515 ROT:
      0087C5 90 93            [ 1] 1516         ldw y,x 
      0087C7 90 FE            [ 2] 1517         ldw y,(y)
      0087C9 90 89            [ 2] 1518         pushw y 
      0087CB 90 93            [ 1] 1519         ldw y,x 
      0087CD 90 EE 04         [ 2] 1520         ldw y,(4,y)
      0087D0 FF               [ 2] 1521         ldw (x),y 
      0087D1 90 93            [ 1] 1522         ldw y,x 
      0087D3 90 EE 02         [ 2] 1523         ldw y,(2,y)
      0087D6 EF 04            [ 2] 1524         ldw (4,x),y 
      0087D8 90 85            [ 2] 1525         popw y 
      0087DA EF 02            [ 2] 1526         ldw (2,x),y
      0087DC 81               [ 4] 1527         ret 
                                   1528 
                                   1529 ;       2DROP   ( w w -- )
                                   1530 ;       Discard two items on stack.
      0087DD 87 C1                 1531         .word      LINK
                           00075F  1532 LINK = . 
      0087DF 05                    1533         .byte      5
      0087E0 32 44 52 4F 50        1534         .ascii     "2DROP"
      0087E5                       1535 DDROP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0087E5 1C 00 04         [ 2] 1536         ADDW X,#4
      0087E8 81               [ 4] 1537         RET
                                   1538 
                                   1539 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1540 ;       Duplicate top two items.
      0087E9 87 DF                 1541         .word      LINK
                           00076B  1542 LINK = . 
      0087EB 04                    1543         .byte      4
      0087EC 32 44 55 50           1544         .ascii     "2DUP"
      0087F0                       1545 DDUP:
      0087F0 1D 00 04         [ 2] 1546         SUBW X,#4
      0087F3 90 93            [ 1] 1547         LDW Y,X
      0087F5 90 EE 06         [ 2] 1548         LDW Y,(6,Y)
      0087F8 EF 02            [ 2] 1549         LDW (2,X),Y
      0087FA 90 93            [ 1] 1550         LDW Y,X
      0087FC 90 EE 04         [ 2] 1551         LDW Y,(4,Y)
      0087FF FF               [ 2] 1552         LDW (X),Y
      008800 81               [ 4] 1553         RET
                                   1554 
                                   1555 ;       +       ( w w -- sum )
                                   1556 ;       Add top two items.
      008801 87 EB                 1557         .word      LINK
                           000783  1558 LINK = . 
      008803 01                    1559         .byte      1
      008804 2B                    1560         .ascii     "+"
      008805                       1561 PLUS:
      008805 90 93            [ 1] 1562         LDW Y,X
      008807 90 FE            [ 2] 1563         LDW Y,(Y)
      008809 90 BF 24         [ 2] 1564         LDW YTEMP,Y
      00880C 1C 00 02         [ 2] 1565         ADDW X,#2
      00880F 90 93            [ 1] 1566         LDW Y,X
      008811 90 FE            [ 2] 1567         LDW Y,(Y)
      008813 72 B9 00 24      [ 2] 1568         ADDW Y,YTEMP
      008817 FF               [ 2] 1569         LDW (X),Y
      008818 81               [ 4] 1570         RET
                                   1571 
                                   1572 ;       NOT     ( w -- w )
                                   1573 ;       One's complement of tos.
      008819 88 03                 1574         .word      LINK
                           00079B  1575 LINK = . 
      00881B 03                    1576         .byte      3
      00881C 4E 4F 54              1577         .ascii     "NOT"
      00881F                       1578 INVER:
      00881F 90 93            [ 1] 1579         LDW Y,X
      008821 90 FE            [ 2] 1580         LDW Y,(Y)
      008823 90 53            [ 2] 1581         CPLW Y
      008825 FF               [ 2] 1582         LDW (X),Y
      008826 81               [ 4] 1583         RET
                                   1584 
                                   1585 ;       NEGATE  ( n -- -n )
                                   1586 ;       Two's complement of tos.
      008827 88 1B                 1587         .word      LINK
                           0007A9  1588 LINK = . 
      008829 06                    1589         .byte      6
      00882A 4E 45 47 41 54 45     1590         .ascii     "NEGATE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008830                       1591 NEGAT:
      008830 90 93            [ 1] 1592         LDW Y,X
      008832 90 FE            [ 2] 1593         LDW Y,(Y)
      008834 90 50            [ 2] 1594         NEGW Y
      008836 FF               [ 2] 1595         LDW (X),Y
      008837 81               [ 4] 1596         RET
                                   1597 
                                   1598 ;       DNEGATE ( d -- -d )
                                   1599 ;       Two's complement of top double.
      008838 88 29                 1600         .word      LINK
                           0007BA  1601 LINK = . 
      00883A 07                    1602         .byte      7
      00883B 44 4E 45 47 41 54 45  1603         .ascii     "DNEGATE"
      008842                       1604 DNEGA:
      008842 90 93            [ 1] 1605         LDW Y,X
      008844 90 FE            [ 2] 1606 	LDW Y,(Y)
      008846 90 53            [ 2] 1607         CPLW Y     
      008848 90 BF 24         [ 2] 1608 	LDW YTEMP,Y
      00884B 90 93            [ 1] 1609         LDW Y,X
      00884D 90 EE 02         [ 2] 1610         LDW Y,(2,Y)
      008850 90 53            [ 2] 1611         CPLW Y
      008852 72 A9 00 01      [ 2] 1612         addw y,#1
      008856 EF 02            [ 2] 1613         LDW (2,X),Y
      008858 90 BE 24         [ 2] 1614         LDW Y,YTEMP
      00885B 24 02            [ 1] 1615         JRNC DN1 
      00885D 90 5C            [ 1] 1616         INCW Y
      00885F FF               [ 2] 1617 DN1:    LDW (X),Y
      008860 81               [ 4] 1618         RET
                                   1619 
                                   1620 
                                   1621 ;       S>D ( n -- d )
                                   1622 ; convert single integer to double 
      008861 88 3A                 1623         .word LINK 
                           0007E3  1624         LINK=. 
      008863 03                    1625         .byte 3 
      008864 53 3E 44              1626         .ascii "S>D"
      008867                       1627 STOD: 
      008867 1D 00 02         [ 2] 1628         subw x,#CELLL 
      00886A 90 5F            [ 1] 1629         clrw y 
      00886C FF               [ 2] 1630         ldw (x),y 
      00886D 90 93            [ 1] 1631         ldw y,x 
      00886F 90 EE 02         [ 2] 1632         ldw y,(2,y)
      008872 2A 05            [ 1] 1633         jrpl 1$ 
      008874 90 AE FF FF      [ 2] 1634         ldw y,#-1
      008878 FF               [ 2] 1635         ldw (x),y 
      008879 81               [ 4] 1636 1$:     ret 
                                   1637 
                                   1638 
                                   1639 
                                   1640 
                                   1641 ;       -       ( n1 n2 -- n1-n2 )
                                   1642 ;       Subtraction.
      00887A 88 63                 1643         .word      LINK
                           0007FC  1644 LINK = . 
      00887C 01                    1645         .byte      1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      00887D 2D                    1646         .ascii     "-"
      00887E                       1647 SUBB:
      00887E 90 93            [ 1] 1648         LDW Y,X
      008880 90 FE            [ 2] 1649         LDW Y,(Y)
      008882 90 BF 24         [ 2] 1650         LDW YTEMP,Y
      008885 1C 00 02         [ 2] 1651         ADDW X,#2
      008888 90 93            [ 1] 1652         LDW Y,X
      00888A 90 FE            [ 2] 1653         LDW Y,(Y)
      00888C 72 B2 00 24      [ 2] 1654         SUBW Y,YTEMP
      008890 FF               [ 2] 1655         LDW (X),Y
      008891 81               [ 4] 1656         RET
                                   1657 
                                   1658 ;       ABS     ( n -- n )
                                   1659 ;       Return  absolute value of n.
      008892 88 7C                 1660         .word      LINK
                           000814  1661 LINK = . 
      008894 03                    1662         .byte      3
      008895 41 42 53              1663         .ascii     "ABS"
      008898                       1664 ABSS:
      008898 90 93            [ 1] 1665         LDW Y,X
      00889A 90 FE            [ 2] 1666 	LDW Y,(Y)
      00889C 2A 03            [ 1] 1667         JRPL     AB1     ;negate:
      00889E 90 50            [ 2] 1668         NEGW     Y     ;else negate hi byte
      0088A0 FF               [ 2] 1669         LDW (X),Y
      0088A1 81               [ 4] 1670 AB1:    RET
                                   1671 
                                   1672 ;       =       ( w w -- t )
                                   1673 ;       Return true if top two are =al.
      0088A2 88 94                 1674         .word      LINK
                           000824  1675 LINK = . 
      0088A4 01                    1676         .byte      1
      0088A5 3D                    1677         .ascii     "="
      0088A6                       1678 EQUAL:
      0088A6 A6 FF            [ 1] 1679         LD A,#0xFF  ;true
      0088A8 90 93            [ 1] 1680         LDW Y,X    ;D = n2
      0088AA 90 FE            [ 2] 1681         LDW Y,(Y)
      0088AC 90 BF 24         [ 2] 1682         LDW YTEMP,Y
      0088AF 1C 00 02         [ 2] 1683         ADDW X,#2
      0088B2 90 93            [ 1] 1684         LDW Y,X
      0088B4 90 FE            [ 2] 1685         LDW Y,(Y)
      0088B6 90 B3 24         [ 2] 1686         CPW Y,YTEMP     ;if n2 <> n1
      0088B9 27 01            [ 1] 1687         JREQ     EQ1
      0088BB 4F               [ 1] 1688         CLR A
      0088BC F7               [ 1] 1689 EQ1:    LD (X),A
      0088BD E7 01            [ 1] 1690         LD (1,X),A
      0088BF 81               [ 4] 1691 	RET     
                                   1692 
                                   1693 ;       U<      ( u u -- t )
                                   1694 ;       Unsigned compare of top two items.
      0088C0 88 A4                 1695         .word      LINK
                           000842  1696 LINK = . 
      0088C2 02                    1697         .byte      2
      0088C3 55 3C                 1698         .ascii     "U<"
      0088C5                       1699 ULESS:
      0088C5 A6 FF            [ 1] 1700         LD A,#0xFF  ;true
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      0088C7 90 93            [ 1] 1701         LDW Y,X    ;D = n2
      0088C9 90 FE            [ 2] 1702         LDW Y,(Y)
      0088CB 90 BF 24         [ 2] 1703         LDW YTEMP,Y
      0088CE 1C 00 02         [ 2] 1704         ADDW X,#2
      0088D1 90 93            [ 1] 1705         LDW Y,X
      0088D3 90 FE            [ 2] 1706         LDW Y,(Y)
      0088D5 90 B3 24         [ 2] 1707         CPW Y,YTEMP     ;if n2 <> n1
      0088D8 25 01            [ 1] 1708         JRULT     ULES1
      0088DA 4F               [ 1] 1709         CLR A
      0088DB F7               [ 1] 1710 ULES1:  LD (X),A
      0088DC E7 01            [ 1] 1711         LD (1,X),A
      0088DE 81               [ 4] 1712 	RET     
                                   1713 
                                   1714 ;       <       ( n1 n2 -- t )
                                   1715 ;       Signed compare of top two items.
      0088DF 88 C2                 1716         .word      LINK
                           000861  1717 LINK = . 
      0088E1 01                    1718         .byte      1
      0088E2 3C                    1719         .ascii     "<"
      0088E3                       1720 LESS:
      0088E3 A6 FF            [ 1] 1721         LD A,#0xFF  ;true
      0088E5 90 93            [ 1] 1722         LDW Y,X    ;D = n2
      0088E7 90 FE            [ 2] 1723         LDW Y,(Y)
      0088E9 90 BF 24         [ 2] 1724         LDW YTEMP,Y
      0088EC 1C 00 02         [ 2] 1725         ADDW X,#2
      0088EF 90 93            [ 1] 1726         LDW Y,X
      0088F1 90 FE            [ 2] 1727         LDW Y,(Y)
      0088F3 90 B3 24         [ 2] 1728         CPW Y,YTEMP     ;if n2 <> n1
      0088F6 2F 01            [ 1] 1729         JRSLT     LT1
      0088F8 4F               [ 1] 1730         CLR A
      0088F9 F7               [ 1] 1731 LT1:    LD (X),A
      0088FA E7 01            [ 1] 1732         LD (1,X),A
      0088FC 81               [ 4] 1733 	RET     
                                   1734 
                                   1735 ;       MAX     ( n n -- n )
                                   1736 ;       Return greater of two top items.
      0088FD 88 E1                 1737         .word      LINK
                           00087F  1738 LINK = . 
      0088FF 03                    1739         .byte      3
      008900 4D 41 58              1740         .ascii     "MAX"
      008903                       1741 MAX:
      008903 90 93            [ 1] 1742         LDW Y,X    ;D = n2
      008905 90 EE 02         [ 2] 1743         LDW Y,(2,Y)
      008908 90 BF 24         [ 2] 1744         LDW YTEMP,Y
      00890B 90 93            [ 1] 1745         LDW Y,X
      00890D 90 FE            [ 2] 1746         LDW Y,(Y)
      00890F 90 B3 24         [ 2] 1747         CPW Y,YTEMP     ;if n2 <> n1
      008912 2F 02            [ 1] 1748         JRSLT     MAX1
      008914 EF 02            [ 2] 1749         LDW (2,X),Y
      008916 1C 00 02         [ 2] 1750 MAX1:   ADDW X,#2
      008919 81               [ 4] 1751 	RET     
                                   1752 
                                   1753 ;       MIN     ( n n -- n )
                                   1754 ;       Return smaller of top two items.
      00891A 88 FF                 1755         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                           00089C  1756 LINK = . 
      00891C 03                    1757         .byte      3
      00891D 4D 49 4E              1758         .ascii     "MIN"
      008920                       1759 MIN:
      008920 90 93            [ 1] 1760         LDW Y,X    ;D = n2
      008922 90 EE 02         [ 2] 1761         LDW Y,(2,Y)
      008925 90 BF 24         [ 2] 1762         LDW YTEMP,Y
      008928 90 93            [ 1] 1763         LDW Y,X
      00892A 90 FE            [ 2] 1764         LDW Y,(Y)
      00892C 90 B3 24         [ 2] 1765         CPW Y,YTEMP     ;if n2 <> n1
      00892F 2C 02            [ 1] 1766         JRSGT     MIN1
      008931 EF 02            [ 2] 1767         LDW (2,X),Y
      008933 1C 00 02         [ 2] 1768 MIN1:	ADDW X,#2
      008936 81               [ 4] 1769 	RET     
                                   1770 
                                   1771 ;       WITHIN  ( u ul uh -- t )
                                   1772 ;       Return true if u is within
                                   1773 ;       range of ul and uh. ( ul <= u < uh )
      008937 89 1C                 1774         .word      LINK
                           0008B9  1775 LINK = . 
      008939 06                    1776         .byte      6
      00893A 57 49 54 48 49 4E     1777         .ascii     "WITHIN"
      008940                       1778 WITHI:
      008940 CD 86 34         [ 4] 1779         CALL     OVER
      008943 CD 88 7E         [ 4] 1780         CALL     SUBB
      008946 CD 85 D3         [ 4] 1781         CALL     TOR
      008949 CD 88 7E         [ 4] 1782         CALL     SUBB
      00894C CD 85 B4         [ 4] 1783         CALL     RFROM
      00894F CC 88 C5         [ 2] 1784         JP     ULESS
                                   1785 
                                   1786 ;; Divide
                                   1787 
                                   1788 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1789 ;       Unsigned divide of a double by a
                                   1790 ;       single. Return mod and quotient.
      008952 89 39                 1791         .word      LINK
                           0008D4  1792 LINK = . 
      008954 06                    1793         .byte      6
      008955 55 4D 2F 4D 4F 44     1794         .ascii     "UM/MOD"
      00895B                       1795 UMMOD:
      00895B BF 22            [ 2] 1796 	LDW XTEMP,X	; save stack pointer
      00895D FE               [ 2] 1797 	LDW X,(X)	; un
      00895E BF 24            [ 2] 1798 	LDW YTEMP,X     ; save un
      008960 90 BE 22         [ 2] 1799 	LDW Y,XTEMP	; stack pointer
      008963 90 EE 04         [ 2] 1800 	LDW Y,(4,Y)     ; Y=udl
      008966 BE 22            [ 2] 1801 	LDW X,XTEMP
      008968 EE 02            [ 2] 1802 	LDW X,(2,X)	; X=udh
      00896A B3 24            [ 2] 1803 	CPW X,YTEMP
      00896C 23 0F            [ 2] 1804 	JRULE MMSM1
      00896E BE 22            [ 2] 1805 	LDW X,XTEMP
      008970 1C 00 02         [ 2] 1806 	ADDW X,#2	; pop off 1 level
      008973 90 AE FF FF      [ 2] 1807 	LDW Y,#0xFFFF
      008977 FF               [ 2] 1808 	LDW (X),Y
      008978 90 5F            [ 1] 1809 	CLRW Y
      00897A EF 02            [ 2] 1810 	LDW (2,X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      00897C 81               [ 4] 1811 	RET
      00897D                       1812 MMSM1:
                                   1813 ; take advantage of divw x,y when udh==0
      00897D 5D               [ 2] 1814         tnzw x  ; is udh==0?
      00897E 26 11            [ 1] 1815         jrne MMSM2 
      008980 93               [ 1] 1816         ldw x,y    ;udl 
      008981 90 BE 24         [ 2] 1817         ldw y,YTEMP ; divisor 
      008984 65               [ 2] 1818         divw x,y 
      008985 89               [ 2] 1819         pushw x     ; quotient 
      008986 BE 22            [ 2] 1820         ldw x,XTEMP 
      008988 1C 00 02         [ 2] 1821         addw x,#CELLL 
      00898B EF 02            [ 2] 1822         ldw (2,x),y  ; ur
      00898D 90 85            [ 2] 1823         popw y 
      00898F FF               [ 2] 1824         ldw (x),y ; uq 
      008990 81               [ 4] 1825         ret 
      008991                       1826 MMSM2:        
      008991 A6 11            [ 1] 1827 	LD A,#17	; loop count
      008993                       1828 MMSM3:
      008993 B3 24            [ 2] 1829 	CPW X,YTEMP	; compare udh to un
      008995 25 04            [ 1] 1830 	JRULT MMSM4	; can't subtract
      008997 72 B0 00 24      [ 2] 1831 	SUBW X,YTEMP	; can subtract
      00899B                       1832 MMSM4:
      00899B 8C               [ 1] 1833 	CCF	; quotient bit
      00899C 90 59            [ 2] 1834 	RLCW Y	; rotate into quotient
      00899E 59               [ 2] 1835 	RLCW X	; rotate into remainder
      00899F 4A               [ 1] 1836 	DEC A	; repeat
      0089A0 22 F1            [ 1] 1837 	JRUGT MMSM3
      0089A2 56               [ 2] 1838         RRCW X 
      0089A3 BF 24            [ 2] 1839 	LDW YTEMP,X	; done, save remainder
      0089A5 BE 22            [ 2] 1840 	LDW X,XTEMP
      0089A7 1C 00 02         [ 2] 1841 	ADDW X,#2	; drop
      0089AA FF               [ 2] 1842 	LDW (X),Y
      0089AB 90 BE 24         [ 2] 1843 	LDW Y,YTEMP	; save quotient
      0089AE EF 02            [ 2] 1844 	LDW (2,X),Y
      0089B0 81               [ 4] 1845 	RET
                                   1846 	
                                   1847 ;       M/MOD   ( d n -- r q )
                                   1848 ;       Signed floored divide of double by
                                   1849 ;       single. Return mod and quotient.
      0089B1 89 54                 1850         .word      LINK
                           000933  1851 LINK = . 
      0089B3 05                    1852         .byte      5
      0089B4 4D 2F 4D 4F 44        1853         .ascii     "M/MOD"
      0089B9                       1854 MSMOD:  
      0089B9 CD 86 0A         [ 4] 1855         CALL	DUPP
      0089BC CD 86 43         [ 4] 1856         CALL	ZLESS
      0089BF CD 86 0A         [ 4] 1857         CALL	DUPP
      0089C2 CD 85 D3         [ 4] 1858         CALL	TOR
      0089C5 CD 85 18         [ 4] 1859         CALL	QBRAN
      0089C8 89 D6                 1860         .word	MMOD1
      0089CA CD 88 30         [ 4] 1861         CALL	NEGAT
      0089CD CD 85 D3         [ 4] 1862         CALL	TOR
      0089D0 CD 88 42         [ 4] 1863         CALL	DNEGA
      0089D3 CD 85 B4         [ 4] 1864         CALL	RFROM
      0089D6 CD 85 D3         [ 4] 1865 MMOD1:	CALL	TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      0089D9 CD 86 0A         [ 4] 1866         CALL	DUPP
      0089DC CD 86 43         [ 4] 1867         CALL	ZLESS
      0089DF CD 85 18         [ 4] 1868         CALL	QBRAN
      0089E2 89 EA                 1869         .word	MMOD2
      0089E4 CD 85 C7         [ 4] 1870         CALL	RAT
      0089E7 CD 88 05         [ 4] 1871         CALL	PLUS
      0089EA CD 85 B4         [ 4] 1872 MMOD2:	CALL	RFROM
      0089ED CD 89 5B         [ 4] 1873         CALL	UMMOD
      0089F0 CD 85 B4         [ 4] 1874         CALL	RFROM
      0089F3 CD 85 18         [ 4] 1875         CALL	QBRAN
      0089F6 8A 01                 1876         .word	MMOD3
      0089F8 CD 86 1A         [ 4] 1877         CALL	SWAPP
      0089FB CD 88 30         [ 4] 1878         CALL	NEGAT
      0089FE CD 86 1A         [ 4] 1879         CALL	SWAPP
      008A01 81               [ 4] 1880 MMOD3:	RET
                                   1881 
                                   1882 ;       /MOD    ( n n -- r q )
                                   1883 ;       Signed divide. Return mod and quotient.
      008A02 89 B3                 1884         .word      LINK
                           000984  1885 LINK = . 
      008A04 04                    1886         .byte      4
      008A05 2F 4D 4F 44           1887         .ascii     "/MOD"
      008A09                       1888 SLMOD:
      008A09 CD 86 34         [ 4] 1889         CALL	OVER
      008A0C CD 86 43         [ 4] 1890         CALL	ZLESS
      008A0F CD 86 1A         [ 4] 1891         CALL	SWAPP
      008A12 CC 89 B9         [ 2] 1892         JP	MSMOD
                                   1893 
                                   1894 ;       MOD     ( n n -- r )
                                   1895 ;       Signed divide. Return mod only.
      008A15 8A 04                 1896         .word      LINK
                           000997  1897 LINK = . 
      008A17 03                    1898         .byte      3
      008A18 4D 4F 44              1899         .ascii     "MOD"
      008A1B                       1900 MODD:
      008A1B CD 8A 09         [ 4] 1901 	CALL	SLMOD
      008A1E CC 86 00         [ 2] 1902 	JP	DROP
                                   1903 
                                   1904 ;       /       ( n n -- q )
                                   1905 ;       Signed divide. Return quotient only.
      008A21 8A 17                 1906         .word      LINK
                           0009A3  1907 LINK = . 
      008A23 01                    1908         .byte      1
      008A24 2F                    1909         .ascii     "/"
      008A25                       1910 SLASH:
      008A25 CD 8A 09         [ 4] 1911         CALL	SLMOD
      008A28 CD 86 1A         [ 4] 1912         CALL	SWAPP
      008A2B CC 86 00         [ 2] 1913         JP	DROP
                                   1914 
                                   1915 ;; Multiply
                                   1916 
                                   1917 ;       UM*     ( u u -- ud )
                                   1918 ;       Unsigned multiply. Return double product.
      008A2E 8A 23                 1919         .word      LINK
                           0009B0  1920 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008A30 03                    1921         .byte      3
      008A31 55 4D 2A              1922         .ascii     "UM*"
      008A34                       1923 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                                   1924 ; take advantage of SP addressing modes
                                   1925 ; these PRODx in RAM are not required
                                   1926 ; the product is kept on stack as local variable 
                                   1927         ;; bytes offset on data stack 
                           000002  1928         da=2 
                           000003  1929         db=3 
                           000000  1930         dc=0 
                           000001  1931         dd=1 
                                   1932         ;; product bytes offset on return stack 
                           000001  1933         UD1=1  ; ud bits 31..24
                           000002  1934         UD2=2  ; ud bits 23..16
                           000003  1935         UD3=3  ; ud bits 15..8 
                           000004  1936         UD4=4  ; ud bits 7..0 
                                   1937         ;; local variable for product set to zero   
      008A34 90 5F            [ 1] 1938         clrw y 
      008A36 90 89            [ 2] 1939         pushw y  ; bits 15..0
      008A38 90 89            [ 2] 1940         pushw y  ; bits 31..16 
      008A3A E6 03            [ 1] 1941         ld a,(db,x) ; b 
      008A3C 90 97            [ 1] 1942         ld yl,a 
      008A3E E6 01            [ 1] 1943         ld a,(dd,x)   ; d
      008A40 90 42            [ 4] 1944         mul y,a    ; b*d  
      008A42 17 03            [ 2] 1945         ldw (UD3,sp),y ; lowest weight product 
      008A44 E6 03            [ 1] 1946         ld a,(db,x)
      008A46 90 97            [ 1] 1947         ld yl,a 
      008A48 E6 00            [ 1] 1948         ld a,(dc,x)
      008A4A 90 42            [ 4] 1949         mul y,a  ; b*c 
                                   1950         ;;; do the partial sum 
      008A4C 72 F9 02         [ 2] 1951         addw y,(UD2,sp)
      008A4F 4F               [ 1] 1952         clr a 
      008A50 49               [ 1] 1953         rlc a
      008A51 6B 01            [ 1] 1954         ld (UD1,sp),a 
      008A53 17 02            [ 2] 1955         ldw (UD2,sp),y 
      008A55 E6 02            [ 1] 1956         ld a,(da,x)
      008A57 90 97            [ 1] 1957         ld yl,a 
      008A59 E6 01            [ 1] 1958         ld a,(dd,x)
      008A5B 90 42            [ 4] 1959         mul y,a   ; a*d 
                                   1960         ;; do partial sum 
      008A5D 72 F9 02         [ 2] 1961         addw y,(UD2,sp)
      008A60 4F               [ 1] 1962         clr a 
      008A61 19 01            [ 1] 1963         adc a,(UD1,sp)
      008A63 6B 01            [ 1] 1964         ld (UD1,sp),a  
      008A65 17 02            [ 2] 1965         ldw (UD2,sp),y 
      008A67 E6 02            [ 1] 1966         ld a,(da,x)
      008A69 90 97            [ 1] 1967         ld yl,a 
      008A6B E6 00            [ 1] 1968         ld a,(dc,x)
      008A6D 90 42            [ 4] 1969         mul y,a  ;  a*c highest weight product 
                                   1970         ;;; do partial sum 
      008A6F 72 F9 01         [ 2] 1971         addw y,(UD1,sp)
      008A72 FF               [ 2] 1972         ldw (x),y  ; udh 
      008A73 16 03            [ 2] 1973         ldw y,(UD3,sp)
      008A75 EF 02            [ 2] 1974         ldw (2,x),y  ; udl  
      008A77 5B 04            [ 2] 1975         addw sp,#4 ; drop local variable 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008A79 81               [ 4] 1976         ret  
                                   1977 
                                   1978 
                                   1979 ;       *       ( n n -- n )
                                   1980 ;       Signed multiply. Return single product.
      008A7A 8A 30                 1981         .word      LINK
                           0009FC  1982 LINK = . 
      008A7C 01                    1983         .byte      1
      008A7D 2A                    1984         .ascii     "*"
      008A7E                       1985 STAR:
      008A7E CD 8A 34         [ 4] 1986 	CALL	UMSTA
      008A81 CC 86 00         [ 2] 1987 	JP	DROP
                                   1988 
                                   1989 ;       M*      ( n n -- d )
                                   1990 ;       Signed multiply. Return double product.
      008A84 8A 7C                 1991         .word      LINK
                           000A06  1992 LINK = . 
      008A86 02                    1993         .byte      2
      008A87 4D 2A                 1994         .ascii     "M*"
      008A89                       1995 MSTAR:      
      008A89 CD 87 F0         [ 4] 1996         CALL	DDUP
      008A8C CD 86 7F         [ 4] 1997         CALL	XORR
      008A8F CD 86 43         [ 4] 1998         CALL	ZLESS
      008A92 CD 85 D3         [ 4] 1999         CALL	TOR
      008A95 CD 88 98         [ 4] 2000         CALL	ABSS
      008A98 CD 86 1A         [ 4] 2001         CALL	SWAPP
      008A9B CD 88 98         [ 4] 2002         CALL	ABSS
      008A9E CD 8A 34         [ 4] 2003         CALL	UMSTA
      008AA1 CD 85 B4         [ 4] 2004         CALL	RFROM
      008AA4 CD 85 18         [ 4] 2005         CALL	QBRAN
      008AA7 8A AC                 2006         .word	MSTA1
      008AA9 CD 88 42         [ 4] 2007         CALL	DNEGA
      008AAC 81               [ 4] 2008 MSTA1:	RET
                                   2009 
                                   2010 ;       */MOD   ( n1 n2 n3 -- r q )
                                   2011 ;       Multiply n1 and n2, then divide
                                   2012 ;       by n3. Return mod and quotient.
      008AAD 8A 86                 2013         .word      LINK
                           000A2F  2014 LINK = . 
      008AAF 05                    2015         .byte      5
      008AB0 2A 2F 4D 4F 44        2016         .ascii     "*/MOD"
      008AB5                       2017 SSMOD:
      008AB5 CD 85 D3         [ 4] 2018         CALL     TOR
      008AB8 CD 8A 89         [ 4] 2019         CALL     MSTAR
      008ABB CD 85 B4         [ 4] 2020         CALL     RFROM
      008ABE CC 89 B9         [ 2] 2021         JP     MSMOD
                                   2022 
                                   2023 ;       */      ( n1 n2 n3 -- q )
                                   2024 ;       Multiply n1 by n2, then divide
                                   2025 ;       by n3. Return quotient only.
      008AC1 8A AF                 2026         .word      LINK
                           000A43  2027 LINK = . 
      008AC3 02                    2028         .byte      2
      008AC4 2A 2F                 2029         .ascii     "*/"
      008AC6                       2030 STASL:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008AC6 CD 8A B5         [ 4] 2031         CALL	SSMOD
      008AC9 CD 86 1A         [ 4] 2032         CALL	SWAPP
      008ACC CC 86 00         [ 2] 2033         JP	DROP
                                   2034 
                                   2035 ;; Miscellaneous
                                   2036 
                                   2037 ;       CELL+   ( a -- a )
                                   2038 ;       Add cell size in byte to address.
      008ACF 8A C3                 2039         .word      LINK
                           000A51  2040 LINK = . 
      008AD1 02                    2041         .byte       2
      008AD2 32 2B                 2042         .ascii     "2+"
      008AD4                       2043 CELLP:
      008AD4 90 93            [ 1] 2044         LDW Y,X
      008AD6 90 FE            [ 2] 2045 	LDW Y,(Y)
      008AD8 72 A9 00 02      [ 2] 2046         ADDW Y,#CELLL 
      008ADC FF               [ 2] 2047         LDW (X),Y
      008ADD 81               [ 4] 2048         RET
                                   2049 
                                   2050 ;       CELL-   ( a -- a )
                                   2051 ;       Subtract 2 from address.
      008ADE 8A D1                 2052         .word      LINK
                           000A60  2053 LINK = . 
      008AE0 02                    2054         .byte       2
      008AE1 32 2D                 2055         .ascii     "2-"
      008AE3                       2056 CELLM:
      008AE3 90 93            [ 1] 2057         LDW Y,X
      008AE5 90 FE            [ 2] 2058 	LDW Y,(Y)
      008AE7 72 A2 00 02      [ 2] 2059         SUBW Y,#CELLL
      008AEB FF               [ 2] 2060         LDW (X),Y
      008AEC 81               [ 4] 2061         RET
                                   2062 
                                   2063 ;       CELLS   ( n -- n )
                                   2064 ;       Multiply tos by 2.
      008AED 8A E0                 2065         .word      LINK
                           000A6F  2066 LINK = . 
      008AEF 02                    2067         .byte       2
      008AF0 32 2A                 2068         .ascii     "2*"
      008AF2                       2069 CELLS:
      008AF2 90 93            [ 1] 2070         LDW Y,X
      008AF4 90 FE            [ 2] 2071 	LDW Y,(Y)
      008AF6 90 58            [ 2] 2072         SLAW Y
      008AF8 FF               [ 2] 2073         LDW (X),Y
      008AF9 81               [ 4] 2074         RET
                                   2075 
                                   2076 ;       1+      ( a -- a )
                                   2077 ;       Add cell size in byte to address.
      008AFA 8A EF                 2078         .word      LINK
                           000A7C  2079 LINK = . 
      008AFC 02                    2080         .byte      2
      008AFD 31 2B                 2081         .ascii     "1+"
      008AFF                       2082 ONEP:
      008AFF 90 93            [ 1] 2083         LDW Y,X
      008B01 90 FE            [ 2] 2084 	LDW Y,(Y)
      008B03 90 5C            [ 1] 2085         INCW Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008B05 FF               [ 2] 2086         LDW (X),Y
      008B06 81               [ 4] 2087         RET
                                   2088 
                                   2089 ;       1-      ( a -- a )
                                   2090 ;       Subtract 2 from address.
      008B07 8A FC                 2091         .word      LINK
                           000A89  2092 LINK = . 
      008B09 02                    2093         .byte      2
      008B0A 31 2D                 2094         .ascii     "1-"
      008B0C                       2095 ONEM:
      008B0C 90 93            [ 1] 2096         LDW Y,X
      008B0E 90 FE            [ 2] 2097 	LDW Y,(Y)
      008B10 90 5A            [ 2] 2098         DECW Y
      008B12 FF               [ 2] 2099         LDW (X),Y
      008B13 81               [ 4] 2100         RET
                                   2101 
                                   2102 ;  shift left n times 
                                   2103 ; LSHIFT ( n1 n2 -- n1<<n2 )
      008B14 8B 09                 2104         .word LINK 
                           000A96  2105         LINK=.
      008B16 06                    2106         .byte 6 
      008B17 4C 53 48 49 46 54     2107         .ascii "LSHIFT"
      008B1D                       2108 LSHIFT:
      008B1D E6 01            [ 1] 2109         ld a,(1,x)
      008B1F 1C 00 02         [ 2] 2110         addw x,#CELLL 
      008B22 90 93            [ 1] 2111         ldw y,x 
      008B24 90 FE            [ 2] 2112         ldw y,(y)
      008B26                       2113 LSHIFT1:
      008B26 4D               [ 1] 2114         tnz a 
      008B27 27 05            [ 1] 2115         jreq LSHIFT4 
      008B29 90 58            [ 2] 2116         sllw y 
      008B2B 4A               [ 1] 2117         dec a 
      008B2C 20 F8            [ 2] 2118         jra LSHIFT1 
      008B2E                       2119 LSHIFT4:
      008B2E FF               [ 2] 2120         ldw (x),y 
      008B2F 81               [ 4] 2121         ret 
                                   2122 
                                   2123 ; shift right n times                 
                                   2124 ; RSHIFT (n1 n2 -- n1>>n2 )
      008B30 8B 16                 2125         .word LINK 
                           000AB2  2126         LINK=.
      008B32 06                    2127         .byte 6
      008B33 52 53 48 49 46 54     2128         .ascii "RSHIFT"
      008B39                       2129 RSHIFT:
      008B39 E6 01            [ 1] 2130         ld a,(1,x)
      008B3B 1C 00 02         [ 2] 2131         addw x,#CELLL 
      008B3E 90 93            [ 1] 2132         ldw y,x 
      008B40 90 FE            [ 2] 2133         ldw y,(y)
      008B42                       2134 RSHIFT1:
      008B42 4D               [ 1] 2135         tnz a 
      008B43 27 05            [ 1] 2136         jreq RSHIFT4 
      008B45 90 54            [ 2] 2137         srlw y 
      008B47 4A               [ 1] 2138         dec a 
      008B48 20 F8            [ 2] 2139         jra RSHIFT1 
      008B4A                       2140 RSHIFT4:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008B4A FF               [ 2] 2141         ldw (x),y 
      008B4B 81               [ 4] 2142         ret 
                                   2143 
                                   2144 
                                   2145 ;       2/      ( n -- n )
                                   2146 ;       divide  tos by 2.
      008B4C 8B 32                 2147         .word      LINK
                           000ACE  2148 LINK = . 
      008B4E 02                    2149         .byte      2
      008B4F 32 2F                 2150         .ascii     "2/"
      008B51                       2151 TWOSL:
      008B51 90 93            [ 1] 2152         LDW Y,X
      008B53 90 FE            [ 2] 2153 	LDW Y,(Y)
      008B55 90 57            [ 2] 2154         SRAW Y
      008B57 FF               [ 2] 2155         LDW (X),Y
      008B58 81               [ 4] 2156         RET
                                   2157 
                                   2158 ;       BL      ( -- 32 )
                                   2159 ;       Return 32,  blank character.
      008B59 8B 4E                 2160         .word      LINK
                           000ADB  2161 LINK = . 
      008B5B 02                    2162         .byte      2
      008B5C 42 4C                 2163         .ascii     "BL"
      008B5E                       2164 BLANK:
      008B5E 1D 00 02         [ 2] 2165         SUBW X,#2
      008B61 90 AE 00 20      [ 2] 2166 	LDW Y,#32
      008B65 FF               [ 2] 2167         LDW (X),Y
      008B66 81               [ 4] 2168         RET
                                   2169 
                                   2170 ;         0     ( -- 0)
                                   2171 ;         Return 0.
      008B67 8B 5B                 2172         .word      LINK
                           000AE9  2173 LINK = . 
      008B69 01                    2174         .byte       1
      008B6A 30                    2175         .ascii     "0"
      008B6B                       2176 ZERO:
      008B6B 1D 00 02         [ 2] 2177         SUBW X,#2
      008B6E 90 5F            [ 1] 2178 	CLRW Y
      008B70 FF               [ 2] 2179         LDW (X),Y
      008B71 81               [ 4] 2180         RET
                                   2181 
                                   2182 ;         1     ( -- 1)
                                   2183 ;         Return 1.
      008B72 8B 69                 2184         .word      LINK
                           000AF4  2185 LINK = . 
      008B74 01                    2186         .byte       1
      008B75 31                    2187         .ascii     "1"
      008B76                       2188 ONE:
      008B76 1D 00 02         [ 2] 2189         SUBW X,#2
      008B79 90 AE 00 01      [ 2] 2190 	LDW Y,#1
      008B7D FF               [ 2] 2191         LDW (X),Y
      008B7E 81               [ 4] 2192         RET
                                   2193 
                                   2194 ;         -1    ( -- -1)
                                   2195 ;         Return 32,  blank character.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008B7F 8B 74                 2196         .word      LINK
                           000B01  2197 LINK = . 
      008B81 02                    2198         .byte       2
      008B82 2D 31                 2199         .ascii     "-1"
      008B84                       2200 MONE:
      008B84 1D 00 02         [ 2] 2201         SUBW X,#2
      008B87 90 AE FF FF      [ 2] 2202 	LDW Y,#0xFFFF
      008B8B FF               [ 2] 2203         LDW (X),Y
      008B8C 81               [ 4] 2204         RET
                                   2205 
                                   2206 ;       >CHAR   ( c -- c )
                                   2207 ;       Filter non-printing characters.
      008B8D 8B 81                 2208         .word      LINK
                           000B0F  2209 LINK = . 
      008B8F 05                    2210         .byte      5
      008B90 3E 43 48 41 52        2211         .ascii     ">CHAR"
      008B95                       2212 TCHAR:
      008B95 E6 01            [ 1] 2213         ld a,(1,x)
      008B97 A1 20            [ 1] 2214         cp a,#32  
      008B99 2B 05            [ 1] 2215         jrmi 1$ 
      008B9B A1 7F            [ 1] 2216         cp a,#127 
      008B9D 2A 01            [ 1] 2217         jrpl 1$ 
      008B9F 81               [ 4] 2218         ret 
      008BA0 A6 5F            [ 1] 2219 1$:     ld a,#'_ 
      008BA2 E7 01            [ 1] 2220         ld (1,x),a 
      008BA4 81               [ 4] 2221         ret 
                                   2222 
                                   2223 ;       DEPTH   ( -- n )
                                   2224 ;       Return  depth of  data stack.
      008BA5 8B 8F                 2225         .word      LINK
                           000B27  2226 LINK = . 
      008BA7 05                    2227         .byte      5
      008BA8 44 45 50 54 48        2228         .ascii     "DEPTH"
      008BAD                       2229 DEPTH: 
      008BAD 90 BE 2A         [ 2] 2230         LDW Y,SP0    ;save data stack ptr
      008BB0 BF 22            [ 2] 2231 	LDW XTEMP,X
      008BB2 72 B2 00 22      [ 2] 2232         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008BB6 90 57            [ 2] 2233         SRAW Y    ;Y = #stack items
      008BB8 1D 00 02         [ 2] 2234 	SUBW X,#2
      008BBB FF               [ 2] 2235         LDW (X),Y     ; if neg, underflow
      008BBC 81               [ 4] 2236         RET
                                   2237 
                                   2238 ;       PICK    ( ... +n -- ... w )
                                   2239 ;       Copy  nth stack item to tos.
      008BBD 8B A7                 2240         .word      LINK
                           000B3F  2241 LINK = . 
      008BBF 04                    2242         .byte      4
      008BC0 50 49 43 4B           2243         .ascii     "PICK"
      008BC4                       2244 PICK:
      008BC4 90 93            [ 1] 2245         LDW Y,X   ;D = n1
      008BC6 90 FE            [ 2] 2246         LDW Y,(Y)
                                   2247 ; modified for standard compliance          
                                   2248 ; 0 PICK must be equivalent to DUP 
      008BC8 90 5C            [ 1] 2249         INCW Y 
      008BCA 90 58            [ 2] 2250         SLAW Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008BCC BF 22            [ 2] 2251         LDW XTEMP,X
      008BCE 72 B9 00 22      [ 2] 2252         ADDW Y,XTEMP
      008BD2 90 FE            [ 2] 2253         LDW Y,(Y)
      008BD4 FF               [ 2] 2254         LDW (X),Y
      008BD5 81               [ 4] 2255         RET
                                   2256 
                                   2257 ;; Memory access
                                   2258 
                                   2259 ;       +!      ( n a -- )
                                   2260 ;       Add n to  contents at address a.
      008BD6 8B BF                 2261         .word      LINK
                           000B58  2262 LINK = . 
      008BD8 02                    2263         .byte      2
      008BD9 2B 21                 2264         .ascii     "+!"
      008BDB                       2265 PSTOR:
      008BDB 90 93            [ 1] 2266         ldw y,x 
      008BDD 90 FE            [ 2] 2267         ldw y,(y)
      008BDF 90 BF 24         [ 2] 2268         ldw YTEMP,y  ; address
      008BE2 90 FE            [ 2] 2269         ldw y,(y)  
      008BE4 90 89            [ 2] 2270         pushw y  ; value at address 
      008BE6 90 93            [ 1] 2271         ldw y,x 
      008BE8 90 EE 02         [ 2] 2272         ldw y,(2,y) ; n 
      008BEB 72 F9 01         [ 2] 2273         addw y,(1,sp) ; n+value
      008BEE 91 CF 24         [ 5] 2274         ldw [YTEMP],y ;  a!
      008BF1 90 85            [ 2] 2275         popw y    ;drop local var
      008BF3 1C 00 04         [ 2] 2276         addw x,#4 ; DDROP 
      008BF6 81               [ 4] 2277         ret 
                                   2278 
                                   2279 ;       2!      ( d a -- )
                                   2280 ;       Store  double integer to address a.
      008BF7 8B D8                 2281         .word      LINK
                           000B79  2282 LINK = . 
      008BF9 02                    2283         .byte      2
      008BFA 32 21                 2284         .ascii     "2!"
      008BFC                       2285 DSTOR:
      008BFC 90 93            [ 1] 2286         ldw y,x 
      008BFE 90 FE            [ 2] 2287         ldw y,(y)
      008C00 90 BF 24         [ 2] 2288         ldw YTEMP,y ; address 
      008C03 1C 00 02         [ 2] 2289         addw x,#CELLL ; drop a 
      008C06 90 93            [ 1] 2290         ldw y,x 
      008C08 90 FE            [ 2] 2291         ldw y,(y) ; hi word 
      008C0A 89               [ 2] 2292         pushw x 
      008C0B EE 02            [ 2] 2293         ldw x,(2,x) ; lo word 
      008C0D 91 CF 24         [ 5] 2294         ldw [YTEMP],y
      008C10 90 93            [ 1] 2295         ldw y,x 
      008C12 AE 00 02         [ 2] 2296         ldw x,#2 
      008C15 92 DF 24         [ 5] 2297         ldw ([YTEMP],x),y 
      008C18 85               [ 2] 2298         popw x 
      008C19 1C 00 04         [ 2] 2299         addw x,#4 ; DDROP 
      008C1C 81               [ 4] 2300         ret 
                                   2301 
                                   2302 ;       2@      ( a -- d )
                                   2303 ;       Fetch double integer from address a.
      008C1D 8B F9                 2304         .word      LINK
                           000B9F  2305 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008C1F 02                    2306         .byte      2
      008C20 32 40                 2307         .ascii     "2@"
      008C22                       2308 DAT:
      008C22 90 93            [ 1] 2309         ldw y,x 
      008C24 90 FE            [ 2] 2310         ldw y,(y) ;address 
      008C26 90 BF 24         [ 2] 2311         ldw YTEMP,y 
      008C29 1D 00 02         [ 2] 2312         subw x,#CELLL ; space for udh 
      008C2C 91 CE 24         [ 5] 2313         ldw y,[YTEMP] ; udh 
      008C2F FF               [ 2] 2314         ldw (x),y 
      008C30 90 AE 00 02      [ 2] 2315         ldw y,#2
      008C34 91 DE 24         [ 5] 2316         ldw y,([YTEMP],y) ; udl 
      008C37 EF 02            [ 2] 2317         ldw (2,x),y
      008C39 81               [ 4] 2318         ret 
                                   2319 
                                   2320 ;       COUNT   ( b -- b +n )
                                   2321 ;       Return count byte of a string
                                   2322 ;       and add 1 to byte address.
      008C3A 8C 1F                 2323         .word      LINK
                           000BBC  2324 LINK = . 
      008C3C 05                    2325         .byte      5
      008C3D 43 4F 55 4E 54        2326         .ascii     "COUNT"
      008C42                       2327 COUNT:
      008C42 90 93            [ 1] 2328         ldw y,x 
      008C44 90 FE            [ 2] 2329         ldw y,(y) ; address 
      008C46 90 F6            [ 1] 2330         ld a,(y)  ; count 
      008C48 90 5C            [ 1] 2331         incw y 
      008C4A FF               [ 2] 2332         ldw (x),y 
      008C4B 1D 00 02         [ 2] 2333         subw x,#CELLL 
      008C4E E7 01            [ 1] 2334         ld (1,x),a 
      008C50 7F               [ 1] 2335         clr (x)
      008C51 81               [ 4] 2336         ret 
                                   2337 
                                   2338 ;       HERE    ( -- a )
                                   2339 ;       Return  top of  variables
      008C52 8C 3C                 2340         .word      LINK
                           000BD4  2341 LINK = . 
      008C54 04                    2342         .byte      4
      008C55 48 45 52 45           2343         .ascii     "HERE"
      008C59                       2344 HERE:
      008C59 90 AE 00 16      [ 2] 2345       	ldw y,#UVP 
      008C5D 90 FE            [ 2] 2346         ldw y,(y)
      008C5F 1D 00 02         [ 2] 2347         subw x,#CELLL 
      008C62 FF               [ 2] 2348         ldw (x),y 
      008C63 81               [ 4] 2349         ret 
                                   2350 
                                   2351 ;       PAD     ( -- a )
                                   2352 ;       Return address of text buffer
                                   2353 ;       above  code dictionary.
      008C64 8C 54                 2354         .word      LINK
                           000BE6  2355 LINK = . 
      008C66 03                    2356         .byte      3
      008C67 50 41 44              2357         .ascii     "PAD"
      008C6A                       2358 PAD:
      008C6A CD 8C 59         [ 4] 2359         CALL     HERE
      008C6D CD 84 E5         [ 4] 2360         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008C70 00 50                 2361         .word      80
      008C72 CC 88 05         [ 2] 2362         JP     PLUS
                                   2363 
                                   2364 ;       TIB     ( -- a )
                                   2365 ;       Return address of terminal input buffer.
      008C75 8C 66                 2366         .word      LINK
                           000BF7  2367 LINK = . 
      008C77 03                    2368         .byte      3
      008C78 54 49 42              2369         .ascii     "TIB"
      008C7B                       2370 TIB:
      008C7B CD 86 F5         [ 4] 2371         CALL     NTIB
      008C7E CD 8A D4         [ 4] 2372         CALL     CELLP
      008C81 CC 85 63         [ 2] 2373         JP     AT
                                   2374 
                                   2375 ;       @EXECUTE        ( a -- )
                                   2376 ;       Execute vector stored in address a.
      008C84 8C 77                 2377         .word      LINK
                           000C06  2378 LINK = . 
      008C86 08                    2379         .byte      8
      008C87 40 45 58 45 43 55 54  2380         .ascii     "@EXECUTE"
             45
      008C8F                       2381 ATEXE:
      008C8F CD 85 63         [ 4] 2382         CALL     AT
      008C92 CD 87 B4         [ 4] 2383         CALL     QDUP    ;?address or zero
      008C95 CD 85 18         [ 4] 2384         CALL     QBRAN
      008C98 8C 9D                 2385         .word      EXE1
      008C9A CD 85 3F         [ 4] 2386         CALL     EXECU   ;execute if non-zero
      008C9D 81               [ 4] 2387 EXE1:   RET     ;do nothing if zero
                                   2388 
                                   2389 ;       CMOVE   ( b1 b2 u -- )
                                   2390 ;       Copy u bytes from b1 to b2.
      008C9E 8C 86                 2391         .word      LINK
                           000C20  2392 LINK = . 
      008CA0 05                    2393         .byte      5
      008CA1 43 4D 4F 56 45        2394         .ascii     "CMOVE"
      008CA6                       2395 CMOVE:
      008CA6 CD 85 D3         [ 4] 2396         CALL	TOR
      008CA9 CD 85 2F         [ 4] 2397         CALL	BRAN
      008CAC 8C C6                 2398         .word	CMOV2
      008CAE CD 85 D3         [ 4] 2399 CMOV1:	CALL	TOR
      008CB1 CD 86 0A         [ 4] 2400         CALL	DUPP
      008CB4 CD 85 81         [ 4] 2401         CALL	CAT
      008CB7 CD 85 C7         [ 4] 2402         CALL	RAT
      008CBA CD 85 70         [ 4] 2403         CALL	CSTOR
      008CBD CD 8A FF         [ 4] 2404         CALL	ONEP
      008CC0 CD 85 B4         [ 4] 2405         CALL	RFROM
      008CC3 CD 8A FF         [ 4] 2406         CALL	ONEP
      008CC6 CD 84 F9         [ 4] 2407 CMOV2:	CALL	DONXT
      008CC9 8C AE                 2408         .word	CMOV1
      008CCB CC 87 E5         [ 2] 2409         JP	DDROP
                                   2410 
                                   2411 ;       FILL    ( b u c -- )
                                   2412 ;       Fill u bytes of character c
                                   2413 ;       to area beginning at b.
      008CCE 8C A0                 2414         .word       LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                           000C50  2415 LINK = . 
      008CD0 04                    2416         .byte       4
      008CD1 46 49 4C 4C           2417         .ascii     "FILL"
      008CD5                       2418 FILL:
      008CD5 90 93            [ 1] 2419         ldw y,x 
      008CD7 90 E6 01         [ 1] 2420         ld a,(1,y) ; c 
      008CDA 1C 00 02         [ 2] 2421         addw x,#CELLL ; drop c 
      008CDD 90 93            [ 1] 2422         ldw y,x 
      008CDF 90 FE            [ 2] 2423         ldw y,(y) ; count
      008CE1 90 89            [ 2] 2424         pushw y 
      008CE3 1C 00 02         [ 2] 2425         addw x,#CELLL ; drop u 
      008CE6 90 93            [ 1] 2426         ldw y,x 
      008CE8 1C 00 02         [ 2] 2427         addw x,#CELLL ; drop b 
      008CEB 90 FE            [ 2] 2428         ldw y,(y) ; address
      008CED 90 BF 24         [ 2] 2429         ldw YTEMP,y
      008CF0 90 85            [ 2] 2430         popw y ; count 
      008CF2                       2431 FILL1:  
      008CF2 92 C7 24         [ 4] 2432         ld [YTEMP],a 
      008CF5 3C 25            [ 1] 2433         inc YTEMP+1
      008CF7 24 02            [ 1] 2434         jrnc FILL2 
      008CF9 3C 24            [ 1] 2435         inc YTEMP
      008CFB                       2436 FILL2: 
      008CFB 90 5A            [ 2] 2437         decw y ; count 
      008CFD 26 F3            [ 1] 2438         jrne FILL1  
      008CFF 81               [ 4] 2439         ret 
                                   2440 
                                   2441 ;       ERASE   ( b u -- )
                                   2442 ;       Erase u bytes beginning at b.
      008D00 8C D0                 2443         .word      LINK
                           000C82  2444 LINK = . 
      008D02 05                    2445         .byte      5
      008D03 45 52 41 53 45        2446         .ascii     "ERASE"
      008D08                       2447 ERASE:
      008D08 90 5F            [ 1] 2448         clrw y 
      008D0A 1D 00 02         [ 2] 2449         subw x,#CELLL 
      008D0D FF               [ 2] 2450         ldw (x),y 
      008D0E CC 8C D5         [ 2] 2451         jp FILL 
                                   2452 
                                   2453 
                                   2454 ;       PACK0   ( b u a -- a )
                                   2455 ;       Build a counted string with
                                   2456 ;       u characters from b. Null fill.
      008D11 8D 02                 2457         .word      LINK
                           000C93  2458 LINK = . 
      008D13 05                    2459         .byte      5
      008D14 50 41 43 4B 30        2460         .ascii     "PACK0"
      008D19                       2461 PACKS:
      008D19 CD 86 0A         [ 4] 2462         CALL     DUPP
      008D1C CD 85 D3         [ 4] 2463         CALL     TOR     ;strings only on cell boundary
      008D1F CD 87 F0         [ 4] 2464         CALL     DDUP
      008D22 CD 85 70         [ 4] 2465         CALL     CSTOR
      008D25 CD 8A FF         [ 4] 2466         CALL     ONEP ;save count
      008D28 CD 86 1A         [ 4] 2467         CALL     SWAPP
      008D2B CD 8C A6         [ 4] 2468         CALL     CMOVE
      008D2E CD 85 B4         [ 4] 2469         CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008D31 81               [ 4] 2470         RET
                                   2471 
                                   2472 ;; Numeric output, single precision
                                   2473 
                                   2474 ;       DIGIT   ( u -- c )
                                   2475 ;       Convert digit u to a character.
      008D32 8D 13                 2476         .word      LINK
                           000CB4  2477 LINK = . 
      008D34 05                    2478         .byte      5
      008D35 44 49 47 49 54        2479         .ascii     "DIGIT"
      008D3A                       2480 DIGIT:
      008D3A CD 84 E5         [ 4] 2481         CALL	DOLIT
      008D3D 00 09                 2482         .word	9
      008D3F CD 86 34         [ 4] 2483         CALL	OVER
      008D42 CD 88 E3         [ 4] 2484         CALL	LESS
      008D45 CD 84 E5         [ 4] 2485         CALL	DOLIT
      008D48 00 07                 2486         .word	7
      008D4A CD 86 56         [ 4] 2487         CALL	ANDD
      008D4D CD 88 05         [ 4] 2488         CALL	PLUS
      008D50 CD 84 E5         [ 4] 2489         CALL	DOLIT
      008D53 00 30                 2490         .word	48	;'0'
      008D55 CC 88 05         [ 2] 2491         JP	PLUS
                                   2492 
                                   2493 ;       EXTRACT ( n base -- n c )
                                   2494 ;       Extract least significant digit from n.
      008D58 8D 34                 2495         .word      LINK
                           000CDA  2496 LINK = . 
      008D5A 07                    2497         .byte      7
      008D5B 45 58 54 52 41 43 54  2498         .ascii     "EXTRACT"
      008D62                       2499 EXTRC:
      008D62 CD 8B 6B         [ 4] 2500         CALL     ZERO
      008D65 CD 86 1A         [ 4] 2501         CALL     SWAPP
      008D68 CD 89 5B         [ 4] 2502         CALL     UMMOD
      008D6B CD 86 1A         [ 4] 2503         CALL     SWAPP
      008D6E CC 8D 3A         [ 2] 2504         JP     DIGIT
                                   2505 
                                   2506 ;       <#      ( -- )
                                   2507 ;       Initiate  numeric output process.
      008D71 8D 5A                 2508         .word      LINK
                           000CF3  2509 LINK = . 
      008D73 02                    2510         .byte      2
      008D74 3C 23                 2511         .ascii     "<#"
      008D76                       2512 BDIGS:
      008D76 CD 8C 6A         [ 4] 2513         CALL     PAD
      008D79 CD 87 37         [ 4] 2514         CALL     HLD
      008D7C CC 85 4C         [ 2] 2515         JP     STORE
                                   2516 
                                   2517 ;       HOLD    ( c -- )
                                   2518 ;       Insert a character into output string.
      008D7F 8D 73                 2519         .word      LINK
                           000D01  2520 LINK = . 
      008D81 04                    2521         .byte      4
      008D82 48 4F 4C 44           2522         .ascii     "HOLD"
      008D86                       2523 HOLD:
      008D86 CD 87 37         [ 4] 2524         CALL     HLD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008D89 CD 85 63         [ 4] 2525         CALL     AT
      008D8C CD 8B 0C         [ 4] 2526         CALL     ONEM
      008D8F CD 86 0A         [ 4] 2527         CALL     DUPP
      008D92 CD 87 37         [ 4] 2528         CALL     HLD
      008D95 CD 85 4C         [ 4] 2529         CALL     STORE
      008D98 CC 85 70         [ 2] 2530         JP     CSTOR
                                   2531 
                                   2532 ;       #       ( u -- u )
                                   2533 ;       Extract one digit from u and
                                   2534 ;       append digit to output string.
      008D9B 8D 81                 2535         .word      LINK
                           000D1D  2536 LINK = . 
      008D9D 01                    2537         .byte      1
      008D9E 23                    2538         .ascii     "#"
      008D9F                       2539 DIG:
      008D9F CD 86 C7         [ 4] 2540         CALL     BASE
      008DA2 CD 85 63         [ 4] 2541         CALL     AT
      008DA5 CD 8D 62         [ 4] 2542         CALL     EXTRC
      008DA8 CC 8D 86         [ 2] 2543         JP     HOLD
                                   2544 
                                   2545 ;       #S      ( u -- 0 )
                                   2546 ;       Convert u until all digits
                                   2547 ;       are added to output string.
      008DAB 8D 9D                 2548         .word      LINK
                           000D2D  2549 LINK = . 
      008DAD 02                    2550         .byte      2
      008DAE 23 53                 2551         .ascii     "#S"
      008DB0                       2552 DIGS:
      008DB0 CD 8D 9F         [ 4] 2553 DIGS1:  CALL     DIG
      008DB3 CD 86 0A         [ 4] 2554         CALL     DUPP
      008DB6 CD 85 18         [ 4] 2555         CALL     QBRAN
      008DB9 8D BD                 2556         .word      DIGS2
      008DBB 20 F3            [ 2] 2557         JRA     DIGS1
      008DBD 81               [ 4] 2558 DIGS2:  RET
                                   2559 
                                   2560 ;       SIGN    ( n -- )
                                   2561 ;       Add a minus sign to
                                   2562 ;       numeric output string.
      008DBE 8D AD                 2563         .word      LINK
                           000D40  2564 LINK = . 
      008DC0 04                    2565         .byte      4
      008DC1 53 49 47 4E           2566         .ascii     "SIGN"
      008DC5                       2567 SIGN:
      008DC5 CD 86 43         [ 4] 2568         CALL     ZLESS
      008DC8 CD 85 18         [ 4] 2569         CALL     QBRAN
      008DCB 8D D5                 2570         .word      SIGN1
      008DCD CD 84 E5         [ 4] 2571         CALL     DOLIT
      008DD0 00 2D                 2572         .word      45	;"-"
      008DD2 CC 8D 86         [ 2] 2573         JP     HOLD
      008DD5 81               [ 4] 2574 SIGN1:  RET
                                   2575 
                                   2576 ;       #>      ( w -- b u )
                                   2577 ;       Prepare output string.
      008DD6 8D C0                 2578         .word      LINK
                           000D58  2579 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008DD8 02                    2580         .byte      2
      008DD9 23 3E                 2581         .ascii     "#>"
      008DDB                       2582 EDIGS:
      008DDB CD 86 00         [ 4] 2583         CALL     DROP
      008DDE CD 87 37         [ 4] 2584         CALL     HLD
      008DE1 CD 85 63         [ 4] 2585         CALL     AT
      008DE4 CD 8C 6A         [ 4] 2586         CALL     PAD
      008DE7 CD 86 34         [ 4] 2587         CALL     OVER
      008DEA CC 88 7E         [ 2] 2588         JP     SUBB
                                   2589 
                                   2590 ;       str     ( w -- b u )
                                   2591 ;       Convert a signed integer
                                   2592 ;       to a numeric string.
      008DED 8D D8                 2593         .word      LINK
                           000D6F  2594 LINK = . 
      008DEF 03                    2595         .byte      3
      008DF0 53 54 52              2596         .ascii     "STR"
      008DF3                       2597 STR:
      008DF3 CD 86 0A         [ 4] 2598         CALL     DUPP
      008DF6 CD 85 D3         [ 4] 2599         CALL     TOR
      008DF9 CD 88 98         [ 4] 2600         CALL     ABSS
      008DFC CD 8D 76         [ 4] 2601         CALL     BDIGS
      008DFF CD 8D B0         [ 4] 2602         CALL     DIGS
      008E02 CD 85 B4         [ 4] 2603         CALL     RFROM
      008E05 CD 8D C5         [ 4] 2604         CALL     SIGN
      008E08 CC 8D DB         [ 2] 2605         JP     EDIGS
                                   2606 
                                   2607 ;       HEX     ( -- )
                                   2608 ;       Use radix 16 as base for
                                   2609 ;       numeric conversions.
      008E0B 8D EF                 2610         .word      LINK
                           000D8D  2611 LINK = . 
      008E0D 03                    2612         .byte      3
      008E0E 48 45 58              2613         .ascii     "HEX"
      008E11                       2614 HEX:
      008E11 CD 84 E5         [ 4] 2615         CALL     DOLIT
      008E14 00 10                 2616         .word      16
      008E16 CD 86 C7         [ 4] 2617         CALL     BASE
      008E19 CC 85 4C         [ 2] 2618         JP     STORE
                                   2619 
                                   2620 ;       DECIMAL ( -- )
                                   2621 ;       Use radix 10 as base
                                   2622 ;       for numeric conversions.
      008E1C 8E 0D                 2623         .word      LINK
                           000D9E  2624 LINK = . 
      008E1E 07                    2625         .byte      7
      008E1F 44 45 43 49 4D 41 4C  2626         .ascii     "DECIMAL"
      008E26                       2627 DECIM:
      008E26 CD 84 E5         [ 4] 2628         CALL     DOLIT
      008E29 00 0A                 2629         .word      10
      008E2B CD 86 C7         [ 4] 2630         CALL     BASE
      008E2E CC 85 4C         [ 2] 2631         JP     STORE
                                   2632 
                                   2633 ;; Numeric input, single precision
                                   2634 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2635 ;       DIGIT?  ( c base -- u t )
                                   2636 ;       Convert a character to its numeric
                                   2637 ;       value. A flag indicates success.
      008E31 8E 1E                 2638         .word      LINK
                           000DB3  2639 LINK = . 
      008E33 06                    2640         .byte       6
      008E34 44 49 47 49 54 3F     2641         .ascii     "DIGIT?"
      008E3A                       2642 DIGTQ:
      008E3A CD 85 D3         [ 4] 2643         CALL     TOR
      008E3D CD 84 E5         [ 4] 2644         CALL     DOLIT
      008E40 00 30                 2645         .word     48	; "0"
      008E42 CD 88 7E         [ 4] 2646         CALL     SUBB
      008E45 CD 84 E5         [ 4] 2647         CALL     DOLIT
      008E48 00 09                 2648         .word      9
      008E4A CD 86 34         [ 4] 2649         CALL     OVER
      008E4D CD 88 E3         [ 4] 2650         CALL     LESS
      008E50 CD 85 18         [ 4] 2651         CALL     QBRAN
      008E53 8E 6B                 2652         .word      DGTQ1
      008E55 CD 84 E5         [ 4] 2653         CALL     DOLIT
      008E58 00 07                 2654         .word      7
      008E5A CD 88 7E         [ 4] 2655         CALL     SUBB
      008E5D CD 86 0A         [ 4] 2656         CALL     DUPP
      008E60 CD 84 E5         [ 4] 2657         CALL     DOLIT
      008E63 00 0A                 2658         .word      10
      008E65 CD 88 E3         [ 4] 2659         CALL     LESS
      008E68 CD 86 6A         [ 4] 2660         CALL     ORR
      008E6B CD 86 0A         [ 4] 2661 DGTQ1:  CALL     DUPP
      008E6E CD 85 B4         [ 4] 2662         CALL     RFROM
      008E71 CC 88 C5         [ 2] 2663         JP     ULESS
                                   2664 
                                   2665 ;       NUMBER? ( a -- n T | a F )
                                   2666 ;       Convert a number string to
                                   2667 ;       integer. Push a flag on tos.
      008E74 8E 33                 2668         .word      LINK
                           000DF6  2669 LINK = . 
      008E76 07                    2670         .byte      7
      008E77 4E 55 4D 42 45 52 3F  2671         .ascii     "NUMBER?"
      008E7E                       2672 NUMBQ:
      008E7E CD 86 C7         [ 4] 2673         CALL     BASE
      008E81 CD 85 63         [ 4] 2674         CALL     AT
      008E84 CD 85 D3         [ 4] 2675         CALL     TOR
      008E87 CD 8B 6B         [ 4] 2676         CALL     ZERO
      008E8A CD 86 34         [ 4] 2677         CALL     OVER
      008E8D CD 8C 42         [ 4] 2678         CALL     COUNT
      008E90 CD 86 34         [ 4] 2679         CALL     OVER
      008E93 CD 85 81         [ 4] 2680         CALL     CAT
      008E96 CD 84 E5         [ 4] 2681         CALL     DOLIT
      008E99 00 24                 2682         .word     36	; "0x"
      008E9B CD 88 A6         [ 4] 2683         CALL     EQUAL
      008E9E CD 85 18         [ 4] 2684         CALL     QBRAN
      008EA1 8E B2                 2685         .word      NUMQ1
      008EA3 CD 8E 11         [ 4] 2686         CALL     HEX
      008EA6 CD 86 1A         [ 4] 2687         CALL     SWAPP
      008EA9 CD 8A FF         [ 4] 2688         CALL     ONEP
      008EAC CD 86 1A         [ 4] 2689         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008EAF CD 8B 0C         [ 4] 2690         CALL     ONEM
      008EB2 CD 86 34         [ 4] 2691 NUMQ1:  CALL     OVER
      008EB5 CD 85 81         [ 4] 2692         CALL     CAT
      008EB8 CD 84 E5         [ 4] 2693         CALL     DOLIT
      008EBB 00 2D                 2694         .word     45	; "-"
      008EBD CD 88 A6         [ 4] 2695         CALL     EQUAL
      008EC0 CD 85 D3         [ 4] 2696         CALL     TOR
      008EC3 CD 86 1A         [ 4] 2697         CALL     SWAPP
      008EC6 CD 85 C7         [ 4] 2698         CALL     RAT
      008EC9 CD 88 7E         [ 4] 2699         CALL     SUBB
      008ECC CD 86 1A         [ 4] 2700         CALL     SWAPP
      008ECF CD 85 C7         [ 4] 2701         CALL     RAT
      008ED2 CD 88 05         [ 4] 2702         CALL     PLUS
      008ED5 CD 87 B4         [ 4] 2703         CALL     QDUP
      008ED8 CD 85 18         [ 4] 2704         CALL     QBRAN
      008EDB 8F 3C                 2705         .word      NUMQ6
      008EDD CD 8B 0C         [ 4] 2706         CALL     ONEM
      008EE0 CD 85 D3         [ 4] 2707         CALL     TOR
      008EE3 CD 86 0A         [ 4] 2708 NUMQ2:  CALL     DUPP
      008EE6 CD 85 D3         [ 4] 2709         CALL     TOR
      008EE9 CD 85 81         [ 4] 2710         CALL     CAT
      008EEC CD 86 C7         [ 4] 2711         CALL     BASE
      008EEF CD 85 63         [ 4] 2712         CALL     AT
      008EF2 CD 8E 3A         [ 4] 2713         CALL     DIGTQ
      008EF5 CD 85 18         [ 4] 2714         CALL     QBRAN
      008EF8 8F 2A                 2715         .word      NUMQ4
      008EFA CD 86 1A         [ 4] 2716         CALL     SWAPP
      008EFD CD 86 C7         [ 4] 2717         CALL     BASE
      008F00 CD 85 63         [ 4] 2718         CALL     AT
      008F03 CD 8A 7E         [ 4] 2719         CALL     STAR
      008F06 CD 88 05         [ 4] 2720         CALL     PLUS
      008F09 CD 85 B4         [ 4] 2721         CALL     RFROM
      008F0C CD 8A FF         [ 4] 2722         CALL     ONEP
      008F0F CD 84 F9         [ 4] 2723         CALL     DONXT
      008F12 8E E3                 2724         .word      NUMQ2
      008F14 CD 85 C7         [ 4] 2725         CALL     RAT
      008F17 CD 86 1A         [ 4] 2726         CALL     SWAPP
      008F1A CD 86 00         [ 4] 2727         CALL     DROP
      008F1D CD 85 18         [ 4] 2728         CALL     QBRAN
      008F20 8F 25                 2729         .word      NUMQ3
      008F22 CD 88 30         [ 4] 2730         CALL     NEGAT
      008F25 CD 86 1A         [ 4] 2731 NUMQ3:  CALL     SWAPP
      008F28 20 0F            [ 2] 2732         JRA     NUMQ5
      008F2A CD 85 B4         [ 4] 2733 NUMQ4:  CALL     RFROM
      008F2D CD 85 B4         [ 4] 2734         CALL     RFROM
      008F30 CD 87 E5         [ 4] 2735         CALL     DDROP
      008F33 CD 87 E5         [ 4] 2736         CALL     DDROP
      008F36 CD 8B 6B         [ 4] 2737         CALL     ZERO
      008F39 CD 86 0A         [ 4] 2738 NUMQ5:  CALL     DUPP
      008F3C CD 85 B4         [ 4] 2739 NUMQ6:  CALL     RFROM
      008F3F CD 87 E5         [ 4] 2740         CALL     DDROP
      008F42 CD 85 B4         [ 4] 2741         CALL     RFROM
      008F45 CD 86 C7         [ 4] 2742         CALL     BASE
      008F48 CC 85 4C         [ 2] 2743         JP     STORE
                                   2744 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2745 ;; Basic I/O
                                   2746 
                                   2747 ;       KEY     ( -- c )
                                   2748 ;       Wait for and return an
                                   2749 ;       input character.
      008F4B 8E 76                 2750         .word      LINK
                           000ECD  2751 LINK = . 
      008F4D 03                    2752         .byte      3
      008F4E 4B 45 59              2753         .ascii     "KEY"
      008F51                       2754 KEY:
      008F51 72 0B 52 40 FB   [ 2] 2755         btjf UART_SR,#UART_SR_RXNE,. 
      008F56 C6 52 41         [ 1] 2756         ld a,UART_DR 
      008F59 1D 00 02         [ 2] 2757         subw x,#CELLL 
      008F5C E7 01            [ 1] 2758         ld (1,x),a 
      008F5E 7F               [ 1] 2759         clr (x)
      008F5F 81               [ 4] 2760         ret 
                                   2761 
                                   2762 ;       NUF?    ( -- t )
                                   2763 ;       Return false if no input,
                                   2764 ;       else pause and if CR return true.
      008F60 8F 4D                 2765         .word      LINK
                           000EE2  2766 LINK = . 
      008F62 04                    2767         .byte      4
      008F63 4E 55 46 3F           2768         .ascii     "NUF?"
      008F67                       2769 NUFQ:
      008F67 CD 84 86         [ 4] 2770         CALL     QKEY
      008F6A CD 86 0A         [ 4] 2771         CALL     DUPP
      008F6D CD 85 18         [ 4] 2772         CALL     QBRAN
      008F70 8F 80                 2773         .word    NUFQ1
      008F72 CD 87 E5         [ 4] 2774         CALL     DDROP
      008F75 CD 8F 51         [ 4] 2775         CALL     KEY
      008F78 CD 84 E5         [ 4] 2776         CALL     DOLIT
      008F7B 00 0D                 2777         .word      CRR
      008F7D CC 88 A6         [ 2] 2778         JP     EQUAL
      008F80 81               [ 4] 2779 NUFQ1:  RET
                                   2780 
                                   2781 ;       SPACE   ( -- )
                                   2782 ;       Send  blank character to
                                   2783 ;       output device.
      008F81 8F 62                 2784         .word      LINK
                           000F03  2785 LINK = . 
      008F83 05                    2786         .byte      5
      008F84 53 50 41 43 45        2787         .ascii     "SPACE"
      008F89                       2788 SPACE:
      008F89 CD 8B 5E         [ 4] 2789         CALL     BLANK
      008F8C CC 84 A4         [ 2] 2790         JP     EMIT
                                   2791 
                                   2792 ;       SPACES  ( +n -- )
                                   2793 ;       Send n spaces to output device.
      008F8F 8F 83                 2794         .word      LINK
                           000F11  2795 LINK = . 
      008F91 06                    2796         .byte      6
      008F92 53 50 41 43 45 53     2797         .ascii     "SPACES"
      008F98                       2798 SPACS:
      008F98 CD 8B 6B         [ 4] 2799         CALL     ZERO
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008F9B CD 89 03         [ 4] 2800         CALL     MAX
      008F9E CD 85 D3         [ 4] 2801         CALL     TOR
      008FA1 20 03            [ 2] 2802         JRA      CHAR2
      008FA3 CD 8F 89         [ 4] 2803 CHAR1:  CALL     SPACE
      008FA6 CD 84 F9         [ 4] 2804 CHAR2:  CALL     DONXT
      008FA9 8F A3                 2805         .word    CHAR1
      008FAB 81               [ 4] 2806         RET
                                   2807 
                                   2808 ;       TYPE    ( b u -- )
                                   2809 ;       Output u characters from b.
      008FAC 8F 91                 2810         .word      LINK
                           000F2E  2811 LINK = . 
      008FAE 04                    2812         .byte      4
      008FAF 54 59 50 45           2813         .ascii     "TYPE"
      008FB3                       2814 TYPES:
      008FB3 CD 85 D3         [ 4] 2815         CALL     TOR
      008FB6 20 0C            [ 2] 2816         JRA     TYPE2
      008FB8 CD 86 0A         [ 4] 2817 TYPE1:  CALL     DUPP
      008FBB CD 85 81         [ 4] 2818         CALL     CAT
      008FBE CD 84 A4         [ 4] 2819         CALL     EMIT
      008FC1 CD 8A FF         [ 4] 2820         CALL     ONEP
      008FC4 CD 84 F9         [ 4] 2821 TYPE2:  CALL     DONXT
      008FC7 8F B8                 2822         .word      TYPE1
      008FC9 CC 86 00         [ 2] 2823         JP     DROP
                                   2824 
                                   2825 ;       CR      ( -- )
                                   2826 ;       Output a carriage return
                                   2827 ;       and a line feed.
      008FCC 8F AE                 2828         .word      LINK
                           000F4E  2829 LINK = . 
      008FCE 02                    2830         .byte      2
      008FCF 43 52                 2831         .ascii     "CR"
      008FD1                       2832 CR:
      008FD1 CD 84 E5         [ 4] 2833         CALL     DOLIT
      008FD4 00 0D                 2834         .word      CRR
      008FD6 CD 84 A4         [ 4] 2835         CALL     EMIT
      008FD9 CD 84 E5         [ 4] 2836         CALL     DOLIT
      008FDC 00 0A                 2837         .word      LF
      008FDE CC 84 A4         [ 2] 2838         JP     EMIT
                                   2839 
                                   2840 ;       do$     ( -- a )
                                   2841 ;       Return  address of a compiled
                                   2842 ;       string.
      008FE1 8F CE                 2843         .word      LINK
                           000F63  2844 LINK = . 
      008FE3 43                    2845 	.byte      COMPO+3
      008FE4 44 4F 24              2846         .ascii     "DO$"
      008FE7                       2847 DOSTR:
      008FE7 CD 85 B4         [ 4] 2848         CALL     RFROM
      008FEA CD 85 C7         [ 4] 2849         CALL     RAT
      008FED CD 85 B4         [ 4] 2850         CALL     RFROM
      008FF0 CD 8C 42         [ 4] 2851         CALL     COUNT
      008FF3 CD 88 05         [ 4] 2852         CALL     PLUS
      008FF6 CD 85 D3         [ 4] 2853         CALL     TOR
      008FF9 CD 86 1A         [ 4] 2854         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008FFC CD 85 D3         [ 4] 2855         CALL     TOR
      008FFF 81               [ 4] 2856         RET
                                   2857 
                                   2858 ;       $"|     ( -- a )
                                   2859 ;       Run time routine compiled by $".
                                   2860 ;       Return address of a compiled string.
      009000 8F E3                 2861         .word      LINK
                           000F82  2862 LINK = . 
      009002 43                    2863 	.byte      COMPO+3
      009003 24 22 7C              2864         .byte     '$','"','|'
      009006                       2865 STRQP:
      009006 CD 8F E7         [ 4] 2866         CALL     DOSTR
      009009 81               [ 4] 2867         RET
                                   2868 
                                   2869 ;       ."|     ( -- )
                                   2870 ;       Run time routine of ." .
                                   2871 ;       Output a compiled string.
      00900A 90 02                 2872         .word      LINK
                           000F8C  2873 LINK = . 
      00900C 43                    2874 	.byte      COMPO+3
      00900D 2E 22 7C              2875         .byte     '.','"','|'
      009010                       2876 DOTQP:
      009010 CD 8F E7         [ 4] 2877         CALL     DOSTR
      009013 CD 8C 42         [ 4] 2878         CALL     COUNT
      009016 CC 8F B3         [ 2] 2879         JP     TYPES
                                   2880 
                                   2881 ;       .R      ( n +n -- )
                                   2882 ;       Display an integer in a field
                                   2883 ;       of n columns, right justified.
      009019 90 0C                 2884         .word      LINK
                           000F9B  2885 LINK = . 
      00901B 02                    2886         .byte      2
      00901C 2E 52                 2887         .ascii     ".R"
      00901E                       2888 DOTR:
      00901E CD 85 D3         [ 4] 2889         CALL     TOR
      009021 CD 8D F3         [ 4] 2890         CALL     STR
      009024 CD 85 B4         [ 4] 2891         CALL     RFROM
      009027 CD 86 34         [ 4] 2892         CALL     OVER
      00902A CD 88 7E         [ 4] 2893         CALL     SUBB
      00902D CD 8F 98         [ 4] 2894         CALL     SPACS
      009030 CC 8F B3         [ 2] 2895         JP     TYPES
                                   2896 
                                   2897 ;       U.R     ( u +n -- )
                                   2898 ;       Display an unsigned integer
                                   2899 ;       in n column, right justified.
      009033 90 1B                 2900         .word      LINK
                           000FB5  2901 LINK = . 
      009035 03                    2902         .byte      3
      009036 55 2E 52              2903         .ascii     "U.R"
      009039                       2904 UDOTR:
      009039 CD 85 D3         [ 4] 2905         CALL     TOR
      00903C CD 8D 76         [ 4] 2906         CALL     BDIGS
      00903F CD 8D B0         [ 4] 2907         CALL     DIGS
      009042 CD 8D DB         [ 4] 2908         CALL     EDIGS
      009045 CD 85 B4         [ 4] 2909         CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      009048 CD 86 34         [ 4] 2910         CALL     OVER
      00904B CD 88 7E         [ 4] 2911         CALL     SUBB
      00904E CD 8F 98         [ 4] 2912         CALL     SPACS
      009051 CC 8F B3         [ 2] 2913         JP     TYPES
                                   2914 
                                   2915 ;       U.      ( u -- )
                                   2916 ;       Display an unsigned integer
                                   2917 ;       in free format.
      009054 90 35                 2918         .word      LINK
                           000FD6  2919 LINK = . 
      009056 02                    2920         .byte      2
      009057 55 2E                 2921         .ascii     "U."
      009059                       2922 UDOT:
      009059 CD 8D 76         [ 4] 2923         CALL     BDIGS
      00905C CD 8D B0         [ 4] 2924         CALL     DIGS
      00905F CD 8D DB         [ 4] 2925         CALL     EDIGS
      009062 CD 8F 89         [ 4] 2926         CALL     SPACE
      009065 CC 8F B3         [ 2] 2927         JP     TYPES
                                   2928 
                                   2929 ;       .       ( w -- )
                                   2930 ;       Display an integer in free
                                   2931 ;       format, preceeded by a space.
      009068 90 56                 2932         .word      LINK
                           000FEA  2933 LINK = . 
      00906A 01                    2934         .byte      1
      00906B 2E                    2935         .ascii     "."
      00906C                       2936 DOT:
      00906C CD 86 C7         [ 4] 2937         CALL     BASE
      00906F CD 85 63         [ 4] 2938         CALL     AT
      009072 CD 84 E5         [ 4] 2939         CALL     DOLIT
      009075 00 0A                 2940         .word      10
      009077 CD 86 7F         [ 4] 2941         CALL     XORR    ;?decimal
      00907A CD 85 18         [ 4] 2942         CALL     QBRAN
      00907D 90 82                 2943         .word      DOT1
      00907F CC 90 59         [ 2] 2944         JP     UDOT
      009082 CD 8D F3         [ 4] 2945 DOT1:   CALL     STR
      009085 CD 8F 89         [ 4] 2946         CALL     SPACE
      009088 CC 8F B3         [ 2] 2947         JP     TYPES
                                   2948 
                                   2949 ;       ?       ( a -- )
                                   2950 ;       Display contents in memory cell.
      00908B 90 6A                 2951         .word      LINK
                                   2952         
                           00100D  2953 LINK = . 
      00908D 01                    2954         .byte      1
      00908E 3F                    2955         .ascii     "?"
      00908F                       2956 QUEST:
      00908F CD 85 63         [ 4] 2957         CALL     AT
      009092 CC 90 6C         [ 2] 2958         JP     DOT
                                   2959 
                                   2960 ;; Parsing
                                   2961 
                                   2962 ;       parse   ( b u c -- b u delta ; <string> )
                                   2963 ;       Scan string delimited by c.
                                   2964 ;       Return found string and its offset.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009095 90 8D                 2965         .word      LINK
                           001017  2966 LINK = . 
      009097 05                    2967         .byte      5
      009098 70 61 72 73 65        2968         .ascii     "parse"
      00909D                       2969 PARS:
      00909D CD 86 D6         [ 4] 2970         CALL     TEMP
      0090A0 CD 85 4C         [ 4] 2971         CALL     STORE
      0090A3 CD 86 34         [ 4] 2972         CALL     OVER
      0090A6 CD 85 D3         [ 4] 2973         CALL     TOR
      0090A9 CD 86 0A         [ 4] 2974         CALL     DUPP
      0090AC CD 85 18         [ 4] 2975         CALL     QBRAN
      0090AF 91 55                 2976         .word    PARS8
      0090B1 CD 8B 0C         [ 4] 2977         CALL     ONEM
      0090B4 CD 86 D6         [ 4] 2978         CALL     TEMP
      0090B7 CD 85 63         [ 4] 2979         CALL     AT
      0090BA CD 8B 5E         [ 4] 2980         CALL     BLANK
      0090BD CD 88 A6         [ 4] 2981         CALL     EQUAL
      0090C0 CD 85 18         [ 4] 2982         CALL     QBRAN
      0090C3 90 F6                 2983         .word      PARS3
      0090C5 CD 85 D3         [ 4] 2984         CALL     TOR
      0090C8 CD 8B 5E         [ 4] 2985 PARS1:  CALL     BLANK
      0090CB CD 86 34         [ 4] 2986         CALL     OVER
      0090CE CD 85 81         [ 4] 2987         CALL     CAT     ;skip leading blanks ONLY
      0090D1 CD 88 7E         [ 4] 2988         CALL     SUBB
      0090D4 CD 86 43         [ 4] 2989         CALL     ZLESS
      0090D7 CD 88 1F         [ 4] 2990         CALL     INVER
      0090DA CD 85 18         [ 4] 2991         CALL     QBRAN
      0090DD 90 F3                 2992         .word      PARS2
      0090DF CD 8A FF         [ 4] 2993         CALL     ONEP
      0090E2 CD 84 F9         [ 4] 2994         CALL     DONXT
      0090E5 90 C8                 2995         .word      PARS1
      0090E7 CD 85 B4         [ 4] 2996         CALL     RFROM
      0090EA CD 86 00         [ 4] 2997         CALL     DROP
      0090ED CD 8B 6B         [ 4] 2998         CALL     ZERO
      0090F0 CC 86 0A         [ 2] 2999         JP     DUPP
      0090F3 CD 85 B4         [ 4] 3000 PARS2:  CALL     RFROM
      0090F6 CD 86 34         [ 4] 3001 PARS3:  CALL     OVER
      0090F9 CD 86 1A         [ 4] 3002         CALL     SWAPP
      0090FC CD 85 D3         [ 4] 3003         CALL     TOR
      0090FF CD 86 D6         [ 4] 3004 PARS4:  CALL     TEMP
      009102 CD 85 63         [ 4] 3005         CALL     AT
      009105 CD 86 34         [ 4] 3006         CALL     OVER
      009108 CD 85 81         [ 4] 3007         CALL     CAT
      00910B CD 88 7E         [ 4] 3008         CALL     SUBB    ;scan for delimiter
      00910E CD 86 D6         [ 4] 3009         CALL     TEMP
      009111 CD 85 63         [ 4] 3010         CALL     AT
      009114 CD 8B 5E         [ 4] 3011         CALL     BLANK
      009117 CD 88 A6         [ 4] 3012         CALL     EQUAL
      00911A CD 85 18         [ 4] 3013         CALL     QBRAN
      00911D 91 22                 3014         .word      PARS5
      00911F CD 86 43         [ 4] 3015         CALL     ZLESS
      009122 CD 85 18         [ 4] 3016 PARS5:  CALL     QBRAN
      009125 91 37                 3017         .word      PARS6
      009127 CD 8A FF         [ 4] 3018         CALL     ONEP
      00912A CD 84 F9         [ 4] 3019         CALL     DONXT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      00912D 90 FF                 3020         .word      PARS4
      00912F CD 86 0A         [ 4] 3021         CALL     DUPP
      009132 CD 85 D3         [ 4] 3022         CALL     TOR
      009135 20 0F            [ 2] 3023         JRA     PARS7
      009137 CD 85 B4         [ 4] 3024 PARS6:  CALL     RFROM
      00913A CD 86 00         [ 4] 3025         CALL     DROP
      00913D CD 86 0A         [ 4] 3026         CALL     DUPP
      009140 CD 8A FF         [ 4] 3027         CALL     ONEP
      009143 CD 85 D3         [ 4] 3028         CALL     TOR
      009146 CD 86 34         [ 4] 3029 PARS7:  CALL     OVER
      009149 CD 88 7E         [ 4] 3030         CALL     SUBB
      00914C CD 85 B4         [ 4] 3031         CALL     RFROM
      00914F CD 85 B4         [ 4] 3032         CALL     RFROM
      009152 CC 88 7E         [ 2] 3033         JP     SUBB
      009155 CD 86 34         [ 4] 3034 PARS8:  CALL     OVER
      009158 CD 85 B4         [ 4] 3035         CALL     RFROM
      00915B CC 88 7E         [ 2] 3036         JP     SUBB
                                   3037 
                                   3038 ;       PARSE   ( c -- b u ; <string> )
                                   3039 ;       Scan input stream and return
                                   3040 ;       counted string delimited by c.
      00915E 90 97                 3041         .word      LINK
                           0010E0  3042 LINK = . 
      009160 05                    3043         .byte      5
      009161 50 41 52 53 45        3044         .ascii     "PARSE"
      009166                       3045 PARSE:
      009166 CD 85 D3         [ 4] 3046         CALL     TOR
      009169 CD 8C 7B         [ 4] 3047         CALL     TIB
      00916C CD 86 E5         [ 4] 3048         CALL     INN
      00916F CD 85 63         [ 4] 3049         CALL     AT
      009172 CD 88 05         [ 4] 3050         CALL     PLUS    ;current input buffer pointer
      009175 CD 86 F5         [ 4] 3051         CALL     NTIB
      009178 CD 85 63         [ 4] 3052         CALL     AT
      00917B CD 86 E5         [ 4] 3053         CALL     INN
      00917E CD 85 63         [ 4] 3054         CALL     AT
      009181 CD 88 7E         [ 4] 3055         CALL     SUBB    ;remaining count
      009184 CD 85 B4         [ 4] 3056         CALL     RFROM
      009187 CD 90 9D         [ 4] 3057         CALL     PARS
      00918A CD 86 E5         [ 4] 3058         CALL     INN
      00918D CC 8B DB         [ 2] 3059         JP     PSTOR
                                   3060 
                                   3061 ;       .(      ( -- )
                                   3062 ;       Output following string up to next ) .
      009190 91 60                 3063         .word      LINK
                           001112  3064 LINK = . 
      009192 82                    3065 	.byte      IMEDD+2
      009193 2E 28                 3066         .ascii     ".("
      009195                       3067 DOTPR:
      009195 CD 84 E5         [ 4] 3068         CALL     DOLIT
      009198 00 29                 3069         .word     41	; ")"
      00919A CD 91 66         [ 4] 3070         CALL     PARSE
      00919D CC 8F B3         [ 2] 3071         JP     TYPES
                                   3072 
                                   3073 ;       (       ( -- )
                                   3074 ;       Ignore following string up to next ).
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   3075 ;       A comment.
      0091A0 91 92                 3076         .word      LINK
                           001122  3077 LINK = . 
      0091A2 81                    3078 	.byte      IMEDD+1
      0091A3 28                    3079         .ascii     "("
      0091A4                       3080 PAREN:
      0091A4 CD 84 E5         [ 4] 3081         CALL     DOLIT
      0091A7 00 29                 3082         .word     41	; ")"
      0091A9 CD 91 66         [ 4] 3083         CALL     PARSE
      0091AC CC 87 E5         [ 2] 3084         JP     DDROP
                                   3085 
                                   3086 ;       \       ( -- )
                                   3087 ;       Ignore following text till
                                   3088 ;       end of line.
      0091AF 91 A2                 3089         .word      LINK
                           001131  3090 LINK = . 
      0091B1 81                    3091 	.byte      IMEDD+1
      0091B2 5C                    3092         .ascii     "\"
      0091B3                       3093 BKSLA:
      0091B3 90 AE 00 0C      [ 2] 3094         ldw y,#UCTIB ; #TIB  
      0091B7 90 FE            [ 2] 3095         ldw y,(y)
      0091B9 90 89            [ 2] 3096         pushw y ; count in TIB 
      0091BB 90 AE 00 0A      [ 2] 3097         ldw y,#UINN ; >IN 
      0091BF 90 BF 24         [ 2] 3098         ldw YTEMP,y
      0091C2 90 85            [ 2] 3099         popw y 
      0091C4 91 CF 24         [ 5] 3100         ldw [YTEMP],y
      0091C7 81               [ 4] 3101         ret 
                                   3102 
                                   3103 ;       WORD    ( c -- a ; <string> )
                                   3104 ;       Parse a word from input stream
                                   3105 ;       and copy it to code dictionary.
      0091C8 91 B1                 3106         .word      LINK
                           00114A  3107 LINK = . 
      0091CA 04                    3108         .byte      4
      0091CB 57 4F 52 44           3109         .ascii     "WORD"
      0091CF                       3110 WORDD:
      0091CF CD 91 66         [ 4] 3111         CALL     PARSE
      0091D2 CD 8C 59         [ 4] 3112         CALL     HERE
      0091D5 CD 8A D4         [ 4] 3113         CALL     CELLP
      0091D8 CC 8D 19         [ 2] 3114         JP     PACKS
                                   3115 
                                   3116 ;       TOKEN   ( -- a ; <string> )
                                   3117 ;       Parse a word from input stream
                                   3118 ;       and copy it to name dictionary.
      0091DB 91 CA                 3119         .word      LINK
                           00115D  3120 LINK = . 
      0091DD 05                    3121         .byte      5
      0091DE 54 4F 4B 45 4E        3122         .ascii     "TOKEN"
      0091E3                       3123 TOKEN:
      0091E3 CD 8B 5E         [ 4] 3124         CALL     BLANK
      0091E6 CC 91 CF         [ 2] 3125         JP     WORDD
                                   3126 
                                   3127 ;; Dictionary search
                                   3128 
                                   3129 ;       NAME>   ( na -- ca )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3130 ;       Return a code address given
                                   3131 ;       a name address.
      0091E9 91 DD                 3132         .word      LINK
                           00116B  3133 LINK = . 
      0091EB 05                    3134         .byte      5
      0091EC 4E 41 4D 45 3E        3135         .ascii     "NAME>"
      0091F1                       3136 NAMET:
      0091F1 CD 8C 42         [ 4] 3137         CALL     COUNT
      0091F4 CD 84 E5         [ 4] 3138         CALL     DOLIT
      0091F7 00 1F                 3139         .word      31
      0091F9 CD 86 56         [ 4] 3140         CALL     ANDD
      0091FC CC 88 05         [ 2] 3141         JP     PLUS
                                   3142 
                                   3143 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3144 ;       Compare u cells in two
                                   3145 ;       strings. Return 0 if identical.
      0091FF 91 EB                 3146         .word      LINK
                           001181  3147 LINK = . 
      009201 05                    3148         .byte       5
      009202 53 41 4D 45 3F        3149         .ascii     "SAME?"
      009207                       3150 SAMEQ:
      009207 CD 8B 0C         [ 4] 3151         CALL     ONEM
      00920A CD 85 D3         [ 4] 3152         CALL     TOR
      00920D 20 29            [ 2] 3153         JRA     SAME2
      00920F CD 86 34         [ 4] 3154 SAME1:  CALL     OVER
      009212 CD 85 C7         [ 4] 3155         CALL     RAT
      009215 CD 88 05         [ 4] 3156         CALL     PLUS
      009218 CD 85 81         [ 4] 3157         CALL     CAT
      00921B CD 86 34         [ 4] 3158         CALL     OVER
      00921E CD 85 C7         [ 4] 3159         CALL     RAT
      009221 CD 88 05         [ 4] 3160         CALL     PLUS
      009224 CD 85 81         [ 4] 3161         CALL     CAT
      009227 CD 88 7E         [ 4] 3162         CALL     SUBB
      00922A CD 87 B4         [ 4] 3163         CALL     QDUP
      00922D CD 85 18         [ 4] 3164         CALL     QBRAN
      009230 92 38                 3165         .word      SAME2
      009232 CD 85 B4         [ 4] 3166         CALL     RFROM
      009235 CC 86 00         [ 2] 3167         JP     DROP
      009238 CD 84 F9         [ 4] 3168 SAME2:  CALL     DONXT
      00923B 92 0F                 3169         .word      SAME1
      00923D CC 8B 6B         [ 2] 3170         JP     ZERO
                                   3171 
                                   3172 ;       find    ( a va -- ca na | a F )
                                   3173 ;       Search vocabulary for string.
                                   3174 ;       Return ca and na if succeeded.
      009240 92 01                 3175         .word      LINK
                           0011C2  3176 LINK = . 
      009242 04                    3177         .byte      4
      009243 46 49 4E 44           3178         .ascii     "FIND"
      009247                       3179 FIND:
      009247 CD 86 1A         [ 4] 3180         CALL     SWAPP
      00924A CD 86 0A         [ 4] 3181         CALL     DUPP
      00924D CD 85 81         [ 4] 3182         CALL     CAT
      009250 CD 86 D6         [ 4] 3183         CALL     TEMP
      009253 CD 85 4C         [ 4] 3184         CALL     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      009256 CD 86 0A         [ 4] 3185         CALL     DUPP
      009259 CD 85 63         [ 4] 3186         CALL     AT
      00925C CD 85 D3         [ 4] 3187         CALL     TOR
      00925F CD 8A D4         [ 4] 3188         CALL     CELLP
      009262 CD 86 1A         [ 4] 3189         CALL     SWAPP
      009265 CD 85 63         [ 4] 3190 FIND1:  CALL     AT
      009268 CD 86 0A         [ 4] 3191         CALL     DUPP
      00926B CD 85 18         [ 4] 3192         CALL     QBRAN
      00926E 92 A4                 3193         .word      FIND6
      009270 CD 86 0A         [ 4] 3194         CALL     DUPP
      009273 CD 85 63         [ 4] 3195         CALL     AT
      009276 CD 84 E5         [ 4] 3196         CALL     DOLIT
      009279 1F 7F                 3197         .word      MASKK
      00927B CD 86 56         [ 4] 3198         CALL     ANDD
      00927E CD 85 C7         [ 4] 3199         CALL     RAT
      009281 CD 86 7F         [ 4] 3200         CALL     XORR
      009284 CD 85 18         [ 4] 3201         CALL     QBRAN
      009287 92 93                 3202         .word      FIND2
      009289 CD 8A D4         [ 4] 3203         CALL     CELLP
      00928C CD 84 E5         [ 4] 3204         CALL     DOLIT
      00928F FF FF                 3205         .word     0xFFFF
      009291 20 0C            [ 2] 3206         JRA     FIND3
      009293 CD 8A D4         [ 4] 3207 FIND2:  CALL     CELLP
      009296 CD 86 D6         [ 4] 3208         CALL     TEMP
      009299 CD 85 63         [ 4] 3209         CALL     AT
      00929C CD 92 07         [ 4] 3210         CALL     SAMEQ
      00929F CD 85 2F         [ 4] 3211 FIND3:  CALL     BRAN
      0092A2 92 B3                 3212         .word      FIND4
      0092A4 CD 85 B4         [ 4] 3213 FIND6:  CALL     RFROM
      0092A7 CD 86 00         [ 4] 3214         CALL     DROP
      0092AA CD 86 1A         [ 4] 3215         CALL     SWAPP
      0092AD CD 8A E3         [ 4] 3216         CALL     CELLM
      0092B0 CC 86 1A         [ 2] 3217         JP     SWAPP
      0092B3 CD 85 18         [ 4] 3218 FIND4:  CALL     QBRAN
      0092B6 92 C0                 3219         .word      FIND5
      0092B8 CD 8A E3         [ 4] 3220         CALL     CELLM
      0092BB CD 8A E3         [ 4] 3221         CALL     CELLM
      0092BE 20 A5            [ 2] 3222         JRA     FIND1
      0092C0 CD 85 B4         [ 4] 3223 FIND5:  CALL     RFROM
      0092C3 CD 86 00         [ 4] 3224         CALL     DROP
      0092C6 CD 86 1A         [ 4] 3225         CALL     SWAPP
      0092C9 CD 86 00         [ 4] 3226         CALL     DROP
      0092CC CD 8A E3         [ 4] 3227         CALL     CELLM
      0092CF CD 86 0A         [ 4] 3228         CALL     DUPP
      0092D2 CD 91 F1         [ 4] 3229         CALL     NAMET
      0092D5 CC 86 1A         [ 2] 3230         JP     SWAPP
                                   3231 
                                   3232 ;       NAME?   ( a -- ca na | a F )
                                   3233 ;       Search vocabularies for a string.
      0092D8 92 42                 3234         .word      LINK
                           00125A  3235 LINK = . 
      0092DA 05                    3236         .byte      5
      0092DB 4E 41 4D 45 3F        3237         .ascii     "NAME?"
      0092E0                       3238 NAMEQ:
      0092E0 CD 87 4A         [ 4] 3239         CALL   CNTXT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      0092E3 CC 92 47         [ 2] 3240         JP     FIND
                                   3241 
                                   3242 ;; Terminal response
                                   3243 
                                   3244 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3245 ;       Backup cursor by one character.
      0092E6 92 DA                 3246         .word      LINK
                           001268  3247 LINK = . 
      0092E8 02                    3248         .byte      2
      0092E9 5E 48                 3249         .ascii     "^H"
      0092EB                       3250 BKSP:
      0092EB CD 85 D3         [ 4] 3251         CALL     TOR
      0092EE CD 86 34         [ 4] 3252         CALL     OVER
      0092F1 CD 85 B4         [ 4] 3253         CALL     RFROM
      0092F4 CD 86 1A         [ 4] 3254         CALL     SWAPP
      0092F7 CD 86 34         [ 4] 3255         CALL     OVER
      0092FA CD 86 7F         [ 4] 3256         CALL     XORR
      0092FD CD 85 18         [ 4] 3257         CALL     QBRAN
      009300 93 1B                 3258         .word      BACK1
      009302 CD 84 E5         [ 4] 3259         CALL     DOLIT
      009305 00 08                 3260         .word      BKSPP
      009307 CD 84 A4         [ 4] 3261         CALL     EMIT
      00930A CD 8B 0C         [ 4] 3262         CALL     ONEM
      00930D CD 8B 5E         [ 4] 3263         CALL     BLANK
      009310 CD 84 A4         [ 4] 3264         CALL     EMIT
      009313 CD 84 E5         [ 4] 3265         CALL     DOLIT
      009316 00 08                 3266         .word      BKSPP
      009318 CC 84 A4         [ 2] 3267         JP     EMIT
      00931B 81               [ 4] 3268 BACK1:  RET
                                   3269 
                                   3270 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3271 ;       Accept and echo key stroke
                                   3272 ;       and bump cursor.
      00931C 92 E8                 3273         .word      LINK
                           00129E  3274 LINK = . 
      00931E 03                    3275         .byte      3
      00931F 54 41 50              3276         .ascii     "TAP"
      009322                       3277 TAP:
      009322 CD 86 0A         [ 4] 3278         CALL     DUPP
      009325 CD 84 A4         [ 4] 3279         CALL     EMIT
      009328 CD 86 34         [ 4] 3280         CALL     OVER
      00932B CD 85 70         [ 4] 3281         CALL     CSTOR
      00932E CC 8A FF         [ 2] 3282         JP     ONEP
                                   3283 
                                   3284 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3285 ;       Process a key stroke,
                                   3286 ;       CR,LF or backspace.
      009331 93 1E                 3287         .word      LINK
                           0012B3  3288 LINK = . 
      009333 04                    3289         .byte      4
      009334 4B 54 41 50           3290         .ascii     "KTAP"
      009338                       3291 KTAP:
      009338 CD 86 0A         [ 4] 3292         CALL     DUPP
      00933B CD 84 E5         [ 4] 3293         CALL     DOLIT
                           000001  3294 .if EOL_CR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      00933E 00 0D                 3295         .word   CRR
                           000000  3296 .else ; EOL_LF 
                                   3297         .word   LF
                                   3298 .endif 
      009340 CD 86 7F         [ 4] 3299         CALL     XORR
      009343 CD 85 18         [ 4] 3300         CALL     QBRAN
      009346 93 5E                 3301         .word      KTAP2
      009348 CD 84 E5         [ 4] 3302         CALL     DOLIT
      00934B 00 08                 3303         .word      BKSPP
      00934D CD 86 7F         [ 4] 3304         CALL     XORR
      009350 CD 85 18         [ 4] 3305         CALL     QBRAN
      009353 93 5B                 3306         .word      KTAP1
      009355 CD 8B 5E         [ 4] 3307         CALL     BLANK
      009358 CC 93 22         [ 2] 3308         JP     TAP
      00935B CC 92 EB         [ 2] 3309 KTAP1:  JP     BKSP
      00935E CD 86 00         [ 4] 3310 KTAP2:  CALL     DROP
      009361 CD 86 1A         [ 4] 3311         CALL     SWAPP
      009364 CD 86 00         [ 4] 3312         CALL     DROP
      009367 CC 86 0A         [ 2] 3313         JP     DUPP
                                   3314 
                                   3315 ;       accept  ( b u -- b u )
                                   3316 ;       Accept characters to input
                                   3317 ;       buffer. Return with actual count.
      00936A 93 33                 3318         .word      LINK
                           0012EC  3319 LINK = . 
      00936C 06                    3320         .byte      6
      00936D 41 43 43 45 50 54     3321         .ascii     "ACCEPT"
      009373                       3322 ACCEP:
      009373 CD 86 34         [ 4] 3323         CALL     OVER
      009376 CD 88 05         [ 4] 3324         CALL     PLUS
      009379 CD 86 34         [ 4] 3325         CALL     OVER
      00937C CD 87 F0         [ 4] 3326 ACCP1:  CALL     DDUP
      00937F CD 86 7F         [ 4] 3327         CALL     XORR
      009382 CD 85 18         [ 4] 3328         CALL     QBRAN
      009385 93 A7                 3329         .word      ACCP4
      009387 CD 8F 51         [ 4] 3330         CALL     KEY
      00938A CD 86 0A         [ 4] 3331         CALL     DUPP
      00938D CD 8B 5E         [ 4] 3332         CALL     BLANK
      009390 CD 84 E5         [ 4] 3333         CALL     DOLIT
      009393 00 7F                 3334         .word      127
      009395 CD 89 40         [ 4] 3335         CALL     WITHI
      009398 CD 85 18         [ 4] 3336         CALL     QBRAN
      00939B 93 A2                 3337         .word      ACCP2
      00939D CD 93 22         [ 4] 3338         CALL     TAP
      0093A0 20 03            [ 2] 3339         JRA     ACCP3
      0093A2 CD 93 38         [ 4] 3340 ACCP2:  CALL     KTAP
      0093A5 20 D5            [ 2] 3341 ACCP3:  JRA     ACCP1
      0093A7 CD 86 00         [ 4] 3342 ACCP4:  CALL     DROP
      0093AA CD 86 34         [ 4] 3343         CALL     OVER
      0093AD CC 88 7E         [ 2] 3344         JP     SUBB
                                   3345 
                                   3346 ;       QUERY   ( -- )
                                   3347 ;       Accept input stream to
                                   3348 ;       terminal input buffer.
      0093B0 93 6C                 3349         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3350         
                           001332  3351 LINK = . 
      0093B2 05                    3352         .byte      5
      0093B3 51 55 45 52 59        3353         .ascii     "QUERY"
      0093B8                       3354 QUERY:
      0093B8 CD 8C 7B         [ 4] 3355         CALL     TIB
      0093BB CD 84 E5         [ 4] 3356         CALL     DOLIT
      0093BE 00 50                 3357         .word      80
      0093C0 CD 93 73         [ 4] 3358         CALL     ACCEP
      0093C3 CD 86 F5         [ 4] 3359         CALL     NTIB
      0093C6 CD 85 4C         [ 4] 3360         CALL     STORE
      0093C9 CD 86 00         [ 4] 3361         CALL     DROP
      0093CC CD 8B 6B         [ 4] 3362         CALL     ZERO
      0093CF CD 86 E5         [ 4] 3363         CALL     INN
      0093D2 CC 85 4C         [ 2] 3364         JP     STORE
                                   3365 
                                   3366 ;       ABORT   ( -- )
                                   3367 ;       Reset data stack and
                                   3368 ;       jump to QUIT.
      0093D5 93 B2                 3369         .word      LINK
                           001357  3370 LINK = . 
      0093D7 05                    3371         .byte      5
      0093D8 41 42 4F 52 54        3372         .ascii     "ABORT"
      0093DD                       3373 ABORT:
      0093DD CD 94 D4         [ 4] 3374         CALL     PRESE
      0093E0 CC 94 F1         [ 2] 3375         JP     QUIT
                                   3376 
                                   3377 ;       abort"  ( f -- )
                                   3378 ;       Run time routine of ABORT".
                                   3379 ;       Abort with a message.
      0093E3 93 D7                 3380         .word      LINK
                           001365  3381 LINK = . 
      0093E5 46                    3382 	.byte      COMPO+6
      0093E6 41 42 4F 52 54        3383         .ascii     "ABORT"
      0093EB 22                    3384         .byte      '"'
      0093EC                       3385 ABORQ:
      0093EC CD 85 18         [ 4] 3386         CALL     QBRAN
      0093EF 94 0B                 3387         .word      ABOR2   ;text flag
      0093F1 CD 8F E7         [ 4] 3388         CALL     DOSTR
      0093F4 CD 8F 89         [ 4] 3389 ABOR1:  CALL     SPACE
      0093F7 CD 8C 42         [ 4] 3390         CALL     COUNT
      0093FA CD 8F B3         [ 4] 3391         CALL     TYPES
      0093FD CD 84 E5         [ 4] 3392         CALL     DOLIT
      009400 00 3F                 3393         .word     63 ; "?"
      009402 CD 84 A4         [ 4] 3394         CALL     EMIT
      009405 CD 8F D1         [ 4] 3395         CALL     CR
      009408 CC 93 DD         [ 2] 3396         JP     ABORT   ;pass error string
      00940B CD 8F E7         [ 4] 3397 ABOR2:  CALL     DOSTR
      00940E CC 86 00         [ 2] 3398         JP     DROP
                                   3399 
                                   3400 ;; The text interpreter
                                   3401 
                                   3402 ;       $INTERPRET      ( a -- )
                                   3403 ;       Interpret a word. If failed,
                                   3404 ;       try to convert it to an integer.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      009411 93 E5                 3405         .word      LINK
                           001393  3406 LINK = . 
      009413 0A                    3407         .byte      10
      009414 24 49 4E 54 45 52 50  3408         .ascii     "$INTERPRET"
             52 45 54
      00941E                       3409 INTER:
      00941E CD 92 E0         [ 4] 3410         CALL     NAMEQ
      009421 CD 87 B4         [ 4] 3411         CALL     QDUP    ;?defined
      009424 CD 85 18         [ 4] 3412         CALL     QBRAN
      009427 94 48                 3413         .word      INTE1
      009429 CD 85 63         [ 4] 3414         CALL     AT
      00942C CD 84 E5         [ 4] 3415         CALL     DOLIT
      00942F 40 00                 3416 	.word       0x4000	; COMPO*256
      009431 CD 86 56         [ 4] 3417         CALL     ANDD    ;?compile only lexicon bits
      009434 CD 93 EC         [ 4] 3418         CALL     ABORQ
      009437 0D                    3419         .byte      13
      009438 20 63 6F 6D 70 69 6C  3420         .ascii     " compile only"
             65 20 6F 6E 6C 79
      009445 CC 85 3F         [ 2] 3421         JP     EXECU
      009448 CD 8E 7E         [ 4] 3422 INTE1:  CALL     NUMBQ   ;convert a number
      00944B CD 85 18         [ 4] 3423         CALL     QBRAN
      00944E 93 F4                 3424         .word    ABOR1
      009450 81               [ 4] 3425         RET
                                   3426 
                                   3427 ;       [       ( -- )
                                   3428 ;       Start  text interpreter.
      009451 94 13                 3429         .word      LINK
                           0013D3  3430 LINK = . 
      009453 81                    3431 	.byte      IMEDD+1
      009454 5B                    3432         .ascii     "["
      009455                       3433 LBRAC:
      009455 CD 84 E5         [ 4] 3434         CALL   DOLIT
      009458 94 1E                 3435         .word  INTER
      00945A CD 87 28         [ 4] 3436         CALL   TEVAL
      00945D CC 85 4C         [ 2] 3437         JP     STORE
                                   3438 
                                   3439 ;       .OK     ( -- )
                                   3440 ;       Display 'ok' while interpreting.
      009460 94 53                 3441         .word      LINK
                           0013E2  3442 LINK = . 
      009462 03                    3443         .byte      3
      009463 2E 4F 4B              3444         .ascii     ".OK"
      009466                       3445 DOTOK:
      009466 CD 84 E5         [ 4] 3446         CALL     DOLIT
      009469 94 1E                 3447         .word      INTER
      00946B CD 87 28         [ 4] 3448         CALL     TEVAL
      00946E CD 85 63         [ 4] 3449         CALL     AT
      009471 CD 88 A6         [ 4] 3450         CALL     EQUAL
      009474 CD 85 18         [ 4] 3451         CALL     QBRAN
      009477 94 80                 3452         .word      DOTO1
      009479 CD 90 10         [ 4] 3453         CALL     DOTQP
      00947C 03                    3454         .byte      3
      00947D 20 6F 6B              3455         .ascii     " ok"
      009480 CC 8F D1         [ 2] 3456 DOTO1:  JP     CR
                                   3457 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                                   3458 ;       ?STACK  ( -- )
                                   3459 ;       Abort if stack underflows.
      009483 94 62                 3460         .word      LINK
                           001405  3461 LINK = . 
      009485 06                    3462         .byte      6
      009486 3F 53 54 41 43 4B     3463         .ascii     "?STACK"
      00948C                       3464 QSTAC: 
      00948C CD 8B AD         [ 4] 3465         CALL     DEPTH
      00948F CD 86 43         [ 4] 3466         CALL     ZLESS   ;check only for underflow
      009492 CD 93 EC         [ 4] 3467         CALL     ABORQ
      009495 0B                    3468         .byte      11
      009496 20 75 6E 64 65 72 66  3469         .ascii     " underflow "
             6C 6F 77 20
      0094A1 81               [ 4] 3470         RET
                                   3471 
                                   3472 ;       EVAL    ( -- )
                                   3473 ;       Interpret  input stream.
      0094A2 94 85                 3474         .word      LINK
                           001424  3475 LINK = . 
      0094A4 04                    3476         .byte      4
      0094A5 45 56 41 4C           3477         .ascii     "EVAL"
      0094A9                       3478 EVAL:
      0094A9 CD 91 E3         [ 4] 3479 EVAL1:  CALL     TOKEN
      0094AC CD 86 0A         [ 4] 3480         CALL     DUPP
      0094AF CD 85 81         [ 4] 3481         CALL     CAT     ;?input stream empty
      0094B2 CD 85 18         [ 4] 3482         CALL     QBRAN
      0094B5 94 C5                 3483         .word    EVAL2
      0094B7 CD 87 28         [ 4] 3484         CALL     TEVAL
      0094BA CD 8C 8F         [ 4] 3485         CALL     ATEXE
      0094BD CD 94 8C         [ 4] 3486         CALL     QSTAC   ;evaluate input, check stack
      0094C0 CD 85 2F         [ 4] 3487         CALL     BRAN
      0094C3 94 A9                 3488         .word    EVAL1
      0094C5 CD 86 00         [ 4] 3489 EVAL2:  CALL     DROP
      0094C8 CC 94 66         [ 2] 3490         JP       DOTOK
                                   3491 
                                   3492 ;       PRESET  ( -- )
                                   3493 ;       Reset data stack pointer and
                                   3494 ;       terminal input buffer.
      0094CB 94 A4                 3495         .word      LINK
                           00144D  3496 LINK = . 
      0094CD 06                    3497         .byte      6
      0094CE 50 52 45 53 45 54     3498         .ascii     "PRESET"
      0094D4                       3499 PRESE:
      0094D4 CD 84 E5         [ 4] 3500         CALL     DOLIT
      0094D7 06 80                 3501         .word      SPP
      0094D9 CD 85 F7         [ 4] 3502         CALL     SPSTO
      0094DC CD 84 E5         [ 4] 3503         CALL     DOLIT
      0094DF 07 00                 3504         .word      TIBB
      0094E1 CD 86 F5         [ 4] 3505         CALL     NTIB
      0094E4 CD 8A D4         [ 4] 3506         CALL     CELLP
      0094E7 CC 85 4C         [ 2] 3507         JP     STORE
                                   3508 
                                   3509 ;       QUIT    ( -- )
                                   3510 ;       Reset return stack pointer
                                   3511 ;       and start text interpreter.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0094EA 94 CD                 3512         .word      LINK
                           00146C  3513 LINK = . 
      0094EC 04                    3514         .byte      4
      0094ED 51 55 49 54           3515         .ascii     "QUIT"
      0094F1                       3516 QUIT:
      0094F1 CD 84 E5         [ 4] 3517         CALL     DOLIT
      0094F4 07 FF                 3518         .word      RPP
      0094F6 CD 85 9E         [ 4] 3519         CALL     RPSTO   ;reset return stack pointer
      0094F9 CD 94 55         [ 4] 3520 QUIT1:  CALL     LBRAC   ;start interpretation
      0094FC CD 93 B8         [ 4] 3521 QUIT2:  CALL     QUERY   ;get input
      0094FF CD 94 A9         [ 4] 3522         CALL     EVAL
      009502 20 F8            [ 2] 3523         JRA     QUIT2   ;continue till error
                                   3524 
                                   3525 ;; The compiler
                                   3526 
                                   3527 ;       '       ( -- ca )
                                   3528 ;       Search vocabularies for
                                   3529 ;       next word in input stream.
      009504 94 EC                 3530         .word      LINK
                           001486  3531 LINK = . 
      009506 01                    3532         .byte      1
      009507 27                    3533         .ascii     "'"
      009508                       3534 TICK:
      009508 CD 91 E3         [ 4] 3535         CALL     TOKEN
      00950B CD 92 E0         [ 4] 3536         CALL     NAMEQ   ;?defined
      00950E CD 85 18         [ 4] 3537         CALL     QBRAN
      009511 93 F4                 3538         .word      ABOR1
      009513 81               [ 4] 3539         RET     ;yes, push code address
                                   3540 
                                   3541 ;       ALLOT   ( n -- )
                                   3542 ;       Allocate n bytes to RAM 
      009514 95 06                 3543         .word      LINK
                           001496  3544         LINK = . 
      009516 05                    3545         .byte      5
      009517 41 4C 4C 4F 54        3546         .ascii     "ALLOT"
      00951C                       3547 ALLOT:
      00951C CD 87 58         [ 4] 3548         CALL     VPP
                                   3549 ; must update APP_VP each time VP is modidied
      00951F CD 8B DB         [ 4] 3550         call PSTOR 
      009522 CC 9C 63         [ 2] 3551         jp UPDATVP 
                                   3552 
                                   3553 ;       ,       ( w -- )
                                   3554 ;         Compile an integer into
                                   3555 ;         variable space.
      009525 95 16                 3556         .word      LINK
                           0014A7  3557 LINK = . 
      009527 01                    3558         .byte      1
      009528 2C                    3559         .ascii     ","
      009529                       3560 COMMA:
      009529 CD 8C 59         [ 4] 3561         CALL     HERE
      00952C CD 86 0A         [ 4] 3562         CALL     DUPP
      00952F CD 8A D4         [ 4] 3563         CALL     CELLP   ;cell boundary
      009532 CD 87 58         [ 4] 3564         CALL     VPP
      009535 CD 85 4C         [ 4] 3565         CALL     STORE
      009538 CC 85 4C         [ 2] 3566         JP     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   3567 
                                   3568 ;       C,      ( c -- )
                                   3569 ;       Compile a byte into
                                   3570 ;       variables space.
      00953B 95 27                 3571        .word      LINK
                           0014BD  3572 LINK = . 
      00953D 02                    3573         .byte      2
      00953E 43 2C                 3574         .ascii     "C,"
      009540                       3575 CCOMMA:
      009540 CD 8C 59         [ 4] 3576         CALL     HERE
      009543 CD 86 0A         [ 4] 3577         CALL     DUPP
      009546 CD 8A FF         [ 4] 3578         CALL     ONEP
      009549 CD 87 58         [ 4] 3579         CALL     VPP
      00954C CD 85 4C         [ 4] 3580         CALL     STORE
      00954F CC 85 70         [ 2] 3581         JP     CSTOR
                                   3582 
                                   3583 ;       [COMPILE]       ( -- ; <string> )
                                   3584 ;       Compile next immediate
                                   3585 ;       word into code dictionary.
      009552 95 3D                 3586         .word      LINK
                           0014D4  3587 LINK = . 
      009554 89                    3588 	.byte      IMEDD+9
      009555 5B 43 4F 4D 50 49 4C  3589         .ascii     "[COMPILE]"
             45 5D
      00955E                       3590 BCOMP:
      00955E CD 95 08         [ 4] 3591         CALL     TICK
      009561 CC 98 24         [ 2] 3592         JP     JSRC
                                   3593 
                                   3594 ;       COMPILE ( -- )
                                   3595 ;       Compile next jsr in
                                   3596 ;       colon list to code dictionary.
      009564 95 54                 3597         .word      LINK
                           0014E6  3598 LINK = . 
      009566 47                    3599 	.byte      COMPO+7
      009567 43 4F 4D 50 49 4C 45  3600         .ascii     "COMPILE"
      00956E                       3601 COMPI:
      00956E CD 85 B4         [ 4] 3602         CALL     RFROM
      009571 CD 86 0A         [ 4] 3603         CALL     DUPP
      009574 CD 85 63         [ 4] 3604         CALL     AT
      009577 CD 98 24         [ 4] 3605         CALL     JSRC    ;compile subroutine
      00957A CD 8A D4         [ 4] 3606         CALL     CELLP
      00957D 90 93            [ 1] 3607         ldw y,x 
      00957F 90 FE            [ 2] 3608         ldw y,(y)
      009581 1C 00 02         [ 2] 3609         addw x,#CELLL 
      009584 90 FC            [ 2] 3610         jp (y)
                                   3611 
                                   3612 ;       LITERAL ( w -- )
                                   3613 ;       Compile tos to dictionary
                                   3614 ;       as an integer literal.
      009586 95 66                 3615         .word      LINK
                           001508  3616 LINK = . 
      009588 87                    3617 	.byte      IMEDD+7
      009589 4C 49 54 45 52 41 4C  3618         .ascii     "LITERAL"
      009590                       3619 LITER:
      009590 CD 95 6E         [ 4] 3620         CALL     COMPI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009593 84 E5                 3621         .word DOLIT 
      009595 CC 95 29         [ 2] 3622         JP     COMMA
                                   3623 
                                   3624 ;       $,"     ( -- )
                                   3625 ;       Compile a literal string
                                   3626 ;       up to next " .
      009598 95 88                 3627         .word      LINK
                           00151A  3628 LINK = . 
      00959A 03                    3629         .byte      3
      00959B 24 2C 22              3630         .byte     '$',',','"'
      00959E                       3631 STRCQ:
      00959E CD 84 E5         [ 4] 3632         CALL     DOLIT
      0095A1 00 22                 3633         .word     34	; "
      0095A3 CD 91 66         [ 4] 3634         CALL     PARSE
      0095A6 CD 8C 59         [ 4] 3635         CALL     HERE
      0095A9 CD 8D 19         [ 4] 3636         CALL     PACKS   ;string to code dictionary
      0095AC CD 8C 42         [ 4] 3637         CALL     COUNT
      0095AF CD 88 05         [ 4] 3638         CALL     PLUS    ;calculate aligned end of string
      0095B2 CD 87 58         [ 4] 3639         CALL     VPP
      0095B5 CC 85 4C         [ 2] 3640         JP     STORE
                                   3641 
                                   3642 ;; Structures
                                   3643 
                                   3644 ;       FOR     ( -- a )
                                   3645 ;       Start a FOR-NEXT loop
                                   3646 ;       structure in a colon definition.
      0095B8 95 9A                 3647         .word      LINK
                           00153A  3648 LINK = . 
      0095BA 83                    3649 	.byte      IMEDD+3
      0095BB 46 4F 52              3650         .ascii     "FOR"
      0095BE                       3651 FOR:
      0095BE CD 95 6E         [ 4] 3652         CALL     COMPI
      0095C1 85 D3                 3653         .word TOR 
      0095C3 CC 8C 59         [ 2] 3654         JP     HERE
                                   3655 
                                   3656 ;       NEXT    ( a -- )
                                   3657 ;       Terminate a FOR-NEXT loop.
      0095C6 95 BA                 3658         .word      LINK
                           001548  3659 LINK = . 
      0095C8 84                    3660 	.byte      IMEDD+4
      0095C9 4E 45 58 54           3661         .ascii     "NEXT"
      0095CD                       3662 NEXT:
      0095CD CD 95 6E         [ 4] 3663         CALL     COMPI
      0095D0 84 F9                 3664         .word DONXT 
      0095D2 CD 87 A4         [ 4] 3665         call ADRADJ
      0095D5 CC 95 29         [ 2] 3666         JP     COMMA
                                   3667 
                                   3668 ;       I ( -- n )
                                   3669 ;       stack FOR-NEXT COUNTER 
      0095D8 95 C8                 3670         .word LINK 
                           00155A  3671         LINK=.
      0095DA 01                    3672         .byte 1 
      0095DB 49                    3673         .ascii "I"
      0095DC                       3674 IFETCH: 
      0095DC 1D 00 02         [ 2] 3675         subw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0095DF 16 03            [ 2] 3676         ldw y,(3,sp)
      0095E1 FF               [ 2] 3677         ldw (x),y 
      0095E2 81               [ 4] 3678         ret 
                                   3679 
                                   3680 ;       BEGIN   ( -- a )
                                   3681 ;       Start an infinite or
                                   3682 ;       indefinite loop structure.
      0095E3 95 DA                 3683         .word      LINK
                           001565  3684 LINK = . 
      0095E5 85                    3685 	.byte      IMEDD+5
      0095E6 42 45 47 49 4E        3686         .ascii     "BEGIN"
      0095EB                       3687 BEGIN:
      0095EB CC 8C 59         [ 2] 3688         JP     HERE
                                   3689 
                                   3690 ;       UNTIL   ( a -- )
                                   3691 ;       Terminate a BEGIN-UNTIL
                                   3692 ;       indefinite loop structure.
      0095EE 95 E5                 3693         .word      LINK
                           001570  3694 LINK = . 
      0095F0 85                    3695 	.byte      IMEDD+5
      0095F1 55 4E 54 49 4C        3696         .ascii     "UNTIL"
      0095F6                       3697 UNTIL:
      0095F6 CD 95 6E         [ 4] 3698         CALL     COMPI
      0095F9 85 18                 3699         .word    QBRAN 
      0095FB CD 87 A4         [ 4] 3700         call ADRADJ
      0095FE CC 95 29         [ 2] 3701         JP     COMMA
                                   3702 
                                   3703 ;       AGAIN   ( a -- )
                                   3704 ;       Terminate a BEGIN-AGAIN
                                   3705 ;       infinite loop structure.
      009601 95 F0                 3706         .word      LINK
                           001583  3707 LINK = . 
      009603 85                    3708 	.byte      IMEDD+5
      009604 41 47 41 49 4E        3709         .ascii     "AGAIN"
      009609                       3710 AGAIN:
      009609 CD 95 6E         [ 4] 3711         CALL     COMPI
      00960C 85 2F                 3712         .word BRAN
      00960E CD 87 A4         [ 4] 3713         call ADRADJ 
      009611 CC 95 29         [ 2] 3714         JP     COMMA
                                   3715 
                                   3716 ;       IF      ( -- A )
                                   3717 ;       Begin a conditional branch.
      009614 96 03                 3718         .word      LINK
                           001596  3719 LINK = . 
      009616 82                    3720 	.byte      IMEDD+2
      009617 49 46                 3721         .ascii     "IF"
      009619                       3722 IFF:
      009619 CD 95 6E         [ 4] 3723         CALL     COMPI
      00961C 85 18                 3724         .word QBRAN
      00961E CD 8C 59         [ 4] 3725         CALL     HERE
      009621 CD 8B 6B         [ 4] 3726         CALL     ZERO
      009624 CC 95 29         [ 2] 3727         JP     COMMA
                                   3728 
                                   3729 ;       THEN        ( A -- )
                                   3730 ;       Terminate a conditional branch structure.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009627 96 16                 3731         .word      LINK
                           0015A9  3732 LINK = . 
      009629 84                    3733 	.byte      IMEDD+4
      00962A 54 48 45 4E           3734         .ascii     "THEN"
      00962E                       3735 THENN:
      00962E CD 8C 59         [ 4] 3736         CALL     HERE
      009631 CD 87 A4         [ 4] 3737         call ADRADJ 
      009634 CD 86 1A         [ 4] 3738         CALL     SWAPP
      009637 CC 85 4C         [ 2] 3739         JP     STORE
                                   3740 
                                   3741 ;       ELSE        ( A -- A )
                                   3742 ;       Start the false clause in an IF-ELSE-THEN structure.
      00963A 96 29                 3743         .word      LINK
                           0015BC  3744 LINK = . 
      00963C 84                    3745 	.byte      IMEDD+4
      00963D 45 4C 53 45           3746         .ascii     "ELSE"
      009641                       3747 ELSEE:
      009641 CD 95 6E         [ 4] 3748         CALL     COMPI
      009644 85 2F                 3749         .word BRAN
      009646 CD 8C 59         [ 4] 3750         CALL     HERE
      009649 CD 8B 6B         [ 4] 3751         CALL     ZERO
      00964C CD 95 29         [ 4] 3752         CALL     COMMA
      00964F CD 86 1A         [ 4] 3753         CALL     SWAPP
      009652 CD 8C 59         [ 4] 3754         CALL     HERE
      009655 CD 87 A4         [ 4] 3755         call ADRADJ 
      009658 CD 86 1A         [ 4] 3756         CALL     SWAPP
      00965B CC 85 4C         [ 2] 3757         JP     STORE
                                   3758 
                                   3759 ;       AHEAD       ( -- A )
                                   3760 ;       Compile a forward branch instruction.
      00965E 96 3C                 3761         .word      LINK
                           0015E0  3762 LINK = . 
      009660 85                    3763 	.byte      IMEDD+5
      009661 41 48 45 41 44        3764         .ascii     "AHEAD"
      009666                       3765 AHEAD:
      009666 CD 95 6E         [ 4] 3766         CALL     COMPI
      009669 85 2F                 3767         .word BRAN
      00966B CD 8C 59         [ 4] 3768         CALL     HERE
      00966E CD 8B 6B         [ 4] 3769         CALL     ZERO
      009671 CC 95 29         [ 2] 3770         JP     COMMA
                                   3771 
                                   3772 ;       WHILE       ( a -- A a )
                                   3773 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      009674 96 60                 3774         .word      LINK
                           0015F6  3775 LINK = . 
      009676 85                    3776 	.byte      IMEDD+5
      009677 57 48 49 4C 45        3777         .ascii     "WHILE"
      00967C                       3778 WHILE:
      00967C CD 95 6E         [ 4] 3779         CALL     COMPI
      00967F 85 18                 3780         .word QBRAN
      009681 CD 8C 59         [ 4] 3781         CALL     HERE
      009684 CD 8B 6B         [ 4] 3782         CALL     ZERO
      009687 CD 95 29         [ 4] 3783         CALL     COMMA
      00968A CC 86 1A         [ 2] 3784         JP     SWAPP
                                   3785 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3786 ;       REPEAT      ( A a -- )
                                   3787 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      00968D 96 76                 3788         .word      LINK
                           00160F  3789 LINK = . 
      00968F 86                    3790         .byte      IMEDD+6
      009690 52 45 50 45 41 54     3791         .ascii     "REPEAT"
      009696                       3792 REPEA:
      009696 CD 95 6E         [ 4] 3793         CALL     COMPI
      009699 85 2F                 3794         .word BRAN
      00969B CD 87 A4         [ 4] 3795         call ADRADJ 
      00969E CD 95 29         [ 4] 3796         CALL     COMMA
      0096A1 CD 8C 59         [ 4] 3797         CALL     HERE
      0096A4 CD 87 A4         [ 4] 3798         call ADRADJ 
      0096A7 CD 86 1A         [ 4] 3799         CALL     SWAPP
      0096AA CC 85 4C         [ 2] 3800         JP     STORE
                                   3801 
                                   3802 ;       AFT         ( a -- a A )
                                   3803 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      0096AD 96 8F                 3804         .word      LINK
                           00162F  3805 LINK = . 
      0096AF 83                    3806 	.byte      IMEDD+3
      0096B0 41 46 54              3807         .ascii     "AFT"
      0096B3                       3808 AFT:
      0096B3 CD 86 00         [ 4] 3809         CALL     DROP
      0096B6 CD 96 66         [ 4] 3810         CALL     AHEAD
      0096B9 CD 8C 59         [ 4] 3811         CALL     HERE
      0096BC CC 86 1A         [ 2] 3812         JP     SWAPP
                                   3813 
                                   3814 ;       ABORT"      ( -- ; <string> )
                                   3815 ;       Conditional abort with an error message.
      0096BF 96 AF                 3816         .word      LINK
                           001641  3817 LINK = . 
      0096C1 86                    3818 	.byte      IMEDD+6
      0096C2 41 42 4F 52 54        3819         .ascii     "ABORT"
      0096C7 22                    3820         .byte      '"'
      0096C8                       3821 ABRTQ:
      0096C8 CD 95 6E         [ 4] 3822         CALL     COMPI
      0096CB 93 EC                 3823         .word ABORQ
      0096CD CC 95 9E         [ 2] 3824         JP     STRCQ
                                   3825 
                                   3826 ;       $"     ( -- ; <string> )
                                   3827 ;       Compile an inline string literal.
      0096D0 96 C1                 3828         .word      LINK
                           001652  3829 LINK = . 
      0096D2 82                    3830 	.byte      IMEDD+2
      0096D3 24 22                 3831         .byte     '$','"'
      0096D5                       3832 STRQ:
      0096D5 CD 95 6E         [ 4] 3833         CALL     COMPI
      0096D8 90 06                 3834         .word STRQP 
      0096DA CC 95 9E         [ 2] 3835         JP     STRCQ
                                   3836 
                                   3837 ;       ."          ( -- ; <string> )
                                   3838 ;       Compile an inline string literal to be typed out at run time.
      0096DD 96 D2                 3839         .word      LINK
                           00165F  3840 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0096DF 82                    3841 	.byte      IMEDD+2
      0096E0 2E 22                 3842         .byte     '.','"'
      0096E2                       3843 DOTQ:
      0096E2 CD 95 6E         [ 4] 3844         CALL     COMPI
      0096E5 90 10                 3845         .word DOTQP 
      0096E7 CC 95 9E         [ 2] 3846         JP     STRCQ
                                   3847 
                                   3848 ;; Name compiler
                                   3849 
                                   3850 ;       ?UNIQUE ( a -- a )
                                   3851 ;       Display a warning message
                                   3852 ;       if word already exists.
      0096EA 96 DF                 3853         .word      LINK
                           00166C  3854 LINK = . 
      0096EC 07                    3855         .byte      7
      0096ED 3F 55 4E 49 51 55 45  3856         .ascii     "?UNIQUE"
      0096F4                       3857 UNIQU:
      0096F4 CD 86 0A         [ 4] 3858         CALL     DUPP
      0096F7 CD 92 E0         [ 4] 3859         CALL     NAMEQ   ;?name exists
      0096FA CD 85 18         [ 4] 3860         CALL     QBRAN
      0096FD 97 13                 3861         .word      UNIQ1
      0096FF CD 90 10         [ 4] 3862         CALL     DOTQP   ;redef are OK
      009702 07                    3863         .byte       7
      009703 20 72 65 44 65 66 20  3864         .ascii     " reDef "       
      00970A CD 86 34         [ 4] 3865         CALL     OVER
      00970D CD 8C 42         [ 4] 3866         CALL     COUNT
      009710 CD 8F B3         [ 4] 3867         CALL     TYPES   ;just in case
      009713 CC 86 00         [ 2] 3868 UNIQ1:  JP     DROP
                                   3869 
                                   3870 ;       $,n     ( na -- )
                                   3871 ;       Build a new dictionary name
                                   3872 ;       using string at na.
                                   3873 ; compile dans l'espace des variables 
      009716 96 EC                 3874         .word      LINK
                           001698  3875 LINK = . 
      009718 03                    3876         .byte      3
      009719 24 2C 6E              3877         .ascii     "$,n"
      00971C                       3878 SNAME:
      00971C CD 86 0A         [ 4] 3879         CALL     DUPP
      00971F CD 85 81         [ 4] 3880         CALL     CAT     ;?null input
      009722 CD 85 18         [ 4] 3881         CALL     QBRAN
      009725 97 52                 3882         .word      PNAM1
      009727 CD 96 F4         [ 4] 3883         CALL     UNIQU   ;?redefinition
      00972A CD 86 0A         [ 4] 3884         CALL     DUPP
      00972D CD 8C 42         [ 4] 3885         CALL     COUNT
      009730 CD 88 05         [ 4] 3886         CALL     PLUS
      009733 CD 87 58         [ 4] 3887         CALL     VPP
      009736 CD 85 4C         [ 4] 3888         CALL     STORE
      009739 CD 86 0A         [ 4] 3889         CALL     DUPP
      00973C CD 87 76         [ 4] 3890         CALL     LAST
      00973F CD 85 4C         [ 4] 3891         CALL     STORE   ;save na for vocabulary link
      009742 CD 8A E3         [ 4] 3892         CALL     CELLM   ;link address
      009745 CD 87 4A         [ 4] 3893         CALL     CNTXT
      009748 CD 85 63         [ 4] 3894         CALL     AT
      00974B CD 86 1A         [ 4] 3895         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      00974E CD 85 4C         [ 4] 3896         CALL     STORE
      009751 81               [ 4] 3897         RET     ;save code pointer
      009752 CD 90 06         [ 4] 3898 PNAM1:  CALL     STRQP
      009755 05                    3899         .byte      5
      009756 20 6E 61 6D 65        3900         .ascii     " name" ;null input
      00975B CC 93 F4         [ 2] 3901         JP     ABOR1
                                   3902 
                                   3903 ;; FORTH compiler
                                   3904 
                                   3905 ;       $COMPILE        ( a -- )
                                   3906 ;       Compile next word to
                                   3907 ;       dictionary as a token or literal.
      00975E 97 18                 3908         .word      LINK
                           0016E0  3909 LINK = . 
      009760 08                    3910         .byte      8
      009761 24 43 4F 4D 50 49 4C  3911         .ascii     "$COMPILE"
             45
      009769                       3912 SCOMP:
      009769 CD 92 E0         [ 4] 3913         CALL     NAMEQ
      00976C CD 87 B4         [ 4] 3914         CALL     QDUP    ;?defined
      00976F CD 85 18         [ 4] 3915         CALL     QBRAN
      009772 97 8A                 3916         .word      SCOM2
      009774 CD 85 63         [ 4] 3917         CALL     AT
      009777 CD 84 E5         [ 4] 3918         CALL     DOLIT
      00977A 80 00                 3919         .word     0x8000	;  IMEDD*256
      00977C CD 86 56         [ 4] 3920         CALL     ANDD    ;?immediate
      00977F CD 85 18         [ 4] 3921         CALL     QBRAN
      009782 97 87                 3922         .word      SCOM1
      009784 CC 85 3F         [ 2] 3923         JP     EXECU
      009787 CC 98 24         [ 2] 3924 SCOM1:  JP     JSRC
      00978A CD 8E 7E         [ 4] 3925 SCOM2:  CALL     NUMBQ   ;try to convert to number
      00978D CD 85 18         [ 4] 3926         CALL     QBRAN
      009790 93 F4                 3927         .word      ABOR1
      009792 CC 95 90         [ 2] 3928         JP     LITER
                                   3929 
                                   3930 ;       OVERT   ( -- )
                                   3931 ;       Link a new word into vocabulary.
      009795 97 60                 3932         .word      LINK
                           001717  3933 LINK = . 
      009797 05                    3934         .byte      5
      009798 4F 56 45 52 54        3935         .ascii     "OVERT"
      00979D                       3936 OVERT:
      00979D CD 87 76         [ 4] 3937         CALL     LAST
      0097A0 CD 85 63         [ 4] 3938         CALL     AT
      0097A3 CD 87 4A         [ 4] 3939         CALL     CNTXT
      0097A6 CC 85 4C         [ 2] 3940         JP     STORE
                                   3941 
                                   3942 ;       ;       ( -- )
                                   3943 ;       Terminate a colon definition.
      0097A9 97 97                 3944         .word      LINK
                           00172B  3945 LINK = . 
      0097AB C1                    3946 	.byte      IMEDD+COMPO+1
      0097AC 3B                    3947         .ascii     ";"
      0097AD                       3948 SEMIS:
                           000001  3949 .if OPTIMIZE ; more compact and faster
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0097AD CD 84 E5         [ 4] 3950         call DOLIT 
      0097B0 00 81                 3951         .word 0x81   ; opcode for RET 
      0097B2 CD 95 40         [ 4] 3952         call CCOMMA 
                           000000  3953 .else
                                   3954         CALL     COMPI
                                   3955         .word EXIT 
                                   3956 .endif 
      0097B5 CD 94 55         [ 4] 3957         CALL     LBRAC
      0097B8 CD 97 9D         [ 4] 3958         call OVERT 
      0097BB CD A1 A4         [ 4] 3959         CALL FMOVE
      0097BE CD 87 B4         [ 4] 3960         call QDUP 
      0097C1 CD 85 18         [ 4] 3961         call QBRAN 
      0097C4 98 F4                 3962         .word SET_RAMLAST 
      0097C6 CD A2 38         [ 4] 3963         CALL UPDATPTR
      0097C9 81               [ 4] 3964         RET 
                                   3965 
                                   3966 
                                   3967 ;       Terminate an ISR definition 
                                   3968 ;       retourn ca of ISR as double
                                   3969 ;       I; ( -- ud )
      0097CA 97 AB                 3970         .word LINK 
                           00174C  3971         LINK=.
      0097CC C2                    3972         .byte 2+IMEDD+COMPO 
      0097CD 49 3B                 3973         .ascii "I;" 
      0097CF                       3974 ISEMI:
      0097CF 1D 00 02         [ 2] 3975         subw x,#CELLL  
      0097D2 90 AE 00 80      [ 2] 3976         ldw y,#IRET_CODE 
      0097D6 FF               [ 2] 3977         ldw (x),y 
      0097D7 CD 95 40         [ 4] 3978         call CCOMMA
      0097DA CD 94 55         [ 4] 3979         call LBRAC 
      0097DD CD A2 7D         [ 4] 3980         call IFMOVE
      0097E0 CD 87 B4         [ 4] 3981         call QDUP 
      0097E3 CD 85 18         [ 4] 3982         CALL QBRAN 
      0097E6 98 F4                 3983         .word SET_RAMLAST
      0097E8 CD 87 66         [ 4] 3984         CALL CPP
      0097EB CD 85 63         [ 4] 3985         call AT 
      0097EE CD 86 1A         [ 4] 3986         call SWAPP 
      0097F1 CD 87 66         [ 4] 3987         CALL CPP 
      0097F4 CD 85 4C         [ 4] 3988         call STORE 
      0097F7 CD 9C 4C         [ 4] 3989         call UPDATCP 
      0097FA CD 9C 09         [ 4] 3990         call EEPVP 
      0097FD CD 86 00         [ 4] 3991         call DROP 
      009800 CD 85 63         [ 4] 3992         call AT 
      009803 CD 87 58         [ 4] 3993         call VPP 
      009806 CD 85 4C         [ 4] 3994         call STORE 
      009809 CC 8B 6B         [ 2] 3995         jp ZERO
      00980C 81               [ 4] 3996         ret           
                                   3997         
                                   3998 
                                   3999 ;       ]       ( -- )
                                   4000 ;       Start compiling words in
                                   4001 ;       input stream.
      00980D 97 CC                 4002         .word      LINK
                           00178F  4003 LINK = . 
      00980F 01                    4004         .byte      1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009810 5D                    4005         .ascii     "]"
      009811                       4006 RBRAC:
      009811 CD 84 E5         [ 4] 4007         CALL   DOLIT
      009814 97 69                 4008         .word  SCOMP
      009816 CD 87 28         [ 4] 4009         CALL   TEVAL
      009819 CC 85 4C         [ 2] 4010         JP     STORE
                                   4011 
                                   4012 ;       CALL,    ( ca -- )
                                   4013 ;       Compile a subroutine call.
      00981C 98 0F                 4014         .word      LINK
                           00179E  4015 LINK = . 
      00981E 05                    4016         .byte      5
      00981F 43 41 4C 4C 2C        4017         .ascii     "CALL,"
      009824                       4018 JSRC:
      009824 CD 84 E5         [ 4] 4019         CALL     DOLIT
      009827 00 CD                 4020         .word     CALLL     ;CALL
      009829 CD 95 40         [ 4] 4021         CALL     CCOMMA
      00982C CC 95 29         [ 2] 4022         JP     COMMA
                                   4023 
                                   4024 ;       INIT-OFS ( -- )
                                   4025 ;       compute offset to adjust jump address 
                                   4026 ;       set variable OFFSET 
      00982F 98 1E                 4027         .word LINK 
                           0017B1  4028         LINK=.
      009831 08                    4029         .byte 8 
      009832 49 4E 49 54 2D 4F 46  4030         .ascii "INIT-OFS" 
             53
      00983A                       4031 INITOFS:
      00983A CD 87 17         [ 4] 4032         call TFLASH 
      00983D CD 85 63         [ 4] 4033         CALL AT 
      009840 CD 86 0A         [ 4] 4034         CALL DUPP 
      009843 CD 85 18         [ 4] 4035         call QBRAN
      009846 98 57                 4036         .word 1$
      009848 CD 86 00         [ 4] 4037         call DROP  
      00984B CD 87 66         [ 4] 4038         call CPP 
      00984E CD 85 63         [ 4] 4039         call AT 
      009851 CD 8C 59         [ 4] 4040         call HERE
      009854 CD 88 7E         [ 4] 4041         call SUBB 
      009857 CD 87 9B         [ 4] 4042 1$:     call OFFSET 
      00985A CC 85 4C         [ 2] 4043         jp STORE  
                                   4044 
                                   4045 ;       :       ( -- ; <string> )
                                   4046 ;       Start a new colon definition
                                   4047 ;       using next word as its name.
      00985D 98 31                 4048         .word      LINK
                           0017DF  4049 LINK = . 
      00985F 01                    4050         .byte      1
      009860 3A                    4051         .ascii     ":"
      009861                       4052 COLON:
      009861 CD 98 3A         [ 4] 4053         call INITOFS       
      009864 CD 91 E3         [ 4] 4054         CALL   TOKEN
      009867 CD 97 1C         [ 4] 4055         CALL   SNAME
      00986A CC 98 11         [ 2] 4056         JP     RBRAC
                                   4057 
                                   4058 ;       I:  ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   4059 ;       Start interrupt service routine definition
                                   4060 ;       those definition have no name.
      00986D 98 5F                 4061         .word LINK
                           0017EF  4062         LINK=.
      00986F 02                    4063         .byte 2 
      009870 49 3A                 4064         .ascii "I:" 
      009872                       4065 ICOLON:
      009872 CD 98 3A         [ 4] 4066         call INITOFS 
      009875 CC 98 11         [ 2] 4067         jp RBRAC  
                                   4068 
                                   4069 ;       IMMEDIATE       ( -- )
                                   4070 ;       Make last compiled word
                                   4071 ;       an immediate word.
      009878 98 6F                 4072         .word      LINK
                           0017FA  4073 LINK = . 
      00987A 09                    4074         .byte      9
      00987B 49 4D 4D 45 44 49 41  4075         .ascii     "IMMEDIATE"
             54 45
      009884                       4076 IMMED:
      009884 CD 84 E5         [ 4] 4077         CALL     DOLIT
      009887 80 00                 4078         .word     0x8000	;  IMEDD*256
      009889 CD 87 76         [ 4] 4079         CALL     LAST
      00988C CD 85 63         [ 4] 4080         CALL     AT
      00988F CD 85 63         [ 4] 4081         CALL     AT
      009892 CD 86 6A         [ 4] 4082         CALL     ORR
      009895 CD 87 76         [ 4] 4083         CALL     LAST
      009898 CD 85 63         [ 4] 4084         CALL     AT
      00989B CC 85 4C         [ 2] 4085         JP     STORE
                                   4086 
                                   4087 ;; Defining words
                                   4088 
                                   4089 ;       CREATE  ( -- ; <string> )
                                   4090 ;       Compile a new array
                                   4091 ;       without allocating space.
      00989E 98 7A                 4092         .word      LINK
                           001820  4093 LINK = . 
      0098A0 06                    4094         .byte      6
      0098A1 43 52 45 41 54 45     4095         .ascii     "CREATE"
      0098A7                       4096 CREAT:
      0098A7 CD 91 E3         [ 4] 4097         CALL     TOKEN
      0098AA CD 97 1C         [ 4] 4098         CALL     SNAME
      0098AD CD 97 9D         [ 4] 4099         CALL     OVERT        
      0098B0 CD 95 6E         [ 4] 4100         CALL     COMPI 
      0098B3 86 B7                 4101         .word DOVAR 
      0098B5 81               [ 4] 4102         RET
                                   4103 
                                   4104 ;       VARIABLE        ( -- ; <string> )
                                   4105 ;       Compile a new variable
                                   4106 ;       initialized to 0.
      0098B6 98 A0                 4107         .word      LINK
                           001838  4108 LINK = . 
      0098B8 08                    4109         .byte      8
      0098B9 56 41 52 49 41 42 4C  4110         .ascii     "VARIABLE"
             45
      0098C1                       4111 VARIA:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                   4112 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      0098C1 CD 8C 59         [ 4] 4113         CALL HERE
      0098C4 CD 86 0A         [ 4] 4114         CALL DUPP 
      0098C7 CD 8A D4         [ 4] 4115         CALL CELLP
      0098CA CD 87 58         [ 4] 4116         CALL VPP 
      0098CD CD 85 4C         [ 4] 4117         CALL STORE
      0098D0 CD 98 A7         [ 4] 4118         CALL CREAT
      0098D3 CD 86 0A         [ 4] 4119         CALL DUPP
      0098D6 CD 95 29         [ 4] 4120         CALL COMMA
      0098D9 CD 8B 6B         [ 4] 4121         CALL ZERO
      0098DC CD 86 1A         [ 4] 4122         call SWAPP 
      0098DF CD 85 4C         [ 4] 4123         CALL STORE
      0098E2 CD A1 A4         [ 4] 4124         CALL FMOVE ; move definition to FLASH
      0098E5 CD 87 B4         [ 4] 4125         CALL QDUP 
      0098E8 CD 85 18         [ 4] 4126         CALL QBRAN 
      0098EB 98 F4                 4127         .word SET_RAMLAST   
      0098ED CD 9C 63         [ 4] 4128         call UPDATVP  ; don't update if variable kept in RAM.
      0098F0 CD A2 38         [ 4] 4129         CALL UPDATPTR
      0098F3 81               [ 4] 4130         RET         
      0098F4                       4131 SET_RAMLAST: 
      0098F4 CD 87 76         [ 4] 4132         CALL LAST 
      0098F7 CD 85 63         [ 4] 4133         CALL AT 
      0098FA CD 87 89         [ 4] 4134         CALL RAMLAST 
      0098FD CC 85 4C         [ 2] 4135         jp STORE  
                                   4136 
                                   4137 
                                   4138 ;       CONSTANT  ( n -- ; <string> )
                                   4139 ;       Compile a new constant 
                                   4140 ;       n CONSTANT name 
      009900 98 B8                 4141         .word LINK 
                           001882  4142         LINK=. 
      009902 08                    4143         .byte 8 
      009903 43 4F 4E 53 54 41 4E  4144         .ascii "CONSTANT" 
             54
      00990B                       4145 CONSTANT:          
      00990B CD 91 E3         [ 4] 4146         CALL TOKEN
      00990E CD 97 1C         [ 4] 4147         CALL SNAME 
      009911 CD 97 9D         [ 4] 4148         CALL OVERT 
      009914 CD 95 6E         [ 4] 4149         CALL COMPI 
      009917 99 35                 4150         .word DOCONST
      009919 CD 95 29         [ 4] 4151         CALL COMMA 
      00991C CD A1 A4         [ 4] 4152         CALL FMOVE
      00991F CD 87 B4         [ 4] 4153         CALL QDUP 
      009922 CD 85 18         [ 4] 4154         CALL QBRAN 
      009925 98 F4                 4155         .word SET_RAMLAST  
      009927 CD A2 38         [ 4] 4156         CALL UPDATPTR  
      00992A 81               [ 4] 4157 1$:     RET          
                                   4158 
                                   4159 ; CONSTANT runtime semantic 
                                   4160 ; doCONST  ( -- n )
      00992B 99 02                 4161         .word LINK 
                           0018AD  4162         LINK=.
      00992D 07                    4163         .byte 7
      00992E 44 4F 43 4F 4E 53 54  4164         .ascii "DOCONST"
      009935                       4165 DOCONST:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      009935 1D 00 02         [ 2] 4166         subw x,#CELLL
      009938 90 85            [ 2] 4167         popw y 
      00993A 90 FE            [ 2] 4168         ldw y,(y) 
      00993C FF               [ 2] 4169         ldw (x),y 
      00993D 81               [ 4] 4170         ret 
                                   4171 
                                   4172 ;----------------------------------
                                   4173 ; create double constant 
                                   4174 ; DCONST ( d -- ; <string> )
                                   4175 ;----------------------------------
      00993E 99 2D                 4176     .word LINK 
                           0018C0  4177     LINK=.
      009940 06                    4178     .byte 6 
      009941 44 43 4F 4E 53 54     4179     .ascii "DCONST"
      009947                       4180 DCONST:
      009947 CD 91 E3         [ 4] 4181         CALL TOKEN
      00994A CD 97 1C         [ 4] 4182         CALL SNAME 
      00994D CD 97 9D         [ 4] 4183         CALL OVERT 
      009950 CD 95 6E         [ 4] 4184         CALL COMPI 
      009953 99 76                 4185         .word DO_DCONST
      009955 CD 95 29         [ 4] 4186         CALL COMMA
      009958 CD 95 29         [ 4] 4187         CALL COMMA  
      00995B CD A1 A4         [ 4] 4188         CALL FMOVE
      00995E CD 87 B4         [ 4] 4189         CALL QDUP 
      009961 CD 85 18         [ 4] 4190         CALL QBRAN 
      009964 98 F4                 4191         .word SET_RAMLAST  
      009966 CD A2 38         [ 4] 4192         CALL UPDATPTR  
      009969 81               [ 4] 4193 1$:     RET          
                                   4194     
                                   4195 ;----------------------------------
                                   4196 ; runtime for DCONST 
                                   4197 ; stack double constant 
                                   4198 ; DO-DCONST ( -- d )
                                   4199 ;-----------------------------------
      00996A 99 40                 4200         .word LINK 
                           0018EC  4201         LINK=.
      00996C 09                    4202         .byte 9 
      00996D 44 4F 2D 44 43 4F 4E  4203         .ascii "DO-DCONST"
             53 54
      009976                       4204 DO_DCONST:
      009976 90 85            [ 2] 4205     popw y 
      009978 90 BF 24         [ 2] 4206     ldw YTEMP,y 
      00997B 1D 00 04         [ 2] 4207     subw x,#2*CELLL 
      00997E 90 FE            [ 2] 4208     ldw y,(y)
      009980 FF               [ 2] 4209     ldw (x),y 
      009981 90 BE 24         [ 2] 4210     ldw y,YTEMP 
      009984 90 EE 02         [ 2] 4211     ldw y,(2,y)
      009987 EF 02            [ 2] 4212     ldw (2,x),y 
      009989 81               [ 4] 4213     ret 
                                   4214 
                                   4215 ;; Tools
                                   4216 
                                   4217 ;       _TYPE   ( b u -- )
                                   4218 ;       Display a string. Filter
                                   4219 ;       non-printing characters.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      00998A 99 6C                 4220         .word      LINK
                           00190C  4221 LINK = . 
      00998C 05                    4222         .byte      5
      00998D 5F 54 59 50 45        4223         .ascii     "_TYPE"
      009992                       4224 UTYPE:
      009992 CD 85 D3         [ 4] 4225         CALL     TOR     ;start count down loop
      009995 20 0F            [ 2] 4226         JRA     UTYP2   ;skip first pass
      009997 CD 86 0A         [ 4] 4227 UTYP1:  CALL     DUPP
      00999A CD 85 81         [ 4] 4228         CALL     CAT
      00999D CD 8B 95         [ 4] 4229         CALL     TCHAR
      0099A0 CD 84 A4         [ 4] 4230         CALL     EMIT    ;display only printable
      0099A3 CD 8A FF         [ 4] 4231         CALL     ONEP    ;increment address
      0099A6 CD 84 F9         [ 4] 4232 UTYP2:  CALL     DONXT
      0099A9 99 97                 4233         .word      UTYP1   ;loop till done
      0099AB CC 86 00         [ 2] 4234         JP     DROP
                                   4235 
                                   4236 ;       dm+     ( a u -- a )
                                   4237 ;       Dump u bytes from ,
                                   4238 ;       leaving a+u on  stack.
      0099AE 99 8C                 4239         .word      LINK
                           001930  4240 LINK = . 
      0099B0 03                    4241         .byte      3
      0099B1 64 6D 2B              4242         .ascii     "dm+"
      0099B4                       4243 DUMPP:
      0099B4 CD 86 34         [ 4] 4244         CALL     OVER
      0099B7 CD 84 E5         [ 4] 4245         CALL     DOLIT
      0099BA 00 04                 4246         .word      4
      0099BC CD 90 39         [ 4] 4247         CALL     UDOTR   ;display address
      0099BF CD 8F 89         [ 4] 4248         CALL     SPACE
      0099C2 CD 85 D3         [ 4] 4249         CALL     TOR     ;start count down loop
      0099C5 20 11            [ 2] 4250         JRA     PDUM2   ;skip first pass
      0099C7 CD 86 0A         [ 4] 4251 PDUM1:  CALL     DUPP
      0099CA CD 85 81         [ 4] 4252         CALL     CAT
      0099CD CD 84 E5         [ 4] 4253         CALL     DOLIT
      0099D0 00 03                 4254         .word      3
      0099D2 CD 90 39         [ 4] 4255         CALL     UDOTR   ;display numeric data
      0099D5 CD 8A FF         [ 4] 4256         CALL     ONEP    ;increment address
      0099D8 CD 84 F9         [ 4] 4257 PDUM2:  CALL     DONXT
      0099DB 99 C7                 4258         .word      PDUM1   ;loop till done
      0099DD 81               [ 4] 4259         RET
                                   4260 
                                   4261 ;       DUMP    ( a u -- )
                                   4262 ;       Dump u bytes from a,
                                   4263 ;       in a formatted manner.
      0099DE 99 B0                 4264         .word      LINK
                           001960  4265 LINK = . 
      0099E0 04                    4266         .byte      4
      0099E1 44 55 4D 50           4267         .ascii     "DUMP"
      0099E5                       4268 DUMP:
      0099E5 CD 86 C7         [ 4] 4269         CALL     BASE
      0099E8 CD 85 63         [ 4] 4270         CALL     AT
      0099EB CD 85 D3         [ 4] 4271         CALL     TOR
      0099EE CD 8E 11         [ 4] 4272         CALL     HEX     ;save radix, set hex
      0099F1 CD 84 E5         [ 4] 4273         CALL     DOLIT
      0099F4 00 10                 4274         .word      16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0099F6 CD 8A 25         [ 4] 4275         CALL     SLASH   ;change count to lines
      0099F9 CD 85 D3         [ 4] 4276         CALL     TOR     ;start count down loop
      0099FC CD 8F D1         [ 4] 4277 DUMP1:  CALL     CR
      0099FF CD 84 E5         [ 4] 4278         CALL     DOLIT
      009A02 00 10                 4279         .word      16
      009A04 CD 87 F0         [ 4] 4280         CALL     DDUP
      009A07 CD 99 B4         [ 4] 4281         CALL     DUMPP   ;display numeric
      009A0A CD 87 C5         [ 4] 4282         CALL     ROT
      009A0D CD 87 C5         [ 4] 4283         CALL     ROT
      009A10 CD 8F 89         [ 4] 4284         CALL     SPACE
      009A13 CD 8F 89         [ 4] 4285         CALL     SPACE
      009A16 CD 99 92         [ 4] 4286         CALL     UTYPE   ;display printable characters
      009A19 CD 84 F9         [ 4] 4287         CALL     DONXT
      009A1C 99 FC                 4288         .word      DUMP1   ;loop till done
      009A1E CD 86 00         [ 4] 4289 DUMP3:  CALL     DROP
      009A21 CD 85 B4         [ 4] 4290         CALL     RFROM
      009A24 CD 86 C7         [ 4] 4291         CALL     BASE
      009A27 CC 85 4C         [ 2] 4292         JP     STORE   ;restore radix
                                   4293 
                                   4294 ;       .S      ( ... -- ... )
                                   4295 ;        Display  contents of stack.
      009A2A 99 E0                 4296         .word      LINK
                           0019AC  4297 LINK = . 
      009A2C 02                    4298         .byte      2
      009A2D 2E 53                 4299         .ascii     ".S"
      009A2F                       4300 DOTS:
      009A2F CD 8F D1         [ 4] 4301         CALL     CR
      009A32 CD 8B AD         [ 4] 4302         CALL     DEPTH   ;stack depth
      009A35 CD 85 D3         [ 4] 4303         CALL     TOR     ;start count down loop
      009A38 20 09            [ 2] 4304         JRA     DOTS2   ;skip first pass
      009A3A CD 85 C7         [ 4] 4305 DOTS1:  CALL     RAT
      009A3D CD 8B C4         [ 4] 4306 	CALL     PICK
      009A40 CD 90 6C         [ 4] 4307         CALL     DOT     ;index stack, display contents
      009A43 CD 84 F9         [ 4] 4308 DOTS2:  CALL     DONXT
      009A46 9A 3A                 4309         .word      DOTS1   ;loop till done
      009A48 CD 90 10         [ 4] 4310         CALL     DOTQP
      009A4B 05                    4311         .byte      5
      009A4C 20 3C 73 70 20        4312         .ascii     " <sp "
      009A51 81               [ 4] 4313         RET
                                   4314 
                                   4315 ;       >NAME   ( ca -- na | F )
                                   4316 ;       Convert code address
                                   4317 ;       to a name address.
      009A52 9A 2C                 4318         .word      LINK
                           0019D4  4319 LINK = . 
      009A54 05                    4320         .byte      5
      009A55 3E 4E 41 4D 45        4321         .ascii     ">NAME"
      009A5A                       4322 TNAME:
      009A5A CD 87 4A         [ 4] 4323         CALL     CNTXT   ;vocabulary link
      009A5D CD 85 63         [ 4] 4324 TNAM2:  CALL     AT
      009A60 CD 86 0A         [ 4] 4325         CALL     DUPP    ;?last word in a vocabulary
      009A63 CD 85 18         [ 4] 4326         CALL     QBRAN
      009A66 9A 81                 4327         .word      TNAM4
      009A68 CD 87 F0         [ 4] 4328         CALL     DDUP
      009A6B CD 91 F1         [ 4] 4329         CALL     NAMET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      009A6E CD 86 7F         [ 4] 4330         CALL     XORR    ;compare
      009A71 CD 85 18         [ 4] 4331         CALL     QBRAN
      009A74 9A 7B                 4332         .word      TNAM3
      009A76 CD 8A E3         [ 4] 4333         CALL     CELLM   ;continue with next word
      009A79 20 E2            [ 2] 4334         JRA     TNAM2
      009A7B CD 86 1A         [ 4] 4335 TNAM3:  CALL     SWAPP
      009A7E CC 86 00         [ 2] 4336         JP     DROP
      009A81 CD 87 E5         [ 4] 4337 TNAM4:  CALL     DDROP
      009A84 CC 8B 6B         [ 2] 4338         JP     ZERO
                                   4339 
                                   4340 ;       .ID     ( na -- )
                                   4341 ;        Display  name at address.
      009A87 9A 54                 4342         .word      LINK
                           001A09  4343 LINK = . 
      009A89 03                    4344         .byte      3
      009A8A 2E 49 44              4345         .ascii     ".ID"
      009A8D                       4346 DOTID:
      009A8D CD 87 B4         [ 4] 4347         CALL     QDUP    ;if zero no name
      009A90 CD 85 18         [ 4] 4348         CALL     QBRAN
      009A93 9A A3                 4349         .word      DOTI1
      009A95 CD 8C 42         [ 4] 4350         CALL     COUNT
      009A98 CD 84 E5         [ 4] 4351         CALL     DOLIT
      009A9B 00 1F                 4352         .word      0x1F
      009A9D CD 86 56         [ 4] 4353         CALL     ANDD    ;mask lexicon bits
      009AA0 CC 99 92         [ 2] 4354         JP     UTYPE
      009AA3 CD 90 10         [ 4] 4355 DOTI1:  CALL     DOTQP
      009AA6 09                    4356         .byte      9
      009AA7 20 6E 6F 4E 61 6D 65  4357         .ascii     " noName"
      009AAE 81               [ 4] 4358         RET
                                   4359 
                           000000  4360 WANT_SEE=0
                           000000  4361 .if WANT_SEE 
                                   4362 ;       SEE     ( -- ; <string> )
                                   4363 ;       A simple decompiler.
                                   4364 ;       Updated for byte machines.
                                   4365         .word      LINK
                                   4366 LINK = . 
                                   4367         .byte      3
                                   4368         .ascii     "SEE"
                                   4369 SEE:
                                   4370         CALL     TICK    ;starting address
                                   4371         CALL     CR
                                   4372         CALL     ONEM
                                   4373 SEE1:   CALL     ONEP
                                   4374         CALL     DUPP
                                   4375         CALL     AT
                                   4376         CALL     DUPP
                                   4377         CALL     QBRAN
                                   4378         .word    SEE2
                                   4379         CALL     TNAME   ;?is it a name
                                   4380 SEE2:   CALL     QDUP    ;name address or zero
                                   4381         CALL     QBRAN
                                   4382         .word    SEE3
                                   4383         CALL     SPACE
                                   4384         CALL     DOTID   ;display name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4385         CALL     ONEP
                                   4386         JRA      SEE4
                                   4387 SEE3:   CALL     DUPP
                                   4388         CALL     CAT
                                   4389         CALL     UDOT    ;display number
                                   4390 SEE4:   CALL     NUFQ    ;user control
                                   4391         CALL     QBRAN
                                   4392         .word    SEE1
                                   4393         JP     DROP
                                   4394 .endif ; WANT_SEE 
                                   4395 
                                   4396 ;       WORDS   ( -- )
                                   4397 ;       Display names in vocabulary.
      009AAF 9A 89                 4398         .word      LINK
                           001A31  4399 LINK = . 
      009AB1 05                    4400         .byte      5
      009AB2 57 4F 52 44 53        4401         .ascii     "WORDS"
      009AB7                       4402 WORDS:
      009AB7 CD 8F D1         [ 4] 4403         CALL     CR
      009ABA CD 87 4A         [ 4] 4404         CALL     CNTXT   ;only in context
      009ABD CD 85 63         [ 4] 4405 WORS1:  CALL     AT
      009AC0 CD 87 B4         [ 4] 4406         CALL     QDUP    ;?at end of list
      009AC3 CD 85 18         [ 4] 4407         CALL     QBRAN
      009AC6 9A D9                 4408         .word      WORS2
      009AC8 CD 86 0A         [ 4] 4409         CALL     DUPP
      009ACB CD 8F 89         [ 4] 4410         CALL     SPACE
      009ACE CD 9A 8D         [ 4] 4411         CALL     DOTID   ;display a name
      009AD1 CD 8A E3         [ 4] 4412         CALL     CELLM
      009AD4 CD 85 2F         [ 4] 4413         CALL     BRAN
      009AD7 9A BD                 4414         .word      WORS1
      009AD9 81               [ 4] 4415 WORS2:  RET
                                   4416 
                                   4417         
                                   4418 ;; Hardware reset
                                   4419 
                                   4420 ;       hi      ( -- )
                                   4421 ;       Display sign-on message.
      009ADA 9A B1                 4422         .word      LINK
                           001A5C  4423 LINK = . 
      009ADC 02                    4424         .byte      2
      009ADD 68 69                 4425         .ascii     "hi"
      009ADF                       4426 HI:
      009ADF CD 8F D1         [ 4] 4427         CALL     CR
      009AE2 CD 90 10         [ 4] 4428         CALL     DOTQP   ;initialize I/O
      009AE5 0F                    4429         .byte      15
      009AE6 73 74 6D 38 65 46 6F  4430         .ascii     "stm8eForth v"
             72 74 68 20 76
      009AF2 33                    4431 	.byte      VER+'0'
      009AF3 2E                    4432         .byte      '.' 
      009AF4 30                    4433 	.byte      EXT+'0' ;version
      009AF5 CD 90 10         [ 4] 4434         CALL    DOTQP
                           000000  4435 .if NUCLEO          
                                   4436         .byte 18
                                   4437         .ascii  " on NUCLEO-8S208RB"
                                   4438 .endif
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                           000000  4439 .if DISCOVERY
                                   4440         .byte 19
                                   4441         .ascii  " on STM8S-DISCOVERY"
                                   4442 .endif
                           000001  4443 .if DOORBELL
      009AF8 10                    4444         .byte 16
      009AF9 20 6F 6E 20 73 74 6D  4445         .ascii " on stm8s105k6b6"
             38 73 31 30 35 6B 36
             62 36
                                   4446 .endif
      009B09 CC 8F D1         [ 2] 4447         JP     CR
                                   4448 
                           000000  4449 WANT_DEBUG=0
                           000000  4450 .if WANT_DEBUG 
                                   4451 ;       DEBUG      ( -- )
                                   4452 ;       Display sign-on message.
                                   4453 ;        .word      LINK
                                   4454 LINK = . 
                                   4455         .byte      5
                                   4456         .ascii     "DEBUG"
                                   4457 DEBUG:
                                   4458 	CALL DOLIT
                                   4459 	.word 0x65
                                   4460 	CALL EMIT
                                   4461 	CALL DOLIT
                                   4462 	.word 0
                                   4463  	CALL ZLESS 
                                   4464 	CALL DOLIT
                                   4465 	.word 0xFFFE
                                   4466 	CALL ZLESS 
                                   4467 	CALL UPLUS 
                                   4468  	CALL DROP 
                                   4469 	CALL DOLIT
                                   4470 	.word 3
                                   4471 	CALL UPLUS 
                                   4472 	CALL UPLUS 
                                   4473  	CALL DROP
                                   4474 	CALL DOLIT
                                   4475 	.word 0x43
                                   4476 	CALL UPLUS 
                                   4477  	CALL DROP
                                   4478 	CALL EMIT
                                   4479 	CALL DOLIT
                                   4480 	.word 0x4F
                                   4481 	CALL DOLIT
                                   4482 	.word 0x6F
                                   4483  	CALL XORR
                                   4484 	CALL DOLIT
                                   4485 	.word 0xF0
                                   4486  	CALL ANDD
                                   4487 	CALL DOLIT
                                   4488 	.word 0x4F
                                   4489  	CALL ORR
                                   4490 	CALL EMIT
                                   4491 	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4492 	.word 8
                                   4493 	CALL DOLIT
                                   4494 	.word 6
                                   4495  	CALL SWAPP
                                   4496 	CALL OVER
                                   4497 	CALL XORR
                                   4498 	CALL DOLIT
                                   4499 	.word 3
                                   4500 	CALL ANDD 
                                   4501 	CALL ANDD
                                   4502 	CALL DOLIT
                                   4503 	.word 0x70
                                   4504 	CALL UPLUS 
                                   4505 	CALL DROP
                                   4506 	CALL EMIT
                                   4507 	CALL DOLIT
                                   4508 	.word 0
                                   4509 	CALL QBRAN
                                   4510 	.word DEBUG1
                                   4511 	CALL DOLIT
                                   4512 	.word 0x3F
                                   4513 DEBUG1:
                                   4514 	CALL DOLIT
                                   4515 	.word 0xFFFF
                                   4516 	CALL QBRAN
                                   4517 	.word DEBUG2
                                   4518 	CALL DOLIT
                                   4519 	.word 0x74
                                   4520 	CALL BRAN
                                   4521 	.word DEBUG3
                                   4522 DEBUG2:
                                   4523 	CALL DOLIT
                                   4524 	.word 0x21
                                   4525 DEBUG3:
                                   4526 	CALL EMIT
                                   4527 	CALL DOLIT
                                   4528 	.word 0x68
                                   4529 	CALL DOLIT
                                   4530 	.word 0x80
                                   4531 	CALL STORE
                                   4532 	CALL DOLIT
                                   4533 	.word 0x80
                                   4534 	CALL AT
                                   4535 	CALL EMIT
                                   4536 	CALL DOLIT
                                   4537 	.word 0x4D
                                   4538 	CALL TOR
                                   4539 	CALL RAT
                                   4540 	CALL RFROM
                                   4541 	CALL ANDD
                                   4542 	CALL EMIT
                                   4543 	CALL DOLIT
                                   4544 	.word 0x61
                                   4545 	CALL DOLIT
                                   4546 	.word 0xA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4547 	CALL TOR
                                   4548 DEBUG4:
                                   4549 	CALL DOLIT
                                   4550 	.word 1
                                   4551 	CALL UPLUS 
                                   4552 	CALL DROP
                                   4553 	CALL DONXT
                                   4554 	.word DEBUG4
                                   4555 	CALL EMIT
                                   4556 	CALL DOLIT
                                   4557 	.word 0x656D
                                   4558 	CALL DOLIT
                                   4559 	.word 0x100
                                   4560 	CALL UMSTA
                                   4561 	CALL SWAPP
                                   4562 	CALL DOLIT
                                   4563 	.word 0x100
                                   4564 	CALL UMSTA
                                   4565 	CALL SWAPP 
                                   4566 	CALL DROP
                                   4567 	CALL EMIT
                                   4568 	CALL EMIT
                                   4569 	CALL DOLIT
                                   4570 	.word 0x2043
                                   4571 	CALL DOLIT
                                   4572 	.word 0
                                   4573 	CALL DOLIT
                                   4574 	.word 0x100
                                   4575 	CALL UMMOD
                                   4576 	CALL EMIT
                                   4577 	CALL EMIT
                                   4578 	;JP ORIG
                                   4579 	RET
                                   4580 .endif ; WANT_DEBUG 
                                   4581 
                                   4582 
                                   4583 ;       'BOOT   ( -- a )
                                   4584 ;       The application startup vector.
      009B0C 9A DC                 4585         .word      LINK
                           001A8E  4586 LINK = . 
      009B0E 05                    4587         .byte      5
      009B0F 27 42 4F 4F 54        4588         .ascii     "'BOOT"
      009B14                       4589 TBOOT:
      009B14 CD 86 B7         [ 4] 4590         CALL     DOVAR
      009B17 40 02                 4591         .word    APP_RUN      ;application to boot
                                   4592 
                                   4593 ;       COLD    ( -- )
                                   4594 ;       The hilevel cold start s=ence.
      009B19 9B 0E                 4595         .word      LINK
                           001A9B  4596         LINK = . 
      009B1B 04                    4597         .byte      4
      009B1C 43 4F 4C 44           4598         .ascii     "COLD"
      009B20                       4599 COLD:
                           000000  4600 .if WANT_DEBUG
                                   4601         CALL DEBUG
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4602 .endif ; WANT_DEBUG
      009B20 CD 84 E5         [ 4] 4603 COLD1:  CALL     DOLIT
      009B23 80 AB                 4604         .word      UZERO
      009B25 CD 84 E5         [ 4] 4605 	CALL     DOLIT
      009B28 00 06                 4606         .word      UPP
      009B2A CD 84 E5         [ 4] 4607         CALL     DOLIT
      009B2D 00 1A                 4608 	.word      UEND-UZERO
      009B2F CD 8C A6         [ 4] 4609         CALL     CMOVE   ;initialize user area
                                   4610 
                                   4611 ; if APP_RUN==0 initialize with ca de 'hi'  
      009B32 90 CE 40 02      [ 2] 4612         ldw y,APP_RUN 
      009B36 26 0B            [ 1] 4613         jrne 0$
      009B38 1D 00 02         [ 2] 4614         subw x,#CELLL 
      009B3B 90 AE 9A DF      [ 2] 4615         ldw y,#HI  
      009B3F FF               [ 2] 4616         ldw (x),y
      009B40 CD 9C 3B         [ 4] 4617         call UPDATRUN 
      009B43                       4618 0$:        
                                   4619 ; update LAST with APP_LAST 
                                   4620 ; if APP_LAST > LAST else do the opposite
      009B43 90 CE 40 00      [ 2] 4621         ldw y,APP_LAST 
      009B47 90 B3 1A         [ 2] 4622         cpw y,ULAST 
      009B4A 22 05            [ 1] 4623         jrugt 1$ 
                                   4624 ; save LAST at APP_LAST  
      009B4C CD 9C 23         [ 4] 4625         call UPDATLAST 
      009B4F 20 06            [ 2] 4626         jra 2$
      009B51                       4627 1$: ; update LAST with APP_LAST 
      009B51 90 BF 1A         [ 2] 4628         ldw ULAST,y
      009B54 90 BF 14         [ 2] 4629         ldw UCNTXT,y
      009B57                       4630 2$:  
                                   4631 ; update APP_CP if < app_space 
      009B57 90 CE 40 04      [ 2] 4632         ldw y,APP_CP  
      009B5B 90 B3 18         [ 2] 4633         cpw y,UCP   
      009B5E 24 06            [ 1] 4634         jruge 3$ 
      009B60 CD 9C 4C         [ 4] 4635         call UPDATCP
      009B63 90 BE 18         [ 2] 4636         ldw y,UCP   
      009B66                       4637 3$:
      009B66 90 BF 18         [ 2] 4638         ldw UCP,y                 
                                   4639 ; update UVP with APP_VP  
                                   4640 ; if APP_VP>UVP else do the opposite 
      009B69 90 CE 40 06      [ 2] 4641         ldw y,APP_VP 
      009B6D 90 B3 16         [ 2] 4642         cpw y,UVP 
      009B70 22 05            [ 1] 4643         jrugt 4$
      009B72 CD 9C 63         [ 4] 4644         call UPDATVP 
      009B75 20 03            [ 2] 4645         jra 6$
      009B77                       4646 4$: ; update UVP with APP_VP 
      009B77 90 BF 16         [ 2] 4647         ldw UVP,y 
      009B7A                       4648 6$:      
      009B7A CD 94 D4         [ 4] 4649         CALL     PRESE   ;initialize data stack and TIB
      009B7D CD 9B 14         [ 4] 4650         CALL     TBOOT
      009B80 CD 8C 8F         [ 4] 4651         CALL     ATEXE   ;application boot
      009B83 CD 97 9D         [ 4] 4652         CALL     OVERT
      009B86 CC 94 F1         [ 2] 4653         JP     QUIT    ;start interpretation
                                   4654 
                                   4655 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4656         .include "flash.asm"
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
                                     27 ; initialize FPTR 
                                     28 ; FP!  ( ud -- )
                                     29 ;---------------------------------
      009B89 9B 1B                   30     .word LINK 
                           001B0B    31     LINK=.
      009B8B 03                      32     .byte 3 
      009B8C 46 50 21                33     .ascii "FP!"
      009B8F                         34 FPSTOR:
      009B8F 90 93            [ 1]   35     ldw y,x
      009B91 90 FE            [ 2]   36     ldw y,(y)
      009B93 90 9F            [ 1]   37     ld a,yl 
      009B95 B7 32            [ 1]   38     ld FPTR,a 
      009B97 1C 00 02         [ 2]   39     addw x,#CELLL 
      009B9A 90 93            [ 1]   40     ldw y,x 
      009B9C 90 FE            [ 2]   41     ldw y,(y)
      009B9E 90 BF 33         [ 2]   42     ldw PTR16,y
      009BA1 1C 00 02         [ 2]   43     addw x,#CELLL 
      009BA4 81               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009BA5 9B 8B                   51     .word LINK 
                           001B27    52 LINK=.
      009BA7 06                      53     .byte 6 
      009BA8 45 45 50 52 4F 4D       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009BAE                         55 EEPROM: 
      009BAE 90 AE 40 00      [ 2]   56     ldw y,#EEPROM_BASE
      009BB2 1D 00 04         [ 2]   57     subw x,#2*CELLL 
      009BB5 EF 02            [ 2]   58     ldw (2,x),y 
      009BB7 90 5F            [ 1]   59     clrw y 
      009BB9 FF               [ 2]   60     ldw (x),y 
      009BBA 81               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      009BBB 9B A7                   67 	.word LINK 
                           001B3D    68 	LINK=.
      009BBD 08                      69 	.byte 8 
      009BBE 45 45 50 2D 4C 41 53    70 	.ascii "EEP-LAST"
             54
      009BC6                         71 EEPLAST:
      009BC6 1D 00 04         [ 2]   72 	subw x,#2*CELLL 
      009BC9 90 AE 40 00      [ 2]   73 	ldw y,#APP_LAST 
      009BCD EF 02            [ 2]   74 	ldw (2,x),y 
      009BCF 90 5F            [ 1]   75 	clrw y 
      009BD1 FF               [ 2]   76 	ldw (x),y 
      009BD2 81               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      009BD3 9B BD                   83 	.word LINK 
                           001B55    84 	LINK=.
      009BD5 07                      85 	.byte 7
      009BD6 45 45 50 2D 52 55 4E    86 	.ascii "EEP-RUN"
      009BDD                         87 EEPRUN:
      009BDD 1D 00 04         [ 2]   88 	subw x,#2*CELLL 
      009BE0 90 AE 40 02      [ 2]   89 	ldw y,#APP_RUN 
      009BE4 EF 02            [ 2]   90 	ldw (2,x),y 
      009BE6 90 5F            [ 1]   91 	clrw y 
      009BE8 FF               [ 2]   92 	ldw (x),y 
      009BE9 81               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      009BEA 9B D5                   99 	.word LINK
                           001B6C   100 	LINK=.
      009BEC 06                     101 	.byte 6 
      009BED 45 45 50 2D 43 50      102 	.ascii "EEP-CP"
      009BF3                        103 EEPCP:
      009BF3 1D 00 04         [ 2]  104 	subw x,#2*CELLL 
      009BF6 90 AE 40 04      [ 2]  105 	ldw y,#APP_CP  
      009BFA EF 02            [ 2]  106 	ldw (2,x),y 
      009BFC 90 5F            [ 1]  107 	clrw y 
      009BFE FF               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009BFF 81               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      009C00 9B EC                  115 	.word LINK
                           001B82   116 	LINK=.
      009C02 06                     117 	.byte 6
      009C03 45 45 50 2D 56 50      118 	.ascii "EEP-VP"
      009C09                        119 EEPVP:
      009C09 1D 00 04         [ 2]  120 	subw x,#2*CELLL 
      009C0C 90 AE 40 06      [ 2]  121 	ldw y,#APP_VP  
      009C10 EF 02            [ 2]  122 	ldw (2,x),y 
      009C12 90 5F            [ 1]  123 	clrw y 
      009C14 FF               [ 2]  124 	ldw (x),y 
      009C15 81               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      009C16 9C 02                  131 	.word LINK 
                           001B98   132 	LINK=.
      009C18 0A                     133 	.byte 10
      009C19 55 50 44 41 54 2D 4C   134 	.ascii "UPDAT-LAST"
             41 53 54
      009C23                        135 UPDATLAST:
      009C23 CD 87 76         [ 4]  136 	call LAST
      009C26 CD 85 63         [ 4]  137 	call AT  
      009C29 CD 9B C6         [ 4]  138 	call EEPLAST
      009C2C CC 9E 02         [ 2]  139 	jp EESTORE 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      009C2F 9C 18                  145 	.word LINK
                           001BB1   146 	LINK=.
      009C31 09                     147 	.byte 9
      009C32 55 50 44 41 54 2D 52   148 	.ascii "UPDAT-RUN"
             55 4E
      009C3B                        149 UPDATRUN:
      009C3B CD 9B DD         [ 4]  150 	call EEPRUN
      009C3E CC 9E 02         [ 2]  151 	jp EESTORE 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      009C41 9C 31                  157 	.word LINK 
                           001BC3   158 	LINK=.
      009C43 08                     159 	.byte 8 
      009C44 55 50 44 41 54 2D 43   160 	.ascii "UPDAT-CP"
             50
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009C4C                        161 UPDATCP:
      009C4C CD 87 66         [ 4]  162 	call CPP 
      009C4F CD 85 63         [ 4]  163 	call AT 
      009C52 CD 9B F3         [ 4]  164 	call EEPCP 
      009C55 CC 9E 02         [ 2]  165 	jp EESTORE 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      009C58 9C 43                  171 	.word LINK
                           001BDA   172 	LINK=.
      009C5A 08                     173 	.byte 8 
      009C5B 55 50 44 41 54 2D 56   174 	.ascii "UPDAT-VP" 
             50
      009C63                        175 UPDATVP:
      009C63 CD 87 58         [ 4]  176 	call VPP 
      009C66 CD 85 63         [ 4]  177 	call AT
      009C69 CD 9C 09         [ 4]  178 	call EEPVP 
      009C6C CC 9E 02         [ 2]  179 	jp EESTORE
                                    180 	
                           000000   181 .if NUCLEO
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
                                    186     .word LINK 
                                    187 LINK=.
                                    188     .byte 2
                                    189     .ascii "F@"
                                    190 FARAT:
                                    191     call FPSTOR
                                    192 	jp EE_READ 
                                    193 
                                    194 
                                    195 ;-------------------------------------
                                    196 ; fetch C at address over 65535 
                                    197 ; FC@ ( ud -- c)
                                    198 ;-------------------------------------
                                    199     .word LINK
                                    200     LINK=.
                                    201     .byte 3 
                                    202     .ascii "FC@" 
                                    203 FARCAT:
                                    204     call FPSTOR
                                    205 	jp EE_CREAD  
                                    206 .endif ; NUCLEO 
                                    207 
                                    208 ;----------------------------------
                                    209 ; UNLOCK EEPROM/OPT for writing/erasing
                                    210 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    211 ;  UNLKEE   ( -- )
                                    212 ;----------------------------------
      009C6F 9C 5A                  213     .word LINK 
                           001BF1   214 LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009C71 06                     215     .byte 6 
      009C72 55 4E 4C 4B 45 45      216     .ascii "UNLKEE"
      009C78                        217 UNLKEE:
      009C78 35 00 50 5B      [ 1]  218 	mov FLASH_CR2,#0 
      009C7C 35 FF 50 5C      [ 1]  219 	mov FLASH_NCR2,#0xFF 
      009C80 35 AE 50 64      [ 1]  220 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009C84 35 56 50 64      [ 1]  221     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009C88 72 07 50 5F FB   [ 2]  222 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009C8D 81               [ 4]  223 	ret
                                    224 
                                    225 ;----------------------------------
                                    226 ; UNLOCK FLASH for writing/erasing
                                    227 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    228 ; UNLKFL  ( -- )
                                    229 ;----------------------------------
      009C8E 9C 71                  230     .word LINK 
                           001C10   231 LINK=. 
      009C90 06                     232     .byte 6 
      009C91 55 4E 4C 4B 46 4C      233     .ascii "UNLKFL"    
      009C97                        234 UNLKFL:
      009C97 35 00 50 5B      [ 1]  235 	mov FLASH_CR2,#0 
      009C9B 35 FF 50 5C      [ 1]  236 	mov FLASH_NCR2,#0xFF 
      009C9F 35 56 50 62      [ 1]  237 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009CA3 35 AE 50 62      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009CA7 72 03 50 5F FB   [ 2]  239 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009CAC 81               [ 4]  240 	ret
                                    241 
                                    242 ;-----------------------------
                                    243 ; UNLOCK FLASH or EEPROM 
                                    244 ; according to FPTR address 
                                    245 ;  UNLOCK ( -- )
                                    246 ;-----------------------------
      009CAD 9C 90                  247 	.word LINK 
                           001C2F   248 	LINK=.
      009CAF 06                     249 	.byte 6
      009CB0 55 4E 4C 4F 43 4B      250 	.ascii "UNLOCK"
      009CB6                        251 UNLOCK:
                                    252 ; put addr[15:0] in Y, for bounds check.
      009CB6 90 BE 33         [ 2]  253 	ldw y,PTR16   ; Y=addr15:0
                                    254 ; check addr[23:16], if <> 0 then it is extened flash memory
      009CB9 3D 32            [ 1]  255 	tnz FPTR 
      009CBB 26 16            [ 1]  256 	jrne 4$
      009CBD 90 A3 80 00      [ 2]  257     cpw y,#FLASH_BASE
      009CC1 24 10            [ 1]  258     jruge 4$
      009CC3 90 A3 40 00      [ 2]  259 	cpw y,#EEPROM_BASE  
      009CC7 25 0D            [ 1]  260     jrult 9$
      009CC9 90 A3 48 7F      [ 2]  261 	cpw y,#OPTION_END 
      009CCD 22 07            [ 1]  262 	jrugt 9$
      009CCF CD 9C 78         [ 4]  263 	call UNLKEE
      009CD2 81               [ 4]  264 	ret 
      009CD3 CD 9C 97         [ 4]  265 4$: call UNLKFL
      009CD6 81               [ 4]  266 9$: ret 
                                    267 
                                    268 ;-------------------------
                                    269 ; LOCK write access to 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                    270 ; FLASH and EEPROM 
                                    271 ; LOCK ( -- )
                                    272 ;-------------------------
      009CD7 9C AF                  273 	.word LINK 
                           001C59   274 	LINK=.
      009CD9 04                     275 	.byte 4 
      009CDA 4C 4F 43 4B            276 	.ascii "LOCK" 
      009CDE                        277 LOCK: 
      009CDE 72 13 50 5F      [ 1]  278 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009CE2 72 17 50 5F      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009CE6 81               [ 4]  280 	ret 
                                    281 
                                    282 ;-------------------------
                                    283 ; increment FPTR 
                                    284 ; INC-FPTR ( -- )
                                    285 ;-------------------------
      009CE7 9C D9                  286 	.word LINK 
                           001C69   287 	LINK=. 
      009CE9 08                     288 	.byte 8 
      009CEA 49 4E 43 2D 46 50 54   289 	.ascii "INC-FPTR" 
             52
      009CF2                        290 INC_FPTR:
      009CF2 3C 34            [ 1]  291 	inc PTR8 
      009CF4 26 0C            [ 1]  292 	jrne 1$
      009CF6 90 89            [ 2]  293 	pushw y 
      009CF8 90 BE 32         [ 2]  294 	ldw y,FPTR 
      009CFB 90 5C            [ 1]  295 	incw y 
      009CFD 90 BF 32         [ 2]  296 	ldw FPTR,y
      009D00 90 85            [ 2]  297 	popw y  
      009D02 81               [ 4]  298 1$: ret 
                                    299 
                                    300 ;------------------------------
                                    301 ; add u to FPTR 
                                    302 ; PTR+ ( u -- )
                                    303 ;------------------------------
      009D03 9C E9                  304 	.word LINK 
                           001C85   305 	LINK=.
      009D05 04                     306 	.byte 4 
      009D06 50 54 52 2B            307 	.ascii "PTR+"
      009D0A                        308 PTRPLUS:
      009D0A 90 93            [ 1]  309 	ldw y,x 
      009D0C 1C 00 02         [ 2]  310 	addw x,#CELLL 
      009D0F 72 B9 00 33      [ 2]  311 	addw y,PTR16 
      009D13 90 BF 33         [ 2]  312 	ldw PTR16,y  
      009D16 24 02            [ 1]  313 	jrnc 1$
      009D18 3C 32            [ 1]  314 	inc FPTR 
      009D1A 81               [ 4]  315 1$: ret 
                                    316 
                                    317 ;---------------------------------
                                    318 ; read word at address pointed FPTR
                                    319 ; increment FPTR 
                                    320 ; EE-READ ( -- w )
                                    321 ;------------------------------------
      009D1B 9D 05                  322 	.word LINK 
                           001C9D   323 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009D1D 07                     324 	.byte 7 
      009D1E 45 45 2D 52 45 41 44   325 	.ascii "EE-READ"
      009D25                        326 EE_READ:
      009D25 1D 00 02         [ 2]  327 	subw x,#CELLL 
      009D28 92 BC 00 32      [ 5]  328 	ldf a,[FPTR]
      009D2C 90 95            [ 1]  329 	ld yh,a 
      009D2E CD 9C F2         [ 4]  330 	call INC_FPTR 
      009D31 92 BC 00 32      [ 5]  331 	ldf a,[FPTR]
      009D35 CD 9C F2         [ 4]  332 	call INC_FPTR 
      009D38 90 97            [ 1]  333 	ld yl,a 
      009D3A FF               [ 2]  334 	ldw (x),y 
      009D3B 81               [ 4]  335 	ret 
                                    336 
                                    337 ;---------------------------------------
                                    338 ; Read byte at address pointed by FPTR 
                                    339 ; EE-CREAD ( -- c )
                                    340 ;---------------------------------------
      009D3C 9D 1D                  341 	.word LINK 
                           001CBE   342 	LINK=.
      009D3E 08                     343 	.byte 8
      009D3F 45 45 2D 43 52 45 41   344 	.ascii "EE-CREAD" 
             44
      009D47                        345 EE_CREAD:
      009D47 1D 00 02         [ 2]  346 	subw x,#CELLL 
      009D4A 92 BC 00 32      [ 5]  347 	ldf a,[FPTR]	
      009D4E CD 9C F2         [ 4]  348 	call INC_FPTR
      009D51 90 5F            [ 1]  349 	clrw y 
      009D53 90 97            [ 1]  350 	ld yl,a 
      009D55 FF               [ 2]  351 	ldw (x),y 
      009D56 81               [ 4]  352 	ret 
                                    353 
                                    354 ;----------------------------
                                    355 ; write a byte at address pointed 
                                    356 ; by FPTR and increment FPTR.
                                    357 ; Expect pointer already initialized 
                                    358 ; and memory unlocked 
                                    359 ; WR-BYTE ( c -- )
                                    360 ;----------------------------
      009D57 9D 3E                  361 	.word LINK 
                           001CD9   362 	LINK=. 
      009D59 07                     363 	.byte 7 
      009D5A 57 52 2D 42 59 54 45   364 	.ascii "WR-BYTE" 
                                    365 
      009D61                        366 WR_BYTE:
      009D61 CD 84 D1         [ 4]  367 	call FC_XOFF
      009D64 90 93            [ 1]  368 	ldw y,x 
      009D66 90 FE            [ 2]  369 	ldw y,(y)
      009D68 1C 00 02         [ 2]  370 	addw x,#CELLL 
      009D6B 90 9F            [ 1]  371 	ld a,yl
      009D6D 92 BD 00 32      [ 4]  372 	ldf [FPTR],a
      009D71 72 05 50 5F FB   [ 2]  373 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D76 CD 84 BB         [ 4]  374 	call FC_XON
      009D79 CC 9C F2         [ 2]  375 	jp INC_FPTR 
                                    376 
                                    377 ;---------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                    378 ; write a word at address pointed 
                                    379 ; by FPTR and increment FPTR 
                                    380 ; Expect pointer already initialzed 
                                    381 ; and memory unlocked 
                                    382 ; WR-WORD ( w -- )
                                    383 ;---------------------------------------
      009D7C 9D 59                  384 	.word LINK 
                           001CFE   385 	LINK=.
      009D7E 07                     386 	.byte 7 
      009D7F 57 52 2D 57 4F 52 44   387 	.ascii "WR-WORD" 
      009D86                        388 WR_WORD:
      009D86 CD 84 D1         [ 4]  389 	call FC_XOFF
      009D89 90 93            [ 1]  390 	ldw y,x
      009D8B 90 FE            [ 2]  391 	ldw y,(y)
      009D8D 1C 00 02         [ 2]  392 	addw x,#CELLL 
      009D90 90 9E            [ 1]  393 	ld a,yh 
      009D92 92 BD 00 32      [ 4]  394 	ldf [FPTR],a
      009D96 72 05 50 5F FB   [ 2]  395 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D9B CD 9C F2         [ 4]  396 	call INC_FPTR 
      009D9E 90 9F            [ 1]  397 	ld a,yl 
      009DA0 92 BD 00 32      [ 4]  398 	ldf [FPTR],a
      009DA4 72 05 50 5F FB   [ 2]  399 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009DA9 CD 84 BB         [ 4]  400 	call FC_XON
      009DAC CC 9C F2         [ 2]  401 	jp INC_FPTR 
                                    402 
                                    403 
                                    404 ;---------------------------------------
                                    405 ; write a byte to FLASH or EEPROM/OPTION  
                                    406 ; EEC!  (c ud -- )
                                    407 ;---------------------------------------
      009DAF 9D 7E                  408     .word LINK 
                           001D31   409 	LINK=.
      009DB1 04                     410     .byte 4 
      009DB2 45 45 43 21            411     .ascii "EEC!"
                                    412 	; local variables 
                           000001   413 	BTW = 1   ; byte to write offset on stack
                           000002   414     OPT = 2 
                           000002   415 	VSIZE = 2
      009DB6                        416 EECSTORE:
      009DB6 52 02            [ 2]  417 	sub sp,#VSIZE
      009DB8 CD 9B 8F         [ 4]  418     call FPSTOR
      009DBB E6 01            [ 1]  419 	ld a,(1,x)
      009DBD 43               [ 1]  420 	cpl a 
      009DBE 6B 01            [ 1]  421 	ld (BTW,sp),a ; byte to write 
      009DC0 0F 02            [ 1]  422 	clr (OPT,sp)  ; OPTION flag
      009DC2 CD 9C B6         [ 4]  423 	call UNLOCK 
                                    424 	; check if option
      009DC5 3D 32            [ 1]  425 	tnz FPTR 
      009DC7 26 19            [ 1]  426 	jrne 2$
      009DC9 90 BE 33         [ 2]  427 	ldw y,PTR16 
      009DCC 90 A3 48 00      [ 2]  428 	cpw y,#OPTION_BASE
      009DD0 2B 10            [ 1]  429 	jrmi 2$
      009DD2 90 A3 48 80      [ 2]  430 	cpw y,#OPTION_END+1
      009DD6 2A 0A            [ 1]  431 	jrpl 2$
      009DD8 03 02            [ 1]  432 	cpl (OPT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                    433 	; OPTION WRITE require this UNLOCK 
      009DDA 72 1E 50 5B      [ 1]  434     bset FLASH_CR2,#FLASH_CR2_OPT
      009DDE 72 1F 50 5C      [ 1]  435     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009DE2                        436 2$: 
      009DE2 CD 9D 61         [ 4]  437 	call WR_BYTE 	
      009DE5 0D 02            [ 1]  438 	tnz (OPT,sp)
      009DE7 27 0D            [ 1]  439 	jreq 3$ 
      009DE9 7B 01            [ 1]  440     ld a,(BTW,sp)
      009DEB 90 5F            [ 1]  441     clrw y
      009DED 90 97            [ 1]  442 	ld yl,a 
      009DEF 1D 00 02         [ 2]  443 	subw x,#CELLL 
      009DF2 FF               [ 2]  444 	ldw (x),y 
      009DF3 CD 9D 61         [ 4]  445 	call WR_BYTE
      009DF6                        446 3$: 
      009DF6 CD 9C DE         [ 4]  447 	call LOCK 
      009DF9 5B 02            [ 2]  448 	addw sp,#VSIZE 
      009DFB 81               [ 4]  449     ret
                                    450 
                                    451 ;------------------------------
                                    452 ; write integer in FLASH|EEPROM
                                    453 ; EE! ( n ud -- )
                                    454 ;------------------------------
      009DFC 9D B1                  455 	.word LINK 
                           001D7E   456 	LINK=.
      009DFE 03                     457 	.byte 3 
      009DFF 45 45 21               458 	.ascii "EE!"
      009E02                        459 EESTORE:
      009E02 CD 9B 8F         [ 4]  460 	call FPSTOR 
      009E05 CD 9C B6         [ 4]  461 	call UNLOCK 
      009E08 90 93            [ 1]  462 	ldw y,x 
      009E0A 90 FE            [ 2]  463 	ldw y,(y)
      009E0C 90 89            [ 2]  464 	pushw y 
      009E0E 90 5E            [ 1]  465 	swapw y 
      009E10 FF               [ 2]  466 	ldw (x),y 
      009E11 CD 9D 61         [ 4]  467 	call WR_BYTE 
      009E14 90 85            [ 2]  468 	popw y 
      009E16 1D 00 02         [ 2]  469 	subw x,#CELLL
      009E19 FF               [ 2]  470 	ldw (x),y 
      009E1A CD 9D 61         [ 4]  471 	call WR_BYTE
      009E1D CC 9C DE         [ 2]  472 	jp LOCK 
                                    473 
                                    474 
                                    475 ;----------------------------
                                    476 ; Erase flash memory row 
                                    477 ; stm8s208 as 128 bytes rows
                                    478 ; ROW-ERASE ( ud -- )
                                    479 ;----------------------------
      009E20 9D FE                  480 	.word LINK 
                           001DA2   481 	LINK=. 
      009E22 09                     482 	.byte 9 
      009E23 52 4F 57 2D 45 52 41   483 	.ascii "ROW-ERASE" 
             53 45
      009E2C                        484 row_erase:
      009E2C CD 84 D1         [ 4]  485 	call FC_XOFF
      009E2F CD 9B 8F         [ 4]  486 	call FPSTOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                    487 ;code must be execute from RAM 
                                    488 ;copy routine to PAD 
      009E32 1D 00 02         [ 2]  489 	subw x,#CELLL 
      009E35 90 AE 9E 85      [ 2]  490 	ldw y,#row_erase_proc
      009E39 FF               [ 2]  491 	ldw (x),y 
      009E3A CD 8C 6A         [ 4]  492 	call PAD 
      009E3D 90 AE 9E AC      [ 2]  493 	ldw y,#row_erase_proc_end 
      009E41 72 A2 9E 85      [ 2]  494 	subw y,#row_erase_proc
      009E45 1D 00 02         [ 2]  495 	subw x,#CELLL 
      009E48 FF               [ 2]  496 	ldw (x),y 
      009E49 CD 8C A6         [ 4]  497 	call CMOVE 
      009E4C                        498 block_erase:
      009E4C 90 BE 33         [ 2]  499 	ldw y,FPTR+1
      009E4F 90 A3 A4 80      [ 2]  500 	cpw y,#app_space 
      009E53 2A 19            [ 1]  501 	jrpl erase_flash 
                                    502 ; erase EEPROM block
      009E55 90 A3 40 00      [ 2]  503 	cpw y,#EEPROM_BASE 
      009E59 24 04            [ 1]  504 	jruge 1$
      009E5B CD 84 BB         [ 4]  505 	call FC_XON
      009E5E 81               [ 4]  506 	ret ; bad address 
      009E5F 90 A3 43 FF      [ 2]  507 1$: cpw y,#EEPROM_END 
      009E63 23 04            [ 2]  508 	jrule 2$ 
      009E65 CD 84 BB         [ 4]  509 	call FC_XON
      009E68 81               [ 4]  510 	ret ; bad address 
      009E69                        511 2$:	
      009E69 CD 9C 78         [ 4]  512 	call UNLKEE 
      009E6C 20 03            [ 2]  513 	jra proceed_erase
                                    514 ; erase flash block:
      009E6E                        515 erase_flash:
      009E6E CD 9C 97         [ 4]  516 	call UNLKFL 
      009E71                        517 proceed_erase:
      009E71 CD 8C 6A         [ 4]  518 	call PAD 
      009E74 90 93            [ 1]  519 	ldw y,x
      009E76 90 FE            [ 2]  520 	ldw y,(y)
      009E78 1C 00 02         [ 2]  521 	addw x,#CELLL  
      009E7B 90 FD            [ 4]  522 	call (y) 
      009E7D 72 17 50 5F      [ 1]  523 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009E81 CD 84 BB         [ 4]  524 	call FC_XON
      009E84 81               [ 4]  525 	ret 
                                    526 
                                    527 ; this routine is to be copied to PAD 
      009E85                        528 row_erase_proc:
      009E85 35 20 50 5B      [ 1]  529 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009E89 35 DF 50 5C      [ 1]  530 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009E8D 4F               [ 1]  531 	clr a 
      009E8E 90 5F            [ 1]  532 	clrw y 
      009E90 91 A7 00 32      [ 1]  533 	ldf ([FPTR],y),a
      009E94 90 5C            [ 1]  534     incw y
      009E96 91 A7 00 32      [ 1]  535 	ldf ([FPTR],y),a
      009E9A 90 5C            [ 1]  536     incw y
      009E9C 91 A7 00 32      [ 1]  537 	ldf ([FPTR],y),a
      009EA0 90 5C            [ 1]  538     incw y
      009EA2 91 A7 00 32      [ 1]  539 	ldf ([FPTR],y),a
      009EA6 72 05 50 5F FB   [ 2]  540 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009EAB 81               [ 4]  541 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009EAC                        542 row_erase_proc_end:
                                    543 
                                    544 
                                    545 ;-----------------------------------
                                    546 ; block programming must be 
                                    547 ; executed from RAM 
                                    548 ; initial contidions: 
                                    549 ; 		memory unlocked
                                    550 ;       FPTR initialized 
                                    551 ; input: 
                                    552 ;    x   buffer address 
                                    553 ;-----------------------------------
                           000001   554 	BCNT=1 
      009EAC                        555 copy_buffer:
      009EAC 4B 80            [ 1]  556 	push #BLOCK_SIZE  
                                    557 ;enable block programming 
      009EAE 72 10 50 5B      [ 1]  558 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009EB2 72 11 50 5C      [ 1]  559 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009EB6 90 5F            [ 1]  560 	clrw y
      009EB8 F6               [ 1]  561 1$:	ld a,(x)
      009EB9 91 A7 00 32      [ 1]  562 	ldf ([FPTR],y),a
      009EBD 5C               [ 1]  563 	incw x 
      009EBE 90 5C            [ 1]  564 	incw y 
      009EC0 0A 01            [ 1]  565 	dec (BCNT,sp)
      009EC2 26 F4            [ 1]  566 	jrne 1$
                                    567 ; wait EOP bit 
      009EC4 72 05 50 5F FB   [ 2]  568 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009EC9 84               [ 1]  569 	pop a ; remove BCNT from stack 
      009ECA 81               [ 4]  570 	ret 
      009ECB                        571 copy_buffer_end:
                                    572 
                                    573 ;-------------------------
                                    574 ; move program_row to RAM 
                                    575 ; in TIB 
                                    576 ;------------------------
      009ECB                        577 copy_prog_to_ram:
      009ECB 1D 00 06         [ 2]  578 	subw x,#6
      009ECE 90 AE 9E AC      [ 2]  579 	ldw y,#copy_buffer 
      009ED2 EF 04            [ 2]  580 	ldw (4,x),y 
      009ED4 90 AE 07 00      [ 2]  581 	ldw y,#TIBBASE
      009ED8 EF 02            [ 2]  582 	ldw (2,x),y 
      009EDA 90 AE 9E CB      [ 2]  583 	ldw y,#copy_buffer_end 
      009EDE 72 A2 9E AC      [ 2]  584 	subw y,#copy_buffer  
      009EE2 FF               [ 2]  585 	ldw (x),y 
      009EE3 CD 8C A6         [ 4]  586 	call CMOVE 
      009EE6 81               [ 4]  587 	ret 
                                    588 
                                    589 
                                    590 ;-----------------------------
                                    591 ; write a row in FLASH/EEPROM 
                                    592 ; WR-ROW ( a ud -- )
                                    593 ; a -> address 128 byte buffer to write 
                                    594 ; ud ->  row address in FLASH|EEPROM 
                                    595 ;-----------------------------
      009EE7 9E 22                  596 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                           001E69   597 	LINK=.
      009EE9 06                     598 	.byte 6 
      009EEA 57 52 2D 52 4F 57      599 	.ascii "WR-ROW"
      009EF0                        600 write_row:
      009EF0 CD 84 D1         [ 4]  601 	call FC_XOFF
      009EF3 CD 9B 8F         [ 4]  602 	call FPSTOR
                                    603 ; align to FLASH block 
      009EF6 A6 80            [ 1]  604 	ld a,#0x80 
      009EF8 B4 34            [ 1]  605 	and a,PTR8 
      009EFA B7 34            [ 1]  606 	ld PTR8,a  
      009EFC CD 9E CB         [ 4]  607 	call copy_prog_to_ram
      009EFF CD 9C B6         [ 4]  608 	call UNLOCK
      009F02 90 93            [ 1]  609 	ldw y,x 
      009F04 90 FE            [ 2]  610 	ldw y,(y)
      009F06 1C 00 02         [ 2]  611 	addw x,#CELLL 
      009F09 89               [ 2]  612 	pushw x 
      009F0A 93               [ 1]  613 	ldw x,y ; buffer address in x 
      009F0B CD 07 00         [ 4]  614 	call TIBBASE
      009F0E CD 9C DE         [ 4]  615 	call LOCK
      009F11 85               [ 2]  616 	popw x 
      009F12 CD 84 BB         [ 4]  617 	call FC_XON 
      009F15 81               [ 4]  618 	ret 
                                    619 
                                    620 ;-------------------------------------
                                    621 ; change value of OPTION register 
                                    622 ; SET-OPT (c n -- ) 
                                    623 ; c new value.
                                    624 ; n OPT  number {1..7}
                                    625 ;--------------------------------------
      009F16 9E E9                  626 		.word LINK 
                           001E98   627 		LINK=.
      009F18 07                     628 		.byte 7 
      009F19 53 45 54 2D 4F 50 54   629 		.ascii "SET-OPT" 
      009F20                        630 set_option: 
      009F20 90 93            [ 1]  631 		ldw y,x 
      009F22 90 FE            [ 2]  632 		ldw y,(y)
      009F24 27 06            [ 1]  633 		jreq 1$
      009F26 90 A3 00 07      [ 2]  634 		cpw y,#7 
      009F2A 23 04            [ 2]  635 		jrule 2$ 
                                    636 ; invalid OPTION number 		
      009F2C 1C 00 04         [ 2]  637 1$:		addw x,#2*CELLL
      009F2F 81               [ 4]  638 		ret
      009F30 90 58            [ 2]  639 2$:		sllw y 
      009F32 72 A9 47 FF      [ 2]  640 		addw y,#OPTION_BASE-1
      009F36 FF               [ 2]  641 		ldw (x),y 
      009F37 1D 00 02         [ 2]  642 		subw x,#CELLL 
      009F3A 90 5F            [ 1]  643 		clrw y 
      009F3C FF               [ 2]  644 		ldw (x),y 
      009F3D CD 9D B6         [ 4]  645 		call EECSTORE
      009F40 81               [ 4]  646 		ret 
                                    647 
                                    648 
                                    649 
                                    650 ;--------------------------------------
                                    651 ; reset system to its original state 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                    652 ; before any user modification
                                    653 ; PRISTINE ( -- )
                                    654 ;-------------------------------------
      009F41 9F 18                  655 	.word LINK  
                           001EC3   656 	LINK=.
      009F43 08                     657 	.byte 8 
      009F44 50 52 49 53 54 49 4E   658 	.ascii "PRISTINE"
             45
      009F4C                        659 pristine:
                                    660 ;;; erase EEPROM
      009F4C CD 9B AE         [ 4]  661 	call EEPROM 
      009F4F CD 87 F0         [ 4]  662 1$:	call DDUP 
      009F52 CD 9E 2C         [ 4]  663 	call row_erase
      009F55 90 93            [ 1]  664 	ldw y,x 
      009F57 90 EE 02         [ 2]  665 	ldw y,(2,y)
      009F5A 72 A9 00 80      [ 2]  666 	addw y,#BLOCK_SIZE
      009F5E EF 02            [ 2]  667 	ldw (2,x),y
      009F60 90 A3 48 00      [ 2]  668 	cpw y,#OPTION_BASE 
      009F64 25 E9            [ 1]  669 	jrult 1$
                                    670 ;;; reset OPTION to default values
      009F66 90 AE 00 01      [ 2]  671 	ldw y,#1 ; OPT1 
      009F6A FF               [ 2]  672 2$:	ldw (x),y   
      009F6B 90 5F            [ 1]  673 	clrw y 
      009F6D EF 02            [ 2]  674 	ldw (2,x),y  ; ( 0 1 -- ) 
      009F6F CD 87 F0         [ 4]  675 	call DDUP    ; ( 0 1 0 1 -- )  
      009F72 CD 9F 20         [ 4]  676 	call set_option
      009F75 90 93            [ 1]  677 	ldw y,x 
      009F77 90 FE            [ 2]  678 	ldw y,(y)
      009F79 90 5C            [ 1]  679 	incw y  ; next OPTION 
      009F7B 90 A3 00 08      [ 2]  680 	cpw y,#8 
      009F7F 25 E9            [ 1]  681 	jrult 2$
                                    682 ;;; erase first row of app_space 	
      009F81 90 AE A4 80      [ 2]  683 	ldw y,#app_space
      009F85 EF 02            [ 2]  684 	ldw (2,x),y  
      009F87 90 5F            [ 1]  685 	clrw y 
      009F89 FF               [ 2]  686 	ldw (x),y ; ( app_space 0 -- )
      009F8A CD 9E 2C         [ 4]  687 	call row_erase 
                                    688 ; reset interrupt vectors 
      009F8D 1D 00 02         [ 2]  689 	subw x,#CELLL 
      009F90 90 5F            [ 1]  690 	clrw y  
      009F92 FF               [ 2]  691 4$:	ldw (x),y  ; ( n -- ) int# 
      009F93 CD 86 0A         [ 4]  692 	call DUPP  
      009F96 CD 9F B3         [ 4]  693 	call reset_vector
      009F99 90 93            [ 1]  694 	ldw y,x 
      009F9B 90 FE            [ 2]  695 	ldw y,(y)
      009F9D 90 5C            [ 1]  696 	incw y   ; next vector 
      009F9F 90 A3 00 19      [ 2]  697 	cpw y,#25 
      009FA3 25 ED            [ 1]  698 	jrult 4$
      009FA5 CC 80 80         [ 2]  699 	jp NonHandledInterrupt ; reset MCU
                                    700 
                                    701 ;------------------------------
                                    702 ; reset an interrupt vector 
                                    703 ; to its initial value 
                                    704 ; i.e. NonHandledInterrupt
                                    705 ; RST-IVEC ( n -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                    706 ;-----------------------------
      009FA8 9F 43                  707 	.word LINK 
                           001F2A   708 	LINK=. 
      009FAA 08                     709 	.byte 8 
      009FAB 52 53 54 2D 49 56 45   710 	.ascii "RST-IVEC"
             43
      009FB3                        711 reset_vector:
      009FB3 90 93            [ 1]  712 	ldw y,x
      009FB5 1C 00 02         [ 2]  713 	addw x,#CELLL 
      009FB8 90 FE            [ 2]  714 	ldw y,(y)
      009FBA 90 A3 00 17      [ 2]  715 	cpw y,#23 
      009FBE 27 3A            [ 1]  716 	jreq 9$
      009FC0 90 A3 00 1D      [ 2]  717 	cpw y,#29 ; last vector
      009FC4 22 34            [ 1]  718 	jrugt 9$  
      009FC6 90 58            [ 2]  719 	sllw y 
      009FC8 90 58            [ 2]  720 	sllw y 
      009FCA 72 A9 80 08      [ 2]  721 	addw y,#0x8008 ; irq0 address 
      009FCE 90 BF 24         [ 2]  722 	ldw YTEMP,y
      009FD1 1D 00 06         [ 2]  723 	subw x,#3*CELLL 
      009FD4 EF 02            [ 2]  724 	ldw (2,x),y 
      009FD6 90 5F            [ 1]  725 	clrw y
      009FD8 FF               [ 2]  726 	ldw (x),y 
      009FD9 A6 82            [ 1]  727 	ld a,#0x82 
      009FDB 90 95            [ 1]  728 	ld yh,a
      009FDD EF 04            [ 2]  729 	ldw (4,x),y
      009FDF CD 9E 02         [ 4]  730 	call EESTORE
      009FE2 1D 00 06         [ 2]  731 	subw x,#3*CELLL
      009FE5 90 5F            [ 1]  732 	clrw y 
      009FE7 FF               [ 2]  733 	ldw (x),y 
      009FE8 90 AE 80 80      [ 2]  734 	ldw y,#NonHandledInterrupt
      009FEC EF 04            [ 2]  735 	ldw (4,x),y 
      009FEE 90 BE 24         [ 2]  736 	ldw y,YTEMP  
      009FF1 72 A9 00 02      [ 2]  737 	addw y,#2
      009FF5 EF 02            [ 2]  738 	ldw (2,x),y 
      009FF7 CD 9E 02         [ 4]  739 	call EESTORE
      009FFA 81               [ 4]  740 9$:	ret 
                                    741 
                                    742 
                                    743 ;------------------------------
                                    744 ; all interrupt vector with 
                                    745 ; an address >= a are resetted 
                                    746 ; to default
                                    747 ; CHKIVEC ( a -- )
                                    748 ;------------------------------
      009FFB 9F AA                  749 	.word LINK 
                           001F7D   750 	LINK=.
      009FFD 07                     751 	.byte 7
      009FFE 43 48 4B 49 56 45 43   752 	.ascii "CHKIVEC"
                                    753 ;local variables 
                           000001   754 	SSP=1
                           000003   755 	CADR=3
                           000005   756 	OFS=5
                           000006   757 	VSIZE=6  
      00A005                        758 CHKIVEC:
      00A005 52 06            [ 2]  759 	sub sp,#VSIZE ;alloc local variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      00A007 90 93            [ 1]  760 	ldw y,x 
      00A009 90 FE            [ 2]  761 	ldw y,(y)
      00A00B 17 03            [ 2]  762 	ldw (CADR,sp),y ; ca 
      00A00D 1F 01            [ 2]  763 	ldw (SSP,sp),x 
      00A00F AE 80 0A         [ 2]  764 	ldw x,#0x800a ; irq0 address 
      00A012 BF 33            [ 2]  765 	ldw PTR16,X
      00A014 AE FF FC         [ 2]  766 	ldw x,#-4 
      00A017 1C 00 04         [ 2]  767 1$:	addw x,#4
      00A01A A3 00 78         [ 2]  768 	cpw x,#30*4 ; irq0-29 
      00A01D 27 22            [ 1]  769 	jreq 9$
      00A01F 90 93            [ 1]  770 	ldw y,x  
      00A021 91 D6 33         [ 4]  771 	ld a,([PTR16],y)
      00A024 11 03            [ 1]  772 	cp a,(CADR,sp)
      00A026 25 EF            [ 1]  773 	jrult 1$
      00A028 90 5C            [ 1]  774 	incw y 
      00A02A 91 D6 33         [ 4]  775 	ld a,([PTR16],y)
      00A02D 11 04            [ 1]  776 	cp a,(CADR+1,sp) 
      00A02F 25 E6            [ 1]  777 	jrult 1$ 
      00A031 1F 05            [ 2]  778 	ldw (OFS,sp),x 
      00A033 54               [ 2]  779 	srlw x
      00A034 54               [ 2]  780 	srlw x 
      00A035 90 93            [ 1]  781 	ldw y,x 
      00A037 1E 01            [ 2]  782 	ldw x,(SSP,sp)
      00A039 FF               [ 2]  783 	ldw (x),y
      00A03A CD 9F B3         [ 4]  784 	call reset_vector
      00A03D 1E 05            [ 2]  785 	ldw x,(OFS,sp) 
      00A03F 20 D6            [ 2]  786 	jra 1$
      00A041 1E 01            [ 2]  787 9$:	ldw x,(SSP,sp) 
      00A043 1C 00 02         [ 2]  788 	addw x,#CELLL 
      00A046 5B 06            [ 2]  789 	addw sp,#VSIZE ; drop local variables  
      00A048 81               [ 4]  790 	ret 
                                    791 
                                    792 ;------------------------------
                                    793 ; set interrupt vector 
                                    794 ; SET-IVEC ( ud n -- )
                                    795 ;  ud Handler address
                                    796 ;  n  vector # 0 .. 29 
                                    797 ;-----------------------------
      00A049 9F FD                  798 	.word LINK
                           001FCB   799 	LINK=.
      00A04B 08                     800 	.byte 8 
      00A04C 53 45 54 2D 49 56 45   801 	.ascii "SET-IVEC" 
             43
      00A054                        802 set_vector:
      00A054 90 93            [ 1]  803     ldw y,x 
      00A056 1C 00 02         [ 2]  804 	addw x,#CELLL 
      00A059 90 FE            [ 2]  805 	ldw y,(y) ; vector #
      00A05B 90 A3 00 1D      [ 2]  806 	cpw y,#29 ; last vector
      00A05F 23 04            [ 2]  807 	jrule 2$
      00A061 1C 00 04         [ 2]  808 	addw x,#2*CELLL 
      00A064 81               [ 4]  809 	ret
      00A065 90 58            [ 2]  810 2$:	sllw y 
      00A067 90 58            [ 2]  811 	sllw y 
      00A069 72 A9 80 08      [ 2]  812 	addw y,#0X8008 ; IRQ0 vector address 
      00A06D 90 BF 24         [ 2]  813 	ldw YTEMP,y ; vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      00A070 A6 82            [ 1]  814 	ld a,#0x82 
      00A072 90 95            [ 1]  815 	ld yh,a 
      00A074 E6 01            [ 1]  816 	ld a,(1,x) ; isr address bits 23..16 
      00A076 90 97            [ 1]  817 	ld yl,a 
                                    818 ;  write 0x82 + most significant byte of int address	
      00A078 1D 00 06         [ 2]  819 	subw x,#3*CELLL 
      00A07B EF 04            [ 2]  820 	ldw (4,x),y 
      00A07D 90 BE 24         [ 2]  821 	ldw y,YTEMP
      00A080 EF 02            [ 2]  822 	ldw (2,x),y ; vector address 
      00A082 90 5F            [ 1]  823 	clrw y 
      00A084 FF               [ 2]  824 	ldw (x),y   ; as a double 
      00A085 CD 9E 02         [ 4]  825 	call EESTORE 
      00A088 90 93            [ 1]  826 	ldw y,x 
      00A08A 90 EE 02         [ 2]  827 	ldw y,(2,y) ; bits 15..0 int vector 
      00A08D 1D 00 06         [ 2]  828 	subw x,#3*CELLL 
      00A090 EF 04            [ 2]  829 	ldw (4,x),y 
      00A092 90 BE 24         [ 2]  830 	ldw y,YTEMP 
      00A095 72 A9 00 02      [ 2]  831 	addw y,#2 
      00A099 EF 02            [ 2]  832 	ldw (2,x),y 
      00A09B 90 5F            [ 1]  833 	clrw y 
      00A09D FF               [ 2]  834 	ldw (x),y 
      00A09E CD 9E 02         [ 4]  835 	call EESTORE
      00A0A1 1C 00 04         [ 2]  836 	addw x,#2*CELLL  
      00A0A4 81               [ 4]  837 9$: ret 
                                    838 
                                    839 
                                    840 ;------------------------
                                    841 ; Compile word to flash
                                    842 ; EE, (w -- )
                                    843 ;-----------------------
      00A0A5 A0 4B                  844 	.word LINK
                           002027   845 	LINK=.
      00A0A7 03                     846 	.byte 3
      00A0A8 45 45 2C               847 	.ascii "EE,"
      00A0AB                        848 EE_COMMA:
      00A0AB 1D 00 04         [ 2]  849 	subw x,#2*CELLL 
      00A0AE 90 BE 18         [ 2]  850 	ldw y,UCP
      00A0B1 90 89            [ 2]  851 	pushw y 
      00A0B3 EF 02            [ 2]  852 	ldw (2,x),y 
      00A0B5 90 5F            [ 1]  853 	clrw y 
      00A0B7 FF               [ 2]  854 	ldw (x),y
      00A0B8 CD 9E 02         [ 4]  855 	call EESTORE
      00A0BB 90 85            [ 2]  856 	popw y 
      00A0BD 72 A9 00 02      [ 2]  857 	addw y,#2
      00A0C1 90 BF 18         [ 2]  858 	ldw UCP,y
      00A0C4 81               [ 4]  859 	ret 
                                    860 
                                    861 
                                    862 ;-------------------------
                                    863 ; Compile byte to flash 
                                    864 ; EEC, ( c -- )	
                                    865 ;-------------------------
      00A0C5 A0 A7                  866 	.word LINK 
                           002047   867 	LINK=.
      00A0C7 04                     868 	.byte 4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      00A0C8 45 45 43 2C            869 	.ascii "EEC,"
      00A0CC                        870 EE_CCOMMA:
      00A0CC 1D 00 04         [ 2]  871 	subw x,#2*CELLL 
      00A0CF 90 BE 18         [ 2]  872 	ldw y,UCP
      00A0D2 90 89            [ 2]  873 	pushw y 
      00A0D4 EF 02            [ 2]  874 	ldw (2,x),y 
      00A0D6 90 5F            [ 1]  875 	clrw y 
      00A0D8 FF               [ 2]  876 	ldw (x),y
      00A0D9 CD 9D B6         [ 4]  877 	call EECSTORE
      00A0DC 90 85            [ 2]  878 	popw y 
      00A0DE 90 5C            [ 1]  879 	incw y 
      00A0E0 90 BF 18         [ 2]  880 	ldw UCP,y
      00A0E3 81               [ 4]  881 	ret 
                                    882 
                                    883 
                                    884 ;--------------------------
                                    885 ; copy FLASH block to ROWBUF
                                    886 ; ROW>BUF ( ud -- )
                                    887 ;--------------------------
      00A0E4 A0 C7                  888 	.word LINK 
                           002066   889 	LINK=.
      00A0E6 07                     890 	.byte 7 
      00A0E7 52 4F 57 3E 42 55 46   891 	.ascii "ROW>BUF"
      00A0EE                        892 ROW2BUF: 
      00A0EE CD 9B 8F         [ 4]  893 	call FPSTOR 
      00A0F1 A6 80            [ 1]  894 	ld a,#BLOCK_SIZE
      00A0F3 88               [ 1]  895 	push a 
      00A0F4 B4 34            [ 1]  896 	and a,PTR8 ; block align 
      00A0F6 B7 34            [ 1]  897 	ld PTR8,a
      00A0F8 90 AE 06 80      [ 2]  898 	ldw y,#ROWBUFF 
      00A0FC 92 BC 00 32      [ 5]  899 1$: ldf a,[FPTR]
      00A100 90 F7            [ 1]  900 	ld (y),a
      00A102 CD 9C F2         [ 4]  901 	call INC_FPTR
      00A105 90 5C            [ 1]  902 	incw y 
      00A107 0A 01            [ 1]  903 	dec (1,sp)
      00A109 26 F1            [ 1]  904 	jrne 1$ 
      00A10B 84               [ 1]  905 	pop a 
      00A10C 81               [ 4]  906 	ret 
                                    907 
                                    908 
                                    909 ;---------------------------
                                    910 ; copy ROWBUFF to flash 
                                    911 ; BUF>ROW ( ud -- )
                                    912 ; ud is row address as double 
                                    913 ;---------------------------
      00A10D A0 E6                  914 	.word LINK 
                           00208F   915 	LINK=.
      00A10F 07                     916 	.byte 7 
      00A110 42 55 46 3E 52 4F 57   917 	.ascii "BUF>ROW" 
      00A117                        918 BUF2ROW:
      00A117 CD 87 05         [ 4]  919 	call TBUF ; ( ud rb -- )
      00A11A CD 87 C5         [ 4]  920 	call ROT 
      00A11D CD 87 C5         [ 4]  921 	call ROT  ; ( rb ud -- )
      00A120 CD 9E F0         [ 4]  922 	call write_row 
      00A123 81               [ 4]  923 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                    924 
                                    925 ;---------------------------------
                                    926 ; how many byte free in that row 
                                    927 ; RFREE ( a -- n )
                                    928 ; a is least byte of target address
                                    929 ;----------------------------------
      00A124 A1 0F                  930 	.word LINK 
                           0020A6   931 	LINK=.
      00A126 05                     932 	.byte 5 
      00A127 52 46 52 45 45         933 	.ascii "RFREE"
      00A12C                        934 RFREE:
      00A12C E6 01            [ 1]  935 	ld a,(1,x)
      00A12E A4 7F            [ 1]  936 	and a,#BLOCK_SIZE-1 
      00A130 B7 24            [ 1]  937 	ld YTEMP,a 
      00A132 A6 80            [ 1]  938 	ld a,#BLOCK_SIZE 
      00A134 B0 24            [ 1]  939 	sub a,YTEMP 
      00A136 90 5F            [ 1]  940 	clrw y 
      00A138 90 97            [ 1]  941 	ld yl,a
      00A13A FF               [ 2]  942 	ldw (x),y 
      00A13B 81               [ 4]  943 	ret 
                                    944 
                                    945 ;---------------------------------
                                    946 ; write u bytes to flash/EEPROM 
                                    947 ; constraint to row limit 
                                    948 ; RAM>EE ( ud a u -- u2 )
                                    949 ; ud flash address 
                                    950 ; a ram address 
                                    951 ; u bytes count
                                    952 ; return u2 bytes written  
                                    953 ;-------------------------------
      00A13C A1 26                  954 	.word LINK 
                           0020BE   955 	LINK=. 
      00A13E 06                     956 	.byte 6
      00A13F 52 41 4D 3E 45 45      957 	.ascii "RAM>EE"
                                    958 	
      00A145                        959 RAM2EE:
                                    960 ; copy ud on top 
      00A145 90 93            [ 1]  961 	ldw y,x 
      00A147 90 EE 06         [ 2]  962 	ldw y,(6,y) ; LSW of ud  
      00A14A 90 BF 24         [ 2]  963 	ldw YTEMP,y 
      00A14D 90 93            [ 1]  964 	ldw y,x 
      00A14F 90 EE 04         [ 2]  965 	ldw y,(4,y)  ; MSW of ud 
      00A152 1D 00 04         [ 2]  966 	subw x,#2*CELLL 
      00A155 FF               [ 2]  967 	ldw (x),y 
      00A156 90 BE 24         [ 2]  968 	ldw y,YTEMP 
      00A159 EF 02            [ 2]  969 	ldw (2,x),y 
      00A15B CD A0 EE         [ 4]  970 	call ROW2BUF 
      00A15E 90 93            [ 1]  971 	ldw y,x 
      00A160 90 EE 06         [ 2]  972 	ldw y,(6,y)
      00A163 90 89            [ 2]  973 	pushw y ; udl 
      00A165 90 9F            [ 1]  974 	ld a,yl
      00A167 A4 7F            [ 1]  975 	and a,#BLOCK_SIZE-1 
      00A169 90 5F            [ 1]  976 	clrw y 
      00A16B 90 97            [ 1]  977 	ld yl,a 
      00A16D 72 A9 06 80      [ 2]  978 	addw y,#ROWBUFF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      00A171 1D 00 02         [ 2]  979 	subw x,#CELLL 
      00A174 FF               [ 2]  980 	ldw (x),y  
      00A175 CD 86 1A         [ 4]  981 	call SWAPP ;  ( ud a ra u -- )
      00A178 CD 85 B4         [ 4]  982 	call RFROM  
      00A17B CD A1 2C         [ 4]  983 	call RFREE 
      00A17E CD 89 20         [ 4]  984 	call MIN
      00A181 CD 86 0A         [ 4]  985 	call DUPP 
      00A184 CD 85 D3         [ 4]  986 	call TOR  
      00A187 CD 8C A6         [ 4]  987 	call CMOVE
      00A18A CD A1 17         [ 4]  988 	call BUF2ROW 
      00A18D CD 85 B4         [ 4]  989 	call RFROM 
      00A190 81               [ 4]  990 	ret 
                                    991 
                                    992 
                                    993 ;--------------------------
                                    994 ; expand 16 bit address 
                                    995 ; to 32 bit address 
                                    996 ; FADDR ( a -- ud )
                                    997 ;--------------------------
      00A191 A1 3E                  998 	.word LINK 
                           002113   999 	LINK=. 
      00A193 05                    1000 	.byte 5 
      00A194 46 41 44 44 52        1001 	.ascii "FADDR"
      00A199                       1002 FADDR:
      00A199 CC 8B 6B         [ 2] 1003 	jp ZERO 
                                   1004 
                                   1005 
                                   1006 ;--------------------------
                                   1007 ; move new colon definition to FLASH 
                                   1008 ; using WR-ROW for efficiency 
                                   1009 ; preserving bytes already used 
                                   1010 ; in the current block. 
                                   1011 ; At this point the compiler as completed
                                   1012 ; in RAM and pointers CP and CNTXT updated.
                                   1013 ; CNTXT point to nfa of new word and  
                                   1014 ; CP is after compiled word so CP-CNTXT+2=count to write 
                                   1015 ; 
                                   1016 ; FMOVE ( -- cp+ )
                                   1017 ; 
                                   1018 ;--------------------------
      00A19C A1 93                 1019 	.word LINK 
                           00211E  1020 	LINK=.
      00A19E 05                    1021 	.byte 5 
      00A19F 46 4D 4F 56 45        1022 	.ascii "FMOVE" 
      00A1A4                       1023 FMOVE:
      00A1A4 CD 87 17         [ 4] 1024 	call TFLASH 
      00A1A7 CD 85 63         [ 4] 1025 	CALL AT 
      00A1AA CD 85 18         [ 4] 1026 	CALL QBRAN 
      00A1AD A2 28                 1027 	.word no_move  
      00A1AF CD 87 66         [ 4] 1028 	call CPP
      00A1B2 CD 85 63         [ 4] 1029 	call AT  
      00A1B5 CD 86 0A         [ 4] 1030 	call DUPP ; ( udl udl -- )
      00A1B8 CD 87 4A         [ 4] 1031 	call CNTXT 
      00A1BB CD 85 63         [ 4] 1032 	call AT 
      00A1BE CD 84 E5         [ 4] 1033 	call DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      00A1C1 00 02                 1034 	.word 2 
      00A1C3 CD 88 7E         [ 4] 1035 	call SUBB ; ( udl udl a -- )
      00A1C6 CD 86 1A         [ 4] 1036 	call SWAPP 
      00A1C9 CD A1 99         [ 4] 1037 	call FADDR 
      00A1CC CD 87 C5         [ 4] 1038 	call ROT  ; ( udl ud a -- )
      00A1CF CD 86 0A         [ 4] 1039 	call DUPP 
      00A1D2 CD 85 D3         [ 4] 1040 	call TOR    ; R: a 
      00A1D5                       1041 FMOVE2: 
      00A1D5 CD 8C 59         [ 4] 1042 	call HERE 
      00A1D8 CD 85 C7         [ 4] 1043 	call RAT 
      00A1DB CD 88 7E         [ 4] 1044 	call SUBB ; (udl ud a wl -- )
      00A1DE                       1045 next_row:
      00A1DE CD 86 0A         [ 4] 1046 	call DUPP 
      00A1E1 CD 85 D3         [ 4] 1047 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A1E4 CD A1 45         [ 4] 1048 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A1E7 CD 86 0A         [ 4] 1049 	call DUPP 
      00A1EA CD 85 D3         [ 4] 1050 	call TOR
      00A1ED CD 88 05         [ 4] 1051 	call PLUS  ; ( udl+ ) 
      00A1F0 CD 86 0A         [ 4] 1052 	call DUPP 
      00A1F3 CD 8B 6B         [ 4] 1053 	call ZERO   ; ( udl+ ud -- )
      00A1F6 CD 85 B4         [ 4] 1054 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A1F9 CD 85 B4         [ 4] 1055 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A1FC CD 86 34         [ 4] 1056 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A1FF CD 88 7E         [ 4] 1057 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A202 CD 86 0A         [ 4] 1058 	call DUPP 
      00A205 CD 85 18         [ 4] 1059 	call QBRAN
      00A208 A2 21                 1060 	.word fmove_done 
      00A20A CD 86 1A         [ 4] 1061 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A20D CD 85 B4         [ 4] 1062 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A210 CD 88 05         [ 4] 1063 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A213 CD 86 0A         [ 4] 1064 	call DUPP 
      00A216 CD 85 D3         [ 4] 1065 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A219 CD 86 1A         [ 4] 1066 	call SWAPP 
      00A21C CD 85 2F         [ 4] 1067 	call BRAN
      00A21F A1 DE                 1068 	.word next_row  
      00A221                       1069 fmove_done:	
      00A221 CD 85 B4         [ 4] 1070 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A224 1C 00 0A         [ 2] 1071 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A227 81               [ 4] 1072  	ret  
      00A228                       1073 no_move:
      00A228 CD 8B 6B         [ 4] 1074 	call ZERO
      00A22B 81               [ 4] 1075 	ret 
                                   1076 
                                   1077 ;------------------------------------------
                                   1078 ; adjust pointers after **FMOVE** operetion.
                                   1079 ; UPDAT-PTR ( cp+ -- )
                                   1080 ; cp+ is new CP position after FMOVE 
                                   1081 ;-------------------------------------------
      00A22C A1 9E                 1082 	.word LINK 
                           0021AE  1083 	LINK=.
      00A22E 09                    1084 	.byte 9
      00A22F 55 50 44 41 54 2D 50  1085 	.ascii "UPDAT-PTR" 
             54 52
      00A238                       1086 UPDATPTR:
                                   1087 ;reset VP to previous position  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      00A238 CD 9C 09         [ 4] 1088 	call EEPVP 
      00A23B CD 86 00         [ 4] 1089 	call DROP 
      00A23E CD 85 63         [ 4] 1090 	call AT
      00A241 CD 87 58         [ 4] 1091 	call VPP 
      00A244 CD 85 4C         [ 4] 1092 	call STORE
                                   1093 ;update CONTEXT and LAST 
      00A247 CD 9B F3         [ 4] 1094 	call EEPCP 
      00A24A CD 86 00         [ 4] 1095 	call DROP
      00A24D CD 85 63         [ 4] 1096 	call AT
      00A250 CD 84 E5         [ 4] 1097 	call DOLIT 
      00A253 00 02                 1098 	.word 2 
      00A255 CD 88 05         [ 4] 1099 	call PLUS 
      00A258 CD 86 0A         [ 4] 1100 	call DUPP 
      00A25B CD 87 4A         [ 4] 1101 	call CNTXT 
      00A25E CD 85 4C         [ 4] 1102 	call STORE
      00A261 CD 87 76         [ 4] 1103 	call LAST
      00A264 CD 85 4C         [ 4] 1104 	call STORE 
      00A267 CD 9C 23         [ 4] 1105 	call UPDATLAST 
                                   1106 ;update CP 
      00A26A CD 87 66         [ 4] 1107 	call CPP 
      00A26D CD 85 4C         [ 4] 1108 	call STORE
      00A270 CD 9C 4C         [ 4] 1109 	call UPDATCP 
      00A273 81               [ 4] 1110 	ret 
                                   1111 
                                   1112 ;-----------------------------
                                   1113 ; move interrupt sub-routine
                                   1114 ; in flash memory
                                   1115 ;----------------------------- 
      00A274 A2 2E                 1116 	.word LINK 
                           0021F6  1117 	LINK=. 
      00A276 06                    1118 	.byte 6
      00A277 49 46 4D 4F 56 45     1119 	.ascii "IFMOVE" 
      00A27D                       1120 IFMOVE:
      00A27D CD 87 17         [ 4] 1121 	call TFLASH 
      00A280 CD 85 63         [ 4] 1122 	CALL AT 
      00A283 CD 85 18         [ 4] 1123 	CALL QBRAN 
      00A286 A2 28                 1124 	.word no_move 
      00A288 CD 87 66         [ 4] 1125 	call CPP 
      00A28B CD 85 63         [ 4] 1126 	call AT 
      00A28E CD 86 0A         [ 4] 1127 	call DUPP ; ( udl udl -- )
      00A291 CD 9C 09         [ 4] 1128 	call EEPVP 
      00A294 CD 86 00         [ 4] 1129 	call DROP
      00A297 CD 85 63         [ 4] 1130 	call AT  ; ( udl udl a )
      00A29A CD 85 D3         [ 4] 1131 	call TOR 
      00A29D CD A1 99         [ 4] 1132 	call FADDR
      00A2A0 CD 85 C7         [ 4] 1133 	call RAT ; ( udl ud a -- ) R: a 
      00A2A3 CC A1 D5         [ 2] 1134 	jp FMOVE2 
                                   1135 
                                   1136 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                           000001  4657 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



                                   4658         .include "const_ratio.asm"
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
      00A2A6 A2 76                   31         .word LINK 
                           002228    32         LINK=.
      00A2A8 02                      33         .byte 2
      00A2A9 50 49                   34         .ascii "PI" 
      00A2AB                         35 PII:
      00A2AB 1D 00 04         [ 2]   36         subw x,#2*CELLL 
      00A2AE 90 AE 01 63      [ 2]   37         ldw y,#355 
      00A2B2 EF 02            [ 2]   38         ldw (2,x),y 
      00A2B4 90 AE 00 71      [ 2]   39         ldw y,#113 
      00A2B8 FF               [ 2]   40         ldw (x),y 
      00A2B9 81               [ 4]   41         ret 
                                     42 
                                     43 ;      SQRT2 ( -- 19601  13860 )
                                     44 ; precision: 1.5e-9 
                                     45 ; usage example to compute Voltage peek to peek from Vrms 
                                     46 ; : VPP SQRT2 */ 2 * ;
                                     47 ;
      00A2BA A2 A8                   48         .word LINK 
                           00223C    49         LINK=.
      00A2BC 05                      50         .byte 5 
      00A2BD 53 51 52 54 32          51         .ascii "SQRT2" 
      00A2C2                         52 SQRT2:
      00A2C2 1D 00 04         [ 2]   53         subw x,#2*CELLL 
      00A2C5 90 AE 4C 91      [ 2]   54         ldw y,#19601 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      00A2C9 EF 02            [ 2]   55         ldw (2,x),y 
      00A2CB 90 AE 36 24      [ 2]   56         ldw y,#13860 
      00A2CF FF               [ 2]   57         ldw (x),y 
      00A2D0 81               [ 4]   58         ret 
                                     59 
                                     60 ;   SQRT3 ( -- 18817 10864 )
                                     61 ; precision: 1.1e-9
                                     62 ;
      00A2D1 A2 BC                   63         .word LINK 
                           002253    64         LINK=.
      00A2D3 05                      65         .byte 5
      00A2D4 53 51 52 54 33          66         .ascii "SQRT3" 
      00A2D9                         67 SQRT3: 
      00A2D9 1D 00 04         [ 2]   68     subw x,#2*CELLL 
      00A2DC 90 AE 49 81      [ 2]   69     ldw y,#18817 
      00A2E0 EF 02            [ 2]   70     ldw (2,x),y 
      00A2E2 90 AE 2A 70      [ 2]   71     ldw y,#10864 
      00A2E6 FF               [ 2]   72     ldw (x),y 
      00A2E7 81               [ 4]   73     ret 
                                     74 
                                     75 ;   E ( -- 28667 10546 )
                                     76 ; precision: 5.5e-9 
                                     77 ; natural log base 
      00A2E8 A2 D3                   78         .word LINK 
                           00226A    79         LINK=.
      00A2EA 01                      80         .byte 1
      00A2EB 45                      81         .ascii "E" 
      00A2EC                         82 ENEPER:
      00A2EC 1D 00 04         [ 2]   83     subw x,#2*CELLL 
      00A2EF 90 AE 6F FB      [ 2]   84     ldw y,#28667 
      00A2F3 EF 02            [ 2]   85     ldw (2,x),y 
      00A2F5 90 AE 29 32      [ 2]   86     ldw y,#10546 
      00A2F9 FF               [ 2]   87     ldw (x),y 
      00A2FA 81               [ 4]   88     ret 
                                     89 
                                     90 ;   SQRT10 ( -- 22936 7253 )
                                     91 ; precision: 5.7e-9 
      00A2FB A2 EA                   92         .word LINK 
                           00227D    93         LINK=.
      00A2FD 06                      94         .byte 6 
      00A2FE 53 51 52 54 31 30       95         .ascii "SQRT10" 
      00A304                         96 SQRT10:
      00A304 1D 00 04         [ 2]   97     subw x,#2*CELLL
      00A307 90 AE 59 98      [ 2]   98     ldw y,#22936 
      00A30B EF 02            [ 2]   99     ldw (2,x),y 
      00A30D 90 AE 1C 55      [ 2]  100     ldw y,#7253
      00A311 FF               [ 2]  101     ldw (x),y 
      00A312 81               [ 4]  102     ret 
                                    103 
                                    104 ;   12RT2 ( -- 26797 25293 )
                                    105 ; precision: 1.0e-9 
                                    106 ; used in music to compute well tempered scale
      00A313 A2 FD                  107         .word LINK 
                           002295   108         LINK=. 
      00A315 05                     109         .byte 5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      00A316 31 32 52 54 32         110         .ascii "12RT2"
      00A31B                        111 RT12_2:
      00A31B 1D 00 04         [ 2]  112     subw x,#2*CELLL 
      00A31E 90 AE 68 AD      [ 2]  113     ldw y,#26797
      00A322 EF 02            [ 2]  114     ldw (2,x),y 
      00A324 90 AE 62 CD      [ 2]  115     ldw y,#25293
      00A328 FF               [ 2]  116     ldw (x),y 
      00A329 81               [ 4]  117     ret 
                                    118 
                                    119 ;   LOG2s ( -- 2040 11103 )
                                    120 ; log(2)/1.6384
                                    121 ; precision: 1.1e-8
      00A32A A3 15                  122         .word LINK 
                           0022AC   123         LINK=.
      00A32C 05                     124         .byte 5 
      00A32D 4C 4F 47 32 53         125         .ascii "LOG2S" 
      00A332                        126 LOG2S:
      00A332 1D 00 04         [ 2]  127     subw x,#2*CELLL
      00A335 90 AE 07 F8      [ 2]  128     ldw y,#2040 
      00A339 EF 02            [ 2]  129     ldw (2,x),y 
      00A33B 90 AE 2B 5F      [ 2]  130     ldw y,#11103 
      00A33F FF               [ 2]  131     ldw (x),y 
      00A340 81               [ 4]  132     ret 
                                    133 
                                    134 ;   LN2 ( -- 485 11464 )
                                    135 ; ln(2)/16.384 
                                    136 ; precision: 1.0e-7 
      00A341 A3 2C                  137         .word LINK 
                           0022C3   138         LINK=.
      00A343 04                     139         .byte 4 
      00A344 4C 4E 32 53            140         .ascii "LN2S" 
      00A348                        141 LN2S: 
      00A348 1D 00 04         [ 2]  142     subw x,#2*CELLL
      00A34B 90 AE 01 E5      [ 2]  143     ldw y,#485
      00A34F EF 02            [ 2]  144     ldw (2,x),y 
      00A351 90 AE 2C C8      [ 2]  145     ldw y,#11464 
      00A355 FF               [ 2]  146     ldw (x),y 
      00A356 81               [ 4]  147     ret 
                                    148 
                                    149 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                   4659 .endif
                           000001  4660 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                   4661         .include "ctable.asm"
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
                                     19 ;------------------------------
                                     20 ; words to create and read 
                                     21 ; constants tables in FLASH 
                                     22 ; and EEPROM
                                     23 ;------------------------------
                                     24 
                                     25 ;-----------------------------
                                     26 ; allocate space in CODE area 
                                     27 ; for constant table.
                                     28 ; CALLOT ( u -- ad )
                                     29 ; u  bytes to allocates 
                                     30 ; ad data address as double.
                                     31 ;-----------------------------
      00A357 A3 43                   32     .word LINK 
                           0022D9    33     LINK=.
      00A359 06                      34     .byte 6
      00A35A 43 41 4C 4C 4F 54       35     .ascii "CALLOT"
      00A360                         36 CALLOT:
      00A360 CD 87 66         [ 4]   37     CALL CPP
      00A363 CD 86 0A         [ 4]   38     CALL DUPP 
      00A366 CD 85 63         [ 4]   39     CALL AT 
      00A369 CD 85 D3         [ 4]   40     CALL TOR 
      00A36C CD 8B DB         [ 4]   41     CALL PSTOR 
      00A36F CD 9C 4C         [ 4]   42     CALL UPDATCP 
      00A372 CD 85 B4         [ 4]   43     CALL RFROM
      00A375 CC 8B 6B         [ 2]   44     JP ZERO 
                                     45 
                                     46 ;------------------------------
                                     47 ; create constants bytes table 
                                     48 ; in persistant memory
                                     49 ;  CTABLE ( n+ -- ad ; <string> )
                                     50 ; n+ bytes reserved 
                                     51 ;-----------------------------
      00A378 A3 59                   52     .word LINK 
                           0022FA    53     LINK=.
      00A37A 06                      54     .byte 6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      00A37B 43 54 41 42 4C 45       55     .ascii "CTABLE"
      00A381                         56 CTABLE:
      00A381 CD A3 60         [ 4]   57     CALL CALLOT     
      00A384 CC 99 47         [ 2]   58     JP DCONST 
                                     59      
                                     60 
                                     61 ;--------------------------------
                                     62 ; create constants words table 
                                     63 ; in persistant memory 
                                     64 ; WTABLE ( n+ -- ad ; <string> )
                                     65 ; n+  words reserved  
                                     66 ;--------------------------------
      00A387 A3 7A                   67     .word LINK 
                           002309    68     LINK=.
      00A389 06                      69     .byte 6
      00A38A 57 54 41 42 4C 45       70     .ascii "WTABLE"
      00A390                         71 WTABLE:
      00A390 CD 8A F2         [ 4]   72     CALL CELLS  
      00A393 CD A3 60         [ 4]   73     CALL CALLOT 
      00A396 CC 99 47         [ 2]   74     JP DCONST 
                                     75 
                                     76 ;---------------------------------
                                     77 ; stack an element of CTABLE 
                                     78 ; CTABL@ ( u ad -- c )
                                     79 ; u element order {0..size-1}
                                     80 ; a|ad table address 
                                     81 ;--------------------------------
      00A399 A3 89                   82     .word LINK 
                           00231B    83     LINK=.
      00A39B 06                      84     .byte 6
      00A39C 43 54 41 42 4C 40       85     .ascii "CTABL@" 
      00A3A2                         86 CTAT:
      00A3A2 CD 9B 8F         [ 4]   87     call FPSTOR 
      00A3A5 CD 9D 0A         [ 4]   88     call PTRPLUS 
      00A3A8 CC 9D 47         [ 2]   89     jp EE_CREAD 
                                     90 
                                     91 ;---------------------------------
                                     92 ; stack an element of WTABLE 
                                     93 ; WTABL@ ( u ud -- w )
                                     94 ; u is element order {0..size-1}
                                     95 ; a|ud table address 
                                     96 ;----------------------------------
      00A3AB A3 9B                   97     .word LINK 
                           00232D    98     LINK=.
      00A3AD 06                      99     .byte 6
      00A3AE 57 54 41 42 4C 40      100     .ascii "WTABL@" 
      00A3B4                        101 WTAT:
      00A3B4 CD 9B 8F         [ 4]  102     call FPSTOR 
      00A3B7 CD 8A F2         [ 4]  103     call CELLS 
      00A3BA CD 9D 0A         [ 4]  104     call PTRPLUS 
      00A3BD CD 9D 25         [ 4]  105     call EE_READ 
      00A3C0 81               [ 4]  106     ret 
                                    107 
                                    108 ;--------------------------
                                    109 ; tool to initialize character table 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                    110 ; CTINIT ( ad -- )
                                    111 ; ad is table address 
                                    112 ;--------------------------
      00A3C1 A3 AD                  113     .word LINK 
                           002343   114     LINK=.
      00A3C3 06                     115     .byte 6 
      00A3C4 43 54 49 4E 49 54      116     .ascii "CTINIT"
      00A3CA                        117 CTINIT:
      00A3CA CD 9B 8F         [ 4]  118     CALL FPSTOR
      00A3CD CD 9C B6         [ 4]  119     CALL UNLOCK
      00A3D0 CD 8B 6B         [ 4]  120     CALL ZERO 
      00A3D3 CD 8A FF         [ 4]  121 1$: CALL ONEP 
      00A3D6 CD 86 0A         [ 4]  122     CALL DUPP 
      00A3D9 CD A4 26         [ 4]  123     CALL INTQ 
      00A3DC CD 85 18         [ 4]  124     CALL QBRAN 
      00A3DF A3 E9                  125     .word 2$
      00A3E1 CD 9D 61         [ 4]  126     call WR_BYTE 
      00A3E4 CD 85 2F         [ 4]  127     CALL BRAN 
      00A3E7 A3 D3                  128     .word 1$ 
      00A3E9 CD 87 E5         [ 4]  129 2$: CALL DDROP 
      00A3EC CD 9C DE         [ 4]  130     CALL LOCK 
      00A3EF 81               [ 4]  131     ret 
                                    132 
                                    133 ;--------------------------
                                    134 ; tool to initialize word table 
                                    135 ; WTINIT ( ad -- )
                                    136 ; ad is table address 
                                    137 ;--------------------------
      00A3F0 A3 C3                  138     .word LINK 
                           002372   139     LINK=.
      00A3F2 06                     140     .byte 6 
      00A3F3 57 54 49 4E 49 54      141     .ascii "WTINIT"
      00A3F9                        142 WTINIT:
      00A3F9 CD 9B 8F         [ 4]  143     CALL FPSTOR
      00A3FC CD 9C B6         [ 4]  144     CALL UNLOCK
      00A3FF CD 8B 6B         [ 4]  145     CALL ZERO 
      00A402 CD 8A FF         [ 4]  146 1$: CALL ONEP 
      00A405 CD 86 0A         [ 4]  147     CALL DUPP
      00A408 CD A4 26         [ 4]  148     CALL INTQ
      00A40B CD 85 18         [ 4]  149     CALL QBRAN 
      00A40E A4 18                  150     .word 2$
      00A410 CD 9D 86         [ 4]  151     call WR_WORD 
      00A413 CD 85 2F         [ 4]  152     CALL BRAN 
      00A416 A4 02                  153     .word 1$ 
      00A418 CD 87 E5         [ 4]  154 2$: CALL DDROP 
      00A41B CD 9C DE         [ 4]  155     CALL LOCK 
      00A41E 81               [ 4]  156     ret 
                                    157 
                                    158 ;------------------------
                                    159 ; Prompted input for integer 
                                    160 ; display n+ in bracket and
                                    161 ; '?' 
                                    162 ; [N]? ( n+ -- a )
                                    163 ;------------------------
      00A41F A3 F2                  164     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                           0023A1   165     LINK=.
      00A421 04                     166     .byte 4
      00A422 5B 4E 5D 3F            167     .ascii "[N]?" 
      00A426                        168 INTQ:
      00A426 CD 8F D1         [ 4]  169     CALL CR 
      00A429 CD 84 E5         [ 4]  170     call DOLIT 
      00A42C 00 5B                  171     .word '[
      00A42E CD 84 A4         [ 4]  172     CALL EMIT 
      00A431 CD 90 6C         [ 4]  173     CALL DOT 
      00A434 CD 90 10         [ 4]  174     CALL  DOTQP
      00A437 03                     175     .byte 3
      00A438 5D 3F 20               176     .ascii "]? " 
      00A43B CD 93 B8         [ 4]  177     CALL QUERY 
      00A43E CD 91 E3         [ 4]  178     call TOKEN 
      00A441 CC 8E 7E         [ 2]  179     jp NUMBQ
                                    180 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



                                   4662 .endif
                                   4663 
                                   4664 ;===============================================================
                                   4665 
                           0023A1  4666 LASTN =	LINK   ;last name defined
                                   4667 
                                   4668 ; application code begin here
      00A480                       4669 	.bndry 128 ; align on flash block  
      00A480                       4670 app_space: 
                                   4671 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000821 R   |   6 ABOR1      001374 R
  6 ABOR2      00138B R   |   6 ABORQ      00136C R   |   6 ABORT      00135D R
  6 ABRTQ      001648 R   |   6 ABSS       000818 R   |   6 ACCEP      0012F3 R
  6 ACCP1      0012FC R   |   6 ACCP2      001322 R   |   6 ACCP3      001325 R
  6 ACCP4      001327 R   |     ADC_AWCR=  00540E     |     ADC_AWCR=  00540F 
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
  6 ADRADJ     000724 R   |     AFR     =  004803     |     AFR0_ADC=  000000 
    AFR1_TIM=  000001     |     AFR2_CCO=  000002     |     AFR3_TIM=  000003 
    AFR4_TIM=  000004     |     AFR5_TIM=  000005     |     AFR6_I2C=  000006 
    AFR7_BEE=  000007     |   6 AFT        001633 R   |   6 AGAIN      001589 R
  6 AHEAD      0015E6 R   |   6 ALLOT      00149C R   |   6 ANDD       0005D6 R
    APP_CP  =  004004     |     APP_LAST=  004000     |     APP_RUN =  004002 
    APP_VP  =  004006     |   6 AT         0004E3 R   |   6 ATEXE      000C0F R
  6 AUTORUN    000117 R   |     AWU_APR =  0050F1     |     AWU_CSR1=  0050F0 
    AWU_TBR =  0050F2     |     B115200 =  000006     |   6 B115K2     0003CE R
    B19200  =  000003     |   6 B19K2      0003AB R   |     B230400 =  000007 
    B2400   =  000000     |   6 B2K4       00037C R   |     B38400  =  000004 
    B460800 =  000008     |     B4800   =  000001     |   6 B4K8       00038A R
    B57600  =  000005     |   6 B57K6      0003BC R   |     B921600 =  000009 
    B9600   =  000002     |   6 B9K6       00039A R   |   6 BACK1      00129B R
  6 BASE       000647 R   |     BASEE   =  00000A     |   6 BAUD       0003DE R
    BCNT    =  000001     |   6 BCOMP      0014DE R   |   6 BDIGS      000CF6 R
    BEEP_CSR=  0050F3     |   6 BEGIN      00156B R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |   6 BKSLA      001133 R   |   6 BKSP       00126B R
    BKSPP   =  000008     |   6 BLANK      000ADE R   |     BLOCK_SI=  000080 
  6 BRAN       0004AF R   |     BTW     =  000001     |   6 BUF2ROW    002097 R
  6 BYE        0000A4 R   |     CADR    =  000003     |     CALLL   =  0000CD 
  6 CALLOT     0022E0 R   |     CARRY   =  000028     |   6 CAT        000501 R
  6 CCOMMA     0014C0 R   |     CELLL   =  000002     |   6 CELLM      000A63 R
  6 CELLP      000A54 R   |   6 CELLS      000A72 R   |     CFG_GCR =  007F60 
  6 CHAR1      000F23 R   |   6 CHAR2      000F26 R   |   6 CHKIVEC    001F85 R
    CLKOPT  =  004807     |     CLKOPT_C=  000002     |     CLKOPT_E=  000003 
    CLKOPT_P=  000000     |     CLKOPT_P=  000001     |     CLK_CCOR=  0050C9 
    CLK_CKDI=  0050C6     |     CLK_CKDI=  000000     |     CLK_CKDI=  000001 
    CLK_CKDI=  000002     |     CLK_CKDI=  000003     |     CLK_CKDI=  000004 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]

Symbol Table

    CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1 
    CLK_ECKR=  000000     |     CLK_ECKR=  000001     |     CLK_HSIT=  0050CC 
    CLK_ICKR=  0050C0     |     CLK_ICKR=  000002     |     CLK_ICKR=  000000 
    CLK_ICKR=  000001     |     CLK_ICKR=  000003     |     CLK_ICKR=  000004 
    CLK_ICKR=  000005     |     CLK_PCKE=  0050C7     |     CLK_PCKE=  000000 
    CLK_PCKE=  000001     |     CLK_PCKE=  000007     |     CLK_PCKE=  000005 
    CLK_PCKE=  000006     |     CLK_PCKE=  000004     |     CLK_PCKE=  000003 
    CLK_PCKE=  0050CA     |     CLK_PCKE=  000003     |     CLK_PCKE=  000002 
    CLK_SWCR=  0050C5     |     CLK_SWCR=  000000     |     CLK_SWCR=  000001 
    CLK_SWCR=  000002     |     CLK_SWCR=  000003     |     CLK_SWIM=  0050CD 
    CLK_SWR =  0050C4     |     CLK_SWR_=  0000B4     |     CLK_SWR_=  0000E1 
    CLK_SWR_=  0000D2     |   6 CMOV1      000C2E R   |   6 CMOV2      000C46 R
  6 CMOVE      000C26 R   |     CNTDWN  =  000030     |   6 CNTXT      0006CA R
  6 COLD       001AA0 R   |   6 COLD1      001AA0 R   |   6 COLON      0017E1 R
  6 COMMA      0014A9 R   |   6 COMPI      0014EE R   |     COMPO   =  000040 
  6 CONSTANT   00188B R   |   6 COUNT      000BC2 R   |   6 CPP        0006E6 R
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |   6 CR         000F51 R
  6 CREAT      001827 R   |     CRR     =  00000D     |   6 CSTOR      0004F0 R
  6 CTABLE     002301 R   |   6 CTAT       002322 R   |   6 CTINIT     00234A R
  6 DAT        000BA2 R   |     DATSTK  =  000680     |   6 DCONST     0018C7 R
  6 DDROP      000765 R   |   6 DDUP       000770 R   |   6 DECIM      000DA6 R
  6 DEPTH      000B2D R   |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  6 DGTQ1      000DEB R   |   6 DI         0000B2 R   |   6 DIG        000D1F R
  6 DIGIT      000CBA R   |   6 DIGS       000D30 R   |   6 DIGS1      000D30 R
  6 DIGS2      000D3D R   |   6 DIGTQ      000DBA R   |     DISCOVER=  000000 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   6 DN1        0007DF R
  6 DNEGA      0007C2 R   |   6 DOCONST    0018B5 R   |   6 DOLIT      000465 R
  6 DONXT      000479 R   |     DOORBELL=  000001     |   6 DOSTR      000F67 R
  6 DOT        000FEC R   |   6 DOT1       001002 R   |   6 DOTI1      001A23 R
  6 DOTID      001A0D R   |   6 DOTO1      001400 R   |   6 DOTOK      0013E6 R
  6 DOTPR      001115 R   |   6 DOTQ       001662 R   |   6 DOTQP      000F90 R
  6 DOTR       000F9E R   |   6 DOTS       0019AF R   |   6 DOTS1      0019BA R
  6 DOTS2      0019C3 R   |   6 DOVAR      000637 R   |   6 DO_DCONS   0018F6 R
  6 DROP       000580 R   |   6 DSTOR      000B7C R   |   6 DUMP       001965 R
  6 DUMP1      00197C R   |   6 DUMP3      00199E R   |   6 DUMPP      001934 R
  6 DUPP       00058A R   |   6 EDIGS      000D5B R   |   6 EECSTORE   001D36 R
  6 EEPCP      001B73 R   |   6 EEPLAST    001B46 R   |   6 EEPROM     001B2E R
    EEPROM_B=  004000     |     EEPROM_E=  0043FF     |     EEPROM_R=  000010 
    EEPROM_S=  000400     |   6 EEPRUN     001B5D R   |   6 EEPVP      001B89 R
  6 EESTORE    001D82 R   |   6 EE_CCOMM   00204C R   |   6 EE_COMMA   00202B R
  6 EE_CREAD   001CC7 R   |   6 EE_READ    001CA5 R   |   6 EI         0000AB R
  6 ELSEE      0015C1 R   |   6 EMIT       000424 R   |   6 ENEPER     00226C R
    EOL_CR  =  000001     |     EOL_LF  =  000000     |   6 EQ1        00083C R
  6 EQUAL      000826 R   |   6 ERASE      000C88 R   |     ERR     =  00001B 
  6 EVAL       001429 R   |   6 EVAL1      001429 R   |   6 EVAL2      001445 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]

Symbol Table

  6 EXE1       000C1D R   |   6 EXECU      0004BF R   |     EXT     =  000000 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |   6 EXTRC      000CE2 R
  6 FADDR      002119 R   |   6 FC_XOFF    000451 R   |   6 FC_XON     00043B R
  6 FILL       000C55 R   |   6 FILL1      000C72 R   |   6 FILL2      000C7B R
  6 FIND       0011C7 R   |   6 FIND1      0011E5 R   |   6 FIND2      001213 R
  6 FIND3      00121F R   |   6 FIND4      001233 R   |   6 FIND5      001240 R
  6 FIND6      001224 R   |     FLASH_BA=  008000     |     FLASH_CR=  00505A 
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
    FLASH_PU=  0000AE     |   6 FMOVE      002124 R   |   6 FMOVE2     002155 R
  6 FOR        00153E R   |   6 FORGET     000148 R   |   6 FORGET1    000177 R
  6 FORGET2    0001FD R   |   6 FORGET4    000206 R   |   6 FORGET6    0001BF R
  6 FPSTOR     001B0F R   |     FPTR    =  000032     |   6 FREEVAR    000213 R
  6 FREEVAR4   000249 R   |     GPIO_BAS=  005000     |     GPIO_SIZ=  000005 
  6 HERE       000BD9 R   |   6 HEX        000D91 R   |   6 HI         001A5F R
  6 HLD        0006B7 R   |   6 HOLD       000D06 R   |     HSECNT  =  004809 
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
  6 ICOLON     0017F2 R   |   6 IFETCH     00155C R   |   6 IFF        001599 R
  6 IFMOVE     0021FD R   |     IMEDD   =  000080     |   6 IMMED      001804 R
  6 INCH       000418 R   |   6 INC_FPTR   001C72 R   |   6 INITOFS    0017BA R
  6 INN        000665 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_PU=  000001     |   6 INTE1      0013C8 R
  6 INTER      00139E R   |   6 INTQ       0023A6 R   |     INT_ADC1=  000016 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]

Symbol Table

    INT_AWU =  000001     |     INT_CLK =  000002     |     INT_EXTI=  000003 
    INT_EXTI=  000004     |     INT_EXTI=  000005     |     INT_EXTI=  000006 
    INT_EXTI=  000007     |     INT_FLAS=  000018     |     INT_I2C =  000013 
    INT_RES1=  000008     |     INT_RES2=  000009     |     INT_RES3=  000011 
    INT_RES4=  000012     |     INT_SPI =  00000A     |     INT_TIM1=  00000C 
    INT_TIM1=  00000B     |     INT_TIM2=  00000E     |     INT_TIM2=  00000D 
    INT_TIM3=  000010     |     INT_TIM3=  00000F     |     INT_TIM4=  000017 
    INT_TLI =  000000     |     INT_UART=  000015     |     INT_UART=  000014 
    INT_VECT=  008060     |     INT_VECT=  00800C     |     INT_VECT=  008010 
    INT_VECT=  008014     |     INT_VECT=  008018     |     INT_VECT=  00801C 
    INT_VECT=  008020     |     INT_VECT=  008024     |     INT_VECT=  008068 
    INT_VECT=  008054     |     INT_VECT=  008000     |     INT_VECT=  008030 
    INT_VECT=  008038     |     INT_VECT=  008034     |     INT_VECT=  008040 
    INT_VECT=  00803C     |     INT_VECT=  008048     |     INT_VECT=  008044 
    INT_VECT=  008064     |     INT_VECT=  008008     |     INT_VECT=  008004 
    INT_VECT=  00805C     |     INT_VECT=  008058     |   6 INVER      00079F R
    IPR0    =  000002     |     IPR1    =  000001     |     IPR2    =  000000 
    IPR3    =  000003     |     IPR_MASK=  000003     |     IRET_COD=  000080 
  6 ISEMI      00174F R   |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  6 JSRC       0017A4 R   |   6 KEY        000ED1 R   |   6 KTAP       0012B8 R
  6 KTAP1      0012DB R   |   6 KTAP2      0012DE R   |   6 LAST       0006F6 R
  6 LASTN   =  0023A1 R   |   6 LBRAC      0013D5 R   |   6 LESS       000863 R
    LF      =  00000A     |   6 LINK    =  0023A1 R   |   6 LITER      001510 R
  6 LN2S       0022C8 R   |   6 LOCK       001C5E R   |   6 LOG2S      0022B2 R
  6 LSHIFT     000A9D R   |   6 LSHIFT1    000AA6 R   |   6 LSHIFT4    000AAE R
  6 LT1        000879 R   |     MASKK   =  001F7F     |   6 MAX        000883 R
  6 MAX1       000896 R   |   6 MIN        0008A0 R   |   6 MIN1       0008B3 R
    MISCOPT =  004805     |     MISCOPT_=  000004     |     MISCOPT_=  000002 
    MISCOPT_=  000003     |     MISCOPT_=  000000     |     MISCOPT_=  000001 
  6 MMOD1      000956 R   |   6 MMOD2      00096A R   |   6 MMOD3      000981 R
  6 MMSM1      0008FD R   |   6 MMSM2      000911 R   |   6 MMSM3      000913 R
  6 MMSM4      00091B R   |   6 MODD       00099B R   |   6 MONE       000B04 R
    MS      =  00002E     |   6 MSEC       0002BE R   |   6 MSMOD      000939 R
  6 MSTA1      000A2C R   |   6 MSTAR      000A09 R   |     NAFR    =  004804 
  6 NAMEQ      001260 R   |   6 NAMET      001171 R   |     NCLKOPT =  004808 
  6 NEGAT      0007B0 R   |   6 NEX1       000486 R   |   6 NEXT       00154D R
    NHSECNT =  00480A     |     NMISCOPT=  004806     |     NMISCOPT=  FFFFFFFB 
    NMISCOPT=  FFFFFFFD     |     NMISCOPT=  FFFFFFFC     |     NMISCOPT=  FFFFFFFF 
    NMISCOPT=  FFFFFFFE     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPTBL  =  00487F     |   6 NTIB       000675 R   |     NUBC    =  004802 
    NUCLEO  =  000000     |   6 NUFQ       000EE7 R   |   6 NUFQ1      000F00 R
  6 NUMBQ      000DFE R   |   6 NUMQ1      000E32 R   |   6 NUMQ2      000E63 R
  6 NUMQ3      000EA5 R   |   6 NUMQ4      000EAA R   |   6 NUMQ5      000EB9 R
  6 NUMQ6      000EBC R   |   6 NonHandl   000000 R   |   6 OFFSET     00071B R
    OFS     =  000005     |   6 ONE        000AF6 R   |   6 ONEM       000A8C R
  6 ONEP       000A7F R   |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPTBL   =  00487E     |     OPTIMIZE=  000001     |     OPTION_B=  004800 
    OPTION_E=  00487F     |   6 ORIG       000047 R   |   6 ORR        0005EA R
  6 OUTPUT     000429 R   |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]

Symbol Table

    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |   6 OVER       0005B4 R
  6 OVERT      00171D R   |     PA      =  000000     |   6 PACKS      000C99 R
  6 PAD        000BEA R   |   6 PAREN      001124 R   |   6 PARS       00101D R
  6 PARS1      001048 R   |   6 PARS2      001073 R   |   6 PARS3      001076 R
  6 PARS4      00107F R   |   6 PARS5      0010A2 R   |   6 PARS6      0010B7 R
  6 PARS7      0010C6 R   |   6 PARS8      0010D5 R   |   6 PARSE      0010E6 R
  6 PAUSE      0002CE R   |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      001947 R   |   6 PDUM2      001958 R
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |   6 PICK       000B44 R
  6 PII        00222B R   |     PIN0    =  000000     |     PIN1    =  000001 
    PIN2    =  000002     |     PIN3    =  000003     |     PIN4    =  000004 
    PIN5    =  000005     |     PIN6    =  000006     |     PIN7    =  000007 
  6 PLUS       000785 R   |   6 PNAM1      0016D2 R   |   6 PRESE      001454 R
    PROD1   =  000022     |     PROD2   =  000024     |     PROD3   =  000026 
  6 PROTECTE   0001EF R   |   6 PSTOR      000B5B R   |     PTR16   =  000033 
    PTR8    =  000034     |   6 PTRPLUS    001C8A R   |   6 QBRAN      000498 R
  6 QDUP       000734 R   |   6 QDUP1      00073E R   |   6 QKEY       000406 R
  6 QSTAC      00140C R   |   6 QUERY      001338 R   |   6 QUEST      00100F R
  6 QUIT       001471 R   |   6 QUIT1      001479 R   |   6 QUIT2      00147C R
  6 RAM2EE     0020C5 R   |     RAMBASE =  000000     |   6 RAMLAST    000709 R
    RAM_BASE=  000000     |     RAM_END =  0007FF     |     RAM_SIZE=  000800 
  6 RANDOM     00026C R   |   6 RAT        000547 R   |   6 RBRAC      001791 R
  6 REPEA      001616 R   |   6 RFREE      0020AC R   |   6 RFROM      000534 R
    ROP     =  004800     |   6 ROT        000745 R   |   6 ROW2BUF    00206E R
    ROWBUFF =  000680     |     RP0     =  00002C     |   6 RPAT       000511 R
    RPP     =  0007FF     |   6 RPSTO      00051E R   |   6 RSHIFT     000AB9 R
  6 RSHIFT1    000AC2 R   |   6 RSHIFT4    000ACA R   |     RST_SR  =  0050B3 
  6 RT12_2     00229B R   |   6 SAME1      00118F R   |   6 SAME2      0011B8 R
  6 SAMEQ      001187 R   |   6 SCOM1      001707 R   |   6 SCOM2      00170A R
  6 SCOMP      0016E9 R   |   6 SEED       000253 R   |     SEEDX   =  000036 
    SEEDY   =  000038     |   6 SEMIS      00172D R   |   6 SETISP     0000BE R
  6 SET_RAML   001874 R   |     SFR_BASE=  005000     |     SFR_END =  0057FF 
  6 SIGN       000D45 R   |   6 SIGN1      000D55 R   |   6 SLASH      0009A5 R
  6 SLMOD      000989 R   |   6 SNAME      00169C R   |     SP0     =  00002A 
  6 SPACE      000F09 R   |   6 SPACS      000F18 R   |   6 SPAT       00056A R
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SPP     =  000680 
    SPSAVE  =  000001     |   6 SPSTO      000577 R   |   6 SQRT10     002284 R
  6 SQRT2      002242 R   |   6 SQRT3      002259 R   |   6 SSMOD      000A35 R
    SSP     =  000001     |     STACK   =  0007FF     |   6 STAR       0009FE R
  6 STASL      000A46 R   |   6 STOD       0007E7 R   |   6 STORE      0004CC R
  6 STR        000D73 R   |   6 STRCQ      00151E R   |   6 STRQ       001655 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]

Symbol Table

  6 STRQP      000F86 R   |   6 SUBB       0007FE R   |   6 SWAPP      00059A R
    SWIM_CSR=  007F80     |   6 TAP        0012A2 R   |   6 TBOOT      001A94 R
  6 TBUF       000685 R   |     TBUFFBAS=  000680     |   6 TCHAR      000B15 R
  6 TEMP       000656 R   |   6 TEVAL      0006A8 R   |   6 TFLASH     000697 R
  6 THENN      0015AE R   |   6 TIB        000BFB R   |     TIBB    =  000700 
    TIBBASE =  000700     |     TIC     =  000027     |   6 TICK       001488 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]

Symbol Table

    TIM2_CCR=  005313     |     TIM2_CCR=  005314     |     TIM2_CNT=  00530A 
    TIM2_CNT=  00530B     |     TIM2_CR1=  005300     |     TIM2_EGR=  005304 
    TIM2_IER=  005301     |     TIM2_PSC=  00530C     |     TIM2_SR1=  005302 
    TIM2_SR2=  005303     |     TIM3_ARR=  00532B     |     TIM3_ARR=  00532C 
    TIM3_CCE=  005327     |     TIM3_CCE=  000000     |     TIM3_CCE=  000001 
    TIM3_CCE=  000004     |     TIM3_CCE=  000005     |     TIM3_CCE=  000000 
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
    TIM4_SR_=  000000     |   6 TIMEOUTQ   0002FE R   |   6 TIMER      0002E8 R
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |   6 TNAM2      0019DD R
  6 TNAM3      0019FB R   |   6 TNAM4      001A01 R   |   6 TNAME      0019DA R
  6 TOFLASH    000323 R   |   6 TOKEN      001163 R   |   6 TOR        000553 R
  6 TORAM      000363 R   |     TRUEE   =  00FFFF     |   6 TWOSL      000AD1 R
  6 TYPE1      000F38 R   |   6 TYPE2      000F44 R   |   6 TYPES      000F33 R
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
    UART_DR =  005241     |     UART_SR =  005240     |     UART_SR_=  000001 
    UART_SR_=  000004     |     UART_SR_=  000002     |     UART_SR_=  000003 
    UART_SR_=  000000     |     UART_SR_=  000005     |     UART_SR_=  000006 
    UART_SR_=  000007     |     UBASE   =  000006     |     UBC     =  004801 
    UCNTXT  =  000014     |     UCP     =  000018     |     UCTIB   =  00000C 
    UD1     =  000001     |     UD2     =  000002     |     UD3     =  000003 
    UD4     =  000004     |   6 UDOT       000FD9 R   |   6 UDOTR      000FB9 R
  6 UEND       000045 R   |     UHLD    =  000012     |     UINN    =  00000A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]

Symbol Table

    UINTER  =  000010     |     ULAST   =  00001A     |   6 ULES1      00085B R
  6 ULESS      000845 R   |   6 UMMOD      0008DB R   |   6 UMSTA      0009B4 R
  6 UNIQ1      001693 R   |   6 UNIQU      001674 R   |   6 UNLKEE     001BF8 R
  6 UNLKFL     001C17 R   |   6 UNLOCK     001C36 R   |   6 UNTIL      001576 R
    UOFFSET =  00001C     |   6 UPDATCP    001BCC R   |   6 UPDATLAS   001BA3 R
  6 UPDATPTR   0021B8 R   |   6 UPDATRUN   001BBB R   |   6 UPDATVP    001BE3 R
  6 UPL1       00062B R   |   6 UPLUS      000614 R   |     UPP     =  000006 
    URLAST  =  000020     |     UTFLASH =  00001E     |     UTIB    =  00000E 
    UTMP    =  000008     |   6 UTYP1      001917 R   |   6 UTYP2      001926 R
  6 UTYPE      001912 R   |     UVP     =  000016     |   6 UZERO      00002B R
  6 VARIA      001841 R   |     VAR_BASE=  000080     |     VAR_TOP =  0007BF 
    VER     =  000003     |   6 VPP        0006D8 R   |     VSIZE   =  000006 
    WANT_CON=  000001     |     WANT_DEB=  000000     |     WANT_SCA=  000001 
    WANT_SEE=  000000     |   6 WHILE      0015FC R   |   6 WITHI      0008C0 R
  6 WORDD      00114F R   |   6 WORDS      001A37 R   |   6 WORS1      001A3D R
  6 WORS2      001A59 R   |   6 WR_BYTE    001CE1 R   |   6 WR_WORD    001D06 R
  6 WTABLE     002310 R   |   6 WTAT       002334 R   |   6 WTINIT     002379 R
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     X4_FLASH=  00BFFF 
    X4_FLASH=  004000     |     X6_FLASH=  00FFFF     |     X6_FLASH=  008000 
    XMEM_SIZ=  000000     |     XOFF    =  000013     |     XON     =  000011 
  6 XORR       0005FF R   |     XTEMP   =  000022     |     YTEMP   =  000024 
  6 ZERO       000AEB R   |   6 ZL1        0005CC R   |   6 ZLESS      0005C3 R
  6 app_spac   002400 R   |   6 baudrate   000369 R   |   6 block_er   001DCC R
  6 clear_ra   000019 R   |   6 clock_in   000052 R   |   6 copy_buf   001E2C R
  6 copy_buf   001E4B R   |   6 copy_pro   001E4B R   |     da      =  000002 
    db      =  000003     |     dc      =  000000     |     dd      =  000001 
  6 erase_fl   001DEE R   |   6 fmove_do   0021A1 R   |   6 main       000016 R
  6 next_row   00215E R   |   6 no_move    0021A8 R   |   6 pristine   001ECC R
  6 proceed_   001DF1 R   |   6 reboot     000315 R   |   6 reset_ve   001F33 R
  6 row_eras   001DAC R   |   6 row_eras   001E05 R   |   6 row_eras   001E2C R
  6 set_opti   001EA0 R   |   6 set_vect   001FD4 R   |   6 uart_ini   000064 R
  6 write_ro   001E70 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   2400   flags    0

