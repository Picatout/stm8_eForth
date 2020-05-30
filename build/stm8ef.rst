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
                           000028   109 CNTDWN =        40      ; count down timer 
                                    110 
                                    111 ;***********************************************
                                    112 ;; Version control
                                    113 
                           000002   114 VER     =     2         ;major release version
                           000001   115 EXT     =     1         ;minor extension
                                    116 
                                    117 ;; Constants
                                    118 
                           00FFFF   119 TRUEE   =     0xFFFF      ;true flag
                                    120 
                           000040   121 COMPO   =     0x40     ;lexicon compile only bit
                           000080   122 IMEDD   =     0x80     ;lexicon immediate bit
                           001F7F   123 MASKK   =     0x1F7F  ;lexicon bit mask
                                    124 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                           000002   125 CELLL   =     2       ;size of a cell
                           00000A   126 BASEE   =     10      ;default radix
                           000008   127 BKSPP   =     8       ;back space
                           00000A   128 LF      =     10      ;line feed
                           00000D   129 CRR     =     13      ;carriage return
                           00001B   130 ERR     =     27      ;error escape
                           000027   131 TIC     =     39      ;tick
                           0000CD   132 CALLL   =     0xCD     ;CALL opcodes
                                    133 
                                    134 ;; Memory allocation
                                    135 
                           000006   136 UPP     =     RAMBASE+6
                           0016F0   137 SPP     =     RAMBASE+DATSTK
                           0017FF   138 RPP     =     RAMBASE+STACK
                           001700   139 TIBB    =     RAMBASE+TIBBASE
                           000080   140 CTOP    =     RAMBASE+0x80
                                    141 
                           000001   142 .if PICATOUT_MOD 
                                    143 ; user variables constants 
                           000006   144 UBASE = RAMBASE+6 ; numeric base 
                           000008   145 UTMP = UBASE+2    ; temporary storage
                           00000A   146 UINN = UTMP+2     ; >IN tib pointer 
                           00000C   147 UCTIB = UINN+2    ; tib count 
                           00000E   148 UTIB = UCTIB+2    ; tib address 
                           000010   149 UINTER = UTIB+2   ; interpreter vector 
                           000012   150 UHLD = UINTER+2   ; hold 
                           000014   151 UCNTXT = UHLD+2   ; context 
                           000016   152 UCP = UCNTXT+2    ; ram dictionary pointer 
                           000018   153 ULAST = UCP+2     ; flash dictionary pointer 
                           004000   154 APP_LAST = EEPROM_BASE ; Application last word pointer  
                           004002   155 APP_RUN = APP_LAST+2   ; application autorun address 
                           004004   156 APP_HERE = APP_RUN+2   ; free application space 
                                    157 .endif ; PICATOUT_MOD
                                    158 
                                    159 
                                    160         .macro _ledon
                                    161         bset PC_ODR,#LED2_BIT
                                    162         .endm
                                    163 
                                    164         .macro _ledoff
                                    165         bres PC_ODR,#LED2_BIT
                                    166         .endm
                                    167 
                                    168 ;**********************************************************
                                    169         .area DATA (ABS)
      000000                        170         .org RAMBASE 
                                    171 ;**********************************************************
                                    172 
                                    173 ;**********************************************************
                                    174         .area SSEG (ABS) ; STACK
      001700                        175         .org 0x1700
      001700                        176         .ds 256 
                                    177 ; space for DATSTK,TIB and STACK         
                                    178 ;**********************************************************
                                    179 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    180 ;**********************************************************
                                    181         .area HOME ; vectors table
                                    182 ;**********************************************************
      008000 82 00 80 96            183 	int main	        ; reset
      008004 82 00 80 80            184 	int NonHandledInterrupt	; trap
      008008 82 00 80 80            185 	int NonHandledInterrupt	; irq0
      00800C 82 00 80 80            186 	int NonHandledInterrupt	; irq1
      008010 82 00 80 80            187 	int NonHandledInterrupt	; irq2
      008014 82 00 80 80            188 	int NonHandledInterrupt	; irq3
      008018 82 00 80 80            189 	int NonHandledInterrupt	; irq4
      00801C 82 00 80 80            190 	int NonHandledInterrupt	; irq5
      008020 82 00 80 80            191 	int NonHandledInterrupt	; irq6
      008024 82 00 80 80            192 	int NonHandledInterrupt	; irq7
      008028 82 00 80 80            193 	int NonHandledInterrupt	; irq8
      00802C 82 00 80 80            194 	int NonHandledInterrupt	; irq9
      008030 82 00 80 80            195 	int NonHandledInterrupt	; irq10
      008034 82 00 80 80            196 	int NonHandledInterrupt	; irq11
      008038 82 00 80 80            197 	int NonHandledInterrupt	; irq12
      00803C 82 00 80 80            198 	int NonHandledInterrupt	; irq13
      008040 82 00 80 80            199 	int NonHandledInterrupt	; irq14
      008044 82 00 80 80            200 	int NonHandledInterrupt	; irq15
      008048 82 00 80 80            201 	int NonHandledInterrupt	; irq16
      00804C 82 00 80 80            202 	int NonHandledInterrupt	; irq17
      008050 82 00 80 80            203 	int NonHandledInterrupt	; irq18
      008054 82 00 80 80            204 	int NonHandledInterrupt	; irq19
      008058 82 00 80 80            205 	int NonHandledInterrupt	; irq20
      00805C 82 00 80 80            206 	int NonHandledInterrupt	; irq21
      008060 82 00 80 80            207 	int NonHandledInterrupt	; irq22
      008064 82 00 80 85            208 	int Timer4Handler	; irq23
      008068 82 00 80 80            209 	int NonHandledInterrupt	; irq24
      00806C 82 00 80 80            210 	int NonHandledInterrupt	; irq25
      008070 82 00 80 80            211 	int NonHandledInterrupt	; irq26
      008074 82 00 80 80            212 	int NonHandledInterrupt	; irq27
      008078 82 00 80 80            213 	int NonHandledInterrupt	; irq28
      00807C 82 00 80 80            214 	int NonHandledInterrupt	; irq29
                                    215 
                                    216 ;**********************************************************
                                    217         .area CODE
                                    218 ;**********************************************************
                                    219 
                                    220 ; non handled interrupt reset MCU
      008080                        221 NonHandledInterrupt:
      008080 A6 80            [ 1]  222         ld a, #0x80
      008082 C7 50 D1         [ 1]  223         ld WWDG_CR,a ; WWDG_CR used to reset mcu
                                    224 	;iret
                                    225 
                                    226 ; used for milliseconds counter 
                                    227 ; MS is 16 bits counter 
      008085                        228 Timer4Handler:
      008085 72 5F 53 42      [ 1]  229 	clr TIM4_SR 
      008089 BE 26            [ 2]  230         ldw x,MS 
      00808B 5C               [ 2]  231         incw x 
      00808C BF 26            [ 2]  232         ldw MS,x
      00808E BE 28            [ 2]  233         ldw x,CNTDWN 
      008090 27 03            [ 1]  234         jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      008092 5A               [ 2]  235         decw x 
      008093 BF 28            [ 2]  236         ldw CNTDWN,x 
      008095                        237 1$:         
      008095 80               [11]  238         iret 
                                    239 
                                    240 
                                    241 ;; Main entry points and COLD start data
      008096                        242 main:
                                    243 ; clear all RAM
      008096 AE 00 00         [ 2]  244 	ldw X,#RAMBASE
      008099                        245 clear_ram0:
      008099 7F               [ 1]  246 	clr (X)
      00809A 5C               [ 2]  247 	incw X
      00809B A3 17 FF         [ 2]  248 	cpw X,#RAM_END
      00809E 23 F9            [ 2]  249 	jrule clear_ram0
      0080A0 AE 17 FF         [ 2]  250         ldw x,#RPP
      0080A3 94               [ 1]  251         ldw sp,x 
      0080A4 CC 80 BD         [ 2]  252 	jp ORIG
                                    253 
                                    254 ; COLD initialize these variables.
      0080A7                        255 UZERO:
      0080A7 00 0A                  256         .word      BASEE   ;BASE
      0080A9 00 00                  257         .word      0       ;tmp
      0080AB 00 00                  258         .word      0       ;>IN
      0080AD 00 00                  259         .word      0       ;#TIB
      0080AF 17 00                  260         .word      TIBB    ;TIB
      0080B1 90 3A                  261         .word      INTER   ;'EVAL
      0080B3 00 00                  262         .word      0       ;HLD
      0080B5 98 89                  263         .word       LASTN  ;CNTXT pointer
      0080B7 00 80                  264         .word       CTOP   ;CP in RAM
      0080B9 98 89                  265         .word      LASTN   ;LAST
      0080BB 00 00                  266 UEND:  .word      0
                                    267 
      0080BD                        268 ORIG:   
                                    269 ; initialize SP
      0080BD AE 17 FF         [ 2]  270         LDW     X,#STACK  ;initialize return stack
      0080C0 94               [ 1]  271         LDW     SP,X
      0080C1 BF 24            [ 2]  272         LDW     RP0,X
      0080C3 AE 16 F0         [ 2]  273         LDW     X,#DATSTK ;initialize data stack
      0080C6 BF 22            [ 2]  274         LDW     SP0,X
                                    275 ; initialize PC_5 as output to control LED2
                                    276 ; added by Picatout 
      0080C8 72 1A 50 0D      [ 1]  277         bset PC_CR1,#LED2_BIT
      0080CC 72 1A 50 0E      [ 1]  278         bset PC_CR2,#LED2_BIT
      0080D0 72 1A 50 0C      [ 1]  279         bset PC_DDR,#LED2_BIT
      000054                        280         _ledoff
      0080D4 72 1B 50 0A      [ 1]    1         bres PC_ODR,#LED2_BIT
                                    281 ; initialize clock to HSI
                                    282 ; no divisor 16Mhz 
                                    283 ; Added by Picatout 
      0080D8                        284 clock_init:
      0080D8 72 5F 50 C6      [ 1]  285         clr CLK_CKDIVR
      0080DC 72 12 50 C5      [ 1]  286 	bset CLK_SWCR,#CLK_SWCR_SWEN
      0080E0 A6 E1            [ 1]  287 	ld a,#CLK_SWR_HSI
      0080E2 C7 50 C4         [ 1]  288 	ld CLK_SWR,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      0080E5 C1 50 C3         [ 1]  289 1$:	cp a,CLK_CMSR
      0080E8 26 FB            [ 1]  290 	jrne 1$
                                    291         
                                    292 ; initialize UART1, 115200 8N1
      0080EA                        293 uart1_init:
      0080EA 72 14 50 C7      [ 1]  294 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1
                                    295 	; configure tx pin
      0080EE 72 1A 50 02      [ 1]  296 	bset PA_DDR,#UART1_TX_PIN ; tx pin
      0080F2 72 1A 50 03      [ 1]  297 	bset PA_CR1,#UART1_TX_PIN ; push-pull output
      0080F6 72 1A 50 04      [ 1]  298 	bset PA_CR2,#UART1_TX_PIN ; fast output
                                    299 	; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
      0080FA 35 0B 52 33      [ 1]  300 	mov UART1_BRR2,#0x0b ; must be loaded first
      0080FE 35 08 52 32      [ 1]  301 	mov UART1_BRR1,#0x8
      008102 35 0C 52 35      [ 1]  302 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                                    303 ; initialize timer4, used for millisecond interrupt  
      008106 35 07 53 45      [ 1]  304 	mov TIM4_PSCR,#7 ; prescale 128  
      00810A 35 7D 53 46      [ 1]  305 	mov TIM4_ARR,#125 ; set for 1msec.
      00810E 35 05 53 40      [ 1]  306 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008112 72 10 53 41      [ 1]  307 	bset TIM4_IER,#TIM4_IER_UIE 
      008116 9A               [ 1]  308         rim
      008117 CC 95 F0         [ 2]  309         jp  COLD   ;default=MN1
                                    310 
                                    311 
                                    312 ;; get millisecond counter 
                                    313 ;; msec ( -- u )
                                    314 ;; Added by Picatout 2020-04-26
      00811A 00 00                  315         .word 0 
                           00009C   316 LINK = . 
      00811C 04                     317         .byte 4
      00811D 4D 53 45 43            318         .ascii "MSEC"
      008121                        319 MSEC: 
      008121 1D 00 02         [ 2]  320         subw x,#CELLL 
      008124 90 BE 26         [ 2]  321         ldw y,MS 
      008127 FF               [ 2]  322         ldw (x),y 
      008128 81               [ 4]  323         ret 
                                    324 
                                    325 ; suspend execution for u msec 
                                    326 ;  pause ( u -- )
      008129 81 1C                  327         .word LINK 
                           0000AB   328         LINK=.
      00812B 05                     329         .byte 5 
      00812C 50 41 55 53 45         330         .ascii "PAUSE"
      008131                        331 PAUSE:
      008131 90 93            [ 1]  332         ldw y,x
      008133 90 FE            [ 2]  333         ldw y,(y)
      008135 72 B9 00 26      [ 2]  334         addw y,MS 
      008139 8F               [10]  335 1$:     wfi  
      00813A 90 B3 26         [ 2]  336         cpw y,MS  
      00813D 26 FA            [ 1]  337         jrne 1$        
      00813F 1C 00 02         [ 2]  338         addw x,#CELLL 
      008142 81               [ 4]  339         ret 
                                    340 
                                    341 ; initialize count down timer 
                                    342 ;  TIMER ( u -- )  milliseconds 
      008143 81 2B                  343         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                           0000C5   344         LINK=.
      008145 05                     345         .byte 5 
      008146 54 49 4D 45 52         346         .ascii "TIMER" 
      00814B                        347 TIMER:
      00814B 90 93            [ 1]  348         ldw y,x
      00814D 90 FE            [ 2]  349         ldw y,(y) 
      00814F 90 BF 28         [ 2]  350         ldw CNTDWN,y
      008152 1C 00 02         [ 2]  351         addw x,#CELLL 
      008155 81               [ 4]  352         ret 
                                    353 
                                    354 ; check for TIMER exiparition 
                                    355 ;  TIMEOUT? ( -- 0|-1 )
      008156 81 45                  356         .word LINK 
                           0000D8   357         LINK=. 
      008158 08                     358         .byte 8 
      008159 54 49 4D 45 4F 55 54   359         .ascii "TIMEOUT?"
             3F
      008161                        360 TIMEOUTQ: 
      008161 4F               [ 1]  361         clr a
      008162 1D 00 02         [ 2]  362         subw x,#CELLL 
      008165 90 BE 28         [ 2]  363         ldw y,CNTDWN 
      008168 26 01            [ 1]  364         jrne 1$ 
      00816A 43               [ 1]  365         cpl a 
      00816B E7 01            [ 1]  366 1$:     ld (1,x),a 
      00816D F7               [ 1]  367         ld (x),a 
      00816E 81               [ 4]  368         ret         
                                    369 
                                    370 ;; Device dependent I/O
                                    371 ;       ?RX     ( -- c T | F )
                                    372 ;         Return input byte and true, or false.
      00816F 81 58                  373         .word      LINK 
                           0000F1   374 LINK	= .
      008171 04                     375         .byte      4
      008172 3F 4B 45 59            376         .ascii     "?KEY"
      008176                        377 QKEY:
      008176 90 5F            [ 1]  378         CLRW Y 
      008178 72 0B 52 30 0B   [ 2]  379         BTJF UART1_SR,#UART_SR_RXNE,INCH   ;check status
      00817D C6 52 31         [ 1]  380         LD    A,UART1_DR   ;get char in A
      008180 1D 00 02         [ 2]  381 	SUBW	X,#2
      008183 E7 01            [ 1]  382         LD     (1,X),A
      008185 7F               [ 1]  383 	CLR	(X)
      008186 90 53            [ 2]  384         CPLW     Y
      008188                        385 INCH:
      008188 1D 00 02         [ 2]  386 	SUBW	X,#2
      00818B FF               [ 2]  387         LDW     (X),Y
      00818C 81               [ 4]  388         RET
                                    389 
                                    390 ;       TX!     ( c -- )
                                    391 ;       Send character c to  output device.
      00818D 81 71                  392         .word      LINK
                           00010F   393 LINK	= .
      00818F 04                     394         .byte      4
      008190 45 4D 49 54            395         .ascii     "EMIT"
      008194                        396 EMIT:
      008194 E6 01            [ 1]  397         LD     A,(1,X)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      008196 1C 00 02         [ 2]  398 	ADDW	X,#2
      008199 72 0F 52 30 FB   [ 2]  399 OUTPUT: BTJF UART1_SR,#UART_SR_TXE,OUTPUT  ;loop until tdre
      00819E C7 52 31         [ 1]  400         LD    UART1_DR,A   ;send A
      0081A1 81               [ 4]  401         RET
                                    402 
                                    403 ;; The kernel
                                    404 
                                    405 ;       doLIT   ( -- w )
                                    406 ;       Push an inline literal.
      0081A2 81 8F                  407         .word      LINK
                           000124   408 LINK	= 	.
      0081A4 45                     409 	.byte      COMPO+5
      0081A5 44 4F 4C 49 54         410         .ascii     "DOLIT"
      0081AA                        411 DOLIT:
      0081AA 1D 00 02         [ 2]  412 	SUBW X,#2
                           000001   413 .if PICATOUT_MOD 
      0081AD 16 01            [ 2]  414         ldw y,(1,sp)
      0081AF 90 FE            [ 2]  415         ldw y,(y)
      0081B1 FF               [ 2]  416         ldw (x),y
      0081B2 90 85            [ 2]  417         popw y 
                           000000   418 .else 
                                    419         POPW Y
                                    420 	LDW YTEMP,Y
                                    421 	LDW Y,(Y)
                                    422         LDW (X),Y
                                    423         LDW Y,YTEMP
                                    424 .endif 
      0081B4 90 EC 02         [ 2]  425 	JP (2,Y)
                                    426 
                                    427 ;       next    ( -- )
                                    428 ;       Code for  single index loop.
      0081B7 81 A4                  429         .word      LINK
                           000139   430 LINK	= 	.
      0081B9 44                     431 	.byte      COMPO+4
      0081BA 4E 45 58 54            432         .ascii     "NEXT"
      0081BE                        433 DONXT:
      0081BE 16 03            [ 2]  434 	LDW Y,(3,SP)
      0081C0 90 5A            [ 2]  435 	DECW Y
      0081C2 2A 07            [ 1]  436 	JRPL NEX1
      0081C4 90 85            [ 2]  437 	POPW Y
                           000001   438 .if PICATOUT_MOD
      0081C6 5B 02            [ 2]  439         addw sp,#2
                           000000   440 .else        
                                    441 	POP A
                                    442 	POP A
                                    443 .endif         
      0081C8 90 EC 02         [ 2]  444         JP (2,Y)
      0081CB                        445 NEX1:
      0081CB 17 03            [ 2]  446         LDW (3,SP),Y
      0081CD 90 85            [ 2]  447         POPW Y
      0081CF 90 FE            [ 2]  448 	LDW Y,(Y)
      0081D1 90 FC            [ 2]  449 	JP (Y)
                                    450 
                                    451 ;       ?branch ( f -- )
                                    452 ;       Branch if flag is zero.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      0081D3 81 B9                  453         .word      LINK
                           000155   454 LINK	= 	.
      0081D5 47                     455 	.byte      COMPO+7
      0081D6 3F 42 52 41 4E 43 48   456         .ascii     "?BRANCH"
      0081DD                        457 QBRAN:	
      0081DD 90 93            [ 1]  458         LDW Y,X
      0081DF 1C 00 02         [ 2]  459 	ADDW X,#2
      0081E2 90 FE            [ 2]  460 	LDW Y,(Y)
      0081E4 27 0E            [ 1]  461         JREQ     BRAN
      0081E6 90 85            [ 2]  462 	POPW Y
      0081E8 90 EC 02         [ 2]  463 	JP (2,Y)
                                    464         
                                    465 ;       branch  ( -- )
                                    466 ;       Branch to an inline address.
      0081EB 81 D5                  467         .word      LINK
                           00016D   468 LINK	= 	.
      0081ED 46                     469 	.byte      COMPO+6
      0081EE 42 52 41 4E 43 48      470         .ascii     "BRANCH"
      0081F4                        471 BRAN:
      0081F4 90 85            [ 2]  472         POPW Y
      0081F6 90 FE            [ 2]  473 	LDW Y,(Y)
      0081F8 90 FC            [ 2]  474         JP     (Y)
                                    475 
                                    476 ;       EXECUTE ( ca -- )
                                    477 ;       Execute  word at ca.
      0081FA 81 ED                  478         .word      LINK
                           00017C   479 LINK	= 	.
      0081FC 07                     480         .byte       7
      0081FD 45 58 45 43 55 54 45   481         .ascii     "EXECUTE"
      008204                        482 EXECU:
      008204 90 93            [ 1]  483         LDW Y,X
      008206 1C 00 02         [ 2]  484 	ADDW X,#2
      008209 90 FE            [ 2]  485 	LDW  Y,(Y)
      00820B 90 FC            [ 2]  486         JP   (Y)
                                    487 
                                    488 ;       EXIT    ( -- )
                                    489 ;       Terminate a colon definition.
      00820D 81 FC                  490         .word      LINK
                           00018F   491 LINK = .
      00820F 04                     492         .byte      4
      008210 45 58 49 54            493         .ascii     "EXIT"
      008214                        494 EXIT:
      008214 90 85            [ 2]  495         POPW Y
      008216 81               [ 4]  496         RET
                                    497 
                                    498 ;       !       ( w a -- )
                                    499 ;       Pop  data stack to memory.
      008217 82 0F                  500         .word      LINK
                           000199   501 LINK = .
      008219 01                     502         .byte      1
      00821A 21                     503         .ascii     "!"
      00821B                        504 STORE:
      00821B 90 93            [ 1]  505         LDW Y,X
      00821D 90 FE            [ 2]  506         LDW Y,(Y)    ;Y=a
      00821F 90 BF 1C         [ 2]  507         LDW YTEMP,Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008222 90 93            [ 1]  508         LDW Y,X
      008224 90 EE 02         [ 2]  509         LDW Y,(2,Y)
      008227 91 CF 1C         [ 5]  510         LDW [YTEMP],Y ;store w at a
      00822A 1C 00 04         [ 2]  511         ADDW X,#4 ; DDROP 
      00822D 81               [ 4]  512         RET     
                                    513 
                                    514 ;       @       ( a -- w )
                                    515 ;       Push memory location to stack.
      00822E 82 19                  516         .word      LINK
                           0001B0   517 LINK	= 	.
      008230 01                     518         .byte    1
      008231 40                     519         .ascii	"@"
      008232                        520 AT:
      008232 90 93            [ 1]  521         LDW Y,X     ;Y = a
      008234 90 FE            [ 2]  522         LDW Y,(Y)   ; address 
      008236 90 FE            [ 2]  523         LDW Y,(Y)   ; value 
      008238 FF               [ 2]  524         LDW (X),Y ;w = @Y
      008239 81               [ 4]  525         RET     
                                    526 
                                    527 ;       C!      ( c b -- )
                                    528 ;       Pop  data stack to byte memory.
      00823A 82 30                  529         .word      LINK
                           0001BC   530 LINK	= .
      00823C 02                     531         .byte      2
      00823D 43 21                  532         .ascii     "C!"
      00823F                        533 CSTOR:
      00823F 90 93            [ 1]  534         LDW Y,X
      008241 90 FE            [ 2]  535 	LDW Y,(Y)    ;Y=b
      008243 E6 03            [ 1]  536         LD A,(3,X)    ;D = c
      008245 90 F7            [ 1]  537         LD  (Y),A     ;store c at b
      008247 1C 00 04         [ 2]  538 	ADDW X,#4 ; DDROP 
      00824A 81               [ 4]  539         RET     
                                    540 
                                    541 ;       C@      ( b -- c )
                                    542 ;       Push byte in memory to  stack.
      00824B 82 3C                  543         .word      LINK
                           0001CD   544 LINK	= 	.
      00824D 02                     545         .byte      2
      00824E 43 40                  546         .ascii     "C@"
      008250                        547 CAT:
      008250 90 93            [ 1]  548         LDW Y,X     ;Y=b
      008252 90 FE            [ 2]  549         LDW Y,(Y)
      008254 90 F6            [ 1]  550         LD A,(Y)
      008256 E7 01            [ 1]  551         LD (1,X),A
      008258 7F               [ 1]  552         CLR (X)
      008259 81               [ 4]  553         RET     
                                    554 
                                    555 ;       RP@     ( -- a )
                                    556 ;       Push current RP to data stack.
      00825A 82 4D                  557         .word      LINK
                           0001DC   558 LINK	= .
      00825C 03                     559         .byte      3
      00825D 52 50 40               560         .ascii     "RP@"
      008260                        561 RPAT:
      008260 90 96            [ 1]  562         LDW Y,SP    ;save return addr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      008262 1D 00 02         [ 2]  563         SUBW X,#2
      008265 FF               [ 2]  564         LDW (X),Y
      008266 81               [ 4]  565         RET     
                                    566 
                                    567 ;       RP!     ( a -- )
                                    568 ;       Set  return stack pointer.
      008267 82 5C                  569         .word      LINK
                           0001E9   570 LINK	= 	. 
      008269 43                     571 	.byte      COMPO+3
      00826A 52 50 21               572         .ascii     "RP!"
      00826D                        573 RPSTO:
      00826D 90 85            [ 2]  574         POPW Y
      00826F 90 BF 1C         [ 2]  575         LDW YTEMP,Y
      008272 90 93            [ 1]  576         LDW Y,X
      008274 90 FE            [ 2]  577         LDW Y,(Y)
      008276 90 94            [ 1]  578         LDW SP,Y
      008278 1C 00 02         [ 2]  579         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      00827B 92 CC 1C         [ 5]  580         JP [YTEMP]
                                    581 
                                    582 ;       R>      ( -- w )
                                    583 ;       Pop return stack to data stack.
      00827E 82 69                  584         .word      LINK
                           000200   585 LINK	= 	. 
      008280 42                     586 	.byte      COMPO+2
      008281 52 3E                  587         .ascii     "R>"
      008283                        588 RFROM:
      008283 90 85            [ 2]  589         POPW Y    ;save return addr
      008285 90 BF 1C         [ 2]  590         LDW YTEMP,Y
      008288 90 85            [ 2]  591         POPW Y
      00828A 1D 00 02         [ 2]  592         SUBW X,#2
      00828D FF               [ 2]  593         LDW (X),Y
      00828E 92 CC 1C         [ 5]  594         JP [YTEMP]
                                    595 
                                    596 ;       R@      ( -- w )
                                    597 ;       Copy top of return stack to stack.
      008291 82 80                  598         .word      LINK
                           000213   599 LINK	= 	. 
      008293 02                     600         .byte      2
      008294 52 40                  601         .ascii     "R@"
      008296                        602 RAT:
                           000001   603 .if PICATOUT_MOD
      008296 16 03            [ 2]  604         ldw y,(3,sp)
      008298 1D 00 02         [ 2]  605         subw x,#CELLL 
      00829B FF               [ 2]  606         ldw (x),y 
      00829C 81               [ 4]  607         ret 
                           000000   608 .else 
                                    609         POPW Y
                                    610         LDW YTEMP,Y
                                    611         POPW Y
                                    612         PUSHW Y
                                    613         SUBW X,#2
                                    614         LDW (X),Y
                                    615         JP [YTEMP]
                                    616 .endif         
                                    617 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                                    618 ;       >R      ( w -- )
                                    619 ;       Push data stack to return stack.
      00829D 82 93                  620         .word      LINK
                           00021F   621 LINK	= 	. 
      00829F 42                     622 	.byte      COMPO+2
      0082A0 3E 52                  623         .ascii     ">R"
      0082A2                        624 TOR:
      0082A2 90 85            [ 2]  625         POPW Y    ;save return addr
      0082A4 90 BF 1C         [ 2]  626         LDW YTEMP,Y
      0082A7 90 93            [ 1]  627         LDW Y,X
      0082A9 90 FE            [ 2]  628         LDW Y,(Y)
      0082AB 90 89            [ 2]  629         PUSHW Y    ;restore return addr
      0082AD 1C 00 02         [ 2]  630         ADDW X,#2
      0082B0 92 CC 1C         [ 5]  631         JP [YTEMP]
                                    632 
                                    633 ;       SP@     ( -- a )
                                    634 ;       Push current stack pointer.
      0082B3 82 9F                  635         .word      LINK
                           000235   636 LINK	= 	. 
      0082B5 03                     637         .byte      3
      0082B6 53 50 40               638         .ascii     "SP@"
      0082B9                        639 SPAT:
      0082B9 90 93            [ 1]  640 	LDW Y,X
      0082BB 1D 00 02         [ 2]  641         SUBW X,#2
      0082BE FF               [ 2]  642 	LDW (X),Y
      0082BF 81               [ 4]  643         RET     
                                    644 
                                    645 ;       SP!     ( a -- )
                                    646 ;       Set  data stack pointer.
      0082C0 82 B5                  647         .word      LINK
                           000242   648 LINK	= 	. 
      0082C2 03                     649         .byte      3
      0082C3 53 50 21               650         .ascii     "SP!"
      0082C6                        651 SPSTO:
      0082C6 FE               [ 2]  652         LDW     X,(X)     ;X = a
      0082C7 81               [ 4]  653         RET     
                                    654 
                                    655 ;       DROP    ( w -- )
                                    656 ;       Discard top stack item.
      0082C8 82 C2                  657         .word      LINK
                           00024A   658 LINK	= 	. 
      0082CA 04                     659         .byte      4
      0082CB 44 52 4F 50            660         .ascii     "DROP"
      0082CF                        661 DROP:
      0082CF 1C 00 02         [ 2]  662         ADDW X,#2     
      0082D2 81               [ 4]  663         RET     
                                    664 
                                    665 ;       DUP     ( w -- w w )
                                    666 ;       Duplicate  top stack item.
      0082D3 82 CA                  667         .word      LINK
                           000255   668 LINK	= 	. 
      0082D5 03                     669         .byte      3
      0082D6 44 55 50               670         .ascii     "DUP"
      0082D9                        671 DUPP:
      0082D9 90 93            [ 1]  672 	LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      0082DB 1D 00 02         [ 2]  673         SUBW X,#2
      0082DE 90 FE            [ 2]  674 	LDW Y,(Y)
      0082E0 FF               [ 2]  675 	LDW (X),Y
      0082E1 81               [ 4]  676         RET     
                                    677 
                                    678 ;       SWAP    ( w1 w2 -- w2 w1 )
                                    679 ;       Exchange top two stack items.
      0082E2 82 D5                  680         .word      LINK
                           000264   681 LINK	= 	. 
      0082E4 04                     682         .byte      4
      0082E5 53 57 41 50            683         .ascii     "SWAP"
      0082E9                        684 SWAPP:
      0082E9 90 93            [ 1]  685         LDW Y,X
      0082EB 90 FE            [ 2]  686         LDW Y,(Y)
      0082ED 90 BF 1C         [ 2]  687         LDW YTEMP,Y
      0082F0 90 93            [ 1]  688         LDW Y,X
      0082F2 90 EE 02         [ 2]  689         LDW Y,(2,Y)
      0082F5 FF               [ 2]  690         LDW (X),Y
      0082F6 90 BE 1C         [ 2]  691         LDW Y,YTEMP
      0082F9 EF 02            [ 2]  692         LDW (2,X),Y
      0082FB 81               [ 4]  693         RET     
                                    694 
                                    695 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                    696 ;       Copy second stack item to top.
      0082FC 82 E4                  697         .word      LINK
                           00027E   698 LINK	= . 
      0082FE 04                     699         .byte      4
      0082FF 4F 56 45 52            700         .ascii     "OVER"
      008303                        701 OVER:
      008303 1D 00 02         [ 2]  702         SUBW X,#2
      008306 90 93            [ 1]  703         LDW Y,X
      008308 90 EE 04         [ 2]  704         LDW Y,(4,Y)
      00830B FF               [ 2]  705         LDW (X),Y
      00830C 81               [ 4]  706         RET     
                                    707 
                                    708 ;       0<      ( n -- t )
                                    709 ;       Return true if n is negative.
      00830D 82 FE                  710         .word      LINK
                           00028F   711 LINK	= . 
      00830F 02                     712         .byte      2
      008310 30 3C                  713         .ascii     "0<"
      008312                        714 ZLESS:
      008312 A6 FF            [ 1]  715         LD A,#0xFF
      008314 90 93            [ 1]  716         LDW Y,X
      008316 90 FE            [ 2]  717         LDW Y,(Y)
      008318 2B 01            [ 1]  718         JRMI     ZL1
      00831A 4F               [ 1]  719         CLR A   ;false
      00831B F7               [ 1]  720 ZL1:    LD     (X),A
      00831C E7 01            [ 1]  721         LD (1,X),A
      00831E 81               [ 4]  722 	RET     
                                    723 
                                    724 ;       AND     ( w w -- w )
                                    725 ;       Bitwise AND.
      00831F 83 0F                  726         .word      LINK
                           0002A1   727 LINK	= . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      008321 03                     728         .byte      3
      008322 41 4E 44               729         .ascii     "AND"
      008325                        730 ANDD:
      008325 F6               [ 1]  731         LD  A,(X)    ;D=w
      008326 E4 02            [ 1]  732         AND A,(2,X)
      008328 E7 02            [ 1]  733         LD (2,X),A
      00832A E6 01            [ 1]  734         LD A,(1,X)
      00832C E4 03            [ 1]  735         AND A,(3,X)
      00832E E7 03            [ 1]  736         LD (3,X),A
      008330 1C 00 02         [ 2]  737         ADDW X,#2
      008333 81               [ 4]  738         RET
                                    739 
                                    740 ;       OR      ( w w -- w )
                                    741 ;       Bitwise inclusive OR.
      008334 83 21                  742         .word      LINK
                           0002B6   743 LINK = . 
      008336 02                     744         .byte      2
      008337 4F 52                  745         .ascii     "OR"
      008339                        746 ORR:
      008339 F6               [ 1]  747         LD A,(X)    ;D=w
      00833A EA 02            [ 1]  748         OR A,(2,X)
      00833C E7 02            [ 1]  749         LD (2,X),A
      00833E E6 01            [ 1]  750         LD A,(1,X)
      008340 EA 03            [ 1]  751         OR A,(3,X)
      008342 E7 03            [ 1]  752         LD (3,X),A
      008344 1C 00 02         [ 2]  753         ADDW X,#2
      008347 81               [ 4]  754         RET
                                    755 
                                    756 ;       XOR     ( w w -- w )
                                    757 ;       Bitwise exclusive OR.
      008348 83 36                  758         .word      LINK
                           0002CA   759 LINK	= . 
      00834A 03                     760         .byte      3
      00834B 58 4F 52               761         .ascii     "XOR"
      00834E                        762 XORR:
      00834E F6               [ 1]  763         LD A,(X)    ;D=w
      00834F E8 02            [ 1]  764         XOR A,(2,X)
      008351 E7 02            [ 1]  765         LD (2,X),A
      008353 E6 01            [ 1]  766         LD A,(1,X)
      008355 E8 03            [ 1]  767         XOR A,(3,X)
      008357 E7 03            [ 1]  768         LD (3,X),A
      008359 1C 00 02         [ 2]  769         ADDW X,#2
      00835C 81               [ 4]  770         RET
                                    771 
                                    772 ;       UM+     ( u u -- udsum )
                                    773 ;       Add two unsigned single
                                    774 ;       and return a double sum.
      00835D 83 4A                  775         .word      LINK
                           0002DF   776 LINK	= . 
      00835F 03                     777         .byte      3
      008360 55 4D 2B               778         .ascii     "UM+"
      008363                        779 UPLUS:
      008363 A6 01            [ 1]  780         LD A,#1
      008365 90 93            [ 1]  781         LDW Y,X
      008367 90 EE 02         [ 2]  782         LDW Y,(2,Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      00836A 90 BF 1C         [ 2]  783         LDW YTEMP,Y
      00836D 90 93            [ 1]  784         LDW Y,X
      00836F 90 FE            [ 2]  785         LDW Y,(Y)
      008371 72 B9 00 1C      [ 2]  786         ADDW Y,YTEMP
      008375 EF 02            [ 2]  787         LDW (2,X),Y
      008377 25 01            [ 1]  788         JRC     UPL1
      008379 4F               [ 1]  789         CLR A
      00837A E7 01            [ 1]  790 UPL1:   LD     (1,X),A
      00837C 7F               [ 1]  791         CLR (X)
      00837D 81               [ 4]  792         RET
                                    793 
                                    794 ;; System and user variables
                                    795 
                                    796 ;       doVAR   ( -- a )
                                    797 ;       Code for VARIABLE and CREATE.
      00837E 83 5F                  798         .word      LINK
                           000300   799 LINK	= . 
      008380 45                     800 	.byte      COMPO+5
      008381 44 4F 56 41 52         801         .ascii     "DOVAR"
      008386                        802 DOVAR:
      008386 1D 00 02         [ 2]  803 	SUBW X,#2
      008389 90 85            [ 2]  804         POPW Y    ;get return addr (pfa)
      00838B FF               [ 2]  805         LDW (X),Y    ;push on stack
      00838C 81               [ 4]  806         RET     ;go to RET of EXEC
                                    807 
                                    808 ;       BASE    ( -- a )
                                    809 ;       Radix base for numeric I/O.
      00838D 83 80                  810         .word      LINK        
                           00030F   811 LINK = . 
      00838F 04                     812         .byte      4
      008390 42 41 53 45            813         .ascii     "BASE"
      008394                        814 BASE:
      008394 90 AE 00 06      [ 2]  815 	LDW Y,#UBASE 
      008398 1D 00 02         [ 2]  816 	SUBW X,#2
      00839B FF               [ 2]  817         LDW (X),Y
      00839C 81               [ 4]  818         RET
                                    819 
                                    820 ;       tmp     ( -- a )
                                    821 ;       A temporary storage.
      00839D 83 8F                  822         .word      LINK
                                    823         
                           00031F   824 LINK = . 
      00839F 03                     825 	.byte      3
      0083A0 54 4D 50               826         .ascii     "TMP"
      0083A3                        827 TEMP:
      0083A3 90 AE 00 08      [ 2]  828 	LDW Y,#UTMP
      0083A7 1D 00 02         [ 2]  829 	SUBW X,#2
      0083AA FF               [ 2]  830         LDW (X),Y
      0083AB 81               [ 4]  831         RET
                                    832 
                                    833 ;       >IN     ( -- a )
                                    834 ;        Hold parsing pointer.
      0083AC 83 9F                  835         .word      LINK
                           00032E   836 LINK = . 
      0083AE 03                     837         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      0083AF 3E 49 4E               838         .ascii    ">IN"
      0083B2                        839 INN:
      0083B2 90 AE 00 0A      [ 2]  840 	LDW Y,#UINN 
      0083B6 1D 00 02         [ 2]  841 	SUBW X,#2
      0083B9 FF               [ 2]  842         LDW (X),Y
      0083BA 81               [ 4]  843         RET
                                    844 
                                    845 ;       #TIB    ( -- a )
                                    846 ;       Count in terminal input buffer.
      0083BB 83 AE                  847         .word      LINK
                           00033D   848 LINK = . 
      0083BD 04                     849         .byte      4
      0083BE 23 54 49 42            850         .ascii     "#TIB"
      0083C2                        851 NTIB:
      0083C2 90 AE 00 0C      [ 2]  852 	LDW Y,#UCTIB 
      0083C6 1D 00 02         [ 2]  853 	SUBW X,#2
      0083C9 FF               [ 2]  854         LDW (X),Y
      0083CA 81               [ 4]  855         RET
                                    856 
                                    857 ;       "EVAL   ( -- a )
                                    858 ;       Execution vector of EVAL.
      0083CB 83 BD                  859         .word      LINK
                           00034D   860 LINK = . 
      0083CD 05                     861         .byte      5
      0083CE 27 45 56 41 4C         862         .ascii     "'EVAL"
      0083D3                        863 TEVAL:
      0083D3 90 AE 00 10      [ 2]  864 	LDW Y,#UINTER 
      0083D7 1D 00 02         [ 2]  865 	SUBW X,#2
      0083DA FF               [ 2]  866         LDW (X),Y
      0083DB 81               [ 4]  867         RET
                                    868 
                                    869 ;       HLD     ( -- a )
                                    870 ;       Hold a pointer of output string.
      0083DC 83 CD                  871         .word      LINK
                           00035E   872 LINK = . 
      0083DE 03                     873         .byte      3
      0083DF 48 4C 44               874         .ascii     "HLD"
      0083E2                        875 HLD:
      0083E2 90 AE 00 12      [ 2]  876 	LDW Y,#UHLD 
      0083E6 1D 00 02         [ 2]  877 	SUBW X,#2
      0083E9 FF               [ 2]  878         LDW (X),Y
      0083EA 81               [ 4]  879         RET
                                    880 
                                    881 ;       CONTEXT ( -- a )
                                    882 ;       Start vocabulary search.
      0083EB 83 DE                  883         .word      LINK
                           00036D   884 LINK = . 
      0083ED 07                     885         .byte      7
      0083EE 43 4F 4E 54 45 58 54   886         .ascii     "CONTEXT"
      0083F5                        887 CNTXT:
      0083F5 90 AE 00 14      [ 2]  888 	LDW Y,#UCNTXT
      0083F9 1D 00 02         [ 2]  889 	SUBW X,#2
      0083FC FF               [ 2]  890         LDW (X),Y
      0083FD 81               [ 4]  891         RET
                                    892 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                                    893 ;       CP      ( -- a )
                                    894 ;       Point to top of dictionary.
      0083FE 83 ED                  895         .word      LINK
                           000380   896 LINK = . 
      008400 02                     897         .byte      2
      008401 43 50                  898         .ascii     "CP"
      008403                        899 CPP:
      008403 90 AE 00 16      [ 2]  900 	LDW Y,#UCP 
      008407 1D 00 02         [ 2]  901 	SUBW X,#2
      00840A FF               [ 2]  902         LDW (X),Y
      00840B 81               [ 4]  903         RET
                                    904 
                                    905 ;       LAST    ( -- a )
                                    906 ;       Point to last name in dictionary.
      00840C 84 00                  907         .word      LINK
                           00038E   908 LINK = . 
      00840E 04                     909         .byte      4
      00840F 4C 41 53 54            910         .ascii     "LAST"
      008413                        911 LAST:
      008413 90 AE 00 18      [ 2]  912 	LDW Y,#ULAST 
      008417 1D 00 02         [ 2]  913 	SUBW X,#2
      00841A FF               [ 2]  914         LDW (X),Y
      00841B 81               [ 4]  915         RET
                                    916 
                                    917 ;; Common functions
                                    918 
                                    919 ;       ?DUP    ( w -- w w | 0 )
                                    920 ;       Dup tos if its is not zero.
      00841C 84 0E                  921         .word      LINK
                           00039E   922 LINK = . 
      00841E 04                     923         .byte      4
      00841F 3F 44 55 50            924         .ascii     "?DUP"
      008423                        925 QDUP:
      008423 90 93            [ 1]  926         LDW Y,X
      008425 90 FE            [ 2]  927 	LDW Y,(Y)
      008427 27 04            [ 1]  928         JREQ     QDUP1
      008429 1D 00 02         [ 2]  929 	SUBW X,#2
      00842C FF               [ 2]  930         LDW (X),Y
      00842D 81               [ 4]  931 QDUP1:  RET
                                    932 
                                    933 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                    934 ;       Rot 3rd item to top.
      00842E 84 1E                  935         .word      LINK
                           0003B0   936 LINK = . 
      008430 03                     937         .byte      3
      008431 52 4F 54               938         .ascii     "ROT"
      008434                        939 ROT:
                           000001   940 .if PICATOUT_MOD
      008434 90 93            [ 1]  941         ldw y,x 
      008436 90 FE            [ 2]  942         ldw y,(y)
      008438 90 89            [ 2]  943         pushw y 
      00843A 90 93            [ 1]  944         ldw y,x 
      00843C 90 EE 04         [ 2]  945         ldw y,(4,y)
      00843F FF               [ 2]  946         ldw (x),y 
      008440 90 93            [ 1]  947         ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      008442 90 EE 02         [ 2]  948         ldw y,(2,y)
      008445 EF 04            [ 2]  949         ldw (4,x),y 
      008447 90 85            [ 2]  950         popw y 
      008449 EF 02            [ 2]  951         ldw (2,x),y
      00844B 81               [ 4]  952         ret 
                           000000   953 .else 
                                    954         LDW Y,X
                                    955 	LDW Y,(4,Y)
                                    956 	LDW YTEMP,Y
                                    957         LDW Y,X
                                    958         LDW Y,(2,Y)
                                    959         LDW XTEMP,Y
                                    960         LDW Y,X
                                    961         LDW Y,(Y)
                                    962         LDW (2,X),Y
                                    963         LDW Y,XTEMP
                                    964         LDW (4,X),Y
                                    965         LDW Y,YTEMP
                                    966         LDW (X),Y
                                    967         RET
                                    968 .endif 
                                    969 
                                    970 ;       2DROP   ( w w -- )
                                    971 ;       Discard two items on stack.
      00844C 84 30                  972         .word      LINK
                           0003CE   973 LINK = . 
      00844E 05                     974         .byte      5
      00844F 32 44 52 4F 50         975         .ascii     "2DROP"
      008454                        976 DDROP:
      008454 1C 00 04         [ 2]  977         ADDW X,#4
      008457 81               [ 4]  978         RET
                                    979 
                                    980 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                    981 ;       Duplicate top two items.
      008458 84 4E                  982         .word      LINK
                           0003DA   983 LINK = . 
      00845A 04                     984         .byte      4
      00845B 32 44 55 50            985         .ascii     "2DUP"
      00845F                        986 DDUP:
      00845F 1D 00 04         [ 2]  987         SUBW X,#4
      008462 90 93            [ 1]  988         LDW Y,X
      008464 90 EE 06         [ 2]  989         LDW Y,(6,Y)
      008467 EF 02            [ 2]  990         LDW (2,X),Y
      008469 90 93            [ 1]  991         LDW Y,X
      00846B 90 EE 04         [ 2]  992         LDW Y,(4,Y)
      00846E FF               [ 2]  993         LDW (X),Y
      00846F 81               [ 4]  994         RET
                                    995 
                                    996 ;       +       ( w w -- sum )
                                    997 ;       Add top two items.
      008470 84 5A                  998         .word      LINK
                           0003F2   999 LINK = . 
      008472 01                    1000         .byte      1
      008473 2B                    1001         .ascii     "+"
      008474                       1002 PLUS:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008474 90 93            [ 1] 1003         LDW Y,X
      008476 90 FE            [ 2] 1004         LDW Y,(Y)
      008478 90 BF 1C         [ 2] 1005         LDW YTEMP,Y
      00847B 1C 00 02         [ 2] 1006         ADDW X,#2
      00847E 90 93            [ 1] 1007         LDW Y,X
      008480 90 FE            [ 2] 1008         LDW Y,(Y)
      008482 72 B9 00 1C      [ 2] 1009         ADDW Y,YTEMP
      008486 FF               [ 2] 1010         LDW (X),Y
      008487 81               [ 4] 1011         RET
                                   1012 
                                   1013 ;       NOT     ( w -- w )
                                   1014 ;       One's complement of tos.
      008488 84 72                 1015         .word      LINK
                           00040A  1016 LINK = . 
      00848A 03                    1017         .byte      3
      00848B 4E 4F 54              1018         .ascii     "NOT"
      00848E                       1019 INVER:
      00848E 90 93            [ 1] 1020         LDW Y,X
      008490 90 FE            [ 2] 1021         LDW Y,(Y)
      008492 90 53            [ 2] 1022         CPLW Y
      008494 FF               [ 2] 1023         LDW (X),Y
      008495 81               [ 4] 1024         RET
                                   1025 
                                   1026 ;       NEGATE  ( n -- -n )
                                   1027 ;       Two's complement of tos.
      008496 84 8A                 1028         .word      LINK
                           000418  1029 LINK = . 
      008498 06                    1030         .byte      6
      008499 4E 45 47 41 54 45     1031         .ascii     "NEGATE"
      00849F                       1032 NEGAT:
      00849F 90 93            [ 1] 1033         LDW Y,X
      0084A1 90 FE            [ 2] 1034         LDW Y,(Y)
      0084A3 90 50            [ 2] 1035         NEGW Y
      0084A5 FF               [ 2] 1036         LDW (X),Y
      0084A6 81               [ 4] 1037         RET
                                   1038 
                                   1039 ;       DNEGATE ( d -- -d )
                                   1040 ;       Two's complement of top double.
      0084A7 84 98                 1041         .word      LINK
                           000429  1042 LINK = . 
      0084A9 07                    1043         .byte      7
      0084AA 44 4E 45 47 41 54 45  1044         .ascii     "DNEGATE"
      0084B1                       1045 DNEGA:
      0084B1 90 93            [ 1] 1046         LDW Y,X
      0084B3 90 FE            [ 2] 1047 	LDW Y,(Y)
      0084B5 90 53            [ 2] 1048         CPLW Y     
      0084B7 90 BF 1C         [ 2] 1049 	LDW YTEMP,Y
      0084BA 90 93            [ 1] 1050         LDW Y,X
      0084BC 90 EE 02         [ 2] 1051         LDW Y,(2,Y)
      0084BF 90 53            [ 2] 1052         CPLW Y
      0084C1 90 5C            [ 2] 1053         INCW Y
      0084C3 EF 02            [ 2] 1054         LDW (2,X),Y
      0084C5 90 BE 1C         [ 2] 1055         LDW Y,YTEMP
      0084C8 24 02            [ 1] 1056         JRNC DN1 
      0084CA 90 5C            [ 2] 1057         INCW Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      0084CC FF               [ 2] 1058 DN1:    LDW (X),Y
      0084CD 81               [ 4] 1059         RET
                                   1060 
                                   1061 ;       -       ( n1 n2 -- n1-n2 )
                                   1062 ;       Subtraction.
      0084CE 84 A9                 1063         .word      LINK
                           000450  1064 LINK = . 
      0084D0 01                    1065         .byte      1
      0084D1 2D                    1066         .ascii     "-"
      0084D2                       1067 SUBB:
      0084D2 90 93            [ 1] 1068         LDW Y,X
      0084D4 90 FE            [ 2] 1069         LDW Y,(Y)
      0084D6 90 BF 1C         [ 2] 1070         LDW YTEMP,Y
      0084D9 1C 00 02         [ 2] 1071         ADDW X,#2
      0084DC 90 93            [ 1] 1072         LDW Y,X
      0084DE 90 FE            [ 2] 1073         LDW Y,(Y)
      0084E0 72 B2 00 1C      [ 2] 1074         SUBW Y,YTEMP
      0084E4 FF               [ 2] 1075         LDW (X),Y
      0084E5 81               [ 4] 1076         RET
                                   1077 
                                   1078 ;       ABS     ( n -- n )
                                   1079 ;       Return  absolute value of n.
      0084E6 84 D0                 1080         .word      LINK
                           000468  1081 LINK = . 
      0084E8 03                    1082         .byte      3
      0084E9 41 42 53              1083         .ascii     "ABS"
      0084EC                       1084 ABSS:
      0084EC 90 93            [ 1] 1085         LDW Y,X
      0084EE 90 FE            [ 2] 1086 	LDW Y,(Y)
      0084F0 2A 03            [ 1] 1087         JRPL     AB1     ;negate:
      0084F2 90 50            [ 2] 1088         NEGW     Y     ;else negate hi byte
      0084F4 FF               [ 2] 1089         LDW (X),Y
      0084F5 81               [ 4] 1090 AB1:    RET
                                   1091 
                                   1092 ;       =       ( w w -- t )
                                   1093 ;       Return true if top two are =al.
      0084F6 84 E8                 1094         .word      LINK
                           000478  1095 LINK = . 
      0084F8 01                    1096         .byte      1
      0084F9 3D                    1097         .ascii     "="
      0084FA                       1098 EQUAL:
      0084FA A6 FF            [ 1] 1099         LD A,#0xFF  ;true
      0084FC 90 93            [ 1] 1100         LDW Y,X    ;D = n2
      0084FE 90 FE            [ 2] 1101         LDW Y,(Y)
      008500 90 BF 1C         [ 2] 1102         LDW YTEMP,Y
      008503 1C 00 02         [ 2] 1103         ADDW X,#2
      008506 90 93            [ 1] 1104         LDW Y,X
      008508 90 FE            [ 2] 1105         LDW Y,(Y)
      00850A 90 B3 1C         [ 2] 1106         CPW Y,YTEMP     ;if n2 <> n1
      00850D 27 01            [ 1] 1107         JREQ     EQ1
      00850F 4F               [ 1] 1108         CLR A
      008510 F7               [ 1] 1109 EQ1:    LD (X),A
      008511 E7 01            [ 1] 1110         LD (1,X),A
      008513 81               [ 4] 1111 	RET     
                                   1112 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                   1113 ;       U<      ( u u -- t )
                                   1114 ;       Unsigned compare of top two items.
      008514 84 F8                 1115         .word      LINK
                           000496  1116 LINK = . 
      008516 02                    1117         .byte      2
      008517 55 3C                 1118         .ascii     "U<"
      008519                       1119 ULESS:
      008519 A6 FF            [ 1] 1120         LD A,#0xFF  ;true
      00851B 90 93            [ 1] 1121         LDW Y,X    ;D = n2
      00851D 90 FE            [ 2] 1122         LDW Y,(Y)
      00851F 90 BF 1C         [ 2] 1123         LDW YTEMP,Y
      008522 1C 00 02         [ 2] 1124         ADDW X,#2
      008525 90 93            [ 1] 1125         LDW Y,X
      008527 90 FE            [ 2] 1126         LDW Y,(Y)
      008529 90 B3 1C         [ 2] 1127         CPW Y,YTEMP     ;if n2 <> n1
      00852C 25 01            [ 1] 1128         JRULT     ULES1
      00852E 4F               [ 1] 1129         CLR A
      00852F F7               [ 1] 1130 ULES1:  LD (X),A
      008530 E7 01            [ 1] 1131         LD (1,X),A
      008532 81               [ 4] 1132 	RET     
                                   1133 
                                   1134 ;       <       ( n1 n2 -- t )
                                   1135 ;       Signed compare of top two items.
      008533 85 16                 1136         .word      LINK
                           0004B5  1137 LINK = . 
      008535 01                    1138         .byte      1
      008536 3C                    1139         .ascii     "<"
      008537                       1140 LESS:
      008537 A6 FF            [ 1] 1141         LD A,#0xFF  ;true
      008539 90 93            [ 1] 1142         LDW Y,X    ;D = n2
      00853B 90 FE            [ 2] 1143         LDW Y,(Y)
      00853D 90 BF 1C         [ 2] 1144         LDW YTEMP,Y
      008540 1C 00 02         [ 2] 1145         ADDW X,#2
      008543 90 93            [ 1] 1146         LDW Y,X
      008545 90 FE            [ 2] 1147         LDW Y,(Y)
      008547 90 B3 1C         [ 2] 1148         CPW Y,YTEMP     ;if n2 <> n1
      00854A 2F 01            [ 1] 1149         JRSLT     LT1
      00854C 4F               [ 1] 1150         CLR A
      00854D F7               [ 1] 1151 LT1:    LD (X),A
      00854E E7 01            [ 1] 1152         LD (1,X),A
      008550 81               [ 4] 1153 	RET     
                                   1154 
                                   1155 ;       MAX     ( n n -- n )
                                   1156 ;       Return greater of two top items.
      008551 85 35                 1157         .word      LINK
                           0004D3  1158 LINK = . 
      008553 03                    1159         .byte      3
      008554 4D 41 58              1160         .ascii     "MAX"
      008557                       1161 MAX:
      008557 90 93            [ 1] 1162         LDW Y,X    ;D = n2
      008559 90 EE 02         [ 2] 1163         LDW Y,(2,Y)
      00855C 90 BF 1C         [ 2] 1164         LDW YTEMP,Y
      00855F 90 93            [ 1] 1165         LDW Y,X
      008561 90 FE            [ 2] 1166         LDW Y,(Y)
      008563 90 B3 1C         [ 2] 1167         CPW Y,YTEMP     ;if n2 <> n1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008566 2F 02            [ 1] 1168         JRSLT     MAX1
      008568 EF 02            [ 2] 1169         LDW (2,X),Y
      00856A 1C 00 02         [ 2] 1170 MAX1:   ADDW X,#2
      00856D 81               [ 4] 1171 	RET     
                                   1172 
                                   1173 ;       MIN     ( n n -- n )
                                   1174 ;       Return smaller of top two items.
      00856E 85 53                 1175         .word      LINK
                           0004F0  1176 LINK = . 
      008570 03                    1177         .byte      3
      008571 4D 49 4E              1178         .ascii     "MIN"
      008574                       1179 MIN:
      008574 90 93            [ 1] 1180         LDW Y,X    ;D = n2
      008576 90 EE 02         [ 2] 1181         LDW Y,(2,Y)
      008579 90 BF 1C         [ 2] 1182         LDW YTEMP,Y
      00857C 90 93            [ 1] 1183         LDW Y,X
      00857E 90 FE            [ 2] 1184         LDW Y,(Y)
      008580 90 B3 1C         [ 2] 1185         CPW Y,YTEMP     ;if n2 <> n1
      008583 2C 02            [ 1] 1186         JRSGT     MIN1
      008585 EF 02            [ 2] 1187         LDW (2,X),Y
      008587 1C 00 02         [ 2] 1188 MIN1:	ADDW X,#2
      00858A 81               [ 4] 1189 	RET     
                                   1190 
                                   1191 ;       WITHIN  ( u ul uh -- t )
                                   1192 ;       Return true if u is within
                                   1193 ;       range of ul and uh. ( ul <= u < uh )
      00858B 85 70                 1194         .word      LINK
                           00050D  1195 LINK = . 
      00858D 06                    1196         .byte      6
      00858E 57 49 54 48 49 4E     1197         .ascii     "WITHIN"
      008594                       1198 WITHI:
      008594 CD 83 03         [ 4] 1199         CALL     OVER
      008597 CD 84 D2         [ 4] 1200         CALL     SUBB
      00859A CD 82 A2         [ 4] 1201         CALL     TOR
      00859D CD 84 D2         [ 4] 1202         CALL     SUBB
      0085A0 CD 82 83         [ 4] 1203         CALL     RFROM
      0085A3 CC 85 19         [ 2] 1204         JP     ULESS
                                   1205 
                                   1206 ;; Divide
                                   1207 
                                   1208 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1209 ;       Unsigned divide of a double by a
                                   1210 ;       single. Return mod and quotient.
      0085A6 85 8D                 1211         .word      LINK
                           000528  1212 LINK = . 
      0085A8 06                    1213         .byte      6
      0085A9 55 4D 2F 4D 4F 44     1214         .ascii     "UM/MOD"
      0085AF                       1215 UMMOD:
      0085AF BF 1A            [ 2] 1216 	LDW XTEMP,X	; save stack pointer
      0085B1 FE               [ 2] 1217 	LDW X,(X)	; un
      0085B2 BF 1C            [ 2] 1218 	LDW YTEMP,X     ; save un
      0085B4 90 BE 1A         [ 2] 1219 	LDW Y,XTEMP	; stack pointer
      0085B7 90 EE 04         [ 2] 1220 	LDW Y,(4,Y)     ; Y=udl
      0085BA BE 1A            [ 2] 1221 	LDW X,XTEMP
      0085BC EE 02            [ 2] 1222 	LDW X,(2,X)	; X=udh
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      0085BE B3 1C            [ 2] 1223 	CPW X,YTEMP
      0085C0 23 0F            [ 2] 1224 	JRULE MMSM1
      0085C2 BE 1A            [ 2] 1225 	LDW X,XTEMP
      0085C4 1C 00 02         [ 2] 1226 	ADDW X,#2	; pop off 1 level
      0085C7 90 AE FF FF      [ 2] 1227 	LDW Y,#0xFFFF
      0085CB FF               [ 2] 1228 	LDW (X),Y
      0085CC 90 5F            [ 1] 1229 	CLRW Y
      0085CE EF 02            [ 2] 1230 	LDW (2,X),Y
      0085D0 81               [ 4] 1231 	RET
      0085D1                       1232 MMSM1:
                           000001  1233 .if  PICATOUT_MOD 
                                   1234 ; take advantage of divw x,y when udh==0
      0085D1 5D               [ 2] 1235         tnzw x  ; is udh==0?
      0085D2 26 11            [ 1] 1236         jrne MMSM2 
      0085D4 93               [ 1] 1237         ldw x,y    ;udl 
      0085D5 90 BE 1C         [ 2] 1238         ldw y,YTEMP ; divisor 
      0085D8 65               [ 2] 1239         divw x,y 
      0085D9 89               [ 2] 1240         pushw x     ; quotient 
      0085DA BE 1A            [ 2] 1241         ldw x,XTEMP 
      0085DC 1C 00 02         [ 2] 1242         addw x,#CELLL 
      0085DF EF 02            [ 2] 1243         ldw (2,x),y  ; ur
      0085E1 90 85            [ 2] 1244         popw y 
      0085E3 FF               [ 2] 1245         ldw (x),y ; uq 
      0085E4 81               [ 4] 1246         ret 
      0085E5                       1247 MMSM2:        
                                   1248 .endif 
      0085E5 A6 11            [ 1] 1249 	LD A,#17	; loop count
      0085E7                       1250 MMSM3:
      0085E7 B3 1C            [ 2] 1251 	CPW X,YTEMP	; compare udh to un
      0085E9 25 04            [ 1] 1252 	JRULT MMSM4	; can't subtract
      0085EB 72 B0 00 1C      [ 2] 1253 	SUBW X,YTEMP	; can subtract
      0085EF                       1254 MMSM4:
      0085EF 8C               [ 1] 1255 	CCF	; quotient bit
      0085F0 90 59            [ 2] 1256 	RLCW Y	; rotate into quotient
      0085F2 59               [ 2] 1257 	RLCW X	; rotate into remainder
      0085F3 4A               [ 1] 1258 	DEC A	; repeat
      0085F4 22 F1            [ 1] 1259 	JRUGT MMSM3
      0085F6 57               [ 2] 1260 	SRAW X
      0085F7 BF 1C            [ 2] 1261 	LDW YTEMP,X	; done, save remainder
      0085F9 BE 1A            [ 2] 1262 	LDW X,XTEMP
      0085FB 1C 00 02         [ 2] 1263 	ADDW X,#2	; drop
      0085FE FF               [ 2] 1264 	LDW (X),Y
      0085FF 90 BE 1C         [ 2] 1265 	LDW Y,YTEMP	; save quotient
      008602 EF 02            [ 2] 1266 	LDW (2,X),Y
      008604 81               [ 4] 1267 	RET
                                   1268 	
                                   1269 ;       M/MOD   ( d n -- r q )
                                   1270 ;       Signed floored divide of double by
                                   1271 ;       single. Return mod and quotient.
      008605 85 A8                 1272         .word      LINK
                           000587  1273 LINK = . 
      008607 05                    1274         .byte      5
      008608 4D 2F 4D 4F 44        1275         .ascii     "M/MOD"
      00860D                       1276 MSMOD:  
      00860D CD 82 D9         [ 4] 1277         CALL	DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      008610 CD 83 12         [ 4] 1278         CALL	ZLESS
      008613 CD 82 D9         [ 4] 1279         CALL	DUPP
      008616 CD 82 A2         [ 4] 1280         CALL	TOR
      008619 CD 81 DD         [ 4] 1281         CALL	QBRAN
      00861C 86 2A                 1282         .word	MMOD1
      00861E CD 84 9F         [ 4] 1283         CALL	NEGAT
      008621 CD 82 A2         [ 4] 1284         CALL	TOR
      008624 CD 84 B1         [ 4] 1285         CALL	DNEGA
      008627 CD 82 83         [ 4] 1286         CALL	RFROM
      00862A CD 82 A2         [ 4] 1287 MMOD1:	CALL	TOR
      00862D CD 82 D9         [ 4] 1288         CALL	DUPP
      008630 CD 83 12         [ 4] 1289         CALL	ZLESS
      008633 CD 81 DD         [ 4] 1290         CALL	QBRAN
      008636 86 3E                 1291         .word	MMOD2
      008638 CD 82 96         [ 4] 1292         CALL	RAT
      00863B CD 84 74         [ 4] 1293         CALL	PLUS
      00863E CD 82 83         [ 4] 1294 MMOD2:	CALL	RFROM
      008641 CD 85 AF         [ 4] 1295         CALL	UMMOD
      008644 CD 82 83         [ 4] 1296         CALL	RFROM
      008647 CD 81 DD         [ 4] 1297         CALL	QBRAN
      00864A 86 55                 1298         .word	MMOD3
      00864C CD 82 E9         [ 4] 1299         CALL	SWAPP
      00864F CD 84 9F         [ 4] 1300         CALL	NEGAT
      008652 CD 82 E9         [ 4] 1301         CALL	SWAPP
      008655 81               [ 4] 1302 MMOD3:	RET
                                   1303 
                                   1304 ;       /MOD    ( n n -- r q )
                                   1305 ;       Signed divide. Return mod and quotient.
      008656 86 07                 1306         .word      LINK
                           0005D8  1307 LINK = . 
      008658 04                    1308         .byte      4
      008659 2F 4D 4F 44           1309         .ascii     "/MOD"
      00865D                       1310 SLMOD:
      00865D CD 83 03         [ 4] 1311         CALL	OVER
      008660 CD 83 12         [ 4] 1312         CALL	ZLESS
      008663 CD 82 E9         [ 4] 1313         CALL	SWAPP
      008666 CC 86 0D         [ 2] 1314         JP	MSMOD
                                   1315 
                                   1316 ;       MOD     ( n n -- r )
                                   1317 ;       Signed divide. Return mod only.
      008669 86 58                 1318         .word      LINK
                           0005EB  1319 LINK = . 
      00866B 03                    1320         .byte      3
      00866C 4D 4F 44              1321         .ascii     "MOD"
      00866F                       1322 MODD:
      00866F CD 86 5D         [ 4] 1323 	CALL	SLMOD
      008672 CC 82 CF         [ 2] 1324 	JP	DROP
                                   1325 
                                   1326 ;       /       ( n n -- q )
                                   1327 ;       Signed divide. Return quotient only.
      008675 86 6B                 1328         .word      LINK
                           0005F7  1329 LINK = . 
      008677 01                    1330         .byte      1
      008678 2F                    1331         .ascii     "/"
      008679                       1332 SLASH:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008679 CD 86 5D         [ 4] 1333         CALL	SLMOD
      00867C CD 82 E9         [ 4] 1334         CALL	SWAPP
      00867F CC 82 CF         [ 2] 1335         JP	DROP
                                   1336 
                                   1337 ;; Multiply
                                   1338 
                                   1339 ;       UM*     ( u u -- ud )
                                   1340 ;       Unsigned multiply. Return double product.
      008682 86 77                 1341         .word      LINK
                           000604  1342 LINK = . 
      008684 03                    1343         .byte      3
      008685 55 4D 2A              1344         .ascii     "UM*"
      008688                       1345 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                           000001  1346 .if PICATOUT_MOD 
                                   1347 ; take advantage of SP addressing modes
                                   1348 ; these PRODx in RAM are not required
                                   1349 ; the product is kept on stack as local variable 
                                   1350         ;; bytes offset on data stack 
                           000002  1351         da=2 
                           000003  1352         db=3 
                           000000  1353         dc=0 
                           000001  1354         dd=1 
                                   1355         ;; product bytes offset on return stack 
                           000001  1356         UD1=1  ; ud bits 31..24
                           000002  1357         UD2=2  ; ud bits 23..16
                           000003  1358         UD3=3  ; ud bits 15..8 
                           000004  1359         UD4=4  ; ud bits 7..0 
                                   1360         ;; local variable for product set to zero   
      008688 90 5F            [ 1] 1361         clrw y 
      00868A 90 89            [ 2] 1362         pushw y  ; bits 15..0
      00868C 90 89            [ 2] 1363         pushw y  ; bits 31..16 
      00868E E6 03            [ 1] 1364         ld a,(db,x) ; b 
      008690 90 97            [ 1] 1365         ld yl,a 
      008692 E6 01            [ 1] 1366         ld a,(dd,x)   ; d
      008694 90 42            [ 4] 1367         mul y,a    ; b*d  
      008696 17 03            [ 2] 1368         ldw (UD3,sp),y ; lowest weight product 
      008698 E6 03            [ 1] 1369         ld a,(db,x)
      00869A 90 97            [ 1] 1370         ld yl,a 
      00869C E6 00            [ 1] 1371         ld a,(dc,x)
      00869E 90 42            [ 4] 1372         mul y,a  ; b*c 
                                   1373         ;;; do the partial sum 
      0086A0 72 F9 02         [ 2] 1374         addw y,(UD2,sp)
      0086A3 4F               [ 1] 1375         clr a 
      0086A4 49               [ 1] 1376         rlc a
      0086A5 6B 01            [ 1] 1377         ld (UD1,sp),a 
      0086A7 17 02            [ 2] 1378         ldw (UD2,sp),y 
      0086A9 E6 02            [ 1] 1379         ld a,(da,x)
      0086AB 90 97            [ 1] 1380         ld yl,a 
      0086AD E6 01            [ 1] 1381         ld a,(dd,x)
      0086AF 90 42            [ 4] 1382         mul y,a   ; a*d 
                                   1383         ;; do partial sum 
      0086B1 72 F9 02         [ 2] 1384         addw y,(UD2,sp)
      0086B4 4F               [ 1] 1385         clr a 
      0086B5 19 01            [ 1] 1386         adc a,(UD1,sp)
      0086B7 6B 01            [ 1] 1387         ld (UD1,sp),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      0086B9 17 02            [ 2] 1388         ldw (UD2,sp),y 
      0086BB E6 02            [ 1] 1389         ld a,(da,x)
      0086BD 90 97            [ 1] 1390         ld yl,a 
      0086BF E6 00            [ 1] 1391         ld a,(dc,x)
      0086C1 90 42            [ 4] 1392         mul y,a  ;  a*c highest weight product 
                                   1393         ;;; do partial sum 
      0086C3 72 F9 01         [ 2] 1394         addw y,(UD1,sp)
      0086C6 FF               [ 2] 1395         ldw (x),y  ; udh 
      0086C7 16 03            [ 2] 1396         ldw y,(UD3,sp)
      0086C9 EF 02            [ 2] 1397         ldw (2,x),y  ; udl  
      0086CB 5B 04            [ 2] 1398         addw sp,#4 ; drop local variable 
      0086CD 81               [ 4] 1399         ret  
                           000000  1400 .else
                                   1401 	LD A,(2,X)	; b
                                   1402 	LD YL,A
                                   1403 	LD A,(X)	; d
                                   1404 	MUL Y,A
                                   1405 	LDW PROD1,Y
                                   1406 	LD A,(3,X)	; a
                                   1407 	LD YL,A
                                   1408 	LD A,(X)	; d
                                   1409 	MUL Y,A
                                   1410 	LDW PROD2,Y
                                   1411 	LD A,(2,X)	; b
                                   1412 	LD YL,A
                                   1413 	LD A,(1,X)	; c
                                   1414 	MUL Y,A
                                   1415 	LDW PROD3,Y
                                   1416 	LD A,(3,X)	; a
                                   1417 	LD YL,A
                                   1418 	LD A,(1,X)	; c
                                   1419 	MUL Y,A	; least signifiant product
                                   1420 	CLR A
                                   1421 	RRWA Y
                                   1422 	LD (3,X),A	; store least significant byte
                                   1423 	ADDW Y,PROD3
                                   1424 	CLR A
                                   1425 	ADC A,#0	; save carry
                                   1426 	LD CARRY,A
                                   1427 	ADDW Y,PROD2
                                   1428 	LD A,CARRY
                                   1429 	ADC A,#0	; add 2nd carry
                                   1430 	LD CARRY,A
                                   1431 	CLR A
                                   1432 	RRWA Y
                                   1433 	LD (2,X),A	; 2nd product byte
                                   1434 	ADDW Y,PROD1
                                   1435 	RRWA Y
                                   1436 	LD (1,X),A	; 3rd product byte
                                   1437 	RRWA Y  	; 4th product byte now in A
                                   1438 	ADC A,CARRY	; fill in carry bits
                                   1439 	LD (X),A
                                   1440 	RET
                                   1441 .endif 
                                   1442 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



                                   1443 
                                   1444 ;       *       ( n n -- n )
                                   1445 ;       Signed multiply. Return single product.
      0086CE 86 84                 1446         .word      LINK
                           000650  1447 LINK = . 
      0086D0 01                    1448         .byte      1
      0086D1 2A                    1449         .ascii     "*"
      0086D2                       1450 STAR:
      0086D2 CD 86 88         [ 4] 1451 	CALL	UMSTA
      0086D5 CC 82 CF         [ 2] 1452 	JP	DROP
                                   1453 
                                   1454 ;       M*      ( n n -- d )
                                   1455 ;       Signed multiply. Return double product.
      0086D8 86 D0                 1456         .word      LINK
                           00065A  1457 LINK = . 
      0086DA 02                    1458         .byte      2
      0086DB 4D 2A                 1459         .ascii     "M*"
      0086DD                       1460 MSTAR:      
      0086DD CD 84 5F         [ 4] 1461         CALL	DDUP
      0086E0 CD 83 4E         [ 4] 1462         CALL	XORR
      0086E3 CD 83 12         [ 4] 1463         CALL	ZLESS
      0086E6 CD 82 A2         [ 4] 1464         CALL	TOR
      0086E9 CD 84 EC         [ 4] 1465         CALL	ABSS
      0086EC CD 82 E9         [ 4] 1466         CALL	SWAPP
      0086EF CD 84 EC         [ 4] 1467         CALL	ABSS
      0086F2 CD 86 88         [ 4] 1468         CALL	UMSTA
      0086F5 CD 82 83         [ 4] 1469         CALL	RFROM
      0086F8 CD 81 DD         [ 4] 1470         CALL	QBRAN
      0086FB 87 00                 1471         .word	MSTA1
      0086FD CD 84 B1         [ 4] 1472         CALL	DNEGA
      008700 81               [ 4] 1473 MSTA1:	RET
                                   1474 
                                   1475 ;       . /MOD   ( n1 n2 n3 -- r q )
                                   1476 ;       Multiply n1 and n2, then divide
                                   1477 ;       by n3. Return mod and quotient.
      008701 86 DA                 1478         .word      LINK
                           000683  1479 LINK = . 
      008703 05                    1480         .byte      5
      008704 2A 2F 4D 4F 44        1481         .ascii     "*/MOD"
      008709                       1482 SSMOD:
      008709 CD 82 A2         [ 4] 1483         CALL     TOR
      00870C CD 86 DD         [ 4] 1484         CALL     MSTAR
      00870F CD 82 83         [ 4] 1485         CALL     RFROM
      008712 CC 86 0D         [ 2] 1486         JP     MSMOD
                                   1487 
                                   1488 ;       */      ( n1 n2 n3 -- q )
                                   1489 ;       Multiply n1 by n2, then divide
                                   1490 ;       by n3. Return quotient only.
      008715 87 03                 1491         .word      LINK
                           000697  1492 LINK = . 
      008717 02                    1493         .byte      2
      008718 2A 2F                 1494         .ascii     "*/"
      00871A                       1495 STASL:
      00871A CD 87 09         [ 4] 1496         CALL	SSMOD
      00871D CD 82 E9         [ 4] 1497         CALL	SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      008720 CC 82 CF         [ 2] 1498         JP	DROP
                                   1499 
                                   1500 ;; Miscellaneous
                                   1501 
                                   1502 ;       CELL+   ( a -- a )
                                   1503 ;       Add cell size in byte to address.
      008723 87 17                 1504         .word      LINK
                           0006A5  1505 LINK = . 
      008725 02                    1506         .byte       2
      008726 32 2B                 1507         .ascii     "2+"
      008728                       1508 CELLP:
      008728 90 93            [ 1] 1509         LDW Y,X
      00872A 90 FE            [ 2] 1510 	LDW Y,(Y)
      00872C 72 A9 00 02      [ 2] 1511         ADDW Y,#CELLL 
      008730 FF               [ 2] 1512         LDW (X),Y
      008731 81               [ 4] 1513         RET
                                   1514 
                                   1515 ;       CELL-   ( a -- a )
                                   1516 ;       Subtract 2 from address.
      008732 87 25                 1517         .word      LINK
                           0006B4  1518 LINK = . 
      008734 02                    1519         .byte       2
      008735 32 2D                 1520         .ascii     "2-"
      008737                       1521 CELLM:
      008737 90 93            [ 1] 1522         LDW Y,X
      008739 90 FE            [ 2] 1523 	LDW Y,(Y)
      00873B 72 A2 00 02      [ 2] 1524         SUBW Y,#CELLL
      00873F FF               [ 2] 1525         LDW (X),Y
      008740 81               [ 4] 1526         RET
                                   1527 
                                   1528 ;       CELLS   ( n -- n )
                                   1529 ;       Multiply tos by 2.
      008741 87 34                 1530         .word      LINK
                           0006C3  1531 LINK = . 
      008743 02                    1532         .byte       2
      008744 32 2A                 1533         .ascii     "2*"
      008746                       1534 CELLS:
      008746 90 93            [ 1] 1535         LDW Y,X
      008748 90 FE            [ 2] 1536 	LDW Y,(Y)
      00874A 90 58            [ 2] 1537         SLAW Y
      00874C FF               [ 2] 1538         LDW (X),Y
      00874D 81               [ 4] 1539         RET
                                   1540 
                                   1541 ;       1+      ( a -- a )
                                   1542 ;       Add cell size in byte to address.
      00874E 87 43                 1543         .word      LINK
                           0006D0  1544 LINK = . 
      008750 02                    1545         .byte      2
      008751 31 2B                 1546         .ascii     "1+"
      008753                       1547 ONEP:
      008753 90 93            [ 1] 1548         LDW Y,X
      008755 90 FE            [ 2] 1549 	LDW Y,(Y)
      008757 90 5C            [ 2] 1550         INCW Y
      008759 FF               [ 2] 1551         LDW (X),Y
      00875A 81               [ 4] 1552         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                   1553 
                                   1554 ;       1-      ( a -- a )
                                   1555 ;       Subtract 2 from address.
      00875B 87 50                 1556         .word      LINK
                           0006DD  1557 LINK = . 
      00875D 02                    1558         .byte      2
      00875E 31 2D                 1559         .ascii     "1-"
      008760                       1560 ONEM:
      008760 90 93            [ 1] 1561         LDW Y,X
      008762 90 FE            [ 2] 1562 	LDW Y,(Y)
      008764 90 5A            [ 2] 1563         DECW Y
      008766 FF               [ 2] 1564         LDW (X),Y
      008767 81               [ 4] 1565         RET
                                   1566 
                                   1567 ;       2/      ( n -- n )
                                   1568 ;       Multiply tos by 2.
      008768 87 5D                 1569         .word      LINK
                           0006EA  1570 LINK = . 
      00876A 02                    1571         .byte      2
      00876B 32 2F                 1572         .ascii     "2/"
      00876D                       1573 TWOSL:
      00876D 90 93            [ 1] 1574         LDW Y,X
      00876F 90 FE            [ 2] 1575 	LDW Y,(Y)
      008771 90 57            [ 2] 1576         SRAW Y
      008773 FF               [ 2] 1577         LDW (X),Y
      008774 81               [ 4] 1578         RET
                                   1579 
                                   1580 ;       BL      ( -- 32 )
                                   1581 ;       Return 32,  blank character.
      008775 87 6A                 1582         .word      LINK
                           0006F7  1583 LINK = . 
      008777 02                    1584         .byte      2
      008778 42 4C                 1585         .ascii     "BL"
      00877A                       1586 BLANK:
      00877A 1D 00 02         [ 2] 1587         SUBW X,#2
      00877D 90 AE 00 20      [ 2] 1588 	LDW Y,#32
      008781 FF               [ 2] 1589         LDW (X),Y
      008782 81               [ 4] 1590         RET
                                   1591 
                                   1592 ;         0     ( -- 0)
                                   1593 ;         Return 0.
      008783 87 77                 1594         .word      LINK
                           000705  1595 LINK = . 
      008785 01                    1596         .byte       1
      008786 30                    1597         .ascii     "0"
      008787                       1598 ZERO:
      008787 1D 00 02         [ 2] 1599         SUBW X,#2
      00878A 90 5F            [ 1] 1600 	CLRW Y
      00878C FF               [ 2] 1601         LDW (X),Y
      00878D 81               [ 4] 1602         RET
                                   1603 
                                   1604 ;         1     ( -- 1)
                                   1605 ;         Return 1.
      00878E 87 85                 1606         .word      LINK
                           000710  1607 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008790 01                    1608         .byte       1
      008791 31                    1609         .ascii     "1"
      008792                       1610 ONE:
      008792 1D 00 02         [ 2] 1611         SUBW X,#2
      008795 90 AE 00 01      [ 2] 1612 	LDW Y,#1
      008799 FF               [ 2] 1613         LDW (X),Y
      00879A 81               [ 4] 1614         RET
                                   1615 
                                   1616 ;         -1    ( -- -1)
                                   1617 ;         Return 32,  blank character.
      00879B 87 90                 1618         .word      LINK
                           00071D  1619 LINK = . 
      00879D 02                    1620         .byte       2
      00879E 2D 31                 1621         .ascii     "-1"
      0087A0                       1622 MONE:
      0087A0 1D 00 02         [ 2] 1623         SUBW X,#2
      0087A3 90 AE FF FF      [ 2] 1624 	LDW Y,#0xFFFF
      0087A7 FF               [ 2] 1625         LDW (X),Y
      0087A8 81               [ 4] 1626         RET
                                   1627 
                                   1628 ;       >CHAR   ( c -- c )
                                   1629 ;       Filter non-printing characters.
      0087A9 87 9D                 1630         .word      LINK
                           00072B  1631 LINK = . 
      0087AB 05                    1632         .byte      5
      0087AC 3E 43 48 41 52        1633         .ascii     ">CHAR"
      0087B1                       1634 TCHAR:
                           000001  1635 .if CONVERT_TO_CODE
      0087B1 E6 01            [ 1] 1636         ld a,(1,x)
      0087B3 A1 20            [ 1] 1637         cp a,#32  
      0087B5 2B 05            [ 1] 1638         jrmi 1$ 
      0087B7 A1 7F            [ 1] 1639         cp a,#127 
      0087B9 2A 01            [ 1] 1640         jrpl 1$ 
      0087BB 81               [ 4] 1641         ret 
      0087BC A6 5F            [ 1] 1642 1$:     ld a,#'_ 
      0087BE E7 01            [ 1] 1643         ld (1,x),a 
      0087C0 81               [ 4] 1644         ret 
                           000000  1645 .else
                                   1646         CALL     DOLIT
                                   1647         .word       0x7F
                                   1648         CALL     ANDD
                                   1649         CALL     DUPP    ;mask msb
                                   1650         CALL     DOLIT
                                   1651         .word      127
                                   1652         CALL     BLANK
                                   1653         CALL     WITHI   ;check for printable
                                   1654         CALL     QBRAN
                                   1655         .word    TCHA1
                                   1656         CALL     DROP
                                   1657         CALL     DOLIT
                                   1658         .word     0x5F		; "_"     ;replace non-printables
                                   1659 .endif 
      0087C1 81               [ 4] 1660 TCHA1:  RET
                                   1661 
                                   1662 ;       DEPTH   ( -- n )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1663 ;       Return  depth of  data stack.
      0087C2 87 AB                 1664         .word      LINK
                           000744  1665 LINK = . 
      0087C4 05                    1666         .byte      5
      0087C5 44 45 50 54 48        1667         .ascii     "DEPTH"
      0087CA                       1668 DEPTH: 
      0087CA 90 BE 22         [ 2] 1669         LDW Y,SP0    ;save data stack ptr
      0087CD BF 1A            [ 2] 1670 	LDW XTEMP,X
      0087CF 72 B2 00 1A      [ 2] 1671         SUBW Y,XTEMP     ;#bytes = SP0 - X
      0087D3 90 57            [ 2] 1672         SRAW Y    ;Y = #stack items
                           000001  1673 .if PICATOUT_MOD
                                   1674 ; why ? 
                                   1675 ;      	DECW Y
                                   1676 .endif 
      0087D5 1D 00 02         [ 2] 1677 	SUBW X,#2
      0087D8 FF               [ 2] 1678         LDW (X),Y     ; if neg, underflow
      0087D9 81               [ 4] 1679         RET
                                   1680 
                                   1681 ;       PICK    ( ... +n -- ... w )
                                   1682 ;       Copy  nth stack item to tos.
      0087DA 87 C4                 1683         .word      LINK
                           00075C  1684 LINK = . 
      0087DC 04                    1685         .byte      4
      0087DD 50 49 43 4B           1686         .ascii     "PICK"
      0087E1                       1687 PICK:
      0087E1 90 93            [ 1] 1688         LDW Y,X   ;D = n1
      0087E3 90 FE            [ 2] 1689         LDW Y,(Y)
      0087E5 90 58            [ 2] 1690         SLAW Y
      0087E7 BF 1A            [ 2] 1691         LDW XTEMP,X
      0087E9 72 B9 00 1A      [ 2] 1692         ADDW Y,XTEMP
      0087ED 90 FE            [ 2] 1693         LDW Y,(Y)
      0087EF FF               [ 2] 1694         LDW (X),Y
      0087F0 81               [ 4] 1695         RET
                                   1696 
                                   1697 ;; Memory access
                                   1698 
                                   1699 ;       +!      ( n a -- )
                                   1700 ;       Add n to  contents at address a.
      0087F1 87 DC                 1701         .word      LINK
                           000773  1702 LINK = . 
      0087F3 02                    1703         .byte      2
      0087F4 2B 21                 1704         .ascii     "+!"
      0087F6                       1705 PSTOR:
                           000001  1706 .if CONVERT_TO_CODE
      0087F6 90 93            [ 1] 1707         ldw y,x 
      0087F8 90 FE            [ 2] 1708         ldw y,(y)
      0087FA 90 BF 1C         [ 2] 1709         ldw YTEMP,y  ; address
      0087FD 90 FE            [ 2] 1710         ldw y,(y)  
      0087FF 90 89            [ 2] 1711         pushw y  ; value at address 
      008801 90 93            [ 1] 1712         ldw y,x 
      008803 90 EE 02         [ 2] 1713         ldw y,(2,y) ; n 
      008806 72 F9 01         [ 2] 1714         addw y,(1,sp) ; n+value
      008809 91 CF 1C         [ 5] 1715         ldw [YTEMP],y ;  a!
      00880C 90 85            [ 2] 1716         popw y    ;drop local var
      00880E 1C 00 04         [ 2] 1717         addw x,#4 ; DDROP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008811 81               [ 4] 1718         ret 
                           000000  1719 .else
                                   1720         CALL	SWAPP
                                   1721         CALL	OVER
                                   1722         CALL	AT
                                   1723         CALL	PLUS
                                   1724         CALL	SWAPP
                                   1725         JP	STORE
                                   1726 .endif 
                                   1727 ;       2!      ( d a -- )
                                   1728 ;       Store  double integer to address a.
      008812 87 F3                 1729         .word      LINK
                           000794  1730 LINK = . 
      008814 02                    1731         .byte      2
      008815 32 21                 1732         .ascii     "2!"
      008817                       1733 DSTOR:
                           000001  1734 .if CONVERT_TO_CODE
      008817 90 93            [ 1] 1735         ldw y,x 
      008819 90 FE            [ 2] 1736         ldw y,(y)
      00881B 90 BF 1C         [ 2] 1737         ldw YTEMP,y ; address 
      00881E 1C 00 02         [ 2] 1738         addw x,#CELLL ; drop a 
      008821 90 93            [ 1] 1739         ldw y,x 
      008823 90 FE            [ 2] 1740         ldw y,(y) ; hi word 
      008825 89               [ 2] 1741         pushw x 
      008826 EE 02            [ 2] 1742         ldw x,(2,x) ; lo word 
      008828 91 CF 1C         [ 5] 1743         ldw [YTEMP],y
      00882B 90 93            [ 1] 1744         ldw y,x 
      00882D AE 00 02         [ 2] 1745         ldw x,#2 
      008830 92 DF 1C         [ 5] 1746         ldw ([YTEMP],x),y 
      008833 85               [ 2] 1747         popw x 
      008834 1C 00 04         [ 2] 1748         addw x,#4 ; DDROP 
      008837 81               [ 4] 1749         ret 
                           000000  1750 .else
                                   1751         CALL	SWAPP
                                   1752         CALL	OVER
                                   1753         CALL	STORE
                                   1754         CALL	CELLP
                                   1755         JP	STORE
                                   1756 .endif 
                                   1757 ;       2@      ( a -- d )
                                   1758 ;       Fetch double integer from address a.
      008838 88 14                 1759         .word      LINK
                           0007BA  1760 LINK = . 
      00883A 02                    1761         .byte      2
      00883B 32 40                 1762         .ascii     "2@"
      00883D                       1763 DAT:
                           000001  1764 .if CONVERT_TO_CODE
      00883D 90 93            [ 1] 1765         ldw y,x 
      00883F 90 FE            [ 2] 1766         ldw y,(y) ;address 
      008841 90 BF 1C         [ 2] 1767         ldw YTEMP,y 
      008844 1D 00 02         [ 2] 1768         subw x,#CELLL ; space for udh 
      008847 91 CE 1C         [ 5] 1769         ldw y,[YTEMP] ; udh 
      00884A FF               [ 2] 1770         ldw (x),y 
      00884B 90 AE 00 02      [ 2] 1771         ldw y,#2
      00884F 91 DE 1C         [ 5] 1772         ldw y,([YTEMP],y) ; udl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008852 EF 02            [ 2] 1773         ldw (2,x),y
      008854 81               [ 4] 1774         ret 
                           000000  1775 .else 
                                   1776         CALL	DUPP
                                   1777         CALL	CELLP
                                   1778         CALL	AT
                                   1779         CALL	SWAPP
                                   1780         JP	AT
                                   1781 .endif 
                                   1782 
                                   1783 ;       COUNT   ( b -- b +n )
                                   1784 ;       Return count byte of a string
                                   1785 ;       and add 1 to byte address.
      008855 88 3A                 1786         .word      LINK
                           0007D7  1787 LINK = . 
      008857 05                    1788         .byte      5
      008858 43 4F 55 4E 54        1789         .ascii     "COUNT"
      00885D                       1790 COUNT:
                           000001  1791 .if CONVERT_TO_CODE
      00885D 90 93            [ 1] 1792         ldw y,x 
      00885F 90 FE            [ 2] 1793         ldw y,(y) ; address 
      008861 90 F6            [ 1] 1794         ld a,(y)  ; count 
      008863 90 5C            [ 2] 1795         incw y 
      008865 FF               [ 2] 1796         ldw (x),y 
      008866 1D 00 02         [ 2] 1797         subw x,#CELLL 
      008869 E7 01            [ 1] 1798         ld (1,x),a 
      00886B 7F               [ 1] 1799         clr (x)
      00886C 81               [ 4] 1800         ret 
                           000000  1801 .else 
                                   1802         CALL     DUPP
                                   1803         CALL     ONEP
                                   1804         CALL     SWAPP
                                   1805         JP     CAT
                                   1806 .endif 
                                   1807 
                                   1808 ;       HERE    ( -- a )
                                   1809 ;       Return  top of  code dictionary.
      00886D 88 57                 1810         .word      LINK
                           0007EF  1811 LINK = . 
      00886F 04                    1812         .byte      4
      008870 48 45 52 45           1813         .ascii     "HERE"
      008874                       1814 HERE:
                           000001  1815 .if CONVERT_TO_CODE
      008874 90 AE 00 16      [ 2] 1816       	ldw y,#UCP 
      008878 90 FE            [ 2] 1817         ldw y,(y)
      00887A 1D 00 02         [ 2] 1818         subw x,#CELLL 
      00887D FF               [ 2] 1819         ldw (x),y 
      00887E 81               [ 4] 1820         ret 
                           000000  1821 .else
                                   1822         CALL     CPP
                                   1823         JP     AT
                                   1824 .endif 
                                   1825 
                                   1826 ;       PAD     ( -- a )
                                   1827 ;       Return address of text buffer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1828 ;       above  code dictionary.
      00887F 88 6F                 1829         .word      LINK
                           000801  1830 LINK = . 
      008881 03                    1831         .byte      3
      008882 50 41 44              1832         .ascii     "PAD"
      008885                       1833 PAD:
      008885 CD 88 74         [ 4] 1834         CALL     HERE
      008888 CD 81 AA         [ 4] 1835         CALL     DOLIT
      00888B 00 50                 1836         .word      80
      00888D CC 84 74         [ 2] 1837         JP     PLUS
                                   1838 
                                   1839 ;       TIB     ( -- a )
                                   1840 ;       Return address of terminal input buffer.
      008890 88 81                 1841         .word      LINK
                           000812  1842 LINK = . 
      008892 03                    1843         .byte      3
      008893 54 49 42              1844         .ascii     "TIB"
      008896                       1845 TIB:
      008896 CD 83 C2         [ 4] 1846         CALL     NTIB
      008899 CD 87 28         [ 4] 1847         CALL     CELLP
      00889C CC 82 32         [ 2] 1848         JP     AT
                                   1849 
                                   1850 ;       @EXECUTE        ( a -- )
                                   1851 ;       Execute vector stored in address a.
      00889F 88 92                 1852         .word      LINK
                           000821  1853 LINK = . 
      0088A1 08                    1854         .byte      8
      0088A2 40 45 58 45 43 55 54  1855         .ascii     "@EXECUTE"
             45
      0088AA                       1856 ATEXE:
      0088AA CD 82 32         [ 4] 1857         CALL     AT
      0088AD CD 84 23         [ 4] 1858         CALL     QDUP    ;?address or zero
      0088B0 CD 81 DD         [ 4] 1859         CALL     QBRAN
      0088B3 88 B8                 1860         .word      EXE1
      0088B5 CD 82 04         [ 4] 1861         CALL     EXECU   ;execute if non-zero
      0088B8 81               [ 4] 1862 EXE1:   RET     ;do nothing if zero
                                   1863 
                                   1864 ;       CMOVE   ( b1 b2 u -- )
                                   1865 ;       Copy u bytes from b1 to b2.
      0088B9 88 A1                 1866         .word      LINK
                           00083B  1867 LINK = . 
      0088BB 05                    1868         .byte      5
      0088BC 43 4D 4F 56 45        1869         .ascii     "CMOVE"
      0088C1                       1870 CMOVE:
      0088C1 CD 82 A2         [ 4] 1871         CALL	TOR
      0088C4 CD 81 F4         [ 4] 1872         CALL	BRAN
      0088C7 88 E1                 1873         .word	CMOV2
      0088C9 CD 82 A2         [ 4] 1874 CMOV1:	CALL	TOR
      0088CC CD 82 D9         [ 4] 1875         CALL	DUPP
      0088CF CD 82 50         [ 4] 1876         CALL	CAT
      0088D2 CD 82 96         [ 4] 1877         CALL	RAT
      0088D5 CD 82 3F         [ 4] 1878         CALL	CSTOR
      0088D8 CD 87 53         [ 4] 1879         CALL	ONEP
      0088DB CD 82 83         [ 4] 1880         CALL	RFROM
      0088DE CD 87 53         [ 4] 1881         CALL	ONEP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      0088E1 CD 81 BE         [ 4] 1882 CMOV2:	CALL	DONXT
      0088E4 88 C9                 1883         .word	CMOV1
      0088E6 CC 84 54         [ 2] 1884         JP	DDROP
                                   1885 
                                   1886 ;       FILL    ( b u c -- )
                                   1887 ;       Fill u bytes of character c
                                   1888 ;       to area beginning at b.
      0088E9 88 BB                 1889         .word       LINK
                           00086B  1890 LINK = . 
      0088EB 04                    1891         .byte       4
      0088EC 46 49 4C 4C           1892         .ascii     "FILL"
      0088F0                       1893 FILL:
                           000001  1894 .if CONVERT_TO_CODE
      0088F0 90 93            [ 1] 1895         ldw y,x 
      0088F2 90 E6 01         [ 1] 1896         ld a,(1,y) ; c 
      0088F5 1C 00 02         [ 2] 1897         addw x,#CELLL ; drop c 
      0088F8 90 93            [ 1] 1898         ldw y,x 
      0088FA 90 FE            [ 2] 1899         ldw y,(y) ; count
      0088FC 90 89            [ 2] 1900         pushw y 
      0088FE 1C 00 02         [ 2] 1901         addw x,#CELLL ; drop u 
      008901 90 93            [ 1] 1902         ldw y,x 
      008903 1C 00 02         [ 2] 1903         addw x,#CELLL ; drop b 
      008906 90 FE            [ 2] 1904         ldw y,(y) ; address
      008908 90 BF 1C         [ 2] 1905         ldw YTEMP,y
      00890B 90 85            [ 2] 1906         popw y ; count 
      00890D                       1907 FILL1:  
      00890D 92 C7 1C         [ 4] 1908         ld [YTEMP],a 
      008910 3C 1D            [ 1] 1909         inc YTEMP+1
      008912 24 02            [ 1] 1910         jrnc FILL2 
      008914 3C 1C            [ 1] 1911         inc YTEMP
      008916                       1912 FILL2: 
      008916 90 5A            [ 2] 1913         decw y ; count 
      008918 26 F3            [ 1] 1914         jrne FILL1  
      00891A 81               [ 4] 1915         ret 
                           000000  1916 .else 
                                   1917         CALL	SWAPP
                                   1918         CALL	TOR
                                   1919         CALL	SWAPP
                                   1920         CALL	BRAN
                                   1921         .word	FILL2
                                   1922 FILL1:	CALL	DDUP
                                   1923         CALL	CSTOR
                                   1924         CALL	ONEP
                                   1925 FILL2:	CALL	DONXT
                                   1926         .word	FILL1
                                   1927         JP	DDROP
                                   1928 .endif
                                   1929 
                                   1930 ;       ERASE   ( b u -- )
                                   1931 ;       Erase u bytes beginning at b.
      00891B 88 EB                 1932         .word      LINK
                           00089D  1933 LINK = . 
      00891D 05                    1934         .byte      5
      00891E 45 52 41 53 45        1935         .ascii     "ERASE"
      008923                       1936 ERASE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                           000001  1937 .if CONVERT_TO_CODE
      008923 90 5F            [ 1] 1938         clrw y 
      008925 1D 00 02         [ 2] 1939         subw x,#CELLL 
      008928 FF               [ 2] 1940         ldw (x),y 
      008929 CC 88 F0         [ 2] 1941         jp FILL 
                           000000  1942 .else 
                                   1943         CALL     ZERO
                                   1944         JP     FILL
                                   1945 .endif 
                                   1946 ;       PACK0x   ( b u a -- a )
                                   1947 ;       Build a counted string with
                                   1948 ;       u characters from b. Null fill.
      00892C 89 1D                 1949         .word      LINK
                           0008AE  1950 LINK = . 
      00892E 05                    1951         .byte      5
      00892F 50 41 43 4B 30 58     1952         .ascii     "PACK0X"
      008935                       1953 PACKS:
      008935 CD 82 D9         [ 4] 1954         CALL     DUPP
      008938 CD 82 A2         [ 4] 1955         CALL     TOR     ;strings only on cell boundary
      00893B CD 84 5F         [ 4] 1956         CALL     DDUP
      00893E CD 82 3F         [ 4] 1957         CALL     CSTOR
      008941 CD 87 53         [ 4] 1958         CALL     ONEP ;save count
      008944 CD 82 E9         [ 4] 1959         CALL     SWAPP
      008947 CD 88 C1         [ 4] 1960         CALL     CMOVE
      00894A CD 82 83         [ 4] 1961         CALL     RFROM
      00894D 81               [ 4] 1962         RET
                                   1963 
                                   1964 ;; Numeric output, single precision
                                   1965 
                                   1966 ;       DIGIT   ( u -- c )
                                   1967 ;       Convert digit u to a character.
      00894E 89 2E                 1968         .word      LINK
                           0008D0  1969 LINK = . 
      008950 05                    1970         .byte      5
      008951 44 49 47 49 54        1971         .ascii     "DIGIT"
      008956                       1972 DIGIT:
      008956 CD 81 AA         [ 4] 1973         CALL	DOLIT
      008959 00 09                 1974         .word	9
      00895B CD 83 03         [ 4] 1975         CALL	OVER
      00895E CD 85 37         [ 4] 1976         CALL	LESS
      008961 CD 81 AA         [ 4] 1977         CALL	DOLIT
      008964 00 07                 1978         .word	7
      008966 CD 83 25         [ 4] 1979         CALL	ANDD
      008969 CD 84 74         [ 4] 1980         CALL	PLUS
      00896C CD 81 AA         [ 4] 1981         CALL	DOLIT
      00896F 00 30                 1982         .word	48	;'0'
      008971 CC 84 74         [ 2] 1983         JP	PLUS
                                   1984 
                                   1985 ;       EXTRACT ( n base -- n c )
                                   1986 ;       Extract least significant digit from n.
      008974 89 50                 1987         .word      LINK
                           0008F6  1988 LINK = . 
      008976 07                    1989         .byte      7
      008977 45 58 54 52 41 43 54  1990         .ascii     "EXTRACT"
      00897E                       1991 EXTRC:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      00897E CD 87 87         [ 4] 1992         CALL     ZERO
      008981 CD 82 E9         [ 4] 1993         CALL     SWAPP
      008984 CD 85 AF         [ 4] 1994         CALL     UMMOD
      008987 CD 82 E9         [ 4] 1995         CALL     SWAPP
      00898A CC 89 56         [ 2] 1996         JP     DIGIT
                                   1997 
                                   1998 ;       <#      ( -- )
                                   1999 ;       Initiate  numeric output process.
      00898D 89 76                 2000         .word      LINK
                           00090F  2001 LINK = . 
      00898F 02                    2002         .byte      2
      008990 3C 23                 2003         .ascii     "<#"
      008992                       2004 BDIGS:
      008992 CD 88 85         [ 4] 2005         CALL     PAD
      008995 CD 83 E2         [ 4] 2006         CALL     HLD
      008998 CC 82 1B         [ 2] 2007         JP     STORE
                                   2008 
                                   2009 ;       HOLD    ( c -- )
                                   2010 ;       Insert a character into output string.
      00899B 89 8F                 2011         .word      LINK
                           00091D  2012 LINK = . 
      00899D 04                    2013         .byte      4
      00899E 48 4F 4C 44           2014         .ascii     "HOLD"
      0089A2                       2015 HOLD:
      0089A2 CD 83 E2         [ 4] 2016         CALL     HLD
      0089A5 CD 82 32         [ 4] 2017         CALL     AT
      0089A8 CD 87 60         [ 4] 2018         CALL     ONEM
      0089AB CD 82 D9         [ 4] 2019         CALL     DUPP
      0089AE CD 83 E2         [ 4] 2020         CALL     HLD
      0089B1 CD 82 1B         [ 4] 2021         CALL     STORE
      0089B4 CC 82 3F         [ 2] 2022         JP     CSTOR
                                   2023 
                                   2024 ;       #       ( u -- u )
                                   2025 ;       Extract one digit from u and
                                   2026 ;       append digit to output string.
      0089B7 89 9D                 2027         .word      LINK
                           000939  2028 LINK = . 
      0089B9 01                    2029         .byte      1
      0089BA 23                    2030         .ascii     "#"
      0089BB                       2031 DIG:
      0089BB CD 83 94         [ 4] 2032         CALL     BASE
      0089BE CD 82 32         [ 4] 2033         CALL     AT
      0089C1 CD 89 7E         [ 4] 2034         CALL     EXTRC
      0089C4 CC 89 A2         [ 2] 2035         JP     HOLD
                                   2036 
                                   2037 ;       #S      ( u -- 0 )
                                   2038 ;       Convert u until all digits
                                   2039 ;       are added to output string.
      0089C7 89 B9                 2040         .word      LINK
                           000949  2041 LINK = . 
      0089C9 02                    2042         .byte      2
      0089CA 23 53                 2043         .ascii     "#S"
      0089CC                       2044 DIGS:
      0089CC CD 89 BB         [ 4] 2045 DIGS1:  CALL     DIG
      0089CF CD 82 D9         [ 4] 2046         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      0089D2 CD 81 DD         [ 4] 2047         CALL     QBRAN
      0089D5 89 D9                 2048         .word      DIGS2
      0089D7 20 F3            [ 2] 2049         JRA     DIGS1
      0089D9 81               [ 4] 2050 DIGS2:  RET
                                   2051 
                                   2052 ;       SIGN    ( n -- )
                                   2053 ;       Add a minus sign to
                                   2054 ;       numeric output string.
      0089DA 89 C9                 2055         .word      LINK
                           00095C  2056 LINK = . 
      0089DC 04                    2057         .byte      4
      0089DD 53 49 47 4E           2058         .ascii     "SIGN"
      0089E1                       2059 SIGN:
      0089E1 CD 83 12         [ 4] 2060         CALL     ZLESS
      0089E4 CD 81 DD         [ 4] 2061         CALL     QBRAN
      0089E7 89 F1                 2062         .word      SIGN1
      0089E9 CD 81 AA         [ 4] 2063         CALL     DOLIT
      0089EC 00 2D                 2064         .word      45	;"-"
      0089EE CC 89 A2         [ 2] 2065         JP     HOLD
      0089F1 81               [ 4] 2066 SIGN1:  RET
                                   2067 
                                   2068 ;       #>      ( w -- b u )
                                   2069 ;       Prepare output string.
      0089F2 89 DC                 2070         .word      LINK
                           000974  2071 LINK = . 
      0089F4 02                    2072         .byte      2
      0089F5 23 3E                 2073         .ascii     "#>"
      0089F7                       2074 EDIGS:
      0089F7 CD 82 CF         [ 4] 2075         CALL     DROP
      0089FA CD 83 E2         [ 4] 2076         CALL     HLD
      0089FD CD 82 32         [ 4] 2077         CALL     AT
      008A00 CD 88 85         [ 4] 2078         CALL     PAD
      008A03 CD 83 03         [ 4] 2079         CALL     OVER
      008A06 CC 84 D2         [ 2] 2080         JP     SUBB
                                   2081 
                                   2082 ;       str     ( w -- b u )
                                   2083 ;       Convert a signed integer
                                   2084 ;       to a numeric string.
      008A09 89 F4                 2085         .word      LINK
                           00098B  2086 LINK = . 
      008A0B 03                    2087         .byte      3
      008A0C 53 54 52              2088         .ascii     "STR"
      008A0F                       2089 STR:
      008A0F CD 82 D9         [ 4] 2090         CALL     DUPP
      008A12 CD 82 A2         [ 4] 2091         CALL     TOR
      008A15 CD 84 EC         [ 4] 2092         CALL     ABSS
      008A18 CD 89 92         [ 4] 2093         CALL     BDIGS
      008A1B CD 89 CC         [ 4] 2094         CALL     DIGS
      008A1E CD 82 83         [ 4] 2095         CALL     RFROM
      008A21 CD 89 E1         [ 4] 2096         CALL     SIGN
      008A24 CC 89 F7         [ 2] 2097         JP     EDIGS
                                   2098 
                                   2099 ;       HEX     ( -- )
                                   2100 ;       Use radix 16 as base for
                                   2101 ;       numeric conversions.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008A27 8A 0B                 2102         .word      LINK
                           0009A9  2103 LINK = . 
      008A29 03                    2104         .byte      3
      008A2A 48 45 58              2105         .ascii     "HEX"
      008A2D                       2106 HEX:
      008A2D CD 81 AA         [ 4] 2107         CALL     DOLIT
      008A30 00 10                 2108         .word      16
      008A32 CD 83 94         [ 4] 2109         CALL     BASE
      008A35 CC 82 1B         [ 2] 2110         JP     STORE
                                   2111 
                                   2112 ;       DECIMAL ( -- )
                                   2113 ;       Use radix 10 as base
                                   2114 ;       for numeric conversions.
      008A38 8A 29                 2115         .word      LINK
                           0009BA  2116 LINK = . 
      008A3A 07                    2117         .byte      7
      008A3B 44 45 43 49 4D 41 4C  2118         .ascii     "DECIMAL"
      008A42                       2119 DECIM:
      008A42 CD 81 AA         [ 4] 2120         CALL     DOLIT
      008A45 00 0A                 2121         .word      10
      008A47 CD 83 94         [ 4] 2122         CALL     BASE
      008A4A CC 82 1B         [ 2] 2123         JP     STORE
                                   2124 
                                   2125 ;; Numeric input, single precision
                                   2126 
                                   2127 ;       DIGIT?  ( c base -- u t )
                                   2128 ;       Convert a character to its numeric
                                   2129 ;       value. A flag indicates success.
      008A4D 8A 3A                 2130         .word      LINK
                           0009CF  2131 LINK = . 
      008A4F 06                    2132         .byte       6
      008A50 44 49 47 49 54 3F     2133         .ascii     "DIGIT?"
      008A56                       2134 DIGTQ:
      008A56 CD 82 A2         [ 4] 2135         CALL     TOR
      008A59 CD 81 AA         [ 4] 2136         CALL     DOLIT
      008A5C 00 30                 2137         .word     48	; "0"
      008A5E CD 84 D2         [ 4] 2138         CALL     SUBB
      008A61 CD 81 AA         [ 4] 2139         CALL     DOLIT
      008A64 00 09                 2140         .word      9
      008A66 CD 83 03         [ 4] 2141         CALL     OVER
      008A69 CD 85 37         [ 4] 2142         CALL     LESS
      008A6C CD 81 DD         [ 4] 2143         CALL     QBRAN
      008A6F 8A 87                 2144         .word      DGTQ1
      008A71 CD 81 AA         [ 4] 2145         CALL     DOLIT
      008A74 00 07                 2146         .word      7
      008A76 CD 84 D2         [ 4] 2147         CALL     SUBB
      008A79 CD 82 D9         [ 4] 2148         CALL     DUPP
      008A7C CD 81 AA         [ 4] 2149         CALL     DOLIT
      008A7F 00 0A                 2150         .word      10
      008A81 CD 85 37         [ 4] 2151         CALL     LESS
      008A84 CD 83 39         [ 4] 2152         CALL     ORR
      008A87 CD 82 D9         [ 4] 2153 DGTQ1:  CALL     DUPP
      008A8A CD 82 83         [ 4] 2154         CALL     RFROM
      008A8D CC 85 19         [ 2] 2155         JP     ULESS
                                   2156 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2157 ;       NUMBER? ( a -- n T | a F )
                                   2158 ;       Convert a number string to
                                   2159 ;       integer. Push a flag on tos.
      008A90 8A 4F                 2160         .word      LINK
                           000A12  2161 LINK = . 
      008A92 07                    2162         .byte      7
      008A93 4E 55 4D 42 45 52 3F  2163         .ascii     "NUMBER?"
      008A9A                       2164 NUMBQ:
      008A9A CD 83 94         [ 4] 2165         CALL     BASE
      008A9D CD 82 32         [ 4] 2166         CALL     AT
      008AA0 CD 82 A2         [ 4] 2167         CALL     TOR
      008AA3 CD 87 87         [ 4] 2168         CALL     ZERO
      008AA6 CD 83 03         [ 4] 2169         CALL     OVER
      008AA9 CD 88 5D         [ 4] 2170         CALL     COUNT
      008AAC CD 83 03         [ 4] 2171         CALL     OVER
      008AAF CD 82 50         [ 4] 2172         CALL     CAT
      008AB2 CD 81 AA         [ 4] 2173         CALL     DOLIT
      008AB5 00 24                 2174         .word     36	; "0x"
      008AB7 CD 84 FA         [ 4] 2175         CALL     EQUAL
      008ABA CD 81 DD         [ 4] 2176         CALL     QBRAN
      008ABD 8A CE                 2177         .word      NUMQ1
      008ABF CD 8A 2D         [ 4] 2178         CALL     HEX
      008AC2 CD 82 E9         [ 4] 2179         CALL     SWAPP
      008AC5 CD 87 53         [ 4] 2180         CALL     ONEP
      008AC8 CD 82 E9         [ 4] 2181         CALL     SWAPP
      008ACB CD 87 60         [ 4] 2182         CALL     ONEM
      008ACE CD 83 03         [ 4] 2183 NUMQ1:  CALL     OVER
      008AD1 CD 82 50         [ 4] 2184         CALL     CAT
      008AD4 CD 81 AA         [ 4] 2185         CALL     DOLIT
      008AD7 00 2D                 2186         .word     45	; "-"
      008AD9 CD 84 FA         [ 4] 2187         CALL     EQUAL
      008ADC CD 82 A2         [ 4] 2188         CALL     TOR
      008ADF CD 82 E9         [ 4] 2189         CALL     SWAPP
      008AE2 CD 82 96         [ 4] 2190         CALL     RAT
      008AE5 CD 84 D2         [ 4] 2191         CALL     SUBB
      008AE8 CD 82 E9         [ 4] 2192         CALL     SWAPP
      008AEB CD 82 96         [ 4] 2193         CALL     RAT
      008AEE CD 84 74         [ 4] 2194         CALL     PLUS
      008AF1 CD 84 23         [ 4] 2195         CALL     QDUP
      008AF4 CD 81 DD         [ 4] 2196         CALL     QBRAN
      008AF7 8B 58                 2197         .word      NUMQ6
      008AF9 CD 87 60         [ 4] 2198         CALL     ONEM
      008AFC CD 82 A2         [ 4] 2199         CALL     TOR
      008AFF CD 82 D9         [ 4] 2200 NUMQ2:  CALL     DUPP
      008B02 CD 82 A2         [ 4] 2201         CALL     TOR
      008B05 CD 82 50         [ 4] 2202         CALL     CAT
      008B08 CD 83 94         [ 4] 2203         CALL     BASE
      008B0B CD 82 32         [ 4] 2204         CALL     AT
      008B0E CD 8A 56         [ 4] 2205         CALL     DIGTQ
      008B11 CD 81 DD         [ 4] 2206         CALL     QBRAN
      008B14 8B 46                 2207         .word      NUMQ4
      008B16 CD 82 E9         [ 4] 2208         CALL     SWAPP
      008B19 CD 83 94         [ 4] 2209         CALL     BASE
      008B1C CD 82 32         [ 4] 2210         CALL     AT
      008B1F CD 86 D2         [ 4] 2211         CALL     STAR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008B22 CD 84 74         [ 4] 2212         CALL     PLUS
      008B25 CD 82 83         [ 4] 2213         CALL     RFROM
      008B28 CD 87 53         [ 4] 2214         CALL     ONEP
      008B2B CD 81 BE         [ 4] 2215         CALL     DONXT
      008B2E 8A FF                 2216         .word      NUMQ2
      008B30 CD 82 96         [ 4] 2217         CALL     RAT
      008B33 CD 82 E9         [ 4] 2218         CALL     SWAPP
      008B36 CD 82 CF         [ 4] 2219         CALL     DROP
      008B39 CD 81 DD         [ 4] 2220         CALL     QBRAN
      008B3C 8B 41                 2221         .word      NUMQ3
      008B3E CD 84 9F         [ 4] 2222         CALL     NEGAT
      008B41 CD 82 E9         [ 4] 2223 NUMQ3:  CALL     SWAPP
      008B44 20 0F            [ 2] 2224         JRA     NUMQ5
      008B46 CD 82 83         [ 4] 2225 NUMQ4:  CALL     RFROM
      008B49 CD 82 83         [ 4] 2226         CALL     RFROM
      008B4C CD 84 54         [ 4] 2227         CALL     DDROP
      008B4F CD 84 54         [ 4] 2228         CALL     DDROP
      008B52 CD 87 87         [ 4] 2229         CALL     ZERO
      008B55 CD 82 D9         [ 4] 2230 NUMQ5:  CALL     DUPP
      008B58 CD 82 83         [ 4] 2231 NUMQ6:  CALL     RFROM
      008B5B CD 84 54         [ 4] 2232         CALL     DDROP
      008B5E CD 82 83         [ 4] 2233         CALL     RFROM
      008B61 CD 83 94         [ 4] 2234         CALL     BASE
      008B64 CC 82 1B         [ 2] 2235         JP     STORE
                                   2236 
                                   2237 ;; Basic I/O
                                   2238 
                                   2239 ;       KEY     ( -- c )
                                   2240 ;       Wait for and return an
                                   2241 ;       input character.
      008B67 8A 92                 2242         .word      LINK
                           000AE9  2243 LINK = . 
      008B69 03                    2244         .byte      3
      008B6A 4B 45 59              2245         .ascii     "KEY"
      008B6D                       2246 KEY:
                           000001  2247 .if CONVERT_TO_CODE
      008B6D 72 0B 52 30 FB   [ 2] 2248         btjf UART1_SR,#UART_SR_RXNE,. 
      008B72 C6 52 31         [ 1] 2249         ld a,UART1_DR 
      008B75 1D 00 02         [ 2] 2250         subw x,#CELLL 
      008B78 E7 01            [ 1] 2251         ld (1,x),a 
      008B7A 7F               [ 1] 2252         clr (x)
      008B7B 81               [ 4] 2253         ret 
                           000000  2254 .else 
                                   2255 KEY1:   CALL     QKEY
                                   2256         CALL     QBRAN
                                   2257         .word      KEY1
                                   2258         RET
                                   2259 .endif 
                                   2260 
                                   2261 ;       NUF?    ( -- t )
                                   2262 ;       Return false if no input,
                                   2263 ;       else pause and if CR return true.
      008B7C 8B 69                 2264         .word      LINK
                           000AFE  2265 LINK = . 
      008B7E 04                    2266         .byte      4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008B7F 4E 55 46 3F           2267         .ascii     "NUF?"
      008B83                       2268 NUFQ:
      008B83 CD 81 76         [ 4] 2269         CALL     QKEY
      008B86 CD 82 D9         [ 4] 2270         CALL     DUPP
      008B89 CD 81 DD         [ 4] 2271         CALL     QBRAN
      008B8C 8B 9C                 2272         .word    NUFQ1
      008B8E CD 84 54         [ 4] 2273         CALL     DDROP
      008B91 CD 8B 6D         [ 4] 2274         CALL     KEY
      008B94 CD 81 AA         [ 4] 2275         CALL     DOLIT
      008B97 00 0D                 2276         .word      CRR
      008B99 CC 84 FA         [ 2] 2277         JP     EQUAL
      008B9C 81               [ 4] 2278 NUFQ1:  RET
                                   2279 
                                   2280 ;       SPACE   ( -- )
                                   2281 ;       Send  blank character to
                                   2282 ;       output device.
      008B9D 8B 7E                 2283         .word      LINK
                           000B1F  2284 LINK = . 
      008B9F 05                    2285         .byte      5
      008BA0 53 50 41 43 45        2286         .ascii     "SPACE"
      008BA5                       2287 SPACE:
      008BA5 CD 87 7A         [ 4] 2288         CALL     BLANK
      008BA8 CC 81 94         [ 2] 2289         JP     EMIT
                                   2290 
                                   2291 ;       SPACES  ( +n -- )
                                   2292 ;       Send n spaces to output device.
      008BAB 8B 9F                 2293         .word      LINK
                           000B2D  2294 LINK = . 
      008BAD 06                    2295         .byte      6
      008BAE 53 50 41 43 45 53     2296         .ascii     "SPACES"
      008BB4                       2297 SPACS:
      008BB4 CD 87 87         [ 4] 2298         CALL     ZERO
      008BB7 CD 85 57         [ 4] 2299         CALL     MAX
      008BBA CD 82 A2         [ 4] 2300         CALL     TOR
      008BBD 20 03            [ 2] 2301         JRA      CHAR2
      008BBF CD 8B A5         [ 4] 2302 CHAR1:  CALL     SPACE
      008BC2 CD 81 BE         [ 4] 2303 CHAR2:  CALL     DONXT
      008BC5 8B BF                 2304         .word    CHAR1
      008BC7 81               [ 4] 2305         RET
                                   2306 
                                   2307 ;       TYPE    ( b u -- )
                                   2308 ;       Output u characters from b.
      008BC8 8B AD                 2309         .word      LINK
                           000B4A  2310 LINK = . 
      008BCA 04                    2311         .byte      4
      008BCB 54 59 50 45           2312         .ascii     "TYPE"
      008BCF                       2313 TYPES:
      008BCF CD 82 A2         [ 4] 2314         CALL     TOR
      008BD2 20 0C            [ 2] 2315         JRA     TYPE2
      008BD4 CD 82 D9         [ 4] 2316 TYPE1:  CALL     DUPP
      008BD7 CD 82 50         [ 4] 2317         CALL     CAT
      008BDA CD 81 94         [ 4] 2318         CALL     EMIT
      008BDD CD 87 53         [ 4] 2319         CALL     ONEP
      008BE0 CD 81 BE         [ 4] 2320 TYPE2:  CALL     DONXT
      008BE3 8B D4                 2321         .word      TYPE1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008BE5 CC 82 CF         [ 2] 2322         JP     DROP
                                   2323 
                                   2324 ;       CR      ( -- )
                                   2325 ;       Output a carriage return
                                   2326 ;       and a line feed.
      008BE8 8B CA                 2327         .word      LINK
                           000B6A  2328 LINK = . 
      008BEA 02                    2329         .byte      2
      008BEB 43 52                 2330         .ascii     "CR"
      008BED                       2331 CR:
      008BED CD 81 AA         [ 4] 2332         CALL     DOLIT
      008BF0 00 0D                 2333         .word      CRR
      008BF2 CD 81 94         [ 4] 2334         CALL     EMIT
      008BF5 CD 81 AA         [ 4] 2335         CALL     DOLIT
      008BF8 00 0A                 2336         .word      LF
      008BFA CC 81 94         [ 2] 2337         JP     EMIT
                                   2338 
                                   2339 ;       do$     ( -- a )
                                   2340 ;       Return  address of a compiled
                                   2341 ;       string.
      008BFD 8B EA                 2342         .word      LINK
                           000B7F  2343 LINK = . 
      008BFF 43                    2344 	.byte      COMPO+3
      008C00 44 4F 24              2345         .ascii     "DO$"
      008C03                       2346 DOSTR:
      008C03 CD 82 83         [ 4] 2347         CALL     RFROM
      008C06 CD 82 96         [ 4] 2348         CALL     RAT
      008C09 CD 82 83         [ 4] 2349         CALL     RFROM
      008C0C CD 88 5D         [ 4] 2350         CALL     COUNT
      008C0F CD 84 74         [ 4] 2351         CALL     PLUS
      008C12 CD 82 A2         [ 4] 2352         CALL     TOR
      008C15 CD 82 E9         [ 4] 2353         CALL     SWAPP
      008C18 CD 82 A2         [ 4] 2354         CALL     TOR
      008C1B 81               [ 4] 2355         RET
                                   2356 
                                   2357 ;       $"|     ( -- a )
                                   2358 ;       Run time routine compiled by $".
                                   2359 ;       Return address of a compiled string.
      008C1C 8B FF                 2360         .word      LINK
                           000B9E  2361 LINK = . 
      008C1E 43                    2362 	.byte      COMPO+3
      008C1F 24 22 7C              2363         .byte     '$','"','|'
      008C22                       2364 STRQP:
      008C22 CD 8C 03         [ 4] 2365         CALL     DOSTR
      008C25 81               [ 4] 2366         RET
                                   2367 
                                   2368 ;       ."|     ( -- )
                                   2369 ;       Run time routine of ." .
                                   2370 ;       Output a compiled string.
      008C26 8C 1E                 2371         .word      LINK
                           000BA8  2372 LINK = . 
      008C28 43                    2373 	.byte      COMPO+3
      008C29 2E 22 7C              2374         .byte     '.','"','|'
      008C2C                       2375 DOTQP:
      008C2C CD 8C 03         [ 4] 2376         CALL     DOSTR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008C2F CD 88 5D         [ 4] 2377         CALL     COUNT
      008C32 CC 8B CF         [ 2] 2378         JP     TYPES
                                   2379 
                                   2380 ;       .R      ( n +n -- )
                                   2381 ;       Display an integer in a field
                                   2382 ;       of n columns, right justified.
      008C35 8C 28                 2383         .word      LINK
                           000BB7  2384 LINK = . 
      008C37 02                    2385         .byte      2
      008C38 2E 52                 2386         .ascii     ".R"
      008C3A                       2387 DOTR:
      008C3A CD 82 A2         [ 4] 2388         CALL     TOR
      008C3D CD 8A 0F         [ 4] 2389         CALL     STR
      008C40 CD 82 83         [ 4] 2390         CALL     RFROM
      008C43 CD 83 03         [ 4] 2391         CALL     OVER
      008C46 CD 84 D2         [ 4] 2392         CALL     SUBB
      008C49 CD 8B B4         [ 4] 2393         CALL     SPACS
      008C4C CC 8B CF         [ 2] 2394         JP     TYPES
                                   2395 
                                   2396 ;       U.R     ( u +n -- )
                                   2397 ;       Display an unsigned integer
                                   2398 ;       in n column, right justified.
      008C4F 8C 37                 2399         .word      LINK
                           000BD1  2400 LINK = . 
      008C51 03                    2401         .byte      3
      008C52 55 2E 52              2402         .ascii     "U.R"
      008C55                       2403 UDOTR:
      008C55 CD 82 A2         [ 4] 2404         CALL     TOR
      008C58 CD 89 92         [ 4] 2405         CALL     BDIGS
      008C5B CD 89 CC         [ 4] 2406         CALL     DIGS
      008C5E CD 89 F7         [ 4] 2407         CALL     EDIGS
      008C61 CD 82 83         [ 4] 2408         CALL     RFROM
      008C64 CD 83 03         [ 4] 2409         CALL     OVER
      008C67 CD 84 D2         [ 4] 2410         CALL     SUBB
      008C6A CD 8B B4         [ 4] 2411         CALL     SPACS
      008C6D CC 8B CF         [ 2] 2412         JP     TYPES
                                   2413 
                                   2414 ;       U.      ( u -- )
                                   2415 ;       Display an unsigned integer
                                   2416 ;       in free format.
      008C70 8C 51                 2417         .word      LINK
                           000BF2  2418 LINK = . 
      008C72 02                    2419         .byte      2
      008C73 55 2E                 2420         .ascii     "U."
      008C75                       2421 UDOT:
      008C75 CD 89 92         [ 4] 2422         CALL     BDIGS
      008C78 CD 89 CC         [ 4] 2423         CALL     DIGS
      008C7B CD 89 F7         [ 4] 2424         CALL     EDIGS
      008C7E CD 8B A5         [ 4] 2425         CALL     SPACE
      008C81 CC 8B CF         [ 2] 2426         JP     TYPES
                                   2427 
                                   2428 ;       .       ( w -- )
                                   2429 ;       Display an integer in free
                                   2430 ;       format, preceeded by a space.
      008C84 8C 72                 2431         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                           000C06  2432 LINK = . 
      008C86 01                    2433         .byte      1
      008C87 2E                    2434         .ascii     "."
      008C88                       2435 DOT:
      008C88 CD 83 94         [ 4] 2436         CALL     BASE
      008C8B CD 82 32         [ 4] 2437         CALL     AT
      008C8E CD 81 AA         [ 4] 2438         CALL     DOLIT
      008C91 00 0A                 2439         .word      10
      008C93 CD 83 4E         [ 4] 2440         CALL     XORR    ;?decimal
      008C96 CD 81 DD         [ 4] 2441         CALL     QBRAN
      008C99 8C 9E                 2442         .word      DOT1
      008C9B CC 8C 75         [ 2] 2443         JP     UDOT
      008C9E CD 8A 0F         [ 4] 2444 DOT1:   CALL     STR
      008CA1 CD 8B A5         [ 4] 2445         CALL     SPACE
      008CA4 CC 8B CF         [ 2] 2446         JP     TYPES
                                   2447 
                                   2448 ;       ?       ( a -- )
                                   2449 ;       Display contents in memory cell.
      008CA7 8C 86                 2450         .word      LINK
                                   2451         
                           000C29  2452 LINK = . 
      008CA9 01                    2453         .byte      1
      008CAA 3F                    2454         .ascii     "?"
      008CAB                       2455 QUEST:
      008CAB CD 82 32         [ 4] 2456         CALL     AT
      008CAE CC 8C 88         [ 2] 2457         JP     DOT
                                   2458 
                                   2459 ;; Parsing
                                   2460 
                                   2461 ;       parse   ( b u c -- b u delta ; <string> )
                                   2462 ;       Scan string delimited by c.
                                   2463 ;       Return found string and its offset.
      008CB1 8C A9                 2464         .word      LINK
                           000C33  2465 LINK = . 
      008CB3 05                    2466         .byte      5
      008CB4 70 61 72 73 65        2467         .ascii     "parse"
      008CB9                       2468 PARS:
      008CB9 CD 83 A3         [ 4] 2469         CALL     TEMP
      008CBC CD 82 1B         [ 4] 2470         CALL     STORE
      008CBF CD 83 03         [ 4] 2471         CALL     OVER
      008CC2 CD 82 A2         [ 4] 2472         CALL     TOR
      008CC5 CD 82 D9         [ 4] 2473         CALL     DUPP
      008CC8 CD 81 DD         [ 4] 2474         CALL     QBRAN
      008CCB 8D 71                 2475         .word    PARS8
      008CCD CD 87 60         [ 4] 2476         CALL     ONEM
      008CD0 CD 83 A3         [ 4] 2477         CALL     TEMP
      008CD3 CD 82 32         [ 4] 2478         CALL     AT
      008CD6 CD 87 7A         [ 4] 2479         CALL     BLANK
      008CD9 CD 84 FA         [ 4] 2480         CALL     EQUAL
      008CDC CD 81 DD         [ 4] 2481         CALL     QBRAN
      008CDF 8D 12                 2482         .word      PARS3
      008CE1 CD 82 A2         [ 4] 2483         CALL     TOR
      008CE4 CD 87 7A         [ 4] 2484 PARS1:  CALL     BLANK
      008CE7 CD 83 03         [ 4] 2485         CALL     OVER
      008CEA CD 82 50         [ 4] 2486         CALL     CAT     ;skip leading blanks ONLY
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008CED CD 84 D2         [ 4] 2487         CALL     SUBB
      008CF0 CD 83 12         [ 4] 2488         CALL     ZLESS
      008CF3 CD 84 8E         [ 4] 2489         CALL     INVER
      008CF6 CD 81 DD         [ 4] 2490         CALL     QBRAN
      008CF9 8D 0F                 2491         .word      PARS2
      008CFB CD 87 53         [ 4] 2492         CALL     ONEP
      008CFE CD 81 BE         [ 4] 2493         CALL     DONXT
      008D01 8C E4                 2494         .word      PARS1
      008D03 CD 82 83         [ 4] 2495         CALL     RFROM
      008D06 CD 82 CF         [ 4] 2496         CALL     DROP
      008D09 CD 87 87         [ 4] 2497         CALL     ZERO
      008D0C CC 82 D9         [ 2] 2498         JP     DUPP
      008D0F CD 82 83         [ 4] 2499 PARS2:  CALL     RFROM
      008D12 CD 83 03         [ 4] 2500 PARS3:  CALL     OVER
      008D15 CD 82 E9         [ 4] 2501         CALL     SWAPP
      008D18 CD 82 A2         [ 4] 2502         CALL     TOR
      008D1B CD 83 A3         [ 4] 2503 PARS4:  CALL     TEMP
      008D1E CD 82 32         [ 4] 2504         CALL     AT
      008D21 CD 83 03         [ 4] 2505         CALL     OVER
      008D24 CD 82 50         [ 4] 2506         CALL     CAT
      008D27 CD 84 D2         [ 4] 2507         CALL     SUBB    ;scan for delimiter
      008D2A CD 83 A3         [ 4] 2508         CALL     TEMP
      008D2D CD 82 32         [ 4] 2509         CALL     AT
      008D30 CD 87 7A         [ 4] 2510         CALL     BLANK
      008D33 CD 84 FA         [ 4] 2511         CALL     EQUAL
      008D36 CD 81 DD         [ 4] 2512         CALL     QBRAN
      008D39 8D 3E                 2513         .word      PARS5
      008D3B CD 83 12         [ 4] 2514         CALL     ZLESS
      008D3E CD 81 DD         [ 4] 2515 PARS5:  CALL     QBRAN
      008D41 8D 53                 2516         .word      PARS6
      008D43 CD 87 53         [ 4] 2517         CALL     ONEP
      008D46 CD 81 BE         [ 4] 2518         CALL     DONXT
      008D49 8D 1B                 2519         .word      PARS4
      008D4B CD 82 D9         [ 4] 2520         CALL     DUPP
      008D4E CD 82 A2         [ 4] 2521         CALL     TOR
      008D51 20 0F            [ 2] 2522         JRA     PARS7
      008D53 CD 82 83         [ 4] 2523 PARS6:  CALL     RFROM
      008D56 CD 82 CF         [ 4] 2524         CALL     DROP
      008D59 CD 82 D9         [ 4] 2525         CALL     DUPP
      008D5C CD 87 53         [ 4] 2526         CALL     ONEP
      008D5F CD 82 A2         [ 4] 2527         CALL     TOR
      008D62 CD 83 03         [ 4] 2528 PARS7:  CALL     OVER
      008D65 CD 84 D2         [ 4] 2529         CALL     SUBB
      008D68 CD 82 83         [ 4] 2530         CALL     RFROM
      008D6B CD 82 83         [ 4] 2531         CALL     RFROM
      008D6E CC 84 D2         [ 2] 2532         JP     SUBB
      008D71 CD 83 03         [ 4] 2533 PARS8:  CALL     OVER
      008D74 CD 82 83         [ 4] 2534         CALL     RFROM
      008D77 CC 84 D2         [ 2] 2535         JP     SUBB
                                   2536 
                                   2537 ;       PARSE   ( c -- b u ; <string> )
                                   2538 ;       Scan input stream and return
                                   2539 ;       counted string delimited by c.
      008D7A 8C B3                 2540         .word      LINK
                           000CFC  2541 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008D7C 05                    2542         .byte      5
      008D7D 50 41 52 53 45        2543         .ascii     "PARSE"
      008D82                       2544 PARSE:
      008D82 CD 82 A2         [ 4] 2545         CALL     TOR
      008D85 CD 88 96         [ 4] 2546         CALL     TIB
      008D88 CD 83 B2         [ 4] 2547         CALL     INN
      008D8B CD 82 32         [ 4] 2548         CALL     AT
      008D8E CD 84 74         [ 4] 2549         CALL     PLUS    ;current input buffer pointer
      008D91 CD 83 C2         [ 4] 2550         CALL     NTIB
      008D94 CD 82 32         [ 4] 2551         CALL     AT
      008D97 CD 83 B2         [ 4] 2552         CALL     INN
      008D9A CD 82 32         [ 4] 2553         CALL     AT
      008D9D CD 84 D2         [ 4] 2554         CALL     SUBB    ;remaining count
      008DA0 CD 82 83         [ 4] 2555         CALL     RFROM
      008DA3 CD 8C B9         [ 4] 2556         CALL     PARS
      008DA6 CD 83 B2         [ 4] 2557         CALL     INN
      008DA9 CC 87 F6         [ 2] 2558         JP     PSTOR
                                   2559 
                                   2560 ;       .(      ( -- )
                                   2561 ;       Output following string up to next ) .
      008DAC 8D 7C                 2562         .word      LINK
                           000D2E  2563 LINK = . 
      008DAE 82                    2564 	.byte      IMEDD+2
      008DAF 2E 28                 2565         .ascii     ".("
      008DB1                       2566 DOTPR:
      008DB1 CD 81 AA         [ 4] 2567         CALL     DOLIT
      008DB4 00 29                 2568         .word     41	; ")"
      008DB6 CD 8D 82         [ 4] 2569         CALL     PARSE
      008DB9 CC 8B CF         [ 2] 2570         JP     TYPES
                                   2571 
                                   2572 ;       (       ( -- )
                                   2573 ;       Ignore following string up to next ).
                                   2574 ;       A comment.
      008DBC 8D AE                 2575         .word      LINK
                           000D3E  2576 LINK = . 
      008DBE 81                    2577 	.byte      IMEDD+1
      008DBF 28                    2578         .ascii     "("
      008DC0                       2579 PAREN:
      008DC0 CD 81 AA         [ 4] 2580         CALL     DOLIT
      008DC3 00 29                 2581         .word     41	; ")"
      008DC5 CD 8D 82         [ 4] 2582         CALL     PARSE
      008DC8 CC 84 54         [ 2] 2583         JP     DDROP
                                   2584 
                                   2585 ;       \       ( -- )
                                   2586 ;       Ignore following text till
                                   2587 ;       end of line.
      008DCB 8D BE                 2588         .word      LINK
                           000D4D  2589 LINK = . 
      008DCD 81                    2590 	.byte      IMEDD+1
      008DCE 5C                    2591         .ascii     "\"
      008DCF                       2592 BKSLA:
                           000001  2593 .if CONVERT_TO_CODE
      008DCF 90 AE 00 0C      [ 2] 2594         ldw y,#UCTIB ; #TIB  
      008DD3 90 FE            [ 2] 2595         ldw y,(y)
      008DD5 90 89            [ 2] 2596         pushw y ; count in TIB 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008DD7 90 AE 00 0A      [ 2] 2597         ldw y,#UINN ; >IN 
      008DDB 90 BF 1C         [ 2] 2598         ldw YTEMP,y
      008DDE 90 85            [ 2] 2599         popw y 
      008DE0 91 CF 1C         [ 5] 2600         ldw [YTEMP],y
      008DE3 81               [ 4] 2601         ret 
                           000000  2602 .else
                                   2603         CALL     NTIB
                                   2604         CALL     AT
                                   2605         CALL     INN
                                   2606         JP     STORE
                                   2607 .endif 
                                   2608 
                                   2609 ;       WORD    ( c -- a ; <string> )
                                   2610 ;       Parse a word from input stream
                                   2611 ;       and copy it to code dictionary.
      008DE4 8D CD                 2612         .word      LINK
                           000D66  2613 LINK = . 
      008DE6 04                    2614         .byte      4
      008DE7 57 4F 52 44           2615         .ascii     "WORD"
      008DEB                       2616 WORDD:
      008DEB CD 8D 82         [ 4] 2617         CALL     PARSE
      008DEE CD 88 74         [ 4] 2618         CALL     HERE
      008DF1 CD 87 28         [ 4] 2619         CALL     CELLP
      008DF4 CC 89 35         [ 2] 2620         JP     PACKS
                                   2621 
                                   2622 ;       TOKEN   ( -- a ; <string> )
                                   2623 ;       Parse a word from input stream
                                   2624 ;       and copy it to name dictionary.
      008DF7 8D E6                 2625         .word      LINK
                           000D79  2626 LINK = . 
      008DF9 05                    2627         .byte      5
      008DFA 54 4F 4B 45 4E        2628         .ascii     "TOKEN"
      008DFF                       2629 TOKEN:
      008DFF CD 87 7A         [ 4] 2630         CALL     BLANK
      008E02 CC 8D EB         [ 2] 2631         JP     WORDD
                                   2632 
                                   2633 ;; Dictionary search
                                   2634 
                                   2635 ;       NAME>   ( na -- ca )
                                   2636 ;       Return a code address given
                                   2637 ;       a name address.
      008E05 8D F9                 2638         .word      LINK
                           000D87  2639 LINK = . 
      008E07 05                    2640         .byte      5
      008E08 4E 41 4D 45 3E        2641         .ascii     "NAME>"
      008E0D                       2642 NAMET:
      008E0D CD 88 5D         [ 4] 2643         CALL     COUNT
      008E10 CD 81 AA         [ 4] 2644         CALL     DOLIT
      008E13 00 1F                 2645         .word      31
      008E15 CD 83 25         [ 4] 2646         CALL     ANDD
      008E18 CC 84 74         [ 2] 2647         JP     PLUS
                                   2648 
                                   2649 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   2650 ;       Compare u cells in two
                                   2651 ;       strings. Return 0 if identical.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008E1B 8E 07                 2652         .word      LINK
                           000D9D  2653 LINK = . 
      008E1D 05                    2654         .byte       5
      008E1E 53 41 4D 45 3F        2655         .ascii     "SAME?"
      008E23                       2656 SAMEQ:
      008E23 CD 87 60         [ 4] 2657         CALL     ONEM
      008E26 CD 82 A2         [ 4] 2658         CALL     TOR
      008E29 20 29            [ 2] 2659         JRA     SAME2
      008E2B CD 83 03         [ 4] 2660 SAME1:  CALL     OVER
      008E2E CD 82 96         [ 4] 2661         CALL     RAT
      008E31 CD 84 74         [ 4] 2662         CALL     PLUS
      008E34 CD 82 50         [ 4] 2663         CALL     CAT
      008E37 CD 83 03         [ 4] 2664         CALL     OVER
      008E3A CD 82 96         [ 4] 2665         CALL     RAT
      008E3D CD 84 74         [ 4] 2666         CALL     PLUS
      008E40 CD 82 50         [ 4] 2667         CALL     CAT
      008E43 CD 84 D2         [ 4] 2668         CALL     SUBB
      008E46 CD 84 23         [ 4] 2669         CALL     QDUP
      008E49 CD 81 DD         [ 4] 2670         CALL     QBRAN
      008E4C 8E 54                 2671         .word      SAME2
      008E4E CD 82 83         [ 4] 2672         CALL     RFROM
      008E51 CC 82 CF         [ 2] 2673         JP     DROP
      008E54 CD 81 BE         [ 4] 2674 SAME2:  CALL     DONXT
      008E57 8E 2B                 2675         .word      SAME1
      008E59 CC 87 87         [ 2] 2676         JP     ZERO
                                   2677 
                                   2678 ;       find    ( a va -- ca na | a F )
                                   2679 ;       Search vocabulary for string.
                                   2680 ;       Return ca and na if succeeded.
      008E5C 8E 1D                 2681         .word      LINK
                           000DDE  2682 LINK = . 
      008E5E 04                    2683         .byte      4
      008E5F 46 49 4E 44           2684         .ascii     "FIND"
      008E63                       2685 FIND:
      008E63 CD 82 E9         [ 4] 2686         CALL     SWAPP
      008E66 CD 82 D9         [ 4] 2687         CALL     DUPP
      008E69 CD 82 50         [ 4] 2688         CALL     CAT
      008E6C CD 83 A3         [ 4] 2689         CALL     TEMP
      008E6F CD 82 1B         [ 4] 2690         CALL     STORE
      008E72 CD 82 D9         [ 4] 2691         CALL     DUPP
      008E75 CD 82 32         [ 4] 2692         CALL     AT
      008E78 CD 82 A2         [ 4] 2693         CALL     TOR
      008E7B CD 87 28         [ 4] 2694         CALL     CELLP
      008E7E CD 82 E9         [ 4] 2695         CALL     SWAPP
      008E81 CD 82 32         [ 4] 2696 FIND1:  CALL     AT
      008E84 CD 82 D9         [ 4] 2697         CALL     DUPP
      008E87 CD 81 DD         [ 4] 2698         CALL     QBRAN
      008E8A 8E C0                 2699         .word      FIND6
      008E8C CD 82 D9         [ 4] 2700         CALL     DUPP
      008E8F CD 82 32         [ 4] 2701         CALL     AT
      008E92 CD 81 AA         [ 4] 2702         CALL     DOLIT
      008E95 1F 7F                 2703         .word      MASKK
      008E97 CD 83 25         [ 4] 2704         CALL     ANDD
      008E9A CD 82 96         [ 4] 2705         CALL     RAT
      008E9D CD 83 4E         [ 4] 2706         CALL     XORR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008EA0 CD 81 DD         [ 4] 2707         CALL     QBRAN
      008EA3 8E AF                 2708         .word      FIND2
      008EA5 CD 87 28         [ 4] 2709         CALL     CELLP
      008EA8 CD 81 AA         [ 4] 2710         CALL     DOLIT
      008EAB FF FF                 2711         .word     0xFFFF
      008EAD 20 0C            [ 2] 2712         JRA     FIND3
      008EAF CD 87 28         [ 4] 2713 FIND2:  CALL     CELLP
      008EB2 CD 83 A3         [ 4] 2714         CALL     TEMP
      008EB5 CD 82 32         [ 4] 2715         CALL     AT
      008EB8 CD 8E 23         [ 4] 2716         CALL     SAMEQ
      008EBB CD 81 F4         [ 4] 2717 FIND3:  CALL     BRAN
      008EBE 8E CF                 2718         .word      FIND4
      008EC0 CD 82 83         [ 4] 2719 FIND6:  CALL     RFROM
      008EC3 CD 82 CF         [ 4] 2720         CALL     DROP
      008EC6 CD 82 E9         [ 4] 2721         CALL     SWAPP
      008EC9 CD 87 37         [ 4] 2722         CALL     CELLM
      008ECC CC 82 E9         [ 2] 2723         JP     SWAPP
      008ECF CD 81 DD         [ 4] 2724 FIND4:  CALL     QBRAN
      008ED2 8E DC                 2725         .word      FIND5
      008ED4 CD 87 37         [ 4] 2726         CALL     CELLM
      008ED7 CD 87 37         [ 4] 2727         CALL     CELLM
      008EDA 20 A5            [ 2] 2728         JRA     FIND1
      008EDC CD 82 83         [ 4] 2729 FIND5:  CALL     RFROM
      008EDF CD 82 CF         [ 4] 2730         CALL     DROP
      008EE2 CD 82 E9         [ 4] 2731         CALL     SWAPP
      008EE5 CD 82 CF         [ 4] 2732         CALL     DROP
      008EE8 CD 87 37         [ 4] 2733         CALL     CELLM
      008EEB CD 82 D9         [ 4] 2734         CALL     DUPP
      008EEE CD 8E 0D         [ 4] 2735         CALL     NAMET
      008EF1 CC 82 E9         [ 2] 2736         JP     SWAPP
                                   2737 
                                   2738 ;       NAME?   ( a -- ca na | a F )
                                   2739 ;       Search vocabularies for a string.
      008EF4 8E 5E                 2740         .word      LINK
                           000E76  2741 LINK = . 
      008EF6 05                    2742         .byte      5
      008EF7 4E 41 4D 45 3F        2743         .ascii     "NAME?"
      008EFC                       2744 NAMEQ:
      008EFC CD 83 F5         [ 4] 2745         CALL   CNTXT
      008EFF CC 8E 63         [ 2] 2746         JP     FIND
                                   2747 
                                   2748 ;; Terminal response
                                   2749 
                                   2750 ;       ^H      ( bot eot cur -- bot eot cur )
                                   2751 ;       Backup cursor by one character.
      008F02 8E F6                 2752         .word      LINK
                           000E84  2753 LINK = . 
      008F04 02                    2754         .byte      2
      008F05 5E 48                 2755         .ascii     "^H"
      008F07                       2756 BKSP:
      008F07 CD 82 A2         [ 4] 2757         CALL     TOR
      008F0A CD 83 03         [ 4] 2758         CALL     OVER
      008F0D CD 82 83         [ 4] 2759         CALL     RFROM
      008F10 CD 82 E9         [ 4] 2760         CALL     SWAPP
      008F13 CD 83 03         [ 4] 2761         CALL     OVER
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008F16 CD 83 4E         [ 4] 2762         CALL     XORR
      008F19 CD 81 DD         [ 4] 2763         CALL     QBRAN
      008F1C 8F 37                 2764         .word      BACK1
      008F1E CD 81 AA         [ 4] 2765         CALL     DOLIT
      008F21 00 08                 2766         .word      BKSPP
      008F23 CD 81 94         [ 4] 2767         CALL     EMIT
      008F26 CD 87 60         [ 4] 2768         CALL     ONEM
      008F29 CD 87 7A         [ 4] 2769         CALL     BLANK
      008F2C CD 81 94         [ 4] 2770         CALL     EMIT
      008F2F CD 81 AA         [ 4] 2771         CALL     DOLIT
      008F32 00 08                 2772         .word      BKSPP
      008F34 CC 81 94         [ 2] 2773         JP     EMIT
      008F37 81               [ 4] 2774 BACK1:  RET
                                   2775 
                                   2776 ;       TAP     ( bot eot cur c -- bot eot cur )
                                   2777 ;       Accept and echo key stroke
                                   2778 ;       and bump cursor.
      008F38 8F 04                 2779         .word      LINK
                           000EBA  2780 LINK = . 
      008F3A 03                    2781         .byte      3
      008F3B 54 41 50              2782         .ascii     "TAP"
      008F3E                       2783 TAP:
      008F3E CD 82 D9         [ 4] 2784         CALL     DUPP
      008F41 CD 81 94         [ 4] 2785         CALL     EMIT
      008F44 CD 83 03         [ 4] 2786         CALL     OVER
      008F47 CD 82 3F         [ 4] 2787         CALL     CSTOR
      008F4A CC 87 53         [ 2] 2788         JP     ONEP
                                   2789 
                                   2790 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   2791 ;       Process a key stroke,
                                   2792 ;       CR or backspace.
      008F4D 8F 3A                 2793         .word      LINK
                           000ECF  2794 LINK = . 
      008F4F 04                    2795         .byte      4
      008F50 4B 54 41 50           2796         .ascii     "KTAP"
      008F54                       2797 KTAP:
      008F54 CD 82 D9         [ 4] 2798         CALL     DUPP
      008F57 CD 81 AA         [ 4] 2799         CALL     DOLIT
      008F5A 00 0D                 2800         .word      CRR
      008F5C CD 83 4E         [ 4] 2801         CALL     XORR
      008F5F CD 81 DD         [ 4] 2802         CALL     QBRAN
      008F62 8F 7A                 2803         .word      KTAP2
      008F64 CD 81 AA         [ 4] 2804         CALL     DOLIT
      008F67 00 08                 2805         .word      BKSPP
      008F69 CD 83 4E         [ 4] 2806         CALL     XORR
      008F6C CD 81 DD         [ 4] 2807         CALL     QBRAN
      008F6F 8F 77                 2808         .word      KTAP1
      008F71 CD 87 7A         [ 4] 2809         CALL     BLANK
      008F74 CC 8F 3E         [ 2] 2810         JP     TAP
      008F77 CC 8F 07         [ 2] 2811 KTAP1:  JP     BKSP
      008F7A CD 82 CF         [ 4] 2812 KTAP2:  CALL     DROP
      008F7D CD 82 E9         [ 4] 2813         CALL     SWAPP
      008F80 CD 82 CF         [ 4] 2814         CALL     DROP
      008F83 CC 82 D9         [ 2] 2815         JP     DUPP
                                   2816 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2817 ;       accept  ( b u -- b u )
                                   2818 ;       Accept characters to input
                                   2819 ;       buffer. Return with actual count.
      008F86 8F 4F                 2820         .word      LINK
                           000F08  2821 LINK = . 
      008F88 06                    2822         .byte      6
      008F89 41 43 43 45 50 54     2823         .ascii     "ACCEPT"
      008F8F                       2824 ACCEP:
      008F8F CD 83 03         [ 4] 2825         CALL     OVER
      008F92 CD 84 74         [ 4] 2826         CALL     PLUS
      008F95 CD 83 03         [ 4] 2827         CALL     OVER
      008F98 CD 84 5F         [ 4] 2828 ACCP1:  CALL     DDUP
      008F9B CD 83 4E         [ 4] 2829         CALL     XORR
      008F9E CD 81 DD         [ 4] 2830         CALL     QBRAN
      008FA1 8F C3                 2831         .word      ACCP4
      008FA3 CD 8B 6D         [ 4] 2832         CALL     KEY
      008FA6 CD 82 D9         [ 4] 2833         CALL     DUPP
      008FA9 CD 87 7A         [ 4] 2834         CALL     BLANK
      008FAC CD 81 AA         [ 4] 2835         CALL     DOLIT
      008FAF 00 7F                 2836         .word      127
      008FB1 CD 85 94         [ 4] 2837         CALL     WITHI
      008FB4 CD 81 DD         [ 4] 2838         CALL     QBRAN
      008FB7 8F BE                 2839         .word      ACCP2
      008FB9 CD 8F 3E         [ 4] 2840         CALL     TAP
      008FBC 20 03            [ 2] 2841         JRA     ACCP3
      008FBE CD 8F 54         [ 4] 2842 ACCP2:  CALL     KTAP
      008FC1 20 D5            [ 2] 2843 ACCP3:  JRA     ACCP1
      008FC3 CD 82 CF         [ 4] 2844 ACCP4:  CALL     DROP
      008FC6 CD 83 03         [ 4] 2845         CALL     OVER
      008FC9 CC 84 D2         [ 2] 2846         JP     SUBB
                                   2847 
                                   2848 ;       QUERY   ( -- )
                                   2849 ;       Accept input stream to
                                   2850 ;       terminal input buffer.
      008FCC 8F 88                 2851         .word      LINK
                                   2852         
                           000F4E  2853 LINK = . 
      008FCE 05                    2854         .byte      5
      008FCF 51 55 45 52 59        2855         .ascii     "QUERY"
      008FD4                       2856 QUERY:
      008FD4 CD 88 96         [ 4] 2857         CALL     TIB
      008FD7 CD 81 AA         [ 4] 2858         CALL     DOLIT
      008FDA 00 50                 2859         .word      80
      008FDC CD 8F 8F         [ 4] 2860         CALL     ACCEP
      008FDF CD 83 C2         [ 4] 2861         CALL     NTIB
      008FE2 CD 82 1B         [ 4] 2862         CALL     STORE
      008FE5 CD 82 CF         [ 4] 2863         CALL     DROP
      008FE8 CD 87 87         [ 4] 2864         CALL     ZERO
      008FEB CD 83 B2         [ 4] 2865         CALL     INN
      008FEE CC 82 1B         [ 2] 2866         JP     STORE
                                   2867 
                                   2868 ;       ABORT   ( -- )
                                   2869 ;       Reset data stack and
                                   2870 ;       jump to QUIT.
      008FF1 8F CE                 2871         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                           000F73  2872 LINK = . 
      008FF3 05                    2873         .byte      5
      008FF4 41 42 4F 52 54        2874         .ascii     "ABORT"
      008FF9                       2875 ABORT:
      008FF9 CD 90 F0         [ 4] 2876         CALL     PRESE
      008FFC CC 91 0D         [ 2] 2877         JP     QUIT
                                   2878 
                                   2879 ;       abort"  ( f -- )
                                   2880 ;       Run time routine of ABORT".
                                   2881 ;       Abort with a message.
      008FFF 8F F3                 2882         .word      LINK
                           000F81  2883 LINK = . 
      009001 46                    2884 	.byte      COMPO+6
      009002 41 42 4F 52 54        2885         .ascii     "ABORT"
      009007 22                    2886         .byte      '"'
      009008                       2887 ABORQ:
      009008 CD 81 DD         [ 4] 2888         CALL     QBRAN
      00900B 90 27                 2889         .word      ABOR2   ;text flag
      00900D CD 8C 03         [ 4] 2890         CALL     DOSTR
      009010 CD 8B A5         [ 4] 2891 ABOR1:  CALL     SPACE
      009013 CD 88 5D         [ 4] 2892         CALL     COUNT
      009016 CD 8B CF         [ 4] 2893         CALL     TYPES
      009019 CD 81 AA         [ 4] 2894         CALL     DOLIT
      00901C 00 3F                 2895         .word     63 ; "?"
      00901E CD 81 94         [ 4] 2896         CALL     EMIT
      009021 CD 8B ED         [ 4] 2897         CALL     CR
      009024 CC 8F F9         [ 2] 2898         JP     ABORT   ;pass error string
      009027 CD 8C 03         [ 4] 2899 ABOR2:  CALL     DOSTR
      00902A CC 82 CF         [ 2] 2900         JP     DROP
                                   2901 
                                   2902 ;; The text interpreter
                                   2903 
                                   2904 ;       $INTERPRET      ( a -- )
                                   2905 ;       Interpret a word. If failed,
                                   2906 ;       try to convert it to an integer.
      00902D 90 01                 2907         .word      LINK
                           000FAF  2908 LINK = . 
      00902F 0A                    2909         .byte      10
      009030 24 49 4E 54 45 52 50  2910         .ascii     "$INTERPRET"
             52 45 54
      00903A                       2911 INTER:
      00903A CD 8E FC         [ 4] 2912         CALL     NAMEQ
      00903D CD 84 23         [ 4] 2913         CALL     QDUP    ;?defined
      009040 CD 81 DD         [ 4] 2914         CALL     QBRAN
      009043 90 64                 2915         .word      INTE1
      009045 CD 82 32         [ 4] 2916         CALL     AT
      009048 CD 81 AA         [ 4] 2917         CALL     DOLIT
      00904B 40 00                 2918 	.word       0x4000	; COMPO*256
      00904D CD 83 25         [ 4] 2919         CALL     ANDD    ;?compile only lexicon bits
      009050 CD 90 08         [ 4] 2920         CALL     ABORQ
      009053 0D                    2921         .byte      13
      009054 20 63 6F 6D 70 69 6C  2922         .ascii     " compile only"
             65 20 6F 6E 6C 79
      009061 CC 82 04         [ 2] 2923         JP     EXECU
      009064 CD 8A 9A         [ 4] 2924 INTE1:  CALL     NUMBQ   ;convert a number
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      009067 CD 81 DD         [ 4] 2925         CALL     QBRAN
      00906A 90 10                 2926         .word    ABOR1
      00906C 81               [ 4] 2927         RET
                                   2928 
                                   2929 ;       [       ( -- )
                                   2930 ;       Start  text interpreter.
      00906D 90 2F                 2931         .word      LINK
                           000FEF  2932 LINK = . 
      00906F 81                    2933 	.byte      IMEDD+1
      009070 5B                    2934         .ascii     "["
      009071                       2935 LBRAC:
      009071 CD 81 AA         [ 4] 2936         CALL     DOLIT
      009074 90 3A                 2937         .word      INTER
      009076 CD 83 D3         [ 4] 2938         CALL     TEVAL
      009079 CC 82 1B         [ 2] 2939         JP     STORE
                                   2940 
                                   2941 ;       .OK     ( -- )
                                   2942 ;       Display 'ok' while interpreting.
      00907C 90 6F                 2943         .word      LINK
                           000FFE  2944 LINK = . 
      00907E 03                    2945         .byte      3
      00907F 2E 4F 4B              2946         .ascii     ".OK"
      009082                       2947 DOTOK:
      009082 CD 81 AA         [ 4] 2948         CALL     DOLIT
      009085 90 3A                 2949         .word      INTER
      009087 CD 83 D3         [ 4] 2950         CALL     TEVAL
      00908A CD 82 32         [ 4] 2951         CALL     AT
      00908D CD 84 FA         [ 4] 2952         CALL     EQUAL
      009090 CD 81 DD         [ 4] 2953         CALL     QBRAN
      009093 90 9C                 2954         .word      DOTO1
      009095 CD 8C 2C         [ 4] 2955         CALL     DOTQP
      009098 03                    2956         .byte      3
      009099 20 6F 6B              2957         .ascii     " ok"
      00909C CC 8B ED         [ 2] 2958 DOTO1:  JP     CR
                                   2959 
                                   2960 ;       ?STACK  ( -- )
                                   2961 ;       Abort if stack underflows.
      00909F 90 7E                 2962         .word      LINK
                           001021  2963 LINK = . 
      0090A1 06                    2964         .byte      6
      0090A2 3F 53 54 41 43 4B     2965         .ascii     "?STACK"
      0090A8                       2966 QSTAC: 
      0090A8 CD 87 CA         [ 4] 2967         CALL     DEPTH
      0090AB CD 83 12         [ 4] 2968         CALL     ZLESS   ;check only for underflow
      0090AE CD 90 08         [ 4] 2969         CALL     ABORQ
      0090B1 0B                    2970         .byte      11
      0090B2 20 75 6E 64 65 72 66  2971         .ascii     " underflow "
             6C 6F 77 20
      0090BD 81               [ 4] 2972         RET
                                   2973 
                                   2974 ;       EVAL    ( -- )
                                   2975 ;       Interpret  input stream.
      0090BE 90 A1                 2976         .word      LINK
                           001040  2977 LINK = . 
      0090C0 04                    2978         .byte      4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      0090C1 45 56 41 4C           2979         .ascii     "EVAL"
      0090C5                       2980 EVAL:
      0090C5 CD 8D FF         [ 4] 2981 EVAL1:  CALL     TOKEN
      0090C8 CD 82 D9         [ 4] 2982         CALL     DUPP
      0090CB CD 82 50         [ 4] 2983         CALL     CAT     ;?input stream empty
      0090CE CD 81 DD         [ 4] 2984         CALL     QBRAN
      0090D1 90 E1                 2985         .word    EVAL2
      0090D3 CD 83 D3         [ 4] 2986         CALL     TEVAL
      0090D6 CD 88 AA         [ 4] 2987         CALL     ATEXE
      0090D9 CD 90 A8         [ 4] 2988         CALL     QSTAC   ;evaluate input, check stack
      0090DC CD 81 F4         [ 4] 2989         CALL     BRAN
      0090DF 90 C5                 2990         .word    EVAL1
      0090E1 CD 82 CF         [ 4] 2991 EVAL2:  CALL     DROP
      0090E4 CC 90 82         [ 2] 2992         JP       DOTOK
                                   2993 
                                   2994 ;       PRESET  ( -- )
                                   2995 ;       Reset data stack pointer and
                                   2996 ;       terminal input buffer.
      0090E7 90 C0                 2997         .word      LINK
                           001069  2998 LINK = . 
      0090E9 06                    2999         .byte      6
      0090EA 50 52 45 53 45 54     3000         .ascii     "PRESET"
      0090F0                       3001 PRESE:
      0090F0 CD 81 AA         [ 4] 3002         CALL     DOLIT
      0090F3 16 F0                 3003         .word      SPP
      0090F5 CD 82 C6         [ 4] 3004         CALL     SPSTO
      0090F8 CD 81 AA         [ 4] 3005         CALL     DOLIT
      0090FB 17 00                 3006         .word      TIBB
      0090FD CD 83 C2         [ 4] 3007         CALL     NTIB
      009100 CD 87 28         [ 4] 3008         CALL     CELLP
      009103 CC 82 1B         [ 2] 3009         JP     STORE
                                   3010 
                                   3011 ;       QUIT    ( -- )
                                   3012 ;       Reset return stack pointer
                                   3013 ;       and start text interpreter.
      009106 90 E9                 3014         .word      LINK
                           001088  3015 LINK = . 
      009108 04                    3016         .byte      4
      009109 51 55 49 54           3017         .ascii     "QUIT"
      00910D                       3018 QUIT:
      00910D CD 81 AA         [ 4] 3019         CALL     DOLIT
      009110 17 FF                 3020         .word      RPP
      009112 CD 82 6D         [ 4] 3021         CALL     RPSTO   ;reset return stack pointer
      009115 CD 90 71         [ 4] 3022 QUIT1:  CALL     LBRAC   ;start interpretation
      009118 CD 8F D4         [ 4] 3023 QUIT2:  CALL     QUERY   ;get input
      00911B CD 90 C5         [ 4] 3024         CALL     EVAL
      00911E 20 F8            [ 2] 3025         JRA     QUIT2   ;continue till error
                                   3026 
                                   3027 ;; The compiler
                                   3028 
                                   3029 ;       '       ( -- ca )
                                   3030 ;       Search vocabularies for
                                   3031 ;       next word in input stream.
      009120 91 08                 3032         .word      LINK
                           0010A2  3033 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      009122 01                    3034         .byte      1
      009123 27                    3035         .ascii     "'"
      009124                       3036 TICK:
      009124 CD 8D FF         [ 4] 3037         CALL     TOKEN
      009127 CD 8E FC         [ 4] 3038         CALL     NAMEQ   ;?defined
      00912A CD 81 DD         [ 4] 3039         CALL     QBRAN
      00912D 90 10                 3040         .word      ABOR1
      00912F 81               [ 4] 3041         RET     ;yes, push code address
                                   3042 
                                   3043 ;       ALLOT   ( n -- )
                                   3044 ;       Allocate n bytes to  code dictionary.
      009130 91 22                 3045         .word      LINK
                           0010B2  3046 LINK = . 
      009132 05                    3047         .byte      5
      009133 41 4C 4C 4F 54        3048         .ascii     "ALLOT"
      009138                       3049 ALLOT:
      009138 CD 84 03         [ 4] 3050         CALL     CPP
      00913B CC 87 F6         [ 2] 3051         JP     PSTOR
                                   3052 
                                   3053 ;       ,       ( w -- )
                                   3054 ;         Compile an integer into
                                   3055 ;         code dictionary.
      00913E 91 32                 3056         .word      LINK
                           0010C0  3057 LINK = . 
      009140 01                    3058         .byte      1
      009141 2C                    3059         .ascii     ","
      009142                       3060 COMMA:
      009142 CD 88 74         [ 4] 3061         CALL     HERE
      009145 CD 82 D9         [ 4] 3062         CALL     DUPP
      009148 CD 87 28         [ 4] 3063         CALL     CELLP   ;cell boundary
      00914B CD 84 03         [ 4] 3064         CALL     CPP
      00914E CD 82 1B         [ 4] 3065         CALL     STORE
      009151 CC 82 1B         [ 2] 3066         JP     STORE
                                   3067 
                                   3068 ;       C,      ( c -- )
                                   3069 ;       Compile a byte into
                                   3070 ;       code dictionary.
      009154 91 40                 3071        .word      LINK
                           0010D6  3072 LINK = . 
      009156 02                    3073         .byte      2
      009157 43 2C                 3074         .ascii     "C,"
      009159                       3075 CCOMMA:
      009159 CD 88 74         [ 4] 3076         CALL     HERE
      00915C CD 82 D9         [ 4] 3077         CALL     DUPP
      00915F CD 87 53         [ 4] 3078         CALL     ONEP
      009162 CD 84 03         [ 4] 3079         CALL     CPP
      009165 CD 82 1B         [ 4] 3080         CALL     STORE
      009168 CC 82 3F         [ 2] 3081         JP     CSTOR
                                   3082 
                                   3083 ;       [COMPILE]       ( -- ; <string> )
                                   3084 ;       Compile next immediate
                                   3085 ;       word into code dictionary.
      00916B 91 56                 3086         .word      LINK
                           0010ED  3087 LINK = . 
      00916D 89                    3088 	.byte      IMEDD+9
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      00916E 5B 43 4F 4D 50 49 4C  3089         .ascii     "[COMPILE]"
             45 5D
      009177                       3090 BCOMP:
      009177 CD 91 24         [ 4] 3091         CALL     TICK
      00917A CC 93 D3         [ 2] 3092         JP     JSRC
                                   3093 
                                   3094 ;       COMPILE ( -- )
                                   3095 ;       Compile next jsr in
                                   3096 ;       colon list to code dictionary.
      00917D 91 6D                 3097         .word      LINK
                           0010FF  3098 LINK = . 
      00917F 47                    3099 	.byte      COMPO+7
      009180 43 4F 4D 50 49 4C 45  3100         .ascii     "COMPILE"
      009187                       3101 COMPI:
      009187 CD 82 83         [ 4] 3102         CALL     RFROM
      00918A CD 87 53         [ 4] 3103         CALL     ONEP
      00918D CD 82 D9         [ 4] 3104         CALL     DUPP
      009190 CD 82 32         [ 4] 3105         CALL     AT
      009193 CD 93 D3         [ 4] 3106         CALL     JSRC    ;compile subroutine
      009196 CD 87 28         [ 4] 3107         CALL     CELLP
      009199 CC 82 A2         [ 2] 3108         JP     TOR
                                   3109 
                                   3110 ;       LITERAL ( w -- )
                                   3111 ;       Compile tos to dictionary
                                   3112 ;       as an integer literal.
      00919C 91 7F                 3113         .word      LINK
                           00111E  3114 LINK = . 
      00919E 87                    3115 	.byte      IMEDD+7
      00919F 4C 49 54 45 52 41 4C  3116         .ascii     "LITERAL"
      0091A6                       3117 LITER:
      0091A6 CD 91 87         [ 4] 3118         CALL     COMPI
      0091A9 CD 81 AA         [ 4] 3119         CALL     DOLIT
      0091AC CC 91 42         [ 2] 3120         JP     COMMA
                                   3121 
                                   3122 ;       $,"     ( -- )
                                   3123 ;       Compile a literal string
                                   3124 ;       up to next " .
      0091AF 91 9E                 3125         .word      LINK
                           001131  3126 LINK = . 
      0091B1 03                    3127         .byte      3
      0091B2 24 2C 22              3128         .byte     '$',',','"'
      0091B5                       3129 STRCQ:
      0091B5 CD 81 AA         [ 4] 3130         CALL     DOLIT
      0091B8 00 22                 3131         .word     34	; "
      0091BA CD 8D 82         [ 4] 3132         CALL     PARSE
      0091BD CD 88 74         [ 4] 3133         CALL     HERE
      0091C0 CD 89 35         [ 4] 3134         CALL     PACKS   ;string to code dictionary
      0091C3 CD 88 5D         [ 4] 3135         CALL     COUNT
      0091C6 CD 84 74         [ 4] 3136         CALL     PLUS    ;calculate aligned end of string
      0091C9 CD 84 03         [ 4] 3137         CALL     CPP
      0091CC CC 82 1B         [ 2] 3138         JP     STORE
                                   3139 
                                   3140 ;; Structures
                                   3141 
                                   3142 ;       FOR     ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3143 ;       Start a FOR-NEXT loop
                                   3144 ;       structure in a colon definition.
      0091CF 91 B1                 3145         .word      LINK
                           001151  3146 LINK = . 
      0091D1 83                    3147 	.byte      IMEDD+3
      0091D2 46 4F 52              3148         .ascii     "FOR"
      0091D5                       3149 FOR:
      0091D5 CD 91 87         [ 4] 3150         CALL     COMPI
      0091D8 CD 82 A2         [ 4] 3151         CALL     TOR
      0091DB CC 88 74         [ 2] 3152         JP     HERE
                                   3153 
                                   3154 ;       NEXT    ( a -- )
                                   3155 ;       Terminate a FOR-NEXT loop.
      0091DE 91 D1                 3156         .word      LINK
                           001160  3157 LINK = . 
      0091E0 84                    3158 	.byte      IMEDD+4
      0091E1 4E 45 58 54           3159         .ascii     "NEXT"
      0091E5                       3160 NEXT:
      0091E5 CD 91 87         [ 4] 3161         CALL     COMPI
      0091E8 CD 81 BE         [ 4] 3162         CALL     DONXT
      0091EB CC 91 42         [ 2] 3163         JP     COMMA
                                   3164 
                                   3165 ;       BEGIN   ( -- a )
                                   3166 ;       Start an infinite or
                                   3167 ;       indefinite loop structure.
      0091EE 91 E0                 3168         .word      LINK
                           001170  3169 LINK = . 
      0091F0 85                    3170 	.byte      IMEDD+5
      0091F1 42 45 47 49 4E        3171         .ascii     "BEGIN"
      0091F6                       3172 BEGIN:
      0091F6 CC 88 74         [ 2] 3173         JP     HERE
                                   3174 
                                   3175 ;       UNTIL   ( a -- )
                                   3176 ;       Terminate a BEGIN-UNTIL
                                   3177 ;       indefinite loop structure.
      0091F9 91 F0                 3178         .word      LINK
                           00117B  3179 LINK = . 
      0091FB 85                    3180 	.byte      IMEDD+5
      0091FC 55 4E 54 49 4C        3181         .ascii     "UNTIL"
      009201                       3182 UNTIL:
      009201 CD 91 87         [ 4] 3183         CALL     COMPI
      009204 CD 81 DD         [ 4] 3184         CALL     QBRAN
      009207 CC 91 42         [ 2] 3185         JP     COMMA
                                   3186 
                                   3187 ;       AGAIN   ( a -- )
                                   3188 ;       Terminate a BEGIN-AGAIN
                                   3189 ;       infinite loop structure.
      00920A 91 FB                 3190         .word      LINK
                           00118C  3191 LINK = . 
      00920C 85                    3192 	.byte      IMEDD+5
      00920D 41 47 41 49 4E        3193         .ascii     "AGAIN"
      009212                       3194 AGAIN:
      009212 CD 91 87         [ 4] 3195         CALL     COMPI
      009215 CD 81 F4         [ 4] 3196         CALL     BRAN
      009218 CC 91 42         [ 2] 3197         JP     COMMA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   3198 
                                   3199 ;       IF      ( -- A )
                                   3200 ;       Begin a conditional branch.
      00921B 92 0C                 3201         .word      LINK
                           00119D  3202 LINK = . 
      00921D 82                    3203 	.byte      IMEDD+2
      00921E 49 46                 3204         .ascii     "IF"
      009220                       3205 IFF:
      009220 CD 91 87         [ 4] 3206         CALL     COMPI
      009223 CD 81 DD         [ 4] 3207         CALL     QBRAN
      009226 CD 88 74         [ 4] 3208         CALL     HERE
      009229 CD 87 87         [ 4] 3209         CALL     ZERO
      00922C CC 91 42         [ 2] 3210         JP     COMMA
                                   3211 
                                   3212 ;       THEN        ( A -- )
                                   3213 ;       Terminate a conditional branch structure.
      00922F 92 1D                 3214         .word      LINK
                           0011B1  3215 LINK = . 
      009231 84                    3216 	.byte      IMEDD+4
      009232 54 48 45 4E           3217         .ascii     "THEN"
      009236                       3218 THENN:
      009236 CD 88 74         [ 4] 3219         CALL     HERE
      009239 CD 82 E9         [ 4] 3220         CALL     SWAPP
      00923C CC 82 1B         [ 2] 3221         JP     STORE
                                   3222 
                                   3223 ;       ELSE        ( A -- A )
                                   3224 ;       Start the false clause in an IF-ELSE-THEN structure.
      00923F 92 31                 3225         .word      LINK
                           0011C1  3226 LINK = . 
      009241 84                    3227 	.byte      IMEDD+4
      009242 45 4C 53 45           3228         .ascii     "ELSE"
      009246                       3229 ELSEE:
      009246 CD 91 87         [ 4] 3230         CALL     COMPI
      009249 CD 81 F4         [ 4] 3231         CALL     BRAN
      00924C CD 88 74         [ 4] 3232         CALL     HERE
      00924F CD 87 87         [ 4] 3233         CALL     ZERO
      009252 CD 91 42         [ 4] 3234         CALL     COMMA
      009255 CD 82 E9         [ 4] 3235         CALL     SWAPP
      009258 CD 88 74         [ 4] 3236         CALL     HERE
      00925B CD 82 E9         [ 4] 3237         CALL     SWAPP
      00925E CC 82 1B         [ 2] 3238         JP     STORE
                                   3239 
                                   3240 ;       AHEAD       ( -- A )
                                   3241 ;       Compile a forward branch instruction.
      009261 92 41                 3242         .word      LINK
                           0011E3  3243 LINK = . 
      009263 85                    3244 	.byte      IMEDD+5
      009264 41 48 45 41 44        3245         .ascii     "AHEAD"
      009269                       3246 AHEAD:
      009269 CD 91 87         [ 4] 3247         CALL     COMPI
      00926C CD 81 F4         [ 4] 3248         CALL     BRAN
      00926F CD 88 74         [ 4] 3249         CALL     HERE
      009272 CD 87 87         [ 4] 3250         CALL     ZERO
      009275 CC 91 42         [ 2] 3251         JP     COMMA
                                   3252 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3253 ;       WHILE       ( a -- A a )
                                   3254 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      009278 92 63                 3255         .word      LINK
                           0011FA  3256 LINK = . 
      00927A 85                    3257 	.byte      IMEDD+5
      00927B 57 48 49 4C 45        3258         .ascii     "WHILE"
      009280                       3259 WHILE:
      009280 CD 91 87         [ 4] 3260         CALL     COMPI
      009283 CD 81 DD         [ 4] 3261         CALL     QBRAN
      009286 CD 88 74         [ 4] 3262         CALL     HERE
      009289 CD 87 87         [ 4] 3263         CALL     ZERO
      00928C CD 91 42         [ 4] 3264         CALL     COMMA
      00928F CC 82 E9         [ 2] 3265         JP     SWAPP
                                   3266 
                                   3267 ;       REPEAT      ( A a -- )
                                   3268 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      009292 92 7A                 3269         .word      LINK
                           001214  3270 LINK = . 
      009294 86                    3271         .byte      IMEDD+6
      009295 52 45 50 45 41 54     3272         .ascii     "REPEAT"
      00929B                       3273 REPEA:
      00929B CD 91 87         [ 4] 3274         CALL     COMPI
      00929E CD 81 F4         [ 4] 3275         CALL     BRAN
      0092A1 CD 91 42         [ 4] 3276         CALL     COMMA
      0092A4 CD 88 74         [ 4] 3277         CALL     HERE
      0092A7 CD 82 E9         [ 4] 3278         CALL     SWAPP
      0092AA CC 82 1B         [ 2] 3279         JP     STORE
                                   3280 
                                   3281 ;       AFT         ( a -- a A )
                                   3282 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      0092AD 92 94                 3283         .word      LINK
                           00122F  3284 LINK = . 
      0092AF 83                    3285 	.byte      IMEDD+3
      0092B0 41 46 54              3286         .ascii     "AFT"
      0092B3                       3287 AFT:
      0092B3 CD 82 CF         [ 4] 3288         CALL     DROP
      0092B6 CD 92 69         [ 4] 3289         CALL     AHEAD
      0092B9 CD 88 74         [ 4] 3290         CALL     HERE
      0092BC CC 82 E9         [ 2] 3291         JP     SWAPP
                                   3292 
                                   3293 ;       ABORT"      ( -- ; <string> )
                                   3294 ;       Conditional abort with an error message.
      0092BF 92 AF                 3295         .word      LINK
                           001241  3296 LINK = . 
      0092C1 86                    3297 	.byte      IMEDD+6
      0092C2 41 42 4F 52 54        3298         .ascii     "ABORT"
      0092C7 22                    3299         .byte      '"'
      0092C8                       3300 ABRTQ:
      0092C8 CD 91 87         [ 4] 3301         CALL     COMPI
      0092CB CD 90 08         [ 4] 3302         CALL     ABORQ
      0092CE CC 91 B5         [ 2] 3303         JP     STRCQ
                                   3304 
                                   3305 ;       $"     ( -- ; <string> )
                                   3306 ;       Compile an inline string literal.
      0092D1 92 C1                 3307         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                           001253  3308 LINK = . 
      0092D3 82                    3309 	.byte      IMEDD+2
      0092D4 24 22                 3310         .byte     '$','"'
      0092D6                       3311 STRQ:
      0092D6 CD 91 87         [ 4] 3312         CALL     COMPI
      0092D9 CD 8C 22         [ 4] 3313         CALL     STRQP
      0092DC CC 91 B5         [ 2] 3314         JP     STRCQ
                                   3315 
                                   3316 ;       ."          ( -- ; <string> )
                                   3317 ;       Compile an inline string literal to be typed out at run time.
      0092DF 92 D3                 3318         .word      LINK
                           001261  3319 LINK = . 
      0092E1 82                    3320 	.byte      IMEDD+2
      0092E2 2E 22                 3321         .byte     '.','"'
      0092E4                       3322 DOTQ:
      0092E4 CD 91 87         [ 4] 3323         CALL     COMPI
      0092E7 CD 8C 2C         [ 4] 3324         CALL     DOTQP
      0092EA CC 91 B5         [ 2] 3325         JP     STRCQ
                                   3326 
                                   3327 ;; Name compiler
                                   3328 
                                   3329 ;       ?UNIQUE ( a -- a )
                                   3330 ;       Display a warning message
                                   3331 ;       if word already exists.
      0092ED 92 E1                 3332         .word      LINK
                           00126F  3333 LINK = . 
      0092EF 07                    3334         .byte      7
      0092F0 3F 55 4E 49 51 55 45  3335         .ascii     "?UNIQUE"
      0092F7                       3336 UNIQU:
      0092F7 CD 82 D9         [ 4] 3337         CALL     DUPP
      0092FA CD 8E FC         [ 4] 3338         CALL     NAMEQ   ;?name exists
      0092FD CD 81 DD         [ 4] 3339         CALL     QBRAN
      009300 93 16                 3340         .word      UNIQ1
      009302 CD 8C 2C         [ 4] 3341         CALL     DOTQP   ;redef are OK
      009305 07                    3342         .byte       7
      009306 20 72 65 44 65 66 20  3343         .ascii     " reDef "       
      00930D CD 83 03         [ 4] 3344         CALL     OVER
      009310 CD 88 5D         [ 4] 3345         CALL     COUNT
      009313 CD 8B CF         [ 4] 3346         CALL     TYPES   ;just in case
      009316 CC 82 CF         [ 2] 3347 UNIQ1:  JP     DROP
                                   3348 
                                   3349 ;       $,n     ( na -- )
                                   3350 ;       Build a new dictionary name
                                   3351 ;       using string at na.
      009319 92 EF                 3352         .word      LINK
                           00129B  3353 LINK = . 
      00931B 03                    3354         .byte      3
      00931C 24 2C 6E              3355         .ascii     "$,n"
      00931F                       3356 SNAME:
      00931F CD 82 D9         [ 4] 3357         CALL     DUPP
      009322 CD 82 50         [ 4] 3358         CALL     CAT     ;?null input
      009325 CD 81 DD         [ 4] 3359         CALL     QBRAN
      009328 93 55                 3360         .word      PNAM1
      00932A CD 92 F7         [ 4] 3361         CALL     UNIQU   ;?redefinition
      00932D CD 82 D9         [ 4] 3362         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      009330 CD 88 5D         [ 4] 3363         CALL     COUNT
      009333 CD 84 74         [ 4] 3364         CALL     PLUS
      009336 CD 84 03         [ 4] 3365         CALL     CPP
      009339 CD 82 1B         [ 4] 3366         CALL     STORE
      00933C CD 82 D9         [ 4] 3367         CALL     DUPP
      00933F CD 84 13         [ 4] 3368         CALL     LAST
      009342 CD 82 1B         [ 4] 3369         CALL     STORE   ;save na for vocabulary link
      009345 CD 87 37         [ 4] 3370         CALL     CELLM   ;link address
      009348 CD 83 F5         [ 4] 3371         CALL     CNTXT
      00934B CD 82 32         [ 4] 3372         CALL     AT
      00934E CD 82 E9         [ 4] 3373         CALL     SWAPP
      009351 CD 82 1B         [ 4] 3374         CALL     STORE
      009354 81               [ 4] 3375         RET     ;save code pointer
      009355 CD 8C 22         [ 4] 3376 PNAM1:  CALL     STRQP
      009358 05                    3377         .byte      5
      009359 20 6E 61 6D 65        3378         .ascii     " name" ;null input
      00935E CC 90 10         [ 2] 3379         JP     ABOR1
                                   3380 
                                   3381 ;; FORTH compiler
                                   3382 
                                   3383 ;       $COMPILE        ( a -- )
                                   3384 ;       Compile next word to
                                   3385 ;       dictionary as a token or literal.
      009361 93 1B                 3386         .word      LINK
                           0012E3  3387 LINK = . 
      009363 08                    3388         .byte      8
      009364 24 43 4F 4D 50 49 4C  3389         .ascii     "$COMPILE"
             45
      00936C                       3390 SCOMP:
      00936C CD 8E FC         [ 4] 3391         CALL     NAMEQ
      00936F CD 84 23         [ 4] 3392         CALL     QDUP    ;?defined
      009372 CD 81 DD         [ 4] 3393         CALL     QBRAN
      009375 93 8D                 3394         .word      SCOM2
      009377 CD 82 32         [ 4] 3395         CALL     AT
      00937A CD 81 AA         [ 4] 3396         CALL     DOLIT
      00937D 80 00                 3397         .word     0x8000	;  IMEDD*256
      00937F CD 83 25         [ 4] 3398         CALL     ANDD    ;?immediate
      009382 CD 81 DD         [ 4] 3399         CALL     QBRAN
      009385 93 8A                 3400         .word      SCOM1
      009387 CC 82 04         [ 2] 3401         JP     EXECU
      00938A CC 93 D3         [ 2] 3402 SCOM1:  JP     JSRC
      00938D CD 8A 9A         [ 4] 3403 SCOM2:  CALL     NUMBQ   ;try to convert to number
      009390 CD 81 DD         [ 4] 3404         CALL     QBRAN
      009393 90 10                 3405         .word      ABOR1
      009395 CC 91 A6         [ 2] 3406         JP     LITER
                                   3407 
                                   3408 ;       OVERT   ( -- )
                                   3409 ;       Link a new word into vocabulary.
      009398 93 63                 3410         .word      LINK
                           00131A  3411 LINK = . 
      00939A 05                    3412         .byte      5
      00939B 4F 56 45 52 54        3413         .ascii     "OVERT"
      0093A0                       3414 OVERT:
      0093A0 CD 84 13         [ 4] 3415         CALL     LAST
      0093A3 CD 82 32         [ 4] 3416         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0093A6 CD 83 F5         [ 4] 3417         CALL     CNTXT
      0093A9 CC 82 1B         [ 2] 3418         JP     STORE
                                   3419 
                                   3420 ;       ;       ( -- )
                                   3421 ;       Terminate a colon definition.
      0093AC 93 9A                 3422         .word      LINK
                           00132E  3423 LINK = . 
      0093AE C1                    3424 	.byte      IMEDD+COMPO+1
      0093AF 3B                    3425         .ascii     ";"
      0093B0                       3426 SEMIS:
      0093B0 CD 91 87         [ 4] 3427         CALL     COMPI
      0093B3 CD 82 14         [ 4] 3428         CALL     EXIT
      0093B6 CD 90 71         [ 4] 3429         CALL     LBRAC
      0093B9 CC 93 A0         [ 2] 3430         JP     OVERT
                                   3431 
                                   3432 ;       ]       ( -- )
                                   3433 ;       Start compiling words in
                                   3434 ;       input stream.
      0093BC 93 AE                 3435         .word      LINK
                           00133E  3436 LINK = . 
      0093BE 01                    3437         .byte      1
      0093BF 5D                    3438         .ascii     "]"
      0093C0                       3439 RBRAC:
      0093C0 CD 81 AA         [ 4] 3440         CALL     DOLIT
      0093C3 93 6C                 3441         .word      SCOMP
      0093C5 CD 83 D3         [ 4] 3442         CALL     TEVAL
      0093C8 CC 82 1B         [ 2] 3443         JP     STORE
                                   3444 
                                   3445 ;       CALL,    ( ca -- )
                                   3446 ;       Compile a subroutine call.
      0093CB 93 BE                 3447         .word      LINK
                           00134D  3448 LINK = . 
      0093CD 04                    3449         .byte      4
      0093CE 43 41 4C 4C 2C        3450         .ascii     "CALL,"
      0093D3                       3451 JSRC:
      0093D3 CD 81 AA         [ 4] 3452         CALL     DOLIT
      0093D6 00 CD                 3453         .word     CALLL     ;CALL
      0093D8 CD 91 59         [ 4] 3454         CALL     CCOMMA
      0093DB CC 91 42         [ 2] 3455         JP     COMMA
                                   3456 
                                   3457 ;       :       ( -- ; <string> )
                                   3458 ;       Start a new colon definition
                                   3459 ;       using next word as its name.
      0093DE 93 CD                 3460         .word      LINK
                           001360  3461 LINK = . 
      0093E0 01                    3462         .byte      1
      0093E1 3A                    3463         .ascii     ":"
      0093E2                       3464 COLON:
      0093E2 CD 8D FF         [ 4] 3465         CALL     TOKEN
      0093E5 CD 93 1F         [ 4] 3466         CALL     SNAME
      0093E8 CC 93 C0         [ 2] 3467         JP     RBRAC
                                   3468 
                                   3469 ;       IMMEDIATE       ( -- )
                                   3470 ;       Make last compiled word
                                   3471 ;       an immediate word.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0093EB 93 E0                 3472         .word      LINK
                           00136D  3473 LINK = . 
      0093ED 09                    3474         .byte      9
      0093EE 49 4D 4D 45 44 49 41  3475         .ascii     "IMMEDIATE"
             54 45
      0093F7                       3476 IMMED:
      0093F7 CD 81 AA         [ 4] 3477         CALL     DOLIT
      0093FA 80 00                 3478         .word     0x8000	;  IMEDD*256
      0093FC CD 84 13         [ 4] 3479         CALL     LAST
      0093FF CD 82 32         [ 4] 3480         CALL     AT
      009402 CD 82 32         [ 4] 3481         CALL     AT
      009405 CD 83 39         [ 4] 3482         CALL     ORR
      009408 CD 84 13         [ 4] 3483         CALL     LAST
      00940B CD 82 32         [ 4] 3484         CALL     AT
      00940E CC 82 1B         [ 2] 3485         JP     STORE
                                   3486 
                                   3487 ;; Defining words
                                   3488 
                                   3489 ;       CREATE  ( -- ; <string> )
                                   3490 ;       Compile a new array
                                   3491 ;       without allocating space.
      009411 93 ED                 3492         .word      LINK
                           001393  3493 LINK = . 
      009413 06                    3494         .byte      6
      009414 43 52 45 41 54 45     3495         .ascii     "CREATE"
      00941A                       3496 CREAT:
      00941A CD 8D FF         [ 4] 3497         CALL     TOKEN
      00941D CD 93 1F         [ 4] 3498         CALL     SNAME
      009420 CD 93 A0         [ 4] 3499         CALL     OVERT
      009423 CD 91 87         [ 4] 3500         CALL     COMPI
      009426 CD 83 86         [ 4] 3501         CALL     DOVAR
      009429 81               [ 4] 3502         RET
                                   3503 
                                   3504 ;       VARIABLE        ( -- ; <string> )
                                   3505 ;       Compile a new variable
                                   3506 ;       initialized to 0.
      00942A 94 13                 3507         .word      LINK
                           0013AC  3508 LINK = . 
      00942C 08                    3509         .byte      8
      00942D 56 41 52 49 41 42 4C  3510         .ascii     "VARIABLE"
             45
      009435                       3511 VARIA:
      009435 CD 94 1A         [ 4] 3512         CALL     CREAT
      009438 CD 87 87         [ 4] 3513         CALL     ZERO
      00943B CC 91 42         [ 2] 3514         JP     COMMA
                                   3515 
                           000001  3516 .if PICATOUT_MOD
                                   3517 ;       CONSTANT  ( n -- ; <string> )
                                   3518 ;       Compile a new constant 
                                   3519 ;       n CONSTANT name 
      00943E 94 2C                 3520         .word LINK 
                           0013C0  3521         LINK=. 
      009440 08                    3522         .byte 8 
      009441 43 4F 4E 53 54 41 4E  3523         .ascii "CONSTANT" 
             54
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009449                       3524 constant:          
      009449 CD 8D FF         [ 4] 3525         CALL TOKEN
      00944C CD 93 1F         [ 4] 3526         CALL SNAME 
      00944F CD 93 A0         [ 4] 3527         CALL OVERT 
      009452 CD 91 87         [ 4] 3528         CALL COMPI 
      009455 CD 94 5F         [ 4] 3529         CALL DOCONST
      009458 CD 91 42         [ 4] 3530         CALL COMMA 
      00945B 81               [ 4] 3531         RET          
                                   3532 
                                   3533 ; CONSTANT runtime semantic 
                                   3534 ; doCONST  ( -- n )
      00945C 94 40                 3535         .word LINK 
                           0013DE  3536         LINK=.
      00945E 5F                    3537         .byte DOCONST
      00945F                       3538 DOCONST:
      00945F 1D 00 02         [ 2] 3539         subw x,#CELLL
      009462 90 85            [ 2] 3540         popw y 
      009464 90 FE            [ 2] 3541         ldw y,(y) 
      009466 FF               [ 2] 3542         ldw (x),y 
      009467 81               [ 4] 3543         ret 
                                   3544 .endif ;PICATOUT_MOD
                                   3545 
                                   3546 
                                   3547 ;; Tools
                                   3548 
                                   3549 ;       _TYPE   ( b u -- )
                                   3550 ;       Display a string. Filter
                                   3551 ;       non-printing characters.
      009468 94 5E                 3552         .word      LINK
                           0013EA  3553 LINK = . 
      00946A 05                    3554         .byte      5
      00946B 5F 54 59 50 45        3555         .ascii     "_TYPE"
      009470                       3556 UTYPE:
      009470 CD 82 A2         [ 4] 3557         CALL     TOR     ;start count down loop
      009473 20 0F            [ 2] 3558         JRA     UTYP2   ;skip first pass
      009475 CD 82 D9         [ 4] 3559 UTYP1:  CALL     DUPP
      009478 CD 82 50         [ 4] 3560         CALL     CAT
      00947B CD 87 B1         [ 4] 3561         CALL     TCHAR
      00947E CD 81 94         [ 4] 3562         CALL     EMIT    ;display only printable
      009481 CD 87 53         [ 4] 3563         CALL     ONEP    ;increment address
      009484 CD 81 BE         [ 4] 3564 UTYP2:  CALL     DONXT
      009487 94 75                 3565         .word      UTYP1   ;loop till done
      009489 CC 82 CF         [ 2] 3566         JP     DROP
                                   3567 
                                   3568 ;       dm+     ( a u -- a )
                                   3569 ;       Dump u bytes from ,
                                   3570 ;       leaving a+u on  stack.
      00948C 94 6A                 3571         .word      LINK
                           00140E  3572 LINK = . 
      00948E 03                    3573         .byte      3
      00948F 64 6D 2B              3574         .ascii     "dm+"
      009492                       3575 DUMPP:
      009492 CD 83 03         [ 4] 3576         CALL     OVER
      009495 CD 81 AA         [ 4] 3577         CALL     DOLIT
      009498 00 04                 3578         .word      4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00949A CD 8C 55         [ 4] 3579         CALL     UDOTR   ;display address
      00949D CD 8B A5         [ 4] 3580         CALL     SPACE
      0094A0 CD 82 A2         [ 4] 3581         CALL     TOR     ;start count down loop
      0094A3 20 11            [ 2] 3582         JRA     PDUM2   ;skip first pass
      0094A5 CD 82 D9         [ 4] 3583 PDUM1:  CALL     DUPP
      0094A8 CD 82 50         [ 4] 3584         CALL     CAT
      0094AB CD 81 AA         [ 4] 3585         CALL     DOLIT
      0094AE 00 03                 3586         .word      3
      0094B0 CD 8C 55         [ 4] 3587         CALL     UDOTR   ;display numeric data
      0094B3 CD 87 53         [ 4] 3588         CALL     ONEP    ;increment address
      0094B6 CD 81 BE         [ 4] 3589 PDUM2:  CALL     DONXT
      0094B9 94 A5                 3590         .word      PDUM1   ;loop till done
      0094BB 81               [ 4] 3591         RET
                                   3592 
                                   3593 ;       DUMP    ( a u -- )
                                   3594 ;       Dump u bytes from a,
                                   3595 ;       in a formatted manner.
      0094BC 94 8E                 3596         .word      LINK
                           00143E  3597 LINK = . 
      0094BE 04                    3598         .byte      4
      0094BF 44 55 4D 50           3599         .ascii     "DUMP"
      0094C3                       3600 DUMP:
      0094C3 CD 83 94         [ 4] 3601         CALL     BASE
      0094C6 CD 82 32         [ 4] 3602         CALL     AT
      0094C9 CD 82 A2         [ 4] 3603         CALL     TOR
      0094CC CD 8A 2D         [ 4] 3604         CALL     HEX     ;save radix, set hex
      0094CF CD 81 AA         [ 4] 3605         CALL     DOLIT
      0094D2 00 10                 3606         .word      16
      0094D4 CD 86 79         [ 4] 3607         CALL     SLASH   ;change count to lines
      0094D7 CD 82 A2         [ 4] 3608         CALL     TOR     ;start count down loop
      0094DA CD 8B ED         [ 4] 3609 DUMP1:  CALL     CR
      0094DD CD 81 AA         [ 4] 3610         CALL     DOLIT
      0094E0 00 10                 3611         .word      16
      0094E2 CD 84 5F         [ 4] 3612         CALL     DDUP
      0094E5 CD 94 92         [ 4] 3613         CALL     DUMPP   ;display numeric
      0094E8 CD 84 34         [ 4] 3614         CALL     ROT
      0094EB CD 84 34         [ 4] 3615         CALL     ROT
      0094EE CD 8B A5         [ 4] 3616         CALL     SPACE
      0094F1 CD 8B A5         [ 4] 3617         CALL     SPACE
      0094F4 CD 94 70         [ 4] 3618         CALL     UTYPE   ;display printable characters
      0094F7 CD 81 BE         [ 4] 3619         CALL     DONXT
      0094FA 94 DA                 3620         .word      DUMP1   ;loop till done
      0094FC CD 82 CF         [ 4] 3621 DUMP3:  CALL     DROP
      0094FF CD 82 83         [ 4] 3622         CALL     RFROM
      009502 CD 83 94         [ 4] 3623         CALL     BASE
      009505 CC 82 1B         [ 2] 3624         JP     STORE   ;restore radix
                                   3625 
                                   3626 ;       .S      ( ... -- ... )
                                   3627 ;        Display  contents of stack.
      009508 94 BE                 3628         .word      LINK
                           00148A  3629 LINK = . 
      00950A 02                    3630         .byte      2
      00950B 2E 53                 3631         .ascii     ".S"
      00950D                       3632 DOTS:
      00950D CD 8B ED         [ 4] 3633         CALL     CR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009510 CD 87 CA         [ 4] 3634         CALL     DEPTH   ;stack depth
      009513 CD 82 A2         [ 4] 3635         CALL     TOR     ;start count down loop
      009516 20 0C            [ 2] 3636         JRA     DOTS2   ;skip first pass
      009518 CD 82 96         [ 4] 3637 DOTS1:  CALL     RAT
      00951B CD 87 53         [ 4] 3638         CALL ONEP
      00951E CD 87 E1         [ 4] 3639 	CALL     PICK
      009521 CD 8C 88         [ 4] 3640         CALL     DOT     ;index stack, display contents
      009524 CD 81 BE         [ 4] 3641 DOTS2:  CALL     DONXT
      009527 95 18                 3642         .word      DOTS1   ;loop till done
      009529 CD 8C 2C         [ 4] 3643         CALL     DOTQP
      00952C 05                    3644         .byte      5
      00952D 20 3C 73 70 20        3645         .ascii     " <sp "
      009532 81               [ 4] 3646         RET
                                   3647 
                                   3648 ;       >NAME   ( ca -- na | F )
                                   3649 ;       Convert code address
                                   3650 ;       to a name address.
      009533 95 0A                 3651         .word      LINK
                           0014B5  3652 LINK = . 
      009535 05                    3653         .byte      5
      009536 3E 4E 41 4D 45        3654         .ascii     ">NAME"
      00953B                       3655 TNAME:
      00953B CD 83 F5         [ 4] 3656         CALL     CNTXT   ;vocabulary link
      00953E CD 82 32         [ 4] 3657 TNAM2:  CALL     AT
      009541 CD 82 D9         [ 4] 3658         CALL     DUPP    ;?last word in a vocabulary
      009544 CD 81 DD         [ 4] 3659         CALL     QBRAN
      009547 95 62                 3660         .word      TNAM4
      009549 CD 84 5F         [ 4] 3661         CALL     DDUP
      00954C CD 8E 0D         [ 4] 3662         CALL     NAMET
      00954F CD 83 4E         [ 4] 3663         CALL     XORR    ;compare
      009552 CD 81 DD         [ 4] 3664         CALL     QBRAN
      009555 95 5C                 3665         .word      TNAM3
      009557 CD 87 37         [ 4] 3666         CALL     CELLM   ;continue with next word
      00955A 20 E2            [ 2] 3667         JRA     TNAM2
      00955C CD 82 E9         [ 4] 3668 TNAM3:  CALL     SWAPP
      00955F CC 82 CF         [ 2] 3669         JP     DROP
      009562 CD 84 54         [ 4] 3670 TNAM4:  CALL     DDROP
      009565 CC 87 87         [ 2] 3671         JP     ZERO
                                   3672 
                                   3673 ;       .ID     ( na -- )
                                   3674 ;        Display  name at address.
      009568 95 35                 3675         .word      LINK
                           0014EA  3676 LINK = . 
      00956A 03                    3677         .byte      3
      00956B 2E 49 44              3678         .ascii     ".ID"
      00956E                       3679 DOTID:
      00956E CD 84 23         [ 4] 3680         CALL     QDUP    ;if zero no name
      009571 CD 81 DD         [ 4] 3681         CALL     QBRAN
      009574 95 84                 3682         .word      DOTI1
      009576 CD 88 5D         [ 4] 3683         CALL     COUNT
      009579 CD 81 AA         [ 4] 3684         CALL     DOLIT
      00957C 00 1F                 3685         .word      0x1F
      00957E CD 83 25         [ 4] 3686         CALL     ANDD    ;mask lexicon bits
      009581 CC 94 70         [ 2] 3687         JP     UTYPE
      009584 CD 8C 2C         [ 4] 3688 DOTI1:  CALL     DOTQP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      009587 09                    3689         .byte      9
      009588 20 6E 6F 4E 61 6D 65  3690         .ascii     " noName"
      00958F 81               [ 4] 3691         RET
                                   3692 
                           000000  3693 WANT_SEE=0 
                           000000  3694 .if WANT_SEE 
                                   3695 ;       SEE     ( -- ; <string> )
                                   3696 ;       A simple decompiler.
                                   3697 ;       Updated for byte machines.
                                   3698         .word      LINK
                                   3699 LINK = . 
                                   3700         .byte      3
                                   3701         .ascii     "SEE"
                                   3702 SEE:
                                   3703         CALL     TICK    ;starting address
                                   3704         CALL     CR
                                   3705         CALL     ONEM
                                   3706 SEE1:   CALL     ONEP
                                   3707         CALL     DUPP
                                   3708         CALL     AT
                                   3709         CALL     DUPP    ;?does it contain a zero
                                   3710         CALL     QBRAN
                                   3711         .word    SEE2
                                   3712         CALL     TNAME   ;?is it a name
                                   3713 SEE2:   CALL     QDUP    ;name address or zero
                                   3714         CALL     QBRAN
                                   3715         .word    SEE3
                                   3716         CALL     SPACE
                                   3717         CALL     DOTID   ;display name
                                   3718         CALL     ONEP
                                   3719         JRA      SEE4
                                   3720 SEE3:   CALL     DUPP
                                   3721         CALL     CAT
                                   3722         CALL     UDOT    ;display number
                                   3723 SEE4:   CALL     NUFQ    ;user control
                                   3724         CALL     QBRAN
                                   3725         .word    SEE1
                                   3726         JP     DROP
                                   3727 .endif ; WANT_SEE 
                                   3728 
                                   3729 ;       WORDS   ( -- )
                                   3730 ;       Display names in vocabulary.
      009590 95 6A                 3731         .word      LINK
                           001512  3732 LINK = . 
      009592 05                    3733         .byte      5
      009593 57 4F 52 44 53        3734         .ascii     "WORDS"
      009598                       3735 WORDS:
      009598 CD 8B ED         [ 4] 3736         CALL     CR
      00959B CD 83 F5         [ 4] 3737         CALL     CNTXT   ;only in context
      00959E CD 82 32         [ 4] 3738 WORS1:  CALL     AT
      0095A1 CD 84 23         [ 4] 3739         CALL     QDUP    ;?at end of list
      0095A4 CD 81 DD         [ 4] 3740         CALL     QBRAN
      0095A7 95 BD                 3741         .word      WORS2
      0095A9 CD 82 D9         [ 4] 3742         CALL     DUPP
      0095AC CD 8B A5         [ 4] 3743         CALL     SPACE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0095AF CD 95 6E         [ 4] 3744         CALL     DOTID   ;display a name
      0095B2 CD 87 37         [ 4] 3745         CALL     CELLM
      0095B5 CD 81 F4         [ 4] 3746         CALL     BRAN
      0095B8 95 9E                 3747         .word      WORS1
      0095BA CD 82 CF         [ 4] 3748         CALL     DROP
      0095BD 81               [ 4] 3749 WORS2:  RET
                                   3750 
                                   3751         
                                   3752 ;; Hardware reset
                                   3753 
                                   3754 ;       hi      ( -- )
                                   3755 ;       Display sign-on message.
      0095BE 95 92                 3756         .word      LINK
                           001540  3757 LINK = . 
      0095C0 02                    3758         .byte      2
      0095C1 68 69                 3759         .ascii     "hi"
      0095C3                       3760 HI:
      0095C3 CD 8B ED         [ 4] 3761         CALL     CR
      0095C6 CD 8C 2C         [ 4] 3762         CALL     DOTQP   ;initialize I/O
      0095C9 0F                    3763         .byte      15
      0095CA 73 74 6D 38 65 46 6F  3764         .ascii     "stm8eForth v"
             72 74 68 20 76
      0095D6 32                    3765 	.byte      VER+'0'
      0095D7 2E                    3766         .byte      '.' 
      0095D8 31                    3767 	.byte      EXT+'0' ;version
      0095D9 CC 8B ED         [ 2] 3768         JP     CR
                                   3769 
                           000000  3770 WANT_DEBUG=0
                           000000  3771 .if WANT_DEBUG 
                                   3772 ;       DEBUG      ( -- )
                                   3773 ;       Display sign-on message.
                                   3774 ;        .word      LINK
                                   3775 LINK = . 
                                   3776         .byte      5
                                   3777         .ascii     "DEBUG"
                                   3778 DEBUG:
                                   3779 	CALL DOLIT
                                   3780 	.word 0x65
                                   3781 	CALL EMIT
                                   3782 	CALL DOLIT
                                   3783 	.word 0
                                   3784  	CALL ZLESS 
                                   3785 	CALL DOLIT
                                   3786 	.word 0xFFFE
                                   3787 	CALL ZLESS 
                                   3788 	CALL UPLUS 
                                   3789  	CALL DROP 
                                   3790 	CALL DOLIT
                                   3791 	.word 3
                                   3792 	CALL UPLUS 
                                   3793 	CALL UPLUS 
                                   3794  	CALL DROP
                                   3795 	CALL DOLIT
                                   3796 	.word 0x43
                                   3797 	CALL UPLUS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3798  	CALL DROP
                                   3799 	CALL EMIT
                                   3800 	CALL DOLIT
                                   3801 	.word 0x4F
                                   3802 	CALL DOLIT
                                   3803 	.word 0x6F
                                   3804  	CALL XORR
                                   3805 	CALL DOLIT
                                   3806 	.word 0xF0
                                   3807  	CALL ANDD
                                   3808 	CALL DOLIT
                                   3809 	.word 0x4F
                                   3810  	CALL ORR
                                   3811 	CALL EMIT
                                   3812 	CALL DOLIT
                                   3813 	.word 8
                                   3814 	CALL DOLIT
                                   3815 	.word 6
                                   3816  	CALL SWAPP
                                   3817 	CALL OVER
                                   3818 	CALL XORR
                                   3819 	CALL DOLIT
                                   3820 	.word 3
                                   3821 	CALL ANDD 
                                   3822 	CALL ANDD
                                   3823 	CALL DOLIT
                                   3824 	.word 0x70
                                   3825 	CALL UPLUS 
                                   3826 	CALL DROP
                                   3827 	CALL EMIT
                                   3828 	CALL DOLIT
                                   3829 	.word 0
                                   3830 	CALL QBRAN
                                   3831 	.word DEBUG1
                                   3832 	CALL DOLIT
                                   3833 	.word 0x3F
                                   3834 DEBUG1:
                                   3835 	CALL DOLIT
                                   3836 	.word 0xFFFF
                                   3837 	CALL QBRAN
                                   3838 	.word DEBUG2
                                   3839 	CALL DOLIT
                                   3840 	.word 0x74
                                   3841 	CALL BRAN
                                   3842 	.word DEBUG3
                                   3843 DEBUG2:
                                   3844 	CALL DOLIT
                                   3845 	.word 0x21
                                   3846 DEBUG3:
                                   3847 	CALL EMIT
                                   3848 	CALL DOLIT
                                   3849 	.word 0x68
                                   3850 	CALL DOLIT
                                   3851 	.word 0x80
                                   3852 	CALL STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3853 	CALL DOLIT
                                   3854 	.word 0x80
                                   3855 	CALL AT
                                   3856 	CALL EMIT
                                   3857 	CALL DOLIT
                                   3858 	.word 0x4D
                                   3859 	CALL TOR
                                   3860 	CALL RAT
                                   3861 	CALL RFROM
                                   3862 	CALL ANDD
                                   3863 	CALL EMIT
                                   3864 	CALL DOLIT
                                   3865 	.word 0x61
                                   3866 	CALL DOLIT
                                   3867 	.word 0xA
                                   3868 	CALL TOR
                                   3869 DEBUG4:
                                   3870 	CALL DOLIT
                                   3871 	.word 1
                                   3872 	CALL UPLUS 
                                   3873 	CALL DROP
                                   3874 	CALL DONXT
                                   3875 	.word DEBUG4
                                   3876 	CALL EMIT
                                   3877 	CALL DOLIT
                                   3878 	.word 0x656D
                                   3879 	CALL DOLIT
                                   3880 	.word 0x100
                                   3881 	CALL UMSTA
                                   3882 	CALL SWAPP
                                   3883 	CALL DOLIT
                                   3884 	.word 0x100
                                   3885 	CALL UMSTA
                                   3886 	CALL SWAPP 
                                   3887 	CALL DROP
                                   3888 	CALL EMIT
                                   3889 	CALL EMIT
                                   3890 	CALL DOLIT
                                   3891 	.word 0x2043
                                   3892 	CALL DOLIT
                                   3893 	.word 0
                                   3894 	CALL DOLIT
                                   3895 	.word 0x100
                                   3896 	CALL UMMOD
                                   3897 	CALL EMIT
                                   3898 	CALL EMIT
                                   3899 	;JP ORIG
                                   3900 	RET
                                   3901 .endif ; WANT_DEBUG 
                                   3902 
                                   3903 
                                   3904 ;       'BOOT   ( -- a )
                                   3905 ;       The application startup vector.
      0095DC 95 C0                 3906         .word      LINK
                           00155E  3907 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      0095DE 05                    3908         .byte      5
      0095DF 27 42 4F 4F 54        3909         .ascii     "'BOOT"
      0095E4                       3910 TBOOT:
      0095E4 CD 83 86         [ 4] 3911         CALL     DOVAR
      0095E7 95 C3                 3912         .word      HI       ;application to boot
                                   3913 
                                   3914 ;       COLD    ( -- )
                                   3915 ;       The hilevel cold start s=ence.
      0095E9 95 DE                 3916         .word      LINK
                           00156B  3917 LINK = . 
      0095EB 04                    3918         .byte      4
      0095EC 43 4F 4C 44           3919         .ascii     "COLD"
      0095F0                       3920 COLD:
                           000000  3921 .if WANT_DEBUG
                                   3922         CALL DEBUG
                                   3923 .endif 
      0095F0 CD 81 AA         [ 4] 3924 COLD1:  CALL     DOLIT
      0095F3 80 A7                 3925         .word      UZERO
      0095F5 CD 81 AA         [ 4] 3926 	CALL     DOLIT
      0095F8 00 06                 3927         .word      UPP
      0095FA CD 81 AA         [ 4] 3928         CALL     DOLIT
      0095FD 00 14                 3929 	.word      UEND-UZERO
      0095FF CD 88 C1         [ 4] 3930         CALL     CMOVE   ;initialize user area
                                   3931 
                           000001  3932 .if  PICATOUT_MOD
                                   3933 ; update LAST with APP_LAST 
                                   3934 ; if APP_LAST > LAST else do the opposite
      009602 90 CE 40 00      [ 2] 3935         ldw y,APP_LAST 
      009606 90 B3 18         [ 2] 3936         cpw y,ULAST 
      009609 22 0E            [ 1] 3937         jrugt 1$ 
                                   3938 ; save LAST at APP_LAST  
      00960B CD 84 13         [ 4] 3939         call LAST 
      00960E CD 82 32         [ 4] 3940         call AT  
      009611 CD 96 6F         [ 4] 3941         call eeprom 
      009614 CD 97 AC         [ 4] 3942         call ee_store 
      009617 20 03            [ 2] 3943         jra 2$
      009619                       3944 1$: ; update LAST with APP_LAST 
      009619 90 BF 18         [ 2] 3945         ldw ULAST,y
      00961C                       3946 2$:  
                                   3947 ; update APP_HERE if < app_space 
      00961C 90 CE 40 04      [ 2] 3948         ldw y,APP_HERE 
      009620 90 A3 99 00      [ 2] 3949         cpw y,#app_space 
      009624 24 15            [ 1] 3950         jruge 3$ 
      009626 1D 00 06         [ 2] 3951         subw x,#6 
      009629 90 AE 99 00      [ 2] 3952         ldw y,#app_space 
      00962D EF 04            [ 2] 3953         ldw (4,x),y 
      00962F 90 AE 40 04      [ 2] 3954         ldw y,#APP_HERE 
      009633 EF 02            [ 2] 3955         ldw (2,x),y
      009635 90 5F            [ 1] 3956         clrw y 
      009637 FF               [ 2] 3957         ldw (x),y
      009638 CD 97 AC         [ 4] 3958         call ee_store 
      00963B                       3959 3$:
                                   3960 .endif ; PICATOUT_MOD
      00963B CD 90 F0         [ 4] 3961         CALL     PRESE   ;initialize data stack and TIB
      00963E CD 95 E4         [ 4] 3962         CALL     TBOOT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009641 CD 88 AA         [ 4] 3963         CALL     ATEXE   ;application boot
      009644 CD 93 A0         [ 4] 3964         CALL     OVERT
      009647 CC 91 0D         [ 2] 3965         JP     QUIT    ;start interpretation
                                   3966 
                           000001  3967 .if PICATOUT_MOD
                                   3968         ; keep this include at end 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                   3969         .include "flash.asm"
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
      00964A 95 EB                   34     .word LINK 
                           0015CC    35     LINK=.
      00964C 03                      36     .byte 3 
      00964D 46 50 21                37     .ascii "FP!"
      009650                         38 fptr_store:
      009650 90 93            [ 1]   39     ldw y,x
      009652 90 FE            [ 2]   40     ldw y,(y)
      009654 90 9F            [ 1]   41     ld a,yl 
      009656 B7 02            [ 1]   42     ld farptr,a 
      009658 1C 00 02         [ 2]   43     addw x,#CELLL 
      00965B 90 93            [ 1]   44     ldw y,x 
      00965D 90 FE            [ 2]   45     ldw y,(y)
      00965F 90 BF 03         [ 2]   46     ldw ptr16,y
      009662 1C 00 02         [ 2]   47     addw x,#CELLL 
      009665 81               [ 4]   48     ret 
                                     49 
                                     50 ;-----------------------------------
                                     51 ; return EEPROM base address 
                                     52 ; as a double 
                                     53 ;  EEPROM  ( -- ud )
                                     54 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009666 96 4C                   55     .word LINK 
                           0015E8    56 LINK=.
      009668 06                      57     .byte 6 
      009669 45 45 50 52 4F 4D       58     .ascii "EEPROM"
      00966F                         59 eeprom: 
      00966F 90 AE 40 00      [ 2]   60     ldw y,#EEPROM_BASE
      009673 1D 00 04         [ 2]   61     subw x,#2*CELLL 
      009676 EF 02            [ 2]   62     ldw (2,x),y 
      009678 90 5F            [ 1]   63     clrw y 
      00967A FF               [ 2]   64     ldw (x),y 
      00967B 81               [ 4]   65     ret
                                     66 
                                     67 ;----------------------------------
                                     68 ; fetch integer at address over 65535
                                     69 ;  F@   ( ud -- n )
                                     70 ;----------------------------------
      00967C 96 68                   71     .word LINK 
                           0015FE    72 LINK=.
      00967E 02                      73     .byte 2
      00967F 46 40                   74     .ascii "F@"
      009681                         75 farat:
      009681 CD 96 50         [ 4]   76     call fptr_store
      009684 92 BC 00 02      [ 5]   77     ldf a,[farptr]
      009688 1D 00 02         [ 2]   78     subw x,#CELLL 
      00968B F7               [ 1]   79     ld (x),a 
      00968C 90 AE 00 01      [ 2]   80     ldw y,#1
      009690 91 AF 00 02      [ 1]   81     ldf a,([farptr],y)
      009694 E7 01            [ 1]   82     ld (1,x),a
      009696 81               [ 4]   83     ret 
                                     84 
                                     85 ;-------------------------------------
                                     86 ; fetch C at address over 65535 
                                     87 ; FC@ ( ud -- c)
                                     88 ;-------------------------------------
      009697 96 7E                   89     .word LINK
                           001619    90     LINK=.
      009699 03                      91     .byte 3 
      00969A 46 43 40                92     .ascii "FC@" 
      00969D                         93 farcat:
      00969D CD 96 50         [ 4]   94     call fptr_store 
      0096A0 92 BC 00 02      [ 5]   95     ldf a,[farptr]
      0096A4 1D 00 02         [ 2]   96     subw x,#CELLL 
      0096A7 E7 01            [ 1]   97     ld (1,x),a 
      0096A9 7F               [ 1]   98     clr (x)
      0096AA 81               [ 4]   99     ret 
                                    100     
                                    101 ;----------------------------------
                                    102 ; unlock EEPROM/OPT for writing/erasing
                                    103 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    104 ;  UNLKEE   ( -- )
                                    105 ;----------------------------------
      0096AB 96 99                  106     .word LINK 
                           00162D   107 LINK=.
      0096AD 06                     108     .byte 6 
      0096AE 55 4E 4C 4B 45 45      109     .ascii "UNLKEE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0096B4                        110 unlock_eeprom:
      0096B4 35 00 50 5B      [ 1]  111 	mov FLASH_CR2,#0 
      0096B8 35 FF 50 5C      [ 1]  112 	mov FLASH_NCR2,#0xFF 
      0096BC 35 AE 50 64      [ 1]  113 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      0096C0 35 56 50 64      [ 1]  114     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      0096C4 72 07 50 5F FB   [ 2]  115 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      0096C9 81               [ 4]  116 	ret
                                    117 
                                    118 ;----------------------------------
                                    119 ; unlock FLASH for writing/erasing
                                    120 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    121 ; UNLKFL  ( -- )
                                    122 ;----------------------------------
      0096CA 96 AD                  123     .word LINK 
                           00164C   124 LINK=. 
      0096CC 06                     125     .byte 6 
      0096CD 55 4E 4C 4B 46 4C      126     .ascii "UNLKFL"    
      0096D3                        127 unlock_flash:
      0096D3 35 00 50 5B      [ 1]  128 	mov FLASH_CR2,#0 
      0096D7 35 FF 50 5C      [ 1]  129 	mov FLASH_NCR2,#0xFF 
      0096DB 35 56 50 62      [ 1]  130 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      0096DF 35 AE 50 62      [ 1]  131 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      0096E3 72 03 50 5F FB   [ 2]  132 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      0096E8 81               [ 4]  133 	ret
                                    134 
                                    135 ;-----------------------------
                                    136 ; unlock FLASH or EEPROM 
                                    137 ; according to farptr address 
                                    138 ;  UNLOCK ( -- )
                                    139 ;-----------------------------
      0096E9 96 CC                  140 	.word LINK 
                           00166B   141 	LINK=.
      0096EB 06                     142 	.byte 6
      0096EC 55 4E 4C 4F 43 4B      143 	.ascii "UNLOCK"
      0096F2                        144 unlock:
                                    145 ; put addr[15:0] in Y, for bounds check.
      0096F2 90 BE 03         [ 2]  146 	ldw y,ptr16   ; Y=addr15:0
                                    147 ; check addr[23:16], if <> 0 then it is extened flash memory
      0096F5 3D 02            [ 1]  148 	tnz farptr 
      0096F7 26 16            [ 1]  149 	jrne 4$
      0096F9 90 A3 99 00      [ 2]  150     cpw y,#app_space
      0096FD 24 10            [ 1]  151     jruge 4$
      0096FF 90 A3 40 00      [ 2]  152 	cpw y,#EEPROM_BASE  
      009703 25 0D            [ 1]  153     jrult 9$
      009705 90 A3 48 7F      [ 2]  154 	cpw y,#OPTION_END 
      009709 22 07            [ 1]  155 	jrugt 9$
      00970B CD 96 B4         [ 4]  156 	call unlock_eeprom
      00970E 81               [ 4]  157 	ret 
      00970F CD 96 D3         [ 4]  158 4$: call unlock_flash
      009712 81               [ 4]  159 9$: ret 
                                    160 
                                    161 ;-------------------------
                                    162 ; lock write access to 
                                    163 ; FLASH and EEPROM 
                                    164 ; LOCK ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                    165 ;-------------------------
      009713 96 EB                  166 	.word LINK 
                           001695   167 	LINK=.
      009715 04                     168 	.byte 4 
      009716 4C 4F 43 4B            169 	.ascii "LOCK" 
      00971A                        170 lock: 
      00971A 72 13 50 5F      [ 1]  171 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00971E 72 17 50 5F      [ 1]  172 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009722 81               [ 4]  173 	ret 
                                    174 
                                    175 ;-------------------------
                                    176 ; increment farptr 
                                    177 ; INC-FPTR ( -- )
                                    178 ;-------------------------
      009723 97 15                  179 	.word LINK 
                           0016A5   180 	LINK=. 
      009725 08                     181 	.byte 8 
      009726 49 4E 43 2D 46 50 54   182 	.ascii "INC-FPTR" 
             52
      00972E                        183 inc_fptr:
      00972E 3C 04            [ 1]  184 	inc ptr8 
      009730 26 08            [ 1]  185 	jrne 1$
      009732 90 BE 02         [ 2]  186 	ldw y,farptr 
      009735 90 5C            [ 2]  187 	incw y 
      009737 90 BF 02         [ 2]  188 	ldw farptr,y 
      00973A 81               [ 4]  189 1$: ret 
                                    190 
                                    191 
                                    192 ;----------------------------
                                    193 ; write a byte at address pointed 
                                    194 ; by farptr and increment farptr.
                                    195 ; Expect pointer already initialized 
                                    196 ; and memory unlocked 
                                    197 ; WR-BYTE ( c -- )
                                    198 ;----------------------------
                                    199 
      00973B 97 25                  200 	.word LINK 
                           0016BD   201 	LINK=. 
      00973D 07                     202 	.byte 7 
      00973E 57 52 2D 42 59 54 45   203 	.ascii "WR-BYTE" 
                                    204 
      009745                        205 write_byte:
      009745 90 93            [ 1]  206 	ldw y,x 
      009747 90 FE            [ 2]  207 	ldw y,(y)
      009749 1C 00 02         [ 2]  208 	addw x,#CELLL 
      00974C 90 9F            [ 1]  209 	ld a,yl
      00974E 92 BD 00 02      [ 4]  210 	ldf [farptr],a
      009752 72 05 50 5F FB   [ 2]  211 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009757 20 D5            [ 2]  212 	jra inc_fptr 
                                    213 
                                    214 
                                    215 
                                    216 ;---------------------------------------
                                    217 ; write a byte to FLASH or EEPROM/OPTION  
                                    218 ; EEC!  (c ud -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                    219 ;---------------------------------------
      009759 97 3D                  220     .word LINK 
                           0016DB   221 	LINK=.
      00975B 04                     222     .byte 4 
      00975C 45 45 43 21            223     .ascii "EEC!"
                                    224 	; local variables 
                           000001   225 	BTW = 1   ; byte to write offset on stack
                           000002   226     OPT = 2 
                           000002   227 	VSIZE = 2
      009760                        228 ee_cstore:
      009760 52 02            [ 2]  229 	sub sp,#VSIZE
      009762 CD 96 50         [ 4]  230     call fptr_store
      009765 E6 01            [ 1]  231 	ld a,(1,x)
      009767 43               [ 1]  232 	cpl a 
      009768 6B 01            [ 1]  233 	ld (BTW,sp),a ; byte to write 
      00976A 0F 02            [ 1]  234 	clr (OPT,sp)  ; OPTION flag
      00976C CD 96 F2         [ 4]  235 	call unlock 
                                    236 	; check if option
      00976F 3D 02            [ 1]  237 	tnz farptr 
      009771 26 19            [ 1]  238 	jrne 2$
      009773 90 BE 03         [ 2]  239 	ldw y,ptr16 
      009776 90 A3 48 00      [ 2]  240 	cpw y,#OPTION_BASE
      00977A 2B 10            [ 1]  241 	jrmi 2$
      00977C 90 A3 48 80      [ 2]  242 	cpw y,#OPTION_END+1
      009780 2A 0A            [ 1]  243 	jrpl 2$
      009782 03 02            [ 1]  244 	cpl (OPT,sp)
                                    245 	; OPTION WRITE require this unlock 
      009784 72 1E 50 5B      [ 1]  246     bset FLASH_CR2,#FLASH_CR2_OPT
      009788 72 1F 50 5C      [ 1]  247     bres FLASH_NCR2,#FLASH_CR2_OPT 
      00978C                        248 2$: 
      00978C CD 97 45         [ 4]  249 	call write_byte 	
      00978F 0D 02            [ 1]  250 	tnz (OPT,sp)
      009791 27 0D            [ 1]  251 	jreq 3$ 
      009793 7B 01            [ 1]  252     ld a,(BTW,sp)
      009795 90 5F            [ 1]  253     clrw y
      009797 90 97            [ 1]  254 	ld yl,a 
      009799 1D 00 02         [ 2]  255 	subw x,#CELLL 
      00979C FF               [ 2]  256 	ldw (x),y 
      00979D CD 97 45         [ 4]  257 	call write_byte
      0097A0                        258 3$: 
      0097A0 CD 97 1A         [ 4]  259 	call lock 
      0097A3 5B 02            [ 2]  260 	addw sp,#VSIZE 
      0097A5 81               [ 4]  261     ret
                                    262 
                                    263 ;------------------------------
                                    264 ; write integer in FLASH|EEPROM
                                    265 ; EE! ( n ud -- )
                                    266 ;------------------------------
      0097A6 97 5B                  267 	.word LINK 
                           001728   268 	LINK=.
      0097A8 03                     269 	.byte 3 
      0097A9 45 45 21               270 	.ascii "EE!"
      0097AC                        271 ee_store:
      0097AC CD 96 50         [ 4]  272 	call fptr_store 
      0097AF CD 96 F2         [ 4]  273 	call unlock 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0097B2 90 93            [ 1]  274 	ldw y,x 
      0097B4 90 FE            [ 2]  275 	ldw y,(y)
      0097B6 90 89            [ 2]  276 	pushw y 
      0097B8 90 5E            [ 1]  277 	swapw y 
      0097BA FF               [ 2]  278 	ldw (x),y 
      0097BB CD 97 45         [ 4]  279 	call write_byte 
      0097BE 90 85            [ 2]  280 	popw y 
      0097C0 1D 00 02         [ 2]  281 	subw x,#CELLL
      0097C3 FF               [ 2]  282 	ldw (x),y 
      0097C4 CD 97 45         [ 4]  283 	call write_byte
      0097C7 72 13 50 5F      [ 1]  284 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0097CB 81               [ 4]  285 	ret 
                                    286 
                                    287 ;----------------------------
                                    288 ; Erase flash memory row 
                                    289 ; stm8s208 as 128 bytes rows
                                    290 ; ROW-ERASE ( ud -- )
                                    291 ;----------------------------
      0097CC 97 A8                  292 	.word LINK 
                           00174E   293 	LINK=. 
      0097CE 09                     294 	.byte 9 
      0097CF 52 4F 57 2D 45 52 41   295 	.ascii "ROW-ERASE" 
             53 45
      0097D8                        296 row_erase:
      0097D8 CD 96 50         [ 4]  297 	call fptr_store
                                    298 ;code must be execute from RAM 
                                    299 ;copy routine to PAD 
      0097DB 1D 00 02         [ 2]  300 	subw x,#CELLL 
      0097DE 90 AE 98 25      [ 2]  301 	ldw y,#row_erase_proc
      0097E2 FF               [ 2]  302 	ldw (x),y 
      0097E3 CD 88 85         [ 4]  303 	call PAD 
      0097E6 90 AE 98 4C      [ 2]  304 	ldw y,#row_erase_proc_end 
      0097EA 72 A2 98 25      [ 2]  305 	subw y,#row_erase_proc
      0097EE 1D 00 02         [ 2]  306 	subw x,#CELLL 
      0097F1 FF               [ 2]  307 	ldw (x),y 
      0097F2 CD 88 C1         [ 4]  308 	call CMOVE 
      0097F5                        309 block_erase:
      0097F5 90 BE 03         [ 2]  310 	ldw y,farptr+1
      0097F8 90 A3 99 00      [ 2]  311 	cpw y,#app_space 
      0097FC 2A 13            [ 1]  312 	jrpl erase_flash 
                                    313 ; erase eeprom block
      0097FE 90 A3 40 00      [ 2]  314 	cpw y,#EEPROM_BASE 
      009802 24 01            [ 1]  315 	jruge 1$
      009804 81               [ 4]  316 	ret ; bad address 
      009805 90 A3 47 FF      [ 2]  317 1$: cpw y,#EEPROM_END 
      009809 23 01            [ 2]  318 	jrule 2$ 
      00980B 81               [ 4]  319 	ret ; bad address 
      00980C                        320 2$:	
      00980C CD 96 B4         [ 4]  321 	call unlock_eeprom 
      00980F 20 03            [ 2]  322 	jra proceed_erase
                                    323 ; erase flash block:
      009811                        324 erase_flash:
      009811 CD 96 D3         [ 4]  325 	call unlock_flash 
      009814                        326 proceed_erase:
      009814 CD 88 85         [ 4]  327 	call PAD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      009817 90 93            [ 1]  328 	ldw y,x
      009819 90 FE            [ 2]  329 	ldw y,(y)
      00981B 1C 00 02         [ 2]  330 	addw x,#CELLL  
      00981E 90 FD            [ 4]  331 	call (y) 
      009820 72 17 50 5F      [ 1]  332 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009824 81               [ 4]  333 	ret 
                                    334 
                                    335 ; this routine is to be copied to PAD 
      009825                        336 row_erase_proc:
      009825 35 20 50 5B      [ 1]  337 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009829 35 DF 50 5C      [ 1]  338 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      00982D 4F               [ 1]  339 	clr a 
      00982E 90 5F            [ 1]  340 	clrw y 
      009830 91 A7 00 02      [ 1]  341 	ldf ([farptr],y),a
      009834 90 5C            [ 2]  342     incw y
      009836 91 A7 00 02      [ 1]  343 	ldf ([farptr],y),a
      00983A 90 5C            [ 2]  344     incw y
      00983C 91 A7 00 02      [ 1]  345 	ldf ([farptr],y),a
      009840 90 5C            [ 2]  346     incw y
      009842 91 A7 00 02      [ 1]  347 	ldf ([farptr],y),a
      009846 72 05 50 5F FB   [ 2]  348 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00984B 81               [ 4]  349 	ret
      00984C                        350 row_erase_proc_end:
                                    351 
                                    352 
                                    353 ;-----------------------------------
                                    354 ; block programming must be 
                                    355 ; executed from RAM 
                                    356 ; initial contidions: 
                                    357 ; 		memory unlocked
                                    358 ;       farptr initialized 
                                    359 ; input: 
                                    360 ;    x   buffer address 
                                    361 ;-----------------------------------
                           000001   362 	BCNT=1 
      00984C                        363 copy_buffer:
      00984C 4B 80            [ 1]  364 	push #BLOCK_SIZE  
                                    365 ;enable block programming 
      00984E 72 10 50 5B      [ 1]  366 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009852 72 11 50 5C      [ 1]  367 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009856 90 5F            [ 1]  368 	clrw y
      009858 F6               [ 1]  369 1$:	ld a,(x)
      009859 91 A7 00 02      [ 1]  370 	ldf ([farptr],y),a
      00985D 5C               [ 2]  371 	incw x 
      00985E 90 5C            [ 2]  372 	incw y 
      009860 0A 01            [ 1]  373 	dec (BCNT,sp)
      009862 26 F4            [ 1]  374 	jrne 1$
                                    375 ; wait EOP bit 
      009864 72 05 50 5F FB   [ 2]  376 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009869 84               [ 1]  377 	pop a ; remove BCNT from stack 
      00986A 81               [ 4]  378 	ret 
      00986B                        379 copy_buffer_end:
                                    380 
                                    381 ;-------------------------
                                    382 ; move program_row to RAM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                    383 ; in TIB 
                                    384 ;------------------------
      00986B                        385 copy_prog_to_ram:
      00986B 1D 00 06         [ 2]  386 	subw x,#6
      00986E 90 AE 98 4C      [ 2]  387 	ldw y,#copy_buffer 
      009872 EF 04            [ 2]  388 	ldw (4,x),y 
      009874 90 AE 17 00      [ 2]  389 	ldw y,#TIBBASE
      009878 EF 02            [ 2]  390 	ldw (2,x),y 
      00987A 90 AE 98 6B      [ 2]  391 	ldw y,#copy_buffer_end 
      00987E 72 A2 98 4C      [ 2]  392 	subw y,#copy_buffer  
      009882 FF               [ 2]  393 	ldw (x),y 
      009883 CD 88 C1         [ 4]  394 	call CMOVE 
      009886 81               [ 4]  395 	ret 
                                    396 
                                    397 
                                    398 ;-----------------------------
                                    399 ; write a row in FLASH/EEPROM 
                                    400 ; WR-ROW ( a ud -- )
                                    401 ; a -> address 128 byte buffer to write 
                                    402 ; ud ->  row address in FLASH|EEPROM 
                                    403 ;-----------------------------
      009887 97 CE                  404 	.word LINK 
                           001809   405 	LINK=.
      009889 06                     406 	.byte 6 
      00988A 57 52 2D 52 4F 57      407 	.ascii "WR-ROW"
      009890                        408 write_row:
      009890 CD 96 50         [ 4]  409 	call fptr_store 
      009893 CD 98 6B         [ 4]  410 	call copy_prog_to_ram
      009896 CD 96 F2         [ 4]  411 	call unlock
      009899 90 93            [ 1]  412 	ldw y,x 
      00989B 90 FE            [ 2]  413 	ldw y,(y)
      00989D 1C 00 02         [ 2]  414 	addw x,#CELLL 
      0098A0 89               [ 2]  415 	pushw x 
      0098A1 93               [ 1]  416 	ldw x,y ; buffer address in x 
      0098A2 CD 17 00         [ 4]  417 	call TIBBASE
      0098A5 CD 97 1A         [ 4]  418 	call lock
      0098A8 85               [ 2]  419 	popw x 
      0098A9 81               [ 4]  420 	ret 
                                    421 
                           000000   422 .if 0
                                    423 ;----------------------------
                                    424 ; transfert one or more définition 
                                    425 ; from RAM to FLASH 
                                    426 ; USAGE: FLASH name 
                                    427 ; 'name' and all following are 
                                    428 ; transfered to FLASH memory 
                                    429 ; FLASH ( -- ; <string> )
                                    430 ;-----------------------------------
                                    431 	.word LINK 
                                    432 	LINK=. 
                                    433 	.byte 5 
                                    434 	.ascii "FLASH"
                                    435 flash_colon: 
                                    436     call TOKEN 
                                    437 	call SNAME 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                    438 	call DROP	
                                    439 .endif 
                                    440 
                                    441 
                                    442 
                                    443 
                                    444 ; application code begin here
      009900                        445 	.bndry 128 ; align on flash block  
      009900                        446 app_space: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   3970 .endif ; PICATOUT_MOD
                                   3971 
                                   3972 ;===============================================================
                                   3973 
                           001809  3974 LASTN =	LINK   ;last name defined
                                   3975 
                                   3976 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000475 R   |   6 ABOR1      000F90 R
  6 ABOR2      000FA7 R   |   6 ABORQ      000F88 R   |   6 ABORT      000F79 R
  6 ABRTQ      001248 R   |   6 ABSS       00046C R   |   6 ACCEP      000F0F R
  6 ACCP1      000F18 R   |   6 ACCP2      000F3E R   |   6 ACCP3      000F41 R
  6 ACCP4      000F43 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
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
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |   6 AFT        001233 R
  6 AGAIN      001192 R   |   6 AHEAD      0011E9 R   |   6 ALLOT      0010B8 R
  6 ANDD       0002A5 R   |     APP_HERE=  004004     |     APP_LAST=  004000 
    APP_RUN =  004002     |   6 AT         0001B2 R   |   6 ATEXE      00082A R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 BACK1      000EB7 R   |   6 BASE       000314 R   |     BASEE   =  00000A 
    BCNT    =  000001     |   6 BCOMP      0010F7 R   |   6 BDIGS      000912 R
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |   6 BEGIN      001176 R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |   6 BKSLA      000D4F R   |   6 BKSP       000E87 R
    BKSPP   =  000008     |   6 BLANK      0006FA R   |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |   6 BRAN       000174 R
    BTW     =  000001     |     CALLL   =  0000CD     |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  000020 
  6 CAT        0001D0 R   |   6 CCOMMA     0010D9 R   |     CC_C    =  000000 
    CC_H    =  000004     |     CC_I0   =  000003     |     CC_I1   =  000005 
    CC_N    =  000002     |     CC_V    =  000007     |     CC_Z    =  000001 
    CELLL   =  000002     |   6 CELLM      0006B7 R   |   6 CELLP      0006A8 R
  6 CELLS      0006C6 R   |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   6 CHAR1      000B3F R   |   6 CHAR2      000B42 R
    CLKOPT  =  004807     |     CLKOPT_C=  000002     |     CLKOPT_E=  000003 
    CLKOPT_P=  000000     |     CLKOPT_P=  000001     |     CLK_CCOR=  0050C9 
    CLK_CKDI=  0050C6     |     CLK_CKDI=  000000     |     CLK_CKDI=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]

Symbol Table

    CLK_CKDI=  000002     |     CLK_CKDI=  000003     |     CLK_CKDI=  000004 
    CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1 
    CLK_ECKR=  000000     |     CLK_ECKR=  000001     |     CLK_HSIT=  0050CC 
    CLK_ICKR=  0050C0     |     CLK_ICKR=  000002     |     CLK_ICKR=  000000 
    CLK_ICKR=  000001     |     CLK_ICKR=  000003     |     CLK_ICKR=  000004 
    CLK_ICKR=  000005     |     CLK_PCKE=  0050C7     |     CLK_PCKE=  000000 
    CLK_PCKE=  000001     |     CLK_PCKE=  000007     |     CLK_PCKE=  000005 
    CLK_PCKE=  000006     |     CLK_PCKE=  000004     |     CLK_PCKE=  000002 
    CLK_PCKE=  000003     |     CLK_PCKE=  0050CA     |     CLK_PCKE=  000003 
    CLK_PCKE=  000002     |     CLK_PCKE=  000007     |     CLK_SWCR=  0050C5 
    CLK_SWCR=  000000     |     CLK_SWCR=  000001     |     CLK_SWCR=  000002 
    CLK_SWCR=  000003     |     CLK_SWIM=  0050CD     |     CLK_SWR =  0050C4 
    CLK_SWR_=  0000B4     |     CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2 
  6 CMOV1      000849 R   |   6 CMOV2      000861 R   |   6 CMOVE      000841 R
    CNTDWN  =  000028     |   6 CNTXT      000375 R   |   6 COLD       001570 R
  6 COLD1      001570 R   |   6 COLON      001362 R   |   6 COMMA      0010C2 R
  6 COMPI      001107 R   |     COMPO   =  000040     |     CONVERT_=  000001 
  6 COUNT      0007DD R   |   6 CPP        000383 R   |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |   6 CR         000B6D R   |   6 CREAT      00139A R
    CRR     =  00000D     |   6 CSTOR      0001BF R   |     CTOP    =  000080 
  6 DAT        0007BD R   |     DATSTK  =  0016F0     |   6 DDROP      0003D4 R
  6 DDUP       0003DF R   |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  6 DECIM      0009C2 R   |   6 DEPTH      00074A R   |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   6 DGTQ1      000A07 R   |   6 DIG        00093B R
  6 DIGIT      0008D6 R   |   6 DIGS       00094C R   |   6 DIGS1      00094C R
  6 DIGS2      000959 R   |   6 DIGTQ      0009D6 R   |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   6 DN1        00044C R   |   6 DNEGA      000431 R
  6 DOCONST    0013DF R   |   6 DOLIT      00012A R   |   6 DONXT      00013E R
  6 DOSTR      000B83 R   |   6 DOT        000C08 R   |   6 DOT1       000C1E R
  6 DOTI1      001504 R   |   6 DOTID      0014EE R   |   6 DOTO1      00101C R
  6 DOTOK      001002 R   |   6 DOTPR      000D31 R   |   6 DOTQ       001264 R
  6 DOTQP      000BAC R   |   6 DOTR       000BBA R   |   6 DOTS       00148D R
  6 DOTS1      001498 R   |   6 DOTS2      0014A4 R   |   6 DOVAR      000306 R
  6 DROP       00024F R   |   6 DSTOR      000797 R   |   6 DUMP       001443 R
  6 DUMP1      00145A R   |   6 DUMP3      00147C R   |   6 DUMPP      001412 R
  6 DUPP       000259 R   |   6 EDIGS      000977 R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_S=  000800     |   6 ELSEE      0011C6 R
  6 EMIT       000114 R   |   6 EQ1        000490 R   |   6 EQUAL      00047A R
  6 ERASE      0008A3 R   |     ERR     =  00001B     |   6 EVAL       001045 R
  6 EVAL1      001045 R   |   6 EVAL2      001061 R   |   6 EXE1       000838 R
  6 EXECU      000184 R   |   6 EXIT       000194 R   |     EXT     =  000001 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |   6 EXTRC      0008FE R
    FHSE    =  7A1200     |     FHSI    =  F42400     |   6 FILL       000870 R
  6 FILL1      00088D R   |   6 FILL2      000896 R   |   6 FIND       000DE3 R
  6 FIND1      000E01 R   |   6 FIND2      000E2F R   |   6 FIND3      000E3B R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]

