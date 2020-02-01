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
                           000026    93 MS    =         38      ; millisecond counter 
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
      008000 82 00 80 8F            148 	int main	        ; reset
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
      008064 82 00 80 85            173 	int Timer4Handler	; irq23
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
      008085                        191 Timer4Handler:
      008085 72 5F 53 42      [ 1]  192 	clr TIM4_SR 
      008089 BE 26            [ 2]  193         ldw x,MS 
      00808B 5C               [ 1]  194         incw x 
      00808C BF 26            [ 2]  195         ldw MS,x 
      00808E 80               [11]  196         iret 
                                    197 
                                    198 
                                    199 ;; Main entry points and COLD start data
      00808F                        200 main:
                                    201 ; clear all RAM
      00808F AE 00 00         [ 2]  202 	ldw X,#RAMBASE
      008092                        203 clear_ram0:
      008092 7F               [ 1]  204 	clr (X)
      008093 5C               [ 1]  205 	incw X
      008094 A3 17 FF         [ 2]  206 	cpw X,#RAM_END
      008097 23 F9            [ 2]  207 	jrule clear_ram0
      008099 AE 17 FF         [ 2]  208         ldw x,#RPP
      00809C 94               [ 1]  209         ldw sp,x 
      00809D CC 80 B6         [ 2]  210 	jp ORIG
                                    211 
                                    212 ; COLD initialize these variables.
      0080A0                        213 UZERO:
      0080A0 00 0A                  214         .word      BASEE   ;BASE
      0080A2 00 00                  215         .word      0       ;tmp
      0080A4 00 00                  216         .word      0       ;>IN
      0080A6 00 00                  217         .word      0       ;#TIB
      0080A8 17 00                  218         .word      TIBB    ;TIB
      0080AA 8F BE                  219         .word      INTER   ;'EVAL
      0080AC 00 00                  220         .word      0       ;HLD
      0080AE 95 45                  221         .word       LASTN   ;CONTEXT pointer
      0080B0 00 80                  222         .word       CTOP   ;CP in RAM
      0080B2 95 45                  223         .word      LASTN   ;LAST
      0080B4 00 00                  224 ULAST:  .word      0
                                    225 
      0080B6                        226 ORIG:   
                                    227 ; initialize SP
      0080B6 AE 17 FF         [ 2]  228         LDW     X,#STACK  ;initialize return stack
      0080B9 94               [ 1]  229         LDW     SP,X
      0080BA BF 24            [ 2]  230         LDW     RP0,X
      0080BC AE 16 F0         [ 2]  231         LDW     X,#DATSTK ;initialize data stack
      0080BF BF 22            [ 2]  232         LDW     SP0,X
                                    233 ; initialize PC_5 as output to control LED2
      0080C1 72 1A 50 0D      [ 1]  234         bset PC_CR1,#LED2_BIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      0080C5 72 1A 50 0E      [ 1]  235         bset PC_CR2,#LED2_BIT
      0080C9 72 1A 50 0C      [ 1]  236         bset PC_DDR,#LED2_BIT
      00004D                        237         _ledoff
      0080CD 72 1B 50 0A      [ 1]    1         bres PC_ODR,#LED2_BIT
                                    238 ; initialize clock to HSE
                                    239 ; switch to external 8 Mhz crystal 
      0080D1                        240 clock_init:	
      0080D1 72 12 50 C5      [ 1]  241 	bset CLK_SWCR,#CLK_SWCR_SWEN
      0080D5 A6 B4            [ 1]  242 	ld a,#CLK_SWR_HSE
      0080D7 C7 50 C4         [ 1]  243 	ld CLK_SWR,a
      0080DA C1 50 C3         [ 1]  244 1$:	cp a,CLK_CMSR
      0080DD 26 FB            [ 1]  245 	jrne 1$
                                    246 ; initialize UART1, 115200 8N1
      0080DF                        247 uart1_init:
      0080DF 72 14 50 C7      [ 1]  248 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1
                                    249 	; configure tx pin
      0080E3 72 1A 50 02      [ 1]  250 	bset PA_DDR,#UART1_TX_PIN ; tx pin
      0080E7 72 1A 50 03      [ 1]  251 	bset PA_CR1,#UART1_TX_PIN ; push-pull output
      0080EB 72 1A 50 04      [ 1]  252 	bset PA_CR2,#UART1_TX_PIN ; fast output
                                    253 	; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
      0080EF 35 05 52 33      [ 1]  254 	mov UART1_BRR2,#0x05 ; must be loaded first
      0080F3 35 04 52 32      [ 1]  255 	mov UART1_BRR1,#0x4
      0080F7 35 0C 52 35      [ 1]  256 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                                    257 ; initialize timer4
      0080FB 35 07 53 45      [ 1]  258 	mov TIM4_PSCR,#7 ; prescale 128  
      0080FF 35 7D 53 46      [ 1]  259 	mov TIM4_ARR,#125 ; set for 1msec.
      008103 35 05 53 40      [ 1]  260 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008107 72 10 53 41      [ 1]  261 	bset TIM4_IER,#TIM4_IER_UIE 
      00810B 9A               [ 1]  262         rim
      00810C CC 95 4A         [ 2]  263         jp  COLD   ;default=MN1
                                    264 
                                    265 
                                    266 ;; get millisecond counter 
                                    267 ;; msec ( -- u )
      00810F 00 00                  268         .word 0 
                           000091   269 LINK = . 
      008111 04                     270         .byte 4
      008112 6D 73 65 63            271         .ascii "msec"
      008116                        272 MSEC: 
      008116 1D 00 02         [ 2]  273         subw x,#CELLL 
      008119 90 BE 26         [ 2]  274         ldw y,MS 
      00811C FF               [ 2]  275         ldw (x),y 
      00811D 81               [ 4]  276         ret 
                                    277 
                                    278 ;; Device dependent I/O
                                    279 ;       ?RX     ( -- c T | F )
                                    280 ;         Return input byte and true, or false.
      00811E 81 11                  281         .word      LINK 
                           0000A0   282 LINK	= .
      008120 04                     283         .byte      4
      008121 3F 4B 45 59            284         .ascii     "?KEY"
      008125                        285 QKEY:
      008125 90 5F            [ 1]  286         CLRW Y 
      008127 72 0B 52 30 0B   [ 2]  287         BTJF UART1_SR,#UART_SR_RXNE,INCH   ;check status
      00812C C6 52 31         [ 1]  288         LD    A,UART1_DR   ;get char in A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      00812F 1D 00 02         [ 2]  289 	SUBW	X,#2
      008132 E7 01            [ 1]  290         LD     (1,X),A
      008134 7F               [ 1]  291 	CLR	(X)
      008135 90 53            [ 2]  292         CPLW     Y
      008137                        293 INCH:
      008137 1D 00 02         [ 2]  294 	SUBW	X,#2
      00813A FF               [ 2]  295         LDW     (X),Y
      00813B 81               [ 4]  296         RET
                                    297 
                                    298 ;       TX!     ( c -- )
                                    299 ;       Send character c to  output device.
      00813C 81 20                  300         .word      LINK
                           0000BE   301 LINK	= .
      00813E 04                     302         .byte      4
      00813F 45 4D 49 54            303         .ascii     "EMIT"
      008143                        304 EMIT:
      008143 E6 01            [ 1]  305         LD     A,(1,X)
      008145 1C 00 02         [ 2]  306 	ADDW	X,#2
      008148 72 0F 52 30 FB   [ 2]  307 OUTPUT: BTJF UART1_SR,#UART_SR_TXE,OUTPUT  ;loop until tdre
      00814D C7 52 31         [ 1]  308         LD    UART1_DR,A   ;send A
      008150 81               [ 4]  309         RET
                                    310 
                                    311 ;; The kernel
                                    312 
                                    313 ;       doLIT   ( -- w )
                                    314 ;       Push an inline literal.
      008151 81 3E                  315         .word      LINK
                           0000D3   316 LINK	= 	.
      008153 45                     317 	.byte      COMPO+5
      008154 64 6F 4C 69 74         318         .ascii     "doLit"
      008159                        319 DOLIT:
      008159 1D 00 02         [ 2]  320 	SUBW X,#2
      00815C 90 85            [ 2]  321         POPW Y
      00815E 90 BF 1C         [ 2]  322 	LDW YTEMP,Y
      008161 90 FE            [ 2]  323 	LDW Y,(Y)
      008163 FF               [ 2]  324         LDW (X),Y
      008164 90 BE 1C         [ 2]  325         LDW Y,YTEMP
      008167 90 EC 02         [ 2]  326 	JP (2,Y)
                                    327 
                                    328 ;       next    ( -- )
                                    329 ;       Code for  single index loop.
      00816A 81 53                  330         .word      LINK
                           0000EC   331 LINK	= 	.
      00816C 44                     332 	.byte      COMPO+4
      00816D 6E 65 78 74            333         .ascii     "next"
      008171                        334 DONXT:
      008171 16 03            [ 2]  335 	LDW Y,(3,SP)
      008173 90 5A            [ 2]  336 	DECW Y
      008175 2A 07            [ 1]  337 	JRPL NEX1
      008177 90 85            [ 2]  338 	POPW Y
      008179 84               [ 1]  339 	POP A
      00817A 84               [ 1]  340 	POP A
      00817B 90 EC 02         [ 2]  341     JP (2,Y)
      00817E                        342 NEX1:
      00817E 17 03            [ 2]  343     LDW (3,SP),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      008180 90 85            [ 2]  344     POPW Y
      008182 90 FE            [ 2]  345 	LDW Y,(Y)
      008184 90 FC            [ 2]  346 	JP (Y)
                                    347 
                                    348 ;       ?branch ( f -- )
                                    349 ;       Branch if flag is zero.
      008186 81 6C                  350         .word      LINK
                           000108   351 LINK	= 	.
      008188 47                     352 	.byte      COMPO+7
      008189 3F 62 72 61 6E 63 68   353         .ascii     "?branch"
      008190                        354 QBRAN:	
      008190 90 93            [ 1]  355         LDW Y,X
      008192 1C 00 02         [ 2]  356 	ADDW X,#2
      008195 90 FE            [ 2]  357 	LDW Y,(Y)
      008197 27 0E            [ 1]  358         JREQ     BRAN
      008199 90 85            [ 2]  359 	POPW Y
      00819B 90 EC 02         [ 2]  360 	JP (2,Y)
                                    361         
                                    362 ;       branch  ( -- )
                                    363 ;       Branch to an inline address.
      00819E 81 88                  364         .word      LINK
                           000120   365 LINK	= 	.
      0081A0 46                     366 	.byte      COMPO+6
      0081A1 62 72 61 6E 63 68      367         .ascii     "branch"
      0081A7                        368 BRAN:
      0081A7 90 85            [ 2]  369         POPW Y
      0081A9 90 FE            [ 2]  370 	LDW Y,(Y)
      0081AB 90 FC            [ 2]  371         JP     (Y)
                                    372 
                                    373 ;       EXECUTE ( ca -- )
                                    374 ;       Execute  word at ca.
      0081AD 81 A0                  375         .word      LINK
                           00012F   376 LINK	= 	.
      0081AF 07                     377         .byte       7
      0081B0 45 58 45 43 55 54 45   378         .ascii     "EXECUTE"
      0081B7                        379 EXECU:
      0081B7 90 93            [ 1]  380         LDW Y,X
      0081B9 1C 00 02         [ 2]  381 	ADDW X,#2
      0081BC 90 FE            [ 2]  382 	LDW     Y,(Y)
      0081BE 90 FC            [ 2]  383         JP     (Y)
                                    384 
                                    385 ;       EXIT    ( -- )
                                    386 ;       Terminate a colon definition.
      0081C0 81 AF                  387         .word      LINK
                           000142   388 LINK = .
      0081C2 04                     389         .byte      4
      0081C3 45 58 49 54            390         .ascii     "EXIT"
      0081C7                        391 EXIT:
      0081C7 90 85            [ 2]  392         POPW Y
      0081C9 81               [ 4]  393         RET
                                    394 
                                    395 ;       !       ( w a -- )
                                    396 ;       Pop  data stack to memory.
      0081CA 81 C2                  397         .word      LINK
                           00014C   398 LINK = .
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      0081CC 01                     399         .byte      1
      0081CD 21                     400         .ascii     "!"
      0081CE                        401 STORE:
      0081CE 90 93            [ 1]  402         LDW Y,X
      0081D0 90 FE            [ 2]  403         LDW Y,(Y)    ;Y=a
      0081D2 90 BF 1C         [ 2]  404         LDW YTEMP,Y
      0081D5 90 93            [ 1]  405         LDW Y,X
      0081D7 90 EE 02         [ 2]  406         LDW Y,(2,Y)
      0081DA 91 CF 1C         [ 5]  407         LDW [YTEMP],Y
      0081DD 1C 00 04         [ 2]  408         ADDW X,#4 ;store w at a
      0081E0 81               [ 4]  409         RET     
                                    410 
                                    411 ;       @       ( a -- w )
                                    412 ;       Push memory location to stack.
      0081E1 81 CC                  413         .word      LINK
                           000163   414 LINK	= 	.
      0081E3 01                     415         .byte    1
      0081E4 40                     416         .ascii	"@"
      0081E5                        417 AT:
      0081E5 90 93            [ 1]  418         LDW Y,X     ;Y = a
      0081E7 90 FE            [ 2]  419         LDW Y,(Y)
      0081E9 90 FE            [ 2]  420         LDW Y,(Y)
      0081EB FF               [ 2]  421         LDW (X),Y ;w = @Y
      0081EC 81               [ 4]  422         RET     
                                    423 
                                    424 ;       C!      ( c b -- )
                                    425 ;       Pop  data stack to byte memory.
      0081ED 81 E3                  426         .word      LINK
                           00016F   427 LINK	= .
      0081EF 02                     428         .byte      2
      0081F0 43 21                  429         .ascii     "C!"
      0081F2                        430 CSTOR:
      0081F2 90 93            [ 1]  431         LDW Y,X
      0081F4 90 FE            [ 2]  432 	LDW Y,(Y)    ;Y=b
      0081F6 E6 03            [ 1]  433         LD A,(3,X)    ;D = c
      0081F8 90 F7            [ 1]  434         LD  (Y),A     ;store c at b
      0081FA 1C 00 04         [ 2]  435 	ADDW X,#4
      0081FD 81               [ 4]  436         RET     
                                    437 
                                    438 ;       C@      ( b -- c )
                                    439 ;       Push byte in memory to  stack.
      0081FE 81 EF                  440         .word      LINK
                           000180   441 LINK	= 	.
      008200 02                     442         .byte      2
      008201 43 40                  443         .ascii     "C@"
      008203                        444 CAT:
      008203 90 93            [ 1]  445         LDW Y,X     ;Y=b
      008205 90 FE            [ 2]  446         LDW Y,(Y)
      008207 90 F6            [ 1]  447         LD A,(Y)
      008209 E7 01            [ 1]  448         LD (1,X),A
      00820B 7F               [ 1]  449         CLR (X)
      00820C 81               [ 4]  450         RET     
                                    451 
                                    452 ;       RP@     ( -- a )
                                    453 ;       Push current RP to data stack.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      00820D 82 00                  454         .word      LINK
                           00018F   455 LINK	= .
      00820F 03                     456         .byte      3
      008210 72 70 40               457         .ascii     "rp@"
      008213                        458 RPAT:
      008213 90 96            [ 1]  459         LDW Y,SP    ;save return addr
      008215 1D 00 02         [ 2]  460         SUBW X,#2
      008218 FF               [ 2]  461         LDW (X),Y
      008219 81               [ 4]  462         RET     
                                    463 
                                    464 ;       RP!     ( a -- )
                                    465 ;       Set  return stack pointer.
      00821A 82 0F                  466         .word      LINK
                           00019C   467 LINK	= 	. 
      00821C 43                     468 	.byte      COMPO+3
      00821D 72 70 21               469         .ascii     "rp!"
      008220                        470 RPSTO:
      008220 90 85            [ 2]  471         POPW Y
      008222 90 BF 1C         [ 2]  472         LDW YTEMP,Y
      008225 90 93            [ 1]  473         LDW Y,X
      008227 90 FE            [ 2]  474         LDW Y,(Y)
      008229 90 94            [ 1]  475         LDW SP,Y
      00822B 92 CC 1C         [ 5]  476         JP [YTEMP]
                                    477 
                                    478 ;       R>      ( -- w )
                                    479 ;       Pop return stack to data stack.
      00822E 82 1C                  480         .word      LINK
                           0001B0   481 LINK	= 	. 
      008230 42                     482 	.byte      COMPO+2
      008231 52 3E                  483         .ascii     "R>"
      008233                        484 RFROM:
      008233 90 85            [ 2]  485         POPW Y    ;save return addr
      008235 90 BF 1C         [ 2]  486         LDW YTEMP,Y
      008238 90 85            [ 2]  487         POPW Y
      00823A 1D 00 02         [ 2]  488         SUBW X,#2
      00823D FF               [ 2]  489         LDW (X),Y
      00823E 92 CC 1C         [ 5]  490         JP [YTEMP]
                                    491 
                                    492 ;       R@      ( -- w )
                                    493 ;       Copy top of return stack to stack.
      008241 82 30                  494         .word      LINK
                           0001C3   495 LINK	= 	. 
      008243 02                     496         .byte      2
      008244 52 40                  497         .ascii     "R@"
      008246                        498 RAT:
      008246 90 85            [ 2]  499         POPW Y
      008248 90 BF 1C         [ 2]  500         LDW YTEMP,Y
      00824B 90 85            [ 2]  501         POPW Y
      00824D 90 89            [ 2]  502         PUSHW Y
      00824F 1D 00 02         [ 2]  503         SUBW X,#2
      008252 FF               [ 2]  504         LDW (X),Y
      008253 92 CC 1C         [ 5]  505         JP [YTEMP]
                                    506 
                                    507 ;       >R      ( w -- )
                                    508 ;       Push data stack to return stack.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008256 82 43                  509         .word      LINK
                           0001D8   510 LINK	= 	. 
      008258 42                     511 	.byte      COMPO+2
      008259 3E 52                  512         .ascii     ">R"
      00825B                        513 TOR:
      00825B 90 85            [ 2]  514         POPW Y    ;save return addr
      00825D 90 BF 1C         [ 2]  515         LDW YTEMP,Y
      008260 90 93            [ 1]  516         LDW Y,X
      008262 90 FE            [ 2]  517         LDW Y,(Y)
      008264 90 89            [ 2]  518         PUSHW Y    ;restore return addr
      008266 1C 00 02         [ 2]  519         ADDW X,#2
      008269 92 CC 1C         [ 5]  520         JP [YTEMP]
                                    521 
                                    522 ;       SP@     ( -- a )
                                    523 ;       Push current stack pointer.
      00826C 82 58                  524         .word      LINK
                           0001EE   525 LINK	= 	. 
      00826E 03                     526         .byte      3
      00826F 73 70 40               527         .ascii     "sp@"
      008272                        528 SPAT:
      008272 90 93            [ 1]  529 	LDW Y,X
      008274 1D 00 02         [ 2]  530         SUBW X,#2
      008277 FF               [ 2]  531 	LDW (X),Y
      008278 81               [ 4]  532         RET     
                                    533 
                                    534 ;       SP!     ( a -- )
                                    535 ;       Set  data stack pointer.
      008279 82 6E                  536         .word      LINK
                           0001FB   537 LINK	= 	. 
      00827B 03                     538         .byte      3
      00827C 73 70 21               539         .ascii     "sp!"
      00827F                        540 SPSTO:
      00827F FE               [ 2]  541         LDW     X,(X)     ;X = a
      008280 81               [ 4]  542         RET     
                                    543 
                                    544 ;       DROP    ( w -- )
                                    545 ;       Discard top stack item.
      008281 82 7B                  546         .word      LINK
                           000203   547 LINK	= 	. 
      008283 04                     548         .byte      4
      008284 44 52 4F 50            549         .ascii     "DROP"
      008288                        550 DROP:
      008288 1C 00 02         [ 2]  551         ADDW X,#2     
      00828B 81               [ 4]  552         RET     
                                    553 
                                    554 ;       DUP     ( w -- w w )
                                    555 ;       Duplicate  top stack item.
      00828C 82 83                  556         .word      LINK
                           00020E   557 LINK	= 	. 
      00828E 03                     558         .byte      3
      00828F 44 55 50               559         .ascii     "DUP"
      008292                        560 DUPP:
      008292 90 93            [ 1]  561 				LDW Y,X
      008294 1D 00 02         [ 2]  562         SUBW X,#2
      008297 90 FE            [ 2]  563 				LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      008299 FF               [ 2]  564 				LDW (X),Y
      00829A 81               [ 4]  565         RET     
                                    566 
                                    567 ;       SWAP    ( w1 w2 -- w2 w1 )
                                    568 ;       Exchange top two stack items.
      00829B 82 8E                  569         .word      LINK
                           00021D   570 LINK	= 	. 
      00829D 04                     571         .byte      4
      00829E 53 57 41 50            572         .ascii     "SWAP"
      0082A2                        573 SWAPP:
      0082A2 90 93            [ 1]  574         LDW Y,X
      0082A4 90 FE            [ 2]  575         LDW Y,(Y)
      0082A6 90 BF 1C         [ 2]  576         LDW YTEMP,Y
      0082A9 90 93            [ 1]  577         LDW Y,X
      0082AB 90 EE 02         [ 2]  578         LDW Y,(2,Y)
      0082AE FF               [ 2]  579         LDW (X),Y
      0082AF 90 BE 1C         [ 2]  580         LDW Y,YTEMP
      0082B2 EF 02            [ 2]  581         LDW (2,X),Y
      0082B4 81               [ 4]  582         RET     
                                    583 
                                    584 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                    585 ;       Copy second stack item to top.
      0082B5 82 9D                  586         .word      LINK
                           000237   587 LINK	= . 
      0082B7 04                     588         .byte      4
      0082B8 4F 56 45 52            589         .ascii     "OVER"
      0082BC                        590 OVER:
      0082BC 1D 00 02         [ 2]  591         SUBW X,#2
      0082BF 90 93            [ 1]  592         LDW Y,X
      0082C1 90 EE 04         [ 2]  593         LDW Y,(4,Y)
      0082C4 FF               [ 2]  594         LDW (X),Y
      0082C5 81               [ 4]  595         RET     
                                    596 
                                    597 ;       0<      ( n -- t )
                                    598 ;       Return true if n is negative.
      0082C6 82 B7                  599         .word      LINK
                           000248   600 LINK	= . 
      0082C8 02                     601         .byte      2
      0082C9 30 3C                  602         .ascii     "0<"
      0082CB                        603 ZLESS:
      0082CB A6 FF            [ 1]  604         LD A,#0xFF
      0082CD 90 93            [ 1]  605         LDW Y,X
      0082CF 90 FE            [ 2]  606         LDW Y,(Y)
      0082D1 2B 01            [ 1]  607         JRMI     ZL1
      0082D3 4F               [ 1]  608         CLR A   ;false
      0082D4 F7               [ 1]  609 ZL1:    LD     (X),A
      0082D5 E7 01            [ 1]  610         LD (1,X),A
      0082D7 81               [ 4]  611 	RET     
                                    612 
                                    613 ;       AND     ( w w -- w )
                                    614 ;       Bitwise AND.
      0082D8 82 C8                  615         .word      LINK
                           00025A   616 LINK	= . 
      0082DA 03                     617         .byte      3
      0082DB 41 4E 44               618         .ascii     "AND"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      0082DE                        619 ANDD:
      0082DE F6               [ 1]  620         LD  A,(X)    ;D=w
      0082DF E4 02            [ 1]  621         AND A,(2,X)
      0082E1 E7 02            [ 1]  622         LD (2,X),A
      0082E3 E6 01            [ 1]  623         LD A,(1,X)
      0082E5 E4 03            [ 1]  624         AND A,(3,X)
      0082E7 E7 03            [ 1]  625         LD (3,X),A
      0082E9 1C 00 02         [ 2]  626         ADDW X,#2
      0082EC 81               [ 4]  627         RET
                                    628 
                                    629 ;       OR      ( w w -- w )
                                    630 ;       Bitwise inclusive OR.
      0082ED 82 DA                  631         .word      LINK
                           00026F   632 LINK = . 
      0082EF 02                     633         .byte      2
      0082F0 4F 52                  634         .ascii     "OR"
      0082F2                        635 ORR:
      0082F2 F6               [ 1]  636         LD A,(X)    ;D=w
      0082F3 EA 02            [ 1]  637         OR A,(2,X)
      0082F5 E7 02            [ 1]  638         LD (2,X),A
      0082F7 E6 01            [ 1]  639         LD A,(1,X)
      0082F9 EA 03            [ 1]  640         OR A,(3,X)
      0082FB E7 03            [ 1]  641         LD (3,X),A
      0082FD 1C 00 02         [ 2]  642         ADDW X,#2
      008300 81               [ 4]  643         RET
                                    644 
                                    645 ;       XOR     ( w w -- w )
                                    646 ;       Bitwise exclusive OR.
      008301 82 EF                  647         .word      LINK
                           000283   648 LINK	= . 
      008303 03                     649         .byte      3
      008304 58 4F 52               650         .ascii     "XOR"
      008307                        651 XORR:
      008307 F6               [ 1]  652         LD A,(X)    ;D=w
      008308 E8 02            [ 1]  653         XOR A,(2,X)
      00830A E7 02            [ 1]  654         LD (2,X),A
      00830C E6 01            [ 1]  655         LD A,(1,X)
      00830E E8 03            [ 1]  656         XOR A,(3,X)
      008310 E7 03            [ 1]  657         LD (3,X),A
      008312 1C 00 02         [ 2]  658         ADDW X,#2
      008315 81               [ 4]  659         RET
                                    660 
                                    661 ;       UM+     ( u u -- udsum )
                                    662 ;       Add two unsigned single
                                    663 ;       and return a double sum.
      008316 83 03                  664         .word      LINK
                           000298   665 LINK	= . 
      008318 03                     666         .byte      3
      008319 55 4D 2B               667         .ascii     "UM+"
      00831C                        668 UPLUS:
      00831C A6 01            [ 1]  669         LD A,#1
      00831E 90 93            [ 1]  670         LDW Y,X
      008320 90 EE 02         [ 2]  671         LDW Y,(2,Y)
      008323 90 BF 1C         [ 2]  672         LDW YTEMP,Y
      008326 90 93            [ 1]  673         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008328 90 FE            [ 2]  674         LDW Y,(Y)
      00832A 72 B9 00 1C      [ 2]  675         ADDW Y,YTEMP
      00832E EF 02            [ 2]  676         LDW (2,X),Y
      008330 25 01            [ 1]  677         JRC     UPL1
      008332 4F               [ 1]  678         CLR A
      008333 E7 01            [ 1]  679 UPL1:   LD     (1,X),A
      008335 7F               [ 1]  680         CLR (X)
      008336 81               [ 4]  681         RET
                                    682 
                                    683 ;; System and user variables
                                    684 
                                    685 ;       doVAR   ( -- a )
                                    686 ;       Code for VARIABLE and CREATE.
      008337 83 18                  687         .word      LINK
                           0002B9   688 LINK	= . 
      008339 45                     689 	.byte      COMPO+5
      00833A 64 6F 56 61 72         690         .ascii     "doVar"
      00833F                        691 DOVAR:
      00833F 1D 00 02         [ 2]  692 	SUBW X,#2
      008342 90 85            [ 2]  693         POPW Y    ;get return addr (pfa)
      008344 FF               [ 2]  694         LDW (X),Y    ;push on stack
      008345 81               [ 4]  695         RET     ;go to RET of EXEC
                                    696 
                                    697 ;       BASE    ( -- a )
                                    698 ;       Radix base for numeric I/O.
      008346 83 39                  699         .word      LINK        
                           0002C8   700 LINK = . 
      008348 04                     701         .byte      4
      008349 42 41 53 45            702         .ascii     "BASE"
      00834D                        703 BASE:
      00834D 90 AE 00 06      [ 2]  704 	LDW Y,#RAMBASE+6
      008351 1D 00 02         [ 2]  705 	SUBW X,#2
      008354 FF               [ 2]  706         LDW (X),Y
      008355 81               [ 4]  707         RET
                                    708 
                                    709 ;       tmp     ( -- a )
                                    710 ;       A temporary storage.
      008356 83 48                  711         .word      LINK
                                    712         
                           0002D8   713 LINK = . 
      008358 03                     714 	.byte      3
      008359 74 6D 70               715         .ascii     "tmp"
      00835C                        716 TEMP:
      00835C 90 AE 00 08      [ 2]  717 	LDW Y,#RAMBASE+8
      008360 1D 00 02         [ 2]  718 	SUBW X,#2
      008363 FF               [ 2]  719         LDW (X),Y
      008364 81               [ 4]  720         RET
                                    721 
                                    722 ;       >IN     ( -- a )
                                    723 ;        Hold parsing pointer.
      008365 83 58                  724         .word      LINK
                           0002E7   725 LINK = . 
      008367 03                     726         .byte      3
      008368 3E 49 4E               727         .ascii    ">IN"
      00836B                        728 INN:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      00836B 90 AE 00 0A      [ 2]  729 	LDW Y,#RAMBASE+10
      00836F 1D 00 02         [ 2]  730 	SUBW X,#2
      008372 FF               [ 2]  731         LDW (X),Y
      008373 81               [ 4]  732         RET
                                    733 
                                    734 ;       #TIB    ( -- a )
                                    735 ;       Count in terminal input buffer.
      008374 83 67                  736         .word      LINK
                           0002F6   737 LINK = . 
      008376 04                     738         .byte      4
      008377 23 54 49 42            739         .ascii     "#TIB"
      00837B                        740 NTIB:
      00837B 90 AE 00 0C      [ 2]  741 	LDW Y,#RAMBASE+12
      00837F 1D 00 02         [ 2]  742 	SUBW X,#2
      008382 FF               [ 2]  743         LDW (X),Y
      008383 81               [ 4]  744         RET
                                    745 
                                    746 ;       "EVAL   ( -- a )
                                    747 ;       Execution vector of EVAL.
      008384 83 76                  748         .word      LINK
                           000306   749 LINK = . 
      008386 05                     750         .byte      5
      008387 27 65 76 61 6C         751         .ascii     "'eval"
      00838C                        752 TEVAL:
      00838C 90 AE 00 10      [ 2]  753 	LDW Y,#RAMBASE+16
      008390 1D 00 02         [ 2]  754 	SUBW X,#2
      008393 FF               [ 2]  755         LDW (X),Y
      008394 81               [ 4]  756         RET
                                    757 
                                    758 ;       HLD     ( -- a )
                                    759 ;       Hold a pointer of output string.
      008395 83 86                  760         .word      LINK
                           000317   761 LINK = . 
      008397 03                     762         .byte      3
      008398 68 6C 64               763         .ascii     "hld"
      00839B                        764 HLD:
      00839B 90 AE 00 12      [ 2]  765 	LDW Y,#RAMBASE+18
      00839F 1D 00 02         [ 2]  766 	SUBW X,#2
      0083A2 FF               [ 2]  767         LDW (X),Y
      0083A3 81               [ 4]  768         RET
                                    769 
                                    770 ;       CONTEXT ( -- a )
                                    771 ;       Start vocabulary search.
      0083A4 83 97                  772         .word      LINK
                           000326   773 LINK = . 
      0083A6 07                     774         .byte      7
      0083A7 43 4F 4E 54 45 58 54   775         .ascii     "CONTEXT"
      0083AE                        776 CNTXT:
      0083AE 90 AE 00 14      [ 2]  777 	LDW Y,#RAMBASE+20
      0083B2 1D 00 02         [ 2]  778 	SUBW X,#2
      0083B5 FF               [ 2]  779         LDW (X),Y
      0083B6 81               [ 4]  780         RET
                                    781 
                                    782 ;       CP      ( -- a )
                                    783 ;       Point to top of dictionary.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      0083B7 83 A6                  784         .word      LINK
                           000339   785 LINK = . 
      0083B9 02                     786         .byte      2
      0083BA 63 70                  787         .ascii     "cp"
      0083BC                        788 CPP:
      0083BC 90 AE 00 16      [ 2]  789 	LDW Y,#RAMBASE+22
      0083C0 1D 00 02         [ 2]  790 	SUBW X,#2
      0083C3 FF               [ 2]  791         LDW (X),Y
      0083C4 81               [ 4]  792         RET
                                    793 
                                    794 ;       LAST    ( -- a )
                                    795 ;       Point to last name in dictionary.
      0083C5 83 B9                  796         .word      LINK
                           000347   797 LINK = . 
      0083C7 04                     798         .byte      4
      0083C8 6C 61 73 74            799         .ascii     "last"
      0083CC                        800 LAST:
      0083CC 90 AE 00 18      [ 2]  801 	LDW Y,#RAMBASE+24
      0083D0 1D 00 02         [ 2]  802 	SUBW X,#2
      0083D3 FF               [ 2]  803         LDW (X),Y
      0083D4 81               [ 4]  804         RET
                                    805 
                                    806 ;; Common functions
                                    807 
                                    808 ;       ?DUP    ( w -- w w | 0 )
                                    809 ;       Dup tos if its is not zero.
      0083D5 83 C7                  810         .word      LINK
                           000357   811 LINK = . 
      0083D7 04                     812         .byte      4
      0083D8 3F 44 55 50            813         .ascii     "?DUP"
      0083DC                        814 QDUP:
      0083DC 90 93            [ 1]  815         LDW Y,X
      0083DE 90 FE            [ 2]  816 	LDW Y,(Y)
      0083E0 27 04            [ 1]  817         JREQ     QDUP1
      0083E2 1D 00 02         [ 2]  818 	SUBW X,#2
      0083E5 FF               [ 2]  819         LDW (X),Y
      0083E6 81               [ 4]  820 QDUP1:  RET
                                    821 
                                    822 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                    823 ;       Rot 3rd item to top.
      0083E7 83 D7                  824         .word      LINK
                           000369   825 LINK = . 
      0083E9 03                     826         .byte      3
      0083EA 52 4F 54               827         .ascii     "ROT"
      0083ED                        828 ROT:
      0083ED 90 93            [ 1]  829         LDW Y,X
      0083EF 90 EE 04         [ 2]  830 	LDW Y,(4,Y)
      0083F2 90 BF 1C         [ 2]  831 	LDW YTEMP,Y
      0083F5 90 93            [ 1]  832         LDW Y,X
      0083F7 90 EE 02         [ 2]  833         LDW Y,(2,Y)
      0083FA 90 BF 1A         [ 2]  834         LDW XTEMP,Y
      0083FD 90 93            [ 1]  835         LDW Y,X
      0083FF 90 FE            [ 2]  836         LDW Y,(Y)
      008401 EF 02            [ 2]  837         LDW (2,X),Y
      008403 90 BE 1A         [ 2]  838         LDW Y,XTEMP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      008406 EF 04            [ 2]  839         LDW (4,X),Y
      008408 90 BE 1C         [ 2]  840         LDW Y,YTEMP
      00840B FF               [ 2]  841         LDW (X),Y
      00840C 81               [ 4]  842         RET
                                    843 
                                    844 ;       2DROP   ( w w -- )
                                    845 ;       Discard two items on stack.
      00840D 83 E9                  846         .word      LINK
                           00038F   847 LINK = . 
      00840F 05                     848         .byte      5
      008410 32 44 52 4F 50         849         .ascii     "2DROP"
      008415                        850 DDROP:
      008415 1C 00 04         [ 2]  851         ADDW X,#4
      008418 81               [ 4]  852         RET
                                    853 
                                    854 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                    855 ;       Duplicate top two items.
      008419 84 0F                  856         .word      LINK
                           00039B   857 LINK = . 
      00841B 04                     858         .byte      4
      00841C 32 44 55 50            859         .ascii     "2DUP"
      008420                        860 DDUP:
      008420 1D 00 04         [ 2]  861         SUBW X,#4
      008423 90 93            [ 1]  862         LDW Y,X
      008425 90 EE 06         [ 2]  863         LDW Y,(6,Y)
      008428 EF 02            [ 2]  864         LDW (2,X),Y
      00842A 90 93            [ 1]  865         LDW Y,X
      00842C 90 EE 04         [ 2]  866         LDW Y,(4,Y)
      00842F FF               [ 2]  867         LDW (X),Y
      008430 81               [ 4]  868         RET
                                    869 
                                    870 ;       +       ( w w -- sum )
                                    871 ;       Add top two items.
      008431 84 1B                  872         .word      LINK
                           0003B3   873 LINK = . 
      008433 01                     874         .byte      1
      008434 2B                     875         .ascii     "+"
      008435                        876 PLUS:
      008435 90 93            [ 1]  877         LDW Y,X
      008437 90 FE            [ 2]  878         LDW Y,(Y)
      008439 90 BF 1C         [ 2]  879         LDW YTEMP,Y
      00843C 1C 00 02         [ 2]  880         ADDW X,#2
      00843F 90 93            [ 1]  881         LDW Y,X
      008441 90 FE            [ 2]  882         LDW Y,(Y)
      008443 72 B9 00 1C      [ 2]  883         ADDW Y,YTEMP
      008447 FF               [ 2]  884         LDW (X),Y
      008448 81               [ 4]  885         RET
                                    886 
                                    887 ;       NOT     ( w -- w )
                                    888 ;       One's complement of tos.
      008449 84 33                  889         .word      LINK
                           0003CB   890 LINK = . 
      00844B 03                     891         .byte      3
      00844C 4E 4F 54               892         .ascii     "NOT"
      00844F                        893 INVER:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      00844F 90 93            [ 1]  894         LDW Y,X
      008451 90 FE            [ 2]  895         LDW Y,(Y)
      008453 90 53            [ 2]  896         CPLW Y
      008455 FF               [ 2]  897         LDW (X),Y
      008456 81               [ 4]  898         RET
                                    899 
                                    900 ;       NEGATE  ( n -- -n )
                                    901 ;       Two's complement of tos.
      008457 84 4B                  902         .word      LINK
                           0003D9   903 LINK = . 
      008459 06                     904         .byte      6
      00845A 4E 45 47 41 54 45      905         .ascii     "NEGATE"
      008460                        906 NEGAT:
      008460 90 93            [ 1]  907         LDW Y,X
      008462 90 FE            [ 2]  908         LDW Y,(Y)
      008464 90 50            [ 2]  909         NEGW Y
      008466 FF               [ 2]  910         LDW (X),Y
      008467 81               [ 4]  911         RET
                                    912 
                                    913 ;       DNEGATE ( d -- -d )
                                    914 ;       Two's complement of top double.
      008468 84 59                  915         .word      LINK
                           0003EA   916 LINK = . 
      00846A 07                     917         .byte      7
      00846B 44 4E 45 47 41 54 45   918         .ascii     "DNEGATE"
      008472                        919 DNEGA:
      008472 90 93            [ 1]  920         LDW Y,X
      008474 90 FE            [ 2]  921 	LDW Y,(Y)
      008476 90 53            [ 2]  922         CPLW Y     
      008478 90 BF 1C         [ 2]  923 	LDW YTEMP,Y
      00847B 90 93            [ 1]  924         LDW Y,X
      00847D 90 EE 02         [ 2]  925         LDW Y,(2,Y)
      008480 90 53            [ 2]  926         CPLW Y
      008482 90 5C            [ 1]  927         INCW Y
      008484 EF 02            [ 2]  928         LDW (2,X),Y
      008486 90 BE 1C         [ 2]  929         LDW Y,YTEMP
      008489 24 02            [ 1]  930         JRNC DN1 
      00848B 90 5C            [ 1]  931         INCW Y
      00848D FF               [ 2]  932 DN1:    LDW (X),Y
      00848E 81               [ 4]  933         RET
                                    934 
                                    935 ;       -       ( n1 n2 -- n1-n2 )
                                    936 ;       Subtraction.
      00848F 84 6A                  937         .word      LINK
                           000411   938 LINK = . 
      008491 01                     939         .byte      1
      008492 2D                     940         .ascii     "-"
      008493                        941 SUBB:
      008493 90 93            [ 1]  942         LDW Y,X
      008495 90 FE            [ 2]  943         LDW Y,(Y)
      008497 90 BF 1C         [ 2]  944         LDW YTEMP,Y
      00849A 1C 00 02         [ 2]  945         ADDW X,#2
      00849D 90 93            [ 1]  946         LDW Y,X
      00849F 90 FE            [ 2]  947         LDW Y,(Y)
      0084A1 72 B2 00 1C      [ 2]  948         SUBW Y,YTEMP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0084A5 FF               [ 2]  949         LDW (X),Y
      0084A6 81               [ 4]  950         RET
                                    951 
                                    952 ;       ABS     ( n -- n )
                                    953 ;       Return  absolute value of n.
      0084A7 84 91                  954         .word      LINK
                           000429   955 LINK = . 
      0084A9 03                     956         .byte      3
      0084AA 41 42 53               957         .ascii     "ABS"
      0084AD                        958 ABSS:
      0084AD 90 93            [ 1]  959         LDW Y,X
      0084AF 90 FE            [ 2]  960 	LDW Y,(Y)
      0084B1 2A 03            [ 1]  961         JRPL     AB1     ;negate:
      0084B3 90 50            [ 2]  962         NEGW     Y     ;else negate hi byte
      0084B5 FF               [ 2]  963         LDW (X),Y
      0084B6 81               [ 4]  964 AB1:    RET
                                    965 
                                    966 ;       =       ( w w -- t )
                                    967 ;       Return true if top two are =al.
      0084B7 84 A9                  968         .word      LINK
                           000439   969 LINK = . 
      0084B9 01                     970         .byte      1
      0084BA 3D                     971         .ascii     "="
      0084BB                        972 EQUAL:
      0084BB A6 FF            [ 1]  973         LD A,#0xFF  ;true
      0084BD 90 93            [ 1]  974         LDW Y,X    ;D = n2
      0084BF 90 FE            [ 2]  975         LDW Y,(Y)
      0084C1 90 BF 1C         [ 2]  976         LDW YTEMP,Y
      0084C4 1C 00 02         [ 2]  977         ADDW X,#2
      0084C7 90 93            [ 1]  978         LDW Y,X
      0084C9 90 FE            [ 2]  979         LDW Y,(Y)
      0084CB 90 B3 1C         [ 2]  980         CPW Y,YTEMP     ;if n2 <> n1
      0084CE 27 01            [ 1]  981         JREQ     EQ1
      0084D0 4F               [ 1]  982         CLR A
      0084D1 F7               [ 1]  983 EQ1:    LD (X),A
      0084D2 E7 01            [ 1]  984         LD (1,X),A
      0084D4 81               [ 4]  985 	RET     
                                    986 
                                    987 ;       U<      ( u u -- t )
                                    988 ;       Unsigned compare of top two items.
      0084D5 84 B9                  989         .word      LINK
                           000457   990 LINK = . 
      0084D7 02                     991         .byte      2
      0084D8 55 3C                  992         .ascii     "U<"
      0084DA                        993 ULESS:
      0084DA A6 FF            [ 1]  994         LD A,#0xFF  ;true
      0084DC 90 93            [ 1]  995         LDW Y,X    ;D = n2
      0084DE 90 FE            [ 2]  996         LDW Y,(Y)
      0084E0 90 BF 1C         [ 2]  997         LDW YTEMP,Y
      0084E3 1C 00 02         [ 2]  998         ADDW X,#2
      0084E6 90 93            [ 1]  999         LDW Y,X
      0084E8 90 FE            [ 2] 1000         LDW Y,(Y)
      0084EA 90 B3 1C         [ 2] 1001         CPW Y,YTEMP     ;if n2 <> n1
      0084ED 25 01            [ 1] 1002         JRULT     ULES1
      0084EF 4F               [ 1] 1003         CLR A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      0084F0 F7               [ 1] 1004 ULES1:  LD (X),A
      0084F1 E7 01            [ 1] 1005         LD (1,X),A
      0084F3 81               [ 4] 1006 	RET     
                                   1007 
                                   1008 ;       <       ( n1 n2 -- t )
                                   1009 ;       Signed compare of top two items.
      0084F4 84 D7                 1010         .word      LINK
                           000476  1011 LINK = . 
      0084F6 01                    1012         .byte      1
      0084F7 3C                    1013         .ascii     "<"
      0084F8                       1014 LESS:
      0084F8 A6 FF            [ 1] 1015         LD A,#0xFF  ;true
      0084FA 90 93            [ 1] 1016         LDW Y,X    ;D = n2
      0084FC 90 FE            [ 2] 1017         LDW Y,(Y)
      0084FE 90 BF 1C         [ 2] 1018         LDW YTEMP,Y
      008501 1C 00 02         [ 2] 1019         ADDW X,#2
      008504 90 93            [ 1] 1020         LDW Y,X
      008506 90 FE            [ 2] 1021         LDW Y,(Y)
      008508 90 B3 1C         [ 2] 1022         CPW Y,YTEMP     ;if n2 <> n1
      00850B 2F 01            [ 1] 1023         JRSLT     LT1
      00850D 4F               [ 1] 1024         CLR A
      00850E F7               [ 1] 1025 LT1:    LD (X),A
      00850F E7 01            [ 1] 1026         LD (1,X),A
      008511 81               [ 4] 1027 	RET     
                                   1028 
                                   1029 ;       MAX     ( n n -- n )
                                   1030 ;       Return greater of two top items.
      008512 84 F6                 1031         .word      LINK
                           000494  1032 LINK = . 
      008514 03                    1033         .byte      3
      008515 4D 41 58              1034         .ascii     "MAX"
      008518                       1035 MAX:
      008518 90 93            [ 1] 1036         LDW Y,X    ;D = n2
      00851A 90 EE 02         [ 2] 1037         LDW Y,(2,Y)
      00851D 90 BF 1C         [ 2] 1038         LDW YTEMP,Y
      008520 90 93            [ 1] 1039         LDW Y,X
      008522 90 FE            [ 2] 1040         LDW Y,(Y)
      008524 90 B3 1C         [ 2] 1041         CPW Y,YTEMP     ;if n2 <> n1
      008527 2F 02            [ 1] 1042         JRSLT     MAX1
      008529 EF 02            [ 2] 1043         LDW (2,X),Y
      00852B 1C 00 02         [ 2] 1044 MAX1:   ADDW X,#2
      00852E 81               [ 4] 1045 	RET     
                                   1046 
                                   1047 ;       MIN     ( n n -- n )
                                   1048 ;       Return smaller of top two items.
      00852F 85 14                 1049         .word      LINK
                           0004B1  1050 LINK = . 
      008531 03                    1051         .byte      3
      008532 4D 49 4E              1052         .ascii     "MIN"
      008535                       1053 MIN:
      008535 90 93            [ 1] 1054         LDW Y,X    ;D = n2
      008537 90 EE 02         [ 2] 1055         LDW Y,(2,Y)
      00853A 90 BF 1C         [ 2] 1056         LDW YTEMP,Y
      00853D 90 93            [ 1] 1057         LDW Y,X
      00853F 90 FE            [ 2] 1058         LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      008541 90 B3 1C         [ 2] 1059         CPW Y,YTEMP     ;if n2 <> n1
      008544 2C 02            [ 1] 1060         JRSGT     MIN1
      008546 EF 02            [ 2] 1061         LDW (2,X),Y
      008548 1C 00 02         [ 2] 1062 MIN1:	ADDW X,#2
      00854B 81               [ 4] 1063 	RET     
                                   1064 
                                   1065 ;       WITHIN  ( u ul uh -- t )
                                   1066 ;       Return true if u is within
                                   1067 ;       range of ul and uh. ( ul <= u < uh )
      00854C 85 31                 1068         .word      LINK
                           0004CE  1069 LINK = . 
      00854E 06                    1070         .byte      6
      00854F 57 49 54 48 49 4E     1071         .ascii     "WITHIN"
      008555                       1072 WITHI:
      008555 CD 82 BC         [ 4] 1073         CALL     OVER
      008558 CD 84 93         [ 4] 1074         CALL     SUBB
      00855B CD 82 5B         [ 4] 1075         CALL     TOR
      00855E CD 84 93         [ 4] 1076         CALL     SUBB
      008561 CD 82 33         [ 4] 1077         CALL     RFROM
      008564 CC 84 DA         [ 2] 1078         JP     ULESS
                                   1079 
                                   1080 ;; Divide
                                   1081 
                                   1082 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1083 ;       Unsigned divide of a double by a
                                   1084 ;       single. Return mod and quotient.
      008567 85 4E                 1085         .word      LINK
                           0004E9  1086 LINK = . 
      008569 06                    1087         .byte      6
      00856A 55 4D 2F 4D 4F 44     1088         .ascii     "UM/MOD"
      008570                       1089 UMMOD:
      008570 BF 1A            [ 2] 1090 	LDW XTEMP,X	; save stack pointer
      008572 FE               [ 2] 1091 	LDW X,(X)		; un
      008573 BF 1C            [ 2] 1092 	LDW YTEMP,X ; save un
      008575 90 BE 1A         [ 2] 1093 	LDW Y,XTEMP	; stack pointer
      008578 90 EE 04         [ 2] 1094 	LDW Y,(4,Y) ; Y=udl
      00857B BE 1A            [ 2] 1095 	LDW X,XTEMP
      00857D EE 02            [ 2] 1096 	LDW X,(2,X)	; X=udh
      00857F B3 1C            [ 2] 1097 	CPW X,YTEMP
      008581 23 0F            [ 2] 1098 	JRULE MMSM1
      008583 BE 1A            [ 2] 1099 	LDW X,XTEMP
      008585 1C 00 02         [ 2] 1100 	ADDW X,#2	; pop off 1 level
      008588 90 AE FF FF      [ 2] 1101 	LDW Y,#0xFFFF
      00858C FF               [ 2] 1102 	LDW (X),Y
      00858D 90 5F            [ 1] 1103 	CLRW Y
      00858F EF 02            [ 2] 1104 	LDW (2,X),Y
      008591 81               [ 4] 1105 	RET
      008592                       1106 MMSM1:
      008592 A6 11            [ 1] 1107 	LD A,#17	; loop count
      008594                       1108 MMSM3:
      008594 B3 1C            [ 2] 1109 	CPW X,YTEMP	; compare udh to un
      008596 25 04            [ 1] 1110 	JRULT MMSM4	; can't subtract
      008598 72 B0 00 1C      [ 2] 1111 	SUBW X,YTEMP	; can subtract
      00859C                       1112 MMSM4:
      00859C 8C               [ 1] 1113 	CCF	; quotient bit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      00859D 90 59            [ 2] 1114 	RLCW Y	; rotate into quotient
      00859F 59               [ 2] 1115 	RLCW X	; rotate into remainder
      0085A0 4A               [ 1] 1116 	DEC A	; repeat
      0085A1 22 F1            [ 1] 1117 	JRUGT MMSM3
      0085A3 57               [ 2] 1118 	SRAW X
      0085A4 BF 1C            [ 2] 1119 	LDW YTEMP,X	; done, save remainder
      0085A6 BE 1A            [ 2] 1120 	LDW X,XTEMP
      0085A8 1C 00 02         [ 2] 1121 	ADDW X,#2	; drop
      0085AB FF               [ 2] 1122 	LDW (X),Y
      0085AC 90 BE 1C         [ 2] 1123 	LDW Y,YTEMP	; save quotient
      0085AF EF 02            [ 2] 1124 	LDW (2,X),Y
      0085B1 81               [ 4] 1125 	RET
                                   1126 	
                                   1127 ;       M/MOD   ( d n -- r q )
                                   1128 ;       Signed floored divide of double by
                                   1129 ;       single. Return mod and quotient.
      0085B2 85 69                 1130         .word      LINK
                           000534  1131 LINK = . 
      0085B4 05                    1132         .byte      5
      0085B5 4D 2F 4D 4F 44        1133         .ascii     "M/MOD"
      0085BA                       1134 MSMOD:  
      0085BA CD 82 92         [ 4] 1135         CALL	DUPP
      0085BD CD 82 CB         [ 4] 1136         CALL	ZLESS
      0085C0 CD 82 92         [ 4] 1137         CALL	DUPP
      0085C3 CD 82 5B         [ 4] 1138         CALL	TOR
      0085C6 CD 81 90         [ 4] 1139         CALL	QBRAN
      0085C9 85 D7                 1140         .word	MMOD1
      0085CB CD 84 60         [ 4] 1141         CALL	NEGAT
      0085CE CD 82 5B         [ 4] 1142         CALL	TOR
      0085D1 CD 84 72         [ 4] 1143         CALL	DNEGA
      0085D4 CD 82 33         [ 4] 1144         CALL	RFROM
      0085D7 CD 82 5B         [ 4] 1145 MMOD1:	CALL	TOR
      0085DA CD 82 92         [ 4] 1146         CALL	DUPP
      0085DD CD 82 CB         [ 4] 1147         CALL	ZLESS
      0085E0 CD 81 90         [ 4] 1148         CALL	QBRAN
      0085E3 85 EB                 1149         .word	MMOD2
      0085E5 CD 82 46         [ 4] 1150         CALL	RAT
      0085E8 CD 84 35         [ 4] 1151         CALL	PLUS
      0085EB CD 82 33         [ 4] 1152 MMOD2:	CALL	RFROM
      0085EE CD 85 70         [ 4] 1153         CALL	UMMOD
      0085F1 CD 82 33         [ 4] 1154         CALL	RFROM
      0085F4 CD 81 90         [ 4] 1155         CALL	QBRAN
      0085F7 86 02                 1156         .word	MMOD3
      0085F9 CD 82 A2         [ 4] 1157         CALL	SWAPP
      0085FC CD 84 60         [ 4] 1158         CALL	NEGAT
      0085FF CD 82 A2         [ 4] 1159         CALL	SWAPP
      008602 81               [ 4] 1160 MMOD3:	RET
                                   1161 
                                   1162 ;       /MOD    ( n n -- r q )
                                   1163 ;       Signed divide. Return mod and quotient.
      008603 85 B4                 1164         .word      LINK
                           000585  1165 LINK = . 
      008605 04                    1166         .byte      4
      008606 2F 4D 4F 44           1167         .ascii     "/MOD"
      00860A                       1168 SLMOD:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      00860A CD 82 BC         [ 4] 1169         CALL	OVER
      00860D CD 82 CB         [ 4] 1170         CALL	ZLESS
      008610 CD 82 A2         [ 4] 1171         CALL	SWAPP
      008613 CC 85 BA         [ 2] 1172         JP	MSMOD
                                   1173 
                                   1174 ;       MOD     ( n n -- r )
                                   1175 ;       Signed divide. Return mod only.
      008616 86 05                 1176         .word      LINK
                           000598  1177 LINK = . 
      008618 03                    1178         .byte      3
      008619 4D 4F 44              1179         .ascii     "MOD"
      00861C                       1180 MODD:
      00861C CD 86 0A         [ 4] 1181 	CALL	SLMOD
      00861F CC 82 88         [ 2] 1182 	JP	DROP
                                   1183 
                                   1184 ;       /       ( n n -- q )
                                   1185 ;       Signed divide. Return quotient only.
      008622 86 18                 1186         .word      LINK
                           0005A4  1187 LINK = . 
      008624 01                    1188         .byte      1
      008625 2F                    1189         .ascii     "/"
      008626                       1190 SLASH:
      008626 CD 86 0A         [ 4] 1191         CALL	SLMOD
      008629 CD 82 A2         [ 4] 1192         CALL	SWAPP
      00862C CC 82 88         [ 2] 1193         JP	DROP
                                   1194 
                                   1195 ;; Multiply
                                   1196 
                                   1197 ;       UM*     ( u u -- ud )
                                   1198 ;       Unsigned multiply. Return double product.
      00862F 86 24                 1199         .word      LINK
                           0005B1  1200 LINK = . 
      008631 03                    1201         .byte      3
      008632 55 4D 2A              1202         .ascii     "UM*"
      008635                       1203 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
      008635 E6 02            [ 1] 1204 	LD A,(2,X)	; b
      008637 90 97            [ 1] 1205 	LD YL,A
      008639 F6               [ 1] 1206 	LD A,(X)	; d
      00863A 90 42            [ 4] 1207 	MUL Y,A
      00863C 90 BF 1A         [ 2] 1208 	LDW PROD1,Y
      00863F E6 03            [ 1] 1209 	LD A,(3,X)	; a
      008641 90 97            [ 1] 1210 	LD YL,A
      008643 F6               [ 1] 1211 	LD A,(X)	; d
      008644 90 42            [ 4] 1212 	MUL Y,A
      008646 90 BF 1C         [ 2] 1213 	LDW PROD2,Y
      008649 E6 02            [ 1] 1214 	LD A,(2,X)	; b
      00864B 90 97            [ 1] 1215 	LD YL,A
      00864D E6 01            [ 1] 1216 	LD A,(1,X)	; c
      00864F 90 42            [ 4] 1217 	MUL Y,A
      008651 90 BF 1E         [ 2] 1218 	LDW PROD3,Y
      008654 E6 03            [ 1] 1219 	LD A,(3,X)	; a
      008656 90 97            [ 1] 1220 	LD YL,A
      008658 E6 01            [ 1] 1221 	LD A,(1,X)	; c
      00865A 90 42            [ 4] 1222 	MUL Y,A	; least signifiant product
      00865C 4F               [ 1] 1223 	CLR A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      00865D 90 01            [ 1] 1224 	RRWA Y
      00865F E7 03            [ 1] 1225 	LD (3,X),A	; store least significant byte
      008661 72 B9 00 1E      [ 2] 1226 	ADDW Y,PROD3
      008665 4F               [ 1] 1227 	CLR A
      008666 A9 00            [ 1] 1228 	ADC A,#0	; save carry
      008668 B7 20            [ 1] 1229 	LD CARRY,A
      00866A 72 B9 00 1C      [ 2] 1230 	ADDW Y,PROD2
      00866E B6 20            [ 1] 1231 	LD A,CARRY
      008670 A9 00            [ 1] 1232 	ADC A,#0	; add 2nd carry
      008672 B7 20            [ 1] 1233 	LD CARRY,A
      008674 4F               [ 1] 1234 	CLR A
      008675 90 01            [ 1] 1235 	RRWA Y
      008677 E7 02            [ 1] 1236 	LD (2,X),A	; 2nd product byte
      008679 72 B9 00 1A      [ 2] 1237 	ADDW Y,PROD1
      00867D 90 01            [ 1] 1238 	RRWA Y
      00867F E7 01            [ 1] 1239 	LD (1,X),A	; 3rd product byte
      008681 90 01            [ 1] 1240 	RRWA Y  	; 4th product byte now in A
      008683 B9 20            [ 1] 1241 	ADC A,CARRY	; fill in carry bits
      008685 F7               [ 1] 1242 	LD (X),A
      008686 81               [ 4] 1243 	RET
                                   1244 
                                   1245 ;       *       ( n n -- n )
                                   1246 ;       Signed multiply. Return single product.
      008687 86 31                 1247         .word      LINK
                           000609  1248 LINK = . 
      008689 01                    1249         .byte      1
      00868A 2A                    1250         .ascii     "*"
      00868B                       1251 STAR:
      00868B CD 86 35         [ 4] 1252 	CALL	UMSTA
      00868E CC 82 88         [ 2] 1253 	JP	DROP
                                   1254 
                                   1255 ;       M*      ( n n -- d )
                                   1256 ;       Signed multiply. Return double product.
      008691 86 89                 1257         .word      LINK
                           000613  1258 LINK = . 
      008693 02                    1259         .byte      2
      008694 4D 2A                 1260         .ascii     "M*"
      008696                       1261 MSTAR:      
      008696 CD 84 20         [ 4] 1262         CALL	DDUP
      008699 CD 83 07         [ 4] 1263         CALL	XORR
      00869C CD 82 CB         [ 4] 1264         CALL	ZLESS
      00869F CD 82 5B         [ 4] 1265         CALL	TOR
      0086A2 CD 84 AD         [ 4] 1266         CALL	ABSS
      0086A5 CD 82 A2         [ 4] 1267         CALL	SWAPP
      0086A8 CD 84 AD         [ 4] 1268         CALL	ABSS
      0086AB CD 86 35         [ 4] 1269         CALL	UMSTA
      0086AE CD 82 33         [ 4] 1270         CALL	RFROM
      0086B1 CD 81 90         [ 4] 1271         CALL	QBRAN
      0086B4 86 B9                 1272         .word	MSTA1
      0086B6 CD 84 72         [ 4] 1273         CALL	DNEGA
      0086B9 81               [ 4] 1274 MSTA1:	RET
                                   1275 
                                   1276 ;       . /MOD   ( n1 n2 n3 -- r q )
                                   1277 ;       Multiply n1 and n2, then divide
                                   1278 ;       by n3. Return mod and quotient.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0086BA 86 93                 1279         .word      LINK
                           00063C  1280 LINK = . 
      0086BC 05                    1281         .byte      5
      0086BD 2A 2F 4D 4F 44        1282         .ascii     "*/MOD"
      0086C2                       1283 SSMOD:
      0086C2 CD 82 5B         [ 4] 1284         CALL     TOR
      0086C5 CD 86 96         [ 4] 1285         CALL     MSTAR
      0086C8 CD 82 33         [ 4] 1286         CALL     RFROM
      0086CB CC 85 BA         [ 2] 1287         JP     MSMOD
                                   1288 
                                   1289 ;       */      ( n1 n2 n3 -- q )
                                   1290 ;       Multiply n1 by n2, then divide
                                   1291 ;       by n3. Return quotient only.
      0086CE 86 BC                 1292         .word      LINK
                           000650  1293 LINK = . 
      0086D0 02                    1294         .byte      2
      0086D1 2E 20 2F              1295         .ascii     ". /"
      0086D4                       1296 STASL:
      0086D4 CD 86 C2         [ 4] 1297         CALL	SSMOD
      0086D7 CD 82 A2         [ 4] 1298         CALL	SWAPP
      0086DA CC 82 88         [ 2] 1299         JP	DROP
                                   1300 
                                   1301 ;; Miscellaneous
                                   1302 
                                   1303 ;       CELL+   ( a -- a )
                                   1304 ;       Add cell size in byte to address.
      0086DD 86 D0                 1305         .word      LINK
                           00065F  1306 LINK = . 
      0086DF 02                    1307         .byte       2
      0086E0 32 2B                 1308         .ascii     "2+"
      0086E2                       1309 CELLP:
      0086E2 90 93            [ 1] 1310         LDW Y,X
      0086E4 90 FE            [ 2] 1311 	LDW Y,(Y)
      0086E6 72 A9 00 02      [ 2] 1312         ADDW Y,#CELLL 
      0086EA FF               [ 2] 1313         LDW (X),Y
      0086EB 81               [ 4] 1314         RET
                                   1315 
                                   1316 ;       CELL-   ( a -- a )
                                   1317 ;       Subtract 2 from address.
      0086EC 86 DF                 1318         .word      LINK
                           00066E  1319 LINK = . 
      0086EE 02                    1320         .byte       2
      0086EF 32 2D                 1321         .ascii     "2-"
      0086F1                       1322 CELLM:
      0086F1 90 93            [ 1] 1323         LDW Y,X
      0086F3 90 FE            [ 2] 1324 	LDW Y,(Y)
      0086F5 72 A2 00 02      [ 2] 1325         SUBW Y,#CELLL
      0086F9 FF               [ 2] 1326         LDW (X),Y
      0086FA 81               [ 4] 1327         RET
                                   1328 
                                   1329 ;       CELLS   ( n -- n )
                                   1330 ;       Multiply tos by 2.
      0086FB 86 EE                 1331         .word      LINK
                           00067D  1332 LINK = . 
      0086FD 02                    1333         .byte       2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      0086FE 32 2A                 1334         .ascii     "2*"
      008700                       1335 CELLS:
      008700 90 93            [ 1] 1336         LDW Y,X
      008702 90 FE            [ 2] 1337 	LDW Y,(Y)
      008704 90 58            [ 2] 1338         SLAW Y
      008706 FF               [ 2] 1339         LDW (X),Y
      008707 81               [ 4] 1340         RET
                                   1341 
                                   1342 ;       1+      ( a -- a )
                                   1343 ;       Add cell size in byte to address.
      008708 86 FD                 1344         .word      LINK
                           00068A  1345 LINK = . 
      00870A 02                    1346         .byte      2
      00870B 31 2B                 1347         .ascii     "1+"
      00870D                       1348 ONEP:
      00870D 90 93            [ 1] 1349         LDW Y,X
      00870F 90 FE            [ 2] 1350 	LDW Y,(Y)
      008711 90 5C            [ 1] 1351         INCW Y
      008713 FF               [ 2] 1352         LDW (X),Y
      008714 81               [ 4] 1353         RET
                                   1354 
                                   1355 ;       1-      ( a -- a )
                                   1356 ;       Subtract 2 from address.
      008715 87 0A                 1357         .word      LINK
                           000697  1358 LINK = . 
      008717 02                    1359         .byte      2
      008718 31 2D                 1360         .ascii     "1-"
      00871A                       1361 ONEM:
      00871A 90 93            [ 1] 1362         LDW Y,X
      00871C 90 FE            [ 2] 1363 	LDW Y,(Y)
      00871E 90 5A            [ 2] 1364         DECW Y
      008720 FF               [ 2] 1365         LDW (X),Y
      008721 81               [ 4] 1366         RET
                                   1367 
                                   1368 ;       2/      ( n -- n )
                                   1369 ;       Multiply tos by 2.
      008722 87 17                 1370         .word      LINK
                           0006A4  1371 LINK = . 
      008724 02                    1372         .byte      2
      008725 32 2F                 1373         .ascii     "2/"
      008727                       1374 TWOSL:
      008727 90 93            [ 1] 1375         LDW Y,X
      008729 90 FE            [ 2] 1376 	LDW Y,(Y)
      00872B 90 57            [ 2] 1377         SRAW Y
      00872D FF               [ 2] 1378         LDW (X),Y
      00872E 81               [ 4] 1379         RET
                                   1380 
                                   1381 ;       BL      ( -- 32 )
                                   1382 ;       Return 32,  blank character.
      00872F 87 24                 1383         .word      LINK
                           0006B1  1384 LINK = . 
      008731 02                    1385         .byte      2
      008732 42 4C                 1386         .ascii     "BL"
      008734                       1387 BLANK:
      008734 1D 00 02         [ 2] 1388         SUBW X,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      008737 90 AE 00 20      [ 2] 1389 	LDW Y,#32
      00873B FF               [ 2] 1390         LDW (X),Y
      00873C 81               [ 4] 1391         RET
                                   1392 
                                   1393 ;         0     ( -- 0)
                                   1394 ;         Return 0.
      00873D 87 31                 1395         .word      LINK
                           0006BF  1396 LINK = . 
      00873F 01                    1397         .byte       1
      008740 30                    1398         .ascii     "0"
      008741                       1399 ZERO:
      008741 1D 00 02         [ 2] 1400         SUBW X,#2
      008744 90 5F            [ 1] 1401 	CLRW Y
      008746 FF               [ 2] 1402         LDW (X),Y
      008747 81               [ 4] 1403         RET
                                   1404 
                                   1405 ;         1     ( -- 1)
                                   1406 ;         Return 1.
      008748 87 3F                 1407         .word      LINK
                           0006CA  1408 LINK = . 
      00874A 01                    1409         .byte       1
      00874B 31                    1410         .ascii     "1"
      00874C                       1411 ONE:
      00874C 1D 00 02         [ 2] 1412         SUBW X,#2
      00874F 90 AE 00 01      [ 2] 1413 	LDW Y,#1
      008753 FF               [ 2] 1414         LDW (X),Y
      008754 81               [ 4] 1415         RET
                                   1416 
                                   1417 ;         -1    ( -- -1)
                                   1418 ;         Return 32,  blank character.
      008755 87 4A                 1419         .word      LINK
                           0006D7  1420 LINK = . 
      008757 02                    1421         .byte       2
      008758 2D 31                 1422         .ascii     "-1"
      00875A                       1423 MONE:
      00875A 1D 00 02         [ 2] 1424         SUBW X,#2
      00875D 90 AE FF FF      [ 2] 1425 	LDW Y,#0xFFFF
      008761 FF               [ 2] 1426         LDW (X),Y
      008762 81               [ 4] 1427         RET
                                   1428 
                                   1429 ;       >CHAR   ( c -- c )
                                   1430 ;       Filter non-printing characters.
      008763 87 57                 1431         .word      LINK
                           0006E5  1432 LINK = . 
      008765 05                    1433         .byte      5
      008766 3E 43 48 41 52        1434         .ascii     ">CHAR"
      00876B                       1435 TCHAR:
      00876B CD 81 59         [ 4] 1436         CALL     DOLIT
      00876E 00 7F                 1437         .word       0x7F
      008770 CD 82 DE         [ 4] 1438         CALL     ANDD
      008773 CD 82 92         [ 4] 1439         CALL     DUPP    ;mask msb
      008776 CD 81 59         [ 4] 1440         CALL     DOLIT
      008779 00 7F                 1441         .word      127
      00877B CD 87 34         [ 4] 1442         CALL     BLANK
      00877E CD 85 55         [ 4] 1443         CALL     WITHI   ;check for printable
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008781 CD 81 90         [ 4] 1444         CALL     QBRAN
      008784 87 8E                 1445         .word      TCHA1
      008786 CD 82 88         [ 4] 1446         CALL     DROP
      008789 CD 81 59         [ 4] 1447         CALL     DOLIT
      00878C 00 5F                 1448         .word     0x5F		; "_"     ;replace non-printables
      00878E 81               [ 4] 1449 TCHA1:  RET
                                   1450 
                                   1451 ;       DEPTH   ( -- n )
                                   1452 ;       Return  depth of  data stack.
      00878F 87 65                 1453         .word      LINK
                           000711  1454 LINK = . 
      008791 05                    1455         .byte      5
      008792 44 45 50 54 48        1456         .ascii     "DEPTH"
      008797                       1457 DEPTH:
      008797 90 BE 22         [ 2] 1458         LDW Y,SP0    ;save data stack ptr
      00879A BF 1A            [ 2] 1459 	LDW XTEMP,X
      00879C 72 B2 00 1A      [ 2] 1460         SUBW Y,XTEMP     ;#bytes = SP0 - X
      0087A0 90 57            [ 2] 1461         SRAW Y    ;D = #stack items
      0087A2 90 5A            [ 2] 1462 	DECW Y
      0087A4 1D 00 02         [ 2] 1463 	SUBW X,#2
      0087A7 FF               [ 2] 1464         LDW (X),Y     ; if neg, underflow
      0087A8 81               [ 4] 1465         RET
                                   1466 
                                   1467 ;       PICK    ( ... +n -- ... w )
                                   1468 ;       Copy  nth stack item to tos.
      0087A9 87 91                 1469         .word      LINK
                           00072B  1470 LINK = . 
      0087AB 04                    1471         .byte      4
      0087AC 50 49 43 4B           1472         .ascii     "PICK"
      0087B0                       1473 PICK:
      0087B0 90 93            [ 1] 1474         LDW Y,X   ;D = n1
      0087B2 90 FE            [ 2] 1475         LDW Y,(Y)
      0087B4 90 58            [ 2] 1476         SLAW Y
      0087B6 BF 1A            [ 2] 1477         LDW XTEMP,X
      0087B8 72 B9 00 1A      [ 2] 1478         ADDW Y,XTEMP
      0087BC 90 FE            [ 2] 1479         LDW Y,(Y)
      0087BE FF               [ 2] 1480         LDW (X),Y
      0087BF 81               [ 4] 1481         RET
                                   1482 
                                   1483 ;; Memory access
                                   1484 
                                   1485 ;       +!      ( n a -- )
                                   1486 ;       Add n to  contents at address a.
      0087C0 87 AB                 1487         .word      LINK
                           000742  1488 LINK = . 
      0087C2 02                    1489         .byte      2
      0087C3 2B 21                 1490         .ascii     "+!"
      0087C5                       1491 PSTOR:
      0087C5 CD 82 A2         [ 4] 1492         CALL	SWAPP
      0087C8 CD 82 BC         [ 4] 1493         CALL	OVER
      0087CB CD 81 E5         [ 4] 1494         CALL	AT
      0087CE CD 84 35         [ 4] 1495         CALL	PLUS
      0087D1 CD 82 A2         [ 4] 1496         CALL	SWAPP
      0087D4 CC 81 CE         [ 2] 1497         JP	STORE
                                   1498 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1499 ;       2!      ( d a -- )
                                   1500 ;       Store  double integer to address a.
      0087D7 87 C2                 1501         .word      LINK
                           000759  1502 LINK = . 
      0087D9 02                    1503         .byte      2
      0087DA 32 21                 1504         .ascii     "2!"
      0087DC                       1505 DSTOR:
      0087DC CD 82 A2         [ 4] 1506         CALL	SWAPP
      0087DF CD 82 BC         [ 4] 1507         CALL	OVER
      0087E2 CD 81 CE         [ 4] 1508         CALL	STORE
      0087E5 CD 86 E2         [ 4] 1509         CALL	CELLP
      0087E8 CC 81 CE         [ 2] 1510         JP	STORE
                                   1511 
                                   1512 ;       2@      ( a -- d )
                                   1513 ;       Fetch double integer from address a.
      0087EB 87 D9                 1514         .word      LINK
                           00076D  1515 LINK = . 
      0087ED 02                    1516         .byte      2
      0087EE 32 40                 1517         .ascii     "2@"
      0087F0                       1518 DAT:
      0087F0 CD 82 92         [ 4] 1519         CALL	DUPP
      0087F3 CD 86 E2         [ 4] 1520         CALL	CELLP
      0087F6 CD 81 E5         [ 4] 1521         CALL	AT
      0087F9 CD 82 A2         [ 4] 1522         CALL	SWAPP
      0087FC CC 81 E5         [ 2] 1523         JP	AT
                                   1524 
                                   1525 ;       COUNT   ( b -- b +n )
                                   1526 ;       Return count byte of a string
                                   1527 ;       and add 1 to byte address.
      0087FF 87 ED                 1528         .word      LINK
                           000781  1529 LINK = . 
      008801 05                    1530         .byte      5
      008802 43 4F 55 4E 54        1531         .ascii     "COUNT"
      008807                       1532 COUNT:
      008807 CD 82 92         [ 4] 1533         CALL     DUPP
      00880A CD 87 0D         [ 4] 1534         CALL     ONEP
      00880D CD 82 A2         [ 4] 1535         CALL     SWAPP
      008810 CC 82 03         [ 2] 1536         JP     CAT
                                   1537 
                                   1538 ;       HERE    ( -- a )
                                   1539 ;       Return  top of  code dictionary.
      008813 88 01                 1540         .word      LINK
                           000795  1541 LINK = . 
      008815 04                    1542         .byte      4
      008816 48 45 52 45           1543         .ascii     "HERE"
      00881A                       1544 HERE:
      00881A CD 83 BC         [ 4] 1545         CALL     CPP
      00881D CC 81 E5         [ 2] 1546         JP     AT
                                   1547 
                                   1548 ;       PAD     ( -- a )
                                   1549 ;       Return address of text buffer
                                   1550 ;       above  code dictionary.
      008820 88 15                 1551         .word      LINK
                           0007A2  1552 LINK = . 
      008822 03                    1553         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      008823 50 41 44              1554         .ascii     "PAD"
      008826                       1555 PAD:
      008826 CD 88 1A         [ 4] 1556         CALL     HERE
      008829 CD 81 59         [ 4] 1557         CALL     DOLIT
      00882C 00 50                 1558         .word      80
      00882E CC 84 35         [ 2] 1559         JP     PLUS
                                   1560 
                                   1561 ;       TIB     ( -- a )
                                   1562 ;       Return address of terminal input buffer.
      008831 88 22                 1563         .word      LINK
                           0007B3  1564 LINK = . 
      008833 03                    1565         .byte      3
      008834 54 49 42              1566         .ascii     "TIB"
      008837                       1567 TIB:
      008837 CD 83 7B         [ 4] 1568         CALL     NTIB
      00883A CD 86 E2         [ 4] 1569         CALL     CELLP
      00883D CC 81 E5         [ 2] 1570         JP     AT
                                   1571 
                                   1572 ;       @EXECUTE        ( a -- )
                                   1573 ;       Execute vector stored in address a.
      008840 88 33                 1574         .word      LINK
                           0007C2  1575 LINK = . 
      008842 08                    1576         .byte      8
      008843 40 45 58 45 43 55 54  1577         .ascii     "@EXECUTE"
             45
      00884B                       1578 ATEXE:
      00884B CD 81 E5         [ 4] 1579         CALL     AT
      00884E CD 83 DC         [ 4] 1580         CALL     QDUP    ;?address or zero
      008851 CD 81 90         [ 4] 1581         CALL     QBRAN
      008854 88 59                 1582         .word      EXE1
      008856 CD 81 B7         [ 4] 1583         CALL     EXECU   ;execute if non-zero
      008859 81               [ 4] 1584 EXE1:   RET     ;do nothing if zero
                                   1585 
                                   1586 ;       CMOVE   ( b1 b2 u -- )
                                   1587 ;       Copy u bytes from b1 to b2.
      00885A 88 42                 1588         .word      LINK
                           0007DC  1589 LINK = . 
      00885C 05                    1590         .byte      5
      00885D 43 4D 4F 56 45        1591         .ascii     "CMOVE"
      008862                       1592 CMOVE:
      008862 CD 82 5B         [ 4] 1593         CALL	TOR
      008865 CD 81 A7         [ 4] 1594         CALL	BRAN
      008868 88 82                 1595         .word	CMOV2
      00886A CD 82 5B         [ 4] 1596 CMOV1:	CALL	TOR
      00886D CD 82 92         [ 4] 1597         CALL	DUPP
      008870 CD 82 03         [ 4] 1598         CALL	CAT
      008873 CD 82 46         [ 4] 1599         CALL	RAT
      008876 CD 81 F2         [ 4] 1600         CALL	CSTOR
      008879 CD 87 0D         [ 4] 1601         CALL	ONEP
      00887C CD 82 33         [ 4] 1602         CALL	RFROM
      00887F CD 87 0D         [ 4] 1603         CALL	ONEP
      008882 CD 81 71         [ 4] 1604 CMOV2:	CALL	DONXT
      008885 88 6A                 1605         .word	CMOV1
      008887 CC 84 15         [ 2] 1606         JP	DDROP
                                   1607 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1608 ;       FILL    ( b u c -- )
                                   1609 ;       Fill u bytes of character c
                                   1610 ;       to area beginning at b.
      00888A 88 5C                 1611         .word       LINK
                           00080C  1612 LINK = . 
      00888C 04                    1613         .byte       4
      00888D 46 49 4C 4C           1614         .ascii     "FILL"
      008891                       1615 FILL:
      008891 CD 82 A2         [ 4] 1616         CALL	SWAPP
      008894 CD 82 5B         [ 4] 1617         CALL	TOR
      008897 CD 82 A2         [ 4] 1618         CALL	SWAPP
      00889A CD 81 A7         [ 4] 1619         CALL	BRAN
      00889D 88 A8                 1620         .word	FILL2
      00889F CD 84 20         [ 4] 1621 FILL1:	CALL	DDUP
      0088A2 CD 81 F2         [ 4] 1622         CALL	CSTOR
      0088A5 CD 87 0D         [ 4] 1623         CALL	ONEP
      0088A8 CD 81 71         [ 4] 1624 FILL2:	CALL	DONXT
      0088AB 88 9F                 1625         .word	FILL1
      0088AD CC 84 15         [ 2] 1626         JP	DDROP
                                   1627 
                                   1628 ;       ERASE   ( b u -- )
                                   1629 ;       Erase u bytes beginning at b.
      0088B0 88 8C                 1630         .word      LINK
                           000832  1631 LINK = . 
      0088B2 05                    1632         .byte      5
      0088B3 45 52 41 53 45        1633         .ascii     "ERASE"
      0088B8                       1634 ERASE:
      0088B8 CD 87 41         [ 4] 1635         CALL     ZERO
      0088BB CC 88 91         [ 2] 1636         JP     FILL
                                   1637 
                                   1638 ;       PACK0x   ( b u a -- a )
                                   1639 ;       Build a counted string with
                                   1640 ;       u characters from b. Null fill.
      0088BE 88 B2                 1641         .word      LINK
                           000840  1642 LINK = . 
      0088C0 05                    1643         .byte      5
      0088C1 50 41 43 4B 30 78     1644         .ascii     "PACK0x"
      0088C7                       1645 PACKS:
      0088C7 CD 82 92         [ 4] 1646         CALL     DUPP
      0088CA CD 82 5B         [ 4] 1647         CALL     TOR     ;strings only on cell boundary
      0088CD CD 84 20         [ 4] 1648         CALL     DDUP
      0088D0 CD 81 F2         [ 4] 1649         CALL     CSTOR
      0088D3 CD 87 0D         [ 4] 1650         CALL     ONEP ;save count
      0088D6 CD 82 A2         [ 4] 1651         CALL     SWAPP
      0088D9 CD 88 62         [ 4] 1652         CALL     CMOVE
      0088DC CD 82 33         [ 4] 1653         CALL     RFROM
      0088DF 81               [ 4] 1654         RET
                                   1655 
                                   1656 ;; Numeric output, single precision
                                   1657 
                                   1658 ;       DIGIT   ( u -- c )
                                   1659 ;       Convert digit u to a character.
      0088E0 88 C0                 1660         .word      LINK
                           000862  1661 LINK = . 
      0088E2 05                    1662         .byte      5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      0088E3 44 49 47 49 54        1663         .ascii     "DIGIT"
      0088E8                       1664 DIGIT:
      0088E8 CD 81 59         [ 4] 1665         CALL	DOLIT
      0088EB 00 09                 1666         .word	9
      0088ED CD 82 BC         [ 4] 1667         CALL	OVER
      0088F0 CD 84 F8         [ 4] 1668         CALL	LESS
      0088F3 CD 81 59         [ 4] 1669         CALL	DOLIT
      0088F6 00 07                 1670         .word	7
      0088F8 CD 82 DE         [ 4] 1671         CALL	ANDD
      0088FB CD 84 35         [ 4] 1672         CALL	PLUS
      0088FE CD 81 59         [ 4] 1673         CALL	DOLIT
      008901 00 30                 1674         .word	48	;'0'
      008903 CC 84 35         [ 2] 1675         JP	PLUS
                                   1676 
                                   1677 ;       EXTRACT ( n base -- n c )
                                   1678 ;       Extract least significant digit from n.
      008906 88 E2                 1679         .word      LINK
                           000888  1680 LINK = . 
      008908 07                    1681         .byte      7
      008909 45 58 54 52 41 43 54  1682         .ascii     "EXTRACT"
      008910                       1683 EXTRC:
      008910 CD 87 41         [ 4] 1684         CALL     ZERO
      008913 CD 82 A2         [ 4] 1685         CALL     SWAPP
      008916 CD 85 70         [ 4] 1686         CALL     UMMOD
      008919 CD 82 A2         [ 4] 1687         CALL     SWAPP
      00891C CC 88 E8         [ 2] 1688         JP     DIGIT
                                   1689 
                                   1690 ;       <#      ( -- )
                                   1691 ;       Initiate  numeric output process.
      00891F 89 08                 1692         .word      LINK
                           0008A1  1693 LINK = . 
      008921 02                    1694         .byte      2
      008922 3C 23                 1695         .ascii     "<#"
      008924                       1696 BDIGS:
      008924 CD 88 26         [ 4] 1697         CALL     PAD
      008927 CD 83 9B         [ 4] 1698         CALL     HLD
      00892A CC 81 CE         [ 2] 1699         JP     STORE
                                   1700 
                                   1701 ;       HOLD    ( c -- )
                                   1702 ;       Insert a character into output string.
      00892D 89 21                 1703         .word      LINK
                           0008AF  1704 LINK = . 
      00892F 04                    1705         .byte      4
      008930 48 4F 4C 44           1706         .ascii     "HOLD"
      008934                       1707 HOLD:
      008934 CD 83 9B         [ 4] 1708         CALL     HLD
      008937 CD 81 E5         [ 4] 1709         CALL     AT
      00893A CD 87 1A         [ 4] 1710         CALL     ONEM
      00893D CD 82 92         [ 4] 1711         CALL     DUPP
      008940 CD 83 9B         [ 4] 1712         CALL     HLD
      008943 CD 81 CE         [ 4] 1713         CALL     STORE
      008946 CC 81 F2         [ 2] 1714         JP     CSTOR
                                   1715 
                                   1716 ;       #       ( u -- u )
                                   1717 ;       Extract one digit from u and
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1718 ;       append digit to output string.
      008949 89 2F                 1719         .word      LINK
                           0008CB  1720 LINK = . 
      00894B 01                    1721         .byte      1
      00894C 23                    1722         .ascii     "#"
      00894D                       1723 DIG:
      00894D CD 83 4D         [ 4] 1724         CALL     BASE
      008950 CD 81 E5         [ 4] 1725         CALL     AT
      008953 CD 89 10         [ 4] 1726         CALL     EXTRC
      008956 CC 89 34         [ 2] 1727         JP     HOLD
                                   1728 
                                   1729 ;       #S      ( u -- 0 )
                                   1730 ;       Convert u until all digits
                                   1731 ;       are added to output string.
      008959 89 4B                 1732         .word      LINK
                           0008DB  1733 LINK = . 
      00895B 02                    1734         .byte      2
      00895C 23 53                 1735         .ascii     "#S"
      00895E                       1736 DIGS:
      00895E CD 89 4D         [ 4] 1737 DIGS1:  CALL     DIG
      008961 CD 82 92         [ 4] 1738         CALL     DUPP
      008964 CD 81 90         [ 4] 1739         CALL     QBRAN
      008967 89 6B                 1740         .word      DIGS2
      008969 20 F3            [ 2] 1741         JRA     DIGS1
      00896B 81               [ 4] 1742 DIGS2:  RET
                                   1743 
                                   1744 ;       SIGN    ( n -- )
                                   1745 ;       Add a minus sign to
                                   1746 ;       numeric output string.
      00896C 89 5B                 1747         .word      LINK
                           0008EE  1748 LINK = . 
      00896E 04                    1749         .byte      4
      00896F 53 49 47 4E           1750         .ascii     "SIGN"
      008973                       1751 SIGN:
      008973 CD 82 CB         [ 4] 1752         CALL     ZLESS
      008976 CD 81 90         [ 4] 1753         CALL     QBRAN
      008979 89 83                 1754         .word      SIGN1
      00897B CD 81 59         [ 4] 1755         CALL     DOLIT
      00897E 00 2D                 1756         .word      45	;"-"
      008980 CC 89 34         [ 2] 1757         JP     HOLD
      008983 81               [ 4] 1758 SIGN1:  RET
                                   1759 
                                   1760 ;       #>      ( w -- b u )
                                   1761 ;       Prepare output string.
      008984 89 6E                 1762         .word      LINK
                           000906  1763 LINK = . 
      008986 02                    1764         .byte      2
      008987 23 3E                 1765         .ascii     "#>"
      008989                       1766 EDIGS:
      008989 CD 82 88         [ 4] 1767         CALL     DROP
      00898C CD 83 9B         [ 4] 1768         CALL     HLD
      00898F CD 81 E5         [ 4] 1769         CALL     AT
      008992 CD 88 26         [ 4] 1770         CALL     PAD
      008995 CD 82 BC         [ 4] 1771         CALL     OVER
      008998 CC 84 93         [ 2] 1772         JP     SUBB
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1773 
                                   1774 ;       str     ( w -- b u )
                                   1775 ;       Convert a signed integer
                                   1776 ;       to a numeric string.
      00899B 89 86                 1777         .word      LINK
                           00091D  1778 LINK = . 
      00899D 03                    1779         .byte      3
      00899E 73 74 72              1780         .ascii     "str"
      0089A1                       1781 STR:
      0089A1 CD 82 92         [ 4] 1782         CALL     DUPP
      0089A4 CD 82 5B         [ 4] 1783         CALL     TOR
      0089A7 CD 84 AD         [ 4] 1784         CALL     ABSS
      0089AA CD 89 24         [ 4] 1785         CALL     BDIGS
      0089AD CD 89 5E         [ 4] 1786         CALL     DIGS
      0089B0 CD 82 33         [ 4] 1787         CALL     RFROM
      0089B3 CD 89 73         [ 4] 1788         CALL     SIGN
      0089B6 CC 89 89         [ 2] 1789         JP     EDIGS
                                   1790 
                                   1791 ;       HEX     ( -- )
                                   1792 ;       Use radix 16 as base for
                                   1793 ;       numeric conversions.
      0089B9 89 9D                 1794         .word      LINK
                           00093B  1795 LINK = . 
      0089BB 03                    1796         .byte      3
      0089BC 48 45 58              1797         .ascii     "HEX"
      0089BF                       1798 HEX:
      0089BF CD 81 59         [ 4] 1799         CALL     DOLIT
      0089C2 00 10                 1800         .word      16
      0089C4 CD 83 4D         [ 4] 1801         CALL     BASE
      0089C7 CC 81 CE         [ 2] 1802         JP     STORE
                                   1803 
                                   1804 ;       DECIMAL ( -- )
                                   1805 ;       Use radix 10 as base
                                   1806 ;       for numeric conversions.
      0089CA 89 BB                 1807         .word      LINK
                           00094C  1808 LINK = . 
      0089CC 07                    1809         .byte      7
      0089CD 44 45 43 49 4D 41 4C  1810         .ascii     "DECIMAL"
      0089D4                       1811 DECIM:
      0089D4 CD 81 59         [ 4] 1812         CALL     DOLIT
      0089D7 00 0A                 1813         .word      10
      0089D9 CD 83 4D         [ 4] 1814         CALL     BASE
      0089DC CC 81 CE         [ 2] 1815         JP     STORE
                                   1816 
                                   1817 ;; Numeric input, single precision
                                   1818 
                                   1819 ;       DIGIT?  ( c base -- u t )
                                   1820 ;       Convert a character to its numeric
                                   1821 ;       value. A flag indicates success.
      0089DF 89 CC                 1822         .word      LINK
                           000961  1823 LINK = . 
      0089E1 06                    1824         .byte       6
      0089E2 44 49 47 49 54 3F     1825         .ascii     "DIGIT?"
      0089E8                       1826 DIGTQ:
      0089E8 CD 82 5B         [ 4] 1827         CALL     TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      0089EB CD 81 59         [ 4] 1828         CALL     DOLIT
      0089EE 00 30                 1829         .word     48	; "0"
      0089F0 CD 84 93         [ 4] 1830         CALL     SUBB
      0089F3 CD 81 59         [ 4] 1831         CALL     DOLIT
      0089F6 00 09                 1832         .word      9
      0089F8 CD 82 BC         [ 4] 1833         CALL     OVER
      0089FB CD 84 F8         [ 4] 1834         CALL     LESS
      0089FE CD 81 90         [ 4] 1835         CALL     QBRAN
      008A01 8A 19                 1836         .word      DGTQ1
      008A03 CD 81 59         [ 4] 1837         CALL     DOLIT
      008A06 00 07                 1838         .word      7
      008A08 CD 84 93         [ 4] 1839         CALL     SUBB
      008A0B CD 82 92         [ 4] 1840         CALL     DUPP
      008A0E CD 81 59         [ 4] 1841         CALL     DOLIT
      008A11 00 0A                 1842         .word      10
      008A13 CD 84 F8         [ 4] 1843         CALL     LESS
      008A16 CD 82 F2         [ 4] 1844         CALL     ORR
      008A19 CD 82 92         [ 4] 1845 DGTQ1:  CALL     DUPP
      008A1C CD 82 33         [ 4] 1846         CALL     RFROM
      008A1F CC 84 DA         [ 2] 1847         JP     ULESS
                                   1848 
                                   1849 ;       NUMBER? ( a -- n T | a F )
                                   1850 ;       Convert a number string to
                                   1851 ;       integer. Push a flag on tos.
      008A22 89 E1                 1852         .word      LINK
                           0009A4  1853 LINK = . 
      008A24 07                    1854         .byte      7
      008A25 4E 55 4D 42 45 52 3F  1855         .ascii     "NUMBER?"
      008A2C                       1856 NUMBQ:
      008A2C CD 83 4D         [ 4] 1857         CALL     BASE
      008A2F CD 81 E5         [ 4] 1858         CALL     AT
      008A32 CD 82 5B         [ 4] 1859         CALL     TOR
      008A35 CD 87 41         [ 4] 1860         CALL     ZERO
      008A38 CD 82 BC         [ 4] 1861         CALL     OVER
      008A3B CD 88 07         [ 4] 1862         CALL     COUNT
      008A3E CD 82 BC         [ 4] 1863         CALL     OVER
      008A41 CD 82 03         [ 4] 1864         CALL     CAT
      008A44 CD 81 59         [ 4] 1865         CALL     DOLIT
      008A47 00 24                 1866         .word     36	; "0x"
      008A49 CD 84 BB         [ 4] 1867         CALL     EQUAL
      008A4C CD 81 90         [ 4] 1868         CALL     QBRAN
      008A4F 8A 60                 1869         .word      NUMQ1
      008A51 CD 89 BF         [ 4] 1870         CALL     HEX
      008A54 CD 82 A2         [ 4] 1871         CALL     SWAPP
      008A57 CD 87 0D         [ 4] 1872         CALL     ONEP
      008A5A CD 82 A2         [ 4] 1873         CALL     SWAPP
      008A5D CD 87 1A         [ 4] 1874         CALL     ONEM
      008A60 CD 82 BC         [ 4] 1875 NUMQ1:  CALL     OVER
      008A63 CD 82 03         [ 4] 1876         CALL     CAT
      008A66 CD 81 59         [ 4] 1877         CALL     DOLIT
      008A69 00 2D                 1878         .word     45	; "-"
      008A6B CD 84 BB         [ 4] 1879         CALL     EQUAL
      008A6E CD 82 5B         [ 4] 1880         CALL     TOR
      008A71 CD 82 A2         [ 4] 1881         CALL     SWAPP
      008A74 CD 82 46         [ 4] 1882         CALL     RAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008A77 CD 84 93         [ 4] 1883         CALL     SUBB
      008A7A CD 82 A2         [ 4] 1884         CALL     SWAPP
      008A7D CD 82 46         [ 4] 1885         CALL     RAT
      008A80 CD 84 35         [ 4] 1886         CALL     PLUS
      008A83 CD 83 DC         [ 4] 1887         CALL     QDUP
      008A86 CD 81 90         [ 4] 1888         CALL     QBRAN
      008A89 8A EA                 1889         .word      NUMQ6
      008A8B CD 87 1A         [ 4] 1890         CALL     ONEM
      008A8E CD 82 5B         [ 4] 1891         CALL     TOR
      008A91 CD 82 92         [ 4] 1892 NUMQ2:  CALL     DUPP
      008A94 CD 82 5B         [ 4] 1893         CALL     TOR
      008A97 CD 82 03         [ 4] 1894         CALL     CAT
      008A9A CD 83 4D         [ 4] 1895         CALL     BASE
      008A9D CD 81 E5         [ 4] 1896         CALL     AT
      008AA0 CD 89 E8         [ 4] 1897         CALL     DIGTQ
      008AA3 CD 81 90         [ 4] 1898         CALL     QBRAN
      008AA6 8A D8                 1899         .word      NUMQ4
      008AA8 CD 82 A2         [ 4] 1900         CALL     SWAPP
      008AAB CD 83 4D         [ 4] 1901         CALL     BASE
      008AAE CD 81 E5         [ 4] 1902         CALL     AT
      008AB1 CD 86 8B         [ 4] 1903         CALL     STAR
      008AB4 CD 84 35         [ 4] 1904         CALL     PLUS
      008AB7 CD 82 33         [ 4] 1905         CALL     RFROM
      008ABA CD 87 0D         [ 4] 1906         CALL     ONEP
      008ABD CD 81 71         [ 4] 1907         CALL     DONXT
      008AC0 8A 91                 1908         .word      NUMQ2
      008AC2 CD 82 46         [ 4] 1909         CALL     RAT
      008AC5 CD 82 A2         [ 4] 1910         CALL     SWAPP
      008AC8 CD 82 88         [ 4] 1911         CALL     DROP
      008ACB CD 81 90         [ 4] 1912         CALL     QBRAN
      008ACE 8A D3                 1913         .word      NUMQ3
      008AD0 CD 84 60         [ 4] 1914         CALL     NEGAT
      008AD3 CD 82 A2         [ 4] 1915 NUMQ3:  CALL     SWAPP
      008AD6 20 0F            [ 2] 1916         JRA     NUMQ5
      008AD8 CD 82 33         [ 4] 1917 NUMQ4:  CALL     RFROM
      008ADB CD 82 33         [ 4] 1918         CALL     RFROM
      008ADE CD 84 15         [ 4] 1919         CALL     DDROP
      008AE1 CD 84 15         [ 4] 1920         CALL     DDROP
      008AE4 CD 87 41         [ 4] 1921         CALL     ZERO
      008AE7 CD 82 92         [ 4] 1922 NUMQ5:  CALL     DUPP
      008AEA CD 82 33         [ 4] 1923 NUMQ6:  CALL     RFROM
      008AED CD 84 15         [ 4] 1924         CALL     DDROP
      008AF0 CD 82 33         [ 4] 1925         CALL     RFROM
      008AF3 CD 83 4D         [ 4] 1926         CALL     BASE
      008AF6 CC 81 CE         [ 2] 1927         JP     STORE
                                   1928 
                                   1929 ;; Basic I/O
                                   1930 
                                   1931 ;       KEY     ( -- c )
                                   1932 ;       Wait for and return an
                                   1933 ;       input character.
      008AF9 8A 24                 1934         .word      LINK
                           000A7B  1935 LINK = . 
      008AFB 03                    1936         .byte      3
      008AFC 4B 45 59              1937         .ascii     "KEY"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008AFF                       1938 KEY:
      008AFF CD 81 25         [ 4] 1939 KEY1:   CALL     QKEY
      008B02 CD 81 90         [ 4] 1940         CALL     QBRAN
      008B05 8A FF                 1941         .word      KEY1
      008B07 81               [ 4] 1942         RET
                                   1943 
                                   1944 ;       NUF?    ( -- t )
                                   1945 ;       Return false if no input,
                                   1946 ;       else pause and if CR return true.
      008B08 8A FB                 1947         .word      LINK
                           000A8A  1948 LINK = . 
      008B0A 04                    1949         .byte      4
      008B0B 4E 55 46 3F           1950         .ascii     "NUF?"
      008B0F                       1951 NUFQ:
      008B0F CD 81 25         [ 4] 1952         CALL     QKEY
      008B12 CD 82 92         [ 4] 1953         CALL     DUPP
      008B15 CD 81 90         [ 4] 1954         CALL     QBRAN
      008B18 8B 28                 1955         .word      NUFQ1
      008B1A CD 84 15         [ 4] 1956         CALL     DDROP
      008B1D CD 8A FF         [ 4] 1957         CALL     KEY
      008B20 CD 81 59         [ 4] 1958         CALL     DOLIT
      008B23 00 0D                 1959         .word      CRR
      008B25 CC 84 BB         [ 2] 1960         JP     EQUAL
      008B28 81               [ 4] 1961 NUFQ1:  RET
                                   1962 
                                   1963 ;       SPACE   ( -- )
                                   1964 ;       Send  blank character to
                                   1965 ;       output device.
      008B29 8B 0A                 1966         .word      LINK
                           000AAB  1967 LINK = . 
      008B2B 05                    1968         .byte      5
      008B2C 53 50 41 43 45        1969         .ascii     "SPACE"
      008B31                       1970 SPACE:
      008B31 CD 87 34         [ 4] 1971         CALL     BLANK
      008B34 CC 81 43         [ 2] 1972         JP     EMIT
                                   1973 
                                   1974 ;       SPACES  ( +n -- )
                                   1975 ;       Send n spaces to output device.
      008B37 8B 2B                 1976         .word      LINK
                           000AB9  1977 LINK = . 
      008B39 06                    1978         .byte      6
      008B3A 53 50 41 43 45 53     1979         .ascii     "SPACES"
      008B40                       1980 SPACS:
      008B40 CD 87 41         [ 4] 1981         CALL     ZERO
      008B43 CD 85 18         [ 4] 1982         CALL     MAX
      008B46 CD 82 5B         [ 4] 1983         CALL     TOR
      008B49 20 03            [ 2] 1984         JRA     CHAR2
      008B4B CD 8B 31         [ 4] 1985 CHAR1:  CALL     SPACE
      008B4E CD 81 71         [ 4] 1986 CHAR2:  CALL     DONXT
      008B51 8B 4B                 1987         .word      CHAR1
      008B53 81               [ 4] 1988         RET
                                   1989 
                                   1990 ;       TYPE    ( b u -- )
                                   1991 ;       Output u characters from b.
      008B54 8B 39                 1992         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                           000AD6  1993 LINK = . 
      008B56 04                    1994         .byte      4
      008B57 54 59 50 45           1995         .ascii     "TYPE"
      008B5B                       1996 TYPES:
      008B5B CD 82 5B         [ 4] 1997         CALL     TOR
      008B5E 20 0C            [ 2] 1998         JRA     TYPE2
      008B60 CD 82 92         [ 4] 1999 TYPE1:  CALL     DUPP
      008B63 CD 82 03         [ 4] 2000         CALL     CAT
      008B66 CD 81 43         [ 4] 2001         CALL     EMIT
      008B69 CD 87 0D         [ 4] 2002         CALL     ONEP
      008B6C CD 81 71         [ 4] 2003 TYPE2:  CALL     DONXT
      008B6F 8B 60                 2004         .word      TYPE1
      008B71 CC 82 88         [ 2] 2005         JP     DROP
                                   2006 
                                   2007 ;       CR      ( -- )
                                   2008 ;       Output a carriage return
                                   2009 ;       and a line feed.
      008B74 8B 56                 2010         .word      LINK
                           000AF6  2011 LINK = . 
      008B76 02                    2012         .byte      2
      008B77 43 52                 2013         .ascii     "CR"
      008B79                       2014 CR:
      008B79 CD 81 59         [ 4] 2015         CALL     DOLIT
      008B7C 00 0D                 2016         .word      CRR
      008B7E CD 81 43         [ 4] 2017         CALL     EMIT
      008B81 CD 81 59         [ 4] 2018         CALL     DOLIT
      008B84 00 0A                 2019         .word      LF
      008B86 CC 81 43         [ 2] 2020         JP     EMIT
                                   2021 
                                   2022 ;       do$     ( -- a )
                                   2023 ;       Return  address of a compiled
                                   2024 ;       string.
      008B89 8B 76                 2025         .word      LINK
                           000B0B  2026 LINK = . 
      008B8B 43                    2027 	.byte      COMPO+3
      008B8C 64 6F 24              2028         .ascii     "do$"
      008B8F                       2029 DOSTR:
      008B8F CD 82 33         [ 4] 2030         CALL     RFROM
      008B92 CD 82 46         [ 4] 2031         CALL     RAT
      008B95 CD 82 33         [ 4] 2032         CALL     RFROM
      008B98 CD 88 07         [ 4] 2033         CALL     COUNT
      008B9B CD 84 35         [ 4] 2034         CALL     PLUS
      008B9E CD 82 5B         [ 4] 2035         CALL     TOR
      008BA1 CD 82 A2         [ 4] 2036         CALL     SWAPP
      008BA4 CD 82 5B         [ 4] 2037         CALL     TOR
      008BA7 81               [ 4] 2038         RET
                                   2039 
                                   2040 ;       $"|     ( -- a )
                                   2041 ;       Run time routine compiled by $".
                                   2042 ;       Return address of a compiled string.
      008BA8 8B 8B                 2043         .word      LINK
                           000B2A  2044 LINK = . 
      008BAA 43                    2045 	.byte      COMPO+3
      008BAB 24 22 7C              2046         .byte     '$','"','|'
      008BAE                       2047 STRQP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008BAE CD 8B 8F         [ 4] 2048         CALL     DOSTR
      008BB1 81               [ 4] 2049         RET
                                   2050 
                                   2051 ;       ."|     ( -- )
                                   2052 ;       Run time routine of ." .
                                   2053 ;       Output a compiled string.
      008BB2 8B AA                 2054         .word      LINK
                           000B34  2055 LINK = . 
      008BB4 43                    2056 	.byte      COMPO+3
      008BB5 2E 22 7C              2057         .byte     '.','"','|'
      008BB8                       2058 DOTQP:
      008BB8 CD 8B 8F         [ 4] 2059         CALL     DOSTR
      008BBB CD 88 07         [ 4] 2060         CALL     COUNT
      008BBE CC 8B 5B         [ 2] 2061         JP     TYPES
                                   2062 
                                   2063 ;       .R      ( n +n -- )
                                   2064 ;       Display an integer in a field
                                   2065 ;       of n columns, right justified.
      008BC1 8B B4                 2066         .word      LINK
                           000B43  2067 LINK = . 
      008BC3 02                    2068         .byte      2
      008BC4 2E 52                 2069         .ascii     ".R"
      008BC6                       2070 DOTR:
      008BC6 CD 82 5B         [ 4] 2071         CALL     TOR
      008BC9 CD 89 A1         [ 4] 2072         CALL     STR
      008BCC CD 82 33         [ 4] 2073         CALL     RFROM
      008BCF CD 82 BC         [ 4] 2074         CALL     OVER
      008BD2 CD 84 93         [ 4] 2075         CALL     SUBB
      008BD5 CD 8B 40         [ 4] 2076         CALL     SPACS
      008BD8 CC 8B 5B         [ 2] 2077         JP     TYPES
                                   2078 
                                   2079 ;       U.R     ( u +n -- )
                                   2080 ;       Display an unsigned integer
                                   2081 ;       in n column, right justified.
      008BDB 8B C3                 2082         .word      LINK
                           000B5D  2083 LINK = . 
      008BDD 03                    2084         .byte      3
      008BDE 55 2E 52              2085         .ascii     "U.R"
      008BE1                       2086 UDOTR:
      008BE1 CD 82 5B         [ 4] 2087         CALL     TOR
      008BE4 CD 89 24         [ 4] 2088         CALL     BDIGS
      008BE7 CD 89 5E         [ 4] 2089         CALL     DIGS
      008BEA CD 89 89         [ 4] 2090         CALL     EDIGS
      008BED CD 82 33         [ 4] 2091         CALL     RFROM
      008BF0 CD 82 BC         [ 4] 2092         CALL     OVER
      008BF3 CD 84 93         [ 4] 2093         CALL     SUBB
      008BF6 CD 8B 40         [ 4] 2094         CALL     SPACS
      008BF9 CC 8B 5B         [ 2] 2095         JP     TYPES
                                   2096 
                                   2097 ;       U.      ( u -- )
                                   2098 ;       Display an unsigned integer
                                   2099 ;       in free format.
      008BFC 8B DD                 2100         .word      LINK
                           000B7E  2101 LINK = . 
      008BFE 02                    2102         .byte      2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008BFF 55 2E                 2103         .ascii     "U."
      008C01                       2104 UDOT:
      008C01 CD 89 24         [ 4] 2105         CALL     BDIGS
      008C04 CD 89 5E         [ 4] 2106         CALL     DIGS
      008C07 CD 89 89         [ 4] 2107         CALL     EDIGS
      008C0A CD 8B 31         [ 4] 2108         CALL     SPACE
      008C0D CC 8B 5B         [ 2] 2109         JP     TYPES
                                   2110 
                                   2111 ;       .       ( w -- )
                                   2112 ;       Display an integer in free
                                   2113 ;       format, preceeded by a space.
      008C10 8B FE                 2114         .word      LINK
                           000B92  2115 LINK = . 
      008C12 01                    2116         .byte      1
      008C13 2E                    2117         .ascii     "."
      008C14                       2118 DOT:
      008C14 CD 83 4D         [ 4] 2119         CALL     BASE
      008C17 CD 81 E5         [ 4] 2120         CALL     AT
      008C1A CD 81 59         [ 4] 2121         CALL     DOLIT
      008C1D 00 0A                 2122         .word      10
      008C1F CD 83 07         [ 4] 2123         CALL     XORR    ;?decimal
      008C22 CD 81 90         [ 4] 2124         CALL     QBRAN
      008C25 8C 2A                 2125         .word      DOT1
      008C27 CC 8C 01         [ 2] 2126         JP     UDOT
      008C2A CD 89 A1         [ 4] 2127 DOT1:   CALL     STR
      008C2D CD 8B 31         [ 4] 2128         CALL     SPACE
      008C30 CC 8B 5B         [ 2] 2129         JP     TYPES
                                   2130 
                                   2131 ;       ?       ( a -- )
                                   2132 ;       Display contents in memory cell.
      008C33 8C 12                 2133         .word      LINK
                                   2134         
                           000BB5  2135 LINK = . 
      008C35 01                    2136         .byte      1
      008C36 3F                    2137         .ascii     "?"
      008C37                       2138 QUEST:
      008C37 CD 81 E5         [ 4] 2139         CALL     AT
      008C3A CC 8C 14         [ 2] 2140         JP     DOT
                                   2141 
                                   2142 ;; Parsing
                                   2143 
                                   2144 ;       parse   ( b u c -- b u delta ; <string> )
                                   2145 ;       Scan string delimited by c.
                                   2146 ;       Return found string and its offset.
      008C3D 8C 35                 2147         .word      LINK
                           000BBF  2148 LINK = . 
      008C3F 05                    2149         .byte      5
      008C40 70 61 72 73 65        2150         .ascii     "parse"
      008C45                       2151 PARS:
      008C45 CD 83 5C         [ 4] 2152         CALL     TEMP
      008C48 CD 81 CE         [ 4] 2153         CALL     STORE
      008C4B CD 82 BC         [ 4] 2154         CALL     OVER
      008C4E CD 82 5B         [ 4] 2155         CALL     TOR
      008C51 CD 82 92         [ 4] 2156         CALL     DUPP
      008C54 CD 81 90         [ 4] 2157         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008C57 8C FD                 2158         .word      PARS8
      008C59 CD 87 1A         [ 4] 2159         CALL     ONEM
      008C5C CD 83 5C         [ 4] 2160         CALL     TEMP
      008C5F CD 81 E5         [ 4] 2161         CALL     AT
      008C62 CD 87 34         [ 4] 2162         CALL     BLANK
      008C65 CD 84 BB         [ 4] 2163         CALL     EQUAL
      008C68 CD 81 90         [ 4] 2164         CALL     QBRAN
      008C6B 8C 9E                 2165         .word      PARS3
      008C6D CD 82 5B         [ 4] 2166         CALL     TOR
      008C70 CD 87 34         [ 4] 2167 PARS1:  CALL     BLANK
      008C73 CD 82 BC         [ 4] 2168         CALL     OVER
      008C76 CD 82 03         [ 4] 2169         CALL     CAT     ;skip leading blanks ONLY
      008C79 CD 84 93         [ 4] 2170         CALL     SUBB
      008C7C CD 82 CB         [ 4] 2171         CALL     ZLESS
      008C7F CD 84 4F         [ 4] 2172         CALL     INVER
      008C82 CD 81 90         [ 4] 2173         CALL     QBRAN
      008C85 8C 9B                 2174         .word      PARS2
      008C87 CD 87 0D         [ 4] 2175         CALL     ONEP
      008C8A CD 81 71         [ 4] 2176         CALL     DONXT
      008C8D 8C 70                 2177         .word      PARS1
      008C8F CD 82 33         [ 4] 2178         CALL     RFROM
      008C92 CD 82 88         [ 4] 2179         CALL     DROP
      008C95 CD 87 41         [ 4] 2180         CALL     ZERO
      008C98 CC 82 92         [ 2] 2181         JP     DUPP
      008C9B CD 82 33         [ 4] 2182 PARS2:  CALL     RFROM
      008C9E CD 82 BC         [ 4] 2183 PARS3:  CALL     OVER
      008CA1 CD 82 A2         [ 4] 2184         CALL     SWAPP
      008CA4 CD 82 5B         [ 4] 2185         CALL     TOR
      008CA7 CD 83 5C         [ 4] 2186 PARS4:  CALL     TEMP
      008CAA CD 81 E5         [ 4] 2187         CALL     AT
      008CAD CD 82 BC         [ 4] 2188         CALL     OVER
      008CB0 CD 82 03         [ 4] 2189         CALL     CAT
      008CB3 CD 84 93         [ 4] 2190         CALL     SUBB    ;scan for delimiter
      008CB6 CD 83 5C         [ 4] 2191         CALL     TEMP
      008CB9 CD 81 E5         [ 4] 2192         CALL     AT
      008CBC CD 87 34         [ 4] 2193         CALL     BLANK
      008CBF CD 84 BB         [ 4] 2194         CALL     EQUAL
      008CC2 CD 81 90         [ 4] 2195         CALL     QBRAN
      008CC5 8C CA                 2196         .word      PARS5
      008CC7 CD 82 CB         [ 4] 2197         CALL     ZLESS
      008CCA CD 81 90         [ 4] 2198 PARS5:  CALL     QBRAN
      008CCD 8C DF                 2199         .word      PARS6
      008CCF CD 87 0D         [ 4] 2200         CALL     ONEP
      008CD2 CD 81 71         [ 4] 2201         CALL     DONXT
      008CD5 8C A7                 2202         .word      PARS4
      008CD7 CD 82 92         [ 4] 2203         CALL     DUPP
      008CDA CD 82 5B         [ 4] 2204         CALL     TOR
      008CDD 20 0F            [ 2] 2205         JRA     PARS7
      008CDF CD 82 33         [ 4] 2206 PARS6:  CALL     RFROM
      008CE2 CD 82 88         [ 4] 2207         CALL     DROP
      008CE5 CD 82 92         [ 4] 2208         CALL     DUPP
      008CE8 CD 87 0D         [ 4] 2209         CALL     ONEP
      008CEB CD 82 5B         [ 4] 2210         CALL     TOR
      008CEE CD 82 BC         [ 4] 2211 PARS7:  CALL     OVER
      008CF1 CD 84 93         [ 4] 2212         CALL     SUBB
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008CF4 CD 82 33         [ 4] 2213         CALL     RFROM
      008CF7 CD 82 33         [ 4] 2214         CALL     RFROM
      008CFA CC 84 93         [ 2] 2215         JP     SUBB
      008CFD CD 82 BC         [ 4] 2216 PARS8:  CALL     OVER
      008D00 CD 82 33         [ 4] 2217         CALL     RFROM
      008D03 CC 84 93         [ 2] 2218         JP     SUBB
                                   2219 
                                   2220 ;       PARSE   ( c -- b u ; <string> )
                                   2221 ;       Scan input stream and return
                                   2222 ;       counted string delimited by c.
      008D06 8C 3F                 2223         .word      LINK
                           000C88  2224 LINK = . 
      008D08 05                    2225         .byte      5
      008D09 50 41 52 53 45        2226         .ascii     "PARSE"
      008D0E                       2227 PARSE:
      008D0E CD 82 5B         [ 4] 2228         CALL     TOR
      008D11 CD 88 37         [ 4] 2229         CALL     TIB
      008D14 CD 83 6B         [ 4] 2230         CALL     INN
      008D17 CD 81 E5         [ 4] 2231         CALL     AT
      008D1A CD 84 35         [ 4] 2232         CALL     PLUS    ;current input buffer pointer
      008D1D CD 83 7B         [ 4] 2233         CALL     NTIB
      008D20 CD 81 E5         [ 4] 2234         CALL     AT
      008D23 CD 83 6B         [ 4] 2235         CALL     INN
      008D26 CD 81 E5         [ 4] 2236         CALL     AT
      008D29 CD 84 93         [ 4] 2237         CALL     SUBB    ;remaining count
      008D2C CD 82 33         [ 4] 2238         CALL     RFROM
      008D2F CD 8C 45         [ 4] 2239         CALL     PARS
      008D32 CD 83 6B         [ 4] 2240         CALL     INN
      008D35 CC 87 C5         [ 2] 2241         JP     PSTOR
                                   2242 
                                   2243 ;       .(      ( -- )
                                   2244 ;       Output following string up to next ) .
      008D38 8D 08                 2245         .word      LINK
                           000CBA  2246 LINK = . 
      008D3A 82                    2247 	.byte      IMEDD+2
      008D3B 2E 28                 2248         .ascii     ".("
      008D3D                       2249 DOTPR:
      008D3D CD 81 59         [ 4] 2250         CALL     DOLIT
      008D40 00 29                 2251         .word     41	; ")"
      008D42 CD 8D 0E         [ 4] 2252         CALL     PARSE
      008D45 CC 8B 5B         [ 2] 2253         JP     TYPES
                                   2254 
                                   2255 ;       (       ( -- )
                                   2256 ;       Ignore following string up to next ).
                                   2257 ;       A comment.
      008D48 8D 3A                 2258         .word      LINK
                           000CCA  2259 LINK = . 
      008D4A 81                    2260 	.byte      IMEDD+1
      008D4B 28                    2261         .ascii     "("
      008D4C                       2262 PAREN:
      008D4C CD 81 59         [ 4] 2263         CALL     DOLIT
      008D4F 00 29                 2264         .word     41	; ")"
      008D51 CD 8D 0E         [ 4] 2265         CALL     PARSE
      008D54 CC 84 15         [ 2] 2266         JP     DDROP
                                   2267 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   2268 ;       \       ( -- )
                                   2269 ;       Ignore following text till
                                   2270 ;       end of line.
      008D57 8D 4A                 2271         .word      LINK
                           000CD9  2272 LINK = . 
      008D59 81                    2273 			.byte      IMEDD+1
      008D5A 5C 5C                 2274         .ascii     "\\"
      008D5C                       2275 BKSLA:
      008D5C CD 83 7B         [ 4] 2276         CALL     NTIB
      008D5F CD 81 E5         [ 4] 2277         CALL     AT
      008D62 CD 83 6B         [ 4] 2278         CALL     INN
      008D65 CC 81 CE         [ 2] 2279         JP     STORE
                                   2280 
                                   2281 ;       WORD    ( c -- a ; <string> )
                                   2282 ;       Parse a word from input stream
                                   2283 ;       and copy it to code dictionary.
      008D68 8D 59                 2284         .word      LINK
                           000CEA  2285 LINK = . 
      008D6A 04                    2286         .byte      4
      008D6B 57 4F 52 44           2287         .ascii     "WORD"
      008D6F                       2288 WORDD:
      008D6F CD 8D 0E         [ 4] 2289         CALL     PARSE
      008D72 CD 88 1A         [ 4] 2290         CALL     HERE
      008D75 CD 86 E2         [ 4] 2291         CALL     CELLP
      008D78 CC 88 C7         [ 2] 2292         JP     PACKS
                                   2293 
                                   2294 ;       TOKEN   ( -- a ; <string> )
                                   2295 ;       Parse a word from input stream
                                   2296 ;       and copy it to name dictionary.
      008D7B 8D 6A                 2297         .word      LINK
                           000CFD  2298 LINK = . 
      008D7D 05                    2299         .byte      5
      008D7E 54 4F 4B 45 4E        2300         .ascii     "TOKEN"
      008D83                       2301 TOKEN:
      008D83 CD 87 34         [ 4] 2302         CALL     BLANK
      008D86 CC 8D 6F         [ 2] 2303         JP     WORDD
                                   2304 
                                   2305 ;; Dictionary search
                                   2306 
                                   2307 ;       NAME>   ( na -- ca )
                                   2308 ;       Return a code address given
                                   2309 ;       a name address.
      008D89 8D 7D                 2310         .word      LINK
                           000D0B  2311 LINK = . 
      008D8B 05                    2312         .byte      5
      008D8C 4E 41 4D 45 3E        2313         .ascii     "NAME>"
      008D91                       2314 NAMET:
      008D91 CD 88 07         [ 4] 2315         CALL     COUNT
      008D94 CD 81 59         [ 4] 2316         CALL     DOLIT
      008D97 00 1F                 2317         .word      31
      008D99 CD 82 DE         [ 4] 2318         CALL     ANDD
      008D9C CC 84 35         [ 2] 2319         JP     PLUS
                                   2320 
                                   2321 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   2322 ;       Compare u cells in two
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   2323 ;       strings. Return 0 if identical.
      008D9F 8D 8B                 2324         .word      LINK
                           000D21  2325 LINK = . 
      008DA1 05                    2326         .byte       5
      008DA2 53 41 4D 45 3F        2327         .ascii     "SAME?"
      008DA7                       2328 SAMEQ:
      008DA7 CD 87 1A         [ 4] 2329         CALL     ONEM
      008DAA CD 82 5B         [ 4] 2330         CALL     TOR
      008DAD 20 29            [ 2] 2331         JRA     SAME2
      008DAF CD 82 BC         [ 4] 2332 SAME1:  CALL     OVER
      008DB2 CD 82 46         [ 4] 2333         CALL     RAT
      008DB5 CD 84 35         [ 4] 2334         CALL     PLUS
      008DB8 CD 82 03         [ 4] 2335         CALL     CAT
      008DBB CD 82 BC         [ 4] 2336         CALL     OVER
      008DBE CD 82 46         [ 4] 2337         CALL     RAT
      008DC1 CD 84 35         [ 4] 2338         CALL     PLUS
      008DC4 CD 82 03         [ 4] 2339         CALL     CAT
      008DC7 CD 84 93         [ 4] 2340         CALL     SUBB
      008DCA CD 83 DC         [ 4] 2341         CALL     QDUP
      008DCD CD 81 90         [ 4] 2342         CALL     QBRAN
      008DD0 8D D8                 2343         .word      SAME2
      008DD2 CD 82 33         [ 4] 2344         CALL     RFROM
      008DD5 CC 82 88         [ 2] 2345         JP     DROP
      008DD8 CD 81 71         [ 4] 2346 SAME2:  CALL     DONXT
      008DDB 8D AF                 2347         .word      SAME1
      008DDD CC 87 41         [ 2] 2348         JP     ZERO
                                   2349 
                                   2350 ;       find    ( a va -- ca na | a F )
                                   2351 ;       Search vocabulary for string.
                                   2352 ;       Return ca and na if succeeded.
      008DE0 8D A1                 2353         .word      LINK
                           000D62  2354 LINK = . 
      008DE2 04                    2355         .byte      4
      008DE3 66 69 6E 64           2356         .ascii     "find"
      008DE7                       2357 FIND:
      008DE7 CD 82 A2         [ 4] 2358         CALL     SWAPP
      008DEA CD 82 92         [ 4] 2359         CALL     DUPP
      008DED CD 82 03         [ 4] 2360         CALL     CAT
      008DF0 CD 83 5C         [ 4] 2361         CALL     TEMP
      008DF3 CD 81 CE         [ 4] 2362         CALL     STORE
      008DF6 CD 82 92         [ 4] 2363         CALL     DUPP
      008DF9 CD 81 E5         [ 4] 2364         CALL     AT
      008DFC CD 82 5B         [ 4] 2365         CALL     TOR
      008DFF CD 86 E2         [ 4] 2366         CALL     CELLP
      008E02 CD 82 A2         [ 4] 2367         CALL     SWAPP
      008E05 CD 81 E5         [ 4] 2368 FIND1:  CALL     AT
      008E08 CD 82 92         [ 4] 2369         CALL     DUPP
      008E0B CD 81 90         [ 4] 2370         CALL     QBRAN
      008E0E 8E 44                 2371         .word      FIND6
      008E10 CD 82 92         [ 4] 2372         CALL     DUPP
      008E13 CD 81 E5         [ 4] 2373         CALL     AT
      008E16 CD 81 59         [ 4] 2374         CALL     DOLIT
      008E19 1F 7F                 2375         .word      MASKK
      008E1B CD 82 DE         [ 4] 2376         CALL     ANDD
      008E1E CD 82 46         [ 4] 2377         CALL     RAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008E21 CD 83 07         [ 4] 2378         CALL     XORR
      008E24 CD 81 90         [ 4] 2379         CALL     QBRAN
      008E27 8E 33                 2380         .word      FIND2
      008E29 CD 86 E2         [ 4] 2381         CALL     CELLP
      008E2C CD 81 59         [ 4] 2382         CALL     DOLIT
      008E2F FF FF                 2383         .word     0xFFFF
      008E31 20 0C            [ 2] 2384         JRA     FIND3
      008E33 CD 86 E2         [ 4] 2385 FIND2:  CALL     CELLP
      008E36 CD 83 5C         [ 4] 2386         CALL     TEMP
      008E39 CD 81 E5         [ 4] 2387         CALL     AT
      008E3C CD 8D A7         [ 4] 2388         CALL     SAMEQ
      008E3F CD 81 A7         [ 4] 2389 FIND3:  CALL     BRAN
      008E42 8E 53                 2390         .word      FIND4
      008E44 CD 82 33         [ 4] 2391 FIND6:  CALL     RFROM
      008E47 CD 82 88         [ 4] 2392         CALL     DROP
      008E4A CD 82 A2         [ 4] 2393         CALL     SWAPP
      008E4D CD 86 F1         [ 4] 2394         CALL     CELLM
      008E50 CC 82 A2         [ 2] 2395         JP     SWAPP
      008E53 CD 81 90         [ 4] 2396 FIND4:  CALL     QBRAN
      008E56 8E 60                 2397         .word      FIND5
      008E58 CD 86 F1         [ 4] 2398         CALL     CELLM
      008E5B CD 86 F1         [ 4] 2399         CALL     CELLM
      008E5E 20 A5            [ 2] 2400         JRA     FIND1
      008E60 CD 82 33         [ 4] 2401 FIND5:  CALL     RFROM
      008E63 CD 82 88         [ 4] 2402         CALL     DROP
      008E66 CD 82 A2         [ 4] 2403         CALL     SWAPP
      008E69 CD 82 88         [ 4] 2404         CALL     DROP
      008E6C CD 86 F1         [ 4] 2405         CALL     CELLM
      008E6F CD 82 92         [ 4] 2406         CALL     DUPP
      008E72 CD 8D 91         [ 4] 2407         CALL     NAMET
      008E75 CC 82 A2         [ 2] 2408         JP     SWAPP
                                   2409 
                                   2410 ;       NAME?   ( a -- ca na | a F )
                                   2411 ;       Search vocabularies for a string.
      008E78 8D E2                 2412         .word      LINK
                           000DFA  2413 LINK = . 
      008E7A 05                    2414         .byte      5
      008E7B 4E 41 4D 45 3F        2415         .ascii     "NAME?"
      008E80                       2416 NAMEQ:
      008E80 CD 83 AE         [ 4] 2417         CALL     CNTXT
      008E83 CC 8D E7         [ 2] 2418         JP     FIND
                                   2419 
                                   2420 ;; Terminal response
                                   2421 
                                   2422 ;       ^H      ( bot eot cur -- bot eot cur )
                                   2423 ;       Backup cursor by one character.
      008E86 8E 7A                 2424         .word      LINK
                           000E08  2425 LINK = . 
      008E88 02                    2426         .byte      2
      008E89 5E 68                 2427         .ascii     "^h"
      008E8B                       2428 BKSP:
      008E8B CD 82 5B         [ 4] 2429         CALL     TOR
      008E8E CD 82 BC         [ 4] 2430         CALL     OVER
      008E91 CD 82 33         [ 4] 2431         CALL     RFROM
      008E94 CD 82 A2         [ 4] 2432         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008E97 CD 82 BC         [ 4] 2433         CALL     OVER
      008E9A CD 83 07         [ 4] 2434         CALL     XORR
      008E9D CD 81 90         [ 4] 2435         CALL     QBRAN
      008EA0 8E BB                 2436         .word      BACK1
      008EA2 CD 81 59         [ 4] 2437         CALL     DOLIT
      008EA5 00 08                 2438         .word      BKSPP
      008EA7 CD 81 43         [ 4] 2439         CALL     EMIT
      008EAA CD 87 1A         [ 4] 2440         CALL     ONEM
      008EAD CD 87 34         [ 4] 2441         CALL     BLANK
      008EB0 CD 81 43         [ 4] 2442         CALL     EMIT
      008EB3 CD 81 59         [ 4] 2443         CALL     DOLIT
      008EB6 00 08                 2444         .word      BKSPP
      008EB8 CC 81 43         [ 2] 2445         JP     EMIT
      008EBB 81               [ 4] 2446 BACK1:  RET
                                   2447 
                                   2448 ;       TAP     ( bot eot cur c -- bot eot cur )
                                   2449 ;       Accept and echo key stroke
                                   2450 ;       and bump cursor.
      008EBC 8E 88                 2451         .word      LINK
                           000E3E  2452 LINK = . 
      008EBE 03                    2453         .byte      3
      008EBF 54 41 50              2454         .ascii     "TAP"
      008EC2                       2455 TAP:
      008EC2 CD 82 92         [ 4] 2456         CALL     DUPP
      008EC5 CD 81 43         [ 4] 2457         CALL     EMIT
      008EC8 CD 82 BC         [ 4] 2458         CALL     OVER
      008ECB CD 81 F2         [ 4] 2459         CALL     CSTOR
      008ECE CC 87 0D         [ 2] 2460         JP     ONEP
                                   2461 
                                   2462 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   2463 ;       Process a key stroke,
                                   2464 ;       CR or backspace.
      008ED1 8E BE                 2465         .word      LINK
                           000E53  2466 LINK = . 
      008ED3 04                    2467         .byte      4
      008ED4 6B 54 41 50           2468         .ascii     "kTAP"
      008ED8                       2469 KTAP:
      008ED8 CD 82 92         [ 4] 2470         CALL     DUPP
      008EDB CD 81 59         [ 4] 2471         CALL     DOLIT
      008EDE 00 0D                 2472         .word      CRR
      008EE0 CD 83 07         [ 4] 2473         CALL     XORR
      008EE3 CD 81 90         [ 4] 2474         CALL     QBRAN
      008EE6 8E FE                 2475         .word      KTAP2
      008EE8 CD 81 59         [ 4] 2476         CALL     DOLIT
      008EEB 00 08                 2477         .word      BKSPP
      008EED CD 83 07         [ 4] 2478         CALL     XORR
      008EF0 CD 81 90         [ 4] 2479         CALL     QBRAN
      008EF3 8E FB                 2480         .word      KTAP1
      008EF5 CD 87 34         [ 4] 2481         CALL     BLANK
      008EF8 CC 8E C2         [ 2] 2482         JP     TAP
      008EFB CC 8E 8B         [ 2] 2483 KTAP1:  JP     BKSP
      008EFE CD 82 88         [ 4] 2484 KTAP2:  CALL     DROP
      008F01 CD 82 A2         [ 4] 2485         CALL     SWAPP
      008F04 CD 82 88         [ 4] 2486         CALL     DROP
      008F07 CC 82 92         [ 2] 2487         JP     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



                                   2488 
                                   2489 ;       accept  ( b u -- b u )
                                   2490 ;       Accept characters to input
                                   2491 ;       buffer. Return with actual count.
      008F0A 8E D3                 2492         .word      LINK
                           000E8C  2493 LINK = . 
      008F0C 06                    2494         .byte      6
      008F0D 41 43 43 45 50 54     2495         .ascii     "ACCEPT"
      008F13                       2496 ACCEP:
      008F13 CD 82 BC         [ 4] 2497         CALL     OVER
      008F16 CD 84 35         [ 4] 2498         CALL     PLUS
      008F19 CD 82 BC         [ 4] 2499         CALL     OVER
      008F1C CD 84 20         [ 4] 2500 ACCP1:  CALL     DDUP
      008F1F CD 83 07         [ 4] 2501         CALL     XORR
      008F22 CD 81 90         [ 4] 2502         CALL     QBRAN
      008F25 8F 47                 2503         .word      ACCP4
      008F27 CD 8A FF         [ 4] 2504         CALL     KEY
      008F2A CD 82 92         [ 4] 2505         CALL     DUPP
      008F2D CD 87 34         [ 4] 2506         CALL     BLANK
      008F30 CD 81 59         [ 4] 2507         CALL     DOLIT
      008F33 00 7F                 2508         .word      127
      008F35 CD 85 55         [ 4] 2509         CALL     WITHI
      008F38 CD 81 90         [ 4] 2510         CALL     QBRAN
      008F3B 8F 42                 2511         .word      ACCP2
      008F3D CD 8E C2         [ 4] 2512         CALL     TAP
      008F40 20 03            [ 2] 2513         JRA     ACCP3
      008F42 CD 8E D8         [ 4] 2514 ACCP2:  CALL     KTAP
      008F45 20 D5            [ 2] 2515 ACCP3:  JRA     ACCP1
      008F47 CD 82 88         [ 4] 2516 ACCP4:  CALL     DROP
      008F4A CD 82 BC         [ 4] 2517         CALL     OVER
      008F4D CC 84 93         [ 2] 2518         JP     SUBB
                                   2519 
                                   2520 ;       QUERY   ( -- )
                                   2521 ;       Accept input stream to
                                   2522 ;       terminal input buffer.
      008F50 8F 0C                 2523         .word      LINK
                                   2524         
                           000ED2  2525 LINK = . 
      008F52 05                    2526         .byte      5
      008F53 51 55 45 52 59        2527         .ascii     "QUERY"
      008F58                       2528 QUERY:
      008F58 CD 88 37         [ 4] 2529         CALL     TIB
      008F5B CD 81 59         [ 4] 2530         CALL     DOLIT
      008F5E 00 50                 2531         .word      80
      008F60 CD 8F 13         [ 4] 2532         CALL     ACCEP
      008F63 CD 83 7B         [ 4] 2533         CALL     NTIB
      008F66 CD 81 CE         [ 4] 2534         CALL     STORE
      008F69 CD 82 88         [ 4] 2535         CALL     DROP
      008F6C CD 87 41         [ 4] 2536         CALL     ZERO
      008F6F CD 83 6B         [ 4] 2537         CALL     INN
      008F72 CC 81 CE         [ 2] 2538         JP     STORE
                                   2539 
                                   2540 ;       ABORT   ( -- )
                                   2541 ;       Reset data stack and
                                   2542 ;       jump to QUIT.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008F75 8F 52                 2543         .word      LINK
                           000EF7  2544 LINK = . 
      008F77 05                    2545         .byte      5
      008F78 41 42 4F 52 54        2546         .ascii     "ABORT"
      008F7D                       2547 ABORT:
      008F7D CD 90 74         [ 4] 2548         CALL     PRESE
      008F80 CC 90 91         [ 2] 2549         JP     QUIT
                                   2550 
                                   2551 ;       abort"  ( f -- )
                                   2552 ;       Run time routine of ABORT".
                                   2553 ;       Abort with a message.
      008F83 8F 77                 2554         .word      LINK
                           000F05  2555 LINK = . 
      008F85 46                    2556 	.byte      COMPO+6
      008F86 61 62 6F 72 74        2557         .ascii     "abort"
      008F8B 22                    2558         .byte      '"'
      008F8C                       2559 ABORQ:
      008F8C CD 81 90         [ 4] 2560         CALL     QBRAN
      008F8F 8F AB                 2561         .word      ABOR2   ;text flag
      008F91 CD 8B 8F         [ 4] 2562         CALL     DOSTR
      008F94 CD 8B 31         [ 4] 2563 ABOR1:  CALL     SPACE
      008F97 CD 88 07         [ 4] 2564         CALL     COUNT
      008F9A CD 8B 5B         [ 4] 2565         CALL     TYPES
      008F9D CD 81 59         [ 4] 2566         CALL     DOLIT
      008FA0 00 3F                 2567         .word     63 ; "?"
      008FA2 CD 81 43         [ 4] 2568         CALL     EMIT
      008FA5 CD 8B 79         [ 4] 2569         CALL     CR
      008FA8 CC 8F 7D         [ 2] 2570         JP     ABORT   ;pass error string
      008FAB CD 8B 8F         [ 4] 2571 ABOR2:  CALL     DOSTR
      008FAE CC 82 88         [ 2] 2572         JP     DROP
                                   2573 
                                   2574 ;; The text interpreter
                                   2575 
                                   2576 ;       $INTERPRET      ( a -- )
                                   2577 ;       Interpret a word. If failed,
                                   2578 ;       try to convert it to an integer.
      008FB1 8F 85                 2579         .word      LINK
                           000F33  2580 LINK = . 
      008FB3 0A                    2581         .byte      10
      008FB4 24 49 4E 54 45 52 50  2582         .ascii     "$INTERPRET"
             52 45 54
      008FBE                       2583 INTER:
      008FBE CD 8E 80         [ 4] 2584         CALL     NAMEQ
      008FC1 CD 83 DC         [ 4] 2585         CALL     QDUP    ;?defined
      008FC4 CD 81 90         [ 4] 2586         CALL     QBRAN
      008FC7 8F E8                 2587         .word      INTE1
      008FC9 CD 81 E5         [ 4] 2588         CALL     AT
      008FCC CD 81 59         [ 4] 2589         CALL     DOLIT
      008FCF 40 00                 2590 		.word       0x4000	; COMPO*256
      008FD1 CD 82 DE         [ 4] 2591         CALL     ANDD    ;?compile only lexicon bits
      008FD4 CD 8F 8C         [ 4] 2592         CALL     ABORQ
      008FD7 0D                    2593         .byte      13
      008FD8 20 63 6F 6D 70 69 6C  2594         .ascii     " compile only"
             65 20 6F 6E 6C 79
      008FE5 CC 81 B7         [ 2] 2595         JP     EXECU
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008FE8 CD 8A 2C         [ 4] 2596 INTE1:  CALL     NUMBQ   ;convert a number
      008FEB CD 81 90         [ 4] 2597         CALL     QBRAN
      008FEE 8F 94                 2598         .word      ABOR1
      008FF0 81               [ 4] 2599         RET
                                   2600 
                                   2601 ;       [       ( -- )
                                   2602 ;       Start  text interpreter.
      008FF1 8F B3                 2603         .word      LINK
                           000F73  2604 LINK = . 
      008FF3 81                    2605 	.byte      IMEDD+1
      008FF4 5B                    2606         .ascii     "["
      008FF5                       2607 LBRAC:
      008FF5 CD 81 59         [ 4] 2608         CALL     DOLIT
      008FF8 8F BE                 2609         .word      INTER
      008FFA CD 83 8C         [ 4] 2610         CALL     TEVAL
      008FFD CC 81 CE         [ 2] 2611         JP     STORE
                                   2612 
                                   2613 ;       .OK     ( -- )
                                   2614 ;       Display 'ok' while interpreting.
      009000 8F F3                 2615         .word      LINK
                           000F82  2616 LINK = . 
      009002 03                    2617         .byte      3
      009003 2E 4F 4B              2618         .ascii     ".OK"
      009006                       2619 DOTOK:
      009006 CD 81 59         [ 4] 2620         CALL     DOLIT
      009009 8F BE                 2621         .word      INTER
      00900B CD 83 8C         [ 4] 2622         CALL     TEVAL
      00900E CD 81 E5         [ 4] 2623         CALL     AT
      009011 CD 84 BB         [ 4] 2624         CALL     EQUAL
      009014 CD 81 90         [ 4] 2625         CALL     QBRAN
      009017 90 20                 2626         .word      DOTO1
      009019 CD 8B B8         [ 4] 2627         CALL     DOTQP
      00901C 03                    2628         .byte      3
      00901D 20 6F 6B              2629         .ascii     " ok"
      009020 CC 8B 79         [ 2] 2630 DOTO1:  JP     CR
                                   2631 
                                   2632 ;       ?STACK  ( -- )
                                   2633 ;       Abort if stack underflows.
      009023 90 02                 2634         .word      LINK
                           000FA5  2635 LINK = . 
      009025 06                    2636         .byte      6
      009026 3F 53 54 41 43 4B     2637         .ascii     "?STACK"
      00902C                       2638 QSTAC:
      00902C CD 87 97         [ 4] 2639         CALL     DEPTH
      00902F CD 82 CB         [ 4] 2640         CALL     ZLESS   ;check only for underflow
      009032 CD 8F 8C         [ 4] 2641         CALL     ABORQ
      009035 0B                    2642         .byte      11
      009036 20 75 6E 64 65 72 66  2643         .ascii     " underflow "
             6C 6F 77 20
      009041 81               [ 4] 2644         RET
                                   2645 
                                   2646 ;       EVAL    ( -- )
                                   2647 ;       Interpret  input stream.
      009042 90 25                 2648         .word      LINK
                           000FC4  2649 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      009044 04                    2650         .byte      4
      009045 45 56 41 4C           2651         .ascii     "EVAL"
      009049                       2652 EVAL:
      009049 CD 8D 83         [ 4] 2653 EVAL1:  CALL     TOKEN
      00904C CD 82 92         [ 4] 2654         CALL     DUPP
      00904F CD 82 03         [ 4] 2655         CALL     CAT     ;?input stream empty
      009052 CD 81 90         [ 4] 2656         CALL     QBRAN
      009055 90 65                 2657         .word      EVAL2
      009057 CD 83 8C         [ 4] 2658         CALL     TEVAL
      00905A CD 88 4B         [ 4] 2659         CALL     ATEXE
      00905D CD 90 2C         [ 4] 2660         CALL     QSTAC   ;evaluate input, check stack
      009060 CD 81 A7         [ 4] 2661         CALL     BRAN
      009063 90 49                 2662         .word      EVAL1
      009065 CD 82 88         [ 4] 2663 EVAL2:  CALL     DROP
      009068 CC 90 06         [ 2] 2664         JP     DOTOK
                                   2665 
                                   2666 ;       PRESET  ( -- )
                                   2667 ;       Reset data stack pointer and
                                   2668 ;       terminal input buffer.
      00906B 90 44                 2669         .word      LINK
                           000FED  2670 LINK = . 
      00906D 06                    2671         .byte      6
      00906E 50 52 45 53 45 54     2672         .ascii     "PRESET"
      009074                       2673 PRESE:
      009074 CD 81 59         [ 4] 2674         CALL     DOLIT
      009077 16 F0                 2675         .word      SPP
      009079 CD 82 7F         [ 4] 2676         CALL     SPSTO
      00907C CD 81 59         [ 4] 2677         CALL     DOLIT
      00907F 17 00                 2678         .word      TIBB
      009081 CD 83 7B         [ 4] 2679         CALL     NTIB
      009084 CD 86 E2         [ 4] 2680         CALL     CELLP
      009087 CC 81 CE         [ 2] 2681         JP     STORE
                                   2682 
                                   2683 ;       QUIT    ( -- )
                                   2684 ;       Reset return stack pointer
                                   2685 ;       and start text interpreter.
      00908A 90 6D                 2686         .word      LINK
                           00100C  2687 LINK = . 
      00908C 04                    2688         .byte      4
      00908D 51 55 49 54           2689         .ascii     "QUIT"
      009091                       2690 QUIT:
      009091 CD 81 59         [ 4] 2691         CALL     DOLIT
      009094 17 FF                 2692         .word      RPP
      009096 CD 82 20         [ 4] 2693         CALL     RPSTO   ;reset return stack pointer
      009099 CD 8F F5         [ 4] 2694 QUIT1:  CALL     LBRAC   ;start interpretation
      00909C CD 8F 58         [ 4] 2695 QUIT2:  CALL     QUERY   ;get input
      00909F CD 90 49         [ 4] 2696         CALL     EVAL
      0090A2 20 F8            [ 2] 2697         JRA     QUIT2   ;continue till error
                                   2698 
                                   2699 ;; The compiler
                                   2700 
                                   2701 ;       '       ( -- ca )
                                   2702 ;       Search vocabularies for
                                   2703 ;       next word in input stream.
      0090A4 90 8C                 2704         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                           001026  2705 LINK = . 
      0090A6 01                    2706         .byte      1
      0090A7 27                    2707         .ascii     "'"
      0090A8                       2708 TICK:
      0090A8 CD 8D 83         [ 4] 2709         CALL     TOKEN
      0090AB CD 8E 80         [ 4] 2710         CALL     NAMEQ   ;?defined
      0090AE CD 81 90         [ 4] 2711         CALL     QBRAN
      0090B1 8F 94                 2712         .word      ABOR1
      0090B3 81               [ 4] 2713         RET     ;yes, push code address
                                   2714 
                                   2715 ;       ALLOT   ( n -- )
                                   2716 ;       Allocate n bytes to  code dictionary.
      0090B4 90 A6                 2717         .word      LINK
                           001036  2718 LINK = . 
      0090B6 05                    2719         .byte      5
      0090B7 41 4C 4C 4F 54        2720         .ascii     "ALLOT"
      0090BC                       2721 ALLOT:
      0090BC CD 83 BC         [ 4] 2722         CALL     CPP
      0090BF CC 87 C5         [ 2] 2723         JP     PSTOR
                                   2724 
                                   2725 ;       ,       ( w -- )
                                   2726 ;         Compile an integer into
                                   2727 ;         code dictionary.
      0090C2 90 B6                 2728         .word      LINK
                           001044  2729 LINK = . 
      0090C4 01                    2730         .byte      1
      0090C5 2C                    2731         .ascii     ","
      0090C6                       2732 COMMA:
      0090C6 CD 88 1A         [ 4] 2733         CALL     HERE
      0090C9 CD 82 92         [ 4] 2734         CALL     DUPP
      0090CC CD 86 E2         [ 4] 2735         CALL     CELLP   ;cell boundary
      0090CF CD 83 BC         [ 4] 2736         CALL     CPP
      0090D2 CD 81 CE         [ 4] 2737         CALL     STORE
      0090D5 CC 81 CE         [ 2] 2738         JP     STORE
                                   2739 
                                   2740 ;       C,      ( c -- )
                                   2741 ;       Compile a byte into
                                   2742 ;       code dictionary.
      0090D8 90 C4                 2743        .word      LINK
                           00105A  2744 LINK = . 
      0090DA 02                    2745         .byte      2
      0090DB 43 2C                 2746         .ascii     "C,"
      0090DD                       2747 CCOMMA:
      0090DD CD 88 1A         [ 4] 2748         CALL     HERE
      0090E0 CD 82 92         [ 4] 2749         CALL     DUPP
      0090E3 CD 87 0D         [ 4] 2750         CALL     ONEP
      0090E6 CD 83 BC         [ 4] 2751         CALL     CPP
      0090E9 CD 81 CE         [ 4] 2752         CALL     STORE
      0090EC CC 81 F2         [ 2] 2753         JP     CSTOR
                                   2754 
                                   2755 ;       [COMPILE]       ( -- ; <string> )
                                   2756 ;       Compile next immediate
                                   2757 ;       word into code dictionary.
      0090EF 90 DA                 2758         .word      LINK
                           001071  2759 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      0090F1 89                    2760 	.byte      IMEDD+9
      0090F2 5B 43 4F 4D 50 49 4C  2761         .ascii     "[COMPILE]"
             45 5D
      0090FB                       2762 BCOMP:
      0090FB CD 90 A8         [ 4] 2763         CALL     TICK
      0090FE CC 93 57         [ 2] 2764         JP     JSRC
                                   2765 
                                   2766 ;       COMPILE ( -- )
                                   2767 ;       Compile next jsr in
                                   2768 ;       colon list to code dictionary.
      009101 90 F1                 2769         .word      LINK
                           001083  2770 LINK = . 
      009103 47                    2771 	.byte      COMPO+7
      009104 43 4F 4D 50 49 4C 45  2772         .ascii     "COMPILE"
      00910B                       2773 COMPI:
      00910B CD 82 33         [ 4] 2774         CALL     RFROM
      00910E CD 87 0D         [ 4] 2775         CALL     ONEP
      009111 CD 82 92         [ 4] 2776         CALL     DUPP
      009114 CD 81 E5         [ 4] 2777         CALL     AT
      009117 CD 93 57         [ 4] 2778         CALL     JSRC    ;compile subroutine
      00911A CD 86 E2         [ 4] 2779         CALL     CELLP
      00911D CC 82 5B         [ 2] 2780         JP     TOR
                                   2781 
                                   2782 ;       LITERAL ( w -- )
                                   2783 ;       Compile tos to dictionary
                                   2784 ;       as an integer literal.
      009120 91 03                 2785         .word      LINK
                           0010A2  2786 LINK = . 
      009122 87                    2787 	.byte      IMEDD+7
      009123 4C 49 54 45 52 41 4C  2788         .ascii     "LITERAL"
      00912A                       2789 LITER:
      00912A CD 91 0B         [ 4] 2790         CALL     COMPI
      00912D CD 81 59         [ 4] 2791         CALL     DOLIT
      009130 CC 90 C6         [ 2] 2792         JP     COMMA
                                   2793 
                                   2794 ;       $,"     ( -- )
                                   2795 ;       Compile a literal string
                                   2796 ;       up to next " .
      009133 91 22                 2797         .word      LINK
                           0010B5  2798 LINK = . 
      009135 03                    2799         .byte      3
      009136 24 2C 22              2800         .byte     '$',',','"'
      009139                       2801 STRCQ:
      009139 CD 81 59         [ 4] 2802         CALL     DOLIT
      00913C 00 22                 2803         .word     34	; "
      00913E CD 8D 0E         [ 4] 2804         CALL     PARSE
      009141 CD 88 1A         [ 4] 2805         CALL     HERE
      009144 CD 88 C7         [ 4] 2806         CALL     PACKS   ;string to code dictionary
      009147 CD 88 07         [ 4] 2807         CALL     COUNT
      00914A CD 84 35         [ 4] 2808         CALL     PLUS    ;calculate aligned end of string
      00914D CD 83 BC         [ 4] 2809         CALL     CPP
      009150 CC 81 CE         [ 2] 2810         JP     STORE
                                   2811 
                                   2812 ;; Structures
                                   2813 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2814 ;       FOR     ( -- a )
                                   2815 ;       Start a FOR-NEXT loop
                                   2816 ;       structure in a colon definition.
      009153 91 35                 2817         .word      LINK
                           0010D5  2818 LINK = . 
      009155 83                    2819 	.byte      IMEDD+3
      009156 46 4F 52              2820         .ascii     "FOR"
      009159                       2821 FOR:
      009159 CD 91 0B         [ 4] 2822         CALL     COMPI
      00915C CD 82 5B         [ 4] 2823         CALL     TOR
      00915F CC 88 1A         [ 2] 2824         JP     HERE
                                   2825 
                                   2826 ;       NEXT    ( a -- )
                                   2827 ;       Terminate a FOR-NEXT loop.
      009162 91 55                 2828         .word      LINK
                           0010E4  2829 LINK = . 
      009164 84                    2830 	.byte      IMEDD+4
      009165 4E 45 58 54           2831         .ascii     "NEXT"
      009169                       2832 NEXT:
      009169 CD 91 0B         [ 4] 2833         CALL     COMPI
      00916C CD 81 71         [ 4] 2834         CALL     DONXT
      00916F CC 90 C6         [ 2] 2835         JP     COMMA
                                   2836 
                                   2837 ;       BEGIN   ( -- a )
                                   2838 ;       Start an infinite or
                                   2839 ;       indefinite loop structure.
      009172 91 64                 2840         .word      LINK
                           0010F4  2841 LINK = . 
      009174 85                    2842 	.byte      IMEDD+5
      009175 42 45 47 49 4E        2843         .ascii     "BEGIN"
      00917A                       2844 BEGIN:
      00917A CC 88 1A         [ 2] 2845         JP     HERE
                                   2846 
                                   2847 ;       UNTIL   ( a -- )
                                   2848 ;       Terminate a BEGIN-UNTIL
                                   2849 ;       indefinite loop structure.
      00917D 91 74                 2850         .word      LINK
                           0010FF  2851 LINK = . 
      00917F 85                    2852 	.byte      IMEDD+5
      009180 55 4E 54 49 4C        2853         .ascii     "UNTIL"
      009185                       2854 UNTIL:
      009185 CD 91 0B         [ 4] 2855         CALL     COMPI
      009188 CD 81 90         [ 4] 2856         CALL     QBRAN
      00918B CC 90 C6         [ 2] 2857         JP     COMMA
                                   2858 
                                   2859 ;       AGAIN   ( a -- )
                                   2860 ;       Terminate a BEGIN-AGAIN
                                   2861 ;       infinite loop structure.
      00918E 91 7F                 2862         .word      LINK
                           001110  2863 LINK = . 
      009190 85                    2864 	.byte      IMEDD+5
      009191 41 47 41 49 4E        2865         .ascii     "AGAIN"
      009196                       2866 AGAIN:
      009196 CD 91 0B         [ 4] 2867         CALL     COMPI
      009199 CD 81 A7         [ 4] 2868         CALL     BRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      00919C CC 90 C6         [ 2] 2869         JP     COMMA
                                   2870 
                                   2871 ;       IF      ( -- A )
                                   2872 ;       Begin a conditional branch.
      00919F 91 90                 2873         .word      LINK
                           001121  2874 LINK = . 
      0091A1 82                    2875 	.byte      IMEDD+2
      0091A2 49 46                 2876         .ascii     "IF"
      0091A4                       2877 IFF:
      0091A4 CD 91 0B         [ 4] 2878         CALL     COMPI
      0091A7 CD 81 90         [ 4] 2879         CALL     QBRAN
      0091AA CD 88 1A         [ 4] 2880         CALL     HERE
      0091AD CD 87 41         [ 4] 2881         CALL     ZERO
      0091B0 CC 90 C6         [ 2] 2882         JP     COMMA
                                   2883 
                                   2884 ;       THEN        ( A -- )
                                   2885 ;       Terminate a conditional branch structure.
      0091B3 91 A1                 2886         .word      LINK
                           001135  2887 LINK = . 
      0091B5 84                    2888 	.byte      IMEDD+4
      0091B6 54 48 45 4E           2889         .ascii     "THEN"
      0091BA                       2890 THENN:
      0091BA CD 88 1A         [ 4] 2891         CALL     HERE
      0091BD CD 82 A2         [ 4] 2892         CALL     SWAPP
      0091C0 CC 81 CE         [ 2] 2893         JP     STORE
                                   2894 
                                   2895 ;       ELSE        ( A -- A )
                                   2896 ;       Start the false clause in an IF-ELSE-THEN structure.
      0091C3 91 B5                 2897         .word      LINK
                           001145  2898 LINK = . 
      0091C5 84                    2899 	.byte      IMEDD+4
      0091C6 45 4C 53 45           2900         .ascii     "ELSE"
      0091CA                       2901 ELSEE:
      0091CA CD 91 0B         [ 4] 2902         CALL     COMPI
      0091CD CD 81 A7         [ 4] 2903         CALL     BRAN
      0091D0 CD 88 1A         [ 4] 2904         CALL     HERE
      0091D3 CD 87 41         [ 4] 2905         CALL     ZERO
      0091D6 CD 90 C6         [ 4] 2906         CALL     COMMA
      0091D9 CD 82 A2         [ 4] 2907         CALL     SWAPP
      0091DC CD 88 1A         [ 4] 2908         CALL     HERE
      0091DF CD 82 A2         [ 4] 2909         CALL     SWAPP
      0091E2 CC 81 CE         [ 2] 2910         JP     STORE
                                   2911 
                                   2912 ;       AHEAD       ( -- A )
                                   2913 ;       Compile a forward branch instruction.
      0091E5 91 C5                 2914         .word      LINK
                           001167  2915 LINK = . 
      0091E7 85                    2916 	.byte      IMEDD+5
      0091E8 41 48 45 41 44        2917         .ascii     "AHEAD"
      0091ED                       2918 AHEAD:
      0091ED CD 91 0B         [ 4] 2919         CALL     COMPI
      0091F0 CD 81 A7         [ 4] 2920         CALL     BRAN
      0091F3 CD 88 1A         [ 4] 2921         CALL     HERE
      0091F6 CD 87 41         [ 4] 2922         CALL     ZERO
      0091F9 CC 90 C6         [ 2] 2923         JP     COMMA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2924 
                                   2925 ;       WHILE       ( a -- A a )
                                   2926 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      0091FC 91 E7                 2927         .word      LINK
                           00117E  2928 LINK = . 
      0091FE 85                    2929 	.byte      IMEDD+5
      0091FF 57 48 49 4C 45        2930         .ascii     "WHILE"
      009204                       2931 WHILE:
      009204 CD 91 0B         [ 4] 2932         CALL     COMPI
      009207 CD 81 90         [ 4] 2933         CALL     QBRAN
      00920A CD 88 1A         [ 4] 2934         CALL     HERE
      00920D CD 87 41         [ 4] 2935         CALL     ZERO
      009210 CD 90 C6         [ 4] 2936         CALL     COMMA
      009213 CC 82 A2         [ 2] 2937         JP     SWAPP
                                   2938 
                                   2939 ;       REPEAT      ( A a -- )
                                   2940 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      009216 91 FE                 2941         .word      LINK
                           001198  2942 LINK = . 
      009218 86                    2943         .byte      IMEDD+6
      009219 52 45 50 45 41 54     2944         .ascii     "REPEAT"
      00921F                       2945 REPEA:
      00921F CD 91 0B         [ 4] 2946         CALL     COMPI
      009222 CD 81 A7         [ 4] 2947         CALL     BRAN
      009225 CD 90 C6         [ 4] 2948         CALL     COMMA
      009228 CD 88 1A         [ 4] 2949         CALL     HERE
      00922B CD 82 A2         [ 4] 2950         CALL     SWAPP
      00922E CC 81 CE         [ 2] 2951         JP     STORE
                                   2952 
                                   2953 ;       AFT         ( a -- a A )
                                   2954 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      009231 92 18                 2955         .word      LINK
                           0011B3  2956 LINK = . 
      009233 83                    2957 	.byte      IMEDD+3
      009234 41 46 54              2958         .ascii     "AFT"
      009237                       2959 AFT:
      009237 CD 82 88         [ 4] 2960         CALL     DROP
      00923A CD 91 ED         [ 4] 2961         CALL     AHEAD
      00923D CD 88 1A         [ 4] 2962         CALL     HERE
      009240 CC 82 A2         [ 2] 2963         JP     SWAPP
                                   2964 
                                   2965 ;       ABORT"      ( -- ; <string> )
                                   2966 ;       Conditional abort with an error message.
      009243 92 33                 2967         .word      LINK
                           0011C5  2968 LINK = . 
      009245 86                    2969 	.byte      IMEDD+6
      009246 41 42 4F 52 54        2970         .ascii     "ABORT"
      00924B 22                    2971         .byte      '"'
      00924C                       2972 ABRTQ:
      00924C CD 91 0B         [ 4] 2973         CALL     COMPI
      00924F CD 8F 8C         [ 4] 2974         CALL     ABORQ
      009252 CC 91 39         [ 2] 2975         JP     STRCQ
                                   2976 
                                   2977 ;       $"     ( -- ; <string> )
                                   2978 ;       Compile an inline string literal.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009255 92 45                 2979         .word      LINK
                           0011D7  2980 LINK = . 
      009257 82                    2981 	.byte      IMEDD+2
      009258 24 22                 2982         .byte     '$','"'
      00925A                       2983 STRQ:
      00925A CD 91 0B         [ 4] 2984         CALL     COMPI
      00925D CD 8B AE         [ 4] 2985         CALL     STRQP
      009260 CC 91 39         [ 2] 2986         JP     STRCQ
                                   2987 
                                   2988 ;       ."          ( -- ; <string> )
                                   2989 ;       Compile an inline string literal to be typed out at run time.
      009263 92 57                 2990         .word      LINK
                           0011E5  2991 LINK = . 
      009265 82                    2992 	.byte      IMEDD+2
      009266 2E 22                 2993         .byte     '.','"'
      009268                       2994 DOTQ:
      009268 CD 91 0B         [ 4] 2995         CALL     COMPI
      00926B CD 8B B8         [ 4] 2996         CALL     DOTQP
      00926E CC 91 39         [ 2] 2997         JP     STRCQ
                                   2998 
                                   2999 ;; Name compiler
                                   3000 
                                   3001 ;       ?UNIQUE ( a -- a )
                                   3002 ;       Display a warning message
                                   3003 ;       if word already exists.
      009271 92 65                 3004         .word      LINK
                           0011F3  3005 LINK = . 
      009273 07                    3006         .byte      7
      009274 3F 55 4E 49 51 55 45  3007         .ascii     "?UNIQUE"
      00927B                       3008 UNIQU:
      00927B CD 82 92         [ 4] 3009         CALL     DUPP
      00927E CD 8E 80         [ 4] 3010         CALL     NAMEQ   ;?name exists
      009281 CD 81 90         [ 4] 3011         CALL     QBRAN
      009284 92 9A                 3012         .word      UNIQ1
      009286 CD 8B B8         [ 4] 3013         CALL     DOTQP   ;redef are OK
      009289 07                    3014         .byte       7
      00928A 20 72 65 44 65 66 20  3015         .ascii     " reDef "       
      009291 CD 82 BC         [ 4] 3016         CALL     OVER
      009294 CD 88 07         [ 4] 3017         CALL     COUNT
      009297 CD 8B 5B         [ 4] 3018         CALL     TYPES   ;just in case
      00929A CC 82 88         [ 2] 3019 UNIQ1:  JP     DROP
                                   3020 
                                   3021 ;       $,n     ( na -- )
                                   3022 ;       Build a new dictionary name
                                   3023 ;       using string at na.
      00929D 92 73                 3024         .word      LINK
                           00121F  3025 LINK = . 
      00929F 03                    3026         .byte      3
      0092A0 24 2C 6E              3027         .ascii     "$,n"
      0092A3                       3028 SNAME:
      0092A3 CD 82 92         [ 4] 3029         CALL     DUPP
      0092A6 CD 82 03         [ 4] 3030         CALL     CAT     ;?null input
      0092A9 CD 81 90         [ 4] 3031         CALL     QBRAN
      0092AC 92 D9                 3032         .word      PNAM1
      0092AE CD 92 7B         [ 4] 3033         CALL     UNIQU   ;?redefinition
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0092B1 CD 82 92         [ 4] 3034         CALL     DUPP
      0092B4 CD 88 07         [ 4] 3035         CALL     COUNT
      0092B7 CD 84 35         [ 4] 3036         CALL     PLUS
      0092BA CD 83 BC         [ 4] 3037         CALL     CPP
      0092BD CD 81 CE         [ 4] 3038         CALL     STORE
      0092C0 CD 82 92         [ 4] 3039         CALL     DUPP
      0092C3 CD 83 CC         [ 4] 3040         CALL     LAST
      0092C6 CD 81 CE         [ 4] 3041         CALL     STORE   ;save na for vocabulary link
      0092C9 CD 86 F1         [ 4] 3042         CALL     CELLM   ;link address
      0092CC CD 83 AE         [ 4] 3043         CALL     CNTXT
      0092CF CD 81 E5         [ 4] 3044         CALL     AT
      0092D2 CD 82 A2         [ 4] 3045         CALL     SWAPP
      0092D5 CD 81 CE         [ 4] 3046         CALL     STORE
      0092D8 81               [ 4] 3047         RET     ;save code pointer
      0092D9 CD 8B AE         [ 4] 3048 PNAM1:  CALL     STRQP
      0092DC 05                    3049         .byte      5
      0092DD 20 6E 61 6D 65        3050         .ascii     " name" ;null input
      0092E2 CC 8F 94         [ 2] 3051         JP     ABOR1
                                   3052 
                                   3053 ;; FORTH compiler
                                   3054 
                                   3055 ;       $COMPILE        ( a -- )
                                   3056 ;       Compile next word to
                                   3057 ;       dictionary as a token or literal.
      0092E5 92 9F                 3058         .word      LINK
                           001267  3059 LINK = . 
      0092E7 08                    3060         .byte      8
      0092E8 24 43 4F 4D 50 49 4C  3061         .ascii     "$COMPILE"
             45
      0092F0                       3062 SCOMP:
      0092F0 CD 8E 80         [ 4] 3063         CALL     NAMEQ
      0092F3 CD 83 DC         [ 4] 3064         CALL     QDUP    ;?defined
      0092F6 CD 81 90         [ 4] 3065         CALL     QBRAN
      0092F9 93 11                 3066         .word      SCOM2
      0092FB CD 81 E5         [ 4] 3067         CALL     AT
      0092FE CD 81 59         [ 4] 3068         CALL     DOLIT
      009301 80 00                 3069         .word     0x8000	;  IMEDD*256
      009303 CD 82 DE         [ 4] 3070         CALL     ANDD    ;?immediate
      009306 CD 81 90         [ 4] 3071         CALL     QBRAN
      009309 93 0E                 3072         .word      SCOM1
      00930B CC 81 B7         [ 2] 3073         JP     EXECU
      00930E CC 93 57         [ 2] 3074 SCOM1:  JP     JSRC
      009311 CD 8A 2C         [ 4] 3075 SCOM2:  CALL     NUMBQ   ;try to convert to number
      009314 CD 81 90         [ 4] 3076         CALL     QBRAN
      009317 8F 94                 3077         .word      ABOR1
      009319 CC 91 2A         [ 2] 3078         JP     LITER
                                   3079 
                                   3080 ;       OVERT   ( -- )
                                   3081 ;       Link a new word into vocabulary.
      00931C 92 E7                 3082         .word      LINK
                           00129E  3083 LINK = . 
      00931E 05                    3084         .byte      5
      00931F 4F 56 45 52 54        3085         .ascii     "OVERT"
      009324                       3086 OVERT:
      009324 CD 83 CC         [ 4] 3087         CALL     LAST
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009327 CD 81 E5         [ 4] 3088         CALL     AT
      00932A CD 83 AE         [ 4] 3089         CALL     CNTXT
      00932D CC 81 CE         [ 2] 3090         JP     STORE
                                   3091 
                                   3092 ;       ;       ( -- )
                                   3093 ;       Terminate a colon definition.
      009330 93 1E                 3094         .word      LINK
                           0012B2  3095 LINK = . 
      009332 C1                    3096 	.byte      IMEDD+COMPO+1
      009333 3B                    3097         .ascii     ";"
      009334                       3098 SEMIS:
      009334 CD 91 0B         [ 4] 3099         CALL     COMPI
      009337 CD 81 C7         [ 4] 3100         CALL     EXIT
      00933A CD 8F F5         [ 4] 3101         CALL     LBRAC
      00933D CC 93 24         [ 2] 3102         JP     OVERT
                                   3103 
                                   3104 ;       ]       ( -- )
                                   3105 ;       Start compiling words in
                                   3106 ;       input stream.
      009340 93 32                 3107         .word      LINK
                           0012C2  3108 LINK = . 
      009342 01                    3109         .byte      1
      009343 5D                    3110         .ascii     "]"
      009344                       3111 RBRAC:
      009344 CD 81 59         [ 4] 3112         CALL     DOLIT
      009347 92 F0                 3113         .word      SCOMP
      009349 CD 83 8C         [ 4] 3114         CALL     TEVAL
      00934C CC 81 CE         [ 2] 3115         JP     STORE
                                   3116 
                                   3117 ;       CALL,    ( ca -- )
                                   3118 ;       Compile a subroutine call.
      00934F 93 42                 3119         .word      LINK
                           0012D1  3120 LINK = . 
      009351 04                    3121         .byte      4
      009352 43 41 4C 4C 2C        3122         .ascii     "CALL,"
      009357                       3123 JSRC:
      009357 CD 81 59         [ 4] 3124         CALL     DOLIT
      00935A 00 CD                 3125         .word     CALLL     ;CALL
      00935C CD 90 DD         [ 4] 3126         CALL     CCOMMA
      00935F CC 90 C6         [ 2] 3127         JP     COMMA
                                   3128 
                                   3129 ;       :       ( -- ; <string> )
                                   3130 ;       Start a new colon definition
                                   3131 ;       using next word as its name.
      009362 93 51                 3132         .word      LINK
                           0012E4  3133 LINK = . 
      009364 01                    3134         .byte      1
      009365 3A                    3135         .ascii     ":"
      009366                       3136 COLON:
      009366 CD 8D 83         [ 4] 3137         CALL     TOKEN
      009369 CD 92 A3         [ 4] 3138         CALL     SNAME
      00936C CC 93 44         [ 2] 3139         JP     RBRAC
                                   3140 
                                   3141 ;       IMMEDIATE       ( -- )
                                   3142 ;       Make last compiled word
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3143 ;       an immediate word.
      00936F 93 64                 3144         .word      LINK
                           0012F1  3145 LINK = . 
      009371 09                    3146         .byte      9
      009372 49 4D 4D 45 44 49 41  3147         .ascii     "IMMEDIATE"
             54 45
      00937B                       3148 IMMED:
      00937B CD 81 59         [ 4] 3149         CALL     DOLIT
      00937E 80 00                 3150         .word     0x8000	;  IMEDD*256
      009380 CD 83 CC         [ 4] 3151         CALL     LAST
      009383 CD 81 E5         [ 4] 3152         CALL     AT
      009386 CD 81 E5         [ 4] 3153         CALL     AT
      009389 CD 82 F2         [ 4] 3154         CALL     ORR
      00938C CD 83 CC         [ 4] 3155         CALL     LAST
      00938F CD 81 E5         [ 4] 3156         CALL     AT
      009392 CC 81 CE         [ 2] 3157         JP     STORE
                                   3158 
                                   3159 ;; Defining words
                                   3160 
                                   3161 ;       CREATE  ( -- ; <string> )
                                   3162 ;       Compile a new array
                                   3163 ;       without allocating space.
      009395 93 71                 3164         .word      LINK
                           001317  3165 LINK = . 
      009397 06                    3166         .byte      6
      009398 43 52 45 41 54 45     3167         .ascii     "CREATE"
      00939E                       3168 CREAT:
      00939E CD 8D 83         [ 4] 3169         CALL     TOKEN
      0093A1 CD 92 A3         [ 4] 3170         CALL     SNAME
      0093A4 CD 93 24         [ 4] 3171         CALL     OVERT
      0093A7 CD 91 0B         [ 4] 3172         CALL     COMPI
      0093AA CD 83 3F         [ 4] 3173         CALL     DOVAR
      0093AD 81               [ 4] 3174         RET
                                   3175 
                                   3176 ;       VARIABLE        ( -- ; <string> )
                                   3177 ;       Compile a new variable
                                   3178 ;       initialized to 0.
      0093AE 93 97                 3179         .word      LINK
                           001330  3180 LINK = . 
      0093B0 08                    3181         .byte      8
      0093B1 56 41 52 49 41 42 4C  3182         .ascii     "VARIABLE"
             45
      0093B9                       3183 VARIA:
      0093B9 CD 93 9E         [ 4] 3184         CALL     CREAT
      0093BC CD 87 41         [ 4] 3185         CALL     ZERO
      0093BF CC 90 C6         [ 2] 3186         JP     COMMA
                                   3187 
                                   3188 ;; Tools
                                   3189 
                                   3190 ;       _TYPE   ( b u -- )
                                   3191 ;       Display a string. Filter
                                   3192 ;       non-printing characters.
      0093C2 93 B0                 3193         .word      LINK
                           001344  3194 LINK = . 
      0093C4 05                    3195         .byte      5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      0093C5 5F 54 59 50 45        3196         .ascii     "_TYPE"
      0093CA                       3197 UTYPE:
      0093CA CD 82 5B         [ 4] 3198         CALL     TOR     ;start count down loop
      0093CD 20 0F            [ 2] 3199         JRA     UTYP2   ;skip first pass
      0093CF CD 82 92         [ 4] 3200 UTYP1:  CALL     DUPP
      0093D2 CD 82 03         [ 4] 3201         CALL     CAT
      0093D5 CD 87 6B         [ 4] 3202         CALL     TCHAR
      0093D8 CD 81 43         [ 4] 3203         CALL     EMIT    ;display only printable
      0093DB CD 87 0D         [ 4] 3204         CALL     ONEP    ;increment address
      0093DE CD 81 71         [ 4] 3205 UTYP2:  CALL     DONXT
      0093E1 93 CF                 3206         .word      UTYP1   ;loop till done
      0093E3 CC 82 88         [ 2] 3207         JP     DROP
                                   3208 
                                   3209 ;       dm+     ( a u -- a )
                                   3210 ;       Dump u bytes from ,
                                   3211 ;       leaving a+u on  stack.
      0093E6 93 C4                 3212         .word      LINK
                           001368  3213 LINK = . 
      0093E8 03                    3214         .byte      3
      0093E9 64 6D 2B              3215         .ascii     "dm+"
      0093EC                       3216 DUMPP:
      0093EC CD 82 BC         [ 4] 3217         CALL     OVER
      0093EF CD 81 59         [ 4] 3218         CALL     DOLIT
      0093F2 00 04                 3219         .word      4
      0093F4 CD 8B E1         [ 4] 3220         CALL     UDOTR   ;display address
      0093F7 CD 8B 31         [ 4] 3221         CALL     SPACE
      0093FA CD 82 5B         [ 4] 3222         CALL     TOR     ;start count down loop
      0093FD 20 11            [ 2] 3223         JRA     PDUM2   ;skip first pass
      0093FF CD 82 92         [ 4] 3224 PDUM1:  CALL     DUPP
      009402 CD 82 03         [ 4] 3225         CALL     CAT
      009405 CD 81 59         [ 4] 3226         CALL     DOLIT
      009408 00 03                 3227         .word      3
      00940A CD 8B E1         [ 4] 3228         CALL     UDOTR   ;display numeric data
      00940D CD 87 0D         [ 4] 3229         CALL     ONEP    ;increment address
      009410 CD 81 71         [ 4] 3230 PDUM2:  CALL     DONXT
      009413 93 FF                 3231         .word      PDUM1   ;loop till done
      009415 81               [ 4] 3232         RET
                                   3233 
                                   3234 ;       DUMP    ( a u -- )
                                   3235 ;       Dump u bytes from a,
                                   3236 ;       in a formatted manner.
      009416 93 E8                 3237         .word      LINK
                           001398  3238 LINK = . 
      009418 04                    3239         .byte      4
      009419 44 55 4D 50           3240         .ascii     "DUMP"
      00941D                       3241 DUMP:
      00941D CD 83 4D         [ 4] 3242         CALL     BASE
      009420 CD 81 E5         [ 4] 3243         CALL     AT
      009423 CD 82 5B         [ 4] 3244         CALL     TOR
      009426 CD 89 BF         [ 4] 3245         CALL     HEX     ;save radix, set hex
      009429 CD 81 59         [ 4] 3246         CALL     DOLIT
      00942C 00 10                 3247         .word      16
      00942E CD 86 26         [ 4] 3248         CALL     SLASH   ;change count to lines
      009431 CD 82 5B         [ 4] 3249         CALL     TOR     ;start count down loop
      009434 CD 8B 79         [ 4] 3250 DUMP1:  CALL     CR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009437 CD 81 59         [ 4] 3251         CALL     DOLIT
      00943A 00 10                 3252         .word      16
      00943C CD 84 20         [ 4] 3253         CALL     DDUP
      00943F CD 93 EC         [ 4] 3254         CALL     DUMPP   ;display numeric
      009442 CD 83 ED         [ 4] 3255         CALL     ROT
      009445 CD 83 ED         [ 4] 3256         CALL     ROT
      009448 CD 8B 31         [ 4] 3257         CALL     SPACE
      00944B CD 8B 31         [ 4] 3258         CALL     SPACE
      00944E CD 93 CA         [ 4] 3259         CALL     UTYPE   ;display printable characters
      009451 CD 81 71         [ 4] 3260         CALL     DONXT
      009454 94 34                 3261         .word      DUMP1   ;loop till done
      009456 CD 82 88         [ 4] 3262 DUMP3:  CALL     DROP
      009459 CD 82 33         [ 4] 3263         CALL     RFROM
      00945C CD 83 4D         [ 4] 3264         CALL     BASE
      00945F CC 81 CE         [ 2] 3265         JP     STORE   ;restore radix
                                   3266 
                                   3267 ;       .S      ( ... -- ... )
                                   3268 ;        Display  contents of stack.
      009462 94 18                 3269         .word      LINK
                           0013E4  3270 LINK = . 
      009464 02                    3271         .byte      2
      009465 2E 53                 3272         .ascii     ".S"
      009467                       3273 DOTS:
      009467 CD 8B 79         [ 4] 3274         CALL     CR
      00946A CD 87 97         [ 4] 3275         CALL     DEPTH   ;stack depth
      00946D CD 82 5B         [ 4] 3276         CALL     TOR     ;start count down loop
      009470 20 0C            [ 2] 3277         JRA     DOTS2   ;skip first pass
      009472 CD 82 46         [ 4] 3278 DOTS1:  CALL     RAT
      009475 CD 87 0D         [ 4] 3279         CALL ONEP
      009478 CD 87 B0         [ 4] 3280 	CALL     PICK
      00947B CD 8C 14         [ 4] 3281         CALL     DOT     ;index stack, display contents
      00947E CD 81 71         [ 4] 3282 DOTS2:  CALL     DONXT
      009481 94 72                 3283         .word      DOTS1   ;loop till done
      009483 CD 8B B8         [ 4] 3284         CALL     DOTQP
      009486 05                    3285         .byte      5
      009487 20 3C 73 70 20        3286         .ascii     " <sp "
      00948C 81               [ 4] 3287         RET
                                   3288 
                                   3289 ;       >NAME   ( ca -- na | F )
                                   3290 ;       Convert code address
                                   3291 ;       to a name address.
      00948D 94 64                 3292         .word      LINK
                           00140F  3293 LINK = . 
      00948F 05                    3294         .byte      5
      009490 3E 4E 41 4D 45        3295         .ascii     ">NAME"
      009495                       3296 TNAME:
      009495 CD 83 AE         [ 4] 3297         CALL     CNTXT   ;vocabulary link
      009498 CD 81 E5         [ 4] 3298 TNAM2:  CALL     AT
      00949B CD 82 92         [ 4] 3299         CALL     DUPP    ;?last word in a vocabulary
      00949E CD 81 90         [ 4] 3300         CALL     QBRAN
      0094A1 94 BC                 3301         .word      TNAM4
      0094A3 CD 84 20         [ 4] 3302         CALL     DDUP
      0094A6 CD 8D 91         [ 4] 3303         CALL     NAMET
      0094A9 CD 83 07         [ 4] 3304         CALL     XORR    ;compare
      0094AC CD 81 90         [ 4] 3305         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0094AF 94 B6                 3306         .word      TNAM3
      0094B1 CD 86 F1         [ 4] 3307         CALL     CELLM   ;continue with next word
      0094B4 20 E2            [ 2] 3308         JRA     TNAM2
      0094B6 CD 82 A2         [ 4] 3309 TNAM3:  CALL     SWAPP
      0094B9 CC 82 88         [ 2] 3310         JP     DROP
      0094BC CD 84 15         [ 4] 3311 TNAM4:  CALL     DDROP
      0094BF CC 87 41         [ 2] 3312         JP     ZERO
                                   3313 
                                   3314 ;       .ID     ( na -- )
                                   3315 ;        Display  name at address.
      0094C2 94 8F                 3316         .word      LINK
                           001444  3317 LINK = . 
      0094C4 03                    3318         .byte      3
      0094C5 2E 49 44              3319         .ascii     ".ID"
      0094C8                       3320 DOTID:
      0094C8 CD 83 DC         [ 4] 3321         CALL     QDUP    ;if zero no name
      0094CB CD 81 90         [ 4] 3322         CALL     QBRAN
      0094CE 94 DE                 3323         .word      DOTI1
      0094D0 CD 88 07         [ 4] 3324         CALL     COUNT
      0094D3 CD 81 59         [ 4] 3325         CALL     DOLIT
      0094D6 00 1F                 3326         .word      0x1F
      0094D8 CD 82 DE         [ 4] 3327         CALL     ANDD    ;mask lexicon bits
      0094DB CC 93 CA         [ 2] 3328         JP     UTYPE
      0094DE CD 8B B8         [ 4] 3329 DOTI1:  CALL     DOTQP
      0094E1 09                    3330         .byte      9
      0094E2 20 6E 6F 4E 61 6D 65  3331         .ascii     " noName"
      0094E9 81               [ 4] 3332         RET
                                   3333 
                                   3334 ;       SEE     ( -- ; <string> )
                                   3335 ;       A simple decompiler.
                                   3336 ;       Updated for byte machines.
                                   3337 ;        .word      LINK
                                   3338 ;LINK = . 
                                   3339 ;        .byte      3
                                   3340 ;        .ascii     "SEE"
                                   3341 ;SEE:
                                   3342 ;        CALL     TICK    ;starting address
                                   3343 ;        CALL     CR
                                   3344 ;        CALL     ONEM
                                   3345 ;SEE1:   CALL     ONEP
                                   3346 ;        CALL     DUPP
                                   3347 ;        CALL     AT
                                   3348 ;        CALL     DUPP    ;?does it contain a zero
                                   3349 ;        CALL     QBRAN
                                   3350 ;        .word      SEE2
                                   3351 ;        CALL     TNAME   ;?is it a name
                                   3352 ;SEE2:   CALL     QDUP    ;name address or zero
                                   3353 ;        CALL     QBRAN
                                   3354 ;        .word      SEE3
                                   3355 ;        CALL     SPACE
                                   3356 ;        CALL     DOTID   ;display name
                                   3357 ;        CALL     ONEP
                                   3358 ;        JRA     SEE4
                                   3359 ;SEE3:   CALL     DUPP
                                   3360 ;        CALL     CAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3361 ;        CALL     UDOT    ;display number
                                   3362 ;SEE4:   CALL     NUFQ    ;user control
                                   3363 ;        CALL     QBRAN
                                   3364 ;        .word      SEE1
                                   3365 ;        JP     DROP
                                   3366 
                                   3367 ;       WORDS   ( -- )
                                   3368 ;       Display names in vocabulary.
      0094EA 94 C4                 3369         .word      LINK
                           00146C  3370 LINK = . 
      0094EC 05                    3371         .byte      5
      0094ED 57 4F 52 44 53        3372         .ascii     "WORDS"
      0094F2                       3373 WORDS:
      0094F2 CD 8B 79         [ 4] 3374         CALL     CR
      0094F5 CD 83 AE         [ 4] 3375         CALL     CNTXT   ;only in context
      0094F8 CD 81 E5         [ 4] 3376 WORS1:  CALL     AT
      0094FB CD 83 DC         [ 4] 3377         CALL     QDUP    ;?at end of list
      0094FE CD 81 90         [ 4] 3378         CALL     QBRAN
      009501 95 17                 3379         .word      WORS2
      009503 CD 82 92         [ 4] 3380         CALL     DUPP
      009506 CD 8B 31         [ 4] 3381         CALL     SPACE
      009509 CD 94 C8         [ 4] 3382         CALL     DOTID   ;display a name
      00950C CD 86 F1         [ 4] 3383         CALL     CELLM
      00950F CD 81 A7         [ 4] 3384         CALL     BRAN
      009512 94 F8                 3385         .word      WORS1
      009514 CD 82 88         [ 4] 3386         CALL     DROP
      009517 81               [ 4] 3387 WORS2:  RET
                                   3388 
                                   3389         
                                   3390 ;; Hardware reset
                                   3391 
                                   3392 ;       hi      ( -- )
                                   3393 ;       Display sign-on message.
      009518 94 EC                 3394         .word      LINK
                           00149A  3395 LINK = . 
      00951A 02                    3396         .byte      2
      00951B 68 69                 3397         .ascii     "hi"
      00951D                       3398 HI:
      00951D CD 8B 79         [ 4] 3399         CALL     CR
      009520 CD 8B B8         [ 4] 3400         CALL     DOTQP   ;initialize I/O
      009523 0F                    3401         .byte      15
      009524 73 74 6D 38 65 46 6F  3402         .ascii     "stm8eForth v"
             72 74 68 20 76
      009530 32                    3403 	.byte      VER+'0'
      009531 2E                    3404         .byte      '.' 
      009532 31                    3405 	.byte      EXT+'0' ;version
      009533 CC 8B 79         [ 2] 3406         JP     CR
                                   3407 
                                   3408 ;       DEBUG      ( -- )
                                   3409 ;       Display sign-on message.
                                   3410 ;        .word      LINK
                                   3411 ;LINK = . 
                                   3412 ;        .byte      5
                                   3413 ;        .ascii     "DEBUG"
                                   3414 ;DEBUG:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3415 ;	CALL DOLIT
                                   3416 ;	.word 0x65
                                   3417 ;	CALL EMIT
                                   3418 ;	CALL DOLIT
                                   3419 ;	.word 0
                                   3420 ; 	CALL ZLESS 
                                   3421 ;	CALL DOLIT
                                   3422 ;	.word 0xFFFE
                                   3423 ;	CALL ZLESS 
                                   3424 ;	CALL UPLUS 
                                   3425 ; 	CALL DROP 
                                   3426 ;	CALL DOLIT
                                   3427 ;	.word 3
                                   3428 ;	CALL UPLUS 
                                   3429 ;	CALL UPLUS 
                                   3430 ; 	CALL DROP
                                   3431 ;	CALL DOLIT
                                   3432 ;	.word 0x43
                                   3433 ;	CALL UPLUS 
                                   3434 ; 	CALL DROP
                                   3435 ;	CALL EMIT
                                   3436 ;	CALL DOLIT
                                   3437 ;	.word 0x4F
                                   3438 ;	CALL DOLIT
                                   3439 ;	.word 0x6F
                                   3440 ; 	CALL XORR
                                   3441 ;	CALL DOLIT
                                   3442 ;	.word 0xF0
                                   3443 ; 	CALL ANDD
                                   3444 ;	CALL DOLIT
                                   3445 ;	.word 0x4F
                                   3446 ; 	CALL ORR
                                   3447 ;	CALL EMIT
                                   3448 ;	CALL DOLIT
                                   3449 ;	.word 8
                                   3450 ;	CALL DOLIT
                                   3451 ;	.word 6
                                   3452 ; 	CALL SWAPP
                                   3453 ;	CALL OVER
                                   3454 ;	CALL XORR
                                   3455 ;	CALL DOLIT
                                   3456 ;	.word 3
                                   3457 ;	CALL ANDD 
                                   3458 ;	CALL ANDD
                                   3459 ;	CALL DOLIT
                                   3460 ;	.word 0x70
                                   3461 ;	CALL UPLUS 
                                   3462 ;	CALL DROP
                                   3463 ;	CALL EMIT
                                   3464 ;	CALL DOLIT
                                   3465 ;	.word 0
                                   3466 ;	CALL QBRAN
                                   3467 ;	.word DEBUG1
                                   3468 ;	CALL DOLIT
                                   3469 ;	.word 0x3F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                                   3470 ;DEBUG1:
                                   3471 ;	CALL DOLIT
                                   3472 ;	.word 0xFFFF
                                   3473 ;	CALL QBRAN
                                   3474 ;	.word DEBUG2
                                   3475 ;	CALL DOLIT
                                   3476 ;	.word 0x74
                                   3477 ;	CALL BRAN
                                   3478 ;	.word DEBUG3
                                   3479 ;DEBUG2:
                                   3480 ;	CALL DOLIT
                                   3481 ;	.word 0x21
                                   3482 ;DEBUG3:
                                   3483 ;	CALL EMIT
                                   3484 ;	CALL DOLIT
                                   3485 ;	.word 0x68
                                   3486 ;	CALL DOLIT
                                   3487 ;	.word 0x80
                                   3488 ;	CALL STORE
                                   3489 ;	CALL DOLIT
                                   3490 ;	.word 0x80
                                   3491 ;	CALL AT
                                   3492 ;	CALL EMIT
                                   3493 ;	CALL DOLIT
                                   3494 ;	.word 0x4D
                                   3495 ;	CALL TOR
                                   3496 ;	CALL RAT
                                   3497 ;	CALL RFROM
                                   3498 ;	CALL ANDD
                                   3499 ;	CALL EMIT
                                   3500 ;	CALL DOLIT
                                   3501 ;	.word 0x61
                                   3502 ;	CALL DOLIT
                                   3503 ;	.word 0xA
                                   3504 ;	CALL TOR
                                   3505 ;DEBUG4:
                                   3506 ;	CALL DOLIT
                                   3507 ;	.word 1
                                   3508 ;	CALL UPLUS 
                                   3509 ;	CALL DROP
                                   3510 ;	CALL DONXT
                                   3511 ;	.word DEBUG4
                                   3512 ;	CALL EMIT
                                   3513 ;	CALL DOLIT
                                   3514 ;	.word 0x656D
                                   3515 ;	CALL DOLIT
                                   3516 ;	.word 0x100
                                   3517 ;	CALL UMSTA
                                   3518 ;	CALL SWAPP
                                   3519 ;	CALL DOLIT
                                   3520 ;	.word 0x100
                                   3521 ;	CALL UMSTA
                                   3522 ;	CALL SWAPP 
                                   3523 ;	CALL DROP
                                   3524 ;	CALL EMIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                                   3525 ;	CALL EMIT
                                   3526 ;	CALL DOLIT
                                   3527 ;	.word 0x2043
                                   3528 ;	CALL DOLIT
                                   3529 ;	.word 0
                                   3530 ;	CALL DOLIT
                                   3531 ;	.word 0x100
                                   3532 ;	CALL UMMOD
                                   3533 ;	CALL EMIT
                                   3534 ;	CALL EMIT
                                   3535 	;JP ORIG
                                   3536 ;	RET
                                   3537 
                                   3538 ;       'BOOT   ( -- a )
                                   3539 ;       The application startup vector.
      009536 95 1A                 3540         .word      LINK
                           0014B8  3541 LINK = . 
      009538 05                    3542         .byte      5
      009539 27 42 4F 4F 54        3543         .ascii     "'BOOT"
      00953E                       3544 TBOOT:
      00953E CD 83 3F         [ 4] 3545         CALL     DOVAR
      009541 95 1D                 3546         .word      HI       ;application to boot
                                   3547 
                                   3548 ;       COLD    ( -- )
                                   3549 ;       The hilevel cold start s=ence.
      009543 95 38                 3550         .word      LINK
                           0014C5  3551 LINK = . 
      009545 04                    3552         .byte      4
      009546 43 4F 4C 44           3553         .ascii     "COLD"
      00954A                       3554 COLD:
                                   3555 ;        CALL DEBUG
      00954A CD 81 59         [ 4] 3556 COLD1:  CALL     DOLIT
      00954D 80 A0                 3557         .word      UZERO
      00954F CD 81 59         [ 4] 3558 	CALL     DOLIT
      009552 00 06                 3559         .word      UPP
      009554 CD 81 59         [ 4] 3560         CALL     DOLIT
      009557 00 14                 3561 	.word      ULAST-UZERO
      009559 CD 88 62         [ 4] 3562         CALL     CMOVE   ;initialize user area
      00955C CD 90 74         [ 4] 3563         CALL     PRESE   ;initialize data stack and TIB
      00955F CD 95 3E         [ 4] 3564         CALL     TBOOT
      009562 CD 88 4B         [ 4] 3565         CALL     ATEXE   ;application boot
      009565 CD 93 24         [ 4] 3566         CALL     OVERT
      009568 CC 90 91         [ 2] 3567         JP     QUIT    ;start interpretation
                                   3568 
                                   3569 
                                   3570 ;       
                                   3571 ;===============================================================
                                   3572 
                           0014C5  3573 LASTN   =	LINK   ;last name defined
                                   3574 
                                   3575 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000436 R   |   6 ABOR1      000F14 R
  6 ABOR2      000F2B R   |   6 ABORQ      000F0C R   |   6 ABORT      000EFD R
  6 ABRTQ      0011CC R   |   6 ABSS       00042D R   |   6 ACCEP      000E93 R
  6 ACCP1      000E9C R   |   6 ACCP2      000EC2 R   |   6 ACCP3      000EC5 R
  6 ACCP4      000EC7 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
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
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |   6 AFT        0011B7 R
  6 AGAIN      001116 R   |   6 AHEAD      00116D R   |   6 ALLOT      00103C R
  6 ANDD       00025E R   |   6 AT         000165 R   |   6 ATEXE      0007CB R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 BACK1      000E3B R   |   6 BASE       0002CD R   |     BASEE   =  00000A 
  6 BCOMP      00107B R   |   6 BDIGS      0008A4 R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
  6 BEGIN      0010FA R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
  6 BKSLA      000CDC R   |   6 BKSP       000E0B R   |     BKSPP   =  000008 
  6 BLANK      0006B4 R   |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |   6 BRAN       000127 R   |     CALLL   =  0000CD 
    CAN_DGR =  005426     |     CAN_FPSR=  005427     |     CAN_IER =  005425 
    CAN_MCR =  005420     |     CAN_MSR =  005421     |     CAN_P0  =  005428 
    CAN_P1  =  005429     |     CAN_P2  =  00542A     |     CAN_P3  =  00542B 
    CAN_P4  =  00542C     |     CAN_P5  =  00542D     |     CAN_P6  =  00542E 
    CAN_P7  =  00542F     |     CAN_P8  =  005430     |     CAN_P9  =  005431 
    CAN_PA  =  005432     |     CAN_PB  =  005433     |     CAN_PC  =  005434 
    CAN_PD  =  005435     |     CAN_PE  =  005436     |     CAN_PF  =  005437 
    CAN_RFR =  005424     |     CAN_TPR =  005423     |     CAN_TSR =  005422 
    CARRY   =  000020     |   6 CAT        000183 R   |   6 CCOMMA     00105D R
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
    CC_Z    =  000001     |     CELLL   =  000002     |   6 CELLM      000671 R
  6 CELLP      000662 R   |   6 CELLS      000680 R   |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   6 CHAR1      000ACB R
  6 CHAR2      000ACE R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
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
    CLK_SWR_=  0000D2     |   6 CMOV1      0007EA R   |   6 CMOV2      000802 R
  6 CMOVE      0007E2 R   |   6 CNTXT      00032E R   |   6 COLD       0014CA R
  6 COLD1      0014CA R   |   6 COLON      0012E6 R   |   6 COMMA      001046 R
  6 COMPI      00108B R   |     COMPO   =  000040     |   6 COUNT      000787 R
  6 CPP        00033C R   |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
  6 CR         000AF9 R   |   6 CREAT      00131E R   |     CRR     =  00000D 
  6 CSTOR      000172 R   |     CTOP    =  000080     |   6 DAT        000770 R
    DATSTK  =  0016F0     |   6 DDROP      000395 R   |   6 DDUP       0003A0 R
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   6 DECIM      000954 R
  6 DEPTH      000717 R   |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  6 DGTQ1      000999 R   |   6 DIG        0008CD R   |   6 DIGIT      000868 R
  6 DIGS       0008DE R   |   6 DIGS1      0008DE R   |   6 DIGS2      0008EB R
  6 DIGTQ      000968 R   |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  6 DN1        00040D R   |   6 DNEGA      0003F2 R   |   6 DOLIT      0000D9 R
  6 DONXT      0000F1 R   |   6 DOSTR      000B0F R   |   6 DOT        000B94 R
  6 DOT1       000BAA R   |   6 DOTI1      00145E R   |   6 DOTID      001448 R
  6 DOTO1      000FA0 R   |   6 DOTOK      000F86 R   |   6 DOTPR      000CBD R
  6 DOTQ       0011E8 R   |   6 DOTQP      000B38 R   |   6 DOTR       000B46 R
  6 DOTS       0013E7 R   |   6 DOTS1      0013F2 R   |   6 DOTS2      0013FE R
  6 DOVAR      0002BF R   |   6 DROP       000208 R   |   6 DSTOR      00075C R
  6 DUMP       00139D R   |   6 DUMP1      0013B4 R   |   6 DUMP3      0013D6 R
  6 DUMPP      00136C R   |   6 DUPP       000212 R   |   6 EDIGS      000909 R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
  6 ELSEE      00114A R   |   6 EMIT       0000C3 R   |   6 EQ1        000451 R
  6 EQUAL      00043B R   |   6 ERASE      000838 R   |     ERR     =  00001B 
  6 EVAL       000FC9 R   |   6 EVAL1      000FC9 R   |   6 EVAL2      000FE5 R
  6 EXE1       0007D9 R   |   6 EXECU      000137 R   |   6 EXIT       000147 R
    EXT     =  000001     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
  6 EXTRC      000890 R   |     FHSE    =  7A1200     |     FHSI    =  F42400 
  6 FILL       000811 R   |   6 FILL1      00081F R   |   6 FILL2      000828 R
  6 FIND       000D67 R   |   6 FIND1      000D85 R   |   6 FIND2      000DB3 R
  6 FIND3      000DBF R   |   6 FIND4      000DD3 R   |   6 FIND5      000DE0 R
  6 FIND6      000DC4 R   |     FLASH_BA=  008000     |     FLASH_CR=  00505A 
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
    FLASH_WS=  00480D     |     FLSI    =  01F400     |   6 FOR        0010D9 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |   6 HERE       00079A R   |   6 HEX        00093F R
  6 HI         00149D R   |   6 HLD        00031B R   |   6 HOLD       0008B4 R
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
    I2C_WRIT=  000000     |   6 IFF        001124 R   |     IMEDD   =  000080 
  6 IMMED      0012FB R   |   6 INCH       0000B7 R   |   6 INN        0002EB R
    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
    INPUT_PU=  000001     |   6 INTE1      000F68 R   |   6 INTER      000F3E R
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
    INT_VECT=  008058     |   6 INVER      0003CF R   |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   6 JSRC       0012D7 R   |   6 KEY        000A7F R
  6 KEY1       000A7F R   |   6 KTAP       000E58 R   |   6 KTAP1      000E7B R
  6 KTAP2      000E7E R   |   6 LAST       00034C R   |   6 LASTN   =  0014C5 R
  6 LBRAC      000F75 R   |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |   6 LESS       000478 R   |     LF      =  00000A 
  6 LINK    =  0014C5 R   |   6 LITER      0010AA R   |   6 LT1        00048E R
    MASKK   =  001F7F     |   6 MAX        000498 R   |   6 MAX1       0004AB R
  6 MIN        0004B5 R   |   6 MIN1       0004C8 R   |   6 MMOD1      000557 R
  6 MMOD2      00056B R   |   6 MMOD3      000582 R   |   6 MMSM1      000512 R
  6 MMSM3      000514 R   |   6 MMSM4      00051C R   |   6 MODD       00059C R
  6 MONE       0006DA R   |     MS      =  000026     |   6 MSEC       000096 R
  6 MSMOD      00053A R   |   6 MSTA1      000639 R   |   6 MSTAR      000616 R
    NAFR    =  004804     |   6 NAMEQ      000E00 R   |   6 NAMET      000D11 R
    NCLKOPT =  004808     |   6 NEGAT      0003E0 R   |   6 NEX1       0000FE R
  6 NEXT       0010E9 R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   6 NTIB       0002FB R
    NUBC    =  004802     |   6 NUFQ       000A8F R   |   6 NUFQ1      000AA8 R
  6 NUMBQ      0009AC R   |   6 NUMQ1      0009E0 R   |   6 NUMQ2      000A11 R
  6 NUMQ3      000A53 R   |   6 NUMQ4      000A58 R   |   6 NUMQ5      000A67 R
  6 NUMQ6      000A6A R   |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  6 NonHandl   000000 R   |   6 ONE        0006CC R   |   6 ONEM       00069A R
  6 ONEP       00068D R   |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   6 ORIG       000036 R   |   6 ORR        000272 R
  6 OUTPUT     0000C8 R   |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |   6 OVER       00023C R
  6 OVERT      0012A4 R   |     PA      =  000000     |   6 PACKS      000847 R
  6 PAD        0007A6 R   |   6 PAREN      000CCC R   |   6 PARS       000BC5 R
  6 PARS1      000BF0 R   |   6 PARS2      000C1B R   |   6 PARS3      000C1E R
  6 PARS4      000C27 R   |   6 PARS5      000C4A R   |   6 PARS6      000C5F R
  6 PARS7      000C6E R   |   6 PARS8      000C7D R   |   6 PARSE      000C8E R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
  6 PDUM1      00137F R   |   6 PDUM2      001390 R   |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]

