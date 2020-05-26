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
                                     47 ;       2020-04-26 Addapted for NUCLEO-8S208RB by Picatout 
                                     48 ;                  use UART1 instead of UART3 for communication with user.
                                     49 ;                  UART1 is available as ttyACM* device via USB connection.
                                     50 ;                  Use TIMER4 for millisecond interrupt to support MS counter 
                                     51 ;                  and MSEC word that return MS value.
                                     52 ;
                                     53 ;       EF12, Version 2.1, 18apr00cht
                                     54 ;               move to 8000H replacing WHYP.
                                     55 ;               copy interrupt vectors from WHYPFLSH.S19
                                     56 ;               to EF12.S19 before flashing
                                     57 ;               add TICKS1 and DELAY1 for motor stepping
                                     58 ;
                                     59 ;       EF12, 02/18/00, C. H. Ting
                                     60 ;       Adapt 86eForth v2.02 to 68HC12.
                                     61 ;               Use WHYP to seed EF12.ASM
                                     62 ;               Use AS12 native 68HC12 assembler:
                                     63 ;               as12 ef12.asm >ef12.lst
                                     64 ;       EF12A, add ADC code, 02mar00cht
                                     65 ;       EF12B, 01mar00cht
                                     66 ;               stack to 0x78, return stack to 0xf8.
                                     67 ;               add all port definitions
                                     68 ;               add PWM registers
                                     69 ;               add SPI registers and code
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



                                     70 ;       EF12C, 12mar00cht
                                     71 ;               add MAX5250 D/A converter
                                     72 ;       EF12D, 15mar00cht
                                     73 ;               add all the Lexel interface words
                                     74 ;       EF12E, 18apr00cht, save for reference
                                     75 ;
                                     76 ;       Copyright (c) 2000
                                     77 ;       Dr. C. H. Ting
                                     78 ;       156 14th Avenue
                                     79 ;       San Mateo, CA 94402
                                     80 ;       (650) 571-7639
                                     81 ;
                                     82 
                                     83 ;*************************************
                                     84 ; constant used for conditationnal 
                                     85 ; assembly for those word I converted 
                                     86 ; to code.
                                     87 ; Added by Picatout 2020-05-24 
                                     88 ;*************************************
                           000001    89 CONVERT_TO_CODE=1 ; words converted in assembly by Picatout
                           000001    90 PICATOUT_MOD=1  ; code modified by Picatout 
                                     91 
                                     92 ;*********************************************************
                                     93 ;	Assembler constants
                                     94 ;*********************************************************
                           000000    95 RAMBASE =	0x0000	   ;ram base
                           0017FF    96 STACK   =	0x17FF 	;system (return) stack empty 
                           0016F0    97 DATSTK  =	0x16F0	;data stack  empty
                           001700    98 TIBBASE =       0X1700  ; tib addr.
                                     99 ;******  System Variables  ******
                           00001A   100 XTEMP	=	26	;address called by CREATE
                           00001C   101 YTEMP	=	28	;address called by CREATE
                           00001A   102 PROD1 = 26	;space for UM*
                           00001C   103 PROD2 = 28
                           00001E   104 PROD3 = 30
                           000020   105 CARRY = 32
                           000022   106 SP0	=	34	 ;initial data stack pointer
                           000024   107 RP0	=	36	;initial return stack pointer
                           000026   108 MS    =         38      ; millisecond counter 
                                    109 ;***********************************************
                                    110 ;; Version control
                                    111 
                           000002   112 VER     =     2         ;major release version
                           000001   113 EXT     =     1         ;minor extension
                                    114 
                                    115 ;; Constants
                                    116 
                           00FFFF   117 TRUEE   =     0xFFFF      ;true flag
                                    118 
                           000040   119 COMPO   =     0x40     ;lexicon compile only bit
                           000080   120 IMEDD   =     0x80     ;lexicon immediate bit
                           001F7F   121 MASKK   =     0x1F7F  ;lexicon bit mask
                                    122 
                           000002   123 CELLL   =     2       ;size of a cell
                           00000A   124 BASEE   =     10      ;default radix
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                           000008   125 BKSPP   =     8       ;back space
                           00000A   126 LF      =     10      ;line feed
                           00000D   127 CRR     =     13      ;carriage return
                           00001B   128 ERR     =     27      ;error escape
                           000027   129 TIC     =     39      ;tick
                           0000CD   130 CALLL   =     0xCD     ;CALL opcodes
                                    131 
                                    132 ;; Memory allocation
                                    133 
                           000006   134 UPP     =     RAMBASE+6
                           0016F0   135 SPP     =     RAMBASE+DATSTK
                           0017FF   136 RPP     =     RAMBASE+STACK
                           001700   137 TIBB    =     RAMBASE+TIBBASE
                           000080   138 CTOP    =     RAMBASE+0x80
                                    139 
                                    140         .macro _ledon
                                    141         bset PC_ODR,#LED2_BIT
                                    142         .endm
                                    143 
                                    144         .macro _ledoff
                                    145         bres PC_ODR,#LED2_BIT
                                    146         .endm
                                    147 
                                    148 ;**********************************************************
                                    149         .area DATA (ABS)
      000000                        150         .org RAMBASE 
                                    151 ;**********************************************************
                                    152 
                                    153 ;**********************************************************
                                    154         .area SSEG (ABS) ; STACK
      001700                        155         .org 0x1700
      001700                        156         .ds 256 
                                    157 ; space for DATSTK,TIB and STACK         
                                    158 ;**********************************************************
                                    159 
                                    160 ;**********************************************************
                                    161         .area HOME ; vectors table
                                    162 ;**********************************************************
      008000 82 00 80 8F            163 	int main	        ; reset
      008004 82 00 80 80            164 	int NonHandledInterrupt	; trap
      008008 82 00 80 80            165 	int NonHandledInterrupt	; irq0
      00800C 82 00 80 80            166 	int NonHandledInterrupt	; irq1
      008010 82 00 80 80            167 	int NonHandledInterrupt	; irq2
      008014 82 00 80 80            168 	int NonHandledInterrupt	; irq3
      008018 82 00 80 80            169 	int NonHandledInterrupt	; irq4
      00801C 82 00 80 80            170 	int NonHandledInterrupt	; irq5
      008020 82 00 80 80            171 	int NonHandledInterrupt	; irq6
      008024 82 00 80 80            172 	int NonHandledInterrupt	; irq7
      008028 82 00 80 80            173 	int NonHandledInterrupt	; irq8
      00802C 82 00 80 80            174 	int NonHandledInterrupt	; irq9
      008030 82 00 80 80            175 	int NonHandledInterrupt	; irq10
      008034 82 00 80 80            176 	int NonHandledInterrupt	; irq11
      008038 82 00 80 80            177 	int NonHandledInterrupt	; irq12
      00803C 82 00 80 80            178 	int NonHandledInterrupt	; irq13
      008040 82 00 80 80            179 	int NonHandledInterrupt	; irq14
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      008044 82 00 80 80            180 	int NonHandledInterrupt	; irq15
      008048 82 00 80 80            181 	int NonHandledInterrupt	; irq16
      00804C 82 00 80 80            182 	int NonHandledInterrupt	; irq17
      008050 82 00 80 80            183 	int NonHandledInterrupt	; irq18
      008054 82 00 80 80            184 	int NonHandledInterrupt	; irq19
      008058 82 00 80 80            185 	int NonHandledInterrupt	; irq20
      00805C 82 00 80 80            186 	int NonHandledInterrupt	; irq21
      008060 82 00 80 80            187 	int NonHandledInterrupt	; irq22
      008064 82 00 80 85            188 	int Timer4Handler	; irq23
      008068 82 00 80 80            189 	int NonHandledInterrupt	; irq24
      00806C 82 00 80 80            190 	int NonHandledInterrupt	; irq25
      008070 82 00 80 80            191 	int NonHandledInterrupt	; irq26
      008074 82 00 80 80            192 	int NonHandledInterrupt	; irq27
      008078 82 00 80 80            193 	int NonHandledInterrupt	; irq28
      00807C 82 00 80 80            194 	int NonHandledInterrupt	; irq29
                                    195 
                                    196 ;**********************************************************
                                    197         .area CODE
                                    198 ;**********************************************************
                                    199 
                                    200 ; non handled interrupt reset MCU
      008080                        201 NonHandledInterrupt:
      008080 A6 80            [ 1]  202         ld a, #0x80
      008082 C7 50 D1         [ 1]  203         ld WWDG_CR,a ; WWDG_CR used to reset mcu
                                    204 	;iret
                                    205 
                                    206 ; used for milliseconds counter 
                                    207 ; MS is 16 bits counter 
      008085                        208 Timer4Handler:
      008085 72 5F 53 42      [ 1]  209 	clr TIM4_SR 
      008089 BE 26            [ 2]  210         ldw x,MS 
      00808B 5C               [ 2]  211         incw x 
      00808C BF 26            [ 2]  212         ldw MS,x 
      00808E 80               [11]  213         iret 
                                    214 
                                    215 
                                    216 ;; Main entry points and COLD start data
      00808F                        217 main:
                                    218 ; clear all RAM
      00808F AE 00 00         [ 2]  219 	ldw X,#RAMBASE
      008092                        220 clear_ram0:
      008092 7F               [ 1]  221 	clr (X)
      008093 5C               [ 2]  222 	incw X
      008094 A3 17 FF         [ 2]  223 	cpw X,#RAM_END
      008097 23 F9            [ 2]  224 	jrule clear_ram0
      008099 AE 17 FF         [ 2]  225         ldw x,#RPP
      00809C 94               [ 1]  226         ldw sp,x 
      00809D CC 80 B6         [ 2]  227 	jp ORIG
                                    228 
                                    229 ; COLD initialize these variables.
      0080A0                        230 UZERO:
      0080A0 00 0A                  231         .word      BASEE   ;BASE
      0080A2 00 00                  232         .word      0       ;tmp
      0080A4 00 00                  233         .word      0       ;>IN
      0080A6 00 00                  234         .word      0       ;#TIB
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      0080A8 17 00                  235         .word      TIBB    ;TIB
      0080AA 8F ED                  236         .word      INTER   ;'EVAL
      0080AC 00 00                  237         .word      0       ;HLD
      0080AE 96 3B                  238         .word       LASTN   ;CONTEXT pointer
      0080B0 00 80                  239         .word       CTOP   ;CP in RAM
      0080B2 96 3B                  240         .word      LASTN   ;LAST
      0080B4 00 00                  241 ULAST:  .word      0
                                    242 
      0080B6                        243 ORIG:   
                                    244 ; initialize SP
      0080B6 AE 17 FF         [ 2]  245         LDW     X,#STACK  ;initialize return stack
      0080B9 94               [ 1]  246         LDW     SP,X
      0080BA BF 24            [ 2]  247         LDW     RP0,X
      0080BC AE 16 F0         [ 2]  248         LDW     X,#DATSTK ;initialize data stack
      0080BF BF 22            [ 2]  249         LDW     SP0,X
                                    250 ; initialize PC_5 as output to control LED2
                                    251 ; added by Picatout 
      0080C1 72 1A 50 0D      [ 1]  252         bset PC_CR1,#LED2_BIT
      0080C5 72 1A 50 0E      [ 1]  253         bset PC_CR2,#LED2_BIT
      0080C9 72 1A 50 0C      [ 1]  254         bset PC_DDR,#LED2_BIT
      00004D                        255         _ledoff
      0080CD 72 1B 50 0A      [ 1]    1         bres PC_ODR,#LED2_BIT
                                    256 ; initialize clock to HSI
                                    257 ; no divisor 16Mhz 
                                    258 ; Added by Picatout 
      0080D1                        259 clock_init:
      0080D1 72 5F 50 C6      [ 1]  260         clr CLK_CKDIVR
      0080D5 72 12 50 C5      [ 1]  261 	bset CLK_SWCR,#CLK_SWCR_SWEN
      0080D9 A6 E1            [ 1]  262 	ld a,#CLK_SWR_HSI
      0080DB C7 50 C4         [ 1]  263 	ld CLK_SWR,a
      0080DE C1 50 C3         [ 1]  264 1$:	cp a,CLK_CMSR
      0080E1 26 FB            [ 1]  265 	jrne 1$
                                    266         
                                    267 ; initialize UART1, 115200 8N1
      0080E3                        268 uart1_init:
      0080E3 72 14 50 C7      [ 1]  269 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1
                                    270 	; configure tx pin
      0080E7 72 1A 50 02      [ 1]  271 	bset PA_DDR,#UART1_TX_PIN ; tx pin
      0080EB 72 1A 50 03      [ 1]  272 	bset PA_CR1,#UART1_TX_PIN ; push-pull output
      0080EF 72 1A 50 04      [ 1]  273 	bset PA_CR2,#UART1_TX_PIN ; fast output
                                    274 	; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
      0080F3 35 0B 52 33      [ 1]  275 	mov UART1_BRR2,#0x0b ; must be loaded first
      0080F7 35 08 52 32      [ 1]  276 	mov UART1_BRR1,#0x8
      0080FB 35 0C 52 35      [ 1]  277 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                                    278 ; initialize timer4, used for millisecond interrupt  
      0080FF 35 07 53 45      [ 1]  279 	mov TIM4_PSCR,#7 ; prescale 128  
      008103 35 7D 53 46      [ 1]  280 	mov TIM4_ARR,#125 ; set for 1msec.
      008107 35 05 53 40      [ 1]  281 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00810B 72 10 53 41      [ 1]  282 	bset TIM4_IER,#TIM4_IER_UIE 
      00810F 9A               [ 1]  283         rim
      008110 CC 95 79         [ 2]  284         jp  COLD   ;default=MN1
                                    285 
                                    286 
                                    287 ;; get millisecond counter 
                                    288 ;; msec ( -- u )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    289 ;; Added by Picatout 2020-04-26
      008113 00 00                  290         .word 0 
                           000095   291 LINK = . 
      008115 04                     292         .byte 4
      008116 4D 53 45 43            293         .ascii "MSEC"
      00811A                        294 MSEC: 
      00811A 1D 00 02         [ 2]  295         subw x,#CELLL 
      00811D 90 BE 26         [ 2]  296         ldw y,MS 
      008120 FF               [ 2]  297         ldw (x),y 
      008121 81               [ 4]  298         ret 
                                    299 
                                    300 ;; Device dependent I/O
                                    301 ;       ?RX     ( -- c T | F )
                                    302 ;         Return input byte and true, or false.
      008122 81 15                  303         .word      LINK 
                           0000A4   304 LINK	= .
      008124 04                     305         .byte      4
      008125 3F 4B 45 59            306         .ascii     "?KEY"
      008129                        307 QKEY:
      008129 90 5F            [ 1]  308         CLRW Y 
      00812B 72 0B 52 30 0B   [ 2]  309         BTJF UART1_SR,#UART_SR_RXNE,INCH   ;check status
      008130 C6 52 31         [ 1]  310         LD    A,UART1_DR   ;get char in A
      008133 1D 00 02         [ 2]  311 	SUBW	X,#2
      008136 E7 01            [ 1]  312         LD     (1,X),A
      008138 7F               [ 1]  313 	CLR	(X)
      008139 90 53            [ 2]  314         CPLW     Y
      00813B                        315 INCH:
      00813B 1D 00 02         [ 2]  316 	SUBW	X,#2
      00813E FF               [ 2]  317         LDW     (X),Y
      00813F 81               [ 4]  318         RET
                                    319 
                                    320 ;       TX!     ( c -- )
                                    321 ;       Send character c to  output device.
      008140 81 24                  322         .word      LINK
                           0000C2   323 LINK	= .
      008142 04                     324         .byte      4
      008143 45 4D 49 54            325         .ascii     "EMIT"
      008147                        326 EMIT:
      008147 E6 01            [ 1]  327         LD     A,(1,X)
      008149 1C 00 02         [ 2]  328 	ADDW	X,#2
      00814C 72 0F 52 30 FB   [ 2]  329 OUTPUT: BTJF UART1_SR,#UART_SR_TXE,OUTPUT  ;loop until tdre
      008151 C7 52 31         [ 1]  330         LD    UART1_DR,A   ;send A
      008154 81               [ 4]  331         RET
                                    332 
                                    333 ;; The kernel
                                    334 
                                    335 ;       doLIT   ( -- w )
                                    336 ;       Push an inline literal.
      008155 81 42                  337         .word      LINK
                           0000D7   338 LINK	= 	.
      008157 45                     339 	.byte      COMPO+5
      008158 44 4F 4C 49 54         340         .ascii     "DOLIT"
      00815D                        341 DOLIT:
      00815D 1D 00 02         [ 2]  342 	SUBW X,#2
                           000001   343 .if PICATOUT_MOD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      008160 16 01            [ 2]  344         ldw y,(1,sp)
      008162 90 FE            [ 2]  345         ldw y,(y)
      008164 FF               [ 2]  346         ldw (x),y
      008165 90 85            [ 2]  347         popw y 
                           000000   348 .else 
                                    349         POPW Y
                                    350 	LDW YTEMP,Y
                                    351 	LDW Y,(Y)
                                    352         LDW (X),Y
                                    353         LDW Y,YTEMP
                                    354 .endif 
      008167 90 EC 02         [ 2]  355 	JP (2,Y)
                                    356 
                                    357 ;       next    ( -- )
                                    358 ;       Code for  single index loop.
      00816A 81 57                  359         .word      LINK
                           0000EC   360 LINK	= 	.
      00816C 44                     361 	.byte      COMPO+4
      00816D 4E 45 58 54            362         .ascii     "NEXT"
      008171                        363 DONXT:
      008171 16 03            [ 2]  364 	LDW Y,(3,SP)
      008173 90 5A            [ 2]  365 	DECW Y
      008175 2A 07            [ 1]  366 	JRPL NEX1
      008177 90 85            [ 2]  367 	POPW Y
                           000001   368 .if PICATOUT_MOD
      008179 5B 02            [ 2]  369         addw sp,#2
                           000000   370 .else        
                                    371 	POP A
                                    372 	POP A
                                    373 .endif         
      00817B 90 EC 02         [ 2]  374         JP (2,Y)
      00817E                        375 NEX1:
      00817E 17 03            [ 2]  376         LDW (3,SP),Y
      008180 90 85            [ 2]  377         POPW Y
      008182 90 FE            [ 2]  378 	LDW Y,(Y)
      008184 90 FC            [ 2]  379 	JP (Y)
                                    380 
                                    381 ;       ?branch ( f -- )
                                    382 ;       Branch if flag is zero.
      008186 81 6C                  383         .word      LINK
                           000108   384 LINK	= 	.
      008188 47                     385 	.byte      COMPO+7
      008189 3F 42 52 41 4E 43 48   386         .ascii     "?BRANCH"
      008190                        387 QBRAN:	
      008190 90 93            [ 1]  388         LDW Y,X
      008192 1C 00 02         [ 2]  389 	ADDW X,#2
      008195 90 FE            [ 2]  390 	LDW Y,(Y)
      008197 27 0E            [ 1]  391         JREQ     BRAN
      008199 90 85            [ 2]  392 	POPW Y
      00819B 90 EC 02         [ 2]  393 	JP (2,Y)
                                    394         
                                    395 ;       branch  ( -- )
                                    396 ;       Branch to an inline address.
      00819E 81 88                  397         .word      LINK
                           000120   398 LINK	= 	.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      0081A0 46                     399 	.byte      COMPO+6
      0081A1 42 52 41 4E 43 48      400         .ascii     "BRANCH"
      0081A7                        401 BRAN:
      0081A7 90 85            [ 2]  402         POPW Y
      0081A9 90 FE            [ 2]  403 	LDW Y,(Y)
      0081AB 90 FC            [ 2]  404         JP     (Y)
                                    405 
                                    406 ;       EXECUTE ( ca -- )
                                    407 ;       Execute  word at ca.
      0081AD 81 A0                  408         .word      LINK
                           00012F   409 LINK	= 	.
      0081AF 07                     410         .byte       7
      0081B0 45 58 45 43 55 54 45   411         .ascii     "EXECUTE"
      0081B7                        412 EXECU:
      0081B7 90 93            [ 1]  413         LDW Y,X
      0081B9 1C 00 02         [ 2]  414 	ADDW X,#2
      0081BC 90 FE            [ 2]  415 	LDW  Y,(Y)
      0081BE 90 FC            [ 2]  416         JP   (Y)
                                    417 
                                    418 ;       EXIT    ( -- )
                                    419 ;       Terminate a colon definition.
      0081C0 81 AF                  420         .word      LINK
                           000142   421 LINK = .
      0081C2 04                     422         .byte      4
      0081C3 45 58 49 54            423         .ascii     "EXIT"
      0081C7                        424 EXIT:
      0081C7 90 85            [ 2]  425         POPW Y
      0081C9 81               [ 4]  426         RET
                                    427 
                                    428 ;       !       ( w a -- )
                                    429 ;       Pop  data stack to memory.
      0081CA 81 C2                  430         .word      LINK
                           00014C   431 LINK = .
      0081CC 01                     432         .byte      1
      0081CD 21                     433         .ascii     "!"
      0081CE                        434 STORE:
      0081CE 90 93            [ 1]  435         LDW Y,X
      0081D0 90 FE            [ 2]  436         LDW Y,(Y)    ;Y=a
      0081D2 90 BF 1C         [ 2]  437         LDW YTEMP,Y
      0081D5 90 93            [ 1]  438         LDW Y,X
      0081D7 90 EE 02         [ 2]  439         LDW Y,(2,Y)
      0081DA 91 CF 1C         [ 5]  440         LDW [YTEMP],Y ;store w at a
      0081DD 1C 00 04         [ 2]  441         ADDW X,#4 ; DDROP 
      0081E0 81               [ 4]  442         RET     
                                    443 
                                    444 ;       @       ( a -- w )
                                    445 ;       Push memory location to stack.
      0081E1 81 CC                  446         .word      LINK
                           000163   447 LINK	= 	.
      0081E3 01                     448         .byte    1
      0081E4 40                     449         .ascii	"@"
      0081E5                        450 AT:
      0081E5 90 93            [ 1]  451         LDW Y,X     ;Y = a
      0081E7 90 FE            [ 2]  452         LDW Y,(Y)   ; address 
      0081E9 90 FE            [ 2]  453         LDW Y,(Y)   ; value 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      0081EB FF               [ 2]  454         LDW (X),Y ;w = @Y
      0081EC 81               [ 4]  455         RET     
                                    456 
                                    457 ;       C!      ( c b -- )
                                    458 ;       Pop  data stack to byte memory.
      0081ED 81 E3                  459         .word      LINK
                           00016F   460 LINK	= .
      0081EF 02                     461         .byte      2
      0081F0 43 21                  462         .ascii     "C!"
      0081F2                        463 CSTOR:
      0081F2 90 93            [ 1]  464         LDW Y,X
      0081F4 90 FE            [ 2]  465 	LDW Y,(Y)    ;Y=b
      0081F6 E6 03            [ 1]  466         LD A,(3,X)    ;D = c
      0081F8 90 F7            [ 1]  467         LD  (Y),A     ;store c at b
      0081FA 1C 00 04         [ 2]  468 	ADDW X,#4 ; DDROP 
      0081FD 81               [ 4]  469         RET     
                                    470 
                                    471 ;       C@      ( b -- c )
                                    472 ;       Push byte in memory to  stack.
      0081FE 81 EF                  473         .word      LINK
                           000180   474 LINK	= 	.
      008200 02                     475         .byte      2
      008201 43 40                  476         .ascii     "C@"
      008203                        477 CAT:
      008203 90 93            [ 1]  478         LDW Y,X     ;Y=b
      008205 90 FE            [ 2]  479         LDW Y,(Y)
      008207 90 F6            [ 1]  480         LD A,(Y)
      008209 E7 01            [ 1]  481         LD (1,X),A
      00820B 7F               [ 1]  482         CLR (X)
      00820C 81               [ 4]  483         RET     
                                    484 
                                    485 ;       RP@     ( -- a )
                                    486 ;       Push current RP to data stack.
      00820D 82 00                  487         .word      LINK
                           00018F   488 LINK	= .
      00820F 03                     489         .byte      3
      008210 52 50 40               490         .ascii     "RP@"
      008213                        491 RPAT:
      008213 90 96            [ 1]  492         LDW Y,SP    ;save return addr
      008215 1D 00 02         [ 2]  493         SUBW X,#2
      008218 FF               [ 2]  494         LDW (X),Y
      008219 81               [ 4]  495         RET     
                                    496 
                                    497 ;       RP!     ( a -- )
                                    498 ;       Set  return stack pointer.
      00821A 82 0F                  499         .word      LINK
                           00019C   500 LINK	= 	. 
      00821C 43                     501 	.byte      COMPO+3
      00821D 52 50 21               502         .ascii     "RP!"
      008220                        503 RPSTO:
      008220 90 85            [ 2]  504         POPW Y
      008222 90 BF 1C         [ 2]  505         LDW YTEMP,Y
      008225 90 93            [ 1]  506         LDW Y,X
      008227 90 FE            [ 2]  507         LDW Y,(Y)
      008229 90 94            [ 1]  508         LDW SP,Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      00822B 1C 00 02         [ 2]  509         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      00822E 92 CC 1C         [ 5]  510         JP [YTEMP]
                                    511 
                                    512 ;       R>      ( -- w )
                                    513 ;       Pop return stack to data stack.
      008231 82 1C                  514         .word      LINK
                           0001B3   515 LINK	= 	. 
      008233 42                     516 	.byte      COMPO+2
      008234 52 3E                  517         .ascii     "R>"
      008236                        518 RFROM:
      008236 90 85            [ 2]  519         POPW Y    ;save return addr
      008238 90 BF 1C         [ 2]  520         LDW YTEMP,Y
      00823B 90 85            [ 2]  521         POPW Y
      00823D 1D 00 02         [ 2]  522         SUBW X,#2
      008240 FF               [ 2]  523         LDW (X),Y
      008241 92 CC 1C         [ 5]  524         JP [YTEMP]
                                    525 
                                    526 ;       R@      ( -- w )
                                    527 ;       Copy top of return stack to stack.
      008244 82 33                  528         .word      LINK
                           0001C6   529 LINK	= 	. 
      008246 02                     530         .byte      2
      008247 52 40                  531         .ascii     "R@"
      008249                        532 RAT:
                           000001   533 .if PICATOUT_MOD
      008249 16 03            [ 2]  534         ldw y,(3,sp)
      00824B 1D 00 02         [ 2]  535         subw x,#CELLL 
      00824E FF               [ 2]  536         ldw (x),y 
      00824F 81               [ 4]  537         ret 
                           000000   538 .else 
                                    539         POPW Y
                                    540         LDW YTEMP,Y
                                    541         POPW Y
                                    542         PUSHW Y
                                    543         SUBW X,#2
                                    544         LDW (X),Y
                                    545         JP [YTEMP]
                                    546 .endif         
                                    547 
                                    548 ;       >R      ( w -- )
                                    549 ;       Push data stack to return stack.
      008250 82 46                  550         .word      LINK
                           0001D2   551 LINK	= 	. 
      008252 42                     552 	.byte      COMPO+2
      008253 3E 52                  553         .ascii     ">R"
      008255                        554 TOR:
      008255 90 85            [ 2]  555         POPW Y    ;save return addr
      008257 90 BF 1C         [ 2]  556         LDW YTEMP,Y
      00825A 90 93            [ 1]  557         LDW Y,X
      00825C 90 FE            [ 2]  558         LDW Y,(Y)
      00825E 90 89            [ 2]  559         PUSHW Y    ;restore return addr
      008260 1C 00 02         [ 2]  560         ADDW X,#2
      008263 92 CC 1C         [ 5]  561         JP [YTEMP]
                                    562 
                                    563 ;       SP@     ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    564 ;       Push current stack pointer.
      008266 82 52                  565         .word      LINK
                           0001E8   566 LINK	= 	. 
      008268 03                     567         .byte      3
      008269 53 50 40               568         .ascii     "SP@"
      00826C                        569 SPAT:
      00826C 90 93            [ 1]  570 	LDW Y,X
      00826E 1D 00 02         [ 2]  571         SUBW X,#2
      008271 FF               [ 2]  572 	LDW (X),Y
      008272 81               [ 4]  573         RET     
                                    574 
                                    575 ;       SP!     ( a -- )
                                    576 ;       Set  data stack pointer.
      008273 82 68                  577         .word      LINK
                           0001F5   578 LINK	= 	. 
      008275 03                     579         .byte      3
      008276 53 50 21               580         .ascii     "SP!"
      008279                        581 SPSTO:
      008279 FE               [ 2]  582         LDW     X,(X)     ;X = a
      00827A 81               [ 4]  583         RET     
                                    584 
                                    585 ;       DROP    ( w -- )
                                    586 ;       Discard top stack item.
      00827B 82 75                  587         .word      LINK
                           0001FD   588 LINK	= 	. 
      00827D 04                     589         .byte      4
      00827E 44 52 4F 50            590         .ascii     "DROP"
      008282                        591 DROP:
      008282 1C 00 02         [ 2]  592         ADDW X,#2     
      008285 81               [ 4]  593         RET     
                                    594 
                                    595 ;       DUP     ( w -- w w )
                                    596 ;       Duplicate  top stack item.
      008286 82 7D                  597         .word      LINK
                           000208   598 LINK	= 	. 
      008288 03                     599         .byte      3
      008289 44 55 50               600         .ascii     "DUP"
      00828C                        601 DUPP:
      00828C 90 93            [ 1]  602 	LDW Y,X
      00828E 1D 00 02         [ 2]  603         SUBW X,#2
      008291 90 FE            [ 2]  604 	LDW Y,(Y)
      008293 FF               [ 2]  605 	LDW (X),Y
      008294 81               [ 4]  606         RET     
                                    607 
                                    608 ;       SWAP    ( w1 w2 -- w2 w1 )
                                    609 ;       Exchange top two stack items.
      008295 82 88                  610         .word      LINK
                           000217   611 LINK	= 	. 
      008297 04                     612         .byte      4
      008298 53 57 41 50            613         .ascii     "SWAP"
      00829C                        614 SWAPP:
      00829C 90 93            [ 1]  615         LDW Y,X
      00829E 90 FE            [ 2]  616         LDW Y,(Y)
      0082A0 90 BF 1C         [ 2]  617         LDW YTEMP,Y
      0082A3 90 93            [ 1]  618         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      0082A5 90 EE 02         [ 2]  619         LDW Y,(2,Y)
      0082A8 FF               [ 2]  620         LDW (X),Y
      0082A9 90 BE 1C         [ 2]  621         LDW Y,YTEMP
      0082AC EF 02            [ 2]  622         LDW (2,X),Y
      0082AE 81               [ 4]  623         RET     
                                    624 
                                    625 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                    626 ;       Copy second stack item to top.
      0082AF 82 97                  627         .word      LINK
                           000231   628 LINK	= . 
      0082B1 04                     629         .byte      4
      0082B2 4F 56 45 52            630         .ascii     "OVER"
      0082B6                        631 OVER:
      0082B6 1D 00 02         [ 2]  632         SUBW X,#2
      0082B9 90 93            [ 1]  633         LDW Y,X
      0082BB 90 EE 04         [ 2]  634         LDW Y,(4,Y)
      0082BE FF               [ 2]  635         LDW (X),Y
      0082BF 81               [ 4]  636         RET     
                                    637 
                                    638 ;       0<      ( n -- t )
                                    639 ;       Return true if n is negative.
      0082C0 82 B1                  640         .word      LINK
                           000242   641 LINK	= . 
      0082C2 02                     642         .byte      2
      0082C3 30 3C                  643         .ascii     "0<"
      0082C5                        644 ZLESS:
      0082C5 A6 FF            [ 1]  645         LD A,#0xFF
      0082C7 90 93            [ 1]  646         LDW Y,X
      0082C9 90 FE            [ 2]  647         LDW Y,(Y)
      0082CB 2B 01            [ 1]  648         JRMI     ZL1
      0082CD 4F               [ 1]  649         CLR A   ;false
      0082CE F7               [ 1]  650 ZL1:    LD     (X),A
      0082CF E7 01            [ 1]  651         LD (1,X),A
      0082D1 81               [ 4]  652 	RET     
                                    653 
                                    654 ;       AND     ( w w -- w )
                                    655 ;       Bitwise AND.
      0082D2 82 C2                  656         .word      LINK
                           000254   657 LINK	= . 
      0082D4 03                     658         .byte      3
      0082D5 41 4E 44               659         .ascii     "AND"
      0082D8                        660 ANDD:
      0082D8 F6               [ 1]  661         LD  A,(X)    ;D=w
      0082D9 E4 02            [ 1]  662         AND A,(2,X)
      0082DB E7 02            [ 1]  663         LD (2,X),A
      0082DD E6 01            [ 1]  664         LD A,(1,X)
      0082DF E4 03            [ 1]  665         AND A,(3,X)
      0082E1 E7 03            [ 1]  666         LD (3,X),A
      0082E3 1C 00 02         [ 2]  667         ADDW X,#2
      0082E6 81               [ 4]  668         RET
                                    669 
                                    670 ;       OR      ( w w -- w )
                                    671 ;       Bitwise inclusive OR.
      0082E7 82 D4                  672         .word      LINK
                           000269   673 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      0082E9 02                     674         .byte      2
      0082EA 4F 52                  675         .ascii     "OR"
      0082EC                        676 ORR:
      0082EC F6               [ 1]  677         LD A,(X)    ;D=w
      0082ED EA 02            [ 1]  678         OR A,(2,X)
      0082EF E7 02            [ 1]  679         LD (2,X),A
      0082F1 E6 01            [ 1]  680         LD A,(1,X)
      0082F3 EA 03            [ 1]  681         OR A,(3,X)
      0082F5 E7 03            [ 1]  682         LD (3,X),A
      0082F7 1C 00 02         [ 2]  683         ADDW X,#2
      0082FA 81               [ 4]  684         RET
                                    685 
                                    686 ;       XOR     ( w w -- w )
                                    687 ;       Bitwise exclusive OR.
      0082FB 82 E9                  688         .word      LINK
                           00027D   689 LINK	= . 
      0082FD 03                     690         .byte      3
      0082FE 58 4F 52               691         .ascii     "XOR"
      008301                        692 XORR:
      008301 F6               [ 1]  693         LD A,(X)    ;D=w
      008302 E8 02            [ 1]  694         XOR A,(2,X)
      008304 E7 02            [ 1]  695         LD (2,X),A
      008306 E6 01            [ 1]  696         LD A,(1,X)
      008308 E8 03            [ 1]  697         XOR A,(3,X)
      00830A E7 03            [ 1]  698         LD (3,X),A
      00830C 1C 00 02         [ 2]  699         ADDW X,#2
      00830F 81               [ 4]  700         RET
                                    701 
                                    702 ;       UM+     ( u u -- udsum )
                                    703 ;       Add two unsigned single
                                    704 ;       and return a double sum.
      008310 82 FD                  705         .word      LINK
                           000292   706 LINK	= . 
      008312 03                     707         .byte      3
      008313 55 4D 2B               708         .ascii     "UM+"
      008316                        709 UPLUS:
      008316 A6 01            [ 1]  710         LD A,#1
      008318 90 93            [ 1]  711         LDW Y,X
      00831A 90 EE 02         [ 2]  712         LDW Y,(2,Y)
      00831D 90 BF 1C         [ 2]  713         LDW YTEMP,Y
      008320 90 93            [ 1]  714         LDW Y,X
      008322 90 FE            [ 2]  715         LDW Y,(Y)
      008324 72 B9 00 1C      [ 2]  716         ADDW Y,YTEMP
      008328 EF 02            [ 2]  717         LDW (2,X),Y
      00832A 25 01            [ 1]  718         JRC     UPL1
      00832C 4F               [ 1]  719         CLR A
      00832D E7 01            [ 1]  720 UPL1:   LD     (1,X),A
      00832F 7F               [ 1]  721         CLR (X)
      008330 81               [ 4]  722         RET
                                    723 
                                    724 ;; System and user variables
                                    725 
                                    726 ;       doVAR   ( -- a )
                                    727 ;       Code for VARIABLE and CREATE.
      008331 83 12                  728         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



                           0002B3   729 LINK	= . 
      008333 45                     730 	.byte      COMPO+5
      008334 44 4F 56 41 52         731         .ascii     "DOVAR"
      008339                        732 DOVAR:
      008339 1D 00 02         [ 2]  733 	SUBW X,#2
      00833C 90 85            [ 2]  734         POPW Y    ;get return addr (pfa)
      00833E FF               [ 2]  735         LDW (X),Y    ;push on stack
      00833F 81               [ 4]  736         RET     ;go to RET of EXEC
                                    737 
                                    738 ;       BASE    ( -- a )
                                    739 ;       Radix base for numeric I/O.
      008340 83 33                  740         .word      LINK        
                           0002C2   741 LINK = . 
      008342 04                     742         .byte      4
      008343 42 41 53 45            743         .ascii     "BASE"
      008347                        744 BASE:
      008347 90 AE 00 06      [ 2]  745 	LDW Y,#RAMBASE+6
      00834B 1D 00 02         [ 2]  746 	SUBW X,#2
      00834E FF               [ 2]  747         LDW (X),Y
      00834F 81               [ 4]  748         RET
                                    749 
                                    750 ;       tmp     ( -- a )
                                    751 ;       A temporary storage.
      008350 83 42                  752         .word      LINK
                                    753         
                           0002D2   754 LINK = . 
      008352 03                     755 	.byte      3
      008353 54 4D 50               756         .ascii     "TMP"
      008356                        757 TEMP:
      008356 90 AE 00 08      [ 2]  758 	LDW Y,#RAMBASE+8
      00835A 1D 00 02         [ 2]  759 	SUBW X,#2
      00835D FF               [ 2]  760         LDW (X),Y
      00835E 81               [ 4]  761         RET
                                    762 
                                    763 ;       >IN     ( -- a )
                                    764 ;        Hold parsing pointer.
      00835F 83 52                  765         .word      LINK
                           0002E1   766 LINK = . 
      008361 03                     767         .byte      3
      008362 3E 49 4E               768         .ascii    ">IN"
      008365                        769 INN:
      008365 90 AE 00 0A      [ 2]  770 	LDW Y,#RAMBASE+10
      008369 1D 00 02         [ 2]  771 	SUBW X,#2
      00836C FF               [ 2]  772         LDW (X),Y
      00836D 81               [ 4]  773         RET
                                    774 
                                    775 ;       #TIB    ( -- a )
                                    776 ;       Count in terminal input buffer.
      00836E 83 61                  777         .word      LINK
                           0002F0   778 LINK = . 
      008370 04                     779         .byte      4
      008371 23 54 49 42            780         .ascii     "#TIB"
      008375                        781 NTIB:
      008375 90 AE 00 0C      [ 2]  782 	LDW Y,#RAMBASE+12
      008379 1D 00 02         [ 2]  783 	SUBW X,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      00837C FF               [ 2]  784         LDW (X),Y
      00837D 81               [ 4]  785         RET
                                    786 
                                    787 ;       "EVAL   ( -- a )
                                    788 ;       Execution vector of EVAL.
      00837E 83 70                  789         .word      LINK
                           000300   790 LINK = . 
      008380 05                     791         .byte      5
      008381 27 45 56 41 4C         792         .ascii     "'EVAL"
      008386                        793 TEVAL:
      008386 90 AE 00 10      [ 2]  794 	LDW Y,#RAMBASE+16
      00838A 1D 00 02         [ 2]  795 	SUBW X,#2
      00838D FF               [ 2]  796         LDW (X),Y
      00838E 81               [ 4]  797         RET
                                    798 
                                    799 ;       HLD     ( -- a )
                                    800 ;       Hold a pointer of output string.
      00838F 83 80                  801         .word      LINK
                           000311   802 LINK = . 
      008391 03                     803         .byte      3
      008392 48 4C 44               804         .ascii     "HLD"
      008395                        805 HLD:
      008395 90 AE 00 12      [ 2]  806 	LDW Y,#RAMBASE+18
      008399 1D 00 02         [ 2]  807 	SUBW X,#2
      00839C FF               [ 2]  808         LDW (X),Y
      00839D 81               [ 4]  809         RET
                                    810 
                                    811 ;       CONTEXT ( -- a )
                                    812 ;       Start vocabulary search.
      00839E 83 91                  813         .word      LINK
                           000320   814 LINK = . 
      0083A0 07                     815         .byte      7
      0083A1 43 4F 4E 54 45 58 54   816         .ascii     "CONTEXT"
      0083A8                        817 CNTXT:
      0083A8 90 AE 00 14      [ 2]  818 	LDW Y,#RAMBASE+20
      0083AC 1D 00 02         [ 2]  819 	SUBW X,#2
      0083AF FF               [ 2]  820         LDW (X),Y
      0083B0 81               [ 4]  821         RET
                                    822 
                                    823 ;       CP      ( -- a )
                                    824 ;       Point to top of dictionary.
      0083B1 83 A0                  825         .word      LINK
                           000333   826 LINK = . 
      0083B3 02                     827         .byte      2
      0083B4 43 50                  828         .ascii     "CP"
      0083B6                        829 CPP:
      0083B6 90 AE 00 16      [ 2]  830 	LDW Y,#RAMBASE+22
      0083BA 1D 00 02         [ 2]  831 	SUBW X,#2
      0083BD FF               [ 2]  832         LDW (X),Y
      0083BE 81               [ 4]  833         RET
                                    834 
                                    835 ;       LAST    ( -- a )
                                    836 ;       Point to last name in dictionary.
      0083BF 83 B3                  837         .word      LINK
                           000341   838 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      0083C1 04                     839         .byte      4
      0083C2 4C 41 53 54            840         .ascii     "LAST"
      0083C6                        841 LAST:
      0083C6 90 AE 00 18      [ 2]  842 	LDW Y,#RAMBASE+24
      0083CA 1D 00 02         [ 2]  843 	SUBW X,#2
      0083CD FF               [ 2]  844         LDW (X),Y
      0083CE 81               [ 4]  845         RET
                                    846 
                                    847 ;; Common functions
                                    848 
                                    849 ;       ?DUP    ( w -- w w | 0 )
                                    850 ;       Dup tos if its is not zero.
      0083CF 83 C1                  851         .word      LINK
                           000351   852 LINK = . 
      0083D1 04                     853         .byte      4
      0083D2 3F 44 55 50            854         .ascii     "?DUP"
      0083D6                        855 QDUP:
      0083D6 90 93            [ 1]  856         LDW Y,X
      0083D8 90 FE            [ 2]  857 	LDW Y,(Y)
      0083DA 27 04            [ 1]  858         JREQ     QDUP1
      0083DC 1D 00 02         [ 2]  859 	SUBW X,#2
      0083DF FF               [ 2]  860         LDW (X),Y
      0083E0 81               [ 4]  861 QDUP1:  RET
                                    862 
                                    863 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                    864 ;       Rot 3rd item to top.
      0083E1 83 D1                  865         .word      LINK
                           000363   866 LINK = . 
      0083E3 03                     867         .byte      3
      0083E4 52 4F 54               868         .ascii     "ROT"
      0083E7                        869 ROT:
                           000001   870 .if PICATOUT_MOD
      0083E7 90 93            [ 1]  871         ldw y,x 
      0083E9 90 FE            [ 2]  872         ldw y,(y)
      0083EB 90 89            [ 2]  873         pushw y 
      0083ED 90 93            [ 1]  874         ldw y,x 
      0083EF 90 EE 04         [ 2]  875         ldw y,(4,y)
      0083F2 FF               [ 2]  876         ldw (x),y 
      0083F3 90 93            [ 1]  877         ldw y,x 
      0083F5 90 EE 02         [ 2]  878         ldw y,(2,y)
      0083F8 EF 04            [ 2]  879         ldw (4,x),y 
      0083FA 90 85            [ 2]  880         popw y 
      0083FC EF 02            [ 2]  881         ldw (2,x),y
      0083FE 81               [ 4]  882         ret 
                           000000   883 .else 
                                    884         LDW Y,X
                                    885 	LDW Y,(4,Y)
                                    886 	LDW YTEMP,Y
                                    887         LDW Y,X
                                    888         LDW Y,(2,Y)
                                    889         LDW XTEMP,Y
                                    890         LDW Y,X
                                    891         LDW Y,(Y)
                                    892         LDW (2,X),Y
                                    893         LDW Y,XTEMP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                                    894         LDW (4,X),Y
                                    895         LDW Y,YTEMP
                                    896         LDW (X),Y
                                    897         RET
                                    898 .endif 
                                    899 
                                    900 ;       2DROP   ( w w -- )
                                    901 ;       Discard two items on stack.
      0083FF 83 E3                  902         .word      LINK
                           000381   903 LINK = . 
      008401 05                     904         .byte      5
      008402 32 44 52 4F 50         905         .ascii     "2DROP"
      008407                        906 DDROP:
      008407 1C 00 04         [ 2]  907         ADDW X,#4
      00840A 81               [ 4]  908         RET
                                    909 
                                    910 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                    911 ;       Duplicate top two items.
      00840B 84 01                  912         .word      LINK
                           00038D   913 LINK = . 
      00840D 04                     914         .byte      4
      00840E 32 44 55 50            915         .ascii     "2DUP"
      008412                        916 DDUP:
      008412 1D 00 04         [ 2]  917         SUBW X,#4
      008415 90 93            [ 1]  918         LDW Y,X
      008417 90 EE 06         [ 2]  919         LDW Y,(6,Y)
      00841A EF 02            [ 2]  920         LDW (2,X),Y
      00841C 90 93            [ 1]  921         LDW Y,X
      00841E 90 EE 04         [ 2]  922         LDW Y,(4,Y)
      008421 FF               [ 2]  923         LDW (X),Y
      008422 81               [ 4]  924         RET
                                    925 
                                    926 ;       +       ( w w -- sum )
                                    927 ;       Add top two items.
      008423 84 0D                  928         .word      LINK
                           0003A5   929 LINK = . 
      008425 01                     930         .byte      1
      008426 2B                     931         .ascii     "+"
      008427                        932 PLUS:
      008427 90 93            [ 1]  933         LDW Y,X
      008429 90 FE            [ 2]  934         LDW Y,(Y)
      00842B 90 BF 1C         [ 2]  935         LDW YTEMP,Y
      00842E 1C 00 02         [ 2]  936         ADDW X,#2
      008431 90 93            [ 1]  937         LDW Y,X
      008433 90 FE            [ 2]  938         LDW Y,(Y)
      008435 72 B9 00 1C      [ 2]  939         ADDW Y,YTEMP
      008439 FF               [ 2]  940         LDW (X),Y
      00843A 81               [ 4]  941         RET
                                    942 
                                    943 ;       NOT     ( w -- w )
                                    944 ;       One's complement of tos.
      00843B 84 25                  945         .word      LINK
                           0003BD   946 LINK = . 
      00843D 03                     947         .byte      3
      00843E 4E 4F 54               948         .ascii     "NOT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      008441                        949 INVER:
      008441 90 93            [ 1]  950         LDW Y,X
      008443 90 FE            [ 2]  951         LDW Y,(Y)
      008445 90 53            [ 2]  952         CPLW Y
      008447 FF               [ 2]  953         LDW (X),Y
      008448 81               [ 4]  954         RET
                                    955 
                                    956 ;       NEGATE  ( n -- -n )
                                    957 ;       Two's complement of tos.
      008449 84 3D                  958         .word      LINK
                           0003CB   959 LINK = . 
      00844B 06                     960         .byte      6
      00844C 4E 45 47 41 54 45      961         .ascii     "NEGATE"
      008452                        962 NEGAT:
      008452 90 93            [ 1]  963         LDW Y,X
      008454 90 FE            [ 2]  964         LDW Y,(Y)
      008456 90 50            [ 2]  965         NEGW Y
      008458 FF               [ 2]  966         LDW (X),Y
      008459 81               [ 4]  967         RET
                                    968 
                                    969 ;       DNEGATE ( d -- -d )
                                    970 ;       Two's complement of top double.
      00845A 84 4B                  971         .word      LINK
                           0003DC   972 LINK = . 
      00845C 07                     973         .byte      7
      00845D 44 4E 45 47 41 54 45   974         .ascii     "DNEGATE"
      008464                        975 DNEGA:
      008464 90 93            [ 1]  976         LDW Y,X
      008466 90 FE            [ 2]  977 	LDW Y,(Y)
      008468 90 53            [ 2]  978         CPLW Y     
      00846A 90 BF 1C         [ 2]  979 	LDW YTEMP,Y
      00846D 90 93            [ 1]  980         LDW Y,X
      00846F 90 EE 02         [ 2]  981         LDW Y,(2,Y)
      008472 90 53            [ 2]  982         CPLW Y
      008474 90 5C            [ 2]  983         INCW Y
      008476 EF 02            [ 2]  984         LDW (2,X),Y
      008478 90 BE 1C         [ 2]  985         LDW Y,YTEMP
      00847B 24 02            [ 1]  986         JRNC DN1 
      00847D 90 5C            [ 2]  987         INCW Y
      00847F FF               [ 2]  988 DN1:    LDW (X),Y
      008480 81               [ 4]  989         RET
                                    990 
                                    991 ;       -       ( n1 n2 -- n1-n2 )
                                    992 ;       Subtraction.
      008481 84 5C                  993         .word      LINK
                           000403   994 LINK = . 
      008483 01                     995         .byte      1
      008484 2D                     996         .ascii     "-"
      008485                        997 SUBB:
      008485 90 93            [ 1]  998         LDW Y,X
      008487 90 FE            [ 2]  999         LDW Y,(Y)
      008489 90 BF 1C         [ 2] 1000         LDW YTEMP,Y
      00848C 1C 00 02         [ 2] 1001         ADDW X,#2
      00848F 90 93            [ 1] 1002         LDW Y,X
      008491 90 FE            [ 2] 1003         LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008493 72 B2 00 1C      [ 2] 1004         SUBW Y,YTEMP
      008497 FF               [ 2] 1005         LDW (X),Y
      008498 81               [ 4] 1006         RET
                                   1007 
                                   1008 ;       ABS     ( n -- n )
                                   1009 ;       Return  absolute value of n.
      008499 84 83                 1010         .word      LINK
                           00041B  1011 LINK = . 
      00849B 03                    1012         .byte      3
      00849C 41 42 53              1013         .ascii     "ABS"
      00849F                       1014 ABSS:
      00849F 90 93            [ 1] 1015         LDW Y,X
      0084A1 90 FE            [ 2] 1016 	LDW Y,(Y)
      0084A3 2A 03            [ 1] 1017         JRPL     AB1     ;negate:
      0084A5 90 50            [ 2] 1018         NEGW     Y     ;else negate hi byte
      0084A7 FF               [ 2] 1019         LDW (X),Y
      0084A8 81               [ 4] 1020 AB1:    RET
                                   1021 
                                   1022 ;       =       ( w w -- t )
                                   1023 ;       Return true if top two are =al.
      0084A9 84 9B                 1024         .word      LINK
                           00042B  1025 LINK = . 
      0084AB 01                    1026         .byte      1
      0084AC 3D                    1027         .ascii     "="
      0084AD                       1028 EQUAL:
      0084AD A6 FF            [ 1] 1029         LD A,#0xFF  ;true
      0084AF 90 93            [ 1] 1030         LDW Y,X    ;D = n2
      0084B1 90 FE            [ 2] 1031         LDW Y,(Y)
      0084B3 90 BF 1C         [ 2] 1032         LDW YTEMP,Y
      0084B6 1C 00 02         [ 2] 1033         ADDW X,#2
      0084B9 90 93            [ 1] 1034         LDW Y,X
      0084BB 90 FE            [ 2] 1035         LDW Y,(Y)
      0084BD 90 B3 1C         [ 2] 1036         CPW Y,YTEMP     ;if n2 <> n1
      0084C0 27 01            [ 1] 1037         JREQ     EQ1
      0084C2 4F               [ 1] 1038         CLR A
      0084C3 F7               [ 1] 1039 EQ1:    LD (X),A
      0084C4 E7 01            [ 1] 1040         LD (1,X),A
      0084C6 81               [ 4] 1041 	RET     
                                   1042 
                                   1043 ;       U<      ( u u -- t )
                                   1044 ;       Unsigned compare of top two items.
      0084C7 84 AB                 1045         .word      LINK
                           000449  1046 LINK = . 
      0084C9 02                    1047         .byte      2
      0084CA 55 3C                 1048         .ascii     "U<"
      0084CC                       1049 ULESS:
      0084CC A6 FF            [ 1] 1050         LD A,#0xFF  ;true
      0084CE 90 93            [ 1] 1051         LDW Y,X    ;D = n2
      0084D0 90 FE            [ 2] 1052         LDW Y,(Y)
      0084D2 90 BF 1C         [ 2] 1053         LDW YTEMP,Y
      0084D5 1C 00 02         [ 2] 1054         ADDW X,#2
      0084D8 90 93            [ 1] 1055         LDW Y,X
      0084DA 90 FE            [ 2] 1056         LDW Y,(Y)
      0084DC 90 B3 1C         [ 2] 1057         CPW Y,YTEMP     ;if n2 <> n1
      0084DF 25 01            [ 1] 1058         JRULT     ULES1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      0084E1 4F               [ 1] 1059         CLR A
      0084E2 F7               [ 1] 1060 ULES1:  LD (X),A
      0084E3 E7 01            [ 1] 1061         LD (1,X),A
      0084E5 81               [ 4] 1062 	RET     
                                   1063 
                                   1064 ;       <       ( n1 n2 -- t )
                                   1065 ;       Signed compare of top two items.
      0084E6 84 C9                 1066         .word      LINK
                           000468  1067 LINK = . 
      0084E8 01                    1068         .byte      1
      0084E9 3C                    1069         .ascii     "<"
      0084EA                       1070 LESS:
      0084EA A6 FF            [ 1] 1071         LD A,#0xFF  ;true
      0084EC 90 93            [ 1] 1072         LDW Y,X    ;D = n2
      0084EE 90 FE            [ 2] 1073         LDW Y,(Y)
      0084F0 90 BF 1C         [ 2] 1074         LDW YTEMP,Y
      0084F3 1C 00 02         [ 2] 1075         ADDW X,#2
      0084F6 90 93            [ 1] 1076         LDW Y,X
      0084F8 90 FE            [ 2] 1077         LDW Y,(Y)
      0084FA 90 B3 1C         [ 2] 1078         CPW Y,YTEMP     ;if n2 <> n1
      0084FD 2F 01            [ 1] 1079         JRSLT     LT1
      0084FF 4F               [ 1] 1080         CLR A
      008500 F7               [ 1] 1081 LT1:    LD (X),A
      008501 E7 01            [ 1] 1082         LD (1,X),A
      008503 81               [ 4] 1083 	RET     
                                   1084 
                                   1085 ;       MAX     ( n n -- n )
                                   1086 ;       Return greater of two top items.
      008504 84 E8                 1087         .word      LINK
                           000486  1088 LINK = . 
      008506 03                    1089         .byte      3
      008507 4D 41 58              1090         .ascii     "MAX"
      00850A                       1091 MAX:
      00850A 90 93            [ 1] 1092         LDW Y,X    ;D = n2
      00850C 90 EE 02         [ 2] 1093         LDW Y,(2,Y)
      00850F 90 BF 1C         [ 2] 1094         LDW YTEMP,Y
      008512 90 93            [ 1] 1095         LDW Y,X
      008514 90 FE            [ 2] 1096         LDW Y,(Y)
      008516 90 B3 1C         [ 2] 1097         CPW Y,YTEMP     ;if n2 <> n1
      008519 2F 02            [ 1] 1098         JRSLT     MAX1
      00851B EF 02            [ 2] 1099         LDW (2,X),Y
      00851D 1C 00 02         [ 2] 1100 MAX1:   ADDW X,#2
      008520 81               [ 4] 1101 	RET     
                                   1102 
                                   1103 ;       MIN     ( n n -- n )
                                   1104 ;       Return smaller of top two items.
      008521 85 06                 1105         .word      LINK
                           0004A3  1106 LINK = . 
      008523 03                    1107         .byte      3
      008524 4D 49 4E              1108         .ascii     "MIN"
      008527                       1109 MIN:
      008527 90 93            [ 1] 1110         LDW Y,X    ;D = n2
      008529 90 EE 02         [ 2] 1111         LDW Y,(2,Y)
      00852C 90 BF 1C         [ 2] 1112         LDW YTEMP,Y
      00852F 90 93            [ 1] 1113         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      008531 90 FE            [ 2] 1114         LDW Y,(Y)
      008533 90 B3 1C         [ 2] 1115         CPW Y,YTEMP     ;if n2 <> n1
      008536 2C 02            [ 1] 1116         JRSGT     MIN1
      008538 EF 02            [ 2] 1117         LDW (2,X),Y
      00853A 1C 00 02         [ 2] 1118 MIN1:	ADDW X,#2
      00853D 81               [ 4] 1119 	RET     
                                   1120 
                                   1121 ;       WITHIN  ( u ul uh -- t )
                                   1122 ;       Return true if u is within
                                   1123 ;       range of ul and uh. ( ul <= u < uh )
      00853E 85 23                 1124         .word      LINK
                           0004C0  1125 LINK = . 
      008540 06                    1126         .byte      6
      008541 57 49 54 48 49 4E     1127         .ascii     "WITHIN"
      008547                       1128 WITHI:
      008547 CD 82 B6         [ 4] 1129         CALL     OVER
      00854A CD 84 85         [ 4] 1130         CALL     SUBB
      00854D CD 82 55         [ 4] 1131         CALL     TOR
      008550 CD 84 85         [ 4] 1132         CALL     SUBB
      008553 CD 82 36         [ 4] 1133         CALL     RFROM
      008556 CC 84 CC         [ 2] 1134         JP     ULESS
                                   1135 
                                   1136 ;; Divide
                                   1137 
                                   1138 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1139 ;       Unsigned divide of a double by a
                                   1140 ;       single. Return mod and quotient.
      008559 85 40                 1141         .word      LINK
                           0004DB  1142 LINK = . 
      00855B 06                    1143         .byte      6
      00855C 55 4D 2F 4D 4F 44     1144         .ascii     "UM/MOD"
      008562                       1145 UMMOD:
      008562 BF 1A            [ 2] 1146 	LDW XTEMP,X	; save stack pointer
      008564 FE               [ 2] 1147 	LDW X,(X)		; un
      008565 BF 1C            [ 2] 1148 	LDW YTEMP,X ; save un
      008567 90 BE 1A         [ 2] 1149 	LDW Y,XTEMP	; stack pointer
      00856A 90 EE 04         [ 2] 1150 	LDW Y,(4,Y) ; Y=udl
      00856D BE 1A            [ 2] 1151 	LDW X,XTEMP
      00856F EE 02            [ 2] 1152 	LDW X,(2,X)	; X=udh
      008571 B3 1C            [ 2] 1153 	CPW X,YTEMP
      008573 23 0F            [ 2] 1154 	JRULE MMSM1
      008575 BE 1A            [ 2] 1155 	LDW X,XTEMP
      008577 1C 00 02         [ 2] 1156 	ADDW X,#2	; pop off 1 level
      00857A 90 AE FF FF      [ 2] 1157 	LDW Y,#0xFFFF
      00857E FF               [ 2] 1158 	LDW (X),Y
      00857F 90 5F            [ 1] 1159 	CLRW Y
      008581 EF 02            [ 2] 1160 	LDW (2,X),Y
      008583 81               [ 4] 1161 	RET
      008584                       1162 MMSM1:
                           000001  1163 .if  PICATOUT_MOD 
                                   1164 ; take advantage of divw x,y when udh==0
      008584 5D               [ 2] 1165         tnzw x  ; is udh==0?
      008585 26 11            [ 1] 1166         jrne MMSM2 
      008587 93               [ 1] 1167         ldw x,y    ;udl 
      008588 90 BE 1C         [ 2] 1168         ldw y,YTEMP ; divisor 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      00858B 65               [ 2] 1169         divw x,y 
      00858C 89               [ 2] 1170         pushw x     ; quotient 
      00858D BE 1A            [ 2] 1171         ldw x,XTEMP 
      00858F 1C 00 02         [ 2] 1172         addw x,#CELLL 
      008592 EF 02            [ 2] 1173         ldw (2,x),y  ; ur
      008594 90 85            [ 2] 1174         popw y 
      008596 FF               [ 2] 1175         ldw (x),y ; uq 
      008597 81               [ 4] 1176         ret 
      008598                       1177 MMSM2:        
                                   1178 .endif 
      008598 A6 11            [ 1] 1179 	LD A,#17	; loop count
      00859A                       1180 MMSM3:
      00859A B3 1C            [ 2] 1181 	CPW X,YTEMP	; compare udh to un
      00859C 25 04            [ 1] 1182 	JRULT MMSM4	; can't subtract
      00859E 72 B0 00 1C      [ 2] 1183 	SUBW X,YTEMP	; can subtract
      0085A2                       1184 MMSM4:
      0085A2 8C               [ 1] 1185 	CCF	; quotient bit
      0085A3 90 59            [ 2] 1186 	RLCW Y	; rotate into quotient
      0085A5 59               [ 2] 1187 	RLCW X	; rotate into remainder
      0085A6 4A               [ 1] 1188 	DEC A	; repeat
      0085A7 22 F1            [ 1] 1189 	JRUGT MMSM3
      0085A9 57               [ 2] 1190 	SRAW X
      0085AA BF 1C            [ 2] 1191 	LDW YTEMP,X	; done, save remainder
      0085AC BE 1A            [ 2] 1192 	LDW X,XTEMP
      0085AE 1C 00 02         [ 2] 1193 	ADDW X,#2	; drop
      0085B1 FF               [ 2] 1194 	LDW (X),Y
      0085B2 90 BE 1C         [ 2] 1195 	LDW Y,YTEMP	; save quotient
      0085B5 EF 02            [ 2] 1196 	LDW (2,X),Y
      0085B7 81               [ 4] 1197 	RET
                                   1198 	
                                   1199 ;       M/MOD   ( d n -- r q )
                                   1200 ;       Signed floored divide of double by
                                   1201 ;       single. Return mod and quotient.
      0085B8 85 5B                 1202         .word      LINK
                           00053A  1203 LINK = . 
      0085BA 05                    1204         .byte      5
      0085BB 4D 2F 4D 4F 44        1205         .ascii     "M/MOD"
      0085C0                       1206 MSMOD:  
      0085C0 CD 82 8C         [ 4] 1207         CALL	DUPP
      0085C3 CD 82 C5         [ 4] 1208         CALL	ZLESS
      0085C6 CD 82 8C         [ 4] 1209         CALL	DUPP
      0085C9 CD 82 55         [ 4] 1210         CALL	TOR
      0085CC CD 81 90         [ 4] 1211         CALL	QBRAN
      0085CF 85 DD                 1212         .word	MMOD1
      0085D1 CD 84 52         [ 4] 1213         CALL	NEGAT
      0085D4 CD 82 55         [ 4] 1214         CALL	TOR
      0085D7 CD 84 64         [ 4] 1215         CALL	DNEGA
      0085DA CD 82 36         [ 4] 1216         CALL	RFROM
      0085DD CD 82 55         [ 4] 1217 MMOD1:	CALL	TOR
      0085E0 CD 82 8C         [ 4] 1218         CALL	DUPP
      0085E3 CD 82 C5         [ 4] 1219         CALL	ZLESS
      0085E6 CD 81 90         [ 4] 1220         CALL	QBRAN
      0085E9 85 F1                 1221         .word	MMOD2
      0085EB CD 82 49         [ 4] 1222         CALL	RAT
      0085EE CD 84 27         [ 4] 1223         CALL	PLUS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      0085F1 CD 82 36         [ 4] 1224 MMOD2:	CALL	RFROM
      0085F4 CD 85 62         [ 4] 1225         CALL	UMMOD
      0085F7 CD 82 36         [ 4] 1226         CALL	RFROM
      0085FA CD 81 90         [ 4] 1227         CALL	QBRAN
      0085FD 86 08                 1228         .word	MMOD3
      0085FF CD 82 9C         [ 4] 1229         CALL	SWAPP
      008602 CD 84 52         [ 4] 1230         CALL	NEGAT
      008605 CD 82 9C         [ 4] 1231         CALL	SWAPP
      008608 81               [ 4] 1232 MMOD3:	RET
                                   1233 
                                   1234 ;       /MOD    ( n n -- r q )
                                   1235 ;       Signed divide. Return mod and quotient.
      008609 85 BA                 1236         .word      LINK
                           00058B  1237 LINK = . 
      00860B 04                    1238         .byte      4
      00860C 2F 4D 4F 44           1239         .ascii     "/MOD"
      008610                       1240 SLMOD:
      008610 CD 82 B6         [ 4] 1241         CALL	OVER
      008613 CD 82 C5         [ 4] 1242         CALL	ZLESS
      008616 CD 82 9C         [ 4] 1243         CALL	SWAPP
      008619 CC 85 C0         [ 2] 1244         JP	MSMOD
                                   1245 
                                   1246 ;       MOD     ( n n -- r )
                                   1247 ;       Signed divide. Return mod only.
      00861C 86 0B                 1248         .word      LINK
                           00059E  1249 LINK = . 
      00861E 03                    1250         .byte      3
      00861F 4D 4F 44              1251         .ascii     "MOD"
      008622                       1252 MODD:
      008622 CD 86 10         [ 4] 1253 	CALL	SLMOD
      008625 CC 82 82         [ 2] 1254 	JP	DROP
                                   1255 
                                   1256 ;       /       ( n n -- q )
                                   1257 ;       Signed divide. Return quotient only.
      008628 86 1E                 1258         .word      LINK
                           0005AA  1259 LINK = . 
      00862A 01                    1260         .byte      1
      00862B 2F                    1261         .ascii     "/"
      00862C                       1262 SLASH:
      00862C CD 86 10         [ 4] 1263         CALL	SLMOD
      00862F CD 82 9C         [ 4] 1264         CALL	SWAPP
      008632 CC 82 82         [ 2] 1265         JP	DROP
                                   1266 
                                   1267 ;; Multiply
                                   1268 
                                   1269 ;       UM*     ( u u -- ud )
                                   1270 ;       Unsigned multiply. Return double product.
      008635 86 2A                 1271         .word      LINK
                           0005B7  1272 LINK = . 
      008637 03                    1273         .byte      3
      008638 55 4D 2A              1274         .ascii     "UM*"
      00863B                       1275 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                           000001  1276 .if PICATOUT_MOD 
                                   1277 ; take advantage of SP addressing modes
                                   1278 ; these PRODx in RAM are not required
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



                                   1279 ; the product is kept on stack as local variable 
                                   1280         ;; bytes offset on data stack 
                           000002  1281         da=2 
                           000003  1282         db=3 
                           000000  1283         dc=0 
                           000001  1284         dd=1 
                                   1285         ;; product bytes offset on return stack 
                           000001  1286         UD1=1  ; ud bits 31..24
                           000002  1287         UD2=2  ; ud bits 23..16
                           000003  1288         UD3=3  ; ud bits 15..8 
                           000004  1289         UD4=4  ; ud bits 7..0 
                                   1290         ;; local variable for product set to zero   
      00863B 90 5F            [ 1] 1291         clrw y 
      00863D 90 89            [ 2] 1292         pushw y  ; bits 15..0
      00863F 90 89            [ 2] 1293         pushw y  ; bits 31..16 
      008641 E6 03            [ 1] 1294         ld a,(db,x) ; b 
      008643 90 97            [ 1] 1295         ld yl,a 
      008645 E6 01            [ 1] 1296         ld a,(dd,x)   ; d
      008647 90 42            [ 4] 1297         mul y,a    ; b*d  
      008649 17 03            [ 2] 1298         ldw (UD3,sp),y ; lowest weight product 
      00864B E6 03            [ 1] 1299         ld a,(db,x)
      00864D 90 97            [ 1] 1300         ld yl,a 
      00864F E6 00            [ 1] 1301         ld a,(dc,x)
      008651 90 42            [ 4] 1302         mul y,a  ; b*c 
                                   1303         ;;; do the partial sum 
      008653 72 F9 02         [ 2] 1304         addw y,(UD2,sp)
      008656 4F               [ 1] 1305         clr a 
      008657 49               [ 1] 1306         rlc a
      008658 6B 01            [ 1] 1307         ld (UD1,sp),a 
      00865A 17 02            [ 2] 1308         ldw (UD2,sp),y 
      00865C E6 02            [ 1] 1309         ld a,(da,x)
      00865E 90 97            [ 1] 1310         ld yl,a 
      008660 E6 01            [ 1] 1311         ld a,(dd,x)
      008662 90 42            [ 4] 1312         mul y,a   ; a*d 
                                   1313         ;; do partial sum 
      008664 72 F9 02         [ 2] 1314         addw y,(UD2,sp)
      008667 4F               [ 1] 1315         clr a 
      008668 19 01            [ 1] 1316         adc a,(UD1,sp)
      00866A 6B 01            [ 1] 1317         ld (UD1,sp),a  
      00866C 17 02            [ 2] 1318         ldw (UD2,sp),y 
      00866E E6 02            [ 1] 1319         ld a,(da,x)
      008670 90 97            [ 1] 1320         ld yl,a 
      008672 E6 00            [ 1] 1321         ld a,(dc,x)
      008674 90 42            [ 4] 1322         mul y,a  ;  a*c highest weight product 
                                   1323         ;;; do partial sum 
      008676 72 F9 01         [ 2] 1324         addw y,(UD1,sp)
      008679 FF               [ 2] 1325         ldw (x),y  ; udh 
      00867A 16 03            [ 2] 1326         ldw y,(UD3,sp)
      00867C EF 02            [ 2] 1327         ldw (2,x),y  ; udl  
      00867E 5B 04            [ 2] 1328         addw sp,#4 ; drop local variable 
      008680 81               [ 4] 1329         ret  
                           000000  1330 .else
                                   1331 	LD A,(2,X)	; b
                                   1332 	LD YL,A
                                   1333 	LD A,(X)	; d
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                                   1334 	MUL Y,A
                                   1335 	LDW PROD1,Y
                                   1336 	LD A,(3,X)	; a
                                   1337 	LD YL,A
                                   1338 	LD A,(X)	; d
                                   1339 	MUL Y,A
                                   1340 	LDW PROD2,Y
                                   1341 	LD A,(2,X)	; b
                                   1342 	LD YL,A
                                   1343 	LD A,(1,X)	; c
                                   1344 	MUL Y,A
                                   1345 	LDW PROD3,Y
                                   1346 	LD A,(3,X)	; a
                                   1347 	LD YL,A
                                   1348 	LD A,(1,X)	; c
                                   1349 	MUL Y,A	; least signifiant product
                                   1350 	CLR A
                                   1351 	RRWA Y
                                   1352 	LD (3,X),A	; store least significant byte
                                   1353 	ADDW Y,PROD3
                                   1354 	CLR A
                                   1355 	ADC A,#0	; save carry
                                   1356 	LD CARRY,A
                                   1357 	ADDW Y,PROD2
                                   1358 	LD A,CARRY
                                   1359 	ADC A,#0	; add 2nd carry
                                   1360 	LD CARRY,A
                                   1361 	CLR A
                                   1362 	RRWA Y
                                   1363 	LD (2,X),A	; 2nd product byte
                                   1364 	ADDW Y,PROD1
                                   1365 	RRWA Y
                                   1366 	LD (1,X),A	; 3rd product byte
                                   1367 	RRWA Y  	; 4th product byte now in A
                                   1368 	ADC A,CARRY	; fill in carry bits
                                   1369 	LD (X),A
                                   1370 	RET
                                   1371 .endif 
                                   1372 
                                   1373 
                                   1374 ;       *       ( n n -- n )
                                   1375 ;       Signed multiply. Return single product.
      008681 86 37                 1376         .word      LINK
                           000603  1377 LINK = . 
      008683 01                    1378         .byte      1
      008684 2A                    1379         .ascii     "*"
      008685                       1380 STAR:
      008685 CD 86 3B         [ 4] 1381 	CALL	UMSTA
      008688 CC 82 82         [ 2] 1382 	JP	DROP
                                   1383 
                                   1384 ;       M*      ( n n -- d )
                                   1385 ;       Signed multiply. Return double product.
      00868B 86 83                 1386         .word      LINK
                           00060D  1387 LINK = . 
      00868D 02                    1388         .byte      2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      00868E 4D 2A                 1389         .ascii     "M*"
      008690                       1390 MSTAR:      
      008690 CD 84 12         [ 4] 1391         CALL	DDUP
      008693 CD 83 01         [ 4] 1392         CALL	XORR
      008696 CD 82 C5         [ 4] 1393         CALL	ZLESS
      008699 CD 82 55         [ 4] 1394         CALL	TOR
      00869C CD 84 9F         [ 4] 1395         CALL	ABSS
      00869F CD 82 9C         [ 4] 1396         CALL	SWAPP
      0086A2 CD 84 9F         [ 4] 1397         CALL	ABSS
      0086A5 CD 86 3B         [ 4] 1398         CALL	UMSTA
      0086A8 CD 82 36         [ 4] 1399         CALL	RFROM
      0086AB CD 81 90         [ 4] 1400         CALL	QBRAN
      0086AE 86 B3                 1401         .word	MSTA1
      0086B0 CD 84 64         [ 4] 1402         CALL	DNEGA
      0086B3 81               [ 4] 1403 MSTA1:	RET
                                   1404 
                                   1405 ;       . /MOD   ( n1 n2 n3 -- r q )
                                   1406 ;       Multiply n1 and n2, then divide
                                   1407 ;       by n3. Return mod and quotient.
      0086B4 86 8D                 1408         .word      LINK
                           000636  1409 LINK = . 
      0086B6 05                    1410         .byte      5
      0086B7 2A 2F 4D 4F 44        1411         .ascii     "*/MOD"
      0086BC                       1412 SSMOD:
      0086BC CD 82 55         [ 4] 1413         CALL     TOR
      0086BF CD 86 90         [ 4] 1414         CALL     MSTAR
      0086C2 CD 82 36         [ 4] 1415         CALL     RFROM
      0086C5 CC 85 C0         [ 2] 1416         JP     MSMOD
                                   1417 
                                   1418 ;       */      ( n1 n2 n3 -- q )
                                   1419 ;       Multiply n1 by n2, then divide
                                   1420 ;       by n3. Return quotient only.
      0086C8 86 B6                 1421         .word      LINK
                           00064A  1422 LINK = . 
      0086CA 02                    1423         .byte      2
      0086CB 2A 2F                 1424         .ascii     "*/"
      0086CD                       1425 STASL:
      0086CD CD 86 BC         [ 4] 1426         CALL	SSMOD
      0086D0 CD 82 9C         [ 4] 1427         CALL	SWAPP
      0086D3 CC 82 82         [ 2] 1428         JP	DROP
                                   1429 
                                   1430 ;; Miscellaneous
                                   1431 
                                   1432 ;       CELL+   ( a -- a )
                                   1433 ;       Add cell size in byte to address.
      0086D6 86 CA                 1434         .word      LINK
                           000658  1435 LINK = . 
      0086D8 02                    1436         .byte       2
      0086D9 32 2B                 1437         .ascii     "2+"
      0086DB                       1438 CELLP:
      0086DB 90 93            [ 1] 1439         LDW Y,X
      0086DD 90 FE            [ 2] 1440 	LDW Y,(Y)
      0086DF 72 A9 00 02      [ 2] 1441         ADDW Y,#CELLL 
      0086E3 FF               [ 2] 1442         LDW (X),Y
      0086E4 81               [ 4] 1443         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



                                   1444 
                                   1445 ;       CELL-   ( a -- a )
                                   1446 ;       Subtract 2 from address.
      0086E5 86 D8                 1447         .word      LINK
                           000667  1448 LINK = . 
      0086E7 02                    1449         .byte       2
      0086E8 32 2D                 1450         .ascii     "2-"
      0086EA                       1451 CELLM:
      0086EA 90 93            [ 1] 1452         LDW Y,X
      0086EC 90 FE            [ 2] 1453 	LDW Y,(Y)
      0086EE 72 A2 00 02      [ 2] 1454         SUBW Y,#CELLL
      0086F2 FF               [ 2] 1455         LDW (X),Y
      0086F3 81               [ 4] 1456         RET
                                   1457 
                                   1458 ;       CELLS   ( n -- n )
                                   1459 ;       Multiply tos by 2.
      0086F4 86 E7                 1460         .word      LINK
                           000676  1461 LINK = . 
      0086F6 02                    1462         .byte       2
      0086F7 32 2A                 1463         .ascii     "2*"
      0086F9                       1464 CELLS:
      0086F9 90 93            [ 1] 1465         LDW Y,X
      0086FB 90 FE            [ 2] 1466 	LDW Y,(Y)
      0086FD 90 58            [ 2] 1467         SLAW Y
      0086FF FF               [ 2] 1468         LDW (X),Y
      008700 81               [ 4] 1469         RET
                                   1470 
                                   1471 ;       1+      ( a -- a )
                                   1472 ;       Add cell size in byte to address.
      008701 86 F6                 1473         .word      LINK
                           000683  1474 LINK = . 
      008703 02                    1475         .byte      2
      008704 31 2B                 1476         .ascii     "1+"
      008706                       1477 ONEP:
      008706 90 93            [ 1] 1478         LDW Y,X
      008708 90 FE            [ 2] 1479 	LDW Y,(Y)
      00870A 90 5C            [ 2] 1480         INCW Y
      00870C FF               [ 2] 1481         LDW (X),Y
      00870D 81               [ 4] 1482         RET
                                   1483 
                                   1484 ;       1-      ( a -- a )
                                   1485 ;       Subtract 2 from address.
      00870E 87 03                 1486         .word      LINK
                           000690  1487 LINK = . 
      008710 02                    1488         .byte      2
      008711 31 2D                 1489         .ascii     "1-"
      008713                       1490 ONEM:
      008713 90 93            [ 1] 1491         LDW Y,X
      008715 90 FE            [ 2] 1492 	LDW Y,(Y)
      008717 90 5A            [ 2] 1493         DECW Y
      008719 FF               [ 2] 1494         LDW (X),Y
      00871A 81               [ 4] 1495         RET
                                   1496 
                                   1497 ;       2/      ( n -- n )
                                   1498 ;       Multiply tos by 2.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      00871B 87 10                 1499         .word      LINK
                           00069D  1500 LINK = . 
      00871D 02                    1501         .byte      2
      00871E 32 2F                 1502         .ascii     "2/"
      008720                       1503 TWOSL:
      008720 90 93            [ 1] 1504         LDW Y,X
      008722 90 FE            [ 2] 1505 	LDW Y,(Y)
      008724 90 57            [ 2] 1506         SRAW Y
      008726 FF               [ 2] 1507         LDW (X),Y
      008727 81               [ 4] 1508         RET
                                   1509 
                                   1510 ;       BL      ( -- 32 )
                                   1511 ;       Return 32,  blank character.
      008728 87 1D                 1512         .word      LINK
                           0006AA  1513 LINK = . 
      00872A 02                    1514         .byte      2
      00872B 42 4C                 1515         .ascii     "BL"
      00872D                       1516 BLANK:
      00872D 1D 00 02         [ 2] 1517         SUBW X,#2
      008730 90 AE 00 20      [ 2] 1518 	LDW Y,#32
      008734 FF               [ 2] 1519         LDW (X),Y
      008735 81               [ 4] 1520         RET
                                   1521 
                                   1522 ;         0     ( -- 0)
                                   1523 ;         Return 0.
      008736 87 2A                 1524         .word      LINK
                           0006B8  1525 LINK = . 
      008738 01                    1526         .byte       1
      008739 30                    1527         .ascii     "0"
      00873A                       1528 ZERO:
      00873A 1D 00 02         [ 2] 1529         SUBW X,#2
      00873D 90 5F            [ 1] 1530 	CLRW Y
      00873F FF               [ 2] 1531         LDW (X),Y
      008740 81               [ 4] 1532         RET
                                   1533 
                                   1534 ;         1     ( -- 1)
                                   1535 ;         Return 1.
      008741 87 38                 1536         .word      LINK
                           0006C3  1537 LINK = . 
      008743 01                    1538         .byte       1
      008744 31                    1539         .ascii     "1"
      008745                       1540 ONE:
      008745 1D 00 02         [ 2] 1541         SUBW X,#2
      008748 90 AE 00 01      [ 2] 1542 	LDW Y,#1
      00874C FF               [ 2] 1543         LDW (X),Y
      00874D 81               [ 4] 1544         RET
                                   1545 
                                   1546 ;         -1    ( -- -1)
                                   1547 ;         Return 32,  blank character.
      00874E 87 43                 1548         .word      LINK
                           0006D0  1549 LINK = . 
      008750 02                    1550         .byte       2
      008751 2D 31                 1551         .ascii     "-1"
      008753                       1552 MONE:
      008753 1D 00 02         [ 2] 1553         SUBW X,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      008756 90 AE FF FF      [ 2] 1554 	LDW Y,#0xFFFF
      00875A FF               [ 2] 1555         LDW (X),Y
      00875B 81               [ 4] 1556         RET
                                   1557 
                                   1558 ;       >CHAR   ( c -- c )
                                   1559 ;       Filter non-printing characters.
      00875C 87 50                 1560         .word      LINK
                           0006DE  1561 LINK = . 
      00875E 05                    1562         .byte      5
      00875F 3E 43 48 41 52        1563         .ascii     ">CHAR"
      008764                       1564 TCHAR:
                           000001  1565 .if CONVERT_TO_CODE
      008764 E6 01            [ 1] 1566         ld a,(1,x)
      008766 A1 20            [ 1] 1567         cp a,#32  
      008768 2B 05            [ 1] 1568         jrmi 1$ 
      00876A A1 7F            [ 1] 1569         cp a,#127 
      00876C 2A 01            [ 1] 1570         jrpl 1$ 
      00876E 81               [ 4] 1571         ret 
      00876F A6 5F            [ 1] 1572 1$:     ld a,#'_ 
      008771 E7 01            [ 1] 1573         ld (1,x),a 
      008773 81               [ 4] 1574         ret 
                           000000  1575 .else
                                   1576         CALL     DOLIT
                                   1577         .word       0x7F
                                   1578         CALL     ANDD
                                   1579         CALL     DUPP    ;mask msb
                                   1580         CALL     DOLIT
                                   1581         .word      127
                                   1582         CALL     BLANK
                                   1583         CALL     WITHI   ;check for printable
                                   1584         CALL     QBRAN
                                   1585         .word    TCHA1
                                   1586         CALL     DROP
                                   1587         CALL     DOLIT
                                   1588         .word     0x5F		; "_"     ;replace non-printables
                                   1589 .endif 
      008774 81               [ 4] 1590 TCHA1:  RET
                                   1591 
                                   1592 ;       DEPTH   ( -- n )
                                   1593 ;       Return  depth of  data stack.
      008775 87 5E                 1594         .word      LINK
                           0006F7  1595 LINK = . 
      008777 05                    1596         .byte      5
      008778 44 45 50 54 48        1597         .ascii     "DEPTH"
      00877D                       1598 DEPTH: 
      00877D 90 BE 22         [ 2] 1599         LDW Y,SP0    ;save data stack ptr
      008780 BF 1A            [ 2] 1600 	LDW XTEMP,X
      008782 72 B2 00 1A      [ 2] 1601         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008786 90 57            [ 2] 1602         SRAW Y    ;Y = #stack items
                           000001  1603 .if PICATOUT_MOD
                                   1604 ; why ? 
                                   1605 ;      	DECW Y
                                   1606 .endif 
      008788 1D 00 02         [ 2] 1607 	SUBW X,#2
      00878B FF               [ 2] 1608         LDW (X),Y     ; if neg, underflow
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      00878C 81               [ 4] 1609         RET
                                   1610 
                                   1611 ;       PICK    ( ... +n -- ... w )
                                   1612 ;       Copy  nth stack item to tos.
      00878D 87 77                 1613         .word      LINK
                           00070F  1614 LINK = . 
      00878F 04                    1615         .byte      4
      008790 50 49 43 4B           1616         .ascii     "PICK"
      008794                       1617 PICK:
      008794 90 93            [ 1] 1618         LDW Y,X   ;D = n1
      008796 90 FE            [ 2] 1619         LDW Y,(Y)
      008798 90 58            [ 2] 1620         SLAW Y
      00879A BF 1A            [ 2] 1621         LDW XTEMP,X
      00879C 72 B9 00 1A      [ 2] 1622         ADDW Y,XTEMP
      0087A0 90 FE            [ 2] 1623         LDW Y,(Y)
      0087A2 FF               [ 2] 1624         LDW (X),Y
      0087A3 81               [ 4] 1625         RET
                                   1626 
                                   1627 ;; Memory access
                                   1628 
                                   1629 ;       +!      ( n a -- )
                                   1630 ;       Add n to  contents at address a.
      0087A4 87 8F                 1631         .word      LINK
                           000726  1632 LINK = . 
      0087A6 02                    1633         .byte      2
      0087A7 2B 21                 1634         .ascii     "+!"
      0087A9                       1635 PSTOR:
                           000001  1636 .if CONVERT_TO_CODE
      0087A9 90 93            [ 1] 1637         ldw y,x 
      0087AB 90 FE            [ 2] 1638         ldw y,(y)
      0087AD 90 BF 1C         [ 2] 1639         ldw YTEMP,y  ; address
      0087B0 90 FE            [ 2] 1640         ldw y,(y)  
      0087B2 90 89            [ 2] 1641         pushw y  ; value at address 
      0087B4 90 93            [ 1] 1642         ldw y,x 
      0087B6 90 EE 02         [ 2] 1643         ldw y,(2,y) ; n 
      0087B9 72 F9 01         [ 2] 1644         addw y,(1,sp) ; n+value
      0087BC 91 CF 1C         [ 5] 1645         ldw [YTEMP],y ;  a!
      0087BF 90 85            [ 2] 1646         popw y    ;drop local var
      0087C1 1C 00 04         [ 2] 1647         addw x,#4 ; DDROP 
      0087C4 81               [ 4] 1648         ret 
                           000000  1649 .else
                                   1650         CALL	SWAPP
                                   1651         CALL	OVER
                                   1652         CALL	AT
                                   1653         CALL	PLUS
                                   1654         CALL	SWAPP
                                   1655         JP	STORE
                                   1656 .endif 
                                   1657 ;       2!      ( d a -- )
                                   1658 ;       Store  double integer to address a.
      0087C5 87 A6                 1659         .word      LINK
                           000747  1660 LINK = . 
      0087C7 02                    1661         .byte      2
      0087C8 32 21                 1662         .ascii     "2!"
      0087CA                       1663 DSTOR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                           000001  1664 .if CONVERT_TO_CODE
      0087CA 90 93            [ 1] 1665         ldw y,x 
      0087CC 90 FE            [ 2] 1666         ldw y,(y)
      0087CE 90 BF 1C         [ 2] 1667         ldw YTEMP,y ; address 
      0087D1 1C 00 02         [ 2] 1668         addw x,#CELLL ; drop a 
      0087D4 90 93            [ 1] 1669         ldw y,x 
      0087D6 90 FE            [ 2] 1670         ldw y,(y) ; hi word 
      0087D8 89               [ 2] 1671         pushw x 
      0087D9 EE 02            [ 2] 1672         ldw x,(2,x) ; lo word 
      0087DB 91 CF 1C         [ 5] 1673         ldw [YTEMP],y
      0087DE 90 93            [ 1] 1674         ldw y,x 
      0087E0 AE 00 02         [ 2] 1675         ldw x,#2 
      0087E3 92 DF 1C         [ 5] 1676         ldw ([YTEMP],x),y 
      0087E6 85               [ 2] 1677         popw x 
      0087E7 1C 00 04         [ 2] 1678         addw x,#4 ; DDROP 
      0087EA 81               [ 4] 1679         ret 
                           000000  1680 .else
                                   1681         CALL	SWAPP
                                   1682         CALL	OVER
                                   1683         CALL	STORE
                                   1684         CALL	CELLP
                                   1685         JP	STORE
                                   1686 .endif 
                                   1687 ;       2@      ( a -- d )
                                   1688 ;       Fetch double integer from address a.
      0087EB 87 C7                 1689         .word      LINK
                           00076D  1690 LINK = . 
      0087ED 02                    1691         .byte      2
      0087EE 32 40                 1692         .ascii     "2@"
      0087F0                       1693 DAT:
                           000001  1694 .if CONVERT_TO_CODE
      0087F0 90 93            [ 1] 1695         ldw y,x 
      0087F2 90 FE            [ 2] 1696         ldw y,(y) ;address 
      0087F4 90 BF 1C         [ 2] 1697         ldw YTEMP,y 
      0087F7 1D 00 02         [ 2] 1698         subw x,#CELLL ; space for udh 
      0087FA 91 CE 1C         [ 5] 1699         ldw y,[YTEMP] ; udh 
      0087FD FF               [ 2] 1700         ldw (x),y 
      0087FE 90 AE 00 02      [ 2] 1701         ldw y,#2
      008802 91 DE 1C         [ 5] 1702         ldw y,([YTEMP],y) ; udl 
      008805 EF 02            [ 2] 1703         ldw (2,x),y
      008807 81               [ 4] 1704         ret 
                           000000  1705 .else 
                                   1706         CALL	DUPP
                                   1707         CALL	CELLP
                                   1708         CALL	AT
                                   1709         CALL	SWAPP
                                   1710         JP	AT
                                   1711 .endif 
                                   1712 
                                   1713 ;       COUNT   ( b -- b +n )
                                   1714 ;       Return count byte of a string
                                   1715 ;       and add 1 to byte address.
      008808 87 ED                 1716         .word      LINK
                           00078A  1717 LINK = . 
      00880A 05                    1718         .byte      5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      00880B 43 4F 55 4E 54        1719         .ascii     "COUNT"
      008810                       1720 COUNT:
                           000001  1721 .if CONVERT_TO_CODE
      008810 90 93            [ 1] 1722         ldw y,x 
      008812 90 FE            [ 2] 1723         ldw y,(y) ; address 
      008814 90 F6            [ 1] 1724         ld a,(y)  ; count 
      008816 90 5C            [ 2] 1725         incw y 
      008818 FF               [ 2] 1726         ldw (x),y 
      008819 1D 00 02         [ 2] 1727         subw x,#CELLL 
      00881C E7 01            [ 1] 1728         ld (1,x),a 
      00881E 7F               [ 1] 1729         clr (x)
      00881F 81               [ 4] 1730         ret 
                           000000  1731 .else 
                                   1732         CALL     DUPP
                                   1733         CALL     ONEP
                                   1734         CALL     SWAPP
                                   1735         JP     CAT
                                   1736 .endif 
                                   1737 
                                   1738 ;       HERE    ( -- a )
                                   1739 ;       Return  top of  code dictionary.
      008820 88 0A                 1740         .word      LINK
                           0007A2  1741 LINK = . 
      008822 04                    1742         .byte      4
      008823 48 45 52 45           1743         .ascii     "HERE"
      008827                       1744 HERE:
                           000001  1745 .if CONVERT_TO_CODE
      008827 90 AE 00 16      [ 2] 1746       	ldw y,#RAMBASE+22
      00882B 90 FE            [ 2] 1747         ldw y,(y)
      00882D 1D 00 02         [ 2] 1748         subw x,#CELLL 
      008830 FF               [ 2] 1749         ldw (x),y 
      008831 81               [ 4] 1750         ret 
                           000000  1751 .else
                                   1752         CALL     CPP
                                   1753         JP     AT
                                   1754 .endif 
                                   1755 
                                   1756 ;       PAD     ( -- a )
                                   1757 ;       Return address of text buffer
                                   1758 ;       above  code dictionary.
      008832 88 22                 1759         .word      LINK
                           0007B4  1760 LINK = . 
      008834 03                    1761         .byte      3
      008835 50 41 44              1762         .ascii     "PAD"
      008838                       1763 PAD:
      008838 CD 88 27         [ 4] 1764         CALL     HERE
      00883B CD 81 5D         [ 4] 1765         CALL     DOLIT
      00883E 00 50                 1766         .word      80
      008840 CC 84 27         [ 2] 1767         JP     PLUS
                                   1768 
                                   1769 ;       TIB     ( -- a )
                                   1770 ;       Return address of terminal input buffer.
      008843 88 34                 1771         .word      LINK
                           0007C5  1772 LINK = . 
      008845 03                    1773         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008846 54 49 42              1774         .ascii     "TIB"
      008849                       1775 TIB:
      008849 CD 83 75         [ 4] 1776         CALL     NTIB
      00884C CD 86 DB         [ 4] 1777         CALL     CELLP
      00884F CC 81 E5         [ 2] 1778         JP     AT
                                   1779 
                                   1780 ;       @EXECUTE        ( a -- )
                                   1781 ;       Execute vector stored in address a.
      008852 88 45                 1782         .word      LINK
                           0007D4  1783 LINK = . 
      008854 08                    1784         .byte      8
      008855 40 45 58 45 43 55 54  1785         .ascii     "@EXECUTE"
             45
      00885D                       1786 ATEXE:
      00885D CD 81 E5         [ 4] 1787         CALL     AT
      008860 CD 83 D6         [ 4] 1788         CALL     QDUP    ;?address or zero
      008863 CD 81 90         [ 4] 1789         CALL     QBRAN
      008866 88 6B                 1790         .word      EXE1
      008868 CD 81 B7         [ 4] 1791         CALL     EXECU   ;execute if non-zero
      00886B 81               [ 4] 1792 EXE1:   RET     ;do nothing if zero
                                   1793 
                                   1794 ;       CMOVE   ( b1 b2 u -- )
                                   1795 ;       Copy u bytes from b1 to b2.
      00886C 88 54                 1796         .word      LINK
                           0007EE  1797 LINK = . 
      00886E 05                    1798         .byte      5
      00886F 43 4D 4F 56 45        1799         .ascii     "CMOVE"
      008874                       1800 CMOVE:
      008874 CD 82 55         [ 4] 1801         CALL	TOR
      008877 CD 81 A7         [ 4] 1802         CALL	BRAN
      00887A 88 94                 1803         .word	CMOV2
      00887C CD 82 55         [ 4] 1804 CMOV1:	CALL	TOR
      00887F CD 82 8C         [ 4] 1805         CALL	DUPP
      008882 CD 82 03         [ 4] 1806         CALL	CAT
      008885 CD 82 49         [ 4] 1807         CALL	RAT
      008888 CD 81 F2         [ 4] 1808         CALL	CSTOR
      00888B CD 87 06         [ 4] 1809         CALL	ONEP
      00888E CD 82 36         [ 4] 1810         CALL	RFROM
      008891 CD 87 06         [ 4] 1811         CALL	ONEP
      008894 CD 81 71         [ 4] 1812 CMOV2:	CALL	DONXT
      008897 88 7C                 1813         .word	CMOV1
      008899 CC 84 07         [ 2] 1814         JP	DDROP
                                   1815 
                                   1816 ;       FILL    ( b u c -- )
                                   1817 ;       Fill u bytes of character c
                                   1818 ;       to area beginning at b.
      00889C 88 6E                 1819         .word       LINK
                           00081E  1820 LINK = . 
      00889E 04                    1821         .byte       4
      00889F 46 49 4C 4C           1822         .ascii     "FILL"
      0088A3                       1823 FILL:
                           000001  1824 .if CONVERT_TO_CODE
      0088A3 90 93            [ 1] 1825         ldw y,x 
      0088A5 90 E6 01         [ 1] 1826         ld a,(1,y) ; c 
      0088A8 1C 00 02         [ 2] 1827         addw x,#CELLL ; drop c 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      0088AB 90 93            [ 1] 1828         ldw y,x 
      0088AD 90 FE            [ 2] 1829         ldw y,(y) ; count
      0088AF 90 89            [ 2] 1830         pushw y 
      0088B1 1C 00 02         [ 2] 1831         addw x,#CELLL ; drop u 
      0088B4 90 93            [ 1] 1832         ldw y,x 
      0088B6 1C 00 02         [ 2] 1833         addw x,#CELLL ; drop b 
      0088B9 90 FE            [ 2] 1834         ldw y,(y) ; address
      0088BB 90 BF 1C         [ 2] 1835         ldw YTEMP,y
      0088BE 90 85            [ 2] 1836         popw y ; count 
      0088C0                       1837 FILL1:  
      0088C0 92 C7 1C         [ 4] 1838         ld [YTEMP],a 
      0088C3 3C 1D            [ 1] 1839         inc YTEMP+1
      0088C5 24 02            [ 1] 1840         jrnc FILL2 
      0088C7 3C 1C            [ 1] 1841         inc YTEMP
      0088C9                       1842 FILL2: 
      0088C9 90 5A            [ 2] 1843         decw y ; count 
      0088CB 26 F3            [ 1] 1844         jrne FILL1  
      0088CD 81               [ 4] 1845         ret 
                           000000  1846 .else 
                                   1847         CALL	SWAPP
                                   1848         CALL	TOR
                                   1849         CALL	SWAPP
                                   1850         CALL	BRAN
                                   1851         .word	FILL2
                                   1852 FILL1:	CALL	DDUP
                                   1853         CALL	CSTOR
                                   1854         CALL	ONEP
                                   1855 FILL2:	CALL	DONXT
                                   1856         .word	FILL1
                                   1857         JP	DDROP
                                   1858 .endif
                                   1859 
                                   1860 ;       ERASE   ( b u -- )
                                   1861 ;       Erase u bytes beginning at b.
      0088CE 88 9E                 1862         .word      LINK
                           000850  1863 LINK = . 
      0088D0 05                    1864         .byte      5
      0088D1 45 52 41 53 45        1865         .ascii     "ERASE"
      0088D6                       1866 ERASE:
                           000001  1867 .if CONVERT_TO_CODE
      0088D6 90 5F            [ 1] 1868         clrw y 
      0088D8 1D 00 02         [ 2] 1869         subw x,#CELLL 
      0088DB FF               [ 2] 1870         ldw (x),y 
      0088DC CC 88 A3         [ 2] 1871         jp FILL 
                           000000  1872 .else 
                                   1873         CALL     ZERO
                                   1874         JP     FILL
                                   1875 .endif 
                                   1876 ;       PACK0x   ( b u a -- a )
                                   1877 ;       Build a counted string with
                                   1878 ;       u characters from b. Null fill.
      0088DF 88 D0                 1879         .word      LINK
                           000861  1880 LINK = . 
      0088E1 05                    1881         .byte      5
      0088E2 50 41 43 4B 30 58     1882         .ascii     "PACK0X"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      0088E8                       1883 PACKS:
      0088E8 CD 82 8C         [ 4] 1884         CALL     DUPP
      0088EB CD 82 55         [ 4] 1885         CALL     TOR     ;strings only on cell boundary
      0088EE CD 84 12         [ 4] 1886         CALL     DDUP
      0088F1 CD 81 F2         [ 4] 1887         CALL     CSTOR
      0088F4 CD 87 06         [ 4] 1888         CALL     ONEP ;save count
      0088F7 CD 82 9C         [ 4] 1889         CALL     SWAPP
      0088FA CD 88 74         [ 4] 1890         CALL     CMOVE
      0088FD CD 82 36         [ 4] 1891         CALL     RFROM
      008900 81               [ 4] 1892         RET
                                   1893 
                                   1894 ;; Numeric output, single precision
                                   1895 
                                   1896 ;       DIGIT   ( u -- c )
                                   1897 ;       Convert digit u to a character.
      008901 88 E1                 1898         .word      LINK
                           000883  1899 LINK = . 
      008903 05                    1900         .byte      5
      008904 44 49 47 49 54        1901         .ascii     "DIGIT"
      008909                       1902 DIGIT:
      008909 CD 81 5D         [ 4] 1903         CALL	DOLIT
      00890C 00 09                 1904         .word	9
      00890E CD 82 B6         [ 4] 1905         CALL	OVER
      008911 CD 84 EA         [ 4] 1906         CALL	LESS
      008914 CD 81 5D         [ 4] 1907         CALL	DOLIT
      008917 00 07                 1908         .word	7
      008919 CD 82 D8         [ 4] 1909         CALL	ANDD
      00891C CD 84 27         [ 4] 1910         CALL	PLUS
      00891F CD 81 5D         [ 4] 1911         CALL	DOLIT
      008922 00 30                 1912         .word	48	;'0'
      008924 CC 84 27         [ 2] 1913         JP	PLUS
                                   1914 
                                   1915 ;       EXTRACT ( n base -- n c )
                                   1916 ;       Extract least significant digit from n.
      008927 89 03                 1917         .word      LINK
                           0008A9  1918 LINK = . 
      008929 07                    1919         .byte      7
      00892A 45 58 54 52 41 43 54  1920         .ascii     "EXTRACT"
      008931                       1921 EXTRC:
      008931 CD 87 3A         [ 4] 1922         CALL     ZERO
      008934 CD 82 9C         [ 4] 1923         CALL     SWAPP
      008937 CD 85 62         [ 4] 1924         CALL     UMMOD
      00893A CD 82 9C         [ 4] 1925         CALL     SWAPP
      00893D CC 89 09         [ 2] 1926         JP     DIGIT
                                   1927 
                                   1928 ;       <#      ( -- )
                                   1929 ;       Initiate  numeric output process.
      008940 89 29                 1930         .word      LINK
                           0008C2  1931 LINK = . 
      008942 02                    1932         .byte      2
      008943 3C 23                 1933         .ascii     "<#"
      008945                       1934 BDIGS:
      008945 CD 88 38         [ 4] 1935         CALL     PAD
      008948 CD 83 95         [ 4] 1936         CALL     HLD
      00894B CC 81 CE         [ 2] 1937         JP     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                                   1938 
                                   1939 ;       HOLD    ( c -- )
                                   1940 ;       Insert a character into output string.
      00894E 89 42                 1941         .word      LINK
                           0008D0  1942 LINK = . 
      008950 04                    1943         .byte      4
      008951 48 4F 4C 44           1944         .ascii     "HOLD"
      008955                       1945 HOLD:
      008955 CD 83 95         [ 4] 1946         CALL     HLD
      008958 CD 81 E5         [ 4] 1947         CALL     AT
      00895B CD 87 13         [ 4] 1948         CALL     ONEM
      00895E CD 82 8C         [ 4] 1949         CALL     DUPP
      008961 CD 83 95         [ 4] 1950         CALL     HLD
      008964 CD 81 CE         [ 4] 1951         CALL     STORE
      008967 CC 81 F2         [ 2] 1952         JP     CSTOR
                                   1953 
                                   1954 ;       #       ( u -- u )
                                   1955 ;       Extract one digit from u and
                                   1956 ;       append digit to output string.
      00896A 89 50                 1957         .word      LINK
                           0008EC  1958 LINK = . 
      00896C 01                    1959         .byte      1
      00896D 23                    1960         .ascii     "#"
      00896E                       1961 DIG:
      00896E CD 83 47         [ 4] 1962         CALL     BASE
      008971 CD 81 E5         [ 4] 1963         CALL     AT
      008974 CD 89 31         [ 4] 1964         CALL     EXTRC
      008977 CC 89 55         [ 2] 1965         JP     HOLD
                                   1966 
                                   1967 ;       #S      ( u -- 0 )
                                   1968 ;       Convert u until all digits
                                   1969 ;       are added to output string.
      00897A 89 6C                 1970         .word      LINK
                           0008FC  1971 LINK = . 
      00897C 02                    1972         .byte      2
      00897D 23 53                 1973         .ascii     "#S"
      00897F                       1974 DIGS:
      00897F CD 89 6E         [ 4] 1975 DIGS1:  CALL     DIG
      008982 CD 82 8C         [ 4] 1976         CALL     DUPP
      008985 CD 81 90         [ 4] 1977         CALL     QBRAN
      008988 89 8C                 1978         .word      DIGS2
      00898A 20 F3            [ 2] 1979         JRA     DIGS1
      00898C 81               [ 4] 1980 DIGS2:  RET
                                   1981 
                                   1982 ;       SIGN    ( n -- )
                                   1983 ;       Add a minus sign to
                                   1984 ;       numeric output string.
      00898D 89 7C                 1985         .word      LINK
                           00090F  1986 LINK = . 
      00898F 04                    1987         .byte      4
      008990 53 49 47 4E           1988         .ascii     "SIGN"
      008994                       1989 SIGN:
      008994 CD 82 C5         [ 4] 1990         CALL     ZLESS
      008997 CD 81 90         [ 4] 1991         CALL     QBRAN
      00899A 89 A4                 1992         .word      SIGN1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      00899C CD 81 5D         [ 4] 1993         CALL     DOLIT
      00899F 00 2D                 1994         .word      45	;"-"
      0089A1 CC 89 55         [ 2] 1995         JP     HOLD
      0089A4 81               [ 4] 1996 SIGN1:  RET
                                   1997 
                                   1998 ;       #>      ( w -- b u )
                                   1999 ;       Prepare output string.
      0089A5 89 8F                 2000         .word      LINK
                           000927  2001 LINK = . 
      0089A7 02                    2002         .byte      2
      0089A8 23 3E                 2003         .ascii     "#>"
      0089AA                       2004 EDIGS:
      0089AA CD 82 82         [ 4] 2005         CALL     DROP
      0089AD CD 83 95         [ 4] 2006         CALL     HLD
      0089B0 CD 81 E5         [ 4] 2007         CALL     AT
      0089B3 CD 88 38         [ 4] 2008         CALL     PAD
      0089B6 CD 82 B6         [ 4] 2009         CALL     OVER
      0089B9 CC 84 85         [ 2] 2010         JP     SUBB
                                   2011 
                                   2012 ;       str     ( w -- b u )
                                   2013 ;       Convert a signed integer
                                   2014 ;       to a numeric string.
      0089BC 89 A7                 2015         .word      LINK
                           00093E  2016 LINK = . 
      0089BE 03                    2017         .byte      3
      0089BF 53 54 52              2018         .ascii     "STR"
      0089C2                       2019 STR:
      0089C2 CD 82 8C         [ 4] 2020         CALL     DUPP
      0089C5 CD 82 55         [ 4] 2021         CALL     TOR
      0089C8 CD 84 9F         [ 4] 2022         CALL     ABSS
      0089CB CD 89 45         [ 4] 2023         CALL     BDIGS
      0089CE CD 89 7F         [ 4] 2024         CALL     DIGS
      0089D1 CD 82 36         [ 4] 2025         CALL     RFROM
      0089D4 CD 89 94         [ 4] 2026         CALL     SIGN
      0089D7 CC 89 AA         [ 2] 2027         JP     EDIGS
                                   2028 
                                   2029 ;       HEX     ( -- )
                                   2030 ;       Use radix 16 as base for
                                   2031 ;       numeric conversions.
      0089DA 89 BE                 2032         .word      LINK
                           00095C  2033 LINK = . 
      0089DC 03                    2034         .byte      3
      0089DD 48 45 58              2035         .ascii     "HEX"
      0089E0                       2036 HEX:
      0089E0 CD 81 5D         [ 4] 2037         CALL     DOLIT
      0089E3 00 10                 2038         .word      16
      0089E5 CD 83 47         [ 4] 2039         CALL     BASE
      0089E8 CC 81 CE         [ 2] 2040         JP     STORE
                                   2041 
                                   2042 ;       DECIMAL ( -- )
                                   2043 ;       Use radix 10 as base
                                   2044 ;       for numeric conversions.
      0089EB 89 DC                 2045         .word      LINK
                           00096D  2046 LINK = . 
      0089ED 07                    2047         .byte      7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      0089EE 44 45 43 49 4D 41 4C  2048         .ascii     "DECIMAL"
      0089F5                       2049 DECIM:
      0089F5 CD 81 5D         [ 4] 2050         CALL     DOLIT
      0089F8 00 0A                 2051         .word      10
      0089FA CD 83 47         [ 4] 2052         CALL     BASE
      0089FD CC 81 CE         [ 2] 2053         JP     STORE
                                   2054 
                                   2055 ;; Numeric input, single precision
                                   2056 
                                   2057 ;       DIGIT?  ( c base -- u t )
                                   2058 ;       Convert a character to its numeric
                                   2059 ;       value. A flag indicates success.
      008A00 89 ED                 2060         .word      LINK
                           000982  2061 LINK = . 
      008A02 06                    2062         .byte       6
      008A03 44 49 47 49 54 3F     2063         .ascii     "DIGIT?"
      008A09                       2064 DIGTQ:
      008A09 CD 82 55         [ 4] 2065         CALL     TOR
      008A0C CD 81 5D         [ 4] 2066         CALL     DOLIT
      008A0F 00 30                 2067         .word     48	; "0"
      008A11 CD 84 85         [ 4] 2068         CALL     SUBB
      008A14 CD 81 5D         [ 4] 2069         CALL     DOLIT
      008A17 00 09                 2070         .word      9
      008A19 CD 82 B6         [ 4] 2071         CALL     OVER
      008A1C CD 84 EA         [ 4] 2072         CALL     LESS
      008A1F CD 81 90         [ 4] 2073         CALL     QBRAN
      008A22 8A 3A                 2074         .word      DGTQ1
      008A24 CD 81 5D         [ 4] 2075         CALL     DOLIT
      008A27 00 07                 2076         .word      7
      008A29 CD 84 85         [ 4] 2077         CALL     SUBB
      008A2C CD 82 8C         [ 4] 2078         CALL     DUPP
      008A2F CD 81 5D         [ 4] 2079         CALL     DOLIT
      008A32 00 0A                 2080         .word      10
      008A34 CD 84 EA         [ 4] 2081         CALL     LESS
      008A37 CD 82 EC         [ 4] 2082         CALL     ORR
      008A3A CD 82 8C         [ 4] 2083 DGTQ1:  CALL     DUPP
      008A3D CD 82 36         [ 4] 2084         CALL     RFROM
      008A40 CC 84 CC         [ 2] 2085         JP     ULESS
                                   2086 
                                   2087 ;       NUMBER? ( a -- n T | a F )
                                   2088 ;       Convert a number string to
                                   2089 ;       integer. Push a flag on tos.
      008A43 8A 02                 2090         .word      LINK
                           0009C5  2091 LINK = . 
      008A45 07                    2092         .byte      7
      008A46 4E 55 4D 42 45 52 3F  2093         .ascii     "NUMBER?"
      008A4D                       2094 NUMBQ:
      008A4D CD 83 47         [ 4] 2095         CALL     BASE
      008A50 CD 81 E5         [ 4] 2096         CALL     AT
      008A53 CD 82 55         [ 4] 2097         CALL     TOR
      008A56 CD 87 3A         [ 4] 2098         CALL     ZERO
      008A59 CD 82 B6         [ 4] 2099         CALL     OVER
      008A5C CD 88 10         [ 4] 2100         CALL     COUNT
      008A5F CD 82 B6         [ 4] 2101         CALL     OVER
      008A62 CD 82 03         [ 4] 2102         CALL     CAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008A65 CD 81 5D         [ 4] 2103         CALL     DOLIT
      008A68 00 24                 2104         .word     36	; "0x"
      008A6A CD 84 AD         [ 4] 2105         CALL     EQUAL
      008A6D CD 81 90         [ 4] 2106         CALL     QBRAN
      008A70 8A 81                 2107         .word      NUMQ1
      008A72 CD 89 E0         [ 4] 2108         CALL     HEX
      008A75 CD 82 9C         [ 4] 2109         CALL     SWAPP
      008A78 CD 87 06         [ 4] 2110         CALL     ONEP
      008A7B CD 82 9C         [ 4] 2111         CALL     SWAPP
      008A7E CD 87 13         [ 4] 2112         CALL     ONEM
      008A81 CD 82 B6         [ 4] 2113 NUMQ1:  CALL     OVER
      008A84 CD 82 03         [ 4] 2114         CALL     CAT
      008A87 CD 81 5D         [ 4] 2115         CALL     DOLIT
      008A8A 00 2D                 2116         .word     45	; "-"
      008A8C CD 84 AD         [ 4] 2117         CALL     EQUAL
      008A8F CD 82 55         [ 4] 2118         CALL     TOR
      008A92 CD 82 9C         [ 4] 2119         CALL     SWAPP
      008A95 CD 82 49         [ 4] 2120         CALL     RAT
      008A98 CD 84 85         [ 4] 2121         CALL     SUBB
      008A9B CD 82 9C         [ 4] 2122         CALL     SWAPP
      008A9E CD 82 49         [ 4] 2123         CALL     RAT
      008AA1 CD 84 27         [ 4] 2124         CALL     PLUS
      008AA4 CD 83 D6         [ 4] 2125         CALL     QDUP
      008AA7 CD 81 90         [ 4] 2126         CALL     QBRAN
      008AAA 8B 0B                 2127         .word      NUMQ6
      008AAC CD 87 13         [ 4] 2128         CALL     ONEM
      008AAF CD 82 55         [ 4] 2129         CALL     TOR
      008AB2 CD 82 8C         [ 4] 2130 NUMQ2:  CALL     DUPP
      008AB5 CD 82 55         [ 4] 2131         CALL     TOR
      008AB8 CD 82 03         [ 4] 2132         CALL     CAT
      008ABB CD 83 47         [ 4] 2133         CALL     BASE
      008ABE CD 81 E5         [ 4] 2134         CALL     AT
      008AC1 CD 8A 09         [ 4] 2135         CALL     DIGTQ
      008AC4 CD 81 90         [ 4] 2136         CALL     QBRAN
      008AC7 8A F9                 2137         .word      NUMQ4
      008AC9 CD 82 9C         [ 4] 2138         CALL     SWAPP
      008ACC CD 83 47         [ 4] 2139         CALL     BASE
      008ACF CD 81 E5         [ 4] 2140         CALL     AT
      008AD2 CD 86 85         [ 4] 2141         CALL     STAR
      008AD5 CD 84 27         [ 4] 2142         CALL     PLUS
      008AD8 CD 82 36         [ 4] 2143         CALL     RFROM
      008ADB CD 87 06         [ 4] 2144         CALL     ONEP
      008ADE CD 81 71         [ 4] 2145         CALL     DONXT
      008AE1 8A B2                 2146         .word      NUMQ2
      008AE3 CD 82 49         [ 4] 2147         CALL     RAT
      008AE6 CD 82 9C         [ 4] 2148         CALL     SWAPP
      008AE9 CD 82 82         [ 4] 2149         CALL     DROP
      008AEC CD 81 90         [ 4] 2150         CALL     QBRAN
      008AEF 8A F4                 2151         .word      NUMQ3
      008AF1 CD 84 52         [ 4] 2152         CALL     NEGAT
      008AF4 CD 82 9C         [ 4] 2153 NUMQ3:  CALL     SWAPP
      008AF7 20 0F            [ 2] 2154         JRA     NUMQ5
      008AF9 CD 82 36         [ 4] 2155 NUMQ4:  CALL     RFROM
      008AFC CD 82 36         [ 4] 2156         CALL     RFROM
      008AFF CD 84 07         [ 4] 2157         CALL     DDROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008B02 CD 84 07         [ 4] 2158         CALL     DDROP
      008B05 CD 87 3A         [ 4] 2159         CALL     ZERO
      008B08 CD 82 8C         [ 4] 2160 NUMQ5:  CALL     DUPP
      008B0B CD 82 36         [ 4] 2161 NUMQ6:  CALL     RFROM
      008B0E CD 84 07         [ 4] 2162         CALL     DDROP
      008B11 CD 82 36         [ 4] 2163         CALL     RFROM
      008B14 CD 83 47         [ 4] 2164         CALL     BASE
      008B17 CC 81 CE         [ 2] 2165         JP     STORE
                                   2166 
                                   2167 ;; Basic I/O
                                   2168 
                                   2169 ;       KEY     ( -- c )
                                   2170 ;       Wait for and return an
                                   2171 ;       input character.
      008B1A 8A 45                 2172         .word      LINK
                           000A9C  2173 LINK = . 
      008B1C 03                    2174         .byte      3
      008B1D 4B 45 59              2175         .ascii     "KEY"
      008B20                       2176 KEY:
                           000001  2177 .if CONVERT_TO_CODE
      008B20 72 0B 52 30 FB   [ 2] 2178         btjf UART1_SR,#UART_SR_RXNE,. 
      008B25 C6 52 31         [ 1] 2179         ld a,UART1_DR 
      008B28 1D 00 02         [ 2] 2180         subw x,#CELLL 
      008B2B E7 01            [ 1] 2181         ld (1,x),a 
      008B2D 7F               [ 1] 2182         clr (x)
      008B2E 81               [ 4] 2183         ret 
                           000000  2184 .else 
                                   2185 KEY1:   CALL     QKEY
                                   2186         CALL     QBRAN
                                   2187         .word      KEY1
                                   2188         RET
                                   2189 .endif 
                                   2190 
                                   2191 ;       NUF?    ( -- t )
                                   2192 ;       Return false if no input,
                                   2193 ;       else pause and if CR return true.
      008B2F 8B 1C                 2194         .word      LINK
                           000AB1  2195 LINK = . 
      008B31 04                    2196         .byte      4
      008B32 4E 55 46 3F           2197         .ascii     "NUF?"
      008B36                       2198 NUFQ:
      008B36 CD 81 29         [ 4] 2199         CALL     QKEY
      008B39 CD 82 8C         [ 4] 2200         CALL     DUPP
      008B3C CD 81 90         [ 4] 2201         CALL     QBRAN
      008B3F 8B 4F                 2202         .word    NUFQ1
      008B41 CD 84 07         [ 4] 2203         CALL     DDROP
      008B44 CD 8B 20         [ 4] 2204         CALL     KEY
      008B47 CD 81 5D         [ 4] 2205         CALL     DOLIT
      008B4A 00 0D                 2206         .word      CRR
      008B4C CC 84 AD         [ 2] 2207         JP     EQUAL
      008B4F 81               [ 4] 2208 NUFQ1:  RET
                                   2209 
                                   2210 ;       SPACE   ( -- )
                                   2211 ;       Send  blank character to
                                   2212 ;       output device.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008B50 8B 31                 2213         .word      LINK
                           000AD2  2214 LINK = . 
      008B52 05                    2215         .byte      5
      008B53 53 50 41 43 45        2216         .ascii     "SPACE"
      008B58                       2217 SPACE:
      008B58 CD 87 2D         [ 4] 2218         CALL     BLANK
      008B5B CC 81 47         [ 2] 2219         JP     EMIT
                                   2220 
                                   2221 ;       SPACES  ( +n -- )
                                   2222 ;       Send n spaces to output device.
      008B5E 8B 52                 2223         .word      LINK
                           000AE0  2224 LINK = . 
      008B60 06                    2225         .byte      6
      008B61 53 50 41 43 45 53     2226         .ascii     "SPACES"
      008B67                       2227 SPACS:
      008B67 CD 87 3A         [ 4] 2228         CALL     ZERO
      008B6A CD 85 0A         [ 4] 2229         CALL     MAX
      008B6D CD 82 55         [ 4] 2230         CALL     TOR
      008B70 20 03            [ 2] 2231         JRA      CHAR2
      008B72 CD 8B 58         [ 4] 2232 CHAR1:  CALL     SPACE
      008B75 CD 81 71         [ 4] 2233 CHAR2:  CALL     DONXT
      008B78 8B 72                 2234         .word    CHAR1
      008B7A 81               [ 4] 2235         RET
                                   2236 
                                   2237 ;       TYPE    ( b u -- )
                                   2238 ;       Output u characters from b.
      008B7B 8B 60                 2239         .word      LINK
                           000AFD  2240 LINK = . 
      008B7D 04                    2241         .byte      4
      008B7E 54 59 50 45           2242         .ascii     "TYPE"
      008B82                       2243 TYPES:
      008B82 CD 82 55         [ 4] 2244         CALL     TOR
      008B85 20 0C            [ 2] 2245         JRA     TYPE2
      008B87 CD 82 8C         [ 4] 2246 TYPE1:  CALL     DUPP
      008B8A CD 82 03         [ 4] 2247         CALL     CAT
      008B8D CD 81 47         [ 4] 2248         CALL     EMIT
      008B90 CD 87 06         [ 4] 2249         CALL     ONEP
      008B93 CD 81 71         [ 4] 2250 TYPE2:  CALL     DONXT
      008B96 8B 87                 2251         .word      TYPE1
      008B98 CC 82 82         [ 2] 2252         JP     DROP
                                   2253 
                                   2254 ;       CR      ( -- )
                                   2255 ;       Output a carriage return
                                   2256 ;       and a line feed.
      008B9B 8B 7D                 2257         .word      LINK
                           000B1D  2258 LINK = . 
      008B9D 02                    2259         .byte      2
      008B9E 43 52                 2260         .ascii     "CR"
      008BA0                       2261 CR:
      008BA0 CD 81 5D         [ 4] 2262         CALL     DOLIT
      008BA3 00 0D                 2263         .word      CRR
      008BA5 CD 81 47         [ 4] 2264         CALL     EMIT
      008BA8 CD 81 5D         [ 4] 2265         CALL     DOLIT
      008BAB 00 0A                 2266         .word      LF
      008BAD CC 81 47         [ 2] 2267         JP     EMIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   2268 
                                   2269 ;       do$     ( -- a )
                                   2270 ;       Return  address of a compiled
                                   2271 ;       string.
      008BB0 8B 9D                 2272         .word      LINK
                           000B32  2273 LINK = . 
      008BB2 43                    2274 	.byte      COMPO+3
      008BB3 44 4F 24              2275         .ascii     "DO$"
      008BB6                       2276 DOSTR:
      008BB6 CD 82 36         [ 4] 2277         CALL     RFROM
      008BB9 CD 82 49         [ 4] 2278         CALL     RAT
      008BBC CD 82 36         [ 4] 2279         CALL     RFROM
      008BBF CD 88 10         [ 4] 2280         CALL     COUNT
      008BC2 CD 84 27         [ 4] 2281         CALL     PLUS
      008BC5 CD 82 55         [ 4] 2282         CALL     TOR
      008BC8 CD 82 9C         [ 4] 2283         CALL     SWAPP
      008BCB CD 82 55         [ 4] 2284         CALL     TOR
      008BCE 81               [ 4] 2285         RET
                                   2286 
                                   2287 ;       $"|     ( -- a )
                                   2288 ;       Run time routine compiled by $".
                                   2289 ;       Return address of a compiled string.
      008BCF 8B B2                 2290         .word      LINK
                           000B51  2291 LINK = . 
      008BD1 43                    2292 	.byte      COMPO+3
      008BD2 24 22 7C              2293         .byte     '$','"','|'
      008BD5                       2294 STRQP:
      008BD5 CD 8B B6         [ 4] 2295         CALL     DOSTR
      008BD8 81               [ 4] 2296         RET
                                   2297 
                                   2298 ;       ."|     ( -- )
                                   2299 ;       Run time routine of ." .
                                   2300 ;       Output a compiled string.
      008BD9 8B D1                 2301         .word      LINK
                           000B5B  2302 LINK = . 
      008BDB 43                    2303 	.byte      COMPO+3
      008BDC 2E 22 7C              2304         .byte     '.','"','|'
      008BDF                       2305 DOTQP:
      008BDF CD 8B B6         [ 4] 2306         CALL     DOSTR
      008BE2 CD 88 10         [ 4] 2307         CALL     COUNT
      008BE5 CC 8B 82         [ 2] 2308         JP     TYPES
                                   2309 
                                   2310 ;       .R      ( n +n -- )
                                   2311 ;       Display an integer in a field
                                   2312 ;       of n columns, right justified.
      008BE8 8B DB                 2313         .word      LINK
                           000B6A  2314 LINK = . 
      008BEA 02                    2315         .byte      2
      008BEB 2E 52                 2316         .ascii     ".R"
      008BED                       2317 DOTR:
      008BED CD 82 55         [ 4] 2318         CALL     TOR
      008BF0 CD 89 C2         [ 4] 2319         CALL     STR
      008BF3 CD 82 36         [ 4] 2320         CALL     RFROM
      008BF6 CD 82 B6         [ 4] 2321         CALL     OVER
      008BF9 CD 84 85         [ 4] 2322         CALL     SUBB
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008BFC CD 8B 67         [ 4] 2323         CALL     SPACS
      008BFF CC 8B 82         [ 2] 2324         JP     TYPES
                                   2325 
                                   2326 ;       U.R     ( u +n -- )
                                   2327 ;       Display an unsigned integer
                                   2328 ;       in n column, right justified.
      008C02 8B EA                 2329         .word      LINK
                           000B84  2330 LINK = . 
      008C04 03                    2331         .byte      3
      008C05 55 2E 52              2332         .ascii     "U.R"
      008C08                       2333 UDOTR:
      008C08 CD 82 55         [ 4] 2334         CALL     TOR
      008C0B CD 89 45         [ 4] 2335         CALL     BDIGS
      008C0E CD 89 7F         [ 4] 2336         CALL     DIGS
      008C11 CD 89 AA         [ 4] 2337         CALL     EDIGS
      008C14 CD 82 36         [ 4] 2338         CALL     RFROM
      008C17 CD 82 B6         [ 4] 2339         CALL     OVER
      008C1A CD 84 85         [ 4] 2340         CALL     SUBB
      008C1D CD 8B 67         [ 4] 2341         CALL     SPACS
      008C20 CC 8B 82         [ 2] 2342         JP     TYPES
                                   2343 
                                   2344 ;       U.      ( u -- )
                                   2345 ;       Display an unsigned integer
                                   2346 ;       in free format.
      008C23 8C 04                 2347         .word      LINK
                           000BA5  2348 LINK = . 
      008C25 02                    2349         .byte      2
      008C26 55 2E                 2350         .ascii     "U."
      008C28                       2351 UDOT:
      008C28 CD 89 45         [ 4] 2352         CALL     BDIGS
      008C2B CD 89 7F         [ 4] 2353         CALL     DIGS
      008C2E CD 89 AA         [ 4] 2354         CALL     EDIGS
      008C31 CD 8B 58         [ 4] 2355         CALL     SPACE
      008C34 CC 8B 82         [ 2] 2356         JP     TYPES
                                   2357 
                                   2358 ;       .       ( w -- )
                                   2359 ;       Display an integer in free
                                   2360 ;       format, preceeded by a space.
      008C37 8C 25                 2361         .word      LINK
                           000BB9  2362 LINK = . 
      008C39 01                    2363         .byte      1
      008C3A 2E                    2364         .ascii     "."
      008C3B                       2365 DOT:
      008C3B CD 83 47         [ 4] 2366         CALL     BASE
      008C3E CD 81 E5         [ 4] 2367         CALL     AT
      008C41 CD 81 5D         [ 4] 2368         CALL     DOLIT
      008C44 00 0A                 2369         .word      10
      008C46 CD 83 01         [ 4] 2370         CALL     XORR    ;?decimal
      008C49 CD 81 90         [ 4] 2371         CALL     QBRAN
      008C4C 8C 51                 2372         .word      DOT1
      008C4E CC 8C 28         [ 2] 2373         JP     UDOT
      008C51 CD 89 C2         [ 4] 2374 DOT1:   CALL     STR
      008C54 CD 8B 58         [ 4] 2375         CALL     SPACE
      008C57 CC 8B 82         [ 2] 2376         JP     TYPES
                                   2377 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                                   2378 ;       ?       ( a -- )
                                   2379 ;       Display contents in memory cell.
      008C5A 8C 39                 2380         .word      LINK
                                   2381         
                           000BDC  2382 LINK = . 
      008C5C 01                    2383         .byte      1
      008C5D 3F                    2384         .ascii     "?"
      008C5E                       2385 QUEST:
      008C5E CD 81 E5         [ 4] 2386         CALL     AT
      008C61 CC 8C 3B         [ 2] 2387         JP     DOT
                                   2388 
                                   2389 ;; Parsing
                                   2390 
                                   2391 ;       parse   ( b u c -- b u delta ; <string> )
                                   2392 ;       Scan string delimited by c.
                                   2393 ;       Return found string and its offset.
      008C64 8C 5C                 2394         .word      LINK
                           000BE6  2395 LINK = . 
      008C66 05                    2396         .byte      5
      008C67 70 61 72 73 65        2397         .ascii     "parse"
      008C6C                       2398 PARS:
      008C6C CD 83 56         [ 4] 2399         CALL     TEMP
      008C6F CD 81 CE         [ 4] 2400         CALL     STORE
      008C72 CD 82 B6         [ 4] 2401         CALL     OVER
      008C75 CD 82 55         [ 4] 2402         CALL     TOR
      008C78 CD 82 8C         [ 4] 2403         CALL     DUPP
      008C7B CD 81 90         [ 4] 2404         CALL     QBRAN
      008C7E 8D 24                 2405         .word    PARS8
      008C80 CD 87 13         [ 4] 2406         CALL     ONEM
      008C83 CD 83 56         [ 4] 2407         CALL     TEMP
      008C86 CD 81 E5         [ 4] 2408         CALL     AT
      008C89 CD 87 2D         [ 4] 2409         CALL     BLANK
      008C8C CD 84 AD         [ 4] 2410         CALL     EQUAL
      008C8F CD 81 90         [ 4] 2411         CALL     QBRAN
      008C92 8C C5                 2412         .word      PARS3
      008C94 CD 82 55         [ 4] 2413         CALL     TOR
      008C97 CD 87 2D         [ 4] 2414 PARS1:  CALL     BLANK
      008C9A CD 82 B6         [ 4] 2415         CALL     OVER
      008C9D CD 82 03         [ 4] 2416         CALL     CAT     ;skip leading blanks ONLY
      008CA0 CD 84 85         [ 4] 2417         CALL     SUBB
      008CA3 CD 82 C5         [ 4] 2418         CALL     ZLESS
      008CA6 CD 84 41         [ 4] 2419         CALL     INVER
      008CA9 CD 81 90         [ 4] 2420         CALL     QBRAN
      008CAC 8C C2                 2421         .word      PARS2
      008CAE CD 87 06         [ 4] 2422         CALL     ONEP
      008CB1 CD 81 71         [ 4] 2423         CALL     DONXT
      008CB4 8C 97                 2424         .word      PARS1
      008CB6 CD 82 36         [ 4] 2425         CALL     RFROM
      008CB9 CD 82 82         [ 4] 2426         CALL     DROP
      008CBC CD 87 3A         [ 4] 2427         CALL     ZERO
      008CBF CC 82 8C         [ 2] 2428         JP     DUPP
      008CC2 CD 82 36         [ 4] 2429 PARS2:  CALL     RFROM
      008CC5 CD 82 B6         [ 4] 2430 PARS3:  CALL     OVER
      008CC8 CD 82 9C         [ 4] 2431         CALL     SWAPP
      008CCB CD 82 55         [ 4] 2432         CALL     TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008CCE CD 83 56         [ 4] 2433 PARS4:  CALL     TEMP
      008CD1 CD 81 E5         [ 4] 2434         CALL     AT
      008CD4 CD 82 B6         [ 4] 2435         CALL     OVER
      008CD7 CD 82 03         [ 4] 2436         CALL     CAT
      008CDA CD 84 85         [ 4] 2437         CALL     SUBB    ;scan for delimiter
      008CDD CD 83 56         [ 4] 2438         CALL     TEMP
      008CE0 CD 81 E5         [ 4] 2439         CALL     AT
      008CE3 CD 87 2D         [ 4] 2440         CALL     BLANK
      008CE6 CD 84 AD         [ 4] 2441         CALL     EQUAL
      008CE9 CD 81 90         [ 4] 2442         CALL     QBRAN
      008CEC 8C F1                 2443         .word      PARS5
      008CEE CD 82 C5         [ 4] 2444         CALL     ZLESS
      008CF1 CD 81 90         [ 4] 2445 PARS5:  CALL     QBRAN
      008CF4 8D 06                 2446         .word      PARS6
      008CF6 CD 87 06         [ 4] 2447         CALL     ONEP
      008CF9 CD 81 71         [ 4] 2448         CALL     DONXT
      008CFC 8C CE                 2449         .word      PARS4
      008CFE CD 82 8C         [ 4] 2450         CALL     DUPP
      008D01 CD 82 55         [ 4] 2451         CALL     TOR
      008D04 20 0F            [ 2] 2452         JRA     PARS7
      008D06 CD 82 36         [ 4] 2453 PARS6:  CALL     RFROM
      008D09 CD 82 82         [ 4] 2454         CALL     DROP
      008D0C CD 82 8C         [ 4] 2455         CALL     DUPP
      008D0F CD 87 06         [ 4] 2456         CALL     ONEP
      008D12 CD 82 55         [ 4] 2457         CALL     TOR
      008D15 CD 82 B6         [ 4] 2458 PARS7:  CALL     OVER
      008D18 CD 84 85         [ 4] 2459         CALL     SUBB
      008D1B CD 82 36         [ 4] 2460         CALL     RFROM
      008D1E CD 82 36         [ 4] 2461         CALL     RFROM
      008D21 CC 84 85         [ 2] 2462         JP     SUBB
      008D24 CD 82 B6         [ 4] 2463 PARS8:  CALL     OVER
      008D27 CD 82 36         [ 4] 2464         CALL     RFROM
      008D2A CC 84 85         [ 2] 2465         JP     SUBB
                                   2466 
                                   2467 ;       PARSE   ( c -- b u ; <string> )
                                   2468 ;       Scan input stream and return
                                   2469 ;       counted string delimited by c.
      008D2D 8C 66                 2470         .word      LINK
                           000CAF  2471 LINK = . 
      008D2F 05                    2472         .byte      5
      008D30 50 41 52 53 45        2473         .ascii     "PARSE"
      008D35                       2474 PARSE:
      008D35 CD 82 55         [ 4] 2475         CALL     TOR
      008D38 CD 88 49         [ 4] 2476         CALL     TIB
      008D3B CD 83 65         [ 4] 2477         CALL     INN
      008D3E CD 81 E5         [ 4] 2478         CALL     AT
      008D41 CD 84 27         [ 4] 2479         CALL     PLUS    ;current input buffer pointer
      008D44 CD 83 75         [ 4] 2480         CALL     NTIB
      008D47 CD 81 E5         [ 4] 2481         CALL     AT
      008D4A CD 83 65         [ 4] 2482         CALL     INN
      008D4D CD 81 E5         [ 4] 2483         CALL     AT
      008D50 CD 84 85         [ 4] 2484         CALL     SUBB    ;remaining count
      008D53 CD 82 36         [ 4] 2485         CALL     RFROM
      008D56 CD 8C 6C         [ 4] 2486         CALL     PARS
      008D59 CD 83 65         [ 4] 2487         CALL     INN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008D5C CC 87 A9         [ 2] 2488         JP     PSTOR
                                   2489 
                                   2490 ;       .(      ( -- )
                                   2491 ;       Output following string up to next ) .
      008D5F 8D 2F                 2492         .word      LINK
                           000CE1  2493 LINK = . 
      008D61 82                    2494 	.byte      IMEDD+2
      008D62 2E 28                 2495         .ascii     ".("
      008D64                       2496 DOTPR:
      008D64 CD 81 5D         [ 4] 2497         CALL     DOLIT
      008D67 00 29                 2498         .word     41	; ")"
      008D69 CD 8D 35         [ 4] 2499         CALL     PARSE
      008D6C CC 8B 82         [ 2] 2500         JP     TYPES
                                   2501 
                                   2502 ;       (       ( -- )
                                   2503 ;       Ignore following string up to next ).
                                   2504 ;       A comment.
      008D6F 8D 61                 2505         .word      LINK
                           000CF1  2506 LINK = . 
      008D71 81                    2507 	.byte      IMEDD+1
      008D72 28                    2508         .ascii     "("
      008D73                       2509 PAREN:
      008D73 CD 81 5D         [ 4] 2510         CALL     DOLIT
      008D76 00 29                 2511         .word     41	; ")"
      008D78 CD 8D 35         [ 4] 2512         CALL     PARSE
      008D7B CC 84 07         [ 2] 2513         JP     DDROP
                                   2514 
                                   2515 ;       \       ( -- )
                                   2516 ;       Ignore following text till
                                   2517 ;       end of line.
      008D7E 8D 71                 2518         .word      LINK
                           000D00  2519 LINK = . 
      008D80 81                    2520 	.byte      IMEDD+1
      008D81 5C                    2521         .ascii     "\"
      008D82                       2522 BKSLA:
                           000001  2523 .if CONVERT_TO_CODE
      008D82 90 AE 00 0C      [ 2] 2524         ldw y,#RAMBASE+12 ; #TIB  
      008D86 90 FE            [ 2] 2525         ldw y,(y)
      008D88 90 89            [ 2] 2526         pushw y ; count in TIB 
      008D8A 90 AE 00 0A      [ 2] 2527         ldw y,#RAMBASE+10 ; >IN 
      008D8E 90 BF 1C         [ 2] 2528         ldw YTEMP,y
      008D91 90 85            [ 2] 2529         popw y 
      008D93 91 CF 1C         [ 5] 2530         ldw [YTEMP],y
      008D96 81               [ 4] 2531         ret 
                           000000  2532 .else
                                   2533         CALL     NTIB
                                   2534         CALL     AT
                                   2535         CALL     INN
                                   2536         JP     STORE
                                   2537 .endif 
                                   2538 
                                   2539 ;       WORD    ( c -- a ; <string> )
                                   2540 ;       Parse a word from input stream
                                   2541 ;       and copy it to code dictionary.
      008D97 8D 80                 2542         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                           000D19  2543 LINK = . 
      008D99 04                    2544         .byte      4
      008D9A 57 4F 52 44           2545         .ascii     "WORD"
      008D9E                       2546 WORDD:
      008D9E CD 8D 35         [ 4] 2547         CALL     PARSE
      008DA1 CD 88 27         [ 4] 2548         CALL     HERE
      008DA4 CD 86 DB         [ 4] 2549         CALL     CELLP
      008DA7 CC 88 E8         [ 2] 2550         JP     PACKS
                                   2551 
                                   2552 ;       TOKEN   ( -- a ; <string> )
                                   2553 ;       Parse a word from input stream
                                   2554 ;       and copy it to name dictionary.
      008DAA 8D 99                 2555         .word      LINK
                           000D2C  2556 LINK = . 
      008DAC 05                    2557         .byte      5
      008DAD 54 4F 4B 45 4E        2558         .ascii     "TOKEN"
      008DB2                       2559 TOKEN:
      008DB2 CD 87 2D         [ 4] 2560         CALL     BLANK
      008DB5 CC 8D 9E         [ 2] 2561         JP     WORDD
                                   2562 
                                   2563 ;; Dictionary search
                                   2564 
                                   2565 ;       NAME>   ( na -- ca )
                                   2566 ;       Return a code address given
                                   2567 ;       a name address.
      008DB8 8D AC                 2568         .word      LINK
                           000D3A  2569 LINK = . 
      008DBA 05                    2570         .byte      5
      008DBB 4E 41 4D 45 3E        2571         .ascii     "NAME>"
      008DC0                       2572 NAMET:
      008DC0 CD 88 10         [ 4] 2573         CALL     COUNT
      008DC3 CD 81 5D         [ 4] 2574         CALL     DOLIT
      008DC6 00 1F                 2575         .word      31
      008DC8 CD 82 D8         [ 4] 2576         CALL     ANDD
      008DCB CC 84 27         [ 2] 2577         JP     PLUS
                                   2578 
                                   2579 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   2580 ;       Compare u cells in two
                                   2581 ;       strings. Return 0 if identical.
      008DCE 8D BA                 2582         .word      LINK
                           000D50  2583 LINK = . 
      008DD0 05                    2584         .byte       5
      008DD1 53 41 4D 45 3F        2585         .ascii     "SAME?"
      008DD6                       2586 SAMEQ:
      008DD6 CD 87 13         [ 4] 2587         CALL     ONEM
      008DD9 CD 82 55         [ 4] 2588         CALL     TOR
      008DDC 20 29            [ 2] 2589         JRA     SAME2
      008DDE CD 82 B6         [ 4] 2590 SAME1:  CALL     OVER
      008DE1 CD 82 49         [ 4] 2591         CALL     RAT
      008DE4 CD 84 27         [ 4] 2592         CALL     PLUS
      008DE7 CD 82 03         [ 4] 2593         CALL     CAT
      008DEA CD 82 B6         [ 4] 2594         CALL     OVER
      008DED CD 82 49         [ 4] 2595         CALL     RAT
      008DF0 CD 84 27         [ 4] 2596         CALL     PLUS
      008DF3 CD 82 03         [ 4] 2597         CALL     CAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008DF6 CD 84 85         [ 4] 2598         CALL     SUBB
      008DF9 CD 83 D6         [ 4] 2599         CALL     QDUP
      008DFC CD 81 90         [ 4] 2600         CALL     QBRAN
      008DFF 8E 07                 2601         .word      SAME2
      008E01 CD 82 36         [ 4] 2602         CALL     RFROM
      008E04 CC 82 82         [ 2] 2603         JP     DROP
      008E07 CD 81 71         [ 4] 2604 SAME2:  CALL     DONXT
      008E0A 8D DE                 2605         .word      SAME1
      008E0C CC 87 3A         [ 2] 2606         JP     ZERO
                                   2607 
                                   2608 ;       find    ( a va -- ca na | a F )
                                   2609 ;       Search vocabulary for string.
                                   2610 ;       Return ca and na if succeeded.
      008E0F 8D D0                 2611         .word      LINK
                           000D91  2612 LINK = . 
      008E11 04                    2613         .byte      4
      008E12 46 49 4E 44           2614         .ascii     "FIND"
      008E16                       2615 FIND:
      008E16 CD 82 9C         [ 4] 2616         CALL     SWAPP
      008E19 CD 82 8C         [ 4] 2617         CALL     DUPP
      008E1C CD 82 03         [ 4] 2618         CALL     CAT
      008E1F CD 83 56         [ 4] 2619         CALL     TEMP
      008E22 CD 81 CE         [ 4] 2620         CALL     STORE
      008E25 CD 82 8C         [ 4] 2621         CALL     DUPP
      008E28 CD 81 E5         [ 4] 2622         CALL     AT
      008E2B CD 82 55         [ 4] 2623         CALL     TOR
      008E2E CD 86 DB         [ 4] 2624         CALL     CELLP
      008E31 CD 82 9C         [ 4] 2625         CALL     SWAPP
      008E34 CD 81 E5         [ 4] 2626 FIND1:  CALL     AT
      008E37 CD 82 8C         [ 4] 2627         CALL     DUPP
      008E3A CD 81 90         [ 4] 2628         CALL     QBRAN
      008E3D 8E 73                 2629         .word      FIND6
      008E3F CD 82 8C         [ 4] 2630         CALL     DUPP
      008E42 CD 81 E5         [ 4] 2631         CALL     AT
      008E45 CD 81 5D         [ 4] 2632         CALL     DOLIT
      008E48 1F 7F                 2633         .word      MASKK
      008E4A CD 82 D8         [ 4] 2634         CALL     ANDD
      008E4D CD 82 49         [ 4] 2635         CALL     RAT
      008E50 CD 83 01         [ 4] 2636         CALL     XORR
      008E53 CD 81 90         [ 4] 2637         CALL     QBRAN
      008E56 8E 62                 2638         .word      FIND2
      008E58 CD 86 DB         [ 4] 2639         CALL     CELLP
      008E5B CD 81 5D         [ 4] 2640         CALL     DOLIT
      008E5E FF FF                 2641         .word     0xFFFF
      008E60 20 0C            [ 2] 2642         JRA     FIND3
      008E62 CD 86 DB         [ 4] 2643 FIND2:  CALL     CELLP
      008E65 CD 83 56         [ 4] 2644         CALL     TEMP
      008E68 CD 81 E5         [ 4] 2645         CALL     AT
      008E6B CD 8D D6         [ 4] 2646         CALL     SAMEQ
      008E6E CD 81 A7         [ 4] 2647 FIND3:  CALL     BRAN
      008E71 8E 82                 2648         .word      FIND4
      008E73 CD 82 36         [ 4] 2649 FIND6:  CALL     RFROM
      008E76 CD 82 82         [ 4] 2650         CALL     DROP
      008E79 CD 82 9C         [ 4] 2651         CALL     SWAPP
      008E7C CD 86 EA         [ 4] 2652         CALL     CELLM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008E7F CC 82 9C         [ 2] 2653         JP     SWAPP
      008E82 CD 81 90         [ 4] 2654 FIND4:  CALL     QBRAN
      008E85 8E 8F                 2655         .word      FIND5
      008E87 CD 86 EA         [ 4] 2656         CALL     CELLM
      008E8A CD 86 EA         [ 4] 2657         CALL     CELLM
      008E8D 20 A5            [ 2] 2658         JRA     FIND1
      008E8F CD 82 36         [ 4] 2659 FIND5:  CALL     RFROM
      008E92 CD 82 82         [ 4] 2660         CALL     DROP
      008E95 CD 82 9C         [ 4] 2661         CALL     SWAPP
      008E98 CD 82 82         [ 4] 2662         CALL     DROP
      008E9B CD 86 EA         [ 4] 2663         CALL     CELLM
      008E9E CD 82 8C         [ 4] 2664         CALL     DUPP
      008EA1 CD 8D C0         [ 4] 2665         CALL     NAMET
      008EA4 CC 82 9C         [ 2] 2666         JP     SWAPP
                                   2667 
                                   2668 ;       NAME?   ( a -- ca na | a F )
                                   2669 ;       Search vocabularies for a string.
      008EA7 8E 11                 2670         .word      LINK
                           000E29  2671 LINK = . 
      008EA9 05                    2672         .byte      5
      008EAA 4E 41 4D 45 3F        2673         .ascii     "NAME?"
      008EAF                       2674 NAMEQ:
      008EAF CD 83 A8         [ 4] 2675         CALL     CNTXT
      008EB2 CC 8E 16         [ 2] 2676         JP     FIND
                                   2677 
                                   2678 ;; Terminal response
                                   2679 
                                   2680 ;       ^H      ( bot eot cur -- bot eot cur )
                                   2681 ;       Backup cursor by one character.
      008EB5 8E A9                 2682         .word      LINK
                           000E37  2683 LINK = . 
      008EB7 02                    2684         .byte      2
      008EB8 5E 48                 2685         .ascii     "^H"
      008EBA                       2686 BKSP:
      008EBA CD 82 55         [ 4] 2687         CALL     TOR
      008EBD CD 82 B6         [ 4] 2688         CALL     OVER
      008EC0 CD 82 36         [ 4] 2689         CALL     RFROM
      008EC3 CD 82 9C         [ 4] 2690         CALL     SWAPP
      008EC6 CD 82 B6         [ 4] 2691         CALL     OVER
      008EC9 CD 83 01         [ 4] 2692         CALL     XORR
      008ECC CD 81 90         [ 4] 2693         CALL     QBRAN
      008ECF 8E EA                 2694         .word      BACK1
      008ED1 CD 81 5D         [ 4] 2695         CALL     DOLIT
      008ED4 00 08                 2696         .word      BKSPP
      008ED6 CD 81 47         [ 4] 2697         CALL     EMIT
      008ED9 CD 87 13         [ 4] 2698         CALL     ONEM
      008EDC CD 87 2D         [ 4] 2699         CALL     BLANK
      008EDF CD 81 47         [ 4] 2700         CALL     EMIT
      008EE2 CD 81 5D         [ 4] 2701         CALL     DOLIT
      008EE5 00 08                 2702         .word      BKSPP
      008EE7 CC 81 47         [ 2] 2703         JP     EMIT
      008EEA 81               [ 4] 2704 BACK1:  RET
                                   2705 
                                   2706 ;       TAP     ( bot eot cur c -- bot eot cur )
                                   2707 ;       Accept and echo key stroke
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                   2708 ;       and bump cursor.
      008EEB 8E B7                 2709         .word      LINK
                           000E6D  2710 LINK = . 
      008EED 03                    2711         .byte      3
      008EEE 54 41 50              2712         .ascii     "TAP"
      008EF1                       2713 TAP:
      008EF1 CD 82 8C         [ 4] 2714         CALL     DUPP
      008EF4 CD 81 47         [ 4] 2715         CALL     EMIT
      008EF7 CD 82 B6         [ 4] 2716         CALL     OVER
      008EFA CD 81 F2         [ 4] 2717         CALL     CSTOR
      008EFD CC 87 06         [ 2] 2718         JP     ONEP
                                   2719 
                                   2720 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   2721 ;       Process a key stroke,
                                   2722 ;       CR or backspace.
      008F00 8E ED                 2723         .word      LINK
                           000E82  2724 LINK = . 
      008F02 04                    2725         .byte      4
      008F03 4B 54 41 50           2726         .ascii     "KTAP"
      008F07                       2727 KTAP:
      008F07 CD 82 8C         [ 4] 2728         CALL     DUPP
      008F0A CD 81 5D         [ 4] 2729         CALL     DOLIT
      008F0D 00 0D                 2730         .word      CRR
      008F0F CD 83 01         [ 4] 2731         CALL     XORR
      008F12 CD 81 90         [ 4] 2732         CALL     QBRAN
      008F15 8F 2D                 2733         .word      KTAP2
      008F17 CD 81 5D         [ 4] 2734         CALL     DOLIT
      008F1A 00 08                 2735         .word      BKSPP
      008F1C CD 83 01         [ 4] 2736         CALL     XORR
      008F1F CD 81 90         [ 4] 2737         CALL     QBRAN
      008F22 8F 2A                 2738         .word      KTAP1
      008F24 CD 87 2D         [ 4] 2739         CALL     BLANK
      008F27 CC 8E F1         [ 2] 2740         JP     TAP
      008F2A CC 8E BA         [ 2] 2741 KTAP1:  JP     BKSP
      008F2D CD 82 82         [ 4] 2742 KTAP2:  CALL     DROP
      008F30 CD 82 9C         [ 4] 2743         CALL     SWAPP
      008F33 CD 82 82         [ 4] 2744         CALL     DROP
      008F36 CC 82 8C         [ 2] 2745         JP     DUPP
                                   2746 
                                   2747 ;       accept  ( b u -- b u )
                                   2748 ;       Accept characters to input
                                   2749 ;       buffer. Return with actual count.
      008F39 8F 02                 2750         .word      LINK
                           000EBB  2751 LINK = . 
      008F3B 06                    2752         .byte      6
      008F3C 41 43 43 45 50 54     2753         .ascii     "ACCEPT"
      008F42                       2754 ACCEP:
      008F42 CD 82 B6         [ 4] 2755         CALL     OVER
      008F45 CD 84 27         [ 4] 2756         CALL     PLUS
      008F48 CD 82 B6         [ 4] 2757         CALL     OVER
      008F4B CD 84 12         [ 4] 2758 ACCP1:  CALL     DDUP
      008F4E CD 83 01         [ 4] 2759         CALL     XORR
      008F51 CD 81 90         [ 4] 2760         CALL     QBRAN
      008F54 8F 76                 2761         .word      ACCP4
      008F56 CD 8B 20         [ 4] 2762         CALL     KEY
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008F59 CD 82 8C         [ 4] 2763         CALL     DUPP
      008F5C CD 87 2D         [ 4] 2764         CALL     BLANK
      008F5F CD 81 5D         [ 4] 2765         CALL     DOLIT
      008F62 00 7F                 2766         .word      127
      008F64 CD 85 47         [ 4] 2767         CALL     WITHI
      008F67 CD 81 90         [ 4] 2768         CALL     QBRAN
      008F6A 8F 71                 2769         .word      ACCP2
      008F6C CD 8E F1         [ 4] 2770         CALL     TAP
      008F6F 20 03            [ 2] 2771         JRA     ACCP3
      008F71 CD 8F 07         [ 4] 2772 ACCP2:  CALL     KTAP
      008F74 20 D5            [ 2] 2773 ACCP3:  JRA     ACCP1
      008F76 CD 82 82         [ 4] 2774 ACCP4:  CALL     DROP
      008F79 CD 82 B6         [ 4] 2775         CALL     OVER
      008F7C CC 84 85         [ 2] 2776         JP     SUBB
                                   2777 
                                   2778 ;       QUERY   ( -- )
                                   2779 ;       Accept input stream to
                                   2780 ;       terminal input buffer.
      008F7F 8F 3B                 2781         .word      LINK
                                   2782         
                           000F01  2783 LINK = . 
      008F81 05                    2784         .byte      5
      008F82 51 55 45 52 59        2785         .ascii     "QUERY"
      008F87                       2786 QUERY:
      008F87 CD 88 49         [ 4] 2787         CALL     TIB
      008F8A CD 81 5D         [ 4] 2788         CALL     DOLIT
      008F8D 00 50                 2789         .word      80
      008F8F CD 8F 42         [ 4] 2790         CALL     ACCEP
      008F92 CD 83 75         [ 4] 2791         CALL     NTIB
      008F95 CD 81 CE         [ 4] 2792         CALL     STORE
      008F98 CD 82 82         [ 4] 2793         CALL     DROP
      008F9B CD 87 3A         [ 4] 2794         CALL     ZERO
      008F9E CD 83 65         [ 4] 2795         CALL     INN
      008FA1 CC 81 CE         [ 2] 2796         JP     STORE
                                   2797 
                                   2798 ;       ABORT   ( -- )
                                   2799 ;       Reset data stack and
                                   2800 ;       jump to QUIT.
      008FA4 8F 81                 2801         .word      LINK
                           000F26  2802 LINK = . 
      008FA6 05                    2803         .byte      5
      008FA7 41 42 4F 52 54        2804         .ascii     "ABORT"
      008FAC                       2805 ABORT:
      008FAC CD 90 A3         [ 4] 2806         CALL     PRESE
      008FAF CC 90 C0         [ 2] 2807         JP     QUIT
                                   2808 
                                   2809 ;       abort"  ( f -- )
                                   2810 ;       Run time routine of ABORT".
                                   2811 ;       Abort with a message.
      008FB2 8F A6                 2812         .word      LINK
                           000F34  2813 LINK = . 
      008FB4 46                    2814 	.byte      COMPO+6
      008FB5 41 42 4F 52 54        2815         .ascii     "ABORT"
      008FBA 22                    2816         .byte      '"'
      008FBB                       2817 ABORQ:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008FBB CD 81 90         [ 4] 2818         CALL     QBRAN
      008FBE 8F DA                 2819         .word      ABOR2   ;text flag
      008FC0 CD 8B B6         [ 4] 2820         CALL     DOSTR
      008FC3 CD 8B 58         [ 4] 2821 ABOR1:  CALL     SPACE
      008FC6 CD 88 10         [ 4] 2822         CALL     COUNT
      008FC9 CD 8B 82         [ 4] 2823         CALL     TYPES
      008FCC CD 81 5D         [ 4] 2824         CALL     DOLIT
      008FCF 00 3F                 2825         .word     63 ; "?"
      008FD1 CD 81 47         [ 4] 2826         CALL     EMIT
      008FD4 CD 8B A0         [ 4] 2827         CALL     CR
      008FD7 CC 8F AC         [ 2] 2828         JP     ABORT   ;pass error string
      008FDA CD 8B B6         [ 4] 2829 ABOR2:  CALL     DOSTR
      008FDD CC 82 82         [ 2] 2830         JP     DROP
                                   2831 
                                   2832 ;; The text interpreter
                                   2833 
                                   2834 ;       $INTERPRET      ( a -- )
                                   2835 ;       Interpret a word. If failed,
                                   2836 ;       try to convert it to an integer.
      008FE0 8F B4                 2837         .word      LINK
                           000F62  2838 LINK = . 
      008FE2 0A                    2839         .byte      10
      008FE3 24 49 4E 54 45 52 50  2840         .ascii     "$INTERPRET"
             52 45 54
      008FED                       2841 INTER:
      008FED CD 8E AF         [ 4] 2842         CALL     NAMEQ
      008FF0 CD 83 D6         [ 4] 2843         CALL     QDUP    ;?defined
      008FF3 CD 81 90         [ 4] 2844         CALL     QBRAN
      008FF6 90 17                 2845         .word      INTE1
      008FF8 CD 81 E5         [ 4] 2846         CALL     AT
      008FFB CD 81 5D         [ 4] 2847         CALL     DOLIT
      008FFE 40 00                 2848 	.word       0x4000	; COMPO*256
      009000 CD 82 D8         [ 4] 2849         CALL     ANDD    ;?compile only lexicon bits
      009003 CD 8F BB         [ 4] 2850         CALL     ABORQ
      009006 0D                    2851         .byte      13
      009007 20 63 6F 6D 70 69 6C  2852         .ascii     " compile only"
             65 20 6F 6E 6C 79
      009014 CC 81 B7         [ 2] 2853         JP     EXECU
      009017 CD 8A 4D         [ 4] 2854 INTE1:  CALL     NUMBQ   ;convert a number
      00901A CD 81 90         [ 4] 2855         CALL     QBRAN
      00901D 8F C3                 2856         .word    ABOR1
      00901F 81               [ 4] 2857         RET
                                   2858 
                                   2859 ;       [       ( -- )
                                   2860 ;       Start  text interpreter.
      009020 8F E2                 2861         .word      LINK
                           000FA2  2862 LINK = . 
      009022 81                    2863 	.byte      IMEDD+1
      009023 5B                    2864         .ascii     "["
      009024                       2865 LBRAC:
      009024 CD 81 5D         [ 4] 2866         CALL     DOLIT
      009027 8F ED                 2867         .word      INTER
      009029 CD 83 86         [ 4] 2868         CALL     TEVAL
      00902C CC 81 CE         [ 2] 2869         JP     STORE
                                   2870 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2871 ;       .OK     ( -- )
                                   2872 ;       Display 'ok' while interpreting.
      00902F 90 22                 2873         .word      LINK
                           000FB1  2874 LINK = . 
      009031 03                    2875         .byte      3
      009032 2E 4F 4B              2876         .ascii     ".OK"
      009035                       2877 DOTOK:
      009035 CD 81 5D         [ 4] 2878         CALL     DOLIT
      009038 8F ED                 2879         .word      INTER
      00903A CD 83 86         [ 4] 2880         CALL     TEVAL
      00903D CD 81 E5         [ 4] 2881         CALL     AT
      009040 CD 84 AD         [ 4] 2882         CALL     EQUAL
      009043 CD 81 90         [ 4] 2883         CALL     QBRAN
      009046 90 4F                 2884         .word      DOTO1
      009048 CD 8B DF         [ 4] 2885         CALL     DOTQP
      00904B 03                    2886         .byte      3
      00904C 20 6F 6B              2887         .ascii     " ok"
      00904F CC 8B A0         [ 2] 2888 DOTO1:  JP     CR
                                   2889 
                                   2890 ;       ?STACK  ( -- )
                                   2891 ;       Abort if stack underflows.
      009052 90 31                 2892         .word      LINK
                           000FD4  2893 LINK = . 
      009054 06                    2894         .byte      6
      009055 3F 53 54 41 43 4B     2895         .ascii     "?STACK"
      00905B                       2896 QSTAC: 
      00905B CD 87 7D         [ 4] 2897         CALL     DEPTH
      00905E CD 82 C5         [ 4] 2898         CALL     ZLESS   ;check only for underflow
      009061 CD 8F BB         [ 4] 2899         CALL     ABORQ
      009064 0B                    2900         .byte      11
      009065 20 75 6E 64 65 72 66  2901         .ascii     " underflow "
             6C 6F 77 20
      009070 81               [ 4] 2902         RET
                                   2903 
                                   2904 ;       EVAL    ( -- )
                                   2905 ;       Interpret  input stream.
      009071 90 54                 2906         .word      LINK
                           000FF3  2907 LINK = . 
      009073 04                    2908         .byte      4
      009074 45 56 41 4C           2909         .ascii     "EVAL"
      009078                       2910 EVAL:
      009078 CD 8D B2         [ 4] 2911 EVAL1:  CALL     TOKEN
      00907B CD 82 8C         [ 4] 2912         CALL     DUPP
      00907E CD 82 03         [ 4] 2913         CALL     CAT     ;?input stream empty
      009081 CD 81 90         [ 4] 2914         CALL     QBRAN
      009084 90 94                 2915         .word    EVAL2
      009086 CD 83 86         [ 4] 2916         CALL     TEVAL
      009089 CD 88 5D         [ 4] 2917         CALL     ATEXE
      00908C CD 90 5B         [ 4] 2918         CALL     QSTAC   ;evaluate input, check stack
      00908F CD 81 A7         [ 4] 2919         CALL     BRAN
      009092 90 78                 2920         .word    EVAL1
      009094 CD 82 82         [ 4] 2921 EVAL2:  CALL     DROP
      009097 CC 90 35         [ 2] 2922         JP       DOTOK
                                   2923 
                                   2924 ;       PRESET  ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2925 ;       Reset data stack pointer and
                                   2926 ;       terminal input buffer.
      00909A 90 73                 2927         .word      LINK
                           00101C  2928 LINK = . 
      00909C 06                    2929         .byte      6
      00909D 50 52 45 53 45 54     2930         .ascii     "PRESET"
      0090A3                       2931 PRESE:
      0090A3 CD 81 5D         [ 4] 2932         CALL     DOLIT
      0090A6 16 F0                 2933         .word      SPP
      0090A8 CD 82 79         [ 4] 2934         CALL     SPSTO
      0090AB CD 81 5D         [ 4] 2935         CALL     DOLIT
      0090AE 17 00                 2936         .word      TIBB
      0090B0 CD 83 75         [ 4] 2937         CALL     NTIB
      0090B3 CD 86 DB         [ 4] 2938         CALL     CELLP
      0090B6 CC 81 CE         [ 2] 2939         JP     STORE
                                   2940 
                                   2941 ;       QUIT    ( -- )
                                   2942 ;       Reset return stack pointer
                                   2943 ;       and start text interpreter.
      0090B9 90 9C                 2944         .word      LINK
                           00103B  2945 LINK = . 
      0090BB 04                    2946         .byte      4
      0090BC 51 55 49 54           2947         .ascii     "QUIT"
      0090C0                       2948 QUIT:
      0090C0 CD 81 5D         [ 4] 2949         CALL     DOLIT
      0090C3 17 FF                 2950         .word      RPP
      0090C5 CD 82 20         [ 4] 2951         CALL     RPSTO   ;reset return stack pointer
      0090C8 CD 90 24         [ 4] 2952 QUIT1:  CALL     LBRAC   ;start interpretation
      0090CB CD 8F 87         [ 4] 2953 QUIT2:  CALL     QUERY   ;get input
      0090CE CD 90 78         [ 4] 2954         CALL     EVAL
      0090D1 20 F8            [ 2] 2955         JRA     QUIT2   ;continue till error
                                   2956 
                                   2957 ;; The compiler
                                   2958 
                                   2959 ;       '       ( -- ca )
                                   2960 ;       Search vocabularies for
                                   2961 ;       next word in input stream.
      0090D3 90 BB                 2962         .word      LINK
                           001055  2963 LINK = . 
      0090D5 01                    2964         .byte      1
      0090D6 27                    2965         .ascii     "'"
      0090D7                       2966 TICK:
      0090D7 CD 8D B2         [ 4] 2967         CALL     TOKEN
      0090DA CD 8E AF         [ 4] 2968         CALL     NAMEQ   ;?defined
      0090DD CD 81 90         [ 4] 2969         CALL     QBRAN
      0090E0 8F C3                 2970         .word      ABOR1
      0090E2 81               [ 4] 2971         RET     ;yes, push code address
                                   2972 
                                   2973 ;       ALLOT   ( n -- )
                                   2974 ;       Allocate n bytes to  code dictionary.
      0090E3 90 D5                 2975         .word      LINK
                           001065  2976 LINK = . 
      0090E5 05                    2977         .byte      5
      0090E6 41 4C 4C 4F 54        2978         .ascii     "ALLOT"
      0090EB                       2979 ALLOT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      0090EB CD 83 B6         [ 4] 2980         CALL     CPP
      0090EE CC 87 A9         [ 2] 2981         JP     PSTOR
                                   2982 
                                   2983 ;       ,       ( w -- )
                                   2984 ;         Compile an integer into
                                   2985 ;         code dictionary.
      0090F1 90 E5                 2986         .word      LINK
                           001073  2987 LINK = . 
      0090F3 01                    2988         .byte      1
      0090F4 2C                    2989         .ascii     ","
      0090F5                       2990 COMMA:
      0090F5 CD 88 27         [ 4] 2991         CALL     HERE
      0090F8 CD 82 8C         [ 4] 2992         CALL     DUPP
      0090FB CD 86 DB         [ 4] 2993         CALL     CELLP   ;cell boundary
      0090FE CD 83 B6         [ 4] 2994         CALL     CPP
      009101 CD 81 CE         [ 4] 2995         CALL     STORE
      009104 CC 81 CE         [ 2] 2996         JP     STORE
                                   2997 
                                   2998 ;       C,      ( c -- )
                                   2999 ;       Compile a byte into
                                   3000 ;       code dictionary.
      009107 90 F3                 3001        .word      LINK
                           001089  3002 LINK = . 
      009109 02                    3003         .byte      2
      00910A 43 2C                 3004         .ascii     "C,"
      00910C                       3005 CCOMMA:
      00910C CD 88 27         [ 4] 3006         CALL     HERE
      00910F CD 82 8C         [ 4] 3007         CALL     DUPP
      009112 CD 87 06         [ 4] 3008         CALL     ONEP
      009115 CD 83 B6         [ 4] 3009         CALL     CPP
      009118 CD 81 CE         [ 4] 3010         CALL     STORE
      00911B CC 81 F2         [ 2] 3011         JP     CSTOR
                                   3012 
                                   3013 ;       [COMPILE]       ( -- ; <string> )
                                   3014 ;       Compile next immediate
                                   3015 ;       word into code dictionary.
      00911E 91 09                 3016         .word      LINK
                           0010A0  3017 LINK = . 
      009120 89                    3018 	.byte      IMEDD+9
      009121 5B 43 4F 4D 50 49 4C  3019         .ascii     "[COMPILE]"
             45 5D
      00912A                       3020 BCOMP:
      00912A CD 90 D7         [ 4] 3021         CALL     TICK
      00912D CC 93 86         [ 2] 3022         JP     JSRC
                                   3023 
                                   3024 ;       COMPILE ( -- )
                                   3025 ;       Compile next jsr in
                                   3026 ;       colon list to code dictionary.
      009130 91 20                 3027         .word      LINK
                           0010B2  3028 LINK = . 
      009132 47                    3029 	.byte      COMPO+7
      009133 43 4F 4D 50 49 4C 45  3030         .ascii     "COMPILE"
      00913A                       3031 COMPI:
      00913A CD 82 36         [ 4] 3032         CALL     RFROM
      00913D CD 87 06         [ 4] 3033         CALL     ONEP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      009140 CD 82 8C         [ 4] 3034         CALL     DUPP
      009143 CD 81 E5         [ 4] 3035         CALL     AT
      009146 CD 93 86         [ 4] 3036         CALL     JSRC    ;compile subroutine
      009149 CD 86 DB         [ 4] 3037         CALL     CELLP
      00914C CC 82 55         [ 2] 3038         JP     TOR
                                   3039 
                                   3040 ;       LITERAL ( w -- )
                                   3041 ;       Compile tos to dictionary
                                   3042 ;       as an integer literal.
      00914F 91 32                 3043         .word      LINK
                           0010D1  3044 LINK = . 
      009151 87                    3045 	.byte      IMEDD+7
      009152 4C 49 54 45 52 41 4C  3046         .ascii     "LITERAL"
      009159                       3047 LITER:
      009159 CD 91 3A         [ 4] 3048         CALL     COMPI
      00915C CD 81 5D         [ 4] 3049         CALL     DOLIT
      00915F CC 90 F5         [ 2] 3050         JP     COMMA
                                   3051 
                                   3052 ;       $,"     ( -- )
                                   3053 ;       Compile a literal string
                                   3054 ;       up to next " .
      009162 91 51                 3055         .word      LINK
                           0010E4  3056 LINK = . 
      009164 03                    3057         .byte      3
      009165 24 2C 22              3058         .byte     '$',',','"'
      009168                       3059 STRCQ:
      009168 CD 81 5D         [ 4] 3060         CALL     DOLIT
      00916B 00 22                 3061         .word     34	; "
      00916D CD 8D 35         [ 4] 3062         CALL     PARSE
      009170 CD 88 27         [ 4] 3063         CALL     HERE
      009173 CD 88 E8         [ 4] 3064         CALL     PACKS   ;string to code dictionary
      009176 CD 88 10         [ 4] 3065         CALL     COUNT
      009179 CD 84 27         [ 4] 3066         CALL     PLUS    ;calculate aligned end of string
      00917C CD 83 B6         [ 4] 3067         CALL     CPP
      00917F CC 81 CE         [ 2] 3068         JP     STORE
                                   3069 
                                   3070 ;; Structures
                                   3071 
                                   3072 ;       FOR     ( -- a )
                                   3073 ;       Start a FOR-NEXT loop
                                   3074 ;       structure in a colon definition.
      009182 91 64                 3075         .word      LINK
                           001104  3076 LINK = . 
      009184 83                    3077 	.byte      IMEDD+3
      009185 46 4F 52              3078         .ascii     "FOR"
      009188                       3079 FOR:
      009188 CD 91 3A         [ 4] 3080         CALL     COMPI
      00918B CD 82 55         [ 4] 3081         CALL     TOR
      00918E CC 88 27         [ 2] 3082         JP     HERE
                                   3083 
                                   3084 ;       NEXT    ( a -- )
                                   3085 ;       Terminate a FOR-NEXT loop.
      009191 91 84                 3086         .word      LINK
                           001113  3087 LINK = . 
      009193 84                    3088 	.byte      IMEDD+4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009194 4E 45 58 54           3089         .ascii     "NEXT"
      009198                       3090 NEXT:
      009198 CD 91 3A         [ 4] 3091         CALL     COMPI
      00919B CD 81 71         [ 4] 3092         CALL     DONXT
      00919E CC 90 F5         [ 2] 3093         JP     COMMA
                                   3094 
                                   3095 ;       BEGIN   ( -- a )
                                   3096 ;       Start an infinite or
                                   3097 ;       indefinite loop structure.
      0091A1 91 93                 3098         .word      LINK
                           001123  3099 LINK = . 
      0091A3 85                    3100 	.byte      IMEDD+5
      0091A4 42 45 47 49 4E        3101         .ascii     "BEGIN"
      0091A9                       3102 BEGIN:
      0091A9 CC 88 27         [ 2] 3103         JP     HERE
                                   3104 
                                   3105 ;       UNTIL   ( a -- )
                                   3106 ;       Terminate a BEGIN-UNTIL
                                   3107 ;       indefinite loop structure.
      0091AC 91 A3                 3108         .word      LINK
                           00112E  3109 LINK = . 
      0091AE 85                    3110 	.byte      IMEDD+5
      0091AF 55 4E 54 49 4C        3111         .ascii     "UNTIL"
      0091B4                       3112 UNTIL:
      0091B4 CD 91 3A         [ 4] 3113         CALL     COMPI
      0091B7 CD 81 90         [ 4] 3114         CALL     QBRAN
      0091BA CC 90 F5         [ 2] 3115         JP     COMMA
                                   3116 
                                   3117 ;       AGAIN   ( a -- )
                                   3118 ;       Terminate a BEGIN-AGAIN
                                   3119 ;       infinite loop structure.
      0091BD 91 AE                 3120         .word      LINK
                           00113F  3121 LINK = . 
      0091BF 85                    3122 	.byte      IMEDD+5
      0091C0 41 47 41 49 4E        3123         .ascii     "AGAIN"
      0091C5                       3124 AGAIN:
      0091C5 CD 91 3A         [ 4] 3125         CALL     COMPI
      0091C8 CD 81 A7         [ 4] 3126         CALL     BRAN
      0091CB CC 90 F5         [ 2] 3127         JP     COMMA
                                   3128 
                                   3129 ;       IF      ( -- A )
                                   3130 ;       Begin a conditional branch.
      0091CE 91 BF                 3131         .word      LINK
                           001150  3132 LINK = . 
      0091D0 82                    3133 	.byte      IMEDD+2
      0091D1 49 46                 3134         .ascii     "IF"
      0091D3                       3135 IFF:
      0091D3 CD 91 3A         [ 4] 3136         CALL     COMPI
      0091D6 CD 81 90         [ 4] 3137         CALL     QBRAN
      0091D9 CD 88 27         [ 4] 3138         CALL     HERE
      0091DC CD 87 3A         [ 4] 3139         CALL     ZERO
      0091DF CC 90 F5         [ 2] 3140         JP     COMMA
                                   3141 
                                   3142 ;       THEN        ( A -- )
                                   3143 ;       Terminate a conditional branch structure.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0091E2 91 D0                 3144         .word      LINK
                           001164  3145 LINK = . 
      0091E4 84                    3146 	.byte      IMEDD+4
      0091E5 54 48 45 4E           3147         .ascii     "THEN"
      0091E9                       3148 THENN:
      0091E9 CD 88 27         [ 4] 3149         CALL     HERE
      0091EC CD 82 9C         [ 4] 3150         CALL     SWAPP
      0091EF CC 81 CE         [ 2] 3151         JP     STORE
                                   3152 
                                   3153 ;       ELSE        ( A -- A )
                                   3154 ;       Start the false clause in an IF-ELSE-THEN structure.
      0091F2 91 E4                 3155         .word      LINK
                           001174  3156 LINK = . 
      0091F4 84                    3157 	.byte      IMEDD+4
      0091F5 45 4C 53 45           3158         .ascii     "ELSE"
      0091F9                       3159 ELSEE:
      0091F9 CD 91 3A         [ 4] 3160         CALL     COMPI
      0091FC CD 81 A7         [ 4] 3161         CALL     BRAN
      0091FF CD 88 27         [ 4] 3162         CALL     HERE
      009202 CD 87 3A         [ 4] 3163         CALL     ZERO
      009205 CD 90 F5         [ 4] 3164         CALL     COMMA
      009208 CD 82 9C         [ 4] 3165         CALL     SWAPP
      00920B CD 88 27         [ 4] 3166         CALL     HERE
      00920E CD 82 9C         [ 4] 3167         CALL     SWAPP
      009211 CC 81 CE         [ 2] 3168         JP     STORE
                                   3169 
                                   3170 ;       AHEAD       ( -- A )
                                   3171 ;       Compile a forward branch instruction.
      009214 91 F4                 3172         .word      LINK
                           001196  3173 LINK = . 
      009216 85                    3174 	.byte      IMEDD+5
      009217 41 48 45 41 44        3175         .ascii     "AHEAD"
      00921C                       3176 AHEAD:
      00921C CD 91 3A         [ 4] 3177         CALL     COMPI
      00921F CD 81 A7         [ 4] 3178         CALL     BRAN
      009222 CD 88 27         [ 4] 3179         CALL     HERE
      009225 CD 87 3A         [ 4] 3180         CALL     ZERO
      009228 CC 90 F5         [ 2] 3181         JP     COMMA
                                   3182 
                                   3183 ;       WHILE       ( a -- A a )
                                   3184 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      00922B 92 16                 3185         .word      LINK
                           0011AD  3186 LINK = . 
      00922D 85                    3187 	.byte      IMEDD+5
      00922E 57 48 49 4C 45        3188         .ascii     "WHILE"
      009233                       3189 WHILE:
      009233 CD 91 3A         [ 4] 3190         CALL     COMPI
      009236 CD 81 90         [ 4] 3191         CALL     QBRAN
      009239 CD 88 27         [ 4] 3192         CALL     HERE
      00923C CD 87 3A         [ 4] 3193         CALL     ZERO
      00923F CD 90 F5         [ 4] 3194         CALL     COMMA
      009242 CC 82 9C         [ 2] 3195         JP     SWAPP
                                   3196 
                                   3197 ;       REPEAT      ( A a -- )
                                   3198 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      009245 92 2D                 3199         .word      LINK
                           0011C7  3200 LINK = . 
      009247 86                    3201         .byte      IMEDD+6
      009248 52 45 50 45 41 54     3202         .ascii     "REPEAT"
      00924E                       3203 REPEA:
      00924E CD 91 3A         [ 4] 3204         CALL     COMPI
      009251 CD 81 A7         [ 4] 3205         CALL     BRAN
      009254 CD 90 F5         [ 4] 3206         CALL     COMMA
      009257 CD 88 27         [ 4] 3207         CALL     HERE
      00925A CD 82 9C         [ 4] 3208         CALL     SWAPP
      00925D CC 81 CE         [ 2] 3209         JP     STORE
                                   3210 
                                   3211 ;       AFT         ( a -- a A )
                                   3212 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      009260 92 47                 3213         .word      LINK
                           0011E2  3214 LINK = . 
      009262 83                    3215 	.byte      IMEDD+3
      009263 41 46 54              3216         .ascii     "AFT"
      009266                       3217 AFT:
      009266 CD 82 82         [ 4] 3218         CALL     DROP
      009269 CD 92 1C         [ 4] 3219         CALL     AHEAD
      00926C CD 88 27         [ 4] 3220         CALL     HERE
      00926F CC 82 9C         [ 2] 3221         JP     SWAPP
                                   3222 
                                   3223 ;       ABORT"      ( -- ; <string> )
                                   3224 ;       Conditional abort with an error message.
      009272 92 62                 3225         .word      LINK
                           0011F4  3226 LINK = . 
      009274 86                    3227 	.byte      IMEDD+6
      009275 41 42 4F 52 54        3228         .ascii     "ABORT"
      00927A 22                    3229         .byte      '"'
      00927B                       3230 ABRTQ:
      00927B CD 91 3A         [ 4] 3231         CALL     COMPI
      00927E CD 8F BB         [ 4] 3232         CALL     ABORQ
      009281 CC 91 68         [ 2] 3233         JP     STRCQ
                                   3234 
                                   3235 ;       $"     ( -- ; <string> )
                                   3236 ;       Compile an inline string literal.
      009284 92 74                 3237         .word      LINK
                           001206  3238 LINK = . 
      009286 82                    3239 	.byte      IMEDD+2
      009287 24 22                 3240         .byte     '$','"'
      009289                       3241 STRQ:
      009289 CD 91 3A         [ 4] 3242         CALL     COMPI
      00928C CD 8B D5         [ 4] 3243         CALL     STRQP
      00928F CC 91 68         [ 2] 3244         JP     STRCQ
                                   3245 
                                   3246 ;       ."          ( -- ; <string> )
                                   3247 ;       Compile an inline string literal to be typed out at run time.
      009292 92 86                 3248         .word      LINK
                           001214  3249 LINK = . 
      009294 82                    3250 	.byte      IMEDD+2
      009295 2E 22                 3251         .byte     '.','"'
      009297                       3252 DOTQ:
      009297 CD 91 3A         [ 4] 3253         CALL     COMPI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      00929A CD 8B DF         [ 4] 3254         CALL     DOTQP
      00929D CC 91 68         [ 2] 3255         JP     STRCQ
                                   3256 
                                   3257 ;; Name compiler
                                   3258 
                                   3259 ;       ?UNIQUE ( a -- a )
                                   3260 ;       Display a warning message
                                   3261 ;       if word already exists.
      0092A0 92 94                 3262         .word      LINK
                           001222  3263 LINK = . 
      0092A2 07                    3264         .byte      7
      0092A3 3F 55 4E 49 51 55 45  3265         .ascii     "?UNIQUE"
      0092AA                       3266 UNIQU:
      0092AA CD 82 8C         [ 4] 3267         CALL     DUPP
      0092AD CD 8E AF         [ 4] 3268         CALL     NAMEQ   ;?name exists
      0092B0 CD 81 90         [ 4] 3269         CALL     QBRAN
      0092B3 92 C9                 3270         .word      UNIQ1
      0092B5 CD 8B DF         [ 4] 3271         CALL     DOTQP   ;redef are OK
      0092B8 07                    3272         .byte       7
      0092B9 20 72 65 44 65 66 20  3273         .ascii     " reDef "       
      0092C0 CD 82 B6         [ 4] 3274         CALL     OVER
      0092C3 CD 88 10         [ 4] 3275         CALL     COUNT
      0092C6 CD 8B 82         [ 4] 3276         CALL     TYPES   ;just in case
      0092C9 CC 82 82         [ 2] 3277 UNIQ1:  JP     DROP
                                   3278 
                                   3279 ;       $,n     ( na -- )
                                   3280 ;       Build a new dictionary name
                                   3281 ;       using string at na.
      0092CC 92 A2                 3282         .word      LINK
                           00124E  3283 LINK = . 
      0092CE 03                    3284         .byte      3
      0092CF 24 2C 6E              3285         .ascii     "$,n"
      0092D2                       3286 SNAME:
      0092D2 CD 82 8C         [ 4] 3287         CALL     DUPP
      0092D5 CD 82 03         [ 4] 3288         CALL     CAT     ;?null input
      0092D8 CD 81 90         [ 4] 3289         CALL     QBRAN
      0092DB 93 08                 3290         .word      PNAM1
      0092DD CD 92 AA         [ 4] 3291         CALL     UNIQU   ;?redefinition
      0092E0 CD 82 8C         [ 4] 3292         CALL     DUPP
      0092E3 CD 88 10         [ 4] 3293         CALL     COUNT
      0092E6 CD 84 27         [ 4] 3294         CALL     PLUS
      0092E9 CD 83 B6         [ 4] 3295         CALL     CPP
      0092EC CD 81 CE         [ 4] 3296         CALL     STORE
      0092EF CD 82 8C         [ 4] 3297         CALL     DUPP
      0092F2 CD 83 C6         [ 4] 3298         CALL     LAST
      0092F5 CD 81 CE         [ 4] 3299         CALL     STORE   ;save na for vocabulary link
      0092F8 CD 86 EA         [ 4] 3300         CALL     CELLM   ;link address
      0092FB CD 83 A8         [ 4] 3301         CALL     CNTXT
      0092FE CD 81 E5         [ 4] 3302         CALL     AT
      009301 CD 82 9C         [ 4] 3303         CALL     SWAPP
      009304 CD 81 CE         [ 4] 3304         CALL     STORE
      009307 81               [ 4] 3305         RET     ;save code pointer
      009308 CD 8B D5         [ 4] 3306 PNAM1:  CALL     STRQP
      00930B 05                    3307         .byte      5
      00930C 20 6E 61 6D 65        3308         .ascii     " name" ;null input
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      009311 CC 8F C3         [ 2] 3309         JP     ABOR1
                                   3310 
                                   3311 ;; FORTH compiler
                                   3312 
                                   3313 ;       $COMPILE        ( a -- )
                                   3314 ;       Compile next word to
                                   3315 ;       dictionary as a token or literal.
      009314 92 CE                 3316         .word      LINK
                           001296  3317 LINK = . 
      009316 08                    3318         .byte      8
      009317 24 43 4F 4D 50 49 4C  3319         .ascii     "$COMPILE"
             45
      00931F                       3320 SCOMP:
      00931F CD 8E AF         [ 4] 3321         CALL     NAMEQ
      009322 CD 83 D6         [ 4] 3322         CALL     QDUP    ;?defined
      009325 CD 81 90         [ 4] 3323         CALL     QBRAN
      009328 93 40                 3324         .word      SCOM2
      00932A CD 81 E5         [ 4] 3325         CALL     AT
      00932D CD 81 5D         [ 4] 3326         CALL     DOLIT
      009330 80 00                 3327         .word     0x8000	;  IMEDD*256
      009332 CD 82 D8         [ 4] 3328         CALL     ANDD    ;?immediate
      009335 CD 81 90         [ 4] 3329         CALL     QBRAN
      009338 93 3D                 3330         .word      SCOM1
      00933A CC 81 B7         [ 2] 3331         JP     EXECU
      00933D CC 93 86         [ 2] 3332 SCOM1:  JP     JSRC
      009340 CD 8A 4D         [ 4] 3333 SCOM2:  CALL     NUMBQ   ;try to convert to number
      009343 CD 81 90         [ 4] 3334         CALL     QBRAN
      009346 8F C3                 3335         .word      ABOR1
      009348 CC 91 59         [ 2] 3336         JP     LITER
                                   3337 
                                   3338 ;       OVERT   ( -- )
                                   3339 ;       Link a new word into vocabulary.
      00934B 93 16                 3340         .word      LINK
                           0012CD  3341 LINK = . 
      00934D 05                    3342         .byte      5
      00934E 4F 56 45 52 54        3343         .ascii     "OVERT"
      009353                       3344 OVERT:
      009353 CD 83 C6         [ 4] 3345         CALL     LAST
      009356 CD 81 E5         [ 4] 3346         CALL     AT
      009359 CD 83 A8         [ 4] 3347         CALL     CNTXT
      00935C CC 81 CE         [ 2] 3348         JP     STORE
                                   3349 
                                   3350 ;       ;       ( -- )
                                   3351 ;       Terminate a colon definition.
      00935F 93 4D                 3352         .word      LINK
                           0012E1  3353 LINK = . 
      009361 C1                    3354 	.byte      IMEDD+COMPO+1
      009362 3B                    3355         .ascii     ";"
      009363                       3356 SEMIS:
      009363 CD 91 3A         [ 4] 3357         CALL     COMPI
      009366 CD 81 C7         [ 4] 3358         CALL     EXIT
      009369 CD 90 24         [ 4] 3359         CALL     LBRAC
      00936C CC 93 53         [ 2] 3360         JP     OVERT
                                   3361 
                                   3362 ;       ]       ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3363 ;       Start compiling words in
                                   3364 ;       input stream.
      00936F 93 61                 3365         .word      LINK
                           0012F1  3366 LINK = . 
      009371 01                    3367         .byte      1
      009372 5D                    3368         .ascii     "]"
      009373                       3369 RBRAC:
      009373 CD 81 5D         [ 4] 3370         CALL     DOLIT
      009376 93 1F                 3371         .word      SCOMP
      009378 CD 83 86         [ 4] 3372         CALL     TEVAL
      00937B CC 81 CE         [ 2] 3373         JP     STORE
                                   3374 
                                   3375 ;       CALL,    ( ca -- )
                                   3376 ;       Compile a subroutine call.
      00937E 93 71                 3377         .word      LINK
                           001300  3378 LINK = . 
      009380 04                    3379         .byte      4
      009381 43 41 4C 4C 2C        3380         .ascii     "CALL,"
      009386                       3381 JSRC:
      009386 CD 81 5D         [ 4] 3382         CALL     DOLIT
      009389 00 CD                 3383         .word     CALLL     ;CALL
      00938B CD 91 0C         [ 4] 3384         CALL     CCOMMA
      00938E CC 90 F5         [ 2] 3385         JP     COMMA
                                   3386 
                                   3387 ;       :       ( -- ; <string> )
                                   3388 ;       Start a new colon definition
                                   3389 ;       using next word as its name.
      009391 93 80                 3390         .word      LINK
                           001313  3391 LINK = . 
      009393 01                    3392         .byte      1
      009394 3A                    3393         .ascii     ":"
      009395                       3394 COLON:
      009395 CD 8D B2         [ 4] 3395         CALL     TOKEN
      009398 CD 92 D2         [ 4] 3396         CALL     SNAME
      00939B CC 93 73         [ 2] 3397         JP     RBRAC
                                   3398 
                                   3399 ;       IMMEDIATE       ( -- )
                                   3400 ;       Make last compiled word
                                   3401 ;       an immediate word.
      00939E 93 93                 3402         .word      LINK
                           001320  3403 LINK = . 
      0093A0 09                    3404         .byte      9
      0093A1 49 4D 4D 45 44 49 41  3405         .ascii     "IMMEDIATE"
             54 45
      0093AA                       3406 IMMED:
      0093AA CD 81 5D         [ 4] 3407         CALL     DOLIT
      0093AD 80 00                 3408         .word     0x8000	;  IMEDD*256
      0093AF CD 83 C6         [ 4] 3409         CALL     LAST
      0093B2 CD 81 E5         [ 4] 3410         CALL     AT
      0093B5 CD 81 E5         [ 4] 3411         CALL     AT
      0093B8 CD 82 EC         [ 4] 3412         CALL     ORR
      0093BB CD 83 C6         [ 4] 3413         CALL     LAST
      0093BE CD 81 E5         [ 4] 3414         CALL     AT
      0093C1 CC 81 CE         [ 2] 3415         JP     STORE
                                   3416 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3417 ;; Defining words
                                   3418 
                                   3419 ;       CREATE  ( -- ; <string> )
                                   3420 ;       Compile a new array
                                   3421 ;       without allocating space.
      0093C4 93 A0                 3422         .word      LINK
                           001346  3423 LINK = . 
      0093C6 06                    3424         .byte      6
      0093C7 43 52 45 41 54 45     3425         .ascii     "CREATE"
      0093CD                       3426 CREAT:
      0093CD CD 8D B2         [ 4] 3427         CALL     TOKEN
      0093D0 CD 92 D2         [ 4] 3428         CALL     SNAME
      0093D3 CD 93 53         [ 4] 3429         CALL     OVERT
      0093D6 CD 91 3A         [ 4] 3430         CALL     COMPI
      0093D9 CD 83 39         [ 4] 3431         CALL     DOVAR
      0093DC 81               [ 4] 3432         RET
                                   3433 
                                   3434 ;       VARIABLE        ( -- ; <string> )
                                   3435 ;       Compile a new variable
                                   3436 ;       initialized to 0.
      0093DD 93 C6                 3437         .word      LINK
                           00135F  3438 LINK = . 
      0093DF 08                    3439         .byte      8
      0093E0 56 41 52 49 41 42 4C  3440         .ascii     "VARIABLE"
             45
      0093E8                       3441 VARIA:
      0093E8 CD 93 CD         [ 4] 3442         CALL     CREAT
      0093EB CD 87 3A         [ 4] 3443         CALL     ZERO
      0093EE CC 90 F5         [ 2] 3444         JP     COMMA
                                   3445 
                                   3446 ;; Tools
                                   3447 
                                   3448 ;       _TYPE   ( b u -- )
                                   3449 ;       Display a string. Filter
                                   3450 ;       non-printing characters.
      0093F1 93 DF                 3451         .word      LINK
                           001373  3452 LINK = . 
      0093F3 05                    3453         .byte      5
      0093F4 5F 54 59 50 45        3454         .ascii     "_TYPE"
      0093F9                       3455 UTYPE:
      0093F9 CD 82 55         [ 4] 3456         CALL     TOR     ;start count down loop
      0093FC 20 0F            [ 2] 3457         JRA     UTYP2   ;skip first pass
      0093FE CD 82 8C         [ 4] 3458 UTYP1:  CALL     DUPP
      009401 CD 82 03         [ 4] 3459         CALL     CAT
      009404 CD 87 64         [ 4] 3460         CALL     TCHAR
      009407 CD 81 47         [ 4] 3461         CALL     EMIT    ;display only printable
      00940A CD 87 06         [ 4] 3462         CALL     ONEP    ;increment address
      00940D CD 81 71         [ 4] 3463 UTYP2:  CALL     DONXT
      009410 93 FE                 3464         .word      UTYP1   ;loop till done
      009412 CC 82 82         [ 2] 3465         JP     DROP
                                   3466 
                                   3467 ;       dm+     ( a u -- a )
                                   3468 ;       Dump u bytes from ,
                                   3469 ;       leaving a+u on  stack.
      009415 93 F3                 3470         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                           001397  3471 LINK = . 
      009417 03                    3472         .byte      3
      009418 64 6D 2B              3473         .ascii     "dm+"
      00941B                       3474 DUMPP:
      00941B CD 82 B6         [ 4] 3475         CALL     OVER
      00941E CD 81 5D         [ 4] 3476         CALL     DOLIT
      009421 00 04                 3477         .word      4
      009423 CD 8C 08         [ 4] 3478         CALL     UDOTR   ;display address
      009426 CD 8B 58         [ 4] 3479         CALL     SPACE
      009429 CD 82 55         [ 4] 3480         CALL     TOR     ;start count down loop
      00942C 20 11            [ 2] 3481         JRA     PDUM2   ;skip first pass
      00942E CD 82 8C         [ 4] 3482 PDUM1:  CALL     DUPP
      009431 CD 82 03         [ 4] 3483         CALL     CAT
      009434 CD 81 5D         [ 4] 3484         CALL     DOLIT
      009437 00 03                 3485         .word      3
      009439 CD 8C 08         [ 4] 3486         CALL     UDOTR   ;display numeric data
      00943C CD 87 06         [ 4] 3487         CALL     ONEP    ;increment address
      00943F CD 81 71         [ 4] 3488 PDUM2:  CALL     DONXT
      009442 94 2E                 3489         .word      PDUM1   ;loop till done
      009444 81               [ 4] 3490         RET
                                   3491 
                                   3492 ;       DUMP    ( a u -- )
                                   3493 ;       Dump u bytes from a,
                                   3494 ;       in a formatted manner.
      009445 94 17                 3495         .word      LINK
                           0013C7  3496 LINK = . 
      009447 04                    3497         .byte      4
      009448 44 55 4D 50           3498         .ascii     "DUMP"
      00944C                       3499 DUMP:
      00944C CD 83 47         [ 4] 3500         CALL     BASE
      00944F CD 81 E5         [ 4] 3501         CALL     AT
      009452 CD 82 55         [ 4] 3502         CALL     TOR
      009455 CD 89 E0         [ 4] 3503         CALL     HEX     ;save radix, set hex
      009458 CD 81 5D         [ 4] 3504         CALL     DOLIT
      00945B 00 10                 3505         .word      16
      00945D CD 86 2C         [ 4] 3506         CALL     SLASH   ;change count to lines
      009460 CD 82 55         [ 4] 3507         CALL     TOR     ;start count down loop
      009463 CD 8B A0         [ 4] 3508 DUMP1:  CALL     CR
      009466 CD 81 5D         [ 4] 3509         CALL     DOLIT
      009469 00 10                 3510         .word      16
      00946B CD 84 12         [ 4] 3511         CALL     DDUP
      00946E CD 94 1B         [ 4] 3512         CALL     DUMPP   ;display numeric
      009471 CD 83 E7         [ 4] 3513         CALL     ROT
      009474 CD 83 E7         [ 4] 3514         CALL     ROT
      009477 CD 8B 58         [ 4] 3515         CALL     SPACE
      00947A CD 8B 58         [ 4] 3516         CALL     SPACE
      00947D CD 93 F9         [ 4] 3517         CALL     UTYPE   ;display printable characters
      009480 CD 81 71         [ 4] 3518         CALL     DONXT
      009483 94 63                 3519         .word      DUMP1   ;loop till done
      009485 CD 82 82         [ 4] 3520 DUMP3:  CALL     DROP
      009488 CD 82 36         [ 4] 3521         CALL     RFROM
      00948B CD 83 47         [ 4] 3522         CALL     BASE
      00948E CC 81 CE         [ 2] 3523         JP     STORE   ;restore radix
                                   3524 
                                   3525 ;       .S      ( ... -- ... )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                                   3526 ;        Display  contents of stack.
      009491 94 47                 3527         .word      LINK
                           001413  3528 LINK = . 
      009493 02                    3529         .byte      2
      009494 2E 53                 3530         .ascii     ".S"
      009496                       3531 DOTS:
      009496 CD 8B A0         [ 4] 3532         CALL     CR
      009499 CD 87 7D         [ 4] 3533         CALL     DEPTH   ;stack depth
      00949C CD 82 55         [ 4] 3534         CALL     TOR     ;start count down loop
      00949F 20 0C            [ 2] 3535         JRA     DOTS2   ;skip first pass
      0094A1 CD 82 49         [ 4] 3536 DOTS1:  CALL     RAT
      0094A4 CD 87 06         [ 4] 3537         CALL ONEP
      0094A7 CD 87 94         [ 4] 3538 	CALL     PICK
      0094AA CD 8C 3B         [ 4] 3539         CALL     DOT     ;index stack, display contents
      0094AD CD 81 71         [ 4] 3540 DOTS2:  CALL     DONXT
      0094B0 94 A1                 3541         .word      DOTS1   ;loop till done
      0094B2 CD 8B DF         [ 4] 3542         CALL     DOTQP
      0094B5 05                    3543         .byte      5
      0094B6 20 3C 73 70 20        3544         .ascii     " <sp "
      0094BB 81               [ 4] 3545         RET
                                   3546 
                                   3547 ;       >NAME   ( ca -- na | F )
                                   3548 ;       Convert code address
                                   3549 ;       to a name address.
      0094BC 94 93                 3550         .word      LINK
                           00143E  3551 LINK = . 
      0094BE 05                    3552         .byte      5
      0094BF 3E 4E 41 4D 45        3553         .ascii     ">NAME"
      0094C4                       3554 TNAME:
      0094C4 CD 83 A8         [ 4] 3555         CALL     CNTXT   ;vocabulary link
      0094C7 CD 81 E5         [ 4] 3556 TNAM2:  CALL     AT
      0094CA CD 82 8C         [ 4] 3557         CALL     DUPP    ;?last word in a vocabulary
      0094CD CD 81 90         [ 4] 3558         CALL     QBRAN
      0094D0 94 EB                 3559         .word      TNAM4
      0094D2 CD 84 12         [ 4] 3560         CALL     DDUP
      0094D5 CD 8D C0         [ 4] 3561         CALL     NAMET
      0094D8 CD 83 01         [ 4] 3562         CALL     XORR    ;compare
      0094DB CD 81 90         [ 4] 3563         CALL     QBRAN
      0094DE 94 E5                 3564         .word      TNAM3
      0094E0 CD 86 EA         [ 4] 3565         CALL     CELLM   ;continue with next word
      0094E3 20 E2            [ 2] 3566         JRA     TNAM2
      0094E5 CD 82 9C         [ 4] 3567 TNAM3:  CALL     SWAPP
      0094E8 CC 82 82         [ 2] 3568         JP     DROP
      0094EB CD 84 07         [ 4] 3569 TNAM4:  CALL     DDROP
      0094EE CC 87 3A         [ 2] 3570         JP     ZERO
                                   3571 
                                   3572 ;       .ID     ( na -- )
                                   3573 ;        Display  name at address.
      0094F1 94 BE                 3574         .word      LINK
                           001473  3575 LINK = . 
      0094F3 03                    3576         .byte      3
      0094F4 2E 49 44              3577         .ascii     ".ID"
      0094F7                       3578 DOTID:
      0094F7 CD 83 D6         [ 4] 3579         CALL     QDUP    ;if zero no name
      0094FA CD 81 90         [ 4] 3580         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      0094FD 95 0D                 3581         .word      DOTI1
      0094FF CD 88 10         [ 4] 3582         CALL     COUNT
      009502 CD 81 5D         [ 4] 3583         CALL     DOLIT
      009505 00 1F                 3584         .word      0x1F
      009507 CD 82 D8         [ 4] 3585         CALL     ANDD    ;mask lexicon bits
      00950A CC 93 F9         [ 2] 3586         JP     UTYPE
      00950D CD 8B DF         [ 4] 3587 DOTI1:  CALL     DOTQP
      009510 09                    3588         .byte      9
      009511 20 6E 6F 4E 61 6D 65  3589         .ascii     " noName"
      009518 81               [ 4] 3590         RET
                                   3591 
                           000000  3592 WANT_SEE=0 
                           000000  3593 .if WANT_SEE 
                                   3594 ;       SEE     ( -- ; <string> )
                                   3595 ;       A simple decompiler.
                                   3596 ;       Updated for byte machines.
                                   3597         .word      LINK
                                   3598 LINK = . 
                                   3599         .byte      3
                                   3600         .ascii     "SEE"
                                   3601 SEE:
                                   3602         CALL     TICK    ;starting address
                                   3603         CALL     CR
                                   3604         CALL     ONEM
                                   3605 SEE1:   CALL     ONEP
                                   3606         CALL     DUPP
                                   3607         CALL     AT
                                   3608         CALL     DUPP    ;?does it contain a zero
                                   3609         CALL     QBRAN
                                   3610         .word    SEE2
                                   3611         CALL     TNAME   ;?is it a name
                                   3612 SEE2:   CALL     QDUP    ;name address or zero
                                   3613         CALL     QBRAN
                                   3614         .word    SEE3
                                   3615         CALL     SPACE
                                   3616         CALL     DOTID   ;display name
                                   3617         CALL     ONEP
                                   3618         JRA      SEE4
                                   3619 SEE3:   CALL     DUPP
                                   3620         CALL     CAT
                                   3621         CALL     UDOT    ;display number
                                   3622 SEE4:   CALL     NUFQ    ;user control
                                   3623         CALL     QBRAN
                                   3624         .word    SEE1
                                   3625         JP     DROP
                                   3626 .endif ; WANT_SEE 
                                   3627 
                                   3628 ;       WORDS   ( -- )
                                   3629 ;       Display names in vocabulary.
      009519 94 F3                 3630         .word      LINK
                           00149B  3631 LINK = . 
      00951B 05                    3632         .byte      5
      00951C 57 4F 52 44 53        3633         .ascii     "WORDS"
      009521                       3634 WORDS:
      009521 CD 8B A0         [ 4] 3635         CALL     CR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009524 CD 83 A8         [ 4] 3636         CALL     CNTXT   ;only in context
      009527 CD 81 E5         [ 4] 3637 WORS1:  CALL     AT
      00952A CD 83 D6         [ 4] 3638         CALL     QDUP    ;?at end of list
      00952D CD 81 90         [ 4] 3639         CALL     QBRAN
      009530 95 46                 3640         .word      WORS2
      009532 CD 82 8C         [ 4] 3641         CALL     DUPP
      009535 CD 8B 58         [ 4] 3642         CALL     SPACE
      009538 CD 94 F7         [ 4] 3643         CALL     DOTID   ;display a name
      00953B CD 86 EA         [ 4] 3644         CALL     CELLM
      00953E CD 81 A7         [ 4] 3645         CALL     BRAN
      009541 95 27                 3646         .word      WORS1
      009543 CD 82 82         [ 4] 3647         CALL     DROP
      009546 81               [ 4] 3648 WORS2:  RET
                                   3649 
                                   3650         
                                   3651 ;; Hardware reset
                                   3652 
                                   3653 ;       hi      ( -- )
                                   3654 ;       Display sign-on message.
      009547 95 1B                 3655         .word      LINK
                           0014C9  3656 LINK = . 
      009549 02                    3657         .byte      2
      00954A 68 69                 3658         .ascii     "hi"
      00954C                       3659 HI:
      00954C CD 8B A0         [ 4] 3660         CALL     CR
      00954F CD 8B DF         [ 4] 3661         CALL     DOTQP   ;initialize I/O
      009552 0F                    3662         .byte      15
      009553 73 74 6D 38 65 46 6F  3663         .ascii     "stm8eForth v"
             72 74 68 20 76
      00955F 32                    3664 	.byte      VER+'0'
      009560 2E                    3665         .byte      '.' 
      009561 31                    3666 	.byte      EXT+'0' ;version
      009562 CC 8B A0         [ 2] 3667         JP     CR
                                   3668 
                           000000  3669 WANT_DEBUG=0
                           000000  3670 .if WANT_DEBUG 
                                   3671 ;       DEBUG      ( -- )
                                   3672 ;       Display sign-on message.
                                   3673 ;        .word      LINK
                                   3674 LINK = . 
                                   3675         .byte      5
                                   3676         .ascii     "DEBUG"
                                   3677 DEBUG:
                                   3678 	CALL DOLIT
                                   3679 	.word 0x65
                                   3680 	CALL EMIT
                                   3681 	CALL DOLIT
                                   3682 	.word 0
                                   3683  	CALL ZLESS 
                                   3684 	CALL DOLIT
                                   3685 	.word 0xFFFE
                                   3686 	CALL ZLESS 
                                   3687 	CALL UPLUS 
                                   3688  	CALL DROP 
                                   3689 	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                   3690 	.word 3
                                   3691 	CALL UPLUS 
                                   3692 	CALL UPLUS 
                                   3693  	CALL DROP
                                   3694 	CALL DOLIT
                                   3695 	.word 0x43
                                   3696 	CALL UPLUS 
                                   3697  	CALL DROP
                                   3698 	CALL EMIT
                                   3699 	CALL DOLIT
                                   3700 	.word 0x4F
                                   3701 	CALL DOLIT
                                   3702 	.word 0x6F
                                   3703  	CALL XORR
                                   3704 	CALL DOLIT
                                   3705 	.word 0xF0
                                   3706  	CALL ANDD
                                   3707 	CALL DOLIT
                                   3708 	.word 0x4F
                                   3709  	CALL ORR
                                   3710 	CALL EMIT
                                   3711 	CALL DOLIT
                                   3712 	.word 8
                                   3713 	CALL DOLIT
                                   3714 	.word 6
                                   3715  	CALL SWAPP
                                   3716 	CALL OVER
                                   3717 	CALL XORR
                                   3718 	CALL DOLIT
                                   3719 	.word 3
                                   3720 	CALL ANDD 
                                   3721 	CALL ANDD
                                   3722 	CALL DOLIT
                                   3723 	.word 0x70
                                   3724 	CALL UPLUS 
                                   3725 	CALL DROP
                                   3726 	CALL EMIT
                                   3727 	CALL DOLIT
                                   3728 	.word 0
                                   3729 	CALL QBRAN
                                   3730 	.word DEBUG1
                                   3731 	CALL DOLIT
                                   3732 	.word 0x3F
                                   3733 DEBUG1:
                                   3734 	CALL DOLIT
                                   3735 	.word 0xFFFF
                                   3736 	CALL QBRAN
                                   3737 	.word DEBUG2
                                   3738 	CALL DOLIT
                                   3739 	.word 0x74
                                   3740 	CALL BRAN
                                   3741 	.word DEBUG3
                                   3742 DEBUG2:
                                   3743 	CALL DOLIT
                                   3744 	.word 0x21
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                   3745 DEBUG3:
                                   3746 	CALL EMIT
                                   3747 	CALL DOLIT
                                   3748 	.word 0x68
                                   3749 	CALL DOLIT
                                   3750 	.word 0x80
                                   3751 	CALL STORE
                                   3752 	CALL DOLIT
                                   3753 	.word 0x80
                                   3754 	CALL AT
                                   3755 	CALL EMIT
                                   3756 	CALL DOLIT
                                   3757 	.word 0x4D
                                   3758 	CALL TOR
                                   3759 	CALL RAT
                                   3760 	CALL RFROM
                                   3761 	CALL ANDD
                                   3762 	CALL EMIT
                                   3763 	CALL DOLIT
                                   3764 	.word 0x61
                                   3765 	CALL DOLIT
                                   3766 	.word 0xA
                                   3767 	CALL TOR
                                   3768 DEBUG4:
                                   3769 	CALL DOLIT
                                   3770 	.word 1
                                   3771 	CALL UPLUS 
                                   3772 	CALL DROP
                                   3773 	CALL DONXT
                                   3774 	.word DEBUG4
                                   3775 	CALL EMIT
                                   3776 	CALL DOLIT
                                   3777 	.word 0x656D
                                   3778 	CALL DOLIT
                                   3779 	.word 0x100
                                   3780 	CALL UMSTA
                                   3781 	CALL SWAPP
                                   3782 	CALL DOLIT
                                   3783 	.word 0x100
                                   3784 	CALL UMSTA
                                   3785 	CALL SWAPP 
                                   3786 	CALL DROP
                                   3787 	CALL EMIT
                                   3788 	CALL EMIT
                                   3789 	CALL DOLIT
                                   3790 	.word 0x2043
                                   3791 	CALL DOLIT
                                   3792 	.word 0
                                   3793 	CALL DOLIT
                                   3794 	.word 0x100
                                   3795 	CALL UMMOD
                                   3796 	CALL EMIT
                                   3797 	CALL EMIT
                                   3798 	;JP ORIG
                                   3799 	RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3800 .endif ; WANT_DEBUG 
                                   3801 
                                   3802 
                                   3803 ;       'BOOT   ( -- a )
                                   3804 ;       The application startup vector.
      009565 95 49                 3805         .word      LINK
                           0014E7  3806 LINK = . 
      009567 05                    3807         .byte      5
      009568 27 42 4F 4F 54        3808         .ascii     "'BOOT"
      00956D                       3809 TBOOT:
      00956D CD 83 39         [ 4] 3810         CALL     DOVAR
      009570 95 4C                 3811         .word      HI       ;application to boot
                                   3812 
                                   3813 ;       COLD    ( -- )
                                   3814 ;       The hilevel cold start s=ence.
      009572 95 67                 3815         .word      LINK
                           0014F4  3816 LINK = . 
      009574 04                    3817         .byte      4
      009575 43 4F 4C 44           3818         .ascii     "COLD"
      009579                       3819 COLD:
                           000000  3820 .if WANT_DEBUG
                                   3821         CALL DEBUG
                                   3822 .endif 
      009579 CD 81 5D         [ 4] 3823 COLD1:  CALL     DOLIT
      00957C 80 A0                 3824         .word      UZERO
      00957E CD 81 5D         [ 4] 3825 	CALL     DOLIT
      009581 00 06                 3826         .word      UPP
      009583 CD 81 5D         [ 4] 3827         CALL     DOLIT
      009586 00 14                 3828 	.word      ULAST-UZERO
      009588 CD 88 74         [ 4] 3829         CALL     CMOVE   ;initialize user area
      00958B CD 90 A3         [ 4] 3830         CALL     PRESE   ;initialize data stack and TIB
      00958E CD 95 6D         [ 4] 3831         CALL     TBOOT
      009591 CD 88 5D         [ 4] 3832         CALL     ATEXE   ;application boot
      009594 CD 93 53         [ 4] 3833         CALL     OVERT
      009597 CC 90 C0         [ 2] 3834         JP     QUIT    ;start interpretation
                                   3835 
                                   3836 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3837         .include "flash.asm"
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
                                     25 ;pointer to far address 
                           000002    26     farptr=2
                           000003    27     ptr16=3
                           000004    28     ptr8=4
                                     29 
                                     30 ;--------------------------------
                                     31 ; initialize farptr 
                                     32 ; FP!  ( ud -- )
                                     33 ;---------------------------------
      00959A 95 74                   34     .word LINK 
                           00151C    35     LINK=.
      00959C 03                      36     .byte 3 
      00959D 46 50 21                37     .ascii "FP!"
      0095A0                         38 fptr_store:
      0095A0 90 93            [ 1]   39     ldw y,x
      0095A2 90 FE            [ 2]   40     ldw y,(y)
      0095A4 90 9F            [ 1]   41     ld a,yl 
      0095A6 B7 02            [ 1]   42     ld farptr,a 
      0095A8 1C 00 02         [ 2]   43     addw x,#CELLL 
      0095AB 90 93            [ 1]   44     ldw y,x 
      0095AD 90 FE            [ 2]   45     ldw y,(y)
      0095AF 90 BF 03         [ 2]   46     ldw ptr16,y
      0095B2 1C 00 02         [ 2]   47     addw x,#CELLL 
      0095B5 81               [ 4]   48     ret 
                                     49 
                                     50 ;-----------------------------------
                                     51 ; return EEPROM base address 
                                     52 ; as a double 
                                     53 ;  EEPROM  ( -- ud )
                                     54 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      0095B6 95 9C                   55     .word LINK 
                           001538    56 LINK=.
      0095B8 06                      57     .byte 6 
      0095B9 45 45 50 52 4F 4D       58     .ascii "EEPROM"
      0095BF                         59 eeprom: 
      0095BF 90 AE 40 00      [ 2]   60     ldw y,#EEPROM_BASE
      0095C3 1D 00 04         [ 2]   61     subw x,#2*CELLL 
      0095C6 EF 02            [ 2]   62     ldw (2,x),y 
      0095C8 90 5F            [ 1]   63     clrw y 
      0095CA FF               [ 2]   64     ldw (x),y 
      0095CB 81               [ 4]   65     ret
                                     66 
                                     67 ;----------------------------------
                                     68 ; fetch address over 65535
                                     69 ;  F@   ( ud -- n )
                                     70 ;----------------------------------
      0095CC 95 B8                   71     .word LINK 
                           00154E    72 LINK=.
      0095CE 02                      73     .byte 2
      0095CF 46 40                   74     .ascii "F@"
      0095D1                         75 farat:
      0095D1 CD 95 A0         [ 4]   76     call fptr_store
      0095D4 92 BC 00 02      [ 5]   77     ldf a,[farptr]
      0095D8 1D 00 02         [ 2]   78     subw x,#CELLL 
      0095DB F7               [ 1]   79     ld (x),a 
      0095DC 90 AE 00 01      [ 2]   80     ldw y,#1
      0095E0 91 AF 00 02      [ 1]   81     ldf a,([farptr],y)
      0095E4 E7 01            [ 1]   82     ld (1,x),a
      0095E6 81               [ 4]   83     ret 
                                     84 
                                     85 ;-------------------------------------
                                     86 ; fetch C at address over 65535 
                                     87 ; FC@ ( ud -- c)
                                     88 ;-------------------------------------
      0095E7 95 CE                   89     .word LINK
                           001569    90     LINK=.
      0095E9 03                      91     .byte 3 
      0095EA 46 43 40                92     .ascii "FC@" 
      0095ED                         93 farcat:
      0095ED CD 95 A0         [ 4]   94     call fptr_store 
      0095F0 92 BC 00 02      [ 5]   95     ldf a,[farptr]
      0095F4 1D 00 02         [ 2]   96     subw x,#CELLL 
      0095F7 E7 01            [ 1]   97     ld (1,x),a 
      0095F9 7F               [ 1]   98     clr (x)
      0095FA 81               [ 4]   99     ret 
                                    100     
                                    101 ;----------------------------------
                                    102 ; unlock EEPROM/OPT for writing/erasing
                                    103 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    104 ;  UNLKEE   ( -- )
                                    105 ;----------------------------------
      0095FB 95 E9                  106     .word LINK 
                           00157D   107 LINK=.
      0095FD 06                     108     .byte 6 
      0095FE 55 4E 4C 4B 45 45      109     .ascii "UNLKEE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009604                        110 unlock_eeprom:
      009604 35 00 50 5B      [ 1]  111 	mov FLASH_CR2,#0 
      009608 35 FF 50 5C      [ 1]  112 	mov FLASH_NCR2,#0xFF 
      00960C 35 AE 50 64      [ 1]  113 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009610 35 56 50 64      [ 1]  114     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009614 72 07 50 5F FB   [ 2]  115 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009619 81               [ 4]  116 	ret
                                    117 
                                    118 ;----------------------------------
                                    119 ; unlock FLASH for writing/erasing
                                    120 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    121 ; UNLKFL  ( -- )
                                    122 ;----------------------------------
      00961A 95 FD                  123     .word LINK 
                           00159C   124 LINK=. 
      00961C 06                     125     .byte 6 
      00961D 55 4E 4C 4B 46 4C      126     .ascii "UNLKFL"    
      009623                        127 unlock_flash:
      009623 35 00 50 5B      [ 1]  128 	mov FLASH_CR2,#0 
      009627 35 FF 50 5C      [ 1]  129 	mov FLASH_NCR2,#0xFF 
      00962B 35 56 50 62      [ 1]  130 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      00962F 35 AE 50 62      [ 1]  131 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009633 72 03 50 5F FB   [ 2]  132 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009638 81               [ 4]  133 	ret
                                    134 
                                    135 ;---------------------------------------
                                    136 ; write a byte to FLASH or EEPROM/OPTION  
                                    137 ; EE-C!  (c ud -- )
                                    138 ;---------------------------------------
      009639 96 1C                  139     .word LINK 
                           0015BB   140 LINK=.
      00963B 05                     141     .byte 5 
      00963C 45 45 2D 43 21         142     .ascii "EE-C!"
                                    143 	; local variables 
                           000001   144 	BTW = 1   ; byte to write offset on stack
                           000002   145 	OPT = 2   ; OPTION flag offset on stack
                           000002   146     VSIZE = 2
      009641                        147 write_byte:
      009641 52 02            [ 2]  148 	sub sp,#VSIZE
      009643 CD 95 A0         [ 4]  149     call fptr_store
      009646 E6 01            [ 1]  150     ld a,(1,x)
      009648 6B 01            [ 1]  151 	ld (BTW,sp),a ; byte to write 
      00964A 0F 02            [ 1]  152 	clr (OPT,sp)  ; OPTION flag
      00964C 1C 00 02         [ 2]  153     addw x,#CELLL 
                                    154 ; put addr[15:0] in Y, for bounds check.
      00964F 90 BE 03         [ 2]  155 	ldw y,ptr16   ; Y=addr15:0
                                    156 ; check addr[23:16], if <> 0 then it is extened flash memory
      009652 3D 02            [ 1]  157 	tnz farptr 
      009654 26 14            [ 1]  158 	jrne write_flash
      009656 90 A3 96 BC      [ 2]  159     cpw y,#user_space
      00965A 24 0E            [ 1]  160     jruge write_flash
      00965C 90 A3 40 00      [ 2]  161 	cpw y,#EEPROM_BASE  
      009660 25 57            [ 1]  162     jrult write_exit
      009662 90 A3 48 7F      [ 2]  163 	cpw y,#OPTION_END 
      009666 22 51            [ 1]  164 	jrugt write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009668 20 16            [ 2]  165 	jra write_eeprom 
                                    166 ; write program memory
      00966A                        167 write_flash:
      00966A CD 96 23         [ 4]  168 	call unlock_flash 
      00966D 9B               [ 1]  169 1$:	sim 
      00966E 7B 01            [ 1]  170 	ld a,(BTW,sp)
      009670 92 BD 00 02      [ 4]  171 	ldf [farptr],a ; farptr[x]=A
      009674 72 05 50 5F FB   [ 2]  172 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009679 9A               [ 1]  173     rim 
      00967A 72 13 50 5F      [ 1]  174     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00967E 20 39            [ 2]  175     jra write_exit
                                    176 ; write eeprom and option
      009680                        177 write_eeprom:
      009680 CD 96 04         [ 4]  178 	call unlock_eeprom
                                    179 	; check for data eeprom or option eeprom
      009683 90 A3 48 00      [ 2]  180 	cpw y,#OPTION_BASE
      009687 2B 08            [ 1]  181 	jrmi 1$
      009689 90 A3 48 80      [ 2]  182 	cpw y,#OPTION_END+1
      00968D 2A 02            [ 1]  183 	jrpl 1$
      00968F 03 02            [ 1]  184 	cpl (OPT,sp)
      009691                        185 1$: 
      009691 0D 02            [ 1]  186     tnz (OPT,sp)
      009693 27 08            [ 1]  187     jreq 2$
                                    188 	; pour modifier une option il faut modifier ces 2 bits
      009695 72 1E 50 5B      [ 1]  189     bset FLASH_CR2,#FLASH_CR2_OPT
      009699 72 1F 50 5C      [ 1]  190     bres FLASH_NCR2,#FLASH_CR2_OPT 
      00969D                        191 2$: 
      00969D 7B 01            [ 1]  192     ld a,(BTW,sp)
      00969F 92 BD 00 02      [ 4]  193     ldf [farptr],a
      0096A3 0D 02            [ 1]  194     tnz (OPT,sp)
      0096A5 27 0D            [ 1]  195     jreq 3$
      0096A7 3C 04            [ 1]  196     inc ptr8 
      0096A9 26 02            [ 1]  197     jrne 21$
      0096AB 3C 03            [ 1]  198     inc ptr16      
      0096AD                        199 21$:
      0096AD 7B 01            [ 1]  200     ld a,(BTW,sp)
      0096AF 43               [ 1]  201     cpl a
      0096B0 92 BD 00 02      [ 4]  202     ldf [farptr],a
      0096B4 72 05 50 5F FB   [ 2]  203 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0096B9                        204 write_exit:
      0096B9 5B 02            [ 2]  205 	addw sp,#VSIZE 
      0096BB 81               [ 4]  206     ret
                                    207 
                           000000   208 .if 0
                                    209 ;----------------------------
                                    210 ; erase block code must be 
                                    211 ; executed from RAM
                                    212 ; input:
                                    213 ;-----------------------------
                                    214 row_erase:
                                    215 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
                                    216 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
                                    217 	clr a 
                                    218 	clrw y 
                                    219 	ldf ([farptr],y),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                    220     incw y
                                    221 	ldf ([farptr],y),a
                                    222     incw y
                                    223 	ldf ([farptr],y),a
                                    224     incw y
                                    225 	ldf ([farptr],y),a
                                    226 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
                                    227 	ret
                                    228 row_erase_end:
                                    229 
                                    230 ; copy erase_start in RAM 
                                    231 move_erase_to_ram:
                                    232 	ldw x,#row_erase_end 
                                    233 	subw x,#row_erase
                                    234 	ldw acc16,x 
                                    235 	ldw x,#tib 
                                    236 	ldw y,#row_erase 
                                    237 	call move 
                                    238 	ret 
                                    239 
                                    240 ;-----------------------------------
                                    241 ; block programming must be 
                                    242 ; executed from RAM 
                                    243 ; initial contidions: 
                                    244 ; 	memory unlocked
                                    245 ;   bit PRG set in 
                                    246 ; input:
                                    247 ;   x        128 bytes row to program 
                                    248 ;   farptr   row address 
                                    249 ; output:
                                    250 ;   none 
                                    251 ;----------------------------------
                                    252 	BCNT=1 
                                    253 program_row:
                                    254 	push #BLOCK_SIZE  
                                    255 ;enable block programming 
                                    256 	bset FLASH_CR2,#FLASH_CR2_PRG 
                                    257 	bres FLASH_NCR2,#FLASH_CR2_PRG
                                    258 	clrw y 
                                    259 1$:	ld a,(x)
                                    260 	ldf ([farptr],y),a
                                    261 	incw x 
                                    262 	incw y 
                                    263 	dec (BCNT,sp)
                                    264 	jrne 1$
                                    265 ; wait EOP bit 
                                    266 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
                                    267 	_drop 1 
                                    268 	ret 
                                    269 program_row_end:
                                    270 
                                    271 ;-------------------------
                                    272 ; move program_row to RAM 
                                    273 ; at txtubound address 
                                    274 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                    275 move_prg_to_ram:
                                    276 	ldw x,#program_row_end 
                                    277 	subw x,#program_row 
                                    278 	ldw acc16,x 
                                    279 	ldw x,#tib 
                                    280 	ldw y,#program_row 
                                    281 	call move 
                                    282 	ret 
                                    283 
                                    284 
                                    285 ;-----------------------------
                                    286 ; write a row in FLASH/EEPROM 
                                    287 ; input:
                                    288 ;    farptr   destination address 
                                    289 ;    x        source address 
                                    290 ;-----------------------------
                                    291 write_row:
                                    292 	pushw x 
                                    293 	tnz farptr 
                                    294 	jrne to_flash 
                                    295 	ldw x,#FLASH_BASE 
                                    296 	cpw x,farptr+1 
                                    297 	jruge to_flash 
                                    298 to_eeprom:
                                    299 	ldw x,#EEPROM_BASE 
                                    300 	cpw x,farptr+1 
                                    301 	jruge 1$
                                    302 	ret ; bad address 
                                    303 1$: ldw x,#EEPROM_END 
                                    304 	jrule 2$ 
                                    305 	ret ; bad address 
                                    306 2$:	call unlock_eeprom
                                    307 	jra do_programming
                                    308 to_flash:
                                    309 	call unlock_flash 
                                    310 do_programming:
                                    311 	popw x 
                                    312 	call tib
                                    313 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
                                    314 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
                                    315 	ret 
                                    316 
                                    317 
                                    318 ;-----------------------------------
                                    319 ; erase flash or EEPROM block
                                    320 ; a blow is 128 bytes 
                                    321 ; input:
                                    322 ;   farptr  address row begin
                                    323 ; output:
                                    324 ;   none
                                    325 ;--------------------------------------
                                    326 block_erase:
                                    327 	ldw x,farptr+1
                                    328 	cpw x,#user_space 
                                    329 	jrpl erase_flash 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                    330 ; erase eeprom block
                                    331 	cpw x,#EEPROM_BASE 
                                    332 	jruge 1$
                                    333 	ret ; bad address 
                                    334 1$: ldw x,#EEPROM_END 
                                    335 	jrule 2$ 
                                    336 	ret ; bad address 
                                    337 2$:	call unlock_eeprom 
                                    338 	call tib 
                                    339 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
                                    340 	ret 
                                    341 ; erase flash block:
                                    342 erase_flash:
                                    343 	call unlock_flash 
                                    344 	call tib 
                                    345     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
                                    346 	ret 
                                    347 
                                    348 
                                    349 ;--------------------------------------------
                                    350 ; write a data block to eeprom or flash 
                                    351 ; input:
                                    352 ;   Y        source address   
                                    353 ;   X        array index  destination  farptr[x]
                                    354 ;   BSIZE    block size bytes 
                                    355 ;   farptr   write address , byte* 
                                    356 ; output:
                                    357 ;	X 		after last byte written 
                                    358 ;   Y 		after last byte read 
                                    359 ;  farptr   point after block
                                    360 ;---------------------------------------------
                                    361 	_argofs 2 
                                    362 	_arg BSIZE 1  ; block size
                                    363 	; local var 
                                    364 	XSAVE=1 
                                    365 	VSIZE=2 
                                    366 write_block:
                                    367 	_vars VSIZE
                                    368 	ldw (XSAVE,sp),x 
                                    369 	ldw x,(BSIZE,sp) 
                                    370 	jreq 9$
                                    371 1$:	ldw x,(XSAVE,sp)
                                    372 	ld a,(y)
                                    373 	call write_byte 
                                    374 	incw x 
                                    375 	incw y 
                                    376 	ldw (XSAVE,sp),x
                                    377 	ldw x,(BSIZE,sp)
                                    378 	decw x
                                    379 	ldw (BSIZE,sp),x 
                                    380 	jrne 1$
                                    381 9$:
                                    382 	ldw x,(XSAVE,sp)
                                    383 	call incr_farptr
                                    384 	_drop VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                    385 	ret 
                                    386 .endif 
                                    387 
      0096BC                        388 user_space: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   3838         
                                   3839 ;===============================================================
                                   3840 
                           0015BB  3841 LASTN =	LINK   ;last name defined
                                   3842 
                                   3843 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000428 R   |   6 ABOR1      000F43 R
  6 ABOR2      000F5A R   |   6 ABORQ      000F3B R   |   6 ABORT      000F2C R
  6 ABRTQ      0011FB R   |   6 ABSS       00041F R   |   6 ACCEP      000EC2 R
  6 ACCP1      000ECB R   |   6 ACCP2      000EF1 R   |   6 ACCP3      000EF4 R
  6 ACCP4      000EF6 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
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
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |   6 AFT        0011E6 R
  6 AGAIN      001145 R   |   6 AHEAD      00119C R   |   6 ALLOT      00106B R
  6 ANDD       000258 R   |   6 AT         000165 R   |   6 ATEXE      0007DD R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 BACK1      000E6A R   |   6 BASE       0002C7 R   |     BASEE   =  00000A 
  6 BCOMP      0010AA R   |   6 BDIGS      0008C5 R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
  6 BEGIN      001129 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
  6 BKSLA      000D02 R   |   6 BKSP       000E3A R   |     BKSPP   =  000008 
  6 BLANK      0006AD R   |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |   6 BRAN       000127 R   |     BTW     =  000001 
    CALLL   =  0000CD     |     CAN_DGR =  005426     |     CAN_FPSR=  005427 
    CAN_IER =  005425     |     CAN_MCR =  005420     |     CAN_MSR =  005421 
    CAN_P0  =  005428     |     CAN_P1  =  005429     |     CAN_P2  =  00542A 
    CAN_P3  =  00542B     |     CAN_P4  =  00542C     |     CAN_P5  =  00542D 
    CAN_P6  =  00542E     |     CAN_P7  =  00542F     |     CAN_P8  =  005430 
    CAN_P9  =  005431     |     CAN_PA  =  005432     |     CAN_PB  =  005433 
    CAN_PC  =  005434     |     CAN_PD  =  005435     |     CAN_PE  =  005436 
    CAN_PF  =  005437     |     CAN_RFR =  005424     |     CAN_TPR =  005423 
    CAN_TSR =  005422     |     CARRY   =  000020     |   6 CAT        000183 R
  6 CCOMMA     00108C R   |     CC_C    =  000000     |     CC_H    =  000004 
    CC_I0   =  000003     |     CC_I1   =  000005     |     CC_N    =  000002 
    CC_V    =  000007     |     CC_Z    =  000001     |     CELLL   =  000002 
  6 CELLM      00066A R   |   6 CELLP      00065B R   |   6 CELLS      000679 R
    CFG_GCR =  007F60     |     CFG_GCR_=  000001     |     CFG_GCR_=  000000 
  6 CHAR1      000AF2 R   |   6 CHAR2      000AF5 R   |     CLKOPT  =  004807 
    CLKOPT_C=  000002     |     CLKOPT_E=  000003     |     CLKOPT_P=  000000 
    CLKOPT_P=  000001     |     CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6 
    CLK_CKDI=  000000     |     CLK_CKDI=  000001     |     CLK_CKDI=  000002 
    CLK_CKDI=  000003     |     CLK_CKDI=  000004     |     CLK_CMSR=  0050C3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]