Symbol Table

  6 FIND4      000E4F R   |   6 FIND5      000E5C R   |   6 FIND6      000E40 R
    FLASH_BA=  008000     |     FLASH_CR=  00505A     |     FLASH_CR=  000002 
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
    FLSI    =  01F400     |   6 FOR        001155 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  6 HERE       0007F4 R   |   6 HEX        0009AD R   |   6 HI         001543 R
  6 HLD        000362 R   |   6 HOLD       000922 R   |     HSECNT  =  004809 
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
  6 IFF        0011A0 R   |     IMEDD   =  000080     |   6 IMMED      001377 R
  6 INCH       000108 R   |   6 INN        000332 R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
  6 INTE1      000FE4 R   |   6 INTER      000FBA R   |     INT_ADC2=  000016 
    INT_AUAR=  000012     |     INT_AWU =  000001     |     INT_CAN_=  000008 
    INT_CAN_=  000009     |     INT_CLK =  000002     |     INT_EXTI=  000003 
    INT_EXTI=  000004     |     INT_EXTI=  000005     |     INT_EXTI=  000006 
    INT_EXTI=  000007     |     INT_FLAS=  000018     |     INT_I2C =  000013 
    INT_SPI =  00000A     |     INT_TIM1=  00000C     |     INT_TIM1=  00000B 
    INT_TIM2=  00000E     |     INT_TIM2=  00000D     |     INT_TIM3=  000010 
    INT_TIM3=  00000F     |     INT_TIM4=  000017     |     INT_TLI =  000000 
    INT_UART=  000011     |     INT_UART=  000015     |     INT_UART=  000014 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]

