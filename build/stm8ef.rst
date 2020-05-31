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
                           004004   156 APP_HERE = APP_RUN+2   ; free application space pointer 
                           004006   157 VAR_HERE = APP_HERE+2  ; free data space pointer 
                                    158 .endif ; PICATOUT_MOD
                                    159 
                                    160 
                                    161         .macro _ledon
                                    162         bset PC_ODR,#LED2_BIT
                                    163         .endm
                                    164 
                                    165         .macro _ledoff
                                    166         bres PC_ODR,#LED2_BIT
                                    167         .endm
                                    168 
                                    169 ;**********************************************************
                                    170         .area DATA (ABS)
      000000                        171         .org RAMBASE 
                                    172 ;**********************************************************
                                    173 
                                    174 ;**********************************************************
                                    175         .area SSEG (ABS) ; STACK
      001700                        176         .org 0x1700
      001700                        177         .ds 256 
                                    178 ; space for DATSTK,TIB and STACK         
                                    179 ;**********************************************************
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    180 
                                    181 ;**********************************************************
                                    182         .area HOME ; vectors table
                                    183 ;**********************************************************
      008000 82 00 80 96            184 	int main	        ; reset
      008004 82 00 80 80            185 	int NonHandledInterrupt	; trap
      008008 82 00 80 80            186 	int NonHandledInterrupt	; irq0
      00800C 82 00 80 80            187 	int NonHandledInterrupt	; irq1
      008010 82 00 80 80            188 	int NonHandledInterrupt	; irq2
      008014 82 00 80 80            189 	int NonHandledInterrupt	; irq3
      008018 82 00 80 80            190 	int NonHandledInterrupt	; irq4
      00801C 82 00 80 80            191 	int NonHandledInterrupt	; irq5
      008020 82 00 80 80            192 	int NonHandledInterrupt	; irq6
      008024 82 00 80 80            193 	int NonHandledInterrupt	; irq7
      008028 82 00 80 80            194 	int NonHandledInterrupt	; irq8
      00802C 82 00 80 80            195 	int NonHandledInterrupt	; irq9
      008030 82 00 80 80            196 	int NonHandledInterrupt	; irq10
      008034 82 00 80 80            197 	int NonHandledInterrupt	; irq11
      008038 82 00 80 80            198 	int NonHandledInterrupt	; irq12
      00803C 82 00 80 80            199 	int NonHandledInterrupt	; irq13
      008040 82 00 80 80            200 	int NonHandledInterrupt	; irq14
      008044 82 00 80 80            201 	int NonHandledInterrupt	; irq15
      008048 82 00 80 80            202 	int NonHandledInterrupt	; irq16
      00804C 82 00 80 80            203 	int NonHandledInterrupt	; irq17
      008050 82 00 80 80            204 	int NonHandledInterrupt	; irq18
      008054 82 00 80 80            205 	int NonHandledInterrupt	; irq19
      008058 82 00 80 80            206 	int NonHandledInterrupt	; irq20
      00805C 82 00 80 80            207 	int NonHandledInterrupt	; irq21
      008060 82 00 80 80            208 	int NonHandledInterrupt	; irq22
      008064 82 00 80 85            209 	int Timer4Handler	; irq23
      008068 82 00 80 80            210 	int NonHandledInterrupt	; irq24
      00806C 82 00 80 80            211 	int NonHandledInterrupt	; irq25
      008070 82 00 80 80            212 	int NonHandledInterrupt	; irq26
      008074 82 00 80 80            213 	int NonHandledInterrupt	; irq27
      008078 82 00 80 80            214 	int NonHandledInterrupt	; irq28
      00807C 82 00 80 80            215 	int NonHandledInterrupt	; irq29
                                    216 
                                    217 ;**********************************************************
                                    218         .area CODE
                                    219 ;**********************************************************
                                    220 
                                    221 ; non handled interrupt reset MCU
      008080                        222 NonHandledInterrupt:
      008080 A6 80            [ 1]  223         ld a, #0x80
      008082 C7 50 D1         [ 1]  224         ld WWDG_CR,a ; WWDG_CR used to reset mcu
                                    225 	;iret
                                    226 
                                    227 ; used for milliseconds counter 
                                    228 ; MS is 16 bits counter 
      008085                        229 Timer4Handler:
      008085 72 5F 53 42      [ 1]  230 	clr TIM4_SR 
      008089 BE 26            [ 2]  231         ldw x,MS 
      00808B 5C               [ 2]  232         incw x 
      00808C BF 26            [ 2]  233         ldw MS,x
      00808E BE 28            [ 2]  234         ldw x,CNTDWN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      008090 27 03            [ 1]  235         jreq 1$
      008092 5A               [ 2]  236         decw x 
      008093 BF 28            [ 2]  237         ldw CNTDWN,x 
      008095                        238 1$:         
      008095 80               [11]  239         iret 
                                    240 
                                    241 
                                    242 ;; Main entry points and COLD start data
      008096                        243 main:
                                    244 ; clear all RAM
      008096 AE 00 00         [ 2]  245 	ldw X,#RAMBASE
      008099                        246 clear_ram0:
      008099 7F               [ 1]  247 	clr (X)
      00809A 5C               [ 2]  248 	incw X
      00809B A3 17 FF         [ 2]  249 	cpw X,#RAM_END
      00809E 23 F9            [ 2]  250 	jrule clear_ram0
      0080A0 AE 17 FF         [ 2]  251         ldw x,#RPP
      0080A3 94               [ 1]  252         ldw sp,x 
      0080A4 CC 80 BD         [ 2]  253 	jp ORIG
                                    254 
                                    255 ; COLD initialize these variables.
      0080A7                        256 UZERO:
      0080A7 00 0A                  257         .word      BASEE   ;BASE
      0080A9 00 00                  258         .word      0       ;tmp
      0080AB 00 00                  259         .word      0       ;>IN
      0080AD 00 00                  260         .word      0       ;#TIB
      0080AF 17 00                  261         .word      TIBB    ;TIB
      0080B1 90 46                  262         .word      INTER   ;'EVAL
      0080B3 00 00                  263         .word      0       ;HLD
      0080B5 99 CD                  264         .word       LASTN  ;CNTXT pointer
      0080B7 00 80                  265         .word       CTOP   ;CP in RAM
      0080B9 99 CD                  266         .word      LASTN   ;LAST
      0080BB 00 00                  267 UEND:  .word      0
                                    268 
      0080BD                        269 ORIG:   
                                    270 ; initialize SP
      0080BD AE 17 FF         [ 2]  271         LDW     X,#STACK  ;initialize return stack
      0080C0 94               [ 1]  272         LDW     SP,X
      0080C1 BF 24            [ 2]  273         LDW     RP0,X
      0080C3 AE 16 F0         [ 2]  274         LDW     X,#DATSTK ;initialize data stack
      0080C6 BF 22            [ 2]  275         LDW     SP0,X
                                    276 ; initialize PC_5 as output to control LED2
                                    277 ; added by Picatout 
      0080C8 72 1A 50 0D      [ 1]  278         bset PC_CR1,#LED2_BIT
      0080CC 72 1A 50 0E      [ 1]  279         bset PC_CR2,#LED2_BIT
      0080D0 72 1A 50 0C      [ 1]  280         bset PC_DDR,#LED2_BIT
      000054                        281         _ledoff
      0080D4 72 1B 50 0A      [ 1]    1         bres PC_ODR,#LED2_BIT
                                    282 ; initialize clock to HSI
                                    283 ; no divisor 16Mhz 
                                    284 ; Added by Picatout 
      0080D8                        285 clock_init:
      0080D8 72 5F 50 C6      [ 1]  286         clr CLK_CKDIVR
      0080DC 72 12 50 C5      [ 1]  287 	bset CLK_SWCR,#CLK_SWCR_SWEN
      0080E0 A6 E1            [ 1]  288 	ld a,#CLK_SWR_HSI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      0080E2 C7 50 C4         [ 1]  289 	ld CLK_SWR,a
      0080E5 C1 50 C3         [ 1]  290 1$:	cp a,CLK_CMSR
      0080E8 26 FB            [ 1]  291 	jrne 1$
                                    292         
                                    293 ; initialize UART1, 115200 8N1
      0080EA                        294 uart1_init:
      0080EA 72 14 50 C7      [ 1]  295 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1
                                    296 	; configure tx pin
      0080EE 72 1A 50 02      [ 1]  297 	bset PA_DDR,#UART1_TX_PIN ; tx pin
      0080F2 72 1A 50 03      [ 1]  298 	bset PA_CR1,#UART1_TX_PIN ; push-pull output
      0080F6 72 1A 50 04      [ 1]  299 	bset PA_CR2,#UART1_TX_PIN ; fast output
                                    300 	; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
      0080FA 35 0B 52 33      [ 1]  301 	mov UART1_BRR2,#0x0b ; must be loaded first
      0080FE 35 08 52 32      [ 1]  302 	mov UART1_BRR1,#0x8
      008102 35 0C 52 35      [ 1]  303 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                                    304 ; initialize timer4, used for millisecond interrupt  
      008106 35 07 53 45      [ 1]  305 	mov TIM4_PSCR,#7 ; prescale 128  
      00810A 35 7D 53 46      [ 1]  306 	mov TIM4_ARR,#125 ; set for 1msec.
      00810E 35 05 53 40      [ 1]  307 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008112 72 10 53 41      [ 1]  308 	bset TIM4_IER,#TIM4_IER_UIE 
      008116 9A               [ 1]  309         rim
      008117 CC 96 03         [ 2]  310         jp  COLD   ;default=MN1
                                    311 
                                    312 
                                    313 ;; get millisecond counter 
                                    314 ;; msec ( -- u )
                                    315 ;; Added by Picatout 2020-04-26
      00811A 00 00                  316         .word 0 
                           00009C   317 LINK = . 
      00811C 04                     318         .byte 4
      00811D 4D 53 45 43            319         .ascii "MSEC"
      008121                        320 MSEC: 
      008121 1D 00 02         [ 2]  321         subw x,#CELLL 
      008124 90 BE 26         [ 2]  322         ldw y,MS 
      008127 FF               [ 2]  323         ldw (x),y 
      008128 81               [ 4]  324         ret 
                                    325 
                                    326 ; suspend execution for u msec 
                                    327 ;  pause ( u -- )
      008129 81 1C                  328         .word LINK 
                           0000AB   329         LINK=.
      00812B 05                     330         .byte 5 
      00812C 50 41 55 53 45         331         .ascii "PAUSE"
      008131                        332 PAUSE:
      008131 90 93            [ 1]  333         ldw y,x
      008133 90 FE            [ 2]  334         ldw y,(y)
      008135 72 B9 00 26      [ 2]  335         addw y,MS 
      008139 8F               [10]  336 1$:     wfi  
      00813A 90 B3 26         [ 2]  337         cpw y,MS  
      00813D 26 FA            [ 1]  338         jrne 1$        
      00813F 1C 00 02         [ 2]  339         addw x,#CELLL 
      008142 81               [ 4]  340         ret 
                                    341 
                                    342 ; initialize count down timer 
                                    343 ;  TIMER ( u -- )  milliseconds 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      008143 81 2B                  344         .word LINK 
                           0000C5   345         LINK=.
      008145 05                     346         .byte 5 
      008146 54 49 4D 45 52         347         .ascii "TIMER" 
      00814B                        348 TIMER:
      00814B 90 93            [ 1]  349         ldw y,x
      00814D 90 FE            [ 2]  350         ldw y,(y) 
      00814F 90 BF 28         [ 2]  351         ldw CNTDWN,y
      008152 1C 00 02         [ 2]  352         addw x,#CELLL 
      008155 81               [ 4]  353         ret 
                                    354 
                                    355 ; check for TIMER exiparition 
                                    356 ;  TIMEOUT? ( -- 0|-1 )
      008156 81 45                  357         .word LINK 
                           0000D8   358         LINK=. 
      008158 08                     359         .byte 8 
      008159 54 49 4D 45 4F 55 54   360         .ascii "TIMEOUT?"
             3F
      008161                        361 TIMEOUTQ: 
      008161 4F               [ 1]  362         clr a
      008162 1D 00 02         [ 2]  363         subw x,#CELLL 
      008165 90 BE 28         [ 2]  364         ldw y,CNTDWN 
      008168 26 01            [ 1]  365         jrne 1$ 
      00816A 43               [ 1]  366         cpl a 
      00816B E7 01            [ 1]  367 1$:     ld (1,x),a 
      00816D F7               [ 1]  368         ld (x),a 
      00816E 81               [ 4]  369         ret         
                                    370 
                                    371 ; reboot MCU 
                                    372 ; REBOOT ( -- )
      00816F 81 58                  373         .word LINK 
                           0000F1   374         LINK=. 
      008171 06                     375         .byte 6 
      008172 52 45 42 4F 4F 54      376         .ascii "REBOOT"
      008178                        377 reboot:
      008178 CC 80 80         [ 2]  378         jp NonHandledInterrupt
                                    379         
                                    380 
                                    381 ;; Device dependent I/O
                                    382 ;       ?RX     ( -- c T | F )
                                    383 ;         Return input byte and true, or false.
      00817B 81 71                  384         .word      LINK 
                           0000FD   385 LINK	= .
      00817D 04                     386         .byte      4
      00817E 3F 4B 45 59            387         .ascii     "?KEY"
      008182                        388 QKEY:
      008182 90 5F            [ 1]  389         CLRW Y 
      008184 72 0B 52 30 0B   [ 2]  390         BTJF UART1_SR,#UART_SR_RXNE,INCH   ;check status
      008189 C6 52 31         [ 1]  391         LD    A,UART1_DR   ;get char in A
      00818C 1D 00 02         [ 2]  392 	SUBW	X,#2
      00818F E7 01            [ 1]  393         LD     (1,X),A
      008191 7F               [ 1]  394 	CLR	(X)
      008192 90 53            [ 2]  395         CPLW     Y
      008194                        396 INCH:
      008194 1D 00 02         [ 2]  397 	SUBW	X,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      008197 FF               [ 2]  398         LDW     (X),Y
      008198 81               [ 4]  399         RET
                                    400 
                                    401 ;       TX!     ( c -- )
                                    402 ;       Send character c to  output device.
      008199 81 7D                  403         .word      LINK
                           00011B   404 LINK	= .
      00819B 04                     405         .byte      4
      00819C 45 4D 49 54            406         .ascii     "EMIT"
      0081A0                        407 EMIT:
      0081A0 E6 01            [ 1]  408         LD     A,(1,X)
      0081A2 1C 00 02         [ 2]  409 	ADDW	X,#2
      0081A5 72 0F 52 30 FB   [ 2]  410 OUTPUT: BTJF UART1_SR,#UART_SR_TXE,OUTPUT  ;loop until tdre
      0081AA C7 52 31         [ 1]  411         LD    UART1_DR,A   ;send A
      0081AD 81               [ 4]  412         RET
                                    413 
                                    414 ;; The kernel
                                    415 
                                    416 ;       doLIT   ( -- w )
                                    417 ;       Push an inline literal.
      0081AE 81 9B                  418         .word      LINK
                           000130   419 LINK	= 	.
      0081B0 45                     420 	.byte      COMPO+5
      0081B1 44 4F 4C 49 54         421         .ascii     "DOLIT"
      0081B6                        422 DOLIT:
      0081B6 1D 00 02         [ 2]  423 	SUBW X,#2
                           000001   424 .if PICATOUT_MOD 
      0081B9 16 01            [ 2]  425         ldw y,(1,sp)
      0081BB 90 FE            [ 2]  426         ldw y,(y)
      0081BD FF               [ 2]  427         ldw (x),y
      0081BE 90 85            [ 2]  428         popw y 
                           000000   429 .else 
                                    430         POPW Y
                                    431 	LDW YTEMP,Y
                                    432 	LDW Y,(Y)
                                    433         LDW (X),Y
                                    434         LDW Y,YTEMP
                                    435 .endif 
      0081C0 90 EC 02         [ 2]  436 	JP (2,Y)
                                    437 
                                    438 ;       next    ( -- )
                                    439 ;       Code for  single index loop.
      0081C3 81 B0                  440         .word      LINK
                           000145   441 LINK	= 	.
      0081C5 44                     442 	.byte      COMPO+4
      0081C6 4E 45 58 54            443         .ascii     "NEXT"
      0081CA                        444 DONXT:
      0081CA 16 03            [ 2]  445 	LDW Y,(3,SP)
      0081CC 90 5A            [ 2]  446 	DECW Y
      0081CE 2A 07            [ 1]  447 	JRPL NEX1
      0081D0 90 85            [ 2]  448 	POPW Y
                           000001   449 .if PICATOUT_MOD
      0081D2 5B 02            [ 2]  450         addw sp,#2
                           000000   451 .else        
                                    452 	POP A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    453 	POP A
                                    454 .endif         
      0081D4 90 EC 02         [ 2]  455         JP (2,Y)
      0081D7                        456 NEX1:
      0081D7 17 03            [ 2]  457         LDW (3,SP),Y
      0081D9 90 85            [ 2]  458         POPW Y
      0081DB 90 FE            [ 2]  459 	LDW Y,(Y)
      0081DD 90 FC            [ 2]  460 	JP (Y)
                                    461 
                                    462 ;       ?branch ( f -- )
                                    463 ;       Branch if flag is zero.
      0081DF 81 C5                  464         .word      LINK
                           000161   465 LINK	= 	.
      0081E1 47                     466 	.byte      COMPO+7
      0081E2 3F 42 52 41 4E 43 48   467         .ascii     "?BRANCH"
      0081E9                        468 QBRAN:	
      0081E9 90 93            [ 1]  469         LDW Y,X
      0081EB 1C 00 02         [ 2]  470 	ADDW X,#2
      0081EE 90 FE            [ 2]  471 	LDW Y,(Y)
      0081F0 27 0E            [ 1]  472         JREQ     BRAN
      0081F2 90 85            [ 2]  473 	POPW Y
      0081F4 90 EC 02         [ 2]  474 	JP (2,Y)
                                    475         
                                    476 ;       branch  ( -- )
                                    477 ;       Branch to an inline address.
      0081F7 81 E1                  478         .word      LINK
                           000179   479 LINK	= 	.
      0081F9 46                     480 	.byte      COMPO+6
      0081FA 42 52 41 4E 43 48      481         .ascii     "BRANCH"
      008200                        482 BRAN:
      008200 90 85            [ 2]  483         POPW Y
      008202 90 FE            [ 2]  484 	LDW Y,(Y)
      008204 90 FC            [ 2]  485         JP     (Y)
                                    486 
                                    487 ;       EXECUTE ( ca -- )
                                    488 ;       Execute  word at ca.
      008206 81 F9                  489         .word      LINK
                           000188   490 LINK	= 	.
      008208 07                     491         .byte       7
      008209 45 58 45 43 55 54 45   492         .ascii     "EXECUTE"
      008210                        493 EXECU:
      008210 90 93            [ 1]  494         LDW Y,X
      008212 1C 00 02         [ 2]  495 	ADDW X,#2
      008215 90 FE            [ 2]  496 	LDW  Y,(Y)
      008217 90 FC            [ 2]  497         JP   (Y)
                                    498 
                                    499 ;       EXIT    ( -- )
                                    500 ;       Terminate a colon definition.
      008219 82 08                  501         .word      LINK
                           00019B   502 LINK = .
      00821B 04                     503         .byte      4
      00821C 45 58 49 54            504         .ascii     "EXIT"
      008220                        505 EXIT:
      008220 90 85            [ 2]  506         POPW Y
      008222 81               [ 4]  507         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    508 
                                    509 ;       !       ( w a -- )
                                    510 ;       Pop  data stack to memory.
      008223 82 1B                  511         .word      LINK
                           0001A5   512 LINK = .
      008225 01                     513         .byte      1
      008226 21                     514         .ascii     "!"
      008227                        515 STORE:
      008227 90 93            [ 1]  516         LDW Y,X
      008229 90 FE            [ 2]  517         LDW Y,(Y)    ;Y=a
      00822B 90 BF 1C         [ 2]  518         LDW YTEMP,Y
      00822E 90 93            [ 1]  519         LDW Y,X
      008230 90 EE 02         [ 2]  520         LDW Y,(2,Y)
      008233 91 CF 1C         [ 5]  521         LDW [YTEMP],Y ;store w at a
      008236 1C 00 04         [ 2]  522         ADDW X,#4 ; DDROP 
      008239 81               [ 4]  523         RET     
                                    524 
                                    525 ;       @       ( a -- w )
                                    526 ;       Push memory location to stack.
      00823A 82 25                  527         .word      LINK
                           0001BC   528 LINK	= 	.
      00823C 01                     529         .byte    1
      00823D 40                     530         .ascii	"@"
      00823E                        531 AT:
      00823E 90 93            [ 1]  532         LDW Y,X     ;Y = a
      008240 90 FE            [ 2]  533         LDW Y,(Y)   ; address 
      008242 90 FE            [ 2]  534         LDW Y,(Y)   ; value 
      008244 FF               [ 2]  535         LDW (X),Y ;w = @Y
      008245 81               [ 4]  536         RET     
                                    537 
                                    538 ;       C!      ( c b -- )
                                    539 ;       Pop  data stack to byte memory.
      008246 82 3C                  540         .word      LINK
                           0001C8   541 LINK	= .
      008248 02                     542         .byte      2
      008249 43 21                  543         .ascii     "C!"
      00824B                        544 CSTOR:
      00824B 90 93            [ 1]  545         LDW Y,X
      00824D 90 FE            [ 2]  546 	LDW Y,(Y)    ;Y=b
      00824F E6 03            [ 1]  547         LD A,(3,X)    ;D = c
      008251 90 F7            [ 1]  548         LD  (Y),A     ;store c at b
      008253 1C 00 04         [ 2]  549 	ADDW X,#4 ; DDROP 
      008256 81               [ 4]  550         RET     
                                    551 
                                    552 ;       C@      ( b -- c )
                                    553 ;       Push byte in memory to  stack.
      008257 82 48                  554         .word      LINK
                           0001D9   555 LINK	= 	.
      008259 02                     556         .byte      2
      00825A 43 40                  557         .ascii     "C@"
      00825C                        558 CAT:
      00825C 90 93            [ 1]  559         LDW Y,X     ;Y=b
      00825E 90 FE            [ 2]  560         LDW Y,(Y)
      008260 90 F6            [ 1]  561         LD A,(Y)
      008262 E7 01            [ 1]  562         LD (1,X),A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      008264 7F               [ 1]  563         CLR (X)
      008265 81               [ 4]  564         RET     
                                    565 
                                    566 ;       RP@     ( -- a )
                                    567 ;       Push current RP to data stack.
      008266 82 59                  568         .word      LINK
                           0001E8   569 LINK	= .
      008268 03                     570         .byte      3
      008269 52 50 40               571         .ascii     "RP@"
      00826C                        572 RPAT:
      00826C 90 96            [ 1]  573         LDW Y,SP    ;save return addr
      00826E 1D 00 02         [ 2]  574         SUBW X,#2
      008271 FF               [ 2]  575         LDW (X),Y
      008272 81               [ 4]  576         RET     
                                    577 
                                    578 ;       RP!     ( a -- )
                                    579 ;       Set  return stack pointer.
      008273 82 68                  580         .word      LINK
                           0001F5   581 LINK	= 	. 
      008275 43                     582 	.byte      COMPO+3
      008276 52 50 21               583         .ascii     "RP!"
      008279                        584 RPSTO:
      008279 90 85            [ 2]  585         POPW Y
      00827B 90 BF 1C         [ 2]  586         LDW YTEMP,Y
      00827E 90 93            [ 1]  587         LDW Y,X
      008280 90 FE            [ 2]  588         LDW Y,(Y)
      008282 90 94            [ 1]  589         LDW SP,Y
      008284 1C 00 02         [ 2]  590         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      008287 92 CC 1C         [ 5]  591         JP [YTEMP]
                                    592 
                                    593 ;       R>      ( -- w )
                                    594 ;       Pop return stack to data stack.
      00828A 82 75                  595         .word      LINK
                           00020C   596 LINK	= 	. 
      00828C 42                     597 	.byte      COMPO+2
      00828D 52 3E                  598         .ascii     "R>"
      00828F                        599 RFROM:
      00828F 90 85            [ 2]  600         POPW Y    ;save return addr
      008291 90 BF 1C         [ 2]  601         LDW YTEMP,Y
      008294 90 85            [ 2]  602         POPW Y
      008296 1D 00 02         [ 2]  603         SUBW X,#2
      008299 FF               [ 2]  604         LDW (X),Y
      00829A 92 CC 1C         [ 5]  605         JP [YTEMP]
                                    606 
                                    607 ;       R@      ( -- w )
                                    608 ;       Copy top of return stack to stack.
      00829D 82 8C                  609         .word      LINK
                           00021F   610 LINK	= 	. 
      00829F 02                     611         .byte      2
      0082A0 52 40                  612         .ascii     "R@"
      0082A2                        613 RAT:
                           000001   614 .if PICATOUT_MOD
      0082A2 16 03            [ 2]  615         ldw y,(3,sp)
      0082A4 1D 00 02         [ 2]  616         subw x,#CELLL 
      0082A7 FF               [ 2]  617         ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      0082A8 81               [ 4]  618         ret 
                           000000   619 .else 
                                    620         POPW Y
                                    621         LDW YTEMP,Y
                                    622         POPW Y
                                    623         PUSHW Y
                                    624         SUBW X,#2
                                    625         LDW (X),Y
                                    626         JP [YTEMP]
                                    627 .endif         
                                    628 
                                    629 ;       >R      ( w -- )
                                    630 ;       Push data stack to return stack.
      0082A9 82 9F                  631         .word      LINK
                           00022B   632 LINK	= 	. 
      0082AB 42                     633 	.byte      COMPO+2
      0082AC 3E 52                  634         .ascii     ">R"
      0082AE                        635 TOR:
      0082AE 90 85            [ 2]  636         POPW Y    ;save return addr
      0082B0 90 BF 1C         [ 2]  637         LDW YTEMP,Y
      0082B3 90 93            [ 1]  638         LDW Y,X
      0082B5 90 FE            [ 2]  639         LDW Y,(Y)
      0082B7 90 89            [ 2]  640         PUSHW Y    ;restore return addr
      0082B9 1C 00 02         [ 2]  641         ADDW X,#2
      0082BC 92 CC 1C         [ 5]  642         JP [YTEMP]
                                    643 
                                    644 ;       SP@     ( -- a )
                                    645 ;       Push current stack pointer.
      0082BF 82 AB                  646         .word      LINK
                           000241   647 LINK	= 	. 
      0082C1 03                     648         .byte      3
      0082C2 53 50 40               649         .ascii     "SP@"
      0082C5                        650 SPAT:
      0082C5 90 93            [ 1]  651 	LDW Y,X
      0082C7 1D 00 02         [ 2]  652         SUBW X,#2
      0082CA FF               [ 2]  653 	LDW (X),Y
      0082CB 81               [ 4]  654         RET     
                                    655 
                                    656 ;       SP!     ( a -- )
                                    657 ;       Set  data stack pointer.
      0082CC 82 C1                  658         .word      LINK
                           00024E   659 LINK	= 	. 
      0082CE 03                     660         .byte      3
      0082CF 53 50 21               661         .ascii     "SP!"
      0082D2                        662 SPSTO:
      0082D2 FE               [ 2]  663         LDW     X,(X)     ;X = a
      0082D3 81               [ 4]  664         RET     
                                    665 
                                    666 ;       DROP    ( w -- )
                                    667 ;       Discard top stack item.
      0082D4 82 CE                  668         .word      LINK
                           000256   669 LINK	= 	. 
      0082D6 04                     670         .byte      4
      0082D7 44 52 4F 50            671         .ascii     "DROP"
      0082DB                        672 DROP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      0082DB 1C 00 02         [ 2]  673         ADDW X,#2     
      0082DE 81               [ 4]  674         RET     
                                    675 
                                    676 ;       DUP     ( w -- w w )
                                    677 ;       Duplicate  top stack item.
      0082DF 82 D6                  678         .word      LINK
                           000261   679 LINK	= 	. 
      0082E1 03                     680         .byte      3
      0082E2 44 55 50               681         .ascii     "DUP"
      0082E5                        682 DUPP:
      0082E5 90 93            [ 1]  683 	LDW Y,X
      0082E7 1D 00 02         [ 2]  684         SUBW X,#2
      0082EA 90 FE            [ 2]  685 	LDW Y,(Y)
      0082EC FF               [ 2]  686 	LDW (X),Y
      0082ED 81               [ 4]  687         RET     
                                    688 
                                    689 ;       SWAP    ( w1 w2 -- w2 w1 )
                                    690 ;       Exchange top two stack items.
      0082EE 82 E1                  691         .word      LINK
                           000270   692 LINK	= 	. 
      0082F0 04                     693         .byte      4
      0082F1 53 57 41 50            694         .ascii     "SWAP"
      0082F5                        695 SWAPP:
      0082F5 90 93            [ 1]  696         LDW Y,X
      0082F7 90 FE            [ 2]  697         LDW Y,(Y)
      0082F9 90 BF 1C         [ 2]  698         LDW YTEMP,Y
      0082FC 90 93            [ 1]  699         LDW Y,X
      0082FE 90 EE 02         [ 2]  700         LDW Y,(2,Y)
      008301 FF               [ 2]  701         LDW (X),Y
      008302 90 BE 1C         [ 2]  702         LDW Y,YTEMP
      008305 EF 02            [ 2]  703         LDW (2,X),Y
      008307 81               [ 4]  704         RET     
                                    705 
                                    706 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                    707 ;       Copy second stack item to top.
      008308 82 F0                  708         .word      LINK
                           00028A   709 LINK	= . 
      00830A 04                     710         .byte      4
      00830B 4F 56 45 52            711         .ascii     "OVER"
      00830F                        712 OVER:
      00830F 1D 00 02         [ 2]  713         SUBW X,#2
      008312 90 93            [ 1]  714         LDW Y,X
      008314 90 EE 04         [ 2]  715         LDW Y,(4,Y)
      008317 FF               [ 2]  716         LDW (X),Y
      008318 81               [ 4]  717         RET     
                                    718 
                                    719 ;       0<      ( n -- t )
                                    720 ;       Return true if n is negative.
      008319 83 0A                  721         .word      LINK
                           00029B   722 LINK	= . 
      00831B 02                     723         .byte      2
      00831C 30 3C                  724         .ascii     "0<"
      00831E                        725 ZLESS:
      00831E A6 FF            [ 1]  726         LD A,#0xFF
      008320 90 93            [ 1]  727         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      008322 90 FE            [ 2]  728         LDW Y,(Y)
      008324 2B 01            [ 1]  729         JRMI     ZL1
      008326 4F               [ 1]  730         CLR A   ;false
      008327 F7               [ 1]  731 ZL1:    LD     (X),A
      008328 E7 01            [ 1]  732         LD (1,X),A
      00832A 81               [ 4]  733 	RET     
                                    734 
                                    735 ;       AND     ( w w -- w )
                                    736 ;       Bitwise AND.
      00832B 83 1B                  737         .word      LINK
                           0002AD   738 LINK	= . 
      00832D 03                     739         .byte      3
      00832E 41 4E 44               740         .ascii     "AND"
      008331                        741 ANDD:
      008331 F6               [ 1]  742         LD  A,(X)    ;D=w
      008332 E4 02            [ 1]  743         AND A,(2,X)
      008334 E7 02            [ 1]  744         LD (2,X),A
      008336 E6 01            [ 1]  745         LD A,(1,X)
      008338 E4 03            [ 1]  746         AND A,(3,X)
      00833A E7 03            [ 1]  747         LD (3,X),A
      00833C 1C 00 02         [ 2]  748         ADDW X,#2
      00833F 81               [ 4]  749         RET
                                    750 
                                    751 ;       OR      ( w w -- w )
                                    752 ;       Bitwise inclusive OR.
      008340 83 2D                  753         .word      LINK
                           0002C2   754 LINK = . 
      008342 02                     755         .byte      2
      008343 4F 52                  756         .ascii     "OR"
      008345                        757 ORR:
      008345 F6               [ 1]  758         LD A,(X)    ;D=w
      008346 EA 02            [ 1]  759         OR A,(2,X)
      008348 E7 02            [ 1]  760         LD (2,X),A
      00834A E6 01            [ 1]  761         LD A,(1,X)
      00834C EA 03            [ 1]  762         OR A,(3,X)
      00834E E7 03            [ 1]  763         LD (3,X),A
      008350 1C 00 02         [ 2]  764         ADDW X,#2
      008353 81               [ 4]  765         RET
                                    766 
                                    767 ;       XOR     ( w w -- w )
                                    768 ;       Bitwise exclusive OR.
      008354 83 42                  769         .word      LINK
                           0002D6   770 LINK	= . 
      008356 03                     771         .byte      3
      008357 58 4F 52               772         .ascii     "XOR"
      00835A                        773 XORR:
      00835A F6               [ 1]  774         LD A,(X)    ;D=w
      00835B E8 02            [ 1]  775         XOR A,(2,X)
      00835D E7 02            [ 1]  776         LD (2,X),A
      00835F E6 01            [ 1]  777         LD A,(1,X)
      008361 E8 03            [ 1]  778         XOR A,(3,X)
      008363 E7 03            [ 1]  779         LD (3,X),A
      008365 1C 00 02         [ 2]  780         ADDW X,#2
      008368 81               [ 4]  781         RET
                                    782 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    783 ;       UM+     ( u u -- udsum )
                                    784 ;       Add two unsigned single
                                    785 ;       and return a double sum.
      008369 83 56                  786         .word      LINK
                           0002EB   787 LINK	= . 
      00836B 03                     788         .byte      3
      00836C 55 4D 2B               789         .ascii     "UM+"
      00836F                        790 UPLUS:
      00836F A6 01            [ 1]  791         LD A,#1
      008371 90 93            [ 1]  792         LDW Y,X
      008373 90 EE 02         [ 2]  793         LDW Y,(2,Y)
      008376 90 BF 1C         [ 2]  794         LDW YTEMP,Y
      008379 90 93            [ 1]  795         LDW Y,X
      00837B 90 FE            [ 2]  796         LDW Y,(Y)
      00837D 72 B9 00 1C      [ 2]  797         ADDW Y,YTEMP
      008381 EF 02            [ 2]  798         LDW (2,X),Y
      008383 25 01            [ 1]  799         JRC     UPL1
      008385 4F               [ 1]  800         CLR A
      008386 E7 01            [ 1]  801 UPL1:   LD     (1,X),A
      008388 7F               [ 1]  802         CLR (X)
      008389 81               [ 4]  803         RET
                                    804 
                                    805 ;; System and user variables
                                    806 
                                    807 ;       doVAR   ( -- a )
                                    808 ;       Code for VARIABLE and CREATE.
      00838A 83 6B                  809         .word      LINK
                           00030C   810 LINK	= . 
      00838C 45                     811 	.byte      COMPO+5
      00838D 44 4F 56 41 52         812         .ascii     "DOVAR"
      008392                        813 DOVAR:
      008392 1D 00 02         [ 2]  814 	SUBW X,#2
      008395 90 85            [ 2]  815         POPW Y    ;get return addr (pfa)
      008397 FF               [ 2]  816         LDW (X),Y    ;push on stack
      008398 81               [ 4]  817         RET     ;go to RET of EXEC
                                    818 
                                    819 ;       BASE    ( -- a )
                                    820 ;       Radix base for numeric I/O.
      008399 83 8C                  821         .word      LINK        
                           00031B   822 LINK = . 
      00839B 04                     823         .byte      4
      00839C 42 41 53 45            824         .ascii     "BASE"
      0083A0                        825 BASE:
      0083A0 90 AE 00 06      [ 2]  826 	LDW Y,#UBASE 
      0083A4 1D 00 02         [ 2]  827 	SUBW X,#2
      0083A7 FF               [ 2]  828         LDW (X),Y
      0083A8 81               [ 4]  829         RET
                                    830 
                                    831 ;       tmp     ( -- a )
                                    832 ;       A temporary storage.
      0083A9 83 9B                  833         .word      LINK
                                    834         
                           00032B   835 LINK = . 
      0083AB 03                     836 	.byte      3
      0083AC 54 4D 50               837         .ascii     "TMP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      0083AF                        838 TEMP:
      0083AF 90 AE 00 08      [ 2]  839 	LDW Y,#UTMP
      0083B3 1D 00 02         [ 2]  840 	SUBW X,#2
      0083B6 FF               [ 2]  841         LDW (X),Y
      0083B7 81               [ 4]  842         RET
                                    843 
                                    844 ;       >IN     ( -- a )
                                    845 ;        Hold parsing pointer.
      0083B8 83 AB                  846         .word      LINK
                           00033A   847 LINK = . 
      0083BA 03                     848         .byte      3
      0083BB 3E 49 4E               849         .ascii    ">IN"
      0083BE                        850 INN:
      0083BE 90 AE 00 0A      [ 2]  851 	LDW Y,#UINN 
      0083C2 1D 00 02         [ 2]  852 	SUBW X,#2
      0083C5 FF               [ 2]  853         LDW (X),Y
      0083C6 81               [ 4]  854         RET
                                    855 
                                    856 ;       #TIB    ( -- a )
                                    857 ;       Count in terminal input buffer.
      0083C7 83 BA                  858         .word      LINK
                           000349   859 LINK = . 
      0083C9 04                     860         .byte      4
      0083CA 23 54 49 42            861         .ascii     "#TIB"
      0083CE                        862 NTIB:
      0083CE 90 AE 00 0C      [ 2]  863 	LDW Y,#UCTIB 
      0083D2 1D 00 02         [ 2]  864 	SUBW X,#2
      0083D5 FF               [ 2]  865         LDW (X),Y
      0083D6 81               [ 4]  866         RET
                                    867 
                                    868 ;       "EVAL   ( -- a )
                                    869 ;       Execution vector of EVAL.
      0083D7 83 C9                  870         .word      LINK
                           000359   871 LINK = . 
      0083D9 05                     872         .byte      5
      0083DA 27 45 56 41 4C         873         .ascii     "'EVAL"
      0083DF                        874 TEVAL:
      0083DF 90 AE 00 10      [ 2]  875 	LDW Y,#UINTER 
      0083E3 1D 00 02         [ 2]  876 	SUBW X,#2
      0083E6 FF               [ 2]  877         LDW (X),Y
      0083E7 81               [ 4]  878         RET
                                    879 
                                    880 ;       HLD     ( -- a )
                                    881 ;       Hold a pointer of output string.
      0083E8 83 D9                  882         .word      LINK
                           00036A   883 LINK = . 
      0083EA 03                     884         .byte      3
      0083EB 48 4C 44               885         .ascii     "HLD"
      0083EE                        886 HLD:
      0083EE 90 AE 00 12      [ 2]  887 	LDW Y,#UHLD 
      0083F2 1D 00 02         [ 2]  888 	SUBW X,#2
      0083F5 FF               [ 2]  889         LDW (X),Y
      0083F6 81               [ 4]  890         RET
                                    891 
                                    892 ;       CONTEXT ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                                    893 ;       Start vocabulary search.
      0083F7 83 EA                  894         .word      LINK
                           000379   895 LINK = . 
      0083F9 07                     896         .byte      7
      0083FA 43 4F 4E 54 45 58 54   897         .ascii     "CONTEXT"
      008401                        898 CNTXT:
      008401 90 AE 00 14      [ 2]  899 	LDW Y,#UCNTXT
      008405 1D 00 02         [ 2]  900 	SUBW X,#2
      008408 FF               [ 2]  901         LDW (X),Y
      008409 81               [ 4]  902         RET
                                    903 
                                    904 ;       CP      ( -- a )
                                    905 ;       Point to top of dictionary.
      00840A 83 F9                  906         .word      LINK
                           00038C   907 LINK = . 
      00840C 02                     908         .byte      2
      00840D 43 50                  909         .ascii     "CP"
      00840F                        910 CPP:
      00840F 90 AE 00 16      [ 2]  911 	LDW Y,#UCP 
      008413 1D 00 02         [ 2]  912 	SUBW X,#2
      008416 FF               [ 2]  913         LDW (X),Y
      008417 81               [ 4]  914         RET
                                    915 
                                    916 ;       LAST    ( -- a )
                                    917 ;       Point to last name in dictionary.
      008418 84 0C                  918         .word      LINK
                           00039A   919 LINK = . 
      00841A 04                     920         .byte      4
      00841B 4C 41 53 54            921         .ascii     "LAST"
      00841F                        922 LAST:
      00841F 90 AE 00 18      [ 2]  923 	LDW Y,#ULAST 
      008423 1D 00 02         [ 2]  924 	SUBW X,#2
      008426 FF               [ 2]  925         LDW (X),Y
      008427 81               [ 4]  926         RET
                                    927 
                                    928 ;; Common functions
                                    929 
                                    930 ;       ?DUP    ( w -- w w | 0 )
                                    931 ;       Dup tos if its is not zero.
      008428 84 1A                  932         .word      LINK
                           0003AA   933 LINK = . 
      00842A 04                     934         .byte      4
      00842B 3F 44 55 50            935         .ascii     "?DUP"
      00842F                        936 QDUP:
      00842F 90 93            [ 1]  937         LDW Y,X
      008431 90 FE            [ 2]  938 	LDW Y,(Y)
      008433 27 04            [ 1]  939         JREQ     QDUP1
      008435 1D 00 02         [ 2]  940 	SUBW X,#2
      008438 FF               [ 2]  941         LDW (X),Y
      008439 81               [ 4]  942 QDUP1:  RET
                                    943 
                                    944 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                    945 ;       Rot 3rd item to top.
      00843A 84 2A                  946         .word      LINK
                           0003BC   947 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      00843C 03                     948         .byte      3
      00843D 52 4F 54               949         .ascii     "ROT"
      008440                        950 ROT:
                           000001   951 .if PICATOUT_MOD
      008440 90 93            [ 1]  952         ldw y,x 
      008442 90 FE            [ 2]  953         ldw y,(y)
      008444 90 89            [ 2]  954         pushw y 
      008446 90 93            [ 1]  955         ldw y,x 
      008448 90 EE 04         [ 2]  956         ldw y,(4,y)
      00844B FF               [ 2]  957         ldw (x),y 
      00844C 90 93            [ 1]  958         ldw y,x 
      00844E 90 EE 02         [ 2]  959         ldw y,(2,y)
      008451 EF 04            [ 2]  960         ldw (4,x),y 
      008453 90 85            [ 2]  961         popw y 
      008455 EF 02            [ 2]  962         ldw (2,x),y
      008457 81               [ 4]  963         ret 
                           000000   964 .else 
                                    965         LDW Y,X
                                    966 	LDW Y,(4,Y)
                                    967 	LDW YTEMP,Y
                                    968         LDW Y,X
                                    969         LDW Y,(2,Y)
                                    970         LDW XTEMP,Y
                                    971         LDW Y,X
                                    972         LDW Y,(Y)
                                    973         LDW (2,X),Y
                                    974         LDW Y,XTEMP
                                    975         LDW (4,X),Y
                                    976         LDW Y,YTEMP
                                    977         LDW (X),Y
                                    978         RET
                                    979 .endif 
                                    980 
                                    981 ;       2DROP   ( w w -- )
                                    982 ;       Discard two items on stack.
      008458 84 3C                  983         .word      LINK
                           0003DA   984 LINK = . 
      00845A 05                     985         .byte      5
      00845B 32 44 52 4F 50         986         .ascii     "2DROP"
      008460                        987 DDROP:
      008460 1C 00 04         [ 2]  988         ADDW X,#4
      008463 81               [ 4]  989         RET
                                    990 
                                    991 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                    992 ;       Duplicate top two items.
      008464 84 5A                  993         .word      LINK
                           0003E6   994 LINK = . 
      008466 04                     995         .byte      4
      008467 32 44 55 50            996         .ascii     "2DUP"
      00846B                        997 DDUP:
      00846B 1D 00 04         [ 2]  998         SUBW X,#4
      00846E 90 93            [ 1]  999         LDW Y,X
      008470 90 EE 06         [ 2] 1000         LDW Y,(6,Y)
      008473 EF 02            [ 2] 1001         LDW (2,X),Y
      008475 90 93            [ 1] 1002         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008477 90 EE 04         [ 2] 1003         LDW Y,(4,Y)
      00847A FF               [ 2] 1004         LDW (X),Y
      00847B 81               [ 4] 1005         RET
                                   1006 
                                   1007 ;       +       ( w w -- sum )
                                   1008 ;       Add top two items.
      00847C 84 66                 1009         .word      LINK
                           0003FE  1010 LINK = . 
      00847E 01                    1011         .byte      1
      00847F 2B                    1012         .ascii     "+"
      008480                       1013 PLUS:
      008480 90 93            [ 1] 1014         LDW Y,X
      008482 90 FE            [ 2] 1015         LDW Y,(Y)
      008484 90 BF 1C         [ 2] 1016         LDW YTEMP,Y
      008487 1C 00 02         [ 2] 1017         ADDW X,#2
      00848A 90 93            [ 1] 1018         LDW Y,X
      00848C 90 FE            [ 2] 1019         LDW Y,(Y)
      00848E 72 B9 00 1C      [ 2] 1020         ADDW Y,YTEMP
      008492 FF               [ 2] 1021         LDW (X),Y
      008493 81               [ 4] 1022         RET
                                   1023 
                                   1024 ;       NOT     ( w -- w )
                                   1025 ;       One's complement of tos.
      008494 84 7E                 1026         .word      LINK
                           000416  1027 LINK = . 
      008496 03                    1028         .byte      3
      008497 4E 4F 54              1029         .ascii     "NOT"
      00849A                       1030 INVER:
      00849A 90 93            [ 1] 1031         LDW Y,X
      00849C 90 FE            [ 2] 1032         LDW Y,(Y)
      00849E 90 53            [ 2] 1033         CPLW Y
      0084A0 FF               [ 2] 1034         LDW (X),Y
      0084A1 81               [ 4] 1035         RET
                                   1036 
                                   1037 ;       NEGATE  ( n -- -n )
                                   1038 ;       Two's complement of tos.
      0084A2 84 96                 1039         .word      LINK
                           000424  1040 LINK = . 
      0084A4 06                    1041         .byte      6
      0084A5 4E 45 47 41 54 45     1042         .ascii     "NEGATE"
      0084AB                       1043 NEGAT:
      0084AB 90 93            [ 1] 1044         LDW Y,X
      0084AD 90 FE            [ 2] 1045         LDW Y,(Y)
      0084AF 90 50            [ 2] 1046         NEGW Y
      0084B1 FF               [ 2] 1047         LDW (X),Y
      0084B2 81               [ 4] 1048         RET
                                   1049 
                                   1050 ;       DNEGATE ( d -- -d )
                                   1051 ;       Two's complement of top double.
      0084B3 84 A4                 1052         .word      LINK
                           000435  1053 LINK = . 
      0084B5 07                    1054         .byte      7
      0084B6 44 4E 45 47 41 54 45  1055         .ascii     "DNEGATE"
      0084BD                       1056 DNEGA:
      0084BD 90 93            [ 1] 1057         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      0084BF 90 FE            [ 2] 1058 	LDW Y,(Y)
      0084C1 90 53            [ 2] 1059         CPLW Y     
      0084C3 90 BF 1C         [ 2] 1060 	LDW YTEMP,Y
      0084C6 90 93            [ 1] 1061         LDW Y,X
      0084C8 90 EE 02         [ 2] 1062         LDW Y,(2,Y)
      0084CB 90 53            [ 2] 1063         CPLW Y
      0084CD 90 5C            [ 2] 1064         INCW Y
      0084CF EF 02            [ 2] 1065         LDW (2,X),Y
      0084D1 90 BE 1C         [ 2] 1066         LDW Y,YTEMP
      0084D4 24 02            [ 1] 1067         JRNC DN1 
      0084D6 90 5C            [ 2] 1068         INCW Y
      0084D8 FF               [ 2] 1069 DN1:    LDW (X),Y
      0084D9 81               [ 4] 1070         RET
                                   1071 
                                   1072 ;       -       ( n1 n2 -- n1-n2 )
                                   1073 ;       Subtraction.
      0084DA 84 B5                 1074         .word      LINK
                           00045C  1075 LINK = . 
      0084DC 01                    1076         .byte      1
      0084DD 2D                    1077         .ascii     "-"
      0084DE                       1078 SUBB:
      0084DE 90 93            [ 1] 1079         LDW Y,X
      0084E0 90 FE            [ 2] 1080         LDW Y,(Y)
      0084E2 90 BF 1C         [ 2] 1081         LDW YTEMP,Y
      0084E5 1C 00 02         [ 2] 1082         ADDW X,#2
      0084E8 90 93            [ 1] 1083         LDW Y,X
      0084EA 90 FE            [ 2] 1084         LDW Y,(Y)
      0084EC 72 B2 00 1C      [ 2] 1085         SUBW Y,YTEMP
      0084F0 FF               [ 2] 1086         LDW (X),Y
      0084F1 81               [ 4] 1087         RET
                                   1088 
                                   1089 ;       ABS     ( n -- n )
                                   1090 ;       Return  absolute value of n.
      0084F2 84 DC                 1091         .word      LINK
                           000474  1092 LINK = . 
      0084F4 03                    1093         .byte      3
      0084F5 41 42 53              1094         .ascii     "ABS"
      0084F8                       1095 ABSS:
      0084F8 90 93            [ 1] 1096         LDW Y,X
      0084FA 90 FE            [ 2] 1097 	LDW Y,(Y)
      0084FC 2A 03            [ 1] 1098         JRPL     AB1     ;negate:
      0084FE 90 50            [ 2] 1099         NEGW     Y     ;else negate hi byte
      008500 FF               [ 2] 1100         LDW (X),Y
      008501 81               [ 4] 1101 AB1:    RET
                                   1102 
                                   1103 ;       =       ( w w -- t )
                                   1104 ;       Return true if top two are =al.
      008502 84 F4                 1105         .word      LINK
                           000484  1106 LINK = . 
      008504 01                    1107         .byte      1
      008505 3D                    1108         .ascii     "="
      008506                       1109 EQUAL:
      008506 A6 FF            [ 1] 1110         LD A,#0xFF  ;true
      008508 90 93            [ 1] 1111         LDW Y,X    ;D = n2
      00850A 90 FE            [ 2] 1112         LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      00850C 90 BF 1C         [ 2] 1113         LDW YTEMP,Y
      00850F 1C 00 02         [ 2] 1114         ADDW X,#2
      008512 90 93            [ 1] 1115         LDW Y,X
      008514 90 FE            [ 2] 1116         LDW Y,(Y)
      008516 90 B3 1C         [ 2] 1117         CPW Y,YTEMP     ;if n2 <> n1
      008519 27 01            [ 1] 1118         JREQ     EQ1
      00851B 4F               [ 1] 1119         CLR A
      00851C F7               [ 1] 1120 EQ1:    LD (X),A
      00851D E7 01            [ 1] 1121         LD (1,X),A
      00851F 81               [ 4] 1122 	RET     
                                   1123 
                                   1124 ;       U<      ( u u -- t )
                                   1125 ;       Unsigned compare of top two items.
      008520 85 04                 1126         .word      LINK
                           0004A2  1127 LINK = . 
      008522 02                    1128         .byte      2
      008523 55 3C                 1129         .ascii     "U<"
      008525                       1130 ULESS:
      008525 A6 FF            [ 1] 1131         LD A,#0xFF  ;true
      008527 90 93            [ 1] 1132         LDW Y,X    ;D = n2
      008529 90 FE            [ 2] 1133         LDW Y,(Y)
      00852B 90 BF 1C         [ 2] 1134         LDW YTEMP,Y
      00852E 1C 00 02         [ 2] 1135         ADDW X,#2
      008531 90 93            [ 1] 1136         LDW Y,X
      008533 90 FE            [ 2] 1137         LDW Y,(Y)
      008535 90 B3 1C         [ 2] 1138         CPW Y,YTEMP     ;if n2 <> n1
      008538 25 01            [ 1] 1139         JRULT     ULES1
      00853A 4F               [ 1] 1140         CLR A
      00853B F7               [ 1] 1141 ULES1:  LD (X),A
      00853C E7 01            [ 1] 1142         LD (1,X),A
      00853E 81               [ 4] 1143 	RET     
                                   1144 
                                   1145 ;       <       ( n1 n2 -- t )
                                   1146 ;       Signed compare of top two items.
      00853F 85 22                 1147         .word      LINK
                           0004C1  1148 LINK = . 
      008541 01                    1149         .byte      1
      008542 3C                    1150         .ascii     "<"
      008543                       1151 LESS:
      008543 A6 FF            [ 1] 1152         LD A,#0xFF  ;true
      008545 90 93            [ 1] 1153         LDW Y,X    ;D = n2
      008547 90 FE            [ 2] 1154         LDW Y,(Y)
      008549 90 BF 1C         [ 2] 1155         LDW YTEMP,Y
      00854C 1C 00 02         [ 2] 1156         ADDW X,#2
      00854F 90 93            [ 1] 1157         LDW Y,X
      008551 90 FE            [ 2] 1158         LDW Y,(Y)
      008553 90 B3 1C         [ 2] 1159         CPW Y,YTEMP     ;if n2 <> n1
      008556 2F 01            [ 1] 1160         JRSLT     LT1
      008558 4F               [ 1] 1161         CLR A
      008559 F7               [ 1] 1162 LT1:    LD (X),A
      00855A E7 01            [ 1] 1163         LD (1,X),A
      00855C 81               [ 4] 1164 	RET     
                                   1165 
                                   1166 ;       MAX     ( n n -- n )
                                   1167 ;       Return greater of two top items.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      00855D 85 41                 1168         .word      LINK
                           0004DF  1169 LINK = . 
      00855F 03                    1170         .byte      3
      008560 4D 41 58              1171         .ascii     "MAX"
      008563                       1172 MAX:
      008563 90 93            [ 1] 1173         LDW Y,X    ;D = n2
      008565 90 EE 02         [ 2] 1174         LDW Y,(2,Y)
      008568 90 BF 1C         [ 2] 1175         LDW YTEMP,Y
      00856B 90 93            [ 1] 1176         LDW Y,X
      00856D 90 FE            [ 2] 1177         LDW Y,(Y)
      00856F 90 B3 1C         [ 2] 1178         CPW Y,YTEMP     ;if n2 <> n1
      008572 2F 02            [ 1] 1179         JRSLT     MAX1
      008574 EF 02            [ 2] 1180         LDW (2,X),Y
      008576 1C 00 02         [ 2] 1181 MAX1:   ADDW X,#2
      008579 81               [ 4] 1182 	RET     
                                   1183 
                                   1184 ;       MIN     ( n n -- n )
                                   1185 ;       Return smaller of top two items.
      00857A 85 5F                 1186         .word      LINK
                           0004FC  1187 LINK = . 
      00857C 03                    1188         .byte      3
      00857D 4D 49 4E              1189         .ascii     "MIN"
      008580                       1190 MIN:
      008580 90 93            [ 1] 1191         LDW Y,X    ;D = n2
      008582 90 EE 02         [ 2] 1192         LDW Y,(2,Y)
      008585 90 BF 1C         [ 2] 1193         LDW YTEMP,Y
      008588 90 93            [ 1] 1194         LDW Y,X
      00858A 90 FE            [ 2] 1195         LDW Y,(Y)
      00858C 90 B3 1C         [ 2] 1196         CPW Y,YTEMP     ;if n2 <> n1
      00858F 2C 02            [ 1] 1197         JRSGT     MIN1
      008591 EF 02            [ 2] 1198         LDW (2,X),Y
      008593 1C 00 02         [ 2] 1199 MIN1:	ADDW X,#2
      008596 81               [ 4] 1200 	RET     
                                   1201 
                                   1202 ;       WITHIN  ( u ul uh -- t )
                                   1203 ;       Return true if u is within
                                   1204 ;       range of ul and uh. ( ul <= u < uh )
      008597 85 7C                 1205         .word      LINK
                           000519  1206 LINK = . 
      008599 06                    1207         .byte      6
      00859A 57 49 54 48 49 4E     1208         .ascii     "WITHIN"
      0085A0                       1209 WITHI:
      0085A0 CD 83 0F         [ 4] 1210         CALL     OVER
      0085A3 CD 84 DE         [ 4] 1211         CALL     SUBB
      0085A6 CD 82 AE         [ 4] 1212         CALL     TOR
      0085A9 CD 84 DE         [ 4] 1213         CALL     SUBB
      0085AC CD 82 8F         [ 4] 1214         CALL     RFROM
      0085AF CC 85 25         [ 2] 1215         JP     ULESS
                                   1216 
                                   1217 ;; Divide
                                   1218 
                                   1219 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1220 ;       Unsigned divide of a double by a
                                   1221 ;       single. Return mod and quotient.
      0085B2 85 99                 1222         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



                           000534  1223 LINK = . 
      0085B4 06                    1224         .byte      6
      0085B5 55 4D 2F 4D 4F 44     1225         .ascii     "UM/MOD"
      0085BB                       1226 UMMOD:
      0085BB BF 1A            [ 2] 1227 	LDW XTEMP,X	; save stack pointer
      0085BD FE               [ 2] 1228 	LDW X,(X)	; un
      0085BE BF 1C            [ 2] 1229 	LDW YTEMP,X     ; save un
      0085C0 90 BE 1A         [ 2] 1230 	LDW Y,XTEMP	; stack pointer
      0085C3 90 EE 04         [ 2] 1231 	LDW Y,(4,Y)     ; Y=udl
      0085C6 BE 1A            [ 2] 1232 	LDW X,XTEMP
      0085C8 EE 02            [ 2] 1233 	LDW X,(2,X)	; X=udh
      0085CA B3 1C            [ 2] 1234 	CPW X,YTEMP
      0085CC 23 0F            [ 2] 1235 	JRULE MMSM1
      0085CE BE 1A            [ 2] 1236 	LDW X,XTEMP
      0085D0 1C 00 02         [ 2] 1237 	ADDW X,#2	; pop off 1 level
      0085D3 90 AE FF FF      [ 2] 1238 	LDW Y,#0xFFFF
      0085D7 FF               [ 2] 1239 	LDW (X),Y
      0085D8 90 5F            [ 1] 1240 	CLRW Y
      0085DA EF 02            [ 2] 1241 	LDW (2,X),Y
      0085DC 81               [ 4] 1242 	RET
      0085DD                       1243 MMSM1:
                           000001  1244 .if  PICATOUT_MOD 
                                   1245 ; take advantage of divw x,y when udh==0
      0085DD 5D               [ 2] 1246         tnzw x  ; is udh==0?
      0085DE 26 11            [ 1] 1247         jrne MMSM2 
      0085E0 93               [ 1] 1248         ldw x,y    ;udl 
      0085E1 90 BE 1C         [ 2] 1249         ldw y,YTEMP ; divisor 
      0085E4 65               [ 2] 1250         divw x,y 
      0085E5 89               [ 2] 1251         pushw x     ; quotient 
      0085E6 BE 1A            [ 2] 1252         ldw x,XTEMP 
      0085E8 1C 00 02         [ 2] 1253         addw x,#CELLL 
      0085EB EF 02            [ 2] 1254         ldw (2,x),y  ; ur
      0085ED 90 85            [ 2] 1255         popw y 
      0085EF FF               [ 2] 1256         ldw (x),y ; uq 
      0085F0 81               [ 4] 1257         ret 
      0085F1                       1258 MMSM2:        
                                   1259 .endif 
      0085F1 A6 11            [ 1] 1260 	LD A,#17	; loop count
      0085F3                       1261 MMSM3:
      0085F3 B3 1C            [ 2] 1262 	CPW X,YTEMP	; compare udh to un
      0085F5 25 04            [ 1] 1263 	JRULT MMSM4	; can't subtract
      0085F7 72 B0 00 1C      [ 2] 1264 	SUBW X,YTEMP	; can subtract
      0085FB                       1265 MMSM4:
      0085FB 8C               [ 1] 1266 	CCF	; quotient bit
      0085FC 90 59            [ 2] 1267 	RLCW Y	; rotate into quotient
      0085FE 59               [ 2] 1268 	RLCW X	; rotate into remainder
      0085FF 4A               [ 1] 1269 	DEC A	; repeat
      008600 22 F1            [ 1] 1270 	JRUGT MMSM3
      008602 57               [ 2] 1271 	SRAW X
      008603 BF 1C            [ 2] 1272 	LDW YTEMP,X	; done, save remainder
      008605 BE 1A            [ 2] 1273 	LDW X,XTEMP
      008607 1C 00 02         [ 2] 1274 	ADDW X,#2	; drop
      00860A FF               [ 2] 1275 	LDW (X),Y
      00860B 90 BE 1C         [ 2] 1276 	LDW Y,YTEMP	; save quotient
      00860E EF 02            [ 2] 1277 	LDW (2,X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      008610 81               [ 4] 1278 	RET
                                   1279 	
                                   1280 ;       M/MOD   ( d n -- r q )
                                   1281 ;       Signed floored divide of double by
                                   1282 ;       single. Return mod and quotient.
      008611 85 B4                 1283         .word      LINK
                           000593  1284 LINK = . 
      008613 05                    1285         .byte      5
      008614 4D 2F 4D 4F 44        1286         .ascii     "M/MOD"
      008619                       1287 MSMOD:  
      008619 CD 82 E5         [ 4] 1288         CALL	DUPP
      00861C CD 83 1E         [ 4] 1289         CALL	ZLESS
      00861F CD 82 E5         [ 4] 1290         CALL	DUPP
      008622 CD 82 AE         [ 4] 1291         CALL	TOR
      008625 CD 81 E9         [ 4] 1292         CALL	QBRAN
      008628 86 36                 1293         .word	MMOD1
      00862A CD 84 AB         [ 4] 1294         CALL	NEGAT
      00862D CD 82 AE         [ 4] 1295         CALL	TOR
      008630 CD 84 BD         [ 4] 1296         CALL	DNEGA
      008633 CD 82 8F         [ 4] 1297         CALL	RFROM
      008636 CD 82 AE         [ 4] 1298 MMOD1:	CALL	TOR
      008639 CD 82 E5         [ 4] 1299         CALL	DUPP
      00863C CD 83 1E         [ 4] 1300         CALL	ZLESS
      00863F CD 81 E9         [ 4] 1301         CALL	QBRAN
      008642 86 4A                 1302         .word	MMOD2
      008644 CD 82 A2         [ 4] 1303         CALL	RAT
      008647 CD 84 80         [ 4] 1304         CALL	PLUS
      00864A CD 82 8F         [ 4] 1305 MMOD2:	CALL	RFROM
      00864D CD 85 BB         [ 4] 1306         CALL	UMMOD
      008650 CD 82 8F         [ 4] 1307         CALL	RFROM
      008653 CD 81 E9         [ 4] 1308         CALL	QBRAN
      008656 86 61                 1309         .word	MMOD3
      008658 CD 82 F5         [ 4] 1310         CALL	SWAPP
      00865B CD 84 AB         [ 4] 1311         CALL	NEGAT
      00865E CD 82 F5         [ 4] 1312         CALL	SWAPP
      008661 81               [ 4] 1313 MMOD3:	RET
                                   1314 
                                   1315 ;       /MOD    ( n n -- r q )
                                   1316 ;       Signed divide. Return mod and quotient.
      008662 86 13                 1317         .word      LINK
                           0005E4  1318 LINK = . 
      008664 04                    1319         .byte      4
      008665 2F 4D 4F 44           1320         .ascii     "/MOD"
      008669                       1321 SLMOD:
      008669 CD 83 0F         [ 4] 1322         CALL	OVER
      00866C CD 83 1E         [ 4] 1323         CALL	ZLESS
      00866F CD 82 F5         [ 4] 1324         CALL	SWAPP
      008672 CC 86 19         [ 2] 1325         JP	MSMOD
                                   1326 
                                   1327 ;       MOD     ( n n -- r )
                                   1328 ;       Signed divide. Return mod only.
      008675 86 64                 1329         .word      LINK
                           0005F7  1330 LINK = . 
      008677 03                    1331         .byte      3
      008678 4D 4F 44              1332         .ascii     "MOD"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      00867B                       1333 MODD:
      00867B CD 86 69         [ 4] 1334 	CALL	SLMOD
      00867E CC 82 DB         [ 2] 1335 	JP	DROP
                                   1336 
                                   1337 ;       /       ( n n -- q )
                                   1338 ;       Signed divide. Return quotient only.
      008681 86 77                 1339         .word      LINK
                           000603  1340 LINK = . 
      008683 01                    1341         .byte      1
      008684 2F                    1342         .ascii     "/"
      008685                       1343 SLASH:
      008685 CD 86 69         [ 4] 1344         CALL	SLMOD
      008688 CD 82 F5         [ 4] 1345         CALL	SWAPP
      00868B CC 82 DB         [ 2] 1346         JP	DROP
                                   1347 
                                   1348 ;; Multiply
                                   1349 
                                   1350 ;       UM*     ( u u -- ud )
                                   1351 ;       Unsigned multiply. Return double product.
      00868E 86 83                 1352         .word      LINK
                           000610  1353 LINK = . 
      008690 03                    1354         .byte      3
      008691 55 4D 2A              1355         .ascii     "UM*"
      008694                       1356 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                           000001  1357 .if PICATOUT_MOD 
                                   1358 ; take advantage of SP addressing modes
                                   1359 ; these PRODx in RAM are not required
                                   1360 ; the product is kept on stack as local variable 
                                   1361         ;; bytes offset on data stack 
                           000002  1362         da=2 
                           000003  1363         db=3 
                           000000  1364         dc=0 
                           000001  1365         dd=1 
                                   1366         ;; product bytes offset on return stack 
                           000001  1367         UD1=1  ; ud bits 31..24
                           000002  1368         UD2=2  ; ud bits 23..16
                           000003  1369         UD3=3  ; ud bits 15..8 
                           000004  1370         UD4=4  ; ud bits 7..0 
                                   1371         ;; local variable for product set to zero   
      008694 90 5F            [ 1] 1372         clrw y 
      008696 90 89            [ 2] 1373         pushw y  ; bits 15..0
      008698 90 89            [ 2] 1374         pushw y  ; bits 31..16 
      00869A E6 03            [ 1] 1375         ld a,(db,x) ; b 
      00869C 90 97            [ 1] 1376         ld yl,a 
      00869E E6 01            [ 1] 1377         ld a,(dd,x)   ; d
      0086A0 90 42            [ 4] 1378         mul y,a    ; b*d  
      0086A2 17 03            [ 2] 1379         ldw (UD3,sp),y ; lowest weight product 
      0086A4 E6 03            [ 1] 1380         ld a,(db,x)
      0086A6 90 97            [ 1] 1381         ld yl,a 
      0086A8 E6 00            [ 1] 1382         ld a,(dc,x)
      0086AA 90 42            [ 4] 1383         mul y,a  ; b*c 
                                   1384         ;;; do the partial sum 
      0086AC 72 F9 02         [ 2] 1385         addw y,(UD2,sp)
      0086AF 4F               [ 1] 1386         clr a 
      0086B0 49               [ 1] 1387         rlc a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      0086B1 6B 01            [ 1] 1388         ld (UD1,sp),a 
      0086B3 17 02            [ 2] 1389         ldw (UD2,sp),y 
      0086B5 E6 02            [ 1] 1390         ld a,(da,x)
      0086B7 90 97            [ 1] 1391         ld yl,a 
      0086B9 E6 01            [ 1] 1392         ld a,(dd,x)
      0086BB 90 42            [ 4] 1393         mul y,a   ; a*d 
                                   1394         ;; do partial sum 
      0086BD 72 F9 02         [ 2] 1395         addw y,(UD2,sp)
      0086C0 4F               [ 1] 1396         clr a 
      0086C1 19 01            [ 1] 1397         adc a,(UD1,sp)
      0086C3 6B 01            [ 1] 1398         ld (UD1,sp),a  
      0086C5 17 02            [ 2] 1399         ldw (UD2,sp),y 
      0086C7 E6 02            [ 1] 1400         ld a,(da,x)
      0086C9 90 97            [ 1] 1401         ld yl,a 
      0086CB E6 00            [ 1] 1402         ld a,(dc,x)
      0086CD 90 42            [ 4] 1403         mul y,a  ;  a*c highest weight product 
                                   1404         ;;; do partial sum 
      0086CF 72 F9 01         [ 2] 1405         addw y,(UD1,sp)
      0086D2 FF               [ 2] 1406         ldw (x),y  ; udh 
      0086D3 16 03            [ 2] 1407         ldw y,(UD3,sp)
      0086D5 EF 02            [ 2] 1408         ldw (2,x),y  ; udl  
      0086D7 5B 04            [ 2] 1409         addw sp,#4 ; drop local variable 
      0086D9 81               [ 4] 1410         ret  
                           000000  1411 .else
                                   1412 	LD A,(2,X)	; b
                                   1413 	LD YL,A
                                   1414 	LD A,(X)	; d
                                   1415 	MUL Y,A
                                   1416 	LDW PROD1,Y
                                   1417 	LD A,(3,X)	; a
                                   1418 	LD YL,A
                                   1419 	LD A,(X)	; d
                                   1420 	MUL Y,A
                                   1421 	LDW PROD2,Y
                                   1422 	LD A,(2,X)	; b
                                   1423 	LD YL,A
                                   1424 	LD A,(1,X)	; c
                                   1425 	MUL Y,A
                                   1426 	LDW PROD3,Y
                                   1427 	LD A,(3,X)	; a
                                   1428 	LD YL,A
                                   1429 	LD A,(1,X)	; c
                                   1430 	MUL Y,A	; least signifiant product
                                   1431 	CLR A
                                   1432 	RRWA Y
                                   1433 	LD (3,X),A	; store least significant byte
                                   1434 	ADDW Y,PROD3
                                   1435 	CLR A
                                   1436 	ADC A,#0	; save carry
                                   1437 	LD CARRY,A
                                   1438 	ADDW Y,PROD2
                                   1439 	LD A,CARRY
                                   1440 	ADC A,#0	; add 2nd carry
                                   1441 	LD CARRY,A
                                   1442 	CLR A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



                                   1443 	RRWA Y
                                   1444 	LD (2,X),A	; 2nd product byte
                                   1445 	ADDW Y,PROD1
                                   1446 	RRWA Y
                                   1447 	LD (1,X),A	; 3rd product byte
                                   1448 	RRWA Y  	; 4th product byte now in A
                                   1449 	ADC A,CARRY	; fill in carry bits
                                   1450 	LD (X),A
                                   1451 	RET
                                   1452 .endif 
                                   1453 
                                   1454 
                                   1455 ;       *       ( n n -- n )
                                   1456 ;       Signed multiply. Return single product.
      0086DA 86 90                 1457         .word      LINK
                           00065C  1458 LINK = . 
      0086DC 01                    1459         .byte      1
      0086DD 2A                    1460         .ascii     "*"
      0086DE                       1461 STAR:
      0086DE CD 86 94         [ 4] 1462 	CALL	UMSTA
      0086E1 CC 82 DB         [ 2] 1463 	JP	DROP
                                   1464 
                                   1465 ;       M*      ( n n -- d )
                                   1466 ;       Signed multiply. Return double product.
      0086E4 86 DC                 1467         .word      LINK
                           000666  1468 LINK = . 
      0086E6 02                    1469         .byte      2
      0086E7 4D 2A                 1470         .ascii     "M*"
      0086E9                       1471 MSTAR:      
      0086E9 CD 84 6B         [ 4] 1472         CALL	DDUP
      0086EC CD 83 5A         [ 4] 1473         CALL	XORR
      0086EF CD 83 1E         [ 4] 1474         CALL	ZLESS
      0086F2 CD 82 AE         [ 4] 1475         CALL	TOR
      0086F5 CD 84 F8         [ 4] 1476         CALL	ABSS
      0086F8 CD 82 F5         [ 4] 1477         CALL	SWAPP
      0086FB CD 84 F8         [ 4] 1478         CALL	ABSS
      0086FE CD 86 94         [ 4] 1479         CALL	UMSTA
      008701 CD 82 8F         [ 4] 1480         CALL	RFROM
      008704 CD 81 E9         [ 4] 1481         CALL	QBRAN
      008707 87 0C                 1482         .word	MSTA1
      008709 CD 84 BD         [ 4] 1483         CALL	DNEGA
      00870C 81               [ 4] 1484 MSTA1:	RET
                                   1485 
                                   1486 ;       . /MOD   ( n1 n2 n3 -- r q )
                                   1487 ;       Multiply n1 and n2, then divide
                                   1488 ;       by n3. Return mod and quotient.
      00870D 86 E6                 1489         .word      LINK
                           00068F  1490 LINK = . 
      00870F 05                    1491         .byte      5
      008710 2A 2F 4D 4F 44        1492         .ascii     "*/MOD"
      008715                       1493 SSMOD:
      008715 CD 82 AE         [ 4] 1494         CALL     TOR
      008718 CD 86 E9         [ 4] 1495         CALL     MSTAR
      00871B CD 82 8F         [ 4] 1496         CALL     RFROM
      00871E CC 86 19         [ 2] 1497         JP     MSMOD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1498 
                                   1499 ;       */      ( n1 n2 n3 -- q )
                                   1500 ;       Multiply n1 by n2, then divide
                                   1501 ;       by n3. Return quotient only.
      008721 87 0F                 1502         .word      LINK
                           0006A3  1503 LINK = . 
      008723 02                    1504         .byte      2
      008724 2A 2F                 1505         .ascii     "*/"
      008726                       1506 STASL:
      008726 CD 87 15         [ 4] 1507         CALL	SSMOD
      008729 CD 82 F5         [ 4] 1508         CALL	SWAPP
      00872C CC 82 DB         [ 2] 1509         JP	DROP
                                   1510 
                                   1511 ;; Miscellaneous
                                   1512 
                                   1513 ;       CELL+   ( a -- a )
                                   1514 ;       Add cell size in byte to address.
      00872F 87 23                 1515         .word      LINK
                           0006B1  1516 LINK = . 
      008731 02                    1517         .byte       2
      008732 32 2B                 1518         .ascii     "2+"
      008734                       1519 CELLP:
      008734 90 93            [ 1] 1520         LDW Y,X
      008736 90 FE            [ 2] 1521 	LDW Y,(Y)
      008738 72 A9 00 02      [ 2] 1522         ADDW Y,#CELLL 
      00873C FF               [ 2] 1523         LDW (X),Y
      00873D 81               [ 4] 1524         RET
                                   1525 
                                   1526 ;       CELL-   ( a -- a )
                                   1527 ;       Subtract 2 from address.
      00873E 87 31                 1528         .word      LINK
                           0006C0  1529 LINK = . 
      008740 02                    1530         .byte       2
      008741 32 2D                 1531         .ascii     "2-"
      008743                       1532 CELLM:
      008743 90 93            [ 1] 1533         LDW Y,X
      008745 90 FE            [ 2] 1534 	LDW Y,(Y)
      008747 72 A2 00 02      [ 2] 1535         SUBW Y,#CELLL
      00874B FF               [ 2] 1536         LDW (X),Y
      00874C 81               [ 4] 1537         RET
                                   1538 
                                   1539 ;       CELLS   ( n -- n )
                                   1540 ;       Multiply tos by 2.
      00874D 87 40                 1541         .word      LINK
                           0006CF  1542 LINK = . 
      00874F 02                    1543         .byte       2
      008750 32 2A                 1544         .ascii     "2*"
      008752                       1545 CELLS:
      008752 90 93            [ 1] 1546         LDW Y,X
      008754 90 FE            [ 2] 1547 	LDW Y,(Y)
      008756 90 58            [ 2] 1548         SLAW Y
      008758 FF               [ 2] 1549         LDW (X),Y
      008759 81               [ 4] 1550         RET
                                   1551 
                                   1552 ;       1+      ( a -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                   1553 ;       Add cell size in byte to address.
      00875A 87 4F                 1554         .word      LINK
                           0006DC  1555 LINK = . 
      00875C 02                    1556         .byte      2
      00875D 31 2B                 1557         .ascii     "1+"
      00875F                       1558 ONEP:
      00875F 90 93            [ 1] 1559         LDW Y,X
      008761 90 FE            [ 2] 1560 	LDW Y,(Y)
      008763 90 5C            [ 2] 1561         INCW Y
      008765 FF               [ 2] 1562         LDW (X),Y
      008766 81               [ 4] 1563         RET
                                   1564 
                                   1565 ;       1-      ( a -- a )
                                   1566 ;       Subtract 2 from address.
      008767 87 5C                 1567         .word      LINK
                           0006E9  1568 LINK = . 
      008769 02                    1569         .byte      2
      00876A 31 2D                 1570         .ascii     "1-"
      00876C                       1571 ONEM:
      00876C 90 93            [ 1] 1572         LDW Y,X
      00876E 90 FE            [ 2] 1573 	LDW Y,(Y)
      008770 90 5A            [ 2] 1574         DECW Y
      008772 FF               [ 2] 1575         LDW (X),Y
      008773 81               [ 4] 1576         RET
                                   1577 
                                   1578 ;       2/      ( n -- n )
                                   1579 ;       Multiply tos by 2.
      008774 87 69                 1580         .word      LINK
                           0006F6  1581 LINK = . 
      008776 02                    1582         .byte      2
      008777 32 2F                 1583         .ascii     "2/"
      008779                       1584 TWOSL:
      008779 90 93            [ 1] 1585         LDW Y,X
      00877B 90 FE            [ 2] 1586 	LDW Y,(Y)
      00877D 90 57            [ 2] 1587         SRAW Y
      00877F FF               [ 2] 1588         LDW (X),Y
      008780 81               [ 4] 1589         RET
                                   1590 
                                   1591 ;       BL      ( -- 32 )
                                   1592 ;       Return 32,  blank character.
      008781 87 76                 1593         .word      LINK
                           000703  1594 LINK = . 
      008783 02                    1595         .byte      2
      008784 42 4C                 1596         .ascii     "BL"
      008786                       1597 BLANK:
      008786 1D 00 02         [ 2] 1598         SUBW X,#2
      008789 90 AE 00 20      [ 2] 1599 	LDW Y,#32
      00878D FF               [ 2] 1600         LDW (X),Y
      00878E 81               [ 4] 1601         RET
                                   1602 
                                   1603 ;         0     ( -- 0)
                                   1604 ;         Return 0.
      00878F 87 83                 1605         .word      LINK
                           000711  1606 LINK = . 
      008791 01                    1607         .byte       1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008792 30                    1608         .ascii     "0"
      008793                       1609 ZERO:
      008793 1D 00 02         [ 2] 1610         SUBW X,#2
      008796 90 5F            [ 1] 1611 	CLRW Y
      008798 FF               [ 2] 1612         LDW (X),Y
      008799 81               [ 4] 1613         RET
                                   1614 
                                   1615 ;         1     ( -- 1)
                                   1616 ;         Return 1.
      00879A 87 91                 1617         .word      LINK
                           00071C  1618 LINK = . 
      00879C 01                    1619         .byte       1
      00879D 31                    1620         .ascii     "1"
      00879E                       1621 ONE:
      00879E 1D 00 02         [ 2] 1622         SUBW X,#2
      0087A1 90 AE 00 01      [ 2] 1623 	LDW Y,#1
      0087A5 FF               [ 2] 1624         LDW (X),Y
      0087A6 81               [ 4] 1625         RET
                                   1626 
                                   1627 ;         -1    ( -- -1)
                                   1628 ;         Return 32,  blank character.
      0087A7 87 9C                 1629         .word      LINK
                           000729  1630 LINK = . 
      0087A9 02                    1631         .byte       2
      0087AA 2D 31                 1632         .ascii     "-1"
      0087AC                       1633 MONE:
      0087AC 1D 00 02         [ 2] 1634         SUBW X,#2
      0087AF 90 AE FF FF      [ 2] 1635 	LDW Y,#0xFFFF
      0087B3 FF               [ 2] 1636         LDW (X),Y
      0087B4 81               [ 4] 1637         RET
                                   1638 
                                   1639 ;       >CHAR   ( c -- c )
                                   1640 ;       Filter non-printing characters.
      0087B5 87 A9                 1641         .word      LINK
                           000737  1642 LINK = . 
      0087B7 05                    1643         .byte      5
      0087B8 3E 43 48 41 52        1644         .ascii     ">CHAR"
      0087BD                       1645 TCHAR:
                           000001  1646 .if CONVERT_TO_CODE
      0087BD E6 01            [ 1] 1647         ld a,(1,x)
      0087BF A1 20            [ 1] 1648         cp a,#32  
      0087C1 2B 05            [ 1] 1649         jrmi 1$ 
      0087C3 A1 7F            [ 1] 1650         cp a,#127 
      0087C5 2A 01            [ 1] 1651         jrpl 1$ 
      0087C7 81               [ 4] 1652         ret 
      0087C8 A6 5F            [ 1] 1653 1$:     ld a,#'_ 
      0087CA E7 01            [ 1] 1654         ld (1,x),a 
      0087CC 81               [ 4] 1655         ret 
                           000000  1656 .else
                                   1657         CALL     DOLIT
                                   1658         .word       0x7F
                                   1659         CALL     ANDD
                                   1660         CALL     DUPP    ;mask msb
                                   1661         CALL     DOLIT
                                   1662         .word      127
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1663         CALL     BLANK
                                   1664         CALL     WITHI   ;check for printable
                                   1665         CALL     QBRAN
                                   1666         .word    TCHA1
                                   1667         CALL     DROP
                                   1668         CALL     DOLIT
                                   1669         .word     0x5F		; "_"     ;replace non-printables
                                   1670 .endif 
      0087CD 81               [ 4] 1671 TCHA1:  RET
                                   1672 
                                   1673 ;       DEPTH   ( -- n )
                                   1674 ;       Return  depth of  data stack.
      0087CE 87 B7                 1675         .word      LINK
                           000750  1676 LINK = . 
      0087D0 05                    1677         .byte      5
      0087D1 44 45 50 54 48        1678         .ascii     "DEPTH"
      0087D6                       1679 DEPTH: 
      0087D6 90 BE 22         [ 2] 1680         LDW Y,SP0    ;save data stack ptr
      0087D9 BF 1A            [ 2] 1681 	LDW XTEMP,X
      0087DB 72 B2 00 1A      [ 2] 1682         SUBW Y,XTEMP     ;#bytes = SP0 - X
      0087DF 90 57            [ 2] 1683         SRAW Y    ;Y = #stack items
                           000001  1684 .if PICATOUT_MOD
                                   1685 ; why ? 
                                   1686 ;      	DECW Y
                                   1687 .endif 
      0087E1 1D 00 02         [ 2] 1688 	SUBW X,#2
      0087E4 FF               [ 2] 1689         LDW (X),Y     ; if neg, underflow
      0087E5 81               [ 4] 1690         RET
                                   1691 
                                   1692 ;       PICK    ( ... +n -- ... w )
                                   1693 ;       Copy  nth stack item to tos.
      0087E6 87 D0                 1694         .word      LINK
                           000768  1695 LINK = . 
      0087E8 04                    1696         .byte      4
      0087E9 50 49 43 4B           1697         .ascii     "PICK"
      0087ED                       1698 PICK:
      0087ED 90 93            [ 1] 1699         LDW Y,X   ;D = n1
      0087EF 90 FE            [ 2] 1700         LDW Y,(Y)
      0087F1 90 58            [ 2] 1701         SLAW Y
      0087F3 BF 1A            [ 2] 1702         LDW XTEMP,X
      0087F5 72 B9 00 1A      [ 2] 1703         ADDW Y,XTEMP
      0087F9 90 FE            [ 2] 1704         LDW Y,(Y)
      0087FB FF               [ 2] 1705         LDW (X),Y
      0087FC 81               [ 4] 1706         RET
                                   1707 
                                   1708 ;; Memory access
                                   1709 
                                   1710 ;       +!      ( n a -- )
                                   1711 ;       Add n to  contents at address a.
      0087FD 87 E8                 1712         .word      LINK
                           00077F  1713 LINK = . 
      0087FF 02                    1714         .byte      2
      008800 2B 21                 1715         .ascii     "+!"
      008802                       1716 PSTOR:
                           000001  1717 .if CONVERT_TO_CODE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008802 90 93            [ 1] 1718         ldw y,x 
      008804 90 FE            [ 2] 1719         ldw y,(y)
      008806 90 BF 1C         [ 2] 1720         ldw YTEMP,y  ; address
      008809 90 FE            [ 2] 1721         ldw y,(y)  
      00880B 90 89            [ 2] 1722         pushw y  ; value at address 
      00880D 90 93            [ 1] 1723         ldw y,x 
      00880F 90 EE 02         [ 2] 1724         ldw y,(2,y) ; n 
      008812 72 F9 01         [ 2] 1725         addw y,(1,sp) ; n+value
      008815 91 CF 1C         [ 5] 1726         ldw [YTEMP],y ;  a!
      008818 90 85            [ 2] 1727         popw y    ;drop local var
      00881A 1C 00 04         [ 2] 1728         addw x,#4 ; DDROP 
      00881D 81               [ 4] 1729         ret 
                           000000  1730 .else
                                   1731         CALL	SWAPP
                                   1732         CALL	OVER
                                   1733         CALL	AT
                                   1734         CALL	PLUS
                                   1735         CALL	SWAPP
                                   1736         JP	STORE
                                   1737 .endif 
                                   1738 ;       2!      ( d a -- )
                                   1739 ;       Store  double integer to address a.
      00881E 87 FF                 1740         .word      LINK
                           0007A0  1741 LINK = . 
      008820 02                    1742         .byte      2
      008821 32 21                 1743         .ascii     "2!"
      008823                       1744 DSTOR:
                           000001  1745 .if CONVERT_TO_CODE
      008823 90 93            [ 1] 1746         ldw y,x 
      008825 90 FE            [ 2] 1747         ldw y,(y)
      008827 90 BF 1C         [ 2] 1748         ldw YTEMP,y ; address 
      00882A 1C 00 02         [ 2] 1749         addw x,#CELLL ; drop a 
      00882D 90 93            [ 1] 1750         ldw y,x 
      00882F 90 FE            [ 2] 1751         ldw y,(y) ; hi word 
      008831 89               [ 2] 1752         pushw x 
      008832 EE 02            [ 2] 1753         ldw x,(2,x) ; lo word 
      008834 91 CF 1C         [ 5] 1754         ldw [YTEMP],y
      008837 90 93            [ 1] 1755         ldw y,x 
      008839 AE 00 02         [ 2] 1756         ldw x,#2 
      00883C 92 DF 1C         [ 5] 1757         ldw ([YTEMP],x),y 
      00883F 85               [ 2] 1758         popw x 
      008840 1C 00 04         [ 2] 1759         addw x,#4 ; DDROP 
      008843 81               [ 4] 1760         ret 
                           000000  1761 .else
                                   1762         CALL	SWAPP
                                   1763         CALL	OVER
                                   1764         CALL	STORE
                                   1765         CALL	CELLP
                                   1766         JP	STORE
                                   1767 .endif 
                                   1768 ;       2@      ( a -- d )
                                   1769 ;       Fetch double integer from address a.
      008844 88 20                 1770         .word      LINK
                           0007C6  1771 LINK = . 
      008846 02                    1772         .byte      2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008847 32 40                 1773         .ascii     "2@"
      008849                       1774 DAT:
                           000001  1775 .if CONVERT_TO_CODE
      008849 90 93            [ 1] 1776         ldw y,x 
      00884B 90 FE            [ 2] 1777         ldw y,(y) ;address 
      00884D 90 BF 1C         [ 2] 1778         ldw YTEMP,y 
      008850 1D 00 02         [ 2] 1779         subw x,#CELLL ; space for udh 
      008853 91 CE 1C         [ 5] 1780         ldw y,[YTEMP] ; udh 
      008856 FF               [ 2] 1781         ldw (x),y 
      008857 90 AE 00 02      [ 2] 1782         ldw y,#2
      00885B 91 DE 1C         [ 5] 1783         ldw y,([YTEMP],y) ; udl 
      00885E EF 02            [ 2] 1784         ldw (2,x),y
      008860 81               [ 4] 1785         ret 
                           000000  1786 .else 
                                   1787         CALL	DUPP
                                   1788         CALL	CELLP
                                   1789         CALL	AT
                                   1790         CALL	SWAPP
                                   1791         JP	AT
                                   1792 .endif 
                                   1793 
                                   1794 ;       COUNT   ( b -- b +n )
                                   1795 ;       Return count byte of a string
                                   1796 ;       and add 1 to byte address.
      008861 88 46                 1797         .word      LINK
                           0007E3  1798 LINK = . 
      008863 05                    1799         .byte      5
      008864 43 4F 55 4E 54        1800         .ascii     "COUNT"
      008869                       1801 COUNT:
                           000001  1802 .if CONVERT_TO_CODE
      008869 90 93            [ 1] 1803         ldw y,x 
      00886B 90 FE            [ 2] 1804         ldw y,(y) ; address 
      00886D 90 F6            [ 1] 1805         ld a,(y)  ; count 
      00886F 90 5C            [ 2] 1806         incw y 
      008871 FF               [ 2] 1807         ldw (x),y 
      008872 1D 00 02         [ 2] 1808         subw x,#CELLL 
      008875 E7 01            [ 1] 1809         ld (1,x),a 
      008877 7F               [ 1] 1810         clr (x)
      008878 81               [ 4] 1811         ret 
                           000000  1812 .else 
                                   1813         CALL     DUPP
                                   1814         CALL     ONEP
                                   1815         CALL     SWAPP
                                   1816         JP     CAT
                                   1817 .endif 
                                   1818 
                                   1819 ;       HERE    ( -- a )
                                   1820 ;       Return  top of  code dictionary.
      008879 88 63                 1821         .word      LINK
                           0007FB  1822 LINK = . 
      00887B 04                    1823         .byte      4
      00887C 48 45 52 45           1824         .ascii     "HERE"
      008880                       1825 HERE:
                           000001  1826 .if CONVERT_TO_CODE
      008880 90 AE 00 16      [ 2] 1827       	ldw y,#UCP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008884 90 FE            [ 2] 1828         ldw y,(y)
      008886 1D 00 02         [ 2] 1829         subw x,#CELLL 
      008889 FF               [ 2] 1830         ldw (x),y 
      00888A 81               [ 4] 1831         ret 
                           000000  1832 .else
                                   1833         CALL     CPP
                                   1834         JP     AT
                                   1835 .endif 
                                   1836 
                                   1837 ;       PAD     ( -- a )
                                   1838 ;       Return address of text buffer
                                   1839 ;       above  code dictionary.
      00888B 88 7B                 1840         .word      LINK
                           00080D  1841 LINK = . 
      00888D 03                    1842         .byte      3
      00888E 50 41 44              1843         .ascii     "PAD"
      008891                       1844 PAD:
      008891 CD 88 80         [ 4] 1845         CALL     HERE
      008894 CD 81 B6         [ 4] 1846         CALL     DOLIT
      008897 00 50                 1847         .word      80
      008899 CC 84 80         [ 2] 1848         JP     PLUS
                                   1849 
                                   1850 ;       TIB     ( -- a )
                                   1851 ;       Return address of terminal input buffer.
      00889C 88 8D                 1852         .word      LINK
                           00081E  1853 LINK = . 
      00889E 03                    1854         .byte      3
      00889F 54 49 42              1855         .ascii     "TIB"
      0088A2                       1856 TIB:
      0088A2 CD 83 CE         [ 4] 1857         CALL     NTIB
      0088A5 CD 87 34         [ 4] 1858         CALL     CELLP
      0088A8 CC 82 3E         [ 2] 1859         JP     AT
                                   1860 
                                   1861 ;       @EXECUTE        ( a -- )
                                   1862 ;       Execute vector stored in address a.
      0088AB 88 9E                 1863         .word      LINK
                           00082D  1864 LINK = . 
      0088AD 08                    1865         .byte      8
      0088AE 40 45 58 45 43 55 54  1866         .ascii     "@EXECUTE"
             45
      0088B6                       1867 ATEXE:
      0088B6 CD 82 3E         [ 4] 1868         CALL     AT
      0088B9 CD 84 2F         [ 4] 1869         CALL     QDUP    ;?address or zero
      0088BC CD 81 E9         [ 4] 1870         CALL     QBRAN
      0088BF 88 C4                 1871         .word      EXE1
      0088C1 CD 82 10         [ 4] 1872         CALL     EXECU   ;execute if non-zero
      0088C4 81               [ 4] 1873 EXE1:   RET     ;do nothing if zero
                                   1874 
                                   1875 ;       CMOVE   ( b1 b2 u -- )
                                   1876 ;       Copy u bytes from b1 to b2.
      0088C5 88 AD                 1877         .word      LINK
                           000847  1878 LINK = . 
      0088C7 05                    1879         .byte      5
      0088C8 43 4D 4F 56 45        1880         .ascii     "CMOVE"
      0088CD                       1881 CMOVE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      0088CD CD 82 AE         [ 4] 1882         CALL	TOR
      0088D0 CD 82 00         [ 4] 1883         CALL	BRAN
      0088D3 88 ED                 1884         .word	CMOV2
      0088D5 CD 82 AE         [ 4] 1885 CMOV1:	CALL	TOR
      0088D8 CD 82 E5         [ 4] 1886         CALL	DUPP
      0088DB CD 82 5C         [ 4] 1887         CALL	CAT
      0088DE CD 82 A2         [ 4] 1888         CALL	RAT
      0088E1 CD 82 4B         [ 4] 1889         CALL	CSTOR
      0088E4 CD 87 5F         [ 4] 1890         CALL	ONEP
      0088E7 CD 82 8F         [ 4] 1891         CALL	RFROM
      0088EA CD 87 5F         [ 4] 1892         CALL	ONEP
      0088ED CD 81 CA         [ 4] 1893 CMOV2:	CALL	DONXT
      0088F0 88 D5                 1894         .word	CMOV1
      0088F2 CC 84 60         [ 2] 1895         JP	DDROP
                                   1896 
                                   1897 ;       FILL    ( b u c -- )
                                   1898 ;       Fill u bytes of character c
                                   1899 ;       to area beginning at b.
      0088F5 88 C7                 1900         .word       LINK
                           000877  1901 LINK = . 
      0088F7 04                    1902         .byte       4
      0088F8 46 49 4C 4C           1903         .ascii     "FILL"
      0088FC                       1904 FILL:
                           000001  1905 .if CONVERT_TO_CODE
      0088FC 90 93            [ 1] 1906         ldw y,x 
      0088FE 90 E6 01         [ 1] 1907         ld a,(1,y) ; c 
      008901 1C 00 02         [ 2] 1908         addw x,#CELLL ; drop c 
      008904 90 93            [ 1] 1909         ldw y,x 
      008906 90 FE            [ 2] 1910         ldw y,(y) ; count
      008908 90 89            [ 2] 1911         pushw y 
      00890A 1C 00 02         [ 2] 1912         addw x,#CELLL ; drop u 
      00890D 90 93            [ 1] 1913         ldw y,x 
      00890F 1C 00 02         [ 2] 1914         addw x,#CELLL ; drop b 
      008912 90 FE            [ 2] 1915         ldw y,(y) ; address
      008914 90 BF 1C         [ 2] 1916         ldw YTEMP,y
      008917 90 85            [ 2] 1917         popw y ; count 
      008919                       1918 FILL1:  
      008919 92 C7 1C         [ 4] 1919         ld [YTEMP],a 
      00891C 3C 1D            [ 1] 1920         inc YTEMP+1
      00891E 24 02            [ 1] 1921         jrnc FILL2 
      008920 3C 1C            [ 1] 1922         inc YTEMP
      008922                       1923 FILL2: 
      008922 90 5A            [ 2] 1924         decw y ; count 
      008924 26 F3            [ 1] 1925         jrne FILL1  
      008926 81               [ 4] 1926         ret 
                           000000  1927 .else 
                                   1928         CALL	SWAPP
                                   1929         CALL	TOR
                                   1930         CALL	SWAPP
                                   1931         CALL	BRAN
                                   1932         .word	FILL2
                                   1933 FILL1:	CALL	DDUP
                                   1934         CALL	CSTOR
                                   1935         CALL	ONEP
                                   1936 FILL2:	CALL	DONXT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                                   1937         .word	FILL1
                                   1938         JP	DDROP
                                   1939 .endif
                                   1940 
                                   1941 ;       ERASE   ( b u -- )
                                   1942 ;       Erase u bytes beginning at b.
      008927 88 F7                 1943         .word      LINK
                           0008A9  1944 LINK = . 
      008929 05                    1945         .byte      5
      00892A 45 52 41 53 45        1946         .ascii     "ERASE"
      00892F                       1947 ERASE:
                           000001  1948 .if CONVERT_TO_CODE
      00892F 90 5F            [ 1] 1949         clrw y 
      008931 1D 00 02         [ 2] 1950         subw x,#CELLL 
      008934 FF               [ 2] 1951         ldw (x),y 
      008935 CC 88 FC         [ 2] 1952         jp FILL 
                           000000  1953 .else 
                                   1954         CALL     ZERO
                                   1955         JP     FILL
                                   1956 .endif 
                                   1957 ;       PACK0x   ( b u a -- a )
                                   1958 ;       Build a counted string with
                                   1959 ;       u characters from b. Null fill.
      008938 89 29                 1960         .word      LINK
                           0008BA  1961 LINK = . 
      00893A 05                    1962         .byte      5
      00893B 50 41 43 4B 30 58     1963         .ascii     "PACK0X"
      008941                       1964 PACKS:
      008941 CD 82 E5         [ 4] 1965         CALL     DUPP
      008944 CD 82 AE         [ 4] 1966         CALL     TOR     ;strings only on cell boundary
      008947 CD 84 6B         [ 4] 1967         CALL     DDUP
      00894A CD 82 4B         [ 4] 1968         CALL     CSTOR
      00894D CD 87 5F         [ 4] 1969         CALL     ONEP ;save count
      008950 CD 82 F5         [ 4] 1970         CALL     SWAPP
      008953 CD 88 CD         [ 4] 1971         CALL     CMOVE
      008956 CD 82 8F         [ 4] 1972         CALL     RFROM
      008959 81               [ 4] 1973         RET
                                   1974 
                                   1975 ;; Numeric output, single precision
                                   1976 
                                   1977 ;       DIGIT   ( u -- c )
                                   1978 ;       Convert digit u to a character.
      00895A 89 3A                 1979         .word      LINK
                           0008DC  1980 LINK = . 
      00895C 05                    1981         .byte      5
      00895D 44 49 47 49 54        1982         .ascii     "DIGIT"
      008962                       1983 DIGIT:
      008962 CD 81 B6         [ 4] 1984         CALL	DOLIT
      008965 00 09                 1985         .word	9
      008967 CD 83 0F         [ 4] 1986         CALL	OVER
      00896A CD 85 43         [ 4] 1987         CALL	LESS
      00896D CD 81 B6         [ 4] 1988         CALL	DOLIT
      008970 00 07                 1989         .word	7
      008972 CD 83 31         [ 4] 1990         CALL	ANDD
      008975 CD 84 80         [ 4] 1991         CALL	PLUS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008978 CD 81 B6         [ 4] 1992         CALL	DOLIT
      00897B 00 30                 1993         .word	48	;'0'
      00897D CC 84 80         [ 2] 1994         JP	PLUS
                                   1995 
                                   1996 ;       EXTRACT ( n base -- n c )
                                   1997 ;       Extract least significant digit from n.
      008980 89 5C                 1998         .word      LINK
                           000902  1999 LINK = . 
      008982 07                    2000         .byte      7
      008983 45 58 54 52 41 43 54  2001         .ascii     "EXTRACT"
      00898A                       2002 EXTRC:
      00898A CD 87 93         [ 4] 2003         CALL     ZERO
      00898D CD 82 F5         [ 4] 2004         CALL     SWAPP
      008990 CD 85 BB         [ 4] 2005         CALL     UMMOD
      008993 CD 82 F5         [ 4] 2006         CALL     SWAPP
      008996 CC 89 62         [ 2] 2007         JP     DIGIT
                                   2008 
                                   2009 ;       <#      ( -- )
                                   2010 ;       Initiate  numeric output process.
      008999 89 82                 2011         .word      LINK
                           00091B  2012 LINK = . 
      00899B 02                    2013         .byte      2
      00899C 3C 23                 2014         .ascii     "<#"
      00899E                       2015 BDIGS:
      00899E CD 88 91         [ 4] 2016         CALL     PAD
      0089A1 CD 83 EE         [ 4] 2017         CALL     HLD
      0089A4 CC 82 27         [ 2] 2018         JP     STORE
                                   2019 
                                   2020 ;       HOLD    ( c -- )
                                   2021 ;       Insert a character into output string.
      0089A7 89 9B                 2022         .word      LINK
                           000929  2023 LINK = . 
      0089A9 04                    2024         .byte      4
      0089AA 48 4F 4C 44           2025         .ascii     "HOLD"
      0089AE                       2026 HOLD:
      0089AE CD 83 EE         [ 4] 2027         CALL     HLD
      0089B1 CD 82 3E         [ 4] 2028         CALL     AT
      0089B4 CD 87 6C         [ 4] 2029         CALL     ONEM
      0089B7 CD 82 E5         [ 4] 2030         CALL     DUPP
      0089BA CD 83 EE         [ 4] 2031         CALL     HLD
      0089BD CD 82 27         [ 4] 2032         CALL     STORE
      0089C0 CC 82 4B         [ 2] 2033         JP     CSTOR
                                   2034 
                                   2035 ;       #       ( u -- u )
                                   2036 ;       Extract one digit from u and
                                   2037 ;       append digit to output string.
      0089C3 89 A9                 2038         .word      LINK
                           000945  2039 LINK = . 
      0089C5 01                    2040         .byte      1
      0089C6 23                    2041         .ascii     "#"
      0089C7                       2042 DIG:
      0089C7 CD 83 A0         [ 4] 2043         CALL     BASE
      0089CA CD 82 3E         [ 4] 2044         CALL     AT
      0089CD CD 89 8A         [ 4] 2045         CALL     EXTRC
      0089D0 CC 89 AE         [ 2] 2046         JP     HOLD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   2047 
                                   2048 ;       #S      ( u -- 0 )
                                   2049 ;       Convert u until all digits
                                   2050 ;       are added to output string.
      0089D3 89 C5                 2051         .word      LINK
                           000955  2052 LINK = . 
      0089D5 02                    2053         .byte      2
      0089D6 23 53                 2054         .ascii     "#S"
      0089D8                       2055 DIGS:
      0089D8 CD 89 C7         [ 4] 2056 DIGS1:  CALL     DIG
      0089DB CD 82 E5         [ 4] 2057         CALL     DUPP
      0089DE CD 81 E9         [ 4] 2058         CALL     QBRAN
      0089E1 89 E5                 2059         .word      DIGS2
      0089E3 20 F3            [ 2] 2060         JRA     DIGS1
      0089E5 81               [ 4] 2061 DIGS2:  RET
                                   2062 
                                   2063 ;       SIGN    ( n -- )
                                   2064 ;       Add a minus sign to
                                   2065 ;       numeric output string.
      0089E6 89 D5                 2066         .word      LINK
                           000968  2067 LINK = . 
      0089E8 04                    2068         .byte      4
      0089E9 53 49 47 4E           2069         .ascii     "SIGN"
      0089ED                       2070 SIGN:
      0089ED CD 83 1E         [ 4] 2071         CALL     ZLESS
      0089F0 CD 81 E9         [ 4] 2072         CALL     QBRAN
      0089F3 89 FD                 2073         .word      SIGN1
      0089F5 CD 81 B6         [ 4] 2074         CALL     DOLIT
      0089F8 00 2D                 2075         .word      45	;"-"
      0089FA CC 89 AE         [ 2] 2076         JP     HOLD
      0089FD 81               [ 4] 2077 SIGN1:  RET
                                   2078 
                                   2079 ;       #>      ( w -- b u )
                                   2080 ;       Prepare output string.
      0089FE 89 E8                 2081         .word      LINK
                           000980  2082 LINK = . 
      008A00 02                    2083         .byte      2
      008A01 23 3E                 2084         .ascii     "#>"
      008A03                       2085 EDIGS:
      008A03 CD 82 DB         [ 4] 2086         CALL     DROP
      008A06 CD 83 EE         [ 4] 2087         CALL     HLD
      008A09 CD 82 3E         [ 4] 2088         CALL     AT
      008A0C CD 88 91         [ 4] 2089         CALL     PAD
      008A0F CD 83 0F         [ 4] 2090         CALL     OVER
      008A12 CC 84 DE         [ 2] 2091         JP     SUBB
                                   2092 
                                   2093 ;       str     ( w -- b u )
                                   2094 ;       Convert a signed integer
                                   2095 ;       to a numeric string.
      008A15 8A 00                 2096         .word      LINK
                           000997  2097 LINK = . 
      008A17 03                    2098         .byte      3
      008A18 53 54 52              2099         .ascii     "STR"
      008A1B                       2100 STR:
      008A1B CD 82 E5         [ 4] 2101         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008A1E CD 82 AE         [ 4] 2102         CALL     TOR
      008A21 CD 84 F8         [ 4] 2103         CALL     ABSS
      008A24 CD 89 9E         [ 4] 2104         CALL     BDIGS
      008A27 CD 89 D8         [ 4] 2105         CALL     DIGS
      008A2A CD 82 8F         [ 4] 2106         CALL     RFROM
      008A2D CD 89 ED         [ 4] 2107         CALL     SIGN
      008A30 CC 8A 03         [ 2] 2108         JP     EDIGS
                                   2109 
                                   2110 ;       HEX     ( -- )
                                   2111 ;       Use radix 16 as base for
                                   2112 ;       numeric conversions.
      008A33 8A 17                 2113         .word      LINK
                           0009B5  2114 LINK = . 
      008A35 03                    2115         .byte      3
      008A36 48 45 58              2116         .ascii     "HEX"
      008A39                       2117 HEX:
      008A39 CD 81 B6         [ 4] 2118         CALL     DOLIT
      008A3C 00 10                 2119         .word      16
      008A3E CD 83 A0         [ 4] 2120         CALL     BASE
      008A41 CC 82 27         [ 2] 2121         JP     STORE
                                   2122 
                                   2123 ;       DECIMAL ( -- )
                                   2124 ;       Use radix 10 as base
                                   2125 ;       for numeric conversions.
      008A44 8A 35                 2126         .word      LINK
                           0009C6  2127 LINK = . 
      008A46 07                    2128         .byte      7
      008A47 44 45 43 49 4D 41 4C  2129         .ascii     "DECIMAL"
      008A4E                       2130 DECIM:
      008A4E CD 81 B6         [ 4] 2131         CALL     DOLIT
      008A51 00 0A                 2132         .word      10
      008A53 CD 83 A0         [ 4] 2133         CALL     BASE
      008A56 CC 82 27         [ 2] 2134         JP     STORE
                                   2135 
                                   2136 ;; Numeric input, single precision
                                   2137 
                                   2138 ;       DIGIT?  ( c base -- u t )
                                   2139 ;       Convert a character to its numeric
                                   2140 ;       value. A flag indicates success.
      008A59 8A 46                 2141         .word      LINK
                           0009DB  2142 LINK = . 
      008A5B 06                    2143         .byte       6
      008A5C 44 49 47 49 54 3F     2144         .ascii     "DIGIT?"
      008A62                       2145 DIGTQ:
      008A62 CD 82 AE         [ 4] 2146         CALL     TOR
      008A65 CD 81 B6         [ 4] 2147         CALL     DOLIT
      008A68 00 30                 2148         .word     48	; "0"
      008A6A CD 84 DE         [ 4] 2149         CALL     SUBB
      008A6D CD 81 B6         [ 4] 2150         CALL     DOLIT
      008A70 00 09                 2151         .word      9
      008A72 CD 83 0F         [ 4] 2152         CALL     OVER
      008A75 CD 85 43         [ 4] 2153         CALL     LESS
      008A78 CD 81 E9         [ 4] 2154         CALL     QBRAN
      008A7B 8A 93                 2155         .word      DGTQ1
      008A7D CD 81 B6         [ 4] 2156         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008A80 00 07                 2157         .word      7
      008A82 CD 84 DE         [ 4] 2158         CALL     SUBB
      008A85 CD 82 E5         [ 4] 2159         CALL     DUPP
      008A88 CD 81 B6         [ 4] 2160         CALL     DOLIT
      008A8B 00 0A                 2161         .word      10
      008A8D CD 85 43         [ 4] 2162         CALL     LESS
      008A90 CD 83 45         [ 4] 2163         CALL     ORR
      008A93 CD 82 E5         [ 4] 2164 DGTQ1:  CALL     DUPP
      008A96 CD 82 8F         [ 4] 2165         CALL     RFROM
      008A99 CC 85 25         [ 2] 2166         JP     ULESS
                                   2167 
                                   2168 ;       NUMBER? ( a -- n T | a F )
                                   2169 ;       Convert a number string to
                                   2170 ;       integer. Push a flag on tos.
      008A9C 8A 5B                 2171         .word      LINK
                           000A1E  2172 LINK = . 
      008A9E 07                    2173         .byte      7
      008A9F 4E 55 4D 42 45 52 3F  2174         .ascii     "NUMBER?"
      008AA6                       2175 NUMBQ:
      008AA6 CD 83 A0         [ 4] 2176         CALL     BASE
      008AA9 CD 82 3E         [ 4] 2177         CALL     AT
      008AAC CD 82 AE         [ 4] 2178         CALL     TOR
      008AAF CD 87 93         [ 4] 2179         CALL     ZERO
      008AB2 CD 83 0F         [ 4] 2180         CALL     OVER
      008AB5 CD 88 69         [ 4] 2181         CALL     COUNT
      008AB8 CD 83 0F         [ 4] 2182         CALL     OVER
      008ABB CD 82 5C         [ 4] 2183         CALL     CAT
      008ABE CD 81 B6         [ 4] 2184         CALL     DOLIT
      008AC1 00 24                 2185         .word     36	; "0x"
      008AC3 CD 85 06         [ 4] 2186         CALL     EQUAL
      008AC6 CD 81 E9         [ 4] 2187         CALL     QBRAN
      008AC9 8A DA                 2188         .word      NUMQ1
      008ACB CD 8A 39         [ 4] 2189         CALL     HEX
      008ACE CD 82 F5         [ 4] 2190         CALL     SWAPP
      008AD1 CD 87 5F         [ 4] 2191         CALL     ONEP
      008AD4 CD 82 F5         [ 4] 2192         CALL     SWAPP
      008AD7 CD 87 6C         [ 4] 2193         CALL     ONEM
      008ADA CD 83 0F         [ 4] 2194 NUMQ1:  CALL     OVER
      008ADD CD 82 5C         [ 4] 2195         CALL     CAT
      008AE0 CD 81 B6         [ 4] 2196         CALL     DOLIT
      008AE3 00 2D                 2197         .word     45	; "-"
      008AE5 CD 85 06         [ 4] 2198         CALL     EQUAL
      008AE8 CD 82 AE         [ 4] 2199         CALL     TOR
      008AEB CD 82 F5         [ 4] 2200         CALL     SWAPP
      008AEE CD 82 A2         [ 4] 2201         CALL     RAT
      008AF1 CD 84 DE         [ 4] 2202         CALL     SUBB
      008AF4 CD 82 F5         [ 4] 2203         CALL     SWAPP
      008AF7 CD 82 A2         [ 4] 2204         CALL     RAT
      008AFA CD 84 80         [ 4] 2205         CALL     PLUS
      008AFD CD 84 2F         [ 4] 2206         CALL     QDUP
      008B00 CD 81 E9         [ 4] 2207         CALL     QBRAN
      008B03 8B 64                 2208         .word      NUMQ6
      008B05 CD 87 6C         [ 4] 2209         CALL     ONEM
      008B08 CD 82 AE         [ 4] 2210         CALL     TOR
      008B0B CD 82 E5         [ 4] 2211 NUMQ2:  CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008B0E CD 82 AE         [ 4] 2212         CALL     TOR
      008B11 CD 82 5C         [ 4] 2213         CALL     CAT
      008B14 CD 83 A0         [ 4] 2214         CALL     BASE
      008B17 CD 82 3E         [ 4] 2215         CALL     AT
      008B1A CD 8A 62         [ 4] 2216         CALL     DIGTQ
      008B1D CD 81 E9         [ 4] 2217         CALL     QBRAN
      008B20 8B 52                 2218         .word      NUMQ4
      008B22 CD 82 F5         [ 4] 2219         CALL     SWAPP
      008B25 CD 83 A0         [ 4] 2220         CALL     BASE
      008B28 CD 82 3E         [ 4] 2221         CALL     AT
      008B2B CD 86 DE         [ 4] 2222         CALL     STAR
      008B2E CD 84 80         [ 4] 2223         CALL     PLUS
      008B31 CD 82 8F         [ 4] 2224         CALL     RFROM
      008B34 CD 87 5F         [ 4] 2225         CALL     ONEP
      008B37 CD 81 CA         [ 4] 2226         CALL     DONXT
      008B3A 8B 0B                 2227         .word      NUMQ2
      008B3C CD 82 A2         [ 4] 2228         CALL     RAT
      008B3F CD 82 F5         [ 4] 2229         CALL     SWAPP
      008B42 CD 82 DB         [ 4] 2230         CALL     DROP
      008B45 CD 81 E9         [ 4] 2231         CALL     QBRAN
      008B48 8B 4D                 2232         .word      NUMQ3
      008B4A CD 84 AB         [ 4] 2233         CALL     NEGAT
      008B4D CD 82 F5         [ 4] 2234 NUMQ3:  CALL     SWAPP
      008B50 20 0F            [ 2] 2235         JRA     NUMQ5
      008B52 CD 82 8F         [ 4] 2236 NUMQ4:  CALL     RFROM
      008B55 CD 82 8F         [ 4] 2237         CALL     RFROM
      008B58 CD 84 60         [ 4] 2238         CALL     DDROP
      008B5B CD 84 60         [ 4] 2239         CALL     DDROP
      008B5E CD 87 93         [ 4] 2240         CALL     ZERO
      008B61 CD 82 E5         [ 4] 2241 NUMQ5:  CALL     DUPP
      008B64 CD 82 8F         [ 4] 2242 NUMQ6:  CALL     RFROM
      008B67 CD 84 60         [ 4] 2243         CALL     DDROP
      008B6A CD 82 8F         [ 4] 2244         CALL     RFROM
      008B6D CD 83 A0         [ 4] 2245         CALL     BASE
      008B70 CC 82 27         [ 2] 2246         JP     STORE
                                   2247 
                                   2248 ;; Basic I/O
                                   2249 
                                   2250 ;       KEY     ( -- c )
                                   2251 ;       Wait for and return an
                                   2252 ;       input character.
      008B73 8A 9E                 2253         .word      LINK
                           000AF5  2254 LINK = . 
      008B75 03                    2255         .byte      3
      008B76 4B 45 59              2256         .ascii     "KEY"
      008B79                       2257 KEY:
                           000001  2258 .if CONVERT_TO_CODE
      008B79 72 0B 52 30 FB   [ 2] 2259         btjf UART1_SR,#UART_SR_RXNE,. 
      008B7E C6 52 31         [ 1] 2260         ld a,UART1_DR 
      008B81 1D 00 02         [ 2] 2261         subw x,#CELLL 
      008B84 E7 01            [ 1] 2262         ld (1,x),a 
      008B86 7F               [ 1] 2263         clr (x)
      008B87 81               [ 4] 2264         ret 
                           000000  2265 .else 
                                   2266 KEY1:   CALL     QKEY
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   2267         CALL     QBRAN
                                   2268         .word      KEY1
                                   2269         RET
                                   2270 .endif 
                                   2271 
                                   2272 ;       NUF?    ( -- t )
                                   2273 ;       Return false if no input,
                                   2274 ;       else pause and if CR return true.
      008B88 8B 75                 2275         .word      LINK
                           000B0A  2276 LINK = . 
      008B8A 04                    2277         .byte      4
      008B8B 4E 55 46 3F           2278         .ascii     "NUF?"
      008B8F                       2279 NUFQ:
      008B8F CD 81 82         [ 4] 2280         CALL     QKEY
      008B92 CD 82 E5         [ 4] 2281         CALL     DUPP
      008B95 CD 81 E9         [ 4] 2282         CALL     QBRAN
      008B98 8B A8                 2283         .word    NUFQ1
      008B9A CD 84 60         [ 4] 2284         CALL     DDROP
      008B9D CD 8B 79         [ 4] 2285         CALL     KEY
      008BA0 CD 81 B6         [ 4] 2286         CALL     DOLIT
      008BA3 00 0D                 2287         .word      CRR
      008BA5 CC 85 06         [ 2] 2288         JP     EQUAL
      008BA8 81               [ 4] 2289 NUFQ1:  RET
                                   2290 
                                   2291 ;       SPACE   ( -- )
                                   2292 ;       Send  blank character to
                                   2293 ;       output device.
      008BA9 8B 8A                 2294         .word      LINK
                           000B2B  2295 LINK = . 
      008BAB 05                    2296         .byte      5
      008BAC 53 50 41 43 45        2297         .ascii     "SPACE"
      008BB1                       2298 SPACE:
      008BB1 CD 87 86         [ 4] 2299         CALL     BLANK
      008BB4 CC 81 A0         [ 2] 2300         JP     EMIT
                                   2301 
                                   2302 ;       SPACES  ( +n -- )
                                   2303 ;       Send n spaces to output device.
      008BB7 8B AB                 2304         .word      LINK
                           000B39  2305 LINK = . 
      008BB9 06                    2306         .byte      6
      008BBA 53 50 41 43 45 53     2307         .ascii     "SPACES"
      008BC0                       2308 SPACS:
      008BC0 CD 87 93         [ 4] 2309         CALL     ZERO
      008BC3 CD 85 63         [ 4] 2310         CALL     MAX
      008BC6 CD 82 AE         [ 4] 2311         CALL     TOR
      008BC9 20 03            [ 2] 2312         JRA      CHAR2
      008BCB CD 8B B1         [ 4] 2313 CHAR1:  CALL     SPACE
      008BCE CD 81 CA         [ 4] 2314 CHAR2:  CALL     DONXT
      008BD1 8B CB                 2315         .word    CHAR1
      008BD3 81               [ 4] 2316         RET
                                   2317 
                                   2318 ;       TYPE    ( b u -- )
                                   2319 ;       Output u characters from b.
      008BD4 8B B9                 2320         .word      LINK
                           000B56  2321 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008BD6 04                    2322         .byte      4
      008BD7 54 59 50 45           2323         .ascii     "TYPE"
      008BDB                       2324 TYPES:
      008BDB CD 82 AE         [ 4] 2325         CALL     TOR
      008BDE 20 0C            [ 2] 2326         JRA     TYPE2
      008BE0 CD 82 E5         [ 4] 2327 TYPE1:  CALL     DUPP
      008BE3 CD 82 5C         [ 4] 2328         CALL     CAT
      008BE6 CD 81 A0         [ 4] 2329         CALL     EMIT
      008BE9 CD 87 5F         [ 4] 2330         CALL     ONEP
      008BEC CD 81 CA         [ 4] 2331 TYPE2:  CALL     DONXT
      008BEF 8B E0                 2332         .word      TYPE1
      008BF1 CC 82 DB         [ 2] 2333         JP     DROP
                                   2334 
                                   2335 ;       CR      ( -- )
                                   2336 ;       Output a carriage return
                                   2337 ;       and a line feed.
      008BF4 8B D6                 2338         .word      LINK
                           000B76  2339 LINK = . 
      008BF6 02                    2340         .byte      2
      008BF7 43 52                 2341         .ascii     "CR"
      008BF9                       2342 CR:
      008BF9 CD 81 B6         [ 4] 2343         CALL     DOLIT
      008BFC 00 0D                 2344         .word      CRR
      008BFE CD 81 A0         [ 4] 2345         CALL     EMIT
      008C01 CD 81 B6         [ 4] 2346         CALL     DOLIT
      008C04 00 0A                 2347         .word      LF
      008C06 CC 81 A0         [ 2] 2348         JP     EMIT
                                   2349 
                                   2350 ;       do$     ( -- a )
                                   2351 ;       Return  address of a compiled
                                   2352 ;       string.
      008C09 8B F6                 2353         .word      LINK
                           000B8B  2354 LINK = . 
      008C0B 43                    2355 	.byte      COMPO+3
      008C0C 44 4F 24              2356         .ascii     "DO$"
      008C0F                       2357 DOSTR:
      008C0F CD 82 8F         [ 4] 2358         CALL     RFROM
      008C12 CD 82 A2         [ 4] 2359         CALL     RAT
      008C15 CD 82 8F         [ 4] 2360         CALL     RFROM
      008C18 CD 88 69         [ 4] 2361         CALL     COUNT
      008C1B CD 84 80         [ 4] 2362         CALL     PLUS
      008C1E CD 82 AE         [ 4] 2363         CALL     TOR
      008C21 CD 82 F5         [ 4] 2364         CALL     SWAPP
      008C24 CD 82 AE         [ 4] 2365         CALL     TOR
      008C27 81               [ 4] 2366         RET
                                   2367 
                                   2368 ;       $"|     ( -- a )
                                   2369 ;       Run time routine compiled by $".
                                   2370 ;       Return address of a compiled string.
      008C28 8C 0B                 2371         .word      LINK
                           000BAA  2372 LINK = . 
      008C2A 43                    2373 	.byte      COMPO+3
      008C2B 24 22 7C              2374         .byte     '$','"','|'
      008C2E                       2375 STRQP:
      008C2E CD 8C 0F         [ 4] 2376         CALL     DOSTR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008C31 81               [ 4] 2377         RET
                                   2378 
                                   2379 ;       ."|     ( -- )
                                   2380 ;       Run time routine of ." .
                                   2381 ;       Output a compiled string.
      008C32 8C 2A                 2382         .word      LINK
                           000BB4  2383 LINK = . 
      008C34 43                    2384 	.byte      COMPO+3
      008C35 2E 22 7C              2385         .byte     '.','"','|'
      008C38                       2386 DOTQP:
      008C38 CD 8C 0F         [ 4] 2387         CALL     DOSTR
      008C3B CD 88 69         [ 4] 2388         CALL     COUNT
      008C3E CC 8B DB         [ 2] 2389         JP     TYPES
                                   2390 
                                   2391 ;       .R      ( n +n -- )
                                   2392 ;       Display an integer in a field
                                   2393 ;       of n columns, right justified.
      008C41 8C 34                 2394         .word      LINK
                           000BC3  2395 LINK = . 
      008C43 02                    2396         .byte      2
      008C44 2E 52                 2397         .ascii     ".R"
      008C46                       2398 DOTR:
      008C46 CD 82 AE         [ 4] 2399         CALL     TOR
      008C49 CD 8A 1B         [ 4] 2400         CALL     STR
      008C4C CD 82 8F         [ 4] 2401         CALL     RFROM
      008C4F CD 83 0F         [ 4] 2402         CALL     OVER
      008C52 CD 84 DE         [ 4] 2403         CALL     SUBB
      008C55 CD 8B C0         [ 4] 2404         CALL     SPACS
      008C58 CC 8B DB         [ 2] 2405         JP     TYPES
                                   2406 
                                   2407 ;       U.R     ( u +n -- )
                                   2408 ;       Display an unsigned integer
                                   2409 ;       in n column, right justified.
      008C5B 8C 43                 2410         .word      LINK
                           000BDD  2411 LINK = . 
      008C5D 03                    2412         .byte      3
      008C5E 55 2E 52              2413         .ascii     "U.R"
      008C61                       2414 UDOTR:
      008C61 CD 82 AE         [ 4] 2415         CALL     TOR
      008C64 CD 89 9E         [ 4] 2416         CALL     BDIGS
      008C67 CD 89 D8         [ 4] 2417         CALL     DIGS
      008C6A CD 8A 03         [ 4] 2418         CALL     EDIGS
      008C6D CD 82 8F         [ 4] 2419         CALL     RFROM
      008C70 CD 83 0F         [ 4] 2420         CALL     OVER
      008C73 CD 84 DE         [ 4] 2421         CALL     SUBB
      008C76 CD 8B C0         [ 4] 2422         CALL     SPACS
      008C79 CC 8B DB         [ 2] 2423         JP     TYPES
                                   2424 
                                   2425 ;       U.      ( u -- )
                                   2426 ;       Display an unsigned integer
                                   2427 ;       in free format.
      008C7C 8C 5D                 2428         .word      LINK
                           000BFE  2429 LINK = . 
      008C7E 02                    2430         .byte      2
      008C7F 55 2E                 2431         .ascii     "U."
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008C81                       2432 UDOT:
      008C81 CD 89 9E         [ 4] 2433         CALL     BDIGS
      008C84 CD 89 D8         [ 4] 2434         CALL     DIGS
      008C87 CD 8A 03         [ 4] 2435         CALL     EDIGS
      008C8A CD 8B B1         [ 4] 2436         CALL     SPACE
      008C8D CC 8B DB         [ 2] 2437         JP     TYPES
                                   2438 
                                   2439 ;       .       ( w -- )
                                   2440 ;       Display an integer in free
                                   2441 ;       format, preceeded by a space.
      008C90 8C 7E                 2442         .word      LINK
                           000C12  2443 LINK = . 
      008C92 01                    2444         .byte      1
      008C93 2E                    2445         .ascii     "."
      008C94                       2446 DOT:
      008C94 CD 83 A0         [ 4] 2447         CALL     BASE
      008C97 CD 82 3E         [ 4] 2448         CALL     AT
      008C9A CD 81 B6         [ 4] 2449         CALL     DOLIT
      008C9D 00 0A                 2450         .word      10
      008C9F CD 83 5A         [ 4] 2451         CALL     XORR    ;?decimal
      008CA2 CD 81 E9         [ 4] 2452         CALL     QBRAN
      008CA5 8C AA                 2453         .word      DOT1
      008CA7 CC 8C 81         [ 2] 2454         JP     UDOT
      008CAA CD 8A 1B         [ 4] 2455 DOT1:   CALL     STR
      008CAD CD 8B B1         [ 4] 2456         CALL     SPACE
      008CB0 CC 8B DB         [ 2] 2457         JP     TYPES
                                   2458 
                                   2459 ;       ?       ( a -- )
                                   2460 ;       Display contents in memory cell.
      008CB3 8C 92                 2461         .word      LINK
                                   2462         
                           000C35  2463 LINK = . 
      008CB5 01                    2464         .byte      1
      008CB6 3F                    2465         .ascii     "?"
      008CB7                       2466 QUEST:
      008CB7 CD 82 3E         [ 4] 2467         CALL     AT
      008CBA CC 8C 94         [ 2] 2468         JP     DOT
                                   2469 
                                   2470 ;; Parsing
                                   2471 
                                   2472 ;       parse   ( b u c -- b u delta ; <string> )
                                   2473 ;       Scan string delimited by c.
                                   2474 ;       Return found string and its offset.
      008CBD 8C B5                 2475         .word      LINK
                           000C3F  2476 LINK = . 
      008CBF 05                    2477         .byte      5
      008CC0 70 61 72 73 65        2478         .ascii     "parse"
      008CC5                       2479 PARS:
      008CC5 CD 83 AF         [ 4] 2480         CALL     TEMP
      008CC8 CD 82 27         [ 4] 2481         CALL     STORE
      008CCB CD 83 0F         [ 4] 2482         CALL     OVER
      008CCE CD 82 AE         [ 4] 2483         CALL     TOR
      008CD1 CD 82 E5         [ 4] 2484         CALL     DUPP
      008CD4 CD 81 E9         [ 4] 2485         CALL     QBRAN
      008CD7 8D 7D                 2486         .word    PARS8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008CD9 CD 87 6C         [ 4] 2487         CALL     ONEM
      008CDC CD 83 AF         [ 4] 2488         CALL     TEMP
      008CDF CD 82 3E         [ 4] 2489         CALL     AT
      008CE2 CD 87 86         [ 4] 2490         CALL     BLANK
      008CE5 CD 85 06         [ 4] 2491         CALL     EQUAL
      008CE8 CD 81 E9         [ 4] 2492         CALL     QBRAN
      008CEB 8D 1E                 2493         .word      PARS3
      008CED CD 82 AE         [ 4] 2494         CALL     TOR
      008CF0 CD 87 86         [ 4] 2495 PARS1:  CALL     BLANK
      008CF3 CD 83 0F         [ 4] 2496         CALL     OVER
      008CF6 CD 82 5C         [ 4] 2497         CALL     CAT     ;skip leading blanks ONLY
      008CF9 CD 84 DE         [ 4] 2498         CALL     SUBB
      008CFC CD 83 1E         [ 4] 2499         CALL     ZLESS
      008CFF CD 84 9A         [ 4] 2500         CALL     INVER
      008D02 CD 81 E9         [ 4] 2501         CALL     QBRAN
      008D05 8D 1B                 2502         .word      PARS2
      008D07 CD 87 5F         [ 4] 2503         CALL     ONEP
      008D0A CD 81 CA         [ 4] 2504         CALL     DONXT
      008D0D 8C F0                 2505         .word      PARS1
      008D0F CD 82 8F         [ 4] 2506         CALL     RFROM
      008D12 CD 82 DB         [ 4] 2507         CALL     DROP
      008D15 CD 87 93         [ 4] 2508         CALL     ZERO
      008D18 CC 82 E5         [ 2] 2509         JP     DUPP
      008D1B CD 82 8F         [ 4] 2510 PARS2:  CALL     RFROM
      008D1E CD 83 0F         [ 4] 2511 PARS3:  CALL     OVER
      008D21 CD 82 F5         [ 4] 2512         CALL     SWAPP
      008D24 CD 82 AE         [ 4] 2513         CALL     TOR
      008D27 CD 83 AF         [ 4] 2514 PARS4:  CALL     TEMP
      008D2A CD 82 3E         [ 4] 2515         CALL     AT
      008D2D CD 83 0F         [ 4] 2516         CALL     OVER
      008D30 CD 82 5C         [ 4] 2517         CALL     CAT
      008D33 CD 84 DE         [ 4] 2518         CALL     SUBB    ;scan for delimiter
      008D36 CD 83 AF         [ 4] 2519         CALL     TEMP
      008D39 CD 82 3E         [ 4] 2520         CALL     AT
      008D3C CD 87 86         [ 4] 2521         CALL     BLANK
      008D3F CD 85 06         [ 4] 2522         CALL     EQUAL
      008D42 CD 81 E9         [ 4] 2523         CALL     QBRAN
      008D45 8D 4A                 2524         .word      PARS5
      008D47 CD 83 1E         [ 4] 2525         CALL     ZLESS
      008D4A CD 81 E9         [ 4] 2526 PARS5:  CALL     QBRAN
      008D4D 8D 5F                 2527         .word      PARS6
      008D4F CD 87 5F         [ 4] 2528         CALL     ONEP
      008D52 CD 81 CA         [ 4] 2529         CALL     DONXT
      008D55 8D 27                 2530         .word      PARS4
      008D57 CD 82 E5         [ 4] 2531         CALL     DUPP
      008D5A CD 82 AE         [ 4] 2532         CALL     TOR
      008D5D 20 0F            [ 2] 2533         JRA     PARS7
      008D5F CD 82 8F         [ 4] 2534 PARS6:  CALL     RFROM
      008D62 CD 82 DB         [ 4] 2535         CALL     DROP
      008D65 CD 82 E5         [ 4] 2536         CALL     DUPP
      008D68 CD 87 5F         [ 4] 2537         CALL     ONEP
      008D6B CD 82 AE         [ 4] 2538         CALL     TOR
      008D6E CD 83 0F         [ 4] 2539 PARS7:  CALL     OVER
      008D71 CD 84 DE         [ 4] 2540         CALL     SUBB
      008D74 CD 82 8F         [ 4] 2541         CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008D77 CD 82 8F         [ 4] 2542         CALL     RFROM
      008D7A CC 84 DE         [ 2] 2543         JP     SUBB
      008D7D CD 83 0F         [ 4] 2544 PARS8:  CALL     OVER
      008D80 CD 82 8F         [ 4] 2545         CALL     RFROM
      008D83 CC 84 DE         [ 2] 2546         JP     SUBB
                                   2547 
                                   2548 ;       PARSE   ( c -- b u ; <string> )
                                   2549 ;       Scan input stream and return
                                   2550 ;       counted string delimited by c.
      008D86 8C BF                 2551         .word      LINK
                           000D08  2552 LINK = . 
      008D88 05                    2553         .byte      5
      008D89 50 41 52 53 45        2554         .ascii     "PARSE"
      008D8E                       2555 PARSE:
      008D8E CD 82 AE         [ 4] 2556         CALL     TOR
      008D91 CD 88 A2         [ 4] 2557         CALL     TIB
      008D94 CD 83 BE         [ 4] 2558         CALL     INN
      008D97 CD 82 3E         [ 4] 2559         CALL     AT
      008D9A CD 84 80         [ 4] 2560         CALL     PLUS    ;current input buffer pointer
      008D9D CD 83 CE         [ 4] 2561         CALL     NTIB
      008DA0 CD 82 3E         [ 4] 2562         CALL     AT
      008DA3 CD 83 BE         [ 4] 2563         CALL     INN
      008DA6 CD 82 3E         [ 4] 2564         CALL     AT
      008DA9 CD 84 DE         [ 4] 2565         CALL     SUBB    ;remaining count
      008DAC CD 82 8F         [ 4] 2566         CALL     RFROM
      008DAF CD 8C C5         [ 4] 2567         CALL     PARS
      008DB2 CD 83 BE         [ 4] 2568         CALL     INN
      008DB5 CC 88 02         [ 2] 2569         JP     PSTOR
                                   2570 
                                   2571 ;       .(      ( -- )
                                   2572 ;       Output following string up to next ) .
      008DB8 8D 88                 2573         .word      LINK
                           000D3A  2574 LINK = . 
      008DBA 82                    2575 	.byte      IMEDD+2
      008DBB 2E 28                 2576         .ascii     ".("
      008DBD                       2577 DOTPR:
      008DBD CD 81 B6         [ 4] 2578         CALL     DOLIT
      008DC0 00 29                 2579         .word     41	; ")"
      008DC2 CD 8D 8E         [ 4] 2580         CALL     PARSE
      008DC5 CC 8B DB         [ 2] 2581         JP     TYPES
                                   2582 
                                   2583 ;       (       ( -- )
                                   2584 ;       Ignore following string up to next ).
                                   2585 ;       A comment.
      008DC8 8D BA                 2586         .word      LINK
                           000D4A  2587 LINK = . 
      008DCA 81                    2588 	.byte      IMEDD+1
      008DCB 28                    2589         .ascii     "("
      008DCC                       2590 PAREN:
      008DCC CD 81 B6         [ 4] 2591         CALL     DOLIT
      008DCF 00 29                 2592         .word     41	; ")"
      008DD1 CD 8D 8E         [ 4] 2593         CALL     PARSE
      008DD4 CC 84 60         [ 2] 2594         JP     DDROP
                                   2595 
                                   2596 ;       \       ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2597 ;       Ignore following text till
                                   2598 ;       end of line.
      008DD7 8D CA                 2599         .word      LINK
                           000D59  2600 LINK = . 
      008DD9 81                    2601 	.byte      IMEDD+1
      008DDA 5C                    2602         .ascii     "\"
      008DDB                       2603 BKSLA:
                           000001  2604 .if CONVERT_TO_CODE
      008DDB 90 AE 00 0C      [ 2] 2605         ldw y,#UCTIB ; #TIB  
      008DDF 90 FE            [ 2] 2606         ldw y,(y)
      008DE1 90 89            [ 2] 2607         pushw y ; count in TIB 
      008DE3 90 AE 00 0A      [ 2] 2608         ldw y,#UINN ; >IN 
      008DE7 90 BF 1C         [ 2] 2609         ldw YTEMP,y
      008DEA 90 85            [ 2] 2610         popw y 
      008DEC 91 CF 1C         [ 5] 2611         ldw [YTEMP],y
      008DEF 81               [ 4] 2612         ret 
                           000000  2613 .else
                                   2614         CALL     NTIB
                                   2615         CALL     AT
                                   2616         CALL     INN
                                   2617         JP     STORE
                                   2618 .endif 
                                   2619 
                                   2620 ;       WORD    ( c -- a ; <string> )
                                   2621 ;       Parse a word from input stream
                                   2622 ;       and copy it to code dictionary.
      008DF0 8D D9                 2623         .word      LINK
                           000D72  2624 LINK = . 
      008DF2 04                    2625         .byte      4
      008DF3 57 4F 52 44           2626         .ascii     "WORD"
      008DF7                       2627 WORDD:
      008DF7 CD 8D 8E         [ 4] 2628         CALL     PARSE
      008DFA CD 88 80         [ 4] 2629         CALL     HERE
      008DFD CD 87 34         [ 4] 2630         CALL     CELLP
      008E00 CC 89 41         [ 2] 2631         JP     PACKS
                                   2632 
                                   2633 ;       TOKEN   ( -- a ; <string> )
                                   2634 ;       Parse a word from input stream
                                   2635 ;       and copy it to name dictionary.
      008E03 8D F2                 2636         .word      LINK
                           000D85  2637 LINK = . 
      008E05 05                    2638         .byte      5
      008E06 54 4F 4B 45 4E        2639         .ascii     "TOKEN"
      008E0B                       2640 TOKEN:
      008E0B CD 87 86         [ 4] 2641         CALL     BLANK
      008E0E CC 8D F7         [ 2] 2642         JP     WORDD
                                   2643 
                                   2644 ;; Dictionary search
                                   2645 
                                   2646 ;       NAME>   ( na -- ca )
                                   2647 ;       Return a code address given
                                   2648 ;       a name address.
      008E11 8E 05                 2649         .word      LINK
                           000D93  2650 LINK = . 
      008E13 05                    2651         .byte      5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008E14 4E 41 4D 45 3E        2652         .ascii     "NAME>"
      008E19                       2653 NAMET:
      008E19 CD 88 69         [ 4] 2654         CALL     COUNT
      008E1C CD 81 B6         [ 4] 2655         CALL     DOLIT
      008E1F 00 1F                 2656         .word      31
      008E21 CD 83 31         [ 4] 2657         CALL     ANDD
      008E24 CC 84 80         [ 2] 2658         JP     PLUS
                                   2659 
                                   2660 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   2661 ;       Compare u cells in two
                                   2662 ;       strings. Return 0 if identical.
      008E27 8E 13                 2663         .word      LINK
                           000DA9  2664 LINK = . 
      008E29 05                    2665         .byte       5
      008E2A 53 41 4D 45 3F        2666         .ascii     "SAME?"
      008E2F                       2667 SAMEQ:
      008E2F CD 87 6C         [ 4] 2668         CALL     ONEM
      008E32 CD 82 AE         [ 4] 2669         CALL     TOR
      008E35 20 29            [ 2] 2670         JRA     SAME2
      008E37 CD 83 0F         [ 4] 2671 SAME1:  CALL     OVER
      008E3A CD 82 A2         [ 4] 2672         CALL     RAT
      008E3D CD 84 80         [ 4] 2673         CALL     PLUS
      008E40 CD 82 5C         [ 4] 2674         CALL     CAT
      008E43 CD 83 0F         [ 4] 2675         CALL     OVER
      008E46 CD 82 A2         [ 4] 2676         CALL     RAT
      008E49 CD 84 80         [ 4] 2677         CALL     PLUS
      008E4C CD 82 5C         [ 4] 2678         CALL     CAT
      008E4F CD 84 DE         [ 4] 2679         CALL     SUBB
      008E52 CD 84 2F         [ 4] 2680         CALL     QDUP
      008E55 CD 81 E9         [ 4] 2681         CALL     QBRAN
      008E58 8E 60                 2682         .word      SAME2
      008E5A CD 82 8F         [ 4] 2683         CALL     RFROM
      008E5D CC 82 DB         [ 2] 2684         JP     DROP
      008E60 CD 81 CA         [ 4] 2685 SAME2:  CALL     DONXT
      008E63 8E 37                 2686         .word      SAME1
      008E65 CC 87 93         [ 2] 2687         JP     ZERO
                                   2688 
                                   2689 ;       find    ( a va -- ca na | a F )
                                   2690 ;       Search vocabulary for string.
                                   2691 ;       Return ca and na if succeeded.
      008E68 8E 29                 2692         .word      LINK
                           000DEA  2693 LINK = . 
      008E6A 04                    2694         .byte      4
      008E6B 46 49 4E 44           2695         .ascii     "FIND"
      008E6F                       2696 FIND:
      008E6F CD 82 F5         [ 4] 2697         CALL     SWAPP
      008E72 CD 82 E5         [ 4] 2698         CALL     DUPP
      008E75 CD 82 5C         [ 4] 2699         CALL     CAT
      008E78 CD 83 AF         [ 4] 2700         CALL     TEMP
      008E7B CD 82 27         [ 4] 2701         CALL     STORE
      008E7E CD 82 E5         [ 4] 2702         CALL     DUPP
      008E81 CD 82 3E         [ 4] 2703         CALL     AT
      008E84 CD 82 AE         [ 4] 2704         CALL     TOR
      008E87 CD 87 34         [ 4] 2705         CALL     CELLP
      008E8A CD 82 F5         [ 4] 2706         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008E8D CD 82 3E         [ 4] 2707 FIND1:  CALL     AT
      008E90 CD 82 E5         [ 4] 2708         CALL     DUPP
      008E93 CD 81 E9         [ 4] 2709         CALL     QBRAN
      008E96 8E CC                 2710         .word      FIND6
      008E98 CD 82 E5         [ 4] 2711         CALL     DUPP
      008E9B CD 82 3E         [ 4] 2712         CALL     AT
      008E9E CD 81 B6         [ 4] 2713         CALL     DOLIT
      008EA1 1F 7F                 2714         .word      MASKK
      008EA3 CD 83 31         [ 4] 2715         CALL     ANDD
      008EA6 CD 82 A2         [ 4] 2716         CALL     RAT
      008EA9 CD 83 5A         [ 4] 2717         CALL     XORR
      008EAC CD 81 E9         [ 4] 2718         CALL     QBRAN
      008EAF 8E BB                 2719         .word      FIND2
      008EB1 CD 87 34         [ 4] 2720         CALL     CELLP
      008EB4 CD 81 B6         [ 4] 2721         CALL     DOLIT
      008EB7 FF FF                 2722         .word     0xFFFF
      008EB9 20 0C            [ 2] 2723         JRA     FIND3
      008EBB CD 87 34         [ 4] 2724 FIND2:  CALL     CELLP
      008EBE CD 83 AF         [ 4] 2725         CALL     TEMP
      008EC1 CD 82 3E         [ 4] 2726         CALL     AT
      008EC4 CD 8E 2F         [ 4] 2727         CALL     SAMEQ
      008EC7 CD 82 00         [ 4] 2728 FIND3:  CALL     BRAN
      008ECA 8E DB                 2729         .word      FIND4
      008ECC CD 82 8F         [ 4] 2730 FIND6:  CALL     RFROM
      008ECF CD 82 DB         [ 4] 2731         CALL     DROP
      008ED2 CD 82 F5         [ 4] 2732         CALL     SWAPP
      008ED5 CD 87 43         [ 4] 2733         CALL     CELLM
      008ED8 CC 82 F5         [ 2] 2734         JP     SWAPP
      008EDB CD 81 E9         [ 4] 2735 FIND4:  CALL     QBRAN
      008EDE 8E E8                 2736         .word      FIND5
      008EE0 CD 87 43         [ 4] 2737         CALL     CELLM
      008EE3 CD 87 43         [ 4] 2738         CALL     CELLM
      008EE6 20 A5            [ 2] 2739         JRA     FIND1
      008EE8 CD 82 8F         [ 4] 2740 FIND5:  CALL     RFROM
      008EEB CD 82 DB         [ 4] 2741         CALL     DROP
      008EEE CD 82 F5         [ 4] 2742         CALL     SWAPP
      008EF1 CD 82 DB         [ 4] 2743         CALL     DROP
      008EF4 CD 87 43         [ 4] 2744         CALL     CELLM
      008EF7 CD 82 E5         [ 4] 2745         CALL     DUPP
      008EFA CD 8E 19         [ 4] 2746         CALL     NAMET
      008EFD CC 82 F5         [ 2] 2747         JP     SWAPP
                                   2748 
                                   2749 ;       NAME?   ( a -- ca na | a F )
                                   2750 ;       Search vocabularies for a string.
      008F00 8E 6A                 2751         .word      LINK
                           000E82  2752 LINK = . 
      008F02 05                    2753         .byte      5
      008F03 4E 41 4D 45 3F        2754         .ascii     "NAME?"
      008F08                       2755 NAMEQ:
      008F08 CD 84 01         [ 4] 2756         CALL   CNTXT
      008F0B CC 8E 6F         [ 2] 2757         JP     FIND
                                   2758 
                                   2759 ;; Terminal response
                                   2760 
                                   2761 ;       ^H      ( bot eot cur -- bot eot cur )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2762 ;       Backup cursor by one character.
      008F0E 8F 02                 2763         .word      LINK
                           000E90  2764 LINK = . 
      008F10 02                    2765         .byte      2
      008F11 5E 48                 2766         .ascii     "^H"
      008F13                       2767 BKSP:
      008F13 CD 82 AE         [ 4] 2768         CALL     TOR
      008F16 CD 83 0F         [ 4] 2769         CALL     OVER
      008F19 CD 82 8F         [ 4] 2770         CALL     RFROM
      008F1C CD 82 F5         [ 4] 2771         CALL     SWAPP
      008F1F CD 83 0F         [ 4] 2772         CALL     OVER
      008F22 CD 83 5A         [ 4] 2773         CALL     XORR
      008F25 CD 81 E9         [ 4] 2774         CALL     QBRAN
      008F28 8F 43                 2775         .word      BACK1
      008F2A CD 81 B6         [ 4] 2776         CALL     DOLIT
      008F2D 00 08                 2777         .word      BKSPP
      008F2F CD 81 A0         [ 4] 2778         CALL     EMIT
      008F32 CD 87 6C         [ 4] 2779         CALL     ONEM
      008F35 CD 87 86         [ 4] 2780         CALL     BLANK
      008F38 CD 81 A0         [ 4] 2781         CALL     EMIT
      008F3B CD 81 B6         [ 4] 2782         CALL     DOLIT
      008F3E 00 08                 2783         .word      BKSPP
      008F40 CC 81 A0         [ 2] 2784         JP     EMIT
      008F43 81               [ 4] 2785 BACK1:  RET
                                   2786 
                                   2787 ;       TAP     ( bot eot cur c -- bot eot cur )
                                   2788 ;       Accept and echo key stroke
                                   2789 ;       and bump cursor.
      008F44 8F 10                 2790         .word      LINK
                           000EC6  2791 LINK = . 
      008F46 03                    2792         .byte      3
      008F47 54 41 50              2793         .ascii     "TAP"
      008F4A                       2794 TAP:
      008F4A CD 82 E5         [ 4] 2795         CALL     DUPP
      008F4D CD 81 A0         [ 4] 2796         CALL     EMIT
      008F50 CD 83 0F         [ 4] 2797         CALL     OVER
      008F53 CD 82 4B         [ 4] 2798         CALL     CSTOR
      008F56 CC 87 5F         [ 2] 2799         JP     ONEP
                                   2800 
                                   2801 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   2802 ;       Process a key stroke,
                                   2803 ;       CR or backspace.
      008F59 8F 46                 2804         .word      LINK
                           000EDB  2805 LINK = . 
      008F5B 04                    2806         .byte      4
      008F5C 4B 54 41 50           2807         .ascii     "KTAP"
      008F60                       2808 KTAP:
      008F60 CD 82 E5         [ 4] 2809         CALL     DUPP
      008F63 CD 81 B6         [ 4] 2810         CALL     DOLIT
      008F66 00 0D                 2811         .word      CRR
      008F68 CD 83 5A         [ 4] 2812         CALL     XORR
      008F6B CD 81 E9         [ 4] 2813         CALL     QBRAN
      008F6E 8F 86                 2814         .word      KTAP2
      008F70 CD 81 B6         [ 4] 2815         CALL     DOLIT
      008F73 00 08                 2816         .word      BKSPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008F75 CD 83 5A         [ 4] 2817         CALL     XORR
      008F78 CD 81 E9         [ 4] 2818         CALL     QBRAN
      008F7B 8F 83                 2819         .word      KTAP1
      008F7D CD 87 86         [ 4] 2820         CALL     BLANK
      008F80 CC 8F 4A         [ 2] 2821         JP     TAP
      008F83 CC 8F 13         [ 2] 2822 KTAP1:  JP     BKSP
      008F86 CD 82 DB         [ 4] 2823 KTAP2:  CALL     DROP
      008F89 CD 82 F5         [ 4] 2824         CALL     SWAPP
      008F8C CD 82 DB         [ 4] 2825         CALL     DROP
      008F8F CC 82 E5         [ 2] 2826         JP     DUPP
                                   2827 
                                   2828 ;       accept  ( b u -- b u )
                                   2829 ;       Accept characters to input
                                   2830 ;       buffer. Return with actual count.
      008F92 8F 5B                 2831         .word      LINK
                           000F14  2832 LINK = . 
      008F94 06                    2833         .byte      6
      008F95 41 43 43 45 50 54     2834         .ascii     "ACCEPT"
      008F9B                       2835 ACCEP:
      008F9B CD 83 0F         [ 4] 2836         CALL     OVER
      008F9E CD 84 80         [ 4] 2837         CALL     PLUS
      008FA1 CD 83 0F         [ 4] 2838         CALL     OVER
      008FA4 CD 84 6B         [ 4] 2839 ACCP1:  CALL     DDUP
      008FA7 CD 83 5A         [ 4] 2840         CALL     XORR
      008FAA CD 81 E9         [ 4] 2841         CALL     QBRAN
      008FAD 8F CF                 2842         .word      ACCP4
      008FAF CD 8B 79         [ 4] 2843         CALL     KEY
      008FB2 CD 82 E5         [ 4] 2844         CALL     DUPP
      008FB5 CD 87 86         [ 4] 2845         CALL     BLANK
      008FB8 CD 81 B6         [ 4] 2846         CALL     DOLIT
      008FBB 00 7F                 2847         .word      127
      008FBD CD 85 A0         [ 4] 2848         CALL     WITHI
      008FC0 CD 81 E9         [ 4] 2849         CALL     QBRAN
      008FC3 8F CA                 2850         .word      ACCP2
      008FC5 CD 8F 4A         [ 4] 2851         CALL     TAP
      008FC8 20 03            [ 2] 2852         JRA     ACCP3
      008FCA CD 8F 60         [ 4] 2853 ACCP2:  CALL     KTAP
      008FCD 20 D5            [ 2] 2854 ACCP3:  JRA     ACCP1
      008FCF CD 82 DB         [ 4] 2855 ACCP4:  CALL     DROP
      008FD2 CD 83 0F         [ 4] 2856         CALL     OVER
      008FD5 CC 84 DE         [ 2] 2857         JP     SUBB
                                   2858 
                                   2859 ;       QUERY   ( -- )
                                   2860 ;       Accept input stream to
                                   2861 ;       terminal input buffer.
      008FD8 8F 94                 2862         .word      LINK
                                   2863         
                           000F5A  2864 LINK = . 
      008FDA 05                    2865         .byte      5
      008FDB 51 55 45 52 59        2866         .ascii     "QUERY"
      008FE0                       2867 QUERY:
      008FE0 CD 88 A2         [ 4] 2868         CALL     TIB
      008FE3 CD 81 B6         [ 4] 2869         CALL     DOLIT
      008FE6 00 50                 2870         .word      80
      008FE8 CD 8F 9B         [ 4] 2871         CALL     ACCEP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008FEB CD 83 CE         [ 4] 2872         CALL     NTIB
      008FEE CD 82 27         [ 4] 2873         CALL     STORE
      008FF1 CD 82 DB         [ 4] 2874         CALL     DROP
      008FF4 CD 87 93         [ 4] 2875         CALL     ZERO
      008FF7 CD 83 BE         [ 4] 2876         CALL     INN
      008FFA CC 82 27         [ 2] 2877         JP     STORE
                                   2878 
                                   2879 ;       ABORT   ( -- )
                                   2880 ;       Reset data stack and
                                   2881 ;       jump to QUIT.
      008FFD 8F DA                 2882         .word      LINK
                           000F7F  2883 LINK = . 
      008FFF 05                    2884         .byte      5
      009000 41 42 4F 52 54        2885         .ascii     "ABORT"
      009005                       2886 ABORT:
      009005 CD 90 FC         [ 4] 2887         CALL     PRESE
      009008 CC 91 19         [ 2] 2888         JP     QUIT
                                   2889 
                                   2890 ;       abort"  ( f -- )
                                   2891 ;       Run time routine of ABORT".
                                   2892 ;       Abort with a message.
      00900B 8F FF                 2893         .word      LINK
                           000F8D  2894 LINK = . 
      00900D 46                    2895 	.byte      COMPO+6
      00900E 41 42 4F 52 54        2896         .ascii     "ABORT"
      009013 22                    2897         .byte      '"'
      009014                       2898 ABORQ:
      009014 CD 81 E9         [ 4] 2899         CALL     QBRAN
      009017 90 33                 2900         .word      ABOR2   ;text flag
      009019 CD 8C 0F         [ 4] 2901         CALL     DOSTR
      00901C CD 8B B1         [ 4] 2902 ABOR1:  CALL     SPACE
      00901F CD 88 69         [ 4] 2903         CALL     COUNT
      009022 CD 8B DB         [ 4] 2904         CALL     TYPES
      009025 CD 81 B6         [ 4] 2905         CALL     DOLIT
      009028 00 3F                 2906         .word     63 ; "?"
      00902A CD 81 A0         [ 4] 2907         CALL     EMIT
      00902D CD 8B F9         [ 4] 2908         CALL     CR
      009030 CC 90 05         [ 2] 2909         JP     ABORT   ;pass error string
      009033 CD 8C 0F         [ 4] 2910 ABOR2:  CALL     DOSTR
      009036 CC 82 DB         [ 2] 2911         JP     DROP
                                   2912 
                                   2913 ;; The text interpreter
                                   2914 
                                   2915 ;       $INTERPRET      ( a -- )
                                   2916 ;       Interpret a word. If failed,
                                   2917 ;       try to convert it to an integer.
      009039 90 0D                 2918         .word      LINK
                           000FBB  2919 LINK = . 
      00903B 0A                    2920         .byte      10
      00903C 24 49 4E 54 45 52 50  2921         .ascii     "$INTERPRET"
             52 45 54
      009046                       2922 INTER:
      009046 CD 8F 08         [ 4] 2923         CALL     NAMEQ
      009049 CD 84 2F         [ 4] 2924         CALL     QDUP    ;?defined
      00904C CD 81 E9         [ 4] 2925         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      00904F 90 70                 2926         .word      INTE1
      009051 CD 82 3E         [ 4] 2927         CALL     AT
      009054 CD 81 B6         [ 4] 2928         CALL     DOLIT
      009057 40 00                 2929 	.word       0x4000	; COMPO*256
      009059 CD 83 31         [ 4] 2930         CALL     ANDD    ;?compile only lexicon bits
      00905C CD 90 14         [ 4] 2931         CALL     ABORQ
      00905F 0D                    2932         .byte      13
      009060 20 63 6F 6D 70 69 6C  2933         .ascii     " compile only"
             65 20 6F 6E 6C 79
      00906D CC 82 10         [ 2] 2934         JP     EXECU
      009070 CD 8A A6         [ 4] 2935 INTE1:  CALL     NUMBQ   ;convert a number
      009073 CD 81 E9         [ 4] 2936         CALL     QBRAN
      009076 90 1C                 2937         .word    ABOR1
      009078 81               [ 4] 2938         RET
                                   2939 
                                   2940 ;       [       ( -- )
                                   2941 ;       Start  text interpreter.
      009079 90 3B                 2942         .word      LINK
                           000FFB  2943 LINK = . 
      00907B 81                    2944 	.byte      IMEDD+1
      00907C 5B                    2945         .ascii     "["
      00907D                       2946 LBRAC:
      00907D CD 81 B6         [ 4] 2947         CALL     DOLIT
      009080 90 46                 2948         .word      INTER
      009082 CD 83 DF         [ 4] 2949         CALL     TEVAL
      009085 CC 82 27         [ 2] 2950         JP     STORE
                                   2951 
                                   2952 ;       .OK     ( -- )
                                   2953 ;       Display 'ok' while interpreting.
      009088 90 7B                 2954         .word      LINK
                           00100A  2955 LINK = . 
      00908A 03                    2956         .byte      3
      00908B 2E 4F 4B              2957         .ascii     ".OK"
      00908E                       2958 DOTOK:
      00908E CD 81 B6         [ 4] 2959         CALL     DOLIT
      009091 90 46                 2960         .word      INTER
      009093 CD 83 DF         [ 4] 2961         CALL     TEVAL
      009096 CD 82 3E         [ 4] 2962         CALL     AT
      009099 CD 85 06         [ 4] 2963         CALL     EQUAL
      00909C CD 81 E9         [ 4] 2964         CALL     QBRAN
      00909F 90 A8                 2965         .word      DOTO1
      0090A1 CD 8C 38         [ 4] 2966         CALL     DOTQP
      0090A4 03                    2967         .byte      3
      0090A5 20 6F 6B              2968         .ascii     " ok"
      0090A8 CC 8B F9         [ 2] 2969 DOTO1:  JP     CR
                                   2970 
                                   2971 ;       ?STACK  ( -- )
                                   2972 ;       Abort if stack underflows.
      0090AB 90 8A                 2973         .word      LINK
                           00102D  2974 LINK = . 
      0090AD 06                    2975         .byte      6
      0090AE 3F 53 54 41 43 4B     2976         .ascii     "?STACK"
      0090B4                       2977 QSTAC: 
      0090B4 CD 87 D6         [ 4] 2978         CALL     DEPTH
      0090B7 CD 83 1E         [ 4] 2979         CALL     ZLESS   ;check only for underflow
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      0090BA CD 90 14         [ 4] 2980         CALL     ABORQ
      0090BD 0B                    2981         .byte      11
      0090BE 20 75 6E 64 65 72 66  2982         .ascii     " underflow "
             6C 6F 77 20
      0090C9 81               [ 4] 2983         RET
                                   2984 
                                   2985 ;       EVAL    ( -- )
                                   2986 ;       Interpret  input stream.
      0090CA 90 AD                 2987         .word      LINK
                           00104C  2988 LINK = . 
      0090CC 04                    2989         .byte      4
      0090CD 45 56 41 4C           2990         .ascii     "EVAL"
      0090D1                       2991 EVAL:
      0090D1 CD 8E 0B         [ 4] 2992 EVAL1:  CALL     TOKEN
      0090D4 CD 82 E5         [ 4] 2993         CALL     DUPP
      0090D7 CD 82 5C         [ 4] 2994         CALL     CAT     ;?input stream empty
      0090DA CD 81 E9         [ 4] 2995         CALL     QBRAN
      0090DD 90 ED                 2996         .word    EVAL2
      0090DF CD 83 DF         [ 4] 2997         CALL     TEVAL
      0090E2 CD 88 B6         [ 4] 2998         CALL     ATEXE
      0090E5 CD 90 B4         [ 4] 2999         CALL     QSTAC   ;evaluate input, check stack
      0090E8 CD 82 00         [ 4] 3000         CALL     BRAN
      0090EB 90 D1                 3001         .word    EVAL1
      0090ED CD 82 DB         [ 4] 3002 EVAL2:  CALL     DROP
      0090F0 CC 90 8E         [ 2] 3003         JP       DOTOK
                                   3004 
                                   3005 ;       PRESET  ( -- )
                                   3006 ;       Reset data stack pointer and
                                   3007 ;       terminal input buffer.
      0090F3 90 CC                 3008         .word      LINK
                           001075  3009 LINK = . 
      0090F5 06                    3010         .byte      6
      0090F6 50 52 45 53 45 54     3011         .ascii     "PRESET"
      0090FC                       3012 PRESE:
      0090FC CD 81 B6         [ 4] 3013         CALL     DOLIT
      0090FF 16 F0                 3014         .word      SPP
      009101 CD 82 D2         [ 4] 3015         CALL     SPSTO
      009104 CD 81 B6         [ 4] 3016         CALL     DOLIT
      009107 17 00                 3017         .word      TIBB
      009109 CD 83 CE         [ 4] 3018         CALL     NTIB
      00910C CD 87 34         [ 4] 3019         CALL     CELLP
      00910F CC 82 27         [ 2] 3020         JP     STORE
                                   3021 
                                   3022 ;       QUIT    ( -- )
                                   3023 ;       Reset return stack pointer
                                   3024 ;       and start text interpreter.
      009112 90 F5                 3025         .word      LINK
                           001094  3026 LINK = . 
      009114 04                    3027         .byte      4
      009115 51 55 49 54           3028         .ascii     "QUIT"
      009119                       3029 QUIT:
      009119 CD 81 B6         [ 4] 3030         CALL     DOLIT
      00911C 17 FF                 3031         .word      RPP
      00911E CD 82 79         [ 4] 3032         CALL     RPSTO   ;reset return stack pointer
      009121 CD 90 7D         [ 4] 3033 QUIT1:  CALL     LBRAC   ;start interpretation
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      009124 CD 8F E0         [ 4] 3034 QUIT2:  CALL     QUERY   ;get input
      009127 CD 90 D1         [ 4] 3035         CALL     EVAL
      00912A 20 F8            [ 2] 3036         JRA     QUIT2   ;continue till error
                                   3037 
                                   3038 ;; The compiler
                                   3039 
                                   3040 ;       '       ( -- ca )
                                   3041 ;       Search vocabularies for
                                   3042 ;       next word in input stream.
      00912C 91 14                 3043         .word      LINK
                           0010AE  3044 LINK = . 
      00912E 01                    3045         .byte      1
      00912F 27                    3046         .ascii     "'"
      009130                       3047 TICK:
      009130 CD 8E 0B         [ 4] 3048         CALL     TOKEN
      009133 CD 8F 08         [ 4] 3049         CALL     NAMEQ   ;?defined
      009136 CD 81 E9         [ 4] 3050         CALL     QBRAN
      009139 90 1C                 3051         .word      ABOR1
      00913B 81               [ 4] 3052         RET     ;yes, push code address
                                   3053 
                                   3054 ;       ALLOT   ( n -- )
                                   3055 ;       Allocate n bytes to  code dictionary.
      00913C 91 2E                 3056         .word      LINK
                           0010BE  3057 LINK = . 
      00913E 05                    3058         .byte      5
      00913F 41 4C 4C 4F 54        3059         .ascii     "ALLOT"
      009144                       3060 ALLOT:
      009144 CD 84 0F         [ 4] 3061         CALL     CPP
      009147 CC 88 02         [ 2] 3062         JP     PSTOR
                                   3063 
                                   3064 ;       ,       ( w -- )
                                   3065 ;         Compile an integer into
                                   3066 ;         code dictionary.
      00914A 91 3E                 3067         .word      LINK
                           0010CC  3068 LINK = . 
      00914C 01                    3069         .byte      1
      00914D 2C                    3070         .ascii     ","
      00914E                       3071 COMMA:
      00914E CD 88 80         [ 4] 3072         CALL     HERE
      009151 CD 82 E5         [ 4] 3073         CALL     DUPP
      009154 CD 87 34         [ 4] 3074         CALL     CELLP   ;cell boundary
      009157 CD 84 0F         [ 4] 3075         CALL     CPP
      00915A CD 82 27         [ 4] 3076         CALL     STORE
      00915D CC 82 27         [ 2] 3077         JP     STORE
                                   3078 
                                   3079 ;       C,      ( c -- )
                                   3080 ;       Compile a byte into
                                   3081 ;       code dictionary.
      009160 91 4C                 3082        .word      LINK
                           0010E2  3083 LINK = . 
      009162 02                    3084         .byte      2
      009163 43 2C                 3085         .ascii     "C,"
      009165                       3086 CCOMMA:
      009165 CD 88 80         [ 4] 3087         CALL     HERE
      009168 CD 82 E5         [ 4] 3088         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      00916B CD 87 5F         [ 4] 3089         CALL     ONEP
      00916E CD 84 0F         [ 4] 3090         CALL     CPP
      009171 CD 82 27         [ 4] 3091         CALL     STORE
      009174 CC 82 4B         [ 2] 3092         JP     CSTOR
                                   3093 
                                   3094 ;       [COMPILE]       ( -- ; <string> )
                                   3095 ;       Compile next immediate
                                   3096 ;       word into code dictionary.
      009177 91 62                 3097         .word      LINK
                           0010F9  3098 LINK = . 
      009179 89                    3099 	.byte      IMEDD+9
      00917A 5B 43 4F 4D 50 49 4C  3100         .ascii     "[COMPILE]"
             45 5D
      009183                       3101 BCOMP:
      009183 CD 91 30         [ 4] 3102         CALL     TICK
      009186 CC 93 DF         [ 2] 3103         JP     JSRC
                                   3104 
                                   3105 ;       COMPILE ( -- )
                                   3106 ;       Compile next jsr in
                                   3107 ;       colon list to code dictionary.
      009189 91 79                 3108         .word      LINK
                           00110B  3109 LINK = . 
      00918B 47                    3110 	.byte      COMPO+7
      00918C 43 4F 4D 50 49 4C 45  3111         .ascii     "COMPILE"
      009193                       3112 COMPI:
      009193 CD 82 8F         [ 4] 3113         CALL     RFROM
      009196 CD 87 5F         [ 4] 3114         CALL     ONEP
      009199 CD 82 E5         [ 4] 3115         CALL     DUPP
      00919C CD 82 3E         [ 4] 3116         CALL     AT
      00919F CD 93 DF         [ 4] 3117         CALL     JSRC    ;compile subroutine
      0091A2 CD 87 34         [ 4] 3118         CALL     CELLP
      0091A5 CC 82 AE         [ 2] 3119         JP     TOR
                                   3120 
                                   3121 ;       LITERAL ( w -- )
                                   3122 ;       Compile tos to dictionary
                                   3123 ;       as an integer literal.
      0091A8 91 8B                 3124         .word      LINK
                           00112A  3125 LINK = . 
      0091AA 87                    3126 	.byte      IMEDD+7
      0091AB 4C 49 54 45 52 41 4C  3127         .ascii     "LITERAL"
      0091B2                       3128 LITER:
      0091B2 CD 91 93         [ 4] 3129         CALL     COMPI
      0091B5 CD 81 B6         [ 4] 3130         CALL     DOLIT
      0091B8 CC 91 4E         [ 2] 3131         JP     COMMA
                                   3132 
                                   3133 ;       $,"     ( -- )
                                   3134 ;       Compile a literal string
                                   3135 ;       up to next " .
      0091BB 91 AA                 3136         .word      LINK
                           00113D  3137 LINK = . 
      0091BD 03                    3138         .byte      3
      0091BE 24 2C 22              3139         .byte     '$',',','"'
      0091C1                       3140 STRCQ:
      0091C1 CD 81 B6         [ 4] 3141         CALL     DOLIT
      0091C4 00 22                 3142         .word     34	; "
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0091C6 CD 8D 8E         [ 4] 3143         CALL     PARSE
      0091C9 CD 88 80         [ 4] 3144         CALL     HERE
      0091CC CD 89 41         [ 4] 3145         CALL     PACKS   ;string to code dictionary
      0091CF CD 88 69         [ 4] 3146         CALL     COUNT
      0091D2 CD 84 80         [ 4] 3147         CALL     PLUS    ;calculate aligned end of string
      0091D5 CD 84 0F         [ 4] 3148         CALL     CPP
      0091D8 CC 82 27         [ 2] 3149         JP     STORE
                                   3150 
                                   3151 ;; Structures
                                   3152 
                                   3153 ;       FOR     ( -- a )
                                   3154 ;       Start a FOR-NEXT loop
                                   3155 ;       structure in a colon definition.
      0091DB 91 BD                 3156         .word      LINK
                           00115D  3157 LINK = . 
      0091DD 83                    3158 	.byte      IMEDD+3
      0091DE 46 4F 52              3159         .ascii     "FOR"
      0091E1                       3160 FOR:
      0091E1 CD 91 93         [ 4] 3161         CALL     COMPI
      0091E4 CD 82 AE         [ 4] 3162         CALL     TOR
      0091E7 CC 88 80         [ 2] 3163         JP     HERE
                                   3164 
                                   3165 ;       NEXT    ( a -- )
                                   3166 ;       Terminate a FOR-NEXT loop.
      0091EA 91 DD                 3167         .word      LINK
                           00116C  3168 LINK = . 
      0091EC 84                    3169 	.byte      IMEDD+4
      0091ED 4E 45 58 54           3170         .ascii     "NEXT"
      0091F1                       3171 NEXT:
      0091F1 CD 91 93         [ 4] 3172         CALL     COMPI
      0091F4 CD 81 CA         [ 4] 3173         CALL     DONXT
      0091F7 CC 91 4E         [ 2] 3174         JP     COMMA
                                   3175 
                                   3176 ;       BEGIN   ( -- a )
                                   3177 ;       Start an infinite or
                                   3178 ;       indefinite loop structure.
      0091FA 91 EC                 3179         .word      LINK
                           00117C  3180 LINK = . 
      0091FC 85                    3181 	.byte      IMEDD+5
      0091FD 42 45 47 49 4E        3182         .ascii     "BEGIN"
      009202                       3183 BEGIN:
      009202 CC 88 80         [ 2] 3184         JP     HERE
                                   3185 
                                   3186 ;       UNTIL   ( a -- )
                                   3187 ;       Terminate a BEGIN-UNTIL
                                   3188 ;       indefinite loop structure.
      009205 91 FC                 3189         .word      LINK
                           001187  3190 LINK = . 
      009207 85                    3191 	.byte      IMEDD+5
      009208 55 4E 54 49 4C        3192         .ascii     "UNTIL"
      00920D                       3193 UNTIL:
      00920D CD 91 93         [ 4] 3194         CALL     COMPI
      009210 CD 81 E9         [ 4] 3195         CALL     QBRAN
      009213 CC 91 4E         [ 2] 3196         JP     COMMA
                                   3197 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   3198 ;       AGAIN   ( a -- )
                                   3199 ;       Terminate a BEGIN-AGAIN
                                   3200 ;       infinite loop structure.
      009216 92 07                 3201         .word      LINK
                           001198  3202 LINK = . 
      009218 85                    3203 	.byte      IMEDD+5
      009219 41 47 41 49 4E        3204         .ascii     "AGAIN"
      00921E                       3205 AGAIN:
      00921E CD 91 93         [ 4] 3206         CALL     COMPI
      009221 CD 82 00         [ 4] 3207         CALL     BRAN
      009224 CC 91 4E         [ 2] 3208         JP     COMMA
                                   3209 
                                   3210 ;       IF      ( -- A )
                                   3211 ;       Begin a conditional branch.
      009227 92 18                 3212         .word      LINK
                           0011A9  3213 LINK = . 
      009229 82                    3214 	.byte      IMEDD+2
      00922A 49 46                 3215         .ascii     "IF"
      00922C                       3216 IFF:
      00922C CD 91 93         [ 4] 3217         CALL     COMPI
      00922F CD 81 E9         [ 4] 3218         CALL     QBRAN
      009232 CD 88 80         [ 4] 3219         CALL     HERE
      009235 CD 87 93         [ 4] 3220         CALL     ZERO
      009238 CC 91 4E         [ 2] 3221         JP     COMMA
                                   3222 
                                   3223 ;       THEN        ( A -- )
                                   3224 ;       Terminate a conditional branch structure.
      00923B 92 29                 3225         .word      LINK
                           0011BD  3226 LINK = . 
      00923D 84                    3227 	.byte      IMEDD+4
      00923E 54 48 45 4E           3228         .ascii     "THEN"
      009242                       3229 THENN:
      009242 CD 88 80         [ 4] 3230         CALL     HERE
      009245 CD 82 F5         [ 4] 3231         CALL     SWAPP
      009248 CC 82 27         [ 2] 3232         JP     STORE
                                   3233 
                                   3234 ;       ELSE        ( A -- A )
                                   3235 ;       Start the false clause in an IF-ELSE-THEN structure.
      00924B 92 3D                 3236         .word      LINK
                           0011CD  3237 LINK = . 
      00924D 84                    3238 	.byte      IMEDD+4
      00924E 45 4C 53 45           3239         .ascii     "ELSE"
      009252                       3240 ELSEE:
      009252 CD 91 93         [ 4] 3241         CALL     COMPI
      009255 CD 82 00         [ 4] 3242         CALL     BRAN
      009258 CD 88 80         [ 4] 3243         CALL     HERE
      00925B CD 87 93         [ 4] 3244         CALL     ZERO
      00925E CD 91 4E         [ 4] 3245         CALL     COMMA
      009261 CD 82 F5         [ 4] 3246         CALL     SWAPP
      009264 CD 88 80         [ 4] 3247         CALL     HERE
      009267 CD 82 F5         [ 4] 3248         CALL     SWAPP
      00926A CC 82 27         [ 2] 3249         JP     STORE
                                   3250 
                                   3251 ;       AHEAD       ( -- A )
                                   3252 ;       Compile a forward branch instruction.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      00926D 92 4D                 3253         .word      LINK
                           0011EF  3254 LINK = . 
      00926F 85                    3255 	.byte      IMEDD+5
      009270 41 48 45 41 44        3256         .ascii     "AHEAD"
      009275                       3257 AHEAD:
      009275 CD 91 93         [ 4] 3258         CALL     COMPI
      009278 CD 82 00         [ 4] 3259         CALL     BRAN
      00927B CD 88 80         [ 4] 3260         CALL     HERE
      00927E CD 87 93         [ 4] 3261         CALL     ZERO
      009281 CC 91 4E         [ 2] 3262         JP     COMMA
                                   3263 
                                   3264 ;       WHILE       ( a -- A a )
                                   3265 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      009284 92 6F                 3266         .word      LINK
                           001206  3267 LINK = . 
      009286 85                    3268 	.byte      IMEDD+5
      009287 57 48 49 4C 45        3269         .ascii     "WHILE"
      00928C                       3270 WHILE:
      00928C CD 91 93         [ 4] 3271         CALL     COMPI
      00928F CD 81 E9         [ 4] 3272         CALL     QBRAN
      009292 CD 88 80         [ 4] 3273         CALL     HERE
      009295 CD 87 93         [ 4] 3274         CALL     ZERO
      009298 CD 91 4E         [ 4] 3275         CALL     COMMA
      00929B CC 82 F5         [ 2] 3276         JP     SWAPP
                                   3277 
                                   3278 ;       REPEAT      ( A a -- )
                                   3279 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      00929E 92 86                 3280         .word      LINK
                           001220  3281 LINK = . 
      0092A0 86                    3282         .byte      IMEDD+6
      0092A1 52 45 50 45 41 54     3283         .ascii     "REPEAT"
      0092A7                       3284 REPEA:
      0092A7 CD 91 93         [ 4] 3285         CALL     COMPI
      0092AA CD 82 00         [ 4] 3286         CALL     BRAN
      0092AD CD 91 4E         [ 4] 3287         CALL     COMMA
      0092B0 CD 88 80         [ 4] 3288         CALL     HERE
      0092B3 CD 82 F5         [ 4] 3289         CALL     SWAPP
      0092B6 CC 82 27         [ 2] 3290         JP     STORE
                                   3291 
                                   3292 ;       AFT         ( a -- a A )
                                   3293 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      0092B9 92 A0                 3294         .word      LINK
                           00123B  3295 LINK = . 
      0092BB 83                    3296 	.byte      IMEDD+3
      0092BC 41 46 54              3297         .ascii     "AFT"
      0092BF                       3298 AFT:
      0092BF CD 82 DB         [ 4] 3299         CALL     DROP
      0092C2 CD 92 75         [ 4] 3300         CALL     AHEAD
      0092C5 CD 88 80         [ 4] 3301         CALL     HERE
      0092C8 CC 82 F5         [ 2] 3302         JP     SWAPP
                                   3303 
                                   3304 ;       ABORT"      ( -- ; <string> )
                                   3305 ;       Conditional abort with an error message.
      0092CB 92 BB                 3306         .word      LINK
                           00124D  3307 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0092CD 86                    3308 	.byte      IMEDD+6
      0092CE 41 42 4F 52 54        3309         .ascii     "ABORT"
      0092D3 22                    3310         .byte      '"'
      0092D4                       3311 ABRTQ:
      0092D4 CD 91 93         [ 4] 3312         CALL     COMPI
      0092D7 CD 90 14         [ 4] 3313         CALL     ABORQ
      0092DA CC 91 C1         [ 2] 3314         JP     STRCQ
                                   3315 
                                   3316 ;       $"     ( -- ; <string> )
                                   3317 ;       Compile an inline string literal.
      0092DD 92 CD                 3318         .word      LINK
                           00125F  3319 LINK = . 
      0092DF 82                    3320 	.byte      IMEDD+2
      0092E0 24 22                 3321         .byte     '$','"'
      0092E2                       3322 STRQ:
      0092E2 CD 91 93         [ 4] 3323         CALL     COMPI
      0092E5 CD 8C 2E         [ 4] 3324         CALL     STRQP
      0092E8 CC 91 C1         [ 2] 3325         JP     STRCQ
                                   3326 
                                   3327 ;       ."          ( -- ; <string> )
                                   3328 ;       Compile an inline string literal to be typed out at run time.
      0092EB 92 DF                 3329         .word      LINK
                           00126D  3330 LINK = . 
      0092ED 82                    3331 	.byte      IMEDD+2
      0092EE 2E 22                 3332         .byte     '.','"'
      0092F0                       3333 DOTQ:
      0092F0 CD 91 93         [ 4] 3334         CALL     COMPI
      0092F3 CD 8C 38         [ 4] 3335         CALL     DOTQP
      0092F6 CC 91 C1         [ 2] 3336         JP     STRCQ
                                   3337 
                                   3338 ;; Name compiler
                                   3339 
                                   3340 ;       ?UNIQUE ( a -- a )
                                   3341 ;       Display a warning message
                                   3342 ;       if word already exists.
      0092F9 92 ED                 3343         .word      LINK
                           00127B  3344 LINK = . 
      0092FB 07                    3345         .byte      7
      0092FC 3F 55 4E 49 51 55 45  3346         .ascii     "?UNIQUE"
      009303                       3347 UNIQU:
      009303 CD 82 E5         [ 4] 3348         CALL     DUPP
      009306 CD 8F 08         [ 4] 3349         CALL     NAMEQ   ;?name exists
      009309 CD 81 E9         [ 4] 3350         CALL     QBRAN
      00930C 93 22                 3351         .word      UNIQ1
      00930E CD 8C 38         [ 4] 3352         CALL     DOTQP   ;redef are OK
      009311 07                    3353         .byte       7
      009312 20 72 65 44 65 66 20  3354         .ascii     " reDef "       
      009319 CD 83 0F         [ 4] 3355         CALL     OVER
      00931C CD 88 69         [ 4] 3356         CALL     COUNT
      00931F CD 8B DB         [ 4] 3357         CALL     TYPES   ;just in case
      009322 CC 82 DB         [ 2] 3358 UNIQ1:  JP     DROP
                                   3359 
                                   3360 ;       $,n     ( na -- )
                                   3361 ;       Build a new dictionary name
                                   3362 ;       using string at na.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      009325 92 FB                 3363         .word      LINK
                           0012A7  3364 LINK = . 
      009327 03                    3365         .byte      3
      009328 24 2C 6E              3366         .ascii     "$,n"
      00932B                       3367 SNAME:
      00932B CD 82 E5         [ 4] 3368         CALL     DUPP
      00932E CD 82 5C         [ 4] 3369         CALL     CAT     ;?null input
      009331 CD 81 E9         [ 4] 3370         CALL     QBRAN
      009334 93 61                 3371         .word      PNAM1
      009336 CD 93 03         [ 4] 3372         CALL     UNIQU   ;?redefinition
      009339 CD 82 E5         [ 4] 3373         CALL     DUPP
      00933C CD 88 69         [ 4] 3374         CALL     COUNT
      00933F CD 84 80         [ 4] 3375         CALL     PLUS
      009342 CD 84 0F         [ 4] 3376         CALL     CPP
      009345 CD 82 27         [ 4] 3377         CALL     STORE
      009348 CD 82 E5         [ 4] 3378         CALL     DUPP
      00934B CD 84 1F         [ 4] 3379         CALL     LAST
      00934E CD 82 27         [ 4] 3380         CALL     STORE   ;save na for vocabulary link
      009351 CD 87 43         [ 4] 3381         CALL     CELLM   ;link address
      009354 CD 84 01         [ 4] 3382         CALL     CNTXT
      009357 CD 82 3E         [ 4] 3383         CALL     AT
      00935A CD 82 F5         [ 4] 3384         CALL     SWAPP
      00935D CD 82 27         [ 4] 3385         CALL     STORE
      009360 81               [ 4] 3386         RET     ;save code pointer
      009361 CD 8C 2E         [ 4] 3387 PNAM1:  CALL     STRQP
      009364 05                    3388         .byte      5
      009365 20 6E 61 6D 65        3389         .ascii     " name" ;null input
      00936A CC 90 1C         [ 2] 3390         JP     ABOR1
                                   3391 
                                   3392 ;; FORTH compiler
                                   3393 
                                   3394 ;       $COMPILE        ( a -- )
                                   3395 ;       Compile next word to
                                   3396 ;       dictionary as a token or literal.
      00936D 93 27                 3397         .word      LINK
                           0012EF  3398 LINK = . 
      00936F 08                    3399         .byte      8
      009370 24 43 4F 4D 50 49 4C  3400         .ascii     "$COMPILE"
             45
      009378                       3401 SCOMP:
      009378 CD 8F 08         [ 4] 3402         CALL     NAMEQ
      00937B CD 84 2F         [ 4] 3403         CALL     QDUP    ;?defined
      00937E CD 81 E9         [ 4] 3404         CALL     QBRAN
      009381 93 99                 3405         .word      SCOM2
      009383 CD 82 3E         [ 4] 3406         CALL     AT
      009386 CD 81 B6         [ 4] 3407         CALL     DOLIT
      009389 80 00                 3408         .word     0x8000	;  IMEDD*256
      00938B CD 83 31         [ 4] 3409         CALL     ANDD    ;?immediate
      00938E CD 81 E9         [ 4] 3410         CALL     QBRAN
      009391 93 96                 3411         .word      SCOM1
      009393 CC 82 10         [ 2] 3412         JP     EXECU
      009396 CC 93 DF         [ 2] 3413 SCOM1:  JP     JSRC
      009399 CD 8A A6         [ 4] 3414 SCOM2:  CALL     NUMBQ   ;try to convert to number
      00939C CD 81 E9         [ 4] 3415         CALL     QBRAN
      00939F 90 1C                 3416         .word      ABOR1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0093A1 CC 91 B2         [ 2] 3417         JP     LITER
                                   3418 
                                   3419 ;       OVERT   ( -- )
                                   3420 ;       Link a new word into vocabulary.
      0093A4 93 6F                 3421         .word      LINK
                           001326  3422 LINK = . 
      0093A6 05                    3423         .byte      5
      0093A7 4F 56 45 52 54        3424         .ascii     "OVERT"
      0093AC                       3425 OVERT:
      0093AC CD 84 1F         [ 4] 3426         CALL     LAST
      0093AF CD 82 3E         [ 4] 3427         CALL     AT
      0093B2 CD 84 01         [ 4] 3428         CALL     CNTXT
      0093B5 CC 82 27         [ 2] 3429         JP     STORE
                                   3430 
                                   3431 ;       ;       ( -- )
                                   3432 ;       Terminate a colon definition.
      0093B8 93 A6                 3433         .word      LINK
                           00133A  3434 LINK = . 
      0093BA C1                    3435 	.byte      IMEDD+COMPO+1
      0093BB 3B                    3436         .ascii     ";"
      0093BC                       3437 SEMIS:
      0093BC CD 91 93         [ 4] 3438         CALL     COMPI
      0093BF CD 82 20         [ 4] 3439         CALL     EXIT
      0093C2 CD 90 7D         [ 4] 3440         CALL     LBRAC
      0093C5 CC 93 AC         [ 2] 3441         JP     OVERT
                                   3442 
                                   3443 ;       ]       ( -- )
                                   3444 ;       Start compiling words in
                                   3445 ;       input stream.
      0093C8 93 BA                 3446         .word      LINK
                           00134A  3447 LINK = . 
      0093CA 01                    3448         .byte      1
      0093CB 5D                    3449         .ascii     "]"
      0093CC                       3450 RBRAC:
      0093CC CD 81 B6         [ 4] 3451         CALL     DOLIT
      0093CF 93 78                 3452         .word      SCOMP
      0093D1 CD 83 DF         [ 4] 3453         CALL     TEVAL
      0093D4 CC 82 27         [ 2] 3454         JP     STORE
                                   3455 
                                   3456 ;       CALL,    ( ca -- )
                                   3457 ;       Compile a subroutine call.
      0093D7 93 CA                 3458         .word      LINK
                           001359  3459 LINK = . 
      0093D9 04                    3460         .byte      4
      0093DA 43 41 4C 4C 2C        3461         .ascii     "CALL,"
      0093DF                       3462 JSRC:
      0093DF CD 81 B6         [ 4] 3463         CALL     DOLIT
      0093E2 00 CD                 3464         .word     CALLL     ;CALL
      0093E4 CD 91 65         [ 4] 3465         CALL     CCOMMA
      0093E7 CC 91 4E         [ 2] 3466         JP     COMMA
                                   3467 
                                   3468 ;       :       ( -- ; <string> )
                                   3469 ;       Start a new colon definition
                                   3470 ;       using next word as its name.
      0093EA 93 D9                 3471         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                           00136C  3472 LINK = . 
      0093EC 01                    3473         .byte      1
      0093ED 3A                    3474         .ascii     ":"
      0093EE                       3475 COLON:
      0093EE CD 8E 0B         [ 4] 3476         CALL     TOKEN
      0093F1 CD 93 2B         [ 4] 3477         CALL     SNAME
      0093F4 CC 93 CC         [ 2] 3478         JP     RBRAC
                                   3479 
                                   3480 ;       IMMEDIATE       ( -- )
                                   3481 ;       Make last compiled word
                                   3482 ;       an immediate word.
      0093F7 93 EC                 3483         .word      LINK
                           001379  3484 LINK = . 
      0093F9 09                    3485         .byte      9
      0093FA 49 4D 4D 45 44 49 41  3486         .ascii     "IMMEDIATE"
             54 45
      009403                       3487 IMMED:
      009403 CD 81 B6         [ 4] 3488         CALL     DOLIT
      009406 80 00                 3489         .word     0x8000	;  IMEDD*256
      009408 CD 84 1F         [ 4] 3490         CALL     LAST
      00940B CD 82 3E         [ 4] 3491         CALL     AT
      00940E CD 82 3E         [ 4] 3492         CALL     AT
      009411 CD 83 45         [ 4] 3493         CALL     ORR
      009414 CD 84 1F         [ 4] 3494         CALL     LAST
      009417 CD 82 3E         [ 4] 3495         CALL     AT
      00941A CC 82 27         [ 2] 3496         JP     STORE
                                   3497 
                                   3498 ;; Defining words
                                   3499 
                                   3500 ;       CREATE  ( -- ; <string> )
                                   3501 ;       Compile a new array
                                   3502 ;       without allocating space.
      00941D 93 F9                 3503         .word      LINK
                           00139F  3504 LINK = . 
      00941F 06                    3505         .byte      6
      009420 43 52 45 41 54 45     3506         .ascii     "CREATE"
      009426                       3507 CREAT:
      009426 CD 8E 0B         [ 4] 3508         CALL     TOKEN
      009429 CD 93 2B         [ 4] 3509         CALL     SNAME
      00942C CD 93 AC         [ 4] 3510         CALL     OVERT
      00942F CD 91 93         [ 4] 3511         CALL     COMPI
      009432 CD 83 92         [ 4] 3512         CALL     DOVAR
      009435 81               [ 4] 3513         RET
                                   3514 
                                   3515 ;       VARIABLE        ( -- ; <string> )
                                   3516 ;       Compile a new variable
                                   3517 ;       initialized to 0.
      009436 94 1F                 3518         .word      LINK
                           0013B8  3519 LINK = . 
      009438 08                    3520         .byte      8
      009439 56 41 52 49 41 42 4C  3521         .ascii     "VARIABLE"
             45
      009441                       3522 VARIA:
      009441 CD 94 26         [ 4] 3523         CALL     CREAT
      009444 CD 87 93         [ 4] 3524         CALL     ZERO
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009447 CC 91 4E         [ 2] 3525         JP     COMMA
                                   3526 
                           000001  3527 .if PICATOUT_MOD
                                   3528 ;       CONSTANT  ( n -- ; <string> )
                                   3529 ;       Compile a new constant 
                                   3530 ;       n CONSTANT name 
      00944A 94 38                 3531         .word LINK 
                           0013CC  3532         LINK=. 
      00944C 08                    3533         .byte 8 
      00944D 43 4F 4E 53 54 41 4E  3534         .ascii "CONSTANT" 
             54
      009455                       3535 constant:          
      009455 CD 8E 0B         [ 4] 3536         CALL TOKEN
      009458 CD 93 2B         [ 4] 3537         CALL SNAME 
      00945B CD 93 AC         [ 4] 3538         CALL OVERT 
      00945E CD 91 93         [ 4] 3539         CALL COMPI 
      009461 CD 94 72         [ 4] 3540         CALL DOCONST
      009464 CD 91 4E         [ 4] 3541         CALL COMMA 
      009467 81               [ 4] 3542         RET          
                                   3543 
                                   3544 ; CONSTANT runtime semantic 
                                   3545 ; doCONST  ( -- n )
      009468 94 4C                 3546         .word LINK 
                           0013EA  3547         LINK=.
      00946A 07                    3548         .byte 7
      00946B 44 4F 43 4F 4E 53 54  3549         .ascii "DOCONST"
      009472                       3550 DOCONST:
      009472 1D 00 02         [ 2] 3551         subw x,#CELLL
      009475 90 85            [ 2] 3552         popw y 
      009477 90 FE            [ 2] 3553         ldw y,(y) 
      009479 FF               [ 2] 3554         ldw (x),y 
      00947A 81               [ 4] 3555         ret 
                                   3556 .endif ;PICATOUT_MOD
                                   3557 
                                   3558 
                                   3559 ;; Tools
                                   3560 
                                   3561 ;       _TYPE   ( b u -- )
                                   3562 ;       Display a string. Filter
                                   3563 ;       non-printing characters.
      00947B 94 6A                 3564         .word      LINK
                           0013FD  3565 LINK = . 
      00947D 05                    3566         .byte      5
      00947E 5F 54 59 50 45        3567         .ascii     "_TYPE"
      009483                       3568 UTYPE:
      009483 CD 82 AE         [ 4] 3569         CALL     TOR     ;start count down loop
      009486 20 0F            [ 2] 3570         JRA     UTYP2   ;skip first pass
      009488 CD 82 E5         [ 4] 3571 UTYP1:  CALL     DUPP
      00948B CD 82 5C         [ 4] 3572         CALL     CAT
      00948E CD 87 BD         [ 4] 3573         CALL     TCHAR
      009491 CD 81 A0         [ 4] 3574         CALL     EMIT    ;display only printable
      009494 CD 87 5F         [ 4] 3575         CALL     ONEP    ;increment address
      009497 CD 81 CA         [ 4] 3576 UTYP2:  CALL     DONXT
      00949A 94 88                 3577         .word      UTYP1   ;loop till done
      00949C CC 82 DB         [ 2] 3578         JP     DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   3579 
                                   3580 ;       dm+     ( a u -- a )
                                   3581 ;       Dump u bytes from ,
                                   3582 ;       leaving a+u on  stack.
      00949F 94 7D                 3583         .word      LINK
                           001421  3584 LINK = . 
      0094A1 03                    3585         .byte      3
      0094A2 64 6D 2B              3586         .ascii     "dm+"
      0094A5                       3587 DUMPP:
      0094A5 CD 83 0F         [ 4] 3588         CALL     OVER
      0094A8 CD 81 B6         [ 4] 3589         CALL     DOLIT
      0094AB 00 04                 3590         .word      4
      0094AD CD 8C 61         [ 4] 3591         CALL     UDOTR   ;display address
      0094B0 CD 8B B1         [ 4] 3592         CALL     SPACE
      0094B3 CD 82 AE         [ 4] 3593         CALL     TOR     ;start count down loop
      0094B6 20 11            [ 2] 3594         JRA     PDUM2   ;skip first pass
      0094B8 CD 82 E5         [ 4] 3595 PDUM1:  CALL     DUPP
      0094BB CD 82 5C         [ 4] 3596         CALL     CAT
      0094BE CD 81 B6         [ 4] 3597         CALL     DOLIT
      0094C1 00 03                 3598         .word      3
      0094C3 CD 8C 61         [ 4] 3599         CALL     UDOTR   ;display numeric data
      0094C6 CD 87 5F         [ 4] 3600         CALL     ONEP    ;increment address
      0094C9 CD 81 CA         [ 4] 3601 PDUM2:  CALL     DONXT
      0094CC 94 B8                 3602         .word      PDUM1   ;loop till done
      0094CE 81               [ 4] 3603         RET
                                   3604 
                                   3605 ;       DUMP    ( a u -- )
                                   3606 ;       Dump u bytes from a,
                                   3607 ;       in a formatted manner.
      0094CF 94 A1                 3608         .word      LINK
                           001451  3609 LINK = . 
      0094D1 04                    3610         .byte      4
      0094D2 44 55 4D 50           3611         .ascii     "DUMP"
      0094D6                       3612 DUMP:
      0094D6 CD 83 A0         [ 4] 3613         CALL     BASE
      0094D9 CD 82 3E         [ 4] 3614         CALL     AT
      0094DC CD 82 AE         [ 4] 3615         CALL     TOR
      0094DF CD 8A 39         [ 4] 3616         CALL     HEX     ;save radix, set hex
      0094E2 CD 81 B6         [ 4] 3617         CALL     DOLIT
      0094E5 00 10                 3618         .word      16
      0094E7 CD 86 85         [ 4] 3619         CALL     SLASH   ;change count to lines
      0094EA CD 82 AE         [ 4] 3620         CALL     TOR     ;start count down loop
      0094ED CD 8B F9         [ 4] 3621 DUMP1:  CALL     CR
      0094F0 CD 81 B6         [ 4] 3622         CALL     DOLIT
      0094F3 00 10                 3623         .word      16
      0094F5 CD 84 6B         [ 4] 3624         CALL     DDUP
      0094F8 CD 94 A5         [ 4] 3625         CALL     DUMPP   ;display numeric
      0094FB CD 84 40         [ 4] 3626         CALL     ROT
      0094FE CD 84 40         [ 4] 3627         CALL     ROT
      009501 CD 8B B1         [ 4] 3628         CALL     SPACE
      009504 CD 8B B1         [ 4] 3629         CALL     SPACE
      009507 CD 94 83         [ 4] 3630         CALL     UTYPE   ;display printable characters
      00950A CD 81 CA         [ 4] 3631         CALL     DONXT
      00950D 94 ED                 3632         .word      DUMP1   ;loop till done
      00950F CD 82 DB         [ 4] 3633 DUMP3:  CALL     DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009512 CD 82 8F         [ 4] 3634         CALL     RFROM
      009515 CD 83 A0         [ 4] 3635         CALL     BASE
      009518 CC 82 27         [ 2] 3636         JP     STORE   ;restore radix
                                   3637 
                                   3638 ;       .S      ( ... -- ... )
                                   3639 ;        Display  contents of stack.
      00951B 94 D1                 3640         .word      LINK
                           00149D  3641 LINK = . 
      00951D 02                    3642         .byte      2
      00951E 2E 53                 3643         .ascii     ".S"
      009520                       3644 DOTS:
      009520 CD 8B F9         [ 4] 3645         CALL     CR
      009523 CD 87 D6         [ 4] 3646         CALL     DEPTH   ;stack depth
      009526 CD 82 AE         [ 4] 3647         CALL     TOR     ;start count down loop
      009529 20 0C            [ 2] 3648         JRA     DOTS2   ;skip first pass
      00952B CD 82 A2         [ 4] 3649 DOTS1:  CALL     RAT
      00952E CD 87 5F         [ 4] 3650         CALL ONEP
      009531 CD 87 ED         [ 4] 3651 	CALL     PICK
      009534 CD 8C 94         [ 4] 3652         CALL     DOT     ;index stack, display contents
      009537 CD 81 CA         [ 4] 3653 DOTS2:  CALL     DONXT
      00953A 95 2B                 3654         .word      DOTS1   ;loop till done
      00953C CD 8C 38         [ 4] 3655         CALL     DOTQP
      00953F 05                    3656         .byte      5
      009540 20 3C 73 70 20        3657         .ascii     " <sp "
      009545 81               [ 4] 3658         RET
                                   3659 
                                   3660 ;       >NAME   ( ca -- na | F )
                                   3661 ;       Convert code address
                                   3662 ;       to a name address.
      009546 95 1D                 3663         .word      LINK
                           0014C8  3664 LINK = . 
      009548 05                    3665         .byte      5
      009549 3E 4E 41 4D 45        3666         .ascii     ">NAME"
      00954E                       3667 TNAME:
      00954E CD 84 01         [ 4] 3668         CALL     CNTXT   ;vocabulary link
      009551 CD 82 3E         [ 4] 3669 TNAM2:  CALL     AT
      009554 CD 82 E5         [ 4] 3670         CALL     DUPP    ;?last word in a vocabulary
      009557 CD 81 E9         [ 4] 3671         CALL     QBRAN
      00955A 95 75                 3672         .word      TNAM4
      00955C CD 84 6B         [ 4] 3673         CALL     DDUP
      00955F CD 8E 19         [ 4] 3674         CALL     NAMET
      009562 CD 83 5A         [ 4] 3675         CALL     XORR    ;compare
      009565 CD 81 E9         [ 4] 3676         CALL     QBRAN
      009568 95 6F                 3677         .word      TNAM3
      00956A CD 87 43         [ 4] 3678         CALL     CELLM   ;continue with next word
      00956D 20 E2            [ 2] 3679         JRA     TNAM2
      00956F CD 82 F5         [ 4] 3680 TNAM3:  CALL     SWAPP
      009572 CC 82 DB         [ 2] 3681         JP     DROP
      009575 CD 84 60         [ 4] 3682 TNAM4:  CALL     DDROP
      009578 CC 87 93         [ 2] 3683         JP     ZERO
                                   3684 
                                   3685 ;       .ID     ( na -- )
                                   3686 ;        Display  name at address.
      00957B 95 48                 3687         .word      LINK
                           0014FD  3688 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      00957D 03                    3689         .byte      3
      00957E 2E 49 44              3690         .ascii     ".ID"
      009581                       3691 DOTID:
      009581 CD 84 2F         [ 4] 3692         CALL     QDUP    ;if zero no name
      009584 CD 81 E9         [ 4] 3693         CALL     QBRAN
      009587 95 97                 3694         .word      DOTI1
      009589 CD 88 69         [ 4] 3695         CALL     COUNT
      00958C CD 81 B6         [ 4] 3696         CALL     DOLIT
      00958F 00 1F                 3697         .word      0x1F
      009591 CD 83 31         [ 4] 3698         CALL     ANDD    ;mask lexicon bits
      009594 CC 94 83         [ 2] 3699         JP     UTYPE
      009597 CD 8C 38         [ 4] 3700 DOTI1:  CALL     DOTQP
      00959A 09                    3701         .byte      9
      00959B 20 6E 6F 4E 61 6D 65  3702         .ascii     " noName"
      0095A2 81               [ 4] 3703         RET
                                   3704 
                           000000  3705 WANT_SEE=0 
                           000000  3706 .if WANT_SEE 
                                   3707 ;       SEE     ( -- ; <string> )
                                   3708 ;       A simple decompiler.
                                   3709 ;       Updated for byte machines.
                                   3710         .word      LINK
                                   3711 LINK = . 
                                   3712         .byte      3
                                   3713         .ascii     "SEE"
                                   3714 SEE:
                                   3715         CALL     TICK    ;starting address
                                   3716         CALL     CR
                                   3717         CALL     ONEM
                                   3718 SEE1:   CALL     ONEP
                                   3719         CALL     DUPP
                                   3720         CALL     AT
                                   3721         CALL     DUPP    ;?does it contain a zero
                                   3722         CALL     QBRAN
                                   3723         .word    SEE2
                                   3724         CALL     TNAME   ;?is it a name
                                   3725 SEE2:   CALL     QDUP    ;name address or zero
                                   3726         CALL     QBRAN
                                   3727         .word    SEE3
                                   3728         CALL     SPACE
                                   3729         CALL     DOTID   ;display name
                                   3730         CALL     ONEP
                                   3731         JRA      SEE4
                                   3732 SEE3:   CALL     DUPP
                                   3733         CALL     CAT
                                   3734         CALL     UDOT    ;display number
                                   3735 SEE4:   CALL     NUFQ    ;user control
                                   3736         CALL     QBRAN
                                   3737         .word    SEE1
                                   3738         JP     DROP
                                   3739 .endif ; WANT_SEE 
                                   3740 
                                   3741 ;       WORDS   ( -- )
                                   3742 ;       Display names in vocabulary.
      0095A3 95 7D                 3743         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                           001525  3744 LINK = . 
      0095A5 05                    3745         .byte      5
      0095A6 57 4F 52 44 53        3746         .ascii     "WORDS"
      0095AB                       3747 WORDS:
      0095AB CD 8B F9         [ 4] 3748         CALL     CR
      0095AE CD 84 01         [ 4] 3749         CALL     CNTXT   ;only in context
      0095B1 CD 82 3E         [ 4] 3750 WORS1:  CALL     AT
      0095B4 CD 84 2F         [ 4] 3751         CALL     QDUP    ;?at end of list
      0095B7 CD 81 E9         [ 4] 3752         CALL     QBRAN
      0095BA 95 D0                 3753         .word      WORS2
      0095BC CD 82 E5         [ 4] 3754         CALL     DUPP
      0095BF CD 8B B1         [ 4] 3755         CALL     SPACE
      0095C2 CD 95 81         [ 4] 3756         CALL     DOTID   ;display a name
      0095C5 CD 87 43         [ 4] 3757         CALL     CELLM
      0095C8 CD 82 00         [ 4] 3758         CALL     BRAN
      0095CB 95 B1                 3759         .word      WORS1
      0095CD CD 82 DB         [ 4] 3760         CALL     DROP
      0095D0 81               [ 4] 3761 WORS2:  RET
                                   3762 
                                   3763         
                                   3764 ;; Hardware reset
                                   3765 
                                   3766 ;       hi      ( -- )
                                   3767 ;       Display sign-on message.
      0095D1 95 A5                 3768         .word      LINK
                           001553  3769 LINK = . 
      0095D3 02                    3770         .byte      2
      0095D4 68 69                 3771         .ascii     "hi"
      0095D6                       3772 HI:
      0095D6 CD 8B F9         [ 4] 3773         CALL     CR
      0095D9 CD 8C 38         [ 4] 3774         CALL     DOTQP   ;initialize I/O
      0095DC 0F                    3775         .byte      15
      0095DD 73 74 6D 38 65 46 6F  3776         .ascii     "stm8eForth v"
             72 74 68 20 76
      0095E9 32                    3777 	.byte      VER+'0'
      0095EA 2E                    3778         .byte      '.' 
      0095EB 31                    3779 	.byte      EXT+'0' ;version
      0095EC CC 8B F9         [ 2] 3780         JP     CR
                                   3781 
                           000000  3782 WANT_DEBUG=0
                           000000  3783 .if WANT_DEBUG 
                                   3784 ;       DEBUG      ( -- )
                                   3785 ;       Display sign-on message.
                                   3786 ;        .word      LINK
                                   3787 LINK = . 
                                   3788         .byte      5
                                   3789         .ascii     "DEBUG"
                                   3790 DEBUG:
                                   3791 	CALL DOLIT
                                   3792 	.word 0x65
                                   3793 	CALL EMIT
                                   3794 	CALL DOLIT
                                   3795 	.word 0
                                   3796  	CALL ZLESS 
                                   3797 	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3798 	.word 0xFFFE
                                   3799 	CALL ZLESS 
                                   3800 	CALL UPLUS 
                                   3801  	CALL DROP 
                                   3802 	CALL DOLIT
                                   3803 	.word 3
                                   3804 	CALL UPLUS 
                                   3805 	CALL UPLUS 
                                   3806  	CALL DROP
                                   3807 	CALL DOLIT
                                   3808 	.word 0x43
                                   3809 	CALL UPLUS 
                                   3810  	CALL DROP
                                   3811 	CALL EMIT
                                   3812 	CALL DOLIT
                                   3813 	.word 0x4F
                                   3814 	CALL DOLIT
                                   3815 	.word 0x6F
                                   3816  	CALL XORR
                                   3817 	CALL DOLIT
                                   3818 	.word 0xF0
                                   3819  	CALL ANDD
                                   3820 	CALL DOLIT
                                   3821 	.word 0x4F
                                   3822  	CALL ORR
                                   3823 	CALL EMIT
                                   3824 	CALL DOLIT
                                   3825 	.word 8
                                   3826 	CALL DOLIT
                                   3827 	.word 6
                                   3828  	CALL SWAPP
                                   3829 	CALL OVER
                                   3830 	CALL XORR
                                   3831 	CALL DOLIT
                                   3832 	.word 3
                                   3833 	CALL ANDD 
                                   3834 	CALL ANDD
                                   3835 	CALL DOLIT
                                   3836 	.word 0x70
                                   3837 	CALL UPLUS 
                                   3838 	CALL DROP
                                   3839 	CALL EMIT
                                   3840 	CALL DOLIT
                                   3841 	.word 0
                                   3842 	CALL QBRAN
                                   3843 	.word DEBUG1
                                   3844 	CALL DOLIT
                                   3845 	.word 0x3F
                                   3846 DEBUG1:
                                   3847 	CALL DOLIT
                                   3848 	.word 0xFFFF
                                   3849 	CALL QBRAN
                                   3850 	.word DEBUG2
                                   3851 	CALL DOLIT
                                   3852 	.word 0x74
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3853 	CALL BRAN
                                   3854 	.word DEBUG3
                                   3855 DEBUG2:
                                   3856 	CALL DOLIT
                                   3857 	.word 0x21
                                   3858 DEBUG3:
                                   3859 	CALL EMIT
                                   3860 	CALL DOLIT
                                   3861 	.word 0x68
                                   3862 	CALL DOLIT
                                   3863 	.word 0x80
                                   3864 	CALL STORE
                                   3865 	CALL DOLIT
                                   3866 	.word 0x80
                                   3867 	CALL AT
                                   3868 	CALL EMIT
                                   3869 	CALL DOLIT
                                   3870 	.word 0x4D
                                   3871 	CALL TOR
                                   3872 	CALL RAT
                                   3873 	CALL RFROM
                                   3874 	CALL ANDD
                                   3875 	CALL EMIT
                                   3876 	CALL DOLIT
                                   3877 	.word 0x61
                                   3878 	CALL DOLIT
                                   3879 	.word 0xA
                                   3880 	CALL TOR
                                   3881 DEBUG4:
                                   3882 	CALL DOLIT
                                   3883 	.word 1
                                   3884 	CALL UPLUS 
                                   3885 	CALL DROP
                                   3886 	CALL DONXT
                                   3887 	.word DEBUG4
                                   3888 	CALL EMIT
                                   3889 	CALL DOLIT
                                   3890 	.word 0x656D
                                   3891 	CALL DOLIT
                                   3892 	.word 0x100
                                   3893 	CALL UMSTA
                                   3894 	CALL SWAPP
                                   3895 	CALL DOLIT
                                   3896 	.word 0x100
                                   3897 	CALL UMSTA
                                   3898 	CALL SWAPP 
                                   3899 	CALL DROP
                                   3900 	CALL EMIT
                                   3901 	CALL EMIT
                                   3902 	CALL DOLIT
                                   3903 	.word 0x2043
                                   3904 	CALL DOLIT
                                   3905 	.word 0
                                   3906 	CALL DOLIT
                                   3907 	.word 0x100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3908 	CALL UMMOD
                                   3909 	CALL EMIT
                                   3910 	CALL EMIT
                                   3911 	;JP ORIG
                                   3912 	RET
                                   3913 .endif ; WANT_DEBUG 
                                   3914 
                                   3915 
                                   3916 ;       'BOOT   ( -- a )
                                   3917 ;       The application startup vector.
      0095EF 95 D3                 3918         .word      LINK
                           001571  3919 LINK = . 
      0095F1 05                    3920         .byte      5
      0095F2 27 42 4F 4F 54        3921         .ascii     "'BOOT"
      0095F7                       3922 TBOOT:
      0095F7 CD 83 92         [ 4] 3923         CALL     DOVAR
      0095FA 95 D6                 3924         .word      HI       ;application to boot
                                   3925 
                                   3926 ;       COLD    ( -- )
                                   3927 ;       The hilevel cold start s=ence.
      0095FC 95 F1                 3928         .word      LINK
                           00157E  3929 LINK = . 
      0095FE 04                    3930         .byte      4
      0095FF 43 4F 4C 44           3931         .ascii     "COLD"
      009603                       3932 COLD:
                           000000  3933 .if WANT_DEBUG
                                   3934         CALL DEBUG
                                   3935 .endif 
      009603 CD 81 B6         [ 4] 3936 COLD1:  CALL     DOLIT
      009606 80 A7                 3937         .word      UZERO
      009608 CD 81 B6         [ 4] 3938 	CALL     DOLIT
      00960B 00 06                 3939         .word      UPP
      00960D CD 81 B6         [ 4] 3940         CALL     DOLIT
      009610 00 14                 3941 	.word      UEND-UZERO
      009612 CD 88 CD         [ 4] 3942         CALL     CMOVE   ;initialize user area
                                   3943 
                           000001  3944 .if PICATOUT_MOD
                                   3945 ; update LAST with APP_LAST 
                                   3946 ; if APP_LAST > LAST else do the opposite
      009615 90 CE 40 00      [ 2] 3947         ldw y,APP_LAST 
      009619 90 B3 18         [ 2] 3948         cpw y,ULAST 
      00961C 22 0E            [ 1] 3949         jrugt 1$ 
                                   3950 ; save LAST at APP_LAST  
      00961E CD 84 1F         [ 4] 3951         call LAST 
      009621 CD 82 3E         [ 4] 3952         call AT  
      009624 CD 96 A5         [ 4] 3953         call eeprom 
      009627 CD 97 E2         [ 4] 3954         call ee_store 
      00962A 20 03            [ 2] 3955         jra 2$
      00962C                       3956 1$: ; update LAST with APP_LAST 
      00962C 90 BF 18         [ 2] 3957         ldw ULAST,y
      00962F                       3958 2$:  
                                   3959 ; update APP_HERE if < app_space 
      00962F 90 CE 40 04      [ 2] 3960         ldw y,APP_HERE 
      009633 90 A3 9A 80      [ 2] 3961         cpw y,#app_space 
      009637 24 15            [ 1] 3962         jruge 3$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009639 1D 00 06         [ 2] 3963         subw x,#6 
      00963C 90 AE 9A 80      [ 2] 3964         ldw y,#app_space 
      009640 EF 04            [ 2] 3965         ldw (4,x),y 
      009642 90 AE 40 04      [ 2] 3966         ldw y,#APP_HERE 
      009646 EF 02            [ 2] 3967         ldw (2,x),y
      009648 90 5F            [ 1] 3968         clrw y 
      00964A FF               [ 2] 3969         ldw (x),y
      00964B CD 97 E2         [ 4] 3970         call ee_store 
      00964E                       3971 3$:
                                   3972 ; update UCP with VAR_APP 
                                   3973 ; if VAR_APP>UCP else do the opposite 
      00964E 90 CE 40 06      [ 2] 3974         ldw y,VAR_HERE 
      009652 90 B3 16         [ 2] 3975         cpw y,UCP 
      009655 22 17            [ 1] 3976         jrugt 4$
      009657 CD 84 0F         [ 4] 3977         call CPP 
      00965A CD 82 3E         [ 4] 3978         call AT 
      00965D 1D 00 04         [ 2] 3979         subw x,#2*CELLL 
      009660 90 AE 40 06      [ 2] 3980         ldw y,#VAR_HERE 
      009664 EF 02            [ 2] 3981         ldw (2,x),y 
      009666 90 5F            [ 1] 3982         clrw y 
      009668 FF               [ 2] 3983         ldw (x),y 
      009669 CD 97 E2         [ 4] 3984         call ee_store
      00966C 20 03            [ 2] 3985         jra 6$
      00966E                       3986 4$: ; update UCP with VAR_HERE 
      00966E 90 BF 16         [ 2] 3987         ldw UCP,y 
      009671                       3988 6$:      
                                   3989 .endif ; PICATOUT_MOD
      009671 CD 90 FC         [ 4] 3990         CALL     PRESE   ;initialize data stack and TIB
      009674 CD 95 F7         [ 4] 3991         CALL     TBOOT
      009677 CD 88 B6         [ 4] 3992         CALL     ATEXE   ;application boot
      00967A CD 93 AC         [ 4] 3993         CALL     OVERT
      00967D CC 91 19         [ 2] 3994         JP     QUIT    ;start interpretation
                                   3995 
                           000001  3996 .if PICATOUT_MOD
                                   3997         ; keep this include at end 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                   3998         .include "flash.asm"
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
      009680 95 FE                   34     .word LINK 
                           001602    35     LINK=.
      009682 03                      36     .byte 3 
      009683 46 50 21                37     .ascii "FP!"
      009686                         38 fptr_store:
      009686 90 93            [ 1]   39     ldw y,x
      009688 90 FE            [ 2]   40     ldw y,(y)
      00968A 90 9F            [ 1]   41     ld a,yl 
      00968C B7 02            [ 1]   42     ld farptr,a 
      00968E 1C 00 02         [ 2]   43     addw x,#CELLL 
      009691 90 93            [ 1]   44     ldw y,x 
      009693 90 FE            [ 2]   45     ldw y,(y)
      009695 90 BF 03         [ 2]   46     ldw ptr16,y
      009698 1C 00 02         [ 2]   47     addw x,#CELLL 
      00969B 81               [ 4]   48     ret 
                                     49 
                                     50 ;-----------------------------------
                                     51 ; return EEPROM base address 
                                     52 ; as a double 
                                     53 ;  EEPROM  ( -- ud )
                                     54 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      00969C 96 82                   55     .word LINK 
                           00161E    56 LINK=.
      00969E 06                      57     .byte 6 
      00969F 45 45 50 52 4F 4D       58     .ascii "EEPROM"
      0096A5                         59 eeprom: 
      0096A5 90 AE 40 00      [ 2]   60     ldw y,#EEPROM_BASE
      0096A9 1D 00 04         [ 2]   61     subw x,#2*CELLL 
      0096AC EF 02            [ 2]   62     ldw (2,x),y 
      0096AE 90 5F            [ 1]   63     clrw y 
      0096B0 FF               [ 2]   64     ldw (x),y 
      0096B1 81               [ 4]   65     ret
                                     66 
                                     67 ;----------------------------------
                                     68 ; fetch integer at address over 65535
                                     69 ;  F@   ( ud -- n )
                                     70 ;----------------------------------
      0096B2 96 9E                   71     .word LINK 
                           001634    72 LINK=.
      0096B4 02                      73     .byte 2
      0096B5 46 40                   74     .ascii "F@"
      0096B7                         75 farat:
      0096B7 CD 96 86         [ 4]   76     call fptr_store
      0096BA 92 BC 00 02      [ 5]   77     ldf a,[farptr]
      0096BE 1D 00 02         [ 2]   78     subw x,#CELLL 
      0096C1 F7               [ 1]   79     ld (x),a 
      0096C2 90 AE 00 01      [ 2]   80     ldw y,#1
      0096C6 91 AF 00 02      [ 1]   81     ldf a,([farptr],y)
      0096CA E7 01            [ 1]   82     ld (1,x),a
      0096CC 81               [ 4]   83     ret 
                                     84 
                                     85 ;-------------------------------------
                                     86 ; fetch C at address over 65535 
                                     87 ; FC@ ( ud -- c)
                                     88 ;-------------------------------------
      0096CD 96 B4                   89     .word LINK
                           00164F    90     LINK=.
      0096CF 03                      91     .byte 3 
      0096D0 46 43 40                92     .ascii "FC@" 
      0096D3                         93 farcat:
      0096D3 CD 96 86         [ 4]   94     call fptr_store 
      0096D6 92 BC 00 02      [ 5]   95     ldf a,[farptr]
      0096DA 1D 00 02         [ 2]   96     subw x,#CELLL 
      0096DD E7 01            [ 1]   97     ld (1,x),a 
      0096DF 7F               [ 1]   98     clr (x)
      0096E0 81               [ 4]   99     ret 
                                    100     
                                    101 ;----------------------------------
                                    102 ; unlock EEPROM/OPT for writing/erasing
                                    103 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    104 ;  UNLKEE   ( -- )
                                    105 ;----------------------------------
      0096E1 96 CF                  106     .word LINK 
                           001663   107 LINK=.
      0096E3 06                     108     .byte 6 
      0096E4 55 4E 4C 4B 45 45      109     .ascii "UNLKEE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0096EA                        110 unlock_eeprom:
      0096EA 35 00 50 5B      [ 1]  111 	mov FLASH_CR2,#0 
      0096EE 35 FF 50 5C      [ 1]  112 	mov FLASH_NCR2,#0xFF 
      0096F2 35 AE 50 64      [ 1]  113 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      0096F6 35 56 50 64      [ 1]  114     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      0096FA 72 07 50 5F FB   [ 2]  115 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      0096FF 81               [ 4]  116 	ret
                                    117 
                                    118 ;----------------------------------
                                    119 ; unlock FLASH for writing/erasing
                                    120 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    121 ; UNLKFL  ( -- )
                                    122 ;----------------------------------
      009700 96 E3                  123     .word LINK 
                           001682   124 LINK=. 
      009702 06                     125     .byte 6 
      009703 55 4E 4C 4B 46 4C      126     .ascii "UNLKFL"    
      009709                        127 unlock_flash:
      009709 35 00 50 5B      [ 1]  128 	mov FLASH_CR2,#0 
      00970D 35 FF 50 5C      [ 1]  129 	mov FLASH_NCR2,#0xFF 
      009711 35 56 50 62      [ 1]  130 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009715 35 AE 50 62      [ 1]  131 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009719 72 03 50 5F FB   [ 2]  132 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      00971E 81               [ 4]  133 	ret
                                    134 
                                    135 ;-----------------------------
                                    136 ; unlock FLASH or EEPROM 
                                    137 ; according to farptr address 
                                    138 ;  UNLOCK ( -- )
                                    139 ;-----------------------------
      00971F 97 02                  140 	.word LINK 
                           0016A1   141 	LINK=.
      009721 06                     142 	.byte 6
      009722 55 4E 4C 4F 43 4B      143 	.ascii "UNLOCK"
      009728                        144 unlock:
                                    145 ; put addr[15:0] in Y, for bounds check.
      009728 90 BE 03         [ 2]  146 	ldw y,ptr16   ; Y=addr15:0
                                    147 ; check addr[23:16], if <> 0 then it is extened flash memory
      00972B 3D 02            [ 1]  148 	tnz farptr 
      00972D 26 16            [ 1]  149 	jrne 4$
      00972F 90 A3 80 00      [ 2]  150     cpw y,#FLASH_BASE
      009733 24 10            [ 1]  151     jruge 4$
      009735 90 A3 40 00      [ 2]  152 	cpw y,#EEPROM_BASE  
      009739 25 0D            [ 1]  153     jrult 9$
      00973B 90 A3 48 7F      [ 2]  154 	cpw y,#OPTION_END 
      00973F 22 07            [ 1]  155 	jrugt 9$
      009741 CD 96 EA         [ 4]  156 	call unlock_eeprom
      009744 81               [ 4]  157 	ret 
      009745 CD 97 09         [ 4]  158 4$: call unlock_flash
      009748 81               [ 4]  159 9$: ret 
                                    160 
                                    161 ;-------------------------
                                    162 ; lock write access to 
                                    163 ; FLASH and EEPROM 
                                    164 ; LOCK ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                    165 ;-------------------------
      009749 97 21                  166 	.word LINK 
                           0016CB   167 	LINK=.
      00974B 04                     168 	.byte 4 
      00974C 4C 4F 43 4B            169 	.ascii "LOCK" 
      009750                        170 lock: 
      009750 72 13 50 5F      [ 1]  171 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009754 72 17 50 5F      [ 1]  172 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009758 81               [ 4]  173 	ret 
                                    174 
                                    175 ;-------------------------
                                    176 ; increment farptr 
                                    177 ; INC-FPTR ( -- )
                                    178 ;-------------------------
      009759 97 4B                  179 	.word LINK 
                           0016DB   180 	LINK=. 
      00975B 08                     181 	.byte 8 
      00975C 49 4E 43 2D 46 50 54   182 	.ascii "INC-FPTR" 
             52
      009764                        183 inc_fptr:
      009764 3C 04            [ 1]  184 	inc ptr8 
      009766 26 08            [ 1]  185 	jrne 1$
      009768 90 BE 02         [ 2]  186 	ldw y,farptr 
      00976B 90 5C            [ 2]  187 	incw y 
      00976D 90 BF 02         [ 2]  188 	ldw farptr,y 
      009770 81               [ 4]  189 1$: ret 
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
      009771 97 5B                  200 	.word LINK 
                           0016F3   201 	LINK=. 
      009773 07                     202 	.byte 7 
      009774 57 52 2D 42 59 54 45   203 	.ascii "WR-BYTE" 
                                    204 
      00977B                        205 write_byte:
      00977B 90 93            [ 1]  206 	ldw y,x 
      00977D 90 FE            [ 2]  207 	ldw y,(y)
      00977F 1C 00 02         [ 2]  208 	addw x,#CELLL 
      009782 90 9F            [ 1]  209 	ld a,yl
      009784 92 BD 00 02      [ 4]  210 	ldf [farptr],a
      009788 72 05 50 5F FB   [ 2]  211 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00978D 20 D5            [ 2]  212 	jra inc_fptr 
                                    213 
                                    214 
                                    215 
                                    216 ;---------------------------------------
                                    217 ; write a byte to FLASH or EEPROM/OPTION  
                                    218 ; EEC!  (c ud -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                    219 ;---------------------------------------
      00978F 97 73                  220     .word LINK 
                           001711   221 	LINK=.
      009791 04                     222     .byte 4 
      009792 45 45 43 21            223     .ascii "EEC!"
                                    224 	; local variables 
                           000001   225 	BTW = 1   ; byte to write offset on stack
                           000002   226     OPT = 2 
                           000002   227 	VSIZE = 2
      009796                        228 ee_cstore:
      009796 52 02            [ 2]  229 	sub sp,#VSIZE
      009798 CD 96 86         [ 4]  230     call fptr_store
      00979B E6 01            [ 1]  231 	ld a,(1,x)
      00979D 43               [ 1]  232 	cpl a 
      00979E 6B 01            [ 1]  233 	ld (BTW,sp),a ; byte to write 
      0097A0 0F 02            [ 1]  234 	clr (OPT,sp)  ; OPTION flag
      0097A2 CD 97 28         [ 4]  235 	call unlock 
                                    236 	; check if option
      0097A5 3D 02            [ 1]  237 	tnz farptr 
      0097A7 26 19            [ 1]  238 	jrne 2$
      0097A9 90 BE 03         [ 2]  239 	ldw y,ptr16 
      0097AC 90 A3 48 00      [ 2]  240 	cpw y,#OPTION_BASE
      0097B0 2B 10            [ 1]  241 	jrmi 2$
      0097B2 90 A3 48 80      [ 2]  242 	cpw y,#OPTION_END+1
      0097B6 2A 0A            [ 1]  243 	jrpl 2$
      0097B8 03 02            [ 1]  244 	cpl (OPT,sp)
                                    245 	; OPTION WRITE require this unlock 
      0097BA 72 1E 50 5B      [ 1]  246     bset FLASH_CR2,#FLASH_CR2_OPT
      0097BE 72 1F 50 5C      [ 1]  247     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0097C2                        248 2$: 
      0097C2 CD 97 7B         [ 4]  249 	call write_byte 	
      0097C5 0D 02            [ 1]  250 	tnz (OPT,sp)
      0097C7 27 0D            [ 1]  251 	jreq 3$ 
      0097C9 7B 01            [ 1]  252     ld a,(BTW,sp)
      0097CB 90 5F            [ 1]  253     clrw y
      0097CD 90 97            [ 1]  254 	ld yl,a 
      0097CF 1D 00 02         [ 2]  255 	subw x,#CELLL 
      0097D2 FF               [ 2]  256 	ldw (x),y 
      0097D3 CD 97 7B         [ 4]  257 	call write_byte
      0097D6                        258 3$: 
      0097D6 CD 97 50         [ 4]  259 	call lock 
      0097D9 5B 02            [ 2]  260 	addw sp,#VSIZE 
      0097DB 81               [ 4]  261     ret
                                    262 
                                    263 ;------------------------------
                                    264 ; write integer in FLASH|EEPROM
                                    265 ; EE! ( n ud -- )
                                    266 ;------------------------------
      0097DC 97 91                  267 	.word LINK 
                           00175E   268 	LINK=.
      0097DE 03                     269 	.byte 3 
      0097DF 45 45 21               270 	.ascii "EE!"
      0097E2                        271 ee_store:
      0097E2 CD 96 86         [ 4]  272 	call fptr_store 
      0097E5 CD 97 28         [ 4]  273 	call unlock 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0097E8 90 93            [ 1]  274 	ldw y,x 
      0097EA 90 FE            [ 2]  275 	ldw y,(y)
      0097EC 90 89            [ 2]  276 	pushw y 
      0097EE 90 5E            [ 1]  277 	swapw y 
      0097F0 FF               [ 2]  278 	ldw (x),y 
      0097F1 CD 97 7B         [ 4]  279 	call write_byte 
      0097F4 90 85            [ 2]  280 	popw y 
      0097F6 1D 00 02         [ 2]  281 	subw x,#CELLL
      0097F9 FF               [ 2]  282 	ldw (x),y 
      0097FA CD 97 7B         [ 4]  283 	call write_byte
      0097FD 72 13 50 5F      [ 1]  284 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009801 81               [ 4]  285 	ret 
                                    286 
                                    287 ;----------------------------
                                    288 ; Erase flash memory row 
                                    289 ; stm8s208 as 128 bytes rows
                                    290 ; ROW-ERASE ( ud -- )
                                    291 ;----------------------------
      009802 97 DE                  292 	.word LINK 
                           001784   293 	LINK=. 
      009804 09                     294 	.byte 9 
      009805 52 4F 57 2D 45 52 41   295 	.ascii "ROW-ERASE" 
             53 45
      00980E                        296 row_erase:
      00980E CD 96 86         [ 4]  297 	call fptr_store
                                    298 ;code must be execute from RAM 
                                    299 ;copy routine to PAD 
      009811 1D 00 02         [ 2]  300 	subw x,#CELLL 
      009814 90 AE 98 5B      [ 2]  301 	ldw y,#row_erase_proc
      009818 FF               [ 2]  302 	ldw (x),y 
      009819 CD 88 91         [ 4]  303 	call PAD 
      00981C 90 AE 98 82      [ 2]  304 	ldw y,#row_erase_proc_end 
      009820 72 A2 98 5B      [ 2]  305 	subw y,#row_erase_proc
      009824 1D 00 02         [ 2]  306 	subw x,#CELLL 
      009827 FF               [ 2]  307 	ldw (x),y 
      009828 CD 88 CD         [ 4]  308 	call CMOVE 
      00982B                        309 block_erase:
      00982B 90 BE 03         [ 2]  310 	ldw y,farptr+1
      00982E 90 A3 9A 80      [ 2]  311 	cpw y,#app_space 
      009832 2A 13            [ 1]  312 	jrpl erase_flash 
                                    313 ; erase eeprom block
      009834 90 A3 40 00      [ 2]  314 	cpw y,#EEPROM_BASE 
      009838 24 01            [ 1]  315 	jruge 1$
      00983A 81               [ 4]  316 	ret ; bad address 
      00983B 90 A3 47 FF      [ 2]  317 1$: cpw y,#EEPROM_END 
      00983F 23 01            [ 2]  318 	jrule 2$ 
      009841 81               [ 4]  319 	ret ; bad address 
      009842                        320 2$:	
      009842 CD 96 EA         [ 4]  321 	call unlock_eeprom 
      009845 20 03            [ 2]  322 	jra proceed_erase
                                    323 ; erase flash block:
      009847                        324 erase_flash:
      009847 CD 97 09         [ 4]  325 	call unlock_flash 
      00984A                        326 proceed_erase:
      00984A CD 88 91         [ 4]  327 	call PAD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      00984D 90 93            [ 1]  328 	ldw y,x
      00984F 90 FE            [ 2]  329 	ldw y,(y)
      009851 1C 00 02         [ 2]  330 	addw x,#CELLL  
      009854 90 FD            [ 4]  331 	call (y) 
      009856 72 17 50 5F      [ 1]  332 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      00985A 81               [ 4]  333 	ret 
                                    334 
                                    335 ; this routine is to be copied to PAD 
      00985B                        336 row_erase_proc:
      00985B 35 20 50 5B      [ 1]  337 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      00985F 35 DF 50 5C      [ 1]  338 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009863 4F               [ 1]  339 	clr a 
      009864 90 5F            [ 1]  340 	clrw y 
      009866 91 A7 00 02      [ 1]  341 	ldf ([farptr],y),a
      00986A 90 5C            [ 2]  342     incw y
      00986C 91 A7 00 02      [ 1]  343 	ldf ([farptr],y),a
      009870 90 5C            [ 2]  344     incw y
      009872 91 A7 00 02      [ 1]  345 	ldf ([farptr],y),a
      009876 90 5C            [ 2]  346     incw y
      009878 91 A7 00 02      [ 1]  347 	ldf ([farptr],y),a
      00987C 72 05 50 5F FB   [ 2]  348 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009881 81               [ 4]  349 	ret
      009882                        350 row_erase_proc_end:
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
      009882                        363 copy_buffer:
      009882 4B 80            [ 1]  364 	push #BLOCK_SIZE  
                                    365 ;enable block programming 
      009884 72 10 50 5B      [ 1]  366 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009888 72 11 50 5C      [ 1]  367 	bres FLASH_NCR2,#FLASH_CR2_PRG
      00988C 90 5F            [ 1]  368 	clrw y
      00988E F6               [ 1]  369 1$:	ld a,(x)
      00988F 91 A7 00 02      [ 1]  370 	ldf ([farptr],y),a
      009893 5C               [ 2]  371 	incw x 
      009894 90 5C            [ 2]  372 	incw y 
      009896 0A 01            [ 1]  373 	dec (BCNT,sp)
      009898 26 F4            [ 1]  374 	jrne 1$
                                    375 ; wait EOP bit 
      00989A 72 05 50 5F FB   [ 2]  376 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      00989F 84               [ 1]  377 	pop a ; remove BCNT from stack 
      0098A0 81               [ 4]  378 	ret 
      0098A1                        379 copy_buffer_end:
                                    380 
                                    381 ;-------------------------
                                    382 ; move program_row to RAM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                    383 ; in TIB 
                                    384 ;------------------------
      0098A1                        385 copy_prog_to_ram:
      0098A1 1D 00 06         [ 2]  386 	subw x,#6
      0098A4 90 AE 98 82      [ 2]  387 	ldw y,#copy_buffer 
      0098A8 EF 04            [ 2]  388 	ldw (4,x),y 
      0098AA 90 AE 17 00      [ 2]  389 	ldw y,#TIBBASE
      0098AE EF 02            [ 2]  390 	ldw (2,x),y 
      0098B0 90 AE 98 A1      [ 2]  391 	ldw y,#copy_buffer_end 
      0098B4 72 A2 98 82      [ 2]  392 	subw y,#copy_buffer  
      0098B8 FF               [ 2]  393 	ldw (x),y 
      0098B9 CD 88 CD         [ 4]  394 	call CMOVE 
      0098BC 81               [ 4]  395 	ret 
                                    396 
                                    397 
                                    398 ;-----------------------------
                                    399 ; write a row in FLASH/EEPROM 
                                    400 ; WR-ROW ( a ud -- )
                                    401 ; a -> address 128 byte buffer to write 
                                    402 ; ud ->  row address in FLASH|EEPROM 
                                    403 ;-----------------------------
      0098BD 98 04                  404 	.word LINK 
                           00183F   405 	LINK=.
      0098BF 06                     406 	.byte 6 
      0098C0 57 52 2D 52 4F 57      407 	.ascii "WR-ROW"
      0098C6                        408 write_row:
      0098C6 CD 96 86         [ 4]  409 	call fptr_store
                                    410 ; align to FLASH block 
      0098C9 A6 80            [ 1]  411 	ld a,#0x80 
      0098CB B4 04            [ 1]  412 	and a,ptr8 
      0098CD B7 04            [ 1]  413 	ld ptr8,a  
      0098CF CD 98 A1         [ 4]  414 	call copy_prog_to_ram
      0098D2 CD 97 28         [ 4]  415 	call unlock
      0098D5 90 93            [ 1]  416 	ldw y,x 
      0098D7 90 FE            [ 2]  417 	ldw y,(y)
      0098D9 1C 00 02         [ 2]  418 	addw x,#CELLL 
      0098DC 89               [ 2]  419 	pushw x 
      0098DD 93               [ 1]  420 	ldw x,y ; buffer address in x 
      0098DE CD 17 00         [ 4]  421 	call TIBBASE
      0098E1 CD 97 50         [ 4]  422 	call lock
      0098E4 85               [ 2]  423 	popw x 
      0098E5 81               [ 4]  424 	ret 
                                    425 
                                    426 ;-------------------------------------
                                    427 ; change value of OPTION register 
                                    428 ; SET-OPT (c n -- ) 
                                    429 ; c new value.
                                    430 ; n OPT  number {1..7}
                                    431 ;--------------------------------------
      0098E6 98 BF                  432 		.word LINK 
                           001868   433 		LINK=.
      0098E8 07                     434 		.byte 7 
      0098E9 53 45 54 2D 4F 50 54   435 		.ascii "SET-OPT" 
      0098F0                        436 set_option: 
      0098F0 90 93            [ 1]  437 		ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0098F2 90 FE            [ 2]  438 		ldw y,(y)
      0098F4 27 06            [ 1]  439 		jreq 1$
      0098F6 90 A3 00 07      [ 2]  440 		cpw y,#7 
      0098FA 23 04            [ 2]  441 		jrule 2$ 
                                    442 ; invalid OPTION number 		
      0098FC 1C 00 04         [ 2]  443 1$:		addw x,#2*CELLL
      0098FF 81               [ 4]  444 		ret
      009900 90 58            [ 2]  445 2$:		sllw y 
      009902 72 A9 47 FF      [ 2]  446 		addw y,#OPTION_BASE-1
      009906 FF               [ 2]  447 		ldw (x),y 
      009907 1D 00 02         [ 2]  448 		subw x,#CELLL 
      00990A 90 5F            [ 1]  449 		clrw y 
      00990C FF               [ 2]  450 		ldw (x),y 
      00990D CD 97 96         [ 4]  451 		call ee_cstore
      009910 81               [ 4]  452 		ret 
                                    453 
                                    454 
                                    455 
                                    456 ;--------------------------------------
                                    457 ; reset system to its original state 
                                    458 ; before any user modification
                                    459 ; PRISTINE ( -- )
                                    460 ;-------------------------------------
      009911 98 E8                  461 	.word LINK  
                           001893   462 	LINK=.
      009913 08                     463 	.byte 8 
      009914 50 52 49 53 54 49 4E   464 	.ascii "PRISTINE"
             45
      00991C                        465 pristine:
                                    466 ;;; erase EEPROM
      00991C CD 96 A5         [ 4]  467 	call eeprom 
      00991F CD 84 6B         [ 4]  468 1$:	call DDUP 
      009922 CD 98 0E         [ 4]  469 	call row_erase
      009925 90 93            [ 1]  470 	ldw y,x 
      009927 90 EE 02         [ 2]  471 	ldw y,(2,y)
      00992A 72 A9 00 80      [ 2]  472 	addw y,#BLOCK_SIZE
      00992E EF 02            [ 2]  473 	ldw (2,x),y
      009930 90 A3 48 00      [ 2]  474 	cpw y,#OPTION_BASE 
      009934 25 E9            [ 1]  475 	jrult 1$
                                    476 ;;; reset OPTION to default values
      009936 90 AE 00 01      [ 2]  477 	ldw y,#1 ; OPT1 
      00993A FF               [ 2]  478 2$:	ldw (x),y   
      00993B 90 5F            [ 1]  479 	clrw y 
      00993D EF 02            [ 2]  480 	ldw (2,x),y  ; ( 0 1 -- ) 
      00993F CD 84 6B         [ 4]  481 	call DDUP    ; ( 0 1 0 1 -- )  
      009942 CD 98 F0         [ 4]  482 	call set_option
      009945 90 93            [ 1]  483 	ldw y,x 
      009947 90 FE            [ 2]  484 	ldw y,(y)
      009949 90 5C            [ 2]  485 	incw y  ; next OPTION 
      00994B 90 A3 00 08      [ 2]  486 	cpw y,#8 
      00994F 25 E9            [ 1]  487 	jrult 2$
                                    488 ;;; erase first row of app_space 	
      009951 90 AE 9A 80      [ 2]  489 	ldw y,#app_space
      009955 EF 02            [ 2]  490 	ldw (2,x),y  
      009957 90 5F            [ 1]  491 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009959 FF               [ 2]  492 	ldw (x),y ; ( app_space 0 -- )
      00995A CD 98 0E         [ 4]  493 	call row_erase 
                                    494 ; reset interrupt vectors 
      00995D 1D 00 02         [ 2]  495 	subw x,#CELLL 
      009960 90 5F            [ 1]  496 	clrw y  
      009962 FF               [ 2]  497 4$:	ldw (x),y  ; ( n -- ) int# 
      009963 CD 82 E5         [ 4]  498 	call DUPP  
      009966 CD 99 83         [ 4]  499 	call reset_vector
      009969 90 93            [ 1]  500 	ldw y,x 
      00996B 90 FE            [ 2]  501 	ldw y,(y)
      00996D 90 5C            [ 2]  502 	incw y   ; next vector 
      00996F 90 A3 00 19      [ 2]  503 	cpw y,#25 
      009973 25 ED            [ 1]  504 	jrult 4$
      009975 CC 80 80         [ 2]  505 	jp NonHandledInterrupt ; reset MCU
                                    506 
                                    507 ;------------------------------
                                    508 ; reset an interrupt vector 
                                    509 ; to its initial value 
                                    510 ; i.e. NonHandledInterrupt
                                    511 ; RST-IVEC ( n -- )
                                    512 ;-----------------------------
      009978 99 13                  513 	.word LINK 
                           0018FA   514 	LINK=. 
      00997A 08                     515 	.byte 8 
      00997B 52 53 54 2D 49 56 45   516 	.ascii "RST-IVEC"
             43
      009983                        517 reset_vector:
      009983 90 93            [ 1]  518 	ldw y,x
      009985 1C 00 02         [ 2]  519 	addw x,#CELLL 
      009988 90 FE            [ 2]  520 	ldw y,(y)
      00998A 90 A3 00 17      [ 2]  521 	cpw y,#23 
      00998E 27 3A            [ 1]  522 	jreq 9$
      009990 90 A3 00 18      [ 2]  523 	cpw y,#24 ; last vector for stm8s208 
      009994 22 34            [ 1]  524 	jrugt 9$  
      009996 90 58            [ 2]  525 	sllw y 
      009998 90 58            [ 2]  526 	sllw y 
      00999A 72 A9 80 08      [ 2]  527 	addw y,#0x8008 ; irq0 address 
      00999E 90 BF 1C         [ 2]  528 	ldw YTEMP,y
      0099A1 1D 00 06         [ 2]  529 	subw x,#3*CELLL 
      0099A4 EF 02            [ 2]  530 	ldw (2,x),y 
      0099A6 90 5F            [ 1]  531 	clrw y
      0099A8 FF               [ 2]  532 	ldw (x),y 
      0099A9 A6 82            [ 1]  533 	ld a,#0x82 
      0099AB 90 95            [ 1]  534 	ld yh,a
      0099AD EF 04            [ 2]  535 	ldw (4,x),y
      0099AF CD 97 E2         [ 4]  536 	call ee_store
      0099B2 1D 00 06         [ 2]  537 	subw x,#3*CELLL
      0099B5 90 5F            [ 1]  538 	clrw y 
      0099B7 FF               [ 2]  539 	ldw (x),y 
      0099B8 90 AE 80 80      [ 2]  540 	ldw y,#NonHandledInterrupt
      0099BC EF 04            [ 2]  541 	ldw (4,x),y 
      0099BE 90 BE 1C         [ 2]  542 	ldw y,YTEMP  
      0099C1 72 A9 00 02      [ 2]  543 	addw y,#2
      0099C5 EF 02            [ 2]  544 	ldw (2,x),y 
      0099C7 CD 97 E2         [ 4]  545 	call ee_store
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      0099CA 81               [ 4]  546 9$:	ret 
                                    547 
                                    548 
                                    549 	
                                    550 ;------------------------------
                                    551 ; set interrupt vector 
                                    552 ; SET-IVEC ( ud n -- )
                                    553 ;  ud Handler address
                                    554 ;  n  vector # 0 .. 29 
                                    555 ;-----------------------------
      0099CB 99 7A                  556 	.word LINK
                           00194D   557 	LINK=.
      0099CD 08                     558 	.byte 8 
      0099CE 53 45 54 2D 49 56 45   559 	.ascii "SET-IVEC" 
             43
      0099D6                        560 set_vector:
      0099D6 90 93            [ 1]  561     ldw y,x 
      0099D8 1C 00 02         [ 2]  562 	addw x,#CELLL 
      0099DB 90 FE            [ 2]  563 	ldw y,(y) ; vector #
      0099DD 90 A3 00 18      [ 2]  564 	cpw y,#24 ; last vector for stm8s208  
      0099E1 23 04            [ 2]  565 	jrule 2$
      0099E3 1C 00 04         [ 2]  566 	addw x,#2*CELLL 
      0099E6 81               [ 4]  567 	ret
      0099E7 90 58            [ 2]  568 2$:	sllw y 
      0099E9 90 58            [ 2]  569 	sllw y 
      0099EB 72 A9 80 08      [ 2]  570 	addw y,#0X8008 ; IRQ0 vector address 
      0099EF 90 BF 1C         [ 2]  571 	ldw YTEMP,y ; vector address 
      0099F2 A6 82            [ 1]  572 	ld a,#0x82 
      0099F4 90 95            [ 1]  573 	ld yh,a 
      0099F6 E6 01            [ 1]  574 	ld a,(1,x) ; isr address bits 23..16 
      0099F8 90 97            [ 1]  575 	ld yl,a 
                                    576 ;  write 0x82 + most significant byte of int address	
      0099FA 1D 00 06         [ 2]  577 	subw x,#3*CELLL 
      0099FD EF 04            [ 2]  578 	ldw (4,x),y 
      0099FF 90 BE 1C         [ 2]  579 	ldw y,YTEMP
      009A02 EF 02            [ 2]  580 	ldw (2,x),y ; vector address 
      009A04 90 5F            [ 1]  581 	clrw y 
      009A06 FF               [ 2]  582 	ldw (x),y   ; as a double 
      009A07 CD 97 E2         [ 4]  583 	call ee_store 
      009A0A 90 93            [ 1]  584 	ldw y,x 
      009A0C 90 EE 02         [ 2]  585 	ldw y,(2,y) ; bits 15..0 int vector 
      009A0F 1D 00 06         [ 2]  586 	subw x,#3*CELLL 
      009A12 EF 04            [ 2]  587 	ldw (4,x),y 
      009A14 90 BE 1C         [ 2]  588 	ldw y,YTEMP 
      009A17 72 A9 00 02      [ 2]  589 	addw y,#2 
      009A1B EF 02            [ 2]  590 	ldw (2,x),y 
      009A1D 90 5F            [ 1]  591 	clrw y 
      009A1F FF               [ 2]  592 	ldw (x),y 
      009A20 CD 97 E2         [ 4]  593 	call ee_store 
      009A23 81               [ 4]  594 9$: ret 
                                    595 
                                    596 
                           000000   597 .if 0
                                    598 ;----------------------------
                                    599 ; transfert one or more définition 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                    600 ; from RAM to FLASH 
                                    601 ; USAGE: FLASH name 
                                    602 ; 'name' and all following are 
                                    603 ; transfered to FLASH memory 
                                    604 ; FLASH ( -- ; <string> )
                                    605 ;-----------------------------------
                                    606 	.word LINK 
                                    607 	LINK=. 
                                    608 	.byte 5 
                                    609 	.ascii "FLASH"
                                    610 flash_colon: 
                                    611     call TOKEN 
                                    612 	call SNAME 
                                    613 	call DROP	
                                    614 .endif 
                                    615 
                                    616 
                                    617 
                                    618 
                                    619 ; application code begin here
      009A80                        620 	.bndry 128 ; align on flash block  
      009A80                        621 app_space: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   3999 .endif ; PICATOUT_MOD
                                   4000 
                                   4001 ;===============================================================
                                   4002 
                           00194D  4003 LASTN =	LINK   ;last name defined
                                   4004 
                                   4005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000481 R   |   6 ABOR1      000F9C R
  6 ABOR2      000FB3 R   |   6 ABORQ      000F94 R   |   6 ABORT      000F85 R
  6 ABRTQ      001254 R   |   6 ABSS       000478 R   |   6 ACCEP      000F1B R
  6 ACCP1      000F24 R   |   6 ACCP2      000F4A R   |   6 ACCP3      000F4D R
  6 ACCP4      000F4F R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
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
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |   6 AFT        00123F R
  6 AGAIN      00119E R   |   6 AHEAD      0011F5 R   |   6 ALLOT      0010C4 R
  6 ANDD       0002B1 R   |     APP_HERE=  004004     |     APP_LAST=  004000 
    APP_RUN =  004002     |   6 AT         0001BE R   |   6 ATEXE      000836 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 BACK1      000EC3 R   |   6 BASE       000320 R   |     BASEE   =  00000A 
    BCNT    =  000001     |   6 BCOMP      001103 R   |   6 BDIGS      00091E R
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |   6 BEGIN      001182 R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |   6 BKSLA      000D5B R   |   6 BKSP       000E93 R
    BKSPP   =  000008     |   6 BLANK      000706 R   |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |   6 BRAN       000180 R
    BTW     =  000001     |     CALLL   =  0000CD     |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  000020 
  6 CAT        0001DC R   |   6 CCOMMA     0010E5 R   |     CC_C    =  000000 
    CC_H    =  000004     |     CC_I0   =  000003     |     CC_I1   =  000005 
    CC_N    =  000002     |     CC_V    =  000007     |     CC_Z    =  000001 
    CELLL   =  000002     |   6 CELLM      0006C3 R   |   6 CELLP      0006B4 R
  6 CELLS      0006D2 R   |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   6 CHAR1      000B4B R   |   6 CHAR2      000B4E R
    CLKOPT  =  004807     |     CLKOPT_C=  000002     |     CLKOPT_E=  000003 
    CLKOPT_P=  000000     |     CLKOPT_P=  000001     |     CLK_CCOR=  0050C9 
    CLK_CKDI=  0050C6     |     CLK_CKDI=  000000     |     CLK_CKDI=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
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
  6 CMOV1      000855 R   |   6 CMOV2      00086D R   |   6 CMOVE      00084D R
    CNTDWN  =  000028     |   6 CNTXT      000381 R   |   6 COLD       001583 R
  6 COLD1      001583 R   |   6 COLON      00136E R   |   6 COMMA      0010CE R
  6 COMPI      001113 R   |     COMPO   =  000040     |     CONVERT_=  000001 
  6 COUNT      0007E9 R   |   6 CPP        00038F R   |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |   6 CR         000B79 R   |   6 CREAT      0013A6 R
    CRR     =  00000D     |   6 CSTOR      0001CB R   |     CTOP    =  000080 
  6 DAT        0007C9 R   |     DATSTK  =  0016F0     |   6 DDROP      0003E0 R
  6 DDUP       0003EB R   |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  6 DECIM      0009CE R   |   6 DEPTH      000756 R   |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   6 DGTQ1      000A13 R   |   6 DIG        000947 R
  6 DIGIT      0008E2 R   |   6 DIGS       000958 R   |   6 DIGS1      000958 R
  6 DIGS2      000965 R   |   6 DIGTQ      0009E2 R   |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   6 DN1        000458 R   |   6 DNEGA      00043D R
  6 DOCONST    0013F2 R   |   6 DOLIT      000136 R   |   6 DONXT      00014A R
  6 DOSTR      000B8F R   |   6 DOT        000C14 R   |   6 DOT1       000C2A R
  6 DOTI1      001517 R   |   6 DOTID      001501 R   |   6 DOTO1      001028 R
  6 DOTOK      00100E R   |   6 DOTPR      000D3D R   |   6 DOTQ       001270 R
  6 DOTQP      000BB8 R   |   6 DOTR       000BC6 R   |   6 DOTS       0014A0 R
  6 DOTS1      0014AB R   |   6 DOTS2      0014B7 R   |   6 DOVAR      000312 R
  6 DROP       00025B R   |   6 DSTOR      0007A3 R   |   6 DUMP       001456 R
  6 DUMP1      00146D R   |   6 DUMP3      00148F R   |   6 DUMPP      001425 R
  6 DUPP       000265 R   |   6 EDIGS      000983 R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_S=  000800     |   6 ELSEE      0011D2 R
  6 EMIT       000120 R   |   6 EQ1        00049C R   |   6 EQUAL      000486 R
  6 ERASE      0008AF R   |     ERR     =  00001B     |   6 EVAL       001051 R
  6 EVAL1      001051 R   |   6 EVAL2      00106D R   |   6 EXE1       000844 R
  6 EXECU      000190 R   |   6 EXIT       0001A0 R   |     EXT     =  000001 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |   6 EXTRC      00090A R
    FHSE    =  7A1200     |     FHSI    =  F42400     |   6 FILL       00087C R
  6 FILL1      000899 R   |   6 FILL2      0008A2 R   |   6 FIND       000DEF R
  6 FIND1      000E0D R   |   6 FIND2      000E3B R   |   6 FIND3      000E47 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]

Symbol Table

  6 FIND4      000E5B R   |   6 FIND5      000E68 R   |   6 FIND6      000E4C R
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
    FLSI    =  01F400     |   6 FOR        001161 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  6 HERE       000800 R   |   6 HEX        0009B9 R   |   6 HI         001556 R
  6 HLD        00036E R   |   6 HOLD       00092E R   |     HSECNT  =  004809 
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
  6 IFF        0011AC R   |     IMEDD   =  000080     |   6 IMMED      001383 R
  6 INCH       000114 R   |   6 INN        00033E R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
  6 INTE1      000FF0 R   |   6 INTER      000FC6 R   |     INT_ADC2=  000016 
    INT_AUAR=  000012     |     INT_AWU =  000001     |     INT_CAN_=  000008 
    INT_CAN_=  000009     |     INT_CLK =  000002     |     INT_EXTI=  000003 
    INT_EXTI=  000004     |     INT_EXTI=  000005     |     INT_EXTI=  000006 
    INT_EXTI=  000007     |     INT_FLAS=  000018     |     INT_I2C =  000013 
    INT_SPI =  00000A     |     INT_TIM1=  00000C     |     INT_TIM1=  00000B 
    INT_TIM2=  00000E     |     INT_TIM2=  00000D     |     INT_TIM3=  000010 
    INT_TIM3=  00000F     |     INT_TIM4=  000017     |     INT_TLI =  000000 
    INT_UART=  000011     |     INT_UART=  000015     |     INT_UART=  000014 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
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
  6 INVER      00041A R   |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  6 JSRC       00135F R   |   6 KEY        000AF9 R   |   6 KTAP       000EE0 R
  6 KTAP1      000F03 R   |   6 KTAP2      000F06 R   |   6 LAST       00039F R
  6 LASTN   =  00194D R   |   6 LBRAC      000FFD R   |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |   6 LESS       0004C3 R
    LF      =  00000A     |   6 LINK    =  00194D R   |   6 LITER      001132 R
  6 LT1        0004D9 R   |     MASKK   =  001F7F     |   6 MAX        0004E3 R
  6 MAX1       0004F6 R   |   6 MIN        000500 R   |   6 MIN1       000513 R
  6 MMOD1      0005B6 R   |   6 MMOD2      0005CA R   |   6 MMOD3      0005E1 R
  6 MMSM1      00055D R   |   6 MMSM2      000571 R   |   6 MMSM3      000573 R
  6 MMSM4      00057B R   |   6 MODD       0005FB R   |   6 MONE       00072C R
    MS      =  000026     |   6 MSEC       0000A1 R   |   6 MSMOD      000599 R
  6 MSTA1      00068C R   |   6 MSTAR      000669 R   |     NAFR    =  004804 
  6 NAMEQ      000E88 R   |   6 NAMET      000D99 R   |     NCLKOPT =  004808 
  6 NEGAT      00042B R   |   6 NEX1       000157 R   |   6 NEXT       001171 R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   6 NTIB       00034E R   |     NUBC    =  004802 
  6 NUFQ       000B0F R   |   6 NUFQ1      000B28 R   |   6 NUMBQ      000A26 R
  6 NUMQ1      000A5A R   |   6 NUMQ2      000A8B R   |   6 NUMQ3      000ACD R
  6 NUMQ4      000AD2 R   |   6 NUMQ5      000AE1 R   |   6 NUMQ6      000AE4 R
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R
  6 ONE        00071E R   |   6 ONEM       0006EC R   |   6 ONEP       0006DF R
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   6 ORIG       00003D R   |   6 ORR        0002C5 R
  6 OUTPUT     000125 R   |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |   6 OVER       00028F R
  6 OVERT      00132C R   |     PA      =  000000     |   6 PACKS      0008C1 R
  6 PAD        000811 R   |   6 PAREN      000D4C R   |   6 PARS       000C45 R
  6 PARS1      000C70 R   |   6 PARS2      000C9B R   |   6 PARS3      000C9E R
  6 PARS4      000CA7 R   |   6 PARS5      000CCA R   |   6 PARS6      000CDF R
  6 PARS7      000CEE R   |   6 PARS8      000CFD R   |   6 PARSE      000D0E R
  6 PAUSE      0000B1 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]

Symbol Table

    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      001438 R   |   6 PDUM2      001449 R
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
  6 PICK       00076D R   |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   6 PLUS       000400 R   |   6 PNAM1      0012E1 R
  6 PRESE      00107C R   |     PROD1   =  00001A     |     PROD2   =  00001C 
    PROD3   =  00001E     |   6 PSTOR      000782 R   |   6 QBRAN      000169 R
  6 QDUP       0003AF R   |   6 QDUP1      0003B9 R   |   6 QKEY       000102 R
  6 QSTAC      001034 R   |   6 QUERY      000F60 R   |   6 QUEST      000C37 R
  6 QUIT       001099 R   |   6 QUIT1      0010A1 R   |   6 QUIT2      0010A4 R
    RAMBASE =  000000     |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   6 RAT        000222 R   |   6 RBRAC      00134C R
  6 REPEA      001227 R   |   6 RFROM      00020F R   |     ROP     =  004800 
  6 ROT        0003C0 R   |     RP0     =  000024     |   6 RPAT       0001EC R
    RPP     =  0017FF     |   6 RPSTO      0001F9 R   |     RST_SR  =  0050B3 
  6 SAME1      000DB7 R   |   6 SAME2      000DE0 R   |   6 SAMEQ      000DAF R
  6 SCOM1      001316 R   |   6 SCOM2      001319 R   |   6 SCOMP      0012F8 R
  6 SEMIS      00133C R   |     SFR_BASE=  005000     |     SFR_END =  0057FF 
  6 SIGN       00096D R   |   6 SIGN1      00097D R   |   6 SLASH      000605 R
  6 SLMOD      0005E9 R   |   6 SNAME      0012AB R   |     SP0     =  000022 
  6 SPACE      000B31 R   |   6 SPACS      000B40 R   |   6 SPAT       000245 R
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SPP     =  0016F0 
  6 SPSTO      000252 R   |   6 SSMOD      000695 R   |     STACK   =  0017FF 
  6 STAR       00065E R   |   6 STASL      0006A6 R   |   6 STORE      0001A7 R
  6 STR        00099B R   |   6 STRCQ      001141 R   |   6 STRQ       001262 R
  6 STRQP      000BAE R   |   6 SUBB       00045E R   |   6 SWAPP      000275 R
    SWIM_CSR=  007F80     |   6 TAP        000ECA R   |   6 TBOOT      001577 R
  6 TCHA1      00074D R   |   6 TCHAR      00073D R   |   6 TEMP       00032F R
  6 TEVAL      00035F R   |   6 THENN      0011C2 R   |   6 TIB        000822 R
    TIBB    =  001700     |     TIBBASE =  001700     |     TIC     =  000027 
  6 TICK       0010B0 R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
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
  6 TNAM2      0014D1 R   |   6 TNAM3      0014EF R   |   6 TNAM4      0014F5 R
  6 TNAME      0014CE R   |   6 TOKEN      000D8B R   |   6 TOR        00022E R
    TRUEE   =  00FFFF     |   6 TWOSL      0006F9 R   |   6 TYPE1      000B60 R
  6 TYPE2      000B6C R   |   6 TYPES      000B5B R   |   6 Timer4Ha   000005 R
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
    UD4     =  000004     |   6 UDOT       000C01 R   |   6 UDOTR      000BE1 R
  6 UEND       00003B R   |     UHLD    =  000012     |     UINN    =  00000A 
    UINTER  =  000010     |     ULAST   =  000018     |   6 ULES1      0004BB R
  6 ULESS      0004A5 R   |   6 UMMOD      00053B R   |   6 UMSTA      000614 R
  6 UNIQ1      0012A2 R   |   6 UNIQU      001283 R   |   6 UNTIL      00118D R
  6 UPL1       000306 R   |   6 UPLUS      0002EF R   |     UPP     =  000006 
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    UTIB    =  00000E     |     UTMP    =  000008     |   6 UTYP1      001408 R
  6 UTYP2      001417 R   |   6 UTYPE      001403 R   |   6 UZERO      000027 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]