Symbol Table

    CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1     |     CLK_ECKR=  000000 
    CLK_ECKR=  000001     |     CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0 
    CLK_ICKR=  000002     |     CLK_ICKR=  000000     |     CLK_ICKR=  000001 
    CLK_ICKR=  000003     |     CLK_ICKR=  000004     |     CLK_ICKR=  000005 
    CLK_PCKE=  0050C7     |     CLK_PCKE=  000000     |     CLK_PCKE=  000001 
    CLK_PCKE=  000007     |     CLK_PCKE=  000005     |     CLK_PCKE=  000006 
    CLK_PCKE=  000004     |     CLK_PCKE=  000002     |     CLK_PCKE=  000003 
    CLK_PCKE=  0050CA     |     CLK_PCKE=  000003     |     CLK_PCKE=  000002 
    CLK_PCKE=  000007     |     CLK_SWCR=  0050C5     |     CLK_SWCR=  000000 
    CLK_SWCR=  000001     |     CLK_SWCR=  000002     |     CLK_SWCR=  000003 
    CLK_SWIM=  0050CD     |     CLK_SWR =  0050C4     |     CLK_SWR_=  0000B4 
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |   6 CMOV1      0007FC R
  6 CMOV2      000814 R   |   6 CMOVE      0007F4 R   |   6 CNTXT      000328 R
  6 COLD       0014F9 R   |   6 COLD1      0014F9 R   |   6 COLON      001315 R
  6 COMMA      001075 R   |   6 COMPI      0010BA R   |     COMPO   =  000040 
    CONVERT_=  000001     |   6 COUNT      000790 R   |   6 CPP        000336 R
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |   6 CR         000B20 R
  6 CREAT      00134D R   |     CRR     =  00000D     |   6 CSTOR      000172 R
    CTOP    =  000080     |   6 DAT        000770 R   |     DATSTK  =  0016F0 
  6 DDROP      000387 R   |   6 DDUP       000392 R   |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   6 DECIM      000975 R   |   6 DEPTH      0006FD R
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   6 DGTQ1      0009BA R
  6 DIG        0008EE R   |   6 DIGIT      000889 R   |   6 DIGS       0008FF R
  6 DIGS1      0008FF R   |   6 DIGS2      00090C R   |   6 DIGTQ      000989 R
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   6 DN1        0003FF R
  6 DNEGA      0003E4 R   |   6 DOLIT      0000DD R   |   6 DONXT      0000F1 R
  6 DOSTR      000B36 R   |   6 DOT        000BBB R   |   6 DOT1       000BD1 R
  6 DOTI1      00148D R   |   6 DOTID      001477 R   |   6 DOTO1      000FCF R
  6 DOTOK      000FB5 R   |   6 DOTPR      000CE4 R   |   6 DOTQ       001217 R
  6 DOTQP      000B5F R   |   6 DOTR       000B6D R   |   6 DOTS       001416 R
  6 DOTS1      001421 R   |   6 DOTS2      00142D R   |   6 DOVAR      0002B9 R
  6 DROP       000202 R   |   6 DSTOR      00074A R   |   6 DUMP       0013CC R
  6 DUMP1      0013E3 R   |   6 DUMP3      001405 R   |   6 DUMPP      00139B R
  6 DUPP       00020C R   |   6 EDIGS      00092A R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_S=  000800     |   6 ELSEE      001179 R
  6 EMIT       0000C7 R   |   6 EQ1        000443 R   |   6 EQUAL      00042D R
  6 ERASE      000856 R   |     ERR     =  00001B     |   6 EVAL       000FF8 R
  6 EVAL1      000FF8 R   |   6 EVAL2      001014 R   |   6 EXE1       0007EB R
  6 EXECU      000137 R   |   6 EXIT       000147 R   |     EXT     =  000001 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |   6 EXTRC      0008B1 R
    FHSE    =  7A1200     |     FHSI    =  F42400     |   6 FILL       000823 R
  6 FILL1      000840 R   |   6 FILL2      000849 R   |   6 FIND       000D96 R
  6 FIND1      000DB4 R   |   6 FIND2      000DE2 R   |   6 FIND3      000DEE R
  6 FIND4      000E02 R   |   6 FIND5      000E0F R   |   6 FIND6      000DF3 R
    FLASH_BA=  008000     |     FLASH_CR=  00505A     |     FLASH_CR=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_CR=  000000     |     FLASH_CR=  000003     |     FLASH_CR=  000001 
    FLASH_CR=  00505B     |     FLASH_CR=  000005     |     FLASH_CR=  000004 
    FLASH_CR=  000007     |     FLASH_CR=  000000     |     FLASH_CR=  000006 
    FLASH_DU=  005064     |     FLASH_DU=  0000AE     |     FLASH_DU=  000056 
    FLASH_EN=  027FFF     |     FLASH_FP=  00505D     |     FLASH_FP=  000000 
    FLASH_FP=  000001     |     FLASH_FP=  000002     |     FLASH_FP=  000003 
    FLASH_FP=  000004     |     FLASH_FP=  000005     |     FLASH_IA=  00505F 
    FLASH_IA=  000003     |     FLASH_IA=  000002     |     FLASH_IA=  000006 
    FLASH_IA=  000001     |     FLASH_IA=  000000     |     FLASH_NC=  00505C 
    FLASH_NF=  00505E     |     FLASH_NF=  000000     |     FLASH_NF=  000001 
    FLASH_NF=  000002     |     FLASH_NF=  000003     |     FLASH_NF=  000004 
    FLASH_NF=  000005     |     FLASH_PU=  005062     |     FLASH_PU=  000056 
    FLASH_PU=  0000AE     |     FLASH_SI=  020000     |     FLASH_WS=  00480D 
    FLSI    =  01F400     |   6 FOR        001108 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  6 HERE       0007A7 R   |   6 HEX        000960 R   |   6 HI         0014CC R
  6 HLD        000315 R   |   6 HOLD       0008D5 R   |     HSECNT  =  004809 
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
  6 IFF        001153 R   |     IMEDD   =  000080     |   6 IMMED      00132A R
  6 INCH       0000BB R   |   6 INN        0002E5 R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
  6 INTE1      000F97 R   |   6 INTER      000F6D R   |     INT_ADC2=  000016 
    INT_AUAR=  000012     |     INT_AWU =  000001     |     INT_CAN_=  000008 
    INT_CAN_=  000009     |     INT_CLK =  000002     |     INT_EXTI=  000003 
    INT_EXTI=  000004     |     INT_EXTI=  000005     |     INT_EXTI=  000006 
    INT_EXTI=  000007     |     INT_FLAS=  000018     |     INT_I2C =  000013 
    INT_SPI =  00000A     |     INT_TIM1=  00000C     |     INT_TIM1=  00000B 
    INT_TIM2=  00000E     |     INT_TIM2=  00000D     |     INT_TIM3=  000010 
    INT_TIM3=  00000F     |     INT_TIM4=  000017     |     INT_TLI =  000000 
    INT_UART=  000011     |     INT_UART=  000015     |     INT_UART=  000014 
    INT_VECT=  008060     |     INT_VECT=  00800C     |     INT_VECT=  008028 
    INT_VECT=  00802C     |     INT_VECT=  008010     |     INT_VECT=  008014 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]