Symbol Table

    INT_VECT=  008060     |     INT_VECT=  00800C     |     INT_VECT=  008028 
    INT_VECT=  00802C     |     INT_VECT=  008010     |     INT_VECT=  008014 
    INT_VECT=  008018     |     INT_VECT=  00801C     |     INT_VECT=  008020 
    INT_VECT=  008024     |     INT_VECT=  008068     |     INT_VECT=  008054 
    INT_VECT=  008000     |     INT_VECT=  008030     |     INT_VECT=  008038 
    INT_VECT=  008034     |     INT_VECT=  008040     |     INT_VECT=  00803C 
    INT_VECT=  008048     |     INT_VECT=  008044     |     INT_VECT=  008064 
    INT_VECT=  008008     |     INT_VECT=  008004     |     INT_VECT=  008050 
    INT_VECT=  00804C     |     INT_VECT=  00805C     |     INT_VECT=  008058 
  6 INVER      00040E R   |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  6 JSRC       001353 R   |   6 KEY        000AED R   |   6 KTAP       000ED4 R
  6 KTAP1      000EF7 R   |   6 KTAP2      000EFA R   |   6 LAST       000393 R
  6 LASTN   =  001809 R   |   6 LBRAC      000FF1 R   |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |   6 LESS       0004B7 R
    LF      =  00000A     |   6 LINK    =  001809 R   |   6 LITER      001126 R
  6 LT1        0004CD R   |     MASKK   =  001F7F     |   6 MAX        0004D7 R
  6 MAX1       0004EA R   |   6 MIN        0004F4 R   |   6 MIN1       000507 R
  6 MMOD1      0005AA R   |   6 MMOD2      0005BE R   |   6 MMOD3      0005D5 R
  6 MMSM1      000551 R   |   6 MMSM2      000565 R   |   6 MMSM3      000567 R
  6 MMSM4      00056F R   |   6 MODD       0005EF R   |   6 MONE       000720 R
    MS      =  000026     |   6 MSEC       0000A1 R   |   6 MSMOD      00058D R
  6 MSTA1      000680 R   |   6 MSTAR      00065D R   |     NAFR    =  004804 
  6 NAMEQ      000E7C R   |   6 NAMET      000D8D R   |     NCLKOPT =  004808 
  6 NEGAT      00041F R   |   6 NEX1       00014B R   |   6 NEXT       001165 R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   6 NTIB       000342 R   |     NUBC    =  004802 
  6 NUFQ       000B03 R   |   6 NUFQ1      000B1C R   |   6 NUMBQ      000A1A R
  6 NUMQ1      000A4E R   |   6 NUMQ2      000A7F R   |   6 NUMQ3      000AC1 R
  6 NUMQ4      000AC6 R   |   6 NUMQ5      000AD5 R   |   6 NUMQ6      000AD8 R
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R
  6 ONE        000712 R   |   6 ONEM       0006E0 R   |   6 ONEP       0006D3 R
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   6 ORIG       00003D R   |   6 ORR        0002B9 R
  6 OUTPUT     000119 R   |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |   6 OVER       000283 R
  6 OVERT      001320 R   |     PA      =  000000     |   6 PACKS      0008B5 R
  6 PAD        000805 R   |   6 PAREN      000D40 R   |   6 PARS       000C39 R
  6 PARS1      000C64 R   |   6 PARS2      000C8F R   |   6 PARS3      000C92 R
  6 PARS4      000C9B R   |   6 PARS5      000CBE R   |   6 PARS6      000CD3 R
  6 PARS7      000CE2 R   |   6 PARS8      000CF1 R   |   6 PARSE      000D02 R
  6 PAUSE      0000B1 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]