Symbol Table

    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |   6 PICK       000730 R   |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   6 PLUS       0003B5 R
  6 PNAM1      001259 R   |   6 PRESE      000FF4 R   |     PROD1   =  00001A 
    PROD2   =  00001C     |     PROD3   =  00001E     |   6 PSTOR      000745 R
  6 QBRAN      000110 R   |   6 QDUP       00035C R   |   6 QDUP1      000366 R
  6 QKEY       0000A5 R   |   6 QSTAC      000FAC R   |   6 QUERY      000ED8 R
  6 QUEST      000BB7 R   |   6 QUIT       001011 R   |   6 QUIT1      001019 R
  6 QUIT2      00101C R   |     RAMBASE =  000000     |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   6 RAT        0001C6 R
  6 RBRAC      0012C4 R   |   6 REPEA      00119F R   |   6 RFROM      0001B3 R
    ROP     =  004800     |   6 ROT        00036D R   |     RP0     =  000024 
  6 RPAT       000193 R   |     RPP     =  0017FF     |   6 RPSTO      0001A0 R
    RST_SR  =  0050B3     |   6 SAME1      000D2F R   |   6 SAME2      000D58 R
  6 SAMEQ      000D27 R   |   6 SCOM1      00128E R   |   6 SCOM2      001291 R
  6 SCOMP      001270 R   |   6 SEMIS      0012B4 R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SIGN       0008F3 R   |   6 SIGN1      000903 R
  6 SLASH      0005A6 R   |   6 SLMOD      00058A R   |   6 SNAME      001223 R
    SP0     =  000022     |   6 SPACE      000AB1 R   |   6 SPACS      000AC0 R
  6 SPAT       0001F2 R   |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SPP     =  0016F0     |   6 SPSTO      0001FF R   |   6 SSMOD      000642 R
    STACK   =  0017FF     |   6 STAR       00060B R   |   6 STASL      000654 R
  6 STORE      00014E R   |   6 STR        000921 R   |   6 STRCQ      0010B9 R
  6 STRQ       0011DA R   |   6 STRQP      000B2E R   |   6 SUBB       000413 R
  6 SWAPP      000222 R   |     SWIM_CSR=  007F80     |   6 TAP        000E42 R
  6 TBOOT      0014BE R   |   6 TCHA1      00070E R   |   6 TCHAR      0006EB R
  6 TEMP       0002DC R   |   6 TEVAL      00030C R   |   6 THENN      00113A R
  6 TIB        0007B7 R   |     TIBB    =  001700     |     TIBBASE =  001700 
    TIC     =  000027     |   6 TICK       001028 R   |     TIM1_ARR=  005262 
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
    TIM1_CCM=  000006     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_PSC=  000005     |     TIM4_PSC=  000002     |     TIM4_PSC=  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_PSC=  000003     |     TIM4_PSC=  000000     |     TIM4_PSC=  000001 
    TIM4_PSC=  000002     |     TIM4_SR =  005342     |     TIM4_SR_=  000000 
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |   6 TNAM2      001418 R
  6 TNAM3      001436 R   |   6 TNAM4      00143C R   |   6 TNAME      001415 R
  6 TOKEN      000D03 R   |   6 TOR        0001DB R   |     TRUEE   =  00FFFF 
  6 TWOSL      0006A7 R   |   6 TYPE1      000AE0 R   |   6 TYPE2      000AEC R
  6 TYPES      000ADB R   |   6 Timer4Ha   000005 R   |     UART1   =  000000 
    UART1_BA=  005230     |     UART1_BR=  005232     |     UART1_BR=  005233 
    UART1_CR=  005234     |     UART1_CR=  005235     |     UART1_CR=  005236 
    UART1_CR=  005237     |     UART1_CR=  005238     |     UART1_DR=  005231 
    UART1_GT=  005239     |     UART1_PO=  000000     |     UART1_PS=  00523A 
    UART1_RX=  000004     |     UART1_SR=  005230     |     UART1_TX=  000005 
    UART3   =  000001     |     UART3_BA=  005240     |     UART3_BR=  005242 
    UART3_BR=  005243     |     UART3_CR=  005244     |     UART3_CR=  005245 
    UART3_CR=  005246     |     UART3_CR=  005247     |     UART3_CR=  004249 
    UART3_DR=  005241     |     UART3_PO=  00000F     |     UART3_RX=  000006 
    UART3_SR=  005240     |     UART3_TX=  000005     |     UART_BRR=  000002 
    UART_BRR=  000003     |     UART_CR1=  000004     |     UART_CR1=  000004 
    UART_CR1=  000002     |     UART_CR1=  000000     |     UART_CR1=  000001 
    UART_CR1=  000007     |     UART_CR1=  000006     |     UART_CR1=  000005 
    UART_CR1=  000003     |     UART_CR2=  000005     |     UART_CR2=  000004 
    UART_CR2=  000002     |     UART_CR2=  000005     |     UART_CR2=  000001 
    UART_CR2=  000000     |     UART_CR2=  000006     |     UART_CR2=  000003 
    UART_CR2=  000007     |     UART_CR3=  000006     |     UART_CR3=  000003 
    UART_CR3=  000001     |     UART_CR3=  000002     |     UART_CR3=  000000 
    UART_CR3=  000006     |     UART_CR3=  000004     |     UART_CR3=  000005 
    UART_CR4=  000007     |     UART_CR4=  000000     |     UART_CR4=  000001 
    UART_CR4=  000002     |     UART_CR4=  000003     |     UART_CR4=  000004 
    UART_CR4=  000006     |     UART_CR4=  000005     |     UART_CR5=  000008 
    UART_CR5=  000003     |     UART_CR5=  000001     |     UART_CR5=  000002 
    UART_CR5=  000004     |     UART_CR5=  000005     |     UART_CR6=  000009 
    UART_CR6=  000004     |     UART_CR6=  000007     |     UART_CR6=  000001 
    UART_CR6=  000002     |     UART_CR6=  000000     |     UART_CR6=  000005 
    UART_DR =  000001     |     UART_GTR=  000009     |     UART_PSC=  00000A 
    UART_SR =  000000     |     UART_SR_=  000001     |     UART_SR_=  000004 
    UART_SR_=  000002     |     UART_SR_=  000003     |     UART_SR_=  000000 
    UART_SR_=  000005     |     UART_SR_=  000006     |     UART_SR_=  000007 
    UBC     =  004801     |   6 UDOT       000B81 R   |   6 UDOTR      000B61 R
  6 ULAST      000034 R   |   6 ULES1      000470 R   |   6 ULESS      00045A R
  6 UMMOD      0004F0 R   |   6 UMSTA      0005B5 R   |   6 UNIQ1      00121A R
  6 UNIQU      0011FB R   |   6 UNTIL      001105 R   |   6 UPL1       0002B3 R
  6 UPLUS      00029C R   |     UPP     =  000006     |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |   6 UTYP1      00134F R
  6 UTYP2      00135E R   |   6 UTYPE      00134A R   |   6 UZERO      000020 R
  6 VARIA      001339 R   |     VER     =  000002     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |   6 WHILE      001184 R   |   6 WITHI      0004D5 R
  6 WORDD      000CEF R   |   6 WORDS      001472 R   |   6 WORS1      001478 R
  6 WORS2      001497 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
  6 XORR       000287 R   |     XTEMP   =  00001A     |     YTEMP   =  00001C 
  6 ZERO       0006C1 R   |   6 ZL1        000254 R   |   6 ZLESS      00024B R
  6 clear_ra   000012 R   |   6 clock_in   000051 R   |   6 main       00000F R
  6 uart1_in   00005F R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   14EB   flags    0