Symbol Table

    INT_VECT=  008018     |     INT_VECT=  00801C     |     INT_VECT=  008020 
    INT_VECT=  008024     |     INT_VECT=  008068     |     INT_VECT=  008054 
    INT_VECT=  008000     |     INT_VECT=  008030     |     INT_VECT=  008038 
    INT_VECT=  008034     |     INT_VECT=  008040     |     INT_VECT=  00803C 
    INT_VECT=  008048     |     INT_VECT=  008044     |     INT_VECT=  008064 
    INT_VECT=  008008     |     INT_VECT=  008004     |     INT_VECT=  008050 
    INT_VECT=  00804C     |     INT_VECT=  00805C     |     INT_VECT=  008058 
  6 INVER      0003C1 R   |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  6 JSRC       001306 R   |   6 KEY        000AA0 R   |   6 KTAP       000E87 R
  6 KTAP1      000EAA R   |   6 KTAP2      000EAD R   |   6 LAST       000346 R
  6 LASTN   =  0015BB R   |   6 LBRAC      000FA4 R   |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |   6 LESS       00046A R
    LF      =  00000A     |   6 LINK    =  0015BB R   |   6 LITER      0010D9 R
  6 LT1        000480 R   |     MASKK   =  001F7F     |   6 MAX        00048A R
  6 MAX1       00049D R   |   6 MIN        0004A7 R   |   6 MIN1       0004BA R
  6 MMOD1      00055D R   |   6 MMOD2      000571 R   |   6 MMOD3      000588 R
  6 MMSM1      000504 R   |   6 MMSM2      000518 R   |   6 MMSM3      00051A R
  6 MMSM4      000522 R   |   6 MODD       0005A2 R   |   6 MONE       0006D3 R
    MS      =  000026     |   6 MSEC       00009A R   |   6 MSMOD      000540 R
  6 MSTA1      000633 R   |   6 MSTAR      000610 R   |     NAFR    =  004804 
  6 NAMEQ      000E2F R   |   6 NAMET      000D40 R   |     NCLKOPT =  004808 
  6 NEGAT      0003D2 R   |   6 NEX1       0000FE R   |   6 NEXT       001118 R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   6 NTIB       0002F5 R   |     NUBC    =  004802 
  6 NUFQ       000AB6 R   |   6 NUFQ1      000ACF R   |   6 NUMBQ      0009CD R
  6 NUMQ1      000A01 R   |   6 NUMQ2      000A32 R   |   6 NUMQ3      000A74 R
  6 NUMQ4      000A79 R   |   6 NUMQ5      000A88 R   |   6 NUMQ6      000A8B R
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R
  6 ONE        0006C5 R   |   6 ONEM       000693 R   |   6 ONEP       000686 R
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   6 ORIG       000036 R   |   6 ORR        00026C R
  6 OUTPUT     0000CC R   |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |   6 OVER       000236 R
  6 OVERT      0012D3 R   |     PA      =  000000     |   6 PACKS      000868 R
  6 PAD        0007B8 R   |   6 PAREN      000CF3 R   |   6 PARS       000BEC R
  6 PARS1      000C17 R   |   6 PARS2      000C42 R   |   6 PARS3      000C45 R
  6 PARS4      000C4E R   |   6 PARS5      000C71 R   |   6 PARS6      000C86 R
  6 PARS7      000C95 R   |   6 PARS8      000CA4 R   |   6 PARSE      000CB5 R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
  6 PDUM1      0013AE R   |   6 PDUM2      0013BF R   |     PD_BASE =  00500F 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]