Symbol Table

    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      001425 R   |   6 PDUM2      001436 R
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PICATOUT=  000001 
  6 PICK       000761 R   |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   6 PLUS       0003F4 R   |   6 PNAM1      0012D5 R
  6 PRESE      001070 R   |     PROD1   =  00001A     |     PROD2   =  00001C 
    PROD3   =  00001E     |   6 PSTOR      000776 R   |   6 QBRAN      00015D R
  6 QDUP       0003A3 R   |   6 QDUP1      0003AD R   |   6 QKEY       0000F6 R
  6 QSTAC      001028 R   |   6 QUERY      000F54 R   |   6 QUEST      000C2B R
  6 QUIT       00108D R   |   6 QUIT1      001095 R   |   6 QUIT2      001098 R
    RAMBASE =  000000     |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   6 RAT        000216 R   |   6 RBRAC      001340 R
  6 REPEA      00121B R   |   6 RFROM      000203 R   |     ROP     =  004800 
  6 ROT        0003B4 R   |     RP0     =  000024     |   6 RPAT       0001E0 R
    RPP     =  0017FF     |   6 RPSTO      0001ED R   |     RST_SR  =  0050B3 
  6 SAME1      000DAB R   |   6 SAME2      000DD4 R   |   6 SAMEQ      000DA3 R
  6 SCOM1      00130A R   |   6 SCOM2      00130D R   |   6 SCOMP      0012EC R
  6 SEMIS      001330 R   |     SFR_BASE=  005000     |     SFR_END =  0057FF 
  6 SIGN       000961 R   |   6 SIGN1      000971 R   |   6 SLASH      0005F9 R
  6 SLMOD      0005DD R   |   6 SNAME      00129F R   |     SP0     =  000022 
  6 SPACE      000B25 R   |   6 SPACS      000B34 R   |   6 SPAT       000239 R
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SPP     =  0016F0 
  6 SPSTO      000246 R   |   6 SSMOD      000689 R   |     STACK   =  0017FF 
  6 STAR       000652 R   |   6 STASL      00069A R   |   6 STORE      00019B R
  6 STR        00098F R   |   6 STRCQ      001135 R   |   6 STRQ       001256 R
  6 STRQP      000BA2 R   |   6 SUBB       000452 R   |   6 SWAPP      000269 R
    SWIM_CSR=  007F80     |   6 TAP        000EBE R   |   6 TBOOT      001564 R
  6 TCHA1      000741 R   |   6 TCHAR      000731 R   |   6 TEMP       000323 R
  6 TEVAL      000353 R   |   6 THENN      0011B6 R   |   6 TIB        000816 R
    TIBB    =  001700     |     TIBBASE =  001700     |     TIC     =  000027 
  6 TICK       0010A4 R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM3_CR1=  000002     |     TIM3_EGR=  005324     |     TIM3_IER=  005321 
    TIM3_PSC=  00532A     |     TIM3_SR1=  005322     |     TIM3_SR2=  005323 
    TIM4_ARR=  005346     |     TIM4_CNT=  005344     |     TIM4_CR1=  005340 
    TIM4_CR1=  000007     |     TIM4_CR1=  000000     |     TIM4_CR1=  000003 
    TIM4_CR1=  000001     |     TIM4_CR1=  000002     |     TIM4_EGR=  005343 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_EGR=  000000     |     TIM4_IER=  005341     |     TIM4_IER=  000000 
    TIM4_PSC=  005345     |     TIM4_PSC=  000000     |     TIM4_PSC=  000007 
    TIM4_PSC=  000004     |     TIM4_PSC=  000001     |     TIM4_PSC=  000005 
    TIM4_PSC=  000002     |     TIM4_PSC=  000006     |     TIM4_PSC=  000003 
    TIM4_PSC=  000000     |     TIM4_PSC=  000001     |     TIM4_PSC=  000002 
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   6 TIMEOUTQ   0000E1 R
  6 TIMER      0000CB R   |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
    TIM_CR1_=  000006     |     TIM_CR1_=  000005     |     TIM_CR1_=  000004 
    TIM_CR1_=  000003     |     TIM_CR1_=  000001     |     TIM_CR1_=  000002 
  6 TNAM2      0014BE R   |   6 TNAM3      0014DC R   |   6 TNAM4      0014E2 R
  6 TNAME      0014BB R   |   6 TOKEN      000D7F R   |   6 TOR        000222 R
    TRUEE   =  00FFFF     |   6 TWOSL      0006ED R   |   6 TYPE1      000B54 R
  6 TYPE2      000B60 R   |   6 TYPES      000B4F R   |   6 Timer4Ha   000005 R
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
    UART_SR_=  000007     |     UBASE   =  000006     |     UBC     =  004801 
    UCNTXT  =  000014     |     UCP     =  000016     |     UCTIB   =  00000C 
    UD1     =  000001     |     UD2     =  000002     |     UD3     =  000003 
    UD4     =  000004     |   6 UDOT       000BF5 R   |   6 UDOTR      000BD5 R
  6 UEND       00003B R   |     UHLD    =  000012     |     UINN    =  00000A 
    UINTER  =  000010     |     ULAST   =  000018     |   6 ULES1      0004AF R
  6 ULESS      000499 R   |   6 UMMOD      00052F R   |   6 UMSTA      000608 R
  6 UNIQ1      001296 R   |   6 UNIQU      001277 R   |   6 UNTIL      001181 R
  6 UPL1       0002FA R   |   6 UPLUS      0002E3 R   |     UPP     =  000006 
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    UTIB    =  00000E     |     UTMP    =  000008     |   6 UTYP1      0013F5 R
  6 UTYP2      001404 R   |   6 UTYPE      0013F0 R   |   6 UZERO      000027 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]

