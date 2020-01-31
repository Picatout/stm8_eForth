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
                                        	.include "inc/nucleo_8s208.inc"
                                        ;;
                                        ; Copyright Jacques Deschênes 2019 
                                        ; This file is part of MONA 
                                        ;
                                        ;     MONA is free software: you can redistribute it and/or modify
                                        ;     it under the terms of the GNU General Public License as published by
                                        ;     the Free Software Foundation, either version 3 of the License, or
                                        ;     (at your option) any later version.
                                        ;
                                        ;     MONA is distributed in the hope that it will be useful,
                                        ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                        ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                        ;     GNU General Public License for more details.
                                        ;
                                        ;     You should have received a copy of the GNU General Public License
                                        ;     along with MONA.  If not, see <http://www.gnu.org/licenses/>.
                                        ;;
                                        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ; NUCLEO-8S208RB board specific definitions
                                        ; Date: 2019/10/29
                                        ; author: Jacques Deschênes, copyright 2018,2019
                                        ; licence: GPLv3
                                        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        
                                        ; mcu on board is stm8s208rbt6
                                        
                                        ; crystal on board is 8Mhz
                                 
                                        
                                        ; LED2 is user LED
                                        ; connected to PC5 via Q2 -> 2N7002 MOSFET
                                 
                                 
                                 
                                        
                                        ; B1 on schematic is user button
                                        ; connected to PE4
                                        ; external pullup resistor R6 4k7 and debounce capacitor C5 100nF
                                 
                                 
                                 
                                        
                                        
                                        	.include "inc/stm8s208.inc"
                                        ;;
                                        ; Copyright Jacques Deschênes 2019 
                                        ; This file is part of MONA 
                                        ;
                                        ;     MONA is free software: you can redistribute it and/or modify
                                        ;     it under the terms of the GNU General Public License as published by
                                        ;     the Free Software Foundation, either version 3 of the License, or
                                        ;     (at your option) any later version.
                                        ;
                                        ;     MONA is distributed in the hope that it will be useful,
                                        ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                        ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                        ;     GNU General Public License for more details.
                                        ;
                                        ;     You should have received a copy of the GNU General Public License
                                        ;     along with MONA.  If not, see <http://www.gnu.org/licenses/>.
                                        ;;
                                        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ; 2019/10/18
                                        ; STM8S208RB µC registers map
                                        ; sdas source file
                                        ; author: Jacques Deschênes, copyright 2018,2019
                                        ; licence: GPLv3
                                        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        	.module stm8s208rb
                                        
                                        ;;;;;;;;;;;;
                                        ; bits
                                        ;;;;;;;;;;;;
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                         	
                                        ;;;;;;;;;;;;
                                        ; bits masks
                                        ;;;;;;;;;;;;
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; HSI oscillator frequency 16Mhz
                                 
                                        ; LSI oscillator frequency 128Khz
                                 
                                        
                                        ; controller memory regions
                                 
                                 
                                        ; STM8S208RB have 128K flash
                                 
                                        ; erase block size 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
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
                                 
                                 
                                        ; flash wait state
                                 
                                 
                                        
                                        ; watchdog options bits
                                 
                                 
                                 
                                 
                                        ; NWDGOPT bits
                                 
                                 
                                 
                                 
                                        
                                        ; CLKOPT bits
                                 
                                 
                                 
                                 
                                        
                                        ; AFR option, remapable functions
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; device ID = (read only)
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        
                                 
                                 
                                        ; PORTS SFR OFFSET
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; GPIO
                                        ; gpio register offset to base
                                 
                                 
                                 
                                 
                                 
                                 
                                         
                                        ; port A
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; port B
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; port C
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; port D
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; port E
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; port F
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; port G
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; port H not present on LQFP48/LQFP64 package
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; port I ; only bit 0 on LQFP64 package, not present on LQFP48
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; input modes CR1
                                 
                                 
                                        ; output mode CR1
                                 
                                 
                                        ; input modes CR2
                                 
                                 
                                        ; output speed CR2
                                 
                                 
                                        
                                        
                                        ; Flash memory
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
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
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Beeper
                                        ; beeper output is alternate function AFR7 on PD4
                                        ; connected to CN9-6
                                 
                                 
                                 
                                 
                                        
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
                                        ; to be used by uart_init 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; UART registers offset from
                                        ; base address 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; uart identifier
                                        ; to be used by uart_init
                                 
                                 
                                        
                                        ; pins used by uart 
                                 
                                 
                                 
                                 
                                        ; uart port base address 
                                 
                                 
                                        
                                        ; UART1 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; UART3
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; UART Status Register bits
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Uart Control Register bits
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        ; LIN mode config register
                                 
                                 
                                 
                                 
                                 
                                 
                                        
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
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                        
                                 
                                        
                                 
                                        
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; ADC2
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                         
                                        ; ADC bitmasks
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                        
                                        ; beCAN
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        
                                        ; CPU
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; global configuration register
                                 
                                 
                                 
                                        
                                        ; interrupt control registers
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; SWIM, control and status register
                                 
                                        ; debug registers
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Interrupt Numbers
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Interrupt Vectors
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Condition code register bits
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                     13 	.list
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



                                     15 
                                     16 ;===============================================================
                                     17 ;  Adaption to NUCLEO-8S208RB by Picatout
                                     18 ;  Date: 2019-10-26
                                     19 ;  Changes to memory map:
                                     20 ;       0x16f0  Data Stack, growing downward
                                     21 ;       0x1700  Terminal input buffer TIB
                                     22 ;       0x17ff  Return Stack, growing downard
                                     23 ;================================================================
                                     24 ;       STM8EF, Version 2.1, 13 July
                                     25 ;               Implemented on STM8S-Discovery Board.
                                     26 ;               Assembled by ST VisualDevelop STVD 
                                     27 ;               Bootup on internal 2 MHz clock
                                     28 ;               Switch to external 16 MHz crystal clock
                                     29 ;
                                     30 ; FORTH Virtual Machine:
                                     31 ; Subroutine threaded model
                                     32 ; SP Return stack pointer
                                     33 ; X Data stack pointer
                                     34 ; A,Y Scratch pad registers
                                     35 ;
                                     36 ; Memory Map:
                                     37 ; 0x0 RAM memory, system variables
                                     38 ; 0x80 Start of user defined words, linked to ROM dictionary
                                     39 ; 0x780 Data stack, growing downward
                                     40 ; 0x790 Terminal input buffer TIB
                                     41 ; 0x7FF Return stack, growing downward
                                     42 ; 0x8000 Interrupt vector table
                                     43 ; 0x8080 FORTH startup code
                                     44 ; 0x80E7 Start of FORTH dictionary in ROM
                                     45 ; 0x9584 End of FORTH dictionary
                                     46 ;
                                     47 ;       EF12, Version 2.1, 18apr00cht
                                     48 ;               move to 8000H replacing WHYP.
                                     49 ;               copy interrupt vectors from WHYPFLSH.S19
                                     50 ;               to EF12.S19 before flashing
                                     51 ;               add TICKS1 and DELAY1 for motor stepping
                                     52 ;
                                     53 ;       EF12, 02/18/00, C. H. Ting
                                     54 ;       Adapt 86eForth v2.02 to 68HC12.
                                     55 ;               Use WHYP to seed EF12.ASM
                                     56 ;               Use AS12 native 68HC12 assembler:
                                     57 ;               as12 ef12.asm >ef12.lst
                                     58 ;       EF12A, add ADC code, 02mar00cht
                                     59 ;       EF12B, 01mar00cht
                                     60 ;               stack to 0x78, return stack to 0xf8.
                                     61 ;               add all port definitions
                                     62 ;               add PWM registers
                                     63 ;               add SPI registers and code
                                     64 ;       EF12C, 12mar00cht
                                     65 ;               add MAX5250 D/A converter
                                     66 ;       EF12D, 15mar00cht
                                     67 ;               add all the Lexel interface words
                                     68 ;       EF12E, 18apr00cht, save for reference
                                     69 ;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



                                     70 ;       Copyright (c) 2000
                                     71 ;       Dr. C. H. Ting
                                     72 ;       156 14th Avenue
                                     73 ;       San Mateo, CA 94402
                                     74 ;       (650) 571-7639
                                     75 ;
                                     76 
                                     77 ;*********************************************************
                                     78 ;	Assembler constants
                                     79 ;*********************************************************
                           000000    80 RAMBASE =	0x0000	   ;ram base
                           0017FF    81 STACK   =	0x17FF	;system (return) stack empty 
                           0016F0    82 DATSTK  =	0x16F0	;data stack  empty
                           001700    83 TIBBASE =       0X1700  ; tib addr.
                                     84 ;******  System Variables  ******
                           00001A    85 XTEMP	=	26	;address called by CREATE
                           00001C    86 YTEMP	=	28	;address called by CREATE
                           00001A    87 PROD1 = 26	;space for UM*
                           00001C    88 PROD2 = 28
                           00001E    89 PROD3 = 30
                           000020    90 CARRY = 32
                           000022    91 SP0	=	34	 ;initial data stack pointer
                           000024    92 RP0	=	36	;initial return stack pointer
                                     93 
                                     94 ;***********************************************
                                     95 ;; Version control
                                     96 
                           000002    97 VER     =     2         ;major release version
                           000001    98 EXT     =     1         ;minor extension
                                     99 
                                    100 ;; Constants
                                    101 
                           00FFFF   102 TRUEE   =     0xFFFF      ;true flag
                                    103 
                           000040   104 COMPO   =     0x40     ;lexicon compile only bit
                           000080   105 IMEDD   =     0x80     ;lexicon immediate bit
                           001F7F   106 MASKK   =     0x1F7F  ;lexicon bit mask
                                    107 
                           000002   108 CELLL   =     2       ;size of a cell
                           00000A   109 BASEE   =     10      ;default radix
                           000008   110 BKSPP   =     8       ;back space
                           00000A   111 LF      =     10      ;line feed
                           00000D   112 CRR     =     13      ;carriage return
                           00001B   113 ERR     =     27      ;error escape
                           000027   114 TIC     =     39      ;tick
                           0000CD   115 CALLL   =     0xCD     ;CALL opcodes
                                    116 
                                    117 ;; Memory allocation
                                    118 
                           000006   119 UPP     =     RAMBASE+6
                           0016F0   120 SPP     =     RAMBASE+DATSTK
                           0017FF   121 RPP     =     RAMBASE+STACK
                           001700   122 TIBB    =     RAMBASE+TIBBASE
                           000080   123 CTOP    =     RAMBASE+0x80
                                    124 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                                    125         .macro _ledon
                                    126         bset PC_ODR,#LED2_BIT
                                    127         .endm
                                    128 
                                    129         .macro _ledoff
                                    130         bres PC_ODR,#LED2_BIT
                                    131         .endm
                                    132 
                                    133 ;**********************************************************
                                    134         .area DATA (ABS)
      000000                        135         .org RAMBASE 
                                    136 ;**********************************************************
                                    137 
                                    138 ;**********************************************************
                                    139         .area SSEG (ABS) ; STACK
      001700                        140         .org 0x1700
      001700                        141         .ds 256 
                                    142 ; space for DATSTK,TIB and STACK         
                                    143 ;**********************************************************
                                    144 
                                    145 ;**********************************************************
                                    146         .area HOME ; vectors table
                                    147 ;**********************************************************
      008000 82 00 80 85            148 	int main	        ; reset
      008004 82 00 80 80            149 	int NonHandledInterrupt	; trap
      008008 82 00 80 80            150 	int NonHandledInterrupt	; irq0
      00800C 82 00 80 80            151 	int NonHandledInterrupt	; irq1
      008010 82 00 80 80            152 	int NonHandledInterrupt	; irq2
      008014 82 00 80 80            153 	int NonHandledInterrupt	; irq3
      008018 82 00 80 80            154 	int NonHandledInterrupt	; irq4
      00801C 82 00 80 80            155 	int NonHandledInterrupt	; irq5
      008020 82 00 80 80            156 	int NonHandledInterrupt	; irq6
      008024 82 00 80 80            157 	int NonHandledInterrupt	; irq7
      008028 82 00 80 80            158 	int NonHandledInterrupt	; irq8
      00802C 82 00 80 80            159 	int NonHandledInterrupt	; irq9
      008030 82 00 80 80            160 	int NonHandledInterrupt	; irq10
      008034 82 00 80 80            161 	int NonHandledInterrupt	; irq11
      008038 82 00 80 80            162 	int NonHandledInterrupt	; irq12
      00803C 82 00 80 80            163 	int NonHandledInterrupt	; irq13
      008040 82 00 80 80            164 	int NonHandledInterrupt	; irq14
      008044 82 00 80 80            165 	int NonHandledInterrupt	; irq15
      008048 82 00 80 80            166 	int NonHandledInterrupt	; irq16
      00804C 82 00 80 80            167 	int NonHandledInterrupt	; irq17
      008050 82 00 80 80            168 	int NonHandledInterrupt	; irq18
      008054 82 00 80 80            169 	int NonHandledInterrupt	; irq19
      008058 82 00 80 80            170 	int NonHandledInterrupt	; irq20
      00805C 82 00 80 80            171 	int NonHandledInterrupt	; irq21
      008060 82 00 80 80            172 	int NonHandledInterrupt	; irq22
      008064 82 00 80 80            173 	int NonHandledInterrupt	; irq23
      008068 82 00 80 80            174 	int NonHandledInterrupt	; irq24
      00806C 82 00 80 80            175 	int NonHandledInterrupt	; irq25
      008070 82 00 80 80            176 	int NonHandledInterrupt	; irq26
      008074 82 00 80 80            177 	int NonHandledInterrupt	; irq27
      008078 82 00 80 80            178 	int NonHandledInterrupt	; irq28
      00807C 82 00 80 80            179 	int NonHandledInterrupt	; irq29
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    180 
                                    181 ;**********************************************************
                                    182         .area CODE
                                    183 ;**********************************************************
                                    184 
                                    185 ; non handled interrupt reset MCU
      008080                        186 NonHandledInterrupt:
      008080 A6 80            [ 1]  187         ld a, #0x80
      008082 C7 50 D1         [ 1]  188         ld WWDG_CR,a ; WWDG_CR used to reset mcu
                                    189 	;iret
                                    190 
                                    191 
                                    192 ;; Main entry points and COLD start data
      008085                        193 main:
                                    194 ; clear all RAM
      008085 AE 00 00         [ 2]  195 	ldw X,#RAMBASE
      008088                        196 clear_ram0:
      008088 7F               [ 1]  197 	clr (X)
      008089 5C               [ 1]  198 	incw X
      00808A A3 17 FF         [ 2]  199 	cpw X,#RAM_END
      00808D 23 F9            [ 2]  200 	jrule clear_ram0
      00808F AE 17 FF         [ 2]  201         ldw x,#RPP
      008092 94               [ 1]  202         ldw sp,x 
      008093 CC 80 AC         [ 2]  203 	jp ORIG
                                    204 
                                    205 ; COLD initialize these variables.
      008096                        206 UZERO:
      008096 00 0A                  207         .word      BASEE   ;BASE
      008098 00 00                  208         .word      0       ;tmp
      00809A 00 00                  209         .word      0       ;>IN
      00809C 00 00                  210         .word      0       ;#TIB
      00809E 17 00                  211         .word      TIBB    ;TIB
      0080A0 8F 94                  212         .word      INTER   ;'EVAL
      0080A2 00 00                  213         .word      0       ;HLD
      0080A4 95 65                  214         .word       LASTN   ;CONTEXT pointer
      0080A6 00 80                  215         .word       CTOP   ;CP in RAM
      0080A8 95 65                  216         .word      LASTN   ;LAST
      0080AA 00 00                  217 ULAST:  .word      0
                                    218 
      0080AC                        219 ORIG:   
                                    220 ; initialize SP
      0080AC AE 17 FF         [ 2]  221         LDW     X,#STACK  ;initialize return stack
      0080AF 94               [ 1]  222         LDW     SP,X
      0080B0 BF 24            [ 2]  223         LDW     RP0,X
      0080B2 AE 16 F0         [ 2]  224         LDW     X,#DATSTK ;initialize data stack
      0080B5 BF 22            [ 2]  225         LDW     SP0,X
                                    226 ; initialize PC_5 as output to control LED2
      0080B7 72 1A 50 0D      [ 1]  227         bset PC_CR1,#LED2_BIT
      0080BB 72 1A 50 0E      [ 1]  228         bset PC_CR2,#LED2_BIT
      0080BF 72 1A 50 0C      [ 1]  229         bset PC_DDR,#LED2_BIT
      000043                        230         _ledoff
      0080C3 72 1B 50 0A      [ 1]    1         bres PC_ODR,#LED2_BIT
                                    231 ; initialize clock to HSE
                                    232 ; switch to external 8 Mhz crystal 
      0080C7                        233 clock_init:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      0080C7 72 12 50 C5      [ 1]  234 	bset CLK_SWCR,#CLK_SWCR_SWEN
      0080CB A6 B4            [ 1]  235 	ld a,#CLK_SWR_HSE
      0080CD C7 50 C4         [ 1]  236 	ld CLK_SWR,a
      0080D0 C1 50 C3         [ 1]  237 1$:	cp a,CLK_CMSR
      0080D3 26 FB            [ 1]  238 	jrne 1$
                                    239 ; initialize UART1, 115200 8N1
      0080D5                        240 uart1_init:
      0080D5 72 14 50 C7      [ 1]  241 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1
                                    242 	; configure tx pin
      0080D9 72 1A 50 02      [ 1]  243 	bset PA_DDR,#UART1_TX_PIN ; tx pin
      0080DD 72 1A 50 03      [ 1]  244 	bset PA_CR1,#UART1_TX_PIN ; push-pull output
      0080E1 72 1A 50 04      [ 1]  245 	bset PA_CR2,#UART1_TX_PIN ; fast output
                                    246 	; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
      0080E5 35 05 52 33      [ 1]  247 	mov UART1_BRR2,#0x05 ; must be loaded first
      0080E9 35 04 52 32      [ 1]  248 	mov UART1_BRR1,#0x4
      0080ED 35 0C 52 35      [ 1]  249 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
      0080F1 CC 95 6A         [ 2]  250         jp  COLD   ;default=MN1
                                    251 
                                    252 ;; Device dependent I/O
                                    253 ;       All channeled to DOS 21H services
                                    254 
                                    255 ;       ?RX     ( -- c T | F )
                                    256 ;         Return input byte and true, or false.
      0080F4 00 00                  257         .word      0
                           000076   258 LINK	= .
      0080F6 04                     259         .byte      4
      0080F7 3F 4B 45 59            260         .ascii     "?KEY"
      0080FB                        261 QKEY:
      0080FB 90 5F            [ 1]  262         CLRW Y 
      0080FD 72 0B 52 30 0B   [ 2]  263         BTJF UART1_SR,#UART_SR_RXNE,INCH   ;check status
      008102 C6 52 31         [ 1]  264         LD    A,UART1_DR   ;get char in A
      008105 1D 00 02         [ 2]  265 	SUBW	X,#2
      008108 E7 01            [ 1]  266         LD     (1,X),A
      00810A 7F               [ 1]  267 	CLR	(X)
      00810B 90 53            [ 2]  268         CPLW     Y
      00810D                        269 INCH:
      00810D 1D 00 02         [ 2]  270 	SUBW	X,#2
      008110 FF               [ 2]  271         LDW     (X),Y
      008111 81               [ 4]  272         RET
                                    273 
                                    274 ;       TX!     ( c -- )
                                    275 ;       Send character c to  output device.
      008112 80 F6                  276         .word      LINK
                           000094   277 LINK	= .
      008114 04                     278         .byte      4
      008115 45 4D 49 54            279         .ascii     "EMIT"
      008119                        280 EMIT:
      008119 E6 01            [ 1]  281         LD     A,(1,X)
      00811B 1C 00 02         [ 2]  282 	ADDW	X,#2
      00811E 72 0F 52 30 FB   [ 2]  283 OUTPUT: BTJF UART1_SR,#UART_SR_TXE,OUTPUT  ;loop until tdre
      008123 C7 52 31         [ 1]  284         LD    UART1_DR,A   ;send A
      008126 81               [ 4]  285         RET
                                    286 
                                    287 ;; The kernel
                                    288 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    289 ;       doLIT   ( -- w )
                                    290 ;       Push an inline literal.
      008127 81 14                  291         .word      LINK
                           0000A9   292 LINK	= 	.
      008129 45                     293 	.byte      COMPO+5
      00812A 64 6F 4C 69 74         294         .ascii     "doLit"
      00812F                        295 DOLIT:
      00812F 1D 00 02         [ 2]  296 	SUBW X,#2
      008132 90 85            [ 2]  297         POPW Y
      008134 90 BF 1C         [ 2]  298 	LDW YTEMP,Y
      008137 90 FE            [ 2]  299 	LDW Y,(Y)
      008139 FF               [ 2]  300         LDW (X),Y
      00813A 90 BE 1C         [ 2]  301         LDW Y,YTEMP
      00813D 90 EC 02         [ 2]  302 	JP (2,Y)
                                    303 
                                    304 ;       next    ( -- )
                                    305 ;       Code for  single index loop.
      008140 81 29                  306         .word      LINK
                           0000C2   307 LINK	= 	.
      008142 44                     308 	.byte      COMPO+4
      008143 6E 65 78 74            309         .ascii     "next"
      008147                        310 DONXT:
      008147 16 03            [ 2]  311 	LDW Y,(3,SP)
      008149 90 5A            [ 2]  312 	DECW Y
      00814B 2A 07            [ 1]  313 	JRPL NEX1
      00814D 90 85            [ 2]  314 	POPW Y
      00814F 84               [ 1]  315 	POP A
      008150 84               [ 1]  316 	POP A
      008151 90 EC 02         [ 2]  317     JP (2,Y)
      008154                        318 NEX1:
      008154 17 03            [ 2]  319     LDW (3,SP),Y
      008156 90 85            [ 2]  320     POPW Y
      008158 90 FE            [ 2]  321 	LDW Y,(Y)
      00815A 90 FC            [ 2]  322 	JP (Y)
                                    323 
                                    324 ;       ?branch ( f -- )
                                    325 ;       Branch if flag is zero.
      00815C 81 42                  326         .word      LINK
                           0000DE   327 LINK	= 	.
      00815E 47                     328 	.byte      COMPO+7
      00815F 3F 62 72 61 6E 63 68   329         .ascii     "?branch"
      008166                        330 QBRAN:	
      008166 90 93            [ 1]  331         LDW Y,X
      008168 1C 00 02         [ 2]  332 	ADDW X,#2
      00816B 90 FE            [ 2]  333 	LDW Y,(Y)
      00816D 27 0E            [ 1]  334         JREQ     BRAN
      00816F 90 85            [ 2]  335 	POPW Y
      008171 90 EC 02         [ 2]  336 	JP (2,Y)
                                    337         
                                    338 ;       branch  ( -- )
                                    339 ;       Branch to an inline address.
      008174 81 5E                  340         .word      LINK
                           0000F6   341 LINK	= 	.
      008176 46                     342 	.byte      COMPO+6
      008177 62 72 61 6E 63 68      343         .ascii     "branch"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      00817D                        344 BRAN:
      00817D 90 85            [ 2]  345         POPW Y
      00817F 90 FE            [ 2]  346 	LDW Y,(Y)
      008181 90 FC            [ 2]  347         JP     (Y)
                                    348 
                                    349 ;       EXECUTE ( ca -- )
                                    350 ;       Execute  word at ca.
      008183 81 76                  351         .word      LINK
                           000105   352 LINK	= 	.
      008185 07                     353         .byte       7
      008186 45 58 45 43 55 54 45   354         .ascii     "EXECUTE"
      00818D                        355 EXECU:
      00818D 90 93            [ 1]  356         LDW Y,X
      00818F 1C 00 02         [ 2]  357 	ADDW X,#2
      008192 90 FE            [ 2]  358 	LDW     Y,(Y)
      008194 90 FC            [ 2]  359         JP     (Y)
                                    360 
                                    361 ;       EXIT    ( -- )
                                    362 ;       Terminate a colon definition.
      008196 81 85                  363         .word      LINK
                           000118   364 LINK = .
      008198 04                     365         .byte      4
      008199 45 58 49 54            366         .ascii     "EXIT"
      00819D                        367 EXIT:
      00819D 90 85            [ 2]  368         POPW Y
      00819F 81               [ 4]  369         RET
                                    370 
                                    371 ;       !       ( w a -- )
                                    372 ;       Pop  data stack to memory.
      0081A0 81 98                  373         .word      LINK
                           000122   374 LINK = .
      0081A2 01                     375         .byte      1
      0081A3 21                     376         .ascii     "!"
      0081A4                        377 STORE:
      0081A4 90 93            [ 1]  378         LDW Y,X
      0081A6 90 FE            [ 2]  379         LDW Y,(Y)    ;Y=a
      0081A8 90 BF 1C         [ 2]  380         LDW YTEMP,Y
      0081AB 90 93            [ 1]  381         LDW Y,X
      0081AD 90 EE 02         [ 2]  382         LDW Y,(2,Y)
      0081B0 91 CF 1C         [ 5]  383         LDW [YTEMP],Y
      0081B3 1C 00 04         [ 2]  384         ADDW X,#4 ;store w at a
      0081B6 81               [ 4]  385         RET     
                                    386 
                                    387 ;       @       ( a -- w )
                                    388 ;       Push memory location to stack.
      0081B7 81 A2                  389         .word      LINK
                           000139   390 LINK	= 	.
      0081B9 01                     391         .byte    1
      0081BA 40                     392         .ascii	"@"
      0081BB                        393 AT:
      0081BB 90 93            [ 1]  394         LDW Y,X     ;Y = a
      0081BD 90 FE            [ 2]  395         LDW Y,(Y)
      0081BF 90 FE            [ 2]  396         LDW Y,(Y)
      0081C1 FF               [ 2]  397         LDW (X),Y ;w = @Y
      0081C2 81               [ 4]  398         RET     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



                                    399 
                                    400 ;       C!      ( c b -- )
                                    401 ;       Pop  data stack to byte memory.
      0081C3 81 B9                  402         .word      LINK
                           000145   403 LINK	= .
      0081C5 02                     404         .byte      2
      0081C6 43 21                  405         .ascii     "C!"
      0081C8                        406 CSTOR:
      0081C8 90 93            [ 1]  407         LDW Y,X
      0081CA 90 FE            [ 2]  408 	LDW Y,(Y)    ;Y=b
      0081CC E6 03            [ 1]  409         LD A,(3,X)    ;D = c
      0081CE 90 F7            [ 1]  410         LD  (Y),A     ;store c at b
      0081D0 1C 00 04         [ 2]  411 	ADDW X,#4
      0081D3 81               [ 4]  412         RET     
                                    413 
                                    414 ;       C@      ( b -- c )
                                    415 ;       Push byte in memory to  stack.
      0081D4 81 C5                  416         .word      LINK
                           000156   417 LINK	= 	.
      0081D6 02                     418         .byte      2
      0081D7 43 40                  419         .ascii     "C@"
      0081D9                        420 CAT:
      0081D9 90 93            [ 1]  421         LDW Y,X     ;Y=b
      0081DB 90 FE            [ 2]  422         LDW Y,(Y)
      0081DD 90 F6            [ 1]  423         LD A,(Y)
      0081DF E7 01            [ 1]  424         LD (1,X),A
      0081E1 7F               [ 1]  425         CLR (X)
      0081E2 81               [ 4]  426         RET     
                                    427 
                                    428 ;       RP@     ( -- a )
                                    429 ;       Push current RP to data stack.
      0081E3 81 D6                  430         .word      LINK
                           000165   431 LINK	= .
      0081E5 03                     432         .byte      3
      0081E6 72 70 40               433         .ascii     "rp@"
      0081E9                        434 RPAT:
      0081E9 90 96            [ 1]  435         LDW Y,SP    ;save return addr
      0081EB 1D 00 02         [ 2]  436         SUBW X,#2
      0081EE FF               [ 2]  437         LDW (X),Y
      0081EF 81               [ 4]  438         RET     
                                    439 
                                    440 ;       RP!     ( a -- )
                                    441 ;       Set  return stack pointer.
      0081F0 81 E5                  442         .word      LINK
                           000172   443 LINK	= 	. 
      0081F2 43                     444 	.byte      COMPO+3
      0081F3 72 70 21               445         .ascii     "rp!"
      0081F6                        446 RPSTO:
      0081F6 90 85            [ 2]  447         POPW Y
      0081F8 90 BF 1C         [ 2]  448         LDW YTEMP,Y
      0081FB 90 93            [ 1]  449         LDW Y,X
      0081FD 90 FE            [ 2]  450         LDW Y,(Y)
      0081FF 90 94            [ 1]  451         LDW SP,Y
      008201 92 CC 1C         [ 5]  452         JP [YTEMP]
                                    453 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    454 ;       R>      ( -- w )
                                    455 ;       Pop return stack to data stack.
      008204 81 F2                  456         .word      LINK
                           000186   457 LINK	= 	. 
      008206 42                     458 	.byte      COMPO+2
      008207 52 3E                  459         .ascii     "R>"
      008209                        460 RFROM:
      008209 90 85            [ 2]  461         POPW Y    ;save return addr
      00820B 90 BF 1C         [ 2]  462         LDW YTEMP,Y
      00820E 90 85            [ 2]  463         POPW Y
      008210 1D 00 02         [ 2]  464         SUBW X,#2
      008213 FF               [ 2]  465         LDW (X),Y
      008214 92 CC 1C         [ 5]  466         JP [YTEMP]
                                    467 
                                    468 ;       R@      ( -- w )
                                    469 ;       Copy top of return stack to stack.
      008217 82 06                  470         .word      LINK
                           000199   471 LINK	= 	. 
      008219 02                     472         .byte      2
      00821A 52 40                  473         .ascii     "R@"
      00821C                        474 RAT:
      00821C 90 85            [ 2]  475         POPW Y
      00821E 90 BF 1C         [ 2]  476         LDW YTEMP,Y
      008221 90 85            [ 2]  477         POPW Y
      008223 90 89            [ 2]  478         PUSHW Y
      008225 1D 00 02         [ 2]  479         SUBW X,#2
      008228 FF               [ 2]  480         LDW (X),Y
      008229 92 CC 1C         [ 5]  481         JP [YTEMP]
                                    482 
                                    483 ;       >R      ( w -- )
                                    484 ;       Push data stack to return stack.
      00822C 82 19                  485         .word      LINK
                           0001AE   486 LINK	= 	. 
      00822E 42                     487 	.byte      COMPO+2
      00822F 3E 52                  488         .ascii     ">R"
      008231                        489 TOR:
      008231 90 85            [ 2]  490         POPW Y    ;save return addr
      008233 90 BF 1C         [ 2]  491         LDW YTEMP,Y
      008236 90 93            [ 1]  492         LDW Y,X
      008238 90 FE            [ 2]  493         LDW Y,(Y)
      00823A 90 89            [ 2]  494         PUSHW Y    ;restore return addr
      00823C 1C 00 02         [ 2]  495         ADDW X,#2
      00823F 92 CC 1C         [ 5]  496         JP [YTEMP]
                                    497 
                                    498 ;       SP@     ( -- a )
                                    499 ;       Push current stack pointer.
      008242 82 2E                  500         .word      LINK
                           0001C4   501 LINK	= 	. 
      008244 03                     502         .byte      3
      008245 73 70 40               503         .ascii     "sp@"
      008248                        504 SPAT:
      008248 90 93            [ 1]  505 	LDW Y,X
      00824A 1D 00 02         [ 2]  506         SUBW X,#2
      00824D FF               [ 2]  507 	LDW (X),Y
      00824E 81               [ 4]  508         RET     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    509 
                                    510 ;       SP!     ( a -- )
                                    511 ;       Set  data stack pointer.
      00824F 82 44                  512         .word      LINK
                           0001D1   513 LINK	= 	. 
      008251 03                     514         .byte      3
      008252 73 70 21               515         .ascii     "sp!"
      008255                        516 SPSTO:
      008255 FE               [ 2]  517         LDW     X,(X)     ;X = a
      008256 81               [ 4]  518         RET     
                                    519 
                                    520 ;       DROP    ( w -- )
                                    521 ;       Discard top stack item.
      008257 82 51                  522         .word      LINK
                           0001D9   523 LINK	= 	. 
      008259 04                     524         .byte      4
      00825A 44 52 4F 50            525         .ascii     "DROP"
      00825E                        526 DROP:
      00825E 1C 00 02         [ 2]  527         ADDW X,#2     
      008261 81               [ 4]  528         RET     
                                    529 
                                    530 ;       DUP     ( w -- w w )
                                    531 ;       Duplicate  top stack item.
      008262 82 59                  532         .word      LINK
                           0001E4   533 LINK	= 	. 
      008264 03                     534         .byte      3
      008265 44 55 50               535         .ascii     "DUP"
      008268                        536 DUPP:
      008268 90 93            [ 1]  537 				LDW Y,X
      00826A 1D 00 02         [ 2]  538         SUBW X,#2
      00826D 90 FE            [ 2]  539 				LDW Y,(Y)
      00826F FF               [ 2]  540 				LDW (X),Y
      008270 81               [ 4]  541         RET     
                                    542 
                                    543 ;       SWAP    ( w1 w2 -- w2 w1 )
                                    544 ;       Exchange top two stack items.
      008271 82 64                  545         .word      LINK
                           0001F3   546 LINK	= 	. 
      008273 04                     547         .byte      4
      008274 53 57 41 50            548         .ascii     "SWAP"
      008278                        549 SWAPP:
      008278 90 93            [ 1]  550         LDW Y,X
      00827A 90 FE            [ 2]  551         LDW Y,(Y)
      00827C 90 BF 1C         [ 2]  552         LDW YTEMP,Y
      00827F 90 93            [ 1]  553         LDW Y,X
      008281 90 EE 02         [ 2]  554         LDW Y,(2,Y)
      008284 FF               [ 2]  555         LDW (X),Y
      008285 90 BE 1C         [ 2]  556         LDW Y,YTEMP
      008288 EF 02            [ 2]  557         LDW (2,X),Y
      00828A 81               [ 4]  558         RET     
                                    559 
                                    560 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                    561 ;       Copy second stack item to top.
      00828B 82 73                  562         .word      LINK
                           00020D   563 LINK	= . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      00828D 04                     564         .byte      4
      00828E 4F 56 45 52            565         .ascii     "OVER"
      008292                        566 OVER:
      008292 1D 00 02         [ 2]  567         SUBW X,#2
      008295 90 93            [ 1]  568         LDW Y,X
      008297 90 EE 04         [ 2]  569         LDW Y,(4,Y)
      00829A FF               [ 2]  570         LDW (X),Y
      00829B 81               [ 4]  571         RET     
                                    572 
                                    573 ;       0<      ( n -- t )
                                    574 ;       Return true if n is negative.
      00829C 82 8D                  575         .word      LINK
                           00021E   576 LINK	= . 
      00829E 02                     577         .byte      2
      00829F 30 3C                  578         .ascii     "0<"
      0082A1                        579 ZLESS:
      0082A1 A6 FF            [ 1]  580         LD A,#0xFF
      0082A3 90 93            [ 1]  581         LDW Y,X
      0082A5 90 FE            [ 2]  582         LDW Y,(Y)
      0082A7 2B 01            [ 1]  583         JRMI     ZL1
      0082A9 4F               [ 1]  584         CLR A   ;false
      0082AA F7               [ 1]  585 ZL1:    LD     (X),A
      0082AB E7 01            [ 1]  586         LD (1,X),A
      0082AD 81               [ 4]  587 	RET     
                                    588 
                                    589 ;       AND     ( w w -- w )
                                    590 ;       Bitwise AND.
      0082AE 82 9E                  591         .word      LINK
                           000230   592 LINK	= . 
      0082B0 03                     593         .byte      3
      0082B1 41 4E 44               594         .ascii     "AND"
      0082B4                        595 ANDD:
      0082B4 F6               [ 1]  596         LD  A,(X)    ;D=w
      0082B5 E4 02            [ 1]  597         AND A,(2,X)
      0082B7 E7 02            [ 1]  598         LD (2,X),A
      0082B9 E6 01            [ 1]  599         LD A,(1,X)
      0082BB E4 03            [ 1]  600         AND A,(3,X)
      0082BD E7 03            [ 1]  601         LD (3,X),A
      0082BF 1C 00 02         [ 2]  602         ADDW X,#2
      0082C2 81               [ 4]  603         RET
                                    604 
                                    605 ;       OR      ( w w -- w )
                                    606 ;       Bitwise inclusive OR.
      0082C3 82 B0                  607         .word      LINK
                           000245   608 LINK = . 
      0082C5 02                     609         .byte      2
      0082C6 4F 52                  610         .ascii     "OR"
      0082C8                        611 ORR:
      0082C8 F6               [ 1]  612         LD A,(X)    ;D=w
      0082C9 EA 02            [ 1]  613         OR A,(2,X)
      0082CB E7 02            [ 1]  614         LD (2,X),A
      0082CD E6 01            [ 1]  615         LD A,(1,X)
      0082CF EA 03            [ 1]  616         OR A,(3,X)
      0082D1 E7 03            [ 1]  617         LD (3,X),A
      0082D3 1C 00 02         [ 2]  618         ADDW X,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      0082D6 81               [ 4]  619         RET
                                    620 
                                    621 ;       XOR     ( w w -- w )
                                    622 ;       Bitwise exclusive OR.
      0082D7 82 C5                  623         .word      LINK
                           000259   624 LINK	= . 
      0082D9 03                     625         .byte      3
      0082DA 58 4F 52               626         .ascii     "XOR"
      0082DD                        627 XORR:
      0082DD F6               [ 1]  628         LD A,(X)    ;D=w
      0082DE E8 02            [ 1]  629         XOR A,(2,X)
      0082E0 E7 02            [ 1]  630         LD (2,X),A
      0082E2 E6 01            [ 1]  631         LD A,(1,X)
      0082E4 E8 03            [ 1]  632         XOR A,(3,X)
      0082E6 E7 03            [ 1]  633         LD (3,X),A
      0082E8 1C 00 02         [ 2]  634         ADDW X,#2
      0082EB 81               [ 4]  635         RET
                                    636 
                                    637 ;       UM+     ( u u -- udsum )
                                    638 ;       Add two unsigned single
                                    639 ;       and return a double sum.
      0082EC 82 D9                  640         .word      LINK
                           00026E   641 LINK	= . 
      0082EE 03                     642         .byte      3
      0082EF 55 4D 2B               643         .ascii     "UM+"
      0082F2                        644 UPLUS:
      0082F2 A6 01            [ 1]  645         LD A,#1
      0082F4 90 93            [ 1]  646         LDW Y,X
      0082F6 90 EE 02         [ 2]  647         LDW Y,(2,Y)
      0082F9 90 BF 1C         [ 2]  648         LDW YTEMP,Y
      0082FC 90 93            [ 1]  649         LDW Y,X
      0082FE 90 FE            [ 2]  650         LDW Y,(Y)
      008300 72 B9 00 1C      [ 2]  651         ADDW Y,YTEMP
      008304 EF 02            [ 2]  652         LDW (2,X),Y
      008306 25 01            [ 1]  653         JRC     UPL1
      008308 4F               [ 1]  654         CLR A
      008309 E7 01            [ 1]  655 UPL1:   LD     (1,X),A
      00830B 7F               [ 1]  656         CLR (X)
      00830C 81               [ 4]  657         RET
                                    658 
                                    659 ;; System and user variables
                                    660 
                                    661 ;       doVAR   ( -- a )
                                    662 ;       Code for VARIABLE and CREATE.
      00830D 82 EE                  663         .word      LINK
                           00028F   664 LINK	= . 
      00830F 45                     665 	.byte      COMPO+5
      008310 64 6F 56 61 72         666         .ascii     "doVar"
      008315                        667 DOVAR:
      008315 1D 00 02         [ 2]  668 	SUBW X,#2
      008318 90 85            [ 2]  669         POPW Y    ;get return addr (pfa)
      00831A FF               [ 2]  670         LDW (X),Y    ;push on stack
      00831B 81               [ 4]  671         RET     ;go to RET of EXEC
                                    672 
                                    673 ;       BASE    ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                                    674 ;       Radix base for numeric I/O.
      00831C 83 0F                  675         .word      LINK        
                           00029E   676 LINK = . 
      00831E 04                     677         .byte      4
      00831F 42 41 53 45            678         .ascii     "BASE"
      008323                        679 BASE:
      008323 90 AE 00 06      [ 2]  680 	LDW Y,#RAMBASE+6
      008327 1D 00 02         [ 2]  681 	SUBW X,#2
      00832A FF               [ 2]  682         LDW (X),Y
      00832B 81               [ 4]  683         RET
                                    684 
                                    685 ;       tmp     ( -- a )
                                    686 ;       A temporary storage.
      00832C 83 1E                  687         .word      LINK
                                    688         
                           0002AE   689 LINK = . 
      00832E 03                     690 	.byte      3
      00832F 74 6D 70               691         .ascii     "tmp"
      008332                        692 TEMP:
      008332 90 AE 00 08      [ 2]  693 	LDW Y,#RAMBASE+8
      008336 1D 00 02         [ 2]  694 	SUBW X,#2
      008339 FF               [ 2]  695         LDW (X),Y
      00833A 81               [ 4]  696         RET
                                    697 
                                    698 ;       >IN     ( -- a )
                                    699 ;        Hold parsing pointer.
      00833B 83 2E                  700         .word      LINK
                           0002BD   701 LINK = . 
      00833D 03                     702         .byte      3
      00833E 3E 49 4E               703         .ascii    ">IN"
      008341                        704 INN:
      008341 90 AE 00 0A      [ 2]  705 	LDW Y,#RAMBASE+10
      008345 1D 00 02         [ 2]  706 	SUBW X,#2
      008348 FF               [ 2]  707         LDW (X),Y
      008349 81               [ 4]  708         RET
                                    709 
                                    710 ;       #TIB    ( -- a )
                                    711 ;       Count in terminal input buffer.
      00834A 83 3D                  712         .word      LINK
                           0002CC   713 LINK = . 
      00834C 04                     714         .byte      4
      00834D 23 54 49 42            715         .ascii     "#TIB"
      008351                        716 NTIB:
      008351 90 AE 00 0C      [ 2]  717 	LDW Y,#RAMBASE+12
      008355 1D 00 02         [ 2]  718 	SUBW X,#2
      008358 FF               [ 2]  719         LDW (X),Y
      008359 81               [ 4]  720         RET
                                    721 
                                    722 ;       "EVAL   ( -- a )
                                    723 ;       Execution vector of EVAL.
      00835A 83 4C                  724         .word      LINK
                           0002DC   725 LINK = . 
      00835C 05                     726         .byte      5
      00835D 27 65 76 61 6C         727         .ascii     "'eval"
      008362                        728 TEVAL:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      008362 90 AE 00 10      [ 2]  729 	LDW Y,#RAMBASE+16
      008366 1D 00 02         [ 2]  730 	SUBW X,#2
      008369 FF               [ 2]  731         LDW (X),Y
      00836A 81               [ 4]  732         RET
                                    733 
                                    734 ;       HLD     ( -- a )
                                    735 ;       Hold a pointer of output string.
      00836B 83 5C                  736         .word      LINK
                           0002ED   737 LINK = . 
      00836D 03                     738         .byte      3
      00836E 68 6C 64               739         .ascii     "hld"
      008371                        740 HLD:
      008371 90 AE 00 12      [ 2]  741 	LDW Y,#RAMBASE+18
      008375 1D 00 02         [ 2]  742 	SUBW X,#2
      008378 FF               [ 2]  743         LDW (X),Y
      008379 81               [ 4]  744         RET
                                    745 
                                    746 ;       CONTEXT ( -- a )
                                    747 ;       Start vocabulary search.
      00837A 83 6D                  748         .word      LINK
                           0002FC   749 LINK = . 
      00837C 07                     750         .byte      7
      00837D 43 4F 4E 54 45 58 54   751         .ascii     "CONTEXT"
      008384                        752 CNTXT:
      008384 90 AE 00 14      [ 2]  753 	LDW Y,#RAMBASE+20
      008388 1D 00 02         [ 2]  754 	SUBW X,#2
      00838B FF               [ 2]  755         LDW (X),Y
      00838C 81               [ 4]  756         RET
                                    757 
                                    758 ;       CP      ( -- a )
                                    759 ;       Point to top of dictionary.
      00838D 83 7C                  760         .word      LINK
                           00030F   761 LINK = . 
      00838F 02                     762         .byte      2
      008390 63 70                  763         .ascii     "cp"
      008392                        764 CPP:
      008392 90 AE 00 16      [ 2]  765 	LDW Y,#RAMBASE+22
      008396 1D 00 02         [ 2]  766 	SUBW X,#2
      008399 FF               [ 2]  767         LDW (X),Y
      00839A 81               [ 4]  768         RET
                                    769 
                                    770 ;       LAST    ( -- a )
                                    771 ;       Point to last name in dictionary.
      00839B 83 8F                  772         .word      LINK
                           00031D   773 LINK = . 
      00839D 04                     774         .byte      4
      00839E 6C 61 73 74            775         .ascii     "last"
      0083A2                        776 LAST:
      0083A2 90 AE 00 18      [ 2]  777 	LDW Y,#RAMBASE+24
      0083A6 1D 00 02         [ 2]  778 	SUBW X,#2
      0083A9 FF               [ 2]  779         LDW (X),Y
      0083AA 81               [ 4]  780         RET
                                    781 
                                    782 ;; Common functions
                                    783 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    784 ;       ?DUP    ( w -- w w | 0 )
                                    785 ;       Dup tos if its is not zero.
      0083AB 83 9D                  786         .word      LINK
                           00032D   787 LINK = . 
      0083AD 04                     788         .byte      4
      0083AE 3F 44 55 50            789         .ascii     "?DUP"
      0083B2                        790 QDUP:
      0083B2 90 93            [ 1]  791         LDW Y,X
      0083B4 90 FE            [ 2]  792 	LDW Y,(Y)
      0083B6 27 04            [ 1]  793         JREQ     QDUP1
      0083B8 1D 00 02         [ 2]  794 	SUBW X,#2
      0083BB FF               [ 2]  795         LDW (X),Y
      0083BC 81               [ 4]  796 QDUP1:  RET
                                    797 
                                    798 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                    799 ;       Rot 3rd item to top.
      0083BD 83 AD                  800         .word      LINK
                           00033F   801 LINK = . 
      0083BF 03                     802         .byte      3
      0083C0 52 4F 54               803         .ascii     "ROT"
      0083C3                        804 ROT:
      0083C3 90 93            [ 1]  805         LDW Y,X
      0083C5 90 EE 04         [ 2]  806 	LDW Y,(4,Y)
      0083C8 90 BF 1C         [ 2]  807 	LDW YTEMP,Y
      0083CB 90 93            [ 1]  808         LDW Y,X
      0083CD 90 EE 02         [ 2]  809         LDW Y,(2,Y)
      0083D0 90 BF 1A         [ 2]  810         LDW XTEMP,Y
      0083D3 90 93            [ 1]  811         LDW Y,X
      0083D5 90 FE            [ 2]  812         LDW Y,(Y)
      0083D7 EF 02            [ 2]  813         LDW (2,X),Y
      0083D9 90 BE 1A         [ 2]  814         LDW Y,XTEMP
      0083DC EF 04            [ 2]  815         LDW (4,X),Y
      0083DE 90 BE 1C         [ 2]  816         LDW Y,YTEMP
      0083E1 FF               [ 2]  817         LDW (X),Y
      0083E2 81               [ 4]  818         RET
                                    819 
                                    820 ;       2DROP   ( w w -- )
                                    821 ;       Discard two items on stack.
      0083E3 83 BF                  822         .word      LINK
                           000365   823 LINK = . 
      0083E5 05                     824         .byte      5
      0083E6 32 44 52 4F 50         825         .ascii     "2DROP"
      0083EB                        826 DDROP:
      0083EB 1C 00 04         [ 2]  827         ADDW X,#4
      0083EE 81               [ 4]  828         RET
                                    829 
                                    830 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                    831 ;       Duplicate top two items.
      0083EF 83 E5                  832         .word      LINK
                           000371   833 LINK = . 
      0083F1 04                     834         .byte      4
      0083F2 32 44 55 50            835         .ascii     "2DUP"
      0083F6                        836 DDUP:
      0083F6 1D 00 04         [ 2]  837         SUBW X,#4
      0083F9 90 93            [ 1]  838         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      0083FB 90 EE 06         [ 2]  839         LDW Y,(6,Y)
      0083FE EF 02            [ 2]  840         LDW (2,X),Y
      008400 90 93            [ 1]  841         LDW Y,X
      008402 90 EE 04         [ 2]  842         LDW Y,(4,Y)
      008405 FF               [ 2]  843         LDW (X),Y
      008406 81               [ 4]  844         RET
                                    845 
                                    846 ;       +       ( w w -- sum )
                                    847 ;       Add top two items.
      008407 83 F1                  848         .word      LINK
                           000389   849 LINK = . 
      008409 01                     850         .byte      1
      00840A 2B                     851         .ascii     "+"
      00840B                        852 PLUS:
      00840B 90 93            [ 1]  853         LDW Y,X
      00840D 90 FE            [ 2]  854         LDW Y,(Y)
      00840F 90 BF 1C         [ 2]  855         LDW YTEMP,Y
      008412 1C 00 02         [ 2]  856         ADDW X,#2
      008415 90 93            [ 1]  857         LDW Y,X
      008417 90 FE            [ 2]  858         LDW Y,(Y)
      008419 72 B9 00 1C      [ 2]  859         ADDW Y,YTEMP
      00841D FF               [ 2]  860         LDW (X),Y
      00841E 81               [ 4]  861         RET
                                    862 
                                    863 ;       NOT     ( w -- w )
                                    864 ;       One's complement of tos.
      00841F 84 09                  865         .word      LINK
                           0003A1   866 LINK = . 
      008421 03                     867         .byte      3
      008422 4E 4F 54               868         .ascii     "NOT"
      008425                        869 INVER:
      008425 90 93            [ 1]  870         LDW Y,X
      008427 90 FE            [ 2]  871         LDW Y,(Y)
      008429 90 53            [ 2]  872         CPLW Y
      00842B FF               [ 2]  873         LDW (X),Y
      00842C 81               [ 4]  874         RET
                                    875 
                                    876 ;       NEGATE  ( n -- -n )
                                    877 ;       Two's complement of tos.
      00842D 84 21                  878         .word      LINK
                           0003AF   879 LINK = . 
      00842F 06                     880         .byte      6
      008430 4E 45 47 41 54 45      881         .ascii     "NEGATE"
      008436                        882 NEGAT:
      008436 90 93            [ 1]  883         LDW Y,X
      008438 90 FE            [ 2]  884         LDW Y,(Y)
      00843A 90 50            [ 2]  885         NEGW Y
      00843C FF               [ 2]  886         LDW (X),Y
      00843D 81               [ 4]  887         RET
                                    888 
                                    889 ;       DNEGATE ( d -- -d )
                                    890 ;       Two's complement of top double.
      00843E 84 2F                  891         .word      LINK
                           0003C0   892 LINK = . 
      008440 07                     893         .byte      7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      008441 44 4E 45 47 41 54 45   894         .ascii     "DNEGATE"
      008448                        895 DNEGA:
      008448 90 93            [ 1]  896         LDW Y,X
      00844A 90 FE            [ 2]  897 	LDW Y,(Y)
      00844C 90 53            [ 2]  898         CPLW Y     
      00844E 90 BF 1C         [ 2]  899 	LDW YTEMP,Y
      008451 90 93            [ 1]  900         LDW Y,X
      008453 90 EE 02         [ 2]  901         LDW Y,(2,Y)
      008456 90 53            [ 2]  902         CPLW Y
      008458 90 5C            [ 1]  903         INCW Y
      00845A EF 02            [ 2]  904         LDW (2,X),Y
      00845C 90 BE 1C         [ 2]  905         LDW Y,YTEMP
      00845F 24 02            [ 1]  906         JRNC DN1 
      008461 90 5C            [ 1]  907         INCW Y
      008463 FF               [ 2]  908 DN1:    LDW (X),Y
      008464 81               [ 4]  909         RET
                                    910 
                                    911 ;       -       ( n1 n2 -- n1-n2 )
                                    912 ;       Subtraction.
      008465 84 40                  913         .word      LINK
                           0003E7   914 LINK = . 
      008467 01                     915         .byte      1
      008468 2D                     916         .ascii     "-"
      008469                        917 SUBB:
      008469 90 93            [ 1]  918         LDW Y,X
      00846B 90 FE            [ 2]  919         LDW Y,(Y)
      00846D 90 BF 1C         [ 2]  920         LDW YTEMP,Y
      008470 1C 00 02         [ 2]  921         ADDW X,#2
      008473 90 93            [ 1]  922         LDW Y,X
      008475 90 FE            [ 2]  923         LDW Y,(Y)
      008477 72 B2 00 1C      [ 2]  924         SUBW Y,YTEMP
      00847B FF               [ 2]  925         LDW (X),Y
      00847C 81               [ 4]  926         RET
                                    927 
                                    928 ;       ABS     ( n -- n )
                                    929 ;       Return  absolute value of n.
      00847D 84 67                  930         .word      LINK
                           0003FF   931 LINK = . 
      00847F 03                     932         .byte      3
      008480 41 42 53               933         .ascii     "ABS"
      008483                        934 ABSS:
      008483 90 93            [ 1]  935         LDW Y,X
      008485 90 FE            [ 2]  936 	LDW Y,(Y)
      008487 2A 03            [ 1]  937         JRPL     AB1     ;negate:
      008489 90 50            [ 2]  938         NEGW     Y     ;else negate hi byte
      00848B FF               [ 2]  939         LDW (X),Y
      00848C 81               [ 4]  940 AB1:    RET
                                    941 
                                    942 ;       =       ( w w -- t )
                                    943 ;       Return true if top two are =al.
      00848D 84 7F                  944         .word      LINK
                           00040F   945 LINK = . 
      00848F 01                     946         .byte      1
      008490 3D                     947         .ascii     "="
      008491                        948 EQUAL:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      008491 A6 FF            [ 1]  949         LD A,#0xFF  ;true
      008493 90 93            [ 1]  950         LDW Y,X    ;D = n2
      008495 90 FE            [ 2]  951         LDW Y,(Y)
      008497 90 BF 1C         [ 2]  952         LDW YTEMP,Y
      00849A 1C 00 02         [ 2]  953         ADDW X,#2
      00849D 90 93            [ 1]  954         LDW Y,X
      00849F 90 FE            [ 2]  955         LDW Y,(Y)
      0084A1 90 B3 1C         [ 2]  956         CPW Y,YTEMP     ;if n2 <> n1
      0084A4 27 01            [ 1]  957         JREQ     EQ1
      0084A6 4F               [ 1]  958         CLR A
      0084A7 F7               [ 1]  959 EQ1:    LD (X),A
      0084A8 E7 01            [ 1]  960         LD (1,X),A
      0084AA 81               [ 4]  961 	RET     
                                    962 
                                    963 ;       U<      ( u u -- t )
                                    964 ;       Unsigned compare of top two items.
      0084AB 84 8F                  965         .word      LINK
                           00042D   966 LINK = . 
      0084AD 02                     967         .byte      2
      0084AE 55 3C                  968         .ascii     "U<"
      0084B0                        969 ULESS:
      0084B0 A6 FF            [ 1]  970         LD A,#0xFF  ;true
      0084B2 90 93            [ 1]  971         LDW Y,X    ;D = n2
      0084B4 90 FE            [ 2]  972         LDW Y,(Y)
      0084B6 90 BF 1C         [ 2]  973         LDW YTEMP,Y
      0084B9 1C 00 02         [ 2]  974         ADDW X,#2
      0084BC 90 93            [ 1]  975         LDW Y,X
      0084BE 90 FE            [ 2]  976         LDW Y,(Y)
      0084C0 90 B3 1C         [ 2]  977         CPW Y,YTEMP     ;if n2 <> n1
      0084C3 25 01            [ 1]  978         JRULT     ULES1
      0084C5 4F               [ 1]  979         CLR A
      0084C6 F7               [ 1]  980 ULES1:  LD (X),A
      0084C7 E7 01            [ 1]  981         LD (1,X),A
      0084C9 81               [ 4]  982 	RET     
                                    983 
                                    984 ;       <       ( n1 n2 -- t )
                                    985 ;       Signed compare of top two items.
      0084CA 84 AD                  986         .word      LINK
                           00044C   987 LINK = . 
      0084CC 01                     988         .byte      1
      0084CD 3C                     989         .ascii     "<"
      0084CE                        990 LESS:
      0084CE A6 FF            [ 1]  991         LD A,#0xFF  ;true
      0084D0 90 93            [ 1]  992         LDW Y,X    ;D = n2
      0084D2 90 FE            [ 2]  993         LDW Y,(Y)
      0084D4 90 BF 1C         [ 2]  994         LDW YTEMP,Y
      0084D7 1C 00 02         [ 2]  995         ADDW X,#2
      0084DA 90 93            [ 1]  996         LDW Y,X
      0084DC 90 FE            [ 2]  997         LDW Y,(Y)
      0084DE 90 B3 1C         [ 2]  998         CPW Y,YTEMP     ;if n2 <> n1
      0084E1 2F 01            [ 1]  999         JRSLT     LT1
      0084E3 4F               [ 1] 1000         CLR A
      0084E4 F7               [ 1] 1001 LT1:    LD (X),A
      0084E5 E7 01            [ 1] 1002         LD (1,X),A
      0084E7 81               [ 4] 1003 	RET     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                                   1004 
                                   1005 ;       MAX     ( n n -- n )
                                   1006 ;       Return greater of two top items.
      0084E8 84 CC                 1007         .word      LINK
                           00046A  1008 LINK = . 
      0084EA 03                    1009         .byte      3
      0084EB 4D 41 58              1010         .ascii     "MAX"
      0084EE                       1011 MAX:
      0084EE 90 93            [ 1] 1012         LDW Y,X    ;D = n2
      0084F0 90 EE 02         [ 2] 1013         LDW Y,(2,Y)
      0084F3 90 BF 1C         [ 2] 1014         LDW YTEMP,Y
      0084F6 90 93            [ 1] 1015         LDW Y,X
      0084F8 90 FE            [ 2] 1016         LDW Y,(Y)
      0084FA 90 B3 1C         [ 2] 1017         CPW Y,YTEMP     ;if n2 <> n1
      0084FD 2F 02            [ 1] 1018         JRSLT     MAX1
      0084FF EF 02            [ 2] 1019         LDW (2,X),Y
      008501 1C 00 02         [ 2] 1020 MAX1:   ADDW X,#2
      008504 81               [ 4] 1021 	RET     
                                   1022 
                                   1023 ;       MIN     ( n n -- n )
                                   1024 ;       Return smaller of top two items.
      008505 84 EA                 1025         .word      LINK
                           000487  1026 LINK = . 
      008507 03                    1027         .byte      3
      008508 4D 49 4E              1028         .ascii     "MIN"
      00850B                       1029 MIN:
      00850B 90 93            [ 1] 1030         LDW Y,X    ;D = n2
      00850D 90 EE 02         [ 2] 1031         LDW Y,(2,Y)
      008510 90 BF 1C         [ 2] 1032         LDW YTEMP,Y
      008513 90 93            [ 1] 1033         LDW Y,X
      008515 90 FE            [ 2] 1034         LDW Y,(Y)
      008517 90 B3 1C         [ 2] 1035         CPW Y,YTEMP     ;if n2 <> n1
      00851A 2C 02            [ 1] 1036         JRSGT     MIN1
      00851C EF 02            [ 2] 1037         LDW (2,X),Y
      00851E 1C 00 02         [ 2] 1038 MIN1:	ADDW X,#2
      008521 81               [ 4] 1039 	RET     
                                   1040 
                                   1041 ;       WITHIN  ( u ul uh -- t )
                                   1042 ;       Return true if u is within
                                   1043 ;       range of ul and uh. ( ul <= u < uh )
      008522 85 07                 1044         .word      LINK
                           0004A4  1045 LINK = . 
      008524 06                    1046         .byte      6
      008525 57 49 54 48 49 4E     1047         .ascii     "WITHIN"
      00852B                       1048 WITHI:
      00852B CD 82 92         [ 4] 1049         CALL     OVER
      00852E CD 84 69         [ 4] 1050         CALL     SUBB
      008531 CD 82 31         [ 4] 1051         CALL     TOR
      008534 CD 84 69         [ 4] 1052         CALL     SUBB
      008537 CD 82 09         [ 4] 1053         CALL     RFROM
      00853A CC 84 B0         [ 2] 1054         JP     ULESS
                                   1055 
                                   1056 ;; Divide
                                   1057 
                                   1058 ;       UM/MOD  ( udl udh un -- ur uq )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                   1059 ;       Unsigned divide of a double by a
                                   1060 ;       single. Return mod and quotient.
      00853D 85 24                 1061         .word      LINK
                           0004BF  1062 LINK = . 
      00853F 06                    1063         .byte      6
      008540 55 4D 2F 4D 4F 44     1064         .ascii     "UM/MOD"
      008546                       1065 UMMOD:
      008546 BF 1A            [ 2] 1066 	LDW XTEMP,X	; save stack pointer
      008548 FE               [ 2] 1067 	LDW X,(X)		; un
      008549 BF 1C            [ 2] 1068 	LDW YTEMP,X ; save un
      00854B 90 BE 1A         [ 2] 1069 	LDW Y,XTEMP	; stack pointer
      00854E 90 EE 04         [ 2] 1070 	LDW Y,(4,Y) ; Y=udl
      008551 BE 1A            [ 2] 1071 	LDW X,XTEMP
      008553 EE 02            [ 2] 1072 	LDW X,(2,X)	; X=udh
      008555 B3 1C            [ 2] 1073 	CPW X,YTEMP
      008557 23 0F            [ 2] 1074 	JRULE MMSM1
      008559 BE 1A            [ 2] 1075 	LDW X,XTEMP
      00855B 1C 00 02         [ 2] 1076 	ADDW X,#2	; pop off 1 level
      00855E 90 AE FF FF      [ 2] 1077 	LDW Y,#0xFFFF
      008562 FF               [ 2] 1078 	LDW (X),Y
      008563 90 5F            [ 1] 1079 	CLRW Y
      008565 EF 02            [ 2] 1080 	LDW (2,X),Y
      008567 81               [ 4] 1081 	RET
      008568                       1082 MMSM1:
      008568 A6 11            [ 1] 1083 	LD A,#17	; loop count
      00856A                       1084 MMSM3:
      00856A B3 1C            [ 2] 1085 	CPW X,YTEMP	; compare udh to un
      00856C 25 04            [ 1] 1086 	JRULT MMSM4	; can't subtract
      00856E 72 B0 00 1C      [ 2] 1087 	SUBW X,YTEMP	; can subtract
      008572                       1088 MMSM4:
      008572 8C               [ 1] 1089 	CCF	; quotient bit
      008573 90 59            [ 2] 1090 	RLCW Y	; rotate into quotient
      008575 59               [ 2] 1091 	RLCW X	; rotate into remainder
      008576 4A               [ 1] 1092 	DEC A	; repeat
      008577 22 F1            [ 1] 1093 	JRUGT MMSM3
      008579 57               [ 2] 1094 	SRAW X
      00857A BF 1C            [ 2] 1095 	LDW YTEMP,X	; done, save remainder
      00857C BE 1A            [ 2] 1096 	LDW X,XTEMP
      00857E 1C 00 02         [ 2] 1097 	ADDW X,#2	; drop
      008581 FF               [ 2] 1098 	LDW (X),Y
      008582 90 BE 1C         [ 2] 1099 	LDW Y,YTEMP	; save quotient
      008585 EF 02            [ 2] 1100 	LDW (2,X),Y
      008587 81               [ 4] 1101 	RET
                                   1102 	
                                   1103 ;       M/MOD   ( d n -- r q )
                                   1104 ;       Signed floored divide of double by
                                   1105 ;       single. Return mod and quotient.
      008588 85 3F                 1106         .word      LINK
                           00050A  1107 LINK = . 
      00858A 05                    1108         .byte      5
      00858B 4D 2F 4D 4F 44        1109         .ascii     "M/MOD"
      008590                       1110 MSMOD:  
      008590 CD 82 68         [ 4] 1111         CALL	DUPP
      008593 CD 82 A1         [ 4] 1112         CALL	ZLESS
      008596 CD 82 68         [ 4] 1113         CALL	DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      008599 CD 82 31         [ 4] 1114         CALL	TOR
      00859C CD 81 66         [ 4] 1115         CALL	QBRAN
      00859F 85 AD                 1116         .word	MMOD1
      0085A1 CD 84 36         [ 4] 1117         CALL	NEGAT
      0085A4 CD 82 31         [ 4] 1118         CALL	TOR
      0085A7 CD 84 48         [ 4] 1119         CALL	DNEGA
      0085AA CD 82 09         [ 4] 1120         CALL	RFROM
      0085AD CD 82 31         [ 4] 1121 MMOD1:	CALL	TOR
      0085B0 CD 82 68         [ 4] 1122         CALL	DUPP
      0085B3 CD 82 A1         [ 4] 1123         CALL	ZLESS
      0085B6 CD 81 66         [ 4] 1124         CALL	QBRAN
      0085B9 85 C1                 1125         .word	MMOD2
      0085BB CD 82 1C         [ 4] 1126         CALL	RAT
      0085BE CD 84 0B         [ 4] 1127         CALL	PLUS
      0085C1 CD 82 09         [ 4] 1128 MMOD2:	CALL	RFROM
      0085C4 CD 85 46         [ 4] 1129         CALL	UMMOD
      0085C7 CD 82 09         [ 4] 1130         CALL	RFROM
      0085CA CD 81 66         [ 4] 1131         CALL	QBRAN
      0085CD 85 D8                 1132         .word	MMOD3
      0085CF CD 82 78         [ 4] 1133         CALL	SWAPP
      0085D2 CD 84 36         [ 4] 1134         CALL	NEGAT
      0085D5 CD 82 78         [ 4] 1135         CALL	SWAPP
      0085D8 81               [ 4] 1136 MMOD3:	RET
                                   1137 
                                   1138 ;       /MOD    ( n n -- r q )
                                   1139 ;       Signed divide. Return mod and quotient.
      0085D9 85 8A                 1140         .word      LINK
                           00055B  1141 LINK = . 
      0085DB 04                    1142         .byte      4
      0085DC 2F 4D 4F 44           1143         .ascii     "/MOD"
      0085E0                       1144 SLMOD:
      0085E0 CD 82 92         [ 4] 1145         CALL	OVER
      0085E3 CD 82 A1         [ 4] 1146         CALL	ZLESS
      0085E6 CD 82 78         [ 4] 1147         CALL	SWAPP
      0085E9 CC 85 90         [ 2] 1148         JP	MSMOD
                                   1149 
                                   1150 ;       MOD     ( n n -- r )
                                   1151 ;       Signed divide. Return mod only.
      0085EC 85 DB                 1152         .word      LINK
                           00056E  1153 LINK = . 
      0085EE 03                    1154         .byte      3
      0085EF 4D 4F 44              1155         .ascii     "MOD"
      0085F2                       1156 MODD:
      0085F2 CD 85 E0         [ 4] 1157 	CALL	SLMOD
      0085F5 CC 82 5E         [ 2] 1158 	JP	DROP
                                   1159 
                                   1160 ;       /       ( n n -- q )
                                   1161 ;       Signed divide. Return quotient only.
      0085F8 85 EE                 1162         .word      LINK
                           00057A  1163 LINK = . 
      0085FA 01                    1164         .byte      1
      0085FB 2F                    1165         .ascii     "/"
      0085FC                       1166 SLASH:
      0085FC CD 85 E0         [ 4] 1167         CALL	SLMOD
      0085FF CD 82 78         [ 4] 1168         CALL	SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008602 CC 82 5E         [ 2] 1169         JP	DROP
                                   1170 
                                   1171 ;; Multiply
                                   1172 
                                   1173 ;       UM*     ( u u -- ud )
                                   1174 ;       Unsigned multiply. Return double product.
      008605 85 FA                 1175         .word      LINK
                           000587  1176 LINK = . 
      008607 03                    1177         .byte      3
      008608 55 4D 2A              1178         .ascii     "UM*"
      00860B                       1179 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
      00860B E6 02            [ 1] 1180 	LD A,(2,X)	; b
      00860D 90 97            [ 1] 1181 	LD YL,A
      00860F F6               [ 1] 1182 	LD A,(X)	; d
      008610 90 42            [ 4] 1183 	MUL Y,A
      008612 90 BF 1A         [ 2] 1184 	LDW PROD1,Y
      008615 E6 03            [ 1] 1185 	LD A,(3,X)	; a
      008617 90 97            [ 1] 1186 	LD YL,A
      008619 F6               [ 1] 1187 	LD A,(X)	; d
      00861A 90 42            [ 4] 1188 	MUL Y,A
      00861C 90 BF 1C         [ 2] 1189 	LDW PROD2,Y
      00861F E6 02            [ 1] 1190 	LD A,(2,X)	; b
      008621 90 97            [ 1] 1191 	LD YL,A
      008623 E6 01            [ 1] 1192 	LD A,(1,X)	; c
      008625 90 42            [ 4] 1193 	MUL Y,A
      008627 90 BF 1E         [ 2] 1194 	LDW PROD3,Y
      00862A E6 03            [ 1] 1195 	LD A,(3,X)	; a
      00862C 90 97            [ 1] 1196 	LD YL,A
      00862E E6 01            [ 1] 1197 	LD A,(1,X)	; c
      008630 90 42            [ 4] 1198 	MUL Y,A	; least signifiant product
      008632 4F               [ 1] 1199 	CLR A
      008633 90 01            [ 1] 1200 	RRWA Y
      008635 E7 03            [ 1] 1201 	LD (3,X),A	; store least significant byte
      008637 72 B9 00 1E      [ 2] 1202 	ADDW Y,PROD3
      00863B 4F               [ 1] 1203 	CLR A
      00863C A9 00            [ 1] 1204 	ADC A,#0	; save carry
      00863E B7 20            [ 1] 1205 	LD CARRY,A
      008640 72 B9 00 1C      [ 2] 1206 	ADDW Y,PROD2
      008644 B6 20            [ 1] 1207 	LD A,CARRY
      008646 A9 00            [ 1] 1208 	ADC A,#0	; add 2nd carry
      008648 B7 20            [ 1] 1209 	LD CARRY,A
      00864A 4F               [ 1] 1210 	CLR A
      00864B 90 01            [ 1] 1211 	RRWA Y
      00864D E7 02            [ 1] 1212 	LD (2,X),A	; 2nd product byte
      00864F 72 B9 00 1A      [ 2] 1213 	ADDW Y,PROD1
      008653 90 01            [ 1] 1214 	RRWA Y
      008655 E7 01            [ 1] 1215 	LD (1,X),A	; 3rd product byte
      008657 90 01            [ 1] 1216 	RRWA Y  	; 4th product byte now in A
      008659 B9 20            [ 1] 1217 	ADC A,CARRY	; fill in carry bits
      00865B F7               [ 1] 1218 	LD (X),A
      00865C 81               [ 4] 1219 	RET
                                   1220 
                                   1221 ;       *       ( n n -- n )
                                   1222 ;       Signed multiply. Return single product.
      00865D 86 07                 1223         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



                           0005DF  1224 LINK = . 
      00865F 01                    1225         .byte      1
      008660 2A                    1226         .ascii     "*"
      008661                       1227 STAR:
      008661 CD 86 0B         [ 4] 1228 	CALL	UMSTA
      008664 CC 82 5E         [ 2] 1229 	JP	DROP
                                   1230 
                                   1231 ;       M*      ( n n -- d )
                                   1232 ;       Signed multiply. Return double product.
      008667 86 5F                 1233         .word      LINK
                           0005E9  1234 LINK = . 
      008669 02                    1235         .byte      2
      00866A 4D 2A                 1236         .ascii     "M*"
      00866C                       1237 MSTAR:      
      00866C CD 83 F6         [ 4] 1238         CALL	DDUP
      00866F CD 82 DD         [ 4] 1239         CALL	XORR
      008672 CD 82 A1         [ 4] 1240         CALL	ZLESS
      008675 CD 82 31         [ 4] 1241         CALL	TOR
      008678 CD 84 83         [ 4] 1242         CALL	ABSS
      00867B CD 82 78         [ 4] 1243         CALL	SWAPP
      00867E CD 84 83         [ 4] 1244         CALL	ABSS
      008681 CD 86 0B         [ 4] 1245         CALL	UMSTA
      008684 CD 82 09         [ 4] 1246         CALL	RFROM
      008687 CD 81 66         [ 4] 1247         CALL	QBRAN
      00868A 86 8F                 1248         .word	MSTA1
      00868C CD 84 48         [ 4] 1249         CALL	DNEGA
      00868F 81               [ 4] 1250 MSTA1:	RET
                                   1251 
                                   1252 ;       . /MOD   ( n1 n2 n3 -- r q )
                                   1253 ;       Multiply n1 and n2, then divide
                                   1254 ;       by n3. Return mod and quotient.
      008690 86 69                 1255         .word      LINK
                           000612  1256 LINK = . 
      008692 05                    1257         .byte      5
      008693 2A 2F 4D 4F 44        1258         .ascii     "*/MOD"
      008698                       1259 SSMOD:
      008698 CD 82 31         [ 4] 1260         CALL     TOR
      00869B CD 86 6C         [ 4] 1261         CALL     MSTAR
      00869E CD 82 09         [ 4] 1262         CALL     RFROM
      0086A1 CC 85 90         [ 2] 1263         JP     MSMOD
                                   1264 
                                   1265 ;       */      ( n1 n2 n3 -- q )
                                   1266 ;       Multiply n1 by n2, then divide
                                   1267 ;       by n3. Return quotient only.
      0086A4 86 92                 1268         .word      LINK
                           000626  1269 LINK = . 
      0086A6 02                    1270         .byte      2
      0086A7 2E 20 2F              1271         .ascii     ". /"
      0086AA                       1272 STASL:
      0086AA CD 86 98         [ 4] 1273         CALL	SSMOD
      0086AD CD 82 78         [ 4] 1274         CALL	SWAPP
      0086B0 CC 82 5E         [ 2] 1275         JP	DROP
                                   1276 
                                   1277 ;; Miscellaneous
                                   1278 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



                                   1279 ;       CELL+   ( a -- a )
                                   1280 ;       Add cell size in byte to address.
      0086B3 86 A6                 1281         .word      LINK
                           000635  1282 LINK = . 
      0086B5 02                    1283         .byte       2
      0086B6 32 2B                 1284         .ascii     "2+"
      0086B8                       1285 CELLP:
      0086B8 90 93            [ 1] 1286         LDW Y,X
      0086BA 90 FE            [ 2] 1287 	LDW Y,(Y)
      0086BC 72 A9 00 02      [ 2] 1288         ADDW Y,#CELLL 
      0086C0 FF               [ 2] 1289         LDW (X),Y
      0086C1 81               [ 4] 1290         RET
                                   1291 
                                   1292 ;       CELL-   ( a -- a )
                                   1293 ;       Subtract 2 from address.
      0086C2 86 B5                 1294         .word      LINK
                           000644  1295 LINK = . 
      0086C4 02                    1296         .byte       2
      0086C5 32 2D                 1297         .ascii     "2-"
      0086C7                       1298 CELLM:
      0086C7 90 93            [ 1] 1299         LDW Y,X
      0086C9 90 FE            [ 2] 1300 	LDW Y,(Y)
      0086CB 72 A2 00 02      [ 2] 1301         SUBW Y,#CELLL
      0086CF FF               [ 2] 1302         LDW (X),Y
      0086D0 81               [ 4] 1303         RET
                                   1304 
                                   1305 ;       CELLS   ( n -- n )
                                   1306 ;       Multiply tos by 2.
      0086D1 86 C4                 1307         .word      LINK
                           000653  1308 LINK = . 
      0086D3 02                    1309         .byte       2
      0086D4 32 2A                 1310         .ascii     "2*"
      0086D6                       1311 CELLS:
      0086D6 90 93            [ 1] 1312         LDW Y,X
      0086D8 90 FE            [ 2] 1313 	LDW Y,(Y)
      0086DA 90 58            [ 2] 1314         SLAW Y
      0086DC FF               [ 2] 1315         LDW (X),Y
      0086DD 81               [ 4] 1316         RET
                                   1317 
                                   1318 ;       1+      ( a -- a )
                                   1319 ;       Add cell size in byte to address.
      0086DE 86 D3                 1320         .word      LINK
                           000660  1321 LINK = . 
      0086E0 02                    1322         .byte      2
      0086E1 31 2B                 1323         .ascii     "1+"
      0086E3                       1324 ONEP:
      0086E3 90 93            [ 1] 1325         LDW Y,X
      0086E5 90 FE            [ 2] 1326 	LDW Y,(Y)
      0086E7 90 5C            [ 1] 1327         INCW Y
      0086E9 FF               [ 2] 1328         LDW (X),Y
      0086EA 81               [ 4] 1329         RET
                                   1330 
                                   1331 ;       1-      ( a -- a )
                                   1332 ;       Subtract 2 from address.
      0086EB 86 E0                 1333         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                           00066D  1334 LINK = . 
      0086ED 02                    1335         .byte      2
      0086EE 31 2D                 1336         .ascii     "1-"
      0086F0                       1337 ONEM:
      0086F0 90 93            [ 1] 1338         LDW Y,X
      0086F2 90 FE            [ 2] 1339 	LDW Y,(Y)
      0086F4 90 5A            [ 2] 1340         DECW Y
      0086F6 FF               [ 2] 1341         LDW (X),Y
      0086F7 81               [ 4] 1342         RET
                                   1343 
                                   1344 ;       2/      ( n -- n )
                                   1345 ;       Multiply tos by 2.
      0086F8 86 ED                 1346         .word      LINK
                           00067A  1347 LINK = . 
      0086FA 02                    1348         .byte      2
      0086FB 32 2F                 1349         .ascii     "2/"
      0086FD                       1350 TWOSL:
      0086FD 90 93            [ 1] 1351         LDW Y,X
      0086FF 90 FE            [ 2] 1352 	LDW Y,(Y)
      008701 90 57            [ 2] 1353         SRAW Y
      008703 FF               [ 2] 1354         LDW (X),Y
      008704 81               [ 4] 1355         RET
                                   1356 
                                   1357 ;       BL      ( -- 32 )
                                   1358 ;       Return 32,  blank character.
      008705 86 FA                 1359         .word      LINK
                           000687  1360 LINK = . 
      008707 02                    1361         .byte      2
      008708 42 4C                 1362         .ascii     "BL"
      00870A                       1363 BLANK:
      00870A 1D 00 02         [ 2] 1364         SUBW X,#2
      00870D 90 AE 00 20      [ 2] 1365 	LDW Y,#32
      008711 FF               [ 2] 1366         LDW (X),Y
      008712 81               [ 4] 1367         RET
                                   1368 
                                   1369 ;         0     ( -- 0)
                                   1370 ;         Return 0.
      008713 87 07                 1371         .word      LINK
                           000695  1372 LINK = . 
      008715 01                    1373         .byte       1
      008716 30                    1374         .ascii     "0"
      008717                       1375 ZERO:
      008717 1D 00 02         [ 2] 1376         SUBW X,#2
      00871A 90 5F            [ 1] 1377 	CLRW Y
      00871C FF               [ 2] 1378         LDW (X),Y
      00871D 81               [ 4] 1379         RET
                                   1380 
                                   1381 ;         1     ( -- 1)
                                   1382 ;         Return 1.
      00871E 87 15                 1383         .word      LINK
                           0006A0  1384 LINK = . 
      008720 01                    1385         .byte       1
      008721 31                    1386         .ascii     "1"
      008722                       1387 ONE:
      008722 1D 00 02         [ 2] 1388         SUBW X,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      008725 90 AE 00 01      [ 2] 1389 	LDW Y,#1
      008729 FF               [ 2] 1390         LDW (X),Y
      00872A 81               [ 4] 1391         RET
                                   1392 
                                   1393 ;         -1    ( -- -1)
                                   1394 ;         Return 32,  blank character.
      00872B 87 20                 1395         .word      LINK
                           0006AD  1396 LINK = . 
      00872D 02                    1397         .byte       2
      00872E 2D 31                 1398         .ascii     "-1"
      008730                       1399 MONE:
      008730 1D 00 02         [ 2] 1400         SUBW X,#2
      008733 90 AE FF FF      [ 2] 1401 	LDW Y,#0xFFFF
      008737 FF               [ 2] 1402         LDW (X),Y
      008738 81               [ 4] 1403         RET
                                   1404 
                                   1405 ;       >CHAR   ( c -- c )
                                   1406 ;       Filter non-printing characters.
      008739 87 2D                 1407         .word      LINK
                           0006BB  1408 LINK = . 
      00873B 05                    1409         .byte      5
      00873C 3E 43 48 41 52        1410         .ascii     ">CHAR"
      008741                       1411 TCHAR:
      008741 CD 81 2F         [ 4] 1412         CALL     DOLIT
      008744 00 7F                 1413         .word       0x7F
      008746 CD 82 B4         [ 4] 1414         CALL     ANDD
      008749 CD 82 68         [ 4] 1415         CALL     DUPP    ;mask msb
      00874C CD 81 2F         [ 4] 1416         CALL     DOLIT
      00874F 00 7F                 1417         .word      127
      008751 CD 87 0A         [ 4] 1418         CALL     BLANK
      008754 CD 85 2B         [ 4] 1419         CALL     WITHI   ;check for printable
      008757 CD 81 66         [ 4] 1420         CALL     QBRAN
      00875A 87 64                 1421         .word      TCHA1
      00875C CD 82 5E         [ 4] 1422         CALL     DROP
      00875F CD 81 2F         [ 4] 1423         CALL     DOLIT
      008762 00 5F                 1424         .word     0x5F		; "_"     ;replace non-printables
      008764 81               [ 4] 1425 TCHA1:  RET
                                   1426 
                                   1427 ;       DEPTH   ( -- n )
                                   1428 ;       Return  depth of  data stack.
      008765 87 3B                 1429         .word      LINK
                           0006E7  1430 LINK = . 
      008767 05                    1431         .byte      5
      008768 44 45 50 54 48        1432         .ascii     "DEPTH"
      00876D                       1433 DEPTH:
      00876D 90 BE 22         [ 2] 1434         LDW Y,SP0    ;save data stack ptr
      008770 BF 1A            [ 2] 1435 	LDW XTEMP,X
      008772 72 B2 00 1A      [ 2] 1436         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008776 90 57            [ 2] 1437         SRAW Y    ;D = #stack items
      008778 90 5A            [ 2] 1438 	DECW Y
      00877A 1D 00 02         [ 2] 1439 	SUBW X,#2
      00877D FF               [ 2] 1440         LDW (X),Y     ; if neg, underflow
      00877E 81               [ 4] 1441         RET
                                   1442 
                                   1443 ;       PICK    ( ... +n -- ... w )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



                                   1444 ;       Copy  nth stack item to tos.
      00877F 87 67                 1445         .word      LINK
                           000701  1446 LINK = . 
      008781 04                    1447         .byte      4
      008782 50 49 43 4B           1448         .ascii     "PICK"
      008786                       1449 PICK:
      008786 90 93            [ 1] 1450         LDW Y,X   ;D = n1
      008788 90 FE            [ 2] 1451         LDW Y,(Y)
      00878A 90 58            [ 2] 1452         SLAW Y
      00878C BF 1A            [ 2] 1453         LDW XTEMP,X
      00878E 72 B9 00 1A      [ 2] 1454         ADDW Y,XTEMP
      008792 90 FE            [ 2] 1455         LDW Y,(Y)
      008794 FF               [ 2] 1456         LDW (X),Y
      008795 81               [ 4] 1457         RET
                                   1458 
                                   1459 ;; Memory access
                                   1460 
                                   1461 ;       +!      ( n a -- )
                                   1462 ;       Add n to  contents at address a.
      008796 87 81                 1463         .word      LINK
                           000718  1464 LINK = . 
      008798 02                    1465         .byte      2
      008799 2B 21                 1466         .ascii     "+!"
      00879B                       1467 PSTOR:
      00879B CD 82 78         [ 4] 1468         CALL	SWAPP
      00879E CD 82 92         [ 4] 1469         CALL	OVER
      0087A1 CD 81 BB         [ 4] 1470         CALL	AT
      0087A4 CD 84 0B         [ 4] 1471         CALL	PLUS
      0087A7 CD 82 78         [ 4] 1472         CALL	SWAPP
      0087AA CC 81 A4         [ 2] 1473         JP	STORE
                                   1474 
                                   1475 ;       2!      ( d a -- )
                                   1476 ;       Store  double integer to address a.
      0087AD 87 98                 1477         .word      LINK
                           00072F  1478 LINK = . 
      0087AF 02                    1479         .byte      2
      0087B0 32 21                 1480         .ascii     "2!"
      0087B2                       1481 DSTOR:
      0087B2 CD 82 78         [ 4] 1482         CALL	SWAPP
      0087B5 CD 82 92         [ 4] 1483         CALL	OVER
      0087B8 CD 81 A4         [ 4] 1484         CALL	STORE
      0087BB CD 86 B8         [ 4] 1485         CALL	CELLP
      0087BE CC 81 A4         [ 2] 1486         JP	STORE
                                   1487 
                                   1488 ;       2@      ( a -- d )
                                   1489 ;       Fetch double integer from address a.
      0087C1 87 AF                 1490         .word      LINK
                           000743  1491 LINK = . 
      0087C3 02                    1492         .byte      2
      0087C4 32 40                 1493         .ascii     "2@"
      0087C6                       1494 DAT:
      0087C6 CD 82 68         [ 4] 1495         CALL	DUPP
      0087C9 CD 86 B8         [ 4] 1496         CALL	CELLP
      0087CC CD 81 BB         [ 4] 1497         CALL	AT
      0087CF CD 82 78         [ 4] 1498         CALL	SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0087D2 CC 81 BB         [ 2] 1499         JP	AT
                                   1500 
                                   1501 ;       COUNT   ( b -- b +n )
                                   1502 ;       Return count byte of a string
                                   1503 ;       and add 1 to byte address.
      0087D5 87 C3                 1504         .word      LINK
                           000757  1505 LINK = . 
      0087D7 05                    1506         .byte      5
      0087D8 43 4F 55 4E 54        1507         .ascii     "COUNT"
      0087DD                       1508 COUNT:
      0087DD CD 82 68         [ 4] 1509         CALL     DUPP
      0087E0 CD 86 E3         [ 4] 1510         CALL     ONEP
      0087E3 CD 82 78         [ 4] 1511         CALL     SWAPP
      0087E6 CC 81 D9         [ 2] 1512         JP     CAT
                                   1513 
                                   1514 ;       HERE    ( -- a )
                                   1515 ;       Return  top of  code dictionary.
      0087E9 87 D7                 1516         .word      LINK
                           00076B  1517 LINK = . 
      0087EB 04                    1518         .byte      4
      0087EC 48 45 52 45           1519         .ascii     "HERE"
      0087F0                       1520 HERE:
      0087F0 CD 83 92         [ 4] 1521         CALL     CPP
      0087F3 CC 81 BB         [ 2] 1522         JP     AT
                                   1523 
                                   1524 ;       PAD     ( -- a )
                                   1525 ;       Return address of text buffer
                                   1526 ;       above  code dictionary.
      0087F6 87 EB                 1527         .word      LINK
                           000778  1528 LINK = . 
      0087F8 03                    1529         .byte      3
      0087F9 50 41 44              1530         .ascii     "PAD"
      0087FC                       1531 PAD:
      0087FC CD 87 F0         [ 4] 1532         CALL     HERE
      0087FF CD 81 2F         [ 4] 1533         CALL     DOLIT
      008802 00 50                 1534         .word      80
      008804 CC 84 0B         [ 2] 1535         JP     PLUS
                                   1536 
                                   1537 ;       TIB     ( -- a )
                                   1538 ;       Return address of terminal input buffer.
      008807 87 F8                 1539         .word      LINK
                           000789  1540 LINK = . 
      008809 03                    1541         .byte      3
      00880A 54 49 42              1542         .ascii     "TIB"
      00880D                       1543 TIB:
      00880D CD 83 51         [ 4] 1544         CALL     NTIB
      008810 CD 86 B8         [ 4] 1545         CALL     CELLP
      008813 CC 81 BB         [ 2] 1546         JP     AT
                                   1547 
                                   1548 ;       @EXECUTE        ( a -- )
                                   1549 ;       Execute vector stored in address a.
      008816 88 09                 1550         .word      LINK
                           000798  1551 LINK = . 
      008818 08                    1552         .byte      8
      008819 40 45 58 45 43 55 54  1553         .ascii     "@EXECUTE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal  45-Bits]



             45
      008821                       1554 ATEXE:
      008821 CD 81 BB         [ 4] 1555         CALL     AT
      008824 CD 83 B2         [ 4] 1556         CALL     QDUP    ;?address or zero
      008827 CD 81 66         [ 4] 1557         CALL     QBRAN
      00882A 88 2F                 1558         .word      EXE1
      00882C CD 81 8D         [ 4] 1559         CALL     EXECU   ;execute if non-zero
      00882F 81               [ 4] 1560 EXE1:   RET     ;do nothing if zero
                                   1561 
                                   1562 ;       CMOVE   ( b1 b2 u -- )
                                   1563 ;       Copy u bytes from b1 to b2.
      008830 88 18                 1564         .word      LINK
                           0007B2  1565 LINK = . 
      008832 05                    1566         .byte      5
      008833 43 4D 4F 56 45        1567         .ascii     "CMOVE"
      008838                       1568 CMOVE:
      008838 CD 82 31         [ 4] 1569         CALL	TOR
      00883B CD 81 7D         [ 4] 1570         CALL	BRAN
      00883E 88 58                 1571         .word	CMOV2
      008840 CD 82 31         [ 4] 1572 CMOV1:	CALL	TOR
      008843 CD 82 68         [ 4] 1573         CALL	DUPP
      008846 CD 81 D9         [ 4] 1574         CALL	CAT
      008849 CD 82 1C         [ 4] 1575         CALL	RAT
      00884C CD 81 C8         [ 4] 1576         CALL	CSTOR
      00884F CD 86 E3         [ 4] 1577         CALL	ONEP
      008852 CD 82 09         [ 4] 1578         CALL	RFROM
      008855 CD 86 E3         [ 4] 1579         CALL	ONEP
      008858 CD 81 47         [ 4] 1580 CMOV2:	CALL	DONXT
      00885B 88 40                 1581         .word	CMOV1
      00885D CC 83 EB         [ 2] 1582         JP	DDROP
                                   1583 
                                   1584 ;       FILL    ( b u c -- )
                                   1585 ;       Fill u bytes of character c
                                   1586 ;       to area beginning at b.
      008860 88 32                 1587         .word       LINK
                           0007E2  1588 LINK = . 
      008862 04                    1589         .byte       4
      008863 46 49 4C 4C           1590         .ascii     "FILL"
      008867                       1591 FILL:
      008867 CD 82 78         [ 4] 1592         CALL	SWAPP
      00886A CD 82 31         [ 4] 1593         CALL	TOR
      00886D CD 82 78         [ 4] 1594         CALL	SWAPP
      008870 CD 81 7D         [ 4] 1595         CALL	BRAN
      008873 88 7E                 1596         .word	FILL2
      008875 CD 83 F6         [ 4] 1597 FILL1:	CALL	DDUP
      008878 CD 81 C8         [ 4] 1598         CALL	CSTOR
      00887B CD 86 E3         [ 4] 1599         CALL	ONEP
      00887E CD 81 47         [ 4] 1600 FILL2:	CALL	DONXT
      008881 88 75                 1601         .word	FILL1
      008883 CC 83 EB         [ 2] 1602         JP	DDROP
                                   1603 
                                   1604 ;       ERASE   ( b u -- )
                                   1605 ;       Erase u bytes beginning at b.
      008886 88 62                 1606         .word      LINK
                           000808  1607 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008888 05                    1608         .byte      5
      008889 45 52 41 53 45        1609         .ascii     "ERASE"
      00888E                       1610 ERASE:
      00888E CD 87 17         [ 4] 1611         CALL     ZERO
      008891 CC 88 67         [ 2] 1612         JP     FILL
                                   1613 
                                   1614 ;       PACK0x   ( b u a -- a )
                                   1615 ;       Build a counted string with
                                   1616 ;       u characters from b. Null fill.
      008894 88 88                 1617         .word      LINK
                           000816  1618 LINK = . 
      008896 05                    1619         .byte      5
      008897 50 41 43 4B 30 78     1620         .ascii     "PACK0x"
      00889D                       1621 PACKS:
      00889D CD 82 68         [ 4] 1622         CALL     DUPP
      0088A0 CD 82 31         [ 4] 1623         CALL     TOR     ;strings only on cell boundary
      0088A3 CD 83 F6         [ 4] 1624         CALL     DDUP
      0088A6 CD 81 C8         [ 4] 1625         CALL     CSTOR
      0088A9 CD 86 E3         [ 4] 1626         CALL     ONEP ;save count
      0088AC CD 82 78         [ 4] 1627         CALL     SWAPP
      0088AF CD 88 38         [ 4] 1628         CALL     CMOVE
      0088B2 CD 82 09         [ 4] 1629         CALL     RFROM
      0088B5 81               [ 4] 1630         RET
                                   1631 
                                   1632 ;; Numeric output, single precision
                                   1633 
                                   1634 ;       DIGIT   ( u -- c )
                                   1635 ;       Convert digit u to a character.
      0088B6 88 96                 1636         .word      LINK
                           000838  1637 LINK = . 
      0088B8 05                    1638         .byte      5
      0088B9 44 49 47 49 54        1639         .ascii     "DIGIT"
      0088BE                       1640 DIGIT:
      0088BE CD 81 2F         [ 4] 1641         CALL	DOLIT
      0088C1 00 09                 1642         .word	9
      0088C3 CD 82 92         [ 4] 1643         CALL	OVER
      0088C6 CD 84 CE         [ 4] 1644         CALL	LESS
      0088C9 CD 81 2F         [ 4] 1645         CALL	DOLIT
      0088CC 00 07                 1646         .word	7
      0088CE CD 82 B4         [ 4] 1647         CALL	ANDD
      0088D1 CD 84 0B         [ 4] 1648         CALL	PLUS
      0088D4 CD 81 2F         [ 4] 1649         CALL	DOLIT
      0088D7 00 30                 1650         .word	48	;'0'
      0088D9 CC 84 0B         [ 2] 1651         JP	PLUS
                                   1652 
                                   1653 ;       EXTRACT ( n base -- n c )
                                   1654 ;       Extract least significant digit from n.
      0088DC 88 B8                 1655         .word      LINK
                           00085E  1656 LINK = . 
      0088DE 07                    1657         .byte      7
      0088DF 45 58 54 52 41 43 54  1658         .ascii     "EXTRACT"
      0088E6                       1659 EXTRC:
      0088E6 CD 87 17         [ 4] 1660         CALL     ZERO
      0088E9 CD 82 78         [ 4] 1661         CALL     SWAPP
      0088EC CD 85 46         [ 4] 1662         CALL     UMMOD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      0088EF CD 82 78         [ 4] 1663         CALL     SWAPP
      0088F2 CC 88 BE         [ 2] 1664         JP     DIGIT
                                   1665 
                                   1666 ;       <#      ( -- )
                                   1667 ;       Initiate  numeric output process.
      0088F5 88 DE                 1668         .word      LINK
                           000877  1669 LINK = . 
      0088F7 02                    1670         .byte      2
      0088F8 3C 23                 1671         .ascii     "<#"
      0088FA                       1672 BDIGS:
      0088FA CD 87 FC         [ 4] 1673         CALL     PAD
      0088FD CD 83 71         [ 4] 1674         CALL     HLD
      008900 CC 81 A4         [ 2] 1675         JP     STORE
                                   1676 
                                   1677 ;       HOLD    ( c -- )
                                   1678 ;       Insert a character into output string.
      008903 88 F7                 1679         .word      LINK
                           000885  1680 LINK = . 
      008905 04                    1681         .byte      4
      008906 48 4F 4C 44           1682         .ascii     "HOLD"
      00890A                       1683 HOLD:
      00890A CD 83 71         [ 4] 1684         CALL     HLD
      00890D CD 81 BB         [ 4] 1685         CALL     AT
      008910 CD 86 F0         [ 4] 1686         CALL     ONEM
      008913 CD 82 68         [ 4] 1687         CALL     DUPP
      008916 CD 83 71         [ 4] 1688         CALL     HLD
      008919 CD 81 A4         [ 4] 1689         CALL     STORE
      00891C CC 81 C8         [ 2] 1690         JP     CSTOR
                                   1691 
                                   1692 ;       #       ( u -- u )
                                   1693 ;       Extract one digit from u and
                                   1694 ;       append digit to output string.
      00891F 89 05                 1695         .word      LINK
                           0008A1  1696 LINK = . 
      008921 01                    1697         .byte      1
      008922 23                    1698         .ascii     "#"
      008923                       1699 DIG:
      008923 CD 83 23         [ 4] 1700         CALL     BASE
      008926 CD 81 BB         [ 4] 1701         CALL     AT
      008929 CD 88 E6         [ 4] 1702         CALL     EXTRC
      00892C CC 89 0A         [ 2] 1703         JP     HOLD
                                   1704 
                                   1705 ;       #S      ( u -- 0 )
                                   1706 ;       Convert u until all digits
                                   1707 ;       are added to output string.
      00892F 89 21                 1708         .word      LINK
                           0008B1  1709 LINK = . 
      008931 02                    1710         .byte      2
      008932 23 53                 1711         .ascii     "#S"
      008934                       1712 DIGS:
      008934 CD 89 23         [ 4] 1713 DIGS1:  CALL     DIG
      008937 CD 82 68         [ 4] 1714         CALL     DUPP
      00893A CD 81 66         [ 4] 1715         CALL     QBRAN
      00893D 89 41                 1716         .word      DIGS2
      00893F 20 F3            [ 2] 1717         JRA     DIGS1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008941 81               [ 4] 1718 DIGS2:  RET
                                   1719 
                                   1720 ;       SIGN    ( n -- )
                                   1721 ;       Add a minus sign to
                                   1722 ;       numeric output string.
      008942 89 31                 1723         .word      LINK
                           0008C4  1724 LINK = . 
      008944 04                    1725         .byte      4
      008945 53 49 47 4E           1726         .ascii     "SIGN"
      008949                       1727 SIGN:
      008949 CD 82 A1         [ 4] 1728         CALL     ZLESS
      00894C CD 81 66         [ 4] 1729         CALL     QBRAN
      00894F 89 59                 1730         .word      SIGN1
      008951 CD 81 2F         [ 4] 1731         CALL     DOLIT
      008954 00 2D                 1732         .word      45	;"-"
      008956 CC 89 0A         [ 2] 1733         JP     HOLD
      008959 81               [ 4] 1734 SIGN1:  RET
                                   1735 
                                   1736 ;       #>      ( w -- b u )
                                   1737 ;       Prepare output string.
      00895A 89 44                 1738         .word      LINK
                           0008DC  1739 LINK = . 
      00895C 02                    1740         .byte      2
      00895D 23 3E                 1741         .ascii     "#>"
      00895F                       1742 EDIGS:
      00895F CD 82 5E         [ 4] 1743         CALL     DROP
      008962 CD 83 71         [ 4] 1744         CALL     HLD
      008965 CD 81 BB         [ 4] 1745         CALL     AT
      008968 CD 87 FC         [ 4] 1746         CALL     PAD
      00896B CD 82 92         [ 4] 1747         CALL     OVER
      00896E CC 84 69         [ 2] 1748         JP     SUBB
                                   1749 
                                   1750 ;       str     ( w -- b u )
                                   1751 ;       Convert a signed integer
                                   1752 ;       to a numeric string.
      008971 89 5C                 1753         .word      LINK
                           0008F3  1754 LINK = . 
      008973 03                    1755         .byte      3
      008974 73 74 72              1756         .ascii     "str"
      008977                       1757 STR:
      008977 CD 82 68         [ 4] 1758         CALL     DUPP
      00897A CD 82 31         [ 4] 1759         CALL     TOR
      00897D CD 84 83         [ 4] 1760         CALL     ABSS
      008980 CD 88 FA         [ 4] 1761         CALL     BDIGS
      008983 CD 89 34         [ 4] 1762         CALL     DIGS
      008986 CD 82 09         [ 4] 1763         CALL     RFROM
      008989 CD 89 49         [ 4] 1764         CALL     SIGN
      00898C CC 89 5F         [ 2] 1765         JP     EDIGS
                                   1766 
                                   1767 ;       HEX     ( -- )
                                   1768 ;       Use radix 16 as base for
                                   1769 ;       numeric conversions.
      00898F 89 73                 1770         .word      LINK
                           000911  1771 LINK = . 
      008991 03                    1772         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008992 48 45 58              1773         .ascii     "HEX"
      008995                       1774 HEX:
      008995 CD 81 2F         [ 4] 1775         CALL     DOLIT
      008998 00 10                 1776         .word      16
      00899A CD 83 23         [ 4] 1777         CALL     BASE
      00899D CC 81 A4         [ 2] 1778         JP     STORE
                                   1779 
                                   1780 ;       DECIMAL ( -- )
                                   1781 ;       Use radix 10 as base
                                   1782 ;       for numeric conversions.
      0089A0 89 91                 1783         .word      LINK
                           000922  1784 LINK = . 
      0089A2 07                    1785         .byte      7
      0089A3 44 45 43 49 4D 41 4C  1786         .ascii     "DECIMAL"
      0089AA                       1787 DECIM:
      0089AA CD 81 2F         [ 4] 1788         CALL     DOLIT
      0089AD 00 0A                 1789         .word      10
      0089AF CD 83 23         [ 4] 1790         CALL     BASE
      0089B2 CC 81 A4         [ 2] 1791         JP     STORE
                                   1792 
                                   1793 ;; Numeric input, single precision
                                   1794 
                                   1795 ;       DIGIT?  ( c base -- u t )
                                   1796 ;       Convert a character to its numeric
                                   1797 ;       value. A flag indicates success.
      0089B5 89 A2                 1798         .word      LINK
                           000937  1799 LINK = . 
      0089B7 06                    1800         .byte       6
      0089B8 44 49 47 49 54 3F     1801         .ascii     "DIGIT?"
      0089BE                       1802 DIGTQ:
      0089BE CD 82 31         [ 4] 1803         CALL     TOR
      0089C1 CD 81 2F         [ 4] 1804         CALL     DOLIT
      0089C4 00 30                 1805         .word     48	; "0"
      0089C6 CD 84 69         [ 4] 1806         CALL     SUBB
      0089C9 CD 81 2F         [ 4] 1807         CALL     DOLIT
      0089CC 00 09                 1808         .word      9
      0089CE CD 82 92         [ 4] 1809         CALL     OVER
      0089D1 CD 84 CE         [ 4] 1810         CALL     LESS
      0089D4 CD 81 66         [ 4] 1811         CALL     QBRAN
      0089D7 89 EF                 1812         .word      DGTQ1
      0089D9 CD 81 2F         [ 4] 1813         CALL     DOLIT
      0089DC 00 07                 1814         .word      7
      0089DE CD 84 69         [ 4] 1815         CALL     SUBB
      0089E1 CD 82 68         [ 4] 1816         CALL     DUPP
      0089E4 CD 81 2F         [ 4] 1817         CALL     DOLIT
      0089E7 00 0A                 1818         .word      10
      0089E9 CD 84 CE         [ 4] 1819         CALL     LESS
      0089EC CD 82 C8         [ 4] 1820         CALL     ORR
      0089EF CD 82 68         [ 4] 1821 DGTQ1:  CALL     DUPP
      0089F2 CD 82 09         [ 4] 1822         CALL     RFROM
      0089F5 CC 84 B0         [ 2] 1823         JP     ULESS
                                   1824 
                                   1825 ;       NUMBER? ( a -- n T | a F )
                                   1826 ;       Convert a number string to
                                   1827 ;       integer. Push a flag on tos.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      0089F8 89 B7                 1828         .word      LINK
                           00097A  1829 LINK = . 
      0089FA 07                    1830         .byte      7
      0089FB 4E 55 4D 42 45 52 3F  1831         .ascii     "NUMBER?"
      008A02                       1832 NUMBQ:
      008A02 CD 83 23         [ 4] 1833         CALL     BASE
      008A05 CD 81 BB         [ 4] 1834         CALL     AT
      008A08 CD 82 31         [ 4] 1835         CALL     TOR
      008A0B CD 87 17         [ 4] 1836         CALL     ZERO
      008A0E CD 82 92         [ 4] 1837         CALL     OVER
      008A11 CD 87 DD         [ 4] 1838         CALL     COUNT
      008A14 CD 82 92         [ 4] 1839         CALL     OVER
      008A17 CD 81 D9         [ 4] 1840         CALL     CAT
      008A1A CD 81 2F         [ 4] 1841         CALL     DOLIT
      008A1D 00 24                 1842         .word     36	; "0x"
      008A1F CD 84 91         [ 4] 1843         CALL     EQUAL
      008A22 CD 81 66         [ 4] 1844         CALL     QBRAN
      008A25 8A 36                 1845         .word      NUMQ1
      008A27 CD 89 95         [ 4] 1846         CALL     HEX
      008A2A CD 82 78         [ 4] 1847         CALL     SWAPP
      008A2D CD 86 E3         [ 4] 1848         CALL     ONEP
      008A30 CD 82 78         [ 4] 1849         CALL     SWAPP
      008A33 CD 86 F0         [ 4] 1850         CALL     ONEM
      008A36 CD 82 92         [ 4] 1851 NUMQ1:  CALL     OVER
      008A39 CD 81 D9         [ 4] 1852         CALL     CAT
      008A3C CD 81 2F         [ 4] 1853         CALL     DOLIT
      008A3F 00 2D                 1854         .word     45	; "-"
      008A41 CD 84 91         [ 4] 1855         CALL     EQUAL
      008A44 CD 82 31         [ 4] 1856         CALL     TOR
      008A47 CD 82 78         [ 4] 1857         CALL     SWAPP
      008A4A CD 82 1C         [ 4] 1858         CALL     RAT
      008A4D CD 84 69         [ 4] 1859         CALL     SUBB
      008A50 CD 82 78         [ 4] 1860         CALL     SWAPP
      008A53 CD 82 1C         [ 4] 1861         CALL     RAT
      008A56 CD 84 0B         [ 4] 1862         CALL     PLUS
      008A59 CD 83 B2         [ 4] 1863         CALL     QDUP
      008A5C CD 81 66         [ 4] 1864         CALL     QBRAN
      008A5F 8A C0                 1865         .word      NUMQ6
      008A61 CD 86 F0         [ 4] 1866         CALL     ONEM
      008A64 CD 82 31         [ 4] 1867         CALL     TOR
      008A67 CD 82 68         [ 4] 1868 NUMQ2:  CALL     DUPP
      008A6A CD 82 31         [ 4] 1869         CALL     TOR
      008A6D CD 81 D9         [ 4] 1870         CALL     CAT
      008A70 CD 83 23         [ 4] 1871         CALL     BASE
      008A73 CD 81 BB         [ 4] 1872         CALL     AT
      008A76 CD 89 BE         [ 4] 1873         CALL     DIGTQ
      008A79 CD 81 66         [ 4] 1874         CALL     QBRAN
      008A7C 8A AE                 1875         .word      NUMQ4
      008A7E CD 82 78         [ 4] 1876         CALL     SWAPP
      008A81 CD 83 23         [ 4] 1877         CALL     BASE
      008A84 CD 81 BB         [ 4] 1878         CALL     AT
      008A87 CD 86 61         [ 4] 1879         CALL     STAR
      008A8A CD 84 0B         [ 4] 1880         CALL     PLUS
      008A8D CD 82 09         [ 4] 1881         CALL     RFROM
      008A90 CD 86 E3         [ 4] 1882         CALL     ONEP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008A93 CD 81 47         [ 4] 1883         CALL     DONXT
      008A96 8A 67                 1884         .word      NUMQ2
      008A98 CD 82 1C         [ 4] 1885         CALL     RAT
      008A9B CD 82 78         [ 4] 1886         CALL     SWAPP
      008A9E CD 82 5E         [ 4] 1887         CALL     DROP
      008AA1 CD 81 66         [ 4] 1888         CALL     QBRAN
      008AA4 8A A9                 1889         .word      NUMQ3
      008AA6 CD 84 36         [ 4] 1890         CALL     NEGAT
      008AA9 CD 82 78         [ 4] 1891 NUMQ3:  CALL     SWAPP
      008AAC 20 0F            [ 2] 1892         JRA     NUMQ5
      008AAE CD 82 09         [ 4] 1893 NUMQ4:  CALL     RFROM
      008AB1 CD 82 09         [ 4] 1894         CALL     RFROM
      008AB4 CD 83 EB         [ 4] 1895         CALL     DDROP
      008AB7 CD 83 EB         [ 4] 1896         CALL     DDROP
      008ABA CD 87 17         [ 4] 1897         CALL     ZERO
      008ABD CD 82 68         [ 4] 1898 NUMQ5:  CALL     DUPP
      008AC0 CD 82 09         [ 4] 1899 NUMQ6:  CALL     RFROM
      008AC3 CD 83 EB         [ 4] 1900         CALL     DDROP
      008AC6 CD 82 09         [ 4] 1901         CALL     RFROM
      008AC9 CD 83 23         [ 4] 1902         CALL     BASE
      008ACC CC 81 A4         [ 2] 1903         JP     STORE
                                   1904 
                                   1905 ;; Basic I/O
                                   1906 
                                   1907 ;       KEY     ( -- c )
                                   1908 ;       Wait for and return an
                                   1909 ;       input character.
      008ACF 89 FA                 1910         .word      LINK
                           000A51  1911 LINK = . 
      008AD1 03                    1912         .byte      3
      008AD2 4B 45 59              1913         .ascii     "KEY"
      008AD5                       1914 KEY:
      008AD5 CD 80 FB         [ 4] 1915 KEY1:   CALL     QKEY
      008AD8 CD 81 66         [ 4] 1916         CALL     QBRAN
      008ADB 8A D5                 1917         .word      KEY1
      008ADD 81               [ 4] 1918         RET
                                   1919 
                                   1920 ;       NUF?    ( -- t )
                                   1921 ;       Return false if no input,
                                   1922 ;       else pause and if CR return true.
      008ADE 8A D1                 1923         .word      LINK
                           000A60  1924 LINK = . 
      008AE0 04                    1925         .byte      4
      008AE1 4E 55 46 3F           1926         .ascii     "NUF?"
      008AE5                       1927 NUFQ:
      008AE5 CD 80 FB         [ 4] 1928         CALL     QKEY
      008AE8 CD 82 68         [ 4] 1929         CALL     DUPP
      008AEB CD 81 66         [ 4] 1930         CALL     QBRAN
      008AEE 8A FE                 1931         .word      NUFQ1
      008AF0 CD 83 EB         [ 4] 1932         CALL     DDROP
      008AF3 CD 8A D5         [ 4] 1933         CALL     KEY
      008AF6 CD 81 2F         [ 4] 1934         CALL     DOLIT
      008AF9 00 0D                 1935         .word      CRR
      008AFB CC 84 91         [ 2] 1936         JP     EQUAL
      008AFE 81               [ 4] 1937 NUFQ1:  RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                                   1938 
                                   1939 ;       SPACE   ( -- )
                                   1940 ;       Send  blank character to
                                   1941 ;       output device.
      008AFF 8A E0                 1942         .word      LINK
                           000A81  1943 LINK = . 
      008B01 05                    1944         .byte      5
      008B02 53 50 41 43 45        1945         .ascii     "SPACE"
      008B07                       1946 SPACE:
      008B07 CD 87 0A         [ 4] 1947         CALL     BLANK
      008B0A CC 81 19         [ 2] 1948         JP     EMIT
                                   1949 
                                   1950 ;       SPACES  ( +n -- )
                                   1951 ;       Send n spaces to output device.
      008B0D 8B 01                 1952         .word      LINK
                           000A8F  1953 LINK = . 
      008B0F 06                    1954         .byte      6
      008B10 53 50 41 43 45 53     1955         .ascii     "SPACES"
      008B16                       1956 SPACS:
      008B16 CD 87 17         [ 4] 1957         CALL     ZERO
      008B19 CD 84 EE         [ 4] 1958         CALL     MAX
      008B1C CD 82 31         [ 4] 1959         CALL     TOR
      008B1F 20 03            [ 2] 1960         JRA     CHAR2
      008B21 CD 8B 07         [ 4] 1961 CHAR1:  CALL     SPACE
      008B24 CD 81 47         [ 4] 1962 CHAR2:  CALL     DONXT
      008B27 8B 21                 1963         .word      CHAR1
      008B29 81               [ 4] 1964         RET
                                   1965 
                                   1966 ;       TYPE    ( b u -- )
                                   1967 ;       Output u characters from b.
      008B2A 8B 0F                 1968         .word      LINK
                           000AAC  1969 LINK = . 
      008B2C 04                    1970         .byte      4
      008B2D 54 59 50 45           1971         .ascii     "TYPE"
      008B31                       1972 TYPES:
      008B31 CD 82 31         [ 4] 1973         CALL     TOR
      008B34 20 0C            [ 2] 1974         JRA     TYPE2
      008B36 CD 82 68         [ 4] 1975 TYPE1:  CALL     DUPP
      008B39 CD 81 D9         [ 4] 1976         CALL     CAT
      008B3C CD 81 19         [ 4] 1977         CALL     EMIT
      008B3F CD 86 E3         [ 4] 1978         CALL     ONEP
      008B42 CD 81 47         [ 4] 1979 TYPE2:  CALL     DONXT
      008B45 8B 36                 1980         .word      TYPE1
      008B47 CC 82 5E         [ 2] 1981         JP     DROP
                                   1982 
                                   1983 ;       CR      ( -- )
                                   1984 ;       Output a carriage return
                                   1985 ;       and a line feed.
      008B4A 8B 2C                 1986         .word      LINK
                           000ACC  1987 LINK = . 
      008B4C 02                    1988         .byte      2
      008B4D 43 52                 1989         .ascii     "CR"
      008B4F                       1990 CR:
      008B4F CD 81 2F         [ 4] 1991         CALL     DOLIT
      008B52 00 0D                 1992         .word      CRR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008B54 CD 81 19         [ 4] 1993         CALL     EMIT
      008B57 CD 81 2F         [ 4] 1994         CALL     DOLIT
      008B5A 00 0A                 1995         .word      LF
      008B5C CC 81 19         [ 2] 1996         JP     EMIT
                                   1997 
                                   1998 ;       do$     ( -- a )
                                   1999 ;       Return  address of a compiled
                                   2000 ;       string.
      008B5F 8B 4C                 2001         .word      LINK
                           000AE1  2002 LINK = . 
      008B61 43                    2003 	.byte      COMPO+3
      008B62 64 6F 24              2004         .ascii     "do$"
      008B65                       2005 DOSTR:
      008B65 CD 82 09         [ 4] 2006         CALL     RFROM
      008B68 CD 82 1C         [ 4] 2007         CALL     RAT
      008B6B CD 82 09         [ 4] 2008         CALL     RFROM
      008B6E CD 87 DD         [ 4] 2009         CALL     COUNT
      008B71 CD 84 0B         [ 4] 2010         CALL     PLUS
      008B74 CD 82 31         [ 4] 2011         CALL     TOR
      008B77 CD 82 78         [ 4] 2012         CALL     SWAPP
      008B7A CD 82 31         [ 4] 2013         CALL     TOR
      008B7D 81               [ 4] 2014         RET
                                   2015 
                                   2016 ;       $"|     ( -- a )
                                   2017 ;       Run time routine compiled by $".
                                   2018 ;       Return address of a compiled string.
      008B7E 8B 61                 2019         .word      LINK
                           000B00  2020 LINK = . 
      008B80 43                    2021 	.byte      COMPO+3
      008B81 24 22 7C              2022         .byte     '$','"','|'
      008B84                       2023 STRQP:
      008B84 CD 8B 65         [ 4] 2024         CALL     DOSTR
      008B87 81               [ 4] 2025         RET
                                   2026 
                                   2027 ;       ."|     ( -- )
                                   2028 ;       Run time routine of ." .
                                   2029 ;       Output a compiled string.
      008B88 8B 80                 2030         .word      LINK
                           000B0A  2031 LINK = . 
      008B8A 43                    2032 	.byte      COMPO+3
      008B8B 2E 22 7C              2033         .byte     '.','"','|'
      008B8E                       2034 DOTQP:
      008B8E CD 8B 65         [ 4] 2035         CALL     DOSTR
      008B91 CD 87 DD         [ 4] 2036         CALL     COUNT
      008B94 CC 8B 31         [ 2] 2037         JP     TYPES
                                   2038 
                                   2039 ;       .R      ( n +n -- )
                                   2040 ;       Display an integer in a field
                                   2041 ;       of n columns, right justified.
      008B97 8B 8A                 2042         .word      LINK
                           000B19  2043 LINK = . 
      008B99 02                    2044         .byte      2
      008B9A 2E 52                 2045         .ascii     ".R"
      008B9C                       2046 DOTR:
      008B9C CD 82 31         [ 4] 2047         CALL     TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008B9F CD 89 77         [ 4] 2048         CALL     STR
      008BA2 CD 82 09         [ 4] 2049         CALL     RFROM
      008BA5 CD 82 92         [ 4] 2050         CALL     OVER
      008BA8 CD 84 69         [ 4] 2051         CALL     SUBB
      008BAB CD 8B 16         [ 4] 2052         CALL     SPACS
      008BAE CC 8B 31         [ 2] 2053         JP     TYPES
                                   2054 
                                   2055 ;       U.R     ( u +n -- )
                                   2056 ;       Display an unsigned integer
                                   2057 ;       in n column, right justified.
      008BB1 8B 99                 2058         .word      LINK
                           000B33  2059 LINK = . 
      008BB3 03                    2060         .byte      3
      008BB4 55 2E 52              2061         .ascii     "U.R"
      008BB7                       2062 UDOTR:
      008BB7 CD 82 31         [ 4] 2063         CALL     TOR
      008BBA CD 88 FA         [ 4] 2064         CALL     BDIGS
      008BBD CD 89 34         [ 4] 2065         CALL     DIGS
      008BC0 CD 89 5F         [ 4] 2066         CALL     EDIGS
      008BC3 CD 82 09         [ 4] 2067         CALL     RFROM
      008BC6 CD 82 92         [ 4] 2068         CALL     OVER
      008BC9 CD 84 69         [ 4] 2069         CALL     SUBB
      008BCC CD 8B 16         [ 4] 2070         CALL     SPACS
      008BCF CC 8B 31         [ 2] 2071         JP     TYPES
                                   2072 
                                   2073 ;       U.      ( u -- )
                                   2074 ;       Display an unsigned integer
                                   2075 ;       in free format.
      008BD2 8B B3                 2076         .word      LINK
                           000B54  2077 LINK = . 
      008BD4 02                    2078         .byte      2
      008BD5 55 2E                 2079         .ascii     "U."
      008BD7                       2080 UDOT:
      008BD7 CD 88 FA         [ 4] 2081         CALL     BDIGS
      008BDA CD 89 34         [ 4] 2082         CALL     DIGS
      008BDD CD 89 5F         [ 4] 2083         CALL     EDIGS
      008BE0 CD 8B 07         [ 4] 2084         CALL     SPACE
      008BE3 CC 8B 31         [ 2] 2085         JP     TYPES
                                   2086 
                                   2087 ;       .       ( w -- )
                                   2088 ;       Display an integer in free
                                   2089 ;       format, preceeded by a space.
      008BE6 8B D4                 2090         .word      LINK
                           000B68  2091 LINK = . 
      008BE8 01                    2092         .byte      1
      008BE9 2E                    2093         .ascii     "."
      008BEA                       2094 DOT:
      008BEA CD 83 23         [ 4] 2095         CALL     BASE
      008BED CD 81 BB         [ 4] 2096         CALL     AT
      008BF0 CD 81 2F         [ 4] 2097         CALL     DOLIT
      008BF3 00 0A                 2098         .word      10
      008BF5 CD 82 DD         [ 4] 2099         CALL     XORR    ;?decimal
      008BF8 CD 81 66         [ 4] 2100         CALL     QBRAN
      008BFB 8C 00                 2101         .word      DOT1
      008BFD CC 8B D7         [ 2] 2102         JP     UDOT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008C00 CD 89 77         [ 4] 2103 DOT1:   CALL     STR
      008C03 CD 8B 07         [ 4] 2104         CALL     SPACE
      008C06 CC 8B 31         [ 2] 2105         JP     TYPES
                                   2106 
                                   2107 ;       ?       ( a -- )
                                   2108 ;       Display contents in memory cell.
      008C09 8B E8                 2109         .word      LINK
                                   2110         
                           000B8B  2111 LINK = . 
      008C0B 01                    2112         .byte      1
      008C0C 3F                    2113         .ascii     "?"
      008C0D                       2114 QUEST:
      008C0D CD 81 BB         [ 4] 2115         CALL     AT
      008C10 CC 8B EA         [ 2] 2116         JP     DOT
                                   2117 
                                   2118 ;; Parsing
                                   2119 
                                   2120 ;       parse   ( b u c -- b u delta ; <string> )
                                   2121 ;       Scan string delimited by c.
                                   2122 ;       Return found string and its offset.
      008C13 8C 0B                 2123         .word      LINK
                           000B95  2124 LINK = . 
      008C15 05                    2125         .byte      5
      008C16 70 61 72 73 65        2126         .ascii     "parse"
      008C1B                       2127 PARS:
      008C1B CD 83 32         [ 4] 2128         CALL     TEMP
      008C1E CD 81 A4         [ 4] 2129         CALL     STORE
      008C21 CD 82 92         [ 4] 2130         CALL     OVER
      008C24 CD 82 31         [ 4] 2131         CALL     TOR
      008C27 CD 82 68         [ 4] 2132         CALL     DUPP
      008C2A CD 81 66         [ 4] 2133         CALL     QBRAN
      008C2D 8C D3                 2134         .word      PARS8
      008C2F CD 86 F0         [ 4] 2135         CALL     ONEM
      008C32 CD 83 32         [ 4] 2136         CALL     TEMP
      008C35 CD 81 BB         [ 4] 2137         CALL     AT
      008C38 CD 87 0A         [ 4] 2138         CALL     BLANK
      008C3B CD 84 91         [ 4] 2139         CALL     EQUAL
      008C3E CD 81 66         [ 4] 2140         CALL     QBRAN
      008C41 8C 74                 2141         .word      PARS3
      008C43 CD 82 31         [ 4] 2142         CALL     TOR
      008C46 CD 87 0A         [ 4] 2143 PARS1:  CALL     BLANK
      008C49 CD 82 92         [ 4] 2144         CALL     OVER
      008C4C CD 81 D9         [ 4] 2145         CALL     CAT     ;skip leading blanks ONLY
      008C4F CD 84 69         [ 4] 2146         CALL     SUBB
      008C52 CD 82 A1         [ 4] 2147         CALL     ZLESS
      008C55 CD 84 25         [ 4] 2148         CALL     INVER
      008C58 CD 81 66         [ 4] 2149         CALL     QBRAN
      008C5B 8C 71                 2150         .word      PARS2
      008C5D CD 86 E3         [ 4] 2151         CALL     ONEP
      008C60 CD 81 47         [ 4] 2152         CALL     DONXT
      008C63 8C 46                 2153         .word      PARS1
      008C65 CD 82 09         [ 4] 2154         CALL     RFROM
      008C68 CD 82 5E         [ 4] 2155         CALL     DROP
      008C6B CD 87 17         [ 4] 2156         CALL     ZERO
      008C6E CC 82 68         [ 2] 2157         JP     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008C71 CD 82 09         [ 4] 2158 PARS2:  CALL     RFROM
      008C74 CD 82 92         [ 4] 2159 PARS3:  CALL     OVER
      008C77 CD 82 78         [ 4] 2160         CALL     SWAPP
      008C7A CD 82 31         [ 4] 2161         CALL     TOR
      008C7D CD 83 32         [ 4] 2162 PARS4:  CALL     TEMP
      008C80 CD 81 BB         [ 4] 2163         CALL     AT
      008C83 CD 82 92         [ 4] 2164         CALL     OVER
      008C86 CD 81 D9         [ 4] 2165         CALL     CAT
      008C89 CD 84 69         [ 4] 2166         CALL     SUBB    ;scan for delimiter
      008C8C CD 83 32         [ 4] 2167         CALL     TEMP
      008C8F CD 81 BB         [ 4] 2168         CALL     AT
      008C92 CD 87 0A         [ 4] 2169         CALL     BLANK
      008C95 CD 84 91         [ 4] 2170         CALL     EQUAL
      008C98 CD 81 66         [ 4] 2171         CALL     QBRAN
      008C9B 8C A0                 2172         .word      PARS5
      008C9D CD 82 A1         [ 4] 2173         CALL     ZLESS
      008CA0 CD 81 66         [ 4] 2174 PARS5:  CALL     QBRAN
      008CA3 8C B5                 2175         .word      PARS6
      008CA5 CD 86 E3         [ 4] 2176         CALL     ONEP
      008CA8 CD 81 47         [ 4] 2177         CALL     DONXT
      008CAB 8C 7D                 2178         .word      PARS4
      008CAD CD 82 68         [ 4] 2179         CALL     DUPP
      008CB0 CD 82 31         [ 4] 2180         CALL     TOR
      008CB3 20 0F            [ 2] 2181         JRA     PARS7
      008CB5 CD 82 09         [ 4] 2182 PARS6:  CALL     RFROM
      008CB8 CD 82 5E         [ 4] 2183         CALL     DROP
      008CBB CD 82 68         [ 4] 2184         CALL     DUPP
      008CBE CD 86 E3         [ 4] 2185         CALL     ONEP
      008CC1 CD 82 31         [ 4] 2186         CALL     TOR
      008CC4 CD 82 92         [ 4] 2187 PARS7:  CALL     OVER
      008CC7 CD 84 69         [ 4] 2188         CALL     SUBB
      008CCA CD 82 09         [ 4] 2189         CALL     RFROM
      008CCD CD 82 09         [ 4] 2190         CALL     RFROM
      008CD0 CC 84 69         [ 2] 2191         JP     SUBB
      008CD3 CD 82 92         [ 4] 2192 PARS8:  CALL     OVER
      008CD6 CD 82 09         [ 4] 2193         CALL     RFROM
      008CD9 CC 84 69         [ 2] 2194         JP     SUBB
                                   2195 
                                   2196 ;       PARSE   ( c -- b u ; <string> )
                                   2197 ;       Scan input stream and return
                                   2198 ;       counted string delimited by c.
      008CDC 8C 15                 2199         .word      LINK
                           000C5E  2200 LINK = . 
      008CDE 05                    2201         .byte      5
      008CDF 50 41 52 53 45        2202         .ascii     "PARSE"
      008CE4                       2203 PARSE:
      008CE4 CD 82 31         [ 4] 2204         CALL     TOR
      008CE7 CD 88 0D         [ 4] 2205         CALL     TIB
      008CEA CD 83 41         [ 4] 2206         CALL     INN
      008CED CD 81 BB         [ 4] 2207         CALL     AT
      008CF0 CD 84 0B         [ 4] 2208         CALL     PLUS    ;current input buffer pointer
      008CF3 CD 83 51         [ 4] 2209         CALL     NTIB
      008CF6 CD 81 BB         [ 4] 2210         CALL     AT
      008CF9 CD 83 41         [ 4] 2211         CALL     INN
      008CFC CD 81 BB         [ 4] 2212         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008CFF CD 84 69         [ 4] 2213         CALL     SUBB    ;remaining count
      008D02 CD 82 09         [ 4] 2214         CALL     RFROM
      008D05 CD 8C 1B         [ 4] 2215         CALL     PARS
      008D08 CD 83 41         [ 4] 2216         CALL     INN
      008D0B CC 87 9B         [ 2] 2217         JP     PSTOR
                                   2218 
                                   2219 ;       .(      ( -- )
                                   2220 ;       Output following string up to next ) .
      008D0E 8C DE                 2221         .word      LINK
                           000C90  2222 LINK = . 
      008D10 82                    2223 	.byte      IMEDD+2
      008D11 2E 28                 2224         .ascii     ".("
      008D13                       2225 DOTPR:
      008D13 CD 81 2F         [ 4] 2226         CALL     DOLIT
      008D16 00 29                 2227         .word     41	; ")"
      008D18 CD 8C E4         [ 4] 2228         CALL     PARSE
      008D1B CC 8B 31         [ 2] 2229         JP     TYPES
                                   2230 
                                   2231 ;       (       ( -- )
                                   2232 ;       Ignore following string up to next ).
                                   2233 ;       A comment.
      008D1E 8D 10                 2234         .word      LINK
                           000CA0  2235 LINK = . 
      008D20 81                    2236 	.byte      IMEDD+1
      008D21 28                    2237         .ascii     "("
      008D22                       2238 PAREN:
      008D22 CD 81 2F         [ 4] 2239         CALL     DOLIT
      008D25 00 29                 2240         .word     41	; ")"
      008D27 CD 8C E4         [ 4] 2241         CALL     PARSE
      008D2A CC 83 EB         [ 2] 2242         JP     DDROP
                                   2243 
                                   2244 ;       \       ( -- )
                                   2245 ;       Ignore following text till
                                   2246 ;       end of line.
      008D2D 8D 20                 2247         .word      LINK
                           000CAF  2248 LINK = . 
      008D2F 81                    2249 			.byte      IMEDD+1
      008D30 5C 5C                 2250         .ascii     "\\"
      008D32                       2251 BKSLA:
      008D32 CD 83 51         [ 4] 2252         CALL     NTIB
      008D35 CD 81 BB         [ 4] 2253         CALL     AT
      008D38 CD 83 41         [ 4] 2254         CALL     INN
      008D3B CC 81 A4         [ 2] 2255         JP     STORE
                                   2256 
                                   2257 ;       WORD    ( c -- a ; <string> )
                                   2258 ;       Parse a word from input stream
                                   2259 ;       and copy it to code dictionary.
      008D3E 8D 2F                 2260         .word      LINK
                           000CC0  2261 LINK = . 
      008D40 04                    2262         .byte      4
      008D41 57 4F 52 44           2263         .ascii     "WORD"
      008D45                       2264 WORDD:
      008D45 CD 8C E4         [ 4] 2265         CALL     PARSE
      008D48 CD 87 F0         [ 4] 2266         CALL     HERE
      008D4B CD 86 B8         [ 4] 2267         CALL     CELLP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008D4E CC 88 9D         [ 2] 2268         JP     PACKS
                                   2269 
                                   2270 ;       TOKEN   ( -- a ; <string> )
                                   2271 ;       Parse a word from input stream
                                   2272 ;       and copy it to name dictionary.
      008D51 8D 40                 2273         .word      LINK
                           000CD3  2274 LINK = . 
      008D53 05                    2275         .byte      5
      008D54 54 4F 4B 45 4E        2276         .ascii     "TOKEN"
      008D59                       2277 TOKEN:
      008D59 CD 87 0A         [ 4] 2278         CALL     BLANK
      008D5C CC 8D 45         [ 2] 2279         JP     WORDD
                                   2280 
                                   2281 ;; Dictionary search
                                   2282 
                                   2283 ;       NAME>   ( na -- ca )
                                   2284 ;       Return a code address given
                                   2285 ;       a name address.
      008D5F 8D 53                 2286         .word      LINK
                           000CE1  2287 LINK = . 
      008D61 05                    2288         .byte      5
      008D62 4E 41 4D 45 3E        2289         .ascii     "NAME>"
      008D67                       2290 NAMET:
      008D67 CD 87 DD         [ 4] 2291         CALL     COUNT
      008D6A CD 81 2F         [ 4] 2292         CALL     DOLIT
      008D6D 00 1F                 2293         .word      31
      008D6F CD 82 B4         [ 4] 2294         CALL     ANDD
      008D72 CC 84 0B         [ 2] 2295         JP     PLUS
                                   2296 
                                   2297 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   2298 ;       Compare u cells in two
                                   2299 ;       strings. Return 0 if identical.
      008D75 8D 61                 2300         .word      LINK
                           000CF7  2301 LINK = . 
      008D77 05                    2302         .byte       5
      008D78 53 41 4D 45 3F        2303         .ascii     "SAME?"
      008D7D                       2304 SAMEQ:
      008D7D CD 86 F0         [ 4] 2305         CALL     ONEM
      008D80 CD 82 31         [ 4] 2306         CALL     TOR
      008D83 20 29            [ 2] 2307         JRA     SAME2
      008D85 CD 82 92         [ 4] 2308 SAME1:  CALL     OVER
      008D88 CD 82 1C         [ 4] 2309         CALL     RAT
      008D8B CD 84 0B         [ 4] 2310         CALL     PLUS
      008D8E CD 81 D9         [ 4] 2311         CALL     CAT
      008D91 CD 82 92         [ 4] 2312         CALL     OVER
      008D94 CD 82 1C         [ 4] 2313         CALL     RAT
      008D97 CD 84 0B         [ 4] 2314         CALL     PLUS
      008D9A CD 81 D9         [ 4] 2315         CALL     CAT
      008D9D CD 84 69         [ 4] 2316         CALL     SUBB
      008DA0 CD 83 B2         [ 4] 2317         CALL     QDUP
      008DA3 CD 81 66         [ 4] 2318         CALL     QBRAN
      008DA6 8D AE                 2319         .word      SAME2
      008DA8 CD 82 09         [ 4] 2320         CALL     RFROM
      008DAB CC 82 5E         [ 2] 2321         JP     DROP
      008DAE CD 81 47         [ 4] 2322 SAME2:  CALL     DONXT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008DB1 8D 85                 2323         .word      SAME1
      008DB3 CC 87 17         [ 2] 2324         JP     ZERO
                                   2325 
                                   2326 ;       find    ( a va -- ca na | a F )
                                   2327 ;       Search vocabulary for string.
                                   2328 ;       Return ca and na if succeeded.
      008DB6 8D 77                 2329         .word      LINK
                           000D38  2330 LINK = . 
      008DB8 04                    2331         .byte      4
      008DB9 66 69 6E 64           2332         .ascii     "find"
      008DBD                       2333 FIND:
      008DBD CD 82 78         [ 4] 2334         CALL     SWAPP
      008DC0 CD 82 68         [ 4] 2335         CALL     DUPP
      008DC3 CD 81 D9         [ 4] 2336         CALL     CAT
      008DC6 CD 83 32         [ 4] 2337         CALL     TEMP
      008DC9 CD 81 A4         [ 4] 2338         CALL     STORE
      008DCC CD 82 68         [ 4] 2339         CALL     DUPP
      008DCF CD 81 BB         [ 4] 2340         CALL     AT
      008DD2 CD 82 31         [ 4] 2341         CALL     TOR
      008DD5 CD 86 B8         [ 4] 2342         CALL     CELLP
      008DD8 CD 82 78         [ 4] 2343         CALL     SWAPP
      008DDB CD 81 BB         [ 4] 2344 FIND1:  CALL     AT
      008DDE CD 82 68         [ 4] 2345         CALL     DUPP
      008DE1 CD 81 66         [ 4] 2346         CALL     QBRAN
      008DE4 8E 1A                 2347         .word      FIND6
      008DE6 CD 82 68         [ 4] 2348         CALL     DUPP
      008DE9 CD 81 BB         [ 4] 2349         CALL     AT
      008DEC CD 81 2F         [ 4] 2350         CALL     DOLIT
      008DEF 1F 7F                 2351         .word      MASKK
      008DF1 CD 82 B4         [ 4] 2352         CALL     ANDD
      008DF4 CD 82 1C         [ 4] 2353         CALL     RAT
      008DF7 CD 82 DD         [ 4] 2354         CALL     XORR
      008DFA CD 81 66         [ 4] 2355         CALL     QBRAN
      008DFD 8E 09                 2356         .word      FIND2
      008DFF CD 86 B8         [ 4] 2357         CALL     CELLP
      008E02 CD 81 2F         [ 4] 2358         CALL     DOLIT
      008E05 FF FF                 2359         .word     0xFFFF
      008E07 20 0C            [ 2] 2360         JRA     FIND3
      008E09 CD 86 B8         [ 4] 2361 FIND2:  CALL     CELLP
      008E0C CD 83 32         [ 4] 2362         CALL     TEMP
      008E0F CD 81 BB         [ 4] 2363         CALL     AT
      008E12 CD 8D 7D         [ 4] 2364         CALL     SAMEQ
      008E15 CD 81 7D         [ 4] 2365 FIND3:  CALL     BRAN
      008E18 8E 29                 2366         .word      FIND4
      008E1A CD 82 09         [ 4] 2367 FIND6:  CALL     RFROM
      008E1D CD 82 5E         [ 4] 2368         CALL     DROP
      008E20 CD 82 78         [ 4] 2369         CALL     SWAPP
      008E23 CD 86 C7         [ 4] 2370         CALL     CELLM
      008E26 CC 82 78         [ 2] 2371         JP     SWAPP
      008E29 CD 81 66         [ 4] 2372 FIND4:  CALL     QBRAN
      008E2C 8E 36                 2373         .word      FIND5
      008E2E CD 86 C7         [ 4] 2374         CALL     CELLM
      008E31 CD 86 C7         [ 4] 2375         CALL     CELLM
      008E34 20 A5            [ 2] 2376         JRA     FIND1
      008E36 CD 82 09         [ 4] 2377 FIND5:  CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008E39 CD 82 5E         [ 4] 2378         CALL     DROP
      008E3C CD 82 78         [ 4] 2379         CALL     SWAPP
      008E3F CD 82 5E         [ 4] 2380         CALL     DROP
      008E42 CD 86 C7         [ 4] 2381         CALL     CELLM
      008E45 CD 82 68         [ 4] 2382         CALL     DUPP
      008E48 CD 8D 67         [ 4] 2383         CALL     NAMET
      008E4B CC 82 78         [ 2] 2384         JP     SWAPP
                                   2385 
                                   2386 ;       NAME?   ( a -- ca na | a F )
                                   2387 ;       Search vocabularies for a string.
      008E4E 8D B8                 2388         .word      LINK
                           000DD0  2389 LINK = . 
      008E50 05                    2390         .byte      5
      008E51 4E 41 4D 45 3F        2391         .ascii     "NAME?"
      008E56                       2392 NAMEQ:
      008E56 CD 83 84         [ 4] 2393         CALL     CNTXT
      008E59 CC 8D BD         [ 2] 2394         JP     FIND
                                   2395 
                                   2396 ;; Terminal response
                                   2397 
                                   2398 ;       ^H      ( bot eot cur -- bot eot cur )
                                   2399 ;       Backup cursor by one character.
      008E5C 8E 50                 2400         .word      LINK
                           000DDE  2401 LINK = . 
      008E5E 02                    2402         .byte      2
      008E5F 5E 68                 2403         .ascii     "^h"
      008E61                       2404 BKSP:
      008E61 CD 82 31         [ 4] 2405         CALL     TOR
      008E64 CD 82 92         [ 4] 2406         CALL     OVER
      008E67 CD 82 09         [ 4] 2407         CALL     RFROM
      008E6A CD 82 78         [ 4] 2408         CALL     SWAPP
      008E6D CD 82 92         [ 4] 2409         CALL     OVER
      008E70 CD 82 DD         [ 4] 2410         CALL     XORR
      008E73 CD 81 66         [ 4] 2411         CALL     QBRAN
      008E76 8E 91                 2412         .word      BACK1
      008E78 CD 81 2F         [ 4] 2413         CALL     DOLIT
      008E7B 00 08                 2414         .word      BKSPP
      008E7D CD 81 19         [ 4] 2415         CALL     EMIT
      008E80 CD 86 F0         [ 4] 2416         CALL     ONEM
      008E83 CD 87 0A         [ 4] 2417         CALL     BLANK
      008E86 CD 81 19         [ 4] 2418         CALL     EMIT
      008E89 CD 81 2F         [ 4] 2419         CALL     DOLIT
      008E8C 00 08                 2420         .word      BKSPP
      008E8E CC 81 19         [ 2] 2421         JP     EMIT
      008E91 81               [ 4] 2422 BACK1:  RET
                                   2423 
                                   2424 ;       TAP     ( bot eot cur c -- bot eot cur )
                                   2425 ;       Accept and echo key stroke
                                   2426 ;       and bump cursor.
      008E92 8E 5E                 2427         .word      LINK
                           000E14  2428 LINK = . 
      008E94 03                    2429         .byte      3
      008E95 54 41 50              2430         .ascii     "TAP"
      008E98                       2431 TAP:
      008E98 CD 82 68         [ 4] 2432         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008E9B CD 81 19         [ 4] 2433         CALL     EMIT
      008E9E CD 82 92         [ 4] 2434         CALL     OVER
      008EA1 CD 81 C8         [ 4] 2435         CALL     CSTOR
      008EA4 CC 86 E3         [ 2] 2436         JP     ONEP
                                   2437 
                                   2438 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   2439 ;       Process a key stroke,
                                   2440 ;       CR or backspace.
      008EA7 8E 94                 2441         .word      LINK
                           000E29  2442 LINK = . 
      008EA9 04                    2443         .byte      4
      008EAA 6B 54 41 50           2444         .ascii     "kTAP"
      008EAE                       2445 KTAP:
      008EAE CD 82 68         [ 4] 2446         CALL     DUPP
      008EB1 CD 81 2F         [ 4] 2447         CALL     DOLIT
      008EB4 00 0D                 2448         .word      CRR
      008EB6 CD 82 DD         [ 4] 2449         CALL     XORR
      008EB9 CD 81 66         [ 4] 2450         CALL     QBRAN
      008EBC 8E D4                 2451         .word      KTAP2
      008EBE CD 81 2F         [ 4] 2452         CALL     DOLIT
      008EC1 00 08                 2453         .word      BKSPP
      008EC3 CD 82 DD         [ 4] 2454         CALL     XORR
      008EC6 CD 81 66         [ 4] 2455         CALL     QBRAN
      008EC9 8E D1                 2456         .word      KTAP1
      008ECB CD 87 0A         [ 4] 2457         CALL     BLANK
      008ECE CC 8E 98         [ 2] 2458         JP     TAP
      008ED1 CC 8E 61         [ 2] 2459 KTAP1:  JP     BKSP
      008ED4 CD 82 5E         [ 4] 2460 KTAP2:  CALL     DROP
      008ED7 CD 82 78         [ 4] 2461         CALL     SWAPP
      008EDA CD 82 5E         [ 4] 2462         CALL     DROP
      008EDD CC 82 68         [ 2] 2463         JP     DUPP
                                   2464 
                                   2465 ;       accept  ( b u -- b u )
                                   2466 ;       Accept characters to input
                                   2467 ;       buffer. Return with actual count.
      008EE0 8E A9                 2468         .word      LINK
                           000E62  2469 LINK = . 
      008EE2 06                    2470         .byte      6
      008EE3 41 43 43 45 50 54     2471         .ascii     "ACCEPT"
      008EE9                       2472 ACCEP:
      008EE9 CD 82 92         [ 4] 2473         CALL     OVER
      008EEC CD 84 0B         [ 4] 2474         CALL     PLUS
      008EEF CD 82 92         [ 4] 2475         CALL     OVER
      008EF2 CD 83 F6         [ 4] 2476 ACCP1:  CALL     DDUP
      008EF5 CD 82 DD         [ 4] 2477         CALL     XORR
      008EF8 CD 81 66         [ 4] 2478         CALL     QBRAN
      008EFB 8F 1D                 2479         .word      ACCP4
      008EFD CD 8A D5         [ 4] 2480         CALL     KEY
      008F00 CD 82 68         [ 4] 2481         CALL     DUPP
      008F03 CD 87 0A         [ 4] 2482         CALL     BLANK
      008F06 CD 81 2F         [ 4] 2483         CALL     DOLIT
      008F09 00 7F                 2484         .word      127
      008F0B CD 85 2B         [ 4] 2485         CALL     WITHI
      008F0E CD 81 66         [ 4] 2486         CALL     QBRAN
      008F11 8F 18                 2487         .word      ACCP2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008F13 CD 8E 98         [ 4] 2488         CALL     TAP
      008F16 20 03            [ 2] 2489         JRA     ACCP3
      008F18 CD 8E AE         [ 4] 2490 ACCP2:  CALL     KTAP
      008F1B 20 D5            [ 2] 2491 ACCP3:  JRA     ACCP1
      008F1D CD 82 5E         [ 4] 2492 ACCP4:  CALL     DROP
      008F20 CD 82 92         [ 4] 2493         CALL     OVER
      008F23 CC 84 69         [ 2] 2494         JP     SUBB
                                   2495 
                                   2496 ;       QUERY   ( -- )
                                   2497 ;       Accept input stream to
                                   2498 ;       terminal input buffer.
      008F26 8E E2                 2499         .word      LINK
                                   2500         
                           000EA8  2501 LINK = . 
      008F28 05                    2502         .byte      5
      008F29 51 55 45 52 59        2503         .ascii     "QUERY"
      008F2E                       2504 QUERY:
      008F2E CD 88 0D         [ 4] 2505         CALL     TIB
      008F31 CD 81 2F         [ 4] 2506         CALL     DOLIT
      008F34 00 50                 2507         .word      80
      008F36 CD 8E E9         [ 4] 2508         CALL     ACCEP
      008F39 CD 83 51         [ 4] 2509         CALL     NTIB
      008F3C CD 81 A4         [ 4] 2510         CALL     STORE
      008F3F CD 82 5E         [ 4] 2511         CALL     DROP
      008F42 CD 87 17         [ 4] 2512         CALL     ZERO
      008F45 CD 83 41         [ 4] 2513         CALL     INN
      008F48 CC 81 A4         [ 2] 2514         JP     STORE
                                   2515 
                                   2516 ;       ABORT   ( -- )
                                   2517 ;       Reset data stack and
                                   2518 ;       jump to QUIT.
      008F4B 8F 28                 2519         .word      LINK
                           000ECD  2520 LINK = . 
      008F4D 05                    2521         .byte      5
      008F4E 41 42 4F 52 54        2522         .ascii     "ABORT"
      008F53                       2523 ABORT:
      008F53 CD 90 4A         [ 4] 2524         CALL     PRESE
      008F56 CC 90 67         [ 2] 2525         JP     QUIT
                                   2526 
                                   2527 ;       abort"  ( f -- )
                                   2528 ;       Run time routine of ABORT".
                                   2529 ;       Abort with a message.
      008F59 8F 4D                 2530         .word      LINK
                           000EDB  2531 LINK = . 
      008F5B 46                    2532 	.byte      COMPO+6
      008F5C 61 62 6F 72 74        2533         .ascii     "abort"
      008F61 22                    2534         .byte      '"'
      008F62                       2535 ABORQ:
      008F62 CD 81 66         [ 4] 2536         CALL     QBRAN
      008F65 8F 81                 2537         .word      ABOR2   ;text flag
      008F67 CD 8B 65         [ 4] 2538         CALL     DOSTR
      008F6A CD 8B 07         [ 4] 2539 ABOR1:  CALL     SPACE
      008F6D CD 87 DD         [ 4] 2540         CALL     COUNT
      008F70 CD 8B 31         [ 4] 2541         CALL     TYPES
      008F73 CD 81 2F         [ 4] 2542         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008F76 00 3F                 2543         .word     63 ; "?"
      008F78 CD 81 19         [ 4] 2544         CALL     EMIT
      008F7B CD 8B 4F         [ 4] 2545         CALL     CR
      008F7E CC 8F 53         [ 2] 2546         JP     ABORT   ;pass error string
      008F81 CD 8B 65         [ 4] 2547 ABOR2:  CALL     DOSTR
      008F84 CC 82 5E         [ 2] 2548         JP     DROP
                                   2549 
                                   2550 ;; The text interpreter
                                   2551 
                                   2552 ;       $INTERPRET      ( a -- )
                                   2553 ;       Interpret a word. If failed,
                                   2554 ;       try to convert it to an integer.
      008F87 8F 5B                 2555         .word      LINK
                           000F09  2556 LINK = . 
      008F89 0A                    2557         .byte      10
      008F8A 24 49 4E 54 45 52 50  2558         .ascii     "$INTERPRET"
             52 45 54
      008F94                       2559 INTER:
      008F94 CD 8E 56         [ 4] 2560         CALL     NAMEQ
      008F97 CD 83 B2         [ 4] 2561         CALL     QDUP    ;?defined
      008F9A CD 81 66         [ 4] 2562         CALL     QBRAN
      008F9D 8F BE                 2563         .word      INTE1
      008F9F CD 81 BB         [ 4] 2564         CALL     AT
      008FA2 CD 81 2F         [ 4] 2565         CALL     DOLIT
      008FA5 40 00                 2566 		.word       0x4000	; COMPO*256
      008FA7 CD 82 B4         [ 4] 2567         CALL     ANDD    ;?compile only lexicon bits
      008FAA CD 8F 62         [ 4] 2568         CALL     ABORQ
      008FAD 0D                    2569         .byte      13
      008FAE 20 63 6F 6D 70 69 6C  2570         .ascii     " compile only"
             65 20 6F 6E 6C 79
      008FBB CC 81 8D         [ 2] 2571         JP     EXECU
      008FBE CD 8A 02         [ 4] 2572 INTE1:  CALL     NUMBQ   ;convert a number
      008FC1 CD 81 66         [ 4] 2573         CALL     QBRAN
      008FC4 8F 6A                 2574         .word      ABOR1
      008FC6 81               [ 4] 2575         RET
                                   2576 
                                   2577 ;       [       ( -- )
                                   2578 ;       Start  text interpreter.
      008FC7 8F 89                 2579         .word      LINK
                           000F49  2580 LINK = . 
      008FC9 81                    2581 	.byte      IMEDD+1
      008FCA 5B                    2582         .ascii     "["
      008FCB                       2583 LBRAC:
      008FCB CD 81 2F         [ 4] 2584         CALL     DOLIT
      008FCE 8F 94                 2585         .word      INTER
      008FD0 CD 83 62         [ 4] 2586         CALL     TEVAL
      008FD3 CC 81 A4         [ 2] 2587         JP     STORE
                                   2588 
                                   2589 ;       .OK     ( -- )
                                   2590 ;       Display 'ok' while interpreting.
      008FD6 8F C9                 2591         .word      LINK
                           000F58  2592 LINK = . 
      008FD8 03                    2593         .byte      3
      008FD9 2E 4F 4B              2594         .ascii     ".OK"
      008FDC                       2595 DOTOK:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008FDC CD 81 2F         [ 4] 2596         CALL     DOLIT
      008FDF 8F 94                 2597         .word      INTER
      008FE1 CD 83 62         [ 4] 2598         CALL     TEVAL
      008FE4 CD 81 BB         [ 4] 2599         CALL     AT
      008FE7 CD 84 91         [ 4] 2600         CALL     EQUAL
      008FEA CD 81 66         [ 4] 2601         CALL     QBRAN
      008FED 8F F6                 2602         .word      DOTO1
      008FEF CD 8B 8E         [ 4] 2603         CALL     DOTQP
      008FF2 03                    2604         .byte      3
      008FF3 20 6F 6B              2605         .ascii     " ok"
      008FF6 CC 8B 4F         [ 2] 2606 DOTO1:  JP     CR
                                   2607 
                                   2608 ;       ?STACK  ( -- )
                                   2609 ;       Abort if stack underflows.
      008FF9 8F D8                 2610         .word      LINK
                           000F7B  2611 LINK = . 
      008FFB 06                    2612         .byte      6
      008FFC 3F 53 54 41 43 4B     2613         .ascii     "?STACK"
      009002                       2614 QSTAC:
      009002 CD 87 6D         [ 4] 2615         CALL     DEPTH
      009005 CD 82 A1         [ 4] 2616         CALL     ZLESS   ;check only for underflow
      009008 CD 8F 62         [ 4] 2617         CALL     ABORQ
      00900B 0B                    2618         .byte      11
      00900C 20 75 6E 64 65 72 66  2619         .ascii     " underflow "
             6C 6F 77 20
      009017 81               [ 4] 2620         RET
                                   2621 
                                   2622 ;       EVAL    ( -- )
                                   2623 ;       Interpret  input stream.
      009018 8F FB                 2624         .word      LINK
                           000F9A  2625 LINK = . 
      00901A 04                    2626         .byte      4
      00901B 45 56 41 4C           2627         .ascii     "EVAL"
      00901F                       2628 EVAL:
      00901F CD 8D 59         [ 4] 2629 EVAL1:  CALL     TOKEN
      009022 CD 82 68         [ 4] 2630         CALL     DUPP
      009025 CD 81 D9         [ 4] 2631         CALL     CAT     ;?input stream empty
      009028 CD 81 66         [ 4] 2632         CALL     QBRAN
      00902B 90 3B                 2633         .word      EVAL2
      00902D CD 83 62         [ 4] 2634         CALL     TEVAL
      009030 CD 88 21         [ 4] 2635         CALL     ATEXE
      009033 CD 90 02         [ 4] 2636         CALL     QSTAC   ;evaluate input, check stack
      009036 CD 81 7D         [ 4] 2637         CALL     BRAN
      009039 90 1F                 2638         .word      EVAL1
      00903B CD 82 5E         [ 4] 2639 EVAL2:  CALL     DROP
      00903E CC 8F DC         [ 2] 2640         JP     DOTOK
                                   2641 
                                   2642 ;       PRESET  ( -- )
                                   2643 ;       Reset data stack pointer and
                                   2644 ;       terminal input buffer.
      009041 90 1A                 2645         .word      LINK
                           000FC3  2646 LINK = . 
      009043 06                    2647         .byte      6
      009044 50 52 45 53 45 54     2648         .ascii     "PRESET"
      00904A                       2649 PRESE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      00904A CD 81 2F         [ 4] 2650         CALL     DOLIT
      00904D 16 F0                 2651         .word      SPP
      00904F CD 82 55         [ 4] 2652         CALL     SPSTO
      009052 CD 81 2F         [ 4] 2653         CALL     DOLIT
      009055 17 00                 2654         .word      TIBB
      009057 CD 83 51         [ 4] 2655         CALL     NTIB
      00905A CD 86 B8         [ 4] 2656         CALL     CELLP
      00905D CC 81 A4         [ 2] 2657         JP     STORE
                                   2658 
                                   2659 ;       QUIT    ( -- )
                                   2660 ;       Reset return stack pointer
                                   2661 ;       and start text interpreter.
      009060 90 43                 2662         .word      LINK
                           000FE2  2663 LINK = . 
      009062 04                    2664         .byte      4
      009063 51 55 49 54           2665         .ascii     "QUIT"
      009067                       2666 QUIT:
      009067 CD 81 2F         [ 4] 2667         CALL     DOLIT
      00906A 17 FF                 2668         .word      RPP
      00906C CD 81 F6         [ 4] 2669         CALL     RPSTO   ;reset return stack pointer
      00906F CD 8F CB         [ 4] 2670 QUIT1:  CALL     LBRAC   ;start interpretation
      009072 CD 8F 2E         [ 4] 2671 QUIT2:  CALL     QUERY   ;get input
      009075 CD 90 1F         [ 4] 2672         CALL     EVAL
      009078 20 F8            [ 2] 2673         JRA     QUIT2   ;continue till error
                                   2674 
                                   2675 ;; The compiler
                                   2676 
                                   2677 ;       '       ( -- ca )
                                   2678 ;       Search vocabularies for
                                   2679 ;       next word in input stream.
      00907A 90 62                 2680         .word      LINK
                           000FFC  2681 LINK = . 
      00907C 01                    2682         .byte      1
      00907D 27                    2683         .ascii     "'"
      00907E                       2684 TICK:
      00907E CD 8D 59         [ 4] 2685         CALL     TOKEN
      009081 CD 8E 56         [ 4] 2686         CALL     NAMEQ   ;?defined
      009084 CD 81 66         [ 4] 2687         CALL     QBRAN
      009087 8F 6A                 2688         .word      ABOR1
      009089 81               [ 4] 2689         RET     ;yes, push code address
                                   2690 
                                   2691 ;       ALLOT   ( n -- )
                                   2692 ;       Allocate n bytes to  code dictionary.
      00908A 90 7C                 2693         .word      LINK
                           00100C  2694 LINK = . 
      00908C 05                    2695         .byte      5
      00908D 41 4C 4C 4F 54        2696         .ascii     "ALLOT"
      009092                       2697 ALLOT:
      009092 CD 83 92         [ 4] 2698         CALL     CPP
      009095 CC 87 9B         [ 2] 2699         JP     PSTOR
                                   2700 
                                   2701 ;       ,       ( w -- )
                                   2702 ;         Compile an integer into
                                   2703 ;         code dictionary.
      009098 90 8C                 2704         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                           00101A  2705 LINK = . 
      00909A 01                    2706         .byte      1
      00909B 2C                    2707         .ascii     ","
      00909C                       2708 COMMA:
      00909C CD 87 F0         [ 4] 2709         CALL     HERE
      00909F CD 82 68         [ 4] 2710         CALL     DUPP
      0090A2 CD 86 B8         [ 4] 2711         CALL     CELLP   ;cell boundary
      0090A5 CD 83 92         [ 4] 2712         CALL     CPP
      0090A8 CD 81 A4         [ 4] 2713         CALL     STORE
      0090AB CC 81 A4         [ 2] 2714         JP     STORE
                                   2715 
                                   2716 ;       C,      ( c -- )
                                   2717 ;       Compile a byte into
                                   2718 ;       code dictionary.
      0090AE 90 9A                 2719        .word      LINK
                           001030  2720 LINK = . 
      0090B0 02                    2721         .byte      2
      0090B1 43 2C                 2722         .ascii     "C,"
      0090B3                       2723 CCOMMA:
      0090B3 CD 87 F0         [ 4] 2724         CALL     HERE
      0090B6 CD 82 68         [ 4] 2725         CALL     DUPP
      0090B9 CD 86 E3         [ 4] 2726         CALL     ONEP
      0090BC CD 83 92         [ 4] 2727         CALL     CPP
      0090BF CD 81 A4         [ 4] 2728         CALL     STORE
      0090C2 CC 81 C8         [ 2] 2729         JP     CSTOR
                                   2730 
                                   2731 ;       [COMPILE]       ( -- ; <string> )
                                   2732 ;       Compile next immediate
                                   2733 ;       word into code dictionary.
      0090C5 90 B0                 2734         .word      LINK
                           001047  2735 LINK = . 
      0090C7 89                    2736 	.byte      IMEDD+9
      0090C8 5B 43 4F 4D 50 49 4C  2737         .ascii     "[COMPILE]"
             45 5D
      0090D1                       2738 BCOMP:
      0090D1 CD 90 7E         [ 4] 2739         CALL     TICK
      0090D4 CC 93 2D         [ 2] 2740         JP     JSRC
                                   2741 
                                   2742 ;       COMPILE ( -- )
                                   2743 ;       Compile next jsr in
                                   2744 ;       colon list to code dictionary.
      0090D7 90 C7                 2745         .word      LINK
                           001059  2746 LINK = . 
      0090D9 47                    2747 	.byte      COMPO+7
      0090DA 43 4F 4D 50 49 4C 45  2748         .ascii     "COMPILE"
      0090E1                       2749 COMPI:
      0090E1 CD 82 09         [ 4] 2750         CALL     RFROM
      0090E4 CD 86 E3         [ 4] 2751         CALL     ONEP
      0090E7 CD 82 68         [ 4] 2752         CALL     DUPP
      0090EA CD 81 BB         [ 4] 2753         CALL     AT
      0090ED CD 93 2D         [ 4] 2754         CALL     JSRC    ;compile subroutine
      0090F0 CD 86 B8         [ 4] 2755         CALL     CELLP
      0090F3 CC 82 31         [ 2] 2756         JP     TOR
                                   2757 
                                   2758 ;       LITERAL ( w -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2759 ;       Compile tos to dictionary
                                   2760 ;       as an integer literal.
      0090F6 90 D9                 2761         .word      LINK
                           001078  2762 LINK = . 
      0090F8 87                    2763 	.byte      IMEDD+7
      0090F9 4C 49 54 45 52 41 4C  2764         .ascii     "LITERAL"
      009100                       2765 LITER:
      009100 CD 90 E1         [ 4] 2766         CALL     COMPI
      009103 CD 81 2F         [ 4] 2767         CALL     DOLIT
      009106 CC 90 9C         [ 2] 2768         JP     COMMA
                                   2769 
                                   2770 ;       $,"     ( -- )
                                   2771 ;       Compile a literal string
                                   2772 ;       up to next " .
      009109 90 F8                 2773         .word      LINK
                           00108B  2774 LINK = . 
      00910B 03                    2775         .byte      3
      00910C 24 2C 22              2776         .byte     '$',',','"'
      00910F                       2777 STRCQ:
      00910F CD 81 2F         [ 4] 2778         CALL     DOLIT
      009112 00 22                 2779         .word     34	; "
      009114 CD 8C E4         [ 4] 2780         CALL     PARSE
      009117 CD 87 F0         [ 4] 2781         CALL     HERE
      00911A CD 88 9D         [ 4] 2782         CALL     PACKS   ;string to code dictionary
      00911D CD 87 DD         [ 4] 2783         CALL     COUNT
      009120 CD 84 0B         [ 4] 2784         CALL     PLUS    ;calculate aligned end of string
      009123 CD 83 92         [ 4] 2785         CALL     CPP
      009126 CC 81 A4         [ 2] 2786         JP     STORE
                                   2787 
                                   2788 ;; Structures
                                   2789 
                                   2790 ;       FOR     ( -- a )
                                   2791 ;       Start a FOR-NEXT loop
                                   2792 ;       structure in a colon definition.
      009129 91 0B                 2793         .word      LINK
                           0010AB  2794 LINK = . 
      00912B 83                    2795 	.byte      IMEDD+3
      00912C 46 4F 52              2796         .ascii     "FOR"
      00912F                       2797 FOR:
      00912F CD 90 E1         [ 4] 2798         CALL     COMPI
      009132 CD 82 31         [ 4] 2799         CALL     TOR
      009135 CC 87 F0         [ 2] 2800         JP     HERE
                                   2801 
                                   2802 ;       NEXT    ( a -- )
                                   2803 ;       Terminate a FOR-NEXT loop.
      009138 91 2B                 2804         .word      LINK
                           0010BA  2805 LINK = . 
      00913A 84                    2806 	.byte      IMEDD+4
      00913B 4E 45 58 54           2807         .ascii     "NEXT"
      00913F                       2808 NEXT:
      00913F CD 90 E1         [ 4] 2809         CALL     COMPI
      009142 CD 81 47         [ 4] 2810         CALL     DONXT
      009145 CC 90 9C         [ 2] 2811         JP     COMMA
                                   2812 
                                   2813 ;       BEGIN   ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2814 ;       Start an infinite or
                                   2815 ;       indefinite loop structure.
      009148 91 3A                 2816         .word      LINK
                           0010CA  2817 LINK = . 
      00914A 85                    2818 	.byte      IMEDD+5
      00914B 42 45 47 49 4E        2819         .ascii     "BEGIN"
      009150                       2820 BEGIN:
      009150 CC 87 F0         [ 2] 2821         JP     HERE
                                   2822 
                                   2823 ;       UNTIL   ( a -- )
                                   2824 ;       Terminate a BEGIN-UNTIL
                                   2825 ;       indefinite loop structure.
      009153 91 4A                 2826         .word      LINK
                           0010D5  2827 LINK = . 
      009155 85                    2828 	.byte      IMEDD+5
      009156 55 4E 54 49 4C        2829         .ascii     "UNTIL"
      00915B                       2830 UNTIL:
      00915B CD 90 E1         [ 4] 2831         CALL     COMPI
      00915E CD 81 66         [ 4] 2832         CALL     QBRAN
      009161 CC 90 9C         [ 2] 2833         JP     COMMA
                                   2834 
                                   2835 ;       AGAIN   ( a -- )
                                   2836 ;       Terminate a BEGIN-AGAIN
                                   2837 ;       infinite loop structure.
      009164 91 55                 2838         .word      LINK
                           0010E6  2839 LINK = . 
      009166 85                    2840 	.byte      IMEDD+5
      009167 41 47 41 49 4E        2841         .ascii     "AGAIN"
      00916C                       2842 AGAIN:
      00916C CD 90 E1         [ 4] 2843         CALL     COMPI
      00916F CD 81 7D         [ 4] 2844         CALL     BRAN
      009172 CC 90 9C         [ 2] 2845         JP     COMMA
                                   2846 
                                   2847 ;       IF      ( -- A )
                                   2848 ;       Begin a conditional branch.
      009175 91 66                 2849         .word      LINK
                           0010F7  2850 LINK = . 
      009177 82                    2851 	.byte      IMEDD+2
      009178 49 46                 2852         .ascii     "IF"
      00917A                       2853 IFF:
      00917A CD 90 E1         [ 4] 2854         CALL     COMPI
      00917D CD 81 66         [ 4] 2855         CALL     QBRAN
      009180 CD 87 F0         [ 4] 2856         CALL     HERE
      009183 CD 87 17         [ 4] 2857         CALL     ZERO
      009186 CC 90 9C         [ 2] 2858         JP     COMMA
                                   2859 
                                   2860 ;       THEN        ( A -- )
                                   2861 ;       Terminate a conditional branch structure.
      009189 91 77                 2862         .word      LINK
                           00110B  2863 LINK = . 
      00918B 84                    2864 	.byte      IMEDD+4
      00918C 54 48 45 4E           2865         .ascii     "THEN"
      009190                       2866 THENN:
      009190 CD 87 F0         [ 4] 2867         CALL     HERE
      009193 CD 82 78         [ 4] 2868         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      009196 CC 81 A4         [ 2] 2869         JP     STORE
                                   2870 
                                   2871 ;       ELSE        ( A -- A )
                                   2872 ;       Start the false clause in an IF-ELSE-THEN structure.
      009199 91 8B                 2873         .word      LINK
                           00111B  2874 LINK = . 
      00919B 84                    2875 	.byte      IMEDD+4
      00919C 45 4C 53 45           2876         .ascii     "ELSE"
      0091A0                       2877 ELSEE:
      0091A0 CD 90 E1         [ 4] 2878         CALL     COMPI
      0091A3 CD 81 7D         [ 4] 2879         CALL     BRAN
      0091A6 CD 87 F0         [ 4] 2880         CALL     HERE
      0091A9 CD 87 17         [ 4] 2881         CALL     ZERO
      0091AC CD 90 9C         [ 4] 2882         CALL     COMMA
      0091AF CD 82 78         [ 4] 2883         CALL     SWAPP
      0091B2 CD 87 F0         [ 4] 2884         CALL     HERE
      0091B5 CD 82 78         [ 4] 2885         CALL     SWAPP
      0091B8 CC 81 A4         [ 2] 2886         JP     STORE
                                   2887 
                                   2888 ;       AHEAD       ( -- A )
                                   2889 ;       Compile a forward branch instruction.
      0091BB 91 9B                 2890         .word      LINK
                           00113D  2891 LINK = . 
      0091BD 85                    2892 	.byte      IMEDD+5
      0091BE 41 48 45 41 44        2893         .ascii     "AHEAD"
      0091C3                       2894 AHEAD:
      0091C3 CD 90 E1         [ 4] 2895         CALL     COMPI
      0091C6 CD 81 7D         [ 4] 2896         CALL     BRAN
      0091C9 CD 87 F0         [ 4] 2897         CALL     HERE
      0091CC CD 87 17         [ 4] 2898         CALL     ZERO
      0091CF CC 90 9C         [ 2] 2899         JP     COMMA
                                   2900 
                                   2901 ;       WHILE       ( a -- A a )
                                   2902 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      0091D2 91 BD                 2903         .word      LINK
                           001154  2904 LINK = . 
      0091D4 85                    2905 	.byte      IMEDD+5
      0091D5 57 48 49 4C 45        2906         .ascii     "WHILE"
      0091DA                       2907 WHILE:
      0091DA CD 90 E1         [ 4] 2908         CALL     COMPI
      0091DD CD 81 66         [ 4] 2909         CALL     QBRAN
      0091E0 CD 87 F0         [ 4] 2910         CALL     HERE
      0091E3 CD 87 17         [ 4] 2911         CALL     ZERO
      0091E6 CD 90 9C         [ 4] 2912         CALL     COMMA
      0091E9 CC 82 78         [ 2] 2913         JP     SWAPP
                                   2914 
                                   2915 ;       REPEAT      ( A a -- )
                                   2916 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      0091EC 91 D4                 2917         .word      LINK
                           00116E  2918 LINK = . 
      0091EE 86                    2919         .byte      IMEDD+6
      0091EF 52 45 50 45 41 54     2920         .ascii     "REPEAT"
      0091F5                       2921 REPEA:
      0091F5 CD 90 E1         [ 4] 2922         CALL     COMPI
      0091F8 CD 81 7D         [ 4] 2923         CALL     BRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      0091FB CD 90 9C         [ 4] 2924         CALL     COMMA
      0091FE CD 87 F0         [ 4] 2925         CALL     HERE
      009201 CD 82 78         [ 4] 2926         CALL     SWAPP
      009204 CC 81 A4         [ 2] 2927         JP     STORE
                                   2928 
                                   2929 ;       AFT         ( a -- a A )
                                   2930 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      009207 91 EE                 2931         .word      LINK
                           001189  2932 LINK = . 
      009209 83                    2933 	.byte      IMEDD+3
      00920A 41 46 54              2934         .ascii     "AFT"
      00920D                       2935 AFT:
      00920D CD 82 5E         [ 4] 2936         CALL     DROP
      009210 CD 91 C3         [ 4] 2937         CALL     AHEAD
      009213 CD 87 F0         [ 4] 2938         CALL     HERE
      009216 CC 82 78         [ 2] 2939         JP     SWAPP
                                   2940 
                                   2941 ;       ABORT"      ( -- ; <string> )
                                   2942 ;       Conditional abort with an error message.
      009219 92 09                 2943         .word      LINK
                           00119B  2944 LINK = . 
      00921B 86                    2945 	.byte      IMEDD+6
      00921C 41 42 4F 52 54        2946         .ascii     "ABORT"
      009221 22                    2947         .byte      '"'
      009222                       2948 ABRTQ:
      009222 CD 90 E1         [ 4] 2949         CALL     COMPI
      009225 CD 8F 62         [ 4] 2950         CALL     ABORQ
      009228 CC 91 0F         [ 2] 2951         JP     STRCQ
                                   2952 
                                   2953 ;       $"     ( -- ; <string> )
                                   2954 ;       Compile an inline string literal.
      00922B 92 1B                 2955         .word      LINK
                           0011AD  2956 LINK = . 
      00922D 82                    2957 	.byte      IMEDD+2
      00922E 24 22                 2958         .byte     '$','"'
      009230                       2959 STRQ:
      009230 CD 90 E1         [ 4] 2960         CALL     COMPI
      009233 CD 8B 84         [ 4] 2961         CALL     STRQP
      009236 CC 91 0F         [ 2] 2962         JP     STRCQ
                                   2963 
                                   2964 ;       ."          ( -- ; <string> )
                                   2965 ;       Compile an inline string literal to be typed out at run time.
      009239 92 2D                 2966         .word      LINK
                           0011BB  2967 LINK = . 
      00923B 82                    2968 	.byte      IMEDD+2
      00923C 2E 22                 2969         .byte     '.','"'
      00923E                       2970 DOTQ:
      00923E CD 90 E1         [ 4] 2971         CALL     COMPI
      009241 CD 8B 8E         [ 4] 2972         CALL     DOTQP
      009244 CC 91 0F         [ 2] 2973         JP     STRCQ
                                   2974 
                                   2975 ;; Name compiler
                                   2976 
                                   2977 ;       ?UNIQUE ( a -- a )
                                   2978 ;       Display a warning message
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2979 ;       if word already exists.
      009247 92 3B                 2980         .word      LINK
                           0011C9  2981 LINK = . 
      009249 07                    2982         .byte      7
      00924A 3F 55 4E 49 51 55 45  2983         .ascii     "?UNIQUE"
      009251                       2984 UNIQU:
      009251 CD 82 68         [ 4] 2985         CALL     DUPP
      009254 CD 8E 56         [ 4] 2986         CALL     NAMEQ   ;?name exists
      009257 CD 81 66         [ 4] 2987         CALL     QBRAN
      00925A 92 70                 2988         .word      UNIQ1
      00925C CD 8B 8E         [ 4] 2989         CALL     DOTQP   ;redef are OK
      00925F 07                    2990         .byte       7
      009260 20 72 65 44 65 66 20  2991         .ascii     " reDef "       
      009267 CD 82 92         [ 4] 2992         CALL     OVER
      00926A CD 87 DD         [ 4] 2993         CALL     COUNT
      00926D CD 8B 31         [ 4] 2994         CALL     TYPES   ;just in case
      009270 CC 82 5E         [ 2] 2995 UNIQ1:  JP     DROP
                                   2996 
                                   2997 ;       $,n     ( na -- )
                                   2998 ;       Build a new dictionary name
                                   2999 ;       using string at na.
      009273 92 49                 3000         .word      LINK
                           0011F5  3001 LINK = . 
      009275 03                    3002         .byte      3
      009276 24 2C 6E              3003         .ascii     "$,n"
      009279                       3004 SNAME:
      009279 CD 82 68         [ 4] 3005         CALL     DUPP
      00927C CD 81 D9         [ 4] 3006         CALL     CAT     ;?null input
      00927F CD 81 66         [ 4] 3007         CALL     QBRAN
      009282 92 AF                 3008         .word      PNAM1
      009284 CD 92 51         [ 4] 3009         CALL     UNIQU   ;?redefinition
      009287 CD 82 68         [ 4] 3010         CALL     DUPP
      00928A CD 87 DD         [ 4] 3011         CALL     COUNT
      00928D CD 84 0B         [ 4] 3012         CALL     PLUS
      009290 CD 83 92         [ 4] 3013         CALL     CPP
      009293 CD 81 A4         [ 4] 3014         CALL     STORE
      009296 CD 82 68         [ 4] 3015         CALL     DUPP
      009299 CD 83 A2         [ 4] 3016         CALL     LAST
      00929C CD 81 A4         [ 4] 3017         CALL     STORE   ;save na for vocabulary link
      00929F CD 86 C7         [ 4] 3018         CALL     CELLM   ;link address
      0092A2 CD 83 84         [ 4] 3019         CALL     CNTXT
      0092A5 CD 81 BB         [ 4] 3020         CALL     AT
      0092A8 CD 82 78         [ 4] 3021         CALL     SWAPP
      0092AB CD 81 A4         [ 4] 3022         CALL     STORE
      0092AE 81               [ 4] 3023         RET     ;save code pointer
      0092AF CD 8B 84         [ 4] 3024 PNAM1:  CALL     STRQP
      0092B2 05                    3025         .byte      5
      0092B3 20 6E 61 6D 65        3026         .ascii     " name" ;null input
      0092B8 CC 8F 6A         [ 2] 3027         JP     ABOR1
                                   3028 
                                   3029 ;; FORTH compiler
                                   3030 
                                   3031 ;       $COMPILE        ( a -- )
                                   3032 ;       Compile next word to
                                   3033 ;       dictionary as a token or literal.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0092BB 92 75                 3034         .word      LINK
                           00123D  3035 LINK = . 
      0092BD 08                    3036         .byte      8
      0092BE 24 43 4F 4D 50 49 4C  3037         .ascii     "$COMPILE"
             45
      0092C6                       3038 SCOMP:
      0092C6 CD 8E 56         [ 4] 3039         CALL     NAMEQ
      0092C9 CD 83 B2         [ 4] 3040         CALL     QDUP    ;?defined
      0092CC CD 81 66         [ 4] 3041         CALL     QBRAN
      0092CF 92 E7                 3042         .word      SCOM2
      0092D1 CD 81 BB         [ 4] 3043         CALL     AT
      0092D4 CD 81 2F         [ 4] 3044         CALL     DOLIT
      0092D7 80 00                 3045         .word     0x8000	;  IMEDD*256
      0092D9 CD 82 B4         [ 4] 3046         CALL     ANDD    ;?immediate
      0092DC CD 81 66         [ 4] 3047         CALL     QBRAN
      0092DF 92 E4                 3048         .word      SCOM1
      0092E1 CC 81 8D         [ 2] 3049         JP     EXECU
      0092E4 CC 93 2D         [ 2] 3050 SCOM1:  JP     JSRC
      0092E7 CD 8A 02         [ 4] 3051 SCOM2:  CALL     NUMBQ   ;try to convert to number
      0092EA CD 81 66         [ 4] 3052         CALL     QBRAN
      0092ED 8F 6A                 3053         .word      ABOR1
      0092EF CC 91 00         [ 2] 3054         JP     LITER
                                   3055 
                                   3056 ;       OVERT   ( -- )
                                   3057 ;       Link a new word into vocabulary.
      0092F2 92 BD                 3058         .word      LINK
                           001274  3059 LINK = . 
      0092F4 05                    3060         .byte      5
      0092F5 4F 56 45 52 54        3061         .ascii     "OVERT"
      0092FA                       3062 OVERT:
      0092FA CD 83 A2         [ 4] 3063         CALL     LAST
      0092FD CD 81 BB         [ 4] 3064         CALL     AT
      009300 CD 83 84         [ 4] 3065         CALL     CNTXT
      009303 CC 81 A4         [ 2] 3066         JP     STORE
                                   3067 
                                   3068 ;       ;       ( -- )
                                   3069 ;       Terminate a colon definition.
      009306 92 F4                 3070         .word      LINK
                           001288  3071 LINK = . 
      009308 C1                    3072 	.byte      IMEDD+COMPO+1
      009309 3B                    3073         .ascii     ";"
      00930A                       3074 SEMIS:
      00930A CD 90 E1         [ 4] 3075         CALL     COMPI
      00930D CD 81 9D         [ 4] 3076         CALL     EXIT
      009310 CD 8F CB         [ 4] 3077         CALL     LBRAC
      009313 CC 92 FA         [ 2] 3078         JP     OVERT
                                   3079 
                                   3080 ;       ]       ( -- )
                                   3081 ;       Start compiling words in
                                   3082 ;       input stream.
      009316 93 08                 3083         .word      LINK
                           001298  3084 LINK = . 
      009318 01                    3085         .byte      1
      009319 5D                    3086         .ascii     "]"
      00931A                       3087 RBRAC:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      00931A CD 81 2F         [ 4] 3088         CALL     DOLIT
      00931D 92 C6                 3089         .word      SCOMP
      00931F CD 83 62         [ 4] 3090         CALL     TEVAL
      009322 CC 81 A4         [ 2] 3091         JP     STORE
                                   3092 
                                   3093 ;       CALL,    ( ca -- )
                                   3094 ;       Compile a subroutine call.
      009325 93 18                 3095         .word      LINK
                           0012A7  3096 LINK = . 
      009327 04                    3097         .byte      4
      009328 43 41 4C 4C 2C        3098         .ascii     "CALL,"
      00932D                       3099 JSRC:
      00932D CD 81 2F         [ 4] 3100         CALL     DOLIT
      009330 00 CD                 3101         .word     CALLL     ;CALL
      009332 CD 90 B3         [ 4] 3102         CALL     CCOMMA
      009335 CC 90 9C         [ 2] 3103         JP     COMMA
                                   3104 
                                   3105 ;       :       ( -- ; <string> )
                                   3106 ;       Start a new colon definition
                                   3107 ;       using next word as its name.
      009338 93 27                 3108         .word      LINK
                           0012BA  3109 LINK = . 
      00933A 01                    3110         .byte      1
      00933B 3A                    3111         .ascii     ":"
      00933C                       3112 COLON:
      00933C CD 8D 59         [ 4] 3113         CALL     TOKEN
      00933F CD 92 79         [ 4] 3114         CALL     SNAME
      009342 CC 93 1A         [ 2] 3115         JP     RBRAC
                                   3116 
                                   3117 ;       IMMEDIATE       ( -- )
                                   3118 ;       Make last compiled word
                                   3119 ;       an immediate word.
      009345 93 3A                 3120         .word      LINK
                           0012C7  3121 LINK = . 
      009347 09                    3122         .byte      9
      009348 49 4D 4D 45 44 49 41  3123         .ascii     "IMMEDIATE"
             54 45
      009351                       3124 IMMED:
      009351 CD 81 2F         [ 4] 3125         CALL     DOLIT
      009354 80 00                 3126         .word     0x8000	;  IMEDD*256
      009356 CD 83 A2         [ 4] 3127         CALL     LAST
      009359 CD 81 BB         [ 4] 3128         CALL     AT
      00935C CD 81 BB         [ 4] 3129         CALL     AT
      00935F CD 82 C8         [ 4] 3130         CALL     ORR
      009362 CD 83 A2         [ 4] 3131         CALL     LAST
      009365 CD 81 BB         [ 4] 3132         CALL     AT
      009368 CC 81 A4         [ 2] 3133         JP     STORE
                                   3134 
                                   3135 ;; Defining words
                                   3136 
                                   3137 ;       CREATE  ( -- ; <string> )
                                   3138 ;       Compile a new array
                                   3139 ;       without allocating space.
      00936B 93 47                 3140         .word      LINK
                           0012ED  3141 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      00936D 06                    3142         .byte      6
      00936E 43 52 45 41 54 45     3143         .ascii     "CREATE"
      009374                       3144 CREAT:
      009374 CD 8D 59         [ 4] 3145         CALL     TOKEN
      009377 CD 92 79         [ 4] 3146         CALL     SNAME
      00937A CD 92 FA         [ 4] 3147         CALL     OVERT
      00937D CD 90 E1         [ 4] 3148         CALL     COMPI
      009380 CD 83 15         [ 4] 3149         CALL     DOVAR
      009383 81               [ 4] 3150         RET
                                   3151 
                                   3152 ;       VARIABLE        ( -- ; <string> )
                                   3153 ;       Compile a new variable
                                   3154 ;       initialized to 0.
      009384 93 6D                 3155         .word      LINK
                           001306  3156 LINK = . 
      009386 08                    3157         .byte      8
      009387 56 41 52 49 41 42 4C  3158         .ascii     "VARIABLE"
             45
      00938F                       3159 VARIA:
      00938F CD 93 74         [ 4] 3160         CALL     CREAT
      009392 CD 87 17         [ 4] 3161         CALL     ZERO
      009395 CC 90 9C         [ 2] 3162         JP     COMMA
                                   3163 
                                   3164 ;; Tools
                                   3165 
                                   3166 ;       _TYPE   ( b u -- )
                                   3167 ;       Display a string. Filter
                                   3168 ;       non-printing characters.
      009398 93 86                 3169         .word      LINK
                           00131A  3170 LINK = . 
      00939A 05                    3171         .byte      5
      00939B 5F 54 59 50 45        3172         .ascii     "_TYPE"
      0093A0                       3173 UTYPE:
      0093A0 CD 82 31         [ 4] 3174         CALL     TOR     ;start count down loop
      0093A3 20 0F            [ 2] 3175         JRA     UTYP2   ;skip first pass
      0093A5 CD 82 68         [ 4] 3176 UTYP1:  CALL     DUPP
      0093A8 CD 81 D9         [ 4] 3177         CALL     CAT
      0093AB CD 87 41         [ 4] 3178         CALL     TCHAR
      0093AE CD 81 19         [ 4] 3179         CALL     EMIT    ;display only printable
      0093B1 CD 86 E3         [ 4] 3180         CALL     ONEP    ;increment address
      0093B4 CD 81 47         [ 4] 3181 UTYP2:  CALL     DONXT
      0093B7 93 A5                 3182         .word      UTYP1   ;loop till done
      0093B9 CC 82 5E         [ 2] 3183         JP     DROP
                                   3184 
                                   3185 ;       dm+     ( a u -- a )
                                   3186 ;       Dump u bytes from ,
                                   3187 ;       leaving a+u on  stack.
      0093BC 93 9A                 3188         .word      LINK
                           00133E  3189 LINK = . 
      0093BE 03                    3190         .byte      3
      0093BF 64 6D 2B              3191         .ascii     "dm+"
      0093C2                       3192 DUMPP:
      0093C2 CD 82 92         [ 4] 3193         CALL     OVER
      0093C5 CD 81 2F         [ 4] 3194         CALL     DOLIT
      0093C8 00 04                 3195         .word      4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      0093CA CD 8B B7         [ 4] 3196         CALL     UDOTR   ;display address
      0093CD CD 8B 07         [ 4] 3197         CALL     SPACE
      0093D0 CD 82 31         [ 4] 3198         CALL     TOR     ;start count down loop
      0093D3 20 11            [ 2] 3199         JRA     PDUM2   ;skip first pass
      0093D5 CD 82 68         [ 4] 3200 PDUM1:  CALL     DUPP
      0093D8 CD 81 D9         [ 4] 3201         CALL     CAT
      0093DB CD 81 2F         [ 4] 3202         CALL     DOLIT
      0093DE 00 03                 3203         .word      3
      0093E0 CD 8B B7         [ 4] 3204         CALL     UDOTR   ;display numeric data
      0093E3 CD 86 E3         [ 4] 3205         CALL     ONEP    ;increment address
      0093E6 CD 81 47         [ 4] 3206 PDUM2:  CALL     DONXT
      0093E9 93 D5                 3207         .word      PDUM1   ;loop till done
      0093EB 81               [ 4] 3208         RET
                                   3209 
                                   3210 ;       DUMP    ( a u -- )
                                   3211 ;       Dump u bytes from a,
                                   3212 ;       in a formatted manner.
      0093EC 93 BE                 3213         .word      LINK
                           00136E  3214 LINK = . 
      0093EE 04                    3215         .byte      4
      0093EF 44 55 4D 50           3216         .ascii     "DUMP"
      0093F3                       3217 DUMP:
      0093F3 CD 83 23         [ 4] 3218         CALL     BASE
      0093F6 CD 81 BB         [ 4] 3219         CALL     AT
      0093F9 CD 82 31         [ 4] 3220         CALL     TOR
      0093FC CD 89 95         [ 4] 3221         CALL     HEX     ;save radix, set hex
      0093FF CD 81 2F         [ 4] 3222         CALL     DOLIT
      009402 00 10                 3223         .word      16
      009404 CD 85 FC         [ 4] 3224         CALL     SLASH   ;change count to lines
      009407 CD 82 31         [ 4] 3225         CALL     TOR     ;start count down loop
      00940A CD 8B 4F         [ 4] 3226 DUMP1:  CALL     CR
      00940D CD 81 2F         [ 4] 3227         CALL     DOLIT
      009410 00 10                 3228         .word      16
      009412 CD 83 F6         [ 4] 3229         CALL     DDUP
      009415 CD 93 C2         [ 4] 3230         CALL     DUMPP   ;display numeric
      009418 CD 83 C3         [ 4] 3231         CALL     ROT
      00941B CD 83 C3         [ 4] 3232         CALL     ROT
      00941E CD 8B 07         [ 4] 3233         CALL     SPACE
      009421 CD 8B 07         [ 4] 3234         CALL     SPACE
      009424 CD 93 A0         [ 4] 3235         CALL     UTYPE   ;display printable characters
      009427 CD 81 47         [ 4] 3236         CALL     DONXT
      00942A 94 0A                 3237         .word      DUMP1   ;loop till done
      00942C CD 82 5E         [ 4] 3238 DUMP3:  CALL     DROP
      00942F CD 82 09         [ 4] 3239         CALL     RFROM
      009432 CD 83 23         [ 4] 3240         CALL     BASE
      009435 CC 81 A4         [ 2] 3241         JP     STORE   ;restore radix
                                   3242 
                                   3243 ;       .S      ( ... -- ... )
                                   3244 ;        Display  contents of stack.
      009438 93 EE                 3245         .word      LINK
                           0013BA  3246 LINK = . 
      00943A 02                    3247         .byte      2
      00943B 2E 53                 3248         .ascii     ".S"
      00943D                       3249 DOTS:
      00943D CD 8B 4F         [ 4] 3250         CALL     CR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009440 CD 87 6D         [ 4] 3251         CALL     DEPTH   ;stack depth
      009443 CD 82 31         [ 4] 3252         CALL     TOR     ;start count down loop
      009446 20 0C            [ 2] 3253         JRA     DOTS2   ;skip first pass
      009448 CD 82 1C         [ 4] 3254 DOTS1:  CALL     RAT
      00944B CD 86 E3         [ 4] 3255         CALL ONEP
      00944E CD 87 86         [ 4] 3256 	CALL     PICK
      009451 CD 8B EA         [ 4] 3257         CALL     DOT     ;index stack, display contents
      009454 CD 81 47         [ 4] 3258 DOTS2:  CALL     DONXT
      009457 94 48                 3259         .word      DOTS1   ;loop till done
      009459 CD 8B 8E         [ 4] 3260         CALL     DOTQP
      00945C 05                    3261         .byte      5
      00945D 20 3C 73 70 20        3262         .ascii     " <sp "
      009462 81               [ 4] 3263         RET
                                   3264 
                                   3265 ;       >NAME   ( ca -- na | F )
                                   3266 ;       Convert code address
                                   3267 ;       to a name address.
      009463 94 3A                 3268         .word      LINK
                           0013E5  3269 LINK = . 
      009465 05                    3270         .byte      5
      009466 3E 4E 41 4D 45        3271         .ascii     ">NAME"
      00946B                       3272 TNAME:
      00946B CD 83 84         [ 4] 3273         CALL     CNTXT   ;vocabulary link
      00946E CD 81 BB         [ 4] 3274 TNAM2:  CALL     AT
      009471 CD 82 68         [ 4] 3275         CALL     DUPP    ;?last word in a vocabulary
      009474 CD 81 66         [ 4] 3276         CALL     QBRAN
      009477 94 92                 3277         .word      TNAM4
      009479 CD 83 F6         [ 4] 3278         CALL     DDUP
      00947C CD 8D 67         [ 4] 3279         CALL     NAMET
      00947F CD 82 DD         [ 4] 3280         CALL     XORR    ;compare
      009482 CD 81 66         [ 4] 3281         CALL     QBRAN
      009485 94 8C                 3282         .word      TNAM3
      009487 CD 86 C7         [ 4] 3283         CALL     CELLM   ;continue with next word
      00948A 20 E2            [ 2] 3284         JRA     TNAM2
      00948C CD 82 78         [ 4] 3285 TNAM3:  CALL     SWAPP
      00948F CC 82 5E         [ 2] 3286         JP     DROP
      009492 CD 83 EB         [ 4] 3287 TNAM4:  CALL     DDROP
      009495 CC 87 17         [ 2] 3288         JP     ZERO
                                   3289 
                                   3290 ;       .ID     ( na -- )
                                   3291 ;        Display  name at address.
      009498 94 65                 3292         .word      LINK
                           00141A  3293 LINK = . 
      00949A 03                    3294         .byte      3
      00949B 2E 49 44              3295         .ascii     ".ID"
      00949E                       3296 DOTID:
      00949E CD 83 B2         [ 4] 3297         CALL     QDUP    ;if zero no name
      0094A1 CD 81 66         [ 4] 3298         CALL     QBRAN
      0094A4 94 B4                 3299         .word      DOTI1
      0094A6 CD 87 DD         [ 4] 3300         CALL     COUNT
      0094A9 CD 81 2F         [ 4] 3301         CALL     DOLIT
      0094AC 00 1F                 3302         .word      0x1F
      0094AE CD 82 B4         [ 4] 3303         CALL     ANDD    ;mask lexicon bits
      0094B1 CC 93 A0         [ 2] 3304         JP     UTYPE
      0094B4 CD 8B 8E         [ 4] 3305 DOTI1:  CALL     DOTQP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0094B7 09                    3306         .byte      9
      0094B8 20 6E 6F 4E 61 6D 65  3307         .ascii     " noName"
      0094BF 81               [ 4] 3308         RET
                                   3309 
                                   3310 ;       SEE     ( -- ; <string> )
                                   3311 ;       A simple decompiler.
                                   3312 ;       Updated for byte machines.
      0094C0 94 9A                 3313         .word      LINK
                           001442  3314 LINK = . 
      0094C2 03                    3315         .byte      3
      0094C3 53 45 45              3316         .ascii     "SEE"
      0094C6                       3317 SEE:
      0094C6 CD 90 7E         [ 4] 3318         CALL     TICK    ;starting address
      0094C9 CD 8B 4F         [ 4] 3319         CALL     CR
      0094CC CD 86 F0         [ 4] 3320         CALL     ONEM
      0094CF CD 86 E3         [ 4] 3321 SEE1:   CALL     ONEP
      0094D2 CD 82 68         [ 4] 3322         CALL     DUPP
      0094D5 CD 81 BB         [ 4] 3323         CALL     AT
      0094D8 CD 82 68         [ 4] 3324         CALL     DUPP    ;?does it contain a zero
      0094DB CD 81 66         [ 4] 3325         CALL     QBRAN
      0094DE 94 E3                 3326         .word      SEE2
      0094E0 CD 94 6B         [ 4] 3327         CALL     TNAME   ;?is it a name
      0094E3 CD 83 B2         [ 4] 3328 SEE2:   CALL     QDUP    ;name address or zero
      0094E6 CD 81 66         [ 4] 3329         CALL     QBRAN
      0094E9 94 F6                 3330         .word      SEE3
      0094EB CD 8B 07         [ 4] 3331         CALL     SPACE
      0094EE CD 94 9E         [ 4] 3332         CALL     DOTID   ;display name
      0094F1 CD 86 E3         [ 4] 3333         CALL     ONEP
      0094F4 20 09            [ 2] 3334         JRA     SEE4
      0094F6 CD 82 68         [ 4] 3335 SEE3:   CALL     DUPP
      0094F9 CD 81 D9         [ 4] 3336         CALL     CAT
      0094FC CD 8B D7         [ 4] 3337         CALL     UDOT    ;display number
      0094FF CD 8A E5         [ 4] 3338 SEE4:   CALL     NUFQ    ;user control
      009502 CD 81 66         [ 4] 3339         CALL     QBRAN
      009505 94 CF                 3340         .word      SEE1
      009507 CC 82 5E         [ 2] 3341         JP     DROP
                                   3342 
                                   3343 ;       WORDS   ( -- )
                                   3344 ;       Display names in vocabulary.
      00950A 94 C2                 3345         .word      LINK
                           00148C  3346 LINK = . 
      00950C 05                    3347         .byte      5
      00950D 57 4F 52 44 53        3348         .ascii     "WORDS"
      009512                       3349 WORDS:
      009512 CD 8B 4F         [ 4] 3350         CALL     CR
      009515 CD 83 84         [ 4] 3351         CALL     CNTXT   ;only in context
      009518 CD 81 BB         [ 4] 3352 WORS1:  CALL     AT
      00951B CD 83 B2         [ 4] 3353         CALL     QDUP    ;?at end of list
      00951E CD 81 66         [ 4] 3354         CALL     QBRAN
      009521 95 37                 3355         .word      WORS2
      009523 CD 82 68         [ 4] 3356         CALL     DUPP
      009526 CD 8B 07         [ 4] 3357         CALL     SPACE
      009529 CD 94 9E         [ 4] 3358         CALL     DOTID   ;display a name
      00952C CD 86 C7         [ 4] 3359         CALL     CELLM
      00952F CD 81 7D         [ 4] 3360         CALL     BRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      009532 95 18                 3361         .word      WORS1
      009534 CD 82 5E         [ 4] 3362         CALL     DROP
      009537 81               [ 4] 3363 WORS2:  RET
                                   3364 
                                   3365         
                                   3366 ;; Hardware reset
                                   3367 
                                   3368 ;       hi      ( -- )
                                   3369 ;       Display sign-on message.
      009538 95 0C                 3370         .word      LINK
                           0014BA  3371 LINK = . 
      00953A 02                    3372         .byte      2
      00953B 68 69                 3373         .ascii     "hi"
      00953D                       3374 HI:
      00953D CD 8B 4F         [ 4] 3375         CALL     CR
      009540 CD 8B 8E         [ 4] 3376         CALL     DOTQP   ;initialize I/O
      009543 0F                    3377         .byte      15
      009544 73 74 6D 38 65 46 6F  3378         .ascii     "stm8eForth v"
             72 74 68 20 76
      009550 32                    3379 	.byte      VER+'0'
      009551 2E                    3380         .byte      '.' 
      009552 31                    3381 	.byte      EXT+'0' ;version
      009553 CC 8B 4F         [ 2] 3382         JP     CR
                                   3383 
                                   3384 ;       DEBUG      ( -- )
                                   3385 ;       Display sign-on message.
                                   3386 ;        .word      LINK
                                   3387 ;LINK = . 
                                   3388 ;        .byte      5
                                   3389 ;        .ascii     "DEBUG"
                                   3390 ;DEBUG:
                                   3391 ;	CALL DOLIT
                                   3392 ;	.word 0x65
                                   3393 ;	CALL EMIT
                                   3394 ;	CALL DOLIT
                                   3395 ;	.word 0
                                   3396 ; 	CALL ZLESS 
                                   3397 ;	CALL DOLIT
                                   3398 ;	.word 0xFFFE
                                   3399 ;	CALL ZLESS 
                                   3400 ;	CALL UPLUS 
                                   3401 ; 	CALL DROP 
                                   3402 ;	CALL DOLIT
                                   3403 ;	.word 3
                                   3404 ;	CALL UPLUS 
                                   3405 ;	CALL UPLUS 
                                   3406 ; 	CALL DROP
                                   3407 ;	CALL DOLIT
                                   3408 ;	.word 0x43
                                   3409 ;	CALL UPLUS 
                                   3410 ; 	CALL DROP
                                   3411 ;	CALL EMIT
                                   3412 ;	CALL DOLIT
                                   3413 ;	.word 0x4F
                                   3414 ;	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3415 ;	.word 0x6F
                                   3416 ; 	CALL XORR
                                   3417 ;	CALL DOLIT
                                   3418 ;	.word 0xF0
                                   3419 ; 	CALL ANDD
                                   3420 ;	CALL DOLIT
                                   3421 ;	.word 0x4F
                                   3422 ; 	CALL ORR
                                   3423 ;	CALL EMIT
                                   3424 ;	CALL DOLIT
                                   3425 ;	.word 8
                                   3426 ;	CALL DOLIT
                                   3427 ;	.word 6
                                   3428 ; 	CALL SWAPP
                                   3429 ;	CALL OVER
                                   3430 ;	CALL XORR
                                   3431 ;	CALL DOLIT
                                   3432 ;	.word 3
                                   3433 ;	CALL ANDD 
                                   3434 ;	CALL ANDD
                                   3435 ;	CALL DOLIT
                                   3436 ;	.word 0x70
                                   3437 ;	CALL UPLUS 
                                   3438 ;	CALL DROP
                                   3439 ;	CALL EMIT
                                   3440 ;	CALL DOLIT
                                   3441 ;	.word 0
                                   3442 ;	CALL QBRAN
                                   3443 ;	.word DEBUG1
                                   3444 ;	CALL DOLIT
                                   3445 ;	.word 0x3F
                                   3446 ;DEBUG1:
                                   3447 ;	CALL DOLIT
                                   3448 ;	.word 0xFFFF
                                   3449 ;	CALL QBRAN
                                   3450 ;	.word DEBUG2
                                   3451 ;	CALL DOLIT
                                   3452 ;	.word 0x74
                                   3453 ;	CALL BRAN
                                   3454 ;	.word DEBUG3
                                   3455 ;DEBUG2:
                                   3456 ;	CALL DOLIT
                                   3457 ;	.word 0x21
                                   3458 ;DEBUG3:
                                   3459 ;	CALL EMIT
                                   3460 ;	CALL DOLIT
                                   3461 ;	.word 0x68
                                   3462 ;	CALL DOLIT
                                   3463 ;	.word 0x80
                                   3464 ;	CALL STORE
                                   3465 ;	CALL DOLIT
                                   3466 ;	.word 0x80
                                   3467 ;	CALL AT
                                   3468 ;	CALL EMIT
                                   3469 ;	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                                   3470 ;	.word 0x4D
                                   3471 ;	CALL TOR
                                   3472 ;	CALL RAT
                                   3473 ;	CALL RFROM
                                   3474 ;	CALL ANDD
                                   3475 ;	CALL EMIT
                                   3476 ;	CALL DOLIT
                                   3477 ;	.word 0x61
                                   3478 ;	CALL DOLIT
                                   3479 ;	.word 0xA
                                   3480 ;	CALL TOR
                                   3481 ;DEBUG4:
                                   3482 ;	CALL DOLIT
                                   3483 ;	.word 1
                                   3484 ;	CALL UPLUS 
                                   3485 ;	CALL DROP
                                   3486 ;	CALL DONXT
                                   3487 ;	.word DEBUG4
                                   3488 ;	CALL EMIT
                                   3489 ;	CALL DOLIT
                                   3490 ;	.word 0x656D
                                   3491 ;	CALL DOLIT
                                   3492 ;	.word 0x100
                                   3493 ;	CALL UMSTA
                                   3494 ;	CALL SWAPP
                                   3495 ;	CALL DOLIT
                                   3496 ;	.word 0x100
                                   3497 ;	CALL UMSTA
                                   3498 ;	CALL SWAPP 
                                   3499 ;	CALL DROP
                                   3500 ;	CALL EMIT
                                   3501 ;	CALL EMIT
                                   3502 ;	CALL DOLIT
                                   3503 ;	.word 0x2043
                                   3504 ;	CALL DOLIT
                                   3505 ;	.word 0
                                   3506 ;	CALL DOLIT
                                   3507 ;	.word 0x100
                                   3508 ;	CALL UMMOD
                                   3509 ;	CALL EMIT
                                   3510 ;	CALL EMIT
                                   3511 	;JP ORIG
                                   3512 ;	RET
                                   3513 
                                   3514 ;       'BOOT   ( -- a )
                                   3515 ;       The application startup vector.
      009556 95 3A                 3516         .word      LINK
                           0014D8  3517 LINK = . 
      009558 05                    3518         .byte      5
      009559 27 42 4F 4F 54        3519         .ascii     "'BOOT"
      00955E                       3520 TBOOT:
      00955E CD 83 15         [ 4] 3521         CALL     DOVAR
      009561 95 3D                 3522         .word      HI       ;application to boot
                                   3523 
                                   3524 ;       COLD    ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                                   3525 ;       The hilevel cold start s=ence.
      009563 95 58                 3526         .word      LINK
                           0014E5  3527 LINK = . 
      009565 04                    3528         .byte      4
      009566 43 4F 4C 44           3529         .ascii     "COLD"
      00956A                       3530 COLD:
                                   3531 ;        CALL DEBUG
      00956A CD 81 2F         [ 4] 3532 COLD1:  CALL     DOLIT
      00956D 80 96                 3533         .word      UZERO
      00956F CD 81 2F         [ 4] 3534 	CALL     DOLIT
      009572 00 06                 3535         .word      UPP
      009574 CD 81 2F         [ 4] 3536         CALL     DOLIT
      009577 00 14                 3537 	.word      ULAST-UZERO
      009579 CD 88 38         [ 4] 3538         CALL     CMOVE   ;initialize user area
      00957C CD 90 4A         [ 4] 3539         CALL     PRESE   ;initialize data stack and TIB
      00957F CD 95 5E         [ 4] 3540         CALL     TBOOT
      009582 CD 88 21         [ 4] 3541         CALL     ATEXE   ;application boot
      009585 CD 92 FA         [ 4] 3542         CALL     OVERT
      009588 CC 90 67         [ 2] 3543         JP     QUIT    ;start interpretation
                                   3544 
                                   3545 
                                   3546 ;       
                                   3547 ;===============================================================
                                   3548 
                           0014E5  3549 LASTN   =	LINK   ;last name defined
                                   3550 
                                   3551 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        00040C R   |   6 ABOR1      000EEA R
  6 ABOR2      000F01 R   |   6 ABORQ      000EE2 R   |   6 ABORT      000ED3 R
  6 ABRTQ      0011A2 R   |   6 ABSS       000403 R   |   6 ACCEP      000E69 R
  6 ACCP1      000E72 R   |   6 ACCP2      000E98 R   |   6 ACCP3      000E9B R
  6 ACCP4      000E9D R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |     AFR     =  004803 
    AFR0_ADC=  000000     |     AFR1_TIM=  000001     |     AFR2_CCO=  000002 
    AFR3_TIM=  000003     |     AFR4_TIM=  000004     |     AFR5_TIM=  000005 
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |   6 AFT        00118D R
  6 AGAIN      0010EC R   |   6 AHEAD      001143 R   |   6 ALLOT      001012 R
  6 ANDD       000234 R   |   6 AT         00013B R   |   6 ATEXE      0007A1 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 BACK1      000E11 R   |   6 BASE       0002A3 R   |     BASEE   =  00000A 
  6 BCOMP      001051 R   |   6 BDIGS      00087A R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
  6 BEGIN      0010D0 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
  6 BKSLA      000CB2 R   |   6 BKSP       000DE1 R   |     BKSPP   =  000008 
  6 BLANK      00068A R   |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |   6 BRAN       0000FD R   |     CALLL   =  0000CD 
    CAN_DGR =  005426     |     CAN_FPSR=  005427     |     CAN_IER =  005425 
    CAN_MCR =  005420     |     CAN_MSR =  005421     |     CAN_P0  =  005428 
    CAN_P1  =  005429     |     CAN_P2  =  00542A     |     CAN_P3  =  00542B 
    CAN_P4  =  00542C     |     CAN_P5  =  00542D     |     CAN_P6  =  00542E 
    CAN_P7  =  00542F     |     CAN_P8  =  005430     |     CAN_P9  =  005431 
    CAN_PA  =  005432     |     CAN_PB  =  005433     |     CAN_PC  =  005434 
    CAN_PD  =  005435     |     CAN_PE  =  005436     |     CAN_PF  =  005437 
    CAN_RFR =  005424     |     CAN_TPR =  005423     |     CAN_TSR =  005422 
    CARRY   =  000020     |   6 CAT        000159 R   |   6 CCOMMA     001033 R
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
    CC_Z    =  000001     |     CELLL   =  000002     |   6 CELLM      000647 R
  6 CELLP      000638 R   |   6 CELLS      000656 R   |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   6 CHAR1      000AA1 R
  6 CHAR2      000AA4 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
    CLKOPT_E=  000003     |     CLKOPT_P=  000000     |     CLKOPT_P=  000001 
    CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6     |     CLK_CKDI=  000000 
    CLK_CKDI=  000001     |     CLK_CKDI=  000002     |     CLK_CKDI=  000003 
    CLK_CKDI=  000004     |     CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]