Symbol Table

    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
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
    PI      =  000028     |     PICATOUT=  000001     |   6 PICK       000714 R
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  6 PLUS       0003A7 R   |   6 PNAM1      001288 R   |   6 PRESE      001023 R
    PROD1   =  00001A     |     PROD2   =  00001C     |     PROD3   =  00001E 
  6 PSTOR      000729 R   |   6 QBRAN      000110 R   |   6 QDUP       000356 R
  6 QDUP1      000360 R   |   6 QKEY       0000A9 R   |   6 QSTAC      000FDB R
  6 QUERY      000F07 R   |   6 QUEST      000BDE R   |   6 QUIT       001040 R
  6 QUIT1      001048 R   |   6 QUIT2      00104B R   |     RAMBASE =  000000 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  6 RAT        0001C9 R   |   6 RBRAC      0012F3 R   |   6 REPEA      0011CE R
  6 RFROM      0001B6 R   |     ROP     =  004800     |   6 ROT        000367 R
    RP0     =  000024     |   6 RPAT       000193 R   |     RPP     =  0017FF 
  6 RPSTO      0001A0 R   |     RST_SR  =  0050B3     |   6 SAME1      000D5E R
  6 SAME2      000D87 R   |   6 SAMEQ      000D56 R   |   6 SCOM1      0012BD R
  6 SCOM2      0012C0 R   |   6 SCOMP      00129F R   |   6 SEMIS      0012E3 R
    SFR_BASE=  005000     |     SFR_END =  0057FF     |   6 SIGN       000914 R
  6 SIGN1      000924 R   |   6 SLASH      0005AC R   |   6 SLMOD      000590 R
  6 SNAME      001252 R   |     SP0     =  000022     |   6 SPACE      000AD8 R
  6 SPACS      000AE7 R   |   6 SPAT       0001EC R   |     SPI_CR1 =  005200 
    SPI_CR2 =  005201     |     SPI_CRCP=  005205     |     SPI_DR  =  005204 
    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
    SPI_TXCR=  005207     |     SPP     =  0016F0     |   6 SPSTO      0001F9 R
  6 SSMOD      00063C R   |     STACK   =  0017FF     |   6 STAR       000605 R
  6 STASL      00064D R   |   6 STORE      00014E R   |   6 STR        000942 R
  6 STRCQ      0010E8 R   |   6 STRQ       001209 R   |   6 STRQP      000B55 R
  6 SUBB       000405 R   |   6 SWAPP      00021C R   |     SWIM_CSR=  007F80 
  6 TAP        000E71 R   |   6 TBOOT      0014ED R   |   6 TCHA1      0006F4 R
  6 TCHAR      0006E4 R   |   6 TEMP       0002D6 R   |   6 TEVAL      000306 R
  6 THENN      001169 R   |   6 TIB        0007C9 R   |     TIBB    =  001700 
    TIBBASE =  001700     |     TIC     =  000027     |   6 TICK       001057 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]