Symbol Table

  6 VARIA      0013B5 R   |     VER     =  000002     |     VSIZE   =  000002 
    WANT_DEB=  000000     |     WANT_SEE=  000000     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |   6 WHILE      001200 R   |   6 WITHI      000514 R
  6 WORDD      000D6B R   |   6 WORDS      001518 R   |   6 WORS1      00151E R
  6 WORS2      00153D R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
  6 XORR       0002CE R   |     XTEMP   =  00001A     |     YTEMP   =  00001C 
  6 ZERO       000707 R   |   6 ZL1        00029B R   |   6 ZLESS      000292 R
  6 app_spac   001880 R   |   6 block_er   001775 R   |   6 clear_ra   000019 R
  6 clock_in   000058 R   |   6 constant   0013C9 R   |   6 copy_buf   0017CC R
  6 copy_buf   0017EB R   |   6 copy_pro   0017EB R   |     da      =  000002 
    db      =  000003     |     dc      =  000000     |     dd      =  000001 
  6 ee_cstor   0016E0 R   |   6 ee_store   00172C R   |   6 eeprom     0015EF R
  6 erase_fl   001791 R   |   6 farat      001601 R   |   6 farcat     00161D R
    farptr  =  000002     |   6 fptr_sto   0015D0 R   |   6 inc_fptr   0016AE R
  6 lock       00169A R   |   6 main       000016 R   |   6 proceed_   001794 R
    ptr16   =  000003     |     ptr8    =  000004     |   6 row_eras   001758 R
  6 row_eras   0017A5 R   |   6 row_eras   0017CC R   |   6 uart1_in   00006A R
  6 unlock     001672 R   |   6 unlock_e   001634 R   |   6 unlock_f   001653 R
  6 write_by   0016C5 R   |   6 write_ro   001810 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   1880   flags    0