Symbol Table

    CLK_ECKR=  0050C1     |     CLK_ECKR=  000000     |     CLK_ECKR=  000001 
    CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0     |     CLK_ICKR=  000002 
    CLK_ICKR=  000000     |     CLK_ICKR=  000001     |     CLK_ICKR=  000003 
    CLK_ICKR=  000004     |     CLK_ICKR=  000005     |     CLK_PCKE=  0050C7 
    CLK_PCKE=  000000     |     CLK_PCKE=  000001     |     CLK_PCKE=  000007 
    CLK_PCKE=  000005     |     CLK_PCKE=  000006     |     CLK_PCKE=  000004 
    CLK_PCKE=  000002     |     CLK_PCKE=  000003     |     CLK_PCKE=  0050CA 
    CLK_PCKE=  000003     |     CLK_PCKE=  000002     |     CLK_PCKE=  000007 
    CLK_SWCR=  0050C5     |     CLK_SWCR=  000000     |     CLK_SWCR=  000001 
    CLK_SWCR=  000002     |     CLK_SWCR=  000003     |     CLK_SWIM=  0050CD 
    CLK_SWR =  0050C4     |     CLK_SWR_=  0000B4     |     CLK_SWR_=  0000E1 
    CLK_SWR_=  0000D2     |   6 CMOV1      0007C0 R   |   6 CMOV2      0007D8 R
  6 CMOVE      0007B8 R   |   6 CNTXT      000304 R   |   6 COLD       0014EA R
  6 COLD1      0014EA R   |   6 COLON      0012BC R   |   6 COMMA      00101C R
  6 COMPI      001061 R   |     COMPO   =  000040     |   6 COUNT      00075D R
  6 CPP        000312 R   |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
  6 CR         000ACF R   |   6 CREAT      0012F4 R   |     CRR     =  00000D 
  6 CSTOR      000148 R   |     CTOP    =  000080     |   6 DAT        000746 R
    DATSTK  =  0016F0     |   6 DDROP      00036B R   |   6 DDUP       000376 R
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   6 DECIM      00092A R
  6 DEPTH      0006ED R   |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  6 DGTQ1      00096F R   |   6 DIG        0008A3 R   |   6 DIGIT      00083E R
  6 DIGS       0008B4 R   |   6 DIGS1      0008B4 R   |   6 DIGS2      0008C1 R
  6 DIGTQ      00093E R   |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  6 DN1        0003E3 R   |   6 DNEGA      0003C8 R   |   6 DOLIT      0000AF R
  6 DONXT      0000C7 R   |   6 DOSTR      000AE5 R   |   6 DOT        000B6A R
  6 DOT1       000B80 R   |   6 DOTI1      001434 R   |   6 DOTID      00141E R
  6 DOTO1      000F76 R   |   6 DOTOK      000F5C R   |   6 DOTPR      000C93 R
  6 DOTQ       0011BE R   |   6 DOTQP      000B0E R   |   6 DOTR       000B1C R
  6 DOTS       0013BD R   |   6 DOTS1      0013C8 R   |   6 DOTS2      0013D4 R
  6 DOVAR      000295 R   |   6 DROP       0001DE R   |   6 DSTOR      000732 R
  6 DUMP       001373 R   |   6 DUMP1      00138A R   |   6 DUMP3      0013AC R
  6 DUMPP      001342 R   |   6 DUPP       0001E8 R   |   6 EDIGS      0008DF R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
  6 ELSEE      001120 R   |   6 EMIT       000099 R   |   6 EQ1        000427 R
  6 EQUAL      000411 R   |   6 ERASE      00080E R   |     ERR     =  00001B 
  6 EVAL       000F9F R   |   6 EVAL1      000F9F R   |   6 EVAL2      000FBB R
  6 EXE1       0007AF R   |   6 EXECU      00010D R   |   6 EXIT       00011D R
    EXT     =  000001     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
  6 EXTRC      000866 R   |     FHSE    =  7A1200     |     FHSI    =  F42400 
  6 FILL       0007E7 R   |   6 FILL1      0007F5 R   |   6 FILL2      0007FE R
  6 FIND       000D3D R   |   6 FIND1      000D5B R   |   6 FIND2      000D89 R
  6 FIND3      000D95 R   |   6 FIND4      000DA9 R   |   6 FIND5      000DB6 R
  6 FIND6      000D9A R   |     FLASH_BA=  008000     |     FLASH_CR=  00505A 
    FLASH_CR=  000002     |     FLASH_CR=  000000     |     FLASH_CR=  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_CR=  000001     |     FLASH_CR=  00505B     |     FLASH_CR=  000005 
    FLASH_CR=  000004     |     FLASH_CR=  000007     |     FLASH_CR=  000000 
    FLASH_CR=  000006     |     FLASH_DU=  005064     |     FLASH_DU=  0000AE 
    FLASH_DU=  000056     |     FLASH_EN=  027FFF     |     FLASH_FP=  00505D 
    FLASH_FP=  000000     |     FLASH_FP=  000001     |     FLASH_FP=  000002 
    FLASH_FP=  000003     |     FLASH_FP=  000004     |     FLASH_FP=  000005 
    FLASH_IA=  00505F     |     FLASH_IA=  000003     |     FLASH_IA=  000002 
    FLASH_IA=  000006     |     FLASH_IA=  000001     |     FLASH_IA=  000000 
    FLASH_NC=  00505C     |     FLASH_NF=  00505E     |     FLASH_NF=  000000 
    FLASH_NF=  000001     |     FLASH_NF=  000002     |     FLASH_NF=  000003 
    FLASH_NF=  000004     |     FLASH_NF=  000005     |     FLASH_PU=  005062 
    FLASH_PU=  000056     |     FLASH_PU=  0000AE     |     FLASH_SI=  020000 
    FLASH_WS=  00480D     |     FLSI    =  01F400     |   6 FOR        0010AF R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |   6 HERE       000770 R   |   6 HEX        000915 R
  6 HI         0014BD R   |   6 HLD        0002F1 R   |   6 HOLD       00088A R
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
    I2C_WRIT=  000000     |   6 IFF        0010FA R   |     IMEDD   =  000080 
  6 IMMED      0012D1 R   |   6 INCH       00008D R   |   6 INN        0002C1 R
    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
    INPUT_PU=  000001     |   6 INTE1      000F3E R   |   6 INTER      000F14 R
    INT_ADC2=  000016     |     INT_AUAR=  000012     |     INT_AWU =  000001 
    INT_CAN_=  000008     |     INT_CAN_=  000009     |     INT_CLK =  000002 
    INT_EXTI=  000003     |     INT_EXTI=  000004     |     INT_EXTI=  000005 
    INT_EXTI=  000006     |     INT_EXTI=  000007     |     INT_FLAS=  000018 
    INT_I2C =  000013     |     INT_SPI =  00000A     |     INT_TIM1=  00000C 
    INT_TIM1=  00000B     |     INT_TIM2=  00000E     |     INT_TIM2=  00000D 
    INT_TIM3=  000010     |     INT_TIM3=  00000F     |     INT_TIM4=  000017 
    INT_TLI =  000000     |     INT_UART=  000011     |     INT_UART=  000015 
    INT_UART=  000014     |     INT_VECT=  008060     |     INT_VECT=  00800C 
    INT_VECT=  008028     |     INT_VECT=  00802C     |     INT_VECT=  008010 
    INT_VECT=  008014     |     INT_VECT=  008018     |     INT_VECT=  00801C 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]