Symbol Table

  6 VARIA      0013C1 R   |     VAR_HERE=  004006     |     VER     =  000002 
    VSIZE   =  000002     |     WANT_DEB=  000000     |     WANT_SEE=  000000 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |   6 WHILE      00120C R
  6 WITHI      000520 R   |   6 WORDD      000D77 R   |   6 WORDS      00152B R
  6 WORS1      001531 R   |   6 WORS2      001550 R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |   6 XORR       0002DA R   |     XTEMP   =  00001A 
    YTEMP   =  00001C     |   6 ZERO       000713 R   |   6 ZL1        0002A7 R
  6 ZLESS      00029E R   |   6 app_spac   001A00 R   |   6 block_er   0017AB R
  6 clear_ra   000019 R   |   6 clock_in   000058 R   |   6 constant   0013D5 R
  6 copy_buf   001802 R   |   6 copy_buf   001821 R   |   6 copy_pro   001821 R
    da      =  000002     |     db      =  000003     |     dc      =  000000 
    dd      =  000001     |   6 ee_cstor   001716 R   |   6 ee_store   001762 R
  6 eeprom     001625 R   |   6 erase_fl   0017C7 R   |   6 farat      001637 R
  6 farcat     001653 R   |     farptr  =  000002     |   6 fptr_sto   001606 R
  6 inc_fptr   0016E4 R   |   6 lock       0016D0 R   |   6 main       000016 R
  6 pristine   00189C R   |   6 proceed_   0017CA R   |     ptr16   =  000003 
    ptr8    =  000004     |   6 reboot     0000F8 R   |   6 reset_ve   001903 R
  6 row_eras   00178E R   |   6 row_eras   0017DB R   |   6 row_eras   001802 R
  6 set_opti   001870 R   |   6 set_vect   001956 R   |   6 uart1_in   00006A R
  6 unlock     0016A8 R   |   6 unlock_e   00166A R   |   6 unlock_f   001689 R
  6 write_by   0016FB R   |   6 write_ro   001846 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   1A00   flags    0