Symbol Table

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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_PSC=  000001     |     TIM4_PSC=  000005     |     TIM4_PSC=  000002 
    TIM4_PSC=  000006     |     TIM4_PSC=  000003     |     TIM4_PSC=  000000 
    TIM4_PSC=  000001     |     TIM4_PSC=  000002     |     TIM4_SR =  005342 
    TIM4_SR_=  000000     |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
    TIM_CR1_=  000006     |     TIM_CR1_=  000005     |     TIM_CR1_=  000004 
    TIM_CR1_=  000003     |     TIM_CR1_=  000001     |     TIM_CR1_=  000002 
  6 TNAM2      001447 R   |   6 TNAM3      001465 R   |   6 TNAM4      00146B R
  6 TNAME      001444 R   |   6 TOKEN      000D32 R   |   6 TOR        0001D5 R
    TRUEE   =  00FFFF     |   6 TWOSL      0006A0 R   |   6 TYPE1      000B07 R
  6 TYPE2      000B13 R   |   6 TYPES      000B02 R   |   6 Timer4Ha   000005 R
    UART1   =  000000     |     UART1_BA=  005230     |     UART1_BR=  005232 
    UART1_BR=  005233     |     UART1_CR=  005234     |     UART1_CR=  005235 
    UART1_CR=  005236     |     UART1_CR=  005237     |     UART1_CR=  005238 
    UART1_DR=  005231     |     UART1_GT=  005239     |     UART1_PO=  000000 
    UART1_PS=  00523A     |     UART1_RX=  000004     |     UART1_SR=  005230 
    UART1_TX=  000005     |     UART3   =  000001     |     UART3_BA=  005240 
    UART3_BR=  005242     |     UART3_BR=  005243     |     UART3_CR=  005244 
    UART3_CR=  005245     |     UART3_CR=  005246     |     UART3_CR=  005247 
    UART3_CR=  004249     |     UART3_DR=  005241     |     UART3_PO=  00000F 
    UART3_RX=  000006     |     UART3_SR=  005240     |     UART3_TX=  000005 
    UART_BRR=  000002     |     UART_BRR=  000003     |     UART_CR1=  000004 
    UART_CR1=  000004     |     UART_CR1=  000002     |     UART_CR1=  000000 
    UART_CR1=  000001     |     UART_CR1=  000007     |     UART_CR1=  000006 
    UART_CR1=  000005     |     UART_CR1=  000003     |     UART_CR2=  000005 
    UART_CR2=  000004     |     UART_CR2=  000002     |     UART_CR2=  000005 
    UART_CR2=  000001     |     UART_CR2=  000000     |     UART_CR2=  000006 
    UART_CR2=  000003     |     UART_CR2=  000007     |     UART_CR3=  000006 
    UART_CR3=  000003     |     UART_CR3=  000001     |     UART_CR3=  000002 
    UART_CR3=  000000     |     UART_CR3=  000006     |     UART_CR3=  000004 
    UART_CR3=  000005     |     UART_CR4=  000007     |     UART_CR4=  000000 
    UART_CR4=  000001     |     UART_CR4=  000002     |     UART_CR4=  000003 
    UART_CR4=  000004     |     UART_CR4=  000006     |     UART_CR4=  000005 
    UART_CR5=  000008     |     UART_CR5=  000003     |     UART_CR5=  000001 
    UART_CR5=  000002     |     UART_CR5=  000004     |     UART_CR5=  000005 
    UART_CR6=  000009     |     UART_CR6=  000004     |     UART_CR6=  000007 
    UART_CR6=  000001     |     UART_CR6=  000002     |     UART_CR6=  000000 
    UART_CR6=  000005     |     UART_DR =  000001     |     UART_GTR=  000009 
    UART_PSC=  00000A     |     UART_SR =  000000     |     UART_SR_=  000001 
    UART_SR_=  000004     |     UART_SR_=  000002     |     UART_SR_=  000003 
    UART_SR_=  000000     |     UART_SR_=  000005     |     UART_SR_=  000006 
    UART_SR_=  000007     |     UBC     =  004801     |     UD1     =  000001 
    UD2     =  000002     |     UD3     =  000003     |     UD4     =  000004 
  6 UDOT       000BA8 R   |   6 UDOTR      000B88 R   |   6 ULAST      000034 R
  6 ULES1      000462 R   |   6 ULESS      00044C R   |   6 UMMOD      0004E2 R
  6 UMSTA      0005BB R   |   6 UNIQ1      001249 R   |   6 UNIQU      00122A R
  6 UNTIL      001134 R   |   6 UPL1       0002AD R   |   6 UPLUS      000296 R
    UPP     =  000006     |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |   6 UTYP1      00137E R   |   6 UTYP2      00138D R
  6 UTYPE      001379 R   |   6 UZERO      000020 R   |   6 VARIA      001368 R
    VER     =  000002     |     VSIZE   =  000002     |     WANT_DEB=  000000 
    WANT_SEE=  000000     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
  6 WHILE      0011B3 R   |   6 WITHI      0004C7 R   |   6 WORDD      000D1E R
  6 WORDS      0014A1 R   |   6 WORS1      0014A7 R   |   6 WORS2      0014C6 R
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |   6 XORR       000281 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]

Symbol Table

    XTEMP   =  00001A     |     YTEMP   =  00001C     |   6 ZERO       0006BA R
  6 ZL1        00024E R   |   6 ZLESS      000245 R   |   6 clear_ra   000012 R
  6 clock_in   000051 R   |     da      =  000002     |     db      =  000003 
    dc      =  000000     |     dd      =  000001     |   6 eeprom     00153F R
  6 farat      001551 R   |   6 farcat     00156D R   |     farptr  =  000002 
  6 fptr_sto   001520 R   |   6 main       00000F R   |     ptr16   =  000003 
    ptr8    =  000004     |   6 uart1_in   000063 R   |   6 unlock_e   001584 R
  6 unlock_f   0015A3 R   |   6 user_spa   00163C R   |   6 write_by   0015C1 R
  6 write_ee   001600 R   |   6 write_ex   001639 R   |   6 write_fl   0015EA R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   163C   flags    0