Symbol Table

    INT_VECT=  008020     |     INT_VECT=  008024     |     INT_VECT=  008068 
    INT_VECT=  008054     |     INT_VECT=  008000     |     INT_VECT=  008030 
    INT_VECT=  008038     |     INT_VECT=  008034     |     INT_VECT=  008040 
    INT_VECT=  00803C     |     INT_VECT=  008048     |     INT_VECT=  008044 
    INT_VECT=  008064     |     INT_VECT=  008008     |     INT_VECT=  008004 
    INT_VECT=  008050     |     INT_VECT=  00804C     |     INT_VECT=  00805C 
    INT_VECT=  008058     |   6 INVER      0003A5 R   |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   6 JSRC       0012AD R   |   6 KEY        000A55 R
  6 KEY1       000A55 R   |   6 KTAP       000E2E R   |   6 KTAP1      000E51 R
  6 KTAP2      000E54 R   |   6 LAST       000322 R   |   6 LASTN   =  0014E5 R
  6 LBRAC      000F4B R   |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |   6 LESS       00044E R   |     LF      =  00000A 
  6 LINK    =  0014E5 R   |   6 LITER      001080 R   |   6 LT1        000464 R
    MASKK   =  001F7F     |   6 MAX        00046E R   |   6 MAX1       000481 R
  6 MIN        00048B R   |   6 MIN1       00049E R   |   6 MMOD1      00052D R
  6 MMOD2      000541 R   |   6 MMOD3      000558 R   |   6 MMSM1      0004E8 R
  6 MMSM3      0004EA R   |   6 MMSM4      0004F2 R   |   6 MODD       000572 R
  6 MONE       0006B0 R   |   6 MSMOD      000510 R   |   6 MSTA1      00060F R
  6 MSTAR      0005EC R   |     NAFR    =  004804     |   6 NAMEQ      000DD6 R
  6 NAMET      000CE7 R   |     NCLKOPT =  004808     |   6 NEGAT      0003B6 R
  6 NEX1       0000D4 R   |   6 NEXT       0010BF R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  6 NTIB       0002D1 R   |     NUBC    =  004802     |   6 NUFQ       000A65 R
  6 NUFQ1      000A7E R   |   6 NUMBQ      000982 R   |   6 NUMQ1      0009B6 R
  6 NUMQ2      0009E7 R   |   6 NUMQ3      000A29 R   |   6 NUMQ4      000A2E R
  6 NUMQ5      000A3D R   |   6 NUMQ6      000A40 R   |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R   |   6 ONE        0006A2 R
  6 ONEM       000670 R   |   6 ONEP       000663 R   |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   6 ORIG       00002C R
  6 ORR        000248 R   |   6 OUTPUT     00009E R   |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
  6 OVER       000212 R   |   6 OVERT      00127A R   |     PA      =  000000 
  6 PACKS      00081D R   |   6 PAD        00077C R   |   6 PAREN      000CA2 R
  6 PARS       000B9B R   |   6 PARS1      000BC6 R   |   6 PARS2      000BF1 R
  6 PARS3      000BF4 R   |   6 PARS4      000BFD R   |   6 PARS5      000C20 R
  6 PARS6      000C35 R   |   6 PARS7      000C44 R   |   6 PARS8      000C53 R
  6 PARSE      000C64 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      001355 R   |   6 PDUM2      001366 R
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]

Symbol Table

    PE      =  000014     |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |   6 PICK       000706 R
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  6 PLUS       00038B R   |   6 PNAM1      00122F R   |   6 PRESE      000FCA R
    PROD1   =  00001A     |     PROD2   =  00001C     |     PROD3   =  00001E 
  6 PSTOR      00071B R   |   6 QBRAN      0000E6 R   |   6 QDUP       000332 R
  6 QDUP1      00033C R   |   6 QKEY       00007B R   |   6 QSTAC      000F82 R
  6 QUERY      000EAE R   |   6 QUEST      000B8D R   |   6 QUIT       000FE7 R
  6 QUIT1      000FEF R   |   6 QUIT2      000FF2 R   |     RAMBASE =  000000 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  6 RAT        00019C R   |   6 RBRAC      00129A R   |   6 REPEA      001175 R
  6 RFROM      000189 R   |     ROP     =  004800     |   6 ROT        000343 R
    RP0     =  000024     |   6 RPAT       000169 R   |     RPP     =  0017FF 
  6 RPSTO      000176 R   |     RST_SR  =  0050B3     |   6 SAME1      000D05 R
  6 SAME2      000D2E R   |   6 SAMEQ      000CFD R   |   6 SCOM1      001264 R
  6 SCOM2      001267 R   |   6 SCOMP      001246 R   |   6 SEE        001446 R
  6 SEE1       00144F R   |   6 SEE2       001463 R   |   6 SEE3       001476 R
  6 SEE4       00147F R   |   6 SEMIS      00128A R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SIGN       0008C9 R   |   6 SIGN1      0008D9 R
  6 SLASH      00057C R   |   6 SLMOD      000560 R   |   6 SNAME      0011F9 R
    SP0     =  000022     |   6 SPACE      000A87 R   |   6 SPACS      000A96 R
  6 SPAT       0001C8 R   |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SPP     =  0016F0     |   6 SPSTO      0001D5 R   |   6 SSMOD      000618 R
    STACK   =  0017FF     |   6 STAR       0005E1 R   |   6 STASL      00062A R
  6 STORE      000124 R   |   6 STR        0008F7 R   |   6 STRCQ      00108F R
  6 STRQ       0011B0 R   |   6 STRQP      000B04 R   |   6 SUBB       0003E9 R
  6 SWAPP      0001F8 R   |     SWIM_CSR=  007F80     |   6 TAP        000E18 R
  6 TBOOT      0014DE R   |   6 TCHA1      0006E4 R   |   6 TCHAR      0006C1 R
  6 TEMP       0002B2 R   |   6 TEVAL      0002E2 R   |   6 THENN      001110 R
  6 TIB        00078D R   |     TIBB    =  001700     |     TIBBASE =  001700 
    TIC     =  000027     |   6 TICK       000FFE R   |     TIM1_ARR=  005262 
    TIM1_ARR=  005263     |     TIM1_BKR=  00526D     |     TIM1_CCE=  00525C 
    TIM1_CCE=  00525D     |     TIM1_CCM=  005258     |     TIM1_CCM=  000000 
    TIM1_CCM=  000001     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000003     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000003     |     TIM1_CCM=  005259     |     TIM1_CCM=  000000 
    TIM1_CCM=  000001     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000003     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000003     |     TIM1_CCM=  00525A     |     TIM1_CCM=  000000 
    TIM1_CCM=  000001     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_CCM=  000006     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000003     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000003     |     TIM1_CCM=  00525B     |     TIM1_CCM=  000000 
    TIM1_CCM=  000001     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000003     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000003     |     TIM1_CCR=  005265     |     TIM1_CCR=  005266 
    TIM1_CCR=  005267     |     TIM1_CCR=  005268     |     TIM1_CCR=  005269 
    TIM1_CCR=  00526A     |     TIM1_CCR=  00526B     |     TIM1_CCR=  00526C 
    TIM1_CNT=  00525E     |     TIM1_CNT=  00525F     |     TIM1_CR1=  005250 
    TIM1_CR2=  005251     |     TIM1_CR2=  000000     |     TIM1_CR2=  000002 
    TIM1_CR2=  000004     |     TIM1_CR2=  000005     |     TIM1_CR2=  000006 
    TIM1_DTR=  00526E     |     TIM1_EGR=  005257     |     TIM1_EGR=  000007 
    TIM1_EGR=  000001     |     TIM1_EGR=  000002     |     TIM1_EGR=  000003 
    TIM1_EGR=  000004     |     TIM1_EGR=  000005     |     TIM1_EGR=  000006 
    TIM1_EGR=  000000     |     TIM1_ETR=  005253     |     TIM1_ETR=  000006 
    TIM1_ETR=  000000     |     TIM1_ETR=  000001     |     TIM1_ETR=  000002 
    TIM1_ETR=  000003     |     TIM1_ETR=  000007     |     TIM1_ETR=  000004 
    TIM1_ETR=  000005     |     TIM1_IER=  005254     |     TIM1_IER=  000007 
    TIM1_IER=  000001     |     TIM1_IER=  000002     |     TIM1_IER=  000003 
    TIM1_IER=  000004     |     TIM1_IER=  000005     |     TIM1_IER=  000006 
    TIM1_IER=  000000     |     TIM1_OIS=  00526F     |     TIM1_PSC=  005260 
    TIM1_PSC=  005261     |     TIM1_RCR=  005264     |     TIM1_SMC=  005252 
    TIM1_SMC=  000007     |     TIM1_SMC=  000000     |     TIM1_SMC=  000001 
    TIM1_SMC=  000002     |     TIM1_SMC=  000004     |     TIM1_SMC=  000005 
    TIM1_SMC=  000006     |     TIM1_SR1=  005255     |     TIM1_SR1=  000007 
    TIM1_SR1=  000001     |     TIM1_SR1=  000002     |     TIM1_SR1=  000003 
    TIM1_SR1=  000004     |     TIM1_SR1=  000005     |     TIM1_SR1=  000006 
    TIM1_SR1=  000000     |     TIM1_SR2=  005256     |     TIM1_SR2=  000001 
    TIM1_SR2=  000002     |     TIM1_SR2=  000003     |     TIM1_SR2=  000004 
    TIM2_ARR=  00530D     |     TIM2_ARR=  00530E     |     TIM2_CCE=  005308 
    TIM2_CCE=  005309     |     TIM2_CCM=  005305     |     TIM2_CCM=  005306 
    TIM2_CCM=  005307     |     TIM2_CCR=  00530F     |     TIM2_CCR=  005310 
    TIM2_CCR=  005311     |     TIM2_CCR=  005312     |     TIM2_CCR=  005313 
    TIM2_CCR=  005314     |     TIM2_CNT=  00530A     |     TIM2_CNT=  00530B 
    TIM2_CR1=  005300     |     TIM2_EGR=  005304     |     TIM2_IER=  005301 
    TIM2_PSC=  00530C     |     TIM2_SR1=  005302     |     TIM2_SR2=  005303 
    TIM3_ARR=  00532B     |     TIM3_ARR=  00532C     |     TIM3_CCE=  005327 
    TIM3_CCE=  000000     |     TIM3_CCE=  000001     |     TIM3_CCE=  000004 
    TIM3_CCE=  000005     |     TIM3_CCE=  000000     |     TIM3_CCE=  000001 
    TIM3_CCM=  005325     |     TIM3_CCM=  005326     |     TIM3_CCM=  000000 
    TIM3_CCM=  000004     |     TIM3_CCM=  000003     |     TIM3_CCR=  00532D 
    TIM3_CCR=  00532E     |     TIM3_CCR=  00532F     |     TIM3_CCR=  005330 
    TIM3_CNT=  005328     |     TIM3_CNT=  005329     |     TIM3_CR1=  005320 
    TIM3_CR1=  000007     |     TIM3_CR1=  000000     |     TIM3_CR1=  000003 
    TIM3_CR1=  000001     |     TIM3_CR1=  000002     |     TIM3_EGR=  005324 
    TIM3_IER=  005321     |     TIM3_PSC=  00532A     |     TIM3_SR1=  005322 
    TIM3_SR2=  005323     |     TIM4_ARR=  005346     |     TIM4_CNT=  005344 
    TIM4_CR1=  005340     |     TIM4_CR1=  000007     |     TIM4_CR1=  000000 
    TIM4_CR1=  000003     |     TIM4_CR1=  000001     |     TIM4_CR1=  000002 
    TIM4_EGR=  005343     |     TIM4_EGR=  000000     |     TIM4_IER=  005341 
    TIM4_IER=  000000     |     TIM4_PSC=  005345     |     TIM4_PSC=  000000 
    TIM4_PSC=  000007     |     TIM4_PSC=  000004     |     TIM4_PSC=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_PSC=  000005     |     TIM4_PSC=  000002     |     TIM4_PSC=  000006 
    TIM4_PSC=  000003     |     TIM4_PSC=  000000     |     TIM4_PSC=  000001 
    TIM4_PSC=  000002     |     TIM4_SR =  005342     |     TIM4_SR_=  000000 
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |   6 TNAM2      0013EE R
  6 TNAM3      00140C R   |   6 TNAM4      001412 R   |   6 TNAME      0013EB R
  6 TOKEN      000CD9 R   |   6 TOR        0001B1 R   |     TRUEE   =  00FFFF 
  6 TWOSL      00067D R   |   6 TYPE1      000AB6 R   |   6 TYPE2      000AC2 R
  6 TYPES      000AB1 R   |     UART1   =  000000     |     UART1_BA=  005230 
    UART1_BR=  005232     |     UART1_BR=  005233     |     UART1_CR=  005234 
    UART1_CR=  005235     |     UART1_CR=  005236     |     UART1_CR=  005237 
    UART1_CR=  005238     |     UART1_DR=  005231     |     UART1_GT=  005239 
    UART1_PO=  000000     |     UART1_PS=  00523A     |     UART1_RX=  000004 
    UART1_SR=  005230     |     UART1_TX=  000005     |     UART3   =  000001 
    UART3_BA=  005240     |     UART3_BR=  005242     |     UART3_BR=  005243 
    UART3_CR=  005244     |     UART3_CR=  005245     |     UART3_CR=  005246 
    UART3_CR=  005247     |     UART3_CR=  004249     |     UART3_DR=  005241 
    UART3_PO=  00000F     |     UART3_RX=  000006     |     UART3_SR=  005240 
    UART3_TX=  000005     |     UART_BRR=  000002     |     UART_BRR=  000003 
    UART_CR1=  000004     |     UART_CR1=  000004     |     UART_CR1=  000002 
    UART_CR1=  000000     |     UART_CR1=  000001     |     UART_CR1=  000007 
    UART_CR1=  000006     |     UART_CR1=  000005     |     UART_CR1=  000003 
    UART_CR2=  000005     |     UART_CR2=  000004     |     UART_CR2=  000002 
    UART_CR2=  000005     |     UART_CR2=  000001     |     UART_CR2=  000000 
    UART_CR2=  000006     |     UART_CR2=  000003     |     UART_CR2=  000007 
    UART_CR3=  000006     |     UART_CR3=  000003     |     UART_CR3=  000001 
    UART_CR3=  000002     |     UART_CR3=  000000     |     UART_CR3=  000006 
    UART_CR3=  000004     |     UART_CR3=  000005     |     UART_CR4=  000007 
    UART_CR4=  000000     |     UART_CR4=  000001     |     UART_CR4=  000002 
    UART_CR4=  000003     |     UART_CR4=  000004     |     UART_CR4=  000006 
    UART_CR4=  000005     |     UART_CR5=  000008     |     UART_CR5=  000003 
    UART_CR5=  000001     |     UART_CR5=  000002     |     UART_CR5=  000004 
    UART_CR5=  000005     |     UART_CR6=  000009     |     UART_CR6=  000004 
    UART_CR6=  000007     |     UART_CR6=  000001     |     UART_CR6=  000002 
    UART_CR6=  000000     |     UART_CR6=  000005     |     UART_DR =  000001 
    UART_GTR=  000009     |     UART_PSC=  00000A     |     UART_SR =  000000 
    UART_SR_=  000001     |     UART_SR_=  000004     |     UART_SR_=  000002 
    UART_SR_=  000003     |     UART_SR_=  000000     |     UART_SR_=  000005 
    UART_SR_=  000006     |     UART_SR_=  000007     |     UBC     =  004801 
  6 UDOT       000B57 R   |   6 UDOTR      000B37 R   |   6 ULAST      00002A R
  6 ULES1      000446 R   |   6 ULESS      000430 R   |   6 UMMOD      0004C6 R
  6 UMSTA      00058B R   |   6 UNIQ1      0011F0 R   |   6 UNIQU      0011D1 R
  6 UNTIL      0010DB R   |   6 UPL1       000289 R   |   6 UPLUS      000272 R
    UPP     =  000006     |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |   6 UTYP1      001325 R   |   6 UTYP2      001334 R
  6 UTYPE      001320 R   |   6 UZERO      000016 R   |   6 VARIA      00130F R
    VER     =  000002     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
  6 WHILE      00115A R   |   6 WITHI      0004AB R   |   6 WORDD      000CC5 R
  6 WORDS      001492 R   |   6 WORS1      001498 R   |   6 WORS2      0014B7 R
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |   6 XORR       00025D R
    XTEMP   =  00001A     |     YTEMP   =  00001C     |   6 ZERO       000697 R
  6 ZL1        00022A R   |   6 ZLESS      000221 R   |   6 clear_ra   000008 R
  6 clock_in   000047 R   |   6 main       000005 R   |   6 uart1_in   000055 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]

Symbol Table


ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   150B   flags    0

